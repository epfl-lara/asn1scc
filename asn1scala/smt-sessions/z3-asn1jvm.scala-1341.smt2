; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37510 () Bool)

(assert start!37510)

(declare-fun uintSizeInBytes!5 () (_ BitVec 32))

(declare-fun v!147 () (_ BitVec 64))

(declare-fun i!474 () (_ BitVec 32))

(get-info :version)

(declare-datatypes ((Unit!11966 0))(
  ( (Unit!11967) )
))
(declare-datatypes ((ControlFlow!86 0))(
  ( (Return!85 (value!6946 (_ BitVec 64))) (Proceed!85 (value!6947 Unit!11966)) )
))
(declare-fun Unit!11968 () Unit!11966)

(assert (=> start!37510 false))

(assert (=> start!37510 true))

(check-sat)
