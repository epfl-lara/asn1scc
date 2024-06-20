; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38700 () Bool)

(assert start!38700)

(declare-fun b!174200 () Bool)

(declare-fun res!144265 () Bool)

(declare-fun e!121511 () Bool)

(assert (=> b!174200 (=> (not res!144265) (not e!121511))))

(declare-datatypes ((array!9375 0))(
  ( (array!9376 (arr!5066 (Array (_ BitVec 32) (_ BitVec 8))) (size!4136 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7380 0))(
  ( (BitStream!7381 (buf!4567 array!9375) (currentByte!8681 (_ BitVec 32)) (currentBit!8676 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7380)

(declare-fun nBits!340 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!174200 (= res!144265 (validate_offset_bits!1 ((_ sign_extend 32) (size!4136 (buf!4567 thiss!1187))) ((_ sign_extend 32) (currentByte!8681 thiss!1187)) ((_ sign_extend 32) (currentBit!8676 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun b!174201 () Bool)

(declare-fun res!144266 () Bool)

(declare-fun e!121513 () Bool)

(assert (=> b!174201 (=> (not res!144266) (not e!121513))))

(declare-datatypes ((Unit!12526 0))(
  ( (Unit!12527) )
))
(declare-datatypes ((tuple2!15020 0))(
  ( (tuple2!15021 (_1!8152 Unit!12526) (_2!8152 BitStream!7380)) )
))
(declare-fun lt!268697 () tuple2!15020)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!174201 (= res!144266 (= (bitIndex!0 (size!4136 (buf!4567 (_2!8152 lt!268697))) (currentByte!8681 (_2!8152 lt!268697)) (currentBit!8676 (_2!8152 lt!268697))) (bvadd (bitIndex!0 (size!4136 (buf!4567 thiss!1187)) (currentByte!8681 thiss!1187) (currentBit!8676 thiss!1187)) ((_ sign_extend 32) nBits!340))))))

(declare-fun b!174202 () Bool)

(declare-fun res!144270 () Bool)

(assert (=> b!174202 (=> (not res!144270) (not e!121513))))

(declare-fun isPrefixOf!0 (BitStream!7380 BitStream!7380) Bool)

(assert (=> b!174202 (= res!144270 (isPrefixOf!0 thiss!1187 (_2!8152 lt!268697)))))

(declare-fun b!174203 () Bool)

(declare-fun res!144267 () Bool)

(assert (=> b!174203 (=> (not res!144267) (not e!121511))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!174203 (= res!144267 (invariant!0 (currentBit!8676 thiss!1187) (currentByte!8681 thiss!1187) (size!4136 (buf!4567 thiss!1187))))))

(declare-fun b!174204 () Bool)

(declare-fun e!121510 () Bool)

(declare-fun array_inv!3877 (array!9375) Bool)

(assert (=> b!174204 (= e!121510 (array_inv!3877 (buf!4567 thiss!1187)))))

(declare-fun b!174205 () Bool)

(assert (=> b!174205 (= e!121511 e!121513)))

(declare-fun res!144268 () Bool)

(assert (=> b!174205 (=> (not res!144268) (not e!121513))))

(assert (=> b!174205 (= res!144268 (= (size!4136 (buf!4567 (_2!8152 lt!268697))) (size!4136 (buf!4567 thiss!1187))))))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7380 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15020)

(assert (=> b!174205 (= lt!268697 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(declare-fun b!174206 () Bool)

(assert (=> b!174206 (= e!121513 (bvslt ((_ sign_extend 32) nBits!340) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!15022 0))(
  ( (tuple2!15023 (_1!8153 BitStream!7380) (_2!8153 BitStream!7380)) )
))
(declare-fun lt!268696 () tuple2!15022)

(declare-fun reader!0 (BitStream!7380 BitStream!7380) tuple2!15022)

(assert (=> b!174206 (= lt!268696 (reader!0 thiss!1187 (_2!8152 lt!268697)))))

(declare-fun res!144269 () Bool)

(assert (=> start!38700 (=> (not res!144269) (not e!121511))))

(assert (=> start!38700 (= res!144269 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38700 e!121511))

(assert (=> start!38700 true))

(declare-fun inv!12 (BitStream!7380) Bool)

(assert (=> start!38700 (and (inv!12 thiss!1187) e!121510)))

(declare-fun b!174207 () Bool)

(declare-fun res!144264 () Bool)

(assert (=> b!174207 (=> (not res!144264) (not e!121513))))

(assert (=> b!174207 (= res!144264 (= (size!4136 (buf!4567 thiss!1187)) (size!4136 (buf!4567 (_2!8152 lt!268697)))))))

(assert (= (and start!38700 res!144269) b!174200))

(assert (= (and b!174200 res!144265) b!174203))

(assert (= (and b!174203 res!144267) b!174205))

(assert (= (and b!174205 res!144268) b!174201))

(assert (= (and b!174201 res!144266) b!174207))

(assert (= (and b!174207 res!144264) b!174202))

(assert (= (and b!174202 res!144270) b!174206))

(assert (= start!38700 b!174204))

(declare-fun m!273585 () Bool)

(assert (=> b!174206 m!273585))

(declare-fun m!273587 () Bool)

(assert (=> b!174205 m!273587))

(declare-fun m!273589 () Bool)

(assert (=> b!174203 m!273589))

(declare-fun m!273591 () Bool)

(assert (=> b!174200 m!273591))

(declare-fun m!273593 () Bool)

(assert (=> b!174202 m!273593))

(declare-fun m!273595 () Bool)

(assert (=> b!174201 m!273595))

(declare-fun m!273597 () Bool)

(assert (=> b!174201 m!273597))

(declare-fun m!273599 () Bool)

(assert (=> start!38700 m!273599))

(declare-fun m!273601 () Bool)

(assert (=> b!174204 m!273601))

(check-sat (not b!174204) (not b!174203) (not b!174200) (not b!174202) (not b!174201) (not start!38700) (not b!174206) (not b!174205))
(check-sat)
