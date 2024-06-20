; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49346 () Bool)

(assert start!49346)

(declare-fun from2!7 () (_ BitVec 64))

(declare-datatypes ((array!12144 0))(
  ( (array!12145 (arr!6317 (Array (_ BitVec 32) (_ BitVec 8))) (size!5330 (_ BitVec 32))) )
))
(declare-fun arr2!24 () array!12144)

(declare-fun nBits!495 () (_ BitVec 64))

(declare-fun arr1!24 () array!12144)

(declare-fun from1!7 () (_ BitVec 64))

(assert (=> start!49346 (and (bvsge from1!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from2!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!495 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from2!7 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!495)) (bvslt from1!7 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!495)) (bvsle (bvadd from1!7 nBits!495) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5330 arr1!24)))) (not (= ((_ sign_extend 32) (size!5330 arr2!24)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5330 arr2!24))) ((_ sign_extend 32) (size!5330 arr2!24))))))))

(assert (=> start!49346 true))

(declare-fun array_inv!5071 (array!12144) Bool)

(assert (=> start!49346 (array_inv!5071 arr2!24)))

(assert (=> start!49346 (array_inv!5071 arr1!24)))

(declare-fun bs!19478 () Bool)

(assert (= bs!19478 start!49346))

(declare-fun m!356565 () Bool)

(assert (=> bs!19478 m!356565))

(declare-fun m!356567 () Bool)

(assert (=> bs!19478 m!356567))

(check-sat (not start!49346))
(check-sat)
