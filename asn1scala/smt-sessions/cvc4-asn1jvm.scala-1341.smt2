; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37512 () Bool)

(assert start!37512)

(declare-fun uintSizeInBytes!5 () (_ BitVec 32))

(declare-fun v!147 () (_ BitVec 64))

(declare-fun i!474 () (_ BitVec 32))

(declare-datatypes ((Unit!11969 0))(
  ( (Unit!11970) )
))
(declare-datatypes ((ControlFlow!87 0))(
  ( (Return!86 (value!6948 (_ BitVec 64))) (Proceed!86 (value!6949 Unit!11969)) )
))
(declare-fun Unit!11971 () Unit!11969)

(assert (=> start!37512 false))

(assert (=> start!37512 true))

(push 1)

(check-sat)

(pop 1)

