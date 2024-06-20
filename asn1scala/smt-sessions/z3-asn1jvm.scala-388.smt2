; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10012 () Bool)

(assert start!10012)

(declare-fun res!42297 () Bool)

(declare-fun e!33369 () Bool)

(assert (=> start!10012 (=> (not res!42297) (not e!33369))))

(declare-datatypes ((array!2334 0))(
  ( (array!2335 (arr!1590 (Array (_ BitVec 32) (_ BitVec 8))) (size!1061 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2334)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!10012 (= res!42297 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1061 srcBuffer!2))))))))

(assert (=> start!10012 e!33369))

(assert (=> start!10012 true))

(declare-fun array_inv!971 (array!2334) Bool)

(assert (=> start!10012 (array_inv!971 srcBuffer!2)))

(declare-datatypes ((BitStream!1836 0))(
  ( (BitStream!1837 (buf!1416 array!2334) (currentByte!2939 (_ BitVec 32)) (currentBit!2934 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1836)

(declare-fun e!33373 () Bool)

(declare-fun inv!12 (BitStream!1836) Bool)

(assert (=> start!10012 (and (inv!12 thiss!1379) e!33373)))

(declare-fun b!50514 () Bool)

(declare-fun e!33368 () Bool)

(declare-fun e!33365 () Bool)

(assert (=> b!50514 (= e!33368 e!33365)))

(declare-fun res!42295 () Bool)

(assert (=> b!50514 (=> res!42295 e!33365)))

(declare-fun lt!78337 () (_ BitVec 64))

(declare-fun lt!78333 () (_ BitVec 64))

(assert (=> b!50514 (= res!42295 (not (= lt!78333 (bvsub (bvadd lt!78337 to!314) i!635))))))

(declare-datatypes ((Unit!3497 0))(
  ( (Unit!3498) )
))
(declare-datatypes ((tuple2!4660 0))(
  ( (tuple2!4661 (_1!2435 Unit!3497) (_2!2435 BitStream!1836)) )
))
(declare-fun lt!78326 () tuple2!4660)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!50514 (= lt!78333 (bitIndex!0 (size!1061 (buf!1416 (_2!2435 lt!78326))) (currentByte!2939 (_2!2435 lt!78326)) (currentBit!2934 (_2!2435 lt!78326))))))

(declare-fun b!50515 () Bool)

(declare-fun e!33367 () Bool)

(declare-fun e!33372 () Bool)

(assert (=> b!50515 (= e!33367 e!33372)))

(declare-fun res!42292 () Bool)

(assert (=> b!50515 (=> res!42292 e!33372)))

(assert (=> b!50515 (= res!42292 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!78324 () (_ BitVec 64))

(declare-datatypes ((tuple2!4662 0))(
  ( (tuple2!4663 (_1!2436 BitStream!1836) (_2!2436 BitStream!1836)) )
))
(declare-fun lt!78323 () tuple2!4662)

(declare-datatypes ((List!559 0))(
  ( (Nil!556) (Cons!555 (h!674 Bool) (t!1309 List!559)) )
))
(declare-fun lt!78341 () List!559)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1836 BitStream!1836 (_ BitVec 64)) List!559)

(assert (=> b!50515 (= lt!78341 (bitStreamReadBitsIntoList!0 (_2!2435 lt!78326) (_1!2436 lt!78323) lt!78324))))

(declare-fun lt!78335 () tuple2!4662)

(declare-fun lt!78329 () List!559)

(assert (=> b!50515 (= lt!78329 (bitStreamReadBitsIntoList!0 (_2!2435 lt!78326) (_1!2436 lt!78335) (bvsub to!314 i!635)))))

(declare-fun lt!78331 () tuple2!4660)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!50515 (validate_offset_bits!1 ((_ sign_extend 32) (size!1061 (buf!1416 (_2!2435 lt!78326)))) ((_ sign_extend 32) (currentByte!2939 (_2!2435 lt!78331))) ((_ sign_extend 32) (currentBit!2934 (_2!2435 lt!78331))) lt!78324)))

(declare-fun lt!78332 () Unit!3497)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1836 array!2334 (_ BitVec 64)) Unit!3497)

(assert (=> b!50515 (= lt!78332 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2435 lt!78331) (buf!1416 (_2!2435 lt!78326)) lt!78324))))

(declare-fun reader!0 (BitStream!1836 BitStream!1836) tuple2!4662)

(assert (=> b!50515 (= lt!78323 (reader!0 (_2!2435 lt!78331) (_2!2435 lt!78326)))))

(assert (=> b!50515 (validate_offset_bits!1 ((_ sign_extend 32) (size!1061 (buf!1416 (_2!2435 lt!78326)))) ((_ sign_extend 32) (currentByte!2939 thiss!1379)) ((_ sign_extend 32) (currentBit!2934 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!78322 () Unit!3497)

(assert (=> b!50515 (= lt!78322 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1416 (_2!2435 lt!78326)) (bvsub to!314 i!635)))))

(assert (=> b!50515 (= lt!78335 (reader!0 thiss!1379 (_2!2435 lt!78326)))))

(declare-fun b!50516 () Bool)

(declare-fun e!33376 () Bool)

(assert (=> b!50516 (= e!33372 e!33376)))

(declare-fun res!42291 () Bool)

(assert (=> b!50516 (=> res!42291 e!33376)))

(declare-fun lt!78340 () List!559)

(assert (=> b!50516 (= res!42291 (not (= lt!78340 lt!78341)))))

(assert (=> b!50516 (= lt!78341 lt!78340)))

(declare-fun tail!245 (List!559) List!559)

(assert (=> b!50516 (= lt!78340 (tail!245 lt!78329))))

(declare-fun lt!78321 () Unit!3497)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1836 BitStream!1836 BitStream!1836 BitStream!1836 (_ BitVec 64) List!559) Unit!3497)

(assert (=> b!50516 (= lt!78321 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2435 lt!78326) (_2!2435 lt!78326) (_1!2436 lt!78335) (_1!2436 lt!78323) (bvsub to!314 i!635) lt!78329))))

(declare-fun b!50517 () Bool)

(declare-fun res!42290 () Bool)

(assert (=> b!50517 (=> res!42290 e!33365)))

(assert (=> b!50517 (= res!42290 (not (= (size!1061 (buf!1416 thiss!1379)) (size!1061 (buf!1416 (_2!2435 lt!78326))))))))

(declare-fun b!50518 () Bool)

(declare-fun res!42293 () Bool)

(assert (=> b!50518 (=> res!42293 e!33367)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!50518 (= res!42293 (not (invariant!0 (currentBit!2934 (_2!2435 lt!78331)) (currentByte!2939 (_2!2435 lt!78331)) (size!1061 (buf!1416 (_2!2435 lt!78331))))))))

(declare-fun b!50519 () Bool)

(declare-fun e!33370 () Bool)

(assert (=> b!50519 (= e!33369 (not e!33370))))

(declare-fun res!42294 () Bool)

(assert (=> b!50519 (=> res!42294 e!33370)))

(assert (=> b!50519 (= res!42294 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1836 BitStream!1836) Bool)

(assert (=> b!50519 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!78327 () Unit!3497)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1836) Unit!3497)

(assert (=> b!50519 (= lt!78327 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!50519 (= lt!78337 (bitIndex!0 (size!1061 (buf!1416 thiss!1379)) (currentByte!2939 thiss!1379) (currentBit!2934 thiss!1379)))))

(declare-fun b!50520 () Bool)

(assert (=> b!50520 (= e!33365 e!33367)))

(declare-fun res!42282 () Bool)

(assert (=> b!50520 (=> res!42282 e!33367)))

(assert (=> b!50520 (= res!42282 (not (= (size!1061 (buf!1416 (_2!2435 lt!78331))) (size!1061 (buf!1416 (_2!2435 lt!78326))))))))

(declare-fun lt!78336 () (_ BitVec 64))

(assert (=> b!50520 (= lt!78333 (bvsub (bvsub (bvadd lt!78336 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!50520 (= lt!78336 (bitIndex!0 (size!1061 (buf!1416 (_2!2435 lt!78331))) (currentByte!2939 (_2!2435 lt!78331)) (currentBit!2934 (_2!2435 lt!78331))))))

(assert (=> b!50520 (= (size!1061 (buf!1416 (_2!2435 lt!78326))) (size!1061 (buf!1416 thiss!1379)))))

(declare-fun b!50521 () Bool)

(declare-fun e!33363 () Bool)

(assert (=> b!50521 (= e!33363 true)))

(declare-fun lt!78343 () Bool)

(declare-fun bitAt!0 (array!2334 (_ BitVec 64)) Bool)

(assert (=> b!50521 (= lt!78343 (bitAt!0 (buf!1416 (_2!2435 lt!78326)) lt!78337))))

(declare-fun lt!78339 () Unit!3497)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2334 array!2334 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3497)

(assert (=> b!50521 (= lt!78339 (arrayBitRangesEqImpliesEq!0 (buf!1416 (_2!2435 lt!78331)) (buf!1416 (_2!2435 lt!78326)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!78337 lt!78336))))

(declare-fun b!50522 () Bool)

(declare-fun lt!78342 () tuple2!4662)

(declare-fun e!33374 () Bool)

(declare-fun head!378 (List!559) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1836 array!2334 (_ BitVec 64) (_ BitVec 64)) List!559)

(assert (=> b!50522 (= e!33374 (= (head!378 (byteArrayBitContentToList!0 (_2!2435 lt!78331) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!378 (bitStreamReadBitsIntoList!0 (_2!2435 lt!78331) (_1!2436 lt!78342) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!50523 () Bool)

(assert (=> b!50523 (= e!33373 (array_inv!971 (buf!1416 thiss!1379)))))

(declare-fun b!50524 () Bool)

(declare-fun res!42289 () Bool)

(declare-fun e!33377 () Bool)

(assert (=> b!50524 (=> res!42289 e!33377)))

(declare-fun lt!78328 () Bool)

(assert (=> b!50524 (= res!42289 (not (= (head!378 lt!78329) lt!78328)))))

(declare-fun b!50525 () Bool)

(declare-fun res!42298 () Bool)

(assert (=> b!50525 (=> res!42298 e!33372)))

(declare-fun length!254 (List!559) Int)

(assert (=> b!50525 (= res!42298 (<= (length!254 lt!78329) 0))))

(declare-fun b!50526 () Bool)

(declare-fun e!33375 () Bool)

(assert (=> b!50526 (= e!33375 e!33368)))

(declare-fun res!42299 () Bool)

(assert (=> b!50526 (=> res!42299 e!33368)))

(assert (=> b!50526 (= res!42299 (not (isPrefixOf!0 (_2!2435 lt!78331) (_2!2435 lt!78326))))))

(assert (=> b!50526 (isPrefixOf!0 thiss!1379 (_2!2435 lt!78326))))

(declare-fun lt!78338 () Unit!3497)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1836 BitStream!1836 BitStream!1836) Unit!3497)

(assert (=> b!50526 (= lt!78338 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2435 lt!78331) (_2!2435 lt!78326)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1836 array!2334 (_ BitVec 64) (_ BitVec 64)) tuple2!4660)

(assert (=> b!50526 (= lt!78326 (appendBitsMSBFirstLoop!0 (_2!2435 lt!78331) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!50526 e!33374))

(declare-fun res!42288 () Bool)

(assert (=> b!50526 (=> (not res!42288) (not e!33374))))

(assert (=> b!50526 (= res!42288 (validate_offset_bits!1 ((_ sign_extend 32) (size!1061 (buf!1416 (_2!2435 lt!78331)))) ((_ sign_extend 32) (currentByte!2939 thiss!1379)) ((_ sign_extend 32) (currentBit!2934 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!78325 () Unit!3497)

(assert (=> b!50526 (= lt!78325 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1416 (_2!2435 lt!78331)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!50526 (= lt!78342 (reader!0 thiss!1379 (_2!2435 lt!78331)))))

(declare-fun b!50527 () Bool)

(declare-fun e!33366 () Bool)

(assert (=> b!50527 (= e!33377 e!33366)))

(declare-fun res!42296 () Bool)

(assert (=> b!50527 (=> res!42296 e!33366)))

(declare-fun lt!78330 () Bool)

(assert (=> b!50527 (= res!42296 (not (= (head!378 (byteArrayBitContentToList!0 (_2!2435 lt!78326) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!78330)))))

(assert (=> b!50527 (= lt!78330 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!50528 () Bool)

(assert (=> b!50528 (= e!33370 e!33375)))

(declare-fun res!42284 () Bool)

(assert (=> b!50528 (=> res!42284 e!33375)))

(assert (=> b!50528 (= res!42284 (not (isPrefixOf!0 thiss!1379 (_2!2435 lt!78331))))))

(assert (=> b!50528 (validate_offset_bits!1 ((_ sign_extend 32) (size!1061 (buf!1416 (_2!2435 lt!78331)))) ((_ sign_extend 32) (currentByte!2939 (_2!2435 lt!78331))) ((_ sign_extend 32) (currentBit!2934 (_2!2435 lt!78331))) lt!78324)))

(assert (=> b!50528 (= lt!78324 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!78334 () Unit!3497)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1836 BitStream!1836 (_ BitVec 64) (_ BitVec 64)) Unit!3497)

(assert (=> b!50528 (= lt!78334 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2435 lt!78331) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1836 (_ BitVec 8) (_ BitVec 32)) tuple2!4660)

(assert (=> b!50528 (= lt!78331 (appendBitFromByte!0 thiss!1379 (select (arr!1590 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!50529 () Bool)

(declare-fun res!42286 () Bool)

(assert (=> b!50529 (=> res!42286 e!33365)))

(assert (=> b!50529 (= res!42286 (not (invariant!0 (currentBit!2934 (_2!2435 lt!78326)) (currentByte!2939 (_2!2435 lt!78326)) (size!1061 (buf!1416 (_2!2435 lt!78326))))))))

(declare-fun b!50530 () Bool)

(assert (=> b!50530 (= e!33366 e!33363)))

(declare-fun res!42287 () Bool)

(assert (=> b!50530 (=> res!42287 e!33363)))

(assert (=> b!50530 (= res!42287 (not (= lt!78343 lt!78330)))))

(assert (=> b!50530 (= lt!78343 (bitAt!0 (buf!1416 (_2!2435 lt!78331)) lt!78337))))

(declare-fun b!50531 () Bool)

(declare-fun res!42300 () Bool)

(assert (=> b!50531 (=> (not res!42300) (not e!33369))))

(assert (=> b!50531 (= res!42300 (validate_offset_bits!1 ((_ sign_extend 32) (size!1061 (buf!1416 thiss!1379))) ((_ sign_extend 32) (currentByte!2939 thiss!1379)) ((_ sign_extend 32) (currentBit!2934 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!50532 () Bool)

(declare-fun res!42285 () Bool)

(assert (=> b!50532 (=> res!42285 e!33367)))

(assert (=> b!50532 (= res!42285 (not (invariant!0 (currentBit!2934 (_2!2435 lt!78331)) (currentByte!2939 (_2!2435 lt!78331)) (size!1061 (buf!1416 (_2!2435 lt!78326))))))))

(declare-fun b!50533 () Bool)

(assert (=> b!50533 (= e!33376 e!33377)))

(declare-fun res!42283 () Bool)

(assert (=> b!50533 (=> res!42283 e!33377)))

(assert (=> b!50533 (= res!42283 (not (= lt!78328 (bitAt!0 (buf!1416 (_1!2436 lt!78323)) lt!78337))))))

(assert (=> b!50533 (= lt!78328 (bitAt!0 (buf!1416 (_1!2436 lt!78335)) lt!78337))))

(assert (= (and start!10012 res!42297) b!50531))

(assert (= (and b!50531 res!42300) b!50519))

(assert (= (and b!50519 (not res!42294)) b!50528))

(assert (= (and b!50528 (not res!42284)) b!50526))

(assert (= (and b!50526 res!42288) b!50522))

(assert (= (and b!50526 (not res!42299)) b!50514))

(assert (= (and b!50514 (not res!42295)) b!50529))

(assert (= (and b!50529 (not res!42286)) b!50517))

(assert (= (and b!50517 (not res!42290)) b!50520))

(assert (= (and b!50520 (not res!42282)) b!50518))

(assert (= (and b!50518 (not res!42293)) b!50532))

(assert (= (and b!50532 (not res!42285)) b!50515))

(assert (= (and b!50515 (not res!42292)) b!50525))

(assert (= (and b!50525 (not res!42298)) b!50516))

(assert (= (and b!50516 (not res!42291)) b!50533))

(assert (= (and b!50533 (not res!42283)) b!50524))

(assert (= (and b!50524 (not res!42289)) b!50527))

(assert (= (and b!50527 (not res!42296)) b!50530))

(assert (= (and b!50530 (not res!42287)) b!50521))

(assert (= start!10012 b!50523))

(declare-fun m!79467 () Bool)

(assert (=> b!50529 m!79467))

(declare-fun m!79469 () Bool)

(assert (=> b!50532 m!79469))

(declare-fun m!79471 () Bool)

(assert (=> b!50514 m!79471))

(declare-fun m!79473 () Bool)

(assert (=> b!50525 m!79473))

(declare-fun m!79475 () Bool)

(assert (=> b!50528 m!79475))

(declare-fun m!79477 () Bool)

(assert (=> b!50528 m!79477))

(declare-fun m!79479 () Bool)

(assert (=> b!50528 m!79479))

(declare-fun m!79481 () Bool)

(assert (=> b!50528 m!79481))

(assert (=> b!50528 m!79479))

(declare-fun m!79483 () Bool)

(assert (=> b!50528 m!79483))

(declare-fun m!79485 () Bool)

(assert (=> b!50531 m!79485))

(declare-fun m!79487 () Bool)

(assert (=> b!50515 m!79487))

(declare-fun m!79489 () Bool)

(assert (=> b!50515 m!79489))

(declare-fun m!79491 () Bool)

(assert (=> b!50515 m!79491))

(declare-fun m!79493 () Bool)

(assert (=> b!50515 m!79493))

(declare-fun m!79495 () Bool)

(assert (=> b!50515 m!79495))

(declare-fun m!79497 () Bool)

(assert (=> b!50515 m!79497))

(declare-fun m!79499 () Bool)

(assert (=> b!50515 m!79499))

(declare-fun m!79501 () Bool)

(assert (=> b!50515 m!79501))

(declare-fun m!79503 () Bool)

(assert (=> b!50527 m!79503))

(assert (=> b!50527 m!79503))

(declare-fun m!79505 () Bool)

(assert (=> b!50527 m!79505))

(declare-fun m!79507 () Bool)

(assert (=> b!50527 m!79507))

(declare-fun m!79509 () Bool)

(assert (=> start!10012 m!79509))

(declare-fun m!79511 () Bool)

(assert (=> start!10012 m!79511))

(declare-fun m!79513 () Bool)

(assert (=> b!50516 m!79513))

(declare-fun m!79515 () Bool)

(assert (=> b!50516 m!79515))

(declare-fun m!79517 () Bool)

(assert (=> b!50520 m!79517))

(declare-fun m!79519 () Bool)

(assert (=> b!50521 m!79519))

(declare-fun m!79521 () Bool)

(assert (=> b!50521 m!79521))

(declare-fun m!79523 () Bool)

(assert (=> b!50518 m!79523))

(declare-fun m!79525 () Bool)

(assert (=> b!50530 m!79525))

(declare-fun m!79527 () Bool)

(assert (=> b!50533 m!79527))

(declare-fun m!79529 () Bool)

(assert (=> b!50533 m!79529))

(declare-fun m!79531 () Bool)

(assert (=> b!50524 m!79531))

(declare-fun m!79533 () Bool)

(assert (=> b!50526 m!79533))

(declare-fun m!79535 () Bool)

(assert (=> b!50526 m!79535))

(declare-fun m!79537 () Bool)

(assert (=> b!50526 m!79537))

(declare-fun m!79539 () Bool)

(assert (=> b!50526 m!79539))

(declare-fun m!79541 () Bool)

(assert (=> b!50526 m!79541))

(declare-fun m!79543 () Bool)

(assert (=> b!50526 m!79543))

(declare-fun m!79545 () Bool)

(assert (=> b!50526 m!79545))

(declare-fun m!79547 () Bool)

(assert (=> b!50523 m!79547))

(declare-fun m!79549 () Bool)

(assert (=> b!50519 m!79549))

(declare-fun m!79551 () Bool)

(assert (=> b!50519 m!79551))

(declare-fun m!79553 () Bool)

(assert (=> b!50519 m!79553))

(declare-fun m!79555 () Bool)

(assert (=> b!50522 m!79555))

(assert (=> b!50522 m!79555))

(declare-fun m!79557 () Bool)

(assert (=> b!50522 m!79557))

(declare-fun m!79559 () Bool)

(assert (=> b!50522 m!79559))

(assert (=> b!50522 m!79559))

(declare-fun m!79561 () Bool)

(assert (=> b!50522 m!79561))

(check-sat (not b!50515) (not b!50532) (not b!50521) (not b!50520) (not b!50516) (not b!50514) (not b!50522) (not b!50525) (not b!50530) (not b!50528) (not b!50519) (not b!50529) (not b!50518) (not b!50524) (not b!50526) (not b!50533) (not b!50531) (not b!50523) (not b!50527) (not start!10012))
