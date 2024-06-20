; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70198 () Bool)

(assert start!70198)

(declare-fun b!317842 () Bool)

(declare-fun res!260924 () Bool)

(declare-fun e!228295 () Bool)

(assert (=> b!317842 (=> (not res!260924) (not e!228295))))

(declare-datatypes ((array!19696 0))(
  ( (array!19697 (arr!9655 (Array (_ BitVec 32) (_ BitVec 8))) (size!8569 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19696)

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19696)

(declare-fun bitAt!0 (array!19696 (_ BitVec 64)) Bool)

(assert (=> b!317842 (= res!260924 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!317843 () Bool)

(declare-fun res!260925 () Bool)

(assert (=> b!317843 (=> (not res!260925) (not e!228295))))

(declare-fun i!999 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19696 array!19696 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317843 (= res!260925 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!317844 () Bool)

(declare-fun res!260927 () Bool)

(assert (=> b!317844 (=> (not res!260927) (not e!228295))))

(declare-fun from!855 () (_ BitVec 64))

(assert (=> b!317844 (= res!260927 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun res!260922 () Bool)

(assert (=> start!70198 (=> (not res!260922) (not e!228295))))

(assert (=> start!70198 (= res!260922 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8569 a1!748) (size!8569 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8569 a1!748))))))))

(assert (=> start!70198 e!228295))

(assert (=> start!70198 true))

(declare-fun array_inv!8121 (array!19696) Bool)

(assert (=> start!70198 (array_inv!8121 a2!748)))

(assert (=> start!70198 (array_inv!8121 a1!748)))

(declare-fun b!317845 () Bool)

(declare-fun res!260923 () Bool)

(assert (=> b!317845 (=> (not res!260923) (not e!228295))))

(assert (=> b!317845 (= res!260923 (not (= i!999 from!855)))))

(declare-fun b!317846 () Bool)

(assert (=> b!317846 (= e!228295 (not (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 i!999) (bvsle i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))))

(assert (=> b!317846 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-datatypes ((Unit!21809 0))(
  ( (Unit!21810) )
))
(declare-fun lt!443216 () Unit!21809)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19696 array!19696 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21809)

(assert (=> b!317846 (= lt!443216 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun b!317847 () Bool)

(declare-fun res!260926 () Bool)

(assert (=> b!317847 (=> (not res!260926) (not e!228295))))

(assert (=> b!317847 (= res!260926 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(assert (= (and start!70198 res!260922) b!317847))

(assert (= (and b!317847 res!260926) b!317842))

(assert (= (and b!317842 res!260924) b!317844))

(assert (= (and b!317844 res!260927) b!317843))

(assert (= (and b!317843 res!260925) b!317845))

(assert (= (and b!317845 res!260923) b!317846))

(declare-fun m!455837 () Bool)

(assert (=> b!317842 m!455837))

(declare-fun m!455839 () Bool)

(assert (=> b!317842 m!455839))

(declare-fun m!455841 () Bool)

(assert (=> b!317846 m!455841))

(declare-fun m!455843 () Bool)

(assert (=> b!317846 m!455843))

(declare-fun m!455845 () Bool)

(assert (=> b!317846 m!455845))

(declare-fun m!455847 () Bool)

(assert (=> start!70198 m!455847))

(declare-fun m!455849 () Bool)

(assert (=> start!70198 m!455849))

(declare-fun m!455851 () Bool)

(assert (=> b!317843 m!455851))

(declare-fun m!455853 () Bool)

(assert (=> b!317847 m!455853))

(push 1)

(assert (not b!317842))

(assert (not b!317847))

(assert (not b!317843))

(assert (not b!317846))

(assert (not start!70198))

(check-sat)

(pop 1)

(push 1)

(check-sat)

