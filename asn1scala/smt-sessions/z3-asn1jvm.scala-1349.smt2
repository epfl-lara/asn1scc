; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37558 () Bool)

(assert start!37558)

(declare-fun vv!44 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((Unit!12048 0))(
  ( (Unit!12049) )
))
(declare-datatypes ((ControlFlow!110 0))(
  ( (Return!109 (value!7034 (_ BitVec 32))) (Proceed!109 (value!7035 Unit!12048)) )
))
(declare-fun Unit!12050 () Unit!12048)

(declare-fun Unit!12051 () Unit!12048)

(assert (=> start!37558 false))

(assert (=> start!37558 true))

(check-sat)
