; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51028 () Bool)

(assert start!51028)

(assert (=> start!51028 false))

(assert (=> start!51028 true))

(check-sat)
