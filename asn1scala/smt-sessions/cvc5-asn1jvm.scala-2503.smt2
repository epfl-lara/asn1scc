; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63330 () Bool)

(assert start!63330)

(assert (=> start!63330 false))

(push 1)

(check-sat)

(pop 1)

