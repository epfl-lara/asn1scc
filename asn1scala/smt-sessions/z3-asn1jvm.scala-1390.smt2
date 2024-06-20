; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38390 () Bool)

(assert start!38390)

(declare-fun res!142770 () Bool)

(declare-fun e!120447 () Bool)

(assert (=> start!38390 (=> (not res!142770) (not e!120447))))

(declare-fun nBits!340 () (_ BitVec 32))

(declare-datatypes ((array!9256 0))(
  ( (array!9257 (arr!5015 (Array (_ BitVec 32) (_ BitVec 8))) (size!4085 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7278 0))(
  ( (BitStream!7279 (buf!4513 array!9256) (currentByte!8585 (_ BitVec 32)) (currentBit!8580 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7278)

(assert (=> start!38390 (= res!142770 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!4085 (buf!4513 thiss!1187))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8585 thiss!1187)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8580 thiss!1187)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!4085 (buf!4513 thiss!1187))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!8585 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!8580 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!38390 e!120447))

(assert (=> start!38390 true))

(declare-fun e!120448 () Bool)

(declare-fun inv!12 (BitStream!7278) Bool)

(assert (=> start!38390 (and (inv!12 thiss!1187) e!120448)))

(declare-fun b!172354 () Bool)

(declare-fun res!142769 () Bool)

(assert (=> b!172354 (=> (not res!142769) (not e!120447))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!172354 (= res!142769 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8580 thiss!1187))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8585 thiss!1187))) ((_ extract 31 0) ((_ sign_extend 32) (size!4085 (buf!4513 thiss!1187))))))))

(declare-fun b!172355 () Bool)

(assert (=> b!172355 (= e!120447 (bvslt ((_ sign_extend 32) nBits!340) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!172356 () Bool)

(declare-fun array_inv!3826 (array!9256) Bool)

(assert (=> b!172356 (= e!120448 (array_inv!3826 (buf!4513 thiss!1187)))))

(assert (= (and start!38390 res!142770) b!172354))

(assert (= (and b!172354 res!142769) b!172355))

(assert (= start!38390 b!172356))

(declare-fun m!271495 () Bool)

(assert (=> start!38390 m!271495))

(declare-fun m!271497 () Bool)

(assert (=> b!172354 m!271497))

(declare-fun m!271499 () Bool)

(assert (=> b!172356 m!271499))

(check-sat (not b!172356) (not b!172354) (not start!38390))
(check-sat)
