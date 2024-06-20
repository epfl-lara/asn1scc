; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49588 () Bool)

(assert start!49588)

(declare-fun i!463 () (_ BitVec 32))

(assert (=> start!49588 (and (bvsge i!463 #b00000000000000000000000000000000) (bvsle i!463 #b00000000000000000000000000001000) (bvsgt i!463 #b00000000000000000000000000100000))))

(assert (=> start!49588 true))

(push 1)

(check-sat)

(pop 1)

