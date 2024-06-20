; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46744 () Bool)

(assert start!46744)

(declare-fun b!224246 () Bool)

(declare-fun e!152783 () Bool)

(declare-datatypes ((array!11060 0))(
  ( (array!11061 (arr!5801 (Array (_ BitVec 32) (_ BitVec 8))) (size!4853 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8808 0))(
  ( (BitStream!8809 (buf!5397 array!11060) (currentByte!10125 (_ BitVec 32)) (currentBit!10120 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8808)

(declare-fun array_inv!4594 (array!11060) Bool)

(assert (=> b!224246 (= e!152783 (array_inv!4594 (buf!5397 thiss!1870)))))

(declare-fun b!224244 () Bool)

(declare-fun res!188215 () Bool)

(declare-fun e!152784 () Bool)

(assert (=> b!224244 (=> (not res!188215) (not e!152784))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!224244 (= res!188215 (bvslt i!761 to!496))))

(declare-fun b!224245 () Bool)

(assert (=> b!224245 (= e!152784 (not true))))

(declare-fun arr!308 () array!11060)

(declare-datatypes ((Unit!16375 0))(
  ( (Unit!16376) )
))
(declare-datatypes ((tuple3!1232 0))(
  ( (tuple3!1233 (_1!10355 Unit!16375) (_2!10355 BitStream!8808) (_3!758 array!11060)) )
))
(declare-fun lt!355804 () tuple3!1232)

(declare-fun arrayRangesEq!749 (array!11060 array!11060 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224245 (arrayRangesEq!749 arr!308 (_3!758 lt!355804) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!355798 () array!11060)

(declare-fun lt!355803 () Unit!16375)

(declare-fun arrayRangesEqTransitive!220 (array!11060 array!11060 array!11060 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16375)

(assert (=> b!224245 (= lt!355803 (arrayRangesEqTransitive!220 arr!308 lt!355798 (_3!758 lt!355804) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!224245 (arrayRangesEq!749 arr!308 lt!355798 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!355801 () Unit!16375)

(declare-datatypes ((tuple2!19194 0))(
  ( (tuple2!19195 (_1!10356 (_ BitVec 8)) (_2!10356 BitStream!8808)) )
))
(declare-fun lt!355802 () tuple2!19194)

(declare-fun arrayUpdatedAtPrefixLemma!341 (array!11060 (_ BitVec 32) (_ BitVec 8)) Unit!16375)

(assert (=> b!224245 (= lt!355801 (arrayUpdatedAtPrefixLemma!341 arr!308 i!761 (_1!10356 lt!355802)))))

(declare-fun lt!355800 () (_ BitVec 64))

(declare-fun lt!355806 () (_ BitVec 64))

(declare-fun lt!355797 () (_ BitVec 32))

(declare-fun lt!355805 () (_ BitVec 64))

(assert (=> b!224245 (and (= (bvadd lt!355800 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!355797))) lt!355805) (= (bvadd lt!355806 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!355805) (= (buf!5397 thiss!1870) (buf!5397 (_2!10355 lt!355804))) (= (size!4853 arr!308) (size!4853 (_3!758 lt!355804))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224245 (= lt!355805 (bitIndex!0 (size!4853 (buf!5397 (_2!10355 lt!355804))) (currentByte!10125 (_2!10355 lt!355804)) (currentBit!10120 (_2!10355 lt!355804))))))

(assert (=> b!224245 (= lt!355800 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!355806))))

(assert (=> b!224245 (= lt!355800 (bitIndex!0 (size!4853 (buf!5397 (_2!10356 lt!355802))) (currentByte!10125 (_2!10356 lt!355802)) (currentBit!10120 (_2!10356 lt!355802))))))

(assert (=> b!224245 (= lt!355806 (bitIndex!0 (size!4853 (buf!5397 thiss!1870)) (currentByte!10125 thiss!1870) (currentBit!10120 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8808 array!11060 (_ BitVec 32) (_ BitVec 32)) tuple3!1232)

(assert (=> b!224245 (= lt!355804 (readByteArrayLoop!0 (_2!10356 lt!355802) lt!355798 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224245 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4853 (buf!5397 (_2!10356 lt!355802)))) ((_ sign_extend 32) (currentByte!10125 (_2!10356 lt!355802))) ((_ sign_extend 32) (currentBit!10120 (_2!10356 lt!355802))) lt!355797)))

(assert (=> b!224245 (= lt!355797 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!355799 () Unit!16375)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8808 BitStream!8808 (_ BitVec 64) (_ BitVec 32)) Unit!16375)

(assert (=> b!224245 (= lt!355799 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10356 lt!355802) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224245 (= lt!355798 (array!11061 (store (arr!5801 arr!308) i!761 (_1!10356 lt!355802)) (size!4853 arr!308)))))

(declare-fun readByte!0 (BitStream!8808) tuple2!19194)

(assert (=> b!224245 (= lt!355802 (readByte!0 thiss!1870))))

(declare-fun b!224243 () Bool)

(declare-fun res!188216 () Bool)

(assert (=> b!224243 (=> (not res!188216) (not e!152784))))

(assert (=> b!224243 (= res!188216 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4853 (buf!5397 thiss!1870))) ((_ sign_extend 32) (currentByte!10125 thiss!1870)) ((_ sign_extend 32) (currentBit!10120 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!188217 () Bool)

(assert (=> start!46744 (=> (not res!188217) (not e!152784))))

(assert (=> start!46744 (= res!188217 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4853 arr!308))))))

(assert (=> start!46744 e!152784))

(assert (=> start!46744 true))

(assert (=> start!46744 (array_inv!4594 arr!308)))

(declare-fun inv!12 (BitStream!8808) Bool)

(assert (=> start!46744 (and (inv!12 thiss!1870) e!152783)))

(assert (= (and start!46744 res!188217) b!224243))

(assert (= (and b!224243 res!188216) b!224244))

(assert (= (and b!224244 res!188215) b!224245))

(assert (= start!46744 b!224246))

(declare-fun m!344119 () Bool)

(assert (=> b!224246 m!344119))

(declare-fun m!344121 () Bool)

(assert (=> b!224245 m!344121))

(declare-fun m!344123 () Bool)

(assert (=> b!224245 m!344123))

(declare-fun m!344125 () Bool)

(assert (=> b!224245 m!344125))

(declare-fun m!344127 () Bool)

(assert (=> b!224245 m!344127))

(declare-fun m!344129 () Bool)

(assert (=> b!224245 m!344129))

(declare-fun m!344131 () Bool)

(assert (=> b!224245 m!344131))

(declare-fun m!344133 () Bool)

(assert (=> b!224245 m!344133))

(declare-fun m!344135 () Bool)

(assert (=> b!224245 m!344135))

(declare-fun m!344137 () Bool)

(assert (=> b!224245 m!344137))

(declare-fun m!344139 () Bool)

(assert (=> b!224245 m!344139))

(declare-fun m!344141 () Bool)

(assert (=> b!224245 m!344141))

(declare-fun m!344143 () Bool)

(assert (=> b!224245 m!344143))

(declare-fun m!344145 () Bool)

(assert (=> b!224243 m!344145))

(declare-fun m!344147 () Bool)

(assert (=> start!46744 m!344147))

(declare-fun m!344149 () Bool)

(assert (=> start!46744 m!344149))

(check-sat (not b!224245) (not b!224243) (not start!46744) (not b!224246))
