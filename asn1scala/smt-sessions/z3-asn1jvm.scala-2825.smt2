; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68366 () Bool)

(assert start!68366)

(declare-fun b!306981 () Bool)

(declare-datatypes ((Unit!21414 0))(
  ( (Unit!21415) )
))
(declare-fun e!221199 () Unit!21414)

(declare-fun Unit!21416 () Unit!21414)

(assert (=> b!306981 (= e!221199 Unit!21416)))

(declare-fun res!251991 () Bool)

(declare-fun e!221200 () Bool)

(assert (=> start!68366 (=> (not res!251991) (not e!221200))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18604 0))(
  ( (array!18605 (arr!9143 (Array (_ BitVec 32) (_ BitVec 8))) (size!8060 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18604)

(declare-fun a2!948 () array!18604)

(assert (=> start!68366 (= res!251991 (and (bvsle (size!8060 a1!948) (size!8060 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!68366 e!221200))

(assert (=> start!68366 true))

(declare-fun array_inv!7672 (array!18604) Bool)

(assert (=> start!68366 (array_inv!7672 a1!948)))

(assert (=> start!68366 (array_inv!7672 a2!948)))

(declare-fun b!306982 () Bool)

(declare-fun res!251992 () Bool)

(declare-fun e!221192 () Bool)

(assert (=> b!306982 (=> (not res!251992) (not e!221192))))

(declare-datatypes ((tuple4!1262 0))(
  ( (tuple4!1263 (_1!13286 (_ BitVec 32)) (_2!13286 (_ BitVec 32)) (_3!1588 (_ BitVec 32)) (_4!631 (_ BitVec 32))) )
))
(declare-fun lt!439984 () tuple4!1262)

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!306982 (= res!251992 (byteRangesEq!0 (select (arr!9143 a1!948) (_3!1588 lt!439984)) (select (arr!9143 a2!948) (_3!1588 lt!439984)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111))))

(declare-fun b!306983 () Bool)

(declare-fun e!221201 () Bool)

(declare-fun call!5882 () Bool)

(assert (=> b!306983 (= e!221201 call!5882)))

(declare-fun b!306984 () Bool)

(declare-fun e!221196 () Bool)

(assert (=> b!306984 (= e!221200 e!221196)))

(declare-fun res!251989 () Bool)

(assert (=> b!306984 (=> (not res!251989) (not e!221196))))

(declare-fun lt!439981 () (_ BitVec 64))

(assert (=> b!306984 (= res!251989 (and (bvsle toBit!258 lt!439981) (bvsle fromBit!258 lt!439981)))))

(assert (=> b!306984 (= lt!439981 (bvmul ((_ sign_extend 32) (size!8060 a1!948)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!306985 () Bool)

(declare-fun toSlice!52 () (_ BitVec 64))

(assert (=> b!306985 (= e!221192 (and (not (= ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000)) (or (bvslt (_4!631 lt!439984) #b00000000000000000000000000000000) (bvsge (_4!631 lt!439984) (size!8060 a2!948)))))))

(declare-fun b!306986 () Bool)

(declare-fun res!251990 () Bool)

(declare-fun lt!439980 () (_ BitVec 32))

(assert (=> b!306986 (= res!251990 (= lt!439980 #b00000000000000000000000000000000))))

(declare-fun e!221194 () Bool)

(assert (=> b!306986 (=> res!251990 e!221194)))

(declare-fun e!221195 () Bool)

(assert (=> b!306986 (= e!221195 e!221194)))

(declare-fun b!306987 () Bool)

(declare-fun e!221197 () Bool)

(assert (=> b!306987 (= e!221197 e!221192)))

(declare-fun res!251997 () Bool)

(assert (=> b!306987 (=> (not res!251997) (not e!221192))))

(assert (=> b!306987 (= res!251997 (not (= (_3!1588 lt!439984) (_4!631 lt!439984))))))

(declare-fun lt!439979 () Unit!21414)

(assert (=> b!306987 (= lt!439979 e!221199)))

(declare-fun c!15081 () Bool)

(declare-fun lt!439976 () tuple4!1262)

(assert (=> b!306987 (= c!15081 (and (bvslt (_4!631 lt!439984) (_4!631 lt!439976)) (bvslt (_3!1588 lt!439976) (_4!631 lt!439984))))))

(declare-fun lt!439977 () Unit!21414)

(declare-fun e!221203 () Unit!21414)

(assert (=> b!306987 (= lt!439977 e!221203)))

(declare-fun c!15079 () Bool)

(assert (=> b!306987 (= c!15079 (and (bvslt (_3!1588 lt!439976) (_3!1588 lt!439984)) (bvslt (_3!1588 lt!439984) (_4!631 lt!439976))))))

(declare-fun b!306988 () Bool)

(declare-fun Unit!21417 () Unit!21414)

(assert (=> b!306988 (= e!221203 Unit!21417)))

(declare-fun b!306989 () Bool)

(declare-fun e!221198 () Unit!21414)

(declare-fun lt!439978 () Unit!21414)

(assert (=> b!306989 (= e!221198 lt!439978)))

(declare-fun arrayRangesEqSlicedLemma!284 (array!18604 array!18604 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21414)

(assert (=> b!306989 (= lt!439978 (arrayRangesEqSlicedLemma!284 a1!948 a2!948 (_1!13286 lt!439976) (_2!13286 lt!439976) (_1!13286 lt!439984) (_2!13286 lt!439984)))))

(declare-fun arrayRangesEq!1689 (array!18604 array!18604 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!306989 (arrayRangesEq!1689 a1!948 a2!948 (_1!13286 lt!439984) (_2!13286 lt!439984))))

(declare-fun b!306990 () Bool)

(declare-fun res!251995 () Bool)

(assert (=> b!306990 (=> (not res!251995) (not e!221196))))

(declare-fun arrayBitRangesEq!0 (array!18604 array!18604 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!306990 (= res!251995 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!306991 () Bool)

(assert (=> b!306991 (= e!221194 call!5882)))

(declare-fun b!306992 () Bool)

(assert (=> b!306992 (= e!221196 e!221197)))

(declare-fun res!251993 () Bool)

(assert (=> b!306992 (=> (not res!251993) (not e!221197))))

(assert (=> b!306992 (= res!251993 e!221201)))

(declare-fun c!15078 () Bool)

(assert (=> b!306992 (= c!15078 (= (_3!1588 lt!439976) (_4!631 lt!439976)))))

(declare-fun lt!439985 () Unit!21414)

(assert (=> b!306992 (= lt!439985 e!221198)))

(declare-fun c!15080 () Bool)

(assert (=> b!306992 (= c!15080 (bvslt (_1!13286 lt!439984) (_2!13286 lt!439984)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1262)

(assert (=> b!306992 (= lt!439984 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!306992 (= lt!439980 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!439983 () (_ BitVec 32))

(assert (=> b!306992 (= lt!439983 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306992 (= lt!439976 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!306993 () Bool)

(declare-fun res!251996 () Bool)

(assert (=> b!306993 (=> (not res!251996) (not e!221196))))

(assert (=> b!306993 (= res!251996 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!439981) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!306994 () Bool)

(declare-fun lt!439982 () Unit!21414)

(assert (=> b!306994 (= e!221199 lt!439982)))

(declare-fun arrayRangesEqImpliesEq!293 (array!18604 array!18604 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21414)

(assert (=> b!306994 (= lt!439982 (arrayRangesEqImpliesEq!293 a1!948 a2!948 (_1!13286 lt!439976) (_4!631 lt!439984) (_2!13286 lt!439976)))))

(assert (=> b!306994 (= (select (arr!9143 a1!948) (_4!631 lt!439984)) (select (arr!9143 a2!948) (_4!631 lt!439984)))))

(declare-fun b!306995 () Bool)

(assert (=> b!306995 (= e!221201 e!221195)))

(declare-fun res!251994 () Bool)

(assert (=> b!306995 (= res!251994 (byteRangesEq!0 (select (arr!9143 a1!948) (_3!1588 lt!439976)) (select (arr!9143 a2!948) (_3!1588 lt!439976)) lt!439983 #b00000000000000000000000000000111))))

(assert (=> b!306995 (=> (not res!251994) (not e!221195))))

(declare-fun b!306996 () Bool)

(declare-fun lt!439986 () Unit!21414)

(assert (=> b!306996 (= e!221203 lt!439986)))

(assert (=> b!306996 (= lt!439986 (arrayRangesEqImpliesEq!293 a1!948 a2!948 (_1!13286 lt!439976) (_3!1588 lt!439984) (_2!13286 lt!439976)))))

(assert (=> b!306996 (= (select (arr!9143 a1!948) (_3!1588 lt!439984)) (select (arr!9143 a2!948) (_3!1588 lt!439984)))))

(declare-fun b!306997 () Bool)

(declare-fun Unit!21418 () Unit!21414)

(assert (=> b!306997 (= e!221198 Unit!21418)))

(declare-fun bm!5879 () Bool)

(assert (=> bm!5879 (= call!5882 (byteRangesEq!0 (ite c!15078 (select (arr!9143 a1!948) (_3!1588 lt!439976)) (select (arr!9143 a1!948) (_4!631 lt!439976))) (ite c!15078 (select (arr!9143 a2!948) (_3!1588 lt!439976)) (select (arr!9143 a2!948) (_4!631 lt!439976))) (ite c!15078 lt!439983 #b00000000000000000000000000000000) lt!439980))))

(assert (= (and start!68366 res!251991) b!306984))

(assert (= (and b!306984 res!251989) b!306990))

(assert (= (and b!306990 res!251995) b!306993))

(assert (= (and b!306993 res!251996) b!306992))

(assert (= (and b!306992 c!15080) b!306989))

(assert (= (and b!306992 (not c!15080)) b!306997))

(assert (= (and b!306992 c!15078) b!306983))

(assert (= (and b!306992 (not c!15078)) b!306995))

(assert (= (and b!306995 res!251994) b!306986))

(assert (= (and b!306986 (not res!251990)) b!306991))

(assert (= (or b!306983 b!306991) bm!5879))

(assert (= (and b!306992 res!251993) b!306987))

(assert (= (and b!306987 c!15079) b!306996))

(assert (= (and b!306987 (not c!15079)) b!306988))

(assert (= (and b!306987 c!15081) b!306994))

(assert (= (and b!306987 (not c!15081)) b!306981))

(assert (= (and b!306987 res!251997) b!306982))

(assert (= (and b!306982 res!251992) b!306985))

(declare-fun m!445443 () Bool)

(assert (=> b!306996 m!445443))

(declare-fun m!445445 () Bool)

(assert (=> b!306996 m!445445))

(declare-fun m!445447 () Bool)

(assert (=> b!306996 m!445447))

(declare-fun m!445449 () Bool)

(assert (=> b!306989 m!445449))

(declare-fun m!445451 () Bool)

(assert (=> b!306989 m!445451))

(declare-fun m!445453 () Bool)

(assert (=> b!306992 m!445453))

(declare-fun m!445455 () Bool)

(assert (=> b!306992 m!445455))

(assert (=> b!306982 m!445445))

(assert (=> b!306982 m!445447))

(assert (=> b!306982 m!445445))

(assert (=> b!306982 m!445447))

(declare-fun m!445457 () Bool)

(assert (=> b!306982 m!445457))

(declare-fun m!445459 () Bool)

(assert (=> b!306990 m!445459))

(declare-fun m!445461 () Bool)

(assert (=> b!306995 m!445461))

(declare-fun m!445463 () Bool)

(assert (=> b!306995 m!445463))

(assert (=> b!306995 m!445461))

(assert (=> b!306995 m!445463))

(declare-fun m!445465 () Bool)

(assert (=> b!306995 m!445465))

(declare-fun m!445467 () Bool)

(assert (=> bm!5879 m!445467))

(declare-fun m!445469 () Bool)

(assert (=> bm!5879 m!445469))

(assert (=> bm!5879 m!445463))

(declare-fun m!445471 () Bool)

(assert (=> bm!5879 m!445471))

(assert (=> bm!5879 m!445461))

(declare-fun m!445473 () Bool)

(assert (=> start!68366 m!445473))

(declare-fun m!445475 () Bool)

(assert (=> start!68366 m!445475))

(declare-fun m!445477 () Bool)

(assert (=> b!306994 m!445477))

(declare-fun m!445479 () Bool)

(assert (=> b!306994 m!445479))

(declare-fun m!445481 () Bool)

(assert (=> b!306994 m!445481))

(check-sat (not b!306982) (not start!68366) (not b!306992) (not b!306989) (not b!306990) (not b!306995) (not bm!5879) (not b!306994) (not b!306996))
(check-sat)
(get-model)

(declare-fun d!102412 () Bool)

(assert (=> d!102412 (= (byteRangesEq!0 (select (arr!9143 a1!948) (_3!1588 lt!439976)) (select (arr!9143 a2!948) (_3!1588 lt!439976)) lt!439983 #b00000000000000000000000000000111) (or (= lt!439983 #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9143 a1!948) (_3!1588 lt!439976))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!439983)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9143 a2!948) (_3!1588 lt!439976))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!439983)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26391 () Bool)

(assert (= bs!26391 d!102412))

(declare-fun m!445523 () Bool)

(assert (=> bs!26391 m!445523))

(declare-fun m!445525 () Bool)

(assert (=> bs!26391 m!445525))

(assert (=> b!306995 d!102412))

(declare-fun lt!440028 () tuple4!1262)

(declare-fun b!307063 () Bool)

(declare-fun e!221257 () Bool)

(assert (=> b!307063 (= e!221257 (arrayRangesEq!1689 a1!948 a2!948 (_1!13286 lt!440028) (_2!13286 lt!440028)))))

(declare-fun b!307064 () Bool)

(declare-fun res!252039 () Bool)

(declare-fun lt!440027 () (_ BitVec 32))

(assert (=> b!307064 (= res!252039 (= lt!440027 #b00000000000000000000000000000000))))

(declare-fun e!221256 () Bool)

(assert (=> b!307064 (=> res!252039 e!221256)))

(declare-fun e!221252 () Bool)

(assert (=> b!307064 (= e!221252 e!221256)))

(declare-fun b!307065 () Bool)

(declare-fun e!221255 () Bool)

(declare-fun e!221253 () Bool)

(assert (=> b!307065 (= e!221255 e!221253)))

(declare-fun c!15096 () Bool)

(assert (=> b!307065 (= c!15096 (= (_3!1588 lt!440028) (_4!631 lt!440028)))))

(declare-fun lt!440026 () (_ BitVec 32))

(declare-fun call!5888 () Bool)

(declare-fun bm!5885 () Bool)

(assert (=> bm!5885 (= call!5888 (byteRangesEq!0 (ite c!15096 (select (arr!9143 a1!948) (_3!1588 lt!440028)) (select (arr!9143 a1!948) (_4!631 lt!440028))) (ite c!15096 (select (arr!9143 a2!948) (_3!1588 lt!440028)) (select (arr!9143 a2!948) (_4!631 lt!440028))) (ite c!15096 lt!440026 #b00000000000000000000000000000000) lt!440027))))

(declare-fun b!307067 () Bool)

(assert (=> b!307067 (= e!221253 e!221252)))

(declare-fun res!252035 () Bool)

(assert (=> b!307067 (= res!252035 (byteRangesEq!0 (select (arr!9143 a1!948) (_3!1588 lt!440028)) (select (arr!9143 a2!948) (_3!1588 lt!440028)) lt!440026 #b00000000000000000000000000001000))))

(assert (=> b!307067 (=> (not res!252035) (not e!221252))))

(declare-fun b!307068 () Bool)

(declare-fun e!221254 () Bool)

(assert (=> b!307068 (= e!221254 e!221255)))

(declare-fun res!252036 () Bool)

(assert (=> b!307068 (=> (not res!252036) (not e!221255))))

(assert (=> b!307068 (= res!252036 e!221257)))

(declare-fun res!252038 () Bool)

(assert (=> b!307068 (=> res!252038 e!221257)))

(assert (=> b!307068 (= res!252038 (bvsge (_1!13286 lt!440028) (_2!13286 lt!440028)))))

(assert (=> b!307068 (= lt!440027 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!307068 (= lt!440026 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!307068 (= lt!440028 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!307069 () Bool)

(assert (=> b!307069 (= e!221253 call!5888)))

(declare-fun d!102414 () Bool)

(declare-fun res!252037 () Bool)

(assert (=> d!102414 (=> res!252037 e!221254)))

(assert (=> d!102414 (= res!252037 (bvsge fromBit!258 toBit!258))))

(assert (=> d!102414 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!221254)))

(declare-fun b!307066 () Bool)

(assert (=> b!307066 (= e!221256 call!5888)))

(assert (= (and d!102414 (not res!252037)) b!307068))

(assert (= (and b!307068 (not res!252038)) b!307063))

(assert (= (and b!307068 res!252036) b!307065))

(assert (= (and b!307065 c!15096) b!307069))

(assert (= (and b!307065 (not c!15096)) b!307067))

(assert (= (and b!307067 res!252035) b!307064))

(assert (= (and b!307064 (not res!252039)) b!307066))

(assert (= (or b!307069 b!307066) bm!5885))

(declare-fun m!445527 () Bool)

(assert (=> b!307063 m!445527))

(declare-fun m!445529 () Bool)

(assert (=> bm!5885 m!445529))

(declare-fun m!445531 () Bool)

(assert (=> bm!5885 m!445531))

(declare-fun m!445533 () Bool)

(assert (=> bm!5885 m!445533))

(declare-fun m!445535 () Bool)

(assert (=> bm!5885 m!445535))

(declare-fun m!445537 () Bool)

(assert (=> bm!5885 m!445537))

(assert (=> b!307067 m!445529))

(assert (=> b!307067 m!445535))

(assert (=> b!307067 m!445529))

(assert (=> b!307067 m!445535))

(declare-fun m!445539 () Bool)

(assert (=> b!307067 m!445539))

(assert (=> b!307068 m!445455))

(assert (=> b!306990 d!102414))

(declare-fun d!102416 () Bool)

(assert (=> d!102416 (arrayRangesEq!1689 a1!948 a2!948 (_1!13286 lt!439984) (_2!13286 lt!439984))))

(declare-fun lt!440031 () Unit!21414)

(declare-fun choose!638 (array!18604 array!18604 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21414)

(assert (=> d!102416 (= lt!440031 (choose!638 a1!948 a2!948 (_1!13286 lt!439976) (_2!13286 lt!439976) (_1!13286 lt!439984) (_2!13286 lt!439984)))))

(assert (=> d!102416 (and (bvsle #b00000000000000000000000000000000 (_1!13286 lt!439976)) (bvsle (_1!13286 lt!439976) (_2!13286 lt!439976)))))

(assert (=> d!102416 (= (arrayRangesEqSlicedLemma!284 a1!948 a2!948 (_1!13286 lt!439976) (_2!13286 lt!439976) (_1!13286 lt!439984) (_2!13286 lt!439984)) lt!440031)))

(declare-fun bs!26392 () Bool)

(assert (= bs!26392 d!102416))

(assert (=> bs!26392 m!445451))

(declare-fun m!445541 () Bool)

(assert (=> bs!26392 m!445541))

(assert (=> b!306989 d!102416))

(declare-fun d!102418 () Bool)

(declare-fun res!252044 () Bool)

(declare-fun e!221262 () Bool)

(assert (=> d!102418 (=> res!252044 e!221262)))

(assert (=> d!102418 (= res!252044 (= (_1!13286 lt!439984) (_2!13286 lt!439984)))))

(assert (=> d!102418 (= (arrayRangesEq!1689 a1!948 a2!948 (_1!13286 lt!439984) (_2!13286 lt!439984)) e!221262)))

(declare-fun b!307074 () Bool)

(declare-fun e!221263 () Bool)

(assert (=> b!307074 (= e!221262 e!221263)))

(declare-fun res!252045 () Bool)

(assert (=> b!307074 (=> (not res!252045) (not e!221263))))

(assert (=> b!307074 (= res!252045 (= (select (arr!9143 a1!948) (_1!13286 lt!439984)) (select (arr!9143 a2!948) (_1!13286 lt!439984))))))

(declare-fun b!307075 () Bool)

(assert (=> b!307075 (= e!221263 (arrayRangesEq!1689 a1!948 a2!948 (bvadd (_1!13286 lt!439984) #b00000000000000000000000000000001) (_2!13286 lt!439984)))))

(assert (= (and d!102418 (not res!252044)) b!307074))

(assert (= (and b!307074 res!252045) b!307075))

(declare-fun m!445543 () Bool)

(assert (=> b!307074 m!445543))

(declare-fun m!445545 () Bool)

(assert (=> b!307074 m!445545))

(declare-fun m!445547 () Bool)

(assert (=> b!307075 m!445547))

(assert (=> b!306989 d!102418))

(declare-fun d!102420 () Bool)

(assert (=> d!102420 (and (bvsge (_4!631 lt!439984) #b00000000000000000000000000000000) (bvslt (_4!631 lt!439984) (size!8060 a1!948)) (bvslt (_4!631 lt!439984) (size!8060 a2!948)) (= (select (arr!9143 a1!948) (_4!631 lt!439984)) (select (arr!9143 a2!948) (_4!631 lt!439984))))))

(declare-fun lt!440034 () Unit!21414)

(declare-fun choose!639 (array!18604 array!18604 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21414)

(assert (=> d!102420 (= lt!440034 (choose!639 a1!948 a2!948 (_1!13286 lt!439976) (_4!631 lt!439984) (_2!13286 lt!439976)))))

(assert (=> d!102420 (and (bvsle #b00000000000000000000000000000000 (_1!13286 lt!439976)) (bvsle (_1!13286 lt!439976) (_2!13286 lt!439976)))))

(assert (=> d!102420 (= (arrayRangesEqImpliesEq!293 a1!948 a2!948 (_1!13286 lt!439976) (_4!631 lt!439984) (_2!13286 lt!439976)) lt!440034)))

(declare-fun bs!26393 () Bool)

(assert (= bs!26393 d!102420))

(assert (=> bs!26393 m!445479))

(assert (=> bs!26393 m!445481))

(declare-fun m!445549 () Bool)

(assert (=> bs!26393 m!445549))

(assert (=> b!306994 d!102420))

(declare-fun d!102422 () Bool)

(assert (=> d!102422 (= (array_inv!7672 a1!948) (bvsge (size!8060 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!68366 d!102422))

(declare-fun d!102424 () Bool)

(assert (=> d!102424 (= (array_inv!7672 a2!948) (bvsge (size!8060 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!68366 d!102424))

(declare-fun d!102426 () Bool)

(assert (=> d!102426 (= (byteRangesEq!0 (ite c!15078 (select (arr!9143 a1!948) (_3!1588 lt!439976)) (select (arr!9143 a1!948) (_4!631 lt!439976))) (ite c!15078 (select (arr!9143 a2!948) (_3!1588 lt!439976)) (select (arr!9143 a2!948) (_4!631 lt!439976))) (ite c!15078 lt!439983 #b00000000000000000000000000000000) lt!439980) (or (= (ite c!15078 lt!439983 #b00000000000000000000000000000000) lt!439980) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!15078 (select (arr!9143 a1!948) (_3!1588 lt!439976)) (select (arr!9143 a1!948) (_4!631 lt!439976)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!439980))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!15078 lt!439983 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!15078 (select (arr!9143 a2!948) (_3!1588 lt!439976)) (select (arr!9143 a2!948) (_4!631 lt!439976)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!439980))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!15078 lt!439983 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26394 () Bool)

(assert (= bs!26394 d!102426))

(declare-fun m!445551 () Bool)

(assert (=> bs!26394 m!445551))

(declare-fun m!445553 () Bool)

(assert (=> bs!26394 m!445553))

(assert (=> bm!5879 d!102426))

(declare-fun d!102428 () Bool)

(assert (=> d!102428 (= (byteRangesEq!0 (select (arr!9143 a1!948) (_3!1588 lt!439984)) (select (arr!9143 a2!948) (_3!1588 lt!439984)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111) (or (= ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9143 a1!948) (_3!1588 lt!439984))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9143 a2!948) (_3!1588 lt!439984))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26395 () Bool)

(assert (= bs!26395 d!102428))

(assert (=> bs!26395 m!445523))

(declare-fun m!445555 () Bool)

(assert (=> bs!26395 m!445555))

(assert (=> b!306982 d!102428))

(declare-fun d!102430 () Bool)

(assert (=> d!102430 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1263 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!306992 d!102430))

(declare-fun d!102432 () Bool)

(assert (=> d!102432 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1263 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!306992 d!102432))

(declare-fun d!102434 () Bool)

(assert (=> d!102434 (and (bvsge (_3!1588 lt!439984) #b00000000000000000000000000000000) (bvslt (_3!1588 lt!439984) (size!8060 a1!948)) (bvslt (_3!1588 lt!439984) (size!8060 a2!948)) (= (select (arr!9143 a1!948) (_3!1588 lt!439984)) (select (arr!9143 a2!948) (_3!1588 lt!439984))))))

(declare-fun lt!440035 () Unit!21414)

(assert (=> d!102434 (= lt!440035 (choose!639 a1!948 a2!948 (_1!13286 lt!439976) (_3!1588 lt!439984) (_2!13286 lt!439976)))))

(assert (=> d!102434 (and (bvsle #b00000000000000000000000000000000 (_1!13286 lt!439976)) (bvsle (_1!13286 lt!439976) (_2!13286 lt!439976)))))

(assert (=> d!102434 (= (arrayRangesEqImpliesEq!293 a1!948 a2!948 (_1!13286 lt!439976) (_3!1588 lt!439984) (_2!13286 lt!439976)) lt!440035)))

(declare-fun bs!26396 () Bool)

(assert (= bs!26396 d!102434))

(assert (=> bs!26396 m!445445))

(assert (=> bs!26396 m!445447))

(declare-fun m!445557 () Bool)

(assert (=> bs!26396 m!445557))

(assert (=> b!306996 d!102434))

(check-sat (not d!102434) (not b!307067) (not b!307068) (not d!102416) (not d!102420) (not bm!5885) (not b!307075) (not b!307063))
