; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49382 () Bool)

(assert start!49382)

(declare-fun from2!7 () (_ BitVec 64))

(declare-datatypes ((array!12180 0))(
  ( (array!12181 (arr!6335 (Array (_ BitVec 32) (_ BitVec 8))) (size!5348 (_ BitVec 32))) )
))
(declare-fun arr2!24 () array!12180)

(declare-fun nBits!495 () (_ BitVec 64))

(declare-fun arr1!24 () array!12180)

(declare-fun from1!7 () (_ BitVec 64))

(assert (=> start!49382 (and (bvsge from1!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from2!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!495 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from2!7 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!495)) (bvslt from1!7 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!495)) (bvsle (bvadd from1!7 nBits!495) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5348 arr1!24)))) (bvsle (bvadd from2!7 nBits!495) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5348 arr2!24)))) (not (= nBits!495 #b0000000000000000000000000000000000000000000000000000000000000000)) (let ((bdg!14448 ((_ extract 31 0) (bvsrem from2!7 #b0000000000000000000000000000000000000000000000000000000000001000)))) (or (bvslt bdg!14448 #b00000000000000000000000000000000) (bvsge bdg!14448 #b00000000000000000000000000001000))))))

(assert (=> start!49382 true))

(declare-fun array_inv!5089 (array!12180) Bool)

(assert (=> start!49382 (array_inv!5089 arr2!24)))

(assert (=> start!49382 (array_inv!5089 arr1!24)))

(declare-fun bs!19514 () Bool)

(assert (= bs!19514 start!49382))

(declare-fun m!356637 () Bool)

(assert (=> bs!19514 m!356637))

(declare-fun m!356639 () Bool)

(assert (=> bs!19514 m!356639))

(check-sat (not start!49382))
(check-sat)
