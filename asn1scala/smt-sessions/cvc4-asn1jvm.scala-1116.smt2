; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31924 () Bool)

(assert start!31924)

(declare-fun l!186 () (_ BitVec 64))

(assert (=> start!31924 false))

(assert (=> start!31924 true))

(push 1)

(check-sat)

(pop 1)

