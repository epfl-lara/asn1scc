; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49368 () Bool)

(assert start!49368)

(declare-fun from2!7 () (_ BitVec 64))

(declare-datatypes ((array!12166 0))(
  ( (array!12167 (arr!6328 (Array (_ BitVec 32) (_ BitVec 8))) (size!5341 (_ BitVec 32))) )
))
(declare-fun arr2!24 () array!12166)

(declare-fun nBits!495 () (_ BitVec 64))

(declare-fun arr1!24 () array!12166)

(declare-fun from1!7 () (_ BitVec 64))

(assert (=> start!49368 (and (bvsge from1!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from2!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!495 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from2!7 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!495)) (bvslt from1!7 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!495)) (bvsle (bvadd from1!7 nBits!495) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5341 arr1!24)))) (bvsle (bvadd from2!7 nBits!495) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5341 arr2!24)))) (not (= nBits!495 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvsrem from2!7 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(assert (=> start!49368 true))

(declare-fun array_inv!5082 (array!12166) Bool)

(assert (=> start!49368 (array_inv!5082 arr2!24)))

(assert (=> start!49368 (array_inv!5082 arr1!24)))

(declare-fun bs!19501 () Bool)

(assert (= bs!19501 start!49368))

(declare-fun m!356609 () Bool)

(assert (=> bs!19501 m!356609))

(declare-fun m!356611 () Bool)

(assert (=> bs!19501 m!356611))

(push 1)

(assert (not start!49368))

(check-sat)

(pop 1)

(push 1)

(check-sat)

