; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70166 () Bool)

(assert start!70166)

(declare-fun b!317582 () Bool)

(declare-fun res!260666 () Bool)

(declare-fun e!228149 () Bool)

(assert (=> b!317582 (=> (not res!260666) (not e!228149))))

(declare-fun i!999 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(assert (=> b!317582 (= res!260666 (bvsle i!999 to!822))))

(declare-fun b!317583 () Bool)

(declare-fun res!260665 () Bool)

(assert (=> b!317583 (=> (not res!260665) (not e!228149))))

(declare-datatypes ((array!19664 0))(
  ( (array!19665 (arr!9639 (Array (_ BitVec 32) (_ BitVec 8))) (size!8553 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19664)

(declare-fun a1!748 () array!19664)

(declare-fun arrayBitRangesEq!0 (array!19664 array!19664 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317583 (= res!260665 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!317584 () Bool)

(declare-fun res!260664 () Bool)

(assert (=> b!317584 (=> (not res!260664) (not e!228149))))

(declare-fun from!855 () (_ BitVec 64))

(assert (=> b!317584 (= res!260664 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!317585 () Bool)

(declare-fun res!260662 () Bool)

(assert (=> b!317585 (=> (not res!260662) (not e!228149))))

(declare-fun bitAt!0 (array!19664 (_ BitVec 64)) Bool)

(assert (=> b!317585 (= res!260662 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!317586 () Bool)

(assert (=> b!317586 (= e!228149 (and (= i!999 from!855) (= (bvand to!822 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand to!822 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!260663 () Bool)

(assert (=> start!70166 (=> (not res!260663) (not e!228149))))

(assert (=> start!70166 (= res!260663 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8553 a1!748) (size!8553 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8553 a1!748))))))))

(assert (=> start!70166 e!228149))

(assert (=> start!70166 true))

(declare-fun array_inv!8105 (array!19664) Bool)

(assert (=> start!70166 (array_inv!8105 a2!748)))

(assert (=> start!70166 (array_inv!8105 a1!748)))

(assert (= (and start!70166 res!260663) b!317584))

(assert (= (and b!317584 res!260664) b!317585))

(assert (= (and b!317585 res!260662) b!317582))

(assert (= (and b!317582 res!260666) b!317583))

(assert (= (and b!317583 res!260665) b!317586))

(declare-fun m!455621 () Bool)

(assert (=> b!317583 m!455621))

(declare-fun m!455623 () Bool)

(assert (=> b!317584 m!455623))

(declare-fun m!455625 () Bool)

(assert (=> b!317585 m!455625))

(declare-fun m!455627 () Bool)

(assert (=> b!317585 m!455627))

(declare-fun m!455629 () Bool)

(assert (=> start!70166 m!455629))

(declare-fun m!455631 () Bool)

(assert (=> start!70166 m!455631))

(push 1)

(assert (not start!70166))

(assert (not b!317585))

(assert (not b!317583))

(assert (not b!317584))

(check-sat)

(pop 1)

(push 1)

(check-sat)

