; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37468 () Bool)

(assert start!37468)

(declare-fun uintSizeInBytes!5 () (_ BitVec 32))

(declare-fun v!147 () (_ BitVec 64))

(declare-fun i!474 () (_ BitVec 32))

(declare-datatypes ((Unit!11915 0))(
  ( (Unit!11916) )
))
(declare-datatypes ((ControlFlow!70 0))(
  ( (Return!69 (value!6889 (_ BitVec 64))) (Proceed!69 (value!6890 Unit!11915)) )
))
(declare-fun Unit!11917 () Unit!11915)

(assert (=> start!37468 (and (bvsge uintSizeInBytes!5 #b00000000000000000000000000000001) (bvsle uintSizeInBytes!5 #b00000000000000000000000000001001) (not (is-Return!69 (ite (bvsle (bvand v!147 (bvshl #b0000000000000000000000000000000000000000000000000000000010000000 ((_ sign_extend 32) (bvmul #b00000000000000000000000000001000 (bvsub uintSizeInBytes!5 #b00000000000000000000000000000001))))) #b0000000000000000000000000000000000000000000000000000000000000000) (Return!69 v!147) (Proceed!69 Unit!11917)))) (bvsle i!474 #b00000000000000000000000000000111) (bvsge i!474 (bvsub uintSizeInBytes!5 #b00000000000000000000000000000001)) (bvsge i!474 uintSizeInBytes!5) (bvsge (bvsub i!474 #b00000000000000000000000000000001) uintSizeInBytes!5) (bvsge (bvsub i!474 #b00000000000000000000000000000001) i!474))))

(assert (=> start!37468 true))

(push 1)

(check-sat)

(pop 1)

