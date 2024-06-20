; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51012 () Bool)

(assert start!51012)

(declare-fun lt!373695 () (_ BitVec 64))

(declare-fun doubleAsLong64!1 () (_ BitVec 64))

(assert (=> start!51012 (= lt!373695 (bvlshr (bvand doubleAsLong64!1 #b0111111111110000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000110100))))

(assert (=> start!51012 false))

(assert (=> start!51012 true))

(push 1)

