; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49418 () Bool)

(assert start!49418)

(declare-fun from2!7 () (_ BitVec 64))

(declare-datatypes ((array!12216 0))(
  ( (array!12217 (arr!6353 (Array (_ BitVec 32) (_ BitVec 8))) (size!5366 (_ BitVec 32))) )
))
(declare-fun arr2!24 () array!12216)

(declare-fun nBits!495 () (_ BitVec 64))

(declare-fun arr1!24 () array!12216)

(declare-fun from1!7 () (_ BitVec 64))

(assert (=> start!49418 (and (bvsge from1!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from2!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!495 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from2!7 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!495)) (bvslt from1!7 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!495)) (bvsle (bvadd from1!7 nBits!495) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5366 arr1!24)))) (bvsle (bvadd from2!7 nBits!495) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5366 arr2!24)))) (not (= nBits!495 #b0000000000000000000000000000000000000000000000000000000000000000)) (let ((bdg!14450 ((_ extract 31 0) (bvsdiv from2!7 #b0000000000000000000000000000000000000000000000000000000000001000)))) (or (bvslt bdg!14450 #b00000000000000000000000000000000) (bvsge bdg!14450 (size!5366 arr2!24)))))))

(assert (=> start!49418 true))

(declare-fun array_inv!5107 (array!12216) Bool)

(assert (=> start!49418 (array_inv!5107 arr2!24)))

(assert (=> start!49418 (array_inv!5107 arr1!24)))

(declare-fun bs!19550 () Bool)

(assert (= bs!19550 start!49418))

(declare-fun m!356709 () Bool)

(assert (=> bs!19550 m!356709))

(declare-fun m!356711 () Bool)

(assert (=> bs!19550 m!356711))

(check-sat (not start!49418))
(check-sat)
