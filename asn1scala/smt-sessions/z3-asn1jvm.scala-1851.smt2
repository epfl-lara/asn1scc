; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49370 () Bool)

(assert start!49370)

(declare-fun from2!7 () (_ BitVec 64))

(declare-datatypes ((array!12168 0))(
  ( (array!12169 (arr!6329 (Array (_ BitVec 32) (_ BitVec 8))) (size!5342 (_ BitVec 32))) )
))
(declare-fun arr2!24 () array!12168)

(declare-fun nBits!495 () (_ BitVec 64))

(declare-fun arr1!24 () array!12168)

(declare-fun from1!7 () (_ BitVec 64))

(assert (=> start!49370 (and (bvsge from1!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from2!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!495 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from2!7 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!495)) (bvslt from1!7 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!495)) (bvsle (bvadd from1!7 nBits!495) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5342 arr1!24)))) (bvsle (bvadd from2!7 nBits!495) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5342 arr2!24)))) (not (= nBits!495 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvsrem from2!7 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(assert (=> start!49370 true))

(declare-fun array_inv!5083 (array!12168) Bool)

(assert (=> start!49370 (array_inv!5083 arr2!24)))

(assert (=> start!49370 (array_inv!5083 arr1!24)))

(declare-fun bs!19502 () Bool)

(assert (= bs!19502 start!49370))

(declare-fun m!356613 () Bool)

(assert (=> bs!19502 m!356613))

(declare-fun m!356615 () Bool)

(assert (=> bs!19502 m!356615))

(check-sat (not start!49370))
(check-sat)
