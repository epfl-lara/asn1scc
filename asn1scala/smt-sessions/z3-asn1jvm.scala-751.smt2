; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21594 () Bool)

(assert start!21594)

(declare-fun b!108708 () Bool)

(declare-fun e!71163 () Bool)

(declare-fun e!71160 () Bool)

(assert (=> b!108708 (= e!71163 (not e!71160))))

(declare-fun res!89639 () Bool)

(assert (=> b!108708 (=> res!89639 e!71160)))

(declare-datatypes ((array!4957 0))(
  ( (array!4958 (arr!2848 (Array (_ BitVec 32) (_ BitVec 8))) (size!2255 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3984 0))(
  ( (BitStream!3985 (buf!2646 array!4957) (currentByte!5182 (_ BitVec 32)) (currentBit!5177 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8972 0))(
  ( (tuple2!8973 (_1!4743 BitStream!3984) (_2!4743 (_ BitVec 64))) )
))
(declare-fun lt!163975 () tuple2!8972)

(declare-datatypes ((tuple2!8974 0))(
  ( (tuple2!8975 (_1!4744 BitStream!3984) (_2!4744 BitStream!3984)) )
))
(declare-fun lt!163967 () tuple2!8974)

(assert (=> b!108708 (= res!89639 (not (= (_1!4743 lt!163975) (_2!4744 lt!163967))))))

(declare-fun lt!163959 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3984 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8972)

(assert (=> b!108708 (= lt!163975 (readNLeastSignificantBitsLoopPure!0 (_1!4744 lt!163967) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!163959))))

(declare-datatypes ((Unit!6651 0))(
  ( (Unit!6652) )
))
(declare-datatypes ((tuple2!8976 0))(
  ( (tuple2!8977 (_1!4745 Unit!6651) (_2!4745 BitStream!3984)) )
))
(declare-fun lt!163974 () tuple2!8976)

(declare-fun lt!163953 () tuple2!8976)

(declare-fun lt!163962 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!108708 (validate_offset_bits!1 ((_ sign_extend 32) (size!2255 (buf!2646 (_2!4745 lt!163974)))) ((_ sign_extend 32) (currentByte!5182 (_2!4745 lt!163953))) ((_ sign_extend 32) (currentBit!5177 (_2!4745 lt!163953))) lt!163962)))

(declare-fun lt!163966 () Unit!6651)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3984 array!4957 (_ BitVec 64)) Unit!6651)

(assert (=> b!108708 (= lt!163966 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4745 lt!163953) (buf!2646 (_2!4745 lt!163974)) lt!163962))))

(assert (=> b!108708 (= lt!163962 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!163968 () (_ BitVec 64))

(declare-datatypes ((tuple2!8978 0))(
  ( (tuple2!8979 (_1!4746 BitStream!3984) (_2!4746 Bool)) )
))
(declare-fun lt!163954 () tuple2!8978)

(declare-fun lt!163951 () (_ BitVec 64))

(assert (=> b!108708 (= lt!163959 (bvor lt!163951 (ite (_2!4746 lt!163954) lt!163968 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!163976 () tuple2!8974)

(declare-fun lt!163972 () tuple2!8972)

(assert (=> b!108708 (= lt!163972 (readNLeastSignificantBitsLoopPure!0 (_1!4744 lt!163976) nBits!396 i!615 lt!163951))))

(declare-fun thiss!1305 () BitStream!3984)

(declare-fun lt!163955 () (_ BitVec 64))

(assert (=> b!108708 (validate_offset_bits!1 ((_ sign_extend 32) (size!2255 (buf!2646 (_2!4745 lt!163974)))) ((_ sign_extend 32) (currentByte!5182 thiss!1305)) ((_ sign_extend 32) (currentBit!5177 thiss!1305)) lt!163955)))

(declare-fun lt!163963 () Unit!6651)

(assert (=> b!108708 (= lt!163963 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2646 (_2!4745 lt!163974)) lt!163955))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!108708 (= lt!163951 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!163964 () Bool)

(assert (=> b!108708 (= (_2!4746 lt!163954) lt!163964)))

(declare-fun readBitPure!0 (BitStream!3984) tuple2!8978)

(assert (=> b!108708 (= lt!163954 (readBitPure!0 (_1!4744 lt!163976)))))

(declare-fun reader!0 (BitStream!3984 BitStream!3984) tuple2!8974)

(assert (=> b!108708 (= lt!163967 (reader!0 (_2!4745 lt!163953) (_2!4745 lt!163974)))))

(assert (=> b!108708 (= lt!163976 (reader!0 thiss!1305 (_2!4745 lt!163974)))))

(declare-fun e!71167 () Bool)

(assert (=> b!108708 e!71167))

(declare-fun res!89640 () Bool)

(assert (=> b!108708 (=> (not res!89640) (not e!71167))))

(declare-fun lt!163961 () tuple2!8978)

(declare-fun lt!163956 () tuple2!8978)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!108708 (= res!89640 (= (bitIndex!0 (size!2255 (buf!2646 (_1!4746 lt!163961))) (currentByte!5182 (_1!4746 lt!163961)) (currentBit!5177 (_1!4746 lt!163961))) (bitIndex!0 (size!2255 (buf!2646 (_1!4746 lt!163956))) (currentByte!5182 (_1!4746 lt!163956)) (currentBit!5177 (_1!4746 lt!163956)))))))

(declare-fun lt!163969 () Unit!6651)

(declare-fun lt!163958 () BitStream!3984)

(declare-fun readBitPrefixLemma!0 (BitStream!3984 BitStream!3984) Unit!6651)

(assert (=> b!108708 (= lt!163969 (readBitPrefixLemma!0 lt!163958 (_2!4745 lt!163974)))))

(assert (=> b!108708 (= lt!163956 (readBitPure!0 (BitStream!3985 (buf!2646 (_2!4745 lt!163974)) (currentByte!5182 thiss!1305) (currentBit!5177 thiss!1305))))))

(assert (=> b!108708 (= lt!163961 (readBitPure!0 lt!163958))))

(assert (=> b!108708 (= lt!163958 (BitStream!3985 (buf!2646 (_2!4745 lt!163953)) (currentByte!5182 thiss!1305) (currentBit!5177 thiss!1305)))))

(declare-fun e!71161 () Bool)

(assert (=> b!108708 e!71161))

(declare-fun res!89629 () Bool)

(assert (=> b!108708 (=> (not res!89629) (not e!71161))))

(declare-fun isPrefixOf!0 (BitStream!3984 BitStream!3984) Bool)

(assert (=> b!108708 (= res!89629 (isPrefixOf!0 thiss!1305 (_2!4745 lt!163974)))))

(declare-fun lt!163971 () Unit!6651)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3984 BitStream!3984 BitStream!3984) Unit!6651)

(assert (=> b!108708 (= lt!163971 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4745 lt!163953) (_2!4745 lt!163974)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3984 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8976)

(assert (=> b!108708 (= lt!163974 (appendNLeastSignificantBitsLoop!0 (_2!4745 lt!163953) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!71159 () Bool)

(assert (=> b!108708 e!71159))

(declare-fun res!89638 () Bool)

(assert (=> b!108708 (=> (not res!89638) (not e!71159))))

(assert (=> b!108708 (= res!89638 (= (size!2255 (buf!2646 thiss!1305)) (size!2255 (buf!2646 (_2!4745 lt!163953)))))))

(declare-fun appendBit!0 (BitStream!3984 Bool) tuple2!8976)

(assert (=> b!108708 (= lt!163953 (appendBit!0 thiss!1305 lt!163964))))

(assert (=> b!108708 (= lt!163964 (not (= (bvand v!199 lt!163968) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!108708 (= lt!163968 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!108709 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!108709 (= e!71161 (invariant!0 (currentBit!5177 thiss!1305) (currentByte!5182 thiss!1305) (size!2255 (buf!2646 (_2!4745 lt!163974)))))))

(declare-fun b!108710 () Bool)

(declare-fun e!71166 () Bool)

(declare-fun lt!163957 () tuple2!8978)

(declare-fun lt!163952 () (_ BitVec 64))

(assert (=> b!108710 (= e!71166 (= (bitIndex!0 (size!2255 (buf!2646 (_1!4746 lt!163957))) (currentByte!5182 (_1!4746 lt!163957)) (currentBit!5177 (_1!4746 lt!163957))) lt!163952))))

(declare-fun b!108711 () Bool)

(declare-fun res!89636 () Bool)

(declare-fun e!71158 () Bool)

(assert (=> b!108711 (=> (not res!89636) (not e!71158))))

(assert (=> b!108711 (= res!89636 (isPrefixOf!0 thiss!1305 (_2!4745 lt!163953)))))

(declare-fun b!108712 () Bool)

(declare-fun res!89630 () Bool)

(assert (=> b!108712 (=> (not res!89630) (not e!71161))))

(assert (=> b!108712 (= res!89630 (invariant!0 (currentBit!5177 thiss!1305) (currentByte!5182 thiss!1305) (size!2255 (buf!2646 (_2!4745 lt!163953)))))))

(declare-fun res!89632 () Bool)

(declare-fun e!71165 () Bool)

(assert (=> start!21594 (=> (not res!89632) (not e!71165))))

(assert (=> start!21594 (= res!89632 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21594 e!71165))

(assert (=> start!21594 true))

(declare-fun e!71164 () Bool)

(declare-fun inv!12 (BitStream!3984) Bool)

(assert (=> start!21594 (and (inv!12 thiss!1305) e!71164)))

(declare-fun b!108713 () Bool)

(declare-fun array_inv!2057 (array!4957) Bool)

(assert (=> b!108713 (= e!71164 (array_inv!2057 (buf!2646 thiss!1305)))))

(declare-fun b!108714 () Bool)

(declare-fun res!89633 () Bool)

(assert (=> b!108714 (=> (not res!89633) (not e!71163))))

(assert (=> b!108714 (= res!89633 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun lt!163970 () BitStream!3984)

(declare-fun lt!163973 () (_ BitVec 64))

(declare-fun e!71168 () Bool)

(declare-fun lt!163960 () (_ BitVec 64))

(declare-fun b!108715 () Bool)

(assert (=> b!108715 (= e!71168 (and (= lt!163973 (bvsub lt!163960 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!4744 lt!163967) lt!163970)) (and (= (_2!4743 lt!163972) (_2!4743 lt!163975)) (= (_1!4743 lt!163972) (_2!4744 lt!163976))))))))

(declare-fun b!108716 () Bool)

(assert (=> b!108716 (= e!71159 e!71158)))

(declare-fun res!89631 () Bool)

(assert (=> b!108716 (=> (not res!89631) (not e!71158))))

(declare-fun lt!163948 () (_ BitVec 64))

(assert (=> b!108716 (= res!89631 (= lt!163952 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!163948)))))

(assert (=> b!108716 (= lt!163952 (bitIndex!0 (size!2255 (buf!2646 (_2!4745 lt!163953))) (currentByte!5182 (_2!4745 lt!163953)) (currentBit!5177 (_2!4745 lt!163953))))))

(assert (=> b!108716 (= lt!163948 (bitIndex!0 (size!2255 (buf!2646 thiss!1305)) (currentByte!5182 thiss!1305) (currentBit!5177 thiss!1305)))))

(declare-fun b!108717 () Bool)

(declare-fun res!89641 () Bool)

(assert (=> b!108717 (=> (not res!89641) (not e!71163))))

(assert (=> b!108717 (= res!89641 (bvslt i!615 nBits!396))))

(declare-fun b!108718 () Bool)

(assert (=> b!108718 (= e!71165 e!71163)))

(declare-fun res!89635 () Bool)

(assert (=> b!108718 (=> (not res!89635) (not e!71163))))

(assert (=> b!108718 (= res!89635 (validate_offset_bits!1 ((_ sign_extend 32) (size!2255 (buf!2646 thiss!1305))) ((_ sign_extend 32) (currentByte!5182 thiss!1305)) ((_ sign_extend 32) (currentBit!5177 thiss!1305)) lt!163955))))

(assert (=> b!108718 (= lt!163955 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!108719 () Bool)

(assert (=> b!108719 (= e!71158 e!71166)))

(declare-fun res!89634 () Bool)

(assert (=> b!108719 (=> (not res!89634) (not e!71166))))

(assert (=> b!108719 (= res!89634 (and (= (_2!4746 lt!163957) lt!163964) (= (_1!4746 lt!163957) (_2!4745 lt!163953))))))

(declare-fun readerFrom!0 (BitStream!3984 (_ BitVec 32) (_ BitVec 32)) BitStream!3984)

(assert (=> b!108719 (= lt!163957 (readBitPure!0 (readerFrom!0 (_2!4745 lt!163953) (currentBit!5177 thiss!1305) (currentByte!5182 thiss!1305))))))

(declare-fun b!108720 () Bool)

(assert (=> b!108720 (= e!71167 (= (_2!4746 lt!163961) (_2!4746 lt!163956)))))

(declare-fun b!108721 () Bool)

(declare-fun lt!163949 () (_ BitVec 64))

(assert (=> b!108721 (= e!71160 (or (not (= (_1!4744 lt!163967) lt!163970)) (not (= (size!2255 (buf!2646 thiss!1305)) (size!2255 (buf!2646 (_2!4745 lt!163974))))) (not (= lt!163949 (bvadd lt!163973 lt!163955))) (bvsle (bvsub nBits!396 i!615) #b00000000000000000000000001000000)))))

(assert (=> b!108721 e!71168))

(declare-fun res!89637 () Bool)

(assert (=> b!108721 (=> (not res!89637) (not e!71168))))

(declare-fun withMovedBitIndex!0 (BitStream!3984 (_ BitVec 64)) BitStream!3984)

(assert (=> b!108721 (= res!89637 (= (_1!4744 lt!163967) (withMovedBitIndex!0 (_2!4744 lt!163967) (bvsub lt!163960 lt!163949))))))

(assert (=> b!108721 (= lt!163960 (bitIndex!0 (size!2255 (buf!2646 (_2!4745 lt!163953))) (currentByte!5182 (_2!4745 lt!163953)) (currentBit!5177 (_2!4745 lt!163953))))))

(assert (=> b!108721 (= (_1!4744 lt!163976) (withMovedBitIndex!0 (_2!4744 lt!163976) (bvsub lt!163973 lt!163949)))))

(assert (=> b!108721 (= lt!163949 (bitIndex!0 (size!2255 (buf!2646 (_2!4745 lt!163974))) (currentByte!5182 (_2!4745 lt!163974)) (currentBit!5177 (_2!4745 lt!163974))))))

(assert (=> b!108721 (= lt!163973 (bitIndex!0 (size!2255 (buf!2646 thiss!1305)) (currentByte!5182 thiss!1305) (currentBit!5177 thiss!1305)))))

(declare-fun lt!163950 () tuple2!8972)

(assert (=> b!108721 (and (= (_2!4743 lt!163972) (_2!4743 lt!163950)) (= (_1!4743 lt!163972) (_1!4743 lt!163950)))))

(declare-fun lt!163965 () Unit!6651)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3984 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6651)

(assert (=> b!108721 (= lt!163965 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4744 lt!163976) nBits!396 i!615 lt!163951))))

(assert (=> b!108721 (= lt!163950 (readNLeastSignificantBitsLoopPure!0 lt!163970 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!163959))))

(assert (=> b!108721 (= lt!163970 (withMovedBitIndex!0 (_1!4744 lt!163976) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and start!21594 res!89632) b!108718))

(assert (= (and b!108718 res!89635) b!108714))

(assert (= (and b!108714 res!89633) b!108717))

(assert (= (and b!108717 res!89641) b!108708))

(assert (= (and b!108708 res!89638) b!108716))

(assert (= (and b!108716 res!89631) b!108711))

(assert (= (and b!108711 res!89636) b!108719))

(assert (= (and b!108719 res!89634) b!108710))

(assert (= (and b!108708 res!89629) b!108712))

(assert (= (and b!108712 res!89630) b!108709))

(assert (= (and b!108708 res!89640) b!108720))

(assert (= (and b!108708 (not res!89639)) b!108721))

(assert (= (and b!108721 res!89637) b!108715))

(assert (= start!21594 b!108713))

(declare-fun m!161173 () Bool)

(assert (=> start!21594 m!161173))

(declare-fun m!161175 () Bool)

(assert (=> b!108719 m!161175))

(assert (=> b!108719 m!161175))

(declare-fun m!161177 () Bool)

(assert (=> b!108719 m!161177))

(declare-fun m!161179 () Bool)

(assert (=> b!108714 m!161179))

(declare-fun m!161181 () Bool)

(assert (=> b!108708 m!161181))

(declare-fun m!161183 () Bool)

(assert (=> b!108708 m!161183))

(declare-fun m!161185 () Bool)

(assert (=> b!108708 m!161185))

(declare-fun m!161187 () Bool)

(assert (=> b!108708 m!161187))

(declare-fun m!161189 () Bool)

(assert (=> b!108708 m!161189))

(declare-fun m!161191 () Bool)

(assert (=> b!108708 m!161191))

(declare-fun m!161193 () Bool)

(assert (=> b!108708 m!161193))

(declare-fun m!161195 () Bool)

(assert (=> b!108708 m!161195))

(declare-fun m!161197 () Bool)

(assert (=> b!108708 m!161197))

(declare-fun m!161199 () Bool)

(assert (=> b!108708 m!161199))

(declare-fun m!161201 () Bool)

(assert (=> b!108708 m!161201))

(declare-fun m!161203 () Bool)

(assert (=> b!108708 m!161203))

(declare-fun m!161205 () Bool)

(assert (=> b!108708 m!161205))

(declare-fun m!161207 () Bool)

(assert (=> b!108708 m!161207))

(declare-fun m!161209 () Bool)

(assert (=> b!108708 m!161209))

(declare-fun m!161211 () Bool)

(assert (=> b!108708 m!161211))

(declare-fun m!161213 () Bool)

(assert (=> b!108708 m!161213))

(declare-fun m!161215 () Bool)

(assert (=> b!108708 m!161215))

(declare-fun m!161217 () Bool)

(assert (=> b!108708 m!161217))

(declare-fun m!161219 () Bool)

(assert (=> b!108709 m!161219))

(declare-fun m!161221 () Bool)

(assert (=> b!108721 m!161221))

(declare-fun m!161223 () Bool)

(assert (=> b!108721 m!161223))

(declare-fun m!161225 () Bool)

(assert (=> b!108721 m!161225))

(declare-fun m!161227 () Bool)

(assert (=> b!108721 m!161227))

(declare-fun m!161229 () Bool)

(assert (=> b!108721 m!161229))

(declare-fun m!161231 () Bool)

(assert (=> b!108721 m!161231))

(declare-fun m!161233 () Bool)

(assert (=> b!108721 m!161233))

(declare-fun m!161235 () Bool)

(assert (=> b!108721 m!161235))

(declare-fun m!161237 () Bool)

(assert (=> b!108711 m!161237))

(declare-fun m!161239 () Bool)

(assert (=> b!108718 m!161239))

(declare-fun m!161241 () Bool)

(assert (=> b!108712 m!161241))

(declare-fun m!161243 () Bool)

(assert (=> b!108713 m!161243))

(assert (=> b!108716 m!161223))

(assert (=> b!108716 m!161225))

(declare-fun m!161245 () Bool)

(assert (=> b!108710 m!161245))

(check-sat (not b!108713) (not b!108719) (not b!108716) (not b!108711) (not b!108710) (not b!108714) (not b!108708) (not b!108712) (not start!21594) (not b!108721) (not b!108718) (not b!108709))
(check-sat)
