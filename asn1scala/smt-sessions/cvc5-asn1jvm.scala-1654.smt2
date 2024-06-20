; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46172 () Bool)

(assert start!46172)

(declare-fun i!769 () (_ BitVec 32))

(declare-fun to!537 () (_ BitVec 32))

(declare-datatypes ((array!10866 0))(
  ( (array!10867 (arr!5698 (Array (_ BitVec 32) (_ BitVec 8))) (size!4768 (_ BitVec 32))) )
))
(declare-fun arr!318 () array!10866)

(assert (=> start!46172 (and (bvsle #b00000000000000000000000000000000 i!769) (bvsle i!769 to!537) (bvsle to!537 (size!4768 arr!318)) (not (= (bvand to!537 #b10000000000000000000000000000000) (bvand i!769 #b10000000000000000000000000000000))) (not (= (bvand to!537 #b10000000000000000000000000000000) (bvand (bvsub to!537 i!769) #b10000000000000000000000000000000))))))

(assert (=> start!46172 true))

(declare-fun array_inv!4509 (array!10866) Bool)

(assert (=> start!46172 (array_inv!4509 arr!318)))

(declare-fun bs!18358 () Bool)

(assert (= bs!18358 start!46172))

(declare-fun m!340795 () Bool)

(assert (=> bs!18358 m!340795))

(push 1)

(assert (not start!46172))

(check-sat)

(pop 1)

(push 1)

(check-sat)

