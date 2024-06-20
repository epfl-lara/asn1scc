; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37508 () Bool)

(assert start!37508)

(declare-fun uintSizeInBytes!5 () (_ BitVec 32))

(declare-fun v!147 () (_ BitVec 64))

(declare-fun i!474 () (_ BitVec 32))

(declare-datatypes ((Unit!11963 0))(
  ( (Unit!11964) )
))
(declare-datatypes ((ControlFlow!85 0))(
  ( (Return!84 (value!6944 (_ BitVec 64))) (Proceed!84 (value!6945 Unit!11963)) )
))
(declare-fun Unit!11965 () Unit!11963)

(assert (=> start!37508 false))

(assert (=> start!37508 true))

(push 1)

(check-sat)

(pop 1)

