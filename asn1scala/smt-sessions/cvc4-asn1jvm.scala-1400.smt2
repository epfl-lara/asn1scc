; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38518 () Bool)

(assert start!38518)

(declare-fun b!173246 () Bool)

(declare-fun res!143498 () Bool)

(declare-fun e!120973 () Bool)

(assert (=> b!173246 (=> (not res!143498) (not e!120973))))

(declare-datatypes ((array!9324 0))(
  ( (array!9325 (arr!5046 (Array (_ BitVec 32) (_ BitVec 8))) (size!4116 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7340 0))(
  ( (BitStream!7341 (buf!4544 array!9324) (currentByte!8631 (_ BitVec 32)) (currentBit!8626 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7340)

(declare-fun nBits!340 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!173246 (= res!143498 (validate_offset_bits!1 ((_ sign_extend 32) (size!4116 (buf!4544 thiss!1187))) ((_ sign_extend 32) (currentByte!8631 thiss!1187)) ((_ sign_extend 32) (currentBit!8626 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun b!173247 () Bool)

(declare-fun res!143500 () Bool)

(declare-fun e!120970 () Bool)

(assert (=> b!173247 (=> (not res!143500) (not e!120970))))

(declare-datatypes ((Unit!12401 0))(
  ( (Unit!12402) )
))
(declare-datatypes ((tuple2!14916 0))(
  ( (tuple2!14917 (_1!8100 Unit!12401) (_2!8100 BitStream!7340)) )
))
(declare-fun lt!266678 () tuple2!14916)

(assert (=> b!173247 (= res!143500 (= (size!4116 (buf!4544 thiss!1187)) (size!4116 (buf!4544 (_2!8100 lt!266678)))))))

(declare-fun b!173248 () Bool)

(assert (=> b!173248 (= e!120973 e!120970)))

(declare-fun res!143499 () Bool)

(assert (=> b!173248 (=> (not res!143499) (not e!120970))))

(assert (=> b!173248 (= res!143499 (= (size!4116 (buf!4544 (_2!8100 lt!266678))) (size!4116 (buf!4544 thiss!1187))))))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7340 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!14916)

(assert (=> b!173248 (= lt!266678 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(declare-fun b!173249 () Bool)

(declare-fun res!143502 () Bool)

(assert (=> b!173249 (=> (not res!143502) (not e!120973))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!173249 (= res!143502 (invariant!0 (currentBit!8626 thiss!1187) (currentByte!8631 thiss!1187) (size!4116 (buf!4544 thiss!1187))))))

(declare-fun b!173250 () Bool)

(assert (=> b!173250 (= e!120970 (not true))))

(assert (=> b!173250 (validate_offset_bits!1 ((_ sign_extend 32) (size!4116 (buf!4544 (_2!8100 lt!266678)))) ((_ sign_extend 32) (currentByte!8631 thiss!1187)) ((_ sign_extend 32) (currentBit!8626 thiss!1187)) ((_ sign_extend 32) nBits!340))))

(declare-fun lt!266676 () Unit!12401)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7340 array!9324 (_ BitVec 64)) Unit!12401)

(assert (=> b!173250 (= lt!266676 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4544 (_2!8100 lt!266678)) ((_ sign_extend 32) nBits!340)))))

(declare-datatypes ((tuple2!14918 0))(
  ( (tuple2!14919 (_1!8101 BitStream!7340) (_2!8101 BitStream!7340)) )
))
(declare-fun lt!266677 () tuple2!14918)

(declare-fun reader!0 (BitStream!7340 BitStream!7340) tuple2!14918)

(assert (=> b!173250 (= lt!266677 (reader!0 thiss!1187 (_2!8100 lt!266678)))))

(declare-fun res!143501 () Bool)

(assert (=> start!38518 (=> (not res!143501) (not e!120973))))

(assert (=> start!38518 (= res!143501 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38518 e!120973))

(assert (=> start!38518 true))

(declare-fun e!120972 () Bool)

(declare-fun inv!12 (BitStream!7340) Bool)

(assert (=> start!38518 (and (inv!12 thiss!1187) e!120972)))

(declare-fun b!173251 () Bool)

(declare-fun res!143496 () Bool)

(assert (=> b!173251 (=> (not res!143496) (not e!120970))))

(declare-fun isPrefixOf!0 (BitStream!7340 BitStream!7340) Bool)

(assert (=> b!173251 (= res!143496 (isPrefixOf!0 thiss!1187 (_2!8100 lt!266678)))))

(declare-fun b!173252 () Bool)

(declare-fun res!143497 () Bool)

(assert (=> b!173252 (=> (not res!143497) (not e!120970))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!173252 (= res!143497 (= (bitIndex!0 (size!4116 (buf!4544 (_2!8100 lt!266678))) (currentByte!8631 (_2!8100 lt!266678)) (currentBit!8626 (_2!8100 lt!266678))) (bvadd (bitIndex!0 (size!4116 (buf!4544 thiss!1187)) (currentByte!8631 thiss!1187) (currentBit!8626 thiss!1187)) ((_ sign_extend 32) nBits!340))))))

(declare-fun b!173253 () Bool)

(declare-fun array_inv!3857 (array!9324) Bool)

(assert (=> b!173253 (= e!120972 (array_inv!3857 (buf!4544 thiss!1187)))))

(assert (= (and start!38518 res!143501) b!173246))

(assert (= (and b!173246 res!143498) b!173249))

(assert (= (and b!173249 res!143502) b!173248))

(assert (= (and b!173248 res!143499) b!173252))

(assert (= (and b!173252 res!143497) b!173247))

(assert (= (and b!173247 res!143500) b!173251))

(assert (= (and b!173251 res!143496) b!173250))

(assert (= start!38518 b!173253))

(declare-fun m!272339 () Bool)

(assert (=> b!173253 m!272339))

(declare-fun m!272341 () Bool)

(assert (=> b!173249 m!272341))

(declare-fun m!272343 () Bool)

(assert (=> b!173250 m!272343))

(declare-fun m!272345 () Bool)

(assert (=> b!173250 m!272345))

(declare-fun m!272347 () Bool)

(assert (=> b!173250 m!272347))

(declare-fun m!272349 () Bool)

(assert (=> b!173252 m!272349))

(declare-fun m!272351 () Bool)

(assert (=> b!173252 m!272351))

(declare-fun m!272353 () Bool)

(assert (=> start!38518 m!272353))

(declare-fun m!272355 () Bool)

(assert (=> b!173246 m!272355))

(declare-fun m!272357 () Bool)

(assert (=> b!173248 m!272357))

(declare-fun m!272359 () Bool)

(assert (=> b!173251 m!272359))

(push 1)

(assert (not b!173249))

(assert (not b!173246))

(assert (not start!38518))

(assert (not b!173252))

(assert (not b!173248))

(assert (not b!173253))

(assert (not b!173250))

(assert (not b!173251))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

