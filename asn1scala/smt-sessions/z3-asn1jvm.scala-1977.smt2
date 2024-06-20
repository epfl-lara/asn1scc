; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51034 () Bool)

(assert start!51034)

(assert (=> start!51034 false))

(assert (=> start!51034 true))

(check-sat)
