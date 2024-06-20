; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50996 () Bool)

(assert start!50996)

(declare-fun lt!373671 () (_ BitVec 64))

(declare-fun doubleAsLong64!1 () (_ BitVec 64))

(assert (=> start!50996 (= lt!373671 (bvlshr (bvand doubleAsLong64!1 #b0111111111110000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000110100))))

(assert (=> start!50996 (and (bvsge lt!373671 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!373671 #b0000000000000000000000000000000000000000000000000000011111111110) (bvsge lt!373671 #b0000000000000000000000000000000010000000000000000000000000000000))))

(assert (=> start!50996 true))

(push 1)

(check-sat)

(pop 1)

