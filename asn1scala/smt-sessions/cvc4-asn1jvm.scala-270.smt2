; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5276 () Bool)

(assert start!5276)

(declare-fun b!21287 () Bool)

(declare-fun e!14483 () Bool)

(declare-datatypes ((array!1518 0))(
  ( (array!1519 (arr!1095 (Array (_ BitVec 32) (_ BitVec 8))) (size!648 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1130 0))(
  ( (BitStream!1131 (buf!960 array!1518) (currentByte!2255 (_ BitVec 32)) (currentBit!2250 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1130)

(declare-fun array_inv!618 (array!1518) Bool)

(assert (=> b!21287 (= e!14483 (array_inv!618 (buf!960 thiss!1379)))))

(declare-fun b!21288 () Bool)

(declare-fun e!14480 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!21288 (= e!14480 (invariant!0 (currentBit!2250 thiss!1379) (currentByte!2255 thiss!1379) (size!648 (buf!960 thiss!1379))))))

(declare-fun b!21289 () Bool)

(declare-fun e!14486 () Bool)

(declare-fun e!14481 () Bool)

(assert (=> b!21289 (= e!14486 (not e!14481))))

(declare-fun res!18431 () Bool)

(assert (=> b!21289 (=> res!18431 e!14481)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!21289 (= res!18431 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1130 BitStream!1130) Bool)

(assert (=> b!21289 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!1866 0))(
  ( (Unit!1867) )
))
(declare-fun lt!30491 () Unit!1866)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1130) Unit!1866)

(assert (=> b!21289 (= lt!30491 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!30496 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!21289 (= lt!30496 (bitIndex!0 (size!648 (buf!960 thiss!1379)) (currentByte!2255 thiss!1379) (currentBit!2250 thiss!1379)))))

(declare-fun b!21290 () Bool)

(declare-fun e!14487 () Bool)

(assert (=> b!21290 (= e!14487 e!14480)))

(declare-fun res!18426 () Bool)

(assert (=> b!21290 (=> res!18426 e!14480)))

(declare-datatypes ((tuple2!2516 0))(
  ( (tuple2!2517 (_1!1343 Unit!1866) (_2!1343 BitStream!1130)) )
))
(declare-fun lt!30492 () tuple2!2516)

(declare-fun lt!30493 () tuple2!2516)

(assert (=> b!21290 (= res!18426 (not (isPrefixOf!0 (_2!1343 lt!30492) (_2!1343 lt!30493))))))

(assert (=> b!21290 (isPrefixOf!0 thiss!1379 (_2!1343 lt!30493))))

(declare-fun lt!30494 () Unit!1866)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1130 BitStream!1130 BitStream!1130) Unit!1866)

(assert (=> b!21290 (= lt!30494 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1343 lt!30492) (_2!1343 lt!30493)))))

(declare-fun srcBuffer!2 () array!1518)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1130 array!1518 (_ BitVec 64) (_ BitVec 64)) tuple2!2516)

(assert (=> b!21290 (= lt!30493 (appendBitsMSBFirstLoop!0 (_2!1343 lt!30492) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!14484 () Bool)

(assert (=> b!21290 e!14484))

(declare-fun res!18428 () Bool)

(assert (=> b!21290 (=> (not res!18428) (not e!14484))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!21290 (= res!18428 (validate_offset_bits!1 ((_ sign_extend 32) (size!648 (buf!960 (_2!1343 lt!30492)))) ((_ sign_extend 32) (currentByte!2255 thiss!1379)) ((_ sign_extend 32) (currentBit!2250 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!30489 () Unit!1866)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1130 array!1518 (_ BitVec 64)) Unit!1866)

(assert (=> b!21290 (= lt!30489 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!960 (_2!1343 lt!30492)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!2518 0))(
  ( (tuple2!2519 (_1!1344 BitStream!1130) (_2!1344 BitStream!1130)) )
))
(declare-fun lt!30495 () tuple2!2518)

(declare-fun reader!0 (BitStream!1130 BitStream!1130) tuple2!2518)

(assert (=> b!21290 (= lt!30495 (reader!0 thiss!1379 (_2!1343 lt!30492)))))

(declare-fun b!21291 () Bool)

(declare-fun res!18427 () Bool)

(assert (=> b!21291 (=> (not res!18427) (not e!14486))))

(assert (=> b!21291 (= res!18427 (validate_offset_bits!1 ((_ sign_extend 32) (size!648 (buf!960 thiss!1379))) ((_ sign_extend 32) (currentByte!2255 thiss!1379)) ((_ sign_extend 32) (currentBit!2250 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!18429 () Bool)

(assert (=> start!5276 (=> (not res!18429) (not e!14486))))

(assert (=> start!5276 (= res!18429 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!648 srcBuffer!2))))))))

(assert (=> start!5276 e!14486))

(assert (=> start!5276 true))

(assert (=> start!5276 (array_inv!618 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1130) Bool)

(assert (=> start!5276 (and (inv!12 thiss!1379) e!14483)))

(declare-fun b!21292 () Bool)

(declare-datatypes ((List!266 0))(
  ( (Nil!263) (Cons!262 (h!381 Bool) (t!1016 List!266)) )
))
(declare-fun head!103 (List!266) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1130 array!1518 (_ BitVec 64) (_ BitVec 64)) List!266)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1130 BitStream!1130 (_ BitVec 64)) List!266)

(assert (=> b!21292 (= e!14484 (= (head!103 (byteArrayBitContentToList!0 (_2!1343 lt!30492) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!103 (bitStreamReadBitsIntoList!0 (_2!1343 lt!30492) (_1!1344 lt!30495) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!21293 () Bool)

(assert (=> b!21293 (= e!14481 e!14487)))

(declare-fun res!18430 () Bool)

(assert (=> b!21293 (=> res!18430 e!14487)))

(assert (=> b!21293 (= res!18430 (not (isPrefixOf!0 thiss!1379 (_2!1343 lt!30492))))))

(assert (=> b!21293 (validate_offset_bits!1 ((_ sign_extend 32) (size!648 (buf!960 (_2!1343 lt!30492)))) ((_ sign_extend 32) (currentByte!2255 (_2!1343 lt!30492))) ((_ sign_extend 32) (currentBit!2250 (_2!1343 lt!30492))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!30490 () Unit!1866)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1130 BitStream!1130 (_ BitVec 64) (_ BitVec 64)) Unit!1866)

(assert (=> b!21293 (= lt!30490 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1343 lt!30492) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1130 (_ BitVec 8) (_ BitVec 32)) tuple2!2516)

(assert (=> b!21293 (= lt!30492 (appendBitFromByte!0 thiss!1379 (select (arr!1095 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!5276 res!18429) b!21291))

(assert (= (and b!21291 res!18427) b!21289))

(assert (= (and b!21289 (not res!18431)) b!21293))

(assert (= (and b!21293 (not res!18430)) b!21290))

(assert (= (and b!21290 res!18428) b!21292))

(assert (= (and b!21290 (not res!18426)) b!21288))

(assert (= start!5276 b!21287))

(declare-fun m!29379 () Bool)

(assert (=> b!21291 m!29379))

(declare-fun m!29381 () Bool)

(assert (=> start!5276 m!29381))

(declare-fun m!29383 () Bool)

(assert (=> start!5276 m!29383))

(declare-fun m!29385 () Bool)

(assert (=> b!21293 m!29385))

(declare-fun m!29387 () Bool)

(assert (=> b!21293 m!29387))

(declare-fun m!29389 () Bool)

(assert (=> b!21293 m!29389))

(declare-fun m!29391 () Bool)

(assert (=> b!21293 m!29391))

(assert (=> b!21293 m!29385))

(declare-fun m!29393 () Bool)

(assert (=> b!21293 m!29393))

(declare-fun m!29395 () Bool)

(assert (=> b!21289 m!29395))

(declare-fun m!29397 () Bool)

(assert (=> b!21289 m!29397))

(declare-fun m!29399 () Bool)

(assert (=> b!21289 m!29399))

(declare-fun m!29401 () Bool)

(assert (=> b!21287 m!29401))

(declare-fun m!29403 () Bool)

(assert (=> b!21290 m!29403))

(declare-fun m!29405 () Bool)

(assert (=> b!21290 m!29405))

(declare-fun m!29407 () Bool)

(assert (=> b!21290 m!29407))

(declare-fun m!29409 () Bool)

(assert (=> b!21290 m!29409))

(declare-fun m!29411 () Bool)

(assert (=> b!21290 m!29411))

(declare-fun m!29413 () Bool)

(assert (=> b!21290 m!29413))

(declare-fun m!29415 () Bool)

(assert (=> b!21290 m!29415))

(declare-fun m!29417 () Bool)

(assert (=> b!21292 m!29417))

(assert (=> b!21292 m!29417))

(declare-fun m!29419 () Bool)

(assert (=> b!21292 m!29419))

(declare-fun m!29421 () Bool)

(assert (=> b!21292 m!29421))

(assert (=> b!21292 m!29421))

(declare-fun m!29423 () Bool)

(assert (=> b!21292 m!29423))

(declare-fun m!29425 () Bool)

(assert (=> b!21288 m!29425))

(push 1)

(assert (not b!21291))

(assert (not b!21287))

(assert (not b!21288))

(assert (not b!21293))

(assert (not b!21289))

(assert (not b!21292))

(assert (not start!5276))

(assert (not b!21290))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6808 () Bool)

(declare-fun res!18462 () Bool)

(declare-fun e!14516 () Bool)

(assert (=> d!6808 (=> (not res!18462) (not e!14516))))

(assert (=> d!6808 (= res!18462 (= (size!648 (buf!960 thiss!1379)) (size!648 (buf!960 thiss!1379))))))

(assert (=> d!6808 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!14516)))

(declare-fun b!21342 () Bool)

(declare-fun res!18463 () Bool)

(assert (=> b!21342 (=> (not res!18463) (not e!14516))))

(assert (=> b!21342 (= res!18463 (bvsle (bitIndex!0 (size!648 (buf!960 thiss!1379)) (currentByte!2255 thiss!1379) (currentBit!2250 thiss!1379)) (bitIndex!0 (size!648 (buf!960 thiss!1379)) (currentByte!2255 thiss!1379) (currentBit!2250 thiss!1379))))))

(declare-fun b!21343 () Bool)

(declare-fun e!14517 () Bool)

(assert (=> b!21343 (= e!14516 e!14517)))

(declare-fun res!18464 () Bool)

(assert (=> b!21343 (=> res!18464 e!14517)))

(assert (=> b!21343 (= res!18464 (= (size!648 (buf!960 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!21344 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1518 array!1518 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!21344 (= e!14517 (arrayBitRangesEq!0 (buf!960 thiss!1379) (buf!960 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!648 (buf!960 thiss!1379)) (currentByte!2255 thiss!1379) (currentBit!2250 thiss!1379))))))

(assert (= (and d!6808 res!18462) b!21342))

(assert (= (and b!21342 res!18463) b!21343))

(assert (= (and b!21343 (not res!18464)) b!21344))

(assert (=> b!21342 m!29399))

(assert (=> b!21342 m!29399))

(assert (=> b!21344 m!29399))

(assert (=> b!21344 m!29399))

(declare-fun m!29449 () Bool)

(assert (=> b!21344 m!29449))

(assert (=> b!21289 d!6808))

(declare-fun d!6812 () Bool)

(assert (=> d!6812 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!30532 () Unit!1866)

(declare-fun choose!11 (BitStream!1130) Unit!1866)

(assert (=> d!6812 (= lt!30532 (choose!11 thiss!1379))))

(assert (=> d!6812 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!30532)))

(declare-fun bs!2006 () Bool)

(assert (= bs!2006 d!6812))

(assert (=> bs!2006 m!29395))

(declare-fun m!29451 () Bool)

(assert (=> bs!2006 m!29451))

(assert (=> b!21289 d!6812))

(declare-fun d!6814 () Bool)

(declare-fun e!14523 () Bool)

(assert (=> d!6814 e!14523))

(declare-fun res!18476 () Bool)

(assert (=> d!6814 (=> (not res!18476) (not e!14523))))

(declare-fun lt!30565 () (_ BitVec 64))

(declare-fun lt!30568 () (_ BitVec 64))

(declare-fun lt!30567 () (_ BitVec 64))

(assert (=> d!6814 (= res!18476 (= lt!30567 (bvsub lt!30568 lt!30565)))))

(assert (=> d!6814 (or (= (bvand lt!30568 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!30565 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!30568 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!30568 lt!30565) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!6814 (= lt!30565 (remainingBits!0 ((_ sign_extend 32) (size!648 (buf!960 thiss!1379))) ((_ sign_extend 32) (currentByte!2255 thiss!1379)) ((_ sign_extend 32) (currentBit!2250 thiss!1379))))))

(declare-fun lt!30563 () (_ BitVec 64))

(declare-fun lt!30564 () (_ BitVec 64))

(assert (=> d!6814 (= lt!30568 (bvmul lt!30563 lt!30564))))

(assert (=> d!6814 (or (= lt!30563 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!30564 (bvsdiv (bvmul lt!30563 lt!30564) lt!30563)))))

(assert (=> d!6814 (= lt!30564 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!6814 (= lt!30563 ((_ sign_extend 32) (size!648 (buf!960 thiss!1379))))))

(assert (=> d!6814 (= lt!30567 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2255 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2250 thiss!1379))))))

(assert (=> d!6814 (invariant!0 (currentBit!2250 thiss!1379) (currentByte!2255 thiss!1379) (size!648 (buf!960 thiss!1379)))))

(assert (=> d!6814 (= (bitIndex!0 (size!648 (buf!960 thiss!1379)) (currentByte!2255 thiss!1379) (currentBit!2250 thiss!1379)) lt!30567)))

(declare-fun b!21355 () Bool)

(declare-fun res!18475 () Bool)

(assert (=> b!21355 (=> (not res!18475) (not e!14523))))

(assert (=> b!21355 (= res!18475 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!30567))))

(declare-fun b!21356 () Bool)

(declare-fun lt!30566 () (_ BitVec 64))

(assert (=> b!21356 (= e!14523 (bvsle lt!30567 (bvmul lt!30566 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!21356 (or (= lt!30566 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!30566 #b0000000000000000000000000000000000000000000000000000000000001000) lt!30566)))))

(assert (=> b!21356 (= lt!30566 ((_ sign_extend 32) (size!648 (buf!960 thiss!1379))))))

(assert (= (and d!6814 res!18476) b!21355))

(assert (= (and b!21355 res!18475) b!21356))

(declare-fun m!29455 () Bool)

(assert (=> d!6814 m!29455))

(assert (=> d!6814 m!29425))

(assert (=> b!21289 d!6814))

(declare-fun d!6818 () Bool)

(assert (=> d!6818 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!648 (buf!960 thiss!1379))) ((_ sign_extend 32) (currentByte!2255 thiss!1379)) ((_ sign_extend 32) (currentBit!2250 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!648 (buf!960 thiss!1379))) ((_ sign_extend 32) (currentByte!2255 thiss!1379)) ((_ sign_extend 32) (currentBit!2250 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2007 () Bool)

(assert (= bs!2007 d!6818))

(assert (=> bs!2007 m!29455))

(assert (=> b!21291 d!6818))

(declare-fun d!6822 () Bool)

(assert (=> d!6822 (validate_offset_bits!1 ((_ sign_extend 32) (size!648 (buf!960 (_2!1343 lt!30492)))) ((_ sign_extend 32) (currentByte!2255 thiss!1379)) ((_ sign_extend 32) (currentBit!2250 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!30571 () Unit!1866)

(declare-fun choose!9 (BitStream!1130 array!1518 (_ BitVec 64) BitStream!1130) Unit!1866)

(assert (=> d!6822 (= lt!30571 (choose!9 thiss!1379 (buf!960 (_2!1343 lt!30492)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1131 (buf!960 (_2!1343 lt!30492)) (currentByte!2255 thiss!1379) (currentBit!2250 thiss!1379))))))

(assert (=> d!6822 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!960 (_2!1343 lt!30492)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!30571)))

(declare-fun bs!2010 () Bool)

(assert (= bs!2010 d!6822))

(assert (=> bs!2010 m!29405))

(declare-fun m!29457 () Bool)

(assert (=> bs!2010 m!29457))

(assert (=> b!21290 d!6822))

(declare-fun d!6830 () Bool)

(declare-fun res!18477 () Bool)

(declare-fun e!14524 () Bool)

(assert (=> d!6830 (=> (not res!18477) (not e!14524))))

(assert (=> d!6830 (= res!18477 (= (size!648 (buf!960 thiss!1379)) (size!648 (buf!960 (_2!1343 lt!30493)))))))

(assert (=> d!6830 (= (isPrefixOf!0 thiss!1379 (_2!1343 lt!30493)) e!14524)))

(declare-fun b!21357 () Bool)

(declare-fun res!18478 () Bool)

(assert (=> b!21357 (=> (not res!18478) (not e!14524))))

(assert (=> b!21357 (= res!18478 (bvsle (bitIndex!0 (size!648 (buf!960 thiss!1379)) (currentByte!2255 thiss!1379) (currentBit!2250 thiss!1379)) (bitIndex!0 (size!648 (buf!960 (_2!1343 lt!30493))) (currentByte!2255 (_2!1343 lt!30493)) (currentBit!2250 (_2!1343 lt!30493)))))))

(declare-fun b!21358 () Bool)

(declare-fun e!14525 () Bool)

(assert (=> b!21358 (= e!14524 e!14525)))

(declare-fun res!18479 () Bool)

(assert (=> b!21358 (=> res!18479 e!14525)))

(assert (=> b!21358 (= res!18479 (= (size!648 (buf!960 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!21359 () Bool)

(assert (=> b!21359 (= e!14525 (arrayBitRangesEq!0 (buf!960 thiss!1379) (buf!960 (_2!1343 lt!30493)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!648 (buf!960 thiss!1379)) (currentByte!2255 thiss!1379) (currentBit!2250 thiss!1379))))))

(assert (= (and d!6830 res!18477) b!21357))

(assert (= (and b!21357 res!18478) b!21358))

(assert (= (and b!21358 (not res!18479)) b!21359))

(assert (=> b!21357 m!29399))

(declare-fun m!29459 () Bool)

(assert (=> b!21357 m!29459))

(assert (=> b!21359 m!29399))

(assert (=> b!21359 m!29399))

(declare-fun m!29461 () Bool)

(assert (=> b!21359 m!29461))

(assert (=> b!21290 d!6830))

(declare-fun d!6832 () Bool)

(assert (=> d!6832 (isPrefixOf!0 thiss!1379 (_2!1343 lt!30493))))

(declare-fun lt!30574 () Unit!1866)

(declare-fun choose!30 (BitStream!1130 BitStream!1130 BitStream!1130) Unit!1866)

(assert (=> d!6832 (= lt!30574 (choose!30 thiss!1379 (_2!1343 lt!30492) (_2!1343 lt!30493)))))

(assert (=> d!6832 (isPrefixOf!0 thiss!1379 (_2!1343 lt!30492))))

(assert (=> d!6832 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1343 lt!30492) (_2!1343 lt!30493)) lt!30574)))

(declare-fun bs!2011 () Bool)

(assert (= bs!2011 d!6832))

(assert (=> bs!2011 m!29409))

(declare-fun m!29463 () Bool)

(assert (=> bs!2011 m!29463))

(assert (=> bs!2011 m!29391))

(assert (=> b!21290 d!6832))

(declare-fun d!6834 () Bool)

(assert (=> d!6834 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!648 (buf!960 (_2!1343 lt!30492)))) ((_ sign_extend 32) (currentByte!2255 thiss!1379)) ((_ sign_extend 32) (currentBit!2250 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!648 (buf!960 (_2!1343 lt!30492)))) ((_ sign_extend 32) (currentByte!2255 thiss!1379)) ((_ sign_extend 32) (currentBit!2250 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2012 () Bool)

(assert (= bs!2012 d!6834))

(declare-fun m!29465 () Bool)

(assert (=> bs!2012 m!29465))

(assert (=> b!21290 d!6834))

(declare-fun b!21374 () Bool)

(declare-fun res!18488 () Bool)

(declare-fun e!14532 () Bool)

(assert (=> b!21374 (=> (not res!18488) (not e!14532))))

(declare-fun lt!30666 () tuple2!2518)

(assert (=> b!21374 (= res!18488 (isPrefixOf!0 (_1!1344 lt!30666) thiss!1379))))

(declare-fun b!21375 () Bool)

(declare-fun res!18486 () Bool)

(assert (=> b!21375 (=> (not res!18486) (not e!14532))))

(assert (=> b!21375 (= res!18486 (isPrefixOf!0 (_2!1344 lt!30666) (_2!1343 lt!30492)))))

(declare-fun d!6836 () Bool)

(assert (=> d!6836 e!14532))

(declare-fun res!18487 () Bool)

(assert (=> d!6836 (=> (not res!18487) (not e!14532))))

(assert (=> d!6836 (= res!18487 (isPrefixOf!0 (_1!1344 lt!30666) (_2!1344 lt!30666)))))

(declare-fun lt!30659 () BitStream!1130)

(assert (=> d!6836 (= lt!30666 (tuple2!2519 lt!30659 (_2!1343 lt!30492)))))

(declare-fun lt!30656 () Unit!1866)

(declare-fun lt!30667 () Unit!1866)

(assert (=> d!6836 (= lt!30656 lt!30667)))

(assert (=> d!6836 (isPrefixOf!0 lt!30659 (_2!1343 lt!30492))))

(assert (=> d!6836 (= lt!30667 (lemmaIsPrefixTransitive!0 lt!30659 (_2!1343 lt!30492) (_2!1343 lt!30492)))))

(declare-fun lt!30668 () Unit!1866)

(declare-fun lt!30665 () Unit!1866)

(assert (=> d!6836 (= lt!30668 lt!30665)))

(assert (=> d!6836 (isPrefixOf!0 lt!30659 (_2!1343 lt!30492))))

(assert (=> d!6836 (= lt!30665 (lemmaIsPrefixTransitive!0 lt!30659 thiss!1379 (_2!1343 lt!30492)))))

(declare-fun lt!30669 () Unit!1866)

(declare-fun e!14533 () Unit!1866)

(assert (=> d!6836 (= lt!30669 e!14533)))

(declare-fun c!1518 () Bool)

(assert (=> d!6836 (= c!1518 (not (= (size!648 (buf!960 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!30657 () Unit!1866)

(declare-fun lt!30652 () Unit!1866)

(assert (=> d!6836 (= lt!30657 lt!30652)))

(assert (=> d!6836 (isPrefixOf!0 (_2!1343 lt!30492) (_2!1343 lt!30492))))

(assert (=> d!6836 (= lt!30652 (lemmaIsPrefixRefl!0 (_2!1343 lt!30492)))))

(declare-fun lt!30662 () Unit!1866)

(declare-fun lt!30651 () Unit!1866)

(assert (=> d!6836 (= lt!30662 lt!30651)))

(assert (=> d!6836 (= lt!30651 (lemmaIsPrefixRefl!0 (_2!1343 lt!30492)))))

(declare-fun lt!30664 () Unit!1866)

(declare-fun lt!30653 () Unit!1866)

(assert (=> d!6836 (= lt!30664 lt!30653)))

(assert (=> d!6836 (isPrefixOf!0 lt!30659 lt!30659)))

(assert (=> d!6836 (= lt!30653 (lemmaIsPrefixRefl!0 lt!30659))))

(declare-fun lt!30658 () Unit!1866)

(declare-fun lt!30660 () Unit!1866)

(assert (=> d!6836 (= lt!30658 lt!30660)))

(assert (=> d!6836 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!6836 (= lt!30660 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!6836 (= lt!30659 (BitStream!1131 (buf!960 (_2!1343 lt!30492)) (currentByte!2255 thiss!1379) (currentBit!2250 thiss!1379)))))

(assert (=> d!6836 (isPrefixOf!0 thiss!1379 (_2!1343 lt!30492))))

(assert (=> d!6836 (= (reader!0 thiss!1379 (_2!1343 lt!30492)) lt!30666)))

(declare-fun b!21376 () Bool)

(declare-fun Unit!1876 () Unit!1866)

(assert (=> b!21376 (= e!14533 Unit!1876)))

(declare-fun b!21377 () Bool)

(declare-fun lt!30661 () (_ BitVec 64))

(declare-fun lt!30655 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1130 (_ BitVec 64)) BitStream!1130)

(assert (=> b!21377 (= e!14532 (= (_1!1344 lt!30666) (withMovedBitIndex!0 (_2!1344 lt!30666) (bvsub lt!30655 lt!30661))))))

(assert (=> b!21377 (or (= (bvand lt!30655 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!30661 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!30655 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!30655 lt!30661) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!21377 (= lt!30661 (bitIndex!0 (size!648 (buf!960 (_2!1343 lt!30492))) (currentByte!2255 (_2!1343 lt!30492)) (currentBit!2250 (_2!1343 lt!30492))))))

(assert (=> b!21377 (= lt!30655 (bitIndex!0 (size!648 (buf!960 thiss!1379)) (currentByte!2255 thiss!1379) (currentBit!2250 thiss!1379)))))

(declare-fun b!21378 () Bool)

(declare-fun lt!30663 () Unit!1866)

(assert (=> b!21378 (= e!14533 lt!30663)))

(declare-fun lt!30654 () (_ BitVec 64))

(assert (=> b!21378 (= lt!30654 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!30670 () (_ BitVec 64))

(assert (=> b!21378 (= lt!30670 (bitIndex!0 (size!648 (buf!960 thiss!1379)) (currentByte!2255 thiss!1379) (currentBit!2250 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1518 array!1518 (_ BitVec 64) (_ BitVec 64)) Unit!1866)

(assert (=> b!21378 (= lt!30663 (arrayBitRangesEqSymmetric!0 (buf!960 thiss!1379) (buf!960 (_2!1343 lt!30492)) lt!30654 lt!30670))))

(assert (=> b!21378 (arrayBitRangesEq!0 (buf!960 (_2!1343 lt!30492)) (buf!960 thiss!1379) lt!30654 lt!30670)))

(assert (= (and d!6836 c!1518) b!21378))

(assert (= (and d!6836 (not c!1518)) b!21376))

(assert (= (and d!6836 res!18487) b!21374))

(assert (= (and b!21374 res!18488) b!21375))

(assert (= (and b!21375 res!18486) b!21377))

(declare-fun m!29467 () Bool)

(assert (=> d!6836 m!29467))

(declare-fun m!29469 () Bool)

(assert (=> d!6836 m!29469))

(declare-fun m!29471 () Bool)

(assert (=> d!6836 m!29471))

(declare-fun m!29473 () Bool)

(assert (=> d!6836 m!29473))

(assert (=> d!6836 m!29395))

(assert (=> d!6836 m!29397))

(declare-fun m!29475 () Bool)

(assert (=> d!6836 m!29475))

(declare-fun m!29477 () Bool)

(assert (=> d!6836 m!29477))

(declare-fun m!29479 () Bool)

(assert (=> d!6836 m!29479))

(assert (=> d!6836 m!29391))

(declare-fun m!29481 () Bool)

(assert (=> d!6836 m!29481))

(assert (=> b!21378 m!29399))

(declare-fun m!29483 () Bool)

(assert (=> b!21378 m!29483))

(declare-fun m!29485 () Bool)

(assert (=> b!21378 m!29485))

(declare-fun m!29487 () Bool)

(assert (=> b!21375 m!29487))

(declare-fun m!29489 () Bool)

(assert (=> b!21374 m!29489))

(declare-fun m!29491 () Bool)

(assert (=> b!21377 m!29491))

(declare-fun m!29493 () Bool)

(assert (=> b!21377 m!29493))

(assert (=> b!21377 m!29399))

(assert (=> b!21290 d!6836))

(declare-fun lt!31026 () tuple2!2518)

(declare-fun e!14569 () Bool)

(declare-fun lt!31019 () tuple2!2516)

(declare-fun b!21457 () Bool)

(assert (=> b!21457 (= e!14569 (= (bitStreamReadBitsIntoList!0 (_2!1343 lt!31019) (_1!1344 lt!31026) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1343 lt!31019) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!21457 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!21457 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!31014 () Unit!1866)

(declare-fun lt!31009 () Unit!1866)

(assert (=> b!21457 (= lt!31014 lt!31009)))

(declare-fun lt!31015 () (_ BitVec 64))

(assert (=> b!21457 (validate_offset_bits!1 ((_ sign_extend 32) (size!648 (buf!960 (_2!1343 lt!31019)))) ((_ sign_extend 32) (currentByte!2255 (_2!1343 lt!30492))) ((_ sign_extend 32) (currentBit!2250 (_2!1343 lt!30492))) lt!31015)))

(assert (=> b!21457 (= lt!31009 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1343 lt!30492) (buf!960 (_2!1343 lt!31019)) lt!31015))))

(declare-fun e!14568 () Bool)

(assert (=> b!21457 e!14568))

(declare-fun res!18550 () Bool)

(assert (=> b!21457 (=> (not res!18550) (not e!14568))))

(assert (=> b!21457 (= res!18550 (and (= (size!648 (buf!960 (_2!1343 lt!30492))) (size!648 (buf!960 (_2!1343 lt!31019)))) (bvsge lt!31015 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!21457 (= lt!31015 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!21457 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!21457 (= lt!31026 (reader!0 (_2!1343 lt!30492) (_2!1343 lt!31019)))))

(declare-fun lt!30996 () tuple2!2516)

(declare-fun lt!30998 () tuple2!2516)

(declare-fun bm!305 () Bool)

(declare-fun c!1528 () Bool)

(declare-fun call!308 () tuple2!2518)

(assert (=> bm!305 (= call!308 (reader!0 (ite c!1528 (_2!1343 lt!30996) (_2!1343 lt!30492)) (ite c!1528 (_2!1343 lt!30998) (_2!1343 lt!30492))))))

(declare-fun b!21458 () Bool)

(declare-fun res!18554 () Bool)

(assert (=> b!21458 (=> (not res!18554) (not e!14569))))

(assert (=> b!21458 (= res!18554 (isPrefixOf!0 (_2!1343 lt!30492) (_2!1343 lt!31019)))))

(declare-fun b!21459 () Bool)

(declare-fun e!14570 () tuple2!2516)

(declare-fun Unit!1877 () Unit!1866)

(assert (=> b!21459 (= e!14570 (tuple2!2517 Unit!1877 (_2!1343 lt!30998)))))

(assert (=> b!21459 (= lt!30996 (appendBitFromByte!0 (_2!1343 lt!30492) (select (arr!1095 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!31001 () (_ BitVec 64))

(assert (=> b!21459 (= lt!31001 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!31006 () (_ BitVec 64))

(assert (=> b!21459 (= lt!31006 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!30999 () Unit!1866)

(assert (=> b!21459 (= lt!30999 (validateOffsetBitsIneqLemma!0 (_2!1343 lt!30492) (_2!1343 lt!30996) lt!31001 lt!31006))))

(assert (=> b!21459 (validate_offset_bits!1 ((_ sign_extend 32) (size!648 (buf!960 (_2!1343 lt!30996)))) ((_ sign_extend 32) (currentByte!2255 (_2!1343 lt!30996))) ((_ sign_extend 32) (currentBit!2250 (_2!1343 lt!30996))) (bvsub lt!31001 lt!31006))))

(declare-fun lt!31029 () Unit!1866)

(assert (=> b!21459 (= lt!31029 lt!30999)))

(declare-fun lt!30988 () tuple2!2518)

(assert (=> b!21459 (= lt!30988 (reader!0 (_2!1343 lt!30492) (_2!1343 lt!30996)))))

(declare-fun lt!31027 () (_ BitVec 64))

(assert (=> b!21459 (= lt!31027 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!31017 () Unit!1866)

(assert (=> b!21459 (= lt!31017 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1343 lt!30492) (buf!960 (_2!1343 lt!30996)) lt!31027))))

(assert (=> b!21459 (validate_offset_bits!1 ((_ sign_extend 32) (size!648 (buf!960 (_2!1343 lt!30996)))) ((_ sign_extend 32) (currentByte!2255 (_2!1343 lt!30492))) ((_ sign_extend 32) (currentBit!2250 (_2!1343 lt!30492))) lt!31027)))

(declare-fun lt!31003 () Unit!1866)

(assert (=> b!21459 (= lt!31003 lt!31017)))

(assert (=> b!21459 (= (head!103 (byteArrayBitContentToList!0 (_2!1343 lt!30996) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!103 (bitStreamReadBitsIntoList!0 (_2!1343 lt!30996) (_1!1344 lt!30988) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!31011 () Unit!1866)

(declare-fun Unit!1878 () Unit!1866)

(assert (=> b!21459 (= lt!31011 Unit!1878)))

(assert (=> b!21459 (= lt!30998 (appendBitsMSBFirstLoop!0 (_2!1343 lt!30996) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!30991 () Unit!1866)

(assert (=> b!21459 (= lt!30991 (lemmaIsPrefixTransitive!0 (_2!1343 lt!30492) (_2!1343 lt!30996) (_2!1343 lt!30998)))))

(assert (=> b!21459 (isPrefixOf!0 (_2!1343 lt!30492) (_2!1343 lt!30998))))

(declare-fun lt!30987 () Unit!1866)

(assert (=> b!21459 (= lt!30987 lt!30991)))

(assert (=> b!21459 (= (size!648 (buf!960 (_2!1343 lt!30998))) (size!648 (buf!960 (_2!1343 lt!30492))))))

(declare-fun lt!31000 () Unit!1866)

(declare-fun Unit!1879 () Unit!1866)

(assert (=> b!21459 (= lt!31000 Unit!1879)))

(assert (=> b!21459 (= (bitIndex!0 (size!648 (buf!960 (_2!1343 lt!30998))) (currentByte!2255 (_2!1343 lt!30998)) (currentBit!2250 (_2!1343 lt!30998))) (bvsub (bvadd (bitIndex!0 (size!648 (buf!960 (_2!1343 lt!30492))) (currentByte!2255 (_2!1343 lt!30492)) (currentBit!2250 (_2!1343 lt!30492))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!31020 () Unit!1866)

(declare-fun Unit!1880 () Unit!1866)

(assert (=> b!21459 (= lt!31020 Unit!1880)))

(assert (=> b!21459 (= (bitIndex!0 (size!648 (buf!960 (_2!1343 lt!30998))) (currentByte!2255 (_2!1343 lt!30998)) (currentBit!2250 (_2!1343 lt!30998))) (bvsub (bvsub (bvadd (bitIndex!0 (size!648 (buf!960 (_2!1343 lt!30996))) (currentByte!2255 (_2!1343 lt!30996)) (currentBit!2250 (_2!1343 lt!30996))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!31024 () Unit!1866)

(declare-fun Unit!1881 () Unit!1866)

(assert (=> b!21459 (= lt!31024 Unit!1881)))

(declare-fun lt!31025 () tuple2!2518)

(assert (=> b!21459 (= lt!31025 (reader!0 (_2!1343 lt!30492) (_2!1343 lt!30998)))))

(declare-fun lt!31002 () (_ BitVec 64))

(assert (=> b!21459 (= lt!31002 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!30989 () Unit!1866)

(assert (=> b!21459 (= lt!30989 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1343 lt!30492) (buf!960 (_2!1343 lt!30998)) lt!31002))))

(assert (=> b!21459 (validate_offset_bits!1 ((_ sign_extend 32) (size!648 (buf!960 (_2!1343 lt!30998)))) ((_ sign_extend 32) (currentByte!2255 (_2!1343 lt!30492))) ((_ sign_extend 32) (currentBit!2250 (_2!1343 lt!30492))) lt!31002)))

(declare-fun lt!31013 () Unit!1866)

(assert (=> b!21459 (= lt!31013 lt!30989)))

(declare-fun lt!31010 () tuple2!2518)

(assert (=> b!21459 (= lt!31010 call!308)))

(declare-fun lt!31008 () (_ BitVec 64))

(assert (=> b!21459 (= lt!31008 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!30994 () Unit!1866)

(assert (=> b!21459 (= lt!30994 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1343 lt!30996) (buf!960 (_2!1343 lt!30998)) lt!31008))))

(assert (=> b!21459 (validate_offset_bits!1 ((_ sign_extend 32) (size!648 (buf!960 (_2!1343 lt!30998)))) ((_ sign_extend 32) (currentByte!2255 (_2!1343 lt!30996))) ((_ sign_extend 32) (currentBit!2250 (_2!1343 lt!30996))) lt!31008)))

(declare-fun lt!31016 () Unit!1866)

(assert (=> b!21459 (= lt!31016 lt!30994)))

(declare-fun lt!31021 () List!266)

(assert (=> b!21459 (= lt!31021 (byteArrayBitContentToList!0 (_2!1343 lt!30998) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!31028 () List!266)

(assert (=> b!21459 (= lt!31028 (byteArrayBitContentToList!0 (_2!1343 lt!30998) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!31018 () List!266)

(assert (=> b!21459 (= lt!31018 (bitStreamReadBitsIntoList!0 (_2!1343 lt!30998) (_1!1344 lt!31025) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!31022 () List!266)

(assert (=> b!21459 (= lt!31022 (bitStreamReadBitsIntoList!0 (_2!1343 lt!30998) (_1!1344 lt!31010) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!30995 () (_ BitVec 64))

(assert (=> b!21459 (= lt!30995 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!30993 () Unit!1866)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1130 BitStream!1130 BitStream!1130 BitStream!1130 (_ BitVec 64) List!266) Unit!1866)

(assert (=> b!21459 (= lt!30993 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1343 lt!30998) (_2!1343 lt!30998) (_1!1344 lt!31025) (_1!1344 lt!31010) lt!30995 lt!31018))))

(declare-fun tail!79 (List!266) List!266)

(assert (=> b!21459 (= (bitStreamReadBitsIntoList!0 (_2!1343 lt!30998) (_1!1344 lt!31010) (bvsub lt!30995 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!79 lt!31018))))

(declare-fun lt!30990 () Unit!1866)

(assert (=> b!21459 (= lt!30990 lt!30993)))

(declare-fun lt!31030 () (_ BitVec 64))

(declare-fun lt!31023 () Unit!1866)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1518 array!1518 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1866)

(assert (=> b!21459 (= lt!31023 (arrayBitRangesEqImpliesEq!0 (buf!960 (_2!1343 lt!30996)) (buf!960 (_2!1343 lt!30998)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!31030 (bitIndex!0 (size!648 (buf!960 (_2!1343 lt!30996))) (currentByte!2255 (_2!1343 lt!30996)) (currentBit!2250 (_2!1343 lt!30996)))))))

(declare-fun bitAt!0 (array!1518 (_ BitVec 64)) Bool)

(assert (=> b!21459 (= (bitAt!0 (buf!960 (_2!1343 lt!30996)) lt!31030) (bitAt!0 (buf!960 (_2!1343 lt!30998)) lt!31030))))

(declare-fun lt!31012 () Unit!1866)

(assert (=> b!21459 (= lt!31012 lt!31023)))

(declare-fun b!21460 () Bool)

(declare-fun Unit!1882 () Unit!1866)

(assert (=> b!21460 (= e!14570 (tuple2!2517 Unit!1882 (_2!1343 lt!30492)))))

(assert (=> b!21460 (= (size!648 (buf!960 (_2!1343 lt!30492))) (size!648 (buf!960 (_2!1343 lt!30492))))))

(declare-fun lt!31004 () Unit!1866)

(declare-fun Unit!1883 () Unit!1866)

(assert (=> b!21460 (= lt!31004 Unit!1883)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1130 array!1518 array!1518 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!2528 0))(
  ( (tuple2!2529 (_1!1349 array!1518) (_2!1349 BitStream!1130)) )
))
(declare-fun readBits!0 (BitStream!1130 (_ BitVec 64)) tuple2!2528)

(assert (=> b!21460 (checkByteArrayBitContent!0 (_2!1343 lt!30492) srcBuffer!2 (_1!1349 (readBits!0 (_1!1344 call!308) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!21461 () Bool)

(declare-fun res!18549 () Bool)

(assert (=> b!21461 (=> (not res!18549) (not e!14569))))

(assert (=> b!21461 (= res!18549 (= (size!648 (buf!960 (_2!1343 lt!31019))) (size!648 (buf!960 (_2!1343 lt!30492)))))))

(declare-fun b!21463 () Bool)

(declare-fun res!18553 () Bool)

(assert (=> b!21463 (=> (not res!18553) (not e!14569))))

(assert (=> b!21463 (= res!18553 (invariant!0 (currentBit!2250 (_2!1343 lt!31019)) (currentByte!2255 (_2!1343 lt!31019)) (size!648 (buf!960 (_2!1343 lt!31019)))))))

(declare-fun b!21464 () Bool)

(declare-fun res!18551 () Bool)

(assert (=> b!21464 (=> (not res!18551) (not e!14569))))

(assert (=> b!21464 (= res!18551 (= (size!648 (buf!960 (_2!1343 lt!30492))) (size!648 (buf!960 (_2!1343 lt!31019)))))))

(declare-fun b!21462 () Bool)

(assert (=> b!21462 (= e!14568 (validate_offset_bits!1 ((_ sign_extend 32) (size!648 (buf!960 (_2!1343 lt!30492)))) ((_ sign_extend 32) (currentByte!2255 (_2!1343 lt!30492))) ((_ sign_extend 32) (currentBit!2250 (_2!1343 lt!30492))) lt!31015))))

(declare-fun d!6838 () Bool)

(assert (=> d!6838 e!14569))

(declare-fun res!18552 () Bool)

(assert (=> d!6838 (=> (not res!18552) (not e!14569))))

(declare-fun lt!31007 () (_ BitVec 64))

(assert (=> d!6838 (= res!18552 (= (bitIndex!0 (size!648 (buf!960 (_2!1343 lt!31019))) (currentByte!2255 (_2!1343 lt!31019)) (currentBit!2250 (_2!1343 lt!31019))) (bvsub lt!31007 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!6838 (or (= (bvand lt!31007 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!31007 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!31007 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!30992 () (_ BitVec 64))

(assert (=> d!6838 (= lt!31007 (bvadd lt!30992 to!314))))

(assert (=> d!6838 (or (not (= (bvand lt!30992 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!30992 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!30992 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!6838 (= lt!30992 (bitIndex!0 (size!648 (buf!960 (_2!1343 lt!30492))) (currentByte!2255 (_2!1343 lt!30492)) (currentBit!2250 (_2!1343 lt!30492))))))

(assert (=> d!6838 (= lt!31019 e!14570)))

(assert (=> d!6838 (= c!1528 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!30997 () Unit!1866)

(declare-fun lt!31005 () Unit!1866)

(assert (=> d!6838 (= lt!30997 lt!31005)))

(assert (=> d!6838 (isPrefixOf!0 (_2!1343 lt!30492) (_2!1343 lt!30492))))

(assert (=> d!6838 (= lt!31005 (lemmaIsPrefixRefl!0 (_2!1343 lt!30492)))))

(assert (=> d!6838 (= lt!31030 (bitIndex!0 (size!648 (buf!960 (_2!1343 lt!30492))) (currentByte!2255 (_2!1343 lt!30492)) (currentBit!2250 (_2!1343 lt!30492))))))

(assert (=> d!6838 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!6838 (= (appendBitsMSBFirstLoop!0 (_2!1343 lt!30492) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!31019)))

(assert (= (and d!6838 c!1528) b!21459))

(assert (= (and d!6838 (not c!1528)) b!21460))

(assert (= (or b!21459 b!21460) bm!305))

(assert (= (and d!6838 res!18552) b!21463))

(assert (= (and b!21463 res!18553) b!21464))

(assert (= (and b!21464 res!18551) b!21458))

(assert (= (and b!21458 res!18554) b!21461))

(assert (= (and b!21461 res!18549) b!21457))

(assert (= (and b!21457 res!18550) b!21462))

(declare-fun m!29659 () Bool)

(assert (=> b!21460 m!29659))

(declare-fun m!29661 () Bool)

(assert (=> b!21460 m!29661))

(declare-fun m!29663 () Bool)

(assert (=> b!21459 m!29663))

(declare-fun m!29665 () Bool)

(assert (=> b!21459 m!29665))

(declare-fun m!29667 () Bool)

(assert (=> b!21459 m!29667))

(declare-fun m!29669 () Bool)

(assert (=> b!21459 m!29669))

(declare-fun m!29671 () Bool)

(assert (=> b!21459 m!29671))

(declare-fun m!29673 () Bool)

(assert (=> b!21459 m!29673))

(declare-fun m!29675 () Bool)

(assert (=> b!21459 m!29675))

(declare-fun m!29677 () Bool)

(assert (=> b!21459 m!29677))

(declare-fun m!29679 () Bool)

(assert (=> b!21459 m!29679))

(declare-fun m!29681 () Bool)

(assert (=> b!21459 m!29681))

(declare-fun m!29683 () Bool)

(assert (=> b!21459 m!29683))

(declare-fun m!29685 () Bool)

(assert (=> b!21459 m!29685))

(declare-fun m!29687 () Bool)

(assert (=> b!21459 m!29687))

(declare-fun m!29689 () Bool)

(assert (=> b!21459 m!29689))

(declare-fun m!29691 () Bool)

(assert (=> b!21459 m!29691))

(declare-fun m!29693 () Bool)

(assert (=> b!21459 m!29693))

(declare-fun m!29695 () Bool)

(assert (=> b!21459 m!29695))

(declare-fun m!29697 () Bool)

(assert (=> b!21459 m!29697))

(declare-fun m!29699 () Bool)

(assert (=> b!21459 m!29699))

(declare-fun m!29701 () Bool)

(assert (=> b!21459 m!29701))

(declare-fun m!29703 () Bool)

(assert (=> b!21459 m!29703))

(declare-fun m!29705 () Bool)

(assert (=> b!21459 m!29705))

(assert (=> b!21459 m!29675))

(assert (=> b!21459 m!29691))

(assert (=> b!21459 m!29493))

(declare-fun m!29707 () Bool)

(assert (=> b!21459 m!29707))

(assert (=> b!21459 m!29665))

(declare-fun m!29709 () Bool)

(assert (=> b!21459 m!29709))

(declare-fun m!29711 () Bool)

(assert (=> b!21459 m!29711))

(declare-fun m!29713 () Bool)

(assert (=> b!21459 m!29713))

(declare-fun m!29715 () Bool)

(assert (=> b!21459 m!29715))

(declare-fun m!29717 () Bool)

(assert (=> b!21459 m!29717))

(assert (=> b!21459 m!29713))

(declare-fun m!29719 () Bool)

(assert (=> b!21459 m!29719))

(declare-fun m!29721 () Bool)

(assert (=> b!21459 m!29721))

(declare-fun m!29723 () Bool)

(assert (=> b!21459 m!29723))

(declare-fun m!29725 () Bool)

(assert (=> d!6838 m!29725))

(assert (=> d!6838 m!29493))

(assert (=> d!6838 m!29473))

(assert (=> d!6838 m!29469))

(declare-fun m!29727 () Bool)

(assert (=> b!21462 m!29727))

(declare-fun m!29729 () Bool)

(assert (=> bm!305 m!29729))

(declare-fun m!29731 () Bool)

(assert (=> b!21463 m!29731))

(declare-fun m!29733 () Bool)

(assert (=> b!21457 m!29733))

(declare-fun m!29735 () Bool)

(assert (=> b!21457 m!29735))

(declare-fun m!29737 () Bool)

(assert (=> b!21457 m!29737))

(declare-fun m!29739 () Bool)

(assert (=> b!21457 m!29739))

(declare-fun m!29741 () Bool)

(assert (=> b!21457 m!29741))

(declare-fun m!29743 () Bool)

(assert (=> b!21458 m!29743))

(assert (=> b!21290 d!6838))

(declare-fun d!6866 () Bool)

(declare-fun res!18555 () Bool)

(declare-fun e!14571 () Bool)

(assert (=> d!6866 (=> (not res!18555) (not e!14571))))

(assert (=> d!6866 (= res!18555 (= (size!648 (buf!960 (_2!1343 lt!30492))) (size!648 (buf!960 (_2!1343 lt!30493)))))))

(assert (=> d!6866 (= (isPrefixOf!0 (_2!1343 lt!30492) (_2!1343 lt!30493)) e!14571)))

(declare-fun b!21465 () Bool)

(declare-fun res!18556 () Bool)

(assert (=> b!21465 (=> (not res!18556) (not e!14571))))

(assert (=> b!21465 (= res!18556 (bvsle (bitIndex!0 (size!648 (buf!960 (_2!1343 lt!30492))) (currentByte!2255 (_2!1343 lt!30492)) (currentBit!2250 (_2!1343 lt!30492))) (bitIndex!0 (size!648 (buf!960 (_2!1343 lt!30493))) (currentByte!2255 (_2!1343 lt!30493)) (currentBit!2250 (_2!1343 lt!30493)))))))

(declare-fun b!21466 () Bool)

(declare-fun e!14572 () Bool)

(assert (=> b!21466 (= e!14571 e!14572)))

(declare-fun res!18557 () Bool)

(assert (=> b!21466 (=> res!18557 e!14572)))

(assert (=> b!21466 (= res!18557 (= (size!648 (buf!960 (_2!1343 lt!30492))) #b00000000000000000000000000000000))))

(declare-fun b!21467 () Bool)

(assert (=> b!21467 (= e!14572 (arrayBitRangesEq!0 (buf!960 (_2!1343 lt!30492)) (buf!960 (_2!1343 lt!30493)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!648 (buf!960 (_2!1343 lt!30492))) (currentByte!2255 (_2!1343 lt!30492)) (currentBit!2250 (_2!1343 lt!30492)))))))

(assert (= (and d!6866 res!18555) b!21465))

(assert (= (and b!21465 res!18556) b!21466))

(assert (= (and b!21466 (not res!18557)) b!21467))

(assert (=> b!21465 m!29493))

(assert (=> b!21465 m!29459))

(assert (=> b!21467 m!29493))

(assert (=> b!21467 m!29493))

(declare-fun m!29745 () Bool)

(assert (=> b!21467 m!29745))

(assert (=> b!21290 d!6866))

(declare-fun d!6868 () Bool)

(assert (=> d!6868 (= (head!103 (byteArrayBitContentToList!0 (_2!1343 lt!30492) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!381 (byteArrayBitContentToList!0 (_2!1343 lt!30492) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!21292 d!6868))

(declare-fun d!6870 () Bool)

(declare-fun c!1531 () Bool)

(assert (=> d!6870 (= c!1531 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!14575 () List!266)

(assert (=> d!6870 (= (byteArrayBitContentToList!0 (_2!1343 lt!30492) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!14575)))

(declare-fun b!21472 () Bool)

(assert (=> b!21472 (= e!14575 Nil!263)))

(declare-fun b!21473 () Bool)

(assert (=> b!21473 (= e!14575 (Cons!262 (not (= (bvand ((_ sign_extend 24) (select (arr!1095 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1343 lt!30492) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!6870 c!1531) b!21472))

(assert (= (and d!6870 (not c!1531)) b!21473))

(assert (=> b!21473 m!29385))

(declare-fun m!29747 () Bool)

(assert (=> b!21473 m!29747))

(declare-fun m!29749 () Bool)

(assert (=> b!21473 m!29749))

(assert (=> b!21292 d!6870))

(declare-fun d!6872 () Bool)

(assert (=> d!6872 (= (head!103 (bitStreamReadBitsIntoList!0 (_2!1343 lt!30492) (_1!1344 lt!30495) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!381 (bitStreamReadBitsIntoList!0 (_2!1343 lt!30492) (_1!1344 lt!30495) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!21292 d!6872))

(declare-datatypes ((tuple2!2530 0))(
  ( (tuple2!2531 (_1!1350 Bool) (_2!1350 BitStream!1130)) )
))
(declare-fun lt!31037 () tuple2!2530)

(declare-datatypes ((tuple2!2532 0))(
  ( (tuple2!2533 (_1!1351 List!266) (_2!1351 BitStream!1130)) )
))
(declare-fun e!14580 () tuple2!2532)

(declare-fun lt!31038 () (_ BitVec 64))

(declare-fun b!21483 () Bool)

(assert (=> b!21483 (= e!14580 (tuple2!2533 (Cons!262 (_1!1350 lt!31037) (bitStreamReadBitsIntoList!0 (_2!1343 lt!30492) (_2!1350 lt!31037) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!31038))) (_2!1350 lt!31037)))))

(declare-fun readBit!0 (BitStream!1130) tuple2!2530)

(assert (=> b!21483 (= lt!31037 (readBit!0 (_1!1344 lt!30495)))))

(assert (=> b!21483 (= lt!31038 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!21485 () Bool)

(declare-fun e!14581 () Bool)

(declare-fun lt!31039 () List!266)

(declare-fun length!53 (List!266) Int)

(assert (=> b!21485 (= e!14581 (> (length!53 lt!31039) 0))))

(declare-fun d!6874 () Bool)

(assert (=> d!6874 e!14581))

(declare-fun c!1537 () Bool)

(assert (=> d!6874 (= c!1537 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!6874 (= lt!31039 (_1!1351 e!14580))))

(declare-fun c!1536 () Bool)

(assert (=> d!6874 (= c!1536 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!6874 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!6874 (= (bitStreamReadBitsIntoList!0 (_2!1343 lt!30492) (_1!1344 lt!30495) #b0000000000000000000000000000000000000000000000000000000000000001) lt!31039)))

(declare-fun b!21484 () Bool)

(declare-fun isEmpty!58 (List!266) Bool)

(assert (=> b!21484 (= e!14581 (isEmpty!58 lt!31039))))

(declare-fun b!21482 () Bool)

(assert (=> b!21482 (= e!14580 (tuple2!2533 Nil!263 (_1!1344 lt!30495)))))

(assert (= (and d!6874 c!1536) b!21482))

(assert (= (and d!6874 (not c!1536)) b!21483))

(assert (= (and d!6874 c!1537) b!21484))

(assert (= (and d!6874 (not c!1537)) b!21485))

(declare-fun m!29751 () Bool)

(assert (=> b!21483 m!29751))

(declare-fun m!29753 () Bool)

(assert (=> b!21483 m!29753))

(declare-fun m!29755 () Bool)

(assert (=> b!21485 m!29755))

(declare-fun m!29757 () Bool)

(assert (=> b!21484 m!29757))

(assert (=> b!21292 d!6874))

(declare-fun d!6876 () Bool)

(assert (=> d!6876 (= (array_inv!618 (buf!960 thiss!1379)) (bvsge (size!648 (buf!960 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!21287 d!6876))

(declare-fun d!6878 () Bool)

(assert (=> d!6878 (= (array_inv!618 srcBuffer!2) (bvsge (size!648 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!5276 d!6878))

(declare-fun d!6880 () Bool)

(assert (=> d!6880 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2250 thiss!1379) (currentByte!2255 thiss!1379) (size!648 (buf!960 thiss!1379))))))

(declare-fun bs!2019 () Bool)

(assert (= bs!2019 d!6880))

(assert (=> bs!2019 m!29425))

(assert (=> start!5276 d!6880))

(declare-fun d!6882 () Bool)

(assert (=> d!6882 (= (invariant!0 (currentBit!2250 thiss!1379) (currentByte!2255 thiss!1379) (size!648 (buf!960 thiss!1379))) (and (bvsge (currentBit!2250 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!2250 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!2255 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!2255 thiss!1379) (size!648 (buf!960 thiss!1379))) (and (= (currentBit!2250 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!2255 thiss!1379) (size!648 (buf!960 thiss!1379)))))))))

(assert (=> b!21288 d!6882))

(declare-fun d!6884 () Bool)

(declare-fun res!18558 () Bool)

(declare-fun e!14582 () Bool)

(assert (=> d!6884 (=> (not res!18558) (not e!14582))))

(assert (=> d!6884 (= res!18558 (= (size!648 (buf!960 thiss!1379)) (size!648 (buf!960 (_2!1343 lt!30492)))))))

(assert (=> d!6884 (= (isPrefixOf!0 thiss!1379 (_2!1343 lt!30492)) e!14582)))

(declare-fun b!21486 () Bool)

(declare-fun res!18559 () Bool)

(assert (=> b!21486 (=> (not res!18559) (not e!14582))))

(assert (=> b!21486 (= res!18559 (bvsle (bitIndex!0 (size!648 (buf!960 thiss!1379)) (currentByte!2255 thiss!1379) (currentBit!2250 thiss!1379)) (bitIndex!0 (size!648 (buf!960 (_2!1343 lt!30492))) (currentByte!2255 (_2!1343 lt!30492)) (currentBit!2250 (_2!1343 lt!30492)))))))

(declare-fun b!21487 () Bool)

(declare-fun e!14583 () Bool)

(assert (=> b!21487 (= e!14582 e!14583)))

(declare-fun res!18560 () Bool)

(assert (=> b!21487 (=> res!18560 e!14583)))

(assert (=> b!21487 (= res!18560 (= (size!648 (buf!960 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!21488 () Bool)

(assert (=> b!21488 (= e!14583 (arrayBitRangesEq!0 (buf!960 thiss!1379) (buf!960 (_2!1343 lt!30492)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!648 (buf!960 thiss!1379)) (currentByte!2255 thiss!1379) (currentBit!2250 thiss!1379))))))

(assert (= (and d!6884 res!18558) b!21486))

(assert (= (and b!21486 res!18559) b!21487))

(assert (= (and b!21487 (not res!18560)) b!21488))

(assert (=> b!21486 m!29399))

(assert (=> b!21486 m!29493))

(assert (=> b!21488 m!29399))

(assert (=> b!21488 m!29399))

(declare-fun m!29759 () Bool)

(assert (=> b!21488 m!29759))

(assert (=> b!21293 d!6884))

(declare-fun d!6886 () Bool)

(assert (=> d!6886 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!648 (buf!960 (_2!1343 lt!30492)))) ((_ sign_extend 32) (currentByte!2255 (_2!1343 lt!30492))) ((_ sign_extend 32) (currentBit!2250 (_2!1343 lt!30492))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!648 (buf!960 (_2!1343 lt!30492)))) ((_ sign_extend 32) (currentByte!2255 (_2!1343 lt!30492))) ((_ sign_extend 32) (currentBit!2250 (_2!1343 lt!30492)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!2020 () Bool)

(assert (= bs!2020 d!6886))

(declare-fun m!29761 () Bool)

(assert (=> bs!2020 m!29761))

(assert (=> b!21293 d!6886))

(declare-fun d!6888 () Bool)

(declare-fun e!14586 () Bool)

(assert (=> d!6888 e!14586))

(declare-fun res!18563 () Bool)

(assert (=> d!6888 (=> (not res!18563) (not e!14586))))

(assert (=> d!6888 (= res!18563 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!31042 () Unit!1866)

(declare-fun choose!27 (BitStream!1130 BitStream!1130 (_ BitVec 64) (_ BitVec 64)) Unit!1866)

(assert (=> d!6888 (= lt!31042 (choose!27 thiss!1379 (_2!1343 lt!30492) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!6888 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!6888 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1343 lt!30492) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!31042)))

(declare-fun b!21491 () Bool)

(assert (=> b!21491 (= e!14586 (validate_offset_bits!1 ((_ sign_extend 32) (size!648 (buf!960 (_2!1343 lt!30492)))) ((_ sign_extend 32) (currentByte!2255 (_2!1343 lt!30492))) ((_ sign_extend 32) (currentBit!2250 (_2!1343 lt!30492))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!6888 res!18563) b!21491))

(declare-fun m!29763 () Bool)

(assert (=> d!6888 m!29763))

(assert (=> b!21491 m!29387))

(assert (=> b!21293 d!6888))

(declare-fun b!21550 () Bool)

(declare-fun res!18616 () Bool)

(declare-fun e!14616 () Bool)

(assert (=> b!21550 (=> (not res!18616) (not e!14616))))

(declare-fun lt!31194 () tuple2!2516)

(assert (=> b!21550 (= res!18616 (isPrefixOf!0 thiss!1379 (_2!1343 lt!31194)))))

(declare-fun b!21551 () Bool)

(declare-fun res!18622 () Bool)

(declare-fun e!14613 () Bool)

(assert (=> b!21551 (=> (not res!18622) (not e!14613))))

(declare-fun lt!31201 () tuple2!2516)

(assert (=> b!21551 (= res!18622 (= (bitIndex!0 (size!648 (buf!960 (_2!1343 lt!31201))) (currentByte!2255 (_2!1343 lt!31201)) (currentBit!2250 (_2!1343 lt!31201))) (bvadd (bitIndex!0 (size!648 (buf!960 thiss!1379)) (currentByte!2255 thiss!1379) (currentBit!2250 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!21552 () Bool)

(declare-fun res!18621 () Bool)

(assert (=> b!21552 (=> (not res!18621) (not e!14613))))

(assert (=> b!21552 (= res!18621 (isPrefixOf!0 thiss!1379 (_2!1343 lt!31201)))))

(declare-fun b!21553 () Bool)

(declare-fun res!18617 () Bool)

(assert (=> b!21553 (=> (not res!18617) (not e!14616))))

(declare-fun lt!31198 () (_ BitVec 64))

(declare-fun lt!31195 () (_ BitVec 64))

(assert (=> b!21553 (= res!18617 (= (bitIndex!0 (size!648 (buf!960 (_2!1343 lt!31194))) (currentByte!2255 (_2!1343 lt!31194)) (currentBit!2250 (_2!1343 lt!31194))) (bvadd lt!31198 lt!31195)))))

(assert (=> b!21553 (or (not (= (bvand lt!31198 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!31195 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!31198 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!31198 lt!31195) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!21553 (= lt!31195 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!21553 (= lt!31198 (bitIndex!0 (size!648 (buf!960 thiss!1379)) (currentByte!2255 thiss!1379) (currentBit!2250 thiss!1379)))))

(declare-fun b!21554 () Bool)

(declare-fun e!14614 () Bool)

(declare-datatypes ((tuple2!2534 0))(
  ( (tuple2!2535 (_1!1352 BitStream!1130) (_2!1352 Bool)) )
))
(declare-fun lt!31200 () tuple2!2534)

(assert (=> b!21554 (= e!14614 (= (bitIndex!0 (size!648 (buf!960 (_1!1352 lt!31200))) (currentByte!2255 (_1!1352 lt!31200)) (currentBit!2250 (_1!1352 lt!31200))) (bitIndex!0 (size!648 (buf!960 (_2!1343 lt!31201))) (currentByte!2255 (_2!1343 lt!31201)) (currentBit!2250 (_2!1343 lt!31201)))))))

(declare-fun d!6890 () Bool)

(assert (=> d!6890 e!14616))

(declare-fun res!18619 () Bool)

(assert (=> d!6890 (=> (not res!18619) (not e!14616))))

(assert (=> d!6890 (= res!18619 (= (size!648 (buf!960 (_2!1343 lt!31194))) (size!648 (buf!960 thiss!1379))))))

(declare-fun lt!31192 () (_ BitVec 8))

(declare-fun lt!31191 () array!1518)

(assert (=> d!6890 (= lt!31192 (select (arr!1095 lt!31191) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!6890 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!648 lt!31191)))))

(assert (=> d!6890 (= lt!31191 (array!1519 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!31197 () tuple2!2516)

(assert (=> d!6890 (= lt!31194 (tuple2!2517 (_1!1343 lt!31197) (_2!1343 lt!31197)))))

(assert (=> d!6890 (= lt!31197 lt!31201)))

(assert (=> d!6890 e!14613))

(declare-fun res!18620 () Bool)

(assert (=> d!6890 (=> (not res!18620) (not e!14613))))

(assert (=> d!6890 (= res!18620 (= (size!648 (buf!960 thiss!1379)) (size!648 (buf!960 (_2!1343 lt!31201)))))))

(declare-fun lt!31199 () Bool)

(declare-fun appendBit!0 (BitStream!1130 Bool) tuple2!2516)

(assert (=> d!6890 (= lt!31201 (appendBit!0 thiss!1379 lt!31199))))

(assert (=> d!6890 (= lt!31199 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1095 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!6890 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!6890 (= (appendBitFromByte!0 thiss!1379 (select (arr!1095 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!31194)))

(declare-fun b!21555 () Bool)

(assert (=> b!21555 (= e!14613 e!14614)))

(declare-fun res!18618 () Bool)

(assert (=> b!21555 (=> (not res!18618) (not e!14614))))

(assert (=> b!21555 (= res!18618 (and (= (_2!1352 lt!31200) lt!31199) (= (_1!1352 lt!31200) (_2!1343 lt!31201))))))

(declare-fun readBitPure!0 (BitStream!1130) tuple2!2534)

(declare-fun readerFrom!0 (BitStream!1130 (_ BitVec 32) (_ BitVec 32)) BitStream!1130)

(assert (=> b!21555 (= lt!31200 (readBitPure!0 (readerFrom!0 (_2!1343 lt!31201) (currentBit!2250 thiss!1379) (currentByte!2255 thiss!1379))))))

(declare-fun b!21556 () Bool)

(declare-fun e!14615 () Bool)

(assert (=> b!21556 (= e!14616 e!14615)))

(declare-fun res!18623 () Bool)

(assert (=> b!21556 (=> (not res!18623) (not e!14615))))

(declare-fun lt!31193 () tuple2!2534)

(assert (=> b!21556 (= res!18623 (and (= (_2!1352 lt!31193) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1095 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!31192)) #b00000000000000000000000000000000))) (= (_1!1352 lt!31193) (_2!1343 lt!31194))))))

(declare-fun lt!31196 () tuple2!2528)

(declare-fun lt!31202 () BitStream!1130)

(assert (=> b!21556 (= lt!31196 (readBits!0 lt!31202 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!21556 (= lt!31193 (readBitPure!0 lt!31202))))

(assert (=> b!21556 (= lt!31202 (readerFrom!0 (_2!1343 lt!31194) (currentBit!2250 thiss!1379) (currentByte!2255 thiss!1379)))))

(declare-fun b!21557 () Bool)

(assert (=> b!21557 (= e!14615 (= (bitIndex!0 (size!648 (buf!960 (_1!1352 lt!31193))) (currentByte!2255 (_1!1352 lt!31193)) (currentBit!2250 (_1!1352 lt!31193))) (bitIndex!0 (size!648 (buf!960 (_2!1343 lt!31194))) (currentByte!2255 (_2!1343 lt!31194)) (currentBit!2250 (_2!1343 lt!31194)))))))

(assert (= (and d!6890 res!18620) b!21551))

(assert (= (and b!21551 res!18622) b!21552))

(assert (= (and b!21552 res!18621) b!21555))

(assert (= (and b!21555 res!18618) b!21554))

(assert (= (and d!6890 res!18619) b!21553))

(assert (= (and b!21553 res!18617) b!21550))

(assert (= (and b!21550 res!18616) b!21556))

(assert (= (and b!21556 res!18623) b!21557))

(declare-fun m!29791 () Bool)

(assert (=> b!21553 m!29791))

(assert (=> b!21553 m!29399))

(declare-fun m!29793 () Bool)

(assert (=> b!21557 m!29793))

(assert (=> b!21557 m!29791))

(declare-fun m!29795 () Bool)

(assert (=> b!21555 m!29795))

(assert (=> b!21555 m!29795))

(declare-fun m!29797 () Bool)

(assert (=> b!21555 m!29797))

(declare-fun m!29799 () Bool)

(assert (=> b!21550 m!29799))

(declare-fun m!29801 () Bool)

(assert (=> b!21554 m!29801))

(declare-fun m!29803 () Bool)

(assert (=> b!21554 m!29803))

(assert (=> b!21551 m!29803))

(assert (=> b!21551 m!29399))

(declare-fun m!29805 () Bool)

(assert (=> b!21556 m!29805))

(declare-fun m!29807 () Bool)

(assert (=> b!21556 m!29807))

(declare-fun m!29809 () Bool)

(assert (=> b!21556 m!29809))

(declare-fun m!29811 () Bool)

(assert (=> d!6890 m!29811))

(declare-fun m!29813 () Bool)

(assert (=> d!6890 m!29813))

(assert (=> d!6890 m!29747))

(declare-fun m!29815 () Bool)

(assert (=> b!21552 m!29815))

(assert (=> b!21293 d!6890))

(push 1)

(assert (not d!6880))

(assert (not b!21378))

(assert (not b!21488))

(assert (not b!21462))

(assert (not b!21552))

(assert (not b!21491))

(assert (not d!6814))

(assert (not bm!305))

(assert (not b!21459))

(assert (not b!21377))

(assert (not b!21551))

(assert (not b!21342))

(assert (not d!6890))

(assert (not b!21556))

(assert (not b!21344))

(assert (not d!6886))

(assert (not d!6832))

(assert (not b!21550))

(assert (not b!21557))

(assert (not b!21555))

(assert (not d!6822))

(assert (not b!21357))

(assert (not d!6836))

(assert (not b!21486))

(assert (not d!6838))

(assert (not b!21465))

(assert (not d!6834))

(assert (not b!21554))

(assert (not b!21553))

(assert (not b!21483))

(assert (not d!6818))

(assert (not b!21463))

(assert (not b!21458))

(assert (not b!21485))

(assert (not d!6812))

(assert (not b!21375))

(assert (not b!21374))

(assert (not b!21359))

(assert (not b!21457))

(assert (not b!21460))

(assert (not b!21467))

(assert (not b!21473))

(assert (not d!6888))

(assert (not b!21484))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

