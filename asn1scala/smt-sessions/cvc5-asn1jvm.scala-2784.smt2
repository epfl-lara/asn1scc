; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67146 () Bool)

(assert start!67146)

(declare-fun b!301537 () Bool)

(declare-fun e!216564 () Bool)

(declare-fun call!5459 () Bool)

(assert (=> b!301537 (= e!216564 call!5459)))

(declare-fun b!301538 () Bool)

(declare-fun e!216568 () Bool)

(declare-fun e!216567 () Bool)

(assert (=> b!301538 (= e!216568 e!216567)))

(declare-fun res!248273 () Bool)

(assert (=> b!301538 (=> (not res!248273) (not e!216567))))

(declare-datatypes ((tuple4!1080 0))(
  ( (tuple4!1081 (_1!13195 (_ BitVec 32)) (_2!13195 (_ BitVec 32)) (_3!1497 (_ BitVec 32)) (_4!540 (_ BitVec 32))) )
))
(declare-fun lt!436756 () tuple4!1080)

(assert (=> b!301538 (= res!248273 (= (_3!1497 lt!436756) (_4!540 lt!436756)))))

(declare-datatypes ((Unit!21115 0))(
  ( (Unit!21116) )
))
(declare-fun lt!436750 () Unit!21115)

(declare-fun e!216569 () Unit!21115)

(assert (=> b!301538 (= lt!436750 e!216569)))

(declare-fun c!14217 () Bool)

(declare-fun lt!436755 () tuple4!1080)

(assert (=> b!301538 (= c!14217 (and (bvslt (_4!540 lt!436756) (_4!540 lt!436755)) (bvslt (_3!1497 lt!436755) (_4!540 lt!436756))))))

(declare-fun lt!436753 () Unit!21115)

(declare-fun e!216570 () Unit!21115)

(assert (=> b!301538 (= lt!436753 e!216570)))

(declare-fun c!14214 () Bool)

(assert (=> b!301538 (= c!14214 (and (bvslt (_3!1497 lt!436755) (_3!1497 lt!436756)) (bvslt (_3!1497 lt!436756) (_4!540 lt!436755))))))

(declare-fun b!301539 () Bool)

(declare-fun Unit!21117 () Unit!21115)

(assert (=> b!301539 (= e!216570 Unit!21117)))

(declare-fun b!301540 () Bool)

(declare-fun e!216573 () Bool)

(declare-fun e!216565 () Bool)

(assert (=> b!301540 (= e!216573 e!216565)))

(declare-fun res!248275 () Bool)

(assert (=> b!301540 (=> (not res!248275) (not e!216565))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!436757 () (_ BitVec 64))

(assert (=> b!301540 (= res!248275 (and (bvsle toBit!258 lt!436757) (bvsle fromBit!258 lt!436757)))))

(declare-datatypes ((array!18272 0))(
  ( (array!18273 (arr!9019 (Array (_ BitVec 32) (_ BitVec 8))) (size!7936 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18272)

(assert (=> b!301540 (= lt!436757 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7936 a1!948))))))

(declare-fun b!301541 () Bool)

(declare-fun lt!436758 () Unit!21115)

(assert (=> b!301541 (= e!216570 lt!436758)))

(declare-fun a2!948 () array!18272)

(declare-fun arrayRangesEqImpliesEq!250 (array!18272 array!18272 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21115)

(assert (=> b!301541 (= lt!436758 (arrayRangesEqImpliesEq!250 a1!948 a2!948 (_1!13195 lt!436755) (_3!1497 lt!436756) (_2!13195 lt!436755)))))

(assert (=> b!301541 (= (select (arr!9019 a1!948) (_3!1497 lt!436756)) (select (arr!9019 a2!948) (_3!1497 lt!436756)))))

(declare-fun b!301542 () Bool)

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!301542 (= e!216567 (not (byteRangesEq!0 (select (arr!9019 a1!948) (_3!1497 lt!436756)) (select (arr!9019 a2!948) (_3!1497 lt!436756)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))))

(declare-fun b!301543 () Bool)

(declare-fun e!216566 () Unit!21115)

(declare-fun Unit!21118 () Unit!21115)

(assert (=> b!301543 (= e!216566 Unit!21118)))

(declare-fun b!301544 () Bool)

(declare-fun e!216574 () Bool)

(assert (=> b!301544 (= e!216564 e!216574)))

(declare-fun res!248278 () Bool)

(assert (=> b!301544 (= res!248278 call!5459)))

(assert (=> b!301544 (=> (not res!248278) (not e!216574))))

(declare-fun lt!436752 () (_ BitVec 32))

(declare-fun bm!5456 () Bool)

(declare-fun lt!436751 () (_ BitVec 32))

(declare-fun c!14215 () Bool)

(assert (=> bm!5456 (= call!5459 (byteRangesEq!0 (select (arr!9019 a1!948) (_3!1497 lt!436755)) (select (arr!9019 a2!948) (_3!1497 lt!436755)) lt!436752 (ite c!14215 lt!436751 #b00000000000000000000000000000111)))))

(declare-fun b!301545 () Bool)

(declare-fun Unit!21119 () Unit!21115)

(assert (=> b!301545 (= e!216569 Unit!21119)))

(declare-fun b!301546 () Bool)

(assert (=> b!301546 (= e!216565 e!216568)))

(declare-fun res!248279 () Bool)

(assert (=> b!301546 (=> (not res!248279) (not e!216568))))

(assert (=> b!301546 (= res!248279 e!216564)))

(assert (=> b!301546 (= c!14215 (= (_3!1497 lt!436755) (_4!540 lt!436755)))))

(declare-fun lt!436748 () Unit!21115)

(assert (=> b!301546 (= lt!436748 e!216566)))

(declare-fun c!14216 () Bool)

(assert (=> b!301546 (= c!14216 (bvslt (_1!13195 lt!436756) (_2!13195 lt!436756)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1080)

(assert (=> b!301546 (= lt!436756 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!301546 (= lt!436751 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!301546 (= lt!436752 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!301546 (= lt!436755 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!301547 () Bool)

(declare-fun lt!436749 () Unit!21115)

(assert (=> b!301547 (= e!216569 lt!436749)))

(assert (=> b!301547 (= lt!436749 (arrayRangesEqImpliesEq!250 a1!948 a2!948 (_1!13195 lt!436755) (_4!540 lt!436756) (_2!13195 lt!436755)))))

(assert (=> b!301547 (= (select (arr!9019 a1!948) (_4!540 lt!436756)) (select (arr!9019 a2!948) (_4!540 lt!436756)))))

(declare-fun e!216571 () Bool)

(declare-fun b!301548 () Bool)

(assert (=> b!301548 (= e!216571 (byteRangesEq!0 (select (arr!9019 a1!948) (_4!540 lt!436755)) (select (arr!9019 a2!948) (_4!540 lt!436755)) #b00000000000000000000000000000000 lt!436751))))

(declare-fun b!301549 () Bool)

(declare-fun lt!436754 () Unit!21115)

(assert (=> b!301549 (= e!216566 lt!436754)))

(declare-fun arrayRangesEqSlicedLemma!208 (array!18272 array!18272 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21115)

(assert (=> b!301549 (= lt!436754 (arrayRangesEqSlicedLemma!208 a1!948 a2!948 (_1!13195 lt!436755) (_2!13195 lt!436755) (_1!13195 lt!436756) (_2!13195 lt!436756)))))

(declare-fun arrayRangesEq!1598 (array!18272 array!18272 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!301549 (arrayRangesEq!1598 a1!948 a2!948 (_1!13195 lt!436756) (_2!13195 lt!436756))))

(declare-fun b!301550 () Bool)

(declare-fun res!248274 () Bool)

(assert (=> b!301550 (=> (not res!248274) (not e!216565))))

(assert (=> b!301550 (= res!248274 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!436757) (not (= fromSlice!52 toSlice!52))))))

(declare-fun res!248280 () Bool)

(assert (=> start!67146 (=> (not res!248280) (not e!216573))))

(assert (=> start!67146 (= res!248280 (and (bvsle (size!7936 a1!948) (size!7936 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67146 e!216573))

(assert (=> start!67146 true))

(declare-fun array_inv!7548 (array!18272) Bool)

(assert (=> start!67146 (array_inv!7548 a1!948)))

(assert (=> start!67146 (array_inv!7548 a2!948)))

(declare-fun b!301551 () Bool)

(declare-fun res!248276 () Bool)

(assert (=> b!301551 (=> (not res!248276) (not e!216565))))

(declare-fun arrayBitRangesEq!0 (array!18272 array!18272 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!301551 (= res!248276 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!301552 () Bool)

(declare-fun res!248277 () Bool)

(assert (=> b!301552 (= res!248277 (= lt!436751 #b00000000000000000000000000000000))))

(assert (=> b!301552 (=> res!248277 e!216571)))

(assert (=> b!301552 (= e!216574 e!216571)))

(assert (= (and start!67146 res!248280) b!301540))

(assert (= (and b!301540 res!248275) b!301551))

(assert (= (and b!301551 res!248276) b!301550))

(assert (= (and b!301550 res!248274) b!301546))

(assert (= (and b!301546 c!14216) b!301549))

(assert (= (and b!301546 (not c!14216)) b!301543))

(assert (= (and b!301546 c!14215) b!301537))

(assert (= (and b!301546 (not c!14215)) b!301544))

(assert (= (and b!301544 res!248278) b!301552))

(assert (= (and b!301552 (not res!248277)) b!301548))

(assert (= (or b!301537 b!301544) bm!5456))

(assert (= (and b!301546 res!248279) b!301538))

(assert (= (and b!301538 c!14214) b!301541))

(assert (= (and b!301538 (not c!14214)) b!301539))

(assert (= (and b!301538 c!14217) b!301547))

(assert (= (and b!301538 (not c!14217)) b!301545))

(assert (= (and b!301538 res!248273) b!301542))

(declare-fun m!440367 () Bool)

(assert (=> bm!5456 m!440367))

(declare-fun m!440369 () Bool)

(assert (=> bm!5456 m!440369))

(assert (=> bm!5456 m!440367))

(assert (=> bm!5456 m!440369))

(declare-fun m!440371 () Bool)

(assert (=> bm!5456 m!440371))

(declare-fun m!440373 () Bool)

(assert (=> start!67146 m!440373))

(declare-fun m!440375 () Bool)

(assert (=> start!67146 m!440375))

(declare-fun m!440377 () Bool)

(assert (=> b!301546 m!440377))

(declare-fun m!440379 () Bool)

(assert (=> b!301546 m!440379))

(declare-fun m!440381 () Bool)

(assert (=> b!301549 m!440381))

(declare-fun m!440383 () Bool)

(assert (=> b!301549 m!440383))

(declare-fun m!440385 () Bool)

(assert (=> b!301547 m!440385))

(declare-fun m!440387 () Bool)

(assert (=> b!301547 m!440387))

(declare-fun m!440389 () Bool)

(assert (=> b!301547 m!440389))

(declare-fun m!440391 () Bool)

(assert (=> b!301548 m!440391))

(declare-fun m!440393 () Bool)

(assert (=> b!301548 m!440393))

(assert (=> b!301548 m!440391))

(assert (=> b!301548 m!440393))

(declare-fun m!440395 () Bool)

(assert (=> b!301548 m!440395))

(declare-fun m!440397 () Bool)

(assert (=> b!301541 m!440397))

(declare-fun m!440399 () Bool)

(assert (=> b!301541 m!440399))

(declare-fun m!440401 () Bool)

(assert (=> b!301541 m!440401))

(declare-fun m!440403 () Bool)

(assert (=> b!301551 m!440403))

(assert (=> b!301542 m!440399))

(assert (=> b!301542 m!440401))

(assert (=> b!301542 m!440399))

(assert (=> b!301542 m!440401))

(declare-fun m!440405 () Bool)

(assert (=> b!301542 m!440405))

(push 1)

(assert (not b!301549))

(assert (not bm!5456))

(assert (not b!301546))

(assert (not b!301542))

(assert (not start!67146))

(assert (not b!301547))

(assert (not b!301551))

(assert (not b!301548))

(assert (not b!301541))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!100836 () Bool)

(assert (=> d!100836 (and (bvsge (_3!1497 lt!436756) #b00000000000000000000000000000000) (bvslt (_3!1497 lt!436756) (size!7936 a1!948)) (bvslt (_3!1497 lt!436756) (size!7936 a2!948)) (= (select (arr!9019 a1!948) (_3!1497 lt!436756)) (select (arr!9019 a2!948) (_3!1497 lt!436756))))))

(declare-fun lt!436843 () Unit!21115)

(declare-fun choose!532 (array!18272 array!18272 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21115)

(assert (=> d!100836 (= lt!436843 (choose!532 a1!948 a2!948 (_1!13195 lt!436755) (_3!1497 lt!436756) (_2!13195 lt!436755)))))

(assert (=> d!100836 (and (bvsle #b00000000000000000000000000000000 (_1!13195 lt!436755)) (bvsle (_1!13195 lt!436755) (_2!13195 lt!436755)))))

(assert (=> d!100836 (= (arrayRangesEqImpliesEq!250 a1!948 a2!948 (_1!13195 lt!436755) (_3!1497 lt!436756) (_2!13195 lt!436755)) lt!436843)))

(declare-fun bs!26007 () Bool)

(assert (= bs!26007 d!100836))

(assert (=> bs!26007 m!440399))

(assert (=> bs!26007 m!440401))

(declare-fun m!440525 () Bool)

(assert (=> bs!26007 m!440525))

(assert (=> b!301541 d!100836))

(declare-fun b!301690 () Bool)

(declare-fun e!216685 () Bool)

(declare-fun e!216687 () Bool)

(assert (=> b!301690 (= e!216685 e!216687)))

(declare-fun res!248360 () Bool)

(assert (=> b!301690 (=> (not res!248360) (not e!216687))))

(declare-fun e!216684 () Bool)

(assert (=> b!301690 (= res!248360 e!216684)))

(declare-fun res!248361 () Bool)

(assert (=> b!301690 (=> res!248361 e!216684)))

(declare-fun lt!436851 () tuple4!1080)

(assert (=> b!301690 (= res!248361 (bvsge (_1!13195 lt!436851) (_2!13195 lt!436851)))))

(declare-fun lt!436850 () (_ BitVec 32))

(assert (=> b!301690 (= lt!436850 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!436852 () (_ BitVec 32))

(assert (=> b!301690 (= lt!436852 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!301690 (= lt!436851 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!301691 () Bool)

(declare-fun e!216683 () Bool)

(assert (=> b!301691 (= e!216683 (byteRangesEq!0 (select (arr!9019 a1!948) (_4!540 lt!436851)) (select (arr!9019 a2!948) (_4!540 lt!436851)) #b00000000000000000000000000000000 lt!436850))))

(declare-fun b!301692 () Bool)

(declare-fun e!216686 () Bool)

(assert (=> b!301692 (= e!216687 e!216686)))

(declare-fun c!14247 () Bool)

(assert (=> b!301692 (= c!14247 (= (_3!1497 lt!436851) (_4!540 lt!436851)))))

(declare-fun b!301693 () Bool)

(declare-fun e!216688 () Bool)

(assert (=> b!301693 (= e!216686 e!216688)))

(declare-fun res!248364 () Bool)

(declare-fun call!5471 () Bool)

(assert (=> b!301693 (= res!248364 call!5471)))

(assert (=> b!301693 (=> (not res!248364) (not e!216688))))

(declare-fun b!301694 () Bool)

(assert (=> b!301694 (= e!216684 (arrayRangesEq!1598 a1!948 a2!948 (_1!13195 lt!436851) (_2!13195 lt!436851)))))

(declare-fun b!301695 () Bool)

(assert (=> b!301695 (= e!216686 call!5471)))

(declare-fun b!301696 () Bool)

(declare-fun res!248363 () Bool)

(assert (=> b!301696 (= res!248363 (= lt!436850 #b00000000000000000000000000000000))))

(assert (=> b!301696 (=> res!248363 e!216683)))

(assert (=> b!301696 (= e!216688 e!216683)))

(declare-fun d!100838 () Bool)

(declare-fun res!248362 () Bool)

(assert (=> d!100838 (=> res!248362 e!216685)))

(assert (=> d!100838 (= res!248362 (bvsge fromBit!258 toBit!258))))

(assert (=> d!100838 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!216685)))

(declare-fun bm!5468 () Bool)

(assert (=> bm!5468 (= call!5471 (byteRangesEq!0 (select (arr!9019 a1!948) (_3!1497 lt!436851)) (select (arr!9019 a2!948) (_3!1497 lt!436851)) lt!436852 (ite c!14247 lt!436850 #b00000000000000000000000000001000)))))

(assert (= (and d!100838 (not res!248362)) b!301690))

(assert (= (and b!301690 (not res!248361)) b!301694))

(assert (= (and b!301690 res!248360) b!301692))

(assert (= (and b!301692 c!14247) b!301695))

(assert (= (and b!301692 (not c!14247)) b!301693))

(assert (= (and b!301693 res!248364) b!301696))

(assert (= (and b!301696 (not res!248363)) b!301691))

(assert (= (or b!301695 b!301693) bm!5468))

(assert (=> b!301690 m!440379))

(declare-fun m!440527 () Bool)

(assert (=> b!301691 m!440527))

(declare-fun m!440529 () Bool)

(assert (=> b!301691 m!440529))

(assert (=> b!301691 m!440527))

(assert (=> b!301691 m!440529))

(declare-fun m!440531 () Bool)

(assert (=> b!301691 m!440531))

(declare-fun m!440533 () Bool)

(assert (=> b!301694 m!440533))

(declare-fun m!440535 () Bool)

(assert (=> bm!5468 m!440535))

(declare-fun m!440537 () Bool)

(assert (=> bm!5468 m!440537))

(assert (=> bm!5468 m!440535))

(assert (=> bm!5468 m!440537))

(declare-fun m!440539 () Bool)

(assert (=> bm!5468 m!440539))

(assert (=> b!301551 d!100838))

(declare-fun d!100840 () Bool)

(assert (=> d!100840 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1081 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!301546 d!100840))

(declare-fun d!100842 () Bool)

(assert (=> d!100842 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1081 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!301546 d!100842))

(declare-fun d!100844 () Bool)

(assert (=> d!100844 (= (byteRangesEq!0 (select (arr!9019 a1!948) (_3!1497 lt!436756)) (select (arr!9019 a2!948) (_3!1497 lt!436756)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))) (or (= ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9019 a1!948) (_3!1497 lt!436756))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9019 a2!948) (_3!1497 lt!436756))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26008 () Bool)

(assert (= bs!26008 d!100844))

(declare-fun m!440541 () Bool)

(assert (=> bs!26008 m!440541))

(declare-fun m!440543 () Bool)

(assert (=> bs!26008 m!440543))

(assert (=> b!301542 d!100844))

(declare-fun d!100848 () Bool)

(assert (=> d!100848 (and (bvsge (_4!540 lt!436756) #b00000000000000000000000000000000) (bvslt (_4!540 lt!436756) (size!7936 a1!948)) (bvslt (_4!540 lt!436756) (size!7936 a2!948)) (= (select (arr!9019 a1!948) (_4!540 lt!436756)) (select (arr!9019 a2!948) (_4!540 lt!436756))))))

(declare-fun lt!436853 () Unit!21115)

(assert (=> d!100848 (= lt!436853 (choose!532 a1!948 a2!948 (_1!13195 lt!436755) (_4!540 lt!436756) (_2!13195 lt!436755)))))

(assert (=> d!100848 (and (bvsle #b00000000000000000000000000000000 (_1!13195 lt!436755)) (bvsle (_1!13195 lt!436755) (_2!13195 lt!436755)))))

(assert (=> d!100848 (= (arrayRangesEqImpliesEq!250 a1!948 a2!948 (_1!13195 lt!436755) (_4!540 lt!436756) (_2!13195 lt!436755)) lt!436853)))

(declare-fun bs!26009 () Bool)

(assert (= bs!26009 d!100848))

(assert (=> bs!26009 m!440387))

(assert (=> bs!26009 m!440389))

(declare-fun m!440545 () Bool)

(assert (=> bs!26009 m!440545))

(assert (=> b!301547 d!100848))

(declare-fun d!100850 () Bool)

(assert (=> d!100850 (= (array_inv!7548 a1!948) (bvsge (size!7936 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67146 d!100850))

(declare-fun d!100852 () Bool)

(assert (=> d!100852 (= (array_inv!7548 a2!948) (bvsge (size!7936 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67146 d!100852))

(declare-fun d!100854 () Bool)

(assert (=> d!100854 (= (byteRangesEq!0 (select (arr!9019 a1!948) (_4!540 lt!436755)) (select (arr!9019 a2!948) (_4!540 lt!436755)) #b00000000000000000000000000000000 lt!436751) (or (= #b00000000000000000000000000000000 lt!436751) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9019 a1!948) (_4!540 lt!436755))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!436751))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9019 a2!948) (_4!540 lt!436755))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!436751))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26010 () Bool)

(assert (= bs!26010 d!100854))

(declare-fun m!440547 () Bool)

(assert (=> bs!26010 m!440547))

(declare-fun m!440549 () Bool)

(assert (=> bs!26010 m!440549))

(assert (=> b!301548 d!100854))

(declare-fun d!100856 () Bool)

(assert (=> d!100856 (arrayRangesEq!1598 a1!948 a2!948 (_1!13195 lt!436756) (_2!13195 lt!436756))))

(declare-fun lt!436859 () Unit!21115)

(declare-fun choose!533 (array!18272 array!18272 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21115)

(assert (=> d!100856 (= lt!436859 (choose!533 a1!948 a2!948 (_1!13195 lt!436755) (_2!13195 lt!436755) (_1!13195 lt!436756) (_2!13195 lt!436756)))))

(assert (=> d!100856 (and (bvsle #b00000000000000000000000000000000 (_1!13195 lt!436755)) (bvsle (_1!13195 lt!436755) (_2!13195 lt!436755)))))

(assert (=> d!100856 (= (arrayRangesEqSlicedLemma!208 a1!948 a2!948 (_1!13195 lt!436755) (_2!13195 lt!436755) (_1!13195 lt!436756) (_2!13195 lt!436756)) lt!436859)))

(declare-fun bs!26012 () Bool)

(assert (= bs!26012 d!100856))

(assert (=> bs!26012 m!440383))

(declare-fun m!440553 () Bool)

(assert (=> bs!26012 m!440553))

(assert (=> b!301549 d!100856))

(declare-fun d!100862 () Bool)

(declare-fun res!248369 () Bool)

(declare-fun e!216693 () Bool)

(assert (=> d!100862 (=> res!248369 e!216693)))

(assert (=> d!100862 (= res!248369 (= (_1!13195 lt!436756) (_2!13195 lt!436756)))))

(assert (=> d!100862 (= (arrayRangesEq!1598 a1!948 a2!948 (_1!13195 lt!436756) (_2!13195 lt!436756)) e!216693)))

(declare-fun b!301701 () Bool)

(declare-fun e!216694 () Bool)

(assert (=> b!301701 (= e!216693 e!216694)))

(declare-fun res!248370 () Bool)

(assert (=> b!301701 (=> (not res!248370) (not e!216694))))

(assert (=> b!301701 (= res!248370 (= (select (arr!9019 a1!948) (_1!13195 lt!436756)) (select (arr!9019 a2!948) (_1!13195 lt!436756))))))

(declare-fun b!301702 () Bool)

(assert (=> b!301702 (= e!216694 (arrayRangesEq!1598 a1!948 a2!948 (bvadd (_1!13195 lt!436756) #b00000000000000000000000000000001) (_2!13195 lt!436756)))))

(assert (= (and d!100862 (not res!248369)) b!301701))

(assert (= (and b!301701 res!248370) b!301702))

(declare-fun m!440555 () Bool)

(assert (=> b!301701 m!440555))

(declare-fun m!440557 () Bool)

(assert (=> b!301701 m!440557))

(declare-fun m!440559 () Bool)

(assert (=> b!301702 m!440559))

(assert (=> b!301549 d!100862))

(declare-fun d!100866 () Bool)

(assert (=> d!100866 (= (byteRangesEq!0 (select (arr!9019 a1!948) (_3!1497 lt!436755)) (select (arr!9019 a2!948) (_3!1497 lt!436755)) lt!436752 (ite c!14215 lt!436751 #b00000000000000000000000000000111)) (or (= lt!436752 (ite c!14215 lt!436751 #b00000000000000000000000000000111)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9019 a1!948) (_3!1497 lt!436755))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!14215 lt!436751 #b00000000000000000000000000000111)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!436752)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9019 a2!948) (_3!1497 lt!436755))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!14215 lt!436751 #b00000000000000000000000000000111)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!436752)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26013 () Bool)

(assert (= bs!26013 d!100866))

(declare-fun m!440561 () Bool)

(assert (=> bs!26013 m!440561))

(declare-fun m!440563 () Bool)

(assert (=> bs!26013 m!440563))

(assert (=> bm!5456 d!100866))

(push 1)

(assert (not b!301690))

(assert (not b!301691))

(assert (not b!301702))

(assert (not bm!5468))

(assert (not d!100848))

(assert (not d!100836))

(assert (not b!301694))

(assert (not d!100856))

(check-sat)

(pop 1)

(push 1)

(check-sat)

