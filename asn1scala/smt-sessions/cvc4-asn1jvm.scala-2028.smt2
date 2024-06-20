; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51844 () Bool)

(assert start!51844)

(assert (=> start!51844 false))

(push 1)

(check-sat)

(pop 1)

