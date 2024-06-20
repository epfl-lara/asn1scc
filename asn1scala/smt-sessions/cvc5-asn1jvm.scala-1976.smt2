; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51026 () Bool)

(assert start!51026)

(assert (=> start!51026 false))

(assert (=> start!51026 true))

(push 1)

(check-sat)

(pop 1)

