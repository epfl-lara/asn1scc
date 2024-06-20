; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46710 () Bool)

(assert start!46710)

(declare-fun b!224039 () Bool)

(declare-fun res!188062 () Bool)

(declare-fun e!152581 () Bool)

(assert (=> b!224039 (=> (not res!188062) (not e!152581))))

(declare-datatypes ((array!11026 0))(
  ( (array!11027 (arr!5784 (Array (_ BitVec 32) (_ BitVec 8))) (size!4836 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8774 0))(
  ( (BitStream!8775 (buf!5380 array!11026) (currentByte!10108 (_ BitVec 32)) (currentBit!10103 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8774)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224039 (= res!188062 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4836 (buf!5380 thiss!1870))) ((_ sign_extend 32) (currentByte!10108 thiss!1870)) ((_ sign_extend 32) (currentBit!10103 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!224041 () Bool)

(assert (=> b!224041 (= e!152581 (not true))))

(declare-fun arr!308 () array!11026)

(declare-fun lt!355299 () array!11026)

(declare-fun arrayRangesEq!732 (array!11026 array!11026 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224041 (arrayRangesEq!732 arr!308 lt!355299 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!16341 0))(
  ( (Unit!16342) )
))
(declare-fun lt!355301 () Unit!16341)

(declare-datatypes ((tuple2!19160 0))(
  ( (tuple2!19161 (_1!10321 (_ BitVec 8)) (_2!10321 BitStream!8774)) )
))
(declare-fun lt!355298 () tuple2!19160)

(declare-fun arrayUpdatedAtPrefixLemma!324 (array!11026 (_ BitVec 32) (_ BitVec 8)) Unit!16341)

(assert (=> b!224041 (= lt!355301 (arrayUpdatedAtPrefixLemma!324 arr!308 i!761 (_1!10321 lt!355298)))))

(declare-fun lt!355304 () (_ BitVec 64))

(declare-fun lt!355297 () (_ BitVec 64))

(declare-fun lt!355305 () (_ BitVec 32))

(declare-fun lt!355303 () (_ BitVec 64))

(declare-datatypes ((tuple3!1198 0))(
  ( (tuple3!1199 (_1!10322 Unit!16341) (_2!10322 BitStream!8774) (_3!741 array!11026)) )
))
(declare-fun lt!355300 () tuple3!1198)

(assert (=> b!224041 (and (= (bvadd lt!355297 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!355305))) lt!355304) (= (bvadd lt!355303 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!355304) (= (buf!5380 thiss!1870) (buf!5380 (_2!10322 lt!355300))) (= (size!4836 arr!308) (size!4836 (_3!741 lt!355300))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224041 (= lt!355304 (bitIndex!0 (size!4836 (buf!5380 (_2!10322 lt!355300))) (currentByte!10108 (_2!10322 lt!355300)) (currentBit!10103 (_2!10322 lt!355300))))))

(assert (=> b!224041 (= lt!355297 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!355303))))

(assert (=> b!224041 (= lt!355297 (bitIndex!0 (size!4836 (buf!5380 (_2!10321 lt!355298))) (currentByte!10108 (_2!10321 lt!355298)) (currentBit!10103 (_2!10321 lt!355298))))))

(assert (=> b!224041 (= lt!355303 (bitIndex!0 (size!4836 (buf!5380 thiss!1870)) (currentByte!10108 thiss!1870) (currentBit!10103 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8774 array!11026 (_ BitVec 32) (_ BitVec 32)) tuple3!1198)

(assert (=> b!224041 (= lt!355300 (readByteArrayLoop!0 (_2!10321 lt!355298) lt!355299 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!224041 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4836 (buf!5380 (_2!10321 lt!355298)))) ((_ sign_extend 32) (currentByte!10108 (_2!10321 lt!355298))) ((_ sign_extend 32) (currentBit!10103 (_2!10321 lt!355298))) lt!355305)))

(assert (=> b!224041 (= lt!355305 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!355302 () Unit!16341)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8774 BitStream!8774 (_ BitVec 64) (_ BitVec 32)) Unit!16341)

(assert (=> b!224041 (= lt!355302 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10321 lt!355298) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224041 (= lt!355299 (array!11027 (store (arr!5784 arr!308) i!761 (_1!10321 lt!355298)) (size!4836 arr!308)))))

(declare-fun readByte!0 (BitStream!8774) tuple2!19160)

(assert (=> b!224041 (= lt!355298 (readByte!0 thiss!1870))))

(declare-fun b!224042 () Bool)

(declare-fun e!152582 () Bool)

(declare-fun array_inv!4577 (array!11026) Bool)

(assert (=> b!224042 (= e!152582 (array_inv!4577 (buf!5380 thiss!1870)))))

(declare-fun res!188063 () Bool)

(assert (=> start!46710 (=> (not res!188063) (not e!152581))))

(assert (=> start!46710 (= res!188063 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4836 arr!308))))))

(assert (=> start!46710 e!152581))

(assert (=> start!46710 true))

(assert (=> start!46710 (array_inv!4577 arr!308)))

(declare-fun inv!12 (BitStream!8774) Bool)

(assert (=> start!46710 (and (inv!12 thiss!1870) e!152582)))

(declare-fun b!224040 () Bool)

(declare-fun res!188064 () Bool)

(assert (=> b!224040 (=> (not res!188064) (not e!152581))))

(assert (=> b!224040 (= res!188064 (bvslt i!761 to!496))))

(assert (= (and start!46710 res!188063) b!224039))

(assert (= (and b!224039 res!188062) b!224040))

(assert (= (and b!224040 res!188064) b!224041))

(assert (= start!46710 b!224042))

(declare-fun m!343591 () Bool)

(assert (=> b!224039 m!343591))

(declare-fun m!343593 () Bool)

(assert (=> b!224041 m!343593))

(declare-fun m!343595 () Bool)

(assert (=> b!224041 m!343595))

(declare-fun m!343597 () Bool)

(assert (=> b!224041 m!343597))

(declare-fun m!343599 () Bool)

(assert (=> b!224041 m!343599))

(declare-fun m!343601 () Bool)

(assert (=> b!224041 m!343601))

(declare-fun m!343603 () Bool)

(assert (=> b!224041 m!343603))

(declare-fun m!343605 () Bool)

(assert (=> b!224041 m!343605))

(declare-fun m!343607 () Bool)

(assert (=> b!224041 m!343607))

(declare-fun m!343609 () Bool)

(assert (=> b!224041 m!343609))

(declare-fun m!343611 () Bool)

(assert (=> b!224041 m!343611))

(declare-fun m!343613 () Bool)

(assert (=> b!224042 m!343613))

(declare-fun m!343615 () Bool)

(assert (=> start!46710 m!343615))

(declare-fun m!343617 () Bool)

(assert (=> start!46710 m!343617))

(push 1)

