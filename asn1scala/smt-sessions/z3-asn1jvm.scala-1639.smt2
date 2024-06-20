; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46002 () Bool)

(assert start!46002)

(declare-fun v!298 () (_ BitVec 64))

(assert (=> start!46002 false))

(assert (=> start!46002 true))

(check-sat)
