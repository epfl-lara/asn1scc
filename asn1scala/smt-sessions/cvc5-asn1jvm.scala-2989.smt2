; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70168 () Bool)

(assert start!70168)

(declare-fun b!317600 () Bool)

(declare-fun res!260680 () Bool)

(declare-fun e!228159 () Bool)

(assert (=> b!317600 (=> (not res!260680) (not e!228159))))

(declare-datatypes ((array!19666 0))(
  ( (array!19667 (arr!9640 (Array (_ BitVec 32) (_ BitVec 8))) (size!8554 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19666)

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19666)

(declare-fun bitAt!0 (array!19666 (_ BitVec 64)) Bool)

(assert (=> b!317600 (= res!260680 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun from!855 () (_ BitVec 64))

(declare-fun b!317601 () Bool)

(declare-fun arrayBitRangesEq!0 (array!19666 array!19666 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317601 (= e!228159 (not (arrayBitRangesEq!0 a1!748 a2!748 from!855 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))))

(declare-fun b!317602 () Bool)

(declare-fun res!260683 () Bool)

(assert (=> b!317602 (=> (not res!260683) (not e!228159))))

(assert (=> b!317602 (= res!260683 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!317603 () Bool)

(declare-fun res!260682 () Bool)

(assert (=> b!317603 (=> (not res!260682) (not e!228159))))

(declare-fun i!999 () (_ BitVec 64))

(assert (=> b!317603 (= res!260682 (bvsle i!999 to!822))))

(declare-fun b!317604 () Bool)

(declare-fun res!260681 () Bool)

(assert (=> b!317604 (=> (not res!260681) (not e!228159))))

(assert (=> b!317604 (= res!260681 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun res!260684 () Bool)

(assert (=> start!70168 (=> (not res!260684) (not e!228159))))

(assert (=> start!70168 (= res!260684 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8554 a1!748) (size!8554 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8554 a1!748))))))))

(assert (=> start!70168 e!228159))

(assert (=> start!70168 true))

(declare-fun array_inv!8106 (array!19666) Bool)

(assert (=> start!70168 (array_inv!8106 a2!748)))

(assert (=> start!70168 (array_inv!8106 a1!748)))

(declare-fun b!317599 () Bool)

(declare-fun res!260679 () Bool)

(assert (=> b!317599 (=> (not res!260679) (not e!228159))))

(assert (=> b!317599 (= res!260679 (= i!999 from!855))))

(assert (= (and start!70168 res!260684) b!317602))

(assert (= (and b!317602 res!260683) b!317600))

(assert (= (and b!317600 res!260680) b!317603))

(assert (= (and b!317603 res!260682) b!317604))

(assert (= (and b!317604 res!260681) b!317599))

(assert (= (and b!317599 res!260679) b!317601))

(declare-fun m!455633 () Bool)

(assert (=> b!317601 m!455633))

(declare-fun m!455635 () Bool)

(assert (=> b!317602 m!455635))

(declare-fun m!455637 () Bool)

(assert (=> b!317600 m!455637))

(declare-fun m!455639 () Bool)

(assert (=> b!317600 m!455639))

(declare-fun m!455641 () Bool)

(assert (=> b!317604 m!455641))

(declare-fun m!455643 () Bool)

(assert (=> start!70168 m!455643))

(declare-fun m!455645 () Bool)

(assert (=> start!70168 m!455645))

(push 1)

(assert (not start!70168))

(assert (not b!317601))

(assert (not b!317604))

(assert (not b!317602))

(assert (not b!317600))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

