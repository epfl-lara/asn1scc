; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72292 () Bool)

(assert start!72292)

(declare-fun nBits!257 () (_ BitVec 32))

(assert (=> start!72292 (and (bvsle #b00000000000000000000000000000000 nBits!257) (bvsle nBits!257 #b00000000000000000000000001000000) (let ((bdg!18866 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!257)))) (or (bvslt bdg!18866 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt bdg!18866 #b0000000000000000000000000000000000000000000000000000000001000000))))))

(assert (=> start!72292 true))

(check-sat)
