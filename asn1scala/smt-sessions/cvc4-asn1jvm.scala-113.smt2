; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2724 () Bool)

(assert start!2724)

(declare-fun l!185 () (_ BitVec 64))

(assert (=> start!2724 (and (not (= l!185 #b0000000000000000000000000000000010000000000000000000000000000000)) (= (bvand l!185 #b0000000000000000000000000000000010000000000000000000000000000000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge (bvsub (bvand l!185 #b0000000000000000000000000000000001111111111111111111111111111111) #b0000000000000000000000000000000010000000000000000000000000000000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(assert (=> start!2724 true))

(push 1)

(check-sat)

(pop 1)

