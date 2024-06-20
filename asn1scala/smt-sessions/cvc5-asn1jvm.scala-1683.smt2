; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46748 () Bool)

(assert start!46748)

(declare-fun b!224269 () Bool)

(declare-fun e!152809 () Bool)

(assert (=> b!224269 (= e!152809 (not true))))

(declare-datatypes ((array!11064 0))(
  ( (array!11065 (arr!5803 (Array (_ BitVec 32) (_ BitVec 8))) (size!4855 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11064)

(declare-datatypes ((BitStream!8812 0))(
  ( (BitStream!8813 (buf!5399 array!11064) (currentByte!10127 (_ BitVec 32)) (currentBit!10122 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!16379 0))(
  ( (Unit!16380) )
))
(declare-datatypes ((tuple3!1236 0))(
  ( (tuple3!1237 (_1!10359 Unit!16379) (_2!10359 BitStream!8812) (_3!760 array!11064)) )
))
(declare-fun lt!355863 () tuple3!1236)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun arrayRangesEq!751 (array!11064 array!11064 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224269 (arrayRangesEq!751 arr!308 (_3!760 lt!355863) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!355860 () array!11064)

(declare-fun lt!355864 () Unit!16379)

(declare-fun arrayRangesEqTransitive!222 (array!11064 array!11064 array!11064 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16379)

(assert (=> b!224269 (= lt!355864 (arrayRangesEqTransitive!222 arr!308 lt!355860 (_3!760 lt!355863) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!224269 (arrayRangesEq!751 arr!308 lt!355860 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((tuple2!19198 0))(
  ( (tuple2!19199 (_1!10360 (_ BitVec 8)) (_2!10360 BitStream!8812)) )
))
(declare-fun lt!355861 () tuple2!19198)

(declare-fun lt!355865 () Unit!16379)

(declare-fun arrayUpdatedAtPrefixLemma!343 (array!11064 (_ BitVec 32) (_ BitVec 8)) Unit!16379)

(assert (=> b!224269 (= lt!355865 (arrayUpdatedAtPrefixLemma!343 arr!308 i!761 (_1!10360 lt!355861)))))

(declare-fun lt!355862 () (_ BitVec 64))

(declare-fun thiss!1870 () BitStream!8812)

(declare-fun lt!355866 () (_ BitVec 64))

(declare-fun lt!355858 () (_ BitVec 64))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun lt!355857 () (_ BitVec 32))

(assert (=> b!224269 (and (= (bvadd lt!355866 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!355857))) lt!355858) (= (bvadd lt!355862 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!355858) (= (buf!5399 thiss!1870) (buf!5399 (_2!10359 lt!355863))) (= (size!4855 arr!308) (size!4855 (_3!760 lt!355863))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224269 (= lt!355858 (bitIndex!0 (size!4855 (buf!5399 (_2!10359 lt!355863))) (currentByte!10127 (_2!10359 lt!355863)) (currentBit!10122 (_2!10359 lt!355863))))))

(assert (=> b!224269 (= lt!355866 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!355862))))

(assert (=> b!224269 (= lt!355866 (bitIndex!0 (size!4855 (buf!5399 (_2!10360 lt!355861))) (currentByte!10127 (_2!10360 lt!355861)) (currentBit!10122 (_2!10360 lt!355861))))))

(assert (=> b!224269 (= lt!355862 (bitIndex!0 (size!4855 (buf!5399 thiss!1870)) (currentByte!10127 thiss!1870) (currentBit!10122 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8812 array!11064 (_ BitVec 32) (_ BitVec 32)) tuple3!1236)

(assert (=> b!224269 (= lt!355863 (readByteArrayLoop!0 (_2!10360 lt!355861) lt!355860 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224269 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4855 (buf!5399 (_2!10360 lt!355861)))) ((_ sign_extend 32) (currentByte!10127 (_2!10360 lt!355861))) ((_ sign_extend 32) (currentBit!10122 (_2!10360 lt!355861))) lt!355857)))

(assert (=> b!224269 (= lt!355857 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!355859 () Unit!16379)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8812 BitStream!8812 (_ BitVec 64) (_ BitVec 32)) Unit!16379)

(assert (=> b!224269 (= lt!355859 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10360 lt!355861) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224269 (= lt!355860 (array!11065 (store (arr!5803 arr!308) i!761 (_1!10360 lt!355861)) (size!4855 arr!308)))))

(declare-fun readByte!0 (BitStream!8812) tuple2!19198)

(assert (=> b!224269 (= lt!355861 (readByte!0 thiss!1870))))

(declare-fun b!224268 () Bool)

(declare-fun res!188233 () Bool)

(assert (=> b!224268 (=> (not res!188233) (not e!152809))))

(assert (=> b!224268 (= res!188233 (bvslt i!761 to!496))))

(declare-fun b!224267 () Bool)

(declare-fun res!188235 () Bool)

(assert (=> b!224267 (=> (not res!188235) (not e!152809))))

(assert (=> b!224267 (= res!188235 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4855 (buf!5399 thiss!1870))) ((_ sign_extend 32) (currentByte!10127 thiss!1870)) ((_ sign_extend 32) (currentBit!10122 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!188234 () Bool)

(assert (=> start!46748 (=> (not res!188234) (not e!152809))))

(assert (=> start!46748 (= res!188234 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4855 arr!308))))))

(assert (=> start!46748 e!152809))

(assert (=> start!46748 true))

(declare-fun array_inv!4596 (array!11064) Bool)

(assert (=> start!46748 (array_inv!4596 arr!308)))

(declare-fun e!152808 () Bool)

(declare-fun inv!12 (BitStream!8812) Bool)

(assert (=> start!46748 (and (inv!12 thiss!1870) e!152808)))

(declare-fun b!224270 () Bool)

(assert (=> b!224270 (= e!152808 (array_inv!4596 (buf!5399 thiss!1870)))))

(assert (= (and start!46748 res!188234) b!224267))

(assert (= (and b!224267 res!188235) b!224268))

(assert (= (and b!224268 res!188233) b!224269))

(assert (= start!46748 b!224270))

(declare-fun m!344183 () Bool)

(assert (=> b!224269 m!344183))

(declare-fun m!344185 () Bool)

(assert (=> b!224269 m!344185))

(declare-fun m!344187 () Bool)

(assert (=> b!224269 m!344187))

(declare-fun m!344189 () Bool)

(assert (=> b!224269 m!344189))

(declare-fun m!344191 () Bool)

(assert (=> b!224269 m!344191))

(declare-fun m!344193 () Bool)

(assert (=> b!224269 m!344193))

(declare-fun m!344195 () Bool)

(assert (=> b!224269 m!344195))

(declare-fun m!344197 () Bool)

(assert (=> b!224269 m!344197))

(declare-fun m!344199 () Bool)

(assert (=> b!224269 m!344199))

(declare-fun m!344201 () Bool)

(assert (=> b!224269 m!344201))

(declare-fun m!344203 () Bool)

(assert (=> b!224269 m!344203))

(declare-fun m!344205 () Bool)

(assert (=> b!224269 m!344205))

(declare-fun m!344207 () Bool)

(assert (=> b!224267 m!344207))

(declare-fun m!344209 () Bool)

(assert (=> start!46748 m!344209))

(declare-fun m!344211 () Bool)

(assert (=> start!46748 m!344211))

(declare-fun m!344213 () Bool)

(assert (=> b!224270 m!344213))

(push 1)

(assert (not start!46748))

(assert (not b!224270))

(assert (not b!224269))

(assert (not b!224267))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

