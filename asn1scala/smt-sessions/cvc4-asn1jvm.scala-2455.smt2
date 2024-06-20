; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62230 () Bool)

(assert start!62230)

(declare-fun b!279131 () Bool)

(declare-fun res!231798 () Bool)

(declare-fun e!198941 () Bool)

(assert (=> b!279131 (=> (not res!231798) (not e!198941))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!279131 (= res!231798 (bvslt from!822 to!789))))

(declare-fun b!279133 () Bool)

(declare-fun e!198940 () Bool)

(assert (=> b!279133 (= e!198940 (not true))))

(declare-datatypes ((array!16109 0))(
  ( (array!16110 (arr!7968 (Array (_ BitVec 32) (_ BitVec 8))) (size!6972 (_ BitVec 32))) )
))
(declare-fun a2!699 () array!16109)

(declare-fun a1!699 () array!16109)

(declare-datatypes ((tuple4!694 0))(
  ( (tuple4!695 (_1!12422 (_ BitVec 32)) (_2!12422 (_ BitVec 32)) (_3!1127 (_ BitVec 32)) (_4!347 (_ BitVec 32))) )
))
(declare-fun lt!416225 () tuple4!694)

(declare-fun arrayRangesEq!1240 (array!16109 array!16109 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!279133 (arrayRangesEq!1240 a2!699 a1!699 (_1!12422 lt!416225) (_2!12422 lt!416225))))

(declare-datatypes ((Unit!19555 0))(
  ( (Unit!19556) )
))
(declare-fun lt!416226 () Unit!19555)

(declare-fun arrayRangesEqSymmetricLemma!147 (array!16109 array!16109 (_ BitVec 32) (_ BitVec 32)) Unit!19555)

(assert (=> b!279133 (= lt!416226 (arrayRangesEqSymmetricLemma!147 a1!699 a2!699 (_1!12422 lt!416225) (_2!12422 lt!416225)))))

(assert (=> b!279133 (arrayRangesEq!1240 a1!699 a2!699 (_1!12422 lt!416225) (_2!12422 lt!416225))))

(declare-fun b!279132 () Bool)

(assert (=> b!279132 (= e!198941 e!198940)))

(declare-fun res!231797 () Bool)

(assert (=> b!279132 (=> (not res!231797) (not e!198940))))

(assert (=> b!279132 (= res!231797 (bvslt (_1!12422 lt!416225) (_2!12422 lt!416225)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!694)

(assert (=> b!279132 (= lt!416225 (arrayBitIndices!0 from!822 to!789))))

(declare-fun res!231800 () Bool)

(assert (=> start!62230 (=> (not res!231800) (not e!198941))))

(assert (=> start!62230 (= res!231800 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6972 a1!699) (size!6972 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6972 a1!699))))))))

(assert (=> start!62230 e!198941))

(assert (=> start!62230 true))

(declare-fun array_inv!6696 (array!16109) Bool)

(assert (=> start!62230 (array_inv!6696 a1!699)))

(assert (=> start!62230 (array_inv!6696 a2!699)))

(declare-fun b!279130 () Bool)

(declare-fun res!231799 () Bool)

(assert (=> b!279130 (=> (not res!231799) (not e!198941))))

(declare-fun arrayBitRangesEq!0 (array!16109 array!16109 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!279130 (= res!231799 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(assert (= (and start!62230 res!231800) b!279130))

(assert (= (and b!279130 res!231799) b!279131))

(assert (= (and b!279131 res!231798) b!279132))

(assert (= (and b!279132 res!231797) b!279133))

(declare-fun m!412193 () Bool)

(assert (=> b!279133 m!412193))

(declare-fun m!412195 () Bool)

(assert (=> b!279133 m!412195))

(declare-fun m!412197 () Bool)

(assert (=> b!279133 m!412197))

(declare-fun m!412199 () Bool)

(assert (=> b!279132 m!412199))

(declare-fun m!412201 () Bool)

(assert (=> start!62230 m!412201))

(declare-fun m!412203 () Bool)

(assert (=> start!62230 m!412203))

(declare-fun m!412205 () Bool)

(assert (=> b!279130 m!412205))

(push 1)

(assert (not b!279130))

(assert (not b!279132))

(assert (not b!279133))

(assert (not start!62230))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

