; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31272 () Bool)

(assert start!31272)

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7244 0))(
  ( (array!7245 (arr!4167 (Array (_ BitVec 32) (_ BitVec 8))) (size!3278 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7244)

(assert (=> start!31272 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3278 arr!153)) (not (= (bvand to!236 #b10000000000000000000000000000000) (bvand from!240 #b10000000000000000000000000000000))) (not (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000))))))

(assert (=> start!31272 true))

(declare-fun array_inv!3037 (array!7244) Bool)

(assert (=> start!31272 (array_inv!3037 arr!153)))

(declare-fun bs!12904 () Bool)

(assert (= bs!12904 start!31272))

(declare-fun m!246119 () Bool)

(assert (=> bs!12904 m!246119))

(check-sat (not start!31272))
(check-sat)
