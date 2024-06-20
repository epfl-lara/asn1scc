; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51010 () Bool)

(assert start!51010)

(declare-fun lt!373692 () (_ BitVec 64))

(declare-fun doubleAsLong64!1 () (_ BitVec 64))

(assert (=> start!51010 (= lt!373692 (bvlshr (bvand doubleAsLong64!1 #b0111111111110000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000110100))))

(assert (=> start!51010 false))

(assert (=> start!51010 true))

(check-sat)
