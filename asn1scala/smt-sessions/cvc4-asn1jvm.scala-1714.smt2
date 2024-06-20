; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47382 () Bool)

(assert start!47382)

(declare-fun res!189652 () Bool)

(declare-fun e!154416 () Bool)

(assert (=> start!47382 (=> (not res!189652) (not e!154416))))

(declare-datatypes ((array!11283 0))(
  ( (array!11284 (arr!5907 (Array (_ BitVec 32) (_ BitVec 8))) (size!4950 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11283)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47382 (= res!189652 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4950 arr!308))))))

(assert (=> start!47382 e!154416))

(assert (=> start!47382 true))

(declare-fun array_inv!4691 (array!11283) Bool)

(assert (=> start!47382 (array_inv!4691 arr!308)))

(declare-datatypes ((BitStream!8996 0))(
  ( (BitStream!8997 (buf!5491 array!11283) (currentByte!10293 (_ BitVec 32)) (currentBit!10288 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8996)

(declare-fun e!154414 () Bool)

(declare-fun inv!12 (BitStream!8996) Bool)

(assert (=> start!47382 (and (inv!12 thiss!1870) e!154414)))

(declare-fun b!225996 () Bool)

(declare-fun res!189650 () Bool)

(assert (=> b!225996 (=> (not res!189650) (not e!154416))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225996 (= res!189650 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4950 (buf!5491 thiss!1870))) ((_ sign_extend 32) (currentByte!10293 thiss!1870)) ((_ sign_extend 32) (currentBit!10288 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!225999 () Bool)

(assert (=> b!225999 (= e!154414 (array_inv!4691 (buf!5491 thiss!1870)))))

(declare-fun b!225998 () Bool)

(assert (=> b!225998 (= e!154416 (not (or (not (= (bvand i!761 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (= (bvand i!761 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!19350 0))(
  ( (tuple2!19351 (_1!10462 (_ BitVec 8)) (_2!10462 BitStream!8996)) )
))
(declare-fun lt!359115 () tuple2!19350)

(assert (=> b!225998 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4950 (buf!5491 (_2!10462 lt!359115)))) ((_ sign_extend 32) (currentByte!10293 (_2!10462 lt!359115))) ((_ sign_extend 32) (currentBit!10288 (_2!10462 lt!359115))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!16645 0))(
  ( (Unit!16646) )
))
(declare-fun lt!359114 () Unit!16645)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8996 BitStream!8996 (_ BitVec 64) (_ BitVec 32)) Unit!16645)

(assert (=> b!225998 (= lt!359114 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10462 lt!359115) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!8996) tuple2!19350)

(assert (=> b!225998 (= lt!359115 (readByte!0 thiss!1870))))

(declare-fun b!225997 () Bool)

(declare-fun res!189651 () Bool)

(assert (=> b!225997 (=> (not res!189651) (not e!154416))))

(assert (=> b!225997 (= res!189651 (bvslt i!761 to!496))))

(assert (= (and start!47382 res!189652) b!225996))

(assert (= (and b!225996 res!189650) b!225997))

(assert (= (and b!225997 res!189651) b!225998))

(assert (= start!47382 b!225999))

(declare-fun m!347033 () Bool)

(assert (=> start!47382 m!347033))

(declare-fun m!347035 () Bool)

(assert (=> start!47382 m!347035))

(declare-fun m!347037 () Bool)

(assert (=> b!225996 m!347037))

(declare-fun m!347039 () Bool)

(assert (=> b!225999 m!347039))

(declare-fun m!347041 () Bool)

(assert (=> b!225998 m!347041))

(declare-fun m!347043 () Bool)

(assert (=> b!225998 m!347043))

(declare-fun m!347045 () Bool)

(assert (=> b!225998 m!347045))

(push 1)

(assert (not b!225996))

(assert (not b!225998))

(assert (not start!47382))

(assert (not b!225999))

(check-sat)

(pop 1)

(push 1)

(check-sat)

