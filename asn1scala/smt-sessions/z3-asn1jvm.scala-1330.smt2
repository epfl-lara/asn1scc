; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37434 () Bool)

(assert start!37434)

(declare-fun uintSizeInBytes!5 () (_ BitVec 32))

(declare-fun v!147 () (_ BitVec 64))

(declare-fun i!474 () (_ BitVec 32))

(get-info :version)

(declare-datatypes ((Unit!11864 0))(
  ( (Unit!11865) )
))
(declare-datatypes ((ControlFlow!53 0))(
  ( (Return!52 (value!6825 (_ BitVec 64))) (Proceed!52 (value!6826 Unit!11864)) )
))
(declare-fun Unit!11866 () Unit!11864)

(assert (=> start!37434 (and (bvsge uintSizeInBytes!5 #b00000000000000000000000000000001) (bvsle uintSizeInBytes!5 #b00000000000000000000000000001001) (not ((_ is Return!52) (ite (bvsle (bvand v!147 (bvshl #b0000000000000000000000000000000000000000000000000000000010000000 ((_ sign_extend 32) (bvmul #b00000000000000000000000000001000 (bvsub uintSizeInBytes!5 #b00000000000000000000000000000001))))) #b0000000000000000000000000000000000000000000000000000000000000000) (Return!52 v!147) (Proceed!52 Unit!11866)))) (bvsle i!474 #b00000000000000000000000000000111) (bvsge i!474 (bvsub uintSizeInBytes!5 #b00000000000000000000000000000001)) (bvsge i!474 uintSizeInBytes!5) (bvsge (bvsub i!474 #b00000000000000000000000000000001) uintSizeInBytes!5) (bvsgt (bvsub i!474 #b00000000000000000000000000000001) #b00000000000000000000000000000111))))

(assert (=> start!37434 true))

(check-sat)
