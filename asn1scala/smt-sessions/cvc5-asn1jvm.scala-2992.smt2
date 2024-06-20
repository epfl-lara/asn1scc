; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70186 () Bool)

(assert start!70186)

(declare-fun b!317741 () Bool)

(declare-fun res!260824 () Bool)

(declare-fun e!228240 () Bool)

(assert (=> b!317741 (=> (not res!260824) (not e!228240))))

(declare-datatypes ((array!19684 0))(
  ( (array!19685 (arr!9649 (Array (_ BitVec 32) (_ BitVec 8))) (size!8563 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19684)

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19684)

(declare-fun bitAt!0 (array!19684 (_ BitVec 64)) Bool)

(assert (=> b!317741 (= res!260824 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!317742 () Bool)

(declare-fun res!260823 () Bool)

(assert (=> b!317742 (=> (not res!260823) (not e!228240))))

(declare-fun i!999 () (_ BitVec 64))

(declare-fun from!855 () (_ BitVec 64))

(assert (=> b!317742 (= res!260823 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!317744 () Bool)

(declare-fun res!260822 () Bool)

(assert (=> b!317744 (=> (not res!260822) (not e!228240))))

(declare-fun arrayBitRangesEq!0 (array!19684 array!19684 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317744 (= res!260822 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!317745 () Bool)

(assert (=> b!317745 (= e!228240 (and (not (= i!999 from!855)) (bvsle to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8563 a1!748)))) (bvsgt from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun res!260825 () Bool)

(assert (=> start!70186 (=> (not res!260825) (not e!228240))))

(assert (=> start!70186 (= res!260825 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8563 a1!748) (size!8563 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8563 a1!748))))))))

(assert (=> start!70186 e!228240))

(assert (=> start!70186 true))

(declare-fun array_inv!8115 (array!19684) Bool)

(assert (=> start!70186 (array_inv!8115 a2!748)))

(assert (=> start!70186 (array_inv!8115 a1!748)))

(declare-fun b!317743 () Bool)

(declare-fun res!260821 () Bool)

(assert (=> b!317743 (=> (not res!260821) (not e!228240))))

(assert (=> b!317743 (= res!260821 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(assert (= (and start!70186 res!260825) b!317743))

(assert (= (and b!317743 res!260821) b!317741))

(assert (= (and b!317741 res!260824) b!317742))

(assert (= (and b!317742 res!260823) b!317744))

(assert (= (and b!317744 res!260822) b!317745))

(declare-fun m!455747 () Bool)

(assert (=> b!317741 m!455747))

(declare-fun m!455749 () Bool)

(assert (=> b!317741 m!455749))

(declare-fun m!455751 () Bool)

(assert (=> b!317744 m!455751))

(declare-fun m!455753 () Bool)

(assert (=> start!70186 m!455753))

(declare-fun m!455755 () Bool)

(assert (=> start!70186 m!455755))

(declare-fun m!455757 () Bool)

(assert (=> b!317743 m!455757))

(push 1)

(assert (not b!317744))

(assert (not start!70186))

(assert (not b!317741))

(assert (not b!317743))

(check-sat)

(pop 1)

(push 1)

(check-sat)

