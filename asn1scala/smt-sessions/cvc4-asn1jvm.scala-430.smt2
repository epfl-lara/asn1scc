; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11584 () Bool)

(assert start!11584)

(declare-fun b!57262 () Bool)

(declare-fun e!38021 () Bool)

(declare-fun e!38025 () Bool)

(assert (=> b!57262 (= e!38021 e!38025)))

(declare-fun res!47592 () Bool)

(assert (=> b!57262 (=> res!47592 e!38025)))

(declare-datatypes ((array!2627 0))(
  ( (array!2628 (arr!1750 (Array (_ BitVec 32) (_ BitVec 8))) (size!1192 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2072 0))(
  ( (BitStream!2073 (buf!1567 array!2627) (currentByte!3173 (_ BitVec 32)) (currentBit!3168 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3959 0))(
  ( (Unit!3960) )
))
(declare-datatypes ((tuple2!5218 0))(
  ( (tuple2!5219 (_1!2720 Unit!3959) (_2!2720 BitStream!2072)) )
))
(declare-fun lt!90295 () tuple2!5218)

(declare-fun lt!90288 () tuple2!5218)

(declare-fun isPrefixOf!0 (BitStream!2072 BitStream!2072) Bool)

(assert (=> b!57262 (= res!47592 (not (isPrefixOf!0 (_2!2720 lt!90295) (_2!2720 lt!90288))))))

(declare-fun thiss!1379 () BitStream!2072)

(assert (=> b!57262 (isPrefixOf!0 thiss!1379 (_2!2720 lt!90288))))

(declare-fun lt!90287 () Unit!3959)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2072 BitStream!2072 BitStream!2072) Unit!3959)

(assert (=> b!57262 (= lt!90287 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2720 lt!90295) (_2!2720 lt!90288)))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun srcBuffer!2 () array!2627)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2072 array!2627 (_ BitVec 64) (_ BitVec 64)) tuple2!5218)

(assert (=> b!57262 (= lt!90288 (appendBitsMSBFirstLoop!0 (_2!2720 lt!90295) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!38023 () Bool)

(assert (=> b!57262 e!38023))

(declare-fun res!47588 () Bool)

(assert (=> b!57262 (=> (not res!47588) (not e!38023))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!57262 (= res!47588 (validate_offset_bits!1 ((_ sign_extend 32) (size!1192 (buf!1567 (_2!2720 lt!90295)))) ((_ sign_extend 32) (currentByte!3173 thiss!1379)) ((_ sign_extend 32) (currentBit!3168 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!90294 () Unit!3959)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2072 array!2627 (_ BitVec 64)) Unit!3959)

(assert (=> b!57262 (= lt!90294 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1567 (_2!2720 lt!90295)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!5220 0))(
  ( (tuple2!5221 (_1!2721 BitStream!2072) (_2!2721 BitStream!2072)) )
))
(declare-fun lt!90286 () tuple2!5220)

(declare-fun reader!0 (BitStream!2072 BitStream!2072) tuple2!5220)

(assert (=> b!57262 (= lt!90286 (reader!0 thiss!1379 (_2!2720 lt!90295)))))

(declare-fun b!57263 () Bool)

(declare-fun res!47587 () Bool)

(assert (=> b!57263 (=> res!47587 e!38025)))

(assert (=> b!57263 (= res!47587 (not (= (size!1192 (buf!1567 thiss!1379)) (size!1192 (buf!1567 (_2!2720 lt!90288))))))))

(declare-fun res!47589 () Bool)

(declare-fun e!38020 () Bool)

(assert (=> start!11584 (=> (not res!47589) (not e!38020))))

(assert (=> start!11584 (= res!47589 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1192 srcBuffer!2))))))))

(assert (=> start!11584 e!38020))

(assert (=> start!11584 true))

(declare-fun array_inv!1095 (array!2627) Bool)

(assert (=> start!11584 (array_inv!1095 srcBuffer!2)))

(declare-fun e!38026 () Bool)

(declare-fun inv!12 (BitStream!2072) Bool)

(assert (=> start!11584 (and (inv!12 thiss!1379) e!38026)))

(declare-fun b!57264 () Bool)

(declare-fun lt!90289 () (_ BitVec 64))

(declare-fun lt!90293 () (_ BitVec 64))

(assert (=> b!57264 (= e!38025 (or (= lt!90289 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!90289 (bvand (bvsub lt!90293 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!57264 (= lt!90289 (bvand lt!90293 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!57264 (= lt!90293 (bvsub (bvadd (bitIndex!0 (size!1192 (buf!1567 (_2!2720 lt!90295))) (currentByte!3173 (_2!2720 lt!90295)) (currentBit!3168 (_2!2720 lt!90295))) to!314) i!635))))

(assert (=> b!57264 (= (size!1192 (buf!1567 (_2!2720 lt!90288))) (size!1192 (buf!1567 thiss!1379)))))

(declare-fun b!57265 () Bool)

(declare-fun res!47585 () Bool)

(assert (=> b!57265 (=> res!47585 e!38025)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!57265 (= res!47585 (not (invariant!0 (currentBit!3168 (_2!2720 lt!90288)) (currentByte!3173 (_2!2720 lt!90288)) (size!1192 (buf!1567 (_2!2720 lt!90288))))))))

(declare-fun b!57266 () Bool)

(declare-datatypes ((List!611 0))(
  ( (Nil!608) (Cons!607 (h!726 Bool) (t!1361 List!611)) )
))
(declare-fun head!430 (List!611) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2072 array!2627 (_ BitVec 64) (_ BitVec 64)) List!611)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2072 BitStream!2072 (_ BitVec 64)) List!611)

(assert (=> b!57266 (= e!38023 (= (head!430 (byteArrayBitContentToList!0 (_2!2720 lt!90295) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!430 (bitStreamReadBitsIntoList!0 (_2!2720 lt!90295) (_1!2721 lt!90286) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!57267 () Bool)

(declare-fun e!38024 () Bool)

(assert (=> b!57267 (= e!38024 e!38021)))

(declare-fun res!47584 () Bool)

(assert (=> b!57267 (=> res!47584 e!38021)))

(assert (=> b!57267 (= res!47584 (not (isPrefixOf!0 thiss!1379 (_2!2720 lt!90295))))))

(assert (=> b!57267 (validate_offset_bits!1 ((_ sign_extend 32) (size!1192 (buf!1567 (_2!2720 lt!90295)))) ((_ sign_extend 32) (currentByte!3173 (_2!2720 lt!90295))) ((_ sign_extend 32) (currentBit!3168 (_2!2720 lt!90295))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!90290 () Unit!3959)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2072 BitStream!2072 (_ BitVec 64) (_ BitVec 64)) Unit!3959)

(assert (=> b!57267 (= lt!90290 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2720 lt!90295) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2072 (_ BitVec 8) (_ BitVec 32)) tuple2!5218)

(assert (=> b!57267 (= lt!90295 (appendBitFromByte!0 thiss!1379 (select (arr!1750 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!57268 () Bool)

(declare-fun res!47590 () Bool)

(assert (=> b!57268 (=> (not res!47590) (not e!38020))))

(assert (=> b!57268 (= res!47590 (validate_offset_bits!1 ((_ sign_extend 32) (size!1192 (buf!1567 thiss!1379))) ((_ sign_extend 32) (currentByte!3173 thiss!1379)) ((_ sign_extend 32) (currentBit!3168 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!57269 () Bool)

(declare-fun res!47591 () Bool)

(assert (=> b!57269 (=> res!47591 e!38025)))

(declare-fun lt!90291 () (_ BitVec 64))

(assert (=> b!57269 (= res!47591 (not (= (bitIndex!0 (size!1192 (buf!1567 (_2!2720 lt!90288))) (currentByte!3173 (_2!2720 lt!90288)) (currentBit!3168 (_2!2720 lt!90288))) (bvsub (bvadd lt!90291 to!314) i!635))))))

(declare-fun b!57270 () Bool)

(assert (=> b!57270 (= e!38020 (not e!38024))))

(declare-fun res!47586 () Bool)

(assert (=> b!57270 (=> res!47586 e!38024)))

(assert (=> b!57270 (= res!47586 (bvsge i!635 to!314))))

(assert (=> b!57270 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!90292 () Unit!3959)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2072) Unit!3959)

(assert (=> b!57270 (= lt!90292 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!57270 (= lt!90291 (bitIndex!0 (size!1192 (buf!1567 thiss!1379)) (currentByte!3173 thiss!1379) (currentBit!3168 thiss!1379)))))

(declare-fun b!57271 () Bool)

(assert (=> b!57271 (= e!38026 (array_inv!1095 (buf!1567 thiss!1379)))))

(assert (= (and start!11584 res!47589) b!57268))

(assert (= (and b!57268 res!47590) b!57270))

(assert (= (and b!57270 (not res!47586)) b!57267))

(assert (= (and b!57267 (not res!47584)) b!57262))

(assert (= (and b!57262 res!47588) b!57266))

(assert (= (and b!57262 (not res!47592)) b!57269))

(assert (= (and b!57269 (not res!47591)) b!57265))

(assert (= (and b!57265 (not res!47585)) b!57263))

(assert (= (and b!57263 (not res!47587)) b!57264))

(assert (= start!11584 b!57271))

(declare-fun m!90285 () Bool)

(assert (=> b!57268 m!90285))

(declare-fun m!90287 () Bool)

(assert (=> b!57271 m!90287))

(declare-fun m!90289 () Bool)

(assert (=> b!57270 m!90289))

(declare-fun m!90291 () Bool)

(assert (=> b!57270 m!90291))

(declare-fun m!90293 () Bool)

(assert (=> b!57270 m!90293))

(declare-fun m!90295 () Bool)

(assert (=> b!57267 m!90295))

(declare-fun m!90297 () Bool)

(assert (=> b!57267 m!90297))

(assert (=> b!57267 m!90297))

(declare-fun m!90299 () Bool)

(assert (=> b!57267 m!90299))

(declare-fun m!90301 () Bool)

(assert (=> b!57267 m!90301))

(declare-fun m!90303 () Bool)

(assert (=> b!57267 m!90303))

(declare-fun m!90305 () Bool)

(assert (=> b!57264 m!90305))

(declare-fun m!90307 () Bool)

(assert (=> b!57262 m!90307))

(declare-fun m!90309 () Bool)

(assert (=> b!57262 m!90309))

(declare-fun m!90311 () Bool)

(assert (=> b!57262 m!90311))

(declare-fun m!90313 () Bool)

(assert (=> b!57262 m!90313))

(declare-fun m!90315 () Bool)

(assert (=> b!57262 m!90315))

(declare-fun m!90317 () Bool)

(assert (=> b!57262 m!90317))

(declare-fun m!90319 () Bool)

(assert (=> b!57262 m!90319))

(declare-fun m!90321 () Bool)

(assert (=> start!11584 m!90321))

(declare-fun m!90323 () Bool)

(assert (=> start!11584 m!90323))

(declare-fun m!90325 () Bool)

(assert (=> b!57265 m!90325))

(declare-fun m!90327 () Bool)

(assert (=> b!57266 m!90327))

(assert (=> b!57266 m!90327))

(declare-fun m!90329 () Bool)

(assert (=> b!57266 m!90329))

(declare-fun m!90331 () Bool)

(assert (=> b!57266 m!90331))

(assert (=> b!57266 m!90331))

(declare-fun m!90333 () Bool)

(assert (=> b!57266 m!90333))

(declare-fun m!90335 () Bool)

(assert (=> b!57269 m!90335))

(push 1)

(assert (not b!57264))

(assert (not b!57262))

(assert (not b!57269))

(assert (not b!57265))

(assert (not start!11584))

(assert (not b!57268))

(assert (not b!57271))

(assert (not b!57267))

(assert (not b!57270))

(assert (not b!57266))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!18268 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!18268 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1192 (buf!1567 thiss!1379))) ((_ sign_extend 32) (currentByte!3173 thiss!1379)) ((_ sign_extend 32) (currentBit!3168 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1192 (buf!1567 thiss!1379))) ((_ sign_extend 32) (currentByte!3173 thiss!1379)) ((_ sign_extend 32) (currentBit!3168 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4554 () Bool)

(assert (= bs!4554 d!18268))

(declare-fun m!90351 () Bool)

(assert (=> bs!4554 m!90351))

(assert (=> b!57268 d!18268))

(declare-fun d!18270 () Bool)

(declare-fun res!47626 () Bool)

(declare-fun e!38051 () Bool)

(assert (=> d!18270 (=> (not res!47626) (not e!38051))))

(assert (=> d!18270 (= res!47626 (= (size!1192 (buf!1567 thiss!1379)) (size!1192 (buf!1567 (_2!2720 lt!90295)))))))

(assert (=> d!18270 (= (isPrefixOf!0 thiss!1379 (_2!2720 lt!90295)) e!38051)))

(declare-fun b!57305 () Bool)

(declare-fun res!47628 () Bool)

(assert (=> b!57305 (=> (not res!47628) (not e!38051))))

(assert (=> b!57305 (= res!47628 (bvsle (bitIndex!0 (size!1192 (buf!1567 thiss!1379)) (currentByte!3173 thiss!1379) (currentBit!3168 thiss!1379)) (bitIndex!0 (size!1192 (buf!1567 (_2!2720 lt!90295))) (currentByte!3173 (_2!2720 lt!90295)) (currentBit!3168 (_2!2720 lt!90295)))))))

(declare-fun b!57306 () Bool)

(declare-fun e!38050 () Bool)

(assert (=> b!57306 (= e!38051 e!38050)))

(declare-fun res!47627 () Bool)

(assert (=> b!57306 (=> res!47627 e!38050)))

(assert (=> b!57306 (= res!47627 (= (size!1192 (buf!1567 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!57307 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2627 array!2627 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!57307 (= e!38050 (arrayBitRangesEq!0 (buf!1567 thiss!1379) (buf!1567 (_2!2720 lt!90295)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1192 (buf!1567 thiss!1379)) (currentByte!3173 thiss!1379) (currentBit!3168 thiss!1379))))))

(assert (= (and d!18270 res!47626) b!57305))

(assert (= (and b!57305 res!47628) b!57306))

(assert (= (and b!57306 (not res!47627)) b!57307))

(assert (=> b!57305 m!90293))

(assert (=> b!57305 m!90305))

(assert (=> b!57307 m!90293))

(assert (=> b!57307 m!90293))

(declare-fun m!90353 () Bool)

(assert (=> b!57307 m!90353))

(assert (=> b!57267 d!18270))

(declare-fun d!18272 () Bool)

(assert (=> d!18272 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1192 (buf!1567 (_2!2720 lt!90295)))) ((_ sign_extend 32) (currentByte!3173 (_2!2720 lt!90295))) ((_ sign_extend 32) (currentBit!3168 (_2!2720 lt!90295))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1192 (buf!1567 (_2!2720 lt!90295)))) ((_ sign_extend 32) (currentByte!3173 (_2!2720 lt!90295))) ((_ sign_extend 32) (currentBit!3168 (_2!2720 lt!90295)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!4555 () Bool)

(assert (= bs!4555 d!18272))

(declare-fun m!90355 () Bool)

(assert (=> bs!4555 m!90355))

(assert (=> b!57267 d!18272))

(declare-fun d!18274 () Bool)

(declare-fun e!38054 () Bool)

(assert (=> d!18274 e!38054))

(declare-fun res!47631 () Bool)

(assert (=> d!18274 (=> (not res!47631) (not e!38054))))

(assert (=> d!18274 (= res!47631 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!90322 () Unit!3959)

(declare-fun choose!27 (BitStream!2072 BitStream!2072 (_ BitVec 64) (_ BitVec 64)) Unit!3959)

(assert (=> d!18274 (= lt!90322 (choose!27 thiss!1379 (_2!2720 lt!90295) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!18274 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!18274 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2720 lt!90295) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!90322)))

(declare-fun b!57310 () Bool)

(assert (=> b!57310 (= e!38054 (validate_offset_bits!1 ((_ sign_extend 32) (size!1192 (buf!1567 (_2!2720 lt!90295)))) ((_ sign_extend 32) (currentByte!3173 (_2!2720 lt!90295))) ((_ sign_extend 32) (currentBit!3168 (_2!2720 lt!90295))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!18274 res!47631) b!57310))

(declare-fun m!90357 () Bool)

(assert (=> d!18274 m!90357))

(assert (=> b!57310 m!90295))

(assert (=> b!57267 d!18274))

(declare-fun b!57378 () Bool)

(declare-fun e!38090 () Bool)

(declare-datatypes ((tuple2!5238 0))(
  ( (tuple2!5239 (_1!2730 BitStream!2072) (_2!2730 Bool)) )
))
(declare-fun lt!90407 () tuple2!5238)

(declare-fun lt!90413 () tuple2!5218)

(assert (=> b!57378 (= e!38090 (= (bitIndex!0 (size!1192 (buf!1567 (_1!2730 lt!90407))) (currentByte!3173 (_1!2730 lt!90407)) (currentBit!3168 (_1!2730 lt!90407))) (bitIndex!0 (size!1192 (buf!1567 (_2!2720 lt!90413))) (currentByte!3173 (_2!2720 lt!90413)) (currentBit!3168 (_2!2720 lt!90413)))))))

(declare-fun b!57379 () Bool)

(declare-fun e!38091 () Bool)

(declare-fun lt!90412 () tuple2!5238)

(declare-fun lt!90418 () tuple2!5218)

(assert (=> b!57379 (= e!38091 (= (bitIndex!0 (size!1192 (buf!1567 (_1!2730 lt!90412))) (currentByte!3173 (_1!2730 lt!90412)) (currentBit!3168 (_1!2730 lt!90412))) (bitIndex!0 (size!1192 (buf!1567 (_2!2720 lt!90418))) (currentByte!3173 (_2!2720 lt!90418)) (currentBit!3168 (_2!2720 lt!90418)))))))

(declare-fun b!57380 () Bool)

(declare-fun res!47680 () Bool)

(declare-fun e!38089 () Bool)

(assert (=> b!57380 (=> (not res!47680) (not e!38089))))

(assert (=> b!57380 (= res!47680 (isPrefixOf!0 thiss!1379 (_2!2720 lt!90418)))))

(declare-fun b!57381 () Bool)

(assert (=> b!57381 (= e!38089 e!38091)))

(declare-fun res!47685 () Bool)

(assert (=> b!57381 (=> (not res!47685) (not e!38091))))

(declare-fun lt!90416 () Bool)

(assert (=> b!57381 (= res!47685 (and (= (_2!2730 lt!90412) lt!90416) (= (_1!2730 lt!90412) (_2!2720 lt!90418))))))

(declare-fun readBitPure!0 (BitStream!2072) tuple2!5238)

(declare-fun readerFrom!0 (BitStream!2072 (_ BitVec 32) (_ BitVec 32)) BitStream!2072)

(assert (=> b!57381 (= lt!90412 (readBitPure!0 (readerFrom!0 (_2!2720 lt!90418) (currentBit!3168 thiss!1379) (currentByte!3173 thiss!1379))))))

(declare-fun d!18276 () Bool)

(declare-fun e!38088 () Bool)

(assert (=> d!18276 e!38088))

(declare-fun res!47686 () Bool)

(assert (=> d!18276 (=> (not res!47686) (not e!38088))))

(assert (=> d!18276 (= res!47686 (= (size!1192 (buf!1567 (_2!2720 lt!90413))) (size!1192 (buf!1567 thiss!1379))))))

(declare-fun lt!90410 () (_ BitVec 8))

(declare-fun lt!90411 () array!2627)

(assert (=> d!18276 (= lt!90410 (select (arr!1750 lt!90411) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!18276 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1192 lt!90411)))))

(assert (=> d!18276 (= lt!90411 (array!2628 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!90417 () tuple2!5218)

(assert (=> d!18276 (= lt!90413 (tuple2!5219 (_1!2720 lt!90417) (_2!2720 lt!90417)))))

(assert (=> d!18276 (= lt!90417 lt!90418)))

(assert (=> d!18276 e!38089))

(declare-fun res!47681 () Bool)

(assert (=> d!18276 (=> (not res!47681) (not e!38089))))

(assert (=> d!18276 (= res!47681 (= (size!1192 (buf!1567 thiss!1379)) (size!1192 (buf!1567 (_2!2720 lt!90418)))))))

(declare-fun appendBit!0 (BitStream!2072 Bool) tuple2!5218)

(assert (=> d!18276 (= lt!90418 (appendBit!0 thiss!1379 lt!90416))))

(assert (=> d!18276 (= lt!90416 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1750 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!18276 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!18276 (= (appendBitFromByte!0 thiss!1379 (select (arr!1750 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!90413)))

(declare-fun b!57382 () Bool)

(declare-fun res!47684 () Bool)

(assert (=> b!57382 (=> (not res!47684) (not e!38089))))

(assert (=> b!57382 (= res!47684 (= (bitIndex!0 (size!1192 (buf!1567 (_2!2720 lt!90418))) (currentByte!3173 (_2!2720 lt!90418)) (currentBit!3168 (_2!2720 lt!90418))) (bvadd (bitIndex!0 (size!1192 (buf!1567 thiss!1379)) (currentByte!3173 thiss!1379) (currentBit!3168 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!57383 () Bool)

(assert (=> b!57383 (= e!38088 e!38090)))

(declare-fun res!47682 () Bool)

(assert (=> b!57383 (=> (not res!47682) (not e!38090))))

(assert (=> b!57383 (= res!47682 (and (= (_2!2730 lt!90407) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1750 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!90410)) #b00000000000000000000000000000000))) (= (_1!2730 lt!90407) (_2!2720 lt!90413))))))

(declare-datatypes ((tuple2!5240 0))(
  ( (tuple2!5241 (_1!2731 array!2627) (_2!2731 BitStream!2072)) )
))
(declare-fun lt!90415 () tuple2!5240)

(declare-fun lt!90408 () BitStream!2072)

(declare-fun readBits!0 (BitStream!2072 (_ BitVec 64)) tuple2!5240)

(assert (=> b!57383 (= lt!90415 (readBits!0 lt!90408 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!57383 (= lt!90407 (readBitPure!0 lt!90408))))

(assert (=> b!57383 (= lt!90408 (readerFrom!0 (_2!2720 lt!90413) (currentBit!3168 thiss!1379) (currentByte!3173 thiss!1379)))))

(declare-fun b!57384 () Bool)

(declare-fun res!47679 () Bool)

(assert (=> b!57384 (=> (not res!47679) (not e!38088))))

(assert (=> b!57384 (= res!47679 (isPrefixOf!0 thiss!1379 (_2!2720 lt!90413)))))

(declare-fun b!57385 () Bool)

(declare-fun res!47683 () Bool)

(assert (=> b!57385 (=> (not res!47683) (not e!38088))))

(declare-fun lt!90409 () (_ BitVec 64))

(declare-fun lt!90414 () (_ BitVec 64))

(assert (=> b!57385 (= res!47683 (= (bitIndex!0 (size!1192 (buf!1567 (_2!2720 lt!90413))) (currentByte!3173 (_2!2720 lt!90413)) (currentBit!3168 (_2!2720 lt!90413))) (bvadd lt!90409 lt!90414)))))

(assert (=> b!57385 (or (not (= (bvand lt!90409 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!90414 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!90409 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!90409 lt!90414) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!57385 (= lt!90414 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!57385 (= lt!90409 (bitIndex!0 (size!1192 (buf!1567 thiss!1379)) (currentByte!3173 thiss!1379) (currentBit!3168 thiss!1379)))))

(assert (= (and d!18276 res!47681) b!57382))

(assert (= (and b!57382 res!47684) b!57380))

(assert (= (and b!57380 res!47680) b!57381))

(assert (= (and b!57381 res!47685) b!57379))

(assert (= (and d!18276 res!47686) b!57385))

(assert (= (and b!57385 res!47683) b!57384))

(assert (= (and b!57384 res!47679) b!57383))

(assert (= (and b!57383 res!47682) b!57378))

(declare-fun m!90405 () Bool)

(assert (=> b!57379 m!90405))

(declare-fun m!90407 () Bool)

(assert (=> b!57379 m!90407))

(declare-fun m!90409 () Bool)

(assert (=> d!18276 m!90409))

(declare-fun m!90411 () Bool)

(assert (=> d!18276 m!90411))

(declare-fun m!90413 () Bool)

(assert (=> d!18276 m!90413))

(declare-fun m!90415 () Bool)

(assert (=> b!57378 m!90415))

(declare-fun m!90417 () Bool)

(assert (=> b!57378 m!90417))

(assert (=> b!57385 m!90417))

(assert (=> b!57385 m!90293))

(declare-fun m!90419 () Bool)

(assert (=> b!57381 m!90419))

(assert (=> b!57381 m!90419))

(declare-fun m!90421 () Bool)

(assert (=> b!57381 m!90421))

(assert (=> b!57382 m!90407))

(assert (=> b!57382 m!90293))

(declare-fun m!90423 () Bool)

(assert (=> b!57380 m!90423))

(declare-fun m!90425 () Bool)

(assert (=> b!57384 m!90425))

(declare-fun m!90427 () Bool)

(assert (=> b!57383 m!90427))

(declare-fun m!90429 () Bool)

(assert (=> b!57383 m!90429))

(declare-fun m!90431 () Bool)

(assert (=> b!57383 m!90431))

(assert (=> b!57267 d!18276))

(declare-fun d!18302 () Bool)

(assert (=> d!18302 (validate_offset_bits!1 ((_ sign_extend 32) (size!1192 (buf!1567 (_2!2720 lt!90295)))) ((_ sign_extend 32) (currentByte!3173 thiss!1379)) ((_ sign_extend 32) (currentBit!3168 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!90421 () Unit!3959)

(declare-fun choose!9 (BitStream!2072 array!2627 (_ BitVec 64) BitStream!2072) Unit!3959)

(assert (=> d!18302 (= lt!90421 (choose!9 thiss!1379 (buf!1567 (_2!2720 lt!90295)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2073 (buf!1567 (_2!2720 lt!90295)) (currentByte!3173 thiss!1379) (currentBit!3168 thiss!1379))))))

(assert (=> d!18302 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1567 (_2!2720 lt!90295)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!90421)))

(declare-fun bs!4559 () Bool)

(assert (= bs!4559 d!18302))

(assert (=> bs!4559 m!90317))

(declare-fun m!90433 () Bool)

(assert (=> bs!4559 m!90433))

(assert (=> b!57262 d!18302))

(declare-fun d!18304 () Bool)

(declare-fun res!47687 () Bool)

(declare-fun e!38093 () Bool)

(assert (=> d!18304 (=> (not res!47687) (not e!38093))))

(assert (=> d!18304 (= res!47687 (= (size!1192 (buf!1567 thiss!1379)) (size!1192 (buf!1567 (_2!2720 lt!90288)))))))

(assert (=> d!18304 (= (isPrefixOf!0 thiss!1379 (_2!2720 lt!90288)) e!38093)))

(declare-fun b!57386 () Bool)

(declare-fun res!47689 () Bool)

(assert (=> b!57386 (=> (not res!47689) (not e!38093))))

(assert (=> b!57386 (= res!47689 (bvsle (bitIndex!0 (size!1192 (buf!1567 thiss!1379)) (currentByte!3173 thiss!1379) (currentBit!3168 thiss!1379)) (bitIndex!0 (size!1192 (buf!1567 (_2!2720 lt!90288))) (currentByte!3173 (_2!2720 lt!90288)) (currentBit!3168 (_2!2720 lt!90288)))))))

(declare-fun b!57387 () Bool)

(declare-fun e!38092 () Bool)

(assert (=> b!57387 (= e!38093 e!38092)))

(declare-fun res!47688 () Bool)

(assert (=> b!57387 (=> res!47688 e!38092)))

(assert (=> b!57387 (= res!47688 (= (size!1192 (buf!1567 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!57388 () Bool)

(assert (=> b!57388 (= e!38092 (arrayBitRangesEq!0 (buf!1567 thiss!1379) (buf!1567 (_2!2720 lt!90288)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1192 (buf!1567 thiss!1379)) (currentByte!3173 thiss!1379) (currentBit!3168 thiss!1379))))))

(assert (= (and d!18304 res!47687) b!57386))

(assert (= (and b!57386 res!47689) b!57387))

(assert (= (and b!57387 (not res!47688)) b!57388))

(assert (=> b!57386 m!90293))

(assert (=> b!57386 m!90335))

(assert (=> b!57388 m!90293))

(assert (=> b!57388 m!90293))

(declare-fun m!90435 () Bool)

(assert (=> b!57388 m!90435))

(assert (=> b!57262 d!18304))

(declare-fun b!57533 () Bool)

(declare-fun res!47796 () Bool)

(declare-fun e!38160 () Bool)

(assert (=> b!57533 (=> (not res!47796) (not e!38160))))

(declare-fun lt!90925 () tuple2!5218)

(assert (=> b!57533 (= res!47796 (= (size!1192 (buf!1567 (_2!2720 lt!90295))) (size!1192 (buf!1567 (_2!2720 lt!90925)))))))

(declare-fun b!57534 () Bool)

(declare-fun e!38159 () Bool)

(declare-fun lt!90942 () (_ BitVec 64))

(assert (=> b!57534 (= e!38159 (validate_offset_bits!1 ((_ sign_extend 32) (size!1192 (buf!1567 (_2!2720 lt!90295)))) ((_ sign_extend 32) (currentByte!3173 (_2!2720 lt!90295))) ((_ sign_extend 32) (currentBit!3168 (_2!2720 lt!90295))) lt!90942))))

(declare-fun call!754 () tuple2!5220)

(declare-fun bm!751 () Bool)

(declare-fun c!4167 () Bool)

(declare-fun lt!90943 () tuple2!5218)

(assert (=> bm!751 (= call!754 (reader!0 (_2!2720 lt!90295) (ite c!4167 (_2!2720 lt!90943) (_2!2720 lt!90295))))))

(declare-fun d!18306 () Bool)

(assert (=> d!18306 e!38160))

(declare-fun res!47795 () Bool)

(assert (=> d!18306 (=> (not res!47795) (not e!38160))))

(declare-fun lt!90919 () (_ BitVec 64))

(assert (=> d!18306 (= res!47795 (= (bitIndex!0 (size!1192 (buf!1567 (_2!2720 lt!90925))) (currentByte!3173 (_2!2720 lt!90925)) (currentBit!3168 (_2!2720 lt!90925))) (bvsub lt!90919 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!18306 (or (= (bvand lt!90919 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!90919 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!90919 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!90924 () (_ BitVec 64))

(assert (=> d!18306 (= lt!90919 (bvadd lt!90924 to!314))))

(assert (=> d!18306 (or (not (= (bvand lt!90924 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!90924 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!90924 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18306 (= lt!90924 (bitIndex!0 (size!1192 (buf!1567 (_2!2720 lt!90295))) (currentByte!3173 (_2!2720 lt!90295)) (currentBit!3168 (_2!2720 lt!90295))))))

(declare-fun e!38161 () tuple2!5218)

(assert (=> d!18306 (= lt!90925 e!38161)))

(assert (=> d!18306 (= c!4167 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!90941 () Unit!3959)

(declare-fun lt!90918 () Unit!3959)

(assert (=> d!18306 (= lt!90941 lt!90918)))

(assert (=> d!18306 (isPrefixOf!0 (_2!2720 lt!90295) (_2!2720 lt!90295))))

(assert (=> d!18306 (= lt!90918 (lemmaIsPrefixRefl!0 (_2!2720 lt!90295)))))

(declare-fun lt!90937 () (_ BitVec 64))

(assert (=> d!18306 (= lt!90937 (bitIndex!0 (size!1192 (buf!1567 (_2!2720 lt!90295))) (currentByte!3173 (_2!2720 lt!90295)) (currentBit!3168 (_2!2720 lt!90295))))))

(assert (=> d!18306 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!18306 (= (appendBitsMSBFirstLoop!0 (_2!2720 lt!90295) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!90925)))

(declare-fun b!57535 () Bool)

(declare-fun res!47798 () Bool)

(assert (=> b!57535 (=> (not res!47798) (not e!38160))))

(assert (=> b!57535 (= res!47798 (invariant!0 (currentBit!3168 (_2!2720 lt!90925)) (currentByte!3173 (_2!2720 lt!90925)) (size!1192 (buf!1567 (_2!2720 lt!90925)))))))

(declare-fun b!57536 () Bool)

(declare-fun Unit!3977 () Unit!3959)

(assert (=> b!57536 (= e!38161 (tuple2!5219 Unit!3977 (_2!2720 lt!90943)))))

(declare-fun lt!90950 () tuple2!5218)

(assert (=> b!57536 (= lt!90950 (appendBitFromByte!0 (_2!2720 lt!90295) (select (arr!1750 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!90946 () (_ BitVec 64))

(assert (=> b!57536 (= lt!90946 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!90930 () (_ BitVec 64))

(assert (=> b!57536 (= lt!90930 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!90928 () Unit!3959)

(assert (=> b!57536 (= lt!90928 (validateOffsetBitsIneqLemma!0 (_2!2720 lt!90295) (_2!2720 lt!90950) lt!90946 lt!90930))))

(assert (=> b!57536 (validate_offset_bits!1 ((_ sign_extend 32) (size!1192 (buf!1567 (_2!2720 lt!90950)))) ((_ sign_extend 32) (currentByte!3173 (_2!2720 lt!90950))) ((_ sign_extend 32) (currentBit!3168 (_2!2720 lt!90950))) (bvsub lt!90946 lt!90930))))

(declare-fun lt!90926 () Unit!3959)

(assert (=> b!57536 (= lt!90926 lt!90928)))

(declare-fun lt!90936 () tuple2!5220)

(assert (=> b!57536 (= lt!90936 (reader!0 (_2!2720 lt!90295) (_2!2720 lt!90950)))))

(declare-fun lt!90938 () (_ BitVec 64))

(assert (=> b!57536 (= lt!90938 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!90951 () Unit!3959)

(assert (=> b!57536 (= lt!90951 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2720 lt!90295) (buf!1567 (_2!2720 lt!90950)) lt!90938))))

(assert (=> b!57536 (validate_offset_bits!1 ((_ sign_extend 32) (size!1192 (buf!1567 (_2!2720 lt!90950)))) ((_ sign_extend 32) (currentByte!3173 (_2!2720 lt!90295))) ((_ sign_extend 32) (currentBit!3168 (_2!2720 lt!90295))) lt!90938)))

(declare-fun lt!90940 () Unit!3959)

(assert (=> b!57536 (= lt!90940 lt!90951)))

(assert (=> b!57536 (= (head!430 (byteArrayBitContentToList!0 (_2!2720 lt!90950) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!430 (bitStreamReadBitsIntoList!0 (_2!2720 lt!90950) (_1!2721 lt!90936) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!90929 () Unit!3959)

(declare-fun Unit!3978 () Unit!3959)

(assert (=> b!57536 (= lt!90929 Unit!3978)))

(assert (=> b!57536 (= lt!90943 (appendBitsMSBFirstLoop!0 (_2!2720 lt!90950) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!90957 () Unit!3959)

(assert (=> b!57536 (= lt!90957 (lemmaIsPrefixTransitive!0 (_2!2720 lt!90295) (_2!2720 lt!90950) (_2!2720 lt!90943)))))

(assert (=> b!57536 (isPrefixOf!0 (_2!2720 lt!90295) (_2!2720 lt!90943))))

(declare-fun lt!90931 () Unit!3959)

(assert (=> b!57536 (= lt!90931 lt!90957)))

(assert (=> b!57536 (= (size!1192 (buf!1567 (_2!2720 lt!90943))) (size!1192 (buf!1567 (_2!2720 lt!90295))))))

(declare-fun lt!90953 () Unit!3959)

(declare-fun Unit!3979 () Unit!3959)

(assert (=> b!57536 (= lt!90953 Unit!3979)))

(assert (=> b!57536 (= (bitIndex!0 (size!1192 (buf!1567 (_2!2720 lt!90943))) (currentByte!3173 (_2!2720 lt!90943)) (currentBit!3168 (_2!2720 lt!90943))) (bvsub (bvadd (bitIndex!0 (size!1192 (buf!1567 (_2!2720 lt!90295))) (currentByte!3173 (_2!2720 lt!90295)) (currentBit!3168 (_2!2720 lt!90295))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!90933 () Unit!3959)

(declare-fun Unit!3980 () Unit!3959)

(assert (=> b!57536 (= lt!90933 Unit!3980)))

(assert (=> b!57536 (= (bitIndex!0 (size!1192 (buf!1567 (_2!2720 lt!90943))) (currentByte!3173 (_2!2720 lt!90943)) (currentBit!3168 (_2!2720 lt!90943))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1192 (buf!1567 (_2!2720 lt!90950))) (currentByte!3173 (_2!2720 lt!90950)) (currentBit!3168 (_2!2720 lt!90950))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!90945 () Unit!3959)

(declare-fun Unit!3981 () Unit!3959)

(assert (=> b!57536 (= lt!90945 Unit!3981)))

(declare-fun lt!90934 () tuple2!5220)

(assert (=> b!57536 (= lt!90934 call!754)))

(declare-fun lt!90959 () (_ BitVec 64))

(assert (=> b!57536 (= lt!90959 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!90952 () Unit!3959)

(assert (=> b!57536 (= lt!90952 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2720 lt!90295) (buf!1567 (_2!2720 lt!90943)) lt!90959))))

(assert (=> b!57536 (validate_offset_bits!1 ((_ sign_extend 32) (size!1192 (buf!1567 (_2!2720 lt!90943)))) ((_ sign_extend 32) (currentByte!3173 (_2!2720 lt!90295))) ((_ sign_extend 32) (currentBit!3168 (_2!2720 lt!90295))) lt!90959)))

(declare-fun lt!90947 () Unit!3959)

(assert (=> b!57536 (= lt!90947 lt!90952)))

(declare-fun lt!90956 () tuple2!5220)

(assert (=> b!57536 (= lt!90956 (reader!0 (_2!2720 lt!90950) (_2!2720 lt!90943)))))

(declare-fun lt!90958 () (_ BitVec 64))

(assert (=> b!57536 (= lt!90958 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!90921 () Unit!3959)

(assert (=> b!57536 (= lt!90921 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2720 lt!90950) (buf!1567 (_2!2720 lt!90943)) lt!90958))))

(assert (=> b!57536 (validate_offset_bits!1 ((_ sign_extend 32) (size!1192 (buf!1567 (_2!2720 lt!90943)))) ((_ sign_extend 32) (currentByte!3173 (_2!2720 lt!90950))) ((_ sign_extend 32) (currentBit!3168 (_2!2720 lt!90950))) lt!90958)))

(declare-fun lt!90939 () Unit!3959)

(assert (=> b!57536 (= lt!90939 lt!90921)))

(declare-fun lt!90948 () List!611)

(assert (=> b!57536 (= lt!90948 (byteArrayBitContentToList!0 (_2!2720 lt!90943) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!90935 () List!611)

(assert (=> b!57536 (= lt!90935 (byteArrayBitContentToList!0 (_2!2720 lt!90943) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!90922 () List!611)

(assert (=> b!57536 (= lt!90922 (bitStreamReadBitsIntoList!0 (_2!2720 lt!90943) (_1!2721 lt!90934) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!90920 () List!611)

(assert (=> b!57536 (= lt!90920 (bitStreamReadBitsIntoList!0 (_2!2720 lt!90943) (_1!2721 lt!90956) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!90923 () (_ BitVec 64))

(assert (=> b!57536 (= lt!90923 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!90932 () Unit!3959)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2072 BitStream!2072 BitStream!2072 BitStream!2072 (_ BitVec 64) List!611) Unit!3959)

(assert (=> b!57536 (= lt!90932 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2720 lt!90943) (_2!2720 lt!90943) (_1!2721 lt!90934) (_1!2721 lt!90956) lt!90923 lt!90922))))

(declare-fun tail!278 (List!611) List!611)

(assert (=> b!57536 (= (bitStreamReadBitsIntoList!0 (_2!2720 lt!90943) (_1!2721 lt!90956) (bvsub lt!90923 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!278 lt!90922))))

(declare-fun lt!90927 () Unit!3959)

(assert (=> b!57536 (= lt!90927 lt!90932)))

(declare-fun lt!90960 () Unit!3959)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2627 array!2627 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3959)

(assert (=> b!57536 (= lt!90960 (arrayBitRangesEqImpliesEq!0 (buf!1567 (_2!2720 lt!90950)) (buf!1567 (_2!2720 lt!90943)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!90937 (bitIndex!0 (size!1192 (buf!1567 (_2!2720 lt!90950))) (currentByte!3173 (_2!2720 lt!90950)) (currentBit!3168 (_2!2720 lt!90950)))))))

(declare-fun bitAt!0 (array!2627 (_ BitVec 64)) Bool)

(assert (=> b!57536 (= (bitAt!0 (buf!1567 (_2!2720 lt!90950)) lt!90937) (bitAt!0 (buf!1567 (_2!2720 lt!90943)) lt!90937))))

(declare-fun lt!90961 () Unit!3959)

(assert (=> b!57536 (= lt!90961 lt!90960)))

(declare-fun b!57537 () Bool)

(declare-fun Unit!3982 () Unit!3959)

(assert (=> b!57537 (= e!38161 (tuple2!5219 Unit!3982 (_2!2720 lt!90295)))))

(assert (=> b!57537 (= (size!1192 (buf!1567 (_2!2720 lt!90295))) (size!1192 (buf!1567 (_2!2720 lt!90295))))))

(declare-fun lt!90944 () Unit!3959)

(declare-fun Unit!3983 () Unit!3959)

(assert (=> b!57537 (= lt!90944 Unit!3983)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2072 array!2627 array!2627 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!57537 (checkByteArrayBitContent!0 (_2!2720 lt!90295) srcBuffer!2 (_1!2731 (readBits!0 (_1!2721 call!754) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!57538 () Bool)

(declare-fun lt!90954 () tuple2!5220)

(assert (=> b!57538 (= e!38160 (= (bitStreamReadBitsIntoList!0 (_2!2720 lt!90925) (_1!2721 lt!90954) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2720 lt!90925) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!57538 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!57538 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!90949 () Unit!3959)

(declare-fun lt!90955 () Unit!3959)

(assert (=> b!57538 (= lt!90949 lt!90955)))

(assert (=> b!57538 (validate_offset_bits!1 ((_ sign_extend 32) (size!1192 (buf!1567 (_2!2720 lt!90925)))) ((_ sign_extend 32) (currentByte!3173 (_2!2720 lt!90295))) ((_ sign_extend 32) (currentBit!3168 (_2!2720 lt!90295))) lt!90942)))

(assert (=> b!57538 (= lt!90955 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2720 lt!90295) (buf!1567 (_2!2720 lt!90925)) lt!90942))))

(assert (=> b!57538 e!38159))

(declare-fun res!47797 () Bool)

(assert (=> b!57538 (=> (not res!47797) (not e!38159))))

(assert (=> b!57538 (= res!47797 (and (= (size!1192 (buf!1567 (_2!2720 lt!90295))) (size!1192 (buf!1567 (_2!2720 lt!90925)))) (bvsge lt!90942 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!57538 (= lt!90942 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!57538 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!57538 (= lt!90954 (reader!0 (_2!2720 lt!90295) (_2!2720 lt!90925)))))

(declare-fun b!57539 () Bool)

(declare-fun res!47794 () Bool)

(assert (=> b!57539 (=> (not res!47794) (not e!38160))))

(assert (=> b!57539 (= res!47794 (= (size!1192 (buf!1567 (_2!2720 lt!90925))) (size!1192 (buf!1567 (_2!2720 lt!90295)))))))

(declare-fun b!57540 () Bool)

(declare-fun res!47793 () Bool)

(assert (=> b!57540 (=> (not res!47793) (not e!38160))))

(assert (=> b!57540 (= res!47793 (isPrefixOf!0 (_2!2720 lt!90295) (_2!2720 lt!90925)))))

(assert (= (and d!18306 c!4167) b!57536))

(assert (= (and d!18306 (not c!4167)) b!57537))

(assert (= (or b!57536 b!57537) bm!751))

(assert (= (and d!18306 res!47795) b!57535))

(assert (= (and b!57535 res!47798) b!57533))

(assert (= (and b!57533 res!47796) b!57540))

(assert (= (and b!57540 res!47793) b!57539))

(assert (= (and b!57539 res!47794) b!57538))

(assert (= (and b!57538 res!47797) b!57534))

(declare-fun m!90701 () Bool)

(assert (=> b!57536 m!90701))

(declare-fun m!90703 () Bool)

(assert (=> b!57536 m!90703))

(declare-fun m!90705 () Bool)

(assert (=> b!57536 m!90705))

(declare-fun m!90707 () Bool)

(assert (=> b!57536 m!90707))

(declare-fun m!90709 () Bool)

(assert (=> b!57536 m!90709))

(declare-fun m!90711 () Bool)

(assert (=> b!57536 m!90711))

(declare-fun m!90713 () Bool)

(assert (=> b!57536 m!90713))

(declare-fun m!90715 () Bool)

(assert (=> b!57536 m!90715))

(declare-fun m!90717 () Bool)

(assert (=> b!57536 m!90717))

(assert (=> b!57536 m!90305))

(declare-fun m!90719 () Bool)

(assert (=> b!57536 m!90719))

(declare-fun m!90721 () Bool)

(assert (=> b!57536 m!90721))

(declare-fun m!90723 () Bool)

(assert (=> b!57536 m!90723))

(declare-fun m!90725 () Bool)

(assert (=> b!57536 m!90725))

(assert (=> b!57536 m!90715))

(declare-fun m!90727 () Bool)

(assert (=> b!57536 m!90727))

(declare-fun m!90729 () Bool)

(assert (=> b!57536 m!90729))

(declare-fun m!90731 () Bool)

(assert (=> b!57536 m!90731))

(declare-fun m!90733 () Bool)

(assert (=> b!57536 m!90733))

(declare-fun m!90735 () Bool)

(assert (=> b!57536 m!90735))

(declare-fun m!90737 () Bool)

(assert (=> b!57536 m!90737))

(declare-fun m!90739 () Bool)

(assert (=> b!57536 m!90739))

(declare-fun m!90741 () Bool)

(assert (=> b!57536 m!90741))

(declare-fun m!90743 () Bool)

(assert (=> b!57536 m!90743))

(declare-fun m!90745 () Bool)

(assert (=> b!57536 m!90745))

(assert (=> b!57536 m!90729))

(declare-fun m!90747 () Bool)

(assert (=> b!57536 m!90747))

(assert (=> b!57536 m!90733))

(declare-fun m!90749 () Bool)

(assert (=> b!57536 m!90749))

(declare-fun m!90751 () Bool)

(assert (=> b!57536 m!90751))

(declare-fun m!90753 () Bool)

(assert (=> b!57536 m!90753))

(assert (=> b!57536 m!90703))

(declare-fun m!90755 () Bool)

(assert (=> b!57536 m!90755))

(declare-fun m!90757 () Bool)

(assert (=> b!57536 m!90757))

(declare-fun m!90759 () Bool)

(assert (=> b!57536 m!90759))

(declare-fun m!90761 () Bool)

(assert (=> b!57536 m!90761))

(declare-fun m!90763 () Bool)

(assert (=> b!57537 m!90763))

(declare-fun m!90765 () Bool)

(assert (=> b!57537 m!90765))

(declare-fun m!90767 () Bool)

(assert (=> b!57538 m!90767))

(declare-fun m!90769 () Bool)

(assert (=> b!57538 m!90769))

(declare-fun m!90771 () Bool)

(assert (=> b!57538 m!90771))

(declare-fun m!90773 () Bool)

(assert (=> b!57538 m!90773))

(declare-fun m!90775 () Bool)

(assert (=> b!57538 m!90775))

(declare-fun m!90777 () Bool)

(assert (=> d!18306 m!90777))

(assert (=> d!18306 m!90305))

(declare-fun m!90779 () Bool)

(assert (=> d!18306 m!90779))

(declare-fun m!90781 () Bool)

(assert (=> d!18306 m!90781))

(declare-fun m!90783 () Bool)

(assert (=> b!57534 m!90783))

(declare-fun m!90785 () Bool)

(assert (=> b!57535 m!90785))

(declare-fun m!90787 () Bool)

(assert (=> b!57540 m!90787))

(declare-fun m!90789 () Bool)

(assert (=> bm!751 m!90789))

(assert (=> b!57262 d!18306))

(declare-fun d!18354 () Bool)

(assert (=> d!18354 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1192 (buf!1567 (_2!2720 lt!90295)))) ((_ sign_extend 32) (currentByte!3173 thiss!1379)) ((_ sign_extend 32) (currentBit!3168 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1192 (buf!1567 (_2!2720 lt!90295)))) ((_ sign_extend 32) (currentByte!3173 thiss!1379)) ((_ sign_extend 32) (currentBit!3168 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4567 () Bool)

(assert (= bs!4567 d!18354))

(declare-fun m!90791 () Bool)

(assert (=> bs!4567 m!90791))

(assert (=> b!57262 d!18354))

(declare-fun d!18356 () Bool)

(declare-fun res!47799 () Bool)

(declare-fun e!38163 () Bool)

(assert (=> d!18356 (=> (not res!47799) (not e!38163))))

(assert (=> d!18356 (= res!47799 (= (size!1192 (buf!1567 (_2!2720 lt!90295))) (size!1192 (buf!1567 (_2!2720 lt!90288)))))))

(assert (=> d!18356 (= (isPrefixOf!0 (_2!2720 lt!90295) (_2!2720 lt!90288)) e!38163)))

(declare-fun b!57541 () Bool)

(declare-fun res!47801 () Bool)

(assert (=> b!57541 (=> (not res!47801) (not e!38163))))

(assert (=> b!57541 (= res!47801 (bvsle (bitIndex!0 (size!1192 (buf!1567 (_2!2720 lt!90295))) (currentByte!3173 (_2!2720 lt!90295)) (currentBit!3168 (_2!2720 lt!90295))) (bitIndex!0 (size!1192 (buf!1567 (_2!2720 lt!90288))) (currentByte!3173 (_2!2720 lt!90288)) (currentBit!3168 (_2!2720 lt!90288)))))))

(declare-fun b!57542 () Bool)

(declare-fun e!38162 () Bool)

(assert (=> b!57542 (= e!38163 e!38162)))

(declare-fun res!47800 () Bool)

(assert (=> b!57542 (=> res!47800 e!38162)))

(assert (=> b!57542 (= res!47800 (= (size!1192 (buf!1567 (_2!2720 lt!90295))) #b00000000000000000000000000000000))))

(declare-fun b!57543 () Bool)

(assert (=> b!57543 (= e!38162 (arrayBitRangesEq!0 (buf!1567 (_2!2720 lt!90295)) (buf!1567 (_2!2720 lt!90288)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1192 (buf!1567 (_2!2720 lt!90295))) (currentByte!3173 (_2!2720 lt!90295)) (currentBit!3168 (_2!2720 lt!90295)))))))

(assert (= (and d!18356 res!47799) b!57541))

(assert (= (and b!57541 res!47801) b!57542))

(assert (= (and b!57542 (not res!47800)) b!57543))

(assert (=> b!57541 m!90305))

(assert (=> b!57541 m!90335))

(assert (=> b!57543 m!90305))

(assert (=> b!57543 m!90305))

(declare-fun m!90793 () Bool)

(assert (=> b!57543 m!90793))

(assert (=> b!57262 d!18356))

(declare-fun d!18358 () Bool)

(assert (=> d!18358 (isPrefixOf!0 thiss!1379 (_2!2720 lt!90288))))

(declare-fun lt!90964 () Unit!3959)

(declare-fun choose!30 (BitStream!2072 BitStream!2072 BitStream!2072) Unit!3959)

(assert (=> d!18358 (= lt!90964 (choose!30 thiss!1379 (_2!2720 lt!90295) (_2!2720 lt!90288)))))

(assert (=> d!18358 (isPrefixOf!0 thiss!1379 (_2!2720 lt!90295))))

(assert (=> d!18358 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2720 lt!90295) (_2!2720 lt!90288)) lt!90964)))

(declare-fun bs!4568 () Bool)

(assert (= bs!4568 d!18358))

(assert (=> bs!4568 m!90319))

(declare-fun m!90795 () Bool)

(assert (=> bs!4568 m!90795))

(assert (=> bs!4568 m!90303))

(assert (=> b!57262 d!18358))

(declare-fun b!57575 () Bool)

(declare-fun res!47825 () Bool)

(declare-fun e!38178 () Bool)

(assert (=> b!57575 (=> (not res!47825) (not e!38178))))

(declare-fun lt!91071 () tuple2!5220)

(assert (=> b!57575 (= res!47825 (isPrefixOf!0 (_2!2721 lt!91071) (_2!2720 lt!90295)))))

(declare-fun b!57577 () Bool)

(declare-fun e!38179 () Unit!3959)

(declare-fun lt!91090 () Unit!3959)

(assert (=> b!57577 (= e!38179 lt!91090)))

(declare-fun lt!91088 () (_ BitVec 64))

(assert (=> b!57577 (= lt!91088 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91074 () (_ BitVec 64))

(assert (=> b!57577 (= lt!91074 (bitIndex!0 (size!1192 (buf!1567 thiss!1379)) (currentByte!3173 thiss!1379) (currentBit!3168 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2627 array!2627 (_ BitVec 64) (_ BitVec 64)) Unit!3959)

(assert (=> b!57577 (= lt!91090 (arrayBitRangesEqSymmetric!0 (buf!1567 thiss!1379) (buf!1567 (_2!2720 lt!90295)) lt!91088 lt!91074))))

(assert (=> b!57577 (arrayBitRangesEq!0 (buf!1567 (_2!2720 lt!90295)) (buf!1567 thiss!1379) lt!91088 lt!91074)))

(declare-fun b!57578 () Bool)

(declare-fun res!47824 () Bool)

(assert (=> b!57578 (=> (not res!47824) (not e!38178))))

(assert (=> b!57578 (= res!47824 (isPrefixOf!0 (_1!2721 lt!91071) thiss!1379))))

(declare-fun b!57579 () Bool)

(declare-fun Unit!3984 () Unit!3959)

(assert (=> b!57579 (= e!38179 Unit!3984)))

(declare-fun lt!91079 () (_ BitVec 64))

(declare-fun b!57576 () Bool)

(declare-fun lt!91083 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2072 (_ BitVec 64)) BitStream!2072)

(assert (=> b!57576 (= e!38178 (= (_1!2721 lt!91071) (withMovedBitIndex!0 (_2!2721 lt!91071) (bvsub lt!91079 lt!91083))))))

(assert (=> b!57576 (or (= (bvand lt!91079 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!91083 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!91079 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!91079 lt!91083) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!57576 (= lt!91083 (bitIndex!0 (size!1192 (buf!1567 (_2!2720 lt!90295))) (currentByte!3173 (_2!2720 lt!90295)) (currentBit!3168 (_2!2720 lt!90295))))))

(assert (=> b!57576 (= lt!91079 (bitIndex!0 (size!1192 (buf!1567 thiss!1379)) (currentByte!3173 thiss!1379) (currentBit!3168 thiss!1379)))))

(declare-fun d!18360 () Bool)

(assert (=> d!18360 e!38178))

(declare-fun res!47823 () Bool)

(assert (=> d!18360 (=> (not res!47823) (not e!38178))))

(assert (=> d!18360 (= res!47823 (isPrefixOf!0 (_1!2721 lt!91071) (_2!2721 lt!91071)))))

(declare-fun lt!91073 () BitStream!2072)

(assert (=> d!18360 (= lt!91071 (tuple2!5221 lt!91073 (_2!2720 lt!90295)))))

(declare-fun lt!91084 () Unit!3959)

(declare-fun lt!91089 () Unit!3959)

(assert (=> d!18360 (= lt!91084 lt!91089)))

(assert (=> d!18360 (isPrefixOf!0 lt!91073 (_2!2720 lt!90295))))

(assert (=> d!18360 (= lt!91089 (lemmaIsPrefixTransitive!0 lt!91073 (_2!2720 lt!90295) (_2!2720 lt!90295)))))

(declare-fun lt!91086 () Unit!3959)

(declare-fun lt!91081 () Unit!3959)

(assert (=> d!18360 (= lt!91086 lt!91081)))

(assert (=> d!18360 (isPrefixOf!0 lt!91073 (_2!2720 lt!90295))))

(assert (=> d!18360 (= lt!91081 (lemmaIsPrefixTransitive!0 lt!91073 thiss!1379 (_2!2720 lt!90295)))))

(declare-fun lt!91072 () Unit!3959)

(assert (=> d!18360 (= lt!91072 e!38179)))

(declare-fun c!4173 () Bool)

(assert (=> d!18360 (= c!4173 (not (= (size!1192 (buf!1567 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!91082 () Unit!3959)

(declare-fun lt!91076 () Unit!3959)

(assert (=> d!18360 (= lt!91082 lt!91076)))

(assert (=> d!18360 (isPrefixOf!0 (_2!2720 lt!90295) (_2!2720 lt!90295))))

(assert (=> d!18360 (= lt!91076 (lemmaIsPrefixRefl!0 (_2!2720 lt!90295)))))

(declare-fun lt!91077 () Unit!3959)

(declare-fun lt!91078 () Unit!3959)

(assert (=> d!18360 (= lt!91077 lt!91078)))

(assert (=> d!18360 (= lt!91078 (lemmaIsPrefixRefl!0 (_2!2720 lt!90295)))))

(declare-fun lt!91075 () Unit!3959)

(declare-fun lt!91085 () Unit!3959)

(assert (=> d!18360 (= lt!91075 lt!91085)))

(assert (=> d!18360 (isPrefixOf!0 lt!91073 lt!91073)))

(assert (=> d!18360 (= lt!91085 (lemmaIsPrefixRefl!0 lt!91073))))

(declare-fun lt!91087 () Unit!3959)

(declare-fun lt!91080 () Unit!3959)

(assert (=> d!18360 (= lt!91087 lt!91080)))

(assert (=> d!18360 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!18360 (= lt!91080 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!18360 (= lt!91073 (BitStream!2073 (buf!1567 (_2!2720 lt!90295)) (currentByte!3173 thiss!1379) (currentBit!3168 thiss!1379)))))

(assert (=> d!18360 (isPrefixOf!0 thiss!1379 (_2!2720 lt!90295))))

(assert (=> d!18360 (= (reader!0 thiss!1379 (_2!2720 lt!90295)) lt!91071)))

(assert (= (and d!18360 c!4173) b!57577))

(assert (= (and d!18360 (not c!4173)) b!57579))

(assert (= (and d!18360 res!47823) b!57578))

(assert (= (and b!57578 res!47824) b!57575))

(assert (= (and b!57575 res!47825) b!57576))

(declare-fun m!90829 () Bool)

(assert (=> b!57575 m!90829))

(assert (=> b!57577 m!90293))

(declare-fun m!90831 () Bool)

(assert (=> b!57577 m!90831))

(declare-fun m!90833 () Bool)

(assert (=> b!57577 m!90833))

(declare-fun m!90835 () Bool)

(assert (=> b!57576 m!90835))

(assert (=> b!57576 m!90305))

(assert (=> b!57576 m!90293))

(assert (=> d!18360 m!90291))

(assert (=> d!18360 m!90289))

(assert (=> d!18360 m!90781))

(declare-fun m!90837 () Bool)

(assert (=> d!18360 m!90837))

(declare-fun m!90839 () Bool)

(assert (=> d!18360 m!90839))

(declare-fun m!90841 () Bool)

(assert (=> d!18360 m!90841))

(declare-fun m!90843 () Bool)

(assert (=> d!18360 m!90843))

(assert (=> d!18360 m!90303))

(assert (=> d!18360 m!90779))

(declare-fun m!90845 () Bool)

(assert (=> d!18360 m!90845))

(declare-fun m!90847 () Bool)

(assert (=> d!18360 m!90847))

(declare-fun m!90849 () Bool)

(assert (=> b!57578 m!90849))

(assert (=> b!57262 d!18360))

(declare-fun d!18372 () Bool)

(assert (=> d!18372 (= (array_inv!1095 srcBuffer!2) (bvsge (size!1192 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!11584 d!18372))

(declare-fun d!18374 () Bool)

(assert (=> d!18374 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3168 thiss!1379) (currentByte!3173 thiss!1379) (size!1192 (buf!1567 thiss!1379))))))

(declare-fun bs!4572 () Bool)

(assert (= bs!4572 d!18374))

(declare-fun m!90851 () Bool)

(assert (=> bs!4572 m!90851))

(assert (=> start!11584 d!18374))

(declare-fun d!18376 () Bool)

(assert (=> d!18376 (= (array_inv!1095 (buf!1567 thiss!1379)) (bvsge (size!1192 (buf!1567 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!57271 d!18376))

(declare-fun d!18378 () Bool)

(assert (=> d!18378 (= (head!430 (byteArrayBitContentToList!0 (_2!2720 lt!90295) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!726 (byteArrayBitContentToList!0 (_2!2720 lt!90295) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!57266 d!18378))

(declare-fun d!18380 () Bool)

(declare-fun c!4176 () Bool)

(assert (=> d!18380 (= c!4176 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!38182 () List!611)

(assert (=> d!18380 (= (byteArrayBitContentToList!0 (_2!2720 lt!90295) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!38182)))

(declare-fun b!57584 () Bool)

(assert (=> b!57584 (= e!38182 Nil!608)))

(declare-fun b!57585 () Bool)

(assert (=> b!57585 (= e!38182 (Cons!607 (not (= (bvand ((_ sign_extend 24) (select (arr!1750 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2720 lt!90295) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!18380 c!4176) b!57584))

(assert (= (and d!18380 (not c!4176)) b!57585))

(assert (=> b!57585 m!90297))

(assert (=> b!57585 m!90413))

(declare-fun m!90853 () Bool)

(assert (=> b!57585 m!90853))

(assert (=> b!57266 d!18380))

(declare-fun d!18382 () Bool)

(assert (=> d!18382 (= (head!430 (bitStreamReadBitsIntoList!0 (_2!2720 lt!90295) (_1!2721 lt!90286) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!726 (bitStreamReadBitsIntoList!0 (_2!2720 lt!90295) (_1!2721 lt!90286) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!57266 d!18382))

(declare-fun b!57597 () Bool)

(declare-fun e!38187 () Bool)

(declare-fun lt!91099 () List!611)

(declare-fun length!290 (List!611) Int)

(assert (=> b!57597 (= e!38187 (> (length!290 lt!91099) 0))))

(declare-fun b!57596 () Bool)

(declare-fun isEmpty!176 (List!611) Bool)

(assert (=> b!57596 (= e!38187 (isEmpty!176 lt!91099))))

(declare-fun d!18384 () Bool)

(assert (=> d!18384 e!38187))

(declare-fun c!4182 () Bool)

(assert (=> d!18384 (= c!4182 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!5242 0))(
  ( (tuple2!5243 (_1!2732 List!611) (_2!2732 BitStream!2072)) )
))
(declare-fun e!38188 () tuple2!5242)

(assert (=> d!18384 (= lt!91099 (_1!2732 e!38188))))

(declare-fun c!4181 () Bool)

(assert (=> d!18384 (= c!4181 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18384 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!18384 (= (bitStreamReadBitsIntoList!0 (_2!2720 lt!90295) (_1!2721 lt!90286) #b0000000000000000000000000000000000000000000000000000000000000001) lt!91099)))

(declare-fun b!57594 () Bool)

(assert (=> b!57594 (= e!38188 (tuple2!5243 Nil!608 (_1!2721 lt!90286)))))

(declare-datatypes ((tuple2!5244 0))(
  ( (tuple2!5245 (_1!2733 Bool) (_2!2733 BitStream!2072)) )
))
(declare-fun lt!91097 () tuple2!5244)

(declare-fun b!57595 () Bool)

(declare-fun lt!91098 () (_ BitVec 64))

(assert (=> b!57595 (= e!38188 (tuple2!5243 (Cons!607 (_1!2733 lt!91097) (bitStreamReadBitsIntoList!0 (_2!2720 lt!90295) (_2!2733 lt!91097) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!91098))) (_2!2733 lt!91097)))))

(declare-fun readBit!0 (BitStream!2072) tuple2!5244)

(assert (=> b!57595 (= lt!91097 (readBit!0 (_1!2721 lt!90286)))))

(assert (=> b!57595 (= lt!91098 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!18384 c!4181) b!57594))

(assert (= (and d!18384 (not c!4181)) b!57595))

(assert (= (and d!18384 c!4182) b!57596))

(assert (= (and d!18384 (not c!4182)) b!57597))

(declare-fun m!90855 () Bool)

(assert (=> b!57597 m!90855))

(declare-fun m!90857 () Bool)

(assert (=> b!57596 m!90857))

(declare-fun m!90859 () Bool)

(assert (=> b!57595 m!90859))

(declare-fun m!90861 () Bool)

(assert (=> b!57595 m!90861))

(assert (=> b!57266 d!18384))

(declare-fun d!18386 () Bool)

(assert (=> d!18386 (= (invariant!0 (currentBit!3168 (_2!2720 lt!90288)) (currentByte!3173 (_2!2720 lt!90288)) (size!1192 (buf!1567 (_2!2720 lt!90288)))) (and (bvsge (currentBit!3168 (_2!2720 lt!90288)) #b00000000000000000000000000000000) (bvslt (currentBit!3168 (_2!2720 lt!90288)) #b00000000000000000000000000001000) (bvsge (currentByte!3173 (_2!2720 lt!90288)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3173 (_2!2720 lt!90288)) (size!1192 (buf!1567 (_2!2720 lt!90288)))) (and (= (currentBit!3168 (_2!2720 lt!90288)) #b00000000000000000000000000000000) (= (currentByte!3173 (_2!2720 lt!90288)) (size!1192 (buf!1567 (_2!2720 lt!90288))))))))))

(assert (=> b!57265 d!18386))

(declare-fun d!18388 () Bool)

(declare-fun res!47826 () Bool)

(declare-fun e!38190 () Bool)

(assert (=> d!18388 (=> (not res!47826) (not e!38190))))

(assert (=> d!18388 (= res!47826 (= (size!1192 (buf!1567 thiss!1379)) (size!1192 (buf!1567 thiss!1379))))))

(assert (=> d!18388 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!38190)))

(declare-fun b!57598 () Bool)

(declare-fun res!47828 () Bool)

(assert (=> b!57598 (=> (not res!47828) (not e!38190))))

(assert (=> b!57598 (= res!47828 (bvsle (bitIndex!0 (size!1192 (buf!1567 thiss!1379)) (currentByte!3173 thiss!1379) (currentBit!3168 thiss!1379)) (bitIndex!0 (size!1192 (buf!1567 thiss!1379)) (currentByte!3173 thiss!1379) (currentBit!3168 thiss!1379))))))

(declare-fun b!57599 () Bool)

(declare-fun e!38189 () Bool)

(assert (=> b!57599 (= e!38190 e!38189)))

(declare-fun res!47827 () Bool)

(assert (=> b!57599 (=> res!47827 e!38189)))

(assert (=> b!57599 (= res!47827 (= (size!1192 (buf!1567 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!57600 () Bool)

(assert (=> b!57600 (= e!38189 (arrayBitRangesEq!0 (buf!1567 thiss!1379) (buf!1567 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1192 (buf!1567 thiss!1379)) (currentByte!3173 thiss!1379) (currentBit!3168 thiss!1379))))))

(assert (= (and d!18388 res!47826) b!57598))

(assert (= (and b!57598 res!47828) b!57599))

(assert (= (and b!57599 (not res!47827)) b!57600))

(assert (=> b!57598 m!90293))

(assert (=> b!57598 m!90293))

(assert (=> b!57600 m!90293))

(assert (=> b!57600 m!90293))

(declare-fun m!90863 () Bool)

(assert (=> b!57600 m!90863))

(assert (=> b!57270 d!18388))

(declare-fun d!18390 () Bool)

(assert (=> d!18390 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!91102 () Unit!3959)

(declare-fun choose!11 (BitStream!2072) Unit!3959)

(assert (=> d!18390 (= lt!91102 (choose!11 thiss!1379))))

(assert (=> d!18390 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!91102)))

(declare-fun bs!4574 () Bool)

(assert (= bs!4574 d!18390))

(assert (=> bs!4574 m!90289))

(declare-fun m!90865 () Bool)

(assert (=> bs!4574 m!90865))

(assert (=> b!57270 d!18390))

(declare-fun d!18392 () Bool)

(declare-fun e!38193 () Bool)

(assert (=> d!18392 e!38193))

(declare-fun res!47833 () Bool)

(assert (=> d!18392 (=> (not res!47833) (not e!38193))))

(declare-fun lt!91115 () (_ BitVec 64))

(declare-fun lt!91120 () (_ BitVec 64))

(declare-fun lt!91118 () (_ BitVec 64))

(assert (=> d!18392 (= res!47833 (= lt!91118 (bvsub lt!91115 lt!91120)))))

(assert (=> d!18392 (or (= (bvand lt!91115 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!91120 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!91115 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!91115 lt!91120) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18392 (= lt!91120 (remainingBits!0 ((_ sign_extend 32) (size!1192 (buf!1567 thiss!1379))) ((_ sign_extend 32) (currentByte!3173 thiss!1379)) ((_ sign_extend 32) (currentBit!3168 thiss!1379))))))

(declare-fun lt!91117 () (_ BitVec 64))

(declare-fun lt!91116 () (_ BitVec 64))

(assert (=> d!18392 (= lt!91115 (bvmul lt!91117 lt!91116))))

(assert (=> d!18392 (or (= lt!91117 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!91116 (bvsdiv (bvmul lt!91117 lt!91116) lt!91117)))))

(assert (=> d!18392 (= lt!91116 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18392 (= lt!91117 ((_ sign_extend 32) (size!1192 (buf!1567 thiss!1379))))))

(assert (=> d!18392 (= lt!91118 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3173 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3168 thiss!1379))))))

(assert (=> d!18392 (invariant!0 (currentBit!3168 thiss!1379) (currentByte!3173 thiss!1379) (size!1192 (buf!1567 thiss!1379)))))

(assert (=> d!18392 (= (bitIndex!0 (size!1192 (buf!1567 thiss!1379)) (currentByte!3173 thiss!1379) (currentBit!3168 thiss!1379)) lt!91118)))

(declare-fun b!57605 () Bool)

(declare-fun res!47834 () Bool)

(assert (=> b!57605 (=> (not res!47834) (not e!38193))))

(assert (=> b!57605 (= res!47834 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!91118))))

(declare-fun b!57606 () Bool)

(declare-fun lt!91119 () (_ BitVec 64))

(assert (=> b!57606 (= e!38193 (bvsle lt!91118 (bvmul lt!91119 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!57606 (or (= lt!91119 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!91119 #b0000000000000000000000000000000000000000000000000000000000001000) lt!91119)))))

(assert (=> b!57606 (= lt!91119 ((_ sign_extend 32) (size!1192 (buf!1567 thiss!1379))))))

(assert (= (and d!18392 res!47833) b!57605))

(assert (= (and b!57605 res!47834) b!57606))

(assert (=> d!18392 m!90351))

(assert (=> d!18392 m!90851))

(assert (=> b!57270 d!18392))

(declare-fun d!18394 () Bool)

(declare-fun e!38194 () Bool)

(assert (=> d!18394 e!38194))

(declare-fun res!47835 () Bool)

(assert (=> d!18394 (=> (not res!47835) (not e!38194))))

(declare-fun lt!91126 () (_ BitVec 64))

(declare-fun lt!91124 () (_ BitVec 64))

(declare-fun lt!91121 () (_ BitVec 64))

(assert (=> d!18394 (= res!47835 (= lt!91124 (bvsub lt!91121 lt!91126)))))

(assert (=> d!18394 (or (= (bvand lt!91121 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!91126 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!91121 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!91121 lt!91126) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18394 (= lt!91126 (remainingBits!0 ((_ sign_extend 32) (size!1192 (buf!1567 (_2!2720 lt!90288)))) ((_ sign_extend 32) (currentByte!3173 (_2!2720 lt!90288))) ((_ sign_extend 32) (currentBit!3168 (_2!2720 lt!90288)))))))

(declare-fun lt!91123 () (_ BitVec 64))

(declare-fun lt!91122 () (_ BitVec 64))

(assert (=> d!18394 (= lt!91121 (bvmul lt!91123 lt!91122))))

(assert (=> d!18394 (or (= lt!91123 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!91122 (bvsdiv (bvmul lt!91123 lt!91122) lt!91123)))))

(assert (=> d!18394 (= lt!91122 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18394 (= lt!91123 ((_ sign_extend 32) (size!1192 (buf!1567 (_2!2720 lt!90288)))))))

(assert (=> d!18394 (= lt!91124 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3173 (_2!2720 lt!90288))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3168 (_2!2720 lt!90288)))))))

(assert (=> d!18394 (invariant!0 (currentBit!3168 (_2!2720 lt!90288)) (currentByte!3173 (_2!2720 lt!90288)) (size!1192 (buf!1567 (_2!2720 lt!90288))))))

(assert (=> d!18394 (= (bitIndex!0 (size!1192 (buf!1567 (_2!2720 lt!90288))) (currentByte!3173 (_2!2720 lt!90288)) (currentBit!3168 (_2!2720 lt!90288))) lt!91124)))

(declare-fun b!57607 () Bool)

(declare-fun res!47836 () Bool)

(assert (=> b!57607 (=> (not res!47836) (not e!38194))))

(assert (=> b!57607 (= res!47836 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!91124))))

(declare-fun b!57608 () Bool)

(declare-fun lt!91125 () (_ BitVec 64))

(assert (=> b!57608 (= e!38194 (bvsle lt!91124 (bvmul lt!91125 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!57608 (or (= lt!91125 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!91125 #b0000000000000000000000000000000000000000000000000000000000001000) lt!91125)))))

(assert (=> b!57608 (= lt!91125 ((_ sign_extend 32) (size!1192 (buf!1567 (_2!2720 lt!90288)))))))

(assert (= (and d!18394 res!47835) b!57607))

(assert (= (and b!57607 res!47836) b!57608))

(declare-fun m!90867 () Bool)

(assert (=> d!18394 m!90867))

(assert (=> d!18394 m!90325))

(assert (=> b!57269 d!18394))

(declare-fun d!18396 () Bool)

(declare-fun e!38195 () Bool)

(assert (=> d!18396 e!38195))

(declare-fun res!47837 () Bool)

(assert (=> d!18396 (=> (not res!47837) (not e!38195))))

(declare-fun lt!91127 () (_ BitVec 64))

(declare-fun lt!91132 () (_ BitVec 64))

(declare-fun lt!91130 () (_ BitVec 64))

(assert (=> d!18396 (= res!47837 (= lt!91130 (bvsub lt!91127 lt!91132)))))

(assert (=> d!18396 (or (= (bvand lt!91127 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!91132 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!91127 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!91127 lt!91132) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18396 (= lt!91132 (remainingBits!0 ((_ sign_extend 32) (size!1192 (buf!1567 (_2!2720 lt!90295)))) ((_ sign_extend 32) (currentByte!3173 (_2!2720 lt!90295))) ((_ sign_extend 32) (currentBit!3168 (_2!2720 lt!90295)))))))

(declare-fun lt!91129 () (_ BitVec 64))

(declare-fun lt!91128 () (_ BitVec 64))

(assert (=> d!18396 (= lt!91127 (bvmul lt!91129 lt!91128))))

(assert (=> d!18396 (or (= lt!91129 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!91128 (bvsdiv (bvmul lt!91129 lt!91128) lt!91129)))))

(assert (=> d!18396 (= lt!91128 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18396 (= lt!91129 ((_ sign_extend 32) (size!1192 (buf!1567 (_2!2720 lt!90295)))))))

(assert (=> d!18396 (= lt!91130 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3173 (_2!2720 lt!90295))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3168 (_2!2720 lt!90295)))))))

(assert (=> d!18396 (invariant!0 (currentBit!3168 (_2!2720 lt!90295)) (currentByte!3173 (_2!2720 lt!90295)) (size!1192 (buf!1567 (_2!2720 lt!90295))))))

(assert (=> d!18396 (= (bitIndex!0 (size!1192 (buf!1567 (_2!2720 lt!90295))) (currentByte!3173 (_2!2720 lt!90295)) (currentBit!3168 (_2!2720 lt!90295))) lt!91130)))

(declare-fun b!57609 () Bool)

(declare-fun res!47838 () Bool)

(assert (=> b!57609 (=> (not res!47838) (not e!38195))))

(assert (=> b!57609 (= res!47838 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!91130))))

(declare-fun b!57610 () Bool)

(declare-fun lt!91131 () (_ BitVec 64))

(assert (=> b!57610 (= e!38195 (bvsle lt!91130 (bvmul lt!91131 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!57610 (or (= lt!91131 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!91131 #b0000000000000000000000000000000000000000000000000000000000001000) lt!91131)))))

(assert (=> b!57610 (= lt!91131 ((_ sign_extend 32) (size!1192 (buf!1567 (_2!2720 lt!90295)))))))

(assert (= (and d!18396 res!47837) b!57609))

(assert (= (and b!57609 res!47838) b!57610))

(assert (=> d!18396 m!90355))

(declare-fun m!90869 () Bool)

(assert (=> d!18396 m!90869))

(assert (=> b!57264 d!18396))

(push 1)

(assert (not d!18274))

(assert (not b!57537))

(assert (not b!57305))

(assert (not bm!751))

(assert (not d!18374))

(assert (not b!57536))

(assert (not b!57578))

(assert (not b!57538))

(assert (not b!57534))

(assert (not b!57379))

(assert (not b!57577))

(assert (not d!18276))

(assert (not b!57378))

(assert (not b!57310))

(assert (not b!57381))

(assert (not b!57576))

(assert (not d!18392))

(assert (not b!57386))

(assert (not b!57388))

(assert (not b!57384))

(assert (not d!18354))

(assert (not b!57541))

(assert (not d!18390))

(assert (not b!57307))

(assert (not b!57385))

(assert (not d!18396))

(assert (not b!57575))

(assert (not d!18358))

(assert (not b!57543))

(assert (not b!57595))

(assert (not b!57380))

(assert (not d!18306))

(assert (not d!18272))

(assert (not d!18268))

(assert (not b!57600))

(assert (not d!18394))

(assert (not b!57597))

(assert (not d!18360))

(assert (not b!57585))

(assert (not b!57596))

(assert (not d!18302))

(assert (not b!57535))

(assert (not b!57540))

(assert (not b!57382))

(assert (not b!57383))

(assert (not b!57598))

(check-sat)

(pop 1)

(push 1)

(check-sat)

