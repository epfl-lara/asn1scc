; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46178 () Bool)

(assert start!46178)

(declare-datatypes ((array!10872 0))(
  ( (array!10873 (arr!5701 (Array (_ BitVec 32) (_ BitVec 8))) (size!4771 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!10872)

(declare-datatypes ((BitStream!8644 0))(
  ( (BitStream!8645 (buf!5315 array!10872) (currentByte!9976 (_ BitVec 32)) (currentBit!9971 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8644)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!46178 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4771 arr!308)) (or (bvsgt ((_ sign_extend 32) (size!4771 (buf!5315 thiss!1870))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!9976 thiss!1870)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!9971 thiss!1870)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!46178 true))

(declare-fun array_inv!4512 (array!10872) Bool)

(assert (=> start!46178 (array_inv!4512 arr!308)))

(declare-fun e!151258 () Bool)

(declare-fun inv!12 (BitStream!8644) Bool)

(assert (=> start!46178 (and (inv!12 thiss!1870) e!151258)))

(declare-fun b!222528 () Bool)

(assert (=> b!222528 (= e!151258 (array_inv!4512 (buf!5315 thiss!1870)))))

(assert (= start!46178 b!222528))

(declare-fun m!340801 () Bool)

(assert (=> start!46178 m!340801))

(declare-fun m!340803 () Bool)

(assert (=> start!46178 m!340803))

(declare-fun m!340805 () Bool)

(assert (=> b!222528 m!340805))

(push 1)

(assert (not start!46178))

(assert (not b!222528))

(check-sat)

(pop 1)

(push 1)

(check-sat)

