; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66814 () Bool)

(assert start!66814)

(declare-fun res!246418 () Bool)

(declare-fun e!214229 () Bool)

(assert (=> start!66814 (=> (not res!246418) (not e!214229))))

(declare-fun at!286 () (_ BitVec 64))

(declare-datatypes ((array!18068 0))(
  ( (array!18069 (arr!8923 (Array (_ BitVec 32) (_ BitVec 8))) (size!7840 (_ BitVec 32))) )
))
(declare-fun a!434 () array!18068)

(assert (=> start!66814 (= res!246418 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!286) (bvslt at!286 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7840 a!434))))))))

(assert (=> start!66814 e!214229))

(assert (=> start!66814 true))

(declare-fun array_inv!7452 (array!18068) Bool)

(assert (=> start!66814 (array_inv!7452 a!434)))

(declare-fun b!298633 () Bool)

(declare-fun e!214228 () Bool)

(assert (=> b!298633 (= e!214229 e!214228)))

(declare-fun res!246417 () Bool)

(assert (=> b!298633 (=> (not res!246417) (not e!214228))))

(declare-fun i!1010 () (_ BitVec 64))

(assert (=> b!298633 (= res!246417 (bvsle i!1010 at!286))))

(declare-fun lt!434738 () (_ BitVec 32))

(assert (=> b!298633 (= lt!434738 ((_ extract 31 0) (bvsrem at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!434739 () (_ BitVec 32))

(assert (=> b!298633 (= lt!434739 ((_ extract 31 0) (bvsdiv at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!298634 () Bool)

(declare-fun res!246419 () Bool)

(assert (=> b!298634 (=> (not res!246419) (not e!214228))))

(declare-fun b!320 () Bool)

(declare-fun arrayBitRangesEq!0 (array!18068 array!18068 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298634 (= res!246419 (arrayBitRangesEq!0 a!434 (array!18069 (store (arr!8923 a!434) lt!434739 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8923 a!434) lt!434739)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434738)))) ((_ sign_extend 24) (ite b!320 (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434738) #b00000000))))) (size!7840 a!434)) i!1010 at!286))))

(declare-fun b!298635 () Bool)

(assert (=> b!298635 (= e!214228 (and (= i!1010 #b0000000000000000000000000000000000000000000000000000000000000000) (or (bvslt lt!434739 #b00000000000000000000000000000000) (bvsge lt!434739 (size!7840 a!434)))))))

(assert (= (and start!66814 res!246418) b!298633))

(assert (= (and b!298633 res!246417) b!298634))

(assert (= (and b!298634 res!246419) b!298635))

(declare-fun m!437797 () Bool)

(assert (=> start!66814 m!437797))

(declare-fun m!437799 () Bool)

(assert (=> b!298634 m!437799))

(declare-fun m!437801 () Bool)

(assert (=> b!298634 m!437801))

(declare-fun m!437803 () Bool)

(assert (=> b!298634 m!437803))

(declare-fun m!437805 () Bool)

(assert (=> b!298634 m!437805))

(push 1)

(assert (not start!66814))

(assert (not b!298634))

(check-sat)

(pop 1)

(push 1)

(check-sat)

