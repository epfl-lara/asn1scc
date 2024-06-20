; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49384 () Bool)

(assert start!49384)

(declare-fun from2!7 () (_ BitVec 64))

(declare-datatypes ((array!12182 0))(
  ( (array!12183 (arr!6336 (Array (_ BitVec 32) (_ BitVec 8))) (size!5349 (_ BitVec 32))) )
))
(declare-fun arr2!24 () array!12182)

(declare-fun nBits!495 () (_ BitVec 64))

(declare-fun arr1!24 () array!12182)

(declare-fun from1!7 () (_ BitVec 64))

(assert (=> start!49384 (and (bvsge from1!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from2!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!495 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from2!7 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!495)) (bvslt from1!7 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!495)) (bvsle (bvadd from1!7 nBits!495) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5349 arr1!24)))) (bvsle (bvadd from2!7 nBits!495) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5349 arr2!24)))) (not (= nBits!495 #b0000000000000000000000000000000000000000000000000000000000000000)) (let ((bdg!14448 ((_ extract 31 0) (bvsrem from2!7 #b0000000000000000000000000000000000000000000000000000000000001000)))) (or (bvslt bdg!14448 #b00000000000000000000000000000000) (bvsge bdg!14448 #b00000000000000000000000000001000))))))

(assert (=> start!49384 true))

(declare-fun array_inv!5090 (array!12182) Bool)

(assert (=> start!49384 (array_inv!5090 arr2!24)))

(assert (=> start!49384 (array_inv!5090 arr1!24)))

(declare-fun bs!19515 () Bool)

(assert (= bs!19515 start!49384))

(declare-fun m!356641 () Bool)

(assert (=> bs!19515 m!356641))

(declare-fun m!356643 () Bool)

(assert (=> bs!19515 m!356643))

(push 1)

(assert (not start!49384))

(check-sat)

(pop 1)

(push 1)

(check-sat)

