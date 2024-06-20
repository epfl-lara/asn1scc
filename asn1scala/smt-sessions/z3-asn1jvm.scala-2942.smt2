; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69816 () Bool)

(assert start!69816)

(declare-fun b!314711 () Bool)

(declare-fun res!257862 () Bool)

(declare-fun e!226396 () Bool)

(assert (=> b!314711 (=> (not res!257862) (not e!226396))))

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun mid!82 () (_ BitVec 64))

(assert (=> b!314711 (= res!257862 (not (= i!1020 mid!82)))))

(declare-fun b!314712 () Bool)

(declare-fun res!257861 () Bool)

(assert (=> b!314712 (=> (not res!257861) (not e!226396))))

(declare-datatypes ((array!19380 0))(
  ( (array!19381 (arr!9494 (Array (_ BitVec 32) (_ BitVec 8))) (size!8414 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19380)

(declare-fun a3!79 () array!19380)

(declare-fun from!878 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19380 array!19380 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!314712 (= res!257861 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun res!257864 () Bool)

(assert (=> start!69816 (=> (not res!257864) (not e!226396))))

(declare-fun to!845 () (_ BitVec 64))

(declare-fun a2!825 () array!19380)

(assert (=> start!69816 (= res!257864 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8414 a1!825) (size!8414 a2!825)) (= (size!8414 a2!825) (size!8414 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8414 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8414 a2!825))))))))

(assert (=> start!69816 e!226396))

(assert (=> start!69816 true))

(declare-fun array_inv!7966 (array!19380) Bool)

(assert (=> start!69816 (array_inv!7966 a1!825)))

(assert (=> start!69816 (array_inv!7966 a3!79)))

(assert (=> start!69816 (array_inv!7966 a2!825)))

(declare-fun b!314713 () Bool)

(declare-fun res!257859 () Bool)

(assert (=> b!314713 (=> (not res!257859) (not e!226396))))

(assert (=> b!314713 (= res!257859 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!314714 () Bool)

(declare-fun res!257860 () Bool)

(assert (=> b!314714 (=> (not res!257860) (not e!226396))))

(assert (=> b!314714 (= res!257860 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!314715 () Bool)

(declare-fun res!257863 () Bool)

(assert (=> b!314715 (=> (not res!257863) (not e!226396))))

(assert (=> b!314715 (= res!257863 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!314716 () Bool)

(declare-fun res!257858 () Bool)

(assert (=> b!314716 (=> (not res!257858) (not e!226396))))

(assert (=> b!314716 (= res!257858 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!314717 () Bool)

(assert (=> b!314717 (= e!226396 (not true))))

(assert (=> b!314717 (arrayBitRangesEq!0 a2!825 a3!79 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) to!845)))

(declare-datatypes ((Unit!21619 0))(
  ( (Unit!21620) )
))
(declare-fun lt!442546 () Unit!21619)

(declare-fun arrayBitRangesEqDrop1!0 (array!19380 array!19380 (_ BitVec 64) (_ BitVec 64)) Unit!21619)

(assert (=> b!314717 (= lt!442546 (arrayBitRangesEqDrop1!0 a2!825 a3!79 i!1020 to!845))))

(assert (=> b!314717 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-fun lt!442547 () Unit!21619)

(assert (=> b!314717 (= lt!442547 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!314717 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442545 () Unit!21619)

(declare-fun arrayBitRangesEqAppend!0 (array!19380 array!19380 (_ BitVec 64) (_ BitVec 64)) Unit!21619)

(assert (=> b!314717 (= lt!442545 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314718 () Bool)

(declare-fun res!257857 () Bool)

(assert (=> b!314718 (=> (not res!257857) (not e!226396))))

(assert (=> b!314718 (= res!257857 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(assert (= (and start!69816 res!257864) b!314716))

(assert (= (and b!314716 res!257858) b!314714))

(assert (= (and b!314714 res!257860) b!314718))

(assert (= (and b!314718 res!257857) b!314715))

(assert (= (and b!314715 res!257863) b!314713))

(assert (= (and b!314713 res!257859) b!314712))

(assert (= (and b!314712 res!257861) b!314711))

(assert (= (and b!314711 res!257862) b!314717))

(declare-fun m!452301 () Bool)

(assert (=> start!69816 m!452301))

(declare-fun m!452303 () Bool)

(assert (=> start!69816 m!452303))

(declare-fun m!452305 () Bool)

(assert (=> start!69816 m!452305))

(declare-fun m!452307 () Bool)

(assert (=> b!314715 m!452307))

(declare-fun m!452309 () Bool)

(assert (=> b!314714 m!452309))

(declare-fun m!452311 () Bool)

(assert (=> b!314716 m!452311))

(declare-fun m!452313 () Bool)

(assert (=> b!314717 m!452313))

(declare-fun m!452315 () Bool)

(assert (=> b!314717 m!452315))

(declare-fun m!452317 () Bool)

(assert (=> b!314717 m!452317))

(declare-fun m!452319 () Bool)

(assert (=> b!314717 m!452319))

(declare-fun m!452321 () Bool)

(assert (=> b!314717 m!452321))

(declare-fun m!452323 () Bool)

(assert (=> b!314717 m!452323))

(declare-fun m!452325 () Bool)

(assert (=> b!314713 m!452325))

(declare-fun m!452327 () Bool)

(assert (=> b!314712 m!452327))

(check-sat (not b!314713) (not b!314717) (not b!314715) (not b!314716) (not b!314714) (not start!69816) (not b!314712))
