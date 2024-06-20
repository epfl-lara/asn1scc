; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61888 () Bool)

(assert start!61888)

(declare-fun b!277358 () Bool)

(declare-fun e!197311 () Bool)

(declare-fun e!197309 () Bool)

(assert (=> b!277358 (= e!197311 e!197309)))

(declare-fun res!230349 () Bool)

(assert (=> b!277358 (=> (not res!230349) (not e!197309))))

(declare-datatypes ((tuple4!558 0))(
  ( (tuple4!559 (_1!12354 (_ BitVec 32)) (_2!12354 (_ BitVec 32)) (_3!1059 (_ BitVec 32)) (_4!279 (_ BitVec 32))) )
))
(declare-fun lt!415395 () tuple4!558)

(assert (=> b!277358 (= res!230349 (bvslt (_1!12354 lt!415395) (_2!12354 lt!415395)))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!558)

(assert (=> b!277358 (= lt!415395 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!277356 () Bool)

(declare-fun res!230347 () Bool)

(assert (=> b!277356 (=> (not res!230347) (not e!197311))))

(declare-datatypes ((array!15919 0))(
  ( (array!15920 (arr!7882 (Array (_ BitVec 32) (_ BitVec 8))) (size!6886 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!15919)

(declare-fun a2!699 () array!15919)

(declare-fun arrayBitRangesEq!0 (array!15919 array!15919 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!277356 (= res!230347 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!277357 () Bool)

(declare-fun res!230348 () Bool)

(assert (=> b!277357 (=> (not res!230348) (not e!197311))))

(assert (=> b!277357 (= res!230348 (bvslt from!822 to!789))))

(declare-fun res!230350 () Bool)

(assert (=> start!61888 (=> (not res!230350) (not e!197311))))

(assert (=> start!61888 (= res!230350 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6886 a1!699) (size!6886 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6886 a1!699))))))))

(assert (=> start!61888 e!197311))

(assert (=> start!61888 true))

(declare-fun array_inv!6610 (array!15919) Bool)

(assert (=> start!61888 (array_inv!6610 a1!699)))

(assert (=> start!61888 (array_inv!6610 a2!699)))

(declare-fun b!277359 () Bool)

(assert (=> b!277359 (= e!197309 (not true))))

(declare-fun arrayRangesEq!1172 (array!15919 array!15919 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!277359 (arrayRangesEq!1172 a1!699 a2!699 (_1!12354 lt!415395) (_2!12354 lt!415395))))

(assert (= (and start!61888 res!230350) b!277356))

(assert (= (and b!277356 res!230347) b!277357))

(assert (= (and b!277357 res!230348) b!277358))

(assert (= (and b!277358 res!230349) b!277359))

(declare-fun m!410519 () Bool)

(assert (=> b!277358 m!410519))

(declare-fun m!410521 () Bool)

(assert (=> b!277356 m!410521))

(declare-fun m!410523 () Bool)

(assert (=> start!61888 m!410523))

(declare-fun m!410525 () Bool)

(assert (=> start!61888 m!410525))

(declare-fun m!410527 () Bool)

(assert (=> b!277359 m!410527))

(push 1)

(assert (not b!277358))

(assert (not b!277359))

(assert (not b!277356))

(assert (not start!61888))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

