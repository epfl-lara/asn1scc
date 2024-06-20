; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38504 () Bool)

(assert start!38504)

(declare-fun b!173078 () Bool)

(declare-fun res!143349 () Bool)

(declare-fun e!120889 () Bool)

(assert (=> b!173078 (=> (not res!143349) (not e!120889))))

(declare-datatypes ((array!9310 0))(
  ( (array!9311 (arr!5039 (Array (_ BitVec 32) (_ BitVec 8))) (size!4109 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7326 0))(
  ( (BitStream!7327 (buf!4537 array!9310) (currentByte!8624 (_ BitVec 32)) (currentBit!8619 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7326)

(declare-datatypes ((Unit!12387 0))(
  ( (Unit!12388) )
))
(declare-datatypes ((tuple2!14888 0))(
  ( (tuple2!14889 (_1!8086 Unit!12387) (_2!8086 BitStream!7326)) )
))
(declare-fun lt!266626 () tuple2!14888)

(declare-fun isPrefixOf!0 (BitStream!7326 BitStream!7326) Bool)

(assert (=> b!173078 (= res!143349 (isPrefixOf!0 thiss!1187 (_2!8086 lt!266626)))))

(declare-fun b!173079 () Bool)

(declare-fun e!120888 () Bool)

(assert (=> b!173079 (= e!120888 e!120889)))

(declare-fun res!143351 () Bool)

(assert (=> b!173079 (=> (not res!143351) (not e!120889))))

(assert (=> b!173079 (= res!143351 (= (size!4109 (buf!4537 (_2!8086 lt!266626))) (size!4109 (buf!4537 thiss!1187))))))

(declare-fun nBits!340 () (_ BitVec 32))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7326 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!14888)

(assert (=> b!173079 (= lt!266626 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(declare-fun b!173080 () Bool)

(assert (=> b!173080 (= e!120889 false)))

(declare-datatypes ((tuple2!14890 0))(
  ( (tuple2!14891 (_1!8087 BitStream!7326) (_2!8087 BitStream!7326)) )
))
(declare-fun lt!266627 () tuple2!14890)

(declare-fun reader!0 (BitStream!7326 BitStream!7326) tuple2!14890)

(assert (=> b!173080 (= lt!266627 (reader!0 thiss!1187 (_2!8086 lt!266626)))))

(declare-fun b!173081 () Bool)

(declare-fun e!120886 () Bool)

(declare-fun array_inv!3850 (array!9310) Bool)

(assert (=> b!173081 (= e!120886 (array_inv!3850 (buf!4537 thiss!1187)))))

(declare-fun b!173082 () Bool)

(declare-fun res!143353 () Bool)

(assert (=> b!173082 (=> (not res!143353) (not e!120888))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!173082 (= res!143353 (validate_offset_bits!1 ((_ sign_extend 32) (size!4109 (buf!4537 thiss!1187))) ((_ sign_extend 32) (currentByte!8624 thiss!1187)) ((_ sign_extend 32) (currentBit!8619 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun b!173083 () Bool)

(declare-fun res!143352 () Bool)

(assert (=> b!173083 (=> (not res!143352) (not e!120888))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!173083 (= res!143352 (invariant!0 (currentBit!8619 thiss!1187) (currentByte!8624 thiss!1187) (size!4109 (buf!4537 thiss!1187))))))

(declare-fun res!143350 () Bool)

(assert (=> start!38504 (=> (not res!143350) (not e!120888))))

(assert (=> start!38504 (= res!143350 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38504 e!120888))

(assert (=> start!38504 true))

(declare-fun inv!12 (BitStream!7326) Bool)

(assert (=> start!38504 (and (inv!12 thiss!1187) e!120886)))

(declare-fun b!173084 () Bool)

(declare-fun res!143355 () Bool)

(assert (=> b!173084 (=> (not res!143355) (not e!120889))))

(assert (=> b!173084 (= res!143355 (= (size!4109 (buf!4537 thiss!1187)) (size!4109 (buf!4537 (_2!8086 lt!266626)))))))

(declare-fun b!173085 () Bool)

(declare-fun res!143354 () Bool)

(assert (=> b!173085 (=> (not res!143354) (not e!120889))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!173085 (= res!143354 (= (bitIndex!0 (size!4109 (buf!4537 (_2!8086 lt!266626))) (currentByte!8624 (_2!8086 lt!266626)) (currentBit!8619 (_2!8086 lt!266626))) (bvadd (bitIndex!0 (size!4109 (buf!4537 thiss!1187)) (currentByte!8624 thiss!1187) (currentBit!8619 thiss!1187)) ((_ sign_extend 32) nBits!340))))))

(assert (= (and start!38504 res!143350) b!173082))

(assert (= (and b!173082 res!143353) b!173083))

(assert (= (and b!173083 res!143352) b!173079))

(assert (= (and b!173079 res!143351) b!173085))

(assert (= (and b!173085 res!143354) b!173084))

(assert (= (and b!173084 res!143355) b!173078))

(assert (= (and b!173078 res!143349) b!173080))

(assert (= start!38504 b!173081))

(declare-fun m!272205 () Bool)

(assert (=> b!173085 m!272205))

(declare-fun m!272207 () Bool)

(assert (=> b!173085 m!272207))

(declare-fun m!272209 () Bool)

(assert (=> start!38504 m!272209))

(declare-fun m!272211 () Bool)

(assert (=> b!173079 m!272211))

(declare-fun m!272213 () Bool)

(assert (=> b!173080 m!272213))

(declare-fun m!272215 () Bool)

(assert (=> b!173082 m!272215))

(declare-fun m!272217 () Bool)

(assert (=> b!173078 m!272217))

(declare-fun m!272219 () Bool)

(assert (=> b!173081 m!272219))

(declare-fun m!272221 () Bool)

(assert (=> b!173083 m!272221))

(check-sat (not b!173085) (not start!38504) (not b!173081) (not b!173082) (not b!173080) (not b!173083) (not b!173078) (not b!173079))
