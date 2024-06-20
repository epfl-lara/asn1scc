; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62226 () Bool)

(assert start!62226)

(declare-fun res!231774 () Bool)

(declare-fun e!198918 () Bool)

(assert (=> start!62226 (=> (not res!231774) (not e!198918))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16105 0))(
  ( (array!16106 (arr!7966 (Array (_ BitVec 32) (_ BitVec 8))) (size!6970 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16105)

(declare-fun a2!699 () array!16105)

(declare-fun to!789 () (_ BitVec 64))

(assert (=> start!62226 (= res!231774 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6970 a1!699) (size!6970 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6970 a1!699))))))))

(assert (=> start!62226 e!198918))

(assert (=> start!62226 true))

(declare-fun array_inv!6694 (array!16105) Bool)

(assert (=> start!62226 (array_inv!6694 a1!699)))

(assert (=> start!62226 (array_inv!6694 a2!699)))

(declare-fun b!279109 () Bool)

(declare-fun e!198916 () Bool)

(assert (=> b!279109 (= e!198916 (not true))))

(declare-datatypes ((tuple4!690 0))(
  ( (tuple4!691 (_1!12420 (_ BitVec 32)) (_2!12420 (_ BitVec 32)) (_3!1125 (_ BitVec 32)) (_4!345 (_ BitVec 32))) )
))
(declare-fun lt!416213 () tuple4!690)

(declare-fun arrayRangesEq!1238 (array!16105 array!16105 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!279109 (arrayRangesEq!1238 a2!699 a1!699 (_1!12420 lt!416213) (_2!12420 lt!416213))))

(declare-datatypes ((Unit!19551 0))(
  ( (Unit!19552) )
))
(declare-fun lt!416214 () Unit!19551)

(declare-fun arrayRangesEqSymmetricLemma!145 (array!16105 array!16105 (_ BitVec 32) (_ BitVec 32)) Unit!19551)

(assert (=> b!279109 (= lt!416214 (arrayRangesEqSymmetricLemma!145 a1!699 a2!699 (_1!12420 lt!416213) (_2!12420 lt!416213)))))

(assert (=> b!279109 (arrayRangesEq!1238 a1!699 a2!699 (_1!12420 lt!416213) (_2!12420 lt!416213))))

(declare-fun b!279106 () Bool)

(declare-fun res!231775 () Bool)

(assert (=> b!279106 (=> (not res!231775) (not e!198918))))

(declare-fun arrayBitRangesEq!0 (array!16105 array!16105 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!279106 (= res!231775 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!279107 () Bool)

(declare-fun res!231773 () Bool)

(assert (=> b!279107 (=> (not res!231773) (not e!198918))))

(assert (=> b!279107 (= res!231773 (bvslt from!822 to!789))))

(declare-fun b!279108 () Bool)

(assert (=> b!279108 (= e!198918 e!198916)))

(declare-fun res!231776 () Bool)

(assert (=> b!279108 (=> (not res!231776) (not e!198916))))

(assert (=> b!279108 (= res!231776 (bvslt (_1!12420 lt!416213) (_2!12420 lt!416213)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!690)

(assert (=> b!279108 (= lt!416213 (arrayBitIndices!0 from!822 to!789))))

(assert (= (and start!62226 res!231774) b!279106))

(assert (= (and b!279106 res!231775) b!279107))

(assert (= (and b!279107 res!231773) b!279108))

(assert (= (and b!279108 res!231776) b!279109))

(declare-fun m!412165 () Bool)

(assert (=> start!62226 m!412165))

(declare-fun m!412167 () Bool)

(assert (=> start!62226 m!412167))

(declare-fun m!412169 () Bool)

(assert (=> b!279109 m!412169))

(declare-fun m!412171 () Bool)

(assert (=> b!279109 m!412171))

(declare-fun m!412173 () Bool)

(assert (=> b!279109 m!412173))

(declare-fun m!412175 () Bool)

(assert (=> b!279106 m!412175))

(declare-fun m!412177 () Bool)

(assert (=> b!279108 m!412177))

(push 1)

(assert (not b!279108))

(assert (not start!62226))

(assert (not b!279109))

(assert (not b!279106))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

