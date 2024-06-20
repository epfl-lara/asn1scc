; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20350 () Bool)

(assert start!20350)

(declare-fun b!102282 () Bool)

(declare-fun e!66915 () Bool)

(declare-fun e!66920 () Bool)

(assert (=> b!102282 (= e!66915 e!66920)))

(declare-fun res!84089 () Bool)

(assert (=> b!102282 (=> (not res!84089) (not e!66920))))

(declare-fun lt!148801 () (_ BitVec 64))

(declare-fun lt!148792 () (_ BitVec 64))

(assert (=> b!102282 (= res!84089 (= lt!148801 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!148792)))))

(declare-datatypes ((array!4794 0))(
  ( (array!4795 (arr!2781 (Array (_ BitVec 32) (_ BitVec 8))) (size!2188 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3850 0))(
  ( (BitStream!3851 (buf!2548 array!4794) (currentByte!5021 (_ BitVec 32)) (currentBit!5016 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!6272 0))(
  ( (Unit!6273) )
))
(declare-datatypes ((tuple2!8326 0))(
  ( (tuple2!8327 (_1!4418 Unit!6272) (_2!4418 BitStream!3850)) )
))
(declare-fun lt!148793 () tuple2!8326)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!102282 (= lt!148801 (bitIndex!0 (size!2188 (buf!2548 (_2!4418 lt!148793))) (currentByte!5021 (_2!4418 lt!148793)) (currentBit!5016 (_2!4418 lt!148793))))))

(declare-fun thiss!1305 () BitStream!3850)

(assert (=> b!102282 (= lt!148792 (bitIndex!0 (size!2188 (buf!2548 thiss!1305)) (currentByte!5021 thiss!1305) (currentBit!5016 thiss!1305)))))

(declare-fun b!102283 () Bool)

(declare-fun res!84088 () Bool)

(declare-fun e!66917 () Bool)

(assert (=> b!102283 (=> (not res!84088) (not e!66917))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!102283 (= res!84088 (bvslt i!615 nBits!396))))

(declare-fun b!102284 () Bool)

(declare-fun e!66921 () Bool)

(assert (=> b!102284 (= e!66921 e!66917)))

(declare-fun res!84093 () Bool)

(assert (=> b!102284 (=> (not res!84093) (not e!66917))))

(declare-fun lt!148789 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!102284 (= res!84093 (validate_offset_bits!1 ((_ sign_extend 32) (size!2188 (buf!2548 thiss!1305))) ((_ sign_extend 32) (currentByte!5021 thiss!1305)) ((_ sign_extend 32) (currentBit!5016 thiss!1305)) lt!148789))))

(assert (=> b!102284 (= lt!148789 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun res!84098 () Bool)

(assert (=> start!20350 (=> (not res!84098) (not e!66921))))

(assert (=> start!20350 (= res!84098 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20350 e!66921))

(assert (=> start!20350 true))

(declare-fun e!66914 () Bool)

(declare-fun inv!12 (BitStream!3850) Bool)

(assert (=> start!20350 (and (inv!12 thiss!1305) e!66914)))

(declare-fun b!102285 () Bool)

(declare-fun e!66916 () Bool)

(declare-datatypes ((tuple2!8328 0))(
  ( (tuple2!8329 (_1!4419 BitStream!3850) (_2!4419 Bool)) )
))
(declare-fun lt!148796 () tuple2!8328)

(declare-fun lt!148799 () tuple2!8328)

(assert (=> b!102285 (= e!66916 (= (_2!4419 lt!148796) (_2!4419 lt!148799)))))

(declare-fun b!102286 () Bool)

(declare-fun e!66918 () Bool)

(assert (=> b!102286 (= e!66920 e!66918)))

(declare-fun res!84091 () Bool)

(assert (=> b!102286 (=> (not res!84091) (not e!66918))))

(declare-fun lt!148803 () tuple2!8328)

(declare-fun lt!148791 () Bool)

(assert (=> b!102286 (= res!84091 (and (= (_2!4419 lt!148803) lt!148791) (= (_1!4419 lt!148803) (_2!4418 lt!148793))))))

(declare-fun readBitPure!0 (BitStream!3850) tuple2!8328)

(declare-fun readerFrom!0 (BitStream!3850 (_ BitVec 32) (_ BitVec 32)) BitStream!3850)

(assert (=> b!102286 (= lt!148803 (readBitPure!0 (readerFrom!0 (_2!4418 lt!148793) (currentBit!5016 thiss!1305) (currentByte!5021 thiss!1305))))))

(declare-fun b!102287 () Bool)

(declare-fun res!84094 () Bool)

(declare-fun e!66919 () Bool)

(assert (=> b!102287 (=> (not res!84094) (not e!66919))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!102287 (= res!84094 (invariant!0 (currentBit!5016 thiss!1305) (currentByte!5021 thiss!1305) (size!2188 (buf!2548 (_2!4418 lt!148793)))))))

(declare-fun b!102288 () Bool)

(declare-fun lt!148794 () tuple2!8326)

(assert (=> b!102288 (= e!66919 (invariant!0 (currentBit!5016 thiss!1305) (currentByte!5021 thiss!1305) (size!2188 (buf!2548 (_2!4418 lt!148794)))))))

(declare-fun b!102289 () Bool)

(declare-fun res!84097 () Bool)

(assert (=> b!102289 (=> (not res!84097) (not e!66917))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!102289 (= res!84097 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!102290 () Bool)

(assert (=> b!102290 (= e!66918 (= (bitIndex!0 (size!2188 (buf!2548 (_1!4419 lt!148803))) (currentByte!5021 (_1!4419 lt!148803)) (currentBit!5016 (_1!4419 lt!148803))) lt!148801))))

(declare-fun b!102291 () Bool)

(declare-fun res!84095 () Bool)

(assert (=> b!102291 (=> (not res!84095) (not e!66920))))

(declare-fun isPrefixOf!0 (BitStream!3850 BitStream!3850) Bool)

(assert (=> b!102291 (= res!84095 (isPrefixOf!0 thiss!1305 (_2!4418 lt!148793)))))

(declare-fun b!102292 () Bool)

(assert (=> b!102292 (= e!66917 (not true))))

(declare-datatypes ((tuple2!8330 0))(
  ( (tuple2!8331 (_1!4420 BitStream!3850) (_2!4420 (_ BitVec 64))) )
))
(declare-fun lt!148790 () tuple2!8330)

(declare-datatypes ((tuple2!8332 0))(
  ( (tuple2!8333 (_1!4421 BitStream!3850) (_2!4421 BitStream!3850)) )
))
(declare-fun lt!148804 () tuple2!8332)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3850 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8330)

(assert (=> b!102292 (= lt!148790 (readNLeastSignificantBitsLoopPure!0 (_1!4421 lt!148804) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(assert (=> b!102292 (validate_offset_bits!1 ((_ sign_extend 32) (size!2188 (buf!2548 (_2!4418 lt!148794)))) ((_ sign_extend 32) (currentByte!5021 thiss!1305)) ((_ sign_extend 32) (currentBit!5016 thiss!1305)) lt!148789)))

(declare-fun lt!148797 () Unit!6272)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3850 array!4794 (_ BitVec 64)) Unit!6272)

(assert (=> b!102292 (= lt!148797 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2548 (_2!4418 lt!148794)) lt!148789))))

(assert (=> b!102292 (= (_2!4419 (readBitPure!0 (_1!4421 lt!148804))) lt!148791)))

(declare-fun lt!148798 () tuple2!8332)

(declare-fun reader!0 (BitStream!3850 BitStream!3850) tuple2!8332)

(assert (=> b!102292 (= lt!148798 (reader!0 (_2!4418 lt!148793) (_2!4418 lt!148794)))))

(assert (=> b!102292 (= lt!148804 (reader!0 thiss!1305 (_2!4418 lt!148794)))))

(assert (=> b!102292 e!66916))

(declare-fun res!84096 () Bool)

(assert (=> b!102292 (=> (not res!84096) (not e!66916))))

(assert (=> b!102292 (= res!84096 (= (bitIndex!0 (size!2188 (buf!2548 (_1!4419 lt!148796))) (currentByte!5021 (_1!4419 lt!148796)) (currentBit!5016 (_1!4419 lt!148796))) (bitIndex!0 (size!2188 (buf!2548 (_1!4419 lt!148799))) (currentByte!5021 (_1!4419 lt!148799)) (currentBit!5016 (_1!4419 lt!148799)))))))

(declare-fun lt!148800 () Unit!6272)

(declare-fun lt!148802 () BitStream!3850)

(declare-fun readBitPrefixLemma!0 (BitStream!3850 BitStream!3850) Unit!6272)

(assert (=> b!102292 (= lt!148800 (readBitPrefixLemma!0 lt!148802 (_2!4418 lt!148794)))))

(assert (=> b!102292 (= lt!148799 (readBitPure!0 (BitStream!3851 (buf!2548 (_2!4418 lt!148794)) (currentByte!5021 thiss!1305) (currentBit!5016 thiss!1305))))))

(assert (=> b!102292 (= lt!148796 (readBitPure!0 lt!148802))))

(assert (=> b!102292 (= lt!148802 (BitStream!3851 (buf!2548 (_2!4418 lt!148793)) (currentByte!5021 thiss!1305) (currentBit!5016 thiss!1305)))))

(assert (=> b!102292 e!66919))

(declare-fun res!84092 () Bool)

(assert (=> b!102292 (=> (not res!84092) (not e!66919))))

(assert (=> b!102292 (= res!84092 (isPrefixOf!0 thiss!1305 (_2!4418 lt!148794)))))

(declare-fun lt!148795 () Unit!6272)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3850 BitStream!3850 BitStream!3850) Unit!6272)

(assert (=> b!102292 (= lt!148795 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4418 lt!148793) (_2!4418 lt!148794)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3850 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8326)

(assert (=> b!102292 (= lt!148794 (appendNLeastSignificantBitsLoop!0 (_2!4418 lt!148793) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!102292 e!66915))

(declare-fun res!84090 () Bool)

(assert (=> b!102292 (=> (not res!84090) (not e!66915))))

(assert (=> b!102292 (= res!84090 (= (size!2188 (buf!2548 thiss!1305)) (size!2188 (buf!2548 (_2!4418 lt!148793)))))))

(declare-fun appendBit!0 (BitStream!3850 Bool) tuple2!8326)

(assert (=> b!102292 (= lt!148793 (appendBit!0 thiss!1305 lt!148791))))

(assert (=> b!102292 (= lt!148791 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!102293 () Bool)

(declare-fun array_inv!1990 (array!4794) Bool)

(assert (=> b!102293 (= e!66914 (array_inv!1990 (buf!2548 thiss!1305)))))

(assert (= (and start!20350 res!84098) b!102284))

(assert (= (and b!102284 res!84093) b!102289))

(assert (= (and b!102289 res!84097) b!102283))

(assert (= (and b!102283 res!84088) b!102292))

(assert (= (and b!102292 res!84090) b!102282))

(assert (= (and b!102282 res!84089) b!102291))

(assert (= (and b!102291 res!84095) b!102286))

(assert (= (and b!102286 res!84091) b!102290))

(assert (= (and b!102292 res!84092) b!102287))

(assert (= (and b!102287 res!84094) b!102288))

(assert (= (and b!102292 res!84096) b!102285))

(assert (= start!20350 b!102293))

(declare-fun m!148939 () Bool)

(assert (=> b!102291 m!148939))

(declare-fun m!148941 () Bool)

(assert (=> b!102289 m!148941))

(declare-fun m!148943 () Bool)

(assert (=> b!102292 m!148943))

(declare-fun m!148945 () Bool)

(assert (=> b!102292 m!148945))

(declare-fun m!148947 () Bool)

(assert (=> b!102292 m!148947))

(declare-fun m!148949 () Bool)

(assert (=> b!102292 m!148949))

(declare-fun m!148951 () Bool)

(assert (=> b!102292 m!148951))

(declare-fun m!148953 () Bool)

(assert (=> b!102292 m!148953))

(declare-fun m!148955 () Bool)

(assert (=> b!102292 m!148955))

(declare-fun m!148957 () Bool)

(assert (=> b!102292 m!148957))

(declare-fun m!148959 () Bool)

(assert (=> b!102292 m!148959))

(declare-fun m!148961 () Bool)

(assert (=> b!102292 m!148961))

(declare-fun m!148963 () Bool)

(assert (=> b!102292 m!148963))

(declare-fun m!148965 () Bool)

(assert (=> b!102292 m!148965))

(declare-fun m!148967 () Bool)

(assert (=> b!102292 m!148967))

(declare-fun m!148969 () Bool)

(assert (=> b!102292 m!148969))

(declare-fun m!148971 () Bool)

(assert (=> b!102292 m!148971))

(declare-fun m!148973 () Bool)

(assert (=> b!102292 m!148973))

(declare-fun m!148975 () Bool)

(assert (=> b!102286 m!148975))

(assert (=> b!102286 m!148975))

(declare-fun m!148977 () Bool)

(assert (=> b!102286 m!148977))

(declare-fun m!148979 () Bool)

(assert (=> b!102284 m!148979))

(declare-fun m!148981 () Bool)

(assert (=> b!102282 m!148981))

(declare-fun m!148983 () Bool)

(assert (=> b!102282 m!148983))

(declare-fun m!148985 () Bool)

(assert (=> b!102288 m!148985))

(declare-fun m!148987 () Bool)

(assert (=> start!20350 m!148987))

(declare-fun m!148989 () Bool)

(assert (=> b!102287 m!148989))

(declare-fun m!148991 () Bool)

(assert (=> b!102293 m!148991))

(declare-fun m!148993 () Bool)

(assert (=> b!102290 m!148993))

(push 1)

(assert (not start!20350))

(assert (not b!102282))

(assert (not b!102290))

(assert (not b!102284))

(assert (not b!102287))

(assert (not b!102286))

(assert (not b!102289))

(assert (not b!102288))

(assert (not b!102293))

(assert (not b!102292))

(assert (not b!102291))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

