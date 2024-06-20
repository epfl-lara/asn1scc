; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31918 () Bool)

(assert start!31918)

(declare-fun l!186 () (_ BitVec 64))

(assert (=> start!31918 false))

(assert (=> start!31918 true))

(push 1)

(check-sat)

(pop 1)

