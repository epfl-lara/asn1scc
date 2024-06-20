; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70210 () Bool)

(assert start!70210)

(declare-fun b!317950 () Bool)

(declare-fun e!228347 () Bool)

(assert (=> b!317950 (= e!228347 (not true))))

(declare-datatypes ((array!19708 0))(
  ( (array!19709 (arr!9661 (Array (_ BitVec 32) (_ BitVec 8))) (size!8575 (_ BitVec 32))) )
))
(declare-fun a1!748 () array!19708)

(declare-fun i!999 () (_ BitVec 64))

(declare-fun a2!748 () array!19708)

(declare-fun bitAt!0 (array!19708 (_ BitVec 64)) Bool)

(assert (=> b!317950 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-datatypes ((Unit!21821 0))(
  ( (Unit!21822) )
))
(declare-fun lt!443234 () Unit!21821)

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19708 array!19708 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21821)

(assert (=> b!317950 (= lt!443234 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun b!317951 () Bool)

(declare-fun res!261034 () Bool)

(assert (=> b!317951 (=> (not res!261034) (not e!228347))))

(assert (=> b!317951 (= res!261034 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!317952 () Bool)

(declare-fun res!261031 () Bool)

(assert (=> b!317952 (=> (not res!261031) (not e!228347))))

(declare-fun arrayBitRangesEq!0 (array!19708 array!19708 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317952 (= res!261031 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun res!261032 () Bool)

(assert (=> start!70210 (=> (not res!261032) (not e!228347))))

(assert (=> start!70210 (= res!261032 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8575 a1!748) (size!8575 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8575 a1!748))))))))

(assert (=> start!70210 e!228347))

(assert (=> start!70210 true))

(declare-fun array_inv!8127 (array!19708) Bool)

(assert (=> start!70210 (array_inv!8127 a2!748)))

(assert (=> start!70210 (array_inv!8127 a1!748)))

(declare-fun b!317953 () Bool)

(declare-fun res!261033 () Bool)

(assert (=> b!317953 (=> (not res!261033) (not e!228347))))

(assert (=> b!317953 (= res!261033 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!317954 () Bool)

(declare-fun res!261030 () Bool)

(assert (=> b!317954 (=> (not res!261030) (not e!228347))))

(assert (=> b!317954 (= res!261030 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!317955 () Bool)

(declare-fun res!261035 () Bool)

(assert (=> b!317955 (=> (not res!261035) (not e!228347))))

(assert (=> b!317955 (= res!261035 (not (= i!999 from!855)))))

(assert (= (and start!70210 res!261032) b!317952))

(assert (= (and b!317952 res!261031) b!317954))

(assert (= (and b!317954 res!261030) b!317951))

(assert (= (and b!317951 res!261034) b!317953))

(assert (= (and b!317953 res!261033) b!317955))

(assert (= (and b!317955 res!261035) b!317950))

(declare-fun m!455945 () Bool)

(assert (=> start!70210 m!455945))

(declare-fun m!455947 () Bool)

(assert (=> start!70210 m!455947))

(declare-fun m!455949 () Bool)

(assert (=> b!317950 m!455949))

(declare-fun m!455951 () Bool)

(assert (=> b!317950 m!455951))

(declare-fun m!455953 () Bool)

(assert (=> b!317950 m!455953))

(declare-fun m!455955 () Bool)

(assert (=> b!317954 m!455955))

(declare-fun m!455957 () Bool)

(assert (=> b!317954 m!455957))

(declare-fun m!455959 () Bool)

(assert (=> b!317953 m!455959))

(declare-fun m!455961 () Bool)

(assert (=> b!317952 m!455961))

(push 1)

(assert (not b!317953))

(assert (not b!317950))

(assert (not b!317954))

(assert (not b!317952))

(assert (not start!70210))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

