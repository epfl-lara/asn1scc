; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70184 () Bool)

(assert start!70184)

(declare-fun i!999 () (_ BitVec 64))

(declare-fun e!228232 () Bool)

(declare-fun b!317726 () Bool)

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(declare-datatypes ((array!19682 0))(
  ( (array!19683 (arr!9648 (Array (_ BitVec 32) (_ BitVec 8))) (size!8562 (_ BitVec 32))) )
))
(declare-fun a1!748 () array!19682)

(assert (=> b!317726 (= e!228232 (and (not (= i!999 from!855)) (bvsgt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8562 a1!748))))))))

(declare-fun res!260809 () Bool)

(assert (=> start!70184 (=> (not res!260809) (not e!228232))))

(declare-fun a2!748 () array!19682)

(assert (=> start!70184 (= res!260809 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8562 a1!748) (size!8562 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8562 a1!748))))))))

(assert (=> start!70184 e!228232))

(assert (=> start!70184 true))

(declare-fun array_inv!8114 (array!19682) Bool)

(assert (=> start!70184 (array_inv!8114 a2!748)))

(assert (=> start!70184 (array_inv!8114 a1!748)))

(declare-fun b!317727 () Bool)

(declare-fun res!260808 () Bool)

(assert (=> b!317727 (=> (not res!260808) (not e!228232))))

(declare-fun arrayBitRangesEq!0 (array!19682 array!19682 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317727 (= res!260808 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!317728 () Bool)

(declare-fun res!260806 () Bool)

(assert (=> b!317728 (=> (not res!260806) (not e!228232))))

(assert (=> b!317728 (= res!260806 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!317729 () Bool)

(declare-fun res!260807 () Bool)

(assert (=> b!317729 (=> (not res!260807) (not e!228232))))

(declare-fun bitAt!0 (array!19682 (_ BitVec 64)) Bool)

(assert (=> b!317729 (= res!260807 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!317730 () Bool)

(declare-fun res!260810 () Bool)

(assert (=> b!317730 (=> (not res!260810) (not e!228232))))

(assert (=> b!317730 (= res!260810 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(assert (= (and start!70184 res!260809) b!317730))

(assert (= (and b!317730 res!260810) b!317729))

(assert (= (and b!317729 res!260807) b!317728))

(assert (= (and b!317728 res!260806) b!317727))

(assert (= (and b!317727 res!260808) b!317726))

(declare-fun m!455735 () Bool)

(assert (=> start!70184 m!455735))

(declare-fun m!455737 () Bool)

(assert (=> start!70184 m!455737))

(declare-fun m!455739 () Bool)

(assert (=> b!317727 m!455739))

(declare-fun m!455741 () Bool)

(assert (=> b!317729 m!455741))

(declare-fun m!455743 () Bool)

(assert (=> b!317729 m!455743))

(declare-fun m!455745 () Bool)

(assert (=> b!317730 m!455745))

(push 1)

(assert (not start!70184))

(assert (not b!317727))

(assert (not b!317729))

(assert (not b!317730))

(check-sat)

(pop 1)

(push 1)

(check-sat)

