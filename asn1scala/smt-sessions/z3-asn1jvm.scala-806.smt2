; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23452 () Bool)

(assert start!23452)

(declare-fun b!119068 () Bool)

(declare-fun e!78047 () Bool)

(declare-datatypes ((array!5332 0))(
  ( (array!5333 (arr!3010 (Array (_ BitVec 32) (_ BitVec 8))) (size!2417 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4308 0))(
  ( (BitStream!4309 (buf!2839 array!5332) (currentByte!5500 (_ BitVec 32)) (currentBit!5495 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4308)

(declare-datatypes ((Unit!7329 0))(
  ( (Unit!7330) )
))
(declare-datatypes ((tuple2!9984 0))(
  ( (tuple2!9985 (_1!5257 Unit!7329) (_2!5257 BitStream!4308)) )
))
(declare-fun lt!183747 () tuple2!9984)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!119068 (= e!78047 (invariant!0 (currentBit!5495 thiss!1305) (currentByte!5500 thiss!1305) (size!2417 (buf!2839 (_2!5257 lt!183747)))))))

(declare-fun b!119069 () Bool)

(declare-fun e!78043 () Bool)

(declare-fun e!78042 () Bool)

(assert (=> b!119069 (= e!78043 e!78042)))

(declare-fun res!98556 () Bool)

(assert (=> b!119069 (=> (not res!98556) (not e!78042))))

(declare-fun lt!183744 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!119069 (= res!98556 (validate_offset_bits!1 ((_ sign_extend 32) (size!2417 (buf!2839 thiss!1305))) ((_ sign_extend 32) (currentByte!5500 thiss!1305)) ((_ sign_extend 32) (currentBit!5495 thiss!1305)) lt!183744))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!119069 (= lt!183744 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!119070 () Bool)

(declare-fun e!78045 () Bool)

(declare-fun e!78044 () Bool)

(assert (=> b!119070 (= e!78045 e!78044)))

(declare-fun res!98561 () Bool)

(assert (=> b!119070 (=> (not res!98561) (not e!78044))))

(declare-fun lt!183752 () Bool)

(declare-fun lt!183757 () tuple2!9984)

(declare-datatypes ((tuple2!9986 0))(
  ( (tuple2!9987 (_1!5258 BitStream!4308) (_2!5258 Bool)) )
))
(declare-fun lt!183753 () tuple2!9986)

(assert (=> b!119070 (= res!98561 (and (= (_2!5258 lt!183753) lt!183752) (= (_1!5258 lt!183753) (_2!5257 lt!183757))))))

(declare-fun readBitPure!0 (BitStream!4308) tuple2!9986)

(declare-fun readerFrom!0 (BitStream!4308 (_ BitVec 32) (_ BitVec 32)) BitStream!4308)

(assert (=> b!119070 (= lt!183753 (readBitPure!0 (readerFrom!0 (_2!5257 lt!183757) (currentBit!5495 thiss!1305) (currentByte!5500 thiss!1305))))))

(declare-fun b!119071 () Bool)

(declare-fun e!78046 () Bool)

(assert (=> b!119071 (= e!78042 (not e!78046))))

(declare-fun res!98557 () Bool)

(assert (=> b!119071 (=> res!98557 e!78046)))

(declare-fun lt!183764 () (_ BitVec 64))

(declare-datatypes ((tuple2!9988 0))(
  ( (tuple2!9989 (_1!5259 BitStream!4308) (_2!5259 BitStream!4308)) )
))
(declare-fun lt!183754 () tuple2!9988)

(declare-datatypes ((tuple2!9990 0))(
  ( (tuple2!9991 (_1!5260 BitStream!4308) (_2!5260 (_ BitVec 64))) )
))
(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4308 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9990)

(assert (=> b!119071 (= res!98557 (not (= (_1!5260 (readNLeastSignificantBitsLoopPure!0 (_1!5259 lt!183754) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!183764)) (_2!5259 lt!183754))))))

(declare-fun lt!183765 () (_ BitVec 64))

(assert (=> b!119071 (validate_offset_bits!1 ((_ sign_extend 32) (size!2417 (buf!2839 (_2!5257 lt!183747)))) ((_ sign_extend 32) (currentByte!5500 (_2!5257 lt!183757))) ((_ sign_extend 32) (currentBit!5495 (_2!5257 lt!183757))) lt!183765)))

(declare-fun lt!183756 () Unit!7329)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4308 array!5332 (_ BitVec 64)) Unit!7329)

(assert (=> b!119071 (= lt!183756 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5257 lt!183757) (buf!2839 (_2!5257 lt!183747)) lt!183765))))

(assert (=> b!119071 (= lt!183765 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!183745 () (_ BitVec 64))

(declare-fun lt!183755 () (_ BitVec 64))

(declare-fun lt!183762 () tuple2!9986)

(assert (=> b!119071 (= lt!183764 (bvor lt!183755 (ite (_2!5258 lt!183762) lt!183745 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!183750 () tuple2!9988)

(declare-fun lt!183746 () tuple2!9990)

(assert (=> b!119071 (= lt!183746 (readNLeastSignificantBitsLoopPure!0 (_1!5259 lt!183750) nBits!396 i!615 lt!183755))))

(assert (=> b!119071 (validate_offset_bits!1 ((_ sign_extend 32) (size!2417 (buf!2839 (_2!5257 lt!183747)))) ((_ sign_extend 32) (currentByte!5500 thiss!1305)) ((_ sign_extend 32) (currentBit!5495 thiss!1305)) lt!183744)))

(declare-fun lt!183763 () Unit!7329)

(assert (=> b!119071 (= lt!183763 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2839 (_2!5257 lt!183747)) lt!183744))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!119071 (= lt!183755 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!119071 (= (_2!5258 lt!183762) lt!183752)))

(assert (=> b!119071 (= lt!183762 (readBitPure!0 (_1!5259 lt!183750)))))

(declare-fun reader!0 (BitStream!4308 BitStream!4308) tuple2!9988)

(assert (=> b!119071 (= lt!183754 (reader!0 (_2!5257 lt!183757) (_2!5257 lt!183747)))))

(assert (=> b!119071 (= lt!183750 (reader!0 thiss!1305 (_2!5257 lt!183747)))))

(declare-fun e!78040 () Bool)

(assert (=> b!119071 e!78040))

(declare-fun res!98558 () Bool)

(assert (=> b!119071 (=> (not res!98558) (not e!78040))))

(declare-fun lt!183742 () tuple2!9986)

(declare-fun lt!183743 () tuple2!9986)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!119071 (= res!98558 (= (bitIndex!0 (size!2417 (buf!2839 (_1!5258 lt!183742))) (currentByte!5500 (_1!5258 lt!183742)) (currentBit!5495 (_1!5258 lt!183742))) (bitIndex!0 (size!2417 (buf!2839 (_1!5258 lt!183743))) (currentByte!5500 (_1!5258 lt!183743)) (currentBit!5495 (_1!5258 lt!183743)))))))

(declare-fun lt!183760 () Unit!7329)

(declare-fun lt!183761 () BitStream!4308)

(declare-fun readBitPrefixLemma!0 (BitStream!4308 BitStream!4308) Unit!7329)

(assert (=> b!119071 (= lt!183760 (readBitPrefixLemma!0 lt!183761 (_2!5257 lt!183747)))))

(assert (=> b!119071 (= lt!183743 (readBitPure!0 (BitStream!4309 (buf!2839 (_2!5257 lt!183747)) (currentByte!5500 thiss!1305) (currentBit!5495 thiss!1305))))))

(assert (=> b!119071 (= lt!183742 (readBitPure!0 lt!183761))))

(assert (=> b!119071 (= lt!183761 (BitStream!4309 (buf!2839 (_2!5257 lt!183757)) (currentByte!5500 thiss!1305) (currentBit!5495 thiss!1305)))))

(assert (=> b!119071 e!78047))

(declare-fun res!98562 () Bool)

(assert (=> b!119071 (=> (not res!98562) (not e!78047))))

(declare-fun isPrefixOf!0 (BitStream!4308 BitStream!4308) Bool)

(assert (=> b!119071 (= res!98562 (isPrefixOf!0 thiss!1305 (_2!5257 lt!183747)))))

(declare-fun lt!183758 () Unit!7329)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4308 BitStream!4308 BitStream!4308) Unit!7329)

(assert (=> b!119071 (= lt!183758 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5257 lt!183757) (_2!5257 lt!183747)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4308 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9984)

(assert (=> b!119071 (= lt!183747 (appendNLeastSignificantBitsLoop!0 (_2!5257 lt!183757) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!78041 () Bool)

(assert (=> b!119071 e!78041))

(declare-fun res!98551 () Bool)

(assert (=> b!119071 (=> (not res!98551) (not e!78041))))

(assert (=> b!119071 (= res!98551 (= (size!2417 (buf!2839 thiss!1305)) (size!2417 (buf!2839 (_2!5257 lt!183757)))))))

(declare-fun appendBit!0 (BitStream!4308 Bool) tuple2!9984)

(assert (=> b!119071 (= lt!183757 (appendBit!0 thiss!1305 lt!183752))))

(assert (=> b!119071 (= lt!183752 (not (= (bvand v!199 lt!183745) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119071 (= lt!183745 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!119072 () Bool)

(declare-fun lt!183759 () (_ BitVec 64))

(assert (=> b!119072 (= e!78044 (= (bitIndex!0 (size!2417 (buf!2839 (_1!5258 lt!183753))) (currentByte!5500 (_1!5258 lt!183753)) (currentBit!5495 (_1!5258 lt!183753))) lt!183759))))

(declare-fun b!119073 () Bool)

(assert (=> b!119073 (= e!78040 (= (_2!5258 lt!183742) (_2!5258 lt!183743)))))

(declare-fun b!119074 () Bool)

(declare-fun e!78039 () Bool)

(declare-fun array_inv!2219 (array!5332) Bool)

(assert (=> b!119074 (= e!78039 (array_inv!2219 (buf!2839 thiss!1305)))))

(declare-fun b!119075 () Bool)

(declare-fun res!98559 () Bool)

(assert (=> b!119075 (=> (not res!98559) (not e!78042))))

(assert (=> b!119075 (= res!98559 (bvslt i!615 nBits!396))))

(declare-fun b!119076 () Bool)

(assert (=> b!119076 (= e!78041 e!78045)))

(declare-fun res!98554 () Bool)

(assert (=> b!119076 (=> (not res!98554) (not e!78045))))

(declare-fun lt!183748 () (_ BitVec 64))

(assert (=> b!119076 (= res!98554 (= lt!183759 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!183748)))))

(assert (=> b!119076 (= lt!183759 (bitIndex!0 (size!2417 (buf!2839 (_2!5257 lt!183757))) (currentByte!5500 (_2!5257 lt!183757)) (currentBit!5495 (_2!5257 lt!183757))))))

(assert (=> b!119076 (= lt!183748 (bitIndex!0 (size!2417 (buf!2839 thiss!1305)) (currentByte!5500 thiss!1305) (currentBit!5495 thiss!1305)))))

(declare-fun b!119077 () Bool)

(declare-fun res!98555 () Bool)

(assert (=> b!119077 (=> (not res!98555) (not e!78042))))

(assert (=> b!119077 (= res!98555 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!119078 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!4308 (_ BitVec 64)) BitStream!4308)

(assert (=> b!119078 (= e!78046 (= (_1!5259 lt!183750) (withMovedBitIndex!0 (_2!5259 lt!183750) (bvsub (bitIndex!0 (size!2417 (buf!2839 thiss!1305)) (currentByte!5500 thiss!1305) (currentBit!5495 thiss!1305)) (bitIndex!0 (size!2417 (buf!2839 (_2!5257 lt!183747))) (currentByte!5500 (_2!5257 lt!183747)) (currentBit!5495 (_2!5257 lt!183747)))))))))

(declare-fun lt!183751 () tuple2!9990)

(assert (=> b!119078 (and (= (_2!5260 lt!183746) (_2!5260 lt!183751)) (= (_1!5260 lt!183746) (_1!5260 lt!183751)))))

(declare-fun lt!183749 () Unit!7329)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4308 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7329)

(assert (=> b!119078 (= lt!183749 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5259 lt!183750) nBits!396 i!615 lt!183755))))

(assert (=> b!119078 (= lt!183751 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5259 lt!183750) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!183764))))

(declare-fun res!98560 () Bool)

(assert (=> start!23452 (=> (not res!98560) (not e!78043))))

(assert (=> start!23452 (= res!98560 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23452 e!78043))

(assert (=> start!23452 true))

(declare-fun inv!12 (BitStream!4308) Bool)

(assert (=> start!23452 (and (inv!12 thiss!1305) e!78039)))

(declare-fun b!119079 () Bool)

(declare-fun res!98552 () Bool)

(assert (=> b!119079 (=> (not res!98552) (not e!78047))))

(assert (=> b!119079 (= res!98552 (invariant!0 (currentBit!5495 thiss!1305) (currentByte!5500 thiss!1305) (size!2417 (buf!2839 (_2!5257 lt!183757)))))))

(declare-fun b!119080 () Bool)

(declare-fun res!98553 () Bool)

(assert (=> b!119080 (=> (not res!98553) (not e!78045))))

(assert (=> b!119080 (= res!98553 (isPrefixOf!0 thiss!1305 (_2!5257 lt!183757)))))

(assert (= (and start!23452 res!98560) b!119069))

(assert (= (and b!119069 res!98556) b!119077))

(assert (= (and b!119077 res!98555) b!119075))

(assert (= (and b!119075 res!98559) b!119071))

(assert (= (and b!119071 res!98551) b!119076))

(assert (= (and b!119076 res!98554) b!119080))

(assert (= (and b!119080 res!98553) b!119070))

(assert (= (and b!119070 res!98561) b!119072))

(assert (= (and b!119071 res!98562) b!119079))

(assert (= (and b!119079 res!98552) b!119068))

(assert (= (and b!119071 res!98558) b!119073))

(assert (= (and b!119071 (not res!98557)) b!119078))

(assert (= start!23452 b!119074))

(declare-fun m!179123 () Bool)

(assert (=> b!119069 m!179123))

(declare-fun m!179125 () Bool)

(assert (=> b!119079 m!179125))

(declare-fun m!179127 () Bool)

(assert (=> b!119074 m!179127))

(declare-fun m!179129 () Bool)

(assert (=> b!119071 m!179129))

(declare-fun m!179131 () Bool)

(assert (=> b!119071 m!179131))

(declare-fun m!179133 () Bool)

(assert (=> b!119071 m!179133))

(declare-fun m!179135 () Bool)

(assert (=> b!119071 m!179135))

(declare-fun m!179137 () Bool)

(assert (=> b!119071 m!179137))

(declare-fun m!179139 () Bool)

(assert (=> b!119071 m!179139))

(declare-fun m!179141 () Bool)

(assert (=> b!119071 m!179141))

(declare-fun m!179143 () Bool)

(assert (=> b!119071 m!179143))

(declare-fun m!179145 () Bool)

(assert (=> b!119071 m!179145))

(declare-fun m!179147 () Bool)

(assert (=> b!119071 m!179147))

(declare-fun m!179149 () Bool)

(assert (=> b!119071 m!179149))

(declare-fun m!179151 () Bool)

(assert (=> b!119071 m!179151))

(declare-fun m!179153 () Bool)

(assert (=> b!119071 m!179153))

(declare-fun m!179155 () Bool)

(assert (=> b!119071 m!179155))

(declare-fun m!179157 () Bool)

(assert (=> b!119071 m!179157))

(declare-fun m!179159 () Bool)

(assert (=> b!119071 m!179159))

(declare-fun m!179161 () Bool)

(assert (=> b!119071 m!179161))

(declare-fun m!179163 () Bool)

(assert (=> b!119071 m!179163))

(declare-fun m!179165 () Bool)

(assert (=> b!119071 m!179165))

(declare-fun m!179167 () Bool)

(assert (=> b!119076 m!179167))

(declare-fun m!179169 () Bool)

(assert (=> b!119076 m!179169))

(declare-fun m!179171 () Bool)

(assert (=> b!119070 m!179171))

(assert (=> b!119070 m!179171))

(declare-fun m!179173 () Bool)

(assert (=> b!119070 m!179173))

(declare-fun m!179175 () Bool)

(assert (=> b!119080 m!179175))

(declare-fun m!179177 () Bool)

(assert (=> b!119077 m!179177))

(declare-fun m!179179 () Bool)

(assert (=> b!119072 m!179179))

(declare-fun m!179181 () Bool)

(assert (=> start!23452 m!179181))

(declare-fun m!179183 () Bool)

(assert (=> b!119068 m!179183))

(declare-fun m!179185 () Bool)

(assert (=> b!119078 m!179185))

(declare-fun m!179187 () Bool)

(assert (=> b!119078 m!179187))

(assert (=> b!119078 m!179169))

(declare-fun m!179189 () Bool)

(assert (=> b!119078 m!179189))

(declare-fun m!179191 () Bool)

(assert (=> b!119078 m!179191))

(assert (=> b!119078 m!179185))

(declare-fun m!179193 () Bool)

(assert (=> b!119078 m!179193))

(check-sat (not b!119074) (not b!119070) (not b!119079) (not b!119069) (not start!23452) (not b!119072) (not b!119080) (not b!119071) (not b!119076) (not b!119077) (not b!119078) (not b!119068))
(check-sat)
(get-model)

(declare-fun d!38184 () Bool)

(assert (=> d!38184 (= (array_inv!2219 (buf!2839 thiss!1305)) (bvsge (size!2417 (buf!2839 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!119074 d!38184))

(declare-fun d!38186 () Bool)

(declare-fun e!78133 () Bool)

(assert (=> d!38186 e!78133))

(declare-fun res!98686 () Bool)

(assert (=> d!38186 (=> (not res!98686) (not e!78133))))

(declare-fun lt!184136 () (_ BitVec 64))

(declare-fun lt!184140 () (_ BitVec 64))

(declare-fun lt!184138 () (_ BitVec 64))

(assert (=> d!38186 (= res!98686 (= lt!184140 (bvsub lt!184136 lt!184138)))))

(assert (=> d!38186 (or (= (bvand lt!184136 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!184138 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!184136 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!184136 lt!184138) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!38186 (= lt!184138 (remainingBits!0 ((_ sign_extend 32) (size!2417 (buf!2839 (_2!5257 lt!183757)))) ((_ sign_extend 32) (currentByte!5500 (_2!5257 lt!183757))) ((_ sign_extend 32) (currentBit!5495 (_2!5257 lt!183757)))))))

(declare-fun lt!184141 () (_ BitVec 64))

(declare-fun lt!184137 () (_ BitVec 64))

(assert (=> d!38186 (= lt!184136 (bvmul lt!184141 lt!184137))))

(assert (=> d!38186 (or (= lt!184141 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!184137 (bvsdiv (bvmul lt!184141 lt!184137) lt!184141)))))

(assert (=> d!38186 (= lt!184137 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38186 (= lt!184141 ((_ sign_extend 32) (size!2417 (buf!2839 (_2!5257 lt!183757)))))))

(assert (=> d!38186 (= lt!184140 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5500 (_2!5257 lt!183757))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5495 (_2!5257 lt!183757)))))))

(assert (=> d!38186 (invariant!0 (currentBit!5495 (_2!5257 lt!183757)) (currentByte!5500 (_2!5257 lt!183757)) (size!2417 (buf!2839 (_2!5257 lt!183757))))))

(assert (=> d!38186 (= (bitIndex!0 (size!2417 (buf!2839 (_2!5257 lt!183757))) (currentByte!5500 (_2!5257 lt!183757)) (currentBit!5495 (_2!5257 lt!183757))) lt!184140)))

(declare-fun b!119223 () Bool)

(declare-fun res!98687 () Bool)

(assert (=> b!119223 (=> (not res!98687) (not e!78133))))

(assert (=> b!119223 (= res!98687 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!184140))))

(declare-fun b!119224 () Bool)

(declare-fun lt!184139 () (_ BitVec 64))

(assert (=> b!119224 (= e!78133 (bvsle lt!184140 (bvmul lt!184139 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!119224 (or (= lt!184139 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!184139 #b0000000000000000000000000000000000000000000000000000000000001000) lt!184139)))))

(assert (=> b!119224 (= lt!184139 ((_ sign_extend 32) (size!2417 (buf!2839 (_2!5257 lt!183757)))))))

(assert (= (and d!38186 res!98686) b!119223))

(assert (= (and b!119223 res!98687) b!119224))

(declare-fun m!179467 () Bool)

(assert (=> d!38186 m!179467))

(declare-fun m!179469 () Bool)

(assert (=> d!38186 m!179469))

(assert (=> b!119076 d!38186))

(declare-fun d!38188 () Bool)

(declare-fun e!78134 () Bool)

(assert (=> d!38188 e!78134))

(declare-fun res!98688 () Bool)

(assert (=> d!38188 (=> (not res!98688) (not e!78134))))

(declare-fun lt!184144 () (_ BitVec 64))

(declare-fun lt!184146 () (_ BitVec 64))

(declare-fun lt!184142 () (_ BitVec 64))

(assert (=> d!38188 (= res!98688 (= lt!184146 (bvsub lt!184142 lt!184144)))))

(assert (=> d!38188 (or (= (bvand lt!184142 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!184144 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!184142 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!184142 lt!184144) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38188 (= lt!184144 (remainingBits!0 ((_ sign_extend 32) (size!2417 (buf!2839 thiss!1305))) ((_ sign_extend 32) (currentByte!5500 thiss!1305)) ((_ sign_extend 32) (currentBit!5495 thiss!1305))))))

(declare-fun lt!184147 () (_ BitVec 64))

(declare-fun lt!184143 () (_ BitVec 64))

(assert (=> d!38188 (= lt!184142 (bvmul lt!184147 lt!184143))))

(assert (=> d!38188 (or (= lt!184147 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!184143 (bvsdiv (bvmul lt!184147 lt!184143) lt!184147)))))

(assert (=> d!38188 (= lt!184143 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38188 (= lt!184147 ((_ sign_extend 32) (size!2417 (buf!2839 thiss!1305))))))

(assert (=> d!38188 (= lt!184146 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5500 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5495 thiss!1305))))))

(assert (=> d!38188 (invariant!0 (currentBit!5495 thiss!1305) (currentByte!5500 thiss!1305) (size!2417 (buf!2839 thiss!1305)))))

(assert (=> d!38188 (= (bitIndex!0 (size!2417 (buf!2839 thiss!1305)) (currentByte!5500 thiss!1305) (currentBit!5495 thiss!1305)) lt!184146)))

(declare-fun b!119225 () Bool)

(declare-fun res!98689 () Bool)

(assert (=> b!119225 (=> (not res!98689) (not e!78134))))

(assert (=> b!119225 (= res!98689 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!184146))))

(declare-fun b!119226 () Bool)

(declare-fun lt!184145 () (_ BitVec 64))

(assert (=> b!119226 (= e!78134 (bvsle lt!184146 (bvmul lt!184145 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!119226 (or (= lt!184145 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!184145 #b0000000000000000000000000000000000000000000000000000000000001000) lt!184145)))))

(assert (=> b!119226 (= lt!184145 ((_ sign_extend 32) (size!2417 (buf!2839 thiss!1305))))))

(assert (= (and d!38188 res!98688) b!119225))

(assert (= (and b!119225 res!98689) b!119226))

(declare-fun m!179471 () Bool)

(assert (=> d!38188 m!179471))

(declare-fun m!179473 () Bool)

(assert (=> d!38188 m!179473))

(assert (=> b!119076 d!38188))

(declare-fun d!38190 () Bool)

(declare-fun e!78135 () Bool)

(assert (=> d!38190 e!78135))

(declare-fun res!98690 () Bool)

(assert (=> d!38190 (=> (not res!98690) (not e!78135))))

(declare-fun lt!184148 () (_ BitVec 64))

(declare-fun lt!184152 () (_ BitVec 64))

(declare-fun lt!184150 () (_ BitVec 64))

(assert (=> d!38190 (= res!98690 (= lt!184152 (bvsub lt!184148 lt!184150)))))

(assert (=> d!38190 (or (= (bvand lt!184148 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!184150 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!184148 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!184148 lt!184150) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38190 (= lt!184150 (remainingBits!0 ((_ sign_extend 32) (size!2417 (buf!2839 (_1!5258 lt!183753)))) ((_ sign_extend 32) (currentByte!5500 (_1!5258 lt!183753))) ((_ sign_extend 32) (currentBit!5495 (_1!5258 lt!183753)))))))

(declare-fun lt!184153 () (_ BitVec 64))

(declare-fun lt!184149 () (_ BitVec 64))

(assert (=> d!38190 (= lt!184148 (bvmul lt!184153 lt!184149))))

(assert (=> d!38190 (or (= lt!184153 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!184149 (bvsdiv (bvmul lt!184153 lt!184149) lt!184153)))))

(assert (=> d!38190 (= lt!184149 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38190 (= lt!184153 ((_ sign_extend 32) (size!2417 (buf!2839 (_1!5258 lt!183753)))))))

(assert (=> d!38190 (= lt!184152 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5500 (_1!5258 lt!183753))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5495 (_1!5258 lt!183753)))))))

(assert (=> d!38190 (invariant!0 (currentBit!5495 (_1!5258 lt!183753)) (currentByte!5500 (_1!5258 lt!183753)) (size!2417 (buf!2839 (_1!5258 lt!183753))))))

(assert (=> d!38190 (= (bitIndex!0 (size!2417 (buf!2839 (_1!5258 lt!183753))) (currentByte!5500 (_1!5258 lt!183753)) (currentBit!5495 (_1!5258 lt!183753))) lt!184152)))

(declare-fun b!119227 () Bool)

(declare-fun res!98691 () Bool)

(assert (=> b!119227 (=> (not res!98691) (not e!78135))))

(assert (=> b!119227 (= res!98691 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!184152))))

(declare-fun b!119228 () Bool)

(declare-fun lt!184151 () (_ BitVec 64))

(assert (=> b!119228 (= e!78135 (bvsle lt!184152 (bvmul lt!184151 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!119228 (or (= lt!184151 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!184151 #b0000000000000000000000000000000000000000000000000000000000001000) lt!184151)))))

(assert (=> b!119228 (= lt!184151 ((_ sign_extend 32) (size!2417 (buf!2839 (_1!5258 lt!183753)))))))

(assert (= (and d!38190 res!98690) b!119227))

(assert (= (and b!119227 res!98691) b!119228))

(declare-fun m!179475 () Bool)

(assert (=> d!38190 m!179475))

(declare-fun m!179477 () Bool)

(assert (=> d!38190 m!179477))

(assert (=> b!119072 d!38190))

(declare-fun d!38192 () Bool)

(assert (=> d!38192 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!119071 d!38192))

(declare-fun d!38194 () Bool)

(declare-datatypes ((tuple2!10008 0))(
  ( (tuple2!10009 (_1!5269 Bool) (_2!5269 BitStream!4308)) )
))
(declare-fun lt!184156 () tuple2!10008)

(declare-fun readBit!0 (BitStream!4308) tuple2!10008)

(assert (=> d!38194 (= lt!184156 (readBit!0 (_1!5259 lt!183750)))))

(assert (=> d!38194 (= (readBitPure!0 (_1!5259 lt!183750)) (tuple2!9987 (_2!5269 lt!184156) (_1!5269 lt!184156)))))

(declare-fun bs!9242 () Bool)

(assert (= bs!9242 d!38194))

(declare-fun m!179479 () Bool)

(assert (=> bs!9242 m!179479))

(assert (=> b!119071 d!38194))

(declare-fun b!119241 () Bool)

(declare-fun e!78141 () Bool)

(declare-fun lt!184165 () tuple2!9986)

(declare-fun lt!184168 () tuple2!9984)

(assert (=> b!119241 (= e!78141 (= (bitIndex!0 (size!2417 (buf!2839 (_1!5258 lt!184165))) (currentByte!5500 (_1!5258 lt!184165)) (currentBit!5495 (_1!5258 lt!184165))) (bitIndex!0 (size!2417 (buf!2839 (_2!5257 lt!184168))) (currentByte!5500 (_2!5257 lt!184168)) (currentBit!5495 (_2!5257 lt!184168)))))))

(declare-fun d!38196 () Bool)

(declare-fun e!78140 () Bool)

(assert (=> d!38196 e!78140))

(declare-fun res!98700 () Bool)

(assert (=> d!38196 (=> (not res!98700) (not e!78140))))

(assert (=> d!38196 (= res!98700 (= (size!2417 (buf!2839 thiss!1305)) (size!2417 (buf!2839 (_2!5257 lt!184168)))))))

(declare-fun choose!16 (BitStream!4308 Bool) tuple2!9984)

(assert (=> d!38196 (= lt!184168 (choose!16 thiss!1305 lt!183752))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!38196 (validate_offset_bit!0 ((_ sign_extend 32) (size!2417 (buf!2839 thiss!1305))) ((_ sign_extend 32) (currentByte!5500 thiss!1305)) ((_ sign_extend 32) (currentBit!5495 thiss!1305)))))

(assert (=> d!38196 (= (appendBit!0 thiss!1305 lt!183752) lt!184168)))

(declare-fun b!119240 () Bool)

(assert (=> b!119240 (= e!78140 e!78141)))

(declare-fun res!98703 () Bool)

(assert (=> b!119240 (=> (not res!98703) (not e!78141))))

(assert (=> b!119240 (= res!98703 (and (= (_2!5258 lt!184165) lt!183752) (= (_1!5258 lt!184165) (_2!5257 lt!184168))))))

(assert (=> b!119240 (= lt!184165 (readBitPure!0 (readerFrom!0 (_2!5257 lt!184168) (currentBit!5495 thiss!1305) (currentByte!5500 thiss!1305))))))

(declare-fun b!119238 () Bool)

(declare-fun res!98702 () Bool)

(assert (=> b!119238 (=> (not res!98702) (not e!78140))))

(declare-fun lt!184167 () (_ BitVec 64))

(declare-fun lt!184166 () (_ BitVec 64))

(assert (=> b!119238 (= res!98702 (= (bitIndex!0 (size!2417 (buf!2839 (_2!5257 lt!184168))) (currentByte!5500 (_2!5257 lt!184168)) (currentBit!5495 (_2!5257 lt!184168))) (bvadd lt!184166 lt!184167)))))

(assert (=> b!119238 (or (not (= (bvand lt!184166 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!184167 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!184166 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!184166 lt!184167) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119238 (= lt!184167 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!119238 (= lt!184166 (bitIndex!0 (size!2417 (buf!2839 thiss!1305)) (currentByte!5500 thiss!1305) (currentBit!5495 thiss!1305)))))

(declare-fun b!119239 () Bool)

(declare-fun res!98701 () Bool)

(assert (=> b!119239 (=> (not res!98701) (not e!78140))))

(assert (=> b!119239 (= res!98701 (isPrefixOf!0 thiss!1305 (_2!5257 lt!184168)))))

(assert (= (and d!38196 res!98700) b!119238))

(assert (= (and b!119238 res!98702) b!119239))

(assert (= (and b!119239 res!98701) b!119240))

(assert (= (and b!119240 res!98703) b!119241))

(declare-fun m!179481 () Bool)

(assert (=> b!119238 m!179481))

(assert (=> b!119238 m!179169))

(declare-fun m!179483 () Bool)

(assert (=> d!38196 m!179483))

(declare-fun m!179485 () Bool)

(assert (=> d!38196 m!179485))

(declare-fun m!179487 () Bool)

(assert (=> b!119239 m!179487))

(declare-fun m!179489 () Bool)

(assert (=> b!119241 m!179489))

(assert (=> b!119241 m!179481))

(declare-fun m!179491 () Bool)

(assert (=> b!119240 m!179491))

(assert (=> b!119240 m!179491))

(declare-fun m!179493 () Bool)

(assert (=> b!119240 m!179493))

(assert (=> b!119071 d!38196))

(declare-fun d!38198 () Bool)

(declare-fun res!98712 () Bool)

(declare-fun e!78147 () Bool)

(assert (=> d!38198 (=> (not res!98712) (not e!78147))))

(assert (=> d!38198 (= res!98712 (= (size!2417 (buf!2839 thiss!1305)) (size!2417 (buf!2839 (_2!5257 lt!183747)))))))

(assert (=> d!38198 (= (isPrefixOf!0 thiss!1305 (_2!5257 lt!183747)) e!78147)))

(declare-fun b!119248 () Bool)

(declare-fun res!98710 () Bool)

(assert (=> b!119248 (=> (not res!98710) (not e!78147))))

(assert (=> b!119248 (= res!98710 (bvsle (bitIndex!0 (size!2417 (buf!2839 thiss!1305)) (currentByte!5500 thiss!1305) (currentBit!5495 thiss!1305)) (bitIndex!0 (size!2417 (buf!2839 (_2!5257 lt!183747))) (currentByte!5500 (_2!5257 lt!183747)) (currentBit!5495 (_2!5257 lt!183747)))))))

(declare-fun b!119249 () Bool)

(declare-fun e!78146 () Bool)

(assert (=> b!119249 (= e!78147 e!78146)))

(declare-fun res!98711 () Bool)

(assert (=> b!119249 (=> res!98711 e!78146)))

(assert (=> b!119249 (= res!98711 (= (size!2417 (buf!2839 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!119250 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5332 array!5332 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!119250 (= e!78146 (arrayBitRangesEq!0 (buf!2839 thiss!1305) (buf!2839 (_2!5257 lt!183747)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2417 (buf!2839 thiss!1305)) (currentByte!5500 thiss!1305) (currentBit!5495 thiss!1305))))))

(assert (= (and d!38198 res!98712) b!119248))

(assert (= (and b!119248 res!98710) b!119249))

(assert (= (and b!119249 (not res!98711)) b!119250))

(assert (=> b!119248 m!179169))

(assert (=> b!119248 m!179189))

(assert (=> b!119250 m!179169))

(assert (=> b!119250 m!179169))

(declare-fun m!179495 () Bool)

(assert (=> b!119250 m!179495))

(assert (=> b!119071 d!38198))

(declare-fun d!38200 () Bool)

(declare-fun lt!184169 () tuple2!10008)

(assert (=> d!38200 (= lt!184169 (readBit!0 (BitStream!4309 (buf!2839 (_2!5257 lt!183747)) (currentByte!5500 thiss!1305) (currentBit!5495 thiss!1305))))))

(assert (=> d!38200 (= (readBitPure!0 (BitStream!4309 (buf!2839 (_2!5257 lt!183747)) (currentByte!5500 thiss!1305) (currentBit!5495 thiss!1305))) (tuple2!9987 (_2!5269 lt!184169) (_1!5269 lt!184169)))))

(declare-fun bs!9243 () Bool)

(assert (= bs!9243 d!38200))

(declare-fun m!179497 () Bool)

(assert (=> bs!9243 m!179497))

(assert (=> b!119071 d!38200))

(declare-fun d!38202 () Bool)

(assert (=> d!38202 (isPrefixOf!0 thiss!1305 (_2!5257 lt!183747))))

(declare-fun lt!184172 () Unit!7329)

(declare-fun choose!30 (BitStream!4308 BitStream!4308 BitStream!4308) Unit!7329)

(assert (=> d!38202 (= lt!184172 (choose!30 thiss!1305 (_2!5257 lt!183757) (_2!5257 lt!183747)))))

(assert (=> d!38202 (isPrefixOf!0 thiss!1305 (_2!5257 lt!183757))))

(assert (=> d!38202 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5257 lt!183757) (_2!5257 lt!183747)) lt!184172)))

(declare-fun bs!9244 () Bool)

(assert (= bs!9244 d!38202))

(assert (=> bs!9244 m!179133))

(declare-fun m!179499 () Bool)

(assert (=> bs!9244 m!179499))

(assert (=> bs!9244 m!179175))

(assert (=> b!119071 d!38202))

(declare-fun d!38204 () Bool)

(declare-fun e!78148 () Bool)

(assert (=> d!38204 e!78148))

(declare-fun res!98713 () Bool)

(assert (=> d!38204 (=> (not res!98713) (not e!78148))))

(declare-fun lt!184173 () (_ BitVec 64))

(declare-fun lt!184177 () (_ BitVec 64))

(declare-fun lt!184175 () (_ BitVec 64))

(assert (=> d!38204 (= res!98713 (= lt!184177 (bvsub lt!184173 lt!184175)))))

(assert (=> d!38204 (or (= (bvand lt!184173 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!184175 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!184173 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!184173 lt!184175) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38204 (= lt!184175 (remainingBits!0 ((_ sign_extend 32) (size!2417 (buf!2839 (_1!5258 lt!183743)))) ((_ sign_extend 32) (currentByte!5500 (_1!5258 lt!183743))) ((_ sign_extend 32) (currentBit!5495 (_1!5258 lt!183743)))))))

(declare-fun lt!184178 () (_ BitVec 64))

(declare-fun lt!184174 () (_ BitVec 64))

(assert (=> d!38204 (= lt!184173 (bvmul lt!184178 lt!184174))))

(assert (=> d!38204 (or (= lt!184178 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!184174 (bvsdiv (bvmul lt!184178 lt!184174) lt!184178)))))

(assert (=> d!38204 (= lt!184174 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38204 (= lt!184178 ((_ sign_extend 32) (size!2417 (buf!2839 (_1!5258 lt!183743)))))))

(assert (=> d!38204 (= lt!184177 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5500 (_1!5258 lt!183743))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5495 (_1!5258 lt!183743)))))))

(assert (=> d!38204 (invariant!0 (currentBit!5495 (_1!5258 lt!183743)) (currentByte!5500 (_1!5258 lt!183743)) (size!2417 (buf!2839 (_1!5258 lt!183743))))))

(assert (=> d!38204 (= (bitIndex!0 (size!2417 (buf!2839 (_1!5258 lt!183743))) (currentByte!5500 (_1!5258 lt!183743)) (currentBit!5495 (_1!5258 lt!183743))) lt!184177)))

(declare-fun b!119251 () Bool)

(declare-fun res!98714 () Bool)

(assert (=> b!119251 (=> (not res!98714) (not e!78148))))

(assert (=> b!119251 (= res!98714 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!184177))))

(declare-fun b!119252 () Bool)

(declare-fun lt!184176 () (_ BitVec 64))

(assert (=> b!119252 (= e!78148 (bvsle lt!184177 (bvmul lt!184176 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!119252 (or (= lt!184176 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!184176 #b0000000000000000000000000000000000000000000000000000000000001000) lt!184176)))))

(assert (=> b!119252 (= lt!184176 ((_ sign_extend 32) (size!2417 (buf!2839 (_1!5258 lt!183743)))))))

(assert (= (and d!38204 res!98713) b!119251))

(assert (= (and b!119251 res!98714) b!119252))

(declare-fun m!179501 () Bool)

(assert (=> d!38204 m!179501))

(declare-fun m!179503 () Bool)

(assert (=> d!38204 m!179503))

(assert (=> b!119071 d!38204))

(declare-fun d!38206 () Bool)

(declare-datatypes ((tuple2!10010 0))(
  ( (tuple2!10011 (_1!5270 (_ BitVec 64)) (_2!5270 BitStream!4308)) )
))
(declare-fun lt!184181 () tuple2!10010)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4308 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10010)

(assert (=> d!38206 (= lt!184181 (readNLeastSignificantBitsLoop!0 (_1!5259 lt!183754) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!183764))))

(assert (=> d!38206 (= (readNLeastSignificantBitsLoopPure!0 (_1!5259 lt!183754) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!183764) (tuple2!9991 (_2!5270 lt!184181) (_1!5270 lt!184181)))))

(declare-fun bs!9245 () Bool)

(assert (= bs!9245 d!38206))

(declare-fun m!179505 () Bool)

(assert (=> bs!9245 m!179505))

(assert (=> b!119071 d!38206))

(declare-fun d!38208 () Bool)

(assert (=> d!38208 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2417 (buf!2839 (_2!5257 lt!183747)))) ((_ sign_extend 32) (currentByte!5500 thiss!1305)) ((_ sign_extend 32) (currentBit!5495 thiss!1305)) lt!183744) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2417 (buf!2839 (_2!5257 lt!183747)))) ((_ sign_extend 32) (currentByte!5500 thiss!1305)) ((_ sign_extend 32) (currentBit!5495 thiss!1305))) lt!183744))))

(declare-fun bs!9246 () Bool)

(assert (= bs!9246 d!38208))

(declare-fun m!179507 () Bool)

(assert (=> bs!9246 m!179507))

(assert (=> b!119071 d!38208))

(declare-fun lt!184182 () tuple2!10010)

(declare-fun d!38210 () Bool)

(assert (=> d!38210 (= lt!184182 (readNLeastSignificantBitsLoop!0 (_1!5259 lt!183750) nBits!396 i!615 lt!183755))))

(assert (=> d!38210 (= (readNLeastSignificantBitsLoopPure!0 (_1!5259 lt!183750) nBits!396 i!615 lt!183755) (tuple2!9991 (_2!5270 lt!184182) (_1!5270 lt!184182)))))

(declare-fun bs!9247 () Bool)

(assert (= bs!9247 d!38210))

(declare-fun m!179509 () Bool)

(assert (=> bs!9247 m!179509))

(assert (=> b!119071 d!38210))

(declare-fun b!119263 () Bool)

(declare-fun res!98723 () Bool)

(declare-fun e!78153 () Bool)

(assert (=> b!119263 (=> (not res!98723) (not e!78153))))

(declare-fun lt!184231 () tuple2!9988)

(assert (=> b!119263 (= res!98723 (isPrefixOf!0 (_1!5259 lt!184231) thiss!1305))))

(declare-fun b!119264 () Bool)

(declare-fun e!78154 () Unit!7329)

(declare-fun lt!184223 () Unit!7329)

(assert (=> b!119264 (= e!78154 lt!184223)))

(declare-fun lt!184227 () (_ BitVec 64))

(assert (=> b!119264 (= lt!184227 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184240 () (_ BitVec 64))

(assert (=> b!119264 (= lt!184240 (bitIndex!0 (size!2417 (buf!2839 thiss!1305)) (currentByte!5500 thiss!1305) (currentBit!5495 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5332 array!5332 (_ BitVec 64) (_ BitVec 64)) Unit!7329)

(assert (=> b!119264 (= lt!184223 (arrayBitRangesEqSymmetric!0 (buf!2839 thiss!1305) (buf!2839 (_2!5257 lt!183747)) lt!184227 lt!184240))))

(assert (=> b!119264 (arrayBitRangesEq!0 (buf!2839 (_2!5257 lt!183747)) (buf!2839 thiss!1305) lt!184227 lt!184240)))

(declare-fun b!119265 () Bool)

(declare-fun res!98722 () Bool)

(assert (=> b!119265 (=> (not res!98722) (not e!78153))))

(assert (=> b!119265 (= res!98722 (isPrefixOf!0 (_2!5259 lt!184231) (_2!5257 lt!183747)))))

(declare-fun d!38212 () Bool)

(assert (=> d!38212 e!78153))

(declare-fun res!98721 () Bool)

(assert (=> d!38212 (=> (not res!98721) (not e!78153))))

(assert (=> d!38212 (= res!98721 (isPrefixOf!0 (_1!5259 lt!184231) (_2!5259 lt!184231)))))

(declare-fun lt!184232 () BitStream!4308)

(assert (=> d!38212 (= lt!184231 (tuple2!9989 lt!184232 (_2!5257 lt!183747)))))

(declare-fun lt!184224 () Unit!7329)

(declare-fun lt!184242 () Unit!7329)

(assert (=> d!38212 (= lt!184224 lt!184242)))

(assert (=> d!38212 (isPrefixOf!0 lt!184232 (_2!5257 lt!183747))))

(assert (=> d!38212 (= lt!184242 (lemmaIsPrefixTransitive!0 lt!184232 (_2!5257 lt!183747) (_2!5257 lt!183747)))))

(declare-fun lt!184235 () Unit!7329)

(declare-fun lt!184230 () Unit!7329)

(assert (=> d!38212 (= lt!184235 lt!184230)))

(assert (=> d!38212 (isPrefixOf!0 lt!184232 (_2!5257 lt!183747))))

(assert (=> d!38212 (= lt!184230 (lemmaIsPrefixTransitive!0 lt!184232 thiss!1305 (_2!5257 lt!183747)))))

(declare-fun lt!184237 () Unit!7329)

(assert (=> d!38212 (= lt!184237 e!78154)))

(declare-fun c!7160 () Bool)

(assert (=> d!38212 (= c!7160 (not (= (size!2417 (buf!2839 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!184225 () Unit!7329)

(declare-fun lt!184238 () Unit!7329)

(assert (=> d!38212 (= lt!184225 lt!184238)))

(assert (=> d!38212 (isPrefixOf!0 (_2!5257 lt!183747) (_2!5257 lt!183747))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4308) Unit!7329)

(assert (=> d!38212 (= lt!184238 (lemmaIsPrefixRefl!0 (_2!5257 lt!183747)))))

(declare-fun lt!184233 () Unit!7329)

(declare-fun lt!184229 () Unit!7329)

(assert (=> d!38212 (= lt!184233 lt!184229)))

(assert (=> d!38212 (= lt!184229 (lemmaIsPrefixRefl!0 (_2!5257 lt!183747)))))

(declare-fun lt!184234 () Unit!7329)

(declare-fun lt!184228 () Unit!7329)

(assert (=> d!38212 (= lt!184234 lt!184228)))

(assert (=> d!38212 (isPrefixOf!0 lt!184232 lt!184232)))

(assert (=> d!38212 (= lt!184228 (lemmaIsPrefixRefl!0 lt!184232))))

(declare-fun lt!184236 () Unit!7329)

(declare-fun lt!184241 () Unit!7329)

(assert (=> d!38212 (= lt!184236 lt!184241)))

(assert (=> d!38212 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!38212 (= lt!184241 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!38212 (= lt!184232 (BitStream!4309 (buf!2839 (_2!5257 lt!183747)) (currentByte!5500 thiss!1305) (currentBit!5495 thiss!1305)))))

(assert (=> d!38212 (isPrefixOf!0 thiss!1305 (_2!5257 lt!183747))))

(assert (=> d!38212 (= (reader!0 thiss!1305 (_2!5257 lt!183747)) lt!184231)))

(declare-fun b!119266 () Bool)

(declare-fun Unit!7349 () Unit!7329)

(assert (=> b!119266 (= e!78154 Unit!7349)))

(declare-fun b!119267 () Bool)

(declare-fun lt!184226 () (_ BitVec 64))

(declare-fun lt!184239 () (_ BitVec 64))

(assert (=> b!119267 (= e!78153 (= (_1!5259 lt!184231) (withMovedBitIndex!0 (_2!5259 lt!184231) (bvsub lt!184239 lt!184226))))))

(assert (=> b!119267 (or (= (bvand lt!184239 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!184226 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!184239 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!184239 lt!184226) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119267 (= lt!184226 (bitIndex!0 (size!2417 (buf!2839 (_2!5257 lt!183747))) (currentByte!5500 (_2!5257 lt!183747)) (currentBit!5495 (_2!5257 lt!183747))))))

(assert (=> b!119267 (= lt!184239 (bitIndex!0 (size!2417 (buf!2839 thiss!1305)) (currentByte!5500 thiss!1305) (currentBit!5495 thiss!1305)))))

(assert (= (and d!38212 c!7160) b!119264))

(assert (= (and d!38212 (not c!7160)) b!119266))

(assert (= (and d!38212 res!98721) b!119263))

(assert (= (and b!119263 res!98723) b!119265))

(assert (= (and b!119265 res!98722) b!119267))

(assert (=> d!38212 m!179133))

(declare-fun m!179511 () Bool)

(assert (=> d!38212 m!179511))

(declare-fun m!179513 () Bool)

(assert (=> d!38212 m!179513))

(declare-fun m!179515 () Bool)

(assert (=> d!38212 m!179515))

(declare-fun m!179517 () Bool)

(assert (=> d!38212 m!179517))

(declare-fun m!179519 () Bool)

(assert (=> d!38212 m!179519))

(declare-fun m!179521 () Bool)

(assert (=> d!38212 m!179521))

(declare-fun m!179523 () Bool)

(assert (=> d!38212 m!179523))

(declare-fun m!179525 () Bool)

(assert (=> d!38212 m!179525))

(declare-fun m!179527 () Bool)

(assert (=> d!38212 m!179527))

(declare-fun m!179529 () Bool)

(assert (=> d!38212 m!179529))

(assert (=> b!119264 m!179169))

(declare-fun m!179531 () Bool)

(assert (=> b!119264 m!179531))

(declare-fun m!179533 () Bool)

(assert (=> b!119264 m!179533))

(declare-fun m!179535 () Bool)

(assert (=> b!119267 m!179535))

(assert (=> b!119267 m!179189))

(assert (=> b!119267 m!179169))

(declare-fun m!179537 () Bool)

(assert (=> b!119265 m!179537))

(declare-fun m!179539 () Bool)

(assert (=> b!119263 m!179539))

(assert (=> b!119071 d!38212))

(declare-fun d!38214 () Bool)

(assert (=> d!38214 (validate_offset_bits!1 ((_ sign_extend 32) (size!2417 (buf!2839 (_2!5257 lt!183747)))) ((_ sign_extend 32) (currentByte!5500 (_2!5257 lt!183757))) ((_ sign_extend 32) (currentBit!5495 (_2!5257 lt!183757))) lt!183765)))

(declare-fun lt!184245 () Unit!7329)

(declare-fun choose!9 (BitStream!4308 array!5332 (_ BitVec 64) BitStream!4308) Unit!7329)

(assert (=> d!38214 (= lt!184245 (choose!9 (_2!5257 lt!183757) (buf!2839 (_2!5257 lt!183747)) lt!183765 (BitStream!4309 (buf!2839 (_2!5257 lt!183747)) (currentByte!5500 (_2!5257 lt!183757)) (currentBit!5495 (_2!5257 lt!183757)))))))

(assert (=> d!38214 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5257 lt!183757) (buf!2839 (_2!5257 lt!183747)) lt!183765) lt!184245)))

(declare-fun bs!9248 () Bool)

(assert (= bs!9248 d!38214))

(assert (=> bs!9248 m!179145))

(declare-fun m!179541 () Bool)

(assert (=> bs!9248 m!179541))

(assert (=> b!119071 d!38214))

(declare-fun b!119415 () Bool)

(declare-fun lt!184718 () tuple2!9986)

(declare-fun lt!184731 () tuple2!9984)

(assert (=> b!119415 (= lt!184718 (readBitPure!0 (readerFrom!0 (_2!5257 lt!184731) (currentBit!5495 (_2!5257 lt!183757)) (currentByte!5500 (_2!5257 lt!183757)))))))

(declare-fun res!98847 () Bool)

(declare-fun lt!184715 () Bool)

(assert (=> b!119415 (= res!98847 (and (= (_2!5258 lt!184718) lt!184715) (= (_1!5258 lt!184718) (_2!5257 lt!184731))))))

(declare-fun e!78241 () Bool)

(assert (=> b!119415 (=> (not res!98847) (not e!78241))))

(declare-fun e!78243 () Bool)

(assert (=> b!119415 (= e!78243 e!78241)))

(declare-fun b!119417 () Bool)

(assert (=> b!119417 (= e!78241 (= (bitIndex!0 (size!2417 (buf!2839 (_1!5258 lt!184718))) (currentByte!5500 (_1!5258 lt!184718)) (currentBit!5495 (_1!5258 lt!184718))) (bitIndex!0 (size!2417 (buf!2839 (_2!5257 lt!184731))) (currentByte!5500 (_2!5257 lt!184731)) (currentBit!5495 (_2!5257 lt!184731)))))))

(declare-fun b!119418 () Bool)

(declare-fun res!98843 () Bool)

(declare-fun call!1553 () Bool)

(assert (=> b!119418 (= res!98843 call!1553)))

(assert (=> b!119418 (=> (not res!98843) (not e!78243))))

(declare-fun b!119419 () Bool)

(declare-fun e!78245 () (_ BitVec 64))

(assert (=> b!119419 (= e!78245 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!119420 () Bool)

(declare-fun e!78240 () tuple2!9984)

(declare-fun lt!184745 () tuple2!9984)

(declare-fun Unit!7350 () Unit!7329)

(assert (=> b!119420 (= e!78240 (tuple2!9985 Unit!7350 (_2!5257 lt!184745)))))

(assert (=> b!119420 (= lt!184715 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119420 (= lt!184731 (appendBit!0 (_2!5257 lt!183757) lt!184715))))

(declare-fun res!98840 () Bool)

(assert (=> b!119420 (= res!98840 (= (size!2417 (buf!2839 (_2!5257 lt!183757))) (size!2417 (buf!2839 (_2!5257 lt!184731)))))))

(assert (=> b!119420 (=> (not res!98840) (not e!78243))))

(assert (=> b!119420 e!78243))

(declare-fun lt!184722 () tuple2!9984)

(assert (=> b!119420 (= lt!184722 lt!184731)))

(assert (=> b!119420 (= lt!184745 (appendNLeastSignificantBitsLoop!0 (_2!5257 lt!184722) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!184719 () Unit!7329)

(assert (=> b!119420 (= lt!184719 (lemmaIsPrefixTransitive!0 (_2!5257 lt!183757) (_2!5257 lt!184722) (_2!5257 lt!184745)))))

(assert (=> b!119420 (isPrefixOf!0 (_2!5257 lt!183757) (_2!5257 lt!184745))))

(declare-fun lt!184749 () Unit!7329)

(assert (=> b!119420 (= lt!184749 lt!184719)))

(assert (=> b!119420 (invariant!0 (currentBit!5495 (_2!5257 lt!183757)) (currentByte!5500 (_2!5257 lt!183757)) (size!2417 (buf!2839 (_2!5257 lt!184722))))))

(declare-fun lt!184723 () BitStream!4308)

(assert (=> b!119420 (= lt!184723 (BitStream!4309 (buf!2839 (_2!5257 lt!184722)) (currentByte!5500 (_2!5257 lt!183757)) (currentBit!5495 (_2!5257 lt!183757))))))

(assert (=> b!119420 (invariant!0 (currentBit!5495 lt!184723) (currentByte!5500 lt!184723) (size!2417 (buf!2839 (_2!5257 lt!184745))))))

(declare-fun lt!184728 () BitStream!4308)

(assert (=> b!119420 (= lt!184728 (BitStream!4309 (buf!2839 (_2!5257 lt!184745)) (currentByte!5500 lt!184723) (currentBit!5495 lt!184723)))))

(declare-fun lt!184724 () tuple2!9986)

(assert (=> b!119420 (= lt!184724 (readBitPure!0 lt!184723))))

(declare-fun lt!184741 () tuple2!9986)

(assert (=> b!119420 (= lt!184741 (readBitPure!0 lt!184728))))

(declare-fun lt!184725 () Unit!7329)

(assert (=> b!119420 (= lt!184725 (readBitPrefixLemma!0 lt!184723 (_2!5257 lt!184745)))))

(declare-fun res!98842 () Bool)

(assert (=> b!119420 (= res!98842 (= (bitIndex!0 (size!2417 (buf!2839 (_1!5258 lt!184724))) (currentByte!5500 (_1!5258 lt!184724)) (currentBit!5495 (_1!5258 lt!184724))) (bitIndex!0 (size!2417 (buf!2839 (_1!5258 lt!184741))) (currentByte!5500 (_1!5258 lt!184741)) (currentBit!5495 (_1!5258 lt!184741)))))))

(declare-fun e!78242 () Bool)

(assert (=> b!119420 (=> (not res!98842) (not e!78242))))

(assert (=> b!119420 e!78242))

(declare-fun lt!184727 () Unit!7329)

(assert (=> b!119420 (= lt!184727 lt!184725)))

(declare-fun lt!184721 () tuple2!9988)

(assert (=> b!119420 (= lt!184721 (reader!0 (_2!5257 lt!183757) (_2!5257 lt!184745)))))

(declare-fun lt!184750 () tuple2!9988)

(assert (=> b!119420 (= lt!184750 (reader!0 (_2!5257 lt!184722) (_2!5257 lt!184745)))))

(declare-fun lt!184742 () tuple2!9986)

(assert (=> b!119420 (= lt!184742 (readBitPure!0 (_1!5259 lt!184721)))))

(assert (=> b!119420 (= (_2!5258 lt!184742) lt!184715)))

(declare-fun lt!184717 () Unit!7329)

(declare-fun Unit!7351 () Unit!7329)

(assert (=> b!119420 (= lt!184717 Unit!7351)))

(declare-fun lt!184726 () (_ BitVec 64))

(assert (=> b!119420 (= lt!184726 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!184743 () (_ BitVec 64))

(assert (=> b!119420 (= lt!184743 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!184755 () Unit!7329)

(assert (=> b!119420 (= lt!184755 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5257 lt!183757) (buf!2839 (_2!5257 lt!184745)) lt!184743))))

(assert (=> b!119420 (validate_offset_bits!1 ((_ sign_extend 32) (size!2417 (buf!2839 (_2!5257 lt!184745)))) ((_ sign_extend 32) (currentByte!5500 (_2!5257 lt!183757))) ((_ sign_extend 32) (currentBit!5495 (_2!5257 lt!183757))) lt!184743)))

(declare-fun lt!184740 () Unit!7329)

(assert (=> b!119420 (= lt!184740 lt!184755)))

(declare-fun lt!184732 () tuple2!9990)

(assert (=> b!119420 (= lt!184732 (readNLeastSignificantBitsLoopPure!0 (_1!5259 lt!184721) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!184726))))

(declare-fun lt!184716 () (_ BitVec 64))

(assert (=> b!119420 (= lt!184716 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!184756 () Unit!7329)

(assert (=> b!119420 (= lt!184756 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5257 lt!184722) (buf!2839 (_2!5257 lt!184745)) lt!184716))))

(assert (=> b!119420 (validate_offset_bits!1 ((_ sign_extend 32) (size!2417 (buf!2839 (_2!5257 lt!184745)))) ((_ sign_extend 32) (currentByte!5500 (_2!5257 lt!184722))) ((_ sign_extend 32) (currentBit!5495 (_2!5257 lt!184722))) lt!184716)))

(declare-fun lt!184746 () Unit!7329)

(assert (=> b!119420 (= lt!184746 lt!184756)))

(declare-fun lt!184744 () tuple2!9990)

(assert (=> b!119420 (= lt!184744 (readNLeastSignificantBitsLoopPure!0 (_1!5259 lt!184750) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!184726 (ite (_2!5258 lt!184742) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!184735 () tuple2!9990)

(assert (=> b!119420 (= lt!184735 (readNLeastSignificantBitsLoopPure!0 (_1!5259 lt!184721) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!184726))))

(declare-fun c!7178 () Bool)

(assert (=> b!119420 (= c!7178 (_2!5258 (readBitPure!0 (_1!5259 lt!184721))))))

(declare-fun lt!184736 () tuple2!9990)

(assert (=> b!119420 (= lt!184736 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5259 lt!184721) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!184726 e!78245)))))

(declare-fun lt!184753 () Unit!7329)

(assert (=> b!119420 (= lt!184753 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5259 lt!184721) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!184726))))

(assert (=> b!119420 (and (= (_2!5260 lt!184735) (_2!5260 lt!184736)) (= (_1!5260 lt!184735) (_1!5260 lt!184736)))))

(declare-fun lt!184737 () Unit!7329)

(assert (=> b!119420 (= lt!184737 lt!184753)))

(assert (=> b!119420 (= (_1!5259 lt!184721) (withMovedBitIndex!0 (_2!5259 lt!184721) (bvsub (bitIndex!0 (size!2417 (buf!2839 (_2!5257 lt!183757))) (currentByte!5500 (_2!5257 lt!183757)) (currentBit!5495 (_2!5257 lt!183757))) (bitIndex!0 (size!2417 (buf!2839 (_2!5257 lt!184745))) (currentByte!5500 (_2!5257 lt!184745)) (currentBit!5495 (_2!5257 lt!184745))))))))

(declare-fun lt!184747 () Unit!7329)

(declare-fun Unit!7352 () Unit!7329)

(assert (=> b!119420 (= lt!184747 Unit!7352)))

(assert (=> b!119420 (= (_1!5259 lt!184750) (withMovedBitIndex!0 (_2!5259 lt!184750) (bvsub (bitIndex!0 (size!2417 (buf!2839 (_2!5257 lt!184722))) (currentByte!5500 (_2!5257 lt!184722)) (currentBit!5495 (_2!5257 lt!184722))) (bitIndex!0 (size!2417 (buf!2839 (_2!5257 lt!184745))) (currentByte!5500 (_2!5257 lt!184745)) (currentBit!5495 (_2!5257 lt!184745))))))))

(declare-fun lt!184729 () Unit!7329)

(declare-fun Unit!7353 () Unit!7329)

(assert (=> b!119420 (= lt!184729 Unit!7353)))

(assert (=> b!119420 (= (bitIndex!0 (size!2417 (buf!2839 (_2!5257 lt!183757))) (currentByte!5500 (_2!5257 lt!183757)) (currentBit!5495 (_2!5257 lt!183757))) (bvsub (bitIndex!0 (size!2417 (buf!2839 (_2!5257 lt!184722))) (currentByte!5500 (_2!5257 lt!184722)) (currentBit!5495 (_2!5257 lt!184722))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!184712 () Unit!7329)

(declare-fun Unit!7354 () Unit!7329)

(assert (=> b!119420 (= lt!184712 Unit!7354)))

(assert (=> b!119420 (= (_2!5260 lt!184732) (_2!5260 lt!184744))))

(declare-fun lt!184720 () Unit!7329)

(declare-fun Unit!7355 () Unit!7329)

(assert (=> b!119420 (= lt!184720 Unit!7355)))

(assert (=> b!119420 (= (_1!5260 lt!184732) (_2!5259 lt!184721))))

(declare-fun b!119421 () Bool)

(assert (=> b!119421 (= e!78245 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184733 () tuple2!9988)

(declare-fun e!78244 () Bool)

(declare-fun lt!184738 () tuple2!9990)

(declare-fun b!119422 () Bool)

(assert (=> b!119422 (= e!78244 (and (= (_2!5260 lt!184738) v!199) (= (_1!5260 lt!184738) (_2!5259 lt!184733))))))

(declare-fun lt!184754 () (_ BitVec 64))

(assert (=> b!119422 (= lt!184738 (readNLeastSignificantBitsLoopPure!0 (_1!5259 lt!184733) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!184754))))

(declare-fun lt!184752 () Unit!7329)

(declare-fun lt!184739 () Unit!7329)

(assert (=> b!119422 (= lt!184752 lt!184739)))

(declare-fun lt!184734 () tuple2!9984)

(declare-fun lt!184713 () (_ BitVec 64))

(assert (=> b!119422 (validate_offset_bits!1 ((_ sign_extend 32) (size!2417 (buf!2839 (_2!5257 lt!184734)))) ((_ sign_extend 32) (currentByte!5500 (_2!5257 lt!183757))) ((_ sign_extend 32) (currentBit!5495 (_2!5257 lt!183757))) lt!184713)))

(assert (=> b!119422 (= lt!184739 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5257 lt!183757) (buf!2839 (_2!5257 lt!184734)) lt!184713))))

(declare-fun e!78239 () Bool)

(assert (=> b!119422 e!78239))

(declare-fun res!98844 () Bool)

(assert (=> b!119422 (=> (not res!98844) (not e!78239))))

(assert (=> b!119422 (= res!98844 (and (= (size!2417 (buf!2839 (_2!5257 lt!183757))) (size!2417 (buf!2839 (_2!5257 lt!184734)))) (bvsge lt!184713 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119422 (= lt!184713 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!119422 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!119422 (= lt!184754 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!119422 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!119422 (= lt!184733 (reader!0 (_2!5257 lt!183757) (_2!5257 lt!184734)))))

(declare-fun b!119423 () Bool)

(declare-fun res!98846 () Bool)

(assert (=> b!119423 (=> (not res!98846) (not e!78244))))

(assert (=> b!119423 (= res!98846 (isPrefixOf!0 (_2!5257 lt!183757) (_2!5257 lt!184734)))))

(declare-fun bm!1550 () Bool)

(declare-fun c!7179 () Bool)

(declare-fun lt!184730 () BitStream!4308)

(assert (=> bm!1550 (= call!1553 (isPrefixOf!0 (ite c!7179 (_2!5257 lt!183757) lt!184730) (ite c!7179 (_2!5257 lt!184731) lt!184730)))))

(declare-fun d!38216 () Bool)

(assert (=> d!38216 e!78244))

(declare-fun res!98839 () Bool)

(assert (=> d!38216 (=> (not res!98839) (not e!78244))))

(assert (=> d!38216 (= res!98839 (= (size!2417 (buf!2839 (_2!5257 lt!183757))) (size!2417 (buf!2839 (_2!5257 lt!184734)))))))

(assert (=> d!38216 (= lt!184734 e!78240)))

(assert (=> d!38216 (= c!7179 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!38216 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!38216 (= (appendNLeastSignificantBitsLoop!0 (_2!5257 lt!183757) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!184734)))

(declare-fun b!119416 () Bool)

(declare-fun lt!184751 () Unit!7329)

(assert (=> b!119416 (= e!78240 (tuple2!9985 lt!184751 (_2!5257 lt!183757)))))

(assert (=> b!119416 (= lt!184730 (_2!5257 lt!183757))))

(assert (=> b!119416 (= lt!184751 (lemmaIsPrefixRefl!0 lt!184730))))

(assert (=> b!119416 call!1553))

(declare-fun b!119424 () Bool)

(declare-fun res!98841 () Bool)

(assert (=> b!119424 (=> (not res!98841) (not e!78244))))

(declare-fun lt!184714 () (_ BitVec 64))

(declare-fun lt!184748 () (_ BitVec 64))

(assert (=> b!119424 (= res!98841 (= (bitIndex!0 (size!2417 (buf!2839 (_2!5257 lt!184734))) (currentByte!5500 (_2!5257 lt!184734)) (currentBit!5495 (_2!5257 lt!184734))) (bvadd lt!184748 lt!184714)))))

(assert (=> b!119424 (or (not (= (bvand lt!184748 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!184714 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!184748 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!184748 lt!184714) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119424 (= lt!184714 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!119424 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!119424 (= lt!184748 (bitIndex!0 (size!2417 (buf!2839 (_2!5257 lt!183757))) (currentByte!5500 (_2!5257 lt!183757)) (currentBit!5495 (_2!5257 lt!183757))))))

(declare-fun b!119425 () Bool)

(assert (=> b!119425 (= e!78239 (validate_offset_bits!1 ((_ sign_extend 32) (size!2417 (buf!2839 (_2!5257 lt!183757)))) ((_ sign_extend 32) (currentByte!5500 (_2!5257 lt!183757))) ((_ sign_extend 32) (currentBit!5495 (_2!5257 lt!183757))) lt!184713))))

(declare-fun b!119426 () Bool)

(declare-fun res!98845 () Bool)

(assert (=> b!119426 (= res!98845 (= (bitIndex!0 (size!2417 (buf!2839 (_2!5257 lt!184731))) (currentByte!5500 (_2!5257 lt!184731)) (currentBit!5495 (_2!5257 lt!184731))) (bvadd (bitIndex!0 (size!2417 (buf!2839 (_2!5257 lt!183757))) (currentByte!5500 (_2!5257 lt!183757)) (currentBit!5495 (_2!5257 lt!183757))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!119426 (=> (not res!98845) (not e!78243))))

(declare-fun b!119427 () Bool)

(assert (=> b!119427 (= e!78242 (= (_2!5258 lt!184724) (_2!5258 lt!184741)))))

(assert (= (and d!38216 c!7179) b!119420))

(assert (= (and d!38216 (not c!7179)) b!119416))

(assert (= (and b!119420 res!98840) b!119426))

(assert (= (and b!119426 res!98845) b!119418))

(assert (= (and b!119418 res!98843) b!119415))

(assert (= (and b!119415 res!98847) b!119417))

(assert (= (and b!119420 res!98842) b!119427))

(assert (= (and b!119420 c!7178) b!119419))

(assert (= (and b!119420 (not c!7178)) b!119421))

(assert (= (or b!119418 b!119416) bm!1550))

(assert (= (and d!38216 res!98839) b!119424))

(assert (= (and b!119424 res!98841) b!119423))

(assert (= (and b!119423 res!98846) b!119422))

(assert (= (and b!119422 res!98844) b!119425))

(declare-fun m!179815 () Bool)

(assert (=> b!119416 m!179815))

(declare-fun m!179817 () Bool)

(assert (=> b!119425 m!179817))

(declare-fun m!179819 () Bool)

(assert (=> b!119417 m!179819))

(declare-fun m!179821 () Bool)

(assert (=> b!119417 m!179821))

(declare-fun m!179823 () Bool)

(assert (=> b!119415 m!179823))

(assert (=> b!119415 m!179823))

(declare-fun m!179825 () Bool)

(assert (=> b!119415 m!179825))

(assert (=> b!119426 m!179821))

(assert (=> b!119426 m!179167))

(declare-fun m!179827 () Bool)

(assert (=> b!119423 m!179827))

(declare-fun m!179829 () Bool)

(assert (=> b!119420 m!179829))

(declare-fun m!179831 () Bool)

(assert (=> b!119420 m!179831))

(declare-fun m!179833 () Bool)

(assert (=> b!119420 m!179833))

(declare-fun m!179835 () Bool)

(assert (=> b!119420 m!179835))

(declare-fun m!179837 () Bool)

(assert (=> b!119420 m!179837))

(declare-fun m!179839 () Bool)

(assert (=> b!119420 m!179839))

(declare-fun m!179841 () Bool)

(assert (=> b!119420 m!179841))

(declare-fun m!179843 () Bool)

(assert (=> b!119420 m!179843))

(declare-fun m!179845 () Bool)

(assert (=> b!119420 m!179845))

(declare-fun m!179847 () Bool)

(assert (=> b!119420 m!179847))

(declare-fun m!179849 () Bool)

(assert (=> b!119420 m!179849))

(declare-fun m!179851 () Bool)

(assert (=> b!119420 m!179851))

(declare-fun m!179853 () Bool)

(assert (=> b!119420 m!179853))

(declare-fun m!179855 () Bool)

(assert (=> b!119420 m!179855))

(declare-fun m!179857 () Bool)

(assert (=> b!119420 m!179857))

(declare-fun m!179859 () Bool)

(assert (=> b!119420 m!179859))

(assert (=> b!119420 m!179167))

(assert (=> b!119420 m!179829))

(declare-fun m!179861 () Bool)

(assert (=> b!119420 m!179861))

(declare-fun m!179863 () Bool)

(assert (=> b!119420 m!179863))

(declare-fun m!179865 () Bool)

(assert (=> b!119420 m!179865))

(declare-fun m!179867 () Bool)

(assert (=> b!119420 m!179867))

(declare-fun m!179869 () Bool)

(assert (=> b!119420 m!179869))

(declare-fun m!179871 () Bool)

(assert (=> b!119420 m!179871))

(declare-fun m!179873 () Bool)

(assert (=> b!119420 m!179873))

(declare-fun m!179875 () Bool)

(assert (=> b!119420 m!179875))

(declare-fun m!179877 () Bool)

(assert (=> b!119420 m!179877))

(declare-fun m!179879 () Bool)

(assert (=> b!119420 m!179879))

(declare-fun m!179881 () Bool)

(assert (=> b!119420 m!179881))

(declare-fun m!179883 () Bool)

(assert (=> b!119420 m!179883))

(declare-fun m!179885 () Bool)

(assert (=> b!119422 m!179885))

(assert (=> b!119422 m!179871))

(declare-fun m!179887 () Bool)

(assert (=> b!119422 m!179887))

(declare-fun m!179889 () Bool)

(assert (=> b!119422 m!179889))

(declare-fun m!179891 () Bool)

(assert (=> b!119422 m!179891))

(declare-fun m!179893 () Bool)

(assert (=> b!119424 m!179893))

(assert (=> b!119424 m!179167))

(declare-fun m!179895 () Bool)

(assert (=> bm!1550 m!179895))

(assert (=> b!119071 d!38216))

(declare-fun d!38292 () Bool)

(declare-fun lt!184757 () tuple2!10008)

(assert (=> d!38292 (= lt!184757 (readBit!0 lt!183761))))

(assert (=> d!38292 (= (readBitPure!0 lt!183761) (tuple2!9987 (_2!5269 lt!184757) (_1!5269 lt!184757)))))

(declare-fun bs!9266 () Bool)

(assert (= bs!9266 d!38292))

(declare-fun m!179897 () Bool)

(assert (=> bs!9266 m!179897))

(assert (=> b!119071 d!38292))

(declare-fun b!119428 () Bool)

(declare-fun res!98850 () Bool)

(declare-fun e!78246 () Bool)

(assert (=> b!119428 (=> (not res!98850) (not e!78246))))

(declare-fun lt!184766 () tuple2!9988)

(assert (=> b!119428 (= res!98850 (isPrefixOf!0 (_1!5259 lt!184766) (_2!5257 lt!183757)))))

(declare-fun b!119429 () Bool)

(declare-fun e!78247 () Unit!7329)

(declare-fun lt!184758 () Unit!7329)

(assert (=> b!119429 (= e!78247 lt!184758)))

(declare-fun lt!184762 () (_ BitVec 64))

(assert (=> b!119429 (= lt!184762 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184775 () (_ BitVec 64))

(assert (=> b!119429 (= lt!184775 (bitIndex!0 (size!2417 (buf!2839 (_2!5257 lt!183757))) (currentByte!5500 (_2!5257 lt!183757)) (currentBit!5495 (_2!5257 lt!183757))))))

(assert (=> b!119429 (= lt!184758 (arrayBitRangesEqSymmetric!0 (buf!2839 (_2!5257 lt!183757)) (buf!2839 (_2!5257 lt!183747)) lt!184762 lt!184775))))

(assert (=> b!119429 (arrayBitRangesEq!0 (buf!2839 (_2!5257 lt!183747)) (buf!2839 (_2!5257 lt!183757)) lt!184762 lt!184775)))

(declare-fun b!119430 () Bool)

(declare-fun res!98849 () Bool)

(assert (=> b!119430 (=> (not res!98849) (not e!78246))))

(assert (=> b!119430 (= res!98849 (isPrefixOf!0 (_2!5259 lt!184766) (_2!5257 lt!183747)))))

(declare-fun d!38294 () Bool)

(assert (=> d!38294 e!78246))

(declare-fun res!98848 () Bool)

(assert (=> d!38294 (=> (not res!98848) (not e!78246))))

(assert (=> d!38294 (= res!98848 (isPrefixOf!0 (_1!5259 lt!184766) (_2!5259 lt!184766)))))

(declare-fun lt!184767 () BitStream!4308)

(assert (=> d!38294 (= lt!184766 (tuple2!9989 lt!184767 (_2!5257 lt!183747)))))

(declare-fun lt!184759 () Unit!7329)

(declare-fun lt!184777 () Unit!7329)

(assert (=> d!38294 (= lt!184759 lt!184777)))

(assert (=> d!38294 (isPrefixOf!0 lt!184767 (_2!5257 lt!183747))))

(assert (=> d!38294 (= lt!184777 (lemmaIsPrefixTransitive!0 lt!184767 (_2!5257 lt!183747) (_2!5257 lt!183747)))))

(declare-fun lt!184770 () Unit!7329)

(declare-fun lt!184765 () Unit!7329)

(assert (=> d!38294 (= lt!184770 lt!184765)))

(assert (=> d!38294 (isPrefixOf!0 lt!184767 (_2!5257 lt!183747))))

(assert (=> d!38294 (= lt!184765 (lemmaIsPrefixTransitive!0 lt!184767 (_2!5257 lt!183757) (_2!5257 lt!183747)))))

(declare-fun lt!184772 () Unit!7329)

(assert (=> d!38294 (= lt!184772 e!78247)))

(declare-fun c!7180 () Bool)

(assert (=> d!38294 (= c!7180 (not (= (size!2417 (buf!2839 (_2!5257 lt!183757))) #b00000000000000000000000000000000)))))

(declare-fun lt!184760 () Unit!7329)

(declare-fun lt!184773 () Unit!7329)

(assert (=> d!38294 (= lt!184760 lt!184773)))

(assert (=> d!38294 (isPrefixOf!0 (_2!5257 lt!183747) (_2!5257 lt!183747))))

(assert (=> d!38294 (= lt!184773 (lemmaIsPrefixRefl!0 (_2!5257 lt!183747)))))

(declare-fun lt!184768 () Unit!7329)

(declare-fun lt!184764 () Unit!7329)

(assert (=> d!38294 (= lt!184768 lt!184764)))

(assert (=> d!38294 (= lt!184764 (lemmaIsPrefixRefl!0 (_2!5257 lt!183747)))))

(declare-fun lt!184769 () Unit!7329)

(declare-fun lt!184763 () Unit!7329)

(assert (=> d!38294 (= lt!184769 lt!184763)))

(assert (=> d!38294 (isPrefixOf!0 lt!184767 lt!184767)))

(assert (=> d!38294 (= lt!184763 (lemmaIsPrefixRefl!0 lt!184767))))

(declare-fun lt!184771 () Unit!7329)

(declare-fun lt!184776 () Unit!7329)

(assert (=> d!38294 (= lt!184771 lt!184776)))

(assert (=> d!38294 (isPrefixOf!0 (_2!5257 lt!183757) (_2!5257 lt!183757))))

(assert (=> d!38294 (= lt!184776 (lemmaIsPrefixRefl!0 (_2!5257 lt!183757)))))

(assert (=> d!38294 (= lt!184767 (BitStream!4309 (buf!2839 (_2!5257 lt!183747)) (currentByte!5500 (_2!5257 lt!183757)) (currentBit!5495 (_2!5257 lt!183757))))))

(assert (=> d!38294 (isPrefixOf!0 (_2!5257 lt!183757) (_2!5257 lt!183747))))

(assert (=> d!38294 (= (reader!0 (_2!5257 lt!183757) (_2!5257 lt!183747)) lt!184766)))

(declare-fun b!119431 () Bool)

(declare-fun Unit!7356 () Unit!7329)

(assert (=> b!119431 (= e!78247 Unit!7356)))

(declare-fun lt!184774 () (_ BitVec 64))

(declare-fun b!119432 () Bool)

(declare-fun lt!184761 () (_ BitVec 64))

(assert (=> b!119432 (= e!78246 (= (_1!5259 lt!184766) (withMovedBitIndex!0 (_2!5259 lt!184766) (bvsub lt!184774 lt!184761))))))

(assert (=> b!119432 (or (= (bvand lt!184774 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!184761 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!184774 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!184774 lt!184761) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119432 (= lt!184761 (bitIndex!0 (size!2417 (buf!2839 (_2!5257 lt!183747))) (currentByte!5500 (_2!5257 lt!183747)) (currentBit!5495 (_2!5257 lt!183747))))))

(assert (=> b!119432 (= lt!184774 (bitIndex!0 (size!2417 (buf!2839 (_2!5257 lt!183757))) (currentByte!5500 (_2!5257 lt!183757)) (currentBit!5495 (_2!5257 lt!183757))))))

(assert (= (and d!38294 c!7180) b!119429))

(assert (= (and d!38294 (not c!7180)) b!119431))

(assert (= (and d!38294 res!98848) b!119428))

(assert (= (and b!119428 res!98850) b!119430))

(assert (= (and b!119430 res!98849) b!119432))

(declare-fun m!179899 () Bool)

(assert (=> d!38294 m!179899))

(declare-fun m!179901 () Bool)

(assert (=> d!38294 m!179901))

(declare-fun m!179903 () Bool)

(assert (=> d!38294 m!179903))

(declare-fun m!179905 () Bool)

(assert (=> d!38294 m!179905))

(assert (=> d!38294 m!179517))

(declare-fun m!179907 () Bool)

(assert (=> d!38294 m!179907))

(declare-fun m!179909 () Bool)

(assert (=> d!38294 m!179909))

(declare-fun m!179911 () Bool)

(assert (=> d!38294 m!179911))

(declare-fun m!179913 () Bool)

(assert (=> d!38294 m!179913))

(assert (=> d!38294 m!179527))

(declare-fun m!179915 () Bool)

(assert (=> d!38294 m!179915))

(assert (=> b!119429 m!179167))

(declare-fun m!179917 () Bool)

(assert (=> b!119429 m!179917))

(declare-fun m!179919 () Bool)

(assert (=> b!119429 m!179919))

(declare-fun m!179921 () Bool)

(assert (=> b!119432 m!179921))

(assert (=> b!119432 m!179189))

(assert (=> b!119432 m!179167))

(declare-fun m!179923 () Bool)

(assert (=> b!119430 m!179923))

(declare-fun m!179925 () Bool)

(assert (=> b!119428 m!179925))

(assert (=> b!119071 d!38294))

(declare-fun d!38296 () Bool)

(declare-fun e!78248 () Bool)

(assert (=> d!38296 e!78248))

(declare-fun res!98851 () Bool)

(assert (=> d!38296 (=> (not res!98851) (not e!78248))))

(declare-fun lt!184778 () (_ BitVec 64))

(declare-fun lt!184782 () (_ BitVec 64))

(declare-fun lt!184780 () (_ BitVec 64))

(assert (=> d!38296 (= res!98851 (= lt!184782 (bvsub lt!184778 lt!184780)))))

(assert (=> d!38296 (or (= (bvand lt!184778 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!184780 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!184778 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!184778 lt!184780) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38296 (= lt!184780 (remainingBits!0 ((_ sign_extend 32) (size!2417 (buf!2839 (_1!5258 lt!183742)))) ((_ sign_extend 32) (currentByte!5500 (_1!5258 lt!183742))) ((_ sign_extend 32) (currentBit!5495 (_1!5258 lt!183742)))))))

(declare-fun lt!184783 () (_ BitVec 64))

(declare-fun lt!184779 () (_ BitVec 64))

(assert (=> d!38296 (= lt!184778 (bvmul lt!184783 lt!184779))))

(assert (=> d!38296 (or (= lt!184783 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!184779 (bvsdiv (bvmul lt!184783 lt!184779) lt!184783)))))

(assert (=> d!38296 (= lt!184779 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38296 (= lt!184783 ((_ sign_extend 32) (size!2417 (buf!2839 (_1!5258 lt!183742)))))))

(assert (=> d!38296 (= lt!184782 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5500 (_1!5258 lt!183742))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5495 (_1!5258 lt!183742)))))))

(assert (=> d!38296 (invariant!0 (currentBit!5495 (_1!5258 lt!183742)) (currentByte!5500 (_1!5258 lt!183742)) (size!2417 (buf!2839 (_1!5258 lt!183742))))))

(assert (=> d!38296 (= (bitIndex!0 (size!2417 (buf!2839 (_1!5258 lt!183742))) (currentByte!5500 (_1!5258 lt!183742)) (currentBit!5495 (_1!5258 lt!183742))) lt!184782)))

(declare-fun b!119433 () Bool)

(declare-fun res!98852 () Bool)

(assert (=> b!119433 (=> (not res!98852) (not e!78248))))

(assert (=> b!119433 (= res!98852 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!184782))))

(declare-fun b!119434 () Bool)

(declare-fun lt!184781 () (_ BitVec 64))

(assert (=> b!119434 (= e!78248 (bvsle lt!184782 (bvmul lt!184781 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!119434 (or (= lt!184781 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!184781 #b0000000000000000000000000000000000000000000000000000000000001000) lt!184781)))))

(assert (=> b!119434 (= lt!184781 ((_ sign_extend 32) (size!2417 (buf!2839 (_1!5258 lt!183742)))))))

(assert (= (and d!38296 res!98851) b!119433))

(assert (= (and b!119433 res!98852) b!119434))

(declare-fun m!179927 () Bool)

(assert (=> d!38296 m!179927))

(declare-fun m!179929 () Bool)

(assert (=> d!38296 m!179929))

(assert (=> b!119071 d!38296))

(declare-fun d!38298 () Bool)

(assert (=> d!38298 (validate_offset_bits!1 ((_ sign_extend 32) (size!2417 (buf!2839 (_2!5257 lt!183747)))) ((_ sign_extend 32) (currentByte!5500 thiss!1305)) ((_ sign_extend 32) (currentBit!5495 thiss!1305)) lt!183744)))

(declare-fun lt!184784 () Unit!7329)

(assert (=> d!38298 (= lt!184784 (choose!9 thiss!1305 (buf!2839 (_2!5257 lt!183747)) lt!183744 (BitStream!4309 (buf!2839 (_2!5257 lt!183747)) (currentByte!5500 thiss!1305) (currentBit!5495 thiss!1305))))))

(assert (=> d!38298 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2839 (_2!5257 lt!183747)) lt!183744) lt!184784)))

(declare-fun bs!9267 () Bool)

(assert (= bs!9267 d!38298))

(assert (=> bs!9267 m!179131))

(declare-fun m!179931 () Bool)

(assert (=> bs!9267 m!179931))

(assert (=> b!119071 d!38298))

(declare-fun d!38300 () Bool)

(declare-fun e!78251 () Bool)

(assert (=> d!38300 e!78251))

(declare-fun res!98855 () Bool)

(assert (=> d!38300 (=> (not res!98855) (not e!78251))))

(declare-fun lt!184796 () tuple2!9986)

(declare-fun lt!184793 () tuple2!9986)

(assert (=> d!38300 (= res!98855 (= (bitIndex!0 (size!2417 (buf!2839 (_1!5258 lt!184796))) (currentByte!5500 (_1!5258 lt!184796)) (currentBit!5495 (_1!5258 lt!184796))) (bitIndex!0 (size!2417 (buf!2839 (_1!5258 lt!184793))) (currentByte!5500 (_1!5258 lt!184793)) (currentBit!5495 (_1!5258 lt!184793)))))))

(declare-fun lt!184795 () Unit!7329)

(declare-fun lt!184794 () BitStream!4308)

(declare-fun choose!50 (BitStream!4308 BitStream!4308 BitStream!4308 tuple2!9986 tuple2!9986 BitStream!4308 Bool tuple2!9986 tuple2!9986 BitStream!4308 Bool) Unit!7329)

(assert (=> d!38300 (= lt!184795 (choose!50 lt!183761 (_2!5257 lt!183747) lt!184794 lt!184796 (tuple2!9987 (_1!5258 lt!184796) (_2!5258 lt!184796)) (_1!5258 lt!184796) (_2!5258 lt!184796) lt!184793 (tuple2!9987 (_1!5258 lt!184793) (_2!5258 lt!184793)) (_1!5258 lt!184793) (_2!5258 lt!184793)))))

(assert (=> d!38300 (= lt!184793 (readBitPure!0 lt!184794))))

(assert (=> d!38300 (= lt!184796 (readBitPure!0 lt!183761))))

(assert (=> d!38300 (= lt!184794 (BitStream!4309 (buf!2839 (_2!5257 lt!183747)) (currentByte!5500 lt!183761) (currentBit!5495 lt!183761)))))

(assert (=> d!38300 (invariant!0 (currentBit!5495 lt!183761) (currentByte!5500 lt!183761) (size!2417 (buf!2839 (_2!5257 lt!183747))))))

(assert (=> d!38300 (= (readBitPrefixLemma!0 lt!183761 (_2!5257 lt!183747)) lt!184795)))

(declare-fun b!119437 () Bool)

(assert (=> b!119437 (= e!78251 (= (_2!5258 lt!184796) (_2!5258 lt!184793)))))

(assert (= (and d!38300 res!98855) b!119437))

(declare-fun m!179933 () Bool)

(assert (=> d!38300 m!179933))

(declare-fun m!179935 () Bool)

(assert (=> d!38300 m!179935))

(declare-fun m!179937 () Bool)

(assert (=> d!38300 m!179937))

(assert (=> d!38300 m!179143))

(declare-fun m!179939 () Bool)

(assert (=> d!38300 m!179939))

(declare-fun m!179941 () Bool)

(assert (=> d!38300 m!179941))

(assert (=> b!119071 d!38300))

(declare-fun d!38302 () Bool)

(assert (=> d!38302 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2417 (buf!2839 (_2!5257 lt!183747)))) ((_ sign_extend 32) (currentByte!5500 (_2!5257 lt!183757))) ((_ sign_extend 32) (currentBit!5495 (_2!5257 lt!183757))) lt!183765) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2417 (buf!2839 (_2!5257 lt!183747)))) ((_ sign_extend 32) (currentByte!5500 (_2!5257 lt!183757))) ((_ sign_extend 32) (currentBit!5495 (_2!5257 lt!183757)))) lt!183765))))

(declare-fun bs!9268 () Bool)

(assert (= bs!9268 d!38302))

(declare-fun m!179943 () Bool)

(assert (=> bs!9268 m!179943))

(assert (=> b!119071 d!38302))

(declare-fun d!38304 () Bool)

(assert (=> d!38304 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5495 thiss!1305) (currentByte!5500 thiss!1305) (size!2417 (buf!2839 thiss!1305))))))

(declare-fun bs!9269 () Bool)

(assert (= bs!9269 d!38304))

(assert (=> bs!9269 m!179473))

(assert (=> start!23452 d!38304))

(declare-fun d!38306 () Bool)

(assert (=> d!38306 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2417 (buf!2839 thiss!1305))) ((_ sign_extend 32) (currentByte!5500 thiss!1305)) ((_ sign_extend 32) (currentBit!5495 thiss!1305)) lt!183744) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2417 (buf!2839 thiss!1305))) ((_ sign_extend 32) (currentByte!5500 thiss!1305)) ((_ sign_extend 32) (currentBit!5495 thiss!1305))) lt!183744))))

(declare-fun bs!9270 () Bool)

(assert (= bs!9270 d!38306))

(assert (=> bs!9270 m!179471))

(assert (=> b!119069 d!38306))

(declare-fun d!38308 () Bool)

(declare-fun res!98858 () Bool)

(declare-fun e!78253 () Bool)

(assert (=> d!38308 (=> (not res!98858) (not e!78253))))

(assert (=> d!38308 (= res!98858 (= (size!2417 (buf!2839 thiss!1305)) (size!2417 (buf!2839 (_2!5257 lt!183757)))))))

(assert (=> d!38308 (= (isPrefixOf!0 thiss!1305 (_2!5257 lt!183757)) e!78253)))

(declare-fun b!119438 () Bool)

(declare-fun res!98856 () Bool)

(assert (=> b!119438 (=> (not res!98856) (not e!78253))))

(assert (=> b!119438 (= res!98856 (bvsle (bitIndex!0 (size!2417 (buf!2839 thiss!1305)) (currentByte!5500 thiss!1305) (currentBit!5495 thiss!1305)) (bitIndex!0 (size!2417 (buf!2839 (_2!5257 lt!183757))) (currentByte!5500 (_2!5257 lt!183757)) (currentBit!5495 (_2!5257 lt!183757)))))))

(declare-fun b!119439 () Bool)

(declare-fun e!78252 () Bool)

(assert (=> b!119439 (= e!78253 e!78252)))

(declare-fun res!98857 () Bool)

(assert (=> b!119439 (=> res!98857 e!78252)))

(assert (=> b!119439 (= res!98857 (= (size!2417 (buf!2839 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!119440 () Bool)

(assert (=> b!119440 (= e!78252 (arrayBitRangesEq!0 (buf!2839 thiss!1305) (buf!2839 (_2!5257 lt!183757)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2417 (buf!2839 thiss!1305)) (currentByte!5500 thiss!1305) (currentBit!5495 thiss!1305))))))

(assert (= (and d!38308 res!98858) b!119438))

(assert (= (and b!119438 res!98856) b!119439))

(assert (= (and b!119439 (not res!98857)) b!119440))

(assert (=> b!119438 m!179169))

(assert (=> b!119438 m!179167))

(assert (=> b!119440 m!179169))

(assert (=> b!119440 m!179169))

(declare-fun m!179945 () Bool)

(assert (=> b!119440 m!179945))

(assert (=> b!119080 d!38308))

(declare-fun d!38310 () Bool)

(assert (=> d!38310 (= (invariant!0 (currentBit!5495 thiss!1305) (currentByte!5500 thiss!1305) (size!2417 (buf!2839 (_2!5257 lt!183757)))) (and (bvsge (currentBit!5495 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5495 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5500 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5500 thiss!1305) (size!2417 (buf!2839 (_2!5257 lt!183757)))) (and (= (currentBit!5495 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5500 thiss!1305) (size!2417 (buf!2839 (_2!5257 lt!183757))))))))))

(assert (=> b!119079 d!38310))

(declare-fun d!38312 () Bool)

(declare-fun lt!184797 () tuple2!10008)

(assert (=> d!38312 (= lt!184797 (readBit!0 (readerFrom!0 (_2!5257 lt!183757) (currentBit!5495 thiss!1305) (currentByte!5500 thiss!1305))))))

(assert (=> d!38312 (= (readBitPure!0 (readerFrom!0 (_2!5257 lt!183757) (currentBit!5495 thiss!1305) (currentByte!5500 thiss!1305))) (tuple2!9987 (_2!5269 lt!184797) (_1!5269 lt!184797)))))

(declare-fun bs!9271 () Bool)

(assert (= bs!9271 d!38312))

(assert (=> bs!9271 m!179171))

(declare-fun m!179947 () Bool)

(assert (=> bs!9271 m!179947))

(assert (=> b!119070 d!38312))

(declare-fun d!38314 () Bool)

(declare-fun e!78256 () Bool)

(assert (=> d!38314 e!78256))

(declare-fun res!98862 () Bool)

(assert (=> d!38314 (=> (not res!98862) (not e!78256))))

(assert (=> d!38314 (= res!98862 (invariant!0 (currentBit!5495 (_2!5257 lt!183757)) (currentByte!5500 (_2!5257 lt!183757)) (size!2417 (buf!2839 (_2!5257 lt!183757)))))))

(assert (=> d!38314 (= (readerFrom!0 (_2!5257 lt!183757) (currentBit!5495 thiss!1305) (currentByte!5500 thiss!1305)) (BitStream!4309 (buf!2839 (_2!5257 lt!183757)) (currentByte!5500 thiss!1305) (currentBit!5495 thiss!1305)))))

(declare-fun b!119443 () Bool)

(assert (=> b!119443 (= e!78256 (invariant!0 (currentBit!5495 thiss!1305) (currentByte!5500 thiss!1305) (size!2417 (buf!2839 (_2!5257 lt!183757)))))))

(assert (= (and d!38314 res!98862) b!119443))

(assert (=> d!38314 m!179469))

(assert (=> b!119443 m!179125))

(assert (=> b!119070 d!38314))

(declare-fun d!38316 () Bool)

(assert (=> d!38316 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!119077 d!38316))

(declare-fun d!38318 () Bool)

(assert (=> d!38318 (= (invariant!0 (currentBit!5495 thiss!1305) (currentByte!5500 thiss!1305) (size!2417 (buf!2839 (_2!5257 lt!183747)))) (and (bvsge (currentBit!5495 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5495 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5500 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5500 thiss!1305) (size!2417 (buf!2839 (_2!5257 lt!183747)))) (and (= (currentBit!5495 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5500 thiss!1305) (size!2417 (buf!2839 (_2!5257 lt!183747))))))))))

(assert (=> b!119068 d!38318))

(declare-fun d!38320 () Bool)

(declare-fun e!78257 () Bool)

(assert (=> d!38320 e!78257))

(declare-fun res!98863 () Bool)

(assert (=> d!38320 (=> (not res!98863) (not e!78257))))

(declare-fun lt!184802 () (_ BitVec 64))

(declare-fun lt!184800 () (_ BitVec 64))

(declare-fun lt!184798 () (_ BitVec 64))

(assert (=> d!38320 (= res!98863 (= lt!184802 (bvsub lt!184798 lt!184800)))))

(assert (=> d!38320 (or (= (bvand lt!184798 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!184800 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!184798 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!184798 lt!184800) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38320 (= lt!184800 (remainingBits!0 ((_ sign_extend 32) (size!2417 (buf!2839 (_2!5257 lt!183747)))) ((_ sign_extend 32) (currentByte!5500 (_2!5257 lt!183747))) ((_ sign_extend 32) (currentBit!5495 (_2!5257 lt!183747)))))))

(declare-fun lt!184803 () (_ BitVec 64))

(declare-fun lt!184799 () (_ BitVec 64))

(assert (=> d!38320 (= lt!184798 (bvmul lt!184803 lt!184799))))

(assert (=> d!38320 (or (= lt!184803 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!184799 (bvsdiv (bvmul lt!184803 lt!184799) lt!184803)))))

(assert (=> d!38320 (= lt!184799 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38320 (= lt!184803 ((_ sign_extend 32) (size!2417 (buf!2839 (_2!5257 lt!183747)))))))

(assert (=> d!38320 (= lt!184802 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5500 (_2!5257 lt!183747))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5495 (_2!5257 lt!183747)))))))

(assert (=> d!38320 (invariant!0 (currentBit!5495 (_2!5257 lt!183747)) (currentByte!5500 (_2!5257 lt!183747)) (size!2417 (buf!2839 (_2!5257 lt!183747))))))

(assert (=> d!38320 (= (bitIndex!0 (size!2417 (buf!2839 (_2!5257 lt!183747))) (currentByte!5500 (_2!5257 lt!183747)) (currentBit!5495 (_2!5257 lt!183747))) lt!184802)))

(declare-fun b!119444 () Bool)

(declare-fun res!98864 () Bool)

(assert (=> b!119444 (=> (not res!98864) (not e!78257))))

(assert (=> b!119444 (= res!98864 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!184802))))

(declare-fun b!119445 () Bool)

(declare-fun lt!184801 () (_ BitVec 64))

(assert (=> b!119445 (= e!78257 (bvsle lt!184802 (bvmul lt!184801 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!119445 (or (= lt!184801 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!184801 #b0000000000000000000000000000000000000000000000000000000000001000) lt!184801)))))

(assert (=> b!119445 (= lt!184801 ((_ sign_extend 32) (size!2417 (buf!2839 (_2!5257 lt!183747)))))))

(assert (= (and d!38320 res!98863) b!119444))

(assert (= (and b!119444 res!98864) b!119445))

(declare-fun m!179949 () Bool)

(assert (=> d!38320 m!179949))

(declare-fun m!179951 () Bool)

(assert (=> d!38320 m!179951))

(assert (=> b!119078 d!38320))

(declare-fun d!38322 () Bool)

(declare-fun lt!184818 () tuple2!9990)

(declare-fun lt!184821 () tuple2!9990)

(assert (=> d!38322 (and (= (_2!5260 lt!184818) (_2!5260 lt!184821)) (= (_1!5260 lt!184818) (_1!5260 lt!184821)))))

(declare-fun lt!184816 () (_ BitVec 64))

(declare-fun lt!184817 () Bool)

(declare-fun lt!184820 () BitStream!4308)

(declare-fun lt!184819 () Unit!7329)

(declare-fun choose!45 (BitStream!4308 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!9990 tuple2!9990 BitStream!4308 (_ BitVec 64) Bool BitStream!4308 (_ BitVec 64) tuple2!9990 tuple2!9990 BitStream!4308 (_ BitVec 64)) Unit!7329)

(assert (=> d!38322 (= lt!184819 (choose!45 (_1!5259 lt!183750) nBits!396 i!615 lt!183755 lt!184818 (tuple2!9991 (_1!5260 lt!184818) (_2!5260 lt!184818)) (_1!5260 lt!184818) (_2!5260 lt!184818) lt!184817 lt!184820 lt!184816 lt!184821 (tuple2!9991 (_1!5260 lt!184821) (_2!5260 lt!184821)) (_1!5260 lt!184821) (_2!5260 lt!184821)))))

(assert (=> d!38322 (= lt!184821 (readNLeastSignificantBitsLoopPure!0 lt!184820 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!184816))))

(assert (=> d!38322 (= lt!184816 (bvor lt!183755 (ite lt!184817 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38322 (= lt!184820 (withMovedBitIndex!0 (_1!5259 lt!183750) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!38322 (= lt!184817 (_2!5258 (readBitPure!0 (_1!5259 lt!183750))))))

(assert (=> d!38322 (= lt!184818 (readNLeastSignificantBitsLoopPure!0 (_1!5259 lt!183750) nBits!396 i!615 lt!183755))))

(assert (=> d!38322 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5259 lt!183750) nBits!396 i!615 lt!183755) lt!184819)))

(declare-fun bs!9273 () Bool)

(assert (= bs!9273 d!38322))

(assert (=> bs!9273 m!179185))

(declare-fun m!179953 () Bool)

(assert (=> bs!9273 m!179953))

(assert (=> bs!9273 m!179163))

(declare-fun m!179955 () Bool)

(assert (=> bs!9273 m!179955))

(assert (=> bs!9273 m!179151))

(assert (=> b!119078 d!38322))

(declare-fun lt!184822 () tuple2!10010)

(declare-fun d!38324 () Bool)

(assert (=> d!38324 (= lt!184822 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!5259 lt!183750) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!183764))))

(assert (=> d!38324 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5259 lt!183750) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!183764) (tuple2!9991 (_2!5270 lt!184822) (_1!5270 lt!184822)))))

(declare-fun bs!9274 () Bool)

(assert (= bs!9274 d!38324))

(assert (=> bs!9274 m!179185))

(declare-fun m!179957 () Bool)

(assert (=> bs!9274 m!179957))

(assert (=> b!119078 d!38324))

(declare-fun d!38326 () Bool)

(declare-fun e!78260 () Bool)

(assert (=> d!38326 e!78260))

(declare-fun res!98867 () Bool)

(assert (=> d!38326 (=> (not res!98867) (not e!78260))))

(declare-fun lt!184828 () (_ BitVec 64))

(declare-fun lt!184827 () BitStream!4308)

(assert (=> d!38326 (= res!98867 (= (bvadd lt!184828 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2417 (buf!2839 lt!184827)) (currentByte!5500 lt!184827) (currentBit!5495 lt!184827))))))

(assert (=> d!38326 (or (not (= (bvand lt!184828 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!184828 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!184828 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38326 (= lt!184828 (bitIndex!0 (size!2417 (buf!2839 (_1!5259 lt!183750))) (currentByte!5500 (_1!5259 lt!183750)) (currentBit!5495 (_1!5259 lt!183750))))))

(declare-fun moveBitIndex!0 (BitStream!4308 (_ BitVec 64)) tuple2!9984)

(assert (=> d!38326 (= lt!184827 (_2!5257 (moveBitIndex!0 (_1!5259 lt!183750) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!4308 (_ BitVec 64)) Bool)

(assert (=> d!38326 (moveBitIndexPrecond!0 (_1!5259 lt!183750) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!38326 (= (withMovedBitIndex!0 (_1!5259 lt!183750) #b0000000000000000000000000000000000000000000000000000000000000001) lt!184827)))

(declare-fun b!119448 () Bool)

(assert (=> b!119448 (= e!78260 (= (size!2417 (buf!2839 (_1!5259 lt!183750))) (size!2417 (buf!2839 lt!184827))))))

(assert (= (and d!38326 res!98867) b!119448))

(declare-fun m!179959 () Bool)

(assert (=> d!38326 m!179959))

(declare-fun m!179961 () Bool)

(assert (=> d!38326 m!179961))

(declare-fun m!179963 () Bool)

(assert (=> d!38326 m!179963))

(declare-fun m!179965 () Bool)

(assert (=> d!38326 m!179965))

(assert (=> b!119078 d!38326))

(declare-fun d!38328 () Bool)

(declare-fun e!78261 () Bool)

(assert (=> d!38328 e!78261))

(declare-fun res!98868 () Bool)

(assert (=> d!38328 (=> (not res!98868) (not e!78261))))

(declare-fun lt!184829 () BitStream!4308)

(declare-fun lt!184830 () (_ BitVec 64))

(assert (=> d!38328 (= res!98868 (= (bvadd lt!184830 (bvsub (bitIndex!0 (size!2417 (buf!2839 thiss!1305)) (currentByte!5500 thiss!1305) (currentBit!5495 thiss!1305)) (bitIndex!0 (size!2417 (buf!2839 (_2!5257 lt!183747))) (currentByte!5500 (_2!5257 lt!183747)) (currentBit!5495 (_2!5257 lt!183747))))) (bitIndex!0 (size!2417 (buf!2839 lt!184829)) (currentByte!5500 lt!184829) (currentBit!5495 lt!184829))))))

(assert (=> d!38328 (or (not (= (bvand lt!184830 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2417 (buf!2839 thiss!1305)) (currentByte!5500 thiss!1305) (currentBit!5495 thiss!1305)) (bitIndex!0 (size!2417 (buf!2839 (_2!5257 lt!183747))) (currentByte!5500 (_2!5257 lt!183747)) (currentBit!5495 (_2!5257 lt!183747)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!184830 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!184830 (bvsub (bitIndex!0 (size!2417 (buf!2839 thiss!1305)) (currentByte!5500 thiss!1305) (currentBit!5495 thiss!1305)) (bitIndex!0 (size!2417 (buf!2839 (_2!5257 lt!183747))) (currentByte!5500 (_2!5257 lt!183747)) (currentBit!5495 (_2!5257 lt!183747))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38328 (= lt!184830 (bitIndex!0 (size!2417 (buf!2839 (_2!5259 lt!183750))) (currentByte!5500 (_2!5259 lt!183750)) (currentBit!5495 (_2!5259 lt!183750))))))

(assert (=> d!38328 (= lt!184829 (_2!5257 (moveBitIndex!0 (_2!5259 lt!183750) (bvsub (bitIndex!0 (size!2417 (buf!2839 thiss!1305)) (currentByte!5500 thiss!1305) (currentBit!5495 thiss!1305)) (bitIndex!0 (size!2417 (buf!2839 (_2!5257 lt!183747))) (currentByte!5500 (_2!5257 lt!183747)) (currentBit!5495 (_2!5257 lt!183747)))))))))

(assert (=> d!38328 (moveBitIndexPrecond!0 (_2!5259 lt!183750) (bvsub (bitIndex!0 (size!2417 (buf!2839 thiss!1305)) (currentByte!5500 thiss!1305) (currentBit!5495 thiss!1305)) (bitIndex!0 (size!2417 (buf!2839 (_2!5257 lt!183747))) (currentByte!5500 (_2!5257 lt!183747)) (currentBit!5495 (_2!5257 lt!183747)))))))

(assert (=> d!38328 (= (withMovedBitIndex!0 (_2!5259 lt!183750) (bvsub (bitIndex!0 (size!2417 (buf!2839 thiss!1305)) (currentByte!5500 thiss!1305) (currentBit!5495 thiss!1305)) (bitIndex!0 (size!2417 (buf!2839 (_2!5257 lt!183747))) (currentByte!5500 (_2!5257 lt!183747)) (currentBit!5495 (_2!5257 lt!183747))))) lt!184829)))

(declare-fun b!119449 () Bool)

(assert (=> b!119449 (= e!78261 (= (size!2417 (buf!2839 (_2!5259 lt!183750))) (size!2417 (buf!2839 lt!184829))))))

(assert (= (and d!38328 res!98868) b!119449))

(declare-fun m!179967 () Bool)

(assert (=> d!38328 m!179967))

(declare-fun m!179969 () Bool)

(assert (=> d!38328 m!179969))

(declare-fun m!179971 () Bool)

(assert (=> d!38328 m!179971))

(declare-fun m!179973 () Bool)

(assert (=> d!38328 m!179973))

(assert (=> b!119078 d!38328))

(assert (=> b!119078 d!38188))

(check-sat (not b!119415) (not b!119424) (not b!119248) (not d!38292) (not d!38312) (not b!119423) (not d!38302) (not b!119239) (not b!119443) (not b!119430) (not b!119417) (not d!38324) (not b!119250) (not d!38214) (not d!38188) (not b!119263) (not b!119438) (not d!38320) (not b!119264) (not d!38210) (not d!38326) (not d!38296) (not b!119426) (not d!38200) (not d!38190) (not d!38202) (not b!119241) (not d!38204) (not d!38294) (not d!38212) (not d!38196) (not b!119238) (not b!119420) (not d!38306) (not d!38304) (not d!38328) (not b!119267) (not b!119425) (not d!38314) (not d!38194) (not d!38298) (not d!38208) (not bm!1550) (not b!119432) (not d!38206) (not b!119416) (not b!119265) (not b!119422) (not d!38322) (not b!119428) (not d!38300) (not d!38186) (not b!119440) (not b!119429) (not b!119240))
(check-sat)
