; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3704 () Bool)

(assert start!3704)

(assert (=> start!3704 false))

(push 1)

(check-sat)

(pop 1)

