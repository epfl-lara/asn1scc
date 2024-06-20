; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37472 () Bool)

(assert start!37472)

(declare-fun uintSizeInBytes!5 () (_ BitVec 32))

(declare-fun v!147 () (_ BitVec 64))

(declare-fun i!474 () (_ BitVec 32))

(declare-datatypes ((Unit!11921 0))(
  ( (Unit!11922) )
))
(declare-datatypes ((ControlFlow!72 0))(
  ( (Return!71 (value!6893 (_ BitVec 64))) (Proceed!71 (value!6894 Unit!11921)) )
))
(declare-fun Unit!11923 () Unit!11921)

(assert (=> start!37472 (and (bvsge uintSizeInBytes!5 #b00000000000000000000000000000001) (bvsle uintSizeInBytes!5 #b00000000000000000000000000001001) (not (is-Return!71 (ite (bvsle (bvand v!147 (bvshl #b0000000000000000000000000000000000000000000000000000000010000000 ((_ sign_extend 32) (bvmul #b00000000000000000000000000001000 (bvsub uintSizeInBytes!5 #b00000000000000000000000000000001))))) #b0000000000000000000000000000000000000000000000000000000000000000) (Return!71 v!147) (Proceed!71 Unit!11923)))) (bvsle i!474 #b00000000000000000000000000000111) (bvsge i!474 (bvsub uintSizeInBytes!5 #b00000000000000000000000000000001)) (bvsge i!474 uintSizeInBytes!5) (bvsge (bvsub i!474 #b00000000000000000000000000000001) uintSizeInBytes!5) (bvsge (bvsub i!474 #b00000000000000000000000000000001) i!474))))

(assert (=> start!37472 true))

(push 1)

(check-sat)

