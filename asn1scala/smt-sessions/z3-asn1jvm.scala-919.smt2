; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25806 () Bool)

(assert start!25806)

(declare-fun b!131718 () Bool)

(declare-fun res!109302 () Bool)

(declare-fun e!87320 () Bool)

(assert (=> b!131718 (=> (not res!109302) (not e!87320))))

(declare-datatypes ((array!6081 0))(
  ( (array!6082 (arr!3382 (Array (_ BitVec 32) (_ BitVec 8))) (size!2753 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4770 0))(
  ( (BitStream!4771 (buf!3120 array!6081) (currentByte!5899 (_ BitVec 32)) (currentBit!5894 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4770)

(declare-datatypes ((Unit!8129 0))(
  ( (Unit!8130) )
))
(declare-datatypes ((tuple2!11394 0))(
  ( (tuple2!11395 (_1!6000 Unit!8129) (_2!6000 BitStream!4770)) )
))
(declare-fun lt!203242 () tuple2!11394)

(declare-fun isPrefixOf!0 (BitStream!4770 BitStream!4770) Bool)

(assert (=> b!131718 (= res!109302 (isPrefixOf!0 thiss!1634 (_2!6000 lt!203242)))))

(declare-fun b!131719 () Bool)

(declare-fun res!109300 () Bool)

(declare-fun e!87315 () Bool)

(assert (=> b!131719 (=> (not res!109300) (not e!87315))))

(declare-fun lt!203230 () tuple2!11394)

(assert (=> b!131719 (= res!109300 (isPrefixOf!0 (_2!6000 lt!203242) (_2!6000 lt!203230)))))

(declare-fun b!131720 () Bool)

(declare-fun e!87316 () Bool)

(assert (=> b!131720 (= e!87316 e!87315)))

(declare-fun res!109309 () Bool)

(assert (=> b!131720 (=> (not res!109309) (not e!87315))))

(declare-fun lt!203233 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!131720 (= res!109309 (= (bitIndex!0 (size!2753 (buf!3120 (_2!6000 lt!203230))) (currentByte!5899 (_2!6000 lt!203230)) (currentBit!5894 (_2!6000 lt!203230))) (bvadd (bitIndex!0 (size!2753 (buf!3120 (_2!6000 lt!203242))) (currentByte!5899 (_2!6000 lt!203242)) (currentBit!5894 (_2!6000 lt!203242))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!203233))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!131720 (= lt!203233 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!131721 () Bool)

(declare-fun e!87312 () Bool)

(assert (=> b!131721 (= e!87312 (not true))))

(declare-fun e!87317 () Bool)

(assert (=> b!131721 e!87317))

(declare-fun res!109298 () Bool)

(assert (=> b!131721 (=> (not res!109298) (not e!87317))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!131721 (= res!109298 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2753 (buf!3120 (_2!6000 lt!203230)))) ((_ sign_extend 32) (currentByte!5899 thiss!1634)) ((_ sign_extend 32) (currentBit!5894 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!203235 () Unit!8129)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4770 array!6081 (_ BitVec 32)) Unit!8129)

(assert (=> b!131721 (= lt!203235 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3120 (_2!6000 lt!203230)) (bvsub to!404 from!447)))))

(declare-datatypes ((tuple2!11396 0))(
  ( (tuple2!11397 (_1!6001 BitStream!4770) (_2!6001 BitStream!4770)) )
))
(declare-fun lt!203237 () tuple2!11396)

(declare-fun arr!237 () array!6081)

(declare-datatypes ((tuple2!11398 0))(
  ( (tuple2!11399 (_1!6002 BitStream!4770) (_2!6002 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!4770) tuple2!11398)

(assert (=> b!131721 (= (_2!6002 (readBytePure!0 (_1!6001 lt!203237))) (select (arr!3382 arr!237) from!447))))

(declare-fun lt!203232 () tuple2!11396)

(declare-fun reader!0 (BitStream!4770 BitStream!4770) tuple2!11396)

(assert (=> b!131721 (= lt!203232 (reader!0 (_2!6000 lt!203242) (_2!6000 lt!203230)))))

(assert (=> b!131721 (= lt!203237 (reader!0 thiss!1634 (_2!6000 lt!203230)))))

(declare-fun e!87319 () Bool)

(assert (=> b!131721 e!87319))

(declare-fun res!109304 () Bool)

(assert (=> b!131721 (=> (not res!109304) (not e!87319))))

(declare-fun lt!203229 () tuple2!11398)

(declare-fun lt!203231 () tuple2!11398)

(assert (=> b!131721 (= res!109304 (= (bitIndex!0 (size!2753 (buf!3120 (_1!6002 lt!203229))) (currentByte!5899 (_1!6002 lt!203229)) (currentBit!5894 (_1!6002 lt!203229))) (bitIndex!0 (size!2753 (buf!3120 (_1!6002 lt!203231))) (currentByte!5899 (_1!6002 lt!203231)) (currentBit!5894 (_1!6002 lt!203231)))))))

(declare-fun lt!203236 () Unit!8129)

(declare-fun lt!203228 () BitStream!4770)

(declare-fun readBytePrefixLemma!0 (BitStream!4770 BitStream!4770) Unit!8129)

(assert (=> b!131721 (= lt!203236 (readBytePrefixLemma!0 lt!203228 (_2!6000 lt!203230)))))

(assert (=> b!131721 (= lt!203231 (readBytePure!0 (BitStream!4771 (buf!3120 (_2!6000 lt!203230)) (currentByte!5899 thiss!1634) (currentBit!5894 thiss!1634))))))

(assert (=> b!131721 (= lt!203229 (readBytePure!0 lt!203228))))

(assert (=> b!131721 (= lt!203228 (BitStream!4771 (buf!3120 (_2!6000 lt!203242)) (currentByte!5899 thiss!1634) (currentBit!5894 thiss!1634)))))

(declare-fun e!87318 () Bool)

(assert (=> b!131721 e!87318))

(declare-fun res!109303 () Bool)

(assert (=> b!131721 (=> (not res!109303) (not e!87318))))

(assert (=> b!131721 (= res!109303 (isPrefixOf!0 thiss!1634 (_2!6000 lt!203230)))))

(declare-fun lt!203227 () Unit!8129)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4770 BitStream!4770 BitStream!4770) Unit!8129)

(assert (=> b!131721 (= lt!203227 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6000 lt!203242) (_2!6000 lt!203230)))))

(assert (=> b!131721 e!87316))

(declare-fun res!109296 () Bool)

(assert (=> b!131721 (=> (not res!109296) (not e!87316))))

(assert (=> b!131721 (= res!109296 (= (size!2753 (buf!3120 (_2!6000 lt!203242))) (size!2753 (buf!3120 (_2!6000 lt!203230)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4770 array!6081 (_ BitVec 32) (_ BitVec 32)) tuple2!11394)

(assert (=> b!131721 (= lt!203230 (appendByteArrayLoop!0 (_2!6000 lt!203242) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!131721 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2753 (buf!3120 (_2!6000 lt!203242)))) ((_ sign_extend 32) (currentByte!5899 (_2!6000 lt!203242))) ((_ sign_extend 32) (currentBit!5894 (_2!6000 lt!203242))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!203239 () Unit!8129)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4770 BitStream!4770 (_ BitVec 64) (_ BitVec 32)) Unit!8129)

(assert (=> b!131721 (= lt!203239 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6000 lt!203242) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!131721 e!87320))

(declare-fun res!109305 () Bool)

(assert (=> b!131721 (=> (not res!109305) (not e!87320))))

(assert (=> b!131721 (= res!109305 (= (size!2753 (buf!3120 thiss!1634)) (size!2753 (buf!3120 (_2!6000 lt!203242)))))))

(declare-fun appendByte!0 (BitStream!4770 (_ BitVec 8)) tuple2!11394)

(assert (=> b!131721 (= lt!203242 (appendByte!0 thiss!1634 (select (arr!3382 arr!237) from!447)))))

(declare-fun b!131722 () Bool)

(declare-fun e!87313 () Bool)

(assert (=> b!131722 (= e!87315 (not e!87313))))

(declare-fun res!109306 () Bool)

(assert (=> b!131722 (=> res!109306 e!87313)))

(declare-datatypes ((tuple2!11400 0))(
  ( (tuple2!11401 (_1!6003 BitStream!4770) (_2!6003 array!6081)) )
))
(declare-fun lt!203241 () tuple2!11400)

(declare-fun lt!203240 () tuple2!11396)

(assert (=> b!131722 (= res!109306 (or (not (= (size!2753 (_2!6003 lt!203241)) (size!2753 arr!237))) (not (= (_1!6003 lt!203241) (_2!6001 lt!203240)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4770 array!6081 (_ BitVec 32) (_ BitVec 32)) tuple2!11400)

(assert (=> b!131722 (= lt!203241 (readByteArrayLoopPure!0 (_1!6001 lt!203240) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!131722 (validate_offset_bits!1 ((_ sign_extend 32) (size!2753 (buf!3120 (_2!6000 lt!203230)))) ((_ sign_extend 32) (currentByte!5899 (_2!6000 lt!203242))) ((_ sign_extend 32) (currentBit!5894 (_2!6000 lt!203242))) lt!203233)))

(declare-fun lt!203234 () Unit!8129)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4770 array!6081 (_ BitVec 64)) Unit!8129)

(assert (=> b!131722 (= lt!203234 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6000 lt!203242) (buf!3120 (_2!6000 lt!203230)) lt!203233))))

(assert (=> b!131722 (= lt!203240 (reader!0 (_2!6000 lt!203242) (_2!6000 lt!203230)))))

(declare-fun b!131723 () Bool)

(declare-fun res!109308 () Bool)

(assert (=> b!131723 (=> (not res!109308) (not e!87312))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!131723 (= res!109308 (invariant!0 (currentBit!5894 thiss!1634) (currentByte!5899 thiss!1634) (size!2753 (buf!3120 thiss!1634))))))

(declare-fun b!131724 () Bool)

(assert (=> b!131724 (= e!87317 (= (_1!6003 (readByteArrayLoopPure!0 (_1!6001 lt!203237) arr!237 from!447 to!404)) (_2!6001 lt!203237)))))

(declare-fun b!131725 () Bool)

(assert (=> b!131725 (= e!87319 (= (_2!6002 lt!203229) (_2!6002 lt!203231)))))

(declare-fun b!131726 () Bool)

(declare-fun arrayRangesEq!156 (array!6081 array!6081 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!131726 (= e!87313 (not (arrayRangesEq!156 arr!237 (_2!6003 lt!203241) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!131727 () Bool)

(declare-fun res!109307 () Bool)

(assert (=> b!131727 (=> (not res!109307) (not e!87312))))

(assert (=> b!131727 (= res!109307 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2753 (buf!3120 thiss!1634))) ((_ sign_extend 32) (currentByte!5899 thiss!1634)) ((_ sign_extend 32) (currentBit!5894 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun res!109301 () Bool)

(assert (=> start!25806 (=> (not res!109301) (not e!87312))))

(assert (=> start!25806 (= res!109301 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2753 arr!237))))))

(assert (=> start!25806 e!87312))

(assert (=> start!25806 true))

(declare-fun array_inv!2542 (array!6081) Bool)

(assert (=> start!25806 (array_inv!2542 arr!237)))

(declare-fun e!87314 () Bool)

(declare-fun inv!12 (BitStream!4770) Bool)

(assert (=> start!25806 (and (inv!12 thiss!1634) e!87314)))

(declare-fun b!131728 () Bool)

(declare-fun res!109299 () Bool)

(assert (=> b!131728 (=> (not res!109299) (not e!87320))))

(assert (=> b!131728 (= res!109299 (= (bitIndex!0 (size!2753 (buf!3120 (_2!6000 lt!203242))) (currentByte!5899 (_2!6000 lt!203242)) (currentBit!5894 (_2!6000 lt!203242))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2753 (buf!3120 thiss!1634)) (currentByte!5899 thiss!1634) (currentBit!5894 thiss!1634)))))))

(declare-fun b!131729 () Bool)

(declare-fun res!109297 () Bool)

(assert (=> b!131729 (=> (not res!109297) (not e!87312))))

(assert (=> b!131729 (= res!109297 (bvslt from!447 to!404))))

(declare-fun b!131730 () Bool)

(declare-fun lt!203243 () tuple2!11396)

(declare-fun lt!203238 () tuple2!11398)

(assert (=> b!131730 (= e!87320 (and (= (_2!6002 lt!203238) (select (arr!3382 arr!237) from!447)) (= (_1!6002 lt!203238) (_2!6001 lt!203243))))))

(assert (=> b!131730 (= lt!203238 (readBytePure!0 (_1!6001 lt!203243)))))

(assert (=> b!131730 (= lt!203243 (reader!0 thiss!1634 (_2!6000 lt!203242)))))

(declare-fun b!131731 () Bool)

(assert (=> b!131731 (= e!87314 (array_inv!2542 (buf!3120 thiss!1634)))))

(declare-fun b!131732 () Bool)

(assert (=> b!131732 (= e!87318 (invariant!0 (currentBit!5894 thiss!1634) (currentByte!5899 thiss!1634) (size!2753 (buf!3120 (_2!6000 lt!203242)))))))

(assert (= (and start!25806 res!109301) b!131727))

(assert (= (and b!131727 res!109307) b!131729))

(assert (= (and b!131729 res!109297) b!131723))

(assert (= (and b!131723 res!109308) b!131721))

(assert (= (and b!131721 res!109305) b!131728))

(assert (= (and b!131728 res!109299) b!131718))

(assert (= (and b!131718 res!109302) b!131730))

(assert (= (and b!131721 res!109296) b!131720))

(assert (= (and b!131720 res!109309) b!131719))

(assert (= (and b!131719 res!109300) b!131722))

(assert (= (and b!131722 (not res!109306)) b!131726))

(assert (= (and b!131721 res!109303) b!131732))

(assert (= (and b!131721 res!109304) b!131725))

(assert (= (and b!131721 res!109298) b!131724))

(assert (= start!25806 b!131731))

(declare-fun m!198833 () Bool)

(assert (=> b!131727 m!198833))

(declare-fun m!198835 () Bool)

(assert (=> b!131731 m!198835))

(declare-fun m!198837 () Bool)

(assert (=> b!131719 m!198837))

(declare-fun m!198839 () Bool)

(assert (=> b!131732 m!198839))

(declare-fun m!198841 () Bool)

(assert (=> b!131730 m!198841))

(declare-fun m!198843 () Bool)

(assert (=> b!131730 m!198843))

(declare-fun m!198845 () Bool)

(assert (=> b!131730 m!198845))

(declare-fun m!198847 () Bool)

(assert (=> b!131723 m!198847))

(declare-fun m!198849 () Bool)

(assert (=> b!131728 m!198849))

(declare-fun m!198851 () Bool)

(assert (=> b!131728 m!198851))

(declare-fun m!198853 () Bool)

(assert (=> b!131720 m!198853))

(assert (=> b!131720 m!198849))

(declare-fun m!198855 () Bool)

(assert (=> b!131724 m!198855))

(declare-fun m!198857 () Bool)

(assert (=> b!131718 m!198857))

(declare-fun m!198859 () Bool)

(assert (=> b!131721 m!198859))

(declare-fun m!198861 () Bool)

(assert (=> b!131721 m!198861))

(declare-fun m!198863 () Bool)

(assert (=> b!131721 m!198863))

(declare-fun m!198865 () Bool)

(assert (=> b!131721 m!198865))

(declare-fun m!198867 () Bool)

(assert (=> b!131721 m!198867))

(declare-fun m!198869 () Bool)

(assert (=> b!131721 m!198869))

(assert (=> b!131721 m!198841))

(declare-fun m!198871 () Bool)

(assert (=> b!131721 m!198871))

(declare-fun m!198873 () Bool)

(assert (=> b!131721 m!198873))

(declare-fun m!198875 () Bool)

(assert (=> b!131721 m!198875))

(declare-fun m!198877 () Bool)

(assert (=> b!131721 m!198877))

(declare-fun m!198879 () Bool)

(assert (=> b!131721 m!198879))

(declare-fun m!198881 () Bool)

(assert (=> b!131721 m!198881))

(declare-fun m!198883 () Bool)

(assert (=> b!131721 m!198883))

(declare-fun m!198885 () Bool)

(assert (=> b!131721 m!198885))

(declare-fun m!198887 () Bool)

(assert (=> b!131721 m!198887))

(declare-fun m!198889 () Bool)

(assert (=> b!131721 m!198889))

(assert (=> b!131721 m!198841))

(declare-fun m!198891 () Bool)

(assert (=> b!131722 m!198891))

(declare-fun m!198893 () Bool)

(assert (=> b!131722 m!198893))

(declare-fun m!198895 () Bool)

(assert (=> b!131722 m!198895))

(assert (=> b!131722 m!198869))

(declare-fun m!198897 () Bool)

(assert (=> b!131726 m!198897))

(declare-fun m!198899 () Bool)

(assert (=> start!25806 m!198899))

(declare-fun m!198901 () Bool)

(assert (=> start!25806 m!198901))

(check-sat (not b!131727) (not b!131726) (not b!131722) (not b!131724) (not b!131732) (not b!131730) (not b!131719) (not start!25806) (not b!131728) (not b!131721) (not b!131723) (not b!131731) (not b!131720) (not b!131718))
