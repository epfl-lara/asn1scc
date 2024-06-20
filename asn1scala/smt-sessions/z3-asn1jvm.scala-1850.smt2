; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49364 () Bool)

(assert start!49364)

(declare-fun from2!7 () (_ BitVec 64))

(declare-datatypes ((array!12162 0))(
  ( (array!12163 (arr!6326 (Array (_ BitVec 32) (_ BitVec 8))) (size!5339 (_ BitVec 32))) )
))
(declare-fun arr2!24 () array!12162)

(declare-fun nBits!495 () (_ BitVec 64))

(declare-fun arr1!24 () array!12162)

(declare-fun from1!7 () (_ BitVec 64))

(assert (=> start!49364 (and (bvsge from1!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from2!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!495 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from2!7 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!495)) (bvslt from1!7 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!495)) (bvsle (bvadd from1!7 nBits!495) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5339 arr1!24)))) (bvsle (bvadd from2!7 nBits!495) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5339 arr2!24)))) (not (= nBits!495 #b0000000000000000000000000000000000000000000000000000000000000000)) (let ((bdg!14447 ((_ extract 31 0) (bvsrem from1!7 #b0000000000000000000000000000000000000000000000000000000000001000)))) (or (bvslt bdg!14447 #b00000000000000000000000000000000) (bvsge bdg!14447 #b00000000000000000000000000001000))))))

(assert (=> start!49364 true))

(declare-fun array_inv!5080 (array!12162) Bool)

(assert (=> start!49364 (array_inv!5080 arr2!24)))

(assert (=> start!49364 (array_inv!5080 arr1!24)))

(declare-fun bs!19496 () Bool)

(assert (= bs!19496 start!49364))

(declare-fun m!356601 () Bool)

(assert (=> bs!19496 m!356601))

(declare-fun m!356603 () Bool)

(assert (=> bs!19496 m!356603))

(check-sat (not start!49364))
(check-sat)
