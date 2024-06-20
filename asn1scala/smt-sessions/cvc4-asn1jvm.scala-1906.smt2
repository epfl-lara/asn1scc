; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50010 () Bool)

(assert start!50010)

(declare-fun i!546 () (_ BitVec 32))

(declare-fun nBits!274 () (_ BitVec 32))

(assert (=> start!50010 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000) (not (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand i!546 #b10000000000000000000000000000000))) (not (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 i!546) #b10000000000000000000000000000000))))))

(assert (=> start!50010 true))

(push 1)

(check-sat)

