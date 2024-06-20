; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49400 () Bool)

(assert start!49400)

(declare-fun from2!7 () (_ BitVec 64))

(declare-datatypes ((array!12198 0))(
  ( (array!12199 (arr!6344 (Array (_ BitVec 32) (_ BitVec 8))) (size!5357 (_ BitVec 32))) )
))
(declare-fun arr2!24 () array!12198)

(declare-fun nBits!495 () (_ BitVec 64))

(declare-fun arr1!24 () array!12198)

(declare-fun from1!7 () (_ BitVec 64))

(assert (=> start!49400 (and (bvsge from1!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from2!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!495 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from2!7 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!495)) (bvslt from1!7 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!495)) (bvsle (bvadd from1!7 nBits!495) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5357 arr1!24)))) (bvsle (bvadd from2!7 nBits!495) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5357 arr2!24)))) (not (= nBits!495 #b0000000000000000000000000000000000000000000000000000000000000000)) (let ((bdg!14449 ((_ extract 31 0) (bvsdiv from1!7 #b0000000000000000000000000000000000000000000000000000000000001000)))) (or (bvslt bdg!14449 #b00000000000000000000000000000000) (bvsge bdg!14449 (size!5357 arr1!24)))))))

(assert (=> start!49400 true))

(declare-fun array_inv!5098 (array!12198) Bool)

(assert (=> start!49400 (array_inv!5098 arr2!24)))

(assert (=> start!49400 (array_inv!5098 arr1!24)))

(declare-fun bs!19532 () Bool)

(assert (= bs!19532 start!49400))

(declare-fun m!356673 () Bool)

(assert (=> bs!19532 m!356673))

(declare-fun m!356675 () Bool)

(assert (=> bs!19532 m!356675))

(check-sat (not start!49400))
(check-sat)
