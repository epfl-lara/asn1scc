; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51044 () Bool)

(assert start!51044)

(assert (=> start!51044 false))

(push 1)

(check-sat)

(pop 1)

