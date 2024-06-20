; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70106 () Bool)

(assert start!70106)

(declare-fun b!317068 () Bool)

(declare-fun res!260152 () Bool)

(declare-fun e!227861 () Bool)

(assert (=> b!317068 (=> (not res!260152) (not e!227861))))

(declare-fun i!999 () (_ BitVec 64))

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(assert (=> b!317068 (= res!260152 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!317069 () Bool)

(declare-fun res!260149 () Bool)

(assert (=> b!317069 (=> (not res!260149) (not e!227861))))

(declare-datatypes ((array!19604 0))(
  ( (array!19605 (arr!9609 (Array (_ BitVec 32) (_ BitVec 8))) (size!8523 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19604)

(declare-fun a1!748 () array!19604)

(declare-fun bitAt!0 (array!19604 (_ BitVec 64)) Bool)

(assert (=> b!317069 (= res!260149 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!317070 () Bool)

(assert (=> b!317070 (= e!227861 (not true))))

(assert (=> b!317070 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-datatypes ((Unit!21759 0))(
  ( (Unit!21760) )
))
(declare-fun lt!443087 () Unit!21759)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19604 array!19604 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21759)

(assert (=> b!317070 (= lt!443087 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun b!317071 () Bool)

(declare-fun res!260151 () Bool)

(assert (=> b!317071 (=> (not res!260151) (not e!227861))))

(assert (=> b!317071 (= res!260151 (not (= i!999 from!855)))))

(declare-fun b!317073 () Bool)

(declare-fun res!260148 () Bool)

(assert (=> b!317073 (=> (not res!260148) (not e!227861))))

(declare-fun arrayBitRangesEq!0 (array!19604 array!19604 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317073 (= res!260148 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun res!260153 () Bool)

(assert (=> start!70106 (=> (not res!260153) (not e!227861))))

(assert (=> start!70106 (= res!260153 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8523 a1!748) (size!8523 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8523 a1!748))))))))

(assert (=> start!70106 e!227861))

(assert (=> start!70106 true))

(declare-fun array_inv!8075 (array!19604) Bool)

(assert (=> start!70106 (array_inv!8075 a2!748)))

(assert (=> start!70106 (array_inv!8075 a1!748)))

(declare-fun b!317072 () Bool)

(declare-fun res!260150 () Bool)

(assert (=> b!317072 (=> (not res!260150) (not e!227861))))

(assert (=> b!317072 (= res!260150 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(assert (= (and start!70106 res!260153) b!317072))

(assert (= (and b!317072 res!260150) b!317069))

(assert (= (and b!317069 res!260149) b!317068))

(assert (= (and b!317068 res!260152) b!317073))

(assert (= (and b!317073 res!260148) b!317071))

(assert (= (and b!317071 res!260151) b!317070))

(declare-fun m!455063 () Bool)

(assert (=> b!317070 m!455063))

(declare-fun m!455065 () Bool)

(assert (=> b!317070 m!455065))

(declare-fun m!455067 () Bool)

(assert (=> b!317070 m!455067))

(declare-fun m!455069 () Bool)

(assert (=> b!317072 m!455069))

(declare-fun m!455071 () Bool)

(assert (=> b!317069 m!455071))

(declare-fun m!455073 () Bool)

(assert (=> b!317069 m!455073))

(declare-fun m!455075 () Bool)

(assert (=> start!70106 m!455075))

(declare-fun m!455077 () Bool)

(assert (=> start!70106 m!455077))

(declare-fun m!455079 () Bool)

(assert (=> b!317073 m!455079))

(push 1)

(assert (not b!317069))

(assert (not b!317073))

(assert (not b!317072))

(assert (not start!70106))

(assert (not b!317070))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

