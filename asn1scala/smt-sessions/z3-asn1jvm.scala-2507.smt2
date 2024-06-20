; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63390 () Bool)

(assert start!63390)

(assert (=> start!63390 false))

(check-sat)
