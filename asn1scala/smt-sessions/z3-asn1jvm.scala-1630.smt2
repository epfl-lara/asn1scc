; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45930 () Bool)

(assert start!45930)

(declare-fun v!298 () (_ BitVec 64))

(assert (=> start!45930 false))

(assert (=> start!45930 true))

(check-sat)
