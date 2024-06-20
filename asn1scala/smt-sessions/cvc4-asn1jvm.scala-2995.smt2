; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70208 () Bool)

(assert start!70208)

(declare-fun b!317932 () Bool)

(declare-fun res!261016 () Bool)

(declare-fun e!228339 () Bool)

(assert (=> b!317932 (=> (not res!261016) (not e!228339))))

(declare-datatypes ((array!19706 0))(
  ( (array!19707 (arr!9660 (Array (_ BitVec 32) (_ BitVec 8))) (size!8574 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19706)

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19706)

(declare-fun bitAt!0 (array!19706 (_ BitVec 64)) Bool)

(assert (=> b!317932 (= res!261016 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!317933 () Bool)

(assert (=> b!317933 (= e!228339 (not true))))

(declare-fun i!999 () (_ BitVec 64))

(assert (=> b!317933 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-datatypes ((Unit!21819 0))(
  ( (Unit!21820) )
))
(declare-fun lt!443231 () Unit!21819)

(declare-fun from!855 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19706 array!19706 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21819)

(assert (=> b!317933 (= lt!443231 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun b!317934 () Bool)

(declare-fun res!261013 () Bool)

(assert (=> b!317934 (=> (not res!261013) (not e!228339))))

(declare-fun arrayBitRangesEq!0 (array!19706 array!19706 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317934 (= res!261013 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!317935 () Bool)

(declare-fun res!261012 () Bool)

(assert (=> b!317935 (=> (not res!261012) (not e!228339))))

(assert (=> b!317935 (= res!261012 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun res!261014 () Bool)

(assert (=> start!70208 (=> (not res!261014) (not e!228339))))

(assert (=> start!70208 (= res!261014 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8574 a1!748) (size!8574 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8574 a1!748))))))))

(assert (=> start!70208 e!228339))

(assert (=> start!70208 true))

(declare-fun array_inv!8126 (array!19706) Bool)

(assert (=> start!70208 (array_inv!8126 a2!748)))

(assert (=> start!70208 (array_inv!8126 a1!748)))

(declare-fun b!317936 () Bool)

(declare-fun res!261015 () Bool)

(assert (=> b!317936 (=> (not res!261015) (not e!228339))))

(assert (=> b!317936 (= res!261015 (not (= i!999 from!855)))))

(declare-fun b!317937 () Bool)

(declare-fun res!261017 () Bool)

(assert (=> b!317937 (=> (not res!261017) (not e!228339))))

(assert (=> b!317937 (= res!261017 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(assert (= (and start!70208 res!261014) b!317935))

(assert (= (and b!317935 res!261012) b!317932))

(assert (= (and b!317932 res!261016) b!317937))

(assert (= (and b!317937 res!261017) b!317934))

(assert (= (and b!317934 res!261013) b!317936))

(assert (= (and b!317936 res!261015) b!317933))

(declare-fun m!455927 () Bool)

(assert (=> b!317935 m!455927))

(declare-fun m!455929 () Bool)

(assert (=> b!317932 m!455929))

(declare-fun m!455931 () Bool)

(assert (=> b!317932 m!455931))

(declare-fun m!455933 () Bool)

(assert (=> b!317934 m!455933))

(declare-fun m!455935 () Bool)

(assert (=> b!317933 m!455935))

(declare-fun m!455937 () Bool)

(assert (=> b!317933 m!455937))

(declare-fun m!455939 () Bool)

(assert (=> b!317933 m!455939))

(declare-fun m!455941 () Bool)

(assert (=> start!70208 m!455941))

(declare-fun m!455943 () Bool)

(assert (=> start!70208 m!455943))

(push 1)

(assert (not b!317934))

(assert (not start!70208))

(assert (not b!317932))

(assert (not b!317933))

(assert (not b!317935))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

