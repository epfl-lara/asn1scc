; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74004 () Bool)

(assert start!74004)

(declare-fun from!576 () (_ BitVec 32))

(declare-fun to!543 () (_ BitVec 32))

(assert (=> start!74004 (and (bvsle #b00000000000000000000000000000000 from!576) (bvsle from!576 to!543) (bvsle to!543 #b00000000000000000000000000001000) (not (= from!576 to!543)) (bvslt to!543 #b00000000000000000000000000000000))))

(assert (=> start!74004 true))

(check-sat)
