; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4630 () Bool)

(assert start!4630)

(declare-fun i!466 () (_ BitVec 32))

(assert (=> start!4630 false))

(assert (=> start!4630 true))

(push 1)

(check-sat)

(pop 1)

