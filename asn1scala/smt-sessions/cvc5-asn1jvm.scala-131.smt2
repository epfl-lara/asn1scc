; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3176 () Bool)

(assert start!3176)

(declare-fun uintSizeInBytes!2 () (_ BitVec 32))

(declare-fun v!144 () (_ BitVec 64))

(declare-datatypes ((Unit!1160 0))(
  ( (Unit!1161) )
))
(declare-datatypes ((ControlFlow!13 0))(
  ( (Return!12 (value!750 (_ BitVec 64))) (Proceed!12 (value!751 Unit!1160)) )
))
(declare-fun Unit!1162 () Unit!1160)

(assert (=> start!3176 false))

(assert (=> start!3176 true))

(push 1)

(check-sat)

(pop 1)

