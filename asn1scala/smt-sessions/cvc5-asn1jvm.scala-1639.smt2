; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46000 () Bool)

(assert start!46000)

(declare-fun v!298 () (_ BitVec 64))

(assert (=> start!46000 false))

(assert (=> start!46000 true))

(push 1)

(check-sat)

(pop 1)

