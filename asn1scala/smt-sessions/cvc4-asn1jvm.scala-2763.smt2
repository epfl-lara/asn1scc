; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66914 () Bool)

(assert start!66914)

(declare-fun b!299164 () Bool)

(declare-fun e!214740 () Bool)

(declare-datatypes ((tuple4!958 0))(
  ( (tuple4!959 (_1!13134 (_ BitVec 32)) (_2!13134 (_ BitVec 32)) (_3!1436 (_ BitVec 32)) (_4!479 (_ BitVec 32))) )
))
(declare-fun lt!435060 () tuple4!958)

(declare-fun lt!435061 () (_ BitVec 32))

(declare-fun lt!435066 () (_ BitVec 32))

(assert (=> b!299164 (= e!214740 (and (= (_3!1436 lt!435060) (_4!479 lt!435060)) (or (bvsgt #b00000000000000000000000000000000 lt!435061) (bvsgt lt!435061 lt!435066) (bvsgt lt!435066 #b00000000000000000000000000001000))))))

(declare-datatypes ((Unit!20875 0))(
  ( (Unit!20876) )
))
(declare-fun lt!435065 () Unit!20875)

(declare-fun e!214741 () Unit!20875)

(assert (=> b!299164 (= lt!435065 e!214741)))

(declare-fun c!13710 () Bool)

(declare-fun lt!435062 () tuple4!958)

(assert (=> b!299164 (= c!13710 (bvslt (_1!13134 lt!435062) (_2!13134 lt!435062)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!958)

(assert (=> b!299164 (= lt!435062 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(declare-fun toBit!258 () (_ BitVec 64))

(assert (=> b!299164 (= lt!435066 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun fromBit!258 () (_ BitVec 64))

(assert (=> b!299164 (= lt!435061 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!299164 (= lt!435060 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!299165 () Bool)

(declare-fun res!246911 () Bool)

(assert (=> b!299165 (=> (not res!246911) (not e!214740))))

(declare-datatypes ((array!18141 0))(
  ( (array!18142 (arr!8958 (Array (_ BitVec 32) (_ BitVec 8))) (size!7875 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18141)

(declare-fun a2!948 () array!18141)

(declare-fun arrayBitRangesEq!0 (array!18141 array!18141 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299165 (= res!246911 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!299166 () Bool)

(declare-fun Unit!20877 () Unit!20875)

(assert (=> b!299166 (= e!214741 Unit!20877)))

(declare-fun b!299167 () Bool)

(declare-fun lt!435063 () Unit!20875)

(assert (=> b!299167 (= e!214741 lt!435063)))

(declare-fun arrayRangesEqSlicedLemma!147 (array!18141 array!18141 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20875)

(assert (=> b!299167 (= lt!435063 (arrayRangesEqSlicedLemma!147 a1!948 a2!948 (_1!13134 lt!435060) (_2!13134 lt!435060) (_1!13134 lt!435062) (_2!13134 lt!435062)))))

(declare-fun arrayRangesEq!1537 (array!18141 array!18141 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!299167 (arrayRangesEq!1537 a1!948 a2!948 (_1!13134 lt!435062) (_2!13134 lt!435062))))

(declare-fun res!246910 () Bool)

(declare-fun e!214743 () Bool)

(assert (=> start!66914 (=> (not res!246910) (not e!214743))))

(assert (=> start!66914 (= res!246910 (and (bvsle (size!7875 a1!948) (size!7875 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!66914 e!214743))

(assert (=> start!66914 true))

(declare-fun array_inv!7487 (array!18141) Bool)

(assert (=> start!66914 (array_inv!7487 a1!948)))

(assert (=> start!66914 (array_inv!7487 a2!948)))

(declare-fun b!299168 () Bool)

(declare-fun res!246908 () Bool)

(assert (=> b!299168 (=> (not res!246908) (not e!214740))))

(declare-fun lt!435064 () (_ BitVec 64))

(assert (=> b!299168 (= res!246908 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!435064) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!299169 () Bool)

(assert (=> b!299169 (= e!214743 e!214740)))

(declare-fun res!246909 () Bool)

(assert (=> b!299169 (=> (not res!246909) (not e!214740))))

(assert (=> b!299169 (= res!246909 (and (bvsle toBit!258 lt!435064) (bvsle fromBit!258 lt!435064)))))

(assert (=> b!299169 (= lt!435064 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7875 a1!948))))))

(assert (= (and start!66914 res!246910) b!299169))

(assert (= (and b!299169 res!246909) b!299165))

(assert (= (and b!299165 res!246911) b!299168))

(assert (= (and b!299168 res!246908) b!299164))

(assert (= (and b!299164 c!13710) b!299167))

(assert (= (and b!299164 (not c!13710)) b!299166))

(declare-fun m!438383 () Bool)

(assert (=> b!299164 m!438383))

(declare-fun m!438385 () Bool)

(assert (=> b!299164 m!438385))

(declare-fun m!438387 () Bool)

(assert (=> b!299165 m!438387))

(declare-fun m!438389 () Bool)

(assert (=> b!299167 m!438389))

(declare-fun m!438391 () Bool)

(assert (=> b!299167 m!438391))

(declare-fun m!438393 () Bool)

(assert (=> start!66914 m!438393))

(declare-fun m!438395 () Bool)

(assert (=> start!66914 m!438395))

(push 1)

(assert (not b!299167))

(assert (not b!299165))

(assert (not b!299164))

(assert (not start!66914))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!100626 () Bool)

(assert (=> d!100626 (arrayRangesEq!1537 a1!948 a2!948 (_1!13134 lt!435062) (_2!13134 lt!435062))))

(declare-fun lt!435093 () Unit!20875)

(declare-fun choose!520 (array!18141 array!18141 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20875)

(assert (=> d!100626 (= lt!435093 (choose!520 a1!948 a2!948 (_1!13134 lt!435060) (_2!13134 lt!435060) (_1!13134 lt!435062) (_2!13134 lt!435062)))))

(assert (=> d!100626 (and (bvsle #b00000000000000000000000000000000 (_1!13134 lt!435060)) (bvsle (_1!13134 lt!435060) (_2!13134 lt!435060)))))

(assert (=> d!100626 (= (arrayRangesEqSlicedLemma!147 a1!948 a2!948 (_1!13134 lt!435060) (_2!13134 lt!435060) (_1!13134 lt!435062) (_2!13134 lt!435062)) lt!435093)))

(declare-fun bs!25910 () Bool)

(assert (= bs!25910 d!100626))

(assert (=> bs!25910 m!438391))

(declare-fun m!438441 () Bool)

(assert (=> bs!25910 m!438441))

(assert (=> b!299167 d!100626))

(declare-fun d!100628 () Bool)

(declare-fun res!246958 () Bool)

(declare-fun e!214796 () Bool)

(assert (=> d!100628 (=> res!246958 e!214796)))

(assert (=> d!100628 (= res!246958 (= (_1!13134 lt!435062) (_2!13134 lt!435062)))))

(assert (=> d!100628 (= (arrayRangesEq!1537 a1!948 a2!948 (_1!13134 lt!435062) (_2!13134 lt!435062)) e!214796)))

(declare-fun b!299228 () Bool)

(declare-fun e!214797 () Bool)

(assert (=> b!299228 (= e!214796 e!214797)))

(declare-fun res!246959 () Bool)

(assert (=> b!299228 (=> (not res!246959) (not e!214797))))

(assert (=> b!299228 (= res!246959 (= (select (arr!8958 a1!948) (_1!13134 lt!435062)) (select (arr!8958 a2!948) (_1!13134 lt!435062))))))

(declare-fun b!299229 () Bool)

(assert (=> b!299229 (= e!214797 (arrayRangesEq!1537 a1!948 a2!948 (bvadd (_1!13134 lt!435062) #b00000000000000000000000000000001) (_2!13134 lt!435062)))))

(assert (= (and d!100628 (not res!246958)) b!299228))

(assert (= (and b!299228 res!246959) b!299229))

(declare-fun m!438443 () Bool)

(assert (=> b!299228 m!438443))

(declare-fun m!438445 () Bool)

(assert (=> b!299228 m!438445))

(declare-fun m!438447 () Bool)

(assert (=> b!299229 m!438447))

(assert (=> b!299167 d!100628))

(declare-fun b!299244 () Bool)

(declare-fun e!214814 () Bool)

(declare-fun e!214813 () Bool)

(assert (=> b!299244 (= e!214814 e!214813)))

(declare-fun res!246972 () Bool)

(assert (=> b!299244 (=> (not res!246972) (not e!214813))))

(declare-fun e!214810 () Bool)

(assert (=> b!299244 (= res!246972 e!214810)))

(declare-fun res!246974 () Bool)

(assert (=> b!299244 (=> res!246974 e!214810)))

(declare-fun lt!435100 () tuple4!958)

(assert (=> b!299244 (= res!246974 (bvsge (_1!13134 lt!435100) (_2!13134 lt!435100)))))

(declare-fun lt!435101 () (_ BitVec 32))

(assert (=> b!299244 (= lt!435101 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!435102 () (_ BitVec 32))

(assert (=> b!299244 (= lt!435102 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!299244 (= lt!435100 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun call!5321 () Bool)

(declare-fun c!13719 () Bool)

(declare-fun bm!5318 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5318 (= call!5321 (byteRangesEq!0 (ite c!13719 (select (arr!8958 a1!948) (_3!1436 lt!435100)) (select (arr!8958 a1!948) (_4!479 lt!435100))) (ite c!13719 (select (arr!8958 a2!948) (_3!1436 lt!435100)) (select (arr!8958 a2!948) (_4!479 lt!435100))) (ite c!13719 lt!435102 #b00000000000000000000000000000000) lt!435101))))

(declare-fun b!299246 () Bool)

(declare-fun e!214812 () Bool)

(assert (=> b!299246 (= e!214812 call!5321)))

(declare-fun b!299247 () Bool)

(assert (=> b!299247 (= e!214810 (arrayRangesEq!1537 a1!948 a2!948 (_1!13134 lt!435100) (_2!13134 lt!435100)))))

(declare-fun b!299248 () Bool)

(declare-fun e!214815 () Bool)

(assert (=> b!299248 (= e!214812 e!214815)))

(declare-fun res!246973 () Bool)

(assert (=> b!299248 (= res!246973 (byteRangesEq!0 (select (arr!8958 a1!948) (_3!1436 lt!435100)) (select (arr!8958 a2!948) (_3!1436 lt!435100)) lt!435102 #b00000000000000000000000000001000))))

(assert (=> b!299248 (=> (not res!246973) (not e!214815))))

(declare-fun b!299249 () Bool)

(declare-fun e!214811 () Bool)

(assert (=> b!299249 (= e!214811 call!5321)))

(declare-fun b!299250 () Bool)

(assert (=> b!299250 (= e!214813 e!214812)))

(assert (=> b!299250 (= c!13719 (= (_3!1436 lt!435100) (_4!479 lt!435100)))))

(declare-fun b!299245 () Bool)

(declare-fun res!246970 () Bool)

(assert (=> b!299245 (= res!246970 (= lt!435101 #b00000000000000000000000000000000))))

(assert (=> b!299245 (=> res!246970 e!214811)))

(assert (=> b!299245 (= e!214815 e!214811)))

(declare-fun d!100630 () Bool)

(declare-fun res!246971 () Bool)

(assert (=> d!100630 (=> res!246971 e!214814)))

(assert (=> d!100630 (= res!246971 (bvsge fromBit!258 toBit!258))))

(assert (=> d!100630 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!214814)))

(assert (= (and d!100630 (not res!246971)) b!299244))

(assert (= (and b!299244 (not res!246974)) b!299247))

(assert (= (and b!299244 res!246972) b!299250))

(assert (= (and b!299250 c!13719) b!299246))

(assert (= (and b!299250 (not c!13719)) b!299248))

(assert (= (and b!299248 res!246973) b!299245))

(assert (= (and b!299245 (not res!246970)) b!299249))

(assert (= (or b!299246 b!299249) bm!5318))

(assert (=> b!299244 m!438385))

(declare-fun m!438449 () Bool)

(assert (=> bm!5318 m!438449))

(declare-fun m!438451 () Bool)

(assert (=> bm!5318 m!438451))

(declare-fun m!438453 () Bool)

(assert (=> bm!5318 m!438453))

(declare-fun m!438455 () Bool)

(assert (=> bm!5318 m!438455))

(declare-fun m!438457 () Bool)

(assert (=> bm!5318 m!438457))

(declare-fun m!438459 () Bool)

(assert (=> b!299247 m!438459))

(assert (=> b!299248 m!438451))

(assert (=> b!299248 m!438449))

(assert (=> b!299248 m!438451))

(assert (=> b!299248 m!438449))

(declare-fun m!438461 () Bool)

(assert (=> b!299248 m!438461))

(assert (=> b!299165 d!100630))

(declare-fun d!100632 () Bool)

(assert (=> d!100632 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!959 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!299164 d!100632))

(declare-fun d!100634 () Bool)

(assert (=> d!100634 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!959 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!299164 d!100634))

(declare-fun d!100636 () Bool)

(assert (=> d!100636 (= (array_inv!7487 a1!948) (bvsge (size!7875 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!66914 d!100636))

(declare-fun d!100638 () Bool)

(assert (=> d!100638 (= (array_inv!7487 a2!948) (bvsge (size!7875 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!66914 d!100638))

(push 1)

(assert (not b!299248))

(assert (not b!299244))

(assert (not b!299229))

(assert (not bm!5318))

(assert (not d!100626))

(assert (not b!299247))

(check-sat)

