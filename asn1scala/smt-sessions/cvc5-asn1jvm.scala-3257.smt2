; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74008 () Bool)

(assert start!74008)

(declare-fun from!576 () (_ BitVec 32))

(declare-fun to!543 () (_ BitVec 32))

(assert (=> start!74008 (and (bvsle #b00000000000000000000000000000000 from!576) (bvsle from!576 to!543) (bvsle to!543 #b00000000000000000000000000001000) (not (= from!576 to!543)) (not (= #b00000000000000000000000000000000 (bvand from!576 #b10000000000000000000000000000000))) (not (= #b00000000000000000000000000000000 (bvand (bvsub #b00000000000000000000000000001000 from!576) #b10000000000000000000000000000000))))))

(assert (=> start!74008 true))

(push 1)

(check-sat)

(pop 1)

