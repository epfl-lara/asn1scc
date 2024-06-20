; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70202 () Bool)

(assert start!70202)

(declare-fun b!317878 () Bool)

(declare-fun res!260959 () Bool)

(declare-fun e!228312 () Bool)

(assert (=> b!317878 (=> (not res!260959) (not e!228312))))

(declare-datatypes ((array!19700 0))(
  ( (array!19701 (arr!9657 (Array (_ BitVec 32) (_ BitVec 8))) (size!8571 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19700)

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19700)

(declare-fun arrayBitRangesEq!0 (array!19700 array!19700 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317878 (= res!260959 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!317879 () Bool)

(declare-fun i!999 () (_ BitVec 64))

(assert (=> b!317879 (= e!228312 (not (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 i!999) (bvsle i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))))

(declare-fun bitAt!0 (array!19700 (_ BitVec 64)) Bool)

(assert (=> b!317879 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-datatypes ((Unit!21813 0))(
  ( (Unit!21814) )
))
(declare-fun lt!443222 () Unit!21813)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19700 array!19700 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21813)

(assert (=> b!317879 (= lt!443222 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun b!317880 () Bool)

(declare-fun res!260962 () Bool)

(assert (=> b!317880 (=> (not res!260962) (not e!228312))))

(assert (=> b!317880 (= res!260962 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun res!260963 () Bool)

(assert (=> start!70202 (=> (not res!260963) (not e!228312))))

(assert (=> start!70202 (= res!260963 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8571 a1!748) (size!8571 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8571 a1!748))))))))

(assert (=> start!70202 e!228312))

(assert (=> start!70202 true))

(declare-fun array_inv!8123 (array!19700) Bool)

(assert (=> start!70202 (array_inv!8123 a2!748)))

(assert (=> start!70202 (array_inv!8123 a1!748)))

(declare-fun b!317881 () Bool)

(declare-fun res!260961 () Bool)

(assert (=> b!317881 (=> (not res!260961) (not e!228312))))

(assert (=> b!317881 (= res!260961 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!317882 () Bool)

(declare-fun res!260960 () Bool)

(assert (=> b!317882 (=> (not res!260960) (not e!228312))))

(assert (=> b!317882 (= res!260960 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!317883 () Bool)

(declare-fun res!260958 () Bool)

(assert (=> b!317883 (=> (not res!260958) (not e!228312))))

(assert (=> b!317883 (= res!260958 (not (= i!999 from!855)))))

(assert (= (and start!70202 res!260963) b!317878))

(assert (= (and b!317878 res!260959) b!317882))

(assert (= (and b!317882 res!260960) b!317880))

(assert (= (and b!317880 res!260962) b!317881))

(assert (= (and b!317881 res!260961) b!317883))

(assert (= (and b!317883 res!260958) b!317879))

(declare-fun m!455873 () Bool)

(assert (=> b!317879 m!455873))

(declare-fun m!455875 () Bool)

(assert (=> b!317879 m!455875))

(declare-fun m!455877 () Bool)

(assert (=> b!317879 m!455877))

(declare-fun m!455879 () Bool)

(assert (=> b!317878 m!455879))

(declare-fun m!455881 () Bool)

(assert (=> b!317881 m!455881))

(declare-fun m!455883 () Bool)

(assert (=> start!70202 m!455883))

(declare-fun m!455885 () Bool)

(assert (=> start!70202 m!455885))

(declare-fun m!455887 () Bool)

(assert (=> b!317882 m!455887))

(declare-fun m!455889 () Bool)

(assert (=> b!317882 m!455889))

(push 1)

(assert (not b!317881))

(assert (not b!317879))

(assert (not b!317882))

(assert (not start!70202))

(assert (not b!317878))

(check-sat)

(pop 1)

(push 1)

(check-sat)

