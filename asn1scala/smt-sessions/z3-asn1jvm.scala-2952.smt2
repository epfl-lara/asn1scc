; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69912 () Bool)

(assert start!69912)

(declare-fun b!315602 () Bool)

(declare-fun res!258707 () Bool)

(declare-fun e!226945 () Bool)

(assert (=> b!315602 (=> (not res!258707) (not e!226945))))

(declare-datatypes ((array!19443 0))(
  ( (array!19444 (arr!9527 (Array (_ BitVec 32) (_ BitVec 8))) (size!8444 (_ BitVec 32))) )
))
(declare-fun a3!79 () array!19443)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun a2!825 () array!19443)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19443 array!19443 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!315602 (= res!258707 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!315603 () Bool)

(declare-fun res!258713 () Bool)

(assert (=> b!315603 (=> (not res!258713) (not e!226945))))

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!315603 (= res!258713 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!315604 () Bool)

(declare-fun res!258712 () Bool)

(assert (=> b!315604 (=> (not res!258712) (not e!226945))))

(declare-fun mid!82 () (_ BitVec 64))

(assert (=> b!315604 (= res!258712 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!315605 () Bool)

(declare-fun res!258706 () Bool)

(assert (=> b!315605 (=> (not res!258706) (not e!226945))))

(declare-fun a1!825 () array!19443)

(assert (=> b!315605 (= res!258706 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!315606 () Bool)

(assert (=> b!315606 (= e!226945 (not true))))

(assert (=> b!315606 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-datatypes ((Unit!21643 0))(
  ( (Unit!21644) )
))
(declare-fun lt!442706 () Unit!21643)

(declare-fun arrayBitRangesEqAppend!0 (array!19443 array!19443 (_ BitVec 64) (_ BitVec 64)) Unit!21643)

(assert (=> b!315606 (= lt!442706 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!315607 () Bool)

(declare-fun res!258711 () Bool)

(assert (=> b!315607 (=> (not res!258711) (not e!226945))))

(assert (=> b!315607 (= res!258711 (not (= i!1020 mid!82)))))

(declare-fun res!258709 () Bool)

(assert (=> start!69912 (=> (not res!258709) (not e!226945))))

(assert (=> start!69912 (= res!258709 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8444 a1!825) (size!8444 a2!825)) (= (size!8444 a2!825) (size!8444 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8444 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8444 a2!825))))))))

(assert (=> start!69912 e!226945))

(assert (=> start!69912 true))

(declare-fun array_inv!7996 (array!19443) Bool)

(assert (=> start!69912 (array_inv!7996 a1!825)))

(assert (=> start!69912 (array_inv!7996 a3!79)))

(assert (=> start!69912 (array_inv!7996 a2!825)))

(declare-fun b!315608 () Bool)

(declare-fun res!258710 () Bool)

(assert (=> b!315608 (=> (not res!258710) (not e!226945))))

(assert (=> b!315608 (= res!258710 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!315609 () Bool)

(declare-fun res!258708 () Bool)

(assert (=> b!315609 (=> (not res!258708) (not e!226945))))

(assert (=> b!315609 (= res!258708 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(assert (= (and start!69912 res!258709) b!315609))

(assert (= (and b!315609 res!258708) b!315603))

(assert (= (and b!315603 res!258713) b!315604))

(assert (= (and b!315604 res!258712) b!315608))

(assert (= (and b!315608 res!258710) b!315602))

(assert (= (and b!315602 res!258707) b!315605))

(assert (= (and b!315605 res!258706) b!315607))

(assert (= (and b!315607 res!258711) b!315606))

(declare-fun m!453379 () Bool)

(assert (=> start!69912 m!453379))

(declare-fun m!453381 () Bool)

(assert (=> start!69912 m!453381))

(declare-fun m!453383 () Bool)

(assert (=> start!69912 m!453383))

(declare-fun m!453385 () Bool)

(assert (=> b!315605 m!453385))

(declare-fun m!453387 () Bool)

(assert (=> b!315609 m!453387))

(declare-fun m!453389 () Bool)

(assert (=> b!315602 m!453389))

(declare-fun m!453391 () Bool)

(assert (=> b!315603 m!453391))

(declare-fun m!453393 () Bool)

(assert (=> b!315608 m!453393))

(declare-fun m!453395 () Bool)

(assert (=> b!315606 m!453395))

(declare-fun m!453397 () Bool)

(assert (=> b!315606 m!453397))

(check-sat (not start!69912) (not b!315609) (not b!315602) (not b!315608) (not b!315603) (not b!315605) (not b!315606))
