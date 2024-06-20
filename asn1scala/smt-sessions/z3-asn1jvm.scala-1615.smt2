; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45822 () Bool)

(assert start!45822)

(declare-fun v!297 () (_ BitVec 64))

(assert (=> start!45822 false))

(assert (=> start!45822 true))

(check-sat)
