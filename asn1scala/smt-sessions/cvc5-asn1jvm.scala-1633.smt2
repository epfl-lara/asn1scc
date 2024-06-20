; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45952 () Bool)

(assert start!45952)

(declare-fun v!298 () (_ BitVec 64))

(assert (=> start!45952 false))

(assert (=> start!45952 true))

(push 1)

(check-sat)

(pop 1)

