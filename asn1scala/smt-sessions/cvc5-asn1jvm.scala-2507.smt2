; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63388 () Bool)

(assert start!63388)

(assert (=> start!63388 false))

(push 1)

(check-sat)

(pop 1)

