; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23330 () Bool)

(assert start!23330)

(declare-fun b!118468 () Bool)

(declare-fun e!77644 () Bool)

(declare-datatypes ((array!5315 0))(
  ( (array!5316 (arr!3003 (Array (_ BitVec 32) (_ BitVec 8))) (size!2410 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4294 0))(
  ( (BitStream!4295 (buf!2829 array!5315) (currentByte!5484 (_ BitVec 32)) (currentBit!5479 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!9916 0))(
  ( (tuple2!9917 (_1!5223 BitStream!4294) (_2!5223 Bool)) )
))
(declare-fun lt!182245 () tuple2!9916)

(declare-fun lt!182249 () tuple2!9916)

(assert (=> b!118468 (= e!77644 (= (_2!5223 lt!182245) (_2!5223 lt!182249)))))

(declare-fun b!118469 () Bool)

(declare-fun e!77645 () Bool)

(declare-fun thiss!1305 () BitStream!4294)

(declare-datatypes ((Unit!7291 0))(
  ( (Unit!7292) )
))
(declare-datatypes ((tuple2!9918 0))(
  ( (tuple2!9919 (_1!5224 Unit!7291) (_2!5224 BitStream!4294)) )
))
(declare-fun lt!182237 () tuple2!9918)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!118469 (= e!77645 (invariant!0 (currentBit!5479 thiss!1305) (currentByte!5484 thiss!1305) (size!2410 (buf!2829 (_2!5224 lt!182237)))))))

(declare-fun b!118470 () Bool)

(declare-fun res!98041 () Bool)

(declare-fun e!77651 () Bool)

(assert (=> b!118470 (=> res!98041 e!77651)))

(declare-datatypes ((tuple2!9920 0))(
  ( (tuple2!9921 (_1!5225 BitStream!4294) (_2!5225 BitStream!4294)) )
))
(declare-fun lt!182236 () tuple2!9920)

(declare-fun lt!182247 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!118470 (= res!98041 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2410 (buf!2829 (_1!5225 lt!182236)))) ((_ sign_extend 32) (currentByte!5484 (_1!5225 lt!182236))) ((_ sign_extend 32) (currentBit!5479 (_1!5225 lt!182236))) lt!182247)))))

(declare-fun b!118471 () Bool)

(declare-fun res!98038 () Bool)

(declare-fun e!77652 () Bool)

(assert (=> b!118471 (=> (not res!98038) (not e!77652))))

(declare-fun lt!182244 () tuple2!9918)

(declare-fun isPrefixOf!0 (BitStream!4294 BitStream!4294) Bool)

(assert (=> b!118471 (= res!98038 (isPrefixOf!0 thiss!1305 (_2!5224 lt!182244)))))

(declare-fun b!118472 () Bool)

(declare-fun lt!182248 () (_ BitVec 64))

(declare-fun lt!182240 () (_ BitVec 64))

(declare-fun lt!182246 () (_ BitVec 64))

(assert (=> b!118472 (= e!77651 (or (not (= (bvand lt!182248 lt!182246) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!182248 lt!182240) lt!182248)))))

(declare-fun b!118473 () Bool)

(declare-fun e!77646 () Bool)

(declare-fun lt!182242 () tuple2!9916)

(declare-fun lt!182232 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!118473 (= e!77646 (= (bitIndex!0 (size!2410 (buf!2829 (_1!5223 lt!182242))) (currentByte!5484 (_1!5223 lt!182242)) (currentBit!5479 (_1!5223 lt!182242))) lt!182232))))

(declare-fun b!118474 () Bool)

(assert (=> b!118474 (= e!77652 e!77646)))

(declare-fun res!98032 () Bool)

(assert (=> b!118474 (=> (not res!98032) (not e!77646))))

(declare-fun lt!182231 () Bool)

(assert (=> b!118474 (= res!98032 (and (= (_2!5223 lt!182242) lt!182231) (= (_1!5223 lt!182242) (_2!5224 lt!182244))))))

(declare-fun readBitPure!0 (BitStream!4294) tuple2!9916)

(declare-fun readerFrom!0 (BitStream!4294 (_ BitVec 32) (_ BitVec 32)) BitStream!4294)

(assert (=> b!118474 (= lt!182242 (readBitPure!0 (readerFrom!0 (_2!5224 lt!182244) (currentBit!5479 thiss!1305) (currentByte!5484 thiss!1305))))))

(declare-fun res!98034 () Bool)

(declare-fun e!77642 () Bool)

(assert (=> start!23330 (=> (not res!98034) (not e!77642))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!23330 (= res!98034 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23330 e!77642))

(assert (=> start!23330 true))

(declare-fun e!77649 () Bool)

(declare-fun inv!12 (BitStream!4294) Bool)

(assert (=> start!23330 (and (inv!12 thiss!1305) e!77649)))

(declare-fun b!118475 () Bool)

(declare-fun e!77650 () Bool)

(assert (=> b!118475 (= e!77642 e!77650)))

(declare-fun res!98037 () Bool)

(assert (=> b!118475 (=> (not res!98037) (not e!77650))))

(assert (=> b!118475 (= res!98037 (validate_offset_bits!1 ((_ sign_extend 32) (size!2410 (buf!2829 thiss!1305))) ((_ sign_extend 32) (currentByte!5484 thiss!1305)) ((_ sign_extend 32) (currentBit!5479 thiss!1305)) lt!182247))))

(assert (=> b!118475 (= lt!182247 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!118476 () Bool)

(declare-fun res!98043 () Bool)

(assert (=> b!118476 (=> (not res!98043) (not e!77645))))

(assert (=> b!118476 (= res!98043 (invariant!0 (currentBit!5479 thiss!1305) (currentByte!5484 thiss!1305) (size!2410 (buf!2829 (_2!5224 lt!182244)))))))

(declare-fun b!118477 () Bool)

(declare-fun array_inv!2212 (array!5315) Bool)

(assert (=> b!118477 (= e!77649 (array_inv!2212 (buf!2829 thiss!1305)))))

(declare-fun b!118478 () Bool)

(declare-fun e!77643 () Bool)

(assert (=> b!118478 (= e!77643 (not e!77651))))

(declare-fun res!98036 () Bool)

(assert (=> b!118478 (=> res!98036 e!77651)))

(declare-fun lt!182234 () tuple2!9920)

(declare-fun lt!182243 () tuple2!9916)

(declare-fun lt!182252 () (_ BitVec 64))

(declare-datatypes ((tuple2!9922 0))(
  ( (tuple2!9923 (_1!5226 BitStream!4294) (_2!5226 (_ BitVec 64))) )
))
(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4294 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9922)

(assert (=> b!118478 (= res!98036 (not (= (_1!5226 (readNLeastSignificantBitsLoopPure!0 (_1!5225 lt!182234) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) (bvor lt!182248 (ite (_2!5223 lt!182243) lt!182252 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5225 lt!182234))))))

(declare-fun lt!182250 () (_ BitVec 64))

(assert (=> b!118478 (validate_offset_bits!1 ((_ sign_extend 32) (size!2410 (buf!2829 (_2!5224 lt!182237)))) ((_ sign_extend 32) (currentByte!5484 (_2!5224 lt!182244))) ((_ sign_extend 32) (currentBit!5479 (_2!5224 lt!182244))) lt!182250)))

(declare-fun lt!182239 () Unit!7291)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4294 array!5315 (_ BitVec 64)) Unit!7291)

(assert (=> b!118478 (= lt!182239 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5224 lt!182244) (buf!2829 (_2!5224 lt!182237)) lt!182250))))

(assert (=> b!118478 (= lt!182250 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!182251 () tuple2!9922)

(assert (=> b!118478 (= lt!182251 (readNLeastSignificantBitsLoopPure!0 (_1!5225 lt!182236) nBits!396 i!615 lt!182248))))

(assert (=> b!118478 (validate_offset_bits!1 ((_ sign_extend 32) (size!2410 (buf!2829 (_2!5224 lt!182237)))) ((_ sign_extend 32) (currentByte!5484 thiss!1305)) ((_ sign_extend 32) (currentBit!5479 thiss!1305)) lt!182247)))

(declare-fun lt!182238 () Unit!7291)

(assert (=> b!118478 (= lt!182238 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2829 (_2!5224 lt!182237)) lt!182247))))

(declare-fun v!199 () (_ BitVec 64))

(assert (=> b!118478 (= lt!182248 (bvand v!199 (bvnot lt!182246)))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!118478 (= lt!182246 (onesLSBLong!0 (bvsub nBits!396 i!615)))))

(assert (=> b!118478 (= (_2!5223 lt!182243) lt!182231)))

(assert (=> b!118478 (= lt!182243 (readBitPure!0 (_1!5225 lt!182236)))))

(declare-fun reader!0 (BitStream!4294 BitStream!4294) tuple2!9920)

(assert (=> b!118478 (= lt!182234 (reader!0 (_2!5224 lt!182244) (_2!5224 lt!182237)))))

(assert (=> b!118478 (= lt!182236 (reader!0 thiss!1305 (_2!5224 lt!182237)))))

(assert (=> b!118478 e!77644))

(declare-fun res!98042 () Bool)

(assert (=> b!118478 (=> (not res!98042) (not e!77644))))

(assert (=> b!118478 (= res!98042 (= (bitIndex!0 (size!2410 (buf!2829 (_1!5223 lt!182245))) (currentByte!5484 (_1!5223 lt!182245)) (currentBit!5479 (_1!5223 lt!182245))) (bitIndex!0 (size!2410 (buf!2829 (_1!5223 lt!182249))) (currentByte!5484 (_1!5223 lt!182249)) (currentBit!5479 (_1!5223 lt!182249)))))))

(declare-fun lt!182235 () Unit!7291)

(declare-fun lt!182241 () BitStream!4294)

(declare-fun readBitPrefixLemma!0 (BitStream!4294 BitStream!4294) Unit!7291)

(assert (=> b!118478 (= lt!182235 (readBitPrefixLemma!0 lt!182241 (_2!5224 lt!182237)))))

(assert (=> b!118478 (= lt!182249 (readBitPure!0 (BitStream!4295 (buf!2829 (_2!5224 lt!182237)) (currentByte!5484 thiss!1305) (currentBit!5479 thiss!1305))))))

(assert (=> b!118478 (= lt!182245 (readBitPure!0 lt!182241))))

(assert (=> b!118478 (= lt!182241 (BitStream!4295 (buf!2829 (_2!5224 lt!182244)) (currentByte!5484 thiss!1305) (currentBit!5479 thiss!1305)))))

(assert (=> b!118478 e!77645))

(declare-fun res!98035 () Bool)

(assert (=> b!118478 (=> (not res!98035) (not e!77645))))

(assert (=> b!118478 (= res!98035 (isPrefixOf!0 thiss!1305 (_2!5224 lt!182237)))))

(declare-fun lt!182253 () Unit!7291)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4294 BitStream!4294 BitStream!4294) Unit!7291)

(assert (=> b!118478 (= lt!182253 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5224 lt!182244) (_2!5224 lt!182237)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4294 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9918)

(assert (=> b!118478 (= lt!182237 (appendNLeastSignificantBitsLoop!0 (_2!5224 lt!182244) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!77648 () Bool)

(assert (=> b!118478 e!77648))

(declare-fun res!98040 () Bool)

(assert (=> b!118478 (=> (not res!98040) (not e!77648))))

(assert (=> b!118478 (= res!98040 (= (size!2410 (buf!2829 thiss!1305)) (size!2410 (buf!2829 (_2!5224 lt!182244)))))))

(declare-fun appendBit!0 (BitStream!4294 Bool) tuple2!9918)

(assert (=> b!118478 (= lt!182244 (appendBit!0 thiss!1305 lt!182231))))

(assert (=> b!118478 (= lt!182231 (not (= (bvand v!199 lt!182252) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118478 (= lt!182252 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!118479 () Bool)

(assert (=> b!118479 (= e!77650 e!77643)))

(declare-fun res!98033 () Bool)

(assert (=> b!118479 (=> (not res!98033) (not e!77643))))

(assert (=> b!118479 (= res!98033 (and (= (bvand v!199 lt!182240) v!199) (bvslt i!615 nBits!396)))))

(assert (=> b!118479 (= lt!182240 (onesLSBLong!0 nBits!396))))

(declare-fun b!118480 () Bool)

(assert (=> b!118480 (= e!77648 e!77652)))

(declare-fun res!98039 () Bool)

(assert (=> b!118480 (=> (not res!98039) (not e!77652))))

(declare-fun lt!182233 () (_ BitVec 64))

(assert (=> b!118480 (= res!98039 (= lt!182232 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!182233)))))

(assert (=> b!118480 (= lt!182232 (bitIndex!0 (size!2410 (buf!2829 (_2!5224 lt!182244))) (currentByte!5484 (_2!5224 lt!182244)) (currentBit!5479 (_2!5224 lt!182244))))))

(assert (=> b!118480 (= lt!182233 (bitIndex!0 (size!2410 (buf!2829 thiss!1305)) (currentByte!5484 thiss!1305) (currentBit!5479 thiss!1305)))))

(assert (= (and start!23330 res!98034) b!118475))

(assert (= (and b!118475 res!98037) b!118479))

(assert (= (and b!118479 res!98033) b!118478))

(assert (= (and b!118478 res!98040) b!118480))

(assert (= (and b!118480 res!98039) b!118471))

(assert (= (and b!118471 res!98038) b!118474))

(assert (= (and b!118474 res!98032) b!118473))

(assert (= (and b!118478 res!98035) b!118476))

(assert (= (and b!118476 res!98043) b!118469))

(assert (= (and b!118478 res!98042) b!118468))

(assert (= (and b!118478 (not res!98036)) b!118470))

(assert (= (and b!118470 (not res!98041)) b!118472))

(assert (= start!23330 b!118477))

(declare-fun m!177965 () Bool)

(assert (=> start!23330 m!177965))

(declare-fun m!177967 () Bool)

(assert (=> b!118474 m!177967))

(assert (=> b!118474 m!177967))

(declare-fun m!177969 () Bool)

(assert (=> b!118474 m!177969))

(declare-fun m!177971 () Bool)

(assert (=> b!118476 m!177971))

(declare-fun m!177973 () Bool)

(assert (=> b!118469 m!177973))

(declare-fun m!177975 () Bool)

(assert (=> b!118475 m!177975))

(declare-fun m!177977 () Bool)

(assert (=> b!118478 m!177977))

(declare-fun m!177979 () Bool)

(assert (=> b!118478 m!177979))

(declare-fun m!177981 () Bool)

(assert (=> b!118478 m!177981))

(declare-fun m!177983 () Bool)

(assert (=> b!118478 m!177983))

(declare-fun m!177985 () Bool)

(assert (=> b!118478 m!177985))

(declare-fun m!177987 () Bool)

(assert (=> b!118478 m!177987))

(declare-fun m!177989 () Bool)

(assert (=> b!118478 m!177989))

(declare-fun m!177991 () Bool)

(assert (=> b!118478 m!177991))

(declare-fun m!177993 () Bool)

(assert (=> b!118478 m!177993))

(declare-fun m!177995 () Bool)

(assert (=> b!118478 m!177995))

(declare-fun m!177997 () Bool)

(assert (=> b!118478 m!177997))

(declare-fun m!177999 () Bool)

(assert (=> b!118478 m!177999))

(declare-fun m!178001 () Bool)

(assert (=> b!118478 m!178001))

(declare-fun m!178003 () Bool)

(assert (=> b!118478 m!178003))

(declare-fun m!178005 () Bool)

(assert (=> b!118478 m!178005))

(declare-fun m!178007 () Bool)

(assert (=> b!118478 m!178007))

(declare-fun m!178009 () Bool)

(assert (=> b!118478 m!178009))

(declare-fun m!178011 () Bool)

(assert (=> b!118478 m!178011))

(declare-fun m!178013 () Bool)

(assert (=> b!118478 m!178013))

(declare-fun m!178015 () Bool)

(assert (=> b!118473 m!178015))

(declare-fun m!178017 () Bool)

(assert (=> b!118470 m!178017))

(declare-fun m!178019 () Bool)

(assert (=> b!118480 m!178019))

(declare-fun m!178021 () Bool)

(assert (=> b!118480 m!178021))

(declare-fun m!178023 () Bool)

(assert (=> b!118471 m!178023))

(declare-fun m!178025 () Bool)

(assert (=> b!118477 m!178025))

(declare-fun m!178027 () Bool)

(assert (=> b!118479 m!178027))

(push 1)

(assert (not b!118471))

(assert (not b!118480))

(assert (not b!118476))

(assert (not b!118478))

(assert (not b!118479))

(assert (not b!118475))

(assert (not b!118473))

(assert (not b!118470))

(assert (not start!23330))

(assert (not b!118469))

(assert (not b!118477))

(assert (not b!118474))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

