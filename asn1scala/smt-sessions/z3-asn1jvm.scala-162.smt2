; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3700 () Bool)

(assert start!3700)

(assert (=> start!3700 false))

(check-sat)
