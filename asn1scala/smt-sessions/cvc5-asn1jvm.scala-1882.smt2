; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49566 () Bool)

(assert start!49566)

(declare-fun l!233 () (_ BitVec 64))

(declare-fun i!785 () (_ BitVec 32))

(assert (=> start!49566 (and (bvsge l!233 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!785 #b00000000000000000000000000000000) (bvslt i!785 #b00000000000000000000000001000000) (or (and (= i!785 #b00000000000000000000000000000000) (bvsge #b0111111111111111111111111111111111111111111111111111111111111111 l!233)) (bvsge (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub #b00000000000000000000000000111111 i!785))) l!233)) (bvslt i!785 #b00000000000000000000000000111111) (not (= l!233 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (bvsge (bvadd #b00000000000000000000000000000001 i!785) #b00000000000000000000000000111111) (= (bvlshr l!233 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvlshr l!233 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!785) #b00000000000000000000000000000000) (let ((bdg!14463 ((_ sign_extend 32) (bvsub #b00000000000000000000000000111111 (bvadd #b00000000000000000000000000000001 i!785))))) (or (bvslt bdg!14463 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt bdg!14463 #b0000000000000000000000000000000000000000000000000000000001000000))))))

(assert (=> start!49566 true))

(push 1)

(check-sat)

(pop 1)

