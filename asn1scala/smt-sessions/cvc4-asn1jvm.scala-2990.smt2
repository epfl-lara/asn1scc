; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70178 () Bool)

(assert start!70178)

(declare-fun b!317681 () Bool)

(declare-fun res!260761 () Bool)

(declare-fun e!228205 () Bool)

(assert (=> b!317681 (=> (not res!260761) (not e!228205))))

(declare-fun i!999 () (_ BitVec 64))

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(assert (=> b!317681 (= res!260761 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun res!260765 () Bool)

(assert (=> start!70178 (=> (not res!260765) (not e!228205))))

(declare-datatypes ((array!19676 0))(
  ( (array!19677 (arr!9645 (Array (_ BitVec 32) (_ BitVec 8))) (size!8559 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19676)

(declare-fun a1!748 () array!19676)

(assert (=> start!70178 (= res!260765 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8559 a1!748) (size!8559 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8559 a1!748))))))))

(assert (=> start!70178 e!228205))

(assert (=> start!70178 true))

(declare-fun array_inv!8111 (array!19676) Bool)

(assert (=> start!70178 (array_inv!8111 a2!748)))

(assert (=> start!70178 (array_inv!8111 a1!748)))

(declare-fun b!317682 () Bool)

(declare-fun res!260762 () Bool)

(assert (=> b!317682 (=> (not res!260762) (not e!228205))))

(declare-fun arrayBitRangesEq!0 (array!19676 array!19676 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317682 (= res!260762 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!317683 () Bool)

(assert (=> b!317683 (= e!228205 (and (not (= i!999 from!855)) (not (= (bvand i!999 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand i!999 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!317684 () Bool)

(declare-fun res!260763 () Bool)

(assert (=> b!317684 (=> (not res!260763) (not e!228205))))

(assert (=> b!317684 (= res!260763 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!317685 () Bool)

(declare-fun res!260764 () Bool)

(assert (=> b!317685 (=> (not res!260764) (not e!228205))))

(declare-fun bitAt!0 (array!19676 (_ BitVec 64)) Bool)

(assert (=> b!317685 (= res!260764 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(assert (= (and start!70178 res!260765) b!317684))

(assert (= (and b!317684 res!260763) b!317685))

(assert (= (and b!317685 res!260764) b!317681))

(assert (= (and b!317681 res!260761) b!317682))

(assert (= (and b!317682 res!260762) b!317683))

(declare-fun m!455699 () Bool)

(assert (=> start!70178 m!455699))

(declare-fun m!455701 () Bool)

(assert (=> start!70178 m!455701))

(declare-fun m!455703 () Bool)

(assert (=> b!317682 m!455703))

(declare-fun m!455705 () Bool)

(assert (=> b!317684 m!455705))

(declare-fun m!455707 () Bool)

(assert (=> b!317685 m!455707))

(declare-fun m!455709 () Bool)

(assert (=> b!317685 m!455709))

(push 1)

(assert (not b!317685))

(assert (not start!70178))

(assert (not b!317684))

(assert (not b!317682))

(check-sat)

(pop 1)

(push 1)

(check-sat)

