; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45906 () Bool)

(assert start!45906)

(declare-fun v!298 () (_ BitVec 64))

(assert (=> start!45906 false))

(assert (=> start!45906 true))

(check-sat)
