; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37438 () Bool)

(assert start!37438)

(declare-fun uintSizeInBytes!5 () (_ BitVec 32))

(declare-fun v!147 () (_ BitVec 64))

(declare-datatypes ((Unit!11870 0))(
  ( (Unit!11871) )
))
(declare-datatypes ((ControlFlow!55 0))(
  ( (Return!54 (value!6834 (_ BitVec 64))) (Proceed!54 (value!6835 Unit!11870)) )
))
(declare-fun Unit!11872 () Unit!11870)

(assert (=> start!37438 false))

(assert (=> start!37438 true))

(push 1)

(check-sat)

(pop 1)

