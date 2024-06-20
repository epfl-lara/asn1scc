; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63714 () Bool)

(assert start!63714)

(assert (=> start!63714 false))

(push 1)

(check-sat)

(pop 1)

