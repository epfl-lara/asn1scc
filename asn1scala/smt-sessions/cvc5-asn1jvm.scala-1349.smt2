; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37556 () Bool)

(assert start!37556)

(declare-fun vv!44 () (_ BitVec 64))

(declare-datatypes ((Unit!12044 0))(
  ( (Unit!12045) )
))
(declare-datatypes ((ControlFlow!109 0))(
  ( (Return!108 (value!7032 (_ BitVec 32))) (Proceed!108 (value!7033 Unit!12044)) )
))
(declare-fun Unit!12046 () Unit!12044)

(declare-fun Unit!12047 () Unit!12044)

(assert (=> start!37556 false))

(assert (=> start!37556 true))

(push 1)

(check-sat)

(pop 1)

