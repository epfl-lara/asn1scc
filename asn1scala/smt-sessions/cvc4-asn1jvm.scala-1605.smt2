; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45650 () Bool)

(assert start!45650)

(declare-fun i!541 () (_ BitVec 32))

(declare-fun nBits!265 () (_ BitVec 32))

(assert (=> start!45650 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000) (not (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand i!541 #b10000000000000000000000000000000))) (not (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand (bvsub nBits!265 i!541) #b10000000000000000000000000000000))))))

(assert (=> start!45650 true))

(push 1)

(check-sat)

