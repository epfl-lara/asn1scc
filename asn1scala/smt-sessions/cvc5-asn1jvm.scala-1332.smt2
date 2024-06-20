; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37444 () Bool)

(assert start!37444)

(declare-fun uintSizeInBytes!5 () (_ BitVec 32))

(declare-fun v!147 () (_ BitVec 64))

(declare-fun i!474 () (_ BitVec 32))

(declare-datatypes ((Unit!11879 0))(
  ( (Unit!11880) )
))
(declare-datatypes ((ControlFlow!58 0))(
  ( (Return!57 (value!6845 (_ BitVec 64))) (Proceed!57 (value!6846 Unit!11879)) )
))
(declare-fun Unit!11881 () Unit!11879)

(assert (=> start!37444 (and (bvsge uintSizeInBytes!5 #b00000000000000000000000000000001) (bvsle uintSizeInBytes!5 #b00000000000000000000000000001001) (not (is-Return!57 (ite (bvsle (bvand v!147 (bvshl #b0000000000000000000000000000000000000000000000000000000010000000 ((_ sign_extend 32) (bvmul #b00000000000000000000000000001000 (bvsub uintSizeInBytes!5 #b00000000000000000000000000000001))))) #b0000000000000000000000000000000000000000000000000000000000000000) (Return!57 v!147) (Proceed!57 Unit!11881)))) (bvsle i!474 #b00000000000000000000000000000111) (not (= (bvand uintSizeInBytes!5 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (not (= (bvand uintSizeInBytes!5 #b10000000000000000000000000000000) (bvand (bvsub uintSizeInBytes!5 #b00000000000000000000000000000001) #b10000000000000000000000000000000))))))

(assert (=> start!37444 true))

(push 1)

(check-sat)

(pop 1)

