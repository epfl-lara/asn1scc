; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49344 () Bool)

(assert start!49344)

(declare-fun from2!7 () (_ BitVec 64))

(declare-datatypes ((array!12142 0))(
  ( (array!12143 (arr!6316 (Array (_ BitVec 32) (_ BitVec 8))) (size!5329 (_ BitVec 32))) )
))
(declare-fun arr2!24 () array!12142)

(declare-fun nBits!495 () (_ BitVec 64))

(declare-fun arr1!24 () array!12142)

(declare-fun from1!7 () (_ BitVec 64))

(assert (=> start!49344 (and (bvsge from1!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from2!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!495 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from2!7 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!495)) (bvslt from1!7 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!495)) (bvsle (bvadd from1!7 nBits!495) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5329 arr1!24)))) (not (= ((_ sign_extend 32) (size!5329 arr2!24)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5329 arr2!24))) ((_ sign_extend 32) (size!5329 arr2!24))))))))

(assert (=> start!49344 true))

(declare-fun array_inv!5070 (array!12142) Bool)

(assert (=> start!49344 (array_inv!5070 arr2!24)))

(assert (=> start!49344 (array_inv!5070 arr1!24)))

(declare-fun bs!19477 () Bool)

(assert (= bs!19477 start!49344))

(declare-fun m!356561 () Bool)

(assert (=> bs!19477 m!356561))

(declare-fun m!356563 () Bool)

(assert (=> bs!19477 m!356563))

(push 1)

(assert (not start!49344))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

