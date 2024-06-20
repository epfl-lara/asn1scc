; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46130 () Bool)

(assert start!46130)

(assert (=> start!46130 false))

(check-sat)
