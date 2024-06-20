; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70174 () Bool)

(assert start!70174)

(declare-fun b!317651 () Bool)

(declare-fun res!260735 () Bool)

(declare-fun e!228186 () Bool)

(assert (=> b!317651 (=> (not res!260735) (not e!228186))))

(declare-datatypes ((array!19672 0))(
  ( (array!19673 (arr!9643 (Array (_ BitVec 32) (_ BitVec 8))) (size!8557 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19672)

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19672)

(declare-fun arrayBitRangesEq!0 (array!19672 array!19672 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317651 (= res!260735 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!317652 () Bool)

(declare-fun i!999 () (_ BitVec 64))

(assert (=> b!317652 (= e!228186 (and (not (= i!999 from!855)) (not (= (bvand i!999 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand i!999 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!317653 () Bool)

(declare-fun res!260731 () Bool)

(assert (=> b!317653 (=> (not res!260731) (not e!228186))))

(assert (=> b!317653 (= res!260731 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!317655 () Bool)

(declare-fun res!260733 () Bool)

(assert (=> b!317655 (=> (not res!260733) (not e!228186))))

(declare-fun bitAt!0 (array!19672 (_ BitVec 64)) Bool)

(assert (=> b!317655 (= res!260733 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!317654 () Bool)

(declare-fun res!260734 () Bool)

(assert (=> b!317654 (=> (not res!260734) (not e!228186))))

(assert (=> b!317654 (= res!260734 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun res!260732 () Bool)

(assert (=> start!70174 (=> (not res!260732) (not e!228186))))

(assert (=> start!70174 (= res!260732 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8557 a1!748) (size!8557 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8557 a1!748))))))))

(assert (=> start!70174 e!228186))

(assert (=> start!70174 true))

(declare-fun array_inv!8109 (array!19672) Bool)

(assert (=> start!70174 (array_inv!8109 a2!748)))

(assert (=> start!70174 (array_inv!8109 a1!748)))

(assert (= (and start!70174 res!260732) b!317651))

(assert (= (and b!317651 res!260735) b!317655))

(assert (= (and b!317655 res!260733) b!317653))

(assert (= (and b!317653 res!260731) b!317654))

(assert (= (and b!317654 res!260734) b!317652))

(declare-fun m!455675 () Bool)

(assert (=> b!317651 m!455675))

(declare-fun m!455677 () Bool)

(assert (=> b!317655 m!455677))

(declare-fun m!455679 () Bool)

(assert (=> b!317655 m!455679))

(declare-fun m!455681 () Bool)

(assert (=> b!317654 m!455681))

(declare-fun m!455683 () Bool)

(assert (=> start!70174 m!455683))

(declare-fun m!455685 () Bool)

(assert (=> start!70174 m!455685))

(push 1)

(assert (not b!317655))

(assert (not start!70174))

(assert (not b!317654))

(assert (not b!317651))

(check-sat)

(pop 1)

(push 1)

(check-sat)

