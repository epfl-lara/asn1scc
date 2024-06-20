; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37514 () Bool)

(assert start!37514)

(declare-fun uintSizeInBytes!5 () (_ BitVec 32))

(declare-fun v!147 () (_ BitVec 64))

(declare-fun i!474 () (_ BitVec 32))

(declare-datatypes ((Unit!11972 0))(
  ( (Unit!11973) )
))
(declare-datatypes ((ControlFlow!88 0))(
  ( (Return!87 (value!6955 (_ BitVec 64))) (Proceed!87 (value!6956 Unit!11972)) )
))
(declare-fun Unit!11974 () Unit!11972)

(assert (=> start!37514 (and (bvsge uintSizeInBytes!5 #b00000000000000000000000000000001) (bvsle uintSizeInBytes!5 #b00000000000000000000000000001001) (not (is-Return!87 (ite (bvsle (bvand v!147 (bvshl #b0000000000000000000000000000000000000000000000000000000010000000 ((_ sign_extend 32) (bvmul #b00000000000000000000000000001000 (bvsub uintSizeInBytes!5 #b00000000000000000000000000000001))))) #b0000000000000000000000000000000000000000000000000000000000000000) (Return!87 v!147) (Proceed!87 Unit!11974)))) (bvsle i!474 #b00000000000000000000000000000111) (bvsge i!474 (bvsub uintSizeInBytes!5 #b00000000000000000000000000000001)) (bvsge i!474 uintSizeInBytes!5) (bvslt (bvsub i!474 #b00000000000000000000000000000001) uintSizeInBytes!5) (bvsle (bvsub i!474 #b00000000000000000000000000000001) #b00000000000000000000000000000111) (not (= (bvand uintSizeInBytes!5 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (not (= (bvand uintSizeInBytes!5 #b10000000000000000000000000000000) (bvand (bvsub uintSizeInBytes!5 #b00000000000000000000000000000001) #b10000000000000000000000000000000))))))

(assert (=> start!37514 true))

(push 1)

(check-sat)

(pop 1)

