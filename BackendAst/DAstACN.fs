﻿module DAstACN

open System
open System.Numerics
open System.IO

open FsUtils
open CommonTypes
open AcnGenericTypes
open Asn1AcnAst
open Asn1AcnAstUtilFunctions
open DAst
open DAstUtilFunctions
open System.Globalization
open Language

let foldMap = Asn1Fold.foldMap


let callBaseTypeFunc (lm:LanguageMacros) = lm.uper.call_base_type_func

let sparkAnnotations (lm:LanguageMacros)  = lm.acn.sparkAnnotations

let THREE_DOTS = {IcdRow.fieldName = ""; comments = []; sPresent="";sType= IcdPlainType ""; sConstraint=None; minLengthInBits = 0I; maxLengthInBits=0I;sUnits=None; rowType = IcdRowType.ThreeDOTs; idxOffset = None}

let getAcnDeterminantName (id : ReferenceToType) =
    match id with
    | ReferenceToType path ->
        match path with
        | (MD mdName)::(TA tasName)::(PRM prmName)::[]   -> ToC2 prmName
        | _ ->
            let longName = id.AcnAbsPath.Tail |> Seq.StrJoin "_"
            ToC2(longName.Replace("#","elem"))


let getDeterminantTypeDefinitionBodyWithinSeq (r:Asn1AcnAst.AstRoot) (lm:LanguageMacros) (det:Determinant) =
    let createPrmAcnInteger (r:Asn1AcnAst.AstRoot) (lm:LanguageMacros)  =
        let Declare_Integer     =  lm.typeDef.Declare_Integer
        Declare_Integer ()

    let createAcnInteger (r:Asn1AcnAst.AstRoot) (lm:LanguageMacros) (a:Asn1AcnAst.AcnInteger) =
        let intClass = getAcnIntegerClass r.args a
        let stgMacro = DAstTypeDefinition.getIntegerTypeByClass lm intClass
        stgMacro ()

    let createAcnBoolean (r:Asn1AcnAst.AstRoot) (lm:LanguageMacros) =
        lm.typeDef.Declare_Boolean ()

    let createAcnNull (r:Asn1AcnAst.AstRoot) (lm:LanguageMacros) =
        lm.typeDef.Declare_Null ()

    let getTypeDefinitionName (r:Asn1AcnAst.AstRoot) (lm:LanguageMacros) (id : ReferenceToType) =
        let longName = id.AcnAbsPath.Tail |> Seq.StrJoin "_"
        ToC2(r.args.TypePrefix + longName.Replace("#","elem"))

    match det with
    | AcnChildDeterminant       ch ->
        match ch.Type with
        | Asn1AcnAst.AcnInteger  a -> createAcnInteger r lm a
        | Asn1AcnAst.AcnNullType _ -> createAcnNull r lm
        | Asn1AcnAst.AcnBoolean  _ -> createAcnBoolean r lm
        | Asn1AcnAst.AcnReferenceToEnumerated a -> ToC2(r.args.TypePrefix + a.tasName.Value)
        | Asn1AcnAst.AcnReferenceToIA5String a -> ToC2(r.args.TypePrefix + a.tasName.Value)

    | AcnParameterDeterminant   prm ->
        match prm.asn1Type with
        | AcnGenericTypes.AcnPrmInteger  _       -> createPrmAcnInteger r lm
        | AcnGenericTypes.AcnPrmBoolean  _       -> createAcnBoolean r lm
        | AcnGenericTypes.AcnPrmNullType _       -> createAcnNull r lm
        | AcnGenericTypes.AcnPrmRefType (md,ts)  ->
            getTypeDefinitionName r lm (ReferenceToType [MD md.Value; TA ts.Value])


let getDeterminant_macro (det:Determinant) pri_macro str_macro =
    match det with
    | AcnChildDeterminant ch ->
        match ch.Type with
        | Asn1AcnAst.AcnReferenceToIA5String _ -> str_macro
        | _ -> pri_macro
    | AcnParameterDeterminant prm -> pri_macro

let getDeterminantTypeUpdateMacro (lm:LanguageMacros) (det:Determinant) =
    let MultiAcnUpdate_get_first_init_value_pri     =  lm.acn.MultiAcnUpdate_get_first_init_value_pri
    let MultiAcnUpdate_get_first_init_value_str     =  lm.acn.MultiAcnUpdate_get_first_init_value_str
    getDeterminant_macro det MultiAcnUpdate_get_first_init_value_pri MultiAcnUpdate_get_first_init_value_str

let getDeterminantTypeCheckEqual (lm:LanguageMacros) (det:Determinant) =
    let multiAcnUpdate_checkEqual_pri     =  lm.acn.MultiAcnUpdate_checkEqual_pri
    let multiAcnUpdate_checkEqual_str     =  lm.acn.MultiAcnUpdate_checkEqual_str
    getDeterminant_macro det multiAcnUpdate_checkEqual_pri multiAcnUpdate_checkEqual_str


type FuncBody = State -> ErrorCode -> (AcnGenericTypes.RelativePath * AcnGenericTypes.AcnParameter) list -> NestingScope -> CallerScope -> (AcnFuncBodyResult option) * State
type FuncBodyStateless = Codec -> (AcnGenericTypes.RelativePath * AcnGenericTypes.AcnParameter) list -> NestingScope -> CallerScope -> AcnFuncBodyResult option

let handleSavePosition (funcBody: FuncBody)
                       (savePosition: bool)
                       (c_name: string)
                       (typeId:ReferenceToType)
                       (lm:LanguageMacros)
                       (codec:CommonTypes.Codec): FuncBody =
    match savePosition with
    | false -> funcBody
    | true  ->
        let newFuncBody st errCode prms nestingScope p =
            let content, ns1a = funcBody st errCode prms nestingScope p
            let sequence_save_bitstream                 = lm.acn.sequence_save_bitstream
            let lvName = sprintf "bitStreamPositions_%d" (typeId.SequenceOfLevel + 1)
            let savePositionStatement = sequence_save_bitstream lvName c_name codec
            let newContent =
                match content with
                | Some bodyResult   ->
                    let funcBodyStr = sprintf "%s\n%s" savePositionStatement bodyResult.funcBody
                    Some {bodyResult with funcBody  = funcBodyStr}
                | None              ->
                    let funcBodyStr = savePositionStatement
                    Some {funcBody = funcBodyStr; errCodes =[]; localVariables = []; bValIsUnReferenced= true; bBsIsUnReferenced=false; resultExpr = None; typeEncodingKind = None}
            newContent, ns1a
        newFuncBody

let handleAlignmentForAsn1Types (r:Asn1AcnAst.AstRoot)
                                (lm:LanguageMacros)
                                (codec:CommonTypes.Codec)
                                (acnAlignment: AcnAlignment option)
                                (funcBody: FuncBody): FuncBody  =
    let alignToNext =  lm.acn.alignToNext
    match acnAlignment with
    | None      -> funcBody
    | Some al   ->
        let alStr, nAlignmentVal =
            match al with
            | AcnGenericTypes.NextByte ->
                match ST.lang with
                | Scala -> "Byte", 8I
                | _ -> "NextByte", 8I
            | AcnGenericTypes.NextWord ->
                match ST.lang with
                | Scala -> "Short", 16I
                | _ -> "NextWord", 16I
            | AcnGenericTypes.NextDWord ->
                match ST.lang with
                | Scala -> "Int", 32I
                | _ -> "NextDWord", 32I
        let newFuncBody st errCode prms nestingScope p =
            let content, ns1a = funcBody st errCode prms nestingScope p
            let newContent =
                match content with
                | Some bodyResult   ->
                    let funcBodyStr = alignToNext bodyResult.funcBody alStr nAlignmentVal codec
                    Some {bodyResult with funcBody  = funcBodyStr}
                | None              ->
                    let funcBodyStr = alignToNext "" alStr nAlignmentVal codec
                    Some {funcBody = funcBodyStr; errCodes =[errCode]; localVariables = []; bValIsUnReferenced= true; bBsIsUnReferenced=false; resultExpr = None; typeEncodingKind = None}
            newContent, ns1a
        newFuncBody

let handleAlignmentForAcnTypes (r:Asn1AcnAst.AstRoot)
                               (lm:LanguageMacros)
                               (acnAlignment : AcnAlignment option)
                               (funcBody: FuncBodyStateless): FuncBodyStateless =
    let alignToNext = lm.acn.alignToNext
    match acnAlignment with
    | None      -> funcBody
    | Some al   ->
        let alStr, nAlignmentVal =
            match al with
            | AcnGenericTypes.NextByte   -> "NextByte", 8I
            | AcnGenericTypes.NextWord   -> "NextWord", 16I
            | AcnGenericTypes.NextDWord  -> "NextDWord", 32I
        let newFuncBody (codec:CommonTypes.Codec) (prms: (RelativePath * AcnParameter) list) (nestingScope: NestingScope) (p: CallerScope) =
            let content = funcBody codec prms nestingScope p
            let newContent =
                match content with
                | Some bodyResult   ->
                    let funcBodyStr = alignToNext bodyResult.funcBody alStr nAlignmentVal codec
                    Some {bodyResult with funcBody  = funcBodyStr}
                | None              ->
                    let funcBodyStr = alignToNext "" alStr nAlignmentVal codec
                    Some {funcBody = funcBodyStr; errCodes =[]; localVariables = []; bValIsUnReferenced= true; bBsIsUnReferenced=false; resultExpr = None; typeEncodingKind = None}
            newContent
        newFuncBody

type IcdArgAux = {
    canBeEmbedded  : bool
    baseAsn1Kind   : string
    rowsFunc : string->string->string list ->IcdRow list
    commentsForTas : string list
    scope : string
    name  : string option
}
let createIcdAux (r:Asn1AcnAst.AstRoot) (id:ReferenceToType) (icdAux:IcdArgAux) hash (td:FE_TypeDefinition) (typeDefinition:TypeDefinitionOrReference) nMinBytesInACN nMaxBytesInACN=
    let typeAss =
        {
            IcdTypeAss.linkId = id
            tasInfo = id.tasInfo
            asn1Link = None;
            acnLink = None;
            name =
                match icdAux.name with
                | Some n -> n
                | None   -> td.asn1Name
            kind = icdAux.baseAsn1Kind;
            comments =
                let asn1Comments =
                    match id.tasInfo with
                    | None -> []
                    | Some tasInfo ->
                        match r.Modules |> Seq.tryFind(fun m -> m.Name.Value = tasInfo.modName) with
                        | None -> []
                        | Some m ->
                            match m.TypeAssignments |> Seq.tryFind(fun ts -> ts.Name.Value = tasInfo.tasName) with
                            | None -> []
                            | Some ts -> ts.Comments |> Seq.toList
                asn1Comments@icdAux.commentsForTas
            rows = icdAux.rowsFunc "" "" [];
            minLengthInBytes = nMinBytesInACN;
            maxLengthInBytes = nMaxBytesInACN
            hash = hash
        }
    {IcdAux.canBeEmbedded = icdAux.canBeEmbedded; createRowsFunc= icdAux.rowsFunc; typeAss=typeAss}

let md5 = System.Security.Cryptography.MD5.Create()

let calcIcdTypeAssHash (codec:CommonTypes.Codec) bPrint (t1:IcdTypeAss) =
    let rec calcIcdTypeAssHash_aux (t1:IcdTypeAss) =
        let rws =
            t1.rows |>
            Seq.map(fun r -> sprintf "%A%A%A%A%A%A%A%A%A%A" r.idxOffset r.fieldName r.comments r.sPresent r.sType r.sConstraint r.minLengthInBits r.maxLengthInBits r.sUnits r.rowType) |>
            Seq.StrJoin ""
        let aa = sprintf"%A%A%A%A%A%A%A%A%A" t1.acnLink t1.asn1Link  t1.name t1.kind t1.comments t1.minLengthInBytes t1.maxLengthInBytes (rws) ("")
        let bytes = md5.ComputeHash(System.Text.Encoding.UTF8.GetBytes aa)
        Convert.ToHexString bytes

    calcIcdTypeAssHash_aux t1

let adaptArgument = DAstUPer.adaptArgument
let adaptArgumentValue = DAstUPer.adaptArgumentValue

let joinedOrAsIdentifier = DAstUPer.joinedOrAsIdentifier

let private createAcnFunction (r: Asn1AcnAst.AstRoot)
                              (lm: LanguageMacros)
                              (codec: CommonTypes.Codec)
                              (t: Asn1AcnAst.Asn1Type)
                              (typeDefinition: TypeDefinitionOrReference)
                              (isValidFunc: IsValidFunction option)
                              (funcBody: FuncBody)
                              isTestVaseValid
                              (icdAux: IcdArgAux)
                              (soSparkAnnotations: string option)
                              (funcDefAnnots: string list)
                              (us: State) =
    let td = lm.lg.getTypeDefinition t.FT_TypeDefinition
    let funcNameBase = td.typeName + "_ACN"
    let funcNameAndtasInfo   =
        match t.acnParameters with
        | []    ->
            match t.id.tasInfo with
            | None -> None
            | Some _ -> Some (funcNameBase  + codec.suffix)
        | _     -> None
    let errCodeName         = ToC ("ERR_ACN" + (codec.suffix.ToUpper()) + "_" + ((t.id.AcnAbsPath |> Seq.skip 1 |> Seq.StrJoin("-")).Replace("#","elm")))
    let errCode, ns = getNextValidErrorCode us errCodeName None
    let nMaxBytesInACN = BigInteger (ceil ((double t.acnMaxSizeInBits)/8.0))
    let nMinBytesInACN = BigInteger (ceil ((double t.acnMinSizeInBits)/8.0))
    let soInitFuncName = getFuncNameGeneric typeDefinition (lm.init.methodNameSuffix())
    let EmitTypeAssignment_primitive     =  lm.acn.EmitTypeAssignment_primitive
    let EmitTypeAssignment_primitive_def =  lm.acn.EmitTypeAssignment_primitive_def
    let EmitTypeAssignment_def_err_code  =  lm.acn.EmitTypeAssignment_def_err_code

    let funcBodyAsSeqComp (st: State)
                          (prms: (RelativePath * AcnParameter) list)
                          (nestingScope: NestingScope)
                          (p: CallerScope)
                          (c_name: string): ((AcnFuncBodyResult option)*State) =
        let funcBody = handleSavePosition funcBody t.SaveBitStreamPosition c_name t.id lm codec
        let ret = handleAlignmentForAsn1Types r lm codec t.acnAlignment funcBody
        ret st errCode prms nestingScope p

    let funcBody = handleAlignmentForAsn1Types r lm codec t.acnAlignment funcBody

    let p : CallerScope = lm.lg.getParamType t codec
    let varName = p.arg.receiverId
    let sStar = lm.lg.getStar p.arg
    let isValidFuncName = match isValidFunc with None -> None | Some f -> f.funcName
    let sInitialExp = ""
    let func, funcDef,ns2  =
            match funcNameAndtasInfo  with
            | None -> None, None, ns
            | Some funcName ->
                let precondAnnots = lm.lg.generatePrecond ACN t
                let postcondAnnots = lm.lg.generatePostcond ACN funcNameBase p t codec
                let content, ns1a = funcBody ns errCode [] (NestingScope.init t.acnMaxSizeInBits t.uperMaxSizeInBits) p
                let bodyResult_funcBody, errCodes,  bodyResult_localVariables, bBsIsUnreferenced, bVarNameIsUnreferenced =
                    match content with
                    | None ->
                        let emptyStatement = lm.lg.emptyStatement
                        emptyStatement, [], [], true, isValidFuncName.IsNone
                    | Some bodyResult ->
                        bodyResult.funcBody, bodyResult.errCodes, bodyResult.localVariables, bodyResult.bBsIsUnReferenced, bodyResult.bValIsUnReferenced

                let handleAcnParameter (p:AcnGenericTypes.AcnParameter) =
                    let intType  = lm.typeDef.Declare_Integer ()
                    let boolType = lm.typeDef.Declare_Boolean ()
                    let emitPrm  = lm.acn.EmitAcnParameter
                    match p.asn1Type with
                    | AcnGenericTypes.AcnPrmInteger    loc          -> emitPrm p.c_name intType
                    | AcnGenericTypes.AcnPrmBoolean    loc          -> emitPrm p.c_name boolType
                    | AcnGenericTypes.AcnPrmNullType   loc          -> raise(SemanticError (loc, "Invalid type for parameter"))
                    | AcnGenericTypes.AcnPrmRefType(md,ts)          ->
                        let prmTypeName =
                            match lm.lg.hasModules with
                            | false         -> ToC2(r.args.TypePrefix + ts.Value)
                            | true       ->
                                match md.Value = t.id.ModName with
                                | true  -> ToC2(r.args.TypePrefix + ts.Value)
                                | false -> (ToC2 md.Value) + "." + ToC2(r.args.TypePrefix + ts.Value)
                        emitPrm p.c_name prmTypeName

                let lvars = bodyResult_localVariables |> List.map(fun (lv:LocalVariable) -> lm.lg.getLocalVariableDeclaration lv) |> Seq.distinct
                let prms = t.acnParameters |> List.map handleAcnParameter
                let prmNames = t.acnParameters |> List.map (fun p -> p.c_name)
                let func = Some(EmitTypeAssignment_primitive varName sStar funcName isValidFuncName (typeDefinition.longTypedefName2 lm.lg.hasModules) lvars bodyResult_funcBody soSparkAnnotations sInitialExp prms prmNames (t.acnMaxSizeInBits = 0I) bBsIsUnreferenced bVarNameIsUnreferenced soInitFuncName funcDefAnnots precondAnnots postcondAnnots codec)

                let errCodStr = errCodes |> List.map(fun x -> EmitTypeAssignment_def_err_code x.errCodeName (BigInteger x.errCodeValue) x.comment) |> List.distinct
                let funcDef = Some(EmitTypeAssignment_primitive_def varName sStar funcName  (typeDefinition.longTypedefName2 lm.lg.hasModules) errCodStr (t.acnMaxSizeInBits = 0I) nMaxBytesInACN ( t.acnMaxSizeInBits) prms soSparkAnnotations codec)
                func, funcDef,ns1a

    let icdAux, ns3 =
        match codec with
        | Encode ->
            let tr = createIcdAux r t.id icdAux "" td typeDefinition nMinBytesInACN nMaxBytesInACN
            let icdHash = calcIcdTypeAssHash codec true tr.typeAss
            let trTypeAssWithHash = {tr.typeAss with hash = icdHash}
            let tr = {tr with typeAss = trTypeAssWithHash}
            let ns3 =
                match ns2.icdHashes.TryFind icdHash with
                | None -> {ns2 with icdHashes = ns2.icdHashes.Add(icdHash, [tr.typeAss])}
                | Some exList -> {ns2 with icdHashes = ns2.icdHashes.Add(icdHash, tr.typeAss::exList)}
            Some tr, ns3
        | Decode -> None, ns2
    let ret =
        {
            AcnFunction.funcName       = funcNameAndtasInfo
            func                       = func
            funcDef                    = funcDef
            funcBody                   = (fun us acnArgs p -> funcBody us errCode acnArgs p )
            funcBodyAsSeqComp          = funcBodyAsSeqComp
            isTestVaseValid            = isTestVaseValid
            icd                        = icdAux
        }
    ret, ns3

type AcnIntegerFuncBody = ErrorCode -> ((AcnGenericTypes.RelativePath*AcnGenericTypes.AcnParameter) list) -> NestingScope -> CallerScope -> (AcnFuncBodyResult option)

let private createAcnIntegerFunctionInternal (r:Asn1AcnAst.AstRoot)
                                             (lm:LanguageMacros)
                                             (codec:CommonTypes.Codec)
                                             (uperRange : BigIntegerUperRange)
                                             (intClass:Asn1AcnAst.IntegerClass)
                                             (acnEncodingClass: IntEncodingClass)
                                             (uperfuncBody : ErrorCode -> CallerScope -> (UPERFuncBodyResult option))
                                             (soMF:string option, soMFM:string option): AcnIntegerFuncBody =
    let PositiveInteger_ConstSize_8                  = lm.acn.PositiveInteger_ConstSize_8
    let PositiveInteger_ConstSize_big_endian_16      = lm.acn.PositiveInteger_ConstSize_big_endian_16
    let PositiveInteger_ConstSize_little_endian_16   = lm.acn.PositiveInteger_ConstSize_little_endian_16
    let PositiveInteger_ConstSize_big_endian_32      = lm.acn.PositiveInteger_ConstSize_big_endian_32
    let PositiveInteger_ConstSize_little_endian_32   = lm.acn.PositiveInteger_ConstSize_little_endian_32
    let PositiveInteger_ConstSize_big_endian_64      = lm.acn.PositiveInteger_ConstSize_big_endian_64
    let PositiveInteger_ConstSize_little_endian_64   = lm.acn.PositiveInteger_ConstSize_little_endian_64
    let PositiveInteger_ConstSize                    = lm.acn.PositiveInteger_ConstSize
    let TwosComplement_ConstSize_8                   = lm.acn.TwosComplement_ConstSize_8
    let TwosComplement_ConstSize_big_endian_16       = lm.acn.TwosComplement_ConstSize_big_endian_16
    let TwosComplement_ConstSize_little_endian_16    = lm.acn.TwosComplement_ConstSize_little_endian_16
    let TwosComplement_ConstSize_big_endian_32       = lm.acn.TwosComplement_ConstSize_big_endian_32
    let TwosComplement_ConstSize_little_endian_32    = lm.acn.TwosComplement_ConstSize_little_endian_32
    let TwosComplement_ConstSize_big_endian_64       = lm.acn.TwosComplement_ConstSize_big_endian_64
    let TwosComplement_ConstSize_little_endian_64    = lm.acn.TwosComplement_ConstSize_little_endian_64
    let TwosComplement_ConstSize                     = lm.acn.TwosComplement_ConstSize
    let ASCII_ConstSize                              = lm.acn.ASCII_ConstSize
    let ASCII_VarSize_NullTerminated                 = lm.acn.ASCII_VarSize_NullTerminated
    //+++ todo write ada stg macros for ASCII_UINT_ConstSize, ASCII_UINT_VarSize_NullTerminated
    let ASCII_UINT_ConstSize                         = lm.acn.ASCII_UINT_ConstSize
    let ASCII_UINT_VarSize_NullTerminated            = lm.acn.ASCII_UINT_VarSize_NullTerminated
    let BCD_ConstSize                                = lm.acn.BCD_ConstSize
    let BCD_VarSize_NullTerminated                   = lm.acn.BCD_VarSize_NullTerminated

    let nUperMin, nUperMax =
        match uperRange with
        | Concrete(a,b) -> a,b
        | NegInf(b)     -> r.args.SIntMin, b
        | PosInf(a)     -> a, r.args.IntMax (a>=0I)
        | Full          -> r.args.SIntMin, r.args.SIntMax

    let funcBody (errCode:ErrorCode)
                 (acnArgs: (AcnGenericTypes.RelativePath*AcnGenericTypes.AcnParameter) list)
                 (nestingScope: NestingScope)
                 (p:CallerScope) =
        let pp, resultExpr = adaptArgument lm codec p
        let uIntActualMax (nBits:int) =
            let a = 2I**nBits - 1I
            min a nUperMax
        let sIntActualMin (nBits:int) =
            let a = -(2I**(nBits-1))
            max a nUperMin
        let sIntActualMax (nBits:int) =
            let a = 2I**(nBits-1) - 1I
            min a nUperMax
        let sSsuffix = DAstUPer.getIntDecFuncSuffix intClass
        let castPp encFuncBits = DAstUPer.castPp r lm codec pp intClass encFuncBits
        let word_size_in_bits = (int r.args.integerSizeInBytes)*8
        let funcBodyContent  =
            match acnEncodingClass with
            |Asn1AcnAst.Integer_uPER ->
                uperfuncBody errCode p |> Option.map(fun x -> x.funcBody, x.errCodes, x.bValIsUnReferenced, x.bBsIsUnReferenced, x.typeEncodingKind)
            |Asn1AcnAst.PositiveInteger_ConstSize_8 ->
                let typeEncodingKind = AcnIntegerEncodingType {signedness = Positive; endianness = Byte}
                Some(PositiveInteger_ConstSize_8 (castPp 8) sSsuffix errCode.errCodeName soMF soMFM (max 0I nUperMin) (uIntActualMax 8)  codec, [errCode], false, false, Some typeEncodingKind)
            |Asn1AcnAst.PositiveInteger_ConstSize_big_endian_16 ->
                let typeEncodingKind = AcnIntegerEncodingType {signedness = Positive; endianness = BigEndian S16}
                Some(PositiveInteger_ConstSize_big_endian_16 (castPp 16) sSsuffix errCode.errCodeName soMF soMFM (max 0I nUperMin) (uIntActualMax 16) codec, [errCode], false, false, Some typeEncodingKind)
            |Asn1AcnAst.PositiveInteger_ConstSize_little_endian_16 ->
                let typeEncodingKind = AcnIntegerEncodingType {signedness = Positive; endianness = LittleEndian S16}
                Some(PositiveInteger_ConstSize_little_endian_16 (castPp 16) sSsuffix errCode.errCodeName soMF soMFM (max 0I nUperMin) (uIntActualMax 16) codec, [errCode], false, false, Some typeEncodingKind)
            |Asn1AcnAst.PositiveInteger_ConstSize_big_endian_32 ->
                let typeEncodingKind = AcnIntegerEncodingType {signedness = Positive; endianness = BigEndian S32}
                Some(PositiveInteger_ConstSize_big_endian_32 (castPp 32) sSsuffix errCode.errCodeName soMF soMFM (max 0I nUperMin) (uIntActualMax 32) codec, [errCode], false, false, Some typeEncodingKind)
            |Asn1AcnAst.PositiveInteger_ConstSize_little_endian_32 ->
                let typeEncodingKind = AcnIntegerEncodingType {signedness = Positive; endianness = LittleEndian S32}
                Some(PositiveInteger_ConstSize_little_endian_32 (castPp 32) sSsuffix errCode.errCodeName soMF soMFM (max 0I nUperMin) (uIntActualMax 32) codec, [errCode], false, false, Some typeEncodingKind)
            |Asn1AcnAst.PositiveInteger_ConstSize_big_endian_64 ->
                let typeEncodingKind = AcnIntegerEncodingType {signedness = Positive; endianness = BigEndian S64}
                Some(PositiveInteger_ConstSize_big_endian_64 (castPp 64) sSsuffix errCode.errCodeName soMF soMFM (max 0I nUperMin) (uIntActualMax 64) codec, [errCode], false, false, Some typeEncodingKind)
            |Asn1AcnAst.PositiveInteger_ConstSize_little_endian_64 ->
                let typeEncodingKind = AcnIntegerEncodingType {signedness = Positive; endianness = LittleEndian S64}
                Some(PositiveInteger_ConstSize_little_endian_64 (castPp 64) sSsuffix errCode.errCodeName soMF soMFM (max 0I nUperMin) (uIntActualMax 64) codec, [errCode], false, false, Some typeEncodingKind)
            |Asn1AcnAst.PositiveInteger_ConstSize bitSize ->
                let typeEncodingKind = AcnIntegerEncodingType {signedness = Positive; endianness = Unbounded}
                Some(PositiveInteger_ConstSize (castPp word_size_in_bits) sSsuffix errCode.errCodeName ( bitSize) soMF soMFM (max 0I nUperMin) (uIntActualMax (int bitSize)) codec, [errCode], false, false, Some typeEncodingKind)

            |Asn1AcnAst.TwosComplement_ConstSize_8 ->
                let typeEncodingKind = AcnIntegerEncodingType {signedness = TwosComplement; endianness = Byte}
                Some(TwosComplement_ConstSize_8 (castPp 8) sSsuffix errCode.errCodeName soMF soMFM (sIntActualMin 8) (sIntActualMax 8) codec, [errCode], false, false, Some typeEncodingKind)
            |Asn1AcnAst.TwosComplement_ConstSize_big_endian_16 ->
                let typeEncodingKind = AcnIntegerEncodingType {signedness = TwosComplement; endianness = BigEndian S16}
                Some(TwosComplement_ConstSize_big_endian_16 (castPp 16) sSsuffix errCode.errCodeName soMF soMFM (sIntActualMin 16) (sIntActualMax 16) codec, [errCode], false, false, Some typeEncodingKind)
            |Asn1AcnAst.TwosComplement_ConstSize_little_endian_16 ->
                let typeEncodingKind = AcnIntegerEncodingType {signedness = TwosComplement; endianness = LittleEndian S16}
                Some(TwosComplement_ConstSize_little_endian_16 (castPp 16) sSsuffix errCode.errCodeName soMF soMFM (sIntActualMin 16) (sIntActualMax 16) codec, [errCode], false, false, Some typeEncodingKind)
            |Asn1AcnAst.TwosComplement_ConstSize_big_endian_32 ->
                let typeEncodingKind = AcnIntegerEncodingType {signedness = TwosComplement; endianness = BigEndian S32}
                Some(TwosComplement_ConstSize_big_endian_32 (castPp 32) sSsuffix errCode.errCodeName soMF soMFM (sIntActualMin 32) (sIntActualMax 32) codec, [errCode], false, false, Some typeEncodingKind)
            |Asn1AcnAst.TwosComplement_ConstSize_little_endian_32 ->
                let typeEncodingKind = AcnIntegerEncodingType {signedness = TwosComplement; endianness = LittleEndian S32}
                Some(TwosComplement_ConstSize_little_endian_32 (castPp 32) sSsuffix errCode.errCodeName soMF soMFM (sIntActualMin 32) (sIntActualMax 32) codec, [errCode], false, false, Some typeEncodingKind)
            |Asn1AcnAst.TwosComplement_ConstSize_big_endian_64 ->
                let typeEncodingKind = AcnIntegerEncodingType {signedness = TwosComplement; endianness = BigEndian S64}
                Some(TwosComplement_ConstSize_big_endian_64 (castPp 64) sSsuffix errCode.errCodeName soMF soMFM (sIntActualMin 64) (sIntActualMax 64) codec, [errCode], false, false, Some typeEncodingKind)
            |Asn1AcnAst.TwosComplement_ConstSize_little_endian_64 ->
                let typeEncodingKind = AcnIntegerEncodingType {signedness = TwosComplement; endianness = LittleEndian S64}
                Some(TwosComplement_ConstSize_little_endian_64 (castPp 64) sSsuffix errCode.errCodeName soMF soMFM (sIntActualMin 64) (sIntActualMax 64) codec, [errCode], false, false, Some typeEncodingKind)
            |Asn1AcnAst.TwosComplement_ConstSize bitSize ->
                let typeEncodingKind = AcnIntegerEncodingType {signedness = TwosComplement; endianness = Unbounded}
                Some(TwosComplement_ConstSize (castPp word_size_in_bits) sSsuffix errCode.errCodeName soMF soMFM ( bitSize) (sIntActualMin (int bitSize)) (sIntActualMax (int bitSize)) codec, [errCode], false, false, Some typeEncodingKind)

            |Asn1AcnAst.ASCII_ConstSize size ->
                Some(ASCII_ConstSize (castPp word_size_in_bits) sSsuffix errCode.errCodeName soMF soMFM nUperMin nUperMax ((size)/8I) codec, [errCode], false, false, Some Placeholder) // TODO: Placeholder
            |Asn1AcnAst.ASCII_VarSize_NullTerminated nullBytes ->
                Some(ASCII_VarSize_NullTerminated (castPp word_size_in_bits) sSsuffix errCode.errCodeName soMF soMFM nUperMin nUperMax nullBytes codec, [errCode], false, false, Some Placeholder)
            |Asn1AcnAst.ASCII_UINT_ConstSize size ->
                Some(ASCII_UINT_ConstSize (castPp word_size_in_bits) sSsuffix errCode.errCodeName soMF soMFM nUperMin nUperMax (( size)/8I) codec, [errCode], false, false, Some Placeholder)
            |Asn1AcnAst.ASCII_UINT_VarSize_NullTerminated nullBytes ->
                Some(ASCII_UINT_VarSize_NullTerminated (castPp word_size_in_bits) sSsuffix errCode.errCodeName  soMF soMFM nUperMin nUperMax nullBytes codec, [errCode], false, false, Some Placeholder)
            |Asn1AcnAst.BCD_ConstSize size ->
                Some(BCD_ConstSize (castPp word_size_in_bits) sSsuffix errCode.errCodeName soMF soMFM nUperMin nUperMax (( size)/4I) codec, [errCode], false, false, Some Placeholder)
            |Asn1AcnAst.BCD_VarSize_NullTerminated nullBytes ->
                Some(BCD_VarSize_NullTerminated (castPp word_size_in_bits) sSsuffix errCode.errCodeName soMF soMFM nUperMin nUperMax codec, [errCode], false, false, Some Placeholder)

        match funcBodyContent with
        | None -> None
        | Some (funcBodyContent,errCodes, bValIsUnReferenced, bBsIsUnReferenced, typeEncodingKind ) ->
            Some ({AcnFuncBodyResult.funcBody = funcBodyContent; errCodes = errCodes; localVariables = []; bValIsUnReferenced= bValIsUnReferenced; bBsIsUnReferenced=bBsIsUnReferenced; resultExpr = resultExpr; typeEncodingKind = typeEncodingKind})
    funcBody

let getMappingFunctionModule (r:Asn1AcnAst.AstRoot) (lm:LanguageMacros) (soMapFuncName:string option) =
    match lm.lg.hasModules with
    | false     -> None
    | true   ->
        match soMapFuncName with
        | None  -> None
        | Some sMapFuncName ->
            let knownMappingFunctions = ["milbus"]
            match knownMappingFunctions |> Seq.exists ((=) sMapFuncName) with
            | true  -> Some (acn_a.rtlModuleName() )
            | false -> r.args.mappingFunctionsModule

let createAcnIntegerFunction (r:Asn1AcnAst.AstRoot) (lm:LanguageMacros) (codec:CommonTypes.Codec) (typeId : ReferenceToType) (t:Asn1AcnAst.AcnInteger)  (us:State)  =
    let errCodeName         = ToC ("ERR_ACN" + (codec.suffix.ToUpper()) + "_" + ((typeId.AcnAbsPath |> Seq.skip 1 |> Seq.StrJoin("-")).Replace("#","elm")))
    let errCode, ns = getNextValidErrorCode us errCodeName None

    let uperFuncBody (errCode) (p:CallerScope) =
        DAstUPer.getIntfuncBodyByCons r lm codec t.uperRange t.Location (getAcnIntegerClass r.args t) (t.cons) (t.cons@t.withcons) errCode p
    let soMapFunMod, soMapFunc  =
        match t.acnProperties.mappingFunction with
        | Some (MappingFunction (soMapFunMod, mapFncName))    ->
            let soMapFunMod, soMapFunc  =  soMapFunMod,  Some mapFncName.Value
            match soMapFunMod with
            | None  -> getMappingFunctionModule r lm soMapFunc, soMapFunc
            | Some soMapFunMod   -> Some soMapFunMod.Value, soMapFunc
        | None -> None, None
    let funcBody = createAcnIntegerFunctionInternal r lm codec t.uperRange t.intClass t.acnEncodingClass uperFuncBody (soMapFunc, soMapFunMod)
    (funcBody errCode), ns


let createIntegerFunction (r:Asn1AcnAst.AstRoot) (lm:LanguageMacros) (codec:CommonTypes.Codec) (t:Asn1AcnAst.Asn1Type) (o:Asn1AcnAst.Integer) (typeDefinition:TypeDefinitionOrReference)  (isValidFunc: IsValidFunction option) (uperFunc: UPerFunction) (us:State)  =
    let soMapFunMod, soMapFunc  =
        match o.acnProperties.mappingFunction with
        | Some (MappingFunction (soMapFunMod, mapFncName))    ->
            let soMapFunMod, soMapFunc  =  soMapFunMod,  Some mapFncName.Value
            match soMapFunMod with
            | None  -> getMappingFunctionModule r lm soMapFunc, soMapFunc
            | Some soMapFunMod   -> Some soMapFunMod.Value, soMapFunc
        | None -> None, None
    let funcBody = createAcnIntegerFunctionInternal r lm codec o.uperRange o.intClass o.acnEncodingClass uperFunc.funcBody_e (soMapFunc, soMapFunMod)
    let soSparkAnnotations = Some(sparkAnnotations lm (typeDefinition.longTypedefName2 lm.lg.hasModules) codec)

    let sAsn1Constraints =
        let sTmpCons = o.AllCons |> List.map (DastValidate2.printRangeConAsAsn1 (fun z -> z.ToString())) |> Seq.StrJoin ""
        match sTmpCons.Trim() with
        | "" -> None
        | _  -> Some sTmpCons

    let icdFnc fieldName sPresent comments =
        [{IcdRow.fieldName = fieldName; comments = comments; sPresent=sPresent;sType=(IcdPlainType (getASN1Name t)); sConstraint=sAsn1Constraints; minLengthInBits = o.acnMinSizeInBits ;maxLengthInBits=o.acnMaxSizeInBits;sUnits=t.unitsOfMeasure; rowType = IcdRowType.FieldRow; idxOffset = None}]
    let icd = {IcdArgAux.canBeEmbedded = true; baseAsn1Kind = (getASN1Name t); rowsFunc = icdFnc; commentsForTas=[]; scope="type"; name= None}
    createAcnFunction r lm codec t typeDefinition isValidFunc  (fun us e acnArgs nestingScope p -> funcBody e acnArgs nestingScope p, us) (fun atc -> true) icd soSparkAnnotations [] us

let createAcnChildIcdFunction  (ch:AcnChild) =
    let icd fieldName comments  =
        let sType, minSize, maxSize =
            match ch.Type with
            | Asn1AcnAst.AcnInteger  a -> "INTEGER", a.acnMinSizeInBits, a.acnMaxSizeInBits
            | Asn1AcnAst.AcnBoolean  a -> "BOOLEAN", a.acnMinSizeInBits, a.acnMaxSizeInBits
            | Asn1AcnAst.AcnNullType a -> "NULL", a.acnMinSizeInBits, a.acnMaxSizeInBits
            | Asn1AcnAst.AcnReferenceToEnumerated a -> a.tasName.Value, a.enumerated.acnMinSizeInBits, a.enumerated.acnMaxSizeInBits
            | Asn1AcnAst.AcnReferenceToIA5String a -> a.tasName.Value, a.str.acnMinSizeInBits, a.str.acnMaxSizeInBits
        {IcdRow.fieldName = fieldName; comments = comments; sPresent="always";sType=(IcdPlainType sType); sConstraint=None; minLengthInBits = minSize ;maxLengthInBits=maxSize;sUnits=None; rowType = IcdRowType.FieldRow; idxOffset = None}
    icd

let createEnumCommon (r:Asn1AcnAst.AstRoot) (lm:LanguageMacros) (codec:CommonTypes.Codec) (typeId : ReferenceToType) (o:Asn1AcnAst.Enumerated) (defOrRef:TypeDefinitionOrReference ) (typeDefinitionName:string)  =
    let EnumeratedEncValues                 = lm.acn.EnumeratedEncValues
    let Enumerated_item                     = lm.acn.Enumerated_item
    let IntFullyConstraintPos               = lm.uper.IntFullyConstraintPos
    let min = o.items |> List.map(fun x -> x.acnEncodeValue) |> Seq.min
    let max = o.items |> List.map(fun x -> x.acnEncodeValue) |> Seq.max
    let sFirstItemName = lm.lg.getNamedItemBackendName (Some defOrRef) o.items.Head
    let uperRange = (Concrete (min,max))
    let intTypeClass = getIntEncodingClassByUperRange r.args uperRange
    let rtlIntType = (DAstTypeDefinition.getIntegerTypeByClass lm intTypeClass)()
    let funcBody (errCode:ErrorCode) (acnArgs: (AcnGenericTypes.RelativePath*AcnGenericTypes.AcnParameter) list) (nestingScope: NestingScope) (p:CallerScope)        =
        let td = (lm.lg.getEnumTypeDefinition o.typeDef).longTypedefName2 lm.lg.hasModules (ToC p.modName)
        let localVar, intVal =
            let varName = $"intVal_{ToC p.arg.asIdentifier}"
            let lv =
                match lm.lg.decodingKind with
                | Copy -> []
                | InPlace -> [GenericLocalVariable {GenericLocalVariable.name = varName; varType= rtlIntType; arrSize= None; isStatic = false; initExp=None}]
            lv, varName
        let pVal = {CallerScope.modName = typeId.ModName; arg = Selection.valueEmptyPath intVal}
        let intFuncBody =
            let uperInt (errCode:ErrorCode) (p:CallerScope) =
                let pp, resultExpr = adaptArgument lm codec p
                let castPp  = DAstUPer.castPp r lm codec pp intTypeClass
                let sSsuffix = DAstUPer.getIntDecFuncSuffix intTypeClass
                let word_size_in_bits = (int r.args.integerSizeInBytes)*8
                let funcBody = IntFullyConstraintPos (castPp word_size_in_bits) min max (GetNumberOfBitsForNonNegativeInteger (max-min))  sSsuffix errCode.errCodeName codec
                Some({UPERFuncBodyResult.funcBody = funcBody; errCodes = [errCode]; localVariables= []; bValIsUnReferenced=false; bBsIsUnReferenced=false; resultExpr=resultExpr; typeEncodingKind=Some (Asn1IntegerEncodingType (Some (FullyConstrainedPositive (min, max))))})
            createAcnIntegerFunctionInternal r lm codec (Concrete (min,max)) intTypeClass o.acnEncodingClass uperInt (None, None)
        let funcBodyContent =
            match intFuncBody errCode acnArgs nestingScope pVal with
            | None -> None
            | Some intAcnFuncBdResult ->
                let arrItems = o.items |> List.map(fun it ->
                    let enumClassName = extractEnumClassName "" it.scala_name it.Name.Value
                    Enumerated_item (lm.lg.getValue p.arg) (lm.lg.getNamedItemBackendName (Some defOrRef) it) enumClassName it.acnEncodeValue (lm.lg.intValueToString it.acnEncodeValue intTypeClass) intVal codec)
                Some (EnumeratedEncValues (lm.lg.getValue p.arg) td arrItems intAcnFuncBdResult.funcBody errCode.errCodeName sFirstItemName intVal codec, intAcnFuncBdResult.resultExpr, intAcnFuncBdResult.errCodes, localVar@intAcnFuncBdResult.localVariables, intAcnFuncBdResult.typeEncodingKind)
        match funcBodyContent with
        | None -> None
        | Some (funcBodyContent, resultExpr, errCodes, localVariables, typeEncodingKind) ->
            Some ({AcnFuncBodyResult.funcBody = funcBodyContent; errCodes = errCodes; localVariables = localVariables; bValIsUnReferenced= false; bBsIsUnReferenced=false; resultExpr=resultExpr; typeEncodingKind=typeEncodingKind})
    funcBody

let enumComment stgFileName (o:Asn1AcnAst.Enumerated) =
    let EmitItem (n:Asn1AcnAst.NamedItem) =
        let comment =  n.Comments |> Seq.StrJoin "\n"
        match comment.Trim() with
        | ""        ->    icd_uper.EmitEnumItem stgFileName n.Name.Value n.definitionValue
        | _         ->    icd_uper.EmitEnumItemWithComment stgFileName n.Name.Value n.definitionValue comment
    let itemsHtml =
        o.items |>
            List.filter(fun z ->
                let v = z.Name.Value
                Asn1Fold.isValidValueGeneric o.AllCons (=) v ) |>
            List.map EmitItem
    icd_uper.EmitEnumInternalContents stgFileName itemsHtml


let createEnumeratedFunction (r:Asn1AcnAst.AstRoot) (icdStgFileName:string) (lm:LanguageMacros) (codec:CommonTypes.Codec) (t:Asn1AcnAst.Asn1Type) (o:Asn1AcnAst.Enumerated) (defOrRef:TypeDefinitionOrReference) (typeDefinition:TypeDefinitionOrReference)   (isValidFunc: IsValidFunction option) (uperFunc: UPerFunction) (us:State)  =
    let typeDefinitionName = defOrRef.longTypedefName2 lm.lg.hasModules //getTypeDefinitionName t.id.tasInfo typeDefinition
    let funcBody = createEnumCommon r lm codec t.id o defOrRef typeDefinitionName
    let soSparkAnnotations = Some(sparkAnnotations lm (typeDefinition.longTypedefName2 lm.lg.hasModules) codec)
    let icdFnc fieldName sPresent (comments:string list) =
        let newComments = comments@[enumComment icdStgFileName o]
        [{IcdRow.fieldName = fieldName; comments = newComments; sPresent=sPresent;sType=(IcdPlainType (getASN1Name t)); sConstraint=None; minLengthInBits = o.acnMinSizeInBits ;maxLengthInBits=o.acnMaxSizeInBits;sUnits=t.unitsOfMeasure; rowType = IcdRowType.FieldRow; idxOffset = None}]
    let icd = {IcdArgAux.canBeEmbedded = true; baseAsn1Kind = (getASN1Name t); rowsFunc = icdFnc; commentsForTas=[]; scope="type"; name= None;}
    createAcnFunction r lm codec t typeDefinition  isValidFunc  (fun us e acnArgs nestingScope p -> funcBody e acnArgs nestingScope p, us) (fun atc -> true) icd soSparkAnnotations  [] us


let createAcnEnumeratedFunction (r:Asn1AcnAst.AstRoot) (lm:LanguageMacros) (codec:CommonTypes.Codec) (typeId : ReferenceToType) (t:Asn1AcnAst.AcnReferenceToEnumerated)  (defOrRef:TypeDefinitionOrReference) (us:State)  =
    let errCodeName         = ToC ("ERR_ACN" + (codec.suffix.ToUpper()) + "_" + ((typeId.AcnAbsPath |> Seq.skip 1 |> Seq.StrJoin("-")).Replace("#","elm")))
    let errCode, ns = getNextValidErrorCode us errCodeName None
    let td = lm.lg.getTypeDefinition (t.getType r).FT_TypeDefinition
    let typeDefinitionName = td.typeName
    let funcBody = createEnumCommon r lm codec typeId t.enumerated defOrRef typeDefinitionName
    (funcBody errCode), ns

let createRealFunction (r:Asn1AcnAst.AstRoot) (lm:LanguageMacros) (codec:CommonTypes.Codec) (t:Asn1AcnAst.Asn1Type) (o:Asn1AcnAst.Real) (typeDefinition:TypeDefinitionOrReference)  (isValidFunc: IsValidFunction option) (uperFunc: UPerFunction) (us:State)  =
    let Real_32_big_endian                  = lm.acn.Real_32_big_endian
    let Real_64_big_endian                  = lm.acn.Real_64_big_endian
    let Real_32_little_endian               = lm.acn.Real_32_little_endian
    let Real_64_little_endian               = lm.acn.Real_64_little_endian

    let sSuffix =
        match o.getClass r.args with
        | ASN1SCC_REAL   -> ""
        | ASN1SCC_FP32   -> "_fp32"
        | ASN1SCC_FP64   -> ""


    let funcBody (errCode:ErrorCode) (acnArgs: (AcnGenericTypes.RelativePath*AcnGenericTypes.AcnParameter) list) (nestingScope: NestingScope) (p:CallerScope) =
        let pp, resultExpr = adaptArgument lm codec p
        let castPp = DAstUPer.castRPp lm codec (o.getClass r.args) pp

        let funcBodyContent =
            match o.acnEncodingClass with
            | Real_IEEE754_32_big_endian            -> Some (Real_32_big_endian castPp sSuffix errCode.errCodeName codec, [errCode], Some (AcnRealEncodingType BigEndian32))
            | Real_IEEE754_64_big_endian            -> Some (Real_64_big_endian pp errCode.errCodeName codec, [errCode], Some (AcnRealEncodingType BigEndian64))
            | Real_IEEE754_32_little_endian         -> Some (Real_32_little_endian castPp sSuffix errCode.errCodeName codec, [errCode], Some (AcnRealEncodingType LittleEndian32))
            | Real_IEEE754_64_little_endian         -> Some (Real_64_little_endian pp errCode.errCodeName codec, [errCode], Some (AcnRealEncodingType LittleEndian64))
            | Real_uPER                             -> uperFunc.funcBody_e errCode p |> Option.map(fun x -> x.funcBody, x.errCodes, x.typeEncodingKind)
        match funcBodyContent with
        | None -> None
        | Some (funcBodyContent,errCodes, typeEncodingKind) -> Some ({AcnFuncBodyResult.funcBody = funcBodyContent; errCodes = errCodes; localVariables = []; bValIsUnReferenced= false; bBsIsUnReferenced=false; resultExpr=resultExpr; typeEncodingKind=typeEncodingKind})
    let soSparkAnnotations = Some(sparkAnnotations lm (typeDefinition.longTypedefName2 lm.lg.hasModules) codec)
    let icdFnc fieldName sPresent comments =
        [{IcdRow.fieldName = fieldName; comments = comments; sPresent=sPresent;sType=(IcdPlainType (getASN1Name t)); sConstraint=None; minLengthInBits = o.acnMinSizeInBits ;maxLengthInBits=o.acnMaxSizeInBits;sUnits=t.unitsOfMeasure; rowType = IcdRowType.FieldRow; idxOffset = None}]
    let icd = {IcdArgAux.canBeEmbedded = true; baseAsn1Kind = (getASN1Name t); rowsFunc = icdFnc; commentsForTas=[]; scope="type"; name= None}
    let annots =
        match ST.lang with
        | Scala -> ["extern"]
        | _ -> []
    createAcnFunction r lm codec t typeDefinition isValidFunc  (fun us e acnArgs nestingScope p -> funcBody e acnArgs nestingScope p, us) (fun atc -> true) icd soSparkAnnotations annots us


let createObjectIdentifierFunction (r:Asn1AcnAst.AstRoot) (lm:LanguageMacros) (codec:CommonTypes.Codec) (t:Asn1AcnAst.Asn1Type) (o:Asn1AcnAst.ObjectIdentifier) (typeDefinition:TypeDefinitionOrReference)  (isValidFunc: IsValidFunction option) (uperFunc: UPerFunction) (us:State)  =
    let funcBody (errCode:ErrorCode) (acnArgs: (AcnGenericTypes.RelativePath*AcnGenericTypes.AcnParameter) list) (nestingScope: NestingScope) (p:CallerScope) =
        let funcBodyContent =
            uperFunc.funcBody_e errCode p |> Option.map(fun x -> x.funcBody, x.errCodes, x.resultExpr, x.typeEncodingKind)
        match funcBodyContent with
        | None -> None
        | Some (funcBodyContent,errCodes, resultExpr, typeEncodingKind) -> Some ({AcnFuncBodyResult.funcBody = funcBodyContent; errCodes = errCodes; localVariables = []; bValIsUnReferenced= false; bBsIsUnReferenced=false; resultExpr=resultExpr; typeEncodingKind=typeEncodingKind})
    let soSparkAnnotations = Some(sparkAnnotations lm (typeDefinition.longTypedefName2 lm.lg.hasModules) codec)
    let icdFnc fieldName sPresent comments  =
        [{IcdRow.fieldName = fieldName; comments = comments; sPresent=sPresent;sType=(IcdPlainType (getASN1Name t)); sConstraint=None; minLengthInBits = o.acnMinSizeInBits ;maxLengthInBits=o.acnMaxSizeInBits;sUnits=t.unitsOfMeasure; rowType = IcdRowType.FieldRow; idxOffset = None}]
    let icd = {IcdArgAux.canBeEmbedded = true; baseAsn1Kind = (getASN1Name t); rowsFunc = icdFnc; commentsForTas=[]; scope="type"; name= None}
    createAcnFunction r lm codec t typeDefinition isValidFunc  (fun us e acnArgs nestingScope p -> funcBody e acnArgs nestingScope p, us) (fun atc -> true) icd soSparkAnnotations [] us


let createTimeTypeFunction (r:Asn1AcnAst.AstRoot) (lm:LanguageMacros) (codec:CommonTypes.Codec) (t:Asn1AcnAst.Asn1Type) (o:Asn1AcnAst.TimeType) (typeDefinition:TypeDefinitionOrReference)  (isValidFunc: IsValidFunction option) (uperFunc: UPerFunction) (us:State)  =
    let funcBody (errCode:ErrorCode) (acnArgs: (AcnGenericTypes.RelativePath*AcnGenericTypes.AcnParameter) list) (nestingScope: NestingScope) (p:CallerScope) =
        let funcBodyContent =
            uperFunc.funcBody_e errCode p |> Option.map(fun x -> x.funcBody, x.errCodes, x.resultExpr, x.typeEncodingKind)
        match funcBodyContent with
        | None -> None
        | Some (funcBodyContent,errCodes, resultExpr, typeEncodingKind) -> Some ({AcnFuncBodyResult.funcBody = funcBodyContent; errCodes = errCodes; localVariables = []; bValIsUnReferenced= false; bBsIsUnReferenced=false; resultExpr=resultExpr; typeEncodingKind=typeEncodingKind})
    let soSparkAnnotations = Some(sparkAnnotations lm (typeDefinition.longTypedefName2 lm.lg.hasModules) codec)
    let icdFnc fieldName sPresent comments =
        [{IcdRow.fieldName = fieldName; comments = comments; sPresent=sPresent;sType=(IcdPlainType (getASN1Name t)); sConstraint=None; minLengthInBits = o.acnMinSizeInBits ;maxLengthInBits=o.acnMaxSizeInBits;sUnits=t.unitsOfMeasure; rowType = IcdRowType.FieldRow; idxOffset = None}]
    let icd = {IcdArgAux.canBeEmbedded = true; baseAsn1Kind = (getASN1Name t); rowsFunc = icdFnc; commentsForTas=[]; scope="type"; name= None;}
    createAcnFunction r lm codec t typeDefinition isValidFunc  (fun us e acnArgs nestingScope p -> funcBody e acnArgs nestingScope p, us) (fun atc -> true) icd soSparkAnnotations [] us


let nestChildItems (lm:LanguageMacros) (codec:CommonTypes.Codec) children =
    DAstUtilFunctions.nestItems lm.isvalid.JoinItems2 children


let createAcnBooleanFunction (r:Asn1AcnAst.AstRoot) (lm:LanguageMacros) (codec:CommonTypes.Codec)  (typeId : ReferenceToType) (o:Asn1AcnAst.AcnBoolean)  (us:State)  =
    let errCodeName         = ToC ("ERR_ACN" + (codec.suffix.ToUpper()) + "_" + ((typeId.AcnAbsPath |> Seq.skip 1 |> Seq.StrJoin("-")).Replace("#","elm")))
    let errCode, ns = getNextValidErrorCode us errCodeName None

    let funcBody (errCode:ErrorCode) (acnArgs: (AcnGenericTypes.RelativePath*AcnGenericTypes.AcnParameter) list) (nestingScope: NestingScope) (p:CallerScope) =
        let pp, resultExpr = adaptArgument lm codec p
        let Boolean         = lm.uper.Boolean
        let funcBodyContent =
            Boolean pp errCode.errCodeName codec
        Some {AcnFuncBodyResult.funcBody = funcBodyContent; errCodes = [errCode]; localVariables = []; bValIsUnReferenced= false; bBsIsUnReferenced=false; resultExpr=resultExpr; typeEncodingKind = Some (AcnBooleanEncodingType None)}
    (funcBody errCode), ns

let createBooleanFunction (r:Asn1AcnAst.AstRoot) (lm:LanguageMacros) (codec:CommonTypes.Codec) (t:Asn1AcnAst.Asn1Type) (o:Asn1AcnAst.Boolean) (typeDefinition:TypeDefinitionOrReference) (baseTypeUperFunc : AcnFunction option) (isValidFunc: IsValidFunction option) (us:State)  =
    let funcBody (errCode:ErrorCode) (acnArgs: (AcnGenericTypes.RelativePath*AcnGenericTypes.AcnParameter) list) (nestingScope: NestingScope) (p:CallerScope) =
        let Boolean         = lm.uper.Boolean
        let acnBoolean      = lm.acn.Boolean
        let funcBodyContent, resultExpr, typeEncodingKind =
            match o.acnProperties.encodingPattern with
            | None ->
                let pp, resultExpr = adaptArgument lm codec p
                Boolean pp errCode.errCodeName codec, resultExpr, AcnBooleanEncodingType None
            | Some pattern  ->
                let pvalue, ptr, resultExpr =
                    match codec, lm.lg.decodingKind with
                    | Decode, Copy ->
                        let resExpr = p.arg.asIdentifier
                        resExpr, resExpr, Some resExpr
                    | _ -> lm.lg.getValue p.arg, lm.lg.getPointer p.arg, None
                let arrBits = pattern.bitVal.Value.ToCharArray() |> Seq.mapi(fun i x -> ((i+1).ToString()) + "=>" + if x='0' then "0" else "1") |> Seq.toList
                let arrBytes = bitStringValueToByteArray pattern.bitVal
                let arrTrueValueAsByteArray = arrBytes |> Array.map (~~~)
                let arrFalseValueAsByteArray = arrBytes
                let nSize = pattern.bitVal.Value.Length
                acnBoolean pvalue ptr pattern.isTrue (BigInteger nSize) arrTrueValueAsByteArray arrFalseValueAsByteArray arrBits errCode.errCodeName codec, resultExpr, AcnBooleanEncodingType (Some pattern)

        {AcnFuncBodyResult.funcBody = funcBodyContent; errCodes = [errCode]; localVariables = []; bValIsUnReferenced= false; bBsIsUnReferenced=false; resultExpr=resultExpr; typeEncodingKind = Some typeEncodingKind}
    let soSparkAnnotations = Some(sparkAnnotations lm (typeDefinition.longTypedefName2 lm.lg.hasModules) codec)
    let icdFnc fieldName sPresent comments =
        [{IcdRow.fieldName = fieldName; comments = comments; sPresent=sPresent;sType=(IcdPlainType (getASN1Name t)); sConstraint=None; minLengthInBits = o.acnMinSizeInBits ;maxLengthInBits=o.acnMaxSizeInBits;sUnits=t.unitsOfMeasure; rowType = IcdRowType.FieldRow; idxOffset = None}]
    let icd = {IcdArgAux.canBeEmbedded = true; baseAsn1Kind = (getASN1Name t); rowsFunc = icdFnc; commentsForTas=[]; scope="type"; name= None}
    createAcnFunction r lm codec t typeDefinition  isValidFunc  (fun us e acnArgs nestingScope p -> Some (funcBody e acnArgs nestingScope p), us) (fun atc -> true) icd soSparkAnnotations [] us




let createAcnNullTypeFunction (r:Asn1AcnAst.AstRoot) (lm:LanguageMacros) (codec:CommonTypes.Codec)  (typeId : ReferenceToType) (o:Asn1AcnAst.AcnNullType)  (us:State)  =
    let errCodeName         = ToC ("ERR_ACN" + (codec.suffix.ToUpper()) + "_" + ((typeId.AcnAbsPath |> Seq.skip 1 |> Seq.StrJoin("-")).Replace("#","elm")))
    let errCode, ns = getNextValidErrorCode us errCodeName None

    let funcBody (errCode:ErrorCode) (acnArgs: (AcnGenericTypes.RelativePath*AcnGenericTypes.AcnParameter) list) (nestingScope: NestingScope) (p:CallerScope) =
        let pp, resultExpr = adaptArgument lm codec p
        let nullType         = lm.acn.Null_pattern2
        match o.acnProperties.encodingPattern with
        | None      -> None
        | Some encPattern   ->
            let arrsBits, arrBytes, nBitsSize =
                match encPattern with
                | PATTERN_PROP_BITSTR_VALUE bitStringPattern ->
                    let arrsBits = bitStringPattern.Value.ToCharArray() |> Seq.mapi(fun i x -> ((i+1).ToString()) + "=>" + if x='0' then "0" else "1") |> Seq.toList
                    let arrBytes = bitStringValueToByteArray bitStringPattern
                    arrsBits, arrBytes, (BigInteger bitStringPattern.Value.Length)
                | PATTERN_PROP_OCTSTR_VALUE octStringBytes   ->
                    let arrBytes = octStringBytes |> Seq.map(fun z -> z.Value) |> Seq.toArray
                    let bitStringPattern = byteArrayToBitStringValue arrBytes
                    let arrsBits = bitStringPattern.ToCharArray() |> Seq.mapi(fun i x -> ((i+1).ToString()) + "=>" + if x='0' then "0" else "1") |> Seq.toList
                    arrsBits,arrBytes,(BigInteger bitStringPattern.Length)
            let ret = nullType pp arrBytes nBitsSize arrsBits errCode.errCodeName o.acnProperties.savePosition codec
            Some ({AcnFuncBodyResult.funcBody = ret; errCodes = [errCode]; localVariables = []; bValIsUnReferenced= false; bBsIsUnReferenced=false; resultExpr=resultExpr; typeEncodingKind = Some (AcnNullEncodingType (Some encPattern))})
    (funcBody errCode), ns

let createNullTypeFunction (r:Asn1AcnAst.AstRoot) (lm:LanguageMacros) (codec:CommonTypes.Codec) (t:Asn1AcnAst.Asn1Type) (o:Asn1AcnAst.NullType) (typeDefinition:TypeDefinitionOrReference) (isValidFunc: IsValidFunction option) (us:State)  =
    let funcBody (errCode:ErrorCode) (acnArgs: (AcnGenericTypes.RelativePath*AcnGenericTypes.AcnParameter) list) (nestingScope: NestingScope) (p:CallerScope) =
        let pp, resultExpr = adaptArgument lm codec p
        let nullType         = lm.acn.Null_pattern

        match o.acnProperties.encodingPattern with
        | None ->
            match codec, lm.lg.decodingKind with
            | Decode, Copy ->
                // Copy-decoding backend expect all values to be declared even if they are "dummies"
                Some ({AcnFuncBodyResult.funcBody = lm.acn.Null_declare pp; errCodes = []; localVariables = []; bValIsUnReferenced=false; bBsIsUnReferenced=false; resultExpr=Some pp; typeEncodingKind = Some (AcnNullEncodingType None)})
            | _ -> None
        | Some encPattern   ->
            let arrsBits, arrBytes, nBitsSize =
                match encPattern with
                | PATTERN_PROP_BITSTR_VALUE bitStringPattern ->
                    let arrsBits = bitStringPattern.Value.ToCharArray() |> Seq.mapi(fun i x -> ((i+1).ToString()) + "=>" + if x='0' then "0" else "1") |> Seq.toList
                    let arrBytes = bitStringValueToByteArray bitStringPattern
                    arrsBits, arrBytes, (BigInteger bitStringPattern.Value.Length)
                | PATTERN_PROP_OCTSTR_VALUE octStringBytes   ->
                    let arrBytes = octStringBytes |> Seq.map(fun z -> z.Value) |> Seq.toArray
                    let bitStringPattern = byteArrayToBitStringValue arrBytes
                    let arrsBits = bitStringPattern.ToCharArray() |> Seq.mapi(fun i x -> ((i+1).ToString()) + "=>" + if x='0' then "0" else "1") |> Seq.toList
                    arrsBits,arrBytes,(BigInteger bitStringPattern.Length)
            let ret = nullType pp arrBytes nBitsSize arrsBits errCode.errCodeName o.acnProperties.savePosition codec
            Some ({AcnFuncBodyResult.funcBody = ret; errCodes = [errCode]; localVariables = []; bValIsUnReferenced= lm.lg.acn.null_valIsUnReferenced; bBsIsUnReferenced=false; resultExpr=resultExpr; typeEncodingKind = Some (AcnNullEncodingType (Some encPattern))})
    let soSparkAnnotations = Some(sparkAnnotations lm (typeDefinition.longTypedefName2 lm.lg.hasModules) codec)
    let icdFnc fieldName sPresent comments =
        [{IcdRow.fieldName = fieldName; comments = comments; sPresent=sPresent;sType=(IcdPlainType (getASN1Name t)); sConstraint=None; minLengthInBits = o.acnMinSizeInBits ;maxLengthInBits=o.acnMaxSizeInBits;sUnits=t.unitsOfMeasure; rowType = IcdRowType.FieldRow; idxOffset = None}]
    let icd = {IcdArgAux.canBeEmbedded = true; baseAsn1Kind = (getASN1Name t); rowsFunc = icdFnc; commentsForTas=[]; scope="type"; name= None}
    createAcnFunction r lm codec t typeDefinition  isValidFunc  (fun us e acnArgs nestingScope p -> funcBody e acnArgs nestingScope p, us) (fun atc -> true) icd soSparkAnnotations [] us


let getExternalField0 (r:Asn1AcnAst.AstRoot) (deps:Asn1AcnAst.AcnInsertedFieldDependencies) asn1TypeIdWithDependency func1 =
    let dependency = deps.acnDependencies |> List.find(fun d -> d.asn1Type = asn1TypeIdWithDependency && func1 d )
    let rec resolveParam (prmId:ReferenceToType) =
        let nodes = match prmId with ReferenceToType nodes -> nodes
        let lastNode = nodes |> List.rev |> List.head
        match lastNode with
        | PRM prmName   ->
            let newDeterminantId =
                deps.acnDependencies |>
                List.choose(fun d ->
                    match d.dependencyKind with
                    | AcnDepRefTypeArgument prm when prm.id = prmId -> Some d.determinant
                    | _                                             -> None)
            match newDeterminantId with
            | det1::_   -> resolveParam det1.id
            | _         -> prmId
        | _             -> prmId
    getAcnDeterminantName  (resolveParam dependency.determinant.id)

let getExternalField0Type (r: Asn1AcnAst.AstRoot)
                          (deps:Asn1AcnAst.AcnInsertedFieldDependencies)
                          (asn1TypeIdWithDependency: ReferenceToType)
                          (filter: AcnDependency -> bool) : AcnInsertedType =
    let dependency = deps.acnDependencies |> List.find(fun d -> d.asn1Type = asn1TypeIdWithDependency && filter d)
    let nodes = match dependency.determinant.id with ReferenceToType nodes -> nodes
    let lastNode = nodes |> List.rev |> List.head
    match lastNode with
    | PRM _   ->
        let tp =
            deps.acnDependencies |>
            List.choose(fun d ->
                match d.dependencyKind with
                | AcnDepRefTypeArgument prm when prm.id = dependency.determinant.id ->
                    match d.determinant with
                    | AcnChildDeterminant child -> Some child.Type
                    | _ -> None
                | _ -> None)
        match tp with
        | tp :: _ -> tp
        | _ ->
            match dependency.determinant with
            | AcnChildDeterminant child -> child.Type
            | _ -> raise (BugErrorException "???")
    | _ ->
        match dependency.determinant with
        | AcnChildDeterminant child -> child.Type
        | _ -> raise (BugErrorException "???")

let getExternalFieldChoicePresentWhen (r:Asn1AcnAst.AstRoot) (deps:Asn1AcnAst.AcnInsertedFieldDependencies) asn1TypeIdWithDependency  relPath=
    let filterDependency (d:AcnDependency) =
        match d.dependencyKind with
        | AcnDepPresence (relPath0, _)   -> relPath = relPath0
        | _                              -> true
    getExternalField0 r deps asn1TypeIdWithDependency filterDependency

let getExternalFieldTypeChoicePresentWhen (r:Asn1AcnAst.AstRoot) (deps:Asn1AcnAst.AcnInsertedFieldDependencies) asn1TypeIdWithDependency  relPath=
    let filterDependency (d:AcnDependency) =
        match d.dependencyKind with
        | AcnDepPresence (relPath0, _)   -> relPath = relPath0
        | _                              -> true
    getExternalField0Type r deps asn1TypeIdWithDependency filterDependency

let getExternalField (r:Asn1AcnAst.AstRoot) (deps:Asn1AcnAst.AcnInsertedFieldDependencies) asn1TypeIdWithDependency =
    getExternalField0 r deps asn1TypeIdWithDependency (fun z -> true)

let getExternalFieldType (r:Asn1AcnAst.AstRoot) (deps:Asn1AcnAst.AcnInsertedFieldDependencies) asn1TypeIdWithDependency =
    getExternalField0Type r deps asn1TypeIdWithDependency (fun z -> true)

let createStringFunction (r:Asn1AcnAst.AstRoot) (deps:Asn1AcnAst.AcnInsertedFieldDependencies) (lm:LanguageMacros) (codec:CommonTypes.Codec) (t:Asn1AcnAst.Asn1Type) (o:Asn1AcnAst.StringType) (typeDefinition:TypeDefinitionOrReference)  (defOrRef:TypeDefinitionOrReference) (isValidFunc: IsValidFunction option) (uperFunc: UPerFunction) (us:State)  =
    let Acn_String_Ascii_FixSize                            = lm.acn.Acn_String_Ascii_FixSize
    let Acn_String_Ascii_Internal_Field_Determinant         = lm.acn.Acn_String_Ascii_Internal_Field_Determinant
    let Acn_String_Ascii_Null_Terminated                    = lm.acn.Acn_String_Ascii_Null_Terminated
    let Acn_String_Ascii_External_Field_Determinant         = lm.acn.Acn_String_Ascii_External_Field_Determinant
    let Acn_String_CharIndex_External_Field_Determinant     = lm.acn.Acn_String_CharIndex_External_Field_Determinant
    let Acn_IA5String_CharIndex_External_Field_Determinant  = lm.acn.Acn_IA5String_CharIndex_External_Field_Determinant

    let funcBody (errCode:ErrorCode) (acnArgs: (AcnGenericTypes.RelativePath*AcnGenericTypes.AcnParameter) list) (nestingScope: NestingScope) (p:CallerScope) (us:State) =
        let pp, resultExpr = adaptArgument lm codec p
        let td = (lm.lg.getStrTypeDefinition o.typeDef).longTypedefName2 lm.lg.hasModules (ToC p.modName)
        let funcBodyContent, ns =
            match o.acnEncodingClass with
            | Acn_Enc_String_uPER  _                                           -> uperFunc.funcBody_e errCode p |> Option.map(fun x -> x.funcBody, x.errCodes, x.localVariables), us // TODO: Placeholder (uper) ou bien?
            | Acn_Enc_String_uPER_Ascii _                                      ->
                match o.maxSize.uper = o.minSize.uper with
                | true      ->  Some (Acn_String_Ascii_FixSize pp errCode.errCodeName ( o.maxSize.uper) codec, [errCode], []), us
                | false     ->
                    let nSizeInBits = GetNumberOfBitsForNonNegativeInteger ( (o.maxSize.acn - o.minSize.acn))
                    Some (Acn_String_Ascii_Internal_Field_Determinant pp errCode.errCodeName ( o.maxSize.acn) ( o.minSize.acn) nSizeInBits codec , [errCode], []), us
            | Acn_Enc_String_Ascii_Null_Terminated                   (_,nullChars)   -> Some (Acn_String_Ascii_Null_Terminated pp errCode.errCodeName ( o.maxSize.acn) nullChars codec, [errCode], []), us
            | Acn_Enc_String_Ascii_External_Field_Determinant       _    ->
                let extField = getExternalField r deps t.id
                Some(Acn_String_Ascii_External_Field_Determinant pp errCode.errCodeName ( o.maxSize.acn) extField codec, [errCode], []), us
            | Acn_Enc_String_CharIndex_External_Field_Determinant   _    ->
                let extField = getExternalField r deps t.id
                let nBits = GetNumberOfBitsForNonNegativeInteger (BigInteger (o.uperCharSet.Length-1))
                let encDecStatement =
                    match o.uperCharSet.Length = 128 with
                    | false ->
                        let arrAsciiCodes = o.uperCharSet |> Array.map(fun x -> BigInteger (System.Convert.ToInt32 x))
                        Acn_String_CharIndex_External_Field_Determinant pp errCode.errCodeName ( o.maxSize.acn) arrAsciiCodes (BigInteger o.uperCharSet.Length) extField td nBits codec
                    | true  -> Acn_IA5String_CharIndex_External_Field_Determinant pp errCode.errCodeName ( o.maxSize.acn)  extField td nBits codec
                Some(encDecStatement, [errCode], []), us
        match funcBodyContent with
        | None -> None, ns
        | Some (funcBodyContent,errCodes, localVars) ->
            Some ({AcnFuncBodyResult.funcBody = funcBodyContent; errCodes = errCodes; localVariables = localVars; bValIsUnReferenced= false; bBsIsUnReferenced=false; resultExpr=resultExpr; typeEncodingKind = Some (AcnStringEncodingType o.acnEncodingClass)}), ns
    let soSparkAnnotations = Some(sparkAnnotations lm (typeDefinition.longTypedefName2 lm.lg.hasModules) codec)
    let icdFnc fieldName sPresent comments  =
        [{IcdRow.fieldName = fieldName; comments = comments; sPresent=sPresent;sType=(IcdPlainType (getASN1Name t)); sConstraint=None; minLengthInBits = o.acnMinSizeInBits ;maxLengthInBits=o.acnMaxSizeInBits;sUnits=t.unitsOfMeasure; rowType = IcdRowType.FieldRow; idxOffset = None}]
    let icd = {IcdArgAux.canBeEmbedded = true; baseAsn1Kind = (getASN1Name t); rowsFunc = icdFnc; commentsForTas=[]; scope="type"; name= None}
    createAcnFunction r lm codec t typeDefinition  isValidFunc  (fun us e acnArgs nestingScope p -> funcBody e acnArgs nestingScope p us) (fun atc -> true) icd soSparkAnnotations [] us


let createAcnStringFunction (r:Asn1AcnAst.AstRoot) (deps:Asn1AcnAst.AcnInsertedFieldDependencies) (lm:LanguageMacros) (codec:CommonTypes.Codec) (typeId : ReferenceToType) (t:Asn1AcnAst.AcnReferenceToIA5String)  (us:State)  =
    let errCodeName         = ToC ("ERR_ACN" + (codec.suffix.ToUpper()) + "_" + ((typeId.AcnAbsPath |> Seq.skip 1 |> Seq.StrJoin("-")).Replace("#","elm")))
    let errCode, ns = getNextValidErrorCode us errCodeName None
    let Acn_String_Ascii_FixSize                            = lm.acn.Acn_String_Ascii_FixSize
    let Acn_String_Ascii_Internal_Field_Determinant         = lm.acn.Acn_String_Ascii_Internal_Field_Determinant
    let Acn_String_Ascii_Null_Terminated                     = lm.acn.Acn_String_Ascii_Null_Terminated
    let Acn_String_Ascii_External_Field_Determinant         = lm.acn.Acn_String_Ascii_External_Field_Determinant
    let Acn_String_CharIndex_External_Field_Determinant     = lm.acn.Acn_String_CharIndex_External_Field_Determinant
    let Acn_IA5String_CharIndex_External_Field_Determinant  = lm.acn.Acn_IA5String_CharIndex_External_Field_Determinant
    let typeDefinitionName = ToC2(r.args.TypePrefix + t.tasName.Value)

    let o = t.str
    let uper_funcBody (errCode:ErrorCode) (p:CallerScope) =
        let td =
            let md = r.GetModuleByName t.modName
            let tas = md.GetTypeAssignmentByName t.tasName r
            match tas.Type.ActualType.Kind with
            | Asn1AcnAst.IA5String     z -> (lm.lg.getStrTypeDefinition z.typeDef).longTypedefName2 lm.lg.hasModules (ToC p.modName)
            | Asn1AcnAst.NumericString z -> (lm.lg.getStrTypeDefinition z.typeDef).longTypedefName2 lm.lg.hasModules (ToC p.modName)
            | _                           -> raise(SemanticError(t.tasName.Location, (sprintf "Type assignment %s.%s does not point to a string type" t.modName.Value t.modName.Value)))
        let ii = typeId.SequenceOfLevel + 1
        let i = sprintf "i%d" ii
        let lv = SequenceOfIndex (typeId.SequenceOfLevel + 1, None)
        let charIndex =
            match lm.lg.uper.requires_charIndex with
            | false     -> []
            | true   -> [IntegerLocalVariable ("charIndex", None)]
        let nStringLength =
            match o.minSize.uper = o.maxSize.uper with
            | true  -> []
            | false ->[lm.lg.uper.createLv "nStringLength"]
        let InternalItem_string_no_alpha = lm.uper.InternalItem_string_no_alpha
        let InternalItem_string_with_alpha = lm.uper.InternalItem_string_with_alpha
        let str_FixedSize       = lm.uper.str_FixedSize
        let str_VarSize         = lm.uper.str_VarSize
        let initExpr =
            match codec, lm.lg.decodingKind with
            | Decode, Copy -> Some (lm.lg.initializeString (int o.maxSize.uper))
            | _ -> None
        let pp, resultExpr = joinedOrAsIdentifier lm codec p
        let nBits = GetNumberOfBitsForNonNegativeInteger (BigInteger (o.uperCharSet.Length-1))
        let internalItem =
            match o.uperCharSet.Length = 128 with
            | true  -> InternalItem_string_no_alpha pp errCode.errCodeName i  codec
            | false ->
                let nBits = GetNumberOfBitsForNonNegativeInteger (BigInteger (o.uperCharSet.Length-1))
                let arrAsciiCodes = o.uperCharSet |> Array.map(fun x -> BigInteger (System.Convert.ToInt32 x))
                InternalItem_string_with_alpha pp errCode.errCodeName td i (BigInteger (o.uperCharSet.Length-1)) arrAsciiCodes (BigInteger (o.uperCharSet.Length)) nBits  codec
        let nSizeInBits = GetNumberOfBitsForNonNegativeInteger ( (o.maxSize.uper - o.minSize.uper))
        let funcBodyContent, localVariables =
            match o.minSize with
            | _ when o.maxSize.uper < 65536I && o.maxSize.uper=o.minSize.uper  ->
                str_FixedSize pp typeDefinitionName i internalItem ( o.minSize.uper) nBits nBits 0I initExpr codec, charIndex@nStringLength
            | _ when o.maxSize.uper < 65536I && o.maxSize.uper<>o.minSize.uper  ->
                str_VarSize pp typeDefinitionName i internalItem ( o.minSize.uper) ( o.maxSize.uper) nSizeInBits nBits nBits 0I initExpr codec , charIndex@nStringLength
            | _                                                ->
                let funcBodyContent,localVariables = DAstUPer.handleFragmentation lm p codec errCode ii ( o.uperMaxSizeInBits) o.minSize.uper o.maxSize.uper internalItem nBits false true
                funcBodyContent,charIndex@localVariables

        {UPERFuncBodyResult.funcBody = funcBodyContent; errCodes = [errCode]; localVariables = lv::localVariables; bValIsUnReferenced=false; bBsIsUnReferenced=false; resultExpr=resultExpr; typeEncodingKind=Some (AcnStringEncodingType o.acnEncodingClass)}


    let funcBody (errCode:ErrorCode) (acnArgs: (AcnGenericTypes.RelativePath*AcnGenericTypes.AcnParameter) list) (nestingScope: NestingScope) (p:CallerScope) =
        let td = (lm.lg.getStrTypeDefinition o.typeDef).longTypedefName2 lm.lg.hasModules (ToC p.modName)
        let pp, resultExpr = adaptArgument lm codec p
        let funcBodyContent =
            match t.str.acnEncodingClass with
            | Acn_Enc_String_uPER_Ascii    _                                    ->
                match t.str.maxSize.uper = t.str.minSize.uper with
                | true      ->  Some (Acn_String_Ascii_FixSize pp errCode.errCodeName ( t.str.maxSize.uper) codec, [], [])
                | false     ->
                    let nSizeInBits = GetNumberOfBitsForNonNegativeInteger ( (o.maxSize.acn - o.minSize.acn))
                    Some (Acn_String_Ascii_Internal_Field_Determinant pp errCode.errCodeName ( t.str.maxSize.acn) ( t.str.minSize.acn) nSizeInBits codec , [], [])
            | Acn_Enc_String_Ascii_Null_Terminated                  (_, nullChars)   -> Some (Acn_String_Ascii_Null_Terminated pp errCode.errCodeName ( t.str.maxSize.acn) nullChars codec, [], [])
            | Acn_Enc_String_Ascii_External_Field_Determinant       _    ->
                let extField = getExternalField r deps typeId
                Some(Acn_String_Ascii_External_Field_Determinant pp errCode.errCodeName ( t.str.maxSize.acn) extField codec, [], [])
            | Acn_Enc_String_CharIndex_External_Field_Determinant   _    ->
                let extField = getExternalField r deps typeId
                let nBits = GetNumberOfBitsForNonNegativeInteger (BigInteger (t.str.uperCharSet.Length-1))
                let encDecStatement =
                    match t.str.uperCharSet.Length = 128 with
                    | false ->
                        let arrAsciiCodes = t.str.uperCharSet |> Array.map(fun x -> BigInteger (System.Convert.ToInt32 x))
                        Acn_String_CharIndex_External_Field_Determinant pp errCode.errCodeName ( t.str.maxSize.acn) arrAsciiCodes (BigInteger t.str.uperCharSet.Length) extField td nBits codec
                    | true  -> Acn_IA5String_CharIndex_External_Field_Determinant pp errCode.errCodeName ( t.str.maxSize.acn) extField td nBits codec
                Some(encDecStatement, [], [])
            | Acn_Enc_String_uPER    _                                         ->
                let x = (uper_funcBody errCode) p
                Some(x.funcBody, x.errCodes, x.localVariables)
        match funcBodyContent with
        | None -> None
        | Some (funcBodyContent,errCodes, lvs) ->
            Some ({AcnFuncBodyResult.funcBody = funcBodyContent; errCodes = errCode::errCodes |> List.distinct ; localVariables = lvs; bValIsUnReferenced= false; bBsIsUnReferenced=false; resultExpr=resultExpr; typeEncodingKind = Some (AcnStringEncodingType o.acnEncodingClass)})


    (funcBody errCode), ns

let createOctetStringFunction (r:Asn1AcnAst.AstRoot) (deps:Asn1AcnAst.AcnInsertedFieldDependencies) (lm:LanguageMacros) (codec:CommonTypes.Codec) (t:Asn1AcnAst.Asn1Type) (o:Asn1AcnAst.OctetString) (typeDefinition:TypeDefinitionOrReference) (isValidFunc: IsValidFunction option) (uperFunc: UPerFunction) (us:State)  =
    let oct_external_field           = lm.acn.oct_external_field
    let oct_external_field_fix_size  = lm.acn.oct_external_field_fix_size
    let oct_sqf_null_terminated          = lm.acn.oct_sqf_null_terminated
    let fixedSize       = lm.uper.octet_FixedSize
    let varSize         = lm.uper.octet_VarSize
    let InternalItem_oct_str             = lm.uper.InternalItem_oct_str
    let i = sprintf "i%d" (t.id.SequenceOfLevel + 1)
    let lv = SequenceOfIndex (t.id.SequenceOfLevel + 1, None)
    let nAlignSize = 0I;
    let td = typeDefinition.longTypedefName2 lm.lg.hasModules
    let funcBody (errCode:ErrorCode) (acnArgs: (AcnGenericTypes.RelativePath*AcnGenericTypes.AcnParameter) list) (nestingScope: NestingScope) (p:CallerScope) =
        let pp, resultExpr = joinedOrAsIdentifier lm codec p
        let access = lm.lg.getAccess p.arg
        let funcBodyContent =
            match o.acnEncodingClass with
            | SZ_EC_FIXED_SIZE ->
                let fncBody = fixedSize td pp access o.minSize.acn codec
                Some(fncBody, [errCode],[])

            | SZ_EC_LENGTH_EMBEDDED lenSize ->
                let fncBody = varSize td pp access (o.minSize.acn) (o.maxSize.acn) lenSize errCode.errCodeName codec
                let nStringLength =
                    match codec with
                    | Encode -> []
                    | Decode -> [lm.lg.uper.count_var]

                Some(fncBody, [errCode],nStringLength)
            | SZ_EC_ExternalField _ ->
                let extField = getExternalField r deps t.id
                let tp = getExternalFieldType r deps t.id
                let unsigned =
                    match tp with
                    | AcnInsertedType.AcnInteger int -> int.isUnsigned
                    | AcnInsertedType.AcnNullType _ -> true
                    | _ -> raise (BugErrorException "???")
                let fncBody =
                    match o.isFixedSize with
                    | true  -> oct_external_field_fix_size td pp access (if o.minSize.acn=0I then None else Some ( o.minSize.acn)) ( o.maxSize.acn) extField unsigned nAlignSize errCode.errCodeName codec
                    | false -> oct_external_field td pp access (if o.minSize.acn=0I then None else Some ( o.minSize.acn)) ( o.maxSize.acn) extField unsigned nAlignSize errCode.errCodeName codec
                Some(fncBody, [errCode],[])
            | SZ_EC_TerminationPattern bitPattern  ->
                let mod8 = bitPattern.Value.Length % 8
                let suffix = [1 .. mod8] |> Seq.map(fun _ -> "0") |> Seq.StrJoin ""
                let bitPatten8 = bitPattern.Value + suffix
                let byteArray = bitStringValueToByteArray bitPatten8.AsLoc
                let internalItem = InternalItem_oct_str pp access i  errCode.errCodeName codec
                let noSizeMin = if o.minSize.acn=0I then None else Some ( o.minSize.acn)
                let fncBody = oct_sqf_null_terminated pp access i internalItem noSizeMin o.maxSize.acn byteArray bitPattern.Value.Length.AsBigInt errCode.errCodeName  8I 8I codec
                let lv2 =
                    match codec, lm.lg.acn.checkBitPatternPresentResult with
                    | Decode, true    -> [IntegerLocalVariable ("checkBitPatternPresentResult", Some (lm.lg.intValueToString 0I (ASN1SCC_Int8 (-128I, 127I))))]
                    | _            -> []
                Some(fncBody, [errCode],lv::lv2)



        match funcBodyContent with
        | None -> None
        | Some (funcBodyContent,errCodes, localVariables) ->
            Some ({AcnFuncBodyResult.funcBody = funcBodyContent; errCodes = errCodes; localVariables = localVariables; bValIsUnReferenced= false; bBsIsUnReferenced=false; resultExpr=resultExpr; typeEncodingKind = Some (AcnOctetStringEncodingType o.acnEncodingClass)})
    let soSparkAnnotations = Some (sparkAnnotations lm td codec)
    let icdFnc fieldName sPresent comments  =
        [{IcdRow.fieldName = fieldName; comments = comments; sPresent=sPresent;sType=(IcdPlainType (getASN1Name t)); sConstraint=None; minLengthInBits = o.acnMinSizeInBits ;maxLengthInBits=o.acnMaxSizeInBits;sUnits=t.unitsOfMeasure; rowType = IcdRowType.FieldRow; idxOffset = None}]
    let icd = {IcdArgAux.canBeEmbedded = true; baseAsn1Kind = (getASN1Name t); rowsFunc = icdFnc; commentsForTas=[]; scope="type"; name= None}
    createAcnFunction r lm codec t typeDefinition  isValidFunc  (fun us e acnArgs nestingScope p -> funcBody e acnArgs nestingScope p, us) (fun atc -> true) icd soSparkAnnotations [] us
let createBitStringFunction (r:Asn1AcnAst.AstRoot) (deps:Asn1AcnAst.AcnInsertedFieldDependencies) (lm:LanguageMacros) (codec:CommonTypes.Codec) (t:Asn1AcnAst.Asn1Type) (o:Asn1AcnAst.BitString) (typeDefinition:TypeDefinitionOrReference)  (isValidFunc: IsValidFunction option) (uperFunc: UPerFunction) (us:State)  =
    let nAlignSize = 0I;
    let bitString_FixSize = lm.uper.bitString_FixSize
    let bitString_VarSize = lm.uper.bitString_VarSize

    let td = typeDefinition.longTypedefName2 lm.lg.hasModules
    let funcBody (errCode:ErrorCode) (acnArgs: (AcnGenericTypes.RelativePath*AcnGenericTypes.AcnParameter) list) (nestingScope: NestingScope) (p:CallerScope) =
        let pp, resultExpr = joinedOrAsIdentifier lm codec p
        let access = lm.lg.getAccess p.arg
        let funcBodyContent =
            match o.acnEncodingClass with
            | SZ_EC_ExternalField   _    ->
                let extField = getExternalField r deps t.id
                let fncBody =
                    match o.minSize.uper = o.maxSize.uper with
                    | true  -> lm.acn.bit_string_external_field_fixed_size td pp errCode.errCodeName access (if o.minSize.acn=0I then None else Some ( o.minSize.acn)) ( o.maxSize.acn) extField codec
                    | false  -> lm.acn.bit_string_external_field td pp errCode.errCodeName access (if o.minSize.acn=0I then None else Some ( o.minSize.acn)) ( o.maxSize.acn) extField codec
                Some (fncBody, [errCode], [])
            | SZ_EC_TerminationPattern   bitPattern    ->
                let mod8 = bitPattern.Value.Length % 8
                let suffix = [1 .. mod8] |> Seq.map(fun _ -> "0") |> Seq.StrJoin ""
                let bitPatten8 = bitPattern.Value + suffix
                let byteArray = bitStringValueToByteArray bitPatten8.AsLoc
                let i = sprintf "i%d" (t.id.SequenceOfLevel + 1)
                let lv = SequenceOfIndex (t.id.SequenceOfLevel + 1, None)
                let fncBody = lm.acn.bit_string_null_terminated td pp errCode.errCodeName access i (if o.minSize.acn=0I then None else Some ( o.minSize.acn)) ( o.maxSize.acn) byteArray bitPattern.Value.Length.AsBigInt codec
                Some (fncBody, [errCode], [])
            | SZ_EC_FIXED_SIZE       ->
                let fncBody = bitString_FixSize td pp access o.minSize.acn errCode.errCodeName codec
                Some(fncBody, [errCode],[])

            | SZ_EC_LENGTH_EMBEDDED nSizeInBits ->
                let fncBody =
                    bitString_VarSize td pp access o.minSize.acn o.maxSize.acn errCode.errCodeName nSizeInBits codec
                let nStringLength =
                    match codec with
                    | Encode -> []
                    | Decode -> [lm.lg.uper.count_var]
                Some(fncBody, [errCode],nStringLength)
        match funcBodyContent with
        | None -> None
        | Some (funcBodyContent,errCodes, localVariables) ->
            Some ({AcnFuncBodyResult.funcBody = funcBodyContent; errCodes = errCodes; localVariables = localVariables; bValIsUnReferenced= false; bBsIsUnReferenced=false; resultExpr=resultExpr; typeEncodingKind=Some (AcnBitStringEncodingType o.acnEncodingClass)})
    let soSparkAnnotations = Some(sparkAnnotations lm td codec)
    let icdFnc fieldName sPresent comments  =
        [{IcdRow.fieldName = fieldName; comments = comments; sPresent=sPresent;sType=(IcdPlainType (getASN1Name t)); sConstraint=None; minLengthInBits = o.acnMinSizeInBits ;maxLengthInBits=o.acnMaxSizeInBits;sUnits=t.unitsOfMeasure; rowType = IcdRowType.FieldRow; idxOffset = None}]
    let icd = {IcdArgAux.canBeEmbedded = true; baseAsn1Kind = (getASN1Name t); rowsFunc = icdFnc; commentsForTas=[]; scope="type"; name= None}
    createAcnFunction r lm codec t typeDefinition  isValidFunc  (fun us e acnArgs nestingScope p -> funcBody e acnArgs nestingScope p, us) (fun atc -> true) icd soSparkAnnotations [] us

let createSequenceOfFunction (r:Asn1AcnAst.AstRoot) (deps:Asn1AcnAst.AcnInsertedFieldDependencies) (lm:LanguageMacros) (codec:CommonTypes.Codec) (t:Asn1AcnAst.Asn1Type) (o:Asn1AcnAst.SequenceOf) (typeDefinition:TypeDefinitionOrReference) (isValidFunc: IsValidFunction option)  (child:Asn1Type) (us:State)  =
    let oct_sqf_null_terminated = lm.acn.oct_sqf_null_terminated
    let oct_sqf_external_field_fix_size = lm.acn.sqf_external_field_fix_size
    let external_field          = lm.acn.sqf_external_field
    let fixedSize               = lm.uper.seqOf_FixedSize
    let varSize                 = lm.uper.seqOf_VarSize

    let ii = t.id.SequenceOfLevel + 1

    let i = sprintf "i%d" ii
    let lv =
        match o.acnEncodingClass with
        | SZ_EC_FIXED_SIZE
        | SZ_EC_LENGTH_EMBEDDED _ //-> lm.lg.uper.seqof_lv t.id o.minSize.uper o.maxSize.uper
        | SZ_EC_ExternalField       _
        | SZ_EC_TerminationPattern  _ -> [SequenceOfIndex (t.id.SequenceOfLevel + 1, None)]

    let nAlignSize = 0I;
    let nIntItemMaxSize = child.acnMaxSizeInBits
    let td = typeDefinition.longTypedefName2 lm.lg.hasModules
    let funcBody (us:State) (errCode:ErrorCode) (acnArgs: (AcnGenericTypes.RelativePath*AcnGenericTypes.AcnParameter) list) (nestingScope: NestingScope) (p:CallerScope) =
        let pp, resultExpr = joinedOrAsIdentifier lm codec p
        // `childInitExpr` is used to initialize the array of elements in which we will write their decoded values
        // It is only meaningful for "Copy" decoding kind, since InPlace will directly modify `p`'s array
        let childInitExpr = DAstInitialize.getChildExpression lm child
        let access = lm.lg.getAccess p.arg
        match child.getAcnFunction codec with
        | None         -> None, us
        | Some chFunc  ->
            let childNestingScope = {nestingScope with nestingLevel = nestingScope.nestingLevel + 1}
            let internalItem, ns = chFunc.funcBody us acnArgs childNestingScope ({p with arg = lm.lg.getArrayItem p.arg i child.isIA5String})
            let ret =
                match o.acnEncodingClass with
                | SZ_EC_FIXED_SIZE
                | SZ_EC_LENGTH_EMBEDDED _ ->
                    let nSizeInBits = GetNumberOfBitsForNonNegativeInteger ( (o.maxSize.acn - o.minSize.acn))
                    let nStringLength =
                        match o.minSize.uper = o.maxSize.uper,  codec with
                        | true , _    -> []
                        | false, Encode -> []
                        | false, Decode -> [lm.lg.uper.count_var]

                    match internalItem with
                    | None  ->
                        match o.isFixedSize with
                        | true  -> None
                        | false ->
                            let funcBody = varSize pp access td i "" o.minSize.acn o.maxSize.acn nSizeInBits child.acnMinSizeInBits nIntItemMaxSize 0I childInitExpr errCode.errCodeName codec
                            Some ({AcnFuncBodyResult.funcBody = funcBody; errCodes = [errCode]; localVariables = lv@nStringLength; bValIsUnReferenced= false; bBsIsUnReferenced=false; resultExpr=resultExpr; typeEncodingKind=None})

                    | Some internalItem ->
                        let childErrCodes =  internalItem.errCodes
                        let ret, localVariables =
                            match o.isFixedSize with
                            | true   -> fixedSize pp td i internalItem.funcBody o.minSize.acn child.acnMinSizeInBits nIntItemMaxSize 0I childInitExpr codec, nStringLength
                            | false  -> varSize pp access td i internalItem.funcBody o.minSize.acn o.maxSize.acn nSizeInBits child.acnMinSizeInBits nIntItemMaxSize 0I childInitExpr errCode.errCodeName codec, nStringLength
                        let typeEncodingKind = internalItem.typeEncodingKind |> Option.map (fun tpe -> TypeEncodingKind.SequenceOfEncodingType (tpe, o.acnEncodingClass))
                        Some ({AcnFuncBodyResult.funcBody = ret; errCodes = errCode::childErrCodes; localVariables = lv@(internalItem.localVariables@localVariables); bValIsUnReferenced= false; bBsIsUnReferenced=false; resultExpr=resultExpr; typeEncodingKind=typeEncodingKind})

                | SZ_EC_ExternalField   _    ->
                    match internalItem with
                    | None  -> None
                    | Some internalItem ->
                        let localVariables = internalItem.localVariables
                        let childErrCodes = internalItem.errCodes
                        let internalItemBody = internalItem.funcBody
                        let extField = getExternalField r deps t.id
                        let tp = getExternalFieldType r deps t.id
                        let unsigned =
                            match tp with
                            | AcnInsertedType.AcnInteger int -> int.isUnsigned
                            | AcnInsertedType.AcnNullType _ -> true
                            | _ -> raise (BugErrorException "???")
                        let internalItemBody =
                            match codec, lm.lg.decodingKind with
                            | Decode, Copy ->
                                assert internalItem.resultExpr.IsSome
                                internalItemBody + "\n" + (lm.uper.update_array_item pp i internalItem.resultExpr.Value)
                            | _ -> internalItemBody
                        let funcBodyContent =
                            match o.isFixedSize with
                            | true  -> oct_sqf_external_field_fix_size td pp access i internalItemBody (if o.minSize.acn=0I then None else Some o.minSize.acn) o.maxSize.acn extField unsigned nAlignSize errCode.errCodeName o.child.acnMinSizeInBits o.child.acnMaxSizeInBits childInitExpr codec
                            | false -> external_field td pp access i internalItemBody (if o.minSize.acn=0I then None else Some o.minSize.acn) o.maxSize.acn extField unsigned nAlignSize errCode.errCodeName o.child.acnMinSizeInBits o.child.acnMaxSizeInBits childInitExpr codec
                        let typeEncodingKind = internalItem.typeEncodingKind |> Option.map (fun tpe -> TypeEncodingKind.SequenceOfEncodingType (tpe, o.acnEncodingClass))
                        Some ({AcnFuncBodyResult.funcBody = funcBodyContent; errCodes = errCode::childErrCodes; localVariables = lv@localVariables; bValIsUnReferenced= false; bBsIsUnReferenced=false; resultExpr=resultExpr; typeEncodingKind=typeEncodingKind})
                | SZ_EC_TerminationPattern   bitPattern    ->
                    match internalItem with
                    | None  -> None
                    | Some internalItem ->
                        let mod8 = bitPattern.Value.Length % 8
                        let suffix = [1 .. mod8] |> Seq.map(fun _ -> "0") |> Seq.StrJoin ""
                        let bitPatten8 = bitPattern.Value + suffix
                        let byteArray = bitStringValueToByteArray bitPatten8.AsLoc
                        let localVariables  = internalItem.localVariables
                        let childErrCodes   = internalItem.errCodes
                        let internalItemBody    = internalItem.funcBody
                        let noSizeMin = if o.minSize.acn=0I then None else Some ( o.minSize.acn)
                        let internalItemBody =
                            match codec, lm.lg.decodingKind with
                            | Decode, Copy ->
                                assert internalItem.resultExpr.IsSome
                                internalItemBody + "\n" + (lm.uper.update_array_item pp i internalItem.resultExpr.Value)
                            | _ -> internalItemBody
                        let funcBodyContent = oct_sqf_null_terminated pp access i internalItemBody noSizeMin o.maxSize.acn byteArray bitPattern.Value.Length.AsBigInt errCode.errCodeName o.child.acnMinSizeInBits o.child.acnMaxSizeInBits codec

                        let lv2 =
                            match codec, lm.lg.acn.checkBitPatternPresentResult with
                            | Decode, true    -> [IntegerLocalVariable ("checkBitPatternPresentResult", Some (lm.lg.intValueToString 0I (ASN1SCC_Int8 (-128I, 127I))))]
                            | _            -> []

                        let typeEncodingKind = internalItem.typeEncodingKind |> Option.map (fun tpe -> TypeEncodingKind.SequenceOfEncodingType (tpe, o.acnEncodingClass))
                        Some ({AcnFuncBodyResult.funcBody = funcBodyContent; errCodes = errCode::childErrCodes; localVariables = lv2@lv@localVariables; bValIsUnReferenced= false; bBsIsUnReferenced=false; resultExpr=None; typeEncodingKind=typeEncodingKind})
            ret,ns
    let soSparkAnnotations = Some(sparkAnnotations lm td codec)

    let icdFnc fieldName sPresent comments  =
        let x = child.icdFunction

        let lengthRow, terminationPattern =
            match o.acnEncodingClass with
            | SZ_EC_LENGTH_EMBEDDED _ ->
                let nSizeInBits = GetNumberOfBitsForNonNegativeInteger ( (o.maxSize.acn - o.minSize.acn))
                [{IcdRow.fieldName = "Length"; comments = [$"The number of items"]; sPresent="always";sType=IcdPlainType "INTEGER"; sConstraint=None; minLengthInBits = nSizeInBits ;maxLengthInBits=nSizeInBits;sUnits=None; rowType = IcdRowType.LengthDeterminantRow; idxOffset = Some 1}], []
            | SZ_EC_FIXED_SIZE
            | SZ_EC_ExternalField       _ -> [], []
            | SZ_EC_TerminationPattern  bitPattern ->
                let nSizeInBits = bitPattern.Value.Length.AsBigInt
                [], [{IcdRow.fieldName = "Length"; comments = [$"Termination pattern {bitPattern.Value}"]; sPresent="always";sType=IcdPlainType "INTEGER"; sConstraint=None; minLengthInBits = nSizeInBits ;maxLengthInBits=nSizeInBits;sUnits=None; rowType = IcdRowType.LengthDeterminantRow; idxOffset = Some (int (o.maxSize.acn+1I))}]
        match x.canBeEmbedded with
        | true ->
            let chRows = (x.createRowsFunc "Item #1" "always" []) |> List.map(fun r -> {r with idxOffset = Some (lengthRow.Length + 1)})
            let lastChRows = chRows |> List.map(fun r -> {r with fieldName = $"Item #{o.maxSize.acn}"; idxOffset = Some ((int o.maxSize.acn)+lengthRow.Length)})
            lengthRow@chRows@[THREE_DOTS]@lastChRows@terminationPattern
        | false ->
            let sType = TypeHash x.typeAss.hash
            let a1 = {IcdRow.fieldName = fieldName; comments = comments; sPresent=sPresent;sType=sType; sConstraint=None; minLengthInBits = t.acnMinSizeInBits; maxLengthInBits=t.acnMaxSizeInBits;sUnits=None; rowType = IcdRowType.LengthDeterminantRow; idxOffset = Some (lengthRow.Length + 1)}
            let a2 = {a1 with idxOffset = Some ((int o.maxSize.acn)+lengthRow.Length)}
            [a1;THREE_DOTS;a2]

    let sExtraComment =
        match o.acnEncodingClass with
        | Asn1AcnAst.SZ_EC_FIXED_SIZE                    -> $"Length is fixed to {o.maxSize.acn} elements (no length determinant is needed)."
        | Asn1AcnAst.SZ_EC_LENGTH_EMBEDDED _             -> if o.maxSize.acn <2I then "The array contains a single element." else ""
        | Asn1AcnAst.SZ_EC_ExternalField relPath         ->  $"Length is determined by the external field: %s{relPath.AsString}"
        | Asn1AcnAst.SZ_EC_TerminationPattern bitPattern ->  $"Length is determined by the stop marker '%s{bitPattern.Value}'"



    let icd = {IcdArgAux.canBeEmbedded = false; baseAsn1Kind = (getASN1Name t); rowsFunc = icdFnc; commentsForTas=[sExtraComment]; scope="type"; name= None}
    createAcnFunction r lm codec t typeDefinition  isValidFunc  funcBody (fun atc -> true) icd soSparkAnnotations [] us

let initExpr (r:Asn1AcnAst.AstRoot) (lm:LanguageMacros) (m:Asn1AcnAst.Asn1Module) (t: Asn1AcnAst.AcnInsertedType): string =
    match t with
    | AcnInteger int -> lm.lg.asn1SccIntValueToString 0I int.isUnsigned
    | AcnNullType _ -> lm.lg.asn1SccIntValueToString 0I true
    | AcnBoolean _ -> lm.lg.FalseLiteral
    | AcnReferenceToIA5String s -> lm.lg.initializeString (int s.str.maxSize.uper)
    | AcnReferenceToEnumerated e ->
        lm.lg.getNamedItemBackendName (Some (defOrRef r m e)) e.enumerated.items.Head

let rec handleSingleUpdateDependency (r:Asn1AcnAst.AstRoot) (deps:Asn1AcnAst.AcnInsertedFieldDependencies) (lm:LanguageMacros) (m:Asn1AcnAst.Asn1Module) (d:AcnDependency)  (us:State) =
    let presenceDependency              = lm.acn.PresenceDependency
    let sizeDependency                  = lm.acn.SizeDependency
    let sizeDependencyFixedSize         = lm.acn.SizeDependencyFixedSize
    let sizeDep_oct_str_containing      = lm.acn.SizeDependency_oct_str_containing
    let getSizeableSize                 = lm.acn.getSizeableSize
    let getStringSize                   = lm.acn.getStringSize
    let choiceDependencyPres            = lm.acn.ChoiceDependencyPres
    let choiceDependencyIntPres_child   = lm.acn.ChoiceDependencyIntPres_child
    let choiceDependencyStrPres_child   = lm.acn.ChoiceDependencyStrPres_child
    let choiceDependencyEnum            = lm.acn.ChoiceDependencyEnum
    let choiceDependencyEnum_Item       = lm.acn.ChoiceDependencyEnum_Item
    let checkAccessPath                 = lm.acn.checkAccessPath

    match d.dependencyKind with
    | AcnDepRefTypeArgument           acnPrm   ->
        let prmUpdateStatement, ns1 = getUpdateFunctionUsedInEncoding r deps lm m acnPrm.id us
        match prmUpdateStatement with
        | None  -> None, ns1
        | Some prmUpdateStatement   ->
            let updateFunc (child: AcnChild) (nestingScope: NestingScope) (vTarget : CallerScope) (pSrcRoot : CallerScope)  =
                prmUpdateStatement.updateAcnChildFnc child nestingScope vTarget pSrcRoot

            Some ({AcnChildUpdateResult.updateAcnChildFnc = updateFunc; errCodes=prmUpdateStatement.errCodes; testCaseFnc = prmUpdateStatement.testCaseFnc; localVariables=[]}), ns1
    | AcnDepSizeDeterminant (minSize, maxSize, szAcnProp)        ->
        let updateFunc (child: AcnChild) (nestingScope: NestingScope) (vTarget : CallerScope) (pSrcRoot : CallerScope)  =
            let v = lm.lg.getValue vTarget.arg
            let pSizeable, checkPath = getAccessFromScopeNodeList d.asn1Type false lm pSrcRoot
            let unsigned =
                match child.Type with
                | AcnInteger int -> int.isUnsigned
                | AcnNullType _ -> true
                | _ -> raise (BugErrorException "???")
            let updateStatement =
                match minSize.acn = maxSize.acn with
                | true  -> sizeDependencyFixedSize v minSize.acn
                | false -> sizeDependency v (getSizeableSize (pSizeable.arg.joined lm.lg) (lm.lg.getAccess pSizeable.arg) unsigned) minSize.uper maxSize.uper false child.typeDefinitionBodyWithinSeq
            match checkPath with
            | []    -> updateStatement
            | _     -> checkAccessPath checkPath updateStatement v (initExpr r lm m child.Type)
        let testCaseFnc (atc:AutomaticTestCase) : TestCaseValue option =
            atc.testCaseTypeIDsMap.TryFind d.asn1Type

        Some ({AcnChildUpdateResult.updateAcnChildFnc = updateFunc; errCodes=[]; testCaseFnc=testCaseFnc; localVariables=[]}), us
    | AcnDepSizeDeterminant_bit_oct_str_contain  o       ->
        let baseTypeDefinitionName =
            match lm.lg.hasModules with
            | false     -> ToC2(r.args.TypePrefix + o.tasName.Value)
            | true   ->
                match m.Name.Value = o.modName.Value with
                | true  -> ToC2(r.args.TypePrefix + o.tasName.Value)
                | false -> (ToC o.modName.Value) + "." + ToC2(r.args.TypePrefix + o.tasName.Value)
        let baseFncName = baseTypeDefinitionName + "_ACN" + Encode.suffix
        let sReqBytesForUperEncoding = sprintf "%s_REQUIRED_BYTES_FOR_ACN_ENCODING" baseTypeDefinitionName
        let asn1TypeD = us.newTypesMap[d.asn1Type] :?> Asn1Type
        let asn1TypeD = match asn1TypeD.Kind with ReferenceType  o -> o.resolvedType.ActualType | _  -> asn1TypeD
        let errCodes0, localVariables0, ns =
            match asn1TypeD.acnEncFunction with
            | Some f  ->
                let fncBdRes, ns = f.funcBody us [] (NestingScope.init asn1TypeD.acnMaxSizeInBits asn1TypeD.uperMaxSizeInBits) {CallerScope.modName = ""; arg = Selection.valueEmptyPath "dummy"}
                match fncBdRes with
                | Some x -> x.errCodes, x.localVariables, ns
                | None   -> [], [], us
            | None    -> [], [], us

        let updateFunc (child: AcnChild) (nestingScope: NestingScope) (vTarget : CallerScope) (pSrcRoot : CallerScope)  =
            let v = lm.lg.getValue vTarget.arg
            let pSizeable, checkPath = getAccessFromScopeNodeList d.asn1Type false lm pSrcRoot
            let sComment=
                match asn1TypeD.acnEncFunction with
                | Some f  ->
                    let fncBdRes, _ = f.funcBody us [] nestingScope pSizeable
                    match fncBdRes with
                    | None -> ""
                    | Some a -> a.funcBody
                | None -> ""

            let updateStatement = sizeDep_oct_str_containing (lm.lg.getParamValue o.resolvedType pSizeable.arg Encode) baseFncName sReqBytesForUperEncoding v (match o.encodingOptions with Some eo -> eo.octOrBitStr = ContainedInOctString | None -> false) sComment
            match checkPath with
            | []    -> updateStatement
            | _     -> checkAccessPath checkPath updateStatement v (initExpr r lm m child.Type)
        let testCaseFnc (atc:AutomaticTestCase) : TestCaseValue option =
            atc.testCaseTypeIDsMap.TryFind d.asn1Type
        let localVars = lm.lg.acn.getAcnDepSizeDeterminantLocVars sReqBytesForUperEncoding

        Some ({AcnChildUpdateResult.updateAcnChildFnc = updateFunc; errCodes=errCodes0; testCaseFnc=testCaseFnc; localVariables= localVariables0@localVars}), ns
    | AcnDepIA5StringSizeDeterminant (minSize, maxSize, szAcnProp)   ->

        let updateFunc (child: AcnChild) (nestingScope: NestingScope) (vTarget : CallerScope) (pSrcRoot : CallerScope)  =
            let v = lm.lg.getValue vTarget.arg
            let pSizeable, checkPath = getAccessFromScopeNodeList d.asn1Type true lm pSrcRoot
            let updateStatement = sizeDependency v (getStringSize (pSizeable.arg.joined lm.lg))  minSize.uper maxSize.uper true child.typeDefinitionBodyWithinSeq
            match checkPath with
            | []    -> updateStatement
            | _     -> checkAccessPath checkPath updateStatement v (initExpr r lm m child.Type)
        let testCaseFnc (atc:AutomaticTestCase) : TestCaseValue option =
            atc.testCaseTypeIDsMap.TryFind d.asn1Type
        Some ({AcnChildUpdateResult.updateAcnChildFnc = updateFunc; errCodes=[]; testCaseFnc=testCaseFnc; localVariables=[]}), us
    | AcnDepPresenceBool              ->
        let updateFunc (child: AcnChild) (nestingScope: NestingScope) (vTarget : CallerScope) (pSrcRoot : CallerScope)  =
            let v = lm.lg.getValue vTarget.arg
            let parDecTypeSeq =
                match d.asn1Type with
                | ReferenceToType (nodes) -> ReferenceToType (nodes |> List.rev |> List.tail |> List.rev)
            let pDecParSeq, checkPath = getAccessFromScopeNodeList parDecTypeSeq false lm pSrcRoot
            let updateStatement = presenceDependency v (pDecParSeq.arg.joined lm.lg) (lm.lg.getAccess pDecParSeq.arg) (ToC d.asn1Type.lastItem)
            match checkPath with
            | []    -> updateStatement
            | _     -> checkAccessPath checkPath updateStatement v (initExpr r lm m child.Type)
        let testCaseFnc (atc:AutomaticTestCase) : TestCaseValue option =
            match atc.testCaseTypeIDsMap.TryFind(d.asn1Type) with
            | Some _    -> Some TcvComponentPresent
            | None      -> Some TcvComponentAbsent
        Some ({AcnChildUpdateResult.updateAcnChildFnc = updateFunc; errCodes=[]; testCaseFnc=testCaseFnc; localVariables=[]}), us
    | AcnDepPresence   (relPath, chc)               ->
        let updateFunc (child: AcnChild) (nestingScope: NestingScope) (vTarget : CallerScope) (pSrcRoot : CallerScope)  =
            let v = lm.lg.getValue vTarget.arg
            let choicePath, checkPath = getAccessFromScopeNodeList d.asn1Type false lm pSrcRoot
            let arrsChildUpdates =
                chc.children |>
                List.map(fun ch ->
                    let pres = ch.acnPresentWhenConditions |> Seq.find(fun x -> x.relativePath = relPath)
                    let presentWhenName = lm.lg.getChoiceChildPresentWhenName chc ch
                    let unsigned =
                        match child.Type with
                        | AcnInteger int -> int.isUnsigned
                        | AcnNullType _ -> true
                        | _ -> raise (BugErrorException "???")
                    match pres with
                    | PresenceInt   (_, intVal) -> choiceDependencyIntPres_child v presentWhenName (lm.lg.asn1SccIntValueToString intVal.Value unsigned)
                    | PresenceStr   (_, strVal) -> raise(SemanticError(strVal.Location, "Unexpected presence condition. Expected integer, found string")))
            let updateStatement = choiceDependencyPres v (choicePath.arg.joined lm.lg) (lm.lg.getAccess choicePath.arg) arrsChildUpdates
            match checkPath with
            | []    -> updateStatement
            | _     -> checkAccessPath checkPath updateStatement v (initExpr r lm m child.Type)
        let testCaseFnc (atc:AutomaticTestCase) : TestCaseValue option =
            let updateValues =
                chc.children |>
                List.filter(fun ch -> atc.testCaseTypeIDsMap.ContainsKey ch.Type.id) |>
                List.choose(fun ch ->
                    let pres = ch.acnPresentWhenConditions |> Seq.find(fun x -> x.relativePath = relPath)
                    match pres with
                    | PresenceInt   (_, intVal) -> Some (TcvChoiceAlternativePresentWhenInt intVal.Value)
                    | PresenceStr   (_, strVal) -> None)
            match updateValues with
            | v1::[]    -> Some v1
            | _         -> None
        Some ({AcnChildUpdateResult.updateAcnChildFnc = updateFunc; errCodes=[] ; testCaseFnc=testCaseFnc; localVariables=[]}), us
    | AcnDepPresenceStr   (relPath, chc, str)               ->
        let updateFunc (child: AcnChild) (nestingScope: NestingScope) (vTarget : CallerScope) (pSrcRoot : CallerScope)  =
            let v = lm.lg.getValue vTarget.arg
            let choicePath, checkPath = getAccessFromScopeNodeList d.asn1Type false lm pSrcRoot
            let arrsChildUpdates =
                chc.children |>
                List.map(fun ch ->
                    let pres = ch.acnPresentWhenConditions |> Seq.find(fun x -> x.relativePath = relPath)
                    let presentWhenName = lm.lg.getChoiceChildPresentWhenName chc ch
                    match pres with
                    | PresenceInt   (_, intVal) ->
                        raise(SemanticError(intVal.Location, "Unexpected presence condition. Expected string, found integer"))
                    | PresenceStr   (_, strVal) ->
                        let arrNulls = [0 .. ((int str.maxSize.acn)- strVal.Value.Length)]|>Seq.map(fun x -> lm.vars.PrintStringValueNull())
                        let bytesStr = Array.append (System.Text.Encoding.ASCII.GetBytes strVal.Value) [| 0uy |]
                        choiceDependencyStrPres_child v presentWhenName strVal.Value bytesStr arrNulls)
            let updateStatement = choiceDependencyPres v (choicePath.arg.joined lm.lg) (lm.lg.getAccess choicePath.arg) arrsChildUpdates
            match checkPath with
            | []    -> updateStatement
            | _     -> checkAccessPath checkPath updateStatement v (initExpr r lm m child.Type)
        let testCaseFnc (atc:AutomaticTestCase) : TestCaseValue option =
            let updateValues =
                chc.children |>
                List.filter(fun ch -> atc.testCaseTypeIDsMap.ContainsKey ch.Type.id) |>
                List.choose(fun ch ->
                    let pres = ch.acnPresentWhenConditions |> Seq.find(fun x -> x.relativePath = relPath)
                    match pres with
                    | PresenceInt   (_, intVal) -> None
                    | PresenceStr   (_, strVal) -> Some (TcvChoiceAlternativePresentWhenStr strVal.Value))
            match updateValues with
            | v1::[]    -> Some v1
            | _         -> None
        Some ({AcnChildUpdateResult.updateAcnChildFnc = updateFunc; errCodes=[]; testCaseFnc = testCaseFnc; localVariables=[]}), us
    | AcnDepChoiceDeterminant (enm, chc, isOptional) ->
        let updateFunc (child: AcnChild) (nestingScope: NestingScope) (vTarget : CallerScope) (pSrcRoot : CallerScope)  =
            let v = lm.lg.getValue vTarget.arg
            let choicePath, checkPath = getAccessFromScopeNodeList d.asn1Type false lm pSrcRoot
            let arrsChildUpdates =
                chc.children |>
                List.map(fun ch ->
                    let enmItem = enm.enm.items |> List.find(fun itm -> itm.Name.Value = ch.Name.Value)
                    let choiceName = chc.typeDef[Scala].typeName
                    choiceDependencyEnum_Item v ch.presentWhenName choiceName (lm.lg.getNamedItemBackendName (Some (defOrRef2 r m enm)) enmItem) isOptional)
            let updateStatement = choiceDependencyEnum v (choicePath.arg.joined lm.lg) (lm.lg.getAccess choicePath.arg) arrsChildUpdates isOptional (initExpr r lm m child.Type)
            // TODO: To remove this, getAccessFromScopeNodeList should be accounting for languages that rely on pattern matching for
            // accessing enums fields instead of a compiler-unchecked access
            let updateStatement2 =
                match ST.lang with
                | Scala ->
                    match checkPath.Length > 0 && checkPath[0].Contains("isInstanceOf") with
                    | true -> (sprintf "val %s = %s.%s\n%s" (choicePath.arg.joined lm.lg) (checkPath[0].Replace("isInstanceOf", "asInstanceOf")) (choicePath.arg.joined lm.lg) updateStatement)
                    | false -> updateStatement
                | _ -> updateStatement
            match checkPath with
            | []    -> updateStatement2
            | _     -> checkAccessPath checkPath updateStatement2 v (initExpr r lm m child.Type)
        let testCaseFnc (atc:AutomaticTestCase) : TestCaseValue option =
            atc.testCaseTypeIDsMap.TryFind d.asn1Type
        Some ({AcnChildUpdateResult.updateAcnChildFnc = updateFunc; errCodes=[] ; testCaseFnc=testCaseFnc; localVariables=[]}), us

and getUpdateFunctionUsedInEncoding (r: Asn1AcnAst.AstRoot) (deps: Asn1AcnAst.AcnInsertedFieldDependencies) (lm: LanguageMacros) (m: Asn1AcnAst.Asn1Module) (acnChildOrAcnParameterId) (us:State) : (AcnChildUpdateResult option*State)=
    let multiAcnUpdate       = lm.acn.MultiAcnUpdate

    match deps.acnDependencies |> List.filter(fun d -> d.determinant.id = acnChildOrAcnParameterId) with
    | []  ->
        None, us
    | d1::[]    ->
        let ret, ns = handleSingleUpdateDependency r deps lm m d1 us
        ret, ns
    | d1::dds         ->
        let _errCodeName = ToC ("ERR_ACN" + (Encode.suffix.ToUpper()) + "_UPDATE_" + ((acnChildOrAcnParameterId.AcnAbsPath |> Seq.skip 1 |> Seq.StrJoin("-")).Replace("#","elm")))
        let errCode, us = getNextValidErrorCode us _errCodeName None

        let ds = d1::dds
        let c_name0 = sprintf "%s%02d" (getAcnDeterminantName acnChildOrAcnParameterId) 0
        let localVars (child: AcnChild) =
            ds |>
            List.mapi(fun i d1 ->
                let c_name = sprintf "%s%02d" (getAcnDeterminantName acnChildOrAcnParameterId) i
                let childLv =
                    if lm.lg.decodingKind = Copy then []
                    else [AcnInsertedChild (c_name, child.typeDefinitionBodyWithinSeq, child.initExpression)]
                let initLv =
                    if lm.lg.usesWrappedOptional then []
                    else [BooleanLocalVariable (c_name+"_is_initialized", Some lm.lg.FalseLiteral)]
                childLv@initLv) |>
            List.collect(fun lvList -> lvList |> List.map (fun lv -> lm.lg.getLocalVariableDeclaration  lv))
        let localUpdateFuns,ns =
            ds |>
            List.fold(fun (updates, ns) d1 ->
                let f1, nns = handleSingleUpdateDependency r deps lm m d1 ns
                updates@[f1], nns) ([],us)
        let restErrCodes = localUpdateFuns |> List.choose id |> List.collect(fun z -> z.errCodes)
        let restLocalVariables = localUpdateFuns |> List.choose id |> List.collect(fun z -> z.localVariables)
        let multiUpdateFunc (child: AcnChild) (nestingScope: NestingScope) (vTarget : CallerScope) (pSrcRoot : CallerScope)  =
            let v = lm.lg.getValue vTarget.arg
            let arrsLocalUpdateStatements =
                localUpdateFuns |>
                List.mapi(fun i fn ->
                    let c_name = sprintf "%s%02d" (getAcnDeterminantName acnChildOrAcnParameterId) i
                    let lv = {CallerScope.modName = vTarget.modName; arg = Selection.valueEmptyPath c_name}
                    match fn with
                    | None      -> None
                    | Some fn   -> Some(fn.updateAcnChildFnc child nestingScope lv pSrcRoot)) |> // TODO: nestingScope?
                List.choose id

            let isAlwaysInit (d: AcnDependency): bool =
                match d.dependencyKind with
                | AcnDepRefTypeArgument p ->
                    // last item is the determinant, and the second-to-last is the field referencing the determinant
                    not p.id.dropLast.lastItemIsOptional
                | AcnDepChoiceDeterminant (_, c, isOpt) -> not isOpt
                | _ -> true

            let firstAlwaysInit = ds |> List.tryFind isAlwaysInit
            let arrsGetFirstIntValue =
                let ds2 =
                    match firstAlwaysInit with
                    | Some fst when lm.lg.usesWrappedOptional -> [fst]
                    | _ -> ds
                ds2 |>
                List.mapi (fun i d ->
                    let cmp = getDeterminantTypeUpdateMacro lm d.determinant
                    let vi = sprintf "%s%02d" (getAcnDeterminantName acnChildOrAcnParameterId) i
                    let choicePath, _ = getAccessFromScopeNodeList d.asn1Type d.dependencyKind.isString lm pSrcRoot
                    cmp v vi (choicePath.arg.joined lm.lg) (i=0) (ds2.Length = 1))
            let arrsLocalCheckEquality =
                ds |>
                List.mapi (fun i d ->
                    let cmp = getDeterminantTypeCheckEqual lm d.determinant
                    let vi = sprintf "%s%02d" (getAcnDeterminantName acnChildOrAcnParameterId) i
                    let choicePath, _ = getAccessFromScopeNodeList d.asn1Type d.dependencyKind.isString lm pSrcRoot
                    cmp v vi (choicePath.arg.joined lm.lg) (isAlwaysInit d))
            let updateStatement = multiAcnUpdate (vTarget.arg.joined lm.lg) c_name0 (errCode.errCodeName) (localVars child) arrsLocalUpdateStatements arrsGetFirstIntValue firstAlwaysInit.IsSome arrsLocalCheckEquality (initExpr r lm m child.Type)
            updateStatement
        let testCaseFnc (atc:AutomaticTestCase) : TestCaseValue option =
            let updateValues =
                localUpdateFuns |> List.map(fun z -> match z with None -> None | Some res -> res.testCaseFnc atc)
            match updateValues |> Seq.exists(fun z -> z.IsNone) with
            | true  -> None //at least one update is not present
            | false ->
                match updateValues |> List.choose id with
                | []        -> None
                | u1::us    ->
                    match us |> Seq.exists(fun z -> z <> u1) with
                    | true  -> None
                    | false -> Some u1

        let ret = Some(({AcnChildUpdateResult.updateAcnChildFnc = multiUpdateFunc; errCodes=errCode::restErrCodes ; testCaseFnc = testCaseFnc; localVariables = restLocalVariables}))
        ret, ns

type private AcnSequenceStatement =
    | AcnPresenceStatement
    | Asn1ChildEncodeStatement
    | AcnChildUpdateStatement
    | AcnChildEncodeStatement

type private HandleChild_Aux = {
    statementKind           : AcnSequenceStatement
    acnPresenceStatement    : string option
    localVariableList       : LocalVariable list
    errCodeList             : ErrorCode list
}

type private SequenceChildStmt = {
    acnStatement: AcnSequenceStatement
    body: string option
    lvs: LocalVariable list
    errCodes: ErrorCode list
}
type private SequenceChildState = {
    us: State
    childIx: int
    // TODO: What about padding?
    uperAccBits: BigInteger // TODO: Needed?
    acnAccBits: BigInteger // TODO: Needed?
}
type private SequenceChildResult = {
    stmts: SequenceChildStmt list
    resultExpr: string option
    existVar: string option
    props: SequenceChildProps
    typeKindEncoding: TypeEncodingKind option
} with
    member this.joinedBodies (lm:LanguageMacros) (codec:CommonTypes.Codec): string option =
        this.stmts |> List.choose (fun s -> s.body) |> nestChildItems lm codec

let createSequenceFunction (r:Asn1AcnAst.AstRoot) (deps:Asn1AcnAst.AcnInsertedFieldDependencies) (lm:LanguageMacros) (codec:CommonTypes.Codec) (t:Asn1AcnAst.Asn1Type) (o:Asn1AcnAst.Sequence) (typeDefinition:TypeDefinitionOrReference) (isValidFunc: IsValidFunction option) (children:SeqChildInfo list) (acnPrms:DastAcnParameter list) (us:State)  =
    (*
        1. all Acn inserted children are declared as local variables in the encoded and decode functions (declaration step)
        2. all Acn inserted children must be initialized appropriately in the encoding phase
        3.
    *)
    // stg macros
    let sequence_presence_optChild                      = lm.acn.sequence_presence_optChild
    let sequence_presence_optChild_pres_bool            = lm.acn.sequence_presence_optChild_pres_bool
    let sequence_presence_optChild_pres_acn_expression  = lm.acn.sequence_presence_optChild_pres_acn_expression
    let sequence_mandatory_child                        = lm.acn.sequence_mandatory_child
    let sequence_optional_child                         = lm.acn.sequence_optional_child
    let sequence_always_present_child                   = lm.acn.sequence_always_present_child
    let sequence_always_absent_child                    = lm.acn.sequence_always_absent_child
    let sequence_default_child                          = lm.acn.sequence_default_child
    let sequence_acn_child                              = lm.acn.sequence_acn_child
    let sequence_call_post_encoding_function            = lm.acn.sequence_call_post_encoding_function
    let sequence_call_post_decoding_validator           = lm.acn.sequence_call_post_decoding_validator
    let sequence_save_bitStream_start                   = lm.acn.sequence_save_bitStream_start
    let bitStreamName                                   = lm.lg.bitStreamName

    let acnExpressionToBackendExpression (seq:Asn1AcnAst.Sequence) (pSeq:CallerScope) (exp:AcnExpression) =
        let unaryNotOperator    = lm.lg.unaryNotOperator
        let modOp               = lm.lg.modOp
        let eqOp                = lm.lg.eqOp
        let neqOp               = lm.lg.neqOp
        let andOp               = lm.lg.andOp
        let orOp                = lm.lg.orOp

        let printUnary op chExpPriority expStr minePriority =
            minePriority, if chExpPriority >= minePriority then sprintf "%s(%s)" op expStr else sprintf "%s%s" op expStr
        let printBinary op (chExpPriority1, expStr1) (chExpPriority2, expStr2) minePriority =
            minePriority, (if chExpPriority1 >= minePriority then "(" + expStr1 + ")" else expStr1 ) + " " + op + " " + (if chExpPriority2 >= minePriority then "(" + expStr2 + ")" else expStr2 )


        let rec getChildResult (seq:Asn1AcnAst.Sequence) (pSeq:CallerScope) (RelativePath lp) =
            match lp with
            | []    -> raise(BugErrorException "empty relative path")
            | x1::xs ->
                match seq.children |> Seq.tryFind(fun c -> c.Name = x1) with
                | None ->
                    raise (SemanticError(x1.Location, (sprintf "Invalid reference '%s'" (lp |> Seq.StrJoin "."))))
                | Some ch ->
                    match ch with
                    | Asn1AcnAst.AcnChild ch  -> raise (SemanticError(x1.Location, (sprintf "Invalid reference '%s'. Expecting an ASN.1 child" (lp |> Seq.StrJoin "."))))
                    | Asn1AcnAst.Asn1Child ch  ->
                        match ch.Type.ActualType.Kind with
                        | Asn1AcnAst.Integer        _
                        | Asn1AcnAst.Real           _
                        | Asn1AcnAst.Boolean        _  -> {pSeq with arg = lm.lg.getSeqChild pSeq.arg (lm.lg.getAsn1ChildBackendName0 ch) false ch.Optionality.IsSome}
                        | Asn1AcnAst.Sequence s when xs.Length > 1 -> getChildResult s {pSeq with arg = lm.lg.getSeqChild pSeq.arg (lm.lg.getAsn1ChildBackendName0 ch) false ch.Optionality.IsSome} (RelativePath xs)
                        | _                 -> raise (SemanticError(x1.Location, (sprintf "Invalid reference '%s'" (lp |> Seq.StrJoin "."))))


        let ret =
            AcnGenericTypes.foldAcnExpression
                (fun i s -> ( (0, i.Value.ToString()) , 0))
                (fun i s -> ( (0,"") , 0))
                (fun i s -> ( (0, i.Value.ToString(FsUtils.doubleParseString, NumberFormatInfo.InvariantInfo)) , 0))
                (fun i s -> ( (0, i.Value.ToString().ToLower()) , 0))
                (fun lf s ->
                    let plf = getChildResult seq pSeq lf
                    (0, (plf.arg.joined lm.lg)) , 0)
                (fun loc (chExpPriority, expStr) s -> printUnary unaryNotOperator chExpPriority expStr 1, 0) //NotUnaryExpression
                (fun loc (chExpPriority, expStr) s -> printUnary "-" chExpPriority expStr 1, 0)//MinusUnaryExpression
                (fun l e1 e2  s -> printBinary "+" e1 e2 3, 0 )
                (fun l e1 e2  s -> printBinary "-" e1 e2 3, 0 )
                (fun l e1 e2  s -> printBinary "*" e1 e2 2, 0 )
                (fun l e1 e2  s -> printBinary "/" e1 e2 2, 0 )
                (fun l e1 e2  s -> printBinary modOp e1 e2 2, 0 )
                (fun l e1 e2  s -> printBinary "<=" e1 e2 4, 0 )
                (fun l e1 e2  s -> printBinary "<" e1 e2 4, 0 )
                (fun l e1 e2  s -> printBinary ">=" e1 e2 4, 0 )
                (fun l e1 e2  s -> printBinary ">" e1 e2 4, 0 )
                (fun l e1 e2  s -> printBinary eqOp e1 e2 5, 0 )
                (fun l e1 e2  s -> printBinary neqOp e1 e2 5, 0 )
                (fun lc e1 e2  s -> printBinary andOp  e1 e2 6, 0 )
                (fun lc e1 e2  s -> printBinary orOp e1 e2 6, 0 )
                exp 0 |> fst |> snd

        ret

    //let baseFuncName =  match baseTypeUperFunc  with None -> None | Some baseFunc -> baseFunc.funcName

    let acnChildren = children |>  List.choose(fun x -> match x with AcnChild z -> Some z | Asn1Child _ -> None)
    let asn1Children = children |>  List.choose(fun x -> match x with Asn1Child z -> Some z | AcnChild _ -> None)
    let funcBody (us:State) (errCode:ErrorCode) (acnArgs: (AcnGenericTypes.RelativePath*AcnGenericTypes.AcnParameter) list) (nestingScope: NestingScope) (p:CallerScope) =
        let acnlocalVariablesCh =
            acnChildren |>
            List.filter(fun x -> match x.Type with Asn1AcnAst.AcnNullType _ -> false | _ -> true) |>
            List.collect(fun x ->
                let childLv =
                    match lm.lg.decodingKind with
                    | InPlace -> [AcnInsertedChild(x.c_name, x.typeDefinitionBodyWithinSeq, x.initExpression)]
                    | Copy -> []
                match codec with
                | Encode ->
                    let initLv =
                        if lm.lg.usesWrappedOptional then []
                        else [BooleanLocalVariable(x.c_name+"_is_initialized", Some lm.lg.FalseLiteral)]
                    childLv@initLv
                | Decode -> childLv)

        let acnlocalVariablesPrms =
            match t.id.tasInfo with
            | Some  _ -> [] // if the encoding type is a top level type (i.e. TAS) then the encoding parameters are transformed into function parameters and not local variables.
            | None    -> [] // acnPrms |>  List.map(fun x -> AcnInsertedChild(x.c_name, x.typeDefinitionBodyWithinSeq))
        let acnlocalVariables = acnlocalVariablesCh @ acnlocalVariablesPrms
        //let acnParams =  r.acnParameters |> List.filter(fun  prm -> prm.ModName )

        let printPresenceBit (child:Asn1Child) (existVar: string option)=
            match child.Optionality with
            | Some (Asn1AcnAst.Optional opt)   ->
                match opt.acnPresentWhen with
                | None ->
                    assert (codec = Encode || existVar.IsSome)
                    Some (sequence_presence_optChild (p.arg.joined lm.lg) (lm.lg.getAccess p.arg) (lm.lg.getAsn1ChildBackendName child) existVar errCode.errCodeName codec)
                | Some _ -> None
            | _ -> None

        let localVariables = acnlocalVariables
        let td = lm.lg.getSequenceTypeDefinition o.typeDef


        let localVariables, post_encoding_function, soBitStreamPositionsLocalVar, soSaveInitialBitStrmStatement =
            let bitStreamPositionsLocalVar = sprintf "bitStreamPositions_%d" (t.id.SequenceOfLevel + 1)
            let bsPosStart = sprintf "bitStreamPositions_start%d" (t.id.SequenceOfLevel + 1)
            match o.acnProperties.postEncodingFunction with
            | Some (PostEncodingFunction (modFncName, fncName)) when codec = Encode  ->
                let actualFncName =
                    match lm.lg.hasModules with
                    | false ->  (ToC fncName.Value)
                    | true ->
                        match modFncName with
                        | None -> (ToC (r.args.mappingFunctionsModule.orElse "")) + "." + (ToC fncName.Value)
                        | Some modFncName -> (ToC modFncName.Value) + "." + (ToC fncName.Value)

                let fncCall = sequence_call_post_encoding_function (lm.lg.getPointer p.arg) (actualFncName) bsPosStart bitStreamPositionsLocalVar

                let initialBitStrmStatement = sequence_save_bitStream_start bsPosStart codec
                [AcnInsertedChild(bitStreamPositionsLocalVar, td.extension_function_positions, ""); AcnInsertedChild(bsPosStart, bitStreamName, "")]@localVariables, Some fncCall, Some bitStreamPositionsLocalVar, Some initialBitStrmStatement
            | _ ->
                match o.acnProperties.preDecodingFunction with
                | Some (PreDecodingFunction (modFncName, fncName)) when codec = Decode  ->
                    let actualFncName =
                        match lm.lg.hasModules with
                        | false -> (ToC fncName.Value)
                        | true ->
                            match modFncName with
                            | None -> (ToC (r.args.mappingFunctionsModule.orElse "")) + "." + (ToC fncName.Value)
                            | Some modFncName -> (ToC modFncName.Value) + "." + (ToC fncName.Value)
                    let fncCall = sequence_call_post_decoding_validator (lm.lg.getPointer p.arg) (actualFncName) bsPosStart  bitStreamPositionsLocalVar
                    let initialBitStrmStatement = sequence_save_bitStream_start bsPosStart codec
                    [AcnInsertedChild(bitStreamPositionsLocalVar, td.extension_function_positions, ""); AcnInsertedChild(bsPosStart, bitStreamName, "")]@localVariables, Some fncCall, Some bitStreamPositionsLocalVar, Some initialBitStrmStatement
                | _ ->  localVariables, None, None, None


        let handleChild (s: SequenceChildState) (child: SeqChildInfo): SequenceChildResult * SequenceChildState =
            // This binding is suspect, isn't it
            let us = s.us
            let soSaveBitStrmPosStatement = None
            let childNestingScope = {nestingScope with nestingLevel = nestingScope.nestingLevel + 1; ix = s.childIx; acnOffset = nestingScope.acnOffset + s.acnAccBits}
            match child with
            | Asn1Child child   ->
                let childTypeDef = child.Type.typeDefinitionOrReference.longTypedefName2 lm.lg.hasModules
                let childName = lm.lg.getAsn1ChildBackendName child
                let chFunc = child.Type.getAcnFunction codec
                let childSel = lm.lg.getSeqChild p.arg childName child.Type.isIA5String child.Optionality.IsSome
                let childP =
                    let newArg = if lm.lg.usesWrappedOptional && childSel.isOptional && codec = Encode then childSel.asLast else childSel
                    {p with arg = newArg}
                let childContentResult, ns1 =
                    match chFunc with
                    | Some chFunc -> chFunc.funcBodyAsSeqComp us [] childNestingScope childP childName
                    | None -> None, us
                //handle present-when acn property
                let present_when_statements, existVar, ns2 =
                    let acnPresenceStatement, lvs, errCodes, existVar, ns1b =
                        match child.Optionality with
                        | Some (Asn1AcnAst.Optional opt) ->
                            match opt.acnPresentWhen with
                            | None ->
                                match codec with
                                | Encode ->
                                    // We do not need the `exist` variable for encoding as we use the child `exist` bit
                                    None, [], [], None, ns1
                                | Decode ->
                                    let existVar = ToC (child._c_name + "_exist")
                                    let lv = FlagLocalVariable (existVar, None)
                                    None, [lv], [], Some existVar, ns1
                            | Some (PresenceWhenBool _) ->
                                match codec with
                                | Encode -> None, [], [], None, ns1
                                | Decode ->
                                    let extField = getExternalField r deps child.Type.id
                                    let body = sequence_presence_optChild_pres_bool (p.arg.joined lm.lg) (lm.lg.getAccess p.arg) childName extField codec
                                    Some body, [], [], Some extField, ns1
                            | Some (PresenceWhenBoolExpression exp)    ->
                                let _errCodeName = ToC ("ERR_ACN" + (codec.suffix.ToUpper()) + "_" + ((child.Type.id.AcnAbsPath |> Seq.skip 1 |> Seq.StrJoin("-")).Replace("#","elm")) + "_PRESENT_WHEN_EXP_FAILED")
                                let errCode, ns1a = getNextValidErrorCode ns1 _errCodeName None
                                let retExp = acnExpressionToBackendExpression o p exp
                                let existVar =
                                    if codec = Decode then Some (ToC (child._c_name + "_exist"))
                                    else None
                                let lv = existVar |> Option.toList |> List.map (fun v -> FlagLocalVariable (v, None))
                                let body = sequence_presence_optChild_pres_acn_expression (p.arg.joined lm.lg) (lm.lg.getAccess p.arg) childName retExp existVar errCode.errCodeName codec
                                Some body, lv, [errCode], existVar, ns1a
                        | _ -> None, [], [], None, ns1
                    {acnStatement=AcnPresenceStatement; body=acnPresenceStatement; lvs=lvs; errCodes=errCodes}, existVar, ns1b

                let childEncDecStatement, childResultExpr, childTpeKind, ns3 =
                    match childContentResult with
                    | None ->
                        // Copy-decoding expects to have a result expression (even if unused), so we pick the initExpression
                        let childResultExpr =
                            match codec, lm.lg.decodingKind with
                            | Decode, Copy -> Some child.Type.initFunction.initExpression
                            | _ -> None
                        match child.Optionality with
                        | Some Asn1AcnAst.AlwaysPresent     ->
                            let childBody = Some(sequence_always_present_child (p.arg.joined lm.lg) (lm.lg.getAccess p.arg) childName None childResultExpr soSaveBitStrmPosStatement codec)
                            Some {acnStatement=Asn1ChildEncodeStatement; body=childBody; lvs=[]; errCodes=[]}, childResultExpr, None, ns2
                        | _ -> None, childResultExpr, None, ns2
                    | Some childContent ->
                        let childBody, chLocalVars =
                            match child.Optionality with
                            | None                             -> Some (sequence_mandatory_child childName childContent.funcBody soSaveBitStrmPosStatement codec), childContent.localVariables
                            | Some Asn1AcnAst.AlwaysAbsent     -> Some (sequence_always_absent_child (p.arg.joined lm.lg) (lm.lg.getAccess p.arg) childName childContent.funcBody childTypeDef soSaveBitStrmPosStatement codec), []
                            | Some Asn1AcnAst.AlwaysPresent    -> Some (sequence_always_present_child (p.arg.joined lm.lg) (lm.lg.getAccess p.arg) childName (Some childContent.funcBody) childContent.resultExpr soSaveBitStrmPosStatement codec), childContent.localVariables
                            | Some (Asn1AcnAst.Optional opt)   ->
                                assert (codec = Encode || existVar.IsSome)
                                let pp, _ = joinedOrAsIdentifier lm codec p
                                match opt.defaultValue with
                                | None ->
                                    Some(sequence_optional_child pp (lm.lg.getAccess p.arg) childName childContent.funcBody existVar childContent.resultExpr childTypeDef soSaveBitStrmPosStatement codec), childContent.localVariables
                                | Some v ->
                                    let defInit= child.Type.initFunction.initByAsn1Value childP (mapValue v).kind
                                    Some(sequence_default_child pp (lm.lg.getAccess p.arg) childName childContent.funcBody defInit existVar childContent.resultExpr childTypeDef soSaveBitStrmPosStatement codec), childContent.localVariables
                        Some {acnStatement=Asn1ChildEncodeStatement; body=childBody; lvs=chLocalVars; errCodes=childContent.errCodes}, childContent.resultExpr, childContent.typeEncodingKind, ns2
                let stmts = [present_when_statements]@(childEncDecStatement |> Option.toList)
                // Note: uperMaxSizeBits and uperAccBits here do not make sense since we are in ACN
                let tpeKind =
                    if child.Optionality.IsSome then childTpeKind |> Option.map OptionEncodingType
                    else childTpeKind
                let typeInfo = {uperMaxSizeBits=0I; acnMaxSizeBits=child.acnMaxSizeInBits; typeKind=tpeKind}
                // TODO: Dire pk pas childP mais childSel (car on match sur p.child)
                let props = {sel=Some (childSel.joined lm.lg); uperMaxOffset=s.uperAccBits; acnMaxOffset=s.acnAccBits; typeInfo=typeInfo}
                let res = {stmts=stmts; resultExpr=childResultExpr; existVar=existVar; props=props; typeKindEncoding=tpeKind}
                let newAcc = {us=ns3; childIx=s.childIx + 1; uperAccBits=s.uperAccBits; acnAccBits=s.acnAccBits + child.acnMaxSizeInBits}
                res, newAcc
            | AcnChild acnChild ->
                //handle updates
                let childP = {CallerScope.modName = p.modName; arg= Selection.valueEmptyPath (getAcnDeterminantName acnChild.id)}

                let updateStatement, ns1 =
                    match codec with
                    | Encode ->
                        let pRoot : CallerScope = lm.lg.getParamType t codec  //????
                        let updateStatement, lvs, errCodes =
                            match acnChild.funcUpdateStatement with
                            | Some funcUpdateStatement -> Some (funcUpdateStatement.updateAcnChildFnc acnChild childNestingScope childP pRoot), funcUpdateStatement.localVariables, funcUpdateStatement.errCodes
                            | None                     -> None, [], []
                        Some {acnStatement=AcnChildUpdateStatement; body=updateStatement; lvs=lvs; errCodes=errCodes}, us
                    | Decode -> None, us

                //acn child encode/decode
                let childEncDecStatement, childTpeKind, ns2 =
                    let chFunc = acnChild.funcBody codec
                    let childContentResult = chFunc [] childNestingScope childP
                    match childContentResult with
                    | None              -> None, None, ns1
                    | Some childContent ->
                        match codec with
                        | Encode   ->
                            match acnChild.Type with
                            | Asn1AcnAst.AcnNullType _   ->
                                let childBody = Some (sequence_mandatory_child acnChild.c_name childContent.funcBody soSaveBitStrmPosStatement codec)
                                Some {acnStatement=AcnChildEncodeStatement; body=childBody; lvs=childContent.localVariables; errCodes=childContent.errCodes}, childContent.typeEncodingKind, ns1
                            | _             ->
                                let _errCodeName         = ToC ("ERR_ACN" + (codec.suffix.ToUpper()) + "_" + ((acnChild.id.AcnAbsPath |> Seq.skip 1 |> Seq.StrJoin("-")).Replace("#","elm")) + "_UNINITIALIZED")
                                let errCode, ns1a = getNextValidErrorCode ns1 _errCodeName None
                                let childBody = Some (sequence_acn_child acnChild.c_name childContent.funcBody errCode.errCodeName soSaveBitStrmPosStatement codec)
                                Some {acnStatement=AcnChildEncodeStatement; body=childBody; lvs=childContent.localVariables; errCodes=errCode::childContent.errCodes}, childContent.typeEncodingKind, ns1a
                        | Decode    ->
                            let childBody = Some (sequence_mandatory_child acnChild.c_name childContent.funcBody soSaveBitStrmPosStatement codec)
                            Some {acnStatement=AcnChildEncodeStatement; body=childBody; lvs=childContent.localVariables; errCodes=childContent.errCodes}, childContent.typeEncodingKind, ns1
                let stmts = (updateStatement |> Option.toList)@(childEncDecStatement |> Option.toList)
                // Note: uperMaxSizeBits and uperAccBits here do not make sense since we are in ACN
                let typeInfo = {uperMaxSizeBits=0I; acnMaxSizeBits=child.acnMaxSizeInBits; typeKind=childTpeKind}
                let props = {sel=Some (childP.arg.joined lm.lg); uperMaxOffset=s.uperAccBits; acnMaxOffset=s.acnAccBits; typeInfo=typeInfo}
                let res =  {stmts=stmts; resultExpr=None; existVar=None; props=props; typeKindEncoding=childTpeKind}
                let newAcc = {us=ns2; childIx=s.childIx + 1; uperAccBits=s.uperAccBits; acnAccBits=s.acnAccBits + acnChild.Type.acnMaxSizeInBits}
                res, newAcc
        // find acn inserted fields, which are not NULL types and which have no dependency.
        // For those fields we should generated no anc encode/decode function
        // Otherwise, the encoding function is wrong since an uninitialized value is encoded.
        let existsAcnChildWithNoUpdates =
            acnChildren |>
            List.filter (fun acnChild -> match acnChild.Type with Asn1AcnAst.AcnNullType _ -> false | _ -> acnChild.funcUpdateStatement.IsNone)
        let saveInitialBitStrmStatements = soSaveInitialBitStrmStatement |> Option.toList
        // TODO: What about presence bits???
        // TODO: nestingScope offsets
        let childrenStatements00, scs = children |> foldMap handleChild {us=us; childIx=0; uperAccBits=0I; acnAccBits=0I}
        let ns = scs.us
        let childrenStatements0 = childrenStatements00 |> List.collect (fun xs -> xs.stmts)

        let presenceBits = ((List.zip children childrenStatements00)
            |> List.choose (fun (child, res) ->
                match child with
                | Asn1Child asn1 -> printPresenceBit asn1 res.existVar
                | AcnChild _ -> None))
        let seqProofGen =
            let presenceBitsInfo = presenceBits |> List.mapi (fun i _ ->
                {sel=None; uperMaxOffset = bigint i; acnMaxOffset = bigint i;
                typeInfo = {uperMaxSizeBits = 1I; acnMaxSizeBits = 1I; typeKind = Some (AcnBooleanEncodingType None)}})
            let children = childrenStatements00 |> List.map (fun xs -> xs.props)
            {acnOuterMaxSize = nestingScope.acnOuterMaxSize; uperOuterMaxSize = nestingScope.uperOuterMaxSize;
            nestingLevel = nestingScope.nestingLevel; uperMaxOffset = nestingScope.uperOffset; acnMaxOffset = nestingScope.acnOffset;
            children = presenceBitsInfo @ children}
        let allStmts =
            let presenceBits = presenceBits |> List.map Some
            let children = childrenStatements00 |> List.map (fun s -> s.joinedBodies lm codec)
            presenceBits @ children
        let childrenStatements = lm.lg.generateSequenceChildProof ACN allStmts seqProofGen codec

        let childrenLocalvars = childrenStatements0 |> List.collect(fun s -> s.lvs)
        let childrenExistVar = childrenStatements00 |> List.choose(fun res -> res.existVar)
        let childrenResultExpr = childrenStatements00 |> List.choose(fun res -> res.resultExpr)
        let childrenErrCodes = childrenStatements0 |> List.collect(fun s -> s.errCodes)
        let childrenTypeKindEncoding = childrenStatements00 |> List.map (fun s -> s.typeKindEncoding)

        let resultExpr, seqBuild=
            match codec, lm.lg.decodingKind with
            | Decode, Copy ->
                // If we are Decoding with Copy decoding kind, then all children `resultExpr`
                // must be defined as well (i.e. we must have the same number of `resultExpr` as children)
                // assert (childrenResultExpr.Length = asn1Children.Length)
                assert (childrenResultExpr.Length = asn1Children.Length)
                let existSeq =
                    if lm.lg.usesWrappedOptional || childrenExistVar.IsEmpty then []
                    else
                        let existTd = (lm.lg.getSequenceTypeDefinition o.typeDef).exist
                        [lm.init.initSequenceExpr existTd childrenExistVar []]
                let resultExpr = p.arg.asIdentifier
                Some resultExpr, [lm.uper.sequence_build resultExpr (typeDefinition.longTypedefName2 lm.lg.hasModules) (existSeq@childrenResultExpr)]
            | _ -> None, []

        let seqContent =  (saveInitialBitStrmStatements@childrenStatements@(post_encoding_function |> Option.toList)@seqBuild) |> nestChildItems lm codec
        match existsAcnChildWithNoUpdates with
        | []     ->
            match seqContent with
            | None  ->
                match codec with
                | Encode -> None, ns
                | Decode ->
                    match lm.lg.decodeEmptySeq (p.arg.joined lm.lg) with
                    | None -> None, ns
                    | Some decodeEmptySeq ->
                        Some ({AcnFuncBodyResult.funcBody = decodeEmptySeq; errCodes = errCode::childrenErrCodes; localVariables = localVariables@childrenLocalvars; bValIsUnReferenced= false; bBsIsUnReferenced=true; resultExpr=Some decodeEmptySeq; typeEncodingKind=Some (SequenceEncodingType childrenTypeKindEncoding)}), ns
            | Some ret ->
                Some ({AcnFuncBodyResult.funcBody = ret; errCodes = errCode::childrenErrCodes; localVariables = localVariables@childrenLocalvars; bValIsUnReferenced= false; bBsIsUnReferenced=(o.acnMaxSizeInBits = 0I); resultExpr=resultExpr; typeEncodingKind=Some (SequenceEncodingType childrenTypeKindEncoding)}), ns

        | errChild::_      ->
            let determinantUsage =
                match errChild.Type with
                | Asn1AcnAst.AcnInteger               _-> "length"
                | Asn1AcnAst.AcnNullType              _-> raise(BugErrorException "existsAcnChildWithNoUpdates")
                | Asn1AcnAst.AcnBoolean               _-> "presence"
                | Asn1AcnAst.AcnReferenceToEnumerated _-> "presence"
                | Asn1AcnAst.AcnReferenceToIA5String  _-> "presence"
            let errMessage = sprintf "Unused ACN inserted field.
                All fields inserted at ACN level (except NULL fields) must act as decoding determinants of other types.
                The field '%s' must either be removed or used as %s determinant of another ASN.1 type." errChild.Name.Value determinantUsage
            raise(SemanticError(errChild.Name.Location, errMessage))
            //let loc = errChild.Name.Location
            //Console.Out.WriteLine (FrontEntMain.formatSemanticWarning loc errMessage)
            //None, ns

    let isTestVaseValid (atc:AutomaticTestCase) =
        //an automatic test case value is valid
        //if all ach children can be update during the encoding from the value
        acnChildren |>
        List.filter (fun acnChild -> match acnChild.Type with Asn1AcnAst.AcnNullType _ -> false | _ -> true) |>
        Seq.forall(fun acnChild ->
            match acnChild.funcUpdateStatement with
            | Some funcUpdateStatement -> (funcUpdateStatement.testCaseFnc atc).IsSome
            | None                     -> false)
    let soSparkAnnotations = Some(sparkAnnotations lm (typeDefinition.longTypedefName2 lm.lg.hasModules) codec)
    let sPresenceBitIndexMap  =
        asn1Children |>
        List.filter(fun c -> match c.Optionality with Some(Optional _) -> true | _ -> false) |>
        List.mapi (fun i c -> (c.Name.Value, i)) |>
        Map.ofList
    let uperPresenceMask =
        match sPresenceBitIndexMap.IsEmpty with
        | true -> []
        | false ->
            [{IcdRow.fieldName = "Presence Mask"; comments = [$"Presence bit mask"]; sPresent="always";sType=IcdPlainType "bit mask"; sConstraint=None; minLengthInBits = sPresenceBitIndexMap.Count.AsBigInt ;maxLengthInBits=sPresenceBitIndexMap.Count.AsBigInt;sUnits=None; rowType = IcdRowType.LengthDeterminantRow; idxOffset = None}]

    let icdFnc fieldName sPresent comments  =
        let chRows =
            children |>
            List.collect(fun c ->
                match c with
                | Asn1Child c ->
                    let optionality =
                        match c.Optionality with
                        | None                -> "always"
                        | Some(AlwaysAbsent ) -> "never"
                        | Some(AlwaysPresent) -> "always"
                        | Some(Optional  opt) ->
                            match opt.acnPresentWhen with
                            | None                                      -> $"when bit %d{sPresenceBitIndexMap[c.Name.Value]} is set in the uPER bit mask"
                            | Some(PresenceWhenBool relPath)            -> $"when %s{relPath.AsString} is true"
                            | Some(PresenceWhenBoolExpression acnExp)   ->
                                let dummyScope = {CallerScope.modName = ""; arg = Selection.valueEmptyPath "dummy"}
                                let retExp = acnExpressionToBackendExpression o dummyScope acnExp
                                $"when %s{retExp}"
                    let comments = c.Comments |> Seq.toList
                    let x = c.Type.icdFunction
                    //let isRef = match c.Type.Kind with ReferenceType _ -> true | _ -> false
                    match x.canBeEmbedded   with
                    | true  ->
                        x.createRowsFunc c.Name.Value optionality comments
                    | false ->
                        let icdHash = x.typeAss.hash
                        let sType = TypeHash x.typeAss.hash
                        [{IcdRow.fieldName = c.Name.Value; comments = comments; sPresent=optionality;sType=sType; sConstraint=None; minLengthInBits = c.Type.acnMinSizeInBits; maxLengthInBits=c.Type.acnMaxSizeInBits;sUnits=None; rowType = IcdRowType.LengthDeterminantRow; idxOffset = None}]
                | AcnChild  c ->
                    let icdFunc = createAcnChildIcdFunction c
                    let comments = c.Comments |> Seq.toList
                    [icdFunc c.Name.Value comments])
        uperPresenceMask@chRows |> List.mapi(fun i r -> {r with idxOffset = Some (i+1)})
    let icd = {IcdArgAux.canBeEmbedded = false; baseAsn1Kind = (getASN1Name t); rowsFunc = icdFnc; commentsForTas=[]; scope="type"; name= None}
    createAcnFunction r lm codec t typeDefinition  isValidFunc  funcBody isTestVaseValid icd soSparkAnnotations  [] us



let createChoiceFunction (r:Asn1AcnAst.AstRoot) (deps:Asn1AcnAst.AcnInsertedFieldDependencies) (lm:LanguageMacros) (codec:CommonTypes.Codec) (t:Asn1AcnAst.Asn1Type) (o:Asn1AcnAst.Choice) (typeDefinition:TypeDefinitionOrReference) (defOrRef:TypeDefinitionOrReference) (isValidFunc: IsValidFunction option) (children:ChChildInfo list) (acnPrms:DastAcnParameter list)  (us:State)  =
    let choice_uper                         =  lm.acn.Choice
    let choiceChildAlwaysAbsent             =  lm.acn.ChoiceChildAlwaysAbsent
    let choiceChild                         =  lm.acn.ChoiceChild
    let choice_Enum                         =  lm.acn.Choice_Enum
    let choiceChild_Enum                    =  lm.acn.ChoiceChild_Enum
    let choice_preWhen                      =  lm.acn.Choice_preWhen
    let choiceChild_preWhen                 =  lm.acn.ChoiceChild_preWhen
    let choiceChild_preWhen_int_condition   =  lm.acn.ChoiceChild_preWhen_int_condition
    let choiceChild_preWhen_str_condition   =  lm.acn.ChoiceChild_preWhen_str_condition

    let isAcnChild (ch:ChChildInfo) = match ch.Optionality with  Some (ChoiceAlwaysAbsent) -> false | _ -> true
    let acnChildren = children |> List.filter isAcnChild
    let alwaysAbsentChildren = children |> List.filter (isAcnChild >> not)
    let children =
        match lm.lg.acn.choice_handle_always_absent_child with
        | false     -> acnChildren
        | true   -> acnChildren@alwaysAbsentChildren     //in Spark, we have to cover all cases even the ones that are always absent due to SPARK strictness


    let nMin = 0I
    let nMax = BigInteger(Seq.length acnChildren) - 1I
    //let nBits = (GetNumberOfBitsForNonNegativeInteger (nMax-nMin))
    let nIndexSizeInBits = (GetNumberOfBitsForNonNegativeInteger (BigInteger (acnChildren.Length - 1)))
    let sChoiceIndexName = (ToC t.id.AsString) + "_index_tmp"
    let ec =
        match o.acnProperties.enumDeterminant with
        | Some _            ->
            let dependency = deps.acnDependencies |> List.find(fun d -> d.asn1Type = t.id)
            match dependency.dependencyKind with
            | Asn1AcnAst.AcnDepChoiceDeterminant (enm, _, _)  -> CEC_enum (enm, dependency.determinant)
            | _                                         -> raise(BugErrorException("unexpected dependency type"))
        | None              ->
            match children |> Seq.exists(fun c -> not (Seq.isEmpty c.acnPresentWhenConditions)) with
            | true           -> CEC_presWhen
            | false          -> CEC_uper

    let localVariables =
        match ec, codec with
        | _, CommonTypes.Encode             -> []
        | CEC_enum _, CommonTypes.Decode    -> []
        | CEC_presWhen, CommonTypes.Decode  -> []
        | CEC_uper, CommonTypes.Decode  -> [(Asn1SIntLocalVariable (sChoiceIndexName, None))]

    let typeDefinitionName = defOrRef.longTypedefName2 lm.lg.hasModules//getTypeDefinitionName t.id.tasInfo typeDefinition

    let funcBody (us:State) (errCode:ErrorCode) (acnArgs: (AcnGenericTypes.RelativePath*AcnGenericTypes.AcnParameter) list) (nestingScope: NestingScope) (p:CallerScope) =
        let td = (lm.lg.getChoiceTypeDefinition o.typeDef).longTypedefName2 lm.lg.hasModules (ToC p.modName)
        let handleChild (us:State) (idx:int) (child:ChChildInfo) =
            let chFunc = child.chType.getAcnFunction codec
            let sChildInitExpr = child.chType.initFunction.initExpression
            // TODO: dire pk (car choice donc c'est pas sequentiel)
            let childNestingScope = {nestingScope with nestingLevel = nestingScope.nestingLevel + 1}
            let childContentResult, ns1 =
                match chFunc with
                | Some chFunc ->
                    let childP =
                        if lm.lg.acn.choice_requires_tmp_decoding && codec = Decode then
                            {CallerScope.modName = p.modName; arg = Selection.valueEmptyPath ((lm.lg.getAsn1ChChildBackendName child) + "_tmp")}
                        else {p with arg = lm.lg.getChChild p.arg (lm.lg.getAsn1ChChildBackendName child) child.chType.isIA5String}
                    chFunc.funcBody us [] childNestingScope childP
                | None -> None, us

            let childContent_funcBody, childContent_localVariables, childContent_errCodes =
                match childContentResult with
                | None              ->
                    match codec with
                    | Encode -> lm.lg.emptyStatement, [], []
                    | Decode ->
                        let childp =
                            match lm.lg.acn.choice_requires_tmp_decoding with
                            | true ->   ({CallerScope.modName = p.modName; arg = Selection.valueEmptyPath ((lm.lg.getAsn1ChChildBackendName child) + "_tmp")})
                            | false ->  ({p with arg = lm.lg.getChChild p.arg (lm.lg.getAsn1ChChildBackendName child) child.chType.isIA5String})
                        let decStatement =
                            match child.chType.ActualType.Kind with
                            | NullType _    -> lm.lg.decode_nullType (childp.arg.joined lm.lg)
                            | Sequence _    -> lm.lg.decodeEmptySeq (childp.arg.joined lm.lg)
                            | _             -> None
                        match decStatement with
                        | None -> lm.lg.emptyStatement,[], []
                        | Some ret ->
                            ret ,[],[]

                | Some childContent -> childContent.funcBody,  childContent.localVariables, childContent.errCodes

            let childBody =
                let sChildName = (lm.lg.getAsn1ChChildBackendName child)
                let sChildTypeDef = child.chType.typeDefinitionOrReference.longTypedefName2 lm.lg.hasModules //child.chType.typeDefinition.typeDefinitionBodyWithinSeq

                let sChoiceTypeName = typeDefinitionName
                match child.Optionality with
                | Some (ChoiceAlwaysAbsent) -> Some (choiceChildAlwaysAbsent (p.arg.joined lm.lg) (lm.lg.getAccess p.arg) (lm.lg.presentWhenName (Some defOrRef) child) (BigInteger idx) errCode.errCodeName codec)
                | Some (ChoiceAlwaysPresent)
                | None  ->
                    match ec with
                    | CEC_uper  ->
                        Some (choiceChild (p.arg.joined lm.lg) (lm.lg.getAccess p.arg) (lm.lg.presentWhenName (Some defOrRef) child) (BigInteger idx) nIndexSizeInBits nMax childContent_funcBody sChildName sChildTypeDef sChoiceTypeName sChildInitExpr codec)
                    | CEC_enum (enm,_) ->
                        let getDefOrRef (a:Asn1AcnAst.ReferenceToEnumerated) =
                            match p.modName = a.modName with
                            | true  -> ReferenceToExistingDefinition {ReferenceToExistingDefinition.programUnit = None; typedefName = ToC (r.args.TypePrefix + a.tasName); definedInRtl = false}
                            | false -> ReferenceToExistingDefinition {ReferenceToExistingDefinition.programUnit = Some (ToC a.modName); typedefName = ToC (r.args.TypePrefix + a.tasName); definedInRtl = false}


                        let enmItem = enm.enm.items |> List.find(fun itm -> itm.Name.Value = child.Name.Value)
                        Some (choiceChild_Enum (p.arg.joined lm.lg) (lm.lg.getAccess p.arg) (lm.lg.getNamedItemBackendName (Some (getDefOrRef enm)) enmItem) (lm.lg.presentWhenName (Some defOrRef) child) childContent_funcBody sChildName sChildTypeDef sChoiceTypeName sChildInitExpr codec)
                    | CEC_presWhen  ->
                        let handPresenceCond (cond:AcnGenericTypes.AcnPresentWhenConditionChoiceChild) =
                            match cond with
                            | PresenceInt  (relPath, intLoc)   ->
                                let extField = getExternalFieldChoicePresentWhen r deps t.id relPath
                                // Note: we always decode the external field as a asn1SccSint or asn1SccUint, therefore
                                // we do not need the exact integer class (i.e. bit width). However, some backends
                                // such as Scala requires the signedness to be passed.
                                let tp = getExternalFieldTypeChoicePresentWhen r deps t.id relPath
                                let unsigned =
                                    match tp with
                                    | AcnInsertedType.AcnInteger int -> int.isUnsigned
                                    | AcnInsertedType.AcnNullType _ -> true
                                    | _ -> raise (BugErrorException "???")
                                choiceChild_preWhen_int_condition extField (lm.lg.asn1SccIntValueToString intLoc.Value unsigned)
                            | PresenceStr  (relPath, strVal)   ->
                                let strType =
                                    deps.acnDependencies |>
                                    List.filter(fun d -> d.asn1Type = t.id) |>
                                    List.choose(fun d ->
                                        match d.dependencyKind with
                                        | AcnDepPresenceStr(relPathCond, ch, str)  when relPathCond = relPath-> Some str
                                        | _     -> None) |> Seq.head
                                let extField = getExternalFieldChoicePresentWhen r deps t.id relPath
                                let arrNulls = [0 .. ((int strType.maxSize.acn) - strVal.Value.Length)]|>Seq.map(fun x -> lm.vars.PrintStringValueNull())
                                let bytesStr = Array.append (System.Text.Encoding.ASCII.GetBytes strVal.Value) [| 0uy |]
                                choiceChild_preWhen_str_condition extField strVal.Value arrNulls bytesStr
                        let conds = child.acnPresentWhenConditions |>List.map handPresenceCond
                        let pp, _ = joinedOrAsIdentifier lm codec p
                        Some (choiceChild_preWhen pp (lm.lg.getAccess p.arg) (lm.lg.presentWhenName (Some defOrRef) child) childContent_funcBody conds (idx=0) sChildName sChildTypeDef sChoiceTypeName sChildInitExpr codec)
            [(childBody, childContent_localVariables, childContent_errCodes, childContentResult |> Option.bind (fun ch -> ch.typeEncodingKind))], ns1

        let childrenStatements00, ns = children |> List.mapi (fun i x -> i,x)  |> foldMap (fun us (i,x) ->  handleChild us i x) us
        let childrenStatements0 = childrenStatements00 |> List.collect id
        let childrenStatements = childrenStatements0 |> List.choose(fun (s,_,_,_) -> s)
        let childrenLocalvars = childrenStatements0 |> List.collect(fun (_,s,_,_) -> s)
        let childrenErrCodes = childrenStatements0 |> List.collect(fun (_,_,s,_) -> s)
        let childrenTypeKindEncoding = childrenStatements0 |> List.map(fun (_,_,_,s) -> s)

        let choiceContent, resultExpr =
            let pp, resultExpr = joinedOrAsIdentifier lm codec p
            let access = lm.lg.getAccess p.arg
            match ec with
            | CEC_uper        ->
                choice_uper pp access childrenStatements nMax sChoiceIndexName td nIndexSizeInBits errCode.errCodeName codec, resultExpr
            | CEC_enum   enm  ->
                let extField = getExternalField r deps t.id
                choice_Enum pp access childrenStatements extField errCode.errCodeName codec, resultExpr
            | CEC_presWhen    -> choice_preWhen pp  access childrenStatements errCode.errCodeName codec, resultExpr
        Some ({AcnFuncBodyResult.funcBody = choiceContent; errCodes = errCode::childrenErrCodes; localVariables = localVariables@childrenLocalvars; bValIsUnReferenced= false; bBsIsUnReferenced=false; resultExpr=resultExpr; typeEncodingKind = Some (ChoiceEncodingType childrenTypeKindEncoding)}), ns


    let soSparkAnnotations = Some(sparkAnnotations lm (typeDefinition.longTypedefName2 lm.lg.hasModules) codec)

    let uperPresenceMask, extraComment =
        match acnChildren.Length with
        | 1 -> [], []
        | _ ->
            match ec with
            | CEC_uper          ->
                let indexSize = GetChoiceUperDeterminantLengthInBits acnChildren.Length.AsBigInt
                [{IcdRow.fieldName = "ChoiceIndex"; comments = [$"Special field used by ACN to indicate which choice alternative is present."]; sPresent="always" ;sType=IcdPlainType "unsigned int"; sConstraint=None; minLengthInBits = indexSize; maxLengthInBits=indexSize;sUnits=None; rowType = IcdRowType.LengthDeterminantRow; idxOffset = None}], []
            | CEC_enum (enm,d)  -> [],[]
            | CEC_presWhen      ->
                let extFields = acnChildren |> List.collect(fun c -> c.acnPresentWhenConditions) |> List.map(fun x -> "'" + x.relativePath.AsString + "'") |> Seq.distinct |> Seq.StrJoin ","
                let plural = if extFields.Contains "," then "s" else ""
                [],[$"Active alternative is determined by ACN using the field{plural}: %s{extFields}"]

    let icdFnc fieldName sPresent comments  =
        let chRows =
            acnChildren |>
            List.mapi(fun idx c ->
                    let childComments = c.Comments |> Seq.toList
                    let optionality =
                        match c.Optionality with
                        | Some(ChoiceAlwaysAbsent ) -> "never"
                        | Some(ChoiceAlwaysPresent)
                        | None ->
                            match ec with
                            | CEC_uper          ->
                                match acnChildren.Length <= 1 with
                                | true  -> "always"
                                | false -> sprintf "ChoiceIndex = %d" idx
                            | CEC_enum (enm,d)  ->
                                let refToStr id =
                                    match id with
                                    | ReferenceToType sn -> sn |> List.rev |> List.head |> (fun x -> x.AsString)
                                sprintf "%s = %s" (refToStr d.id) c.Name.Value
                            | CEC_presWhen      ->
                                let getPresenceSingle (pc:AcnGenericTypes.AcnPresentWhenConditionChoiceChild) =
                                    match pc with
                                    | AcnGenericTypes.PresenceInt   (rp, intLoc) -> sprintf "%s=%A" rp.AsString intLoc.Value
                                    | AcnGenericTypes.PresenceStr   (rp, strLoc) -> sprintf "%s=%A" rp.AsString strLoc.Value
                                c.acnPresentWhenConditions |> Seq.map getPresenceSingle |> Seq.StrJoin " AND "
                    let x = c.chType.icdFunction
                    match x.canBeEmbedded with
                    | true -> x.createRowsFunc c.Name.Value optionality childComments
                    | false ->
                        let sType = TypeHash x.typeAss.hash
                        [{IcdRow.fieldName = c.Name.Value; comments = comments; sPresent=optionality;sType=sType; sConstraint=None; minLengthInBits = c.chType.acnMinSizeInBits; maxLengthInBits=c.chType.acnMaxSizeInBits;sUnits=None; rowType = IcdRowType.LengthDeterminantRow; idxOffset = None}]) |>
            List.collect id
        uperPresenceMask@chRows |> List.mapi(fun i r -> {r with idxOffset = Some (i+1)})

    let icd = {IcdArgAux.canBeEmbedded = false; baseAsn1Kind = (getASN1Name t); rowsFunc = icdFnc; commentsForTas=extraComment; scope="type"; name= None}

    createAcnFunction r lm codec t typeDefinition  isValidFunc  funcBody (fun atc -> true) icd soSparkAnnotations [] us, ec


let createReferenceFunction (r:Asn1AcnAst.AstRoot) (deps:Asn1AcnAst.AcnInsertedFieldDependencies) (lm:LanguageMacros) (codec:CommonTypes.Codec) (t:Asn1AcnAst.Asn1Type) (o:Asn1AcnAst.ReferenceType) (typeDefinition:TypeDefinitionOrReference) (isValidFunc: IsValidFunction option) (baseType:Asn1Type) (us:State)  =
  let baseTypeDefinitionName, baseFncName = getBaseFuncName lm typeDefinition o t.id "_ACN" codec
  let x = baseType.icdFunction
  let td = lm.lg.getTypeDefinition t.FT_TypeDefinition
  let getNewSType (r:IcdRow) =
    let newType =
        match r.sType with
        | TypeHash hash   -> TypeHash hash
        | IcdPlainType plainType when r.rowType = FieldRow -> IcdPlainType (td.asn1Name + "(" + plainType + ")")
        | IcdPlainType plainType -> IcdPlainType plainType
    {r with sType = newType}

  let icdFnc,extraComment, name  =
    match o.encodingOptions with
    | None ->
        let name =
          match o.hasExtraConstrainsOrChildrenOrAcnArgs with
          | false -> None
          | true -> Some t.id.AsString.RDD

        let icdFnc fieldName sPresent comments  =
            let rows = x.createRowsFunc fieldName sPresent comments
            rows |> List.map(fun r -> getNewSType r)

        icdFnc, x.typeAss.comments, name
    | Some encOptions ->
        let lengthDetRow =
            match encOptions.acnEncodingClass with
            | SZ_EC_LENGTH_EMBEDDED  nSizeInBits ->
                let sCommentUnit = match encOptions.octOrBitStr with ContainedInOctString -> "bytes" | ContainedInBitString -> "bits"

                [ {IcdRow.fieldName = "Length"; comments = [$"The number of {sCommentUnit} used in the encoding"]; sPresent="always";sType=IcdPlainType "INTEGER"; sConstraint=None; minLengthInBits = nSizeInBits ;maxLengthInBits=nSizeInBits;sUnits=None; rowType = IcdRowType.LengthDeterminantRow; idxOffset = None}]
            | _ -> []
        let icdFnc fieldName sPresent comments  =
            let rows = x.createRowsFunc fieldName sPresent comments |> List.map(fun r -> getNewSType r)
            lengthDetRow@rows |> List.mapi(fun i r -> {r with idxOffset = Some (i+1)})
        icdFnc, ("OCTET STING CONTAINING BY"::x.typeAss.comments), Some (t.id.AsString.RDD + "_OCT_STR" )


  let icd = {IcdArgAux.canBeEmbedded = x.canBeEmbedded; baseAsn1Kind = (getASN1Name t); rowsFunc = icdFnc; commentsForTas=extraComment; scope="REFTYPE"; name=name}

  match o.encodingOptions with
  | None          ->
      match o.hasExtraConstrainsOrChildrenOrAcnArgs with
      | true  ->
          // TODO: this is where stuff gets inlined
          match codec with
            | Codec.Encode  -> baseType.getAcnFunction codec, us
            | Codec.Decode  ->
                let paramsArgsPairs = List.zip o.acnArguments o.resolvedType.acnParameters
                let baseTypeAcnFunction = baseType.getAcnFunction codec
                let ret =
                    match baseTypeAcnFunction with
                    | None  -> None
                    | Some baseTypeAcnFunction   ->
                        let funcBody us (acnArgs: (AcnGenericTypes.RelativePath*AcnGenericTypes.AcnParameter) list) (nestingScope: NestingScope) (p:CallerScope) =
                            baseTypeAcnFunction.funcBody us (acnArgs@paramsArgsPairs) nestingScope p
                        Some  {baseTypeAcnFunction with funcBody = funcBody}

                ret, us
      | false ->
            let funcBody (us:State) (errCode:ErrorCode) (acnArgs: (AcnGenericTypes.RelativePath*AcnGenericTypes.AcnParameter) list) (nestingScope: NestingScope) (p:CallerScope) =
                let pp, resultExpr =
                    let str = lm.lg.getParamValue t p.arg codec
                    match codec, lm.lg.decodingKind with
                    | Decode, Copy ->
                        let toc = ToC str
                        toc, Some toc
                    | _ -> str, None
                let funcBodyContent = callBaseTypeFunc lm pp baseFncName codec
                Some ({AcnFuncBodyResult.funcBody = funcBodyContent; errCodes = [errCode]; localVariables = []; bValIsUnReferenced= false; bBsIsUnReferenced=false; resultExpr=resultExpr; typeEncodingKind=Some (ReferenceEncodingType baseTypeDefinitionName)}), us


            let soSparkAnnotations = Some(sparkAnnotations lm (typeDefinition.longTypedefName2 lm.lg.hasModules) codec)
            let a, ns = createAcnFunction r lm codec t typeDefinition  isValidFunc funcBody (fun atc -> true) icd soSparkAnnotations [] us
            Some a, ns

    | Some encOptions ->
        //contained type i.e. MyOct ::= OCTET STRING (CONTAINING Other-Type)
        let loc = o.tasName.Location
        let sReqBytesForUperEncoding = sprintf "%s_REQUIRED_BYTES_FOR_ACN_ENCODING" baseTypeDefinitionName
        let sReqBitForUperEncoding = sprintf "%s_REQUIRED_BITS_FOR_ACN_ENCODING" baseTypeDefinitionName

        let octet_string_containing_func            = lm.acn.octet_string_containing_func
        let bit_string_containing_func              = lm.acn.bit_string_containing_func
        let octet_string_containing_ext_field_func  = lm.acn.octet_string_containing_ext_field_func
        let bit_string_containing_ext_field_func    = lm.acn.bit_string_containing_ext_field_func

        let baseTypeAcnFunction = baseType.getAcnFunction codec

        let funcBody (errCode:ErrorCode) (acnArgs: (AcnGenericTypes.RelativePath*AcnGenericTypes.AcnParameter) list) (nestingScope: NestingScope) (p:CallerScope) =
            let pp, resultExpr =
                let str = lm.lg.getParamValue t p.arg codec
                match codec, lm.lg.decodingKind with
                | Decode, Copy ->
                    let toc = ToC str
                    toc, Some toc
                | _ -> str, None
            let funcBodyContent, errCodes, localVariables =
                match encOptions.acnEncodingClass, encOptions.octOrBitStr with
                | SZ_EC_ExternalField    relPath    , ContainedInOctString  ->
                    let filterDependency (d:AcnDependency) =
                        match d.dependencyKind with
                        | AcnDepSizeDeterminant_bit_oct_str_contain _   -> true
                        | _                              -> false
                    let extField        = getExternalField0 r deps t.id filterDependency
                    let soInner, errCodes0, localVariables0 =
                        match baseTypeAcnFunction with
                        | None  -> None, [], []
                        | Some baseTypeAcnFunction   ->
                            let acnRes, ns = baseTypeAcnFunction.funcBody us acnArgs nestingScope p
                            match acnRes with
                            | None  -> None, [], []
                            | Some r -> Some r.funcBody, r.errCodes, r.localVariables

                    let fncBody = octet_string_containing_ext_field_func pp baseFncName sReqBytesForUperEncoding extField errCode.errCodeName soInner codec
                    fncBody, errCode::errCodes0,localVariables0
                | SZ_EC_ExternalField    relPath    , ContainedInBitString  ->
                    let extField        = getExternalField r deps t.id
                    let fncBody = bit_string_containing_ext_field_func pp baseFncName sReqBytesForUperEncoding sReqBitForUperEncoding extField errCode.errCodeName codec
                    fncBody, [errCode],[]
                | SZ_EC_FIXED_SIZE        , ContainedInOctString  ->
                    let fncBody = octet_string_containing_func pp baseFncName sReqBytesForUperEncoding 0I encOptions.minSize.acn encOptions.maxSize.acn true codec
                    fncBody, [errCode],[]
                | SZ_EC_LENGTH_EMBEDDED nBits , ContainedInOctString  ->
                    let fncBody = octet_string_containing_func pp baseFncName sReqBytesForUperEncoding nBits encOptions.minSize.acn encOptions.maxSize.acn false codec
                    fncBody, [errCode],[]
                | SZ_EC_FIXED_SIZE                        , ContainedInBitString  ->
                    let fncBody = bit_string_containing_func pp baseFncName sReqBytesForUperEncoding sReqBitForUperEncoding 0I encOptions.minSize.acn encOptions.maxSize.acn true codec
                    fncBody, [errCode],[]
                | SZ_EC_LENGTH_EMBEDDED nBits                 , ContainedInBitString  ->
                    let fncBody = bit_string_containing_func pp baseFncName sReqBytesForUperEncoding sReqBitForUperEncoding nBits encOptions.minSize.acn encOptions.maxSize.acn false codec
                    fncBody, [errCode],[]
                | SZ_EC_TerminationPattern nullVal  ,  _                    ->  raise(SemanticError (loc, "Invalid type for parameter4"))
            // TODO: Needs acnEncodingClass
            Some ({AcnFuncBodyResult.funcBody = funcBodyContent; errCodes = errCodes; localVariables = localVariables; bValIsUnReferenced= false; bBsIsUnReferenced=false; resultExpr=resultExpr; typeEncodingKind=Some (ReferenceEncodingType baseTypeDefinitionName)})

        let soSparkAnnotations = Some(sparkAnnotations lm (typeDefinition.longTypedefName2 lm.lg.hasModules) codec)
        let a,b = createAcnFunction r lm codec t typeDefinition  isValidFunc  (fun us e acnArgs nestingScope p -> funcBody e acnArgs nestingScope p, us) (fun atc -> true) icd soSparkAnnotations [] us
        Some a, b
