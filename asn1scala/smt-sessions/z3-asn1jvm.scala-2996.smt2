; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70212 () Bool)

(assert start!70212)

(declare-fun res!261051 () Bool)

(declare-fun e!228356 () Bool)

(assert (=> start!70212 (=> (not res!261051) (not e!228356))))

(declare-datatypes ((array!19710 0))(
  ( (array!19711 (arr!9662 (Array (_ BitVec 32) (_ BitVec 8))) (size!8576 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19710)

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19710)

(assert (=> start!70212 (= res!261051 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8576 a1!748) (size!8576 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8576 a1!748))))))))

(assert (=> start!70212 e!228356))

(assert (=> start!70212 true))

(declare-fun array_inv!8128 (array!19710) Bool)

(assert (=> start!70212 (array_inv!8128 a2!748)))

(assert (=> start!70212 (array_inv!8128 a1!748)))

(declare-fun b!317968 () Bool)

(declare-fun res!261050 () Bool)

(assert (=> b!317968 (=> (not res!261050) (not e!228356))))

(declare-fun i!999 () (_ BitVec 64))

(assert (=> b!317968 (= res!261050 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!317969 () Bool)

(declare-fun res!261048 () Bool)

(assert (=> b!317969 (=> (not res!261048) (not e!228356))))

(declare-fun arrayBitRangesEq!0 (array!19710 array!19710 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317969 (= res!261048 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!317970 () Bool)

(declare-fun res!261049 () Bool)

(assert (=> b!317970 (=> (not res!261049) (not e!228356))))

(assert (=> b!317970 (= res!261049 (not (= i!999 from!855)))))

(declare-fun b!317971 () Bool)

(declare-fun res!261052 () Bool)

(assert (=> b!317971 (=> (not res!261052) (not e!228356))))

(declare-fun bitAt!0 (array!19710 (_ BitVec 64)) Bool)

(assert (=> b!317971 (= res!261052 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!317972 () Bool)

(assert (=> b!317972 (= e!228356 (not true))))

(assert (=> b!317972 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-datatypes ((Unit!21823 0))(
  ( (Unit!21824) )
))
(declare-fun lt!443237 () Unit!21823)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19710 array!19710 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21823)

(assert (=> b!317972 (= lt!443237 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun b!317973 () Bool)

(declare-fun res!261053 () Bool)

(assert (=> b!317973 (=> (not res!261053) (not e!228356))))

(assert (=> b!317973 (= res!261053 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(assert (= (and start!70212 res!261051) b!317969))

(assert (= (and b!317969 res!261048) b!317971))

(assert (= (and b!317971 res!261052) b!317968))

(assert (= (and b!317968 res!261050) b!317973))

(assert (= (and b!317973 res!261053) b!317970))

(assert (= (and b!317970 res!261049) b!317972))

(declare-fun m!455963 () Bool)

(assert (=> start!70212 m!455963))

(declare-fun m!455965 () Bool)

(assert (=> start!70212 m!455965))

(declare-fun m!455967 () Bool)

(assert (=> b!317972 m!455967))

(declare-fun m!455969 () Bool)

(assert (=> b!317972 m!455969))

(declare-fun m!455971 () Bool)

(assert (=> b!317972 m!455971))

(declare-fun m!455973 () Bool)

(assert (=> b!317971 m!455973))

(declare-fun m!455975 () Bool)

(assert (=> b!317971 m!455975))

(declare-fun m!455977 () Bool)

(assert (=> b!317973 m!455977))

(declare-fun m!455979 () Bool)

(assert (=> b!317969 m!455979))

(check-sat (not b!317973) (not b!317972) (not b!317971) (not b!317969) (not start!70212))
