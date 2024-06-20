; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49454 () Bool)

(assert start!49454)

(declare-fun l!233 () (_ BitVec 64))

(declare-fun i!785 () (_ BitVec 32))

(assert (=> start!49454 false))

(assert (=> start!49454 true))

(check-sat)
