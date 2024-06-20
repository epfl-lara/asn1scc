; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49388 () Bool)

(assert start!49388)

(declare-fun from2!7 () (_ BitVec 64))

(declare-datatypes ((array!12186 0))(
  ( (array!12187 (arr!6338 (Array (_ BitVec 32) (_ BitVec 8))) (size!5351 (_ BitVec 32))) )
))
(declare-fun arr2!24 () array!12186)

(declare-fun nBits!495 () (_ BitVec 64))

(declare-fun arr1!24 () array!12186)

(declare-fun from1!7 () (_ BitVec 64))

(assert (=> start!49388 (and (bvsge from1!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from2!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!495 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from2!7 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!495)) (bvslt from1!7 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!495)) (bvsle (bvadd from1!7 nBits!495) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5351 arr1!24)))) (bvsle (bvadd from2!7 nBits!495) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5351 arr2!24)))) (not (= nBits!495 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvsdiv from1!7 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(assert (=> start!49388 true))

(declare-fun array_inv!5092 (array!12186) Bool)

(assert (=> start!49388 (array_inv!5092 arr2!24)))

(assert (=> start!49388 (array_inv!5092 arr1!24)))

(declare-fun bs!19520 () Bool)

(assert (= bs!19520 start!49388))

(declare-fun m!356649 () Bool)

(assert (=> bs!19520 m!356649))

(declare-fun m!356651 () Bool)

(assert (=> bs!19520 m!356651))

(check-sat (not start!49388))
(check-sat)
