; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69824 () Bool)

(assert start!69824)

(declare-fun b!314815 () Bool)

(declare-fun res!257964 () Bool)

(declare-fun e!226452 () Bool)

(assert (=> b!314815 (=> (not res!257964) (not e!226452))))

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun mid!82 () (_ BitVec 64))

(assert (=> b!314815 (= res!257964 (not (= i!1020 mid!82)))))

(declare-fun b!314816 () Bool)

(declare-fun e!226453 () Bool)

(declare-datatypes ((array!19388 0))(
  ( (array!19389 (arr!9498 (Array (_ BitVec 32) (_ BitVec 8))) (size!8418 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19388)

(declare-fun a3!79 () array!19388)

(assert (=> b!314816 (= e!226453 (bvsle (size!8418 a1!825) (size!8418 a3!79)))))

(declare-fun from!878 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19388 array!19388 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!314816 (arrayBitRangesEq!0 a1!825 a3!79 from!878 mid!82)))

(declare-datatypes ((Unit!21627 0))(
  ( (Unit!21628) )
))
(declare-fun lt!442589 () Unit!21627)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun a2!825 () array!19388)

(declare-fun rec!20 (array!19388 array!19388 array!19388 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21627)

(assert (=> b!314816 (= lt!442589 (rec!20 a1!825 a2!825 a3!79 from!878 mid!82 to!845 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020)))))

(declare-fun b!314817 () Bool)

(declare-fun res!257962 () Bool)

(assert (=> b!314817 (=> (not res!257962) (not e!226452))))

(assert (=> b!314817 (= res!257962 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!314818 () Bool)

(declare-fun res!257967 () Bool)

(assert (=> b!314818 (=> (not res!257967) (not e!226452))))

(assert (=> b!314818 (= res!257967 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!314819 () Bool)

(assert (=> b!314819 (= e!226452 (not e!226453))))

(declare-fun res!257965 () Bool)

(assert (=> b!314819 (=> res!257965 e!226453)))

(assert (=> b!314819 (= res!257965 (or (bvsgt from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020)) (bvsgt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))))

(assert (=> b!314819 (arrayBitRangesEq!0 a2!825 a3!79 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) to!845)))

(declare-fun lt!442590 () Unit!21627)

(declare-fun arrayBitRangesEqDrop1!0 (array!19388 array!19388 (_ BitVec 64) (_ BitVec 64)) Unit!21627)

(assert (=> b!314819 (= lt!442590 (arrayBitRangesEqDrop1!0 a2!825 a3!79 i!1020 to!845))))

(assert (=> b!314819 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-fun lt!442592 () Unit!21627)

(assert (=> b!314819 (= lt!442592 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!314819 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442591 () Unit!21627)

(declare-fun arrayBitRangesEqAppend!0 (array!19388 array!19388 (_ BitVec 64) (_ BitVec 64)) Unit!21627)

(assert (=> b!314819 (= lt!442591 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314820 () Bool)

(declare-fun res!257963 () Bool)

(assert (=> b!314820 (=> (not res!257963) (not e!226452))))

(assert (=> b!314820 (= res!257963 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314822 () Bool)

(declare-fun res!257969 () Bool)

(assert (=> b!314822 (=> (not res!257969) (not e!226452))))

(assert (=> b!314822 (= res!257969 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!314823 () Bool)

(declare-fun res!257966 () Bool)

(assert (=> b!314823 (=> (not res!257966) (not e!226452))))

(assert (=> b!314823 (= res!257966 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!314821 () Bool)

(declare-fun res!257968 () Bool)

(assert (=> b!314821 (=> (not res!257968) (not e!226452))))

(assert (=> b!314821 (= res!257968 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun res!257961 () Bool)

(assert (=> start!69824 (=> (not res!257961) (not e!226452))))

(assert (=> start!69824 (= res!257961 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8418 a1!825) (size!8418 a2!825)) (= (size!8418 a2!825) (size!8418 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8418 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8418 a2!825))))))))

(assert (=> start!69824 e!226452))

(assert (=> start!69824 true))

(declare-fun array_inv!7970 (array!19388) Bool)

(assert (=> start!69824 (array_inv!7970 a1!825)))

(assert (=> start!69824 (array_inv!7970 a3!79)))

(assert (=> start!69824 (array_inv!7970 a2!825)))

(assert (= (and start!69824 res!257961) b!314822))

(assert (= (and b!314822 res!257969) b!314823))

(assert (= (and b!314823 res!257966) b!314817))

(assert (= (and b!314817 res!257962) b!314818))

(assert (= (and b!314818 res!257967) b!314821))

(assert (= (and b!314821 res!257968) b!314820))

(assert (= (and b!314820 res!257963) b!314815))

(assert (= (and b!314815 res!257964) b!314819))

(assert (= (and b!314819 (not res!257965)) b!314816))

(declare-fun m!452421 () Bool)

(assert (=> b!314819 m!452421))

(declare-fun m!452423 () Bool)

(assert (=> b!314819 m!452423))

(declare-fun m!452425 () Bool)

(assert (=> b!314819 m!452425))

(declare-fun m!452427 () Bool)

(assert (=> b!314819 m!452427))

(declare-fun m!452429 () Bool)

(assert (=> b!314819 m!452429))

(declare-fun m!452431 () Bool)

(assert (=> b!314819 m!452431))

(declare-fun m!452433 () Bool)

(assert (=> b!314816 m!452433))

(declare-fun m!452435 () Bool)

(assert (=> b!314816 m!452435))

(declare-fun m!452437 () Bool)

(assert (=> start!69824 m!452437))

(declare-fun m!452439 () Bool)

(assert (=> start!69824 m!452439))

(declare-fun m!452441 () Bool)

(assert (=> start!69824 m!452441))

(declare-fun m!452443 () Bool)

(assert (=> b!314820 m!452443))

(declare-fun m!452445 () Bool)

(assert (=> b!314823 m!452445))

(declare-fun m!452447 () Bool)

(assert (=> b!314822 m!452447))

(declare-fun m!452449 () Bool)

(assert (=> b!314818 m!452449))

(declare-fun m!452451 () Bool)

(assert (=> b!314821 m!452451))

(push 1)

(assert (not b!314820))

(assert (not b!314819))

(assert (not b!314823))

(assert (not b!314818))

(assert (not b!314822))

(assert (not b!314816))

(assert (not b!314821))

(assert (not start!69824))

(check-sat)

(pop 1)

(push 1)

(check-sat)

