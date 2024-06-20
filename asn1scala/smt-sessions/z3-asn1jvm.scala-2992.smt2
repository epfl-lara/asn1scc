; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70188 () Bool)

(assert start!70188)

(declare-fun b!317756 () Bool)

(declare-fun res!260838 () Bool)

(declare-fun e!228250 () Bool)

(assert (=> b!317756 (=> (not res!260838) (not e!228250))))

(declare-datatypes ((array!19686 0))(
  ( (array!19687 (arr!9650 (Array (_ BitVec 32) (_ BitVec 8))) (size!8564 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19686)

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19686)

(declare-fun i!999 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19686 array!19686 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317756 (= res!260838 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!317757 () Bool)

(declare-fun res!260837 () Bool)

(assert (=> b!317757 (=> (not res!260837) (not e!228250))))

(declare-fun bitAt!0 (array!19686 (_ BitVec 64)) Bool)

(assert (=> b!317757 (= res!260837 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun res!260836 () Bool)

(assert (=> start!70188 (=> (not res!260836) (not e!228250))))

(declare-fun from!855 () (_ BitVec 64))

(assert (=> start!70188 (= res!260836 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8564 a1!748) (size!8564 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8564 a1!748))))))))

(assert (=> start!70188 e!228250))

(assert (=> start!70188 true))

(declare-fun array_inv!8116 (array!19686) Bool)

(assert (=> start!70188 (array_inv!8116 a2!748)))

(assert (=> start!70188 (array_inv!8116 a1!748)))

(declare-fun b!317758 () Bool)

(declare-fun res!260840 () Bool)

(assert (=> b!317758 (=> (not res!260840) (not e!228250))))

(assert (=> b!317758 (= res!260840 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!317759 () Bool)

(declare-fun res!260839 () Bool)

(assert (=> b!317759 (=> (not res!260839) (not e!228250))))

(assert (=> b!317759 (= res!260839 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!317760 () Bool)

(assert (=> b!317760 (= e!228250 (and (not (= i!999 from!855)) (bvsle to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8564 a1!748)))) (bvsgt from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and start!70188 res!260836) b!317759))

(assert (= (and b!317759 res!260839) b!317757))

(assert (= (and b!317757 res!260837) b!317758))

(assert (= (and b!317758 res!260840) b!317756))

(assert (= (and b!317756 res!260838) b!317760))

(declare-fun m!455759 () Bool)

(assert (=> b!317756 m!455759))

(declare-fun m!455761 () Bool)

(assert (=> b!317757 m!455761))

(declare-fun m!455763 () Bool)

(assert (=> b!317757 m!455763))

(declare-fun m!455765 () Bool)

(assert (=> start!70188 m!455765))

(declare-fun m!455767 () Bool)

(assert (=> start!70188 m!455767))

(declare-fun m!455769 () Bool)

(assert (=> b!317759 m!455769))

(check-sat (not b!317759) (not b!317756) (not b!317757) (not start!70188))
(check-sat)
