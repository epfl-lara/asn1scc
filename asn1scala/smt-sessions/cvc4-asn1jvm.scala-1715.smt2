; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47388 () Bool)

(assert start!47388)

(declare-fun b!226033 () Bool)

(declare-fun res!189678 () Bool)

(declare-fun e!154452 () Bool)

(assert (=> b!226033 (=> (not res!189678) (not e!154452))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!226033 (= res!189678 (bvslt i!761 to!496))))

(declare-fun b!226032 () Bool)

(declare-fun res!189679 () Bool)

(assert (=> b!226032 (=> (not res!189679) (not e!154452))))

(declare-datatypes ((array!11289 0))(
  ( (array!11290 (arr!5910 (Array (_ BitVec 32) (_ BitVec 8))) (size!4953 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9002 0))(
  ( (BitStream!9003 (buf!5494 array!11289) (currentByte!10296 (_ BitVec 32)) (currentBit!10291 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9002)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226032 (= res!189679 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4953 (buf!5494 thiss!1870))) ((_ sign_extend 32) (currentByte!10296 thiss!1870)) ((_ sign_extend 32) (currentBit!10291 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!226034 () Bool)

(assert (=> b!226034 (= e!154452 (not (bvslt (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) (bvsub to!496 i!761))))))

(declare-datatypes ((tuple2!19356 0))(
  ( (tuple2!19357 (_1!10465 (_ BitVec 8)) (_2!10465 BitStream!9002)) )
))
(declare-fun lt!359133 () tuple2!19356)

(assert (=> b!226034 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4953 (buf!5494 (_2!10465 lt!359133)))) ((_ sign_extend 32) (currentByte!10296 (_2!10465 lt!359133))) ((_ sign_extend 32) (currentBit!10291 (_2!10465 lt!359133))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!16651 0))(
  ( (Unit!16652) )
))
(declare-fun lt!359132 () Unit!16651)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9002 BitStream!9002 (_ BitVec 64) (_ BitVec 32)) Unit!16651)

(assert (=> b!226034 (= lt!359132 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10465 lt!359133) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!9002) tuple2!19356)

(assert (=> b!226034 (= lt!359133 (readByte!0 thiss!1870))))

(declare-fun res!189677 () Bool)

(assert (=> start!47388 (=> (not res!189677) (not e!154452))))

(declare-fun arr!308 () array!11289)

(assert (=> start!47388 (= res!189677 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4953 arr!308))))))

(assert (=> start!47388 e!154452))

(assert (=> start!47388 true))

(declare-fun array_inv!4694 (array!11289) Bool)

(assert (=> start!47388 (array_inv!4694 arr!308)))

(declare-fun e!154451 () Bool)

(declare-fun inv!12 (BitStream!9002) Bool)

(assert (=> start!47388 (and (inv!12 thiss!1870) e!154451)))

(declare-fun b!226035 () Bool)

(assert (=> b!226035 (= e!154451 (array_inv!4694 (buf!5494 thiss!1870)))))

(assert (= (and start!47388 res!189677) b!226032))

(assert (= (and b!226032 res!189679) b!226033))

(assert (= (and b!226033 res!189678) b!226034))

(assert (= start!47388 b!226035))

(declare-fun m!347075 () Bool)

(assert (=> b!226032 m!347075))

(declare-fun m!347077 () Bool)

(assert (=> b!226034 m!347077))

(declare-fun m!347079 () Bool)

(assert (=> b!226034 m!347079))

(declare-fun m!347081 () Bool)

(assert (=> b!226034 m!347081))

(declare-fun m!347083 () Bool)

(assert (=> start!47388 m!347083))

(declare-fun m!347085 () Bool)

(assert (=> start!47388 m!347085))

(declare-fun m!347087 () Bool)

(assert (=> b!226035 m!347087))

(push 1)

(assert (not b!226035))

(assert (not b!226032))

(assert (not b!226034))

(assert (not start!47388))

(check-sat)

(pop 1)

(push 1)

(check-sat)

