; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25298 () Bool)

(assert start!25298)

(declare-fun i!462 () (_ BitVec 32))

(assert (=> start!25298 (and (bvsge i!462 #b00000000000000000000000000000000) (bvsle i!462 #b00000000000000000000000000001000) (bvsgt i!462 #b00000000000000000000000000100000))))

(assert (=> start!25298 true))

(check-sat)
