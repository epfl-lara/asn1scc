; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20346 () Bool)

(assert start!20346)

(declare-fun b!102210 () Bool)

(declare-fun res!84027 () Bool)

(declare-fun e!66867 () Bool)

(assert (=> b!102210 (=> (not res!84027) (not e!66867))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!102210 (= res!84027 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!102211 () Bool)

(declare-fun res!84031 () Bool)

(assert (=> b!102211 (=> (not res!84031) (not e!66867))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!102211 (= res!84031 (bvslt i!615 nBits!396))))

(declare-fun b!102212 () Bool)

(declare-fun res!84030 () Bool)

(declare-fun e!66864 () Bool)

(assert (=> b!102212 (=> (not res!84030) (not e!66864))))

(declare-datatypes ((array!4790 0))(
  ( (array!4791 (arr!2779 (Array (_ BitVec 32) (_ BitVec 8))) (size!2186 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3846 0))(
  ( (BitStream!3847 (buf!2546 array!4790) (currentByte!5019 (_ BitVec 32)) (currentBit!5014 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3846)

(declare-datatypes ((Unit!6268 0))(
  ( (Unit!6269) )
))
(declare-datatypes ((tuple2!8310 0))(
  ( (tuple2!8311 (_1!4410 Unit!6268) (_2!4410 BitStream!3846)) )
))
(declare-fun lt!148699 () tuple2!8310)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!102212 (= res!84030 (invariant!0 (currentBit!5014 thiss!1305) (currentByte!5019 thiss!1305) (size!2186 (buf!2546 (_2!4410 lt!148699)))))))

(declare-fun b!102213 () Bool)

(assert (=> b!102213 (= e!66867 (not true))))

(declare-datatypes ((tuple2!8312 0))(
  ( (tuple2!8313 (_1!4411 BitStream!3846) (_2!4411 (_ BitVec 64))) )
))
(declare-fun lt!148701 () tuple2!8312)

(declare-datatypes ((tuple2!8314 0))(
  ( (tuple2!8315 (_1!4412 BitStream!3846) (_2!4412 BitStream!3846)) )
))
(declare-fun lt!148698 () tuple2!8314)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3846 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8312)

(assert (=> b!102213 (= lt!148701 (readNLeastSignificantBitsLoopPure!0 (_1!4412 lt!148698) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(declare-fun lt!148700 () tuple2!8310)

(declare-fun lt!148703 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!102213 (validate_offset_bits!1 ((_ sign_extend 32) (size!2186 (buf!2546 (_2!4410 lt!148700)))) ((_ sign_extend 32) (currentByte!5019 thiss!1305)) ((_ sign_extend 32) (currentBit!5014 thiss!1305)) lt!148703)))

(declare-fun lt!148707 () Unit!6268)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3846 array!4790 (_ BitVec 64)) Unit!6268)

(assert (=> b!102213 (= lt!148707 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2546 (_2!4410 lt!148700)) lt!148703))))

(declare-fun lt!148705 () Bool)

(declare-datatypes ((tuple2!8316 0))(
  ( (tuple2!8317 (_1!4413 BitStream!3846) (_2!4413 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!3846) tuple2!8316)

(assert (=> b!102213 (= (_2!4413 (readBitPure!0 (_1!4412 lt!148698))) lt!148705)))

(declare-fun lt!148706 () tuple2!8314)

(declare-fun reader!0 (BitStream!3846 BitStream!3846) tuple2!8314)

(assert (=> b!102213 (= lt!148706 (reader!0 (_2!4410 lt!148699) (_2!4410 lt!148700)))))

(assert (=> b!102213 (= lt!148698 (reader!0 thiss!1305 (_2!4410 lt!148700)))))

(declare-fun e!66863 () Bool)

(assert (=> b!102213 e!66863))

(declare-fun res!84022 () Bool)

(assert (=> b!102213 (=> (not res!84022) (not e!66863))))

(declare-fun lt!148695 () tuple2!8316)

(declare-fun lt!148708 () tuple2!8316)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!102213 (= res!84022 (= (bitIndex!0 (size!2186 (buf!2546 (_1!4413 lt!148695))) (currentByte!5019 (_1!4413 lt!148695)) (currentBit!5014 (_1!4413 lt!148695))) (bitIndex!0 (size!2186 (buf!2546 (_1!4413 lt!148708))) (currentByte!5019 (_1!4413 lt!148708)) (currentBit!5014 (_1!4413 lt!148708)))))))

(declare-fun lt!148696 () Unit!6268)

(declare-fun lt!148702 () BitStream!3846)

(declare-fun readBitPrefixLemma!0 (BitStream!3846 BitStream!3846) Unit!6268)

(assert (=> b!102213 (= lt!148696 (readBitPrefixLemma!0 lt!148702 (_2!4410 lt!148700)))))

(assert (=> b!102213 (= lt!148708 (readBitPure!0 (BitStream!3847 (buf!2546 (_2!4410 lt!148700)) (currentByte!5019 thiss!1305) (currentBit!5014 thiss!1305))))))

(assert (=> b!102213 (= lt!148695 (readBitPure!0 lt!148702))))

(assert (=> b!102213 (= lt!148702 (BitStream!3847 (buf!2546 (_2!4410 lt!148699)) (currentByte!5019 thiss!1305) (currentBit!5014 thiss!1305)))))

(assert (=> b!102213 e!66864))

(declare-fun res!84024 () Bool)

(assert (=> b!102213 (=> (not res!84024) (not e!66864))))

(declare-fun isPrefixOf!0 (BitStream!3846 BitStream!3846) Bool)

(assert (=> b!102213 (= res!84024 (isPrefixOf!0 thiss!1305 (_2!4410 lt!148700)))))

(declare-fun lt!148693 () Unit!6268)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3846 BitStream!3846 BitStream!3846) Unit!6268)

(assert (=> b!102213 (= lt!148693 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4410 lt!148699) (_2!4410 lt!148700)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3846 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8310)

(assert (=> b!102213 (= lt!148700 (appendNLeastSignificantBitsLoop!0 (_2!4410 lt!148699) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!66866 () Bool)

(assert (=> b!102213 e!66866))

(declare-fun res!84028 () Bool)

(assert (=> b!102213 (=> (not res!84028) (not e!66866))))

(assert (=> b!102213 (= res!84028 (= (size!2186 (buf!2546 thiss!1305)) (size!2186 (buf!2546 (_2!4410 lt!148699)))))))

(declare-fun appendBit!0 (BitStream!3846 Bool) tuple2!8310)

(assert (=> b!102213 (= lt!148699 (appendBit!0 thiss!1305 lt!148705))))

(assert (=> b!102213 (= lt!148705 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!102214 () Bool)

(declare-fun e!66860 () Bool)

(assert (=> b!102214 (= e!66860 e!66867)))

(declare-fun res!84023 () Bool)

(assert (=> b!102214 (=> (not res!84023) (not e!66867))))

(assert (=> b!102214 (= res!84023 (validate_offset_bits!1 ((_ sign_extend 32) (size!2186 (buf!2546 thiss!1305))) ((_ sign_extend 32) (currentByte!5019 thiss!1305)) ((_ sign_extend 32) (currentBit!5014 thiss!1305)) lt!148703))))

(assert (=> b!102214 (= lt!148703 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!102215 () Bool)

(assert (=> b!102215 (= e!66864 (invariant!0 (currentBit!5014 thiss!1305) (currentByte!5019 thiss!1305) (size!2186 (buf!2546 (_2!4410 lt!148700)))))))

(declare-fun b!102216 () Bool)

(declare-fun res!84026 () Bool)

(declare-fun e!66861 () Bool)

(assert (=> b!102216 (=> (not res!84026) (not e!66861))))

(assert (=> b!102216 (= res!84026 (isPrefixOf!0 thiss!1305 (_2!4410 lt!148699)))))

(declare-fun b!102217 () Bool)

(declare-fun e!66859 () Bool)

(declare-fun array_inv!1988 (array!4790) Bool)

(assert (=> b!102217 (= e!66859 (array_inv!1988 (buf!2546 thiss!1305)))))

(declare-fun b!102218 () Bool)

(declare-fun e!66865 () Bool)

(declare-fun lt!148694 () tuple2!8316)

(declare-fun lt!148704 () (_ BitVec 64))

(assert (=> b!102218 (= e!66865 (= (bitIndex!0 (size!2186 (buf!2546 (_1!4413 lt!148694))) (currentByte!5019 (_1!4413 lt!148694)) (currentBit!5014 (_1!4413 lt!148694))) lt!148704))))

(declare-fun b!102219 () Bool)

(assert (=> b!102219 (= e!66866 e!66861)))

(declare-fun res!84032 () Bool)

(assert (=> b!102219 (=> (not res!84032) (not e!66861))))

(declare-fun lt!148697 () (_ BitVec 64))

(assert (=> b!102219 (= res!84032 (= lt!148704 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!148697)))))

(assert (=> b!102219 (= lt!148704 (bitIndex!0 (size!2186 (buf!2546 (_2!4410 lt!148699))) (currentByte!5019 (_2!4410 lt!148699)) (currentBit!5014 (_2!4410 lt!148699))))))

(assert (=> b!102219 (= lt!148697 (bitIndex!0 (size!2186 (buf!2546 thiss!1305)) (currentByte!5019 thiss!1305) (currentBit!5014 thiss!1305)))))

(declare-fun res!84025 () Bool)

(assert (=> start!20346 (=> (not res!84025) (not e!66860))))

(assert (=> start!20346 (= res!84025 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20346 e!66860))

(assert (=> start!20346 true))

(declare-fun inv!12 (BitStream!3846) Bool)

(assert (=> start!20346 (and (inv!12 thiss!1305) e!66859)))

(declare-fun b!102220 () Bool)

(assert (=> b!102220 (= e!66863 (= (_2!4413 lt!148695) (_2!4413 lt!148708)))))

(declare-fun b!102221 () Bool)

(assert (=> b!102221 (= e!66861 e!66865)))

(declare-fun res!84029 () Bool)

(assert (=> b!102221 (=> (not res!84029) (not e!66865))))

(assert (=> b!102221 (= res!84029 (and (= (_2!4413 lt!148694) lt!148705) (= (_1!4413 lt!148694) (_2!4410 lt!148699))))))

(declare-fun readerFrom!0 (BitStream!3846 (_ BitVec 32) (_ BitVec 32)) BitStream!3846)

(assert (=> b!102221 (= lt!148694 (readBitPure!0 (readerFrom!0 (_2!4410 lt!148699) (currentBit!5014 thiss!1305) (currentByte!5019 thiss!1305))))))

(assert (= (and start!20346 res!84025) b!102214))

(assert (= (and b!102214 res!84023) b!102210))

(assert (= (and b!102210 res!84027) b!102211))

(assert (= (and b!102211 res!84031) b!102213))

(assert (= (and b!102213 res!84028) b!102219))

(assert (= (and b!102219 res!84032) b!102216))

(assert (= (and b!102216 res!84026) b!102221))

(assert (= (and b!102221 res!84029) b!102218))

(assert (= (and b!102213 res!84024) b!102212))

(assert (= (and b!102212 res!84030) b!102215))

(assert (= (and b!102213 res!84022) b!102220))

(assert (= start!20346 b!102217))

(declare-fun m!148827 () Bool)

(assert (=> b!102221 m!148827))

(assert (=> b!102221 m!148827))

(declare-fun m!148829 () Bool)

(assert (=> b!102221 m!148829))

(declare-fun m!148831 () Bool)

(assert (=> b!102219 m!148831))

(declare-fun m!148833 () Bool)

(assert (=> b!102219 m!148833))

(declare-fun m!148835 () Bool)

(assert (=> b!102215 m!148835))

(declare-fun m!148837 () Bool)

(assert (=> start!20346 m!148837))

(declare-fun m!148839 () Bool)

(assert (=> b!102212 m!148839))

(declare-fun m!148841 () Bool)

(assert (=> b!102210 m!148841))

(declare-fun m!148843 () Bool)

(assert (=> b!102217 m!148843))

(declare-fun m!148845 () Bool)

(assert (=> b!102216 m!148845))

(declare-fun m!148847 () Bool)

(assert (=> b!102214 m!148847))

(declare-fun m!148849 () Bool)

(assert (=> b!102213 m!148849))

(declare-fun m!148851 () Bool)

(assert (=> b!102213 m!148851))

(declare-fun m!148853 () Bool)

(assert (=> b!102213 m!148853))

(declare-fun m!148855 () Bool)

(assert (=> b!102213 m!148855))

(declare-fun m!148857 () Bool)

(assert (=> b!102213 m!148857))

(declare-fun m!148859 () Bool)

(assert (=> b!102213 m!148859))

(declare-fun m!148861 () Bool)

(assert (=> b!102213 m!148861))

(declare-fun m!148863 () Bool)

(assert (=> b!102213 m!148863))

(declare-fun m!148865 () Bool)

(assert (=> b!102213 m!148865))

(declare-fun m!148867 () Bool)

(assert (=> b!102213 m!148867))

(declare-fun m!148869 () Bool)

(assert (=> b!102213 m!148869))

(declare-fun m!148871 () Bool)

(assert (=> b!102213 m!148871))

(declare-fun m!148873 () Bool)

(assert (=> b!102213 m!148873))

(declare-fun m!148875 () Bool)

(assert (=> b!102213 m!148875))

(declare-fun m!148877 () Bool)

(assert (=> b!102213 m!148877))

(declare-fun m!148879 () Bool)

(assert (=> b!102213 m!148879))

(declare-fun m!148881 () Bool)

(assert (=> b!102218 m!148881))

(check-sat (not b!102212) (not b!102214) (not b!102216) (not b!102221) (not start!20346) (not b!102217) (not b!102210) (not b!102213) (not b!102215) (not b!102219) (not b!102218))
