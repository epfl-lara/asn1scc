; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72284 () Bool)

(assert start!72284)

(declare-fun nBits!257 () (_ BitVec 32))

(assert (=> start!72284 (and (bvsle #b00000000000000000000000000000000 nBits!257) (bvsle nBits!257 #b00000000000000000000000001000000) (not (= #b00000000000000000000000000000000 (bvand nBits!257 #b10000000000000000000000000000000))) (not (= #b00000000000000000000000000000000 (bvand (bvsub #b00000000000000000000000001000000 nBits!257) #b10000000000000000000000000000000))))))

(assert (=> start!72284 true))

(push 1)

(check-sat)

(pop 1)

