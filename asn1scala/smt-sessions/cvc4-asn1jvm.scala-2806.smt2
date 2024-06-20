; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67588 () Bool)

(assert start!67588)

(declare-fun b!303438 () Bool)

(declare-fun e!218327 () Bool)

(declare-datatypes ((tuple4!1150 0))(
  ( (tuple4!1151 (_1!13230 (_ BitVec 32)) (_2!13230 (_ BitVec 32)) (_3!1532 (_ BitVec 32)) (_4!575 (_ BitVec 32))) )
))
(declare-fun lt!437804 () tuple4!1150)

(declare-datatypes ((array!18441 0))(
  ( (array!18442 (arr!9087 (Array (_ BitVec 32) (_ BitVec 8))) (size!8004 (_ BitVec 32))) )
))
(declare-fun a2!948 () array!18441)

(assert (=> b!303438 (= e!218327 (and (not (= (_3!1532 lt!437804) (_4!575 lt!437804))) (or (bvslt (_3!1532 lt!437804) #b00000000000000000000000000000000) (bvsge (_3!1532 lt!437804) (size!8004 a2!948)))))))

(declare-datatypes ((Unit!21193 0))(
  ( (Unit!21194) )
))
(declare-fun lt!437802 () Unit!21193)

(declare-fun e!218329 () Unit!21193)

(assert (=> b!303438 (= lt!437802 e!218329)))

(declare-fun c!14451 () Bool)

(declare-fun lt!437805 () tuple4!1150)

(assert (=> b!303438 (= c!14451 (bvslt (_1!13230 lt!437805) (_2!13230 lt!437805)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1150)

(assert (=> b!303438 (= lt!437805 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(assert (=> b!303438 (= lt!437804 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!303439 () Bool)

(declare-fun Unit!21195 () Unit!21193)

(assert (=> b!303439 (= e!218329 Unit!21195)))

(declare-fun b!303440 () Bool)

(declare-fun e!218328 () Bool)

(assert (=> b!303440 (= e!218328 e!218327)))

(declare-fun res!249701 () Bool)

(assert (=> b!303440 (=> (not res!249701) (not e!218327))))

(declare-fun lt!437803 () (_ BitVec 64))

(assert (=> b!303440 (= res!249701 (and (bvsle toBit!258 lt!437803) (bvsle fromBit!258 lt!437803)))))

(declare-fun a1!948 () array!18441)

(assert (=> b!303440 (= lt!437803 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8004 a1!948))))))

(declare-fun b!303441 () Bool)

(declare-fun res!249700 () Bool)

(assert (=> b!303441 (=> (not res!249700) (not e!218327))))

(declare-fun arrayBitRangesEq!0 (array!18441 array!18441 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!303441 (= res!249700 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!303442 () Bool)

(declare-fun lt!437801 () Unit!21193)

(assert (=> b!303442 (= e!218329 lt!437801)))

(declare-fun arrayRangesEqSlicedLemma!228 (array!18441 array!18441 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21193)

(assert (=> b!303442 (= lt!437801 (arrayRangesEqSlicedLemma!228 a1!948 a2!948 (_1!13230 lt!437804) (_2!13230 lt!437804) (_1!13230 lt!437805) (_2!13230 lt!437805)))))

(declare-fun arrayRangesEq!1633 (array!18441 array!18441 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!303442 (arrayRangesEq!1633 a1!948 a2!948 (_1!13230 lt!437805) (_2!13230 lt!437805))))

(declare-fun b!303437 () Bool)

(declare-fun res!249699 () Bool)

(assert (=> b!303437 (=> (not res!249699) (not e!218327))))

(assert (=> b!303437 (= res!249699 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437803) (not (= fromSlice!52 toSlice!52))))))

(declare-fun res!249702 () Bool)

(assert (=> start!67588 (=> (not res!249702) (not e!218328))))

(assert (=> start!67588 (= res!249702 (and (bvsle (size!8004 a1!948) (size!8004 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67588 e!218328))

(assert (=> start!67588 true))

(declare-fun array_inv!7616 (array!18441) Bool)

(assert (=> start!67588 (array_inv!7616 a1!948)))

(assert (=> start!67588 (array_inv!7616 a2!948)))

(assert (= (and start!67588 res!249702) b!303440))

(assert (= (and b!303440 res!249701) b!303441))

(assert (= (and b!303441 res!249700) b!303437))

(assert (= (and b!303437 res!249699) b!303438))

(assert (= (and b!303438 c!14451) b!303442))

(assert (= (and b!303438 (not c!14451)) b!303439))

(declare-fun m!442045 () Bool)

(assert (=> b!303438 m!442045))

(declare-fun m!442047 () Bool)

(assert (=> b!303438 m!442047))

(declare-fun m!442049 () Bool)

(assert (=> b!303441 m!442049))

(declare-fun m!442051 () Bool)

(assert (=> b!303442 m!442051))

(declare-fun m!442053 () Bool)

(assert (=> b!303442 m!442053))

(declare-fun m!442055 () Bool)

(assert (=> start!67588 m!442055))

(declare-fun m!442057 () Bool)

(assert (=> start!67588 m!442057))

(push 1)

(assert (not b!303442))

(assert (not start!67588))

(assert (not b!303441))

(assert (not b!303438))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!101370 () Bool)

(assert (=> d!101370 (arrayRangesEq!1633 a1!948 a2!948 (_1!13230 lt!437805) (_2!13230 lt!437805))))

(declare-fun lt!437811 () Unit!21193)

(declare-fun choose!558 (array!18441 array!18441 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21193)

(assert (=> d!101370 (= lt!437811 (choose!558 a1!948 a2!948 (_1!13230 lt!437804) (_2!13230 lt!437804) (_1!13230 lt!437805) (_2!13230 lt!437805)))))

(assert (=> d!101370 (and (bvsle #b00000000000000000000000000000000 (_1!13230 lt!437804)) (bvsle (_1!13230 lt!437804) (_2!13230 lt!437804)))))

(assert (=> d!101370 (= (arrayRangesEqSlicedLemma!228 a1!948 a2!948 (_1!13230 lt!437804) (_2!13230 lt!437804) (_1!13230 lt!437805) (_2!13230 lt!437805)) lt!437811)))

(declare-fun bs!26140 () Bool)

(assert (= bs!26140 d!101370))

(assert (=> bs!26140 m!442053))

(declare-fun m!442061 () Bool)

(assert (=> bs!26140 m!442061))

(assert (=> b!303442 d!101370))

(declare-fun d!101374 () Bool)

(declare-fun res!249721 () Bool)

(declare-fun e!218350 () Bool)

(assert (=> d!101374 (=> res!249721 e!218350)))

(assert (=> d!101374 (= res!249721 (= (_1!13230 lt!437805) (_2!13230 lt!437805)))))

(assert (=> d!101374 (= (arrayRangesEq!1633 a1!948 a2!948 (_1!13230 lt!437805) (_2!13230 lt!437805)) e!218350)))

(declare-fun b!303465 () Bool)

(declare-fun e!218351 () Bool)

(assert (=> b!303465 (= e!218350 e!218351)))

(declare-fun res!249722 () Bool)

(assert (=> b!303465 (=> (not res!249722) (not e!218351))))

(assert (=> b!303465 (= res!249722 (= (select (arr!9087 a1!948) (_1!13230 lt!437805)) (select (arr!9087 a2!948) (_1!13230 lt!437805))))))

(declare-fun b!303466 () Bool)

(assert (=> b!303466 (= e!218351 (arrayRangesEq!1633 a1!948 a2!948 (bvadd (_1!13230 lt!437805) #b00000000000000000000000000000001) (_2!13230 lt!437805)))))

(assert (= (and d!101374 (not res!249721)) b!303465))

(assert (= (and b!303465 res!249722) b!303466))

(declare-fun m!442063 () Bool)

(assert (=> b!303465 m!442063))

(declare-fun m!442065 () Bool)

(assert (=> b!303465 m!442065))

(declare-fun m!442067 () Bool)

(assert (=> b!303466 m!442067))

(assert (=> b!303442 d!101374))

(declare-fun d!101376 () Bool)

(assert (=> d!101376 (= (array_inv!7616 a1!948) (bvsge (size!8004 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67588 d!101376))

(declare-fun d!101380 () Bool)

(assert (=> d!101380 (= (array_inv!7616 a2!948) (bvsge (size!8004 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67588 d!101380))

(declare-fun b!303518 () Bool)

(declare-fun e!218400 () Bool)

(declare-fun call!5594 () Bool)

(assert (=> b!303518 (= e!218400 call!5594)))

(declare-fun lt!437840 () tuple4!1150)

(declare-fun b!303519 () Bool)

(declare-fun e!218401 () Bool)

(assert (=> b!303519 (= e!218401 (arrayRangesEq!1633 a1!948 a2!948 (_1!13230 lt!437840) (_2!13230 lt!437840)))))

(declare-fun b!303520 () Bool)

(declare-fun e!218396 () Bool)

(assert (=> b!303520 (= e!218396 call!5594)))

(declare-fun lt!437839 () (_ BitVec 32))

(declare-fun lt!437841 () (_ BitVec 32))

(declare-fun c!14460 () Bool)

(declare-fun bm!5591 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5591 (= call!5594 (byteRangesEq!0 (ite c!14460 (select (arr!9087 a1!948) (_3!1532 lt!437840)) (select (arr!9087 a1!948) (_4!575 lt!437840))) (ite c!14460 (select (arr!9087 a2!948) (_3!1532 lt!437840)) (select (arr!9087 a2!948) (_4!575 lt!437840))) (ite c!14460 lt!437839 #b00000000000000000000000000000000) lt!437841))))

(declare-fun b!303521 () Bool)

(declare-fun e!218398 () Bool)

(assert (=> b!303521 (= e!218398 e!218396)))

(assert (=> b!303521 (= c!14460 (= (_3!1532 lt!437840) (_4!575 lt!437840)))))

(declare-fun b!303522 () Bool)

(declare-fun e!218399 () Bool)

(assert (=> b!303522 (= e!218396 e!218399)))

(declare-fun res!249764 () Bool)

(assert (=> b!303522 (= res!249764 (byteRangesEq!0 (select (arr!9087 a1!948) (_3!1532 lt!437840)) (select (arr!9087 a2!948) (_3!1532 lt!437840)) lt!437839 #b00000000000000000000000000001000))))

(assert (=> b!303522 (=> (not res!249764) (not e!218399))))

(declare-fun b!303523 () Bool)

(declare-fun e!218397 () Bool)

(assert (=> b!303523 (= e!218397 e!218398)))

(declare-fun res!249763 () Bool)

(assert (=> b!303523 (=> (not res!249763) (not e!218398))))

(assert (=> b!303523 (= res!249763 e!218401)))

(declare-fun res!249762 () Bool)

(assert (=> b!303523 (=> res!249762 e!218401)))

(assert (=> b!303523 (= res!249762 (bvsge (_1!13230 lt!437840) (_2!13230 lt!437840)))))

(assert (=> b!303523 (= lt!437841 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!303523 (= lt!437839 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!303523 (= lt!437840 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun d!101382 () Bool)

(declare-fun res!249761 () Bool)

(assert (=> d!101382 (=> res!249761 e!218397)))

(assert (=> d!101382 (= res!249761 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101382 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!218397)))

(declare-fun b!303517 () Bool)

(declare-fun res!249765 () Bool)

(assert (=> b!303517 (= res!249765 (= lt!437841 #b00000000000000000000000000000000))))

(assert (=> b!303517 (=> res!249765 e!218400)))

(assert (=> b!303517 (= e!218399 e!218400)))

(assert (= (and d!101382 (not res!249761)) b!303523))

(assert (= (and b!303523 (not res!249762)) b!303519))

(assert (= (and b!303523 res!249763) b!303521))

(assert (= (and b!303521 c!14460) b!303520))

(assert (= (and b!303521 (not c!14460)) b!303522))

(assert (= (and b!303522 res!249764) b!303517))

(assert (= (and b!303517 (not res!249765)) b!303518))

(assert (= (or b!303520 b!303518) bm!5591))

(declare-fun m!442111 () Bool)

(assert (=> b!303519 m!442111))

(declare-fun m!442113 () Bool)

(assert (=> bm!5591 m!442113))

(declare-fun m!442115 () Bool)

(assert (=> bm!5591 m!442115))

(declare-fun m!442117 () Bool)

(assert (=> bm!5591 m!442117))

(declare-fun m!442119 () Bool)

(assert (=> bm!5591 m!442119))

(declare-fun m!442121 () Bool)

(assert (=> bm!5591 m!442121))

(assert (=> b!303522 m!442119))

(assert (=> b!303522 m!442113))

(assert (=> b!303522 m!442119))

(assert (=> b!303522 m!442113))

(declare-fun m!442123 () Bool)

(assert (=> b!303522 m!442123))

(assert (=> b!303523 m!442047))

(assert (=> b!303441 d!101382))

(declare-fun d!101392 () Bool)

(assert (=> d!101392 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1151 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!303438 d!101392))

(declare-fun d!101394 () Bool)

(assert (=> d!101394 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1151 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!303438 d!101394))

(push 1)

(assert (not b!303523))

(assert (not b!303466))

(assert (not b!303519))

(assert (not bm!5591))

(assert (not d!101370))

(assert (not b!303522))

(check-sat)

(pop 1)

(push 1)

(check-sat)

