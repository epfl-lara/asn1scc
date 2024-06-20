; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47920 () Bool)

(assert start!47920)

(declare-fun b!227938 () Bool)

(declare-fun res!191213 () Bool)

(declare-fun e!156106 () Bool)

(assert (=> b!227938 (=> (not res!191213) (not e!156106))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!227938 (= res!191213 (bvslt i!761 to!496))))

(declare-fun b!227940 () Bool)

(declare-fun e!156103 () Bool)

(declare-datatypes ((array!11479 0))(
  ( (array!11480 (arr!6017 (Array (_ BitVec 32) (_ BitVec 8))) (size!5036 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9168 0))(
  ( (BitStream!9169 (buf!5577 array!11479) (currentByte!10427 (_ BitVec 32)) (currentBit!10422 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9168)

(declare-fun array_inv!4777 (array!11479) Bool)

(assert (=> b!227940 (= e!156103 (array_inv!4777 (buf!5577 thiss!1870)))))

(declare-fun res!191215 () Bool)

(assert (=> start!47920 (=> (not res!191215) (not e!156106))))

(declare-fun arr!308 () array!11479)

(assert (=> start!47920 (= res!191215 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5036 arr!308))))))

(assert (=> start!47920 e!156106))

(assert (=> start!47920 true))

(assert (=> start!47920 (array_inv!4777 arr!308)))

(declare-fun inv!12 (BitStream!9168) Bool)

(assert (=> start!47920 (and (inv!12 thiss!1870) e!156103)))

(declare-fun b!227937 () Bool)

(declare-fun res!191214 () Bool)

(assert (=> b!227937 (=> (not res!191214) (not e!156106))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227937 (= res!191214 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5036 (buf!5577 thiss!1870))) ((_ sign_extend 32) (currentByte!10427 thiss!1870)) ((_ sign_extend 32) (currentBit!10422 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!227939 () Bool)

(declare-datatypes ((Unit!17079 0))(
  ( (Unit!17080) )
))
(declare-datatypes ((tuple3!1454 0))(
  ( (tuple3!1455 (_1!10678 Unit!17079) (_2!10678 BitStream!9168) (_3!869 array!11479)) )
))
(declare-fun lt!365093 () tuple3!1454)

(declare-datatypes ((tuple2!19618 0))(
  ( (tuple2!19619 (_1!10679 (_ BitVec 8)) (_2!10679 BitStream!9168)) )
))
(declare-fun lt!365089 () tuple2!19618)

(assert (=> b!227939 (= e!156106 (not (= (select (arr!6017 (_3!869 lt!365093)) i!761) (_1!10679 lt!365089))))))

(assert (=> b!227939 (= (_1!10679 lt!365089) (select (arr!6017 (_3!869 lt!365093)) i!761))))

(declare-fun lt!365085 () array!11479)

(declare-fun lt!365094 () Unit!17079)

(declare-fun arrayRangesEqImpliesEq!128 (array!11479 array!11479 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17079)

(assert (=> b!227939 (= lt!365094 (arrayRangesEqImpliesEq!128 lt!365085 (_3!869 lt!365093) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun arrayRangesEq!872 (array!11479 array!11479 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227939 (arrayRangesEq!872 arr!308 (_3!869 lt!365093) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!365088 () Unit!17079)

(declare-fun arrayRangesEqTransitive!295 (array!11479 array!11479 array!11479 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17079)

(assert (=> b!227939 (= lt!365088 (arrayRangesEqTransitive!295 arr!308 lt!365085 (_3!869 lt!365093) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!227939 (arrayRangesEq!872 arr!308 lt!365085 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!365087 () Unit!17079)

(declare-fun arrayUpdatedAtPrefixLemma!431 (array!11479 (_ BitVec 32) (_ BitVec 8)) Unit!17079)

(assert (=> b!227939 (= lt!365087 (arrayUpdatedAtPrefixLemma!431 arr!308 i!761 (_1!10679 lt!365089)))))

(declare-fun lt!365086 () (_ BitVec 64))

(declare-fun lt!365090 () (_ BitVec 64))

(declare-fun lt!365091 () (_ BitVec 64))

(declare-fun lt!365092 () (_ BitVec 32))

(assert (=> b!227939 (and (= (bvadd lt!365091 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!365092))) lt!365086) (= (bvadd lt!365090 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!365086) (= (buf!5577 thiss!1870) (buf!5577 (_2!10678 lt!365093))) (= (size!5036 arr!308) (size!5036 (_3!869 lt!365093))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227939 (= lt!365086 (bitIndex!0 (size!5036 (buf!5577 (_2!10678 lt!365093))) (currentByte!10427 (_2!10678 lt!365093)) (currentBit!10422 (_2!10678 lt!365093))))))

(assert (=> b!227939 (= lt!365091 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!365090))))

(assert (=> b!227939 (= lt!365091 (bitIndex!0 (size!5036 (buf!5577 (_2!10679 lt!365089))) (currentByte!10427 (_2!10679 lt!365089)) (currentBit!10422 (_2!10679 lt!365089))))))

(assert (=> b!227939 (= lt!365090 (bitIndex!0 (size!5036 (buf!5577 thiss!1870)) (currentByte!10427 thiss!1870) (currentBit!10422 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9168 array!11479 (_ BitVec 32) (_ BitVec 32)) tuple3!1454)

(assert (=> b!227939 (= lt!365093 (readByteArrayLoop!0 (_2!10679 lt!365089) lt!365085 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!227939 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5036 (buf!5577 (_2!10679 lt!365089)))) ((_ sign_extend 32) (currentByte!10427 (_2!10679 lt!365089))) ((_ sign_extend 32) (currentBit!10422 (_2!10679 lt!365089))) lt!365092)))

(assert (=> b!227939 (= lt!365092 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!365084 () Unit!17079)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9168 BitStream!9168 (_ BitVec 64) (_ BitVec 32)) Unit!17079)

(assert (=> b!227939 (= lt!365084 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10679 lt!365089) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227939 (= lt!365085 (array!11480 (store (arr!6017 arr!308) i!761 (_1!10679 lt!365089)) (size!5036 arr!308)))))

(declare-fun readByte!0 (BitStream!9168) tuple2!19618)

(assert (=> b!227939 (= lt!365089 (readByte!0 thiss!1870))))

(assert (= (and start!47920 res!191215) b!227937))

(assert (= (and b!227937 res!191214) b!227938))

(assert (= (and b!227938 res!191213) b!227939))

(assert (= start!47920 b!227940))

(declare-fun m!350959 () Bool)

(assert (=> b!227940 m!350959))

(declare-fun m!350961 () Bool)

(assert (=> start!47920 m!350961))

(declare-fun m!350963 () Bool)

(assert (=> start!47920 m!350963))

(declare-fun m!350965 () Bool)

(assert (=> b!227937 m!350965))

(declare-fun m!350967 () Bool)

(assert (=> b!227939 m!350967))

(declare-fun m!350969 () Bool)

(assert (=> b!227939 m!350969))

(declare-fun m!350971 () Bool)

(assert (=> b!227939 m!350971))

(declare-fun m!350973 () Bool)

(assert (=> b!227939 m!350973))

(declare-fun m!350975 () Bool)

(assert (=> b!227939 m!350975))

(declare-fun m!350977 () Bool)

(assert (=> b!227939 m!350977))

(declare-fun m!350979 () Bool)

(assert (=> b!227939 m!350979))

(declare-fun m!350981 () Bool)

(assert (=> b!227939 m!350981))

(declare-fun m!350983 () Bool)

(assert (=> b!227939 m!350983))

(declare-fun m!350985 () Bool)

(assert (=> b!227939 m!350985))

(declare-fun m!350987 () Bool)

(assert (=> b!227939 m!350987))

(declare-fun m!350989 () Bool)

(assert (=> b!227939 m!350989))

(declare-fun m!350991 () Bool)

(assert (=> b!227939 m!350991))

(declare-fun m!350993 () Bool)

(assert (=> b!227939 m!350993))

(check-sat (not b!227940) (not b!227939) (not b!227937) (not start!47920))
