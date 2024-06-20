; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31270 () Bool)

(assert start!31270)

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7242 0))(
  ( (array!7243 (arr!4166 (Array (_ BitVec 32) (_ BitVec 8))) (size!3277 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7242)

(assert (=> start!31270 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3277 arr!153)) (not (= (bvand to!236 #b10000000000000000000000000000000) (bvand from!240 #b10000000000000000000000000000000))) (not (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000))))))

(assert (=> start!31270 true))

(declare-fun array_inv!3036 (array!7242) Bool)

(assert (=> start!31270 (array_inv!3036 arr!153)))

(declare-fun bs!12903 () Bool)

(assert (= bs!12903 start!31270))

(declare-fun m!246117 () Bool)

(assert (=> bs!12903 m!246117))

(push 1)

(assert (not start!31270))

(check-sat)

(pop 1)

(push 1)

(check-sat)

