; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73988 () Bool)

(assert start!73988)

(declare-fun from!576 () (_ BitVec 32))

(declare-fun to!543 () (_ BitVec 32))

(assert (=> start!73988 (and (bvsle #b00000000000000000000000000000000 from!576) (bvsle from!576 to!543) (bvsle to!543 #b00000000000000000000000000001000) (not (= from!576 to!543)) (bvslt to!543 #b00000000000000000000000000000000))))

(assert (=> start!73988 true))

(push 1)

(check-sat)

(pop 1)

