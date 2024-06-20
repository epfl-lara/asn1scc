; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46204 () Bool)

(assert start!46204)

(declare-fun res!186852 () Bool)

(declare-fun e!151337 () Bool)

(assert (=> start!46204 (=> (not res!186852) (not e!151337))))

(declare-datatypes ((array!10890 0))(
  ( (array!10891 (arr!5709 (Array (_ BitVec 32) (_ BitVec 8))) (size!4779 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!10890)

(declare-datatypes ((BitStream!8660 0))(
  ( (BitStream!8661 (buf!5323 array!10890) (currentByte!9985 (_ BitVec 32)) (currentBit!9980 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8660)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!46204 (= res!186852 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4779 arr!308)) (bvsle ((_ sign_extend 32) (size!4779 (buf!5323 thiss!1870))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!9985 thiss!1870)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!9980 thiss!1870)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!4779 (buf!5323 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!9985 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!9980 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!46204 e!151337))

(assert (=> start!46204 true))

(declare-fun array_inv!4520 (array!10890) Bool)

(assert (=> start!46204 (array_inv!4520 arr!308)))

(declare-fun e!151340 () Bool)

(declare-fun inv!12 (BitStream!8660) Bool)

(assert (=> start!46204 (and (inv!12 thiss!1870) e!151340)))

(declare-fun b!222560 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!222560 (= e!151337 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9980 thiss!1870))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9985 thiss!1870))) ((_ extract 31 0) ((_ sign_extend 32) (size!4779 (buf!5323 thiss!1870)))))))))

(declare-fun b!222561 () Bool)

(assert (=> b!222561 (= e!151340 (array_inv!4520 (buf!5323 thiss!1870)))))

(assert (= (and start!46204 res!186852) b!222560))

(assert (= start!46204 b!222561))

(declare-fun m!340857 () Bool)

(assert (=> start!46204 m!340857))

(declare-fun m!340859 () Bool)

(assert (=> start!46204 m!340859))

(declare-fun m!340861 () Bool)

(assert (=> b!222560 m!340861))

(declare-fun m!340863 () Bool)

(assert (=> b!222561 m!340863))

(push 1)

(assert (not start!46204))

(assert (not b!222561))

(assert (not b!222560))

(check-sat)

(pop 1)

(push 1)

(check-sat)

