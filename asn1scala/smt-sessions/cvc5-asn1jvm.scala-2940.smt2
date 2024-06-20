; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69802 () Bool)

(assert start!69802)

(declare-fun b!314543 () Bool)

(declare-fun res!257696 () Bool)

(declare-fun e!226315 () Bool)

(assert (=> b!314543 (=> (not res!257696) (not e!226315))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19366 0))(
  ( (array!19367 (arr!9487 (Array (_ BitVec 32) (_ BitVec 8))) (size!8407 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19366)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun a2!825 () array!19366)

(declare-fun arrayBitRangesEq!0 (array!19366 array!19366 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!314543 (= res!257696 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!314544 () Bool)

(declare-fun res!257689 () Bool)

(assert (=> b!314544 (=> (not res!257689) (not e!226315))))

(assert (=> b!314544 (= res!257689 (not (= i!1020 mid!82)))))

(declare-fun b!314545 () Bool)

(declare-fun res!257690 () Bool)

(assert (=> b!314545 (=> (not res!257690) (not e!226315))))

(declare-fun to!845 () (_ BitVec 64))

(declare-fun a3!79 () array!19366)

(assert (=> b!314545 (= res!257690 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!314546 () Bool)

(assert (=> b!314546 (= e!226315 (not true))))

(assert (=> b!314546 (arrayBitRangesEq!0 a2!825 a3!79 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) to!845)))

(declare-datatypes ((Unit!21605 0))(
  ( (Unit!21606) )
))
(declare-fun lt!442484 () Unit!21605)

(declare-fun arrayBitRangesEqDrop1!0 (array!19366 array!19366 (_ BitVec 64) (_ BitVec 64)) Unit!21605)

(assert (=> b!314546 (= lt!442484 (arrayBitRangesEqDrop1!0 a2!825 a3!79 i!1020 to!845))))

(assert (=> b!314546 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-fun lt!442483 () Unit!21605)

(assert (=> b!314546 (= lt!442483 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!314546 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442482 () Unit!21605)

(declare-fun arrayBitRangesEqAppend!0 (array!19366 array!19366 (_ BitVec 64) (_ BitVec 64)) Unit!21605)

(assert (=> b!314546 (= lt!442482 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314547 () Bool)

(declare-fun res!257694 () Bool)

(assert (=> b!314547 (=> (not res!257694) (not e!226315))))

(assert (=> b!314547 (= res!257694 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!314548 () Bool)

(declare-fun res!257695 () Bool)

(assert (=> b!314548 (=> (not res!257695) (not e!226315))))

(assert (=> b!314548 (= res!257695 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun res!257692 () Bool)

(assert (=> start!69802 (=> (not res!257692) (not e!226315))))

(assert (=> start!69802 (= res!257692 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8407 a1!825) (size!8407 a2!825)) (= (size!8407 a2!825) (size!8407 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8407 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8407 a2!825))))))))

(assert (=> start!69802 e!226315))

(assert (=> start!69802 true))

(declare-fun array_inv!7959 (array!19366) Bool)

(assert (=> start!69802 (array_inv!7959 a1!825)))

(assert (=> start!69802 (array_inv!7959 a3!79)))

(assert (=> start!69802 (array_inv!7959 a2!825)))

(declare-fun b!314549 () Bool)

(declare-fun res!257691 () Bool)

(assert (=> b!314549 (=> (not res!257691) (not e!226315))))

(assert (=> b!314549 (= res!257691 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!314550 () Bool)

(declare-fun res!257693 () Bool)

(assert (=> b!314550 (=> (not res!257693) (not e!226315))))

(assert (=> b!314550 (= res!257693 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(assert (= (and start!69802 res!257692) b!314549))

(assert (= (and b!314549 res!257691) b!314548))

(assert (= (and b!314548 res!257695) b!314547))

(assert (= (and b!314547 res!257694) b!314543))

(assert (= (and b!314543 res!257696) b!314545))

(assert (= (and b!314545 res!257690) b!314550))

(assert (= (and b!314550 res!257693) b!314544))

(assert (= (and b!314544 res!257689) b!314546))

(declare-fun m!452105 () Bool)

(assert (=> b!314543 m!452105))

(declare-fun m!452107 () Bool)

(assert (=> b!314550 m!452107))

(declare-fun m!452109 () Bool)

(assert (=> b!314549 m!452109))

(declare-fun m!452111 () Bool)

(assert (=> b!314548 m!452111))

(declare-fun m!452113 () Bool)

(assert (=> b!314546 m!452113))

(declare-fun m!452115 () Bool)

(assert (=> b!314546 m!452115))

(declare-fun m!452117 () Bool)

(assert (=> b!314546 m!452117))

(declare-fun m!452119 () Bool)

(assert (=> b!314546 m!452119))

(declare-fun m!452121 () Bool)

(assert (=> b!314546 m!452121))

(declare-fun m!452123 () Bool)

(assert (=> b!314546 m!452123))

(declare-fun m!452125 () Bool)

(assert (=> b!314545 m!452125))

(declare-fun m!452127 () Bool)

(assert (=> start!69802 m!452127))

(declare-fun m!452129 () Bool)

(assert (=> start!69802 m!452129))

(declare-fun m!452131 () Bool)

(assert (=> start!69802 m!452131))

(push 1)

(assert (not b!314546))

(assert (not b!314543))

(assert (not start!69802))

(assert (not b!314548))

(assert (not b!314545))

(assert (not b!314549))

(assert (not b!314550))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

