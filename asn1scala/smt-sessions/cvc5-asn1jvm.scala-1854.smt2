; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49386 () Bool)

(assert start!49386)

(declare-fun from2!7 () (_ BitVec 64))

(declare-datatypes ((array!12184 0))(
  ( (array!12185 (arr!6337 (Array (_ BitVec 32) (_ BitVec 8))) (size!5350 (_ BitVec 32))) )
))
(declare-fun arr2!24 () array!12184)

(declare-fun nBits!495 () (_ BitVec 64))

(declare-fun arr1!24 () array!12184)

(declare-fun from1!7 () (_ BitVec 64))

(assert (=> start!49386 (and (bvsge from1!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from2!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!495 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from2!7 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!495)) (bvslt from1!7 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!495)) (bvsle (bvadd from1!7 nBits!495) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5350 arr1!24)))) (bvsle (bvadd from2!7 nBits!495) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5350 arr2!24)))) (not (= nBits!495 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvsdiv from1!7 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(assert (=> start!49386 true))

(declare-fun array_inv!5091 (array!12184) Bool)

(assert (=> start!49386 (array_inv!5091 arr2!24)))

(assert (=> start!49386 (array_inv!5091 arr1!24)))

(declare-fun bs!19519 () Bool)

(assert (= bs!19519 start!49386))

(declare-fun m!356645 () Bool)

(assert (=> bs!19519 m!356645))

(declare-fun m!356647 () Bool)

(assert (=> bs!19519 m!356647))

(push 1)

(assert (not start!49386))

(check-sat)

(pop 1)

(push 1)

(check-sat)

