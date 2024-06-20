; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68128 () Bool)

(assert start!68128)

(declare-fun b!305879 () Bool)

(declare-datatypes ((Unit!21344 0))(
  ( (Unit!21345) )
))
(declare-fun e!220333 () Unit!21344)

(declare-fun lt!439265 () Unit!21344)

(assert (=> b!305879 (= e!220333 lt!439265)))

(declare-datatypes ((tuple4!1234 0))(
  ( (tuple4!1235 (_1!13272 (_ BitVec 32)) (_2!13272 (_ BitVec 32)) (_3!1574 (_ BitVec 32)) (_4!617 (_ BitVec 32))) )
))
(declare-fun lt!439273 () tuple4!1234)

(declare-datatypes ((array!18561 0))(
  ( (array!18562 (arr!9129 (Array (_ BitVec 32) (_ BitVec 8))) (size!8046 (_ BitVec 32))) )
))
(declare-fun a2!948 () array!18561)

(declare-fun a1!948 () array!18561)

(declare-fun lt!439270 () tuple4!1234)

(declare-fun arrayRangesEqSlicedLemma!270 (array!18561 array!18561 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21344)

(assert (=> b!305879 (= lt!439265 (arrayRangesEqSlicedLemma!270 a1!948 a2!948 (_1!13272 lt!439270) (_2!13272 lt!439270) (_1!13272 lt!439273) (_2!13272 lt!439273)))))

(declare-fun arrayRangesEq!1675 (array!18561 array!18561 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!305879 (arrayRangesEq!1675 a1!948 a2!948 (_1!13272 lt!439273) (_2!13272 lt!439273))))

(declare-fun res!251324 () Bool)

(declare-fun e!220338 () Bool)

(assert (=> start!68128 (=> (not res!251324) (not e!220338))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(assert (=> start!68128 (= res!251324 (and (bvsle (size!8046 a1!948) (size!8046 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!68128 e!220338))

(assert (=> start!68128 true))

(declare-fun array_inv!7658 (array!18561) Bool)

(assert (=> start!68128 (array_inv!7658 a1!948)))

(assert (=> start!68128 (array_inv!7658 a2!948)))

(declare-fun b!305880 () Bool)

(declare-fun e!220337 () Unit!21344)

(declare-fun Unit!21346 () Unit!21344)

(assert (=> b!305880 (= e!220337 Unit!21346)))

(declare-fun b!305881 () Bool)

(declare-fun res!251322 () Bool)

(declare-fun e!220334 () Bool)

(assert (=> b!305881 (=> (not res!251322) (not e!220334))))

(declare-fun arrayBitRangesEq!0 (array!18561 array!18561 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!305881 (= res!251322 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!305882 () Bool)

(declare-fun res!251321 () Bool)

(declare-fun lt!439268 () (_ BitVec 32))

(assert (=> b!305882 (= res!251321 (= lt!439268 #b00000000000000000000000000000000))))

(declare-fun e!220332 () Bool)

(assert (=> b!305882 (=> res!251321 e!220332)))

(declare-fun e!220331 () Bool)

(assert (=> b!305882 (= e!220331 e!220332)))

(declare-fun b!305883 () Bool)

(declare-fun Unit!21347 () Unit!21344)

(assert (=> b!305883 (= e!220333 Unit!21347)))

(declare-fun b!305884 () Bool)

(declare-fun e!220336 () Bool)

(assert (=> b!305884 (= e!220334 e!220336)))

(declare-fun res!251323 () Bool)

(assert (=> b!305884 (=> (not res!251323) (not e!220336))))

(declare-fun e!220329 () Bool)

(assert (=> b!305884 (= res!251323 e!220329)))

(declare-fun c!14863 () Bool)

(assert (=> b!305884 (= c!14863 (= (_3!1574 lt!439270) (_4!617 lt!439270)))))

(declare-fun lt!439269 () Unit!21344)

(assert (=> b!305884 (= lt!439269 e!220333)))

(declare-fun c!14864 () Bool)

(assert (=> b!305884 (= c!14864 (bvslt (_1!13272 lt!439273) (_2!13272 lt!439273)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1234)

(assert (=> b!305884 (= lt!439273 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!305884 (= lt!439268 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!439274 () (_ BitVec 32))

(assert (=> b!305884 (= lt!439274 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!305884 (= lt!439270 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun bm!5789 () Bool)

(declare-fun call!5792 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5789 (= call!5792 (byteRangesEq!0 (ite c!14863 (select (arr!9129 a1!948) (_3!1574 lt!439270)) (select (arr!9129 a1!948) (_4!617 lt!439270))) (ite c!14863 (select (arr!9129 a2!948) (_3!1574 lt!439270)) (select (arr!9129 a2!948) (_4!617 lt!439270))) (ite c!14863 lt!439274 #b00000000000000000000000000000000) lt!439268))))

(declare-fun b!305885 () Bool)

(assert (=> b!305885 (= e!220336 (and (= (_3!1574 lt!439273) (_4!617 lt!439273)) (or (bvslt (_3!1574 lt!439273) #b00000000000000000000000000000000) (bvsge (_3!1574 lt!439273) (size!8046 a2!948)))))))

(declare-fun lt!439275 () Unit!21344)

(declare-fun e!220330 () Unit!21344)

(assert (=> b!305885 (= lt!439275 e!220330)))

(declare-fun c!14862 () Bool)

(assert (=> b!305885 (= c!14862 (and (bvslt (_4!617 lt!439273) (_4!617 lt!439270)) (bvslt (_3!1574 lt!439270) (_4!617 lt!439273))))))

(declare-fun lt!439271 () Unit!21344)

(assert (=> b!305885 (= lt!439271 e!220337)))

(declare-fun c!14865 () Bool)

(assert (=> b!305885 (= c!14865 (and (bvslt (_3!1574 lt!439270) (_3!1574 lt!439273)) (bvslt (_3!1574 lt!439273) (_4!617 lt!439270))))))

(declare-fun b!305886 () Bool)

(declare-fun Unit!21348 () Unit!21344)

(assert (=> b!305886 (= e!220330 Unit!21348)))

(declare-fun b!305887 () Bool)

(assert (=> b!305887 (= e!220329 e!220331)))

(declare-fun res!251320 () Bool)

(assert (=> b!305887 (= res!251320 (byteRangesEq!0 (select (arr!9129 a1!948) (_3!1574 lt!439270)) (select (arr!9129 a2!948) (_3!1574 lt!439270)) lt!439274 #b00000000000000000000000000000111))))

(assert (=> b!305887 (=> (not res!251320) (not e!220331))))

(declare-fun b!305888 () Bool)

(assert (=> b!305888 (= e!220329 call!5792)))

(declare-fun b!305889 () Bool)

(declare-fun lt!439266 () Unit!21344)

(assert (=> b!305889 (= e!220337 lt!439266)))

(declare-fun arrayRangesEqImpliesEq!279 (array!18561 array!18561 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21344)

(assert (=> b!305889 (= lt!439266 (arrayRangesEqImpliesEq!279 a1!948 a2!948 (_1!13272 lt!439270) (_3!1574 lt!439273) (_2!13272 lt!439270)))))

(assert (=> b!305889 (= (select (arr!9129 a1!948) (_3!1574 lt!439273)) (select (arr!9129 a2!948) (_3!1574 lt!439273)))))

(declare-fun b!305890 () Bool)

(declare-fun res!251319 () Bool)

(assert (=> b!305890 (=> (not res!251319) (not e!220334))))

(declare-fun lt!439267 () (_ BitVec 64))

(assert (=> b!305890 (= res!251319 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!439267) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!305891 () Bool)

(declare-fun lt!439272 () Unit!21344)

(assert (=> b!305891 (= e!220330 lt!439272)))

(assert (=> b!305891 (= lt!439272 (arrayRangesEqImpliesEq!279 a1!948 a2!948 (_1!13272 lt!439270) (_4!617 lt!439273) (_2!13272 lt!439270)))))

(assert (=> b!305891 (= (select (arr!9129 a1!948) (_4!617 lt!439273)) (select (arr!9129 a2!948) (_4!617 lt!439273)))))

(declare-fun b!305892 () Bool)

(assert (=> b!305892 (= e!220338 e!220334)))

(declare-fun res!251325 () Bool)

(assert (=> b!305892 (=> (not res!251325) (not e!220334))))

(assert (=> b!305892 (= res!251325 (and (bvsle toBit!258 lt!439267) (bvsle fromBit!258 lt!439267)))))

(assert (=> b!305892 (= lt!439267 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8046 a1!948))))))

(declare-fun b!305893 () Bool)

(assert (=> b!305893 (= e!220332 call!5792)))

(assert (= (and start!68128 res!251324) b!305892))

(assert (= (and b!305892 res!251325) b!305881))

(assert (= (and b!305881 res!251322) b!305890))

(assert (= (and b!305890 res!251319) b!305884))

(assert (= (and b!305884 c!14864) b!305879))

(assert (= (and b!305884 (not c!14864)) b!305883))

(assert (= (and b!305884 c!14863) b!305888))

(assert (= (and b!305884 (not c!14863)) b!305887))

(assert (= (and b!305887 res!251320) b!305882))

(assert (= (and b!305882 (not res!251321)) b!305893))

(assert (= (or b!305888 b!305893) bm!5789))

(assert (= (and b!305884 res!251323) b!305885))

(assert (= (and b!305885 c!14865) b!305889))

(assert (= (and b!305885 (not c!14865)) b!305880))

(assert (= (and b!305885 c!14862) b!305891))

(assert (= (and b!305885 (not c!14862)) b!305886))

(declare-fun m!444319 () Bool)

(assert (=> b!305881 m!444319))

(declare-fun m!444321 () Bool)

(assert (=> b!305879 m!444321))

(declare-fun m!444323 () Bool)

(assert (=> b!305879 m!444323))

(declare-fun m!444325 () Bool)

(assert (=> b!305889 m!444325))

(declare-fun m!444327 () Bool)

(assert (=> b!305889 m!444327))

(declare-fun m!444329 () Bool)

(assert (=> b!305889 m!444329))

(declare-fun m!444331 () Bool)

(assert (=> b!305891 m!444331))

(declare-fun m!444333 () Bool)

(assert (=> b!305891 m!444333))

(declare-fun m!444335 () Bool)

(assert (=> b!305891 m!444335))

(declare-fun m!444337 () Bool)

(assert (=> bm!5789 m!444337))

(declare-fun m!444339 () Bool)

(assert (=> bm!5789 m!444339))

(declare-fun m!444341 () Bool)

(assert (=> bm!5789 m!444341))

(declare-fun m!444343 () Bool)

(assert (=> bm!5789 m!444343))

(declare-fun m!444345 () Bool)

(assert (=> bm!5789 m!444345))

(assert (=> b!305887 m!444345))

(assert (=> b!305887 m!444341))

(assert (=> b!305887 m!444345))

(assert (=> b!305887 m!444341))

(declare-fun m!444347 () Bool)

(assert (=> b!305887 m!444347))

(declare-fun m!444349 () Bool)

(assert (=> b!305884 m!444349))

(declare-fun m!444351 () Bool)

(assert (=> b!305884 m!444351))

(declare-fun m!444353 () Bool)

(assert (=> start!68128 m!444353))

(declare-fun m!444355 () Bool)

(assert (=> start!68128 m!444355))

(push 1)

(assert (not bm!5789))

(assert (not b!305887))

(assert (not b!305889))

(assert (not b!305891))

(assert (not b!305881))

(assert (not b!305879))

(assert (not start!68128))

(assert (not b!305884))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!305962 () Bool)

(declare-fun e!220402 () Bool)

(declare-fun e!220404 () Bool)

(assert (=> b!305962 (= e!220402 e!220404)))

(declare-fun c!14874 () Bool)

(declare-fun lt!439315 () tuple4!1234)

(assert (=> b!305962 (= c!14874 (= (_3!1574 lt!439315) (_4!617 lt!439315)))))

(declare-fun lt!439314 () (_ BitVec 32))

(declare-fun bm!5798 () Bool)

(declare-fun lt!439316 () (_ BitVec 32))

(declare-fun call!5801 () Bool)

(assert (=> bm!5798 (= call!5801 (byteRangesEq!0 (ite c!14874 (select (arr!9129 a1!948) (_3!1574 lt!439315)) (select (arr!9129 a1!948) (_4!617 lt!439315))) (ite c!14874 (select (arr!9129 a2!948) (_3!1574 lt!439315)) (select (arr!9129 a2!948) (_4!617 lt!439315))) (ite c!14874 lt!439316 #b00000000000000000000000000000000) lt!439314))))

(declare-fun d!102092 () Bool)

(declare-fun res!251382 () Bool)

(declare-fun e!220403 () Bool)

(assert (=> d!102092 (=> res!251382 e!220403)))

(assert (=> d!102092 (= res!251382 (bvsge fromBit!258 toBit!258))))

(assert (=> d!102092 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!220403)))

(declare-fun b!305963 () Bool)

(assert (=> b!305963 (= e!220403 e!220402)))

(declare-fun res!251379 () Bool)

(assert (=> b!305963 (=> (not res!251379) (not e!220402))))

(declare-fun e!220400 () Bool)

(assert (=> b!305963 (= res!251379 e!220400)))

(declare-fun res!251381 () Bool)

(assert (=> b!305963 (=> res!251381 e!220400)))

(assert (=> b!305963 (= res!251381 (bvsge (_1!13272 lt!439315) (_2!13272 lt!439315)))))

(assert (=> b!305963 (= lt!439314 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!305963 (= lt!439316 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!305963 (= lt!439315 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!305964 () Bool)

(declare-fun e!220405 () Bool)

(assert (=> b!305964 (= e!220404 e!220405)))

(declare-fun res!251380 () Bool)

(assert (=> b!305964 (= res!251380 (byteRangesEq!0 (select (arr!9129 a1!948) (_3!1574 lt!439315)) (select (arr!9129 a2!948) (_3!1574 lt!439315)) lt!439316 #b00000000000000000000000000001000))))

(assert (=> b!305964 (=> (not res!251380) (not e!220405))))

(declare-fun b!305965 () Bool)

(declare-fun e!220401 () Bool)

(assert (=> b!305965 (= e!220401 call!5801)))

(declare-fun b!305966 () Bool)

(assert (=> b!305966 (= e!220404 call!5801)))

(declare-fun b!305967 () Bool)

(assert (=> b!305967 (= e!220400 (arrayRangesEq!1675 a1!948 a2!948 (_1!13272 lt!439315) (_2!13272 lt!439315)))))

(declare-fun b!305968 () Bool)

(declare-fun res!251378 () Bool)

(assert (=> b!305968 (= res!251378 (= lt!439314 #b00000000000000000000000000000000))))

(assert (=> b!305968 (=> res!251378 e!220401)))

(assert (=> b!305968 (= e!220405 e!220401)))

(assert (= (and d!102092 (not res!251382)) b!305963))

(assert (= (and b!305963 (not res!251381)) b!305967))

(assert (= (and b!305963 res!251379) b!305962))

(assert (= (and b!305962 c!14874) b!305966))

(assert (= (and b!305962 (not c!14874)) b!305964))

(assert (= (and b!305964 res!251380) b!305968))

(assert (= (and b!305968 (not res!251378)) b!305965))

(assert (= (or b!305966 b!305965) bm!5798))

(declare-fun m!444425 () Bool)

(assert (=> bm!5798 m!444425))

(declare-fun m!444427 () Bool)

(assert (=> bm!5798 m!444427))

(declare-fun m!444429 () Bool)

(assert (=> bm!5798 m!444429))

(declare-fun m!444431 () Bool)

(assert (=> bm!5798 m!444431))

(declare-fun m!444433 () Bool)

(assert (=> bm!5798 m!444433))

(assert (=> b!305963 m!444351))

(assert (=> b!305964 m!444431))

(assert (=> b!305964 m!444427))

(assert (=> b!305964 m!444431))

(assert (=> b!305964 m!444427))

(declare-fun m!444435 () Bool)

(assert (=> b!305964 m!444435))

(declare-fun m!444437 () Bool)

(assert (=> b!305967 m!444437))

(assert (=> b!305881 d!102092))

(declare-fun d!102100 () Bool)

(assert (=> d!102100 (arrayRangesEq!1675 a1!948 a2!948 (_1!13272 lt!439273) (_2!13272 lt!439273))))

(declare-fun lt!439319 () Unit!21344)

(declare-fun choose!612 (array!18561 array!18561 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21344)

(assert (=> d!102100 (= lt!439319 (choose!612 a1!948 a2!948 (_1!13272 lt!439270) (_2!13272 lt!439270) (_1!13272 lt!439273) (_2!13272 lt!439273)))))

(assert (=> d!102100 (and (bvsle #b00000000000000000000000000000000 (_1!13272 lt!439270)) (bvsle (_1!13272 lt!439270) (_2!13272 lt!439270)))))

(assert (=> d!102100 (= (arrayRangesEqSlicedLemma!270 a1!948 a2!948 (_1!13272 lt!439270) (_2!13272 lt!439270) (_1!13272 lt!439273) (_2!13272 lt!439273)) lt!439319)))

(declare-fun bs!26305 () Bool)

(assert (= bs!26305 d!102100))

(assert (=> bs!26305 m!444323))

(declare-fun m!444439 () Bool)

(assert (=> bs!26305 m!444439))

(assert (=> b!305879 d!102100))

(declare-fun d!102102 () Bool)

(declare-fun res!251387 () Bool)

(declare-fun e!220410 () Bool)

(assert (=> d!102102 (=> res!251387 e!220410)))

(assert (=> d!102102 (= res!251387 (= (_1!13272 lt!439273) (_2!13272 lt!439273)))))

(assert (=> d!102102 (= (arrayRangesEq!1675 a1!948 a2!948 (_1!13272 lt!439273) (_2!13272 lt!439273)) e!220410)))

(declare-fun b!305973 () Bool)

(declare-fun e!220411 () Bool)

(assert (=> b!305973 (= e!220410 e!220411)))

(declare-fun res!251388 () Bool)

(assert (=> b!305973 (=> (not res!251388) (not e!220411))))

(assert (=> b!305973 (= res!251388 (= (select (arr!9129 a1!948) (_1!13272 lt!439273)) (select (arr!9129 a2!948) (_1!13272 lt!439273))))))

(declare-fun b!305974 () Bool)

(assert (=> b!305974 (= e!220411 (arrayRangesEq!1675 a1!948 a2!948 (bvadd (_1!13272 lt!439273) #b00000000000000000000000000000001) (_2!13272 lt!439273)))))

(assert (= (and d!102102 (not res!251387)) b!305973))

(assert (= (and b!305973 res!251388) b!305974))

(declare-fun m!444441 () Bool)

(assert (=> b!305973 m!444441))

(declare-fun m!444443 () Bool)

(assert (=> b!305973 m!444443))

(declare-fun m!444445 () Bool)

(assert (=> b!305974 m!444445))

(assert (=> b!305879 d!102102))

(declare-fun d!102104 () Bool)

(assert (=> d!102104 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1235 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!305884 d!102104))

(declare-fun d!102106 () Bool)

(assert (=> d!102106 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1235 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!305884 d!102106))

(declare-fun d!102108 () Bool)

(assert (=> d!102108 (= (byteRangesEq!0 (ite c!14863 (select (arr!9129 a1!948) (_3!1574 lt!439270)) (select (arr!9129 a1!948) (_4!617 lt!439270))) (ite c!14863 (select (arr!9129 a2!948) (_3!1574 lt!439270)) (select (arr!9129 a2!948) (_4!617 lt!439270))) (ite c!14863 lt!439274 #b00000000000000000000000000000000) lt!439268) (or (= (ite c!14863 lt!439274 #b00000000000000000000000000000000) lt!439268) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14863 (select (arr!9129 a1!948) (_3!1574 lt!439270)) (select (arr!9129 a1!948) (_4!617 lt!439270)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!439268))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14863 lt!439274 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14863 (select (arr!9129 a2!948) (_3!1574 lt!439270)) (select (arr!9129 a2!948) (_4!617 lt!439270)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!439268))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14863 lt!439274 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26306 () Bool)

(assert (= bs!26306 d!102108))

(declare-fun m!444447 () Bool)

(assert (=> bs!26306 m!444447))

(declare-fun m!444449 () Bool)

(assert (=> bs!26306 m!444449))

(assert (=> bm!5789 d!102108))

(declare-fun d!102110 () Bool)

(assert (=> d!102110 (and (bvsge (_3!1574 lt!439273) #b00000000000000000000000000000000) (bvslt (_3!1574 lt!439273) (size!8046 a1!948)) (bvslt (_3!1574 lt!439273) (size!8046 a2!948)) (= (select (arr!9129 a1!948) (_3!1574 lt!439273)) (select (arr!9129 a2!948) (_3!1574 lt!439273))))))

(declare-fun lt!439322 () Unit!21344)

(declare-fun choose!613 (array!18561 array!18561 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21344)

(assert (=> d!102110 (= lt!439322 (choose!613 a1!948 a2!948 (_1!13272 lt!439270) (_3!1574 lt!439273) (_2!13272 lt!439270)))))

(assert (=> d!102110 (and (bvsle #b00000000000000000000000000000000 (_1!13272 lt!439270)) (bvsle (_1!13272 lt!439270) (_2!13272 lt!439270)))))

(assert (=> d!102110 (= (arrayRangesEqImpliesEq!279 a1!948 a2!948 (_1!13272 lt!439270) (_3!1574 lt!439273) (_2!13272 lt!439270)) lt!439322)))

(declare-fun bs!26307 () Bool)

(assert (= bs!26307 d!102110))

(assert (=> bs!26307 m!444327))

(assert (=> bs!26307 m!444329))

(declare-fun m!444451 () Bool)

(assert (=> bs!26307 m!444451))

(assert (=> b!305889 d!102110))

(declare-fun d!102112 () Bool)

(assert (=> d!102112 (= (byteRangesEq!0 (select (arr!9129 a1!948) (_3!1574 lt!439270)) (select (arr!9129 a2!948) (_3!1574 lt!439270)) lt!439274 #b00000000000000000000000000000111) (or (= lt!439274 #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9129 a1!948) (_3!1574 lt!439270))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!439274)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9129 a2!948) (_3!1574 lt!439270))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!439274)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26308 () Bool)

(assert (= bs!26308 d!102112))

(declare-fun m!444453 () Bool)

(assert (=> bs!26308 m!444453))

(declare-fun m!444455 () Bool)

(assert (=> bs!26308 m!444455))

(assert (=> b!305887 d!102112))

(declare-fun d!102114 () Bool)

(assert (=> d!102114 (= (array_inv!7658 a1!948) (bvsge (size!8046 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!68128 d!102114))

(declare-fun d!102116 () Bool)

(assert (=> d!102116 (= (array_inv!7658 a2!948) (bvsge (size!8046 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!68128 d!102116))

(declare-fun d!102118 () Bool)

(assert (=> d!102118 (and (bvsge (_4!617 lt!439273) #b00000000000000000000000000000000) (bvslt (_4!617 lt!439273) (size!8046 a1!948)) (bvslt (_4!617 lt!439273) (size!8046 a2!948)) (= (select (arr!9129 a1!948) (_4!617 lt!439273)) (select (arr!9129 a2!948) (_4!617 lt!439273))))))

(declare-fun lt!439323 () Unit!21344)

(assert (=> d!102118 (= lt!439323 (choose!613 a1!948 a2!948 (_1!13272 lt!439270) (_4!617 lt!439273) (_2!13272 lt!439270)))))

(assert (=> d!102118 (and (bvsle #b00000000000000000000000000000000 (_1!13272 lt!439270)) (bvsle (_1!13272 lt!439270) (_2!13272 lt!439270)))))

(assert (=> d!102118 (= (arrayRangesEqImpliesEq!279 a1!948 a2!948 (_1!13272 lt!439270) (_4!617 lt!439273) (_2!13272 lt!439270)) lt!439323)))

(declare-fun bs!26309 () Bool)

(assert (= bs!26309 d!102118))

(assert (=> bs!26309 m!444333))

(assert (=> bs!26309 m!444335))

(declare-fun m!444457 () Bool)

(assert (=> bs!26309 m!444457))

(assert (=> b!305891 d!102118))

(push 1)

(assert (not b!305967))

(assert (not b!305974))

(assert (not d!102100))

(assert (not b!305964))

(assert (not d!102118))

(assert (not b!305963))

(assert (not bm!5798))

(assert (not d!102110))

(check-sat)

(pop 1)

(push 1)

(check-sat)

