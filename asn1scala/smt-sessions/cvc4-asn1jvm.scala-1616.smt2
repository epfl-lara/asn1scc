; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45830 () Bool)

(assert start!45830)

(declare-fun v!297 () (_ BitVec 64))

(assert (=> start!45830 false))

(assert (=> start!45830 true))

(push 1)

(check-sat)

(pop 1)

