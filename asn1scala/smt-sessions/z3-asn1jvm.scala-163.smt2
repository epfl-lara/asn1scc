; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3706 () Bool)

(assert start!3706)

(assert (=> start!3706 false))

(check-sat)
