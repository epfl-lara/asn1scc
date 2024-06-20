; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45860 () Bool)

(assert start!45860)

(declare-fun v!298 () (_ BitVec 64))

(assert (=> start!45860 false))

(assert (=> start!45860 true))

(push 1)

(check-sat)

