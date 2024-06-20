; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68176 () Bool)

(assert start!68176)

(declare-fun b!306111 () Bool)

(declare-fun e!220515 () Bool)

(declare-fun e!220512 () Bool)

(assert (=> b!306111 (= e!220515 e!220512)))

(declare-fun res!251461 () Bool)

(assert (=> b!306111 (=> (not res!251461) (not e!220512))))

(declare-datatypes ((tuple4!1240 0))(
  ( (tuple4!1241 (_1!13275 (_ BitVec 32)) (_2!13275 (_ BitVec 32)) (_3!1577 (_ BitVec 32)) (_4!620 (_ BitVec 32))) )
))
(declare-fun lt!439417 () tuple4!1240)

(assert (=> b!306111 (= res!251461 (= (_3!1577 lt!439417) (_4!620 lt!439417)))))

(declare-datatypes ((Unit!21359 0))(
  ( (Unit!21360) )
))
(declare-fun lt!439412 () Unit!21359)

(declare-fun e!220511 () Unit!21359)

(assert (=> b!306111 (= lt!439412 e!220511)))

(declare-fun c!14907 () Bool)

(declare-fun lt!439416 () tuple4!1240)

(assert (=> b!306111 (= c!14907 (and (bvslt (_4!620 lt!439417) (_4!620 lt!439416)) (bvslt (_3!1577 lt!439416) (_4!620 lt!439417))))))

(declare-fun lt!439421 () Unit!21359)

(declare-fun e!220513 () Unit!21359)

(assert (=> b!306111 (= lt!439421 e!220513)))

(declare-fun c!14910 () Bool)

(assert (=> b!306111 (= c!14910 (and (bvslt (_3!1577 lt!439416) (_3!1577 lt!439417)) (bvslt (_3!1577 lt!439417) (_4!620 lt!439416))))))

(declare-fun b!306112 () Bool)

(declare-fun res!251469 () Bool)

(declare-fun lt!439415 () (_ BitVec 32))

(assert (=> b!306112 (= res!251469 (= lt!439415 #b00000000000000000000000000000000))))

(declare-fun e!220516 () Bool)

(assert (=> b!306112 (=> res!251469 e!220516)))

(declare-fun e!220519 () Bool)

(assert (=> b!306112 (= e!220519 e!220516)))

(declare-fun b!306113 () Bool)

(declare-fun Unit!21361 () Unit!21359)

(assert (=> b!306113 (= e!220511 Unit!21361)))

(declare-fun b!306114 () Bool)

(declare-fun e!220518 () Bool)

(declare-fun e!220508 () Bool)

(assert (=> b!306114 (= e!220518 e!220508)))

(declare-fun res!251463 () Bool)

(assert (=> b!306114 (=> (not res!251463) (not e!220508))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!439420 () (_ BitVec 64))

(assert (=> b!306114 (= res!251463 (and (bvsle toBit!258 lt!439420) (bvsle fromBit!258 lt!439420)))))

(declare-datatypes ((array!18570 0))(
  ( (array!18571 (arr!9132 (Array (_ BitVec 32) (_ BitVec 8))) (size!8049 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18570)

(assert (=> b!306114 (= lt!439420 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8049 a1!948))))))

(declare-fun b!306115 () Bool)

(declare-fun Unit!21362 () Unit!21359)

(assert (=> b!306115 (= e!220513 Unit!21362)))

(declare-fun b!306116 () Bool)

(declare-fun res!251464 () Bool)

(assert (=> b!306116 (=> (not res!251464) (not e!220512))))

(declare-fun a2!948 () array!18570)

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!306116 (= res!251464 (byteRangesEq!0 (select (arr!9132 a1!948) (_3!1577 lt!439417)) (select (arr!9132 a2!948) (_3!1577 lt!439417)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!251466 () Bool)

(assert (=> start!68176 (=> (not res!251466) (not e!220518))))

(assert (=> start!68176 (= res!251466 (and (bvsle (size!8049 a1!948) (size!8049 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!68176 e!220518))

(assert (=> start!68176 true))

(declare-fun array_inv!7661 (array!18570) Bool)

(assert (=> start!68176 (array_inv!7661 a1!948)))

(assert (=> start!68176 (array_inv!7661 a2!948)))

(declare-fun b!306117 () Bool)

(declare-fun e!220510 () Unit!21359)

(declare-fun Unit!21363 () Unit!21359)

(assert (=> b!306117 (= e!220510 Unit!21363)))

(declare-fun b!306118 () Bool)

(declare-fun res!251462 () Bool)

(assert (=> b!306118 (=> (not res!251462) (not e!220508))))

(declare-fun arrayBitRangesEq!0 (array!18570 array!18570 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!306118 (= res!251462 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!306119 () Bool)

(assert (=> b!306119 (= e!220512 (not (arrayBitRangesEq!0 a1!948 a2!948 fromSlice!52 toSlice!52)))))

(declare-fun b!306120 () Bool)

(declare-fun e!220509 () Bool)

(declare-fun call!5810 () Bool)

(assert (=> b!306120 (= e!220509 call!5810)))

(declare-fun lt!439418 () (_ BitVec 32))

(declare-fun c!14908 () Bool)

(declare-fun bm!5807 () Bool)

(assert (=> bm!5807 (= call!5810 (byteRangesEq!0 (ite c!14908 (select (arr!9132 a1!948) (_3!1577 lt!439416)) (select (arr!9132 a1!948) (_4!620 lt!439416))) (ite c!14908 (select (arr!9132 a2!948) (_3!1577 lt!439416)) (select (arr!9132 a2!948) (_4!620 lt!439416))) (ite c!14908 lt!439418 #b00000000000000000000000000000000) lt!439415))))

(declare-fun b!306121 () Bool)

(declare-fun res!251468 () Bool)

(assert (=> b!306121 (=> (not res!251468) (not e!220508))))

(assert (=> b!306121 (= res!251468 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!439420) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!306122 () Bool)

(assert (=> b!306122 (= e!220509 e!220519)))

(declare-fun res!251465 () Bool)

(assert (=> b!306122 (= res!251465 (byteRangesEq!0 (select (arr!9132 a1!948) (_3!1577 lt!439416)) (select (arr!9132 a2!948) (_3!1577 lt!439416)) lt!439418 #b00000000000000000000000000000111))))

(assert (=> b!306122 (=> (not res!251465) (not e!220519))))

(declare-fun b!306123 () Bool)

(assert (=> b!306123 (= e!220508 e!220515)))

(declare-fun res!251467 () Bool)

(assert (=> b!306123 (=> (not res!251467) (not e!220515))))

(assert (=> b!306123 (= res!251467 e!220509)))

(assert (=> b!306123 (= c!14908 (= (_3!1577 lt!439416) (_4!620 lt!439416)))))

(declare-fun lt!439414 () Unit!21359)

(assert (=> b!306123 (= lt!439414 e!220510)))

(declare-fun c!14909 () Bool)

(assert (=> b!306123 (= c!14909 (bvslt (_1!13275 lt!439417) (_2!13275 lt!439417)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1240)

(assert (=> b!306123 (= lt!439417 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!306123 (= lt!439415 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306123 (= lt!439418 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306123 (= lt!439416 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!306124 () Bool)

(declare-fun lt!439419 () Unit!21359)

(assert (=> b!306124 (= e!220511 lt!439419)))

(declare-fun arrayRangesEqImpliesEq!282 (array!18570 array!18570 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21359)

(assert (=> b!306124 (= lt!439419 (arrayRangesEqImpliesEq!282 a1!948 a2!948 (_1!13275 lt!439416) (_4!620 lt!439417) (_2!13275 lt!439416)))))

(assert (=> b!306124 (= (select (arr!9132 a1!948) (_4!620 lt!439417)) (select (arr!9132 a2!948) (_4!620 lt!439417)))))

(declare-fun b!306125 () Bool)

(declare-fun lt!439422 () Unit!21359)

(assert (=> b!306125 (= e!220510 lt!439422)))

(declare-fun arrayRangesEqSlicedLemma!273 (array!18570 array!18570 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21359)

(assert (=> b!306125 (= lt!439422 (arrayRangesEqSlicedLemma!273 a1!948 a2!948 (_1!13275 lt!439416) (_2!13275 lt!439416) (_1!13275 lt!439417) (_2!13275 lt!439417)))))

(declare-fun arrayRangesEq!1678 (array!18570 array!18570 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!306125 (arrayRangesEq!1678 a1!948 a2!948 (_1!13275 lt!439417) (_2!13275 lt!439417))))

(declare-fun b!306126 () Bool)

(declare-fun lt!439413 () Unit!21359)

(assert (=> b!306126 (= e!220513 lt!439413)))

(assert (=> b!306126 (= lt!439413 (arrayRangesEqImpliesEq!282 a1!948 a2!948 (_1!13275 lt!439416) (_3!1577 lt!439417) (_2!13275 lt!439416)))))

(assert (=> b!306126 (= (select (arr!9132 a1!948) (_3!1577 lt!439417)) (select (arr!9132 a2!948) (_3!1577 lt!439417)))))

(declare-fun b!306127 () Bool)

(assert (=> b!306127 (= e!220516 call!5810)))

(assert (= (and start!68176 res!251466) b!306114))

(assert (= (and b!306114 res!251463) b!306118))

(assert (= (and b!306118 res!251462) b!306121))

(assert (= (and b!306121 res!251468) b!306123))

(assert (= (and b!306123 c!14909) b!306125))

(assert (= (and b!306123 (not c!14909)) b!306117))

(assert (= (and b!306123 c!14908) b!306120))

(assert (= (and b!306123 (not c!14908)) b!306122))

(assert (= (and b!306122 res!251465) b!306112))

(assert (= (and b!306112 (not res!251469)) b!306127))

(assert (= (or b!306120 b!306127) bm!5807))

(assert (= (and b!306123 res!251467) b!306111))

(assert (= (and b!306111 c!14910) b!306126))

(assert (= (and b!306111 (not c!14910)) b!306115))

(assert (= (and b!306111 c!14907) b!306124))

(assert (= (and b!306111 (not c!14907)) b!306113))

(assert (= (and b!306111 res!251461) b!306116))

(assert (= (and b!306116 res!251464) b!306119))

(declare-fun m!444543 () Bool)

(assert (=> b!306125 m!444543))

(declare-fun m!444545 () Bool)

(assert (=> b!306125 m!444545))

(declare-fun m!444547 () Bool)

(assert (=> b!306126 m!444547))

(declare-fun m!444549 () Bool)

(assert (=> b!306126 m!444549))

(declare-fun m!444551 () Bool)

(assert (=> b!306126 m!444551))

(declare-fun m!444553 () Bool)

(assert (=> b!306118 m!444553))

(declare-fun m!444555 () Bool)

(assert (=> b!306124 m!444555))

(declare-fun m!444557 () Bool)

(assert (=> b!306124 m!444557))

(declare-fun m!444559 () Bool)

(assert (=> b!306124 m!444559))

(declare-fun m!444561 () Bool)

(assert (=> b!306123 m!444561))

(declare-fun m!444563 () Bool)

(assert (=> b!306123 m!444563))

(declare-fun m!444565 () Bool)

(assert (=> start!68176 m!444565))

(declare-fun m!444567 () Bool)

(assert (=> start!68176 m!444567))

(declare-fun m!444569 () Bool)

(assert (=> bm!5807 m!444569))

(declare-fun m!444571 () Bool)

(assert (=> bm!5807 m!444571))

(declare-fun m!444573 () Bool)

(assert (=> bm!5807 m!444573))

(declare-fun m!444575 () Bool)

(assert (=> bm!5807 m!444575))

(declare-fun m!444577 () Bool)

(assert (=> bm!5807 m!444577))

(assert (=> b!306122 m!444569))

(assert (=> b!306122 m!444571))

(assert (=> b!306122 m!444569))

(assert (=> b!306122 m!444571))

(declare-fun m!444579 () Bool)

(assert (=> b!306122 m!444579))

(declare-fun m!444581 () Bool)

(assert (=> b!306119 m!444581))

(assert (=> b!306116 m!444549))

(assert (=> b!306116 m!444551))

(assert (=> b!306116 m!444549))

(assert (=> b!306116 m!444551))

(declare-fun m!444583 () Bool)

(assert (=> b!306116 m!444583))

(push 1)

(assert (not b!306126))

(assert (not b!306124))

(assert (not start!68176))

(assert (not b!306118))

(assert (not b!306125))

(assert (not b!306116))

(assert (not b!306122))

(assert (not b!306119))

(assert (not b!306123))

(assert (not bm!5807))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!102158 () Bool)

(assert (=> d!102158 (= (array_inv!7661 a1!948) (bvsge (size!8049 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!68176 d!102158))

(declare-fun d!102160 () Bool)

(assert (=> d!102160 (= (array_inv!7661 a2!948) (bvsge (size!8049 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!68176 d!102160))

(declare-fun d!102162 () Bool)

(assert (=> d!102162 (and (bvsge (_3!1577 lt!439417) #b00000000000000000000000000000000) (bvslt (_3!1577 lt!439417) (size!8049 a1!948)) (bvslt (_3!1577 lt!439417) (size!8049 a2!948)) (= (select (arr!9132 a1!948) (_3!1577 lt!439417)) (select (arr!9132 a2!948) (_3!1577 lt!439417))))))

(declare-fun lt!439448 () Unit!21359)

(declare-fun choose!617 (array!18570 array!18570 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21359)

(assert (=> d!102162 (= lt!439448 (choose!617 a1!948 a2!948 (_1!13275 lt!439416) (_3!1577 lt!439417) (_2!13275 lt!439416)))))

(assert (=> d!102162 (and (bvsle #b00000000000000000000000000000000 (_1!13275 lt!439416)) (bvsle (_1!13275 lt!439416) (_2!13275 lt!439416)))))

(assert (=> d!102162 (= (arrayRangesEqImpliesEq!282 a1!948 a2!948 (_1!13275 lt!439416) (_3!1577 lt!439417) (_2!13275 lt!439416)) lt!439448)))

(declare-fun bs!26323 () Bool)

(assert (= bs!26323 d!102162))

(assert (=> bs!26323 m!444549))

(assert (=> bs!26323 m!444551))

(declare-fun m!444649 () Bool)

(assert (=> bs!26323 m!444649))

(assert (=> b!306126 d!102162))

(declare-fun d!102164 () Bool)

(assert (=> d!102164 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1241 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!306123 d!102164))

(declare-fun d!102166 () Bool)

(assert (=> d!102166 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1241 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!306123 d!102166))

(declare-fun b!306204 () Bool)

(declare-fun e!220588 () Bool)

(declare-fun call!5821 () Bool)

(assert (=> b!306204 (= e!220588 call!5821)))

(declare-fun bm!5818 () Bool)

(declare-fun c!14921 () Bool)

(declare-fun lt!439469 () (_ BitVec 32))

(declare-fun lt!439468 () tuple4!1240)

(declare-fun lt!439467 () (_ BitVec 32))

(assert (=> bm!5818 (= call!5821 (byteRangesEq!0 (ite c!14921 (select (arr!9132 a1!948) (_3!1577 lt!439468)) (select (arr!9132 a1!948) (_4!620 lt!439468))) (ite c!14921 (select (arr!9132 a2!948) (_3!1577 lt!439468)) (select (arr!9132 a2!948) (_4!620 lt!439468))) (ite c!14921 lt!439467 #b00000000000000000000000000000000) lt!439469))))

(declare-fun b!306205 () Bool)

(declare-fun e!220587 () Bool)

(assert (=> b!306205 (= e!220588 e!220587)))

(declare-fun res!251528 () Bool)

(assert (=> b!306205 (= res!251528 (byteRangesEq!0 (select (arr!9132 a1!948) (_3!1577 lt!439468)) (select (arr!9132 a2!948) (_3!1577 lt!439468)) lt!439467 #b00000000000000000000000000001000))))

(assert (=> b!306205 (=> (not res!251528) (not e!220587))))

(declare-fun d!102168 () Bool)

(declare-fun res!251527 () Bool)

(declare-fun e!220590 () Bool)

(assert (=> d!102168 (=> res!251527 e!220590)))

(assert (=> d!102168 (= res!251527 (bvsge fromBit!258 toBit!258))))

(assert (=> d!102168 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!220590)))

(declare-fun b!306206 () Bool)

(declare-fun e!220586 () Bool)

(assert (=> b!306206 (= e!220586 (arrayRangesEq!1678 a1!948 a2!948 (_1!13275 lt!439468) (_2!13275 lt!439468)))))

(declare-fun b!306207 () Bool)

(declare-fun e!220589 () Bool)

(assert (=> b!306207 (= e!220589 call!5821)))

(declare-fun b!306208 () Bool)

(declare-fun res!251530 () Bool)

(assert (=> b!306208 (= res!251530 (= lt!439469 #b00000000000000000000000000000000))))

(assert (=> b!306208 (=> res!251530 e!220589)))

(assert (=> b!306208 (= e!220587 e!220589)))

(declare-fun b!306209 () Bool)

(declare-fun e!220591 () Bool)

(assert (=> b!306209 (= e!220591 e!220588)))

(assert (=> b!306209 (= c!14921 (= (_3!1577 lt!439468) (_4!620 lt!439468)))))

(declare-fun b!306210 () Bool)

(assert (=> b!306210 (= e!220590 e!220591)))

(declare-fun res!251526 () Bool)

(assert (=> b!306210 (=> (not res!251526) (not e!220591))))

(assert (=> b!306210 (= res!251526 e!220586)))

(declare-fun res!251529 () Bool)

(assert (=> b!306210 (=> res!251529 e!220586)))

(assert (=> b!306210 (= res!251529 (bvsge (_1!13275 lt!439468) (_2!13275 lt!439468)))))

(assert (=> b!306210 (= lt!439469 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306210 (= lt!439467 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306210 (= lt!439468 (arrayBitIndices!0 fromBit!258 toBit!258))))

(assert (= (and d!102168 (not res!251527)) b!306210))

(assert (= (and b!306210 (not res!251529)) b!306206))

(assert (= (and b!306210 res!251526) b!306209))

(assert (= (and b!306209 c!14921) b!306204))

(assert (= (and b!306209 (not c!14921)) b!306205))

(assert (= (and b!306205 res!251528) b!306208))

(assert (= (and b!306208 (not res!251530)) b!306207))

(assert (= (or b!306204 b!306207) bm!5818))

(declare-fun m!444683 () Bool)

(assert (=> bm!5818 m!444683))

(declare-fun m!444685 () Bool)

(assert (=> bm!5818 m!444685))

(declare-fun m!444687 () Bool)

(assert (=> bm!5818 m!444687))

(declare-fun m!444689 () Bool)

(assert (=> bm!5818 m!444689))

(declare-fun m!444691 () Bool)

(assert (=> bm!5818 m!444691))

(assert (=> b!306205 m!444683))

(assert (=> b!306205 m!444691))

(assert (=> b!306205 m!444683))

(assert (=> b!306205 m!444691))

(declare-fun m!444693 () Bool)

(assert (=> b!306205 m!444693))

(declare-fun m!444695 () Bool)

(assert (=> b!306206 m!444695))

(assert (=> b!306210 m!444563))

(assert (=> b!306118 d!102168))

(declare-fun d!102184 () Bool)

(assert (=> d!102184 (= (byteRangesEq!0 (select (arr!9132 a1!948) (_3!1577 lt!439416)) (select (arr!9132 a2!948) (_3!1577 lt!439416)) lt!439418 #b00000000000000000000000000000111) (or (= lt!439418 #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9132 a1!948) (_3!1577 lt!439416))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!439418)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9132 a2!948) (_3!1577 lt!439416))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!439418)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26326 () Bool)

(assert (= bs!26326 d!102184))

(declare-fun m!444705 () Bool)

(assert (=> bs!26326 m!444705))

(declare-fun m!444707 () Bool)

(assert (=> bs!26326 m!444707))

(assert (=> b!306122 d!102184))

(declare-fun d!102188 () Bool)

(assert (=> d!102188 (and (bvsge (_4!620 lt!439417) #b00000000000000000000000000000000) (bvslt (_4!620 lt!439417) (size!8049 a1!948)) (bvslt (_4!620 lt!439417) (size!8049 a2!948)) (= (select (arr!9132 a1!948) (_4!620 lt!439417)) (select (arr!9132 a2!948) (_4!620 lt!439417))))))

(declare-fun lt!439473 () Unit!21359)

(assert (=> d!102188 (= lt!439473 (choose!617 a1!948 a2!948 (_1!13275 lt!439416) (_4!620 lt!439417) (_2!13275 lt!439416)))))

(assert (=> d!102188 (and (bvsle #b00000000000000000000000000000000 (_1!13275 lt!439416)) (bvsle (_1!13275 lt!439416) (_2!13275 lt!439416)))))

(assert (=> d!102188 (= (arrayRangesEqImpliesEq!282 a1!948 a2!948 (_1!13275 lt!439416) (_4!620 lt!439417) (_2!13275 lt!439416)) lt!439473)))

(declare-fun bs!26327 () Bool)

(assert (= bs!26327 d!102188))

(assert (=> bs!26327 m!444557))

(assert (=> bs!26327 m!444559))

(declare-fun m!444709 () Bool)

(assert (=> bs!26327 m!444709))

(assert (=> b!306124 d!102188))

(declare-fun b!306217 () Bool)

(declare-fun e!220600 () Bool)

(declare-fun call!5822 () Bool)

(assert (=> b!306217 (= e!220600 call!5822)))

(declare-fun c!14922 () Bool)

(declare-fun lt!439475 () tuple4!1240)

(declare-fun lt!439476 () (_ BitVec 32))

(declare-fun bm!5819 () Bool)

(declare-fun lt!439474 () (_ BitVec 32))

(assert (=> bm!5819 (= call!5822 (byteRangesEq!0 (ite c!14922 (select (arr!9132 a1!948) (_3!1577 lt!439475)) (select (arr!9132 a1!948) (_4!620 lt!439475))) (ite c!14922 (select (arr!9132 a2!948) (_3!1577 lt!439475)) (select (arr!9132 a2!948) (_4!620 lt!439475))) (ite c!14922 lt!439474 #b00000000000000000000000000000000) lt!439476))))

(declare-fun b!306218 () Bool)

(declare-fun e!220599 () Bool)

(assert (=> b!306218 (= e!220600 e!220599)))

(declare-fun res!251539 () Bool)

(assert (=> b!306218 (= res!251539 (byteRangesEq!0 (select (arr!9132 a1!948) (_3!1577 lt!439475)) (select (arr!9132 a2!948) (_3!1577 lt!439475)) lt!439474 #b00000000000000000000000000001000))))

(assert (=> b!306218 (=> (not res!251539) (not e!220599))))

(declare-fun d!102190 () Bool)

(declare-fun res!251538 () Bool)

(declare-fun e!220602 () Bool)

(assert (=> d!102190 (=> res!251538 e!220602)))

(assert (=> d!102190 (= res!251538 (bvsge fromSlice!52 toSlice!52))))

(assert (=> d!102190 (= (arrayBitRangesEq!0 a1!948 a2!948 fromSlice!52 toSlice!52) e!220602)))

(declare-fun b!306219 () Bool)

(declare-fun e!220598 () Bool)

(assert (=> b!306219 (= e!220598 (arrayRangesEq!1678 a1!948 a2!948 (_1!13275 lt!439475) (_2!13275 lt!439475)))))

(declare-fun b!306220 () Bool)

(declare-fun e!220601 () Bool)

(assert (=> b!306220 (= e!220601 call!5822)))

(declare-fun b!306221 () Bool)

(declare-fun res!251541 () Bool)

(assert (=> b!306221 (= res!251541 (= lt!439476 #b00000000000000000000000000000000))))

(assert (=> b!306221 (=> res!251541 e!220601)))

(assert (=> b!306221 (= e!220599 e!220601)))

(declare-fun b!306222 () Bool)

(declare-fun e!220603 () Bool)

(assert (=> b!306222 (= e!220603 e!220600)))

(assert (=> b!306222 (= c!14922 (= (_3!1577 lt!439475) (_4!620 lt!439475)))))

(declare-fun b!306223 () Bool)

(assert (=> b!306223 (= e!220602 e!220603)))

(declare-fun res!251537 () Bool)

(assert (=> b!306223 (=> (not res!251537) (not e!220603))))

(assert (=> b!306223 (= res!251537 e!220598)))

(declare-fun res!251540 () Bool)

(assert (=> b!306223 (=> res!251540 e!220598)))

(assert (=> b!306223 (= res!251540 (bvsge (_1!13275 lt!439475) (_2!13275 lt!439475)))))

(assert (=> b!306223 (= lt!439476 ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306223 (= lt!439474 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306223 (= lt!439475 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (= (and d!102190 (not res!251538)) b!306223))

(assert (= (and b!306223 (not res!251540)) b!306219))

(assert (= (and b!306223 res!251537) b!306222))

(assert (= (and b!306222 c!14922) b!306217))

(assert (= (and b!306222 (not c!14922)) b!306218))

(assert (= (and b!306218 res!251539) b!306221))

(assert (= (and b!306221 (not res!251541)) b!306220))

(assert (= (or b!306217 b!306220) bm!5819))

(declare-fun m!444711 () Bool)

(assert (=> bm!5819 m!444711))

(declare-fun m!444713 () Bool)

(assert (=> bm!5819 m!444713))

(declare-fun m!444715 () Bool)

(assert (=> bm!5819 m!444715))

(declare-fun m!444717 () Bool)

(assert (=> bm!5819 m!444717))

(declare-fun m!444719 () Bool)

(assert (=> bm!5819 m!444719))

(assert (=> b!306218 m!444711))

(assert (=> b!306218 m!444719))

(assert (=> b!306218 m!444711))

(assert (=> b!306218 m!444719))

(declare-fun m!444721 () Bool)

(assert (=> b!306218 m!444721))

(declare-fun m!444723 () Bool)

(assert (=> b!306219 m!444723))

(assert (=> b!306223 m!444561))

(assert (=> b!306119 d!102190))

(declare-fun d!102192 () Bool)

(assert (=> d!102192 (= (byteRangesEq!0 (select (arr!9132 a1!948) (_3!1577 lt!439417)) (select (arr!9132 a2!948) (_3!1577 lt!439417)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))) (or (= ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9132 a1!948) (_3!1577 lt!439417))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9132 a2!948) (_3!1577 lt!439417))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26328 () Bool)

(assert (= bs!26328 d!102192))

(declare-fun m!444725 () Bool)

(assert (=> bs!26328 m!444725))

(declare-fun m!444727 () Bool)

(assert (=> bs!26328 m!444727))

(assert (=> b!306116 d!102192))

(declare-fun d!102194 () Bool)

(assert (=> d!102194 (= (byteRangesEq!0 (ite c!14908 (select (arr!9132 a1!948) (_3!1577 lt!439416)) (select (arr!9132 a1!948) (_4!620 lt!439416))) (ite c!14908 (select (arr!9132 a2!948) (_3!1577 lt!439416)) (select (arr!9132 a2!948) (_4!620 lt!439416))) (ite c!14908 lt!439418 #b00000000000000000000000000000000) lt!439415) (or (= (ite c!14908 lt!439418 #b00000000000000000000000000000000) lt!439415) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14908 (select (arr!9132 a1!948) (_3!1577 lt!439416)) (select (arr!9132 a1!948) (_4!620 lt!439416)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!439415))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14908 lt!439418 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14908 (select (arr!9132 a2!948) (_3!1577 lt!439416)) (select (arr!9132 a2!948) (_4!620 lt!439416)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!439415))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14908 lt!439418 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26329 () Bool)

(assert (= bs!26329 d!102194))

(declare-fun m!444729 () Bool)

(assert (=> bs!26329 m!444729))

(declare-fun m!444731 () Bool)

(assert (=> bs!26329 m!444731))

(assert (=> bm!5807 d!102194))

(declare-fun d!102196 () Bool)

(assert (=> d!102196 (arrayRangesEq!1678 a1!948 a2!948 (_1!13275 lt!439417) (_2!13275 lt!439417))))

(declare-fun lt!439479 () Unit!21359)

(declare-fun choose!619 (array!18570 array!18570 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21359)

(assert (=> d!102196 (= lt!439479 (choose!619 a1!948 a2!948 (_1!13275 lt!439416) (_2!13275 lt!439416) (_1!13275 lt!439417) (_2!13275 lt!439417)))))

(assert (=> d!102196 (and (bvsle #b00000000000000000000000000000000 (_1!13275 lt!439416)) (bvsle (_1!13275 lt!439416) (_2!13275 lt!439416)))))

(assert (=> d!102196 (= (arrayRangesEqSlicedLemma!273 a1!948 a2!948 (_1!13275 lt!439416) (_2!13275 lt!439416) (_1!13275 lt!439417) (_2!13275 lt!439417)) lt!439479)))

(declare-fun bs!26330 () Bool)

(assert (= bs!26330 d!102196))

(assert (=> bs!26330 m!444545))

(declare-fun m!444733 () Bool)

(assert (=> bs!26330 m!444733))

(assert (=> b!306125 d!102196))

(declare-fun d!102198 () Bool)

(declare-fun res!251546 () Bool)

(declare-fun e!220608 () Bool)

(assert (=> d!102198 (=> res!251546 e!220608)))

(assert (=> d!102198 (= res!251546 (= (_1!13275 lt!439417) (_2!13275 lt!439417)))))

(assert (=> d!102198 (= (arrayRangesEq!1678 a1!948 a2!948 (_1!13275 lt!439417) (_2!13275 lt!439417)) e!220608)))

(declare-fun b!306228 () Bool)

(declare-fun e!220609 () Bool)

(assert (=> b!306228 (= e!220608 e!220609)))

(declare-fun res!251547 () Bool)

