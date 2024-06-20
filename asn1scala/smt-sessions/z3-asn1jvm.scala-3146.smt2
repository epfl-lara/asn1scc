; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72286 () Bool)

(assert start!72286)

(declare-fun nBits!257 () (_ BitVec 32))

(assert (=> start!72286 (and (bvsle #b00000000000000000000000000000000 nBits!257) (bvsle nBits!257 #b00000000000000000000000001000000) (not (= #b00000000000000000000000000000000 (bvand nBits!257 #b10000000000000000000000000000000))) (not (= #b00000000000000000000000000000000 (bvand (bvsub #b00000000000000000000000001000000 nBits!257) #b10000000000000000000000000000000))))))

(assert (=> start!72286 true))

(check-sat)
