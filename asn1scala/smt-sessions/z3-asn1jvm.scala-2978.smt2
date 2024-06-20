; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70104 () Bool)

(assert start!70104)

(declare-fun b!317050 () Bool)

(declare-fun res!260133 () Bool)

(declare-fun e!227853 () Bool)

(assert (=> b!317050 (=> (not res!260133) (not e!227853))))

(declare-fun i!999 () (_ BitVec 64))

(declare-fun from!855 () (_ BitVec 64))

(assert (=> b!317050 (= res!260133 (not (= i!999 from!855)))))

(declare-fun b!317051 () Bool)

(declare-fun res!260134 () Bool)

(assert (=> b!317051 (=> (not res!260134) (not e!227853))))

(declare-datatypes ((array!19602 0))(
  ( (array!19603 (arr!9608 (Array (_ BitVec 32) (_ BitVec 8))) (size!8522 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19602)

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19602)

(declare-fun bitAt!0 (array!19602 (_ BitVec 64)) Bool)

(assert (=> b!317051 (= res!260134 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!317053 () Bool)

(assert (=> b!317053 (= e!227853 (not true))))

(assert (=> b!317053 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-datatypes ((Unit!21757 0))(
  ( (Unit!21758) )
))
(declare-fun lt!443084 () Unit!21757)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19602 array!19602 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21757)

(assert (=> b!317053 (= lt!443084 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun b!317054 () Bool)

(declare-fun res!260130 () Bool)

(assert (=> b!317054 (=> (not res!260130) (not e!227853))))

(declare-fun arrayBitRangesEq!0 (array!19602 array!19602 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317054 (= res!260130 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!317055 () Bool)

(declare-fun res!260135 () Bool)

(assert (=> b!317055 (=> (not res!260135) (not e!227853))))

(assert (=> b!317055 (= res!260135 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun res!260132 () Bool)

(assert (=> start!70104 (=> (not res!260132) (not e!227853))))

(assert (=> start!70104 (= res!260132 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8522 a1!748) (size!8522 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8522 a1!748))))))))

(assert (=> start!70104 e!227853))

(assert (=> start!70104 true))

(declare-fun array_inv!8074 (array!19602) Bool)

(assert (=> start!70104 (array_inv!8074 a2!748)))

(assert (=> start!70104 (array_inv!8074 a1!748)))

(declare-fun b!317052 () Bool)

(declare-fun res!260131 () Bool)

(assert (=> b!317052 (=> (not res!260131) (not e!227853))))

(assert (=> b!317052 (= res!260131 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(assert (= (and start!70104 res!260132) b!317054))

(assert (= (and b!317054 res!260130) b!317051))

(assert (= (and b!317051 res!260134) b!317052))

(assert (= (and b!317052 res!260131) b!317055))

(assert (= (and b!317055 res!260135) b!317050))

(assert (= (and b!317050 res!260133) b!317053))

(declare-fun m!455045 () Bool)

(assert (=> start!70104 m!455045))

(declare-fun m!455047 () Bool)

(assert (=> start!70104 m!455047))

(declare-fun m!455049 () Bool)

(assert (=> b!317055 m!455049))

(declare-fun m!455051 () Bool)

(assert (=> b!317051 m!455051))

(declare-fun m!455053 () Bool)

(assert (=> b!317051 m!455053))

(declare-fun m!455055 () Bool)

(assert (=> b!317054 m!455055))

(declare-fun m!455057 () Bool)

(assert (=> b!317053 m!455057))

(declare-fun m!455059 () Bool)

(assert (=> b!317053 m!455059))

(declare-fun m!455061 () Bool)

(assert (=> b!317053 m!455061))

(check-sat (not b!317054) (not b!317051) (not b!317055) (not start!70104) (not b!317053))
