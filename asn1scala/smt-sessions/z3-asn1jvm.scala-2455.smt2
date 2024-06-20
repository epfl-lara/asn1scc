; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62228 () Bool)

(assert start!62228)

(declare-fun b!279118 () Bool)

(declare-fun res!231786 () Bool)

(declare-fun e!198929 () Bool)

(assert (=> b!279118 (=> (not res!231786) (not e!198929))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16107 0))(
  ( (array!16108 (arr!7967 (Array (_ BitVec 32) (_ BitVec 8))) (size!6971 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16107)

(declare-fun a2!699 () array!16107)

(declare-fun to!789 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!16107 array!16107 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!279118 (= res!231786 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!279120 () Bool)

(declare-fun e!198927 () Bool)

(assert (=> b!279120 (= e!198929 e!198927)))

(declare-fun res!231788 () Bool)

(assert (=> b!279120 (=> (not res!231788) (not e!198927))))

(declare-datatypes ((tuple4!692 0))(
  ( (tuple4!693 (_1!12421 (_ BitVec 32)) (_2!12421 (_ BitVec 32)) (_3!1126 (_ BitVec 32)) (_4!346 (_ BitVec 32))) )
))
(declare-fun lt!416220 () tuple4!692)

(assert (=> b!279120 (= res!231788 (bvslt (_1!12421 lt!416220) (_2!12421 lt!416220)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!692)

(assert (=> b!279120 (= lt!416220 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!279119 () Bool)

(declare-fun res!231787 () Bool)

(assert (=> b!279119 (=> (not res!231787) (not e!198929))))

(assert (=> b!279119 (= res!231787 (bvslt from!822 to!789))))

(declare-fun res!231785 () Bool)

(assert (=> start!62228 (=> (not res!231785) (not e!198929))))

(assert (=> start!62228 (= res!231785 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6971 a1!699) (size!6971 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6971 a1!699))))))))

(assert (=> start!62228 e!198929))

(assert (=> start!62228 true))

(declare-fun array_inv!6695 (array!16107) Bool)

(assert (=> start!62228 (array_inv!6695 a1!699)))

(assert (=> start!62228 (array_inv!6695 a2!699)))

(declare-fun b!279121 () Bool)

(assert (=> b!279121 (= e!198927 (not true))))

(declare-fun arrayRangesEq!1239 (array!16107 array!16107 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!279121 (arrayRangesEq!1239 a2!699 a1!699 (_1!12421 lt!416220) (_2!12421 lt!416220))))

(declare-datatypes ((Unit!19553 0))(
  ( (Unit!19554) )
))
(declare-fun lt!416219 () Unit!19553)

(declare-fun arrayRangesEqSymmetricLemma!146 (array!16107 array!16107 (_ BitVec 32) (_ BitVec 32)) Unit!19553)

(assert (=> b!279121 (= lt!416219 (arrayRangesEqSymmetricLemma!146 a1!699 a2!699 (_1!12421 lt!416220) (_2!12421 lt!416220)))))

(assert (=> b!279121 (arrayRangesEq!1239 a1!699 a2!699 (_1!12421 lt!416220) (_2!12421 lt!416220))))

(assert (= (and start!62228 res!231785) b!279118))

(assert (= (and b!279118 res!231786) b!279119))

(assert (= (and b!279119 res!231787) b!279120))

(assert (= (and b!279120 res!231788) b!279121))

(declare-fun m!412179 () Bool)

(assert (=> b!279118 m!412179))

(declare-fun m!412181 () Bool)

(assert (=> b!279120 m!412181))

(declare-fun m!412183 () Bool)

(assert (=> start!62228 m!412183))

(declare-fun m!412185 () Bool)

(assert (=> start!62228 m!412185))

(declare-fun m!412187 () Bool)

(assert (=> b!279121 m!412187))

(declare-fun m!412189 () Bool)

(assert (=> b!279121 m!412189))

(declare-fun m!412191 () Bool)

(assert (=> b!279121 m!412191))

(check-sat (not start!62228) (not b!279118) (not b!279121) (not b!279120))
