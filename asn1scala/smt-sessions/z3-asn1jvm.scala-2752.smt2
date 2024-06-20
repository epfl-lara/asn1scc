; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66816 () Bool)

(assert start!66816)

(declare-fun res!246427 () Bool)

(declare-fun e!214238 () Bool)

(assert (=> start!66816 (=> (not res!246427) (not e!214238))))

(declare-fun at!286 () (_ BitVec 64))

(declare-datatypes ((array!18070 0))(
  ( (array!18071 (arr!8924 (Array (_ BitVec 32) (_ BitVec 8))) (size!7841 (_ BitVec 32))) )
))
(declare-fun a!434 () array!18070)

(assert (=> start!66816 (= res!246427 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!286) (bvslt at!286 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7841 a!434))))))))

(assert (=> start!66816 e!214238))

(assert (=> start!66816 true))

(declare-fun array_inv!7453 (array!18070) Bool)

(assert (=> start!66816 (array_inv!7453 a!434)))

(declare-fun b!298642 () Bool)

(declare-fun e!214239 () Bool)

(assert (=> b!298642 (= e!214238 e!214239)))

(declare-fun res!246428 () Bool)

(assert (=> b!298642 (=> (not res!246428) (not e!214239))))

(declare-fun i!1010 () (_ BitVec 64))

(assert (=> b!298642 (= res!246428 (bvsle i!1010 at!286))))

(declare-fun lt!434745 () (_ BitVec 32))

(assert (=> b!298642 (= lt!434745 ((_ extract 31 0) (bvsrem at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!434744 () (_ BitVec 32))

(assert (=> b!298642 (= lt!434744 ((_ extract 31 0) (bvsdiv at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!298643 () Bool)

(declare-fun res!246426 () Bool)

(assert (=> b!298643 (=> (not res!246426) (not e!214239))))

(declare-fun b!320 () Bool)

(declare-fun arrayBitRangesEq!0 (array!18070 array!18070 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298643 (= res!246426 (arrayBitRangesEq!0 a!434 (array!18071 (store (arr!8924 a!434) lt!434744 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8924 a!434) lt!434744)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434745)))) ((_ sign_extend 24) (ite b!320 (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434745) #b00000000))))) (size!7841 a!434)) i!1010 at!286))))

(declare-fun b!298644 () Bool)

(assert (=> b!298644 (= e!214239 (and (= i!1010 #b0000000000000000000000000000000000000000000000000000000000000000) (or (bvslt lt!434744 #b00000000000000000000000000000000) (bvsge lt!434744 (size!7841 a!434)))))))

(assert (= (and start!66816 res!246427) b!298642))

(assert (= (and b!298642 res!246428) b!298643))

(assert (= (and b!298643 res!246426) b!298644))

(declare-fun m!437807 () Bool)

(assert (=> start!66816 m!437807))

(declare-fun m!437809 () Bool)

(assert (=> b!298643 m!437809))

(declare-fun m!437811 () Bool)

(assert (=> b!298643 m!437811))

(declare-fun m!437813 () Bool)

(assert (=> b!298643 m!437813))

(declare-fun m!437815 () Bool)

(assert (=> b!298643 m!437815))

(check-sat (not b!298643) (not start!66816))
(check-sat)
