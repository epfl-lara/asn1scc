; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74024 () Bool)

(assert start!74024)

(declare-fun nBits!261 () (_ BitVec 32))

(assert (=> start!74024 (and (bvsle #b00000000000000000000000000000000 nBits!261) (bvsle nBits!261 #b00000000000000000000000001000000) (not (= nBits!261 #b00000000000000000000000000000000)) (not (= #b00000000000000000000000000000000 (bvand nBits!261 #b10000000000000000000000000000000))) (not (= #b00000000000000000000000000000000 (bvand (bvsub #b00000000000000000000000001000000 nBits!261) #b10000000000000000000000000000000))))))

(assert (=> start!74024 true))

(push 1)

(check-sat)

(pop 1)

