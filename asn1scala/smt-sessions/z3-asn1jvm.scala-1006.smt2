; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28544 () Bool)

(assert start!28544)

(declare-fun b!147871 () Bool)

(declare-fun res!123773 () Bool)

(declare-fun e!98644 () Bool)

(assert (=> b!147871 (=> (not res!123773) (not e!98644))))

(declare-datatypes ((array!6661 0))(
  ( (array!6662 (arr!3783 (Array (_ BitVec 32) (_ BitVec 8))) (size!3014 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5286 0))(
  ( (BitStream!5287 (buf!3479 array!6661) (currentByte!6387 (_ BitVec 32)) (currentBit!6382 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5286)

(declare-datatypes ((Unit!9316 0))(
  ( (Unit!9317) )
))
(declare-datatypes ((tuple2!13180 0))(
  ( (tuple2!13181 (_1!6949 Unit!9316) (_2!6949 BitStream!5286)) )
))
(declare-fun lt!230195 () tuple2!13180)

(declare-fun isPrefixOf!0 (BitStream!5286 BitStream!5286) Bool)

(assert (=> b!147871 (= res!123773 (isPrefixOf!0 thiss!1634 (_2!6949 lt!230195)))))

(declare-fun res!123769 () Bool)

(declare-fun e!98649 () Bool)

(assert (=> start!28544 (=> (not res!123769) (not e!98649))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arr!237 () array!6661)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!28544 (= res!123769 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3014 arr!237))))))

(assert (=> start!28544 e!98649))

(assert (=> start!28544 true))

(declare-fun array_inv!2803 (array!6661) Bool)

(assert (=> start!28544 (array_inv!2803 arr!237)))

(declare-fun e!98646 () Bool)

(declare-fun inv!12 (BitStream!5286) Bool)

(assert (=> start!28544 (and (inv!12 thiss!1634) e!98646)))

(declare-fun b!147872 () Bool)

(declare-fun e!98643 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!147872 (= e!98643 (invariant!0 (currentBit!6382 thiss!1634) (currentByte!6387 thiss!1634) (size!3014 (buf!3479 (_2!6949 lt!230195)))))))

(declare-fun b!147873 () Bool)

(declare-fun res!123761 () Bool)

(assert (=> b!147873 (=> (not res!123761) (not e!98649))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!147873 (= res!123761 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3014 (buf!3479 thiss!1634))) ((_ sign_extend 32) (currentByte!6387 thiss!1634)) ((_ sign_extend 32) (currentBit!6382 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!147874 () Bool)

(declare-datatypes ((tuple2!13182 0))(
  ( (tuple2!13183 (_1!6950 BitStream!5286) (_2!6950 BitStream!5286)) )
))
(declare-fun lt!230183 () tuple2!13182)

(declare-datatypes ((tuple2!13184 0))(
  ( (tuple2!13185 (_1!6951 BitStream!5286) (_2!6951 (_ BitVec 8))) )
))
(declare-fun lt!230193 () tuple2!13184)

(assert (=> b!147874 (= e!98644 (and (= (_2!6951 lt!230193) (select (arr!3783 arr!237) from!447)) (= (_1!6951 lt!230193) (_2!6950 lt!230183))))))

(declare-fun readBytePure!0 (BitStream!5286) tuple2!13184)

(assert (=> b!147874 (= lt!230193 (readBytePure!0 (_1!6950 lt!230183)))))

(declare-fun reader!0 (BitStream!5286 BitStream!5286) tuple2!13182)

(assert (=> b!147874 (= lt!230183 (reader!0 thiss!1634 (_2!6949 lt!230195)))))

(declare-datatypes ((tuple2!13186 0))(
  ( (tuple2!13187 (_1!6952 BitStream!5286) (_2!6952 array!6661)) )
))
(declare-fun lt!230185 () tuple2!13186)

(declare-fun b!147875 () Bool)

(declare-fun lt!230198 () tuple2!13186)

(declare-fun e!98639 () Bool)

(assert (=> b!147875 (= e!98639 (or (bvsgt #b00000000000000000000000000000000 to!404) (and (bvsle (size!3014 arr!237) (size!3014 (_2!6952 lt!230185))) (bvsle (size!3014 (_2!6952 lt!230185)) (size!3014 (_2!6952 lt!230198))))))))

(declare-fun arrayRangesEq!330 (array!6661 array!6661 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!147875 (arrayRangesEq!330 (_2!6952 lt!230185) (_2!6952 lt!230198) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!230176 () Unit!9316)

(declare-fun arrayRangesEqSymmetricLemma!62 (array!6661 array!6661 (_ BitVec 32) (_ BitVec 32)) Unit!9316)

(assert (=> b!147875 (= lt!230176 (arrayRangesEqSymmetricLemma!62 (_2!6952 lt!230198) (_2!6952 lt!230185) #b00000000000000000000000000000000 to!404))))

(declare-fun b!147876 () Bool)

(declare-fun res!123768 () Bool)

(assert (=> b!147876 (=> (not res!123768) (not e!98644))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!147876 (= res!123768 (= (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230195))) (currentByte!6387 (_2!6949 lt!230195)) (currentBit!6382 (_2!6949 lt!230195))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3014 (buf!3479 thiss!1634)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634)))))))

(declare-fun b!147877 () Bool)

(declare-fun e!98641 () Bool)

(declare-fun lt!230180 () tuple2!13184)

(declare-fun lt!230200 () tuple2!13184)

(assert (=> b!147877 (= e!98641 (= (_2!6951 lt!230180) (_2!6951 lt!230200)))))

(declare-fun b!147878 () Bool)

(declare-fun res!123766 () Bool)

(assert (=> b!147878 (=> (not res!123766) (not e!98649))))

(assert (=> b!147878 (= res!123766 (bvslt from!447 to!404))))

(declare-fun b!147879 () Bool)

(assert (=> b!147879 (= e!98646 (array_inv!2803 (buf!3479 thiss!1634)))))

(declare-fun b!147880 () Bool)

(declare-fun res!123767 () Bool)

(declare-fun e!98648 () Bool)

(assert (=> b!147880 (=> (not res!123767) (not e!98648))))

(declare-fun lt!230188 () tuple2!13180)

(assert (=> b!147880 (= res!123767 (isPrefixOf!0 (_2!6949 lt!230195) (_2!6949 lt!230188)))))

(declare-fun b!147881 () Bool)

(declare-fun e!98645 () Bool)

(assert (=> b!147881 (= e!98645 e!98648)))

(declare-fun res!123770 () Bool)

(assert (=> b!147881 (=> (not res!123770) (not e!98648))))

(declare-fun lt!230189 () (_ BitVec 64))

(assert (=> b!147881 (= res!123770 (= (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230188))) (currentByte!6387 (_2!6949 lt!230188)) (currentBit!6382 (_2!6949 lt!230188))) (bvadd (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230195))) (currentByte!6387 (_2!6949 lt!230195)) (currentBit!6382 (_2!6949 lt!230195))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!230189))))))

(assert (=> b!147881 (= lt!230189 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!147882 () Bool)

(declare-fun e!98640 () Bool)

(assert (=> b!147882 (= e!98648 (not e!98640))))

(declare-fun res!123760 () Bool)

(assert (=> b!147882 (=> res!123760 e!98640)))

(declare-fun lt!230182 () tuple2!13186)

(declare-fun lt!230194 () tuple2!13182)

(assert (=> b!147882 (= res!123760 (or (not (= (size!3014 (_2!6952 lt!230182)) (size!3014 arr!237))) (not (= (_1!6952 lt!230182) (_2!6950 lt!230194)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5286 array!6661 (_ BitVec 32) (_ BitVec 32)) tuple2!13186)

(assert (=> b!147882 (= lt!230182 (readByteArrayLoopPure!0 (_1!6950 lt!230194) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!147882 (validate_offset_bits!1 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230188)))) ((_ sign_extend 32) (currentByte!6387 (_2!6949 lt!230195))) ((_ sign_extend 32) (currentBit!6382 (_2!6949 lt!230195))) lt!230189)))

(declare-fun lt!230179 () Unit!9316)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5286 array!6661 (_ BitVec 64)) Unit!9316)

(assert (=> b!147882 (= lt!230179 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6949 lt!230195) (buf!3479 (_2!6949 lt!230188)) lt!230189))))

(assert (=> b!147882 (= lt!230194 (reader!0 (_2!6949 lt!230195) (_2!6949 lt!230188)))))

(declare-fun b!147883 () Bool)

(declare-fun res!123772 () Bool)

(assert (=> b!147883 (=> (not res!123772) (not e!98649))))

(assert (=> b!147883 (= res!123772 (invariant!0 (currentBit!6382 thiss!1634) (currentByte!6387 thiss!1634) (size!3014 (buf!3479 thiss!1634))))))

(declare-fun b!147884 () Bool)

(assert (=> b!147884 (= e!98640 (not (arrayRangesEq!330 arr!237 (_2!6952 lt!230182) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!147885 () Bool)

(assert (=> b!147885 (= e!98649 (not e!98639))))

(declare-fun res!123771 () Bool)

(assert (=> b!147885 (=> res!123771 e!98639)))

(assert (=> b!147885 (= res!123771 (not (arrayRangesEq!330 (_2!6952 lt!230198) (_2!6952 lt!230185) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!230190 () tuple2!13186)

(assert (=> b!147885 (arrayRangesEq!330 (_2!6952 lt!230198) (_2!6952 lt!230190) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!230187 () Unit!9316)

(declare-fun lt!230201 () tuple2!13182)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5286 array!6661 (_ BitVec 32) (_ BitVec 32)) Unit!9316)

(assert (=> b!147885 (= lt!230187 (readByteArrayLoopArrayPrefixLemma!0 (_1!6950 lt!230201) arr!237 from!447 to!404))))

(declare-fun lt!230178 () array!6661)

(declare-fun withMovedByteIndex!0 (BitStream!5286 (_ BitVec 32)) BitStream!5286)

(assert (=> b!147885 (= lt!230190 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6950 lt!230201) #b00000000000000000000000000000001) lt!230178 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!230177 () tuple2!13182)

(assert (=> b!147885 (= lt!230185 (readByteArrayLoopPure!0 (_1!6950 lt!230177) lt!230178 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!230186 () tuple2!13184)

(assert (=> b!147885 (= lt!230178 (array!6662 (store (arr!3783 arr!237) from!447 (_2!6951 lt!230186)) (size!3014 arr!237)))))

(declare-fun lt!230199 () (_ BitVec 32))

(assert (=> b!147885 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230188)))) ((_ sign_extend 32) (currentByte!6387 (_2!6949 lt!230195))) ((_ sign_extend 32) (currentBit!6382 (_2!6949 lt!230195))) lt!230199)))

(declare-fun lt!230196 () Unit!9316)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5286 array!6661 (_ BitVec 32)) Unit!9316)

(assert (=> b!147885 (= lt!230196 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6949 lt!230195) (buf!3479 (_2!6949 lt!230188)) lt!230199))))

(assert (=> b!147885 (= (_1!6952 lt!230198) (_2!6950 lt!230201))))

(assert (=> b!147885 (= lt!230198 (readByteArrayLoopPure!0 (_1!6950 lt!230201) arr!237 from!447 to!404))))

(assert (=> b!147885 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230188)))) ((_ sign_extend 32) (currentByte!6387 thiss!1634)) ((_ sign_extend 32) (currentBit!6382 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!230191 () Unit!9316)

(assert (=> b!147885 (= lt!230191 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3479 (_2!6949 lt!230188)) (bvsub to!404 from!447)))))

(assert (=> b!147885 (= (_2!6951 lt!230186) (select (arr!3783 arr!237) from!447))))

(assert (=> b!147885 (= lt!230186 (readBytePure!0 (_1!6950 lt!230201)))))

(assert (=> b!147885 (= lt!230177 (reader!0 (_2!6949 lt!230195) (_2!6949 lt!230188)))))

(assert (=> b!147885 (= lt!230201 (reader!0 thiss!1634 (_2!6949 lt!230188)))))

(assert (=> b!147885 e!98641))

(declare-fun res!123765 () Bool)

(assert (=> b!147885 (=> (not res!123765) (not e!98641))))

(assert (=> b!147885 (= res!123765 (= (bitIndex!0 (size!3014 (buf!3479 (_1!6951 lt!230180))) (currentByte!6387 (_1!6951 lt!230180)) (currentBit!6382 (_1!6951 lt!230180))) (bitIndex!0 (size!3014 (buf!3479 (_1!6951 lt!230200))) (currentByte!6387 (_1!6951 lt!230200)) (currentBit!6382 (_1!6951 lt!230200)))))))

(declare-fun lt!230197 () Unit!9316)

(declare-fun lt!230181 () BitStream!5286)

(declare-fun readBytePrefixLemma!0 (BitStream!5286 BitStream!5286) Unit!9316)

(assert (=> b!147885 (= lt!230197 (readBytePrefixLemma!0 lt!230181 (_2!6949 lt!230188)))))

(assert (=> b!147885 (= lt!230200 (readBytePure!0 (BitStream!5287 (buf!3479 (_2!6949 lt!230188)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634))))))

(assert (=> b!147885 (= lt!230180 (readBytePure!0 lt!230181))))

(assert (=> b!147885 (= lt!230181 (BitStream!5287 (buf!3479 (_2!6949 lt!230195)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634)))))

(assert (=> b!147885 e!98643))

(declare-fun res!123763 () Bool)

(assert (=> b!147885 (=> (not res!123763) (not e!98643))))

(assert (=> b!147885 (= res!123763 (isPrefixOf!0 thiss!1634 (_2!6949 lt!230188)))))

(declare-fun lt!230192 () Unit!9316)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5286 BitStream!5286 BitStream!5286) Unit!9316)

(assert (=> b!147885 (= lt!230192 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6949 lt!230195) (_2!6949 lt!230188)))))

(assert (=> b!147885 e!98645))

(declare-fun res!123764 () Bool)

(assert (=> b!147885 (=> (not res!123764) (not e!98645))))

(assert (=> b!147885 (= res!123764 (= (size!3014 (buf!3479 (_2!6949 lt!230195))) (size!3014 (buf!3479 (_2!6949 lt!230188)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5286 array!6661 (_ BitVec 32) (_ BitVec 32)) tuple2!13180)

(assert (=> b!147885 (= lt!230188 (appendByteArrayLoop!0 (_2!6949 lt!230195) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!147885 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230195)))) ((_ sign_extend 32) (currentByte!6387 (_2!6949 lt!230195))) ((_ sign_extend 32) (currentBit!6382 (_2!6949 lt!230195))) lt!230199)))

(assert (=> b!147885 (= lt!230199 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!230184 () Unit!9316)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5286 BitStream!5286 (_ BitVec 64) (_ BitVec 32)) Unit!9316)

(assert (=> b!147885 (= lt!230184 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6949 lt!230195) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!147885 e!98644))

(declare-fun res!123762 () Bool)

(assert (=> b!147885 (=> (not res!123762) (not e!98644))))

(assert (=> b!147885 (= res!123762 (= (size!3014 (buf!3479 thiss!1634)) (size!3014 (buf!3479 (_2!6949 lt!230195)))))))

(declare-fun appendByte!0 (BitStream!5286 (_ BitVec 8)) tuple2!13180)

(assert (=> b!147885 (= lt!230195 (appendByte!0 thiss!1634 (select (arr!3783 arr!237) from!447)))))

(assert (= (and start!28544 res!123769) b!147873))

(assert (= (and b!147873 res!123761) b!147878))

(assert (= (and b!147878 res!123766) b!147883))

(assert (= (and b!147883 res!123772) b!147885))

(assert (= (and b!147885 res!123762) b!147876))

(assert (= (and b!147876 res!123768) b!147871))

(assert (= (and b!147871 res!123773) b!147874))

(assert (= (and b!147885 res!123764) b!147881))

(assert (= (and b!147881 res!123770) b!147880))

(assert (= (and b!147880 res!123767) b!147882))

(assert (= (and b!147882 (not res!123760)) b!147884))

(assert (= (and b!147885 res!123763) b!147872))

(assert (= (and b!147885 res!123765) b!147877))

(assert (= (and b!147885 (not res!123771)) b!147875))

(assert (= start!28544 b!147879))

(declare-fun m!229103 () Bool)

(assert (=> b!147880 m!229103))

(declare-fun m!229105 () Bool)

(assert (=> b!147883 m!229105))

(declare-fun m!229107 () Bool)

(assert (=> b!147879 m!229107))

(declare-fun m!229109 () Bool)

(assert (=> b!147884 m!229109))

(declare-fun m!229111 () Bool)

(assert (=> b!147882 m!229111))

(declare-fun m!229113 () Bool)

(assert (=> b!147882 m!229113))

(declare-fun m!229115 () Bool)

(assert (=> b!147882 m!229115))

(declare-fun m!229117 () Bool)

(assert (=> b!147882 m!229117))

(declare-fun m!229119 () Bool)

(assert (=> start!28544 m!229119))

(declare-fun m!229121 () Bool)

(assert (=> start!28544 m!229121))

(declare-fun m!229123 () Bool)

(assert (=> b!147873 m!229123))

(declare-fun m!229125 () Bool)

(assert (=> b!147871 m!229125))

(declare-fun m!229127 () Bool)

(assert (=> b!147876 m!229127))

(declare-fun m!229129 () Bool)

(assert (=> b!147876 m!229129))

(declare-fun m!229131 () Bool)

(assert (=> b!147885 m!229131))

(declare-fun m!229133 () Bool)

(assert (=> b!147885 m!229133))

(declare-fun m!229135 () Bool)

(assert (=> b!147885 m!229135))

(declare-fun m!229137 () Bool)

(assert (=> b!147885 m!229137))

(declare-fun m!229139 () Bool)

(assert (=> b!147885 m!229139))

(declare-fun m!229141 () Bool)

(assert (=> b!147885 m!229141))

(declare-fun m!229143 () Bool)

(assert (=> b!147885 m!229143))

(declare-fun m!229145 () Bool)

(assert (=> b!147885 m!229145))

(declare-fun m!229147 () Bool)

(assert (=> b!147885 m!229147))

(declare-fun m!229149 () Bool)

(assert (=> b!147885 m!229149))

(assert (=> b!147885 m!229117))

(declare-fun m!229151 () Bool)

(assert (=> b!147885 m!229151))

(declare-fun m!229153 () Bool)

(assert (=> b!147885 m!229153))

(declare-fun m!229155 () Bool)

(assert (=> b!147885 m!229155))

(declare-fun m!229157 () Bool)

(assert (=> b!147885 m!229157))

(declare-fun m!229159 () Bool)

(assert (=> b!147885 m!229159))

(declare-fun m!229161 () Bool)

(assert (=> b!147885 m!229161))

(declare-fun m!229163 () Bool)

(assert (=> b!147885 m!229163))

(declare-fun m!229165 () Bool)

(assert (=> b!147885 m!229165))

(declare-fun m!229167 () Bool)

(assert (=> b!147885 m!229167))

(declare-fun m!229169 () Bool)

(assert (=> b!147885 m!229169))

(declare-fun m!229171 () Bool)

(assert (=> b!147885 m!229171))

(assert (=> b!147885 m!229135))

(declare-fun m!229173 () Bool)

(assert (=> b!147885 m!229173))

(declare-fun m!229175 () Bool)

(assert (=> b!147885 m!229175))

(declare-fun m!229177 () Bool)

(assert (=> b!147885 m!229177))

(declare-fun m!229179 () Bool)

(assert (=> b!147885 m!229179))

(declare-fun m!229181 () Bool)

(assert (=> b!147885 m!229181))

(assert (=> b!147885 m!229159))

(declare-fun m!229183 () Bool)

(assert (=> b!147872 m!229183))

(assert (=> b!147874 m!229159))

(declare-fun m!229185 () Bool)

(assert (=> b!147874 m!229185))

(declare-fun m!229187 () Bool)

(assert (=> b!147874 m!229187))

(declare-fun m!229189 () Bool)

(assert (=> b!147881 m!229189))

(assert (=> b!147881 m!229127))

(declare-fun m!229191 () Bool)

(assert (=> b!147875 m!229191))

(declare-fun m!229193 () Bool)

(assert (=> b!147875 m!229193))

(check-sat (not b!147881) (not b!147875) (not b!147883) (not b!147882) (not b!147879) (not b!147871) (not b!147885) (not b!147876) (not b!147880) (not start!28544) (not b!147873) (not b!147872) (not b!147884) (not b!147874))
(check-sat)
(get-model)

(declare-fun d!48082 () Bool)

(assert (=> d!48082 (= (array_inv!2803 (buf!3479 thiss!1634)) (bvsge (size!3014 (buf!3479 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!147879 d!48082))

(declare-fun d!48084 () Bool)

(declare-fun res!123996 () Bool)

(declare-fun e!98802 () Bool)

(assert (=> d!48084 (=> (not res!123996) (not e!98802))))

(assert (=> d!48084 (= res!123996 (= (size!3014 (buf!3479 (_2!6949 lt!230195))) (size!3014 (buf!3479 (_2!6949 lt!230188)))))))

(assert (=> d!48084 (= (isPrefixOf!0 (_2!6949 lt!230195) (_2!6949 lt!230188)) e!98802)))

(declare-fun b!148129 () Bool)

(declare-fun res!123995 () Bool)

(assert (=> b!148129 (=> (not res!123995) (not e!98802))))

(assert (=> b!148129 (= res!123995 (bvsle (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230195))) (currentByte!6387 (_2!6949 lt!230195)) (currentBit!6382 (_2!6949 lt!230195))) (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230188))) (currentByte!6387 (_2!6949 lt!230188)) (currentBit!6382 (_2!6949 lt!230188)))))))

(declare-fun b!148130 () Bool)

(declare-fun e!98801 () Bool)

(assert (=> b!148130 (= e!98802 e!98801)))

(declare-fun res!123994 () Bool)

(assert (=> b!148130 (=> res!123994 e!98801)))

(assert (=> b!148130 (= res!123994 (= (size!3014 (buf!3479 (_2!6949 lt!230195))) #b00000000000000000000000000000000))))

(declare-fun b!148131 () Bool)

(declare-fun arrayBitRangesEq!0 (array!6661 array!6661 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!148131 (= e!98801 (arrayBitRangesEq!0 (buf!3479 (_2!6949 lt!230195)) (buf!3479 (_2!6949 lt!230188)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230195))) (currentByte!6387 (_2!6949 lt!230195)) (currentBit!6382 (_2!6949 lt!230195)))))))

(assert (= (and d!48084 res!123996) b!148129))

(assert (= (and b!148129 res!123995) b!148130))

(assert (= (and b!148130 (not res!123994)) b!148131))

(assert (=> b!148129 m!229127))

(assert (=> b!148129 m!229189))

(assert (=> b!148131 m!229127))

(assert (=> b!148131 m!229127))

(declare-fun m!229691 () Bool)

(assert (=> b!148131 m!229691))

(assert (=> b!147880 d!48084))

(declare-fun d!48086 () Bool)

(declare-fun e!98805 () Bool)

(assert (=> d!48086 e!98805))

(declare-fun res!124002 () Bool)

(assert (=> d!48086 (=> (not res!124002) (not e!98805))))

(declare-fun lt!230778 () (_ BitVec 64))

(declare-fun lt!230779 () (_ BitVec 64))

(declare-fun lt!230777 () (_ BitVec 64))

(assert (=> d!48086 (= res!124002 (= lt!230778 (bvsub lt!230777 lt!230779)))))

(assert (=> d!48086 (or (= (bvand lt!230777 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!230779 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!230777 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!230777 lt!230779) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!48086 (= lt!230779 (remainingBits!0 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230188)))) ((_ sign_extend 32) (currentByte!6387 (_2!6949 lt!230188))) ((_ sign_extend 32) (currentBit!6382 (_2!6949 lt!230188)))))))

(declare-fun lt!230776 () (_ BitVec 64))

(declare-fun lt!230780 () (_ BitVec 64))

(assert (=> d!48086 (= lt!230777 (bvmul lt!230776 lt!230780))))

(assert (=> d!48086 (or (= lt!230776 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!230780 (bvsdiv (bvmul lt!230776 lt!230780) lt!230776)))))

(assert (=> d!48086 (= lt!230780 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!48086 (= lt!230776 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230188)))))))

(assert (=> d!48086 (= lt!230778 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6387 (_2!6949 lt!230188))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6382 (_2!6949 lt!230188)))))))

(assert (=> d!48086 (invariant!0 (currentBit!6382 (_2!6949 lt!230188)) (currentByte!6387 (_2!6949 lt!230188)) (size!3014 (buf!3479 (_2!6949 lt!230188))))))

(assert (=> d!48086 (= (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230188))) (currentByte!6387 (_2!6949 lt!230188)) (currentBit!6382 (_2!6949 lt!230188))) lt!230778)))

(declare-fun b!148136 () Bool)

(declare-fun res!124001 () Bool)

(assert (=> b!148136 (=> (not res!124001) (not e!98805))))

(assert (=> b!148136 (= res!124001 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!230778))))

(declare-fun b!148137 () Bool)

(declare-fun lt!230781 () (_ BitVec 64))

(assert (=> b!148137 (= e!98805 (bvsle lt!230778 (bvmul lt!230781 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!148137 (or (= lt!230781 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!230781 #b0000000000000000000000000000000000000000000000000000000000001000) lt!230781)))))

(assert (=> b!148137 (= lt!230781 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230188)))))))

(assert (= (and d!48086 res!124002) b!148136))

(assert (= (and b!148136 res!124001) b!148137))

(declare-fun m!229693 () Bool)

(assert (=> d!48086 m!229693))

(declare-fun m!229695 () Bool)

(assert (=> d!48086 m!229695))

(assert (=> b!147881 d!48086))

(declare-fun d!48088 () Bool)

(declare-fun e!98806 () Bool)

(assert (=> d!48088 e!98806))

(declare-fun res!124004 () Bool)

(assert (=> d!48088 (=> (not res!124004) (not e!98806))))

(declare-fun lt!230785 () (_ BitVec 64))

(declare-fun lt!230783 () (_ BitVec 64))

(declare-fun lt!230784 () (_ BitVec 64))

(assert (=> d!48088 (= res!124004 (= lt!230784 (bvsub lt!230783 lt!230785)))))

(assert (=> d!48088 (or (= (bvand lt!230783 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!230785 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!230783 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!230783 lt!230785) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48088 (= lt!230785 (remainingBits!0 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230195)))) ((_ sign_extend 32) (currentByte!6387 (_2!6949 lt!230195))) ((_ sign_extend 32) (currentBit!6382 (_2!6949 lt!230195)))))))

(declare-fun lt!230782 () (_ BitVec 64))

(declare-fun lt!230786 () (_ BitVec 64))

(assert (=> d!48088 (= lt!230783 (bvmul lt!230782 lt!230786))))

(assert (=> d!48088 (or (= lt!230782 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!230786 (bvsdiv (bvmul lt!230782 lt!230786) lt!230782)))))

(assert (=> d!48088 (= lt!230786 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!48088 (= lt!230782 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230195)))))))

(assert (=> d!48088 (= lt!230784 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6387 (_2!6949 lt!230195))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6382 (_2!6949 lt!230195)))))))

(assert (=> d!48088 (invariant!0 (currentBit!6382 (_2!6949 lt!230195)) (currentByte!6387 (_2!6949 lt!230195)) (size!3014 (buf!3479 (_2!6949 lt!230195))))))

(assert (=> d!48088 (= (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230195))) (currentByte!6387 (_2!6949 lt!230195)) (currentBit!6382 (_2!6949 lt!230195))) lt!230784)))

(declare-fun b!148138 () Bool)

(declare-fun res!124003 () Bool)

(assert (=> b!148138 (=> (not res!124003) (not e!98806))))

(assert (=> b!148138 (= res!124003 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!230784))))

(declare-fun b!148139 () Bool)

(declare-fun lt!230787 () (_ BitVec 64))

(assert (=> b!148139 (= e!98806 (bvsle lt!230784 (bvmul lt!230787 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!148139 (or (= lt!230787 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!230787 #b0000000000000000000000000000000000000000000000000000000000001000) lt!230787)))))

(assert (=> b!148139 (= lt!230787 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230195)))))))

(assert (= (and d!48088 res!124004) b!148138))

(assert (= (and b!148138 res!124003) b!148139))

(declare-fun m!229697 () Bool)

(assert (=> d!48088 m!229697))

(declare-fun m!229699 () Bool)

(assert (=> d!48088 m!229699))

(assert (=> b!147881 d!48088))

(assert (=> b!147876 d!48088))

(declare-fun d!48090 () Bool)

(declare-fun e!98807 () Bool)

(assert (=> d!48090 e!98807))

(declare-fun res!124006 () Bool)

(assert (=> d!48090 (=> (not res!124006) (not e!98807))))

(declare-fun lt!230790 () (_ BitVec 64))

(declare-fun lt!230789 () (_ BitVec 64))

(declare-fun lt!230791 () (_ BitVec 64))

(assert (=> d!48090 (= res!124006 (= lt!230790 (bvsub lt!230789 lt!230791)))))

(assert (=> d!48090 (or (= (bvand lt!230789 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!230791 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!230789 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!230789 lt!230791) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48090 (= lt!230791 (remainingBits!0 ((_ sign_extend 32) (size!3014 (buf!3479 thiss!1634))) ((_ sign_extend 32) (currentByte!6387 thiss!1634)) ((_ sign_extend 32) (currentBit!6382 thiss!1634))))))

(declare-fun lt!230788 () (_ BitVec 64))

(declare-fun lt!230792 () (_ BitVec 64))

(assert (=> d!48090 (= lt!230789 (bvmul lt!230788 lt!230792))))

(assert (=> d!48090 (or (= lt!230788 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!230792 (bvsdiv (bvmul lt!230788 lt!230792) lt!230788)))))

(assert (=> d!48090 (= lt!230792 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!48090 (= lt!230788 ((_ sign_extend 32) (size!3014 (buf!3479 thiss!1634))))))

(assert (=> d!48090 (= lt!230790 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6387 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6382 thiss!1634))))))

(assert (=> d!48090 (invariant!0 (currentBit!6382 thiss!1634) (currentByte!6387 thiss!1634) (size!3014 (buf!3479 thiss!1634)))))

(assert (=> d!48090 (= (bitIndex!0 (size!3014 (buf!3479 thiss!1634)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634)) lt!230790)))

(declare-fun b!148140 () Bool)

(declare-fun res!124005 () Bool)

(assert (=> b!148140 (=> (not res!124005) (not e!98807))))

(assert (=> b!148140 (= res!124005 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!230790))))

(declare-fun b!148141 () Bool)

(declare-fun lt!230793 () (_ BitVec 64))

(assert (=> b!148141 (= e!98807 (bvsle lt!230790 (bvmul lt!230793 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!148141 (or (= lt!230793 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!230793 #b0000000000000000000000000000000000000000000000000000000000001000) lt!230793)))))

(assert (=> b!148141 (= lt!230793 ((_ sign_extend 32) (size!3014 (buf!3479 thiss!1634))))))

(assert (= (and d!48090 res!124006) b!148140))

(assert (= (and b!148140 res!124005) b!148141))

(declare-fun m!229701 () Bool)

(assert (=> d!48090 m!229701))

(assert (=> d!48090 m!229105))

(assert (=> b!147876 d!48090))

(declare-fun d!48092 () Bool)

(assert (=> d!48092 (= (array_inv!2803 arr!237) (bvsge (size!3014 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!28544 d!48092))

(declare-fun d!48094 () Bool)

(assert (=> d!48094 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6382 thiss!1634) (currentByte!6387 thiss!1634) (size!3014 (buf!3479 thiss!1634))))))

(declare-fun bs!11751 () Bool)

(assert (= bs!11751 d!48094))

(assert (=> bs!11751 m!229105))

(assert (=> start!28544 d!48094))

(declare-fun d!48096 () Bool)

(declare-fun res!124011 () Bool)

(declare-fun e!98812 () Bool)

(assert (=> d!48096 (=> res!124011 e!98812)))

(assert (=> d!48096 (= res!124011 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!48096 (= (arrayRangesEq!330 arr!237 (_2!6952 lt!230182) #b00000000000000000000000000000000 to!404) e!98812)))

(declare-fun b!148146 () Bool)

(declare-fun e!98813 () Bool)

(assert (=> b!148146 (= e!98812 e!98813)))

(declare-fun res!124012 () Bool)

(assert (=> b!148146 (=> (not res!124012) (not e!98813))))

(assert (=> b!148146 (= res!124012 (= (select (arr!3783 arr!237) #b00000000000000000000000000000000) (select (arr!3783 (_2!6952 lt!230182)) #b00000000000000000000000000000000)))))

(declare-fun b!148147 () Bool)

(assert (=> b!148147 (= e!98813 (arrayRangesEq!330 arr!237 (_2!6952 lt!230182) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48096 (not res!124011)) b!148146))

(assert (= (and b!148146 res!124012) b!148147))

(declare-fun m!229703 () Bool)

(assert (=> b!148146 m!229703))

(declare-fun m!229705 () Bool)

(assert (=> b!148146 m!229705))

(declare-fun m!229707 () Bool)

(assert (=> b!148147 m!229707))

(assert (=> b!147884 d!48096))

(declare-fun d!48098 () Bool)

(declare-datatypes ((tuple2!13200 0))(
  ( (tuple2!13201 (_1!6961 (_ BitVec 8)) (_2!6961 BitStream!5286)) )
))
(declare-fun lt!230796 () tuple2!13200)

(declare-fun readByte!0 (BitStream!5286) tuple2!13200)

(assert (=> d!48098 (= lt!230796 (readByte!0 (_1!6950 lt!230183)))))

(assert (=> d!48098 (= (readBytePure!0 (_1!6950 lt!230183)) (tuple2!13185 (_2!6961 lt!230796) (_1!6961 lt!230796)))))

(declare-fun bs!11752 () Bool)

(assert (= bs!11752 d!48098))

(declare-fun m!229709 () Bool)

(assert (=> bs!11752 m!229709))

(assert (=> b!147874 d!48098))

(declare-fun b!148158 () Bool)

(declare-fun e!98818 () Unit!9316)

(declare-fun lt!230852 () Unit!9316)

(assert (=> b!148158 (= e!98818 lt!230852)))

(declare-fun lt!230848 () (_ BitVec 64))

(assert (=> b!148158 (= lt!230848 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!230846 () (_ BitVec 64))

(assert (=> b!148158 (= lt!230846 (bitIndex!0 (size!3014 (buf!3479 thiss!1634)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6661 array!6661 (_ BitVec 64) (_ BitVec 64)) Unit!9316)

(assert (=> b!148158 (= lt!230852 (arrayBitRangesEqSymmetric!0 (buf!3479 thiss!1634) (buf!3479 (_2!6949 lt!230195)) lt!230848 lt!230846))))

(assert (=> b!148158 (arrayBitRangesEq!0 (buf!3479 (_2!6949 lt!230195)) (buf!3479 thiss!1634) lt!230848 lt!230846)))

(declare-fun b!148159 () Bool)

(declare-fun res!124019 () Bool)

(declare-fun e!98819 () Bool)

(assert (=> b!148159 (=> (not res!124019) (not e!98819))))

(declare-fun lt!230853 () tuple2!13182)

(assert (=> b!148159 (= res!124019 (isPrefixOf!0 (_1!6950 lt!230853) thiss!1634))))

(declare-fun b!148160 () Bool)

(declare-fun Unit!9326 () Unit!9316)

(assert (=> b!148160 (= e!98818 Unit!9326)))

(declare-fun lt!230855 () (_ BitVec 64))

(declare-fun b!148161 () Bool)

(declare-fun lt!230847 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!5286 (_ BitVec 64)) BitStream!5286)

(assert (=> b!148161 (= e!98819 (= (_1!6950 lt!230853) (withMovedBitIndex!0 (_2!6950 lt!230853) (bvsub lt!230847 lt!230855))))))

(assert (=> b!148161 (or (= (bvand lt!230847 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!230855 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!230847 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!230847 lt!230855) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!148161 (= lt!230855 (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230195))) (currentByte!6387 (_2!6949 lt!230195)) (currentBit!6382 (_2!6949 lt!230195))))))

(assert (=> b!148161 (= lt!230847 (bitIndex!0 (size!3014 (buf!3479 thiss!1634)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634)))))

(declare-fun d!48100 () Bool)

(assert (=> d!48100 e!98819))

(declare-fun res!124021 () Bool)

(assert (=> d!48100 (=> (not res!124021) (not e!98819))))

(assert (=> d!48100 (= res!124021 (isPrefixOf!0 (_1!6950 lt!230853) (_2!6950 lt!230853)))))

(declare-fun lt!230838 () BitStream!5286)

(assert (=> d!48100 (= lt!230853 (tuple2!13183 lt!230838 (_2!6949 lt!230195)))))

(declare-fun lt!230849 () Unit!9316)

(declare-fun lt!230845 () Unit!9316)

(assert (=> d!48100 (= lt!230849 lt!230845)))

(assert (=> d!48100 (isPrefixOf!0 lt!230838 (_2!6949 lt!230195))))

(assert (=> d!48100 (= lt!230845 (lemmaIsPrefixTransitive!0 lt!230838 (_2!6949 lt!230195) (_2!6949 lt!230195)))))

(declare-fun lt!230841 () Unit!9316)

(declare-fun lt!230837 () Unit!9316)

(assert (=> d!48100 (= lt!230841 lt!230837)))

(assert (=> d!48100 (isPrefixOf!0 lt!230838 (_2!6949 lt!230195))))

(assert (=> d!48100 (= lt!230837 (lemmaIsPrefixTransitive!0 lt!230838 thiss!1634 (_2!6949 lt!230195)))))

(declare-fun lt!230851 () Unit!9316)

(assert (=> d!48100 (= lt!230851 e!98818)))

(declare-fun c!8007 () Bool)

(assert (=> d!48100 (= c!8007 (not (= (size!3014 (buf!3479 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!230856 () Unit!9316)

(declare-fun lt!230854 () Unit!9316)

(assert (=> d!48100 (= lt!230856 lt!230854)))

(assert (=> d!48100 (isPrefixOf!0 (_2!6949 lt!230195) (_2!6949 lt!230195))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5286) Unit!9316)

(assert (=> d!48100 (= lt!230854 (lemmaIsPrefixRefl!0 (_2!6949 lt!230195)))))

(declare-fun lt!230850 () Unit!9316)

(declare-fun lt!230839 () Unit!9316)

(assert (=> d!48100 (= lt!230850 lt!230839)))

(assert (=> d!48100 (= lt!230839 (lemmaIsPrefixRefl!0 (_2!6949 lt!230195)))))

(declare-fun lt!230842 () Unit!9316)

(declare-fun lt!230844 () Unit!9316)

(assert (=> d!48100 (= lt!230842 lt!230844)))

(assert (=> d!48100 (isPrefixOf!0 lt!230838 lt!230838)))

(assert (=> d!48100 (= lt!230844 (lemmaIsPrefixRefl!0 lt!230838))))

(declare-fun lt!230843 () Unit!9316)

(declare-fun lt!230840 () Unit!9316)

(assert (=> d!48100 (= lt!230843 lt!230840)))

(assert (=> d!48100 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!48100 (= lt!230840 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!48100 (= lt!230838 (BitStream!5287 (buf!3479 (_2!6949 lt!230195)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634)))))

(assert (=> d!48100 (isPrefixOf!0 thiss!1634 (_2!6949 lt!230195))))

(assert (=> d!48100 (= (reader!0 thiss!1634 (_2!6949 lt!230195)) lt!230853)))

(declare-fun b!148162 () Bool)

(declare-fun res!124020 () Bool)

(assert (=> b!148162 (=> (not res!124020) (not e!98819))))

(assert (=> b!148162 (= res!124020 (isPrefixOf!0 (_2!6950 lt!230853) (_2!6949 lt!230195)))))

(assert (= (and d!48100 c!8007) b!148158))

(assert (= (and d!48100 (not c!8007)) b!148160))

(assert (= (and d!48100 res!124021) b!148159))

(assert (= (and b!148159 res!124019) b!148162))

(assert (= (and b!148162 res!124020) b!148161))

(declare-fun m!229711 () Bool)

(assert (=> b!148159 m!229711))

(assert (=> b!148158 m!229129))

(declare-fun m!229713 () Bool)

(assert (=> b!148158 m!229713))

(declare-fun m!229715 () Bool)

(assert (=> b!148158 m!229715))

(declare-fun m!229717 () Bool)

(assert (=> b!148162 m!229717))

(declare-fun m!229719 () Bool)

(assert (=> b!148161 m!229719))

(assert (=> b!148161 m!229127))

(assert (=> b!148161 m!229129))

(declare-fun m!229721 () Bool)

(assert (=> d!48100 m!229721))

(declare-fun m!229723 () Bool)

(assert (=> d!48100 m!229723))

(declare-fun m!229725 () Bool)

(assert (=> d!48100 m!229725))

(declare-fun m!229727 () Bool)

(assert (=> d!48100 m!229727))

(declare-fun m!229729 () Bool)

(assert (=> d!48100 m!229729))

(declare-fun m!229731 () Bool)

(assert (=> d!48100 m!229731))

(declare-fun m!229733 () Bool)

(assert (=> d!48100 m!229733))

(assert (=> d!48100 m!229125))

(declare-fun m!229735 () Bool)

(assert (=> d!48100 m!229735))

(declare-fun m!229737 () Bool)

(assert (=> d!48100 m!229737))

(declare-fun m!229739 () Bool)

(assert (=> d!48100 m!229739))

(assert (=> b!147874 d!48100))

(declare-datatypes ((tuple3!580 0))(
  ( (tuple3!581 (_1!6962 Unit!9316) (_2!6962 BitStream!5286) (_3!361 array!6661)) )
))
(declare-fun lt!230859 () tuple3!580)

(declare-fun d!48102 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!5286 array!6661 (_ BitVec 32) (_ BitVec 32)) tuple3!580)

(assert (=> d!48102 (= lt!230859 (readByteArrayLoop!0 (_1!6950 lt!230201) arr!237 from!447 to!404))))

(assert (=> d!48102 (= (readByteArrayLoopPure!0 (_1!6950 lt!230201) arr!237 from!447 to!404) (tuple2!13187 (_2!6962 lt!230859) (_3!361 lt!230859)))))

(declare-fun bs!11753 () Bool)

(assert (= bs!11753 d!48102))

(declare-fun m!229741 () Bool)

(assert (=> bs!11753 m!229741))

(assert (=> b!147885 d!48102))

(declare-fun d!48104 () Bool)

(declare-fun res!124024 () Bool)

(declare-fun e!98821 () Bool)

(assert (=> d!48104 (=> (not res!124024) (not e!98821))))

(assert (=> d!48104 (= res!124024 (= (size!3014 (buf!3479 thiss!1634)) (size!3014 (buf!3479 (_2!6949 lt!230188)))))))

(assert (=> d!48104 (= (isPrefixOf!0 thiss!1634 (_2!6949 lt!230188)) e!98821)))

(declare-fun b!148163 () Bool)

(declare-fun res!124023 () Bool)

(assert (=> b!148163 (=> (not res!124023) (not e!98821))))

(assert (=> b!148163 (= res!124023 (bvsle (bitIndex!0 (size!3014 (buf!3479 thiss!1634)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634)) (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230188))) (currentByte!6387 (_2!6949 lt!230188)) (currentBit!6382 (_2!6949 lt!230188)))))))

(declare-fun b!148164 () Bool)

(declare-fun e!98820 () Bool)

(assert (=> b!148164 (= e!98821 e!98820)))

(declare-fun res!124022 () Bool)

(assert (=> b!148164 (=> res!124022 e!98820)))

(assert (=> b!148164 (= res!124022 (= (size!3014 (buf!3479 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!148165 () Bool)

(assert (=> b!148165 (= e!98820 (arrayBitRangesEq!0 (buf!3479 thiss!1634) (buf!3479 (_2!6949 lt!230188)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3014 (buf!3479 thiss!1634)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634))))))

(assert (= (and d!48104 res!124024) b!148163))

(assert (= (and b!148163 res!124023) b!148164))

(assert (= (and b!148164 (not res!124022)) b!148165))

(assert (=> b!148163 m!229129))

(assert (=> b!148163 m!229189))

(assert (=> b!148165 m!229129))

(assert (=> b!148165 m!229129))

(declare-fun m!229743 () Bool)

(assert (=> b!148165 m!229743))

(assert (=> b!147885 d!48104))

(declare-fun d!48106 () Bool)

(assert (=> d!48106 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230195)))) ((_ sign_extend 32) (currentByte!6387 (_2!6949 lt!230195))) ((_ sign_extend 32) (currentBit!6382 (_2!6949 lt!230195))) lt!230199) (bvsle ((_ sign_extend 32) lt!230199) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230195)))) ((_ sign_extend 32) (currentByte!6387 (_2!6949 lt!230195))) ((_ sign_extend 32) (currentBit!6382 (_2!6949 lt!230195)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11754 () Bool)

(assert (= bs!11754 d!48106))

(assert (=> bs!11754 m!229697))

(assert (=> b!147885 d!48106))

(declare-fun d!48108 () Bool)

(declare-fun lt!230860 () tuple3!580)

(assert (=> d!48108 (= lt!230860 (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!6950 lt!230201) #b00000000000000000000000000000001) lt!230178 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!48108 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6950 lt!230201) #b00000000000000000000000000000001) lt!230178 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13187 (_2!6962 lt!230860) (_3!361 lt!230860)))))

(declare-fun bs!11755 () Bool)

(assert (= bs!11755 d!48108))

(assert (=> bs!11755 m!229135))

(declare-fun m!229745 () Bool)

(assert (=> bs!11755 m!229745))

(assert (=> b!147885 d!48108))

(declare-fun d!48110 () Bool)

(declare-fun e!98822 () Bool)

(assert (=> d!48110 e!98822))

(declare-fun res!124026 () Bool)

(assert (=> d!48110 (=> (not res!124026) (not e!98822))))

(declare-fun lt!230863 () (_ BitVec 64))

(declare-fun lt!230862 () (_ BitVec 64))

(declare-fun lt!230864 () (_ BitVec 64))

(assert (=> d!48110 (= res!124026 (= lt!230863 (bvsub lt!230862 lt!230864)))))

(assert (=> d!48110 (or (= (bvand lt!230862 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!230864 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!230862 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!230862 lt!230864) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48110 (= lt!230864 (remainingBits!0 ((_ sign_extend 32) (size!3014 (buf!3479 (_1!6951 lt!230200)))) ((_ sign_extend 32) (currentByte!6387 (_1!6951 lt!230200))) ((_ sign_extend 32) (currentBit!6382 (_1!6951 lt!230200)))))))

(declare-fun lt!230861 () (_ BitVec 64))

(declare-fun lt!230865 () (_ BitVec 64))

(assert (=> d!48110 (= lt!230862 (bvmul lt!230861 lt!230865))))

(assert (=> d!48110 (or (= lt!230861 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!230865 (bvsdiv (bvmul lt!230861 lt!230865) lt!230861)))))

(assert (=> d!48110 (= lt!230865 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!48110 (= lt!230861 ((_ sign_extend 32) (size!3014 (buf!3479 (_1!6951 lt!230200)))))))

(assert (=> d!48110 (= lt!230863 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6387 (_1!6951 lt!230200))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6382 (_1!6951 lt!230200)))))))

(assert (=> d!48110 (invariant!0 (currentBit!6382 (_1!6951 lt!230200)) (currentByte!6387 (_1!6951 lt!230200)) (size!3014 (buf!3479 (_1!6951 lt!230200))))))

(assert (=> d!48110 (= (bitIndex!0 (size!3014 (buf!3479 (_1!6951 lt!230200))) (currentByte!6387 (_1!6951 lt!230200)) (currentBit!6382 (_1!6951 lt!230200))) lt!230863)))

(declare-fun b!148166 () Bool)

(declare-fun res!124025 () Bool)

(assert (=> b!148166 (=> (not res!124025) (not e!98822))))

(assert (=> b!148166 (= res!124025 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!230863))))

(declare-fun b!148167 () Bool)

(declare-fun lt!230866 () (_ BitVec 64))

(assert (=> b!148167 (= e!98822 (bvsle lt!230863 (bvmul lt!230866 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!148167 (or (= lt!230866 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!230866 #b0000000000000000000000000000000000000000000000000000000000001000) lt!230866)))))

(assert (=> b!148167 (= lt!230866 ((_ sign_extend 32) (size!3014 (buf!3479 (_1!6951 lt!230200)))))))

(assert (= (and d!48110 res!124026) b!148166))

(assert (= (and b!148166 res!124025) b!148167))

(declare-fun m!229747 () Bool)

(assert (=> d!48110 m!229747))

(declare-fun m!229749 () Bool)

(assert (=> d!48110 m!229749))

(assert (=> b!147885 d!48110))

(declare-fun d!48112 () Bool)

(declare-fun moveByteIndex!0 (BitStream!5286 (_ BitVec 32)) tuple2!13180)

(assert (=> d!48112 (= (withMovedByteIndex!0 (_1!6950 lt!230201) #b00000000000000000000000000000001) (_2!6949 (moveByteIndex!0 (_1!6950 lt!230201) #b00000000000000000000000000000001)))))

(declare-fun bs!11756 () Bool)

(assert (= bs!11756 d!48112))

(declare-fun m!229751 () Bool)

(assert (=> bs!11756 m!229751))

(assert (=> b!147885 d!48112))

(declare-fun d!48114 () Bool)

(declare-fun lt!230867 () tuple2!13200)

(assert (=> d!48114 (= lt!230867 (readByte!0 (BitStream!5287 (buf!3479 (_2!6949 lt!230188)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634))))))

(assert (=> d!48114 (= (readBytePure!0 (BitStream!5287 (buf!3479 (_2!6949 lt!230188)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634))) (tuple2!13185 (_2!6961 lt!230867) (_1!6961 lt!230867)))))

(declare-fun bs!11757 () Bool)

(assert (= bs!11757 d!48114))

(declare-fun m!229753 () Bool)

(assert (=> bs!11757 m!229753))

(assert (=> b!147885 d!48114))

(declare-fun b!148178 () Bool)

(declare-fun e!98830 () Bool)

(declare-fun lt!230886 () (_ BitVec 64))

(assert (=> b!148178 (= e!98830 (validate_offset_bits!1 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230195)))) ((_ sign_extend 32) (currentByte!6387 (_2!6949 lt!230195))) ((_ sign_extend 32) (currentBit!6382 (_2!6949 lt!230195))) lt!230886))))

(declare-fun d!48116 () Bool)

(declare-fun e!98831 () Bool)

(assert (=> d!48116 e!98831))

(declare-fun res!124037 () Bool)

(assert (=> d!48116 (=> (not res!124037) (not e!98831))))

(declare-fun lt!230889 () tuple2!13180)

(assert (=> d!48116 (= res!124037 (= (size!3014 (buf!3479 (_2!6949 lt!230195))) (size!3014 (buf!3479 (_2!6949 lt!230889)))))))

(declare-fun choose!64 (BitStream!5286 array!6661 (_ BitVec 32) (_ BitVec 32)) tuple2!13180)

(assert (=> d!48116 (= lt!230889 (choose!64 (_2!6949 lt!230195) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!48116 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!3014 arr!237)))))

(assert (=> d!48116 (= (appendByteArrayLoop!0 (_2!6949 lt!230195) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!230889)))

(declare-fun b!148179 () Bool)

(declare-fun lt!230891 () tuple2!13186)

(declare-fun e!98829 () Bool)

(assert (=> b!148179 (= e!98829 (arrayRangesEq!330 arr!237 (_2!6952 lt!230891) #b00000000000000000000000000000000 to!404))))

(declare-fun b!148180 () Bool)

(declare-fun res!124038 () Bool)

(assert (=> b!148180 (=> (not res!124038) (not e!98831))))

(declare-fun lt!230894 () (_ BitVec 64))

(declare-fun lt!230892 () (_ BitVec 64))

(assert (=> b!148180 (= res!124038 (= (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230889))) (currentByte!6387 (_2!6949 lt!230889)) (currentBit!6382 (_2!6949 lt!230889))) (bvadd lt!230892 lt!230894)))))

(assert (=> b!148180 (or (not (= (bvand lt!230892 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!230894 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!230892 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!230892 lt!230894) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!230888 () (_ BitVec 64))

(assert (=> b!148180 (= lt!230894 (bvmul lt!230888 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!148180 (or (= lt!230888 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!230888 #b0000000000000000000000000000000000000000000000000000000000001000) lt!230888)))))

(assert (=> b!148180 (= lt!230888 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!148180 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!148180 (= lt!230892 (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230195))) (currentByte!6387 (_2!6949 lt!230195)) (currentBit!6382 (_2!6949 lt!230195))))))

(declare-fun b!148181 () Bool)

(assert (=> b!148181 (= e!98831 e!98829)))

(declare-fun res!124039 () Bool)

(assert (=> b!148181 (=> (not res!124039) (not e!98829))))

(declare-fun lt!230887 () tuple2!13182)

(assert (=> b!148181 (= res!124039 (and (= (size!3014 (_2!6952 lt!230891)) (size!3014 arr!237)) (= (_1!6952 lt!230891) (_2!6950 lt!230887))))))

(assert (=> b!148181 (= lt!230891 (readByteArrayLoopPure!0 (_1!6950 lt!230887) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!230890 () Unit!9316)

(declare-fun lt!230893 () Unit!9316)

(assert (=> b!148181 (= lt!230890 lt!230893)))

(assert (=> b!148181 (validate_offset_bits!1 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230889)))) ((_ sign_extend 32) (currentByte!6387 (_2!6949 lt!230195))) ((_ sign_extend 32) (currentBit!6382 (_2!6949 lt!230195))) lt!230886)))

(assert (=> b!148181 (= lt!230893 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6949 lt!230195) (buf!3479 (_2!6949 lt!230889)) lt!230886))))

(assert (=> b!148181 e!98830))

(declare-fun res!124040 () Bool)

(assert (=> b!148181 (=> (not res!124040) (not e!98830))))

(assert (=> b!148181 (= res!124040 (and (= (size!3014 (buf!3479 (_2!6949 lt!230195))) (size!3014 (buf!3479 (_2!6949 lt!230889)))) (bvsge lt!230886 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!148181 (= lt!230886 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!148181 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!148181 (= lt!230887 (reader!0 (_2!6949 lt!230195) (_2!6949 lt!230889)))))

(declare-fun b!148182 () Bool)

(declare-fun res!124041 () Bool)

(assert (=> b!148182 (=> (not res!124041) (not e!98831))))

(assert (=> b!148182 (= res!124041 (isPrefixOf!0 (_2!6949 lt!230195) (_2!6949 lt!230889)))))

(assert (= (and d!48116 res!124037) b!148180))

(assert (= (and b!148180 res!124038) b!148182))

(assert (= (and b!148182 res!124041) b!148181))

(assert (= (and b!148181 res!124040) b!148178))

(assert (= (and b!148181 res!124039) b!148179))

(declare-fun m!229755 () Bool)

(assert (=> d!48116 m!229755))

(declare-fun m!229757 () Bool)

(assert (=> b!148181 m!229757))

(declare-fun m!229759 () Bool)

(assert (=> b!148181 m!229759))

(declare-fun m!229761 () Bool)

(assert (=> b!148181 m!229761))

(declare-fun m!229763 () Bool)

(assert (=> b!148181 m!229763))

(declare-fun m!229765 () Bool)

(assert (=> b!148178 m!229765))

(declare-fun m!229767 () Bool)

(assert (=> b!148180 m!229767))

(assert (=> b!148180 m!229127))

(declare-fun m!229769 () Bool)

(assert (=> b!148182 m!229769))

(declare-fun m!229771 () Bool)

(assert (=> b!148179 m!229771))

(assert (=> b!147885 d!48116))

(declare-fun b!148183 () Bool)

(declare-fun e!98832 () Unit!9316)

(declare-fun lt!230910 () Unit!9316)

(assert (=> b!148183 (= e!98832 lt!230910)))

(declare-fun lt!230906 () (_ BitVec 64))

(assert (=> b!148183 (= lt!230906 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!230904 () (_ BitVec 64))

(assert (=> b!148183 (= lt!230904 (bitIndex!0 (size!3014 (buf!3479 thiss!1634)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634)))))

(assert (=> b!148183 (= lt!230910 (arrayBitRangesEqSymmetric!0 (buf!3479 thiss!1634) (buf!3479 (_2!6949 lt!230188)) lt!230906 lt!230904))))

(assert (=> b!148183 (arrayBitRangesEq!0 (buf!3479 (_2!6949 lt!230188)) (buf!3479 thiss!1634) lt!230906 lt!230904)))

(declare-fun b!148184 () Bool)

(declare-fun res!124042 () Bool)

(declare-fun e!98833 () Bool)

(assert (=> b!148184 (=> (not res!124042) (not e!98833))))

(declare-fun lt!230911 () tuple2!13182)

(assert (=> b!148184 (= res!124042 (isPrefixOf!0 (_1!6950 lt!230911) thiss!1634))))

(declare-fun b!148185 () Bool)

(declare-fun Unit!9327 () Unit!9316)

(assert (=> b!148185 (= e!98832 Unit!9327)))

(declare-fun lt!230913 () (_ BitVec 64))

(declare-fun lt!230905 () (_ BitVec 64))

(declare-fun b!148186 () Bool)

(assert (=> b!148186 (= e!98833 (= (_1!6950 lt!230911) (withMovedBitIndex!0 (_2!6950 lt!230911) (bvsub lt!230905 lt!230913))))))

(assert (=> b!148186 (or (= (bvand lt!230905 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!230913 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!230905 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!230905 lt!230913) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!148186 (= lt!230913 (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230188))) (currentByte!6387 (_2!6949 lt!230188)) (currentBit!6382 (_2!6949 lt!230188))))))

(assert (=> b!148186 (= lt!230905 (bitIndex!0 (size!3014 (buf!3479 thiss!1634)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634)))))

(declare-fun d!48118 () Bool)

(assert (=> d!48118 e!98833))

(declare-fun res!124044 () Bool)

(assert (=> d!48118 (=> (not res!124044) (not e!98833))))

(assert (=> d!48118 (= res!124044 (isPrefixOf!0 (_1!6950 lt!230911) (_2!6950 lt!230911)))))

(declare-fun lt!230896 () BitStream!5286)

(assert (=> d!48118 (= lt!230911 (tuple2!13183 lt!230896 (_2!6949 lt!230188)))))

(declare-fun lt!230907 () Unit!9316)

(declare-fun lt!230903 () Unit!9316)

(assert (=> d!48118 (= lt!230907 lt!230903)))

(assert (=> d!48118 (isPrefixOf!0 lt!230896 (_2!6949 lt!230188))))

(assert (=> d!48118 (= lt!230903 (lemmaIsPrefixTransitive!0 lt!230896 (_2!6949 lt!230188) (_2!6949 lt!230188)))))

(declare-fun lt!230899 () Unit!9316)

(declare-fun lt!230895 () Unit!9316)

(assert (=> d!48118 (= lt!230899 lt!230895)))

(assert (=> d!48118 (isPrefixOf!0 lt!230896 (_2!6949 lt!230188))))

(assert (=> d!48118 (= lt!230895 (lemmaIsPrefixTransitive!0 lt!230896 thiss!1634 (_2!6949 lt!230188)))))

(declare-fun lt!230909 () Unit!9316)

(assert (=> d!48118 (= lt!230909 e!98832)))

(declare-fun c!8008 () Bool)

(assert (=> d!48118 (= c!8008 (not (= (size!3014 (buf!3479 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!230914 () Unit!9316)

(declare-fun lt!230912 () Unit!9316)

(assert (=> d!48118 (= lt!230914 lt!230912)))

(assert (=> d!48118 (isPrefixOf!0 (_2!6949 lt!230188) (_2!6949 lt!230188))))

(assert (=> d!48118 (= lt!230912 (lemmaIsPrefixRefl!0 (_2!6949 lt!230188)))))

(declare-fun lt!230908 () Unit!9316)

(declare-fun lt!230897 () Unit!9316)

(assert (=> d!48118 (= lt!230908 lt!230897)))

(assert (=> d!48118 (= lt!230897 (lemmaIsPrefixRefl!0 (_2!6949 lt!230188)))))

(declare-fun lt!230900 () Unit!9316)

(declare-fun lt!230902 () Unit!9316)

(assert (=> d!48118 (= lt!230900 lt!230902)))

(assert (=> d!48118 (isPrefixOf!0 lt!230896 lt!230896)))

(assert (=> d!48118 (= lt!230902 (lemmaIsPrefixRefl!0 lt!230896))))

(declare-fun lt!230901 () Unit!9316)

(declare-fun lt!230898 () Unit!9316)

(assert (=> d!48118 (= lt!230901 lt!230898)))

(assert (=> d!48118 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!48118 (= lt!230898 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!48118 (= lt!230896 (BitStream!5287 (buf!3479 (_2!6949 lt!230188)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634)))))

(assert (=> d!48118 (isPrefixOf!0 thiss!1634 (_2!6949 lt!230188))))

(assert (=> d!48118 (= (reader!0 thiss!1634 (_2!6949 lt!230188)) lt!230911)))

(declare-fun b!148187 () Bool)

(declare-fun res!124043 () Bool)

(assert (=> b!148187 (=> (not res!124043) (not e!98833))))

(assert (=> b!148187 (= res!124043 (isPrefixOf!0 (_2!6950 lt!230911) (_2!6949 lt!230188)))))

(assert (= (and d!48118 c!8008) b!148183))

(assert (= (and d!48118 (not c!8008)) b!148185))

(assert (= (and d!48118 res!124044) b!148184))

(assert (= (and b!148184 res!124042) b!148187))

(assert (= (and b!148187 res!124043) b!148186))

(declare-fun m!229773 () Bool)

(assert (=> b!148184 m!229773))

(assert (=> b!148183 m!229129))

(declare-fun m!229775 () Bool)

(assert (=> b!148183 m!229775))

(declare-fun m!229777 () Bool)

(assert (=> b!148183 m!229777))

(declare-fun m!229779 () Bool)

(assert (=> b!148187 m!229779))

(declare-fun m!229781 () Bool)

(assert (=> b!148186 m!229781))

(assert (=> b!148186 m!229189))

(assert (=> b!148186 m!229129))

(declare-fun m!229783 () Bool)

(assert (=> d!48118 m!229783))

(assert (=> d!48118 m!229723))

(declare-fun m!229785 () Bool)

(assert (=> d!48118 m!229785))

(assert (=> d!48118 m!229727))

(declare-fun m!229787 () Bool)

(assert (=> d!48118 m!229787))

(declare-fun m!229789 () Bool)

(assert (=> d!48118 m!229789))

(declare-fun m!229791 () Bool)

(assert (=> d!48118 m!229791))

(assert (=> d!48118 m!229167))

(declare-fun m!229793 () Bool)

(assert (=> d!48118 m!229793))

(declare-fun m!229795 () Bool)

(assert (=> d!48118 m!229795))

(declare-fun m!229797 () Bool)

(assert (=> d!48118 m!229797))

(assert (=> b!147885 d!48118))

(declare-fun b!148188 () Bool)

(declare-fun e!98834 () Unit!9316)

(declare-fun lt!230930 () Unit!9316)

(assert (=> b!148188 (= e!98834 lt!230930)))

(declare-fun lt!230926 () (_ BitVec 64))

(assert (=> b!148188 (= lt!230926 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!230924 () (_ BitVec 64))

(assert (=> b!148188 (= lt!230924 (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230195))) (currentByte!6387 (_2!6949 lt!230195)) (currentBit!6382 (_2!6949 lt!230195))))))

(assert (=> b!148188 (= lt!230930 (arrayBitRangesEqSymmetric!0 (buf!3479 (_2!6949 lt!230195)) (buf!3479 (_2!6949 lt!230188)) lt!230926 lt!230924))))

(assert (=> b!148188 (arrayBitRangesEq!0 (buf!3479 (_2!6949 lt!230188)) (buf!3479 (_2!6949 lt!230195)) lt!230926 lt!230924)))

(declare-fun b!148189 () Bool)

(declare-fun res!124045 () Bool)

(declare-fun e!98835 () Bool)

(assert (=> b!148189 (=> (not res!124045) (not e!98835))))

(declare-fun lt!230931 () tuple2!13182)

(assert (=> b!148189 (= res!124045 (isPrefixOf!0 (_1!6950 lt!230931) (_2!6949 lt!230195)))))

(declare-fun b!148190 () Bool)

(declare-fun Unit!9328 () Unit!9316)

(assert (=> b!148190 (= e!98834 Unit!9328)))

(declare-fun b!148191 () Bool)

(declare-fun lt!230933 () (_ BitVec 64))

(declare-fun lt!230925 () (_ BitVec 64))

(assert (=> b!148191 (= e!98835 (= (_1!6950 lt!230931) (withMovedBitIndex!0 (_2!6950 lt!230931) (bvsub lt!230925 lt!230933))))))

(assert (=> b!148191 (or (= (bvand lt!230925 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!230933 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!230925 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!230925 lt!230933) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!148191 (= lt!230933 (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230188))) (currentByte!6387 (_2!6949 lt!230188)) (currentBit!6382 (_2!6949 lt!230188))))))

(assert (=> b!148191 (= lt!230925 (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230195))) (currentByte!6387 (_2!6949 lt!230195)) (currentBit!6382 (_2!6949 lt!230195))))))

(declare-fun d!48120 () Bool)

(assert (=> d!48120 e!98835))

(declare-fun res!124047 () Bool)

(assert (=> d!48120 (=> (not res!124047) (not e!98835))))

(assert (=> d!48120 (= res!124047 (isPrefixOf!0 (_1!6950 lt!230931) (_2!6950 lt!230931)))))

(declare-fun lt!230916 () BitStream!5286)

(assert (=> d!48120 (= lt!230931 (tuple2!13183 lt!230916 (_2!6949 lt!230188)))))

(declare-fun lt!230927 () Unit!9316)

(declare-fun lt!230923 () Unit!9316)

(assert (=> d!48120 (= lt!230927 lt!230923)))

(assert (=> d!48120 (isPrefixOf!0 lt!230916 (_2!6949 lt!230188))))

(assert (=> d!48120 (= lt!230923 (lemmaIsPrefixTransitive!0 lt!230916 (_2!6949 lt!230188) (_2!6949 lt!230188)))))

(declare-fun lt!230919 () Unit!9316)

(declare-fun lt!230915 () Unit!9316)

(assert (=> d!48120 (= lt!230919 lt!230915)))

(assert (=> d!48120 (isPrefixOf!0 lt!230916 (_2!6949 lt!230188))))

(assert (=> d!48120 (= lt!230915 (lemmaIsPrefixTransitive!0 lt!230916 (_2!6949 lt!230195) (_2!6949 lt!230188)))))

(declare-fun lt!230929 () Unit!9316)

(assert (=> d!48120 (= lt!230929 e!98834)))

(declare-fun c!8009 () Bool)

(assert (=> d!48120 (= c!8009 (not (= (size!3014 (buf!3479 (_2!6949 lt!230195))) #b00000000000000000000000000000000)))))

(declare-fun lt!230934 () Unit!9316)

(declare-fun lt!230932 () Unit!9316)

(assert (=> d!48120 (= lt!230934 lt!230932)))

(assert (=> d!48120 (isPrefixOf!0 (_2!6949 lt!230188) (_2!6949 lt!230188))))

(assert (=> d!48120 (= lt!230932 (lemmaIsPrefixRefl!0 (_2!6949 lt!230188)))))

(declare-fun lt!230928 () Unit!9316)

(declare-fun lt!230917 () Unit!9316)

(assert (=> d!48120 (= lt!230928 lt!230917)))

(assert (=> d!48120 (= lt!230917 (lemmaIsPrefixRefl!0 (_2!6949 lt!230188)))))

(declare-fun lt!230920 () Unit!9316)

(declare-fun lt!230922 () Unit!9316)

(assert (=> d!48120 (= lt!230920 lt!230922)))

(assert (=> d!48120 (isPrefixOf!0 lt!230916 lt!230916)))

(assert (=> d!48120 (= lt!230922 (lemmaIsPrefixRefl!0 lt!230916))))

(declare-fun lt!230921 () Unit!9316)

(declare-fun lt!230918 () Unit!9316)

(assert (=> d!48120 (= lt!230921 lt!230918)))

(assert (=> d!48120 (isPrefixOf!0 (_2!6949 lt!230195) (_2!6949 lt!230195))))

(assert (=> d!48120 (= lt!230918 (lemmaIsPrefixRefl!0 (_2!6949 lt!230195)))))

(assert (=> d!48120 (= lt!230916 (BitStream!5287 (buf!3479 (_2!6949 lt!230188)) (currentByte!6387 (_2!6949 lt!230195)) (currentBit!6382 (_2!6949 lt!230195))))))

(assert (=> d!48120 (isPrefixOf!0 (_2!6949 lt!230195) (_2!6949 lt!230188))))

(assert (=> d!48120 (= (reader!0 (_2!6949 lt!230195) (_2!6949 lt!230188)) lt!230931)))

(declare-fun b!148192 () Bool)

(declare-fun res!124046 () Bool)

(assert (=> b!148192 (=> (not res!124046) (not e!98835))))

(assert (=> b!148192 (= res!124046 (isPrefixOf!0 (_2!6950 lt!230931) (_2!6949 lt!230188)))))

(assert (= (and d!48120 c!8009) b!148188))

(assert (= (and d!48120 (not c!8009)) b!148190))

(assert (= (and d!48120 res!124047) b!148189))

(assert (= (and b!148189 res!124045) b!148192))

(assert (= (and b!148192 res!124046) b!148191))

(declare-fun m!229799 () Bool)

(assert (=> b!148189 m!229799))

(assert (=> b!148188 m!229127))

(declare-fun m!229801 () Bool)

(assert (=> b!148188 m!229801))

(declare-fun m!229803 () Bool)

(assert (=> b!148188 m!229803))

(declare-fun m!229805 () Bool)

(assert (=> b!148192 m!229805))

(declare-fun m!229807 () Bool)

(assert (=> b!148191 m!229807))

(assert (=> b!148191 m!229189))

(assert (=> b!148191 m!229127))

(assert (=> d!48120 m!229783))

(assert (=> d!48120 m!229721))

(declare-fun m!229809 () Bool)

(assert (=> d!48120 m!229809))

(assert (=> d!48120 m!229733))

(declare-fun m!229811 () Bool)

(assert (=> d!48120 m!229811))

(declare-fun m!229813 () Bool)

(assert (=> d!48120 m!229813))

(assert (=> d!48120 m!229791))

(assert (=> d!48120 m!229103))

(declare-fun m!229815 () Bool)

(assert (=> d!48120 m!229815))

(declare-fun m!229817 () Bool)

(assert (=> d!48120 m!229817))

(declare-fun m!229819 () Bool)

(assert (=> d!48120 m!229819))

(assert (=> b!147885 d!48120))

(declare-fun d!48122 () Bool)

(assert (=> d!48122 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230188)))) ((_ sign_extend 32) (currentByte!6387 thiss!1634)) ((_ sign_extend 32) (currentBit!6382 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230188)))) ((_ sign_extend 32) (currentByte!6387 thiss!1634)) ((_ sign_extend 32) (currentBit!6382 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11758 () Bool)

(assert (= bs!11758 d!48122))

(declare-fun m!229821 () Bool)

(assert (=> bs!11758 m!229821))

(assert (=> b!147885 d!48122))

(declare-fun d!48124 () Bool)

(declare-fun res!124048 () Bool)

(declare-fun e!98836 () Bool)

(assert (=> d!48124 (=> res!124048 e!98836)))

(assert (=> d!48124 (= res!124048 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!48124 (= (arrayRangesEq!330 (_2!6952 lt!230198) (_2!6952 lt!230185) #b00000000000000000000000000000000 to!404) e!98836)))

(declare-fun b!148193 () Bool)

(declare-fun e!98837 () Bool)

(assert (=> b!148193 (= e!98836 e!98837)))

(declare-fun res!124049 () Bool)

(assert (=> b!148193 (=> (not res!124049) (not e!98837))))

(assert (=> b!148193 (= res!124049 (= (select (arr!3783 (_2!6952 lt!230198)) #b00000000000000000000000000000000) (select (arr!3783 (_2!6952 lt!230185)) #b00000000000000000000000000000000)))))

(declare-fun b!148194 () Bool)

(assert (=> b!148194 (= e!98837 (arrayRangesEq!330 (_2!6952 lt!230198) (_2!6952 lt!230185) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48124 (not res!124048)) b!148193))

(assert (= (and b!148193 res!124049) b!148194))

(declare-fun m!229823 () Bool)

(assert (=> b!148193 m!229823))

(declare-fun m!229825 () Bool)

(assert (=> b!148193 m!229825))

(declare-fun m!229827 () Bool)

(assert (=> b!148194 m!229827))

(assert (=> b!147885 d!48124))

(declare-fun d!48126 () Bool)

(assert (=> d!48126 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230188)))) ((_ sign_extend 32) (currentByte!6387 (_2!6949 lt!230195))) ((_ sign_extend 32) (currentBit!6382 (_2!6949 lt!230195))) lt!230199) (bvsle ((_ sign_extend 32) lt!230199) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230188)))) ((_ sign_extend 32) (currentByte!6387 (_2!6949 lt!230195))) ((_ sign_extend 32) (currentBit!6382 (_2!6949 lt!230195)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11759 () Bool)

(assert (= bs!11759 d!48126))

(declare-fun m!229829 () Bool)

(assert (=> bs!11759 m!229829))

(assert (=> b!147885 d!48126))

(declare-fun d!48128 () Bool)

(declare-fun e!98840 () Bool)

(assert (=> d!48128 e!98840))

(declare-fun res!124052 () Bool)

(assert (=> d!48128 (=> (not res!124052) (not e!98840))))

(declare-fun lt!230945 () tuple2!13184)

(declare-fun lt!230946 () tuple2!13184)

(assert (=> d!48128 (= res!124052 (= (bitIndex!0 (size!3014 (buf!3479 (_1!6951 lt!230945))) (currentByte!6387 (_1!6951 lt!230945)) (currentBit!6382 (_1!6951 lt!230945))) (bitIndex!0 (size!3014 (buf!3479 (_1!6951 lt!230946))) (currentByte!6387 (_1!6951 lt!230946)) (currentBit!6382 (_1!6951 lt!230946)))))))

(declare-fun lt!230944 () Unit!9316)

(declare-fun lt!230943 () BitStream!5286)

(declare-fun choose!14 (BitStream!5286 BitStream!5286 BitStream!5286 tuple2!13184 tuple2!13184 BitStream!5286 (_ BitVec 8) tuple2!13184 tuple2!13184 BitStream!5286 (_ BitVec 8)) Unit!9316)

(assert (=> d!48128 (= lt!230944 (choose!14 lt!230181 (_2!6949 lt!230188) lt!230943 lt!230945 (tuple2!13185 (_1!6951 lt!230945) (_2!6951 lt!230945)) (_1!6951 lt!230945) (_2!6951 lt!230945) lt!230946 (tuple2!13185 (_1!6951 lt!230946) (_2!6951 lt!230946)) (_1!6951 lt!230946) (_2!6951 lt!230946)))))

(assert (=> d!48128 (= lt!230946 (readBytePure!0 lt!230943))))

(assert (=> d!48128 (= lt!230945 (readBytePure!0 lt!230181))))

(assert (=> d!48128 (= lt!230943 (BitStream!5287 (buf!3479 (_2!6949 lt!230188)) (currentByte!6387 lt!230181) (currentBit!6382 lt!230181)))))

(assert (=> d!48128 (= (readBytePrefixLemma!0 lt!230181 (_2!6949 lt!230188)) lt!230944)))

(declare-fun b!148197 () Bool)

(assert (=> b!148197 (= e!98840 (= (_2!6951 lt!230945) (_2!6951 lt!230946)))))

(assert (= (and d!48128 res!124052) b!148197))

(declare-fun m!229831 () Bool)

(assert (=> d!48128 m!229831))

(declare-fun m!229833 () Bool)

(assert (=> d!48128 m!229833))

(declare-fun m!229835 () Bool)

(assert (=> d!48128 m!229835))

(declare-fun m!229837 () Bool)

(assert (=> d!48128 m!229837))

(assert (=> d!48128 m!229149))

(assert (=> b!147885 d!48128))

(declare-fun d!48130 () Bool)

(assert (=> d!48130 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230188)))) ((_ sign_extend 32) (currentByte!6387 thiss!1634)) ((_ sign_extend 32) (currentBit!6382 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!230949 () Unit!9316)

(declare-fun choose!26 (BitStream!5286 array!6661 (_ BitVec 32) BitStream!5286) Unit!9316)

(assert (=> d!48130 (= lt!230949 (choose!26 thiss!1634 (buf!3479 (_2!6949 lt!230188)) (bvsub to!404 from!447) (BitStream!5287 (buf!3479 (_2!6949 lt!230188)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634))))))

(assert (=> d!48130 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3479 (_2!6949 lt!230188)) (bvsub to!404 from!447)) lt!230949)))

(declare-fun bs!11760 () Bool)

(assert (= bs!11760 d!48130))

(assert (=> bs!11760 m!229179))

(declare-fun m!229839 () Bool)

(assert (=> bs!11760 m!229839))

(assert (=> b!147885 d!48130))

(declare-fun d!48132 () Bool)

(declare-fun lt!230958 () tuple2!13186)

(declare-fun lt!230960 () tuple2!13186)

(assert (=> d!48132 (arrayRangesEq!330 (_2!6952 lt!230958) (_2!6952 lt!230960) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!230961 () Unit!9316)

(declare-fun lt!230959 () BitStream!5286)

(declare-fun choose!35 (BitStream!5286 array!6661 (_ BitVec 32) (_ BitVec 32) tuple2!13186 array!6661 BitStream!5286 tuple2!13186 array!6661) Unit!9316)

(assert (=> d!48132 (= lt!230961 (choose!35 (_1!6950 lt!230201) arr!237 from!447 to!404 lt!230958 (_2!6952 lt!230958) lt!230959 lt!230960 (_2!6952 lt!230960)))))

(assert (=> d!48132 (= lt!230960 (readByteArrayLoopPure!0 lt!230959 (array!6662 (store (arr!3783 arr!237) from!447 (_2!6951 (readBytePure!0 (_1!6950 lt!230201)))) (size!3014 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!48132 (= lt!230959 (withMovedByteIndex!0 (_1!6950 lt!230201) #b00000000000000000000000000000001))))

(assert (=> d!48132 (= lt!230958 (readByteArrayLoopPure!0 (_1!6950 lt!230201) arr!237 from!447 to!404))))

(assert (=> d!48132 (= (readByteArrayLoopArrayPrefixLemma!0 (_1!6950 lt!230201) arr!237 from!447 to!404) lt!230961)))

(declare-fun bs!11762 () Bool)

(assert (= bs!11762 d!48132))

(assert (=> bs!11762 m!229181))

(declare-fun m!229841 () Bool)

(assert (=> bs!11762 m!229841))

(declare-fun m!229843 () Bool)

(assert (=> bs!11762 m!229843))

(declare-fun m!229845 () Bool)

(assert (=> bs!11762 m!229845))

(assert (=> bs!11762 m!229135))

(assert (=> bs!11762 m!229147))

(declare-fun m!229847 () Bool)

(assert (=> bs!11762 m!229847))

(assert (=> b!147885 d!48132))

(declare-fun d!48134 () Bool)

(declare-fun e!98841 () Bool)

(assert (=> d!48134 e!98841))

(declare-fun res!124054 () Bool)

(assert (=> d!48134 (=> (not res!124054) (not e!98841))))

(declare-fun lt!230965 () (_ BitVec 64))

(declare-fun lt!230963 () (_ BitVec 64))

(declare-fun lt!230964 () (_ BitVec 64))

(assert (=> d!48134 (= res!124054 (= lt!230964 (bvsub lt!230963 lt!230965)))))

(assert (=> d!48134 (or (= (bvand lt!230963 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!230965 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!230963 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!230963 lt!230965) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48134 (= lt!230965 (remainingBits!0 ((_ sign_extend 32) (size!3014 (buf!3479 (_1!6951 lt!230180)))) ((_ sign_extend 32) (currentByte!6387 (_1!6951 lt!230180))) ((_ sign_extend 32) (currentBit!6382 (_1!6951 lt!230180)))))))

(declare-fun lt!230962 () (_ BitVec 64))

(declare-fun lt!230966 () (_ BitVec 64))

(assert (=> d!48134 (= lt!230963 (bvmul lt!230962 lt!230966))))

(assert (=> d!48134 (or (= lt!230962 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!230966 (bvsdiv (bvmul lt!230962 lt!230966) lt!230962)))))

(assert (=> d!48134 (= lt!230966 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!48134 (= lt!230962 ((_ sign_extend 32) (size!3014 (buf!3479 (_1!6951 lt!230180)))))))

(assert (=> d!48134 (= lt!230964 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6387 (_1!6951 lt!230180))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6382 (_1!6951 lt!230180)))))))

(assert (=> d!48134 (invariant!0 (currentBit!6382 (_1!6951 lt!230180)) (currentByte!6387 (_1!6951 lt!230180)) (size!3014 (buf!3479 (_1!6951 lt!230180))))))

(assert (=> d!48134 (= (bitIndex!0 (size!3014 (buf!3479 (_1!6951 lt!230180))) (currentByte!6387 (_1!6951 lt!230180)) (currentBit!6382 (_1!6951 lt!230180))) lt!230964)))

(declare-fun b!148198 () Bool)

(declare-fun res!124053 () Bool)

(assert (=> b!148198 (=> (not res!124053) (not e!98841))))

(assert (=> b!148198 (= res!124053 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!230964))))

(declare-fun b!148199 () Bool)

(declare-fun lt!230967 () (_ BitVec 64))

(assert (=> b!148199 (= e!98841 (bvsle lt!230964 (bvmul lt!230967 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!148199 (or (= lt!230967 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!230967 #b0000000000000000000000000000000000000000000000000000000000001000) lt!230967)))))

(assert (=> b!148199 (= lt!230967 ((_ sign_extend 32) (size!3014 (buf!3479 (_1!6951 lt!230180)))))))

(assert (= (and d!48134 res!124054) b!148198))

(assert (= (and b!148198 res!124053) b!148199))

(declare-fun m!229849 () Bool)

(assert (=> d!48134 m!229849))

(declare-fun m!229851 () Bool)

(assert (=> d!48134 m!229851))

(assert (=> b!147885 d!48134))

(declare-fun d!48136 () Bool)

(assert (=> d!48136 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230188)))) ((_ sign_extend 32) (currentByte!6387 (_2!6949 lt!230195))) ((_ sign_extend 32) (currentBit!6382 (_2!6949 lt!230195))) lt!230199)))

(declare-fun lt!230968 () Unit!9316)

(assert (=> d!48136 (= lt!230968 (choose!26 (_2!6949 lt!230195) (buf!3479 (_2!6949 lt!230188)) lt!230199 (BitStream!5287 (buf!3479 (_2!6949 lt!230188)) (currentByte!6387 (_2!6949 lt!230195)) (currentBit!6382 (_2!6949 lt!230195)))))))

(assert (=> d!48136 (= (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6949 lt!230195) (buf!3479 (_2!6949 lt!230188)) lt!230199) lt!230968)))

(declare-fun bs!11763 () Bool)

(assert (= bs!11763 d!48136))

(assert (=> bs!11763 m!229141))

(declare-fun m!229853 () Bool)

(assert (=> bs!11763 m!229853))

(assert (=> b!147885 d!48136))

(declare-fun d!48138 () Bool)

(declare-fun e!98844 () Bool)

(assert (=> d!48138 e!98844))

(declare-fun res!124057 () Bool)

(assert (=> d!48138 (=> (not res!124057) (not e!98844))))

(assert (=> d!48138 (= res!124057 (and (or (let ((rhs!3266 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3266 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3266) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!48139 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!48139 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!48139 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3265 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3265 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3265) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!230977 () Unit!9316)

(declare-fun choose!57 (BitStream!5286 BitStream!5286 (_ BitVec 64) (_ BitVec 32)) Unit!9316)

(assert (=> d!48138 (= lt!230977 (choose!57 thiss!1634 (_2!6949 lt!230195) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!48138 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6949 lt!230195) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!230977)))

(declare-fun lt!230976 () (_ BitVec 32))

(declare-fun b!148202 () Bool)

(assert (=> b!148202 (= e!98844 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230195)))) ((_ sign_extend 32) (currentByte!6387 (_2!6949 lt!230195))) ((_ sign_extend 32) (currentBit!6382 (_2!6949 lt!230195))) (bvsub (bvsub to!404 from!447) lt!230976)))))

(assert (=> b!148202 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!230976 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!230976) #b10000000000000000000000000000000)))))

(declare-fun lt!230975 () (_ BitVec 64))

(assert (=> b!148202 (= lt!230976 ((_ extract 31 0) lt!230975))))

(assert (=> b!148202 (and (bvslt lt!230975 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!230975 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!148202 (= lt!230975 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!48138 res!124057) b!148202))

(declare-fun m!229855 () Bool)

(assert (=> d!48138 m!229855))

(declare-fun m!229857 () Bool)

(assert (=> b!148202 m!229857))

(assert (=> b!147885 d!48138))

(declare-fun d!48141 () Bool)

(declare-fun e!98847 () Bool)

(assert (=> d!48141 e!98847))

(declare-fun res!124066 () Bool)

(assert (=> d!48141 (=> (not res!124066) (not e!98847))))

(declare-fun lt!230991 () tuple2!13180)

(assert (=> d!48141 (= res!124066 (= (size!3014 (buf!3479 thiss!1634)) (size!3014 (buf!3479 (_2!6949 lt!230991)))))))

(declare-fun choose!6 (BitStream!5286 (_ BitVec 8)) tuple2!13180)

(assert (=> d!48141 (= lt!230991 (choose!6 thiss!1634 (select (arr!3783 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!48141 (validate_offset_byte!0 ((_ sign_extend 32) (size!3014 (buf!3479 thiss!1634))) ((_ sign_extend 32) (currentByte!6387 thiss!1634)) ((_ sign_extend 32) (currentBit!6382 thiss!1634)))))

(assert (=> d!48141 (= (appendByte!0 thiss!1634 (select (arr!3783 arr!237) from!447)) lt!230991)))

(declare-fun b!148209 () Bool)

(declare-fun res!124064 () Bool)

(assert (=> b!148209 (=> (not res!124064) (not e!98847))))

(declare-fun lt!230990 () (_ BitVec 64))

(declare-fun lt!230988 () (_ BitVec 64))

(assert (=> b!148209 (= res!124064 (= (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230991))) (currentByte!6387 (_2!6949 lt!230991)) (currentBit!6382 (_2!6949 lt!230991))) (bvadd lt!230988 lt!230990)))))

(assert (=> b!148209 (or (not (= (bvand lt!230988 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!230990 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!230988 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!230988 lt!230990) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!148209 (= lt!230990 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!148209 (= lt!230988 (bitIndex!0 (size!3014 (buf!3479 thiss!1634)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634)))))

(declare-fun b!148210 () Bool)

(declare-fun res!124065 () Bool)

(assert (=> b!148210 (=> (not res!124065) (not e!98847))))

(assert (=> b!148210 (= res!124065 (isPrefixOf!0 thiss!1634 (_2!6949 lt!230991)))))

(declare-fun lt!230989 () tuple2!13182)

(declare-fun b!148211 () Bool)

(declare-fun lt!230992 () tuple2!13184)

(assert (=> b!148211 (= e!98847 (and (= (_2!6951 lt!230992) (select (arr!3783 arr!237) from!447)) (= (_1!6951 lt!230992) (_2!6950 lt!230989))))))

(assert (=> b!148211 (= lt!230992 (readBytePure!0 (_1!6950 lt!230989)))))

(assert (=> b!148211 (= lt!230989 (reader!0 thiss!1634 (_2!6949 lt!230991)))))

(assert (= (and d!48141 res!124066) b!148209))

(assert (= (and b!148209 res!124064) b!148210))

(assert (= (and b!148210 res!124065) b!148211))

(assert (=> d!48141 m!229159))

(declare-fun m!229859 () Bool)

(assert (=> d!48141 m!229859))

(declare-fun m!229861 () Bool)

(assert (=> d!48141 m!229861))

(declare-fun m!229863 () Bool)

(assert (=> b!148209 m!229863))

(assert (=> b!148209 m!229129))

(declare-fun m!229865 () Bool)

(assert (=> b!148210 m!229865))

(declare-fun m!229867 () Bool)

(assert (=> b!148211 m!229867))

(declare-fun m!229869 () Bool)

(assert (=> b!148211 m!229869))

(assert (=> b!147885 d!48141))

(declare-fun d!48143 () Bool)

(assert (=> d!48143 (isPrefixOf!0 thiss!1634 (_2!6949 lt!230188))))

(declare-fun lt!230995 () Unit!9316)

(declare-fun choose!30 (BitStream!5286 BitStream!5286 BitStream!5286) Unit!9316)

(assert (=> d!48143 (= lt!230995 (choose!30 thiss!1634 (_2!6949 lt!230195) (_2!6949 lt!230188)))))

(assert (=> d!48143 (isPrefixOf!0 thiss!1634 (_2!6949 lt!230195))))

(assert (=> d!48143 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6949 lt!230195) (_2!6949 lt!230188)) lt!230995)))

(declare-fun bs!11764 () Bool)

(assert (= bs!11764 d!48143))

(assert (=> bs!11764 m!229167))

(declare-fun m!229871 () Bool)

(assert (=> bs!11764 m!229871))

(assert (=> bs!11764 m!229125))

(assert (=> b!147885 d!48143))

(declare-fun d!48145 () Bool)

(declare-fun lt!230996 () tuple3!580)

(assert (=> d!48145 (= lt!230996 (readByteArrayLoop!0 (_1!6950 lt!230177) lt!230178 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!48145 (= (readByteArrayLoopPure!0 (_1!6950 lt!230177) lt!230178 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13187 (_2!6962 lt!230996) (_3!361 lt!230996)))))

(declare-fun bs!11765 () Bool)

(assert (= bs!11765 d!48145))

(declare-fun m!229873 () Bool)

(assert (=> bs!11765 m!229873))

(assert (=> b!147885 d!48145))

(declare-fun d!48147 () Bool)

(declare-fun lt!230997 () tuple2!13200)

(assert (=> d!48147 (= lt!230997 (readByte!0 lt!230181))))

(assert (=> d!48147 (= (readBytePure!0 lt!230181) (tuple2!13185 (_2!6961 lt!230997) (_1!6961 lt!230997)))))

(declare-fun bs!11766 () Bool)

(assert (= bs!11766 d!48147))

(declare-fun m!229875 () Bool)

(assert (=> bs!11766 m!229875))

(assert (=> b!147885 d!48147))

(declare-fun d!48149 () Bool)

(declare-fun lt!230998 () tuple2!13200)

(assert (=> d!48149 (= lt!230998 (readByte!0 (_1!6950 lt!230201)))))

(assert (=> d!48149 (= (readBytePure!0 (_1!6950 lt!230201)) (tuple2!13185 (_2!6961 lt!230998) (_1!6961 lt!230998)))))

(declare-fun bs!11767 () Bool)

(assert (= bs!11767 d!48149))

(declare-fun m!229877 () Bool)

(assert (=> bs!11767 m!229877))

(assert (=> b!147885 d!48149))

(declare-fun d!48151 () Bool)

(declare-fun res!124067 () Bool)

(declare-fun e!98848 () Bool)

(assert (=> d!48151 (=> res!124067 e!98848)))

(assert (=> d!48151 (= res!124067 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!48151 (= (arrayRangesEq!330 (_2!6952 lt!230198) (_2!6952 lt!230190) #b00000000000000000000000000000000 to!404) e!98848)))

(declare-fun b!148212 () Bool)

(declare-fun e!98849 () Bool)

(assert (=> b!148212 (= e!98848 e!98849)))

(declare-fun res!124068 () Bool)

(assert (=> b!148212 (=> (not res!124068) (not e!98849))))

(assert (=> b!148212 (= res!124068 (= (select (arr!3783 (_2!6952 lt!230198)) #b00000000000000000000000000000000) (select (arr!3783 (_2!6952 lt!230190)) #b00000000000000000000000000000000)))))

(declare-fun b!148213 () Bool)

(assert (=> b!148213 (= e!98849 (arrayRangesEq!330 (_2!6952 lt!230198) (_2!6952 lt!230190) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48151 (not res!124067)) b!148212))

(assert (= (and b!148212 res!124068) b!148213))

(assert (=> b!148212 m!229823))

(declare-fun m!229879 () Bool)

(assert (=> b!148212 m!229879))

(declare-fun m!229881 () Bool)

(assert (=> b!148213 m!229881))

(assert (=> b!147885 d!48151))

(declare-fun d!48153 () Bool)

(declare-fun res!124069 () Bool)

(declare-fun e!98850 () Bool)

(assert (=> d!48153 (=> res!124069 e!98850)))

(assert (=> d!48153 (= res!124069 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!48153 (= (arrayRangesEq!330 (_2!6952 lt!230185) (_2!6952 lt!230198) #b00000000000000000000000000000000 to!404) e!98850)))

(declare-fun b!148214 () Bool)

(declare-fun e!98851 () Bool)

(assert (=> b!148214 (= e!98850 e!98851)))

(declare-fun res!124070 () Bool)

(assert (=> b!148214 (=> (not res!124070) (not e!98851))))

(assert (=> b!148214 (= res!124070 (= (select (arr!3783 (_2!6952 lt!230185)) #b00000000000000000000000000000000) (select (arr!3783 (_2!6952 lt!230198)) #b00000000000000000000000000000000)))))

(declare-fun b!148215 () Bool)

(assert (=> b!148215 (= e!98851 (arrayRangesEq!330 (_2!6952 lt!230185) (_2!6952 lt!230198) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48153 (not res!124069)) b!148214))

(assert (= (and b!148214 res!124070) b!148215))

(assert (=> b!148214 m!229825))

(assert (=> b!148214 m!229823))

(declare-fun m!229883 () Bool)

(assert (=> b!148215 m!229883))

(assert (=> b!147875 d!48153))

(declare-fun d!48155 () Bool)

(assert (=> d!48155 (arrayRangesEq!330 (_2!6952 lt!230185) (_2!6952 lt!230198) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!231001 () Unit!9316)

(declare-fun choose!85 (array!6661 array!6661 (_ BitVec 32) (_ BitVec 32)) Unit!9316)

(assert (=> d!48155 (= lt!231001 (choose!85 (_2!6952 lt!230198) (_2!6952 lt!230185) #b00000000000000000000000000000000 to!404))))

(assert (=> d!48155 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 to!404) (bvsle to!404 (size!3014 (_2!6952 lt!230198))))))

(assert (=> d!48155 (= (arrayRangesEqSymmetricLemma!62 (_2!6952 lt!230198) (_2!6952 lt!230185) #b00000000000000000000000000000000 to!404) lt!231001)))

(declare-fun bs!11768 () Bool)

(assert (= bs!11768 d!48155))

(assert (=> bs!11768 m!229191))

(declare-fun m!229885 () Bool)

(assert (=> bs!11768 m!229885))

(assert (=> b!147875 d!48155))

(declare-fun d!48157 () Bool)

(declare-fun res!124073 () Bool)

(declare-fun e!98853 () Bool)

(assert (=> d!48157 (=> (not res!124073) (not e!98853))))

(assert (=> d!48157 (= res!124073 (= (size!3014 (buf!3479 thiss!1634)) (size!3014 (buf!3479 (_2!6949 lt!230195)))))))

(assert (=> d!48157 (= (isPrefixOf!0 thiss!1634 (_2!6949 lt!230195)) e!98853)))

(declare-fun b!148216 () Bool)

(declare-fun res!124072 () Bool)

(assert (=> b!148216 (=> (not res!124072) (not e!98853))))

(assert (=> b!148216 (= res!124072 (bvsle (bitIndex!0 (size!3014 (buf!3479 thiss!1634)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634)) (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230195))) (currentByte!6387 (_2!6949 lt!230195)) (currentBit!6382 (_2!6949 lt!230195)))))))

(declare-fun b!148217 () Bool)

(declare-fun e!98852 () Bool)

(assert (=> b!148217 (= e!98853 e!98852)))

(declare-fun res!124071 () Bool)

(assert (=> b!148217 (=> res!124071 e!98852)))

(assert (=> b!148217 (= res!124071 (= (size!3014 (buf!3479 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!148218 () Bool)

(assert (=> b!148218 (= e!98852 (arrayBitRangesEq!0 (buf!3479 thiss!1634) (buf!3479 (_2!6949 lt!230195)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3014 (buf!3479 thiss!1634)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634))))))

(assert (= (and d!48157 res!124073) b!148216))

(assert (= (and b!148216 res!124072) b!148217))

(assert (= (and b!148217 (not res!124071)) b!148218))

(assert (=> b!148216 m!229129))

(assert (=> b!148216 m!229127))

(assert (=> b!148218 m!229129))

(assert (=> b!148218 m!229129))

(declare-fun m!229887 () Bool)

(assert (=> b!148218 m!229887))

(assert (=> b!147871 d!48157))

(declare-fun lt!231002 () tuple3!580)

(declare-fun d!48159 () Bool)

(assert (=> d!48159 (= lt!231002 (readByteArrayLoop!0 (_1!6950 lt!230194) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!48159 (= (readByteArrayLoopPure!0 (_1!6950 lt!230194) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13187 (_2!6962 lt!231002) (_3!361 lt!231002)))))

(declare-fun bs!11769 () Bool)

(assert (= bs!11769 d!48159))

(declare-fun m!229889 () Bool)

(assert (=> bs!11769 m!229889))

(assert (=> b!147882 d!48159))

(declare-fun d!48161 () Bool)

(assert (=> d!48161 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230188)))) ((_ sign_extend 32) (currentByte!6387 (_2!6949 lt!230195))) ((_ sign_extend 32) (currentBit!6382 (_2!6949 lt!230195))) lt!230189) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230188)))) ((_ sign_extend 32) (currentByte!6387 (_2!6949 lt!230195))) ((_ sign_extend 32) (currentBit!6382 (_2!6949 lt!230195)))) lt!230189))))

(declare-fun bs!11770 () Bool)

(assert (= bs!11770 d!48161))

(assert (=> bs!11770 m!229829))

(assert (=> b!147882 d!48161))

(declare-fun d!48163 () Bool)

(assert (=> d!48163 (validate_offset_bits!1 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230188)))) ((_ sign_extend 32) (currentByte!6387 (_2!6949 lt!230195))) ((_ sign_extend 32) (currentBit!6382 (_2!6949 lt!230195))) lt!230189)))

(declare-fun lt!231005 () Unit!9316)

(declare-fun choose!9 (BitStream!5286 array!6661 (_ BitVec 64) BitStream!5286) Unit!9316)

(assert (=> d!48163 (= lt!231005 (choose!9 (_2!6949 lt!230195) (buf!3479 (_2!6949 lt!230188)) lt!230189 (BitStream!5287 (buf!3479 (_2!6949 lt!230188)) (currentByte!6387 (_2!6949 lt!230195)) (currentBit!6382 (_2!6949 lt!230195)))))))

(assert (=> d!48163 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6949 lt!230195) (buf!3479 (_2!6949 lt!230188)) lt!230189) lt!231005)))

(declare-fun bs!11771 () Bool)

(assert (= bs!11771 d!48163))

(assert (=> bs!11771 m!229113))

(declare-fun m!229891 () Bool)

(assert (=> bs!11771 m!229891))

(assert (=> b!147882 d!48163))

(assert (=> b!147882 d!48120))

(declare-fun d!48165 () Bool)

(assert (=> d!48165 (= (invariant!0 (currentBit!6382 thiss!1634) (currentByte!6387 thiss!1634) (size!3014 (buf!3479 (_2!6949 lt!230195)))) (and (bvsge (currentBit!6382 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6382 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6387 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6387 thiss!1634) (size!3014 (buf!3479 (_2!6949 lt!230195)))) (and (= (currentBit!6382 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6387 thiss!1634) (size!3014 (buf!3479 (_2!6949 lt!230195))))))))))

(assert (=> b!147872 d!48165))

(declare-fun d!48167 () Bool)

(assert (=> d!48167 (= (invariant!0 (currentBit!6382 thiss!1634) (currentByte!6387 thiss!1634) (size!3014 (buf!3479 thiss!1634))) (and (bvsge (currentBit!6382 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6382 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6387 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6387 thiss!1634) (size!3014 (buf!3479 thiss!1634))) (and (= (currentBit!6382 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6387 thiss!1634) (size!3014 (buf!3479 thiss!1634)))))))))

(assert (=> b!147883 d!48167))

(declare-fun d!48169 () Bool)

(assert (=> d!48169 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3014 (buf!3479 thiss!1634))) ((_ sign_extend 32) (currentByte!6387 thiss!1634)) ((_ sign_extend 32) (currentBit!6382 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3014 (buf!3479 thiss!1634))) ((_ sign_extend 32) (currentByte!6387 thiss!1634)) ((_ sign_extend 32) (currentBit!6382 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11772 () Bool)

(assert (= bs!11772 d!48169))

(assert (=> bs!11772 m!229701))

(assert (=> b!147873 d!48169))

(check-sat (not b!148194) (not d!48090) (not d!48126) (not d!48112) (not d!48143) (not d!48141) (not b!148181) (not b!148213) (not b!148161) (not b!148188) (not d!48102) (not b!148191) (not b!148163) (not d!48122) (not d!48169) (not d!48100) (not d!48134) (not d!48155) (not b!148202) (not d!48130) (not d!48163) (not d!48110) (not b!148179) (not b!148216) (not d!48132) (not b!148211) (not d!48088) (not b!148184) (not b!148182) (not d!48138) (not b!148158) (not d!48098) (not b!148131) (not b!148186) (not d!48106) (not b!148159) (not b!148218) (not b!148162) (not d!48147) (not d!48128) (not d!48149) (not b!148187) (not d!48118) (not b!148209) (not d!48094) (not d!48159) (not b!148210) (not b!148180) (not b!148192) (not d!48114) (not d!48145) (not b!148189) (not b!148165) (not b!148183) (not d!48086) (not b!148129) (not d!48161) (not d!48120) (not d!48116) (not b!148178) (not d!48136) (not d!48108) (not b!148147) (not b!148215))
(check-sat)
(get-model)

(declare-fun lt!231504 () tuple3!580)

(declare-fun c!8028 () Bool)

(declare-fun bm!2028 () Bool)

(declare-fun call!2031 () (_ BitVec 64))

(assert (=> bm!2028 (= call!2031 (bitIndex!0 (ite c!8028 (size!3014 (buf!3479 (_2!6962 lt!231504))) (size!3014 (buf!3479 (_1!6950 lt!230201)))) (ite c!8028 (currentByte!6387 (_2!6962 lt!231504)) (currentByte!6387 (_1!6950 lt!230201))) (ite c!8028 (currentBit!6382 (_2!6962 lt!231504)) (currentBit!6382 (_1!6950 lt!230201)))))))

(declare-fun call!2032 () Bool)

(declare-fun lt!231495 () tuple2!13200)

(declare-fun bm!2029 () Bool)

(assert (=> bm!2029 (= call!2032 (arrayRangesEq!330 arr!237 (ite c!8028 (array!6662 (store (arr!3783 arr!237) from!447 (_1!6961 lt!231495)) (size!3014 arr!237)) arr!237) #b00000000000000000000000000000000 (ite c!8028 from!447 (size!3014 arr!237))))))

(declare-fun e!99032 () Bool)

(declare-fun lt!231494 () tuple3!580)

(declare-fun b!148455 () Bool)

(assert (=> b!148455 (= e!99032 (= (select (arr!3783 (_3!361 lt!231494)) from!447) (_2!6951 (readBytePure!0 (_1!6950 lt!230201)))))))

(assert (=> b!148455 (and (bvsge from!447 #b00000000000000000000000000000000) (bvslt from!447 (size!3014 (_3!361 lt!231494))))))

(declare-fun lt!231492 () (_ BitVec 32))

(declare-fun call!2033 () Bool)

(declare-fun lt!231505 () array!6661)

(declare-fun lt!231512 () array!6661)

(declare-fun bm!2030 () Bool)

(declare-fun lt!231517 () (_ BitVec 32))

(declare-fun lt!231497 () (_ BitVec 32))

(assert (=> bm!2030 (= call!2033 (arrayRangesEq!330 (ite c!8028 arr!237 lt!231512) (ite c!8028 (_3!361 lt!231504) lt!231505) (ite c!8028 lt!231492 lt!231517) (ite c!8028 from!447 lt!231497)))))

(declare-fun d!48361 () Bool)

(assert (=> d!48361 e!99032))

(declare-fun res!124269 () Bool)

(assert (=> d!48361 (=> res!124269 e!99032)))

(assert (=> d!48361 (= res!124269 (bvsge from!447 to!404))))

(declare-fun lt!231509 () Bool)

(declare-fun e!99031 () Bool)

(assert (=> d!48361 (= lt!231509 e!99031)))

(declare-fun res!124270 () Bool)

(assert (=> d!48361 (=> (not res!124270) (not e!99031))))

(declare-fun lt!231520 () (_ BitVec 64))

(declare-fun lt!231491 () (_ BitVec 64))

(assert (=> d!48361 (= res!124270 (= (bvadd lt!231491 lt!231520) (bitIndex!0 (size!3014 (buf!3479 (_2!6962 lt!231494))) (currentByte!6387 (_2!6962 lt!231494)) (currentBit!6382 (_2!6962 lt!231494)))))))

(assert (=> d!48361 (or (not (= (bvand lt!231491 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!231520 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!231491 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!231491 lt!231520) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!231500 () (_ BitVec 64))

(assert (=> d!48361 (= lt!231520 (bvmul lt!231500 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!48361 (or (= lt!231500 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!231500 #b0000000000000000000000000000000000000000000000000000000000001000) lt!231500)))))

(assert (=> d!48361 (= lt!231500 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(assert (=> d!48361 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000)))))

(assert (=> d!48361 (= lt!231491 (bitIndex!0 (size!3014 (buf!3479 (_1!6950 lt!230201))) (currentByte!6387 (_1!6950 lt!230201)) (currentBit!6382 (_1!6950 lt!230201))))))

(declare-fun e!99030 () tuple3!580)

(assert (=> d!48361 (= lt!231494 e!99030)))

(assert (=> d!48361 (= c!8028 (bvslt from!447 to!404))))

(assert (=> d!48361 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3014 arr!237)))))

(assert (=> d!48361 (= (readByteArrayLoop!0 (_1!6950 lt!230201) arr!237 from!447 to!404) lt!231494)))

(declare-fun b!148456 () Bool)

(declare-fun lt!231502 () Unit!9316)

(assert (=> b!148456 (= e!99030 (tuple3!581 lt!231502 (_2!6962 lt!231504) (_3!361 lt!231504)))))

(assert (=> b!148456 (= lt!231495 (readByte!0 (_1!6950 lt!230201)))))

(declare-fun lt!231514 () array!6661)

(assert (=> b!148456 (= lt!231514 (array!6662 (store (arr!3783 arr!237) from!447 (_1!6961 lt!231495)) (size!3014 arr!237)))))

(declare-fun lt!231503 () (_ BitVec 64))

(assert (=> b!148456 (= lt!231503 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!231506 () (_ BitVec 32))

(assert (=> b!148456 (= lt!231506 (bvsub to!404 from!447))))

(declare-fun lt!231508 () Unit!9316)

(assert (=> b!148456 (= lt!231508 (validateOffsetBytesFromBitIndexLemma!0 (_1!6950 lt!230201) (_2!6961 lt!231495) lt!231503 lt!231506))))

(assert (=> b!148456 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6961 lt!231495)))) ((_ sign_extend 32) (currentByte!6387 (_2!6961 lt!231495))) ((_ sign_extend 32) (currentBit!6382 (_2!6961 lt!231495))) (bvsub lt!231506 ((_ extract 31 0) (bvsdiv (bvadd lt!231503 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!231518 () Unit!9316)

(assert (=> b!148456 (= lt!231518 lt!231508)))

(assert (=> b!148456 (= lt!231504 (readByteArrayLoop!0 (_2!6961 lt!231495) lt!231514 (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!148456 (= (bitIndex!0 (size!3014 (buf!3479 (_2!6961 lt!231495))) (currentByte!6387 (_2!6961 lt!231495)) (currentBit!6382 (_2!6961 lt!231495))) (bvadd (bitIndex!0 (size!3014 (buf!3479 (_1!6950 lt!230201))) (currentByte!6387 (_1!6950 lt!230201)) (currentBit!6382 (_1!6950 lt!230201))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!231488 () Unit!9316)

(declare-fun Unit!9376 () Unit!9316)

(assert (=> b!148456 (= lt!231488 Unit!9376)))

(assert (=> b!148456 (= (bvadd (bitIndex!0 (size!3014 (buf!3479 (_2!6961 lt!231495))) (currentByte!6387 (_2!6961 lt!231495)) (currentBit!6382 (_2!6961 lt!231495))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2031)))

(declare-fun lt!231513 () Unit!9316)

(declare-fun Unit!9377 () Unit!9316)

(assert (=> b!148456 (= lt!231513 Unit!9377)))

(assert (=> b!148456 (= (bvadd (bitIndex!0 (size!3014 (buf!3479 (_1!6950 lt!230201))) (currentByte!6387 (_1!6950 lt!230201)) (currentBit!6382 (_1!6950 lt!230201))) (bvmul ((_ sign_extend 32) (bvsub to!404 from!447)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2031)))

(declare-fun lt!231499 () Unit!9316)

(declare-fun Unit!9378 () Unit!9316)

(assert (=> b!148456 (= lt!231499 Unit!9378)))

(assert (=> b!148456 (and (= (buf!3479 (_1!6950 lt!230201)) (buf!3479 (_2!6962 lt!231504))) (= (size!3014 arr!237) (size!3014 (_3!361 lt!231504))))))

(declare-fun lt!231487 () Unit!9316)

(declare-fun Unit!9379 () Unit!9316)

(assert (=> b!148456 (= lt!231487 Unit!9379)))

(declare-fun lt!231515 () Unit!9316)

(declare-fun arrayUpdatedAtPrefixLemma!15 (array!6661 (_ BitVec 32) (_ BitVec 8)) Unit!9316)

(assert (=> b!148456 (= lt!231515 (arrayUpdatedAtPrefixLemma!15 arr!237 from!447 (_1!6961 lt!231495)))))

(assert (=> b!148456 call!2032))

(declare-fun lt!231485 () Unit!9316)

(assert (=> b!148456 (= lt!231485 lt!231515)))

(assert (=> b!148456 (= lt!231492 #b00000000000000000000000000000000)))

(declare-fun lt!231490 () Unit!9316)

(declare-fun arrayRangesEqTransitive!55 (array!6661 array!6661 array!6661 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9316)

(assert (=> b!148456 (= lt!231490 (arrayRangesEqTransitive!55 arr!237 lt!231514 (_3!361 lt!231504) lt!231492 from!447 (bvadd from!447 #b00000000000000000000000000000001)))))

(assert (=> b!148456 call!2033))

(declare-fun lt!231498 () Unit!9316)

(assert (=> b!148456 (= lt!231498 lt!231490)))

(assert (=> b!148456 (arrayRangesEq!330 arr!237 (_3!361 lt!231504) #b00000000000000000000000000000000 from!447)))

(declare-fun lt!231510 () Unit!9316)

(declare-fun Unit!9380 () Unit!9316)

(assert (=> b!148456 (= lt!231510 Unit!9380)))

(declare-fun lt!231516 () Unit!9316)

(declare-fun arrayRangesEqImpliesEq!15 (array!6661 array!6661 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9316)

(assert (=> b!148456 (= lt!231516 (arrayRangesEqImpliesEq!15 lt!231514 (_3!361 lt!231504) #b00000000000000000000000000000000 from!447 (bvadd from!447 #b00000000000000000000000000000001)))))

(assert (=> b!148456 (= (select (store (arr!3783 arr!237) from!447 (_1!6961 lt!231495)) from!447) (select (arr!3783 (_3!361 lt!231504)) from!447))))

(declare-fun lt!231493 () Unit!9316)

(assert (=> b!148456 (= lt!231493 lt!231516)))

(declare-fun lt!231486 () Bool)

(assert (=> b!148456 (= lt!231486 (= (select (arr!3783 (_3!361 lt!231504)) from!447) (_1!6961 lt!231495)))))

(declare-fun Unit!9381 () Unit!9316)

(assert (=> b!148456 (= lt!231502 Unit!9381)))

(assert (=> b!148456 lt!231486))

(declare-fun lt!231511 () Unit!9316)

(declare-fun b!148457 () Bool)

(assert (=> b!148457 (= e!99030 (tuple3!581 lt!231511 (_1!6950 lt!230201) arr!237))))

(assert (=> b!148457 (= call!2031 call!2031)))

(declare-fun lt!231507 () Unit!9316)

(declare-fun Unit!9382 () Unit!9316)

(assert (=> b!148457 (= lt!231507 Unit!9382)))

(declare-fun lt!231489 () Unit!9316)

(declare-fun arrayRangesEqReflexiveLemma!15 (array!6661) Unit!9316)

(assert (=> b!148457 (= lt!231489 (arrayRangesEqReflexiveLemma!15 arr!237))))

(assert (=> b!148457 call!2032))

(declare-fun lt!231519 () Unit!9316)

(assert (=> b!148457 (= lt!231519 lt!231489)))

(assert (=> b!148457 (= lt!231512 arr!237)))

(assert (=> b!148457 (= lt!231505 arr!237)))

(declare-fun lt!231496 () (_ BitVec 32))

(assert (=> b!148457 (= lt!231496 #b00000000000000000000000000000000)))

(declare-fun lt!231501 () (_ BitVec 32))

(assert (=> b!148457 (= lt!231501 (size!3014 arr!237))))

(assert (=> b!148457 (= lt!231517 #b00000000000000000000000000000000)))

(assert (=> b!148457 (= lt!231497 from!447)))

(declare-fun arrayRangesEqSlicedLemma!15 (array!6661 array!6661 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9316)

(assert (=> b!148457 (= lt!231511 (arrayRangesEqSlicedLemma!15 lt!231512 lt!231505 lt!231496 lt!231501 lt!231517 lt!231497))))

(assert (=> b!148457 call!2033))

(declare-fun b!148458 () Bool)

(assert (=> b!148458 (= e!99031 (arrayRangesEq!330 arr!237 (_3!361 lt!231494) #b00000000000000000000000000000000 from!447))))

(declare-fun b!148459 () Bool)

(declare-fun res!124271 () Bool)

(assert (=> b!148459 (=> (not res!124271) (not e!99031))))

(assert (=> b!148459 (= res!124271 (and (= (buf!3479 (_1!6950 lt!230201)) (buf!3479 (_2!6962 lt!231494))) (= (size!3014 arr!237) (size!3014 (_3!361 lt!231494)))))))

(assert (= (and d!48361 c!8028) b!148456))

(assert (= (and d!48361 (not c!8028)) b!148457))

(assert (= (or b!148456 b!148457) bm!2030))

(assert (= (or b!148456 b!148457) bm!2029))

(assert (= (or b!148456 b!148457) bm!2028))

(assert (= (and d!48361 res!124270) b!148459))

(assert (= (and b!148459 res!124271) b!148458))

(assert (= (and d!48361 (not res!124269)) b!148455))

(declare-fun m!230457 () Bool)

(assert (=> bm!2029 m!230457))

(declare-fun m!230459 () Bool)

(assert (=> bm!2029 m!230459))

(declare-fun m!230461 () Bool)

(assert (=> bm!2028 m!230461))

(declare-fun m!230463 () Bool)

(assert (=> bm!2030 m!230463))

(declare-fun m!230465 () Bool)

(assert (=> b!148457 m!230465))

(declare-fun m!230467 () Bool)

(assert (=> b!148457 m!230467))

(declare-fun m!230469 () Bool)

(assert (=> b!148455 m!230469))

(assert (=> b!148455 m!229147))

(declare-fun m!230471 () Bool)

(assert (=> b!148456 m!230471))

(declare-fun m!230473 () Bool)

(assert (=> b!148456 m!230473))

(declare-fun m!230475 () Bool)

(assert (=> b!148456 m!230475))

(assert (=> b!148456 m!230457))

(declare-fun m!230477 () Bool)

(assert (=> b!148456 m!230477))

(declare-fun m!230479 () Bool)

(assert (=> b!148456 m!230479))

(declare-fun m!230481 () Bool)

(assert (=> b!148456 m!230481))

(declare-fun m!230483 () Bool)

(assert (=> b!148456 m!230483))

(declare-fun m!230485 () Bool)

(assert (=> b!148456 m!230485))

(declare-fun m!230487 () Bool)

(assert (=> b!148456 m!230487))

(assert (=> b!148456 m!229877))

(declare-fun m!230489 () Bool)

(assert (=> b!148456 m!230489))

(declare-fun m!230491 () Bool)

(assert (=> b!148456 m!230491))

(declare-fun m!230493 () Bool)

(assert (=> b!148458 m!230493))

(declare-fun m!230495 () Bool)

(assert (=> d!48361 m!230495))

(assert (=> d!48361 m!230489))

(assert (=> d!48102 d!48361))

(declare-fun d!48363 () Bool)

(assert (=> d!48363 (= (remainingBits!0 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230188)))) ((_ sign_extend 32) (currentByte!6387 (_2!6949 lt!230188))) ((_ sign_extend 32) (currentBit!6382 (_2!6949 lt!230188)))) (bvsub (bvmul ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230188)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6387 (_2!6949 lt!230188))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6382 (_2!6949 lt!230188))))))))

(assert (=> d!48086 d!48363))

(declare-fun d!48365 () Bool)

(assert (=> d!48365 (= (invariant!0 (currentBit!6382 (_2!6949 lt!230188)) (currentByte!6387 (_2!6949 lt!230188)) (size!3014 (buf!3479 (_2!6949 lt!230188)))) (and (bvsge (currentBit!6382 (_2!6949 lt!230188)) #b00000000000000000000000000000000) (bvslt (currentBit!6382 (_2!6949 lt!230188)) #b00000000000000000000000000001000) (bvsge (currentByte!6387 (_2!6949 lt!230188)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6387 (_2!6949 lt!230188)) (size!3014 (buf!3479 (_2!6949 lt!230188)))) (and (= (currentBit!6382 (_2!6949 lt!230188)) #b00000000000000000000000000000000) (= (currentByte!6387 (_2!6949 lt!230188)) (size!3014 (buf!3479 (_2!6949 lt!230188))))))))))

(assert (=> d!48086 d!48365))

(declare-fun d!48367 () Bool)

(assert (=> d!48367 (= (remainingBits!0 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230188)))) ((_ sign_extend 32) (currentByte!6387 (_2!6949 lt!230195))) ((_ sign_extend 32) (currentBit!6382 (_2!6949 lt!230195)))) (bvsub (bvmul ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230188)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6387 (_2!6949 lt!230195))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6382 (_2!6949 lt!230195))))))))

(assert (=> d!48126 d!48367))

(declare-fun lt!231540 () (_ BitVec 8))

(declare-fun lt!231536 () (_ BitVec 8))

(declare-fun d!48369 () Bool)

(assert (=> d!48369 (= lt!231540 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3783 (buf!3479 (BitStream!5287 (buf!3479 (_2!6949 lt!230188)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634)))) (currentByte!6387 (BitStream!5287 (buf!3479 (_2!6949 lt!230188)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634))))) ((_ sign_extend 24) lt!231536))))))

(assert (=> d!48369 (= lt!231536 ((_ extract 7 0) (currentBit!6382 (BitStream!5287 (buf!3479 (_2!6949 lt!230188)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634)))))))

(declare-fun e!99038 () Bool)

(assert (=> d!48369 e!99038))

(declare-fun res!124278 () Bool)

(assert (=> d!48369 (=> (not res!124278) (not e!99038))))

(assert (=> d!48369 (= res!124278 (validate_offset_bits!1 ((_ sign_extend 32) (size!3014 (buf!3479 (BitStream!5287 (buf!3479 (_2!6949 lt!230188)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634))))) ((_ sign_extend 32) (currentByte!6387 (BitStream!5287 (buf!3479 (_2!6949 lt!230188)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634)))) ((_ sign_extend 32) (currentBit!6382 (BitStream!5287 (buf!3479 (_2!6949 lt!230188)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634)))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!13204 0))(
  ( (tuple2!13205 (_1!6965 Unit!9316) (_2!6965 (_ BitVec 8))) )
))
(declare-fun Unit!9383 () Unit!9316)

(declare-fun Unit!9384 () Unit!9316)

(assert (=> d!48369 (= (readByte!0 (BitStream!5287 (buf!3479 (_2!6949 lt!230188)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634))) (tuple2!13201 (_2!6965 (ite (bvsgt ((_ sign_extend 24) lt!231536) #b00000000000000000000000000000000) (tuple2!13205 Unit!9383 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!231540) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3783 (buf!3479 (BitStream!5287 (buf!3479 (_2!6949 lt!230188)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634)))) (bvadd (currentByte!6387 (BitStream!5287 (buf!3479 (_2!6949 lt!230188)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!231536)))))))) (tuple2!13205 Unit!9384 lt!231540))) (BitStream!5287 (buf!3479 (BitStream!5287 (buf!3479 (_2!6949 lt!230188)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634))) (bvadd (currentByte!6387 (BitStream!5287 (buf!3479 (_2!6949 lt!230188)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634))) #b00000000000000000000000000000001) (currentBit!6382 (BitStream!5287 (buf!3479 (_2!6949 lt!230188)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634))))))))

(declare-fun b!148464 () Bool)

(declare-fun e!99037 () Bool)

(assert (=> b!148464 (= e!99038 e!99037)))

(declare-fun res!124277 () Bool)

(assert (=> b!148464 (=> (not res!124277) (not e!99037))))

(declare-fun lt!231539 () tuple2!13200)

(assert (=> b!148464 (= res!124277 (= (buf!3479 (_2!6961 lt!231539)) (buf!3479 (BitStream!5287 (buf!3479 (_2!6949 lt!230188)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634)))))))

(declare-fun lt!231541 () (_ BitVec 8))

(declare-fun lt!231535 () (_ BitVec 8))

(declare-fun Unit!9385 () Unit!9316)

(declare-fun Unit!9386 () Unit!9316)

(assert (=> b!148464 (= lt!231539 (tuple2!13201 (_2!6965 (ite (bvsgt ((_ sign_extend 24) lt!231541) #b00000000000000000000000000000000) (tuple2!13205 Unit!9385 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!231535) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3783 (buf!3479 (BitStream!5287 (buf!3479 (_2!6949 lt!230188)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634)))) (bvadd (currentByte!6387 (BitStream!5287 (buf!3479 (_2!6949 lt!230188)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!231541)))))))) (tuple2!13205 Unit!9386 lt!231535))) (BitStream!5287 (buf!3479 (BitStream!5287 (buf!3479 (_2!6949 lt!230188)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634))) (bvadd (currentByte!6387 (BitStream!5287 (buf!3479 (_2!6949 lt!230188)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634))) #b00000000000000000000000000000001) (currentBit!6382 (BitStream!5287 (buf!3479 (_2!6949 lt!230188)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634))))))))

(assert (=> b!148464 (= lt!231535 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3783 (buf!3479 (BitStream!5287 (buf!3479 (_2!6949 lt!230188)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634)))) (currentByte!6387 (BitStream!5287 (buf!3479 (_2!6949 lt!230188)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634))))) ((_ sign_extend 24) lt!231541))))))

(assert (=> b!148464 (= lt!231541 ((_ extract 7 0) (currentBit!6382 (BitStream!5287 (buf!3479 (_2!6949 lt!230188)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634)))))))

(declare-fun lt!231538 () (_ BitVec 64))

(declare-fun b!148465 () Bool)

(declare-fun lt!231537 () (_ BitVec 64))

(assert (=> b!148465 (= e!99037 (= (bitIndex!0 (size!3014 (buf!3479 (_2!6961 lt!231539))) (currentByte!6387 (_2!6961 lt!231539)) (currentBit!6382 (_2!6961 lt!231539))) (bvadd lt!231537 lt!231538)))))

(assert (=> b!148465 (or (not (= (bvand lt!231537 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!231538 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!231537 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!231537 lt!231538) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!148465 (= lt!231538 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!148465 (= lt!231537 (bitIndex!0 (size!3014 (buf!3479 (BitStream!5287 (buf!3479 (_2!6949 lt!230188)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634)))) (currentByte!6387 (BitStream!5287 (buf!3479 (_2!6949 lt!230188)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634))) (currentBit!6382 (BitStream!5287 (buf!3479 (_2!6949 lt!230188)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634)))))))

(assert (= (and d!48369 res!124278) b!148464))

(assert (= (and b!148464 res!124277) b!148465))

(declare-fun m!230497 () Bool)

(assert (=> d!48369 m!230497))

(declare-fun m!230499 () Bool)

(assert (=> d!48369 m!230499))

(declare-fun m!230501 () Bool)

(assert (=> d!48369 m!230501))

(assert (=> b!148464 m!230501))

(assert (=> b!148464 m!230497))

(declare-fun m!230503 () Bool)

(assert (=> b!148465 m!230503))

(declare-fun m!230505 () Bool)

(assert (=> b!148465 m!230505))

(assert (=> d!48114 d!48369))

(declare-fun d!48371 () Bool)

(declare-fun e!99041 () Bool)

(assert (=> d!48371 e!99041))

(declare-fun res!124281 () Bool)

(assert (=> d!48371 (=> (not res!124281) (not e!99041))))

(declare-fun lt!231546 () BitStream!5286)

(declare-fun lt!231547 () (_ BitVec 64))

(assert (=> d!48371 (= res!124281 (= (bvadd lt!231547 (bvsub lt!230905 lt!230913)) (bitIndex!0 (size!3014 (buf!3479 lt!231546)) (currentByte!6387 lt!231546) (currentBit!6382 lt!231546))))))

(assert (=> d!48371 (or (not (= (bvand lt!231547 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!230905 lt!230913) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!231547 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!231547 (bvsub lt!230905 lt!230913)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48371 (= lt!231547 (bitIndex!0 (size!3014 (buf!3479 (_2!6950 lt!230911))) (currentByte!6387 (_2!6950 lt!230911)) (currentBit!6382 (_2!6950 lt!230911))))))

(declare-fun moveBitIndex!0 (BitStream!5286 (_ BitVec 64)) tuple2!13180)

(assert (=> d!48371 (= lt!231546 (_2!6949 (moveBitIndex!0 (_2!6950 lt!230911) (bvsub lt!230905 lt!230913))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!5286 (_ BitVec 64)) Bool)

(assert (=> d!48371 (moveBitIndexPrecond!0 (_2!6950 lt!230911) (bvsub lt!230905 lt!230913))))

(assert (=> d!48371 (= (withMovedBitIndex!0 (_2!6950 lt!230911) (bvsub lt!230905 lt!230913)) lt!231546)))

(declare-fun b!148468 () Bool)

(assert (=> b!148468 (= e!99041 (= (size!3014 (buf!3479 (_2!6950 lt!230911))) (size!3014 (buf!3479 lt!231546))))))

(assert (= (and d!48371 res!124281) b!148468))

(declare-fun m!230507 () Bool)

(assert (=> d!48371 m!230507))

(declare-fun m!230509 () Bool)

(assert (=> d!48371 m!230509))

(declare-fun m!230511 () Bool)

(assert (=> d!48371 m!230511))

(declare-fun m!230513 () Bool)

(assert (=> d!48371 m!230513))

(assert (=> b!148186 d!48371))

(assert (=> b!148186 d!48086))

(assert (=> b!148186 d!48090))

(assert (=> d!48161 d!48367))

(declare-fun d!48373 () Bool)

(declare-fun res!124284 () Bool)

(declare-fun e!99043 () Bool)

(assert (=> d!48373 (=> (not res!124284) (not e!99043))))

(assert (=> d!48373 (= res!124284 (= (size!3014 (buf!3479 (_1!6950 lt!230911))) (size!3014 (buf!3479 thiss!1634))))))

(assert (=> d!48373 (= (isPrefixOf!0 (_1!6950 lt!230911) thiss!1634) e!99043)))

(declare-fun b!148469 () Bool)

(declare-fun res!124283 () Bool)

(assert (=> b!148469 (=> (not res!124283) (not e!99043))))

(assert (=> b!148469 (= res!124283 (bvsle (bitIndex!0 (size!3014 (buf!3479 (_1!6950 lt!230911))) (currentByte!6387 (_1!6950 lt!230911)) (currentBit!6382 (_1!6950 lt!230911))) (bitIndex!0 (size!3014 (buf!3479 thiss!1634)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634))))))

(declare-fun b!148470 () Bool)

(declare-fun e!99042 () Bool)

(assert (=> b!148470 (= e!99043 e!99042)))

(declare-fun res!124282 () Bool)

(assert (=> b!148470 (=> res!124282 e!99042)))

(assert (=> b!148470 (= res!124282 (= (size!3014 (buf!3479 (_1!6950 lt!230911))) #b00000000000000000000000000000000))))

(declare-fun b!148471 () Bool)

(assert (=> b!148471 (= e!99042 (arrayBitRangesEq!0 (buf!3479 (_1!6950 lt!230911)) (buf!3479 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3014 (buf!3479 (_1!6950 lt!230911))) (currentByte!6387 (_1!6950 lt!230911)) (currentBit!6382 (_1!6950 lt!230911)))))))

(assert (= (and d!48373 res!124284) b!148469))

(assert (= (and b!148469 res!124283) b!148470))

(assert (= (and b!148470 (not res!124282)) b!148471))

(declare-fun m!230515 () Bool)

(assert (=> b!148469 m!230515))

(assert (=> b!148469 m!229129))

(assert (=> b!148471 m!230515))

(assert (=> b!148471 m!230515))

(declare-fun m!230517 () Bool)

(assert (=> b!148471 m!230517))

(assert (=> b!148184 d!48373))

(declare-fun d!48375 () Bool)

(assert (=> d!48375 (= (remainingBits!0 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230195)))) ((_ sign_extend 32) (currentByte!6387 (_2!6949 lt!230195))) ((_ sign_extend 32) (currentBit!6382 (_2!6949 lt!230195)))) (bvsub (bvmul ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230195)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6387 (_2!6949 lt!230195))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6382 (_2!6949 lt!230195))))))))

(assert (=> d!48088 d!48375))

(declare-fun d!48377 () Bool)

(assert (=> d!48377 (= (invariant!0 (currentBit!6382 (_2!6949 lt!230195)) (currentByte!6387 (_2!6949 lt!230195)) (size!3014 (buf!3479 (_2!6949 lt!230195)))) (and (bvsge (currentBit!6382 (_2!6949 lt!230195)) #b00000000000000000000000000000000) (bvslt (currentBit!6382 (_2!6949 lt!230195)) #b00000000000000000000000000001000) (bvsge (currentByte!6387 (_2!6949 lt!230195)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6387 (_2!6949 lt!230195)) (size!3014 (buf!3479 (_2!6949 lt!230195)))) (and (= (currentBit!6382 (_2!6949 lt!230195)) #b00000000000000000000000000000000) (= (currentByte!6387 (_2!6949 lt!230195)) (size!3014 (buf!3479 (_2!6949 lt!230195))))))))))

(assert (=> d!48088 d!48377))

(declare-fun d!48379 () Bool)

(assert (=> d!48379 (= (remainingBits!0 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230188)))) ((_ sign_extend 32) (currentByte!6387 thiss!1634)) ((_ sign_extend 32) (currentBit!6382 thiss!1634))) (bvsub (bvmul ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230188)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6387 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6382 thiss!1634)))))))

(assert (=> d!48122 d!48379))

(declare-fun lt!231567 () tuple3!580)

(declare-fun call!2034 () (_ BitVec 64))

(declare-fun bm!2031 () Bool)

(declare-fun c!8029 () Bool)

(assert (=> bm!2031 (= call!2034 (bitIndex!0 (ite c!8029 (size!3014 (buf!3479 (_2!6962 lt!231567))) (size!3014 (buf!3479 (_1!6950 lt!230194)))) (ite c!8029 (currentByte!6387 (_2!6962 lt!231567)) (currentByte!6387 (_1!6950 lt!230194))) (ite c!8029 (currentBit!6382 (_2!6962 lt!231567)) (currentBit!6382 (_1!6950 lt!230194)))))))

(declare-fun lt!231558 () tuple2!13200)

(declare-fun call!2035 () Bool)

(declare-fun bm!2032 () Bool)

(assert (=> bm!2032 (= call!2035 (arrayRangesEq!330 arr!237 (ite c!8029 (array!6662 (store (arr!3783 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6961 lt!231558)) (size!3014 arr!237)) arr!237) #b00000000000000000000000000000000 (ite c!8029 (bvadd #b00000000000000000000000000000001 from!447) (size!3014 arr!237))))))

(declare-fun lt!231557 () tuple3!580)

(declare-fun e!99046 () Bool)

(declare-fun b!148472 () Bool)

(assert (=> b!148472 (= e!99046 (= (select (arr!3783 (_3!361 lt!231557)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!6951 (readBytePure!0 (_1!6950 lt!230194)))))))

(assert (=> b!148472 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!3014 (_3!361 lt!231557))))))

(declare-fun lt!231568 () array!6661)

(declare-fun call!2036 () Bool)

(declare-fun lt!231575 () array!6661)

(declare-fun bm!2033 () Bool)

(declare-fun lt!231555 () (_ BitVec 32))

(declare-fun lt!231560 () (_ BitVec 32))

(declare-fun lt!231580 () (_ BitVec 32))

(assert (=> bm!2033 (= call!2036 (arrayRangesEq!330 (ite c!8029 arr!237 lt!231575) (ite c!8029 (_3!361 lt!231567) lt!231568) (ite c!8029 lt!231555 lt!231580) (ite c!8029 (bvadd #b00000000000000000000000000000001 from!447) lt!231560)))))

(declare-fun d!48381 () Bool)

(assert (=> d!48381 e!99046))

(declare-fun res!124285 () Bool)

(assert (=> d!48381 (=> res!124285 e!99046)))

(assert (=> d!48381 (= res!124285 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!231572 () Bool)

(declare-fun e!99045 () Bool)

(assert (=> d!48381 (= lt!231572 e!99045)))

(declare-fun res!124286 () Bool)

(assert (=> d!48381 (=> (not res!124286) (not e!99045))))

(declare-fun lt!231583 () (_ BitVec 64))

(declare-fun lt!231554 () (_ BitVec 64))

(assert (=> d!48381 (= res!124286 (= (bvadd lt!231554 lt!231583) (bitIndex!0 (size!3014 (buf!3479 (_2!6962 lt!231557))) (currentByte!6387 (_2!6962 lt!231557)) (currentBit!6382 (_2!6962 lt!231557)))))))

(assert (=> d!48381 (or (not (= (bvand lt!231554 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!231583 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!231554 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!231554 lt!231583) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!231563 () (_ BitVec 64))

(assert (=> d!48381 (= lt!231583 (bvmul lt!231563 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!48381 (or (= lt!231563 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!231563 #b0000000000000000000000000000000000000000000000000000000000001000) lt!231563)))))

(assert (=> d!48381 (= lt!231563 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!48381 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!48381 (= lt!231554 (bitIndex!0 (size!3014 (buf!3479 (_1!6950 lt!230194))) (currentByte!6387 (_1!6950 lt!230194)) (currentBit!6382 (_1!6950 lt!230194))))))

(declare-fun e!99044 () tuple3!580)

(assert (=> d!48381 (= lt!231557 e!99044)))

(assert (=> d!48381 (= c!8029 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!48381 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!3014 arr!237)))))

(assert (=> d!48381 (= (readByteArrayLoop!0 (_1!6950 lt!230194) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!231557)))

(declare-fun b!148473 () Bool)

(declare-fun lt!231565 () Unit!9316)

(assert (=> b!148473 (= e!99044 (tuple3!581 lt!231565 (_2!6962 lt!231567) (_3!361 lt!231567)))))

(assert (=> b!148473 (= lt!231558 (readByte!0 (_1!6950 lt!230194)))))

(declare-fun lt!231577 () array!6661)

(assert (=> b!148473 (= lt!231577 (array!6662 (store (arr!3783 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6961 lt!231558)) (size!3014 arr!237)))))

(declare-fun lt!231566 () (_ BitVec 64))

(assert (=> b!148473 (= lt!231566 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!231569 () (_ BitVec 32))

(assert (=> b!148473 (= lt!231569 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!231571 () Unit!9316)

(assert (=> b!148473 (= lt!231571 (validateOffsetBytesFromBitIndexLemma!0 (_1!6950 lt!230194) (_2!6961 lt!231558) lt!231566 lt!231569))))

(assert (=> b!148473 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6961 lt!231558)))) ((_ sign_extend 32) (currentByte!6387 (_2!6961 lt!231558))) ((_ sign_extend 32) (currentBit!6382 (_2!6961 lt!231558))) (bvsub lt!231569 ((_ extract 31 0) (bvsdiv (bvadd lt!231566 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!231581 () Unit!9316)

(assert (=> b!148473 (= lt!231581 lt!231571)))

(assert (=> b!148473 (= lt!231567 (readByteArrayLoop!0 (_2!6961 lt!231558) lt!231577 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!148473 (= (bitIndex!0 (size!3014 (buf!3479 (_2!6961 lt!231558))) (currentByte!6387 (_2!6961 lt!231558)) (currentBit!6382 (_2!6961 lt!231558))) (bvadd (bitIndex!0 (size!3014 (buf!3479 (_1!6950 lt!230194))) (currentByte!6387 (_1!6950 lt!230194)) (currentBit!6382 (_1!6950 lt!230194))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!231551 () Unit!9316)

(declare-fun Unit!9387 () Unit!9316)

(assert (=> b!148473 (= lt!231551 Unit!9387)))

(assert (=> b!148473 (= (bvadd (bitIndex!0 (size!3014 (buf!3479 (_2!6961 lt!231558))) (currentByte!6387 (_2!6961 lt!231558)) (currentBit!6382 (_2!6961 lt!231558))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2034)))

(declare-fun lt!231576 () Unit!9316)

(declare-fun Unit!9388 () Unit!9316)

(assert (=> b!148473 (= lt!231576 Unit!9388)))

(assert (=> b!148473 (= (bvadd (bitIndex!0 (size!3014 (buf!3479 (_1!6950 lt!230194))) (currentByte!6387 (_1!6950 lt!230194)) (currentBit!6382 (_1!6950 lt!230194))) (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2034)))

(declare-fun lt!231562 () Unit!9316)

(declare-fun Unit!9389 () Unit!9316)

(assert (=> b!148473 (= lt!231562 Unit!9389)))

(assert (=> b!148473 (and (= (buf!3479 (_1!6950 lt!230194)) (buf!3479 (_2!6962 lt!231567))) (= (size!3014 arr!237) (size!3014 (_3!361 lt!231567))))))

(declare-fun lt!231550 () Unit!9316)

(declare-fun Unit!9390 () Unit!9316)

(assert (=> b!148473 (= lt!231550 Unit!9390)))

(declare-fun lt!231578 () Unit!9316)

(assert (=> b!148473 (= lt!231578 (arrayUpdatedAtPrefixLemma!15 arr!237 (bvadd #b00000000000000000000000000000001 from!447) (_1!6961 lt!231558)))))

(assert (=> b!148473 call!2035))

(declare-fun lt!231548 () Unit!9316)

(assert (=> b!148473 (= lt!231548 lt!231578)))

(assert (=> b!148473 (= lt!231555 #b00000000000000000000000000000000)))

(declare-fun lt!231553 () Unit!9316)

(assert (=> b!148473 (= lt!231553 (arrayRangesEqTransitive!55 arr!237 lt!231577 (_3!361 lt!231567) lt!231555 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!148473 call!2036))

(declare-fun lt!231561 () Unit!9316)

(assert (=> b!148473 (= lt!231561 lt!231553)))

(assert (=> b!148473 (arrayRangesEq!330 arr!237 (_3!361 lt!231567) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!231573 () Unit!9316)

(declare-fun Unit!9391 () Unit!9316)

(assert (=> b!148473 (= lt!231573 Unit!9391)))

(declare-fun lt!231579 () Unit!9316)

(assert (=> b!148473 (= lt!231579 (arrayRangesEqImpliesEq!15 lt!231577 (_3!361 lt!231567) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!148473 (= (select (store (arr!3783 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6961 lt!231558)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3783 (_3!361 lt!231567)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!231556 () Unit!9316)

(assert (=> b!148473 (= lt!231556 lt!231579)))

(declare-fun lt!231549 () Bool)

(assert (=> b!148473 (= lt!231549 (= (select (arr!3783 (_3!361 lt!231567)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!6961 lt!231558)))))

(declare-fun Unit!9392 () Unit!9316)

(assert (=> b!148473 (= lt!231565 Unit!9392)))

(assert (=> b!148473 lt!231549))

(declare-fun b!148474 () Bool)

(declare-fun lt!231574 () Unit!9316)

(assert (=> b!148474 (= e!99044 (tuple3!581 lt!231574 (_1!6950 lt!230194) arr!237))))

(assert (=> b!148474 (= call!2034 call!2034)))

(declare-fun lt!231570 () Unit!9316)

(declare-fun Unit!9393 () Unit!9316)

(assert (=> b!148474 (= lt!231570 Unit!9393)))

(declare-fun lt!231552 () Unit!9316)

(assert (=> b!148474 (= lt!231552 (arrayRangesEqReflexiveLemma!15 arr!237))))

(assert (=> b!148474 call!2035))

(declare-fun lt!231582 () Unit!9316)

(assert (=> b!148474 (= lt!231582 lt!231552)))

(assert (=> b!148474 (= lt!231575 arr!237)))

(assert (=> b!148474 (= lt!231568 arr!237)))

(declare-fun lt!231559 () (_ BitVec 32))

(assert (=> b!148474 (= lt!231559 #b00000000000000000000000000000000)))

(declare-fun lt!231564 () (_ BitVec 32))

(assert (=> b!148474 (= lt!231564 (size!3014 arr!237))))

(assert (=> b!148474 (= lt!231580 #b00000000000000000000000000000000)))

(assert (=> b!148474 (= lt!231560 (bvadd #b00000000000000000000000000000001 from!447))))

(assert (=> b!148474 (= lt!231574 (arrayRangesEqSlicedLemma!15 lt!231575 lt!231568 lt!231559 lt!231564 lt!231580 lt!231560))))

(assert (=> b!148474 call!2036))

(declare-fun b!148475 () Bool)

(assert (=> b!148475 (= e!99045 (arrayRangesEq!330 arr!237 (_3!361 lt!231557) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun b!148476 () Bool)

(declare-fun res!124287 () Bool)

(assert (=> b!148476 (=> (not res!124287) (not e!99045))))

(assert (=> b!148476 (= res!124287 (and (= (buf!3479 (_1!6950 lt!230194)) (buf!3479 (_2!6962 lt!231557))) (= (size!3014 arr!237) (size!3014 (_3!361 lt!231557)))))))

(assert (= (and d!48381 c!8029) b!148473))

(assert (= (and d!48381 (not c!8029)) b!148474))

(assert (= (or b!148473 b!148474) bm!2033))

(assert (= (or b!148473 b!148474) bm!2032))

(assert (= (or b!148473 b!148474) bm!2031))

(assert (= (and d!48381 res!124286) b!148476))

(assert (= (and b!148476 res!124287) b!148475))

(assert (= (and d!48381 (not res!124285)) b!148472))

(declare-fun m!230519 () Bool)

(assert (=> bm!2032 m!230519))

(declare-fun m!230521 () Bool)

(assert (=> bm!2032 m!230521))

(declare-fun m!230523 () Bool)

(assert (=> bm!2031 m!230523))

(declare-fun m!230525 () Bool)

(assert (=> bm!2033 m!230525))

(assert (=> b!148474 m!230465))

(declare-fun m!230527 () Bool)

(assert (=> b!148474 m!230527))

(declare-fun m!230529 () Bool)

(assert (=> b!148472 m!230529))

(declare-fun m!230531 () Bool)

(assert (=> b!148472 m!230531))

(declare-fun m!230533 () Bool)

(assert (=> b!148473 m!230533))

(declare-fun m!230535 () Bool)

(assert (=> b!148473 m!230535))

(declare-fun m!230537 () Bool)

(assert (=> b!148473 m!230537))

(assert (=> b!148473 m!230519))

(declare-fun m!230539 () Bool)

(assert (=> b!148473 m!230539))

(declare-fun m!230541 () Bool)

(assert (=> b!148473 m!230541))

(declare-fun m!230543 () Bool)

(assert (=> b!148473 m!230543))

(declare-fun m!230545 () Bool)

(assert (=> b!148473 m!230545))

(declare-fun m!230547 () Bool)

(assert (=> b!148473 m!230547))

(declare-fun m!230549 () Bool)

(assert (=> b!148473 m!230549))

(declare-fun m!230551 () Bool)

(assert (=> b!148473 m!230551))

(declare-fun m!230553 () Bool)

(assert (=> b!148473 m!230553))

(declare-fun m!230555 () Bool)

(assert (=> b!148473 m!230555))

(declare-fun m!230557 () Bool)

(assert (=> b!148475 m!230557))

(declare-fun m!230559 () Bool)

(assert (=> d!48381 m!230559))

(assert (=> d!48381 m!230553))

(assert (=> d!48159 d!48381))

(assert (=> b!148129 d!48088))

(assert (=> b!148129 d!48086))

(declare-fun d!48383 () Bool)

(declare-fun e!99047 () Bool)

(assert (=> d!48383 e!99047))

(declare-fun res!124289 () Bool)

(assert (=> d!48383 (=> (not res!124289) (not e!99047))))

(declare-fun lt!231585 () (_ BitVec 64))

(declare-fun lt!231587 () (_ BitVec 64))

(declare-fun lt!231586 () (_ BitVec 64))

(assert (=> d!48383 (= res!124289 (= lt!231586 (bvsub lt!231585 lt!231587)))))

(assert (=> d!48383 (or (= (bvand lt!231585 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!231587 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!231585 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!231585 lt!231587) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48383 (= lt!231587 (remainingBits!0 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230889)))) ((_ sign_extend 32) (currentByte!6387 (_2!6949 lt!230889))) ((_ sign_extend 32) (currentBit!6382 (_2!6949 lt!230889)))))))

(declare-fun lt!231584 () (_ BitVec 64))

(declare-fun lt!231588 () (_ BitVec 64))

(assert (=> d!48383 (= lt!231585 (bvmul lt!231584 lt!231588))))

(assert (=> d!48383 (or (= lt!231584 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!231588 (bvsdiv (bvmul lt!231584 lt!231588) lt!231584)))))

(assert (=> d!48383 (= lt!231588 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!48383 (= lt!231584 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230889)))))))

(assert (=> d!48383 (= lt!231586 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6387 (_2!6949 lt!230889))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6382 (_2!6949 lt!230889)))))))

(assert (=> d!48383 (invariant!0 (currentBit!6382 (_2!6949 lt!230889)) (currentByte!6387 (_2!6949 lt!230889)) (size!3014 (buf!3479 (_2!6949 lt!230889))))))

(assert (=> d!48383 (= (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230889))) (currentByte!6387 (_2!6949 lt!230889)) (currentBit!6382 (_2!6949 lt!230889))) lt!231586)))

(declare-fun b!148477 () Bool)

(declare-fun res!124288 () Bool)

(assert (=> b!148477 (=> (not res!124288) (not e!99047))))

(assert (=> b!148477 (= res!124288 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!231586))))

(declare-fun b!148478 () Bool)

(declare-fun lt!231589 () (_ BitVec 64))

(assert (=> b!148478 (= e!99047 (bvsle lt!231586 (bvmul lt!231589 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!148478 (or (= lt!231589 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!231589 #b0000000000000000000000000000000000000000000000000000000000001000) lt!231589)))))

(assert (=> b!148478 (= lt!231589 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230889)))))))

(assert (= (and d!48383 res!124289) b!148477))

(assert (= (and b!148477 res!124288) b!148478))

(declare-fun m!230561 () Bool)

(assert (=> d!48383 m!230561))

(declare-fun m!230563 () Bool)

(assert (=> d!48383 m!230563))

(assert (=> b!148180 d!48383))

(assert (=> b!148180 d!48088))

(declare-fun d!48385 () Bool)

(assert (=> d!48385 (= (remainingBits!0 ((_ sign_extend 32) (size!3014 (buf!3479 thiss!1634))) ((_ sign_extend 32) (currentByte!6387 thiss!1634)) ((_ sign_extend 32) (currentBit!6382 thiss!1634))) (bvsub (bvmul ((_ sign_extend 32) (size!3014 (buf!3479 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6387 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6382 thiss!1634)))))))

(assert (=> d!48090 d!48385))

(assert (=> d!48090 d!48167))

(declare-fun d!48387 () Bool)

(declare-fun e!99048 () Bool)

(assert (=> d!48387 e!99048))

(declare-fun res!124290 () Bool)

(assert (=> d!48387 (=> (not res!124290) (not e!99048))))

(declare-fun lt!231591 () (_ BitVec 64))

(declare-fun lt!231590 () BitStream!5286)

(assert (=> d!48387 (= res!124290 (= (bvadd lt!231591 (bvsub lt!230925 lt!230933)) (bitIndex!0 (size!3014 (buf!3479 lt!231590)) (currentByte!6387 lt!231590) (currentBit!6382 lt!231590))))))

(assert (=> d!48387 (or (not (= (bvand lt!231591 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!230925 lt!230933) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!231591 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!231591 (bvsub lt!230925 lt!230933)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48387 (= lt!231591 (bitIndex!0 (size!3014 (buf!3479 (_2!6950 lt!230931))) (currentByte!6387 (_2!6950 lt!230931)) (currentBit!6382 (_2!6950 lt!230931))))))

(assert (=> d!48387 (= lt!231590 (_2!6949 (moveBitIndex!0 (_2!6950 lt!230931) (bvsub lt!230925 lt!230933))))))

(assert (=> d!48387 (moveBitIndexPrecond!0 (_2!6950 lt!230931) (bvsub lt!230925 lt!230933))))

(assert (=> d!48387 (= (withMovedBitIndex!0 (_2!6950 lt!230931) (bvsub lt!230925 lt!230933)) lt!231590)))

(declare-fun b!148479 () Bool)

(assert (=> b!148479 (= e!99048 (= (size!3014 (buf!3479 (_2!6950 lt!230931))) (size!3014 (buf!3479 lt!231590))))))

(assert (= (and d!48387 res!124290) b!148479))

(declare-fun m!230565 () Bool)

(assert (=> d!48387 m!230565))

(declare-fun m!230567 () Bool)

(assert (=> d!48387 m!230567))

(declare-fun m!230569 () Bool)

(assert (=> d!48387 m!230569))

(declare-fun m!230571 () Bool)

(assert (=> d!48387 m!230571))

(assert (=> b!148191 d!48387))

(assert (=> b!148191 d!48086))

(assert (=> b!148191 d!48088))

(declare-fun d!48389 () Bool)

(assert (=> d!48389 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230195)))) ((_ sign_extend 32) (currentByte!6387 (_2!6949 lt!230195))) ((_ sign_extend 32) (currentBit!6382 (_2!6949 lt!230195))) (bvsub (bvsub to!404 from!447) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!48389 true))

(declare-fun _$7!88 () Unit!9316)

(assert (=> d!48389 (= (choose!57 thiss!1634 (_2!6949 lt!230195) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) _$7!88)))

(declare-fun bs!11806 () Bool)

(assert (= bs!11806 d!48389))

(declare-fun m!230573 () Bool)

(assert (=> bs!11806 m!230573))

(assert (=> d!48138 d!48389))

(declare-fun d!48391 () Bool)

(assert (=> d!48391 (= (remainingBits!0 ((_ sign_extend 32) (size!3014 (buf!3479 (_1!6951 lt!230180)))) ((_ sign_extend 32) (currentByte!6387 (_1!6951 lt!230180))) ((_ sign_extend 32) (currentBit!6382 (_1!6951 lt!230180)))) (bvsub (bvmul ((_ sign_extend 32) (size!3014 (buf!3479 (_1!6951 lt!230180)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6387 (_1!6951 lt!230180))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6382 (_1!6951 lt!230180))))))))

(assert (=> d!48134 d!48391))

(declare-fun d!48393 () Bool)

(assert (=> d!48393 (= (invariant!0 (currentBit!6382 (_1!6951 lt!230180)) (currentByte!6387 (_1!6951 lt!230180)) (size!3014 (buf!3479 (_1!6951 lt!230180)))) (and (bvsge (currentBit!6382 (_1!6951 lt!230180)) #b00000000000000000000000000000000) (bvslt (currentBit!6382 (_1!6951 lt!230180)) #b00000000000000000000000000001000) (bvsge (currentByte!6387 (_1!6951 lt!230180)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6387 (_1!6951 lt!230180)) (size!3014 (buf!3479 (_1!6951 lt!230180)))) (and (= (currentBit!6382 (_1!6951 lt!230180)) #b00000000000000000000000000000000) (= (currentByte!6387 (_1!6951 lt!230180)) (size!3014 (buf!3479 (_1!6951 lt!230180))))))))))

(assert (=> d!48134 d!48393))

(declare-fun d!48395 () Bool)

(declare-fun res!124293 () Bool)

(declare-fun e!99050 () Bool)

(assert (=> d!48395 (=> (not res!124293) (not e!99050))))

(assert (=> d!48395 (= res!124293 (= (size!3014 (buf!3479 (_1!6950 lt!230931))) (size!3014 (buf!3479 (_2!6949 lt!230195)))))))

(assert (=> d!48395 (= (isPrefixOf!0 (_1!6950 lt!230931) (_2!6949 lt!230195)) e!99050)))

(declare-fun b!148480 () Bool)

(declare-fun res!124292 () Bool)

(assert (=> b!148480 (=> (not res!124292) (not e!99050))))

(assert (=> b!148480 (= res!124292 (bvsle (bitIndex!0 (size!3014 (buf!3479 (_1!6950 lt!230931))) (currentByte!6387 (_1!6950 lt!230931)) (currentBit!6382 (_1!6950 lt!230931))) (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230195))) (currentByte!6387 (_2!6949 lt!230195)) (currentBit!6382 (_2!6949 lt!230195)))))))

(declare-fun b!148481 () Bool)

(declare-fun e!99049 () Bool)

(assert (=> b!148481 (= e!99050 e!99049)))

(declare-fun res!124291 () Bool)

(assert (=> b!148481 (=> res!124291 e!99049)))

(assert (=> b!148481 (= res!124291 (= (size!3014 (buf!3479 (_1!6950 lt!230931))) #b00000000000000000000000000000000))))

(declare-fun b!148482 () Bool)

(assert (=> b!148482 (= e!99049 (arrayBitRangesEq!0 (buf!3479 (_1!6950 lt!230931)) (buf!3479 (_2!6949 lt!230195)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3014 (buf!3479 (_1!6950 lt!230931))) (currentByte!6387 (_1!6950 lt!230931)) (currentBit!6382 (_1!6950 lt!230931)))))))

(assert (= (and d!48395 res!124293) b!148480))

(assert (= (and b!148480 res!124292) b!148481))

(assert (= (and b!148481 (not res!124291)) b!148482))

(declare-fun m!230575 () Bool)

(assert (=> b!148480 m!230575))

(assert (=> b!148480 m!229127))

(assert (=> b!148482 m!230575))

(assert (=> b!148482 m!230575))

(declare-fun m!230577 () Bool)

(assert (=> b!148482 m!230577))

(assert (=> b!148189 d!48395))

(declare-fun d!48397 () Bool)

(declare-fun res!124294 () Bool)

(declare-fun e!99051 () Bool)

(assert (=> d!48397 (=> res!124294 e!99051)))

(assert (=> d!48397 (= res!124294 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!48397 (= (arrayRangesEq!330 (_2!6952 lt!230198) (_2!6952 lt!230190) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!99051)))

(declare-fun b!148483 () Bool)

(declare-fun e!99052 () Bool)

(assert (=> b!148483 (= e!99051 e!99052)))

(declare-fun res!124295 () Bool)

(assert (=> b!148483 (=> (not res!124295) (not e!99052))))

(assert (=> b!148483 (= res!124295 (= (select (arr!3783 (_2!6952 lt!230198)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3783 (_2!6952 lt!230190)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!148484 () Bool)

(assert (=> b!148484 (= e!99052 (arrayRangesEq!330 (_2!6952 lt!230198) (_2!6952 lt!230190) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48397 (not res!124294)) b!148483))

(assert (= (and b!148483 res!124295) b!148484))

(declare-fun m!230579 () Bool)

(assert (=> b!148483 m!230579))

(declare-fun m!230581 () Bool)

(assert (=> b!148483 m!230581))

(declare-fun m!230583 () Bool)

(assert (=> b!148484 m!230583))

(assert (=> b!148213 d!48397))

(declare-fun d!48399 () Bool)

(declare-fun res!124298 () Bool)

(declare-fun e!99054 () Bool)

(assert (=> d!48399 (=> (not res!124298) (not e!99054))))

(assert (=> d!48399 (= res!124298 (= (size!3014 (buf!3479 (_2!6949 lt!230195))) (size!3014 (buf!3479 (_2!6949 lt!230889)))))))

(assert (=> d!48399 (= (isPrefixOf!0 (_2!6949 lt!230195) (_2!6949 lt!230889)) e!99054)))

(declare-fun b!148485 () Bool)

(declare-fun res!124297 () Bool)

(assert (=> b!148485 (=> (not res!124297) (not e!99054))))

(assert (=> b!148485 (= res!124297 (bvsle (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230195))) (currentByte!6387 (_2!6949 lt!230195)) (currentBit!6382 (_2!6949 lt!230195))) (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230889))) (currentByte!6387 (_2!6949 lt!230889)) (currentBit!6382 (_2!6949 lt!230889)))))))

(declare-fun b!148486 () Bool)

(declare-fun e!99053 () Bool)

(assert (=> b!148486 (= e!99054 e!99053)))

(declare-fun res!124296 () Bool)

(assert (=> b!148486 (=> res!124296 e!99053)))

(assert (=> b!148486 (= res!124296 (= (size!3014 (buf!3479 (_2!6949 lt!230195))) #b00000000000000000000000000000000))))

(declare-fun b!148487 () Bool)

(assert (=> b!148487 (= e!99053 (arrayBitRangesEq!0 (buf!3479 (_2!6949 lt!230195)) (buf!3479 (_2!6949 lt!230889)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230195))) (currentByte!6387 (_2!6949 lt!230195)) (currentBit!6382 (_2!6949 lt!230195)))))))

(assert (= (and d!48399 res!124298) b!148485))

(assert (= (and b!148485 res!124297) b!148486))

(assert (= (and b!148486 (not res!124296)) b!148487))

(assert (=> b!148485 m!229127))

(assert (=> b!148485 m!229767))

(assert (=> b!148487 m!229127))

(assert (=> b!148487 m!229127))

(declare-fun m!230585 () Bool)

(assert (=> b!148487 m!230585))

(assert (=> b!148182 d!48399))

(assert (=> d!48130 d!48122))

(declare-fun d!48401 () Bool)

(assert (=> d!48401 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230188)))) ((_ sign_extend 32) (currentByte!6387 thiss!1634)) ((_ sign_extend 32) (currentBit!6382 thiss!1634)) (bvsub to!404 from!447))))

(assert (=> d!48401 true))

(declare-fun _$5!82 () Unit!9316)

(assert (=> d!48401 (= (choose!26 thiss!1634 (buf!3479 (_2!6949 lt!230188)) (bvsub to!404 from!447) (BitStream!5287 (buf!3479 (_2!6949 lt!230188)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634))) _$5!82)))

(declare-fun bs!11807 () Bool)

(assert (= bs!11807 d!48401))

(assert (=> bs!11807 m!229179))

(assert (=> d!48130 d!48401))

(declare-fun b!148502 () Bool)

(declare-fun res!124309 () Bool)

(declare-fun lt!231598 () (_ BitVec 32))

(assert (=> b!148502 (= res!124309 (= lt!231598 #b00000000000000000000000000000000))))

(declare-fun e!99071 () Bool)

(assert (=> b!148502 (=> res!124309 e!99071)))

(declare-fun e!99072 () Bool)

(assert (=> b!148502 (= e!99072 e!99071)))

(declare-fun b!148503 () Bool)

(declare-fun e!99068 () Bool)

(declare-fun call!2039 () Bool)

(assert (=> b!148503 (= e!99068 call!2039)))

(declare-fun b!148504 () Bool)

(assert (=> b!148504 (= e!99071 call!2039)))

(declare-fun b!148505 () Bool)

(declare-fun e!99067 () Bool)

(declare-fun e!99069 () Bool)

(assert (=> b!148505 (= e!99067 e!99069)))

(declare-fun res!124310 () Bool)

(assert (=> b!148505 (=> (not res!124310) (not e!99069))))

(declare-fun e!99070 () Bool)

(assert (=> b!148505 (= res!124310 e!99070)))

(declare-fun res!124311 () Bool)

(assert (=> b!148505 (=> res!124311 e!99070)))

(declare-datatypes ((tuple4!144 0))(
  ( (tuple4!145 (_1!6966 (_ BitVec 32)) (_2!6966 (_ BitVec 32)) (_3!363 (_ BitVec 32)) (_4!72 (_ BitVec 32))) )
))
(declare-fun lt!231600 () tuple4!144)

(assert (=> b!148505 (= res!124311 (bvsge (_1!6966 lt!231600) (_2!6966 lt!231600)))))

(assert (=> b!148505 (= lt!231598 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230195))) (currentByte!6387 (_2!6949 lt!230195)) (currentBit!6382 (_2!6949 lt!230195))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!231599 () (_ BitVec 32))

(assert (=> b!148505 (= lt!231599 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!144)

(assert (=> b!148505 (= lt!231600 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230195))) (currentByte!6387 (_2!6949 lt!230195)) (currentBit!6382 (_2!6949 lt!230195)))))))

(declare-fun bm!2036 () Bool)

(declare-fun c!8032 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2036 (= call!2039 (byteRangesEq!0 (ite c!8032 (select (arr!3783 (buf!3479 (_2!6949 lt!230195))) (_3!363 lt!231600)) (select (arr!3783 (buf!3479 (_2!6949 lt!230195))) (_4!72 lt!231600))) (ite c!8032 (select (arr!3783 (buf!3479 (_2!6949 lt!230188))) (_3!363 lt!231600)) (select (arr!3783 (buf!3479 (_2!6949 lt!230188))) (_4!72 lt!231600))) (ite c!8032 lt!231599 #b00000000000000000000000000000000) lt!231598))))

(declare-fun b!148506 () Bool)

(assert (=> b!148506 (= e!99068 e!99072)))

(declare-fun res!124313 () Bool)

(assert (=> b!148506 (= res!124313 (byteRangesEq!0 (select (arr!3783 (buf!3479 (_2!6949 lt!230195))) (_3!363 lt!231600)) (select (arr!3783 (buf!3479 (_2!6949 lt!230188))) (_3!363 lt!231600)) lt!231599 #b00000000000000000000000000001000))))

(assert (=> b!148506 (=> (not res!124313) (not e!99072))))

(declare-fun d!48403 () Bool)

(declare-fun res!124312 () Bool)

(assert (=> d!48403 (=> res!124312 e!99067)))

(assert (=> d!48403 (= res!124312 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230195))) (currentByte!6387 (_2!6949 lt!230195)) (currentBit!6382 (_2!6949 lt!230195)))))))

(assert (=> d!48403 (= (arrayBitRangesEq!0 (buf!3479 (_2!6949 lt!230195)) (buf!3479 (_2!6949 lt!230188)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230195))) (currentByte!6387 (_2!6949 lt!230195)) (currentBit!6382 (_2!6949 lt!230195)))) e!99067)))

(declare-fun b!148507 () Bool)

(assert (=> b!148507 (= e!99069 e!99068)))

(assert (=> b!148507 (= c!8032 (= (_3!363 lt!231600) (_4!72 lt!231600)))))

(declare-fun b!148508 () Bool)

(assert (=> b!148508 (= e!99070 (arrayRangesEq!330 (buf!3479 (_2!6949 lt!230195)) (buf!3479 (_2!6949 lt!230188)) (_1!6966 lt!231600) (_2!6966 lt!231600)))))

(assert (= (and d!48403 (not res!124312)) b!148505))

(assert (= (and b!148505 (not res!124311)) b!148508))

(assert (= (and b!148505 res!124310) b!148507))

(assert (= (and b!148507 c!8032) b!148503))

(assert (= (and b!148507 (not c!8032)) b!148506))

(assert (= (and b!148506 res!124313) b!148502))

(assert (= (and b!148502 (not res!124309)) b!148504))

(assert (= (or b!148503 b!148504) bm!2036))

(assert (=> b!148505 m!229127))

(declare-fun m!230587 () Bool)

(assert (=> b!148505 m!230587))

(declare-fun m!230589 () Bool)

(assert (=> bm!2036 m!230589))

(declare-fun m!230591 () Bool)

(assert (=> bm!2036 m!230591))

(declare-fun m!230593 () Bool)

(assert (=> bm!2036 m!230593))

(declare-fun m!230595 () Bool)

(assert (=> bm!2036 m!230595))

(declare-fun m!230597 () Bool)

(assert (=> bm!2036 m!230597))

(assert (=> b!148506 m!230589))

(assert (=> b!148506 m!230597))

(assert (=> b!148506 m!230589))

(assert (=> b!148506 m!230597))

(declare-fun m!230599 () Bool)

(assert (=> b!148506 m!230599))

(declare-fun m!230601 () Bool)

(assert (=> b!148508 m!230601))

(assert (=> b!148131 d!48403))

(assert (=> b!148131 d!48088))

(assert (=> d!48169 d!48385))

(declare-fun d!48405 () Bool)

(declare-fun res!124316 () Bool)

(declare-fun e!99074 () Bool)

(assert (=> d!48405 (=> (not res!124316) (not e!99074))))

(assert (=> d!48405 (= res!124316 (= (size!3014 (buf!3479 (_1!6950 lt!230931))) (size!3014 (buf!3479 (_2!6950 lt!230931)))))))

(assert (=> d!48405 (= (isPrefixOf!0 (_1!6950 lt!230931) (_2!6950 lt!230931)) e!99074)))

(declare-fun b!148509 () Bool)

(declare-fun res!124315 () Bool)

(assert (=> b!148509 (=> (not res!124315) (not e!99074))))

(assert (=> b!148509 (= res!124315 (bvsle (bitIndex!0 (size!3014 (buf!3479 (_1!6950 lt!230931))) (currentByte!6387 (_1!6950 lt!230931)) (currentBit!6382 (_1!6950 lt!230931))) (bitIndex!0 (size!3014 (buf!3479 (_2!6950 lt!230931))) (currentByte!6387 (_2!6950 lt!230931)) (currentBit!6382 (_2!6950 lt!230931)))))))

(declare-fun b!148510 () Bool)

(declare-fun e!99073 () Bool)

(assert (=> b!148510 (= e!99074 e!99073)))

(declare-fun res!124314 () Bool)

(assert (=> b!148510 (=> res!124314 e!99073)))

(assert (=> b!148510 (= res!124314 (= (size!3014 (buf!3479 (_1!6950 lt!230931))) #b00000000000000000000000000000000))))

(declare-fun b!148511 () Bool)

(assert (=> b!148511 (= e!99073 (arrayBitRangesEq!0 (buf!3479 (_1!6950 lt!230931)) (buf!3479 (_2!6950 lt!230931)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3014 (buf!3479 (_1!6950 lt!230931))) (currentByte!6387 (_1!6950 lt!230931)) (currentBit!6382 (_1!6950 lt!230931)))))))

(assert (= (and d!48405 res!124316) b!148509))

(assert (= (and b!148509 res!124315) b!148510))

(assert (= (and b!148510 (not res!124314)) b!148511))

(assert (=> b!148509 m!230575))

(assert (=> b!148509 m!230567))

(assert (=> b!148511 m!230575))

(assert (=> b!148511 m!230575))

(declare-fun m!230603 () Bool)

(assert (=> b!148511 m!230603))

(assert (=> d!48120 d!48405))

(declare-fun d!48407 () Bool)

(assert (=> d!48407 (isPrefixOf!0 lt!230916 (_2!6949 lt!230188))))

(declare-fun lt!231601 () Unit!9316)

(assert (=> d!48407 (= lt!231601 (choose!30 lt!230916 (_2!6949 lt!230195) (_2!6949 lt!230188)))))

(assert (=> d!48407 (isPrefixOf!0 lt!230916 (_2!6949 lt!230195))))

(assert (=> d!48407 (= (lemmaIsPrefixTransitive!0 lt!230916 (_2!6949 lt!230195) (_2!6949 lt!230188)) lt!231601)))

(declare-fun bs!11808 () Bool)

(assert (= bs!11808 d!48407))

(assert (=> bs!11808 m!229819))

(declare-fun m!230605 () Bool)

(assert (=> bs!11808 m!230605))

(declare-fun m!230607 () Bool)

(assert (=> bs!11808 m!230607))

(assert (=> d!48120 d!48407))

(declare-fun d!48409 () Bool)

(assert (=> d!48409 (isPrefixOf!0 (_2!6949 lt!230195) (_2!6949 lt!230195))))

(declare-fun lt!231604 () Unit!9316)

(declare-fun choose!11 (BitStream!5286) Unit!9316)

(assert (=> d!48409 (= lt!231604 (choose!11 (_2!6949 lt!230195)))))

(assert (=> d!48409 (= (lemmaIsPrefixRefl!0 (_2!6949 lt!230195)) lt!231604)))

(declare-fun bs!11810 () Bool)

(assert (= bs!11810 d!48409))

(assert (=> bs!11810 m!229733))

(declare-fun m!230609 () Bool)

(assert (=> bs!11810 m!230609))

(assert (=> d!48120 d!48409))

(declare-fun d!48411 () Bool)

(declare-fun res!124319 () Bool)

(declare-fun e!99076 () Bool)

(assert (=> d!48411 (=> (not res!124319) (not e!99076))))

(assert (=> d!48411 (= res!124319 (= (size!3014 (buf!3479 lt!230916)) (size!3014 (buf!3479 (_2!6949 lt!230188)))))))

(assert (=> d!48411 (= (isPrefixOf!0 lt!230916 (_2!6949 lt!230188)) e!99076)))

(declare-fun b!148512 () Bool)

(declare-fun res!124318 () Bool)

(assert (=> b!148512 (=> (not res!124318) (not e!99076))))

(assert (=> b!148512 (= res!124318 (bvsle (bitIndex!0 (size!3014 (buf!3479 lt!230916)) (currentByte!6387 lt!230916) (currentBit!6382 lt!230916)) (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230188))) (currentByte!6387 (_2!6949 lt!230188)) (currentBit!6382 (_2!6949 lt!230188)))))))

(declare-fun b!148513 () Bool)

(declare-fun e!99075 () Bool)

(assert (=> b!148513 (= e!99076 e!99075)))

(declare-fun res!124317 () Bool)

(assert (=> b!148513 (=> res!124317 e!99075)))

(assert (=> b!148513 (= res!124317 (= (size!3014 (buf!3479 lt!230916)) #b00000000000000000000000000000000))))

(declare-fun b!148514 () Bool)

(assert (=> b!148514 (= e!99075 (arrayBitRangesEq!0 (buf!3479 lt!230916) (buf!3479 (_2!6949 lt!230188)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3014 (buf!3479 lt!230916)) (currentByte!6387 lt!230916) (currentBit!6382 lt!230916))))))

(assert (= (and d!48411 res!124319) b!148512))

(assert (= (and b!148512 res!124318) b!148513))

(assert (= (and b!148513 (not res!124317)) b!148514))

(declare-fun m!230611 () Bool)

(assert (=> b!148512 m!230611))

(assert (=> b!148512 m!229189))

(assert (=> b!148514 m!230611))

(assert (=> b!148514 m!230611))

(declare-fun m!230613 () Bool)

(assert (=> b!148514 m!230613))

(assert (=> d!48120 d!48411))

(declare-fun d!48413 () Bool)

(declare-fun res!124322 () Bool)

(declare-fun e!99078 () Bool)

(assert (=> d!48413 (=> (not res!124322) (not e!99078))))

(assert (=> d!48413 (= res!124322 (= (size!3014 (buf!3479 lt!230916)) (size!3014 (buf!3479 lt!230916))))))

(assert (=> d!48413 (= (isPrefixOf!0 lt!230916 lt!230916) e!99078)))

(declare-fun b!148515 () Bool)

(declare-fun res!124321 () Bool)

(assert (=> b!148515 (=> (not res!124321) (not e!99078))))

(assert (=> b!148515 (= res!124321 (bvsle (bitIndex!0 (size!3014 (buf!3479 lt!230916)) (currentByte!6387 lt!230916) (currentBit!6382 lt!230916)) (bitIndex!0 (size!3014 (buf!3479 lt!230916)) (currentByte!6387 lt!230916) (currentBit!6382 lt!230916))))))

(declare-fun b!148516 () Bool)

(declare-fun e!99077 () Bool)

(assert (=> b!148516 (= e!99078 e!99077)))

(declare-fun res!124320 () Bool)

(assert (=> b!148516 (=> res!124320 e!99077)))

(assert (=> b!148516 (= res!124320 (= (size!3014 (buf!3479 lt!230916)) #b00000000000000000000000000000000))))

(declare-fun b!148517 () Bool)

(assert (=> b!148517 (= e!99077 (arrayBitRangesEq!0 (buf!3479 lt!230916) (buf!3479 lt!230916) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3014 (buf!3479 lt!230916)) (currentByte!6387 lt!230916) (currentBit!6382 lt!230916))))))

(assert (= (and d!48413 res!124322) b!148515))

(assert (= (and b!148515 res!124321) b!148516))

(assert (= (and b!148516 (not res!124320)) b!148517))

(assert (=> b!148515 m!230611))

(assert (=> b!148515 m!230611))

(assert (=> b!148517 m!230611))

(assert (=> b!148517 m!230611))

(declare-fun m!230615 () Bool)

(assert (=> b!148517 m!230615))

(assert (=> d!48120 d!48413))

(declare-fun d!48415 () Bool)

(assert (=> d!48415 (isPrefixOf!0 (_2!6949 lt!230188) (_2!6949 lt!230188))))

(declare-fun lt!231605 () Unit!9316)

(assert (=> d!48415 (= lt!231605 (choose!11 (_2!6949 lt!230188)))))

(assert (=> d!48415 (= (lemmaIsPrefixRefl!0 (_2!6949 lt!230188)) lt!231605)))

(declare-fun bs!11811 () Bool)

(assert (= bs!11811 d!48415))

(assert (=> bs!11811 m!229791))

(declare-fun m!230617 () Bool)

(assert (=> bs!11811 m!230617))

(assert (=> d!48120 d!48415))

(assert (=> d!48120 d!48084))

(declare-fun d!48417 () Bool)

(declare-fun res!124325 () Bool)

(declare-fun e!99080 () Bool)

(assert (=> d!48417 (=> (not res!124325) (not e!99080))))

(assert (=> d!48417 (= res!124325 (= (size!3014 (buf!3479 (_2!6949 lt!230195))) (size!3014 (buf!3479 (_2!6949 lt!230195)))))))

(assert (=> d!48417 (= (isPrefixOf!0 (_2!6949 lt!230195) (_2!6949 lt!230195)) e!99080)))

(declare-fun b!148518 () Bool)

(declare-fun res!124324 () Bool)

(assert (=> b!148518 (=> (not res!124324) (not e!99080))))

(assert (=> b!148518 (= res!124324 (bvsle (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230195))) (currentByte!6387 (_2!6949 lt!230195)) (currentBit!6382 (_2!6949 lt!230195))) (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230195))) (currentByte!6387 (_2!6949 lt!230195)) (currentBit!6382 (_2!6949 lt!230195)))))))

(declare-fun b!148519 () Bool)

(declare-fun e!99079 () Bool)

(assert (=> b!148519 (= e!99080 e!99079)))

(declare-fun res!124323 () Bool)

(assert (=> b!148519 (=> res!124323 e!99079)))

(assert (=> b!148519 (= res!124323 (= (size!3014 (buf!3479 (_2!6949 lt!230195))) #b00000000000000000000000000000000))))

(declare-fun b!148520 () Bool)

(assert (=> b!148520 (= e!99079 (arrayBitRangesEq!0 (buf!3479 (_2!6949 lt!230195)) (buf!3479 (_2!6949 lt!230195)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230195))) (currentByte!6387 (_2!6949 lt!230195)) (currentBit!6382 (_2!6949 lt!230195)))))))

(assert (= (and d!48417 res!124325) b!148518))

(assert (= (and b!148518 res!124324) b!148519))

(assert (= (and b!148519 (not res!124323)) b!148520))

(assert (=> b!148518 m!229127))

(assert (=> b!148518 m!229127))

(assert (=> b!148520 m!229127))

(assert (=> b!148520 m!229127))

(declare-fun m!230619 () Bool)

(assert (=> b!148520 m!230619))

(assert (=> d!48120 d!48417))

(declare-fun d!48419 () Bool)

(assert (=> d!48419 (isPrefixOf!0 lt!230916 lt!230916)))

(declare-fun lt!231606 () Unit!9316)

(assert (=> d!48419 (= lt!231606 (choose!11 lt!230916))))

(assert (=> d!48419 (= (lemmaIsPrefixRefl!0 lt!230916) lt!231606)))

(declare-fun bs!11812 () Bool)

(assert (= bs!11812 d!48419))

(assert (=> bs!11812 m!229817))

(declare-fun m!230621 () Bool)

(assert (=> bs!11812 m!230621))

(assert (=> d!48120 d!48419))

(declare-fun d!48421 () Bool)

(assert (=> d!48421 (isPrefixOf!0 lt!230916 (_2!6949 lt!230188))))

(declare-fun lt!231607 () Unit!9316)

(assert (=> d!48421 (= lt!231607 (choose!30 lt!230916 (_2!6949 lt!230188) (_2!6949 lt!230188)))))

(assert (=> d!48421 (isPrefixOf!0 lt!230916 (_2!6949 lt!230188))))

(assert (=> d!48421 (= (lemmaIsPrefixTransitive!0 lt!230916 (_2!6949 lt!230188) (_2!6949 lt!230188)) lt!231607)))

(declare-fun bs!11813 () Bool)

(assert (= bs!11813 d!48421))

(assert (=> bs!11813 m!229819))

(declare-fun m!230623 () Bool)

(assert (=> bs!11813 m!230623))

(assert (=> bs!11813 m!229819))

(assert (=> d!48120 d!48421))

(declare-fun d!48423 () Bool)

(declare-fun res!124328 () Bool)

(declare-fun e!99082 () Bool)

(assert (=> d!48423 (=> (not res!124328) (not e!99082))))

(assert (=> d!48423 (= res!124328 (= (size!3014 (buf!3479 (_2!6949 lt!230188))) (size!3014 (buf!3479 (_2!6949 lt!230188)))))))

(assert (=> d!48423 (= (isPrefixOf!0 (_2!6949 lt!230188) (_2!6949 lt!230188)) e!99082)))

(declare-fun b!148521 () Bool)

(declare-fun res!124327 () Bool)

(assert (=> b!148521 (=> (not res!124327) (not e!99082))))

(assert (=> b!148521 (= res!124327 (bvsle (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230188))) (currentByte!6387 (_2!6949 lt!230188)) (currentBit!6382 (_2!6949 lt!230188))) (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230188))) (currentByte!6387 (_2!6949 lt!230188)) (currentBit!6382 (_2!6949 lt!230188)))))))

(declare-fun b!148522 () Bool)

(declare-fun e!99081 () Bool)

(assert (=> b!148522 (= e!99082 e!99081)))

(declare-fun res!124326 () Bool)

(assert (=> b!148522 (=> res!124326 e!99081)))

(assert (=> b!148522 (= res!124326 (= (size!3014 (buf!3479 (_2!6949 lt!230188))) #b00000000000000000000000000000000))))

(declare-fun b!148523 () Bool)

(assert (=> b!148523 (= e!99081 (arrayBitRangesEq!0 (buf!3479 (_2!6949 lt!230188)) (buf!3479 (_2!6949 lt!230188)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230188))) (currentByte!6387 (_2!6949 lt!230188)) (currentBit!6382 (_2!6949 lt!230188)))))))

(assert (= (and d!48423 res!124328) b!148521))

(assert (= (and b!148521 res!124327) b!148522))

(assert (= (and b!148522 (not res!124326)) b!148523))

(assert (=> b!148521 m!229189))

(assert (=> b!148521 m!229189))

(assert (=> b!148523 m!229189))

(assert (=> b!148523 m!229189))

(declare-fun m!230625 () Bool)

(assert (=> b!148523 m!230625))

(assert (=> d!48120 d!48423))

(declare-fun b!148533 () Bool)

(declare-fun res!124336 () Bool)

(declare-fun e!99090 () Bool)

(assert (=> b!148533 (=> (not res!124336) (not e!99090))))

(declare-fun _$37!53 () tuple2!13180)

(assert (=> b!148533 (= res!124336 (= (bitIndex!0 (size!3014 (buf!3479 (_2!6949 _$37!53))) (currentByte!6387 (_2!6949 _$37!53)) (currentBit!6382 (_2!6949 _$37!53))) (bvadd (bitIndex!0 (size!3014 (buf!3479 thiss!1634)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!148532 () Bool)

(declare-fun e!99089 () Bool)

(assert (=> b!148532 (= e!99089 (array_inv!2803 (buf!3479 (_2!6949 _$37!53))))))

(declare-fun d!48425 () Bool)

(assert (=> d!48425 e!99090))

(declare-fun res!124337 () Bool)

(assert (=> d!48425 (=> (not res!124337) (not e!99090))))

(assert (=> d!48425 (= res!124337 (= (size!3014 (buf!3479 thiss!1634)) (size!3014 (buf!3479 (_2!6949 _$37!53)))))))

(assert (=> d!48425 (and (inv!12 (_2!6949 _$37!53)) e!99089)))

(assert (=> d!48425 (= (choose!6 thiss!1634 (select (arr!3783 arr!237) from!447)) _$37!53)))

(declare-fun b!148534 () Bool)

(declare-fun res!124335 () Bool)

(assert (=> b!148534 (=> (not res!124335) (not e!99090))))

(assert (=> b!148534 (= res!124335 (isPrefixOf!0 thiss!1634 (_2!6949 _$37!53)))))

(declare-fun lt!231613 () tuple2!13182)

(declare-fun lt!231612 () tuple2!13184)

(declare-fun b!148535 () Bool)

(assert (=> b!148535 (= e!99090 (and (= (_2!6951 lt!231612) (select (arr!3783 arr!237) from!447)) (= (_1!6951 lt!231612) (_2!6950 lt!231613))))))

(assert (=> b!148535 (= lt!231612 (readBytePure!0 (_1!6950 lt!231613)))))

(assert (=> b!148535 (= lt!231613 (reader!0 thiss!1634 (_2!6949 _$37!53)))))

(assert (= d!48425 b!148532))

(assert (= (and d!48425 res!124337) b!148533))

(assert (= (and b!148533 res!124336) b!148534))

(assert (= (and b!148534 res!124335) b!148535))

(declare-fun m!230627 () Bool)

(assert (=> d!48425 m!230627))

(declare-fun m!230629 () Bool)

(assert (=> b!148532 m!230629))

(declare-fun m!230631 () Bool)

(assert (=> b!148535 m!230631))

(declare-fun m!230633 () Bool)

(assert (=> b!148535 m!230633))

(declare-fun m!230635 () Bool)

(assert (=> b!148534 m!230635))

(declare-fun m!230637 () Bool)

(assert (=> b!148533 m!230637))

(assert (=> b!148533 m!229129))

(assert (=> d!48141 d!48425))

(declare-fun d!48427 () Bool)

(assert (=> d!48427 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3014 (buf!3479 thiss!1634))) ((_ sign_extend 32) (currentByte!6387 thiss!1634)) ((_ sign_extend 32) (currentBit!6382 thiss!1634))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3014 (buf!3479 thiss!1634))) ((_ sign_extend 32) (currentByte!6387 thiss!1634)) ((_ sign_extend 32) (currentBit!6382 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!11814 () Bool)

(assert (= bs!11814 d!48427))

(assert (=> bs!11814 m!229701))

(assert (=> d!48141 d!48427))

(declare-fun d!48429 () Bool)

(declare-fun res!124340 () Bool)

(declare-fun e!99093 () Bool)

(assert (=> d!48429 (=> (not res!124340) (not e!99093))))

(assert (=> d!48429 (= res!124340 (= (size!3014 (buf!3479 (_2!6950 lt!230853))) (size!3014 (buf!3479 (_2!6949 lt!230195)))))))

(assert (=> d!48429 (= (isPrefixOf!0 (_2!6950 lt!230853) (_2!6949 lt!230195)) e!99093)))

(declare-fun b!148536 () Bool)

(declare-fun res!124339 () Bool)

(assert (=> b!148536 (=> (not res!124339) (not e!99093))))

(assert (=> b!148536 (= res!124339 (bvsle (bitIndex!0 (size!3014 (buf!3479 (_2!6950 lt!230853))) (currentByte!6387 (_2!6950 lt!230853)) (currentBit!6382 (_2!6950 lt!230853))) (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230195))) (currentByte!6387 (_2!6949 lt!230195)) (currentBit!6382 (_2!6949 lt!230195)))))))

(declare-fun b!148537 () Bool)

(declare-fun e!99092 () Bool)

(assert (=> b!148537 (= e!99093 e!99092)))

(declare-fun res!124338 () Bool)

(assert (=> b!148537 (=> res!124338 e!99092)))

(assert (=> b!148537 (= res!124338 (= (size!3014 (buf!3479 (_2!6950 lt!230853))) #b00000000000000000000000000000000))))

(declare-fun b!148538 () Bool)

(assert (=> b!148538 (= e!99092 (arrayBitRangesEq!0 (buf!3479 (_2!6950 lt!230853)) (buf!3479 (_2!6949 lt!230195)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3014 (buf!3479 (_2!6950 lt!230853))) (currentByte!6387 (_2!6950 lt!230853)) (currentBit!6382 (_2!6950 lt!230853)))))))

(assert (= (and d!48429 res!124340) b!148536))

(assert (= (and b!148536 res!124339) b!148537))

(assert (= (and b!148537 (not res!124338)) b!148538))

(declare-fun m!230639 () Bool)

(assert (=> b!148536 m!230639))

(assert (=> b!148536 m!229127))

(assert (=> b!148538 m!230639))

(assert (=> b!148538 m!230639))

(declare-fun m!230641 () Bool)

(assert (=> b!148538 m!230641))

(assert (=> b!148162 d!48429))

(declare-fun b!148549 () Bool)

(declare-fun e!99104 () Bool)

(declare-fun _$39!57 () tuple2!13180)

(assert (=> b!148549 (= e!99104 (array_inv!2803 (buf!3479 (_2!6949 _$39!57))))))

(declare-fun b!148550 () Bool)

(declare-fun res!124349 () Bool)

(declare-fun e!99105 () Bool)

(assert (=> b!148550 (=> (not res!124349) (not e!99105))))

(assert (=> b!148550 (= res!124349 (= (bitIndex!0 (size!3014 (buf!3479 (_2!6949 _$39!57))) (currentByte!6387 (_2!6949 _$39!57)) (currentBit!6382 (_2!6949 _$39!57))) (bvadd (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230195))) (currentByte!6387 (_2!6949 lt!230195)) (currentBit!6382 (_2!6949 lt!230195))) (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!148551 () Bool)

(declare-fun e!99103 () Bool)

(assert (=> b!148551 (= e!99105 e!99103)))

(declare-fun res!124351 () Bool)

(assert (=> b!148551 (=> (not res!124351) (not e!99103))))

(declare-fun lt!231626 () tuple2!13186)

(declare-fun lt!231624 () tuple2!13182)

(assert (=> b!148551 (= res!124351 (and (= (size!3014 (_2!6952 lt!231626)) (size!3014 arr!237)) (= (_1!6952 lt!231626) (_2!6950 lt!231624))))))

(assert (=> b!148551 (= lt!231626 (readByteArrayLoopPure!0 (_1!6950 lt!231624) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!231627 () Unit!9316)

(declare-fun lt!231625 () Unit!9316)

(assert (=> b!148551 (= lt!231627 lt!231625)))

(declare-fun lt!231628 () (_ BitVec 64))

(assert (=> b!148551 (validate_offset_bits!1 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 _$39!57)))) ((_ sign_extend 32) (currentByte!6387 (_2!6949 lt!230195))) ((_ sign_extend 32) (currentBit!6382 (_2!6949 lt!230195))) lt!231628)))

(assert (=> b!148551 (= lt!231625 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6949 lt!230195) (buf!3479 (_2!6949 _$39!57)) lt!231628))))

(assert (=> b!148551 (= lt!231628 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!148551 (= lt!231624 (reader!0 (_2!6949 lt!230195) (_2!6949 _$39!57)))))

(declare-fun d!48431 () Bool)

(assert (=> d!48431 e!99105))

(declare-fun res!124352 () Bool)

(assert (=> d!48431 (=> (not res!124352) (not e!99105))))

(assert (=> d!48431 (= res!124352 (= (size!3014 (buf!3479 (_2!6949 lt!230195))) (size!3014 (buf!3479 (_2!6949 _$39!57)))))))

(assert (=> d!48431 (and (inv!12 (_2!6949 _$39!57)) e!99104)))

(assert (=> d!48431 (= (choose!64 (_2!6949 lt!230195) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) _$39!57)))

(declare-fun b!148552 () Bool)

(declare-fun res!124350 () Bool)

(assert (=> b!148552 (=> (not res!124350) (not e!99105))))

(assert (=> b!148552 (= res!124350 (isPrefixOf!0 (_2!6949 lt!230195) (_2!6949 _$39!57)))))

(declare-fun b!148553 () Bool)

(assert (=> b!148553 (= e!99103 (arrayRangesEq!330 arr!237 (_2!6952 lt!231626) #b00000000000000000000000000000000 to!404))))

(assert (= d!48431 b!148549))

(assert (= (and d!48431 res!124352) b!148550))

(assert (= (and b!148550 res!124349) b!148552))

(assert (= (and b!148552 res!124350) b!148551))

(assert (= (and b!148551 res!124351) b!148553))

(declare-fun m!230643 () Bool)

(assert (=> d!48431 m!230643))

(declare-fun m!230645 () Bool)

(assert (=> b!148550 m!230645))

(assert (=> b!148550 m!229127))

(declare-fun m!230647 () Bool)

(assert (=> b!148553 m!230647))

(declare-fun m!230649 () Bool)

(assert (=> b!148551 m!230649))

(declare-fun m!230651 () Bool)

(assert (=> b!148551 m!230651))

(declare-fun m!230653 () Bool)

(assert (=> b!148551 m!230653))

(declare-fun m!230655 () Bool)

(assert (=> b!148551 m!230655))

(declare-fun m!230657 () Bool)

(assert (=> b!148549 m!230657))

(declare-fun m!230659 () Bool)

(assert (=> b!148552 m!230659))

(assert (=> d!48116 d!48431))

(declare-fun lt!231648 () tuple3!580)

(declare-fun bm!2037 () Bool)

(declare-fun call!2040 () (_ BitVec 64))

(declare-fun c!8033 () Bool)

(assert (=> bm!2037 (= call!2040 (bitIndex!0 (ite c!8033 (size!3014 (buf!3479 (_2!6962 lt!231648))) (size!3014 (buf!3479 (withMovedByteIndex!0 (_1!6950 lt!230201) #b00000000000000000000000000000001)))) (ite c!8033 (currentByte!6387 (_2!6962 lt!231648)) (currentByte!6387 (withMovedByteIndex!0 (_1!6950 lt!230201) #b00000000000000000000000000000001))) (ite c!8033 (currentBit!6382 (_2!6962 lt!231648)) (currentBit!6382 (withMovedByteIndex!0 (_1!6950 lt!230201) #b00000000000000000000000000000001)))))))

(declare-fun call!2041 () Bool)

(declare-fun bm!2038 () Bool)

(declare-fun lt!231639 () tuple2!13200)

(assert (=> bm!2038 (= call!2041 (arrayRangesEq!330 lt!230178 (ite c!8033 (array!6662 (store (arr!3783 lt!230178) (bvadd #b00000000000000000000000000000001 from!447) (_1!6961 lt!231639)) (size!3014 lt!230178)) lt!230178) #b00000000000000000000000000000000 (ite c!8033 (bvadd #b00000000000000000000000000000001 from!447) (size!3014 lt!230178))))))

(declare-fun b!148554 () Bool)

(declare-fun lt!231638 () tuple3!580)

(declare-fun e!99108 () Bool)

(assert (=> b!148554 (= e!99108 (= (select (arr!3783 (_3!361 lt!231638)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!6951 (readBytePure!0 (withMovedByteIndex!0 (_1!6950 lt!230201) #b00000000000000000000000000000001)))))))

(assert (=> b!148554 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!3014 (_3!361 lt!231638))))))

(declare-fun lt!231656 () array!6661)

(declare-fun bm!2039 () Bool)

(declare-fun call!2042 () Bool)

(declare-fun lt!231661 () (_ BitVec 32))

(declare-fun lt!231649 () array!6661)

(declare-fun lt!231636 () (_ BitVec 32))

(declare-fun lt!231641 () (_ BitVec 32))

(assert (=> bm!2039 (= call!2042 (arrayRangesEq!330 (ite c!8033 lt!230178 lt!231656) (ite c!8033 (_3!361 lt!231648) lt!231649) (ite c!8033 lt!231636 lt!231661) (ite c!8033 (bvadd #b00000000000000000000000000000001 from!447) lt!231641)))))

(declare-fun d!48433 () Bool)

(assert (=> d!48433 e!99108))

(declare-fun res!124353 () Bool)

(assert (=> d!48433 (=> res!124353 e!99108)))

(assert (=> d!48433 (= res!124353 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!231653 () Bool)

(declare-fun e!99107 () Bool)

(assert (=> d!48433 (= lt!231653 e!99107)))

(declare-fun res!124354 () Bool)

(assert (=> d!48433 (=> (not res!124354) (not e!99107))))

(declare-fun lt!231664 () (_ BitVec 64))

(declare-fun lt!231635 () (_ BitVec 64))

(assert (=> d!48433 (= res!124354 (= (bvadd lt!231635 lt!231664) (bitIndex!0 (size!3014 (buf!3479 (_2!6962 lt!231638))) (currentByte!6387 (_2!6962 lt!231638)) (currentBit!6382 (_2!6962 lt!231638)))))))

(assert (=> d!48433 (or (not (= (bvand lt!231635 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!231664 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!231635 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!231635 lt!231664) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!231644 () (_ BitVec 64))

(assert (=> d!48433 (= lt!231664 (bvmul lt!231644 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!48433 (or (= lt!231644 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!231644 #b0000000000000000000000000000000000000000000000000000000000001000) lt!231644)))))

(assert (=> d!48433 (= lt!231644 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!48433 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!48433 (= lt!231635 (bitIndex!0 (size!3014 (buf!3479 (withMovedByteIndex!0 (_1!6950 lt!230201) #b00000000000000000000000000000001))) (currentByte!6387 (withMovedByteIndex!0 (_1!6950 lt!230201) #b00000000000000000000000000000001)) (currentBit!6382 (withMovedByteIndex!0 (_1!6950 lt!230201) #b00000000000000000000000000000001))))))

(declare-fun e!99106 () tuple3!580)

(assert (=> d!48433 (= lt!231638 e!99106)))

(assert (=> d!48433 (= c!8033 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!48433 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!3014 lt!230178)))))

(assert (=> d!48433 (= (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!6950 lt!230201) #b00000000000000000000000000000001) lt!230178 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!231638)))

(declare-fun b!148555 () Bool)

(declare-fun lt!231646 () Unit!9316)

(assert (=> b!148555 (= e!99106 (tuple3!581 lt!231646 (_2!6962 lt!231648) (_3!361 lt!231648)))))

(assert (=> b!148555 (= lt!231639 (readByte!0 (withMovedByteIndex!0 (_1!6950 lt!230201) #b00000000000000000000000000000001)))))

(declare-fun lt!231658 () array!6661)

(assert (=> b!148555 (= lt!231658 (array!6662 (store (arr!3783 lt!230178) (bvadd #b00000000000000000000000000000001 from!447) (_1!6961 lt!231639)) (size!3014 lt!230178)))))

(declare-fun lt!231647 () (_ BitVec 64))

(assert (=> b!148555 (= lt!231647 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!231650 () (_ BitVec 32))

(assert (=> b!148555 (= lt!231650 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!231652 () Unit!9316)

(assert (=> b!148555 (= lt!231652 (validateOffsetBytesFromBitIndexLemma!0 (withMovedByteIndex!0 (_1!6950 lt!230201) #b00000000000000000000000000000001) (_2!6961 lt!231639) lt!231647 lt!231650))))

(assert (=> b!148555 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6961 lt!231639)))) ((_ sign_extend 32) (currentByte!6387 (_2!6961 lt!231639))) ((_ sign_extend 32) (currentBit!6382 (_2!6961 lt!231639))) (bvsub lt!231650 ((_ extract 31 0) (bvsdiv (bvadd lt!231647 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!231662 () Unit!9316)

(assert (=> b!148555 (= lt!231662 lt!231652)))

(assert (=> b!148555 (= lt!231648 (readByteArrayLoop!0 (_2!6961 lt!231639) lt!231658 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!148555 (= (bitIndex!0 (size!3014 (buf!3479 (_2!6961 lt!231639))) (currentByte!6387 (_2!6961 lt!231639)) (currentBit!6382 (_2!6961 lt!231639))) (bvadd (bitIndex!0 (size!3014 (buf!3479 (withMovedByteIndex!0 (_1!6950 lt!230201) #b00000000000000000000000000000001))) (currentByte!6387 (withMovedByteIndex!0 (_1!6950 lt!230201) #b00000000000000000000000000000001)) (currentBit!6382 (withMovedByteIndex!0 (_1!6950 lt!230201) #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!231632 () Unit!9316)

(declare-fun Unit!9394 () Unit!9316)

(assert (=> b!148555 (= lt!231632 Unit!9394)))

(assert (=> b!148555 (= (bvadd (bitIndex!0 (size!3014 (buf!3479 (_2!6961 lt!231639))) (currentByte!6387 (_2!6961 lt!231639)) (currentBit!6382 (_2!6961 lt!231639))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2040)))

(declare-fun lt!231657 () Unit!9316)

(declare-fun Unit!9395 () Unit!9316)

(assert (=> b!148555 (= lt!231657 Unit!9395)))

(assert (=> b!148555 (= (bvadd (bitIndex!0 (size!3014 (buf!3479 (withMovedByteIndex!0 (_1!6950 lt!230201) #b00000000000000000000000000000001))) (currentByte!6387 (withMovedByteIndex!0 (_1!6950 lt!230201) #b00000000000000000000000000000001)) (currentBit!6382 (withMovedByteIndex!0 (_1!6950 lt!230201) #b00000000000000000000000000000001))) (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2040)))

(declare-fun lt!231643 () Unit!9316)

(declare-fun Unit!9396 () Unit!9316)

(assert (=> b!148555 (= lt!231643 Unit!9396)))

(assert (=> b!148555 (and (= (buf!3479 (withMovedByteIndex!0 (_1!6950 lt!230201) #b00000000000000000000000000000001)) (buf!3479 (_2!6962 lt!231648))) (= (size!3014 lt!230178) (size!3014 (_3!361 lt!231648))))))

(declare-fun lt!231631 () Unit!9316)

(declare-fun Unit!9397 () Unit!9316)

(assert (=> b!148555 (= lt!231631 Unit!9397)))

(declare-fun lt!231659 () Unit!9316)

(assert (=> b!148555 (= lt!231659 (arrayUpdatedAtPrefixLemma!15 lt!230178 (bvadd #b00000000000000000000000000000001 from!447) (_1!6961 lt!231639)))))

(assert (=> b!148555 call!2041))

(declare-fun lt!231629 () Unit!9316)

(assert (=> b!148555 (= lt!231629 lt!231659)))

(assert (=> b!148555 (= lt!231636 #b00000000000000000000000000000000)))

(declare-fun lt!231634 () Unit!9316)

(assert (=> b!148555 (= lt!231634 (arrayRangesEqTransitive!55 lt!230178 lt!231658 (_3!361 lt!231648) lt!231636 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!148555 call!2042))

(declare-fun lt!231642 () Unit!9316)

(assert (=> b!148555 (= lt!231642 lt!231634)))

(assert (=> b!148555 (arrayRangesEq!330 lt!230178 (_3!361 lt!231648) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!231654 () Unit!9316)

(declare-fun Unit!9398 () Unit!9316)

(assert (=> b!148555 (= lt!231654 Unit!9398)))

(declare-fun lt!231660 () Unit!9316)

(assert (=> b!148555 (= lt!231660 (arrayRangesEqImpliesEq!15 lt!231658 (_3!361 lt!231648) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!148555 (= (select (store (arr!3783 lt!230178) (bvadd #b00000000000000000000000000000001 from!447) (_1!6961 lt!231639)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3783 (_3!361 lt!231648)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!231637 () Unit!9316)

(assert (=> b!148555 (= lt!231637 lt!231660)))

(declare-fun lt!231630 () Bool)

(assert (=> b!148555 (= lt!231630 (= (select (arr!3783 (_3!361 lt!231648)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!6961 lt!231639)))))

(declare-fun Unit!9399 () Unit!9316)

(assert (=> b!148555 (= lt!231646 Unit!9399)))

(assert (=> b!148555 lt!231630))

(declare-fun lt!231655 () Unit!9316)

(declare-fun b!148556 () Bool)

(assert (=> b!148556 (= e!99106 (tuple3!581 lt!231655 (withMovedByteIndex!0 (_1!6950 lt!230201) #b00000000000000000000000000000001) lt!230178))))

(assert (=> b!148556 (= call!2040 call!2040)))

(declare-fun lt!231651 () Unit!9316)

(declare-fun Unit!9400 () Unit!9316)

(assert (=> b!148556 (= lt!231651 Unit!9400)))

(declare-fun lt!231633 () Unit!9316)

(assert (=> b!148556 (= lt!231633 (arrayRangesEqReflexiveLemma!15 lt!230178))))

(assert (=> b!148556 call!2041))

(declare-fun lt!231663 () Unit!9316)

(assert (=> b!148556 (= lt!231663 lt!231633)))

(assert (=> b!148556 (= lt!231656 lt!230178)))

(assert (=> b!148556 (= lt!231649 lt!230178)))

(declare-fun lt!231640 () (_ BitVec 32))

(assert (=> b!148556 (= lt!231640 #b00000000000000000000000000000000)))

(declare-fun lt!231645 () (_ BitVec 32))

(assert (=> b!148556 (= lt!231645 (size!3014 lt!230178))))

(assert (=> b!148556 (= lt!231661 #b00000000000000000000000000000000)))

(assert (=> b!148556 (= lt!231641 (bvadd #b00000000000000000000000000000001 from!447))))

(assert (=> b!148556 (= lt!231655 (arrayRangesEqSlicedLemma!15 lt!231656 lt!231649 lt!231640 lt!231645 lt!231661 lt!231641))))

(assert (=> b!148556 call!2042))

(declare-fun b!148557 () Bool)

(assert (=> b!148557 (= e!99107 (arrayRangesEq!330 lt!230178 (_3!361 lt!231638) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun b!148558 () Bool)

(declare-fun res!124355 () Bool)

(assert (=> b!148558 (=> (not res!124355) (not e!99107))))

(assert (=> b!148558 (= res!124355 (and (= (buf!3479 (withMovedByteIndex!0 (_1!6950 lt!230201) #b00000000000000000000000000000001)) (buf!3479 (_2!6962 lt!231638))) (= (size!3014 lt!230178) (size!3014 (_3!361 lt!231638)))))))

(assert (= (and d!48433 c!8033) b!148555))

(assert (= (and d!48433 (not c!8033)) b!148556))

(assert (= (or b!148555 b!148556) bm!2039))

(assert (= (or b!148555 b!148556) bm!2038))

(assert (= (or b!148555 b!148556) bm!2037))

(assert (= (and d!48433 res!124354) b!148558))

(assert (= (and b!148558 res!124355) b!148557))

(assert (= (and d!48433 (not res!124353)) b!148554))

(declare-fun m!230661 () Bool)

(assert (=> bm!2038 m!230661))

(declare-fun m!230663 () Bool)

(assert (=> bm!2038 m!230663))

(declare-fun m!230665 () Bool)

(assert (=> bm!2037 m!230665))

(declare-fun m!230667 () Bool)

(assert (=> bm!2039 m!230667))

(declare-fun m!230669 () Bool)

(assert (=> b!148556 m!230669))

(declare-fun m!230671 () Bool)

(assert (=> b!148556 m!230671))

(declare-fun m!230673 () Bool)

(assert (=> b!148554 m!230673))

(assert (=> b!148554 m!229135))

(declare-fun m!230675 () Bool)

(assert (=> b!148554 m!230675))

(declare-fun m!230677 () Bool)

(assert (=> b!148555 m!230677))

(declare-fun m!230679 () Bool)

(assert (=> b!148555 m!230679))

(declare-fun m!230681 () Bool)

(assert (=> b!148555 m!230681))

(assert (=> b!148555 m!230661))

(assert (=> b!148555 m!229135))

(declare-fun m!230683 () Bool)

(assert (=> b!148555 m!230683))

(declare-fun m!230685 () Bool)

(assert (=> b!148555 m!230685))

(declare-fun m!230687 () Bool)

(assert (=> b!148555 m!230687))

(declare-fun m!230689 () Bool)

(assert (=> b!148555 m!230689))

(declare-fun m!230691 () Bool)

(assert (=> b!148555 m!230691))

(declare-fun m!230693 () Bool)

(assert (=> b!148555 m!230693))

(assert (=> b!148555 m!229135))

(declare-fun m!230695 () Bool)

(assert (=> b!148555 m!230695))

(declare-fun m!230697 () Bool)

(assert (=> b!148555 m!230697))

(declare-fun m!230699 () Bool)

(assert (=> b!148555 m!230699))

(declare-fun m!230701 () Bool)

(assert (=> b!148557 m!230701))

(declare-fun m!230703 () Bool)

(assert (=> d!48433 m!230703))

(assert (=> d!48433 m!230697))

(assert (=> d!48108 d!48433))

(declare-fun d!48435 () Bool)

(declare-fun res!124356 () Bool)

(declare-fun e!99109 () Bool)

(assert (=> d!48435 (=> res!124356 e!99109)))

(assert (=> d!48435 (= res!124356 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!48435 (= (arrayRangesEq!330 arr!237 (_2!6952 lt!230891) #b00000000000000000000000000000000 to!404) e!99109)))

(declare-fun b!148559 () Bool)

(declare-fun e!99110 () Bool)

(assert (=> b!148559 (= e!99109 e!99110)))

(declare-fun res!124357 () Bool)

(assert (=> b!148559 (=> (not res!124357) (not e!99110))))

(assert (=> b!148559 (= res!124357 (= (select (arr!3783 arr!237) #b00000000000000000000000000000000) (select (arr!3783 (_2!6952 lt!230891)) #b00000000000000000000000000000000)))))

(declare-fun b!148560 () Bool)

(assert (=> b!148560 (= e!99110 (arrayRangesEq!330 arr!237 (_2!6952 lt!230891) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48435 (not res!124356)) b!148559))

(assert (= (and b!148559 res!124357) b!148560))

(assert (=> b!148559 m!229703))

(declare-fun m!230705 () Bool)

(assert (=> b!148559 m!230705))

(declare-fun m!230707 () Bool)

(assert (=> b!148560 m!230707))

(assert (=> b!148179 d!48435))

(assert (=> d!48155 d!48153))

(declare-fun d!48437 () Bool)

(assert (=> d!48437 (arrayRangesEq!330 (_2!6952 lt!230185) (_2!6952 lt!230198) #b00000000000000000000000000000000 to!404)))

(assert (=> d!48437 true))

(declare-fun _$6!325 () Unit!9316)

(assert (=> d!48437 (= (choose!85 (_2!6952 lt!230198) (_2!6952 lt!230185) #b00000000000000000000000000000000 to!404) _$6!325)))

(declare-fun bs!11815 () Bool)

(assert (= bs!11815 d!48437))

(assert (=> bs!11815 m!229191))

(assert (=> d!48155 d!48437))

(declare-fun d!48439 () Bool)

(assert (=> d!48439 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230195)))) ((_ sign_extend 32) (currentByte!6387 (_2!6949 lt!230195))) ((_ sign_extend 32) (currentBit!6382 (_2!6949 lt!230195))) (bvsub (bvsub to!404 from!447) lt!230976)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) lt!230976)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230195)))) ((_ sign_extend 32) (currentByte!6387 (_2!6949 lt!230195))) ((_ sign_extend 32) (currentBit!6382 (_2!6949 lt!230195)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11816 () Bool)

(assert (= bs!11816 d!48439))

(assert (=> bs!11816 m!229697))

(assert (=> b!148202 d!48439))

(declare-fun d!48441 () Bool)

(declare-fun res!124358 () Bool)

(declare-fun e!99111 () Bool)

(assert (=> d!48441 (=> res!124358 e!99111)))

(assert (=> d!48441 (= res!124358 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!48441 (= (arrayRangesEq!330 (_2!6952 lt!230185) (_2!6952 lt!230198) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!99111)))

(declare-fun b!148561 () Bool)

(declare-fun e!99112 () Bool)

(assert (=> b!148561 (= e!99111 e!99112)))

(declare-fun res!124359 () Bool)

(assert (=> b!148561 (=> (not res!124359) (not e!99112))))

(assert (=> b!148561 (= res!124359 (= (select (arr!3783 (_2!6952 lt!230185)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3783 (_2!6952 lt!230198)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!148562 () Bool)

(assert (=> b!148562 (= e!99112 (arrayRangesEq!330 (_2!6952 lt!230185) (_2!6952 lt!230198) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48441 (not res!124358)) b!148561))

(assert (= (and b!148561 res!124359) b!148562))

(declare-fun m!230709 () Bool)

(assert (=> b!148561 m!230709))

(assert (=> b!148561 m!230579))

(declare-fun m!230711 () Bool)

(assert (=> b!148562 m!230711))

(assert (=> b!148215 d!48441))

(declare-fun d!48443 () Bool)

(declare-fun lt!231665 () tuple2!13200)

(assert (=> d!48443 (= lt!231665 (readByte!0 (_1!6950 lt!230989)))))

(assert (=> d!48443 (= (readBytePure!0 (_1!6950 lt!230989)) (tuple2!13185 (_2!6961 lt!231665) (_1!6961 lt!231665)))))

(declare-fun bs!11817 () Bool)

(assert (= bs!11817 d!48443))

(declare-fun m!230713 () Bool)

(assert (=> bs!11817 m!230713))

(assert (=> b!148211 d!48443))

(declare-fun b!148563 () Bool)

(declare-fun e!99113 () Unit!9316)

(declare-fun lt!231681 () Unit!9316)

(assert (=> b!148563 (= e!99113 lt!231681)))

(declare-fun lt!231677 () (_ BitVec 64))

(assert (=> b!148563 (= lt!231677 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!231675 () (_ BitVec 64))

(assert (=> b!148563 (= lt!231675 (bitIndex!0 (size!3014 (buf!3479 thiss!1634)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634)))))

(assert (=> b!148563 (= lt!231681 (arrayBitRangesEqSymmetric!0 (buf!3479 thiss!1634) (buf!3479 (_2!6949 lt!230991)) lt!231677 lt!231675))))

(assert (=> b!148563 (arrayBitRangesEq!0 (buf!3479 (_2!6949 lt!230991)) (buf!3479 thiss!1634) lt!231677 lt!231675)))

(declare-fun b!148564 () Bool)

(declare-fun res!124360 () Bool)

(declare-fun e!99114 () Bool)

(assert (=> b!148564 (=> (not res!124360) (not e!99114))))

(declare-fun lt!231682 () tuple2!13182)

(assert (=> b!148564 (= res!124360 (isPrefixOf!0 (_1!6950 lt!231682) thiss!1634))))

(declare-fun b!148565 () Bool)

(declare-fun Unit!9401 () Unit!9316)

(assert (=> b!148565 (= e!99113 Unit!9401)))

(declare-fun b!148566 () Bool)

(declare-fun lt!231676 () (_ BitVec 64))

(declare-fun lt!231684 () (_ BitVec 64))

(assert (=> b!148566 (= e!99114 (= (_1!6950 lt!231682) (withMovedBitIndex!0 (_2!6950 lt!231682) (bvsub lt!231676 lt!231684))))))

(assert (=> b!148566 (or (= (bvand lt!231676 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!231684 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!231676 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!231676 lt!231684) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!148566 (= lt!231684 (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230991))) (currentByte!6387 (_2!6949 lt!230991)) (currentBit!6382 (_2!6949 lt!230991))))))

(assert (=> b!148566 (= lt!231676 (bitIndex!0 (size!3014 (buf!3479 thiss!1634)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634)))))

(declare-fun d!48445 () Bool)

(assert (=> d!48445 e!99114))

(declare-fun res!124362 () Bool)

(assert (=> d!48445 (=> (not res!124362) (not e!99114))))

(assert (=> d!48445 (= res!124362 (isPrefixOf!0 (_1!6950 lt!231682) (_2!6950 lt!231682)))))

(declare-fun lt!231667 () BitStream!5286)

(assert (=> d!48445 (= lt!231682 (tuple2!13183 lt!231667 (_2!6949 lt!230991)))))

(declare-fun lt!231678 () Unit!9316)

(declare-fun lt!231674 () Unit!9316)

(assert (=> d!48445 (= lt!231678 lt!231674)))

(assert (=> d!48445 (isPrefixOf!0 lt!231667 (_2!6949 lt!230991))))

(assert (=> d!48445 (= lt!231674 (lemmaIsPrefixTransitive!0 lt!231667 (_2!6949 lt!230991) (_2!6949 lt!230991)))))

(declare-fun lt!231670 () Unit!9316)

(declare-fun lt!231666 () Unit!9316)

(assert (=> d!48445 (= lt!231670 lt!231666)))

(assert (=> d!48445 (isPrefixOf!0 lt!231667 (_2!6949 lt!230991))))

(assert (=> d!48445 (= lt!231666 (lemmaIsPrefixTransitive!0 lt!231667 thiss!1634 (_2!6949 lt!230991)))))

(declare-fun lt!231680 () Unit!9316)

(assert (=> d!48445 (= lt!231680 e!99113)))

(declare-fun c!8034 () Bool)

(assert (=> d!48445 (= c!8034 (not (= (size!3014 (buf!3479 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!231685 () Unit!9316)

(declare-fun lt!231683 () Unit!9316)

(assert (=> d!48445 (= lt!231685 lt!231683)))

(assert (=> d!48445 (isPrefixOf!0 (_2!6949 lt!230991) (_2!6949 lt!230991))))

(assert (=> d!48445 (= lt!231683 (lemmaIsPrefixRefl!0 (_2!6949 lt!230991)))))

(declare-fun lt!231679 () Unit!9316)

(declare-fun lt!231668 () Unit!9316)

(assert (=> d!48445 (= lt!231679 lt!231668)))

(assert (=> d!48445 (= lt!231668 (lemmaIsPrefixRefl!0 (_2!6949 lt!230991)))))

(declare-fun lt!231671 () Unit!9316)

(declare-fun lt!231673 () Unit!9316)

(assert (=> d!48445 (= lt!231671 lt!231673)))

(assert (=> d!48445 (isPrefixOf!0 lt!231667 lt!231667)))

(assert (=> d!48445 (= lt!231673 (lemmaIsPrefixRefl!0 lt!231667))))

(declare-fun lt!231672 () Unit!9316)

(declare-fun lt!231669 () Unit!9316)

(assert (=> d!48445 (= lt!231672 lt!231669)))

(assert (=> d!48445 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!48445 (= lt!231669 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!48445 (= lt!231667 (BitStream!5287 (buf!3479 (_2!6949 lt!230991)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634)))))

(assert (=> d!48445 (isPrefixOf!0 thiss!1634 (_2!6949 lt!230991))))

(assert (=> d!48445 (= (reader!0 thiss!1634 (_2!6949 lt!230991)) lt!231682)))

(declare-fun b!148567 () Bool)

(declare-fun res!124361 () Bool)

(assert (=> b!148567 (=> (not res!124361) (not e!99114))))

(assert (=> b!148567 (= res!124361 (isPrefixOf!0 (_2!6950 lt!231682) (_2!6949 lt!230991)))))

(assert (= (and d!48445 c!8034) b!148563))

(assert (= (and d!48445 (not c!8034)) b!148565))

(assert (= (and d!48445 res!124362) b!148564))

(assert (= (and b!148564 res!124360) b!148567))

(assert (= (and b!148567 res!124361) b!148566))

(declare-fun m!230715 () Bool)

(assert (=> b!148564 m!230715))

(assert (=> b!148563 m!229129))

(declare-fun m!230717 () Bool)

(assert (=> b!148563 m!230717))

(declare-fun m!230719 () Bool)

(assert (=> b!148563 m!230719))

(declare-fun m!230721 () Bool)

(assert (=> b!148567 m!230721))

(declare-fun m!230723 () Bool)

(assert (=> b!148566 m!230723))

(assert (=> b!148566 m!229863))

(assert (=> b!148566 m!229129))

(declare-fun m!230725 () Bool)

(assert (=> d!48445 m!230725))

(assert (=> d!48445 m!229723))

(declare-fun m!230727 () Bool)

(assert (=> d!48445 m!230727))

(assert (=> d!48445 m!229727))

(declare-fun m!230729 () Bool)

(assert (=> d!48445 m!230729))

(declare-fun m!230731 () Bool)

(assert (=> d!48445 m!230731))

(declare-fun m!230733 () Bool)

(assert (=> d!48445 m!230733))

(assert (=> d!48445 m!229865))

(declare-fun m!230735 () Bool)

(assert (=> d!48445 m!230735))

(declare-fun m!230737 () Bool)

(assert (=> d!48445 m!230737))

(declare-fun m!230739 () Bool)

(assert (=> d!48445 m!230739))

(assert (=> b!148211 d!48445))

(declare-fun d!48447 () Bool)

(declare-fun e!99115 () Bool)

(assert (=> d!48447 e!99115))

(declare-fun res!124364 () Bool)

(assert (=> d!48447 (=> (not res!124364) (not e!99115))))

(declare-fun lt!231687 () (_ BitVec 64))

(declare-fun lt!231688 () (_ BitVec 64))

(declare-fun lt!231689 () (_ BitVec 64))

(assert (=> d!48447 (= res!124364 (= lt!231688 (bvsub lt!231687 lt!231689)))))

(assert (=> d!48447 (or (= (bvand lt!231687 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!231689 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!231687 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!231687 lt!231689) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48447 (= lt!231689 (remainingBits!0 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230991)))) ((_ sign_extend 32) (currentByte!6387 (_2!6949 lt!230991))) ((_ sign_extend 32) (currentBit!6382 (_2!6949 lt!230991)))))))

(declare-fun lt!231686 () (_ BitVec 64))

(declare-fun lt!231690 () (_ BitVec 64))

(assert (=> d!48447 (= lt!231687 (bvmul lt!231686 lt!231690))))

(assert (=> d!48447 (or (= lt!231686 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!231690 (bvsdiv (bvmul lt!231686 lt!231690) lt!231686)))))

(assert (=> d!48447 (= lt!231690 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!48447 (= lt!231686 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230991)))))))

(assert (=> d!48447 (= lt!231688 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6387 (_2!6949 lt!230991))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6382 (_2!6949 lt!230991)))))))

(assert (=> d!48447 (invariant!0 (currentBit!6382 (_2!6949 lt!230991)) (currentByte!6387 (_2!6949 lt!230991)) (size!3014 (buf!3479 (_2!6949 lt!230991))))))

(assert (=> d!48447 (= (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230991))) (currentByte!6387 (_2!6949 lt!230991)) (currentBit!6382 (_2!6949 lt!230991))) lt!231688)))

(declare-fun b!148568 () Bool)

(declare-fun res!124363 () Bool)

(assert (=> b!148568 (=> (not res!124363) (not e!99115))))

(assert (=> b!148568 (= res!124363 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!231688))))

(declare-fun b!148569 () Bool)

(declare-fun lt!231691 () (_ BitVec 64))

(assert (=> b!148569 (= e!99115 (bvsle lt!231688 (bvmul lt!231691 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!148569 (or (= lt!231691 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!231691 #b0000000000000000000000000000000000000000000000000000000000001000) lt!231691)))))

(assert (=> b!148569 (= lt!231691 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230991)))))))

(assert (= (and d!48447 res!124364) b!148568))

(assert (= (and b!148568 res!124363) b!148569))

(declare-fun m!230741 () Bool)

(assert (=> d!48447 m!230741))

(declare-fun m!230743 () Bool)

(assert (=> d!48447 m!230743))

(assert (=> b!148209 d!48447))

(assert (=> b!148209 d!48090))

(assert (=> b!148158 d!48090))

(declare-fun d!48449 () Bool)

(assert (=> d!48449 (arrayBitRangesEq!0 (buf!3479 (_2!6949 lt!230195)) (buf!3479 thiss!1634) lt!230848 lt!230846)))

(declare-fun lt!231694 () Unit!9316)

(declare-fun choose!8 (array!6661 array!6661 (_ BitVec 64) (_ BitVec 64)) Unit!9316)

(assert (=> d!48449 (= lt!231694 (choose!8 (buf!3479 thiss!1634) (buf!3479 (_2!6949 lt!230195)) lt!230848 lt!230846))))

(assert (=> d!48449 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!230848) (bvsle lt!230848 lt!230846))))

(assert (=> d!48449 (= (arrayBitRangesEqSymmetric!0 (buf!3479 thiss!1634) (buf!3479 (_2!6949 lt!230195)) lt!230848 lt!230846) lt!231694)))

(declare-fun bs!11818 () Bool)

(assert (= bs!11818 d!48449))

(assert (=> bs!11818 m!229715))

(declare-fun m!230745 () Bool)

(assert (=> bs!11818 m!230745))

(assert (=> b!148158 d!48449))

(declare-fun b!148570 () Bool)

(declare-fun res!124365 () Bool)

(declare-fun lt!231695 () (_ BitVec 32))

(assert (=> b!148570 (= res!124365 (= lt!231695 #b00000000000000000000000000000000))))

(declare-fun e!99120 () Bool)

(assert (=> b!148570 (=> res!124365 e!99120)))

(declare-fun e!99121 () Bool)

(assert (=> b!148570 (= e!99121 e!99120)))

(declare-fun b!148571 () Bool)

(declare-fun e!99117 () Bool)

(declare-fun call!2043 () Bool)

(assert (=> b!148571 (= e!99117 call!2043)))

(declare-fun b!148572 () Bool)

(assert (=> b!148572 (= e!99120 call!2043)))

(declare-fun b!148573 () Bool)

(declare-fun e!99116 () Bool)

(declare-fun e!99118 () Bool)

(assert (=> b!148573 (= e!99116 e!99118)))

(declare-fun res!124366 () Bool)

(assert (=> b!148573 (=> (not res!124366) (not e!99118))))

(declare-fun e!99119 () Bool)

(assert (=> b!148573 (= res!124366 e!99119)))

(declare-fun res!124367 () Bool)

(assert (=> b!148573 (=> res!124367 e!99119)))

(declare-fun lt!231697 () tuple4!144)

(assert (=> b!148573 (= res!124367 (bvsge (_1!6966 lt!231697) (_2!6966 lt!231697)))))

(assert (=> b!148573 (= lt!231695 ((_ extract 31 0) (bvsrem lt!230846 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!231696 () (_ BitVec 32))

(assert (=> b!148573 (= lt!231696 ((_ extract 31 0) (bvsrem lt!230848 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!148573 (= lt!231697 (arrayBitIndices!0 lt!230848 lt!230846))))

(declare-fun bm!2040 () Bool)

(declare-fun c!8035 () Bool)

(assert (=> bm!2040 (= call!2043 (byteRangesEq!0 (ite c!8035 (select (arr!3783 (buf!3479 (_2!6949 lt!230195))) (_3!363 lt!231697)) (select (arr!3783 (buf!3479 (_2!6949 lt!230195))) (_4!72 lt!231697))) (ite c!8035 (select (arr!3783 (buf!3479 thiss!1634)) (_3!363 lt!231697)) (select (arr!3783 (buf!3479 thiss!1634)) (_4!72 lt!231697))) (ite c!8035 lt!231696 #b00000000000000000000000000000000) lt!231695))))

(declare-fun b!148574 () Bool)

(assert (=> b!148574 (= e!99117 e!99121)))

(declare-fun res!124369 () Bool)

(assert (=> b!148574 (= res!124369 (byteRangesEq!0 (select (arr!3783 (buf!3479 (_2!6949 lt!230195))) (_3!363 lt!231697)) (select (arr!3783 (buf!3479 thiss!1634)) (_3!363 lt!231697)) lt!231696 #b00000000000000000000000000001000))))

(assert (=> b!148574 (=> (not res!124369) (not e!99121))))

(declare-fun d!48451 () Bool)

(declare-fun res!124368 () Bool)

(assert (=> d!48451 (=> res!124368 e!99116)))

(assert (=> d!48451 (= res!124368 (bvsge lt!230848 lt!230846))))

(assert (=> d!48451 (= (arrayBitRangesEq!0 (buf!3479 (_2!6949 lt!230195)) (buf!3479 thiss!1634) lt!230848 lt!230846) e!99116)))

(declare-fun b!148575 () Bool)

(assert (=> b!148575 (= e!99118 e!99117)))

(assert (=> b!148575 (= c!8035 (= (_3!363 lt!231697) (_4!72 lt!231697)))))

(declare-fun b!148576 () Bool)

(assert (=> b!148576 (= e!99119 (arrayRangesEq!330 (buf!3479 (_2!6949 lt!230195)) (buf!3479 thiss!1634) (_1!6966 lt!231697) (_2!6966 lt!231697)))))

(assert (= (and d!48451 (not res!124368)) b!148573))

(assert (= (and b!148573 (not res!124367)) b!148576))

(assert (= (and b!148573 res!124366) b!148575))

(assert (= (and b!148575 c!8035) b!148571))

(assert (= (and b!148575 (not c!8035)) b!148574))

(assert (= (and b!148574 res!124369) b!148570))

(assert (= (and b!148570 (not res!124365)) b!148572))

(assert (= (or b!148571 b!148572) bm!2040))

(declare-fun m!230747 () Bool)

(assert (=> b!148573 m!230747))

(declare-fun m!230749 () Bool)

(assert (=> bm!2040 m!230749))

(declare-fun m!230751 () Bool)

(assert (=> bm!2040 m!230751))

(declare-fun m!230753 () Bool)

(assert (=> bm!2040 m!230753))

(declare-fun m!230755 () Bool)

(assert (=> bm!2040 m!230755))

(declare-fun m!230757 () Bool)

(assert (=> bm!2040 m!230757))

(assert (=> b!148574 m!230749))

(assert (=> b!148574 m!230757))

(assert (=> b!148574 m!230749))

(assert (=> b!148574 m!230757))

(declare-fun m!230759 () Bool)

(assert (=> b!148574 m!230759))

(declare-fun m!230761 () Bool)

(assert (=> b!148576 m!230761))

(assert (=> b!148158 d!48451))

(assert (=> b!148183 d!48090))

(declare-fun d!48453 () Bool)

(assert (=> d!48453 (arrayBitRangesEq!0 (buf!3479 (_2!6949 lt!230188)) (buf!3479 thiss!1634) lt!230906 lt!230904)))

(declare-fun lt!231698 () Unit!9316)

(assert (=> d!48453 (= lt!231698 (choose!8 (buf!3479 thiss!1634) (buf!3479 (_2!6949 lt!230188)) lt!230906 lt!230904))))

(assert (=> d!48453 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!230906) (bvsle lt!230906 lt!230904))))

(assert (=> d!48453 (= (arrayBitRangesEqSymmetric!0 (buf!3479 thiss!1634) (buf!3479 (_2!6949 lt!230188)) lt!230906 lt!230904) lt!231698)))

(declare-fun bs!11819 () Bool)

(assert (= bs!11819 d!48453))

(assert (=> bs!11819 m!229777))

(declare-fun m!230763 () Bool)

(assert (=> bs!11819 m!230763))

(assert (=> b!148183 d!48453))

(declare-fun b!148577 () Bool)

(declare-fun res!124370 () Bool)

(declare-fun lt!231699 () (_ BitVec 32))

(assert (=> b!148577 (= res!124370 (= lt!231699 #b00000000000000000000000000000000))))

(declare-fun e!99126 () Bool)

(assert (=> b!148577 (=> res!124370 e!99126)))

(declare-fun e!99127 () Bool)

(assert (=> b!148577 (= e!99127 e!99126)))

(declare-fun b!148578 () Bool)

(declare-fun e!99123 () Bool)

(declare-fun call!2044 () Bool)

(assert (=> b!148578 (= e!99123 call!2044)))

(declare-fun b!148579 () Bool)

(assert (=> b!148579 (= e!99126 call!2044)))

(declare-fun b!148580 () Bool)

(declare-fun e!99122 () Bool)

(declare-fun e!99124 () Bool)

(assert (=> b!148580 (= e!99122 e!99124)))

(declare-fun res!124371 () Bool)

(assert (=> b!148580 (=> (not res!124371) (not e!99124))))

(declare-fun e!99125 () Bool)

(assert (=> b!148580 (= res!124371 e!99125)))

(declare-fun res!124372 () Bool)

(assert (=> b!148580 (=> res!124372 e!99125)))

(declare-fun lt!231701 () tuple4!144)

(assert (=> b!148580 (= res!124372 (bvsge (_1!6966 lt!231701) (_2!6966 lt!231701)))))

(assert (=> b!148580 (= lt!231699 ((_ extract 31 0) (bvsrem lt!230904 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!231700 () (_ BitVec 32))

(assert (=> b!148580 (= lt!231700 ((_ extract 31 0) (bvsrem lt!230906 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!148580 (= lt!231701 (arrayBitIndices!0 lt!230906 lt!230904))))

(declare-fun c!8036 () Bool)

(declare-fun bm!2041 () Bool)

(assert (=> bm!2041 (= call!2044 (byteRangesEq!0 (ite c!8036 (select (arr!3783 (buf!3479 (_2!6949 lt!230188))) (_3!363 lt!231701)) (select (arr!3783 (buf!3479 (_2!6949 lt!230188))) (_4!72 lt!231701))) (ite c!8036 (select (arr!3783 (buf!3479 thiss!1634)) (_3!363 lt!231701)) (select (arr!3783 (buf!3479 thiss!1634)) (_4!72 lt!231701))) (ite c!8036 lt!231700 #b00000000000000000000000000000000) lt!231699))))

(declare-fun b!148581 () Bool)

(assert (=> b!148581 (= e!99123 e!99127)))

(declare-fun res!124374 () Bool)

(assert (=> b!148581 (= res!124374 (byteRangesEq!0 (select (arr!3783 (buf!3479 (_2!6949 lt!230188))) (_3!363 lt!231701)) (select (arr!3783 (buf!3479 thiss!1634)) (_3!363 lt!231701)) lt!231700 #b00000000000000000000000000001000))))

(assert (=> b!148581 (=> (not res!124374) (not e!99127))))

(declare-fun d!48455 () Bool)

(declare-fun res!124373 () Bool)

(assert (=> d!48455 (=> res!124373 e!99122)))

(assert (=> d!48455 (= res!124373 (bvsge lt!230906 lt!230904))))

(assert (=> d!48455 (= (arrayBitRangesEq!0 (buf!3479 (_2!6949 lt!230188)) (buf!3479 thiss!1634) lt!230906 lt!230904) e!99122)))

(declare-fun b!148582 () Bool)

(assert (=> b!148582 (= e!99124 e!99123)))

(assert (=> b!148582 (= c!8036 (= (_3!363 lt!231701) (_4!72 lt!231701)))))

(declare-fun b!148583 () Bool)

(assert (=> b!148583 (= e!99125 (arrayRangesEq!330 (buf!3479 (_2!6949 lt!230188)) (buf!3479 thiss!1634) (_1!6966 lt!231701) (_2!6966 lt!231701)))))

(assert (= (and d!48455 (not res!124373)) b!148580))

(assert (= (and b!148580 (not res!124372)) b!148583))

(assert (= (and b!148580 res!124371) b!148582))

(assert (= (and b!148582 c!8036) b!148578))

(assert (= (and b!148582 (not c!8036)) b!148581))

(assert (= (and b!148581 res!124374) b!148577))

(assert (= (and b!148577 (not res!124370)) b!148579))

(assert (= (or b!148578 b!148579) bm!2041))

(declare-fun m!230765 () Bool)

(assert (=> b!148580 m!230765))

(declare-fun m!230767 () Bool)

(assert (=> bm!2041 m!230767))

(declare-fun m!230769 () Bool)

(assert (=> bm!2041 m!230769))

(declare-fun m!230771 () Bool)

(assert (=> bm!2041 m!230771))

(declare-fun m!230773 () Bool)

(assert (=> bm!2041 m!230773))

(declare-fun m!230775 () Bool)

(assert (=> bm!2041 m!230775))

(assert (=> b!148581 m!230767))

(assert (=> b!148581 m!230775))

(assert (=> b!148581 m!230767))

(assert (=> b!148581 m!230775))

(declare-fun m!230777 () Bool)

(assert (=> b!148581 m!230777))

(declare-fun m!230779 () Bool)

(assert (=> b!148583 m!230779))

(assert (=> b!148183 d!48455))

(declare-fun b!148584 () Bool)

(declare-fun res!124375 () Bool)

(declare-fun lt!231702 () (_ BitVec 32))

(assert (=> b!148584 (= res!124375 (= lt!231702 #b00000000000000000000000000000000))))

(declare-fun e!99132 () Bool)

(assert (=> b!148584 (=> res!124375 e!99132)))

(declare-fun e!99133 () Bool)

(assert (=> b!148584 (= e!99133 e!99132)))

(declare-fun b!148585 () Bool)

(declare-fun e!99129 () Bool)

(declare-fun call!2045 () Bool)

(assert (=> b!148585 (= e!99129 call!2045)))

(declare-fun b!148586 () Bool)

(assert (=> b!148586 (= e!99132 call!2045)))

(declare-fun b!148587 () Bool)

(declare-fun e!99128 () Bool)

(declare-fun e!99130 () Bool)

(assert (=> b!148587 (= e!99128 e!99130)))

(declare-fun res!124376 () Bool)

(assert (=> b!148587 (=> (not res!124376) (not e!99130))))

(declare-fun e!99131 () Bool)

(assert (=> b!148587 (= res!124376 e!99131)))

(declare-fun res!124377 () Bool)

(assert (=> b!148587 (=> res!124377 e!99131)))

(declare-fun lt!231704 () tuple4!144)

(assert (=> b!148587 (= res!124377 (bvsge (_1!6966 lt!231704) (_2!6966 lt!231704)))))

(assert (=> b!148587 (= lt!231702 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3014 (buf!3479 thiss!1634)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!231703 () (_ BitVec 32))

(assert (=> b!148587 (= lt!231703 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!148587 (= lt!231704 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3014 (buf!3479 thiss!1634)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634))))))

(declare-fun c!8037 () Bool)

(declare-fun bm!2042 () Bool)

(assert (=> bm!2042 (= call!2045 (byteRangesEq!0 (ite c!8037 (select (arr!3783 (buf!3479 thiss!1634)) (_3!363 lt!231704)) (select (arr!3783 (buf!3479 thiss!1634)) (_4!72 lt!231704))) (ite c!8037 (select (arr!3783 (buf!3479 (_2!6949 lt!230188))) (_3!363 lt!231704)) (select (arr!3783 (buf!3479 (_2!6949 lt!230188))) (_4!72 lt!231704))) (ite c!8037 lt!231703 #b00000000000000000000000000000000) lt!231702))))

(declare-fun b!148588 () Bool)

(assert (=> b!148588 (= e!99129 e!99133)))

(declare-fun res!124379 () Bool)

(assert (=> b!148588 (= res!124379 (byteRangesEq!0 (select (arr!3783 (buf!3479 thiss!1634)) (_3!363 lt!231704)) (select (arr!3783 (buf!3479 (_2!6949 lt!230188))) (_3!363 lt!231704)) lt!231703 #b00000000000000000000000000001000))))

(assert (=> b!148588 (=> (not res!124379) (not e!99133))))

(declare-fun d!48457 () Bool)

(declare-fun res!124378 () Bool)

(assert (=> d!48457 (=> res!124378 e!99128)))

(assert (=> d!48457 (= res!124378 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3014 (buf!3479 thiss!1634)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634))))))

(assert (=> d!48457 (= (arrayBitRangesEq!0 (buf!3479 thiss!1634) (buf!3479 (_2!6949 lt!230188)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3014 (buf!3479 thiss!1634)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634))) e!99128)))

(declare-fun b!148589 () Bool)

(assert (=> b!148589 (= e!99130 e!99129)))

(assert (=> b!148589 (= c!8037 (= (_3!363 lt!231704) (_4!72 lt!231704)))))

(declare-fun b!148590 () Bool)

(assert (=> b!148590 (= e!99131 (arrayRangesEq!330 (buf!3479 thiss!1634) (buf!3479 (_2!6949 lt!230188)) (_1!6966 lt!231704) (_2!6966 lt!231704)))))

(assert (= (and d!48457 (not res!124378)) b!148587))

(assert (= (and b!148587 (not res!124377)) b!148590))

(assert (= (and b!148587 res!124376) b!148589))

(assert (= (and b!148589 c!8037) b!148585))

(assert (= (and b!148589 (not c!8037)) b!148588))

(assert (= (and b!148588 res!124379) b!148584))

(assert (= (and b!148584 (not res!124375)) b!148586))

(assert (= (or b!148585 b!148586) bm!2042))

(assert (=> b!148587 m!229129))

(declare-fun m!230781 () Bool)

(assert (=> b!148587 m!230781))

(declare-fun m!230783 () Bool)

(assert (=> bm!2042 m!230783))

(declare-fun m!230785 () Bool)

(assert (=> bm!2042 m!230785))

(declare-fun m!230787 () Bool)

(assert (=> bm!2042 m!230787))

(declare-fun m!230789 () Bool)

(assert (=> bm!2042 m!230789))

(declare-fun m!230791 () Bool)

(assert (=> bm!2042 m!230791))

(assert (=> b!148588 m!230783))

(assert (=> b!148588 m!230791))

(assert (=> b!148588 m!230783))

(assert (=> b!148588 m!230791))

(declare-fun m!230793 () Bool)

(assert (=> b!148588 m!230793))

(declare-fun m!230795 () Bool)

(assert (=> b!148590 m!230795))

(assert (=> b!148165 d!48457))

(assert (=> b!148165 d!48090))

(assert (=> d!48100 d!48157))

(assert (=> d!48100 d!48417))

(declare-fun d!48459 () Bool)

(declare-fun res!124382 () Bool)

(declare-fun e!99135 () Bool)

(assert (=> d!48459 (=> (not res!124382) (not e!99135))))

(assert (=> d!48459 (= res!124382 (= (size!3014 (buf!3479 lt!230838)) (size!3014 (buf!3479 (_2!6949 lt!230195)))))))

(assert (=> d!48459 (= (isPrefixOf!0 lt!230838 (_2!6949 lt!230195)) e!99135)))

(declare-fun b!148591 () Bool)

(declare-fun res!124381 () Bool)

(assert (=> b!148591 (=> (not res!124381) (not e!99135))))

(assert (=> b!148591 (= res!124381 (bvsle (bitIndex!0 (size!3014 (buf!3479 lt!230838)) (currentByte!6387 lt!230838) (currentBit!6382 lt!230838)) (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230195))) (currentByte!6387 (_2!6949 lt!230195)) (currentBit!6382 (_2!6949 lt!230195)))))))

(declare-fun b!148592 () Bool)

(declare-fun e!99134 () Bool)

(assert (=> b!148592 (= e!99135 e!99134)))

(declare-fun res!124380 () Bool)

(assert (=> b!148592 (=> res!124380 e!99134)))

(assert (=> b!148592 (= res!124380 (= (size!3014 (buf!3479 lt!230838)) #b00000000000000000000000000000000))))

(declare-fun b!148593 () Bool)

(assert (=> b!148593 (= e!99134 (arrayBitRangesEq!0 (buf!3479 lt!230838) (buf!3479 (_2!6949 lt!230195)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3014 (buf!3479 lt!230838)) (currentByte!6387 lt!230838) (currentBit!6382 lt!230838))))))

(assert (= (and d!48459 res!124382) b!148591))

(assert (= (and b!148591 res!124381) b!148592))

(assert (= (and b!148592 (not res!124380)) b!148593))

(declare-fun m!230797 () Bool)

(assert (=> b!148591 m!230797))

(assert (=> b!148591 m!229127))

(assert (=> b!148593 m!230797))

(assert (=> b!148593 m!230797))

(declare-fun m!230799 () Bool)

(assert (=> b!148593 m!230799))

(assert (=> d!48100 d!48459))

(declare-fun d!48461 () Bool)

(assert (=> d!48461 (isPrefixOf!0 lt!230838 lt!230838)))

(declare-fun lt!231705 () Unit!9316)

(assert (=> d!48461 (= lt!231705 (choose!11 lt!230838))))

(assert (=> d!48461 (= (lemmaIsPrefixRefl!0 lt!230838) lt!231705)))

(declare-fun bs!11820 () Bool)

(assert (= bs!11820 d!48461))

(assert (=> bs!11820 m!229737))

(declare-fun m!230801 () Bool)

(assert (=> bs!11820 m!230801))

(assert (=> d!48100 d!48461))

(declare-fun d!48463 () Bool)

(assert (=> d!48463 (isPrefixOf!0 lt!230838 (_2!6949 lt!230195))))

(declare-fun lt!231706 () Unit!9316)

(assert (=> d!48463 (= lt!231706 (choose!30 lt!230838 (_2!6949 lt!230195) (_2!6949 lt!230195)))))

(assert (=> d!48463 (isPrefixOf!0 lt!230838 (_2!6949 lt!230195))))

(assert (=> d!48463 (= (lemmaIsPrefixTransitive!0 lt!230838 (_2!6949 lt!230195) (_2!6949 lt!230195)) lt!231706)))

(declare-fun bs!11821 () Bool)

(assert (= bs!11821 d!48463))

(assert (=> bs!11821 m!229739))

(declare-fun m!230803 () Bool)

(assert (=> bs!11821 m!230803))

(assert (=> bs!11821 m!229739))

(assert (=> d!48100 d!48463))

(assert (=> d!48100 d!48409))

(declare-fun d!48465 () Bool)

(declare-fun res!124385 () Bool)

(declare-fun e!99137 () Bool)

(assert (=> d!48465 (=> (not res!124385) (not e!99137))))

(assert (=> d!48465 (= res!124385 (= (size!3014 (buf!3479 (_1!6950 lt!230853))) (size!3014 (buf!3479 (_2!6950 lt!230853)))))))

(assert (=> d!48465 (= (isPrefixOf!0 (_1!6950 lt!230853) (_2!6950 lt!230853)) e!99137)))

(declare-fun b!148594 () Bool)

(declare-fun res!124384 () Bool)

(assert (=> b!148594 (=> (not res!124384) (not e!99137))))

(assert (=> b!148594 (= res!124384 (bvsle (bitIndex!0 (size!3014 (buf!3479 (_1!6950 lt!230853))) (currentByte!6387 (_1!6950 lt!230853)) (currentBit!6382 (_1!6950 lt!230853))) (bitIndex!0 (size!3014 (buf!3479 (_2!6950 lt!230853))) (currentByte!6387 (_2!6950 lt!230853)) (currentBit!6382 (_2!6950 lt!230853)))))))

(declare-fun b!148595 () Bool)

(declare-fun e!99136 () Bool)

(assert (=> b!148595 (= e!99137 e!99136)))

(declare-fun res!124383 () Bool)

(assert (=> b!148595 (=> res!124383 e!99136)))

(assert (=> b!148595 (= res!124383 (= (size!3014 (buf!3479 (_1!6950 lt!230853))) #b00000000000000000000000000000000))))

(declare-fun b!148596 () Bool)

(assert (=> b!148596 (= e!99136 (arrayBitRangesEq!0 (buf!3479 (_1!6950 lt!230853)) (buf!3479 (_2!6950 lt!230853)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3014 (buf!3479 (_1!6950 lt!230853))) (currentByte!6387 (_1!6950 lt!230853)) (currentBit!6382 (_1!6950 lt!230853)))))))

(assert (= (and d!48465 res!124385) b!148594))

(assert (= (and b!148594 res!124384) b!148595))

(assert (= (and b!148595 (not res!124383)) b!148596))

(declare-fun m!230805 () Bool)

(assert (=> b!148594 m!230805))

(assert (=> b!148594 m!230639))

(assert (=> b!148596 m!230805))

(assert (=> b!148596 m!230805))

(declare-fun m!230807 () Bool)

(assert (=> b!148596 m!230807))

(assert (=> d!48100 d!48465))

(declare-fun d!48467 () Bool)

(declare-fun res!124388 () Bool)

(declare-fun e!99139 () Bool)

(assert (=> d!48467 (=> (not res!124388) (not e!99139))))

(assert (=> d!48467 (= res!124388 (= (size!3014 (buf!3479 lt!230838)) (size!3014 (buf!3479 lt!230838))))))

(assert (=> d!48467 (= (isPrefixOf!0 lt!230838 lt!230838) e!99139)))

(declare-fun b!148597 () Bool)

(declare-fun res!124387 () Bool)

(assert (=> b!148597 (=> (not res!124387) (not e!99139))))

(assert (=> b!148597 (= res!124387 (bvsle (bitIndex!0 (size!3014 (buf!3479 lt!230838)) (currentByte!6387 lt!230838) (currentBit!6382 lt!230838)) (bitIndex!0 (size!3014 (buf!3479 lt!230838)) (currentByte!6387 lt!230838) (currentBit!6382 lt!230838))))))

(declare-fun b!148598 () Bool)

(declare-fun e!99138 () Bool)

(assert (=> b!148598 (= e!99139 e!99138)))

(declare-fun res!124386 () Bool)

(assert (=> b!148598 (=> res!124386 e!99138)))

(assert (=> b!148598 (= res!124386 (= (size!3014 (buf!3479 lt!230838)) #b00000000000000000000000000000000))))

(declare-fun b!148599 () Bool)

(assert (=> b!148599 (= e!99138 (arrayBitRangesEq!0 (buf!3479 lt!230838) (buf!3479 lt!230838) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3014 (buf!3479 lt!230838)) (currentByte!6387 lt!230838) (currentBit!6382 lt!230838))))))

(assert (= (and d!48467 res!124388) b!148597))

(assert (= (and b!148597 res!124387) b!148598))

(assert (= (and b!148598 (not res!124386)) b!148599))

(assert (=> b!148597 m!230797))

(assert (=> b!148597 m!230797))

(assert (=> b!148599 m!230797))

(assert (=> b!148599 m!230797))

(declare-fun m!230809 () Bool)

(assert (=> b!148599 m!230809))

(assert (=> d!48100 d!48467))

(declare-fun d!48469 () Bool)

(declare-fun res!124391 () Bool)

(declare-fun e!99141 () Bool)

(assert (=> d!48469 (=> (not res!124391) (not e!99141))))

(assert (=> d!48469 (= res!124391 (= (size!3014 (buf!3479 thiss!1634)) (size!3014 (buf!3479 thiss!1634))))))

(assert (=> d!48469 (= (isPrefixOf!0 thiss!1634 thiss!1634) e!99141)))

(declare-fun b!148600 () Bool)

(declare-fun res!124390 () Bool)

(assert (=> b!148600 (=> (not res!124390) (not e!99141))))

(assert (=> b!148600 (= res!124390 (bvsle (bitIndex!0 (size!3014 (buf!3479 thiss!1634)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634)) (bitIndex!0 (size!3014 (buf!3479 thiss!1634)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634))))))

(declare-fun b!148601 () Bool)

(declare-fun e!99140 () Bool)

(assert (=> b!148601 (= e!99141 e!99140)))

(declare-fun res!124389 () Bool)

(assert (=> b!148601 (=> res!124389 e!99140)))

(assert (=> b!148601 (= res!124389 (= (size!3014 (buf!3479 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!148602 () Bool)

(assert (=> b!148602 (= e!99140 (arrayBitRangesEq!0 (buf!3479 thiss!1634) (buf!3479 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3014 (buf!3479 thiss!1634)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634))))))

(assert (= (and d!48469 res!124391) b!148600))

(assert (= (and b!148600 res!124390) b!148601))

(assert (= (and b!148601 (not res!124389)) b!148602))

(assert (=> b!148600 m!229129))

(assert (=> b!148600 m!229129))

(assert (=> b!148602 m!229129))

(assert (=> b!148602 m!229129))

(declare-fun m!230811 () Bool)

(assert (=> b!148602 m!230811))

(assert (=> d!48100 d!48469))

(declare-fun d!48471 () Bool)

(assert (=> d!48471 (isPrefixOf!0 lt!230838 (_2!6949 lt!230195))))

(declare-fun lt!231707 () Unit!9316)

(assert (=> d!48471 (= lt!231707 (choose!30 lt!230838 thiss!1634 (_2!6949 lt!230195)))))

(assert (=> d!48471 (isPrefixOf!0 lt!230838 thiss!1634)))

(assert (=> d!48471 (= (lemmaIsPrefixTransitive!0 lt!230838 thiss!1634 (_2!6949 lt!230195)) lt!231707)))

(declare-fun bs!11822 () Bool)

(assert (= bs!11822 d!48471))

(assert (=> bs!11822 m!229739))

(declare-fun m!230813 () Bool)

(assert (=> bs!11822 m!230813))

(declare-fun m!230815 () Bool)

(assert (=> bs!11822 m!230815))

(assert (=> d!48100 d!48471))

(declare-fun d!48473 () Bool)

(assert (=> d!48473 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-fun lt!231708 () Unit!9316)

(assert (=> d!48473 (= lt!231708 (choose!11 thiss!1634))))

(assert (=> d!48473 (= (lemmaIsPrefixRefl!0 thiss!1634) lt!231708)))

(declare-fun bs!11823 () Bool)

(assert (= bs!11823 d!48473))

(assert (=> bs!11823 m!229727))

(declare-fun m!230817 () Bool)

(assert (=> bs!11823 m!230817))

(assert (=> d!48100 d!48473))

(declare-fun d!48475 () Bool)

(assert (=> d!48475 (= (remainingBits!0 ((_ sign_extend 32) (size!3014 (buf!3479 (_1!6951 lt!230200)))) ((_ sign_extend 32) (currentByte!6387 (_1!6951 lt!230200))) ((_ sign_extend 32) (currentBit!6382 (_1!6951 lt!230200)))) (bvsub (bvmul ((_ sign_extend 32) (size!3014 (buf!3479 (_1!6951 lt!230200)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6387 (_1!6951 lt!230200))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6382 (_1!6951 lt!230200))))))))

(assert (=> d!48110 d!48475))

(declare-fun d!48477 () Bool)

(assert (=> d!48477 (= (invariant!0 (currentBit!6382 (_1!6951 lt!230200)) (currentByte!6387 (_1!6951 lt!230200)) (size!3014 (buf!3479 (_1!6951 lt!230200)))) (and (bvsge (currentBit!6382 (_1!6951 lt!230200)) #b00000000000000000000000000000000) (bvslt (currentBit!6382 (_1!6951 lt!230200)) #b00000000000000000000000000001000) (bvsge (currentByte!6387 (_1!6951 lt!230200)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6387 (_1!6951 lt!230200)) (size!3014 (buf!3479 (_1!6951 lt!230200)))) (and (= (currentBit!6382 (_1!6951 lt!230200)) #b00000000000000000000000000000000) (= (currentByte!6387 (_1!6951 lt!230200)) (size!3014 (buf!3479 (_1!6951 lt!230200))))))))))

(assert (=> d!48110 d!48477))

(assert (=> b!148163 d!48090))

(assert (=> b!148163 d!48086))

(declare-fun d!48479 () Bool)

(declare-fun lt!231714 () (_ BitVec 8))

(declare-fun lt!231710 () (_ BitVec 8))

(assert (=> d!48479 (= lt!231714 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3783 (buf!3479 lt!230181)) (currentByte!6387 lt!230181))) ((_ sign_extend 24) lt!231710))))))

(assert (=> d!48479 (= lt!231710 ((_ extract 7 0) (currentBit!6382 lt!230181)))))

(declare-fun e!99143 () Bool)

(assert (=> d!48479 e!99143))

(declare-fun res!124393 () Bool)

(assert (=> d!48479 (=> (not res!124393) (not e!99143))))

(assert (=> d!48479 (= res!124393 (validate_offset_bits!1 ((_ sign_extend 32) (size!3014 (buf!3479 lt!230181))) ((_ sign_extend 32) (currentByte!6387 lt!230181)) ((_ sign_extend 32) (currentBit!6382 lt!230181)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!9402 () Unit!9316)

(declare-fun Unit!9403 () Unit!9316)

(assert (=> d!48479 (= (readByte!0 lt!230181) (tuple2!13201 (_2!6965 (ite (bvsgt ((_ sign_extend 24) lt!231710) #b00000000000000000000000000000000) (tuple2!13205 Unit!9402 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!231714) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3783 (buf!3479 lt!230181)) (bvadd (currentByte!6387 lt!230181) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!231710)))))))) (tuple2!13205 Unit!9403 lt!231714))) (BitStream!5287 (buf!3479 lt!230181) (bvadd (currentByte!6387 lt!230181) #b00000000000000000000000000000001) (currentBit!6382 lt!230181))))))

(declare-fun b!148603 () Bool)

(declare-fun e!99142 () Bool)

(assert (=> b!148603 (= e!99143 e!99142)))

(declare-fun res!124392 () Bool)

(assert (=> b!148603 (=> (not res!124392) (not e!99142))))

(declare-fun lt!231713 () tuple2!13200)

(assert (=> b!148603 (= res!124392 (= (buf!3479 (_2!6961 lt!231713)) (buf!3479 lt!230181)))))

(declare-fun lt!231709 () (_ BitVec 8))

(declare-fun lt!231715 () (_ BitVec 8))

(declare-fun Unit!9404 () Unit!9316)

(declare-fun Unit!9405 () Unit!9316)

(assert (=> b!148603 (= lt!231713 (tuple2!13201 (_2!6965 (ite (bvsgt ((_ sign_extend 24) lt!231715) #b00000000000000000000000000000000) (tuple2!13205 Unit!9404 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!231709) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3783 (buf!3479 lt!230181)) (bvadd (currentByte!6387 lt!230181) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!231715)))))))) (tuple2!13205 Unit!9405 lt!231709))) (BitStream!5287 (buf!3479 lt!230181) (bvadd (currentByte!6387 lt!230181) #b00000000000000000000000000000001) (currentBit!6382 lt!230181))))))

(assert (=> b!148603 (= lt!231709 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3783 (buf!3479 lt!230181)) (currentByte!6387 lt!230181))) ((_ sign_extend 24) lt!231715))))))

(assert (=> b!148603 (= lt!231715 ((_ extract 7 0) (currentBit!6382 lt!230181)))))

(declare-fun b!148604 () Bool)

(declare-fun lt!231712 () (_ BitVec 64))

(declare-fun lt!231711 () (_ BitVec 64))

(assert (=> b!148604 (= e!99142 (= (bitIndex!0 (size!3014 (buf!3479 (_2!6961 lt!231713))) (currentByte!6387 (_2!6961 lt!231713)) (currentBit!6382 (_2!6961 lt!231713))) (bvadd lt!231711 lt!231712)))))

(assert (=> b!148604 (or (not (= (bvand lt!231711 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!231712 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!231711 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!231711 lt!231712) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!148604 (= lt!231712 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!148604 (= lt!231711 (bitIndex!0 (size!3014 (buf!3479 lt!230181)) (currentByte!6387 lt!230181) (currentBit!6382 lt!230181)))))

(assert (= (and d!48479 res!124393) b!148603))

(assert (= (and b!148603 res!124392) b!148604))

(declare-fun m!230819 () Bool)

(assert (=> d!48479 m!230819))

(declare-fun m!230821 () Bool)

(assert (=> d!48479 m!230821))

(declare-fun m!230823 () Bool)

(assert (=> d!48479 m!230823))

(assert (=> b!148603 m!230823))

(assert (=> b!148603 m!230819))

(declare-fun m!230825 () Bool)

(assert (=> b!148604 m!230825))

(declare-fun m!230827 () Bool)

(assert (=> b!148604 m!230827))

(assert (=> d!48147 d!48479))

(declare-fun d!48481 () Bool)

(declare-fun res!124396 () Bool)

(declare-fun e!99145 () Bool)

(assert (=> d!48481 (=> (not res!124396) (not e!99145))))

(assert (=> d!48481 (= res!124396 (= (size!3014 (buf!3479 (_2!6950 lt!230931))) (size!3014 (buf!3479 (_2!6949 lt!230188)))))))

(assert (=> d!48481 (= (isPrefixOf!0 (_2!6950 lt!230931) (_2!6949 lt!230188)) e!99145)))

(declare-fun b!148605 () Bool)

(declare-fun res!124395 () Bool)

(assert (=> b!148605 (=> (not res!124395) (not e!99145))))

(assert (=> b!148605 (= res!124395 (bvsle (bitIndex!0 (size!3014 (buf!3479 (_2!6950 lt!230931))) (currentByte!6387 (_2!6950 lt!230931)) (currentBit!6382 (_2!6950 lt!230931))) (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230188))) (currentByte!6387 (_2!6949 lt!230188)) (currentBit!6382 (_2!6949 lt!230188)))))))

(declare-fun b!148606 () Bool)

(declare-fun e!99144 () Bool)

(assert (=> b!148606 (= e!99145 e!99144)))

(declare-fun res!124394 () Bool)

(assert (=> b!148606 (=> res!124394 e!99144)))

(assert (=> b!148606 (= res!124394 (= (size!3014 (buf!3479 (_2!6950 lt!230931))) #b00000000000000000000000000000000))))

(declare-fun b!148607 () Bool)

(assert (=> b!148607 (= e!99144 (arrayBitRangesEq!0 (buf!3479 (_2!6950 lt!230931)) (buf!3479 (_2!6949 lt!230188)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3014 (buf!3479 (_2!6950 lt!230931))) (currentByte!6387 (_2!6950 lt!230931)) (currentBit!6382 (_2!6950 lt!230931)))))))

(assert (= (and d!48481 res!124396) b!148605))

(assert (= (and b!148605 res!124395) b!148606))

(assert (= (and b!148606 (not res!124394)) b!148607))

(assert (=> b!148605 m!230567))

(assert (=> b!148605 m!229189))

(assert (=> b!148607 m!230567))

(assert (=> b!148607 m!230567))

(declare-fun m!230829 () Bool)

(assert (=> b!148607 m!230829))

(assert (=> b!148192 d!48481))

(assert (=> d!48143 d!48104))

(declare-fun d!48483 () Bool)

(assert (=> d!48483 (isPrefixOf!0 thiss!1634 (_2!6949 lt!230188))))

(assert (=> d!48483 true))

(declare-fun _$15!243 () Unit!9316)

(assert (=> d!48483 (= (choose!30 thiss!1634 (_2!6949 lt!230195) (_2!6949 lt!230188)) _$15!243)))

(declare-fun bs!11824 () Bool)

(assert (= bs!11824 d!48483))

(assert (=> bs!11824 m!229167))

(assert (=> d!48143 d!48483))

(assert (=> d!48143 d!48157))

(declare-fun d!48485 () Bool)

(declare-fun res!124397 () Bool)

(declare-fun e!99146 () Bool)

(assert (=> d!48485 (=> res!124397 e!99146)))

(assert (=> d!48485 (= res!124397 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!48485 (= (arrayRangesEq!330 arr!237 (_2!6952 lt!230182) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!99146)))

(declare-fun b!148608 () Bool)

(declare-fun e!99147 () Bool)

(assert (=> b!148608 (= e!99146 e!99147)))

(declare-fun res!124398 () Bool)

(assert (=> b!148608 (=> (not res!124398) (not e!99147))))

(assert (=> b!148608 (= res!124398 (= (select (arr!3783 arr!237) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3783 (_2!6952 lt!230182)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!148609 () Bool)

(assert (=> b!148609 (= e!99147 (arrayRangesEq!330 arr!237 (_2!6952 lt!230182) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48485 (not res!124397)) b!148608))

(assert (= (and b!148608 res!124398) b!148609))

(declare-fun m!230831 () Bool)

(assert (=> b!148608 m!230831))

(declare-fun m!230833 () Bool)

(assert (=> b!148608 m!230833))

(declare-fun m!230835 () Bool)

(assert (=> b!148609 m!230835))

(assert (=> b!148147 d!48485))

(declare-fun d!48487 () Bool)

(declare-fun lt!231716 () tuple3!580)

(assert (=> d!48487 (= lt!231716 (readByteArrayLoop!0 (_1!6950 lt!230887) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!48487 (= (readByteArrayLoopPure!0 (_1!6950 lt!230887) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13187 (_2!6962 lt!231716) (_3!361 lt!231716)))))

(declare-fun bs!11825 () Bool)

(assert (= bs!11825 d!48487))

(declare-fun m!230837 () Bool)

(assert (=> bs!11825 m!230837))

(assert (=> b!148181 d!48487))

(declare-fun d!48489 () Bool)

(assert (=> d!48489 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230889)))) ((_ sign_extend 32) (currentByte!6387 (_2!6949 lt!230195))) ((_ sign_extend 32) (currentBit!6382 (_2!6949 lt!230195))) lt!230886) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230889)))) ((_ sign_extend 32) (currentByte!6387 (_2!6949 lt!230195))) ((_ sign_extend 32) (currentBit!6382 (_2!6949 lt!230195)))) lt!230886))))

(declare-fun bs!11826 () Bool)

(assert (= bs!11826 d!48489))

(declare-fun m!230839 () Bool)

(assert (=> bs!11826 m!230839))

(assert (=> b!148181 d!48489))

(declare-fun d!48491 () Bool)

(assert (=> d!48491 (validate_offset_bits!1 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230889)))) ((_ sign_extend 32) (currentByte!6387 (_2!6949 lt!230195))) ((_ sign_extend 32) (currentBit!6382 (_2!6949 lt!230195))) lt!230886)))

(declare-fun lt!231717 () Unit!9316)

(assert (=> d!48491 (= lt!231717 (choose!9 (_2!6949 lt!230195) (buf!3479 (_2!6949 lt!230889)) lt!230886 (BitStream!5287 (buf!3479 (_2!6949 lt!230889)) (currentByte!6387 (_2!6949 lt!230195)) (currentBit!6382 (_2!6949 lt!230195)))))))

(assert (=> d!48491 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6949 lt!230195) (buf!3479 (_2!6949 lt!230889)) lt!230886) lt!231717)))

(declare-fun bs!11827 () Bool)

(assert (= bs!11827 d!48491))

(assert (=> bs!11827 m!229759))

(declare-fun m!230841 () Bool)

(assert (=> bs!11827 m!230841))

(assert (=> b!148181 d!48491))

(declare-fun b!148610 () Bool)

(declare-fun e!99148 () Unit!9316)

(declare-fun lt!231733 () Unit!9316)

(assert (=> b!148610 (= e!99148 lt!231733)))

(declare-fun lt!231729 () (_ BitVec 64))

(assert (=> b!148610 (= lt!231729 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!231727 () (_ BitVec 64))

(assert (=> b!148610 (= lt!231727 (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230195))) (currentByte!6387 (_2!6949 lt!230195)) (currentBit!6382 (_2!6949 lt!230195))))))

(assert (=> b!148610 (= lt!231733 (arrayBitRangesEqSymmetric!0 (buf!3479 (_2!6949 lt!230195)) (buf!3479 (_2!6949 lt!230889)) lt!231729 lt!231727))))

(assert (=> b!148610 (arrayBitRangesEq!0 (buf!3479 (_2!6949 lt!230889)) (buf!3479 (_2!6949 lt!230195)) lt!231729 lt!231727)))

(declare-fun b!148611 () Bool)

(declare-fun res!124399 () Bool)

(declare-fun e!99149 () Bool)

(assert (=> b!148611 (=> (not res!124399) (not e!99149))))

(declare-fun lt!231734 () tuple2!13182)

(assert (=> b!148611 (= res!124399 (isPrefixOf!0 (_1!6950 lt!231734) (_2!6949 lt!230195)))))

(declare-fun b!148612 () Bool)

(declare-fun Unit!9406 () Unit!9316)

(assert (=> b!148612 (= e!99148 Unit!9406)))

(declare-fun lt!231728 () (_ BitVec 64))

(declare-fun b!148613 () Bool)

(declare-fun lt!231736 () (_ BitVec 64))

(assert (=> b!148613 (= e!99149 (= (_1!6950 lt!231734) (withMovedBitIndex!0 (_2!6950 lt!231734) (bvsub lt!231728 lt!231736))))))

(assert (=> b!148613 (or (= (bvand lt!231728 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!231736 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!231728 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!231728 lt!231736) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!148613 (= lt!231736 (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230889))) (currentByte!6387 (_2!6949 lt!230889)) (currentBit!6382 (_2!6949 lt!230889))))))

(assert (=> b!148613 (= lt!231728 (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230195))) (currentByte!6387 (_2!6949 lt!230195)) (currentBit!6382 (_2!6949 lt!230195))))))

(declare-fun d!48493 () Bool)

(assert (=> d!48493 e!99149))

(declare-fun res!124401 () Bool)

(assert (=> d!48493 (=> (not res!124401) (not e!99149))))

(assert (=> d!48493 (= res!124401 (isPrefixOf!0 (_1!6950 lt!231734) (_2!6950 lt!231734)))))

(declare-fun lt!231719 () BitStream!5286)

(assert (=> d!48493 (= lt!231734 (tuple2!13183 lt!231719 (_2!6949 lt!230889)))))

(declare-fun lt!231730 () Unit!9316)

(declare-fun lt!231726 () Unit!9316)

(assert (=> d!48493 (= lt!231730 lt!231726)))

(assert (=> d!48493 (isPrefixOf!0 lt!231719 (_2!6949 lt!230889))))

(assert (=> d!48493 (= lt!231726 (lemmaIsPrefixTransitive!0 lt!231719 (_2!6949 lt!230889) (_2!6949 lt!230889)))))

(declare-fun lt!231722 () Unit!9316)

(declare-fun lt!231718 () Unit!9316)

(assert (=> d!48493 (= lt!231722 lt!231718)))

(assert (=> d!48493 (isPrefixOf!0 lt!231719 (_2!6949 lt!230889))))

(assert (=> d!48493 (= lt!231718 (lemmaIsPrefixTransitive!0 lt!231719 (_2!6949 lt!230195) (_2!6949 lt!230889)))))

(declare-fun lt!231732 () Unit!9316)

(assert (=> d!48493 (= lt!231732 e!99148)))

(declare-fun c!8038 () Bool)

(assert (=> d!48493 (= c!8038 (not (= (size!3014 (buf!3479 (_2!6949 lt!230195))) #b00000000000000000000000000000000)))))

(declare-fun lt!231737 () Unit!9316)

(declare-fun lt!231735 () Unit!9316)

(assert (=> d!48493 (= lt!231737 lt!231735)))

(assert (=> d!48493 (isPrefixOf!0 (_2!6949 lt!230889) (_2!6949 lt!230889))))

(assert (=> d!48493 (= lt!231735 (lemmaIsPrefixRefl!0 (_2!6949 lt!230889)))))

(declare-fun lt!231731 () Unit!9316)

(declare-fun lt!231720 () Unit!9316)

(assert (=> d!48493 (= lt!231731 lt!231720)))

(assert (=> d!48493 (= lt!231720 (lemmaIsPrefixRefl!0 (_2!6949 lt!230889)))))

(declare-fun lt!231723 () Unit!9316)

(declare-fun lt!231725 () Unit!9316)

(assert (=> d!48493 (= lt!231723 lt!231725)))

(assert (=> d!48493 (isPrefixOf!0 lt!231719 lt!231719)))

(assert (=> d!48493 (= lt!231725 (lemmaIsPrefixRefl!0 lt!231719))))

(declare-fun lt!231724 () Unit!9316)

(declare-fun lt!231721 () Unit!9316)

(assert (=> d!48493 (= lt!231724 lt!231721)))

(assert (=> d!48493 (isPrefixOf!0 (_2!6949 lt!230195) (_2!6949 lt!230195))))

(assert (=> d!48493 (= lt!231721 (lemmaIsPrefixRefl!0 (_2!6949 lt!230195)))))

(assert (=> d!48493 (= lt!231719 (BitStream!5287 (buf!3479 (_2!6949 lt!230889)) (currentByte!6387 (_2!6949 lt!230195)) (currentBit!6382 (_2!6949 lt!230195))))))

(assert (=> d!48493 (isPrefixOf!0 (_2!6949 lt!230195) (_2!6949 lt!230889))))

(assert (=> d!48493 (= (reader!0 (_2!6949 lt!230195) (_2!6949 lt!230889)) lt!231734)))

(declare-fun b!148614 () Bool)

(declare-fun res!124400 () Bool)

(assert (=> b!148614 (=> (not res!124400) (not e!99149))))

(assert (=> b!148614 (= res!124400 (isPrefixOf!0 (_2!6950 lt!231734) (_2!6949 lt!230889)))))

(assert (= (and d!48493 c!8038) b!148610))

(assert (= (and d!48493 (not c!8038)) b!148612))

(assert (= (and d!48493 res!124401) b!148611))

(assert (= (and b!148611 res!124399) b!148614))

(assert (= (and b!148614 res!124400) b!148613))

(declare-fun m!230843 () Bool)

(assert (=> b!148611 m!230843))

(assert (=> b!148610 m!229127))

(declare-fun m!230845 () Bool)

(assert (=> b!148610 m!230845))

(declare-fun m!230847 () Bool)

(assert (=> b!148610 m!230847))

(declare-fun m!230849 () Bool)

(assert (=> b!148614 m!230849))

(declare-fun m!230851 () Bool)

(assert (=> b!148613 m!230851))

(assert (=> b!148613 m!229767))

(assert (=> b!148613 m!229127))

(declare-fun m!230853 () Bool)

(assert (=> d!48493 m!230853))

(assert (=> d!48493 m!229721))

(declare-fun m!230855 () Bool)

(assert (=> d!48493 m!230855))

(assert (=> d!48493 m!229733))

(declare-fun m!230857 () Bool)

(assert (=> d!48493 m!230857))

(declare-fun m!230859 () Bool)

(assert (=> d!48493 m!230859))

(declare-fun m!230861 () Bool)

(assert (=> d!48493 m!230861))

(assert (=> d!48493 m!229769))

(declare-fun m!230863 () Bool)

(assert (=> d!48493 m!230863))

(declare-fun m!230865 () Bool)

(assert (=> d!48493 m!230865))

(declare-fun m!230867 () Bool)

(assert (=> d!48493 m!230867))

(assert (=> b!148181 d!48493))

(declare-fun d!48495 () Bool)

(declare-fun res!124404 () Bool)

(declare-fun e!99151 () Bool)

(assert (=> d!48495 (=> (not res!124404) (not e!99151))))

(assert (=> d!48495 (= res!124404 (= (size!3014 (buf!3479 lt!230896)) (size!3014 (buf!3479 (_2!6949 lt!230188)))))))

(assert (=> d!48495 (= (isPrefixOf!0 lt!230896 (_2!6949 lt!230188)) e!99151)))

(declare-fun b!148615 () Bool)

(declare-fun res!124403 () Bool)

(assert (=> b!148615 (=> (not res!124403) (not e!99151))))

(assert (=> b!148615 (= res!124403 (bvsle (bitIndex!0 (size!3014 (buf!3479 lt!230896)) (currentByte!6387 lt!230896) (currentBit!6382 lt!230896)) (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230188))) (currentByte!6387 (_2!6949 lt!230188)) (currentBit!6382 (_2!6949 lt!230188)))))))

(declare-fun b!148616 () Bool)

(declare-fun e!99150 () Bool)

(assert (=> b!148616 (= e!99151 e!99150)))

(declare-fun res!124402 () Bool)

(assert (=> b!148616 (=> res!124402 e!99150)))

(assert (=> b!148616 (= res!124402 (= (size!3014 (buf!3479 lt!230896)) #b00000000000000000000000000000000))))

(declare-fun b!148617 () Bool)

(assert (=> b!148617 (= e!99150 (arrayBitRangesEq!0 (buf!3479 lt!230896) (buf!3479 (_2!6949 lt!230188)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3014 (buf!3479 lt!230896)) (currentByte!6387 lt!230896) (currentBit!6382 lt!230896))))))

(assert (= (and d!48495 res!124404) b!148615))

(assert (= (and b!148615 res!124403) b!148616))

(assert (= (and b!148616 (not res!124402)) b!148617))

(declare-fun m!230869 () Bool)

(assert (=> b!148615 m!230869))

(assert (=> b!148615 m!229189))

(assert (=> b!148617 m!230869))

(assert (=> b!148617 m!230869))

(declare-fun m!230871 () Bool)

(assert (=> b!148617 m!230871))

(assert (=> d!48118 d!48495))

(declare-fun d!48497 () Bool)

(declare-fun res!124407 () Bool)

(declare-fun e!99153 () Bool)

(assert (=> d!48497 (=> (not res!124407) (not e!99153))))

(assert (=> d!48497 (= res!124407 (= (size!3014 (buf!3479 lt!230896)) (size!3014 (buf!3479 lt!230896))))))

(assert (=> d!48497 (= (isPrefixOf!0 lt!230896 lt!230896) e!99153)))

(declare-fun b!148618 () Bool)

(declare-fun res!124406 () Bool)

(assert (=> b!148618 (=> (not res!124406) (not e!99153))))

(assert (=> b!148618 (= res!124406 (bvsle (bitIndex!0 (size!3014 (buf!3479 lt!230896)) (currentByte!6387 lt!230896) (currentBit!6382 lt!230896)) (bitIndex!0 (size!3014 (buf!3479 lt!230896)) (currentByte!6387 lt!230896) (currentBit!6382 lt!230896))))))

(declare-fun b!148619 () Bool)

(declare-fun e!99152 () Bool)

(assert (=> b!148619 (= e!99153 e!99152)))

(declare-fun res!124405 () Bool)

(assert (=> b!148619 (=> res!124405 e!99152)))

(assert (=> b!148619 (= res!124405 (= (size!3014 (buf!3479 lt!230896)) #b00000000000000000000000000000000))))

(declare-fun b!148620 () Bool)

(assert (=> b!148620 (= e!99152 (arrayBitRangesEq!0 (buf!3479 lt!230896) (buf!3479 lt!230896) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3014 (buf!3479 lt!230896)) (currentByte!6387 lt!230896) (currentBit!6382 lt!230896))))))

(assert (= (and d!48497 res!124407) b!148618))

(assert (= (and b!148618 res!124406) b!148619))

(assert (= (and b!148619 (not res!124405)) b!148620))

(assert (=> b!148618 m!230869))

(assert (=> b!148618 m!230869))

(assert (=> b!148620 m!230869))

(assert (=> b!148620 m!230869))

(declare-fun m!230873 () Bool)

(assert (=> b!148620 m!230873))

(assert (=> d!48118 d!48497))

(assert (=> d!48118 d!48104))

(declare-fun d!48499 () Bool)

(declare-fun res!124410 () Bool)

(declare-fun e!99155 () Bool)

(assert (=> d!48499 (=> (not res!124410) (not e!99155))))

(assert (=> d!48499 (= res!124410 (= (size!3014 (buf!3479 (_1!6950 lt!230911))) (size!3014 (buf!3479 (_2!6950 lt!230911)))))))

(assert (=> d!48499 (= (isPrefixOf!0 (_1!6950 lt!230911) (_2!6950 lt!230911)) e!99155)))

(declare-fun b!148621 () Bool)

(declare-fun res!124409 () Bool)

(assert (=> b!148621 (=> (not res!124409) (not e!99155))))

(assert (=> b!148621 (= res!124409 (bvsle (bitIndex!0 (size!3014 (buf!3479 (_1!6950 lt!230911))) (currentByte!6387 (_1!6950 lt!230911)) (currentBit!6382 (_1!6950 lt!230911))) (bitIndex!0 (size!3014 (buf!3479 (_2!6950 lt!230911))) (currentByte!6387 (_2!6950 lt!230911)) (currentBit!6382 (_2!6950 lt!230911)))))))

(declare-fun b!148622 () Bool)

(declare-fun e!99154 () Bool)

(assert (=> b!148622 (= e!99155 e!99154)))

(declare-fun res!124408 () Bool)

(assert (=> b!148622 (=> res!124408 e!99154)))

(assert (=> b!148622 (= res!124408 (= (size!3014 (buf!3479 (_1!6950 lt!230911))) #b00000000000000000000000000000000))))

(declare-fun b!148623 () Bool)

(assert (=> b!148623 (= e!99154 (arrayBitRangesEq!0 (buf!3479 (_1!6950 lt!230911)) (buf!3479 (_2!6950 lt!230911)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3014 (buf!3479 (_1!6950 lt!230911))) (currentByte!6387 (_1!6950 lt!230911)) (currentBit!6382 (_1!6950 lt!230911)))))))

(assert (= (and d!48499 res!124410) b!148621))

(assert (= (and b!148621 res!124409) b!148622))

(assert (= (and b!148622 (not res!124408)) b!148623))

(assert (=> b!148621 m!230515))

(assert (=> b!148621 m!230509))

(assert (=> b!148623 m!230515))

(assert (=> b!148623 m!230515))

(declare-fun m!230875 () Bool)

(assert (=> b!148623 m!230875))

(assert (=> d!48118 d!48499))

(declare-fun d!48501 () Bool)

(assert (=> d!48501 (isPrefixOf!0 lt!230896 (_2!6949 lt!230188))))

(declare-fun lt!231738 () Unit!9316)

(assert (=> d!48501 (= lt!231738 (choose!30 lt!230896 (_2!6949 lt!230188) (_2!6949 lt!230188)))))

(assert (=> d!48501 (isPrefixOf!0 lt!230896 (_2!6949 lt!230188))))

(assert (=> d!48501 (= (lemmaIsPrefixTransitive!0 lt!230896 (_2!6949 lt!230188) (_2!6949 lt!230188)) lt!231738)))

(declare-fun bs!11828 () Bool)

(assert (= bs!11828 d!48501))

(assert (=> bs!11828 m!229797))

(declare-fun m!230877 () Bool)

(assert (=> bs!11828 m!230877))

(assert (=> bs!11828 m!229797))

(assert (=> d!48118 d!48501))

(declare-fun d!48503 () Bool)

(assert (=> d!48503 (isPrefixOf!0 lt!230896 (_2!6949 lt!230188))))

(declare-fun lt!231739 () Unit!9316)

(assert (=> d!48503 (= lt!231739 (choose!30 lt!230896 thiss!1634 (_2!6949 lt!230188)))))

(assert (=> d!48503 (isPrefixOf!0 lt!230896 thiss!1634)))

(assert (=> d!48503 (= (lemmaIsPrefixTransitive!0 lt!230896 thiss!1634 (_2!6949 lt!230188)) lt!231739)))

(declare-fun bs!11829 () Bool)

(assert (= bs!11829 d!48503))

(assert (=> bs!11829 m!229797))

(declare-fun m!230879 () Bool)

(assert (=> bs!11829 m!230879))

(declare-fun m!230881 () Bool)

(assert (=> bs!11829 m!230881))

(assert (=> d!48118 d!48503))

(assert (=> d!48118 d!48415))

(assert (=> d!48118 d!48469))

(assert (=> d!48118 d!48423))

(declare-fun d!48505 () Bool)

(assert (=> d!48505 (isPrefixOf!0 lt!230896 lt!230896)))

(declare-fun lt!231740 () Unit!9316)

(assert (=> d!48505 (= lt!231740 (choose!11 lt!230896))))

(assert (=> d!48505 (= (lemmaIsPrefixRefl!0 lt!230896) lt!231740)))

(declare-fun bs!11830 () Bool)

(assert (= bs!11830 d!48505))

(assert (=> bs!11830 m!229795))

(declare-fun m!230883 () Bool)

(assert (=> bs!11830 m!230883))

(assert (=> d!48118 d!48505))

(assert (=> d!48118 d!48473))

(assert (=> b!148188 d!48088))

(declare-fun d!48507 () Bool)

(assert (=> d!48507 (arrayBitRangesEq!0 (buf!3479 (_2!6949 lt!230188)) (buf!3479 (_2!6949 lt!230195)) lt!230926 lt!230924)))

(declare-fun lt!231741 () Unit!9316)

(assert (=> d!48507 (= lt!231741 (choose!8 (buf!3479 (_2!6949 lt!230195)) (buf!3479 (_2!6949 lt!230188)) lt!230926 lt!230924))))

(assert (=> d!48507 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!230926) (bvsle lt!230926 lt!230924))))

(assert (=> d!48507 (= (arrayBitRangesEqSymmetric!0 (buf!3479 (_2!6949 lt!230195)) (buf!3479 (_2!6949 lt!230188)) lt!230926 lt!230924) lt!231741)))

(declare-fun bs!11831 () Bool)

(assert (= bs!11831 d!48507))

(assert (=> bs!11831 m!229803))

(declare-fun m!230885 () Bool)

(assert (=> bs!11831 m!230885))

(assert (=> b!148188 d!48507))

(declare-fun b!148624 () Bool)

(declare-fun res!124411 () Bool)

(declare-fun lt!231742 () (_ BitVec 32))

(assert (=> b!148624 (= res!124411 (= lt!231742 #b00000000000000000000000000000000))))

(declare-fun e!99160 () Bool)

(assert (=> b!148624 (=> res!124411 e!99160)))

(declare-fun e!99161 () Bool)

(assert (=> b!148624 (= e!99161 e!99160)))

(declare-fun b!148625 () Bool)

(declare-fun e!99157 () Bool)

(declare-fun call!2046 () Bool)

(assert (=> b!148625 (= e!99157 call!2046)))

(declare-fun b!148626 () Bool)

(assert (=> b!148626 (= e!99160 call!2046)))

(declare-fun b!148627 () Bool)

(declare-fun e!99156 () Bool)

(declare-fun e!99158 () Bool)

(assert (=> b!148627 (= e!99156 e!99158)))

(declare-fun res!124412 () Bool)

(assert (=> b!148627 (=> (not res!124412) (not e!99158))))

(declare-fun e!99159 () Bool)

(assert (=> b!148627 (= res!124412 e!99159)))

(declare-fun res!124413 () Bool)

(assert (=> b!148627 (=> res!124413 e!99159)))

(declare-fun lt!231744 () tuple4!144)

(assert (=> b!148627 (= res!124413 (bvsge (_1!6966 lt!231744) (_2!6966 lt!231744)))))

(assert (=> b!148627 (= lt!231742 ((_ extract 31 0) (bvsrem lt!230924 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!231743 () (_ BitVec 32))

(assert (=> b!148627 (= lt!231743 ((_ extract 31 0) (bvsrem lt!230926 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!148627 (= lt!231744 (arrayBitIndices!0 lt!230926 lt!230924))))

(declare-fun bm!2043 () Bool)

(declare-fun c!8039 () Bool)

(assert (=> bm!2043 (= call!2046 (byteRangesEq!0 (ite c!8039 (select (arr!3783 (buf!3479 (_2!6949 lt!230188))) (_3!363 lt!231744)) (select (arr!3783 (buf!3479 (_2!6949 lt!230188))) (_4!72 lt!231744))) (ite c!8039 (select (arr!3783 (buf!3479 (_2!6949 lt!230195))) (_3!363 lt!231744)) (select (arr!3783 (buf!3479 (_2!6949 lt!230195))) (_4!72 lt!231744))) (ite c!8039 lt!231743 #b00000000000000000000000000000000) lt!231742))))

(declare-fun b!148628 () Bool)

(assert (=> b!148628 (= e!99157 e!99161)))

(declare-fun res!124415 () Bool)

(assert (=> b!148628 (= res!124415 (byteRangesEq!0 (select (arr!3783 (buf!3479 (_2!6949 lt!230188))) (_3!363 lt!231744)) (select (arr!3783 (buf!3479 (_2!6949 lt!230195))) (_3!363 lt!231744)) lt!231743 #b00000000000000000000000000001000))))

(assert (=> b!148628 (=> (not res!124415) (not e!99161))))

(declare-fun d!48509 () Bool)

(declare-fun res!124414 () Bool)

(assert (=> d!48509 (=> res!124414 e!99156)))

(assert (=> d!48509 (= res!124414 (bvsge lt!230926 lt!230924))))

(assert (=> d!48509 (= (arrayBitRangesEq!0 (buf!3479 (_2!6949 lt!230188)) (buf!3479 (_2!6949 lt!230195)) lt!230926 lt!230924) e!99156)))

(declare-fun b!148629 () Bool)

(assert (=> b!148629 (= e!99158 e!99157)))

(assert (=> b!148629 (= c!8039 (= (_3!363 lt!231744) (_4!72 lt!231744)))))

(declare-fun b!148630 () Bool)

(assert (=> b!148630 (= e!99159 (arrayRangesEq!330 (buf!3479 (_2!6949 lt!230188)) (buf!3479 (_2!6949 lt!230195)) (_1!6966 lt!231744) (_2!6966 lt!231744)))))

(assert (= (and d!48509 (not res!124414)) b!148627))

(assert (= (and b!148627 (not res!124413)) b!148630))

(assert (= (and b!148627 res!124412) b!148629))

(assert (= (and b!148629 c!8039) b!148625))

(assert (= (and b!148629 (not c!8039)) b!148628))

(assert (= (and b!148628 res!124415) b!148624))

(assert (= (and b!148624 (not res!124411)) b!148626))

(assert (= (or b!148625 b!148626) bm!2043))

(declare-fun m!230887 () Bool)

(assert (=> b!148627 m!230887))

(declare-fun m!230889 () Bool)

(assert (=> bm!2043 m!230889))

(declare-fun m!230891 () Bool)

(assert (=> bm!2043 m!230891))

(declare-fun m!230893 () Bool)

(assert (=> bm!2043 m!230893))

(declare-fun m!230895 () Bool)

(assert (=> bm!2043 m!230895))

(declare-fun m!230897 () Bool)

(assert (=> bm!2043 m!230897))

(assert (=> b!148628 m!230889))

(assert (=> b!148628 m!230897))

(assert (=> b!148628 m!230889))

(assert (=> b!148628 m!230897))

(declare-fun m!230899 () Bool)

(assert (=> b!148628 m!230899))

(declare-fun m!230901 () Bool)

(assert (=> b!148630 m!230901))

(assert (=> b!148188 d!48509))

(declare-fun d!48511 () Bool)

(declare-fun e!99164 () Bool)

(assert (=> d!48511 e!99164))

(declare-fun res!124418 () Bool)

(assert (=> d!48511 (=> (not res!124418) (not e!99164))))

(declare-fun moveByteIndexPrecond!0 (BitStream!5286 (_ BitVec 32)) Bool)

(assert (=> d!48511 (= res!124418 (moveByteIndexPrecond!0 (_1!6950 lt!230201) #b00000000000000000000000000000001))))

(declare-fun Unit!9407 () Unit!9316)

(assert (=> d!48511 (= (moveByteIndex!0 (_1!6950 lt!230201) #b00000000000000000000000000000001) (tuple2!13181 Unit!9407 (BitStream!5287 (buf!3479 (_1!6950 lt!230201)) (bvadd (currentByte!6387 (_1!6950 lt!230201)) #b00000000000000000000000000000001) (currentBit!6382 (_1!6950 lt!230201)))))))

(declare-fun b!148633 () Bool)

(assert (=> b!148633 (= e!99164 (and (or (not (= (bvand (currentByte!6387 (_1!6950 lt!230201)) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6387 (_1!6950 lt!230201)) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6387 (_1!6950 lt!230201)) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6387 (_1!6950 lt!230201)) #b00000000000000000000000000000001) (bvadd (currentByte!6387 (_1!6950 lt!230201)) #b00000000000000000000000000000001))))))

(assert (= (and d!48511 res!124418) b!148633))

(declare-fun m!230903 () Bool)

(assert (=> d!48511 m!230903))

(assert (=> d!48112 d!48511))

(declare-fun call!2047 () (_ BitVec 64))

(declare-fun bm!2044 () Bool)

(declare-fun lt!231764 () tuple3!580)

(declare-fun c!8040 () Bool)

(assert (=> bm!2044 (= call!2047 (bitIndex!0 (ite c!8040 (size!3014 (buf!3479 (_2!6962 lt!231764))) (size!3014 (buf!3479 (_1!6950 lt!230177)))) (ite c!8040 (currentByte!6387 (_2!6962 lt!231764)) (currentByte!6387 (_1!6950 lt!230177))) (ite c!8040 (currentBit!6382 (_2!6962 lt!231764)) (currentBit!6382 (_1!6950 lt!230177)))))))

(declare-fun bm!2045 () Bool)

(declare-fun call!2048 () Bool)

(declare-fun lt!231755 () tuple2!13200)

(assert (=> bm!2045 (= call!2048 (arrayRangesEq!330 lt!230178 (ite c!8040 (array!6662 (store (arr!3783 lt!230178) (bvadd #b00000000000000000000000000000001 from!447) (_1!6961 lt!231755)) (size!3014 lt!230178)) lt!230178) #b00000000000000000000000000000000 (ite c!8040 (bvadd #b00000000000000000000000000000001 from!447) (size!3014 lt!230178))))))

(declare-fun b!148634 () Bool)

(declare-fun e!99167 () Bool)

(declare-fun lt!231754 () tuple3!580)

(assert (=> b!148634 (= e!99167 (= (select (arr!3783 (_3!361 lt!231754)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!6951 (readBytePure!0 (_1!6950 lt!230177)))))))

(assert (=> b!148634 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!3014 (_3!361 lt!231754))))))

(declare-fun lt!231752 () (_ BitVec 32))

(declare-fun lt!231772 () array!6661)

(declare-fun lt!231765 () array!6661)

(declare-fun lt!231777 () (_ BitVec 32))

(declare-fun call!2049 () Bool)

(declare-fun lt!231757 () (_ BitVec 32))

(declare-fun bm!2046 () Bool)

(assert (=> bm!2046 (= call!2049 (arrayRangesEq!330 (ite c!8040 lt!230178 lt!231772) (ite c!8040 (_3!361 lt!231764) lt!231765) (ite c!8040 lt!231752 lt!231777) (ite c!8040 (bvadd #b00000000000000000000000000000001 from!447) lt!231757)))))

(declare-fun d!48513 () Bool)

(assert (=> d!48513 e!99167))

(declare-fun res!124419 () Bool)

(assert (=> d!48513 (=> res!124419 e!99167)))

(assert (=> d!48513 (= res!124419 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!231769 () Bool)

(declare-fun e!99166 () Bool)

(assert (=> d!48513 (= lt!231769 e!99166)))

(declare-fun res!124420 () Bool)

(assert (=> d!48513 (=> (not res!124420) (not e!99166))))

(declare-fun lt!231751 () (_ BitVec 64))

(declare-fun lt!231780 () (_ BitVec 64))

(assert (=> d!48513 (= res!124420 (= (bvadd lt!231751 lt!231780) (bitIndex!0 (size!3014 (buf!3479 (_2!6962 lt!231754))) (currentByte!6387 (_2!6962 lt!231754)) (currentBit!6382 (_2!6962 lt!231754)))))))

(assert (=> d!48513 (or (not (= (bvand lt!231751 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!231780 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!231751 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!231751 lt!231780) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!231760 () (_ BitVec 64))

(assert (=> d!48513 (= lt!231780 (bvmul lt!231760 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!48513 (or (= lt!231760 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!231760 #b0000000000000000000000000000000000000000000000000000000000001000) lt!231760)))))

(assert (=> d!48513 (= lt!231760 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!48513 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!48513 (= lt!231751 (bitIndex!0 (size!3014 (buf!3479 (_1!6950 lt!230177))) (currentByte!6387 (_1!6950 lt!230177)) (currentBit!6382 (_1!6950 lt!230177))))))

(declare-fun e!99165 () tuple3!580)

(assert (=> d!48513 (= lt!231754 e!99165)))

(assert (=> d!48513 (= c!8040 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!48513 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!3014 lt!230178)))))

(assert (=> d!48513 (= (readByteArrayLoop!0 (_1!6950 lt!230177) lt!230178 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!231754)))

(declare-fun b!148635 () Bool)

(declare-fun lt!231762 () Unit!9316)

(assert (=> b!148635 (= e!99165 (tuple3!581 lt!231762 (_2!6962 lt!231764) (_3!361 lt!231764)))))

(assert (=> b!148635 (= lt!231755 (readByte!0 (_1!6950 lt!230177)))))

(declare-fun lt!231774 () array!6661)

(assert (=> b!148635 (= lt!231774 (array!6662 (store (arr!3783 lt!230178) (bvadd #b00000000000000000000000000000001 from!447) (_1!6961 lt!231755)) (size!3014 lt!230178)))))

(declare-fun lt!231763 () (_ BitVec 64))

(assert (=> b!148635 (= lt!231763 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!231766 () (_ BitVec 32))

(assert (=> b!148635 (= lt!231766 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!231768 () Unit!9316)

(assert (=> b!148635 (= lt!231768 (validateOffsetBytesFromBitIndexLemma!0 (_1!6950 lt!230177) (_2!6961 lt!231755) lt!231763 lt!231766))))

(assert (=> b!148635 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6961 lt!231755)))) ((_ sign_extend 32) (currentByte!6387 (_2!6961 lt!231755))) ((_ sign_extend 32) (currentBit!6382 (_2!6961 lt!231755))) (bvsub lt!231766 ((_ extract 31 0) (bvsdiv (bvadd lt!231763 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!231778 () Unit!9316)

(assert (=> b!148635 (= lt!231778 lt!231768)))

(assert (=> b!148635 (= lt!231764 (readByteArrayLoop!0 (_2!6961 lt!231755) lt!231774 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!148635 (= (bitIndex!0 (size!3014 (buf!3479 (_2!6961 lt!231755))) (currentByte!6387 (_2!6961 lt!231755)) (currentBit!6382 (_2!6961 lt!231755))) (bvadd (bitIndex!0 (size!3014 (buf!3479 (_1!6950 lt!230177))) (currentByte!6387 (_1!6950 lt!230177)) (currentBit!6382 (_1!6950 lt!230177))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!231748 () Unit!9316)

(declare-fun Unit!9408 () Unit!9316)

(assert (=> b!148635 (= lt!231748 Unit!9408)))

(assert (=> b!148635 (= (bvadd (bitIndex!0 (size!3014 (buf!3479 (_2!6961 lt!231755))) (currentByte!6387 (_2!6961 lt!231755)) (currentBit!6382 (_2!6961 lt!231755))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2047)))

(declare-fun lt!231773 () Unit!9316)

(declare-fun Unit!9409 () Unit!9316)

(assert (=> b!148635 (= lt!231773 Unit!9409)))

(assert (=> b!148635 (= (bvadd (bitIndex!0 (size!3014 (buf!3479 (_1!6950 lt!230177))) (currentByte!6387 (_1!6950 lt!230177)) (currentBit!6382 (_1!6950 lt!230177))) (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2047)))

(declare-fun lt!231759 () Unit!9316)

(declare-fun Unit!9410 () Unit!9316)

(assert (=> b!148635 (= lt!231759 Unit!9410)))

(assert (=> b!148635 (and (= (buf!3479 (_1!6950 lt!230177)) (buf!3479 (_2!6962 lt!231764))) (= (size!3014 lt!230178) (size!3014 (_3!361 lt!231764))))))

(declare-fun lt!231747 () Unit!9316)

(declare-fun Unit!9411 () Unit!9316)

(assert (=> b!148635 (= lt!231747 Unit!9411)))

(declare-fun lt!231775 () Unit!9316)

(assert (=> b!148635 (= lt!231775 (arrayUpdatedAtPrefixLemma!15 lt!230178 (bvadd #b00000000000000000000000000000001 from!447) (_1!6961 lt!231755)))))

(assert (=> b!148635 call!2048))

(declare-fun lt!231745 () Unit!9316)

(assert (=> b!148635 (= lt!231745 lt!231775)))

(assert (=> b!148635 (= lt!231752 #b00000000000000000000000000000000)))

(declare-fun lt!231750 () Unit!9316)

(assert (=> b!148635 (= lt!231750 (arrayRangesEqTransitive!55 lt!230178 lt!231774 (_3!361 lt!231764) lt!231752 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!148635 call!2049))

(declare-fun lt!231758 () Unit!9316)

(assert (=> b!148635 (= lt!231758 lt!231750)))

(assert (=> b!148635 (arrayRangesEq!330 lt!230178 (_3!361 lt!231764) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!231770 () Unit!9316)

(declare-fun Unit!9412 () Unit!9316)

(assert (=> b!148635 (= lt!231770 Unit!9412)))

(declare-fun lt!231776 () Unit!9316)

(assert (=> b!148635 (= lt!231776 (arrayRangesEqImpliesEq!15 lt!231774 (_3!361 lt!231764) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!148635 (= (select (store (arr!3783 lt!230178) (bvadd #b00000000000000000000000000000001 from!447) (_1!6961 lt!231755)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3783 (_3!361 lt!231764)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!231753 () Unit!9316)

(assert (=> b!148635 (= lt!231753 lt!231776)))

(declare-fun lt!231746 () Bool)

(assert (=> b!148635 (= lt!231746 (= (select (arr!3783 (_3!361 lt!231764)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!6961 lt!231755)))))

(declare-fun Unit!9413 () Unit!9316)

(assert (=> b!148635 (= lt!231762 Unit!9413)))

(assert (=> b!148635 lt!231746))

(declare-fun lt!231771 () Unit!9316)

(declare-fun b!148636 () Bool)

(assert (=> b!148636 (= e!99165 (tuple3!581 lt!231771 (_1!6950 lt!230177) lt!230178))))

(assert (=> b!148636 (= call!2047 call!2047)))

(declare-fun lt!231767 () Unit!9316)

(declare-fun Unit!9414 () Unit!9316)

(assert (=> b!148636 (= lt!231767 Unit!9414)))

(declare-fun lt!231749 () Unit!9316)

(assert (=> b!148636 (= lt!231749 (arrayRangesEqReflexiveLemma!15 lt!230178))))

(assert (=> b!148636 call!2048))

(declare-fun lt!231779 () Unit!9316)

(assert (=> b!148636 (= lt!231779 lt!231749)))

(assert (=> b!148636 (= lt!231772 lt!230178)))

(assert (=> b!148636 (= lt!231765 lt!230178)))

(declare-fun lt!231756 () (_ BitVec 32))

(assert (=> b!148636 (= lt!231756 #b00000000000000000000000000000000)))

(declare-fun lt!231761 () (_ BitVec 32))

(assert (=> b!148636 (= lt!231761 (size!3014 lt!230178))))

(assert (=> b!148636 (= lt!231777 #b00000000000000000000000000000000)))

(assert (=> b!148636 (= lt!231757 (bvadd #b00000000000000000000000000000001 from!447))))

(assert (=> b!148636 (= lt!231771 (arrayRangesEqSlicedLemma!15 lt!231772 lt!231765 lt!231756 lt!231761 lt!231777 lt!231757))))

(assert (=> b!148636 call!2049))

(declare-fun b!148637 () Bool)

(assert (=> b!148637 (= e!99166 (arrayRangesEq!330 lt!230178 (_3!361 lt!231754) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun b!148638 () Bool)

(declare-fun res!124421 () Bool)

(assert (=> b!148638 (=> (not res!124421) (not e!99166))))

(assert (=> b!148638 (= res!124421 (and (= (buf!3479 (_1!6950 lt!230177)) (buf!3479 (_2!6962 lt!231754))) (= (size!3014 lt!230178) (size!3014 (_3!361 lt!231754)))))))

(assert (= (and d!48513 c!8040) b!148635))

(assert (= (and d!48513 (not c!8040)) b!148636))

(assert (= (or b!148635 b!148636) bm!2046))

(assert (= (or b!148635 b!148636) bm!2045))

(assert (= (or b!148635 b!148636) bm!2044))

(assert (= (and d!48513 res!124420) b!148638))

(assert (= (and b!148638 res!124421) b!148637))

(assert (= (and d!48513 (not res!124419)) b!148634))

(declare-fun m!230905 () Bool)

(assert (=> bm!2045 m!230905))

(declare-fun m!230907 () Bool)

(assert (=> bm!2045 m!230907))

(declare-fun m!230909 () Bool)

(assert (=> bm!2044 m!230909))

(declare-fun m!230911 () Bool)

(assert (=> bm!2046 m!230911))

(assert (=> b!148636 m!230669))

(declare-fun m!230913 () Bool)

(assert (=> b!148636 m!230913))

(declare-fun m!230915 () Bool)

(assert (=> b!148634 m!230915))

(declare-fun m!230917 () Bool)

(assert (=> b!148634 m!230917))

(declare-fun m!230919 () Bool)

(assert (=> b!148635 m!230919))

(declare-fun m!230921 () Bool)

(assert (=> b!148635 m!230921))

(declare-fun m!230923 () Bool)

(assert (=> b!148635 m!230923))

(assert (=> b!148635 m!230905))

(declare-fun m!230925 () Bool)

(assert (=> b!148635 m!230925))

(declare-fun m!230927 () Bool)

(assert (=> b!148635 m!230927))

(declare-fun m!230929 () Bool)

(assert (=> b!148635 m!230929))

(declare-fun m!230931 () Bool)

(assert (=> b!148635 m!230931))

(declare-fun m!230933 () Bool)

(assert (=> b!148635 m!230933))

(declare-fun m!230935 () Bool)

(assert (=> b!148635 m!230935))

(declare-fun m!230937 () Bool)

(assert (=> b!148635 m!230937))

(declare-fun m!230939 () Bool)

(assert (=> b!148635 m!230939))

(declare-fun m!230941 () Bool)

(assert (=> b!148635 m!230941))

(declare-fun m!230943 () Bool)

(assert (=> b!148637 m!230943))

(declare-fun m!230945 () Bool)

(assert (=> d!48513 m!230945))

(assert (=> d!48513 m!230939))

(assert (=> d!48145 d!48513))

(assert (=> b!148216 d!48090))

(assert (=> b!148216 d!48088))

(declare-fun d!48515 () Bool)

(declare-fun e!99168 () Bool)

(assert (=> d!48515 e!99168))

(declare-fun res!124422 () Bool)

(assert (=> d!48515 (=> (not res!124422) (not e!99168))))

(declare-fun lt!231782 () (_ BitVec 64))

(declare-fun lt!231781 () BitStream!5286)

(assert (=> d!48515 (= res!124422 (= (bvadd lt!231782 (bvsub lt!230847 lt!230855)) (bitIndex!0 (size!3014 (buf!3479 lt!231781)) (currentByte!6387 lt!231781) (currentBit!6382 lt!231781))))))

(assert (=> d!48515 (or (not (= (bvand lt!231782 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!230847 lt!230855) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!231782 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!231782 (bvsub lt!230847 lt!230855)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48515 (= lt!231782 (bitIndex!0 (size!3014 (buf!3479 (_2!6950 lt!230853))) (currentByte!6387 (_2!6950 lt!230853)) (currentBit!6382 (_2!6950 lt!230853))))))

(assert (=> d!48515 (= lt!231781 (_2!6949 (moveBitIndex!0 (_2!6950 lt!230853) (bvsub lt!230847 lt!230855))))))

(assert (=> d!48515 (moveBitIndexPrecond!0 (_2!6950 lt!230853) (bvsub lt!230847 lt!230855))))

(assert (=> d!48515 (= (withMovedBitIndex!0 (_2!6950 lt!230853) (bvsub lt!230847 lt!230855)) lt!231781)))

(declare-fun b!148639 () Bool)

(assert (=> b!148639 (= e!99168 (= (size!3014 (buf!3479 (_2!6950 lt!230853))) (size!3014 (buf!3479 lt!231781))))))

(assert (= (and d!48515 res!124422) b!148639))

(declare-fun m!230947 () Bool)

(assert (=> d!48515 m!230947))

(assert (=> d!48515 m!230639))

(declare-fun m!230949 () Bool)

(assert (=> d!48515 m!230949))

(declare-fun m!230951 () Bool)

(assert (=> d!48515 m!230951))

(assert (=> b!148161 d!48515))

(assert (=> b!148161 d!48088))

(assert (=> b!148161 d!48090))

(assert (=> d!48163 d!48161))

(declare-fun d!48517 () Bool)

(assert (=> d!48517 (validate_offset_bits!1 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230188)))) ((_ sign_extend 32) (currentByte!6387 (_2!6949 lt!230195))) ((_ sign_extend 32) (currentBit!6382 (_2!6949 lt!230195))) lt!230189)))

(assert (=> d!48517 true))

(declare-fun _$6!328 () Unit!9316)

(assert (=> d!48517 (= (choose!9 (_2!6949 lt!230195) (buf!3479 (_2!6949 lt!230188)) lt!230189 (BitStream!5287 (buf!3479 (_2!6949 lt!230188)) (currentByte!6387 (_2!6949 lt!230195)) (currentBit!6382 (_2!6949 lt!230195)))) _$6!328)))

(declare-fun bs!11832 () Bool)

(assert (= bs!11832 d!48517))

(assert (=> bs!11832 m!229113))

(assert (=> d!48163 d!48517))

(declare-fun d!48519 () Bool)

(declare-fun lt!231788 () (_ BitVec 8))

(declare-fun lt!231784 () (_ BitVec 8))

(assert (=> d!48519 (= lt!231788 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3783 (buf!3479 (_1!6950 lt!230183))) (currentByte!6387 (_1!6950 lt!230183)))) ((_ sign_extend 24) lt!231784))))))

(assert (=> d!48519 (= lt!231784 ((_ extract 7 0) (currentBit!6382 (_1!6950 lt!230183))))))

(declare-fun e!99170 () Bool)

(assert (=> d!48519 e!99170))

(declare-fun res!124424 () Bool)

(assert (=> d!48519 (=> (not res!124424) (not e!99170))))

(assert (=> d!48519 (= res!124424 (validate_offset_bits!1 ((_ sign_extend 32) (size!3014 (buf!3479 (_1!6950 lt!230183)))) ((_ sign_extend 32) (currentByte!6387 (_1!6950 lt!230183))) ((_ sign_extend 32) (currentBit!6382 (_1!6950 lt!230183))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!9415 () Unit!9316)

(declare-fun Unit!9416 () Unit!9316)

(assert (=> d!48519 (= (readByte!0 (_1!6950 lt!230183)) (tuple2!13201 (_2!6965 (ite (bvsgt ((_ sign_extend 24) lt!231784) #b00000000000000000000000000000000) (tuple2!13205 Unit!9415 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!231788) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3783 (buf!3479 (_1!6950 lt!230183))) (bvadd (currentByte!6387 (_1!6950 lt!230183)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!231784)))))))) (tuple2!13205 Unit!9416 lt!231788))) (BitStream!5287 (buf!3479 (_1!6950 lt!230183)) (bvadd (currentByte!6387 (_1!6950 lt!230183)) #b00000000000000000000000000000001) (currentBit!6382 (_1!6950 lt!230183)))))))

(declare-fun b!148640 () Bool)

(declare-fun e!99169 () Bool)

(assert (=> b!148640 (= e!99170 e!99169)))

(declare-fun res!124423 () Bool)

(assert (=> b!148640 (=> (not res!124423) (not e!99169))))

(declare-fun lt!231787 () tuple2!13200)

(assert (=> b!148640 (= res!124423 (= (buf!3479 (_2!6961 lt!231787)) (buf!3479 (_1!6950 lt!230183))))))

(declare-fun lt!231789 () (_ BitVec 8))

(declare-fun lt!231783 () (_ BitVec 8))

(declare-fun Unit!9417 () Unit!9316)

(declare-fun Unit!9418 () Unit!9316)

(assert (=> b!148640 (= lt!231787 (tuple2!13201 (_2!6965 (ite (bvsgt ((_ sign_extend 24) lt!231789) #b00000000000000000000000000000000) (tuple2!13205 Unit!9417 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!231783) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3783 (buf!3479 (_1!6950 lt!230183))) (bvadd (currentByte!6387 (_1!6950 lt!230183)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!231789)))))))) (tuple2!13205 Unit!9418 lt!231783))) (BitStream!5287 (buf!3479 (_1!6950 lt!230183)) (bvadd (currentByte!6387 (_1!6950 lt!230183)) #b00000000000000000000000000000001) (currentBit!6382 (_1!6950 lt!230183)))))))

(assert (=> b!148640 (= lt!231783 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3783 (buf!3479 (_1!6950 lt!230183))) (currentByte!6387 (_1!6950 lt!230183)))) ((_ sign_extend 24) lt!231789))))))

(assert (=> b!148640 (= lt!231789 ((_ extract 7 0) (currentBit!6382 (_1!6950 lt!230183))))))

(declare-fun lt!231786 () (_ BitVec 64))

(declare-fun b!148641 () Bool)

(declare-fun lt!231785 () (_ BitVec 64))

(assert (=> b!148641 (= e!99169 (= (bitIndex!0 (size!3014 (buf!3479 (_2!6961 lt!231787))) (currentByte!6387 (_2!6961 lt!231787)) (currentBit!6382 (_2!6961 lt!231787))) (bvadd lt!231785 lt!231786)))))

(assert (=> b!148641 (or (not (= (bvand lt!231785 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!231786 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!231785 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!231785 lt!231786) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!148641 (= lt!231786 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!148641 (= lt!231785 (bitIndex!0 (size!3014 (buf!3479 (_1!6950 lt!230183))) (currentByte!6387 (_1!6950 lt!230183)) (currentBit!6382 (_1!6950 lt!230183))))))

(assert (= (and d!48519 res!124424) b!148640))

(assert (= (and b!148640 res!124423) b!148641))

(declare-fun m!230953 () Bool)

(assert (=> d!48519 m!230953))

(declare-fun m!230955 () Bool)

(assert (=> d!48519 m!230955))

(declare-fun m!230957 () Bool)

(assert (=> d!48519 m!230957))

(assert (=> b!148640 m!230957))

(assert (=> b!148640 m!230953))

(declare-fun m!230959 () Bool)

(assert (=> b!148641 m!230959))

(declare-fun m!230961 () Bool)

(assert (=> b!148641 m!230961))

(assert (=> d!48098 d!48519))

(declare-fun d!48521 () Bool)

(assert (=> d!48521 (arrayRangesEq!330 (_2!6952 (readByteArrayLoopPure!0 (_1!6950 lt!230201) arr!237 from!447 to!404)) (_2!6952 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6950 lt!230201) #b00000000000000000000000000000001) (array!6662 (store (arr!3783 arr!237) from!447 (_2!6951 (readBytePure!0 (_1!6950 lt!230201)))) (size!3014 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404)) #b00000000000000000000000000000000 to!404)))

(assert (=> d!48521 true))

(declare-fun _$13!70 () Unit!9316)

(assert (=> d!48521 (= (choose!35 (_1!6950 lt!230201) arr!237 from!447 to!404 lt!230958 (_2!6952 lt!230958) lt!230959 lt!230960 (_2!6952 lt!230960)) _$13!70)))

(declare-fun bs!11834 () Bool)

(assert (= bs!11834 d!48521))

(assert (=> bs!11834 m!229135))

(assert (=> bs!11834 m!229181))

(assert (=> bs!11834 m!229147))

(assert (=> bs!11834 m!229843))

(declare-fun m!230963 () Bool)

(assert (=> bs!11834 m!230963))

(assert (=> bs!11834 m!229135))

(declare-fun m!230965 () Bool)

(assert (=> bs!11834 m!230965))

(assert (=> d!48132 d!48521))

(assert (=> d!48132 d!48102))

(declare-fun d!48523 () Bool)

(declare-fun res!124425 () Bool)

(declare-fun e!99171 () Bool)

(assert (=> d!48523 (=> res!124425 e!99171)))

(assert (=> d!48523 (= res!124425 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!48523 (= (arrayRangesEq!330 (_2!6952 lt!230958) (_2!6952 lt!230960) #b00000000000000000000000000000000 to!404) e!99171)))

(declare-fun b!148642 () Bool)

(declare-fun e!99172 () Bool)

(assert (=> b!148642 (= e!99171 e!99172)))

(declare-fun res!124426 () Bool)

(assert (=> b!148642 (=> (not res!124426) (not e!99172))))

(assert (=> b!148642 (= res!124426 (= (select (arr!3783 (_2!6952 lt!230958)) #b00000000000000000000000000000000) (select (arr!3783 (_2!6952 lt!230960)) #b00000000000000000000000000000000)))))

(declare-fun b!148643 () Bool)

(assert (=> b!148643 (= e!99172 (arrayRangesEq!330 (_2!6952 lt!230958) (_2!6952 lt!230960) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48523 (not res!124425)) b!148642))

(assert (= (and b!148642 res!124426) b!148643))

(declare-fun m!230967 () Bool)

(assert (=> b!148642 m!230967))

(declare-fun m!230969 () Bool)

(assert (=> b!148642 m!230969))

(declare-fun m!230971 () Bool)

(assert (=> b!148643 m!230971))

(assert (=> d!48132 d!48523))

(assert (=> d!48132 d!48112))

(declare-fun d!48525 () Bool)

(declare-fun lt!231790 () tuple3!580)

(assert (=> d!48525 (= lt!231790 (readByteArrayLoop!0 lt!230959 (array!6662 (store (arr!3783 arr!237) from!447 (_2!6951 (readBytePure!0 (_1!6950 lt!230201)))) (size!3014 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!48525 (= (readByteArrayLoopPure!0 lt!230959 (array!6662 (store (arr!3783 arr!237) from!447 (_2!6951 (readBytePure!0 (_1!6950 lt!230201)))) (size!3014 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404) (tuple2!13187 (_2!6962 lt!231790) (_3!361 lt!231790)))))

(declare-fun bs!11835 () Bool)

(assert (= bs!11835 d!48525))

(declare-fun m!230973 () Bool)

(assert (=> bs!11835 m!230973))

(assert (=> d!48132 d!48525))

(assert (=> d!48132 d!48149))

(assert (=> d!48094 d!48167))

(assert (=> d!48136 d!48126))

(declare-fun d!48527 () Bool)

(assert (=> d!48527 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230188)))) ((_ sign_extend 32) (currentByte!6387 (_2!6949 lt!230195))) ((_ sign_extend 32) (currentBit!6382 (_2!6949 lt!230195))) lt!230199)))

(assert (=> d!48527 true))

(declare-fun _$5!83 () Unit!9316)

(assert (=> d!48527 (= (choose!26 (_2!6949 lt!230195) (buf!3479 (_2!6949 lt!230188)) lt!230199 (BitStream!5287 (buf!3479 (_2!6949 lt!230188)) (currentByte!6387 (_2!6949 lt!230195)) (currentBit!6382 (_2!6949 lt!230195)))) _$5!83)))

(declare-fun bs!11836 () Bool)

(assert (= bs!11836 d!48527))

(assert (=> bs!11836 m!229141))

(assert (=> d!48136 d!48527))

(declare-fun d!48529 () Bool)

(assert (=> d!48529 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230195)))) ((_ sign_extend 32) (currentByte!6387 (_2!6949 lt!230195))) ((_ sign_extend 32) (currentBit!6382 (_2!6949 lt!230195))) lt!230886) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3014 (buf!3479 (_2!6949 lt!230195)))) ((_ sign_extend 32) (currentByte!6387 (_2!6949 lt!230195))) ((_ sign_extend 32) (currentBit!6382 (_2!6949 lt!230195)))) lt!230886))))

(declare-fun bs!11837 () Bool)

(assert (= bs!11837 d!48529))

(assert (=> bs!11837 m!229697))

(assert (=> b!148178 d!48529))

(declare-fun d!48531 () Bool)

(declare-fun res!124427 () Bool)

(declare-fun e!99173 () Bool)

(assert (=> d!48531 (=> res!124427 e!99173)))

(assert (=> d!48531 (= res!124427 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!48531 (= (arrayRangesEq!330 (_2!6952 lt!230198) (_2!6952 lt!230185) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!99173)))

(declare-fun b!148644 () Bool)

(declare-fun e!99174 () Bool)

(assert (=> b!148644 (= e!99173 e!99174)))

(declare-fun res!124428 () Bool)

(assert (=> b!148644 (=> (not res!124428) (not e!99174))))

(assert (=> b!148644 (= res!124428 (= (select (arr!3783 (_2!6952 lt!230198)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3783 (_2!6952 lt!230185)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!148645 () Bool)

(assert (=> b!148645 (= e!99174 (arrayRangesEq!330 (_2!6952 lt!230198) (_2!6952 lt!230185) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48531 (not res!124427)) b!148644))

(assert (= (and b!148644 res!124428) b!148645))

(assert (=> b!148644 m!230579))

(assert (=> b!148644 m!230709))

(declare-fun m!230975 () Bool)

(assert (=> b!148645 m!230975))

(assert (=> b!148194 d!48531))

(declare-fun b!148646 () Bool)

(declare-fun res!124429 () Bool)

(declare-fun lt!231791 () (_ BitVec 32))

(assert (=> b!148646 (= res!124429 (= lt!231791 #b00000000000000000000000000000000))))

(declare-fun e!99179 () Bool)

(assert (=> b!148646 (=> res!124429 e!99179)))

(declare-fun e!99180 () Bool)

(assert (=> b!148646 (= e!99180 e!99179)))

(declare-fun b!148647 () Bool)

(declare-fun e!99176 () Bool)

(declare-fun call!2050 () Bool)

(assert (=> b!148647 (= e!99176 call!2050)))

(declare-fun b!148648 () Bool)

(assert (=> b!148648 (= e!99179 call!2050)))

(declare-fun b!148649 () Bool)

(declare-fun e!99175 () Bool)

(declare-fun e!99177 () Bool)

(assert (=> b!148649 (= e!99175 e!99177)))

(declare-fun res!124430 () Bool)

(assert (=> b!148649 (=> (not res!124430) (not e!99177))))

(declare-fun e!99178 () Bool)

(assert (=> b!148649 (= res!124430 e!99178)))

(declare-fun res!124431 () Bool)

(assert (=> b!148649 (=> res!124431 e!99178)))

(declare-fun lt!231793 () tuple4!144)

(assert (=> b!148649 (= res!124431 (bvsge (_1!6966 lt!231793) (_2!6966 lt!231793)))))

(assert (=> b!148649 (= lt!231791 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3014 (buf!3479 thiss!1634)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!231792 () (_ BitVec 32))

(assert (=> b!148649 (= lt!231792 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!148649 (= lt!231793 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3014 (buf!3479 thiss!1634)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634))))))

(declare-fun bm!2047 () Bool)

(declare-fun c!8041 () Bool)

(assert (=> bm!2047 (= call!2050 (byteRangesEq!0 (ite c!8041 (select (arr!3783 (buf!3479 thiss!1634)) (_3!363 lt!231793)) (select (arr!3783 (buf!3479 thiss!1634)) (_4!72 lt!231793))) (ite c!8041 (select (arr!3783 (buf!3479 (_2!6949 lt!230195))) (_3!363 lt!231793)) (select (arr!3783 (buf!3479 (_2!6949 lt!230195))) (_4!72 lt!231793))) (ite c!8041 lt!231792 #b00000000000000000000000000000000) lt!231791))))

(declare-fun b!148650 () Bool)

(assert (=> b!148650 (= e!99176 e!99180)))

(declare-fun res!124433 () Bool)

(assert (=> b!148650 (= res!124433 (byteRangesEq!0 (select (arr!3783 (buf!3479 thiss!1634)) (_3!363 lt!231793)) (select (arr!3783 (buf!3479 (_2!6949 lt!230195))) (_3!363 lt!231793)) lt!231792 #b00000000000000000000000000001000))))

(assert (=> b!148650 (=> (not res!124433) (not e!99180))))

(declare-fun d!48533 () Bool)

(declare-fun res!124432 () Bool)

(assert (=> d!48533 (=> res!124432 e!99175)))

(assert (=> d!48533 (= res!124432 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3014 (buf!3479 thiss!1634)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634))))))

(assert (=> d!48533 (= (arrayBitRangesEq!0 (buf!3479 thiss!1634) (buf!3479 (_2!6949 lt!230195)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3014 (buf!3479 thiss!1634)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634))) e!99175)))

(declare-fun b!148651 () Bool)

(assert (=> b!148651 (= e!99177 e!99176)))

(assert (=> b!148651 (= c!8041 (= (_3!363 lt!231793) (_4!72 lt!231793)))))

(declare-fun b!148652 () Bool)

(assert (=> b!148652 (= e!99178 (arrayRangesEq!330 (buf!3479 thiss!1634) (buf!3479 (_2!6949 lt!230195)) (_1!6966 lt!231793) (_2!6966 lt!231793)))))

(assert (= (and d!48533 (not res!124432)) b!148649))

(assert (= (and b!148649 (not res!124431)) b!148652))

(assert (= (and b!148649 res!124430) b!148651))

(assert (= (and b!148651 c!8041) b!148647))

(assert (= (and b!148651 (not c!8041)) b!148650))

(assert (= (and b!148650 res!124433) b!148646))

(assert (= (and b!148646 (not res!124429)) b!148648))

(assert (= (or b!148647 b!148648) bm!2047))

(assert (=> b!148649 m!229129))

(assert (=> b!148649 m!230781))

(declare-fun m!230977 () Bool)

(assert (=> bm!2047 m!230977))

(declare-fun m!230979 () Bool)

(assert (=> bm!2047 m!230979))

(declare-fun m!230981 () Bool)

(assert (=> bm!2047 m!230981))

(declare-fun m!230983 () Bool)

(assert (=> bm!2047 m!230983))

(declare-fun m!230985 () Bool)

(assert (=> bm!2047 m!230985))

(assert (=> b!148650 m!230977))

(assert (=> b!148650 m!230985))

(assert (=> b!148650 m!230977))

(assert (=> b!148650 m!230985))

(declare-fun m!230987 () Bool)

(assert (=> b!148650 m!230987))

(declare-fun m!230989 () Bool)

(assert (=> b!148652 m!230989))

(assert (=> b!148218 d!48533))

(assert (=> b!148218 d!48090))

(declare-fun d!48535 () Bool)

(declare-fun lt!231799 () (_ BitVec 8))

(declare-fun lt!231795 () (_ BitVec 8))

(assert (=> d!48535 (= lt!231799 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3783 (buf!3479 (_1!6950 lt!230201))) (currentByte!6387 (_1!6950 lt!230201)))) ((_ sign_extend 24) lt!231795))))))

(assert (=> d!48535 (= lt!231795 ((_ extract 7 0) (currentBit!6382 (_1!6950 lt!230201))))))

(declare-fun e!99182 () Bool)

(assert (=> d!48535 e!99182))

(declare-fun res!124435 () Bool)

(assert (=> d!48535 (=> (not res!124435) (not e!99182))))

(assert (=> d!48535 (= res!124435 (validate_offset_bits!1 ((_ sign_extend 32) (size!3014 (buf!3479 (_1!6950 lt!230201)))) ((_ sign_extend 32) (currentByte!6387 (_1!6950 lt!230201))) ((_ sign_extend 32) (currentBit!6382 (_1!6950 lt!230201))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!9419 () Unit!9316)

(declare-fun Unit!9420 () Unit!9316)

(assert (=> d!48535 (= (readByte!0 (_1!6950 lt!230201)) (tuple2!13201 (_2!6965 (ite (bvsgt ((_ sign_extend 24) lt!231795) #b00000000000000000000000000000000) (tuple2!13205 Unit!9419 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!231799) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3783 (buf!3479 (_1!6950 lt!230201))) (bvadd (currentByte!6387 (_1!6950 lt!230201)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!231795)))))))) (tuple2!13205 Unit!9420 lt!231799))) (BitStream!5287 (buf!3479 (_1!6950 lt!230201)) (bvadd (currentByte!6387 (_1!6950 lt!230201)) #b00000000000000000000000000000001) (currentBit!6382 (_1!6950 lt!230201)))))))

(declare-fun b!148653 () Bool)

(declare-fun e!99181 () Bool)

(assert (=> b!148653 (= e!99182 e!99181)))

(declare-fun res!124434 () Bool)

(assert (=> b!148653 (=> (not res!124434) (not e!99181))))

(declare-fun lt!231798 () tuple2!13200)

(assert (=> b!148653 (= res!124434 (= (buf!3479 (_2!6961 lt!231798)) (buf!3479 (_1!6950 lt!230201))))))

(declare-fun lt!231800 () (_ BitVec 8))

(declare-fun lt!231794 () (_ BitVec 8))

(declare-fun Unit!9421 () Unit!9316)

(declare-fun Unit!9422 () Unit!9316)

(assert (=> b!148653 (= lt!231798 (tuple2!13201 (_2!6965 (ite (bvsgt ((_ sign_extend 24) lt!231800) #b00000000000000000000000000000000) (tuple2!13205 Unit!9421 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!231794) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3783 (buf!3479 (_1!6950 lt!230201))) (bvadd (currentByte!6387 (_1!6950 lt!230201)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!231800)))))))) (tuple2!13205 Unit!9422 lt!231794))) (BitStream!5287 (buf!3479 (_1!6950 lt!230201)) (bvadd (currentByte!6387 (_1!6950 lt!230201)) #b00000000000000000000000000000001) (currentBit!6382 (_1!6950 lt!230201)))))))

(assert (=> b!148653 (= lt!231794 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3783 (buf!3479 (_1!6950 lt!230201))) (currentByte!6387 (_1!6950 lt!230201)))) ((_ sign_extend 24) lt!231800))))))

(assert (=> b!148653 (= lt!231800 ((_ extract 7 0) (currentBit!6382 (_1!6950 lt!230201))))))

(declare-fun lt!231797 () (_ BitVec 64))

(declare-fun lt!231796 () (_ BitVec 64))

(declare-fun b!148654 () Bool)

(assert (=> b!148654 (= e!99181 (= (bitIndex!0 (size!3014 (buf!3479 (_2!6961 lt!231798))) (currentByte!6387 (_2!6961 lt!231798)) (currentBit!6382 (_2!6961 lt!231798))) (bvadd lt!231796 lt!231797)))))

(assert (=> b!148654 (or (not (= (bvand lt!231796 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!231797 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!231796 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!231796 lt!231797) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!148654 (= lt!231797 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!148654 (= lt!231796 (bitIndex!0 (size!3014 (buf!3479 (_1!6950 lt!230201))) (currentByte!6387 (_1!6950 lt!230201)) (currentBit!6382 (_1!6950 lt!230201))))))

(assert (= (and d!48535 res!124435) b!148653))

(assert (= (and b!148653 res!124434) b!148654))

(declare-fun m!230991 () Bool)

(assert (=> d!48535 m!230991))

(declare-fun m!230993 () Bool)

(assert (=> d!48535 m!230993))

(declare-fun m!230995 () Bool)

(assert (=> d!48535 m!230995))

(assert (=> b!148653 m!230995))

(assert (=> b!148653 m!230991))

(declare-fun m!230997 () Bool)

(assert (=> b!148654 m!230997))

(assert (=> b!148654 m!230489))

(assert (=> d!48149 d!48535))

(declare-fun d!48537 () Bool)

(declare-fun res!124438 () Bool)

(declare-fun e!99184 () Bool)

(assert (=> d!48537 (=> (not res!124438) (not e!99184))))

(assert (=> d!48537 (= res!124438 (= (size!3014 (buf!3479 (_2!6950 lt!230911))) (size!3014 (buf!3479 (_2!6949 lt!230188)))))))

(assert (=> d!48537 (= (isPrefixOf!0 (_2!6950 lt!230911) (_2!6949 lt!230188)) e!99184)))

(declare-fun b!148655 () Bool)

(declare-fun res!124437 () Bool)

(assert (=> b!148655 (=> (not res!124437) (not e!99184))))

(assert (=> b!148655 (= res!124437 (bvsle (bitIndex!0 (size!3014 (buf!3479 (_2!6950 lt!230911))) (currentByte!6387 (_2!6950 lt!230911)) (currentBit!6382 (_2!6950 lt!230911))) (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230188))) (currentByte!6387 (_2!6949 lt!230188)) (currentBit!6382 (_2!6949 lt!230188)))))))

(declare-fun b!148656 () Bool)

(declare-fun e!99183 () Bool)

(assert (=> b!148656 (= e!99184 e!99183)))

(declare-fun res!124436 () Bool)

(assert (=> b!148656 (=> res!124436 e!99183)))

(assert (=> b!148656 (= res!124436 (= (size!3014 (buf!3479 (_2!6950 lt!230911))) #b00000000000000000000000000000000))))

(declare-fun b!148657 () Bool)

(assert (=> b!148657 (= e!99183 (arrayBitRangesEq!0 (buf!3479 (_2!6950 lt!230911)) (buf!3479 (_2!6949 lt!230188)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3014 (buf!3479 (_2!6950 lt!230911))) (currentByte!6387 (_2!6950 lt!230911)) (currentBit!6382 (_2!6950 lt!230911)))))))

(assert (= (and d!48537 res!124438) b!148655))

(assert (= (and b!148655 res!124437) b!148656))

(assert (= (and b!148656 (not res!124436)) b!148657))

(assert (=> b!148655 m!230509))

(assert (=> b!148655 m!229189))

(assert (=> b!148657 m!230509))

(assert (=> b!148657 m!230509))

(declare-fun m!230999 () Bool)

(assert (=> b!148657 m!230999))

(assert (=> b!148187 d!48537))

(assert (=> d!48106 d!48375))

(declare-fun d!48539 () Bool)

(declare-fun e!99187 () Bool)

(assert (=> d!48539 e!99187))

(declare-fun res!124441 () Bool)

(assert (=> d!48539 (=> (not res!124441) (not e!99187))))

(declare-fun lt!231805 () tuple2!13184)

(declare-fun lt!231806 () tuple2!13184)

(assert (=> d!48539 (= res!124441 (= (bitIndex!0 (size!3014 (buf!3479 (_1!6951 lt!231805))) (currentByte!6387 (_1!6951 lt!231805)) (currentBit!6382 (_1!6951 lt!231805))) (bitIndex!0 (size!3014 (buf!3479 (_1!6951 lt!231806))) (currentByte!6387 (_1!6951 lt!231806)) (currentBit!6382 (_1!6951 lt!231806)))))))

(assert (=> d!48539 (= lt!231806 (readBytePure!0 (BitStream!5287 (buf!3479 (_2!6949 lt!230188)) (currentByte!6387 lt!230181) (currentBit!6382 lt!230181))))))

(assert (=> d!48539 (= lt!231805 (readBytePure!0 lt!230181))))

(assert (=> d!48539 true))

(declare-fun _$8!96 () Unit!9316)

(assert (=> d!48539 (= (choose!14 lt!230181 (_2!6949 lt!230188) lt!230943 lt!230945 (tuple2!13185 (_1!6951 lt!230945) (_2!6951 lt!230945)) (_1!6951 lt!230945) (_2!6951 lt!230945) lt!230946 (tuple2!13185 (_1!6951 lt!230946) (_2!6951 lt!230946)) (_1!6951 lt!230946) (_2!6951 lt!230946)) _$8!96)))

(declare-fun b!148660 () Bool)

(assert (=> b!148660 (= e!99187 (= (_2!6951 lt!231805) (_2!6951 lt!231806)))))

(assert (= (and d!48539 res!124441) b!148660))

(declare-fun m!231001 () Bool)

(assert (=> d!48539 m!231001))

(declare-fun m!231003 () Bool)

(assert (=> d!48539 m!231003))

(declare-fun m!231005 () Bool)

(assert (=> d!48539 m!231005))

(assert (=> d!48539 m!229149))

(assert (=> d!48128 d!48539))

(declare-fun d!48541 () Bool)

(declare-fun e!99188 () Bool)

(assert (=> d!48541 e!99188))

(declare-fun res!124443 () Bool)

(assert (=> d!48541 (=> (not res!124443) (not e!99188))))

(declare-fun lt!231809 () (_ BitVec 64))

(declare-fun lt!231808 () (_ BitVec 64))

(declare-fun lt!231810 () (_ BitVec 64))

(assert (=> d!48541 (= res!124443 (= lt!231809 (bvsub lt!231808 lt!231810)))))

(assert (=> d!48541 (or (= (bvand lt!231808 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!231810 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!231808 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!231808 lt!231810) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48541 (= lt!231810 (remainingBits!0 ((_ sign_extend 32) (size!3014 (buf!3479 (_1!6951 lt!230945)))) ((_ sign_extend 32) (currentByte!6387 (_1!6951 lt!230945))) ((_ sign_extend 32) (currentBit!6382 (_1!6951 lt!230945)))))))

(declare-fun lt!231807 () (_ BitVec 64))

(declare-fun lt!231811 () (_ BitVec 64))

(assert (=> d!48541 (= lt!231808 (bvmul lt!231807 lt!231811))))

(assert (=> d!48541 (or (= lt!231807 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!231811 (bvsdiv (bvmul lt!231807 lt!231811) lt!231807)))))

(assert (=> d!48541 (= lt!231811 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!48541 (= lt!231807 ((_ sign_extend 32) (size!3014 (buf!3479 (_1!6951 lt!230945)))))))

(assert (=> d!48541 (= lt!231809 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6387 (_1!6951 lt!230945))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6382 (_1!6951 lt!230945)))))))

(assert (=> d!48541 (invariant!0 (currentBit!6382 (_1!6951 lt!230945)) (currentByte!6387 (_1!6951 lt!230945)) (size!3014 (buf!3479 (_1!6951 lt!230945))))))

(assert (=> d!48541 (= (bitIndex!0 (size!3014 (buf!3479 (_1!6951 lt!230945))) (currentByte!6387 (_1!6951 lt!230945)) (currentBit!6382 (_1!6951 lt!230945))) lt!231809)))

(declare-fun b!148661 () Bool)

(declare-fun res!124442 () Bool)

(assert (=> b!148661 (=> (not res!124442) (not e!99188))))

(assert (=> b!148661 (= res!124442 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!231809))))

(declare-fun b!148662 () Bool)

(declare-fun lt!231812 () (_ BitVec 64))

(assert (=> b!148662 (= e!99188 (bvsle lt!231809 (bvmul lt!231812 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!148662 (or (= lt!231812 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!231812 #b0000000000000000000000000000000000000000000000000000000000001000) lt!231812)))))

(assert (=> b!148662 (= lt!231812 ((_ sign_extend 32) (size!3014 (buf!3479 (_1!6951 lt!230945)))))))

(assert (= (and d!48541 res!124443) b!148661))

(assert (= (and b!148661 res!124442) b!148662))

(declare-fun m!231007 () Bool)

(assert (=> d!48541 m!231007))

(declare-fun m!231009 () Bool)

(assert (=> d!48541 m!231009))

(assert (=> d!48128 d!48541))

(declare-fun d!48543 () Bool)

(declare-fun e!99189 () Bool)

(assert (=> d!48543 e!99189))

(declare-fun res!124445 () Bool)

(assert (=> d!48543 (=> (not res!124445) (not e!99189))))

(declare-fun lt!231815 () (_ BitVec 64))

(declare-fun lt!231816 () (_ BitVec 64))

(declare-fun lt!231814 () (_ BitVec 64))

(assert (=> d!48543 (= res!124445 (= lt!231815 (bvsub lt!231814 lt!231816)))))

(assert (=> d!48543 (or (= (bvand lt!231814 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!231816 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!231814 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!231814 lt!231816) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48543 (= lt!231816 (remainingBits!0 ((_ sign_extend 32) (size!3014 (buf!3479 (_1!6951 lt!230946)))) ((_ sign_extend 32) (currentByte!6387 (_1!6951 lt!230946))) ((_ sign_extend 32) (currentBit!6382 (_1!6951 lt!230946)))))))

(declare-fun lt!231813 () (_ BitVec 64))

(declare-fun lt!231817 () (_ BitVec 64))

(assert (=> d!48543 (= lt!231814 (bvmul lt!231813 lt!231817))))

(assert (=> d!48543 (or (= lt!231813 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!231817 (bvsdiv (bvmul lt!231813 lt!231817) lt!231813)))))

(assert (=> d!48543 (= lt!231817 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!48543 (= lt!231813 ((_ sign_extend 32) (size!3014 (buf!3479 (_1!6951 lt!230946)))))))

(assert (=> d!48543 (= lt!231815 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6387 (_1!6951 lt!230946))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6382 (_1!6951 lt!230946)))))))

(assert (=> d!48543 (invariant!0 (currentBit!6382 (_1!6951 lt!230946)) (currentByte!6387 (_1!6951 lt!230946)) (size!3014 (buf!3479 (_1!6951 lt!230946))))))

(assert (=> d!48543 (= (bitIndex!0 (size!3014 (buf!3479 (_1!6951 lt!230946))) (currentByte!6387 (_1!6951 lt!230946)) (currentBit!6382 (_1!6951 lt!230946))) lt!231815)))

(declare-fun b!148663 () Bool)

(declare-fun res!124444 () Bool)

(assert (=> b!148663 (=> (not res!124444) (not e!99189))))

(assert (=> b!148663 (= res!124444 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!231815))))

(declare-fun b!148664 () Bool)

(declare-fun lt!231818 () (_ BitVec 64))

(assert (=> b!148664 (= e!99189 (bvsle lt!231815 (bvmul lt!231818 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!148664 (or (= lt!231818 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!231818 #b0000000000000000000000000000000000000000000000000000000000001000) lt!231818)))))

(assert (=> b!148664 (= lt!231818 ((_ sign_extend 32) (size!3014 (buf!3479 (_1!6951 lt!230946)))))))

(assert (= (and d!48543 res!124445) b!148663))

(assert (= (and b!148663 res!124444) b!148664))

(declare-fun m!231011 () Bool)

(assert (=> d!48543 m!231011))

(declare-fun m!231013 () Bool)

(assert (=> d!48543 m!231013))

(assert (=> d!48128 d!48543))

(declare-fun d!48545 () Bool)

(declare-fun lt!231819 () tuple2!13200)

(assert (=> d!48545 (= lt!231819 (readByte!0 lt!230943))))

(assert (=> d!48545 (= (readBytePure!0 lt!230943) (tuple2!13185 (_2!6961 lt!231819) (_1!6961 lt!231819)))))

(declare-fun bs!11838 () Bool)

(assert (= bs!11838 d!48545))

(declare-fun m!231015 () Bool)

(assert (=> bs!11838 m!231015))

(assert (=> d!48128 d!48545))

(assert (=> d!48128 d!48147))

(declare-fun d!48547 () Bool)

(declare-fun res!124448 () Bool)

(declare-fun e!99191 () Bool)

(assert (=> d!48547 (=> (not res!124448) (not e!99191))))

(assert (=> d!48547 (= res!124448 (= (size!3014 (buf!3479 thiss!1634)) (size!3014 (buf!3479 (_2!6949 lt!230991)))))))

(assert (=> d!48547 (= (isPrefixOf!0 thiss!1634 (_2!6949 lt!230991)) e!99191)))

(declare-fun b!148665 () Bool)

(declare-fun res!124447 () Bool)

(assert (=> b!148665 (=> (not res!124447) (not e!99191))))

(assert (=> b!148665 (= res!124447 (bvsle (bitIndex!0 (size!3014 (buf!3479 thiss!1634)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634)) (bitIndex!0 (size!3014 (buf!3479 (_2!6949 lt!230991))) (currentByte!6387 (_2!6949 lt!230991)) (currentBit!6382 (_2!6949 lt!230991)))))))

(declare-fun b!148666 () Bool)

(declare-fun e!99190 () Bool)

(assert (=> b!148666 (= e!99191 e!99190)))

(declare-fun res!124446 () Bool)

(assert (=> b!148666 (=> res!124446 e!99190)))

(assert (=> b!148666 (= res!124446 (= (size!3014 (buf!3479 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!148667 () Bool)

(assert (=> b!148667 (= e!99190 (arrayBitRangesEq!0 (buf!3479 thiss!1634) (buf!3479 (_2!6949 lt!230991)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3014 (buf!3479 thiss!1634)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634))))))

(assert (= (and d!48547 res!124448) b!148665))

(assert (= (and b!148665 res!124447) b!148666))

(assert (= (and b!148666 (not res!124446)) b!148667))

(assert (=> b!148665 m!229129))

(assert (=> b!148665 m!229863))

(assert (=> b!148667 m!229129))

(assert (=> b!148667 m!229129))

(declare-fun m!231017 () Bool)

(assert (=> b!148667 m!231017))

(assert (=> b!148210 d!48547))

(declare-fun d!48549 () Bool)

(declare-fun res!124451 () Bool)

(declare-fun e!99193 () Bool)

(assert (=> d!48549 (=> (not res!124451) (not e!99193))))

(assert (=> d!48549 (= res!124451 (= (size!3014 (buf!3479 (_1!6950 lt!230853))) (size!3014 (buf!3479 thiss!1634))))))

(assert (=> d!48549 (= (isPrefixOf!0 (_1!6950 lt!230853) thiss!1634) e!99193)))

(declare-fun b!148668 () Bool)

(declare-fun res!124450 () Bool)

(assert (=> b!148668 (=> (not res!124450) (not e!99193))))

(assert (=> b!148668 (= res!124450 (bvsle (bitIndex!0 (size!3014 (buf!3479 (_1!6950 lt!230853))) (currentByte!6387 (_1!6950 lt!230853)) (currentBit!6382 (_1!6950 lt!230853))) (bitIndex!0 (size!3014 (buf!3479 thiss!1634)) (currentByte!6387 thiss!1634) (currentBit!6382 thiss!1634))))))

(declare-fun b!148669 () Bool)

(declare-fun e!99192 () Bool)

(assert (=> b!148669 (= e!99193 e!99192)))

(declare-fun res!124449 () Bool)

(assert (=> b!148669 (=> res!124449 e!99192)))

(assert (=> b!148669 (= res!124449 (= (size!3014 (buf!3479 (_1!6950 lt!230853))) #b00000000000000000000000000000000))))

(declare-fun b!148670 () Bool)

(assert (=> b!148670 (= e!99192 (arrayBitRangesEq!0 (buf!3479 (_1!6950 lt!230853)) (buf!3479 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3014 (buf!3479 (_1!6950 lt!230853))) (currentByte!6387 (_1!6950 lt!230853)) (currentBit!6382 (_1!6950 lt!230853)))))))

(assert (= (and d!48549 res!124451) b!148668))

(assert (= (and b!148668 res!124450) b!148669))

(assert (= (and b!148669 (not res!124449)) b!148670))

(assert (=> b!148668 m!230805))

(assert (=> b!148668 m!229129))

(assert (=> b!148670 m!230805))

(assert (=> b!148670 m!230805))

(declare-fun m!231019 () Bool)

(assert (=> b!148670 m!231019))

(assert (=> b!148159 d!48549))

(check-sat (not bm!2031) (not b!148636) (not b!148474) (not bm!2037) (not d!48361) (not bm!2036) (not b!148538) (not b!148617) (not bm!2032) (not b!148563) (not d!48425) (not b!148591) (not d!48401) (not d!48409) (not b!148668) (not b!148613) (not b!148549) (not b!148587) (not d!48463) (not d!48471) (not b!148515) (not d!48525) (not b!148667) (not b!148643) (not b!148670) (not d!48437) (not b!148581) (not b!148455) (not b!148485) (not b!148562) (not b!148609) (not d!48383) (not b!148597) (not b!148482) (not b!148627) (not b!148469) (not bm!2039) (not b!148487) (not b!148623) (not b!148593) (not b!148655) (not b!148652) (not b!148556) (not b!148535) (not b!148635) (not d!48407) (not b!148532) (not b!148458) (not b!148650) (not b!148472) (not b!148602) (not d!48535) (not bm!2030) (not d!48449) (not d!48369) (not b!148471) (not d!48461) (not bm!2038) (not d!48517) (not d!48473) (not b!148634) (not d!48371) (not b!148590) (not b!148536) (not d!48527) (not b!148520) (not b!148630) (not d!48419) (not b!148621) (not d!48491) (not d!48505) (not b!148628) (not d!48443) (not b!148465) (not b!148576) (not bm!2047) (not b!148560) (not b!148618) (not d!48529) (not b!148614) (not d!48521) (not b!148521) (not d!48543) (not b!148566) (not d!48545) (not d!48439) (not b!148552) (not b!148533) (not b!148637) (not d!48539) (not b!148551) (not d!48507) (not d!48387) (not b!148517) (not bm!2041) (not b!148645) (not b!148506) (not b!148588) (not b!148607) (not b!148456) (not b!148457) (not b!148480) (not d!48511) (not b!148554) (not d!48503) (not b!148564) (not d!48487) (not b!148583) (not bm!2045) (not d!48513) (not b!148550) (not b!148518) (not b!148611) (not b!148475) (not b!148514) (not b!148573) (not bm!2044) (not d!48479) (not bm!2042) (not d!48483) (not b!148654) (not d!48515) (not b!148620) (not b!148596) (not bm!2029) (not d!48501) (not b!148641) (not b!148505) (not d!48381) (not b!148484) (not b!148604) (not bm!2028) (not bm!2040) (not d!48421) (not d!48489) (not b!148657) (not d!48431) (not b!148534) (not b!148557) (not b!148555) (not b!148600) (not b!148594) (not b!148574) (not d!48433) (not d!48427) (not d!48415) (not d!48541) (not b!148605) (not b!148523) (not b!148649) (not d!48519) (not bm!2046) (not d!48493) (not b!148615) (not b!148512) (not b!148567) (not d!48389) (not b!148511) (not bm!2033) (not b!148580) (not d!48447) (not b!148509) (not d!48453) (not b!148508) (not b!148599) (not b!148553) (not b!148610) (not b!148473) (not bm!2043) (not d!48445) (not b!148665))
(check-sat)
