; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38510 () Bool)

(assert start!38510)

(declare-fun b!173150 () Bool)

(declare-fun e!120924 () Bool)

(declare-fun e!120923 () Bool)

(assert (=> b!173150 (= e!120924 e!120923)))

(declare-fun res!143413 () Bool)

(assert (=> b!173150 (=> (not res!143413) (not e!120923))))

(declare-datatypes ((array!9316 0))(
  ( (array!9317 (arr!5042 (Array (_ BitVec 32) (_ BitVec 8))) (size!4112 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7332 0))(
  ( (BitStream!7333 (buf!4540 array!9316) (currentByte!8627 (_ BitVec 32)) (currentBit!8622 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!12393 0))(
  ( (Unit!12394) )
))
(declare-datatypes ((tuple2!14900 0))(
  ( (tuple2!14901 (_1!8092 Unit!12393) (_2!8092 BitStream!7332)) )
))
(declare-fun lt!266645 () tuple2!14900)

(declare-fun thiss!1187 () BitStream!7332)

(assert (=> b!173150 (= res!143413 (= (size!4112 (buf!4540 (_2!8092 lt!266645))) (size!4112 (buf!4540 thiss!1187))))))

(declare-fun nBits!340 () (_ BitVec 32))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7332 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!14900)

(assert (=> b!173150 (= lt!266645 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(declare-fun b!173151 () Bool)

(declare-fun e!120922 () Bool)

(declare-fun array_inv!3853 (array!9316) Bool)

(assert (=> b!173151 (= e!120922 (array_inv!3853 (buf!4540 thiss!1187)))))

(declare-fun b!173152 () Bool)

(declare-fun res!143416 () Bool)

(assert (=> b!173152 (=> (not res!143416) (not e!120923))))

(assert (=> b!173152 (= res!143416 (= (size!4112 (buf!4540 thiss!1187)) (size!4112 (buf!4540 (_2!8092 lt!266645)))))))

(declare-fun b!173153 () Bool)

(declare-fun res!143412 () Bool)

(assert (=> b!173153 (=> (not res!143412) (not e!120924))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!173153 (= res!143412 (invariant!0 (currentBit!8622 thiss!1187) (currentByte!8627 thiss!1187) (size!4112 (buf!4540 thiss!1187))))))

(declare-fun b!173154 () Bool)

(declare-fun res!143417 () Bool)

(assert (=> b!173154 (=> (not res!143417) (not e!120924))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!173154 (= res!143417 (validate_offset_bits!1 ((_ sign_extend 32) (size!4112 (buf!4540 thiss!1187))) ((_ sign_extend 32) (currentByte!8627 thiss!1187)) ((_ sign_extend 32) (currentBit!8622 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun res!143418 () Bool)

(assert (=> start!38510 (=> (not res!143418) (not e!120924))))

(assert (=> start!38510 (= res!143418 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38510 e!120924))

(assert (=> start!38510 true))

(declare-fun inv!12 (BitStream!7332) Bool)

(assert (=> start!38510 (and (inv!12 thiss!1187) e!120922)))

(declare-fun b!173155 () Bool)

(declare-fun res!143415 () Bool)

(assert (=> b!173155 (=> (not res!143415) (not e!120923))))

(declare-fun isPrefixOf!0 (BitStream!7332 BitStream!7332) Bool)

(assert (=> b!173155 (= res!143415 (isPrefixOf!0 thiss!1187 (_2!8092 lt!266645)))))

(declare-fun b!173156 () Bool)

(assert (=> b!173156 (= e!120923 false)))

(declare-datatypes ((tuple2!14902 0))(
  ( (tuple2!14903 (_1!8093 BitStream!7332) (_2!8093 BitStream!7332)) )
))
(declare-fun lt!266644 () tuple2!14902)

(declare-fun reader!0 (BitStream!7332 BitStream!7332) tuple2!14902)

(assert (=> b!173156 (= lt!266644 (reader!0 thiss!1187 (_2!8092 lt!266645)))))

(declare-fun b!173157 () Bool)

(declare-fun res!143414 () Bool)

(assert (=> b!173157 (=> (not res!143414) (not e!120923))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!173157 (= res!143414 (= (bitIndex!0 (size!4112 (buf!4540 (_2!8092 lt!266645))) (currentByte!8627 (_2!8092 lt!266645)) (currentBit!8622 (_2!8092 lt!266645))) (bvadd (bitIndex!0 (size!4112 (buf!4540 thiss!1187)) (currentByte!8627 thiss!1187) (currentBit!8622 thiss!1187)) ((_ sign_extend 32) nBits!340))))))

(assert (= (and start!38510 res!143418) b!173154))

(assert (= (and b!173154 res!143417) b!173153))

(assert (= (and b!173153 res!143412) b!173150))

(assert (= (and b!173150 res!143413) b!173157))

(assert (= (and b!173157 res!143414) b!173152))

(assert (= (and b!173152 res!143416) b!173155))

(assert (= (and b!173155 res!143415) b!173156))

(assert (= start!38510 b!173151))

(declare-fun m!272259 () Bool)

(assert (=> b!173155 m!272259))

(declare-fun m!272261 () Bool)

(assert (=> b!173153 m!272261))

(declare-fun m!272263 () Bool)

(assert (=> b!173150 m!272263))

(declare-fun m!272265 () Bool)

(assert (=> b!173154 m!272265))

(declare-fun m!272267 () Bool)

(assert (=> start!38510 m!272267))

(declare-fun m!272269 () Bool)

(assert (=> b!173157 m!272269))

(declare-fun m!272271 () Bool)

(assert (=> b!173157 m!272271))

(declare-fun m!272273 () Bool)

(assert (=> b!173156 m!272273))

(declare-fun m!272275 () Bool)

(assert (=> b!173151 m!272275))

(check-sat (not b!173157) (not b!173155) (not b!173153) (not b!173150) (not b!173151) (not start!38510) (not b!173156) (not b!173154))
