; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37516 () Bool)

(assert start!37516)

(declare-fun uintSizeInBytes!5 () (_ BitVec 32))

(declare-fun v!147 () (_ BitVec 64))

(declare-fun i!474 () (_ BitVec 32))

(get-info :version)

(declare-datatypes ((Unit!11975 0))(
  ( (Unit!11976) )
))
(declare-datatypes ((ControlFlow!89 0))(
  ( (Return!88 (value!6957 (_ BitVec 64))) (Proceed!88 (value!6958 Unit!11975)) )
))
(declare-fun Unit!11977 () Unit!11975)

(assert (=> start!37516 (and (bvsge uintSizeInBytes!5 #b00000000000000000000000000000001) (bvsle uintSizeInBytes!5 #b00000000000000000000000000001001) (not ((_ is Return!88) (ite (bvsle (bvand v!147 (bvshl #b0000000000000000000000000000000000000000000000000000000010000000 ((_ sign_extend 32) (bvmul #b00000000000000000000000000001000 (bvsub uintSizeInBytes!5 #b00000000000000000000000000000001))))) #b0000000000000000000000000000000000000000000000000000000000000000) (Return!88 v!147) (Proceed!88 Unit!11977)))) (bvsle i!474 #b00000000000000000000000000000111) (bvsge i!474 (bvsub uintSizeInBytes!5 #b00000000000000000000000000000001)) (bvsge i!474 uintSizeInBytes!5) (bvslt (bvsub i!474 #b00000000000000000000000000000001) uintSizeInBytes!5) (bvsle (bvsub i!474 #b00000000000000000000000000000001) #b00000000000000000000000000000111) (not (= (bvand uintSizeInBytes!5 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (not (= (bvand uintSizeInBytes!5 #b10000000000000000000000000000000) (bvand (bvsub uintSizeInBytes!5 #b00000000000000000000000000000001) #b10000000000000000000000000000000))))))

(assert (=> start!37516 true))

(check-sat)
