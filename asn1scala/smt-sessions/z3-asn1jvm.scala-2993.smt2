; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70194 () Bool)

(assert start!70194)

(declare-fun b!317806 () Bool)

(declare-fun res!260886 () Bool)

(declare-fun e!228275 () Bool)

(assert (=> b!317806 (=> (not res!260886) (not e!228275))))

(declare-fun i!999 () (_ BitVec 64))

(declare-datatypes ((array!19692 0))(
  ( (array!19693 (arr!9653 (Array (_ BitVec 32) (_ BitVec 8))) (size!8567 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19692)

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19692)

(declare-fun arrayBitRangesEq!0 (array!19692 array!19692 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317806 (= res!260886 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun res!260888 () Bool)

(assert (=> start!70194 (=> (not res!260888) (not e!228275))))

(declare-fun from!855 () (_ BitVec 64))

(assert (=> start!70194 (= res!260888 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8567 a1!748) (size!8567 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8567 a1!748))))))))

(assert (=> start!70194 e!228275))

(assert (=> start!70194 true))

(declare-fun array_inv!8119 (array!19692) Bool)

(assert (=> start!70194 (array_inv!8119 a2!748)))

(assert (=> start!70194 (array_inv!8119 a1!748)))

(declare-fun b!317807 () Bool)

(declare-fun res!260890 () Bool)

(assert (=> b!317807 (=> (not res!260890) (not e!228275))))

(assert (=> b!317807 (= res!260890 (not (= i!999 from!855)))))

(declare-fun b!317808 () Bool)

(declare-fun res!260889 () Bool)

(assert (=> b!317808 (=> (not res!260889) (not e!228275))))

(declare-fun bitAt!0 (array!19692 (_ BitVec 64)) Bool)

(assert (=> b!317808 (= res!260889 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!317809 () Bool)

(declare-fun res!260891 () Bool)

(assert (=> b!317809 (=> (not res!260891) (not e!228275))))

(assert (=> b!317809 (= res!260891 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!317810 () Bool)

(assert (=> b!317810 (= e!228275 (not (or (not (= (bvand to!822 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!822 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!317810 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-datatypes ((Unit!21805 0))(
  ( (Unit!21806) )
))
(declare-fun lt!443210 () Unit!21805)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19692 array!19692 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21805)

(assert (=> b!317810 (= lt!443210 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun b!317811 () Bool)

(declare-fun res!260887 () Bool)

(assert (=> b!317811 (=> (not res!260887) (not e!228275))))

(assert (=> b!317811 (= res!260887 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(assert (= (and start!70194 res!260888) b!317809))

(assert (= (and b!317809 res!260891) b!317808))

(assert (= (and b!317808 res!260889) b!317811))

(assert (= (and b!317811 res!260887) b!317806))

(assert (= (and b!317806 res!260886) b!317807))

(assert (= (and b!317807 res!260890) b!317810))

(declare-fun m!455801 () Bool)

(assert (=> start!70194 m!455801))

(declare-fun m!455803 () Bool)

(assert (=> start!70194 m!455803))

(declare-fun m!455805 () Bool)

(assert (=> b!317806 m!455805))

(declare-fun m!455807 () Bool)

(assert (=> b!317809 m!455807))

(declare-fun m!455809 () Bool)

(assert (=> b!317810 m!455809))

(declare-fun m!455811 () Bool)

(assert (=> b!317810 m!455811))

(declare-fun m!455813 () Bool)

(assert (=> b!317810 m!455813))

(declare-fun m!455815 () Bool)

(assert (=> b!317808 m!455815))

(declare-fun m!455817 () Bool)

(assert (=> b!317808 m!455817))

(check-sat (not b!317806) (not start!70194) (not b!317810) (not b!317809) (not b!317808))
(check-sat)
