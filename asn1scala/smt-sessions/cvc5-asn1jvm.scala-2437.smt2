; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62070 () Bool)

(assert start!62070)

(declare-fun b!278145 () Bool)

(declare-fun res!230990 () Bool)

(declare-fun e!198027 () Bool)

(assert (=> b!278145 (=> (not res!230990) (not e!198027))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!15991 0))(
  ( (array!15992 (arr!7912 (Array (_ BitVec 32) (_ BitVec 8))) (size!6916 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!15991)

(declare-fun a2!699 () array!15991)

(declare-fun to!789 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!15991 array!15991 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278145 (= res!230990 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!278146 () Bool)

(declare-fun res!230988 () Bool)

(assert (=> b!278146 (=> (not res!230988) (not e!198027))))

(assert (=> b!278146 (= res!230988 (bvslt from!822 to!789))))

(declare-fun b!278147 () Bool)

(declare-datatypes ((Unit!19455 0))(
  ( (Unit!19456) )
))
(declare-fun e!198026 () Unit!19455)

(declare-fun Unit!19457 () Unit!19455)

(assert (=> b!278147 (= e!198026 Unit!19457)))

(declare-fun res!230989 () Bool)

(assert (=> start!62070 (=> (not res!230989) (not e!198027))))

(assert (=> start!62070 (= res!230989 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6916 a1!699) (size!6916 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6916 a1!699))))))))

(assert (=> start!62070 e!198027))

(assert (=> start!62070 true))

(declare-fun array_inv!6640 (array!15991) Bool)

(assert (=> start!62070 (array_inv!6640 a1!699)))

(assert (=> start!62070 (array_inv!6640 a2!699)))

(declare-fun b!278148 () Bool)

(declare-fun Unit!19458 () Unit!19455)

(assert (=> b!278148 (= e!198026 Unit!19458)))

(declare-datatypes ((tuple4!618 0))(
  ( (tuple4!619 (_1!12384 (_ BitVec 32)) (_2!12384 (_ BitVec 32)) (_3!1089 (_ BitVec 32)) (_4!309 (_ BitVec 32))) )
))
(declare-fun lt!415803 () tuple4!618)

(declare-fun arrayRangesEq!1202 (array!15991 array!15991 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278148 (arrayRangesEq!1202 a1!699 a2!699 (_1!12384 lt!415803) (_2!12384 lt!415803))))

(declare-fun lt!415806 () Unit!19455)

(declare-fun arrayRangesEqSymmetricLemma!121 (array!15991 array!15991 (_ BitVec 32) (_ BitVec 32)) Unit!19455)

(assert (=> b!278148 (= lt!415806 (arrayRangesEqSymmetricLemma!121 a1!699 a2!699 (_1!12384 lt!415803) (_2!12384 lt!415803)))))

(assert (=> b!278148 (arrayRangesEq!1202 a2!699 a1!699 (_1!12384 lt!415803) (_2!12384 lt!415803))))

(declare-fun b!278149 () Bool)

(declare-fun lt!415804 () (_ BitVec 32))

(assert (=> b!278149 (= e!198027 (and (not (= (_3!1089 lt!415803) (_4!309 lt!415803))) (or (bvsgt #b00000000000000000000000000000000 lt!415804) (bvsgt lt!415804 #b00000000000000000000000000001000))))))

(declare-fun lt!415805 () Unit!19455)

(assert (=> b!278149 (= lt!415805 e!198026)))

(declare-fun c!12750 () Bool)

(assert (=> b!278149 (= c!12750 (bvslt (_1!12384 lt!415803) (_2!12384 lt!415803)))))

(assert (=> b!278149 (= lt!415804 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!618)

(assert (=> b!278149 (= lt!415803 (arrayBitIndices!0 from!822 to!789))))

(assert (= (and start!62070 res!230989) b!278145))

(assert (= (and b!278145 res!230990) b!278146))

(assert (= (and b!278146 res!230988) b!278149))

(assert (= (and b!278149 c!12750) b!278148))

(assert (= (and b!278149 (not c!12750)) b!278147))

(declare-fun m!411259 () Bool)

(assert (=> b!278145 m!411259))

(declare-fun m!411261 () Bool)

(assert (=> start!62070 m!411261))

(declare-fun m!411263 () Bool)

(assert (=> start!62070 m!411263))

(declare-fun m!411265 () Bool)

(assert (=> b!278148 m!411265))

(declare-fun m!411267 () Bool)

(assert (=> b!278148 m!411267))

(declare-fun m!411269 () Bool)

(assert (=> b!278148 m!411269))

(declare-fun m!411271 () Bool)

(assert (=> b!278149 m!411271))

(push 1)

(assert (not b!278149))

(assert (not b!278145))

(assert (not start!62070))

(assert (not b!278148))

(check-sat)

(pop 1)

(push 1)

(check-sat)

