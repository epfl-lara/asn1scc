; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49334 () Bool)

(assert start!49334)

(declare-fun from2!7 () (_ BitVec 64))

(declare-fun nBits!495 () (_ BitVec 64))

(declare-datatypes ((array!12132 0))(
  ( (array!12133 (arr!6311 (Array (_ BitVec 32) (_ BitVec 8))) (size!5324 (_ BitVec 32))) )
))
(declare-fun arr1!24 () array!12132)

(declare-fun from1!7 () (_ BitVec 64))

(assert (=> start!49334 (and (bvsge from1!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from2!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!495 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from2!7 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!495)) (bvslt from1!7 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!495)) (not (= ((_ sign_extend 32) (size!5324 arr1!24)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5324 arr1!24))) ((_ sign_extend 32) (size!5324 arr1!24))))))))

(assert (=> start!49334 true))

(declare-fun array_inv!5065 (array!12132) Bool)

(assert (=> start!49334 (array_inv!5065 arr1!24)))

(declare-fun bs!19466 () Bool)

(assert (= bs!19466 start!49334))

(declare-fun m!356551 () Bool)

(assert (=> bs!19466 m!356551))

(check-sat (not start!49334))
(check-sat)
