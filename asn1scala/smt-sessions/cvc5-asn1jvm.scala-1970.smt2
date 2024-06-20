; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50990 () Bool)

(assert start!50990)

(declare-fun doubleAsLong64!1 () (_ BitVec 64))

(assert (=> start!50990 false))

(assert (=> start!50990 true))

(push 1)

(check-sat)

(pop 1)

