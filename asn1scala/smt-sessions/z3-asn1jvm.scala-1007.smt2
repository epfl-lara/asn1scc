; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28748 () Bool)

(assert start!28748)

(declare-fun b!148746 () Bool)

(declare-fun res!124522 () Bool)

(declare-fun e!99254 () Bool)

(assert (=> b!148746 (=> (not res!124522) (not e!99254))))

(declare-datatypes ((array!6670 0))(
  ( (array!6671 (arr!3801 (Array (_ BitVec 32) (_ BitVec 8))) (size!3017 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5292 0))(
  ( (BitStream!5293 (buf!3492 array!6670) (currentByte!6406 (_ BitVec 32)) (currentBit!6401 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5292)

(declare-datatypes ((Unit!9425 0))(
  ( (Unit!9426) )
))
(declare-datatypes ((tuple2!13214 0))(
  ( (tuple2!13215 (_1!6971 Unit!9425) (_2!6971 BitStream!5292)) )
))
(declare-fun lt!231974 () tuple2!13214)

(declare-fun isPrefixOf!0 (BitStream!5292 BitStream!5292) Bool)

(assert (=> b!148746 (= res!124522 (isPrefixOf!0 thiss!1634 (_2!6971 lt!231974)))))

(declare-fun b!148747 () Bool)

(declare-fun res!124523 () Bool)

(declare-fun e!99255 () Bool)

(assert (=> b!148747 (=> (not res!124523) (not e!99255))))

(declare-fun lt!231968 () tuple2!13214)

(assert (=> b!148747 (= res!124523 (isPrefixOf!0 (_2!6971 lt!231974) (_2!6971 lt!231968)))))

(declare-fun b!148748 () Bool)

(declare-fun res!124527 () Bool)

(assert (=> b!148748 (=> (not res!124527) (not e!99254))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!148748 (= res!124527 (= (bitIndex!0 (size!3017 (buf!3492 (_2!6971 lt!231974))) (currentByte!6406 (_2!6971 lt!231974)) (currentBit!6401 (_2!6971 lt!231974))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3017 (buf!3492 thiss!1634)) (currentByte!6406 thiss!1634) (currentBit!6401 thiss!1634)))))))

(declare-fun b!148749 () Bool)

(declare-fun e!99252 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!148749 (= e!99252 (invariant!0 (currentBit!6401 thiss!1634) (currentByte!6406 thiss!1634) (size!3017 (buf!3492 (_2!6971 lt!231974)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun b!148750 () Bool)

(declare-fun arr!237 () array!6670)

(declare-datatypes ((tuple2!13216 0))(
  ( (tuple2!13217 (_1!6972 BitStream!5292) (_2!6972 array!6670)) )
))
(declare-fun lt!231951 () tuple2!13216)

(declare-fun lt!231963 () tuple2!13216)

(declare-fun e!99251 () Bool)

(assert (=> b!148750 (= e!99251 (or (bvsgt #b00000000000000000000000000000000 to!404) (bvsgt (size!3017 arr!237) (size!3017 (_2!6972 lt!231963))) (bvsgt (size!3017 (_2!6972 lt!231963)) (size!3017 (_2!6972 lt!231951))) (bvsle to!404 (size!3017 (_2!6972 lt!231963)))))))

(declare-fun arrayRangesEq!333 (array!6670 array!6670 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!148750 (arrayRangesEq!333 (_2!6972 lt!231963) (_2!6972 lt!231951) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!231950 () Unit!9425)

(declare-fun arrayRangesEqSymmetricLemma!65 (array!6670 array!6670 (_ BitVec 32) (_ BitVec 32)) Unit!9425)

(assert (=> b!148750 (= lt!231950 (arrayRangesEqSymmetricLemma!65 (_2!6972 lt!231951) (_2!6972 lt!231963) #b00000000000000000000000000000000 to!404))))

(declare-fun b!148751 () Bool)

(declare-fun e!99253 () Bool)

(assert (=> b!148751 (= e!99255 (not e!99253))))

(declare-fun res!124529 () Bool)

(assert (=> b!148751 (=> res!124529 e!99253)))

(declare-datatypes ((tuple2!13218 0))(
  ( (tuple2!13219 (_1!6973 BitStream!5292) (_2!6973 BitStream!5292)) )
))
(declare-fun lt!231967 () tuple2!13218)

(declare-fun lt!231959 () tuple2!13216)

(assert (=> b!148751 (= res!124529 (or (not (= (size!3017 (_2!6972 lt!231959)) (size!3017 arr!237))) (not (= (_1!6972 lt!231959) (_2!6973 lt!231967)))))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!5292 array!6670 (_ BitVec 32) (_ BitVec 32)) tuple2!13216)

(assert (=> b!148751 (= lt!231959 (readByteArrayLoopPure!0 (_1!6973 lt!231967) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!231960 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!148751 (validate_offset_bits!1 ((_ sign_extend 32) (size!3017 (buf!3492 (_2!6971 lt!231968)))) ((_ sign_extend 32) (currentByte!6406 (_2!6971 lt!231974))) ((_ sign_extend 32) (currentBit!6401 (_2!6971 lt!231974))) lt!231960)))

(declare-fun lt!231966 () Unit!9425)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5292 array!6670 (_ BitVec 64)) Unit!9425)

(assert (=> b!148751 (= lt!231966 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6971 lt!231974) (buf!3492 (_2!6971 lt!231968)) lt!231960))))

(declare-fun reader!0 (BitStream!5292 BitStream!5292) tuple2!13218)

(assert (=> b!148751 (= lt!231967 (reader!0 (_2!6971 lt!231974) (_2!6971 lt!231968)))))

(declare-datatypes ((tuple2!13220 0))(
  ( (tuple2!13221 (_1!6974 BitStream!5292) (_2!6974 (_ BitVec 8))) )
))
(declare-fun lt!231970 () tuple2!13220)

(declare-fun lt!231961 () tuple2!13218)

(declare-fun b!148752 () Bool)

(assert (=> b!148752 (= e!99254 (and (= (_2!6974 lt!231970) (select (arr!3801 arr!237) from!447)) (= (_1!6974 lt!231970) (_2!6973 lt!231961))))))

(declare-fun readBytePure!0 (BitStream!5292) tuple2!13220)

(assert (=> b!148752 (= lt!231970 (readBytePure!0 (_1!6973 lt!231961)))))

(assert (=> b!148752 (= lt!231961 (reader!0 thiss!1634 (_2!6971 lt!231974)))))

(declare-fun b!148753 () Bool)

(declare-fun e!99249 () Bool)

(assert (=> b!148753 (= e!99249 (not e!99251))))

(declare-fun res!124533 () Bool)

(assert (=> b!148753 (=> res!124533 e!99251)))

(assert (=> b!148753 (= res!124533 (not (arrayRangesEq!333 (_2!6972 lt!231951) (_2!6972 lt!231963) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!231958 () tuple2!13216)

(assert (=> b!148753 (arrayRangesEq!333 (_2!6972 lt!231951) (_2!6972 lt!231958) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!231973 () Unit!9425)

(declare-fun lt!231965 () tuple2!13218)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5292 array!6670 (_ BitVec 32) (_ BitVec 32)) Unit!9425)

(assert (=> b!148753 (= lt!231973 (readByteArrayLoopArrayPrefixLemma!0 (_1!6973 lt!231965) arr!237 from!447 to!404))))

(declare-fun lt!231969 () array!6670)

(declare-fun withMovedByteIndex!0 (BitStream!5292 (_ BitVec 32)) BitStream!5292)

(assert (=> b!148753 (= lt!231958 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6973 lt!231965) #b00000000000000000000000000000001) lt!231969 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!231975 () tuple2!13218)

(assert (=> b!148753 (= lt!231963 (readByteArrayLoopPure!0 (_1!6973 lt!231975) lt!231969 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!231972 () tuple2!13220)

(assert (=> b!148753 (= lt!231969 (array!6671 (store (arr!3801 arr!237) from!447 (_2!6974 lt!231972)) (size!3017 arr!237)))))

(declare-fun lt!231964 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!148753 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3017 (buf!3492 (_2!6971 lt!231968)))) ((_ sign_extend 32) (currentByte!6406 (_2!6971 lt!231974))) ((_ sign_extend 32) (currentBit!6401 (_2!6971 lt!231974))) lt!231964)))

(declare-fun lt!231954 () Unit!9425)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5292 array!6670 (_ BitVec 32)) Unit!9425)

(assert (=> b!148753 (= lt!231954 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6971 lt!231974) (buf!3492 (_2!6971 lt!231968)) lt!231964))))

(assert (=> b!148753 (= (_1!6972 lt!231951) (_2!6973 lt!231965))))

(assert (=> b!148753 (= lt!231951 (readByteArrayLoopPure!0 (_1!6973 lt!231965) arr!237 from!447 to!404))))

(assert (=> b!148753 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3017 (buf!3492 (_2!6971 lt!231968)))) ((_ sign_extend 32) (currentByte!6406 thiss!1634)) ((_ sign_extend 32) (currentBit!6401 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!231971 () Unit!9425)

(assert (=> b!148753 (= lt!231971 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3492 (_2!6971 lt!231968)) (bvsub to!404 from!447)))))

(assert (=> b!148753 (= (_2!6974 lt!231972) (select (arr!3801 arr!237) from!447))))

(assert (=> b!148753 (= lt!231972 (readBytePure!0 (_1!6973 lt!231965)))))

(assert (=> b!148753 (= lt!231975 (reader!0 (_2!6971 lt!231974) (_2!6971 lt!231968)))))

(assert (=> b!148753 (= lt!231965 (reader!0 thiss!1634 (_2!6971 lt!231968)))))

(declare-fun e!99258 () Bool)

(assert (=> b!148753 e!99258))

(declare-fun res!124534 () Bool)

(assert (=> b!148753 (=> (not res!124534) (not e!99258))))

(declare-fun lt!231956 () tuple2!13220)

(declare-fun lt!231953 () tuple2!13220)

(assert (=> b!148753 (= res!124534 (= (bitIndex!0 (size!3017 (buf!3492 (_1!6974 lt!231956))) (currentByte!6406 (_1!6974 lt!231956)) (currentBit!6401 (_1!6974 lt!231956))) (bitIndex!0 (size!3017 (buf!3492 (_1!6974 lt!231953))) (currentByte!6406 (_1!6974 lt!231953)) (currentBit!6401 (_1!6974 lt!231953)))))))

(declare-fun lt!231955 () Unit!9425)

(declare-fun lt!231952 () BitStream!5292)

(declare-fun readBytePrefixLemma!0 (BitStream!5292 BitStream!5292) Unit!9425)

(assert (=> b!148753 (= lt!231955 (readBytePrefixLemma!0 lt!231952 (_2!6971 lt!231968)))))

(assert (=> b!148753 (= lt!231953 (readBytePure!0 (BitStream!5293 (buf!3492 (_2!6971 lt!231968)) (currentByte!6406 thiss!1634) (currentBit!6401 thiss!1634))))))

(assert (=> b!148753 (= lt!231956 (readBytePure!0 lt!231952))))

(assert (=> b!148753 (= lt!231952 (BitStream!5293 (buf!3492 (_2!6971 lt!231974)) (currentByte!6406 thiss!1634) (currentBit!6401 thiss!1634)))))

(assert (=> b!148753 e!99252))

(declare-fun res!124525 () Bool)

(assert (=> b!148753 (=> (not res!124525) (not e!99252))))

(assert (=> b!148753 (= res!124525 (isPrefixOf!0 thiss!1634 (_2!6971 lt!231968)))))

(declare-fun lt!231962 () Unit!9425)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5292 BitStream!5292 BitStream!5292) Unit!9425)

(assert (=> b!148753 (= lt!231962 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6971 lt!231974) (_2!6971 lt!231968)))))

(declare-fun e!99257 () Bool)

(assert (=> b!148753 e!99257))

(declare-fun res!124531 () Bool)

(assert (=> b!148753 (=> (not res!124531) (not e!99257))))

(assert (=> b!148753 (= res!124531 (= (size!3017 (buf!3492 (_2!6971 lt!231974))) (size!3017 (buf!3492 (_2!6971 lt!231968)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5292 array!6670 (_ BitVec 32) (_ BitVec 32)) tuple2!13214)

(assert (=> b!148753 (= lt!231968 (appendByteArrayLoop!0 (_2!6971 lt!231974) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!148753 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3017 (buf!3492 (_2!6971 lt!231974)))) ((_ sign_extend 32) (currentByte!6406 (_2!6971 lt!231974))) ((_ sign_extend 32) (currentBit!6401 (_2!6971 lt!231974))) lt!231964)))

(assert (=> b!148753 (= lt!231964 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!231957 () Unit!9425)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5292 BitStream!5292 (_ BitVec 64) (_ BitVec 32)) Unit!9425)

(assert (=> b!148753 (= lt!231957 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6971 lt!231974) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!148753 e!99254))

(declare-fun res!124530 () Bool)

(assert (=> b!148753 (=> (not res!124530) (not e!99254))))

(assert (=> b!148753 (= res!124530 (= (size!3017 (buf!3492 thiss!1634)) (size!3017 (buf!3492 (_2!6971 lt!231974)))))))

(declare-fun appendByte!0 (BitStream!5292 (_ BitVec 8)) tuple2!13214)

(assert (=> b!148753 (= lt!231974 (appendByte!0 thiss!1634 (select (arr!3801 arr!237) from!447)))))

(declare-fun b!148755 () Bool)

(assert (=> b!148755 (= e!99257 e!99255)))

(declare-fun res!124524 () Bool)

(assert (=> b!148755 (=> (not res!124524) (not e!99255))))

(assert (=> b!148755 (= res!124524 (= (bitIndex!0 (size!3017 (buf!3492 (_2!6971 lt!231968))) (currentByte!6406 (_2!6971 lt!231968)) (currentBit!6401 (_2!6971 lt!231968))) (bvadd (bitIndex!0 (size!3017 (buf!3492 (_2!6971 lt!231974))) (currentByte!6406 (_2!6971 lt!231974)) (currentBit!6401 (_2!6971 lt!231974))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!231960))))))

(assert (=> b!148755 (= lt!231960 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!148756 () Bool)

(assert (=> b!148756 (= e!99253 (not (arrayRangesEq!333 arr!237 (_2!6972 lt!231959) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!148757 () Bool)

(declare-fun e!99259 () Bool)

(declare-fun array_inv!2806 (array!6670) Bool)

(assert (=> b!148757 (= e!99259 (array_inv!2806 (buf!3492 thiss!1634)))))

(declare-fun b!148758 () Bool)

(declare-fun res!124528 () Bool)

(assert (=> b!148758 (=> (not res!124528) (not e!99249))))

(assert (=> b!148758 (= res!124528 (bvslt from!447 to!404))))

(declare-fun b!148759 () Bool)

(assert (=> b!148759 (= e!99258 (= (_2!6974 lt!231956) (_2!6974 lt!231953)))))

(declare-fun b!148760 () Bool)

(declare-fun res!124526 () Bool)

(assert (=> b!148760 (=> (not res!124526) (not e!99249))))

(assert (=> b!148760 (= res!124526 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3017 (buf!3492 thiss!1634))) ((_ sign_extend 32) (currentByte!6406 thiss!1634)) ((_ sign_extend 32) (currentBit!6401 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun res!124535 () Bool)

(assert (=> start!28748 (=> (not res!124535) (not e!99249))))

(assert (=> start!28748 (= res!124535 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3017 arr!237))))))

(assert (=> start!28748 e!99249))

(assert (=> start!28748 true))

(assert (=> start!28748 (array_inv!2806 arr!237)))

(declare-fun inv!12 (BitStream!5292) Bool)

(assert (=> start!28748 (and (inv!12 thiss!1634) e!99259)))

(declare-fun b!148754 () Bool)

(declare-fun res!124532 () Bool)

(assert (=> b!148754 (=> (not res!124532) (not e!99249))))

(assert (=> b!148754 (= res!124532 (invariant!0 (currentBit!6401 thiss!1634) (currentByte!6406 thiss!1634) (size!3017 (buf!3492 thiss!1634))))))

(assert (= (and start!28748 res!124535) b!148760))

(assert (= (and b!148760 res!124526) b!148758))

(assert (= (and b!148758 res!124528) b!148754))

(assert (= (and b!148754 res!124532) b!148753))

(assert (= (and b!148753 res!124530) b!148748))

(assert (= (and b!148748 res!124527) b!148746))

(assert (= (and b!148746 res!124522) b!148752))

(assert (= (and b!148753 res!124531) b!148755))

(assert (= (and b!148755 res!124524) b!148747))

(assert (= (and b!148747 res!124523) b!148751))

(assert (= (and b!148751 (not res!124529)) b!148756))

(assert (= (and b!148753 res!124525) b!148749))

(assert (= (and b!148753 res!124534) b!148759))

(assert (= (and b!148753 (not res!124533)) b!148750))

(assert (= start!28748 b!148757))

(declare-fun m!231113 () Bool)

(assert (=> b!148750 m!231113))

(declare-fun m!231115 () Bool)

(assert (=> b!148750 m!231115))

(declare-fun m!231117 () Bool)

(assert (=> b!148751 m!231117))

(declare-fun m!231119 () Bool)

(assert (=> b!148751 m!231119))

(declare-fun m!231121 () Bool)

(assert (=> b!148751 m!231121))

(declare-fun m!231123 () Bool)

(assert (=> b!148751 m!231123))

(declare-fun m!231125 () Bool)

(assert (=> b!148747 m!231125))

(declare-fun m!231127 () Bool)

(assert (=> start!28748 m!231127))

(declare-fun m!231129 () Bool)

(assert (=> start!28748 m!231129))

(declare-fun m!231131 () Bool)

(assert (=> b!148749 m!231131))

(declare-fun m!231133 () Bool)

(assert (=> b!148746 m!231133))

(declare-fun m!231135 () Bool)

(assert (=> b!148752 m!231135))

(declare-fun m!231137 () Bool)

(assert (=> b!148752 m!231137))

(declare-fun m!231139 () Bool)

(assert (=> b!148752 m!231139))

(declare-fun m!231141 () Bool)

(assert (=> b!148760 m!231141))

(declare-fun m!231143 () Bool)

(assert (=> b!148754 m!231143))

(declare-fun m!231145 () Bool)

(assert (=> b!148756 m!231145))

(declare-fun m!231147 () Bool)

(assert (=> b!148757 m!231147))

(declare-fun m!231149 () Bool)

(assert (=> b!148748 m!231149))

(declare-fun m!231151 () Bool)

(assert (=> b!148748 m!231151))

(declare-fun m!231153 () Bool)

(assert (=> b!148755 m!231153))

(assert (=> b!148755 m!231149))

(declare-fun m!231155 () Bool)

(assert (=> b!148753 m!231155))

(declare-fun m!231157 () Bool)

(assert (=> b!148753 m!231157))

(declare-fun m!231159 () Bool)

(assert (=> b!148753 m!231159))

(declare-fun m!231161 () Bool)

(assert (=> b!148753 m!231161))

(declare-fun m!231163 () Bool)

(assert (=> b!148753 m!231163))

(declare-fun m!231165 () Bool)

(assert (=> b!148753 m!231165))

(declare-fun m!231167 () Bool)

(assert (=> b!148753 m!231167))

(declare-fun m!231169 () Bool)

(assert (=> b!148753 m!231169))

(assert (=> b!148753 m!231123))

(declare-fun m!231171 () Bool)

(assert (=> b!148753 m!231171))

(declare-fun m!231173 () Bool)

(assert (=> b!148753 m!231173))

(declare-fun m!231175 () Bool)

(assert (=> b!148753 m!231175))

(declare-fun m!231177 () Bool)

(assert (=> b!148753 m!231177))

(assert (=> b!148753 m!231135))

(declare-fun m!231179 () Bool)

(assert (=> b!148753 m!231179))

(declare-fun m!231181 () Bool)

(assert (=> b!148753 m!231181))

(declare-fun m!231183 () Bool)

(assert (=> b!148753 m!231183))

(declare-fun m!231185 () Bool)

(assert (=> b!148753 m!231185))

(declare-fun m!231187 () Bool)

(assert (=> b!148753 m!231187))

(declare-fun m!231189 () Bool)

(assert (=> b!148753 m!231189))

(declare-fun m!231191 () Bool)

(assert (=> b!148753 m!231191))

(assert (=> b!148753 m!231155))

(declare-fun m!231193 () Bool)

(assert (=> b!148753 m!231193))

(declare-fun m!231195 () Bool)

(assert (=> b!148753 m!231195))

(declare-fun m!231197 () Bool)

(assert (=> b!148753 m!231197))

(declare-fun m!231199 () Bool)

(assert (=> b!148753 m!231199))

(declare-fun m!231201 () Bool)

(assert (=> b!148753 m!231201))

(declare-fun m!231203 () Bool)

(assert (=> b!148753 m!231203))

(assert (=> b!148753 m!231135))

(check-sat (not b!148747) (not b!148756) (not b!148748) (not b!148757) (not start!28748) (not b!148752) (not b!148755) (not b!148750) (not b!148749) (not b!148753) (not b!148760) (not b!148754) (not b!148751) (not b!148746))
(check-sat)
