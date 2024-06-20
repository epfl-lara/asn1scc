; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67880 () Bool)

(assert start!67880)

(declare-fun res!250596 () Bool)

(declare-fun e!219375 () Bool)

(assert (=> start!67880 (=> (not res!250596) (not e!219375))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18508 0))(
  ( (array!18509 (arr!9110 (Array (_ BitVec 32) (_ BitVec 8))) (size!8027 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18508)

(declare-fun a2!948 () array!18508)

(assert (=> start!67880 (= res!250596 (and (bvsle (size!8027 a1!948) (size!8027 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67880 e!219375))

(assert (=> start!67880 true))

(declare-fun array_inv!7639 (array!18508) Bool)

(assert (=> start!67880 (array_inv!7639 a1!948)))

(assert (=> start!67880 (array_inv!7639 a2!948)))

(declare-fun b!304684 () Bool)

(declare-fun e!219369 () Bool)

(declare-datatypes ((tuple4!1196 0))(
  ( (tuple4!1197 (_1!13253 (_ BitVec 32)) (_2!13253 (_ BitVec 32)) (_3!1555 (_ BitVec 32)) (_4!598 (_ BitVec 32))) )
))
(declare-fun lt!438494 () tuple4!1196)

(declare-fun lt!438496 () tuple4!1196)

(assert (=> b!304684 (= e!219369 (and (bvslt (_4!598 lt!438494) (_4!598 lt!438496)) (bvslt (_3!1555 lt!438496) (_4!598 lt!438494)) (or (bvsgt #b00000000000000000000000000000000 (_1!13253 lt!438496)) (bvsgt (_1!13253 lt!438496) (_2!13253 lt!438496)))))))

(declare-datatypes ((Unit!21263 0))(
  ( (Unit!21264) )
))
(declare-fun lt!438491 () Unit!21263)

(declare-fun e!219372 () Unit!21263)

(assert (=> b!304684 (= lt!438491 e!219372)))

(declare-fun c!14631 () Bool)

(assert (=> b!304684 (= c!14631 (and (bvslt (_3!1555 lt!438496) (_3!1555 lt!438494)) (bvslt (_3!1555 lt!438494) (_4!598 lt!438496))))))

(declare-fun b!304685 () Bool)

(declare-fun Unit!21265 () Unit!21263)

(assert (=> b!304685 (= e!219372 Unit!21265)))

(declare-fun b!304686 () Bool)

(declare-fun e!219367 () Unit!21263)

(declare-fun Unit!21266 () Unit!21263)

(assert (=> b!304686 (= e!219367 Unit!21266)))

(declare-fun b!304687 () Bool)

(declare-fun lt!438498 () Unit!21263)

(assert (=> b!304687 (= e!219372 lt!438498)))

(declare-fun arrayRangesEqImpliesEq!260 (array!18508 array!18508 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21263)

(assert (=> b!304687 (= lt!438498 (arrayRangesEqImpliesEq!260 a1!948 a2!948 (_1!13253 lt!438496) (_3!1555 lt!438494) (_2!13253 lt!438496)))))

(assert (=> b!304687 (= (select (arr!9110 a1!948) (_3!1555 lt!438494)) (select (arr!9110 a2!948) (_3!1555 lt!438494)))))

(declare-fun lt!438490 () (_ BitVec 32))

(declare-fun call!5690 () Bool)

(declare-fun c!14630 () Bool)

(declare-fun bm!5687 () Bool)

(declare-fun lt!438495 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5687 (= call!5690 (byteRangesEq!0 (ite c!14630 (select (arr!9110 a1!948) (_3!1555 lt!438496)) (select (arr!9110 a1!948) (_4!598 lt!438496))) (ite c!14630 (select (arr!9110 a2!948) (_3!1555 lt!438496)) (select (arr!9110 a2!948) (_4!598 lt!438496))) (ite c!14630 lt!438490 #b00000000000000000000000000000000) lt!438495))))

(declare-fun b!304688 () Bool)

(declare-fun e!219368 () Bool)

(assert (=> b!304688 (= e!219368 call!5690)))

(declare-fun b!304689 () Bool)

(declare-fun res!250593 () Bool)

(declare-fun e!219374 () Bool)

(assert (=> b!304689 (=> (not res!250593) (not e!219374))))

(declare-fun lt!438497 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!304689 (= res!250593 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!438497) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!304690 () Bool)

(declare-fun e!219371 () Bool)

(assert (=> b!304690 (= e!219368 e!219371)))

(declare-fun res!250590 () Bool)

(assert (=> b!304690 (= res!250590 (byteRangesEq!0 (select (arr!9110 a1!948) (_3!1555 lt!438496)) (select (arr!9110 a2!948) (_3!1555 lt!438496)) lt!438490 #b00000000000000000000000000000111))))

(assert (=> b!304690 (=> (not res!250590) (not e!219371))))

(declare-fun b!304691 () Bool)

(declare-fun lt!438492 () Unit!21263)

(assert (=> b!304691 (= e!219367 lt!438492)))

(declare-fun arrayRangesEqSlicedLemma!251 (array!18508 array!18508 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21263)

(assert (=> b!304691 (= lt!438492 (arrayRangesEqSlicedLemma!251 a1!948 a2!948 (_1!13253 lt!438496) (_2!13253 lt!438496) (_1!13253 lt!438494) (_2!13253 lt!438494)))))

(declare-fun arrayRangesEq!1656 (array!18508 array!18508 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!304691 (arrayRangesEq!1656 a1!948 a2!948 (_1!13253 lt!438494) (_2!13253 lt!438494))))

(declare-fun b!304692 () Bool)

(assert (=> b!304692 (= e!219374 e!219369)))

(declare-fun res!250594 () Bool)

(assert (=> b!304692 (=> (not res!250594) (not e!219369))))

(assert (=> b!304692 (= res!250594 e!219368)))

(assert (=> b!304692 (= c!14630 (= (_3!1555 lt!438496) (_4!598 lt!438496)))))

(declare-fun lt!438493 () Unit!21263)

(assert (=> b!304692 (= lt!438493 e!219367)))

(declare-fun c!14629 () Bool)

(assert (=> b!304692 (= c!14629 (bvslt (_1!13253 lt!438494) (_2!13253 lt!438494)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1196)

(assert (=> b!304692 (= lt!438494 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!304692 (= lt!438495 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!304692 (= lt!438490 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!304692 (= lt!438496 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!304693 () Bool)

(declare-fun res!250591 () Bool)

(assert (=> b!304693 (=> (not res!250591) (not e!219374))))

(declare-fun arrayBitRangesEq!0 (array!18508 array!18508 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!304693 (= res!250591 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!304694 () Bool)

(declare-fun res!250592 () Bool)

(assert (=> b!304694 (= res!250592 (= lt!438495 #b00000000000000000000000000000000))))

(declare-fun e!219373 () Bool)

(assert (=> b!304694 (=> res!250592 e!219373)))

(assert (=> b!304694 (= e!219371 e!219373)))

(declare-fun b!304695 () Bool)

(assert (=> b!304695 (= e!219375 e!219374)))

(declare-fun res!250595 () Bool)

(assert (=> b!304695 (=> (not res!250595) (not e!219374))))

(assert (=> b!304695 (= res!250595 (and (bvsle toBit!258 lt!438497) (bvsle fromBit!258 lt!438497)))))

(assert (=> b!304695 (= lt!438497 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8027 a1!948))))))

(declare-fun b!304696 () Bool)

(assert (=> b!304696 (= e!219373 call!5690)))

(assert (= (and start!67880 res!250596) b!304695))

(assert (= (and b!304695 res!250595) b!304693))

(assert (= (and b!304693 res!250591) b!304689))

(assert (= (and b!304689 res!250593) b!304692))

(assert (= (and b!304692 c!14629) b!304691))

(assert (= (and b!304692 (not c!14629)) b!304686))

(assert (= (and b!304692 c!14630) b!304688))

(assert (= (and b!304692 (not c!14630)) b!304690))

(assert (= (and b!304690 res!250590) b!304694))

(assert (= (and b!304694 (not res!250592)) b!304696))

(assert (= (or b!304688 b!304696) bm!5687))

(assert (= (and b!304692 res!250594) b!304684))

(assert (= (and b!304684 c!14631) b!304687))

(assert (= (and b!304684 (not c!14631)) b!304685))

(declare-fun m!443171 () Bool)

(assert (=> b!304692 m!443171))

(declare-fun m!443173 () Bool)

(assert (=> b!304692 m!443173))

(declare-fun m!443175 () Bool)

(assert (=> start!67880 m!443175))

(declare-fun m!443177 () Bool)

(assert (=> start!67880 m!443177))

(declare-fun m!443179 () Bool)

(assert (=> b!304693 m!443179))

(declare-fun m!443181 () Bool)

(assert (=> b!304691 m!443181))

(declare-fun m!443183 () Bool)

(assert (=> b!304691 m!443183))

(declare-fun m!443185 () Bool)

(assert (=> b!304687 m!443185))

(declare-fun m!443187 () Bool)

(assert (=> b!304687 m!443187))

(declare-fun m!443189 () Bool)

(assert (=> b!304687 m!443189))

(declare-fun m!443191 () Bool)

(assert (=> b!304690 m!443191))

(declare-fun m!443193 () Bool)

(assert (=> b!304690 m!443193))

(assert (=> b!304690 m!443191))

(assert (=> b!304690 m!443193))

(declare-fun m!443195 () Bool)

(assert (=> b!304690 m!443195))

(declare-fun m!443197 () Bool)

(assert (=> bm!5687 m!443197))

(assert (=> bm!5687 m!443191))

(declare-fun m!443199 () Bool)

(assert (=> bm!5687 m!443199))

(declare-fun m!443201 () Bool)

(assert (=> bm!5687 m!443201))

(assert (=> bm!5687 m!443193))

(check-sat (not b!304691) (not b!304690) (not start!67880) (not b!304687) (not b!304693) (not b!304692) (not bm!5687))
(check-sat)
(get-model)

(declare-fun d!101730 () Bool)

(assert (=> d!101730 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1197 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!304692 d!101730))

(declare-fun d!101732 () Bool)

(assert (=> d!101732 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1197 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!304692 d!101732))

(declare-fun d!101734 () Bool)

(assert (=> d!101734 (= (array_inv!7639 a1!948) (bvsge (size!8027 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67880 d!101734))

(declare-fun d!101736 () Bool)

(assert (=> d!101736 (= (array_inv!7639 a2!948) (bvsge (size!8027 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67880 d!101736))

(declare-fun d!101738 () Bool)

(assert (=> d!101738 (= (byteRangesEq!0 (ite c!14630 (select (arr!9110 a1!948) (_3!1555 lt!438496)) (select (arr!9110 a1!948) (_4!598 lt!438496))) (ite c!14630 (select (arr!9110 a2!948) (_3!1555 lt!438496)) (select (arr!9110 a2!948) (_4!598 lt!438496))) (ite c!14630 lt!438490 #b00000000000000000000000000000000) lt!438495) (or (= (ite c!14630 lt!438490 #b00000000000000000000000000000000) lt!438495) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14630 (select (arr!9110 a1!948) (_3!1555 lt!438496)) (select (arr!9110 a1!948) (_4!598 lt!438496)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!438495))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14630 lt!438490 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14630 (select (arr!9110 a2!948) (_3!1555 lt!438496)) (select (arr!9110 a2!948) (_4!598 lt!438496)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!438495))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14630 lt!438490 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26214 () Bool)

(assert (= bs!26214 d!101738))

(declare-fun m!443235 () Bool)

(assert (=> bs!26214 m!443235))

(declare-fun m!443237 () Bool)

(assert (=> bs!26214 m!443237))

(assert (=> bm!5687 d!101738))

(declare-fun d!101740 () Bool)

(assert (=> d!101740 (arrayRangesEq!1656 a1!948 a2!948 (_1!13253 lt!438494) (_2!13253 lt!438494))))

(declare-fun lt!438528 () Unit!21263)

(declare-fun choose!578 (array!18508 array!18508 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21263)

(assert (=> d!101740 (= lt!438528 (choose!578 a1!948 a2!948 (_1!13253 lt!438496) (_2!13253 lt!438496) (_1!13253 lt!438494) (_2!13253 lt!438494)))))

(assert (=> d!101740 (and (bvsle #b00000000000000000000000000000000 (_1!13253 lt!438496)) (bvsle (_1!13253 lt!438496) (_2!13253 lt!438496)))))

(assert (=> d!101740 (= (arrayRangesEqSlicedLemma!251 a1!948 a2!948 (_1!13253 lt!438496) (_2!13253 lt!438496) (_1!13253 lt!438494) (_2!13253 lt!438494)) lt!438528)))

(declare-fun bs!26215 () Bool)

(assert (= bs!26215 d!101740))

(assert (=> bs!26215 m!443183))

(declare-fun m!443239 () Bool)

(assert (=> bs!26215 m!443239))

(assert (=> b!304691 d!101740))

(declare-fun d!101742 () Bool)

(declare-fun res!250622 () Bool)

(declare-fun e!219411 () Bool)

(assert (=> d!101742 (=> res!250622 e!219411)))

(assert (=> d!101742 (= res!250622 (= (_1!13253 lt!438494) (_2!13253 lt!438494)))))

(assert (=> d!101742 (= (arrayRangesEq!1656 a1!948 a2!948 (_1!13253 lt!438494) (_2!13253 lt!438494)) e!219411)))

(declare-fun b!304740 () Bool)

(declare-fun e!219412 () Bool)

(assert (=> b!304740 (= e!219411 e!219412)))

(declare-fun res!250623 () Bool)

(assert (=> b!304740 (=> (not res!250623) (not e!219412))))

(assert (=> b!304740 (= res!250623 (= (select (arr!9110 a1!948) (_1!13253 lt!438494)) (select (arr!9110 a2!948) (_1!13253 lt!438494))))))

(declare-fun b!304741 () Bool)

(assert (=> b!304741 (= e!219412 (arrayRangesEq!1656 a1!948 a2!948 (bvadd (_1!13253 lt!438494) #b00000000000000000000000000000001) (_2!13253 lt!438494)))))

(assert (= (and d!101742 (not res!250622)) b!304740))

(assert (= (and b!304740 res!250623) b!304741))

(declare-fun m!443241 () Bool)

(assert (=> b!304740 m!443241))

(declare-fun m!443243 () Bool)

(assert (=> b!304740 m!443243))

(declare-fun m!443245 () Bool)

(assert (=> b!304741 m!443245))

(assert (=> b!304691 d!101742))

(declare-fun d!101744 () Bool)

(assert (=> d!101744 (and (bvsge (_3!1555 lt!438494) #b00000000000000000000000000000000) (bvslt (_3!1555 lt!438494) (size!8027 a1!948)) (bvslt (_3!1555 lt!438494) (size!8027 a2!948)) (= (select (arr!9110 a1!948) (_3!1555 lt!438494)) (select (arr!9110 a2!948) (_3!1555 lt!438494))))))

(declare-fun lt!438531 () Unit!21263)

(declare-fun choose!579 (array!18508 array!18508 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21263)

(assert (=> d!101744 (= lt!438531 (choose!579 a1!948 a2!948 (_1!13253 lt!438496) (_3!1555 lt!438494) (_2!13253 lt!438496)))))

(assert (=> d!101744 (and (bvsle #b00000000000000000000000000000000 (_1!13253 lt!438496)) (bvsle (_1!13253 lt!438496) (_2!13253 lt!438496)))))

(assert (=> d!101744 (= (arrayRangesEqImpliesEq!260 a1!948 a2!948 (_1!13253 lt!438496) (_3!1555 lt!438494) (_2!13253 lt!438496)) lt!438531)))

(declare-fun bs!26216 () Bool)

(assert (= bs!26216 d!101744))

(assert (=> bs!26216 m!443187))

(assert (=> bs!26216 m!443189))

(declare-fun m!443247 () Bool)

(assert (=> bs!26216 m!443247))

(assert (=> b!304687 d!101744))

(declare-fun d!101746 () Bool)

(assert (=> d!101746 (= (byteRangesEq!0 (select (arr!9110 a1!948) (_3!1555 lt!438496)) (select (arr!9110 a2!948) (_3!1555 lt!438496)) lt!438490 #b00000000000000000000000000000111) (or (= lt!438490 #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9110 a1!948) (_3!1555 lt!438496))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!438490)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9110 a2!948) (_3!1555 lt!438496))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!438490)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26217 () Bool)

(assert (= bs!26217 d!101746))

(declare-fun m!443249 () Bool)

(assert (=> bs!26217 m!443249))

(declare-fun m!443251 () Bool)

(assert (=> bs!26217 m!443251))

(assert (=> b!304690 d!101746))

(declare-fun b!304756 () Bool)

(declare-fun e!219427 () Bool)

(declare-fun e!219428 () Bool)

(assert (=> b!304756 (= e!219427 e!219428)))

(declare-fun res!250638 () Bool)

(assert (=> b!304756 (=> (not res!250638) (not e!219428))))

(declare-fun e!219426 () Bool)

(assert (=> b!304756 (= res!250638 e!219426)))

(declare-fun res!250634 () Bool)

(assert (=> b!304756 (=> res!250634 e!219426)))

(declare-fun lt!438538 () tuple4!1196)

(assert (=> b!304756 (= res!250634 (bvsge (_1!13253 lt!438538) (_2!13253 lt!438538)))))

(declare-fun lt!438539 () (_ BitVec 32))

(assert (=> b!304756 (= lt!438539 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!438540 () (_ BitVec 32))

(assert (=> b!304756 (= lt!438540 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!304756 (= lt!438538 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!304757 () Bool)

(assert (=> b!304757 (= e!219426 (arrayRangesEq!1656 a1!948 a2!948 (_1!13253 lt!438538) (_2!13253 lt!438538)))))

(declare-fun b!304758 () Bool)

(declare-fun e!219430 () Bool)

(declare-fun call!5696 () Bool)

(assert (=> b!304758 (= e!219430 call!5696)))

(declare-fun b!304759 () Bool)

(declare-fun res!250637 () Bool)

(assert (=> b!304759 (= res!250637 (= lt!438539 #b00000000000000000000000000000000))))

(declare-fun e!219425 () Bool)

(assert (=> b!304759 (=> res!250637 e!219425)))

(declare-fun e!219429 () Bool)

(assert (=> b!304759 (= e!219429 e!219425)))

(declare-fun bm!5693 () Bool)

(declare-fun c!14643 () Bool)

(assert (=> bm!5693 (= call!5696 (byteRangesEq!0 (select (arr!9110 a1!948) (_3!1555 lt!438538)) (select (arr!9110 a2!948) (_3!1555 lt!438538)) lt!438540 (ite c!14643 lt!438539 #b00000000000000000000000000001000)))))

(declare-fun b!304761 () Bool)

(assert (=> b!304761 (= e!219425 (byteRangesEq!0 (select (arr!9110 a1!948) (_4!598 lt!438538)) (select (arr!9110 a2!948) (_4!598 lt!438538)) #b00000000000000000000000000000000 lt!438539))))

(declare-fun b!304762 () Bool)

(assert (=> b!304762 (= e!219430 e!219429)))

(declare-fun res!250635 () Bool)

(assert (=> b!304762 (= res!250635 call!5696)))

(assert (=> b!304762 (=> (not res!250635) (not e!219429))))

(declare-fun b!304760 () Bool)

(assert (=> b!304760 (= e!219428 e!219430)))

(assert (=> b!304760 (= c!14643 (= (_3!1555 lt!438538) (_4!598 lt!438538)))))

(declare-fun d!101748 () Bool)

(declare-fun res!250636 () Bool)

(assert (=> d!101748 (=> res!250636 e!219427)))

(assert (=> d!101748 (= res!250636 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101748 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!219427)))

(assert (= (and d!101748 (not res!250636)) b!304756))

(assert (= (and b!304756 (not res!250634)) b!304757))

(assert (= (and b!304756 res!250638) b!304760))

(assert (= (and b!304760 c!14643) b!304758))

(assert (= (and b!304760 (not c!14643)) b!304762))

(assert (= (and b!304762 res!250635) b!304759))

(assert (= (and b!304759 (not res!250637)) b!304761))

(assert (= (or b!304758 b!304762) bm!5693))

(assert (=> b!304756 m!443173))

(declare-fun m!443253 () Bool)

(assert (=> b!304757 m!443253))

(declare-fun m!443255 () Bool)

(assert (=> bm!5693 m!443255))

(declare-fun m!443257 () Bool)

(assert (=> bm!5693 m!443257))

(assert (=> bm!5693 m!443255))

(assert (=> bm!5693 m!443257))

(declare-fun m!443259 () Bool)

(assert (=> bm!5693 m!443259))

(declare-fun m!443261 () Bool)

(assert (=> b!304761 m!443261))

(declare-fun m!443263 () Bool)

(assert (=> b!304761 m!443263))

(assert (=> b!304761 m!443261))

(assert (=> b!304761 m!443263))

(declare-fun m!443265 () Bool)

(assert (=> b!304761 m!443265))

(assert (=> b!304693 d!101748))

(check-sat (not b!304756) (not b!304757) (not d!101744) (not b!304761) (not bm!5693) (not b!304741) (not d!101740))
(check-sat)
