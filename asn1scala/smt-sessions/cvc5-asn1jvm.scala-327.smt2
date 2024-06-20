; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7334 () Bool)

(assert start!7334)

(declare-fun b!35528 () Bool)

(declare-fun res!30297 () Bool)

(declare-fun e!23447 () Bool)

(assert (=> b!35528 (=> res!30297 e!23447)))

(declare-datatypes ((array!1901 0))(
  ( (array!1902 (arr!1331 (Array (_ BitVec 32) (_ BitVec 8))) (size!847 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1468 0))(
  ( (BitStream!1469 (buf!1175 array!1901) (currentByte!2560 (_ BitVec 32)) (currentBit!2555 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2621 0))(
  ( (Unit!2622) )
))
(declare-datatypes ((tuple2!3538 0))(
  ( (tuple2!3539 (_1!1856 Unit!2621) (_2!1856 BitStream!1468)) )
))
(declare-fun lt!53158 () tuple2!3538)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!35528 (= res!30297 (not (invariant!0 (currentBit!2555 (_2!1856 lt!53158)) (currentByte!2560 (_2!1856 lt!53158)) (size!847 (buf!1175 (_2!1856 lt!53158))))))))

(declare-fun b!35529 () Bool)

(declare-fun e!23445 () Bool)

(declare-fun e!23457 () Bool)

(assert (=> b!35529 (= e!23445 e!23457)))

(declare-fun res!30287 () Bool)

(assert (=> b!35529 (=> res!30287 e!23457)))

(declare-fun lt!53164 () tuple2!3538)

(declare-fun isPrefixOf!0 (BitStream!1468 BitStream!1468) Bool)

(assert (=> b!35529 (= res!30287 (not (isPrefixOf!0 (_2!1856 lt!53158) (_2!1856 lt!53164))))))

(declare-fun thiss!1379 () BitStream!1468)

(assert (=> b!35529 (isPrefixOf!0 thiss!1379 (_2!1856 lt!53164))))

(declare-fun lt!53156 () Unit!2621)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1468 BitStream!1468 BitStream!1468) Unit!2621)

(assert (=> b!35529 (= lt!53156 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1856 lt!53158) (_2!1856 lt!53164)))))

(declare-fun srcBuffer!2 () array!1901)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1468 array!1901 (_ BitVec 64) (_ BitVec 64)) tuple2!3538)

(assert (=> b!35529 (= lt!53164 (appendBitsMSBFirstLoop!0 (_2!1856 lt!53158) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!23443 () Bool)

(assert (=> b!35529 e!23443))

(declare-fun res!30286 () Bool)

(assert (=> b!35529 (=> (not res!30286) (not e!23443))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!35529 (= res!30286 (validate_offset_bits!1 ((_ sign_extend 32) (size!847 (buf!1175 (_2!1856 lt!53158)))) ((_ sign_extend 32) (currentByte!2560 thiss!1379)) ((_ sign_extend 32) (currentBit!2555 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!53163 () Unit!2621)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1468 array!1901 (_ BitVec 64)) Unit!2621)

(assert (=> b!35529 (= lt!53163 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1175 (_2!1856 lt!53158)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!3540 0))(
  ( (tuple2!3541 (_1!1857 BitStream!1468) (_2!1857 BitStream!1468)) )
))
(declare-fun lt!53160 () tuple2!3540)

(declare-fun reader!0 (BitStream!1468 BitStream!1468) tuple2!3540)

(assert (=> b!35529 (= lt!53160 (reader!0 thiss!1379 (_2!1856 lt!53158)))))

(declare-fun b!35530 () Bool)

(declare-fun e!23451 () Bool)

(declare-fun array_inv!787 (array!1901) Bool)

(assert (=> b!35530 (= e!23451 (array_inv!787 (buf!1175 thiss!1379)))))

(declare-fun b!35531 () Bool)

(declare-fun e!23444 () Bool)

(assert (=> b!35531 (= e!23447 e!23444)))

(declare-fun res!30284 () Bool)

(assert (=> b!35531 (=> res!30284 e!23444)))

(assert (=> b!35531 (= res!30284 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!53152 () tuple2!3540)

(declare-fun lt!53155 () (_ BitVec 64))

(declare-datatypes ((List!435 0))(
  ( (Nil!432) (Cons!431 (h!550 Bool) (t!1185 List!435)) )
))
(declare-fun lt!53151 () List!435)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1468 BitStream!1468 (_ BitVec 64)) List!435)

(assert (=> b!35531 (= lt!53151 (bitStreamReadBitsIntoList!0 (_2!1856 lt!53164) (_1!1857 lt!53152) lt!53155))))

(declare-fun lt!53146 () tuple2!3540)

(declare-fun lt!53161 () List!435)

(assert (=> b!35531 (= lt!53161 (bitStreamReadBitsIntoList!0 (_2!1856 lt!53164) (_1!1857 lt!53146) (bvsub to!314 i!635)))))

(assert (=> b!35531 (validate_offset_bits!1 ((_ sign_extend 32) (size!847 (buf!1175 (_2!1856 lt!53164)))) ((_ sign_extend 32) (currentByte!2560 (_2!1856 lt!53158))) ((_ sign_extend 32) (currentBit!2555 (_2!1856 lt!53158))) lt!53155)))

(declare-fun lt!53144 () Unit!2621)

(assert (=> b!35531 (= lt!53144 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1856 lt!53158) (buf!1175 (_2!1856 lt!53164)) lt!53155))))

(assert (=> b!35531 (= lt!53152 (reader!0 (_2!1856 lt!53158) (_2!1856 lt!53164)))))

(assert (=> b!35531 (validate_offset_bits!1 ((_ sign_extend 32) (size!847 (buf!1175 (_2!1856 lt!53164)))) ((_ sign_extend 32) (currentByte!2560 thiss!1379)) ((_ sign_extend 32) (currentBit!2555 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!53147 () Unit!2621)

(assert (=> b!35531 (= lt!53147 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1175 (_2!1856 lt!53164)) (bvsub to!314 i!635)))))

(assert (=> b!35531 (= lt!53146 (reader!0 thiss!1379 (_2!1856 lt!53164)))))

(declare-fun b!35532 () Bool)

(declare-fun e!23446 () Bool)

(declare-fun e!23448 () Bool)

(assert (=> b!35532 (= e!23446 e!23448)))

(declare-fun res!30281 () Bool)

(assert (=> b!35532 (=> res!30281 e!23448)))

(declare-fun lt!53148 () Bool)

(declare-fun head!272 (List!435) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1468 array!1901 (_ BitVec 64) (_ BitVec 64)) List!435)

(assert (=> b!35532 (= res!30281 (not (= (head!272 (byteArrayBitContentToList!0 (_2!1856 lt!53164) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!53148)))))

(declare-fun bitAt!0 (array!1901 (_ BitVec 64)) Bool)

(assert (=> b!35532 (= lt!53148 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!35533 () Bool)

(declare-fun res!30300 () Bool)

(declare-fun e!23454 () Bool)

(assert (=> b!35533 (=> res!30300 e!23454)))

(assert (=> b!35533 (= res!30300 (not (invariant!0 (currentBit!2555 (_2!1856 lt!53164)) (currentByte!2560 (_2!1856 lt!53164)) (size!847 (buf!1175 (_2!1856 lt!53164))))))))

(declare-fun res!30294 () Bool)

(declare-fun e!23449 () Bool)

(assert (=> start!7334 (=> (not res!30294) (not e!23449))))

(assert (=> start!7334 (= res!30294 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111)))))

(assert (=> start!7334 e!23449))

(assert (=> start!7334 true))

(declare-fun inv!12 (BitStream!1468) Bool)

(assert (=> start!7334 (and (inv!12 thiss!1379) e!23451)))

(assert (=> start!7334 (array_inv!787 srcBuffer!2)))

(declare-fun b!35534 () Bool)

(declare-fun res!30283 () Bool)

(assert (=> b!35534 (=> res!30283 e!23446)))

(declare-fun lt!53145 () Bool)

(assert (=> b!35534 (= res!30283 (not (= (head!272 lt!53161) lt!53145)))))

(declare-fun b!35535 () Bool)

(declare-fun e!23453 () Bool)

(declare-fun e!23455 () Bool)

(assert (=> b!35535 (= e!23453 (not e!23455))))

(declare-fun res!30288 () Bool)

(assert (=> b!35535 (=> res!30288 e!23455)))

(assert (=> b!35535 (= res!30288 (bvsge i!635 to!314))))

(assert (=> b!35535 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!53154 () Unit!2621)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1468) Unit!2621)

(assert (=> b!35535 (= lt!53154 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!53159 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!35535 (= lt!53159 (bitIndex!0 (size!847 (buf!1175 thiss!1379)) (currentByte!2560 thiss!1379) (currentBit!2555 thiss!1379)))))

(declare-fun b!35536 () Bool)

(declare-fun e!23450 () Bool)

(declare-fun lt!53166 () (_ BitVec 64))

(assert (=> b!35536 (= e!23450 (bvslt i!635 lt!53166))))

(declare-fun lt!53165 () Bool)

(assert (=> b!35536 (= lt!53165 (bitAt!0 (buf!1175 (_2!1856 lt!53164)) lt!53159))))

(declare-fun lt!53150 () (_ BitVec 64))

(declare-fun lt!53149 () Unit!2621)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1901 array!1901 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2621)

(assert (=> b!35536 (= lt!53149 (arrayBitRangesEqImpliesEq!0 (buf!1175 (_2!1856 lt!53158)) (buf!1175 (_2!1856 lt!53164)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!53159 lt!53150))))

(declare-fun b!35537 () Bool)

(declare-fun e!23458 () Bool)

(assert (=> b!35537 (= e!23444 e!23458)))

(declare-fun res!30289 () Bool)

(assert (=> b!35537 (=> res!30289 e!23458)))

(declare-fun lt!53162 () List!435)

(assert (=> b!35537 (= res!30289 (not (= lt!53162 lt!53151)))))

(assert (=> b!35537 (= lt!53151 lt!53162)))

(declare-fun tail!152 (List!435) List!435)

(assert (=> b!35537 (= lt!53162 (tail!152 lt!53161))))

(declare-fun lt!53167 () Unit!2621)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1468 BitStream!1468 BitStream!1468 BitStream!1468 (_ BitVec 64) List!435) Unit!2621)

(assert (=> b!35537 (= lt!53167 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1856 lt!53164) (_2!1856 lt!53164) (_1!1857 lt!53146) (_1!1857 lt!53152) (bvsub to!314 i!635) lt!53161))))

(declare-fun b!35538 () Bool)

(declare-fun res!30291 () Bool)

(assert (=> b!35538 (=> res!30291 e!23447)))

(assert (=> b!35538 (= res!30291 (not (invariant!0 (currentBit!2555 (_2!1856 lt!53158)) (currentByte!2560 (_2!1856 lt!53158)) (size!847 (buf!1175 (_2!1856 lt!53164))))))))

(declare-fun b!35539 () Bool)

(assert (=> b!35539 (= e!23443 (= (head!272 (byteArrayBitContentToList!0 (_2!1856 lt!53158) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!272 (bitStreamReadBitsIntoList!0 (_2!1856 lt!53158) (_1!1857 lt!53160) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!35540 () Bool)

(assert (=> b!35540 (= e!23454 e!23447)))

(declare-fun res!30290 () Bool)

(assert (=> b!35540 (=> res!30290 e!23447)))

(assert (=> b!35540 (= res!30290 (not (= (size!847 (buf!1175 (_2!1856 lt!53158))) (size!847 (buf!1175 (_2!1856 lt!53164))))))))

(declare-fun lt!53153 () (_ BitVec 64))

(assert (=> b!35540 (= lt!53153 (bvsub (bvsub (bvadd lt!53150 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!35540 (= lt!53150 (bitIndex!0 (size!847 (buf!1175 (_2!1856 lt!53158))) (currentByte!2560 (_2!1856 lt!53158)) (currentBit!2555 (_2!1856 lt!53158))))))

(assert (=> b!35540 (= (size!847 (buf!1175 (_2!1856 lt!53164))) (size!847 (buf!1175 thiss!1379)))))

(declare-fun b!35541 () Bool)

(declare-fun res!30293 () Bool)

(assert (=> b!35541 (=> res!30293 e!23454)))

(assert (=> b!35541 (= res!30293 (not (= (size!847 (buf!1175 thiss!1379)) (size!847 (buf!1175 (_2!1856 lt!53164))))))))

(declare-fun b!35542 () Bool)

(assert (=> b!35542 (= e!23458 e!23446)))

(declare-fun res!30295 () Bool)

(assert (=> b!35542 (=> res!30295 e!23446)))

(assert (=> b!35542 (= res!30295 (not (= lt!53145 (bitAt!0 (buf!1175 (_1!1857 lt!53152)) lt!53159))))))

(assert (=> b!35542 (= lt!53145 (bitAt!0 (buf!1175 (_1!1857 lt!53146)) lt!53159))))

(declare-fun b!35543 () Bool)

(assert (=> b!35543 (= e!23449 e!23453)))

(declare-fun res!30298 () Bool)

(assert (=> b!35543 (=> (not res!30298) (not e!23453))))

(assert (=> b!35543 (= res!30298 (bvsle to!314 lt!53166))))

(assert (=> b!35543 (= lt!53166 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!847 srcBuffer!2))))))

(declare-fun b!35544 () Bool)

(assert (=> b!35544 (= e!23448 e!23450)))

(declare-fun res!30296 () Bool)

(assert (=> b!35544 (=> res!30296 e!23450)))

(assert (=> b!35544 (= res!30296 (not (= lt!53165 lt!53148)))))

(assert (=> b!35544 (= lt!53165 (bitAt!0 (buf!1175 (_2!1856 lt!53158)) lt!53159))))

(declare-fun b!35545 () Bool)

(declare-fun res!30292 () Bool)

(assert (=> b!35545 (=> res!30292 e!23444)))

(declare-fun length!161 (List!435) Int)

(assert (=> b!35545 (= res!30292 (<= (length!161 lt!53161) 0))))

(declare-fun b!35546 () Bool)

(assert (=> b!35546 (= e!23457 e!23454)))

(declare-fun res!30299 () Bool)

(assert (=> b!35546 (=> res!30299 e!23454)))

(assert (=> b!35546 (= res!30299 (not (= lt!53153 (bvsub (bvadd lt!53159 to!314) i!635))))))

(assert (=> b!35546 (= lt!53153 (bitIndex!0 (size!847 (buf!1175 (_2!1856 lt!53164))) (currentByte!2560 (_2!1856 lt!53164)) (currentBit!2555 (_2!1856 lt!53164))))))

(declare-fun b!35547 () Bool)

(assert (=> b!35547 (= e!23455 e!23445)))

(declare-fun res!30282 () Bool)

(assert (=> b!35547 (=> res!30282 e!23445)))

(assert (=> b!35547 (= res!30282 (not (isPrefixOf!0 thiss!1379 (_2!1856 lt!53158))))))

(assert (=> b!35547 (validate_offset_bits!1 ((_ sign_extend 32) (size!847 (buf!1175 (_2!1856 lt!53158)))) ((_ sign_extend 32) (currentByte!2560 (_2!1856 lt!53158))) ((_ sign_extend 32) (currentBit!2555 (_2!1856 lt!53158))) lt!53155)))

(assert (=> b!35547 (= lt!53155 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!53157 () Unit!2621)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1468 BitStream!1468 (_ BitVec 64) (_ BitVec 64)) Unit!2621)

(assert (=> b!35547 (= lt!53157 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1856 lt!53158) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1468 (_ BitVec 8) (_ BitVec 32)) tuple2!3538)

(assert (=> b!35547 (= lt!53158 (appendBitFromByte!0 thiss!1379 (select (arr!1331 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!35548 () Bool)

(declare-fun res!30285 () Bool)

(assert (=> b!35548 (=> (not res!30285) (not e!23453))))

(assert (=> b!35548 (= res!30285 (validate_offset_bits!1 ((_ sign_extend 32) (size!847 (buf!1175 thiss!1379))) ((_ sign_extend 32) (currentByte!2560 thiss!1379)) ((_ sign_extend 32) (currentBit!2555 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!7334 res!30294) b!35543))

(assert (= (and b!35543 res!30298) b!35548))

(assert (= (and b!35548 res!30285) b!35535))

(assert (= (and b!35535 (not res!30288)) b!35547))

(assert (= (and b!35547 (not res!30282)) b!35529))

(assert (= (and b!35529 res!30286) b!35539))

(assert (= (and b!35529 (not res!30287)) b!35546))

(assert (= (and b!35546 (not res!30299)) b!35533))

(assert (= (and b!35533 (not res!30300)) b!35541))

(assert (= (and b!35541 (not res!30293)) b!35540))

(assert (= (and b!35540 (not res!30290)) b!35528))

(assert (= (and b!35528 (not res!30297)) b!35538))

(assert (= (and b!35538 (not res!30291)) b!35531))

(assert (= (and b!35531 (not res!30284)) b!35545))

(assert (= (and b!35545 (not res!30292)) b!35537))

(assert (= (and b!35537 (not res!30289)) b!35542))

(assert (= (and b!35542 (not res!30295)) b!35534))

(assert (= (and b!35534 (not res!30283)) b!35532))

(assert (= (and b!35532 (not res!30281)) b!35544))

(assert (= (and b!35544 (not res!30296)) b!35536))

(assert (= start!7334 b!35530))

(declare-fun m!53403 () Bool)

(assert (=> b!35531 m!53403))

(declare-fun m!53405 () Bool)

(assert (=> b!35531 m!53405))

(declare-fun m!53407 () Bool)

(assert (=> b!35531 m!53407))

(declare-fun m!53409 () Bool)

(assert (=> b!35531 m!53409))

(declare-fun m!53411 () Bool)

(assert (=> b!35531 m!53411))

(declare-fun m!53413 () Bool)

(assert (=> b!35531 m!53413))

(declare-fun m!53415 () Bool)

(assert (=> b!35531 m!53415))

(declare-fun m!53417 () Bool)

(assert (=> b!35531 m!53417))

(declare-fun m!53419 () Bool)

(assert (=> b!35539 m!53419))

(assert (=> b!35539 m!53419))

(declare-fun m!53421 () Bool)

(assert (=> b!35539 m!53421))

(declare-fun m!53423 () Bool)

(assert (=> b!35539 m!53423))

(assert (=> b!35539 m!53423))

(declare-fun m!53425 () Bool)

(assert (=> b!35539 m!53425))

(declare-fun m!53427 () Bool)

(assert (=> b!35538 m!53427))

(declare-fun m!53429 () Bool)

(assert (=> b!35545 m!53429))

(declare-fun m!53431 () Bool)

(assert (=> b!35544 m!53431))

(declare-fun m!53433 () Bool)

(assert (=> b!35547 m!53433))

(declare-fun m!53435 () Bool)

(assert (=> b!35547 m!53435))

(declare-fun m!53437 () Bool)

(assert (=> b!35547 m!53437))

(declare-fun m!53439 () Bool)

(assert (=> b!35547 m!53439))

(assert (=> b!35547 m!53437))

(declare-fun m!53441 () Bool)

(assert (=> b!35547 m!53441))

(declare-fun m!53443 () Bool)

(assert (=> b!35540 m!53443))

(declare-fun m!53445 () Bool)

(assert (=> b!35536 m!53445))

(declare-fun m!53447 () Bool)

(assert (=> b!35536 m!53447))

(declare-fun m!53449 () Bool)

(assert (=> b!35546 m!53449))

(declare-fun m!53451 () Bool)

(assert (=> start!7334 m!53451))

(declare-fun m!53453 () Bool)

(assert (=> start!7334 m!53453))

(declare-fun m!53455 () Bool)

(assert (=> b!35532 m!53455))

(assert (=> b!35532 m!53455))

(declare-fun m!53457 () Bool)

(assert (=> b!35532 m!53457))

(declare-fun m!53459 () Bool)

(assert (=> b!35532 m!53459))

(declare-fun m!53461 () Bool)

(assert (=> b!35535 m!53461))

(declare-fun m!53463 () Bool)

(assert (=> b!35535 m!53463))

(declare-fun m!53465 () Bool)

(assert (=> b!35535 m!53465))

(declare-fun m!53467 () Bool)

(assert (=> b!35534 m!53467))

(declare-fun m!53469 () Bool)

(assert (=> b!35548 m!53469))

(declare-fun m!53471 () Bool)

(assert (=> b!35530 m!53471))

(declare-fun m!53473 () Bool)

(assert (=> b!35533 m!53473))

(declare-fun m!53475 () Bool)

(assert (=> b!35528 m!53475))

(declare-fun m!53477 () Bool)

(assert (=> b!35542 m!53477))

(declare-fun m!53479 () Bool)

(assert (=> b!35542 m!53479))

(declare-fun m!53481 () Bool)

(assert (=> b!35529 m!53481))

(declare-fun m!53483 () Bool)

(assert (=> b!35529 m!53483))

(declare-fun m!53485 () Bool)

(assert (=> b!35529 m!53485))

(declare-fun m!53487 () Bool)

(assert (=> b!35529 m!53487))

(declare-fun m!53489 () Bool)

(assert (=> b!35529 m!53489))

(declare-fun m!53491 () Bool)

(assert (=> b!35529 m!53491))

(declare-fun m!53493 () Bool)

(assert (=> b!35529 m!53493))

(declare-fun m!53495 () Bool)

(assert (=> b!35537 m!53495))

(declare-fun m!53497 () Bool)

(assert (=> b!35537 m!53497))

(push 1)

(assert (not b!35538))

(assert (not b!35537))

(assert (not b!35539))

(assert (not b!35548))

(assert (not b!35529))

(assert (not b!35542))

(assert (not b!35532))

(assert (not b!35544))

(assert (not b!35530))

(assert (not start!7334))

(assert (not b!35536))

(assert (not b!35528))

(assert (not b!35547))

(assert (not b!35534))

(assert (not b!35545))

(assert (not b!35533))

(assert (not b!35535))

(assert (not b!35546))

(assert (not b!35540))

(assert (not b!35531))

(check-sat)

(pop 1)

(push 1)

(check-sat)

