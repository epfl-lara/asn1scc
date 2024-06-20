; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51842 () Bool)

(assert start!51842)

(assert (=> start!51842 false))

(check-sat)
