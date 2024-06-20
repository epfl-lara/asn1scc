; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23920 () Bool)

(assert start!23920)

(declare-fun b!121110 () Bool)

(declare-fun e!79336 () Bool)

(declare-fun e!79341 () Bool)

(assert (=> b!121110 (= e!79336 (not e!79341))))

(declare-fun res!100311 () Bool)

(assert (=> b!121110 (=> res!100311 e!79341)))

(declare-datatypes ((array!5380 0))(
  ( (array!5381 (arr!3028 (Array (_ BitVec 32) (_ BitVec 8))) (size!2435 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4344 0))(
  ( (BitStream!4345 (buf!2869 array!5380) (currentByte!5554 (_ BitVec 32)) (currentBit!5549 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!10176 0))(
  ( (tuple2!10177 (_1!5353 BitStream!4344) (_2!5353 (_ BitVec 64))) )
))
(declare-fun lt!189221 () tuple2!10176)

(declare-datatypes ((tuple2!10178 0))(
  ( (tuple2!10179 (_1!5354 BitStream!4344) (_2!5354 BitStream!4344)) )
))
(declare-fun lt!189224 () tuple2!10178)

(assert (=> b!121110 (= res!100311 (not (= (_1!5353 lt!189221) (_2!5354 lt!189224))))))

(declare-fun lt!189232 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4344 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10176)

(assert (=> b!121110 (= lt!189221 (readNLeastSignificantBitsLoopPure!0 (_1!5354 lt!189224) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!189232))))

(declare-datatypes ((Unit!7461 0))(
  ( (Unit!7462) )
))
(declare-datatypes ((tuple2!10180 0))(
  ( (tuple2!10181 (_1!5355 Unit!7461) (_2!5355 BitStream!4344)) )
))
(declare-fun lt!189220 () tuple2!10180)

(declare-fun lt!189212 () tuple2!10180)

(declare-fun lt!189218 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!121110 (validate_offset_bits!1 ((_ sign_extend 32) (size!2435 (buf!2869 (_2!5355 lt!189220)))) ((_ sign_extend 32) (currentByte!5554 (_2!5355 lt!189212))) ((_ sign_extend 32) (currentBit!5549 (_2!5355 lt!189212))) lt!189218)))

(declare-fun lt!189219 () Unit!7461)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4344 array!5380 (_ BitVec 64)) Unit!7461)

(assert (=> b!121110 (= lt!189219 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5355 lt!189212) (buf!2869 (_2!5355 lt!189220)) lt!189218))))

(assert (=> b!121110 (= lt!189218 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!10182 0))(
  ( (tuple2!10183 (_1!5356 BitStream!4344) (_2!5356 Bool)) )
))
(declare-fun lt!189210 () tuple2!10182)

(declare-fun lt!189230 () (_ BitVec 64))

(declare-fun lt!189227 () (_ BitVec 64))

(assert (=> b!121110 (= lt!189232 (bvor lt!189227 (ite (_2!5356 lt!189210) lt!189230 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!189233 () tuple2!10178)

(declare-fun lt!189214 () tuple2!10176)

(assert (=> b!121110 (= lt!189214 (readNLeastSignificantBitsLoopPure!0 (_1!5354 lt!189233) nBits!396 i!615 lt!189227))))

(declare-fun thiss!1305 () BitStream!4344)

(declare-fun lt!189211 () (_ BitVec 64))

(assert (=> b!121110 (validate_offset_bits!1 ((_ sign_extend 32) (size!2435 (buf!2869 (_2!5355 lt!189220)))) ((_ sign_extend 32) (currentByte!5554 thiss!1305)) ((_ sign_extend 32) (currentBit!5549 thiss!1305)) lt!189211)))

(declare-fun lt!189226 () Unit!7461)

(assert (=> b!121110 (= lt!189226 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2869 (_2!5355 lt!189220)) lt!189211))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!121110 (= lt!189227 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!189216 () Bool)

(assert (=> b!121110 (= (_2!5356 lt!189210) lt!189216)))

(declare-fun readBitPure!0 (BitStream!4344) tuple2!10182)

(assert (=> b!121110 (= lt!189210 (readBitPure!0 (_1!5354 lt!189233)))))

(declare-fun reader!0 (BitStream!4344 BitStream!4344) tuple2!10178)

(assert (=> b!121110 (= lt!189224 (reader!0 (_2!5355 lt!189212) (_2!5355 lt!189220)))))

(assert (=> b!121110 (= lt!189233 (reader!0 thiss!1305 (_2!5355 lt!189220)))))

(declare-fun e!79334 () Bool)

(assert (=> b!121110 e!79334))

(declare-fun res!100301 () Bool)

(assert (=> b!121110 (=> (not res!100301) (not e!79334))))

(declare-fun lt!189213 () tuple2!10182)

(declare-fun lt!189222 () tuple2!10182)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!121110 (= res!100301 (= (bitIndex!0 (size!2435 (buf!2869 (_1!5356 lt!189213))) (currentByte!5554 (_1!5356 lt!189213)) (currentBit!5549 (_1!5356 lt!189213))) (bitIndex!0 (size!2435 (buf!2869 (_1!5356 lt!189222))) (currentByte!5554 (_1!5356 lt!189222)) (currentBit!5549 (_1!5356 lt!189222)))))))

(declare-fun lt!189223 () Unit!7461)

(declare-fun lt!189215 () BitStream!4344)

(declare-fun readBitPrefixLemma!0 (BitStream!4344 BitStream!4344) Unit!7461)

(assert (=> b!121110 (= lt!189223 (readBitPrefixLemma!0 lt!189215 (_2!5355 lt!189220)))))

(assert (=> b!121110 (= lt!189222 (readBitPure!0 (BitStream!4345 (buf!2869 (_2!5355 lt!189220)) (currentByte!5554 thiss!1305) (currentBit!5549 thiss!1305))))))

(assert (=> b!121110 (= lt!189213 (readBitPure!0 lt!189215))))

(assert (=> b!121110 (= lt!189215 (BitStream!4345 (buf!2869 (_2!5355 lt!189212)) (currentByte!5554 thiss!1305) (currentBit!5549 thiss!1305)))))

(declare-fun e!79337 () Bool)

(assert (=> b!121110 e!79337))

(declare-fun res!100306 () Bool)

(assert (=> b!121110 (=> (not res!100306) (not e!79337))))

(declare-fun isPrefixOf!0 (BitStream!4344 BitStream!4344) Bool)

(assert (=> b!121110 (= res!100306 (isPrefixOf!0 thiss!1305 (_2!5355 lt!189220)))))

(declare-fun lt!189235 () Unit!7461)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4344 BitStream!4344 BitStream!4344) Unit!7461)

(assert (=> b!121110 (= lt!189235 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5355 lt!189212) (_2!5355 lt!189220)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4344 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!10180)

(assert (=> b!121110 (= lt!189220 (appendNLeastSignificantBitsLoop!0 (_2!5355 lt!189212) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!79339 () Bool)

(assert (=> b!121110 e!79339))

(declare-fun res!100305 () Bool)

(assert (=> b!121110 (=> (not res!100305) (not e!79339))))

(assert (=> b!121110 (= res!100305 (= (size!2435 (buf!2869 thiss!1305)) (size!2435 (buf!2869 (_2!5355 lt!189212)))))))

(declare-fun appendBit!0 (BitStream!4344 Bool) tuple2!10180)

(assert (=> b!121110 (= lt!189212 (appendBit!0 thiss!1305 lt!189216))))

(assert (=> b!121110 (= lt!189216 (not (= (bvand v!199 lt!189230) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!121110 (= lt!189230 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!121111 () Bool)

(declare-fun res!100299 () Bool)

(assert (=> b!121111 (=> (not res!100299) (not e!79337))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!121111 (= res!100299 (invariant!0 (currentBit!5549 thiss!1305) (currentByte!5554 thiss!1305) (size!2435 (buf!2869 (_2!5355 lt!189212)))))))

(declare-fun b!121112 () Bool)

(declare-fun e!79335 () Bool)

(assert (=> b!121112 (= e!79335 e!79336)))

(declare-fun res!100307 () Bool)

(assert (=> b!121112 (=> (not res!100307) (not e!79336))))

(assert (=> b!121112 (= res!100307 (validate_offset_bits!1 ((_ sign_extend 32) (size!2435 (buf!2869 thiss!1305))) ((_ sign_extend 32) (currentByte!5554 thiss!1305)) ((_ sign_extend 32) (currentBit!5549 thiss!1305)) lt!189211))))

(assert (=> b!121112 (= lt!189211 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun lt!189234 () BitStream!4344)

(declare-fun b!121113 () Bool)

(assert (=> b!121113 (= e!79341 (or (not (= (_1!5354 lt!189224) lt!189234)) (= (_1!5353 lt!189214) (_2!5354 lt!189233))))))

(declare-fun e!79333 () Bool)

(assert (=> b!121113 e!79333))

(declare-fun res!100302 () Bool)

(assert (=> b!121113 (=> (not res!100302) (not e!79333))))

(declare-fun lt!189217 () (_ BitVec 64))

(declare-fun lt!189225 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4344 (_ BitVec 64)) BitStream!4344)

(assert (=> b!121113 (= res!100302 (= (_1!5354 lt!189224) (withMovedBitIndex!0 (_2!5354 lt!189224) (bvsub lt!189225 lt!189217))))))

(assert (=> b!121113 (= lt!189225 (bitIndex!0 (size!2435 (buf!2869 (_2!5355 lt!189212))) (currentByte!5554 (_2!5355 lt!189212)) (currentBit!5549 (_2!5355 lt!189212))))))

(declare-fun lt!189237 () (_ BitVec 64))

(assert (=> b!121113 (= (_1!5354 lt!189233) (withMovedBitIndex!0 (_2!5354 lt!189233) (bvsub lt!189237 lt!189217)))))

(assert (=> b!121113 (= lt!189217 (bitIndex!0 (size!2435 (buf!2869 (_2!5355 lt!189220))) (currentByte!5554 (_2!5355 lt!189220)) (currentBit!5549 (_2!5355 lt!189220))))))

(assert (=> b!121113 (= lt!189237 (bitIndex!0 (size!2435 (buf!2869 thiss!1305)) (currentByte!5554 thiss!1305) (currentBit!5549 thiss!1305)))))

(declare-fun lt!189228 () tuple2!10176)

(assert (=> b!121113 (and (= (_2!5353 lt!189214) (_2!5353 lt!189228)) (= (_1!5353 lt!189214) (_1!5353 lt!189228)))))

(declare-fun lt!189209 () Unit!7461)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4344 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7461)

(assert (=> b!121113 (= lt!189209 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5354 lt!189233) nBits!396 i!615 lt!189227))))

(assert (=> b!121113 (= lt!189228 (readNLeastSignificantBitsLoopPure!0 lt!189234 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!189232))))

(assert (=> b!121113 (= lt!189234 (withMovedBitIndex!0 (_1!5354 lt!189233) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!121114 () Bool)

(declare-fun e!79331 () Bool)

(declare-fun array_inv!2237 (array!5380) Bool)

(assert (=> b!121114 (= e!79331 (array_inv!2237 (buf!2869 thiss!1305)))))

(declare-fun b!121115 () Bool)

(declare-fun res!100310 () Bool)

(assert (=> b!121115 (=> (not res!100310) (not e!79336))))

(assert (=> b!121115 (= res!100310 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!121116 () Bool)

(declare-fun e!79338 () Bool)

(declare-fun lt!189231 () tuple2!10182)

(declare-fun lt!189236 () (_ BitVec 64))

(assert (=> b!121116 (= e!79338 (= (bitIndex!0 (size!2435 (buf!2869 (_1!5356 lt!189231))) (currentByte!5554 (_1!5356 lt!189231)) (currentBit!5549 (_1!5356 lt!189231))) lt!189236))))

(declare-fun b!121117 () Bool)

(assert (=> b!121117 (= e!79334 (= (_2!5356 lt!189213) (_2!5356 lt!189222)))))

(declare-fun b!121118 () Bool)

(declare-fun res!100300 () Bool)

(assert (=> b!121118 (=> (not res!100300) (not e!79336))))

(assert (=> b!121118 (= res!100300 (bvslt i!615 nBits!396))))

(declare-fun b!121119 () Bool)

(declare-fun e!79340 () Bool)

(assert (=> b!121119 (= e!79339 e!79340)))

(declare-fun res!100304 () Bool)

(assert (=> b!121119 (=> (not res!100304) (not e!79340))))

(declare-fun lt!189229 () (_ BitVec 64))

(assert (=> b!121119 (= res!100304 (= lt!189236 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!189229)))))

(assert (=> b!121119 (= lt!189236 (bitIndex!0 (size!2435 (buf!2869 (_2!5355 lt!189212))) (currentByte!5554 (_2!5355 lt!189212)) (currentBit!5549 (_2!5355 lt!189212))))))

(assert (=> b!121119 (= lt!189229 (bitIndex!0 (size!2435 (buf!2869 thiss!1305)) (currentByte!5554 thiss!1305) (currentBit!5549 thiss!1305)))))

(declare-fun b!121120 () Bool)

(assert (=> b!121120 (= e!79337 (invariant!0 (currentBit!5549 thiss!1305) (currentByte!5554 thiss!1305) (size!2435 (buf!2869 (_2!5355 lt!189220)))))))

(declare-fun b!121121 () Bool)

(assert (=> b!121121 (= e!79340 e!79338)))

(declare-fun res!100309 () Bool)

(assert (=> b!121121 (=> (not res!100309) (not e!79338))))

(assert (=> b!121121 (= res!100309 (and (= (_2!5356 lt!189231) lt!189216) (= (_1!5356 lt!189231) (_2!5355 lt!189212))))))

(declare-fun readerFrom!0 (BitStream!4344 (_ BitVec 32) (_ BitVec 32)) BitStream!4344)

(assert (=> b!121121 (= lt!189231 (readBitPure!0 (readerFrom!0 (_2!5355 lt!189212) (currentBit!5549 thiss!1305) (currentByte!5554 thiss!1305))))))

(declare-fun res!100303 () Bool)

(assert (=> start!23920 (=> (not res!100303) (not e!79335))))

(assert (=> start!23920 (= res!100303 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23920 e!79335))

(assert (=> start!23920 true))

(declare-fun inv!12 (BitStream!4344) Bool)

(assert (=> start!23920 (and (inv!12 thiss!1305) e!79331)))

(declare-fun b!121122 () Bool)

(assert (=> b!121122 (= e!79333 (and (= lt!189237 (bvsub lt!189225 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!5354 lt!189224) lt!189234)) (= (_2!5353 lt!189214) (_2!5353 lt!189221)))))))

(declare-fun b!121123 () Bool)

(declare-fun res!100308 () Bool)

(assert (=> b!121123 (=> (not res!100308) (not e!79340))))

(assert (=> b!121123 (= res!100308 (isPrefixOf!0 thiss!1305 (_2!5355 lt!189212)))))

(assert (= (and start!23920 res!100303) b!121112))

(assert (= (and b!121112 res!100307) b!121115))

(assert (= (and b!121115 res!100310) b!121118))

(assert (= (and b!121118 res!100300) b!121110))

(assert (= (and b!121110 res!100305) b!121119))

(assert (= (and b!121119 res!100304) b!121123))

(assert (= (and b!121123 res!100308) b!121121))

(assert (= (and b!121121 res!100309) b!121116))

(assert (= (and b!121110 res!100306) b!121111))

(assert (= (and b!121111 res!100299) b!121120))

(assert (= (and b!121110 res!100301) b!121117))

(assert (= (and b!121110 (not res!100311)) b!121113))

(assert (= (and b!121113 res!100302) b!121122))

(assert (= start!23920 b!121114))

(declare-fun m!183325 () Bool)

(assert (=> b!121119 m!183325))

(declare-fun m!183327 () Bool)

(assert (=> b!121119 m!183327))

(declare-fun m!183329 () Bool)

(assert (=> b!121116 m!183329))

(declare-fun m!183331 () Bool)

(assert (=> b!121112 m!183331))

(declare-fun m!183333 () Bool)

(assert (=> b!121110 m!183333))

(declare-fun m!183335 () Bool)

(assert (=> b!121110 m!183335))

(declare-fun m!183337 () Bool)

(assert (=> b!121110 m!183337))

(declare-fun m!183339 () Bool)

(assert (=> b!121110 m!183339))

(declare-fun m!183341 () Bool)

(assert (=> b!121110 m!183341))

(declare-fun m!183343 () Bool)

(assert (=> b!121110 m!183343))

(declare-fun m!183345 () Bool)

(assert (=> b!121110 m!183345))

(declare-fun m!183347 () Bool)

(assert (=> b!121110 m!183347))

(declare-fun m!183349 () Bool)

(assert (=> b!121110 m!183349))

(declare-fun m!183351 () Bool)

(assert (=> b!121110 m!183351))

(declare-fun m!183353 () Bool)

(assert (=> b!121110 m!183353))

(declare-fun m!183355 () Bool)

(assert (=> b!121110 m!183355))

(declare-fun m!183357 () Bool)

(assert (=> b!121110 m!183357))

(declare-fun m!183359 () Bool)

(assert (=> b!121110 m!183359))

(declare-fun m!183361 () Bool)

(assert (=> b!121110 m!183361))

(declare-fun m!183363 () Bool)

(assert (=> b!121110 m!183363))

(declare-fun m!183365 () Bool)

(assert (=> b!121110 m!183365))

(declare-fun m!183367 () Bool)

(assert (=> b!121110 m!183367))

(declare-fun m!183369 () Bool)

(assert (=> b!121110 m!183369))

(declare-fun m!183371 () Bool)

(assert (=> b!121111 m!183371))

(declare-fun m!183373 () Bool)

(assert (=> b!121120 m!183373))

(declare-fun m!183375 () Bool)

(assert (=> b!121115 m!183375))

(declare-fun m!183377 () Bool)

(assert (=> b!121114 m!183377))

(declare-fun m!183379 () Bool)

(assert (=> b!121121 m!183379))

(assert (=> b!121121 m!183379))

(declare-fun m!183381 () Bool)

(assert (=> b!121121 m!183381))

(declare-fun m!183383 () Bool)

(assert (=> start!23920 m!183383))

(declare-fun m!183385 () Bool)

(assert (=> b!121123 m!183385))

(assert (=> b!121113 m!183325))

(declare-fun m!183387 () Bool)

(assert (=> b!121113 m!183387))

(declare-fun m!183389 () Bool)

(assert (=> b!121113 m!183389))

(declare-fun m!183391 () Bool)

(assert (=> b!121113 m!183391))

(declare-fun m!183393 () Bool)

(assert (=> b!121113 m!183393))

(declare-fun m!183395 () Bool)

(assert (=> b!121113 m!183395))

(declare-fun m!183397 () Bool)

(assert (=> b!121113 m!183397))

(assert (=> b!121113 m!183327))

(check-sat (not b!121115) (not b!121110) (not b!121112) (not b!121120) (not b!121119) (not start!23920) (not b!121113) (not b!121123) (not b!121114) (not b!121121) (not b!121111) (not b!121116))
(check-sat)
(get-model)

(declare-fun d!39002 () Bool)

(assert (=> d!39002 (= (invariant!0 (currentBit!5549 thiss!1305) (currentByte!5554 thiss!1305) (size!2435 (buf!2869 (_2!5355 lt!189220)))) (and (bvsge (currentBit!5549 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5549 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5554 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5554 thiss!1305) (size!2435 (buf!2869 (_2!5355 lt!189220)))) (and (= (currentBit!5549 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5554 thiss!1305) (size!2435 (buf!2869 (_2!5355 lt!189220))))))))))

(assert (=> b!121120 d!39002))

(declare-fun d!39004 () Bool)

(declare-fun e!79377 () Bool)

(assert (=> d!39004 e!79377))

(declare-fun res!100355 () Bool)

(assert (=> d!39004 (=> (not res!100355) (not e!79377))))

(declare-fun lt!189342 () (_ BitVec 64))

(declare-fun lt!189339 () (_ BitVec 64))

(declare-fun lt!189338 () (_ BitVec 64))

(assert (=> d!39004 (= res!100355 (= lt!189338 (bvsub lt!189342 lt!189339)))))

(assert (=> d!39004 (or (= (bvand lt!189342 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!189339 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!189342 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!189342 lt!189339) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!39004 (= lt!189339 (remainingBits!0 ((_ sign_extend 32) (size!2435 (buf!2869 (_1!5356 lt!189213)))) ((_ sign_extend 32) (currentByte!5554 (_1!5356 lt!189213))) ((_ sign_extend 32) (currentBit!5549 (_1!5356 lt!189213)))))))

(declare-fun lt!189340 () (_ BitVec 64))

(declare-fun lt!189337 () (_ BitVec 64))

(assert (=> d!39004 (= lt!189342 (bvmul lt!189340 lt!189337))))

(assert (=> d!39004 (or (= lt!189340 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!189337 (bvsdiv (bvmul lt!189340 lt!189337) lt!189340)))))

(assert (=> d!39004 (= lt!189337 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39004 (= lt!189340 ((_ sign_extend 32) (size!2435 (buf!2869 (_1!5356 lt!189213)))))))

(assert (=> d!39004 (= lt!189338 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5554 (_1!5356 lt!189213))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5549 (_1!5356 lt!189213)))))))

(assert (=> d!39004 (invariant!0 (currentBit!5549 (_1!5356 lt!189213)) (currentByte!5554 (_1!5356 lt!189213)) (size!2435 (buf!2869 (_1!5356 lt!189213))))))

(assert (=> d!39004 (= (bitIndex!0 (size!2435 (buf!2869 (_1!5356 lt!189213))) (currentByte!5554 (_1!5356 lt!189213)) (currentBit!5549 (_1!5356 lt!189213))) lt!189338)))

(declare-fun b!121170 () Bool)

(declare-fun res!100356 () Bool)

(assert (=> b!121170 (=> (not res!100356) (not e!79377))))

(assert (=> b!121170 (= res!100356 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!189338))))

(declare-fun b!121171 () Bool)

(declare-fun lt!189341 () (_ BitVec 64))

(assert (=> b!121171 (= e!79377 (bvsle lt!189338 (bvmul lt!189341 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!121171 (or (= lt!189341 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!189341 #b0000000000000000000000000000000000000000000000000000000000001000) lt!189341)))))

(assert (=> b!121171 (= lt!189341 ((_ sign_extend 32) (size!2435 (buf!2869 (_1!5356 lt!189213)))))))

(assert (= (and d!39004 res!100355) b!121170))

(assert (= (and b!121170 res!100356) b!121171))

(declare-fun m!183473 () Bool)

(assert (=> d!39004 m!183473))

(declare-fun m!183475 () Bool)

(assert (=> d!39004 m!183475))

(assert (=> b!121110 d!39004))

(declare-fun b!121330 () Bool)

(declare-fun e!79471 () tuple2!10180)

(declare-fun lt!189802 () Unit!7461)

(assert (=> b!121330 (= e!79471 (tuple2!10181 lt!189802 (_2!5355 lt!189212)))))

(declare-fun lt!189813 () BitStream!4344)

(assert (=> b!121330 (= lt!189813 (_2!5355 lt!189212))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4344) Unit!7461)

(assert (=> b!121330 (= lt!189802 (lemmaIsPrefixRefl!0 lt!189813))))

(declare-fun call!1583 () Bool)

(assert (=> b!121330 call!1583))

(declare-fun b!121331 () Bool)

(declare-fun res!100494 () Bool)

(declare-fun e!79473 () Bool)

(assert (=> b!121331 (=> (not res!100494) (not e!79473))))

(declare-fun lt!189809 () (_ BitVec 64))

(declare-fun lt!189801 () tuple2!10180)

(declare-fun lt!189823 () (_ BitVec 64))

(assert (=> b!121331 (= res!100494 (= (bitIndex!0 (size!2435 (buf!2869 (_2!5355 lt!189801))) (currentByte!5554 (_2!5355 lt!189801)) (currentBit!5549 (_2!5355 lt!189801))) (bvadd lt!189809 lt!189823)))))

(assert (=> b!121331 (or (not (= (bvand lt!189809 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!189823 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!189809 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!189809 lt!189823) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!121331 (= lt!189823 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!121331 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!121331 (= lt!189809 (bitIndex!0 (size!2435 (buf!2869 (_2!5355 lt!189212))) (currentByte!5554 (_2!5355 lt!189212)) (currentBit!5549 (_2!5355 lt!189212))))))

(declare-fun b!121332 () Bool)

(declare-fun e!79470 () Bool)

(declare-fun lt!189810 () tuple2!10182)

(declare-fun lt!189797 () tuple2!10182)

(assert (=> b!121332 (= e!79470 (= (_2!5356 lt!189810) (_2!5356 lt!189797)))))

(declare-fun b!121333 () Bool)

(declare-fun lt!189829 () tuple2!10180)

(declare-fun Unit!7465 () Unit!7461)

(assert (=> b!121333 (= e!79471 (tuple2!10181 Unit!7465 (_2!5355 lt!189829)))))

(declare-fun lt!189804 () Bool)

(assert (=> b!121333 (= lt!189804 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!189825 () tuple2!10180)

(assert (=> b!121333 (= lt!189825 (appendBit!0 (_2!5355 lt!189212) lt!189804))))

(declare-fun res!100501 () Bool)

(assert (=> b!121333 (= res!100501 (= (size!2435 (buf!2869 (_2!5355 lt!189212))) (size!2435 (buf!2869 (_2!5355 lt!189825)))))))

(declare-fun e!79472 () Bool)

(assert (=> b!121333 (=> (not res!100501) (not e!79472))))

(assert (=> b!121333 e!79472))

(declare-fun lt!189808 () tuple2!10180)

(assert (=> b!121333 (= lt!189808 lt!189825)))

(assert (=> b!121333 (= lt!189829 (appendNLeastSignificantBitsLoop!0 (_2!5355 lt!189808) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!189820 () Unit!7461)

(assert (=> b!121333 (= lt!189820 (lemmaIsPrefixTransitive!0 (_2!5355 lt!189212) (_2!5355 lt!189808) (_2!5355 lt!189829)))))

(assert (=> b!121333 call!1583))

(declare-fun lt!189793 () Unit!7461)

(assert (=> b!121333 (= lt!189793 lt!189820)))

(assert (=> b!121333 (invariant!0 (currentBit!5549 (_2!5355 lt!189212)) (currentByte!5554 (_2!5355 lt!189212)) (size!2435 (buf!2869 (_2!5355 lt!189808))))))

(declare-fun lt!189803 () BitStream!4344)

(assert (=> b!121333 (= lt!189803 (BitStream!4345 (buf!2869 (_2!5355 lt!189808)) (currentByte!5554 (_2!5355 lt!189212)) (currentBit!5549 (_2!5355 lt!189212))))))

(assert (=> b!121333 (invariant!0 (currentBit!5549 lt!189803) (currentByte!5554 lt!189803) (size!2435 (buf!2869 (_2!5355 lt!189829))))))

(declare-fun lt!189828 () BitStream!4344)

(assert (=> b!121333 (= lt!189828 (BitStream!4345 (buf!2869 (_2!5355 lt!189829)) (currentByte!5554 lt!189803) (currentBit!5549 lt!189803)))))

(assert (=> b!121333 (= lt!189810 (readBitPure!0 lt!189803))))

(assert (=> b!121333 (= lt!189797 (readBitPure!0 lt!189828))))

(declare-fun lt!189831 () Unit!7461)

(assert (=> b!121333 (= lt!189831 (readBitPrefixLemma!0 lt!189803 (_2!5355 lt!189829)))))

(declare-fun res!100495 () Bool)

(assert (=> b!121333 (= res!100495 (= (bitIndex!0 (size!2435 (buf!2869 (_1!5356 lt!189810))) (currentByte!5554 (_1!5356 lt!189810)) (currentBit!5549 (_1!5356 lt!189810))) (bitIndex!0 (size!2435 (buf!2869 (_1!5356 lt!189797))) (currentByte!5554 (_1!5356 lt!189797)) (currentBit!5549 (_1!5356 lt!189797)))))))

(assert (=> b!121333 (=> (not res!100495) (not e!79470))))

(assert (=> b!121333 e!79470))

(declare-fun lt!189807 () Unit!7461)

(assert (=> b!121333 (= lt!189807 lt!189831)))

(declare-fun lt!189830 () tuple2!10178)

(assert (=> b!121333 (= lt!189830 (reader!0 (_2!5355 lt!189212) (_2!5355 lt!189829)))))

(declare-fun lt!189822 () tuple2!10178)

(assert (=> b!121333 (= lt!189822 (reader!0 (_2!5355 lt!189808) (_2!5355 lt!189829)))))

(declare-fun lt!189798 () tuple2!10182)

(assert (=> b!121333 (= lt!189798 (readBitPure!0 (_1!5354 lt!189830)))))

(assert (=> b!121333 (= (_2!5356 lt!189798) lt!189804)))

(declare-fun lt!189824 () Unit!7461)

(declare-fun Unit!7466 () Unit!7461)

(assert (=> b!121333 (= lt!189824 Unit!7466)))

(declare-fun lt!189827 () (_ BitVec 64))

(assert (=> b!121333 (= lt!189827 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!189814 () (_ BitVec 64))

(assert (=> b!121333 (= lt!189814 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!189816 () Unit!7461)

(assert (=> b!121333 (= lt!189816 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5355 lt!189212) (buf!2869 (_2!5355 lt!189829)) lt!189814))))

(assert (=> b!121333 (validate_offset_bits!1 ((_ sign_extend 32) (size!2435 (buf!2869 (_2!5355 lt!189829)))) ((_ sign_extend 32) (currentByte!5554 (_2!5355 lt!189212))) ((_ sign_extend 32) (currentBit!5549 (_2!5355 lt!189212))) lt!189814)))

(declare-fun lt!189819 () Unit!7461)

(assert (=> b!121333 (= lt!189819 lt!189816)))

(declare-fun lt!189799 () tuple2!10176)

(assert (=> b!121333 (= lt!189799 (readNLeastSignificantBitsLoopPure!0 (_1!5354 lt!189830) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!189827))))

(declare-fun lt!189832 () (_ BitVec 64))

(assert (=> b!121333 (= lt!189832 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!189790 () Unit!7461)

(assert (=> b!121333 (= lt!189790 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5355 lt!189808) (buf!2869 (_2!5355 lt!189829)) lt!189832))))

(assert (=> b!121333 (validate_offset_bits!1 ((_ sign_extend 32) (size!2435 (buf!2869 (_2!5355 lt!189829)))) ((_ sign_extend 32) (currentByte!5554 (_2!5355 lt!189808))) ((_ sign_extend 32) (currentBit!5549 (_2!5355 lt!189808))) lt!189832)))

(declare-fun lt!189794 () Unit!7461)

(assert (=> b!121333 (= lt!189794 lt!189790)))

(declare-fun lt!189817 () tuple2!10176)

(assert (=> b!121333 (= lt!189817 (readNLeastSignificantBitsLoopPure!0 (_1!5354 lt!189822) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!189827 (ite (_2!5356 lt!189798) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!189811 () tuple2!10176)

(assert (=> b!121333 (= lt!189811 (readNLeastSignificantBitsLoopPure!0 (_1!5354 lt!189830) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!189827))))

(declare-fun c!7282 () Bool)

(assert (=> b!121333 (= c!7282 (_2!5356 (readBitPure!0 (_1!5354 lt!189830))))))

(declare-fun e!79474 () (_ BitVec 64))

(declare-fun lt!189795 () tuple2!10176)

(assert (=> b!121333 (= lt!189795 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5354 lt!189830) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!189827 e!79474)))))

(declare-fun lt!189834 () Unit!7461)

(assert (=> b!121333 (= lt!189834 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5354 lt!189830) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!189827))))

(assert (=> b!121333 (and (= (_2!5353 lt!189811) (_2!5353 lt!189795)) (= (_1!5353 lt!189811) (_1!5353 lt!189795)))))

(declare-fun lt!189821 () Unit!7461)

(assert (=> b!121333 (= lt!189821 lt!189834)))

(assert (=> b!121333 (= (_1!5354 lt!189830) (withMovedBitIndex!0 (_2!5354 lt!189830) (bvsub (bitIndex!0 (size!2435 (buf!2869 (_2!5355 lt!189212))) (currentByte!5554 (_2!5355 lt!189212)) (currentBit!5549 (_2!5355 lt!189212))) (bitIndex!0 (size!2435 (buf!2869 (_2!5355 lt!189829))) (currentByte!5554 (_2!5355 lt!189829)) (currentBit!5549 (_2!5355 lt!189829))))))))

(declare-fun lt!189833 () Unit!7461)

(declare-fun Unit!7467 () Unit!7461)

(assert (=> b!121333 (= lt!189833 Unit!7467)))

(assert (=> b!121333 (= (_1!5354 lt!189822) (withMovedBitIndex!0 (_2!5354 lt!189822) (bvsub (bitIndex!0 (size!2435 (buf!2869 (_2!5355 lt!189808))) (currentByte!5554 (_2!5355 lt!189808)) (currentBit!5549 (_2!5355 lt!189808))) (bitIndex!0 (size!2435 (buf!2869 (_2!5355 lt!189829))) (currentByte!5554 (_2!5355 lt!189829)) (currentBit!5549 (_2!5355 lt!189829))))))))

(declare-fun lt!189796 () Unit!7461)

(declare-fun Unit!7468 () Unit!7461)

(assert (=> b!121333 (= lt!189796 Unit!7468)))

(assert (=> b!121333 (= (bitIndex!0 (size!2435 (buf!2869 (_2!5355 lt!189212))) (currentByte!5554 (_2!5355 lt!189212)) (currentBit!5549 (_2!5355 lt!189212))) (bvsub (bitIndex!0 (size!2435 (buf!2869 (_2!5355 lt!189808))) (currentByte!5554 (_2!5355 lt!189808)) (currentBit!5549 (_2!5355 lt!189808))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!189791 () Unit!7461)

(declare-fun Unit!7469 () Unit!7461)

(assert (=> b!121333 (= lt!189791 Unit!7469)))

(assert (=> b!121333 (= (_2!5353 lt!189799) (_2!5353 lt!189817))))

(declare-fun lt!189812 () Unit!7461)

(declare-fun Unit!7470 () Unit!7461)

(assert (=> b!121333 (= lt!189812 Unit!7470)))

(assert (=> b!121333 (= (_1!5353 lt!189799) (_2!5354 lt!189830))))

(declare-fun b!121334 () Bool)

(declare-fun res!100499 () Bool)

(assert (=> b!121334 (= res!100499 (= (bitIndex!0 (size!2435 (buf!2869 (_2!5355 lt!189825))) (currentByte!5554 (_2!5355 lt!189825)) (currentBit!5549 (_2!5355 lt!189825))) (bvadd (bitIndex!0 (size!2435 (buf!2869 (_2!5355 lt!189212))) (currentByte!5554 (_2!5355 lt!189212)) (currentBit!5549 (_2!5355 lt!189212))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!121334 (=> (not res!100499) (not e!79472))))

(declare-fun b!121335 () Bool)

(declare-fun res!100496 () Bool)

(assert (=> b!121335 (=> (not res!100496) (not e!79473))))

(assert (=> b!121335 (= res!100496 (isPrefixOf!0 (_2!5355 lt!189212) (_2!5355 lt!189801)))))

(declare-fun bm!1580 () Bool)

(declare-fun c!7283 () Bool)

(assert (=> bm!1580 (= call!1583 (isPrefixOf!0 (ite c!7283 (_2!5355 lt!189212) lt!189813) (ite c!7283 (_2!5355 lt!189829) lt!189813)))))

(declare-fun b!121336 () Bool)

(declare-fun e!79468 () Bool)

(declare-fun lt!189815 () tuple2!10182)

(assert (=> b!121336 (= e!79468 (= (bitIndex!0 (size!2435 (buf!2869 (_1!5356 lt!189815))) (currentByte!5554 (_1!5356 lt!189815)) (currentBit!5549 (_1!5356 lt!189815))) (bitIndex!0 (size!2435 (buf!2869 (_2!5355 lt!189825))) (currentByte!5554 (_2!5355 lt!189825)) (currentBit!5549 (_2!5355 lt!189825)))))))

(declare-fun d!39006 () Bool)

(assert (=> d!39006 e!79473))

(declare-fun res!100497 () Bool)

(assert (=> d!39006 (=> (not res!100497) (not e!79473))))

(assert (=> d!39006 (= res!100497 (= (size!2435 (buf!2869 (_2!5355 lt!189212))) (size!2435 (buf!2869 (_2!5355 lt!189801)))))))

(assert (=> d!39006 (= lt!189801 e!79471)))

(assert (=> d!39006 (= c!7283 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!39006 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!39006 (= (appendNLeastSignificantBitsLoop!0 (_2!5355 lt!189212) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!189801)))

(declare-fun b!121337 () Bool)

(declare-fun e!79469 () Bool)

(declare-fun lt!189792 () (_ BitVec 64))

(assert (=> b!121337 (= e!79469 (validate_offset_bits!1 ((_ sign_extend 32) (size!2435 (buf!2869 (_2!5355 lt!189212)))) ((_ sign_extend 32) (currentByte!5554 (_2!5355 lt!189212))) ((_ sign_extend 32) (currentBit!5549 (_2!5355 lt!189212))) lt!189792))))

(declare-fun b!121338 () Bool)

(assert (=> b!121338 (= e!79474 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!121339 () Bool)

(assert (=> b!121339 (= lt!189815 (readBitPure!0 (readerFrom!0 (_2!5355 lt!189825) (currentBit!5549 (_2!5355 lt!189212)) (currentByte!5554 (_2!5355 lt!189212)))))))

(declare-fun res!100493 () Bool)

(assert (=> b!121339 (= res!100493 (and (= (_2!5356 lt!189815) lt!189804) (= (_1!5356 lt!189815) (_2!5355 lt!189825))))))

(assert (=> b!121339 (=> (not res!100493) (not e!79468))))

(assert (=> b!121339 (= e!79472 e!79468)))

(declare-fun b!121340 () Bool)

(assert (=> b!121340 (= e!79474 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!121341 () Bool)

(declare-fun res!100498 () Bool)

(assert (=> b!121341 (= res!100498 (isPrefixOf!0 (_2!5355 lt!189212) (_2!5355 lt!189825)))))

(assert (=> b!121341 (=> (not res!100498) (not e!79472))))

(declare-fun lt!189800 () tuple2!10176)

(declare-fun b!121342 () Bool)

(declare-fun lt!189826 () tuple2!10178)

(assert (=> b!121342 (= e!79473 (and (= (_2!5353 lt!189800) v!199) (= (_1!5353 lt!189800) (_2!5354 lt!189826))))))

(declare-fun lt!189805 () (_ BitVec 64))

(assert (=> b!121342 (= lt!189800 (readNLeastSignificantBitsLoopPure!0 (_1!5354 lt!189826) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!189805))))

(declare-fun lt!189818 () Unit!7461)

(declare-fun lt!189806 () Unit!7461)

(assert (=> b!121342 (= lt!189818 lt!189806)))

(assert (=> b!121342 (validate_offset_bits!1 ((_ sign_extend 32) (size!2435 (buf!2869 (_2!5355 lt!189801)))) ((_ sign_extend 32) (currentByte!5554 (_2!5355 lt!189212))) ((_ sign_extend 32) (currentBit!5549 (_2!5355 lt!189212))) lt!189792)))

(assert (=> b!121342 (= lt!189806 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5355 lt!189212) (buf!2869 (_2!5355 lt!189801)) lt!189792))))

(assert (=> b!121342 e!79469))

(declare-fun res!100500 () Bool)

(assert (=> b!121342 (=> (not res!100500) (not e!79469))))

(assert (=> b!121342 (= res!100500 (and (= (size!2435 (buf!2869 (_2!5355 lt!189212))) (size!2435 (buf!2869 (_2!5355 lt!189801)))) (bvsge lt!189792 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!121342 (= lt!189792 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!121342 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!121342 (= lt!189805 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!121342 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!121342 (= lt!189826 (reader!0 (_2!5355 lt!189212) (_2!5355 lt!189801)))))

(assert (= (and d!39006 c!7283) b!121333))

(assert (= (and d!39006 (not c!7283)) b!121330))

(assert (= (and b!121333 res!100501) b!121334))

(assert (= (and b!121334 res!100499) b!121341))

(assert (= (and b!121341 res!100498) b!121339))

(assert (= (and b!121339 res!100493) b!121336))

(assert (= (and b!121333 res!100495) b!121332))

(assert (= (and b!121333 c!7282) b!121338))

(assert (= (and b!121333 (not c!7282)) b!121340))

(assert (= (or b!121333 b!121330) bm!1580))

(assert (= (and d!39006 res!100497) b!121331))

(assert (= (and b!121331 res!100494) b!121335))

(assert (= (and b!121335 res!100496) b!121342))

(assert (= (and b!121342 res!100500) b!121337))

(declare-fun m!183753 () Bool)

(assert (=> bm!1580 m!183753))

(declare-fun m!183755 () Bool)

(assert (=> b!121336 m!183755))

(declare-fun m!183757 () Bool)

(assert (=> b!121336 m!183757))

(declare-fun m!183759 () Bool)

(assert (=> b!121330 m!183759))

(declare-fun m!183761 () Bool)

(assert (=> b!121341 m!183761))

(declare-fun m!183763 () Bool)

(assert (=> b!121337 m!183763))

(assert (=> b!121334 m!183757))

(assert (=> b!121334 m!183325))

(declare-fun m!183765 () Bool)

(assert (=> b!121335 m!183765))

(declare-fun m!183767 () Bool)

(assert (=> b!121342 m!183767))

(declare-fun m!183769 () Bool)

(assert (=> b!121342 m!183769))

(declare-fun m!183771 () Bool)

(assert (=> b!121342 m!183771))

(declare-fun m!183773 () Bool)

(assert (=> b!121342 m!183773))

(declare-fun m!183775 () Bool)

(assert (=> b!121342 m!183775))

(declare-fun m!183777 () Bool)

(assert (=> b!121333 m!183777))

(declare-fun m!183779 () Bool)

(assert (=> b!121333 m!183779))

(declare-fun m!183781 () Bool)

(assert (=> b!121333 m!183781))

(declare-fun m!183783 () Bool)

(assert (=> b!121333 m!183783))

(declare-fun m!183785 () Bool)

(assert (=> b!121333 m!183785))

(declare-fun m!183787 () Bool)

(assert (=> b!121333 m!183787))

(declare-fun m!183789 () Bool)

(assert (=> b!121333 m!183789))

(declare-fun m!183791 () Bool)

(assert (=> b!121333 m!183791))

(assert (=> b!121333 m!183773))

(declare-fun m!183793 () Bool)

(assert (=> b!121333 m!183793))

(declare-fun m!183795 () Bool)

(assert (=> b!121333 m!183795))

(declare-fun m!183797 () Bool)

(assert (=> b!121333 m!183797))

(declare-fun m!183799 () Bool)

(assert (=> b!121333 m!183799))

(declare-fun m!183801 () Bool)

(assert (=> b!121333 m!183801))

(declare-fun m!183803 () Bool)

(assert (=> b!121333 m!183803))

(declare-fun m!183805 () Bool)

(assert (=> b!121333 m!183805))

(declare-fun m!183807 () Bool)

(assert (=> b!121333 m!183807))

(declare-fun m!183809 () Bool)

(assert (=> b!121333 m!183809))

(declare-fun m!183811 () Bool)

(assert (=> b!121333 m!183811))

(declare-fun m!183813 () Bool)

(assert (=> b!121333 m!183813))

(declare-fun m!183815 () Bool)

(assert (=> b!121333 m!183815))

(declare-fun m!183817 () Bool)

(assert (=> b!121333 m!183817))

(assert (=> b!121333 m!183789))

(declare-fun m!183819 () Bool)

(assert (=> b!121333 m!183819))

(declare-fun m!183821 () Bool)

(assert (=> b!121333 m!183821))

(declare-fun m!183823 () Bool)

(assert (=> b!121333 m!183823))

(declare-fun m!183825 () Bool)

(assert (=> b!121333 m!183825))

(assert (=> b!121333 m!183325))

(declare-fun m!183827 () Bool)

(assert (=> b!121333 m!183827))

(declare-fun m!183829 () Bool)

(assert (=> b!121339 m!183829))

(assert (=> b!121339 m!183829))

(declare-fun m!183831 () Bool)

(assert (=> b!121339 m!183831))

(declare-fun m!183833 () Bool)

(assert (=> b!121331 m!183833))

(assert (=> b!121331 m!183325))

(assert (=> b!121110 d!39006))

(declare-datatypes ((tuple2!10192 0))(
  ( (tuple2!10193 (_1!5361 (_ BitVec 64)) (_2!5361 BitStream!4344)) )
))
(declare-fun lt!189837 () tuple2!10192)

(declare-fun d!39134 () Bool)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4344 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10192)

(assert (=> d!39134 (= lt!189837 (readNLeastSignificantBitsLoop!0 (_1!5354 lt!189233) nBits!396 i!615 lt!189227))))

(assert (=> d!39134 (= (readNLeastSignificantBitsLoopPure!0 (_1!5354 lt!189233) nBits!396 i!615 lt!189227) (tuple2!10177 (_2!5361 lt!189837) (_1!5361 lt!189837)))))

(declare-fun bs!9464 () Bool)

(assert (= bs!9464 d!39134))

(declare-fun m!183835 () Bool)

(assert (=> bs!9464 m!183835))

(assert (=> b!121110 d!39134))

(declare-fun b!121353 () Bool)

(declare-fun e!79479 () Unit!7461)

(declare-fun Unit!7471 () Unit!7461)

(assert (=> b!121353 (= e!79479 Unit!7471)))

(declare-fun b!121354 () Bool)

(declare-fun lt!189890 () Unit!7461)

(assert (=> b!121354 (= e!79479 lt!189890)))

(declare-fun lt!189880 () (_ BitVec 64))

(assert (=> b!121354 (= lt!189880 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!189888 () (_ BitVec 64))

(assert (=> b!121354 (= lt!189888 (bitIndex!0 (size!2435 (buf!2869 thiss!1305)) (currentByte!5554 thiss!1305) (currentBit!5549 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5380 array!5380 (_ BitVec 64) (_ BitVec 64)) Unit!7461)

(assert (=> b!121354 (= lt!189890 (arrayBitRangesEqSymmetric!0 (buf!2869 thiss!1305) (buf!2869 (_2!5355 lt!189220)) lt!189880 lt!189888))))

(declare-fun arrayBitRangesEq!0 (array!5380 array!5380 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!121354 (arrayBitRangesEq!0 (buf!2869 (_2!5355 lt!189220)) (buf!2869 thiss!1305) lt!189880 lt!189888)))

(declare-fun b!121355 () Bool)

(declare-fun res!100509 () Bool)

(declare-fun e!79480 () Bool)

(assert (=> b!121355 (=> (not res!100509) (not e!79480))))

(declare-fun lt!189885 () tuple2!10178)

(assert (=> b!121355 (= res!100509 (isPrefixOf!0 (_2!5354 lt!189885) (_2!5355 lt!189220)))))

(declare-fun d!39136 () Bool)

(assert (=> d!39136 e!79480))

(declare-fun res!100510 () Bool)

(assert (=> d!39136 (=> (not res!100510) (not e!79480))))

(assert (=> d!39136 (= res!100510 (isPrefixOf!0 (_1!5354 lt!189885) (_2!5354 lt!189885)))))

(declare-fun lt!189893 () BitStream!4344)

(assert (=> d!39136 (= lt!189885 (tuple2!10179 lt!189893 (_2!5355 lt!189220)))))

(declare-fun lt!189889 () Unit!7461)

(declare-fun lt!189892 () Unit!7461)

(assert (=> d!39136 (= lt!189889 lt!189892)))

(assert (=> d!39136 (isPrefixOf!0 lt!189893 (_2!5355 lt!189220))))

(assert (=> d!39136 (= lt!189892 (lemmaIsPrefixTransitive!0 lt!189893 (_2!5355 lt!189220) (_2!5355 lt!189220)))))

(declare-fun lt!189897 () Unit!7461)

(declare-fun lt!189884 () Unit!7461)

(assert (=> d!39136 (= lt!189897 lt!189884)))

(assert (=> d!39136 (isPrefixOf!0 lt!189893 (_2!5355 lt!189220))))

(assert (=> d!39136 (= lt!189884 (lemmaIsPrefixTransitive!0 lt!189893 thiss!1305 (_2!5355 lt!189220)))))

(declare-fun lt!189879 () Unit!7461)

(assert (=> d!39136 (= lt!189879 e!79479)))

(declare-fun c!7286 () Bool)

(assert (=> d!39136 (= c!7286 (not (= (size!2435 (buf!2869 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!189881 () Unit!7461)

(declare-fun lt!189887 () Unit!7461)

(assert (=> d!39136 (= lt!189881 lt!189887)))

(assert (=> d!39136 (isPrefixOf!0 (_2!5355 lt!189220) (_2!5355 lt!189220))))

(assert (=> d!39136 (= lt!189887 (lemmaIsPrefixRefl!0 (_2!5355 lt!189220)))))

(declare-fun lt!189895 () Unit!7461)

(declare-fun lt!189886 () Unit!7461)

(assert (=> d!39136 (= lt!189895 lt!189886)))

(assert (=> d!39136 (= lt!189886 (lemmaIsPrefixRefl!0 (_2!5355 lt!189220)))))

(declare-fun lt!189891 () Unit!7461)

(declare-fun lt!189896 () Unit!7461)

(assert (=> d!39136 (= lt!189891 lt!189896)))

(assert (=> d!39136 (isPrefixOf!0 lt!189893 lt!189893)))

(assert (=> d!39136 (= lt!189896 (lemmaIsPrefixRefl!0 lt!189893))))

(declare-fun lt!189878 () Unit!7461)

(declare-fun lt!189883 () Unit!7461)

(assert (=> d!39136 (= lt!189878 lt!189883)))

(assert (=> d!39136 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!39136 (= lt!189883 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!39136 (= lt!189893 (BitStream!4345 (buf!2869 (_2!5355 lt!189220)) (currentByte!5554 thiss!1305) (currentBit!5549 thiss!1305)))))

(assert (=> d!39136 (isPrefixOf!0 thiss!1305 (_2!5355 lt!189220))))

(assert (=> d!39136 (= (reader!0 thiss!1305 (_2!5355 lt!189220)) lt!189885)))

(declare-fun b!121356 () Bool)

(declare-fun res!100508 () Bool)

(assert (=> b!121356 (=> (not res!100508) (not e!79480))))

(assert (=> b!121356 (= res!100508 (isPrefixOf!0 (_1!5354 lt!189885) thiss!1305))))

(declare-fun lt!189882 () (_ BitVec 64))

(declare-fun lt!189894 () (_ BitVec 64))

(declare-fun b!121357 () Bool)

(assert (=> b!121357 (= e!79480 (= (_1!5354 lt!189885) (withMovedBitIndex!0 (_2!5354 lt!189885) (bvsub lt!189894 lt!189882))))))

(assert (=> b!121357 (or (= (bvand lt!189894 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!189882 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!189894 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!189894 lt!189882) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!121357 (= lt!189882 (bitIndex!0 (size!2435 (buf!2869 (_2!5355 lt!189220))) (currentByte!5554 (_2!5355 lt!189220)) (currentBit!5549 (_2!5355 lt!189220))))))

(assert (=> b!121357 (= lt!189894 (bitIndex!0 (size!2435 (buf!2869 thiss!1305)) (currentByte!5554 thiss!1305) (currentBit!5549 thiss!1305)))))

(assert (= (and d!39136 c!7286) b!121354))

(assert (= (and d!39136 (not c!7286)) b!121353))

(assert (= (and d!39136 res!100510) b!121356))

(assert (= (and b!121356 res!100508) b!121355))

(assert (= (and b!121355 res!100509) b!121357))

(assert (=> b!121354 m!183327))

(declare-fun m!183837 () Bool)

(assert (=> b!121354 m!183837))

(declare-fun m!183839 () Bool)

(assert (=> b!121354 m!183839))

(declare-fun m!183841 () Bool)

(assert (=> d!39136 m!183841))

(assert (=> d!39136 m!183341))

(declare-fun m!183843 () Bool)

(assert (=> d!39136 m!183843))

(declare-fun m!183845 () Bool)

(assert (=> d!39136 m!183845))

(declare-fun m!183847 () Bool)

(assert (=> d!39136 m!183847))

(declare-fun m!183849 () Bool)

(assert (=> d!39136 m!183849))

(declare-fun m!183851 () Bool)

(assert (=> d!39136 m!183851))

(declare-fun m!183853 () Bool)

(assert (=> d!39136 m!183853))

(declare-fun m!183855 () Bool)

(assert (=> d!39136 m!183855))

(declare-fun m!183857 () Bool)

(assert (=> d!39136 m!183857))

(declare-fun m!183859 () Bool)

(assert (=> d!39136 m!183859))

(declare-fun m!183861 () Bool)

(assert (=> b!121355 m!183861))

(declare-fun m!183863 () Bool)

(assert (=> b!121356 m!183863))

(declare-fun m!183865 () Bool)

(assert (=> b!121357 m!183865))

(assert (=> b!121357 m!183395))

(assert (=> b!121357 m!183327))

(assert (=> b!121110 d!39136))

(declare-fun d!39138 () Bool)

(assert (=> d!39138 (validate_offset_bits!1 ((_ sign_extend 32) (size!2435 (buf!2869 (_2!5355 lt!189220)))) ((_ sign_extend 32) (currentByte!5554 (_2!5355 lt!189212))) ((_ sign_extend 32) (currentBit!5549 (_2!5355 lt!189212))) lt!189218)))

(declare-fun lt!189900 () Unit!7461)

(declare-fun choose!9 (BitStream!4344 array!5380 (_ BitVec 64) BitStream!4344) Unit!7461)

(assert (=> d!39138 (= lt!189900 (choose!9 (_2!5355 lt!189212) (buf!2869 (_2!5355 lt!189220)) lt!189218 (BitStream!4345 (buf!2869 (_2!5355 lt!189220)) (currentByte!5554 (_2!5355 lt!189212)) (currentBit!5549 (_2!5355 lt!189212)))))))

(assert (=> d!39138 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5355 lt!189212) (buf!2869 (_2!5355 lt!189220)) lt!189218) lt!189900)))

(declare-fun bs!9465 () Bool)

(assert (= bs!9465 d!39138))

(assert (=> bs!9465 m!183355))

(declare-fun m!183867 () Bool)

(assert (=> bs!9465 m!183867))

(assert (=> b!121110 d!39138))

(declare-fun d!39140 () Bool)

(declare-fun e!79481 () Bool)

(assert (=> d!39140 e!79481))

(declare-fun res!100511 () Bool)

(assert (=> d!39140 (=> (not res!100511) (not e!79481))))

(declare-fun lt!189906 () (_ BitVec 64))

(declare-fun lt!189902 () (_ BitVec 64))

(declare-fun lt!189903 () (_ BitVec 64))

(assert (=> d!39140 (= res!100511 (= lt!189902 (bvsub lt!189906 lt!189903)))))

(assert (=> d!39140 (or (= (bvand lt!189906 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!189903 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!189906 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!189906 lt!189903) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39140 (= lt!189903 (remainingBits!0 ((_ sign_extend 32) (size!2435 (buf!2869 (_1!5356 lt!189222)))) ((_ sign_extend 32) (currentByte!5554 (_1!5356 lt!189222))) ((_ sign_extend 32) (currentBit!5549 (_1!5356 lt!189222)))))))

(declare-fun lt!189904 () (_ BitVec 64))

(declare-fun lt!189901 () (_ BitVec 64))

(assert (=> d!39140 (= lt!189906 (bvmul lt!189904 lt!189901))))

(assert (=> d!39140 (or (= lt!189904 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!189901 (bvsdiv (bvmul lt!189904 lt!189901) lt!189904)))))

(assert (=> d!39140 (= lt!189901 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39140 (= lt!189904 ((_ sign_extend 32) (size!2435 (buf!2869 (_1!5356 lt!189222)))))))

(assert (=> d!39140 (= lt!189902 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5554 (_1!5356 lt!189222))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5549 (_1!5356 lt!189222)))))))

(assert (=> d!39140 (invariant!0 (currentBit!5549 (_1!5356 lt!189222)) (currentByte!5554 (_1!5356 lt!189222)) (size!2435 (buf!2869 (_1!5356 lt!189222))))))

(assert (=> d!39140 (= (bitIndex!0 (size!2435 (buf!2869 (_1!5356 lt!189222))) (currentByte!5554 (_1!5356 lt!189222)) (currentBit!5549 (_1!5356 lt!189222))) lt!189902)))

(declare-fun b!121358 () Bool)

(declare-fun res!100512 () Bool)

(assert (=> b!121358 (=> (not res!100512) (not e!79481))))

(assert (=> b!121358 (= res!100512 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!189902))))

(declare-fun b!121359 () Bool)

(declare-fun lt!189905 () (_ BitVec 64))

(assert (=> b!121359 (= e!79481 (bvsle lt!189902 (bvmul lt!189905 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!121359 (or (= lt!189905 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!189905 #b0000000000000000000000000000000000000000000000000000000000001000) lt!189905)))))

(assert (=> b!121359 (= lt!189905 ((_ sign_extend 32) (size!2435 (buf!2869 (_1!5356 lt!189222)))))))

(assert (= (and d!39140 res!100511) b!121358))

(assert (= (and b!121358 res!100512) b!121359))

(declare-fun m!183869 () Bool)

(assert (=> d!39140 m!183869))

(declare-fun m!183871 () Bool)

(assert (=> d!39140 m!183871))

(assert (=> b!121110 d!39140))

(declare-fun d!39142 () Bool)

(assert (=> d!39142 (validate_offset_bits!1 ((_ sign_extend 32) (size!2435 (buf!2869 (_2!5355 lt!189220)))) ((_ sign_extend 32) (currentByte!5554 thiss!1305)) ((_ sign_extend 32) (currentBit!5549 thiss!1305)) lt!189211)))

(declare-fun lt!189907 () Unit!7461)

(assert (=> d!39142 (= lt!189907 (choose!9 thiss!1305 (buf!2869 (_2!5355 lt!189220)) lt!189211 (BitStream!4345 (buf!2869 (_2!5355 lt!189220)) (currentByte!5554 thiss!1305) (currentBit!5549 thiss!1305))))))

(assert (=> d!39142 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2869 (_2!5355 lt!189220)) lt!189211) lt!189907)))

(declare-fun bs!9466 () Bool)

(assert (= bs!9466 d!39142))

(assert (=> bs!9466 m!183359))

(declare-fun m!183873 () Bool)

(assert (=> bs!9466 m!183873))

(assert (=> b!121110 d!39142))

(declare-fun d!39144 () Bool)

(declare-fun lt!189908 () tuple2!10192)

(assert (=> d!39144 (= lt!189908 (readNLeastSignificantBitsLoop!0 (_1!5354 lt!189224) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!189232))))

(assert (=> d!39144 (= (readNLeastSignificantBitsLoopPure!0 (_1!5354 lt!189224) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!189232) (tuple2!10177 (_2!5361 lt!189908) (_1!5361 lt!189908)))))

(declare-fun bs!9467 () Bool)

(assert (= bs!9467 d!39144))

(declare-fun m!183875 () Bool)

(assert (=> bs!9467 m!183875))

(assert (=> b!121110 d!39144))

(declare-fun d!39146 () Bool)

(declare-fun res!100521 () Bool)

(declare-fun e!79486 () Bool)

(assert (=> d!39146 (=> (not res!100521) (not e!79486))))

(assert (=> d!39146 (= res!100521 (= (size!2435 (buf!2869 thiss!1305)) (size!2435 (buf!2869 (_2!5355 lt!189220)))))))

(assert (=> d!39146 (= (isPrefixOf!0 thiss!1305 (_2!5355 lt!189220)) e!79486)))

(declare-fun b!121366 () Bool)

(declare-fun res!100520 () Bool)

(assert (=> b!121366 (=> (not res!100520) (not e!79486))))

(assert (=> b!121366 (= res!100520 (bvsle (bitIndex!0 (size!2435 (buf!2869 thiss!1305)) (currentByte!5554 thiss!1305) (currentBit!5549 thiss!1305)) (bitIndex!0 (size!2435 (buf!2869 (_2!5355 lt!189220))) (currentByte!5554 (_2!5355 lt!189220)) (currentBit!5549 (_2!5355 lt!189220)))))))

(declare-fun b!121367 () Bool)

(declare-fun e!79487 () Bool)

(assert (=> b!121367 (= e!79486 e!79487)))

(declare-fun res!100519 () Bool)

(assert (=> b!121367 (=> res!100519 e!79487)))

(assert (=> b!121367 (= res!100519 (= (size!2435 (buf!2869 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!121368 () Bool)

(assert (=> b!121368 (= e!79487 (arrayBitRangesEq!0 (buf!2869 thiss!1305) (buf!2869 (_2!5355 lt!189220)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2435 (buf!2869 thiss!1305)) (currentByte!5554 thiss!1305) (currentBit!5549 thiss!1305))))))

(assert (= (and d!39146 res!100521) b!121366))

(assert (= (and b!121366 res!100520) b!121367))

(assert (= (and b!121367 (not res!100519)) b!121368))

(assert (=> b!121366 m!183327))

(assert (=> b!121366 m!183395))

(assert (=> b!121368 m!183327))

(assert (=> b!121368 m!183327))

(declare-fun m!183877 () Bool)

(assert (=> b!121368 m!183877))

(assert (=> b!121110 d!39146))

(declare-fun d!39148 () Bool)

(assert (=> d!39148 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2435 (buf!2869 (_2!5355 lt!189220)))) ((_ sign_extend 32) (currentByte!5554 thiss!1305)) ((_ sign_extend 32) (currentBit!5549 thiss!1305)) lt!189211) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2435 (buf!2869 (_2!5355 lt!189220)))) ((_ sign_extend 32) (currentByte!5554 thiss!1305)) ((_ sign_extend 32) (currentBit!5549 thiss!1305))) lt!189211))))

(declare-fun bs!9468 () Bool)

(assert (= bs!9468 d!39148))

(declare-fun m!183879 () Bool)

(assert (=> bs!9468 m!183879))

(assert (=> b!121110 d!39148))

(declare-fun b!121369 () Bool)

(declare-fun e!79488 () Unit!7461)

(declare-fun Unit!7472 () Unit!7461)

(assert (=> b!121369 (= e!79488 Unit!7472)))

(declare-fun b!121370 () Bool)

(declare-fun lt!189921 () Unit!7461)

(assert (=> b!121370 (= e!79488 lt!189921)))

(declare-fun lt!189911 () (_ BitVec 64))

(assert (=> b!121370 (= lt!189911 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!189919 () (_ BitVec 64))

(assert (=> b!121370 (= lt!189919 (bitIndex!0 (size!2435 (buf!2869 (_2!5355 lt!189212))) (currentByte!5554 (_2!5355 lt!189212)) (currentBit!5549 (_2!5355 lt!189212))))))

(assert (=> b!121370 (= lt!189921 (arrayBitRangesEqSymmetric!0 (buf!2869 (_2!5355 lt!189212)) (buf!2869 (_2!5355 lt!189220)) lt!189911 lt!189919))))

(assert (=> b!121370 (arrayBitRangesEq!0 (buf!2869 (_2!5355 lt!189220)) (buf!2869 (_2!5355 lt!189212)) lt!189911 lt!189919)))

(declare-fun b!121371 () Bool)

(declare-fun res!100523 () Bool)

(declare-fun e!79489 () Bool)

(assert (=> b!121371 (=> (not res!100523) (not e!79489))))

(declare-fun lt!189916 () tuple2!10178)

(assert (=> b!121371 (= res!100523 (isPrefixOf!0 (_2!5354 lt!189916) (_2!5355 lt!189220)))))

(declare-fun d!39150 () Bool)

(assert (=> d!39150 e!79489))

(declare-fun res!100524 () Bool)

(assert (=> d!39150 (=> (not res!100524) (not e!79489))))

(assert (=> d!39150 (= res!100524 (isPrefixOf!0 (_1!5354 lt!189916) (_2!5354 lt!189916)))))

(declare-fun lt!189924 () BitStream!4344)

(assert (=> d!39150 (= lt!189916 (tuple2!10179 lt!189924 (_2!5355 lt!189220)))))

(declare-fun lt!189920 () Unit!7461)

(declare-fun lt!189923 () Unit!7461)

(assert (=> d!39150 (= lt!189920 lt!189923)))

(assert (=> d!39150 (isPrefixOf!0 lt!189924 (_2!5355 lt!189220))))

(assert (=> d!39150 (= lt!189923 (lemmaIsPrefixTransitive!0 lt!189924 (_2!5355 lt!189220) (_2!5355 lt!189220)))))

(declare-fun lt!189928 () Unit!7461)

(declare-fun lt!189915 () Unit!7461)

(assert (=> d!39150 (= lt!189928 lt!189915)))

(assert (=> d!39150 (isPrefixOf!0 lt!189924 (_2!5355 lt!189220))))

(assert (=> d!39150 (= lt!189915 (lemmaIsPrefixTransitive!0 lt!189924 (_2!5355 lt!189212) (_2!5355 lt!189220)))))

(declare-fun lt!189910 () Unit!7461)

(assert (=> d!39150 (= lt!189910 e!79488)))

(declare-fun c!7287 () Bool)

(assert (=> d!39150 (= c!7287 (not (= (size!2435 (buf!2869 (_2!5355 lt!189212))) #b00000000000000000000000000000000)))))

(declare-fun lt!189912 () Unit!7461)

(declare-fun lt!189918 () Unit!7461)

(assert (=> d!39150 (= lt!189912 lt!189918)))

(assert (=> d!39150 (isPrefixOf!0 (_2!5355 lt!189220) (_2!5355 lt!189220))))

(assert (=> d!39150 (= lt!189918 (lemmaIsPrefixRefl!0 (_2!5355 lt!189220)))))

(declare-fun lt!189926 () Unit!7461)

(declare-fun lt!189917 () Unit!7461)

(assert (=> d!39150 (= lt!189926 lt!189917)))

(assert (=> d!39150 (= lt!189917 (lemmaIsPrefixRefl!0 (_2!5355 lt!189220)))))

(declare-fun lt!189922 () Unit!7461)

(declare-fun lt!189927 () Unit!7461)

(assert (=> d!39150 (= lt!189922 lt!189927)))

(assert (=> d!39150 (isPrefixOf!0 lt!189924 lt!189924)))

(assert (=> d!39150 (= lt!189927 (lemmaIsPrefixRefl!0 lt!189924))))

(declare-fun lt!189909 () Unit!7461)

(declare-fun lt!189914 () Unit!7461)

(assert (=> d!39150 (= lt!189909 lt!189914)))

(assert (=> d!39150 (isPrefixOf!0 (_2!5355 lt!189212) (_2!5355 lt!189212))))

(assert (=> d!39150 (= lt!189914 (lemmaIsPrefixRefl!0 (_2!5355 lt!189212)))))

(assert (=> d!39150 (= lt!189924 (BitStream!4345 (buf!2869 (_2!5355 lt!189220)) (currentByte!5554 (_2!5355 lt!189212)) (currentBit!5549 (_2!5355 lt!189212))))))

(assert (=> d!39150 (isPrefixOf!0 (_2!5355 lt!189212) (_2!5355 lt!189220))))

(assert (=> d!39150 (= (reader!0 (_2!5355 lt!189212) (_2!5355 lt!189220)) lt!189916)))

(declare-fun b!121372 () Bool)

(declare-fun res!100522 () Bool)

(assert (=> b!121372 (=> (not res!100522) (not e!79489))))

(assert (=> b!121372 (= res!100522 (isPrefixOf!0 (_1!5354 lt!189916) (_2!5355 lt!189212)))))

(declare-fun b!121373 () Bool)

(declare-fun lt!189925 () (_ BitVec 64))

(declare-fun lt!189913 () (_ BitVec 64))

(assert (=> b!121373 (= e!79489 (= (_1!5354 lt!189916) (withMovedBitIndex!0 (_2!5354 lt!189916) (bvsub lt!189925 lt!189913))))))

(assert (=> b!121373 (or (= (bvand lt!189925 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!189913 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!189925 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!189925 lt!189913) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!121373 (= lt!189913 (bitIndex!0 (size!2435 (buf!2869 (_2!5355 lt!189220))) (currentByte!5554 (_2!5355 lt!189220)) (currentBit!5549 (_2!5355 lt!189220))))))

(assert (=> b!121373 (= lt!189925 (bitIndex!0 (size!2435 (buf!2869 (_2!5355 lt!189212))) (currentByte!5554 (_2!5355 lt!189212)) (currentBit!5549 (_2!5355 lt!189212))))))

(assert (= (and d!39150 c!7287) b!121370))

(assert (= (and d!39150 (not c!7287)) b!121369))

(assert (= (and d!39150 res!100524) b!121372))

(assert (= (and b!121372 res!100522) b!121371))

(assert (= (and b!121371 res!100523) b!121373))

(assert (=> b!121370 m!183325))

(declare-fun m!183881 () Bool)

(assert (=> b!121370 m!183881))

(declare-fun m!183883 () Bool)

(assert (=> b!121370 m!183883))

(assert (=> d!39150 m!183841))

(declare-fun m!183885 () Bool)

(assert (=> d!39150 m!183885))

(declare-fun m!183887 () Bool)

(assert (=> d!39150 m!183887))

(declare-fun m!183889 () Bool)

(assert (=> d!39150 m!183889))

(declare-fun m!183891 () Bool)

(assert (=> d!39150 m!183891))

(declare-fun m!183893 () Bool)

(assert (=> d!39150 m!183893))

(assert (=> d!39150 m!183851))

(declare-fun m!183895 () Bool)

(assert (=> d!39150 m!183895))

(declare-fun m!183897 () Bool)

(assert (=> d!39150 m!183897))

(declare-fun m!183899 () Bool)

(assert (=> d!39150 m!183899))

(declare-fun m!183901 () Bool)

(assert (=> d!39150 m!183901))

(declare-fun m!183903 () Bool)

(assert (=> b!121371 m!183903))

(declare-fun m!183905 () Bool)

(assert (=> b!121372 m!183905))

(declare-fun m!183907 () Bool)

(assert (=> b!121373 m!183907))

(assert (=> b!121373 m!183395))

(assert (=> b!121373 m!183325))

(assert (=> b!121110 d!39150))

(declare-fun d!39152 () Bool)

(assert (=> d!39152 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!121110 d!39152))

(declare-fun d!39154 () Bool)

(declare-datatypes ((tuple2!10194 0))(
  ( (tuple2!10195 (_1!5362 Bool) (_2!5362 BitStream!4344)) )
))
(declare-fun lt!189931 () tuple2!10194)

(declare-fun readBit!0 (BitStream!4344) tuple2!10194)

(assert (=> d!39154 (= lt!189931 (readBit!0 lt!189215))))

(assert (=> d!39154 (= (readBitPure!0 lt!189215) (tuple2!10183 (_2!5362 lt!189931) (_1!5362 lt!189931)))))

(declare-fun bs!9469 () Bool)

(assert (= bs!9469 d!39154))

(declare-fun m!183909 () Bool)

(assert (=> bs!9469 m!183909))

(assert (=> b!121110 d!39154))

(declare-fun d!39156 () Bool)

(assert (=> d!39156 (isPrefixOf!0 thiss!1305 (_2!5355 lt!189220))))

(declare-fun lt!189934 () Unit!7461)

(declare-fun choose!30 (BitStream!4344 BitStream!4344 BitStream!4344) Unit!7461)

(assert (=> d!39156 (= lt!189934 (choose!30 thiss!1305 (_2!5355 lt!189212) (_2!5355 lt!189220)))))

(assert (=> d!39156 (isPrefixOf!0 thiss!1305 (_2!5355 lt!189212))))

(assert (=> d!39156 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5355 lt!189212) (_2!5355 lt!189220)) lt!189934)))

(declare-fun bs!9470 () Bool)

(assert (= bs!9470 d!39156))

(assert (=> bs!9470 m!183341))

(declare-fun m!183911 () Bool)

(assert (=> bs!9470 m!183911))

(assert (=> bs!9470 m!183385))

(assert (=> b!121110 d!39156))

(declare-fun d!39158 () Bool)

(declare-fun e!79492 () Bool)

(assert (=> d!39158 e!79492))

(declare-fun res!100527 () Bool)

(assert (=> d!39158 (=> (not res!100527) (not e!79492))))

(declare-fun lt!189944 () tuple2!10182)

(declare-fun lt!189945 () tuple2!10182)

(assert (=> d!39158 (= res!100527 (= (bitIndex!0 (size!2435 (buf!2869 (_1!5356 lt!189944))) (currentByte!5554 (_1!5356 lt!189944)) (currentBit!5549 (_1!5356 lt!189944))) (bitIndex!0 (size!2435 (buf!2869 (_1!5356 lt!189945))) (currentByte!5554 (_1!5356 lt!189945)) (currentBit!5549 (_1!5356 lt!189945)))))))

(declare-fun lt!189946 () Unit!7461)

(declare-fun lt!189943 () BitStream!4344)

(declare-fun choose!50 (BitStream!4344 BitStream!4344 BitStream!4344 tuple2!10182 tuple2!10182 BitStream!4344 Bool tuple2!10182 tuple2!10182 BitStream!4344 Bool) Unit!7461)

(assert (=> d!39158 (= lt!189946 (choose!50 lt!189215 (_2!5355 lt!189220) lt!189943 lt!189944 (tuple2!10183 (_1!5356 lt!189944) (_2!5356 lt!189944)) (_1!5356 lt!189944) (_2!5356 lt!189944) lt!189945 (tuple2!10183 (_1!5356 lt!189945) (_2!5356 lt!189945)) (_1!5356 lt!189945) (_2!5356 lt!189945)))))

(assert (=> d!39158 (= lt!189945 (readBitPure!0 lt!189943))))

(assert (=> d!39158 (= lt!189944 (readBitPure!0 lt!189215))))

(assert (=> d!39158 (= lt!189943 (BitStream!4345 (buf!2869 (_2!5355 lt!189220)) (currentByte!5554 lt!189215) (currentBit!5549 lt!189215)))))

(assert (=> d!39158 (invariant!0 (currentBit!5549 lt!189215) (currentByte!5554 lt!189215) (size!2435 (buf!2869 (_2!5355 lt!189220))))))

(assert (=> d!39158 (= (readBitPrefixLemma!0 lt!189215 (_2!5355 lt!189220)) lt!189946)))

(declare-fun b!121376 () Bool)

(assert (=> b!121376 (= e!79492 (= (_2!5356 lt!189944) (_2!5356 lt!189945)))))

(assert (= (and d!39158 res!100527) b!121376))

(declare-fun m!183913 () Bool)

(assert (=> d!39158 m!183913))

(declare-fun m!183915 () Bool)

(assert (=> d!39158 m!183915))

(declare-fun m!183917 () Bool)

(assert (=> d!39158 m!183917))

(declare-fun m!183919 () Bool)

(assert (=> d!39158 m!183919))

(assert (=> d!39158 m!183367))

(declare-fun m!183921 () Bool)

(assert (=> d!39158 m!183921))

(assert (=> b!121110 d!39158))

(declare-fun d!39160 () Bool)

(assert (=> d!39160 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2435 (buf!2869 (_2!5355 lt!189220)))) ((_ sign_extend 32) (currentByte!5554 (_2!5355 lt!189212))) ((_ sign_extend 32) (currentBit!5549 (_2!5355 lt!189212))) lt!189218) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2435 (buf!2869 (_2!5355 lt!189220)))) ((_ sign_extend 32) (currentByte!5554 (_2!5355 lt!189212))) ((_ sign_extend 32) (currentBit!5549 (_2!5355 lt!189212)))) lt!189218))))

(declare-fun bs!9471 () Bool)

(assert (= bs!9471 d!39160))

(declare-fun m!183923 () Bool)

(assert (=> bs!9471 m!183923))

(assert (=> b!121110 d!39160))

(declare-fun d!39162 () Bool)

(declare-fun lt!189947 () tuple2!10194)

(assert (=> d!39162 (= lt!189947 (readBit!0 (BitStream!4345 (buf!2869 (_2!5355 lt!189220)) (currentByte!5554 thiss!1305) (currentBit!5549 thiss!1305))))))

(assert (=> d!39162 (= (readBitPure!0 (BitStream!4345 (buf!2869 (_2!5355 lt!189220)) (currentByte!5554 thiss!1305) (currentBit!5549 thiss!1305))) (tuple2!10183 (_2!5362 lt!189947) (_1!5362 lt!189947)))))

(declare-fun bs!9472 () Bool)

(assert (= bs!9472 d!39162))

(declare-fun m!183925 () Bool)

(assert (=> bs!9472 m!183925))

(assert (=> b!121110 d!39162))

(declare-fun d!39164 () Bool)

(declare-fun lt!189948 () tuple2!10194)

(assert (=> d!39164 (= lt!189948 (readBit!0 (_1!5354 lt!189233)))))

(assert (=> d!39164 (= (readBitPure!0 (_1!5354 lt!189233)) (tuple2!10183 (_2!5362 lt!189948) (_1!5362 lt!189948)))))

(declare-fun bs!9473 () Bool)

(assert (= bs!9473 d!39164))

(declare-fun m!183927 () Bool)

(assert (=> bs!9473 m!183927))

(assert (=> b!121110 d!39164))

(declare-fun d!39166 () Bool)

(declare-fun e!79497 () Bool)

(assert (=> d!39166 e!79497))

(declare-fun res!100538 () Bool)

(assert (=> d!39166 (=> (not res!100538) (not e!79497))))

(declare-fun lt!189960 () tuple2!10180)

(assert (=> d!39166 (= res!100538 (= (size!2435 (buf!2869 thiss!1305)) (size!2435 (buf!2869 (_2!5355 lt!189960)))))))

(declare-fun choose!16 (BitStream!4344 Bool) tuple2!10180)

(assert (=> d!39166 (= lt!189960 (choose!16 thiss!1305 lt!189216))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!39166 (validate_offset_bit!0 ((_ sign_extend 32) (size!2435 (buf!2869 thiss!1305))) ((_ sign_extend 32) (currentByte!5554 thiss!1305)) ((_ sign_extend 32) (currentBit!5549 thiss!1305)))))

(assert (=> d!39166 (= (appendBit!0 thiss!1305 lt!189216) lt!189960)))

(declare-fun b!121387 () Bool)

(declare-fun res!100536 () Bool)

(assert (=> b!121387 (=> (not res!100536) (not e!79497))))

(assert (=> b!121387 (= res!100536 (isPrefixOf!0 thiss!1305 (_2!5355 lt!189960)))))

(declare-fun b!121386 () Bool)

(declare-fun res!100539 () Bool)

(assert (=> b!121386 (=> (not res!100539) (not e!79497))))

(declare-fun lt!189959 () (_ BitVec 64))

(declare-fun lt!189957 () (_ BitVec 64))

(assert (=> b!121386 (= res!100539 (= (bitIndex!0 (size!2435 (buf!2869 (_2!5355 lt!189960))) (currentByte!5554 (_2!5355 lt!189960)) (currentBit!5549 (_2!5355 lt!189960))) (bvadd lt!189959 lt!189957)))))

(assert (=> b!121386 (or (not (= (bvand lt!189959 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!189957 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!189959 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!189959 lt!189957) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!121386 (= lt!189957 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!121386 (= lt!189959 (bitIndex!0 (size!2435 (buf!2869 thiss!1305)) (currentByte!5554 thiss!1305) (currentBit!5549 thiss!1305)))))

(declare-fun b!121388 () Bool)

(declare-fun e!79498 () Bool)

(assert (=> b!121388 (= e!79497 e!79498)))

(declare-fun res!100537 () Bool)

(assert (=> b!121388 (=> (not res!100537) (not e!79498))))

(declare-fun lt!189958 () tuple2!10182)

(assert (=> b!121388 (= res!100537 (and (= (_2!5356 lt!189958) lt!189216) (= (_1!5356 lt!189958) (_2!5355 lt!189960))))))

(assert (=> b!121388 (= lt!189958 (readBitPure!0 (readerFrom!0 (_2!5355 lt!189960) (currentBit!5549 thiss!1305) (currentByte!5554 thiss!1305))))))

(declare-fun b!121389 () Bool)

(assert (=> b!121389 (= e!79498 (= (bitIndex!0 (size!2435 (buf!2869 (_1!5356 lt!189958))) (currentByte!5554 (_1!5356 lt!189958)) (currentBit!5549 (_1!5356 lt!189958))) (bitIndex!0 (size!2435 (buf!2869 (_2!5355 lt!189960))) (currentByte!5554 (_2!5355 lt!189960)) (currentBit!5549 (_2!5355 lt!189960)))))))

(assert (= (and d!39166 res!100538) b!121386))

(assert (= (and b!121386 res!100539) b!121387))

(assert (= (and b!121387 res!100536) b!121388))

(assert (= (and b!121388 res!100537) b!121389))

(declare-fun m!183929 () Bool)

(assert (=> b!121389 m!183929))

(declare-fun m!183931 () Bool)

(assert (=> b!121389 m!183931))

(declare-fun m!183933 () Bool)

(assert (=> b!121387 m!183933))

(declare-fun m!183935 () Bool)

(assert (=> d!39166 m!183935))

(declare-fun m!183937 () Bool)

(assert (=> d!39166 m!183937))

(declare-fun m!183939 () Bool)

(assert (=> b!121388 m!183939))

(assert (=> b!121388 m!183939))

(declare-fun m!183941 () Bool)

(assert (=> b!121388 m!183941))

(assert (=> b!121386 m!183931))

(assert (=> b!121386 m!183327))

(assert (=> b!121110 d!39166))

(declare-fun d!39168 () Bool)

(declare-fun lt!189961 () tuple2!10194)

(assert (=> d!39168 (= lt!189961 (readBit!0 (readerFrom!0 (_2!5355 lt!189212) (currentBit!5549 thiss!1305) (currentByte!5554 thiss!1305))))))

(assert (=> d!39168 (= (readBitPure!0 (readerFrom!0 (_2!5355 lt!189212) (currentBit!5549 thiss!1305) (currentByte!5554 thiss!1305))) (tuple2!10183 (_2!5362 lt!189961) (_1!5362 lt!189961)))))

(declare-fun bs!9474 () Bool)

(assert (= bs!9474 d!39168))

(assert (=> bs!9474 m!183379))

(declare-fun m!183943 () Bool)

(assert (=> bs!9474 m!183943))

(assert (=> b!121121 d!39168))

(declare-fun d!39170 () Bool)

(declare-fun e!79501 () Bool)

(assert (=> d!39170 e!79501))

(declare-fun res!100543 () Bool)

(assert (=> d!39170 (=> (not res!100543) (not e!79501))))

(assert (=> d!39170 (= res!100543 (invariant!0 (currentBit!5549 (_2!5355 lt!189212)) (currentByte!5554 (_2!5355 lt!189212)) (size!2435 (buf!2869 (_2!5355 lt!189212)))))))

(assert (=> d!39170 (= (readerFrom!0 (_2!5355 lt!189212) (currentBit!5549 thiss!1305) (currentByte!5554 thiss!1305)) (BitStream!4345 (buf!2869 (_2!5355 lt!189212)) (currentByte!5554 thiss!1305) (currentBit!5549 thiss!1305)))))

(declare-fun b!121392 () Bool)

(assert (=> b!121392 (= e!79501 (invariant!0 (currentBit!5549 thiss!1305) (currentByte!5554 thiss!1305) (size!2435 (buf!2869 (_2!5355 lt!189212)))))))

(assert (= (and d!39170 res!100543) b!121392))

(declare-fun m!183945 () Bool)

(assert (=> d!39170 m!183945))

(assert (=> b!121392 m!183371))

(assert (=> b!121121 d!39170))

(declare-fun d!39172 () Bool)

(assert (=> d!39172 (= (invariant!0 (currentBit!5549 thiss!1305) (currentByte!5554 thiss!1305) (size!2435 (buf!2869 (_2!5355 lt!189212)))) (and (bvsge (currentBit!5549 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5549 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5554 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5554 thiss!1305) (size!2435 (buf!2869 (_2!5355 lt!189212)))) (and (= (currentBit!5549 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5554 thiss!1305) (size!2435 (buf!2869 (_2!5355 lt!189212))))))))))

(assert (=> b!121111 d!39172))

(declare-fun d!39174 () Bool)

(declare-fun e!79502 () Bool)

(assert (=> d!39174 e!79502))

(declare-fun res!100544 () Bool)

(assert (=> d!39174 (=> (not res!100544) (not e!79502))))

(declare-fun lt!189967 () (_ BitVec 64))

(declare-fun lt!189964 () (_ BitVec 64))

(declare-fun lt!189963 () (_ BitVec 64))

(assert (=> d!39174 (= res!100544 (= lt!189963 (bvsub lt!189967 lt!189964)))))

(assert (=> d!39174 (or (= (bvand lt!189967 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!189964 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!189967 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!189967 lt!189964) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39174 (= lt!189964 (remainingBits!0 ((_ sign_extend 32) (size!2435 (buf!2869 (_2!5355 lt!189212)))) ((_ sign_extend 32) (currentByte!5554 (_2!5355 lt!189212))) ((_ sign_extend 32) (currentBit!5549 (_2!5355 lt!189212)))))))

(declare-fun lt!189965 () (_ BitVec 64))

(declare-fun lt!189962 () (_ BitVec 64))

(assert (=> d!39174 (= lt!189967 (bvmul lt!189965 lt!189962))))

(assert (=> d!39174 (or (= lt!189965 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!189962 (bvsdiv (bvmul lt!189965 lt!189962) lt!189965)))))

(assert (=> d!39174 (= lt!189962 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39174 (= lt!189965 ((_ sign_extend 32) (size!2435 (buf!2869 (_2!5355 lt!189212)))))))

(assert (=> d!39174 (= lt!189963 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5554 (_2!5355 lt!189212))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5549 (_2!5355 lt!189212)))))))

(assert (=> d!39174 (invariant!0 (currentBit!5549 (_2!5355 lt!189212)) (currentByte!5554 (_2!5355 lt!189212)) (size!2435 (buf!2869 (_2!5355 lt!189212))))))

(assert (=> d!39174 (= (bitIndex!0 (size!2435 (buf!2869 (_2!5355 lt!189212))) (currentByte!5554 (_2!5355 lt!189212)) (currentBit!5549 (_2!5355 lt!189212))) lt!189963)))

(declare-fun b!121393 () Bool)

(declare-fun res!100545 () Bool)

(assert (=> b!121393 (=> (not res!100545) (not e!79502))))

(assert (=> b!121393 (= res!100545 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!189963))))

(declare-fun b!121394 () Bool)

(declare-fun lt!189966 () (_ BitVec 64))

(assert (=> b!121394 (= e!79502 (bvsle lt!189963 (bvmul lt!189966 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!121394 (or (= lt!189966 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!189966 #b0000000000000000000000000000000000000000000000000000000000001000) lt!189966)))))

(assert (=> b!121394 (= lt!189966 ((_ sign_extend 32) (size!2435 (buf!2869 (_2!5355 lt!189212)))))))

(assert (= (and d!39174 res!100544) b!121393))

(assert (= (and b!121393 res!100545) b!121394))

(declare-fun m!183947 () Bool)

(assert (=> d!39174 m!183947))

(assert (=> d!39174 m!183945))

(assert (=> b!121119 d!39174))

(declare-fun d!39176 () Bool)

(declare-fun e!79503 () Bool)

(assert (=> d!39176 e!79503))

(declare-fun res!100546 () Bool)

(assert (=> d!39176 (=> (not res!100546) (not e!79503))))

(declare-fun lt!189970 () (_ BitVec 64))

(declare-fun lt!189973 () (_ BitVec 64))

(declare-fun lt!189969 () (_ BitVec 64))

(assert (=> d!39176 (= res!100546 (= lt!189969 (bvsub lt!189973 lt!189970)))))

(assert (=> d!39176 (or (= (bvand lt!189973 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!189970 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!189973 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!189973 lt!189970) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39176 (= lt!189970 (remainingBits!0 ((_ sign_extend 32) (size!2435 (buf!2869 thiss!1305))) ((_ sign_extend 32) (currentByte!5554 thiss!1305)) ((_ sign_extend 32) (currentBit!5549 thiss!1305))))))

(declare-fun lt!189971 () (_ BitVec 64))

(declare-fun lt!189968 () (_ BitVec 64))

(assert (=> d!39176 (= lt!189973 (bvmul lt!189971 lt!189968))))

(assert (=> d!39176 (or (= lt!189971 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!189968 (bvsdiv (bvmul lt!189971 lt!189968) lt!189971)))))

(assert (=> d!39176 (= lt!189968 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39176 (= lt!189971 ((_ sign_extend 32) (size!2435 (buf!2869 thiss!1305))))))

(assert (=> d!39176 (= lt!189969 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5554 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5549 thiss!1305))))))

(assert (=> d!39176 (invariant!0 (currentBit!5549 thiss!1305) (currentByte!5554 thiss!1305) (size!2435 (buf!2869 thiss!1305)))))

(assert (=> d!39176 (= (bitIndex!0 (size!2435 (buf!2869 thiss!1305)) (currentByte!5554 thiss!1305) (currentBit!5549 thiss!1305)) lt!189969)))

(declare-fun b!121395 () Bool)

(declare-fun res!100547 () Bool)

(assert (=> b!121395 (=> (not res!100547) (not e!79503))))

(assert (=> b!121395 (= res!100547 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!189969))))

(declare-fun b!121396 () Bool)

(declare-fun lt!189972 () (_ BitVec 64))

(assert (=> b!121396 (= e!79503 (bvsle lt!189969 (bvmul lt!189972 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!121396 (or (= lt!189972 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!189972 #b0000000000000000000000000000000000000000000000000000000000001000) lt!189972)))))

(assert (=> b!121396 (= lt!189972 ((_ sign_extend 32) (size!2435 (buf!2869 thiss!1305))))))

(assert (= (and d!39176 res!100546) b!121395))

(assert (= (and b!121395 res!100547) b!121396))

(declare-fun m!183949 () Bool)

(assert (=> d!39176 m!183949))

(declare-fun m!183951 () Bool)

(assert (=> d!39176 m!183951))

(assert (=> b!121119 d!39176))

(declare-fun d!39178 () Bool)

(assert (=> d!39178 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!121115 d!39178))

(declare-fun d!39180 () Bool)

(declare-fun e!79504 () Bool)

(assert (=> d!39180 e!79504))

(declare-fun res!100548 () Bool)

(assert (=> d!39180 (=> (not res!100548) (not e!79504))))

(declare-fun lt!189975 () (_ BitVec 64))

(declare-fun lt!189979 () (_ BitVec 64))

(declare-fun lt!189976 () (_ BitVec 64))

(assert (=> d!39180 (= res!100548 (= lt!189975 (bvsub lt!189979 lt!189976)))))

(assert (=> d!39180 (or (= (bvand lt!189979 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!189976 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!189979 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!189979 lt!189976) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39180 (= lt!189976 (remainingBits!0 ((_ sign_extend 32) (size!2435 (buf!2869 (_1!5356 lt!189231)))) ((_ sign_extend 32) (currentByte!5554 (_1!5356 lt!189231))) ((_ sign_extend 32) (currentBit!5549 (_1!5356 lt!189231)))))))

(declare-fun lt!189977 () (_ BitVec 64))

(declare-fun lt!189974 () (_ BitVec 64))

(assert (=> d!39180 (= lt!189979 (bvmul lt!189977 lt!189974))))

(assert (=> d!39180 (or (= lt!189977 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!189974 (bvsdiv (bvmul lt!189977 lt!189974) lt!189977)))))

(assert (=> d!39180 (= lt!189974 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39180 (= lt!189977 ((_ sign_extend 32) (size!2435 (buf!2869 (_1!5356 lt!189231)))))))

(assert (=> d!39180 (= lt!189975 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5554 (_1!5356 lt!189231))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5549 (_1!5356 lt!189231)))))))

(assert (=> d!39180 (invariant!0 (currentBit!5549 (_1!5356 lt!189231)) (currentByte!5554 (_1!5356 lt!189231)) (size!2435 (buf!2869 (_1!5356 lt!189231))))))

(assert (=> d!39180 (= (bitIndex!0 (size!2435 (buf!2869 (_1!5356 lt!189231))) (currentByte!5554 (_1!5356 lt!189231)) (currentBit!5549 (_1!5356 lt!189231))) lt!189975)))

(declare-fun b!121397 () Bool)

(declare-fun res!100549 () Bool)

(assert (=> b!121397 (=> (not res!100549) (not e!79504))))

(assert (=> b!121397 (= res!100549 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!189975))))

(declare-fun b!121398 () Bool)

(declare-fun lt!189978 () (_ BitVec 64))

(assert (=> b!121398 (= e!79504 (bvsle lt!189975 (bvmul lt!189978 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!121398 (or (= lt!189978 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!189978 #b0000000000000000000000000000000000000000000000000000000000001000) lt!189978)))))

(assert (=> b!121398 (= lt!189978 ((_ sign_extend 32) (size!2435 (buf!2869 (_1!5356 lt!189231)))))))

(assert (= (and d!39180 res!100548) b!121397))

(assert (= (and b!121397 res!100549) b!121398))

(declare-fun m!183953 () Bool)

(assert (=> d!39180 m!183953))

(declare-fun m!183955 () Bool)

(assert (=> d!39180 m!183955))

(assert (=> b!121116 d!39180))

(declare-fun d!39182 () Bool)

(assert (=> d!39182 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2435 (buf!2869 thiss!1305))) ((_ sign_extend 32) (currentByte!5554 thiss!1305)) ((_ sign_extend 32) (currentBit!5549 thiss!1305)) lt!189211) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2435 (buf!2869 thiss!1305))) ((_ sign_extend 32) (currentByte!5554 thiss!1305)) ((_ sign_extend 32) (currentBit!5549 thiss!1305))) lt!189211))))

(declare-fun bs!9475 () Bool)

(assert (= bs!9475 d!39182))

(assert (=> bs!9475 m!183949))

(assert (=> b!121112 d!39182))

(declare-fun d!39184 () Bool)

(declare-fun res!100552 () Bool)

(declare-fun e!79505 () Bool)

(assert (=> d!39184 (=> (not res!100552) (not e!79505))))

(assert (=> d!39184 (= res!100552 (= (size!2435 (buf!2869 thiss!1305)) (size!2435 (buf!2869 (_2!5355 lt!189212)))))))

(assert (=> d!39184 (= (isPrefixOf!0 thiss!1305 (_2!5355 lt!189212)) e!79505)))

(declare-fun b!121399 () Bool)

(declare-fun res!100551 () Bool)

(assert (=> b!121399 (=> (not res!100551) (not e!79505))))

(assert (=> b!121399 (= res!100551 (bvsle (bitIndex!0 (size!2435 (buf!2869 thiss!1305)) (currentByte!5554 thiss!1305) (currentBit!5549 thiss!1305)) (bitIndex!0 (size!2435 (buf!2869 (_2!5355 lt!189212))) (currentByte!5554 (_2!5355 lt!189212)) (currentBit!5549 (_2!5355 lt!189212)))))))

(declare-fun b!121400 () Bool)

(declare-fun e!79506 () Bool)

(assert (=> b!121400 (= e!79505 e!79506)))

(declare-fun res!100550 () Bool)

(assert (=> b!121400 (=> res!100550 e!79506)))

(assert (=> b!121400 (= res!100550 (= (size!2435 (buf!2869 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!121401 () Bool)

(assert (=> b!121401 (= e!79506 (arrayBitRangesEq!0 (buf!2869 thiss!1305) (buf!2869 (_2!5355 lt!189212)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2435 (buf!2869 thiss!1305)) (currentByte!5554 thiss!1305) (currentBit!5549 thiss!1305))))))

(assert (= (and d!39184 res!100552) b!121399))

(assert (= (and b!121399 res!100551) b!121400))

(assert (= (and b!121400 (not res!100550)) b!121401))

(assert (=> b!121399 m!183327))

(assert (=> b!121399 m!183325))

(assert (=> b!121401 m!183327))

(assert (=> b!121401 m!183327))

(declare-fun m!183957 () Bool)

(assert (=> b!121401 m!183957))

(assert (=> b!121123 d!39184))

(declare-fun d!39186 () Bool)

(declare-fun e!79509 () Bool)

(assert (=> d!39186 e!79509))

(declare-fun res!100555 () Bool)

(assert (=> d!39186 (=> (not res!100555) (not e!79509))))

(declare-fun lt!189985 () (_ BitVec 64))

(declare-fun lt!189984 () BitStream!4344)

(assert (=> d!39186 (= res!100555 (= (bvadd lt!189985 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2435 (buf!2869 lt!189984)) (currentByte!5554 lt!189984) (currentBit!5549 lt!189984))))))

(assert (=> d!39186 (or (not (= (bvand lt!189985 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!189985 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!189985 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39186 (= lt!189985 (bitIndex!0 (size!2435 (buf!2869 (_1!5354 lt!189233))) (currentByte!5554 (_1!5354 lt!189233)) (currentBit!5549 (_1!5354 lt!189233))))))

(declare-fun moveBitIndex!0 (BitStream!4344 (_ BitVec 64)) tuple2!10180)

(assert (=> d!39186 (= lt!189984 (_2!5355 (moveBitIndex!0 (_1!5354 lt!189233) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!4344 (_ BitVec 64)) Bool)

(assert (=> d!39186 (moveBitIndexPrecond!0 (_1!5354 lt!189233) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!39186 (= (withMovedBitIndex!0 (_1!5354 lt!189233) #b0000000000000000000000000000000000000000000000000000000000000001) lt!189984)))

(declare-fun b!121404 () Bool)

(assert (=> b!121404 (= e!79509 (= (size!2435 (buf!2869 (_1!5354 lt!189233))) (size!2435 (buf!2869 lt!189984))))))

(assert (= (and d!39186 res!100555) b!121404))

(declare-fun m!183959 () Bool)

(assert (=> d!39186 m!183959))

(declare-fun m!183961 () Bool)

(assert (=> d!39186 m!183961))

(declare-fun m!183963 () Bool)

(assert (=> d!39186 m!183963))

(declare-fun m!183965 () Bool)

(assert (=> d!39186 m!183965))

(assert (=> b!121113 d!39186))

(declare-fun d!39188 () Bool)

(declare-fun lt!189986 () tuple2!10192)

(assert (=> d!39188 (= lt!189986 (readNLeastSignificantBitsLoop!0 lt!189234 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!189232))))

(assert (=> d!39188 (= (readNLeastSignificantBitsLoopPure!0 lt!189234 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!189232) (tuple2!10177 (_2!5361 lt!189986) (_1!5361 lt!189986)))))

(declare-fun bs!9476 () Bool)

(assert (= bs!9476 d!39188))

(declare-fun m!183967 () Bool)

(assert (=> bs!9476 m!183967))

(assert (=> b!121113 d!39188))

(assert (=> b!121113 d!39174))

(declare-fun d!39190 () Bool)

(declare-fun lt!190002 () tuple2!10176)

(declare-fun lt!190004 () tuple2!10176)

(assert (=> d!39190 (and (= (_2!5353 lt!190002) (_2!5353 lt!190004)) (= (_1!5353 lt!190002) (_1!5353 lt!190004)))))

(declare-fun lt!190000 () BitStream!4344)

(declare-fun lt!189999 () Unit!7461)

(declare-fun lt!190003 () Bool)

(declare-fun lt!190001 () (_ BitVec 64))

(declare-fun choose!45 (BitStream!4344 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!10176 tuple2!10176 BitStream!4344 (_ BitVec 64) Bool BitStream!4344 (_ BitVec 64) tuple2!10176 tuple2!10176 BitStream!4344 (_ BitVec 64)) Unit!7461)

(assert (=> d!39190 (= lt!189999 (choose!45 (_1!5354 lt!189233) nBits!396 i!615 lt!189227 lt!190002 (tuple2!10177 (_1!5353 lt!190002) (_2!5353 lt!190002)) (_1!5353 lt!190002) (_2!5353 lt!190002) lt!190003 lt!190000 lt!190001 lt!190004 (tuple2!10177 (_1!5353 lt!190004) (_2!5353 lt!190004)) (_1!5353 lt!190004) (_2!5353 lt!190004)))))

(assert (=> d!39190 (= lt!190004 (readNLeastSignificantBitsLoopPure!0 lt!190000 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!190001))))

(assert (=> d!39190 (= lt!190001 (bvor lt!189227 (ite lt!190003 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39190 (= lt!190000 (withMovedBitIndex!0 (_1!5354 lt!189233) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!39190 (= lt!190003 (_2!5356 (readBitPure!0 (_1!5354 lt!189233))))))

(assert (=> d!39190 (= lt!190002 (readNLeastSignificantBitsLoopPure!0 (_1!5354 lt!189233) nBits!396 i!615 lt!189227))))

(assert (=> d!39190 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5354 lt!189233) nBits!396 i!615 lt!189227) lt!189999)))

(declare-fun bs!9478 () Bool)

(assert (= bs!9478 d!39190))

(assert (=> bs!9478 m!183335))

(declare-fun m!183969 () Bool)

(assert (=> bs!9478 m!183969))

(assert (=> bs!9478 m!183337))

(assert (=> bs!9478 m!183393))

(declare-fun m!183971 () Bool)

(assert (=> bs!9478 m!183971))

(assert (=> b!121113 d!39190))

(declare-fun d!39192 () Bool)

(declare-fun e!79510 () Bool)

(assert (=> d!39192 e!79510))

(declare-fun res!100556 () Bool)

(assert (=> d!39192 (=> (not res!100556) (not e!79510))))

(declare-fun lt!190005 () BitStream!4344)

(declare-fun lt!190006 () (_ BitVec 64))

(assert (=> d!39192 (= res!100556 (= (bvadd lt!190006 (bvsub lt!189237 lt!189217)) (bitIndex!0 (size!2435 (buf!2869 lt!190005)) (currentByte!5554 lt!190005) (currentBit!5549 lt!190005))))))

(assert (=> d!39192 (or (not (= (bvand lt!190006 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!189237 lt!189217) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!190006 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!190006 (bvsub lt!189237 lt!189217)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39192 (= lt!190006 (bitIndex!0 (size!2435 (buf!2869 (_2!5354 lt!189233))) (currentByte!5554 (_2!5354 lt!189233)) (currentBit!5549 (_2!5354 lt!189233))))))

(assert (=> d!39192 (= lt!190005 (_2!5355 (moveBitIndex!0 (_2!5354 lt!189233) (bvsub lt!189237 lt!189217))))))

(assert (=> d!39192 (moveBitIndexPrecond!0 (_2!5354 lt!189233) (bvsub lt!189237 lt!189217))))

(assert (=> d!39192 (= (withMovedBitIndex!0 (_2!5354 lt!189233) (bvsub lt!189237 lt!189217)) lt!190005)))

(declare-fun b!121405 () Bool)

(assert (=> b!121405 (= e!79510 (= (size!2435 (buf!2869 (_2!5354 lt!189233))) (size!2435 (buf!2869 lt!190005))))))

(assert (= (and d!39192 res!100556) b!121405))

(declare-fun m!183973 () Bool)

(assert (=> d!39192 m!183973))

(declare-fun m!183975 () Bool)

(assert (=> d!39192 m!183975))

(declare-fun m!183977 () Bool)

(assert (=> d!39192 m!183977))

(declare-fun m!183979 () Bool)

(assert (=> d!39192 m!183979))

(assert (=> b!121113 d!39192))

(declare-fun d!39194 () Bool)

(declare-fun e!79511 () Bool)

(assert (=> d!39194 e!79511))

(declare-fun res!100557 () Bool)

(assert (=> d!39194 (=> (not res!100557) (not e!79511))))

(declare-fun lt!190008 () (_ BitVec 64))

(declare-fun lt!190009 () (_ BitVec 64))

(declare-fun lt!190012 () (_ BitVec 64))

(assert (=> d!39194 (= res!100557 (= lt!190008 (bvsub lt!190012 lt!190009)))))

(assert (=> d!39194 (or (= (bvand lt!190012 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!190009 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!190012 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!190012 lt!190009) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39194 (= lt!190009 (remainingBits!0 ((_ sign_extend 32) (size!2435 (buf!2869 (_2!5355 lt!189220)))) ((_ sign_extend 32) (currentByte!5554 (_2!5355 lt!189220))) ((_ sign_extend 32) (currentBit!5549 (_2!5355 lt!189220)))))))

(declare-fun lt!190010 () (_ BitVec 64))

(declare-fun lt!190007 () (_ BitVec 64))

(assert (=> d!39194 (= lt!190012 (bvmul lt!190010 lt!190007))))

(assert (=> d!39194 (or (= lt!190010 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!190007 (bvsdiv (bvmul lt!190010 lt!190007) lt!190010)))))

(assert (=> d!39194 (= lt!190007 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39194 (= lt!190010 ((_ sign_extend 32) (size!2435 (buf!2869 (_2!5355 lt!189220)))))))

(assert (=> d!39194 (= lt!190008 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5554 (_2!5355 lt!189220))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5549 (_2!5355 lt!189220)))))))

(assert (=> d!39194 (invariant!0 (currentBit!5549 (_2!5355 lt!189220)) (currentByte!5554 (_2!5355 lt!189220)) (size!2435 (buf!2869 (_2!5355 lt!189220))))))

(assert (=> d!39194 (= (bitIndex!0 (size!2435 (buf!2869 (_2!5355 lt!189220))) (currentByte!5554 (_2!5355 lt!189220)) (currentBit!5549 (_2!5355 lt!189220))) lt!190008)))

(declare-fun b!121406 () Bool)

(declare-fun res!100558 () Bool)

(assert (=> b!121406 (=> (not res!100558) (not e!79511))))

(assert (=> b!121406 (= res!100558 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!190008))))

(declare-fun b!121407 () Bool)

(declare-fun lt!190011 () (_ BitVec 64))

(assert (=> b!121407 (= e!79511 (bvsle lt!190008 (bvmul lt!190011 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!121407 (or (= lt!190011 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!190011 #b0000000000000000000000000000000000000000000000000000000000001000) lt!190011)))))

(assert (=> b!121407 (= lt!190011 ((_ sign_extend 32) (size!2435 (buf!2869 (_2!5355 lt!189220)))))))

(assert (= (and d!39194 res!100557) b!121406))

(assert (= (and b!121406 res!100558) b!121407))

(declare-fun m!183981 () Bool)

(assert (=> d!39194 m!183981))

(declare-fun m!183983 () Bool)

(assert (=> d!39194 m!183983))

(assert (=> b!121113 d!39194))

(declare-fun d!39196 () Bool)

(declare-fun e!79512 () Bool)

(assert (=> d!39196 e!79512))

(declare-fun res!100559 () Bool)

(assert (=> d!39196 (=> (not res!100559) (not e!79512))))

(declare-fun lt!190014 () (_ BitVec 64))

(declare-fun lt!190013 () BitStream!4344)

(assert (=> d!39196 (= res!100559 (= (bvadd lt!190014 (bvsub lt!189225 lt!189217)) (bitIndex!0 (size!2435 (buf!2869 lt!190013)) (currentByte!5554 lt!190013) (currentBit!5549 lt!190013))))))

(assert (=> d!39196 (or (not (= (bvand lt!190014 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!189225 lt!189217) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!190014 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!190014 (bvsub lt!189225 lt!189217)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39196 (= lt!190014 (bitIndex!0 (size!2435 (buf!2869 (_2!5354 lt!189224))) (currentByte!5554 (_2!5354 lt!189224)) (currentBit!5549 (_2!5354 lt!189224))))))

(assert (=> d!39196 (= lt!190013 (_2!5355 (moveBitIndex!0 (_2!5354 lt!189224) (bvsub lt!189225 lt!189217))))))

(assert (=> d!39196 (moveBitIndexPrecond!0 (_2!5354 lt!189224) (bvsub lt!189225 lt!189217))))

(assert (=> d!39196 (= (withMovedBitIndex!0 (_2!5354 lt!189224) (bvsub lt!189225 lt!189217)) lt!190013)))

(declare-fun b!121408 () Bool)

(assert (=> b!121408 (= e!79512 (= (size!2435 (buf!2869 (_2!5354 lt!189224))) (size!2435 (buf!2869 lt!190013))))))

(assert (= (and d!39196 res!100559) b!121408))

(declare-fun m!183985 () Bool)

(assert (=> d!39196 m!183985))

(declare-fun m!183987 () Bool)

(assert (=> d!39196 m!183987))

(declare-fun m!183989 () Bool)

(assert (=> d!39196 m!183989))

(declare-fun m!183991 () Bool)

(assert (=> d!39196 m!183991))

(assert (=> b!121113 d!39196))

(assert (=> b!121113 d!39176))

(declare-fun d!39198 () Bool)

(assert (=> d!39198 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5549 thiss!1305) (currentByte!5554 thiss!1305) (size!2435 (buf!2869 thiss!1305))))))

(declare-fun bs!9479 () Bool)

(assert (= bs!9479 d!39198))

(assert (=> bs!9479 m!183951))

(assert (=> start!23920 d!39198))

(declare-fun d!39200 () Bool)

(assert (=> d!39200 (= (array_inv!2237 (buf!2869 thiss!1305)) (bvsge (size!2435 (buf!2869 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!121114 d!39200))

(check-sat (not d!39162) (not b!121366) (not d!39144) (not d!39196) (not d!39142) (not d!39158) (not bm!1580) (not b!121334) (not b!121392) (not d!39166) (not d!39182) (not d!39170) (not d!39176) (not d!39164) (not b!121368) (not d!39174) (not d!39138) (not b!121339) (not b!121356) (not b!121336) (not b!121370) (not b!121389) (not b!121387) (not b!121341) (not d!39180) (not b!121335) (not b!121333) (not b!121399) (not d!39134) (not d!39168) (not d!39190) (not b!121357) (not b!121331) (not d!39004) (not b!121388) (not b!121401) (not b!121386) (not b!121337) (not b!121373) (not d!39150) (not b!121342) (not d!39192) (not d!39154) (not b!121354) (not d!39188) (not d!39156) (not d!39186) (not d!39140) (not d!39148) (not b!121355) (not b!121372) (not d!39136) (not b!121330) (not d!39160) (not b!121371) (not d!39198) (not d!39194))
