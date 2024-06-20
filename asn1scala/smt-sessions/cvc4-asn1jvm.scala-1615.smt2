; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45824 () Bool)

(assert start!45824)

(declare-fun v!297 () (_ BitVec 64))

(assert (=> start!45824 false))

(assert (=> start!45824 true))

(push 1)

(check-sat)

(pop 1)

