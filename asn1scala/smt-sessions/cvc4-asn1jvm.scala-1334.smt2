; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37460 () Bool)

(assert start!37460)

(declare-fun uintSizeInBytes!5 () (_ BitVec 32))

(declare-fun v!147 () (_ BitVec 64))

(declare-fun i!474 () (_ BitVec 32))

(declare-datatypes ((Unit!11903 0))(
  ( (Unit!11904) )
))
(declare-datatypes ((ControlFlow!66 0))(
  ( (Return!65 (value!6871 (_ BitVec 64))) (Proceed!65 (value!6872 Unit!11903)) )
))
(declare-fun Unit!11905 () Unit!11903)

(assert (=> start!37460 (and (bvsge uintSizeInBytes!5 #b00000000000000000000000000000001) (bvsle uintSizeInBytes!5 #b00000000000000000000000000001001) (not (is-Return!65 (ite (bvsle (bvand v!147 (bvshl #b0000000000000000000000000000000000000000000000000000000010000000 ((_ sign_extend 32) (bvmul #b00000000000000000000000000001000 (bvsub uintSizeInBytes!5 #b00000000000000000000000000000001))))) #b0000000000000000000000000000000000000000000000000000000000000000) (Return!65 v!147) (Proceed!65 Unit!11905)))) (bvsle i!474 #b00000000000000000000000000000111) (bvsge i!474 (bvsub uintSizeInBytes!5 #b00000000000000000000000000000001)) (bvsge i!474 uintSizeInBytes!5) (bvslt i!474 #b00000000000000000000000000000000))))

(assert (=> start!37460 true))

(push 1)

(check-sat)

