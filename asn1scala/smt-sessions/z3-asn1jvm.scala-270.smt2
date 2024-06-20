; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5274 () Bool)

(assert start!5274)

(declare-fun b!21266 () Bool)

(declare-fun e!14457 () Bool)

(declare-fun e!14458 () Bool)

(assert (=> b!21266 (= e!14457 (not e!14458))))

(declare-fun res!18409 () Bool)

(assert (=> b!21266 (=> res!18409 e!14458)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!21266 (= res!18409 (bvsge i!635 to!314))))

(declare-datatypes ((array!1516 0))(
  ( (array!1517 (arr!1094 (Array (_ BitVec 32) (_ BitVec 8))) (size!647 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1128 0))(
  ( (BitStream!1129 (buf!959 array!1516) (currentByte!2254 (_ BitVec 32)) (currentBit!2249 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1128)

(declare-fun isPrefixOf!0 (BitStream!1128 BitStream!1128) Bool)

(assert (=> b!21266 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!1864 0))(
  ( (Unit!1865) )
))
(declare-fun lt!30470 () Unit!1864)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1128) Unit!1864)

(assert (=> b!21266 (= lt!30470 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!30467 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!21266 (= lt!30467 (bitIndex!0 (size!647 (buf!959 thiss!1379)) (currentByte!2254 thiss!1379) (currentBit!2249 thiss!1379)))))

(declare-fun srcBuffer!2 () array!1516)

(declare-fun b!21267 () Bool)

(declare-datatypes ((tuple2!2512 0))(
  ( (tuple2!2513 (_1!1341 Unit!1864) (_2!1341 BitStream!1128)) )
))
(declare-fun lt!30465 () tuple2!2512)

(declare-datatypes ((tuple2!2514 0))(
  ( (tuple2!2515 (_1!1342 BitStream!1128) (_2!1342 BitStream!1128)) )
))
(declare-fun lt!30471 () tuple2!2514)

(declare-fun e!14461 () Bool)

(declare-datatypes ((List!265 0))(
  ( (Nil!262) (Cons!261 (h!380 Bool) (t!1015 List!265)) )
))
(declare-fun head!102 (List!265) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1128 array!1516 (_ BitVec 64) (_ BitVec 64)) List!265)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1128 BitStream!1128 (_ BitVec 64)) List!265)

(assert (=> b!21267 (= e!14461 (= (head!102 (byteArrayBitContentToList!0 (_2!1341 lt!30465) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!102 (bitStreamReadBitsIntoList!0 (_2!1341 lt!30465) (_1!1342 lt!30471) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!21268 () Bool)

(declare-fun e!14459 () Bool)

(declare-fun e!14456 () Bool)

(assert (=> b!21268 (= e!14459 e!14456)))

(declare-fun res!18410 () Bool)

(assert (=> b!21268 (=> res!18410 e!14456)))

(declare-fun lt!30472 () tuple2!2512)

(assert (=> b!21268 (= res!18410 (not (isPrefixOf!0 (_2!1341 lt!30465) (_2!1341 lt!30472))))))

(assert (=> b!21268 (isPrefixOf!0 thiss!1379 (_2!1341 lt!30472))))

(declare-fun lt!30469 () Unit!1864)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1128 BitStream!1128 BitStream!1128) Unit!1864)

(assert (=> b!21268 (= lt!30469 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1341 lt!30465) (_2!1341 lt!30472)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1128 array!1516 (_ BitVec 64) (_ BitVec 64)) tuple2!2512)

(assert (=> b!21268 (= lt!30472 (appendBitsMSBFirstLoop!0 (_2!1341 lt!30465) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!21268 e!14461))

(declare-fun res!18413 () Bool)

(assert (=> b!21268 (=> (not res!18413) (not e!14461))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!21268 (= res!18413 (validate_offset_bits!1 ((_ sign_extend 32) (size!647 (buf!959 (_2!1341 lt!30465)))) ((_ sign_extend 32) (currentByte!2254 thiss!1379)) ((_ sign_extend 32) (currentBit!2249 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!30468 () Unit!1864)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1128 array!1516 (_ BitVec 64)) Unit!1864)

(assert (=> b!21268 (= lt!30468 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!959 (_2!1341 lt!30465)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1128 BitStream!1128) tuple2!2514)

(assert (=> b!21268 (= lt!30471 (reader!0 thiss!1379 (_2!1341 lt!30465)))))

(declare-fun b!21270 () Bool)

(assert (=> b!21270 (= e!14458 e!14459)))

(declare-fun res!18411 () Bool)

(assert (=> b!21270 (=> res!18411 e!14459)))

(assert (=> b!21270 (= res!18411 (not (isPrefixOf!0 thiss!1379 (_2!1341 lt!30465))))))

(assert (=> b!21270 (validate_offset_bits!1 ((_ sign_extend 32) (size!647 (buf!959 (_2!1341 lt!30465)))) ((_ sign_extend 32) (currentByte!2254 (_2!1341 lt!30465))) ((_ sign_extend 32) (currentBit!2249 (_2!1341 lt!30465))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!30466 () Unit!1864)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1128 BitStream!1128 (_ BitVec 64) (_ BitVec 64)) Unit!1864)

(assert (=> b!21270 (= lt!30466 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1341 lt!30465) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1128 (_ BitVec 8) (_ BitVec 32)) tuple2!2512)

(assert (=> b!21270 (= lt!30465 (appendBitFromByte!0 thiss!1379 (select (arr!1094 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!21271 () Bool)

(declare-fun e!14462 () Bool)

(declare-fun array_inv!617 (array!1516) Bool)

(assert (=> b!21271 (= e!14462 (array_inv!617 (buf!959 thiss!1379)))))

(declare-fun b!21272 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!21272 (= e!14456 (invariant!0 (currentBit!2249 thiss!1379) (currentByte!2254 thiss!1379) (size!647 (buf!959 thiss!1379))))))

(declare-fun b!21269 () Bool)

(declare-fun res!18412 () Bool)

(assert (=> b!21269 (=> (not res!18412) (not e!14457))))

(assert (=> b!21269 (= res!18412 (validate_offset_bits!1 ((_ sign_extend 32) (size!647 (buf!959 thiss!1379))) ((_ sign_extend 32) (currentByte!2254 thiss!1379)) ((_ sign_extend 32) (currentBit!2249 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!18408 () Bool)

(assert (=> start!5274 (=> (not res!18408) (not e!14457))))

(assert (=> start!5274 (= res!18408 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!647 srcBuffer!2))))))))

(assert (=> start!5274 e!14457))

(assert (=> start!5274 true))

(assert (=> start!5274 (array_inv!617 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1128) Bool)

(assert (=> start!5274 (and (inv!12 thiss!1379) e!14462)))

(assert (= (and start!5274 res!18408) b!21269))

(assert (= (and b!21269 res!18412) b!21266))

(assert (= (and b!21266 (not res!18409)) b!21270))

(assert (= (and b!21270 (not res!18411)) b!21268))

(assert (= (and b!21268 res!18413) b!21267))

(assert (= (and b!21268 (not res!18410)) b!21272))

(assert (= start!5274 b!21271))

(declare-fun m!29331 () Bool)

(assert (=> b!21266 m!29331))

(declare-fun m!29333 () Bool)

(assert (=> b!21266 m!29333))

(declare-fun m!29335 () Bool)

(assert (=> b!21266 m!29335))

(declare-fun m!29337 () Bool)

(assert (=> start!5274 m!29337))

(declare-fun m!29339 () Bool)

(assert (=> start!5274 m!29339))

(declare-fun m!29341 () Bool)

(assert (=> b!21268 m!29341))

(declare-fun m!29343 () Bool)

(assert (=> b!21268 m!29343))

(declare-fun m!29345 () Bool)

(assert (=> b!21268 m!29345))

(declare-fun m!29347 () Bool)

(assert (=> b!21268 m!29347))

(declare-fun m!29349 () Bool)

(assert (=> b!21268 m!29349))

(declare-fun m!29351 () Bool)

(assert (=> b!21268 m!29351))

(declare-fun m!29353 () Bool)

(assert (=> b!21268 m!29353))

(declare-fun m!29355 () Bool)

(assert (=> b!21270 m!29355))

(declare-fun m!29357 () Bool)

(assert (=> b!21270 m!29357))

(declare-fun m!29359 () Bool)

(assert (=> b!21270 m!29359))

(declare-fun m!29361 () Bool)

(assert (=> b!21270 m!29361))

(assert (=> b!21270 m!29355))

(declare-fun m!29363 () Bool)

(assert (=> b!21270 m!29363))

(declare-fun m!29365 () Bool)

(assert (=> b!21269 m!29365))

(declare-fun m!29367 () Bool)

(assert (=> b!21271 m!29367))

(declare-fun m!29369 () Bool)

(assert (=> b!21272 m!29369))

(declare-fun m!29371 () Bool)

(assert (=> b!21267 m!29371))

(assert (=> b!21267 m!29371))

(declare-fun m!29373 () Bool)

(assert (=> b!21267 m!29373))

(declare-fun m!29375 () Bool)

(assert (=> b!21267 m!29375))

(assert (=> b!21267 m!29375))

(declare-fun m!29377 () Bool)

(assert (=> b!21267 m!29377))

(check-sat (not start!5274) (not b!21269) (not b!21270) (not b!21266) (not b!21268) (not b!21271) (not b!21267) (not b!21272))
(check-sat)
(get-model)

(declare-fun d!6782 () Bool)

(declare-fun res!18439 () Bool)

(declare-fun e!14493 () Bool)

(assert (=> d!6782 (=> (not res!18439) (not e!14493))))

(assert (=> d!6782 (= res!18439 (= (size!647 (buf!959 thiss!1379)) (size!647 (buf!959 thiss!1379))))))

(assert (=> d!6782 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!14493)))

(declare-fun b!21300 () Bool)

(declare-fun res!18440 () Bool)

(assert (=> b!21300 (=> (not res!18440) (not e!14493))))

(assert (=> b!21300 (= res!18440 (bvsle (bitIndex!0 (size!647 (buf!959 thiss!1379)) (currentByte!2254 thiss!1379) (currentBit!2249 thiss!1379)) (bitIndex!0 (size!647 (buf!959 thiss!1379)) (currentByte!2254 thiss!1379) (currentBit!2249 thiss!1379))))))

(declare-fun b!21301 () Bool)

(declare-fun e!14492 () Bool)

(assert (=> b!21301 (= e!14493 e!14492)))

(declare-fun res!18438 () Bool)

(assert (=> b!21301 (=> res!18438 e!14492)))

(assert (=> b!21301 (= res!18438 (= (size!647 (buf!959 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!21302 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1516 array!1516 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!21302 (= e!14492 (arrayBitRangesEq!0 (buf!959 thiss!1379) (buf!959 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!647 (buf!959 thiss!1379)) (currentByte!2254 thiss!1379) (currentBit!2249 thiss!1379))))))

(assert (= (and d!6782 res!18439) b!21300))

(assert (= (and b!21300 res!18440) b!21301))

(assert (= (and b!21301 (not res!18438)) b!21302))

(assert (=> b!21300 m!29335))

(assert (=> b!21300 m!29335))

(assert (=> b!21302 m!29335))

(assert (=> b!21302 m!29335))

(declare-fun m!29427 () Bool)

(assert (=> b!21302 m!29427))

(assert (=> b!21266 d!6782))

(declare-fun d!6784 () Bool)

(assert (=> d!6784 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!30499 () Unit!1864)

(declare-fun choose!11 (BitStream!1128) Unit!1864)

(assert (=> d!6784 (= lt!30499 (choose!11 thiss!1379))))

(assert (=> d!6784 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!30499)))

(declare-fun bs!2001 () Bool)

(assert (= bs!2001 d!6784))

(assert (=> bs!2001 m!29331))

(declare-fun m!29429 () Bool)

(assert (=> bs!2001 m!29429))

(assert (=> b!21266 d!6784))

(declare-fun d!6786 () Bool)

(declare-fun e!14496 () Bool)

(assert (=> d!6786 e!14496))

(declare-fun res!18446 () Bool)

(assert (=> d!6786 (=> (not res!18446) (not e!14496))))

(declare-fun lt!30513 () (_ BitVec 64))

(declare-fun lt!30514 () (_ BitVec 64))

(declare-fun lt!30517 () (_ BitVec 64))

(assert (=> d!6786 (= res!18446 (= lt!30513 (bvsub lt!30517 lt!30514)))))

(assert (=> d!6786 (or (= (bvand lt!30517 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!30514 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!30517 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!30517 lt!30514) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!6786 (= lt!30514 (remainingBits!0 ((_ sign_extend 32) (size!647 (buf!959 thiss!1379))) ((_ sign_extend 32) (currentByte!2254 thiss!1379)) ((_ sign_extend 32) (currentBit!2249 thiss!1379))))))

(declare-fun lt!30515 () (_ BitVec 64))

(declare-fun lt!30516 () (_ BitVec 64))

(assert (=> d!6786 (= lt!30517 (bvmul lt!30515 lt!30516))))

(assert (=> d!6786 (or (= lt!30515 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!30516 (bvsdiv (bvmul lt!30515 lt!30516) lt!30515)))))

(assert (=> d!6786 (= lt!30516 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!6786 (= lt!30515 ((_ sign_extend 32) (size!647 (buf!959 thiss!1379))))))

(assert (=> d!6786 (= lt!30513 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2254 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2249 thiss!1379))))))

(assert (=> d!6786 (invariant!0 (currentBit!2249 thiss!1379) (currentByte!2254 thiss!1379) (size!647 (buf!959 thiss!1379)))))

(assert (=> d!6786 (= (bitIndex!0 (size!647 (buf!959 thiss!1379)) (currentByte!2254 thiss!1379) (currentBit!2249 thiss!1379)) lt!30513)))

(declare-fun b!21307 () Bool)

(declare-fun res!18445 () Bool)

(assert (=> b!21307 (=> (not res!18445) (not e!14496))))

(assert (=> b!21307 (= res!18445 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!30513))))

(declare-fun b!21308 () Bool)

(declare-fun lt!30512 () (_ BitVec 64))

(assert (=> b!21308 (= e!14496 (bvsle lt!30513 (bvmul lt!30512 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!21308 (or (= lt!30512 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!30512 #b0000000000000000000000000000000000000000000000000000000000001000) lt!30512)))))

(assert (=> b!21308 (= lt!30512 ((_ sign_extend 32) (size!647 (buf!959 thiss!1379))))))

(assert (= (and d!6786 res!18446) b!21307))

(assert (= (and b!21307 res!18445) b!21308))

(declare-fun m!29431 () Bool)

(assert (=> d!6786 m!29431))

(assert (=> d!6786 m!29369))

(assert (=> b!21266 d!6786))

(declare-fun d!6788 () Bool)

(assert (=> d!6788 (= (array_inv!617 (buf!959 thiss!1379)) (bvsge (size!647 (buf!959 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!21271 d!6788))

(declare-fun d!6790 () Bool)

(assert (=> d!6790 (= (invariant!0 (currentBit!2249 thiss!1379) (currentByte!2254 thiss!1379) (size!647 (buf!959 thiss!1379))) (and (bvsge (currentBit!2249 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!2249 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!2254 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!2254 thiss!1379) (size!647 (buf!959 thiss!1379))) (and (= (currentBit!2249 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!2254 thiss!1379) (size!647 (buf!959 thiss!1379)))))))))

(assert (=> b!21272 d!6790))

(declare-fun d!6792 () Bool)

(assert (=> d!6792 (= (head!102 (byteArrayBitContentToList!0 (_2!1341 lt!30465) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!380 (byteArrayBitContentToList!0 (_2!1341 lt!30465) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!21267 d!6792))

(declare-fun d!6794 () Bool)

(declare-fun c!1507 () Bool)

(assert (=> d!6794 (= c!1507 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!14499 () List!265)

(assert (=> d!6794 (= (byteArrayBitContentToList!0 (_2!1341 lt!30465) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!14499)))

(declare-fun b!21313 () Bool)

(assert (=> b!21313 (= e!14499 Nil!262)))

(declare-fun b!21314 () Bool)

(assert (=> b!21314 (= e!14499 (Cons!261 (not (= (bvand ((_ sign_extend 24) (select (arr!1094 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1341 lt!30465) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!6794 c!1507) b!21313))

(assert (= (and d!6794 (not c!1507)) b!21314))

(assert (=> b!21314 m!29355))

(declare-fun m!29433 () Bool)

(assert (=> b!21314 m!29433))

(declare-fun m!29435 () Bool)

(assert (=> b!21314 m!29435))

(assert (=> b!21267 d!6794))

(declare-fun d!6796 () Bool)

(assert (=> d!6796 (= (head!102 (bitStreamReadBitsIntoList!0 (_2!1341 lt!30465) (_1!1342 lt!30471) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!380 (bitStreamReadBitsIntoList!0 (_2!1341 lt!30465) (_1!1342 lt!30471) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!21267 d!6796))

(declare-fun lt!30524 () (_ BitVec 64))

(declare-datatypes ((tuple2!2520 0))(
  ( (tuple2!2521 (_1!1345 Bool) (_2!1345 BitStream!1128)) )
))
(declare-fun lt!30525 () tuple2!2520)

(declare-datatypes ((tuple2!2522 0))(
  ( (tuple2!2523 (_1!1346 List!265) (_2!1346 BitStream!1128)) )
))
(declare-fun e!14505 () tuple2!2522)

(declare-fun b!21324 () Bool)

(assert (=> b!21324 (= e!14505 (tuple2!2523 (Cons!261 (_1!1345 lt!30525) (bitStreamReadBitsIntoList!0 (_2!1341 lt!30465) (_2!1345 lt!30525) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!30524))) (_2!1345 lt!30525)))))

(declare-fun readBit!0 (BitStream!1128) tuple2!2520)

(assert (=> b!21324 (= lt!30525 (readBit!0 (_1!1342 lt!30471)))))

(assert (=> b!21324 (= lt!30524 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!21326 () Bool)

(declare-fun e!14504 () Bool)

(declare-fun lt!30526 () List!265)

(declare-fun length!52 (List!265) Int)

(assert (=> b!21326 (= e!14504 (> (length!52 lt!30526) 0))))

(declare-fun b!21323 () Bool)

(assert (=> b!21323 (= e!14505 (tuple2!2523 Nil!262 (_1!1342 lt!30471)))))

(declare-fun b!21325 () Bool)

(declare-fun isEmpty!57 (List!265) Bool)

(assert (=> b!21325 (= e!14504 (isEmpty!57 lt!30526))))

(declare-fun d!6798 () Bool)

(assert (=> d!6798 e!14504))

(declare-fun c!1513 () Bool)

(assert (=> d!6798 (= c!1513 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!6798 (= lt!30526 (_1!1346 e!14505))))

(declare-fun c!1512 () Bool)

(assert (=> d!6798 (= c!1512 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!6798 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!6798 (= (bitStreamReadBitsIntoList!0 (_2!1341 lt!30465) (_1!1342 lt!30471) #b0000000000000000000000000000000000000000000000000000000000000001) lt!30526)))

(assert (= (and d!6798 c!1512) b!21323))

(assert (= (and d!6798 (not c!1512)) b!21324))

(assert (= (and d!6798 c!1513) b!21325))

(assert (= (and d!6798 (not c!1513)) b!21326))

(declare-fun m!29437 () Bool)

(assert (=> b!21324 m!29437))

(declare-fun m!29439 () Bool)

(assert (=> b!21324 m!29439))

(declare-fun m!29441 () Bool)

(assert (=> b!21326 m!29441))

(declare-fun m!29443 () Bool)

(assert (=> b!21325 m!29443))

(assert (=> b!21267 d!6798))

(declare-fun d!6800 () Bool)

(assert (=> d!6800 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!647 (buf!959 thiss!1379))) ((_ sign_extend 32) (currentByte!2254 thiss!1379)) ((_ sign_extend 32) (currentBit!2249 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!647 (buf!959 thiss!1379))) ((_ sign_extend 32) (currentByte!2254 thiss!1379)) ((_ sign_extend 32) (currentBit!2249 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2002 () Bool)

(assert (= bs!2002 d!6800))

(assert (=> bs!2002 m!29431))

(assert (=> b!21269 d!6800))

(declare-fun b!21406 () Bool)

(declare-fun res!18514 () Bool)

(declare-fun e!14545 () Bool)

(assert (=> b!21406 (=> (not res!18514) (not e!14545))))

(declare-fun lt!30806 () tuple2!2512)

(assert (=> b!21406 (= res!18514 (isPrefixOf!0 (_2!1341 lt!30465) (_2!1341 lt!30806)))))

(declare-fun b!21407 () Bool)

(declare-fun res!18513 () Bool)

(assert (=> b!21407 (=> (not res!18513) (not e!14545))))

(assert (=> b!21407 (= res!18513 (= (size!647 (buf!959 (_2!1341 lt!30806))) (size!647 (buf!959 (_2!1341 lt!30465)))))))

(declare-fun b!21408 () Bool)

(declare-fun e!14546 () Bool)

(declare-fun lt!30804 () (_ BitVec 64))

(assert (=> b!21408 (= e!14546 (validate_offset_bits!1 ((_ sign_extend 32) (size!647 (buf!959 (_2!1341 lt!30465)))) ((_ sign_extend 32) (currentByte!2254 (_2!1341 lt!30465))) ((_ sign_extend 32) (currentBit!2249 (_2!1341 lt!30465))) lt!30804))))

(declare-fun b!21409 () Bool)

(declare-fun res!18512 () Bool)

(assert (=> b!21409 (=> (not res!18512) (not e!14545))))

(assert (=> b!21409 (= res!18512 (invariant!0 (currentBit!2249 (_2!1341 lt!30806)) (currentByte!2254 (_2!1341 lt!30806)) (size!647 (buf!959 (_2!1341 lt!30806)))))))

(declare-fun lt!30788 () tuple2!2514)

(declare-fun b!21410 () Bool)

(assert (=> b!21410 (= e!14545 (= (bitStreamReadBitsIntoList!0 (_2!1341 lt!30806) (_1!1342 lt!30788) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1341 lt!30806) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!21410 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!21410 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!30798 () Unit!1864)

(declare-fun lt!30824 () Unit!1864)

(assert (=> b!21410 (= lt!30798 lt!30824)))

(assert (=> b!21410 (validate_offset_bits!1 ((_ sign_extend 32) (size!647 (buf!959 (_2!1341 lt!30806)))) ((_ sign_extend 32) (currentByte!2254 (_2!1341 lt!30465))) ((_ sign_extend 32) (currentBit!2249 (_2!1341 lt!30465))) lt!30804)))

(assert (=> b!21410 (= lt!30824 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1341 lt!30465) (buf!959 (_2!1341 lt!30806)) lt!30804))))

(assert (=> b!21410 e!14546))

(declare-fun res!18510 () Bool)

(assert (=> b!21410 (=> (not res!18510) (not e!14546))))

(assert (=> b!21410 (= res!18510 (and (= (size!647 (buf!959 (_2!1341 lt!30465))) (size!647 (buf!959 (_2!1341 lt!30806)))) (bvsge lt!30804 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!21410 (= lt!30804 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!21410 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!21410 (= lt!30788 (reader!0 (_2!1341 lt!30465) (_2!1341 lt!30806)))))

(declare-fun b!21412 () Bool)

(declare-fun e!14544 () tuple2!2512)

(declare-fun Unit!1868 () Unit!1864)

(assert (=> b!21412 (= e!14544 (tuple2!2513 Unit!1868 (_2!1341 lt!30465)))))

(assert (=> b!21412 (= (size!647 (buf!959 (_2!1341 lt!30465))) (size!647 (buf!959 (_2!1341 lt!30465))))))

(declare-fun lt!30827 () Unit!1864)

(declare-fun Unit!1869 () Unit!1864)

(assert (=> b!21412 (= lt!30827 Unit!1869)))

(declare-fun call!305 () tuple2!2514)

(declare-fun checkByteArrayBitContent!0 (BitStream!1128 array!1516 array!1516 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!2524 0))(
  ( (tuple2!2525 (_1!1347 array!1516) (_2!1347 BitStream!1128)) )
))
(declare-fun readBits!0 (BitStream!1128 (_ BitVec 64)) tuple2!2524)

(assert (=> b!21412 (checkByteArrayBitContent!0 (_2!1341 lt!30465) srcBuffer!2 (_1!1347 (readBits!0 (_1!1342 call!305) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!30822 () tuple2!2512)

(declare-fun lt!30801 () tuple2!2512)

(declare-fun c!1522 () Bool)

(declare-fun bm!302 () Bool)

(assert (=> bm!302 (= call!305 (reader!0 (ite c!1522 (_2!1341 lt!30822) (_2!1341 lt!30465)) (ite c!1522 (_2!1341 lt!30801) (_2!1341 lt!30465))))))

(declare-fun b!21413 () Bool)

(declare-fun res!18511 () Bool)

(assert (=> b!21413 (=> (not res!18511) (not e!14545))))

(assert (=> b!21413 (= res!18511 (= (size!647 (buf!959 (_2!1341 lt!30465))) (size!647 (buf!959 (_2!1341 lt!30806)))))))

(declare-fun b!21411 () Bool)

(declare-fun Unit!1870 () Unit!1864)

(assert (=> b!21411 (= e!14544 (tuple2!2513 Unit!1870 (_2!1341 lt!30801)))))

(assert (=> b!21411 (= lt!30822 (appendBitFromByte!0 (_2!1341 lt!30465) (select (arr!1094 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!30808 () (_ BitVec 64))

(assert (=> b!21411 (= lt!30808 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!30821 () (_ BitVec 64))

(assert (=> b!21411 (= lt!30821 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!30794 () Unit!1864)

(assert (=> b!21411 (= lt!30794 (validateOffsetBitsIneqLemma!0 (_2!1341 lt!30465) (_2!1341 lt!30822) lt!30808 lt!30821))))

(assert (=> b!21411 (validate_offset_bits!1 ((_ sign_extend 32) (size!647 (buf!959 (_2!1341 lt!30822)))) ((_ sign_extend 32) (currentByte!2254 (_2!1341 lt!30822))) ((_ sign_extend 32) (currentBit!2249 (_2!1341 lt!30822))) (bvsub lt!30808 lt!30821))))

(declare-fun lt!30796 () Unit!1864)

(assert (=> b!21411 (= lt!30796 lt!30794)))

(declare-fun lt!30802 () tuple2!2514)

(assert (=> b!21411 (= lt!30802 (reader!0 (_2!1341 lt!30465) (_2!1341 lt!30822)))))

(declare-fun lt!30795 () (_ BitVec 64))

(assert (=> b!21411 (= lt!30795 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!30810 () Unit!1864)

(assert (=> b!21411 (= lt!30810 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1341 lt!30465) (buf!959 (_2!1341 lt!30822)) lt!30795))))

(assert (=> b!21411 (validate_offset_bits!1 ((_ sign_extend 32) (size!647 (buf!959 (_2!1341 lt!30822)))) ((_ sign_extend 32) (currentByte!2254 (_2!1341 lt!30465))) ((_ sign_extend 32) (currentBit!2249 (_2!1341 lt!30465))) lt!30795)))

(declare-fun lt!30807 () Unit!1864)

(assert (=> b!21411 (= lt!30807 lt!30810)))

(assert (=> b!21411 (= (head!102 (byteArrayBitContentToList!0 (_2!1341 lt!30822) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!102 (bitStreamReadBitsIntoList!0 (_2!1341 lt!30822) (_1!1342 lt!30802) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!30791 () Unit!1864)

(declare-fun Unit!1871 () Unit!1864)

(assert (=> b!21411 (= lt!30791 Unit!1871)))

(assert (=> b!21411 (= lt!30801 (appendBitsMSBFirstLoop!0 (_2!1341 lt!30822) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!30797 () Unit!1864)

(assert (=> b!21411 (= lt!30797 (lemmaIsPrefixTransitive!0 (_2!1341 lt!30465) (_2!1341 lt!30822) (_2!1341 lt!30801)))))

(assert (=> b!21411 (isPrefixOf!0 (_2!1341 lt!30465) (_2!1341 lt!30801))))

(declare-fun lt!30809 () Unit!1864)

(assert (=> b!21411 (= lt!30809 lt!30797)))

(assert (=> b!21411 (= (size!647 (buf!959 (_2!1341 lt!30801))) (size!647 (buf!959 (_2!1341 lt!30465))))))

(declare-fun lt!30790 () Unit!1864)

(declare-fun Unit!1872 () Unit!1864)

(assert (=> b!21411 (= lt!30790 Unit!1872)))

(assert (=> b!21411 (= (bitIndex!0 (size!647 (buf!959 (_2!1341 lt!30801))) (currentByte!2254 (_2!1341 lt!30801)) (currentBit!2249 (_2!1341 lt!30801))) (bvsub (bvadd (bitIndex!0 (size!647 (buf!959 (_2!1341 lt!30465))) (currentByte!2254 (_2!1341 lt!30465)) (currentBit!2249 (_2!1341 lt!30465))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!30812 () Unit!1864)

(declare-fun Unit!1873 () Unit!1864)

(assert (=> b!21411 (= lt!30812 Unit!1873)))

(assert (=> b!21411 (= (bitIndex!0 (size!647 (buf!959 (_2!1341 lt!30801))) (currentByte!2254 (_2!1341 lt!30801)) (currentBit!2249 (_2!1341 lt!30801))) (bvsub (bvsub (bvadd (bitIndex!0 (size!647 (buf!959 (_2!1341 lt!30822))) (currentByte!2254 (_2!1341 lt!30822)) (currentBit!2249 (_2!1341 lt!30822))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!30803 () Unit!1864)

(declare-fun Unit!1874 () Unit!1864)

(assert (=> b!21411 (= lt!30803 Unit!1874)))

(declare-fun lt!30817 () tuple2!2514)

(assert (=> b!21411 (= lt!30817 (reader!0 (_2!1341 lt!30465) (_2!1341 lt!30801)))))

(declare-fun lt!30815 () (_ BitVec 64))

(assert (=> b!21411 (= lt!30815 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!30818 () Unit!1864)

(assert (=> b!21411 (= lt!30818 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1341 lt!30465) (buf!959 (_2!1341 lt!30801)) lt!30815))))

(assert (=> b!21411 (validate_offset_bits!1 ((_ sign_extend 32) (size!647 (buf!959 (_2!1341 lt!30801)))) ((_ sign_extend 32) (currentByte!2254 (_2!1341 lt!30465))) ((_ sign_extend 32) (currentBit!2249 (_2!1341 lt!30465))) lt!30815)))

(declare-fun lt!30820 () Unit!1864)

(assert (=> b!21411 (= lt!30820 lt!30818)))

(declare-fun lt!30793 () tuple2!2514)

(assert (=> b!21411 (= lt!30793 call!305)))

(declare-fun lt!30789 () (_ BitVec 64))

(assert (=> b!21411 (= lt!30789 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!30787 () Unit!1864)

(assert (=> b!21411 (= lt!30787 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1341 lt!30822) (buf!959 (_2!1341 lt!30801)) lt!30789))))

(assert (=> b!21411 (validate_offset_bits!1 ((_ sign_extend 32) (size!647 (buf!959 (_2!1341 lt!30801)))) ((_ sign_extend 32) (currentByte!2254 (_2!1341 lt!30822))) ((_ sign_extend 32) (currentBit!2249 (_2!1341 lt!30822))) lt!30789)))

(declare-fun lt!30816 () Unit!1864)

(assert (=> b!21411 (= lt!30816 lt!30787)))

(declare-fun lt!30823 () List!265)

(assert (=> b!21411 (= lt!30823 (byteArrayBitContentToList!0 (_2!1341 lt!30801) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!30829 () List!265)

(assert (=> b!21411 (= lt!30829 (byteArrayBitContentToList!0 (_2!1341 lt!30801) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!30786 () List!265)

(assert (=> b!21411 (= lt!30786 (bitStreamReadBitsIntoList!0 (_2!1341 lt!30801) (_1!1342 lt!30817) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!30814 () List!265)

(assert (=> b!21411 (= lt!30814 (bitStreamReadBitsIntoList!0 (_2!1341 lt!30801) (_1!1342 lt!30793) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!30800 () (_ BitVec 64))

(assert (=> b!21411 (= lt!30800 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!30792 () Unit!1864)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1128 BitStream!1128 BitStream!1128 BitStream!1128 (_ BitVec 64) List!265) Unit!1864)

(assert (=> b!21411 (= lt!30792 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1341 lt!30801) (_2!1341 lt!30801) (_1!1342 lt!30817) (_1!1342 lt!30793) lt!30800 lt!30786))))

(declare-fun tail!78 (List!265) List!265)

(assert (=> b!21411 (= (bitStreamReadBitsIntoList!0 (_2!1341 lt!30801) (_1!1342 lt!30793) (bvsub lt!30800 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!78 lt!30786))))

(declare-fun lt!30819 () Unit!1864)

(assert (=> b!21411 (= lt!30819 lt!30792)))

(declare-fun lt!30825 () (_ BitVec 64))

(declare-fun lt!30799 () Unit!1864)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1516 array!1516 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1864)

(assert (=> b!21411 (= lt!30799 (arrayBitRangesEqImpliesEq!0 (buf!959 (_2!1341 lt!30822)) (buf!959 (_2!1341 lt!30801)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!30825 (bitIndex!0 (size!647 (buf!959 (_2!1341 lt!30822))) (currentByte!2254 (_2!1341 lt!30822)) (currentBit!2249 (_2!1341 lt!30822)))))))

(declare-fun bitAt!0 (array!1516 (_ BitVec 64)) Bool)

(assert (=> b!21411 (= (bitAt!0 (buf!959 (_2!1341 lt!30822)) lt!30825) (bitAt!0 (buf!959 (_2!1341 lt!30801)) lt!30825))))

(declare-fun lt!30813 () Unit!1864)

(assert (=> b!21411 (= lt!30813 lt!30799)))

(declare-fun d!6802 () Bool)

(assert (=> d!6802 e!14545))

(declare-fun res!18515 () Bool)

(assert (=> d!6802 (=> (not res!18515) (not e!14545))))

(declare-fun lt!30811 () (_ BitVec 64))

(assert (=> d!6802 (= res!18515 (= (bitIndex!0 (size!647 (buf!959 (_2!1341 lt!30806))) (currentByte!2254 (_2!1341 lt!30806)) (currentBit!2249 (_2!1341 lt!30806))) (bvsub lt!30811 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!6802 (or (= (bvand lt!30811 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!30811 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!30811 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!30805 () (_ BitVec 64))

(assert (=> d!6802 (= lt!30811 (bvadd lt!30805 to!314))))

(assert (=> d!6802 (or (not (= (bvand lt!30805 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!30805 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!30805 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!6802 (= lt!30805 (bitIndex!0 (size!647 (buf!959 (_2!1341 lt!30465))) (currentByte!2254 (_2!1341 lt!30465)) (currentBit!2249 (_2!1341 lt!30465))))))

(assert (=> d!6802 (= lt!30806 e!14544)))

(assert (=> d!6802 (= c!1522 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!30826 () Unit!1864)

(declare-fun lt!30828 () Unit!1864)

(assert (=> d!6802 (= lt!30826 lt!30828)))

(assert (=> d!6802 (isPrefixOf!0 (_2!1341 lt!30465) (_2!1341 lt!30465))))

(assert (=> d!6802 (= lt!30828 (lemmaIsPrefixRefl!0 (_2!1341 lt!30465)))))

(assert (=> d!6802 (= lt!30825 (bitIndex!0 (size!647 (buf!959 (_2!1341 lt!30465))) (currentByte!2254 (_2!1341 lt!30465)) (currentBit!2249 (_2!1341 lt!30465))))))

(assert (=> d!6802 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!6802 (= (appendBitsMSBFirstLoop!0 (_2!1341 lt!30465) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!30806)))

(assert (= (and d!6802 c!1522) b!21411))

(assert (= (and d!6802 (not c!1522)) b!21412))

(assert (= (or b!21411 b!21412) bm!302))

(assert (= (and d!6802 res!18515) b!21409))

(assert (= (and b!21409 res!18512) b!21413))

(assert (= (and b!21413 res!18511) b!21406))

(assert (= (and b!21406 res!18514) b!21407))

(assert (= (and b!21407 res!18513) b!21410))

(assert (= (and b!21410 res!18510) b!21408))

(declare-fun m!29527 () Bool)

(assert (=> d!6802 m!29527))

(declare-fun m!29529 () Bool)

(assert (=> d!6802 m!29529))

(declare-fun m!29531 () Bool)

(assert (=> d!6802 m!29531))

(declare-fun m!29533 () Bool)

(assert (=> d!6802 m!29533))

(declare-fun m!29535 () Bool)

(assert (=> b!21412 m!29535))

(declare-fun m!29537 () Bool)

(assert (=> b!21412 m!29537))

(declare-fun m!29539 () Bool)

(assert (=> b!21408 m!29539))

(declare-fun m!29541 () Bool)

(assert (=> b!21410 m!29541))

(declare-fun m!29543 () Bool)

(assert (=> b!21410 m!29543))

(declare-fun m!29545 () Bool)

(assert (=> b!21410 m!29545))

(declare-fun m!29547 () Bool)

(assert (=> b!21410 m!29547))

(declare-fun m!29549 () Bool)

(assert (=> b!21410 m!29549))

(declare-fun m!29551 () Bool)

(assert (=> bm!302 m!29551))

(declare-fun m!29553 () Bool)

(assert (=> b!21406 m!29553))

(declare-fun m!29555 () Bool)

(assert (=> b!21409 m!29555))

(declare-fun m!29557 () Bool)

(assert (=> b!21411 m!29557))

(declare-fun m!29559 () Bool)

(assert (=> b!21411 m!29559))

(declare-fun m!29561 () Bool)

(assert (=> b!21411 m!29561))

(declare-fun m!29563 () Bool)

(assert (=> b!21411 m!29563))

(declare-fun m!29565 () Bool)

(assert (=> b!21411 m!29565))

(declare-fun m!29567 () Bool)

(assert (=> b!21411 m!29567))

(declare-fun m!29569 () Bool)

(assert (=> b!21411 m!29569))

(declare-fun m!29571 () Bool)

(assert (=> b!21411 m!29571))

(assert (=> b!21411 m!29529))

(declare-fun m!29573 () Bool)

(assert (=> b!21411 m!29573))

(declare-fun m!29575 () Bool)

(assert (=> b!21411 m!29575))

(declare-fun m!29577 () Bool)

(assert (=> b!21411 m!29577))

(declare-fun m!29579 () Bool)

(assert (=> b!21411 m!29579))

(declare-fun m!29581 () Bool)

(assert (=> b!21411 m!29581))

(declare-fun m!29583 () Bool)

(assert (=> b!21411 m!29583))

(declare-fun m!29585 () Bool)

(assert (=> b!21411 m!29585))

(declare-fun m!29587 () Bool)

(assert (=> b!21411 m!29587))

(declare-fun m!29589 () Bool)

(assert (=> b!21411 m!29589))

(declare-fun m!29591 () Bool)

(assert (=> b!21411 m!29591))

(declare-fun m!29593 () Bool)

(assert (=> b!21411 m!29593))

(declare-fun m!29595 () Bool)

(assert (=> b!21411 m!29595))

(declare-fun m!29597 () Bool)

(assert (=> b!21411 m!29597))

(declare-fun m!29599 () Bool)

(assert (=> b!21411 m!29599))

(assert (=> b!21411 m!29573))

(declare-fun m!29601 () Bool)

(assert (=> b!21411 m!29601))

(declare-fun m!29603 () Bool)

(assert (=> b!21411 m!29603))

(assert (=> b!21411 m!29559))

(declare-fun m!29605 () Bool)

(assert (=> b!21411 m!29605))

(assert (=> b!21411 m!29603))

(declare-fun m!29607 () Bool)

(assert (=> b!21411 m!29607))

(declare-fun m!29609 () Bool)

(assert (=> b!21411 m!29609))

(assert (=> b!21411 m!29565))

(declare-fun m!29611 () Bool)

(assert (=> b!21411 m!29611))

(declare-fun m!29613 () Bool)

(assert (=> b!21411 m!29613))

(declare-fun m!29615 () Bool)

(assert (=> b!21411 m!29615))

(declare-fun m!29617 () Bool)

(assert (=> b!21411 m!29617))

(assert (=> b!21268 d!6802))

(declare-fun d!6846 () Bool)

(assert (=> d!6846 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!647 (buf!959 (_2!1341 lt!30465)))) ((_ sign_extend 32) (currentByte!2254 thiss!1379)) ((_ sign_extend 32) (currentBit!2249 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!647 (buf!959 (_2!1341 lt!30465)))) ((_ sign_extend 32) (currentByte!2254 thiss!1379)) ((_ sign_extend 32) (currentBit!2249 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2015 () Bool)

(assert (= bs!2015 d!6846))

(declare-fun m!29619 () Bool)

(assert (=> bs!2015 m!29619))

(assert (=> b!21268 d!6846))

(declare-fun d!6848 () Bool)

(declare-fun res!18517 () Bool)

(declare-fun e!14548 () Bool)

(assert (=> d!6848 (=> (not res!18517) (not e!14548))))

(assert (=> d!6848 (= res!18517 (= (size!647 (buf!959 (_2!1341 lt!30465))) (size!647 (buf!959 (_2!1341 lt!30472)))))))

(assert (=> d!6848 (= (isPrefixOf!0 (_2!1341 lt!30465) (_2!1341 lt!30472)) e!14548)))

(declare-fun b!21414 () Bool)

(declare-fun res!18518 () Bool)

(assert (=> b!21414 (=> (not res!18518) (not e!14548))))

(assert (=> b!21414 (= res!18518 (bvsle (bitIndex!0 (size!647 (buf!959 (_2!1341 lt!30465))) (currentByte!2254 (_2!1341 lt!30465)) (currentBit!2249 (_2!1341 lt!30465))) (bitIndex!0 (size!647 (buf!959 (_2!1341 lt!30472))) (currentByte!2254 (_2!1341 lt!30472)) (currentBit!2249 (_2!1341 lt!30472)))))))

(declare-fun b!21415 () Bool)

(declare-fun e!14547 () Bool)

(assert (=> b!21415 (= e!14548 e!14547)))

(declare-fun res!18516 () Bool)

(assert (=> b!21415 (=> res!18516 e!14547)))

(assert (=> b!21415 (= res!18516 (= (size!647 (buf!959 (_2!1341 lt!30465))) #b00000000000000000000000000000000))))

(declare-fun b!21416 () Bool)

(assert (=> b!21416 (= e!14547 (arrayBitRangesEq!0 (buf!959 (_2!1341 lt!30465)) (buf!959 (_2!1341 lt!30472)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!647 (buf!959 (_2!1341 lt!30465))) (currentByte!2254 (_2!1341 lt!30465)) (currentBit!2249 (_2!1341 lt!30465)))))))

(assert (= (and d!6848 res!18517) b!21414))

(assert (= (and b!21414 res!18518) b!21415))

(assert (= (and b!21415 (not res!18516)) b!21416))

(assert (=> b!21414 m!29529))

(declare-fun m!29621 () Bool)

(assert (=> b!21414 m!29621))

(assert (=> b!21416 m!29529))

(assert (=> b!21416 m!29529))

(declare-fun m!29623 () Bool)

(assert (=> b!21416 m!29623))

(assert (=> b!21268 d!6848))

(declare-fun d!6850 () Bool)

(assert (=> d!6850 (isPrefixOf!0 thiss!1379 (_2!1341 lt!30472))))

(declare-fun lt!30832 () Unit!1864)

(declare-fun choose!30 (BitStream!1128 BitStream!1128 BitStream!1128) Unit!1864)

(assert (=> d!6850 (= lt!30832 (choose!30 thiss!1379 (_2!1341 lt!30465) (_2!1341 lt!30472)))))

(assert (=> d!6850 (isPrefixOf!0 thiss!1379 (_2!1341 lt!30465))))

(assert (=> d!6850 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1341 lt!30465) (_2!1341 lt!30472)) lt!30832)))

(declare-fun bs!2016 () Bool)

(assert (= bs!2016 d!6850))

(assert (=> bs!2016 m!29343))

(declare-fun m!29625 () Bool)

(assert (=> bs!2016 m!29625))

(assert (=> bs!2016 m!29359))

(assert (=> b!21268 d!6850))

(declare-fun d!6852 () Bool)

(assert (=> d!6852 (validate_offset_bits!1 ((_ sign_extend 32) (size!647 (buf!959 (_2!1341 lt!30465)))) ((_ sign_extend 32) (currentByte!2254 thiss!1379)) ((_ sign_extend 32) (currentBit!2249 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!30835 () Unit!1864)

(declare-fun choose!9 (BitStream!1128 array!1516 (_ BitVec 64) BitStream!1128) Unit!1864)

(assert (=> d!6852 (= lt!30835 (choose!9 thiss!1379 (buf!959 (_2!1341 lt!30465)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1129 (buf!959 (_2!1341 lt!30465)) (currentByte!2254 thiss!1379) (currentBit!2249 thiss!1379))))))

(assert (=> d!6852 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!959 (_2!1341 lt!30465)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!30835)))

(declare-fun bs!2017 () Bool)

(assert (= bs!2017 d!6852))

(assert (=> bs!2017 m!29353))

(declare-fun m!29627 () Bool)

(assert (=> bs!2017 m!29627))

(assert (=> b!21268 d!6852))

(declare-fun b!21427 () Bool)

(declare-fun res!18527 () Bool)

(declare-fun e!14554 () Bool)

(assert (=> b!21427 (=> (not res!18527) (not e!14554))))

(declare-fun lt!30882 () tuple2!2514)

(assert (=> b!21427 (= res!18527 (isPrefixOf!0 (_1!1342 lt!30882) thiss!1379))))

(declare-fun b!21428 () Bool)

(declare-fun e!14553 () Unit!1864)

(declare-fun lt!30890 () Unit!1864)

(assert (=> b!21428 (= e!14553 lt!30890)))

(declare-fun lt!30877 () (_ BitVec 64))

(assert (=> b!21428 (= lt!30877 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!30880 () (_ BitVec 64))

(assert (=> b!21428 (= lt!30880 (bitIndex!0 (size!647 (buf!959 thiss!1379)) (currentByte!2254 thiss!1379) (currentBit!2249 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1516 array!1516 (_ BitVec 64) (_ BitVec 64)) Unit!1864)

(assert (=> b!21428 (= lt!30890 (arrayBitRangesEqSymmetric!0 (buf!959 thiss!1379) (buf!959 (_2!1341 lt!30465)) lt!30877 lt!30880))))

(assert (=> b!21428 (arrayBitRangesEq!0 (buf!959 (_2!1341 lt!30465)) (buf!959 thiss!1379) lt!30877 lt!30880)))

(declare-fun d!6854 () Bool)

(assert (=> d!6854 e!14554))

(declare-fun res!18525 () Bool)

(assert (=> d!6854 (=> (not res!18525) (not e!14554))))

(assert (=> d!6854 (= res!18525 (isPrefixOf!0 (_1!1342 lt!30882) (_2!1342 lt!30882)))))

(declare-fun lt!30881 () BitStream!1128)

(assert (=> d!6854 (= lt!30882 (tuple2!2515 lt!30881 (_2!1341 lt!30465)))))

(declare-fun lt!30892 () Unit!1864)

(declare-fun lt!30887 () Unit!1864)

(assert (=> d!6854 (= lt!30892 lt!30887)))

(assert (=> d!6854 (isPrefixOf!0 lt!30881 (_2!1341 lt!30465))))

(assert (=> d!6854 (= lt!30887 (lemmaIsPrefixTransitive!0 lt!30881 (_2!1341 lt!30465) (_2!1341 lt!30465)))))

(declare-fun lt!30879 () Unit!1864)

(declare-fun lt!30883 () Unit!1864)

(assert (=> d!6854 (= lt!30879 lt!30883)))

(assert (=> d!6854 (isPrefixOf!0 lt!30881 (_2!1341 lt!30465))))

(assert (=> d!6854 (= lt!30883 (lemmaIsPrefixTransitive!0 lt!30881 thiss!1379 (_2!1341 lt!30465)))))

(declare-fun lt!30891 () Unit!1864)

(assert (=> d!6854 (= lt!30891 e!14553)))

(declare-fun c!1525 () Bool)

(assert (=> d!6854 (= c!1525 (not (= (size!647 (buf!959 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!30894 () Unit!1864)

(declare-fun lt!30885 () Unit!1864)

(assert (=> d!6854 (= lt!30894 lt!30885)))

(assert (=> d!6854 (isPrefixOf!0 (_2!1341 lt!30465) (_2!1341 lt!30465))))

(assert (=> d!6854 (= lt!30885 (lemmaIsPrefixRefl!0 (_2!1341 lt!30465)))))

(declare-fun lt!30886 () Unit!1864)

(declare-fun lt!30895 () Unit!1864)

(assert (=> d!6854 (= lt!30886 lt!30895)))

(assert (=> d!6854 (= lt!30895 (lemmaIsPrefixRefl!0 (_2!1341 lt!30465)))))

(declare-fun lt!30876 () Unit!1864)

(declare-fun lt!30889 () Unit!1864)

(assert (=> d!6854 (= lt!30876 lt!30889)))

(assert (=> d!6854 (isPrefixOf!0 lt!30881 lt!30881)))

(assert (=> d!6854 (= lt!30889 (lemmaIsPrefixRefl!0 lt!30881))))

(declare-fun lt!30878 () Unit!1864)

(declare-fun lt!30884 () Unit!1864)

(assert (=> d!6854 (= lt!30878 lt!30884)))

(assert (=> d!6854 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!6854 (= lt!30884 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!6854 (= lt!30881 (BitStream!1129 (buf!959 (_2!1341 lt!30465)) (currentByte!2254 thiss!1379) (currentBit!2249 thiss!1379)))))

(assert (=> d!6854 (isPrefixOf!0 thiss!1379 (_2!1341 lt!30465))))

(assert (=> d!6854 (= (reader!0 thiss!1379 (_2!1341 lt!30465)) lt!30882)))

(declare-fun b!21429 () Bool)

(declare-fun lt!30888 () (_ BitVec 64))

(declare-fun lt!30893 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1128 (_ BitVec 64)) BitStream!1128)

(assert (=> b!21429 (= e!14554 (= (_1!1342 lt!30882) (withMovedBitIndex!0 (_2!1342 lt!30882) (bvsub lt!30888 lt!30893))))))

(assert (=> b!21429 (or (= (bvand lt!30888 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!30893 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!30888 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!30888 lt!30893) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!21429 (= lt!30893 (bitIndex!0 (size!647 (buf!959 (_2!1341 lt!30465))) (currentByte!2254 (_2!1341 lt!30465)) (currentBit!2249 (_2!1341 lt!30465))))))

(assert (=> b!21429 (= lt!30888 (bitIndex!0 (size!647 (buf!959 thiss!1379)) (currentByte!2254 thiss!1379) (currentBit!2249 thiss!1379)))))

(declare-fun b!21430 () Bool)

(declare-fun res!18526 () Bool)

(assert (=> b!21430 (=> (not res!18526) (not e!14554))))

(assert (=> b!21430 (= res!18526 (isPrefixOf!0 (_2!1342 lt!30882) (_2!1341 lt!30465)))))

(declare-fun b!21431 () Bool)

(declare-fun Unit!1875 () Unit!1864)

(assert (=> b!21431 (= e!14553 Unit!1875)))

(assert (= (and d!6854 c!1525) b!21428))

(assert (= (and d!6854 (not c!1525)) b!21431))

(assert (= (and d!6854 res!18525) b!21427))

(assert (= (and b!21427 res!18527) b!21430))

(assert (= (and b!21430 res!18526) b!21429))

(assert (=> b!21428 m!29335))

(declare-fun m!29629 () Bool)

(assert (=> b!21428 m!29629))

(declare-fun m!29631 () Bool)

(assert (=> b!21428 m!29631))

(declare-fun m!29633 () Bool)

(assert (=> b!21427 m!29633))

(assert (=> d!6854 m!29531))

(declare-fun m!29635 () Bool)

(assert (=> d!6854 m!29635))

(declare-fun m!29637 () Bool)

(assert (=> d!6854 m!29637))

(declare-fun m!29639 () Bool)

(assert (=> d!6854 m!29639))

(declare-fun m!29641 () Bool)

(assert (=> d!6854 m!29641))

(assert (=> d!6854 m!29533))

(assert (=> d!6854 m!29333))

(declare-fun m!29643 () Bool)

(assert (=> d!6854 m!29643))

(declare-fun m!29645 () Bool)

(assert (=> d!6854 m!29645))

(assert (=> d!6854 m!29359))

(assert (=> d!6854 m!29331))

(declare-fun m!29647 () Bool)

(assert (=> b!21430 m!29647))

(declare-fun m!29649 () Bool)

(assert (=> b!21429 m!29649))

(assert (=> b!21429 m!29529))

(assert (=> b!21429 m!29335))

(assert (=> b!21268 d!6854))

(declare-fun d!6856 () Bool)

(declare-fun res!18529 () Bool)

(declare-fun e!14556 () Bool)

(assert (=> d!6856 (=> (not res!18529) (not e!14556))))

(assert (=> d!6856 (= res!18529 (= (size!647 (buf!959 thiss!1379)) (size!647 (buf!959 (_2!1341 lt!30472)))))))

(assert (=> d!6856 (= (isPrefixOf!0 thiss!1379 (_2!1341 lt!30472)) e!14556)))

(declare-fun b!21432 () Bool)

(declare-fun res!18530 () Bool)

(assert (=> b!21432 (=> (not res!18530) (not e!14556))))

(assert (=> b!21432 (= res!18530 (bvsle (bitIndex!0 (size!647 (buf!959 thiss!1379)) (currentByte!2254 thiss!1379) (currentBit!2249 thiss!1379)) (bitIndex!0 (size!647 (buf!959 (_2!1341 lt!30472))) (currentByte!2254 (_2!1341 lt!30472)) (currentBit!2249 (_2!1341 lt!30472)))))))

(declare-fun b!21433 () Bool)

(declare-fun e!14555 () Bool)

(assert (=> b!21433 (= e!14556 e!14555)))

(declare-fun res!18528 () Bool)

(assert (=> b!21433 (=> res!18528 e!14555)))

(assert (=> b!21433 (= res!18528 (= (size!647 (buf!959 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!21434 () Bool)

(assert (=> b!21434 (= e!14555 (arrayBitRangesEq!0 (buf!959 thiss!1379) (buf!959 (_2!1341 lt!30472)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!647 (buf!959 thiss!1379)) (currentByte!2254 thiss!1379) (currentBit!2249 thiss!1379))))))

(assert (= (and d!6856 res!18529) b!21432))

(assert (= (and b!21432 res!18530) b!21433))

(assert (= (and b!21433 (not res!18528)) b!21434))

(assert (=> b!21432 m!29335))

(assert (=> b!21432 m!29621))

(assert (=> b!21434 m!29335))

(assert (=> b!21434 m!29335))

(declare-fun m!29651 () Bool)

(assert (=> b!21434 m!29651))

(assert (=> b!21268 d!6856))

(declare-fun d!6858 () Bool)

(declare-fun res!18532 () Bool)

(declare-fun e!14558 () Bool)

(assert (=> d!6858 (=> (not res!18532) (not e!14558))))

(assert (=> d!6858 (= res!18532 (= (size!647 (buf!959 thiss!1379)) (size!647 (buf!959 (_2!1341 lt!30465)))))))

(assert (=> d!6858 (= (isPrefixOf!0 thiss!1379 (_2!1341 lt!30465)) e!14558)))

(declare-fun b!21435 () Bool)

(declare-fun res!18533 () Bool)

(assert (=> b!21435 (=> (not res!18533) (not e!14558))))

(assert (=> b!21435 (= res!18533 (bvsle (bitIndex!0 (size!647 (buf!959 thiss!1379)) (currentByte!2254 thiss!1379) (currentBit!2249 thiss!1379)) (bitIndex!0 (size!647 (buf!959 (_2!1341 lt!30465))) (currentByte!2254 (_2!1341 lt!30465)) (currentBit!2249 (_2!1341 lt!30465)))))))

(declare-fun b!21436 () Bool)

(declare-fun e!14557 () Bool)

(assert (=> b!21436 (= e!14558 e!14557)))

(declare-fun res!18531 () Bool)

(assert (=> b!21436 (=> res!18531 e!14557)))

(assert (=> b!21436 (= res!18531 (= (size!647 (buf!959 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!21437 () Bool)

(assert (=> b!21437 (= e!14557 (arrayBitRangesEq!0 (buf!959 thiss!1379) (buf!959 (_2!1341 lt!30465)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!647 (buf!959 thiss!1379)) (currentByte!2254 thiss!1379) (currentBit!2249 thiss!1379))))))

(assert (= (and d!6858 res!18532) b!21435))

(assert (= (and b!21435 res!18533) b!21436))

(assert (= (and b!21436 (not res!18531)) b!21437))

(assert (=> b!21435 m!29335))

(assert (=> b!21435 m!29529))

(assert (=> b!21437 m!29335))

(assert (=> b!21437 m!29335))

(declare-fun m!29653 () Bool)

(assert (=> b!21437 m!29653))

(assert (=> b!21270 d!6858))

(declare-fun d!6860 () Bool)

(assert (=> d!6860 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!647 (buf!959 (_2!1341 lt!30465)))) ((_ sign_extend 32) (currentByte!2254 (_2!1341 lt!30465))) ((_ sign_extend 32) (currentBit!2249 (_2!1341 lt!30465))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!647 (buf!959 (_2!1341 lt!30465)))) ((_ sign_extend 32) (currentByte!2254 (_2!1341 lt!30465))) ((_ sign_extend 32) (currentBit!2249 (_2!1341 lt!30465)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!2018 () Bool)

(assert (= bs!2018 d!6860))

(declare-fun m!29655 () Bool)

(assert (=> bs!2018 m!29655))

(assert (=> b!21270 d!6860))

(declare-fun d!6862 () Bool)

(declare-fun e!14563 () Bool)

(assert (=> d!6862 e!14563))

(declare-fun res!18536 () Bool)

(assert (=> d!6862 (=> (not res!18536) (not e!14563))))

(assert (=> d!6862 (= res!18536 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!30936 () Unit!1864)

(declare-fun choose!27 (BitStream!1128 BitStream!1128 (_ BitVec 64) (_ BitVec 64)) Unit!1864)

(assert (=> d!6862 (= lt!30936 (choose!27 thiss!1379 (_2!1341 lt!30465) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!6862 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!6862 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1341 lt!30465) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!30936)))

(declare-fun b!21444 () Bool)

(assert (=> b!21444 (= e!14563 (validate_offset_bits!1 ((_ sign_extend 32) (size!647 (buf!959 (_2!1341 lt!30465)))) ((_ sign_extend 32) (currentByte!2254 (_2!1341 lt!30465))) ((_ sign_extend 32) (currentBit!2249 (_2!1341 lt!30465))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!6862 res!18536) b!21444))

(declare-fun m!29657 () Bool)

(assert (=> d!6862 m!29657))

(assert (=> b!21444 m!29361))

(assert (=> b!21270 d!6862))

(declare-fun b!21509 () Bool)

(declare-fun res!18581 () Bool)

(declare-fun e!14597 () Bool)

(assert (=> b!21509 (=> (not res!18581) (not e!14597))))

(declare-fun lt!31078 () (_ BitVec 64))

(declare-fun lt!31071 () (_ BitVec 64))

(declare-fun lt!31077 () tuple2!2512)

(assert (=> b!21509 (= res!18581 (= (bitIndex!0 (size!647 (buf!959 (_2!1341 lt!31077))) (currentByte!2254 (_2!1341 lt!31077)) (currentBit!2249 (_2!1341 lt!31077))) (bvadd lt!31071 lt!31078)))))

(assert (=> b!21509 (or (not (= (bvand lt!31071 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!31078 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!31071 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!31071 lt!31078) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!21509 (= lt!31078 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!21509 (= lt!31071 (bitIndex!0 (size!647 (buf!959 thiss!1379)) (currentByte!2254 thiss!1379) (currentBit!2249 thiss!1379)))))

(declare-fun b!21510 () Bool)

(declare-fun e!14596 () Bool)

(assert (=> b!21510 (= e!14597 e!14596)))

(declare-fun res!18586 () Bool)

(assert (=> b!21510 (=> (not res!18586) (not e!14596))))

(declare-datatypes ((tuple2!2526 0))(
  ( (tuple2!2527 (_1!1348 BitStream!1128) (_2!1348 Bool)) )
))
(declare-fun lt!31070 () tuple2!2526)

(declare-fun lt!31075 () (_ BitVec 8))

(assert (=> b!21510 (= res!18586 (and (= (_2!1348 lt!31070) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1094 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!31075)) #b00000000000000000000000000000000))) (= (_1!1348 lt!31070) (_2!1341 lt!31077))))))

(declare-fun lt!31068 () tuple2!2524)

(declare-fun lt!31072 () BitStream!1128)

(assert (=> b!21510 (= lt!31068 (readBits!0 lt!31072 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1128) tuple2!2526)

(assert (=> b!21510 (= lt!31070 (readBitPure!0 lt!31072))))

(declare-fun readerFrom!0 (BitStream!1128 (_ BitVec 32) (_ BitVec 32)) BitStream!1128)

(assert (=> b!21510 (= lt!31072 (readerFrom!0 (_2!1341 lt!31077) (currentBit!2249 thiss!1379) (currentByte!2254 thiss!1379)))))

(declare-fun b!21511 () Bool)

(assert (=> b!21511 (= e!14596 (= (bitIndex!0 (size!647 (buf!959 (_1!1348 lt!31070))) (currentByte!2254 (_1!1348 lt!31070)) (currentBit!2249 (_1!1348 lt!31070))) (bitIndex!0 (size!647 (buf!959 (_2!1341 lt!31077))) (currentByte!2254 (_2!1341 lt!31077)) (currentBit!2249 (_2!1341 lt!31077)))))))

(declare-fun b!21512 () Bool)

(declare-fun res!18580 () Bool)

(declare-fun e!14595 () Bool)

(assert (=> b!21512 (=> (not res!18580) (not e!14595))))

(declare-fun lt!31074 () tuple2!2512)

(assert (=> b!21512 (= res!18580 (isPrefixOf!0 thiss!1379 (_2!1341 lt!31074)))))

(declare-fun b!21513 () Bool)

(declare-fun res!18585 () Bool)

(assert (=> b!21513 (=> (not res!18585) (not e!14595))))

(assert (=> b!21513 (= res!18585 (= (bitIndex!0 (size!647 (buf!959 (_2!1341 lt!31074))) (currentByte!2254 (_2!1341 lt!31074)) (currentBit!2249 (_2!1341 lt!31074))) (bvadd (bitIndex!0 (size!647 (buf!959 thiss!1379)) (currentByte!2254 thiss!1379) (currentBit!2249 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!21514 () Bool)

(declare-fun res!18582 () Bool)

(assert (=> b!21514 (=> (not res!18582) (not e!14597))))

(assert (=> b!21514 (= res!18582 (isPrefixOf!0 thiss!1379 (_2!1341 lt!31077)))))

(declare-fun d!6864 () Bool)

(assert (=> d!6864 e!14597))

(declare-fun res!18587 () Bool)

(assert (=> d!6864 (=> (not res!18587) (not e!14597))))

(assert (=> d!6864 (= res!18587 (= (size!647 (buf!959 (_2!1341 lt!31077))) (size!647 (buf!959 thiss!1379))))))

(declare-fun lt!31076 () array!1516)

(assert (=> d!6864 (= lt!31075 (select (arr!1094 lt!31076) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!6864 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!647 lt!31076)))))

(assert (=> d!6864 (= lt!31076 (array!1517 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!31073 () tuple2!2512)

(assert (=> d!6864 (= lt!31077 (tuple2!2513 (_1!1341 lt!31073) (_2!1341 lt!31073)))))

(assert (=> d!6864 (= lt!31073 lt!31074)))

(assert (=> d!6864 e!14595))

(declare-fun res!18584 () Bool)

(assert (=> d!6864 (=> (not res!18584) (not e!14595))))

(assert (=> d!6864 (= res!18584 (= (size!647 (buf!959 thiss!1379)) (size!647 (buf!959 (_2!1341 lt!31074)))))))

(declare-fun lt!31067 () Bool)

(declare-fun appendBit!0 (BitStream!1128 Bool) tuple2!2512)

(assert (=> d!6864 (= lt!31074 (appendBit!0 thiss!1379 lt!31067))))

(assert (=> d!6864 (= lt!31067 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1094 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!6864 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!6864 (= (appendBitFromByte!0 thiss!1379 (select (arr!1094 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!31077)))

(declare-fun b!21515 () Bool)

(declare-fun e!14598 () Bool)

(assert (=> b!21515 (= e!14595 e!14598)))

(declare-fun res!18583 () Bool)

(assert (=> b!21515 (=> (not res!18583) (not e!14598))))

(declare-fun lt!31069 () tuple2!2526)

(assert (=> b!21515 (= res!18583 (and (= (_2!1348 lt!31069) lt!31067) (= (_1!1348 lt!31069) (_2!1341 lt!31074))))))

(assert (=> b!21515 (= lt!31069 (readBitPure!0 (readerFrom!0 (_2!1341 lt!31074) (currentBit!2249 thiss!1379) (currentByte!2254 thiss!1379))))))

(declare-fun b!21516 () Bool)

(assert (=> b!21516 (= e!14598 (= (bitIndex!0 (size!647 (buf!959 (_1!1348 lt!31069))) (currentByte!2254 (_1!1348 lt!31069)) (currentBit!2249 (_1!1348 lt!31069))) (bitIndex!0 (size!647 (buf!959 (_2!1341 lt!31074))) (currentByte!2254 (_2!1341 lt!31074)) (currentBit!2249 (_2!1341 lt!31074)))))))

(assert (= (and d!6864 res!18584) b!21513))

(assert (= (and b!21513 res!18585) b!21512))

(assert (= (and b!21512 res!18580) b!21515))

(assert (= (and b!21515 res!18583) b!21516))

(assert (= (and d!6864 res!18587) b!21509))

(assert (= (and b!21509 res!18581) b!21514))

(assert (= (and b!21514 res!18582) b!21510))

(assert (= (and b!21510 res!18586) b!21511))

(declare-fun m!29765 () Bool)

(assert (=> b!21512 m!29765))

(declare-fun m!29767 () Bool)

(assert (=> b!21513 m!29767))

(assert (=> b!21513 m!29335))

(declare-fun m!29769 () Bool)

(assert (=> b!21515 m!29769))

(assert (=> b!21515 m!29769))

(declare-fun m!29771 () Bool)

(assert (=> b!21515 m!29771))

(declare-fun m!29773 () Bool)

(assert (=> b!21510 m!29773))

(declare-fun m!29775 () Bool)

(assert (=> b!21510 m!29775))

(declare-fun m!29777 () Bool)

(assert (=> b!21510 m!29777))

(declare-fun m!29779 () Bool)

(assert (=> d!6864 m!29779))

(declare-fun m!29781 () Bool)

(assert (=> d!6864 m!29781))

(assert (=> d!6864 m!29433))

(declare-fun m!29783 () Bool)

(assert (=> b!21511 m!29783))

(declare-fun m!29785 () Bool)

(assert (=> b!21511 m!29785))

(assert (=> b!21509 m!29785))

(assert (=> b!21509 m!29335))

(declare-fun m!29787 () Bool)

(assert (=> b!21514 m!29787))

(declare-fun m!29789 () Bool)

(assert (=> b!21516 m!29789))

(assert (=> b!21516 m!29767))

(assert (=> b!21270 d!6864))

(declare-fun d!6892 () Bool)

(assert (=> d!6892 (= (array_inv!617 srcBuffer!2) (bvsge (size!647 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!5274 d!6892))

(declare-fun d!6894 () Bool)

(assert (=> d!6894 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2249 thiss!1379) (currentByte!2254 thiss!1379) (size!647 (buf!959 thiss!1379))))))

(declare-fun bs!2021 () Bool)

(assert (= bs!2021 d!6894))

(assert (=> bs!2021 m!29369))

(assert (=> start!5274 d!6894))

(check-sat (not b!21512) (not b!21325) (not b!21515) (not b!21432) (not b!21324) (not b!21430) (not d!6862) (not b!21428) (not d!6784) (not bm!302) (not d!6894) (not b!21513) (not b!21412) (not b!21410) (not d!6864) (not b!21416) (not d!6846) (not b!21300) (not b!21302) (not b!21511) (not b!21437) (not b!21444) (not b!21509) (not d!6786) (not b!21516) (not b!21406) (not b!21411) (not b!21434) (not d!6800) (not b!21427) (not d!6854) (not d!6852) (not b!21514) (not d!6850) (not b!21408) (not b!21409) (not b!21429) (not d!6802) (not b!21314) (not b!21435) (not b!21414) (not b!21510) (not d!6860) (not b!21326))
