; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69960 () Bool)

(assert start!69960)

(declare-fun b!316178 () Bool)

(declare-fun res!259288 () Bool)

(declare-fun e!227231 () Bool)

(assert (=> b!316178 (=> (not res!259288) (not e!227231))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19491 0))(
  ( (array!19492 (arr!9551 (Array (_ BitVec 32) (_ BitVec 8))) (size!8468 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19491)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun a2!825 () array!19491)

(declare-fun arrayBitRangesEq!0 (array!19491 array!19491 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316178 (= res!259288 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!316179 () Bool)

(declare-fun res!259289 () Bool)

(assert (=> b!316179 (=> (not res!259289) (not e!227231))))

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!316179 (= res!259289 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!316180 () Bool)

(declare-fun res!259283 () Bool)

(assert (=> b!316180 (=> (not res!259283) (not e!227231))))

(declare-fun a3!79 () array!19491)

(assert (=> b!316180 (= res!259283 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!316181 () Bool)

(declare-fun res!259287 () Bool)

(assert (=> b!316181 (=> (not res!259287) (not e!227231))))

(declare-fun to!845 () (_ BitVec 64))

(assert (=> b!316181 (= res!259287 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!316182 () Bool)

(declare-fun res!259285 () Bool)

(assert (=> b!316182 (=> (not res!259285) (not e!227231))))

(assert (=> b!316182 (= res!259285 (not (= i!1020 mid!82)))))

(declare-fun b!316183 () Bool)

(declare-fun res!259286 () Bool)

(assert (=> b!316183 (=> (not res!259286) (not e!227231))))

(assert (=> b!316183 (= res!259286 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!316184 () Bool)

(declare-fun res!259282 () Bool)

(assert (=> b!316184 (=> (not res!259282) (not e!227231))))

(assert (=> b!316184 (= res!259282 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!316185 () Bool)

(assert (=> b!316185 (= e!227231 (not (and (bvsle from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020)) (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82))))))

(assert (=> b!316185 (arrayBitRangesEq!0 a2!825 a3!79 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) to!845)))

(declare-datatypes ((Unit!21691 0))(
  ( (Unit!21692) )
))
(declare-fun lt!442843 () Unit!21691)

(declare-fun arrayBitRangesEqDrop1!0 (array!19491 array!19491 (_ BitVec 64) (_ BitVec 64)) Unit!21691)

(assert (=> b!316185 (= lt!442843 (arrayBitRangesEqDrop1!0 a2!825 a3!79 i!1020 to!845))))

(assert (=> b!316185 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-fun lt!442842 () Unit!21691)

(assert (=> b!316185 (= lt!442842 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!316185 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442844 () Unit!21691)

(declare-fun arrayBitRangesEqAppend!0 (array!19491 array!19491 (_ BitVec 64) (_ BitVec 64)) Unit!21691)

(assert (=> b!316185 (= lt!442844 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun res!259284 () Bool)

(assert (=> start!69960 (=> (not res!259284) (not e!227231))))

(assert (=> start!69960 (= res!259284 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8468 a1!825) (size!8468 a2!825)) (= (size!8468 a2!825) (size!8468 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8468 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8468 a2!825))))))))

(assert (=> start!69960 e!227231))

(assert (=> start!69960 true))

(declare-fun array_inv!8020 (array!19491) Bool)

(assert (=> start!69960 (array_inv!8020 a1!825)))

(assert (=> start!69960 (array_inv!8020 a3!79)))

(assert (=> start!69960 (array_inv!8020 a2!825)))

(assert (= (and start!69960 res!259284) b!316184))

(assert (= (and b!316184 res!259282) b!316183))

(assert (= (and b!316183 res!259286) b!316179))

(assert (= (and b!316179 res!259289) b!316178))

(assert (= (and b!316178 res!259288) b!316181))

(assert (= (and b!316181 res!259287) b!316180))

(assert (= (and b!316180 res!259283) b!316182))

(assert (= (and b!316182 res!259285) b!316185))

(declare-fun m!453939 () Bool)

(assert (=> start!69960 m!453939))

(declare-fun m!453941 () Bool)

(assert (=> start!69960 m!453941))

(declare-fun m!453943 () Bool)

(assert (=> start!69960 m!453943))

(declare-fun m!453945 () Bool)

(assert (=> b!316183 m!453945))

(declare-fun m!453947 () Bool)

(assert (=> b!316184 m!453947))

(declare-fun m!453949 () Bool)

(assert (=> b!316181 m!453949))

(declare-fun m!453951 () Bool)

(assert (=> b!316180 m!453951))

(declare-fun m!453953 () Bool)

(assert (=> b!316185 m!453953))

(declare-fun m!453955 () Bool)

(assert (=> b!316185 m!453955))

(declare-fun m!453957 () Bool)

(assert (=> b!316185 m!453957))

(declare-fun m!453959 () Bool)

(assert (=> b!316185 m!453959))

(declare-fun m!453961 () Bool)

(assert (=> b!316185 m!453961))

(declare-fun m!453963 () Bool)

(assert (=> b!316185 m!453963))

(declare-fun m!453965 () Bool)

(assert (=> b!316178 m!453965))

(check-sat (not b!316184) (not b!316185) (not start!69960) (not b!316181) (not b!316178) (not b!316180) (not b!316183))
(check-sat)
