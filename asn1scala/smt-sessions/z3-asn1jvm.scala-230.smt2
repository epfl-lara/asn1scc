; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4644 () Bool)

(assert start!4644)

(declare-fun i!466 () (_ BitVec 32))

(assert (=> start!4644 (and (not (= ((_ sign_extend 32) (bvand i!466 #b00000000000000000000000011111111)) #b0000000000000000000000000000000000000000000000000000000010000000)) (= (bvand ((_ sign_extend 32) i!466) #b0000000000000000000000000000000000000000000000000000000010000000) #b0000000000000000000000000000000000000000000000000000000010000000) (bvsge (bvsub (bvand ((_ sign_extend 32) i!466) #b0000000000000000000000000000000000000000000000000000000001111111) #b0000000000000000000000000000000000000000000000000000000010000000) #b0000000000000000000000000000000000000000000000000000000010000000))))

(assert (=> start!4644 true))

(check-sat)
