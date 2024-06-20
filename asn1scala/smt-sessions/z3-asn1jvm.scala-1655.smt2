; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46180 () Bool)

(assert start!46180)

(declare-datatypes ((array!10874 0))(
  ( (array!10875 (arr!5702 (Array (_ BitVec 32) (_ BitVec 8))) (size!4772 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!10874)

(declare-datatypes ((BitStream!8646 0))(
  ( (BitStream!8647 (buf!5316 array!10874) (currentByte!9977 (_ BitVec 32)) (currentBit!9972 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8646)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!46180 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4772 arr!308)) (or (bvsgt ((_ sign_extend 32) (size!4772 (buf!5316 thiss!1870))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!9977 thiss!1870)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!9972 thiss!1870)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!46180 true))

(declare-fun array_inv!4513 (array!10874) Bool)

(assert (=> start!46180 (array_inv!4513 arr!308)))

(declare-fun e!151267 () Bool)

(declare-fun inv!12 (BitStream!8646) Bool)

(assert (=> start!46180 (and (inv!12 thiss!1870) e!151267)))

(declare-fun b!222531 () Bool)

(assert (=> b!222531 (= e!151267 (array_inv!4513 (buf!5316 thiss!1870)))))

(assert (= start!46180 b!222531))

(declare-fun m!340807 () Bool)

(assert (=> start!46180 m!340807))

(declare-fun m!340809 () Bool)

(assert (=> start!46180 m!340809))

(declare-fun m!340811 () Bool)

(assert (=> b!222531 m!340811))

(check-sat (not start!46180) (not b!222531))
(check-sat)
