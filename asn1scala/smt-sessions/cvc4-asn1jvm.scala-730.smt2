; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20360 () Bool)

(assert start!20360)

(declare-fun b!102462 () Bool)

(declare-fun e!67052 () Bool)

(declare-datatypes ((array!4804 0))(
  ( (array!4805 (arr!2786 (Array (_ BitVec 32) (_ BitVec 8))) (size!2193 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3860 0))(
  ( (BitStream!3861 (buf!2553 array!4804) (currentByte!5026 (_ BitVec 32)) (currentBit!5021 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8366 0))(
  ( (tuple2!8367 (_1!4438 BitStream!3860) (_2!4438 Bool)) )
))
(declare-fun lt!149029 () tuple2!8366)

(declare-fun lt!149041 () tuple2!8366)

(assert (=> b!102462 (= e!67052 (= (_2!4438 lt!149029) (_2!4438 lt!149041)))))

(declare-fun b!102463 () Bool)

(declare-fun e!67051 () Bool)

(declare-fun lt!149034 () tuple2!8366)

(declare-fun lt!149032 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!102463 (= e!67051 (= (bitIndex!0 (size!2193 (buf!2553 (_1!4438 lt!149034))) (currentByte!5026 (_1!4438 lt!149034)) (currentBit!5021 (_1!4438 lt!149034))) lt!149032))))

(declare-fun b!102464 () Bool)

(declare-fun e!67055 () Bool)

(declare-fun thiss!1305 () BitStream!3860)

(declare-fun array_inv!1995 (array!4804) Bool)

(assert (=> b!102464 (= e!67055 (array_inv!1995 (buf!2553 thiss!1305)))))

(declare-fun b!102466 () Bool)

(declare-fun e!67049 () Bool)

(declare-fun e!67050 () Bool)

(assert (=> b!102466 (= e!67049 e!67050)))

(declare-fun res!84262 () Bool)

(assert (=> b!102466 (=> (not res!84262) (not e!67050))))

(declare-fun lt!149040 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!102466 (= res!84262 (validate_offset_bits!1 ((_ sign_extend 32) (size!2193 (buf!2553 thiss!1305))) ((_ sign_extend 32) (currentByte!5026 thiss!1305)) ((_ sign_extend 32) (currentBit!5021 thiss!1305)) lt!149040))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!102466 (= lt!149040 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!102467 () Bool)

(declare-fun res!84263 () Bool)

(assert (=> b!102467 (=> (not res!84263) (not e!67050))))

(assert (=> b!102467 (= res!84263 (bvslt i!615 nBits!396))))

(declare-fun b!102468 () Bool)

(declare-fun e!67056 () Bool)

(declare-datatypes ((Unit!6282 0))(
  ( (Unit!6283) )
))
(declare-datatypes ((tuple2!8368 0))(
  ( (tuple2!8369 (_1!4439 Unit!6282) (_2!4439 BitStream!3860)) )
))
(declare-fun lt!149037 () tuple2!8368)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!102468 (= e!67056 (invariant!0 (currentBit!5021 thiss!1305) (currentByte!5026 thiss!1305) (size!2193 (buf!2553 (_2!4439 lt!149037)))))))

(declare-fun b!102469 () Bool)

(assert (=> b!102469 (= e!67050 (not true))))

(declare-fun v!199 () (_ BitVec 64))

(declare-datatypes ((tuple2!8370 0))(
  ( (tuple2!8371 (_1!4440 BitStream!3860) (_2!4440 BitStream!3860)) )
))
(declare-fun lt!149044 () tuple2!8370)

(declare-datatypes ((tuple2!8372 0))(
  ( (tuple2!8373 (_1!4441 BitStream!3860) (_2!4441 (_ BitVec 64))) )
))
(declare-fun lt!149035 () tuple2!8372)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3860 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8372)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!102469 (= lt!149035 (readNLeastSignificantBitsLoopPure!0 (_1!4440 lt!149044) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(assert (=> b!102469 (validate_offset_bits!1 ((_ sign_extend 32) (size!2193 (buf!2553 (_2!4439 lt!149037)))) ((_ sign_extend 32) (currentByte!5026 thiss!1305)) ((_ sign_extend 32) (currentBit!5021 thiss!1305)) lt!149040)))

(declare-fun lt!149033 () Unit!6282)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3860 array!4804 (_ BitVec 64)) Unit!6282)

(assert (=> b!102469 (= lt!149033 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2553 (_2!4439 lt!149037)) lt!149040))))

(declare-fun lt!149036 () Bool)

(declare-fun readBitPure!0 (BitStream!3860) tuple2!8366)

(assert (=> b!102469 (= (_2!4438 (readBitPure!0 (_1!4440 lt!149044))) lt!149036)))

(declare-fun lt!149043 () tuple2!8370)

(declare-fun lt!149031 () tuple2!8368)

(declare-fun reader!0 (BitStream!3860 BitStream!3860) tuple2!8370)

(assert (=> b!102469 (= lt!149043 (reader!0 (_2!4439 lt!149031) (_2!4439 lt!149037)))))

(assert (=> b!102469 (= lt!149044 (reader!0 thiss!1305 (_2!4439 lt!149037)))))

(assert (=> b!102469 e!67052))

(declare-fun res!84257 () Bool)

(assert (=> b!102469 (=> (not res!84257) (not e!67052))))

(assert (=> b!102469 (= res!84257 (= (bitIndex!0 (size!2193 (buf!2553 (_1!4438 lt!149029))) (currentByte!5026 (_1!4438 lt!149029)) (currentBit!5021 (_1!4438 lt!149029))) (bitIndex!0 (size!2193 (buf!2553 (_1!4438 lt!149041))) (currentByte!5026 (_1!4438 lt!149041)) (currentBit!5021 (_1!4438 lt!149041)))))))

(declare-fun lt!149042 () Unit!6282)

(declare-fun lt!149039 () BitStream!3860)

(declare-fun readBitPrefixLemma!0 (BitStream!3860 BitStream!3860) Unit!6282)

(assert (=> b!102469 (= lt!149042 (readBitPrefixLemma!0 lt!149039 (_2!4439 lt!149037)))))

(assert (=> b!102469 (= lt!149041 (readBitPure!0 (BitStream!3861 (buf!2553 (_2!4439 lt!149037)) (currentByte!5026 thiss!1305) (currentBit!5021 thiss!1305))))))

(assert (=> b!102469 (= lt!149029 (readBitPure!0 lt!149039))))

(assert (=> b!102469 (= lt!149039 (BitStream!3861 (buf!2553 (_2!4439 lt!149031)) (currentByte!5026 thiss!1305) (currentBit!5021 thiss!1305)))))

(assert (=> b!102469 e!67056))

(declare-fun res!84260 () Bool)

(assert (=> b!102469 (=> (not res!84260) (not e!67056))))

(declare-fun isPrefixOf!0 (BitStream!3860 BitStream!3860) Bool)

(assert (=> b!102469 (= res!84260 (isPrefixOf!0 thiss!1305 (_2!4439 lt!149037)))))

(declare-fun lt!149038 () Unit!6282)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3860 BitStream!3860 BitStream!3860) Unit!6282)

(assert (=> b!102469 (= lt!149038 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4439 lt!149031) (_2!4439 lt!149037)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3860 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8368)

(assert (=> b!102469 (= lt!149037 (appendNLeastSignificantBitsLoop!0 (_2!4439 lt!149031) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!67054 () Bool)

(assert (=> b!102469 e!67054))

(declare-fun res!84254 () Bool)

(assert (=> b!102469 (=> (not res!84254) (not e!67054))))

(assert (=> b!102469 (= res!84254 (= (size!2193 (buf!2553 thiss!1305)) (size!2193 (buf!2553 (_2!4439 lt!149031)))))))

(declare-fun appendBit!0 (BitStream!3860 Bool) tuple2!8368)

(assert (=> b!102469 (= lt!149031 (appendBit!0 thiss!1305 lt!149036))))

(assert (=> b!102469 (= lt!149036 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!102470 () Bool)

(declare-fun res!84253 () Bool)

(assert (=> b!102470 (=> (not res!84253) (not e!67056))))

(assert (=> b!102470 (= res!84253 (invariant!0 (currentBit!5021 thiss!1305) (currentByte!5026 thiss!1305) (size!2193 (buf!2553 (_2!4439 lt!149031)))))))

(declare-fun b!102471 () Bool)

(declare-fun e!67048 () Bool)

(assert (=> b!102471 (= e!67054 e!67048)))

(declare-fun res!84261 () Bool)

(assert (=> b!102471 (=> (not res!84261) (not e!67048))))

(declare-fun lt!149030 () (_ BitVec 64))

(assert (=> b!102471 (= res!84261 (= lt!149032 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!149030)))))

(assert (=> b!102471 (= lt!149032 (bitIndex!0 (size!2193 (buf!2553 (_2!4439 lt!149031))) (currentByte!5026 (_2!4439 lt!149031)) (currentBit!5021 (_2!4439 lt!149031))))))

(assert (=> b!102471 (= lt!149030 (bitIndex!0 (size!2193 (buf!2553 thiss!1305)) (currentByte!5026 thiss!1305) (currentBit!5021 thiss!1305)))))

(declare-fun res!84256 () Bool)

(assert (=> start!20360 (=> (not res!84256) (not e!67049))))

(assert (=> start!20360 (= res!84256 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20360 e!67049))

(assert (=> start!20360 true))

(declare-fun inv!12 (BitStream!3860) Bool)

(assert (=> start!20360 (and (inv!12 thiss!1305) e!67055)))

(declare-fun b!102465 () Bool)

(assert (=> b!102465 (= e!67048 e!67051)))

(declare-fun res!84255 () Bool)

(assert (=> b!102465 (=> (not res!84255) (not e!67051))))

(assert (=> b!102465 (= res!84255 (and (= (_2!4438 lt!149034) lt!149036) (= (_1!4438 lt!149034) (_2!4439 lt!149031))))))

(declare-fun readerFrom!0 (BitStream!3860 (_ BitVec 32) (_ BitVec 32)) BitStream!3860)

(assert (=> b!102465 (= lt!149034 (readBitPure!0 (readerFrom!0 (_2!4439 lt!149031) (currentBit!5021 thiss!1305) (currentByte!5026 thiss!1305))))))

(declare-fun b!102472 () Bool)

(declare-fun res!84258 () Bool)

(assert (=> b!102472 (=> (not res!84258) (not e!67050))))

(assert (=> b!102472 (= res!84258 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!102473 () Bool)

(declare-fun res!84259 () Bool)

(assert (=> b!102473 (=> (not res!84259) (not e!67048))))

(assert (=> b!102473 (= res!84259 (isPrefixOf!0 thiss!1305 (_2!4439 lt!149031)))))

(assert (= (and start!20360 res!84256) b!102466))

(assert (= (and b!102466 res!84262) b!102472))

(assert (= (and b!102472 res!84258) b!102467))

(assert (= (and b!102467 res!84263) b!102469))

(assert (= (and b!102469 res!84254) b!102471))

(assert (= (and b!102471 res!84261) b!102473))

(assert (= (and b!102473 res!84259) b!102465))

(assert (= (and b!102465 res!84255) b!102463))

(assert (= (and b!102469 res!84260) b!102470))

(assert (= (and b!102470 res!84253) b!102468))

(assert (= (and b!102469 res!84257) b!102462))

(assert (= start!20360 b!102464))

(declare-fun m!149219 () Bool)

(assert (=> b!102469 m!149219))

(declare-fun m!149221 () Bool)

(assert (=> b!102469 m!149221))

(declare-fun m!149223 () Bool)

(assert (=> b!102469 m!149223))

(declare-fun m!149225 () Bool)

(assert (=> b!102469 m!149225))

(declare-fun m!149227 () Bool)

(assert (=> b!102469 m!149227))

(declare-fun m!149229 () Bool)

(assert (=> b!102469 m!149229))

(declare-fun m!149231 () Bool)

(assert (=> b!102469 m!149231))

(declare-fun m!149233 () Bool)

(assert (=> b!102469 m!149233))

(declare-fun m!149235 () Bool)

(assert (=> b!102469 m!149235))

(declare-fun m!149237 () Bool)

(assert (=> b!102469 m!149237))

(declare-fun m!149239 () Bool)

(assert (=> b!102469 m!149239))

(declare-fun m!149241 () Bool)

(assert (=> b!102469 m!149241))

(declare-fun m!149243 () Bool)

(assert (=> b!102469 m!149243))

(declare-fun m!149245 () Bool)

(assert (=> b!102469 m!149245))

(declare-fun m!149247 () Bool)

(assert (=> b!102469 m!149247))

(declare-fun m!149249 () Bool)

(assert (=> b!102469 m!149249))

(declare-fun m!149251 () Bool)

(assert (=> b!102473 m!149251))

(declare-fun m!149253 () Bool)

(assert (=> b!102464 m!149253))

(declare-fun m!149255 () Bool)

(assert (=> b!102465 m!149255))

(assert (=> b!102465 m!149255))

(declare-fun m!149257 () Bool)

(assert (=> b!102465 m!149257))

(declare-fun m!149259 () Bool)

(assert (=> b!102472 m!149259))

(declare-fun m!149261 () Bool)

(assert (=> b!102470 m!149261))

(declare-fun m!149263 () Bool)

(assert (=> b!102463 m!149263))

(declare-fun m!149265 () Bool)

(assert (=> b!102468 m!149265))

(declare-fun m!149267 () Bool)

(assert (=> start!20360 m!149267))

(declare-fun m!149269 () Bool)

(assert (=> b!102471 m!149269))

(declare-fun m!149271 () Bool)

(assert (=> b!102471 m!149271))

(declare-fun m!149273 () Bool)

(assert (=> b!102466 m!149273))

(push 1)

(assert (not b!102470))

(assert (not b!102464))

(assert (not b!102469))

(assert (not b!102465))

(assert (not b!102473))

(assert (not start!20360))

(assert (not b!102463))

(assert (not b!102471))

(assert (not b!102466))

(assert (not b!102472))

(assert (not b!102468))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

