; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38708 () Bool)

(assert start!38708)

(declare-fun b!174296 () Bool)

(declare-fun res!144348 () Bool)

(declare-fun e!121559 () Bool)

(assert (=> b!174296 (=> (not res!144348) (not e!121559))))

(declare-datatypes ((array!9383 0))(
  ( (array!9384 (arr!5070 (Array (_ BitVec 32) (_ BitVec 8))) (size!4140 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7388 0))(
  ( (BitStream!7389 (buf!4571 array!9383) (currentByte!8685 (_ BitVec 32)) (currentBit!8680 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7388)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!174296 (= res!144348 (invariant!0 (currentBit!8680 thiss!1187) (currentByte!8685 thiss!1187) (size!4140 (buf!4571 thiss!1187))))))

(declare-fun b!174297 () Bool)

(declare-fun e!121558 () Bool)

(assert (=> b!174297 (= e!121559 e!121558)))

(declare-fun res!144350 () Bool)

(assert (=> b!174297 (=> (not res!144350) (not e!121558))))

(declare-datatypes ((Unit!12534 0))(
  ( (Unit!12535) )
))
(declare-datatypes ((tuple2!15036 0))(
  ( (tuple2!15037 (_1!8160 Unit!12534) (_2!8160 BitStream!7388)) )
))
(declare-fun lt!268721 () tuple2!15036)

(assert (=> b!174297 (= res!144350 (= (size!4140 (buf!4571 (_2!8160 lt!268721))) (size!4140 (buf!4571 thiss!1187))))))

(declare-fun nBits!340 () (_ BitVec 32))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7388 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15036)

(assert (=> b!174297 (= lt!268721 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(declare-fun b!174298 () Bool)

(declare-fun e!121561 () Bool)

(declare-fun array_inv!3881 (array!9383) Bool)

(assert (=> b!174298 (= e!121561 (array_inv!3881 (buf!4571 thiss!1187)))))

(declare-fun res!144353 () Bool)

(assert (=> start!38708 (=> (not res!144353) (not e!121559))))

(assert (=> start!38708 (= res!144353 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38708 e!121559))

(assert (=> start!38708 true))

(declare-fun inv!12 (BitStream!7388) Bool)

(assert (=> start!38708 (and (inv!12 thiss!1187) e!121561)))

(declare-fun b!174299 () Bool)

(declare-fun res!144354 () Bool)

(assert (=> b!174299 (=> (not res!144354) (not e!121559))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!174299 (= res!144354 (validate_offset_bits!1 ((_ sign_extend 32) (size!4140 (buf!4571 thiss!1187))) ((_ sign_extend 32) (currentByte!8685 thiss!1187)) ((_ sign_extend 32) (currentBit!8680 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun b!174300 () Bool)

(assert (=> b!174300 (= e!121558 false)))

(declare-datatypes ((tuple2!15038 0))(
  ( (tuple2!15039 (_1!8161 BitStream!7388) (_2!8161 BitStream!7388)) )
))
(declare-fun lt!268720 () tuple2!15038)

(declare-fun reader!0 (BitStream!7388 BitStream!7388) tuple2!15038)

(assert (=> b!174300 (= lt!268720 (reader!0 thiss!1187 (_2!8160 lt!268721)))))

(declare-fun b!174301 () Bool)

(declare-fun res!144351 () Bool)

(assert (=> b!174301 (=> (not res!144351) (not e!121558))))

(assert (=> b!174301 (= res!144351 (= (size!4140 (buf!4571 thiss!1187)) (size!4140 (buf!4571 (_2!8160 lt!268721)))))))

(declare-fun b!174302 () Bool)

(declare-fun res!144349 () Bool)

(assert (=> b!174302 (=> (not res!144349) (not e!121558))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!174302 (= res!144349 (= (bitIndex!0 (size!4140 (buf!4571 (_2!8160 lt!268721))) (currentByte!8685 (_2!8160 lt!268721)) (currentBit!8680 (_2!8160 lt!268721))) (bvadd (bitIndex!0 (size!4140 (buf!4571 thiss!1187)) (currentByte!8685 thiss!1187) (currentBit!8680 thiss!1187)) ((_ sign_extend 32) nBits!340))))))

(declare-fun b!174303 () Bool)

(declare-fun res!144352 () Bool)

(assert (=> b!174303 (=> (not res!144352) (not e!121558))))

(declare-fun isPrefixOf!0 (BitStream!7388 BitStream!7388) Bool)

(assert (=> b!174303 (= res!144352 (isPrefixOf!0 thiss!1187 (_2!8160 lt!268721)))))

(assert (= (and start!38708 res!144353) b!174299))

(assert (= (and b!174299 res!144354) b!174296))

(assert (= (and b!174296 res!144348) b!174297))

(assert (= (and b!174297 res!144350) b!174302))

(assert (= (and b!174302 res!144349) b!174301))

(assert (= (and b!174301 res!144351) b!174303))

(assert (= (and b!174303 res!144352) b!174300))

(assert (= start!38708 b!174298))

(declare-fun m!273657 () Bool)

(assert (=> b!174297 m!273657))

(declare-fun m!273659 () Bool)

(assert (=> b!174298 m!273659))

(declare-fun m!273661 () Bool)

(assert (=> b!174299 m!273661))

(declare-fun m!273663 () Bool)

(assert (=> b!174296 m!273663))

(declare-fun m!273665 () Bool)

(assert (=> b!174300 m!273665))

(declare-fun m!273667 () Bool)

(assert (=> b!174302 m!273667))

(declare-fun m!273669 () Bool)

(assert (=> b!174302 m!273669))

(declare-fun m!273671 () Bool)

(assert (=> b!174303 m!273671))

(declare-fun m!273673 () Bool)

(assert (=> start!38708 m!273673))

(push 1)

(assert (not b!174298))

(assert (not b!174300))

(assert (not b!174302))

(assert (not start!38708))

(assert (not b!174297))

(assert (not b!174296))

(assert (not b!174303))

(assert (not b!174299))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

