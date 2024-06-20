; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51032 () Bool)

(assert start!51032)

(assert (=> start!51032 false))

(assert (=> start!51032 true))

(push 1)

(check-sat)

(pop 1)

