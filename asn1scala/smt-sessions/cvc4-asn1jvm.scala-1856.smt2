; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49402 () Bool)

(assert start!49402)

(declare-fun from2!7 () (_ BitVec 64))

(declare-datatypes ((array!12200 0))(
  ( (array!12201 (arr!6345 (Array (_ BitVec 32) (_ BitVec 8))) (size!5358 (_ BitVec 32))) )
))
(declare-fun arr2!24 () array!12200)

(declare-fun nBits!495 () (_ BitVec 64))

(declare-fun arr1!24 () array!12200)

(declare-fun from1!7 () (_ BitVec 64))

(assert (=> start!49402 (and (bvsge from1!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from2!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!495 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from2!7 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!495)) (bvslt from1!7 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!495)) (bvsle (bvadd from1!7 nBits!495) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5358 arr1!24)))) (bvsle (bvadd from2!7 nBits!495) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5358 arr2!24)))) (not (= nBits!495 #b0000000000000000000000000000000000000000000000000000000000000000)) (let ((bdg!14449 ((_ extract 31 0) (bvsdiv from1!7 #b0000000000000000000000000000000000000000000000000000000000001000)))) (or (bvslt bdg!14449 #b00000000000000000000000000000000) (bvsge bdg!14449 (size!5358 arr1!24)))))))

(assert (=> start!49402 true))

(declare-fun array_inv!5099 (array!12200) Bool)

(assert (=> start!49402 (array_inv!5099 arr2!24)))

(assert (=> start!49402 (array_inv!5099 arr1!24)))

(declare-fun bs!19533 () Bool)

(assert (= bs!19533 start!49402))

(declare-fun m!356677 () Bool)

(assert (=> bs!19533 m!356677))

(declare-fun m!356679 () Bool)

(assert (=> bs!19533 m!356679))

(push 1)

(assert (not start!49402))

(check-sat)

(pop 1)

(push 1)

(check-sat)

