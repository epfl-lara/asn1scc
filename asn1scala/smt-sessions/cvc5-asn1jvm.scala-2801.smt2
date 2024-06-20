; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67422 () Bool)

(assert start!67422)

(declare-fun b!302767 () Bool)

(declare-fun e!217737 () Bool)

(declare-fun e!217735 () Bool)

(assert (=> b!302767 (= e!217737 e!217735)))

(declare-fun res!249189 () Bool)

(assert (=> b!302767 (=> (not res!249189) (not e!217735))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!437416 () (_ BitVec 64))

(assert (=> b!302767 (= res!249189 (and (bvsle toBit!258 lt!437416) (bvsle fromBit!258 lt!437416)))))

(declare-datatypes ((array!18392 0))(
  ( (array!18393 (arr!9070 (Array (_ BitVec 32) (_ BitVec 8))) (size!7987 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18392)

(assert (=> b!302767 (= lt!437416 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7987 a1!948))))))

(declare-fun b!302769 () Bool)

(declare-fun res!249192 () Bool)

(assert (=> b!302769 (=> (not res!249192) (not e!217735))))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!302769 (= res!249192 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437416) (not (= fromSlice!52 toSlice!52))))))

(declare-fun res!249190 () Bool)

(assert (=> start!67422 (=> (not res!249190) (not e!217737))))

(declare-fun a2!948 () array!18392)

(assert (=> start!67422 (= res!249190 (and (bvsle (size!7987 a1!948) (size!7987 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67422 e!217737))

(assert (=> start!67422 true))

(declare-fun array_inv!7599 (array!18392) Bool)

(assert (=> start!67422 (array_inv!7599 a1!948)))

(assert (=> start!67422 (array_inv!7599 a2!948)))

(declare-fun b!302768 () Bool)

(declare-fun res!249191 () Bool)

(assert (=> b!302768 (=> (not res!249191) (not e!217735))))

(declare-fun arrayBitRangesEq!0 (array!18392 array!18392 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302768 (= res!249191 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-datatypes ((tuple4!1116 0))(
  ( (tuple4!1117 (_1!13213 (_ BitVec 32)) (_2!13213 (_ BitVec 32)) (_3!1515 (_ BitVec 32)) (_4!558 (_ BitVec 32))) )
))
(declare-fun lt!437418 () tuple4!1116)

(declare-fun lt!437417 () tuple4!1116)

(declare-fun b!302770 () Bool)

(assert (=> b!302770 (= e!217735 (and (bvslt (_1!13213 lt!437418) (_2!13213 lt!437418)) (bvsle #b00000000000000000000000000000000 (_1!13213 lt!437417)) (bvsle (_1!13213 lt!437417) (_2!13213 lt!437417)) (bvsle (_2!13213 lt!437417) (size!7987 a1!948)) (or (bvsgt (_1!13213 lt!437417) (_1!13213 lt!437418)) (bvsgt (_1!13213 lt!437418) (_2!13213 lt!437418)) (bvsgt (_2!13213 lt!437418) (_2!13213 lt!437417)))))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1116)

(assert (=> b!302770 (= lt!437418 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!302770 (= lt!437417 (arrayBitIndices!0 fromBit!258 toBit!258))))

(assert (= (and start!67422 res!249190) b!302767))

(assert (= (and b!302767 res!249189) b!302768))

(assert (= (and b!302768 res!249191) b!302769))

(assert (= (and b!302769 res!249192) b!302770))

(declare-fun m!441525 () Bool)

(assert (=> start!67422 m!441525))

(declare-fun m!441527 () Bool)

(assert (=> start!67422 m!441527))

(declare-fun m!441529 () Bool)

(assert (=> b!302768 m!441529))

(declare-fun m!441531 () Bool)

(assert (=> b!302770 m!441531))

(declare-fun m!441533 () Bool)

(assert (=> b!302770 m!441533))

(push 1)

(assert (not b!302770))

(assert (not start!67422))

(assert (not b!302768))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!101158 () Bool)

(assert (=> d!101158 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1117 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!302770 d!101158))

(declare-fun d!101160 () Bool)

(assert (=> d!101160 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1117 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!302770 d!101160))

(declare-fun d!101162 () Bool)

(assert (=> d!101162 (= (array_inv!7599 a1!948) (bvsge (size!7987 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67422 d!101162))

(declare-fun d!101164 () Bool)

(assert (=> d!101164 (= (array_inv!7599 a2!948) (bvsge (size!7987 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67422 d!101164))

(declare-fun d!101166 () Bool)

(declare-fun res!249244 () Bool)

(declare-fun e!217793 () Bool)

(assert (=> d!101166 (=> res!249244 e!217793)))

(assert (=> d!101166 (= res!249244 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101166 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!217793)))

(declare-fun b!302830 () Bool)

(declare-fun res!249243 () Bool)

(declare-fun lt!437453 () (_ BitVec 32))

(assert (=> b!302830 (= res!249243 (= lt!437453 #b00000000000000000000000000000000))))

(declare-fun e!217798 () Bool)

(assert (=> b!302830 (=> res!249243 e!217798)))

(declare-fun e!217794 () Bool)

(assert (=> b!302830 (= e!217794 e!217798)))

(declare-fun bm!5543 () Bool)

(declare-fun c!14376 () Bool)

(declare-fun lt!437454 () tuple4!1116)

(declare-fun call!5546 () Bool)

(declare-fun lt!437452 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5543 (= call!5546 (byteRangesEq!0 (select (arr!9070 a1!948) (_3!1515 lt!437454)) (select (arr!9070 a2!948) (_3!1515 lt!437454)) lt!437452 (ite c!14376 lt!437453 #b00000000000000000000000000001000)))))

(declare-fun b!302831 () Bool)

(declare-fun e!217796 () Bool)

(declare-fun e!217795 () Bool)

(assert (=> b!302831 (= e!217796 e!217795)))

(assert (=> b!302831 (= c!14376 (= (_3!1515 lt!437454) (_4!558 lt!437454)))))

(declare-fun e!217797 () Bool)

(declare-fun b!302832 () Bool)

(declare-fun arrayRangesEq!1617 (array!18392 array!18392 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!302832 (= e!217797 (arrayRangesEq!1617 a1!948 a2!948 (_1!13213 lt!437454) (_2!13213 lt!437454)))))

(declare-fun b!302833 () Bool)

(assert (=> b!302833 (= e!217795 e!217794)))

(declare-fun res!249242 () Bool)

(assert (=> b!302833 (= res!249242 call!5546)))

(assert (=> b!302833 (=> (not res!249242) (not e!217794))))

(declare-fun b!302834 () Bool)

(assert (=> b!302834 (= e!217795 call!5546)))

(declare-fun b!302835 () Bool)

(assert (=> b!302835 (= e!217793 e!217796)))

(declare-fun res!249245 () Bool)

(assert (=> b!302835 (=> (not res!249245) (not e!217796))))

(assert (=> b!302835 (= res!249245 e!217797)))

(declare-fun res!249246 () Bool)

(assert (=> b!302835 (=> res!249246 e!217797)))

(assert (=> b!302835 (= res!249246 (bvsge (_1!13213 lt!437454) (_2!13213 lt!437454)))))

(assert (=> b!302835 (= lt!437453 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!302835 (= lt!437452 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!302835 (= lt!437454 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!302836 () Bool)

(assert (=> b!302836 (= e!217798 (byteRangesEq!0 (select (arr!9070 a1!948) (_4!558 lt!437454)) (select (arr!9070 a2!948) (_4!558 lt!437454)) #b00000000000000000000000000000000 lt!437453))))

(assert (= (and d!101166 (not res!249244)) b!302835))

(assert (= (and b!302835 (not res!249246)) b!302832))

(assert (= (and b!302835 res!249245) b!302831))

(assert (= (and b!302831 c!14376) b!302834))

(assert (= (and b!302831 (not c!14376)) b!302833))

(assert (= (and b!302833 res!249242) b!302830))

(assert (= (and b!302830 (not res!249243)) b!302836))

(assert (= (or b!302834 b!302833) bm!5543))

(declare-fun m!441569 () Bool)

(assert (=> bm!5543 m!441569))

(declare-fun m!441571 () Bool)

(assert (=> bm!5543 m!441571))

(assert (=> bm!5543 m!441569))

(assert (=> bm!5543 m!441571))

(declare-fun m!441573 () Bool)

(assert (=> bm!5543 m!441573))

(declare-fun m!441575 () Bool)

(assert (=> b!302832 m!441575))

(assert (=> b!302835 m!441533))

(declare-fun m!441577 () Bool)

(assert (=> b!302836 m!441577))

(declare-fun m!441579 () Bool)

(assert (=> b!302836 m!441579))

(assert (=> b!302836 m!441577))

(assert (=> b!302836 m!441579))

(declare-fun m!441581 () Bool)

(assert (=> b!302836 m!441581))

(assert (=> b!302768 d!101166))

(push 1)

(assert (not b!302832))

(assert (not b!302836))

(assert (not bm!5543))

(assert (not b!302835))

(check-sat)

(pop 1)

(push 1)

(check-sat)

