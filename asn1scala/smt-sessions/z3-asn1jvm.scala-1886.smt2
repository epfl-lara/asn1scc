; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49592 () Bool)

(assert start!49592)

(declare-fun l!187 () (_ BitVec 64))

(assert (=> start!49592 false))

(assert (=> start!49592 true))

(check-sat)
