; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45648 () Bool)

(assert start!45648)

(declare-fun i!541 () (_ BitVec 32))

(declare-fun nBits!265 () (_ BitVec 32))

(assert (=> start!45648 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000) (not (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand i!541 #b10000000000000000000000000000000))) (not (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand (bvsub nBits!265 i!541) #b10000000000000000000000000000000))))))

(assert (=> start!45648 true))

(check-sat)
