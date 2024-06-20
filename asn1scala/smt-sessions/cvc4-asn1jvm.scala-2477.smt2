; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63094 () Bool)

(assert start!63094)

(declare-fun res!234238 () Bool)

(declare-fun e!201721 () Bool)

(assert (=> start!63094 (=> (not res!234238) (not e!201721))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16304 0))(
  ( (array!16305 (arr!8034 (Array (_ BitVec 32) (_ BitVec 8))) (size!7038 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16304)

(declare-fun a2!699 () array!16304)

(declare-fun to!789 () (_ BitVec 64))

(assert (=> start!63094 (= res!234238 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!7038 a1!699) (size!7038 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7038 a1!699))))))))

(assert (=> start!63094 e!201721))

(assert (=> start!63094 true))

(declare-fun array_inv!6762 (array!16304) Bool)

(assert (=> start!63094 (array_inv!6762 a1!699)))

(assert (=> start!63094 (array_inv!6762 a2!699)))

(declare-fun b!282344 () Bool)

(declare-fun res!234237 () Bool)

(assert (=> b!282344 (=> (not res!234237) (not e!201721))))

(declare-fun arrayBitRangesEq!0 (array!16304 array!16304 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!282344 (= res!234237 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!282345 () Bool)

(declare-fun res!234239 () Bool)

(assert (=> b!282345 (=> (not res!234239) (not e!201721))))

(assert (=> b!282345 (= res!234239 (bvsge from!822 to!789))))

(declare-fun b!282346 () Bool)

(assert (=> b!282346 (= e!201721 (not (arrayBitRangesEq!0 a2!699 a1!699 from!822 to!789)))))

(assert (= (and start!63094 res!234238) b!282344))

(assert (= (and b!282344 res!234237) b!282345))

(assert (= (and b!282345 res!234239) b!282346))

(declare-fun m!415471 () Bool)

(assert (=> start!63094 m!415471))

(declare-fun m!415473 () Bool)

(assert (=> start!63094 m!415473))

(declare-fun m!415475 () Bool)

(assert (=> b!282344 m!415475))

(declare-fun m!415477 () Bool)

(assert (=> b!282346 m!415477))

(push 1)

(assert (not b!282346))

(assert (not start!63094))

(assert (not b!282344))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!282403 () Bool)

(declare-fun e!201776 () Bool)

(declare-fun e!201775 () Bool)

(assert (=> b!282403 (= e!201776 e!201775)))

(declare-fun c!13233 () Bool)

(declare-datatypes ((tuple4!824 0))(
  ( (tuple4!825 (_1!12487 (_ BitVec 32)) (_2!12487 (_ BitVec 32)) (_3!1192 (_ BitVec 32)) (_4!412 (_ BitVec 32))) )
))
(declare-fun lt!417764 () tuple4!824)

(assert (=> b!282403 (= c!13233 (= (_3!1192 lt!417764) (_4!412 lt!417764)))))

(declare-fun d!97156 () Bool)

(declare-fun res!234280 () Bool)

(declare-fun e!201777 () Bool)

(assert (=> d!97156 (=> res!234280 e!201777)))

(assert (=> d!97156 (= res!234280 (bvsge from!822 to!789))))

(assert (=> d!97156 (= (arrayBitRangesEq!0 a2!699 a1!699 from!822 to!789) e!201777)))

(declare-fun bm!4748 () Bool)

(declare-fun lt!417763 () (_ BitVec 32))

(declare-fun call!4751 () Bool)

(declare-fun lt!417765 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4748 (= call!4751 (byteRangesEq!0 (ite c!13233 (select (arr!8034 a2!699) (_3!1192 lt!417764)) (select (arr!8034 a2!699) (_4!412 lt!417764))) (ite c!13233 (select (arr!8034 a1!699) (_3!1192 lt!417764)) (select (arr!8034 a1!699) (_4!412 lt!417764))) (ite c!13233 lt!417763 #b00000000000000000000000000000000) lt!417765))))

(declare-fun b!282404 () Bool)

(declare-fun e!201772 () Bool)

(assert (=> b!282404 (= e!201775 e!201772)))

(declare-fun res!234282 () Bool)

(assert (=> b!282404 (= res!234282 (byteRangesEq!0 (select (arr!8034 a2!699) (_3!1192 lt!417764)) (select (arr!8034 a1!699) (_3!1192 lt!417764)) lt!417763 #b00000000000000000000000000001000))))

(assert (=> b!282404 (=> (not res!234282) (not e!201772))))

(declare-fun b!282405 () Bool)

(assert (=> b!282405 (= e!201777 e!201776)))

(declare-fun res!234281 () Bool)

(assert (=> b!282405 (=> (not res!234281) (not e!201776))))

(declare-fun e!201774 () Bool)

(assert (=> b!282405 (= res!234281 e!201774)))

(declare-fun res!234283 () Bool)

(assert (=> b!282405 (=> res!234283 e!201774)))

(assert (=> b!282405 (= res!234283 (bvsge (_1!12487 lt!417764) (_2!12487 lt!417764)))))

(assert (=> b!282405 (= lt!417765 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!282405 (= lt!417763 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!824)

(assert (=> b!282405 (= lt!417764 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!282406 () Bool)

(assert (=> b!282406 (= e!201775 call!4751)))

(declare-fun b!282407 () Bool)

(declare-fun res!234284 () Bool)

(assert (=> b!282407 (= res!234284 (= lt!417765 #b00000000000000000000000000000000))))

(declare-fun e!201773 () Bool)

(assert (=> b!282407 (=> res!234284 e!201773)))

(assert (=> b!282407 (= e!201772 e!201773)))

(declare-fun b!282408 () Bool)

(declare-fun arrayRangesEq!1306 (array!16304 array!16304 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!282408 (= e!201774 (arrayRangesEq!1306 a2!699 a1!699 (_1!12487 lt!417764) (_2!12487 lt!417764)))))

(declare-fun b!282409 () Bool)

(assert (=> b!282409 (= e!201773 call!4751)))

(assert (= (and d!97156 (not res!234280)) b!282405))

(assert (= (and b!282405 (not res!234283)) b!282408))

(assert (= (and b!282405 res!234281) b!282403))

(assert (= (and b!282403 c!13233) b!282406))

(assert (= (and b!282403 (not c!13233)) b!282404))

(assert (= (and b!282404 res!234282) b!282407))

(assert (= (and b!282407 (not res!234284)) b!282409))

(assert (= (or b!282406 b!282409) bm!4748))

(declare-fun m!415509 () Bool)

(assert (=> bm!4748 m!415509))

(declare-fun m!415511 () Bool)

(assert (=> bm!4748 m!415511))

(declare-fun m!415513 () Bool)

(assert (=> bm!4748 m!415513))

(declare-fun m!415515 () Bool)

(assert (=> bm!4748 m!415515))

(declare-fun m!415517 () Bool)

(assert (=> bm!4748 m!415517))

(assert (=> b!282404 m!415509))

(assert (=> b!282404 m!415517))

(assert (=> b!282404 m!415509))

(assert (=> b!282404 m!415517))

(declare-fun m!415519 () Bool)

(assert (=> b!282404 m!415519))

(declare-fun m!415521 () Bool)

(assert (=> b!282405 m!415521))

(declare-fun m!415523 () Bool)

(assert (=> b!282408 m!415523))

(assert (=> b!282346 d!97156))

(declare-fun d!97164 () Bool)

(assert (=> d!97164 (= (array_inv!6762 a1!699) (bvsge (size!7038 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!63094 d!97164))

(declare-fun d!97166 () Bool)

(assert (=> d!97166 (= (array_inv!6762 a2!699) (bvsge (size!7038 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!63094 d!97166))

(declare-fun b!282410 () Bool)

(declare-fun e!201782 () Bool)

(declare-fun e!201781 () Bool)

(assert (=> b!282410 (= e!201782 e!201781)))

(declare-fun c!13234 () Bool)

(declare-fun lt!417767 () tuple4!824)

(assert (=> b!282410 (= c!13234 (= (_3!1192 lt!417767) (_4!412 lt!417767)))))

(declare-fun d!97168 () Bool)

(declare-fun res!234285 () Bool)

(declare-fun e!201783 () Bool)

(assert (=> d!97168 (=> res!234285 e!201783)))

(assert (=> d!97168 (= res!234285 (bvsge from!822 to!789))))

(assert (=> d!97168 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!201783)))

(declare-fun lt!417766 () (_ BitVec 32))

(declare-fun call!4752 () Bool)

(declare-fun bm!4749 () Bool)

(declare-fun lt!417768 () (_ BitVec 32))

(assert (=> bm!4749 (= call!4752 (byteRangesEq!0 (ite c!13234 (select (arr!8034 a1!699) (_3!1192 lt!417767)) (select (arr!8034 a1!699) (_4!412 lt!417767))) (ite c!13234 (select (arr!8034 a2!699) (_3!1192 lt!417767)) (select (arr!8034 a2!699) (_4!412 lt!417767))) (ite c!13234 lt!417766 #b00000000000000000000000000000000) lt!417768))))

(declare-fun b!282411 () Bool)

(declare-fun e!201778 () Bool)

(assert (=> b!282411 (= e!201781 e!201778)))

(declare-fun res!234287 () Bool)

(assert (=> b!282411 (= res!234287 (byteRangesEq!0 (select (arr!8034 a1!699) (_3!1192 lt!417767)) (select (arr!8034 a2!699) (_3!1192 lt!417767)) lt!417766 #b00000000000000000000000000001000))))

(assert (=> b!282411 (=> (not res!234287) (not e!201778))))

(declare-fun b!282412 () Bool)

(assert (=> b!282412 (= e!201783 e!201782)))

(declare-fun res!234286 () Bool)

(assert (=> b!282412 (=> (not res!234286) (not e!201782))))

(declare-fun e!201780 () Bool)

(assert (=> b!282412 (= res!234286 e!201780)))

(declare-fun res!234288 () Bool)

(assert (=> b!282412 (=> res!234288 e!201780)))

(assert (=> b!282412 (= res!234288 (bvsge (_1!12487 lt!417767) (_2!12487 lt!417767)))))

(assert (=> b!282412 (= lt!417768 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!282412 (= lt!417766 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!282412 (= lt!417767 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!282413 () Bool)

(assert (=> b!282413 (= e!201781 call!4752)))

(declare-fun b!282414 () Bool)

(declare-fun res!234289 () Bool)

(assert (=> b!282414 (= res!234289 (= lt!417768 #b00000000000000000000000000000000))))

(declare-fun e!201779 () Bool)

(assert (=> b!282414 (=> res!234289 e!201779)))

(assert (=> b!282414 (= e!201778 e!201779)))

(declare-fun b!282415 () Bool)

(assert (=> b!282415 (= e!201780 (arrayRangesEq!1306 a1!699 a2!699 (_1!12487 lt!417767) (_2!12487 lt!417767)))))

(declare-fun b!282416 () Bool)

(assert (=> b!282416 (= e!201779 call!4752)))

(assert (= (and d!97168 (not res!234285)) b!282412))

