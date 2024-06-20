; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51014 () Bool)

(assert start!51014)

(declare-fun lt!373698 () (_ BitVec 64))

(declare-fun doubleAsLong64!1 () (_ BitVec 64))

(assert (=> start!51014 (= lt!373698 (bvlshr (bvand doubleAsLong64!1 #b0111111111110000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000110100))))

(assert (=> start!51014 false))

(assert (=> start!51014 true))

(push 1)

(check-sat)

(pop 1)

