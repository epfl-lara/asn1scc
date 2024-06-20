; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31274 () Bool)

(assert start!31274)

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7246 0))(
  ( (array!7247 (arr!4168 (Array (_ BitVec 32) (_ BitVec 8))) (size!3279 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7246)

(assert (=> start!31274 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3279 arr!153)) (not (= (bvand to!236 #b10000000000000000000000000000000) (bvand from!240 #b10000000000000000000000000000000))) (not (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000))))))

(assert (=> start!31274 true))

(declare-fun array_inv!3038 (array!7246) Bool)

(assert (=> start!31274 (array_inv!3038 arr!153)))

(declare-fun bs!12905 () Bool)

(assert (= bs!12905 start!31274))

(declare-fun m!246121 () Bool)

(assert (=> bs!12905 m!246121))

(push 1)

(assert (not start!31274))

(check-sat)

(pop 1)

(push 1)

(check-sat)

