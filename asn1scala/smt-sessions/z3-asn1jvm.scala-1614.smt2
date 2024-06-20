; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45816 () Bool)

(assert start!45816)

(declare-fun v!297 () (_ BitVec 64))

(assert (=> start!45816 false))

(assert (=> start!45816 true))

(check-sat)
