; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46732 () Bool)

(assert start!46732)

(declare-fun b!224174 () Bool)

(declare-fun e!152711 () Bool)

(declare-datatypes ((array!11048 0))(
  ( (array!11049 (arr!5795 (Array (_ BitVec 32) (_ BitVec 8))) (size!4847 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8796 0))(
  ( (BitStream!8797 (buf!5391 array!11048) (currentByte!10119 (_ BitVec 32)) (currentBit!10114 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8796)

(declare-fun array_inv!4588 (array!11048) Bool)

(assert (=> b!224174 (= e!152711 (array_inv!4588 (buf!5391 thiss!1870)))))

(declare-fun b!224172 () Bool)

(declare-fun res!188162 () Bool)

(declare-fun e!152713 () Bool)

(assert (=> b!224172 (=> (not res!188162) (not e!152713))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!224172 (= res!188162 (bvslt i!761 to!496))))

(declare-fun b!224171 () Bool)

(declare-fun res!188161 () Bool)

(assert (=> b!224171 (=> (not res!188161) (not e!152713))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224171 (= res!188161 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4847 (buf!5391 thiss!1870))) ((_ sign_extend 32) (currentByte!10119 thiss!1870)) ((_ sign_extend 32) (currentBit!10114 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!224173 () Bool)

(declare-fun arr!308 () array!11048)

(assert (=> b!224173 (= e!152713 (not (bvsle i!761 (size!4847 arr!308))))))

(declare-datatypes ((Unit!16363 0))(
  ( (Unit!16364) )
))
(declare-datatypes ((tuple3!1220 0))(
  ( (tuple3!1221 (_1!10343 Unit!16363) (_2!10343 BitStream!8796) (_3!752 array!11048)) )
))
(declare-fun lt!355617 () tuple3!1220)

(declare-fun arrayRangesEq!743 (array!11048 array!11048 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224173 (arrayRangesEq!743 arr!308 (_3!752 lt!355617) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!355620 () array!11048)

(declare-fun lt!355619 () Unit!16363)

(declare-fun arrayRangesEqTransitive!214 (array!11048 array!11048 array!11048 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16363)

(assert (=> b!224173 (= lt!355619 (arrayRangesEqTransitive!214 arr!308 lt!355620 (_3!752 lt!355617) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!224173 (arrayRangesEq!743 arr!308 lt!355620 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!355621 () Unit!16363)

(declare-datatypes ((tuple2!19182 0))(
  ( (tuple2!19183 (_1!10344 (_ BitVec 8)) (_2!10344 BitStream!8796)) )
))
(declare-fun lt!355618 () tuple2!19182)

(declare-fun arrayUpdatedAtPrefixLemma!335 (array!11048 (_ BitVec 32) (_ BitVec 8)) Unit!16363)

(assert (=> b!224173 (= lt!355621 (arrayUpdatedAtPrefixLemma!335 arr!308 i!761 (_1!10344 lt!355618)))))

(declare-fun lt!355623 () (_ BitVec 64))

(declare-fun lt!355625 () (_ BitVec 32))

(declare-fun lt!355626 () (_ BitVec 64))

(declare-fun lt!355624 () (_ BitVec 64))

(assert (=> b!224173 (and (= (bvadd lt!355624 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!355625))) lt!355626) (= (bvadd lt!355623 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!355626) (= (buf!5391 thiss!1870) (buf!5391 (_2!10343 lt!355617))) (= (size!4847 arr!308) (size!4847 (_3!752 lt!355617))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224173 (= lt!355626 (bitIndex!0 (size!4847 (buf!5391 (_2!10343 lt!355617))) (currentByte!10119 (_2!10343 lt!355617)) (currentBit!10114 (_2!10343 lt!355617))))))

(assert (=> b!224173 (= lt!355624 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!355623))))

(assert (=> b!224173 (= lt!355624 (bitIndex!0 (size!4847 (buf!5391 (_2!10344 lt!355618))) (currentByte!10119 (_2!10344 lt!355618)) (currentBit!10114 (_2!10344 lt!355618))))))

(assert (=> b!224173 (= lt!355623 (bitIndex!0 (size!4847 (buf!5391 thiss!1870)) (currentByte!10119 thiss!1870) (currentBit!10114 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8796 array!11048 (_ BitVec 32) (_ BitVec 32)) tuple3!1220)

(assert (=> b!224173 (= lt!355617 (readByteArrayLoop!0 (_2!10344 lt!355618) lt!355620 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!224173 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4847 (buf!5391 (_2!10344 lt!355618)))) ((_ sign_extend 32) (currentByte!10119 (_2!10344 lt!355618))) ((_ sign_extend 32) (currentBit!10114 (_2!10344 lt!355618))) lt!355625)))

(assert (=> b!224173 (= lt!355625 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!355622 () Unit!16363)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8796 BitStream!8796 (_ BitVec 64) (_ BitVec 32)) Unit!16363)

(assert (=> b!224173 (= lt!355622 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10344 lt!355618) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224173 (= lt!355620 (array!11049 (store (arr!5795 arr!308) i!761 (_1!10344 lt!355618)) (size!4847 arr!308)))))

(declare-fun readByte!0 (BitStream!8796) tuple2!19182)

(assert (=> b!224173 (= lt!355618 (readByte!0 thiss!1870))))

(declare-fun res!188163 () Bool)

(assert (=> start!46732 (=> (not res!188163) (not e!152713))))

(assert (=> start!46732 (= res!188163 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4847 arr!308))))))

(assert (=> start!46732 e!152713))

(assert (=> start!46732 true))

(assert (=> start!46732 (array_inv!4588 arr!308)))

(declare-fun inv!12 (BitStream!8796) Bool)

(assert (=> start!46732 (and (inv!12 thiss!1870) e!152711)))

(assert (= (and start!46732 res!188163) b!224171))

(assert (= (and b!224171 res!188161) b!224172))

(assert (= (and b!224172 res!188162) b!224173))

(assert (= start!46732 b!224174))

(declare-fun m!343927 () Bool)

(assert (=> b!224174 m!343927))

(declare-fun m!343929 () Bool)

(assert (=> b!224171 m!343929))

(declare-fun m!343931 () Bool)

(assert (=> b!224173 m!343931))

(declare-fun m!343933 () Bool)

(assert (=> b!224173 m!343933))

(declare-fun m!343935 () Bool)

(assert (=> b!224173 m!343935))

(declare-fun m!343937 () Bool)

(assert (=> b!224173 m!343937))

(declare-fun m!343939 () Bool)

(assert (=> b!224173 m!343939))

(declare-fun m!343941 () Bool)

(assert (=> b!224173 m!343941))

(declare-fun m!343943 () Bool)

(assert (=> b!224173 m!343943))

(declare-fun m!343945 () Bool)

(assert (=> b!224173 m!343945))

(declare-fun m!343947 () Bool)

(assert (=> b!224173 m!343947))

(declare-fun m!343949 () Bool)

(assert (=> b!224173 m!343949))

(declare-fun m!343951 () Bool)

(assert (=> b!224173 m!343951))

(declare-fun m!343953 () Bool)

(assert (=> b!224173 m!343953))

(declare-fun m!343955 () Bool)

(assert (=> start!46732 m!343955))

(declare-fun m!343957 () Bool)

(assert (=> start!46732 m!343957))

(check-sat (not b!224171) (not start!46732) (not b!224174) (not b!224173))
(check-sat)
