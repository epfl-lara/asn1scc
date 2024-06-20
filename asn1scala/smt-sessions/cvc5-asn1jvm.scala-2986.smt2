; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70150 () Bool)

(assert start!70150)

(declare-fun res!260556 () Bool)

(declare-fun e!228079 () Bool)

(assert (=> start!70150 (=> (not res!260556) (not e!228079))))

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(declare-datatypes ((array!19648 0))(
  ( (array!19649 (arr!9631 (Array (_ BitVec 32) (_ BitVec 8))) (size!8545 (_ BitVec 32))) )
))
(declare-fun a1!748 () array!19648)

(declare-fun a2!748 () array!19648)

(assert (=> start!70150 (= res!260556 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8545 a1!748) (size!8545 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8545 a1!748))))))))

(assert (=> start!70150 e!228079))

(assert (=> start!70150 true))

(declare-fun array_inv!8097 (array!19648) Bool)

(assert (=> start!70150 (array_inv!8097 a2!748)))

(assert (=> start!70150 (array_inv!8097 a1!748)))

(declare-fun b!317476 () Bool)

(declare-fun res!260558 () Bool)

(assert (=> b!317476 (=> (not res!260558) (not e!228079))))

(declare-fun arrayBitRangesEq!0 (array!19648 array!19648 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317476 (= res!260558 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!317477 () Bool)

(declare-fun res!260557 () Bool)

(assert (=> b!317477 (=> (not res!260557) (not e!228079))))

(declare-fun bitAt!0 (array!19648 (_ BitVec 64)) Bool)

(assert (=> b!317477 (= res!260557 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun i!999 () (_ BitVec 64))

(declare-fun b!317478 () Bool)

(assert (=> b!317478 (= e!228079 (and (bvsle from!855 i!999) (bvsle i!999 to!822) (= (bvand to!822 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand to!822 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!70150 res!260556) b!317476))

(assert (= (and b!317476 res!260558) b!317477))

(assert (= (and b!317477 res!260557) b!317478))

(declare-fun m!455531 () Bool)

(assert (=> start!70150 m!455531))

(declare-fun m!455533 () Bool)

(assert (=> start!70150 m!455533))

(declare-fun m!455535 () Bool)

(assert (=> b!317476 m!455535))

(declare-fun m!455537 () Bool)

(assert (=> b!317477 m!455537))

(declare-fun m!455539 () Bool)

(assert (=> b!317477 m!455539))

(push 1)

(assert (not b!317477))

(assert (not start!70150))

(assert (not b!317476))

(check-sat)

(pop 1)

(push 1)

(check-sat)

