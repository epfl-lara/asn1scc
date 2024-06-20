; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51046 () Bool)

(assert start!51046)

(assert (=> start!51046 false))

(check-sat)
