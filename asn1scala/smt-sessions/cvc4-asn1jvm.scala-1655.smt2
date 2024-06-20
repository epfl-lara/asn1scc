; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46182 () Bool)

(assert start!46182)

(declare-datatypes ((array!10876 0))(
  ( (array!10877 (arr!5703 (Array (_ BitVec 32) (_ BitVec 8))) (size!4773 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!10876)

(declare-datatypes ((BitStream!8648 0))(
  ( (BitStream!8649 (buf!5317 array!10876) (currentByte!9978 (_ BitVec 32)) (currentBit!9973 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8648)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!46182 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4773 arr!308)) (or (bvsgt ((_ sign_extend 32) (size!4773 (buf!5317 thiss!1870))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!9978 thiss!1870)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!9973 thiss!1870)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!46182 true))

(declare-fun array_inv!4514 (array!10876) Bool)

(assert (=> start!46182 (array_inv!4514 arr!308)))

(declare-fun e!151276 () Bool)

(declare-fun inv!12 (BitStream!8648) Bool)

(assert (=> start!46182 (and (inv!12 thiss!1870) e!151276)))

(declare-fun b!222534 () Bool)

(assert (=> b!222534 (= e!151276 (array_inv!4514 (buf!5317 thiss!1870)))))

(assert (= start!46182 b!222534))

(declare-fun m!340813 () Bool)

(assert (=> start!46182 m!340813))

(declare-fun m!340815 () Bool)

(assert (=> start!46182 m!340815))

(declare-fun m!340817 () Bool)

(assert (=> b!222534 m!340817))

(push 1)

(assert (not start!46182))

(assert (not b!222534))

(check-sat)

(pop 1)

(push 1)

(check-sat)

