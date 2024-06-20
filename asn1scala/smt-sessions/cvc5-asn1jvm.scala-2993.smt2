; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70192 () Bool)

(assert start!70192)

(declare-fun b!317788 () Bool)

(declare-fun e!228268 () Bool)

(declare-fun to!822 () (_ BitVec 64))

(assert (=> b!317788 (= e!228268 (not (or (not (= (bvand to!822 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!822 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((array!19690 0))(
  ( (array!19691 (arr!9652 (Array (_ BitVec 32) (_ BitVec 8))) (size!8566 (_ BitVec 32))) )
))
(declare-fun a1!748 () array!19690)

(declare-fun i!999 () (_ BitVec 64))

(declare-fun a2!748 () array!19690)

(declare-fun bitAt!0 (array!19690 (_ BitVec 64)) Bool)

(assert (=> b!317788 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun from!855 () (_ BitVec 64))

(declare-datatypes ((Unit!21803 0))(
  ( (Unit!21804) )
))
(declare-fun lt!443207 () Unit!21803)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19690 array!19690 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21803)

(assert (=> b!317788 (= lt!443207 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun b!317789 () Bool)

(declare-fun res!260871 () Bool)

(assert (=> b!317789 (=> (not res!260871) (not e!228268))))

(assert (=> b!317789 (= res!260871 (not (= i!999 from!855)))))

(declare-fun b!317790 () Bool)

(declare-fun res!260873 () Bool)

(assert (=> b!317790 (=> (not res!260873) (not e!228268))))

(assert (=> b!317790 (= res!260873 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun res!260869 () Bool)

(assert (=> start!70192 (=> (not res!260869) (not e!228268))))

(assert (=> start!70192 (= res!260869 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8566 a1!748) (size!8566 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8566 a1!748))))))))

(assert (=> start!70192 e!228268))

(assert (=> start!70192 true))

(declare-fun array_inv!8118 (array!19690) Bool)

(assert (=> start!70192 (array_inv!8118 a2!748)))

(assert (=> start!70192 (array_inv!8118 a1!748)))

(declare-fun b!317791 () Bool)

(declare-fun res!260870 () Bool)

(assert (=> b!317791 (=> (not res!260870) (not e!228268))))

(declare-fun arrayBitRangesEq!0 (array!19690 array!19690 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317791 (= res!260870 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!317792 () Bool)

(declare-fun res!260872 () Bool)

(assert (=> b!317792 (=> (not res!260872) (not e!228268))))

(assert (=> b!317792 (= res!260872 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!317793 () Bool)

(declare-fun res!260868 () Bool)

(assert (=> b!317793 (=> (not res!260868) (not e!228268))))

(assert (=> b!317793 (= res!260868 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(assert (= (and start!70192 res!260869) b!317791))

(assert (= (and b!317791 res!260870) b!317793))

(assert (= (and b!317793 res!260868) b!317790))

(assert (= (and b!317790 res!260873) b!317792))

(assert (= (and b!317792 res!260872) b!317789))

(assert (= (and b!317789 res!260871) b!317788))

(declare-fun m!455783 () Bool)

(assert (=> b!317791 m!455783))

(declare-fun m!455785 () Bool)

(assert (=> b!317788 m!455785))

(declare-fun m!455787 () Bool)

(assert (=> b!317788 m!455787))

(declare-fun m!455789 () Bool)

(assert (=> b!317788 m!455789))

(declare-fun m!455791 () Bool)

(assert (=> b!317792 m!455791))

(declare-fun m!455793 () Bool)

(assert (=> start!70192 m!455793))

(declare-fun m!455795 () Bool)

(assert (=> start!70192 m!455795))

(declare-fun m!455797 () Bool)

(assert (=> b!317793 m!455797))

(declare-fun m!455799 () Bool)

(assert (=> b!317793 m!455799))

(push 1)

(assert (not b!317788))

(assert (not b!317793))

(assert (not b!317792))

(assert (not start!70192))

(assert (not b!317791))

(check-sat)

(pop 1)

(push 1)

(check-sat)

