; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45818 () Bool)

(assert start!45818)

(declare-fun v!297 () (_ BitVec 64))

(assert (=> start!45818 false))

(assert (=> start!45818 true))

(push 1)

(check-sat)

(pop 1)

