; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69924 () Bool)

(assert start!69924)

(declare-fun b!315746 () Bool)

(declare-fun res!258851 () Bool)

(declare-fun e!227016 () Bool)

(assert (=> b!315746 (=> (not res!258851) (not e!227016))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19455 0))(
  ( (array!19456 (arr!9533 (Array (_ BitVec 32) (_ BitVec 8))) (size!8450 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19455)

(declare-fun from!878 () (_ BitVec 64))

(declare-fun a2!825 () array!19455)

(declare-fun arrayBitRangesEq!0 (array!19455 array!19455 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!315746 (= res!258851 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!315747 () Bool)

(declare-fun res!258853 () Bool)

(assert (=> b!315747 (=> (not res!258853) (not e!227016))))

(declare-fun a3!79 () array!19455)

(declare-fun to!845 () (_ BitVec 64))

(assert (=> b!315747 (= res!258853 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!315748 () Bool)

(declare-fun res!258857 () Bool)

(assert (=> b!315748 (=> (not res!258857) (not e!227016))))

(declare-fun i!1020 () (_ BitVec 64))

(assert (=> b!315748 (= res!258857 (not (= i!1020 mid!82)))))

(declare-fun b!315749 () Bool)

(declare-fun res!258855 () Bool)

(assert (=> b!315749 (=> (not res!258855) (not e!227016))))

(assert (=> b!315749 (= res!258855 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun res!258852 () Bool)

(assert (=> start!69924 (=> (not res!258852) (not e!227016))))

(assert (=> start!69924 (= res!258852 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8450 a1!825) (size!8450 a2!825)) (= (size!8450 a2!825) (size!8450 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8450 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8450 a2!825))))))))

(assert (=> start!69924 e!227016))

(assert (=> start!69924 true))

(declare-fun array_inv!8002 (array!19455) Bool)

(assert (=> start!69924 (array_inv!8002 a1!825)))

(assert (=> start!69924 (array_inv!8002 a3!79)))

(assert (=> start!69924 (array_inv!8002 a2!825)))

(declare-fun b!315750 () Bool)

(declare-fun res!258854 () Bool)

(assert (=> b!315750 (=> (not res!258854) (not e!227016))))

(assert (=> b!315750 (= res!258854 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!315751 () Bool)

(declare-fun res!258850 () Bool)

(assert (=> b!315751 (=> (not res!258850) (not e!227016))))

(assert (=> b!315751 (= res!258850 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!315752 () Bool)

(assert (=> b!315752 (= e!227016 (not true))))

(assert (=> b!315752 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-datatypes ((Unit!21655 0))(
  ( (Unit!21656) )
))
(declare-fun lt!442724 () Unit!21655)

(declare-fun arrayBitRangesEqAppend!0 (array!19455 array!19455 (_ BitVec 64) (_ BitVec 64)) Unit!21655)

(assert (=> b!315752 (= lt!442724 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!315753 () Bool)

(declare-fun res!258856 () Bool)

(assert (=> b!315753 (=> (not res!258856) (not e!227016))))

(assert (=> b!315753 (= res!258856 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(assert (= (and start!69924 res!258852) b!315746))

(assert (= (and b!315746 res!258851) b!315747))

(assert (= (and b!315747 res!258853) b!315753))

(assert (= (and b!315753 res!258856) b!315751))

(assert (= (and b!315751 res!258850) b!315750))

(assert (= (and b!315750 res!258854) b!315749))

(assert (= (and b!315749 res!258855) b!315748))

(assert (= (and b!315748 res!258857) b!315752))

(declare-fun m!453499 () Bool)

(assert (=> b!315749 m!453499))

(declare-fun m!453501 () Bool)

(assert (=> b!315750 m!453501))

(declare-fun m!453503 () Bool)

(assert (=> b!315752 m!453503))

(declare-fun m!453505 () Bool)

(assert (=> b!315752 m!453505))

(declare-fun m!453507 () Bool)

(assert (=> b!315747 m!453507))

(declare-fun m!453509 () Bool)

(assert (=> b!315751 m!453509))

(declare-fun m!453511 () Bool)

(assert (=> b!315746 m!453511))

(declare-fun m!453513 () Bool)

(assert (=> start!69924 m!453513))

(declare-fun m!453515 () Bool)

(assert (=> start!69924 m!453515))

(declare-fun m!453517 () Bool)

(assert (=> start!69924 m!453517))

(check-sat (not start!69924) (not b!315749) (not b!315750) (not b!315747) (not b!315752) (not b!315746) (not b!315751))
