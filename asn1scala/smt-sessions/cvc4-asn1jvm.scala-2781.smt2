; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67094 () Bool)

(assert start!67094)

(declare-fun b!301144 () Bool)

(declare-datatypes ((Unit!21086 0))(
  ( (Unit!21087) )
))
(declare-fun e!216271 () Unit!21086)

(declare-fun Unit!21088 () Unit!21086)

(assert (=> b!301144 (= e!216271 Unit!21088)))

(declare-fun b!301145 () Bool)

(declare-fun e!216264 () Unit!21086)

(declare-fun Unit!21089 () Unit!21086)

(assert (=> b!301145 (= e!216264 Unit!21089)))

(declare-fun lt!436509 () (_ BitVec 32))

(declare-fun call!5429 () Bool)

(declare-datatypes ((tuple4!1066 0))(
  ( (tuple4!1067 (_1!13188 (_ BitVec 32)) (_2!13188 (_ BitVec 32)) (_3!1490 (_ BitVec 32)) (_4!533 (_ BitVec 32))) )
))
(declare-fun lt!436510 () tuple4!1066)

(declare-datatypes ((array!18255 0))(
  ( (array!18256 (arr!9012 (Array (_ BitVec 32) (_ BitVec 8))) (size!7929 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18255)

(declare-fun a2!948 () array!18255)

(declare-fun bm!5426 () Bool)

(declare-fun c!14140 () Bool)

(declare-fun lt!436513 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5426 (= call!5429 (byteRangesEq!0 (select (arr!9012 a1!948) (_3!1490 lt!436510)) (select (arr!9012 a2!948) (_3!1490 lt!436510)) lt!436513 (ite c!14140 lt!436509 #b00000000000000000000000000000111)))))

(declare-fun b!301146 () Bool)

(declare-fun lt!436517 () Unit!21086)

(assert (=> b!301146 (= e!216264 lt!436517)))

(declare-fun lt!436518 () tuple4!1066)

(declare-fun arrayRangesEqImpliesEq!246 (array!18255 array!18255 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21086)

(assert (=> b!301146 (= lt!436517 (arrayRangesEqImpliesEq!246 a1!948 a2!948 (_1!13188 lt!436510) (_3!1490 lt!436518) (_2!13188 lt!436510)))))

(assert (=> b!301146 (= (select (arr!9012 a1!948) (_3!1490 lt!436518)) (select (arr!9012 a2!948) (_3!1490 lt!436518)))))

(declare-fun res!248035 () Bool)

(declare-fun e!216266 () Bool)

(assert (=> start!67094 (=> (not res!248035) (not e!216266))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(assert (=> start!67094 (= res!248035 (and (bvsle (size!7929 a1!948) (size!7929 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67094 e!216266))

(assert (=> start!67094 true))

(declare-fun array_inv!7541 (array!18255) Bool)

(assert (=> start!67094 (array_inv!7541 a1!948)))

(assert (=> start!67094 (array_inv!7541 a2!948)))

(declare-fun b!301147 () Bool)

(declare-fun e!216270 () Unit!21086)

(declare-fun lt!436511 () Unit!21086)

(assert (=> b!301147 (= e!216270 lt!436511)))

(declare-fun arrayRangesEqSlicedLemma!201 (array!18255 array!18255 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21086)

(assert (=> b!301147 (= lt!436511 (arrayRangesEqSlicedLemma!201 a1!948 a2!948 (_1!13188 lt!436510) (_2!13188 lt!436510) (_1!13188 lt!436518) (_2!13188 lt!436518)))))

(declare-fun arrayRangesEq!1591 (array!18255 array!18255 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!301147 (arrayRangesEq!1591 a1!948 a2!948 (_1!13188 lt!436518) (_2!13188 lt!436518))))

(declare-fun e!216272 () Bool)

(declare-fun b!301148 () Bool)

(assert (=> b!301148 (= e!216272 (byteRangesEq!0 (select (arr!9012 a1!948) (_4!533 lt!436510)) (select (arr!9012 a2!948) (_4!533 lt!436510)) #b00000000000000000000000000000000 lt!436509))))

(declare-fun b!301149 () Bool)

(declare-fun res!248034 () Bool)

(assert (=> b!301149 (= res!248034 (= lt!436509 #b00000000000000000000000000000000))))

(assert (=> b!301149 (=> res!248034 e!216272)))

(declare-fun e!216267 () Bool)

(assert (=> b!301149 (= e!216267 e!216272)))

(declare-fun b!301150 () Bool)

(declare-fun res!248031 () Bool)

(declare-fun e!216273 () Bool)

(assert (=> b!301150 (=> (not res!248031) (not e!216273))))

(declare-fun arrayBitRangesEq!0 (array!18255 array!18255 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!301150 (= res!248031 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!301151 () Bool)

(declare-fun res!248033 () Bool)

(assert (=> b!301151 (=> (not res!248033) (not e!216273))))

(declare-fun lt!436508 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!301151 (= res!248033 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!436508) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!301152 () Bool)

(declare-fun lt!436512 () Unit!21086)

(assert (=> b!301152 (= e!216271 lt!436512)))

(assert (=> b!301152 (= lt!436512 (arrayRangesEqImpliesEq!246 a1!948 a2!948 (_1!13188 lt!436510) (_4!533 lt!436518) (_2!13188 lt!436510)))))

(assert (=> b!301152 (= (select (arr!9012 a1!948) (_4!533 lt!436518)) (select (arr!9012 a2!948) (_4!533 lt!436518)))))

(declare-fun b!301153 () Bool)

(declare-fun e!216268 () Bool)

(assert (=> b!301153 (= e!216268 call!5429)))

(declare-fun b!301154 () Bool)

(declare-fun e!216269 () Bool)

(assert (=> b!301154 (= e!216273 e!216269)))

(declare-fun res!248036 () Bool)

(assert (=> b!301154 (=> (not res!248036) (not e!216269))))

(assert (=> b!301154 (= res!248036 e!216268)))

(assert (=> b!301154 (= c!14140 (= (_3!1490 lt!436510) (_4!533 lt!436510)))))

(declare-fun lt!436516 () Unit!21086)

(assert (=> b!301154 (= lt!436516 e!216270)))

(declare-fun c!14142 () Bool)

(assert (=> b!301154 (= c!14142 (bvslt (_1!13188 lt!436518) (_2!13188 lt!436518)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1066)

(assert (=> b!301154 (= lt!436518 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!301154 (= lt!436509 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!301154 (= lt!436513 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!301154 (= lt!436510 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!301155 () Bool)

(assert (=> b!301155 (= e!216266 e!216273)))

(declare-fun res!248030 () Bool)

(assert (=> b!301155 (=> (not res!248030) (not e!216273))))

(assert (=> b!301155 (= res!248030 (and (bvsle toBit!258 lt!436508) (bvsle fromBit!258 lt!436508)))))

(assert (=> b!301155 (= lt!436508 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7929 a1!948))))))

(declare-fun b!301156 () Bool)

(assert (=> b!301156 (= e!216269 false)))

(declare-fun lt!436515 () Unit!21086)

(assert (=> b!301156 (= lt!436515 e!216271)))

(declare-fun c!14141 () Bool)

(assert (=> b!301156 (= c!14141 (and (bvslt (_4!533 lt!436518) (_4!533 lt!436510)) (bvslt (_3!1490 lt!436510) (_4!533 lt!436518))))))

(declare-fun lt!436514 () Unit!21086)

(assert (=> b!301156 (= lt!436514 e!216264)))

(declare-fun c!14139 () Bool)

(assert (=> b!301156 (= c!14139 (and (bvslt (_3!1490 lt!436510) (_3!1490 lt!436518)) (bvslt (_3!1490 lt!436518) (_4!533 lt!436510))))))

(declare-fun b!301157 () Bool)

(assert (=> b!301157 (= e!216268 e!216267)))

(declare-fun res!248032 () Bool)

(assert (=> b!301157 (= res!248032 call!5429)))

(assert (=> b!301157 (=> (not res!248032) (not e!216267))))

(declare-fun b!301158 () Bool)

(declare-fun Unit!21090 () Unit!21086)

(assert (=> b!301158 (= e!216270 Unit!21090)))

(assert (= (and start!67094 res!248035) b!301155))

(assert (= (and b!301155 res!248030) b!301150))

(assert (= (and b!301150 res!248031) b!301151))

(assert (= (and b!301151 res!248033) b!301154))

(assert (= (and b!301154 c!14142) b!301147))

(assert (= (and b!301154 (not c!14142)) b!301158))

(assert (= (and b!301154 c!14140) b!301153))

(assert (= (and b!301154 (not c!14140)) b!301157))

(assert (= (and b!301157 res!248032) b!301149))

(assert (= (and b!301149 (not res!248034)) b!301148))

(assert (= (or b!301153 b!301157) bm!5426))

(assert (= (and b!301154 res!248036) b!301156))

(assert (= (and b!301156 c!14139) b!301146))

(assert (= (and b!301156 (not c!14139)) b!301145))

(assert (= (and b!301156 c!14141) b!301152))

(assert (= (and b!301156 (not c!14141)) b!301144))

(declare-fun m!440015 () Bool)

(assert (=> bm!5426 m!440015))

(declare-fun m!440017 () Bool)

(assert (=> bm!5426 m!440017))

(assert (=> bm!5426 m!440015))

(assert (=> bm!5426 m!440017))

(declare-fun m!440019 () Bool)

(assert (=> bm!5426 m!440019))

(declare-fun m!440021 () Bool)

(assert (=> b!301152 m!440021))

(declare-fun m!440023 () Bool)

(assert (=> b!301152 m!440023))

(declare-fun m!440025 () Bool)

(assert (=> b!301152 m!440025))

(declare-fun m!440027 () Bool)

(assert (=> b!301154 m!440027))

(declare-fun m!440029 () Bool)

(assert (=> b!301154 m!440029))

(declare-fun m!440031 () Bool)

(assert (=> b!301150 m!440031))

(declare-fun m!440033 () Bool)

(assert (=> b!301146 m!440033))

(declare-fun m!440035 () Bool)

(assert (=> b!301146 m!440035))

(declare-fun m!440037 () Bool)

(assert (=> b!301146 m!440037))

(declare-fun m!440039 () Bool)

(assert (=> start!67094 m!440039))

(declare-fun m!440041 () Bool)

(assert (=> start!67094 m!440041))

(declare-fun m!440043 () Bool)

(assert (=> b!301148 m!440043))

(declare-fun m!440045 () Bool)

(assert (=> b!301148 m!440045))

(assert (=> b!301148 m!440043))

(assert (=> b!301148 m!440045))

(declare-fun m!440047 () Bool)

(assert (=> b!301148 m!440047))

(declare-fun m!440049 () Bool)

(assert (=> b!301147 m!440049))

(declare-fun m!440051 () Bool)

(assert (=> b!301147 m!440051))

(push 1)

