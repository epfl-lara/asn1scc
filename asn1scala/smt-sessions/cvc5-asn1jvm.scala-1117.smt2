; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31926 () Bool)

(assert start!31926)

(declare-fun l!186 () (_ BitVec 64))

(assert (=> start!31926 (and (not (= l!186 #b0000000000000000000000000000000000000000000000001000000000000000)) (= (bvand l!186 #b0000000000000000000000000000000000000000000000001000000000000000) #b0000000000000000000000000000000000000000000000001000000000000000) (let ((bdg!9194 (bvand (bvand l!186 #b0000000000000000000000000000000000000000000000000111111111111111) #b1000000000000000000000000000000000000000000000000000000000000000))) (and (not (= bdg!9194 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= bdg!9194 (bvand (bvsub (bvand l!186 #b0000000000000000000000000000000000000000000000000111111111111111) #b0000000000000000000000000000000000000000000000001000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> start!31926 true))

(push 1)

(check-sat)

(pop 1)

