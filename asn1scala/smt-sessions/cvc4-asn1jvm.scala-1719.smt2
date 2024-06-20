; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47496 () Bool)

(assert start!47496)

(declare-fun res!189943 () Bool)

(declare-fun e!154724 () Bool)

(assert (=> start!47496 (=> (not res!189943) (not e!154724))))

(declare-datatypes ((array!11319 0))(
  ( (array!11320 (arr!5928 (Array (_ BitVec 32) (_ BitVec 8))) (size!4965 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11319)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47496 (= res!189943 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4965 arr!308))))))

(assert (=> start!47496 e!154724))

(assert (=> start!47496 true))

(declare-fun array_inv!4706 (array!11319) Bool)

(assert (=> start!47496 (array_inv!4706 arr!308)))

(declare-datatypes ((BitStream!9026 0))(
  ( (BitStream!9027 (buf!5506 array!11319) (currentByte!10320 (_ BitVec 32)) (currentBit!10315 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9026)

(declare-fun e!154725 () Bool)

(declare-fun inv!12 (BitStream!9026) Bool)

(assert (=> start!47496 (and (inv!12 thiss!1870) e!154725)))

(declare-fun b!226365 () Bool)

(assert (=> b!226365 (= e!154725 (array_inv!4706 (buf!5506 thiss!1870)))))

(declare-fun b!226362 () Bool)

(declare-fun res!189941 () Bool)

(assert (=> b!226362 (=> (not res!189941) (not e!154724))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226362 (= res!189941 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4965 (buf!5506 thiss!1870))) ((_ sign_extend 32) (currentByte!10320 thiss!1870)) ((_ sign_extend 32) (currentBit!10315 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!226363 () Bool)

(declare-fun res!189942 () Bool)

(assert (=> b!226363 (=> (not res!189942) (not e!154724))))

(assert (=> b!226363 (= res!189942 (bvslt i!761 to!496))))

(declare-fun b!226364 () Bool)

(declare-fun lt!360230 () (_ BitVec 32))

(declare-fun lt!360228 () (_ BitVec 32))

(assert (=> b!226364 (= e!154724 (not (or (= lt!360230 #b00000000000000000000000000000000) (= lt!360230 (bvand lt!360228 #b10000000000000000000000000000000)))))))

(assert (=> b!226364 (= lt!360230 (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000))))

(declare-datatypes ((tuple2!19404 0))(
  ( (tuple2!19405 (_1!10500 (_ BitVec 8)) (_2!10500 BitStream!9026)) )
))
(declare-fun lt!360227 () tuple2!19404)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!226364 (= (bitIndex!0 (size!4965 (buf!5506 (_2!10500 lt!360227))) (currentByte!10320 (_2!10500 lt!360227)) (currentBit!10315 (_2!10500 lt!360227))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!4965 (buf!5506 thiss!1870)) (currentByte!10320 thiss!1870) (currentBit!10315 thiss!1870))))))

(declare-datatypes ((Unit!16741 0))(
  ( (Unit!16742) )
))
(declare-datatypes ((tuple3!1312 0))(
  ( (tuple3!1313 (_1!10501 Unit!16741) (_2!10501 BitStream!9026) (_3!798 array!11319)) )
))
(declare-fun lt!360231 () tuple3!1312)

(declare-fun readByteArrayLoop!0 (BitStream!9026 array!11319 (_ BitVec 32) (_ BitVec 32)) tuple3!1312)

(assert (=> b!226364 (= lt!360231 (readByteArrayLoop!0 (_2!10500 lt!360227) (array!11320 (store (arr!5928 arr!308) i!761 (_1!10500 lt!360227)) (size!4965 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!226364 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4965 (buf!5506 (_2!10500 lt!360227)))) ((_ sign_extend 32) (currentByte!10320 (_2!10500 lt!360227))) ((_ sign_extend 32) (currentBit!10315 (_2!10500 lt!360227))) lt!360228)))

(assert (=> b!226364 (= lt!360228 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!360229 () Unit!16741)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9026 BitStream!9026 (_ BitVec 64) (_ BitVec 32)) Unit!16741)

(assert (=> b!226364 (= lt!360229 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10500 lt!360227) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!9026) tuple2!19404)

(assert (=> b!226364 (= lt!360227 (readByte!0 thiss!1870))))

(assert (= (and start!47496 res!189943) b!226362))

(assert (= (and b!226362 res!189941) b!226363))

(assert (= (and b!226363 res!189942) b!226364))

(assert (= start!47496 b!226365))

(declare-fun m!347697 () Bool)

(assert (=> start!47496 m!347697))

(declare-fun m!347699 () Bool)

(assert (=> start!47496 m!347699))

(declare-fun m!347701 () Bool)

(assert (=> b!226365 m!347701))

(declare-fun m!347703 () Bool)

(assert (=> b!226362 m!347703))

(declare-fun m!347705 () Bool)

(assert (=> b!226364 m!347705))

(declare-fun m!347707 () Bool)

(assert (=> b!226364 m!347707))

(declare-fun m!347709 () Bool)

(assert (=> b!226364 m!347709))

(declare-fun m!347711 () Bool)

(assert (=> b!226364 m!347711))

(declare-fun m!347713 () Bool)

(assert (=> b!226364 m!347713))

(declare-fun m!347715 () Bool)

(assert (=> b!226364 m!347715))

(declare-fun m!347717 () Bool)

(assert (=> b!226364 m!347717))

(push 1)

(assert (not b!226365))

(assert (not start!47496))

(assert (not b!226364))

(assert (not b!226362))

(check-sat)

(pop 1)

(push 1)

(check-sat)

