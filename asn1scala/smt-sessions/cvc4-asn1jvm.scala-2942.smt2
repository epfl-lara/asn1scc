; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69818 () Bool)

(assert start!69818)

(declare-fun b!314735 () Bool)

(declare-fun res!257887 () Bool)

(declare-fun e!226410 () Bool)

(assert (=> b!314735 (=> (not res!257887) (not e!226410))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!314735 (= res!257887 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!314736 () Bool)

(declare-fun res!257882 () Bool)

(assert (=> b!314736 (=> (not res!257882) (not e!226410))))

(declare-datatypes ((array!19382 0))(
  ( (array!19383 (arr!9495 (Array (_ BitVec 32) (_ BitVec 8))) (size!8415 (_ BitVec 32))) )
))
(declare-fun a3!79 () array!19382)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun a2!825 () array!19382)

(declare-fun arrayBitRangesEq!0 (array!19382 array!19382 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!314736 (= res!257882 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun res!257884 () Bool)

(assert (=> start!69818 (=> (not res!257884) (not e!226410))))

(declare-fun a1!825 () array!19382)

(assert (=> start!69818 (= res!257884 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8415 a1!825) (size!8415 a2!825)) (= (size!8415 a2!825) (size!8415 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8415 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8415 a2!825))))))))

(assert (=> start!69818 e!226410))

(assert (=> start!69818 true))

(declare-fun array_inv!7967 (array!19382) Bool)

(assert (=> start!69818 (array_inv!7967 a1!825)))

(assert (=> start!69818 (array_inv!7967 a3!79)))

(assert (=> start!69818 (array_inv!7967 a2!825)))

(declare-fun b!314737 () Bool)

(declare-fun res!257881 () Bool)

(assert (=> b!314737 (=> (not res!257881) (not e!226410))))

(assert (=> b!314737 (= res!257881 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314738 () Bool)

(declare-fun res!257888 () Bool)

(assert (=> b!314738 (=> (not res!257888) (not e!226410))))

(assert (=> b!314738 (= res!257888 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!314739 () Bool)

(declare-fun res!257886 () Bool)

(assert (=> b!314739 (=> (not res!257886) (not e!226410))))

(assert (=> b!314739 (= res!257886 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!314740 () Bool)

(declare-fun res!257885 () Bool)

(assert (=> b!314740 (=> (not res!257885) (not e!226410))))

(assert (=> b!314740 (= res!257885 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!314741 () Bool)

(declare-fun res!257883 () Bool)

(assert (=> b!314741 (=> (not res!257883) (not e!226410))))

(assert (=> b!314741 (= res!257883 (not (= i!1020 mid!82)))))

(declare-fun b!314742 () Bool)

(assert (=> b!314742 (= e!226410 (not true))))

(assert (=> b!314742 (arrayBitRangesEq!0 a2!825 a3!79 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) to!845)))

(declare-datatypes ((Unit!21621 0))(
  ( (Unit!21622) )
))
(declare-fun lt!442554 () Unit!21621)

(declare-fun arrayBitRangesEqDrop1!0 (array!19382 array!19382 (_ BitVec 64) (_ BitVec 64)) Unit!21621)

(assert (=> b!314742 (= lt!442554 (arrayBitRangesEqDrop1!0 a2!825 a3!79 i!1020 to!845))))

(assert (=> b!314742 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-fun lt!442556 () Unit!21621)

(assert (=> b!314742 (= lt!442556 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!314742 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442555 () Unit!21621)

(declare-fun arrayBitRangesEqAppend!0 (array!19382 array!19382 (_ BitVec 64) (_ BitVec 64)) Unit!21621)

(assert (=> b!314742 (= lt!442555 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(assert (= (and start!69818 res!257884) b!314739))

(assert (= (and b!314739 res!257886) b!314736))

(assert (= (and b!314736 res!257882) b!314735))

(assert (= (and b!314735 res!257887) b!314740))

(assert (= (and b!314740 res!257885) b!314738))

(assert (= (and b!314738 res!257888) b!314737))

(assert (= (and b!314737 res!257881) b!314741))

(assert (= (and b!314741 res!257883) b!314742))

(declare-fun m!452329 () Bool)

(assert (=> b!314738 m!452329))

(declare-fun m!452331 () Bool)

(assert (=> b!314740 m!452331))

(declare-fun m!452333 () Bool)

(assert (=> b!314742 m!452333))

(declare-fun m!452335 () Bool)

(assert (=> b!314742 m!452335))

(declare-fun m!452337 () Bool)

(assert (=> b!314742 m!452337))

(declare-fun m!452339 () Bool)

(assert (=> b!314742 m!452339))

(declare-fun m!452341 () Bool)

(assert (=> b!314742 m!452341))

(declare-fun m!452343 () Bool)

(assert (=> b!314742 m!452343))

(declare-fun m!452345 () Bool)

(assert (=> b!314736 m!452345))

(declare-fun m!452347 () Bool)

(assert (=> b!314737 m!452347))

(declare-fun m!452349 () Bool)

(assert (=> b!314739 m!452349))

(declare-fun m!452351 () Bool)

(assert (=> start!69818 m!452351))

(declare-fun m!452353 () Bool)

(assert (=> start!69818 m!452353))

(declare-fun m!452355 () Bool)

(assert (=> start!69818 m!452355))

(push 1)

(assert (not b!314742))

(assert (not start!69818))

(assert (not b!314739))

(assert (not b!314738))

(assert (not b!314740))

(assert (not b!314737))

(assert (not b!314736))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

