; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3168 () Bool)

(assert start!3168)

(declare-fun uintSizeInBytes!2 () (_ BitVec 32))

(assert (=> start!3168 (and (bvsge uintSizeInBytes!2 #b00000000000000000000000000000001) (bvsle uintSizeInBytes!2 #b00000000000000000000000000001001) (not (= (bvsub uintSizeInBytes!2 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= #b00000000000000000000000000001000 (bvsdiv (bvmul #b00000000000000000000000000001000 (bvsub uintSizeInBytes!2 #b00000000000000000000000000000001)) (bvsub uintSizeInBytes!2 #b00000000000000000000000000000001)))))))

(assert (=> start!3168 true))

(push 1)

(check-sat)

