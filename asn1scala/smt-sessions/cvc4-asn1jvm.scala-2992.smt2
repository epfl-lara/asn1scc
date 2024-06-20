; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70190 () Bool)

(assert start!70190)

(declare-fun b!317771 () Bool)

(declare-fun res!260853 () Bool)

(declare-fun e!228258 () Bool)

(assert (=> b!317771 (=> (not res!260853) (not e!228258))))

(declare-datatypes ((array!19688 0))(
  ( (array!19689 (arr!9651 (Array (_ BitVec 32) (_ BitVec 8))) (size!8565 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19688)

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19688)

(declare-fun bitAt!0 (array!19688 (_ BitVec 64)) Bool)

(assert (=> b!317771 (= res!260853 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun res!260855 () Bool)

(assert (=> start!70190 (=> (not res!260855) (not e!228258))))

(declare-fun from!855 () (_ BitVec 64))

(assert (=> start!70190 (= res!260855 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8565 a1!748) (size!8565 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8565 a1!748))))))))

(assert (=> start!70190 e!228258))

(assert (=> start!70190 true))

(declare-fun array_inv!8117 (array!19688) Bool)

(assert (=> start!70190 (array_inv!8117 a2!748)))

(assert (=> start!70190 (array_inv!8117 a1!748)))

(declare-fun b!317772 () Bool)

(declare-fun res!260854 () Bool)

(assert (=> b!317772 (=> (not res!260854) (not e!228258))))

(declare-fun arrayBitRangesEq!0 (array!19688 array!19688 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317772 (= res!260854 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!317773 () Bool)

(declare-fun res!260851 () Bool)

(assert (=> b!317773 (=> (not res!260851) (not e!228258))))

(declare-fun i!999 () (_ BitVec 64))

(assert (=> b!317773 (= res!260851 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!317774 () Bool)

(assert (=> b!317774 (= e!228258 (and (not (= i!999 from!855)) (bvsle to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8565 a1!748)))) (bvsgt from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!317775 () Bool)

(declare-fun res!260852 () Bool)

(assert (=> b!317775 (=> (not res!260852) (not e!228258))))

(assert (=> b!317775 (= res!260852 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(assert (= (and start!70190 res!260855) b!317772))

(assert (= (and b!317772 res!260854) b!317771))

(assert (= (and b!317771 res!260853) b!317773))

(assert (= (and b!317773 res!260851) b!317775))

(assert (= (and b!317775 res!260852) b!317774))

(declare-fun m!455771 () Bool)

(assert (=> b!317771 m!455771))

(declare-fun m!455773 () Bool)

(assert (=> b!317771 m!455773))

(declare-fun m!455775 () Bool)

(assert (=> start!70190 m!455775))

(declare-fun m!455777 () Bool)

(assert (=> start!70190 m!455777))

(declare-fun m!455779 () Bool)

(assert (=> b!317772 m!455779))

(declare-fun m!455781 () Bool)

(assert (=> b!317775 m!455781))

(push 1)

(assert (not b!317775))

(assert (not b!317771))

(assert (not b!317772))

(assert (not start!70190))

(check-sat)

(pop 1)

(push 1)

(check-sat)

