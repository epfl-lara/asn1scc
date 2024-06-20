; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20214 () Bool)

(assert start!20214)

(declare-fun res!83068 () Bool)

(declare-fun e!66123 () Bool)

(assert (=> start!20214 (=> (not res!83068) (not e!66123))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!20214 (= res!83068 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20214 e!66123))

(assert (=> start!20214 true))

(declare-datatypes ((array!4745 0))(
  ( (array!4746 (arr!2758 (Array (_ BitVec 32) (_ BitVec 8))) (size!2165 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3804 0))(
  ( (BitStream!3805 (buf!2522 array!4745) (currentByte!4989 (_ BitVec 32)) (currentBit!4984 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3804)

(declare-fun e!66122 () Bool)

(declare-fun inv!12 (BitStream!3804) Bool)

(assert (=> start!20214 (and (inv!12 thiss!1305) e!66122)))

(declare-fun b!101133 () Bool)

(declare-fun e!66119 () Bool)

(declare-fun e!66125 () Bool)

(assert (=> b!101133 (= e!66119 e!66125)))

(declare-fun res!83078 () Bool)

(assert (=> b!101133 (=> (not res!83078) (not e!66125))))

(declare-fun lt!146881 () (_ BitVec 64))

(declare-fun lt!146879 () (_ BitVec 64))

(assert (=> b!101133 (= res!83078 (= lt!146881 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!146879)))))

(declare-datatypes ((Unit!6202 0))(
  ( (Unit!6203) )
))
(declare-datatypes ((tuple2!8170 0))(
  ( (tuple2!8171 (_1!4340 Unit!6202) (_2!4340 BitStream!3804)) )
))
(declare-fun lt!146873 () tuple2!8170)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!101133 (= lt!146881 (bitIndex!0 (size!2165 (buf!2522 (_2!4340 lt!146873))) (currentByte!4989 (_2!4340 lt!146873)) (currentBit!4984 (_2!4340 lt!146873))))))

(assert (=> b!101133 (= lt!146879 (bitIndex!0 (size!2165 (buf!2522 thiss!1305)) (currentByte!4989 thiss!1305) (currentBit!4984 thiss!1305)))))

(declare-fun b!101134 () Bool)

(assert (=> b!101134 (= e!66123 (not true))))

(declare-datatypes ((tuple2!8172 0))(
  ( (tuple2!8173 (_1!4341 BitStream!3804) (_2!4341 BitStream!3804)) )
))
(declare-fun lt!146872 () tuple2!8172)

(declare-fun lt!146875 () Bool)

(declare-datatypes ((tuple2!8174 0))(
  ( (tuple2!8175 (_1!4342 BitStream!3804) (_2!4342 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!3804) tuple2!8174)

(assert (=> b!101134 (= (_2!4342 (readBitPure!0 (_1!4341 lt!146872))) lt!146875)))

(declare-fun lt!146876 () tuple2!8172)

(declare-fun lt!146877 () tuple2!8170)

(declare-fun reader!0 (BitStream!3804 BitStream!3804) tuple2!8172)

(assert (=> b!101134 (= lt!146876 (reader!0 (_2!4340 lt!146873) (_2!4340 lt!146877)))))

(assert (=> b!101134 (= lt!146872 (reader!0 thiss!1305 (_2!4340 lt!146877)))))

(declare-fun e!66121 () Bool)

(assert (=> b!101134 e!66121))

(declare-fun res!83070 () Bool)

(assert (=> b!101134 (=> (not res!83070) (not e!66121))))

(declare-fun lt!146882 () tuple2!8174)

(declare-fun lt!146880 () tuple2!8174)

(assert (=> b!101134 (= res!83070 (= (bitIndex!0 (size!2165 (buf!2522 (_1!4342 lt!146882))) (currentByte!4989 (_1!4342 lt!146882)) (currentBit!4984 (_1!4342 lt!146882))) (bitIndex!0 (size!2165 (buf!2522 (_1!4342 lt!146880))) (currentByte!4989 (_1!4342 lt!146880)) (currentBit!4984 (_1!4342 lt!146880)))))))

(declare-fun lt!146874 () Unit!6202)

(declare-fun lt!146883 () BitStream!3804)

(declare-fun readBitPrefixLemma!0 (BitStream!3804 BitStream!3804) Unit!6202)

(assert (=> b!101134 (= lt!146874 (readBitPrefixLemma!0 lt!146883 (_2!4340 lt!146877)))))

(assert (=> b!101134 (= lt!146880 (readBitPure!0 (BitStream!3805 (buf!2522 (_2!4340 lt!146877)) (currentByte!4989 thiss!1305) (currentBit!4984 thiss!1305))))))

(assert (=> b!101134 (= lt!146882 (readBitPure!0 lt!146883))))

(assert (=> b!101134 (= lt!146883 (BitStream!3805 (buf!2522 (_2!4340 lt!146873)) (currentByte!4989 thiss!1305) (currentBit!4984 thiss!1305)))))

(declare-fun e!66120 () Bool)

(assert (=> b!101134 e!66120))

(declare-fun res!83074 () Bool)

(assert (=> b!101134 (=> (not res!83074) (not e!66120))))

(declare-fun isPrefixOf!0 (BitStream!3804 BitStream!3804) Bool)

(assert (=> b!101134 (= res!83074 (isPrefixOf!0 thiss!1305 (_2!4340 lt!146877)))))

(declare-fun lt!146884 () Unit!6202)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3804 BitStream!3804 BitStream!3804) Unit!6202)

(assert (=> b!101134 (= lt!146884 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4340 lt!146873) (_2!4340 lt!146877)))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3804 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8170)

(assert (=> b!101134 (= lt!146877 (appendNLeastSignificantBitsLoop!0 (_2!4340 lt!146873) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!101134 e!66119))

(declare-fun res!83071 () Bool)

(assert (=> b!101134 (=> (not res!83071) (not e!66119))))

(assert (=> b!101134 (= res!83071 (= (size!2165 (buf!2522 thiss!1305)) (size!2165 (buf!2522 (_2!4340 lt!146873)))))))

(declare-fun appendBit!0 (BitStream!3804 Bool) tuple2!8170)

(assert (=> b!101134 (= lt!146873 (appendBit!0 thiss!1305 lt!146875))))

(assert (=> b!101134 (= lt!146875 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!101135 () Bool)

(assert (=> b!101135 (= e!66121 (= (_2!4342 lt!146882) (_2!4342 lt!146880)))))

(declare-fun b!101136 () Bool)

(declare-fun res!83075 () Bool)

(assert (=> b!101136 (=> (not res!83075) (not e!66123))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!101136 (= res!83075 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!101137 () Bool)

(declare-fun res!83072 () Bool)

(assert (=> b!101137 (=> (not res!83072) (not e!66120))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!101137 (= res!83072 (invariant!0 (currentBit!4984 thiss!1305) (currentByte!4989 thiss!1305) (size!2165 (buf!2522 (_2!4340 lt!146873)))))))

(declare-fun b!101138 () Bool)

(declare-fun e!66126 () Bool)

(assert (=> b!101138 (= e!66125 e!66126)))

(declare-fun res!83073 () Bool)

(assert (=> b!101138 (=> (not res!83073) (not e!66126))))

(declare-fun lt!146878 () tuple2!8174)

(assert (=> b!101138 (= res!83073 (and (= (_2!4342 lt!146878) lt!146875) (= (_1!4342 lt!146878) (_2!4340 lt!146873))))))

(declare-fun readerFrom!0 (BitStream!3804 (_ BitVec 32) (_ BitVec 32)) BitStream!3804)

(assert (=> b!101138 (= lt!146878 (readBitPure!0 (readerFrom!0 (_2!4340 lt!146873) (currentBit!4984 thiss!1305) (currentByte!4989 thiss!1305))))))

(declare-fun b!101139 () Bool)

(declare-fun res!83076 () Bool)

(assert (=> b!101139 (=> (not res!83076) (not e!66123))))

(assert (=> b!101139 (= res!83076 (bvslt i!615 nBits!396))))

(declare-fun b!101140 () Bool)

(assert (=> b!101140 (= e!66120 (invariant!0 (currentBit!4984 thiss!1305) (currentByte!4989 thiss!1305) (size!2165 (buf!2522 (_2!4340 lt!146877)))))))

(declare-fun b!101141 () Bool)

(declare-fun array_inv!1967 (array!4745) Bool)

(assert (=> b!101141 (= e!66122 (array_inv!1967 (buf!2522 thiss!1305)))))

(declare-fun b!101142 () Bool)

(declare-fun res!83069 () Bool)

(assert (=> b!101142 (=> (not res!83069) (not e!66123))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!101142 (= res!83069 (validate_offset_bits!1 ((_ sign_extend 32) (size!2165 (buf!2522 thiss!1305))) ((_ sign_extend 32) (currentByte!4989 thiss!1305)) ((_ sign_extend 32) (currentBit!4984 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!101143 () Bool)

(declare-fun res!83077 () Bool)

(assert (=> b!101143 (=> (not res!83077) (not e!66125))))

(assert (=> b!101143 (= res!83077 (isPrefixOf!0 thiss!1305 (_2!4340 lt!146873)))))

(declare-fun b!101144 () Bool)

(assert (=> b!101144 (= e!66126 (= (bitIndex!0 (size!2165 (buf!2522 (_1!4342 lt!146878))) (currentByte!4989 (_1!4342 lt!146878)) (currentBit!4984 (_1!4342 lt!146878))) lt!146881))))

(assert (= (and start!20214 res!83068) b!101142))

(assert (= (and b!101142 res!83069) b!101136))

(assert (= (and b!101136 res!83075) b!101139))

(assert (= (and b!101139 res!83076) b!101134))

(assert (= (and b!101134 res!83071) b!101133))

(assert (= (and b!101133 res!83078) b!101143))

(assert (= (and b!101143 res!83077) b!101138))

(assert (= (and b!101138 res!83073) b!101144))

(assert (= (and b!101134 res!83074) b!101137))

(assert (= (and b!101137 res!83072) b!101140))

(assert (= (and b!101134 res!83070) b!101135))

(assert (= start!20214 b!101141))

(declare-fun m!147115 () Bool)

(assert (=> b!101144 m!147115))

(declare-fun m!147117 () Bool)

(assert (=> b!101133 m!147117))

(declare-fun m!147119 () Bool)

(assert (=> b!101133 m!147119))

(declare-fun m!147121 () Bool)

(assert (=> b!101140 m!147121))

(declare-fun m!147123 () Bool)

(assert (=> b!101136 m!147123))

(declare-fun m!147125 () Bool)

(assert (=> b!101138 m!147125))

(assert (=> b!101138 m!147125))

(declare-fun m!147127 () Bool)

(assert (=> b!101138 m!147127))

(declare-fun m!147129 () Bool)

(assert (=> start!20214 m!147129))

(declare-fun m!147131 () Bool)

(assert (=> b!101134 m!147131))

(declare-fun m!147133 () Bool)

(assert (=> b!101134 m!147133))

(declare-fun m!147135 () Bool)

(assert (=> b!101134 m!147135))

(declare-fun m!147137 () Bool)

(assert (=> b!101134 m!147137))

(declare-fun m!147139 () Bool)

(assert (=> b!101134 m!147139))

(declare-fun m!147141 () Bool)

(assert (=> b!101134 m!147141))

(declare-fun m!147143 () Bool)

(assert (=> b!101134 m!147143))

(declare-fun m!147145 () Bool)

(assert (=> b!101134 m!147145))

(declare-fun m!147147 () Bool)

(assert (=> b!101134 m!147147))

(declare-fun m!147149 () Bool)

(assert (=> b!101134 m!147149))

(declare-fun m!147151 () Bool)

(assert (=> b!101134 m!147151))

(declare-fun m!147153 () Bool)

(assert (=> b!101134 m!147153))

(declare-fun m!147155 () Bool)

(assert (=> b!101143 m!147155))

(declare-fun m!147157 () Bool)

(assert (=> b!101137 m!147157))

(declare-fun m!147159 () Bool)

(assert (=> b!101141 m!147159))

(declare-fun m!147161 () Bool)

(assert (=> b!101142 m!147161))

(check-sat (not b!101141) (not b!101144) (not b!101142) (not b!101136) (not b!101137) (not b!101143) (not b!101134) (not b!101133) (not b!101138) (not start!20214) (not b!101140))
