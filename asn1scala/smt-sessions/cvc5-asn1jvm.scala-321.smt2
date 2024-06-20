; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6920 () Bool)

(assert start!6920)

(declare-fun e!22101 () Bool)

(declare-datatypes ((array!1856 0))(
  ( (array!1857 (arr!1295 (Array (_ BitVec 32) (_ BitVec 8))) (size!820 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1432 0))(
  ( (BitStream!1433 (buf!1148 array!1856) (currentByte!2515 (_ BitVec 32)) (currentBit!2510 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2495 0))(
  ( (Unit!2496) )
))
(declare-datatypes ((tuple2!3394 0))(
  ( (tuple2!3395 (_1!1784 Unit!2495) (_2!1784 BitStream!1432)) )
))
(declare-fun lt!49039 () tuple2!3394)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((tuple2!3396 0))(
  ( (tuple2!3397 (_1!1785 BitStream!1432) (_2!1785 BitStream!1432)) )
))
(declare-fun lt!49032 () tuple2!3396)

(declare-fun srcBuffer!2 () array!1856)

(declare-fun b!33322 () Bool)

(declare-datatypes ((List!417 0))(
  ( (Nil!414) (Cons!413 (h!532 Bool) (t!1167 List!417)) )
))
(declare-fun head!254 (List!417) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1432 array!1856 (_ BitVec 64) (_ BitVec 64)) List!417)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1432 BitStream!1432 (_ BitVec 64)) List!417)

(assert (=> b!33322 (= e!22101 (= (head!254 (byteArrayBitContentToList!0 (_2!1784 lt!49039) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!254 (bitStreamReadBitsIntoList!0 (_2!1784 lt!49039) (_1!1785 lt!49032) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!33323 () Bool)

(declare-fun res!28536 () Bool)

(declare-fun e!22096 () Bool)

(assert (=> b!33323 (=> res!28536 e!22096)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!33323 (= res!28536 (not (invariant!0 (currentBit!2510 (_2!1784 lt!49039)) (currentByte!2515 (_2!1784 lt!49039)) (size!820 (buf!1148 (_2!1784 lt!49039))))))))

(declare-fun b!33324 () Bool)

(declare-fun res!28544 () Bool)

(declare-fun e!22105 () Bool)

(assert (=> b!33324 (=> res!28544 e!22105)))

(declare-fun lt!49031 () List!417)

(declare-fun length!143 (List!417) Int)

(assert (=> b!33324 (= res!28544 (<= (length!143 lt!49031) 0))))

(declare-fun b!33325 () Bool)

(declare-fun e!22102 () Bool)

(declare-fun e!22097 () Bool)

(assert (=> b!33325 (= e!22102 e!22097)))

(declare-fun res!28542 () Bool)

(assert (=> b!33325 (=> res!28542 e!22097)))

(declare-fun lt!49029 () tuple2!3394)

(declare-fun isPrefixOf!0 (BitStream!1432 BitStream!1432) Bool)

(assert (=> b!33325 (= res!28542 (not (isPrefixOf!0 (_2!1784 lt!49039) (_2!1784 lt!49029))))))

(declare-fun thiss!1379 () BitStream!1432)

(assert (=> b!33325 (isPrefixOf!0 thiss!1379 (_2!1784 lt!49029))))

(declare-fun lt!49037 () Unit!2495)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1432 BitStream!1432 BitStream!1432) Unit!2495)

(assert (=> b!33325 (= lt!49037 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1784 lt!49039) (_2!1784 lt!49029)))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1432 array!1856 (_ BitVec 64) (_ BitVec 64)) tuple2!3394)

(assert (=> b!33325 (= lt!49029 (appendBitsMSBFirstLoop!0 (_2!1784 lt!49039) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!33325 e!22101))

(declare-fun res!28538 () Bool)

(assert (=> b!33325 (=> (not res!28538) (not e!22101))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!33325 (= res!28538 (validate_offset_bits!1 ((_ sign_extend 32) (size!820 (buf!1148 (_2!1784 lt!49039)))) ((_ sign_extend 32) (currentByte!2515 thiss!1379)) ((_ sign_extend 32) (currentBit!2510 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!49030 () Unit!2495)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1432 array!1856 (_ BitVec 64)) Unit!2495)

(assert (=> b!33325 (= lt!49030 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1148 (_2!1784 lt!49039)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1432 BitStream!1432) tuple2!3396)

(assert (=> b!33325 (= lt!49032 (reader!0 thiss!1379 (_2!1784 lt!49039)))))

(declare-fun e!22103 () Bool)

(declare-fun b!33326 () Bool)

(declare-fun lt!49034 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!33326 (= e!22103 (= lt!49034 (bvsub (bvsub (bvadd (bitIndex!0 (size!820 (buf!1148 (_2!1784 lt!49039))) (currentByte!2515 (_2!1784 lt!49039)) (currentBit!2510 (_2!1784 lt!49039))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!33327 () Bool)

(declare-fun res!28547 () Bool)

(declare-fun e!22098 () Bool)

(assert (=> b!33327 (=> res!28547 e!22098)))

(assert (=> b!33327 (= res!28547 (not (invariant!0 (currentBit!2510 (_2!1784 lt!49029)) (currentByte!2515 (_2!1784 lt!49029)) (size!820 (buf!1148 (_2!1784 lt!49029))))))))

(declare-fun b!33328 () Bool)

(assert (=> b!33328 (= e!22097 e!22098)))

(declare-fun res!28546 () Bool)

(assert (=> b!33328 (=> res!28546 e!22098)))

(declare-fun lt!49026 () (_ BitVec 64))

(assert (=> b!33328 (= res!28546 (not (= lt!49034 (bvsub (bvadd lt!49026 to!314) i!635))))))

(assert (=> b!33328 (= lt!49034 (bitIndex!0 (size!820 (buf!1148 (_2!1784 lt!49029))) (currentByte!2515 (_2!1784 lt!49029)) (currentBit!2510 (_2!1784 lt!49029))))))

(declare-fun b!33329 () Bool)

(declare-fun res!28540 () Bool)

(assert (=> b!33329 (=> res!28540 e!22096)))

(assert (=> b!33329 (= res!28540 (not (invariant!0 (currentBit!2510 (_2!1784 lt!49039)) (currentByte!2515 (_2!1784 lt!49039)) (size!820 (buf!1148 (_2!1784 lt!49029))))))))

(declare-fun b!33330 () Bool)

(declare-fun res!28535 () Bool)

(declare-fun e!22095 () Bool)

(assert (=> b!33330 (=> (not res!28535) (not e!22095))))

(assert (=> b!33330 (= res!28535 (validate_offset_bits!1 ((_ sign_extend 32) (size!820 (buf!1148 thiss!1379))) ((_ sign_extend 32) (currentByte!2515 thiss!1379)) ((_ sign_extend 32) (currentBit!2510 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!28541 () Bool)

(assert (=> start!6920 (=> (not res!28541) (not e!22095))))

(assert (=> start!6920 (= res!28541 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!820 srcBuffer!2))))))))

(assert (=> start!6920 e!22095))

(assert (=> start!6920 true))

(declare-fun array_inv!769 (array!1856) Bool)

(assert (=> start!6920 (array_inv!769 srcBuffer!2)))

(declare-fun e!22099 () Bool)

(declare-fun inv!12 (BitStream!1432) Bool)

(assert (=> start!6920 (and (inv!12 thiss!1379) e!22099)))

(declare-fun b!33331 () Bool)

(declare-fun e!22094 () Bool)

(assert (=> b!33331 (= e!22094 e!22102)))

(declare-fun res!28543 () Bool)

(assert (=> b!33331 (=> res!28543 e!22102)))

(assert (=> b!33331 (= res!28543 (not (isPrefixOf!0 thiss!1379 (_2!1784 lt!49039))))))

(declare-fun lt!49027 () (_ BitVec 64))

(assert (=> b!33331 (validate_offset_bits!1 ((_ sign_extend 32) (size!820 (buf!1148 (_2!1784 lt!49039)))) ((_ sign_extend 32) (currentByte!2515 (_2!1784 lt!49039))) ((_ sign_extend 32) (currentBit!2510 (_2!1784 lt!49039))) lt!49027)))

(assert (=> b!33331 (= lt!49027 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!49042 () Unit!2495)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1432 BitStream!1432 (_ BitVec 64) (_ BitVec 64)) Unit!2495)

(assert (=> b!33331 (= lt!49042 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1784 lt!49039) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1432 (_ BitVec 8) (_ BitVec 32)) tuple2!3394)

(assert (=> b!33331 (= lt!49039 (appendBitFromByte!0 thiss!1379 (select (arr!1295 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!33332 () Bool)

(assert (=> b!33332 (= e!22105 true)))

(declare-fun lt!49033 () List!417)

(declare-fun tail!134 (List!417) List!417)

(assert (=> b!33332 (= lt!49033 (tail!134 lt!49031))))

(declare-fun lt!49036 () tuple2!3396)

(declare-fun lt!49035 () Unit!2495)

(declare-fun lt!49028 () tuple2!3396)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1432 BitStream!1432 BitStream!1432 BitStream!1432 (_ BitVec 64) List!417) Unit!2495)

(assert (=> b!33332 (= lt!49035 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1784 lt!49029) (_2!1784 lt!49029) (_1!1785 lt!49036) (_1!1785 lt!49028) (bvsub to!314 i!635) lt!49031))))

(declare-fun b!33333 () Bool)

(assert (=> b!33333 (= e!22098 e!22096)))

(declare-fun res!28534 () Bool)

(assert (=> b!33333 (=> res!28534 e!22096)))

(assert (=> b!33333 (= res!28534 (not (= (size!820 (buf!1148 (_2!1784 lt!49039))) (size!820 (buf!1148 (_2!1784 lt!49029))))))))

(assert (=> b!33333 e!22103))

(declare-fun res!28539 () Bool)

(assert (=> b!33333 (=> (not res!28539) (not e!22103))))

(assert (=> b!33333 (= res!28539 (= (size!820 (buf!1148 (_2!1784 lt!49029))) (size!820 (buf!1148 thiss!1379))))))

(declare-fun b!33334 () Bool)

(assert (=> b!33334 (= e!22096 e!22105)))

(declare-fun res!28545 () Bool)

(assert (=> b!33334 (=> res!28545 e!22105)))

(assert (=> b!33334 (= res!28545 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!33334 (= lt!49033 (bitStreamReadBitsIntoList!0 (_2!1784 lt!49029) (_1!1785 lt!49028) lt!49027))))

(assert (=> b!33334 (= lt!49031 (bitStreamReadBitsIntoList!0 (_2!1784 lt!49029) (_1!1785 lt!49036) (bvsub to!314 i!635)))))

(assert (=> b!33334 (validate_offset_bits!1 ((_ sign_extend 32) (size!820 (buf!1148 (_2!1784 lt!49029)))) ((_ sign_extend 32) (currentByte!2515 (_2!1784 lt!49039))) ((_ sign_extend 32) (currentBit!2510 (_2!1784 lt!49039))) lt!49027)))

(declare-fun lt!49038 () Unit!2495)

(assert (=> b!33334 (= lt!49038 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1784 lt!49039) (buf!1148 (_2!1784 lt!49029)) lt!49027))))

(assert (=> b!33334 (= lt!49028 (reader!0 (_2!1784 lt!49039) (_2!1784 lt!49029)))))

(assert (=> b!33334 (validate_offset_bits!1 ((_ sign_extend 32) (size!820 (buf!1148 (_2!1784 lt!49029)))) ((_ sign_extend 32) (currentByte!2515 thiss!1379)) ((_ sign_extend 32) (currentBit!2510 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!49041 () Unit!2495)

(assert (=> b!33334 (= lt!49041 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1148 (_2!1784 lt!49029)) (bvsub to!314 i!635)))))

(assert (=> b!33334 (= lt!49036 (reader!0 thiss!1379 (_2!1784 lt!49029)))))

(declare-fun b!33335 () Bool)

(assert (=> b!33335 (= e!22099 (array_inv!769 (buf!1148 thiss!1379)))))

(declare-fun b!33336 () Bool)

(declare-fun res!28548 () Bool)

(assert (=> b!33336 (=> res!28548 e!22098)))

(assert (=> b!33336 (= res!28548 (not (= (size!820 (buf!1148 thiss!1379)) (size!820 (buf!1148 (_2!1784 lt!49029))))))))

(declare-fun b!33337 () Bool)

(assert (=> b!33337 (= e!22095 (not e!22094))))

(declare-fun res!28537 () Bool)

(assert (=> b!33337 (=> res!28537 e!22094)))

(assert (=> b!33337 (= res!28537 (bvsge i!635 to!314))))

(assert (=> b!33337 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!49040 () Unit!2495)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1432) Unit!2495)

(assert (=> b!33337 (= lt!49040 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!33337 (= lt!49026 (bitIndex!0 (size!820 (buf!1148 thiss!1379)) (currentByte!2515 thiss!1379) (currentBit!2510 thiss!1379)))))

(assert (= (and start!6920 res!28541) b!33330))

(assert (= (and b!33330 res!28535) b!33337))

(assert (= (and b!33337 (not res!28537)) b!33331))

(assert (= (and b!33331 (not res!28543)) b!33325))

(assert (= (and b!33325 res!28538) b!33322))

(assert (= (and b!33325 (not res!28542)) b!33328))

(assert (= (and b!33328 (not res!28546)) b!33327))

(assert (= (and b!33327 (not res!28547)) b!33336))

(assert (= (and b!33336 (not res!28548)) b!33333))

(assert (= (and b!33333 res!28539) b!33326))

(assert (= (and b!33333 (not res!28534)) b!33323))

(assert (= (and b!33323 (not res!28536)) b!33329))

(assert (= (and b!33329 (not res!28540)) b!33334))

(assert (= (and b!33334 (not res!28545)) b!33324))

(assert (= (and b!33324 (not res!28544)) b!33332))

(assert (= start!6920 b!33335))

(declare-fun m!49407 () Bool)

(assert (=> b!33328 m!49407))

(declare-fun m!49409 () Bool)

(assert (=> b!33337 m!49409))

(declare-fun m!49411 () Bool)

(assert (=> b!33337 m!49411))

(declare-fun m!49413 () Bool)

(assert (=> b!33337 m!49413))

(declare-fun m!49415 () Bool)

(assert (=> b!33330 m!49415))

(declare-fun m!49417 () Bool)

(assert (=> b!33329 m!49417))

(declare-fun m!49419 () Bool)

(assert (=> start!6920 m!49419))

(declare-fun m!49421 () Bool)

(assert (=> start!6920 m!49421))

(declare-fun m!49423 () Bool)

(assert (=> b!33331 m!49423))

(declare-fun m!49425 () Bool)

(assert (=> b!33331 m!49425))

(declare-fun m!49427 () Bool)

(assert (=> b!33331 m!49427))

(assert (=> b!33331 m!49425))

(declare-fun m!49429 () Bool)

(assert (=> b!33331 m!49429))

(declare-fun m!49431 () Bool)

(assert (=> b!33331 m!49431))

(declare-fun m!49433 () Bool)

(assert (=> b!33327 m!49433))

(declare-fun m!49435 () Bool)

(assert (=> b!33326 m!49435))

(declare-fun m!49437 () Bool)

(assert (=> b!33325 m!49437))

(declare-fun m!49439 () Bool)

(assert (=> b!33325 m!49439))

(declare-fun m!49441 () Bool)

(assert (=> b!33325 m!49441))

(declare-fun m!49443 () Bool)

(assert (=> b!33325 m!49443))

(declare-fun m!49445 () Bool)

(assert (=> b!33325 m!49445))

(declare-fun m!49447 () Bool)

(assert (=> b!33325 m!49447))

(declare-fun m!49449 () Bool)

(assert (=> b!33325 m!49449))

(declare-fun m!49451 () Bool)

(assert (=> b!33324 m!49451))

(declare-fun m!49453 () Bool)

(assert (=> b!33322 m!49453))

(assert (=> b!33322 m!49453))

(declare-fun m!49455 () Bool)

(assert (=> b!33322 m!49455))

(declare-fun m!49457 () Bool)

(assert (=> b!33322 m!49457))

(assert (=> b!33322 m!49457))

(declare-fun m!49459 () Bool)

(assert (=> b!33322 m!49459))

(declare-fun m!49461 () Bool)

(assert (=> b!33335 m!49461))

(declare-fun m!49463 () Bool)

(assert (=> b!33323 m!49463))

(declare-fun m!49465 () Bool)

(assert (=> b!33334 m!49465))

(declare-fun m!49467 () Bool)

(assert (=> b!33334 m!49467))

(declare-fun m!49469 () Bool)

(assert (=> b!33334 m!49469))

(declare-fun m!49471 () Bool)

(assert (=> b!33334 m!49471))

(declare-fun m!49473 () Bool)

(assert (=> b!33334 m!49473))

(declare-fun m!49475 () Bool)

(assert (=> b!33334 m!49475))

(declare-fun m!49477 () Bool)

(assert (=> b!33334 m!49477))

(declare-fun m!49479 () Bool)

(assert (=> b!33334 m!49479))

(declare-fun m!49481 () Bool)

(assert (=> b!33332 m!49481))

(declare-fun m!49483 () Bool)

(assert (=> b!33332 m!49483))

(push 1)

(assert (not b!33330))

(assert (not b!33327))

(assert (not b!33335))

(assert (not b!33331))

(assert (not b!33337))

(assert (not b!33326))

(assert (not b!33325))

(assert (not b!33334))

(assert (not b!33332))

(assert (not b!33324))

(assert (not b!33322))

(assert (not b!33329))

(assert (not b!33328))

(assert (not b!33323))

(assert (not start!6920))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

