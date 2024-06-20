; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46200 () Bool)

(assert start!46200)

(declare-fun res!186846 () Bool)

(declare-fun e!151315 () Bool)

(assert (=> start!46200 (=> (not res!186846) (not e!151315))))

(declare-datatypes ((array!10886 0))(
  ( (array!10887 (arr!5707 (Array (_ BitVec 32) (_ BitVec 8))) (size!4777 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!10886)

(declare-datatypes ((BitStream!8656 0))(
  ( (BitStream!8657 (buf!5321 array!10886) (currentByte!9983 (_ BitVec 32)) (currentBit!9978 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8656)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!46200 (= res!186846 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4777 arr!308)) (bvsle ((_ sign_extend 32) (size!4777 (buf!5321 thiss!1870))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!9983 thiss!1870)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!9978 thiss!1870)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!4777 (buf!5321 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!9983 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!9978 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!46200 e!151315))

(assert (=> start!46200 true))

(declare-fun array_inv!4518 (array!10886) Bool)

(assert (=> start!46200 (array_inv!4518 arr!308)))

(declare-fun e!151313 () Bool)

(declare-fun inv!12 (BitStream!8656) Bool)

(assert (=> start!46200 (and (inv!12 thiss!1870) e!151313)))

(declare-fun b!222548 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!222548 (= e!151315 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9978 thiss!1870))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9983 thiss!1870))) ((_ extract 31 0) ((_ sign_extend 32) (size!4777 (buf!5321 thiss!1870)))))))))

(declare-fun b!222549 () Bool)

(assert (=> b!222549 (= e!151313 (array_inv!4518 (buf!5321 thiss!1870)))))

(assert (= (and start!46200 res!186846) b!222548))

(assert (= start!46200 b!222549))

(declare-fun m!340841 () Bool)

(assert (=> start!46200 m!340841))

(declare-fun m!340843 () Bool)

(assert (=> start!46200 m!340843))

(declare-fun m!340845 () Bool)

(assert (=> b!222548 m!340845))

(declare-fun m!340847 () Bool)

(assert (=> b!222549 m!340847))

(push 1)

(assert (not b!222548))

(assert (not start!46200))

(assert (not b!222549))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

