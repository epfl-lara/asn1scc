; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49416 () Bool)

(assert start!49416)

(declare-fun from2!7 () (_ BitVec 64))

(declare-datatypes ((array!12214 0))(
  ( (array!12215 (arr!6352 (Array (_ BitVec 32) (_ BitVec 8))) (size!5365 (_ BitVec 32))) )
))
(declare-fun arr2!24 () array!12214)

(declare-fun nBits!495 () (_ BitVec 64))

(declare-fun arr1!24 () array!12214)

(declare-fun from1!7 () (_ BitVec 64))

(assert (=> start!49416 (and (bvsge from1!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from2!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!495 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from2!7 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!495)) (bvslt from1!7 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!495)) (bvsle (bvadd from1!7 nBits!495) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5365 arr1!24)))) (bvsle (bvadd from2!7 nBits!495) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5365 arr2!24)))) (not (= nBits!495 #b0000000000000000000000000000000000000000000000000000000000000000)) (let ((bdg!14450 ((_ extract 31 0) (bvsdiv from2!7 #b0000000000000000000000000000000000000000000000000000000000001000)))) (or (bvslt bdg!14450 #b00000000000000000000000000000000) (bvsge bdg!14450 (size!5365 arr2!24)))))))

(assert (=> start!49416 true))

(declare-fun array_inv!5106 (array!12214) Bool)

(assert (=> start!49416 (array_inv!5106 arr2!24)))

(assert (=> start!49416 (array_inv!5106 arr1!24)))

(declare-fun bs!19549 () Bool)

(assert (= bs!19549 start!49416))

(declare-fun m!356705 () Bool)

(assert (=> bs!19549 m!356705))

(declare-fun m!356707 () Bool)

(assert (=> bs!19549 m!356707))

(push 1)

(assert (not start!49416))

(check-sat)

(pop 1)

(push 1)

(check-sat)

