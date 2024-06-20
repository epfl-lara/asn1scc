; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37470 () Bool)

(assert start!37470)

(declare-fun uintSizeInBytes!5 () (_ BitVec 32))

(declare-fun v!147 () (_ BitVec 64))

(declare-fun i!474 () (_ BitVec 32))

(get-info :version)

(declare-datatypes ((Unit!11918 0))(
  ( (Unit!11919) )
))
(declare-datatypes ((ControlFlow!71 0))(
  ( (Return!70 (value!6891 (_ BitVec 64))) (Proceed!70 (value!6892 Unit!11918)) )
))
(declare-fun Unit!11920 () Unit!11918)

(assert (=> start!37470 (and (bvsge uintSizeInBytes!5 #b00000000000000000000000000000001) (bvsle uintSizeInBytes!5 #b00000000000000000000000000001001) (not ((_ is Return!70) (ite (bvsle (bvand v!147 (bvshl #b0000000000000000000000000000000000000000000000000000000010000000 ((_ sign_extend 32) (bvmul #b00000000000000000000000000001000 (bvsub uintSizeInBytes!5 #b00000000000000000000000000000001))))) #b0000000000000000000000000000000000000000000000000000000000000000) (Return!70 v!147) (Proceed!70 Unit!11920)))) (bvsle i!474 #b00000000000000000000000000000111) (bvsge i!474 (bvsub uintSizeInBytes!5 #b00000000000000000000000000000001)) (bvsge i!474 uintSizeInBytes!5) (bvsge (bvsub i!474 #b00000000000000000000000000000001) uintSizeInBytes!5) (bvsge (bvsub i!474 #b00000000000000000000000000000001) i!474))))

(assert (=> start!37470 true))

(check-sat)
