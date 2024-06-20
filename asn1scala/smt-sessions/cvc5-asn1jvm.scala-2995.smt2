; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70204 () Bool)

(assert start!70204)

(declare-fun res!260976 () Bool)

(declare-fun e!228321 () Bool)

(assert (=> start!70204 (=> (not res!260976) (not e!228321))))

(declare-datatypes ((array!19702 0))(
  ( (array!19703 (arr!9658 (Array (_ BitVec 32) (_ BitVec 8))) (size!8572 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19702)

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19702)

(assert (=> start!70204 (= res!260976 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8572 a1!748) (size!8572 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8572 a1!748))))))))

(assert (=> start!70204 e!228321))

(assert (=> start!70204 true))

(declare-fun array_inv!8124 (array!19702) Bool)

(assert (=> start!70204 (array_inv!8124 a2!748)))

(assert (=> start!70204 (array_inv!8124 a1!748)))

(declare-fun b!317896 () Bool)

(declare-fun res!260977 () Bool)

(assert (=> b!317896 (=> (not res!260977) (not e!228321))))

(declare-fun i!999 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19702 array!19702 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317896 (= res!260977 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!317897 () Bool)

(declare-fun res!260979 () Bool)

(assert (=> b!317897 (=> (not res!260979) (not e!228321))))

(assert (=> b!317897 (= res!260979 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!317898 () Bool)

(declare-fun res!260980 () Bool)

(assert (=> b!317898 (=> (not res!260980) (not e!228321))))

(assert (=> b!317898 (= res!260980 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!317899 () Bool)

(declare-fun res!260981 () Bool)

(assert (=> b!317899 (=> (not res!260981) (not e!228321))))

(declare-fun bitAt!0 (array!19702 (_ BitVec 64)) Bool)

(assert (=> b!317899 (= res!260981 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!317900 () Bool)

(declare-fun res!260978 () Bool)

(assert (=> b!317900 (=> (not res!260978) (not e!228321))))

(assert (=> b!317900 (= res!260978 (not (= i!999 from!855)))))

(declare-fun b!317901 () Bool)

(assert (=> b!317901 (= e!228321 (not true))))

(assert (=> b!317901 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-datatypes ((Unit!21815 0))(
  ( (Unit!21816) )
))
(declare-fun lt!443225 () Unit!21815)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19702 array!19702 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21815)

(assert (=> b!317901 (= lt!443225 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(assert (= (and start!70204 res!260976) b!317897))

(assert (= (and b!317897 res!260979) b!317899))

(assert (= (and b!317899 res!260981) b!317898))

(assert (= (and b!317898 res!260980) b!317896))

(assert (= (and b!317896 res!260977) b!317900))

(assert (= (and b!317900 res!260978) b!317901))

(declare-fun m!455891 () Bool)

(assert (=> b!317896 m!455891))

(declare-fun m!455893 () Bool)

(assert (=> b!317901 m!455893))

(declare-fun m!455895 () Bool)

(assert (=> b!317901 m!455895))

(declare-fun m!455897 () Bool)

(assert (=> b!317901 m!455897))

(declare-fun m!455899 () Bool)

(assert (=> b!317899 m!455899))

(declare-fun m!455901 () Bool)

(assert (=> b!317899 m!455901))

(declare-fun m!455903 () Bool)

(assert (=> start!70204 m!455903))

(declare-fun m!455905 () Bool)

(assert (=> start!70204 m!455905))

(declare-fun m!455907 () Bool)

(assert (=> b!317897 m!455907))

(push 1)

(assert (not b!317896))

(assert (not b!317901))

(assert (not b!317897))

(assert (not start!70204))

(assert (not b!317899))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

