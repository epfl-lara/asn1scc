; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50992 () Bool)

(assert start!50992)

(declare-fun doubleAsLong64!1 () (_ BitVec 64))

(assert (=> start!50992 false))

(assert (=> start!50992 true))

(check-sat)
