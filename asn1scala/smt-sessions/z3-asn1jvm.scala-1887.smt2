; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49598 () Bool)

(assert start!49598)

(declare-fun l!187 () (_ BitVec 64))

(assert (=> start!49598 false))

(assert (=> start!49598 true))

(check-sat)
