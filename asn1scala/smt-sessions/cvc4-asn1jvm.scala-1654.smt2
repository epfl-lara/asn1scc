; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46176 () Bool)

(assert start!46176)

(declare-fun i!769 () (_ BitVec 32))

(declare-fun to!537 () (_ BitVec 32))

(declare-datatypes ((array!10870 0))(
  ( (array!10871 (arr!5700 (Array (_ BitVec 32) (_ BitVec 8))) (size!4770 (_ BitVec 32))) )
))
(declare-fun arr!318 () array!10870)

(assert (=> start!46176 (and (bvsle #b00000000000000000000000000000000 i!769) (bvsle i!769 to!537) (bvsle to!537 (size!4770 arr!318)) (not (= (bvand to!537 #b10000000000000000000000000000000) (bvand i!769 #b10000000000000000000000000000000))) (not (= (bvand to!537 #b10000000000000000000000000000000) (bvand (bvsub to!537 i!769) #b10000000000000000000000000000000))))))

(assert (=> start!46176 true))

(declare-fun array_inv!4511 (array!10870) Bool)

(assert (=> start!46176 (array_inv!4511 arr!318)))

(declare-fun bs!18360 () Bool)

(assert (= bs!18360 start!46176))

(declare-fun m!340799 () Bool)

(assert (=> bs!18360 m!340799))

(push 1)

(assert (not 