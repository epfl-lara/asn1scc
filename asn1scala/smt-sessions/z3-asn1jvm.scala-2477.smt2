; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63092 () Bool)

(assert start!63092)

(declare-fun res!234230 () Bool)

(declare-fun e!201714 () Bool)

(assert (=> start!63092 (=> (not res!234230) (not e!201714))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16302 0))(
  ( (array!16303 (arr!8033 (Array (_ BitVec 32) (_ BitVec 8))) (size!7037 (_ BitVec 32))) )
))
(declare-fun a2!699 () array!16302)

(declare-fun to!789 () (_ BitVec 64))

(declare-fun a1!699 () array!16302)

(assert (=> start!63092 (= res!234230 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!7037 a1!699) (size!7037 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7037 a1!699))))))))

(assert (=> start!63092 e!201714))

(assert (=> start!63092 true))

(declare-fun array_inv!6761 (array!16302) Bool)

(assert (=> start!63092 (array_inv!6761 a1!699)))

(assert (=> start!63092 (array_inv!6761 a2!699)))

(declare-fun b!282335 () Bool)

(declare-fun res!234229 () Bool)

(assert (=> b!282335 (=> (not res!234229) (not e!201714))))

(declare-fun arrayBitRangesEq!0 (array!16302 array!16302 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!282335 (= res!234229 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!282336 () Bool)

(declare-fun res!234228 () Bool)

(assert (=> b!282336 (=> (not res!234228) (not e!201714))))

(assert (=> b!282336 (= res!234228 (bvsge from!822 to!789))))

(declare-fun b!282337 () Bool)

(assert (=> b!282337 (= e!201714 (not (arrayBitRangesEq!0 a2!699 a1!699 from!822 to!789)))))

(assert (= (and start!63092 res!234230) b!282335))

(assert (= (and b!282335 res!234229) b!282336))

(assert (= (and b!282336 res!234228) b!282337))

(declare-fun m!415463 () Bool)

(assert (=> start!63092 m!415463))

(declare-fun m!415465 () Bool)

(assert (=> start!63092 m!415465))

(declare-fun m!415467 () Bool)

(assert (=> b!282335 m!415467))

(declare-fun m!415469 () Bool)

(assert (=> b!282337 m!415469))

(check-sat (not b!282337) (not start!63092) (not b!282335))
(check-sat)
(get-model)

(declare-fun lt!417752 () (_ BitVec 32))

(declare-fun lt!417753 () (_ BitVec 32))

(declare-fun bm!4742 () Bool)

(declare-datatypes ((tuple4!822 0))(
  ( (tuple4!823 (_1!12486 (_ BitVec 32)) (_2!12486 (_ BitVec 32)) (_3!1191 (_ BitVec 32)) (_4!411 (_ BitVec 32))) )
))
(declare-fun lt!417751 () tuple4!822)

(declare-fun call!4745 () Bool)

(declare-fun c!13229 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4742 (= call!4745 (byteRangesEq!0 (select (arr!8033 a2!699) (_3!1191 lt!417751)) (select (arr!8033 a1!699) (_3!1191 lt!417751)) lt!417753 (ite c!13229 lt!417752 #b00000000000000000000000000001000)))))

(declare-fun b!282371 () Bool)

(declare-fun e!201746 () Bool)

(assert (=> b!282371 (= e!201746 call!4745)))

(declare-fun e!201749 () Bool)

(declare-fun b!282372 () Bool)

(declare-fun arrayRangesEq!1304 (array!16302 array!16302 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!282372 (= e!201749 (arrayRangesEq!1304 a2!699 a1!699 (_1!12486 lt!417751) (_2!12486 lt!417751)))))

(declare-fun b!282373 () Bool)

(declare-fun e!201748 () Bool)

(assert (=> b!282373 (= e!201746 e!201748)))

(declare-fun res!234259 () Bool)

(assert (=> b!282373 (= res!234259 call!4745)))

(assert (=> b!282373 (=> (not res!234259) (not e!201748))))

(declare-fun b!282374 () Bool)

(declare-fun e!201747 () Bool)

(declare-fun e!201745 () Bool)

(assert (=> b!282374 (= e!201747 e!201745)))

(declare-fun res!234258 () Bool)

(assert (=> b!282374 (=> (not res!234258) (not e!201745))))

(assert (=> b!282374 (= res!234258 e!201749)))

(declare-fun res!234256 () Bool)

(assert (=> b!282374 (=> res!234256 e!201749)))

(assert (=> b!282374 (= res!234256 (bvsge (_1!12486 lt!417751) (_2!12486 lt!417751)))))

(assert (=> b!282374 (= lt!417752 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!282374 (= lt!417753 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!822)

(assert (=> b!282374 (= lt!417751 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!282375 () Bool)

(declare-fun res!234260 () Bool)

(assert (=> b!282375 (= res!234260 (= lt!417752 #b00000000000000000000000000000000))))

(declare-fun e!201744 () Bool)

(assert (=> b!282375 (=> res!234260 e!201744)))

(assert (=> b!282375 (= e!201748 e!201744)))

(declare-fun d!97152 () Bool)

(declare-fun res!234257 () Bool)

(assert (=> d!97152 (=> res!234257 e!201747)))

(assert (=> d!97152 (= res!234257 (bvsge from!822 to!789))))

(assert (=> d!97152 (= (arrayBitRangesEq!0 a2!699 a1!699 from!822 to!789) e!201747)))

(declare-fun b!282376 () Bool)

(assert (=> b!282376 (= e!201744 (byteRangesEq!0 (select (arr!8033 a2!699) (_4!411 lt!417751)) (select (arr!8033 a1!699) (_4!411 lt!417751)) #b00000000000000000000000000000000 lt!417752))))

(declare-fun b!282377 () Bool)

(assert (=> b!282377 (= e!201745 e!201746)))

(assert (=> b!282377 (= c!13229 (= (_3!1191 lt!417751) (_4!411 lt!417751)))))

(assert (= (and d!97152 (not res!234257)) b!282374))

(assert (= (and b!282374 (not res!234256)) b!282372))

(assert (= (and b!282374 res!234258) b!282377))

(assert (= (and b!282377 c!13229) b!282371))

(assert (= (and b!282377 (not c!13229)) b!282373))

(assert (= (and b!282373 res!234259) b!282375))

(assert (= (and b!282375 (not res!234260)) b!282376))

(assert (= (or b!282371 b!282373) bm!4742))

(declare-fun m!415479 () Bool)

(assert (=> bm!4742 m!415479))

(declare-fun m!415481 () Bool)

(assert (=> bm!4742 m!415481))

(assert (=> bm!4742 m!415479))

(assert (=> bm!4742 m!415481))

(declare-fun m!415483 () Bool)

(assert (=> bm!4742 m!415483))

(declare-fun m!415485 () Bool)

(assert (=> b!282372 m!415485))

(declare-fun m!415487 () Bool)

(assert (=> b!282374 m!415487))

(declare-fun m!415489 () Bool)

(assert (=> b!282376 m!415489))

(declare-fun m!415491 () Bool)

(assert (=> b!282376 m!415491))

(assert (=> b!282376 m!415489))

(assert (=> b!282376 m!415491))

(declare-fun m!415493 () Bool)

(assert (=> b!282376 m!415493))

(assert (=> b!282337 d!97152))

(declare-fun d!97158 () Bool)

(assert (=> d!97158 (= (array_inv!6761 a1!699) (bvsge (size!7037 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!63092 d!97158))

(declare-fun d!97160 () Bool)

(assert (=> d!97160 (= (array_inv!6761 a2!699) (bvsge (size!7037 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!63092 d!97160))

(declare-fun lt!417755 () (_ BitVec 32))

(declare-fun lt!417754 () tuple4!822)

(declare-fun bm!4745 () Bool)

(declare-fun lt!417756 () (_ BitVec 32))

(declare-fun call!4748 () Bool)

(declare-fun c!13230 () Bool)

(assert (=> bm!4745 (= call!4748 (byteRangesEq!0 (select (arr!8033 a1!699) (_3!1191 lt!417754)) (select (arr!8033 a2!699) (_3!1191 lt!417754)) lt!417756 (ite c!13230 lt!417755 #b00000000000000000000000000001000)))))

(declare-fun b!282382 () Bool)

(declare-fun e!201756 () Bool)

(assert (=> b!282382 (= e!201756 call!4748)))

(declare-fun e!201759 () Bool)

(declare-fun b!282383 () Bool)

(assert (=> b!282383 (= e!201759 (arrayRangesEq!1304 a1!699 a2!699 (_1!12486 lt!417754) (_2!12486 lt!417754)))))

(declare-fun b!282384 () Bool)

(declare-fun e!201758 () Bool)

(assert (=> b!282384 (= e!201756 e!201758)))

(declare-fun res!234268 () Bool)

(assert (=> b!282384 (= res!234268 call!4748)))

(assert (=> b!282384 (=> (not res!234268) (not e!201758))))

(declare-fun b!282385 () Bool)

(declare-fun e!201757 () Bool)

(declare-fun e!201755 () Bool)

(assert (=> b!282385 (= e!201757 e!201755)))

(declare-fun res!234267 () Bool)

(assert (=> b!282385 (=> (not res!234267) (not e!201755))))

(assert (=> b!282385 (= res!234267 e!201759)))

(declare-fun res!234265 () Bool)

(assert (=> b!282385 (=> res!234265 e!201759)))

(assert (=> b!282385 (= res!234265 (bvsge (_1!12486 lt!417754) (_2!12486 lt!417754)))))

(assert (=> b!282385 (= lt!417755 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!282385 (= lt!417756 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!282385 (= lt!417754 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!282386 () Bool)

(declare-fun res!234269 () Bool)

(assert (=> b!282386 (= res!234269 (= lt!417755 #b00000000000000000000000000000000))))

(declare-fun e!201754 () Bool)

(assert (=> b!282386 (=> res!234269 e!201754)))

(assert (=> b!282386 (= e!201758 e!201754)))

(declare-fun d!97162 () Bool)

(declare-fun res!234266 () Bool)

(assert (=> d!97162 (=> res!234266 e!201757)))

(assert (=> d!97162 (= res!234266 (bvsge from!822 to!789))))

(assert (=> d!97162 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!201757)))

(declare-fun b!282387 () Bool)

(assert (=> b!282387 (= e!201754 (byteRangesEq!0 (select (arr!8033 a1!699) (_4!411 lt!417754)) (select (arr!8033 a2!699) (_4!411 lt!417754)) #b00000000000000000000000000000000 lt!417755))))

(declare-fun b!282388 () Bool)

(assert (=> b!282388 (= e!201755 e!201756)))

(assert (=> b!282388 (= c!13230 (= (_3!1191 lt!417754) (_4!411 lt!417754)))))

(assert (= (and d!97162 (not res!234266)) b!282385))

(assert (= (and b!282385 (not res!234265)) b!282383))

(assert (= (and b!282385 res!234267) b!282388))

(assert (= (and b!282388 c!13230) b!282382))

(assert (= (and b!282388 (not c!13230)) b!282384))

(assert (= (and b!282384 res!234268) b!282386))

(assert (= (and b!282386 (not res!234269)) b!282387))

(assert (= (or b!282382 b!282384) bm!4745))

(declare-fun m!415495 () Bool)

(assert (=> bm!4745 m!415495))

(declare-fun m!415497 () Bool)

(assert (=> bm!4745 m!415497))

(assert (=> bm!4745 m!415495))

(assert (=> bm!4745 m!415497))

(declare-fun m!415499 () Bool)

(assert (=> bm!4745 m!415499))

(declare-fun m!415501 () Bool)

(assert (=> b!282383 m!415501))

(assert (=> b!282385 m!415487))

(declare-fun m!415503 () Bool)

(assert (=> b!282387 m!415503))

(declare-fun m!415505 () Bool)

(assert (=> b!282387 m!415505))

(assert (=> b!282387 m!415503))

(assert (=> b!282387 m!415505))

(declare-fun m!415507 () Bool)

(assert (=> b!282387 m!415507))

(assert (=> b!282335 d!97162))

(check-sat (not bm!4742) (not b!282383) (not b!282387) (not b!282376) (not b!282385) (not b!282372) (not bm!4745) (not b!282374))
(check-sat)
