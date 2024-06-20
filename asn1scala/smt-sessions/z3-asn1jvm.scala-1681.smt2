; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46738 () Bool)

(assert start!46738)

(declare-fun b!224209 () Bool)

(declare-fun e!152748 () Bool)

(assert (=> b!224209 (= e!152748 (not true))))

(declare-datatypes ((array!11054 0))(
  ( (array!11055 (arr!5798 (Array (_ BitVec 32) (_ BitVec 8))) (size!4850 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11054)

(declare-datatypes ((BitStream!8802 0))(
  ( (BitStream!8803 (buf!5394 array!11054) (currentByte!10122 (_ BitVec 32)) (currentBit!10117 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!16369 0))(
  ( (Unit!16370) )
))
(declare-datatypes ((tuple3!1226 0))(
  ( (tuple3!1227 (_1!10349 Unit!16369) (_2!10349 BitStream!8802) (_3!755 array!11054)) )
))
(declare-fun lt!355710 () tuple3!1226)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun arrayRangesEq!746 (array!11054 array!11054 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224209 (arrayRangesEq!746 arr!308 (_3!755 lt!355710) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!355715 () Unit!16369)

(declare-fun lt!355714 () array!11054)

(declare-fun arrayRangesEqTransitive!217 (array!11054 array!11054 array!11054 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16369)

(assert (=> b!224209 (= lt!355715 (arrayRangesEqTransitive!217 arr!308 lt!355714 (_3!755 lt!355710) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!224209 (arrayRangesEq!746 arr!308 lt!355714 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!355711 () Unit!16369)

(declare-datatypes ((tuple2!19188 0))(
  ( (tuple2!19189 (_1!10350 (_ BitVec 8)) (_2!10350 BitStream!8802)) )
))
(declare-fun lt!355709 () tuple2!19188)

(declare-fun arrayUpdatedAtPrefixLemma!338 (array!11054 (_ BitVec 32) (_ BitVec 8)) Unit!16369)

(assert (=> b!224209 (= lt!355711 (arrayUpdatedAtPrefixLemma!338 arr!308 i!761 (_1!10350 lt!355709)))))

(declare-fun lt!355708 () (_ BitVec 64))

(declare-fun lt!355713 () (_ BitVec 64))

(declare-fun lt!355707 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun lt!355712 () (_ BitVec 64))

(declare-fun thiss!1870 () BitStream!8802)

(assert (=> b!224209 (and (= (bvadd lt!355713 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!355707))) lt!355712) (= (bvadd lt!355708 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!355712) (= (buf!5394 thiss!1870) (buf!5394 (_2!10349 lt!355710))) (= (size!4850 arr!308) (size!4850 (_3!755 lt!355710))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224209 (= lt!355712 (bitIndex!0 (size!4850 (buf!5394 (_2!10349 lt!355710))) (currentByte!10122 (_2!10349 lt!355710)) (currentBit!10117 (_2!10349 lt!355710))))))

(assert (=> b!224209 (= lt!355713 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!355708))))

(assert (=> b!224209 (= lt!355713 (bitIndex!0 (size!4850 (buf!5394 (_2!10350 lt!355709))) (currentByte!10122 (_2!10350 lt!355709)) (currentBit!10117 (_2!10350 lt!355709))))))

(assert (=> b!224209 (= lt!355708 (bitIndex!0 (size!4850 (buf!5394 thiss!1870)) (currentByte!10122 thiss!1870) (currentBit!10117 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8802 array!11054 (_ BitVec 32) (_ BitVec 32)) tuple3!1226)

(assert (=> b!224209 (= lt!355710 (readByteArrayLoop!0 (_2!10350 lt!355709) lt!355714 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224209 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4850 (buf!5394 (_2!10350 lt!355709)))) ((_ sign_extend 32) (currentByte!10122 (_2!10350 lt!355709))) ((_ sign_extend 32) (currentBit!10117 (_2!10350 lt!355709))) lt!355707)))

(assert (=> b!224209 (= lt!355707 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!355716 () Unit!16369)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8802 BitStream!8802 (_ BitVec 64) (_ BitVec 32)) Unit!16369)

(assert (=> b!224209 (= lt!355716 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10350 lt!355709) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224209 (= lt!355714 (array!11055 (store (arr!5798 arr!308) i!761 (_1!10350 lt!355709)) (size!4850 arr!308)))))

(declare-fun readByte!0 (BitStream!8802) tuple2!19188)

(assert (=> b!224209 (= lt!355709 (readByte!0 thiss!1870))))

(declare-fun res!188190 () Bool)

(assert (=> start!46738 (=> (not res!188190) (not e!152748))))

(assert (=> start!46738 (= res!188190 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4850 arr!308))))))

(assert (=> start!46738 e!152748))

(assert (=> start!46738 true))

(declare-fun array_inv!4591 (array!11054) Bool)

(assert (=> start!46738 (array_inv!4591 arr!308)))

(declare-fun e!152747 () Bool)

(declare-fun inv!12 (BitStream!8802) Bool)

(assert (=> start!46738 (and (inv!12 thiss!1870) e!152747)))

(declare-fun b!224207 () Bool)

(declare-fun res!188189 () Bool)

(assert (=> b!224207 (=> (not res!188189) (not e!152748))))

(assert (=> b!224207 (= res!188189 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4850 (buf!5394 thiss!1870))) ((_ sign_extend 32) (currentByte!10122 thiss!1870)) ((_ sign_extend 32) (currentBit!10117 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!224210 () Bool)

(assert (=> b!224210 (= e!152747 (array_inv!4591 (buf!5394 thiss!1870)))))

(declare-fun b!224208 () Bool)

(declare-fun res!188188 () Bool)

(assert (=> b!224208 (=> (not res!188188) (not e!152748))))

(assert (=> b!224208 (= res!188188 (bvslt i!761 to!496))))

(assert (= (and start!46738 res!188190) b!224207))

(assert (= (and b!224207 res!188189) b!224208))

(assert (= (and b!224208 res!188188) b!224209))

(assert (= start!46738 b!224210))

(declare-fun m!344023 () Bool)

(assert (=> b!224209 m!344023))

(declare-fun m!344025 () Bool)

(assert (=> b!224209 m!344025))

(declare-fun m!344027 () Bool)

(assert (=> b!224209 m!344027))

(declare-fun m!344029 () Bool)

(assert (=> b!224209 m!344029))

(declare-fun m!344031 () Bool)

(assert (=> b!224209 m!344031))

(declare-fun m!344033 () Bool)

(assert (=> b!224209 m!344033))

(declare-fun m!344035 () Bool)

(assert (=> b!224209 m!344035))

(declare-fun m!344037 () Bool)

(assert (=> b!224209 m!344037))

(declare-fun m!344039 () Bool)

(assert (=> b!224209 m!344039))

(declare-fun m!344041 () Bool)

(assert (=> b!224209 m!344041))

(declare-fun m!344043 () Bool)

(assert (=> b!224209 m!344043))

(declare-fun m!344045 () Bool)

(assert (=> b!224209 m!344045))

(declare-fun m!344047 () Bool)

(assert (=> start!46738 m!344047))

(declare-fun m!344049 () Bool)

(assert (=> start!46738 m!344049))

(declare-fun m!344051 () Bool)

(assert (=> b!224207 m!344051))

(declare-fun m!344053 () Bool)

(assert (=> b!224210 m!344053))

(check-sat (not start!46738) (not b!224210) (not b!224209) (not b!224207))
