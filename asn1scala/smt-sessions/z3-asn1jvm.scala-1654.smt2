; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46174 () Bool)

(assert start!46174)

(declare-fun i!769 () (_ BitVec 32))

(declare-fun to!537 () (_ BitVec 32))

(declare-datatypes ((array!10868 0))(
  ( (array!10869 (arr!5699 (Array (_ BitVec 32) (_ BitVec 8))) (size!4769 (_ BitVec 32))) )
))
(declare-fun arr!318 () array!10868)

(assert (=> start!46174 (and (bvsle #b00000000000000000000000000000000 i!769) (bvsle i!769 to!537) (bvsle to!537 (size!4769 arr!318)) (not (= (bvand to!537 #b10000000000000000000000000000000) (bvand i!769 #b10000000000000000000000000000000))) (not (= (bvand to!537 #b10000000000000000000000000000000) (bvand (bvsub to!537 i!769) #b10000000000000000000000000000000))))))

(assert (=> start!46174 true))

(declare-fun array_inv!4510 (array!10868) Bool)

(assert (=> start!46174 (array_inv!4510 arr!318)))

(declare-fun bs!18359 () Bool)

(assert (= bs!18359 start!46174))

(declare-fun m!340797 () Bool)

(assert (=> bs!18359 m!340797))

(check-sat (not start!46174))
(check-sat)
