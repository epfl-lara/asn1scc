; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11900 () Bool)

(assert start!11900)

(declare-fun b!60536 () Bool)

(declare-fun e!40412 () Bool)

(declare-datatypes ((array!2757 0))(
  ( (array!2758 (arr!1818 (Array (_ BitVec 32) (_ BitVec 8))) (size!1254 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2196 0))(
  ( (BitStream!2197 (buf!1635 array!2757) (currentByte!3253 (_ BitVec 32)) (currentBit!3248 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2196)

(declare-fun array_inv!1157 (array!2757) Bool)

(assert (=> b!60536 (= e!40412 (array_inv!1157 (buf!1635 thiss!1379)))))

(declare-fun b!60537 () Bool)

(declare-fun e!40404 () Bool)

(declare-fun e!40415 () Bool)

(assert (=> b!60537 (= e!40404 (not e!40415))))

(declare-fun res!50499 () Bool)

(assert (=> b!60537 (=> res!50499 e!40415)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!60537 (= res!50499 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2196 BitStream!2196) Bool)

(assert (=> b!60537 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4131 0))(
  ( (Unit!4132) )
))
(declare-fun lt!94420 () Unit!4131)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2196) Unit!4131)

(assert (=> b!60537 (= lt!94420 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!94422 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!60537 (= lt!94422 (bitIndex!0 (size!1254 (buf!1635 thiss!1379)) (currentByte!3253 thiss!1379) (currentBit!3248 thiss!1379)))))

(declare-fun b!60538 () Bool)

(declare-datatypes ((tuple2!5514 0))(
  ( (tuple2!5515 (_1!2868 Unit!4131) (_2!2868 BitStream!2196)) )
))
(declare-fun lt!94424 () tuple2!5514)

(declare-fun lt!94427 () (_ BitVec 64))

(declare-fun e!40414 () Bool)

(assert (=> b!60538 (= e!40414 (= lt!94427 (bvsub (bvsub (bvadd (bitIndex!0 (size!1254 (buf!1635 (_2!2868 lt!94424))) (currentByte!3253 (_2!2868 lt!94424)) (currentBit!3248 (_2!2868 lt!94424))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!60539 () Bool)

(declare-fun e!40406 () Bool)

(declare-fun e!40407 () Bool)

(assert (=> b!60539 (= e!40406 e!40407)))

(declare-fun res!50495 () Bool)

(assert (=> b!60539 (=> res!50495 e!40407)))

(declare-fun lt!94418 () tuple2!5514)

(assert (=> b!60539 (= res!50495 (not (isPrefixOf!0 (_2!2868 lt!94424) (_2!2868 lt!94418))))))

(assert (=> b!60539 (isPrefixOf!0 thiss!1379 (_2!2868 lt!94418))))

(declare-fun lt!94426 () Unit!4131)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2196 BitStream!2196 BitStream!2196) Unit!4131)

(assert (=> b!60539 (= lt!94426 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2868 lt!94424) (_2!2868 lt!94418)))))

(declare-fun srcBuffer!2 () array!2757)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2196 array!2757 (_ BitVec 64) (_ BitVec 64)) tuple2!5514)

(assert (=> b!60539 (= lt!94418 (appendBitsMSBFirstLoop!0 (_2!2868 lt!94424) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!40409 () Bool)

(assert (=> b!60539 e!40409))

(declare-fun res!50494 () Bool)

(assert (=> b!60539 (=> (not res!50494) (not e!40409))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!60539 (= res!50494 (validate_offset_bits!1 ((_ sign_extend 32) (size!1254 (buf!1635 (_2!2868 lt!94424)))) ((_ sign_extend 32) (currentByte!3253 thiss!1379)) ((_ sign_extend 32) (currentBit!3248 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!94423 () Unit!4131)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2196 array!2757 (_ BitVec 64)) Unit!4131)

(assert (=> b!60539 (= lt!94423 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1635 (_2!2868 lt!94424)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!5516 0))(
  ( (tuple2!5517 (_1!2869 BitStream!2196) (_2!2869 BitStream!2196)) )
))
(declare-fun lt!94425 () tuple2!5516)

(declare-fun reader!0 (BitStream!2196 BitStream!2196) tuple2!5516)

(assert (=> b!60539 (= lt!94425 (reader!0 thiss!1379 (_2!2868 lt!94424)))))

(declare-fun b!60540 () Bool)

(declare-fun e!40410 () Bool)

(declare-fun e!40405 () Bool)

(assert (=> b!60540 (= e!40410 e!40405)))

(declare-fun res!50496 () Bool)

(assert (=> b!60540 (=> res!50496 e!40405)))

(assert (=> b!60540 (= res!50496 (not (= (size!1254 (buf!1635 (_2!2868 lt!94424))) (size!1254 (buf!1635 (_2!2868 lt!94418))))))))

(assert (=> b!60540 e!40414))

(declare-fun res!50493 () Bool)

(assert (=> b!60540 (=> (not res!50493) (not e!40414))))

(assert (=> b!60540 (= res!50493 (= (size!1254 (buf!1635 (_2!2868 lt!94418))) (size!1254 (buf!1635 thiss!1379))))))

(declare-fun b!60541 () Bool)

(assert (=> b!60541 (= e!40407 e!40410)))

(declare-fun res!50491 () Bool)

(assert (=> b!60541 (=> res!50491 e!40410)))

(assert (=> b!60541 (= res!50491 (not (= lt!94427 (bvsub (bvadd lt!94422 to!314) i!635))))))

(assert (=> b!60541 (= lt!94427 (bitIndex!0 (size!1254 (buf!1635 (_2!2868 lt!94418))) (currentByte!3253 (_2!2868 lt!94418)) (currentBit!3248 (_2!2868 lt!94418))))))

(declare-fun b!60542 () Bool)

(declare-fun res!50497 () Bool)

(assert (=> b!60542 (=> res!50497 e!40410)))

(assert (=> b!60542 (= res!50497 (not (= (size!1254 (buf!1635 thiss!1379)) (size!1254 (buf!1635 (_2!2868 lt!94418))))))))

(declare-fun b!60543 () Bool)

(declare-fun e!40408 () Bool)

(assert (=> b!60543 (= e!40408 true)))

(declare-fun lt!94414 () Int)

(declare-datatypes ((List!673 0))(
  ( (Nil!670) (Cons!669 (h!788 Bool) (t!1423 List!673)) )
))
(declare-fun lt!94419 () List!673)

(declare-fun length!301 (List!673) Int)

(assert (=> b!60543 (= lt!94414 (length!301 lt!94419))))

(declare-fun b!60544 () Bool)

(declare-fun res!50487 () Bool)

(assert (=> b!60544 (=> res!50487 e!40405)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!60544 (= res!50487 (not (invariant!0 (currentBit!3248 (_2!2868 lt!94424)) (currentByte!3253 (_2!2868 lt!94424)) (size!1254 (buf!1635 (_2!2868 lt!94418))))))))

(declare-fun b!60545 () Bool)

(assert (=> b!60545 (= e!40415 e!40406)))

(declare-fun res!50486 () Bool)

(assert (=> b!60545 (=> res!50486 e!40406)))

(assert (=> b!60545 (= res!50486 (not (isPrefixOf!0 thiss!1379 (_2!2868 lt!94424))))))

(declare-fun lt!94416 () (_ BitVec 64))

(assert (=> b!60545 (validate_offset_bits!1 ((_ sign_extend 32) (size!1254 (buf!1635 (_2!2868 lt!94424)))) ((_ sign_extend 32) (currentByte!3253 (_2!2868 lt!94424))) ((_ sign_extend 32) (currentBit!3248 (_2!2868 lt!94424))) lt!94416)))

(assert (=> b!60545 (= lt!94416 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!94429 () Unit!4131)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2196 BitStream!2196 (_ BitVec 64) (_ BitVec 64)) Unit!4131)

(assert (=> b!60545 (= lt!94429 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2868 lt!94424) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2196 (_ BitVec 8) (_ BitVec 32)) tuple2!5514)

(assert (=> b!60545 (= lt!94424 (appendBitFromByte!0 thiss!1379 (select (arr!1818 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!60546 () Bool)

(declare-fun res!50490 () Bool)

(assert (=> b!60546 (=> (not res!50490) (not e!40404))))

(assert (=> b!60546 (= res!50490 (validate_offset_bits!1 ((_ sign_extend 32) (size!1254 (buf!1635 thiss!1379))) ((_ sign_extend 32) (currentByte!3253 thiss!1379)) ((_ sign_extend 32) (currentBit!3248 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!50488 () Bool)

(assert (=> start!11900 (=> (not res!50488) (not e!40404))))

(assert (=> start!11900 (= res!50488 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1254 srcBuffer!2))))))))

(assert (=> start!11900 e!40404))

(assert (=> start!11900 true))

(assert (=> start!11900 (array_inv!1157 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2196) Bool)

(assert (=> start!11900 (and (inv!12 thiss!1379) e!40412)))

(declare-fun b!60547 () Bool)

(declare-fun res!50498 () Bool)

(assert (=> b!60547 (=> res!50498 e!40405)))

(assert (=> b!60547 (= res!50498 (not (invariant!0 (currentBit!3248 (_2!2868 lt!94424)) (currentByte!3253 (_2!2868 lt!94424)) (size!1254 (buf!1635 (_2!2868 lt!94424))))))))

(declare-fun b!60548 () Bool)

(declare-fun res!50489 () Bool)

(assert (=> b!60548 (=> res!50489 e!40410)))

(assert (=> b!60548 (= res!50489 (not (invariant!0 (currentBit!3248 (_2!2868 lt!94418)) (currentByte!3253 (_2!2868 lt!94418)) (size!1254 (buf!1635 (_2!2868 lt!94418))))))))

(declare-fun b!60549 () Bool)

(declare-fun head!492 (List!673) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2196 array!2757 (_ BitVec 64) (_ BitVec 64)) List!673)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2196 BitStream!2196 (_ BitVec 64)) List!673)

(assert (=> b!60549 (= e!40409 (= (head!492 (byteArrayBitContentToList!0 (_2!2868 lt!94424) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!492 (bitStreamReadBitsIntoList!0 (_2!2868 lt!94424) (_1!2869 lt!94425) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!60550 () Bool)

(assert (=> b!60550 (= e!40405 e!40408)))

(declare-fun res!50492 () Bool)

(assert (=> b!60550 (=> res!50492 e!40408)))

(assert (=> b!60550 (= res!50492 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!94421 () tuple2!5516)

(declare-fun lt!94417 () List!673)

(assert (=> b!60550 (= lt!94417 (bitStreamReadBitsIntoList!0 (_2!2868 lt!94418) (_1!2869 lt!94421) lt!94416))))

(declare-fun lt!94428 () tuple2!5516)

(assert (=> b!60550 (= lt!94419 (bitStreamReadBitsIntoList!0 (_2!2868 lt!94418) (_1!2869 lt!94428) (bvsub to!314 i!635)))))

(assert (=> b!60550 (validate_offset_bits!1 ((_ sign_extend 32) (size!1254 (buf!1635 (_2!2868 lt!94418)))) ((_ sign_extend 32) (currentByte!3253 (_2!2868 lt!94424))) ((_ sign_extend 32) (currentBit!3248 (_2!2868 lt!94424))) lt!94416)))

(declare-fun lt!94413 () Unit!4131)

(assert (=> b!60550 (= lt!94413 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2868 lt!94424) (buf!1635 (_2!2868 lt!94418)) lt!94416))))

(assert (=> b!60550 (= lt!94421 (reader!0 (_2!2868 lt!94424) (_2!2868 lt!94418)))))

(assert (=> b!60550 (validate_offset_bits!1 ((_ sign_extend 32) (size!1254 (buf!1635 (_2!2868 lt!94418)))) ((_ sign_extend 32) (currentByte!3253 thiss!1379)) ((_ sign_extend 32) (currentBit!3248 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!94415 () Unit!4131)

(assert (=> b!60550 (= lt!94415 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1635 (_2!2868 lt!94418)) (bvsub to!314 i!635)))))

(assert (=> b!60550 (= lt!94428 (reader!0 thiss!1379 (_2!2868 lt!94418)))))

(assert (= (and start!11900 res!50488) b!60546))

(assert (= (and b!60546 res!50490) b!60537))

(assert (= (and b!60537 (not res!50499)) b!60545))

(assert (= (and b!60545 (not res!50486)) b!60539))

(assert (= (and b!60539 res!50494) b!60549))

(assert (= (and b!60539 (not res!50495)) b!60541))

(assert (= (and b!60541 (not res!50491)) b!60548))

(assert (= (and b!60548 (not res!50489)) b!60542))

(assert (= (and b!60542 (not res!50497)) b!60540))

(assert (= (and b!60540 res!50493) b!60538))

(assert (= (and b!60540 (not res!50496)) b!60547))

(assert (= (and b!60547 (not res!50498)) b!60544))

(assert (= (and b!60544 (not res!50487)) b!60550))

(assert (= (and b!60550 (not res!50492)) b!60543))

(assert (= start!11900 b!60536))

(declare-fun m!95391 () Bool)

(assert (=> b!60543 m!95391))

(declare-fun m!95393 () Bool)

(assert (=> b!60538 m!95393))

(declare-fun m!95395 () Bool)

(assert (=> b!60539 m!95395))

(declare-fun m!95397 () Bool)

(assert (=> b!60539 m!95397))

(declare-fun m!95399 () Bool)

(assert (=> b!60539 m!95399))

(declare-fun m!95401 () Bool)

(assert (=> b!60539 m!95401))

(declare-fun m!95403 () Bool)

(assert (=> b!60539 m!95403))

(declare-fun m!95405 () Bool)

(assert (=> b!60539 m!95405))

(declare-fun m!95407 () Bool)

(assert (=> b!60539 m!95407))

(declare-fun m!95409 () Bool)

(assert (=> start!11900 m!95409))

(declare-fun m!95411 () Bool)

(assert (=> start!11900 m!95411))

(declare-fun m!95413 () Bool)

(assert (=> b!60550 m!95413))

(declare-fun m!95415 () Bool)

(assert (=> b!60550 m!95415))

(declare-fun m!95417 () Bool)

(assert (=> b!60550 m!95417))

(declare-fun m!95419 () Bool)

(assert (=> b!60550 m!95419))

(declare-fun m!95421 () Bool)

(assert (=> b!60550 m!95421))

(declare-fun m!95423 () Bool)

(assert (=> b!60550 m!95423))

(declare-fun m!95425 () Bool)

(assert (=> b!60550 m!95425))

(declare-fun m!95427 () Bool)

(assert (=> b!60550 m!95427))

(declare-fun m!95429 () Bool)

(assert (=> b!60548 m!95429))

(declare-fun m!95431 () Bool)

(assert (=> b!60547 m!95431))

(declare-fun m!95433 () Bool)

(assert (=> b!60546 m!95433))

(declare-fun m!95435 () Bool)

(assert (=> b!60541 m!95435))

(declare-fun m!95437 () Bool)

(assert (=> b!60544 m!95437))

(declare-fun m!95439 () Bool)

(assert (=> b!60536 m!95439))

(declare-fun m!95441 () Bool)

(assert (=> b!60545 m!95441))

(declare-fun m!95443 () Bool)

(assert (=> b!60545 m!95443))

(declare-fun m!95445 () Bool)

(assert (=> b!60545 m!95445))

(assert (=> b!60545 m!95441))

(declare-fun m!95447 () Bool)

(assert (=> b!60545 m!95447))

(declare-fun m!95449 () Bool)

(assert (=> b!60545 m!95449))

(declare-fun m!95451 () Bool)

(assert (=> b!60537 m!95451))

(declare-fun m!95453 () Bool)

(assert (=> b!60537 m!95453))

(declare-fun m!95455 () Bool)

(assert (=> b!60537 m!95455))

(declare-fun m!95457 () Bool)

(assert (=> b!60549 m!95457))

(assert (=> b!60549 m!95457))

(declare-fun m!95459 () Bool)

(assert (=> b!60549 m!95459))

(declare-fun m!95461 () Bool)

(assert (=> b!60549 m!95461))

(assert (=> b!60549 m!95461))

(declare-fun m!95463 () Bool)

(assert (=> b!60549 m!95463))

(check-sat (not b!60546) (not b!60543) (not b!60539) (not b!60545) (not b!60544) (not start!11900) (not b!60536) (not b!60548) (not b!60537) (not b!60549) (not b!60538) (not b!60550) (not b!60541) (not b!60547))
