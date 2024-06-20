; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62222 () Bool)

(assert start!62222)

(declare-fun b!279083 () Bool)

(declare-fun res!231752 () Bool)

(declare-fun e!198892 () Bool)

(assert (=> b!279083 (=> (not res!231752) (not e!198892))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!279083 (= res!231752 (bvslt from!822 to!789))))

(declare-fun b!279084 () Bool)

(declare-fun e!198891 () Bool)

(assert (=> b!279084 (= e!198892 e!198891)))

(declare-fun res!231750 () Bool)

(assert (=> b!279084 (=> (not res!231750) (not e!198891))))

(declare-datatypes ((tuple4!686 0))(
  ( (tuple4!687 (_1!12418 (_ BitVec 32)) (_2!12418 (_ BitVec 32)) (_3!1123 (_ BitVec 32)) (_4!343 (_ BitVec 32))) )
))
(declare-fun lt!416205 () tuple4!686)

(assert (=> b!279084 (= res!231750 (bvslt (_1!12418 lt!416205) (_2!12418 lt!416205)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!686)

(assert (=> b!279084 (= lt!416205 (arrayBitIndices!0 from!822 to!789))))

(declare-fun res!231749 () Bool)

(assert (=> start!62222 (=> (not res!231749) (not e!198892))))

(declare-datatypes ((array!16101 0))(
  ( (array!16102 (arr!7964 (Array (_ BitVec 32) (_ BitVec 8))) (size!6968 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16101)

(declare-fun a2!699 () array!16101)

(assert (=> start!62222 (= res!231749 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6968 a1!699) (size!6968 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6968 a1!699))))))))

(assert (=> start!62222 e!198892))

(assert (=> start!62222 true))

(declare-fun array_inv!6692 (array!16101) Bool)

(assert (=> start!62222 (array_inv!6692 a1!699)))

(assert (=> start!62222 (array_inv!6692 a2!699)))

(declare-fun b!279085 () Bool)

(assert (=> b!279085 (= e!198891 (not true))))

(declare-fun arrayRangesEq!1236 (array!16101 array!16101 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!279085 (arrayRangesEq!1236 a1!699 a2!699 (_1!12418 lt!416205) (_2!12418 lt!416205))))

(declare-fun b!279082 () Bool)

(declare-fun res!231751 () Bool)

(assert (=> b!279082 (=> (not res!231751) (not e!198892))))

(declare-fun arrayBitRangesEq!0 (array!16101 array!16101 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!279082 (= res!231751 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(assert (= (and start!62222 res!231749) b!279082))

(assert (= (and b!279082 res!231751) b!279083))

(assert (= (and b!279083 res!231752) b!279084))

(assert (= (and b!279084 res!231750) b!279085))

(declare-fun m!412145 () Bool)

(assert (=> b!279084 m!412145))

(declare-fun m!412147 () Bool)

(assert (=> start!62222 m!412147))

(declare-fun m!412149 () Bool)

(assert (=> start!62222 m!412149))

(declare-fun m!412151 () Bool)

(assert (=> b!279085 m!412151))

(declare-fun m!412153 () Bool)

(assert (=> b!279082 m!412153))

(check-sat (not b!279082) (not b!279084) (not start!62222) (not b!279085))
