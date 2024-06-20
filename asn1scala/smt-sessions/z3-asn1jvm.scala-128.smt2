; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3160 () Bool)

(assert start!3160)

(declare-fun uintSizeInBytes!2 () (_ BitVec 32))

(assert (=> start!3160 (and (bvsge uintSizeInBytes!2 #b00000000000000000000000000000001) (bvsle uintSizeInBytes!2 #b00000000000000000000000000001001) (not (= (bvand uintSizeInBytes!2 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (not (= (bvand uintSizeInBytes!2 #b10000000000000000000000000000000) (bvand (bvsub uintSizeInBytes!2 #b00000000000000000000000000000001) #b10000000000000000000000000000000))))))

(assert (=> start!3160 true))

(check-sat)
