; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62218 () Bool)

(assert start!62218)

(declare-fun b!279061 () Bool)

(declare-fun e!198869 () Bool)

(assert (=> b!279061 (= e!198869 (not true))))

(declare-datatypes ((array!16097 0))(
  ( (array!16098 (arr!7962 (Array (_ BitVec 32) (_ BitVec 8))) (size!6966 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16097)

(declare-fun a2!699 () array!16097)

(declare-datatypes ((tuple4!682 0))(
  ( (tuple4!683 (_1!12416 (_ BitVec 32)) (_2!12416 (_ BitVec 32)) (_3!1121 (_ BitVec 32)) (_4!341 (_ BitVec 32))) )
))
(declare-fun lt!416199 () tuple4!682)

(declare-fun arrayRangesEq!1234 (array!16097 array!16097 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!279061 (arrayRangesEq!1234 a1!699 a2!699 (_1!12416 lt!416199) (_2!12416 lt!416199))))

(declare-fun res!231728 () Bool)

(declare-fun e!198867 () Bool)

(assert (=> start!62218 (=> (not res!231728) (not e!198867))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> start!62218 (= res!231728 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6966 a1!699) (size!6966 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6966 a1!699))))))))

(assert (=> start!62218 e!198867))

(assert (=> start!62218 true))

(declare-fun array_inv!6690 (array!16097) Bool)

(assert (=> start!62218 (array_inv!6690 a1!699)))

(assert (=> start!62218 (array_inv!6690 a2!699)))

(declare-fun b!279060 () Bool)

(assert (=> b!279060 (= e!198867 e!198869)))

(declare-fun res!231727 () Bool)

(assert (=> b!279060 (=> (not res!231727) (not e!198869))))

(assert (=> b!279060 (= res!231727 (bvslt (_1!12416 lt!416199) (_2!12416 lt!416199)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!682)

(assert (=> b!279060 (= lt!416199 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!279058 () Bool)

(declare-fun res!231726 () Bool)

(assert (=> b!279058 (=> (not res!231726) (not e!198867))))

(declare-fun arrayBitRangesEq!0 (array!16097 array!16097 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!279058 (= res!231726 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!279059 () Bool)

(declare-fun res!231725 () Bool)

(assert (=> b!279059 (=> (not res!231725) (not e!198867))))

(assert (=> b!279059 (= res!231725 (bvslt from!822 to!789))))

(assert (= (and start!62218 res!231728) b!279058))

(assert (= (and b!279058 res!231726) b!279059))

(assert (= (and b!279059 res!231725) b!279060))

(assert (= (and b!279060 res!231727) b!279061))

(declare-fun m!412125 () Bool)

(assert (=> b!279061 m!412125))

(declare-fun m!412127 () Bool)

(assert (=> start!62218 m!412127))

(declare-fun m!412129 () Bool)

(assert (=> start!62218 m!412129))

(declare-fun m!412131 () Bool)

(assert (=> b!279060 m!412131))

(declare-fun m!412133 () Bool)

(assert (=> b!279058 m!412133))

(push 1)

(assert (not start!62218))

(assert (not b!279058))

(assert (not b!279061))

(assert (not b!279060))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

