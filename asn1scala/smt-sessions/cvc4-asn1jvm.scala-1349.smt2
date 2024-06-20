; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37560 () Bool)

(assert start!37560)

(declare-fun vv!44 () (_ BitVec 64))

(declare-datatypes ((Unit!12052 0))(
  ( (Unit!12053) )
))
(declare-datatypes ((ControlFlow!111 0))(
  ( (Return!110 (value!7036 (_ BitVec 32))) (Proceed!110 (value!7037 Unit!12052)) )
))
(declare-fun Unit!12054 () Unit!12052)

(declare-fun Unit!12055 () Unit!12052)

(assert (=> start!37560 false))

(assert (=> start!37560 true))

(push 1)

(check-sat)

(pop 1)

