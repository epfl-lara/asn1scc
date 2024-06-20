; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37522 () Bool)

(assert start!37522)

(declare-fun uintSizeInBytes!5 () (_ BitVec 32))

(declare-fun v!147 () (_ BitVec 64))

(declare-fun i!474 () (_ BitVec 32))

(get-info :version)

(declare-datatypes ((Unit!11984 0))(
  ( (Unit!11985) )
))
(declare-datatypes ((ControlFlow!92 0))(
  ( (Return!91 (value!6968 (_ BitVec 64))) (Proceed!91 (value!6969 Unit!11984)) )
))
(declare-fun Unit!11986 () Unit!11984)

(assert (=> start!37522 (and (bvsge uintSizeInBytes!5 #b00000000000000000000000000000001) (bvsle uintSizeInBytes!5 #b00000000000000000000000000001001) (not ((_ is Return!91) (ite (bvsle (bvand v!147 (bvshl #b0000000000000000000000000000000000000000000000000000000010000000 ((_ sign_extend 32) (bvmul #b00000000000000000000000000001000 (bvsub uintSizeInBytes!5 #b00000000000000000000000000000001))))) #b0000000000000000000000000000000000000000000000000000000000000000) (Return!91 v!147) (Proceed!91 Unit!11986)))) (bvsle i!474 #b00000000000000000000000000000111) (bvsge i!474 (bvsub uintSizeInBytes!5 #b00000000000000000000000000000001)) (bvsge i!474 uintSizeInBytes!5) (bvslt (bvsub i!474 #b00000000000000000000000000000001) uintSizeInBytes!5) (bvsgt (bvsub i!474 #b00000000000000000000000000000001) #b00000000000000000000000000000111))))

(assert (=> start!37522 true))

(check-sat)
