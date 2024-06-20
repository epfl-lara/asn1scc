; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46136 () Bool)

(assert start!46136)

(declare-datatypes ((array!10845 0))(
  ( (array!10846 (arr!5690 (Array (_ BitVec 32) (_ BitVec 8))) (size!4760 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8628 0))(
  ( (BitStream!8629 (buf!5307 array!10845) (currentByte!9966 (_ BitVec 32)) (currentBit!9961 (_ BitVec 32))) )
))
(declare-fun thiss!1888 () BitStream!8628)

(declare-fun arr!318 () array!10845)

(declare-fun i!769 () (_ BitVec 32))

(declare-fun to!537 () (_ BitVec 32))

(assert (=> start!46136 (and (bvsle #b00000000000000000000000000000000 i!769) (bvsle i!769 to!537) (bvsle to!537 (size!4760 arr!318)) (or (bvsgt ((_ sign_extend 32) (size!4760 (buf!5307 thiss!1888))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!9966 thiss!1888)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!9961 thiss!1888)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!46136 true))

(declare-fun array_inv!4501 (array!10845) Bool)

(assert (=> start!46136 (array_inv!4501 arr!318)))

(declare-fun e!151168 () Bool)

(declare-fun inv!12 (BitStream!8628) Bool)

(assert (=> start!46136 (and (inv!12 thiss!1888) e!151168)))

(declare-fun b!222495 () Bool)

(assert (=> b!222495 (= e!151168 (array_inv!4501 (buf!5307 thiss!1888)))))

(assert (= start!46136 b!222495))

(declare-fun m!340735 () Bool)

(assert (=> start!46136 m!340735))

(declare-fun m!340737 () Bool)

(assert (=> start!46136 m!340737))

(declare-fun m!340739 () Bool)

(assert (=> b!222495 m!340739))

(check-sat (not start!46136) (not b!222495))
(check-sat)
