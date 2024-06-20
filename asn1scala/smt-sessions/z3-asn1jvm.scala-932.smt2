; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26368 () Bool)

(assert start!26368)

(declare-fun b!135156 () Bool)

(declare-fun res!112391 () Bool)

(declare-fun e!89712 () Bool)

(assert (=> b!135156 (=> (not res!112391) (not e!89712))))

(declare-datatypes ((array!6168 0))(
  ( (array!6169 (arr!3457 (Array (_ BitVec 32) (_ BitVec 8))) (size!2792 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4848 0))(
  ( (BitStream!4849 (buf!3185 array!6168) (currentByte!5982 (_ BitVec 32)) (currentBit!5977 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8422 0))(
  ( (Unit!8423) )
))
(declare-datatypes ((tuple2!11732 0))(
  ( (tuple2!11733 (_1!6182 Unit!8422) (_2!6182 BitStream!4848)) )
))
(declare-fun lt!209741 () tuple2!11732)

(declare-fun thiss!1634 () BitStream!4848)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!135156 (= res!112391 (= (bitIndex!0 (size!2792 (buf!3185 (_2!6182 lt!209741))) (currentByte!5982 (_2!6182 lt!209741)) (currentBit!5977 (_2!6182 lt!209741))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2792 (buf!3185 thiss!1634)) (currentByte!5982 thiss!1634) (currentBit!5977 thiss!1634)))))))

(declare-fun b!135157 () Bool)

(declare-fun e!89711 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!135157 (= e!89711 (invariant!0 (currentBit!5977 thiss!1634) (currentByte!5982 thiss!1634) (size!2792 (buf!3185 (_2!6182 lt!209741)))))))

(declare-fun b!135158 () Bool)

(declare-fun e!89714 () Bool)

(declare-datatypes ((tuple2!11734 0))(
  ( (tuple2!11735 (_1!6183 BitStream!4848) (_2!6183 (_ BitVec 8))) )
))
(declare-fun lt!209747 () tuple2!11734)

(declare-fun lt!209757 () tuple2!11734)

(assert (=> b!135158 (= e!89714 (= (_2!6183 lt!209747) (_2!6183 lt!209757)))))

(declare-fun b!135159 () Bool)

(declare-fun res!112387 () Bool)

(declare-fun e!89708 () Bool)

(assert (=> b!135159 (=> (not res!112387) (not e!89708))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!135159 (= res!112387 (bvslt from!447 to!404))))

(declare-fun b!135161 () Bool)

(declare-fun e!89713 () Bool)

(assert (=> b!135161 (= e!89713 true)))

(declare-datatypes ((tuple2!11736 0))(
  ( (tuple2!11737 (_1!6184 BitStream!4848) (_2!6184 array!6168)) )
))
(declare-fun lt!209758 () tuple2!11736)

(declare-fun lt!209753 () tuple2!11736)

(declare-fun arrayRangesEq!195 (array!6168 array!6168 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!135161 (arrayRangesEq!195 (_2!6184 lt!209758) (_2!6184 lt!209753) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!209754 () Unit!8422)

(declare-fun arrayRangesEqSymmetricLemma!8 (array!6168 array!6168 (_ BitVec 32) (_ BitVec 32)) Unit!8422)

(assert (=> b!135161 (= lt!209754 (arrayRangesEqSymmetricLemma!8 (_2!6184 lt!209753) (_2!6184 lt!209758) #b00000000000000000000000000000000 to!404))))

(declare-fun b!135162 () Bool)

(declare-fun e!89710 () Bool)

(declare-fun e!89707 () Bool)

(assert (=> b!135162 (= e!89710 e!89707)))

(declare-fun res!112392 () Bool)

(assert (=> b!135162 (=> (not res!112392) (not e!89707))))

(declare-fun lt!209755 () tuple2!11732)

(declare-fun lt!209736 () (_ BitVec 64))

(assert (=> b!135162 (= res!112392 (= (bitIndex!0 (size!2792 (buf!3185 (_2!6182 lt!209755))) (currentByte!5982 (_2!6182 lt!209755)) (currentBit!5977 (_2!6182 lt!209755))) (bvadd (bitIndex!0 (size!2792 (buf!3185 (_2!6182 lt!209741))) (currentByte!5982 (_2!6182 lt!209741)) (currentBit!5977 (_2!6182 lt!209741))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!209736))))))

(assert (=> b!135162 (= lt!209736 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!135163 () Bool)

(declare-fun res!112385 () Bool)

(assert (=> b!135163 (=> (not res!112385) (not e!89708))))

(assert (=> b!135163 (= res!112385 (invariant!0 (currentBit!5977 thiss!1634) (currentByte!5982 thiss!1634) (size!2792 (buf!3185 thiss!1634))))))

(declare-fun b!135164 () Bool)

(declare-fun arr!237 () array!6168)

(declare-fun lt!209743 () tuple2!11734)

(declare-datatypes ((tuple2!11738 0))(
  ( (tuple2!11739 (_1!6185 BitStream!4848) (_2!6185 BitStream!4848)) )
))
(declare-fun lt!209760 () tuple2!11738)

(assert (=> b!135164 (= e!89712 (and (= (_2!6183 lt!209743) (select (arr!3457 arr!237) from!447)) (= (_1!6183 lt!209743) (_2!6185 lt!209760))))))

(declare-fun readBytePure!0 (BitStream!4848) tuple2!11734)

(assert (=> b!135164 (= lt!209743 (readBytePure!0 (_1!6185 lt!209760)))))

(declare-fun reader!0 (BitStream!4848 BitStream!4848) tuple2!11738)

(assert (=> b!135164 (= lt!209760 (reader!0 thiss!1634 (_2!6182 lt!209741)))))

(declare-fun e!89706 () Bool)

(declare-fun lt!209761 () tuple2!11736)

(declare-fun b!135160 () Bool)

(assert (=> b!135160 (= e!89706 (not (arrayRangesEq!195 arr!237 (_2!6184 lt!209761) #b00000000000000000000000000000000 to!404)))))

(declare-fun res!112389 () Bool)

(assert (=> start!26368 (=> (not res!112389) (not e!89708))))

(assert (=> start!26368 (= res!112389 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2792 arr!237))))))

(assert (=> start!26368 e!89708))

(assert (=> start!26368 true))

(declare-fun array_inv!2581 (array!6168) Bool)

(assert (=> start!26368 (array_inv!2581 arr!237)))

(declare-fun e!89709 () Bool)

(declare-fun inv!12 (BitStream!4848) Bool)

(assert (=> start!26368 (and (inv!12 thiss!1634) e!89709)))

(declare-fun b!135165 () Bool)

(declare-fun res!112386 () Bool)

(assert (=> b!135165 (=> (not res!112386) (not e!89707))))

(declare-fun isPrefixOf!0 (BitStream!4848 BitStream!4848) Bool)

(assert (=> b!135165 (= res!112386 (isPrefixOf!0 (_2!6182 lt!209741) (_2!6182 lt!209755)))))

(declare-fun b!135166 () Bool)

(declare-fun res!112380 () Bool)

(assert (=> b!135166 (=> (not res!112380) (not e!89708))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!135166 (= res!112380 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2792 (buf!3185 thiss!1634))) ((_ sign_extend 32) (currentByte!5982 thiss!1634)) ((_ sign_extend 32) (currentBit!5977 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!135167 () Bool)

(assert (=> b!135167 (= e!89708 (not e!89713))))

(declare-fun res!112383 () Bool)

(assert (=> b!135167 (=> res!112383 e!89713)))

(assert (=> b!135167 (= res!112383 (not (arrayRangesEq!195 (_2!6184 lt!209753) (_2!6184 lt!209758) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!209750 () tuple2!11736)

(assert (=> b!135167 (arrayRangesEq!195 (_2!6184 lt!209753) (_2!6184 lt!209750) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!209759 () Unit!8422)

(declare-fun lt!209744 () tuple2!11738)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4848 array!6168 (_ BitVec 32) (_ BitVec 32)) Unit!8422)

(assert (=> b!135167 (= lt!209759 (readByteArrayLoopArrayPrefixLemma!0 (_1!6185 lt!209744) arr!237 from!447 to!404))))

(declare-fun lt!209737 () array!6168)

(declare-fun readByteArrayLoopPure!0 (BitStream!4848 array!6168 (_ BitVec 32) (_ BitVec 32)) tuple2!11736)

(declare-fun withMovedByteIndex!0 (BitStream!4848 (_ BitVec 32)) BitStream!4848)

(assert (=> b!135167 (= lt!209750 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6185 lt!209744) #b00000000000000000000000000000001) lt!209737 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!209756 () tuple2!11738)

(assert (=> b!135167 (= lt!209758 (readByteArrayLoopPure!0 (_1!6185 lt!209756) lt!209737 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!209742 () tuple2!11734)

(assert (=> b!135167 (= lt!209737 (array!6169 (store (arr!3457 arr!237) from!447 (_2!6183 lt!209742)) (size!2792 arr!237)))))

(declare-fun lt!209748 () (_ BitVec 32))

(assert (=> b!135167 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2792 (buf!3185 (_2!6182 lt!209755)))) ((_ sign_extend 32) (currentByte!5982 (_2!6182 lt!209741))) ((_ sign_extend 32) (currentBit!5977 (_2!6182 lt!209741))) lt!209748)))

(declare-fun lt!209746 () Unit!8422)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4848 array!6168 (_ BitVec 32)) Unit!8422)

(assert (=> b!135167 (= lt!209746 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6182 lt!209741) (buf!3185 (_2!6182 lt!209755)) lt!209748))))

(assert (=> b!135167 (= (_1!6184 lt!209753) (_2!6185 lt!209744))))

(assert (=> b!135167 (= lt!209753 (readByteArrayLoopPure!0 (_1!6185 lt!209744) arr!237 from!447 to!404))))

(assert (=> b!135167 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2792 (buf!3185 (_2!6182 lt!209755)))) ((_ sign_extend 32) (currentByte!5982 thiss!1634)) ((_ sign_extend 32) (currentBit!5977 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!209740 () Unit!8422)

(assert (=> b!135167 (= lt!209740 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3185 (_2!6182 lt!209755)) (bvsub to!404 from!447)))))

(assert (=> b!135167 (= (_2!6183 lt!209742) (select (arr!3457 arr!237) from!447))))

(assert (=> b!135167 (= lt!209742 (readBytePure!0 (_1!6185 lt!209744)))))

(assert (=> b!135167 (= lt!209756 (reader!0 (_2!6182 lt!209741) (_2!6182 lt!209755)))))

(assert (=> b!135167 (= lt!209744 (reader!0 thiss!1634 (_2!6182 lt!209755)))))

(assert (=> b!135167 e!89714))

(declare-fun res!112382 () Bool)

(assert (=> b!135167 (=> (not res!112382) (not e!89714))))

(assert (=> b!135167 (= res!112382 (= (bitIndex!0 (size!2792 (buf!3185 (_1!6183 lt!209747))) (currentByte!5982 (_1!6183 lt!209747)) (currentBit!5977 (_1!6183 lt!209747))) (bitIndex!0 (size!2792 (buf!3185 (_1!6183 lt!209757))) (currentByte!5982 (_1!6183 lt!209757)) (currentBit!5977 (_1!6183 lt!209757)))))))

(declare-fun lt!209738 () Unit!8422)

(declare-fun lt!209739 () BitStream!4848)

(declare-fun readBytePrefixLemma!0 (BitStream!4848 BitStream!4848) Unit!8422)

(assert (=> b!135167 (= lt!209738 (readBytePrefixLemma!0 lt!209739 (_2!6182 lt!209755)))))

(assert (=> b!135167 (= lt!209757 (readBytePure!0 (BitStream!4849 (buf!3185 (_2!6182 lt!209755)) (currentByte!5982 thiss!1634) (currentBit!5977 thiss!1634))))))

(assert (=> b!135167 (= lt!209747 (readBytePure!0 lt!209739))))

(assert (=> b!135167 (= lt!209739 (BitStream!4849 (buf!3185 (_2!6182 lt!209741)) (currentByte!5982 thiss!1634) (currentBit!5977 thiss!1634)))))

(assert (=> b!135167 e!89711))

(declare-fun res!112381 () Bool)

(assert (=> b!135167 (=> (not res!112381) (not e!89711))))

(assert (=> b!135167 (= res!112381 (isPrefixOf!0 thiss!1634 (_2!6182 lt!209755)))))

(declare-fun lt!209751 () Unit!8422)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4848 BitStream!4848 BitStream!4848) Unit!8422)

(assert (=> b!135167 (= lt!209751 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6182 lt!209741) (_2!6182 lt!209755)))))

(assert (=> b!135167 e!89710))

(declare-fun res!112384 () Bool)

(assert (=> b!135167 (=> (not res!112384) (not e!89710))))

(assert (=> b!135167 (= res!112384 (= (size!2792 (buf!3185 (_2!6182 lt!209741))) (size!2792 (buf!3185 (_2!6182 lt!209755)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4848 array!6168 (_ BitVec 32) (_ BitVec 32)) tuple2!11732)

(assert (=> b!135167 (= lt!209755 (appendByteArrayLoop!0 (_2!6182 lt!209741) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!135167 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2792 (buf!3185 (_2!6182 lt!209741)))) ((_ sign_extend 32) (currentByte!5982 (_2!6182 lt!209741))) ((_ sign_extend 32) (currentBit!5977 (_2!6182 lt!209741))) lt!209748)))

(assert (=> b!135167 (= lt!209748 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!209749 () Unit!8422)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4848 BitStream!4848 (_ BitVec 64) (_ BitVec 32)) Unit!8422)

(assert (=> b!135167 (= lt!209749 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6182 lt!209741) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!135167 e!89712))

(declare-fun res!112388 () Bool)

(assert (=> b!135167 (=> (not res!112388) (not e!89712))))

(assert (=> b!135167 (= res!112388 (= (size!2792 (buf!3185 thiss!1634)) (size!2792 (buf!3185 (_2!6182 lt!209741)))))))

(declare-fun appendByte!0 (BitStream!4848 (_ BitVec 8)) tuple2!11732)

(assert (=> b!135167 (= lt!209741 (appendByte!0 thiss!1634 (select (arr!3457 arr!237) from!447)))))

(declare-fun b!135168 () Bool)

(assert (=> b!135168 (= e!89707 (not e!89706))))

(declare-fun res!112379 () Bool)

(assert (=> b!135168 (=> res!112379 e!89706)))

(declare-fun lt!209745 () tuple2!11738)

(assert (=> b!135168 (= res!112379 (or (not (= (size!2792 (_2!6184 lt!209761)) (size!2792 arr!237))) (not (= (_1!6184 lt!209761) (_2!6185 lt!209745)))))))

(assert (=> b!135168 (= lt!209761 (readByteArrayLoopPure!0 (_1!6185 lt!209745) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!135168 (validate_offset_bits!1 ((_ sign_extend 32) (size!2792 (buf!3185 (_2!6182 lt!209755)))) ((_ sign_extend 32) (currentByte!5982 (_2!6182 lt!209741))) ((_ sign_extend 32) (currentBit!5977 (_2!6182 lt!209741))) lt!209736)))

(declare-fun lt!209752 () Unit!8422)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4848 array!6168 (_ BitVec 64)) Unit!8422)

(assert (=> b!135168 (= lt!209752 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6182 lt!209741) (buf!3185 (_2!6182 lt!209755)) lt!209736))))

(assert (=> b!135168 (= lt!209745 (reader!0 (_2!6182 lt!209741) (_2!6182 lt!209755)))))

(declare-fun b!135169 () Bool)

(declare-fun res!112390 () Bool)

(assert (=> b!135169 (=> (not res!112390) (not e!89712))))

(assert (=> b!135169 (= res!112390 (isPrefixOf!0 thiss!1634 (_2!6182 lt!209741)))))

(declare-fun b!135170 () Bool)

(assert (=> b!135170 (= e!89709 (array_inv!2581 (buf!3185 thiss!1634)))))

(assert (= (and start!26368 res!112389) b!135166))

(assert (= (and b!135166 res!112380) b!135159))

(assert (= (and b!135159 res!112387) b!135163))

(assert (= (and b!135163 res!112385) b!135167))

(assert (= (and b!135167 res!112388) b!135156))

(assert (= (and b!135156 res!112391) b!135169))

(assert (= (and b!135169 res!112390) b!135164))

(assert (= (and b!135167 res!112384) b!135162))

(assert (= (and b!135162 res!112392) b!135165))

(assert (= (and b!135165 res!112386) b!135168))

(assert (= (and b!135168 (not res!112379)) b!135160))

(assert (= (and b!135167 res!112381) b!135157))

(assert (= (and b!135167 res!112382) b!135158))

(assert (= (and b!135167 (not res!112383)) b!135161))

(assert (= start!26368 b!135170))

(declare-fun m!206043 () Bool)

(assert (=> b!135157 m!206043))

(declare-fun m!206045 () Bool)

(assert (=> b!135156 m!206045))

(declare-fun m!206047 () Bool)

(assert (=> b!135156 m!206047))

(declare-fun m!206049 () Bool)

(assert (=> b!135163 m!206049))

(declare-fun m!206051 () Bool)

(assert (=> b!135165 m!206051))

(declare-fun m!206053 () Bool)

(assert (=> b!135161 m!206053))

(declare-fun m!206055 () Bool)

(assert (=> b!135161 m!206055))

(declare-fun m!206057 () Bool)

(assert (=> b!135170 m!206057))

(declare-fun m!206059 () Bool)

(assert (=> b!135168 m!206059))

(declare-fun m!206061 () Bool)

(assert (=> b!135168 m!206061))

(declare-fun m!206063 () Bool)

(assert (=> b!135168 m!206063))

(declare-fun m!206065 () Bool)

(assert (=> b!135168 m!206065))

(declare-fun m!206067 () Bool)

(assert (=> b!135167 m!206067))

(declare-fun m!206069 () Bool)

(assert (=> b!135167 m!206069))

(declare-fun m!206071 () Bool)

(assert (=> b!135167 m!206071))

(declare-fun m!206073 () Bool)

(assert (=> b!135167 m!206073))

(declare-fun m!206075 () Bool)

(assert (=> b!135167 m!206075))

(declare-fun m!206077 () Bool)

(assert (=> b!135167 m!206077))

(declare-fun m!206079 () Bool)

(assert (=> b!135167 m!206079))

(declare-fun m!206081 () Bool)

(assert (=> b!135167 m!206081))

(declare-fun m!206083 () Bool)

(assert (=> b!135167 m!206083))

(declare-fun m!206085 () Bool)

(assert (=> b!135167 m!206085))

(declare-fun m!206087 () Bool)

(assert (=> b!135167 m!206087))

(declare-fun m!206089 () Bool)

(assert (=> b!135167 m!206089))

(declare-fun m!206091 () Bool)

(assert (=> b!135167 m!206091))

(declare-fun m!206093 () Bool)

(assert (=> b!135167 m!206093))

(declare-fun m!206095 () Bool)

(assert (=> b!135167 m!206095))

(assert (=> b!135167 m!206089))

(declare-fun m!206097 () Bool)

(assert (=> b!135167 m!206097))

(assert (=> b!135167 m!206065))

(declare-fun m!206099 () Bool)

(assert (=> b!135167 m!206099))

(assert (=> b!135167 m!206093))

(declare-fun m!206101 () Bool)

(assert (=> b!135167 m!206101))

(declare-fun m!206103 () Bool)

(assert (=> b!135167 m!206103))

(declare-fun m!206105 () Bool)

(assert (=> b!135167 m!206105))

(declare-fun m!206107 () Bool)

(assert (=> b!135167 m!206107))

(declare-fun m!206109 () Bool)

(assert (=> b!135167 m!206109))

(declare-fun m!206111 () Bool)

(assert (=> b!135167 m!206111))

(declare-fun m!206113 () Bool)

(assert (=> b!135167 m!206113))

(declare-fun m!206115 () Bool)

(assert (=> b!135167 m!206115))

(declare-fun m!206117 () Bool)

(assert (=> b!135167 m!206117))

(declare-fun m!206119 () Bool)

(assert (=> b!135160 m!206119))

(declare-fun m!206121 () Bool)

(assert (=> b!135166 m!206121))

(assert (=> b!135164 m!206089))

(declare-fun m!206123 () Bool)

(assert (=> b!135164 m!206123))

(declare-fun m!206125 () Bool)

(assert (=> b!135164 m!206125))

(declare-fun m!206127 () Bool)

(assert (=> b!135169 m!206127))

(declare-fun m!206129 () Bool)

(assert (=> b!135162 m!206129))

(assert (=> b!135162 m!206045))

(declare-fun m!206131 () Bool)

(assert (=> start!26368 m!206131))

(declare-fun m!206133 () Bool)

(assert (=> start!26368 m!206133))

(check-sat (not b!135162) (not b!135160) (not b!135170) (not b!135163) (not b!135165) (not b!135167) (not b!135164) (not b!135166) (not b!135168) (not b!135169) (not b!135157) (not start!26368) (not b!135156) (not b!135161))
