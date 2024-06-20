; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71528 () Bool)

(assert start!71528)

(declare-fun i!747 () (_ BitVec 32))

(declare-fun nBits!568 () (_ BitVec 32))

(assert (=> start!71528 (and (bvsle #b00000000000000000000000000000000 i!747) (bvsle i!747 nBits!568) (bvsle nBits!568 #b00000000000000000000000001000000) (not (= (bvand nBits!568 #b10000000000000000000000000000000) (bvand i!747 #b10000000000000000000000000000000))) (not (= (bvand nBits!568 #b10000000000000000000000000000000) (bvand (bvsub nBits!568 i!747) #b10000000000000000000000000000000))))))

(assert (=> start!71528 true))

(push 1)

(check-sat)

(pop 1)

