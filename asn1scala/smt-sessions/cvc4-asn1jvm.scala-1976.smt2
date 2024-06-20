; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51030 () Bool)

(assert start!51030)

(assert (=> start!51030 false))

(assert (=> start!51030 true))

(push 1)

(check-sat)

(pop 1)

