; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69800 () Bool)

(assert start!69800)

(declare-fun res!257667 () Bool)

(declare-fun e!226300 () Bool)

(assert (=> start!69800 (=> (not res!257667) (not e!226300))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19364 0))(
  ( (array!19365 (arr!9486 (Array (_ BitVec 32) (_ BitVec 8))) (size!8406 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19364)

(declare-fun a3!79 () array!19364)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(declare-fun a2!825 () array!19364)

(assert (=> start!69800 (= res!257667 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8406 a1!825) (size!8406 a2!825)) (= (size!8406 a2!825) (size!8406 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8406 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8406 a2!825))))))))

(assert (=> start!69800 e!226300))

(assert (=> start!69800 true))

(declare-fun array_inv!7958 (array!19364) Bool)

(assert (=> start!69800 (array_inv!7958 a1!825)))

(assert (=> start!69800 (array_inv!7958 a3!79)))

(assert (=> start!69800 (array_inv!7958 a2!825)))

(declare-fun b!314519 () Bool)

(declare-fun res!257668 () Bool)

(assert (=> b!314519 (=> (not res!257668) (not e!226300))))

(declare-fun i!1020 () (_ BitVec 64))

(assert (=> b!314519 (= res!257668 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!314520 () Bool)

(declare-fun res!257671 () Bool)

(assert (=> b!314520 (=> (not res!257671) (not e!226300))))

(declare-fun arrayBitRangesEq!0 (array!19364 array!19364 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!314520 (= res!257671 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!314521 () Bool)

(declare-fun res!257665 () Bool)

(assert (=> b!314521 (=> (not res!257665) (not e!226300))))

(assert (=> b!314521 (= res!257665 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!314522 () Bool)

(declare-fun res!257666 () Bool)

(assert (=> b!314522 (=> (not res!257666) (not e!226300))))

(assert (=> b!314522 (= res!257666 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314523 () Bool)

(declare-fun res!257670 () Bool)

(assert (=> b!314523 (=> (not res!257670) (not e!226300))))

(assert (=> b!314523 (= res!257670 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!314524 () Bool)

(declare-fun res!257669 () Bool)

(assert (=> b!314524 (=> (not res!257669) (not e!226300))))

(assert (=> b!314524 (= res!257669 (not (= i!1020 mid!82)))))

(declare-fun b!314525 () Bool)

(declare-fun res!257672 () Bool)

(assert (=> b!314525 (=> (not res!257672) (not e!226300))))

(assert (=> b!314525 (= res!257672 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!314526 () Bool)

(assert (=> b!314526 (= e!226300 (not true))))

(assert (=> b!314526 (arrayBitRangesEq!0 a2!825 a3!79 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) to!845)))

(declare-datatypes ((Unit!21603 0))(
  ( (Unit!21604) )
))
(declare-fun lt!442473 () Unit!21603)

(declare-fun arrayBitRangesEqDrop1!0 (array!19364 array!19364 (_ BitVec 64) (_ BitVec 64)) Unit!21603)

(assert (=> b!314526 (= lt!442473 (arrayBitRangesEqDrop1!0 a2!825 a3!79 i!1020 to!845))))

(assert (=> b!314526 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-fun lt!442475 () Unit!21603)

(assert (=> b!314526 (= lt!442475 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!314526 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442474 () Unit!21603)

(declare-fun arrayBitRangesEqAppend!0 (array!19364 array!19364 (_ BitVec 64) (_ BitVec 64)) Unit!21603)

(assert (=> b!314526 (= lt!442474 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(assert (= (and start!69800 res!257667) b!314523))

(assert (= (and b!314523 res!257670) b!314520))

(assert (= (and b!314520 res!257671) b!314519))

(assert (= (and b!314519 res!257668) b!314521))

(assert (= (and b!314521 res!257665) b!314525))

(assert (= (and b!314525 res!257672) b!314522))

(assert (= (and b!314522 res!257666) b!314524))

(assert (= (and b!314524 res!257669) b!314526))

(declare-fun m!452077 () Bool)

(assert (=> b!314525 m!452077))

(declare-fun m!452079 () Bool)

(assert (=> start!69800 m!452079))

(declare-fun m!452081 () Bool)

(assert (=> start!69800 m!452081))

(declare-fun m!452083 () Bool)

(assert (=> start!69800 m!452083))

(declare-fun m!452085 () Bool)

(assert (=> b!314522 m!452085))

(declare-fun m!452087 () Bool)

(assert (=> b!314526 m!452087))

(declare-fun m!452089 () Bool)

(assert (=> b!314526 m!452089))

(declare-fun m!452091 () Bool)

(assert (=> b!314526 m!452091))

(declare-fun m!452093 () Bool)

(assert (=> b!314526 m!452093))

(declare-fun m!452095 () Bool)

(assert (=> b!314526 m!452095))

(declare-fun m!452097 () Bool)

(assert (=> b!314526 m!452097))

(declare-fun m!452099 () Bool)

(assert (=> b!314521 m!452099))

(declare-fun m!452101 () Bool)

(assert (=> b!314523 m!452101))

(declare-fun m!452103 () Bool)

(assert (=> b!314520 m!452103))

(push 1)

