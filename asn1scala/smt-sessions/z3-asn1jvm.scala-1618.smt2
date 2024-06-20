; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45840 () Bool)

(assert start!45840)

(declare-fun v!297 () (_ BitVec 64))

(assert (=> start!45840 false))

(assert (=> start!45840 true))

(check-sat)
