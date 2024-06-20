; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66876 () Bool)

(assert start!66876)

(declare-fun b!298925 () Bool)

(declare-fun res!246685 () Bool)

(declare-fun e!214503 () Bool)

(assert (=> b!298925 (=> (not res!246685) (not e!214503))))

(declare-fun i!1010 () (_ BitVec 64))

(declare-fun at!286 () (_ BitVec 64))

(assert (=> b!298925 (= res!246685 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsle (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001) at!286)))))

(declare-fun b!298926 () Bool)

(declare-fun e!214505 () Bool)

(declare-fun e!214504 () Bool)

(assert (=> b!298926 (= e!214505 e!214504)))

(declare-fun res!246687 () Bool)

(assert (=> b!298926 (=> (not res!246687) (not e!214504))))

(assert (=> b!298926 (= res!246687 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1010) (bvsle i!1010 at!286)))))

(declare-fun lt!434895 () (_ BitVec 32))

(assert (=> b!298926 (= lt!434895 ((_ extract 31 0) (bvsrem at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!434893 () (_ BitVec 32))

(assert (=> b!298926 (= lt!434893 ((_ extract 31 0) (bvsdiv at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!298927 () Bool)

(assert (=> b!298927 (= e!214504 e!214503)))

(declare-fun res!246686 () Bool)

(assert (=> b!298927 (=> (not res!246686) (not e!214503))))

(declare-datatypes ((array!18103 0))(
  ( (array!18104 (arr!8939 (Array (_ BitVec 32) (_ BitVec 8))) (size!7856 (_ BitVec 32))) )
))
(declare-fun lt!434894 () array!18103)

(declare-fun a!434 () array!18103)

(declare-fun arrayBitRangesEq!0 (array!18103 array!18103 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298927 (= res!246686 (arrayBitRangesEq!0 a!434 lt!434894 i!1010 at!286))))

(declare-fun b!320 () Bool)

(assert (=> b!298927 (= lt!434894 (array!18104 (store (arr!8939 a!434) lt!434893 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8939 a!434) lt!434893)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434895)))) ((_ sign_extend 24) (ite b!320 (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434895) #b00000000))))) (size!7856 a!434)))))

(declare-fun b!298928 () Bool)

(declare-fun res!246689 () Bool)

(assert (=> b!298928 (=> (not res!246689) (not e!214503))))

(assert (=> b!298928 (= res!246689 (arrayBitRangesEq!0 a!434 lt!434894 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001) at!286))))

(declare-fun res!246688 () Bool)

(assert (=> start!66876 (=> (not res!246688) (not e!214505))))

(assert (=> start!66876 (= res!246688 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!286) (bvslt at!286 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7856 a!434))))))))

(assert (=> start!66876 e!214505))

(assert (=> start!66876 true))

(declare-fun array_inv!7468 (array!18103) Bool)

(assert (=> start!66876 (array_inv!7468 a!434)))

(declare-fun b!298929 () Bool)

(assert (=> b!298929 (= e!214503 (bvsge (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001) i!1010))))

(assert (= (and start!66876 res!246688) b!298926))

(assert (= (and b!298926 res!246687) b!298927))

(assert (= (and b!298927 res!246686) b!298925))

(assert (= (and b!298925 res!246685) b!298928))

(assert (= (and b!298928 res!246689) b!298929))

(declare-fun m!438181 () Bool)

(assert (=> b!298927 m!438181))

(declare-fun m!438183 () Bool)

(assert (=> b!298927 m!438183))

(declare-fun m!438185 () Bool)

(assert (=> b!298927 m!438185))

(declare-fun m!438187 () Bool)

(assert (=> b!298927 m!438187))

(declare-fun m!438189 () Bool)

(assert (=> b!298928 m!438189))

(declare-fun m!438191 () Bool)

(assert (=> start!66876 m!438191))

(check-sat (not start!66876) (not b!298927) (not b!298928))
(check-sat)
