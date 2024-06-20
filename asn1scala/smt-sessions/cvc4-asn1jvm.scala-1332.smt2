; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37448 () Bool)

(assert start!37448)

(declare-fun uintSizeInBytes!5 () (_ BitVec 32))

(declare-fun v!147 () (_ BitVec 64))

(declare-fun i!474 () (_ BitVec 32))

(declare-datatypes ((Unit!11885 0))(
  ( (Unit!11886) )
))
(declare-datatypes ((ControlFlow!60 0))(
  ( (Return!59 (value!6849 (_ BitVec 64))) (Proceed!59 (value!6850 Unit!11885)) )
))
(declare-fun Unit!11887 () Unit!11885)

(assert (=> start!37448 (and (bvsge uintSizeInBytes!5 #b00000000000000000000000000000001) (bvsle uintSizeInBytes!5 #b00000000000000000000000000001001) (not (is-Return!59 (ite (bvsle (bvand v!147 (bvshl #b0000000000000000000000000000000000000000000000000000000010000000 ((_ sign_extend 32) (bvmul #b00000000000000000000000000001000 (bvsub uintSizeInBytes!5 #b00000000000000000000000000000001))))) #b0000000000000000000000000000000000000000000000000000000000000000) (Return!59 v!147) (Proceed!59 Unit!11887)))) (bvsle i!474 #b00000000000000000000000000000111) (not (= (bvand uintSizeInBytes!5 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (not (= (bvand uintSizeInBytes!5 #b10000000000000000000000000000000) (bvand (bvsub uintSizeInBytes!5 #b00000000000000000000000000000001) #b10000000000000000000000000000000))))))

(assert (=> start!37448 true))

(push 1)

(check-sat)

