; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69828 () Bool)

(assert start!69828)

(declare-fun b!314870 () Bool)

(declare-fun res!258023 () Bool)

(declare-fun e!226482 () Bool)

(assert (=> b!314870 (=> (not res!258023) (not e!226482))))

(declare-datatypes ((array!19392 0))(
  ( (array!19393 (arr!9500 (Array (_ BitVec 32) (_ BitVec 8))) (size!8420 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19392)

(declare-fun a3!79 () array!19392)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19392 array!19392 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!314870 (= res!258023 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314871 () Bool)

(declare-fun res!258016 () Bool)

(assert (=> b!314871 (=> (not res!258016) (not e!226482))))

(declare-fun mid!82 () (_ BitVec 64))

(assert (=> b!314871 (= res!258016 (not (= i!1020 mid!82)))))

(declare-fun b!314872 () Bool)

(declare-fun res!258020 () Bool)

(assert (=> b!314872 (=> (not res!258020) (not e!226482))))

(assert (=> b!314872 (= res!258020 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!314873 () Bool)

(declare-fun res!258017 () Bool)

(assert (=> b!314873 (=> (not res!258017) (not e!226482))))

(declare-fun a2!825 () array!19392)

(declare-fun to!845 () (_ BitVec 64))

(assert (=> b!314873 (= res!258017 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!314874 () Bool)

(declare-fun res!258021 () Bool)

(assert (=> b!314874 (=> (not res!258021) (not e!226482))))

(assert (=> b!314874 (= res!258021 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!314875 () Bool)

(declare-fun res!258022 () Bool)

(assert (=> b!314875 (=> (not res!258022) (not e!226482))))

(assert (=> b!314875 (= res!258022 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!314869 () Bool)

(declare-fun e!226484 () Bool)

(assert (=> b!314869 (= e!226484 true)))

(assert (=> b!314869 (arrayBitRangesEq!0 a1!825 a3!79 from!878 mid!82)))

(declare-datatypes ((Unit!21631 0))(
  ( (Unit!21632) )
))
(declare-fun lt!442615 () Unit!21631)

(declare-fun rec!20 (array!19392 array!19392 array!19392 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21631)

(assert (=> b!314869 (= lt!442615 (rec!20 a1!825 a2!825 a3!79 from!878 mid!82 to!845 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020)))))

(declare-fun res!258015 () Bool)

(assert (=> start!69828 (=> (not res!258015) (not e!226482))))

(assert (=> start!69828 (= res!258015 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8420 a1!825) (size!8420 a2!825)) (= (size!8420 a2!825) (size!8420 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8420 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8420 a2!825))))))))

(assert (=> start!69828 e!226482))

(assert (=> start!69828 true))

(declare-fun array_inv!7972 (array!19392) Bool)

(assert (=> start!69828 (array_inv!7972 a1!825)))

(assert (=> start!69828 (array_inv!7972 a3!79)))

(assert (=> start!69828 (array_inv!7972 a2!825)))

(declare-fun b!314876 () Bool)

(declare-fun res!258018 () Bool)

(assert (=> b!314876 (=> (not res!258018) (not e!226482))))

(assert (=> b!314876 (= res!258018 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!314877 () Bool)

(assert (=> b!314877 (= e!226482 (not e!226484))))

(declare-fun res!258019 () Bool)

(assert (=> b!314877 (=> res!258019 e!226484)))

(assert (=> b!314877 (= res!258019 (or (bvsgt from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020)) (bvsgt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))))

(assert (=> b!314877 (arrayBitRangesEq!0 a2!825 a3!79 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) to!845)))

(declare-fun lt!442614 () Unit!21631)

(declare-fun arrayBitRangesEqDrop1!0 (array!19392 array!19392 (_ BitVec 64) (_ BitVec 64)) Unit!21631)

(assert (=> b!314877 (= lt!442614 (arrayBitRangesEqDrop1!0 a2!825 a3!79 i!1020 to!845))))

(assert (=> b!314877 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-fun lt!442613 () Unit!21631)

(assert (=> b!314877 (= lt!442613 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!314877 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442616 () Unit!21631)

(declare-fun arrayBitRangesEqAppend!0 (array!19392 array!19392 (_ BitVec 64) (_ BitVec 64)) Unit!21631)

(assert (=> b!314877 (= lt!442616 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(assert (= (and start!69828 res!258015) b!314874))

(assert (= (and b!314874 res!258021) b!314876))

(assert (= (and b!314876 res!258018) b!314872))

(assert (= (and b!314872 res!258020) b!314875))

(assert (= (and b!314875 res!258022) b!314873))

(assert (= (and b!314873 res!258017) b!314870))

(assert (= (and b!314870 res!258023) b!314871))

(assert (= (and b!314871 res!258016) b!314877))

(assert (= (and b!314877 (not res!258019)) b!314869))

(declare-fun m!452485 () Bool)

(assert (=> b!314869 m!452485))

(declare-fun m!452487 () Bool)

(assert (=> b!314869 m!452487))

(declare-fun m!452489 () Bool)

(assert (=> b!314874 m!452489))

(declare-fun m!452491 () Bool)

(assert (=> b!314876 m!452491))

(declare-fun m!452493 () Bool)

(assert (=> b!314875 m!452493))

(declare-fun m!452495 () Bool)

(assert (=> start!69828 m!452495))

(declare-fun m!452497 () Bool)

(assert (=> start!69828 m!452497))

(declare-fun m!452499 () Bool)

(assert (=> start!69828 m!452499))

(declare-fun m!452501 () Bool)

(assert (=> b!314870 m!452501))

(declare-fun m!452503 () Bool)

(assert (=> b!314877 m!452503))

(declare-fun m!452505 () Bool)

(assert (=> b!314877 m!452505))

(declare-fun m!452507 () Bool)

(assert (=> b!314877 m!452507))

(declare-fun m!452509 () Bool)

(assert (=> b!314877 m!452509))

(declare-fun m!452511 () Bool)

(assert (=> b!314877 m!452511))

(declare-fun m!452513 () Bool)

(assert (=> b!314877 m!452513))

(declare-fun m!452515 () Bool)

(assert (=> b!314873 m!452515))

(check-sat (not b!314874) (not b!314876) (not b!314877) (not b!314873) (not b!314870) (not b!314869) (not b!314875) (not start!69828))
