; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62064 () Bool)

(assert start!62064)

(declare-fun b!278086 () Bool)

(declare-datatypes ((Unit!19443 0))(
  ( (Unit!19444) )
))
(declare-fun e!197976 () Unit!19443)

(declare-fun Unit!19445 () Unit!19443)

(assert (=> b!278086 (= e!197976 Unit!19445)))

(declare-fun b!278087 () Bool)

(declare-fun e!197979 () Bool)

(declare-fun e!197975 () Bool)

(assert (=> b!278087 (= e!197979 e!197975)))

(declare-fun res!230951 () Bool)

(assert (=> b!278087 (=> (not res!230951) (not e!197975))))

(declare-datatypes ((tuple4!612 0))(
  ( (tuple4!613 (_1!12381 (_ BitVec 32)) (_2!12381 (_ BitVec 32)) (_3!1086 (_ BitVec 32)) (_4!306 (_ BitVec 32))) )
))
(declare-fun lt!415763 () tuple4!612)

(assert (=> b!278087 (= res!230951 (= (_3!1086 lt!415763) (_4!306 lt!415763)))))

(declare-fun lt!415764 () Unit!19443)

(assert (=> b!278087 (= lt!415764 e!197976)))

(declare-fun c!12741 () Bool)

(assert (=> b!278087 (= c!12741 (bvslt (_1!12381 lt!415763) (_2!12381 lt!415763)))))

(declare-fun lt!415760 () (_ BitVec 32))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!278087 (= lt!415760 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!415761 () (_ BitVec 32))

(declare-fun from!822 () (_ BitVec 64))

(assert (=> b!278087 (= lt!415761 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!612)

(assert (=> b!278087 (= lt!415763 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!278088 () Bool)

(declare-fun res!230947 () Bool)

(assert (=> b!278088 (=> (not res!230947) (not e!197979))))

(declare-datatypes ((array!15985 0))(
  ( (array!15986 (arr!7909 (Array (_ BitVec 32) (_ BitVec 8))) (size!6913 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!15985)

(declare-fun a2!699 () array!15985)

(declare-fun arrayBitRangesEq!0 (array!15985 array!15985 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278088 (= res!230947 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun res!230948 () Bool)

(assert (=> start!62064 (=> (not res!230948) (not e!197979))))

(assert (=> start!62064 (= res!230948 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6913 a1!699) (size!6913 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6913 a1!699))))))))

(assert (=> start!62064 e!197979))

(assert (=> start!62064 true))

(declare-fun array_inv!6637 (array!15985) Bool)

(assert (=> start!62064 (array_inv!6637 a1!699)))

(assert (=> start!62064 (array_inv!6637 a2!699)))

(declare-fun b!278089 () Bool)

(declare-fun Unit!19446 () Unit!19443)

(assert (=> b!278089 (= e!197976 Unit!19446)))

(declare-fun arrayRangesEq!1199 (array!15985 array!15985 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278089 (arrayRangesEq!1199 a1!699 a2!699 (_1!12381 lt!415763) (_2!12381 lt!415763))))

(declare-fun lt!415762 () Unit!19443)

(declare-fun arrayRangesEqSymmetricLemma!118 (array!15985 array!15985 (_ BitVec 32) (_ BitVec 32)) Unit!19443)

(assert (=> b!278089 (= lt!415762 (arrayRangesEqSymmetricLemma!118 a1!699 a2!699 (_1!12381 lt!415763) (_2!12381 lt!415763)))))

(assert (=> b!278089 (arrayRangesEq!1199 a2!699 a1!699 (_1!12381 lt!415763) (_2!12381 lt!415763))))

(declare-fun b!278090 () Bool)

(declare-fun res!230950 () Bool)

(assert (=> b!278090 (=> (not res!230950) (not e!197979))))

(assert (=> b!278090 (= res!230950 (bvslt from!822 to!789))))

(declare-fun b!278091 () Bool)

(declare-fun e!197978 () Bool)

(assert (=> b!278091 (= e!197975 (not e!197978))))

(declare-fun res!230949 () Bool)

(assert (=> b!278091 (=> res!230949 e!197978)))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278091 (= res!230949 (not (byteRangesEq!0 (select (arr!7909 a2!699) (_3!1086 lt!415763)) (select (arr!7909 a1!699) (_3!1086 lt!415763)) lt!415761 lt!415760)))))

(assert (=> b!278091 (byteRangesEq!0 (select (arr!7909 a1!699) (_3!1086 lt!415763)) (select (arr!7909 a2!699) (_3!1086 lt!415763)) lt!415761 lt!415760)))

(declare-fun b!278092 () Bool)

(assert (=> b!278092 (= e!197978 (or (bvsgt (size!6913 a2!699) (size!6913 a1!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6913 a2!699))))))))

(assert (= (and start!62064 res!230948) b!278088))

(assert (= (and b!278088 res!230947) b!278090))

(assert (= (and b!278090 res!230950) b!278087))

(assert (= (and b!278087 c!12741) b!278089))

(assert (= (and b!278087 (not c!12741)) b!278086))

(assert (= (and b!278087 res!230951) b!278091))

(assert (= (and b!278091 (not res!230949)) b!278092))

(declare-fun m!411193 () Bool)

(assert (=> b!278089 m!411193))

(declare-fun m!411195 () Bool)

(assert (=> b!278089 m!411195))

(declare-fun m!411197 () Bool)

(assert (=> b!278089 m!411197))

(declare-fun m!411199 () Bool)

(assert (=> start!62064 m!411199))

(declare-fun m!411201 () Bool)

(assert (=> start!62064 m!411201))

(declare-fun m!411203 () Bool)

(assert (=> b!278088 m!411203))

(declare-fun m!411205 () Bool)

(assert (=> b!278087 m!411205))

(declare-fun m!411207 () Bool)

(assert (=> b!278091 m!411207))

(declare-fun m!411209 () Bool)

(assert (=> b!278091 m!411209))

(assert (=> b!278091 m!411207))

(assert (=> b!278091 m!411209))

(declare-fun m!411211 () Bool)

(assert (=> b!278091 m!411211))

(assert (=> b!278091 m!411209))

(assert (=> b!278091 m!411207))

(declare-fun m!411213 () Bool)

(assert (=> b!278091 m!411213))

(push 1)

(assert (not b!278088))

(assert (not b!278087))

(assert (not start!62064))

(assert (not b!278091))

(assert (not b!278089))

(check-sat)

(pop 1)

(push 1)

(check-sat)

