; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51036 () Bool)

(assert start!51036)

(assert (=> start!51036 false))

(assert (=> start!51036 true))

(push 1)

(check-sat)

