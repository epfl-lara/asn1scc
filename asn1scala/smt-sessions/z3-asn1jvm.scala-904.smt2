; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25500 () Bool)

(assert start!25500)

(declare-fun b!129201 () Bool)

(declare-fun res!106981 () Bool)

(declare-fun e!85645 () Bool)

(assert (=> b!129201 (=> (not res!106981) (not e!85645))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!5985 0))(
  ( (array!5986 (arr!3325 (Array (_ BitVec 32) (_ BitVec 8))) (size!2708 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4680 0))(
  ( (BitStream!4681 (buf!3066 array!5985) (currentByte!5827 (_ BitVec 32)) (currentBit!5822 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4680)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!129201 (= res!106981 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2708 (buf!3066 thiss!1634))) ((_ sign_extend 32) (currentByte!5827 thiss!1634)) ((_ sign_extend 32) (currentBit!5822 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!129202 () Bool)

(declare-fun res!106977 () Bool)

(declare-fun e!85643 () Bool)

(assert (=> b!129202 (=> (not res!106977) (not e!85643))))

(declare-datatypes ((Unit!8021 0))(
  ( (Unit!8022) )
))
(declare-datatypes ((tuple2!11022 0))(
  ( (tuple2!11023 (_1!5808 Unit!8021) (_2!5808 BitStream!4680)) )
))
(declare-fun lt!199865 () tuple2!11022)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!129202 (= res!106977 (= (bitIndex!0 (size!2708 (buf!3066 (_2!5808 lt!199865))) (currentByte!5827 (_2!5808 lt!199865)) (currentBit!5822 (_2!5808 lt!199865))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2708 (buf!3066 thiss!1634)) (currentByte!5827 thiss!1634) (currentBit!5822 thiss!1634)))))))

(declare-fun b!129204 () Bool)

(assert (=> b!129204 (= e!85645 (not true))))

(declare-fun lt!199859 () Bool)

(declare-fun lt!199862 () tuple2!11022)

(declare-fun isPrefixOf!0 (BitStream!4680 BitStream!4680) Bool)

(assert (=> b!129204 (= lt!199859 (isPrefixOf!0 (_2!5808 lt!199865) (_2!5808 lt!199862)))))

(declare-fun lt!199861 () Bool)

(assert (=> b!129204 (= lt!199861 (isPrefixOf!0 thiss!1634 (_2!5808 lt!199865)))))

(declare-fun e!85640 () Bool)

(assert (=> b!129204 e!85640))

(declare-fun res!106979 () Bool)

(assert (=> b!129204 (=> (not res!106979) (not e!85640))))

(assert (=> b!129204 (= res!106979 (= (size!2708 (buf!3066 (_2!5808 lt!199865))) (size!2708 (buf!3066 (_2!5808 lt!199862)))))))

(declare-fun arr!237 () array!5985)

(declare-fun appendByteArrayLoop!0 (BitStream!4680 array!5985 (_ BitVec 32) (_ BitVec 32)) tuple2!11022)

(assert (=> b!129204 (= lt!199862 (appendByteArrayLoop!0 (_2!5808 lt!199865) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!129204 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2708 (buf!3066 (_2!5808 lt!199865)))) ((_ sign_extend 32) (currentByte!5827 (_2!5808 lt!199865))) ((_ sign_extend 32) (currentBit!5822 (_2!5808 lt!199865))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!199863 () Unit!8021)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4680 BitStream!4680 (_ BitVec 64) (_ BitVec 32)) Unit!8021)

(assert (=> b!129204 (= lt!199863 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5808 lt!199865) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!129204 e!85643))

(declare-fun res!106978 () Bool)

(assert (=> b!129204 (=> (not res!106978) (not e!85643))))

(assert (=> b!129204 (= res!106978 (= (size!2708 (buf!3066 thiss!1634)) (size!2708 (buf!3066 (_2!5808 lt!199865)))))))

(declare-fun appendByte!0 (BitStream!4680 (_ BitVec 8)) tuple2!11022)

(assert (=> b!129204 (= lt!199865 (appendByte!0 thiss!1634 (select (arr!3325 arr!237) from!447)))))

(declare-fun b!129205 () Bool)

(declare-fun res!106982 () Bool)

(assert (=> b!129205 (=> (not res!106982) (not e!85645))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129205 (= res!106982 (invariant!0 (currentBit!5822 thiss!1634) (currentByte!5827 thiss!1634) (size!2708 (buf!3066 thiss!1634))))))

(declare-fun b!129206 () Bool)

(declare-fun e!85644 () Bool)

(declare-fun array_inv!2497 (array!5985) Bool)

(assert (=> b!129206 (= e!85644 (array_inv!2497 (buf!3066 thiss!1634)))))

(declare-fun b!129207 () Bool)

(declare-fun res!106974 () Bool)

(declare-fun e!85642 () Bool)

(assert (=> b!129207 (=> (not res!106974) (not e!85642))))

(assert (=> b!129207 (= res!106974 (isPrefixOf!0 (_2!5808 lt!199865) (_2!5808 lt!199862)))))

(declare-fun b!129208 () Bool)

(assert (=> b!129208 (= e!85640 e!85642)))

(declare-fun res!106976 () Bool)

(assert (=> b!129208 (=> (not res!106976) (not e!85642))))

(declare-fun lt!199857 () (_ BitVec 64))

(assert (=> b!129208 (= res!106976 (= (bitIndex!0 (size!2708 (buf!3066 (_2!5808 lt!199862))) (currentByte!5827 (_2!5808 lt!199862)) (currentBit!5822 (_2!5808 lt!199862))) (bvadd (bitIndex!0 (size!2708 (buf!3066 (_2!5808 lt!199865))) (currentByte!5827 (_2!5808 lt!199865)) (currentBit!5822 (_2!5808 lt!199865))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!199857))))))

(assert (=> b!129208 (= lt!199857 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-datatypes ((tuple2!11024 0))(
  ( (tuple2!11025 (_1!5809 BitStream!4680) (_2!5809 array!5985)) )
))
(declare-fun lt!199855 () tuple2!11024)

(declare-fun b!129209 () Bool)

(declare-fun e!85639 () Bool)

(declare-fun arrayRangesEq!111 (array!5985 array!5985 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129209 (= e!85639 (not (arrayRangesEq!111 arr!237 (_2!5809 lt!199855) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!129210 () Bool)

(declare-fun res!106984 () Bool)

(assert (=> b!129210 (=> (not res!106984) (not e!85643))))

(assert (=> b!129210 (= res!106984 (isPrefixOf!0 thiss!1634 (_2!5808 lt!199865)))))

(declare-fun res!106980 () Bool)

(assert (=> start!25500 (=> (not res!106980) (not e!85645))))

(assert (=> start!25500 (= res!106980 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2708 arr!237))))))

(assert (=> start!25500 e!85645))

(assert (=> start!25500 true))

(assert (=> start!25500 (array_inv!2497 arr!237)))

(declare-fun inv!12 (BitStream!4680) Bool)

(assert (=> start!25500 (and (inv!12 thiss!1634) e!85644)))

(declare-fun b!129203 () Bool)

(declare-fun res!106983 () Bool)

(assert (=> b!129203 (=> (not res!106983) (not e!85645))))

(assert (=> b!129203 (= res!106983 (bvslt from!447 to!404))))

(declare-fun b!129211 () Bool)

(assert (=> b!129211 (= e!85642 (not e!85639))))

(declare-fun res!106975 () Bool)

(assert (=> b!129211 (=> res!106975 e!85639)))

(declare-datatypes ((tuple2!11026 0))(
  ( (tuple2!11027 (_1!5810 BitStream!4680) (_2!5810 BitStream!4680)) )
))
(declare-fun lt!199864 () tuple2!11026)

(assert (=> b!129211 (= res!106975 (or (not (= (size!2708 (_2!5809 lt!199855)) (size!2708 arr!237))) (not (= (_1!5809 lt!199855) (_2!5810 lt!199864)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4680 array!5985 (_ BitVec 32) (_ BitVec 32)) tuple2!11024)

(assert (=> b!129211 (= lt!199855 (readByteArrayLoopPure!0 (_1!5810 lt!199864) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!129211 (validate_offset_bits!1 ((_ sign_extend 32) (size!2708 (buf!3066 (_2!5808 lt!199862)))) ((_ sign_extend 32) (currentByte!5827 (_2!5808 lt!199865))) ((_ sign_extend 32) (currentBit!5822 (_2!5808 lt!199865))) lt!199857)))

(declare-fun lt!199858 () Unit!8021)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4680 array!5985 (_ BitVec 64)) Unit!8021)

(assert (=> b!129211 (= lt!199858 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5808 lt!199865) (buf!3066 (_2!5808 lt!199862)) lt!199857))))

(declare-fun reader!0 (BitStream!4680 BitStream!4680) tuple2!11026)

(assert (=> b!129211 (= lt!199864 (reader!0 (_2!5808 lt!199865) (_2!5808 lt!199862)))))

(declare-fun lt!199860 () tuple2!11026)

(declare-fun b!129212 () Bool)

(declare-datatypes ((tuple2!11028 0))(
  ( (tuple2!11029 (_1!5811 BitStream!4680) (_2!5811 (_ BitVec 8))) )
))
(declare-fun lt!199856 () tuple2!11028)

(assert (=> b!129212 (= e!85643 (and (= (_2!5811 lt!199856) (select (arr!3325 arr!237) from!447)) (= (_1!5811 lt!199856) (_2!5810 lt!199860))))))

(declare-fun readBytePure!0 (BitStream!4680) tuple2!11028)

(assert (=> b!129212 (= lt!199856 (readBytePure!0 (_1!5810 lt!199860)))))

(assert (=> b!129212 (= lt!199860 (reader!0 thiss!1634 (_2!5808 lt!199865)))))

(assert (= (and start!25500 res!106980) b!129201))

(assert (= (and b!129201 res!106981) b!129203))

(assert (= (and b!129203 res!106983) b!129205))

(assert (= (and b!129205 res!106982) b!129204))

(assert (= (and b!129204 res!106978) b!129202))

(assert (= (and b!129202 res!106977) b!129210))

(assert (= (and b!129210 res!106984) b!129212))

(assert (= (and b!129204 res!106979) b!129208))

(assert (= (and b!129208 res!106976) b!129207))

(assert (= (and b!129207 res!106974) b!129211))

(assert (= (and b!129211 (not res!106975)) b!129209))

(assert (= start!25500 b!129206))

(declare-fun m!194997 () Bool)

(assert (=> b!129205 m!194997))

(declare-fun m!194999 () Bool)

(assert (=> b!129210 m!194999))

(declare-fun m!195001 () Bool)

(assert (=> b!129202 m!195001))

(declare-fun m!195003 () Bool)

(assert (=> b!129202 m!195003))

(declare-fun m!195005 () Bool)

(assert (=> start!25500 m!195005))

(declare-fun m!195007 () Bool)

(assert (=> start!25500 m!195007))

(assert (=> b!129204 m!194999))

(declare-fun m!195009 () Bool)

(assert (=> b!129204 m!195009))

(declare-fun m!195011 () Bool)

(assert (=> b!129204 m!195011))

(declare-fun m!195013 () Bool)

(assert (=> b!129204 m!195013))

(declare-fun m!195015 () Bool)

(assert (=> b!129204 m!195015))

(declare-fun m!195017 () Bool)

(assert (=> b!129204 m!195017))

(assert (=> b!129204 m!195015))

(declare-fun m!195019 () Bool)

(assert (=> b!129204 m!195019))

(declare-fun m!195021 () Bool)

(assert (=> b!129206 m!195021))

(declare-fun m!195023 () Bool)

(assert (=> b!129211 m!195023))

(declare-fun m!195025 () Bool)

(assert (=> b!129211 m!195025))

(declare-fun m!195027 () Bool)

(assert (=> b!129211 m!195027))

(declare-fun m!195029 () Bool)

(assert (=> b!129211 m!195029))

(declare-fun m!195031 () Bool)

(assert (=> b!129201 m!195031))

(assert (=> b!129207 m!195009))

(assert (=> b!129212 m!195015))

(declare-fun m!195033 () Bool)

(assert (=> b!129212 m!195033))

(declare-fun m!195035 () Bool)

(assert (=> b!129212 m!195035))

(declare-fun m!195037 () Bool)

(assert (=> b!129208 m!195037))

(assert (=> b!129208 m!195001))

(declare-fun m!195039 () Bool)

(assert (=> b!129209 m!195039))

(check-sat (not b!129211) (not b!129208) (not b!129202) (not b!129205) (not b!129212) (not b!129206) (not start!25500) (not b!129210) (not b!129201) (not b!129209) (not b!129204) (not b!129207))
