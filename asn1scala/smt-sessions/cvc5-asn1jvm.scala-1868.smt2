; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49470 () Bool)

(assert start!49470)

(declare-fun l!233 () (_ BitVec 64))

(declare-fun i!785 () (_ BitVec 32))

(assert (=> start!49470 false))

(assert (=> start!49470 true))

(push 1)

(check-sat)

(pop 1)

