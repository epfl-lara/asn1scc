; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3816 () Bool)

(assert start!3816)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun v!291 () (_ BitVec 64))

(assert (=> start!3816 (and (bvsge i!803 #b00000000000000000000000000000001) (bvsle i!803 #b00000000000000000000000001000000) (bvsge i!803 #b00000000000000000000000000000010) (= (not (= (bvand v!291 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub i!803 #b00000000000000000000000000000010)))) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand v!291 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000))) (bvslt i!803 #b00000000000000000000000000000000))))

(assert (=> start!3816 true))

(push 1)

(check-sat)

