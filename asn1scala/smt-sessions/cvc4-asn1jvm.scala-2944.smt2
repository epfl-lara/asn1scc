; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69830 () Bool)

(assert start!69830)

(declare-fun b!314896 () Bool)

(declare-fun res!258046 () Bool)

(declare-fun e!226499 () Bool)

(assert (=> b!314896 (=> (not res!258046) (not e!226499))))

(declare-datatypes ((array!19394 0))(
  ( (array!19395 (arr!9501 (Array (_ BitVec 32) (_ BitVec 8))) (size!8421 (_ BitVec 32))) )
))
(declare-fun a3!79 () array!19394)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(declare-fun a2!825 () array!19394)

(declare-fun arrayBitRangesEq!0 (array!19394 array!19394 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!314896 (= res!258046 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!314897 () Bool)

(declare-fun res!258045 () Bool)

(assert (=> b!314897 (=> (not res!258045) (not e!226499))))

(declare-fun a1!825 () array!19394)

(declare-fun i!1020 () (_ BitVec 64))

(assert (=> b!314897 (= res!258045 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314898 () Bool)

(declare-fun res!258050 () Bool)

(assert (=> b!314898 (=> (not res!258050) (not e!226499))))

(declare-fun mid!82 () (_ BitVec 64))

(assert (=> b!314898 (= res!258050 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!314899 () Bool)

(declare-fun res!258049 () Bool)

(assert (=> b!314899 (=> (not res!258049) (not e!226499))))

(assert (=> b!314899 (= res!258049 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun res!258042 () Bool)

(assert (=> start!69830 (=> (not res!258042) (not e!226499))))

(assert (=> start!69830 (= res!258042 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8421 a1!825) (size!8421 a2!825)) (= (size!8421 a2!825) (size!8421 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8421 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8421 a2!825))))))))

(assert (=> start!69830 e!226499))

(assert (=> start!69830 true))

(declare-fun array_inv!7973 (array!19394) Bool)

(assert (=> start!69830 (array_inv!7973 a1!825)))

(assert (=> start!69830 (array_inv!7973 a3!79)))

(assert (=> start!69830 (array_inv!7973 a2!825)))

(declare-fun b!314900 () Bool)

(declare-fun e!226497 () Bool)

(assert (=> b!314900 (= e!226497 true)))

(assert (=> b!314900 (arrayBitRangesEq!0 a1!825 a3!79 from!878 mid!82)))

(declare-datatypes ((Unit!21633 0))(
  ( (Unit!21634) )
))
(declare-fun lt!442628 () Unit!21633)

(declare-fun rec!20 (array!19394 array!19394 array!19394 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21633)

(assert (=> b!314900 (= lt!442628 (rec!20 a1!825 a2!825 a3!79 from!878 mid!82 to!845 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020)))))

(declare-fun b!314901 () Bool)

(declare-fun res!258044 () Bool)

(assert (=> b!314901 (=> (not res!258044) (not e!226499))))

(assert (=> b!314901 (= res!258044 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!314902 () Bool)

(assert (=> b!314902 (= e!226499 (not e!226497))))

(declare-fun res!258048 () Bool)

(assert (=> b!314902 (=> res!258048 e!226497)))

(assert (=> b!314902 (= res!258048 (or (bvsgt from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020)) (bvsgt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))))

(assert (=> b!314902 (arrayBitRangesEq!0 a2!825 a3!79 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) to!845)))

(declare-fun lt!442625 () Unit!21633)

(declare-fun arrayBitRangesEqDrop1!0 (array!19394 array!19394 (_ BitVec 64) (_ BitVec 64)) Unit!21633)

(assert (=> b!314902 (= lt!442625 (arrayBitRangesEqDrop1!0 a2!825 a3!79 i!1020 to!845))))

(assert (=> b!314902 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-fun lt!442626 () Unit!21633)

(assert (=> b!314902 (= lt!442626 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!314902 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442627 () Unit!21633)

(declare-fun arrayBitRangesEqAppend!0 (array!19394 array!19394 (_ BitVec 64) (_ BitVec 64)) Unit!21633)

(assert (=> b!314902 (= lt!442627 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314903 () Bool)

(declare-fun res!258043 () Bool)

(assert (=> b!314903 (=> (not res!258043) (not e!226499))))

(assert (=> b!314903 (= res!258043 (not (= i!1020 mid!82)))))

(declare-fun b!314904 () Bool)

(declare-fun res!258047 () Bool)

(assert (=> b!314904 (=> (not res!258047) (not e!226499))))

(assert (=> b!314904 (= res!258047 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(assert (= (and start!69830 res!258042) b!314904))

(assert (= (and b!314904 res!258047) b!314896))

(assert (= (and b!314896 res!258046) b!314899))

(assert (= (and b!314899 res!258049) b!314898))

(assert (= (and b!314898 res!258050) b!314901))

(assert (= (and b!314901 res!258044) b!314897))

(assert (= (and b!314897 res!258045) b!314903))

(assert (= (and b!314903 res!258043) b!314902))

(assert (= (and b!314902 (not res!258048)) b!314900))

(declare-fun m!452517 () Bool)

(assert (=> b!314900 m!452517))

(declare-fun m!452519 () Bool)

(assert (=> b!314900 m!452519))

(declare-fun m!452521 () Bool)

(assert (=> start!69830 m!452521))

(declare-fun m!452523 () Bool)

(assert (=> start!69830 m!452523))

(declare-fun m!452525 () Bool)

(assert (=> start!69830 m!452525))

(declare-fun m!452527 () Bool)

(assert (=> b!314904 m!452527))

(declare-fun m!452529 () Bool)

(assert (=> b!314898 m!452529))

(declare-fun m!452531 () Bool)

(assert (=> b!314901 m!452531))

(declare-fun m!452533 () Bool)

(assert (=> b!314902 m!452533))

(declare-fun m!452535 () Bool)

(assert (=> b!314902 m!452535))

(declare-fun m!452537 () Bool)

(assert (=> b!314902 m!452537))

(declare-fun m!452539 () Bool)

(assert (=> b!314902 m!452539))

(declare-fun m!452541 () Bool)

(assert (=> b!314902 m!452541))

(declare-fun m!452543 () Bool)

(assert (=> b!314902 m!452543))

(declare-fun m!452545 () Bool)

(assert (=> b!314897 m!452545))

(declare-fun m!452547 () Bool)

(assert (=> b!314896 m!452547))

(push 1)

(assert (not b!314898))

(assert (not b!314900))

(assert (not b!314896))

(assert (not start!69830))

(assert (not b!314904))

(assert (not b!314897))

(assert (not b!314902))

(assert (not b!314901))

(check-sat)

(pop 1)

(push 1)

(check-sat)

