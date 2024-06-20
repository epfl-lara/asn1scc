; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38370 () Bool)

(assert start!38370)

(declare-fun res!142752 () Bool)

(declare-fun e!120410 () Bool)

(assert (=> start!38370 (=> (not res!142752) (not e!120410))))

(declare-fun nBits!340 () (_ BitVec 32))

(declare-datatypes ((array!9246 0))(
  ( (array!9247 (arr!5011 (Array (_ BitVec 32) (_ BitVec 8))) (size!4081 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7270 0))(
  ( (BitStream!7271 (buf!4509 array!9246) (currentByte!8579 (_ BitVec 32)) (currentBit!8574 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7270)

(assert (=> start!38370 (= res!142752 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!4081 (buf!4509 thiss!1187))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8579 thiss!1187)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8574 thiss!1187)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!4081 (buf!4509 thiss!1187))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!8579 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!8574 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!38370 e!120410))

(assert (=> start!38370 true))

(declare-fun e!120411 () Bool)

(declare-fun inv!12 (BitStream!7270) Bool)

(assert (=> start!38370 (and (inv!12 thiss!1187) e!120411)))

(declare-fun b!172325 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!172325 (= e!120410 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8574 thiss!1187))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8579 thiss!1187))) ((_ extract 31 0) ((_ sign_extend 32) (size!4081 (buf!4509 thiss!1187)))))))))

(declare-fun b!172326 () Bool)

(declare-fun array_inv!3822 (array!9246) Bool)

(assert (=> b!172326 (= e!120411 (array_inv!3822 (buf!4509 thiss!1187)))))

(assert (= (and start!38370 res!142752) b!172325))

(assert (= start!38370 b!172326))

(declare-fun m!271469 () Bool)

(assert (=> start!38370 m!271469))

(declare-fun m!271471 () Bool)

(assert (=> b!172325 m!271471))

(declare-fun m!271473 () Bool)

(assert (=> b!172326 m!271473))

(push 1)

(assert (not b!172326))

(assert (not b!172325))

(assert (not start!38370))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

