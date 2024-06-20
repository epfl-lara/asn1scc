; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38398 () Bool)

(assert start!38398)

(declare-fun b!172400 () Bool)

(declare-fun e!120484 () Bool)

(declare-datatypes ((array!9264 0))(
  ( (array!9265 (arr!5019 (Array (_ BitVec 32) (_ BitVec 8))) (size!4089 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7286 0))(
  ( (BitStream!7287 (buf!4517 array!9264) (currentByte!8589 (_ BitVec 32)) (currentBit!8584 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7286)

(declare-fun nBits!340 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!172400 (= e!120484 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4089 (buf!4517 thiss!1187))) ((_ sign_extend 32) (currentByte!8589 thiss!1187)) ((_ sign_extend 32) (currentBit!8584 thiss!1187)) ((_ sign_extend 32) nBits!340))))))

(declare-fun res!142802 () Bool)

(assert (=> start!38398 (=> (not res!142802) (not e!120484))))

(assert (=> start!38398 (= res!142802 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38398 e!120484))

(assert (=> start!38398 true))

(declare-fun e!120482 () Bool)

(declare-fun inv!12 (BitStream!7286) Bool)

(assert (=> start!38398 (and (inv!12 thiss!1187) e!120482)))

(declare-fun b!172399 () Bool)

(declare-fun res!142803 () Bool)

(assert (=> b!172399 (=> (not res!142803) (not e!120484))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!172399 (= res!142803 (invariant!0 (currentBit!8584 thiss!1187) (currentByte!8589 thiss!1187) (size!4089 (buf!4517 thiss!1187))))))

(declare-fun b!172401 () Bool)

(declare-fun array_inv!3830 (array!9264) Bool)

(assert (=> b!172401 (= e!120482 (array_inv!3830 (buf!4517 thiss!1187)))))

(declare-fun b!172398 () Bool)

(declare-fun res!142801 () Bool)

(assert (=> b!172398 (=> (not res!142801) (not e!120484))))

(assert (=> b!172398 (= res!142801 (validate_offset_bits!1 ((_ sign_extend 32) (size!4089 (buf!4517 thiss!1187))) ((_ sign_extend 32) (currentByte!8589 thiss!1187)) ((_ sign_extend 32) (currentBit!8584 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(assert (= (and start!38398 res!142802) b!172398))

(assert (= (and b!172398 res!142801) b!172399))

(assert (= (and b!172399 res!142803) b!172400))

(assert (= start!38398 b!172401))

(declare-fun m!271523 () Bool)

(assert (=> b!172399 m!271523))

(declare-fun m!271525 () Bool)

(assert (=> b!172400 m!271525))

(declare-fun m!271527 () Bool)

(assert (=> start!38398 m!271527))

(declare-fun m!271529 () Bool)

(assert (=> b!172401 m!271529))

(assert (=> b!172398 m!271525))

(push 1)

(assert (not b!172401))

(assert (not start!38398))

(assert (not b!172400))

(assert (not b!172399))

(assert (not b!172398))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

