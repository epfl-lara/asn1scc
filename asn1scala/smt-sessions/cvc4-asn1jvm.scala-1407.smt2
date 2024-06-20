; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38702 () Bool)

(assert start!38702)

(declare-fun b!174224 () Bool)

(declare-fun e!121524 () Bool)

(declare-fun nBits!340 () (_ BitVec 32))

(assert (=> b!174224 (= e!121524 (bvslt ((_ sign_extend 32) nBits!340) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!9377 0))(
  ( (array!9378 (arr!5067 (Array (_ BitVec 32) (_ BitVec 8))) (size!4137 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7382 0))(
  ( (BitStream!7383 (buf!4568 array!9377) (currentByte!8682 (_ BitVec 32)) (currentBit!8677 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15024 0))(
  ( (tuple2!15025 (_1!8154 BitStream!7382) (_2!8154 BitStream!7382)) )
))
(declare-fun lt!268703 () tuple2!15024)

(declare-fun thiss!1187 () BitStream!7382)

(declare-datatypes ((Unit!12528 0))(
  ( (Unit!12529) )
))
(declare-datatypes ((tuple2!15026 0))(
  ( (tuple2!15027 (_1!8155 Unit!12528) (_2!8155 BitStream!7382)) )
))
(declare-fun lt!268702 () tuple2!15026)

(declare-fun reader!0 (BitStream!7382 BitStream!7382) tuple2!15024)

(assert (=> b!174224 (= lt!268703 (reader!0 thiss!1187 (_2!8155 lt!268702)))))

(declare-fun b!174225 () Bool)

(declare-fun res!144288 () Bool)

(assert (=> b!174225 (=> (not res!144288) (not e!121524))))

(declare-fun isPrefixOf!0 (BitStream!7382 BitStream!7382) Bool)

(assert (=> b!174225 (= res!144288 (isPrefixOf!0 thiss!1187 (_2!8155 lt!268702)))))

(declare-fun b!174226 () Bool)

(declare-fun e!121522 () Bool)

(assert (=> b!174226 (= e!121522 e!121524)))

(declare-fun res!144289 () Bool)

(assert (=> b!174226 (=> (not res!144289) (not e!121524))))

(assert (=> b!174226 (= res!144289 (= (size!4137 (buf!4568 (_2!8155 lt!268702))) (size!4137 (buf!4568 thiss!1187))))))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7382 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15026)

(assert (=> b!174226 (= lt!268702 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(declare-fun res!144287 () Bool)

(assert (=> start!38702 (=> (not res!144287) (not e!121522))))

(assert (=> start!38702 (= res!144287 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38702 e!121522))

(assert (=> start!38702 true))

(declare-fun e!121525 () Bool)

(declare-fun inv!12 (BitStream!7382) Bool)

(assert (=> start!38702 (and (inv!12 thiss!1187) e!121525)))

(declare-fun b!174227 () Bool)

(declare-fun res!144290 () Bool)

(assert (=> b!174227 (=> (not res!144290) (not e!121522))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!174227 (= res!144290 (invariant!0 (currentBit!8677 thiss!1187) (currentByte!8682 thiss!1187) (size!4137 (buf!4568 thiss!1187))))))

(declare-fun b!174228 () Bool)

(declare-fun array_inv!3878 (array!9377) Bool)

(assert (=> b!174228 (= e!121525 (array_inv!3878 (buf!4568 thiss!1187)))))

(declare-fun b!174229 () Bool)

(declare-fun res!144291 () Bool)

(assert (=> b!174229 (=> (not res!144291) (not e!121524))))

(assert (=> b!174229 (= res!144291 (= (size!4137 (buf!4568 thiss!1187)) (size!4137 (buf!4568 (_2!8155 lt!268702)))))))

(declare-fun b!174230 () Bool)

(declare-fun res!144285 () Bool)

(assert (=> b!174230 (=> (not res!144285) (not e!121522))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!174230 (= res!144285 (validate_offset_bits!1 ((_ sign_extend 32) (size!4137 (buf!4568 thiss!1187))) ((_ sign_extend 32) (currentByte!8682 thiss!1187)) ((_ sign_extend 32) (currentBit!8677 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun b!174231 () Bool)

(declare-fun res!144286 () Bool)

(assert (=> b!174231 (=> (not res!144286) (not e!121524))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!174231 (= res!144286 (= (bitIndex!0 (size!4137 (buf!4568 (_2!8155 lt!268702))) (currentByte!8682 (_2!8155 lt!268702)) (currentBit!8677 (_2!8155 lt!268702))) (bvadd (bitIndex!0 (size!4137 (buf!4568 thiss!1187)) (currentByte!8682 thiss!1187) (currentBit!8677 thiss!1187)) ((_ sign_extend 32) nBits!340))))))

(assert (= (and start!38702 res!144287) b!174230))

(assert (= (and b!174230 res!144285) b!174227))

(assert (= (and b!174227 res!144290) b!174226))

(assert (= (and b!174226 res!144289) b!174231))

(assert (= (and b!174231 res!144286) b!174229))

(assert (= (and b!174229 res!144291) b!174225))

(assert (= (and b!174225 res!144288) b!174224))

(assert (= start!38702 b!174228))

(declare-fun m!273603 () Bool)

(assert (=> b!174228 m!273603))

(declare-fun m!273605 () Bool)

(assert (=> start!38702 m!273605))

(declare-fun m!273607 () Bool)

(assert (=> b!174227 m!273607))

(declare-fun m!273609 () Bool)

(assert (=> b!174226 m!273609))

(declare-fun m!273611 () Bool)

(assert (=> b!174224 m!273611))

(declare-fun m!273613 () Bool)

(assert (=> b!174230 m!273613))

(declare-fun m!273615 () Bool)

(assert (=> b!174231 m!273615))

(declare-fun m!273617 () Bool)

(assert (=> b!174231 m!273617))

(declare-fun m!273619 () Bool)

(assert (=> b!174225 m!273619))

(push 1)

(assert (not b!174225))

(assert (not b!174226))

(assert (not b!174228))

(assert (not start!38702))

(assert (not b!174231))

(assert (not b!174227))

(assert (not b!174230))

(assert (not b!174224))

(check-sat)

(pop 1)

(push 1)

(check-sat)

