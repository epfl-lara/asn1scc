; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45908 () Bool)

(assert start!45908)

(declare-fun v!298 () (_ BitVec 64))

(assert (=> start!45908 false))

(assert (=> start!45908 true))

(push 1)

(check-sat)

(pop 1)

