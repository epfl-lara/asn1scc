; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2706 () Bool)

(assert start!2706)

(declare-fun l!185 () (_ BitVec 64))

(assert (=> start!2706 false))

(assert (=> start!2706 true))

(push 1)

(check-sat)

(pop 1)

