; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51016 () Bool)

(assert start!51016)

(declare-fun lt!373701 () (_ BitVec 64))

(declare-fun doubleAsLong64!1 () (_ BitVec 64))

(assert (=> start!51016 (= lt!373701 (bvlshr (bvand doubleAsLong64!1 #b0111111111110000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000110100))))

(assert (=> start!51016 false))

(assert (=> start!51016 true))

(check-sat)
