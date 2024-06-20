; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49586 () Bool)

(assert start!49586)

(declare-fun i!463 () (_ BitVec 32))

(assert (=> start!49586 (and (bvsge i!463 #b00000000000000000000000000000000) (bvsle i!463 #b00000000000000000000000000001000) (bvsgt i!463 #b00000000000000000000000000100000))))

(assert (=> start!49586 true))

(check-sat)
