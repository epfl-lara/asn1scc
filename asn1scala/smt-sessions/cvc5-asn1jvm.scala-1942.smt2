; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50732 () Bool)

(assert start!50732)

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(assert (=> start!50732 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000) (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand i!752 #b10000000000000000000000000000000))) (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 i!752) #b10000000000000000000000000000000))))))

(assert (=> start!50732 true))

(push 1)

(check-sat)

(pop 1)

