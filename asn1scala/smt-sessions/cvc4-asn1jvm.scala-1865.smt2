; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49456 () Bool)

(assert start!49456)

(declare-fun l!233 () (_ BitVec 64))

(declare-fun i!785 () (_ BitVec 32))

(assert (=> start!49456 false))

(assert (=> start!49456 true))

(push 1)

(check-sat)

(pop 1)

