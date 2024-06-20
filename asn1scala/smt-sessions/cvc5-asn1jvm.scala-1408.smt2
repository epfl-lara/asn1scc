; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38704 () Bool)

(assert start!38704)

(declare-fun b!174248 () Bool)

(declare-fun e!121537 () Bool)

(declare-datatypes ((array!9379 0))(
  ( (array!9380 (arr!5068 (Array (_ BitVec 32) (_ BitVec 8))) (size!4138 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7384 0))(
  ( (BitStream!7385 (buf!4569 array!9379) (currentByte!8683 (_ BitVec 32)) (currentBit!8678 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7384)

(declare-fun array_inv!3879 (array!9379) Bool)

(assert (=> b!174248 (= e!121537 (array_inv!3879 (buf!4569 thiss!1187)))))

(declare-fun b!174249 () Bool)

(declare-fun res!144306 () Bool)

(declare-fun e!121536 () Bool)

(assert (=> b!174249 (=> (not res!144306) (not e!121536))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!174249 (= res!144306 (invariant!0 (currentBit!8678 thiss!1187) (currentByte!8683 thiss!1187) (size!4138 (buf!4569 thiss!1187))))))

(declare-fun b!174250 () Bool)

(declare-fun res!144311 () Bool)

(declare-fun e!121534 () Bool)

(assert (=> b!174250 (=> (not res!144311) (not e!121534))))

(declare-datatypes ((Unit!12530 0))(
  ( (Unit!12531) )
))
(declare-datatypes ((tuple2!15028 0))(
  ( (tuple2!15029 (_1!8156 Unit!12530) (_2!8156 BitStream!7384)) )
))
(declare-fun lt!268709 () tuple2!15028)

(declare-fun isPrefixOf!0 (BitStream!7384 BitStream!7384) Bool)

(assert (=> b!174250 (= res!144311 (isPrefixOf!0 thiss!1187 (_2!8156 lt!268709)))))

(declare-fun b!174251 () Bool)

(declare-fun res!144309 () Bool)

(assert (=> b!174251 (=> (not res!144309) (not e!121534))))

(assert (=> b!174251 (= res!144309 (= (size!4138 (buf!4569 thiss!1187)) (size!4138 (buf!4569 (_2!8156 lt!268709)))))))

(declare-fun b!174252 () Bool)

(declare-fun res!144308 () Bool)

(assert (=> b!174252 (=> (not res!144308) (not e!121534))))

(declare-fun nBits!340 () (_ BitVec 32))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!174252 (= res!144308 (= (bitIndex!0 (size!4138 (buf!4569 (_2!8156 lt!268709))) (currentByte!8683 (_2!8156 lt!268709)) (currentBit!8678 (_2!8156 lt!268709))) (bvadd (bitIndex!0 (size!4138 (buf!4569 thiss!1187)) (currentByte!8683 thiss!1187) (currentBit!8678 thiss!1187)) ((_ sign_extend 32) nBits!340))))))

(declare-fun b!174253 () Bool)

(assert (=> b!174253 (= e!121534 false)))

(declare-datatypes ((tuple2!15030 0))(
  ( (tuple2!15031 (_1!8157 BitStream!7384) (_2!8157 BitStream!7384)) )
))
(declare-fun lt!268708 () tuple2!15030)

(declare-fun reader!0 (BitStream!7384 BitStream!7384) tuple2!15030)

(assert (=> b!174253 (= lt!268708 (reader!0 thiss!1187 (_2!8156 lt!268709)))))

(declare-fun res!144307 () Bool)

(assert (=> start!38704 (=> (not res!144307) (not e!121536))))

(assert (=> start!38704 (= res!144307 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38704 e!121536))

(assert (=> start!38704 true))

(declare-fun inv!12 (BitStream!7384) Bool)

(assert (=> start!38704 (and (inv!12 thiss!1187) e!121537)))

(declare-fun b!174254 () Bool)

(assert (=> b!174254 (= e!121536 e!121534)))

(declare-fun res!144312 () Bool)

(assert (=> b!174254 (=> (not res!144312) (not e!121534))))

(assert (=> b!174254 (= res!144312 (= (size!4138 (buf!4569 (_2!8156 lt!268709))) (size!4138 (buf!4569 thiss!1187))))))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7384 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15028)

(assert (=> b!174254 (= lt!268709 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(declare-fun b!174255 () Bool)

(declare-fun res!144310 () Bool)

(assert (=> b!174255 (=> (not res!144310) (not e!121536))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!174255 (= res!144310 (validate_offset_bits!1 ((_ sign_extend 32) (size!4138 (buf!4569 thiss!1187))) ((_ sign_extend 32) (currentByte!8683 thiss!1187)) ((_ sign_extend 32) (currentBit!8678 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(assert (= (and start!38704 res!144307) b!174255))

(assert (= (and b!174255 res!144310) b!174249))

(assert (= (and b!174249 res!144306) b!174254))

(assert (= (and b!174254 res!144312) b!174252))

(assert (= (and b!174252 res!144308) b!174251))

(assert (= (and b!174251 res!144309) b!174250))

(assert (= (and b!174250 res!144311) b!174253))

(assert (= start!38704 b!174248))

(declare-fun m!273621 () Bool)

(assert (=> b!174249 m!273621))

(declare-fun m!273623 () Bool)

(assert (=> b!174255 m!273623))

(declare-fun m!273625 () Bool)

(assert (=> b!174248 m!273625))

(declare-fun m!273627 () Bool)

(assert (=> b!174252 m!273627))

(declare-fun m!273629 () Bool)

(assert (=> b!174252 m!273629))

(declare-fun m!273631 () Bool)

(assert (=> b!174254 m!273631))

(declare-fun m!273633 () Bool)

(assert (=> start!38704 m!273633))

(declare-fun m!273635 () Bool)

(assert (=> b!174253 m!273635))

(declare-fun m!273637 () Bool)

(assert (=> b!174250 m!273637))

(push 1)

(assert (not start!38704))

(assert (not b!174252))

(assert (not b!174249))

(assert (not b!174248))

(assert (not b!174253))

(assert (not b!174254))

(assert (not b!174250))

(assert (not b!174255))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

