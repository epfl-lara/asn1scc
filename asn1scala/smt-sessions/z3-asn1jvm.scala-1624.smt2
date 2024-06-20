; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45882 () Bool)

(assert start!45882)

(declare-fun v!298 () (_ BitVec 64))

(assert (=> start!45882 false))

(assert (=> start!45882 true))

(check-sat)
