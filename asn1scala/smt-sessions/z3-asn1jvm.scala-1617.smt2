; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45834 () Bool)

(assert start!45834)

(declare-fun v!297 () (_ BitVec 64))

(assert (=> start!45834 false))

(assert (=> start!45834 true))

(check-sat)
