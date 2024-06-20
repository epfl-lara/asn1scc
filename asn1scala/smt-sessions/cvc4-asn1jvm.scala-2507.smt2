; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63392 () Bool)

(assert start!63392)

(assert (=> start!63392 false))

(push 1)

(check-sat)

(pop 1)

