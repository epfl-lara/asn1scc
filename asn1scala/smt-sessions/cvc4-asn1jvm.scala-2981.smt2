; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70124 () Bool)

(assert start!70124)

(declare-fun b!317230 () Bool)

(declare-fun res!260315 () Bool)

(declare-fun e!227942 () Bool)

(assert (=> b!317230 (=> (not res!260315) (not e!227942))))

(declare-fun i!999 () (_ BitVec 64))

(declare-fun from!855 () (_ BitVec 64))

(assert (=> b!317230 (= res!260315 (not (= i!999 from!855)))))

(declare-fun b!317231 () Bool)

(declare-fun res!260311 () Bool)

(assert (=> b!317231 (=> (not res!260311) (not e!227942))))

(declare-fun to!822 () (_ BitVec 64))

(assert (=> b!317231 (= res!260311 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun res!260312 () Bool)

(assert (=> start!70124 (=> (not res!260312) (not e!227942))))

(declare-datatypes ((array!19622 0))(
  ( (array!19623 (arr!9618 (Array (_ BitVec 32) (_ BitVec 8))) (size!8532 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19622)

(declare-fun a1!748 () array!19622)

(assert (=> start!70124 (= res!260312 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8532 a1!748) (size!8532 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8532 a1!748))))))))

(assert (=> start!70124 e!227942))

(assert (=> start!70124 true))

(declare-fun array_inv!8084 (array!19622) Bool)

(assert (=> start!70124 (array_inv!8084 a2!748)))

(assert (=> start!70124 (array_inv!8084 a1!748)))

(declare-fun b!317232 () Bool)

(assert (=> b!317232 (= e!227942 (not true))))

(declare-fun bitAt!0 (array!19622 (_ BitVec 64)) Bool)

(assert (=> b!317232 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-datatypes ((Unit!21777 0))(
  ( (Unit!21778) )
))
(declare-fun lt!443114 () Unit!21777)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19622 array!19622 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21777)

(assert (=> b!317232 (= lt!443114 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun b!317233 () Bool)

(declare-fun res!260310 () Bool)

(assert (=> b!317233 (=> (not res!260310) (not e!227942))))

(declare-fun arrayBitRangesEq!0 (array!19622 array!19622 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317233 (= res!260310 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!317234 () Bool)

(declare-fun res!260314 () Bool)

(assert (=> b!317234 (=> (not res!260314) (not e!227942))))

(assert (=> b!317234 (= res!260314 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!317235 () Bool)

(declare-fun res!260313 () Bool)

(assert (=> b!317235 (=> (not res!260313) (not e!227942))))

(assert (=> b!317235 (= res!260313 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(assert (= (and start!70124 res!260312) b!317234))

(assert (= (and b!317234 res!260314) b!317235))

(assert (= (and b!317235 res!260313) b!317231))

(assert (= (and b!317231 res!260311) b!317233))

(assert (= (and b!317233 res!260310) b!317230))

(assert (= (and b!317230 res!260315) b!317232))

(declare-fun m!455225 () Bool)

(assert (=> b!317234 m!455225))

(declare-fun m!455227 () Bool)

(assert (=> b!317233 m!455227))

(declare-fun m!455229 () Bool)

(assert (=> start!70124 m!455229))

(declare-fun m!455231 () Bool)

(assert (=> start!70124 m!455231))

(declare-fun m!455233 () Bool)

(assert (=> b!317232 m!455233))

(declare-fun m!455235 () Bool)

(assert (=> b!317232 m!455235))

(declare-fun m!455237 () Bool)

(assert (=> b!317232 m!455237))

(declare-fun m!455239 () Bool)

(assert (=> b!317235 m!455239))

(declare-fun m!455241 () Bool)

(assert (=> b!317235 m!455241))

(push 1)

(assert (not b!317232))

(assert (not b!317233))

(assert (not b!317235))

