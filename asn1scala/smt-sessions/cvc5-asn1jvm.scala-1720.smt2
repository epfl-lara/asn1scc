; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47498 () Bool)

(assert start!47498)

(declare-fun res!189950 () Bool)

(declare-fun e!154737 () Bool)

(assert (=> start!47498 (=> (not res!189950) (not e!154737))))

(declare-datatypes ((array!11321 0))(
  ( (array!11322 (arr!5929 (Array (_ BitVec 32) (_ BitVec 8))) (size!4966 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11321)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47498 (= res!189950 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4966 arr!308))))))

(assert (=> start!47498 e!154737))

(assert (=> start!47498 true))

(declare-fun array_inv!4707 (array!11321) Bool)

(assert (=> start!47498 (array_inv!4707 arr!308)))

(declare-datatypes ((BitStream!9028 0))(
  ( (BitStream!9029 (buf!5507 array!11321) (currentByte!10321 (_ BitVec 32)) (currentBit!10316 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9028)

(declare-fun e!154736 () Bool)

(declare-fun inv!12 (BitStream!9028) Bool)

(assert (=> start!47498 (and (inv!12 thiss!1870) e!154736)))

(declare-fun b!226376 () Bool)

(declare-fun lt!360242 () (_ BitVec 64))

(assert (=> b!226376 (= e!154737 (not (or (= lt!360242 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!360242) lt!360242)))))))

(declare-fun lt!360245 () (_ BitVec 32))

(assert (=> b!226376 (= lt!360242 ((_ sign_extend 32) lt!360245))))

(declare-datatypes ((tuple2!19406 0))(
  ( (tuple2!19407 (_1!10502 (_ BitVec 8)) (_2!10502 BitStream!9028)) )
))
(declare-fun lt!360243 () tuple2!19406)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!226376 (= (bitIndex!0 (size!4966 (buf!5507 (_2!10502 lt!360243))) (currentByte!10321 (_2!10502 lt!360243)) (currentBit!10316 (_2!10502 lt!360243))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!4966 (buf!5507 thiss!1870)) (currentByte!10321 thiss!1870) (currentBit!10316 thiss!1870))))))

(declare-datatypes ((Unit!16743 0))(
  ( (Unit!16744) )
))
(declare-datatypes ((tuple3!1314 0))(
  ( (tuple3!1315 (_1!10503 Unit!16743) (_2!10503 BitStream!9028) (_3!799 array!11321)) )
))
(declare-fun lt!360246 () tuple3!1314)

(declare-fun readByteArrayLoop!0 (BitStream!9028 array!11321 (_ BitVec 32) (_ BitVec 32)) tuple3!1314)

(assert (=> b!226376 (= lt!360246 (readByteArrayLoop!0 (_2!10502 lt!360243) (array!11322 (store (arr!5929 arr!308) i!761 (_1!10502 lt!360243)) (size!4966 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226376 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4966 (buf!5507 (_2!10502 lt!360243)))) ((_ sign_extend 32) (currentByte!10321 (_2!10502 lt!360243))) ((_ sign_extend 32) (currentBit!10316 (_2!10502 lt!360243))) lt!360245)))

(assert (=> b!226376 (= lt!360245 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!360244 () Unit!16743)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9028 BitStream!9028 (_ BitVec 64) (_ BitVec 32)) Unit!16743)

(assert (=> b!226376 (= lt!360244 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10502 lt!360243) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!9028) tuple2!19406)

(assert (=> b!226376 (= lt!360243 (readByte!0 thiss!1870))))

(declare-fun b!226374 () Bool)

(declare-fun res!189951 () Bool)

(assert (=> b!226374 (=> (not res!189951) (not e!154737))))

(assert (=> b!226374 (= res!189951 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4966 (buf!5507 thiss!1870))) ((_ sign_extend 32) (currentByte!10321 thiss!1870)) ((_ sign_extend 32) (currentBit!10316 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!226375 () Bool)

(declare-fun res!189952 () Bool)

(assert (=> b!226375 (=> (not res!189952) (not e!154737))))

(assert (=> b!226375 (= res!189952 (bvslt i!761 to!496))))

(declare-fun b!226377 () Bool)

(assert (=> b!226377 (= e!154736 (array_inv!4707 (buf!5507 thiss!1870)))))

(assert (= (and start!47498 res!189950) b!226374))

(assert (= (and b!226374 res!189951) b!226375))

(assert (= (and b!226375 res!189952) b!226376))

(assert (= start!47498 b!226377))

(declare-fun m!347719 () Bool)

(assert (=> start!47498 m!347719))

(declare-fun m!347721 () Bool)

(assert (=> start!47498 m!347721))

(declare-fun m!347723 () Bool)

(assert (=> b!226376 m!347723))

(declare-fun m!347725 () Bool)

(assert (=> b!226376 m!347725))

(declare-fun m!347727 () Bool)

(assert (=> b!226376 m!347727))

(declare-fun m!347729 () Bool)

(assert (=> b!226376 m!347729))

(declare-fun m!347731 () Bool)

(assert (=> b!226376 m!347731))

(declare-fun m!347733 () Bool)

(assert (=> b!226376 m!347733))

(declare-fun m!347735 () Bool)

(assert (=> b!226376 m!347735))

(declare-fun m!347737 () Bool)

(assert (=> b!226374 m!347737))

(declare-fun m!347739 () Bool)

(assert (=> b!226377 m!347739))

(push 1)

(assert (not start!47498))

(assert (not b!226377))

(assert (not b!226376))

(assert (not b!226374))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

