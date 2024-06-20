; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51840 () Bool)

(assert start!51840)

(assert (=> start!51840 false))

(push 1)

(check-sat)

(pop 1)

