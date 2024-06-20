; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70098 () Bool)

(assert start!70098)

(declare-fun b!316996 () Bool)

(declare-fun res!260079 () Bool)

(declare-fun e!227826 () Bool)

(assert (=> b!316996 (=> (not res!260079) (not e!227826))))

(declare-fun i!999 () (_ BitVec 64))

(declare-fun from!855 () (_ BitVec 64))

(assert (=> b!316996 (= res!260079 (not (= i!999 from!855)))))

(declare-fun b!316997 () Bool)

(declare-fun res!260080 () Bool)

(assert (=> b!316997 (=> (not res!260080) (not e!227826))))

(declare-datatypes ((array!19596 0))(
  ( (array!19597 (arr!9605 (Array (_ BitVec 32) (_ BitVec 8))) (size!8519 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19596)

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19596)

(declare-fun arrayBitRangesEq!0 (array!19596 array!19596 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316997 (= res!260080 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!316998 () Bool)

(declare-fun res!260078 () Bool)

(assert (=> b!316998 (=> (not res!260078) (not e!227826))))

(assert (=> b!316998 (= res!260078 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!316999 () Bool)

(declare-fun res!260077 () Bool)

(assert (=> b!316999 (=> (not res!260077) (not e!227826))))

(assert (=> b!316999 (= res!260077 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun res!260081 () Bool)

(assert (=> start!70098 (=> (not res!260081) (not e!227826))))

(assert (=> start!70098 (= res!260081 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8519 a1!748) (size!8519 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8519 a1!748))))))))

(assert (=> start!70098 e!227826))

(assert (=> start!70098 true))

(declare-fun array_inv!8071 (array!19596) Bool)

(assert (=> start!70098 (array_inv!8071 a2!748)))

(assert (=> start!70098 (array_inv!8071 a1!748)))

(declare-fun b!317000 () Bool)

(assert (=> b!317000 (= e!227826 (not true))))

(declare-fun bitAt!0 (array!19596 (_ BitVec 64)) Bool)

(assert (=> b!317000 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-datatypes ((Unit!21751 0))(
  ( (Unit!21752) )
))
(declare-fun lt!443075 () Unit!21751)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19596 array!19596 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21751)

(assert (=> b!317000 (= lt!443075 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun b!317001 () Bool)

(declare-fun res!260076 () Bool)

(assert (=> b!317001 (=> (not res!260076) (not e!227826))))

(assert (=> b!317001 (= res!260076 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(assert (= (and start!70098 res!260081) b!316998))

(assert (= (and b!316998 res!260078) b!317001))

(assert (= (and b!317001 res!260076) b!316999))

(assert (= (and b!316999 res!260077) b!316997))

(assert (= (and b!316997 res!260080) b!316996))

(assert (= (and b!316996 res!260079) b!317000))

(declare-fun m!454991 () Bool)

(assert (=> b!316998 m!454991))

(declare-fun m!454993 () Bool)

(assert (=> b!317000 m!454993))

(declare-fun m!454995 () Bool)

(assert (=> b!317000 m!454995))

(declare-fun m!454997 () Bool)

(assert (=> b!317000 m!454997))

(declare-fun m!454999 () Bool)

(assert (=> b!317001 m!454999))

(declare-fun m!455001 () Bool)

(assert (=> b!317001 m!455001))

(declare-fun m!455003 () Bool)

(assert (=> start!70098 m!455003))

(declare-fun m!455005 () Bool)

(assert (=> start!70098 m!455005))

(declare-fun m!455007 () Bool)

(assert (=> b!316997 m!455007))

(check-sat (not b!316998) (not b!317001) (not b!317000) (not b!316997) (not start!70098))
