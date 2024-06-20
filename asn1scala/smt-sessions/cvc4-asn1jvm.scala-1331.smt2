; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37442 () Bool)

(assert start!37442)

(declare-fun uintSizeInBytes!5 () (_ BitVec 32))

(declare-fun v!147 () (_ BitVec 64))

(declare-datatypes ((Unit!11876 0))(
  ( (Unit!11877) )
))
(declare-datatypes ((ControlFlow!57 0))(
  ( (Return!56 (value!6838 (_ BitVec 64))) (Proceed!56 (value!6839 Unit!11876)) )
))
(declare-fun Unit!11878 () Unit!11876)

(assert (=> start!37442 false))

(assert (=> start!37442 true))

(push 1)

