; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63334 () Bool)

(assert start!63334)

(assert (=> start!63334 false))

(push 1)

(check-sat)

(pop 1)

