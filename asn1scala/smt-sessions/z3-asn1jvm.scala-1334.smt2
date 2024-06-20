; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37458 () Bool)

(assert start!37458)

(declare-fun uintSizeInBytes!5 () (_ BitVec 32))

(declare-fun v!147 () (_ BitVec 64))

(declare-fun i!474 () (_ BitVec 32))

(get-info :version)

(declare-datatypes ((Unit!11900 0))(
  ( (Unit!11901) )
))
(declare-datatypes ((ControlFlow!65 0))(
  ( (Return!64 (value!6869 (_ BitVec 64))) (Proceed!64 (value!6870 Unit!11900)) )
))
(declare-fun Unit!11902 () Unit!11900)

(assert (=> start!37458 (and (bvsge uintSizeInBytes!5 #b00000000000000000000000000000001) (bvsle uintSizeInBytes!5 #b00000000000000000000000000001001) (not ((_ is Return!64) (ite (bvsle (bvand v!147 (bvshl #b0000000000000000000000000000000000000000000000000000000010000000 ((_ sign_extend 32) (bvmul #b00000000000000000000000000001000 (bvsub uintSizeInBytes!5 #b00000000000000000000000000000001))))) #b0000000000000000000000000000000000000000000000000000000000000000) (Return!64 v!147) (Proceed!64 Unit!11902)))) (bvsle i!474 #b00000000000000000000000000000111) (bvsge i!474 (bvsub uintSizeInBytes!5 #b00000000000000000000000000000001)) (bvsge i!474 uintSizeInBytes!5) (bvslt i!474 #b00000000000000000000000000000000))))

(assert (=> start!37458 true))

(check-sat)
