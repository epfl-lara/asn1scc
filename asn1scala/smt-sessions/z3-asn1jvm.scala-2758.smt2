; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66882 () Bool)

(assert start!66882)

(declare-fun b!298970 () Bool)

(declare-fun res!246731 () Bool)

(declare-fun e!214539 () Bool)

(assert (=> b!298970 (=> (not res!246731) (not e!214539))))

(declare-fun i!1010 () (_ BitVec 64))

(declare-fun at!286 () (_ BitVec 64))

(assert (=> b!298970 (= res!246731 (and (not (= i!1010 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsle (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001) at!286)))))

(declare-fun b!298971 () Bool)

(declare-fun lt!434925 () (_ BitVec 32))

(declare-datatypes ((array!18109 0))(
  ( (array!18110 (arr!8942 (Array (_ BitVec 32) (_ BitVec 8))) (size!7859 (_ BitVec 32))) )
))
(declare-fun a!434 () array!18109)

(assert (=> b!298971 (= e!214539 (not (and (bvsge lt!434925 #b00000000000000000000000000000000) (bvslt lt!434925 (size!7859 a!434)))))))

(declare-fun lt!434926 () array!18109)

(declare-fun arrayBitRangesEq!0 (array!18109 array!18109 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298971 (arrayBitRangesEq!0 a!434 lt!434926 #b0000000000000000000000000000000000000000000000000000000000000000 at!286)))

(declare-fun b!320 () Bool)

(declare-datatypes ((Unit!20859 0))(
  ( (Unit!20860) )
))
(declare-fun lt!434928 () Unit!20859)

(declare-fun rec!19 (array!18109 (_ BitVec 64) Bool (_ BitVec 64)) Unit!20859)

(assert (=> b!298971 (= lt!434928 (rec!19 a!434 at!286 b!320 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!298972 () Bool)

(declare-fun res!246732 () Bool)

(assert (=> b!298972 (=> (not res!246732) (not e!214539))))

(assert (=> b!298972 (= res!246732 (arrayBitRangesEq!0 a!434 lt!434926 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001) at!286))))

(declare-fun b!298973 () Bool)

(declare-fun e!214542 () Bool)

(assert (=> b!298973 (= e!214542 e!214539)))

(declare-fun res!246733 () Bool)

(assert (=> b!298973 (=> (not res!246733) (not e!214539))))

(assert (=> b!298973 (= res!246733 (arrayBitRangesEq!0 a!434 lt!434926 i!1010 at!286))))

(declare-fun lt!434927 () (_ BitVec 32))

(assert (=> b!298973 (= lt!434926 (array!18110 (store (arr!8942 a!434) lt!434925 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8942 a!434) lt!434925)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434927)))) ((_ sign_extend 24) (ite b!320 (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434927) #b00000000))))) (size!7859 a!434)))))

(declare-fun res!246734 () Bool)

(declare-fun e!214540 () Bool)

(assert (=> start!66882 (=> (not res!246734) (not e!214540))))

(assert (=> start!66882 (= res!246734 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!286) (bvslt at!286 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7859 a!434))))))))

(assert (=> start!66882 e!214540))

(assert (=> start!66882 true))

(declare-fun array_inv!7471 (array!18109) Bool)

(assert (=> start!66882 (array_inv!7471 a!434)))

(declare-fun b!298974 () Bool)

(assert (=> b!298974 (= e!214540 e!214542)))

(declare-fun res!246730 () Bool)

(assert (=> b!298974 (=> (not res!246730) (not e!214542))))

(assert (=> b!298974 (= res!246730 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1010) (bvsle i!1010 at!286)))))

(assert (=> b!298974 (= lt!434927 ((_ extract 31 0) (bvsrem at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!298974 (= lt!434925 ((_ extract 31 0) (bvsdiv at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and start!66882 res!246734) b!298974))

(assert (= (and b!298974 res!246730) b!298973))

(assert (= (and b!298973 res!246733) b!298970))

(assert (= (and b!298970 res!246731) b!298972))

(assert (= (and b!298972 res!246732) b!298971))

(declare-fun m!438221 () Bool)

(assert (=> b!298971 m!438221))

(declare-fun m!438223 () Bool)

(assert (=> b!298971 m!438223))

(declare-fun m!438225 () Bool)

(assert (=> b!298972 m!438225))

(declare-fun m!438227 () Bool)

(assert (=> b!298973 m!438227))

(declare-fun m!438229 () Bool)

(assert (=> b!298973 m!438229))

(declare-fun m!438231 () Bool)

(assert (=> b!298973 m!438231))

(declare-fun m!438233 () Bool)

(assert (=> b!298973 m!438233))

(declare-fun m!438235 () Bool)

(assert (=> start!66882 m!438235))

(check-sat (not b!298973) (not start!66882) (not b!298971) (not b!298972))
(check-sat)
