; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72044 () Bool)

(assert start!72044)

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(assert (=> start!72044 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000) (not (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand i!743 #b10000000000000000000000000000000))) (not (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand (bvsub nBits!548 i!743) #b10000000000000000000000000000000))))))

(assert (=> start!72044 true))

(push 1)

(check-sat)

(pop 1)

