; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49556 () Bool)

(assert start!49556)

(declare-fun l!233 () (_ BitVec 64))

(declare-fun i!785 () (_ BitVec 32))

(assert (=> start!49556 false))

(assert (=> start!49556 true))

(check-sat)
