; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25300 () Bool)

(assert start!25300)

(declare-fun i!462 () (_ BitVec 32))

(assert (=> start!25300 (and (bvsge i!462 #b00000000000000000000000000000000) (bvsle i!462 #b00000000000000000000000000001000) (bvsgt i!462 #b00000000000000000000000000100000))))

(assert (=> start!25300 true))

(push 1)

(check-sat)

