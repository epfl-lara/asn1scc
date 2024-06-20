; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51898 () Bool)

(assert start!51898)

(assert (=> start!51898 false))

(push 1)

(check-sat)

(pop 1)

