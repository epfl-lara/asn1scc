; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38582 () Bool)

(assert start!38582)

(declare-fun b!173606 () Bool)

(declare-fun res!143788 () Bool)

(declare-fun e!121160 () Bool)

(assert (=> b!173606 (=> (not res!143788) (not e!121160))))

(declare-datatypes ((array!9337 0))(
  ( (array!9338 (arr!5051 (Array (_ BitVec 32) (_ BitVec 8))) (size!4121 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7350 0))(
  ( (BitStream!7351 (buf!4552 array!9337) (currentByte!8645 (_ BitVec 32)) (currentBit!8640 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7350)

(declare-fun nBits!340 () (_ BitVec 32))

(declare-datatypes ((Unit!12447 0))(
  ( (Unit!12448) )
))
(declare-datatypes ((tuple2!14950 0))(
  ( (tuple2!14951 (_1!8117 Unit!12447) (_2!8117 BitStream!7350)) )
))
(declare-fun lt!267491 () tuple2!14950)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!173606 (= res!143788 (= (bitIndex!0 (size!4121 (buf!4552 (_2!8117 lt!267491))) (currentByte!8645 (_2!8117 lt!267491)) (currentBit!8640 (_2!8117 lt!267491))) (bvadd (bitIndex!0 (size!4121 (buf!4552 thiss!1187)) (currentByte!8645 thiss!1187) (currentBit!8640 thiss!1187)) ((_ sign_extend 32) nBits!340))))))

(declare-fun res!143787 () Bool)

(declare-fun e!121159 () Bool)

(assert (=> start!38582 (=> (not res!143787) (not e!121159))))

(assert (=> start!38582 (= res!143787 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38582 e!121159))

(assert (=> start!38582 true))

(declare-fun e!121161 () Bool)

(declare-fun inv!12 (BitStream!7350) Bool)

(assert (=> start!38582 (and (inv!12 thiss!1187) e!121161)))

(declare-fun b!173607 () Bool)

(declare-fun res!143792 () Bool)

(assert (=> b!173607 (=> (not res!143792) (not e!121160))))

(assert (=> b!173607 (= res!143792 (= (size!4121 (buf!4552 thiss!1187)) (size!4121 (buf!4552 (_2!8117 lt!267491)))))))

(declare-fun b!173608 () Bool)

(declare-fun res!143791 () Bool)

(assert (=> b!173608 (=> (not res!143791) (not e!121159))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!173608 (= res!143791 (invariant!0 (currentBit!8640 thiss!1187) (currentByte!8645 thiss!1187) (size!4121 (buf!4552 thiss!1187))))))

(declare-fun b!173609 () Bool)

(assert (=> b!173609 (= e!121160 (not true))))

(declare-datatypes ((tuple2!14952 0))(
  ( (tuple2!14953 (_1!8118 BitStream!7350) (_2!8118 (_ BitVec 64))) )
))
(declare-fun lt!267494 () tuple2!14952)

(declare-datatypes ((tuple2!14954 0))(
  ( (tuple2!14955 (_1!8119 BitStream!7350) (_2!8119 BitStream!7350)) )
))
(declare-fun lt!267493 () tuple2!14954)

(declare-fun readNBitsLSBFirstPure!0 (BitStream!7350 (_ BitVec 32)) tuple2!14952)

(assert (=> b!173609 (= lt!267494 (readNBitsLSBFirstPure!0 (_1!8119 lt!267493) nBits!340))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!173609 (validate_offset_bits!1 ((_ sign_extend 32) (size!4121 (buf!4552 (_2!8117 lt!267491)))) ((_ sign_extend 32) (currentByte!8645 thiss!1187)) ((_ sign_extend 32) (currentBit!8640 thiss!1187)) ((_ sign_extend 32) nBits!340))))

(declare-fun lt!267492 () Unit!12447)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7350 array!9337 (_ BitVec 64)) Unit!12447)

(assert (=> b!173609 (= lt!267492 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4552 (_2!8117 lt!267491)) ((_ sign_extend 32) nBits!340)))))

(declare-fun reader!0 (BitStream!7350 BitStream!7350) tuple2!14954)

(assert (=> b!173609 (= lt!267493 (reader!0 thiss!1187 (_2!8117 lt!267491)))))

(declare-fun b!173610 () Bool)

(declare-fun res!143793 () Bool)

(assert (=> b!173610 (=> (not res!143793) (not e!121160))))

(declare-fun isPrefixOf!0 (BitStream!7350 BitStream!7350) Bool)

(assert (=> b!173610 (= res!143793 (isPrefixOf!0 thiss!1187 (_2!8117 lt!267491)))))

(declare-fun b!173611 () Bool)

(declare-fun array_inv!3862 (array!9337) Bool)

(assert (=> b!173611 (= e!121161 (array_inv!3862 (buf!4552 thiss!1187)))))

(declare-fun b!173612 () Bool)

(declare-fun res!143789 () Bool)

(assert (=> b!173612 (=> (not res!143789) (not e!121159))))

(assert (=> b!173612 (= res!143789 (validate_offset_bits!1 ((_ sign_extend 32) (size!4121 (buf!4552 thiss!1187))) ((_ sign_extend 32) (currentByte!8645 thiss!1187)) ((_ sign_extend 32) (currentBit!8640 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun b!173613 () Bool)

(assert (=> b!173613 (= e!121159 e!121160)))

(declare-fun res!143790 () Bool)

(assert (=> b!173613 (=> (not res!143790) (not e!121160))))

(assert (=> b!173613 (= res!143790 (= (size!4121 (buf!4552 (_2!8117 lt!267491))) (size!4121 (buf!4552 thiss!1187))))))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7350 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!14950)

(assert (=> b!173613 (= lt!267491 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(assert (= (and start!38582 res!143787) b!173612))

(assert (= (and b!173612 res!143789) b!173608))

(assert (= (and b!173608 res!143791) b!173613))

(assert (= (and b!173613 res!143790) b!173606))

(assert (= (and b!173606 res!143788) b!173607))

(assert (= (and b!173607 res!143792) b!173610))

(assert (= (and b!173610 res!143793) b!173609))

(assert (= start!38582 b!173611))

(declare-fun m!272865 () Bool)

(assert (=> b!173609 m!272865))

(declare-fun m!272867 () Bool)

(assert (=> b!173609 m!272867))

(declare-fun m!272869 () Bool)

(assert (=> b!173609 m!272869))

(declare-fun m!272871 () Bool)

(assert (=> b!173609 m!272871))

(declare-fun m!272873 () Bool)

(assert (=> b!173611 m!272873))

(declare-fun m!272875 () Bool)

(assert (=> b!173606 m!272875))

(declare-fun m!272877 () Bool)

(assert (=> b!173606 m!272877))

(declare-fun m!272879 () Bool)

(assert (=> b!173608 m!272879))

(declare-fun m!272881 () Bool)

(assert (=> b!173610 m!272881))

(declare-fun m!272883 () Bool)

(assert (=> b!173613 m!272883))

(declare-fun m!272885 () Bool)

(assert (=> b!173612 m!272885))

(declare-fun m!272887 () Bool)

(assert (=> start!38582 m!272887))

(check-sat (not start!38582) (not b!173611) (not b!173606) (not b!173613) (not b!173612) (not b!173608) (not b!173609) (not b!173610))
