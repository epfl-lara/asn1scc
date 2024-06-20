; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49332 () Bool)

(assert start!49332)

(declare-fun from2!7 () (_ BitVec 64))

(declare-fun nBits!495 () (_ BitVec 64))

(declare-datatypes ((array!12130 0))(
  ( (array!12131 (arr!6310 (Array (_ BitVec 32) (_ BitVec 8))) (size!5323 (_ BitVec 32))) )
))
(declare-fun arr1!24 () array!12130)

(declare-fun from1!7 () (_ BitVec 64))

(assert (=> start!49332 (and (bvsge from1!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from2!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!495 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from2!7 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!495)) (bvslt from1!7 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!495)) (not (= ((_ sign_extend 32) (size!5323 arr1!24)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5323 arr1!24))) ((_ sign_extend 32) (size!5323 arr1!24))))))))

(assert (=> start!49332 true))

(declare-fun array_inv!5064 (array!12130) Bool)

(assert (=> start!49332 (array_inv!5064 arr1!24)))

(declare-fun bs!19465 () Bool)

(assert (= bs!19465 start!49332))

(declare-fun m!356549 () Bool)

(assert (=> bs!19465 m!356549))

(push 1)

(assert (not start!49332))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

