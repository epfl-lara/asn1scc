; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69804 () Bool)

(assert start!69804)

(declare-fun b!314568 () Bool)

(declare-fun res!257719 () Bool)

(declare-fun e!226326 () Bool)

(assert (=> b!314568 (=> (not res!257719) (not e!226326))))

(declare-datatypes ((array!19368 0))(
  ( (array!19369 (arr!9488 (Array (_ BitVec 32) (_ BitVec 8))) (size!8408 (_ BitVec 32))) )
))
(declare-fun a3!79 () array!19368)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun to!845 () (_ BitVec 64))

(declare-fun a2!825 () array!19368)

(declare-fun arrayBitRangesEq!0 (array!19368 array!19368 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!314568 (= res!257719 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!314569 () Bool)

(declare-fun res!257715 () Bool)

(assert (=> b!314569 (=> (not res!257715) (not e!226326))))

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!314569 (= res!257715 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!314570 () Bool)

(declare-fun res!257717 () Bool)

(assert (=> b!314570 (=> (not res!257717) (not e!226326))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-fun a1!825 () array!19368)

(assert (=> b!314570 (= res!257717 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!314571 () Bool)

(declare-fun res!257718 () Bool)

(assert (=> b!314571 (=> (not res!257718) (not e!226326))))

(assert (=> b!314571 (= res!257718 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!314572 () Bool)

(declare-fun res!257714 () Bool)

(assert (=> b!314572 (=> (not res!257714) (not e!226326))))

(assert (=> b!314572 (= res!257714 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!314567 () Bool)

(assert (=> b!314567 (= e!226326 (not true))))

(assert (=> b!314567 (arrayBitRangesEq!0 a2!825 a3!79 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) to!845)))

(declare-datatypes ((Unit!21607 0))(
  ( (Unit!21608) )
))
(declare-fun lt!442492 () Unit!21607)

(declare-fun arrayBitRangesEqDrop1!0 (array!19368 array!19368 (_ BitVec 64) (_ BitVec 64)) Unit!21607)

(assert (=> b!314567 (= lt!442492 (arrayBitRangesEqDrop1!0 a2!825 a3!79 i!1020 to!845))))

(assert (=> b!314567 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-fun lt!442491 () Unit!21607)

(assert (=> b!314567 (= lt!442491 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!314567 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442493 () Unit!21607)

(declare-fun arrayBitRangesEqAppend!0 (array!19368 array!19368 (_ BitVec 64) (_ BitVec 64)) Unit!21607)

(assert (=> b!314567 (= lt!442493 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun res!257720 () Bool)

(assert (=> start!69804 (=> (not res!257720) (not e!226326))))

(assert (=> start!69804 (= res!257720 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8408 a1!825) (size!8408 a2!825)) (= (size!8408 a2!825) (size!8408 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8408 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8408 a2!825))))))))

(assert (=> start!69804 e!226326))

(assert (=> start!69804 true))

(declare-fun array_inv!7960 (array!19368) Bool)

(assert (=> start!69804 (array_inv!7960 a1!825)))

(assert (=> start!69804 (array_inv!7960 a3!79)))

(assert (=> start!69804 (array_inv!7960 a2!825)))

(declare-fun b!314573 () Bool)

(declare-fun res!257713 () Bool)

(assert (=> b!314573 (=> (not res!257713) (not e!226326))))

(assert (=> b!314573 (= res!257713 (not (= i!1020 mid!82)))))

(declare-fun b!314574 () Bool)

(declare-fun res!257716 () Bool)

(assert (=> b!314574 (=> (not res!257716) (not e!226326))))

(assert (=> b!314574 (= res!257716 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(assert (= (and start!69804 res!257720) b!314570))

(assert (= (and b!314570 res!257717) b!314569))

(assert (= (and b!314569 res!257715) b!314571))

(assert (= (and b!314571 res!257718) b!314572))

(assert (= (and b!314572 res!257714) b!314568))

(assert (= (and b!314568 res!257719) b!314574))

(assert (= (and b!314574 res!257716) b!314573))

(assert (= (and b!314573 res!257713) b!314567))

(declare-fun m!452133 () Bool)

(assert (=> b!314570 m!452133))

(declare-fun m!452135 () Bool)

(assert (=> b!314569 m!452135))

(declare-fun m!452137 () Bool)

(assert (=> b!314567 m!452137))

(declare-fun m!452139 () Bool)

(assert (=> b!314567 m!452139))

(declare-fun m!452141 () Bool)

(assert (=> b!314567 m!452141))

(declare-fun m!452143 () Bool)

(assert (=> b!314567 m!452143))

(declare-fun m!452145 () Bool)

(assert (=> b!314567 m!452145))

(declare-fun m!452147 () Bool)

(assert (=> b!314567 m!452147))

(declare-fun m!452149 () Bool)

(assert (=> b!314574 m!452149))

(declare-fun m!452151 () Bool)

(assert (=> b!314572 m!452151))

(declare-fun m!452153 () Bool)

(assert (=> start!69804 m!452153))

(declare-fun m!452155 () Bool)

(assert (=> start!69804 m!452155))

(declare-fun m!452157 () Bool)

(assert (=> start!69804 m!452157))

(declare-fun m!452159 () Bool)

(assert (=> b!314568 m!452159))

(check-sat (not b!314567) (not b!314572) (not b!314568) (not b!314574) (not start!69804) (not b!314570) (not b!314569))
