; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63718 () Bool)

(assert start!63718)

(assert (=> start!63718 false))

(push 1)

(check-sat)

(pop 1)

