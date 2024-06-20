; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37968 () Bool)

(assert start!37968)

(declare-fun i!510 () (_ BitVec 32))

(assert (=> start!37968 (and (bvsge i!510 #b00000000000000000000000000000000) (bvsle i!510 #b00000000000000000000000000010100) (bvslt i!510 #b00000000000000000000000000010100) (bvslt (bvadd #b00000000000000000000000000000001 i!510) #b00000000000000000000000000010100) (bvslt (bvadd #b00000000000000000000000000000001 i!510) #b00000000000000000000000000000000))))

(assert (=> start!37968 true))

(push 1)

(check-sat)

(pop 1)

