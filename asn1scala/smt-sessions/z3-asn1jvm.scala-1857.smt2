; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49406 () Bool)

(assert start!49406)

(declare-fun from2!7 () (_ BitVec 64))

(declare-datatypes ((array!12204 0))(
  ( (array!12205 (arr!6347 (Array (_ BitVec 32) (_ BitVec 8))) (size!5360 (_ BitVec 32))) )
))
(declare-fun arr2!24 () array!12204)

(declare-fun nBits!495 () (_ BitVec 64))

(declare-fun arr1!24 () array!12204)

(declare-fun from1!7 () (_ BitVec 64))

(assert (=> start!49406 (and (bvsge from1!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from2!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!495 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from2!7 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!495)) (bvslt from1!7 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!495)) (bvsle (bvadd from1!7 nBits!495) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5360 arr1!24)))) (bvsle (bvadd from2!7 nBits!495) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5360 arr2!24)))) (not (= nBits!495 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvsdiv from2!7 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(assert (=> start!49406 true))

(declare-fun array_inv!5101 (array!12204) Bool)

(assert (=> start!49406 (array_inv!5101 arr2!24)))

(assert (=> start!49406 (array_inv!5101 arr1!24)))

(declare-fun bs!19538 () Bool)

(assert (= bs!19538 start!49406))

(declare-fun m!356685 () Bool)

(assert (=> bs!19538 m!356685))

(declare-fun m!356687 () Bool)

(assert (=> bs!19538 m!356687))

(check-sat (not start!49406))
(check-sat)
