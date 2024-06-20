; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45846 () Bool)

(assert start!45846)

(declare-fun v!297 () (_ BitVec 64))

(assert (=> start!45846 false))

(assert (=> start!45846 true))

(check-sat)
