; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69904 () Bool)

(assert start!69904)

(declare-fun b!315506 () Bool)

(declare-fun res!258617 () Bool)

(declare-fun e!226896 () Bool)

(assert (=> b!315506 (=> (not res!258617) (not e!226896))))

(declare-datatypes ((array!19435 0))(
  ( (array!19436 (arr!9523 (Array (_ BitVec 32) (_ BitVec 8))) (size!8440 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19435)

(declare-fun a3!79 () array!19435)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19435 array!19435 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!315506 (= res!258617 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!315507 () Bool)

(declare-fun res!258616 () Bool)

(assert (=> b!315507 (=> (not res!258616) (not e!226896))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-fun a2!825 () array!19435)

(assert (=> b!315507 (= res!258616 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!315508 () Bool)

(declare-fun res!258611 () Bool)

(assert (=> b!315508 (=> (not res!258611) (not e!226896))))

(assert (=> b!315508 (= res!258611 (not (= i!1020 mid!82)))))

(declare-fun b!315509 () Bool)

(declare-fun res!258614 () Bool)

(assert (=> b!315509 (=> (not res!258614) (not e!226896))))

(assert (=> b!315509 (= res!258614 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!315511 () Bool)

(declare-fun res!258615 () Bool)

(assert (=> b!315511 (=> (not res!258615) (not e!226896))))

(declare-fun to!845 () (_ BitVec 64))

(assert (=> b!315511 (= res!258615 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!315512 () Bool)

(declare-fun res!258613 () Bool)

(assert (=> b!315512 (=> (not res!258613) (not e!226896))))

(assert (=> b!315512 (= res!258613 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!315513 () Bool)

(assert (=> b!315513 (= e!226896 (not (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1020) (bvslt i!1020 mid!82))))))

(assert (=> b!315513 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-datatypes ((Unit!21635 0))(
  ( (Unit!21636) )
))
(declare-fun lt!442694 () Unit!21635)

(declare-fun arrayBitRangesEqAppend!0 (array!19435 array!19435 (_ BitVec 64) (_ BitVec 64)) Unit!21635)

(assert (=> b!315513 (= lt!442694 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!315510 () Bool)

(declare-fun res!258610 () Bool)

(assert (=> b!315510 (=> (not res!258610) (not e!226896))))

(assert (=> b!315510 (= res!258610 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun res!258612 () Bool)

(assert (=> start!69904 (=> (not res!258612) (not e!226896))))

(assert (=> start!69904 (= res!258612 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8440 a1!825) (size!8440 a2!825)) (= (size!8440 a2!825) (size!8440 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8440 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8440 a2!825))))))))

(assert (=> start!69904 e!226896))

(assert (=> start!69904 true))

(declare-fun array_inv!7992 (array!19435) Bool)

(assert (=> start!69904 (array_inv!7992 a1!825)))

(assert (=> start!69904 (array_inv!7992 a3!79)))

(assert (=> start!69904 (array_inv!7992 a2!825)))

(assert (= (and start!69904 res!258612) b!315510))

(assert (= (and b!315510 res!258610) b!315511))

(assert (= (and b!315511 res!258615) b!315509))

(assert (= (and b!315509 res!258614) b!315507))

(assert (= (and b!315507 res!258616) b!315512))

(assert (= (and b!315512 res!258613) b!315506))

(assert (= (and b!315506 res!258617) b!315508))

(assert (= (and b!315508 res!258611) b!315513))

(declare-fun m!453299 () Bool)

(assert (=> b!315506 m!453299))

(declare-fun m!453301 () Bool)

(assert (=> b!315507 m!453301))

(declare-fun m!453303 () Bool)

(assert (=> start!69904 m!453303))

(declare-fun m!453305 () Bool)

(assert (=> start!69904 m!453305))

(declare-fun m!453307 () Bool)

(assert (=> start!69904 m!453307))

(declare-fun m!453309 () Bool)

(assert (=> b!315511 m!453309))

(declare-fun m!453311 () Bool)

(assert (=> b!315510 m!453311))

(declare-fun m!453313 () Bool)

(assert (=> b!315512 m!453313))

(declare-fun m!453315 () Bool)

(assert (=> b!315513 m!453315))

(declare-fun m!453317 () Bool)

(assert (=> b!315513 m!453317))

(push 1)

(assert (not b!315510))

(assert (not b!315513))

(assert (not b!315512))

(assert (not b!315506))

(assert (not b!315511))

(assert (not start!69904))

(assert (not b!315507))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

