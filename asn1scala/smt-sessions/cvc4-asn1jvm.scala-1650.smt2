; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46132 () Bool)

(assert start!46132)

(assert (=> start!46132 false))

(push 1)

(check-sat)

(pop 1)

