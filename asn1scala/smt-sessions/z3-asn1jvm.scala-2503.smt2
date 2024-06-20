; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63332 () Bool)

(assert start!63332)

(assert (=> start!63332 false))

(check-sat)
