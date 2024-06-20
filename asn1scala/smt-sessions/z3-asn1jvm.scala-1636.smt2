; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45978 () Bool)

(assert start!45978)

(declare-fun v!298 () (_ BitVec 64))

(assert (=> start!45978 false))

(assert (=> start!45978 true))

(check-sat)
