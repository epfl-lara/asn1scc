; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70222 () Bool)

(assert start!70222)

(declare-fun res!261143 () Bool)

(declare-fun e!228403 () Bool)

(assert (=> start!70222 (=> (not res!261143) (not e!228403))))

(declare-datatypes ((array!19720 0))(
  ( (array!19721 (arr!9667 (Array (_ BitVec 32) (_ BitVec 8))) (size!8581 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19720)

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19720)

(assert (=> start!70222 (= res!261143 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8581 a1!748) (size!8581 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8581 a1!748))))))))

(assert (=> start!70222 e!228403))

(assert (=> start!70222 true))

(declare-fun array_inv!8133 (array!19720) Bool)

(assert (=> start!70222 (array_inv!8133 a2!748)))

(assert (=> start!70222 (array_inv!8133 a1!748)))

(declare-fun b!318058 () Bool)

(declare-fun res!261139 () Bool)

(assert (=> b!318058 (=> (not res!261139) (not e!228403))))

(declare-fun i!999 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19720 array!19720 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318058 (= res!261139 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!318059 () Bool)

(declare-fun res!261141 () Bool)

(assert (=> b!318059 (=> (not res!261141) (not e!228403))))

(assert (=> b!318059 (= res!261141 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!318060 () Bool)

(assert (=> b!318060 (= e!228403 (not true))))

(declare-fun bitAt!0 (array!19720 (_ BitVec 64)) Bool)

(assert (=> b!318060 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-datatypes ((Unit!21833 0))(
  ( (Unit!21834) )
))
(declare-fun lt!443252 () Unit!21833)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19720 array!19720 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21833)

(assert (=> b!318060 (= lt!443252 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun b!318061 () Bool)

(declare-fun res!261140 () Bool)

(assert (=> b!318061 (=> (not res!261140) (not e!228403))))

(assert (=> b!318061 (= res!261140 (not (= i!999 from!855)))))

(declare-fun b!318062 () Bool)

(declare-fun res!261142 () Bool)

(assert (=> b!318062 (=> (not res!261142) (not e!228403))))

(assert (=> b!318062 (= res!261142 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!318063 () Bool)

(declare-fun res!261138 () Bool)

(assert (=> b!318063 (=> (not res!261138) (not e!228403))))

(assert (=> b!318063 (= res!261138 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(assert (= (and start!70222 res!261143) b!318063))

(assert (= (and b!318063 res!261138) b!318062))

(assert (= (and b!318062 res!261142) b!318059))

(assert (= (and b!318059 res!261141) b!318058))

(assert (= (and b!318058 res!261139) b!318061))

(assert (= (and b!318061 res!261140) b!318060))

(declare-fun m!456053 () Bool)

(assert (=> b!318060 m!456053))

(declare-fun m!456055 () Bool)

(assert (=> b!318060 m!456055))

(declare-fun m!456057 () Bool)

(assert (=> b!318060 m!456057))

(declare-fun m!456059 () Bool)

(assert (=> b!318062 m!456059))

(declare-fun m!456061 () Bool)

(assert (=> b!318062 m!456061))

(declare-fun m!456063 () Bool)

(assert (=> b!318058 m!456063))

(declare-fun m!456065 () Bool)

(assert (=> b!318063 m!456065))

(declare-fun m!456067 () Bool)

(assert (=> start!70222 m!456067))

(declare-fun m!456069 () Bool)

(assert (=> start!70222 m!456069))

(push 1)

(assert (not start!70222))

(assert (not b!318063))

(assert (not b!318060))

(assert (not b!318058))

(assert (not b!318062))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

