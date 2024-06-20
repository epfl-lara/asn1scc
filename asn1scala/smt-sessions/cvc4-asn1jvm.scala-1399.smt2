; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38512 () Bool)

(assert start!38512)

(declare-fun b!173174 () Bool)

(declare-fun e!120937 () Bool)

(assert (=> b!173174 (= e!120937 false)))

(declare-datatypes ((array!9318 0))(
  ( (array!9319 (arr!5043 (Array (_ BitVec 32) (_ BitVec 8))) (size!4113 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7334 0))(
  ( (BitStream!7335 (buf!4541 array!9318) (currentByte!8628 (_ BitVec 32)) (currentBit!8623 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!14904 0))(
  ( (tuple2!14905 (_1!8094 BitStream!7334) (_2!8094 BitStream!7334)) )
))
(declare-fun lt!266651 () tuple2!14904)

(declare-fun thiss!1187 () BitStream!7334)

(declare-datatypes ((Unit!12395 0))(
  ( (Unit!12396) )
))
(declare-datatypes ((tuple2!14906 0))(
  ( (tuple2!14907 (_1!8095 Unit!12395) (_2!8095 BitStream!7334)) )
))
(declare-fun lt!266650 () tuple2!14906)

(declare-fun reader!0 (BitStream!7334 BitStream!7334) tuple2!14904)

(assert (=> b!173174 (= lt!266651 (reader!0 thiss!1187 (_2!8095 lt!266650)))))

(declare-fun b!173175 () Bool)

(declare-fun e!120934 () Bool)

(assert (=> b!173175 (= e!120934 e!120937)))

(declare-fun res!143435 () Bool)

(assert (=> b!173175 (=> (not res!143435) (not e!120937))))

(assert (=> b!173175 (= res!143435 (= (size!4113 (buf!4541 (_2!8095 lt!266650))) (size!4113 (buf!4541 thiss!1187))))))

(declare-fun nBits!340 () (_ BitVec 32))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7334 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!14906)

(assert (=> b!173175 (= lt!266650 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(declare-fun b!173176 () Bool)

(declare-fun e!120936 () Bool)

(declare-fun array_inv!3854 (array!9318) Bool)

(assert (=> b!173176 (= e!120936 (array_inv!3854 (buf!4541 thiss!1187)))))

(declare-fun b!173177 () Bool)

(declare-fun res!143434 () Bool)

(assert (=> b!173177 (=> (not res!143434) (not e!120937))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!173177 (= res!143434 (= (bitIndex!0 (size!4113 (buf!4541 (_2!8095 lt!266650))) (currentByte!8628 (_2!8095 lt!266650)) (currentBit!8623 (_2!8095 lt!266650))) (bvadd (bitIndex!0 (size!4113 (buf!4541 thiss!1187)) (currentByte!8628 thiss!1187) (currentBit!8623 thiss!1187)) ((_ sign_extend 32) nBits!340))))))

(declare-fun res!143438 () Bool)

(assert (=> start!38512 (=> (not res!143438) (not e!120934))))

(assert (=> start!38512 (= res!143438 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38512 e!120934))

(assert (=> start!38512 true))

(declare-fun inv!12 (BitStream!7334) Bool)

(assert (=> start!38512 (and (inv!12 thiss!1187) e!120936)))

(declare-fun b!173178 () Bool)

(declare-fun res!143437 () Bool)

(assert (=> b!173178 (=> (not res!143437) (not e!120934))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!173178 (= res!143437 (validate_offset_bits!1 ((_ sign_extend 32) (size!4113 (buf!4541 thiss!1187))) ((_ sign_extend 32) (currentByte!8628 thiss!1187)) ((_ sign_extend 32) (currentBit!8623 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun b!173179 () Bool)

(declare-fun res!143439 () Bool)

(assert (=> b!173179 (=> (not res!143439) (not e!120937))))

(declare-fun isPrefixOf!0 (BitStream!7334 BitStream!7334) Bool)

(assert (=> b!173179 (= res!143439 (isPrefixOf!0 thiss!1187 (_2!8095 lt!266650)))))

(declare-fun b!173180 () Bool)

(declare-fun res!143433 () Bool)

(assert (=> b!173180 (=> (not res!143433) (not e!120937))))

(assert (=> b!173180 (= res!143433 (= (size!4113 (buf!4541 thiss!1187)) (size!4113 (buf!4541 (_2!8095 lt!266650)))))))

(declare-fun b!173181 () Bool)

(declare-fun res!143436 () Bool)

(assert (=> b!173181 (=> (not res!143436) (not e!120934))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!173181 (= res!143436 (invariant!0 (currentBit!8623 thiss!1187) (currentByte!8628 thiss!1187) (size!4113 (buf!4541 thiss!1187))))))

(assert (= (and start!38512 res!143438) b!173178))

(assert (= (and b!173178 res!143437) b!173181))

(assert (= (and b!173181 res!143436) b!173175))

(assert (= (and b!173175 res!143435) b!173177))

(assert (= (and b!173177 res!143434) b!173180))

(assert (= (and b!173180 res!143433) b!173179))

(assert (= (and b!173179 res!143439) b!173174))

(assert (= start!38512 b!173176))

(declare-fun m!272277 () Bool)

(assert (=> b!173179 m!272277))

(declare-fun m!272279 () Bool)

(assert (=> b!173174 m!272279))

(declare-fun m!272281 () Bool)

(assert (=> b!173178 m!272281))

(declare-fun m!272283 () Bool)

(assert (=> start!38512 m!272283))

(declare-fun m!272285 () Bool)

(assert (=> b!173175 m!272285))

(declare-fun m!272287 () Bool)

(assert (=> b!173177 m!272287))

(declare-fun m!272289 () Bool)

(assert (=> b!173177 m!272289))

(declare-fun m!272291 () Bool)

(assert (=> b!173181 m!272291))

(declare-fun m!272293 () Bool)

(assert (=> b!173176 m!272293))

(push 1)

(assert (not b!173178))

(assert (not start!38512))

(assert (not b!173177))

(assert (not b!173175))

(assert (not b!173179))

(assert (not b!173174))

(assert (not b!173176))

(assert (not b!173181))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

