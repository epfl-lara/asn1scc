; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3152 () Bool)

(assert start!3152)

(declare-fun uintSizeInBytes!2 () (_ BitVec 32))

(declare-fun v!144 () (_ BitVec 64))

(declare-datatypes ((Unit!1151 0))(
  ( (Unit!1152) )
))
(declare-datatypes ((ControlFlow!10 0))(
  ( (Return!9 (value!724 (_ BitVec 64))) (Proceed!9 (value!725 Unit!1151)) )
))
(declare-fun Unit!1153 () Unit!1151)

(assert (=> start!3152 (and (bvsge uintSizeInBytes!2 #b00000000000000000000000000000001) (bvsle uintSizeInBytes!2 #b00000000000000000000000000001001) (not (is-Return!9 (ite (bvsle (bvand v!144 (bvshl #b0000000000000000000000000000000000000000000000000000000010000000 ((_ sign_extend 32) (bvmul #b00000000000000000000000000001000 (bvsub uintSizeInBytes!2 #b00000000000000000000000000000001))))) #b0000000000000000000000000000000000000000000000000000000000000000) (Return!9 v!144) (Proceed!9 Unit!1153)))) (bvsge #b00000000000000000000000000000111 uintSizeInBytes!2) (bvslt #b00000000000000000000000000000111 (bvsub uintSizeInBytes!2 #b00000000000000000000000000000001)))))

(assert (=> start!3152 true))

(push 1)

(check-sat)

