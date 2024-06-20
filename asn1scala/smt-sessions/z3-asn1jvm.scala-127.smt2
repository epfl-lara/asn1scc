; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3154 () Bool)

(assert start!3154)

(declare-fun uintSizeInBytes!2 () (_ BitVec 32))

(declare-fun v!144 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((Unit!1154 0))(
  ( (Unit!1155) )
))
(declare-datatypes ((ControlFlow!11 0))(
  ( (Return!10 (value!726 (_ BitVec 64))) (Proceed!10 (value!727 Unit!1154)) )
))
(declare-fun Unit!1156 () Unit!1154)

(assert (=> start!3154 (and (bvsge uintSizeInBytes!2 #b00000000000000000000000000000001) (bvsle uintSizeInBytes!2 #b00000000000000000000000000001001) (not ((_ is Return!10) (ite (bvsle (bvand v!144 (bvshl #b0000000000000000000000000000000000000000000000000000000010000000 ((_ sign_extend 32) (bvmul #b00000000000000000000000000001000 (bvsub uintSizeInBytes!2 #b00000000000000000000000000000001))))) #b0000000000000000000000000000000000000000000000000000000000000000) (Return!10 v!144) (Proceed!10 Unit!1156)))) (bvsge #b00000000000000000000000000000111 uintSizeInBytes!2) (bvslt #b00000000000000000000000000000111 (bvsub uintSizeInBytes!2 #b00000000000000000000000000000001)))))

(assert (=> start!3154 true))

(check-sat)
