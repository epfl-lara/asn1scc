; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46712 () Bool)

(assert start!46712)

(declare-fun b!224052 () Bool)

(declare-fun res!188073 () Bool)

(declare-fun e!152592 () Bool)

(assert (=> b!224052 (=> (not res!188073) (not e!152592))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!224052 (= res!188073 (bvslt i!761 to!496))))

(declare-fun b!224053 () Bool)

(assert (=> b!224053 (= e!152592 (not true))))

(declare-datatypes ((array!11028 0))(
  ( (array!11029 (arr!5785 (Array (_ BitVec 32) (_ BitVec 8))) (size!4837 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11028)

(declare-fun lt!355332 () array!11028)

(declare-fun arrayRangesEq!733 (array!11028 array!11028 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224053 (arrayRangesEq!733 arr!308 lt!355332 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!16343 0))(
  ( (Unit!16344) )
))
(declare-fun lt!355324 () Unit!16343)

(declare-datatypes ((BitStream!8776 0))(
  ( (BitStream!8777 (buf!5381 array!11028) (currentByte!10109 (_ BitVec 32)) (currentBit!10104 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!19162 0))(
  ( (tuple2!19163 (_1!10323 (_ BitVec 8)) (_2!10323 BitStream!8776)) )
))
(declare-fun lt!355329 () tuple2!19162)

(declare-fun arrayUpdatedAtPrefixLemma!325 (array!11028 (_ BitVec 32) (_ BitVec 8)) Unit!16343)

(assert (=> b!224053 (= lt!355324 (arrayUpdatedAtPrefixLemma!325 arr!308 i!761 (_1!10323 lt!355329)))))

(declare-fun lt!355331 () (_ BitVec 32))

(declare-fun lt!355328 () (_ BitVec 64))

(declare-fun thiss!1870 () BitStream!8776)

(declare-datatypes ((tuple3!1200 0))(
  ( (tuple3!1201 (_1!10324 Unit!16343) (_2!10324 BitStream!8776) (_3!742 array!11028)) )
))
(declare-fun lt!355325 () tuple3!1200)

(declare-fun lt!355326 () (_ BitVec 64))

(declare-fun lt!355327 () (_ BitVec 64))

(assert (=> b!224053 (and (= (bvadd lt!355328 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!355331))) lt!355327) (= (bvadd lt!355326 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!355327) (= (buf!5381 thiss!1870) (buf!5381 (_2!10324 lt!355325))) (= (size!4837 arr!308) (size!4837 (_3!742 lt!355325))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224053 (= lt!355327 (bitIndex!0 (size!4837 (buf!5381 (_2!10324 lt!355325))) (currentByte!10109 (_2!10324 lt!355325)) (currentBit!10104 (_2!10324 lt!355325))))))

(assert (=> b!224053 (= lt!355328 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!355326))))

(assert (=> b!224053 (= lt!355328 (bitIndex!0 (size!4837 (buf!5381 (_2!10323 lt!355329))) (currentByte!10109 (_2!10323 lt!355329)) (currentBit!10104 (_2!10323 lt!355329))))))

(assert (=> b!224053 (= lt!355326 (bitIndex!0 (size!4837 (buf!5381 thiss!1870)) (currentByte!10109 thiss!1870) (currentBit!10104 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8776 array!11028 (_ BitVec 32) (_ BitVec 32)) tuple3!1200)

(assert (=> b!224053 (= lt!355325 (readByteArrayLoop!0 (_2!10323 lt!355329) lt!355332 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224053 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4837 (buf!5381 (_2!10323 lt!355329)))) ((_ sign_extend 32) (currentByte!10109 (_2!10323 lt!355329))) ((_ sign_extend 32) (currentBit!10104 (_2!10323 lt!355329))) lt!355331)))

(assert (=> b!224053 (= lt!355331 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!355330 () Unit!16343)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8776 BitStream!8776 (_ BitVec 64) (_ BitVec 32)) Unit!16343)

(assert (=> b!224053 (= lt!355330 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10323 lt!355329) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224053 (= lt!355332 (array!11029 (store (arr!5785 arr!308) i!761 (_1!10323 lt!355329)) (size!4837 arr!308)))))

(declare-fun readByte!0 (BitStream!8776) tuple2!19162)

(assert (=> b!224053 (= lt!355329 (readByte!0 thiss!1870))))

(declare-fun res!188071 () Bool)

(assert (=> start!46712 (=> (not res!188071) (not e!152592))))

(assert (=> start!46712 (= res!188071 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4837 arr!308))))))

(assert (=> start!46712 e!152592))

(assert (=> start!46712 true))

(declare-fun array_inv!4578 (array!11028) Bool)

(assert (=> start!46712 (array_inv!4578 arr!308)))

(declare-fun e!152591 () Bool)

(declare-fun inv!12 (BitStream!8776) Bool)

(assert (=> start!46712 (and (inv!12 thiss!1870) e!152591)))

(declare-fun b!224054 () Bool)

(assert (=> b!224054 (= e!152591 (array_inv!4578 (buf!5381 thiss!1870)))))

(declare-fun b!224051 () Bool)

(declare-fun res!188072 () Bool)

(assert (=> b!224051 (=> (not res!188072) (not e!152592))))

(assert (=> b!224051 (= res!188072 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4837 (buf!5381 thiss!1870))) ((_ sign_extend 32) (currentByte!10109 thiss!1870)) ((_ sign_extend 32) (currentBit!10104 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!46712 res!188071) b!224051))

(assert (= (and b!224051 res!188072) b!224052))

(assert (= (and b!224052 res!188073) b!224053))

(assert (= start!46712 b!224054))

(declare-fun m!343619 () Bool)

(assert (=> b!224053 m!343619))

(declare-fun m!343621 () Bool)

(assert (=> b!224053 m!343621))

(declare-fun m!343623 () Bool)

(assert (=> b!224053 m!343623))

(declare-fun m!343625 () Bool)

(assert (=> b!224053 m!343625))

(declare-fun m!343627 () Bool)

(assert (=> b!224053 m!343627))

(declare-fun m!343629 () Bool)

(assert (=> b!224053 m!343629))

(declare-fun m!343631 () Bool)

(assert (=> b!224053 m!343631))

(declare-fun m!343633 () Bool)

(assert (=> b!224053 m!343633))

(declare-fun m!343635 () Bool)

(assert (=> b!224053 m!343635))

(declare-fun m!343637 () Bool)

(assert (=> b!224053 m!343637))

(declare-fun m!343639 () Bool)

(assert (=> start!46712 m!343639))

(declare-fun m!343641 () Bool)

(assert (=> start!46712 m!343641))

(declare-fun m!343643 () Bool)

(assert (=> b!224054 m!343643))

(declare-fun m!343645 () Bool)

(assert (=> b!224051 m!343645))

(push 1)

(assert (not start!46712))

(assert (not b!224053))

(assert (not b!224054))

(assert (not b!224051))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

