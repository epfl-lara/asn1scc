; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49614 () Bool)

(assert start!49614)

(declare-fun l!187 () (_ BitVec 64))

(assert (=> start!49614 (and (not (= (bvand l!187 #b0000000000000000000000000000000000000000000000000000000011111111) #b0000000000000000000000000000000000000000000000000000000010000000)) (= (bvand l!187 #b0000000000000000000000000000000000000000000000000000000010000000) #b0000000000000000000000000000000000000000000000000000000010000000) (let ((bdg!14466 (bvsub (bvand l!187 #b0000000000000000000000000000000000000000000000000000000001111111) #b0000000000000000000000000000000000000000000000000000000010000000))) (and (bvslt bdg!14466 #b0000000000000000000000000000000000000000000000000000000010000000) (bvslt bdg!14466 #b1111111111111111111111111111111111111111111111111111111110000000))))))

(assert (=> start!49614 true))

(push 1)

(check-sat)

(pop 1)

