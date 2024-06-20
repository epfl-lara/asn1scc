; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49396 () Bool)

(assert start!49396)

(declare-fun from2!7 () (_ BitVec 64))

(declare-datatypes ((array!12194 0))(
  ( (array!12195 (arr!6342 (Array (_ BitVec 32) (_ BitVec 8))) (size!5355 (_ BitVec 32))) )
))
(declare-fun arr2!24 () array!12194)

(declare-fun nBits!495 () (_ BitVec 64))

(declare-fun arr1!24 () array!12194)

(declare-fun from1!7 () (_ BitVec 64))

(assert (=> start!49396 (and (bvsge from1!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from2!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!495 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from2!7 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!495)) (bvslt from1!7 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!495)) (bvsle (bvadd from1!7 nBits!495) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5355 arr1!24)))) (bvsle (bvadd from2!7 nBits!495) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5355 arr2!24)))) (not (= nBits!495 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvsdiv from1!7 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsdiv from1!7 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> start!49396 true))

(declare-fun array_inv!5096 (array!12194) Bool)

(assert (=> start!49396 (array_inv!5096 arr2!24)))

(assert (=> start!49396 (array_inv!5096 arr1!24)))

(declare-fun bs!19527 () Bool)

(assert (= bs!19527 start!49396))

(declare-fun m!356665 () Bool)

(assert (=> bs!19527 m!356665))

(declare-fun m!356667 () Bool)

(assert (=> bs!19527 m!356667))

(push 1)

(assert (not start!49396))

(check-sat)

(pop 1)

(push 1)

(check-sat)

