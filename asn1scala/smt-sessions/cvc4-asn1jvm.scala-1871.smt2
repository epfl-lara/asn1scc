; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49492 () Bool)

(assert start!49492)

(declare-fun l!233 () (_ BitVec 64))

(declare-fun i!785 () (_ BitVec 32))

(assert (=> start!49492 (and (bvsge l!233 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!785 #b00000000000000000000000000000000) (bvslt i!785 #b00000000000000000000000001000000) (or (and (= i!785 #b00000000000000000000000000000000) (bvsge #b0111111111111111111111111111111111111111111111111111111111111111 l!233)) (bvsge (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub #b00000000000000000000000000111111 i!785))) l!233)) (bvslt i!785 #b00000000000000000000000000111111) (not (= l!233 #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand i!785 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand i!785 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!785) #b10000000000000000000000000000000))))))

(assert (=> start!49492 true))

(push 1)

(check-sat)

