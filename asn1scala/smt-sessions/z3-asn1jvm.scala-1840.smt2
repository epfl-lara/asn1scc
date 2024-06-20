; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49304 () Bool)

(assert start!49304)

(declare-fun from2!7 () (_ BitVec 64))

(declare-datatypes ((array!12120 0))(
  ( (array!12121 (arr!6305 (Array (_ BitVec 32) (_ BitVec 8))) (size!5318 (_ BitVec 32))) )
))
(declare-fun arr2!24 () array!12120)

(declare-fun nBits!495 () (_ BitVec 64))

(declare-fun arr1!24 () array!12120)

(declare-fun from1!7 () (_ BitVec 64))

(assert (=> start!49304 (and (bvsge from1!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from2!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!495 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from2!7 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!495)) (bvslt from1!7 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!495)) (bvsle (bvadd from1!7 nBits!495) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5318 arr1!24)))) (bvsle (bvadd from2!7 nBits!495) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5318 arr2!24)))) (not (= nBits!495 #b0000000000000000000000000000000000000000000000000000000000000000)) (= (not (= (bvand ((_ sign_extend 24) (select (arr!6305 arr1!24) ((_ extract 31 0) (bvsdiv from1!7 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from1!7 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!6305 arr2!24) ((_ extract 31 0) (bvsdiv from2!7 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from2!7 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from1!7) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from2!7) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!49304 true))

(declare-fun array_inv!5059 (array!12120) Bool)

(assert (=> start!49304 (array_inv!5059 arr2!24)))

(assert (=> start!49304 (array_inv!5059 arr1!24)))

(declare-fun bs!19445 () Bool)

(assert (= bs!19445 start!49304))

(declare-fun m!356489 () Bool)

(assert (=> bs!19445 m!356489))

(declare-fun m!356491 () Bool)

(assert (=> bs!19445 m!356491))

(declare-fun m!356493 () Bool)

(assert (=> bs!19445 m!356493))

(declare-fun m!356495 () Bool)

(assert (=> bs!19445 m!356495))

(declare-fun m!356497 () Bool)

(assert (=> bs!19445 m!356497))

(declare-fun m!356499 () Bool)

(assert (=> bs!19445 m!356499))

(check-sat (not start!49304))
(check-sat)
