; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72290 () Bool)

(assert start!72290)

(declare-fun nBits!257 () (_ BitVec 32))

(assert (=> start!72290 (and (bvsle #b00000000000000000000000000000000 nBits!257) (bvsle nBits!257 #b00000000000000000000000001000000) (let ((bdg!18866 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!257)))) (or (bvslt bdg!18866 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt bdg!18866 #b0000000000000000000000000000000000000000000000000000000001000000))))))

(assert (=> start!72290 true))

(push 1)

(check-sat)

(pop 1)

