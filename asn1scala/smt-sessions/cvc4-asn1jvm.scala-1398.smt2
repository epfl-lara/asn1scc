; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38506 () Bool)

(assert start!38506)

(declare-fun b!173102 () Bool)

(declare-fun res!143376 () Bool)

(declare-fun e!120900 () Bool)

(assert (=> b!173102 (=> (not res!143376) (not e!120900))))

(declare-datatypes ((array!9312 0))(
  ( (array!9313 (arr!5040 (Array (_ BitVec 32) (_ BitVec 8))) (size!4110 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7328 0))(
  ( (BitStream!7329 (buf!4538 array!9312) (currentByte!8625 (_ BitVec 32)) (currentBit!8620 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7328)

(declare-fun nBits!340 () (_ BitVec 32))

(declare-datatypes ((Unit!12389 0))(
  ( (Unit!12390) )
))
(declare-datatypes ((tuple2!14892 0))(
  ( (tuple2!14893 (_1!8088 Unit!12389) (_2!8088 BitStream!7328)) )
))
(declare-fun lt!266633 () tuple2!14892)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!173102 (= res!143376 (= (bitIndex!0 (size!4110 (buf!4538 (_2!8088 lt!266633))) (currentByte!8625 (_2!8088 lt!266633)) (currentBit!8620 (_2!8088 lt!266633))) (bvadd (bitIndex!0 (size!4110 (buf!4538 thiss!1187)) (currentByte!8625 thiss!1187) (currentBit!8620 thiss!1187)) ((_ sign_extend 32) nBits!340))))))

(declare-fun b!173103 () Bool)

(declare-fun res!143373 () Bool)

(declare-fun e!120899 () Bool)

(assert (=> b!173103 (=> (not res!143373) (not e!120899))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!173103 (= res!143373 (validate_offset_bits!1 ((_ sign_extend 32) (size!4110 (buf!4538 thiss!1187))) ((_ sign_extend 32) (currentByte!8625 thiss!1187)) ((_ sign_extend 32) (currentBit!8620 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun b!173104 () Bool)

(assert (=> b!173104 (= e!120899 e!120900)))

(declare-fun res!143371 () Bool)

(assert (=> b!173104 (=> (not res!143371) (not e!120900))))

(assert (=> b!173104 (= res!143371 (= (size!4110 (buf!4538 (_2!8088 lt!266633))) (size!4110 (buf!4538 thiss!1187))))))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7328 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!14892)

(assert (=> b!173104 (= lt!266633 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(declare-fun b!173105 () Bool)

(declare-fun res!143375 () Bool)

(assert (=> b!173105 (=> (not res!143375) (not e!120900))))

(assert (=> b!173105 (= res!143375 (= (size!4110 (buf!4538 thiss!1187)) (size!4110 (buf!4538 (_2!8088 lt!266633)))))))

(declare-fun b!173106 () Bool)

(declare-fun e!120901 () Bool)

(declare-fun array_inv!3851 (array!9312) Bool)

(assert (=> b!173106 (= e!120901 (array_inv!3851 (buf!4538 thiss!1187)))))

(declare-fun b!173107 () Bool)

(declare-fun res!143374 () Bool)

(assert (=> b!173107 (=> (not res!143374) (not e!120900))))

(declare-fun isPrefixOf!0 (BitStream!7328 BitStream!7328) Bool)

(assert (=> b!173107 (= res!143374 (isPrefixOf!0 thiss!1187 (_2!8088 lt!266633)))))

(declare-fun res!143372 () Bool)

(assert (=> start!38506 (=> (not res!143372) (not e!120899))))

(assert (=> start!38506 (= res!143372 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38506 e!120899))

(assert (=> start!38506 true))

(declare-fun inv!12 (BitStream!7328) Bool)

(assert (=> start!38506 (and (inv!12 thiss!1187) e!120901)))

(declare-fun b!173108 () Bool)

(assert (=> b!173108 (= e!120900 false)))

(declare-datatypes ((tuple2!14894 0))(
  ( (tuple2!14895 (_1!8089 BitStream!7328) (_2!8089 BitStream!7328)) )
))
(declare-fun lt!266632 () tuple2!14894)

(declare-fun reader!0 (BitStream!7328 BitStream!7328) tuple2!14894)

(assert (=> b!173108 (= lt!266632 (reader!0 thiss!1187 (_2!8088 lt!266633)))))

(declare-fun b!173109 () Bool)

(declare-fun res!143370 () Bool)

(assert (=> b!173109 (=> (not res!143370) (not e!120899))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!173109 (= res!143370 (invariant!0 (currentBit!8620 thiss!1187) (currentByte!8625 thiss!1187) (size!4110 (buf!4538 thiss!1187))))))

(assert (= (and start!38506 res!143372) b!173103))

(assert (= (and b!173103 res!143373) b!173109))

(assert (= (and b!173109 res!143370) b!173104))

(assert (= (and b!173104 res!143371) b!173102))

(assert (= (and b!173102 res!143376) b!173105))

(assert (= (and b!173105 res!143375) b!173107))

(assert (= (and b!173107 res!143374) b!173108))

(assert (= start!38506 b!173106))

(declare-fun m!272223 () Bool)

(assert (=> b!173109 m!272223))

(declare-fun m!272225 () Bool)

(assert (=> b!173102 m!272225))

(declare-fun m!272227 () Bool)

(assert (=> b!173102 m!272227))

(declare-fun m!272229 () Bool)

(assert (=> b!173106 m!272229))

(declare-fun m!272231 () Bool)

(assert (=> b!173107 m!272231))

(declare-fun m!272233 () Bool)

(assert (=> start!38506 m!272233))

(declare-fun m!272235 () Bool)

(assert (=> b!173103 m!272235))

(declare-fun m!272237 () Bool)

(assert (=> b!173104 m!272237))

(declare-fun m!272239 () Bool)

(assert (=> b!173108 m!272239))

(push 1)

(assert (not b!173109))

(assert (not b!173107))

(assert (not start!38506))

(assert (not b!173102))

(assert (not b!173103))

(assert (not b!173106))

(assert (not b!173104))

(assert (not b!173108))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

