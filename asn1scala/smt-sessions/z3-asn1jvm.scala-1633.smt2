; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45954 () Bool)

(assert start!45954)

(declare-fun v!298 () (_ BitVec 64))

(assert (=> start!45954 false))

(assert (=> start!45954 true))

(check-sat)
