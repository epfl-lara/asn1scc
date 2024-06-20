; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28010 () Bool)

(assert start!28010)

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6602 0))(
  ( (array!6603 (arr!3722 (Array (_ BitVec 32) (_ BitVec 8))) (size!2989 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5236 0))(
  ( (BitStream!5237 (buf!3428 array!6602) (currentByte!6318 (_ BitVec 32)) (currentBit!6313 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!12954 0))(
  ( (tuple2!12955 (_1!6823 BitStream!5236) (_2!6823 array!6602)) )
))
(declare-fun lt!224732 () tuple2!12954)

(declare-fun arr!237 () array!6602)

(declare-fun e!96668 () Bool)

(declare-fun b!145025 () Bool)

(declare-fun arrayRangesEq!305 (array!6602 array!6602 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!145025 (= e!96668 (not (arrayRangesEq!305 arr!237 (_2!6823 lt!224732) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!145026 () Bool)

(declare-fun res!121228 () Bool)

(declare-fun e!96676 () Bool)

(assert (=> b!145026 (=> (not res!121228) (not e!96676))))

(declare-fun thiss!1634 () BitStream!5236)

(declare-datatypes ((Unit!9051 0))(
  ( (Unit!9052) )
))
(declare-datatypes ((tuple2!12956 0))(
  ( (tuple2!12957 (_1!6824 Unit!9051) (_2!6824 BitStream!5236)) )
))
(declare-fun lt!224721 () tuple2!12956)

(declare-fun isPrefixOf!0 (BitStream!5236 BitStream!5236) Bool)

(assert (=> b!145026 (= res!121228 (isPrefixOf!0 thiss!1634 (_2!6824 lt!224721)))))

(declare-fun b!145027 () Bool)

(declare-fun res!121232 () Bool)

(declare-fun e!96669 () Bool)

(assert (=> b!145027 (=> (not res!121232) (not e!96669))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!145027 (= res!121232 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2989 (buf!3428 thiss!1634))) ((_ sign_extend 32) (currentByte!6318 thiss!1634)) ((_ sign_extend 32) (currentBit!6313 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun e!96672 () Bool)

(declare-datatypes ((tuple2!12958 0))(
  ( (tuple2!12959 (_1!6825 BitStream!5236) (_2!6825 BitStream!5236)) )
))
(declare-fun lt!224728 () tuple2!12958)

(declare-fun b!145028 () Bool)

(declare-fun readByteArrayLoopPure!0 (BitStream!5236 array!6602 (_ BitVec 32) (_ BitVec 32)) tuple2!12954)

(assert (=> b!145028 (= e!96672 (= (_1!6823 (readByteArrayLoopPure!0 (_1!6825 lt!224728) arr!237 from!447 to!404)) (_2!6825 lt!224728)))))

(declare-fun b!145029 () Bool)

(declare-fun e!96671 () Bool)

(assert (=> b!145029 (= e!96671 (not e!96668))))

(declare-fun res!121227 () Bool)

(assert (=> b!145029 (=> res!121227 e!96668)))

(declare-fun lt!224719 () tuple2!12958)

(assert (=> b!145029 (= res!121227 (or (not (= (size!2989 (_2!6823 lt!224732)) (size!2989 arr!237))) (not (= (_1!6823 lt!224732) (_2!6825 lt!224719)))))))

(assert (=> b!145029 (= lt!224732 (readByteArrayLoopPure!0 (_1!6825 lt!224719) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!224724 () tuple2!12956)

(declare-fun lt!224725 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!145029 (validate_offset_bits!1 ((_ sign_extend 32) (size!2989 (buf!3428 (_2!6824 lt!224724)))) ((_ sign_extend 32) (currentByte!6318 (_2!6824 lt!224721))) ((_ sign_extend 32) (currentBit!6313 (_2!6824 lt!224721))) lt!224725)))

(declare-fun lt!224715 () Unit!9051)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5236 array!6602 (_ BitVec 64)) Unit!9051)

(assert (=> b!145029 (= lt!224715 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6824 lt!224721) (buf!3428 (_2!6824 lt!224724)) lt!224725))))

(declare-fun reader!0 (BitStream!5236 BitStream!5236) tuple2!12958)

(assert (=> b!145029 (= lt!224719 (reader!0 (_2!6824 lt!224721) (_2!6824 lt!224724)))))

(declare-fun b!145030 () Bool)

(declare-fun e!96677 () Bool)

(declare-fun array_inv!2778 (array!6602) Bool)

(assert (=> b!145030 (= e!96677 (array_inv!2778 (buf!3428 thiss!1634)))))

(declare-fun b!145031 () Bool)

(declare-fun res!121239 () Bool)

(assert (=> b!145031 (=> (not res!121239) (not e!96669))))

(assert (=> b!145031 (= res!121239 (bvslt from!447 to!404))))

(declare-fun b!145033 () Bool)

(assert (=> b!145033 (= e!96669 (not (bvslt from!447 (size!2989 arr!237))))))

(declare-fun lt!224726 () (_ BitVec 32))

(assert (=> b!145033 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2989 (buf!3428 (_2!6824 lt!224724)))) ((_ sign_extend 32) (currentByte!6318 (_2!6824 lt!224721))) ((_ sign_extend 32) (currentBit!6313 (_2!6824 lt!224721))) lt!224726)))

(declare-fun lt!224731 () Unit!9051)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5236 array!6602 (_ BitVec 32)) Unit!9051)

(assert (=> b!145033 (= lt!224731 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6824 lt!224721) (buf!3428 (_2!6824 lt!224724)) lt!224726))))

(assert (=> b!145033 e!96672))

(declare-fun res!121230 () Bool)

(assert (=> b!145033 (=> (not res!121230) (not e!96672))))

(assert (=> b!145033 (= res!121230 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2989 (buf!3428 (_2!6824 lt!224724)))) ((_ sign_extend 32) (currentByte!6318 thiss!1634)) ((_ sign_extend 32) (currentBit!6313 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!224729 () Unit!9051)

(assert (=> b!145033 (= lt!224729 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3428 (_2!6824 lt!224724)) (bvsub to!404 from!447)))))

(declare-datatypes ((tuple2!12960 0))(
  ( (tuple2!12961 (_1!6826 BitStream!5236) (_2!6826 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5236) tuple2!12960)

(assert (=> b!145033 (= (_2!6826 (readBytePure!0 (_1!6825 lt!224728))) (select (arr!3722 arr!237) from!447))))

(declare-fun lt!224717 () tuple2!12958)

(assert (=> b!145033 (= lt!224717 (reader!0 (_2!6824 lt!224721) (_2!6824 lt!224724)))))

(assert (=> b!145033 (= lt!224728 (reader!0 thiss!1634 (_2!6824 lt!224724)))))

(declare-fun e!96678 () Bool)

(assert (=> b!145033 e!96678))

(declare-fun res!121234 () Bool)

(assert (=> b!145033 (=> (not res!121234) (not e!96678))))

(declare-fun lt!224733 () tuple2!12960)

(declare-fun lt!224720 () tuple2!12960)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!145033 (= res!121234 (= (bitIndex!0 (size!2989 (buf!3428 (_1!6826 lt!224733))) (currentByte!6318 (_1!6826 lt!224733)) (currentBit!6313 (_1!6826 lt!224733))) (bitIndex!0 (size!2989 (buf!3428 (_1!6826 lt!224720))) (currentByte!6318 (_1!6826 lt!224720)) (currentBit!6313 (_1!6826 lt!224720)))))))

(declare-fun lt!224723 () Unit!9051)

(declare-fun lt!224727 () BitStream!5236)

(declare-fun readBytePrefixLemma!0 (BitStream!5236 BitStream!5236) Unit!9051)

(assert (=> b!145033 (= lt!224723 (readBytePrefixLemma!0 lt!224727 (_2!6824 lt!224724)))))

(assert (=> b!145033 (= lt!224720 (readBytePure!0 (BitStream!5237 (buf!3428 (_2!6824 lt!224724)) (currentByte!6318 thiss!1634) (currentBit!6313 thiss!1634))))))

(assert (=> b!145033 (= lt!224733 (readBytePure!0 lt!224727))))

(assert (=> b!145033 (= lt!224727 (BitStream!5237 (buf!3428 (_2!6824 lt!224721)) (currentByte!6318 thiss!1634) (currentBit!6313 thiss!1634)))))

(declare-fun e!96674 () Bool)

(assert (=> b!145033 e!96674))

(declare-fun res!121231 () Bool)

(assert (=> b!145033 (=> (not res!121231) (not e!96674))))

(assert (=> b!145033 (= res!121231 (isPrefixOf!0 thiss!1634 (_2!6824 lt!224724)))))

(declare-fun lt!224730 () Unit!9051)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5236 BitStream!5236 BitStream!5236) Unit!9051)

(assert (=> b!145033 (= lt!224730 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6824 lt!224721) (_2!6824 lt!224724)))))

(declare-fun e!96670 () Bool)

(assert (=> b!145033 e!96670))

(declare-fun res!121233 () Bool)

(assert (=> b!145033 (=> (not res!121233) (not e!96670))))

(assert (=> b!145033 (= res!121233 (= (size!2989 (buf!3428 (_2!6824 lt!224721))) (size!2989 (buf!3428 (_2!6824 lt!224724)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5236 array!6602 (_ BitVec 32) (_ BitVec 32)) tuple2!12956)

(assert (=> b!145033 (= lt!224724 (appendByteArrayLoop!0 (_2!6824 lt!224721) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!145033 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2989 (buf!3428 (_2!6824 lt!224721)))) ((_ sign_extend 32) (currentByte!6318 (_2!6824 lt!224721))) ((_ sign_extend 32) (currentBit!6313 (_2!6824 lt!224721))) lt!224726)))

(assert (=> b!145033 (= lt!224726 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!224718 () Unit!9051)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5236 BitStream!5236 (_ BitVec 64) (_ BitVec 32)) Unit!9051)

(assert (=> b!145033 (= lt!224718 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6824 lt!224721) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!145033 e!96676))

(declare-fun res!121229 () Bool)

(assert (=> b!145033 (=> (not res!121229) (not e!96676))))

(assert (=> b!145033 (= res!121229 (= (size!2989 (buf!3428 thiss!1634)) (size!2989 (buf!3428 (_2!6824 lt!224721)))))))

(declare-fun appendByte!0 (BitStream!5236 (_ BitVec 8)) tuple2!12956)

(assert (=> b!145033 (= lt!224721 (appendByte!0 thiss!1634 (select (arr!3722 arr!237) from!447)))))

(declare-fun b!145034 () Bool)

(assert (=> b!145034 (= e!96670 e!96671)))

(declare-fun res!121238 () Bool)

(assert (=> b!145034 (=> (not res!121238) (not e!96671))))

(assert (=> b!145034 (= res!121238 (= (bitIndex!0 (size!2989 (buf!3428 (_2!6824 lt!224724))) (currentByte!6318 (_2!6824 lt!224724)) (currentBit!6313 (_2!6824 lt!224724))) (bvadd (bitIndex!0 (size!2989 (buf!3428 (_2!6824 lt!224721))) (currentByte!6318 (_2!6824 lt!224721)) (currentBit!6313 (_2!6824 lt!224721))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!224725))))))

(assert (=> b!145034 (= lt!224725 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!145035 () Bool)

(declare-fun res!121237 () Bool)

(assert (=> b!145035 (=> (not res!121237) (not e!96676))))

(assert (=> b!145035 (= res!121237 (= (bitIndex!0 (size!2989 (buf!3428 (_2!6824 lt!224721))) (currentByte!6318 (_2!6824 lt!224721)) (currentBit!6313 (_2!6824 lt!224721))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2989 (buf!3428 thiss!1634)) (currentByte!6318 thiss!1634) (currentBit!6313 thiss!1634)))))))

(declare-fun b!145036 () Bool)

(declare-fun lt!224722 () tuple2!12960)

(declare-fun lt!224716 () tuple2!12958)

(assert (=> b!145036 (= e!96676 (and (= (_2!6826 lt!224722) (select (arr!3722 arr!237) from!447)) (= (_1!6826 lt!224722) (_2!6825 lt!224716))))))

(assert (=> b!145036 (= lt!224722 (readBytePure!0 (_1!6825 lt!224716)))))

(assert (=> b!145036 (= lt!224716 (reader!0 thiss!1634 (_2!6824 lt!224721)))))

(declare-fun b!145037 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!145037 (= e!96674 (invariant!0 (currentBit!6313 thiss!1634) (currentByte!6318 thiss!1634) (size!2989 (buf!3428 (_2!6824 lt!224721)))))))

(declare-fun b!145038 () Bool)

(declare-fun res!121235 () Bool)

(assert (=> b!145038 (=> (not res!121235) (not e!96669))))

(assert (=> b!145038 (= res!121235 (invariant!0 (currentBit!6313 thiss!1634) (currentByte!6318 thiss!1634) (size!2989 (buf!3428 thiss!1634))))))

(declare-fun b!145039 () Bool)

(declare-fun res!121240 () Bool)

(assert (=> b!145039 (=> (not res!121240) (not e!96671))))

(assert (=> b!145039 (= res!121240 (isPrefixOf!0 (_2!6824 lt!224721) (_2!6824 lt!224724)))))

(declare-fun res!121236 () Bool)

(assert (=> start!28010 (=> (not res!121236) (not e!96669))))

(assert (=> start!28010 (= res!121236 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2989 arr!237))))))

(assert (=> start!28010 e!96669))

(assert (=> start!28010 true))

(assert (=> start!28010 (array_inv!2778 arr!237)))

(declare-fun inv!12 (BitStream!5236) Bool)

(assert (=> start!28010 (and (inv!12 thiss!1634) e!96677)))

(declare-fun b!145032 () Bool)

(assert (=> b!145032 (= e!96678 (= (_2!6826 lt!224733) (_2!6826 lt!224720)))))

(assert (= (and start!28010 res!121236) b!145027))

(assert (= (and b!145027 res!121232) b!145031))

(assert (= (and b!145031 res!121239) b!145038))

(assert (= (and b!145038 res!121235) b!145033))

(assert (= (and b!145033 res!121229) b!145035))

(assert (= (and b!145035 res!121237) b!145026))

(assert (= (and b!145026 res!121228) b!145036))

(assert (= (and b!145033 res!121233) b!145034))

(assert (= (and b!145034 res!121238) b!145039))

(assert (= (and b!145039 res!121240) b!145029))

(assert (= (and b!145029 (not res!121227)) b!145025))

(assert (= (and b!145033 res!121231) b!145037))

(assert (= (and b!145033 res!121234) b!145032))

(assert (= (and b!145033 res!121230) b!145028))

(assert (= start!28010 b!145030))

(declare-fun m!223061 () Bool)

(assert (=> b!145034 m!223061))

(declare-fun m!223063 () Bool)

(assert (=> b!145034 m!223063))

(declare-fun m!223065 () Bool)

(assert (=> b!145030 m!223065))

(declare-fun m!223067 () Bool)

(assert (=> b!145029 m!223067))

(declare-fun m!223069 () Bool)

(assert (=> b!145029 m!223069))

(declare-fun m!223071 () Bool)

(assert (=> b!145029 m!223071))

(declare-fun m!223073 () Bool)

(assert (=> b!145029 m!223073))

(assert (=> b!145035 m!223063))

(declare-fun m!223075 () Bool)

(assert (=> b!145035 m!223075))

(declare-fun m!223077 () Bool)

(assert (=> b!145036 m!223077))

(declare-fun m!223079 () Bool)

(assert (=> b!145036 m!223079))

(declare-fun m!223081 () Bool)

(assert (=> b!145036 m!223081))

(declare-fun m!223083 () Bool)

(assert (=> b!145039 m!223083))

(declare-fun m!223085 () Bool)

(assert (=> b!145028 m!223085))

(declare-fun m!223087 () Bool)

(assert (=> b!145027 m!223087))

(declare-fun m!223089 () Bool)

(assert (=> b!145038 m!223089))

(declare-fun m!223091 () Bool)

(assert (=> b!145025 m!223091))

(declare-fun m!223093 () Bool)

(assert (=> b!145026 m!223093))

(declare-fun m!223095 () Bool)

(assert (=> start!28010 m!223095))

(declare-fun m!223097 () Bool)

(assert (=> start!28010 m!223097))

(declare-fun m!223099 () Bool)

(assert (=> b!145033 m!223099))

(declare-fun m!223101 () Bool)

(assert (=> b!145033 m!223101))

(declare-fun m!223103 () Bool)

(assert (=> b!145033 m!223103))

(declare-fun m!223105 () Bool)

(assert (=> b!145033 m!223105))

(declare-fun m!223107 () Bool)

(assert (=> b!145033 m!223107))

(declare-fun m!223109 () Bool)

(assert (=> b!145033 m!223109))

(declare-fun m!223111 () Bool)

(assert (=> b!145033 m!223111))

(assert (=> b!145033 m!223073))

(assert (=> b!145033 m!223077))

(declare-fun m!223113 () Bool)

(assert (=> b!145033 m!223113))

(declare-fun m!223115 () Bool)

(assert (=> b!145033 m!223115))

(declare-fun m!223117 () Bool)

(assert (=> b!145033 m!223117))

(declare-fun m!223119 () Bool)

(assert (=> b!145033 m!223119))

(declare-fun m!223121 () Bool)

(assert (=> b!145033 m!223121))

(declare-fun m!223123 () Bool)

(assert (=> b!145033 m!223123))

(declare-fun m!223125 () Bool)

(assert (=> b!145033 m!223125))

(declare-fun m!223127 () Bool)

(assert (=> b!145033 m!223127))

(assert (=> b!145033 m!223077))

(declare-fun m!223129 () Bool)

(assert (=> b!145033 m!223129))

(declare-fun m!223131 () Bool)

(assert (=> b!145033 m!223131))

(declare-fun m!223133 () Bool)

(assert (=> b!145037 m!223133))

(push 1)

(assert (not b!145025))

(assert (not b!145035))

(assert (not b!145029))

(assert (not b!145034))

(assert (not b!145037))

(assert (not b!145030))

(assert (not b!145026))

(assert (not b!145033))

(assert (not b!145038))

(assert (not b!145028))

(assert (not b!145027))

(assert (not b!145036))

(assert (not start!28010))

(assert (not b!145039))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

