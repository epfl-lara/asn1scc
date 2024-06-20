; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70108 () Bool)

(assert start!70108)

(declare-fun b!317086 () Bool)

(declare-fun e!227871 () Bool)

(assert (=> b!317086 (= e!227871 (not true))))

(declare-datatypes ((array!19606 0))(
  ( (array!19607 (arr!9610 (Array (_ BitVec 32) (_ BitVec 8))) (size!8524 (_ BitVec 32))) )
))
(declare-fun a1!748 () array!19606)

(declare-fun i!999 () (_ BitVec 64))

(declare-fun a2!748 () array!19606)

(declare-fun bitAt!0 (array!19606 (_ BitVec 64)) Bool)

(assert (=> b!317086 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(declare-datatypes ((Unit!21761 0))(
  ( (Unit!21762) )
))
(declare-fun lt!443090 () Unit!21761)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19606 array!19606 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21761)

(assert (=> b!317086 (= lt!443090 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun res!260167 () Bool)

(assert (=> start!70108 (=> (not res!260167) (not e!227871))))

(assert (=> start!70108 (= res!260167 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8524 a1!748) (size!8524 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8524 a1!748))))))))

(assert (=> start!70108 e!227871))

(assert (=> start!70108 true))

(declare-fun array_inv!8076 (array!19606) Bool)

(assert (=> start!70108 (array_inv!8076 a2!748)))

(assert (=> start!70108 (array_inv!8076 a1!748)))

(declare-fun b!317087 () Bool)

(declare-fun res!260169 () Bool)

(assert (=> b!317087 (=> (not res!260169) (not e!227871))))

(assert (=> b!317087 (= res!260169 (not (= i!999 from!855)))))

(declare-fun b!317088 () Bool)

(declare-fun res!260166 () Bool)

(assert (=> b!317088 (=> (not res!260166) (not e!227871))))

(assert (=> b!317088 (= res!260166 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!317089 () Bool)

(declare-fun res!260168 () Bool)

(assert (=> b!317089 (=> (not res!260168) (not e!227871))))

(declare-fun arrayBitRangesEq!0 (array!19606 array!19606 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317089 (= res!260168 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!317090 () Bool)

(declare-fun res!260170 () Bool)

(assert (=> b!317090 (=> (not res!260170) (not e!227871))))

(assert (=> b!317090 (= res!260170 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!317091 () Bool)

(declare-fun res!260171 () Bool)

(assert (=> b!317091 (=> (not res!260171) (not e!227871))))

(assert (=> b!317091 (= res!260171 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(assert (= (and start!70108 res!260167) b!317090))

(assert (= (and b!317090 res!260170) b!317088))

(assert (= (and b!317088 res!260166) b!317091))

(assert (= (and b!317091 res!260171) b!317089))

(assert (= (and b!317089 res!260168) b!317087))

(assert (= (and b!317087 res!260169) b!317086))

(declare-fun m!455081 () Bool)

(assert (=> start!70108 m!455081))

(declare-fun m!455083 () Bool)

(assert (=> start!70108 m!455083))

(declare-fun m!455085 () Bool)

(assert (=> b!317088 m!455085))

(declare-fun m!455087 () Bool)

(assert (=> b!317088 m!455087))

(declare-fun m!455089 () Bool)

(assert (=> b!317089 m!455089))

(declare-fun m!455091 () Bool)

(assert (=> b!317086 m!455091))

(declare-fun m!455093 () Bool)

(assert (=> b!317086 m!455093))

(declare-fun m!455095 () Bool)

(assert (=> b!317086 m!455095))

(declare-fun m!455097 () Bool)

(assert (=> b!317090 m!455097))

(push 1)

(assert (not b!317090))

(assert (not start!70108))

(assert (not b!317089))

(assert (not b!317086))

(assert (not b!317088))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

