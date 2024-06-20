; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61896 () Bool)

(assert start!61896)

(declare-fun b!277407 () Bool)

(declare-fun e!197357 () Bool)

(assert (=> b!277407 (= e!197357 (not true))))

(declare-datatypes ((array!15927 0))(
  ( (array!15928 (arr!7886 (Array (_ BitVec 32) (_ BitVec 8))) (size!6890 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!15927)

(declare-fun a2!699 () array!15927)

(declare-datatypes ((tuple4!566 0))(
  ( (tuple4!567 (_1!12358 (_ BitVec 32)) (_2!12358 (_ BitVec 32)) (_3!1063 (_ BitVec 32)) (_4!283 (_ BitVec 32))) )
))
(declare-fun lt!415407 () tuple4!566)

(declare-fun arrayRangesEq!1176 (array!15927 array!15927 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!277407 (arrayRangesEq!1176 a1!699 a2!699 (_1!12358 lt!415407) (_2!12358 lt!415407))))

(declare-fun b!277406 () Bool)

(declare-fun e!197359 () Bool)

(assert (=> b!277406 (= e!197359 e!197357)))

(declare-fun res!230398 () Bool)

(assert (=> b!277406 (=> (not res!230398) (not e!197357))))

(assert (=> b!277406 (= res!230398 (bvslt (_1!12358 lt!415407) (_2!12358 lt!415407)))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!566)

(assert (=> b!277406 (= lt!415407 (arrayBitIndices!0 from!822 to!789))))

(declare-fun res!230395 () Bool)

(assert (=> start!61896 (=> (not res!230395) (not e!197359))))

(assert (=> start!61896 (= res!230395 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6890 a1!699) (size!6890 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6890 a1!699))))))))

(assert (=> start!61896 e!197359))

(assert (=> start!61896 true))

(declare-fun array_inv!6614 (array!15927) Bool)

(assert (=> start!61896 (array_inv!6614 a1!699)))

(assert (=> start!61896 (array_inv!6614 a2!699)))

(declare-fun b!277404 () Bool)

(declare-fun res!230397 () Bool)

(assert (=> b!277404 (=> (not res!230397) (not e!197359))))

(declare-fun arrayBitRangesEq!0 (array!15927 array!15927 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!277404 (= res!230397 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!277405 () Bool)

(declare-fun res!230396 () Bool)

(assert (=> b!277405 (=> (not res!230396) (not e!197359))))

(assert (=> b!277405 (= res!230396 (bvslt from!822 to!789))))

(assert (= (and start!61896 res!230395) b!277404))

(assert (= (and b!277404 res!230397) b!277405))

(assert (= (and b!277405 res!230396) b!277406))

(assert (= (and b!277406 res!230398) b!277407))

(declare-fun m!410559 () Bool)

(assert (=> b!277407 m!410559))

(declare-fun m!410561 () Bool)

(assert (=> b!277406 m!410561))

(declare-fun m!410563 () Bool)

(assert (=> start!61896 m!410563))

(declare-fun m!410565 () Bool)

(assert (=> start!61896 m!410565))

(declare-fun m!410567 () Bool)

(assert (=> b!277404 m!410567))

(check-sat (not b!277407) (not b!277406) (not start!61896) (not b!277404))
