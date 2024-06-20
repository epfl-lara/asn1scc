; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69954 () Bool)

(assert start!69954)

(declare-fun b!316106 () Bool)

(declare-fun res!259214 () Bool)

(declare-fun e!227195 () Bool)

(assert (=> b!316106 (=> (not res!259214) (not e!227195))))

(declare-datatypes ((array!19485 0))(
  ( (array!19486 (arr!9548 (Array (_ BitVec 32) (_ BitVec 8))) (size!8465 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19485)

(declare-fun a3!79 () array!19485)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19485 array!19485 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316106 (= res!259214 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!316107 () Bool)

(declare-fun res!259211 () Bool)

(assert (=> b!316107 (=> (not res!259211) (not e!227195))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-fun a2!825 () array!19485)

(assert (=> b!316107 (= res!259211 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!316108 () Bool)

(declare-fun res!259217 () Bool)

(assert (=> b!316108 (=> (not res!259217) (not e!227195))))

(declare-fun to!845 () (_ BitVec 64))

(assert (=> b!316108 (= res!259217 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!316110 () Bool)

(declare-fun res!259216 () Bool)

(assert (=> b!316110 (=> (not res!259216) (not e!227195))))

(assert (=> b!316110 (= res!259216 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!316111 () Bool)

(assert (=> b!316111 (= e!227195 (not (or (not (= (bvand i!1020 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand i!1020 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!316111 (arrayBitRangesEq!0 a2!825 a3!79 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) to!845)))

(declare-datatypes ((Unit!21685 0))(
  ( (Unit!21686) )
))
(declare-fun lt!442816 () Unit!21685)

(declare-fun arrayBitRangesEqDrop1!0 (array!19485 array!19485 (_ BitVec 64) (_ BitVec 64)) Unit!21685)

(assert (=> b!316111 (= lt!442816 (arrayBitRangesEqDrop1!0 a2!825 a3!79 i!1020 to!845))))

(assert (=> b!316111 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-fun lt!442817 () Unit!21685)

(assert (=> b!316111 (= lt!442817 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!316111 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442815 () Unit!21685)

(declare-fun arrayBitRangesEqAppend!0 (array!19485 array!19485 (_ BitVec 64) (_ BitVec 64)) Unit!21685)

(assert (=> b!316111 (= lt!442815 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!316109 () Bool)

(declare-fun res!259210 () Bool)

(assert (=> b!316109 (=> (not res!259210) (not e!227195))))

(assert (=> b!316109 (= res!259210 (not (= i!1020 mid!82)))))

(declare-fun res!259213 () Bool)

(assert (=> start!69954 (=> (not res!259213) (not e!227195))))

(assert (=> start!69954 (= res!259213 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8465 a1!825) (size!8465 a2!825)) (= (size!8465 a2!825) (size!8465 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8465 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8465 a2!825))))))))

(assert (=> start!69954 e!227195))

(assert (=> start!69954 true))

(declare-fun array_inv!8017 (array!19485) Bool)

(assert (=> start!69954 (array_inv!8017 a1!825)))

(assert (=> start!69954 (array_inv!8017 a3!79)))

(assert (=> start!69954 (array_inv!8017 a2!825)))

(declare-fun b!316112 () Bool)

(declare-fun res!259212 () Bool)

(assert (=> b!316112 (=> (not res!259212) (not e!227195))))

(assert (=> b!316112 (= res!259212 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!316113 () Bool)

(declare-fun res!259215 () Bool)

(assert (=> b!316113 (=> (not res!259215) (not e!227195))))

(assert (=> b!316113 (= res!259215 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(assert (= (and start!69954 res!259213) b!316107))

(assert (= (and b!316107 res!259211) b!316108))

(assert (= (and b!316108 res!259217) b!316113))

(assert (= (and b!316113 res!259215) b!316112))

(assert (= (and b!316112 res!259212) b!316110))

(assert (= (and b!316110 res!259216) b!316106))

(assert (= (and b!316106 res!259214) b!316109))

(assert (= (and b!316109 res!259210) b!316111))

(declare-fun m!453855 () Bool)

(assert (=> b!316112 m!453855))

(declare-fun m!453857 () Bool)

(assert (=> b!316111 m!453857))

(declare-fun m!453859 () Bool)

(assert (=> b!316111 m!453859))

(declare-fun m!453861 () Bool)

(assert (=> b!316111 m!453861))

(declare-fun m!453863 () Bool)

(assert (=> b!316111 m!453863))

(declare-fun m!453865 () Bool)

(assert (=> b!316111 m!453865))

(declare-fun m!453867 () Bool)

(assert (=> b!316111 m!453867))

(declare-fun m!453869 () Bool)

(assert (=> b!316108 m!453869))

(declare-fun m!453871 () Bool)

(assert (=> b!316110 m!453871))

(declare-fun m!453873 () Bool)

(assert (=> start!69954 m!453873))

(declare-fun m!453875 () Bool)

(assert (=> start!69954 m!453875))

(declare-fun m!453877 () Bool)

(assert (=> start!69954 m!453877))

(declare-fun m!453879 () Bool)

(assert (=> b!316106 m!453879))

(declare-fun m!453881 () Bool)

(assert (=> b!316107 m!453881))

(check-sat (not b!316112) (not start!69954) (not b!316108) (not b!316106) (not b!316107) (not b!316111) (not b!316110))
(check-sat)
