; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14596 () Bool)

(assert start!14596)

(declare-fun b!75348 () Bool)

(declare-fun res!62281 () Bool)

(declare-fun e!49292 () Bool)

(assert (=> b!75348 (=> (not res!62281) (not e!49292))))

(declare-datatypes ((array!3077 0))(
  ( (array!3078 (arr!2033 (Array (_ BitVec 32) (_ BitVec 8))) (size!1435 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2444 0))(
  ( (BitStream!2445 (buf!1816 array!3077) (currentByte!3589 (_ BitVec 32)) (currentBit!3584 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2444)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75348 (= res!62281 (validate_offset_bits!1 ((_ sign_extend 32) (size!1435 (buf!1816 thiss!1379))) ((_ sign_extend 32) (currentByte!3589 thiss!1379)) ((_ sign_extend 32) (currentBit!3584 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!62284 () Bool)

(assert (=> start!14596 (=> (not res!62284) (not e!49292))))

(declare-fun srcBuffer!2 () array!3077)

(assert (=> start!14596 (= res!62284 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1435 srcBuffer!2))))))))

(assert (=> start!14596 e!49292))

(assert (=> start!14596 true))

(declare-fun array_inv!1281 (array!3077) Bool)

(assert (=> start!14596 (array_inv!1281 srcBuffer!2)))

(declare-fun e!49291 () Bool)

(declare-fun inv!12 (BitStream!2444) Bool)

(assert (=> start!14596 (and (inv!12 thiss!1379) e!49291)))

(declare-fun b!75349 () Bool)

(assert (=> b!75349 (= e!49291 (array_inv!1281 (buf!1816 thiss!1379)))))

(declare-fun b!75350 () Bool)

(declare-fun e!49290 () Bool)

(declare-fun e!49287 () Bool)

(assert (=> b!75350 (= e!49290 e!49287)))

(declare-fun res!62280 () Bool)

(assert (=> b!75350 (=> res!62280 e!49287)))

(assert (=> b!75350 (= res!62280 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!6498 0))(
  ( (tuple2!6499 (_1!3374 array!3077) (_2!3374 BitStream!2444)) )
))
(declare-fun lt!121176 () tuple2!6498)

(declare-fun readBits!0 (BitStream!2444 (_ BitVec 64)) tuple2!6498)

(declare-datatypes ((tuple2!6500 0))(
  ( (tuple2!6501 (_1!3375 BitStream!2444) (_2!3375 BitStream!2444)) )
))
(declare-fun reader!0 (BitStream!2444 BitStream!2444) tuple2!6500)

(assert (=> b!75350 (= lt!121176 (readBits!0 (_1!3375 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!75351 () Bool)

(declare-fun res!62279 () Bool)

(assert (=> b!75351 (=> res!62279 e!49290)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!75351 (= res!62279 (not (invariant!0 (currentBit!3584 thiss!1379) (currentByte!3589 thiss!1379) (size!1435 (buf!1816 thiss!1379)))))))

(declare-fun b!75352 () Bool)

(declare-fun e!49289 () Bool)

(assert (=> b!75352 (= e!49292 (not e!49289))))

(declare-fun res!62282 () Bool)

(assert (=> b!75352 (=> res!62282 e!49289)))

(assert (=> b!75352 (= res!62282 (bvslt i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2444 BitStream!2444) Bool)

(assert (=> b!75352 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4964 0))(
  ( (Unit!4965) )
))
(declare-fun lt!121173 () Unit!4964)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2444) Unit!4964)

(assert (=> b!75352 (= lt!121173 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!121172 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!75352 (= lt!121172 (bitIndex!0 (size!1435 (buf!1816 thiss!1379)) (currentByte!3589 thiss!1379) (currentBit!3584 thiss!1379)))))

(declare-fun b!75353 () Bool)

(assert (=> b!75353 (= e!49289 e!49290)))

(declare-fun res!62283 () Bool)

(assert (=> b!75353 (=> res!62283 e!49290)))

(declare-fun lt!121175 () (_ BitVec 64))

(assert (=> b!75353 (= res!62283 (not (= lt!121172 (bvsub lt!121175 i!635))))))

(assert (=> b!75353 (= lt!121175 (bvadd lt!121172 to!314))))

(declare-fun lt!121174 () (_ BitVec 64))

(declare-fun b!75354 () Bool)

(assert (=> b!75354 (= e!49287 (or (not (= lt!121174 (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!121174 (bvand lt!121175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!75354 (= lt!121174 (bvand lt!121172 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun checkByteArrayBitContent!0 (BitStream!2444 array!3077 array!3077 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75354 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3374 lt!121176) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(assert (= (and start!14596 res!62284) b!75348))

(assert (= (and b!75348 res!62281) b!75352))

(assert (= (and b!75352 (not res!62282)) b!75353))

(assert (= (and b!75353 (not res!62283)) b!75351))

(assert (= (and b!75351 (not res!62279)) b!75350))

(assert (= (and b!75350 (not res!62280)) b!75354))

(assert (= start!14596 b!75349))

(declare-fun m!120445 () Bool)

(assert (=> b!75352 m!120445))

(declare-fun m!120447 () Bool)

(assert (=> b!75352 m!120447))

(declare-fun m!120449 () Bool)

(assert (=> b!75352 m!120449))

(declare-fun m!120451 () Bool)

(assert (=> b!75350 m!120451))

(declare-fun m!120453 () Bool)

(assert (=> b!75350 m!120453))

(declare-fun m!120455 () Bool)

(assert (=> b!75354 m!120455))

(declare-fun m!120457 () Bool)

(assert (=> b!75349 m!120457))

(declare-fun m!120459 () Bool)

(assert (=> start!14596 m!120459))

(declare-fun m!120461 () Bool)

(assert (=> start!14596 m!120461))

(declare-fun m!120463 () Bool)

(assert (=> b!75351 m!120463))

(declare-fun m!120465 () Bool)

(assert (=> b!75348 m!120465))

(push 1)

(assert (not start!14596))

(assert (not b!75348))

(assert (not b!75354))

(assert (not b!75352))

(assert (not b!75350))

(assert (not b!75349))

(assert (not b!75351))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!23964 () Bool)

(declare-fun res!62321 () Bool)

(declare-fun e!49316 () Bool)

(assert (=> d!23964 (=> (not res!62321) (not e!49316))))

(assert (=> d!23964 (= res!62321 (= (size!1435 (buf!1816 thiss!1379)) (size!1435 (buf!1816 thiss!1379))))))

(assert (=> d!23964 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!49316)))

(declare-fun b!75388 () Bool)

(declare-fun res!62322 () Bool)

(assert (=> b!75388 (=> (not res!62322) (not e!49316))))

(assert (=> b!75388 (= res!62322 (bvsle (bitIndex!0 (size!1435 (buf!1816 thiss!1379)) (currentByte!3589 thiss!1379) (currentBit!3584 thiss!1379)) (bitIndex!0 (size!1435 (buf!1816 thiss!1379)) (currentByte!3589 thiss!1379) (currentBit!3584 thiss!1379))))))

(declare-fun b!75389 () Bool)

(declare-fun e!49315 () Bool)

(assert (=> b!75389 (= e!49316 e!49315)))

(declare-fun res!62320 () Bool)

(assert (=> b!75389 (=> res!62320 e!49315)))

(assert (=> b!75389 (= res!62320 (= (size!1435 (buf!1816 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!75390 () Bool)

(declare-fun arrayBitRangesEq!0 (array!3077 array!3077 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75390 (= e!49315 (arrayBitRangesEq!0 (buf!1816 thiss!1379) (buf!1816 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1435 (buf!1816 thiss!1379)) (currentByte!3589 thiss!1379) (currentBit!3584 thiss!1379))))))

(assert (= (and d!23964 res!62321) b!75388))

(assert (= (and b!75388 res!62322) b!75389))

(assert (= (and b!75389 (not res!62320)) b!75390))

(assert (=> b!75388 m!120449))

(assert (=> b!75388 m!120449))

(assert (=> b!75390 m!120449))

(assert (=> b!75390 m!120449))

(declare-fun m!120483 () Bool)

(assert (=> b!75390 m!120483))

(assert (=> b!75352 d!23964))

(declare-fun d!23972 () Bool)

(assert (=> d!23972 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!121218 () Unit!4964)

(declare-fun choose!11 (BitStream!2444) Unit!4964)

(assert (=> d!23972 (= lt!121218 (choose!11 thiss!1379))))

(assert (=> d!23972 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!121218)))

(declare-fun bs!5762 () Bool)

(assert (= bs!5762 d!23972))

(assert (=> bs!5762 m!120445))

(declare-fun m!120485 () Bool)

(assert (=> bs!5762 m!120485))

(assert (=> b!75352 d!23972))

(declare-fun d!23974 () Bool)

(declare-fun e!49320 () Bool)

(assert (=> d!23974 e!49320))

(declare-fun res!62335 () Bool)

(assert (=> d!23974 (=> (not res!62335) (not e!49320))))

(declare-fun lt!121242 () (_ BitVec 64))

(declare-fun lt!121243 () (_ BitVec 64))

(declare-fun lt!121241 () (_ BitVec 64))

(assert (=> d!23974 (= res!62335 (= lt!121243 (bvsub lt!121241 lt!121242)))))

(assert (=> d!23974 (or (= (bvand lt!121241 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!121242 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!121241 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!121241 lt!121242) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!23974 (= lt!121242 (remainingBits!0 ((_ sign_extend 32) (size!1435 (buf!1816 thiss!1379))) ((_ sign_extend 32) (currentByte!3589 thiss!1379)) ((_ sign_extend 32) (currentBit!3584 thiss!1379))))))

(declare-fun lt!121245 () (_ BitVec 64))

(declare-fun lt!121240 () (_ BitVec 64))

(assert (=> d!23974 (= lt!121241 (bvmul lt!121245 lt!121240))))

(assert (=> d!23974 (or (= lt!121245 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!121240 (bvsdiv (bvmul lt!121245 lt!121240) lt!121245)))))

(assert (=> d!23974 (= lt!121240 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!23974 (= lt!121245 ((_ sign_extend 32) (size!1435 (buf!1816 thiss!1379))))))

(assert (=> d!23974 (= lt!121243 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3589 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3584 thiss!1379))))))

(assert (=> d!23974 (invariant!0 (currentBit!3584 thiss!1379) (currentByte!3589 thiss!1379) (size!1435 (buf!1816 thiss!1379)))))

(assert (=> d!23974 (= (bitIndex!0 (size!1435 (buf!1816 thiss!1379)) (currentByte!3589 thiss!1379) (currentBit!3584 thiss!1379)) lt!121243)))

(declare-fun b!75404 () Bool)

(declare-fun res!62334 () Bool)

(assert (=> b!75404 (=> (not res!62334) (not e!49320))))

(assert (=> b!75404 (= res!62334 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!121243))))

(declare-fun b!75405 () Bool)

(declare-fun lt!121244 () (_ BitVec 64))

(assert (=> b!75405 (= e!49320 (bvsle lt!121243 (bvmul lt!121244 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!75405 (or (= lt!121244 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!121244 #b0000000000000000000000000000000000000000000000000000000000001000) lt!121244)))))

(assert (=> b!75405 (= lt!121244 ((_ sign_extend 32) (size!1435 (buf!1816 thiss!1379))))))

(assert (= (and d!23974 res!62335) b!75404))

(assert (= (and b!75404 res!62334) b!75405))

(declare-fun m!120499 () Bool)

(assert (=> d!23974 m!120499))

(assert (=> d!23974 m!120463))

(assert (=> b!75352 d!23974))

(declare-fun d!23978 () Bool)

(assert (=> d!23978 (= (invariant!0 (currentBit!3584 thiss!1379) (currentByte!3589 thiss!1379) (size!1435 (buf!1816 thiss!1379))) (and (bvsge (currentBit!3584 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!3584 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!3589 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!3589 thiss!1379) (size!1435 (buf!1816 thiss!1379))) (and (= (currentBit!3584 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!3589 thiss!1379) (size!1435 (buf!1816 thiss!1379)))))))))

(assert (=> b!75351 d!23978))

(declare-fun b!75455 () Bool)

(declare-fun res!62382 () Bool)

(declare-fun e!49338 () Bool)

(assert (=> b!75455 (=> (not res!62382) (not e!49338))))

(declare-fun lt!121361 () tuple2!6498)

(declare-fun lt!121362 () (_ BitVec 64))

(assert (=> b!75455 (= res!62382 (= (size!1435 (_1!3374 lt!121361)) ((_ extract 31 0) lt!121362)))))

(assert (=> b!75455 (and (bvslt lt!121362 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!121362 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!121356 () (_ BitVec 64))

(declare-fun lt!121354 () (_ BitVec 64))

(assert (=> b!75455 (= lt!121362 (bvsdiv lt!121356 lt!121354))))

(assert (=> b!75455 (and (not (= lt!121354 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!121356 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!121354 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!75455 (= lt!121354 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!121355 () (_ BitVec 64))

(declare-fun lt!121359 () (_ BitVec 64))

(assert (=> b!75455 (= lt!121356 (bvsub lt!121355 lt!121359))))

(assert (=> b!75455 (or (= (bvand lt!121355 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!121359 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!121355 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!121355 lt!121359) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!75455 (= lt!121359 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!121358 () (_ BitVec 64))

(assert (=> b!75455 (= lt!121355 (bvadd (bvsub to!314 i!635) lt!121358))))

(assert (=> b!75455 (or (not (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!121358 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd (bvsub to!314 i!635) lt!121358) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!75455 (= lt!121358 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!75456 () Bool)

(declare-datatypes ((List!779 0))(
  ( (Nil!776) (Cons!775 (h!894 Bool) (t!1529 List!779)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!2444 array!3077 (_ BitVec 64) (_ BitVec 64)) List!779)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2444 BitStream!2444 (_ BitVec 64)) List!779)

(assert (=> b!75456 (= e!49338 (= (byteArrayBitContentToList!0 (_2!3374 lt!121361) (_1!3374 lt!121361) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bitStreamReadBitsIntoList!0 (_2!3374 lt!121361) (_1!3375 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635))))))

(declare-fun b!75457 () Bool)

(declare-fun res!62380 () Bool)

(assert (=> b!75457 (=> (not res!62380) (not e!49338))))

(assert (=> b!75457 (= res!62380 (invariant!0 (currentBit!3584 (_2!3374 lt!121361)) (currentByte!3589 (_2!3374 lt!121361)) (size!1435 (buf!1816 (_2!3374 lt!121361)))))))

(declare-fun d!23980 () Bool)

(assert (=> d!23980 e!49338))

(declare-fun res!62381 () Bool)

(assert (=> d!23980 (=> (not res!62381) (not e!49338))))

(assert (=> d!23980 (= res!62381 (= (buf!1816 (_2!3374 lt!121361)) (buf!1816 (_1!3375 (reader!0 thiss!1379 thiss!1379)))))))

(declare-datatypes ((tuple3!212 0))(
  ( (tuple3!213 (_1!3378 Unit!4964) (_2!3378 BitStream!2444) (_3!127 array!3077)) )
))
(declare-fun lt!121357 () tuple3!212)

(assert (=> d!23980 (= lt!121361 (tuple2!6499 (_3!127 lt!121357) (_2!3378 lt!121357)))))

(declare-fun readBitsLoop!0 (BitStream!2444 (_ BitVec 64) array!3077 (_ BitVec 64) (_ BitVec 64)) tuple3!212)

(assert (=> d!23980 (= lt!121357 (readBitsLoop!0 (_1!3375 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635) (array!3078 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)))))

(assert (=> d!23980 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bvsle (bvsub to!314 i!635) #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!23980 (= (readBits!0 (_1!3375 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)) lt!121361)))

(declare-fun b!75458 () Bool)

(declare-fun res!62379 () Bool)

(assert (=> b!75458 (=> (not res!62379) (not e!49338))))

(assert (=> b!75458 (= res!62379 (bvsle (currentByte!3589 (_1!3375 (reader!0 thiss!1379 thiss!1379))) (currentByte!3589 (_2!3374 lt!121361))))))

(declare-fun b!75459 () Bool)

(declare-fun res!62383 () Bool)

(assert (=> b!75459 (=> (not res!62383) (not e!49338))))

(declare-fun lt!121360 () (_ BitVec 64))

(assert (=> b!75459 (= res!62383 (= (bvadd lt!121360 (bvsub to!314 i!635)) (bitIndex!0 (size!1435 (buf!1816 (_2!3374 lt!121361))) (currentByte!3589 (_2!3374 lt!121361)) (currentBit!3584 (_2!3374 lt!121361)))))))

(assert (=> b!75459 (or (not (= (bvand lt!121360 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!121360 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!121360 (bvsub to!314 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!75459 (= lt!121360 (bitIndex!0 (size!1435 (buf!1816 (_1!3375 (reader!0 thiss!1379 thiss!1379)))) (currentByte!3589 (_1!3375 (reader!0 thiss!1379 thiss!1379))) (currentBit!3584 (_1!3375 (reader!0 thiss!1379 thiss!1379)))))))

(assert (= (and d!23980 res!62381) b!75459))

(assert (= (and b!75459 res!62383) b!75457))

(assert (= (and b!75457 res!62380) b!75455))

(assert (= (and b!75455 res!62382) b!75458))

(assert (= (and b!75458 res!62379) b!75456))

(declare-fun m!120537 () Bool)

(assert (=> b!75456 m!120537))

(declare-fun m!120539 () Bool)

(assert (=> b!75456 m!120539))

(declare-fun m!120541 () Bool)

(assert (=> b!75457 m!120541))

(declare-fun m!120543 () Bool)

(assert (=> d!23980 m!120543))

(declare-fun m!120545 () Bool)

(assert (=> b!75459 m!120545))

(declare-fun m!120547 () Bool)

(assert (=> b!75459 m!120547))

(assert (=> b!75350 d!23980))

(declare-fun d!23990 () Bool)

(declare-fun e!49358 () Bool)

(assert (=> d!23990 e!49358))

(declare-fun res!62412 () Bool)

(assert (=> d!23990 (=> (not res!62412) (not e!49358))))

(declare-fun lt!121500 () tuple2!6500)

(assert (=> d!23990 (= res!62412 (isPrefixOf!0 (_1!3375 lt!121500) (_2!3375 lt!121500)))))

(declare-fun lt!121482 () BitStream!2444)

(assert (=> d!23990 (= lt!121500 (tuple2!6501 lt!121482 thiss!1379))))

(declare-fun lt!121493 () Unit!4964)

(declare-fun lt!121487 () Unit!4964)

(assert (=> d!23990 (= lt!121493 lt!121487)))

(assert (=> d!23990 (isPrefixOf!0 lt!121482 thiss!1379)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2444 BitStream!2444 BitStream!2444) Unit!4964)

(assert (=> d!23990 (= lt!121487 (lemmaIsPrefixTransitive!0 lt!121482 thiss!1379 thiss!1379))))

(declare-fun lt!121496 () Unit!4964)

(declare-fun lt!121490 () Unit!4964)

(assert (=> d!23990 (= lt!121496 lt!121490)))

(assert (=> d!23990 (isPrefixOf!0 lt!121482 thiss!1379)))

(assert (=> d!23990 (= lt!121490 (lemmaIsPrefixTransitive!0 lt!121482 thiss!1379 thiss!1379))))

(declare-fun lt!121488 () Unit!4964)

(declare-fun e!49359 () Unit!4964)

(assert (=> d!23990 (= lt!121488 e!49359)))

(declare-fun c!5531 () Bool)

(assert (=> d!23990 (= c!5531 (not (= (size!1435 (buf!1816 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!121484 () Unit!4964)

(declare-fun lt!121486 () Unit!4964)

(assert (=> d!23990 (= lt!121484 lt!121486)))

(assert (=> d!23990 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23990 (= lt!121486 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!121491 () Unit!4964)

(declare-fun lt!121481 () Unit!4964)

(assert (=> d!23990 (= lt!121491 lt!121481)))

(assert (=> d!23990 (= lt!121481 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!121498 () Unit!4964)

(declare-fun lt!121483 () Unit!4964)

(assert (=> d!23990 (= lt!121498 lt!121483)))

(assert (=> d!23990 (isPrefixOf!0 lt!121482 lt!121482)))

(assert (=> d!23990 (= lt!121483 (lemmaIsPrefixRefl!0 lt!121482))))

(declare-fun lt!121499 () Unit!4964)

(declare-fun lt!121495 () Unit!4964)

(assert (=> d!23990 (= lt!121499 lt!121495)))

(assert (=> d!23990 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23990 (= lt!121495 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!23990 (= lt!121482 (BitStream!2445 (buf!1816 thiss!1379) (currentByte!3589 thiss!1379) (currentBit!3584 thiss!1379)))))

(assert (=> d!23990 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23990 (= (reader!0 thiss!1379 thiss!1379) lt!121500)))

(declare-fun b!75497 () Bool)

(declare-fun res!62411 () Bool)

(assert (=> b!75497 (=> (not res!62411) (not e!49358))))

(assert (=> b!75497 (= res!62411 (isPrefixOf!0 (_1!3375 lt!121500) thiss!1379))))

(declare-fun lt!121489 () (_ BitVec 64))

(declare-fun lt!121485 () (_ BitVec 64))

(declare-fun b!75498 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!2444 (_ BitVec 64)) BitStream!2444)

(assert (=> b!75498 (= e!49358 (= (_1!3375 lt!121500) (withMovedBitIndex!0 (_2!3375 lt!121500) (bvsub lt!121485 lt!121489))))))

(assert (=> b!75498 (or (= (bvand lt!121485 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!121489 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!121485 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!121485 lt!121489) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!75498 (= lt!121489 (bitIndex!0 (size!1435 (buf!1816 thiss!1379)) (currentByte!3589 thiss!1379) (currentBit!3584 thiss!1379)))))

(assert (=> b!75498 (= lt!121485 (bitIndex!0 (size!1435 (buf!1816 thiss!1379)) (currentByte!3589 thiss!1379) (currentBit!3584 thiss!1379)))))

(declare-fun b!75499 () Bool)

(declare-fun lt!121494 () Unit!4964)

(assert (=> b!75499 (= e!49359 lt!121494)))

(declare-fun lt!121492 () (_ BitVec 64))

(assert (=> b!75499 (= lt!121492 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121497 () (_ BitVec 64))

(assert (=> b!75499 (= lt!121497 (bitIndex!0 (size!1435 (buf!1816 thiss!1379)) (currentByte!3589 thiss!1379) (currentBit!3584 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!3077 array!3077 (_ BitVec 64) (_ BitVec 64)) Unit!4964)

(assert (=> b!75499 (= lt!121494 (arrayBitRangesEqSymmetric!0 (buf!1816 thiss!1379) (buf!1816 thiss!1379) lt!121492 lt!121497))))

(assert (=> b!75499 (arrayBitRangesEq!0 (buf!1816 thiss!1379) (buf!1816 thiss!1379) lt!121492 lt!121497)))

(declare-fun b!75500 () Bool)

(declare-fun Unit!4968 () Unit!4964)

(assert (=> b!75500 (= e!49359 Unit!4968)))

(declare-fun b!75501 () Bool)

(declare-fun res!62413 () Bool)

(assert (=> b!75501 (=> (not res!62413) (not e!49358))))

(assert (=> b!75501 (= res!62413 (isPrefixOf!0 (_2!3375 lt!121500) thiss!1379))))

(assert (= (and d!23990 c!5531) b!75499))

(assert (= (and d!23990 (not c!5531)) b!75500))

(assert (= (and d!23990 res!62412) b!75497))

(assert (= (and b!75497 res!62411) b!75501))

(assert (= (and b!75501 res!62413) b!75498))

(assert (=> d!23990 m!120445))

(assert (=> d!23990 m!120445))

(declare-fun m!120581 () Bool)

(assert (=> d!23990 m!120581))

(declare-fun m!120583 () Bool)

(assert (=> d!23990 m!120583))

(assert (=> d!23990 m!120445))

(declare-fun m!120585 () Bool)

(assert (=> d!23990 m!120585))

(declare-fun m!120587 () Bool)

(assert (=> d!23990 m!120587))

(declare-fun m!120589 () Bool)

(assert (=> d!23990 m!120589))

(assert (=> d!23990 m!120587))

(assert (=> d!23990 m!120447))

(assert (=> d!23990 m!120447))

(declare-fun m!120591 () Bool)

(assert (=> b!75498 m!120591))

(assert (=> b!75498 m!120449))

(assert (=> b!75498 m!120449))

(declare-fun m!120593 () Bool)

(assert (=> b!75497 m!120593))

(assert (=> b!75499 m!120449))

(declare-fun m!120595 () Bool)

(assert (=> b!75499 m!120595))

(declare-fun m!120597 () Bool)

(assert (=> b!75499 m!120597))

(declare-fun m!120599 () Bool)

(assert (=> b!75501 m!120599))

(assert (=> b!75350 d!23990))

(declare-fun d!24008 () Bool)

(assert (=> d!24008 (= (array_inv!1281 (buf!1816 thiss!1379)) (bvsge (size!1435 (buf!1816 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!75349 d!24008))

(declare-fun d!24010 () Bool)

(declare-fun res!62418 () Bool)

(declare-fun e!49364 () Bool)

(assert (=> d!24010 (=> res!62418 e!49364)))

(assert (=> d!24010 (= res!62418 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24010 (= (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3374 lt!121176) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) e!49364)))

(declare-fun b!75506 () Bool)

(declare-fun e!49365 () Bool)

(assert (=> b!75506 (= e!49364 e!49365)))

(declare-fun res!62419 () Bool)

(assert (=> b!75506 (=> (not res!62419) (not e!49365))))

(assert (=> b!75506 (= res!62419 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!2033 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!2033 (_1!3374 lt!121176)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!75507 () Bool)

(assert (=> b!75507 (= e!49365 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3374 lt!121176) (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!24010 (not res!62418)) b!75506))

(assert (= (and b!75506 res!62419) b!75507))

(declare-fun m!120601 () Bool)

(assert (=> b!75506 m!120601))

(declare-fun m!120603 () Bool)

(assert (=> b!75506 m!120603))

(declare-fun m!120605 () Bool)

(assert (=> b!75506 m!120605))

(declare-fun m!120607 () Bool)

(assert (=> b!75506 m!120607))

(declare-fun m!120609 () Bool)

(assert (=> b!75507 m!120609))

(assert (=> b!75354 d!24010))

(declare-fun d!24012 () Bool)

(assert (=> d!24012 (= (array_inv!1281 srcBuffer!2) (bvsge (size!1435 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!14596 d!24012))

(declare-fun d!24014 () Bool)

(assert (=> d!24014 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3584 thiss!1379) (currentByte!3589 thiss!1379) (size!1435 (buf!1816 thiss!1379))))))

(declare-fun bs!5768 () Bool)

(assert (= bs!5768 d!24014))

(assert (=> bs!5768 m!120463))

(assert (=> start!14596 d!24014))

(declare-fun d!24016 () Bool)

(assert (=> d!24016 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1435 (buf!1816 thiss!1379))) ((_ sign_extend 32) (currentByte!3589 thiss!1379)) ((_ sign_extend 32) (currentBit!3584 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1435 (buf!1816 thiss!1379))) ((_ sign_extend 32) (currentByte!3589 thiss!1379)) ((_ sign_extend 32) (currentBit!3584 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5769 () Bool)

(assert (= bs!5769 d!24016))

(assert (=> bs!5769 m!120499))

(assert (=> b!75348 d!24016))

(push 1)

(assert (not b!75497))

(assert (not d!23980))

(assert (not d!23972))

(assert (not d!24014))

(assert (not d!24016))

(assert (not b!75499))

(assert (not b!75498))

(assert (not b!75390))

(assert (not d!23990))

(assert (not b!75388))

(assert (not d!23974))

(assert (not b!75459))

(assert (not b!75457))

(assert (not b!75456))

(assert (not b!75507))

(assert (not b!75501))

(check-sat)

(pop 1)

(push 1)

(check-sat)

