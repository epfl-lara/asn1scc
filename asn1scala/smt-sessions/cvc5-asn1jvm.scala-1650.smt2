; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46128 () Bool)

(assert start!46128)

(assert (=> start!46128 false))

(push 1)

(check-sat)

(pop 1)

