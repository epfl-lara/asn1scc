; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49296 () Bool)

(assert start!49296)

(declare-fun from2!7 () (_ BitVec 64))

(declare-datatypes ((array!12112 0))(
  ( (array!12113 (arr!6301 (Array (_ BitVec 32) (_ BitVec 8))) (size!5314 (_ BitVec 32))) )
))
(declare-fun arr2!24 () array!12112)

(declare-fun nBits!495 () (_ BitVec 64))

(declare-fun arr1!24 () array!12112)

(declare-fun from1!7 () (_ BitVec 64))

(assert (=> start!49296 (and (bvsge from1!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from2!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!495 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from2!7 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!495)) (bvslt from1!7 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!495)) (bvsle (bvadd from1!7 nBits!495) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5314 arr1!24)))) (bvsle (bvadd from2!7 nBits!495) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5314 arr2!24)))) (not (= nBits!495 #b0000000000000000000000000000000000000000000000000000000000000000)) (= (not (= (bvand ((_ sign_extend 24) (select (arr!6301 arr1!24) ((_ extract 31 0) (bvsdiv from1!7 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from1!7 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!6301 arr2!24) ((_ extract 31 0) (bvsdiv from2!7 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from2!7 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))) (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from1!7) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!49296 true))

(declare-fun array_inv!5055 (array!12112) Bool)

(assert (=> start!49296 (array_inv!5055 arr2!24)))

(assert (=> start!49296 (array_inv!5055 arr1!24)))

(declare-fun bs!19438 () Bool)

(assert (= bs!19438 start!49296))

(declare-fun m!356441 () Bool)

(assert (=> bs!19438 m!356441))

(declare-fun m!356443 () Bool)

(assert (=> bs!19438 m!356443))

(declare-fun m!356445 () Bool)

(assert (=> bs!19438 m!356445))

(declare-fun m!356447 () Bool)

(assert (=> bs!19438 m!356447))

(declare-fun m!356449 () Bool)

(assert (=> bs!19438 m!356449))

(declare-fun m!356451 () Bool)

(assert (=> bs!19438 m!356451))

(push 1)

(assert (not start!49296))

(check-sat)

(pop 1)

(push 1)

(check-sat)

