; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67402 () Bool)

(assert start!67402)

(declare-fun b!302692 () Bool)

(declare-fun e!217669 () Bool)

(declare-fun e!217671 () Bool)

(assert (=> b!302692 (= e!217669 e!217671)))

(declare-fun res!249132 () Bool)

(assert (=> b!302692 (=> (not res!249132) (not e!217671))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!437381 () (_ BitVec 64))

(assert (=> b!302692 (= res!249132 (and (bvsle toBit!258 lt!437381) (bvsle fromBit!258 lt!437381)))))

(declare-datatypes ((array!18387 0))(
  ( (array!18388 (arr!9069 (Array (_ BitVec 32) (_ BitVec 8))) (size!7986 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18387)

(assert (=> b!302692 (= lt!437381 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7986 a1!948))))))

(declare-fun res!249135 () Bool)

(assert (=> start!67402 (=> (not res!249135) (not e!217669))))

(declare-fun a2!948 () array!18387)

(assert (=> start!67402 (= res!249135 (and (bvsle (size!7986 a1!948) (size!7986 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67402 e!217669))

(assert (=> start!67402 true))

(declare-fun array_inv!7598 (array!18387) Bool)

(assert (=> start!67402 (array_inv!7598 a1!948)))

(assert (=> start!67402 (array_inv!7598 a2!948)))

(declare-fun b!302694 () Bool)

(declare-fun res!249134 () Bool)

(assert (=> b!302694 (=> (not res!249134) (not e!217671))))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!302694 (= res!249134 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437381) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!302695 () Bool)

(declare-datatypes ((tuple4!1114 0))(
  ( (tuple4!1115 (_1!13212 (_ BitVec 32)) (_2!13212 (_ BitVec 32)) (_3!1514 (_ BitVec 32)) (_4!557 (_ BitVec 32))) )
))
(declare-fun lt!437380 () tuple4!1114)

(declare-fun lt!437382 () tuple4!1114)

(assert (=> b!302695 (= e!217671 (and (bvslt (_1!13212 lt!437380) (_2!13212 lt!437380)) (bvsle #b00000000000000000000000000000000 (_1!13212 lt!437382)) (bvsle (_1!13212 lt!437382) (_2!13212 lt!437382)) (bvsgt (_2!13212 lt!437382) (size!7986 a1!948))))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1114)

(assert (=> b!302695 (= lt!437380 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!302695 (= lt!437382 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!302693 () Bool)

(declare-fun res!249133 () Bool)

(assert (=> b!302693 (=> (not res!249133) (not e!217671))))

(declare-fun arrayBitRangesEq!0 (array!18387 array!18387 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302693 (= res!249133 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(assert (= (and start!67402 res!249135) b!302692))

(assert (= (and b!302692 res!249132) b!302693))

(assert (= (and b!302693 res!249133) b!302694))

(assert (= (and b!302694 res!249134) b!302695))

(declare-fun m!441473 () Bool)

(assert (=> start!67402 m!441473))

(declare-fun m!441475 () Bool)

(assert (=> start!67402 m!441475))

(declare-fun m!441477 () Bool)

(assert (=> b!302695 m!441477))

(declare-fun m!441479 () Bool)

(assert (=> b!302695 m!441479))

(declare-fun m!441481 () Bool)

(assert (=> b!302693 m!441481))

(push 1)

(assert (not start!67402))

(assert (not b!302693))

(assert (not b!302695))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!101138 () Bool)

(assert (=> d!101138 (= (array_inv!7598 a1!948) (bvsge (size!7986 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67402 d!101138))

(declare-fun d!101140 () Bool)

(assert (=> d!101140 (= (array_inv!7598 a2!948) (bvsge (size!7986 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67402 d!101140))

(declare-fun d!101142 () Bool)

(declare-fun res!249180 () Bool)

(declare-fun e!217725 () Bool)

(assert (=> d!101142 (=> res!249180 e!217725)))

(assert (=> d!101142 (= res!249180 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101142 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!217725)))

(declare-fun b!302752 () Bool)

(declare-fun e!217721 () Bool)

(assert (=> b!302752 (= e!217725 e!217721)))

(declare-fun res!249177 () Bool)

(assert (=> b!302752 (=> (not res!249177) (not e!217721))))

(declare-fun e!217722 () Bool)

(assert (=> b!302752 (= res!249177 e!217722)))

(declare-fun res!249176 () Bool)

(assert (=> b!302752 (=> res!249176 e!217722)))

(declare-fun lt!437407 () tuple4!1114)

(assert (=> b!302752 (= res!249176 (bvsge (_1!13212 lt!437407) (_2!13212 lt!437407)))))

(declare-fun lt!437408 () (_ BitVec 32))

(assert (=> b!302752 (= lt!437408 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!437409 () (_ BitVec 32))

(assert (=> b!302752 (= lt!437409 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!302752 (= lt!437407 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun bm!5537 () Bool)

(declare-fun call!5540 () Bool)

(declare-fun c!14370 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5537 (= call!5540 (byteRangesEq!0 (ite c!14370 (select (arr!9069 a1!948) (_3!1514 lt!437407)) (select (arr!9069 a1!948) (_4!557 lt!437407))) (ite c!14370 (select (arr!9069 a2!948) (_3!1514 lt!437407)) (select (arr!9069 a2!948) (_4!557 lt!437407))) (ite c!14370 lt!437409 #b00000000000000000000000000000000) lt!437408))))

(declare-fun b!302753 () Bool)

(declare-fun e!217723 () Bool)

(assert (=> b!302753 (= e!217721 e!217723)))

(assert (=> b!302753 (= c!14370 (= (_3!1514 lt!437407) (_4!557 lt!437407)))))

(declare-fun b!302754 () Bool)

(declare-fun e!217724 () Bool)

(assert (=> b!302754 (= e!217723 e!217724)))

(declare-fun res!249179 () Bool)

(assert (=> b!302754 (= res!249179 (byteRangesEq!0 (select (arr!9069 a1!948) (_3!1514 lt!437407)) (select (arr!9069 a2!948) (_3!1514 lt!437407)) lt!437409 #b00000000000000000000000000001000))))

(assert (=> b!302754 (=> (not res!249179) (not e!217724))))

(declare-fun b!302755 () Bool)

(declare-fun arrayRangesEq!1615 (array!18387 array!18387 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!302755 (= e!217722 (arrayRangesEq!1615 a1!948 a2!948 (_1!13212 lt!437407) (_2!13212 lt!437407)))))

(declare-fun b!302756 () Bool)

(assert (=> b!302756 (= e!217723 call!5540)))

(declare-fun b!302757 () Bool)

(declare-fun e!217726 () Bool)

(assert (=> b!302757 (= e!217726 call!5540)))

(declare-fun b!302758 () Bool)

(declare-fun res!249178 () Bool)

(assert (=> b!302758 (= res!249178 (= lt!437408 #b00000000000000000000000000000000))))

(assert (=> b!302758 (=> res!249178 e!217726)))

(assert (=> b!302758 (= e!217724 e!217726)))

(assert (= (and d!101142 (not res!249180)) b!302752))

(assert (= (and b!302752 (not res!249176)) b!302755))

(assert (= (and b!302752 res!249177) b!302753))

(assert (= (and b!302753 c!14370) b!302756))

(assert (= (and b!302753 (not c!14370)) b!302754))

(assert (= (and b!302754 res!249179) b!302758))

(assert (= (and b!302758 (not res!249178)) b!302757))

(assert (= (or b!302756 b!302757) bm!5537))

(assert (=> b!302752 m!441479))

(declare-fun m!441511 () Bool)

(assert (=> bm!5537 m!441511))

(declare-fun m!441513 () Bool)

(assert (=> bm!5537 m!441513))

(declare-fun m!441515 () Bool)

(assert (=> bm!5537 m!441515))

(declare-fun m!441517 () Bool)

(assert (=> bm!5537 m!441517))

(declare-fun m!441519 () Bool)

(assert (=> bm!5537 m!441519))

(assert (=> b!302754 m!441513))

(assert (=> b!302754 m!441519))

(assert (=> b!302754 m!441513))

(assert (=> b!302754 m!441519))

(declare-fun m!441521 () Bool)

(assert (=> b!302754 m!441521))

(declare-fun m!441523 () Bool)

(assert (=> b!302755 m!441523))

(assert (=> b!302693 d!101142))

(declare-fun d!101146 () Bool)

(assert (=> d!101146 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1115 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!302695 d!101146))

(declare-fun d!101148 () Bool)

(assert (=> d!101148 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1115 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!302695 d!101148))

(push 1)

(assert (not b!302754))

(assert (not b!302755))

(assert (not b!302752))

(assert (not bm!5537))

(check-sat)

