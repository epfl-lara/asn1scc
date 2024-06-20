; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45828 () Bool)

(assert start!45828)

(declare-fun v!297 () (_ BitVec 64))

(assert (=> start!45828 false))

(assert (=> start!45828 true))

(check-sat)
