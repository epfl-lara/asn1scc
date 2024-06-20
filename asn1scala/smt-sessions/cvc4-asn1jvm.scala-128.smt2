; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3162 () Bool)

(assert start!3162)

(declare-fun uintSizeInBytes!2 () (_ BitVec 32))

(assert (=> start!3162 (and (bvsge uintSizeInBytes!2 #b00000000000000000000000000000001) (bvsle uintSizeInBytes!2 #b00000000000000000000000000001001) (not (= (bvand uintSizeInBytes!2 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (not (= (bvand uintSizeInBytes!2 #b10000000000000000000000000000000) (bvand (bvsub uintSizeInBytes!2 #b00000000000000000000000000000001) #b10000000000000000000000000000000))))))

(assert (=> start!3162 true))

(push 1)

(check-sat)

