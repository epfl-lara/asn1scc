; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63716 () Bool)

(assert start!63716)

(assert (=> start!63716 false))

(check-sat)
