; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45852 () Bool)

(assert start!45852)

(declare-fun v!297 () (_ BitVec 64))

(assert (=> start!45852 false))

(assert (=> start!45852 true))

(check-sat)
