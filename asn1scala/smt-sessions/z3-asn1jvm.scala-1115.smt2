; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31916 () Bool)

(assert start!31916)

(declare-fun l!186 () (_ BitVec 64))

(assert (=> start!31916 false))

(assert (=> start!31916 true))

(check-sat)
