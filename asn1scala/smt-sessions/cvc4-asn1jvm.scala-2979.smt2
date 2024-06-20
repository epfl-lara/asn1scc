; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70112 () Bool)

(assert start!70112)

(declare-fun b!317122 () Bool)

(declare-fun res!260203 () Bool)

(declare-fun e!227888 () Bool)

(assert (=> b!317122 (=> (not res!260203) (not e!227888))))

(declare-fun i!999 () (_ BitVec 64))

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(assert (=> b!317122 (= res!260203 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!317123 () Bool)

(declare-fun res!260202 () Bool)

(assert (=> b!317123 (=> (not res!260202) (not e!227888))))

(declare-datatypes ((array!19610 0))(
  ( (array!19611 (arr!9612 (Array (_ BitVec 32) (_ BitVec 8))) (size!8526 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19610)

(declare-fun a1!748 () array!19610)

(declare-fun arrayBitRangesEq!0 (array!19610 array!19610 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317123 (= res!260202 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!317124 () Bool)

(declare-fun res!260204 () Bool)

(assert (=> b!317124 (=> (not res!260204) (not e!227888))))

(assert (=> b!317124 (= res!260204 (not (= i!999 from!855)))))

(declare-fun b!317125 () Bool)

(assert (=> b!317125 (= e!227888 (not true))))

(declare-fun bitAt!0 (array!19610 (_ BitVec 64)) Bool)

(assert (=> b!317125 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-datatypes ((Unit!21765 0))(
  ( (Unit!21766) )
))
(declare-fun lt!443096 () Unit!21765)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19610 array!19610 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21765)

(assert (=> b!317125 (= lt!443096 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun res!260206 () Bool)

(assert (=> start!70112 (=> (not res!260206) (not e!227888))))

(assert (=> start!70112 (= res!260206 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8526 a1!748) (size!8526 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8526 a1!748))))))))

(assert (=> start!70112 e!227888))

(assert (=> start!70112 true))

(declare-fun array_inv!8078 (array!19610) Bool)

(assert (=> start!70112 (array_inv!8078 a2!748)))

(assert (=> start!70112 (array_inv!8078 a1!748)))

(declare-fun b!317126 () Bool)

(declare-fun res!260207 () Bool)

(assert (=> b!317126 (=> (not res!260207) (not e!227888))))

(assert (=> b!317126 (= res!260207 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!317127 () Bool)

(declare-fun res!260205 () Bool)

(assert (=> b!317127 (=> (not res!260205) (not e!227888))))

(assert (=> b!317127 (= res!260205 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(assert (= (and start!70112 res!260206) b!317126))

(assert (= (and b!317126 res!260207) b!317127))

(assert (= (and b!317127 res!260205) b!317122))

(assert (= (and b!317122 res!260203) b!317123))

(assert (= (and b!317123 res!260202) b!317124))

(assert (= (and b!317124 res!260204) b!317125))

(declare-fun m!455117 () Bool)

(assert (=> b!317125 m!455117))

(declare-fun m!455119 () Bool)

(assert (=> b!317125 m!455119))

(declare-fun m!455121 () Bool)

(assert (=> b!317125 m!455121))

(declare-fun m!455123 () Bool)

(assert (=> b!317123 m!455123))

(declare-fun m!455125 () Bool)

(assert (=> start!70112 m!455125))

(declare-fun m!455127 () Bool)

(assert (=> start!70112 m!455127))

(declare-fun m!455129 () Bool)

(assert (=> b!317127 m!455129))

(declare-fun m!455131 () Bool)

(assert (=> b!317127 m!455131))

(declare-fun m!455133 () Bool)

(assert (=> b!317126 m!455133))

(push 1)

(assert (not b!317123))

(assert (not start!70112))

(assert (not b!317126))

(assert (not b!317125))

