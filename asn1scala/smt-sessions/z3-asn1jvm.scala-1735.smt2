; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47812 () Bool)

(assert start!47812)

(declare-fun b!227502 () Bool)

(declare-fun e!155700 () Bool)

(declare-datatypes ((array!11428 0))(
  ( (array!11429 (arr!5990 (Array (_ BitVec 32) (_ BitVec 8))) (size!5012 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9120 0))(
  ( (BitStream!9121 (buf!5553 array!11428) (currentByte!10397 (_ BitVec 32)) (currentBit!10392 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9120)

(declare-fun array_inv!4753 (array!11428) Bool)

(assert (=> b!227502 (= e!155700 (array_inv!4753 (buf!5553 thiss!1870)))))

(declare-fun b!227499 () Bool)

(declare-fun res!190862 () Bool)

(declare-fun e!155701 () Bool)

(assert (=> b!227499 (=> (not res!190862) (not e!155701))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227499 (= res!190862 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5012 (buf!5553 thiss!1870))) ((_ sign_extend 32) (currentByte!10397 thiss!1870)) ((_ sign_extend 32) (currentBit!10392 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!227500 () Bool)

(declare-fun res!190863 () Bool)

(assert (=> b!227500 (=> (not res!190863) (not e!155701))))

(assert (=> b!227500 (= res!190863 (bvslt i!761 to!496))))

(declare-fun res!190864 () Bool)

(assert (=> start!47812 (=> (not res!190864) (not e!155701))))

(declare-fun arr!308 () array!11428)

(assert (=> start!47812 (= res!190864 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5012 arr!308))))))

(assert (=> start!47812 e!155701))

(assert (=> start!47812 true))

(assert (=> start!47812 (array_inv!4753 arr!308)))

(declare-fun inv!12 (BitStream!9120) Bool)

(assert (=> start!47812 (and (inv!12 thiss!1870) e!155700)))

(declare-fun b!227501 () Bool)

(assert (=> b!227501 (= e!155701 (not true))))

(declare-datatypes ((Unit!16998 0))(
  ( (Unit!16999) )
))
(declare-datatypes ((tuple3!1406 0))(
  ( (tuple3!1407 (_1!10624 Unit!16998) (_2!10624 BitStream!9120) (_3!845 array!11428)) )
))
(declare-fun lt!363829 () tuple3!1406)

(declare-fun arrayRangesEq!848 (array!11428 array!11428 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227501 (arrayRangesEq!848 arr!308 (_3!845 lt!363829) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!363828 () array!11428)

(declare-fun lt!363832 () Unit!16998)

(declare-fun arrayRangesEqTransitive!271 (array!11428 array!11428 array!11428 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16998)

(assert (=> b!227501 (= lt!363832 (arrayRangesEqTransitive!271 arr!308 lt!363828 (_3!845 lt!363829) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!227501 (arrayRangesEq!848 arr!308 lt!363828 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!363834 () Unit!16998)

(declare-datatypes ((tuple2!19558 0))(
  ( (tuple2!19559 (_1!10625 (_ BitVec 8)) (_2!10625 BitStream!9120)) )
))
(declare-fun lt!363835 () tuple2!19558)

(declare-fun arrayUpdatedAtPrefixLemma!407 (array!11428 (_ BitVec 32) (_ BitVec 8)) Unit!16998)

(assert (=> b!227501 (= lt!363834 (arrayUpdatedAtPrefixLemma!407 arr!308 i!761 (_1!10625 lt!363835)))))

(declare-fun lt!363833 () (_ BitVec 32))

(declare-fun lt!363836 () (_ BitVec 64))

(declare-fun lt!363830 () (_ BitVec 64))

(declare-fun lt!363831 () (_ BitVec 64))

(assert (=> b!227501 (and (= (bvadd lt!363836 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!363833))) lt!363831) (= (bvadd lt!363830 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!363831) (= (buf!5553 thiss!1870) (buf!5553 (_2!10624 lt!363829))) (= (size!5012 arr!308) (size!5012 (_3!845 lt!363829))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227501 (= lt!363831 (bitIndex!0 (size!5012 (buf!5553 (_2!10624 lt!363829))) (currentByte!10397 (_2!10624 lt!363829)) (currentBit!10392 (_2!10624 lt!363829))))))

(assert (=> b!227501 (= lt!363836 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!363830))))

(assert (=> b!227501 (= lt!363836 (bitIndex!0 (size!5012 (buf!5553 (_2!10625 lt!363835))) (currentByte!10397 (_2!10625 lt!363835)) (currentBit!10392 (_2!10625 lt!363835))))))

(assert (=> b!227501 (= lt!363830 (bitIndex!0 (size!5012 (buf!5553 thiss!1870)) (currentByte!10397 thiss!1870) (currentBit!10392 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9120 array!11428 (_ BitVec 32) (_ BitVec 32)) tuple3!1406)

(assert (=> b!227501 (= lt!363829 (readByteArrayLoop!0 (_2!10625 lt!363835) lt!363828 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!227501 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5012 (buf!5553 (_2!10625 lt!363835)))) ((_ sign_extend 32) (currentByte!10397 (_2!10625 lt!363835))) ((_ sign_extend 32) (currentBit!10392 (_2!10625 lt!363835))) lt!363833)))

(assert (=> b!227501 (= lt!363833 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!363837 () Unit!16998)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9120 BitStream!9120 (_ BitVec 64) (_ BitVec 32)) Unit!16998)

(assert (=> b!227501 (= lt!363837 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10625 lt!363835) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227501 (= lt!363828 (array!11429 (store (arr!5990 arr!308) i!761 (_1!10625 lt!363835)) (size!5012 arr!308)))))

(declare-fun readByte!0 (BitStream!9120) tuple2!19558)

(assert (=> b!227501 (= lt!363835 (readByte!0 thiss!1870))))

(assert (= (and start!47812 res!190864) b!227499))

(assert (= (and b!227499 res!190862) b!227500))

(assert (= (and b!227500 res!190863) b!227501))

(assert (= start!47812 b!227502))

(declare-fun m!349917 () Bool)

(assert (=> b!227502 m!349917))

(declare-fun m!349919 () Bool)

(assert (=> b!227499 m!349919))

(declare-fun m!349921 () Bool)

(assert (=> start!47812 m!349921))

(declare-fun m!349923 () Bool)

(assert (=> start!47812 m!349923))

(declare-fun m!349925 () Bool)

(assert (=> b!227501 m!349925))

(declare-fun m!349927 () Bool)

(assert (=> b!227501 m!349927))

(declare-fun m!349929 () Bool)

(assert (=> b!227501 m!349929))

(declare-fun m!349931 () Bool)

(assert (=> b!227501 m!349931))

(declare-fun m!349933 () Bool)

(assert (=> b!227501 m!349933))

(declare-fun m!349935 () Bool)

(assert (=> b!227501 m!349935))

(declare-fun m!349937 () Bool)

(assert (=> b!227501 m!349937))

(declare-fun m!349939 () Bool)

(assert (=> b!227501 m!349939))

(declare-fun m!349941 () Bool)

(assert (=> b!227501 m!349941))

(declare-fun m!349943 () Bool)

(assert (=> b!227501 m!349943))

(declare-fun m!349945 () Bool)

(assert (=> b!227501 m!349945))

(declare-fun m!349947 () Bool)

(assert (=> b!227501 m!349947))

(check-sat (not b!227501) (not b!227502) (not start!47812) (not b!227499))
