; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46188 () Bool)

(assert start!46188)

(declare-datatypes ((array!10882 0))(
  ( (array!10883 (arr!5706 (Array (_ BitVec 32) (_ BitVec 8))) (size!4776 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!10882)

(declare-datatypes ((BitStream!8654 0))(
  ( (BitStream!8655 (buf!5320 array!10882) (currentByte!9981 (_ BitVec 32)) (currentBit!9976 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8654)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!46188 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4776 arr!308)) (bvsle ((_ sign_extend 32) (size!4776 (buf!5320 thiss!1870))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!9981 thiss!1870)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!9976 thiss!1870)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!4776 (buf!5320 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!9981 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!9976 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!46188 true))

(declare-fun array_inv!4517 (array!10882) Bool)

(assert (=> start!46188 (array_inv!4517 arr!308)))

(declare-fun e!151303 () Bool)

(declare-fun inv!12 (BitStream!8654) Bool)

(assert (=> start!46188 (and (inv!12 thiss!1870) e!151303)))

(declare-fun b!222543 () Bool)

(assert (=> b!222543 (= e!151303 (array_inv!4517 (buf!5320 thiss!1870)))))

(assert (= start!46188 b!222543))

(declare-fun m!340831 () Bool)

(assert (=> start!46188 m!340831))

(declare-fun m!340833 () Bool)

(assert (=> start!46188 m!340833))

(declare-fun m!340835 () Bool)

(assert (=> b!222543 m!340835))

(push 1)

(assert (not start!46188))

(assert (not b!222543))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

