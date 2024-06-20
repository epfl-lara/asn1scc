; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2710 () Bool)

(assert start!2710)

(declare-fun l!185 () (_ BitVec 64))

(assert (=> start!2710 false))

(assert (=> start!2710 true))

(check-sat)
