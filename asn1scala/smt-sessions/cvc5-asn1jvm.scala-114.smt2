; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2726 () Bool)

(assert start!2726)

(declare-fun l!185 () (_ BitVec 64))

(assert (=> start!2726 (and (not (= l!185 #b0000000000000000000000000000000010000000000000000000000000000000)) (= (bvand l!185 #b0000000000000000000000000000000010000000000000000000000000000000) #b0000000000000000000000000000000010000000000000000000000000000000) (let ((bdg!398 (bvsub (bvand l!185 #b0000000000000000000000000000000001111111111111111111111111111111) #b0000000000000000000000000000000010000000000000000000000000000000))) (and (bvslt bdg!398 #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt bdg!398 #b1111111111111111111111111111111110000000000000000000000000000000))))))

(assert (=> start!2726 true))

(push 1)

(check-sat)

