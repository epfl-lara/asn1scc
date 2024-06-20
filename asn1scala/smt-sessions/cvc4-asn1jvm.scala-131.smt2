; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3180 () Bool)

(assert start!3180)

(declare-fun uintSizeInBytes!2 () (_ BitVec 32))

(declare-fun v!144 () (_ BitVec 64))

(declare-datatypes ((Unit!1166 0))(
  ( (Unit!1167) )
))
(declare-datatypes ((ControlFlow!15 0))(
  ( (Return!14 (value!754 (_ BitVec 64))) (Proceed!14 (value!755 Unit!1166)) )
))
(declare-fun Unit!1168 () Unit!1166)

(assert (=> start!3180 false))

(assert (=> start!3180 true))

(push 1)

(check-sat)

(pop 1)

