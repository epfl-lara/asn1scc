; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21240 () Bool)

(assert start!21240)

(declare-fun b!107062 () Bool)

(declare-fun res!88218 () Bool)

(declare-fun e!70093 () Bool)

(assert (=> b!107062 (=> (not res!88218) (not e!70093))))

(declare-datatypes ((array!4918 0))(
  ( (array!4919 (arr!2833 (Array (_ BitVec 32) (_ BitVec 8))) (size!2240 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3954 0))(
  ( (BitStream!3955 (buf!2622 array!4918) (currentByte!5140 (_ BitVec 32)) (currentBit!5135 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3954)

(declare-datatypes ((Unit!6558 0))(
  ( (Unit!6559) )
))
(declare-datatypes ((tuple2!8820 0))(
  ( (tuple2!8821 (_1!4667 Unit!6558) (_2!4667 BitStream!3954)) )
))
(declare-fun lt!159698 () tuple2!8820)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!107062 (= res!88218 (invariant!0 (currentBit!5135 thiss!1305) (currentByte!5140 thiss!1305) (size!2240 (buf!2622 (_2!4667 lt!159698)))))))

(declare-fun b!107063 () Bool)

(declare-fun e!70097 () Bool)

(declare-fun e!70098 () Bool)

(assert (=> b!107063 (= e!70097 e!70098)))

(declare-fun res!88213 () Bool)

(assert (=> b!107063 (=> (not res!88213) (not e!70098))))

(declare-fun lt!159696 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!107063 (= res!88213 (validate_offset_bits!1 ((_ sign_extend 32) (size!2240 (buf!2622 thiss!1305))) ((_ sign_extend 32) (currentByte!5140 thiss!1305)) ((_ sign_extend 32) (currentBit!5135 thiss!1305)) lt!159696))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!107063 (= lt!159696 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-datatypes ((tuple2!8822 0))(
  ( (tuple2!8823 (_1!4668 BitStream!3954) (_2!4668 BitStream!3954)) )
))
(declare-fun lt!159718 () tuple2!8822)

(declare-fun e!70095 () Bool)

(declare-fun b!107064 () Bool)

(declare-fun lt!159715 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!3954 (_ BitVec 64)) BitStream!3954)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!107064 (= e!70095 (= (_1!4668 lt!159718) (withMovedBitIndex!0 (_2!4668 lt!159718) (bvsub (bitIndex!0 (size!2240 (buf!2622 (_2!4667 lt!159698))) (currentByte!5140 (_2!4667 lt!159698)) (currentBit!5135 (_2!4667 lt!159698))) lt!159715))))))

(declare-fun b!107065 () Bool)

(declare-fun e!70092 () Bool)

(declare-fun e!70089 () Bool)

(assert (=> b!107065 (= e!70092 e!70089)))

(declare-fun res!88224 () Bool)

(assert (=> b!107065 (=> (not res!88224) (not e!70089))))

(declare-fun lt!159700 () (_ BitVec 64))

(declare-fun lt!159697 () (_ BitVec 64))

(assert (=> b!107065 (= res!88224 (= lt!159700 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!159697)))))

(assert (=> b!107065 (= lt!159700 (bitIndex!0 (size!2240 (buf!2622 (_2!4667 lt!159698))) (currentByte!5140 (_2!4667 lt!159698)) (currentBit!5135 (_2!4667 lt!159698))))))

(assert (=> b!107065 (= lt!159697 (bitIndex!0 (size!2240 (buf!2622 thiss!1305)) (currentByte!5140 thiss!1305) (currentBit!5135 thiss!1305)))))

(declare-fun b!107066 () Bool)

(declare-fun e!70088 () Bool)

(assert (=> b!107066 (= e!70098 (not e!70088))))

(declare-fun res!88221 () Bool)

(assert (=> b!107066 (=> res!88221 e!70088)))

(declare-fun lt!159704 () (_ BitVec 64))

(declare-datatypes ((tuple2!8824 0))(
  ( (tuple2!8825 (_1!4669 BitStream!3954) (_2!4669 (_ BitVec 64))) )
))
(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3954 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8824)

(assert (=> b!107066 (= res!88221 (not (= (_1!4669 (readNLeastSignificantBitsLoopPure!0 (_1!4668 lt!159718) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!159704)) (_2!4668 lt!159718))))))

(declare-fun lt!159716 () tuple2!8820)

(declare-fun lt!159706 () (_ BitVec 64))

(assert (=> b!107066 (validate_offset_bits!1 ((_ sign_extend 32) (size!2240 (buf!2622 (_2!4667 lt!159716)))) ((_ sign_extend 32) (currentByte!5140 (_2!4667 lt!159698))) ((_ sign_extend 32) (currentBit!5135 (_2!4667 lt!159698))) lt!159706)))

(declare-fun lt!159711 () Unit!6558)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3954 array!4918 (_ BitVec 64)) Unit!6558)

(assert (=> b!107066 (= lt!159711 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4667 lt!159698) (buf!2622 (_2!4667 lt!159716)) lt!159706))))

(assert (=> b!107066 (= lt!159706 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!8826 0))(
  ( (tuple2!8827 (_1!4670 BitStream!3954) (_2!4670 Bool)) )
))
(declare-fun lt!159702 () tuple2!8826)

(declare-fun lt!159712 () (_ BitVec 64))

(declare-fun lt!159713 () (_ BitVec 64))

(assert (=> b!107066 (= lt!159704 (bvor lt!159712 (ite (_2!4670 lt!159702) lt!159713 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!159709 () tuple2!8822)

(declare-fun lt!159701 () tuple2!8824)

(assert (=> b!107066 (= lt!159701 (readNLeastSignificantBitsLoopPure!0 (_1!4668 lt!159709) nBits!396 i!615 lt!159712))))

(assert (=> b!107066 (validate_offset_bits!1 ((_ sign_extend 32) (size!2240 (buf!2622 (_2!4667 lt!159716)))) ((_ sign_extend 32) (currentByte!5140 thiss!1305)) ((_ sign_extend 32) (currentBit!5135 thiss!1305)) lt!159696)))

(declare-fun lt!159714 () Unit!6558)

(assert (=> b!107066 (= lt!159714 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2622 (_2!4667 lt!159716)) lt!159696))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!107066 (= lt!159712 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!159695 () Bool)

(assert (=> b!107066 (= (_2!4670 lt!159702) lt!159695)))

(declare-fun readBitPure!0 (BitStream!3954) tuple2!8826)

(assert (=> b!107066 (= lt!159702 (readBitPure!0 (_1!4668 lt!159709)))))

(declare-fun reader!0 (BitStream!3954 BitStream!3954) tuple2!8822)

(assert (=> b!107066 (= lt!159718 (reader!0 (_2!4667 lt!159698) (_2!4667 lt!159716)))))

(assert (=> b!107066 (= lt!159709 (reader!0 thiss!1305 (_2!4667 lt!159716)))))

(declare-fun e!70091 () Bool)

(assert (=> b!107066 e!70091))

(declare-fun res!88212 () Bool)

(assert (=> b!107066 (=> (not res!88212) (not e!70091))))

(declare-fun lt!159707 () tuple2!8826)

(declare-fun lt!159717 () tuple2!8826)

(assert (=> b!107066 (= res!88212 (= (bitIndex!0 (size!2240 (buf!2622 (_1!4670 lt!159707))) (currentByte!5140 (_1!4670 lt!159707)) (currentBit!5135 (_1!4670 lt!159707))) (bitIndex!0 (size!2240 (buf!2622 (_1!4670 lt!159717))) (currentByte!5140 (_1!4670 lt!159717)) (currentBit!5135 (_1!4670 lt!159717)))))))

(declare-fun lt!159708 () Unit!6558)

(declare-fun lt!159699 () BitStream!3954)

(declare-fun readBitPrefixLemma!0 (BitStream!3954 BitStream!3954) Unit!6558)

(assert (=> b!107066 (= lt!159708 (readBitPrefixLemma!0 lt!159699 (_2!4667 lt!159716)))))

(assert (=> b!107066 (= lt!159717 (readBitPure!0 (BitStream!3955 (buf!2622 (_2!4667 lt!159716)) (currentByte!5140 thiss!1305) (currentBit!5135 thiss!1305))))))

(assert (=> b!107066 (= lt!159707 (readBitPure!0 lt!159699))))

(assert (=> b!107066 (= lt!159699 (BitStream!3955 (buf!2622 (_2!4667 lt!159698)) (currentByte!5140 thiss!1305) (currentBit!5135 thiss!1305)))))

(assert (=> b!107066 e!70093))

(declare-fun res!88215 () Bool)

(assert (=> b!107066 (=> (not res!88215) (not e!70093))))

(declare-fun isPrefixOf!0 (BitStream!3954 BitStream!3954) Bool)

(assert (=> b!107066 (= res!88215 (isPrefixOf!0 thiss!1305 (_2!4667 lt!159716)))))

(declare-fun lt!159719 () Unit!6558)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3954 BitStream!3954 BitStream!3954) Unit!6558)

(assert (=> b!107066 (= lt!159719 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4667 lt!159698) (_2!4667 lt!159716)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3954 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8820)

(assert (=> b!107066 (= lt!159716 (appendNLeastSignificantBitsLoop!0 (_2!4667 lt!159698) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!107066 e!70092))

(declare-fun res!88223 () Bool)

(assert (=> b!107066 (=> (not res!88223) (not e!70092))))

(assert (=> b!107066 (= res!88223 (= (size!2240 (buf!2622 thiss!1305)) (size!2240 (buf!2622 (_2!4667 lt!159698)))))))

(declare-fun appendBit!0 (BitStream!3954 Bool) tuple2!8820)

(assert (=> b!107066 (= lt!159698 (appendBit!0 thiss!1305 lt!159695))))

(assert (=> b!107066 (= lt!159695 (not (= (bvand v!199 lt!159713) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!107066 (= lt!159713 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!107067 () Bool)

(declare-fun e!70090 () Bool)

(declare-fun lt!159705 () tuple2!8826)

(assert (=> b!107067 (= e!70090 (= (bitIndex!0 (size!2240 (buf!2622 (_1!4670 lt!159705))) (currentByte!5140 (_1!4670 lt!159705)) (currentBit!5135 (_1!4670 lt!159705))) lt!159700))))

(declare-fun b!107069 () Bool)

(assert (=> b!107069 (= e!70089 e!70090)))

(declare-fun res!88220 () Bool)

(assert (=> b!107069 (=> (not res!88220) (not e!70090))))

(assert (=> b!107069 (= res!88220 (and (= (_2!4670 lt!159705) lt!159695) (= (_1!4670 lt!159705) (_2!4667 lt!159698))))))

(declare-fun readerFrom!0 (BitStream!3954 (_ BitVec 32) (_ BitVec 32)) BitStream!3954)

(assert (=> b!107069 (= lt!159705 (readBitPure!0 (readerFrom!0 (_2!4667 lt!159698) (currentBit!5135 thiss!1305) (currentByte!5140 thiss!1305))))))

(declare-fun b!107070 () Bool)

(declare-fun e!70096 () Bool)

(declare-fun array_inv!2042 (array!4918) Bool)

(assert (=> b!107070 (= e!70096 (array_inv!2042 (buf!2622 thiss!1305)))))

(declare-fun b!107071 () Bool)

(assert (=> b!107071 (= e!70088 (invariant!0 (currentBit!5135 (_2!4667 lt!159698)) (currentByte!5140 (_2!4667 lt!159698)) (size!2240 (buf!2622 (_2!4667 lt!159698)))))))

(assert (=> b!107071 e!70095))

(declare-fun res!88217 () Bool)

(assert (=> b!107071 (=> (not res!88217) (not e!70095))))

(declare-fun lt!159720 () (_ BitVec 64))

(assert (=> b!107071 (= res!88217 (= (_1!4668 lt!159709) (withMovedBitIndex!0 (_2!4668 lt!159709) (bvsub lt!159720 lt!159715))))))

(assert (=> b!107071 (= lt!159715 (bitIndex!0 (size!2240 (buf!2622 (_2!4667 lt!159716))) (currentByte!5140 (_2!4667 lt!159716)) (currentBit!5135 (_2!4667 lt!159716))))))

(assert (=> b!107071 (= lt!159720 (bitIndex!0 (size!2240 (buf!2622 thiss!1305)) (currentByte!5140 thiss!1305) (currentBit!5135 thiss!1305)))))

(declare-fun lt!159703 () tuple2!8824)

(assert (=> b!107071 (and (= (_2!4669 lt!159701) (_2!4669 lt!159703)) (= (_1!4669 lt!159701) (_1!4669 lt!159703)))))

(declare-fun lt!159710 () Unit!6558)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3954 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6558)

(assert (=> b!107071 (= lt!159710 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4668 lt!159709) nBits!396 i!615 lt!159712))))

(assert (=> b!107071 (= lt!159703 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4668 lt!159709) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!159704))))

(declare-fun b!107072 () Bool)

(declare-fun res!88214 () Bool)

(assert (=> b!107072 (=> (not res!88214) (not e!70098))))

(assert (=> b!107072 (= res!88214 (bvslt i!615 nBits!396))))

(declare-fun b!107073 () Bool)

(assert (=> b!107073 (= e!70093 (invariant!0 (currentBit!5135 thiss!1305) (currentByte!5140 thiss!1305) (size!2240 (buf!2622 (_2!4667 lt!159716)))))))

(declare-fun b!107068 () Bool)

(assert (=> b!107068 (= e!70091 (= (_2!4670 lt!159707) (_2!4670 lt!159717)))))

(declare-fun res!88216 () Bool)

(assert (=> start!21240 (=> (not res!88216) (not e!70097))))

(assert (=> start!21240 (= res!88216 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21240 e!70097))

(assert (=> start!21240 true))

(declare-fun inv!12 (BitStream!3954) Bool)

(assert (=> start!21240 (and (inv!12 thiss!1305) e!70096)))

(declare-fun b!107074 () Bool)

(declare-fun res!88222 () Bool)

(assert (=> b!107074 (=> (not res!88222) (not e!70098))))

(assert (=> b!107074 (= res!88222 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!107075 () Bool)

(declare-fun res!88219 () Bool)

(assert (=> b!107075 (=> (not res!88219) (not e!70089))))

(assert (=> b!107075 (= res!88219 (isPrefixOf!0 thiss!1305 (_2!4667 lt!159698)))))

(assert (= (and start!21240 res!88216) b!107063))

(assert (= (and b!107063 res!88213) b!107074))

(assert (= (and b!107074 res!88222) b!107072))

(assert (= (and b!107072 res!88214) b!107066))

(assert (= (and b!107066 res!88223) b!107065))

(assert (= (and b!107065 res!88224) b!107075))

(assert (= (and b!107075 res!88219) b!107069))

(assert (= (and b!107069 res!88220) b!107067))

(assert (= (and b!107066 res!88215) b!107062))

(assert (= (and b!107062 res!88218) b!107073))

(assert (= (and b!107066 res!88212) b!107068))

(assert (= (and b!107066 (not res!88221)) b!107071))

(assert (= (and b!107071 res!88217) b!107064))

(assert (= start!21240 b!107070))

(declare-fun m!157975 () Bool)

(assert (=> b!107069 m!157975))

(assert (=> b!107069 m!157975))

(declare-fun m!157977 () Bool)

(assert (=> b!107069 m!157977))

(declare-fun m!157979 () Bool)

(assert (=> b!107075 m!157979))

(declare-fun m!157981 () Bool)

(assert (=> b!107063 m!157981))

(declare-fun m!157983 () Bool)

(assert (=> b!107070 m!157983))

(declare-fun m!157985 () Bool)

(assert (=> b!107071 m!157985))

(declare-fun m!157987 () Bool)

(assert (=> b!107071 m!157987))

(declare-fun m!157989 () Bool)

(assert (=> b!107071 m!157989))

(declare-fun m!157991 () Bool)

(assert (=> b!107071 m!157991))

(assert (=> b!107071 m!157991))

(declare-fun m!157993 () Bool)

(assert (=> b!107071 m!157993))

(declare-fun m!157995 () Bool)

(assert (=> b!107071 m!157995))

(declare-fun m!157997 () Bool)

(assert (=> b!107071 m!157997))

(declare-fun m!157999 () Bool)

(assert (=> b!107062 m!157999))

(declare-fun m!158001 () Bool)

(assert (=> b!107065 m!158001))

(assert (=> b!107065 m!157995))

(declare-fun m!158003 () Bool)

(assert (=> b!107067 m!158003))

(declare-fun m!158005 () Bool)

(assert (=> start!21240 m!158005))

(declare-fun m!158007 () Bool)

(assert (=> b!107066 m!158007))

(declare-fun m!158009 () Bool)

(assert (=> b!107066 m!158009))

(declare-fun m!158011 () Bool)

(assert (=> b!107066 m!158011))

(declare-fun m!158013 () Bool)

(assert (=> b!107066 m!158013))

(declare-fun m!158015 () Bool)

(assert (=> b!107066 m!158015))

(declare-fun m!158017 () Bool)

(assert (=> b!107066 m!158017))

(declare-fun m!158019 () Bool)

(assert (=> b!107066 m!158019))

(declare-fun m!158021 () Bool)

(assert (=> b!107066 m!158021))

(declare-fun m!158023 () Bool)

(assert (=> b!107066 m!158023))

(declare-fun m!158025 () Bool)

(assert (=> b!107066 m!158025))

(declare-fun m!158027 () Bool)

(assert (=> b!107066 m!158027))

(declare-fun m!158029 () Bool)

(assert (=> b!107066 m!158029))

(declare-fun m!158031 () Bool)

(assert (=> b!107066 m!158031))

(declare-fun m!158033 () Bool)

(assert (=> b!107066 m!158033))

(declare-fun m!158035 () Bool)

(assert (=> b!107066 m!158035))

(declare-fun m!158037 () Bool)

(assert (=> b!107066 m!158037))

(declare-fun m!158039 () Bool)

(assert (=> b!107066 m!158039))

(declare-fun m!158041 () Bool)

(assert (=> b!107066 m!158041))

(declare-fun m!158043 () Bool)

(assert (=> b!107066 m!158043))

(declare-fun m!158045 () Bool)

(assert (=> b!107074 m!158045))

(assert (=> b!107064 m!158001))

(declare-fun m!158047 () Bool)

(assert (=> b!107064 m!158047))

(declare-fun m!158049 () Bool)

(assert (=> b!107073 m!158049))

(check-sat (not b!107067) (not b!107073) (not start!21240) (not b!107066) (not b!107075) (not b!107071) (not b!107070) (not b!107064) (not b!107074) (not b!107063) (not b!107062) (not b!107069) (not b!107065))
(check-sat)
(get-model)

(declare-fun b!107213 () Bool)

(declare-fun res!88351 () Bool)

(declare-fun e!70187 () Bool)

(assert (=> b!107213 (=> (not res!88351) (not e!70187))))

(declare-fun lt!160106 () (_ BitVec 64))

(declare-fun lt!160094 () (_ BitVec 64))

(declare-fun lt!160097 () tuple2!8820)

(assert (=> b!107213 (= res!88351 (= (bitIndex!0 (size!2240 (buf!2622 (_2!4667 lt!160097))) (currentByte!5140 (_2!4667 lt!160097)) (currentBit!5135 (_2!4667 lt!160097))) (bvadd lt!160106 lt!160094)))))

(assert (=> b!107213 (or (not (= (bvand lt!160106 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!160094 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!160106 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!160106 lt!160094) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!107213 (= lt!160094 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!107213 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!107213 (= lt!160106 (bitIndex!0 (size!2240 (buf!2622 (_2!4667 lt!159698))) (currentByte!5140 (_2!4667 lt!159698)) (currentBit!5135 (_2!4667 lt!159698))))))

(declare-fun d!33740 () Bool)

(assert (=> d!33740 e!70187))

(declare-fun res!88350 () Bool)

(assert (=> d!33740 (=> (not res!88350) (not e!70187))))

(assert (=> d!33740 (= res!88350 (= (size!2240 (buf!2622 (_2!4667 lt!159698))) (size!2240 (buf!2622 (_2!4667 lt!160097)))))))

(declare-fun e!70191 () tuple2!8820)

(assert (=> d!33740 (= lt!160097 e!70191)))

(declare-fun c!6608 () Bool)

(assert (=> d!33740 (= c!6608 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!33740 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!33740 (= (appendNLeastSignificantBitsLoop!0 (_2!4667 lt!159698) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!160097)))

(declare-fun b!107214 () Bool)

(declare-fun res!88353 () Bool)

(declare-fun call!1353 () Bool)

(assert (=> b!107214 (= res!88353 call!1353)))

(declare-fun e!70186 () Bool)

(assert (=> b!107214 (=> (not res!88353) (not e!70186))))

(declare-fun b!107215 () Bool)

(declare-fun res!88347 () Bool)

(declare-fun lt!160101 () tuple2!8820)

(assert (=> b!107215 (= res!88347 (= (bitIndex!0 (size!2240 (buf!2622 (_2!4667 lt!160101))) (currentByte!5140 (_2!4667 lt!160101)) (currentBit!5135 (_2!4667 lt!160101))) (bvadd (bitIndex!0 (size!2240 (buf!2622 (_2!4667 lt!159698))) (currentByte!5140 (_2!4667 lt!159698)) (currentBit!5135 (_2!4667 lt!159698))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!107215 (=> (not res!88347) (not e!70186))))

(declare-fun b!107216 () Bool)

(declare-fun e!70189 () (_ BitVec 64))

(assert (=> b!107216 (= e!70189 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!107217 () Bool)

(declare-fun res!88348 () Bool)

(assert (=> b!107217 (=> (not res!88348) (not e!70187))))

(assert (=> b!107217 (= res!88348 (isPrefixOf!0 (_2!4667 lt!159698) (_2!4667 lt!160097)))))

(declare-fun b!107218 () Bool)

(declare-fun lt!160087 () Unit!6558)

(assert (=> b!107218 (= e!70191 (tuple2!8821 lt!160087 (_2!4667 lt!159698)))))

(declare-fun lt!160083 () BitStream!3954)

(assert (=> b!107218 (= lt!160083 (_2!4667 lt!159698))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3954) Unit!6558)

(assert (=> b!107218 (= lt!160087 (lemmaIsPrefixRefl!0 lt!160083))))

(assert (=> b!107218 call!1353))

(declare-fun b!107219 () Bool)

(declare-fun e!70190 () Bool)

(declare-fun lt!160099 () tuple2!8826)

(assert (=> b!107219 (= e!70190 (= (bitIndex!0 (size!2240 (buf!2622 (_1!4670 lt!160099))) (currentByte!5140 (_1!4670 lt!160099)) (currentBit!5135 (_1!4670 lt!160099))) (bitIndex!0 (size!2240 (buf!2622 (_2!4667 lt!160101))) (currentByte!5140 (_2!4667 lt!160101)) (currentBit!5135 (_2!4667 lt!160101)))))))

(declare-fun b!107220 () Bool)

(assert (=> b!107220 (= e!70189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!107221 () Bool)

(declare-fun e!70188 () Bool)

(declare-fun lt!160079 () (_ BitVec 64))

(assert (=> b!107221 (= e!70188 (validate_offset_bits!1 ((_ sign_extend 32) (size!2240 (buf!2622 (_2!4667 lt!159698)))) ((_ sign_extend 32) (currentByte!5140 (_2!4667 lt!159698))) ((_ sign_extend 32) (currentBit!5135 (_2!4667 lt!159698))) lt!160079))))

(declare-fun bm!1350 () Bool)

(assert (=> bm!1350 (= call!1353 (isPrefixOf!0 (ite c!6608 (_2!4667 lt!159698) lt!160083) (ite c!6608 (_2!4667 lt!160101) lt!160083)))))

(declare-fun b!107222 () Bool)

(declare-fun lt!160104 () tuple2!8820)

(declare-fun Unit!6562 () Unit!6558)

(assert (=> b!107222 (= e!70191 (tuple2!8821 Unit!6562 (_2!4667 lt!160104)))))

(declare-fun lt!160109 () Bool)

(assert (=> b!107222 (= lt!160109 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!107222 (= lt!160101 (appendBit!0 (_2!4667 lt!159698) lt!160109))))

(declare-fun res!88345 () Bool)

(assert (=> b!107222 (= res!88345 (= (size!2240 (buf!2622 (_2!4667 lt!159698))) (size!2240 (buf!2622 (_2!4667 lt!160101)))))))

(assert (=> b!107222 (=> (not res!88345) (not e!70186))))

(assert (=> b!107222 e!70186))

(declare-fun lt!160085 () tuple2!8820)

(assert (=> b!107222 (= lt!160085 lt!160101)))

(assert (=> b!107222 (= lt!160104 (appendNLeastSignificantBitsLoop!0 (_2!4667 lt!160085) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!160075 () Unit!6558)

(assert (=> b!107222 (= lt!160075 (lemmaIsPrefixTransitive!0 (_2!4667 lt!159698) (_2!4667 lt!160085) (_2!4667 lt!160104)))))

(assert (=> b!107222 (isPrefixOf!0 (_2!4667 lt!159698) (_2!4667 lt!160104))))

(declare-fun lt!160090 () Unit!6558)

(assert (=> b!107222 (= lt!160090 lt!160075)))

(assert (=> b!107222 (invariant!0 (currentBit!5135 (_2!4667 lt!159698)) (currentByte!5140 (_2!4667 lt!159698)) (size!2240 (buf!2622 (_2!4667 lt!160085))))))

(declare-fun lt!160076 () BitStream!3954)

(assert (=> b!107222 (= lt!160076 (BitStream!3955 (buf!2622 (_2!4667 lt!160085)) (currentByte!5140 (_2!4667 lt!159698)) (currentBit!5135 (_2!4667 lt!159698))))))

(assert (=> b!107222 (invariant!0 (currentBit!5135 lt!160076) (currentByte!5140 lt!160076) (size!2240 (buf!2622 (_2!4667 lt!160104))))))

(declare-fun lt!160089 () BitStream!3954)

(assert (=> b!107222 (= lt!160089 (BitStream!3955 (buf!2622 (_2!4667 lt!160104)) (currentByte!5140 lt!160076) (currentBit!5135 lt!160076)))))

(declare-fun lt!160102 () tuple2!8826)

(assert (=> b!107222 (= lt!160102 (readBitPure!0 lt!160076))))

(declare-fun lt!160080 () tuple2!8826)

(assert (=> b!107222 (= lt!160080 (readBitPure!0 lt!160089))))

(declare-fun lt!160095 () Unit!6558)

(assert (=> b!107222 (= lt!160095 (readBitPrefixLemma!0 lt!160076 (_2!4667 lt!160104)))))

(declare-fun res!88352 () Bool)

(assert (=> b!107222 (= res!88352 (= (bitIndex!0 (size!2240 (buf!2622 (_1!4670 lt!160102))) (currentByte!5140 (_1!4670 lt!160102)) (currentBit!5135 (_1!4670 lt!160102))) (bitIndex!0 (size!2240 (buf!2622 (_1!4670 lt!160080))) (currentByte!5140 (_1!4670 lt!160080)) (currentBit!5135 (_1!4670 lt!160080)))))))

(declare-fun e!70185 () Bool)

(assert (=> b!107222 (=> (not res!88352) (not e!70185))))

(assert (=> b!107222 e!70185))

(declare-fun lt!160081 () Unit!6558)

(assert (=> b!107222 (= lt!160081 lt!160095)))

(declare-fun lt!160117 () tuple2!8822)

(assert (=> b!107222 (= lt!160117 (reader!0 (_2!4667 lt!159698) (_2!4667 lt!160104)))))

(declare-fun lt!160096 () tuple2!8822)

(assert (=> b!107222 (= lt!160096 (reader!0 (_2!4667 lt!160085) (_2!4667 lt!160104)))))

(declare-fun lt!160077 () tuple2!8826)

(assert (=> b!107222 (= lt!160077 (readBitPure!0 (_1!4668 lt!160117)))))

(assert (=> b!107222 (= (_2!4670 lt!160077) lt!160109)))

(declare-fun lt!160098 () Unit!6558)

(declare-fun Unit!6563 () Unit!6558)

(assert (=> b!107222 (= lt!160098 Unit!6563)))

(declare-fun lt!160084 () (_ BitVec 64))

(assert (=> b!107222 (= lt!160084 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!160088 () (_ BitVec 64))

(assert (=> b!107222 (= lt!160088 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!160103 () Unit!6558)

(assert (=> b!107222 (= lt!160103 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4667 lt!159698) (buf!2622 (_2!4667 lt!160104)) lt!160088))))

(assert (=> b!107222 (validate_offset_bits!1 ((_ sign_extend 32) (size!2240 (buf!2622 (_2!4667 lt!160104)))) ((_ sign_extend 32) (currentByte!5140 (_2!4667 lt!159698))) ((_ sign_extend 32) (currentBit!5135 (_2!4667 lt!159698))) lt!160088)))

(declare-fun lt!160119 () Unit!6558)

(assert (=> b!107222 (= lt!160119 lt!160103)))

(declare-fun lt!160091 () tuple2!8824)

(assert (=> b!107222 (= lt!160091 (readNLeastSignificantBitsLoopPure!0 (_1!4668 lt!160117) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!160084))))

(declare-fun lt!160100 () (_ BitVec 64))

(assert (=> b!107222 (= lt!160100 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!160107 () Unit!6558)

(assert (=> b!107222 (= lt!160107 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4667 lt!160085) (buf!2622 (_2!4667 lt!160104)) lt!160100))))

(assert (=> b!107222 (validate_offset_bits!1 ((_ sign_extend 32) (size!2240 (buf!2622 (_2!4667 lt!160104)))) ((_ sign_extend 32) (currentByte!5140 (_2!4667 lt!160085))) ((_ sign_extend 32) (currentBit!5135 (_2!4667 lt!160085))) lt!160100)))

(declare-fun lt!160115 () Unit!6558)

(assert (=> b!107222 (= lt!160115 lt!160107)))

(declare-fun lt!160118 () tuple2!8824)

(assert (=> b!107222 (= lt!160118 (readNLeastSignificantBitsLoopPure!0 (_1!4668 lt!160096) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!160084 (ite (_2!4670 lt!160077) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!160105 () tuple2!8824)

(assert (=> b!107222 (= lt!160105 (readNLeastSignificantBitsLoopPure!0 (_1!4668 lt!160117) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!160084))))

(declare-fun c!6607 () Bool)

(assert (=> b!107222 (= c!6607 (_2!4670 (readBitPure!0 (_1!4668 lt!160117))))))

(declare-fun lt!160113 () tuple2!8824)

(assert (=> b!107222 (= lt!160113 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4668 lt!160117) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!160084 e!70189)))))

(declare-fun lt!160092 () Unit!6558)

(assert (=> b!107222 (= lt!160092 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4668 lt!160117) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!160084))))

(assert (=> b!107222 (and (= (_2!4669 lt!160105) (_2!4669 lt!160113)) (= (_1!4669 lt!160105) (_1!4669 lt!160113)))))

(declare-fun lt!160093 () Unit!6558)

(assert (=> b!107222 (= lt!160093 lt!160092)))

(assert (=> b!107222 (= (_1!4668 lt!160117) (withMovedBitIndex!0 (_2!4668 lt!160117) (bvsub (bitIndex!0 (size!2240 (buf!2622 (_2!4667 lt!159698))) (currentByte!5140 (_2!4667 lt!159698)) (currentBit!5135 (_2!4667 lt!159698))) (bitIndex!0 (size!2240 (buf!2622 (_2!4667 lt!160104))) (currentByte!5140 (_2!4667 lt!160104)) (currentBit!5135 (_2!4667 lt!160104))))))))

(declare-fun lt!160112 () Unit!6558)

(declare-fun Unit!6564 () Unit!6558)

(assert (=> b!107222 (= lt!160112 Unit!6564)))

(assert (=> b!107222 (= (_1!4668 lt!160096) (withMovedBitIndex!0 (_2!4668 lt!160096) (bvsub (bitIndex!0 (size!2240 (buf!2622 (_2!4667 lt!160085))) (currentByte!5140 (_2!4667 lt!160085)) (currentBit!5135 (_2!4667 lt!160085))) (bitIndex!0 (size!2240 (buf!2622 (_2!4667 lt!160104))) (currentByte!5140 (_2!4667 lt!160104)) (currentBit!5135 (_2!4667 lt!160104))))))))

(declare-fun lt!160078 () Unit!6558)

(declare-fun Unit!6565 () Unit!6558)

(assert (=> b!107222 (= lt!160078 Unit!6565)))

(assert (=> b!107222 (= (bitIndex!0 (size!2240 (buf!2622 (_2!4667 lt!159698))) (currentByte!5140 (_2!4667 lt!159698)) (currentBit!5135 (_2!4667 lt!159698))) (bvsub (bitIndex!0 (size!2240 (buf!2622 (_2!4667 lt!160085))) (currentByte!5140 (_2!4667 lt!160085)) (currentBit!5135 (_2!4667 lt!160085))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!160111 () Unit!6558)

(declare-fun Unit!6566 () Unit!6558)

(assert (=> b!107222 (= lt!160111 Unit!6566)))

(assert (=> b!107222 (= (_2!4669 lt!160091) (_2!4669 lt!160118))))

(declare-fun lt!160086 () Unit!6558)

(declare-fun Unit!6567 () Unit!6558)

(assert (=> b!107222 (= lt!160086 Unit!6567)))

(assert (=> b!107222 (= (_1!4669 lt!160091) (_2!4668 lt!160117))))

(declare-fun b!107223 () Bool)

(assert (=> b!107223 (= e!70185 (= (_2!4670 lt!160102) (_2!4670 lt!160080)))))

(declare-fun lt!160108 () tuple2!8822)

(declare-fun lt!160116 () tuple2!8824)

(declare-fun b!107224 () Bool)

(assert (=> b!107224 (= e!70187 (and (= (_2!4669 lt!160116) v!199) (= (_1!4669 lt!160116) (_2!4668 lt!160108))))))

(declare-fun lt!160114 () (_ BitVec 64))

(assert (=> b!107224 (= lt!160116 (readNLeastSignificantBitsLoopPure!0 (_1!4668 lt!160108) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!160114))))

(declare-fun lt!160082 () Unit!6558)

(declare-fun lt!160110 () Unit!6558)

(assert (=> b!107224 (= lt!160082 lt!160110)))

(assert (=> b!107224 (validate_offset_bits!1 ((_ sign_extend 32) (size!2240 (buf!2622 (_2!4667 lt!160097)))) ((_ sign_extend 32) (currentByte!5140 (_2!4667 lt!159698))) ((_ sign_extend 32) (currentBit!5135 (_2!4667 lt!159698))) lt!160079)))

(assert (=> b!107224 (= lt!160110 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4667 lt!159698) (buf!2622 (_2!4667 lt!160097)) lt!160079))))

(assert (=> b!107224 e!70188))

(declare-fun res!88349 () Bool)

(assert (=> b!107224 (=> (not res!88349) (not e!70188))))

(assert (=> b!107224 (= res!88349 (and (= (size!2240 (buf!2622 (_2!4667 lt!159698))) (size!2240 (buf!2622 (_2!4667 lt!160097)))) (bvsge lt!160079 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!107224 (= lt!160079 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!107224 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!107224 (= lt!160114 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!107224 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!107224 (= lt!160108 (reader!0 (_2!4667 lt!159698) (_2!4667 lt!160097)))))

(declare-fun b!107225 () Bool)

(assert (=> b!107225 (= lt!160099 (readBitPure!0 (readerFrom!0 (_2!4667 lt!160101) (currentBit!5135 (_2!4667 lt!159698)) (currentByte!5140 (_2!4667 lt!159698)))))))

(declare-fun res!88346 () Bool)

(assert (=> b!107225 (= res!88346 (and (= (_2!4670 lt!160099) lt!160109) (= (_1!4670 lt!160099) (_2!4667 lt!160101))))))

(assert (=> b!107225 (=> (not res!88346) (not e!70190))))

(assert (=> b!107225 (= e!70186 e!70190)))

(assert (= (and d!33740 c!6608) b!107222))

(assert (= (and d!33740 (not c!6608)) b!107218))

(assert (= (and b!107222 res!88345) b!107215))

(assert (= (and b!107215 res!88347) b!107214))

(assert (= (and b!107214 res!88353) b!107225))

(assert (= (and b!107225 res!88346) b!107219))

(assert (= (and b!107222 res!88352) b!107223))

(assert (= (and b!107222 c!6607) b!107220))

(assert (= (and b!107222 (not c!6607)) b!107216))

(assert (= (or b!107214 b!107218) bm!1350))

(assert (= (and d!33740 res!88350) b!107213))

(assert (= (and b!107213 res!88351) b!107217))

(assert (= (and b!107217 res!88348) b!107224))

(assert (= (and b!107224 res!88349) b!107221))

(declare-fun m!158237 () Bool)

(assert (=> b!107224 m!158237))

(declare-fun m!158239 () Bool)

(assert (=> b!107224 m!158239))

(declare-fun m!158241 () Bool)

(assert (=> b!107224 m!158241))

(declare-fun m!158243 () Bool)

(assert (=> b!107224 m!158243))

(declare-fun m!158245 () Bool)

(assert (=> b!107224 m!158245))

(declare-fun m!158247 () Bool)

(assert (=> b!107213 m!158247))

(assert (=> b!107213 m!158001))

(declare-fun m!158249 () Bool)

(assert (=> b!107217 m!158249))

(declare-fun m!158251 () Bool)

(assert (=> b!107222 m!158251))

(declare-fun m!158253 () Bool)

(assert (=> b!107222 m!158253))

(declare-fun m!158255 () Bool)

(assert (=> b!107222 m!158255))

(declare-fun m!158257 () Bool)

(assert (=> b!107222 m!158257))

(declare-fun m!158259 () Bool)

(assert (=> b!107222 m!158259))

(declare-fun m!158261 () Bool)

(assert (=> b!107222 m!158261))

(declare-fun m!158263 () Bool)

(assert (=> b!107222 m!158263))

(declare-fun m!158265 () Bool)

(assert (=> b!107222 m!158265))

(assert (=> b!107222 m!158241))

(declare-fun m!158267 () Bool)

(assert (=> b!107222 m!158267))

(declare-fun m!158269 () Bool)

(assert (=> b!107222 m!158269))

(declare-fun m!158271 () Bool)

(assert (=> b!107222 m!158271))

(assert (=> b!107222 m!158257))

(declare-fun m!158273 () Bool)

(assert (=> b!107222 m!158273))

(declare-fun m!158275 () Bool)

(assert (=> b!107222 m!158275))

(declare-fun m!158277 () Bool)

(assert (=> b!107222 m!158277))

(declare-fun m!158279 () Bool)

(assert (=> b!107222 m!158279))

(declare-fun m!158281 () Bool)

(assert (=> b!107222 m!158281))

(declare-fun m!158283 () Bool)

(assert (=> b!107222 m!158283))

(declare-fun m!158285 () Bool)

(assert (=> b!107222 m!158285))

(declare-fun m!158287 () Bool)

(assert (=> b!107222 m!158287))

(declare-fun m!158289 () Bool)

(assert (=> b!107222 m!158289))

(assert (=> b!107222 m!158001))

(declare-fun m!158291 () Bool)

(assert (=> b!107222 m!158291))

(declare-fun m!158293 () Bool)

(assert (=> b!107222 m!158293))

(declare-fun m!158295 () Bool)

(assert (=> b!107222 m!158295))

(declare-fun m!158297 () Bool)

(assert (=> b!107222 m!158297))

(declare-fun m!158299 () Bool)

(assert (=> b!107222 m!158299))

(declare-fun m!158301 () Bool)

(assert (=> b!107222 m!158301))

(declare-fun m!158303 () Bool)

(assert (=> b!107222 m!158303))

(declare-fun m!158305 () Bool)

(assert (=> bm!1350 m!158305))

(declare-fun m!158307 () Bool)

(assert (=> b!107218 m!158307))

(declare-fun m!158309 () Bool)

(assert (=> b!107215 m!158309))

(assert (=> b!107215 m!158001))

(declare-fun m!158311 () Bool)

(assert (=> b!107225 m!158311))

(assert (=> b!107225 m!158311))

(declare-fun m!158313 () Bool)

(assert (=> b!107225 m!158313))

(declare-fun m!158315 () Bool)

(assert (=> b!107221 m!158315))

(declare-fun m!158317 () Bool)

(assert (=> b!107219 m!158317))

(assert (=> b!107219 m!158309))

(assert (=> b!107066 d!33740))

(declare-fun d!33792 () Bool)

(assert (=> d!33792 (validate_offset_bits!1 ((_ sign_extend 32) (size!2240 (buf!2622 (_2!4667 lt!159716)))) ((_ sign_extend 32) (currentByte!5140 (_2!4667 lt!159698))) ((_ sign_extend 32) (currentBit!5135 (_2!4667 lt!159698))) lt!159706)))

(declare-fun lt!160122 () Unit!6558)

(declare-fun choose!9 (BitStream!3954 array!4918 (_ BitVec 64) BitStream!3954) Unit!6558)

(assert (=> d!33792 (= lt!160122 (choose!9 (_2!4667 lt!159698) (buf!2622 (_2!4667 lt!159716)) lt!159706 (BitStream!3955 (buf!2622 (_2!4667 lt!159716)) (currentByte!5140 (_2!4667 lt!159698)) (currentBit!5135 (_2!4667 lt!159698)))))))

(assert (=> d!33792 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4667 lt!159698) (buf!2622 (_2!4667 lt!159716)) lt!159706) lt!160122)))

(declare-fun bs!8245 () Bool)

(assert (= bs!8245 d!33792))

(assert (=> bs!8245 m!158033))

(declare-fun m!158319 () Bool)

(assert (=> bs!8245 m!158319))

(assert (=> b!107066 d!33792))

(declare-fun d!33794 () Bool)

(declare-fun e!70197 () Bool)

(assert (=> d!33794 e!70197))

(declare-fun res!88362 () Bool)

(assert (=> d!33794 (=> (not res!88362) (not e!70197))))

(declare-fun lt!160173 () tuple2!8822)

(assert (=> d!33794 (= res!88362 (isPrefixOf!0 (_1!4668 lt!160173) (_2!4668 lt!160173)))))

(declare-fun lt!160168 () BitStream!3954)

(assert (=> d!33794 (= lt!160173 (tuple2!8823 lt!160168 (_2!4667 lt!159716)))))

(declare-fun lt!160171 () Unit!6558)

(declare-fun lt!160165 () Unit!6558)

(assert (=> d!33794 (= lt!160171 lt!160165)))

(assert (=> d!33794 (isPrefixOf!0 lt!160168 (_2!4667 lt!159716))))

(assert (=> d!33794 (= lt!160165 (lemmaIsPrefixTransitive!0 lt!160168 (_2!4667 lt!159716) (_2!4667 lt!159716)))))

(declare-fun lt!160170 () Unit!6558)

(declare-fun lt!160178 () Unit!6558)

(assert (=> d!33794 (= lt!160170 lt!160178)))

(assert (=> d!33794 (isPrefixOf!0 lt!160168 (_2!4667 lt!159716))))

(assert (=> d!33794 (= lt!160178 (lemmaIsPrefixTransitive!0 lt!160168 thiss!1305 (_2!4667 lt!159716)))))

(declare-fun lt!160176 () Unit!6558)

(declare-fun e!70196 () Unit!6558)

(assert (=> d!33794 (= lt!160176 e!70196)))

(declare-fun c!6611 () Bool)

(assert (=> d!33794 (= c!6611 (not (= (size!2240 (buf!2622 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!160175 () Unit!6558)

(declare-fun lt!160177 () Unit!6558)

(assert (=> d!33794 (= lt!160175 lt!160177)))

(assert (=> d!33794 (isPrefixOf!0 (_2!4667 lt!159716) (_2!4667 lt!159716))))

(assert (=> d!33794 (= lt!160177 (lemmaIsPrefixRefl!0 (_2!4667 lt!159716)))))

(declare-fun lt!160166 () Unit!6558)

(declare-fun lt!160169 () Unit!6558)

(assert (=> d!33794 (= lt!160166 lt!160169)))

(assert (=> d!33794 (= lt!160169 (lemmaIsPrefixRefl!0 (_2!4667 lt!159716)))))

(declare-fun lt!160180 () Unit!6558)

(declare-fun lt!160163 () Unit!6558)

(assert (=> d!33794 (= lt!160180 lt!160163)))

(assert (=> d!33794 (isPrefixOf!0 lt!160168 lt!160168)))

(assert (=> d!33794 (= lt!160163 (lemmaIsPrefixRefl!0 lt!160168))))

(declare-fun lt!160182 () Unit!6558)

(declare-fun lt!160172 () Unit!6558)

(assert (=> d!33794 (= lt!160182 lt!160172)))

(assert (=> d!33794 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!33794 (= lt!160172 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!33794 (= lt!160168 (BitStream!3955 (buf!2622 (_2!4667 lt!159716)) (currentByte!5140 thiss!1305) (currentBit!5135 thiss!1305)))))

(assert (=> d!33794 (isPrefixOf!0 thiss!1305 (_2!4667 lt!159716))))

(assert (=> d!33794 (= (reader!0 thiss!1305 (_2!4667 lt!159716)) lt!160173)))

(declare-fun b!107236 () Bool)

(declare-fun res!88361 () Bool)

(assert (=> b!107236 (=> (not res!88361) (not e!70197))))

(assert (=> b!107236 (= res!88361 (isPrefixOf!0 (_1!4668 lt!160173) thiss!1305))))

(declare-fun b!107237 () Bool)

(declare-fun lt!160167 () Unit!6558)

(assert (=> b!107237 (= e!70196 lt!160167)))

(declare-fun lt!160174 () (_ BitVec 64))

(assert (=> b!107237 (= lt!160174 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160179 () (_ BitVec 64))

(assert (=> b!107237 (= lt!160179 (bitIndex!0 (size!2240 (buf!2622 thiss!1305)) (currentByte!5140 thiss!1305) (currentBit!5135 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4918 array!4918 (_ BitVec 64) (_ BitVec 64)) Unit!6558)

(assert (=> b!107237 (= lt!160167 (arrayBitRangesEqSymmetric!0 (buf!2622 thiss!1305) (buf!2622 (_2!4667 lt!159716)) lt!160174 lt!160179))))

(declare-fun arrayBitRangesEq!0 (array!4918 array!4918 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!107237 (arrayBitRangesEq!0 (buf!2622 (_2!4667 lt!159716)) (buf!2622 thiss!1305) lt!160174 lt!160179)))

(declare-fun lt!160164 () (_ BitVec 64))

(declare-fun lt!160181 () (_ BitVec 64))

(declare-fun b!107238 () Bool)

(assert (=> b!107238 (= e!70197 (= (_1!4668 lt!160173) (withMovedBitIndex!0 (_2!4668 lt!160173) (bvsub lt!160181 lt!160164))))))

(assert (=> b!107238 (or (= (bvand lt!160181 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!160164 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!160181 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!160181 lt!160164) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!107238 (= lt!160164 (bitIndex!0 (size!2240 (buf!2622 (_2!4667 lt!159716))) (currentByte!5140 (_2!4667 lt!159716)) (currentBit!5135 (_2!4667 lt!159716))))))

(assert (=> b!107238 (= lt!160181 (bitIndex!0 (size!2240 (buf!2622 thiss!1305)) (currentByte!5140 thiss!1305) (currentBit!5135 thiss!1305)))))

(declare-fun b!107239 () Bool)

(declare-fun res!88360 () Bool)

(assert (=> b!107239 (=> (not res!88360) (not e!70197))))

(assert (=> b!107239 (= res!88360 (isPrefixOf!0 (_2!4668 lt!160173) (_2!4667 lt!159716)))))

(declare-fun b!107240 () Bool)

(declare-fun Unit!6568 () Unit!6558)

(assert (=> b!107240 (= e!70196 Unit!6568)))

(assert (= (and d!33794 c!6611) b!107237))

(assert (= (and d!33794 (not c!6611)) b!107240))

(assert (= (and d!33794 res!88362) b!107236))

(assert (= (and b!107236 res!88361) b!107239))

(assert (= (and b!107239 res!88360) b!107238))

(declare-fun m!158321 () Bool)

(assert (=> b!107239 m!158321))

(declare-fun m!158323 () Bool)

(assert (=> b!107238 m!158323))

(assert (=> b!107238 m!157989))

(assert (=> b!107238 m!157995))

(assert (=> b!107237 m!157995))

(declare-fun m!158325 () Bool)

(assert (=> b!107237 m!158325))

(declare-fun m!158327 () Bool)

(assert (=> b!107237 m!158327))

(declare-fun m!158329 () Bool)

(assert (=> d!33794 m!158329))

(declare-fun m!158331 () Bool)

(assert (=> d!33794 m!158331))

(declare-fun m!158333 () Bool)

(assert (=> d!33794 m!158333))

(declare-fun m!158335 () Bool)

(assert (=> d!33794 m!158335))

(declare-fun m!158337 () Bool)

(assert (=> d!33794 m!158337))

(declare-fun m!158339 () Bool)

(assert (=> d!33794 m!158339))

(declare-fun m!158341 () Bool)

(assert (=> d!33794 m!158341))

(declare-fun m!158343 () Bool)

(assert (=> d!33794 m!158343))

(declare-fun m!158345 () Bool)

(assert (=> d!33794 m!158345))

(declare-fun m!158347 () Bool)

(assert (=> d!33794 m!158347))

(assert (=> d!33794 m!158037))

(declare-fun m!158349 () Bool)

(assert (=> b!107236 m!158349))

(assert (=> b!107066 d!33794))

(declare-fun d!33796 () Bool)

(declare-fun e!70200 () Bool)

(assert (=> d!33796 e!70200))

(declare-fun res!88367 () Bool)

(assert (=> d!33796 (=> (not res!88367) (not e!70200))))

(declare-fun lt!160199 () (_ BitVec 64))

(declare-fun lt!160198 () (_ BitVec 64))

(declare-fun lt!160196 () (_ BitVec 64))

(assert (=> d!33796 (= res!88367 (= lt!160199 (bvsub lt!160196 lt!160198)))))

(assert (=> d!33796 (or (= (bvand lt!160196 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!160198 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!160196 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!160196 lt!160198) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!33796 (= lt!160198 (remainingBits!0 ((_ sign_extend 32) (size!2240 (buf!2622 (_1!4670 lt!159717)))) ((_ sign_extend 32) (currentByte!5140 (_1!4670 lt!159717))) ((_ sign_extend 32) (currentBit!5135 (_1!4670 lt!159717)))))))

(declare-fun lt!160200 () (_ BitVec 64))

(declare-fun lt!160197 () (_ BitVec 64))

(assert (=> d!33796 (= lt!160196 (bvmul lt!160200 lt!160197))))

(assert (=> d!33796 (or (= lt!160200 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!160197 (bvsdiv (bvmul lt!160200 lt!160197) lt!160200)))))

(assert (=> d!33796 (= lt!160197 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33796 (= lt!160200 ((_ sign_extend 32) (size!2240 (buf!2622 (_1!4670 lt!159717)))))))

(assert (=> d!33796 (= lt!160199 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5140 (_1!4670 lt!159717))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5135 (_1!4670 lt!159717)))))))

(assert (=> d!33796 (invariant!0 (currentBit!5135 (_1!4670 lt!159717)) (currentByte!5140 (_1!4670 lt!159717)) (size!2240 (buf!2622 (_1!4670 lt!159717))))))

(assert (=> d!33796 (= (bitIndex!0 (size!2240 (buf!2622 (_1!4670 lt!159717))) (currentByte!5140 (_1!4670 lt!159717)) (currentBit!5135 (_1!4670 lt!159717))) lt!160199)))

(declare-fun b!107245 () Bool)

(declare-fun res!88368 () Bool)

(assert (=> b!107245 (=> (not res!88368) (not e!70200))))

(assert (=> b!107245 (= res!88368 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!160199))))

(declare-fun b!107246 () Bool)

(declare-fun lt!160195 () (_ BitVec 64))

(assert (=> b!107246 (= e!70200 (bvsle lt!160199 (bvmul lt!160195 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!107246 (or (= lt!160195 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!160195 #b0000000000000000000000000000000000000000000000000000000000001000) lt!160195)))))

(assert (=> b!107246 (= lt!160195 ((_ sign_extend 32) (size!2240 (buf!2622 (_1!4670 lt!159717)))))))

(assert (= (and d!33796 res!88367) b!107245))

(assert (= (and b!107245 res!88368) b!107246))

(declare-fun m!158351 () Bool)

(assert (=> d!33796 m!158351))

(declare-fun m!158353 () Bool)

(assert (=> d!33796 m!158353))

(assert (=> b!107066 d!33796))

(declare-fun d!33798 () Bool)

(assert (=> d!33798 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2240 (buf!2622 (_2!4667 lt!159716)))) ((_ sign_extend 32) (currentByte!5140 (_2!4667 lt!159698))) ((_ sign_extend 32) (currentBit!5135 (_2!4667 lt!159698))) lt!159706) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2240 (buf!2622 (_2!4667 lt!159716)))) ((_ sign_extend 32) (currentByte!5140 (_2!4667 lt!159698))) ((_ sign_extend 32) (currentBit!5135 (_2!4667 lt!159698)))) lt!159706))))

(declare-fun bs!8246 () Bool)

(assert (= bs!8246 d!33798))

(declare-fun m!158355 () Bool)

(assert (=> bs!8246 m!158355))

(assert (=> b!107066 d!33798))

(declare-fun d!33800 () Bool)

(declare-fun e!70205 () Bool)

(assert (=> d!33800 e!70205))

(declare-fun res!88380 () Bool)

(assert (=> d!33800 (=> (not res!88380) (not e!70205))))

(declare-fun lt!160209 () tuple2!8820)

(assert (=> d!33800 (= res!88380 (= (size!2240 (buf!2622 thiss!1305)) (size!2240 (buf!2622 (_2!4667 lt!160209)))))))

(declare-fun choose!16 (BitStream!3954 Bool) tuple2!8820)

(assert (=> d!33800 (= lt!160209 (choose!16 thiss!1305 lt!159695))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!33800 (validate_offset_bit!0 ((_ sign_extend 32) (size!2240 (buf!2622 thiss!1305))) ((_ sign_extend 32) (currentByte!5140 thiss!1305)) ((_ sign_extend 32) (currentBit!5135 thiss!1305)))))

(assert (=> d!33800 (= (appendBit!0 thiss!1305 lt!159695) lt!160209)))

(declare-fun b!107259 () Bool)

(declare-fun e!70206 () Bool)

(declare-fun lt!160212 () tuple2!8826)

(assert (=> b!107259 (= e!70206 (= (bitIndex!0 (size!2240 (buf!2622 (_1!4670 lt!160212))) (currentByte!5140 (_1!4670 lt!160212)) (currentBit!5135 (_1!4670 lt!160212))) (bitIndex!0 (size!2240 (buf!2622 (_2!4667 lt!160209))) (currentByte!5140 (_2!4667 lt!160209)) (currentBit!5135 (_2!4667 lt!160209)))))))

(declare-fun b!107257 () Bool)

(declare-fun res!88378 () Bool)

(assert (=> b!107257 (=> (not res!88378) (not e!70205))))

(assert (=> b!107257 (= res!88378 (isPrefixOf!0 thiss!1305 (_2!4667 lt!160209)))))

(declare-fun b!107256 () Bool)

(declare-fun res!88377 () Bool)

(assert (=> b!107256 (=> (not res!88377) (not e!70205))))

(declare-fun lt!160210 () (_ BitVec 64))

(declare-fun lt!160211 () (_ BitVec 64))

(assert (=> b!107256 (= res!88377 (= (bitIndex!0 (size!2240 (buf!2622 (_2!4667 lt!160209))) (currentByte!5140 (_2!4667 lt!160209)) (currentBit!5135 (_2!4667 lt!160209))) (bvadd lt!160211 lt!160210)))))

(assert (=> b!107256 (or (not (= (bvand lt!160211 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!160210 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!160211 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!160211 lt!160210) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!107256 (= lt!160210 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!107256 (= lt!160211 (bitIndex!0 (size!2240 (buf!2622 thiss!1305)) (currentByte!5140 thiss!1305) (currentBit!5135 thiss!1305)))))

(declare-fun b!107258 () Bool)

(assert (=> b!107258 (= e!70205 e!70206)))

(declare-fun res!88379 () Bool)

(assert (=> b!107258 (=> (not res!88379) (not e!70206))))

(assert (=> b!107258 (= res!88379 (and (= (_2!4670 lt!160212) lt!159695) (= (_1!4670 lt!160212) (_2!4667 lt!160209))))))

(assert (=> b!107258 (= lt!160212 (readBitPure!0 (readerFrom!0 (_2!4667 lt!160209) (currentBit!5135 thiss!1305) (currentByte!5140 thiss!1305))))))

(assert (= (and d!33800 res!88380) b!107256))

(assert (= (and b!107256 res!88377) b!107257))

(assert (= (and b!107257 res!88378) b!107258))

(assert (= (and b!107258 res!88379) b!107259))

(declare-fun m!158357 () Bool)

(assert (=> d!33800 m!158357))

(declare-fun m!158359 () Bool)

(assert (=> d!33800 m!158359))

(declare-fun m!158361 () Bool)

(assert (=> b!107256 m!158361))

(assert (=> b!107256 m!157995))

(declare-fun m!158363 () Bool)

(assert (=> b!107258 m!158363))

(assert (=> b!107258 m!158363))

(declare-fun m!158365 () Bool)

(assert (=> b!107258 m!158365))

(declare-fun m!158367 () Bool)

(assert (=> b!107259 m!158367))

(assert (=> b!107259 m!158361))

(declare-fun m!158369 () Bool)

(assert (=> b!107257 m!158369))

(assert (=> b!107066 d!33800))

(declare-fun d!33802 () Bool)

(declare-datatypes ((tuple2!8836 0))(
  ( (tuple2!8837 (_1!4675 Bool) (_2!4675 BitStream!3954)) )
))
(declare-fun lt!160215 () tuple2!8836)

(declare-fun readBit!0 (BitStream!3954) tuple2!8836)

(assert (=> d!33802 (= lt!160215 (readBit!0 lt!159699))))

(assert (=> d!33802 (= (readBitPure!0 lt!159699) (tuple2!8827 (_2!4675 lt!160215) (_1!4675 lt!160215)))))

(declare-fun bs!8247 () Bool)

(assert (= bs!8247 d!33802))

(declare-fun m!158371 () Bool)

(assert (=> bs!8247 m!158371))

(assert (=> b!107066 d!33802))

(declare-fun d!33804 () Bool)

(assert (=> d!33804 (isPrefixOf!0 thiss!1305 (_2!4667 lt!159716))))

(declare-fun lt!160218 () Unit!6558)

(declare-fun choose!30 (BitStream!3954 BitStream!3954 BitStream!3954) Unit!6558)

(assert (=> d!33804 (= lt!160218 (choose!30 thiss!1305 (_2!4667 lt!159698) (_2!4667 lt!159716)))))

(assert (=> d!33804 (isPrefixOf!0 thiss!1305 (_2!4667 lt!159698))))

(assert (=> d!33804 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4667 lt!159698) (_2!4667 lt!159716)) lt!160218)))

(declare-fun bs!8248 () Bool)

(assert (= bs!8248 d!33804))

(assert (=> bs!8248 m!158037))

(declare-fun m!158373 () Bool)

(assert (=> bs!8248 m!158373))

(assert (=> bs!8248 m!157979))

(assert (=> b!107066 d!33804))

(declare-fun d!33806 () Bool)

(assert (=> d!33806 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2240 (buf!2622 (_2!4667 lt!159716)))) ((_ sign_extend 32) (currentByte!5140 thiss!1305)) ((_ sign_extend 32) (currentBit!5135 thiss!1305)) lt!159696) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2240 (buf!2622 (_2!4667 lt!159716)))) ((_ sign_extend 32) (currentByte!5140 thiss!1305)) ((_ sign_extend 32) (currentBit!5135 thiss!1305))) lt!159696))))

(declare-fun bs!8249 () Bool)

(assert (= bs!8249 d!33806))

(declare-fun m!158375 () Bool)

(assert (=> bs!8249 m!158375))

(assert (=> b!107066 d!33806))

(declare-datatypes ((tuple2!8838 0))(
  ( (tuple2!8839 (_1!4676 (_ BitVec 64)) (_2!4676 BitStream!3954)) )
))
(declare-fun lt!160221 () tuple2!8838)

(declare-fun d!33808 () Bool)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!3954 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8838)

(assert (=> d!33808 (= lt!160221 (readNLeastSignificantBitsLoop!0 (_1!4668 lt!159709) nBits!396 i!615 lt!159712))))

(assert (=> d!33808 (= (readNLeastSignificantBitsLoopPure!0 (_1!4668 lt!159709) nBits!396 i!615 lt!159712) (tuple2!8825 (_2!4676 lt!160221) (_1!4676 lt!160221)))))

(declare-fun bs!8250 () Bool)

(assert (= bs!8250 d!33808))

(declare-fun m!158377 () Bool)

(assert (=> bs!8250 m!158377))

(assert (=> b!107066 d!33808))

(declare-fun d!33810 () Bool)

(assert (=> d!33810 (validate_offset_bits!1 ((_ sign_extend 32) (size!2240 (buf!2622 (_2!4667 lt!159716)))) ((_ sign_extend 32) (currentByte!5140 thiss!1305)) ((_ sign_extend 32) (currentBit!5135 thiss!1305)) lt!159696)))

(declare-fun lt!160222 () Unit!6558)

(assert (=> d!33810 (= lt!160222 (choose!9 thiss!1305 (buf!2622 (_2!4667 lt!159716)) lt!159696 (BitStream!3955 (buf!2622 (_2!4667 lt!159716)) (currentByte!5140 thiss!1305) (currentBit!5135 thiss!1305))))))

(assert (=> d!33810 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2622 (_2!4667 lt!159716)) lt!159696) lt!160222)))

(declare-fun bs!8251 () Bool)

(assert (= bs!8251 d!33810))

(assert (=> bs!8251 m!158039))

(declare-fun m!158379 () Bool)

(assert (=> bs!8251 m!158379))

(assert (=> b!107066 d!33810))

(declare-fun d!33812 () Bool)

(assert (=> d!33812 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!107066 d!33812))

(declare-fun d!33814 () Bool)

(declare-fun lt!160223 () tuple2!8836)

(assert (=> d!33814 (= lt!160223 (readBit!0 (BitStream!3955 (buf!2622 (_2!4667 lt!159716)) (currentByte!5140 thiss!1305) (currentBit!5135 thiss!1305))))))

(assert (=> d!33814 (= (readBitPure!0 (BitStream!3955 (buf!2622 (_2!4667 lt!159716)) (currentByte!5140 thiss!1305) (currentBit!5135 thiss!1305))) (tuple2!8827 (_2!4675 lt!160223) (_1!4675 lt!160223)))))

(declare-fun bs!8252 () Bool)

(assert (= bs!8252 d!33814))

(declare-fun m!158381 () Bool)

(assert (=> bs!8252 m!158381))

(assert (=> b!107066 d!33814))

(declare-fun d!33816 () Bool)

(declare-fun e!70207 () Bool)

(assert (=> d!33816 e!70207))

(declare-fun res!88381 () Bool)

(assert (=> d!33816 (=> (not res!88381) (not e!70207))))

(declare-fun lt!160227 () (_ BitVec 64))

(declare-fun lt!160228 () (_ BitVec 64))

(declare-fun lt!160225 () (_ BitVec 64))

(assert (=> d!33816 (= res!88381 (= lt!160228 (bvsub lt!160225 lt!160227)))))

(assert (=> d!33816 (or (= (bvand lt!160225 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!160227 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!160225 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!160225 lt!160227) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33816 (= lt!160227 (remainingBits!0 ((_ sign_extend 32) (size!2240 (buf!2622 (_1!4670 lt!159707)))) ((_ sign_extend 32) (currentByte!5140 (_1!4670 lt!159707))) ((_ sign_extend 32) (currentBit!5135 (_1!4670 lt!159707)))))))

(declare-fun lt!160229 () (_ BitVec 64))

(declare-fun lt!160226 () (_ BitVec 64))

(assert (=> d!33816 (= lt!160225 (bvmul lt!160229 lt!160226))))

(assert (=> d!33816 (or (= lt!160229 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!160226 (bvsdiv (bvmul lt!160229 lt!160226) lt!160229)))))

(assert (=> d!33816 (= lt!160226 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33816 (= lt!160229 ((_ sign_extend 32) (size!2240 (buf!2622 (_1!4670 lt!159707)))))))

(assert (=> d!33816 (= lt!160228 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5140 (_1!4670 lt!159707))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5135 (_1!4670 lt!159707)))))))

(assert (=> d!33816 (invariant!0 (currentBit!5135 (_1!4670 lt!159707)) (currentByte!5140 (_1!4670 lt!159707)) (size!2240 (buf!2622 (_1!4670 lt!159707))))))

(assert (=> d!33816 (= (bitIndex!0 (size!2240 (buf!2622 (_1!4670 lt!159707))) (currentByte!5140 (_1!4670 lt!159707)) (currentBit!5135 (_1!4670 lt!159707))) lt!160228)))

(declare-fun b!107260 () Bool)

(declare-fun res!88382 () Bool)

(assert (=> b!107260 (=> (not res!88382) (not e!70207))))

(assert (=> b!107260 (= res!88382 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!160228))))

(declare-fun b!107261 () Bool)

(declare-fun lt!160224 () (_ BitVec 64))

(assert (=> b!107261 (= e!70207 (bvsle lt!160228 (bvmul lt!160224 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!107261 (or (= lt!160224 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!160224 #b0000000000000000000000000000000000000000000000000000000000001000) lt!160224)))))

(assert (=> b!107261 (= lt!160224 ((_ sign_extend 32) (size!2240 (buf!2622 (_1!4670 lt!159707)))))))

(assert (= (and d!33816 res!88381) b!107260))

(assert (= (and b!107260 res!88382) b!107261))

(declare-fun m!158383 () Bool)

(assert (=> d!33816 m!158383))

(declare-fun m!158385 () Bool)

(assert (=> d!33816 m!158385))

(assert (=> b!107066 d!33816))

(declare-fun d!33818 () Bool)

(declare-fun lt!160230 () tuple2!8838)

(assert (=> d!33818 (= lt!160230 (readNLeastSignificantBitsLoop!0 (_1!4668 lt!159718) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!159704))))

(assert (=> d!33818 (= (readNLeastSignificantBitsLoopPure!0 (_1!4668 lt!159718) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!159704) (tuple2!8825 (_2!4676 lt!160230) (_1!4676 lt!160230)))))

(declare-fun bs!8253 () Bool)

(assert (= bs!8253 d!33818))

(declare-fun m!158387 () Bool)

(assert (=> bs!8253 m!158387))

(assert (=> b!107066 d!33818))

(declare-fun d!33820 () Bool)

(declare-fun res!88391 () Bool)

(declare-fun e!70212 () Bool)

(assert (=> d!33820 (=> (not res!88391) (not e!70212))))

(assert (=> d!33820 (= res!88391 (= (size!2240 (buf!2622 thiss!1305)) (size!2240 (buf!2622 (_2!4667 lt!159716)))))))

(assert (=> d!33820 (= (isPrefixOf!0 thiss!1305 (_2!4667 lt!159716)) e!70212)))

(declare-fun b!107268 () Bool)

(declare-fun res!88390 () Bool)

(assert (=> b!107268 (=> (not res!88390) (not e!70212))))

(assert (=> b!107268 (= res!88390 (bvsle (bitIndex!0 (size!2240 (buf!2622 thiss!1305)) (currentByte!5140 thiss!1305) (currentBit!5135 thiss!1305)) (bitIndex!0 (size!2240 (buf!2622 (_2!4667 lt!159716))) (currentByte!5140 (_2!4667 lt!159716)) (currentBit!5135 (_2!4667 lt!159716)))))))

(declare-fun b!107269 () Bool)

(declare-fun e!70213 () Bool)

(assert (=> b!107269 (= e!70212 e!70213)))

(declare-fun res!88389 () Bool)

(assert (=> b!107269 (=> res!88389 e!70213)))

(assert (=> b!107269 (= res!88389 (= (size!2240 (buf!2622 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!107270 () Bool)

(assert (=> b!107270 (= e!70213 (arrayBitRangesEq!0 (buf!2622 thiss!1305) (buf!2622 (_2!4667 lt!159716)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2240 (buf!2622 thiss!1305)) (currentByte!5140 thiss!1305) (currentBit!5135 thiss!1305))))))

(assert (= (and d!33820 res!88391) b!107268))

(assert (= (and b!107268 res!88390) b!107269))

(assert (= (and b!107269 (not res!88389)) b!107270))

(assert (=> b!107268 m!157995))

(assert (=> b!107268 m!157989))

(assert (=> b!107270 m!157995))

(assert (=> b!107270 m!157995))

(declare-fun m!158389 () Bool)

(assert (=> b!107270 m!158389))

(assert (=> b!107066 d!33820))

(declare-fun d!33822 () Bool)

(declare-fun e!70215 () Bool)

(assert (=> d!33822 e!70215))

(declare-fun res!88394 () Bool)

(assert (=> d!33822 (=> (not res!88394) (not e!70215))))

(declare-fun lt!160241 () tuple2!8822)

(assert (=> d!33822 (= res!88394 (isPrefixOf!0 (_1!4668 lt!160241) (_2!4668 lt!160241)))))

(declare-fun lt!160236 () BitStream!3954)

(assert (=> d!33822 (= lt!160241 (tuple2!8823 lt!160236 (_2!4667 lt!159716)))))

(declare-fun lt!160239 () Unit!6558)

(declare-fun lt!160233 () Unit!6558)

(assert (=> d!33822 (= lt!160239 lt!160233)))

(assert (=> d!33822 (isPrefixOf!0 lt!160236 (_2!4667 lt!159716))))

(assert (=> d!33822 (= lt!160233 (lemmaIsPrefixTransitive!0 lt!160236 (_2!4667 lt!159716) (_2!4667 lt!159716)))))

(declare-fun lt!160238 () Unit!6558)

(declare-fun lt!160246 () Unit!6558)

(assert (=> d!33822 (= lt!160238 lt!160246)))

(assert (=> d!33822 (isPrefixOf!0 lt!160236 (_2!4667 lt!159716))))

(assert (=> d!33822 (= lt!160246 (lemmaIsPrefixTransitive!0 lt!160236 (_2!4667 lt!159698) (_2!4667 lt!159716)))))

(declare-fun lt!160244 () Unit!6558)

(declare-fun e!70214 () Unit!6558)

(assert (=> d!33822 (= lt!160244 e!70214)))

(declare-fun c!6612 () Bool)

(assert (=> d!33822 (= c!6612 (not (= (size!2240 (buf!2622 (_2!4667 lt!159698))) #b00000000000000000000000000000000)))))

(declare-fun lt!160243 () Unit!6558)

(declare-fun lt!160245 () Unit!6558)

(assert (=> d!33822 (= lt!160243 lt!160245)))

(assert (=> d!33822 (isPrefixOf!0 (_2!4667 lt!159716) (_2!4667 lt!159716))))

(assert (=> d!33822 (= lt!160245 (lemmaIsPrefixRefl!0 (_2!4667 lt!159716)))))

(declare-fun lt!160234 () Unit!6558)

(declare-fun lt!160237 () Unit!6558)

(assert (=> d!33822 (= lt!160234 lt!160237)))

(assert (=> d!33822 (= lt!160237 (lemmaIsPrefixRefl!0 (_2!4667 lt!159716)))))

(declare-fun lt!160248 () Unit!6558)

(declare-fun lt!160231 () Unit!6558)

(assert (=> d!33822 (= lt!160248 lt!160231)))

(assert (=> d!33822 (isPrefixOf!0 lt!160236 lt!160236)))

(assert (=> d!33822 (= lt!160231 (lemmaIsPrefixRefl!0 lt!160236))))

(declare-fun lt!160250 () Unit!6558)

(declare-fun lt!160240 () Unit!6558)

(assert (=> d!33822 (= lt!160250 lt!160240)))

(assert (=> d!33822 (isPrefixOf!0 (_2!4667 lt!159698) (_2!4667 lt!159698))))

(assert (=> d!33822 (= lt!160240 (lemmaIsPrefixRefl!0 (_2!4667 lt!159698)))))

(assert (=> d!33822 (= lt!160236 (BitStream!3955 (buf!2622 (_2!4667 lt!159716)) (currentByte!5140 (_2!4667 lt!159698)) (currentBit!5135 (_2!4667 lt!159698))))))

(assert (=> d!33822 (isPrefixOf!0 (_2!4667 lt!159698) (_2!4667 lt!159716))))

(assert (=> d!33822 (= (reader!0 (_2!4667 lt!159698) (_2!4667 lt!159716)) lt!160241)))

(declare-fun b!107271 () Bool)

(declare-fun res!88393 () Bool)

(assert (=> b!107271 (=> (not res!88393) (not e!70215))))

(assert (=> b!107271 (= res!88393 (isPrefixOf!0 (_1!4668 lt!160241) (_2!4667 lt!159698)))))

(declare-fun b!107272 () Bool)

(declare-fun lt!160235 () Unit!6558)

(assert (=> b!107272 (= e!70214 lt!160235)))

(declare-fun lt!160242 () (_ BitVec 64))

(assert (=> b!107272 (= lt!160242 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160247 () (_ BitVec 64))

(assert (=> b!107272 (= lt!160247 (bitIndex!0 (size!2240 (buf!2622 (_2!4667 lt!159698))) (currentByte!5140 (_2!4667 lt!159698)) (currentBit!5135 (_2!4667 lt!159698))))))

(assert (=> b!107272 (= lt!160235 (arrayBitRangesEqSymmetric!0 (buf!2622 (_2!4667 lt!159698)) (buf!2622 (_2!4667 lt!159716)) lt!160242 lt!160247))))

(assert (=> b!107272 (arrayBitRangesEq!0 (buf!2622 (_2!4667 lt!159716)) (buf!2622 (_2!4667 lt!159698)) lt!160242 lt!160247)))

(declare-fun b!107273 () Bool)

(declare-fun lt!160249 () (_ BitVec 64))

(declare-fun lt!160232 () (_ BitVec 64))

(assert (=> b!107273 (= e!70215 (= (_1!4668 lt!160241) (withMovedBitIndex!0 (_2!4668 lt!160241) (bvsub lt!160249 lt!160232))))))

(assert (=> b!107273 (or (= (bvand lt!160249 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!160232 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!160249 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!160249 lt!160232) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!107273 (= lt!160232 (bitIndex!0 (size!2240 (buf!2622 (_2!4667 lt!159716))) (currentByte!5140 (_2!4667 lt!159716)) (currentBit!5135 (_2!4667 lt!159716))))))

(assert (=> b!107273 (= lt!160249 (bitIndex!0 (size!2240 (buf!2622 (_2!4667 lt!159698))) (currentByte!5140 (_2!4667 lt!159698)) (currentBit!5135 (_2!4667 lt!159698))))))

(declare-fun b!107274 () Bool)

(declare-fun res!88392 () Bool)

(assert (=> b!107274 (=> (not res!88392) (not e!70215))))

(assert (=> b!107274 (= res!88392 (isPrefixOf!0 (_2!4668 lt!160241) (_2!4667 lt!159716)))))

(declare-fun b!107275 () Bool)

(declare-fun Unit!6569 () Unit!6558)

(assert (=> b!107275 (= e!70214 Unit!6569)))

(assert (= (and d!33822 c!6612) b!107272))

(assert (= (and d!33822 (not c!6612)) b!107275))

(assert (= (and d!33822 res!88394) b!107271))

(assert (= (and b!107271 res!88393) b!107274))

(assert (= (and b!107274 res!88392) b!107273))

(declare-fun m!158391 () Bool)

(assert (=> b!107274 m!158391))

(declare-fun m!158393 () Bool)

(assert (=> b!107273 m!158393))

(assert (=> b!107273 m!157989))

(assert (=> b!107273 m!158001))

(assert (=> b!107272 m!158001))

(declare-fun m!158395 () Bool)

(assert (=> b!107272 m!158395))

(declare-fun m!158397 () Bool)

(assert (=> b!107272 m!158397))

(declare-fun m!158399 () Bool)

(assert (=> d!33822 m!158399))

(declare-fun m!158401 () Bool)

(assert (=> d!33822 m!158401))

(declare-fun m!158403 () Bool)

(assert (=> d!33822 m!158403))

(declare-fun m!158405 () Bool)

(assert (=> d!33822 m!158405))

(assert (=> d!33822 m!158337))

(declare-fun m!158407 () Bool)

(assert (=> d!33822 m!158407))

(assert (=> d!33822 m!158341))

(declare-fun m!158409 () Bool)

(assert (=> d!33822 m!158409))

(declare-fun m!158411 () Bool)

(assert (=> d!33822 m!158411))

(declare-fun m!158413 () Bool)

(assert (=> d!33822 m!158413))

(declare-fun m!158415 () Bool)

(assert (=> d!33822 m!158415))

(declare-fun m!158417 () Bool)

(assert (=> b!107271 m!158417))

(assert (=> b!107066 d!33822))

(declare-fun d!33824 () Bool)

(declare-fun lt!160251 () tuple2!8836)

(assert (=> d!33824 (= lt!160251 (readBit!0 (_1!4668 lt!159709)))))

(assert (=> d!33824 (= (readBitPure!0 (_1!4668 lt!159709)) (tuple2!8827 (_2!4675 lt!160251) (_1!4675 lt!160251)))))

(declare-fun bs!8254 () Bool)

(assert (= bs!8254 d!33824))

(declare-fun m!158419 () Bool)

(assert (=> bs!8254 m!158419))

(assert (=> b!107066 d!33824))

(declare-fun d!33826 () Bool)

(declare-fun e!70218 () Bool)

(assert (=> d!33826 e!70218))

(declare-fun res!88397 () Bool)

(assert (=> d!33826 (=> (not res!88397) (not e!70218))))

(declare-fun lt!160262 () tuple2!8826)

(declare-fun lt!160263 () tuple2!8826)

(assert (=> d!33826 (= res!88397 (= (bitIndex!0 (size!2240 (buf!2622 (_1!4670 lt!160262))) (currentByte!5140 (_1!4670 lt!160262)) (currentBit!5135 (_1!4670 lt!160262))) (bitIndex!0 (size!2240 (buf!2622 (_1!4670 lt!160263))) (currentByte!5140 (_1!4670 lt!160263)) (currentBit!5135 (_1!4670 lt!160263)))))))

(declare-fun lt!160260 () BitStream!3954)

(declare-fun lt!160261 () Unit!6558)

(declare-fun choose!50 (BitStream!3954 BitStream!3954 BitStream!3954 tuple2!8826 tuple2!8826 BitStream!3954 Bool tuple2!8826 tuple2!8826 BitStream!3954 Bool) Unit!6558)

(assert (=> d!33826 (= lt!160261 (choose!50 lt!159699 (_2!4667 lt!159716) lt!160260 lt!160262 (tuple2!8827 (_1!4670 lt!160262) (_2!4670 lt!160262)) (_1!4670 lt!160262) (_2!4670 lt!160262) lt!160263 (tuple2!8827 (_1!4670 lt!160263) (_2!4670 lt!160263)) (_1!4670 lt!160263) (_2!4670 lt!160263)))))

(assert (=> d!33826 (= lt!160263 (readBitPure!0 lt!160260))))

(assert (=> d!33826 (= lt!160262 (readBitPure!0 lt!159699))))

(assert (=> d!33826 (= lt!160260 (BitStream!3955 (buf!2622 (_2!4667 lt!159716)) (currentByte!5140 lt!159699) (currentBit!5135 lt!159699)))))

(assert (=> d!33826 (invariant!0 (currentBit!5135 lt!159699) (currentByte!5140 lt!159699) (size!2240 (buf!2622 (_2!4667 lt!159716))))))

(assert (=> d!33826 (= (readBitPrefixLemma!0 lt!159699 (_2!4667 lt!159716)) lt!160261)))

(declare-fun b!107278 () Bool)

(assert (=> b!107278 (= e!70218 (= (_2!4670 lt!160262) (_2!4670 lt!160263)))))

(assert (= (and d!33826 res!88397) b!107278))

(declare-fun m!158421 () Bool)

(assert (=> d!33826 m!158421))

(declare-fun m!158423 () Bool)

(assert (=> d!33826 m!158423))

(declare-fun m!158425 () Bool)

(assert (=> d!33826 m!158425))

(declare-fun m!158427 () Bool)

(assert (=> d!33826 m!158427))

(declare-fun m!158429 () Bool)

(assert (=> d!33826 m!158429))

(assert (=> d!33826 m!158007))

(assert (=> b!107066 d!33826))

(declare-fun d!33828 () Bool)

(declare-fun e!70219 () Bool)

(assert (=> d!33828 e!70219))

(declare-fun res!88398 () Bool)

(assert (=> d!33828 (=> (not res!88398) (not e!70219))))

(declare-fun lt!160265 () (_ BitVec 64))

(declare-fun lt!160268 () (_ BitVec 64))

(declare-fun lt!160267 () (_ BitVec 64))

(assert (=> d!33828 (= res!88398 (= lt!160268 (bvsub lt!160265 lt!160267)))))

(assert (=> d!33828 (or (= (bvand lt!160265 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!160267 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!160265 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!160265 lt!160267) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33828 (= lt!160267 (remainingBits!0 ((_ sign_extend 32) (size!2240 (buf!2622 (_2!4667 lt!159698)))) ((_ sign_extend 32) (currentByte!5140 (_2!4667 lt!159698))) ((_ sign_extend 32) (currentBit!5135 (_2!4667 lt!159698)))))))

(declare-fun lt!160269 () (_ BitVec 64))

(declare-fun lt!160266 () (_ BitVec 64))

(assert (=> d!33828 (= lt!160265 (bvmul lt!160269 lt!160266))))

(assert (=> d!33828 (or (= lt!160269 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!160266 (bvsdiv (bvmul lt!160269 lt!160266) lt!160269)))))

(assert (=> d!33828 (= lt!160266 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33828 (= lt!160269 ((_ sign_extend 32) (size!2240 (buf!2622 (_2!4667 lt!159698)))))))

(assert (=> d!33828 (= lt!160268 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5140 (_2!4667 lt!159698))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5135 (_2!4667 lt!159698)))))))

(assert (=> d!33828 (invariant!0 (currentBit!5135 (_2!4667 lt!159698)) (currentByte!5140 (_2!4667 lt!159698)) (size!2240 (buf!2622 (_2!4667 lt!159698))))))

(assert (=> d!33828 (= (bitIndex!0 (size!2240 (buf!2622 (_2!4667 lt!159698))) (currentByte!5140 (_2!4667 lt!159698)) (currentBit!5135 (_2!4667 lt!159698))) lt!160268)))

(declare-fun b!107279 () Bool)

(declare-fun res!88399 () Bool)

(assert (=> b!107279 (=> (not res!88399) (not e!70219))))

(assert (=> b!107279 (= res!88399 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!160268))))

(declare-fun b!107280 () Bool)

(declare-fun lt!160264 () (_ BitVec 64))

(assert (=> b!107280 (= e!70219 (bvsle lt!160268 (bvmul lt!160264 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!107280 (or (= lt!160264 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!160264 #b0000000000000000000000000000000000000000000000000000000000001000) lt!160264)))))

(assert (=> b!107280 (= lt!160264 ((_ sign_extend 32) (size!2240 (buf!2622 (_2!4667 lt!159698)))))))

(assert (= (and d!33828 res!88398) b!107279))

(assert (= (and b!107279 res!88399) b!107280))

(declare-fun m!158431 () Bool)

(assert (=> d!33828 m!158431))

(assert (=> d!33828 m!157985))

(assert (=> b!107065 d!33828))

(declare-fun d!33830 () Bool)

(declare-fun e!70220 () Bool)

(assert (=> d!33830 e!70220))

(declare-fun res!88400 () Bool)

(assert (=> d!33830 (=> (not res!88400) (not e!70220))))

(declare-fun lt!160273 () (_ BitVec 64))

(declare-fun lt!160271 () (_ BitVec 64))

(declare-fun lt!160274 () (_ BitVec 64))

(assert (=> d!33830 (= res!88400 (= lt!160274 (bvsub lt!160271 lt!160273)))))

(assert (=> d!33830 (or (= (bvand lt!160271 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!160273 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!160271 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!160271 lt!160273) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33830 (= lt!160273 (remainingBits!0 ((_ sign_extend 32) (size!2240 (buf!2622 thiss!1305))) ((_ sign_extend 32) (currentByte!5140 thiss!1305)) ((_ sign_extend 32) (currentBit!5135 thiss!1305))))))

(declare-fun lt!160275 () (_ BitVec 64))

(declare-fun lt!160272 () (_ BitVec 64))

(assert (=> d!33830 (= lt!160271 (bvmul lt!160275 lt!160272))))

(assert (=> d!33830 (or (= lt!160275 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!160272 (bvsdiv (bvmul lt!160275 lt!160272) lt!160275)))))

(assert (=> d!33830 (= lt!160272 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33830 (= lt!160275 ((_ sign_extend 32) (size!2240 (buf!2622 thiss!1305))))))

(assert (=> d!33830 (= lt!160274 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5140 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5135 thiss!1305))))))

(assert (=> d!33830 (invariant!0 (currentBit!5135 thiss!1305) (currentByte!5140 thiss!1305) (size!2240 (buf!2622 thiss!1305)))))

(assert (=> d!33830 (= (bitIndex!0 (size!2240 (buf!2622 thiss!1305)) (currentByte!5140 thiss!1305) (currentBit!5135 thiss!1305)) lt!160274)))

(declare-fun b!107281 () Bool)

(declare-fun res!88401 () Bool)

(assert (=> b!107281 (=> (not res!88401) (not e!70220))))

(assert (=> b!107281 (= res!88401 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!160274))))

(declare-fun b!107282 () Bool)

(declare-fun lt!160270 () (_ BitVec 64))

(assert (=> b!107282 (= e!70220 (bvsle lt!160274 (bvmul lt!160270 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!107282 (or (= lt!160270 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!160270 #b0000000000000000000000000000000000000000000000000000000000001000) lt!160270)))))

(assert (=> b!107282 (= lt!160270 ((_ sign_extend 32) (size!2240 (buf!2622 thiss!1305))))))

(assert (= (and d!33830 res!88400) b!107281))

(assert (= (and b!107281 res!88401) b!107282))

(declare-fun m!158433 () Bool)

(assert (=> d!33830 m!158433))

(declare-fun m!158435 () Bool)

(assert (=> d!33830 m!158435))

(assert (=> b!107065 d!33830))

(declare-fun d!33832 () Bool)

(declare-fun res!88404 () Bool)

(declare-fun e!70221 () Bool)

(assert (=> d!33832 (=> (not res!88404) (not e!70221))))

(assert (=> d!33832 (= res!88404 (= (size!2240 (buf!2622 thiss!1305)) (size!2240 (buf!2622 (_2!4667 lt!159698)))))))

(assert (=> d!33832 (= (isPrefixOf!0 thiss!1305 (_2!4667 lt!159698)) e!70221)))

(declare-fun b!107283 () Bool)

(declare-fun res!88403 () Bool)

(assert (=> b!107283 (=> (not res!88403) (not e!70221))))

(assert (=> b!107283 (= res!88403 (bvsle (bitIndex!0 (size!2240 (buf!2622 thiss!1305)) (currentByte!5140 thiss!1305) (currentBit!5135 thiss!1305)) (bitIndex!0 (size!2240 (buf!2622 (_2!4667 lt!159698))) (currentByte!5140 (_2!4667 lt!159698)) (currentBit!5135 (_2!4667 lt!159698)))))))

(declare-fun b!107284 () Bool)

(declare-fun e!70222 () Bool)

(assert (=> b!107284 (= e!70221 e!70222)))

(declare-fun res!88402 () Bool)

(assert (=> b!107284 (=> res!88402 e!70222)))

(assert (=> b!107284 (= res!88402 (= (size!2240 (buf!2622 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!107285 () Bool)

(assert (=> b!107285 (= e!70222 (arrayBitRangesEq!0 (buf!2622 thiss!1305) (buf!2622 (_2!4667 lt!159698)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2240 (buf!2622 thiss!1305)) (currentByte!5140 thiss!1305) (currentBit!5135 thiss!1305))))))

(assert (= (and d!33832 res!88404) b!107283))

(assert (= (and b!107283 res!88403) b!107284))

(assert (= (and b!107284 (not res!88402)) b!107285))

(assert (=> b!107283 m!157995))

(assert (=> b!107283 m!158001))

(assert (=> b!107285 m!157995))

(assert (=> b!107285 m!157995))

(declare-fun m!158437 () Bool)

(assert (=> b!107285 m!158437))

(assert (=> b!107075 d!33832))

(declare-fun d!33834 () Bool)

(declare-fun e!70225 () Bool)

(assert (=> d!33834 e!70225))

(declare-fun res!88407 () Bool)

(assert (=> d!33834 (=> (not res!88407) (not e!70225))))

(declare-fun lt!160281 () (_ BitVec 64))

(declare-fun lt!160280 () BitStream!3954)

(assert (=> d!33834 (= res!88407 (= (bvadd lt!160281 (bvsub (bitIndex!0 (size!2240 (buf!2622 (_2!4667 lt!159698))) (currentByte!5140 (_2!4667 lt!159698)) (currentBit!5135 (_2!4667 lt!159698))) lt!159715)) (bitIndex!0 (size!2240 (buf!2622 lt!160280)) (currentByte!5140 lt!160280) (currentBit!5135 lt!160280))))))

(assert (=> d!33834 (or (not (= (bvand lt!160281 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2240 (buf!2622 (_2!4667 lt!159698))) (currentByte!5140 (_2!4667 lt!159698)) (currentBit!5135 (_2!4667 lt!159698))) lt!159715) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!160281 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!160281 (bvsub (bitIndex!0 (size!2240 (buf!2622 (_2!4667 lt!159698))) (currentByte!5140 (_2!4667 lt!159698)) (currentBit!5135 (_2!4667 lt!159698))) lt!159715)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33834 (= lt!160281 (bitIndex!0 (size!2240 (buf!2622 (_2!4668 lt!159718))) (currentByte!5140 (_2!4668 lt!159718)) (currentBit!5135 (_2!4668 lt!159718))))))

(declare-fun moveBitIndex!0 (BitStream!3954 (_ BitVec 64)) tuple2!8820)

(assert (=> d!33834 (= lt!160280 (_2!4667 (moveBitIndex!0 (_2!4668 lt!159718) (bvsub (bitIndex!0 (size!2240 (buf!2622 (_2!4667 lt!159698))) (currentByte!5140 (_2!4667 lt!159698)) (currentBit!5135 (_2!4667 lt!159698))) lt!159715))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!3954 (_ BitVec 64)) Bool)

(assert (=> d!33834 (moveBitIndexPrecond!0 (_2!4668 lt!159718) (bvsub (bitIndex!0 (size!2240 (buf!2622 (_2!4667 lt!159698))) (currentByte!5140 (_2!4667 lt!159698)) (currentBit!5135 (_2!4667 lt!159698))) lt!159715))))

(assert (=> d!33834 (= (withMovedBitIndex!0 (_2!4668 lt!159718) (bvsub (bitIndex!0 (size!2240 (buf!2622 (_2!4667 lt!159698))) (currentByte!5140 (_2!4667 lt!159698)) (currentBit!5135 (_2!4667 lt!159698))) lt!159715)) lt!160280)))

(declare-fun b!107288 () Bool)

(assert (=> b!107288 (= e!70225 (= (size!2240 (buf!2622 (_2!4668 lt!159718))) (size!2240 (buf!2622 lt!160280))))))

(assert (= (and d!33834 res!88407) b!107288))

(declare-fun m!158439 () Bool)

(assert (=> d!33834 m!158439))

(declare-fun m!158441 () Bool)

(assert (=> d!33834 m!158441))

(declare-fun m!158443 () Bool)

(assert (=> d!33834 m!158443))

(declare-fun m!158445 () Bool)

(assert (=> d!33834 m!158445))

(assert (=> b!107064 d!33834))

(assert (=> b!107064 d!33828))

(declare-fun d!33836 () Bool)

(declare-fun e!70226 () Bool)

(assert (=> d!33836 e!70226))

(declare-fun res!88408 () Bool)

(assert (=> d!33836 (=> (not res!88408) (not e!70226))))

(declare-fun lt!160285 () (_ BitVec 64))

(declare-fun lt!160286 () (_ BitVec 64))

(declare-fun lt!160283 () (_ BitVec 64))

(assert (=> d!33836 (= res!88408 (= lt!160286 (bvsub lt!160283 lt!160285)))))

(assert (=> d!33836 (or (= (bvand lt!160283 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!160285 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!160283 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!160283 lt!160285) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33836 (= lt!160285 (remainingBits!0 ((_ sign_extend 32) (size!2240 (buf!2622 (_1!4670 lt!159705)))) ((_ sign_extend 32) (currentByte!5140 (_1!4670 lt!159705))) ((_ sign_extend 32) (currentBit!5135 (_1!4670 lt!159705)))))))

(declare-fun lt!160287 () (_ BitVec 64))

(declare-fun lt!160284 () (_ BitVec 64))

(assert (=> d!33836 (= lt!160283 (bvmul lt!160287 lt!160284))))

(assert (=> d!33836 (or (= lt!160287 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!160284 (bvsdiv (bvmul lt!160287 lt!160284) lt!160287)))))

(assert (=> d!33836 (= lt!160284 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33836 (= lt!160287 ((_ sign_extend 32) (size!2240 (buf!2622 (_1!4670 lt!159705)))))))

(assert (=> d!33836 (= lt!160286 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5140 (_1!4670 lt!159705))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5135 (_1!4670 lt!159705)))))))

(assert (=> d!33836 (invariant!0 (currentBit!5135 (_1!4670 lt!159705)) (currentByte!5140 (_1!4670 lt!159705)) (size!2240 (buf!2622 (_1!4670 lt!159705))))))

(assert (=> d!33836 (= (bitIndex!0 (size!2240 (buf!2622 (_1!4670 lt!159705))) (currentByte!5140 (_1!4670 lt!159705)) (currentBit!5135 (_1!4670 lt!159705))) lt!160286)))

(declare-fun b!107289 () Bool)

(declare-fun res!88409 () Bool)

(assert (=> b!107289 (=> (not res!88409) (not e!70226))))

(assert (=> b!107289 (= res!88409 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!160286))))

(declare-fun b!107290 () Bool)

(declare-fun lt!160282 () (_ BitVec 64))

(assert (=> b!107290 (= e!70226 (bvsle lt!160286 (bvmul lt!160282 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!107290 (or (= lt!160282 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!160282 #b0000000000000000000000000000000000000000000000000000000000001000) lt!160282)))))

(assert (=> b!107290 (= lt!160282 ((_ sign_extend 32) (size!2240 (buf!2622 (_1!4670 lt!159705)))))))

(assert (= (and d!33836 res!88408) b!107289))

(assert (= (and b!107289 res!88409) b!107290))

(declare-fun m!158447 () Bool)

(assert (=> d!33836 m!158447))

(declare-fun m!158449 () Bool)

(assert (=> d!33836 m!158449))

(assert (=> b!107067 d!33836))

(declare-fun lt!160288 () tuple2!8838)

(declare-fun d!33838 () Bool)

(assert (=> d!33838 (= lt!160288 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!4668 lt!159709) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!159704))))

(assert (=> d!33838 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4668 lt!159709) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!159704) (tuple2!8825 (_2!4676 lt!160288) (_1!4676 lt!160288)))))

(declare-fun bs!8255 () Bool)

(assert (= bs!8255 d!33838))

(assert (=> bs!8255 m!157991))

(declare-fun m!158451 () Bool)

(assert (=> bs!8255 m!158451))

(assert (=> b!107071 d!33838))

(declare-fun d!33840 () Bool)

(declare-fun e!70227 () Bool)

(assert (=> d!33840 e!70227))

(declare-fun res!88410 () Bool)

(assert (=> d!33840 (=> (not res!88410) (not e!70227))))

(declare-fun lt!160290 () (_ BitVec 64))

(declare-fun lt!160289 () BitStream!3954)

(assert (=> d!33840 (= res!88410 (= (bvadd lt!160290 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2240 (buf!2622 lt!160289)) (currentByte!5140 lt!160289) (currentBit!5135 lt!160289))))))

(assert (=> d!33840 (or (not (= (bvand lt!160290 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!160290 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!160290 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33840 (= lt!160290 (bitIndex!0 (size!2240 (buf!2622 (_1!4668 lt!159709))) (currentByte!5140 (_1!4668 lt!159709)) (currentBit!5135 (_1!4668 lt!159709))))))

(assert (=> d!33840 (= lt!160289 (_2!4667 (moveBitIndex!0 (_1!4668 lt!159709) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!33840 (moveBitIndexPrecond!0 (_1!4668 lt!159709) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!33840 (= (withMovedBitIndex!0 (_1!4668 lt!159709) #b0000000000000000000000000000000000000000000000000000000000000001) lt!160289)))

(declare-fun b!107291 () Bool)

(assert (=> b!107291 (= e!70227 (= (size!2240 (buf!2622 (_1!4668 lt!159709))) (size!2240 (buf!2622 lt!160289))))))

(assert (= (and d!33840 res!88410) b!107291))

(declare-fun m!158453 () Bool)

(assert (=> d!33840 m!158453))

(declare-fun m!158455 () Bool)

(assert (=> d!33840 m!158455))

(declare-fun m!158457 () Bool)

(assert (=> d!33840 m!158457))

(declare-fun m!158459 () Bool)

(assert (=> d!33840 m!158459))

(assert (=> b!107071 d!33840))

(declare-fun d!33842 () Bool)

(declare-fun e!70228 () Bool)

(assert (=> d!33842 e!70228))

(declare-fun res!88411 () Bool)

(assert (=> d!33842 (=> (not res!88411) (not e!70228))))

(declare-fun lt!160292 () (_ BitVec 64))

(declare-fun lt!160291 () BitStream!3954)

(assert (=> d!33842 (= res!88411 (= (bvadd lt!160292 (bvsub lt!159720 lt!159715)) (bitIndex!0 (size!2240 (buf!2622 lt!160291)) (currentByte!5140 lt!160291) (currentBit!5135 lt!160291))))))

(assert (=> d!33842 (or (not (= (bvand lt!160292 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!159720 lt!159715) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!160292 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!160292 (bvsub lt!159720 lt!159715)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33842 (= lt!160292 (bitIndex!0 (size!2240 (buf!2622 (_2!4668 lt!159709))) (currentByte!5140 (_2!4668 lt!159709)) (currentBit!5135 (_2!4668 lt!159709))))))

(assert (=> d!33842 (= lt!160291 (_2!4667 (moveBitIndex!0 (_2!4668 lt!159709) (bvsub lt!159720 lt!159715))))))

(assert (=> d!33842 (moveBitIndexPrecond!0 (_2!4668 lt!159709) (bvsub lt!159720 lt!159715))))

(assert (=> d!33842 (= (withMovedBitIndex!0 (_2!4668 lt!159709) (bvsub lt!159720 lt!159715)) lt!160291)))

(declare-fun b!107292 () Bool)

(assert (=> b!107292 (= e!70228 (= (size!2240 (buf!2622 (_2!4668 lt!159709))) (size!2240 (buf!2622 lt!160291))))))

(assert (= (and d!33842 res!88411) b!107292))

(declare-fun m!158461 () Bool)

(assert (=> d!33842 m!158461))

(declare-fun m!158463 () Bool)

(assert (=> d!33842 m!158463))

(declare-fun m!158465 () Bool)

(assert (=> d!33842 m!158465))

(declare-fun m!158467 () Bool)

(assert (=> d!33842 m!158467))

(assert (=> b!107071 d!33842))

(declare-fun d!33844 () Bool)

(assert (=> d!33844 (= (invariant!0 (currentBit!5135 (_2!4667 lt!159698)) (currentByte!5140 (_2!4667 lt!159698)) (size!2240 (buf!2622 (_2!4667 lt!159698)))) (and (bvsge (currentBit!5135 (_2!4667 lt!159698)) #b00000000000000000000000000000000) (bvslt (currentBit!5135 (_2!4667 lt!159698)) #b00000000000000000000000000001000) (bvsge (currentByte!5140 (_2!4667 lt!159698)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5140 (_2!4667 lt!159698)) (size!2240 (buf!2622 (_2!4667 lt!159698)))) (and (= (currentBit!5135 (_2!4667 lt!159698)) #b00000000000000000000000000000000) (= (currentByte!5140 (_2!4667 lt!159698)) (size!2240 (buf!2622 (_2!4667 lt!159698))))))))))

(assert (=> b!107071 d!33844))

(declare-fun d!33846 () Bool)

(declare-fun e!70229 () Bool)

(assert (=> d!33846 e!70229))

(declare-fun res!88412 () Bool)

(assert (=> d!33846 (=> (not res!88412) (not e!70229))))

(declare-fun lt!160297 () (_ BitVec 64))

(declare-fun lt!160294 () (_ BitVec 64))

(declare-fun lt!160296 () (_ BitVec 64))

(assert (=> d!33846 (= res!88412 (= lt!160297 (bvsub lt!160294 lt!160296)))))

(assert (=> d!33846 (or (= (bvand lt!160294 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!160296 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!160294 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!160294 lt!160296) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33846 (= lt!160296 (remainingBits!0 ((_ sign_extend 32) (size!2240 (buf!2622 (_2!4667 lt!159716)))) ((_ sign_extend 32) (currentByte!5140 (_2!4667 lt!159716))) ((_ sign_extend 32) (currentBit!5135 (_2!4667 lt!159716)))))))

(declare-fun lt!160298 () (_ BitVec 64))

(declare-fun lt!160295 () (_ BitVec 64))

(assert (=> d!33846 (= lt!160294 (bvmul lt!160298 lt!160295))))

(assert (=> d!33846 (or (= lt!160298 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!160295 (bvsdiv (bvmul lt!160298 lt!160295) lt!160298)))))

(assert (=> d!33846 (= lt!160295 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33846 (= lt!160298 ((_ sign_extend 32) (size!2240 (buf!2622 (_2!4667 lt!159716)))))))

(assert (=> d!33846 (= lt!160297 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5140 (_2!4667 lt!159716))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5135 (_2!4667 lt!159716)))))))

(assert (=> d!33846 (invariant!0 (currentBit!5135 (_2!4667 lt!159716)) (currentByte!5140 (_2!4667 lt!159716)) (size!2240 (buf!2622 (_2!4667 lt!159716))))))

(assert (=> d!33846 (= (bitIndex!0 (size!2240 (buf!2622 (_2!4667 lt!159716))) (currentByte!5140 (_2!4667 lt!159716)) (currentBit!5135 (_2!4667 lt!159716))) lt!160297)))

(declare-fun b!107293 () Bool)

(declare-fun res!88413 () Bool)

(assert (=> b!107293 (=> (not res!88413) (not e!70229))))

(assert (=> b!107293 (= res!88413 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!160297))))

(declare-fun b!107294 () Bool)

(declare-fun lt!160293 () (_ BitVec 64))

(assert (=> b!107294 (= e!70229 (bvsle lt!160297 (bvmul lt!160293 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!107294 (or (= lt!160293 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!160293 #b0000000000000000000000000000000000000000000000000000000000001000) lt!160293)))))

(assert (=> b!107294 (= lt!160293 ((_ sign_extend 32) (size!2240 (buf!2622 (_2!4667 lt!159716)))))))

(assert (= (and d!33846 res!88412) b!107293))

(assert (= (and b!107293 res!88413) b!107294))

(declare-fun m!158469 () Bool)

(assert (=> d!33846 m!158469))

(declare-fun m!158471 () Bool)

(assert (=> d!33846 m!158471))

(assert (=> b!107071 d!33846))

(declare-fun d!33848 () Bool)

(declare-fun lt!160312 () tuple2!8824)

(declare-fun lt!160316 () tuple2!8824)

(assert (=> d!33848 (and (= (_2!4669 lt!160312) (_2!4669 lt!160316)) (= (_1!4669 lt!160312) (_1!4669 lt!160316)))))

(declare-fun lt!160311 () BitStream!3954)

(declare-fun lt!160314 () (_ BitVec 64))

(declare-fun lt!160313 () Bool)

(declare-fun lt!160315 () Unit!6558)

(declare-fun choose!45 (BitStream!3954 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!8824 tuple2!8824 BitStream!3954 (_ BitVec 64) Bool BitStream!3954 (_ BitVec 64) tuple2!8824 tuple2!8824 BitStream!3954 (_ BitVec 64)) Unit!6558)

(assert (=> d!33848 (= lt!160315 (choose!45 (_1!4668 lt!159709) nBits!396 i!615 lt!159712 lt!160312 (tuple2!8825 (_1!4669 lt!160312) (_2!4669 lt!160312)) (_1!4669 lt!160312) (_2!4669 lt!160312) lt!160313 lt!160311 lt!160314 lt!160316 (tuple2!8825 (_1!4669 lt!160316) (_2!4669 lt!160316)) (_1!4669 lt!160316) (_2!4669 lt!160316)))))

(assert (=> d!33848 (= lt!160316 (readNLeastSignificantBitsLoopPure!0 lt!160311 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!160314))))

(assert (=> d!33848 (= lt!160314 (bvor lt!159712 (ite lt!160313 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33848 (= lt!160311 (withMovedBitIndex!0 (_1!4668 lt!159709) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!33848 (= lt!160313 (_2!4670 (readBitPure!0 (_1!4668 lt!159709))))))

(assert (=> d!33848 (= lt!160312 (readNLeastSignificantBitsLoopPure!0 (_1!4668 lt!159709) nBits!396 i!615 lt!159712))))

(assert (=> d!33848 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4668 lt!159709) nBits!396 i!615 lt!159712) lt!160315)))

(declare-fun bs!8257 () Bool)

(assert (= bs!8257 d!33848))

(assert (=> bs!8257 m!157991))

(assert (=> bs!8257 m!158023))

(assert (=> bs!8257 m!158031))

(declare-fun m!158473 () Bool)

(assert (=> bs!8257 m!158473))

(declare-fun m!158475 () Bool)

(assert (=> bs!8257 m!158475))

(assert (=> b!107071 d!33848))

(assert (=> b!107071 d!33830))

(declare-fun d!33850 () Bool)

(assert (=> d!33850 (= (array_inv!2042 (buf!2622 thiss!1305)) (bvsge (size!2240 (buf!2622 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!107070 d!33850))

(declare-fun d!33852 () Bool)

(assert (=> d!33852 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5135 thiss!1305) (currentByte!5140 thiss!1305) (size!2240 (buf!2622 thiss!1305))))))

(declare-fun bs!8258 () Bool)

(assert (= bs!8258 d!33852))

(assert (=> bs!8258 m!158435))

(assert (=> start!21240 d!33852))

(declare-fun d!33854 () Bool)

(declare-fun lt!160317 () tuple2!8836)

(assert (=> d!33854 (= lt!160317 (readBit!0 (readerFrom!0 (_2!4667 lt!159698) (currentBit!5135 thiss!1305) (currentByte!5140 thiss!1305))))))

(assert (=> d!33854 (= (readBitPure!0 (readerFrom!0 (_2!4667 lt!159698) (currentBit!5135 thiss!1305) (currentByte!5140 thiss!1305))) (tuple2!8827 (_2!4675 lt!160317) (_1!4675 lt!160317)))))

(declare-fun bs!8259 () Bool)

(assert (= bs!8259 d!33854))

(assert (=> bs!8259 m!157975))

(declare-fun m!158477 () Bool)

(assert (=> bs!8259 m!158477))

(assert (=> b!107069 d!33854))

(declare-fun d!33856 () Bool)

(declare-fun e!70232 () Bool)

(assert (=> d!33856 e!70232))

(declare-fun res!88417 () Bool)

(assert (=> d!33856 (=> (not res!88417) (not e!70232))))

(assert (=> d!33856 (= res!88417 (invariant!0 (currentBit!5135 (_2!4667 lt!159698)) (currentByte!5140 (_2!4667 lt!159698)) (size!2240 (buf!2622 (_2!4667 lt!159698)))))))

(assert (=> d!33856 (= (readerFrom!0 (_2!4667 lt!159698) (currentBit!5135 thiss!1305) (currentByte!5140 thiss!1305)) (BitStream!3955 (buf!2622 (_2!4667 lt!159698)) (currentByte!5140 thiss!1305) (currentBit!5135 thiss!1305)))))

(declare-fun b!107297 () Bool)

(assert (=> b!107297 (= e!70232 (invariant!0 (currentBit!5135 thiss!1305) (currentByte!5140 thiss!1305) (size!2240 (buf!2622 (_2!4667 lt!159698)))))))

(assert (= (and d!33856 res!88417) b!107297))

(assert (=> d!33856 m!157985))

(assert (=> b!107297 m!157999))

(assert (=> b!107069 d!33856))

(declare-fun d!33858 () Bool)

(assert (=> d!33858 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!107074 d!33858))

(declare-fun d!33860 () Bool)

(assert (=> d!33860 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2240 (buf!2622 thiss!1305))) ((_ sign_extend 32) (currentByte!5140 thiss!1305)) ((_ sign_extend 32) (currentBit!5135 thiss!1305)) lt!159696) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2240 (buf!2622 thiss!1305))) ((_ sign_extend 32) (currentByte!5140 thiss!1305)) ((_ sign_extend 32) (currentBit!5135 thiss!1305))) lt!159696))))

(declare-fun bs!8260 () Bool)

(assert (= bs!8260 d!33860))

(assert (=> bs!8260 m!158433))

(assert (=> b!107063 d!33860))

(declare-fun d!33862 () Bool)

(assert (=> d!33862 (= (invariant!0 (currentBit!5135 thiss!1305) (currentByte!5140 thiss!1305) (size!2240 (buf!2622 (_2!4667 lt!159716)))) (and (bvsge (currentBit!5135 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5135 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5140 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5140 thiss!1305) (size!2240 (buf!2622 (_2!4667 lt!159716)))) (and (= (currentBit!5135 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5140 thiss!1305) (size!2240 (buf!2622 (_2!4667 lt!159716))))))))))

(assert (=> b!107073 d!33862))

(declare-fun d!33864 () Bool)

(assert (=> d!33864 (= (invariant!0 (currentBit!5135 thiss!1305) (currentByte!5140 thiss!1305) (size!2240 (buf!2622 (_2!4667 lt!159698)))) (and (bvsge (currentBit!5135 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5135 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5140 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5140 thiss!1305) (size!2240 (buf!2622 (_2!4667 lt!159698)))) (and (= (currentBit!5135 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5140 thiss!1305) (size!2240 (buf!2622 (_2!4667 lt!159698))))))))))

(assert (=> b!107062 d!33864))

(check-sat (not d!33806) (not d!33818) (not d!33846) (not b!107258) (not d!33826) (not d!33856) (not b!107256) (not b!107222) (not d!33800) (not d!33816) (not d!33804) (not b!107237) (not d!33814) (not d!33834) (not b!107272) (not b!107257) (not bm!1350) (not b!107215) (not b!107221) (not d!33802) (not b!107259) (not d!33828) (not d!33808) (not b!107268) (not d!33838) (not b!107224) (not d!33852) (not d!33842) (not d!33796) (not b!107283) (not b!107238) (not b!107236) (not d!33798) (not d!33794) (not b!107217) (not d!33830) (not d!33822) (not b!107225) (not d!33810) (not d!33848) (not d!33854) (not d!33824) (not b!107274) (not b!107271) (not b!107285) (not b!107219) (not b!107213) (not b!107218) (not d!33860) (not b!107297) (not b!107270) (not d!33792) (not b!107273) (not b!107239) (not d!33836) (not d!33840))
