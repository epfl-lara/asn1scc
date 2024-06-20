; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14592 () Bool)

(assert start!14592)

(declare-fun b!75306 () Bool)

(declare-fun res!62243 () Bool)

(declare-fun e!49251 () Bool)

(assert (=> b!75306 (=> res!62243 e!49251)))

(declare-datatypes ((array!3073 0))(
  ( (array!3074 (arr!2031 (Array (_ BitVec 32) (_ BitVec 8))) (size!1433 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2440 0))(
  ( (BitStream!2441 (buf!1814 array!3073) (currentByte!3587 (_ BitVec 32)) (currentBit!3582 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2440)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!75306 (= res!62243 (not (invariant!0 (currentBit!3582 thiss!1379) (currentByte!3587 thiss!1379) (size!1433 (buf!1814 thiss!1379)))))))

(declare-fun res!62246 () Bool)

(declare-fun e!49246 () Bool)

(assert (=> start!14592 (=> (not res!62246) (not e!49246))))

(declare-fun srcBuffer!2 () array!3073)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!14592 (= res!62246 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1433 srcBuffer!2))))))))

(assert (=> start!14592 e!49246))

(assert (=> start!14592 true))

(declare-fun array_inv!1279 (array!3073) Bool)

(assert (=> start!14592 (array_inv!1279 srcBuffer!2)))

(declare-fun e!49248 () Bool)

(declare-fun inv!12 (BitStream!2440) Bool)

(assert (=> start!14592 (and (inv!12 thiss!1379) e!49248)))

(declare-fun b!75307 () Bool)

(assert (=> b!75307 (= e!49248 (array_inv!1279 (buf!1814 thiss!1379)))))

(declare-fun b!75308 () Bool)

(declare-fun res!62248 () Bool)

(assert (=> b!75308 (=> (not res!62248) (not e!49246))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75308 (= res!62248 (validate_offset_bits!1 ((_ sign_extend 32) (size!1433 (buf!1814 thiss!1379))) ((_ sign_extend 32) (currentByte!3587 thiss!1379)) ((_ sign_extend 32) (currentBit!3582 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!75309 () Bool)

(declare-fun e!49250 () Bool)

(assert (=> b!75309 (= e!49251 e!49250)))

(declare-fun res!62247 () Bool)

(assert (=> b!75309 (=> res!62247 e!49250)))

(assert (=> b!75309 (= res!62247 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!6490 0))(
  ( (tuple2!6491 (_1!3370 array!3073) (_2!3370 BitStream!2440)) )
))
(declare-fun lt!121143 () tuple2!6490)

(declare-fun readBits!0 (BitStream!2440 (_ BitVec 64)) tuple2!6490)

(declare-datatypes ((tuple2!6492 0))(
  ( (tuple2!6493 (_1!3371 BitStream!2440) (_2!3371 BitStream!2440)) )
))
(declare-fun reader!0 (BitStream!2440 BitStream!2440) tuple2!6492)

(assert (=> b!75309 (= lt!121143 (readBits!0 (_1!3371 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!75310 () Bool)

(declare-fun e!49247 () Bool)

(assert (=> b!75310 (= e!49246 (not e!49247))))

(declare-fun res!62244 () Bool)

(assert (=> b!75310 (=> res!62244 e!49247)))

(assert (=> b!75310 (= res!62244 (bvslt i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2440 BitStream!2440) Bool)

(assert (=> b!75310 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4960 0))(
  ( (Unit!4961) )
))
(declare-fun lt!121146 () Unit!4960)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2440) Unit!4960)

(assert (=> b!75310 (= lt!121146 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!121145 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!75310 (= lt!121145 (bitIndex!0 (size!1433 (buf!1814 thiss!1379)) (currentByte!3587 thiss!1379) (currentBit!3582 thiss!1379)))))

(declare-fun lt!121144 () (_ BitVec 64))

(declare-fun b!75311 () Bool)

(declare-fun lt!121142 () (_ BitVec 64))

(assert (=> b!75311 (= e!49250 (or (not (= lt!121144 (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!121144 (bvand lt!121142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!75311 (= lt!121144 (bvand lt!121145 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun checkByteArrayBitContent!0 (BitStream!2440 array!3073 array!3073 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75311 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3370 lt!121143) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!75312 () Bool)

(assert (=> b!75312 (= e!49247 e!49251)))

(declare-fun res!62245 () Bool)

(assert (=> b!75312 (=> res!62245 e!49251)))

(assert (=> b!75312 (= res!62245 (not (= lt!121145 (bvsub lt!121142 i!635))))))

(assert (=> b!75312 (= lt!121142 (bvadd lt!121145 to!314))))

(assert (= (and start!14592 res!62246) b!75308))

(assert (= (and b!75308 res!62248) b!75310))

(assert (= (and b!75310 (not res!62244)) b!75312))

(assert (= (and b!75312 (not res!62245)) b!75306))

(assert (= (and b!75306 (not res!62243)) b!75309))

(assert (= (and b!75309 (not res!62247)) b!75311))

(assert (= start!14592 b!75307))

(declare-fun m!120401 () Bool)

(assert (=> b!75308 m!120401))

(declare-fun m!120403 () Bool)

(assert (=> b!75306 m!120403))

(declare-fun m!120405 () Bool)

(assert (=> b!75310 m!120405))

(declare-fun m!120407 () Bool)

(assert (=> b!75310 m!120407))

(declare-fun m!120409 () Bool)

(assert (=> b!75310 m!120409))

(declare-fun m!120411 () Bool)

(assert (=> b!75311 m!120411))

(declare-fun m!120413 () Bool)

(assert (=> start!14592 m!120413))

(declare-fun m!120415 () Bool)

(assert (=> start!14592 m!120415))

(declare-fun m!120417 () Bool)

(assert (=> b!75309 m!120417))

(declare-fun m!120419 () Bool)

(assert (=> b!75309 m!120419))

(declare-fun m!120421 () Bool)

(assert (=> b!75307 m!120421))

(push 1)

(assert (not b!75306))

(assert (not b!75310))

(assert (not b!75307))

(assert (not b!75311))

(assert (not start!14592))

(assert (not b!75309))

(assert (not b!75308))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!75395 () Bool)

(declare-fun res!62325 () Bool)

(declare-fun e!49317 () Bool)

(assert (=> b!75395 (=> (not res!62325) (not e!49317))))

(declare-fun lt!121222 () tuple2!6490)

(assert (=> b!75395 (= res!62325 (invariant!0 (currentBit!3582 (_2!3370 lt!121222)) (currentByte!3587 (_2!3370 lt!121222)) (size!1433 (buf!1814 (_2!3370 lt!121222)))))))

(declare-fun b!75396 () Bool)

(declare-datatypes ((List!777 0))(
  ( (Nil!774) (Cons!773 (h!892 Bool) (t!1527 List!777)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!2440 array!3073 (_ BitVec 64) (_ BitVec 64)) List!777)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2440 BitStream!2440 (_ BitVec 64)) List!777)

(assert (=> b!75396 (= e!49317 (= (byteArrayBitContentToList!0 (_2!3370 lt!121222) (_1!3370 lt!121222) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bitStreamReadBitsIntoList!0 (_2!3370 lt!121222) (_1!3371 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635))))))

(declare-fun b!75397 () Bool)

(declare-fun res!62328 () Bool)

(assert (=> b!75397 (=> (not res!62328) (not e!49317))))

(declare-fun lt!121220 () (_ BitVec 64))

(assert (=> b!75397 (= res!62328 (= (bvadd lt!121220 (bvsub to!314 i!635)) (bitIndex!0 (size!1433 (buf!1814 (_2!3370 lt!121222))) (currentByte!3587 (_2!3370 lt!121222)) (currentBit!3582 (_2!3370 lt!121222)))))))

(assert (=> b!75397 (or (not (= (bvand lt!121220 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!121220 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!121220 (bvsub to!314 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!75397 (= lt!121220 (bitIndex!0 (size!1433 (buf!1814 (_1!3371 (reader!0 thiss!1379 thiss!1379)))) (currentByte!3587 (_1!3371 (reader!0 thiss!1379 thiss!1379))) (currentBit!3582 (_1!3371 (reader!0 thiss!1379 thiss!1379)))))))

(declare-fun b!75398 () Bool)

(declare-fun res!62327 () Bool)

(assert (=> b!75398 (=> (not res!62327) (not e!49317))))

(assert (=> b!75398 (= res!62327 (bvsle (currentByte!3587 (_1!3371 (reader!0 thiss!1379 thiss!1379))) (currentByte!3587 (_2!3370 lt!121222))))))

(declare-fun b!75399 () Bool)

(declare-fun res!62329 () Bool)

(assert (=> b!75399 (=> (not res!62329) (not e!49317))))

(declare-fun lt!121223 () (_ BitVec 64))

(assert (=> b!75399 (= res!62329 (= (size!1433 (_1!3370 lt!121222)) ((_ extract 31 0) lt!121223)))))

(assert (=> b!75399 (and (bvslt lt!121223 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!121223 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!121227 () (_ BitVec 64))

(declare-fun lt!121219 () (_ BitVec 64))

(assert (=> b!75399 (= lt!121223 (bvsdiv lt!121227 lt!121219))))

(assert (=> b!75399 (and (not (= lt!121219 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!121227 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!121219 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!75399 (= lt!121219 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!121221 () (_ BitVec 64))

(declare-fun lt!121225 () (_ BitVec 64))

(assert (=> b!75399 (= lt!121227 (bvsub lt!121221 lt!121225))))

(assert (=> b!75399 (or (= (bvand lt!121221 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!121225 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!121221 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!121221 lt!121225) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!75399 (= lt!121225 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!121224 () (_ BitVec 64))

(assert (=> b!75399 (= lt!121221 (bvadd (bvsub to!314 i!635) lt!121224))))

(assert (=> b!75399 (or (not (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!121224 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd (bvsub to!314 i!635) lt!121224) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!75399 (= lt!121224 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun d!23960 () Bool)

(assert (=> d!23960 e!49317))

(declare-fun res!62326 () Bool)

(assert (=> d!23960 (=> (not res!62326) (not e!49317))))

(assert (=> d!23960 (= res!62326 (= (buf!1814 (_2!3370 lt!121222)) (buf!1814 (_1!3371 (reader!0 thiss!1379 thiss!1379)))))))

(declare-datatypes ((tuple3!208 0))(
  ( (tuple3!209 (_1!3376 Unit!4960) (_2!3376 BitStream!2440) (_3!125 array!3073)) )
))
(declare-fun lt!121226 () tuple3!208)

(assert (=> d!23960 (= lt!121222 (tuple2!6491 (_3!125 lt!121226) (_2!3376 lt!121226)))))

(declare-fun readBitsLoop!0 (BitStream!2440 (_ BitVec 64) array!3073 (_ BitVec 64) (_ BitVec 64)) tuple3!208)

(assert (=> d!23960 (= lt!121226 (readBitsLoop!0 (_1!3371 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635) (array!3074 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)))))

(assert (=> d!23960 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bvsle (bvsub to!314 i!635) #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!23960 (= (readBits!0 (_1!3371 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)) lt!121222)))

(assert (= (and d!23960 res!62326) b!75397))

(assert (= (and b!75397 res!62328) b!75395))

(assert (= (and b!75395 res!62325) b!75399))

(assert (= (and b!75399 res!62329) b!75398))

(assert (= (and b!75398 res!62327) b!75396))

(declare-fun m!120487 () Bool)

(assert (=> b!75395 m!120487))

(declare-fun m!120489 () Bool)

(assert (=> b!75396 m!120489))

(declare-fun m!120491 () Bool)

(assert (=> b!75396 m!120491))

(declare-fun m!120493 () Bool)

(assert (=> b!75397 m!120493))

(declare-fun m!120495 () Bool)

(assert (=> b!75397 m!120495))

(declare-fun m!120497 () Bool)

(assert (=> d!23960 m!120497))

(assert (=> b!75309 d!23960))

(declare-fun b!75431 () Bool)

(declare-fun e!49328 () Unit!4960)

(declare-fun Unit!4966 () Unit!4960)

(assert (=> b!75431 (= e!49328 Unit!4966)))

(declare-fun b!75432 () Bool)

(declare-fun res!62358 () Bool)

(declare-fun e!49329 () Bool)

(assert (=> b!75432 (=> (not res!62358) (not e!49329))))

(declare-fun lt!121324 () tuple2!6492)

(assert (=> b!75432 (= res!62358 (isPrefixOf!0 (_1!3371 lt!121324) thiss!1379))))

(declare-fun d!23976 () Bool)

(assert (=> d!23976 e!49329))

(declare-fun res!62357 () Bool)

(assert (=> d!23976 (=> (not res!62357) (not e!49329))))

(assert (=> d!23976 (= res!62357 (isPrefixOf!0 (_1!3371 lt!121324) (_2!3371 lt!121324)))))

(declare-fun lt!121323 () BitStream!2440)

(assert (=> d!23976 (= lt!121324 (tuple2!6493 lt!121323 thiss!1379))))

(declare-fun lt!121320 () Unit!4960)

(declare-fun lt!121317 () Unit!4960)

(assert (=> d!23976 (= lt!121320 lt!121317)))

(assert (=> d!23976 (isPrefixOf!0 lt!121323 thiss!1379)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2440 BitStream!2440 BitStream!2440) Unit!4960)

(assert (=> d!23976 (= lt!121317 (lemmaIsPrefixTransitive!0 lt!121323 thiss!1379 thiss!1379))))

(declare-fun lt!121314 () Unit!4960)

(declare-fun lt!121313 () Unit!4960)

(assert (=> d!23976 (= lt!121314 lt!121313)))

(assert (=> d!23976 (isPrefixOf!0 lt!121323 thiss!1379)))

(assert (=> d!23976 (= lt!121313 (lemmaIsPrefixTransitive!0 lt!121323 thiss!1379 thiss!1379))))

(declare-fun lt!121326 () Unit!4960)

(assert (=> d!23976 (= lt!121326 e!49328)))

(declare-fun c!5525 () Bool)

(assert (=> d!23976 (= c!5525 (not (= (size!1433 (buf!1814 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!121332 () Unit!4960)

(declare-fun lt!121331 () Unit!4960)

(assert (=> d!23976 (= lt!121332 lt!121331)))

(assert (=> d!23976 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23976 (= lt!121331 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!121325 () Unit!4960)

(declare-fun lt!121321 () Unit!4960)

(assert (=> d!23976 (= lt!121325 lt!121321)))

(assert (=> d!23976 (= lt!121321 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!121329 () Unit!4960)

(declare-fun lt!121328 () Unit!4960)

(assert (=> d!23976 (= lt!121329 lt!121328)))

(assert (=> d!23976 (isPrefixOf!0 lt!121323 lt!121323)))

(assert (=> d!23976 (= lt!121328 (lemmaIsPrefixRefl!0 lt!121323))))

(declare-fun lt!121318 () Unit!4960)

(declare-fun lt!121319 () Unit!4960)

(assert (=> d!23976 (= lt!121318 lt!121319)))

(assert (=> d!23976 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23976 (= lt!121319 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!23976 (= lt!121323 (BitStream!2441 (buf!1814 thiss!1379) (currentByte!3587 thiss!1379) (currentBit!3582 thiss!1379)))))

(assert (=> d!23976 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23976 (= (reader!0 thiss!1379 thiss!1379) lt!121324)))

(declare-fun lt!121330 () (_ BitVec 64))

(declare-fun b!75433 () Bool)

(declare-fun lt!121327 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2440 (_ BitVec 64)) BitStream!2440)

(assert (=> b!75433 (= e!49329 (= (_1!3371 lt!121324) (withMovedBitIndex!0 (_2!3371 lt!121324) (bvsub lt!121330 lt!121327))))))

(assert (=> b!75433 (or (= (bvand lt!121330 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!121327 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!121330 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!121330 lt!121327) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!75433 (= lt!121327 (bitIndex!0 (size!1433 (buf!1814 thiss!1379)) (currentByte!3587 thiss!1379) (currentBit!3582 thiss!1379)))))

(assert (=> b!75433 (= lt!121330 (bitIndex!0 (size!1433 (buf!1814 thiss!1379)) (currentByte!3587 thiss!1379) (currentBit!3582 thiss!1379)))))

(declare-fun b!75434 () Bool)

(declare-fun res!62359 () Bool)

(assert (=> b!75434 (=> (not res!62359) (not e!49329))))

(assert (=> b!75434 (= res!62359 (isPrefixOf!0 (_2!3371 lt!121324) thiss!1379))))

(declare-fun b!75435 () Bool)

(declare-fun lt!121322 () Unit!4960)

(assert (=> b!75435 (= e!49328 lt!121322)))

(declare-fun lt!121315 () (_ BitVec 64))

(assert (=> b!75435 (= lt!121315 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121316 () (_ BitVec 64))

(assert (=> b!75435 (= lt!121316 (bitIndex!0 (size!1433 (buf!1814 thiss!1379)) (currentByte!3587 thiss!1379) (currentBit!3582 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!3073 array!3073 (_ BitVec 64) (_ BitVec 64)) Unit!4960)

(assert (=> b!75435 (= lt!121322 (arrayBitRangesEqSymmetric!0 (buf!1814 thiss!1379) (buf!1814 thiss!1379) lt!121315 lt!121316))))

(declare-fun arrayBitRangesEq!0 (array!3073 array!3073 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75435 (arrayBitRangesEq!0 (buf!1814 thiss!1379) (buf!1814 thiss!1379) lt!121315 lt!121316)))

(assert (= (and d!23976 c!5525) b!75435))

(assert (= (and d!23976 (not c!5525)) b!75431))

(assert (= (and d!23976 res!62357) b!75432))

(assert (= (and b!75432 res!62358) b!75434))

(assert (= (and b!75434 res!62359) b!75433))

(declare-fun m!120513 () Bool)

(assert (=> b!75434 m!120513))

(declare-fun m!120515 () Bool)

(assert (=> b!75432 m!120515))

(declare-fun m!120517 () Bool)

(assert (=> d!23976 m!120517))

(assert (=> d!23976 m!120405))

(assert (=> d!23976 m!120407))

(declare-fun m!120519 () Bool)

(assert (=> d!23976 m!120519))

(assert (=> d!23976 m!120407))

(declare-fun m!120521 () Bool)

(assert (=> d!23976 m!120521))

(declare-fun m!120523 () Bool)

(assert (=> d!23976 m!120523))

(assert (=> d!23976 m!120521))

(assert (=> d!23976 m!120405))

(assert (=> d!23976 m!120405))

(declare-fun m!120525 () Bool)

(assert (=> d!23976 m!120525))

(declare-fun m!120527 () Bool)

(assert (=> b!75433 m!120527))

(assert (=> b!75433 m!120409))

(assert (=> b!75433 m!120409))

(assert (=> b!75435 m!120409))

(declare-fun m!120529 () Bool)

(assert (=> b!75435 m!120529))

(declare-fun m!120531 () Bool)

(assert (=> b!75435 m!120531))

(assert (=> b!75309 d!23976))

(declare-fun d!23984 () Bool)

(declare-fun res!62366 () Bool)

(declare-fun e!49334 () Bool)

(assert (=> d!23984 (=> (not res!62366) (not e!49334))))

(assert (=> d!23984 (= res!62366 (= (size!1433 (buf!1814 thiss!1379)) (size!1433 (buf!1814 thiss!1379))))))

(assert (=> d!23984 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!49334)))

(declare-fun b!75442 () Bool)

(declare-fun res!62368 () Bool)

(assert (=> b!75442 (=> (not res!62368) (not e!49334))))

(assert (=> b!75442 (= res!62368 (bvsle (bitIndex!0 (size!1433 (buf!1814 thiss!1379)) (currentByte!3587 thiss!1379) (currentBit!3582 thiss!1379)) (bitIndex!0 (size!1433 (buf!1814 thiss!1379)) (currentByte!3587 thiss!1379) (currentBit!3582 thiss!1379))))))

(declare-fun b!75443 () Bool)

(declare-fun e!49335 () Bool)

(assert (=> b!75443 (= e!49334 e!49335)))

(declare-fun res!62367 () Bool)

(assert (=> b!75443 (=> res!62367 e!49335)))

(assert (=> b!75443 (= res!62367 (= (size!1433 (buf!1814 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!75444 () Bool)

(assert (=> b!75444 (= e!49335 (arrayBitRangesEq!0 (buf!1814 thiss!1379) (buf!1814 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1433 (buf!1814 thiss!1379)) (currentByte!3587 thiss!1379) (currentBit!3582 thiss!1379))))))

(assert (= (and d!23984 res!62366) b!75442))

(assert (= (and b!75442 res!62368) b!75443))

(assert (= (and b!75443 (not res!62367)) b!75444))

(assert (=> b!75442 m!120409))

(assert (=> b!75442 m!120409))

(assert (=> b!75444 m!120409))

(assert (=> b!75444 m!120409))

(declare-fun m!120533 () Bool)

(assert (=> b!75444 m!120533))

(assert (=> b!75310 d!23984))

(declare-fun d!23986 () Bool)

(assert (=> d!23986 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!121335 () Unit!4960)

(declare-fun choose!11 (BitStream!2440) Unit!4960)

(assert (=> d!23986 (= lt!121335 (choose!11 thiss!1379))))

(assert (=> d!23986 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!121335)))

(declare-fun bs!5764 () Bool)

(assert (= bs!5764 d!23986))

(assert (=> bs!5764 m!120405))

(declare-fun m!120535 () Bool)

(assert (=> bs!5764 m!120535))

(assert (=> b!75310 d!23986))

(declare-fun d!23988 () Bool)

(declare-fun e!49341 () Bool)

(assert (=> d!23988 e!49341))

(declare-fun res!62389 () Bool)

(assert (=> d!23988 (=> (not res!62389) (not e!49341))))

(declare-fun lt!121379 () (_ BitVec 64))

(declare-fun lt!121377 () (_ BitVec 64))

(declare-fun lt!121380 () (_ BitVec 64))

(assert (=> d!23988 (= res!62389 (= lt!121380 (bvsub lt!121379 lt!121377)))))

(assert (=> d!23988 (or (= (bvand lt!121379 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!121377 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!121379 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!121379 lt!121377) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!23988 (= lt!121377 (remainingBits!0 ((_ sign_extend 32) (size!1433 (buf!1814 thiss!1379))) ((_ sign_extend 32) (currentByte!3587 thiss!1379)) ((_ sign_extend 32) (currentBit!3582 thiss!1379))))))

(declare-fun lt!121375 () (_ BitVec 64))

(declare-fun lt!121378 () (_ BitVec 64))

(assert (=> d!23988 (= lt!121379 (bvmul lt!121375 lt!121378))))

(assert (=> d!23988 (or (= lt!121375 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!121378 (bvsdiv (bvmul lt!121375 lt!121378) lt!121375)))))

(assert (=> d!23988 (= lt!121378 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!23988 (= lt!121375 ((_ sign_extend 32) (size!1433 (buf!1814 thiss!1379))))))

(assert (=> d!23988 (= lt!121380 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3587 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3582 thiss!1379))))))

(assert (=> d!23988 (invariant!0 (currentBit!3582 thiss!1379) (currentByte!3587 thiss!1379) (size!1433 (buf!1814 thiss!1379)))))

(assert (=> d!23988 (= (bitIndex!0 (size!1433 (buf!1814 thiss!1379)) (currentByte!3587 thiss!1379) (currentBit!3582 thiss!1379)) lt!121380)))

(declare-fun b!75464 () Bool)

(declare-fun res!62388 () Bool)

(assert (=> b!75464 (=> (not res!62388) (not e!49341))))

(assert (=> b!75464 (= res!62388 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!121380))))

(declare-fun b!75465 () Bool)

(declare-fun lt!121376 () (_ BitVec 64))

(assert (=> b!75465 (= e!49341 (bvsle lt!121380 (bvmul lt!121376 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!75465 (or (= lt!121376 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!121376 #b0000000000000000000000000000000000000000000000000000000000001000) lt!121376)))))

(assert (=> b!75465 (= lt!121376 ((_ sign_extend 32) (size!1433 (buf!1814 thiss!1379))))))

(assert (= (and d!23988 res!62389) b!75464))

(assert (= (and b!75464 res!62388) b!75465))

(declare-fun m!120549 () Bool)

(assert (=> d!23988 m!120549))

(assert (=> d!23988 m!120403))

(assert (=> b!75310 d!23988))

(declare-fun d!23992 () Bool)

(declare-fun res!62400 () Bool)

(declare-fun e!49350 () Bool)

(assert (=> d!23992 (=> res!62400 e!49350)))

(assert (=> d!23992 (= res!62400 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23992 (= (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3370 lt!121143) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) e!49350)))

(declare-fun b!75480 () Bool)

(declare-fun e!49351 () Bool)

(assert (=> b!75480 (= e!49350 e!49351)))

(declare-fun res!62401 () Bool)

(assert (=> b!75480 (=> (not res!62401) (not e!49351))))

(assert (=> b!75480 (= res!62401 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!2031 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!2031 (_1!3370 lt!121143)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!75481 () Bool)

(assert (=> b!75481 (= e!49351 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3370 lt!121143) (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!23992 (not res!62400)) b!75480))

(assert (= (and b!75480 res!62401) b!75481))

(declare-fun m!120551 () Bool)

(assert (=> b!75480 m!120551))

(declare-fun m!120553 () Bool)

(assert (=> b!75480 m!120553))

(declare-fun m!120555 () Bool)

(assert (=> b!75480 m!120555))

(declare-fun m!120557 () Bool)

(assert (=> b!75480 m!120557))

(declare-fun m!120559 () Bool)

(assert (=> b!75481 m!120559))

(assert (=> b!75311 d!23992))

(declare-fun d!23994 () Bool)

(assert (=> d!23994 (= (invariant!0 (currentBit!3582 thiss!1379) (currentByte!3587 thiss!1379) (size!1433 (buf!1814 thiss!1379))) (and (bvsge (currentBit!3582 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!3582 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!3587 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!3587 thiss!1379) (size!1433 (buf!1814 thiss!1379))) (and (= (currentBit!3582 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!3587 thiss!1379) (size!1433 (buf!1814 thiss!1379)))))))))

(assert (=> b!75306 d!23994))

(declare-fun d!23996 () Bool)

(assert (=> d!23996 (= (array_inv!1279 srcBuffer!2) (bvsge (size!1433 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!14592 d!23996))

(declare-fun d!23998 () Bool)

(assert (=> d!23998 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3582 thiss!1379) (currentByte!3587 thiss!1379) (size!1433 (buf!1814 thiss!1379))))))

(declare-fun bs!5765 () Bool)

(assert (= bs!5765 d!23998))

(assert (=> bs!5765 m!120403))

(assert (=> start!14592 d!23998))

(declare-fun d!24000 () Bool)

(assert (=> d!24000 (= (array_inv!1279 (buf!1814 thiss!1379)) (bvsge (size!1433 (buf!1814 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!75307 d!24000))

(declare-fun d!24002 () Bool)

(assert (=> d!24002 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1433 (buf!1814 thiss!1379))) ((_ sign_extend 32) (currentByte!3587 thiss!1379)) ((_ sign_extend 32) (currentBit!3582 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1433 (buf!1814 thiss!1379))) ((_ sign_extend 32) (currentByte!3587 thiss!1379)) ((_ sign_extend 32) (currentBit!3582 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5766 () Bool)

(assert (= bs!5766 d!24002))

(assert (=> bs!5766 m!120549))

(assert (=> b!75308 d!24002))

(push 1)

(assert (not b!75396))

(assert (not b!75435))

(assert (not d!23998))

(assert (not d!23960))

(assert (not b!75442))

(assert (not b!75395))

(assert (not d!23988))

(assert (not b!75397))

(assert (not d!23986))

(assert (not d!23976))

(assert (not b!75481))

(assert (not b!75433))

(assert (not b!75434))

(assert (not b!75444))

(assert (not b!75432))

(assert (not d!24002))

(check-sat)

(pop 1)

(push 1)

(check-sat)

