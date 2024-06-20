; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23226 () Bool)

(assert start!23226)

(declare-fun b!117991 () Bool)

(declare-fun res!97633 () Bool)

(declare-fun e!77353 () Bool)

(assert (=> b!117991 (=> (not res!97633) (not e!77353))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!117991 (= res!97633 (bvslt i!615 nBits!396))))

(declare-fun b!117992 () Bool)

(declare-fun e!77352 () Bool)

(declare-fun e!77354 () Bool)

(assert (=> b!117992 (= e!77352 e!77354)))

(declare-fun res!97637 () Bool)

(assert (=> b!117992 (=> (not res!97637) (not e!77354))))

(declare-fun lt!181075 () (_ BitVec 64))

(declare-fun lt!181078 () (_ BitVec 64))

(assert (=> b!117992 (= res!97637 (= lt!181075 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!181078)))))

(declare-datatypes ((array!5304 0))(
  ( (array!5305 (arr!2999 (Array (_ BitVec 32) (_ BitVec 8))) (size!2406 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4286 0))(
  ( (BitStream!4287 (buf!2822 array!5304) (currentByte!5471 (_ BitVec 32)) (currentBit!5466 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!7259 0))(
  ( (Unit!7260) )
))
(declare-datatypes ((tuple2!9872 0))(
  ( (tuple2!9873 (_1!5201 Unit!7259) (_2!5201 BitStream!4286)) )
))
(declare-fun lt!181091 () tuple2!9872)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!117992 (= lt!181075 (bitIndex!0 (size!2406 (buf!2822 (_2!5201 lt!181091))) (currentByte!5471 (_2!5201 lt!181091)) (currentBit!5466 (_2!5201 lt!181091))))))

(declare-fun thiss!1305 () BitStream!4286)

(assert (=> b!117992 (= lt!181078 (bitIndex!0 (size!2406 (buf!2822 thiss!1305)) (currentByte!5471 thiss!1305) (currentBit!5466 thiss!1305)))))

(declare-fun b!117993 () Bool)

(declare-fun e!77355 () Bool)

(assert (=> b!117993 (= e!77355 e!77353)))

(declare-fun res!97627 () Bool)

(assert (=> b!117993 (=> (not res!97627) (not e!77353))))

(declare-fun lt!181089 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!117993 (= res!97627 (validate_offset_bits!1 ((_ sign_extend 32) (size!2406 (buf!2822 thiss!1305))) ((_ sign_extend 32) (currentByte!5471 thiss!1305)) ((_ sign_extend 32) (currentBit!5466 thiss!1305)) lt!181089))))

(assert (=> b!117993 (= lt!181089 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!117994 () Bool)

(declare-fun e!77361 () Bool)

(declare-datatypes ((tuple2!9874 0))(
  ( (tuple2!9875 (_1!5202 BitStream!4286) (_2!5202 Bool)) )
))
(declare-fun lt!181080 () tuple2!9874)

(assert (=> b!117994 (= e!77361 (= (bitIndex!0 (size!2406 (buf!2822 (_1!5202 lt!181080))) (currentByte!5471 (_1!5202 lt!181080)) (currentBit!5466 (_1!5202 lt!181080))) lt!181075))))

(declare-fun b!117995 () Bool)

(declare-fun e!77360 () Bool)

(declare-fun array_inv!2208 (array!5304) Bool)

(assert (=> b!117995 (= e!77360 (array_inv!2208 (buf!2822 thiss!1305)))))

(declare-fun b!117996 () Bool)

(declare-fun res!97629 () Bool)

(declare-fun e!77358 () Bool)

(assert (=> b!117996 (=> (not res!97629) (not e!77358))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!117996 (= res!97629 (invariant!0 (currentBit!5466 thiss!1305) (currentByte!5471 thiss!1305) (size!2406 (buf!2822 (_2!5201 lt!181091)))))))

(declare-fun b!117997 () Bool)

(declare-fun e!77357 () Bool)

(assert (=> b!117997 (= e!77353 (not e!77357))))

(declare-fun res!97631 () Bool)

(assert (=> b!117997 (=> res!97631 e!77357)))

(declare-fun lt!181088 () (_ BitVec 64))

(declare-fun lt!181072 () (_ BitVec 64))

(declare-datatypes ((tuple2!9876 0))(
  ( (tuple2!9877 (_1!5203 BitStream!4286) (_2!5203 BitStream!4286)) )
))
(declare-fun lt!181086 () tuple2!9876)

(declare-fun lt!181084 () tuple2!9874)

(declare-datatypes ((tuple2!9878 0))(
  ( (tuple2!9879 (_1!5204 BitStream!4286) (_2!5204 (_ BitVec 64))) )
))
(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4286 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9878)

(assert (=> b!117997 (= res!97631 (not (= (_1!5204 (readNLeastSignificantBitsLoopPure!0 (_1!5203 lt!181086) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) (bvor lt!181088 (ite (_2!5202 lt!181084) lt!181072 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5203 lt!181086))))))

(declare-fun lt!181082 () tuple2!9872)

(declare-fun lt!181092 () (_ BitVec 64))

(assert (=> b!117997 (validate_offset_bits!1 ((_ sign_extend 32) (size!2406 (buf!2822 (_2!5201 lt!181082)))) ((_ sign_extend 32) (currentByte!5471 (_2!5201 lt!181091))) ((_ sign_extend 32) (currentBit!5466 (_2!5201 lt!181091))) lt!181092)))

(declare-fun lt!181085 () Unit!7259)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4286 array!5304 (_ BitVec 64)) Unit!7259)

(assert (=> b!117997 (= lt!181085 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5201 lt!181091) (buf!2822 (_2!5201 lt!181082)) lt!181092))))

(assert (=> b!117997 (= lt!181092 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!181083 () tuple2!9876)

(declare-fun lt!181076 () tuple2!9878)

(assert (=> b!117997 (= lt!181076 (readNLeastSignificantBitsLoopPure!0 (_1!5203 lt!181083) nBits!396 i!615 lt!181088))))

(assert (=> b!117997 (validate_offset_bits!1 ((_ sign_extend 32) (size!2406 (buf!2822 (_2!5201 lt!181082)))) ((_ sign_extend 32) (currentByte!5471 thiss!1305)) ((_ sign_extend 32) (currentBit!5466 thiss!1305)) lt!181089)))

(declare-fun lt!181073 () Unit!7259)

(assert (=> b!117997 (= lt!181073 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2822 (_2!5201 lt!181082)) lt!181089))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!117997 (= lt!181088 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!181090 () Bool)

(assert (=> b!117997 (= (_2!5202 lt!181084) lt!181090)))

(declare-fun readBitPure!0 (BitStream!4286) tuple2!9874)

(assert (=> b!117997 (= lt!181084 (readBitPure!0 (_1!5203 lt!181083)))))

(declare-fun reader!0 (BitStream!4286 BitStream!4286) tuple2!9876)

(assert (=> b!117997 (= lt!181086 (reader!0 (_2!5201 lt!181091) (_2!5201 lt!181082)))))

(assert (=> b!117997 (= lt!181083 (reader!0 thiss!1305 (_2!5201 lt!181082)))))

(declare-fun e!77356 () Bool)

(assert (=> b!117997 e!77356))

(declare-fun res!97636 () Bool)

(assert (=> b!117997 (=> (not res!97636) (not e!77356))))

(declare-fun lt!181087 () tuple2!9874)

(declare-fun lt!181079 () tuple2!9874)

(assert (=> b!117997 (= res!97636 (= (bitIndex!0 (size!2406 (buf!2822 (_1!5202 lt!181087))) (currentByte!5471 (_1!5202 lt!181087)) (currentBit!5466 (_1!5202 lt!181087))) (bitIndex!0 (size!2406 (buf!2822 (_1!5202 lt!181079))) (currentByte!5471 (_1!5202 lt!181079)) (currentBit!5466 (_1!5202 lt!181079)))))))

(declare-fun lt!181077 () Unit!7259)

(declare-fun lt!181074 () BitStream!4286)

(declare-fun readBitPrefixLemma!0 (BitStream!4286 BitStream!4286) Unit!7259)

(assert (=> b!117997 (= lt!181077 (readBitPrefixLemma!0 lt!181074 (_2!5201 lt!181082)))))

(assert (=> b!117997 (= lt!181079 (readBitPure!0 (BitStream!4287 (buf!2822 (_2!5201 lt!181082)) (currentByte!5471 thiss!1305) (currentBit!5466 thiss!1305))))))

(assert (=> b!117997 (= lt!181087 (readBitPure!0 lt!181074))))

(assert (=> b!117997 (= lt!181074 (BitStream!4287 (buf!2822 (_2!5201 lt!181091)) (currentByte!5471 thiss!1305) (currentBit!5466 thiss!1305)))))

(assert (=> b!117997 e!77358))

(declare-fun res!97632 () Bool)

(assert (=> b!117997 (=> (not res!97632) (not e!77358))))

(declare-fun isPrefixOf!0 (BitStream!4286 BitStream!4286) Bool)

(assert (=> b!117997 (= res!97632 (isPrefixOf!0 thiss!1305 (_2!5201 lt!181082)))))

(declare-fun lt!181081 () Unit!7259)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4286 BitStream!4286 BitStream!4286) Unit!7259)

(assert (=> b!117997 (= lt!181081 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5201 lt!181091) (_2!5201 lt!181082)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4286 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9872)

(assert (=> b!117997 (= lt!181082 (appendNLeastSignificantBitsLoop!0 (_2!5201 lt!181091) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!117997 e!77352))

(declare-fun res!97634 () Bool)

(assert (=> b!117997 (=> (not res!97634) (not e!77352))))

(assert (=> b!117997 (= res!97634 (= (size!2406 (buf!2822 thiss!1305)) (size!2406 (buf!2822 (_2!5201 lt!181091)))))))

(declare-fun appendBit!0 (BitStream!4286 Bool) tuple2!9872)

(assert (=> b!117997 (= lt!181091 (appendBit!0 thiss!1305 lt!181090))))

(assert (=> b!117997 (= lt!181090 (not (= (bvand v!199 lt!181072) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!117997 (= lt!181072 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!117998 () Bool)

(declare-fun res!97630 () Bool)

(assert (=> b!117998 (=> (not res!97630) (not e!77354))))

(assert (=> b!117998 (= res!97630 (isPrefixOf!0 thiss!1305 (_2!5201 lt!181091)))))

(declare-fun res!97638 () Bool)

(assert (=> start!23226 (=> (not res!97638) (not e!77355))))

(assert (=> start!23226 (= res!97638 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23226 e!77355))

(assert (=> start!23226 true))

(declare-fun inv!12 (BitStream!4286) Bool)

(assert (=> start!23226 (and (inv!12 thiss!1305) e!77360)))

(declare-fun b!117999 () Bool)

(declare-fun res!97628 () Bool)

(assert (=> b!117999 (=> (not res!97628) (not e!77353))))

(assert (=> b!117999 (= res!97628 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!118000 () Bool)

(assert (=> b!118000 (= e!77357 (validate_offset_bits!1 ((_ sign_extend 32) (size!2406 (buf!2822 (_1!5203 lt!181083)))) ((_ sign_extend 32) (currentByte!5471 (_1!5203 lt!181083))) ((_ sign_extend 32) (currentBit!5466 (_1!5203 lt!181083))) lt!181089))))

(declare-fun b!118001 () Bool)

(assert (=> b!118001 (= e!77356 (= (_2!5202 lt!181087) (_2!5202 lt!181079)))))

(declare-fun b!118002 () Bool)

(assert (=> b!118002 (= e!77354 e!77361)))

(declare-fun res!97635 () Bool)

(assert (=> b!118002 (=> (not res!97635) (not e!77361))))

(assert (=> b!118002 (= res!97635 (and (= (_2!5202 lt!181080) lt!181090) (= (_1!5202 lt!181080) (_2!5201 lt!181091))))))

(declare-fun readerFrom!0 (BitStream!4286 (_ BitVec 32) (_ BitVec 32)) BitStream!4286)

(assert (=> b!118002 (= lt!181080 (readBitPure!0 (readerFrom!0 (_2!5201 lt!181091) (currentBit!5466 thiss!1305) (currentByte!5471 thiss!1305))))))

(declare-fun b!118003 () Bool)

(assert (=> b!118003 (= e!77358 (invariant!0 (currentBit!5466 thiss!1305) (currentByte!5471 thiss!1305) (size!2406 (buf!2822 (_2!5201 lt!181082)))))))

(assert (= (and start!23226 res!97638) b!117993))

(assert (= (and b!117993 res!97627) b!117999))

(assert (= (and b!117999 res!97628) b!117991))

(assert (= (and b!117991 res!97633) b!117997))

(assert (= (and b!117997 res!97634) b!117992))

(assert (= (and b!117992 res!97637) b!117998))

(assert (= (and b!117998 res!97630) b!118002))

(assert (= (and b!118002 res!97635) b!117994))

(assert (= (and b!117997 res!97632) b!117996))

(assert (= (and b!117996 res!97629) b!118003))

(assert (= (and b!117997 res!97636) b!118001))

(assert (= (and b!117997 (not res!97631)) b!118000))

(assert (= start!23226 b!117995))

(declare-fun m!177067 () Bool)

(assert (=> b!117994 m!177067))

(declare-fun m!177069 () Bool)

(assert (=> b!118003 m!177069))

(declare-fun m!177071 () Bool)

(assert (=> start!23226 m!177071))

(declare-fun m!177073 () Bool)

(assert (=> b!117995 m!177073))

(declare-fun m!177075 () Bool)

(assert (=> b!117996 m!177075))

(declare-fun m!177077 () Bool)

(assert (=> b!117993 m!177077))

(declare-fun m!177079 () Bool)

(assert (=> b!118000 m!177079))

(declare-fun m!177081 () Bool)

(assert (=> b!118002 m!177081))

(assert (=> b!118002 m!177081))

(declare-fun m!177083 () Bool)

(assert (=> b!118002 m!177083))

(declare-fun m!177085 () Bool)

(assert (=> b!117999 m!177085))

(declare-fun m!177087 () Bool)

(assert (=> b!117998 m!177087))

(declare-fun m!177089 () Bool)

(assert (=> b!117992 m!177089))

(declare-fun m!177091 () Bool)

(assert (=> b!117992 m!177091))

(declare-fun m!177093 () Bool)

(assert (=> b!117997 m!177093))

(declare-fun m!177095 () Bool)

(assert (=> b!117997 m!177095))

(declare-fun m!177097 () Bool)

(assert (=> b!117997 m!177097))

(declare-fun m!177099 () Bool)

(assert (=> b!117997 m!177099))

(declare-fun m!177101 () Bool)

(assert (=> b!117997 m!177101))

(declare-fun m!177103 () Bool)

(assert (=> b!117997 m!177103))

(declare-fun m!177105 () Bool)

(assert (=> b!117997 m!177105))

(declare-fun m!177107 () Bool)

(assert (=> b!117997 m!177107))

(declare-fun m!177109 () Bool)

(assert (=> b!117997 m!177109))

(declare-fun m!177111 () Bool)

(assert (=> b!117997 m!177111))

(declare-fun m!177113 () Bool)

(assert (=> b!117997 m!177113))

(declare-fun m!177115 () Bool)

(assert (=> b!117997 m!177115))

(declare-fun m!177117 () Bool)

(assert (=> b!117997 m!177117))

(declare-fun m!177119 () Bool)

(assert (=> b!117997 m!177119))

(declare-fun m!177121 () Bool)

(assert (=> b!117997 m!177121))

(declare-fun m!177123 () Bool)

(assert (=> b!117997 m!177123))

(declare-fun m!177125 () Bool)

(assert (=> b!117997 m!177125))

(declare-fun m!177127 () Bool)

(assert (=> b!117997 m!177127))

(declare-fun m!177129 () Bool)

(assert (=> b!117997 m!177129))

(push 1)

(assert (not b!117999))

(assert (not b!117995))

(assert (not b!117997))

(assert (not b!117993))

(assert (not b!118000))

(assert (not b!118003))

(assert (not b!117998))

(assert (not b!117996))

(assert (not b!117994))

(assert (not b!117992))

(assert (not b!118002))

(assert (not start!23226))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!37744 () Bool)

(assert (=> d!37744 (= (invariant!0 (currentBit!5466 thiss!1305) (currentByte!5471 thiss!1305) (size!2406 (buf!2822 (_2!5201 lt!181082)))) (and (bvsge (currentBit!5466 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5466 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5471 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5471 thiss!1305) (size!2406 (buf!2822 (_2!5201 lt!181082)))) (and (= (currentBit!5466 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5471 thiss!1305) (size!2406 (buf!2822 (_2!5201 lt!181082))))))))))

(assert (=> b!118003 d!37744))

(declare-fun d!37746 () Bool)

(declare-fun e!77387 () Bool)

(assert (=> d!37746 e!77387))

(declare-fun res!97678 () Bool)

(assert (=> d!37746 (=> (not res!97678) (not e!77387))))

(declare-fun lt!181224 () (_ BitVec 64))

(declare-fun lt!181221 () (_ BitVec 64))

(declare-fun lt!181222 () (_ BitVec 64))

(assert (=> d!37746 (= res!97678 (= lt!181224 (bvsub lt!181221 lt!181222)))))

(assert (=> d!37746 (or (= (bvand lt!181221 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!181222 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!181221 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!181221 lt!181222) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!37746 (= lt!181222 (remainingBits!0 ((_ sign_extend 32) (size!2406 (buf!2822 (_2!5201 lt!181091)))) ((_ sign_extend 32) (currentByte!5471 (_2!5201 lt!181091))) ((_ sign_extend 32) (currentBit!5466 (_2!5201 lt!181091)))))))

(declare-fun lt!181226 () (_ BitVec 64))

(declare-fun lt!181225 () (_ BitVec 64))

(assert (=> d!37746 (= lt!181221 (bvmul lt!181226 lt!181225))))

(assert (=> d!37746 (or (= lt!181226 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!181225 (bvsdiv (bvmul lt!181226 lt!181225) lt!181226)))))

(assert (=> d!37746 (= lt!181225 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37746 (= lt!181226 ((_ sign_extend 32) (size!2406 (buf!2822 (_2!5201 lt!181091)))))))

(assert (=> d!37746 (= lt!181224 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5471 (_2!5201 lt!181091))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5466 (_2!5201 lt!181091)))))))

(assert (=> d!37746 (invariant!0 (currentBit!5466 (_2!5201 lt!181091)) (currentByte!5471 (_2!5201 lt!181091)) (size!2406 (buf!2822 (_2!5201 lt!181091))))))

(assert (=> d!37746 (= (bitIndex!0 (size!2406 (buf!2822 (_2!5201 lt!181091))) (currentByte!5471 (_2!5201 lt!181091)) (currentBit!5466 (_2!5201 lt!181091))) lt!181224)))

(declare-fun b!118048 () Bool)

(declare-fun res!97679 () Bool)

(assert (=> b!118048 (=> (not res!97679) (not e!77387))))

(assert (=> b!118048 (= res!97679 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!181224))))

(declare-fun b!118049 () Bool)

(declare-fun lt!181223 () (_ BitVec 64))

(assert (=> b!118049 (= e!77387 (bvsle lt!181224 (bvmul lt!181223 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!118049 (or (= lt!181223 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!181223 #b0000000000000000000000000000000000000000000000000000000000001000) lt!181223)))))

(assert (=> b!118049 (= lt!181223 ((_ sign_extend 32) (size!2406 (buf!2822 (_2!5201 lt!181091)))))))

(assert (= (and d!37746 res!97678) b!118048))

(assert (= (and b!118048 res!97679) b!118049))

(declare-fun m!177201 () Bool)

(assert (=> d!37746 m!177201))

(declare-fun m!177203 () Bool)

(assert (=> d!37746 m!177203))

(assert (=> b!117992 d!37746))

(declare-fun d!37750 () Bool)

(declare-fun e!77388 () Bool)

(assert (=> d!37750 e!77388))

(declare-fun res!97680 () Bool)

(assert (=> d!37750 (=> (not res!97680) (not e!77388))))

(declare-fun lt!181230 () (_ BitVec 64))

(declare-fun lt!181228 () (_ BitVec 64))

(declare-fun lt!181227 () (_ BitVec 64))

(assert (=> d!37750 (= res!97680 (= lt!181230 (bvsub lt!181227 lt!181228)))))

(assert (=> d!37750 (or (= (bvand lt!181227 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!181228 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!181227 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!181227 lt!181228) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37750 (= lt!181228 (remainingBits!0 ((_ sign_extend 32) (size!2406 (buf!2822 thiss!1305))) ((_ sign_extend 32) (currentByte!5471 thiss!1305)) ((_ sign_extend 32) (currentBit!5466 thiss!1305))))))

(declare-fun lt!181232 () (_ BitVec 64))

(declare-fun lt!181231 () (_ BitVec 64))

(assert (=> d!37750 (= lt!181227 (bvmul lt!181232 lt!181231))))

(assert (=> d!37750 (or (= lt!181232 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!181231 (bvsdiv (bvmul lt!181232 lt!181231) lt!181232)))))

(assert (=> d!37750 (= lt!181231 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37750 (= lt!181232 ((_ sign_extend 32) (size!2406 (buf!2822 thiss!1305))))))

(assert (=> d!37750 (= lt!181230 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5471 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5466 thiss!1305))))))

(assert (=> d!37750 (invariant!0 (currentBit!5466 thiss!1305) (currentByte!5471 thiss!1305) (size!2406 (buf!2822 thiss!1305)))))

(assert (=> d!37750 (= (bitIndex!0 (size!2406 (buf!2822 thiss!1305)) (currentByte!5471 thiss!1305) (currentBit!5466 thiss!1305)) lt!181230)))

(declare-fun b!118050 () Bool)

(declare-fun res!97681 () Bool)

(assert (=> b!118050 (=> (not res!97681) (not e!77388))))

(assert (=> b!118050 (= res!97681 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!181230))))

(declare-fun b!118051 () Bool)

(declare-fun lt!181229 () (_ BitVec 64))

(assert (=> b!118051 (= e!77388 (bvsle lt!181230 (bvmul lt!181229 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!118051 (or (= lt!181229 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!181229 #b0000000000000000000000000000000000000000000000000000000000001000) lt!181229)))))

(assert (=> b!118051 (= lt!181229 ((_ sign_extend 32) (size!2406 (buf!2822 thiss!1305))))))

(assert (= (and d!37750 res!97680) b!118050))

(assert (= (and b!118050 res!97681) b!118051))

(declare-fun m!177205 () Bool)

(assert (=> d!37750 m!177205))

(declare-fun m!177207 () Bool)

(assert (=> d!37750 m!177207))

(assert (=> b!117992 d!37750))

(declare-fun d!37752 () Bool)

(declare-datatypes ((tuple2!9886 0))(
  ( (tuple2!9887 (_1!5208 Bool) (_2!5208 BitStream!4286)) )
))
(declare-fun lt!181238 () tuple2!9886)

(declare-fun readBit!0 (BitStream!4286) tuple2!9886)

(assert (=> d!37752 (= lt!181238 (readBit!0 (readerFrom!0 (_2!5201 lt!181091) (currentBit!5466 thiss!1305) (currentByte!5471 thiss!1305))))))

(assert (=> d!37752 (= (readBitPure!0 (readerFrom!0 (_2!5201 lt!181091) (currentBit!5466 thiss!1305) (currentByte!5471 thiss!1305))) (tuple2!9875 (_2!5208 lt!181238) (_1!5208 lt!181238)))))

(declare-fun bs!9134 () Bool)

(assert (= bs!9134 d!37752))

(assert (=> bs!9134 m!177081))

(declare-fun m!177211 () Bool)

(assert (=> bs!9134 m!177211))

(assert (=> b!118002 d!37752))

(declare-fun d!37756 () Bool)

(declare-fun e!77394 () Bool)

(assert (=> d!37756 e!77394))

(declare-fun res!97689 () Bool)

(assert (=> d!37756 (=> (not res!97689) (not e!77394))))

(assert (=> d!37756 (= res!97689 (invariant!0 (currentBit!5466 (_2!5201 lt!181091)) (currentByte!5471 (_2!5201 lt!181091)) (size!2406 (buf!2822 (_2!5201 lt!181091)))))))

(assert (=> d!37756 (= (readerFrom!0 (_2!5201 lt!181091) (currentBit!5466 thiss!1305) (currentByte!5471 thiss!1305)) (BitStream!4287 (buf!2822 (_2!5201 lt!181091)) (currentByte!5471 thiss!1305) (currentBit!5466 thiss!1305)))))

(declare-fun b!118057 () Bool)

(assert (=> b!118057 (= e!77394 (invariant!0 (currentBit!5466 thiss!1305) (currentByte!5471 thiss!1305) (size!2406 (buf!2822 (_2!5201 lt!181091)))))))

(assert (= (and d!37756 res!97689) b!118057))

(assert (=> d!37756 m!177203))

(assert (=> b!118057 m!177075))

(assert (=> b!118002 d!37756))

(declare-fun d!37762 () Bool)

(assert (=> d!37762 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2406 (buf!2822 thiss!1305))) ((_ sign_extend 32) (currentByte!5471 thiss!1305)) ((_ sign_extend 32) (currentBit!5466 thiss!1305)) lt!181089) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2406 (buf!2822 thiss!1305))) ((_ sign_extend 32) (currentByte!5471 thiss!1305)) ((_ sign_extend 32) (currentBit!5466 thiss!1305))) lt!181089))))

(declare-fun bs!9136 () Bool)

(assert (= bs!9136 d!37762))

(assert (=> bs!9136 m!177205))

(assert (=> b!117993 d!37762))

(declare-fun d!37764 () Bool)

(assert (=> d!37764 (= (array_inv!2208 (buf!2822 thiss!1305)) (bvsge (size!2406 (buf!2822 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!117995 d!37764))

(declare-fun d!37766 () Bool)

(declare-fun e!77397 () Bool)

(assert (=> d!37766 e!77397))

(declare-fun res!97694 () Bool)

(assert (=> d!37766 (=> (not res!97694) (not e!77397))))

(declare-fun lt!181242 () (_ BitVec 64))

(declare-fun lt!181240 () (_ BitVec 64))

(declare-fun lt!181239 () (_ BitVec 64))

(assert (=> d!37766 (= res!97694 (= lt!181242 (bvsub lt!181239 lt!181240)))))

(assert (=> d!37766 (or (= (bvand lt!181239 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!181240 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!181239 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!181239 lt!181240) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37766 (= lt!181240 (remainingBits!0 ((_ sign_extend 32) (size!2406 (buf!2822 (_1!5202 lt!181080)))) ((_ sign_extend 32) (currentByte!5471 (_1!5202 lt!181080))) ((_ sign_extend 32) (currentBit!5466 (_1!5202 lt!181080)))))))

(declare-fun lt!181244 () (_ BitVec 64))

(declare-fun lt!181243 () (_ BitVec 64))

(assert (=> d!37766 (= lt!181239 (bvmul lt!181244 lt!181243))))

(assert (=> d!37766 (or (= lt!181244 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!181243 (bvsdiv (bvmul lt!181244 lt!181243) lt!181244)))))

(assert (=> d!37766 (= lt!181243 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37766 (= lt!181244 ((_ sign_extend 32) (size!2406 (buf!2822 (_1!5202 lt!181080)))))))

(assert (=> d!37766 (= lt!181242 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5471 (_1!5202 lt!181080))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5466 (_1!5202 lt!181080)))))))

(assert (=> d!37766 (invariant!0 (currentBit!5466 (_1!5202 lt!181080)) (currentByte!5471 (_1!5202 lt!181080)) (size!2406 (buf!2822 (_1!5202 lt!181080))))))

(assert (=> d!37766 (= (bitIndex!0 (size!2406 (buf!2822 (_1!5202 lt!181080))) (currentByte!5471 (_1!5202 lt!181080)) (currentBit!5466 (_1!5202 lt!181080))) lt!181242)))

(declare-fun b!118062 () Bool)

(declare-fun res!97695 () Bool)

(assert (=> b!118062 (=> (not res!97695) (not e!77397))))

(assert (=> b!118062 (= res!97695 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!181242))))

(declare-fun b!118063 () Bool)

(declare-fun lt!181241 () (_ BitVec 64))

(assert (=> b!118063 (= e!77397 (bvsle lt!181242 (bvmul lt!181241 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!118063 (or (= lt!181241 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!181241 #b0000000000000000000000000000000000000000000000000000000000001000) lt!181241)))))

(assert (=> b!118063 (= lt!181241 ((_ sign_extend 32) (size!2406 (buf!2822 (_1!5202 lt!181080)))))))

(assert (= (and d!37766 res!97694) b!118062))

(assert (= (and b!118062 res!97695) b!118063))

(declare-fun m!177217 () Bool)

(assert (=> d!37766 m!177217))

(declare-fun m!177219 () Bool)

(assert (=> d!37766 m!177219))

(assert (=> b!117994 d!37766))

(declare-fun d!37768 () Bool)

(assert (=> d!37768 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5466 thiss!1305) (currentByte!5471 thiss!1305) (size!2406 (buf!2822 thiss!1305))))))

(declare-fun bs!9137 () Bool)

(assert (= bs!9137 d!37768))

(assert (=> bs!9137 m!177207))

(assert (=> start!23226 d!37768))

(declare-fun d!37770 () Bool)

(assert (=> d!37770 (= (invariant!0 (currentBit!5466 thiss!1305) (currentByte!5471 thiss!1305) (size!2406 (buf!2822 (_2!5201 lt!181091)))) (and (bvsge (currentBit!5466 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5466 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5471 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5471 thiss!1305) (size!2406 (buf!2822 (_2!5201 lt!181091)))) (and (= (currentBit!5466 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5471 thiss!1305) (size!2406 (buf!2822 (_2!5201 lt!181091))))))))))

(assert (=> b!117996 d!37770))

(declare-datatypes ((tuple2!9890 0))(
  ( (tuple2!9891 (_1!5210 (_ BitVec 64)) (_2!5210 BitStream!4286)) )
))
(declare-fun lt!181247 () tuple2!9890)

(declare-fun d!37772 () Bool)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4286 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9890)

(assert (=> d!37772 (= lt!181247 (readNLeastSignificantBitsLoop!0 (_1!5203 lt!181086) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) (bvor lt!181088 (ite (_2!5202 lt!181084) lt!181072 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!37772 (= (readNLeastSignificantBitsLoopPure!0 (_1!5203 lt!181086) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) (bvor lt!181088 (ite (_2!5202 lt!181084) lt!181072 #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!9879 (_2!5210 lt!181247) (_1!5210 lt!181247)))))

(declare-fun bs!9138 () Bool)

(assert (= bs!9138 d!37772))

(declare-fun m!177223 () Bool)

(assert (=> bs!9138 m!177223))

(assert (=> b!117997 d!37772))

(declare-fun d!37776 () Bool)

(declare-fun res!97708 () Bool)

(declare-fun e!77406 () Bool)

(assert (=> d!37776 (=> (not res!97708) (not e!77406))))

(assert (=> d!37776 (= res!97708 (= (size!2406 (buf!2822 thiss!1305)) (size!2406 (buf!2822 (_2!5201 lt!181082)))))))

(assert (=> d!37776 (= (isPrefixOf!0 thiss!1305 (_2!5201 lt!181082)) e!77406)))

(declare-fun b!118075 () Bool)

(declare-fun res!97709 () Bool)

(assert (=> b!118075 (=> (not res!97709) (not e!77406))))

(assert (=> b!118075 (= res!97709 (bvsle (bitIndex!0 (size!2406 (buf!2822 thiss!1305)) (currentByte!5471 thiss!1305) (currentBit!5466 thiss!1305)) (bitIndex!0 (size!2406 (buf!2822 (_2!5201 lt!181082))) (currentByte!5471 (_2!5201 lt!181082)) (currentBit!5466 (_2!5201 lt!181082)))))))

(declare-fun b!118076 () Bool)

(declare-fun e!77407 () Bool)

(assert (=> b!118076 (= e!77406 e!77407)))

(declare-fun res!97707 () Bool)

(assert (=> b!118076 (=> res!97707 e!77407)))

(assert (=> b!118076 (= res!97707 (= (size!2406 (buf!2822 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!118077 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5304 array!5304 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!118077 (= e!77407 (arrayBitRangesEq!0 (buf!2822 thiss!1305) (buf!2822 (_2!5201 lt!181082)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2406 (buf!2822 thiss!1305)) (currentByte!5471 thiss!1305) (currentBit!5466 thiss!1305))))))

(assert (= (and d!37776 res!97708) b!118075))

(assert (= (and b!118075 res!97709) b!118076))

(assert (= (and b!118076 (not res!97707)) b!118077))

(assert (=> b!118075 m!177091))

(declare-fun m!177225 () Bool)

(assert (=> b!118075 m!177225))

(assert (=> b!118077 m!177091))

(assert (=> b!118077 m!177091))

(declare-fun m!177227 () Bool)

(assert (=> b!118077 m!177227))

(assert (=> b!117997 d!37776))

(declare-fun b!118100 () Bool)

(declare-fun e!77418 () Bool)

(declare-fun lt!181290 () tuple2!9874)

(declare-fun lt!181291 () tuple2!9872)

(assert (=> b!118100 (= e!77418 (= (bitIndex!0 (size!2406 (buf!2822 (_1!5202 lt!181290))) (currentByte!5471 (_1!5202 lt!181290)) (currentBit!5466 (_1!5202 lt!181290))) (bitIndex!0 (size!2406 (buf!2822 (_2!5201 lt!181291))) (currentByte!5471 (_2!5201 lt!181291)) (currentBit!5466 (_2!5201 lt!181291)))))))

(declare-fun b!118099 () Bool)

(declare-fun e!77417 () Bool)

(assert (=> b!118099 (= e!77417 e!77418)))

(declare-fun res!97729 () Bool)

(assert (=> b!118099 (=> (not res!97729) (not e!77418))))

(assert (=> b!118099 (= res!97729 (and (= (_2!5202 lt!181290) lt!181090) (= (_1!5202 lt!181290) (_2!5201 lt!181291))))))

(assert (=> b!118099 (= lt!181290 (readBitPure!0 (readerFrom!0 (_2!5201 lt!181291) (currentBit!5466 thiss!1305) (currentByte!5471 thiss!1305))))))

(declare-fun d!37778 () Bool)

(assert (=> d!37778 e!77417))

(declare-fun res!97728 () Bool)

(assert (=> d!37778 (=> (not res!97728) (not e!77417))))

(assert (=> d!37778 (= res!97728 (= (size!2406 (buf!2822 thiss!1305)) (size!2406 (buf!2822 (_2!5201 lt!181291)))))))

(declare-fun choose!16 (BitStream!4286 Bool) tuple2!9872)

(assert (=> d!37778 (= lt!181291 (choose!16 thiss!1305 lt!181090))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!37778 (validate_offset_bit!0 ((_ sign_extend 32) (size!2406 (buf!2822 thiss!1305))) ((_ sign_extend 32) (currentByte!5471 thiss!1305)) ((_ sign_extend 32) (currentBit!5466 thiss!1305)))))

(assert (=> d!37778 (= (appendBit!0 thiss!1305 lt!181090) lt!181291)))

(declare-fun b!118098 () Bool)

(declare-fun res!97730 () Bool)

(assert (=> b!118098 (=> (not res!97730) (not e!77417))))

(assert (=> b!118098 (= res!97730 (isPrefixOf!0 thiss!1305 (_2!5201 lt!181291)))))

(declare-fun b!118097 () Bool)

(declare-fun res!97731 () Bool)

(assert (=> b!118097 (=> (not res!97731) (not e!77417))))

(declare-fun lt!181293 () (_ BitVec 64))

(declare-fun lt!181292 () (_ BitVec 64))

(assert (=> b!118097 (= res!97731 (= (bitIndex!0 (size!2406 (buf!2822 (_2!5201 lt!181291))) (currentByte!5471 (_2!5201 lt!181291)) (currentBit!5466 (_2!5201 lt!181291))) (bvadd lt!181293 lt!181292)))))

(assert (=> b!118097 (or (not (= (bvand lt!181293 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!181292 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!181293 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!181293 lt!181292) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118097 (= lt!181292 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!118097 (= lt!181293 (bitIndex!0 (size!2406 (buf!2822 thiss!1305)) (currentByte!5471 thiss!1305) (currentBit!5466 thiss!1305)))))

(assert (= (and d!37778 res!97728) b!118097))

(assert (= (and b!118097 res!97731) b!118098))

(assert (= (and b!118098 res!97730) b!118099))

(assert (= (and b!118099 res!97729) b!118100))

(declare-fun m!177241 () Bool)

(assert (=> b!118100 m!177241))

(declare-fun m!177243 () Bool)

(assert (=> b!118100 m!177243))

(assert (=> b!118097 m!177243))

(assert (=> b!118097 m!177091))

(declare-fun m!177245 () Bool)

(assert (=> b!118099 m!177245))

(assert (=> b!118099 m!177245))

(declare-fun m!177247 () Bool)

(assert (=> b!118099 m!177247))

(declare-fun m!177249 () Bool)

(assert (=> d!37778 m!177249))

(declare-fun m!177251 () Bool)

(assert (=> d!37778 m!177251))

(declare-fun m!177253 () Bool)

(assert (=> b!118098 m!177253))

(assert (=> b!117997 d!37778))

(declare-fun d!37794 () Bool)

(declare-fun lt!181294 () tuple2!9886)

(assert (=> d!37794 (= lt!181294 (readBit!0 lt!181074))))

(assert (=> d!37794 (= (readBitPure!0 lt!181074) (tuple2!9875 (_2!5208 lt!181294) (_1!5208 lt!181294)))))

(declare-fun bs!9141 () Bool)

(assert (= bs!9141 d!37794))

(declare-fun m!177255 () Bool)

(assert (=> bs!9141 m!177255))

(assert (=> b!117997 d!37794))

(declare-fun d!37796 () Bool)

(assert (=> d!37796 (validate_offset_bits!1 ((_ sign_extend 32) (size!2406 (buf!2822 (_2!5201 lt!181082)))) ((_ sign_extend 32) (currentByte!5471 (_2!5201 lt!181091))) ((_ sign_extend 32) (currentBit!5466 (_2!5201 lt!181091))) lt!181092)))

(declare-fun lt!181297 () Unit!7259)

(declare-fun choose!9 (BitStream!4286 array!5304 (_ BitVec 64) BitStream!4286) Unit!7259)

(assert (=> d!37796 (= lt!181297 (choose!9 (_2!5201 lt!181091) (buf!2822 (_2!5201 lt!181082)) lt!181092 (BitStream!4287 (buf!2822 (_2!5201 lt!181082)) (currentByte!5471 (_2!5201 lt!181091)) (currentBit!5466 (_2!5201 lt!181091)))))))

(assert (=> d!37796 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5201 lt!181091) (buf!2822 (_2!5201 lt!181082)) lt!181092) lt!181297)))

(declare-fun bs!9142 () Bool)

(assert (= bs!9142 d!37796))

(assert (=> bs!9142 m!177127))

(declare-fun m!177257 () Bool)

(assert (=> bs!9142 m!177257))

(assert (=> b!117997 d!37796))

(declare-fun d!37798 () Bool)

(assert (=> d!37798 (validate_offset_bits!1 ((_ sign_extend 32) (size!2406 (buf!2822 (_2!5201 lt!181082)))) ((_ sign_extend 32) (currentByte!5471 thiss!1305)) ((_ sign_extend 32) (currentBit!5466 thiss!1305)) lt!181089)))

(declare-fun lt!181300 () Unit!7259)

(assert (=> d!37798 (= lt!181300 (choose!9 thiss!1305 (buf!2822 (_2!5201 lt!181082)) lt!181089 (BitStream!4287 (buf!2822 (_2!5201 lt!181082)) (currentByte!5471 thiss!1305) (currentBit!5466 thiss!1305))))))

(assert (=> d!37798 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2822 (_2!5201 lt!181082)) lt!181089) lt!181300)))

(declare-fun bs!9143 () Bool)

(assert (= bs!9143 d!37798))

(assert (=> bs!9143 m!177097))

(declare-fun m!177259 () Bool)

(assert (=> bs!9143 m!177259))

(assert (=> b!117997 d!37798))

(declare-fun b!118134 () Bool)

(declare-fun e!77437 () Unit!7259)

(declare-fun lt!181383 () Unit!7259)

(assert (=> b!118134 (= e!77437 lt!181383)))

(declare-fun lt!181377 () (_ BitVec 64))

(assert (=> b!118134 (= lt!181377 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!181395 () (_ BitVec 64))

(assert (=> b!118134 (= lt!181395 (bitIndex!0 (size!2406 (buf!2822 thiss!1305)) (currentByte!5471 thiss!1305) (currentBit!5466 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5304 array!5304 (_ BitVec 64) (_ BitVec 64)) Unit!7259)

(assert (=> b!118134 (= lt!181383 (arrayBitRangesEqSymmetric!0 (buf!2822 thiss!1305) (buf!2822 (_2!5201 lt!181082)) lt!181377 lt!181395))))

(assert (=> b!118134 (arrayBitRangesEq!0 (buf!2822 (_2!5201 lt!181082)) (buf!2822 thiss!1305) lt!181377 lt!181395)))

(declare-fun b!118135 () Bool)

(declare-fun res!97760 () Bool)

(declare-fun e!77436 () Bool)

(assert (=> b!118135 (=> (not res!97760) (not e!77436))))

(declare-fun lt!181393 () tuple2!9876)

(assert (=> b!118135 (= res!97760 (isPrefixOf!0 (_1!5203 lt!181393) thiss!1305))))

(declare-fun b!118136 () Bool)

(declare-fun Unit!7270 () Unit!7259)

(assert (=> b!118136 (= e!77437 Unit!7270)))

(declare-fun d!37800 () Bool)

(assert (=> d!37800 e!77436))

(declare-fun res!97761 () Bool)

(assert (=> d!37800 (=> (not res!97761) (not e!77436))))

(assert (=> d!37800 (= res!97761 (isPrefixOf!0 (_1!5203 lt!181393) (_2!5203 lt!181393)))))

(declare-fun lt!181388 () BitStream!4286)

(assert (=> d!37800 (= lt!181393 (tuple2!9877 lt!181388 (_2!5201 lt!181082)))))

(declare-fun lt!181392 () Unit!7259)

(declare-fun lt!181390 () Unit!7259)

(assert (=> d!37800 (= lt!181392 lt!181390)))

(assert (=> d!37800 (isPrefixOf!0 lt!181388 (_2!5201 lt!181082))))

(assert (=> d!37800 (= lt!181390 (lemmaIsPrefixTransitive!0 lt!181388 (_2!5201 lt!181082) (_2!5201 lt!181082)))))

(declare-fun lt!181381 () Unit!7259)

(declare-fun lt!181387 () Unit!7259)

(assert (=> d!37800 (= lt!181381 lt!181387)))

(assert (=> d!37800 (isPrefixOf!0 lt!181388 (_2!5201 lt!181082))))

(assert (=> d!37800 (= lt!181387 (lemmaIsPrefixTransitive!0 lt!181388 thiss!1305 (_2!5201 lt!181082)))))

(declare-fun lt!181382 () Unit!7259)

(assert (=> d!37800 (= lt!181382 e!77437)))

(declare-fun c!7096 () Bool)

(assert (=> d!37800 (= c!7096 (not (= (size!2406 (buf!2822 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!181389 () Unit!7259)

(declare-fun lt!181385 () Unit!7259)

(assert (=> d!37800 (= lt!181389 lt!181385)))

(assert (=> d!37800 (isPrefixOf!0 (_2!5201 lt!181082) (_2!5201 lt!181082))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4286) Unit!7259)

(assert (=> d!37800 (= lt!181385 (lemmaIsPrefixRefl!0 (_2!5201 lt!181082)))))

(declare-fun lt!181384 () Unit!7259)

(declare-fun lt!181394 () Unit!7259)

(assert (=> d!37800 (= lt!181384 lt!181394)))

(assert (=> d!37800 (= lt!181394 (lemmaIsPrefixRefl!0 (_2!5201 lt!181082)))))

(declare-fun lt!181380 () Unit!7259)

(declare-fun lt!181379 () Unit!7259)

(assert (=> d!37800 (= lt!181380 lt!181379)))

(assert (=> d!37800 (isPrefixOf!0 lt!181388 lt!181388)))

(assert (=> d!37800 (= lt!181379 (lemmaIsPrefixRefl!0 lt!181388))))

(declare-fun lt!181378 () Unit!7259)

(declare-fun lt!181386 () Unit!7259)

(assert (=> d!37800 (= lt!181378 lt!181386)))

(assert (=> d!37800 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!37800 (= lt!181386 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!37800 (= lt!181388 (BitStream!4287 (buf!2822 (_2!5201 lt!181082)) (currentByte!5471 thiss!1305) (currentBit!5466 thiss!1305)))))

(assert (=> d!37800 (isPrefixOf!0 thiss!1305 (_2!5201 lt!181082))))

(assert (=> d!37800 (= (reader!0 thiss!1305 (_2!5201 lt!181082)) lt!181393)))

(declare-fun lt!181376 () (_ BitVec 64))

(declare-fun lt!181391 () (_ BitVec 64))

(declare-fun b!118137 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!4286 (_ BitVec 64)) BitStream!4286)

(assert (=> b!118137 (= e!77436 (= (_1!5203 lt!181393) (withMovedBitIndex!0 (_2!5203 lt!181393) (bvsub lt!181391 lt!181376))))))

(assert (=> b!118137 (or (= (bvand lt!181391 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!181376 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!181391 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!181391 lt!181376) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118137 (= lt!181376 (bitIndex!0 (size!2406 (buf!2822 (_2!5201 lt!181082))) (currentByte!5471 (_2!5201 lt!181082)) (currentBit!5466 (_2!5201 lt!181082))))))

(assert (=> b!118137 (= lt!181391 (bitIndex!0 (size!2406 (buf!2822 thiss!1305)) (currentByte!5471 thiss!1305) (currentBit!5466 thiss!1305)))))

(declare-fun b!118138 () Bool)

(declare-fun res!97762 () Bool)

(assert (=> b!118138 (=> (not res!97762) (not e!77436))))

(assert (=> b!118138 (= res!97762 (isPrefixOf!0 (_2!5203 lt!181393) (_2!5201 lt!181082)))))

(assert (= (and d!37800 c!7096) b!118134))

(assert (= (and d!37800 (not c!7096)) b!118136))

(assert (= (and d!37800 res!97761) b!118135))

(assert (= (and b!118135 res!97760) b!118138))

(assert (= (and b!118138 res!97762) b!118137))

(assert (=> b!118134 m!177091))

(declare-fun m!177301 () Bool)

(assert (=> b!118134 m!177301))

(declare-fun m!177303 () Bool)

(assert (=> b!118134 m!177303))

(declare-fun m!177305 () Bool)

(assert (=> b!118135 m!177305))

(declare-fun m!177307 () Bool)

(assert (=> d!37800 m!177307))

(declare-fun m!177309 () Bool)

(assert (=> d!37800 m!177309))

(declare-fun m!177311 () Bool)

(assert (=> d!37800 m!177311))

(declare-fun m!177313 () Bool)

(assert (=> d!37800 m!177313))

(declare-fun m!177315 () Bool)

(assert (=> d!37800 m!177315))

(declare-fun m!177317 () Bool)

(assert (=> d!37800 m!177317))

(declare-fun m!177319 () Bool)

(assert (=> d!37800 m!177319))

(declare-fun m!177321 () Bool)

(assert (=> d!37800 m!177321))

(assert (=> d!37800 m!177121))

(declare-fun m!177323 () Bool)

(assert (=> d!37800 m!177323))

(declare-fun m!177325 () Bool)

(assert (=> d!37800 m!177325))

(declare-fun m!177327 () Bool)

(assert (=> b!118137 m!177327))

(assert (=> b!118137 m!177225))

(assert (=> b!118137 m!177091))

(declare-fun m!177329 () Bool)

(assert (=> b!118138 m!177329))

(assert (=> b!117997 d!37800))

(declare-fun b!118263 () Bool)

(declare-fun res!97859 () Bool)

(declare-fun call!1532 () Bool)

(assert (=> b!118263 (= res!97859 call!1532)))

(declare-fun e!77504 () Bool)

(assert (=> b!118263 (=> (not res!97859) (not e!77504))))

(declare-fun b!118264 () Bool)

(declare-fun res!97854 () Bool)

(declare-fun e!77506 () Bool)

(assert (=> b!118264 (=> (not res!97854) (not e!77506))))

(declare-fun lt!181816 () tuple2!9872)

(assert (=> b!118264 (= res!97854 (isPrefixOf!0 (_2!5201 lt!181091) (_2!5201 lt!181816)))))

(declare-fun c!7114 () Bool)

(declare-fun lt!181806 () BitStream!4286)

(declare-fun bm!1529 () Bool)

(declare-fun lt!181842 () tuple2!9872)

(assert (=> bm!1529 (= call!1532 (isPrefixOf!0 (ite c!7114 (_2!5201 lt!181091) lt!181806) (ite c!7114 (_2!5201 lt!181842) lt!181806)))))

(declare-fun b!118265 () Bool)

(declare-fun lt!181819 () tuple2!9874)

(assert (=> b!118265 (= lt!181819 (readBitPure!0 (readerFrom!0 (_2!5201 lt!181842) (currentBit!5466 (_2!5201 lt!181091)) (currentByte!5471 (_2!5201 lt!181091)))))))

(declare-fun res!97855 () Bool)

(declare-fun lt!181812 () Bool)

(assert (=> b!118265 (= res!97855 (and (= (_2!5202 lt!181819) lt!181812) (= (_1!5202 lt!181819) (_2!5201 lt!181842))))))

(declare-fun e!77501 () Bool)

(assert (=> b!118265 (=> (not res!97855) (not e!77501))))

(assert (=> b!118265 (= e!77504 e!77501)))

(declare-fun b!118266 () Bool)

(declare-fun e!77507 () Bool)

(declare-fun lt!181839 () tuple2!9874)

(declare-fun lt!181836 () tuple2!9874)

(assert (=> b!118266 (= e!77507 (= (_2!5202 lt!181839) (_2!5202 lt!181836)))))

(declare-fun b!118267 () Bool)

(declare-fun e!77502 () Bool)

(declare-fun lt!181844 () (_ BitVec 64))

(assert (=> b!118267 (= e!77502 (validate_offset_bits!1 ((_ sign_extend 32) (size!2406 (buf!2822 (_2!5201 lt!181091)))) ((_ sign_extend 32) (currentByte!5471 (_2!5201 lt!181091))) ((_ sign_extend 32) (currentBit!5466 (_2!5201 lt!181091))) lt!181844))))

(declare-fun b!118268 () Bool)

(declare-fun e!77505 () (_ BitVec 64))

(assert (=> b!118268 (= e!77505 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!118269 () Bool)

(declare-fun res!97858 () Bool)

(assert (=> b!118269 (=> (not res!97858) (not e!77506))))

(declare-fun lt!181849 () (_ BitVec 64))

(declare-fun lt!181832 () (_ BitVec 64))

(assert (=> b!118269 (= res!97858 (= (bitIndex!0 (size!2406 (buf!2822 (_2!5201 lt!181816))) (currentByte!5471 (_2!5201 lt!181816)) (currentBit!5466 (_2!5201 lt!181816))) (bvadd lt!181849 lt!181832)))))

(assert (=> b!118269 (or (not (= (bvand lt!181849 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!181832 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!181849 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!181849 lt!181832) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118269 (= lt!181832 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!118269 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!118269 (= lt!181849 (bitIndex!0 (size!2406 (buf!2822 (_2!5201 lt!181091))) (currentByte!5471 (_2!5201 lt!181091)) (currentBit!5466 (_2!5201 lt!181091))))))

(declare-fun b!118270 () Bool)

(assert (=> b!118270 (= e!77501 (= (bitIndex!0 (size!2406 (buf!2822 (_1!5202 lt!181819))) (currentByte!5471 (_1!5202 lt!181819)) (currentBit!5466 (_1!5202 lt!181819))) (bitIndex!0 (size!2406 (buf!2822 (_2!5201 lt!181842))) (currentByte!5471 (_2!5201 lt!181842)) (currentBit!5466 (_2!5201 lt!181842)))))))

(declare-fun d!37816 () Bool)

(assert (=> d!37816 e!77506))

(declare-fun res!97860 () Bool)

(assert (=> d!37816 (=> (not res!97860) (not e!77506))))

(assert (=> d!37816 (= res!97860 (= (size!2406 (buf!2822 (_2!5201 lt!181091))) (size!2406 (buf!2822 (_2!5201 lt!181816)))))))

(declare-fun e!77503 () tuple2!9872)

(assert (=> d!37816 (= lt!181816 e!77503)))

(assert (=> d!37816 (= c!7114 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!37816 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!37816 (= (appendNLeastSignificantBitsLoop!0 (_2!5201 lt!181091) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!181816)))

(declare-fun b!118271 () Bool)

(declare-fun lt!181821 () Unit!7259)

(assert (=> b!118271 (= e!77503 (tuple2!9873 lt!181821 (_2!5201 lt!181091)))))

(assert (=> b!118271 (= lt!181806 (_2!5201 lt!181091))))

(assert (=> b!118271 (= lt!181821 (lemmaIsPrefixRefl!0 lt!181806))))

(assert (=> b!118271 call!1532))

(declare-fun b!118272 () Bool)

(assert (=> b!118272 (= e!77505 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!118273 () Bool)

(declare-fun res!97852 () Bool)

(assert (=> b!118273 (= res!97852 (= (bitIndex!0 (size!2406 (buf!2822 (_2!5201 lt!181842))) (currentByte!5471 (_2!5201 lt!181842)) (currentBit!5466 (_2!5201 lt!181842))) (bvadd (bitIndex!0 (size!2406 (buf!2822 (_2!5201 lt!181091))) (currentByte!5471 (_2!5201 lt!181091)) (currentBit!5466 (_2!5201 lt!181091))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!118273 (=> (not res!97852) (not e!77504))))

(declare-fun lt!181810 () tuple2!9876)

(declare-fun lt!181825 () tuple2!9878)

(declare-fun b!118274 () Bool)

(assert (=> b!118274 (= e!77506 (and (= (_2!5204 lt!181825) v!199) (= (_1!5204 lt!181825) (_2!5203 lt!181810))))))

(declare-fun lt!181818 () (_ BitVec 64))

(assert (=> b!118274 (= lt!181825 (readNLeastSignificantBitsLoopPure!0 (_1!5203 lt!181810) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!181818))))

(declare-fun lt!181815 () Unit!7259)

(declare-fun lt!181813 () Unit!7259)

(assert (=> b!118274 (= lt!181815 lt!181813)))

(assert (=> b!118274 (validate_offset_bits!1 ((_ sign_extend 32) (size!2406 (buf!2822 (_2!5201 lt!181816)))) ((_ sign_extend 32) (currentByte!5471 (_2!5201 lt!181091))) ((_ sign_extend 32) (currentBit!5466 (_2!5201 lt!181091))) lt!181844)))

(assert (=> b!118274 (= lt!181813 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5201 lt!181091) (buf!2822 (_2!5201 lt!181816)) lt!181844))))

(assert (=> b!118274 e!77502))

(declare-fun res!97853 () Bool)

(assert (=> b!118274 (=> (not res!97853) (not e!77502))))

(assert (=> b!118274 (= res!97853 (and (= (size!2406 (buf!2822 (_2!5201 lt!181091))) (size!2406 (buf!2822 (_2!5201 lt!181816)))) (bvsge lt!181844 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118274 (= lt!181844 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!118274 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!118274 (= lt!181818 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!118274 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!118274 (= lt!181810 (reader!0 (_2!5201 lt!181091) (_2!5201 lt!181816)))))

(declare-fun b!118275 () Bool)

(declare-fun lt!181847 () tuple2!9872)

(declare-fun Unit!7278 () Unit!7259)

(assert (=> b!118275 (= e!77503 (tuple2!9873 Unit!7278 (_2!5201 lt!181847)))))

(assert (=> b!118275 (= lt!181812 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118275 (= lt!181842 (appendBit!0 (_2!5201 lt!181091) lt!181812))))

(declare-fun res!97857 () Bool)

(assert (=> b!118275 (= res!97857 (= (size!2406 (buf!2822 (_2!5201 lt!181091))) (size!2406 (buf!2822 (_2!5201 lt!181842)))))))

(assert (=> b!118275 (=> (not res!97857) (not e!77504))))

(assert (=> b!118275 e!77504))

(declare-fun lt!181820 () tuple2!9872)

(assert (=> b!118275 (= lt!181820 lt!181842)))

(assert (=> b!118275 (= lt!181847 (appendNLeastSignificantBitsLoop!0 (_2!5201 lt!181820) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!181824 () Unit!7259)

(assert (=> b!118275 (= lt!181824 (lemmaIsPrefixTransitive!0 (_2!5201 lt!181091) (_2!5201 lt!181820) (_2!5201 lt!181847)))))

(assert (=> b!118275 (isPrefixOf!0 (_2!5201 lt!181091) (_2!5201 lt!181847))))

(declare-fun lt!181811 () Unit!7259)

(assert (=> b!118275 (= lt!181811 lt!181824)))

(assert (=> b!118275 (invariant!0 (currentBit!5466 (_2!5201 lt!181091)) (currentByte!5471 (_2!5201 lt!181091)) (size!2406 (buf!2822 (_2!5201 lt!181820))))))

(declare-fun lt!181823 () BitStream!4286)

(assert (=> b!118275 (= lt!181823 (BitStream!4287 (buf!2822 (_2!5201 lt!181820)) (currentByte!5471 (_2!5201 lt!181091)) (currentBit!5466 (_2!5201 lt!181091))))))

(assert (=> b!118275 (invariant!0 (currentBit!5466 lt!181823) (currentByte!5471 lt!181823) (size!2406 (buf!2822 (_2!5201 lt!181847))))))

(declare-fun lt!181835 () BitStream!4286)

(assert (=> b!118275 (= lt!181835 (BitStream!4287 (buf!2822 (_2!5201 lt!181847)) (currentByte!5471 lt!181823) (currentBit!5466 lt!181823)))))

(assert (=> b!118275 (= lt!181839 (readBitPure!0 lt!181823))))

(assert (=> b!118275 (= lt!181836 (readBitPure!0 lt!181835))))

(declare-fun lt!181814 () Unit!7259)

(assert (=> b!118275 (= lt!181814 (readBitPrefixLemma!0 lt!181823 (_2!5201 lt!181847)))))

(declare-fun res!97856 () Bool)

(assert (=> b!118275 (= res!97856 (= (bitIndex!0 (size!2406 (buf!2822 (_1!5202 lt!181839))) (currentByte!5471 (_1!5202 lt!181839)) (currentBit!5466 (_1!5202 lt!181839))) (bitIndex!0 (size!2406 (buf!2822 (_1!5202 lt!181836))) (currentByte!5471 (_1!5202 lt!181836)) (currentBit!5466 (_1!5202 lt!181836)))))))

(assert (=> b!118275 (=> (not res!97856) (not e!77507))))

(assert (=> b!118275 e!77507))

(declare-fun lt!181837 () Unit!7259)

(assert (=> b!118275 (= lt!181837 lt!181814)))

(declare-fun lt!181822 () tuple2!9876)

(assert (=> b!118275 (= lt!181822 (reader!0 (_2!5201 lt!181091) (_2!5201 lt!181847)))))

(declare-fun lt!181829 () tuple2!9876)

(assert (=> b!118275 (= lt!181829 (reader!0 (_2!5201 lt!181820) (_2!5201 lt!181847)))))

(declare-fun lt!181805 () tuple2!9874)

(assert (=> b!118275 (= lt!181805 (readBitPure!0 (_1!5203 lt!181822)))))

(assert (=> b!118275 (= (_2!5202 lt!181805) lt!181812)))

(declare-fun lt!181807 () Unit!7259)

(declare-fun Unit!7279 () Unit!7259)

(assert (=> b!118275 (= lt!181807 Unit!7279)))

(declare-fun lt!181817 () (_ BitVec 64))

(assert (=> b!118275 (= lt!181817 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!181808 () (_ BitVec 64))

(assert (=> b!118275 (= lt!181808 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!181843 () Unit!7259)

(assert (=> b!118275 (= lt!181843 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5201 lt!181091) (buf!2822 (_2!5201 lt!181847)) lt!181808))))

(assert (=> b!118275 (validate_offset_bits!1 ((_ sign_extend 32) (size!2406 (buf!2822 (_2!5201 lt!181847)))) ((_ sign_extend 32) (currentByte!5471 (_2!5201 lt!181091))) ((_ sign_extend 32) (currentBit!5466 (_2!5201 lt!181091))) lt!181808)))

(declare-fun lt!181828 () Unit!7259)

(assert (=> b!118275 (= lt!181828 lt!181843)))

(declare-fun lt!181830 () tuple2!9878)

(assert (=> b!118275 (= lt!181830 (readNLeastSignificantBitsLoopPure!0 (_1!5203 lt!181822) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!181817))))

(declare-fun lt!181848 () (_ BitVec 64))

(assert (=> b!118275 (= lt!181848 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!181841 () Unit!7259)

(assert (=> b!118275 (= lt!181841 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5201 lt!181820) (buf!2822 (_2!5201 lt!181847)) lt!181848))))

(assert (=> b!118275 (validate_offset_bits!1 ((_ sign_extend 32) (size!2406 (buf!2822 (_2!5201 lt!181847)))) ((_ sign_extend 32) (currentByte!5471 (_2!5201 lt!181820))) ((_ sign_extend 32) (currentBit!5466 (_2!5201 lt!181820))) lt!181848)))

(declare-fun lt!181846 () Unit!7259)

(assert (=> b!118275 (= lt!181846 lt!181841)))

(declare-fun lt!181834 () tuple2!9878)

(assert (=> b!118275 (= lt!181834 (readNLeastSignificantBitsLoopPure!0 (_1!5203 lt!181829) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!181817 (ite (_2!5202 lt!181805) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!181827 () tuple2!9878)

(assert (=> b!118275 (= lt!181827 (readNLeastSignificantBitsLoopPure!0 (_1!5203 lt!181822) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!181817))))

(declare-fun c!7115 () Bool)

(assert (=> b!118275 (= c!7115 (_2!5202 (readBitPure!0 (_1!5203 lt!181822))))))

(declare-fun lt!181840 () tuple2!9878)

(assert (=> b!118275 (= lt!181840 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5203 lt!181822) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!181817 e!77505)))))

(declare-fun lt!181845 () Unit!7259)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4286 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7259)

(assert (=> b!118275 (= lt!181845 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5203 lt!181822) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!181817))))

(assert (=> b!118275 (and (= (_2!5204 lt!181827) (_2!5204 lt!181840)) (= (_1!5204 lt!181827) (_1!5204 lt!181840)))))

(declare-fun lt!181833 () Unit!7259)

(assert (=> b!118275 (= lt!181833 lt!181845)))

(assert (=> b!118275 (= (_1!5203 lt!181822) (withMovedBitIndex!0 (_2!5203 lt!181822) (bvsub (bitIndex!0 (size!2406 (buf!2822 (_2!5201 lt!181091))) (currentByte!5471 (_2!5201 lt!181091)) (currentBit!5466 (_2!5201 lt!181091))) (bitIndex!0 (size!2406 (buf!2822 (_2!5201 lt!181847))) (currentByte!5471 (_2!5201 lt!181847)) (currentBit!5466 (_2!5201 lt!181847))))))))

(declare-fun lt!181826 () Unit!7259)

(declare-fun Unit!7280 () Unit!7259)

(assert (=> b!118275 (= lt!181826 Unit!7280)))

(assert (=> b!118275 (= (_1!5203 lt!181829) (withMovedBitIndex!0 (_2!5203 lt!181829) (bvsub (bitIndex!0 (size!2406 (buf!2822 (_2!5201 lt!181820))) (currentByte!5471 (_2!5201 lt!181820)) (currentBit!5466 (_2!5201 lt!181820))) (bitIndex!0 (size!2406 (buf!2822 (_2!5201 lt!181847))) (currentByte!5471 (_2!5201 lt!181847)) (currentBit!5466 (_2!5201 lt!181847))))))))

(declare-fun lt!181831 () Unit!7259)

(declare-fun Unit!7281 () Unit!7259)

(assert (=> b!118275 (= lt!181831 Unit!7281)))

(assert (=> b!118275 (= (bitIndex!0 (size!2406 (buf!2822 (_2!5201 lt!181091))) (currentByte!5471 (_2!5201 lt!181091)) (currentBit!5466 (_2!5201 lt!181091))) (bvsub (bitIndex!0 (size!2406 (buf!2822 (_2!5201 lt!181820))) (currentByte!5471 (_2!5201 lt!181820)) (currentBit!5466 (_2!5201 lt!181820))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!181838 () Unit!7259)

(declare-fun Unit!7282 () Unit!7259)

(assert (=> b!118275 (= lt!181838 Unit!7282)))

(assert (=> b!118275 (= (_2!5204 lt!181830) (_2!5204 lt!181834))))

(declare-fun lt!181809 () Unit!7259)

(declare-fun Unit!7283 () Unit!7259)

(assert (=> b!118275 (= lt!181809 Unit!7283)))

(assert (=> b!118275 (= (_1!5204 lt!181830) (_2!5203 lt!181822))))

(assert (= (and d!37816 c!7114) b!118275))

(assert (= (and d!37816 (not c!7114)) b!118271))

(assert (= (and b!118275 res!97857) b!118273))

(assert (= (and b!118273 res!97852) b!118263))

(assert (= (and b!118263 res!97859) b!118265))

(assert (= (and b!118265 res!97855) b!118270))

(assert (= (and b!118275 res!97856) b!118266))

(assert (= (and b!118275 c!7115) b!118272))

(assert (= (and b!118275 (not c!7115)) b!118268))

(assert (= (or b!118263 b!118271) bm!1529))

(assert (= (and d!37816 res!97860) b!118269))

(assert (= (and b!118269 res!97858) b!118264))

(assert (= (and b!118264 res!97854) b!118274))

(assert (= (and b!118274 res!97853) b!118267))

(declare-fun m!177541 () Bool)

(assert (=> b!118275 m!177541))

(declare-fun m!177543 () Bool)

(assert (=> b!118275 m!177543))

(declare-fun m!177545 () Bool)

(assert (=> b!118275 m!177545))

(declare-fun m!177547 () Bool)

(assert (=> b!118275 m!177547))

(declare-fun m!177549 () Bool)

(assert (=> b!118275 m!177549))

(declare-fun m!177551 () Bool)

(assert (=> b!118275 m!177551))

(declare-fun m!177553 () Bool)

(assert (=> b!118275 m!177553))

(declare-fun m!177555 () Bool)

(assert (=> b!118275 m!177555))

(declare-fun m!177557 () Bool)

(assert (=> b!118275 m!177557))

(declare-fun m!177559 () Bool)

(assert (=> b!118275 m!177559))

(declare-fun m!177561 () Bool)

(assert (=> b!118275 m!177561))

(declare-fun m!177563 () Bool)

(assert (=> b!118275 m!177563))

(declare-fun m!177565 () Bool)

(assert (=> b!118275 m!177565))

(declare-fun m!177567 () Bool)

(assert (=> b!118275 m!177567))

(declare-fun m!177569 () Bool)

(assert (=> b!118275 m!177569))

(declare-fun m!177571 () Bool)

(assert (=> b!118275 m!177571))

(declare-fun m!177573 () Bool)

(assert (=> b!118275 m!177573))

(assert (=> b!118275 m!177551))

(declare-fun m!177575 () Bool)

(assert (=> b!118275 m!177575))

(declare-fun m!177577 () Bool)

(assert (=> b!118275 m!177577))

(declare-fun m!177579 () Bool)

(assert (=> b!118275 m!177579))

(declare-fun m!177581 () Bool)

(assert (=> b!118275 m!177581))

(declare-fun m!177583 () Bool)

(assert (=> b!118275 m!177583))

(declare-fun m!177585 () Bool)

(assert (=> b!118275 m!177585))

(declare-fun m!177587 () Bool)

(assert (=> b!118275 m!177587))

(assert (=> b!118275 m!177089))

(declare-fun m!177589 () Bool)

(assert (=> b!118275 m!177589))

(declare-fun m!177591 () Bool)

(assert (=> b!118275 m!177591))

(declare-fun m!177593 () Bool)

(assert (=> b!118275 m!177593))

(declare-fun m!177595 () Bool)

(assert (=> b!118275 m!177595))

(declare-fun m!177597 () Bool)

(assert (=> b!118269 m!177597))

(assert (=> b!118269 m!177089))

(declare-fun m!177599 () Bool)

(assert (=> b!118274 m!177599))

(declare-fun m!177601 () Bool)

(assert (=> b!118274 m!177601))

(declare-fun m!177603 () Bool)

(assert (=> b!118274 m!177603))

(assert (=> b!118274 m!177587))

(declare-fun m!177605 () Bool)

(assert (=> b!118274 m!177605))

(declare-fun m!177607 () Bool)

(assert (=> bm!1529 m!177607))

(declare-fun m!177609 () Bool)

(assert (=> b!118271 m!177609))

(declare-fun m!177611 () Bool)

(assert (=> b!118265 m!177611))

(assert (=> b!118265 m!177611))

(declare-fun m!177613 () Bool)

(assert (=> b!118265 m!177613))

(declare-fun m!177615 () Bool)

(assert (=> b!118273 m!177615))

(assert (=> b!118273 m!177089))

(declare-fun m!177617 () Bool)

(assert (=> b!118270 m!177617))

(assert (=> b!118270 m!177615))

(declare-fun m!177619 () Bool)

(assert (=> b!118267 m!177619))

(declare-fun m!177621 () Bool)

(assert (=> b!118264 m!177621))

(assert (=> b!117997 d!37816))

(declare-fun d!37854 () Bool)

(assert (=> d!37854 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2406 (buf!2822 (_2!5201 lt!181082)))) ((_ sign_extend 32) (currentByte!5471 (_2!5201 lt!181091))) ((_ sign_extend 32) (currentBit!5466 (_2!5201 lt!181091))) lt!181092) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2406 (buf!2822 (_2!5201 lt!181082)))) ((_ sign_extend 32) (currentByte!5471 (_2!5201 lt!181091))) ((_ sign_extend 32) (currentBit!5466 (_2!5201 lt!181091)))) lt!181092))))

(declare-fun bs!9156 () Bool)

(assert (= bs!9156 d!37854))

(declare-fun m!177623 () Bool)

(assert (=> bs!9156 m!177623))

(assert (=> b!117997 d!37854))

(declare-fun d!37856 () Bool)

(declare-fun lt!181878 () tuple2!9886)

(assert (=> d!37856 (= lt!181878 (readBit!0 (_1!5203 lt!181083)))))

(assert (=> d!37856 (= (readBitPure!0 (_1!5203 lt!181083)) (tuple2!9875 (_2!5208 lt!181878) (_1!5208 lt!181878)))))

(declare-fun bs!9157 () Bool)

(assert (= bs!9157 d!37856))

(declare-fun m!177625 () Bool)

(assert (=> bs!9157 m!177625))

(assert (=> b!117997 d!37856))

(declare-fun d!37858 () Bool)

(declare-fun e!77516 () Bool)

(assert (=> d!37858 e!77516))

(declare-fun res!97871 () Bool)

(assert (=> d!37858 (=> (not res!97871) (not e!77516))))

(declare-fun lt!181900 () tuple2!9874)

(declare-fun lt!181897 () tuple2!9874)

(assert (=> d!37858 (= res!97871 (= (bitIndex!0 (size!2406 (buf!2822 (_1!5202 lt!181900))) (currentByte!5471 (_1!5202 lt!181900)) (currentBit!5466 (_1!5202 lt!181900))) (bitIndex!0 (size!2406 (buf!2822 (_1!5202 lt!181897))) (currentByte!5471 (_1!5202 lt!181897)) (currentBit!5466 (_1!5202 lt!181897)))))))

(declare-fun lt!181899 () BitStream!4286)

(declare-fun lt!181898 () Unit!7259)

(declare-fun choose!50 (BitStream!4286 BitStream!4286 BitStream!4286 tuple2!9874 tuple2!9874 BitStream!4286 Bool tuple2!9874 tuple2!9874 BitStream!4286 Bool) Unit!7259)

(assert (=> d!37858 (= lt!181898 (choose!50 lt!181074 (_2!5201 lt!181082) lt!181899 lt!181900 (tuple2!9875 (_1!5202 lt!181900) (_2!5202 lt!181900)) (_1!5202 lt!181900) (_2!5202 lt!181900) lt!181897 (tuple2!9875 (_1!5202 lt!181897) (_2!5202 lt!181897)) (_1!5202 lt!181897) (_2!5202 lt!181897)))))

(assert (=> d!37858 (= lt!181897 (readBitPure!0 lt!181899))))

(assert (=> d!37858 (= lt!181900 (readBitPure!0 lt!181074))))

(assert (=> d!37858 (= lt!181899 (BitStream!4287 (buf!2822 (_2!5201 lt!181082)) (currentByte!5471 lt!181074) (currentBit!5466 lt!181074)))))

(assert (=> d!37858 (invariant!0 (currentBit!5466 lt!181074) (currentByte!5471 lt!181074) (size!2406 (buf!2822 (_2!5201 lt!181082))))))

(assert (=> d!37858 (= (readBitPrefixLemma!0 lt!181074 (_2!5201 lt!181082)) lt!181898)))

(declare-fun b!118290 () Bool)

(assert (=> b!118290 (= e!77516 (= (_2!5202 lt!181900) (_2!5202 lt!181897)))))

(assert (= (and d!37858 res!97871) b!118290))

(declare-fun m!177627 () Bool)

(assert (=> d!37858 m!177627))

(declare-fun m!177629 () Bool)

(assert (=> d!37858 m!177629))

(assert (=> d!37858 m!177117))

(declare-fun m!177631 () Bool)

(assert (=> d!37858 m!177631))

(declare-fun m!177633 () Bool)

(assert (=> d!37858 m!177633))

(declare-fun m!177635 () Bool)

(assert (=> d!37858 m!177635))

(assert (=> b!117997 d!37858))

(declare-fun d!37860 () Bool)

(declare-fun e!77517 () Bool)

(assert (=> d!37860 e!77517))

(declare-fun res!97872 () Bool)

(assert (=> d!37860 (=> (not res!97872) (not e!77517))))

(declare-fun lt!181904 () (_ BitVec 64))

(declare-fun lt!181901 () (_ BitVec 64))

(declare-fun lt!181902 () (_ BitVec 64))

(assert (=> d!37860 (= res!97872 (= lt!181904 (bvsub lt!181901 lt!181902)))))

(assert (=> d!37860 (or (= (bvand lt!181901 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!181902 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!181901 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!181901 lt!181902) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37860 (= lt!181902 (remainingBits!0 ((_ sign_extend 32) (size!2406 (buf!2822 (_1!5202 lt!181079)))) ((_ sign_extend 32) (currentByte!5471 (_1!5202 lt!181079))) ((_ sign_extend 32) (currentBit!5466 (_1!5202 lt!181079)))))))

(declare-fun lt!181906 () (_ BitVec 64))

(declare-fun lt!181905 () (_ BitVec 64))

(assert (=> d!37860 (= lt!181901 (bvmul lt!181906 lt!181905))))

(assert (=> d!37860 (or (= lt!181906 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!181905 (bvsdiv (bvmul lt!181906 lt!181905) lt!181906)))))

(assert (=> d!37860 (= lt!181905 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37860 (= lt!181906 ((_ sign_extend 32) (size!2406 (buf!2822 (_1!5202 lt!181079)))))))

(assert (=> d!37860 (= lt!181904 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5471 (_1!5202 lt!181079))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5466 (_1!5202 lt!181079)))))))

(assert (=> d!37860 (invariant!0 (currentBit!5466 (_1!5202 lt!181079)) (currentByte!5471 (_1!5202 lt!181079)) (size!2406 (buf!2822 (_1!5202 lt!181079))))))

(assert (=> d!37860 (= (bitIndex!0 (size!2406 (buf!2822 (_1!5202 lt!181079))) (currentByte!5471 (_1!5202 lt!181079)) (currentBit!5466 (_1!5202 lt!181079))) lt!181904)))

(declare-fun b!118291 () Bool)

(declare-fun res!97873 () Bool)

(assert (=> b!118291 (=> (not res!97873) (not e!77517))))

(assert (=> b!118291 (= res!97873 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!181904))))

(declare-fun b!118292 () Bool)

(declare-fun lt!181903 () (_ BitVec 64))

(assert (=> b!118292 (= e!77517 (bvsle lt!181904 (bvmul lt!181903 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!118292 (or (= lt!181903 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!181903 #b0000000000000000000000000000000000000000000000000000000000001000) lt!181903)))))

(assert (=> b!118292 (= lt!181903 ((_ sign_extend 32) (size!2406 (buf!2822 (_1!5202 lt!181079)))))))

(assert (= (and d!37860 res!97872) b!118291))

(assert (= (and b!118291 res!97873) b!118292))

(declare-fun m!177637 () Bool)

(assert (=> d!37860 m!177637))

(declare-fun m!177639 () Bool)

(assert (=> d!37860 m!177639))

(assert (=> b!117997 d!37860))

(declare-fun d!37862 () Bool)

(assert (=> d!37862 (isPrefixOf!0 thiss!1305 (_2!5201 lt!181082))))

(declare-fun lt!181909 () Unit!7259)

(declare-fun choose!30 (BitStream!4286 BitStream!4286 BitStream!4286) Unit!7259)

(assert (=> d!37862 (= lt!181909 (choose!30 thiss!1305 (_2!5201 lt!181091) (_2!5201 lt!181082)))))

(assert (=> d!37862 (isPrefixOf!0 thiss!1305 (_2!5201 lt!181091))))

(assert (=> d!37862 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5201 lt!181091) (_2!5201 lt!181082)) lt!181909)))

(declare-fun bs!9158 () Bool)

(assert (= bs!9158 d!37862))

(assert (=> bs!9158 m!177121))

(declare-fun m!177641 () Bool)

(assert (=> bs!9158 m!177641))

(assert (=> bs!9158 m!177087))

(assert (=> b!117997 d!37862))

(declare-fun d!37864 () Bool)

(declare-fun e!77518 () Bool)

(assert (=> d!37864 e!77518))

(declare-fun res!97874 () Bool)

(assert (=> d!37864 (=> (not res!97874) (not e!77518))))

(declare-fun lt!181911 () (_ BitVec 64))

(declare-fun lt!181913 () (_ BitVec 64))

(declare-fun lt!181910 () (_ BitVec 64))

(assert (=> d!37864 (= res!97874 (= lt!181913 (bvsub lt!181910 lt!181911)))))

(assert (=> d!37864 (or (= (bvand lt!181910 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!181911 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!181910 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!181910 lt!181911) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37864 (= lt!181911 (remainingBits!0 ((_ sign_extend 32) (size!2406 (buf!2822 (_1!5202 lt!181087)))) ((_ sign_extend 32) (currentByte!5471 (_1!5202 lt!181087))) ((_ sign_extend 32) (currentBit!5466 (_1!5202 lt!181087)))))))

(declare-fun lt!181915 () (_ BitVec 64))

(declare-fun lt!181914 () (_ BitVec 64))

(assert (=> d!37864 (= lt!181910 (bvmul lt!181915 lt!181914))))

(assert (=> d!37864 (or (= lt!181915 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!181914 (bvsdiv (bvmul lt!181915 lt!181914) lt!181915)))))

(assert (=> d!37864 (= lt!181914 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37864 (= lt!181915 ((_ sign_extend 32) (size!2406 (buf!2822 (_1!5202 lt!181087)))))))

(assert (=> d!37864 (= lt!181913 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5471 (_1!5202 lt!181087))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5466 (_1!5202 lt!181087)))))))

(assert (=> d!37864 (invariant!0 (currentBit!5466 (_1!5202 lt!181087)) (currentByte!5471 (_1!5202 lt!181087)) (size!2406 (buf!2822 (_1!5202 lt!181087))))))

(assert (=> d!37864 (= (bitIndex!0 (size!2406 (buf!2822 (_1!5202 lt!181087))) (currentByte!5471 (_1!5202 lt!181087)) (currentBit!5466 (_1!5202 lt!181087))) lt!181913)))

(declare-fun b!118293 () Bool)

(declare-fun res!97875 () Bool)

(assert (=> b!118293 (=> (not res!97875) (not e!77518))))

(assert (=> b!118293 (= res!97875 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!181913))))

(declare-fun b!118294 () Bool)

(declare-fun lt!181912 () (_ BitVec 64))

(assert (=> b!118294 (= e!77518 (bvsle lt!181913 (bvmul lt!181912 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!118294 (or (= lt!181912 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!181912 #b0000000000000000000000000000000000000000000000000000000000001000) lt!181912)))))

(assert (=> b!118294 (= lt!181912 ((_ sign_extend 32) (size!2406 (buf!2822 (_1!5202 lt!181087)))))))

(assert (= (and d!37864 res!97874) b!118293))

(assert (= (and b!118293 res!97875) b!118294))

(declare-fun m!177643 () Bool)

(assert (=> d!37864 m!177643))

(declare-fun m!177645 () Bool)

(assert (=> d!37864 m!177645))

(assert (=> b!117997 d!37864))

(declare-fun d!37866 () Bool)

(assert (=> d!37866 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!117997 d!37866))

(declare-fun d!37868 () Bool)

(declare-fun lt!181961 () tuple2!9890)

(assert (=> d!37868 (= lt!181961 (readNLeastSignificantBitsLoop!0 (_1!5203 lt!181083) nBits!396 i!615 lt!181088))))

(assert (=> d!37868 (= (readNLeastSignificantBitsLoopPure!0 (_1!5203 lt!181083) nBits!396 i!615 lt!181088) (tuple2!9879 (_2!5210 lt!181961) (_1!5210 lt!181961)))))

(declare-fun bs!9159 () Bool)

(assert (= bs!9159 d!37868))

(declare-fun m!177647 () Bool)

(assert (=> bs!9159 m!177647))

(assert (=> b!117997 d!37868))

(declare-fun d!37870 () Bool)

(declare-fun lt!181962 () tuple2!9886)

(assert (=> d!37870 (= lt!181962 (readBit!0 (BitStream!4287 (buf!2822 (_2!5201 lt!181082)) (currentByte!5471 thiss!1305) (currentBit!5466 thiss!1305))))))

(assert (=> d!37870 (= (readBitPure!0 (BitStream!4287 (buf!2822 (_2!5201 lt!181082)) (currentByte!5471 thiss!1305) (currentBit!5466 thiss!1305))) (tuple2!9875 (_2!5208 lt!181962) (_1!5208 lt!181962)))))

(declare-fun bs!9160 () Bool)

(assert (= bs!9160 d!37870))

(declare-fun m!177649 () Bool)

(assert (=> bs!9160 m!177649))

(assert (=> b!117997 d!37870))

(declare-fun b!118308 () Bool)

(declare-fun e!77527 () Unit!7259)

(declare-fun lt!181970 () Unit!7259)

(assert (=> b!118308 (= e!77527 lt!181970)))

(declare-fun lt!181964 () (_ BitVec 64))

(assert (=> b!118308 (= lt!181964 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!181982 () (_ BitVec 64))

(assert (=> b!118308 (= lt!181982 (bitIndex!0 (size!2406 (buf!2822 (_2!5201 lt!181091))) (currentByte!5471 (_2!5201 lt!181091)) (currentBit!5466 (_2!5201 lt!181091))))))

(assert (=> b!118308 (= lt!181970 (arrayBitRangesEqSymmetric!0 (buf!2822 (_2!5201 lt!181091)) (buf!2822 (_2!5201 lt!181082)) lt!181964 lt!181982))))

(assert (=> b!118308 (arrayBitRangesEq!0 (buf!2822 (_2!5201 lt!181082)) (buf!2822 (_2!5201 lt!181091)) lt!181964 lt!181982)))

(declare-fun b!118309 () Bool)

(declare-fun res!97885 () Bool)

(declare-fun e!77526 () Bool)

(assert (=> b!118309 (=> (not res!97885) (not e!77526))))

(declare-fun lt!181980 () tuple2!9876)

(assert (=> b!118309 (= res!97885 (isPrefixOf!0 (_1!5203 lt!181980) (_2!5201 lt!181091)))))

(declare-fun b!118310 () Bool)

(declare-fun Unit!7284 () Unit!7259)

(assert (=> b!118310 (= e!77527 Unit!7284)))

(declare-fun d!37872 () Bool)

(assert (=> d!37872 e!77526))

(declare-fun res!97886 () Bool)

(assert (=> d!37872 (=> (not res!97886) (not e!77526))))

(assert (=> d!37872 (= res!97886 (isPrefixOf!0 (_1!5203 lt!181980) (_2!5203 lt!181980)))))

(declare-fun lt!181975 () BitStream!4286)

(assert (=> d!37872 (= lt!181980 (tuple2!9877 lt!181975 (_2!5201 lt!181082)))))

(declare-fun lt!181979 () Unit!7259)

(declare-fun lt!181977 () Unit!7259)

(assert (=> d!37872 (= lt!181979 lt!181977)))

(assert (=> d!37872 (isPrefixOf!0 lt!181975 (_2!5201 lt!181082))))

(assert (=> d!37872 (= lt!181977 (lemmaIsPrefixTransitive!0 lt!181975 (_2!5201 lt!181082) (_2!5201 lt!181082)))))

(declare-fun lt!181968 () Unit!7259)

(declare-fun lt!181974 () Unit!7259)

(assert (=> d!37872 (= lt!181968 lt!181974)))

(assert (=> d!37872 (isPrefixOf!0 lt!181975 (_2!5201 lt!181082))))

(assert (=> d!37872 (= lt!181974 (lemmaIsPrefixTransitive!0 lt!181975 (_2!5201 lt!181091) (_2!5201 lt!181082)))))

(declare-fun lt!181969 () Unit!7259)

(assert (=> d!37872 (= lt!181969 e!77527)))

(declare-fun c!7120 () Bool)

(assert (=> d!37872 (= c!7120 (not (= (size!2406 (buf!2822 (_2!5201 lt!181091))) #b00000000000000000000000000000000)))))

(declare-fun lt!181976 () Unit!7259)

(declare-fun lt!181972 () Unit!7259)

(assert (=> d!37872 (= lt!181976 lt!181972)))

(assert (=> d!37872 (isPrefixOf!0 (_2!5201 lt!181082) (_2!5201 lt!181082))))

(assert (=> d!37872 (= lt!181972 (lemmaIsPrefixRefl!0 (_2!5201 lt!181082)))))

(declare-fun lt!181971 () Unit!7259)

(declare-fun lt!181981 () Unit!7259)

(assert (=> d!37872 (= lt!181971 lt!181981)))

(assert (=> d!37872 (= lt!181981 (lemmaIsPrefixRefl!0 (_2!5201 lt!181082)))))

(declare-fun lt!181967 () Unit!7259)

(declare-fun lt!181966 () Unit!7259)

(assert (=> d!37872 (= lt!181967 lt!181966)))

(assert (=> d!37872 (isPrefixOf!0 lt!181975 lt!181975)))

(assert (=> d!37872 (= lt!181966 (lemmaIsPrefixRefl!0 lt!181975))))

(declare-fun lt!181965 () Unit!7259)

(declare-fun lt!181973 () Unit!7259)

(assert (=> d!37872 (= lt!181965 lt!181973)))

(assert (=> d!37872 (isPrefixOf!0 (_2!5201 lt!181091) (_2!5201 lt!181091))))

(assert (=> d!37872 (= lt!181973 (lemmaIsPrefixRefl!0 (_2!5201 lt!181091)))))

(assert (=> d!37872 (= lt!181975 (BitStream!4287 (buf!2822 (_2!5201 lt!181082)) (currentByte!5471 (_2!5201 lt!181091)) (currentBit!5466 (_2!5201 lt!181091))))))

(assert (=> d!37872 (isPrefixOf!0 (_2!5201 lt!181091) (_2!5201 lt!181082))))

(assert (=> d!37872 (= (reader!0 (_2!5201 lt!181091) (_2!5201 lt!181082)) lt!181980)))

(declare-fun lt!181978 () (_ BitVec 64))

(declare-fun b!118311 () Bool)

(declare-fun lt!181963 () (_ BitVec 64))

(assert (=> b!118311 (= e!77526 (= (_1!5203 lt!181980) (withMovedBitIndex!0 (_2!5203 lt!181980) (bvsub lt!181978 lt!181963))))))

(assert (=> b!118311 (or (= (bvand lt!181978 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!181963 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!181978 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!181978 lt!181963) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118311 (= lt!181963 (bitIndex!0 (size!2406 (buf!2822 (_2!5201 lt!181082))) (currentByte!5471 (_2!5201 lt!181082)) (currentBit!5466 (_2!5201 lt!181082))))))

(assert (=> b!118311 (= lt!181978 (bitIndex!0 (size!2406 (buf!2822 (_2!5201 lt!181091))) (currentByte!5471 (_2!5201 lt!181091)) (currentBit!5466 (_2!5201 lt!181091))))))

(declare-fun b!118312 () Bool)

(declare-fun res!97887 () Bool)

(assert (=> b!118312 (=> (not res!97887) (not e!77526))))

(assert (=> b!118312 (= res!97887 (isPrefixOf!0 (_2!5203 lt!181980) (_2!5201 lt!181082)))))

(assert (= (and d!37872 c!7120) b!118308))

(assert (= (and d!37872 (not c!7120)) b!118310))

(assert (= (and d!37872 res!97886) b!118309))

(assert (= (and b!118309 res!97885) b!118312))

(assert (= (and b!118312 res!97887) b!118311))

(assert (=> b!118308 m!177089))

(declare-fun m!177651 () Bool)

(assert (=> b!118308 m!177651))

(declare-fun m!177653 () Bool)

(assert (=> b!118308 m!177653))

(declare-fun m!177655 () Bool)

(assert (=> b!118309 m!177655))

(declare-fun m!177657 () Bool)

(assert (=> d!37872 m!177657))

(declare-fun m!177659 () Bool)

(assert (=> d!37872 m!177659))

(declare-fun m!177661 () Bool)

(assert (=> d!37872 m!177661))

(assert (=> d!37872 m!177313))

(declare-fun m!177663 () Bool)

(assert (=> d!37872 m!177663))

(declare-fun m!177665 () Bool)

(assert (=> d!37872 m!177665))

(assert (=> d!37872 m!177319))

(declare-fun m!177667 () Bool)

(assert (=> d!37872 m!177667))

(declare-fun m!177669 () Bool)

(assert (=> d!37872 m!177669))

(declare-fun m!177671 () Bool)

(assert (=> d!37872 m!177671))

(declare-fun m!177673 () Bool)

(assert (=> d!37872 m!177673))

(declare-fun m!177675 () Bool)

(assert (=> b!118311 m!177675))

(assert (=> b!118311 m!177225))

(assert (=> b!118311 m!177089))

(declare-fun m!177677 () Bool)

(assert (=> b!118312 m!177677))

(assert (=> b!117997 d!37872))

(declare-fun d!37874 () Bool)

(assert (=> d!37874 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2406 (buf!2822 (_2!5201 lt!181082)))) ((_ sign_extend 32) (currentByte!5471 thiss!1305)) ((_ sign_extend 32) (currentBit!5466 thiss!1305)) lt!181089) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2406 (buf!2822 (_2!5201 lt!181082)))) ((_ sign_extend 32) (currentByte!5471 thiss!1305)) ((_ sign_extend 32) (currentBit!5466 thiss!1305))) lt!181089))))

(declare-fun bs!9161 () Bool)

(assert (= bs!9161 d!37874))

(declare-fun m!177679 () Bool)

(assert (=> bs!9161 m!177679))

(assert (=> b!117997 d!37874))

(declare-fun d!37876 () Bool)

(assert (=> d!37876 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!117999 d!37876))

(declare-fun d!37878 () Bool)

(declare-fun res!97889 () Bool)

(declare-fun e!77528 () Bool)

(assert (=> d!37878 (=> (not res!97889) (not e!77528))))

(assert (=> d!37878 (= res!97889 (= (size!2406 (buf!2822 thiss!1305)) (size!2406 (buf!2822 (_2!5201 lt!181091)))))))

(assert (=> d!37878 (= (isPrefixOf!0 thiss!1305 (_2!5201 lt!181091)) e!77528)))

(declare-fun b!118313 () Bool)

(declare-fun res!97890 () Bool)

(assert (=> b!118313 (=> (not res!97890) (not e!77528))))

(assert (=> b!118313 (= res!97890 (bvsle (bitIndex!0 (size!2406 (buf!2822 thiss!1305)) (currentByte!5471 thiss!1305) (currentBit!5466 thiss!1305)) (bitIndex!0 (size!2406 (buf!2822 (_2!5201 lt!181091))) (currentByte!5471 (_2!5201 lt!181091)) (currentBit!5466 (_2!5201 lt!181091)))))))

(declare-fun b!118314 () Bool)

(declare-fun e!77529 () Bool)

(assert (=> b!118314 (= e!77528 e!77529)))

(declare-fun res!97888 () Bool)

(assert (=> b!118314 (=> res!97888 e!77529)))

(assert (=> b!118314 (= res!97888 (= (size!2406 (buf!2822 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!118315 () Bool)

(assert (=> b!118315 (= e!77529 (arrayBitRangesEq!0 (buf!2822 thiss!1305) (buf!2822 (_2!5201 lt!181091)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2406 (buf!2822 thiss!1305)) (currentByte!5471 thiss!1305) (currentBit!5466 thiss!1305))))))

(assert (= (and d!37878 res!97889) b!118313))

(assert (= (and b!118313 res!97890) b!118314))

(assert (= (and b!118314 (not res!97888)) b!118315))

(assert (=> b!118313 m!177091))

(assert (=> b!118313 m!177089))

(assert (=> b!118315 m!177091))

(assert (=> b!118315 m!177091))

(declare-fun m!177683 () Bool)

(assert (=> b!118315 m!177683))

(assert (=> b!117998 d!37878))

(declare-fun d!37880 () Bool)

(assert (=> d!37880 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2406 (buf!2822 (_1!5203 lt!181083)))) ((_ sign_extend 32) (currentByte!5471 (_1!5203 lt!181083))) ((_ sign_extend 32) (currentBit!5466 (_1!5203 lt!181083))) lt!181089) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2406 (buf!2822 (_1!5203 lt!181083)))) ((_ sign_extend 32) (currentByte!5471 (_1!5203 lt!181083))) ((_ sign_extend 32) (currentBit!5466 (_1!5203 lt!181083)))) lt!181089))))

(declare-fun bs!9162 () Bool)

(assert (= bs!9162 d!37880))

(declare-fun m!177695 () Bool)

(assert (=> bs!9162 m!177695))

(assert (=> b!118000 d!37880))

(push 1)

(assert (not b!118097))

(assert (not b!118077))

(assert (not d!37864))

(assert (not b!118137))

(assert (not d!37798))

(assert (not b!118267))

(assert (not b!118315))

(assert (not d!37746))

(assert (not b!118138))

(assert (not d!37768))

(assert (not b!118313))

(assert (not b!118100))

(assert (not d!37870))

(assert (not d!37874))

(assert (not b!118075))

(assert (not b!118309))

(assert (not b!118273))

(assert (not d!37872))

(assert (not b!118264))

(assert (not d!37868))

(assert (not b!118271))

(assert (not b!118099))

(assert (not d!37756))

(assert (not d!37778))

(assert (not b!118265))

(assert (not b!118312))

(assert (not b!118269))

(assert (not d!37856))

(assert (not d!37796))

(assert (not d!37762))

(assert (not d!37752))

(assert (not d!37858))

(assert (not b!118135))

(assert (not b!118311))

(assert (not b!118275))

(assert (not b!118057))

(assert (not bm!1529))

(assert (not d!37766))

(assert (not d!37880))

(assert (not b!118270))

(assert (not d!37750))

(assert (not b!118134))

(assert (not b!118098))

(assert (not d!37800))

(assert (not d!37854))

(assert (not d!37862))

(assert (not d!37860))

(assert (not b!118308))

(assert (not d!37794))

(assert (not d!37772))

(assert (not b!118274))

(check-sat)

(pop 1)

(push 1)

(check-sat)

