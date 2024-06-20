; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31922 () Bool)

(assert start!31922)

(declare-fun l!186 () (_ BitVec 64))

(assert (=> start!31922 false))

(assert (=> start!31922 true))

(check-sat)
