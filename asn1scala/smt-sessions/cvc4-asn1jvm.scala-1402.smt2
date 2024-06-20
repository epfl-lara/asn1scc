; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38584 () Bool)

(assert start!38584)

(declare-fun b!173630 () Bool)

(declare-fun res!143811 () Bool)

(declare-fun e!121172 () Bool)

(assert (=> b!173630 (=> (not res!143811) (not e!121172))))

(declare-datatypes ((array!9339 0))(
  ( (array!9340 (arr!5052 (Array (_ BitVec 32) (_ BitVec 8))) (size!4122 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7352 0))(
  ( (BitStream!7353 (buf!4553 array!9339) (currentByte!8646 (_ BitVec 32)) (currentBit!8641 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7352)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!173630 (= res!143811 (invariant!0 (currentBit!8641 thiss!1187) (currentByte!8646 thiss!1187) (size!4122 (buf!4553 thiss!1187))))))

(declare-fun b!173631 () Bool)

(declare-fun res!143812 () Bool)

(declare-fun e!121171 () Bool)

(assert (=> b!173631 (=> (not res!143812) (not e!121171))))

(declare-datatypes ((Unit!12449 0))(
  ( (Unit!12450) )
))
(declare-datatypes ((tuple2!14956 0))(
  ( (tuple2!14957 (_1!8120 Unit!12449) (_2!8120 BitStream!7352)) )
))
(declare-fun lt!267506 () tuple2!14956)

(declare-fun isPrefixOf!0 (BitStream!7352 BitStream!7352) Bool)

(assert (=> b!173631 (= res!143812 (isPrefixOf!0 thiss!1187 (_2!8120 lt!267506)))))

(declare-fun b!173633 () Bool)

(declare-fun res!143808 () Bool)

(assert (=> b!173633 (=> (not res!143808) (not e!121171))))

(assert (=> b!173633 (= res!143808 (= (size!4122 (buf!4553 thiss!1187)) (size!4122 (buf!4553 (_2!8120 lt!267506)))))))

(declare-fun b!173634 () Bool)

(assert (=> b!173634 (= e!121171 (not true))))

(declare-datatypes ((tuple2!14958 0))(
  ( (tuple2!14959 (_1!8121 BitStream!7352) (_2!8121 (_ BitVec 64))) )
))
(declare-fun lt!267504 () tuple2!14958)

(declare-datatypes ((tuple2!14960 0))(
  ( (tuple2!14961 (_1!8122 BitStream!7352) (_2!8122 BitStream!7352)) )
))
(declare-fun lt!267503 () tuple2!14960)

(declare-fun nBits!340 () (_ BitVec 32))

(declare-fun readNBitsLSBFirstPure!0 (BitStream!7352 (_ BitVec 32)) tuple2!14958)

(assert (=> b!173634 (= lt!267504 (readNBitsLSBFirstPure!0 (_1!8122 lt!267503) nBits!340))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!173634 (validate_offset_bits!1 ((_ sign_extend 32) (size!4122 (buf!4553 (_2!8120 lt!267506)))) ((_ sign_extend 32) (currentByte!8646 thiss!1187)) ((_ sign_extend 32) (currentBit!8641 thiss!1187)) ((_ sign_extend 32) nBits!340))))

(declare-fun lt!267505 () Unit!12449)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7352 array!9339 (_ BitVec 64)) Unit!12449)

(assert (=> b!173634 (= lt!267505 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4553 (_2!8120 lt!267506)) ((_ sign_extend 32) nBits!340)))))

(declare-fun reader!0 (BitStream!7352 BitStream!7352) tuple2!14960)

(assert (=> b!173634 (= lt!267503 (reader!0 thiss!1187 (_2!8120 lt!267506)))))

(declare-fun b!173635 () Bool)

(assert (=> b!173635 (= e!121172 e!121171)))

(declare-fun res!143814 () Bool)

(assert (=> b!173635 (=> (not res!143814) (not e!121171))))

(assert (=> b!173635 (= res!143814 (= (size!4122 (buf!4553 (_2!8120 lt!267506))) (size!4122 (buf!4553 thiss!1187))))))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7352 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!14956)

(assert (=> b!173635 (= lt!267506 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(declare-fun b!173632 () Bool)

(declare-fun res!143810 () Bool)

(assert (=> b!173632 (=> (not res!143810) (not e!121171))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!173632 (= res!143810 (= (bitIndex!0 (size!4122 (buf!4553 (_2!8120 lt!267506))) (currentByte!8646 (_2!8120 lt!267506)) (currentBit!8641 (_2!8120 lt!267506))) (bvadd (bitIndex!0 (size!4122 (buf!4553 thiss!1187)) (currentByte!8646 thiss!1187) (currentBit!8641 thiss!1187)) ((_ sign_extend 32) nBits!340))))))

(declare-fun res!143813 () Bool)

(assert (=> start!38584 (=> (not res!143813) (not e!121172))))

(assert (=> start!38584 (= res!143813 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38584 e!121172))

(assert (=> start!38584 true))

(declare-fun e!121173 () Bool)

(declare-fun inv!12 (BitStream!7352) Bool)

(assert (=> start!38584 (and (inv!12 thiss!1187) e!121173)))

(declare-fun b!173636 () Bool)

(declare-fun array_inv!3863 (array!9339) Bool)

(assert (=> b!173636 (= e!121173 (array_inv!3863 (buf!4553 thiss!1187)))))

(declare-fun b!173637 () Bool)

(declare-fun res!143809 () Bool)

(assert (=> b!173637 (=> (not res!143809) (not e!121172))))

(assert (=> b!173637 (= res!143809 (validate_offset_bits!1 ((_ sign_extend 32) (size!4122 (buf!4553 thiss!1187))) ((_ sign_extend 32) (currentByte!8646 thiss!1187)) ((_ sign_extend 32) (currentBit!8641 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(assert (= (and start!38584 res!143813) b!173637))

(assert (= (and b!173637 res!143809) b!173630))

(assert (= (and b!173630 res!143811) b!173635))

(assert (= (and b!173635 res!143814) b!173632))

(assert (= (and b!173632 res!143810) b!173633))

(assert (= (and b!173633 res!143808) b!173631))

(assert (= (and b!173631 res!143812) b!173634))

(assert (= start!38584 b!173636))

(declare-fun m!272889 () Bool)

(assert (=> b!173634 m!272889))

(declare-fun m!272891 () Bool)

(assert (=> b!173634 m!272891))

(declare-fun m!272893 () Bool)

(assert (=> b!173634 m!272893))

(declare-fun m!272895 () Bool)

(assert (=> b!173634 m!272895))

(declare-fun m!272897 () Bool)

(assert (=> b!173632 m!272897))

(declare-fun m!272899 () Bool)

(assert (=> b!173632 m!272899))

(declare-fun m!272901 () Bool)

(assert (=> b!173637 m!272901))

(declare-fun m!272903 () Bool)

(assert (=> b!173636 m!272903))

(declare-fun m!272905 () Bool)

(assert (=> b!173630 m!272905))

(declare-fun m!272907 () Bool)

(assert (=> start!38584 m!272907))

(declare-fun m!272909 () Bool)

(assert (=> b!173631 m!272909))

(declare-fun m!272911 () Bool)

(assert (=> b!173635 m!272911))

(push 1)

(assert (not b!173635))

(assert (not b!173634))

(assert (not b!173636))

