; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70196 () Bool)

(assert start!70196)

(declare-fun b!317824 () Bool)

(declare-fun res!260905 () Bool)

(declare-fun e!228284 () Bool)

(assert (=> b!317824 (=> (not res!260905) (not e!228284))))

(declare-datatypes ((array!19694 0))(
  ( (array!19695 (arr!9654 (Array (_ BitVec 32) (_ BitVec 8))) (size!8568 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19694)

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19694)

(declare-fun bitAt!0 (array!19694 (_ BitVec 64)) Bool)

(assert (=> b!317824 (= res!260905 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!317825 () Bool)

(declare-fun res!260908 () Bool)

(assert (=> b!317825 (=> (not res!260908) (not e!228284))))

(declare-fun i!999 () (_ BitVec 64))

(declare-fun from!855 () (_ BitVec 64))

(assert (=> b!317825 (= res!260908 (not (= i!999 from!855)))))

(declare-fun b!317826 () Bool)

(declare-fun res!260904 () Bool)

(assert (=> b!317826 (=> (not res!260904) (not e!228284))))

(declare-fun arrayBitRangesEq!0 (array!19694 array!19694 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317826 (= res!260904 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!317827 () Bool)

(declare-fun res!260907 () Bool)

(assert (=> b!317827 (=> (not res!260907) (not e!228284))))

(assert (=> b!317827 (= res!260907 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun res!260906 () Bool)

(assert (=> start!70196 (=> (not res!260906) (not e!228284))))

(assert (=> start!70196 (= res!260906 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8568 a1!748) (size!8568 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8568 a1!748))))))))

(assert (=> start!70196 e!228284))

(assert (=> start!70196 true))

(declare-fun array_inv!8120 (array!19694) Bool)

(assert (=> start!70196 (array_inv!8120 a2!748)))

(assert (=> start!70196 (array_inv!8120 a1!748)))

(declare-fun b!317828 () Bool)

(declare-fun res!260909 () Bool)

(assert (=> b!317828 (=> (not res!260909) (not e!228284))))

(assert (=> b!317828 (= res!260909 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!317829 () Bool)

(assert (=> b!317829 (= e!228284 (not (or (not (= (bvand to!822 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!822 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!317829 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-datatypes ((Unit!21807 0))(
  ( (Unit!21808) )
))
(declare-fun lt!443213 () Unit!21807)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19694 array!19694 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21807)

(assert (=> b!317829 (= lt!443213 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(assert (= (and start!70196 res!260906) b!317826))

(assert (= (and b!317826 res!260904) b!317824))

(assert (= (and b!317824 res!260905) b!317828))

(assert (= (and b!317828 res!260909) b!317827))

(assert (= (and b!317827 res!260907) b!317825))

(assert (= (and b!317825 res!260908) b!317829))

(declare-fun m!455819 () Bool)

(assert (=> b!317829 m!455819))

(declare-fun m!455821 () Bool)

(assert (=> b!317829 m!455821))

(declare-fun m!455823 () Bool)

(assert (=> b!317829 m!455823))

(declare-fun m!455825 () Bool)

(assert (=> start!70196 m!455825))

(declare-fun m!455827 () Bool)

(assert (=> start!70196 m!455827))

(declare-fun m!455829 () Bool)

(assert (=> b!317827 m!455829))

(declare-fun m!455831 () Bool)

(assert (=> b!317826 m!455831))

(declare-fun m!455833 () Bool)

(assert (=> b!317824 m!455833))

(declare-fun m!455835 () Bool)

(assert (=> b!317824 m!455835))

(push 1)

(assert (not start!70196))

(assert (not b!317827))

(assert (not b!317824))

(assert (not b!317829))

(assert (not b!317826))

(check-sat)

(pop 1)

(push 1)

(check-sat)

