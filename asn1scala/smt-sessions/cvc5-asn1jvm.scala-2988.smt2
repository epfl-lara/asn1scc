; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70162 () Bool)

(assert start!70162)

(declare-fun res!260635 () Bool)

(declare-fun e!228132 () Bool)

(assert (=> start!70162 (=> (not res!260635) (not e!228132))))

(declare-datatypes ((array!19660 0))(
  ( (array!19661 (arr!9637 (Array (_ BitVec 32) (_ BitVec 8))) (size!8551 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19660)

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19660)

(assert (=> start!70162 (= res!260635 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8551 a1!748) (size!8551 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8551 a1!748))))))))

(assert (=> start!70162 e!228132))

(assert (=> start!70162 true))

(declare-fun array_inv!8103 (array!19660) Bool)

(assert (=> start!70162 (array_inv!8103 a2!748)))

(assert (=> start!70162 (array_inv!8103 a1!748)))

(declare-fun b!317552 () Bool)

(declare-fun res!260636 () Bool)

(assert (=> b!317552 (=> (not res!260636) (not e!228132))))

(declare-fun arrayBitRangesEq!0 (array!19660 array!19660 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317552 (= res!260636 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!317553 () Bool)

(declare-fun res!260633 () Bool)

(assert (=> b!317553 (=> (not res!260633) (not e!228132))))

(declare-fun bitAt!0 (array!19660 (_ BitVec 64)) Bool)

(assert (=> b!317553 (= res!260633 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!317554 () Bool)

(declare-fun res!260634 () Bool)

(assert (=> b!317554 (=> (not res!260634) (not e!228132))))

(declare-fun i!999 () (_ BitVec 64))

(assert (=> b!317554 (= res!260634 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!317555 () Bool)

(declare-fun res!260632 () Bool)

(assert (=> b!317555 (=> (not res!260632) (not e!228132))))

(assert (=> b!317555 (= res!260632 (bvsle i!999 to!822))))

(declare-fun b!317556 () Bool)

(assert (=> b!317556 (= e!228132 (and (= i!999 from!855) (= (bvand to!822 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand to!822 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!70162 res!260635) b!317552))

(assert (= (and b!317552 res!260636) b!317553))

(assert (= (and b!317553 res!260633) b!317555))

(assert (= (and b!317555 res!260632) b!317554))

(assert (= (and b!317554 res!260634) b!317556))

(declare-fun m!455597 () Bool)

(assert (=> start!70162 m!455597))

(declare-fun m!455599 () Bool)

(assert (=> start!70162 m!455599))

(declare-fun m!455601 () Bool)

(assert (=> b!317552 m!455601))

(declare-fun m!455603 () Bool)

(assert (=> b!317553 m!455603))

(declare-fun m!455605 () Bool)

(assert (=> b!317553 m!455605))

(declare-fun m!455607 () Bool)

(assert (=> b!317554 m!455607))

(push 1)

(assert (not b!317553))

(assert (not b!317554))

(assert (not b!317552))

(assert (not start!70162))

(check-sat)

(pop 1)

(push 1)

(check-sat)

