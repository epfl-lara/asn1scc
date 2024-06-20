; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51894 () Bool)

(assert start!51894)

(assert (=> start!51894 false))

(push 1)

(check-sat)

(pop 1)

