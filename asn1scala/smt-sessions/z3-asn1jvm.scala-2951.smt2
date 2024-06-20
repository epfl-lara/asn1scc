; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69906 () Bool)

(assert start!69906)

(declare-fun b!315530 () Bool)

(declare-fun res!258641 () Bool)

(declare-fun e!226906 () Bool)

(assert (=> b!315530 (=> (not res!258641) (not e!226906))))

(declare-datatypes ((array!19437 0))(
  ( (array!19438 (arr!9524 (Array (_ BitVec 32) (_ BitVec 8))) (size!8441 (_ BitVec 32))) )
))
(declare-fun a3!79 () array!19437)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun a2!825 () array!19437)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19437 array!19437 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!315530 (= res!258641 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!315531 () Bool)

(declare-fun res!258637 () Bool)

(assert (=> b!315531 (=> (not res!258637) (not e!226906))))

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!315531 (= res!258637 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!315532 () Bool)

(declare-fun res!258640 () Bool)

(assert (=> b!315532 (=> (not res!258640) (not e!226906))))

(declare-fun a1!825 () array!19437)

(assert (=> b!315532 (= res!258640 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!315533 () Bool)

(declare-fun res!258636 () Bool)

(assert (=> b!315533 (=> (not res!258636) (not e!226906))))

(declare-fun mid!82 () (_ BitVec 64))

(assert (=> b!315533 (= res!258636 (not (= i!1020 mid!82)))))

(declare-fun b!315534 () Bool)

(declare-fun res!258638 () Bool)

(assert (=> b!315534 (=> (not res!258638) (not e!226906))))

(assert (=> b!315534 (= res!258638 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!315535 () Bool)

(declare-fun res!258634 () Bool)

(assert (=> b!315535 (=> (not res!258634) (not e!226906))))

(assert (=> b!315535 (= res!258634 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun res!258635 () Bool)

(assert (=> start!69906 (=> (not res!258635) (not e!226906))))

(assert (=> start!69906 (= res!258635 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8441 a1!825) (size!8441 a2!825)) (= (size!8441 a2!825) (size!8441 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8441 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8441 a2!825))))))))

(assert (=> start!69906 e!226906))

(assert (=> start!69906 true))

(declare-fun array_inv!7993 (array!19437) Bool)

(assert (=> start!69906 (array_inv!7993 a1!825)))

(assert (=> start!69906 (array_inv!7993 a3!79)))

(assert (=> start!69906 (array_inv!7993 a2!825)))

(declare-fun b!315536 () Bool)

(declare-fun res!258639 () Bool)

(assert (=> b!315536 (=> (not res!258639) (not e!226906))))

(assert (=> b!315536 (= res!258639 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!315537 () Bool)

(assert (=> b!315537 (= e!226906 (not (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1020) (bvslt i!1020 mid!82))))))

(assert (=> b!315537 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-datatypes ((Unit!21637 0))(
  ( (Unit!21638) )
))
(declare-fun lt!442697 () Unit!21637)

(declare-fun arrayBitRangesEqAppend!0 (array!19437 array!19437 (_ BitVec 64) (_ BitVec 64)) Unit!21637)

(assert (=> b!315537 (= lt!442697 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(assert (= (and start!69906 res!258635) b!315536))

(assert (= (and b!315536 res!258639) b!315531))

(assert (= (and b!315531 res!258637) b!315535))

(assert (= (and b!315535 res!258634) b!315534))

(assert (= (and b!315534 res!258638) b!315530))

(assert (= (and b!315530 res!258641) b!315532))

(assert (= (and b!315532 res!258640) b!315533))

(assert (= (and b!315533 res!258636) b!315537))

(declare-fun m!453319 () Bool)

(assert (=> b!315532 m!453319))

(declare-fun m!453321 () Bool)

(assert (=> b!315534 m!453321))

(declare-fun m!453323 () Bool)

(assert (=> b!315531 m!453323))

(declare-fun m!453325 () Bool)

(assert (=> b!315537 m!453325))

(declare-fun m!453327 () Bool)

(assert (=> b!315537 m!453327))

(declare-fun m!453329 () Bool)

(assert (=> b!315536 m!453329))

(declare-fun m!453331 () Bool)

(assert (=> b!315530 m!453331))

(declare-fun m!453333 () Bool)

(assert (=> start!69906 m!453333))

(declare-fun m!453335 () Bool)

(assert (=> start!69906 m!453335))

(declare-fun m!453337 () Bool)

(assert (=> start!69906 m!453337))

(check-sat (not b!315531) (not b!315536) (not b!315530) (not b!315537) (not start!69906) (not b!315534) (not b!315532))
(check-sat)
