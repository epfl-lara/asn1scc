; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49466 () Bool)

(assert start!49466)

(declare-fun l!233 () (_ BitVec 64))

(declare-fun i!785 () (_ BitVec 32))

(assert (=> start!49466 (and (bvsge l!233 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!785 #b00000000000000000000000000000000) (bvslt i!785 #b00000000000000000000000001000000) (or (not (= i!785 #b00000000000000000000000000000000)) (bvslt #b0111111111111111111111111111111111111111111111111111111111111111 l!233)) (let ((bdg!14455 ((_ sign_extend 32) (bvsub #b00000000000000000000000000111111 i!785)))) (or (bvslt bdg!14455 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt bdg!14455 #b0000000000000000000000000000000000000000000000000000000001000000))))))

(assert (=> start!49466 true))

(check-sat)
