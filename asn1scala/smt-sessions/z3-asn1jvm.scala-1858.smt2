; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49412 () Bool)

(assert start!49412)

(declare-fun from2!7 () (_ BitVec 64))

(declare-datatypes ((array!12210 0))(
  ( (array!12211 (arr!6350 (Array (_ BitVec 32) (_ BitVec 8))) (size!5363 (_ BitVec 32))) )
))
(declare-fun arr2!24 () array!12210)

(declare-fun nBits!495 () (_ BitVec 64))

(declare-fun arr1!24 () array!12210)

(declare-fun from1!7 () (_ BitVec 64))

(assert (=> start!49412 (and (bvsge from1!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from2!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!495 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from2!7 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!495)) (bvslt from1!7 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!495)) (bvsle (bvadd from1!7 nBits!495) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5363 arr1!24)))) (bvsle (bvadd from2!7 nBits!495) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5363 arr2!24)))) (not (= nBits!495 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvsdiv from2!7 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsdiv from2!7 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> start!49412 true))

(declare-fun array_inv!5104 (array!12210) Bool)

(assert (=> start!49412 (array_inv!5104 arr2!24)))

(assert (=> start!49412 (array_inv!5104 arr1!24)))

(declare-fun bs!19544 () Bool)

(assert (= bs!19544 start!49412))

(declare-fun m!356697 () Bool)

(assert (=> bs!19544 m!356697))

(declare-fun m!356699 () Bool)

(assert (=> bs!19544 m!356699))

(check-sat (not start!49412))
(check-sat)
