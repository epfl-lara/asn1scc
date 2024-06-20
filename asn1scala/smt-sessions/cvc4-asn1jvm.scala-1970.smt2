; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50994 () Bool)

(assert start!50994)

(declare-fun doubleAsLong64!1 () (_ BitVec 64))

(assert (=> start!50994 false))

(assert (=> start!50994 true))

(push 1)

(check-sat)

(pop 1)

