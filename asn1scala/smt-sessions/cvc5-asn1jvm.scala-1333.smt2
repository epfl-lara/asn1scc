; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37450 () Bool)

(assert start!37450)

(declare-fun uintSizeInBytes!5 () (_ BitVec 32))

(declare-fun v!147 () (_ BitVec 64))

(declare-fun i!474 () (_ BitVec 32))

(declare-datatypes ((Unit!11888 0))(
  ( (Unit!11889) )
))
(declare-datatypes ((ControlFlow!61 0))(
  ( (Return!60 (value!6856 (_ BitVec 64))) (Proceed!60 (value!6857 Unit!11888)) )
))
(declare-fun Unit!11890 () Unit!11888)

(assert (=> start!37450 (and (bvsge uintSizeInBytes!5 #b00000000000000000000000000000001) (bvsle uintSizeInBytes!5 #b00000000000000000000000000001001) (not (is-Return!60 (ite (bvsle (bvand v!147 (bvshl #b0000000000000000000000000000000000000000000000000000000010000000 ((_ sign_extend 32) (bvmul #b00000000000000000000000000001000 (bvsub uintSizeInBytes!5 #b00000000000000000000000000000001))))) #b0000000000000000000000000000000000000000000000000000000000000000) (Return!60 v!147) (Proceed!60 Unit!11890)))) (bvsle i!474 #b00000000000000000000000000000111) (bvsge i!474 (bvsub uintSizeInBytes!5 #b00000000000000000000000000000001)) (bvsge i!474 uintSizeInBytes!5) (bvslt i!474 #b00000000000000000000000000000000))))

(assert (=> start!37450 true))

(push 1)

(check-sat)

(pop 1)

