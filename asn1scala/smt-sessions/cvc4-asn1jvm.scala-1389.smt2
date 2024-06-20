; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38374 () Bool)

(assert start!38374)

(declare-fun res!142758 () Bool)

(declare-fun e!120428 () Bool)

(assert (=> start!38374 (=> (not res!142758) (not e!120428))))

(declare-fun nBits!340 () (_ BitVec 32))

(declare-datatypes ((array!9250 0))(
  ( (array!9251 (arr!5013 (Array (_ BitVec 32) (_ BitVec 8))) (size!4083 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7274 0))(
  ( (BitStream!7275 (buf!4511 array!9250) (currentByte!8581 (_ BitVec 32)) (currentBit!8576 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7274)

(assert (=> start!38374 (= res!142758 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!4083 (buf!4511 thiss!1187))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8581 thiss!1187)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8576 thiss!1187)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!4083 (buf!4511 thiss!1187))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!8581 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!8576 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!38374 e!120428))

(assert (=> start!38374 true))

(declare-fun e!120429 () Bool)

(declare-fun inv!12 (BitStream!7274) Bool)

(assert (=> start!38374 (and (inv!12 thiss!1187) e!120429)))

(declare-fun b!172337 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!172337 (= e!120428 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8576 thiss!1187))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8581 thiss!1187))) ((_ extract 31 0) ((_ sign_extend 32) (size!4083 (buf!4511 thiss!1187)))))))))

(declare-fun b!172338 () Bool)

(declare-fun array_inv!3824 (array!9250) Bool)

(assert (=> b!172338 (= e!120429 (array_inv!3824 (buf!4511 thiss!1187)))))

(assert (= (and start!38374 res!142758) b!172337))

(assert (= start!38374 b!172338))

(declare-fun m!271481 () Bool)

(assert (=> start!38374 m!271481))

(declare-fun m!271483 () Bool)

(assert (=> b!172337 m!271483))

(declare-fun m!271485 () Bool)

(assert (=> b!172338 m!271485))

(push 1)

(assert (not start!38374))

(assert (not b!172338))

(assert (not b!172337))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

