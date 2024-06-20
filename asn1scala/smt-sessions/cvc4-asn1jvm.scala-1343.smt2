; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37524 () Bool)

(assert start!37524)

(declare-fun uintSizeInBytes!5 () (_ BitVec 32))

(declare-fun v!147 () (_ BitVec 64))

(declare-fun i!474 () (_ BitVec 32))

(declare-datatypes ((Unit!11987 0))(
  ( (Unit!11988) )
))
(declare-datatypes ((ControlFlow!93 0))(
  ( (Return!92 (value!6970 (_ BitVec 64))) (Proceed!92 (value!6971 Unit!11987)) )
))
(declare-fun Unit!11989 () Unit!11987)

(assert (=> start!37524 (and (bvsge uintSizeInBytes!5 #b00000000000000000000000000000001) (bvsle uintSizeInBytes!5 #b00000000000000000000000000001001) (not (is-Return!92 (ite (bvsle (bvand v!147 (bvshl #b0000000000000000000000000000000000000000000000000000000010000000 ((_ sign_extend 32) (bvmul #b00000000000000000000000000001000 (bvsub uintSizeInBytes!5 #b00000000000000000000000000000001))))) #b0000000000000000000000000000000000000000000000000000000000000000) (Return!92 v!147) (Proceed!92 Unit!11989)))) (bvsle i!474 #b00000000000000000000000000000111) (bvsge i!474 (bvsub uintSizeInBytes!5 #b00000000000000000000000000000001)) (bvsge i!474 uintSizeInBytes!5) (bvslt (bvsub i!474 #b00000000000000000000000000000001) uintSizeInBytes!5) (bvsgt (bvsub i!474 #b00000000000000000000000000000001) #b00000000000000000000000000000111))))

(assert (=> start!37524 true))

(push 1)

(check-sat)

(pop 1)

