; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62220 () Bool)

(assert start!62220)

(declare-fun res!231740 () Bool)

(declare-fun e!198880 () Bool)

(assert (=> start!62220 (=> (not res!231740) (not e!198880))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16099 0))(
  ( (array!16100 (arr!7963 (Array (_ BitVec 32) (_ BitVec 8))) (size!6967 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16099)

(declare-fun a2!699 () array!16099)

(declare-fun to!789 () (_ BitVec 64))

(assert (=> start!62220 (= res!231740 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6967 a1!699) (size!6967 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6967 a1!699))))))))

(assert (=> start!62220 e!198880))

(assert (=> start!62220 true))

(declare-fun array_inv!6691 (array!16099) Bool)

(assert (=> start!62220 (array_inv!6691 a1!699)))

(assert (=> start!62220 (array_inv!6691 a2!699)))

(declare-fun b!279072 () Bool)

(declare-fun e!198881 () Bool)

(assert (=> b!279072 (= e!198880 e!198881)))

(declare-fun res!231738 () Bool)

(assert (=> b!279072 (=> (not res!231738) (not e!198881))))

(declare-datatypes ((tuple4!684 0))(
  ( (tuple4!685 (_1!12417 (_ BitVec 32)) (_2!12417 (_ BitVec 32)) (_3!1122 (_ BitVec 32)) (_4!342 (_ BitVec 32))) )
))
(declare-fun lt!416202 () tuple4!684)

(assert (=> b!279072 (= res!231738 (bvslt (_1!12417 lt!416202) (_2!12417 lt!416202)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!684)

(assert (=> b!279072 (= lt!416202 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!279073 () Bool)

(assert (=> b!279073 (= e!198881 (not true))))

(declare-fun arrayRangesEq!1235 (array!16099 array!16099 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!279073 (arrayRangesEq!1235 a1!699 a2!699 (_1!12417 lt!416202) (_2!12417 lt!416202))))

(declare-fun b!279071 () Bool)

(declare-fun res!231739 () Bool)

(assert (=> b!279071 (=> (not res!231739) (not e!198880))))

(assert (=> b!279071 (= res!231739 (bvslt from!822 to!789))))

(declare-fun b!279070 () Bool)

(declare-fun res!231737 () Bool)

(assert (=> b!279070 (=> (not res!231737) (not e!198880))))

(declare-fun arrayBitRangesEq!0 (array!16099 array!16099 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!279070 (= res!231737 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(assert (= (and start!62220 res!231740) b!279070))

(assert (= (and b!279070 res!231737) b!279071))

(assert (= (and b!279071 res!231739) b!279072))

(assert (= (and b!279072 res!231738) b!279073))

(declare-fun m!412135 () Bool)

(assert (=> start!62220 m!412135))

(declare-fun m!412137 () Bool)

(assert (=> start!62220 m!412137))

(declare-fun m!412139 () Bool)

(assert (=> b!279072 m!412139))

(declare-fun m!412141 () Bool)

(assert (=> b!279073 m!412141))

(declare-fun m!412143 () Bool)

(assert (=> b!279070 m!412143))

(push 1)

(assert (not b!279070))

(assert (not b!279072))

(assert (not start!62220))

(assert (not b!279073))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

