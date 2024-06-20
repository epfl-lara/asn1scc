; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71530 () Bool)

(assert start!71530)

(declare-fun i!747 () (_ BitVec 32))

(declare-fun nBits!568 () (_ BitVec 32))

(assert (=> start!71530 (and (bvsle #b00000000000000000000000000000000 i!747) (bvsle i!747 nBits!568) (bvsle nBits!568 #b00000000000000000000000001000000) (not (= (bvand nBits!568 #b10000000000000000000000000000000) (bvand i!747 #b10000000000000000000000000000000))) (not (= (bvand nBits!568 #b10000000000000000000000000000000) (bvand (bvsub nBits!568 i!747) #b10000000000000000000000000000000))))))

(assert (=> start!71530 true))

(check-sat)
