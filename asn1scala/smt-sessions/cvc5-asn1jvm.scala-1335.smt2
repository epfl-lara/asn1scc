; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37462 () Bool)

(assert start!37462)

(declare-fun uintSizeInBytes!5 () (_ BitVec 32))

(declare-fun v!147 () (_ BitVec 64))

(declare-fun i!474 () (_ BitVec 32))

(declare-datatypes ((Unit!11906 0))(
  ( (Unit!11907) )
))
(declare-datatypes ((ControlFlow!67 0))(
  ( (Return!66 (value!6878 (_ BitVec 64))) (Proceed!66 (value!6879 Unit!11906)) )
))
(declare-fun Unit!11908 () Unit!11906)

(assert (=> start!37462 (and (bvsge uintSizeInBytes!5 #b00000000000000000000000000000001) (bvsle uintSizeInBytes!5 #b00000000000000000000000000001001) (not (is-Return!66 (ite (bvsle (bvand v!147 (bvshl #b0000000000000000000000000000000000000000000000000000000010000000 ((_ sign_extend 32) (bvmul #b00000000000000000000000000001000 (bvsub uintSizeInBytes!5 #b00000000000000000000000000000001))))) #b0000000000000000000000000000000000000000000000000000000000000000) (Return!66 v!147) (Proceed!66 Unit!11908)))) (bvsle i!474 #b00000000000000000000000000000111) (bvsge i!474 (bvsub uintSizeInBytes!5 #b00000000000000000000000000000001)) (bvsge i!474 uintSizeInBytes!5) (not (= (bvand i!474 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (not (= (bvand i!474 #b10000000000000000000000000000000) (bvand (bvsub i!474 #b00000000000000000000000000000001) #b10000000000000000000000000000000))))))

(assert (=> start!37462 true))

(push 1)

(check-sat)

(pop 1)

