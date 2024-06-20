; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4632 () Bool)

(assert start!4632)

(declare-fun i!466 () (_ BitVec 32))

(assert (=> start!4632 false))

(assert (=> start!4632 true))

(check-sat)
