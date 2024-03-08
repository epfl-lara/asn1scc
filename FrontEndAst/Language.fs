﻿module Language
open CommonTypes
open System.Numerics
open DAst
open FsUtils
open AbstractMacros

type Uper_parts = {
    createLv : string -> LocalVariable
    requires_sBlockIndex : bool
    requires_sBLJ        : bool
    requires_charIndex   : bool
    requires_IA5String_i : bool
    count_var            : LocalVariable
    requires_presenceBit : bool
    catd                 : bool //if true then Choice Alternatives are Temporarily Decoded (i.e. in _tmp variables in current scope)
    //createBitStringFunction  : (CallerScope -> CommonTypes.Codec -> ErrorCode -> int -> BigInteger -> BigInteger -> BigInteger -> string -> BigInteger -> bool -> bool -> (string * LocalVariable list)) -> CommonTypes.Codec -> ReferenceToType -> TypeDefinitionOrReference -> bool -> BigInteger -> BigInteger -> BigInteger -> ErrorCode ->  CallerScope -> UPERFuncBodyResult
    seqof_lv             : ReferenceToType -> BigInteger -> BigInteger -> LocalVariable list
    exprMethodCall       : Asn1TypeKind -> string -> string

}

type Acn_parts = {
    null_valIsUnReferenced              : bool
    checkBitPatternPresentResult        : bool
    getAcnDepSizeDeterminantLocVars     : string -> LocalVariable list
    createLocalVariableEnum             : string -> LocalVariable       //create a local integer variable that is used to store the value of an enumerated type. The input is the RTL integer type
    choice_handle_always_absent_child   : bool
    choice_requires_tmp_decoding        : bool
}
type Initialize_parts = {
    zeroIA5String_localVars             : int -> LocalVariable list
    choiceComponentTempInit             : bool
    initMethSuffix                      : Asn1TypeKind -> string // TODO REMOVE?
}

type Atc_parts = {
    uperPrefix : string
    acnPrefix : string
    xerPrefix : string
    berPrefix : string
}


type InitMethod =
    | Procedure
    | Function

type DecodingKind =
    | InPlace
    | Copy

type UncheckedAccessKind =
    | FullAccess // unwrap all selection, including the last one
    | PartialAccess // unwrap all but the last selection

type TypeInfo = {
    uperMaxSizeBits: BigInteger
    acnMaxSizeBits: BigInteger
    typeKind: TypeEncodingKind option
} with
    member this.maxSize (enc: Asn1Encoding): BigInteger =
        match enc with
        | ACN -> this.acnMaxSizeBits
        | UPER -> this.uperMaxSizeBits
        | _ -> raise (BugErrorException $"Unexpected encoding: {enc}")

type SequenceChildProps = {
    // TODO: say it's none for presence bit
    // TODO: String not ideal, but array selection index is string anyway...
    sel: string option
    // TODO: What about padding?
    uperMaxOffset: BigInteger
    acnMaxOffset: BigInteger
    typeInfo: TypeInfo
} with
    member this.maxOffset (enc: Asn1Encoding): BigInteger =
        match enc with
        | ACN -> this.acnMaxOffset
        | UPER -> this.uperMaxOffset
        | _ -> raise (BugErrorException $"Unexpected encoding: {enc}")

type SequenceProofGen = {
    children: SequenceChildProps list
} with
    // TODO: What about padding?
    member this.maxSize (enc: Asn1Encoding): BigInteger =
        this.children |> List.map (fun c -> c.typeInfo.maxSize enc) |> List.sum

[<AbstractClass>]
type ILangGeneric () =
    abstract member ArrayStartIndex : int
    abstract member getPointer      : Selection -> string;
    abstract member getPointerUnchecked: Selection -> UncheckedAccessKind -> string;
    abstract member getValue        : Selection -> string;
    abstract member getValueUnchecked: Selection -> UncheckedAccessKind -> string;
    abstract member joinSelectionUnchecked: Selection -> UncheckedAccessKind -> string;
    abstract member getAccess       : Selection -> string;
    abstract member getAccess2      : Accessor  -> string;
    abstract member getStar         : Selection -> string;
    abstract member getPtrPrefix    : Selection -> string;
    abstract member getPtrSuffix    : Selection -> string;

    abstract member getArrayItem    : sel: Selection -> idx: string -> childTypeIsString: bool -> Selection;
    abstract member asn1SccIntValueToString : BigInteger -> unsigned: bool -> string;
    abstract member intValueToString : BigInteger -> Asn1AcnAst.IntegerClass -> string;
    abstract member doubleValueToString : double -> string
    abstract member initializeString : int -> string
    abstract member supportsInitExpressions : bool
    abstract member setNamedItemBackendName0 : Asn1Ast.NamedItem -> string -> Asn1Ast.NamedItem
    abstract member getNamedItemBackendName0 : Asn1Ast.NamedItem -> string
    abstract member getNamedItemBackendName  : TypeDefinitionOrReference option -> Asn1AcnAst.NamedItem -> string
    abstract member getNamedItemBackendName2  : string -> string -> Asn1AcnAst.NamedItem -> string
    abstract member decodeEmptySeq  : string -> string option
    abstract member decode_nullType : string -> string option
    abstract member castExpression  : string -> string -> string
    abstract member createSingleLineComment : string -> string
    abstract member SpecNameSuffix: string
    abstract member SpecExtension : string
    abstract member BodyExtension : string
    abstract member Keywords : string list
    abstract member isCaseSensitive : bool

    abstract member RtlFuncNames : string list
    abstract member AlwaysPresentRtlFuncNames : string list

    abstract member detectFunctionCalls : string -> string -> string list
    abstract member removeFunctionFromHeader : string -> string -> string
    abstract member removeFunctionFromBody : string -> string -> string


    abstract member getRtlFiles : Asn1Encoding list -> string list -> string list

    abstract member getChildInfoName : Asn1Ast.ChildInfo -> string
    abstract member setChildInfoName : Asn1Ast.ChildInfo -> string -> Asn1Ast.ChildInfo

    abstract member getAsn1ChildBackendName0  : Asn1AcnAst.Asn1Child -> string
    abstract member getAsn1ChChildBackendName0: Asn1AcnAst.ChChildInfo -> string
    abstract member getChoiceChildPresentWhenName : Asn1AcnAst.Choice -> Asn1AcnAst.ChChildInfo -> string

    abstract member getAsn1ChildBackendName  : Asn1Child -> string
    abstract member getAsn1ChChildBackendName: ChChildInfo -> string


    abstract member choiceIDForNone : Map<string,int> -> ReferenceToType -> string

    abstract member Length          : string -> string -> string
    abstract member typeDef         : Map<ProgrammingLanguage, FE_PrimitiveTypeDefinition> -> FE_PrimitiveTypeDefinition
    abstract member getTypeDefinition : Map<ProgrammingLanguage, FE_TypeDefinition> -> FE_TypeDefinition
    abstract member getEnumTypeDefinition : Map<ProgrammingLanguage, FE_EnumeratedTypeDefinition>  -> FE_EnumeratedTypeDefinition
    abstract member getStrTypeDefinition : Map<ProgrammingLanguage, FE_StringTypeDefinition> -> FE_StringTypeDefinition
    abstract member getChoiceTypeDefinition : Map<ProgrammingLanguage, FE_ChoiceTypeDefinition> -> FE_ChoiceTypeDefinition
    abstract member getSequenceTypeDefinition :Map<ProgrammingLanguage, FE_SequenceTypeDefinition> -> FE_SequenceTypeDefinition
    abstract member getSizeableTypeDefinition : Map<ProgrammingLanguage, FE_SizeableTypeDefinition> -> FE_SizeableTypeDefinition

    abstract member getSeqChild: sel: Selection -> childName: string -> childTypeIsString: bool -> childIsOptional: bool -> Selection;
    //return a string that contains code with a boolean expression that is true if the child is present
    abstract member getSeqChildIsPresent   : Selection -> string -> string
    abstract member getChChild      : Selection -> string -> bool -> Selection;
    abstract member getLocalVariableDeclaration : LocalVariable -> string;
    abstract member getLongTypedefName : TypeDefinitionOrReference -> string;
    abstract member getEmptySequenceInitExpression : string -> string
    abstract member callFuncWithNoArgs : unit -> string

    abstract member presentWhenName : TypeDefinitionOrReference option -> ChChildInfo -> string;
    abstract member getParamTypeSuffix : Asn1AcnAst.Asn1Type -> string -> Codec -> CallerScope;
    abstract member getParamValue   : Asn1AcnAst.Asn1Type -> Selection -> Codec -> string

    abstract member getParamType    : Asn1AcnAst.Asn1Type -> Codec -> CallerScope;
    abstract member rtlModuleName   : string
    abstract member hasModules      : bool
    abstract member allowsSrcFilesWithNoFunctions : bool
    abstract member requiresValueAssignmentsInSrcFile      : bool
    abstract member requiresHandlingOfEmptySequences : bool
    abstract member requiresHandlingOfZeroArrays : bool

    abstract member supportsStaticVerification      : bool
    abstract member AssignOperator   :string
    abstract member TrueLiteral      :string
    abstract member FalseLiteral     :string
    abstract member emptyStatement   :string
    abstract member bitStreamName    :string
    abstract member unaryNotOperator :string
    abstract member modOp            :string
    abstract member eqOp             :string
    abstract member neqOp            :string
    abstract member andOp            :string
    abstract member orOp             :string
    abstract member initMethod       :InitMethod
    abstract member decodingKind     :DecodingKind
    abstract member usesWrappedOptional: bool
    abstract member bitStringValueToByteArray:  BitStringValue -> byte[]

    abstract member toHex : int -> string
    abstract member uper  : Uper_parts;
    abstract member acn   : Acn_parts
    abstract member init  : Initialize_parts
    abstract member atc   : Atc_parts
    abstract member getValueAssignmentName : ValueAssignment -> string

    abstract member CreateMakeFile : AstRoot -> DirInfo -> unit
    abstract member CreateAuxFiles : AstRoot -> DirInfo -> string list*string list -> unit

    abstract member getDirInfo : Targets option -> string -> DirInfo
    abstract member getTopLevelDirs : Targets option -> string list
    abstract member getBoardNames : Targets option -> string list
    abstract member getBoardDirs : Targets option -> string list

    abstract member generatePrecond: Asn1Encoding -> t: Asn1AcnAst.Asn1Type -> string list
    abstract member generatePostcond: Asn1Encoding -> funcNameBase: string -> p: CallerScope -> t: Asn1AcnAst.Asn1Type -> Codec -> string option
    abstract member generateSequenceChildProof: Asn1Encoding -> stmts: string option list -> SequenceProofGen -> Codec -> string list

    default this.getParamType (t:Asn1AcnAst.Asn1Type) (c:Codec) : CallerScope =
        this.getParamTypeSuffix t "" c
    default this.requiresHandlingOfEmptySequences = false
    default this.requiresHandlingOfZeroArrays = false
    default this.RtlFuncNames = []
    default this.AlwaysPresentRtlFuncNames = []
    default this.detectFunctionCalls (sourceCode: string) (functionName: string) = []
    default this.removeFunctionFromHeader (sourceCode: string) (functionName: string) : string =
        sourceCode
    default this.removeFunctionFromBody (sourceCode: string) (functionName: string) : string =
        sourceCode

    default this.generatePrecond _ _ = []
    default this.generatePostcond _ _ _ _ _ = None
    default this.generateSequenceChildProof _ stmts _ _ = stmts |> List.choose id

    //most programming languages are case sensitive
    default _.isCaseSensitive = true
    default _.getBoardNames _ = []
    default _.getBoardDirs  _ = []


type LanguageMacros = {
    lg      : ILangGeneric;
    init    : IInit;
    equal   : IEqual;
    typeDef : ITypeDefinition;
    isvalid : IIsValid
    vars    : IVariables
    uper    : IUper
    acn     : IAcn
    atc     : ITestCases
    xer     : IXer
    src     : ISrcBody
}

type Selection with
    member this.joined (lg: ILangGeneric): string =
        List.fold (fun str accessor -> $"{str}{lg.getAccess2 accessor}") this.receiverId this.path
    member this.joinedUnchecked (lg: ILangGeneric) (kind: UncheckedAccessKind): string =
        lg.joinSelectionUnchecked this kind
    member this.asIdentifier: string =
        List.fold (fun str accessor ->
            let acc =
                match accessor with
                | ValueAccess (id, _, _) -> ToC id
                | PointerAccess (id, _, _) -> ToC id
                | ArrayAccess _ -> "arr"
            $"{str}_{acc}") this.receiverId this.path
