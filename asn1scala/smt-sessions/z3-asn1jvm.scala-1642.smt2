; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46026 () Bool)

(assert start!46026)

(declare-fun v!298 () (_ BitVec 64))

(assert (=> start!46026 false))

(assert (=> start!46026 true))

(check-sat)
