; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3702 () Bool)

(assert start!3702)

(assert (=> start!3702 false))

(push 1)

(check-sat)

(pop 1)

