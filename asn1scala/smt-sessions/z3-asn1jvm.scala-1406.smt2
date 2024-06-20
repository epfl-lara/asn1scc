; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38694 () Bool)

(assert start!38694)

(declare-fun b!174128 () Bool)

(declare-fun res!144206 () Bool)

(declare-fun e!121477 () Bool)

(assert (=> b!174128 (=> (not res!144206) (not e!121477))))

(declare-datatypes ((array!9369 0))(
  ( (array!9370 (arr!5063 (Array (_ BitVec 32) (_ BitVec 8))) (size!4133 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7374 0))(
  ( (BitStream!7375 (buf!4564 array!9369) (currentByte!8678 (_ BitVec 32)) (currentBit!8673 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7374)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!174128 (= res!144206 (invariant!0 (currentBit!8673 thiss!1187) (currentByte!8678 thiss!1187) (size!4133 (buf!4564 thiss!1187))))))

(declare-fun b!174129 () Bool)

(declare-fun e!121474 () Bool)

(declare-fun array_inv!3874 (array!9369) Bool)

(assert (=> b!174129 (= e!121474 (array_inv!3874 (buf!4564 thiss!1187)))))

(declare-fun b!174130 () Bool)

(declare-fun res!144203 () Bool)

(declare-fun e!121476 () Bool)

(assert (=> b!174130 (=> (not res!144203) (not e!121476))))

(declare-datatypes ((Unit!12520 0))(
  ( (Unit!12521) )
))
(declare-datatypes ((tuple2!15008 0))(
  ( (tuple2!15009 (_1!8146 Unit!12520) (_2!8146 BitStream!7374)) )
))
(declare-fun lt!268679 () tuple2!15008)

(assert (=> b!174130 (= res!144203 (= (size!4133 (buf!4564 thiss!1187)) (size!4133 (buf!4564 (_2!8146 lt!268679)))))))

(declare-fun res!144205 () Bool)

(assert (=> start!38694 (=> (not res!144205) (not e!121477))))

(declare-fun nBits!340 () (_ BitVec 32))

(assert (=> start!38694 (= res!144205 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38694 e!121477))

(assert (=> start!38694 true))

(declare-fun inv!12 (BitStream!7374) Bool)

(assert (=> start!38694 (and (inv!12 thiss!1187) e!121474)))

(declare-fun b!174131 () Bool)

(assert (=> b!174131 (= e!121476 false)))

(declare-datatypes ((tuple2!15010 0))(
  ( (tuple2!15011 (_1!8147 BitStream!7374) (_2!8147 BitStream!7374)) )
))
(declare-fun lt!268678 () tuple2!15010)

(declare-fun reader!0 (BitStream!7374 BitStream!7374) tuple2!15010)

(assert (=> b!174131 (= lt!268678 (reader!0 thiss!1187 (_2!8146 lt!268679)))))

(declare-fun b!174132 () Bool)

(assert (=> b!174132 (= e!121477 e!121476)))

(declare-fun res!144202 () Bool)

(assert (=> b!174132 (=> (not res!144202) (not e!121476))))

(assert (=> b!174132 (= res!144202 (= (size!4133 (buf!4564 (_2!8146 lt!268679))) (size!4133 (buf!4564 thiss!1187))))))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7374 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15008)

(assert (=> b!174132 (= lt!268679 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(declare-fun b!174133 () Bool)

(declare-fun res!144207 () Bool)

(assert (=> b!174133 (=> (not res!144207) (not e!121477))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!174133 (= res!144207 (validate_offset_bits!1 ((_ sign_extend 32) (size!4133 (buf!4564 thiss!1187))) ((_ sign_extend 32) (currentByte!8678 thiss!1187)) ((_ sign_extend 32) (currentBit!8673 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun b!174134 () Bool)

(declare-fun res!144201 () Bool)

(assert (=> b!174134 (=> (not res!144201) (not e!121476))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!174134 (= res!144201 (= (bitIndex!0 (size!4133 (buf!4564 (_2!8146 lt!268679))) (currentByte!8678 (_2!8146 lt!268679)) (currentBit!8673 (_2!8146 lt!268679))) (bvadd (bitIndex!0 (size!4133 (buf!4564 thiss!1187)) (currentByte!8678 thiss!1187) (currentBit!8673 thiss!1187)) ((_ sign_extend 32) nBits!340))))))

(declare-fun b!174135 () Bool)

(declare-fun res!144204 () Bool)

(assert (=> b!174135 (=> (not res!144204) (not e!121476))))

(declare-fun isPrefixOf!0 (BitStream!7374 BitStream!7374) Bool)

(assert (=> b!174135 (= res!144204 (isPrefixOf!0 thiss!1187 (_2!8146 lt!268679)))))

(assert (= (and start!38694 res!144205) b!174133))

(assert (= (and b!174133 res!144207) b!174128))

(assert (= (and b!174128 res!144206) b!174132))

(assert (= (and b!174132 res!144202) b!174134))

(assert (= (and b!174134 res!144201) b!174130))

(assert (= (and b!174130 res!144203) b!174135))

(assert (= (and b!174135 res!144204) b!174131))

(assert (= start!38694 b!174129))

(declare-fun m!273531 () Bool)

(assert (=> b!174129 m!273531))

(declare-fun m!273533 () Bool)

(assert (=> start!38694 m!273533))

(declare-fun m!273535 () Bool)

(assert (=> b!174135 m!273535))

(declare-fun m!273537 () Bool)

(assert (=> b!174134 m!273537))

(declare-fun m!273539 () Bool)

(assert (=> b!174134 m!273539))

(declare-fun m!273541 () Bool)

(assert (=> b!174133 m!273541))

(declare-fun m!273543 () Bool)

(assert (=> b!174132 m!273543))

(declare-fun m!273545 () Bool)

(assert (=> b!174128 m!273545))

(declare-fun m!273547 () Bool)

(assert (=> b!174131 m!273547))

(check-sat (not b!174134) (not b!174133) (not b!174132) (not b!174128) (not b!174131) (not b!174135) (not start!38694) (not b!174129))
