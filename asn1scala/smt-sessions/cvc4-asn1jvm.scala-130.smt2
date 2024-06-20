; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3174 () Bool)

(assert start!3174)

(declare-fun uintSizeInBytes!2 () (_ BitVec 32))

(assert (=> start!3174 (and (bvsge uintSizeInBytes!2 #b00000000000000000000000000000001) (bvsle uintSizeInBytes!2 #b00000000000000000000000000001001) (let ((bdg!433 ((_ sign_extend 32) (bvmul #b00000000000000000000000000001000 (bvsub uintSizeInBytes!2 #b00000000000000000000000000000001))))) (or (bvslt bdg!433 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt bdg!433 #b0000000000000000000000000000000000000000000000000000000001000000))))))

(assert (=> start!3174 true))

(push 1)

(check-sat)

