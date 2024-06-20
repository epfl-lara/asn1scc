; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23922 () Bool)

(assert start!23922)

(declare-fun b!121152 () Bool)

(declare-fun e!79367 () Bool)

(declare-fun e!79370 () Bool)

(assert (=> b!121152 (= e!79367 e!79370)))

(declare-fun res!100346 () Bool)

(assert (=> b!121152 (=> (not res!100346) (not e!79370))))

(declare-fun lt!189302 () (_ BitVec 64))

(declare-fun lt!189317 () (_ BitVec 64))

(assert (=> b!121152 (= res!100346 (= lt!189302 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!189317)))))

(declare-datatypes ((array!5382 0))(
  ( (array!5383 (arr!3029 (Array (_ BitVec 32) (_ BitVec 8))) (size!2436 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4346 0))(
  ( (BitStream!4347 (buf!2870 array!5382) (currentByte!5555 (_ BitVec 32)) (currentBit!5550 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!7463 0))(
  ( (Unit!7464) )
))
(declare-datatypes ((tuple2!10184 0))(
  ( (tuple2!10185 (_1!5357 Unit!7463) (_2!5357 BitStream!4346)) )
))
(declare-fun lt!189304 () tuple2!10184)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!121152 (= lt!189302 (bitIndex!0 (size!2436 (buf!2870 (_2!5357 lt!189304))) (currentByte!5555 (_2!5357 lt!189304)) (currentBit!5550 (_2!5357 lt!189304))))))

(declare-fun thiss!1305 () BitStream!4346)

(assert (=> b!121152 (= lt!189317 (bitIndex!0 (size!2436 (buf!2870 thiss!1305)) (currentByte!5555 thiss!1305) (currentBit!5550 thiss!1305)))))

(declare-fun lt!189314 () (_ BitVec 64))

(declare-fun e!79373 () Bool)

(declare-datatypes ((tuple2!10186 0))(
  ( (tuple2!10187 (_1!5358 BitStream!4346) (_2!5358 (_ BitVec 64))) )
))
(declare-fun lt!189310 () tuple2!10186)

(declare-fun lt!189301 () tuple2!10186)

(declare-datatypes ((tuple2!10188 0))(
  ( (tuple2!10189 (_1!5359 BitStream!4346) (_2!5359 BitStream!4346)) )
))
(declare-fun lt!189300 () tuple2!10188)

(declare-fun lt!189319 () (_ BitVec 64))

(declare-fun b!121153 () Bool)

(declare-fun lt!189309 () BitStream!4346)

(assert (=> b!121153 (= e!79373 (and (= lt!189319 (bvsub lt!189314 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!5359 lt!189300) lt!189309)) (= (_2!5358 lt!189310) (_2!5358 lt!189301)))))))

(declare-fun b!121154 () Bool)

(declare-fun e!79369 () Bool)

(assert (=> b!121154 (= e!79370 e!79369)))

(declare-fun res!100347 () Bool)

(assert (=> b!121154 (=> (not res!100347) (not e!79369))))

(declare-datatypes ((tuple2!10190 0))(
  ( (tuple2!10191 (_1!5360 BitStream!4346) (_2!5360 Bool)) )
))
(declare-fun lt!189316 () tuple2!10190)

(declare-fun lt!189322 () Bool)

(assert (=> b!121154 (= res!100347 (and (= (_2!5360 lt!189316) lt!189322) (= (_1!5360 lt!189316) (_2!5357 lt!189304))))))

(declare-fun readBitPure!0 (BitStream!4346) tuple2!10190)

(declare-fun readerFrom!0 (BitStream!4346 (_ BitVec 32) (_ BitVec 32)) BitStream!4346)

(assert (=> b!121154 (= lt!189316 (readBitPure!0 (readerFrom!0 (_2!5357 lt!189304) (currentBit!5550 thiss!1305) (currentByte!5555 thiss!1305))))))

(declare-fun b!121155 () Bool)

(declare-fun e!79366 () Bool)

(declare-fun lt!189308 () tuple2!10184)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!121155 (= e!79366 (invariant!0 (currentBit!5550 thiss!1305) (currentByte!5555 thiss!1305) (size!2436 (buf!2870 (_2!5357 lt!189308)))))))

(declare-fun res!100342 () Bool)

(declare-fun e!79374 () Bool)

(assert (=> start!23922 (=> (not res!100342) (not e!79374))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!23922 (= res!100342 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23922 e!79374))

(assert (=> start!23922 true))

(declare-fun e!79364 () Bool)

(declare-fun inv!12 (BitStream!4346) Bool)

(assert (=> start!23922 (and (inv!12 thiss!1305) e!79364)))

(declare-fun b!121156 () Bool)

(declare-fun array_inv!2238 (array!5382) Bool)

(assert (=> b!121156 (= e!79364 (array_inv!2238 (buf!2870 thiss!1305)))))

(declare-fun b!121157 () Bool)

(declare-fun res!100344 () Bool)

(assert (=> b!121157 (=> (not res!100344) (not e!79366))))

(assert (=> b!121157 (= res!100344 (invariant!0 (currentBit!5550 thiss!1305) (currentByte!5555 thiss!1305) (size!2436 (buf!2870 (_2!5357 lt!189304)))))))

(declare-fun b!121158 () Bool)

(declare-fun e!79371 () Bool)

(declare-fun e!79372 () Bool)

(assert (=> b!121158 (= e!79371 (not e!79372))))

(declare-fun res!100341 () Bool)

(assert (=> b!121158 (=> res!100341 e!79372)))

(assert (=> b!121158 (= res!100341 (not (= (_1!5358 lt!189301) (_2!5359 lt!189300))))))

(declare-fun lt!189307 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4346 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10186)

(assert (=> b!121158 (= lt!189301 (readNLeastSignificantBitsLoopPure!0 (_1!5359 lt!189300) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!189307))))

(declare-fun lt!189311 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!121158 (validate_offset_bits!1 ((_ sign_extend 32) (size!2436 (buf!2870 (_2!5357 lt!189308)))) ((_ sign_extend 32) (currentByte!5555 (_2!5357 lt!189304))) ((_ sign_extend 32) (currentBit!5550 (_2!5357 lt!189304))) lt!189311)))

(declare-fun lt!189321 () Unit!7463)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4346 array!5382 (_ BitVec 64)) Unit!7463)

(assert (=> b!121158 (= lt!189321 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5357 lt!189304) (buf!2870 (_2!5357 lt!189308)) lt!189311))))

(assert (=> b!121158 (= lt!189311 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!189296 () (_ BitVec 64))

(declare-fun lt!189299 () (_ BitVec 64))

(declare-fun lt!189313 () tuple2!10190)

(assert (=> b!121158 (= lt!189307 (bvor lt!189296 (ite (_2!5360 lt!189313) lt!189299 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!189315 () tuple2!10188)

(assert (=> b!121158 (= lt!189310 (readNLeastSignificantBitsLoopPure!0 (_1!5359 lt!189315) nBits!396 i!615 lt!189296))))

(declare-fun lt!189312 () (_ BitVec 64))

(assert (=> b!121158 (validate_offset_bits!1 ((_ sign_extend 32) (size!2436 (buf!2870 (_2!5357 lt!189308)))) ((_ sign_extend 32) (currentByte!5555 thiss!1305)) ((_ sign_extend 32) (currentBit!5550 thiss!1305)) lt!189312)))

(declare-fun lt!189305 () Unit!7463)

(assert (=> b!121158 (= lt!189305 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2870 (_2!5357 lt!189308)) lt!189312))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!121158 (= lt!189296 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!121158 (= (_2!5360 lt!189313) lt!189322)))

(assert (=> b!121158 (= lt!189313 (readBitPure!0 (_1!5359 lt!189315)))))

(declare-fun reader!0 (BitStream!4346 BitStream!4346) tuple2!10188)

(assert (=> b!121158 (= lt!189300 (reader!0 (_2!5357 lt!189304) (_2!5357 lt!189308)))))

(assert (=> b!121158 (= lt!189315 (reader!0 thiss!1305 (_2!5357 lt!189308)))))

(declare-fun e!79365 () Bool)

(assert (=> b!121158 e!79365))

(declare-fun res!100343 () Bool)

(assert (=> b!121158 (=> (not res!100343) (not e!79365))))

(declare-fun lt!189320 () tuple2!10190)

(declare-fun lt!189306 () tuple2!10190)

(assert (=> b!121158 (= res!100343 (= (bitIndex!0 (size!2436 (buf!2870 (_1!5360 lt!189320))) (currentByte!5555 (_1!5360 lt!189320)) (currentBit!5550 (_1!5360 lt!189320))) (bitIndex!0 (size!2436 (buf!2870 (_1!5360 lt!189306))) (currentByte!5555 (_1!5360 lt!189306)) (currentBit!5550 (_1!5360 lt!189306)))))))

(declare-fun lt!189318 () Unit!7463)

(declare-fun lt!189303 () BitStream!4346)

(declare-fun readBitPrefixLemma!0 (BitStream!4346 BitStream!4346) Unit!7463)

(assert (=> b!121158 (= lt!189318 (readBitPrefixLemma!0 lt!189303 (_2!5357 lt!189308)))))

(assert (=> b!121158 (= lt!189306 (readBitPure!0 (BitStream!4347 (buf!2870 (_2!5357 lt!189308)) (currentByte!5555 thiss!1305) (currentBit!5550 thiss!1305))))))

(assert (=> b!121158 (= lt!189320 (readBitPure!0 lt!189303))))

(assert (=> b!121158 (= lt!189303 (BitStream!4347 (buf!2870 (_2!5357 lt!189304)) (currentByte!5555 thiss!1305) (currentBit!5550 thiss!1305)))))

(assert (=> b!121158 e!79366))

(declare-fun res!100339 () Bool)

(assert (=> b!121158 (=> (not res!100339) (not e!79366))))

(declare-fun isPrefixOf!0 (BitStream!4346 BitStream!4346) Bool)

(assert (=> b!121158 (= res!100339 (isPrefixOf!0 thiss!1305 (_2!5357 lt!189308)))))

(declare-fun lt!189323 () Unit!7463)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4346 BitStream!4346 BitStream!4346) Unit!7463)

(assert (=> b!121158 (= lt!189323 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5357 lt!189304) (_2!5357 lt!189308)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4346 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!10184)

(assert (=> b!121158 (= lt!189308 (appendNLeastSignificantBitsLoop!0 (_2!5357 lt!189304) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!121158 e!79367))

(declare-fun res!100338 () Bool)

(assert (=> b!121158 (=> (not res!100338) (not e!79367))))

(assert (=> b!121158 (= res!100338 (= (size!2436 (buf!2870 thiss!1305)) (size!2436 (buf!2870 (_2!5357 lt!189304)))))))

(declare-fun appendBit!0 (BitStream!4346 Bool) tuple2!10184)

(assert (=> b!121158 (= lt!189304 (appendBit!0 thiss!1305 lt!189322))))

(assert (=> b!121158 (= lt!189322 (not (= (bvand v!199 lt!189299) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!121158 (= lt!189299 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!121159 () Bool)

(assert (=> b!121159 (= e!79365 (= (_2!5360 lt!189320) (_2!5360 lt!189306)))))

(declare-fun b!121160 () Bool)

(declare-fun res!100348 () Bool)

(assert (=> b!121160 (=> (not res!100348) (not e!79371))))

(assert (=> b!121160 (= res!100348 (bvslt i!615 nBits!396))))

(declare-fun b!121161 () Bool)

(declare-fun res!100345 () Bool)

(assert (=> b!121161 (=> (not res!100345) (not e!79371))))

(assert (=> b!121161 (= res!100345 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!121162 () Bool)

(assert (=> b!121162 (= e!79369 (= (bitIndex!0 (size!2436 (buf!2870 (_1!5360 lt!189316))) (currentByte!5555 (_1!5360 lt!189316)) (currentBit!5550 (_1!5360 lt!189316))) lt!189302))))

(declare-fun b!121163 () Bool)

(assert (=> b!121163 (= e!79372 (or (not (= (_1!5359 lt!189300) lt!189309)) (= (_1!5358 lt!189310) (_2!5359 lt!189315))))))

(assert (=> b!121163 e!79373))

(declare-fun res!100340 () Bool)

(assert (=> b!121163 (=> (not res!100340) (not e!79373))))

(declare-fun lt!189324 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4346 (_ BitVec 64)) BitStream!4346)

(assert (=> b!121163 (= res!100340 (= (_1!5359 lt!189300) (withMovedBitIndex!0 (_2!5359 lt!189300) (bvsub lt!189314 lt!189324))))))

(assert (=> b!121163 (= lt!189314 (bitIndex!0 (size!2436 (buf!2870 (_2!5357 lt!189304))) (currentByte!5555 (_2!5357 lt!189304)) (currentBit!5550 (_2!5357 lt!189304))))))

(assert (=> b!121163 (= (_1!5359 lt!189315) (withMovedBitIndex!0 (_2!5359 lt!189315) (bvsub lt!189319 lt!189324)))))

(assert (=> b!121163 (= lt!189324 (bitIndex!0 (size!2436 (buf!2870 (_2!5357 lt!189308))) (currentByte!5555 (_2!5357 lt!189308)) (currentBit!5550 (_2!5357 lt!189308))))))

(assert (=> b!121163 (= lt!189319 (bitIndex!0 (size!2436 (buf!2870 thiss!1305)) (currentByte!5555 thiss!1305) (currentBit!5550 thiss!1305)))))

(declare-fun lt!189298 () tuple2!10186)

(assert (=> b!121163 (and (= (_2!5358 lt!189310) (_2!5358 lt!189298)) (= (_1!5358 lt!189310) (_1!5358 lt!189298)))))

(declare-fun lt!189297 () Unit!7463)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4346 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7463)

(assert (=> b!121163 (= lt!189297 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5359 lt!189315) nBits!396 i!615 lt!189296))))

(assert (=> b!121163 (= lt!189298 (readNLeastSignificantBitsLoopPure!0 lt!189309 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!189307))))

(assert (=> b!121163 (= lt!189309 (withMovedBitIndex!0 (_1!5359 lt!189315) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!121164 () Bool)

(assert (=> b!121164 (= e!79374 e!79371)))

(declare-fun res!100349 () Bool)

(assert (=> b!121164 (=> (not res!100349) (not e!79371))))

(assert (=> b!121164 (= res!100349 (validate_offset_bits!1 ((_ sign_extend 32) (size!2436 (buf!2870 thiss!1305))) ((_ sign_extend 32) (currentByte!5555 thiss!1305)) ((_ sign_extend 32) (currentBit!5550 thiss!1305)) lt!189312))))

(assert (=> b!121164 (= lt!189312 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!121165 () Bool)

(declare-fun res!100350 () Bool)

(assert (=> b!121165 (=> (not res!100350) (not e!79370))))

(assert (=> b!121165 (= res!100350 (isPrefixOf!0 thiss!1305 (_2!5357 lt!189304)))))

(assert (= (and start!23922 res!100342) b!121164))

(assert (= (and b!121164 res!100349) b!121161))

(assert (= (and b!121161 res!100345) b!121160))

(assert (= (and b!121160 res!100348) b!121158))

(assert (= (and b!121158 res!100338) b!121152))

(assert (= (and b!121152 res!100346) b!121165))

(assert (= (and b!121165 res!100350) b!121154))

(assert (= (and b!121154 res!100347) b!121162))

(assert (= (and b!121158 res!100339) b!121157))

(assert (= (and b!121157 res!100344) b!121155))

(assert (= (and b!121158 res!100343) b!121159))

(assert (= (and b!121158 (not res!100341)) b!121163))

(assert (= (and b!121163 res!100340) b!121153))

(assert (= start!23922 b!121156))

(declare-fun m!183399 () Bool)

(assert (=> b!121157 m!183399))

(declare-fun m!183401 () Bool)

(assert (=> b!121165 m!183401))

(declare-fun m!183403 () Bool)

(assert (=> b!121163 m!183403))

(declare-fun m!183405 () Bool)

(assert (=> b!121163 m!183405))

(declare-fun m!183407 () Bool)

(assert (=> b!121163 m!183407))

(declare-fun m!183409 () Bool)

(assert (=> b!121163 m!183409))

(declare-fun m!183411 () Bool)

(assert (=> b!121163 m!183411))

(declare-fun m!183413 () Bool)

(assert (=> b!121163 m!183413))

(declare-fun m!183415 () Bool)

(assert (=> b!121163 m!183415))

(declare-fun m!183417 () Bool)

(assert (=> b!121163 m!183417))

(declare-fun m!183419 () Bool)

(assert (=> b!121164 m!183419))

(declare-fun m!183421 () Bool)

(assert (=> b!121155 m!183421))

(declare-fun m!183423 () Bool)

(assert (=> b!121161 m!183423))

(declare-fun m!183425 () Bool)

(assert (=> b!121158 m!183425))

(declare-fun m!183427 () Bool)

(assert (=> b!121158 m!183427))

(declare-fun m!183429 () Bool)

(assert (=> b!121158 m!183429))

(declare-fun m!183431 () Bool)

(assert (=> b!121158 m!183431))

(declare-fun m!183433 () Bool)

(assert (=> b!121158 m!183433))

(declare-fun m!183435 () Bool)

(assert (=> b!121158 m!183435))

(declare-fun m!183437 () Bool)

(assert (=> b!121158 m!183437))

(declare-fun m!183439 () Bool)

(assert (=> b!121158 m!183439))

(declare-fun m!183441 () Bool)

(assert (=> b!121158 m!183441))

(declare-fun m!183443 () Bool)

(assert (=> b!121158 m!183443))

(declare-fun m!183445 () Bool)

(assert (=> b!121158 m!183445))

(declare-fun m!183447 () Bool)

(assert (=> b!121158 m!183447))

(declare-fun m!183449 () Bool)

(assert (=> b!121158 m!183449))

(declare-fun m!183451 () Bool)

(assert (=> b!121158 m!183451))

(declare-fun m!183453 () Bool)

(assert (=> b!121158 m!183453))

(declare-fun m!183455 () Bool)

(assert (=> b!121158 m!183455))

(declare-fun m!183457 () Bool)

(assert (=> b!121158 m!183457))

(declare-fun m!183459 () Bool)

(assert (=> b!121158 m!183459))

(declare-fun m!183461 () Bool)

(assert (=> b!121158 m!183461))

(declare-fun m!183463 () Bool)

(assert (=> b!121156 m!183463))

(declare-fun m!183465 () Bool)

(assert (=> b!121162 m!183465))

(assert (=> b!121152 m!183405))

(assert (=> b!121152 m!183407))

(declare-fun m!183467 () Bool)

(assert (=> start!23922 m!183467))

(declare-fun m!183469 () Bool)

(assert (=> b!121154 m!183469))

(assert (=> b!121154 m!183469))

(declare-fun m!183471 () Bool)

(assert (=> b!121154 m!183471))

(push 1)

(assert (not b!121152))

(assert (not b!121158))

(assert (not b!121155))

(assert (not b!121165))

(assert (not b!121164))

(assert (not b!121162))

(assert (not b!121157))

(assert (not b!121154))

(assert (not b!121163))

(assert (not start!23922))

(assert (not b!121161))

(assert (not b!121156))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!39008 () Bool)

(declare-fun res!100365 () Bool)

(declare-fun e!79383 () Bool)

(assert (=> d!39008 (=> (not res!100365) (not e!79383))))

(assert (=> d!39008 (= res!100365 (= (size!2436 (buf!2870 thiss!1305)) (size!2436 (buf!2870 (_2!5357 lt!189304)))))))

(assert (=> d!39008 (= (isPrefixOf!0 thiss!1305 (_2!5357 lt!189304)) e!79383)))

(declare-fun b!121178 () Bool)

(declare-fun res!100364 () Bool)

(assert (=> b!121178 (=> (not res!100364) (not e!79383))))

(assert (=> b!121178 (= res!100364 (bvsle (bitIndex!0 (size!2436 (buf!2870 thiss!1305)) (currentByte!5555 thiss!1305) (currentBit!5550 thiss!1305)) (bitIndex!0 (size!2436 (buf!2870 (_2!5357 lt!189304))) (currentByte!5555 (_2!5357 lt!189304)) (currentBit!5550 (_2!5357 lt!189304)))))))

(declare-fun b!121179 () Bool)

(declare-fun e!79382 () Bool)

(assert (=> b!121179 (= e!79383 e!79382)))

(declare-fun res!100363 () Bool)

(assert (=> b!121179 (=> res!100363 e!79382)))

(assert (=> b!121179 (= res!100363 (= (size!2436 (buf!2870 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!121180 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5382 array!5382 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!121180 (= e!79382 (arrayBitRangesEq!0 (buf!2870 thiss!1305) (buf!2870 (_2!5357 lt!189304)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2436 (buf!2870 thiss!1305)) (currentByte!5555 thiss!1305) (currentBit!5550 thiss!1305))))))

(assert (= (and d!39008 res!100365) b!121178))

(assert (= (and b!121178 res!100364) b!121179))

(assert (= (and b!121179 (not res!100363)) b!121180))

(assert (=> b!121178 m!183407))

(assert (=> b!121178 m!183405))

(assert (=> b!121180 m!183407))

(assert (=> b!121180 m!183407))

(declare-fun m!183477 () Bool)

(assert (=> b!121180 m!183477))

(assert (=> b!121165 d!39008))

(declare-fun d!39014 () Bool)

(assert (=> d!39014 (= (invariant!0 (currentBit!5550 thiss!1305) (currentByte!5555 thiss!1305) (size!2436 (buf!2870 (_2!5357 lt!189308)))) (and (bvsge (currentBit!5550 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5550 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5555 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5555 thiss!1305) (size!2436 (buf!2870 (_2!5357 lt!189308)))) (and (= (currentBit!5550 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5555 thiss!1305) (size!2436 (buf!2870 (_2!5357 lt!189308))))))))))

(assert (=> b!121155 d!39014))

(declare-fun d!39016 () Bool)

(assert (=> d!39016 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5550 thiss!1305) (currentByte!5555 thiss!1305) (size!2436 (buf!2870 thiss!1305))))))

(declare-fun bs!9437 () Bool)

(assert (= bs!9437 d!39016))

(declare-fun m!183479 () Bool)

(assert (=> bs!9437 m!183479))

(assert (=> start!23922 d!39016))

(declare-fun d!39018 () Bool)

(assert (=> d!39018 (= (array_inv!2238 (buf!2870 thiss!1305)) (bvsge (size!2436 (buf!2870 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!121156 d!39018))

(declare-fun d!39020 () Bool)

(declare-fun e!79389 () Bool)

(assert (=> d!39020 e!79389))

(declare-fun res!100373 () Bool)

(assert (=> d!39020 (=> (not res!100373) (not e!79389))))

(declare-fun lt!189365 () (_ BitVec 64))

(declare-fun lt!189366 () (_ BitVec 64))

(declare-fun lt!189364 () (_ BitVec 64))

(assert (=> d!39020 (= res!100373 (= lt!189364 (bvsub lt!189366 lt!189365)))))

(assert (=> d!39020 (or (= (bvand lt!189366 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!189365 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!189366 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!189366 lt!189365) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!39020 (= lt!189365 (remainingBits!0 ((_ sign_extend 32) (size!2436 (buf!2870 (_2!5357 lt!189304)))) ((_ sign_extend 32) (currentByte!5555 (_2!5357 lt!189304))) ((_ sign_extend 32) (currentBit!5550 (_2!5357 lt!189304)))))))

(declare-fun lt!189361 () (_ BitVec 64))

(declare-fun lt!189363 () (_ BitVec 64))

(assert (=> d!39020 (= lt!189366 (bvmul lt!189361 lt!189363))))

(assert (=> d!39020 (or (= lt!189361 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!189363 (bvsdiv (bvmul lt!189361 lt!189363) lt!189361)))))

(assert (=> d!39020 (= lt!189363 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39020 (= lt!189361 ((_ sign_extend 32) (size!2436 (buf!2870 (_2!5357 lt!189304)))))))

(assert (=> d!39020 (= lt!189364 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5555 (_2!5357 lt!189304))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5550 (_2!5357 lt!189304)))))))

(assert (=> d!39020 (invariant!0 (currentBit!5550 (_2!5357 lt!189304)) (currentByte!5555 (_2!5357 lt!189304)) (size!2436 (buf!2870 (_2!5357 lt!189304))))))

(assert (=> d!39020 (= (bitIndex!0 (size!2436 (buf!2870 (_2!5357 lt!189304))) (currentByte!5555 (_2!5357 lt!189304)) (currentBit!5550 (_2!5357 lt!189304))) lt!189364)))

(declare-fun b!121188 () Bool)

(declare-fun res!100374 () Bool)

(assert (=> b!121188 (=> (not res!100374) (not e!79389))))

(assert (=> b!121188 (= res!100374 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!189364))))

(declare-fun b!121189 () Bool)

(declare-fun lt!189362 () (_ BitVec 64))

(assert (=> b!121189 (= e!79389 (bvsle lt!189364 (bvmul lt!189362 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!121189 (or (= lt!189362 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!189362 #b0000000000000000000000000000000000000000000000000000000000001000) lt!189362)))))

(assert (=> b!121189 (= lt!189362 ((_ sign_extend 32) (size!2436 (buf!2870 (_2!5357 lt!189304)))))))

(assert (= (and d!39020 res!100373) b!121188))

(assert (= (and b!121188 res!100374) b!121189))

(declare-fun m!183489 () Bool)

(assert (=> d!39020 m!183489))

(declare-fun m!183491 () Bool)

(assert (=> d!39020 m!183491))

(assert (=> b!121152 d!39020))

(declare-fun d!39024 () Bool)

(declare-fun e!79390 () Bool)

(assert (=> d!39024 e!79390))

(declare-fun res!100375 () Bool)

(assert (=> d!39024 (=> (not res!100375) (not e!79390))))

(declare-fun lt!189372 () (_ BitVec 64))

(declare-fun lt!189370 () (_ BitVec 64))

(declare-fun lt!189371 () (_ BitVec 64))

(assert (=> d!39024 (= res!100375 (= lt!189370 (bvsub lt!189372 lt!189371)))))

(assert (=> d!39024 (or (= (bvand lt!189372 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!189371 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!189372 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!189372 lt!189371) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39024 (= lt!189371 (remainingBits!0 ((_ sign_extend 32) (size!2436 (buf!2870 thiss!1305))) ((_ sign_extend 32) (currentByte!5555 thiss!1305)) ((_ sign_extend 32) (currentBit!5550 thiss!1305))))))

(declare-fun lt!189367 () (_ BitVec 64))

(declare-fun lt!189369 () (_ BitVec 64))

(assert (=> d!39024 (= lt!189372 (bvmul lt!189367 lt!189369))))

(assert (=> d!39024 (or (= lt!189367 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!189369 (bvsdiv (bvmul lt!189367 lt!189369) lt!189367)))))

(assert (=> d!39024 (= lt!189369 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39024 (= lt!189367 ((_ sign_extend 32) (size!2436 (buf!2870 thiss!1305))))))

(assert (=> d!39024 (= lt!189370 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5555 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5550 thiss!1305))))))

(assert (=> d!39024 (invariant!0 (currentBit!5550 thiss!1305) (currentByte!5555 thiss!1305) (size!2436 (buf!2870 thiss!1305)))))

(assert (=> d!39024 (= (bitIndex!0 (size!2436 (buf!2870 thiss!1305)) (currentByte!5555 thiss!1305) (currentBit!5550 thiss!1305)) lt!189370)))

(declare-fun b!121190 () Bool)

(declare-fun res!100376 () Bool)

(assert (=> b!121190 (=> (not res!100376) (not e!79390))))

(assert (=> b!121190 (= res!100376 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!189370))))

(declare-fun b!121191 () Bool)

(declare-fun lt!189368 () (_ BitVec 64))

(assert (=> b!121191 (= e!79390 (bvsle lt!189370 (bvmul lt!189368 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!121191 (or (= lt!189368 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!189368 #b0000000000000000000000000000000000000000000000000000000000001000) lt!189368)))))

(assert (=> b!121191 (= lt!189368 ((_ sign_extend 32) (size!2436 (buf!2870 thiss!1305))))))

(assert (= (and d!39024 res!100375) b!121190))

(assert (= (and b!121190 res!100376) b!121191))

(declare-fun m!183493 () Bool)

(assert (=> d!39024 m!183493))

(assert (=> d!39024 m!183479))

(assert (=> b!121152 d!39024))

(assert (=> b!121163 d!39020))

(declare-fun d!39026 () Bool)

(declare-fun e!79393 () Bool)

(assert (=> d!39026 e!79393))

(declare-fun res!100379 () Bool)

(assert (=> d!39026 (=> (not res!100379) (not e!79393))))

(declare-fun lt!189378 () (_ BitVec 64))

(declare-fun lt!189377 () BitStream!4346)

(assert (=> d!39026 (= res!100379 (= (bvadd lt!189378 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2436 (buf!2870 lt!189377)) (currentByte!5555 lt!189377) (currentBit!5550 lt!189377))))))

(assert (=> d!39026 (or (not (= (bvand lt!189378 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!189378 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!189378 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39026 (= lt!189378 (bitIndex!0 (size!2436 (buf!2870 (_1!5359 lt!189315))) (currentByte!5555 (_1!5359 lt!189315)) (currentBit!5550 (_1!5359 lt!189315))))))

(declare-fun moveBitIndex!0 (BitStream!4346 (_ BitVec 64)) tuple2!10184)

(assert (=> d!39026 (= lt!189377 (_2!5357 (moveBitIndex!0 (_1!5359 lt!189315) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!4346 (_ BitVec 64)) Bool)

(assert (=> d!39026 (moveBitIndexPrecond!0 (_1!5359 lt!189315) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!39026 (= (withMovedBitIndex!0 (_1!5359 lt!189315) #b0000000000000000000000000000000000000000000000000000000000000001) lt!189377)))

(declare-fun b!121194 () Bool)

(assert (=> b!121194 (= e!79393 (= (size!2436 (buf!2870 (_1!5359 lt!189315))) (size!2436 (buf!2870 lt!189377))))))

(assert (= (and d!39026 res!100379) b!121194))

(declare-fun m!183495 () Bool)

(assert (=> d!39026 m!183495))

(declare-fun m!183497 () Bool)

(assert (=> d!39026 m!183497))

(declare-fun m!183499 () Bool)

(assert (=> d!39026 m!183499))

(declare-fun m!183501 () Bool)

(assert (=> d!39026 m!183501))

(assert (=> b!121163 d!39026))

(declare-fun d!39028 () Bool)

(declare-fun e!79394 () Bool)

(assert (=> d!39028 e!79394))

(declare-fun res!100380 () Bool)

(assert (=> d!39028 (=> (not res!100380) (not e!79394))))

(declare-fun lt!189384 () (_ BitVec 64))

(declare-fun lt!189383 () (_ BitVec 64))

(declare-fun lt!189382 () (_ BitVec 64))

(assert (=> d!39028 (= res!100380 (= lt!189382 (bvsub lt!189384 lt!189383)))))

(assert (=> d!39028 (or (= (bvand lt!189384 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!189383 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!189384 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!189384 lt!189383) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39028 (= lt!189383 (remainingBits!0 ((_ sign_extend 32) (size!2436 (buf!2870 (_2!5357 lt!189308)))) ((_ sign_extend 32) (currentByte!5555 (_2!5357 lt!189308))) ((_ sign_extend 32) (currentBit!5550 (_2!5357 lt!189308)))))))

(declare-fun lt!189379 () (_ BitVec 64))

(declare-fun lt!189381 () (_ BitVec 64))

(assert (=> d!39028 (= lt!189384 (bvmul lt!189379 lt!189381))))

(assert (=> d!39028 (or (= lt!189379 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!189381 (bvsdiv (bvmul lt!189379 lt!189381) lt!189379)))))

(assert (=> d!39028 (= lt!189381 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39028 (= lt!189379 ((_ sign_extend 32) (size!2436 (buf!2870 (_2!5357 lt!189308)))))))

(assert (=> d!39028 (= lt!189382 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5555 (_2!5357 lt!189308))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5550 (_2!5357 lt!189308)))))))

(assert (=> d!39028 (invariant!0 (currentBit!5550 (_2!5357 lt!189308)) (currentByte!5555 (_2!5357 lt!189308)) (size!2436 (buf!2870 (_2!5357 lt!189308))))))

(assert (=> d!39028 (= (bitIndex!0 (size!2436 (buf!2870 (_2!5357 lt!189308))) (currentByte!5555 (_2!5357 lt!189308)) (currentBit!5550 (_2!5357 lt!189308))) lt!189382)))

(declare-fun b!121195 () Bool)

(declare-fun res!100381 () Bool)

(assert (=> b!121195 (=> (not res!100381) (not e!79394))))

(assert (=> b!121195 (= res!100381 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!189382))))

(declare-fun b!121196 () Bool)

(declare-fun lt!189380 () (_ BitVec 64))

(assert (=> b!121196 (= e!79394 (bvsle lt!189382 (bvmul lt!189380 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!121196 (or (= lt!189380 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!189380 #b0000000000000000000000000000000000000000000000000000000000001000) lt!189380)))))

(assert (=> b!121196 (= lt!189380 ((_ sign_extend 32) (size!2436 (buf!2870 (_2!5357 lt!189308)))))))

(assert (= (and d!39028 res!100380) b!121195))

(assert (= (and b!121195 res!100381) b!121196))

(declare-fun m!183503 () Bool)

(assert (=> d!39028 m!183503))

(declare-fun m!183505 () Bool)

(assert (=> d!39028 m!183505))

(assert (=> b!121163 d!39028))

(declare-fun d!39030 () Bool)

(declare-fun lt!189423 () tuple2!10186)

(declare-fun lt!189421 () tuple2!10186)

(assert (=> d!39030 (and (= (_2!5358 lt!189423) (_2!5358 lt!189421)) (= (_1!5358 lt!189423) (_1!5358 lt!189421)))))

(declare-fun lt!189420 () Unit!7463)

(declare-fun lt!189424 () BitStream!4346)

(declare-fun lt!189425 () Bool)

(declare-fun lt!189422 () (_ BitVec 64))

(declare-fun choose!45 (BitStream!4346 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!10186 tuple2!10186 BitStream!4346 (_ BitVec 64) Bool BitStream!4346 (_ BitVec 64) tuple2!10186 tuple2!10186 BitStream!4346 (_ BitVec 64)) Unit!7463)

(assert (=> d!39030 (= lt!189420 (choose!45 (_1!5359 lt!189315) nBits!396 i!615 lt!189296 lt!189423 (tuple2!10187 (_1!5358 lt!189423) (_2!5358 lt!189423)) (_1!5358 lt!189423) (_2!5358 lt!189423) lt!189425 lt!189424 lt!189422 lt!189421 (tuple2!10187 (_1!5358 lt!189421) (_2!5358 lt!189421)) (_1!5358 lt!189421) (_2!5358 lt!189421)))))

(assert (=> d!39030 (= lt!189421 (readNLeastSignificantBitsLoopPure!0 lt!189424 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!189422))))

(assert (=> d!39030 (= lt!189422 (bvor lt!189296 (ite lt!189425 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39030 (= lt!189424 (withMovedBitIndex!0 (_1!5359 lt!189315) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!39030 (= lt!189425 (_2!5360 (readBitPure!0 (_1!5359 lt!189315))))))

(assert (=> d!39030 (= lt!189423 (readNLeastSignificantBitsLoopPure!0 (_1!5359 lt!189315) nBits!396 i!615 lt!189296))))

(assert (=> d!39030 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5359 lt!189315) nBits!396 i!615 lt!189296) lt!189420)))

(declare-fun bs!9440 () Bool)

(assert (= bs!9440 d!39030))

(assert (=> bs!9440 m!183439))

(declare-fun m!183521 () Bool)

(assert (=> bs!9440 m!183521))

(assert (=> bs!9440 m!183453))

(assert (=> bs!9440 m!183415))

(declare-fun m!183523 () Bool)

(assert (=> bs!9440 m!183523))

(assert (=> b!121163 d!39030))

(declare-fun d!39038 () Bool)

(declare-fun e!79399 () Bool)

(assert (=> d!39038 e!79399))

(declare-fun res!100389 () Bool)

(assert (=> d!39038 (=> (not res!100389) (not e!79399))))

(declare-fun lt!189427 () (_ BitVec 64))

(declare-fun lt!189426 () BitStream!4346)

(assert (=> d!39038 (= res!100389 (= (bvadd lt!189427 (bvsub lt!189319 lt!189324)) (bitIndex!0 (size!2436 (buf!2870 lt!189426)) (currentByte!5555 lt!189426) (currentBit!5550 lt!189426))))))

(assert (=> d!39038 (or (not (= (bvand lt!189427 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!189319 lt!189324) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!189427 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!189427 (bvsub lt!189319 lt!189324)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39038 (= lt!189427 (bitIndex!0 (size!2436 (buf!2870 (_2!5359 lt!189315))) (currentByte!5555 (_2!5359 lt!189315)) (currentBit!5550 (_2!5359 lt!189315))))))

(assert (=> d!39038 (= lt!189426 (_2!5357 (moveBitIndex!0 (_2!5359 lt!189315) (bvsub lt!189319 lt!189324))))))

(assert (=> d!39038 (moveBitIndexPrecond!0 (_2!5359 lt!189315) (bvsub lt!189319 lt!189324))))

(assert (=> d!39038 (= (withMovedBitIndex!0 (_2!5359 lt!189315) (bvsub lt!189319 lt!189324)) lt!189426)))

(declare-fun b!121204 () Bool)

(assert (=> b!121204 (= e!79399 (= (size!2436 (buf!2870 (_2!5359 lt!189315))) (size!2436 (buf!2870 lt!189426))))))

(assert (= (and d!39038 res!100389) b!121204))

(declare-fun m!183525 () Bool)

(assert (=> d!39038 m!183525))

(declare-fun m!183527 () Bool)

(assert (=> d!39038 m!183527))

(declare-fun m!183529 () Bool)

(assert (=> d!39038 m!183529))

(declare-fun m!183531 () Bool)

(assert (=> d!39038 m!183531))

(assert (=> b!121163 d!39038))

(declare-fun d!39040 () Bool)

(declare-datatypes ((tuple2!10198 0))(
  ( (tuple2!10199 (_1!5364 (_ BitVec 64)) (_2!5364 BitStream!4346)) )
))
(declare-fun lt!189430 () tuple2!10198)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4346 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10198)

(assert (=> d!39040 (= lt!189430 (readNLeastSignificantBitsLoop!0 lt!189309 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!189307))))

(assert (=> d!39040 (= (readNLeastSignificantBitsLoopPure!0 lt!189309 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!189307) (tuple2!10187 (_2!5364 lt!189430) (_1!5364 lt!189430)))))

(declare-fun bs!9441 () Bool)

(assert (= bs!9441 d!39040))

(declare-fun m!183533 () Bool)

(assert (=> bs!9441 m!183533))

(assert (=> b!121163 d!39040))

(declare-fun d!39042 () Bool)

(declare-fun e!79400 () Bool)

(assert (=> d!39042 e!79400))

(declare-fun res!100390 () Bool)

(assert (=> d!39042 (=> (not res!100390) (not e!79400))))

(declare-fun lt!189432 () (_ BitVec 64))

(declare-fun lt!189431 () BitStream!4346)

(assert (=> d!39042 (= res!100390 (= (bvadd lt!189432 (bvsub lt!189314 lt!189324)) (bitIndex!0 (size!2436 (buf!2870 lt!189431)) (currentByte!5555 lt!189431) (currentBit!5550 lt!189431))))))

(assert (=> d!39042 (or (not (= (bvand lt!189432 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!189314 lt!189324) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!189432 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!189432 (bvsub lt!189314 lt!189324)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39042 (= lt!189432 (bitIndex!0 (size!2436 (buf!2870 (_2!5359 lt!189300))) (currentByte!5555 (_2!5359 lt!189300)) (currentBit!5550 (_2!5359 lt!189300))))))

(assert (=> d!39042 (= lt!189431 (_2!5357 (moveBitIndex!0 (_2!5359 lt!189300) (bvsub lt!189314 lt!189324))))))

(assert (=> d!39042 (moveBitIndexPrecond!0 (_2!5359 lt!189300) (bvsub lt!189314 lt!189324))))

(assert (=> d!39042 (= (withMovedBitIndex!0 (_2!5359 lt!189300) (bvsub lt!189314 lt!189324)) lt!189431)))

(declare-fun b!121205 () Bool)

(assert (=> b!121205 (= e!79400 (= (size!2436 (buf!2870 (_2!5359 lt!189300))) (size!2436 (buf!2870 lt!189431))))))

(assert (= (and d!39042 res!100390) b!121205))

(declare-fun m!183535 () Bool)

(assert (=> d!39042 m!183535))

(declare-fun m!183537 () Bool)

(assert (=> d!39042 m!183537))

(declare-fun m!183539 () Bool)

(assert (=> d!39042 m!183539))

(declare-fun m!183541 () Bool)

(assert (=> d!39042 m!183541))

(assert (=> b!121163 d!39042))

(assert (=> b!121163 d!39024))

(declare-fun d!39044 () Bool)

(assert (=> d!39044 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2436 (buf!2870 thiss!1305))) ((_ sign_extend 32) (currentByte!5555 thiss!1305)) ((_ sign_extend 32) (currentBit!5550 thiss!1305)) lt!189312) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2436 (buf!2870 thiss!1305))) ((_ sign_extend 32) (currentByte!5555 thiss!1305)) ((_ sign_extend 32) (currentBit!5550 thiss!1305))) lt!189312))))

(declare-fun bs!9442 () Bool)

(assert (= bs!9442 d!39044))

(assert (=> bs!9442 m!183493))

(assert (=> b!121164 d!39044))

(declare-fun d!39046 () Bool)

(declare-datatypes ((tuple2!10200 0))(
  ( (tuple2!10201 (_1!5365 Bool) (_2!5365 BitStream!4346)) )
))
(declare-fun lt!189447 () tuple2!10200)

(declare-fun readBit!0 (BitStream!4346) tuple2!10200)

(assert (=> d!39046 (= lt!189447 (readBit!0 (readerFrom!0 (_2!5357 lt!189304) (currentBit!5550 thiss!1305) (currentByte!5555 thiss!1305))))))

(assert (=> d!39046 (= (readBitPure!0 (readerFrom!0 (_2!5357 lt!189304) (currentBit!5550 thiss!1305) (currentByte!5555 thiss!1305))) (tuple2!10191 (_2!5365 lt!189447) (_1!5365 lt!189447)))))

(declare-fun bs!9444 () Bool)

(assert (= bs!9444 d!39046))

(assert (=> bs!9444 m!183469))

(declare-fun m!183543 () Bool)

(assert (=> bs!9444 m!183543))

(assert (=> b!121154 d!39046))

(declare-fun d!39048 () Bool)

(declare-fun e!79406 () Bool)

(assert (=> d!39048 e!79406))

(declare-fun res!100399 () Bool)

(assert (=> d!39048 (=> (not res!100399) (not e!79406))))

(assert (=> d!39048 (= res!100399 (invariant!0 (currentBit!5550 (_2!5357 lt!189304)) (currentByte!5555 (_2!5357 lt!189304)) (size!2436 (buf!2870 (_2!5357 lt!189304)))))))

(assert (=> d!39048 (= (readerFrom!0 (_2!5357 lt!189304) (currentBit!5550 thiss!1305) (currentByte!5555 thiss!1305)) (BitStream!4347 (buf!2870 (_2!5357 lt!189304)) (currentByte!5555 thiss!1305) (currentBit!5550 thiss!1305)))))

(declare-fun b!121213 () Bool)

(assert (=> b!121213 (= e!79406 (invariant!0 (currentBit!5550 thiss!1305) (currentByte!5555 thiss!1305) (size!2436 (buf!2870 (_2!5357 lt!189304)))))))

(assert (= (and d!39048 res!100399) b!121213))

(assert (=> d!39048 m!183491))

(assert (=> b!121213 m!183399))

(assert (=> b!121154 d!39048))

(declare-fun d!39056 () Bool)

(assert (=> d!39056 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!121161 d!39056))

(declare-fun d!39060 () Bool)

(declare-fun e!79407 () Bool)

(assert (=> d!39060 e!79407))

(declare-fun res!100400 () Bool)

(assert (=> d!39060 (=> (not res!100400) (not e!79407))))

(declare-fun lt!189472 () (_ BitVec 64))

(declare-fun lt!189471 () (_ BitVec 64))

(declare-fun lt!189473 () (_ BitVec 64))

(assert (=> d!39060 (= res!100400 (= lt!189471 (bvsub lt!189473 lt!189472)))))

(assert (=> d!39060 (or (= (bvand lt!189473 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!189472 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!189473 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!189473 lt!189472) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39060 (= lt!189472 (remainingBits!0 ((_ sign_extend 32) (size!2436 (buf!2870 (_1!5360 lt!189316)))) ((_ sign_extend 32) (currentByte!5555 (_1!5360 lt!189316))) ((_ sign_extend 32) (currentBit!5550 (_1!5360 lt!189316)))))))

(declare-fun lt!189468 () (_ BitVec 64))

(declare-fun lt!189470 () (_ BitVec 64))

(assert (=> d!39060 (= lt!189473 (bvmul lt!189468 lt!189470))))

(assert (=> d!39060 (or (= lt!189468 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!189470 (bvsdiv (bvmul lt!189468 lt!189470) lt!189468)))))

(assert (=> d!39060 (= lt!189470 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39060 (= lt!189468 ((_ sign_extend 32) (size!2436 (buf!2870 (_1!5360 lt!189316)))))))

(assert (=> d!39060 (= lt!189471 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5555 (_1!5360 lt!189316))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5550 (_1!5360 lt!189316)))))))

(assert (=> d!39060 (invariant!0 (currentBit!5550 (_1!5360 lt!189316)) (currentByte!5555 (_1!5360 lt!189316)) (size!2436 (buf!2870 (_1!5360 lt!189316))))))

(assert (=> d!39060 (= (bitIndex!0 (size!2436 (buf!2870 (_1!5360 lt!189316))) (currentByte!5555 (_1!5360 lt!189316)) (currentBit!5550 (_1!5360 lt!189316))) lt!189471)))

(declare-fun b!121214 () Bool)

(declare-fun res!100401 () Bool)

(assert (=> b!121214 (=> (not res!100401) (not e!79407))))

(assert (=> b!121214 (= res!100401 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!189471))))

(declare-fun b!121215 () Bool)

(declare-fun lt!189469 () (_ BitVec 64))

(assert (=> b!121215 (= e!79407 (bvsle lt!189471 (bvmul lt!189469 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!121215 (or (= lt!189469 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!189469 #b0000000000000000000000000000000000000000000000000000000000001000) lt!189469)))))

(assert (=> b!121215 (= lt!189469 ((_ sign_extend 32) (size!2436 (buf!2870 (_1!5360 lt!189316)))))))

(assert (= (and d!39060 res!100400) b!121214))

(assert (= (and b!121214 res!100401) b!121215))

(declare-fun m!183565 () Bool)

(assert (=> d!39060 m!183565))

(declare-fun m!183567 () Bool)

(assert (=> d!39060 m!183567))

(assert (=> b!121162 d!39060))

(declare-fun d!39062 () Bool)

(assert (=> d!39062 (= (invariant!0 (currentBit!5550 thiss!1305) (currentByte!5555 thiss!1305) (size!2436 (buf!2870 (_2!5357 lt!189304)))) (and (bvsge (currentBit!5550 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5550 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5555 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5555 thiss!1305) (size!2436 (buf!2870 (_2!5357 lt!189304)))) (and (= (currentBit!5550 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5555 thiss!1305) (size!2436 (buf!2870 (_2!5357 lt!189304))))))))))

(assert (=> b!121157 d!39062))

(declare-fun b!121241 () Bool)

(declare-fun e!79422 () Bool)

(declare-fun e!79423 () Bool)

(assert (=> b!121241 (= e!79422 e!79423)))

(declare-fun res!100425 () Bool)

(assert (=> b!121241 (=> (not res!100425) (not e!79423))))

(declare-fun lt!189500 () tuple2!10190)

(declare-fun lt!189497 () tuple2!10184)

(assert (=> b!121241 (= res!100425 (and (= (_2!5360 lt!189500) lt!189322) (= (_1!5360 lt!189500) (_2!5357 lt!189497))))))

(assert (=> b!121241 (= lt!189500 (readBitPure!0 (readerFrom!0 (_2!5357 lt!189497) (currentBit!5550 thiss!1305) (currentByte!5555 thiss!1305))))))

(declare-fun d!39064 () Bool)

(assert (=> d!39064 e!79422))

(declare-fun res!100428 () Bool)

(assert (=> d!39064 (=> (not res!100428) (not e!79422))))

(assert (=> d!39064 (= res!100428 (= (size!2436 (buf!2870 thiss!1305)) (size!2436 (buf!2870 (_2!5357 lt!189497)))))))

(declare-fun choose!16 (BitStream!4346 Bool) tuple2!10184)

(assert (=> d!39064 (= lt!189497 (choose!16 thiss!1305 lt!189322))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!39064 (validate_offset_bit!0 ((_ sign_extend 32) (size!2436 (buf!2870 thiss!1305))) ((_ sign_extend 32) (currentByte!5555 thiss!1305)) ((_ sign_extend 32) (currentBit!5550 thiss!1305)))))

(assert (=> d!39064 (= (appendBit!0 thiss!1305 lt!189322) lt!189497)))

(declare-fun b!121240 () Bool)

(declare-fun res!100426 () Bool)

(assert (=> b!121240 (=> (not res!100426) (not e!79422))))

(assert (=> b!121240 (= res!100426 (isPrefixOf!0 thiss!1305 (_2!5357 lt!189497)))))

(declare-fun b!121239 () Bool)

(declare-fun res!100427 () Bool)

(assert (=> b!121239 (=> (not res!100427) (not e!79422))))

(declare-fun lt!189499 () (_ BitVec 64))

(declare-fun lt!189498 () (_ BitVec 64))

(assert (=> b!121239 (= res!100427 (= (bitIndex!0 (size!2436 (buf!2870 (_2!5357 lt!189497))) (currentByte!5555 (_2!5357 lt!189497)) (currentBit!5550 (_2!5357 lt!189497))) (bvadd lt!189498 lt!189499)))))

(assert (=> b!121239 (or (not (= (bvand lt!189498 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!189499 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!189498 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!189498 lt!189499) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!121239 (= lt!189499 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!121239 (= lt!189498 (bitIndex!0 (size!2436 (buf!2870 thiss!1305)) (currentByte!5555 thiss!1305) (currentBit!5550 thiss!1305)))))

(declare-fun b!121242 () Bool)

(assert (=> b!121242 (= e!79423 (= (bitIndex!0 (size!2436 (buf!2870 (_1!5360 lt!189500))) (currentByte!5555 (_1!5360 lt!189500)) (currentBit!5550 (_1!5360 lt!189500))) (bitIndex!0 (size!2436 (buf!2870 (_2!5357 lt!189497))) (currentByte!5555 (_2!5357 lt!189497)) (currentBit!5550 (_2!5357 lt!189497)))))))

(assert (= (and d!39064 res!100428) b!121239))

(assert (= (and b!121239 res!100427) b!121240))

(assert (= (and b!121240 res!100426) b!121241))

(assert (= (and b!121241 res!100425) b!121242))

(declare-fun m!183587 () Bool)

(assert (=> b!121239 m!183587))

(assert (=> b!121239 m!183407))

(declare-fun m!183589 () Bool)

(assert (=> b!121242 m!183589))

(assert (=> b!121242 m!183587))

(declare-fun m!183591 () Bool)

(assert (=> b!121240 m!183591))

(declare-fun m!183593 () Bool)

(assert (=> b!121241 m!183593))

(assert (=> b!121241 m!183593))

(declare-fun m!183595 () Bool)

(assert (=> b!121241 m!183595))

(declare-fun m!183597 () Bool)

(assert (=> d!39064 m!183597))

(declare-fun m!183599 () Bool)

(assert (=> d!39064 m!183599))

(assert (=> b!121158 d!39064))

(declare-fun d!39094 () Bool)

(declare-fun e!79424 () Bool)

(assert (=> d!39094 e!79424))

(declare-fun res!100429 () Bool)

(assert (=> d!39094 (=> (not res!100429) (not e!79424))))

(declare-fun lt!189504 () (_ BitVec 64))

(declare-fun lt!189505 () (_ BitVec 64))

(declare-fun lt!189506 () (_ BitVec 64))

(assert (=> d!39094 (= res!100429 (= lt!189504 (bvsub lt!189506 lt!189505)))))

(assert (=> d!39094 (or (= (bvand lt!189506 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!189505 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!189506 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!189506 lt!189505) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39094 (= lt!189505 (remainingBits!0 ((_ sign_extend 32) (size!2436 (buf!2870 (_1!5360 lt!189320)))) ((_ sign_extend 32) (currentByte!5555 (_1!5360 lt!189320))) ((_ sign_extend 32) (currentBit!5550 (_1!5360 lt!189320)))))))

(declare-fun lt!189501 () (_ BitVec 64))

(declare-fun lt!189503 () (_ BitVec 64))

(assert (=> d!39094 (= lt!189506 (bvmul lt!189501 lt!189503))))

(assert (=> d!39094 (or (= lt!189501 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!189503 (bvsdiv (bvmul lt!189501 lt!189503) lt!189501)))))

(assert (=> d!39094 (= lt!189503 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39094 (= lt!189501 ((_ sign_extend 32) (size!2436 (buf!2870 (_1!5360 lt!189320)))))))

(assert (=> d!39094 (= lt!189504 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5555 (_1!5360 lt!189320))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5550 (_1!5360 lt!189320)))))))

(assert (=> d!39094 (invariant!0 (currentBit!5550 (_1!5360 lt!189320)) (currentByte!5555 (_1!5360 lt!189320)) (size!2436 (buf!2870 (_1!5360 lt!189320))))))

(assert (=> d!39094 (= (bitIndex!0 (size!2436 (buf!2870 (_1!5360 lt!189320))) (currentByte!5555 (_1!5360 lt!189320)) (currentBit!5550 (_1!5360 lt!189320))) lt!189504)))

(declare-fun b!121243 () Bool)

(declare-fun res!100430 () Bool)

(assert (=> b!121243 (=> (not res!100430) (not e!79424))))

(assert (=> b!121243 (= res!100430 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!189504))))

(declare-fun b!121244 () Bool)

(declare-fun lt!189502 () (_ BitVec 64))

(assert (=> b!121244 (= e!79424 (bvsle lt!189504 (bvmul lt!189502 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!121244 (or (= lt!189502 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!189502 #b0000000000000000000000000000000000000000000000000000000000001000) lt!189502)))))

(assert (=> b!121244 (= lt!189502 ((_ sign_extend 32) (size!2436 (buf!2870 (_1!5360 lt!189320)))))))

(assert (= (and d!39094 res!100429) b!121243))

(assert (= (and b!121243 res!100430) b!121244))

(declare-fun m!183601 () Bool)

(assert (=> d!39094 m!183601))

(declare-fun m!183603 () Bool)

(assert (=> d!39094 m!183603))

(assert (=> b!121158 d!39094))

(declare-fun d!39096 () Bool)

(declare-fun e!79427 () Bool)

(assert (=> d!39096 e!79427))

(declare-fun res!100433 () Bool)

(assert (=> d!39096 (=> (not res!100433) (not e!79427))))

(declare-fun lt!189515 () tuple2!10190)

(declare-fun lt!189518 () tuple2!10190)

(assert (=> d!39096 (= res!100433 (= (bitIndex!0 (size!2436 (buf!2870 (_1!5360 lt!189515))) (currentByte!5555 (_1!5360 lt!189515)) (currentBit!5550 (_1!5360 lt!189515))) (bitIndex!0 (size!2436 (buf!2870 (_1!5360 lt!189518))) (currentByte!5555 (_1!5360 lt!189518)) (currentBit!5550 (_1!5360 lt!189518)))))))

(declare-fun lt!189516 () Unit!7463)

(declare-fun lt!189517 () BitStream!4346)

(declare-fun choose!50 (BitStream!4346 BitStream!4346 BitStream!4346 tuple2!10190 tuple2!10190 BitStream!4346 Bool tuple2!10190 tuple2!10190 BitStream!4346 Bool) Unit!7463)

(assert (=> d!39096 (= lt!189516 (choose!50 lt!189303 (_2!5357 lt!189308) lt!189517 lt!189515 (tuple2!10191 (_1!5360 lt!189515) (_2!5360 lt!189515)) (_1!5360 lt!189515) (_2!5360 lt!189515) lt!189518 (tuple2!10191 (_1!5360 lt!189518) (_2!5360 lt!189518)) (_1!5360 lt!189518) (_2!5360 lt!189518)))))

(assert (=> d!39096 (= lt!189518 (readBitPure!0 lt!189517))))

(assert (=> d!39096 (= lt!189515 (readBitPure!0 lt!189303))))

(assert (=> d!39096 (= lt!189517 (BitStream!4347 (buf!2870 (_2!5357 lt!189308)) (currentByte!5555 lt!189303) (currentBit!5550 lt!189303)))))

(assert (=> d!39096 (invariant!0 (currentBit!5550 lt!189303) (currentByte!5555 lt!189303) (size!2436 (buf!2870 (_2!5357 lt!189308))))))

(assert (=> d!39096 (= (readBitPrefixLemma!0 lt!189303 (_2!5357 lt!189308)) lt!189516)))

(declare-fun b!121247 () Bool)

(assert (=> b!121247 (= e!79427 (= (_2!5360 lt!189515) (_2!5360 lt!189518)))))

(assert (= (and d!39096 res!100433) b!121247))

(declare-fun m!183605 () Bool)

(assert (=> d!39096 m!183605))

(assert (=> d!39096 m!183425))

(declare-fun m!183607 () Bool)

(assert (=> d!39096 m!183607))

(declare-fun m!183609 () Bool)

(assert (=> d!39096 m!183609))

(declare-fun m!183611 () Bool)

(assert (=> d!39096 m!183611))

(declare-fun m!183613 () Bool)

(assert (=> d!39096 m!183613))

(assert (=> b!121158 d!39096))

(declare-fun d!39098 () Bool)

(assert (=> d!39098 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2436 (buf!2870 (_2!5357 lt!189308)))) ((_ sign_extend 32) (currentByte!5555 (_2!5357 lt!189304))) ((_ sign_extend 32) (currentBit!5550 (_2!5357 lt!189304))) lt!189311) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2436 (buf!2870 (_2!5357 lt!189308)))) ((_ sign_extend 32) (currentByte!5555 (_2!5357 lt!189304))) ((_ sign_extend 32) (currentBit!5550 (_2!5357 lt!189304)))) lt!189311))))

(declare-fun bs!9454 () Bool)

(assert (= bs!9454 d!39098))

(declare-fun m!183615 () Bool)

(assert (=> bs!9454 m!183615))

(assert (=> b!121158 d!39098))

(declare-fun d!39100 () Bool)

(assert (=> d!39100 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2436 (buf!2870 (_2!5357 lt!189308)))) ((_ sign_extend 32) (currentByte!5555 thiss!1305)) ((_ sign_extend 32) (currentBit!5550 thiss!1305)) lt!189312) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2436 (buf!2870 (_2!5357 lt!189308)))) ((_ sign_extend 32) (currentByte!5555 thiss!1305)) ((_ sign_extend 32) (currentBit!5550 thiss!1305))) lt!189312))))

(declare-fun bs!9455 () Bool)

(assert (= bs!9455 d!39100))

(declare-fun m!183617 () Bool)

(assert (=> bs!9455 m!183617))

(assert (=> b!121158 d!39100))

(declare-fun d!39102 () Bool)

(assert (=> d!39102 (validate_offset_bits!1 ((_ sign_extend 32) (size!2436 (buf!2870 (_2!5357 lt!189308)))) ((_ sign_extend 32) (currentByte!5555 (_2!5357 lt!189304))) ((_ sign_extend 32) (currentBit!5550 (_2!5357 lt!189304))) lt!189311)))

(declare-fun lt!189521 () Unit!7463)

(declare-fun choose!9 (BitStream!4346 array!5382 (_ BitVec 64) BitStream!4346) Unit!7463)

(assert (=> d!39102 (= lt!189521 (choose!9 (_2!5357 lt!189304) (buf!2870 (_2!5357 lt!189308)) lt!189311 (BitStream!4347 (buf!2870 (_2!5357 lt!189308)) (currentByte!5555 (_2!5357 lt!189304)) (currentBit!5550 (_2!5357 lt!189304)))))))

(assert (=> d!39102 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5357 lt!189304) (buf!2870 (_2!5357 lt!189308)) lt!189311) lt!189521)))

(declare-fun bs!9456 () Bool)

(assert (= bs!9456 d!39102))

(assert (=> bs!9456 m!183441))

(declare-fun m!183619 () Bool)

(assert (=> bs!9456 m!183619))

(assert (=> b!121158 d!39102))

(declare-fun d!39104 () Bool)

(declare-fun e!79440 () Bool)

(assert (=> d!39104 e!79440))

(declare-fun res!100454 () Bool)

(assert (=> d!39104 (=> (not res!100454) (not e!79440))))

(declare-fun lt!189654 () tuple2!10188)

(assert (=> d!39104 (= res!100454 (isPrefixOf!0 (_1!5359 lt!189654) (_2!5359 lt!189654)))))

(declare-fun lt!189658 () BitStream!4346)

(assert (=> d!39104 (= lt!189654 (tuple2!10189 lt!189658 (_2!5357 lt!189308)))))

(declare-fun lt!189650 () Unit!7463)

(declare-fun lt!189657 () Unit!7463)

(assert (=> d!39104 (= lt!189650 lt!189657)))

(assert (=> d!39104 (isPrefixOf!0 lt!189658 (_2!5357 lt!189308))))

(assert (=> d!39104 (= lt!189657 (lemmaIsPrefixTransitive!0 lt!189658 (_2!5357 lt!189308) (_2!5357 lt!189308)))))

(declare-fun lt!189644 () Unit!7463)

(declare-fun lt!189642 () Unit!7463)

(assert (=> d!39104 (= lt!189644 lt!189642)))

(assert (=> d!39104 (isPrefixOf!0 lt!189658 (_2!5357 lt!189308))))

(assert (=> d!39104 (= lt!189642 (lemmaIsPrefixTransitive!0 lt!189658 thiss!1305 (_2!5357 lt!189308)))))

(declare-fun lt!189653 () Unit!7463)

(declare-fun e!79441 () Unit!7463)

(assert (=> d!39104 (= lt!189653 e!79441)))

(declare-fun c!7277 () Bool)

(assert (=> d!39104 (= c!7277 (not (= (size!2436 (buf!2870 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!189646 () Unit!7463)

(declare-fun lt!189651 () Unit!7463)

(assert (=> d!39104 (= lt!189646 lt!189651)))

(assert (=> d!39104 (isPrefixOf!0 (_2!5357 lt!189308) (_2!5357 lt!189308))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4346) Unit!7463)

(assert (=> d!39104 (= lt!189651 (lemmaIsPrefixRefl!0 (_2!5357 lt!189308)))))

(declare-fun lt!189648 () Unit!7463)

(declare-fun lt!189655 () Unit!7463)

(assert (=> d!39104 (= lt!189648 lt!189655)))

(assert (=> d!39104 (= lt!189655 (lemmaIsPrefixRefl!0 (_2!5357 lt!189308)))))

(declare-fun lt!189660 () Unit!7463)

(declare-fun lt!189652 () Unit!7463)

(assert (=> d!39104 (= lt!189660 lt!189652)))

(assert (=> d!39104 (isPrefixOf!0 lt!189658 lt!189658)))

(assert (=> d!39104 (= lt!189652 (lemmaIsPrefixRefl!0 lt!189658))))

(declare-fun lt!189643 () Unit!7463)

(declare-fun lt!189661 () Unit!7463)

(assert (=> d!39104 (= lt!189643 lt!189661)))

(assert (=> d!39104 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!39104 (= lt!189661 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!39104 (= lt!189658 (BitStream!4347 (buf!2870 (_2!5357 lt!189308)) (currentByte!5555 thiss!1305) (currentBit!5550 thiss!1305)))))

(assert (=> d!39104 (isPrefixOf!0 thiss!1305 (_2!5357 lt!189308))))

(assert (=> d!39104 (= (reader!0 thiss!1305 (_2!5357 lt!189308)) lt!189654)))

(declare-fun b!121278 () Bool)

(declare-fun res!100452 () Bool)

(assert (=> b!121278 (=> (not res!100452) (not e!79440))))

(assert (=> b!121278 (= res!100452 (isPrefixOf!0 (_1!5359 lt!189654) thiss!1305))))

(declare-fun b!121279 () Bool)

(declare-fun lt!189659 () Unit!7463)

(assert (=> b!121279 (= e!79441 lt!189659)))

(declare-fun lt!189656 () (_ BitVec 64))

(assert (=> b!121279 (= lt!189656 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!189649 () (_ BitVec 64))

(assert (=> b!121279 (= lt!189649 (bitIndex!0 (size!2436 (buf!2870 thiss!1305)) (currentByte!5555 thiss!1305) (currentBit!5550 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5382 array!5382 (_ BitVec 64) (_ BitVec 64)) Unit!7463)

(assert (=> b!121279 (= lt!189659 (arrayBitRangesEqSymmetric!0 (buf!2870 thiss!1305) (buf!2870 (_2!5357 lt!189308)) lt!189656 lt!189649))))

(assert (=> b!121279 (arrayBitRangesEq!0 (buf!2870 (_2!5357 lt!189308)) (buf!2870 thiss!1305) lt!189656 lt!189649)))

(declare-fun b!121280 () Bool)

(declare-fun res!100453 () Bool)

(assert (=> b!121280 (=> (not res!100453) (not e!79440))))

(assert (=> b!121280 (= res!100453 (isPrefixOf!0 (_2!5359 lt!189654) (_2!5357 lt!189308)))))

(declare-fun b!121281 () Bool)

(declare-fun Unit!7475 () Unit!7463)

(assert (=> b!121281 (= e!79441 Unit!7475)))

(declare-fun b!121282 () Bool)

(declare-fun lt!189647 () (_ BitVec 64))

(declare-fun lt!189645 () (_ BitVec 64))

(assert (=> b!121282 (= e!79440 (= (_1!5359 lt!189654) (withMovedBitIndex!0 (_2!5359 lt!189654) (bvsub lt!189647 lt!189645))))))

(assert (=> b!121282 (or (= (bvand lt!189647 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!189645 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!189647 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!189647 lt!189645) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!121282 (= lt!189645 (bitIndex!0 (size!2436 (buf!2870 (_2!5357 lt!189308))) (currentByte!5555 (_2!5357 lt!189308)) (currentBit!5550 (_2!5357 lt!189308))))))

(assert (=> b!121282 (= lt!189647 (bitIndex!0 (size!2436 (buf!2870 thiss!1305)) (currentByte!5555 thiss!1305) (currentBit!5550 thiss!1305)))))

(assert (= (and d!39104 c!7277) b!121279))

(assert (= (and d!39104 (not c!7277)) b!121281))

(assert (= (and d!39104 res!100454) b!121278))

(assert (= (and b!121278 res!100452) b!121280))

(assert (= (and b!121280 res!100453) b!121282))

(assert (=> b!121279 m!183407))

(declare-fun m!183679 () Bool)

(assert (=> b!121279 m!183679))

(declare-fun m!183681 () Bool)

(assert (=> b!121279 m!183681))

(declare-fun m!183683 () Bool)

(assert (=> b!121278 m!183683))

(declare-fun m!183685 () Bool)

(assert (=> b!121282 m!183685))

(assert (=> b!121282 m!183403))

(assert (=> b!121282 m!183407))

(declare-fun m!183687 () Bool)

(assert (=> b!121280 m!183687))

(declare-fun m!183689 () Bool)

(assert (=> d!39104 m!183689))

(declare-fun m!183691 () Bool)

(assert (=> d!39104 m!183691))

(declare-fun m!183693 () Bool)

(assert (=> d!39104 m!183693))

(declare-fun m!183695 () Bool)

(assert (=> d!39104 m!183695))

(declare-fun m!183697 () Bool)

(assert (=> d!39104 m!183697))

(declare-fun m!183699 () Bool)

(assert (=> d!39104 m!183699))

(declare-fun m!183701 () Bool)

(assert (=> d!39104 m!183701))

(assert (=> d!39104 m!183443))

(declare-fun m!183703 () Bool)

(assert (=> d!39104 m!183703))

(declare-fun m!183705 () Bool)

(assert (=> d!39104 m!183705))

(declare-fun m!183707 () Bool)

(assert (=> d!39104 m!183707))

(assert (=> b!121158 d!39104))

(declare-fun d!39110 () Bool)

(declare-fun lt!189662 () tuple2!10198)

(assert (=> d!39110 (= lt!189662 (readNLeastSignificantBitsLoop!0 (_1!5359 lt!189315) nBits!396 i!615 lt!189296))))

(assert (=> d!39110 (= (readNLeastSignificantBitsLoopPure!0 (_1!5359 lt!189315) nBits!396 i!615 lt!189296) (tuple2!10187 (_2!5364 lt!189662) (_1!5364 lt!189662)))))

(declare-fun bs!9457 () Bool)

(assert (= bs!9457 d!39110))

(declare-fun m!183709 () Bool)

(assert (=> bs!9457 m!183709))

(assert (=> b!121158 d!39110))

(declare-fun d!39112 () Bool)

(declare-fun lt!189663 () tuple2!10200)

(assert (=> d!39112 (= lt!189663 (readBit!0 (BitStream!4347 (buf!2870 (_2!5357 lt!189308)) (currentByte!5555 thiss!1305) (currentBit!5550 thiss!1305))))))

(assert (=> d!39112 (= (readBitPure!0 (BitStream!4347 (buf!2870 (_2!5357 lt!189308)) (currentByte!5555 thiss!1305) (currentBit!5550 thiss!1305))) (tuple2!10191 (_2!5365 lt!189663) (_1!5365 lt!189663)))))

(declare-fun bs!9458 () Bool)

(assert (= bs!9458 d!39112))

(declare-fun m!183711 () Bool)

(assert (=> bs!9458 m!183711))

(assert (=> b!121158 d!39112))

(declare-fun b!121435 () Bool)

(declare-fun e!79533 () Bool)

(declare-fun lt!190113 () (_ BitVec 64))

(assert (=> b!121435 (= e!79533 (validate_offset_bits!1 ((_ sign_extend 32) (size!2436 (buf!2870 (_2!5357 lt!189304)))) ((_ sign_extend 32) (currentByte!5555 (_2!5357 lt!189304))) ((_ sign_extend 32) (currentBit!5550 (_2!5357 lt!189304))) lt!190113))))

(declare-fun b!121436 () Bool)

(declare-fun res!100578 () Bool)

(declare-fun lt!190145 () tuple2!10184)

(assert (=> b!121436 (= res!100578 (isPrefixOf!0 (_2!5357 lt!189304) (_2!5357 lt!190145)))))

(declare-fun e!79529 () Bool)

(assert (=> b!121436 (=> (not res!100578) (not e!79529))))

(declare-fun b!121437 () Bool)

(declare-fun e!79532 () Bool)

(declare-fun lt!190149 () tuple2!10190)

(assert (=> b!121437 (= e!79532 (= (bitIndex!0 (size!2436 (buf!2870 (_1!5360 lt!190149))) (currentByte!5555 (_1!5360 lt!190149)) (currentBit!5550 (_1!5360 lt!190149))) (bitIndex!0 (size!2436 (buf!2870 (_2!5357 lt!190145))) (currentByte!5555 (_2!5357 lt!190145)) (currentBit!5550 (_2!5357 lt!190145)))))))

(declare-fun b!121438 () Bool)

(assert (=> b!121438 (= lt!190149 (readBitPure!0 (readerFrom!0 (_2!5357 lt!190145) (currentBit!5550 (_2!5357 lt!189304)) (currentByte!5555 (_2!5357 lt!189304)))))))

(declare-fun lt!190125 () Bool)

(declare-fun res!100584 () Bool)

(assert (=> b!121438 (= res!100584 (and (= (_2!5360 lt!190149) lt!190125) (= (_1!5360 lt!190149) (_2!5357 lt!190145))))))

(assert (=> b!121438 (=> (not res!100584) (not e!79532))))

(assert (=> b!121438 (= e!79529 e!79532)))

(declare-fun b!121439 () Bool)

(declare-fun res!100582 () Bool)

(declare-fun e!79530 () Bool)

(assert (=> b!121439 (=> (not res!100582) (not e!79530))))

(declare-fun lt!190115 () tuple2!10184)

(assert (=> b!121439 (= res!100582 (isPrefixOf!0 (_2!5357 lt!189304) (_2!5357 lt!190115)))))

(declare-fun lt!190148 () tuple2!10188)

(declare-fun lt!190126 () tuple2!10186)

(declare-fun b!121440 () Bool)

(assert (=> b!121440 (= e!79530 (and (= (_2!5358 lt!190126) v!199) (= (_1!5358 lt!190126) (_2!5359 lt!190148))))))

(declare-fun lt!190147 () (_ BitVec 64))

(assert (=> b!121440 (= lt!190126 (readNLeastSignificantBitsLoopPure!0 (_1!5359 lt!190148) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!190147))))

(declare-fun lt!190119 () Unit!7463)

(declare-fun lt!190139 () Unit!7463)

(assert (=> b!121440 (= lt!190119 lt!190139)))

(assert (=> b!121440 (validate_offset_bits!1 ((_ sign_extend 32) (size!2436 (buf!2870 (_2!5357 lt!190115)))) ((_ sign_extend 32) (currentByte!5555 (_2!5357 lt!189304))) ((_ sign_extend 32) (currentBit!5550 (_2!5357 lt!189304))) lt!190113)))

(assert (=> b!121440 (= lt!190139 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5357 lt!189304) (buf!2870 (_2!5357 lt!190115)) lt!190113))))

(assert (=> b!121440 e!79533))

(declare-fun res!100581 () Bool)

(assert (=> b!121440 (=> (not res!100581) (not e!79533))))

(assert (=> b!121440 (= res!100581 (and (= (size!2436 (buf!2870 (_2!5357 lt!189304))) (size!2436 (buf!2870 (_2!5357 lt!190115)))) (bvsge lt!190113 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!121440 (= lt!190113 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!121440 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!121440 (= lt!190147 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!121440 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!121440 (= lt!190148 (reader!0 (_2!5357 lt!189304) (_2!5357 lt!190115)))))

(declare-fun b!121441 () Bool)

(declare-fun res!100580 () Bool)

(assert (=> b!121441 (=> (not res!100580) (not e!79530))))

(declare-fun lt!190146 () (_ BitVec 64))

(declare-fun lt!190127 () (_ BitVec 64))

(assert (=> b!121441 (= res!100580 (= (bitIndex!0 (size!2436 (buf!2870 (_2!5357 lt!190115))) (currentByte!5555 (_2!5357 lt!190115)) (currentBit!5550 (_2!5357 lt!190115))) (bvadd lt!190146 lt!190127)))))

(assert (=> b!121441 (or (not (= (bvand lt!190146 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!190127 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!190146 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!190146 lt!190127) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!121441 (= lt!190127 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!121441 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!121441 (= lt!190146 (bitIndex!0 (size!2436 (buf!2870 (_2!5357 lt!189304))) (currentByte!5555 (_2!5357 lt!189304)) (currentBit!5550 (_2!5357 lt!189304))))))

(declare-fun b!121442 () Bool)

(declare-fun e!79531 () (_ BitVec 64))

(assert (=> b!121442 (= e!79531 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!121443 () Bool)

(declare-fun e!79528 () Bool)

(declare-fun lt!190136 () tuple2!10190)

(declare-fun lt!190105 () tuple2!10190)

(assert (=> b!121443 (= e!79528 (= (_2!5360 lt!190136) (_2!5360 lt!190105)))))

(declare-fun b!121444 () Bool)

(declare-fun res!100583 () Bool)

(assert (=> b!121444 (= res!100583 (= (bitIndex!0 (size!2436 (buf!2870 (_2!5357 lt!190145))) (currentByte!5555 (_2!5357 lt!190145)) (currentBit!5550 (_2!5357 lt!190145))) (bvadd (bitIndex!0 (size!2436 (buf!2870 (_2!5357 lt!189304))) (currentByte!5555 (_2!5357 lt!189304)) (currentBit!5550 (_2!5357 lt!189304))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!121444 (=> (not res!100583) (not e!79529))))

(declare-fun d!39114 () Bool)

(assert (=> d!39114 e!79530))

(declare-fun res!100586 () Bool)

(assert (=> d!39114 (=> (not res!100586) (not e!79530))))

(assert (=> d!39114 (= res!100586 (= (size!2436 (buf!2870 (_2!5357 lt!189304))) (size!2436 (buf!2870 (_2!5357 lt!190115)))))))

(declare-fun e!79527 () tuple2!10184)

(assert (=> d!39114 (= lt!190115 e!79527)))

(declare-fun c!7292 () Bool)

(assert (=> d!39114 (= c!7292 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!39114 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!39114 (= (appendNLeastSignificantBitsLoop!0 (_2!5357 lt!189304) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!190115)))

(declare-fun b!121445 () Bool)

(declare-fun lt!190129 () tuple2!10184)

(declare-fun Unit!7476 () Unit!7463)

(assert (=> b!121445 (= e!79527 (tuple2!10185 Unit!7476 (_2!5357 lt!190129)))))

(assert (=> b!121445 (= lt!190125 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!121445 (= lt!190145 (appendBit!0 (_2!5357 lt!189304) lt!190125))))

(declare-fun res!100585 () Bool)

(assert (=> b!121445 (= res!100585 (= (size!2436 (buf!2870 (_2!5357 lt!189304))) (size!2436 (buf!2870 (_2!5357 lt!190145)))))))

(assert (=> b!121445 (=> (not res!100585) (not e!79529))))

(assert (=> b!121445 e!79529))

(declare-fun lt!190108 () tuple2!10184)

(assert (=> b!121445 (= lt!190108 lt!190145)))

(assert (=> b!121445 (= lt!190129 (appendNLeastSignificantBitsLoop!0 (_2!5357 lt!190108) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!190141 () Unit!7463)

(assert (=> b!121445 (= lt!190141 (lemmaIsPrefixTransitive!0 (_2!5357 lt!189304) (_2!5357 lt!190108) (_2!5357 lt!190129)))))

(declare-fun call!1586 () Bool)

(assert (=> b!121445 call!1586))

(declare-fun lt!190120 () Unit!7463)

(assert (=> b!121445 (= lt!190120 lt!190141)))

(assert (=> b!121445 (invariant!0 (currentBit!5550 (_2!5357 lt!189304)) (currentByte!5555 (_2!5357 lt!189304)) (size!2436 (buf!2870 (_2!5357 lt!190108))))))

(declare-fun lt!190110 () BitStream!4346)

(assert (=> b!121445 (= lt!190110 (BitStream!4347 (buf!2870 (_2!5357 lt!190108)) (currentByte!5555 (_2!5357 lt!189304)) (currentBit!5550 (_2!5357 lt!189304))))))

(assert (=> b!121445 (invariant!0 (currentBit!5550 lt!190110) (currentByte!5555 lt!190110) (size!2436 (buf!2870 (_2!5357 lt!190129))))))

(declare-fun lt!190121 () BitStream!4346)

(assert (=> b!121445 (= lt!190121 (BitStream!4347 (buf!2870 (_2!5357 lt!190129)) (currentByte!5555 lt!190110) (currentBit!5550 lt!190110)))))

(assert (=> b!121445 (= lt!190136 (readBitPure!0 lt!190110))))

(assert (=> b!121445 (= lt!190105 (readBitPure!0 lt!190121))))

(declare-fun lt!190116 () Unit!7463)

(assert (=> b!121445 (= lt!190116 (readBitPrefixLemma!0 lt!190110 (_2!5357 lt!190129)))))

(declare-fun res!100579 () Bool)

(assert (=> b!121445 (= res!100579 (= (bitIndex!0 (size!2436 (buf!2870 (_1!5360 lt!190136))) (currentByte!5555 (_1!5360 lt!190136)) (currentBit!5550 (_1!5360 lt!190136))) (bitIndex!0 (size!2436 (buf!2870 (_1!5360 lt!190105))) (currentByte!5555 (_1!5360 lt!190105)) (currentBit!5550 (_1!5360 lt!190105)))))))

(assert (=> b!121445 (=> (not res!100579) (not e!79528))))

(assert (=> b!121445 e!79528))

(declare-fun lt!190133 () Unit!7463)

(assert (=> b!121445 (= lt!190133 lt!190116)))

(declare-fun lt!190106 () tuple2!10188)

(assert (=> b!121445 (= lt!190106 (reader!0 (_2!5357 lt!189304) (_2!5357 lt!190129)))))

(declare-fun lt!190144 () tuple2!10188)

(assert (=> b!121445 (= lt!190144 (reader!0 (_2!5357 lt!190108) (_2!5357 lt!190129)))))

(declare-fun lt!190131 () tuple2!10190)

(assert (=> b!121445 (= lt!190131 (readBitPure!0 (_1!5359 lt!190106)))))

(assert (=> b!121445 (= (_2!5360 lt!190131) lt!190125)))

(declare-fun lt!190107 () Unit!7463)

(declare-fun Unit!7477 () Unit!7463)

(assert (=> b!121445 (= lt!190107 Unit!7477)))

(declare-fun lt!190118 () (_ BitVec 64))

(assert (=> b!121445 (= lt!190118 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!190112 () (_ BitVec 64))

(assert (=> b!121445 (= lt!190112 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!190134 () Unit!7463)

(assert (=> b!121445 (= lt!190134 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5357 lt!189304) (buf!2870 (_2!5357 lt!190129)) lt!190112))))

(assert (=> b!121445 (validate_offset_bits!1 ((_ sign_extend 32) (size!2436 (buf!2870 (_2!5357 lt!190129)))) ((_ sign_extend 32) (currentByte!5555 (_2!5357 lt!189304))) ((_ sign_extend 32) (currentBit!5550 (_2!5357 lt!189304))) lt!190112)))

(declare-fun lt!190143 () Unit!7463)

(assert (=> b!121445 (= lt!190143 lt!190134)))

(declare-fun lt!190123 () tuple2!10186)

(assert (=> b!121445 (= lt!190123 (readNLeastSignificantBitsLoopPure!0 (_1!5359 lt!190106) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!190118))))

(declare-fun lt!190122 () (_ BitVec 64))

(assert (=> b!121445 (= lt!190122 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!190111 () Unit!7463)

(assert (=> b!121445 (= lt!190111 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5357 lt!190108) (buf!2870 (_2!5357 lt!190129)) lt!190122))))

(assert (=> b!121445 (validate_offset_bits!1 ((_ sign_extend 32) (size!2436 (buf!2870 (_2!5357 lt!190129)))) ((_ sign_extend 32) (currentByte!5555 (_2!5357 lt!190108))) ((_ sign_extend 32) (currentBit!5550 (_2!5357 lt!190108))) lt!190122)))

(declare-fun lt!190109 () Unit!7463)

(assert (=> b!121445 (= lt!190109 lt!190111)))

(declare-fun lt!190138 () tuple2!10186)

(assert (=> b!121445 (= lt!190138 (readNLeastSignificantBitsLoopPure!0 (_1!5359 lt!190144) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!190118 (ite (_2!5360 lt!190131) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!190124 () tuple2!10186)

(assert (=> b!121445 (= lt!190124 (readNLeastSignificantBitsLoopPure!0 (_1!5359 lt!190106) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!190118))))

(declare-fun c!7293 () Bool)

(assert (=> b!121445 (= c!7293 (_2!5360 (readBitPure!0 (_1!5359 lt!190106))))))

(declare-fun lt!190142 () tuple2!10186)

(assert (=> b!121445 (= lt!190142 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5359 lt!190106) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!190118 e!79531)))))

(declare-fun lt!190114 () Unit!7463)

(assert (=> b!121445 (= lt!190114 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5359 lt!190106) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!190118))))

(assert (=> b!121445 (and (= (_2!5358 lt!190124) (_2!5358 lt!190142)) (= (_1!5358 lt!190124) (_1!5358 lt!190142)))))

(declare-fun lt!190140 () Unit!7463)

(assert (=> b!121445 (= lt!190140 lt!190114)))

(assert (=> b!121445 (= (_1!5359 lt!190106) (withMovedBitIndex!0 (_2!5359 lt!190106) (bvsub (bitIndex!0 (size!2436 (buf!2870 (_2!5357 lt!189304))) (currentByte!5555 (_2!5357 lt!189304)) (currentBit!5550 (_2!5357 lt!189304))) (bitIndex!0 (size!2436 (buf!2870 (_2!5357 lt!190129))) (currentByte!5555 (_2!5357 lt!190129)) (currentBit!5550 (_2!5357 lt!190129))))))))

(declare-fun lt!190132 () Unit!7463)

(declare-fun Unit!7480 () Unit!7463)

(assert (=> b!121445 (= lt!190132 Unit!7480)))

(assert (=> b!121445 (= (_1!5359 lt!190144) (withMovedBitIndex!0 (_2!5359 lt!190144) (bvsub (bitIndex!0 (size!2436 (buf!2870 (_2!5357 lt!190108))) (currentByte!5555 (_2!5357 lt!190108)) (currentBit!5550 (_2!5357 lt!190108))) (bitIndex!0 (size!2436 (buf!2870 (_2!5357 lt!190129))) (currentByte!5555 (_2!5357 lt!190129)) (currentBit!5550 (_2!5357 lt!190129))))))))

(declare-fun lt!190130 () Unit!7463)

(declare-fun Unit!7481 () Unit!7463)

(assert (=> b!121445 (= lt!190130 Unit!7481)))

(assert (=> b!121445 (= (bitIndex!0 (size!2436 (buf!2870 (_2!5357 lt!189304))) (currentByte!5555 (_2!5357 lt!189304)) (currentBit!5550 (_2!5357 lt!189304))) (bvsub (bitIndex!0 (size!2436 (buf!2870 (_2!5357 lt!190108))) (currentByte!5555 (_2!5357 lt!190108)) (currentBit!5550 (_2!5357 lt!190108))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!190137 () Unit!7463)

(declare-fun Unit!7482 () Unit!7463)

(assert (=> b!121445 (= lt!190137 Unit!7482)))

(assert (=> b!121445 (= (_2!5358 lt!190123) (_2!5358 lt!190138))))

(declare-fun lt!190128 () Unit!7463)

(declare-fun Unit!7483 () Unit!7463)

(assert (=> b!121445 (= lt!190128 Unit!7483)))

(assert (=> b!121445 (= (_1!5358 lt!190123) (_2!5359 lt!190106))))

(declare-fun b!121446 () Bool)

(declare-fun lt!190135 () Unit!7463)

(assert (=> b!121446 (= e!79527 (tuple2!10185 lt!190135 (_2!5357 lt!189304)))))

(declare-fun lt!190117 () BitStream!4346)

(assert (=> b!121446 (= lt!190117 (_2!5357 lt!189304))))

(assert (=> b!121446 (= lt!190135 (lemmaIsPrefixRefl!0 lt!190117))))

(assert (=> b!121446 call!1586))

(declare-fun b!121447 () Bool)

(assert (=> b!121447 (= e!79531 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun bm!1583 () Bool)

(assert (=> bm!1583 (= call!1586 (isPrefixOf!0 (ite c!7292 (_2!5357 lt!189304) lt!190117) (ite c!7292 (_2!5357 lt!190129) lt!190117)))))

(assert (= (and d!39114 c!7292) b!121445))

(assert (= (and d!39114 (not c!7292)) b!121446))

(assert (= (and b!121445 res!100585) b!121444))

(assert (= (and b!121444 res!100583) b!121436))

(assert (= (and b!121436 res!100578) b!121438))

(assert (= (and b!121438 res!100584) b!121437))

(assert (= (and b!121445 res!100579) b!121443))

(assert (= (and b!121445 c!7293) b!121442))

(assert (= (and b!121445 (not c!7293)) b!121447))

(assert (= (or b!121445 b!121446) bm!1583))

(assert (= (and d!39114 res!100586) b!121441))

(assert (= (and b!121441 res!100580) b!121439))

(assert (= (and b!121439 res!100582) b!121440))

(assert (= (and b!121440 res!100581) b!121435))

(declare-fun m!183993 () Bool)

(assert (=> bm!1583 m!183993))

(declare-fun m!183995 () Bool)

(assert (=> b!121445 m!183995))

(declare-fun m!183997 () Bool)

(assert (=> b!121445 m!183997))

(declare-fun m!183999 () Bool)

(assert (=> b!121445 m!183999))

(declare-fun m!184001 () Bool)

(assert (=> b!121445 m!184001))

(assert (=> b!121445 m!183997))

(declare-fun m!184003 () Bool)

(assert (=> b!121445 m!184003))

(declare-fun m!184005 () Bool)

(assert (=> b!121445 m!184005))

(declare-fun m!184007 () Bool)

(assert (=> b!121445 m!184007))

(declare-fun m!184009 () Bool)

(assert (=> b!121445 m!184009))

(declare-fun m!184011 () Bool)

(assert (=> b!121445 m!184011))

(assert (=> b!121445 m!183405))

(declare-fun m!184013 () Bool)

(assert (=> b!121445 m!184013))

(declare-fun m!184015 () Bool)

(assert (=> b!121445 m!184015))

(declare-fun m!184017 () Bool)

(assert (=> b!121445 m!184017))

(declare-fun m!184019 () Bool)

(assert (=> b!121445 m!184019))

(declare-fun m!184021 () Bool)

(assert (=> b!121445 m!184021))

(declare-fun m!184023 () Bool)

(assert (=> b!121445 m!184023))

(declare-fun m!184025 () Bool)

(assert (=> b!121445 m!184025))

(declare-fun m!184027 () Bool)

(assert (=> b!121445 m!184027))

(declare-fun m!184029 () Bool)

(assert (=> b!121445 m!184029))

(declare-fun m!184031 () Bool)

(assert (=> b!121445 m!184031))

(declare-fun m!184033 () Bool)

(assert (=> b!121445 m!184033))

(declare-fun m!184035 () Bool)

(assert (=> b!121445 m!184035))

(declare-fun m!184037 () Bool)

(assert (=> b!121445 m!184037))

(declare-fun m!184039 () Bool)

(assert (=> b!121445 m!184039))

(declare-fun m!184041 () Bool)

(assert (=> b!121445 m!184041))

(declare-fun m!184043 () Bool)

(assert (=> b!121445 m!184043))

(declare-fun m!184045 () Bool)

(assert (=> b!121445 m!184045))

(declare-fun m!184047 () Bool)

(assert (=> b!121445 m!184047))

(declare-fun m!184049 () Bool)

(assert (=> b!121438 m!184049))

(assert (=> b!121438 m!184049))

(declare-fun m!184051 () Bool)

(assert (=> b!121438 m!184051))

(declare-fun m!184053 () Bool)

(assert (=> b!121440 m!184053))

(assert (=> b!121440 m!184001))

(declare-fun m!184055 () Bool)

(assert (=> b!121440 m!184055))

(declare-fun m!184057 () Bool)

(assert (=> b!121440 m!184057))

(declare-fun m!184059 () Bool)

(assert (=> b!121440 m!184059))

(declare-fun m!184061 () Bool)

(assert (=> b!121446 m!184061))

(declare-fun m!184063 () Bool)

(assert (=> b!121439 m!184063))

(declare-fun m!184065 () Bool)

(assert (=> b!121441 m!184065))

(assert (=> b!121441 m!183405))

(declare-fun m!184067 () Bool)

(assert (=> b!121444 m!184067))

(assert (=> b!121444 m!183405))

(declare-fun m!184069 () Bool)

(assert (=> b!121436 m!184069))

(declare-fun m!184071 () Bool)

(assert (=> b!121435 m!184071))

(declare-fun m!184073 () Bool)

(assert (=> b!121437 m!184073))

(assert (=> b!121437 m!184067))

(assert (=> b!121158 d!39114))

(declare-fun d!39202 () Bool)

(declare-fun e!79534 () Bool)

(assert (=> d!39202 e!79534))

(declare-fun res!100587 () Bool)

(assert (=> d!39202 (=> (not res!100587) (not e!79534))))

(declare-fun lt!190154 () (_ BitVec 64))

(declare-fun lt!190153 () (_ BitVec 64))

(declare-fun lt!190155 () (_ BitVec 64))

(assert (=> d!39202 (= res!100587 (= lt!190153 (bvsub lt!190155 lt!190154)))))

(assert (=> d!39202 (or (= (bvand lt!190155 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!190154 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!190155 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!190155 lt!190154) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39202 (= lt!190154 (remainingBits!0 ((_ sign_extend 32) (size!2436 (buf!2870 (_1!5360 lt!189306)))) ((_ sign_extend 32) (currentByte!5555 (_1!5360 lt!189306))) ((_ sign_extend 32) (currentBit!5550 (_1!5360 lt!189306)))))))

(declare-fun lt!190150 () (_ BitVec 64))

(declare-fun lt!190152 () (_ BitVec 64))

(assert (=> d!39202 (= lt!190155 (bvmul lt!190150 lt!190152))))

(assert (=> d!39202 (or (= lt!190150 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!190152 (bvsdiv (bvmul lt!190150 lt!190152) lt!190150)))))

(assert (=> d!39202 (= lt!190152 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39202 (= lt!190150 ((_ sign_extend 32) (size!2436 (buf!2870 (_1!5360 lt!189306)))))))

(assert (=> d!39202 (= lt!190153 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5555 (_1!5360 lt!189306))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5550 (_1!5360 lt!189306)))))))

(assert (=> d!39202 (invariant!0 (currentBit!5550 (_1!5360 lt!189306)) (currentByte!5555 (_1!5360 lt!189306)) (size!2436 (buf!2870 (_1!5360 lt!189306))))))

(assert (=> d!39202 (= (bitIndex!0 (size!2436 (buf!2870 (_1!5360 lt!189306))) (currentByte!5555 (_1!5360 lt!189306)) (currentBit!5550 (_1!5360 lt!189306))) lt!190153)))

(declare-fun b!121448 () Bool)

(declare-fun res!100588 () Bool)

(assert (=> b!121448 (=> (not res!100588) (not e!79534))))

(assert (=> b!121448 (= res!100588 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!190153))))

(declare-fun b!121449 () Bool)

(declare-fun lt!190151 () (_ BitVec 64))

(assert (=> b!121449 (= e!79534 (bvsle lt!190153 (bvmul lt!190151 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!121449 (or (= lt!190151 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!190151 #b0000000000000000000000000000000000000000000000000000000000001000) lt!190151)))))

(assert (=> b!121449 (= lt!190151 ((_ sign_extend 32) (size!2436 (buf!2870 (_1!5360 lt!189306)))))))

(assert (= (and d!39202 res!100587) b!121448))

(assert (= (and b!121448 res!100588) b!121449))

(declare-fun m!184075 () Bool)

(assert (=> d!39202 m!184075))

(declare-fun m!184077 () Bool)

(assert (=> d!39202 m!184077))

(assert (=> b!121158 d!39202))

(declare-fun d!39204 () Bool)

(declare-fun e!79535 () Bool)

(assert (=> d!39204 e!79535))

(declare-fun res!100591 () Bool)

(assert (=> d!39204 (=> (not res!100591) (not e!79535))))

(declare-fun lt!190168 () tuple2!10188)

(assert (=> d!39204 (= res!100591 (isPrefixOf!0 (_1!5359 lt!190168) (_2!5359 lt!190168)))))

(declare-fun lt!190172 () BitStream!4346)

(assert (=> d!39204 (= lt!190168 (tuple2!10189 lt!190172 (_2!5357 lt!189308)))))

(declare-fun lt!190164 () Unit!7463)

(declare-fun lt!190171 () Unit!7463)

(assert (=> d!39204 (= lt!190164 lt!190171)))

(assert (=> d!39204 (isPrefixOf!0 lt!190172 (_2!5357 lt!189308))))

(assert (=> d!39204 (= lt!190171 (lemmaIsPrefixTransitive!0 lt!190172 (_2!5357 lt!189308) (_2!5357 lt!189308)))))

(declare-fun lt!190158 () Unit!7463)

(declare-fun lt!190156 () Unit!7463)

(assert (=> d!39204 (= lt!190158 lt!190156)))

(assert (=> d!39204 (isPrefixOf!0 lt!190172 (_2!5357 lt!189308))))

(assert (=> d!39204 (= lt!190156 (lemmaIsPrefixTransitive!0 lt!190172 (_2!5357 lt!189304) (_2!5357 lt!189308)))))

(declare-fun lt!190167 () Unit!7463)

(declare-fun e!79536 () Unit!7463)

(assert (=> d!39204 (= lt!190167 e!79536)))

(declare-fun c!7294 () Bool)

(assert (=> d!39204 (= c!7294 (not (= (size!2436 (buf!2870 (_2!5357 lt!189304))) #b00000000000000000000000000000000)))))

(declare-fun lt!190160 () Unit!7463)

(declare-fun lt!190165 () Unit!7463)

(assert (=> d!39204 (= lt!190160 lt!190165)))

(assert (=> d!39204 (isPrefixOf!0 (_2!5357 lt!189308) (_2!5357 lt!189308))))

(assert (=> d!39204 (= lt!190165 (lemmaIsPrefixRefl!0 (_2!5357 lt!189308)))))

(declare-fun lt!190162 () Unit!7463)

(declare-fun lt!190169 () Unit!7463)

(assert (=> d!39204 (= lt!190162 lt!190169)))

(assert (=> d!39204 (= lt!190169 (lemmaIsPrefixRefl!0 (_2!5357 lt!189308)))))

(declare-fun lt!190174 () Unit!7463)

(declare-fun lt!190166 () Unit!7463)

(assert (=> d!39204 (= lt!190174 lt!190166)))

(assert (=> d!39204 (isPrefixOf!0 lt!190172 lt!190172)))

(assert (=> d!39204 (= lt!190166 (lemmaIsPrefixRefl!0 lt!190172))))

(declare-fun lt!190157 () Unit!7463)

(declare-fun lt!190175 () Unit!7463)

(assert (=> d!39204 (= lt!190157 lt!190175)))

(assert (=> d!39204 (isPrefixOf!0 (_2!5357 lt!189304) (_2!5357 lt!189304))))

(assert (=> d!39204 (= lt!190175 (lemmaIsPrefixRefl!0 (_2!5357 lt!189304)))))

(assert (=> d!39204 (= lt!190172 (BitStream!4347 (buf!2870 (_2!5357 lt!189308)) (currentByte!5555 (_2!5357 lt!189304)) (currentBit!5550 (_2!5357 lt!189304))))))

(assert (=> d!39204 (isPrefixOf!0 (_2!5357 lt!189304) (_2!5357 lt!189308))))

(assert (=> d!39204 (= (reader!0 (_2!5357 lt!189304) (_2!5357 lt!189308)) lt!190168)))

(declare-fun b!121450 () Bool)

(declare-fun res!100589 () Bool)

(assert (=> b!121450 (=> (not res!100589) (not e!79535))))

(assert (=> b!121450 (= res!100589 (isPrefixOf!0 (_1!5359 lt!190168) (_2!5357 lt!189304)))))

(declare-fun b!121451 () Bool)

(declare-fun lt!190173 () Unit!7463)

(assert (=> b!121451 (= e!79536 lt!190173)))

(declare-fun lt!190170 () (_ BitVec 64))

(assert (=> b!121451 (= lt!190170 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!190163 () (_ BitVec 64))

(assert (=> b!121451 (= lt!190163 (bitIndex!0 (size!2436 (buf!2870 (_2!5357 lt!189304))) (currentByte!5555 (_2!5357 lt!189304)) (currentBit!5550 (_2!5357 lt!189304))))))

(assert (=> b!121451 (= lt!190173 (arrayBitRangesEqSymmetric!0 (buf!2870 (_2!5357 lt!189304)) (buf!2870 (_2!5357 lt!189308)) lt!190170 lt!190163))))

(assert (=> b!121451 (arrayBitRangesEq!0 (buf!2870 (_2!5357 lt!189308)) (buf!2870 (_2!5357 lt!189304)) lt!190170 lt!190163)))

(declare-fun b!121452 () Bool)

(declare-fun res!100590 () Bool)

(assert (=> b!121452 (=> (not res!100590) (not e!79535))))

(assert (=> b!121452 (= res!100590 (isPrefixOf!0 (_2!5359 lt!190168) (_2!5357 lt!189308)))))

(declare-fun b!121453 () Bool)

(declare-fun Unit!7488 () Unit!7463)

(assert (=> b!121453 (= e!79536 Unit!7488)))

(declare-fun lt!190159 () (_ BitVec 64))

(declare-fun lt!190161 () (_ BitVec 64))

(declare-fun b!121454 () Bool)

(assert (=> b!121454 (= e!79535 (= (_1!5359 lt!190168) (withMovedBitIndex!0 (_2!5359 lt!190168) (bvsub lt!190161 lt!190159))))))

(assert (=> b!121454 (or (= (bvand lt!190161 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!190159 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!190161 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!190161 lt!190159) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!121454 (= lt!190159 (bitIndex!0 (size!2436 (buf!2870 (_2!5357 lt!189308))) (currentByte!5555 (_2!5357 lt!189308)) (currentBit!5550 (_2!5357 lt!189308))))))

(assert (=> b!121454 (= lt!190161 (bitIndex!0 (size!2436 (buf!2870 (_2!5357 lt!189304))) (currentByte!5555 (_2!5357 lt!189304)) (currentBit!5550 (_2!5357 lt!189304))))))

(assert (= (and d!39204 c!7294) b!121451))

(assert (= (and d!39204 (not c!7294)) b!121453))

(assert (= (and d!39204 res!100591) b!121450))

(assert (= (and b!121450 res!100589) b!121452))

(assert (= (and b!121452 res!100590) b!121454))

(assert (=> b!121451 m!183405))

(declare-fun m!184079 () Bool)

(assert (=> b!121451 m!184079))

(declare-fun m!184081 () Bool)

(assert (=> b!121451 m!184081))

(declare-fun m!184083 () Bool)

(assert (=> b!121450 m!184083))

(declare-fun m!184085 () Bool)

(assert (=> b!121454 m!184085))

(assert (=> b!121454 m!183403))

(assert (=> b!121454 m!183405))

(declare-fun m!184087 () Bool)

(assert (=> b!121452 m!184087))

(assert (=> d!39204 m!183689))

(declare-fun m!184089 () Bool)

(assert (=> d!39204 m!184089))

(assert (=> d!39204 m!183693))

(declare-fun m!184091 () Bool)

(assert (=> d!39204 m!184091))

(declare-fun m!184093 () Bool)

(assert (=> d!39204 m!184093))

(declare-fun m!184095 () Bool)

(assert (=> d!39204 m!184095))

(declare-fun m!184097 () Bool)

(assert (=> d!39204 m!184097))

(declare-fun m!184099 () Bool)

(assert (=> d!39204 m!184099))

(declare-fun m!184101 () Bool)

(assert (=> d!39204 m!184101))

(declare-fun m!184103 () Bool)

(assert (=> d!39204 m!184103))

(declare-fun m!184105 () Bool)

(assert (=> d!39204 m!184105))

(assert (=> b!121158 d!39204))

(declare-fun d!39206 () Bool)

(assert (=> d!39206 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!121158 d!39206))

(declare-fun d!39208 () Bool)

(declare-fun lt!190176 () tuple2!10200)

(assert (=> d!39208 (= lt!190176 (readBit!0 lt!189303))))

(assert (=> d!39208 (= (readBitPure!0 lt!189303) (tuple2!10191 (_2!5365 lt!190176) (_1!5365 lt!190176)))))

(declare-fun bs!9480 () Bool)

(assert (= bs!9480 d!39208))

(declare-fun m!184107 () Bool)

(assert (=> bs!9480 m!184107))

(assert (=> b!121158 d!39208))

(declare-fun d!39210 () Bool)

(assert (=> d!39210 (validate_offset_bits!1 ((_ sign_extend 32) (size!2436 (buf!2870 (_2!5357 lt!189308)))) ((_ sign_extend 32) (currentByte!5555 thiss!1305)) ((_ sign_extend 32) (currentBit!5550 thiss!1305)) lt!189312)))

(declare-fun lt!190177 () Unit!7463)

(assert (=> d!39210 (= lt!190177 (choose!9 thiss!1305 (buf!2870 (_2!5357 lt!189308)) lt!189312 (BitStream!4347 (buf!2870 (_2!5357 lt!189308)) (currentByte!5555 thiss!1305) (currentBit!5550 thiss!1305))))))

(assert (=> d!39210 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2870 (_2!5357 lt!189308)) lt!189312) lt!190177)))

(declare-fun bs!9481 () Bool)

(assert (= bs!9481 d!39210))

(assert (=> bs!9481 m!183433))

(declare-fun m!184109 () Bool)

(assert (=> bs!9481 m!184109))

(assert (=> b!121158 d!39210))

(declare-fun d!39212 () Bool)

(declare-fun lt!190178 () tuple2!10200)

(assert (=> d!39212 (= lt!190178 (readBit!0 (_1!5359 lt!189315)))))

(assert (=> d!39212 (= (readBitPure!0 (_1!5359 lt!189315)) (tuple2!10191 (_2!5365 lt!190178) (_1!5365 lt!190178)))))

(declare-fun bs!9482 () Bool)

(assert (= bs!9482 d!39212))

(declare-fun m!184111 () Bool)

(assert (=> bs!9482 m!184111))

(assert (=> b!121158 d!39212))

(declare-fun d!39214 () Bool)

(declare-fun res!100594 () Bool)

(declare-fun e!79538 () Bool)

(assert (=> d!39214 (=> (not res!100594) (not e!79538))))

(assert (=> d!39214 (= res!100594 (= (size!2436 (buf!2870 thiss!1305)) (size!2436 (buf!2870 (_2!5357 lt!189308)))))))

(assert (=> d!39214 (= (isPrefixOf!0 thiss!1305 (_2!5357 lt!189308)) e!79538)))

(declare-fun b!121455 () Bool)

(declare-fun res!100593 () Bool)

(assert (=> b!121455 (=> (not res!100593) (not e!79538))))

(assert (=> b!121455 (= res!100593 (bvsle (bitIndex!0 (size!2436 (buf!2870 thiss!1305)) (currentByte!5555 thiss!1305) (currentBit!5550 thiss!1305)) (bitIndex!0 (size!2436 (buf!2870 (_2!5357 lt!189308))) (currentByte!5555 (_2!5357 lt!189308)) (currentBit!5550 (_2!5357 lt!189308)))))))

(declare-fun b!121456 () Bool)

(declare-fun e!79537 () Bool)

(assert (=> b!121456 (= e!79538 e!79537)))

(declare-fun res!100592 () Bool)

(assert (=> b!121456 (=> res!100592 e!79537)))

(assert (=> b!121456 (= res!100592 (= (size!2436 (buf!2870 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!121457 () Bool)

(assert (=> b!121457 (= e!79537 (arrayBitRangesEq!0 (buf!2870 thiss!1305) (buf!2870 (_2!5357 lt!189308)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2436 (buf!2870 thiss!1305)) (currentByte!5555 thiss!1305) (currentBit!5550 thiss!1305))))))

(assert (= (and d!39214 res!100594) b!121455))

(assert (= (and b!121455 res!100593) b!121456))

(assert (= (and b!121456 (not res!100592)) b!121457))

(assert (=> b!121455 m!183407))

(assert (=> b!121455 m!183403))

(assert (=> b!121457 m!183407))

(assert (=> b!121457 m!183407))

(declare-fun m!184113 () Bool)

(assert (=> b!121457 m!184113))

(assert (=> b!121158 d!39214))

(declare-fun d!39216 () Bool)

(assert (=> d!39216 (isPrefixOf!0 thiss!1305 (_2!5357 lt!189308))))

(declare-fun lt!190181 () Unit!7463)

(declare-fun choose!30 (BitStream!4346 BitStream!4346 BitStream!4346) Unit!7463)

(assert (=> d!39216 (= lt!190181 (choose!30 thiss!1305 (_2!5357 lt!189304) (_2!5357 lt!189308)))))

(assert (=> d!39216 (isPrefixOf!0 thiss!1305 (_2!5357 lt!189304))))

(assert (=> d!39216 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5357 lt!189304) (_2!5357 lt!189308)) lt!190181)))

(declare-fun bs!9483 () Bool)

(assert (= bs!9483 d!39216))

(assert (=> bs!9483 m!183443))

(declare-fun m!184115 () Bool)

(assert (=> bs!9483 m!184115))

(assert (=> bs!9483 m!183401))

(assert (=> b!121158 d!39216))

(declare-fun d!39218 () Bool)

(declare-fun lt!190184 () tuple2!10198)

(assert (=> d!39218 (= lt!190184 (readNLeastSignificantBitsLoop!0 (_1!5359 lt!189300) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!189307))))

(assert (=> d!39218 (= (readNLeastSignificantBitsLoopPure!0 (_1!5359 lt!189300) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!189307) (tuple2!10187 (_2!5364 lt!190184) (_1!5364 lt!190184)))))

(declare-fun bs!9484 () Bool)

(assert (= bs!9484 d!39218))

(declare-fun m!184117 () Bool)

(assert (=> bs!9484 m!184117))

(assert (=> b!121158 d!39218))

(push 1)

(assert (not d!39210))

(assert (not b!121436))

(assert (not b!121446))

(assert (not d!39038))

(assert (not d!39030))

(assert (not d!39046))

(assert (not d!39218))

(assert (not d!39096))

(assert (not b!121438))

(assert (not d!39098))

(assert (not b!121440))

(assert (not d!39044))

(assert (not b!121180))

(assert (not b!121239))

(assert (not d!39202))

(assert (not b!121282))

(assert (not d!39216))

(assert (not b!121279))

(assert (not d!39048))

(assert (not b!121178))

(assert (not b!121455))

(assert (not d!39060))

(assert (not d!39208))

(assert (not b!121452))

(assert (not d!39016))

(assert (not d!39028))

(assert (not b!121444))

(assert (not d!39100))

(assert (not d!39020))

(assert (not b!121454))

(assert (not b!121441))

(assert (not b!121240))

(assert (not d!39094))

(assert (not b!121241))

(assert (not d!39064))

(assert (not b!121278))

(assert (not b!121439))

(assert (not b!121450))

(assert (not d!39112))

(assert (not d!39024))

(assert (not b!121280))

(assert (not d!39212))

(assert (not d!39204))

(assert (not b!121437))

(assert (not b!121242))

(assert (not b!121213))

(assert (not b!121457))

(assert (not d!39042))

(assert (not b!121451))

(assert (not d!39026))

(assert (not b!121435))

(assert (not d!39104))

(assert (not d!39110))

(assert (not b!121445))

(assert (not d!39102))

(assert (not bm!1583))

(assert (not d!39040))

(check-sat)

(pop 1)

(push 1)

(check-sat)

