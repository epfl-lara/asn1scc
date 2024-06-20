; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61864 () Bool)

(assert start!61864)

(declare-fun res!230273 () Bool)

(declare-fun e!197226 () Bool)

(assert (=> start!61864 (=> (not res!230273) (not e!197226))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!15910 0))(
  ( (array!15911 (arr!7879 (Array (_ BitVec 32) (_ BitVec 8))) (size!6883 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!15910)

(declare-fun a2!699 () array!15910)

(declare-fun to!789 () (_ BitVec 64))

(assert (=> start!61864 (= res!230273 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6883 a1!699) (size!6883 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6883 a1!699))))))))

(assert (=> start!61864 e!197226))

(assert (=> start!61864 true))

(declare-fun array_inv!6607 (array!15910) Bool)

(assert (=> start!61864 (array_inv!6607 a1!699)))

(assert (=> start!61864 (array_inv!6607 a2!699)))

(declare-fun b!277264 () Bool)

(declare-fun res!230275 () Bool)

(assert (=> b!277264 (=> (not res!230275) (not e!197226))))

(declare-fun arrayBitRangesEq!0 (array!15910 array!15910 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!277264 (= res!230275 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!277265 () Bool)

(declare-fun res!230274 () Bool)

(assert (=> b!277265 (=> (not res!230274) (not e!197226))))

(assert (=> b!277265 (= res!230274 (bvslt from!822 to!789))))

(declare-fun b!277266 () Bool)

(declare-datatypes ((tuple4!552 0))(
  ( (tuple4!553 (_1!12351 (_ BitVec 32)) (_2!12351 (_ BitVec 32)) (_3!1056 (_ BitVec 32)) (_4!276 (_ BitVec 32))) )
))
(declare-fun lt!415359 () tuple4!552)

(assert (=> b!277266 (= e!197226 (and (bvslt (_1!12351 lt!415359) (_2!12351 lt!415359)) (bvsle #b00000000000000000000000000000000 (_1!12351 lt!415359)) (bvsle (_1!12351 lt!415359) (_2!12351 lt!415359)) (bvsgt (_2!12351 lt!415359) (size!6883 a1!699))))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!552)

(assert (=> b!277266 (= lt!415359 (arrayBitIndices!0 from!822 to!789))))

(assert (= (and start!61864 res!230273) b!277264))

(assert (= (and b!277264 res!230275) b!277265))

(assert (= (and b!277265 res!230274) b!277266))

(declare-fun m!410453 () Bool)

(assert (=> start!61864 m!410453))

(declare-fun m!410455 () Bool)

(assert (=> start!61864 m!410455))

(declare-fun m!410457 () Bool)

(assert (=> b!277264 m!410457))

(declare-fun m!410459 () Bool)

(assert (=> b!277266 m!410459))

(push 1)

(assert (not start!61864))

(assert (not b!277264))

(assert (not b!277266))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95690 () Bool)

(assert (=> d!95690 (= (array_inv!6607 a1!699) (bvsge (size!6883 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!61864 d!95690))

(declare-fun d!95692 () Bool)

(assert (=> d!95692 (= (array_inv!6607 a2!699) (bvsge (size!6883 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!61864 d!95692))

(declare-fun b!277313 () Bool)

(declare-fun e!197273 () Bool)

(declare-fun call!4486 () Bool)

(assert (=> b!277313 (= e!197273 call!4486)))

(declare-fun b!277314 () Bool)

(declare-fun e!197272 () Bool)

(assert (=> b!277314 (= e!197273 e!197272)))

(declare-fun res!230314 () Bool)

(assert (=> b!277314 (= res!230314 call!4486)))

(assert (=> b!277314 (=> (not res!230314) (not e!197272))))

(declare-fun b!277315 () Bool)

(declare-fun lt!415378 () (_ BitVec 32))

(declare-fun e!197274 () Bool)

(declare-fun lt!415379 () tuple4!552)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!277315 (= e!197274 (byteRangesEq!0 (select (arr!7879 a1!699) (_4!276 lt!415379)) (select (arr!7879 a2!699) (_4!276 lt!415379)) #b00000000000000000000000000000000 lt!415378))))

(declare-fun b!277316 () Bool)

(declare-fun res!230315 () Bool)

(assert (=> b!277316 (= res!230315 (= lt!415378 #b00000000000000000000000000000000))))

(assert (=> b!277316 (=> res!230315 e!197274)))

(assert (=> b!277316 (= e!197272 e!197274)))

(declare-fun d!95694 () Bool)

(declare-fun res!230317 () Bool)

(declare-fun e!197276 () Bool)

(assert (=> d!95694 (=> res!230317 e!197276)))

(assert (=> d!95694 (= res!230317 (bvsge from!822 to!789))))

(assert (=> d!95694 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!197276)))

(declare-fun e!197275 () Bool)

(declare-fun b!277317 () Bool)

(declare-fun arrayRangesEq!1169 (array!15910 array!15910 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!277317 (= e!197275 (arrayRangesEq!1169 a1!699 a2!699 (_1!12351 lt!415379) (_2!12351 lt!415379)))))

(declare-fun bm!4483 () Bool)

(declare-fun c!12671 () Bool)

(declare-fun lt!415380 () (_ BitVec 32))

(assert (=> bm!4483 (= call!4486 (byteRangesEq!0 (select (arr!7879 a1!699) (_3!1056 lt!415379)) (select (arr!7879 a2!699) (_3!1056 lt!415379)) lt!415380 (ite c!12671 lt!415378 #b00000000000000000000000000001000)))))

(declare-fun b!277318 () Bool)

(declare-fun e!197271 () Bool)

(assert (=> b!277318 (= e!197276 e!197271)))

(declare-fun res!230318 () Bool)

(assert (=> b!277318 (=> (not res!230318) (not e!197271))))

(assert (=> b!277318 (= res!230318 e!197275)))

(declare-fun res!230316 () Bool)

(assert (=> b!277318 (=> res!230316 e!197275)))

(assert (=> b!277318 (= res!230316 (bvsge (_1!12351 lt!415379) (_2!12351 lt!415379)))))

(assert (=> b!277318 (= lt!415378 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!277318 (= lt!415380 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!277318 (= lt!415379 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!277319 () Bool)

(assert (=> b!277319 (= e!197271 e!197273)))

(assert (=> b!277319 (= c!12671 (= (_3!1056 lt!415379) (_4!276 lt!415379)))))

(assert (= (and d!95694 (not res!230317)) b!277318))

(assert (= (and b!277318 (not res!230316)) b!277317))

(assert (= (and b!277318 res!230318) b!277319))

(assert (= (and b!277319 c!12671) b!277313))

(assert (= (and b!277319 (not c!12671)) b!277314))

(assert (= (and b!277314 res!230314) b!277316))

(assert (= (and b!277316 (not res!230315)) b!277315))

(assert (= (or b!277313 b!277314) bm!4483))

(declare-fun m!410477 () Bool)

(assert (=> b!277315 m!410477))

(declare-fun m!410479 () Bool)

(assert (=> b!277315 m!410479))

(assert (=> b!277315 m!410477))

(assert (=> b!277315 m!410479))

(declare-fun m!410481 () Bool)

(assert (=> b!277315 m!410481))

(declare-fun m!410483 () Bool)

(assert (=> b!277317 m!410483))

(declare-fun m!410485 () Bool)

(assert (=> bm!4483 m!410485))

(declare-fun m!410487 () Bool)

(assert (=> bm!4483 m!410487))

(assert (=> bm!4483 m!410485))

(assert (=> bm!4483 m!410487))

(declare-fun m!410489 () Bool)

(assert (=> bm!4483 m!410489))

(assert (=> b!277318 m!410459))

(assert (=> b!277264 d!95694))

(declare-fun d!95702 () Bool)

(assert (=> d!95702 (= (arrayBitIndices!0 from!822 to!789) (tuple4!553 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!277266 d!95702))

(push 1)

(assert (not b!277315))

(assert (not b!277317))

(assert (not bm!4483))

(assert (not b!277318))

(check-sat)

(pop 1)

(push 1)

(check-sat)

