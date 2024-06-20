; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37446 () Bool)

(assert start!37446)

(declare-fun uintSizeInBytes!5 () (_ BitVec 32))

(declare-fun v!147 () (_ BitVec 64))

(declare-fun i!474 () (_ BitVec 32))

(get-info :version)

(declare-datatypes ((Unit!11882 0))(
  ( (Unit!11883) )
))
(declare-datatypes ((ControlFlow!59 0))(
  ( (Return!58 (value!6847 (_ BitVec 64))) (Proceed!58 (value!6848 Unit!11882)) )
))
(declare-fun Unit!11884 () Unit!11882)

(assert (=> start!37446 (and (bvsge uintSizeInBytes!5 #b00000000000000000000000000000001) (bvsle uintSizeInBytes!5 #b00000000000000000000000000001001) (not ((_ is Return!58) (ite (bvsle (bvand v!147 (bvshl #b0000000000000000000000000000000000000000000000000000000010000000 ((_ sign_extend 32) (bvmul #b00000000000000000000000000001000 (bvsub uintSizeInBytes!5 #b00000000000000000000000000000001))))) #b0000000000000000000000000000000000000000000000000000000000000000) (Return!58 v!147) (Proceed!58 Unit!11884)))) (bvsle i!474 #b00000000000000000000000000000111) (not (= (bvand uintSizeInBytes!5 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (not (= (bvand uintSizeInBytes!5 #b10000000000000000000000000000000) (bvand (bvsub uintSizeInBytes!5 #b00000000000000000000000000000001) #b10000000000000000000000000000000))))))

(assert (=> start!37446 true))

(check-sat)
