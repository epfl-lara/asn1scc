; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3708 () Bool)

(assert start!3708)

(assert (=> start!3708 false))

(push 1)

(check-sat)

(pop 1)

