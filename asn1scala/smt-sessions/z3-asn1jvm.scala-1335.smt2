; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37464 () Bool)

(assert start!37464)

(declare-fun uintSizeInBytes!5 () (_ BitVec 32))

(declare-fun v!147 () (_ BitVec 64))

(declare-fun i!474 () (_ BitVec 32))

(get-info :version)

(declare-datatypes ((Unit!11909 0))(
  ( (Unit!11910) )
))
(declare-datatypes ((ControlFlow!68 0))(
  ( (Return!67 (value!6880 (_ BitVec 64))) (Proceed!67 (value!6881 Unit!11909)) )
))
(declare-fun Unit!11911 () Unit!11909)

(assert (=> start!37464 (and (bvsge uintSizeInBytes!5 #b00000000000000000000000000000001) (bvsle uintSizeInBytes!5 #b00000000000000000000000000001001) (not ((_ is Return!67) (ite (bvsle (bvand v!147 (bvshl #b0000000000000000000000000000000000000000000000000000000010000000 ((_ sign_extend 32) (bvmul #b00000000000000000000000000001000 (bvsub uintSizeInBytes!5 #b00000000000000000000000000000001))))) #b0000000000000000000000000000000000000000000000000000000000000000) (Return!67 v!147) (Proceed!67 Unit!11911)))) (bvsle i!474 #b00000000000000000000000000000111) (bvsge i!474 (bvsub uintSizeInBytes!5 #b00000000000000000000000000000001)) (bvsge i!474 uintSizeInBytes!5) (not (= (bvand i!474 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (not (= (bvand i!474 #b10000000000000000000000000000000) (bvand (bvsub i!474 #b00000000000000000000000000000001) #b10000000000000000000000000000000))))))

(assert (=> start!37464 true))

(check-sat)
