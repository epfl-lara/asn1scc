; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74026 () Bool)

(assert start!74026)

(declare-fun nBits!261 () (_ BitVec 32))

(assert (=> start!74026 (and (bvsle #b00000000000000000000000000000000 nBits!261) (bvsle nBits!261 #b00000000000000000000000001000000) (not (= nBits!261 #b00000000000000000000000000000000)) (let ((bdg!18969 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!261)))) (or (bvslt bdg!18969 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt bdg!18969 #b0000000000000000000000000000000000000000000000000000000001000000))))))

(assert (=> start!74026 true))

(push 1)

(check-sat)

(pop 1)

