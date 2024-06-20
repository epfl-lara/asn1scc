; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70102 () Bool)

(assert start!70102)

(declare-fun b!317032 () Bool)

(declare-fun res!260116 () Bool)

(declare-fun e!227845 () Bool)

(assert (=> b!317032 (=> (not res!260116) (not e!227845))))

(declare-datatypes ((array!19600 0))(
  ( (array!19601 (arr!9607 (Array (_ BitVec 32) (_ BitVec 8))) (size!8521 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19600)

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19600)

(declare-fun arrayBitRangesEq!0 (array!19600 array!19600 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317032 (= res!260116 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!317033 () Bool)

(declare-fun res!260115 () Bool)

(assert (=> b!317033 (=> (not res!260115) (not e!227845))))

(declare-fun i!999 () (_ BitVec 64))

(assert (=> b!317033 (= res!260115 (not (= i!999 from!855)))))

(declare-fun b!317034 () Bool)

(declare-fun res!260112 () Bool)

(assert (=> b!317034 (=> (not res!260112) (not e!227845))))

(assert (=> b!317034 (= res!260112 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun res!260117 () Bool)

(assert (=> start!70102 (=> (not res!260117) (not e!227845))))

(assert (=> start!70102 (= res!260117 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8521 a1!748) (size!8521 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8521 a1!748))))))))

(assert (=> start!70102 e!227845))

(assert (=> start!70102 true))

(declare-fun array_inv!8073 (array!19600) Bool)

(assert (=> start!70102 (array_inv!8073 a2!748)))

(assert (=> start!70102 (array_inv!8073 a1!748)))

(declare-fun b!317035 () Bool)

(declare-fun res!260114 () Bool)

(assert (=> b!317035 (=> (not res!260114) (not e!227845))))

(assert (=> b!317035 (= res!260114 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!317036 () Bool)

(declare-fun res!260113 () Bool)

(assert (=> b!317036 (=> (not res!260113) (not e!227845))))

(declare-fun bitAt!0 (array!19600 (_ BitVec 64)) Bool)

(assert (=> b!317036 (= res!260113 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!317037 () Bool)

(assert (=> b!317037 (= e!227845 (not true))))

(assert (=> b!317037 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-datatypes ((Unit!21755 0))(
  ( (Unit!21756) )
))
(declare-fun lt!443081 () Unit!21755)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19600 array!19600 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21755)

(assert (=> b!317037 (= lt!443081 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(assert (= (and start!70102 res!260117) b!317032))

(assert (= (and b!317032 res!260116) b!317036))

(assert (= (and b!317036 res!260113) b!317035))

(assert (= (and b!317035 res!260114) b!317034))

(assert (= (and b!317034 res!260112) b!317033))

(assert (= (and b!317033 res!260115) b!317037))

(declare-fun m!455027 () Bool)

(assert (=> b!317034 m!455027))

(declare-fun m!455029 () Bool)

(assert (=> b!317036 m!455029))

(declare-fun m!455031 () Bool)

(assert (=> b!317036 m!455031))

(declare-fun m!455033 () Bool)

(assert (=> b!317032 m!455033))

(declare-fun m!455035 () Bool)

(assert (=> b!317037 m!455035))

(declare-fun m!455037 () Bool)

(assert (=> b!317037 m!455037))

(declare-fun m!455039 () Bool)

(assert (=> b!317037 m!455039))

(declare-fun m!455041 () Bool)

(assert (=> start!70102 m!455041))

(declare-fun m!455043 () Bool)

(assert (=> start!70102 m!455043))

(push 1)

(assert (not b!317032))

(assert (not start!70102))

(assert (not b!317037))

(assert (not b!317036))

(assert (not b!317034))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

