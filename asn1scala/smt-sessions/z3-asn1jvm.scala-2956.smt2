; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69936 () Bool)

(assert start!69936)

(declare-fun b!315890 () Bool)

(declare-fun res!259001 () Bool)

(declare-fun e!227087 () Bool)

(assert (=> b!315890 (=> (not res!259001) (not e!227087))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19467 0))(
  ( (array!19468 (arr!9539 (Array (_ BitVec 32) (_ BitVec 8))) (size!8456 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19467)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun a2!825 () array!19467)

(declare-fun arrayBitRangesEq!0 (array!19467 array!19467 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!315890 (= res!259001 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!315891 () Bool)

(declare-fun res!258996 () Bool)

(assert (=> b!315891 (=> (not res!258996) (not e!227087))))

(assert (=> b!315891 (= res!258996 (not (= i!1020 mid!82)))))

(declare-fun b!315892 () Bool)

(declare-fun res!258995 () Bool)

(assert (=> b!315892 (=> (not res!258995) (not e!227087))))

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!315892 (= res!258995 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!315893 () Bool)

(declare-fun res!258998 () Bool)

(assert (=> b!315893 (=> (not res!258998) (not e!227087))))

(declare-fun a3!79 () array!19467)

(declare-fun to!845 () (_ BitVec 64))

(assert (=> b!315893 (= res!258998 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!315895 () Bool)

(assert (=> b!315895 (= e!227087 (not true))))

(assert (=> b!315895 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-datatypes ((Unit!21667 0))(
  ( (Unit!21668) )
))
(declare-fun lt!442756 () Unit!21667)

(declare-fun arrayBitRangesEqDrop1!0 (array!19467 array!19467 (_ BitVec 64) (_ BitVec 64)) Unit!21667)

(assert (=> b!315895 (= lt!442756 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!315895 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442757 () Unit!21667)

(declare-fun arrayBitRangesEqAppend!0 (array!19467 array!19467 (_ BitVec 64) (_ BitVec 64)) Unit!21667)

(assert (=> b!315895 (= lt!442757 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!315896 () Bool)

(declare-fun res!258994 () Bool)

(assert (=> b!315896 (=> (not res!258994) (not e!227087))))

(assert (=> b!315896 (= res!258994 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!315897 () Bool)

(declare-fun res!259000 () Bool)

(assert (=> b!315897 (=> (not res!259000) (not e!227087))))

(assert (=> b!315897 (= res!259000 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!315894 () Bool)

(declare-fun res!258999 () Bool)

(assert (=> b!315894 (=> (not res!258999) (not e!227087))))

(assert (=> b!315894 (= res!258999 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun res!258997 () Bool)

(assert (=> start!69936 (=> (not res!258997) (not e!227087))))

(assert (=> start!69936 (= res!258997 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8456 a1!825) (size!8456 a2!825)) (= (size!8456 a2!825) (size!8456 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8456 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8456 a2!825))))))))

(assert (=> start!69936 e!227087))

(assert (=> start!69936 true))

(declare-fun array_inv!8008 (array!19467) Bool)

(assert (=> start!69936 (array_inv!8008 a1!825)))

(assert (=> start!69936 (array_inv!8008 a3!79)))

(assert (=> start!69936 (array_inv!8008 a2!825)))

(assert (= (and start!69936 res!258997) b!315892))

(assert (= (and b!315892 res!258995) b!315893))

(assert (= (and b!315893 res!258998) b!315896))

(assert (= (and b!315896 res!258994) b!315890))

(assert (= (and b!315890 res!259001) b!315894))

(assert (= (and b!315894 res!258999) b!315897))

(assert (= (and b!315897 res!259000) b!315891))

(assert (= (and b!315891 res!258996) b!315895))

(declare-fun m!453635 () Bool)

(assert (=> b!315893 m!453635))

(declare-fun m!453637 () Bool)

(assert (=> b!315892 m!453637))

(declare-fun m!453639 () Bool)

(assert (=> start!69936 m!453639))

(declare-fun m!453641 () Bool)

(assert (=> start!69936 m!453641))

(declare-fun m!453643 () Bool)

(assert (=> start!69936 m!453643))

(declare-fun m!453645 () Bool)

(assert (=> b!315895 m!453645))

(declare-fun m!453647 () Bool)

(assert (=> b!315895 m!453647))

(declare-fun m!453649 () Bool)

(assert (=> b!315895 m!453649))

(declare-fun m!453651 () Bool)

(assert (=> b!315895 m!453651))

(declare-fun m!453653 () Bool)

(assert (=> b!315897 m!453653))

(declare-fun m!453655 () Bool)

(assert (=> b!315890 m!453655))

(declare-fun m!453657 () Bool)

(assert (=> b!315894 m!453657))

(check-sat (not b!315892) (not b!315897) (not b!315890) (not b!315893) (not b!315895) (not start!69936) (not b!315894))
