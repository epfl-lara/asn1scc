; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37456 () Bool)

(assert start!37456)

(declare-fun uintSizeInBytes!5 () (_ BitVec 32))

(declare-fun v!147 () (_ BitVec 64))

(declare-fun i!474 () (_ BitVec 32))

(declare-datatypes ((Unit!11897 0))(
  ( (Unit!11898) )
))
(declare-datatypes ((ControlFlow!64 0))(
  ( (Return!63 (value!6867 (_ BitVec 64))) (Proceed!63 (value!6868 Unit!11897)) )
))
(declare-fun Unit!11899 () Unit!11897)

(assert (=> start!37456 (and (bvsge uintSizeInBytes!5 #b00000000000000000000000000000001) (bvsle uintSizeInBytes!5 #b00000000000000000000000000001001) (not (is-Return!63 (ite (bvsle (bvand v!147 (bvshl #b0000000000000000000000000000000000000000000000000000000010000000 ((_ sign_extend 32) (bvmul #b00000000000000000000000000001000 (bvsub uintSizeInBytes!5 #b00000000000000000000000000000001))))) #b0000000000000000000000000000000000000000000000000000000000000000) (Return!63 v!147) (Proceed!63 Unit!11899)))) (bvsle i!474 #b00000000000000000000000000000111) (bvsge i!474 (bvsub uintSizeInBytes!5 #b00000000000000000000000000000001)) (bvsge i!474 uintSizeInBytes!5) (bvslt i!474 #b00000000000000000000000000000000))))

(assert (=> start!37456 true))

(push 1)

(check-sat)

(pop 1)

