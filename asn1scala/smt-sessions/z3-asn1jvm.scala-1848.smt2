; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49352 () Bool)

(assert start!49352)

(declare-fun from2!7 () (_ BitVec 64))

(declare-datatypes ((array!12150 0))(
  ( (array!12151 (arr!6320 (Array (_ BitVec 32) (_ BitVec 8))) (size!5333 (_ BitVec 32))) )
))
(declare-fun arr2!24 () array!12150)

(declare-fun nBits!495 () (_ BitVec 64))

(declare-fun arr1!24 () array!12150)

(declare-fun from1!7 () (_ BitVec 64))

(assert (=> start!49352 (and (bvsge from1!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from2!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!495 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from2!7 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!495)) (bvslt from1!7 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!495)) (bvsle (bvadd from1!7 nBits!495) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5333 arr1!24)))) (bvsle (bvadd from2!7 nBits!495) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5333 arr2!24)))) (not (= nBits!495 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvsrem from1!7 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(assert (=> start!49352 true))

(declare-fun array_inv!5074 (array!12150) Bool)

(assert (=> start!49352 (array_inv!5074 arr2!24)))

(assert (=> start!49352 (array_inv!5074 arr1!24)))

(declare-fun bs!19484 () Bool)

(assert (= bs!19484 start!49352))

(declare-fun m!356577 () Bool)

(assert (=> bs!19484 m!356577))

(declare-fun m!356579 () Bool)

(assert (=> bs!19484 m!356579))

(check-sat (not start!49352))
(check-sat)
