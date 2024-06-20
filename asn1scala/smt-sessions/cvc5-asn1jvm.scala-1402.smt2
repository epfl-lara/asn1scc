; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38580 () Bool)

(assert start!38580)

(declare-fun b!173582 () Bool)

(declare-fun res!143769 () Bool)

(declare-fun e!121149 () Bool)

(assert (=> b!173582 (=> (not res!143769) (not e!121149))))

(declare-datatypes ((array!9335 0))(
  ( (array!9336 (arr!5050 (Array (_ BitVec 32) (_ BitVec 8))) (size!4120 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7348 0))(
  ( (BitStream!7349 (buf!4551 array!9335) (currentByte!8644 (_ BitVec 32)) (currentBit!8639 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7348)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!173582 (= res!143769 (invariant!0 (currentBit!8639 thiss!1187) (currentByte!8644 thiss!1187) (size!4120 (buf!4551 thiss!1187))))))

(declare-fun b!173583 () Bool)

(declare-fun e!121148 () Bool)

(assert (=> b!173583 (= e!121148 (not true))))

(declare-datatypes ((tuple2!14944 0))(
  ( (tuple2!14945 (_1!8114 BitStream!7348) (_2!8114 (_ BitVec 64))) )
))
(declare-fun lt!267479 () tuple2!14944)

(declare-datatypes ((tuple2!14946 0))(
  ( (tuple2!14947 (_1!8115 BitStream!7348) (_2!8115 BitStream!7348)) )
))
(declare-fun lt!267482 () tuple2!14946)

(declare-fun nBits!340 () (_ BitVec 32))

(declare-fun readNBitsLSBFirstPure!0 (BitStream!7348 (_ BitVec 32)) tuple2!14944)

(assert (=> b!173583 (= lt!267479 (readNBitsLSBFirstPure!0 (_1!8115 lt!267482) nBits!340))))

(declare-datatypes ((Unit!12445 0))(
  ( (Unit!12446) )
))
(declare-datatypes ((tuple2!14948 0))(
  ( (tuple2!14949 (_1!8116 Unit!12445) (_2!8116 BitStream!7348)) )
))
(declare-fun lt!267481 () tuple2!14948)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!173583 (validate_offset_bits!1 ((_ sign_extend 32) (size!4120 (buf!4551 (_2!8116 lt!267481)))) ((_ sign_extend 32) (currentByte!8644 thiss!1187)) ((_ sign_extend 32) (currentBit!8639 thiss!1187)) ((_ sign_extend 32) nBits!340))))

(declare-fun lt!267480 () Unit!12445)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7348 array!9335 (_ BitVec 64)) Unit!12445)

(assert (=> b!173583 (= lt!267480 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4551 (_2!8116 lt!267481)) ((_ sign_extend 32) nBits!340)))))

(declare-fun reader!0 (BitStream!7348 BitStream!7348) tuple2!14946)

(assert (=> b!173583 (= lt!267482 (reader!0 thiss!1187 (_2!8116 lt!267481)))))

(declare-fun b!173584 () Bool)

(assert (=> b!173584 (= e!121149 e!121148)))

(declare-fun res!143767 () Bool)

(assert (=> b!173584 (=> (not res!143767) (not e!121148))))

(assert (=> b!173584 (= res!143767 (= (size!4120 (buf!4551 (_2!8116 lt!267481))) (size!4120 (buf!4551 thiss!1187))))))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7348 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!14948)

(assert (=> b!173584 (= lt!267481 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(declare-fun res!143771 () Bool)

(assert (=> start!38580 (=> (not res!143771) (not e!121149))))

(assert (=> start!38580 (= res!143771 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38580 e!121149))

(assert (=> start!38580 true))

(declare-fun e!121147 () Bool)

(declare-fun inv!12 (BitStream!7348) Bool)

(assert (=> start!38580 (and (inv!12 thiss!1187) e!121147)))

(declare-fun b!173585 () Bool)

(declare-fun res!143772 () Bool)

(assert (=> b!173585 (=> (not res!143772) (not e!121148))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!173585 (= res!143772 (= (bitIndex!0 (size!4120 (buf!4551 (_2!8116 lt!267481))) (currentByte!8644 (_2!8116 lt!267481)) (currentBit!8639 (_2!8116 lt!267481))) (bvadd (bitIndex!0 (size!4120 (buf!4551 thiss!1187)) (currentByte!8644 thiss!1187) (currentBit!8639 thiss!1187)) ((_ sign_extend 32) nBits!340))))))

(declare-fun b!173586 () Bool)

(declare-fun res!143768 () Bool)

(assert (=> b!173586 (=> (not res!143768) (not e!121148))))

(assert (=> b!173586 (= res!143768 (= (size!4120 (buf!4551 thiss!1187)) (size!4120 (buf!4551 (_2!8116 lt!267481)))))))

(declare-fun b!173587 () Bool)

(declare-fun res!143766 () Bool)

(assert (=> b!173587 (=> (not res!143766) (not e!121149))))

(assert (=> b!173587 (= res!143766 (validate_offset_bits!1 ((_ sign_extend 32) (size!4120 (buf!4551 thiss!1187))) ((_ sign_extend 32) (currentByte!8644 thiss!1187)) ((_ sign_extend 32) (currentBit!8639 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun b!173588 () Bool)

(declare-fun res!143770 () Bool)

(assert (=> b!173588 (=> (not res!143770) (not e!121148))))

(declare-fun isPrefixOf!0 (BitStream!7348 BitStream!7348) Bool)

(assert (=> b!173588 (= res!143770 (isPrefixOf!0 thiss!1187 (_2!8116 lt!267481)))))

(declare-fun b!173589 () Bool)

(declare-fun array_inv!3861 (array!9335) Bool)

(assert (=> b!173589 (= e!121147 (array_inv!3861 (buf!4551 thiss!1187)))))

(assert (= (and start!38580 res!143771) b!173587))

(assert (= (and b!173587 res!143766) b!173582))

(assert (= (and b!173582 res!143769) b!173584))

(assert (= (and b!173584 res!143767) b!173585))

(assert (= (and b!173585 res!143772) b!173586))

(assert (= (and b!173586 res!143768) b!173588))

(assert (= (and b!173588 res!143770) b!173583))

(assert (= start!38580 b!173589))

(declare-fun m!272841 () Bool)

(assert (=> b!173587 m!272841))

(declare-fun m!272843 () Bool)

(assert (=> b!173582 m!272843))

(declare-fun m!272845 () Bool)

(assert (=> b!173584 m!272845))

(declare-fun m!272847 () Bool)

(assert (=> b!173588 m!272847))

(declare-fun m!272849 () Bool)

(assert (=> b!173589 m!272849))

(declare-fun m!272851 () Bool)

(assert (=> start!38580 m!272851))

(declare-fun m!272853 () Bool)

(assert (=> b!173585 m!272853))

(declare-fun m!272855 () Bool)

(assert (=> b!173585 m!272855))

(declare-fun m!272857 () Bool)

(assert (=> b!173583 m!272857))

(declare-fun m!272859 () Bool)

(assert (=> b!173583 m!272859))

(declare-fun m!272861 () Bool)

(assert (=> b!173583 m!272861))

(declare-fun m!272863 () Bool)

(assert (=> b!173583 m!272863))

(push 1)

(assert (not b!173584))

(assert (not b!173585))

(assert (not b!173588))

(assert (not start!38580))

(assert (not b!173589))

(assert (not b!173582))

(assert (not b!173583))

(assert (not b!173587))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

