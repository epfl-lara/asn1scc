; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23910 () Bool)

(assert start!23910)

(declare-fun b!120901 () Bool)

(declare-fun e!79172 () Bool)

(declare-fun e!79167 () Bool)

(assert (=> b!120901 (= e!79172 e!79167)))

(declare-fun res!100105 () Bool)

(assert (=> b!120901 (=> (not res!100105) (not e!79167))))

(declare-fun lt!188788 () (_ BitVec 64))

(declare-fun lt!188799 () (_ BitVec 64))

(assert (=> b!120901 (= res!100105 (= lt!188788 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!188799)))))

(declare-datatypes ((array!5370 0))(
  ( (array!5371 (arr!3023 (Array (_ BitVec 32) (_ BitVec 8))) (size!2430 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4334 0))(
  ( (BitStream!4335 (buf!2864 array!5370) (currentByte!5549 (_ BitVec 32)) (currentBit!5544 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!7451 0))(
  ( (Unit!7452) )
))
(declare-datatypes ((tuple2!10136 0))(
  ( (tuple2!10137 (_1!5333 Unit!7451) (_2!5333 BitStream!4334)) )
))
(declare-fun lt!188800 () tuple2!10136)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!120901 (= lt!188788 (bitIndex!0 (size!2430 (buf!2864 (_2!5333 lt!188800))) (currentByte!5549 (_2!5333 lt!188800)) (currentBit!5544 (_2!5333 lt!188800))))))

(declare-fun thiss!1305 () BitStream!4334)

(assert (=> b!120901 (= lt!188799 (bitIndex!0 (size!2430 (buf!2864 thiss!1305)) (currentByte!5549 thiss!1305) (currentBit!5544 thiss!1305)))))

(declare-fun b!120902 () Bool)

(declare-fun res!100107 () Bool)

(declare-fun e!79173 () Bool)

(assert (=> b!120902 (=> (not res!100107) (not e!79173))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!120902 (= res!100107 (invariant!0 (currentBit!5544 thiss!1305) (currentByte!5549 thiss!1305) (size!2430 (buf!2864 (_2!5333 lt!188800)))))))

(declare-fun b!120903 () Bool)

(declare-fun res!100110 () Bool)

(declare-fun e!79174 () Bool)

(assert (=> b!120903 (=> (not res!100110) (not e!79174))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!120903 (= res!100110 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!120904 () Bool)

(declare-fun e!79169 () Bool)

(assert (=> b!120904 (= e!79169 e!79174)))

(declare-fun res!100113 () Bool)

(assert (=> b!120904 (=> (not res!100113) (not e!79174))))

(declare-fun lt!188802 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!120904 (= res!100113 (validate_offset_bits!1 ((_ sign_extend 32) (size!2430 (buf!2864 thiss!1305))) ((_ sign_extend 32) (currentByte!5549 thiss!1305)) ((_ sign_extend 32) (currentBit!5544 thiss!1305)) lt!188802))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!120904 (= lt!188802 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!120905 () Bool)

(declare-fun e!79168 () Bool)

(assert (=> b!120905 (= e!79174 (not e!79168))))

(declare-fun res!100116 () Bool)

(assert (=> b!120905 (=> res!100116 e!79168)))

(declare-fun lt!188784 () (_ BitVec 64))

(declare-datatypes ((tuple2!10138 0))(
  ( (tuple2!10139 (_1!5334 BitStream!4334) (_2!5334 BitStream!4334)) )
))
(declare-fun lt!188785 () tuple2!10138)

(declare-datatypes ((tuple2!10140 0))(
  ( (tuple2!10141 (_1!5335 BitStream!4334) (_2!5335 (_ BitVec 64))) )
))
(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4334 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10140)

(assert (=> b!120905 (= res!100116 (not (= (_1!5335 (readNLeastSignificantBitsLoopPure!0 (_1!5334 lt!188785) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!188784)) (_2!5334 lt!188785))))))

(declare-fun lt!188792 () tuple2!10136)

(declare-fun lt!188801 () (_ BitVec 64))

(assert (=> b!120905 (validate_offset_bits!1 ((_ sign_extend 32) (size!2430 (buf!2864 (_2!5333 lt!188792)))) ((_ sign_extend 32) (currentByte!5549 (_2!5333 lt!188800))) ((_ sign_extend 32) (currentBit!5544 (_2!5333 lt!188800))) lt!188801)))

(declare-fun lt!188776 () Unit!7451)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4334 array!5370 (_ BitVec 64)) Unit!7451)

(assert (=> b!120905 (= lt!188776 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5333 lt!188800) (buf!2864 (_2!5333 lt!188792)) lt!188801))))

(assert (=> b!120905 (= lt!188801 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!10142 0))(
  ( (tuple2!10143 (_1!5336 BitStream!4334) (_2!5336 Bool)) )
))
(declare-fun lt!188786 () tuple2!10142)

(declare-fun lt!188787 () (_ BitVec 64))

(declare-fun lt!188797 () (_ BitVec 64))

(assert (=> b!120905 (= lt!188784 (bvor lt!188797 (ite (_2!5336 lt!188786) lt!188787 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!188798 () tuple2!10140)

(declare-fun lt!188793 () tuple2!10138)

(assert (=> b!120905 (= lt!188798 (readNLeastSignificantBitsLoopPure!0 (_1!5334 lt!188793) nBits!396 i!615 lt!188797))))

(assert (=> b!120905 (validate_offset_bits!1 ((_ sign_extend 32) (size!2430 (buf!2864 (_2!5333 lt!188792)))) ((_ sign_extend 32) (currentByte!5549 thiss!1305)) ((_ sign_extend 32) (currentBit!5544 thiss!1305)) lt!188802)))

(declare-fun lt!188795 () Unit!7451)

(assert (=> b!120905 (= lt!188795 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2864 (_2!5333 lt!188792)) lt!188802))))

(assert (=> b!120905 (= lt!188797 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!188779 () Bool)

(assert (=> b!120905 (= (_2!5336 lt!188786) lt!188779)))

(declare-fun readBitPure!0 (BitStream!4334) tuple2!10142)

(assert (=> b!120905 (= lt!188786 (readBitPure!0 (_1!5334 lt!188793)))))

(declare-fun reader!0 (BitStream!4334 BitStream!4334) tuple2!10138)

(assert (=> b!120905 (= lt!188785 (reader!0 (_2!5333 lt!188800) (_2!5333 lt!188792)))))

(assert (=> b!120905 (= lt!188793 (reader!0 thiss!1305 (_2!5333 lt!188792)))))

(declare-fun e!79171 () Bool)

(assert (=> b!120905 e!79171))

(declare-fun res!100109 () Bool)

(assert (=> b!120905 (=> (not res!100109) (not e!79171))))

(declare-fun lt!188778 () tuple2!10142)

(declare-fun lt!188777 () tuple2!10142)

(assert (=> b!120905 (= res!100109 (= (bitIndex!0 (size!2430 (buf!2864 (_1!5336 lt!188778))) (currentByte!5549 (_1!5336 lt!188778)) (currentBit!5544 (_1!5336 lt!188778))) (bitIndex!0 (size!2430 (buf!2864 (_1!5336 lt!188777))) (currentByte!5549 (_1!5336 lt!188777)) (currentBit!5544 (_1!5336 lt!188777)))))))

(declare-fun lt!188791 () Unit!7451)

(declare-fun lt!188781 () BitStream!4334)

(declare-fun readBitPrefixLemma!0 (BitStream!4334 BitStream!4334) Unit!7451)

(assert (=> b!120905 (= lt!188791 (readBitPrefixLemma!0 lt!188781 (_2!5333 lt!188792)))))

(assert (=> b!120905 (= lt!188777 (readBitPure!0 (BitStream!4335 (buf!2864 (_2!5333 lt!188792)) (currentByte!5549 thiss!1305) (currentBit!5544 thiss!1305))))))

(assert (=> b!120905 (= lt!188778 (readBitPure!0 lt!188781))))

(assert (=> b!120905 (= lt!188781 (BitStream!4335 (buf!2864 (_2!5333 lt!188800)) (currentByte!5549 thiss!1305) (currentBit!5544 thiss!1305)))))

(assert (=> b!120905 e!79173))

(declare-fun res!100114 () Bool)

(assert (=> b!120905 (=> (not res!100114) (not e!79173))))

(declare-fun isPrefixOf!0 (BitStream!4334 BitStream!4334) Bool)

(assert (=> b!120905 (= res!100114 (isPrefixOf!0 thiss!1305 (_2!5333 lt!188792)))))

(declare-fun lt!188796 () Unit!7451)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4334 BitStream!4334 BitStream!4334) Unit!7451)

(assert (=> b!120905 (= lt!188796 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5333 lt!188800) (_2!5333 lt!188792)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4334 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!10136)

(assert (=> b!120905 (= lt!188792 (appendNLeastSignificantBitsLoop!0 (_2!5333 lt!188800) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!120905 e!79172))

(declare-fun res!100111 () Bool)

(assert (=> b!120905 (=> (not res!100111) (not e!79172))))

(assert (=> b!120905 (= res!100111 (= (size!2430 (buf!2864 thiss!1305)) (size!2430 (buf!2864 (_2!5333 lt!188800)))))))

(declare-fun appendBit!0 (BitStream!4334 Bool) tuple2!10136)

(assert (=> b!120905 (= lt!188800 (appendBit!0 thiss!1305 lt!188779))))

(assert (=> b!120905 (= lt!188779 (not (= (bvand v!199 lt!188787) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120905 (= lt!188787 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!120906 () Bool)

(assert (=> b!120906 (= e!79173 (invariant!0 (currentBit!5544 thiss!1305) (currentByte!5549 thiss!1305) (size!2430 (buf!2864 (_2!5333 lt!188792)))))))

(declare-fun res!100115 () Bool)

(assert (=> start!23910 (=> (not res!100115) (not e!79169))))

(assert (=> start!23910 (= res!100115 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23910 e!79169))

(assert (=> start!23910 true))

(declare-fun e!79175 () Bool)

(declare-fun inv!12 (BitStream!4334) Bool)

(assert (=> start!23910 (and (inv!12 thiss!1305) e!79175)))

(declare-fun b!120907 () Bool)

(declare-fun res!100106 () Bool)

(assert (=> b!120907 (=> (not res!100106) (not e!79167))))

(assert (=> b!120907 (= res!100106 (isPrefixOf!0 thiss!1305 (_2!5333 lt!188800)))))

(declare-fun b!120908 () Bool)

(declare-fun e!79176 () Bool)

(declare-fun lt!188790 () tuple2!10142)

(assert (=> b!120908 (= e!79176 (= (bitIndex!0 (size!2430 (buf!2864 (_1!5336 lt!188790))) (currentByte!5549 (_1!5336 lt!188790)) (currentBit!5544 (_1!5336 lt!188790))) lt!188788))))

(declare-fun b!120909 () Bool)

(assert (=> b!120909 (= e!79171 (= (_2!5336 lt!188778) (_2!5336 lt!188777)))))

(declare-fun b!120910 () Bool)

(declare-fun res!100112 () Bool)

(assert (=> b!120910 (=> (not res!100112) (not e!79174))))

(assert (=> b!120910 (= res!100112 (bvslt i!615 nBits!396))))

(declare-fun b!120911 () Bool)

(declare-fun lt!188789 () (_ BitVec 64))

(declare-fun lt!188783 () (_ BitVec 64))

(assert (=> b!120911 (= e!79168 (= lt!188789 (bvsub lt!188783 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!188794 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4334 (_ BitVec 64)) BitStream!4334)

(assert (=> b!120911 (= (_1!5334 lt!188785) (withMovedBitIndex!0 (_2!5334 lt!188785) (bvsub lt!188783 lt!188794)))))

(assert (=> b!120911 (= lt!188783 (bitIndex!0 (size!2430 (buf!2864 (_2!5333 lt!188800))) (currentByte!5549 (_2!5333 lt!188800)) (currentBit!5544 (_2!5333 lt!188800))))))

(assert (=> b!120911 (= (_1!5334 lt!188793) (withMovedBitIndex!0 (_2!5334 lt!188793) (bvsub lt!188789 lt!188794)))))

(assert (=> b!120911 (= lt!188794 (bitIndex!0 (size!2430 (buf!2864 (_2!5333 lt!188792))) (currentByte!5549 (_2!5333 lt!188792)) (currentBit!5544 (_2!5333 lt!188792))))))

(assert (=> b!120911 (= lt!188789 (bitIndex!0 (size!2430 (buf!2864 thiss!1305)) (currentByte!5549 thiss!1305) (currentBit!5544 thiss!1305)))))

(declare-fun lt!188782 () tuple2!10140)

(assert (=> b!120911 (and (= (_2!5335 lt!188798) (_2!5335 lt!188782)) (= (_1!5335 lt!188798) (_1!5335 lt!188782)))))

(declare-fun lt!188780 () Unit!7451)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4334 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7451)

(assert (=> b!120911 (= lt!188780 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5334 lt!188793) nBits!396 i!615 lt!188797))))

(assert (=> b!120911 (= lt!188782 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5334 lt!188793) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!188784))))

(declare-fun b!120912 () Bool)

(declare-fun array_inv!2232 (array!5370) Bool)

(assert (=> b!120912 (= e!79175 (array_inv!2232 (buf!2864 thiss!1305)))))

(declare-fun b!120913 () Bool)

(assert (=> b!120913 (= e!79167 e!79176)))

(declare-fun res!100108 () Bool)

(assert (=> b!120913 (=> (not res!100108) (not e!79176))))

(assert (=> b!120913 (= res!100108 (and (= (_2!5336 lt!188790) lt!188779) (= (_1!5336 lt!188790) (_2!5333 lt!188800))))))

(declare-fun readerFrom!0 (BitStream!4334 (_ BitVec 32) (_ BitVec 32)) BitStream!4334)

(assert (=> b!120913 (= lt!188790 (readBitPure!0 (readerFrom!0 (_2!5333 lt!188800) (currentBit!5544 thiss!1305) (currentByte!5549 thiss!1305))))))

(assert (= (and start!23910 res!100115) b!120904))

(assert (= (and b!120904 res!100113) b!120903))

(assert (= (and b!120903 res!100110) b!120910))

(assert (= (and b!120910 res!100112) b!120905))

(assert (= (and b!120905 res!100111) b!120901))

(assert (= (and b!120901 res!100105) b!120907))

(assert (= (and b!120907 res!100106) b!120913))

(assert (= (and b!120913 res!100108) b!120908))

(assert (= (and b!120905 res!100114) b!120902))

(assert (= (and b!120902 res!100107) b!120906))

(assert (= (and b!120905 res!100109) b!120909))

(assert (= (and b!120905 (not res!100116)) b!120911))

(assert (= start!23910 b!120912))

(declare-fun m!182955 () Bool)

(assert (=> b!120901 m!182955))

(declare-fun m!182957 () Bool)

(assert (=> b!120901 m!182957))

(declare-fun m!182959 () Bool)

(assert (=> b!120903 m!182959))

(declare-fun m!182961 () Bool)

(assert (=> b!120904 m!182961))

(declare-fun m!182963 () Bool)

(assert (=> start!23910 m!182963))

(declare-fun m!182965 () Bool)

(assert (=> b!120907 m!182965))

(declare-fun m!182967 () Bool)

(assert (=> b!120911 m!182967))

(declare-fun m!182969 () Bool)

(assert (=> b!120911 m!182969))

(declare-fun m!182971 () Bool)

(assert (=> b!120911 m!182971))

(assert (=> b!120911 m!182955))

(declare-fun m!182973 () Bool)

(assert (=> b!120911 m!182973))

(assert (=> b!120911 m!182971))

(declare-fun m!182975 () Bool)

(assert (=> b!120911 m!182975))

(declare-fun m!182977 () Bool)

(assert (=> b!120911 m!182977))

(assert (=> b!120911 m!182957))

(declare-fun m!182979 () Bool)

(assert (=> b!120905 m!182979))

(declare-fun m!182981 () Bool)

(assert (=> b!120905 m!182981))

(declare-fun m!182983 () Bool)

(assert (=> b!120905 m!182983))

(declare-fun m!182985 () Bool)

(assert (=> b!120905 m!182985))

(declare-fun m!182987 () Bool)

(assert (=> b!120905 m!182987))

(declare-fun m!182989 () Bool)

(assert (=> b!120905 m!182989))

(declare-fun m!182991 () Bool)

(assert (=> b!120905 m!182991))

(declare-fun m!182993 () Bool)

(assert (=> b!120905 m!182993))

(declare-fun m!182995 () Bool)

(assert (=> b!120905 m!182995))

(declare-fun m!182997 () Bool)

(assert (=> b!120905 m!182997))

(declare-fun m!182999 () Bool)

(assert (=> b!120905 m!182999))

(declare-fun m!183001 () Bool)

(assert (=> b!120905 m!183001))

(declare-fun m!183003 () Bool)

(assert (=> b!120905 m!183003))

(declare-fun m!183005 () Bool)

(assert (=> b!120905 m!183005))

(declare-fun m!183007 () Bool)

(assert (=> b!120905 m!183007))

(declare-fun m!183009 () Bool)

(assert (=> b!120905 m!183009))

(declare-fun m!183011 () Bool)

(assert (=> b!120905 m!183011))

(declare-fun m!183013 () Bool)

(assert (=> b!120905 m!183013))

(declare-fun m!183015 () Bool)

(assert (=> b!120905 m!183015))

(declare-fun m!183017 () Bool)

(assert (=> b!120912 m!183017))

(declare-fun m!183019 () Bool)

(assert (=> b!120906 m!183019))

(declare-fun m!183021 () Bool)

(assert (=> b!120913 m!183021))

(assert (=> b!120913 m!183021))

(declare-fun m!183023 () Bool)

(assert (=> b!120913 m!183023))

(declare-fun m!183025 () Bool)

(assert (=> b!120908 m!183025))

(declare-fun m!183027 () Bool)

(assert (=> b!120902 m!183027))

(push 1)

(assert (not b!120912))

(assert (not b!120903))

(assert (not b!120913))

(assert (not b!120908))

(assert (not start!23910))

(assert (not b!120902))

(assert (not b!120905))

(assert (not b!120901))

(assert (not b!120907))

(assert (not b!120911))

(assert (not b!120904))

(assert (not b!120906))

(check-sat)

(pop 1)

(push 1)

(check-sat)

