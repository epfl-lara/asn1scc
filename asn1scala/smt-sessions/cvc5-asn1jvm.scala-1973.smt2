; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51008 () Bool)

(assert start!51008)

(declare-fun lt!373689 () (_ BitVec 64))

(declare-fun doubleAsLong64!1 () (_ BitVec 64))

(assert (=> start!51008 (= lt!373689 (bvlshr (bvand doubleAsLong64!1 #b0111111111110000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000110100))))

(assert (=> start!51008 false))

(assert (=> start!51008 true))

(push 1)

(check-sat)

(pop 1)

