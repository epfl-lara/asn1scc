; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46024 () Bool)

(assert start!46024)

(declare-fun v!298 () (_ BitVec 64))

(assert (=> start!46024 false))

(assert (=> start!46024 true))

(push 1)

(check-sat)

(pop 1)

