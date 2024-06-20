; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37518 () Bool)

(assert start!37518)

(declare-fun uintSizeInBytes!5 () (_ BitVec 32))

(declare-fun v!147 () (_ BitVec 64))

(declare-fun i!474 () (_ BitVec 32))

(declare-datatypes ((Unit!11978 0))(
  ( (Unit!11979) )
))
(declare-datatypes ((ControlFlow!90 0))(
  ( (Return!89 (value!6959 (_ BitVec 64))) (Proceed!89 (value!6960 Unit!11978)) )
))
(declare-fun Unit!11980 () Unit!11978)

(assert (=> start!37518 (and (bvsge uintSizeInBytes!5 #b00000000000000000000000000000001) (bvsle uintSizeInBytes!5 #b00000000000000000000000000001001) (not (is-Return!89 (ite (bvsle (bvand v!147 (bvshl #b0000000000000000000000000000000000000000000000000000000010000000 ((_ sign_extend 32) (bvmul #b00000000000000000000000000001000 (bvsub uintSizeInBytes!5 #b00000000000000000000000000000001))))) #b0000000000000000000000000000000000000000000000000000000000000000) (Return!89 v!147) (Proceed!89 Unit!11980)))) (bvsle i!474 #b00000000000000000000000000000111) (bvsge i!474 (bvsub uintSizeInBytes!5 #b00000000000000000000000000000001)) (bvsge i!474 uintSizeInBytes!5) (bvslt (bvsub i!474 #b00000000000000000000000000000001) uintSizeInBytes!5) (bvsle (bvsub i!474 #b00000000000000000000000000000001) #b00000000000000000000000000000111) (not (= (bvand uintSizeInBytes!5 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (not (= (bvand uintSizeInBytes!5 #b10000000000000000000000000000000) (bvand (bvsub uintSizeInBytes!5 #b00000000000000000000000000000001) #b10000000000000000000000000000000))))))

(assert (=> start!37518 true))

(push 1)

(check-sat)

(pop 1)

