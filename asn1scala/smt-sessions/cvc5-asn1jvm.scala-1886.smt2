; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49590 () Bool)

(assert start!49590)

(declare-fun l!187 () (_ BitVec 64))

(assert (=> start!49590 false))

(assert (=> start!49590 true))

(push 1)

(check-sat)

(pop 1)

