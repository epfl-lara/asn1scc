; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3698 () Bool)

(assert start!3698)

(assert (=> start!3698 false))

(push 1)

(check-sat)

(pop 1)

