; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14594 () Bool)

(assert start!14594)

(declare-fun lt!121161 () (_ BitVec 64))

(declare-fun lt!121160 () (_ BitVec 64))

(declare-fun b!75327 () Bool)

(declare-fun e!49266 () Bool)

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!75327 (= e!49266 (or (not (= lt!121161 (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!121161 (bvand lt!121160 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!121158 () (_ BitVec 64))

(assert (=> b!75327 (= lt!121161 (bvand lt!121158 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!3075 0))(
  ( (array!3076 (arr!2032 (Array (_ BitVec 32) (_ BitVec 8))) (size!1434 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!3075)

(declare-datatypes ((BitStream!2442 0))(
  ( (BitStream!2443 (buf!1815 array!3075) (currentByte!3588 (_ BitVec 32)) (currentBit!3583 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2442)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((tuple2!6494 0))(
  ( (tuple2!6495 (_1!3372 array!3075) (_2!3372 BitStream!2442)) )
))
(declare-fun lt!121157 () tuple2!6494)

(declare-fun checkByteArrayBitContent!0 (BitStream!2442 array!3075 array!3075 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75327 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3372 lt!121157) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!75328 () Bool)

(declare-fun res!62265 () Bool)

(declare-fun e!49269 () Bool)

(assert (=> b!75328 (=> res!62265 e!49269)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!75328 (= res!62265 (not (invariant!0 (currentBit!3583 thiss!1379) (currentByte!3588 thiss!1379) (size!1434 (buf!1815 thiss!1379)))))))

(declare-fun res!62266 () Bool)

(declare-fun e!49271 () Bool)

(assert (=> start!14594 (=> (not res!62266) (not e!49271))))

(assert (=> start!14594 (= res!62266 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1434 srcBuffer!2))))))))

(assert (=> start!14594 e!49271))

(assert (=> start!14594 true))

(declare-fun array_inv!1280 (array!3075) Bool)

(assert (=> start!14594 (array_inv!1280 srcBuffer!2)))

(declare-fun e!49267 () Bool)

(declare-fun inv!12 (BitStream!2442) Bool)

(assert (=> start!14594 (and (inv!12 thiss!1379) e!49267)))

(declare-fun b!75329 () Bool)

(declare-fun e!49272 () Bool)

(assert (=> b!75329 (= e!49272 e!49269)))

(declare-fun res!62264 () Bool)

(assert (=> b!75329 (=> res!62264 e!49269)))

(assert (=> b!75329 (= res!62264 (not (= lt!121158 (bvsub lt!121160 i!635))))))

(assert (=> b!75329 (= lt!121160 (bvadd lt!121158 to!314))))

(declare-fun b!75330 () Bool)

(assert (=> b!75330 (= e!49269 e!49266)))

(declare-fun res!62263 () Bool)

(assert (=> b!75330 (=> res!62263 e!49266)))

(assert (=> b!75330 (= res!62263 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!2442 (_ BitVec 64)) tuple2!6494)

(declare-datatypes ((tuple2!6496 0))(
  ( (tuple2!6497 (_1!3373 BitStream!2442) (_2!3373 BitStream!2442)) )
))
(declare-fun reader!0 (BitStream!2442 BitStream!2442) tuple2!6496)

(assert (=> b!75330 (= lt!121157 (readBits!0 (_1!3373 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!75331 () Bool)

(declare-fun res!62261 () Bool)

(assert (=> b!75331 (=> (not res!62261) (not e!49271))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75331 (= res!62261 (validate_offset_bits!1 ((_ sign_extend 32) (size!1434 (buf!1815 thiss!1379))) ((_ sign_extend 32) (currentByte!3588 thiss!1379)) ((_ sign_extend 32) (currentBit!3583 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!75332 () Bool)

(assert (=> b!75332 (= e!49267 (array_inv!1280 (buf!1815 thiss!1379)))))

(declare-fun b!75333 () Bool)

(assert (=> b!75333 (= e!49271 (not e!49272))))

(declare-fun res!62262 () Bool)

(assert (=> b!75333 (=> res!62262 e!49272)))

(assert (=> b!75333 (= res!62262 (bvslt i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2442 BitStream!2442) Bool)

(assert (=> b!75333 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4962 0))(
  ( (Unit!4963) )
))
(declare-fun lt!121159 () Unit!4962)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2442) Unit!4962)

(assert (=> b!75333 (= lt!121159 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!75333 (= lt!121158 (bitIndex!0 (size!1434 (buf!1815 thiss!1379)) (currentByte!3588 thiss!1379) (currentBit!3583 thiss!1379)))))

(assert (= (and start!14594 res!62266) b!75331))

(assert (= (and b!75331 res!62261) b!75333))

(assert (= (and b!75333 (not res!62262)) b!75329))

(assert (= (and b!75329 (not res!62264)) b!75328))

(assert (= (and b!75328 (not res!62265)) b!75330))

(assert (= (and b!75330 (not res!62263)) b!75327))

(assert (= start!14594 b!75332))

(declare-fun m!120423 () Bool)

(assert (=> b!75328 m!120423))

(declare-fun m!120425 () Bool)

(assert (=> b!75333 m!120425))

(declare-fun m!120427 () Bool)

(assert (=> b!75333 m!120427))

(declare-fun m!120429 () Bool)

(assert (=> b!75333 m!120429))

(declare-fun m!120431 () Bool)

(assert (=> b!75327 m!120431))

(declare-fun m!120433 () Bool)

(assert (=> start!14594 m!120433))

(declare-fun m!120435 () Bool)

(assert (=> start!14594 m!120435))

(declare-fun m!120437 () Bool)

(assert (=> b!75332 m!120437))

(declare-fun m!120439 () Bool)

(assert (=> b!75331 m!120439))

(declare-fun m!120441 () Bool)

(assert (=> b!75330 m!120441))

(declare-fun m!120443 () Bool)

(assert (=> b!75330 m!120443))

(check-sat (not b!75330) (not b!75332) (not b!75328) (not start!14594) (not b!75333) (not b!75331) (not b!75327))
(check-sat)
(get-model)

(declare-fun d!23952 () Bool)

(assert (=> d!23952 (= (invariant!0 (currentBit!3583 thiss!1379) (currentByte!3588 thiss!1379) (size!1434 (buf!1815 thiss!1379))) (and (bvsge (currentBit!3583 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!3583 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!3588 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!3588 thiss!1379) (size!1434 (buf!1815 thiss!1379))) (and (= (currentBit!3583 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!3588 thiss!1379) (size!1434 (buf!1815 thiss!1379)))))))))

(assert (=> b!75328 d!23952))

(declare-fun d!23954 () Bool)

(declare-fun res!62291 () Bool)

(declare-fun e!49298 () Bool)

(assert (=> d!23954 (=> (not res!62291) (not e!49298))))

(assert (=> d!23954 (= res!62291 (= (size!1434 (buf!1815 thiss!1379)) (size!1434 (buf!1815 thiss!1379))))))

(assert (=> d!23954 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!49298)))

(declare-fun b!75361 () Bool)

(declare-fun res!62292 () Bool)

(assert (=> b!75361 (=> (not res!62292) (not e!49298))))

(assert (=> b!75361 (= res!62292 (bvsle (bitIndex!0 (size!1434 (buf!1815 thiss!1379)) (currentByte!3588 thiss!1379) (currentBit!3583 thiss!1379)) (bitIndex!0 (size!1434 (buf!1815 thiss!1379)) (currentByte!3588 thiss!1379) (currentBit!3583 thiss!1379))))))

(declare-fun b!75362 () Bool)

(declare-fun e!49299 () Bool)

(assert (=> b!75362 (= e!49298 e!49299)))

(declare-fun res!62293 () Bool)

(assert (=> b!75362 (=> res!62293 e!49299)))

(assert (=> b!75362 (= res!62293 (= (size!1434 (buf!1815 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!75363 () Bool)

(declare-fun arrayBitRangesEq!0 (array!3075 array!3075 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75363 (= e!49299 (arrayBitRangesEq!0 (buf!1815 thiss!1379) (buf!1815 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1434 (buf!1815 thiss!1379)) (currentByte!3588 thiss!1379) (currentBit!3583 thiss!1379))))))

(assert (= (and d!23954 res!62291) b!75361))

(assert (= (and b!75361 res!62292) b!75362))

(assert (= (and b!75362 (not res!62293)) b!75363))

(assert (=> b!75361 m!120429))

(assert (=> b!75361 m!120429))

(assert (=> b!75363 m!120429))

(assert (=> b!75363 m!120429))

(declare-fun m!120467 () Bool)

(assert (=> b!75363 m!120467))

(assert (=> b!75333 d!23954))

(declare-fun d!23956 () Bool)

(assert (=> d!23956 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!121179 () Unit!4962)

(declare-fun choose!11 (BitStream!2442) Unit!4962)

(assert (=> d!23956 (= lt!121179 (choose!11 thiss!1379))))

(assert (=> d!23956 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!121179)))

(declare-fun bs!5759 () Bool)

(assert (= bs!5759 d!23956))

(assert (=> bs!5759 m!120425))

(declare-fun m!120469 () Bool)

(assert (=> bs!5759 m!120469))

(assert (=> b!75333 d!23956))

(declare-fun d!23958 () Bool)

(declare-fun e!49302 () Bool)

(assert (=> d!23958 e!49302))

(declare-fun res!62298 () Bool)

(assert (=> d!23958 (=> (not res!62298) (not e!49302))))

(declare-fun lt!121194 () (_ BitVec 64))

(declare-fun lt!121192 () (_ BitVec 64))

(declare-fun lt!121193 () (_ BitVec 64))

(assert (=> d!23958 (= res!62298 (= lt!121194 (bvsub lt!121192 lt!121193)))))

(assert (=> d!23958 (or (= (bvand lt!121192 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!121193 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!121192 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!121192 lt!121193) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!23958 (= lt!121193 (remainingBits!0 ((_ sign_extend 32) (size!1434 (buf!1815 thiss!1379))) ((_ sign_extend 32) (currentByte!3588 thiss!1379)) ((_ sign_extend 32) (currentBit!3583 thiss!1379))))))

(declare-fun lt!121197 () (_ BitVec 64))

(declare-fun lt!121195 () (_ BitVec 64))

(assert (=> d!23958 (= lt!121192 (bvmul lt!121197 lt!121195))))

(assert (=> d!23958 (or (= lt!121197 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!121195 (bvsdiv (bvmul lt!121197 lt!121195) lt!121197)))))

(assert (=> d!23958 (= lt!121195 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!23958 (= lt!121197 ((_ sign_extend 32) (size!1434 (buf!1815 thiss!1379))))))

(assert (=> d!23958 (= lt!121194 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3588 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3583 thiss!1379))))))

(assert (=> d!23958 (invariant!0 (currentBit!3583 thiss!1379) (currentByte!3588 thiss!1379) (size!1434 (buf!1815 thiss!1379)))))

(assert (=> d!23958 (= (bitIndex!0 (size!1434 (buf!1815 thiss!1379)) (currentByte!3588 thiss!1379) (currentBit!3583 thiss!1379)) lt!121194)))

(declare-fun b!75368 () Bool)

(declare-fun res!62299 () Bool)

(assert (=> b!75368 (=> (not res!62299) (not e!49302))))

(assert (=> b!75368 (= res!62299 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!121194))))

(declare-fun b!75369 () Bool)

(declare-fun lt!121196 () (_ BitVec 64))

(assert (=> b!75369 (= e!49302 (bvsle lt!121194 (bvmul lt!121196 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!75369 (or (= lt!121196 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!121196 #b0000000000000000000000000000000000000000000000000000000000001000) lt!121196)))))

(assert (=> b!75369 (= lt!121196 ((_ sign_extend 32) (size!1434 (buf!1815 thiss!1379))))))

(assert (= (and d!23958 res!62298) b!75368))

(assert (= (and b!75368 res!62299) b!75369))

(declare-fun m!120471 () Bool)

(assert (=> d!23958 m!120471))

(assert (=> d!23958 m!120423))

(assert (=> b!75333 d!23958))

(declare-fun d!23962 () Bool)

(declare-fun res!62304 () Bool)

(declare-fun e!49307 () Bool)

(assert (=> d!23962 (=> res!62304 e!49307)))

(assert (=> d!23962 (= res!62304 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23962 (= (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3372 lt!121157) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) e!49307)))

(declare-fun b!75374 () Bool)

(declare-fun e!49308 () Bool)

(assert (=> b!75374 (= e!49307 e!49308)))

(declare-fun res!62305 () Bool)

(assert (=> b!75374 (=> (not res!62305) (not e!49308))))

(assert (=> b!75374 (= res!62305 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!2032 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!2032 (_1!3372 lt!121157)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!75375 () Bool)

(assert (=> b!75375 (= e!49308 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3372 lt!121157) (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!23962 (not res!62304)) b!75374))

(assert (= (and b!75374 res!62305) b!75375))

(declare-fun m!120473 () Bool)

(assert (=> b!75374 m!120473))

(declare-fun m!120475 () Bool)

(assert (=> b!75374 m!120475))

(declare-fun m!120477 () Bool)

(assert (=> b!75374 m!120477))

(declare-fun m!120479 () Bool)

(assert (=> b!75374 m!120479))

(declare-fun m!120481 () Bool)

(assert (=> b!75375 m!120481))

(assert (=> b!75327 d!23962))

(declare-fun d!23966 () Bool)

(assert (=> d!23966 (= (array_inv!1280 (buf!1815 thiss!1379)) (bvsge (size!1434 (buf!1815 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!75332 d!23966))

(declare-fun d!23968 () Bool)

(assert (=> d!23968 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1434 (buf!1815 thiss!1379))) ((_ sign_extend 32) (currentByte!3588 thiss!1379)) ((_ sign_extend 32) (currentBit!3583 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1434 (buf!1815 thiss!1379))) ((_ sign_extend 32) (currentByte!3588 thiss!1379)) ((_ sign_extend 32) (currentBit!3583 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5760 () Bool)

(assert (= bs!5760 d!23968))

(assert (=> bs!5760 m!120471))

(assert (=> b!75331 d!23968))

(declare-fun d!23970 () Bool)

(declare-fun e!49327 () Bool)

(assert (=> d!23970 e!49327))

(declare-fun res!62354 () Bool)

(assert (=> d!23970 (=> (not res!62354) (not e!49327))))

(declare-fun lt!121305 () tuple2!6494)

(assert (=> d!23970 (= res!62354 (= (buf!1815 (_2!3372 lt!121305)) (buf!1815 (_1!3373 (reader!0 thiss!1379 thiss!1379)))))))

(declare-datatypes ((tuple3!210 0))(
  ( (tuple3!211 (_1!3377 Unit!4962) (_2!3377 BitStream!2442) (_3!126 array!3075)) )
))
(declare-fun lt!121307 () tuple3!210)

(assert (=> d!23970 (= lt!121305 (tuple2!6495 (_3!126 lt!121307) (_2!3377 lt!121307)))))

(declare-fun readBitsLoop!0 (BitStream!2442 (_ BitVec 64) array!3075 (_ BitVec 64) (_ BitVec 64)) tuple3!210)

(assert (=> d!23970 (= lt!121307 (readBitsLoop!0 (_1!3373 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635) (array!3076 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)))))

(assert (=> d!23970 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bvsle (bvsub to!314 i!635) #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!23970 (= (readBits!0 (_1!3373 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)) lt!121305)))

(declare-fun b!75426 () Bool)

(declare-fun res!62352 () Bool)

(assert (=> b!75426 (=> (not res!62352) (not e!49327))))

(assert (=> b!75426 (= res!62352 (bvsle (currentByte!3588 (_1!3373 (reader!0 thiss!1379 thiss!1379))) (currentByte!3588 (_2!3372 lt!121305))))))

(declare-fun b!75427 () Bool)

(declare-fun res!62355 () Bool)

(assert (=> b!75427 (=> (not res!62355) (not e!49327))))

(declare-fun lt!121309 () (_ BitVec 64))

(assert (=> b!75427 (= res!62355 (= (size!1434 (_1!3372 lt!121305)) ((_ extract 31 0) lt!121309)))))

(assert (=> b!75427 (and (bvslt lt!121309 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!121309 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!121308 () (_ BitVec 64))

(declare-fun lt!121304 () (_ BitVec 64))

(assert (=> b!75427 (= lt!121309 (bvsdiv lt!121308 lt!121304))))

(assert (=> b!75427 (and (not (= lt!121304 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!121308 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!121304 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!75427 (= lt!121304 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!121310 () (_ BitVec 64))

(declare-fun lt!121306 () (_ BitVec 64))

(assert (=> b!75427 (= lt!121308 (bvsub lt!121310 lt!121306))))

(assert (=> b!75427 (or (= (bvand lt!121310 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!121306 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!121310 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!121310 lt!121306) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!75427 (= lt!121306 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!121311 () (_ BitVec 64))

(assert (=> b!75427 (= lt!121310 (bvadd (bvsub to!314 i!635) lt!121311))))

(assert (=> b!75427 (or (not (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!121311 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd (bvsub to!314 i!635) lt!121311) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!75427 (= lt!121311 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!75428 () Bool)

(declare-datatypes ((List!778 0))(
  ( (Nil!775) (Cons!774 (h!893 Bool) (t!1528 List!778)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!2442 array!3075 (_ BitVec 64) (_ BitVec 64)) List!778)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2442 BitStream!2442 (_ BitVec 64)) List!778)

(assert (=> b!75428 (= e!49327 (= (byteArrayBitContentToList!0 (_2!3372 lt!121305) (_1!3372 lt!121305) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bitStreamReadBitsIntoList!0 (_2!3372 lt!121305) (_1!3373 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635))))))

(declare-fun b!75429 () Bool)

(declare-fun res!62353 () Bool)

(assert (=> b!75429 (=> (not res!62353) (not e!49327))))

(declare-fun lt!121312 () (_ BitVec 64))

(assert (=> b!75429 (= res!62353 (= (bvadd lt!121312 (bvsub to!314 i!635)) (bitIndex!0 (size!1434 (buf!1815 (_2!3372 lt!121305))) (currentByte!3588 (_2!3372 lt!121305)) (currentBit!3583 (_2!3372 lt!121305)))))))

(assert (=> b!75429 (or (not (= (bvand lt!121312 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!121312 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!121312 (bvsub to!314 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!75429 (= lt!121312 (bitIndex!0 (size!1434 (buf!1815 (_1!3373 (reader!0 thiss!1379 thiss!1379)))) (currentByte!3588 (_1!3373 (reader!0 thiss!1379 thiss!1379))) (currentBit!3583 (_1!3373 (reader!0 thiss!1379 thiss!1379)))))))

(declare-fun b!75430 () Bool)

(declare-fun res!62356 () Bool)

(assert (=> b!75430 (=> (not res!62356) (not e!49327))))

(assert (=> b!75430 (= res!62356 (invariant!0 (currentBit!3583 (_2!3372 lt!121305)) (currentByte!3588 (_2!3372 lt!121305)) (size!1434 (buf!1815 (_2!3372 lt!121305)))))))

(assert (= (and d!23970 res!62354) b!75429))

(assert (= (and b!75429 res!62353) b!75430))

(assert (= (and b!75430 res!62356) b!75427))

(assert (= (and b!75427 res!62355) b!75426))

(assert (= (and b!75426 res!62352) b!75428))

(declare-fun m!120501 () Bool)

(assert (=> d!23970 m!120501))

(declare-fun m!120503 () Bool)

(assert (=> b!75428 m!120503))

(declare-fun m!120505 () Bool)

(assert (=> b!75428 m!120505))

(declare-fun m!120507 () Bool)

(assert (=> b!75429 m!120507))

(declare-fun m!120509 () Bool)

(assert (=> b!75429 m!120509))

(declare-fun m!120511 () Bool)

(assert (=> b!75430 m!120511))

(assert (=> b!75330 d!23970))

(declare-fun b!75482 () Bool)

(declare-fun res!62403 () Bool)

(declare-fun e!49353 () Bool)

(assert (=> b!75482 (=> (not res!62403) (not e!49353))))

(declare-fun lt!121422 () tuple2!6496)

(assert (=> b!75482 (= res!62403 (isPrefixOf!0 (_1!3373 lt!121422) thiss!1379))))

(declare-fun b!75483 () Bool)

(declare-fun e!49352 () Unit!4962)

(declare-fun lt!121426 () Unit!4962)

(assert (=> b!75483 (= e!49352 lt!121426)))

(declare-fun lt!121430 () (_ BitVec 64))

(assert (=> b!75483 (= lt!121430 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121428 () (_ BitVec 64))

(assert (=> b!75483 (= lt!121428 (bitIndex!0 (size!1434 (buf!1815 thiss!1379)) (currentByte!3588 thiss!1379) (currentBit!3583 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!3075 array!3075 (_ BitVec 64) (_ BitVec 64)) Unit!4962)

(assert (=> b!75483 (= lt!121426 (arrayBitRangesEqSymmetric!0 (buf!1815 thiss!1379) (buf!1815 thiss!1379) lt!121430 lt!121428))))

(assert (=> b!75483 (arrayBitRangesEq!0 (buf!1815 thiss!1379) (buf!1815 thiss!1379) lt!121430 lt!121428)))

(declare-fun b!75485 () Bool)

(declare-fun Unit!4967 () Unit!4962)

(assert (=> b!75485 (= e!49352 Unit!4967)))

(declare-fun lt!121433 () (_ BitVec 64))

(declare-fun lt!121423 () (_ BitVec 64))

(declare-fun b!75486 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!2442 (_ BitVec 64)) BitStream!2442)

(assert (=> b!75486 (= e!49353 (= (_1!3373 lt!121422) (withMovedBitIndex!0 (_2!3373 lt!121422) (bvsub lt!121423 lt!121433))))))

(assert (=> b!75486 (or (= (bvand lt!121423 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!121433 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!121423 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!121423 lt!121433) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!75486 (= lt!121433 (bitIndex!0 (size!1434 (buf!1815 thiss!1379)) (currentByte!3588 thiss!1379) (currentBit!3583 thiss!1379)))))

(assert (=> b!75486 (= lt!121423 (bitIndex!0 (size!1434 (buf!1815 thiss!1379)) (currentByte!3588 thiss!1379) (currentBit!3583 thiss!1379)))))

(declare-fun d!23982 () Bool)

(assert (=> d!23982 e!49353))

(declare-fun res!62402 () Bool)

(assert (=> d!23982 (=> (not res!62402) (not e!49353))))

(assert (=> d!23982 (= res!62402 (isPrefixOf!0 (_1!3373 lt!121422) (_2!3373 lt!121422)))))

(declare-fun lt!121436 () BitStream!2442)

(assert (=> d!23982 (= lt!121422 (tuple2!6497 lt!121436 thiss!1379))))

(declare-fun lt!121432 () Unit!4962)

(declare-fun lt!121434 () Unit!4962)

(assert (=> d!23982 (= lt!121432 lt!121434)))

(assert (=> d!23982 (isPrefixOf!0 lt!121436 thiss!1379)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2442 BitStream!2442 BitStream!2442) Unit!4962)

(assert (=> d!23982 (= lt!121434 (lemmaIsPrefixTransitive!0 lt!121436 thiss!1379 thiss!1379))))

(declare-fun lt!121439 () Unit!4962)

(declare-fun lt!121435 () Unit!4962)

(assert (=> d!23982 (= lt!121439 lt!121435)))

(assert (=> d!23982 (isPrefixOf!0 lt!121436 thiss!1379)))

(assert (=> d!23982 (= lt!121435 (lemmaIsPrefixTransitive!0 lt!121436 thiss!1379 thiss!1379))))

(declare-fun lt!121429 () Unit!4962)

(assert (=> d!23982 (= lt!121429 e!49352)))

(declare-fun c!5528 () Bool)

(assert (=> d!23982 (= c!5528 (not (= (size!1434 (buf!1815 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!121437 () Unit!4962)

(declare-fun lt!121421 () Unit!4962)

(assert (=> d!23982 (= lt!121437 lt!121421)))

(assert (=> d!23982 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23982 (= lt!121421 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!121440 () Unit!4962)

(declare-fun lt!121438 () Unit!4962)

(assert (=> d!23982 (= lt!121440 lt!121438)))

(assert (=> d!23982 (= lt!121438 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!121424 () Unit!4962)

(declare-fun lt!121425 () Unit!4962)

(assert (=> d!23982 (= lt!121424 lt!121425)))

(assert (=> d!23982 (isPrefixOf!0 lt!121436 lt!121436)))

(assert (=> d!23982 (= lt!121425 (lemmaIsPrefixRefl!0 lt!121436))))

(declare-fun lt!121427 () Unit!4962)

(declare-fun lt!121431 () Unit!4962)

(assert (=> d!23982 (= lt!121427 lt!121431)))

(assert (=> d!23982 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23982 (= lt!121431 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!23982 (= lt!121436 (BitStream!2443 (buf!1815 thiss!1379) (currentByte!3588 thiss!1379) (currentBit!3583 thiss!1379)))))

(assert (=> d!23982 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23982 (= (reader!0 thiss!1379 thiss!1379) lt!121422)))

(declare-fun b!75484 () Bool)

(declare-fun res!62404 () Bool)

(assert (=> b!75484 (=> (not res!62404) (not e!49353))))

(assert (=> b!75484 (= res!62404 (isPrefixOf!0 (_2!3373 lt!121422) thiss!1379))))

(assert (= (and d!23982 c!5528) b!75483))

(assert (= (and d!23982 (not c!5528)) b!75485))

(assert (= (and d!23982 res!62402) b!75482))

(assert (= (and b!75482 res!62403) b!75484))

(assert (= (and b!75484 res!62404) b!75486))

(declare-fun m!120561 () Bool)

(assert (=> b!75486 m!120561))

(assert (=> b!75486 m!120429))

(assert (=> b!75486 m!120429))

(declare-fun m!120563 () Bool)

(assert (=> b!75484 m!120563))

(declare-fun m!120565 () Bool)

(assert (=> b!75482 m!120565))

(declare-fun m!120567 () Bool)

(assert (=> d!23982 m!120567))

(assert (=> d!23982 m!120425))

(assert (=> d!23982 m!120425))

(declare-fun m!120569 () Bool)

(assert (=> d!23982 m!120569))

(declare-fun m!120571 () Bool)

(assert (=> d!23982 m!120571))

(assert (=> d!23982 m!120569))

(assert (=> d!23982 m!120427))

(declare-fun m!120573 () Bool)

(assert (=> d!23982 m!120573))

(declare-fun m!120575 () Bool)

(assert (=> d!23982 m!120575))

(assert (=> d!23982 m!120425))

(assert (=> d!23982 m!120427))

(assert (=> b!75483 m!120429))

(declare-fun m!120577 () Bool)

(assert (=> b!75483 m!120577))

(declare-fun m!120579 () Bool)

(assert (=> b!75483 m!120579))

(assert (=> b!75330 d!23982))

(declare-fun d!24004 () Bool)

(assert (=> d!24004 (= (array_inv!1280 srcBuffer!2) (bvsge (size!1434 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!14594 d!24004))

(declare-fun d!24006 () Bool)

(assert (=> d!24006 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3583 thiss!1379) (currentByte!3588 thiss!1379) (size!1434 (buf!1815 thiss!1379))))))

(declare-fun bs!5767 () Bool)

(assert (= bs!5767 d!24006))

(assert (=> bs!5767 m!120423))

(assert (=> start!14594 d!24006))

(check-sat (not b!75429) (not b!75361) (not d!23968) (not b!75483) (not b!75375) (not b!75482) (not b!75486) (not d!23982) (not b!75484) (not d!24006) (not d!23958) (not d!23956) (not d!23970) (not b!75363) (not b!75428) (not b!75430))
(check-sat)
