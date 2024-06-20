; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50216 () Bool)

(assert start!50216)

(declare-fun i!756 () (_ BitVec 32))

(declare-fun nBits!593 () (_ BitVec 32))

(assert (=> start!50216 (and (bvsle #b00000000000000000000000000000000 i!756) (bvsle i!756 nBits!593) (bvsle nBits!593 #b00000000000000000000000001000000) (not (= (bvand nBits!593 #b10000000000000000000000000000000) (bvand i!756 #b10000000000000000000000000000000))) (not (= (bvand nBits!593 #b10000000000000000000000000000000) (bvand (bvsub nBits!593 i!756) #b10000000000000000000000000000000))))))

(assert (=> start!50216 true))

(check-sat)
