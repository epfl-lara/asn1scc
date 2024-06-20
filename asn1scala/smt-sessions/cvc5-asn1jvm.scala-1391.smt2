; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38394 () Bool)

(assert start!38394)

(declare-fun b!172377 () Bool)

(declare-fun e!120466 () Bool)

(declare-datatypes ((array!9260 0))(
  ( (array!9261 (arr!5017 (Array (_ BitVec 32) (_ BitVec 8))) (size!4087 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7282 0))(
  ( (BitStream!7283 (buf!4515 array!9260) (currentByte!8587 (_ BitVec 32)) (currentBit!8582 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7282)

(declare-fun array_inv!3828 (array!9260) Bool)

(assert (=> b!172377 (= e!120466 (array_inv!3828 (buf!4515 thiss!1187)))))

(declare-fun b!172374 () Bool)

(declare-fun res!142784 () Bool)

(declare-fun e!120464 () Bool)

(assert (=> b!172374 (=> (not res!142784) (not e!120464))))

(declare-fun nBits!340 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!172374 (= res!142784 (validate_offset_bits!1 ((_ sign_extend 32) (size!4087 (buf!4515 thiss!1187))) ((_ sign_extend 32) (currentByte!8587 thiss!1187)) ((_ sign_extend 32) (currentBit!8582 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun b!172375 () Bool)

(declare-fun res!142783 () Bool)

(assert (=> b!172375 (=> (not res!142783) (not e!120464))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!172375 (= res!142783 (invariant!0 (currentBit!8582 thiss!1187) (currentByte!8587 thiss!1187) (size!4087 (buf!4515 thiss!1187))))))

(declare-fun b!172376 () Bool)

(assert (=> b!172376 (= e!120464 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4087 (buf!4515 thiss!1187))) ((_ sign_extend 32) (currentByte!8587 thiss!1187)) ((_ sign_extend 32) (currentBit!8582 thiss!1187)) ((_ sign_extend 32) nBits!340))))))

(declare-fun res!142785 () Bool)

(assert (=> start!38394 (=> (not res!142785) (not e!120464))))

(assert (=> start!38394 (= res!142785 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38394 e!120464))

(assert (=> start!38394 true))

(declare-fun inv!12 (BitStream!7282) Bool)

(assert (=> start!38394 (and (inv!12 thiss!1187) e!120466)))

(assert (= (and start!38394 res!142785) b!172374))

(assert (= (and b!172374 res!142784) b!172375))

(assert (= (and b!172375 res!142783) b!172376))

(assert (= start!38394 b!172377))

(declare-fun m!271507 () Bool)

(assert (=> b!172376 m!271507))

(declare-fun m!271509 () Bool)

(assert (=> b!172377 m!271509))

(declare-fun m!271511 () Bool)

(assert (=> start!38394 m!271511))

(assert (=> b!172374 m!271507))

(declare-fun m!271513 () Bool)

(assert (=> b!172375 m!271513))

(push 1)

(assert (not start!38394))

(assert (not b!172374))

(assert (not b!172377))

(assert (not b!172376))

(assert (not b!172375))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

