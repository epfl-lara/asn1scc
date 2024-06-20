; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4634 () Bool)

(assert start!4634)

(declare-fun i!466 () (_ BitVec 32))

(assert (=> start!4634 false))

(assert (=> start!4634 true))

(push 1)

(check-sat)

(pop 1)

