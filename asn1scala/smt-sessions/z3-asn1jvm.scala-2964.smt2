; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69984 () Bool)

(assert start!69984)

(declare-fun b!316466 () Bool)

(declare-fun res!259575 () Bool)

(declare-fun e!227374 () Bool)

(assert (=> b!316466 (=> (not res!259575) (not e!227374))))

(declare-datatypes ((array!19515 0))(
  ( (array!19516 (arr!9563 (Array (_ BitVec 32) (_ BitVec 8))) (size!8480 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19515)

(declare-fun a2!825 () array!19515)

(declare-fun mid!82 () (_ BitVec 64))

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19515 array!19515 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316466 (= res!259575 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!316467 () Bool)

(declare-fun res!259571 () Bool)

(assert (=> b!316467 (=> (not res!259571) (not e!227374))))

(declare-fun a3!79 () array!19515)

(declare-fun to!845 () (_ BitVec 64))

(assert (=> b!316467 (= res!259571 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!316468 () Bool)

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!316468 (= e!227374 (not (or (bvsgt from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020)) (bvsgt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82) (bvslt (bvsub to!845 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020)) (bvsub to!845 i!1020)))))))

(assert (=> b!316468 (arrayBitRangesEq!0 a2!825 a3!79 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) to!845)))

(declare-datatypes ((Unit!21715 0))(
  ( (Unit!21716) )
))
(declare-fun lt!442951 () Unit!21715)

(declare-fun arrayBitRangesEqDrop1!0 (array!19515 array!19515 (_ BitVec 64) (_ BitVec 64)) Unit!21715)

(assert (=> b!316468 (= lt!442951 (arrayBitRangesEqDrop1!0 a2!825 a3!79 i!1020 to!845))))

(assert (=> b!316468 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-fun lt!442950 () Unit!21715)

(assert (=> b!316468 (= lt!442950 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!316468 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442952 () Unit!21715)

(declare-fun arrayBitRangesEqAppend!0 (array!19515 array!19515 (_ BitVec 64) (_ BitVec 64)) Unit!21715)

(assert (=> b!316468 (= lt!442952 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!316469 () Bool)

(declare-fun res!259570 () Bool)

(assert (=> b!316469 (=> (not res!259570) (not e!227374))))

(assert (=> b!316469 (= res!259570 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!316470 () Bool)

(declare-fun res!259574 () Bool)

(assert (=> b!316470 (=> (not res!259574) (not e!227374))))

(assert (=> b!316470 (= res!259574 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!316471 () Bool)

(declare-fun res!259573 () Bool)

(assert (=> b!316471 (=> (not res!259573) (not e!227374))))

(assert (=> b!316471 (= res!259573 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun res!259572 () Bool)

(assert (=> start!69984 (=> (not res!259572) (not e!227374))))

(assert (=> start!69984 (= res!259572 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8480 a1!825) (size!8480 a2!825)) (= (size!8480 a2!825) (size!8480 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8480 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8480 a2!825))))))))

(assert (=> start!69984 e!227374))

(assert (=> start!69984 true))

(declare-fun array_inv!8032 (array!19515) Bool)

(assert (=> start!69984 (array_inv!8032 a1!825)))

(assert (=> start!69984 (array_inv!8032 a3!79)))

(assert (=> start!69984 (array_inv!8032 a2!825)))

(declare-fun b!316472 () Bool)

(declare-fun res!259576 () Bool)

(assert (=> b!316472 (=> (not res!259576) (not e!227374))))

(assert (=> b!316472 (= res!259576 (not (= i!1020 mid!82)))))

(declare-fun b!316473 () Bool)

(declare-fun res!259577 () Bool)

(assert (=> b!316473 (=> (not res!259577) (not e!227374))))

(assert (=> b!316473 (= res!259577 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(assert (= (and start!69984 res!259572) b!316469))

(assert (= (and b!316469 res!259570) b!316470))

(assert (= (and b!316470 res!259574) b!316473))

(assert (= (and b!316473 res!259577) b!316466))

(assert (= (and b!316466 res!259575) b!316467))

(assert (= (and b!316467 res!259571) b!316471))

(assert (= (and b!316471 res!259573) b!316472))

(assert (= (and b!316472 res!259576) b!316468))

(declare-fun m!454275 () Bool)

(assert (=> b!316469 m!454275))

(declare-fun m!454277 () Bool)

(assert (=> b!316471 m!454277))

(declare-fun m!454279 () Bool)

(assert (=> b!316467 m!454279))

(declare-fun m!454281 () Bool)

(assert (=> start!69984 m!454281))

(declare-fun m!454283 () Bool)

(assert (=> start!69984 m!454283))

(declare-fun m!454285 () Bool)

(assert (=> start!69984 m!454285))

(declare-fun m!454287 () Bool)

(assert (=> b!316466 m!454287))

(declare-fun m!454289 () Bool)

(assert (=> b!316470 m!454289))

(declare-fun m!454291 () Bool)

(assert (=> b!316468 m!454291))

(declare-fun m!454293 () Bool)

(assert (=> b!316468 m!454293))

(declare-fun m!454295 () Bool)

(assert (=> b!316468 m!454295))

(declare-fun m!454297 () Bool)

(assert (=> b!316468 m!454297))

(declare-fun m!454299 () Bool)

(assert (=> b!316468 m!454299))

(declare-fun m!454301 () Bool)

(assert (=> b!316468 m!454301))

(check-sat (not b!316470) (not b!316466) (not b!316471) (not b!316469) (not start!69984) (not b!316468) (not b!316467))
(check-sat)
