; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2704 () Bool)

(assert start!2704)

(declare-fun l!185 () (_ BitVec 64))

(assert (=> start!2704 false))

(assert (=> start!2704 true))

(check-sat)
