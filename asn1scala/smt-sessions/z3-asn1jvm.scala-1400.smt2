; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38516 () Bool)

(assert start!38516)

(declare-fun b!173222 () Bool)

(declare-fun e!120961 () Bool)

(assert (=> b!173222 (= e!120961 (not true))))

(declare-datatypes ((array!9322 0))(
  ( (array!9323 (arr!5045 (Array (_ BitVec 32) (_ BitVec 8))) (size!4115 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7338 0))(
  ( (BitStream!7339 (buf!4543 array!9322) (currentByte!8630 (_ BitVec 32)) (currentBit!8625 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!12399 0))(
  ( (Unit!12400) )
))
(declare-datatypes ((tuple2!14912 0))(
  ( (tuple2!14913 (_1!8098 Unit!12399) (_2!8098 BitStream!7338)) )
))
(declare-fun lt!266669 () tuple2!14912)

(declare-fun thiss!1187 () BitStream!7338)

(declare-fun nBits!340 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!173222 (validate_offset_bits!1 ((_ sign_extend 32) (size!4115 (buf!4543 (_2!8098 lt!266669)))) ((_ sign_extend 32) (currentByte!8630 thiss!1187)) ((_ sign_extend 32) (currentBit!8625 thiss!1187)) ((_ sign_extend 32) nBits!340))))

(declare-fun lt!266667 () Unit!12399)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7338 array!9322 (_ BitVec 64)) Unit!12399)

(assert (=> b!173222 (= lt!266667 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4543 (_2!8098 lt!266669)) ((_ sign_extend 32) nBits!340)))))

(declare-datatypes ((tuple2!14914 0))(
  ( (tuple2!14915 (_1!8099 BitStream!7338) (_2!8099 BitStream!7338)) )
))
(declare-fun lt!266668 () tuple2!14914)

(declare-fun reader!0 (BitStream!7338 BitStream!7338) tuple2!14914)

(assert (=> b!173222 (= lt!266668 (reader!0 thiss!1187 (_2!8098 lt!266669)))))

(declare-fun b!173223 () Bool)

(declare-fun res!143481 () Bool)

(assert (=> b!173223 (=> (not res!143481) (not e!120961))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!173223 (= res!143481 (= (bitIndex!0 (size!4115 (buf!4543 (_2!8098 lt!266669))) (currentByte!8630 (_2!8098 lt!266669)) (currentBit!8625 (_2!8098 lt!266669))) (bvadd (bitIndex!0 (size!4115 (buf!4543 thiss!1187)) (currentByte!8630 thiss!1187) (currentBit!8625 thiss!1187)) ((_ sign_extend 32) nBits!340))))))

(declare-fun b!173224 () Bool)

(declare-fun res!143480 () Bool)

(assert (=> b!173224 (=> (not res!143480) (not e!120961))))

(declare-fun isPrefixOf!0 (BitStream!7338 BitStream!7338) Bool)

(assert (=> b!173224 (= res!143480 (isPrefixOf!0 thiss!1187 (_2!8098 lt!266669)))))

(declare-fun b!173225 () Bool)

(declare-fun res!143478 () Bool)

(declare-fun e!120960 () Bool)

(assert (=> b!173225 (=> (not res!143478) (not e!120960))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!173225 (= res!143478 (invariant!0 (currentBit!8625 thiss!1187) (currentByte!8630 thiss!1187) (size!4115 (buf!4543 thiss!1187))))))

(declare-fun res!143479 () Bool)

(assert (=> start!38516 (=> (not res!143479) (not e!120960))))

(assert (=> start!38516 (= res!143479 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38516 e!120960))

(assert (=> start!38516 true))

(declare-fun e!120959 () Bool)

(declare-fun inv!12 (BitStream!7338) Bool)

(assert (=> start!38516 (and (inv!12 thiss!1187) e!120959)))

(declare-fun b!173226 () Bool)

(declare-fun res!143476 () Bool)

(assert (=> b!173226 (=> (not res!143476) (not e!120961))))

(assert (=> b!173226 (= res!143476 (= (size!4115 (buf!4543 thiss!1187)) (size!4115 (buf!4543 (_2!8098 lt!266669)))))))

(declare-fun b!173227 () Bool)

(declare-fun res!143477 () Bool)

(assert (=> b!173227 (=> (not res!143477) (not e!120960))))

(assert (=> b!173227 (= res!143477 (validate_offset_bits!1 ((_ sign_extend 32) (size!4115 (buf!4543 thiss!1187))) ((_ sign_extend 32) (currentByte!8630 thiss!1187)) ((_ sign_extend 32) (currentBit!8625 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun b!173228 () Bool)

(assert (=> b!173228 (= e!120960 e!120961)))

(declare-fun res!143475 () Bool)

(assert (=> b!173228 (=> (not res!143475) (not e!120961))))

(assert (=> b!173228 (= res!143475 (= (size!4115 (buf!4543 (_2!8098 lt!266669))) (size!4115 (buf!4543 thiss!1187))))))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7338 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!14912)

(assert (=> b!173228 (= lt!266669 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(declare-fun b!173229 () Bool)

(declare-fun array_inv!3856 (array!9322) Bool)

(assert (=> b!173229 (= e!120959 (array_inv!3856 (buf!4543 thiss!1187)))))

(assert (= (and start!38516 res!143479) b!173227))

(assert (= (and b!173227 res!143477) b!173225))

(assert (= (and b!173225 res!143478) b!173228))

(assert (= (and b!173228 res!143475) b!173223))

(assert (= (and b!173223 res!143481) b!173226))

(assert (= (and b!173226 res!143476) b!173224))

(assert (= (and b!173224 res!143480) b!173222))

(assert (= start!38516 b!173229))

(declare-fun m!272317 () Bool)

(assert (=> b!173225 m!272317))

(declare-fun m!272319 () Bool)

(assert (=> b!173224 m!272319))

(declare-fun m!272321 () Bool)

(assert (=> b!173228 m!272321))

(declare-fun m!272323 () Bool)

(assert (=> b!173229 m!272323))

(declare-fun m!272325 () Bool)

(assert (=> b!173222 m!272325))

(declare-fun m!272327 () Bool)

(assert (=> b!173222 m!272327))

(declare-fun m!272329 () Bool)

(assert (=> b!173222 m!272329))

(declare-fun m!272331 () Bool)

(assert (=> b!173223 m!272331))

(declare-fun m!272333 () Bool)

(assert (=> b!173223 m!272333))

(declare-fun m!272335 () Bool)

(assert (=> start!38516 m!272335))

(declare-fun m!272337 () Bool)

(assert (=> b!173227 m!272337))

(check-sat (not b!173229) (not b!173228) (not start!38516) (not b!173227) (not b!173223) (not b!173225) (not b!173222) (not b!173224))
