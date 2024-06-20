; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4626 () Bool)

(assert start!4626)

(declare-fun i!466 () (_ BitVec 32))

(assert (=> start!4626 false))

(assert (=> start!4626 true))

(check-sat)
