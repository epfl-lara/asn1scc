; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51896 () Bool)

(assert start!51896)

(assert (=> start!51896 false))

(check-sat)
