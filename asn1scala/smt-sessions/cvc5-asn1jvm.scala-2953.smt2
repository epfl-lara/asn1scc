; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69916 () Bool)

(assert start!69916)

(declare-fun b!315650 () Bool)

(declare-fun e!226969 () Bool)

(assert (=> b!315650 (= e!226969 (not true))))

(declare-datatypes ((array!19447 0))(
  ( (array!19448 (arr!9529 (Array (_ BitVec 32) (_ BitVec 8))) (size!8446 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19447)

(declare-fun a3!79 () array!19447)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19447 array!19447 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!315650 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-datatypes ((Unit!21647 0))(
  ( (Unit!21648) )
))
(declare-fun lt!442712 () Unit!21647)

(declare-fun arrayBitRangesEqAppend!0 (array!19447 array!19447 (_ BitVec 64) (_ BitVec 64)) Unit!21647)

(assert (=> b!315650 (= lt!442712 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!315651 () Bool)

(declare-fun res!258759 () Bool)

(assert (=> b!315651 (=> (not res!258759) (not e!226969))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-fun a2!825 () array!19447)

(assert (=> b!315651 (= res!258759 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!315652 () Bool)

(declare-fun res!258760 () Bool)

(assert (=> b!315652 (=> (not res!258760) (not e!226969))))

(declare-fun to!845 () (_ BitVec 64))

(assert (=> b!315652 (= res!258760 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun res!258755 () Bool)

(assert (=> start!69916 (=> (not res!258755) (not e!226969))))

(assert (=> start!69916 (= res!258755 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8446 a1!825) (size!8446 a2!825)) (= (size!8446 a2!825) (size!8446 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8446 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8446 a2!825))))))))

(assert (=> start!69916 e!226969))

(assert (=> start!69916 true))

(declare-fun array_inv!7998 (array!19447) Bool)

(assert (=> start!69916 (array_inv!7998 a1!825)))

(assert (=> start!69916 (array_inv!7998 a3!79)))

(assert (=> start!69916 (array_inv!7998 a2!825)))

(declare-fun b!315653 () Bool)

(declare-fun res!258757 () Bool)

(assert (=> b!315653 (=> (not res!258757) (not e!226969))))

(assert (=> b!315653 (= res!258757 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!315654 () Bool)

(declare-fun res!258761 () Bool)

(assert (=> b!315654 (=> (not res!258761) (not e!226969))))

(assert (=> b!315654 (= res!258761 (not (= i!1020 mid!82)))))

(declare-fun b!315655 () Bool)

(declare-fun res!258756 () Bool)

(assert (=> b!315655 (=> (not res!258756) (not e!226969))))

(assert (=> b!315655 (= res!258756 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!315656 () Bool)

(declare-fun res!258754 () Bool)

(assert (=> b!315656 (=> (not res!258754) (not e!226969))))

(assert (=> b!315656 (= res!258754 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!315657 () Bool)

(declare-fun res!258758 () Bool)

(assert (=> b!315657 (=> (not res!258758) (not e!226969))))

(assert (=> b!315657 (= res!258758 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(assert (= (and start!69916 res!258755) b!315657))

(assert (= (and b!315657 res!258758) b!315655))

(assert (= (and b!315655 res!258756) b!315653))

(assert (= (and b!315653 res!258757) b!315651))

(assert (= (and b!315651 res!258759) b!315652))

(assert (= (and b!315652 res!258760) b!315656))

(assert (= (and b!315656 res!258754) b!315654))

(assert (= (and b!315654 res!258761) b!315650))

(declare-fun m!453419 () Bool)

(assert (=> b!315650 m!453419))

(declare-fun m!453421 () Bool)

(assert (=> b!315650 m!453421))

(declare-fun m!453423 () Bool)

(assert (=> start!69916 m!453423))

(declare-fun m!453425 () Bool)

(assert (=> start!69916 m!453425))

(declare-fun m!453427 () Bool)

(assert (=> start!69916 m!453427))

(declare-fun m!453429 () Bool)

(assert (=> b!315656 m!453429))

(declare-fun m!453431 () Bool)

(assert (=> b!315657 m!453431))

(declare-fun m!453433 () Bool)

(assert (=> b!315655 m!453433))

(declare-fun m!453435 () Bool)

(assert (=> b!315651 m!453435))

(declare-fun m!453437 () Bool)

(assert (=> b!315652 m!453437))

(push 1)

(assert (not b!315651))

(assert (not b!315655))

(assert (not b!315656))

(assert (not start!69916))

(assert (not b!315652))

(assert (not b!315650))

(assert (not b!315657))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

