; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45858 () Bool)

(assert start!45858)

(declare-fun v!298 () (_ BitVec 64))

(assert (=> start!45858 false))

(assert (=> start!45858 true))

(check-sat)
