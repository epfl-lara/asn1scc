; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31914 () Bool)

(assert start!31914)

(declare-fun l!186 () (_ BitVec 64))

(assert (=> start!31914 false))

(assert (=> start!31914 true))

(push 1)

(check-sat)

(pop 1)

