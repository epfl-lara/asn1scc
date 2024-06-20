; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70206 () Bool)

(assert start!70206)

(declare-fun b!317914 () Bool)

(declare-fun res!260998 () Bool)

(declare-fun e!228331 () Bool)

(assert (=> b!317914 (=> (not res!260998) (not e!228331))))

(declare-datatypes ((array!19704 0))(
  ( (array!19705 (arr!9659 (Array (_ BitVec 32) (_ BitVec 8))) (size!8573 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19704)

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19704)

(declare-fun arrayBitRangesEq!0 (array!19704 array!19704 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317914 (= res!260998 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun res!260996 () Bool)

(assert (=> start!70206 (=> (not res!260996) (not e!228331))))

(assert (=> start!70206 (= res!260996 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8573 a1!748) (size!8573 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8573 a1!748))))))))

(assert (=> start!70206 e!228331))

(assert (=> start!70206 true))

(declare-fun array_inv!8125 (array!19704) Bool)

(assert (=> start!70206 (array_inv!8125 a2!748)))

(assert (=> start!70206 (array_inv!8125 a1!748)))

(declare-fun b!317915 () Bool)

(declare-fun res!260997 () Bool)

(assert (=> b!317915 (=> (not res!260997) (not e!228331))))

(declare-fun i!999 () (_ BitVec 64))

(assert (=> b!317915 (= res!260997 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!317916 () Bool)

(declare-fun res!260995 () Bool)

(assert (=> b!317916 (=> (not res!260995) (not e!228331))))

(declare-fun bitAt!0 (array!19704 (_ BitVec 64)) Bool)

(assert (=> b!317916 (= res!260995 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!317917 () Bool)

(assert (=> b!317917 (= e!228331 (not true))))

(assert (=> b!317917 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-datatypes ((Unit!21817 0))(
  ( (Unit!21818) )
))
(declare-fun lt!443228 () Unit!21817)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19704 array!19704 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21817)

(assert (=> b!317917 (= lt!443228 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun b!317918 () Bool)

(declare-fun res!260999 () Bool)

(assert (=> b!317918 (=> (not res!260999) (not e!228331))))

(assert (=> b!317918 (= res!260999 (not (= i!999 from!855)))))

(declare-fun b!317919 () Bool)

(declare-fun res!260994 () Bool)

(assert (=> b!317919 (=> (not res!260994) (not e!228331))))

(assert (=> b!317919 (= res!260994 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(assert (= (and start!70206 res!260996) b!317914))

(assert (= (and b!317914 res!260998) b!317916))

(assert (= (and b!317916 res!260995) b!317915))

(assert (= (and b!317915 res!260997) b!317919))

(assert (= (and b!317919 res!260994) b!317918))

(assert (= (and b!317918 res!260999) b!317917))

(declare-fun m!455909 () Bool)

(assert (=> b!317919 m!455909))

(declare-fun m!455911 () Bool)

(assert (=> b!317916 m!455911))

(declare-fun m!455913 () Bool)

(assert (=> b!317916 m!455913))

(declare-fun m!455915 () Bool)

(assert (=> start!70206 m!455915))

(declare-fun m!455917 () Bool)

(assert (=> start!70206 m!455917))

(declare-fun m!455919 () Bool)

(assert (=> b!317914 m!455919))

(declare-fun m!455921 () Bool)

(assert (=> b!317917 m!455921))

(declare-fun m!455923 () Bool)

(assert (=> b!317917 m!455923))

(declare-fun m!455925 () Bool)

(assert (=> b!317917 m!455925))

(check-sat (not b!317916) (not b!317914) (not b!317917) (not b!317919) (not start!70206))
