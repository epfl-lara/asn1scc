; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68032 () Bool)

(assert start!68032)

(declare-fun b!305442 () Bool)

(declare-fun res!251062 () Bool)

(declare-fun e!219981 () Bool)

(assert (=> b!305442 (=> (not res!251062) (not e!219981))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!438983 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!305442 (= res!251062 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!438983) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!305443 () Bool)

(declare-fun e!219990 () Bool)

(declare-fun e!219984 () Bool)

(assert (=> b!305443 (= e!219990 e!219984)))

(declare-fun lt!438977 () (_ BitVec 32))

(declare-datatypes ((array!18543 0))(
  ( (array!18544 (arr!9123 (Array (_ BitVec 32) (_ BitVec 8))) (size!8040 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18543)

(declare-fun a2!948 () array!18543)

(declare-fun res!251067 () Bool)

(declare-datatypes ((tuple4!1222 0))(
  ( (tuple4!1223 (_1!13266 (_ BitVec 32)) (_2!13266 (_ BitVec 32)) (_3!1568 (_ BitVec 32)) (_4!611 (_ BitVec 32))) )
))
(declare-fun lt!438976 () tuple4!1222)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!305443 (= res!251067 (byteRangesEq!0 (select (arr!9123 a1!948) (_3!1568 lt!438976)) (select (arr!9123 a2!948) (_3!1568 lt!438976)) lt!438977 #b00000000000000000000000000000111))))

(assert (=> b!305443 (=> (not res!251067) (not e!219984))))

(declare-fun b!305444 () Bool)

(declare-fun e!219982 () Bool)

(assert (=> b!305444 (= e!219981 e!219982)))

(declare-fun res!251064 () Bool)

(assert (=> b!305444 (=> (not res!251064) (not e!219982))))

(assert (=> b!305444 (= res!251064 e!219990)))

(declare-fun c!14775 () Bool)

(assert (=> b!305444 (= c!14775 (= (_3!1568 lt!438976) (_4!611 lt!438976)))))

(declare-datatypes ((Unit!21315 0))(
  ( (Unit!21316) )
))
(declare-fun lt!438984 () Unit!21315)

(declare-fun e!219986 () Unit!21315)

(assert (=> b!305444 (= lt!438984 e!219986)))

(declare-fun c!14773 () Bool)

(declare-fun lt!438980 () tuple4!1222)

(assert (=> b!305444 (= c!14773 (bvslt (_1!13266 lt!438980) (_2!13266 lt!438980)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1222)

(assert (=> b!305444 (= lt!438980 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(declare-fun lt!438982 () (_ BitVec 32))

(assert (=> b!305444 (= lt!438982 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!305444 (= lt!438977 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!305444 (= lt!438976 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!305445 () Bool)

(declare-fun e!219991 () Unit!21315)

(declare-fun lt!438979 () Unit!21315)

(assert (=> b!305445 (= e!219991 lt!438979)))

(declare-fun arrayRangesEqImpliesEq!273 (array!18543 array!18543 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21315)

(assert (=> b!305445 (= lt!438979 (arrayRangesEqImpliesEq!273 a1!948 a2!948 (_1!13266 lt!438976) (_3!1568 lt!438980) (_2!13266 lt!438976)))))

(assert (=> b!305445 (= (select (arr!9123 a1!948) (_3!1568 lt!438980)) (select (arr!9123 a2!948) (_3!1568 lt!438980)))))

(declare-fun b!305446 () Bool)

(declare-fun Unit!21317 () Unit!21315)

(assert (=> b!305446 (= e!219986 Unit!21317)))

(declare-fun b!305447 () Bool)

(declare-fun e!219983 () Bool)

(assert (=> b!305447 (= e!219982 e!219983)))

(declare-fun res!251065 () Bool)

(assert (=> b!305447 (=> (not res!251065) (not e!219983))))

(assert (=> b!305447 (= res!251065 (and (bvslt (_4!611 lt!438980) (_4!611 lt!438976)) (bvslt (_3!1568 lt!438976) (_4!611 lt!438980)) (bvsle #b00000000000000000000000000000000 (_1!13266 lt!438976)) (bvsle (_1!13266 lt!438976) (_2!13266 lt!438976)) (bvsle (_2!13266 lt!438976) (size!8040 a1!948)) (bvsle (_1!13266 lt!438976) (_4!611 lt!438980)) (bvslt (_4!611 lt!438980) (_2!13266 lt!438976))))))

(declare-fun lt!438978 () Unit!21315)

(assert (=> b!305447 (= lt!438978 e!219991)))

(declare-fun c!14774 () Bool)

(assert (=> b!305447 (= c!14774 (and (bvslt (_3!1568 lt!438976) (_3!1568 lt!438980)) (bvslt (_3!1568 lt!438980) (_4!611 lt!438976))))))

(declare-fun b!305448 () Bool)

(declare-fun e!219988 () Bool)

(declare-fun call!5756 () Bool)

(assert (=> b!305448 (= e!219988 call!5756)))

(declare-fun b!305449 () Bool)

(declare-fun res!251066 () Bool)

(assert (=> b!305449 (= res!251066 (= lt!438982 #b00000000000000000000000000000000))))

(assert (=> b!305449 (=> res!251066 e!219988)))

(assert (=> b!305449 (= e!219984 e!219988)))

(declare-fun b!305450 () Bool)

(declare-fun res!251063 () Bool)

(assert (=> b!305450 (=> (not res!251063) (not e!219981))))

(declare-fun arrayBitRangesEq!0 (array!18543 array!18543 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!305450 (= res!251063 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun bm!5753 () Bool)

(assert (=> bm!5753 (= call!5756 (byteRangesEq!0 (ite c!14775 (select (arr!9123 a1!948) (_3!1568 lt!438976)) (select (arr!9123 a1!948) (_4!611 lt!438976))) (ite c!14775 (select (arr!9123 a2!948) (_3!1568 lt!438976)) (select (arr!9123 a2!948) (_4!611 lt!438976))) (ite c!14775 lt!438977 #b00000000000000000000000000000000) lt!438982))))

(declare-fun res!251060 () Bool)

(declare-fun e!219989 () Bool)

(assert (=> start!68032 (=> (not res!251060) (not e!219989))))

(assert (=> start!68032 (= res!251060 (and (bvsle (size!8040 a1!948) (size!8040 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!68032 e!219989))

(assert (=> start!68032 true))

(declare-fun array_inv!7652 (array!18543) Bool)

(assert (=> start!68032 (array_inv!7652 a1!948)))

(assert (=> start!68032 (array_inv!7652 a2!948)))

(declare-fun b!305451 () Bool)

(assert (=> b!305451 (= e!219989 e!219981)))

(declare-fun res!251061 () Bool)

(assert (=> b!305451 (=> (not res!251061) (not e!219981))))

(assert (=> b!305451 (= res!251061 (and (bvsle toBit!258 lt!438983) (bvsle fromBit!258 lt!438983)))))

(assert (=> b!305451 (= lt!438983 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8040 a1!948))))))

(declare-fun b!305452 () Bool)

(declare-fun Unit!21318 () Unit!21315)

(assert (=> b!305452 (= e!219991 Unit!21318)))

(declare-fun b!305453 () Bool)

(declare-fun arrayRangesEq!1669 (array!18543 array!18543 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!305453 (= e!219983 (not (arrayRangesEq!1669 a1!948 a2!948 (_1!13266 lt!438976) (_2!13266 lt!438976))))))

(declare-fun b!305454 () Bool)

(declare-fun lt!438981 () Unit!21315)

(assert (=> b!305454 (= e!219986 lt!438981)))

(declare-fun arrayRangesEqSlicedLemma!264 (array!18543 array!18543 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21315)

(assert (=> b!305454 (= lt!438981 (arrayRangesEqSlicedLemma!264 a1!948 a2!948 (_1!13266 lt!438976) (_2!13266 lt!438976) (_1!13266 lt!438980) (_2!13266 lt!438980)))))

(assert (=> b!305454 (arrayRangesEq!1669 a1!948 a2!948 (_1!13266 lt!438980) (_2!13266 lt!438980))))

(declare-fun b!305455 () Bool)

(assert (=> b!305455 (= e!219990 call!5756)))

(assert (= (and start!68032 res!251060) b!305451))

(assert (= (and b!305451 res!251061) b!305450))

(assert (= (and b!305450 res!251063) b!305442))

(assert (= (and b!305442 res!251062) b!305444))

(assert (= (and b!305444 c!14773) b!305454))

(assert (= (and b!305444 (not c!14773)) b!305446))

(assert (= (and b!305444 c!14775) b!305455))

(assert (= (and b!305444 (not c!14775)) b!305443))

(assert (= (and b!305443 res!251067) b!305449))

(assert (= (and b!305449 (not res!251066)) b!305448))

(assert (= (or b!305455 b!305448) bm!5753))

(assert (= (and b!305444 res!251064) b!305447))

(assert (= (and b!305447 c!14774) b!305445))

(assert (= (and b!305447 (not c!14774)) b!305452))

(assert (= (and b!305447 res!251065) b!305453))

(declare-fun m!443879 () Bool)

(assert (=> start!68032 m!443879))

(declare-fun m!443881 () Bool)

(assert (=> start!68032 m!443881))

(declare-fun m!443883 () Bool)

(assert (=> b!305443 m!443883))

(declare-fun m!443885 () Bool)

(assert (=> b!305443 m!443885))

(assert (=> b!305443 m!443883))

(assert (=> b!305443 m!443885))

(declare-fun m!443887 () Bool)

(assert (=> b!305443 m!443887))

(assert (=> bm!5753 m!443885))

(declare-fun m!443889 () Bool)

(assert (=> bm!5753 m!443889))

(declare-fun m!443891 () Bool)

(assert (=> bm!5753 m!443891))

(assert (=> bm!5753 m!443883))

(declare-fun m!443893 () Bool)

(assert (=> bm!5753 m!443893))

(declare-fun m!443895 () Bool)

(assert (=> b!305450 m!443895))

(declare-fun m!443897 () Bool)

(assert (=> b!305444 m!443897))

(declare-fun m!443899 () Bool)

(assert (=> b!305444 m!443899))

(declare-fun m!443901 () Bool)

(assert (=> b!305454 m!443901))

(declare-fun m!443903 () Bool)

(assert (=> b!305454 m!443903))

(declare-fun m!443905 () Bool)

(assert (=> b!305453 m!443905))

(declare-fun m!443907 () Bool)

(assert (=> b!305445 m!443907))

(declare-fun m!443909 () Bool)

(assert (=> b!305445 m!443909))

(declare-fun m!443911 () Bool)

(assert (=> b!305445 m!443911))

(push 1)

(assert (not b!305444))

(assert (not b!305445))

(assert (not b!305454))

(assert (not bm!5753))

(assert (not b!305443))

(assert (not b!305450))

(assert (not b!305453))

(assert (not start!68032))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun e!220053 () Bool)

(declare-fun lt!439019 () tuple4!1222)

(declare-fun b!305521 () Bool)

(assert (=> b!305521 (= e!220053 (arrayRangesEq!1669 a1!948 a2!948 (_1!13266 lt!439019) (_2!13266 lt!439019)))))

(declare-fun call!5764 () Bool)

(declare-fun bm!5761 () Bool)

(declare-fun c!14783 () Bool)

(declare-fun lt!439020 () (_ BitVec 32))

(declare-fun lt!439018 () (_ BitVec 32))

(assert (=> bm!5761 (= call!5764 (byteRangesEq!0 (select (arr!9123 a1!948) (_3!1568 lt!439019)) (select (arr!9123 a2!948) (_3!1568 lt!439019)) lt!439018 (ite c!14783 lt!439020 #b00000000000000000000000000001000)))))

(declare-fun b!305522 () Bool)

(declare-fun e!220051 () Bool)

(assert (=> b!305522 (= e!220051 call!5764)))

(declare-fun b!305523 () Bool)

(declare-fun e!220052 () Bool)

(declare-fun e!220054 () Bool)

(assert (=> b!305523 (= e!220052 e!220054)))

(declare-fun res!251121 () Bool)

(assert (=> b!305523 (=> (not res!251121) (not e!220054))))

(assert (=> b!305523 (= res!251121 e!220053)))

(declare-fun res!251122 () Bool)

(assert (=> b!305523 (=> res!251122 e!220053)))

(assert (=> b!305523 (= res!251122 (bvsge (_1!13266 lt!439019) (_2!13266 lt!439019)))))

(assert (=> b!305523 (= lt!439020 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!305523 (= lt!439018 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!305523 (= lt!439019 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun d!101960 () Bool)

(declare-fun res!251123 () Bool)

(assert (=> d!101960 (=> res!251123 e!220052)))

(assert (=> d!101960 (= res!251123 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101960 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!220052)))

(declare-fun b!305524 () Bool)

(declare-fun res!251120 () Bool)

(assert (=> b!305524 (= res!251120 (= lt!439020 #b00000000000000000000000000000000))))

(declare-fun e!220050 () Bool)

(assert (=> b!305524 (=> res!251120 e!220050)))

(declare-fun e!220055 () Bool)

(assert (=> b!305524 (= e!220055 e!220050)))

(declare-fun b!305525 () Bool)

(assert (=> b!305525 (= e!220051 e!220055)))

(declare-fun res!251119 () Bool)

(assert (=> b!305525 (= res!251119 call!5764)))

(assert (=> b!305525 (=> (not res!251119) (not e!220055))))

(declare-fun b!305526 () Bool)

(assert (=> b!305526 (= e!220050 (byteRangesEq!0 (select (arr!9123 a1!948) (_4!611 lt!439019)) (select (arr!9123 a2!948) (_4!611 lt!439019)) #b00000000000000000000000000000000 lt!439020))))

(declare-fun b!305527 () Bool)

(assert (=> b!305527 (= e!220054 e!220051)))

(assert (=> b!305527 (= c!14783 (= (_3!1568 lt!439019) (_4!611 lt!439019)))))

(assert (= (and d!101960 (not res!251123)) b!305523))

(assert (= (and b!305523 (not res!251122)) b!305521))

(assert (= (and b!305523 res!251121) b!305527))

(assert (= (and b!305527 c!14783) b!305522))

(assert (= (and b!305527 (not c!14783)) b!305525))

(assert (= (and b!305525 res!251119) b!305524))

(assert (= (and b!305524 (not res!251120)) b!305526))

(assert (= (or b!305522 b!305525) bm!5761))

(declare-fun m!443975 () Bool)

(assert (=> b!305521 m!443975))

(declare-fun m!443977 () Bool)

(assert (=> bm!5761 m!443977))

(declare-fun m!443979 () Bool)

(assert (=> bm!5761 m!443979))

(assert (=> bm!5761 m!443977))

(assert (=> bm!5761 m!443979))

(declare-fun m!443981 () Bool)

(assert (=> bm!5761 m!443981))

(assert (=> b!305523 m!443899))

(declare-fun m!443983 () Bool)

(assert (=> b!305526 m!443983))

(declare-fun m!443985 () Bool)

(assert (=> b!305526 m!443985))

(assert (=> b!305526 m!443983))

(assert (=> b!305526 m!443985))

(declare-fun m!443987 () Bool)

(assert (=> b!305526 m!443987))

(assert (=> b!305450 d!101960))

(declare-fun d!101964 () Bool)

(assert (=> d!101964 (arrayRangesEq!1669 a1!948 a2!948 (_1!13266 lt!438980) (_2!13266 lt!438980))))

(declare-fun lt!439026 () Unit!21315)

(declare-fun choose!600 (array!18543 array!18543 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21315)

(assert (=> d!101964 (= lt!439026 (choose!600 a1!948 a2!948 (_1!13266 lt!438976) (_2!13266 lt!438976) (_1!13266 lt!438980) (_2!13266 lt!438980)))))

(assert (=> d!101964 (and (bvsle #b00000000000000000000000000000000 (_1!13266 lt!438976)) (bvsle (_1!13266 lt!438976) (_2!13266 lt!438976)))))

(assert (=> d!101964 (= (arrayRangesEqSlicedLemma!264 a1!948 a2!948 (_1!13266 lt!438976) (_2!13266 lt!438976) (_1!13266 lt!438980) (_2!13266 lt!438980)) lt!439026)))

(declare-fun bs!26270 () Bool)

(assert (= bs!26270 d!101964))

(assert (=> bs!26270 m!443903))

(declare-fun m!444003 () Bool)

(assert (=> bs!26270 m!444003))

(assert (=> b!305454 d!101964))

(declare-fun d!101966 () Bool)

(declare-fun res!251133 () Bool)

(declare-fun e!220066 () Bool)

(assert (=> d!101966 (=> res!251133 e!220066)))

(assert (=> d!101966 (= res!251133 (= (_1!13266 lt!438980) (_2!13266 lt!438980)))))

(assert (=> d!101966 (= (arrayRangesEq!1669 a1!948 a2!948 (_1!13266 lt!438980) (_2!13266 lt!438980)) e!220066)))

(declare-fun b!305539 () Bool)

(declare-fun e!220067 () Bool)

(assert (=> b!305539 (= e!220066 e!220067)))

(declare-fun res!251134 () Bool)

(assert (=> b!305539 (=> (not res!251134) (not e!220067))))

(assert (=> b!305539 (= res!251134 (= (select (arr!9123 a1!948) (_1!13266 lt!438980)) (select (arr!9123 a2!948) (_1!13266 lt!438980))))))

(declare-fun b!305540 () Bool)

(assert (=> b!305540 (= e!220067 (arrayRangesEq!1669 a1!948 a2!948 (bvadd (_1!13266 lt!438980) #b00000000000000000000000000000001) (_2!13266 lt!438980)))))

(assert (= (and d!101966 (not res!251133)) b!305539))

(assert (= (and b!305539 res!251134) b!305540))

(declare-fun m!444005 () Bool)

(assert (=> b!305539 m!444005))

(declare-fun m!444007 () Bool)

(assert (=> b!305539 m!444007))

(declare-fun m!444009 () Bool)

(assert (=> b!305540 m!444009))

(assert (=> b!305454 d!101966))

(declare-fun d!101968 () Bool)

(assert (=> d!101968 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1223 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!305444 d!101968))

(declare-fun d!101970 () Bool)

(assert (=> d!101970 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1223 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!305444 d!101970))

(declare-fun d!101972 () Bool)

(declare-fun res!251135 () Bool)

(declare-fun e!220068 () Bool)

(assert (=> d!101972 (=> res!251135 e!220068)))

(assert (=> d!101972 (= res!251135 (= (_1!13266 lt!438976) (_2!13266 lt!438976)))))

(assert (=> d!101972 (= (arrayRangesEq!1669 a1!948 a2!948 (_1!13266 lt!438976) (_2!13266 lt!438976)) e!220068)))

(declare-fun b!305541 () Bool)

(declare-fun e!220069 () Bool)

(assert (=> b!305541 (= e!220068 e!220069)))

(declare-fun res!251136 () Bool)

(assert (=> b!305541 (=> (not res!251136) (not e!220069))))

(assert (=> b!305541 (= res!251136 (= (select (arr!9123 a1!948) (_1!13266 lt!438976)) (select (arr!9123 a2!948) (_1!13266 lt!438976))))))

(declare-fun b!305542 () Bool)

(assert (=> b!305542 (= e!220069 (arrayRangesEq!1669 a1!948 a2!948 (bvadd (_1!13266 lt!438976) #b00000000000000000000000000000001) (_2!13266 lt!438976)))))

(assert (= (and d!101972 (not res!251135)) b!305541))

(assert (= (and b!305541 res!251136) b!305542))

(declare-fun m!444011 () Bool)

(assert (=> b!305541 m!444011))

(declare-fun m!444013 () Bool)

(assert (=> b!305541 m!444013))

(declare-fun m!444015 () Bool)

(assert (=> b!305542 m!444015))

(assert (=> b!305453 d!101972))

(declare-fun d!101974 () Bool)

(assert (=> d!101974 (= (byteRangesEq!0 (select (arr!9123 a1!948) (_3!1568 lt!438976)) (select (arr!9123 a2!948) (_3!1568 lt!438976)) lt!438977 #b00000000000000000000000000000111) (or (= lt!438977 #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9123 a1!948) (_3!1568 lt!438976))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!438977)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9123 a2!948) (_3!1568 lt!438976))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!438977)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26271 () Bool)

(assert (= bs!26271 d!101974))

(declare-fun m!444017 () Bool)

(assert (=> bs!26271 m!444017))

(declare-fun m!444019 () Bool)

(assert (=> bs!26271 m!444019))

(assert (=> b!305443 d!101974))

(declare-fun d!101976 () Bool)

(assert (=> d!101976 (= (array_inv!7652 a1!948) (bvsge (size!8040 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!68032 d!101976))

(declare-fun d!101978 () Bool)

(assert (=> d!101978 (= (array_inv!7652 a2!948) (bvsge (size!8040 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!68032 d!101978))

(declare-fun d!101980 () Bool)

(assert (=> d!101980 (= (byteRangesEq!0 (ite c!14775 (select (arr!9123 a1!948) (_3!1568 lt!438976)) (select (arr!9123 a1!948) (_4!611 lt!438976))) (ite c!14775 (select (arr!9123 a2!948) (_3!1568 lt!438976)) (select (arr!9123 a2!948) (_4!611 lt!438976))) (ite c!14775 lt!438977 #b00000000000000000000000000000000) lt!438982) (or (= (ite c!14775 lt!438977 #b00000000000000000000000000000000) lt!438982) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14775 (select (arr!9123 a1!948) (_3!1568 lt!438976)) (select (arr!9123 a1!948) (_4!611 lt!438976)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!438982))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14775 lt!438977 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14775 (select (arr!9123 a2!948) (_3!1568 lt!438976)) (select (arr!9123 a2!948) (_4!611 lt!438976)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!438982))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14775 lt!438977 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26272 () Bool)

(assert (= bs!26272 d!101980))

(declare-fun m!444021 () Bool)

(assert (=> bs!26272 m!444021))

(declare-fun m!444023 () Bool)

(assert (=> bs!26272 m!444023))

(assert (=> bm!5753 d!101980))

(declare-fun d!101982 () Bool)

(assert (=> d!101982 (and (bvsge (_3!1568 lt!438980) #b00000000000000000000000000000000) (bvslt (_3!1568 lt!438980) (size!8040 a1!948)) (bvslt (_3!1568 lt!438980) (size!8040 a2!948)) (= (select (arr!9123 a1!948) (_3!1568 lt!438980)) (select (arr!9123 a2!948) (_3!1568 lt!438980))))))

(declare-fun lt!439029 () Unit!21315)

(declare-fun choose!601 (array!18543 array!18543 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21315)

(assert (=> d!101982 (= lt!439029 (choose!601 a1!948 a2!948 (_1!13266 lt!438976) (_3!1568 lt!438980) (_2!13266 lt!438976)))))

(assert (=> d!101982 (and (bvsle #b00000000000000000000000000000000 (_1!13266 lt!438976)) (bvsle (_1!13266 lt!438976) (_2!13266 lt!438976)))))

(assert (=> d!101982 (= (arrayRangesEqImpliesEq!273 a1!948 a2!948 (_1!13266 lt!438976) (_3!1568 lt!438980) (_2!13266 lt!438976)) lt!439029)))

(declare-fun bs!26273 () Bool)

(assert (= bs!26273 d!101982))

(assert (=> bs!26273 m!443909))

(assert (=> bs!26273 m!443911))

(declare-fun m!444025 () Bool)

(assert (=> bs!26273 m!444025))

(assert (=> b!305445 d!101982))

(push 1)

(assert (not b!305540))

(assert (not b!305521))

(assert (not b!305526))

(assert (not bm!5761))

(assert (not b!305542))

(assert (not b!305523))

(assert (not d!101982))

(assert (not d!101964))

(check-sat)

