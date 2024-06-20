; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62076 () Bool)

(assert start!62076)

(declare-fun b!278192 () Bool)

(declare-fun e!198062 () Bool)

(declare-fun lt!415840 () (_ BitVec 32))

(assert (=> b!278192 (= e!198062 (not (and (bvsle #b00000000000000000000000000000000 lt!415840) (bvsle lt!415840 #b00000000000000000000000000001000))))))

(declare-datatypes ((tuple4!624 0))(
  ( (tuple4!625 (_1!12387 (_ BitVec 32)) (_2!12387 (_ BitVec 32)) (_3!1092 (_ BitVec 32)) (_4!312 (_ BitVec 32))) )
))
(declare-fun lt!415841 () tuple4!624)

(declare-datatypes ((array!15997 0))(
  ( (array!15998 (arr!7915 (Array (_ BitVec 32) (_ BitVec 8))) (size!6919 (_ BitVec 32))) )
))
(declare-fun a2!699 () array!15997)

(declare-fun a1!699 () array!15997)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278192 (byteRangesEq!0 (select (arr!7915 a1!699) (_3!1092 lt!415841)) (select (arr!7915 a2!699) (_3!1092 lt!415841)) lt!415840 #b00000000000000000000000000001000)))

(declare-fun res!231019 () Bool)

(declare-fun e!198063 () Bool)

(assert (=> start!62076 (=> (not res!231019) (not e!198063))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> start!62076 (= res!231019 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6919 a1!699) (size!6919 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6919 a1!699))))))))

(assert (=> start!62076 e!198063))

(assert (=> start!62076 true))

(declare-fun array_inv!6643 (array!15997) Bool)

(assert (=> start!62076 (array_inv!6643 a1!699)))

(assert (=> start!62076 (array_inv!6643 a2!699)))

(declare-fun b!278193 () Bool)

(declare-fun res!231020 () Bool)

(assert (=> b!278193 (=> (not res!231020) (not e!198063))))

(assert (=> b!278193 (= res!231020 (bvslt from!822 to!789))))

(declare-fun b!278194 () Bool)

(declare-fun res!231017 () Bool)

(assert (=> b!278194 (=> (not res!231017) (not e!198063))))

(declare-fun arrayBitRangesEq!0 (array!15997 array!15997 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278194 (= res!231017 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!278195 () Bool)

(declare-datatypes ((Unit!19467 0))(
  ( (Unit!19468) )
))
(declare-fun e!198064 () Unit!19467)

(declare-fun Unit!19469 () Unit!19467)

(assert (=> b!278195 (= e!198064 Unit!19469)))

(declare-fun arrayRangesEq!1205 (array!15997 array!15997 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278195 (arrayRangesEq!1205 a1!699 a2!699 (_1!12387 lt!415841) (_2!12387 lt!415841))))

(declare-fun lt!415839 () Unit!19467)

(declare-fun arrayRangesEqSymmetricLemma!124 (array!15997 array!15997 (_ BitVec 32) (_ BitVec 32)) Unit!19467)

(assert (=> b!278195 (= lt!415839 (arrayRangesEqSymmetricLemma!124 a1!699 a2!699 (_1!12387 lt!415841) (_2!12387 lt!415841)))))

(assert (=> b!278195 (arrayRangesEq!1205 a2!699 a1!699 (_1!12387 lt!415841) (_2!12387 lt!415841))))

(declare-fun b!278196 () Bool)

(assert (=> b!278196 (= e!198063 e!198062)))

(declare-fun res!231018 () Bool)

(assert (=> b!278196 (=> (not res!231018) (not e!198062))))

(assert (=> b!278196 (= res!231018 (not (= (_3!1092 lt!415841) (_4!312 lt!415841))))))

(declare-fun lt!415842 () Unit!19467)

(assert (=> b!278196 (= lt!415842 e!198064)))

(declare-fun c!12759 () Bool)

(assert (=> b!278196 (= c!12759 (bvslt (_1!12387 lt!415841) (_2!12387 lt!415841)))))

(assert (=> b!278196 (= lt!415840 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!624)

(assert (=> b!278196 (= lt!415841 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!278197 () Bool)

(declare-fun Unit!19470 () Unit!19467)

(assert (=> b!278197 (= e!198064 Unit!19470)))

(assert (= (and start!62076 res!231019) b!278194))

(assert (= (and b!278194 res!231017) b!278193))

(assert (= (and b!278193 res!231020) b!278196))

(assert (= (and b!278196 c!12759) b!278195))

(assert (= (and b!278196 (not c!12759)) b!278197))

(assert (= (and b!278196 res!231018) b!278192))

(declare-fun m!411301 () Bool)

(assert (=> b!278196 m!411301))

(declare-fun m!411303 () Bool)

(assert (=> b!278195 m!411303))

(declare-fun m!411305 () Bool)

(assert (=> b!278195 m!411305))

(declare-fun m!411307 () Bool)

(assert (=> b!278195 m!411307))

(declare-fun m!411309 () Bool)

(assert (=> b!278194 m!411309))

(declare-fun m!411311 () Bool)

(assert (=> start!62076 m!411311))

(declare-fun m!411313 () Bool)

(assert (=> start!62076 m!411313))

(declare-fun m!411315 () Bool)

(assert (=> b!278192 m!411315))

(declare-fun m!411317 () Bool)

(assert (=> b!278192 m!411317))

(assert (=> b!278192 m!411315))

(assert (=> b!278192 m!411317))

(declare-fun m!411319 () Bool)

(assert (=> b!278192 m!411319))

(push 1)

(assert (not b!278192))

(assert (not b!278196))

(assert (not b!278194))

(assert (not start!62076))

(assert (not b!278195))

(check-sat)

(pop 1)

(push 1)

(check-sat)

