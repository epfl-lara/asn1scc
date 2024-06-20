; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62078 () Bool)

(assert start!62078)

(declare-fun b!278210 () Bool)

(declare-fun res!231030 () Bool)

(declare-fun e!198080 () Bool)

(assert (=> b!278210 (=> (not res!231030) (not e!198080))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!15999 0))(
  ( (array!16000 (arr!7916 (Array (_ BitVec 32) (_ BitVec 8))) (size!6920 (_ BitVec 32))) )
))
(declare-fun a2!699 () array!15999)

(declare-fun to!789 () (_ BitVec 64))

(declare-fun a1!699 () array!15999)

(declare-fun arrayBitRangesEq!0 (array!15999 array!15999 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278210 (= res!231030 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!278211 () Bool)

(declare-datatypes ((Unit!19471 0))(
  ( (Unit!19472) )
))
(declare-fun e!198078 () Unit!19471)

(declare-fun Unit!19473 () Unit!19471)

(assert (=> b!278211 (= e!198078 Unit!19473)))

(declare-fun res!231029 () Bool)

(assert (=> start!62078 (=> (not res!231029) (not e!198080))))

(assert (=> start!62078 (= res!231029 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6920 a1!699) (size!6920 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6920 a1!699))))))))

(assert (=> start!62078 e!198080))

(assert (=> start!62078 true))

(declare-fun array_inv!6644 (array!15999) Bool)

(assert (=> start!62078 (array_inv!6644 a1!699)))

(assert (=> start!62078 (array_inv!6644 a2!699)))

(declare-fun b!278212 () Bool)

(declare-fun e!198081 () Bool)

(assert (=> b!278212 (= e!198080 e!198081)))

(declare-fun res!231032 () Bool)

(assert (=> b!278212 (=> (not res!231032) (not e!198081))))

(declare-datatypes ((tuple4!626 0))(
  ( (tuple4!627 (_1!12388 (_ BitVec 32)) (_2!12388 (_ BitVec 32)) (_3!1093 (_ BitVec 32)) (_4!313 (_ BitVec 32))) )
))
(declare-fun lt!415851 () tuple4!626)

(assert (=> b!278212 (= res!231032 (not (= (_3!1093 lt!415851) (_4!313 lt!415851))))))

(declare-fun lt!415852 () Unit!19471)

(assert (=> b!278212 (= lt!415852 e!198078)))

(declare-fun c!12762 () Bool)

(assert (=> b!278212 (= c!12762 (bvslt (_1!12388 lt!415851) (_2!12388 lt!415851)))))

(declare-fun lt!415854 () (_ BitVec 32))

(assert (=> b!278212 (= lt!415854 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!626)

(assert (=> b!278212 (= lt!415851 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!278213 () Bool)

(declare-fun Unit!19474 () Unit!19471)

(assert (=> b!278213 (= e!198078 Unit!19474)))

(declare-fun arrayRangesEq!1206 (array!15999 array!15999 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278213 (arrayRangesEq!1206 a1!699 a2!699 (_1!12388 lt!415851) (_2!12388 lt!415851))))

(declare-fun lt!415853 () Unit!19471)

(declare-fun arrayRangesEqSymmetricLemma!125 (array!15999 array!15999 (_ BitVec 32) (_ BitVec 32)) Unit!19471)

(assert (=> b!278213 (= lt!415853 (arrayRangesEqSymmetricLemma!125 a1!699 a2!699 (_1!12388 lt!415851) (_2!12388 lt!415851)))))

(assert (=> b!278213 (arrayRangesEq!1206 a2!699 a1!699 (_1!12388 lt!415851) (_2!12388 lt!415851))))

(declare-fun b!278214 () Bool)

(declare-fun res!231031 () Bool)

(assert (=> b!278214 (=> (not res!231031) (not e!198080))))

(assert (=> b!278214 (= res!231031 (bvslt from!822 to!789))))

(declare-fun b!278215 () Bool)

(assert (=> b!278215 (= e!198081 (not (and (bvsle #b00000000000000000000000000000000 lt!415854) (bvsle lt!415854 #b00000000000000000000000000001000))))))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278215 (byteRangesEq!0 (select (arr!7916 a1!699) (_3!1093 lt!415851)) (select (arr!7916 a2!699) (_3!1093 lt!415851)) lt!415854 #b00000000000000000000000000001000)))

(assert (= (and start!62078 res!231029) b!278210))

(assert (= (and b!278210 res!231030) b!278214))

(assert (= (and b!278214 res!231031) b!278212))

(assert (= (and b!278212 c!12762) b!278213))

(assert (= (and b!278212 (not c!12762)) b!278211))

(assert (= (and b!278212 res!231032) b!278215))

(declare-fun m!411321 () Bool)

(assert (=> b!278215 m!411321))

(declare-fun m!411323 () Bool)

(assert (=> b!278215 m!411323))

(assert (=> b!278215 m!411321))

(assert (=> b!278215 m!411323))

(declare-fun m!411325 () Bool)

(assert (=> b!278215 m!411325))

(declare-fun m!411327 () Bool)

(assert (=> start!62078 m!411327))

(declare-fun m!411329 () Bool)

(assert (=> start!62078 m!411329))

(declare-fun m!411331 () Bool)

(assert (=> b!278212 m!411331))

(declare-fun m!411333 () Bool)

(assert (=> b!278210 m!411333))

(declare-fun m!411335 () Bool)

(assert (=> b!278213 m!411335))

(declare-fun m!411337 () Bool)

(assert (=> b!278213 m!411337))

(declare-fun m!411339 () Bool)

(assert (=> b!278213 m!411339))

(check-sat (not b!278215) (not b!278212) (not start!62078) (not b!278210) (not b!278213))
(check-sat)
