; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31920 () Bool)

(assert start!31920)

(declare-fun l!186 () (_ BitVec 64))

(assert (=> start!31920 false))

(assert (=> start!31920 true))

(push 1)

(check-sat)

(pop 1)

