; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3156 () Bool)

(assert start!3156)

(declare-fun uintSizeInBytes!2 () (_ BitVec 32))

(declare-fun v!144 () (_ BitVec 64))

(declare-datatypes ((Unit!1157 0))(
  ( (Unit!1158) )
))
(declare-datatypes ((ControlFlow!12 0))(
  ( (Return!11 (value!728 (_ BitVec 64))) (Proceed!11 (value!729 Unit!1157)) )
))
(declare-fun Unit!1159 () Unit!1157)

(assert (=> start!3156 (and (bvsge uintSizeInBytes!2 #b00000000000000000000000000000001) (bvsle uintSizeInBytes!2 #b00000000000000000000000000001001) (not (is-Return!11 (ite (bvsle (bvand v!144 (bvshl #b0000000000000000000000000000000000000000000000000000000010000000 ((_ sign_extend 32) (bvmul #b00000000000000000000000000001000 (bvsub uintSizeInBytes!2 #b00000000000000000000000000000001))))) #b0000000000000000000000000000000000000000000000000000000000000000) (Return!11 v!144) (Proceed!11 Unit!1159)))) (bvsge #b00000000000000000000000000000111 uintSizeInBytes!2) (bvslt #b00000000000000000000000000000111 (bvsub uintSizeInBytes!2 #b00000000000000000000000000000001)))))

(assert (=> start!3156 true))

(push 1)

(check-sat)

(pop 1)

