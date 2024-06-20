; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49362 () Bool)

(assert start!49362)

(declare-fun from2!7 () (_ BitVec 64))

(declare-datatypes ((array!12160 0))(
  ( (array!12161 (arr!6325 (Array (_ BitVec 32) (_ BitVec 8))) (size!5338 (_ BitVec 32))) )
))
(declare-fun arr2!24 () array!12160)

(declare-fun nBits!495 () (_ BitVec 64))

(declare-fun arr1!24 () array!12160)

(declare-fun from1!7 () (_ BitVec 64))

(assert (=> start!49362 (and (bvsge from1!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from2!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!495 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from2!7 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!495)) (bvslt from1!7 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!495)) (bvsle (bvadd from1!7 nBits!495) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5338 arr1!24)))) (bvsle (bvadd from2!7 nBits!495) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5338 arr2!24)))) (not (= nBits!495 #b0000000000000000000000000000000000000000000000000000000000000000)) (let ((bdg!14447 ((_ extract 31 0) (bvsrem from1!7 #b0000000000000000000000000000000000000000000000000000000000001000)))) (or (bvslt bdg!14447 #b00000000000000000000000000000000) (bvsge bdg!14447 #b00000000000000000000000000001000))))))

(assert (=> start!49362 true))

(declare-fun array_inv!5079 (array!12160) Bool)

(assert (=> start!49362 (array_inv!5079 arr2!24)))

(assert (=> start!49362 (array_inv!5079 arr1!24)))

(declare-fun bs!19495 () Bool)

(assert (= bs!19495 start!49362))

(declare-fun m!356597 () Bool)

(assert (=> bs!19495 m!356597))

(declare-fun m!356599 () Bool)

(assert (=> bs!19495 m!356599))

(push 1)

(assert (not start!49362))

(check-sat)

(pop 1)

(push 1)

(check-sat)

