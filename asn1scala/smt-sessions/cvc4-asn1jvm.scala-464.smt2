; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13138 () Bool)

(assert start!13138)

(declare-fun b!67440 () Bool)

(declare-fun e!44199 () Bool)

(declare-fun e!44197 () Bool)

(assert (=> b!67440 (= e!44199 e!44197)))

(declare-fun res!55850 () Bool)

(assert (=> b!67440 (=> res!55850 e!44197)))

(declare-datatypes ((List!713 0))(
  ( (Nil!710) (Cons!709 (h!828 Bool) (t!1463 List!713)) )
))
(declare-fun lt!107477 () List!713)

(declare-fun lt!107487 () List!713)

(assert (=> b!67440 (= res!55850 (not (= lt!107477 lt!107487)))))

(assert (=> b!67440 (= lt!107487 lt!107477)))

(declare-fun lt!107489 () List!713)

(declare-fun tail!317 (List!713) List!713)

(assert (=> b!67440 (= lt!107477 (tail!317 lt!107489))))

(declare-datatypes ((array!2870 0))(
  ( (array!2871 (arr!1897 (Array (_ BitVec 32) (_ BitVec 8))) (size!1327 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2276 0))(
  ( (BitStream!2277 (buf!1708 array!2870) (currentByte!3392 (_ BitVec 32)) (currentBit!3387 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4539 0))(
  ( (Unit!4540) )
))
(declare-datatypes ((tuple2!5936 0))(
  ( (tuple2!5937 (_1!3079 Unit!4539) (_2!3079 BitStream!2276)) )
))
(declare-fun lt!107485 () tuple2!5936)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-datatypes ((tuple2!5938 0))(
  ( (tuple2!5939 (_1!3080 BitStream!2276) (_2!3080 BitStream!2276)) )
))
(declare-fun lt!107478 () tuple2!5938)

(declare-fun lt!107481 () Unit!4539)

(declare-fun lt!107474 () tuple2!5938)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2276 BitStream!2276 BitStream!2276 BitStream!2276 (_ BitVec 64) List!713) Unit!4539)

(assert (=> b!67440 (= lt!107481 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3079 lt!107485) (_2!3079 lt!107485) (_1!3080 lt!107474) (_1!3080 lt!107478) (bvsub to!314 i!635) lt!107489))))

(declare-fun b!67441 () Bool)

(declare-fun res!55844 () Bool)

(declare-fun e!44205 () Bool)

(assert (=> b!67441 (=> res!55844 e!44205)))

(declare-fun thiss!1379 () BitStream!2276)

(assert (=> b!67441 (= res!55844 (not (= (size!1327 (buf!1708 thiss!1379)) (size!1327 (buf!1708 (_2!3079 lt!107485))))))))

(declare-fun b!67442 () Bool)

(declare-fun e!44203 () Bool)

(assert (=> b!67442 (= e!44205 e!44203)))

(declare-fun res!55843 () Bool)

(assert (=> b!67442 (=> res!55843 e!44203)))

(declare-fun lt!107492 () tuple2!5936)

(assert (=> b!67442 (= res!55843 (not (= (size!1327 (buf!1708 (_2!3079 lt!107492))) (size!1327 (buf!1708 (_2!3079 lt!107485))))))))

(declare-fun lt!107482 () (_ BitVec 64))

(declare-fun lt!107493 () (_ BitVec 64))

(assert (=> b!67442 (= lt!107482 lt!107493)))

(declare-fun lt!107490 () (_ BitVec 64))

(assert (=> b!67442 (= lt!107493 (bvsub lt!107490 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!67442 (= lt!107490 (bvsub (bvadd (bitIndex!0 (size!1327 (buf!1708 (_2!3079 lt!107492))) (currentByte!3392 (_2!3079 lt!107492)) (currentBit!3387 (_2!3079 lt!107492))) to!314) i!635))))

(assert (=> b!67442 (= (size!1327 (buf!1708 (_2!3079 lt!107485))) (size!1327 (buf!1708 thiss!1379)))))

(declare-fun b!67443 () Bool)

(declare-fun res!55839 () Bool)

(declare-fun e!44200 () Bool)

(assert (=> b!67443 (=> (not res!55839) (not e!44200))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!67443 (= res!55839 (validate_offset_bits!1 ((_ sign_extend 32) (size!1327 (buf!1708 thiss!1379))) ((_ sign_extend 32) (currentByte!3392 thiss!1379)) ((_ sign_extend 32) (currentBit!3387 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun srcBuffer!2 () array!2870)

(declare-fun e!44202 () Bool)

(declare-fun lt!107483 () tuple2!5938)

(declare-fun b!67444 () Bool)

(declare-fun head!532 (List!713) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2276 array!2870 (_ BitVec 64) (_ BitVec 64)) List!713)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2276 BitStream!2276 (_ BitVec 64)) List!713)

(assert (=> b!67444 (= e!44202 (= (head!532 (byteArrayBitContentToList!0 (_2!3079 lt!107492) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!532 (bitStreamReadBitsIntoList!0 (_2!3079 lt!107492) (_1!3080 lt!107483) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!67445 () Bool)

(declare-fun e!44196 () Bool)

(assert (=> b!67445 (= e!44200 (not e!44196))))

(declare-fun res!55857 () Bool)

(assert (=> b!67445 (=> res!55857 e!44196)))

(assert (=> b!67445 (= res!55857 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2276 BitStream!2276) Bool)

(assert (=> b!67445 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!107475 () Unit!4539)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2276) Unit!4539)

(assert (=> b!67445 (= lt!107475 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!107476 () (_ BitVec 64))

(assert (=> b!67445 (= lt!107476 (bitIndex!0 (size!1327 (buf!1708 thiss!1379)) (currentByte!3392 thiss!1379) (currentBit!3387 thiss!1379)))))

(declare-fun b!67446 () Bool)

(assert (=> b!67446 (= e!44203 e!44199)))

(declare-fun res!55847 () Bool)

(assert (=> b!67446 (=> res!55847 e!44199)))

(assert (=> b!67446 (= res!55847 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!107484 () (_ BitVec 64))

(assert (=> b!67446 (= lt!107487 (bitStreamReadBitsIntoList!0 (_2!3079 lt!107485) (_1!3080 lt!107478) lt!107484))))

(assert (=> b!67446 (= lt!107489 (bitStreamReadBitsIntoList!0 (_2!3079 lt!107485) (_1!3080 lt!107474) (bvsub to!314 i!635)))))

(assert (=> b!67446 (validate_offset_bits!1 ((_ sign_extend 32) (size!1327 (buf!1708 (_2!3079 lt!107485)))) ((_ sign_extend 32) (currentByte!3392 (_2!3079 lt!107492))) ((_ sign_extend 32) (currentBit!3387 (_2!3079 lt!107492))) lt!107484)))

(declare-fun lt!107480 () Unit!4539)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2276 array!2870 (_ BitVec 64)) Unit!4539)

(assert (=> b!67446 (= lt!107480 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3079 lt!107492) (buf!1708 (_2!3079 lt!107485)) lt!107484))))

(declare-fun reader!0 (BitStream!2276 BitStream!2276) tuple2!5938)

(assert (=> b!67446 (= lt!107478 (reader!0 (_2!3079 lt!107492) (_2!3079 lt!107485)))))

(assert (=> b!67446 (validate_offset_bits!1 ((_ sign_extend 32) (size!1327 (buf!1708 (_2!3079 lt!107485)))) ((_ sign_extend 32) (currentByte!3392 thiss!1379)) ((_ sign_extend 32) (currentBit!3387 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!107491 () Unit!4539)

(assert (=> b!67446 (= lt!107491 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1708 (_2!3079 lt!107485)) (bvsub to!314 i!635)))))

(assert (=> b!67446 (= lt!107474 (reader!0 thiss!1379 (_2!3079 lt!107485)))))

(declare-fun b!67448 () Bool)

(declare-fun e!44195 () Bool)

(assert (=> b!67448 (= e!44196 e!44195)))

(declare-fun res!55846 () Bool)

(assert (=> b!67448 (=> res!55846 e!44195)))

(assert (=> b!67448 (= res!55846 (not (isPrefixOf!0 thiss!1379 (_2!3079 lt!107492))))))

(assert (=> b!67448 (validate_offset_bits!1 ((_ sign_extend 32) (size!1327 (buf!1708 (_2!3079 lt!107492)))) ((_ sign_extend 32) (currentByte!3392 (_2!3079 lt!107492))) ((_ sign_extend 32) (currentBit!3387 (_2!3079 lt!107492))) lt!107484)))

(assert (=> b!67448 (= lt!107484 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!107486 () Unit!4539)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2276 BitStream!2276 (_ BitVec 64) (_ BitVec 64)) Unit!4539)

(assert (=> b!67448 (= lt!107486 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3079 lt!107492) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2276 (_ BitVec 8) (_ BitVec 32)) tuple2!5936)

(assert (=> b!67448 (= lt!107492 (appendBitFromByte!0 thiss!1379 (select (arr!1897 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!67449 () Bool)

(declare-fun e!44198 () Bool)

(declare-fun lt!107488 () (_ BitVec 64))

(assert (=> b!67449 (= e!44198 (or (= lt!107488 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!107488 (bvand lt!107493 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!67449 (= lt!107488 (bvand lt!107490 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!67450 () Bool)

(declare-fun e!44201 () Bool)

(assert (=> b!67450 (= e!44195 e!44201)))

(declare-fun res!55845 () Bool)

(assert (=> b!67450 (=> res!55845 e!44201)))

(assert (=> b!67450 (= res!55845 (not (isPrefixOf!0 (_2!3079 lt!107492) (_2!3079 lt!107485))))))

(assert (=> b!67450 (isPrefixOf!0 thiss!1379 (_2!3079 lt!107485))))

(declare-fun lt!107473 () Unit!4539)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2276 BitStream!2276 BitStream!2276) Unit!4539)

(assert (=> b!67450 (= lt!107473 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3079 lt!107492) (_2!3079 lt!107485)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2276 array!2870 (_ BitVec 64) (_ BitVec 64)) tuple2!5936)

(assert (=> b!67450 (= lt!107485 (appendBitsMSBFirstLoop!0 (_2!3079 lt!107492) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!67450 e!44202))

(declare-fun res!55856 () Bool)

(assert (=> b!67450 (=> (not res!55856) (not e!44202))))

(assert (=> b!67450 (= res!55856 (validate_offset_bits!1 ((_ sign_extend 32) (size!1327 (buf!1708 (_2!3079 lt!107492)))) ((_ sign_extend 32) (currentByte!3392 thiss!1379)) ((_ sign_extend 32) (currentBit!3387 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!107479 () Unit!4539)

(assert (=> b!67450 (= lt!107479 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1708 (_2!3079 lt!107492)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!67450 (= lt!107483 (reader!0 thiss!1379 (_2!3079 lt!107492)))))

(declare-fun b!67451 () Bool)

(assert (=> b!67451 (= e!44201 e!44205)))

(declare-fun res!55842 () Bool)

(assert (=> b!67451 (=> res!55842 e!44205)))

(assert (=> b!67451 (= res!55842 (not (= lt!107482 (bvsub (bvadd lt!107476 to!314) i!635))))))

(assert (=> b!67451 (= lt!107482 (bitIndex!0 (size!1327 (buf!1708 (_2!3079 lt!107485))) (currentByte!3392 (_2!3079 lt!107485)) (currentBit!3387 (_2!3079 lt!107485))))))

(declare-fun b!67452 () Bool)

(declare-fun res!55840 () Bool)

(assert (=> b!67452 (=> res!55840 e!44198)))

(declare-fun lt!107472 () Bool)

(declare-fun bitAt!0 (array!2870 (_ BitVec 64)) Bool)

(assert (=> b!67452 (= res!55840 (not (= (bitAt!0 (buf!1708 (_2!3079 lt!107492)) lt!107476) lt!107472)))))

(declare-fun b!67453 () Bool)

(declare-fun e!44204 () Bool)

(declare-fun array_inv!1197 (array!2870) Bool)

(assert (=> b!67453 (= e!44204 (array_inv!1197 (buf!1708 thiss!1379)))))

(declare-fun b!67454 () Bool)

(declare-fun e!44194 () Bool)

(assert (=> b!67454 (= e!44197 e!44194)))

(declare-fun res!55841 () Bool)

(assert (=> b!67454 (=> res!55841 e!44194)))

(declare-fun lt!107494 () Bool)

(assert (=> b!67454 (= res!55841 (not (= lt!107494 (bitAt!0 (buf!1708 (_1!3080 lt!107478)) lt!107476))))))

(assert (=> b!67454 (= lt!107494 (bitAt!0 (buf!1708 (_1!3080 lt!107474)) lt!107476))))

(declare-fun b!67455 () Bool)

(declare-fun res!55851 () Bool)

(assert (=> b!67455 (=> res!55851 e!44203)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!67455 (= res!55851 (not (invariant!0 (currentBit!3387 (_2!3079 lt!107492)) (currentByte!3392 (_2!3079 lt!107492)) (size!1327 (buf!1708 (_2!3079 lt!107485))))))))

(declare-fun b!67456 () Bool)

(declare-fun res!55853 () Bool)

(assert (=> b!67456 (=> res!55853 e!44199)))

(declare-fun length!341 (List!713) Int)

(assert (=> b!67456 (= res!55853 (<= (length!341 lt!107489) 0))))

(declare-fun b!67457 () Bool)

(declare-fun res!55854 () Bool)

(assert (=> b!67457 (=> res!55854 e!44203)))

(assert (=> b!67457 (= res!55854 (not (invariant!0 (currentBit!3387 (_2!3079 lt!107492)) (currentByte!3392 (_2!3079 lt!107492)) (size!1327 (buf!1708 (_2!3079 lt!107492))))))))

(declare-fun res!55852 () Bool)

(assert (=> start!13138 (=> (not res!55852) (not e!44200))))

(assert (=> start!13138 (= res!55852 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1327 srcBuffer!2))))))))

(assert (=> start!13138 e!44200))

(assert (=> start!13138 true))

(assert (=> start!13138 (array_inv!1197 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2276) Bool)

(assert (=> start!13138 (and (inv!12 thiss!1379) e!44204)))

(declare-fun b!67447 () Bool)

(declare-fun res!55849 () Bool)

(assert (=> b!67447 (=> res!55849 e!44205)))

(assert (=> b!67447 (= res!55849 (not (invariant!0 (currentBit!3387 (_2!3079 lt!107485)) (currentByte!3392 (_2!3079 lt!107485)) (size!1327 (buf!1708 (_2!3079 lt!107485))))))))

(declare-fun b!67458 () Bool)

(assert (=> b!67458 (= e!44194 e!44198)))

(declare-fun res!55848 () Bool)

(assert (=> b!67458 (=> res!55848 e!44198)))

(assert (=> b!67458 (= res!55848 (not (= (head!532 (byteArrayBitContentToList!0 (_2!3079 lt!107485) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!107472)))))

(assert (=> b!67458 (= lt!107472 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!67459 () Bool)

(declare-fun res!55855 () Bool)

(assert (=> b!67459 (=> res!55855 e!44194)))

(assert (=> b!67459 (= res!55855 (not (= (head!532 lt!107489) lt!107494)))))

(assert (= (and start!13138 res!55852) b!67443))

(assert (= (and b!67443 res!55839) b!67445))

(assert (= (and b!67445 (not res!55857)) b!67448))

(assert (= (and b!67448 (not res!55846)) b!67450))

(assert (= (and b!67450 res!55856) b!67444))

(assert (= (and b!67450 (not res!55845)) b!67451))

(assert (= (and b!67451 (not res!55842)) b!67447))

(assert (= (and b!67447 (not res!55849)) b!67441))

(assert (= (and b!67441 (not res!55844)) b!67442))

(assert (= (and b!67442 (not res!55843)) b!67457))

(assert (= (and b!67457 (not res!55854)) b!67455))

(assert (= (and b!67455 (not res!55851)) b!67446))

(assert (= (and b!67446 (not res!55847)) b!67456))

(assert (= (and b!67456 (not res!55853)) b!67440))

(assert (= (and b!67440 (not res!55850)) b!67454))

(assert (= (and b!67454 (not res!55841)) b!67459))

(assert (= (and b!67459 (not res!55855)) b!67458))

(assert (= (and b!67458 (not res!55848)) b!67452))

(assert (= (and b!67452 (not res!55840)) b!67449))

(assert (= start!13138 b!67453))

(declare-fun m!107405 () Bool)

(assert (=> b!67455 m!107405))

(declare-fun m!107407 () Bool)

(assert (=> b!67443 m!107407))

(declare-fun m!107409 () Bool)

(assert (=> b!67451 m!107409))

(declare-fun m!107411 () Bool)

(assert (=> b!67457 m!107411))

(declare-fun m!107413 () Bool)

(assert (=> b!67446 m!107413))

(declare-fun m!107415 () Bool)

(assert (=> b!67446 m!107415))

(declare-fun m!107417 () Bool)

(assert (=> b!67446 m!107417))

(declare-fun m!107419 () Bool)

(assert (=> b!67446 m!107419))

(declare-fun m!107421 () Bool)

(assert (=> b!67446 m!107421))

(declare-fun m!107423 () Bool)

(assert (=> b!67446 m!107423))

(declare-fun m!107425 () Bool)

(assert (=> b!67446 m!107425))

(declare-fun m!107427 () Bool)

(assert (=> b!67446 m!107427))

(declare-fun m!107429 () Bool)

(assert (=> b!67453 m!107429))

(declare-fun m!107431 () Bool)

(assert (=> b!67456 m!107431))

(declare-fun m!107433 () Bool)

(assert (=> b!67454 m!107433))

(declare-fun m!107435 () Bool)

(assert (=> b!67454 m!107435))

(declare-fun m!107437 () Bool)

(assert (=> b!67442 m!107437))

(declare-fun m!107439 () Bool)

(assert (=> b!67445 m!107439))

(declare-fun m!107441 () Bool)

(assert (=> b!67445 m!107441))

(declare-fun m!107443 () Bool)

(assert (=> b!67445 m!107443))

(declare-fun m!107445 () Bool)

(assert (=> b!67458 m!107445))

(assert (=> b!67458 m!107445))

(declare-fun m!107447 () Bool)

(assert (=> b!67458 m!107447))

(declare-fun m!107449 () Bool)

(assert (=> b!67458 m!107449))

(declare-fun m!107451 () Bool)

(assert (=> b!67448 m!107451))

(declare-fun m!107453 () Bool)

(assert (=> b!67448 m!107453))

(declare-fun m!107455 () Bool)

(assert (=> b!67448 m!107455))

(assert (=> b!67448 m!107451))

(declare-fun m!107457 () Bool)

(assert (=> b!67448 m!107457))

(declare-fun m!107459 () Bool)

(assert (=> b!67448 m!107459))

(declare-fun m!107461 () Bool)

(assert (=> b!67444 m!107461))

(assert (=> b!67444 m!107461))

(declare-fun m!107463 () Bool)

(assert (=> b!67444 m!107463))

(declare-fun m!107465 () Bool)

(assert (=> b!67444 m!107465))

(assert (=> b!67444 m!107465))

(declare-fun m!107467 () Bool)

(assert (=> b!67444 m!107467))

(declare-fun m!107469 () Bool)

(assert (=> b!67459 m!107469))

(declare-fun m!107471 () Bool)

(assert (=> start!13138 m!107471))

(declare-fun m!107473 () Bool)

(assert (=> start!13138 m!107473))

(declare-fun m!107475 () Bool)

(assert (=> b!67452 m!107475))

(declare-fun m!107477 () Bool)

(assert (=> b!67440 m!107477))

(declare-fun m!107479 () Bool)

(assert (=> b!67440 m!107479))

(declare-fun m!107481 () Bool)

(assert (=> b!67447 m!107481))

(declare-fun m!107483 () Bool)

(assert (=> b!67450 m!107483))

(declare-fun m!107485 () Bool)

(assert (=> b!67450 m!107485))

(declare-fun m!107487 () Bool)

(assert (=> b!67450 m!107487))

(declare-fun m!107489 () Bool)

(assert (=> b!67450 m!107489))

(declare-fun m!107491 () Bool)

(assert (=> b!67450 m!107491))

(declare-fun m!107493 () Bool)

(assert (=> b!67450 m!107493))

(declare-fun m!107495 () Bool)

(assert (=> b!67450 m!107495))

(push 1)

(assert (not b!67440))

(assert (not b!67447))

(assert (not b!67451))

(assert (not b!67458))

(assert (not b!67446))

(assert (not b!67453))

(assert (not b!67443))

(assert (not b!67459))

(assert (not b!67455))

(assert (not start!13138))

(assert (not b!67445))

(assert (not b!67457))

(assert (not b!67444))

(assert (not b!67450))

(assert (not b!67454))

(assert (not b!67448))

(assert (not b!67456))

(assert (not b!67442))

(assert (not b!67452))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!21350 () Bool)

(assert (=> d!21350 (= (invariant!0 (currentBit!3387 (_2!3079 lt!107492)) (currentByte!3392 (_2!3079 lt!107492)) (size!1327 (buf!1708 (_2!3079 lt!107492)))) (and (bvsge (currentBit!3387 (_2!3079 lt!107492)) #b00000000000000000000000000000000) (bvslt (currentBit!3387 (_2!3079 lt!107492)) #b00000000000000000000000000001000) (bvsge (currentByte!3392 (_2!3079 lt!107492)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3392 (_2!3079 lt!107492)) (size!1327 (buf!1708 (_2!3079 lt!107492)))) (and (= (currentBit!3387 (_2!3079 lt!107492)) #b00000000000000000000000000000000) (= (currentByte!3392 (_2!3079 lt!107492)) (size!1327 (buf!1708 (_2!3079 lt!107492))))))))))

(assert (=> b!67457 d!21350))

(declare-fun d!21352 () Bool)

(assert (=> d!21352 (= (invariant!0 (currentBit!3387 (_2!3079 lt!107485)) (currentByte!3392 (_2!3079 lt!107485)) (size!1327 (buf!1708 (_2!3079 lt!107485)))) (and (bvsge (currentBit!3387 (_2!3079 lt!107485)) #b00000000000000000000000000000000) (bvslt (currentBit!3387 (_2!3079 lt!107485)) #b00000000000000000000000000001000) (bvsge (currentByte!3392 (_2!3079 lt!107485)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3392 (_2!3079 lt!107485)) (size!1327 (buf!1708 (_2!3079 lt!107485)))) (and (= (currentBit!3387 (_2!3079 lt!107485)) #b00000000000000000000000000000000) (= (currentByte!3392 (_2!3079 lt!107485)) (size!1327 (buf!1708 (_2!3079 lt!107485))))))))))

(assert (=> b!67447 d!21352))

(declare-fun d!21354 () Bool)

(assert (=> d!21354 (= (head!532 (byteArrayBitContentToList!0 (_2!3079 lt!107485) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!828 (byteArrayBitContentToList!0 (_2!3079 lt!107485) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!67458 d!21354))

(declare-fun d!21356 () Bool)

(declare-fun c!4932 () Bool)

(assert (=> d!21356 (= c!4932 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!44231 () List!713)

(assert (=> d!21356 (= (byteArrayBitContentToList!0 (_2!3079 lt!107485) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!44231)))

(declare-fun b!67498 () Bool)

(assert (=> b!67498 (= e!44231 Nil!710)))

(declare-fun b!67499 () Bool)

(assert (=> b!67499 (= e!44231 (Cons!709 (not (= (bvand ((_ sign_extend 24) (select (arr!1897 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3079 lt!107485) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!21356 c!4932) b!67498))

(assert (= (and d!21356 (not c!4932)) b!67499))

(assert (=> b!67499 m!107451))

(declare-fun m!107533 () Bool)

(assert (=> b!67499 m!107533))

(declare-fun m!107535 () Bool)

(assert (=> b!67499 m!107535))

(assert (=> b!67458 d!21356))

(declare-fun d!21358 () Bool)

(assert (=> d!21358 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1897 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5173 () Bool)

(assert (= bs!5173 d!21358))

(assert (=> bs!5173 m!107451))

(assert (=> bs!5173 m!107533))

(assert (=> b!67458 d!21358))

(declare-fun d!21360 () Bool)

(declare-fun res!55894 () Bool)

(declare-fun e!44237 () Bool)

(assert (=> d!21360 (=> (not res!55894) (not e!44237))))

(assert (=> d!21360 (= res!55894 (= (size!1327 (buf!1708 thiss!1379)) (size!1327 (buf!1708 (_2!3079 lt!107492)))))))

(assert (=> d!21360 (= (isPrefixOf!0 thiss!1379 (_2!3079 lt!107492)) e!44237)))

(declare-fun b!67506 () Bool)

(declare-fun res!55892 () Bool)

(assert (=> b!67506 (=> (not res!55892) (not e!44237))))

(assert (=> b!67506 (= res!55892 (bvsle (bitIndex!0 (size!1327 (buf!1708 thiss!1379)) (currentByte!3392 thiss!1379) (currentBit!3387 thiss!1379)) (bitIndex!0 (size!1327 (buf!1708 (_2!3079 lt!107492))) (currentByte!3392 (_2!3079 lt!107492)) (currentBit!3387 (_2!3079 lt!107492)))))))

(declare-fun b!67507 () Bool)

(declare-fun e!44236 () Bool)

(assert (=> b!67507 (= e!44237 e!44236)))

(declare-fun res!55893 () Bool)

(assert (=> b!67507 (=> res!55893 e!44236)))

(assert (=> b!67507 (= res!55893 (= (size!1327 (buf!1708 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!67508 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2870 array!2870 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!67508 (= e!44236 (arrayBitRangesEq!0 (buf!1708 thiss!1379) (buf!1708 (_2!3079 lt!107492)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1327 (buf!1708 thiss!1379)) (currentByte!3392 thiss!1379) (currentBit!3387 thiss!1379))))))

(assert (= (and d!21360 res!55894) b!67506))

(assert (= (and b!67506 res!55892) b!67507))

(assert (= (and b!67507 (not res!55893)) b!67508))

(assert (=> b!67506 m!107443))

(assert (=> b!67506 m!107437))

(assert (=> b!67508 m!107443))

(assert (=> b!67508 m!107443))

(declare-fun m!107537 () Bool)

(assert (=> b!67508 m!107537))

(assert (=> b!67448 d!21360))

(declare-fun d!21362 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!21362 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1327 (buf!1708 (_2!3079 lt!107492)))) ((_ sign_extend 32) (currentByte!3392 (_2!3079 lt!107492))) ((_ sign_extend 32) (currentBit!3387 (_2!3079 lt!107492))) lt!107484) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1327 (buf!1708 (_2!3079 lt!107492)))) ((_ sign_extend 32) (currentByte!3392 (_2!3079 lt!107492))) ((_ sign_extend 32) (currentBit!3387 (_2!3079 lt!107492)))) lt!107484))))

(declare-fun bs!5174 () Bool)

(assert (= bs!5174 d!21362))

(declare-fun m!107539 () Bool)

(assert (=> bs!5174 m!107539))

(assert (=> b!67448 d!21362))

(declare-fun d!21364 () Bool)

(declare-fun e!44240 () Bool)

(assert (=> d!21364 e!44240))

(declare-fun res!55897 () Bool)

(assert (=> d!21364 (=> (not res!55897) (not e!44240))))

(assert (=> d!21364 (= res!55897 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!107539 () Unit!4539)

(declare-fun choose!27 (BitStream!2276 BitStream!2276 (_ BitVec 64) (_ BitVec 64)) Unit!4539)

(assert (=> d!21364 (= lt!107539 (choose!27 thiss!1379 (_2!3079 lt!107492) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!21364 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!21364 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3079 lt!107492) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!107539)))

(declare-fun b!67511 () Bool)

(assert (=> b!67511 (= e!44240 (validate_offset_bits!1 ((_ sign_extend 32) (size!1327 (buf!1708 (_2!3079 lt!107492)))) ((_ sign_extend 32) (currentByte!3392 (_2!3079 lt!107492))) ((_ sign_extend 32) (currentBit!3387 (_2!3079 lt!107492))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!21364 res!55897) b!67511))

(declare-fun m!107541 () Bool)

(assert (=> d!21364 m!107541))

(declare-fun m!107543 () Bool)

(assert (=> b!67511 m!107543))

(assert (=> b!67448 d!21364))

(declare-fun d!21366 () Bool)

(declare-fun e!44252 () Bool)

(assert (=> d!21366 e!44252))

(declare-fun res!55916 () Bool)

(assert (=> d!21366 (=> (not res!55916) (not e!44252))))

(declare-fun lt!107569 () tuple2!5936)

(assert (=> d!21366 (= res!55916 (= (size!1327 (buf!1708 (_2!3079 lt!107569))) (size!1327 (buf!1708 thiss!1379))))))

(declare-fun lt!107572 () (_ BitVec 8))

(declare-fun lt!107564 () array!2870)

(assert (=> d!21366 (= lt!107572 (select (arr!1897 lt!107564) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!21366 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1327 lt!107564)))))

(assert (=> d!21366 (= lt!107564 (array!2871 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!107567 () tuple2!5936)

(assert (=> d!21366 (= lt!107569 (tuple2!5937 (_1!3079 lt!107567) (_2!3079 lt!107567)))))

(declare-fun lt!107574 () tuple2!5936)

(assert (=> d!21366 (= lt!107567 lt!107574)))

(declare-fun e!44250 () Bool)

(assert (=> d!21366 e!44250))

(declare-fun res!55915 () Bool)

(assert (=> d!21366 (=> (not res!55915) (not e!44250))))

(assert (=> d!21366 (= res!55915 (= (size!1327 (buf!1708 thiss!1379)) (size!1327 (buf!1708 (_2!3079 lt!107574)))))))

(declare-fun lt!107575 () Bool)

(declare-fun appendBit!0 (BitStream!2276 Bool) tuple2!5936)

(assert (=> d!21366 (= lt!107574 (appendBit!0 thiss!1379 lt!107575))))

(assert (=> d!21366 (= lt!107575 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1897 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!21366 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!21366 (= (appendBitFromByte!0 thiss!1379 (select (arr!1897 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!107569)))

(declare-fun b!67529 () Bool)

(declare-fun res!55921 () Bool)

(assert (=> b!67529 (=> (not res!55921) (not e!44250))))

(assert (=> b!67529 (= res!55921 (isPrefixOf!0 thiss!1379 (_2!3079 lt!107574)))))

(declare-fun b!67530 () Bool)

(declare-fun e!44249 () Bool)

(assert (=> b!67530 (= e!44252 e!44249)))

(declare-fun res!55919 () Bool)

(assert (=> b!67530 (=> (not res!55919) (not e!44249))))

(declare-datatypes ((tuple2!5948 0))(
  ( (tuple2!5949 (_1!3085 BitStream!2276) (_2!3085 Bool)) )
))
(declare-fun lt!107570 () tuple2!5948)

(assert (=> b!67530 (= res!55919 (and (= (_2!3085 lt!107570) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1897 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!107572)) #b00000000000000000000000000000000))) (= (_1!3085 lt!107570) (_2!3079 lt!107569))))))

(declare-datatypes ((tuple2!5950 0))(
  ( (tuple2!5951 (_1!3086 array!2870) (_2!3086 BitStream!2276)) )
))
(declare-fun lt!107565 () tuple2!5950)

(declare-fun lt!107568 () BitStream!2276)

(declare-fun readBits!0 (BitStream!2276 (_ BitVec 64)) tuple2!5950)

(assert (=> b!67530 (= lt!107565 (readBits!0 lt!107568 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!2276) tuple2!5948)

(assert (=> b!67530 (= lt!107570 (readBitPure!0 lt!107568))))

(declare-fun readerFrom!0 (BitStream!2276 (_ BitVec 32) (_ BitVec 32)) BitStream!2276)

(assert (=> b!67530 (= lt!107568 (readerFrom!0 (_2!3079 lt!107569) (currentBit!3387 thiss!1379) (currentByte!3392 thiss!1379)))))

(declare-fun b!67531 () Bool)

(declare-fun res!55920 () Bool)

(assert (=> b!67531 (=> (not res!55920) (not e!44252))))

(declare-fun lt!107566 () (_ BitVec 64))

(declare-fun lt!107573 () (_ BitVec 64))

(assert (=> b!67531 (= res!55920 (= (bitIndex!0 (size!1327 (buf!1708 (_2!3079 lt!107569))) (currentByte!3392 (_2!3079 lt!107569)) (currentBit!3387 (_2!3079 lt!107569))) (bvadd lt!107566 lt!107573)))))

(assert (=> b!67531 (or (not (= (bvand lt!107566 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!107573 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!107566 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!107566 lt!107573) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!67531 (= lt!107573 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!67531 (= lt!107566 (bitIndex!0 (size!1327 (buf!1708 thiss!1379)) (currentByte!3392 thiss!1379) (currentBit!3387 thiss!1379)))))

(declare-fun b!67532 () Bool)

(assert (=> b!67532 (= e!44249 (= (bitIndex!0 (size!1327 (buf!1708 (_1!3085 lt!107570))) (currentByte!3392 (_1!3085 lt!107570)) (currentBit!3387 (_1!3085 lt!107570))) (bitIndex!0 (size!1327 (buf!1708 (_2!3079 lt!107569))) (currentByte!3392 (_2!3079 lt!107569)) (currentBit!3387 (_2!3079 lt!107569)))))))

(declare-fun b!67533 () Bool)

(declare-fun e!44251 () Bool)

(assert (=> b!67533 (= e!44250 e!44251)))

(declare-fun res!55914 () Bool)

(assert (=> b!67533 (=> (not res!55914) (not e!44251))))

(declare-fun lt!107571 () tuple2!5948)

(assert (=> b!67533 (= res!55914 (and (= (_2!3085 lt!107571) lt!107575) (= (_1!3085 lt!107571) (_2!3079 lt!107574))))))

(assert (=> b!67533 (= lt!107571 (readBitPure!0 (readerFrom!0 (_2!3079 lt!107574) (currentBit!3387 thiss!1379) (currentByte!3392 thiss!1379))))))

(declare-fun b!67534 () Bool)

(declare-fun res!55917 () Bool)

(assert (=> b!67534 (=> (not res!55917) (not e!44250))))

(assert (=> b!67534 (= res!55917 (= (bitIndex!0 (size!1327 (buf!1708 (_2!3079 lt!107574))) (currentByte!3392 (_2!3079 lt!107574)) (currentBit!3387 (_2!3079 lt!107574))) (bvadd (bitIndex!0 (size!1327 (buf!1708 thiss!1379)) (currentByte!3392 thiss!1379) (currentBit!3387 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!67535 () Bool)

(assert (=> b!67535 (= e!44251 (= (bitIndex!0 (size!1327 (buf!1708 (_1!3085 lt!107571))) (currentByte!3392 (_1!3085 lt!107571)) (currentBit!3387 (_1!3085 lt!107571))) (bitIndex!0 (size!1327 (buf!1708 (_2!3079 lt!107574))) (currentByte!3392 (_2!3079 lt!107574)) (currentBit!3387 (_2!3079 lt!107574)))))))

(declare-fun b!67536 () Bool)

(declare-fun res!55918 () Bool)

(assert (=> b!67536 (=> (not res!55918) (not e!44252))))

(assert (=> b!67536 (= res!55918 (isPrefixOf!0 thiss!1379 (_2!3079 lt!107569)))))

(assert (= (and d!21366 res!55915) b!67534))

(assert (= (and b!67534 res!55917) b!67529))

(assert (= (and b!67529 res!55921) b!67533))

(assert (= (and b!67533 res!55914) b!67535))

(assert (= (and d!21366 res!55916) b!67531))

(assert (= (and b!67531 res!55920) b!67536))

(assert (= (and b!67536 res!55918) b!67530))

(assert (= (and b!67530 res!55919) b!67532))

(declare-fun m!107545 () Bool)

(assert (=> b!67535 m!107545))

(declare-fun m!107547 () Bool)

(assert (=> b!67535 m!107547))

(declare-fun m!107549 () Bool)

(assert (=> b!67532 m!107549))

(declare-fun m!107551 () Bool)

(assert (=> b!67532 m!107551))

(declare-fun m!107553 () Bool)

(assert (=> b!67536 m!107553))

(assert (=> b!67534 m!107547))

(assert (=> b!67534 m!107443))

(declare-fun m!107555 () Bool)

(assert (=> d!21366 m!107555))

(declare-fun m!107557 () Bool)

(assert (=> d!21366 m!107557))

(assert (=> d!21366 m!107533))

(assert (=> b!67531 m!107551))

(assert (=> b!67531 m!107443))

(declare-fun m!107559 () Bool)

(assert (=> b!67533 m!107559))

(assert (=> b!67533 m!107559))

(declare-fun m!107561 () Bool)

(assert (=> b!67533 m!107561))

(declare-fun m!107563 () Bool)

(assert (=> b!67529 m!107563))

(declare-fun m!107565 () Bool)

(assert (=> b!67530 m!107565))

(declare-fun m!107567 () Bool)

(assert (=> b!67530 m!107567))

(declare-fun m!107569 () Bool)

(assert (=> b!67530 m!107569))

(assert (=> b!67448 d!21366))

(declare-fun d!21370 () Bool)

(assert (=> d!21370 (= (head!532 lt!107489) (h!828 lt!107489))))

(assert (=> b!67459 d!21370))

(declare-fun d!21372 () Bool)

(assert (=> d!21372 (= (head!532 (byteArrayBitContentToList!0 (_2!3079 lt!107492) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!828 (byteArrayBitContentToList!0 (_2!3079 lt!107492) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!67444 d!21372))

(declare-fun d!21374 () Bool)

(declare-fun c!4933 () Bool)

(assert (=> d!21374 (= c!4933 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!44253 () List!713)

(assert (=> d!21374 (= (byteArrayBitContentToList!0 (_2!3079 lt!107492) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!44253)))

(declare-fun b!67537 () Bool)

(assert (=> b!67537 (= e!44253 Nil!710)))

(declare-fun b!67538 () Bool)

(assert (=> b!67538 (= e!44253 (Cons!709 (not (= (bvand ((_ sign_extend 24) (select (arr!1897 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3079 lt!107492) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!21374 c!4933) b!67537))

(assert (= (and d!21374 (not c!4933)) b!67538))

(assert (=> b!67538 m!107451))

(assert (=> b!67538 m!107533))

(declare-fun m!107571 () Bool)

(assert (=> b!67538 m!107571))

(assert (=> b!67444 d!21374))

(declare-fun d!21376 () Bool)

(assert (=> d!21376 (= (head!532 (bitStreamReadBitsIntoList!0 (_2!3079 lt!107492) (_1!3080 lt!107483) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!828 (bitStreamReadBitsIntoList!0 (_2!3079 lt!107492) (_1!3080 lt!107483) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!67444 d!21376))

(declare-datatypes ((tuple2!5952 0))(
  ( (tuple2!5953 (_1!3087 List!713) (_2!3087 BitStream!2276)) )
))
(declare-fun e!44262 () tuple2!5952)

(declare-fun lt!107602 () (_ BitVec 64))

(declare-datatypes ((tuple2!5954 0))(
  ( (tuple2!5955 (_1!3088 Bool) (_2!3088 BitStream!2276)) )
))
(declare-fun lt!107600 () tuple2!5954)

(declare-fun b!67554 () Bool)

(assert (=> b!67554 (= e!44262 (tuple2!5953 (Cons!709 (_1!3088 lt!107600) (bitStreamReadBitsIntoList!0 (_2!3079 lt!107492) (_2!3088 lt!107600) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!107602))) (_2!3088 lt!107600)))))

(declare-fun readBit!0 (BitStream!2276) tuple2!5954)

(assert (=> b!67554 (= lt!107600 (readBit!0 (_1!3080 lt!107483)))))

(assert (=> b!67554 (= lt!107602 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!67555 () Bool)

(declare-fun e!44261 () Bool)

(declare-fun lt!107601 () List!713)

(declare-fun isEmpty!214 (List!713) Bool)

(assert (=> b!67555 (= e!44261 (isEmpty!214 lt!107601))))

(declare-fun b!67556 () Bool)

(assert (=> b!67556 (= e!44261 (> (length!341 lt!107601) 0))))

(declare-fun d!21378 () Bool)

(assert (=> d!21378 e!44261))

(declare-fun c!4938 () Bool)

(assert (=> d!21378 (= c!4938 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21378 (= lt!107601 (_1!3087 e!44262))))

(declare-fun c!4939 () Bool)

(assert (=> d!21378 (= c!4939 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21378 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21378 (= (bitStreamReadBitsIntoList!0 (_2!3079 lt!107492) (_1!3080 lt!107483) #b0000000000000000000000000000000000000000000000000000000000000001) lt!107601)))

(declare-fun b!67553 () Bool)

(assert (=> b!67553 (= e!44262 (tuple2!5953 Nil!710 (_1!3080 lt!107483)))))

(assert (= (and d!21378 c!4939) b!67553))

(assert (= (and d!21378 (not c!4939)) b!67554))

(assert (= (and d!21378 c!4938) b!67555))

(assert (= (and d!21378 (not c!4938)) b!67556))

(declare-fun m!107575 () Bool)

(assert (=> b!67554 m!107575))

(declare-fun m!107577 () Bool)

(assert (=> b!67554 m!107577))

(declare-fun m!107579 () Bool)

(assert (=> b!67555 m!107579))

(declare-fun m!107581 () Bool)

(assert (=> b!67556 m!107581))

(assert (=> b!67444 d!21378))

(declare-fun d!21384 () Bool)

(assert (=> d!21384 (= (invariant!0 (currentBit!3387 (_2!3079 lt!107492)) (currentByte!3392 (_2!3079 lt!107492)) (size!1327 (buf!1708 (_2!3079 lt!107485)))) (and (bvsge (currentBit!3387 (_2!3079 lt!107492)) #b00000000000000000000000000000000) (bvslt (currentBit!3387 (_2!3079 lt!107492)) #b00000000000000000000000000001000) (bvsge (currentByte!3392 (_2!3079 lt!107492)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3392 (_2!3079 lt!107492)) (size!1327 (buf!1708 (_2!3079 lt!107485)))) (and (= (currentBit!3387 (_2!3079 lt!107492)) #b00000000000000000000000000000000) (= (currentByte!3392 (_2!3079 lt!107492)) (size!1327 (buf!1708 (_2!3079 lt!107485))))))))))

(assert (=> b!67455 d!21384))

(declare-fun d!21386 () Bool)

(assert (=> d!21386 (= (array_inv!1197 srcBuffer!2) (bvsge (size!1327 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!13138 d!21386))

(declare-fun d!21388 () Bool)

(assert (=> d!21388 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3387 thiss!1379) (currentByte!3392 thiss!1379) (size!1327 (buf!1708 thiss!1379))))))

(declare-fun bs!5175 () Bool)

(assert (= bs!5175 d!21388))

(declare-fun m!107583 () Bool)

(assert (=> bs!5175 m!107583))

(assert (=> start!13138 d!21388))

(declare-fun d!21390 () Bool)

(declare-fun res!55936 () Bool)

(declare-fun e!44268 () Bool)

(assert (=> d!21390 (=> (not res!55936) (not e!44268))))

(assert (=> d!21390 (= res!55936 (= (size!1327 (buf!1708 thiss!1379)) (size!1327 (buf!1708 thiss!1379))))))

(assert (=> d!21390 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!44268)))

(declare-fun b!67563 () Bool)

(declare-fun res!55934 () Bool)

(assert (=> b!67563 (=> (not res!55934) (not e!44268))))

(assert (=> b!67563 (= res!55934 (bvsle (bitIndex!0 (size!1327 (buf!1708 thiss!1379)) (currentByte!3392 thiss!1379) (currentBit!3387 thiss!1379)) (bitIndex!0 (size!1327 (buf!1708 thiss!1379)) (currentByte!3392 thiss!1379) (currentBit!3387 thiss!1379))))))

(declare-fun b!67564 () Bool)

(declare-fun e!44267 () Bool)

(assert (=> b!67564 (= e!44268 e!44267)))

(declare-fun res!55935 () Bool)

(assert (=> b!67564 (=> res!55935 e!44267)))

(assert (=> b!67564 (= res!55935 (= (size!1327 (buf!1708 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!67565 () Bool)

(assert (=> b!67565 (= e!44267 (arrayBitRangesEq!0 (buf!1708 thiss!1379) (buf!1708 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1327 (buf!1708 thiss!1379)) (currentByte!3392 thiss!1379) (currentBit!3387 thiss!1379))))))

(assert (= (and d!21390 res!55936) b!67563))

(assert (= (and b!67563 res!55934) b!67564))

(assert (= (and b!67564 (not res!55935)) b!67565))

(assert (=> b!67563 m!107443))

(assert (=> b!67563 m!107443))

(assert (=> b!67565 m!107443))

(assert (=> b!67565 m!107443))

(declare-fun m!107585 () Bool)

(assert (=> b!67565 m!107585))

(assert (=> b!67445 d!21390))

(declare-fun d!21392 () Bool)

(assert (=> d!21392 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!107605 () Unit!4539)

(declare-fun choose!11 (BitStream!2276) Unit!4539)

(assert (=> d!21392 (= lt!107605 (choose!11 thiss!1379))))

(assert (=> d!21392 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!107605)))

(declare-fun bs!5177 () Bool)

(assert (= bs!5177 d!21392))

(assert (=> bs!5177 m!107439))

(declare-fun m!107589 () Bool)

(assert (=> bs!5177 m!107589))

(assert (=> b!67445 d!21392))

(declare-fun d!21396 () Bool)

(declare-fun e!44274 () Bool)

(assert (=> d!21396 e!44274))

(declare-fun res!55946 () Bool)

(assert (=> d!21396 (=> (not res!55946) (not e!44274))))

(declare-fun lt!107632 () (_ BitVec 64))

(declare-fun lt!107630 () (_ BitVec 64))

(declare-fun lt!107629 () (_ BitVec 64))

(assert (=> d!21396 (= res!55946 (= lt!107629 (bvsub lt!107632 lt!107630)))))

(assert (=> d!21396 (or (= (bvand lt!107632 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!107630 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!107632 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!107632 lt!107630) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!21396 (= lt!107630 (remainingBits!0 ((_ sign_extend 32) (size!1327 (buf!1708 thiss!1379))) ((_ sign_extend 32) (currentByte!3392 thiss!1379)) ((_ sign_extend 32) (currentBit!3387 thiss!1379))))))

(declare-fun lt!107628 () (_ BitVec 64))

(declare-fun lt!107627 () (_ BitVec 64))

(assert (=> d!21396 (= lt!107632 (bvmul lt!107628 lt!107627))))

(assert (=> d!21396 (or (= lt!107628 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!107627 (bvsdiv (bvmul lt!107628 lt!107627) lt!107628)))))

(assert (=> d!21396 (= lt!107627 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!21396 (= lt!107628 ((_ sign_extend 32) (size!1327 (buf!1708 thiss!1379))))))

(assert (=> d!21396 (= lt!107629 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3392 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3387 thiss!1379))))))

(assert (=> d!21396 (invariant!0 (currentBit!3387 thiss!1379) (currentByte!3392 thiss!1379) (size!1327 (buf!1708 thiss!1379)))))

(assert (=> d!21396 (= (bitIndex!0 (size!1327 (buf!1708 thiss!1379)) (currentByte!3392 thiss!1379) (currentBit!3387 thiss!1379)) lt!107629)))

(declare-fun b!67575 () Bool)

(declare-fun res!55947 () Bool)

(assert (=> b!67575 (=> (not res!55947) (not e!44274))))

(assert (=> b!67575 (= res!55947 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!107629))))

(declare-fun b!67576 () Bool)

(declare-fun lt!107631 () (_ BitVec 64))

(assert (=> b!67576 (= e!44274 (bvsle lt!107629 (bvmul lt!107631 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!67576 (or (= lt!107631 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!107631 #b0000000000000000000000000000000000000000000000000000000000001000) lt!107631)))))

(assert (=> b!67576 (= lt!107631 ((_ sign_extend 32) (size!1327 (buf!1708 thiss!1379))))))

(assert (= (and d!21396 res!55946) b!67575))

(assert (= (and b!67575 res!55947) b!67576))

(declare-fun m!107597 () Bool)

(assert (=> d!21396 m!107597))

(assert (=> d!21396 m!107583))

(assert (=> b!67445 d!21396))

(declare-fun d!21402 () Bool)

(declare-fun size!1329 (List!713) Int)

(assert (=> d!21402 (= (length!341 lt!107489) (size!1329 lt!107489))))

(declare-fun bs!5180 () Bool)

(assert (= bs!5180 d!21402))

(declare-fun m!107599 () Bool)

(assert (=> bs!5180 m!107599))

(assert (=> b!67456 d!21402))

(declare-fun d!21404 () Bool)

(assert (=> d!21404 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1327 (buf!1708 (_2!3079 lt!107485)))) ((_ sign_extend 32) (currentByte!3392 (_2!3079 lt!107492))) ((_ sign_extend 32) (currentBit!3387 (_2!3079 lt!107492))) lt!107484) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1327 (buf!1708 (_2!3079 lt!107485)))) ((_ sign_extend 32) (currentByte!3392 (_2!3079 lt!107492))) ((_ sign_extend 32) (currentBit!3387 (_2!3079 lt!107492)))) lt!107484))))

(declare-fun bs!5181 () Bool)

(assert (= bs!5181 d!21404))

(declare-fun m!107601 () Bool)

(assert (=> bs!5181 m!107601))

(assert (=> b!67446 d!21404))

(declare-fun d!21406 () Bool)

(assert (=> d!21406 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1327 (buf!1708 (_2!3079 lt!107485)))) ((_ sign_extend 32) (currentByte!3392 thiss!1379)) ((_ sign_extend 32) (currentBit!3387 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1327 (buf!1708 (_2!3079 lt!107485)))) ((_ sign_extend 32) (currentByte!3392 thiss!1379)) ((_ sign_extend 32) (currentBit!3387 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5182 () Bool)

(assert (= bs!5182 d!21406))

(declare-fun m!107603 () Bool)

(assert (=> bs!5182 m!107603))

(assert (=> b!67446 d!21406))

(declare-fun d!21408 () Bool)

(assert (=> d!21408 (validate_offset_bits!1 ((_ sign_extend 32) (size!1327 (buf!1708 (_2!3079 lt!107485)))) ((_ sign_extend 32) (currentByte!3392 (_2!3079 lt!107492))) ((_ sign_extend 32) (currentBit!3387 (_2!3079 lt!107492))) lt!107484)))

(declare-fun lt!107635 () Unit!4539)

(declare-fun choose!9 (BitStream!2276 array!2870 (_ BitVec 64) BitStream!2276) Unit!4539)

(assert (=> d!21408 (= lt!107635 (choose!9 (_2!3079 lt!107492) (buf!1708 (_2!3079 lt!107485)) lt!107484 (BitStream!2277 (buf!1708 (_2!3079 lt!107485)) (currentByte!3392 (_2!3079 lt!107492)) (currentBit!3387 (_2!3079 lt!107492)))))))

(assert (=> d!21408 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3079 lt!107492) (buf!1708 (_2!3079 lt!107485)) lt!107484) lt!107635)))

(declare-fun bs!5183 () Bool)

(assert (= bs!5183 d!21408))

(assert (=> bs!5183 m!107427))

(declare-fun m!107605 () Bool)

(assert (=> bs!5183 m!107605))

(assert (=> b!67446 d!21408))

(declare-fun b!67587 () Bool)

(declare-fun res!55956 () Bool)

(declare-fun e!44279 () Bool)

(assert (=> b!67587 (=> (not res!55956) (not e!44279))))

(declare-fun lt!107682 () tuple2!5938)

(assert (=> b!67587 (= res!55956 (isPrefixOf!0 (_2!3080 lt!107682) (_2!3079 lt!107485)))))

(declare-fun d!21410 () Bool)

(assert (=> d!21410 e!44279))

(declare-fun res!55954 () Bool)

(assert (=> d!21410 (=> (not res!55954) (not e!44279))))

(assert (=> d!21410 (= res!55954 (isPrefixOf!0 (_1!3080 lt!107682) (_2!3080 lt!107682)))))

(declare-fun lt!107694 () BitStream!2276)

(assert (=> d!21410 (= lt!107682 (tuple2!5939 lt!107694 (_2!3079 lt!107485)))))

(declare-fun lt!107684 () Unit!4539)

(declare-fun lt!107681 () Unit!4539)

(assert (=> d!21410 (= lt!107684 lt!107681)))

(assert (=> d!21410 (isPrefixOf!0 lt!107694 (_2!3079 lt!107485))))

(assert (=> d!21410 (= lt!107681 (lemmaIsPrefixTransitive!0 lt!107694 (_2!3079 lt!107485) (_2!3079 lt!107485)))))

(declare-fun lt!107695 () Unit!4539)

(declare-fun lt!107683 () Unit!4539)

(assert (=> d!21410 (= lt!107695 lt!107683)))

(assert (=> d!21410 (isPrefixOf!0 lt!107694 (_2!3079 lt!107485))))

(assert (=> d!21410 (= lt!107683 (lemmaIsPrefixTransitive!0 lt!107694 (_2!3079 lt!107492) (_2!3079 lt!107485)))))

(declare-fun lt!107687 () Unit!4539)

(declare-fun e!44280 () Unit!4539)

(assert (=> d!21410 (= lt!107687 e!44280)))

(declare-fun c!4942 () Bool)

(assert (=> d!21410 (= c!4942 (not (= (size!1327 (buf!1708 (_2!3079 lt!107492))) #b00000000000000000000000000000000)))))

(declare-fun lt!107677 () Unit!4539)

(declare-fun lt!107691 () Unit!4539)

(assert (=> d!21410 (= lt!107677 lt!107691)))

(assert (=> d!21410 (isPrefixOf!0 (_2!3079 lt!107485) (_2!3079 lt!107485))))

(assert (=> d!21410 (= lt!107691 (lemmaIsPrefixRefl!0 (_2!3079 lt!107485)))))

(declare-fun lt!107689 () Unit!4539)

(declare-fun lt!107680 () Unit!4539)

(assert (=> d!21410 (= lt!107689 lt!107680)))

(assert (=> d!21410 (= lt!107680 (lemmaIsPrefixRefl!0 (_2!3079 lt!107485)))))

(declare-fun lt!107685 () Unit!4539)

(declare-fun lt!107678 () Unit!4539)

(assert (=> d!21410 (= lt!107685 lt!107678)))

(assert (=> d!21410 (isPrefixOf!0 lt!107694 lt!107694)))

(assert (=> d!21410 (= lt!107678 (lemmaIsPrefixRefl!0 lt!107694))))

(declare-fun lt!107686 () Unit!4539)

(declare-fun lt!107688 () Unit!4539)

(assert (=> d!21410 (= lt!107686 lt!107688)))

(assert (=> d!21410 (isPrefixOf!0 (_2!3079 lt!107492) (_2!3079 lt!107492))))

(assert (=> d!21410 (= lt!107688 (lemmaIsPrefixRefl!0 (_2!3079 lt!107492)))))

(assert (=> d!21410 (= lt!107694 (BitStream!2277 (buf!1708 (_2!3079 lt!107485)) (currentByte!3392 (_2!3079 lt!107492)) (currentBit!3387 (_2!3079 lt!107492))))))

(assert (=> d!21410 (isPrefixOf!0 (_2!3079 lt!107492) (_2!3079 lt!107485))))

(assert (=> d!21410 (= (reader!0 (_2!3079 lt!107492) (_2!3079 lt!107485)) lt!107682)))

(declare-fun lt!107676 () (_ BitVec 64))

(declare-fun lt!107679 () (_ BitVec 64))

(declare-fun b!67588 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!2276 (_ BitVec 64)) BitStream!2276)

(assert (=> b!67588 (= e!44279 (= (_1!3080 lt!107682) (withMovedBitIndex!0 (_2!3080 lt!107682) (bvsub lt!107679 lt!107676))))))

(assert (=> b!67588 (or (= (bvand lt!107679 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!107676 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!107679 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!107679 lt!107676) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!67588 (= lt!107676 (bitIndex!0 (size!1327 (buf!1708 (_2!3079 lt!107485))) (currentByte!3392 (_2!3079 lt!107485)) (currentBit!3387 (_2!3079 lt!107485))))))

(assert (=> b!67588 (= lt!107679 (bitIndex!0 (size!1327 (buf!1708 (_2!3079 lt!107492))) (currentByte!3392 (_2!3079 lt!107492)) (currentBit!3387 (_2!3079 lt!107492))))))

(declare-fun b!67589 () Bool)

(declare-fun lt!107693 () Unit!4539)

(assert (=> b!67589 (= e!44280 lt!107693)))

(declare-fun lt!107692 () (_ BitVec 64))

(assert (=> b!67589 (= lt!107692 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107690 () (_ BitVec 64))

(assert (=> b!67589 (= lt!107690 (bitIndex!0 (size!1327 (buf!1708 (_2!3079 lt!107492))) (currentByte!3392 (_2!3079 lt!107492)) (currentBit!3387 (_2!3079 lt!107492))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2870 array!2870 (_ BitVec 64) (_ BitVec 64)) Unit!4539)

(assert (=> b!67589 (= lt!107693 (arrayBitRangesEqSymmetric!0 (buf!1708 (_2!3079 lt!107492)) (buf!1708 (_2!3079 lt!107485)) lt!107692 lt!107690))))

(assert (=> b!67589 (arrayBitRangesEq!0 (buf!1708 (_2!3079 lt!107485)) (buf!1708 (_2!3079 lt!107492)) lt!107692 lt!107690)))

(declare-fun b!67590 () Bool)

(declare-fun Unit!4551 () Unit!4539)

(assert (=> b!67590 (= e!44280 Unit!4551)))

(declare-fun b!67591 () Bool)

(declare-fun res!55955 () Bool)

(assert (=> b!67591 (=> (not res!55955) (not e!44279))))

(assert (=> b!67591 (= res!55955 (isPrefixOf!0 (_1!3080 lt!107682) (_2!3079 lt!107492)))))

(assert (= (and d!21410 c!4942) b!67589))

(assert (= (and d!21410 (not c!4942)) b!67590))

(assert (= (and d!21410 res!55954) b!67591))

(assert (= (and b!67591 res!55955) b!67587))

(assert (= (and b!67587 res!55956) b!67588))

(declare-fun m!107607 () Bool)

(assert (=> b!67591 m!107607))

(declare-fun m!107609 () Bool)

(assert (=> b!67588 m!107609))

(assert (=> b!67588 m!107409))

(assert (=> b!67588 m!107437))

(declare-fun m!107611 () Bool)

(assert (=> b!67587 m!107611))

(assert (=> b!67589 m!107437))

(declare-fun m!107613 () Bool)

(assert (=> b!67589 m!107613))

(declare-fun m!107615 () Bool)

(assert (=> b!67589 m!107615))

(declare-fun m!107617 () Bool)

(assert (=> d!21410 m!107617))

(declare-fun m!107619 () Bool)

(assert (=> d!21410 m!107619))

(declare-fun m!107621 () Bool)

(assert (=> d!21410 m!107621))

(declare-fun m!107623 () Bool)

(assert (=> d!21410 m!107623))

(assert (=> d!21410 m!107483))

(declare-fun m!107625 () Bool)

(assert (=> d!21410 m!107625))

(declare-fun m!107627 () Bool)

(assert (=> d!21410 m!107627))

(declare-fun m!107629 () Bool)

(assert (=> d!21410 m!107629))

(declare-fun m!107631 () Bool)

(assert (=> d!21410 m!107631))

(declare-fun m!107633 () Bool)

(assert (=> d!21410 m!107633))

(declare-fun m!107635 () Bool)

(assert (=> d!21410 m!107635))

(assert (=> b!67446 d!21410))

(declare-fun b!67592 () Bool)

(declare-fun res!55959 () Bool)

(declare-fun e!44281 () Bool)

(assert (=> b!67592 (=> (not res!55959) (not e!44281))))

(declare-fun lt!107702 () tuple2!5938)

(assert (=> b!67592 (= res!55959 (isPrefixOf!0 (_2!3080 lt!107702) (_2!3079 lt!107485)))))

(declare-fun d!21412 () Bool)

(assert (=> d!21412 e!44281))

(declare-fun res!55957 () Bool)

(assert (=> d!21412 (=> (not res!55957) (not e!44281))))

(assert (=> d!21412 (= res!55957 (isPrefixOf!0 (_1!3080 lt!107702) (_2!3080 lt!107702)))))

(declare-fun lt!107714 () BitStream!2276)

(assert (=> d!21412 (= lt!107702 (tuple2!5939 lt!107714 (_2!3079 lt!107485)))))

(declare-fun lt!107704 () Unit!4539)

(declare-fun lt!107701 () Unit!4539)

(assert (=> d!21412 (= lt!107704 lt!107701)))

(assert (=> d!21412 (isPrefixOf!0 lt!107714 (_2!3079 lt!107485))))

(assert (=> d!21412 (= lt!107701 (lemmaIsPrefixTransitive!0 lt!107714 (_2!3079 lt!107485) (_2!3079 lt!107485)))))

(declare-fun lt!107715 () Unit!4539)

(declare-fun lt!107703 () Unit!4539)

(assert (=> d!21412 (= lt!107715 lt!107703)))

(assert (=> d!21412 (isPrefixOf!0 lt!107714 (_2!3079 lt!107485))))

(assert (=> d!21412 (= lt!107703 (lemmaIsPrefixTransitive!0 lt!107714 thiss!1379 (_2!3079 lt!107485)))))

(declare-fun lt!107707 () Unit!4539)

(declare-fun e!44282 () Unit!4539)

(assert (=> d!21412 (= lt!107707 e!44282)))

(declare-fun c!4943 () Bool)

(assert (=> d!21412 (= c!4943 (not (= (size!1327 (buf!1708 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!107697 () Unit!4539)

(declare-fun lt!107711 () Unit!4539)

(assert (=> d!21412 (= lt!107697 lt!107711)))

(assert (=> d!21412 (isPrefixOf!0 (_2!3079 lt!107485) (_2!3079 lt!107485))))

(assert (=> d!21412 (= lt!107711 (lemmaIsPrefixRefl!0 (_2!3079 lt!107485)))))

(declare-fun lt!107709 () Unit!4539)

(declare-fun lt!107700 () Unit!4539)

(assert (=> d!21412 (= lt!107709 lt!107700)))

(assert (=> d!21412 (= lt!107700 (lemmaIsPrefixRefl!0 (_2!3079 lt!107485)))))

(declare-fun lt!107705 () Unit!4539)

(declare-fun lt!107698 () Unit!4539)

(assert (=> d!21412 (= lt!107705 lt!107698)))

(assert (=> d!21412 (isPrefixOf!0 lt!107714 lt!107714)))

(assert (=> d!21412 (= lt!107698 (lemmaIsPrefixRefl!0 lt!107714))))

(declare-fun lt!107706 () Unit!4539)

(declare-fun lt!107708 () Unit!4539)

(assert (=> d!21412 (= lt!107706 lt!107708)))

(assert (=> d!21412 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!21412 (= lt!107708 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!21412 (= lt!107714 (BitStream!2277 (buf!1708 (_2!3079 lt!107485)) (currentByte!3392 thiss!1379) (currentBit!3387 thiss!1379)))))

(assert (=> d!21412 (isPrefixOf!0 thiss!1379 (_2!3079 lt!107485))))

(assert (=> d!21412 (= (reader!0 thiss!1379 (_2!3079 lt!107485)) lt!107702)))

(declare-fun lt!107696 () (_ BitVec 64))

(declare-fun b!67593 () Bool)

(declare-fun lt!107699 () (_ BitVec 64))

(assert (=> b!67593 (= e!44281 (= (_1!3080 lt!107702) (withMovedBitIndex!0 (_2!3080 lt!107702) (bvsub lt!107699 lt!107696))))))

(assert (=> b!67593 (or (= (bvand lt!107699 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!107696 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!107699 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!107699 lt!107696) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!67593 (= lt!107696 (bitIndex!0 (size!1327 (buf!1708 (_2!3079 lt!107485))) (currentByte!3392 (_2!3079 lt!107485)) (currentBit!3387 (_2!3079 lt!107485))))))

(assert (=> b!67593 (= lt!107699 (bitIndex!0 (size!1327 (buf!1708 thiss!1379)) (currentByte!3392 thiss!1379) (currentBit!3387 thiss!1379)))))

(declare-fun b!67594 () Bool)

(declare-fun lt!107713 () Unit!4539)

(assert (=> b!67594 (= e!44282 lt!107713)))

(declare-fun lt!107712 () (_ BitVec 64))

(assert (=> b!67594 (= lt!107712 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107710 () (_ BitVec 64))

(assert (=> b!67594 (= lt!107710 (bitIndex!0 (size!1327 (buf!1708 thiss!1379)) (currentByte!3392 thiss!1379) (currentBit!3387 thiss!1379)))))

(assert (=> b!67594 (= lt!107713 (arrayBitRangesEqSymmetric!0 (buf!1708 thiss!1379) (buf!1708 (_2!3079 lt!107485)) lt!107712 lt!107710))))

(assert (=> b!67594 (arrayBitRangesEq!0 (buf!1708 (_2!3079 lt!107485)) (buf!1708 thiss!1379) lt!107712 lt!107710)))

(declare-fun b!67595 () Bool)

(declare-fun Unit!4559 () Unit!4539)

(assert (=> b!67595 (= e!44282 Unit!4559)))

(declare-fun b!67596 () Bool)

(declare-fun res!55958 () Bool)

(assert (=> b!67596 (=> (not res!55958) (not e!44281))))

(assert (=> b!67596 (= res!55958 (isPrefixOf!0 (_1!3080 lt!107702) thiss!1379))))

(assert (= (and d!21412 c!4943) b!67594))

(assert (= (and d!21412 (not c!4943)) b!67595))

(assert (= (and d!21412 res!55957) b!67596))

(assert (= (and b!67596 res!55958) b!67592))

(assert (= (and b!67592 res!55959) b!67593))

(declare-fun m!107637 () Bool)

(assert (=> b!67596 m!107637))

(declare-fun m!107639 () Bool)

(assert (=> b!67593 m!107639))

(assert (=> b!67593 m!107409))

(assert (=> b!67593 m!107443))

(declare-fun m!107641 () Bool)

(assert (=> b!67592 m!107641))

(assert (=> b!67594 m!107443))

(declare-fun m!107643 () Bool)

(assert (=> b!67594 m!107643))

(declare-fun m!107645 () Bool)

(assert (=> b!67594 m!107645))

(declare-fun m!107647 () Bool)

(assert (=> d!21412 m!107647))

(assert (=> d!21412 m!107439))

(declare-fun m!107649 () Bool)

(assert (=> d!21412 m!107649))

(declare-fun m!107651 () Bool)

(assert (=> d!21412 m!107651))

(assert (=> d!21412 m!107485))

(assert (=> d!21412 m!107625))

(assert (=> d!21412 m!107627))

(declare-fun m!107653 () Bool)

(assert (=> d!21412 m!107653))

(assert (=> d!21412 m!107441))

(declare-fun m!107655 () Bool)

(assert (=> d!21412 m!107655))

(declare-fun m!107657 () Bool)

(assert (=> d!21412 m!107657))

(assert (=> b!67446 d!21412))

(declare-fun e!44284 () tuple2!5952)

(declare-fun lt!107718 () (_ BitVec 64))

(declare-fun b!67598 () Bool)

(declare-fun lt!107716 () tuple2!5954)

(assert (=> b!67598 (= e!44284 (tuple2!5953 (Cons!709 (_1!3088 lt!107716) (bitStreamReadBitsIntoList!0 (_2!3079 lt!107485) (_2!3088 lt!107716) (bvsub lt!107484 lt!107718))) (_2!3088 lt!107716)))))

(assert (=> b!67598 (= lt!107716 (readBit!0 (_1!3080 lt!107478)))))

(assert (=> b!67598 (= lt!107718 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!67599 () Bool)

(declare-fun e!44283 () Bool)

(declare-fun lt!107717 () List!713)

(assert (=> b!67599 (= e!44283 (isEmpty!214 lt!107717))))

(declare-fun b!67600 () Bool)

(assert (=> b!67600 (= e!44283 (> (length!341 lt!107717) 0))))

(declare-fun d!21414 () Bool)

(assert (=> d!21414 e!44283))

(declare-fun c!4944 () Bool)

(assert (=> d!21414 (= c!4944 (= lt!107484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21414 (= lt!107717 (_1!3087 e!44284))))

(declare-fun c!4945 () Bool)

(assert (=> d!21414 (= c!4945 (= lt!107484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21414 (bvsge lt!107484 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21414 (= (bitStreamReadBitsIntoList!0 (_2!3079 lt!107485) (_1!3080 lt!107478) lt!107484) lt!107717)))

(declare-fun b!67597 () Bool)

(assert (=> b!67597 (= e!44284 (tuple2!5953 Nil!710 (_1!3080 lt!107478)))))

(assert (= (and d!21414 c!4945) b!67597))

(assert (= (and d!21414 (not c!4945)) b!67598))

(assert (= (and d!21414 c!4944) b!67599))

(assert (= (and d!21414 (not c!4944)) b!67600))

(declare-fun m!107659 () Bool)

(assert (=> b!67598 m!107659))

(declare-fun m!107661 () Bool)

(assert (=> b!67598 m!107661))

(declare-fun m!107663 () Bool)

(assert (=> b!67599 m!107663))

(declare-fun m!107665 () Bool)

(assert (=> b!67600 m!107665))

(assert (=> b!67446 d!21414))

(declare-fun d!21416 () Bool)

(assert (=> d!21416 (validate_offset_bits!1 ((_ sign_extend 32) (size!1327 (buf!1708 (_2!3079 lt!107485)))) ((_ sign_extend 32) (currentByte!3392 thiss!1379)) ((_ sign_extend 32) (currentBit!3387 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!107719 () Unit!4539)

(assert (=> d!21416 (= lt!107719 (choose!9 thiss!1379 (buf!1708 (_2!3079 lt!107485)) (bvsub to!314 i!635) (BitStream!2277 (buf!1708 (_2!3079 lt!107485)) (currentByte!3392 thiss!1379) (currentBit!3387 thiss!1379))))))

(assert (=> d!21416 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1708 (_2!3079 lt!107485)) (bvsub to!314 i!635)) lt!107719)))

(declare-fun bs!5184 () Bool)

(assert (= bs!5184 d!21416))

(assert (=> bs!5184 m!107417))

(declare-fun m!107667 () Bool)

(assert (=> bs!5184 m!107667))

(assert (=> b!67446 d!21416))

(declare-fun lt!107722 () (_ BitVec 64))

(declare-fun e!44286 () tuple2!5952)

(declare-fun b!67602 () Bool)

(declare-fun lt!107720 () tuple2!5954)

(assert (=> b!67602 (= e!44286 (tuple2!5953 (Cons!709 (_1!3088 lt!107720) (bitStreamReadBitsIntoList!0 (_2!3079 lt!107485) (_2!3088 lt!107720) (bvsub (bvsub to!314 i!635) lt!107722))) (_2!3088 lt!107720)))))

(assert (=> b!67602 (= lt!107720 (readBit!0 (_1!3080 lt!107474)))))

(assert (=> b!67602 (= lt!107722 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!67603 () Bool)

(declare-fun e!44285 () Bool)

(declare-fun lt!107721 () List!713)

(assert (=> b!67603 (= e!44285 (isEmpty!214 lt!107721))))

(declare-fun b!67604 () Bool)

(assert (=> b!67604 (= e!44285 (> (length!341 lt!107721) 0))))

(declare-fun d!21418 () Bool)

(assert (=> d!21418 e!44285))

(declare-fun c!4946 () Bool)

(assert (=> d!21418 (= c!4946 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21418 (= lt!107721 (_1!3087 e!44286))))

(declare-fun c!4947 () Bool)

(assert (=> d!21418 (= c!4947 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21418 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21418 (= (bitStreamReadBitsIntoList!0 (_2!3079 lt!107485) (_1!3080 lt!107474) (bvsub to!314 i!635)) lt!107721)))

(declare-fun b!67601 () Bool)

(assert (=> b!67601 (= e!44286 (tuple2!5953 Nil!710 (_1!3080 lt!107474)))))

(assert (= (and d!21418 c!4947) b!67601))

(assert (= (and d!21418 (not c!4947)) b!67602))

(assert (= (and d!21418 c!4946) b!67603))

(assert (= (and d!21418 (not c!4946)) b!67604))

(declare-fun m!107669 () Bool)

(assert (=> b!67602 m!107669))

(declare-fun m!107671 () Bool)

(assert (=> b!67602 m!107671))

(declare-fun m!107673 () Bool)

(assert (=> b!67603 m!107673))

(declare-fun m!107675 () Bool)

(assert (=> b!67604 m!107675))

(assert (=> b!67446 d!21418))

(declare-fun d!21420 () Bool)

(assert (=> d!21420 (= (bitAt!0 (buf!1708 (_2!3079 lt!107492)) lt!107476) (not (= (bvand ((_ sign_extend 24) (select (arr!1897 (buf!1708 (_2!3079 lt!107492))) ((_ extract 31 0) (bvsdiv lt!107476 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!107476 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5185 () Bool)

(assert (= bs!5185 d!21420))

(declare-fun m!107677 () Bool)

(assert (=> bs!5185 m!107677))

(declare-fun m!107679 () Bool)

(assert (=> bs!5185 m!107679))

(assert (=> b!67452 d!21420))

(declare-fun d!21422 () Bool)

(declare-fun e!44287 () Bool)

(assert (=> d!21422 e!44287))

(declare-fun res!55960 () Bool)

(assert (=> d!21422 (=> (not res!55960) (not e!44287))))

(declare-fun lt!107728 () (_ BitVec 64))

(declare-fun lt!107726 () (_ BitVec 64))

(declare-fun lt!107725 () (_ BitVec 64))

(assert (=> d!21422 (= res!55960 (= lt!107725 (bvsub lt!107728 lt!107726)))))

(assert (=> d!21422 (or (= (bvand lt!107728 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!107726 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!107728 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!107728 lt!107726) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!21422 (= lt!107726 (remainingBits!0 ((_ sign_extend 32) (size!1327 (buf!1708 (_2!3079 lt!107492)))) ((_ sign_extend 32) (currentByte!3392 (_2!3079 lt!107492))) ((_ sign_extend 32) (currentBit!3387 (_2!3079 lt!107492)))))))

(declare-fun lt!107724 () (_ BitVec 64))

(declare-fun lt!107723 () (_ BitVec 64))

(assert (=> d!21422 (= lt!107728 (bvmul lt!107724 lt!107723))))

(assert (=> d!21422 (or (= lt!107724 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!107723 (bvsdiv (bvmul lt!107724 lt!107723) lt!107724)))))

(assert (=> d!21422 (= lt!107723 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!21422 (= lt!107724 ((_ sign_extend 32) (size!1327 (buf!1708 (_2!3079 lt!107492)))))))

(assert (=> d!21422 (= lt!107725 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3392 (_2!3079 lt!107492))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3387 (_2!3079 lt!107492)))))))

(assert (=> d!21422 (invariant!0 (currentBit!3387 (_2!3079 lt!107492)) (currentByte!3392 (_2!3079 lt!107492)) (size!1327 (buf!1708 (_2!3079 lt!107492))))))

(assert (=> d!21422 (= (bitIndex!0 (size!1327 (buf!1708 (_2!3079 lt!107492))) (currentByte!3392 (_2!3079 lt!107492)) (currentBit!3387 (_2!3079 lt!107492))) lt!107725)))

(declare-fun b!67605 () Bool)

(declare-fun res!55961 () Bool)

(assert (=> b!67605 (=> (not res!55961) (not e!44287))))

(assert (=> b!67605 (= res!55961 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!107725))))

(declare-fun b!67606 () Bool)

(declare-fun lt!107727 () (_ BitVec 64))

(assert (=> b!67606 (= e!44287 (bvsle lt!107725 (bvmul lt!107727 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!67606 (or (= lt!107727 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!107727 #b0000000000000000000000000000000000000000000000000000000000001000) lt!107727)))))

(assert (=> b!67606 (= lt!107727 ((_ sign_extend 32) (size!1327 (buf!1708 (_2!3079 lt!107492)))))))

(assert (= (and d!21422 res!55960) b!67605))

(assert (= (and b!67605 res!55961) b!67606))

(assert (=> d!21422 m!107539))

(assert (=> d!21422 m!107411))

(assert (=> b!67442 d!21422))

(declare-fun d!21424 () Bool)

(assert (=> d!21424 (= (array_inv!1197 (buf!1708 thiss!1379)) (bvsge (size!1327 (buf!1708 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!67453 d!21424))

(declare-fun d!21426 () Bool)

(assert (=> d!21426 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1327 (buf!1708 thiss!1379))) ((_ sign_extend 32) (currentByte!3392 thiss!1379)) ((_ sign_extend 32) (currentBit!3387 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1327 (buf!1708 thiss!1379))) ((_ sign_extend 32) (currentByte!3392 thiss!1379)) ((_ sign_extend 32) (currentBit!3387 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5186 () Bool)

(assert (= bs!5186 d!21426))

(assert (=> bs!5186 m!107597))

(assert (=> b!67443 d!21426))

(declare-fun d!21428 () Bool)

(assert (=> d!21428 (= (bitAt!0 (buf!1708 (_1!3080 lt!107478)) lt!107476) (not (= (bvand ((_ sign_extend 24) (select (arr!1897 (buf!1708 (_1!3080 lt!107478))) ((_ extract 31 0) (bvsdiv lt!107476 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!107476 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5187 () Bool)

(assert (= bs!5187 d!21428))

(declare-fun m!107681 () Bool)

(assert (=> bs!5187 m!107681))

(assert (=> bs!5187 m!107679))

(assert (=> b!67454 d!21428))

(declare-fun d!21430 () Bool)

(assert (=> d!21430 (= (bitAt!0 (buf!1708 (_1!3080 lt!107474)) lt!107476) (not (= (bvand ((_ sign_extend 24) (select (arr!1897 (buf!1708 (_1!3080 lt!107474))) ((_ extract 31 0) (bvsdiv lt!107476 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!107476 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5188 () Bool)

(assert (= bs!5188 d!21430))

(declare-fun m!107683 () Bool)

(assert (=> bs!5188 m!107683))

(assert (=> bs!5188 m!107679))

(assert (=> b!67454 d!21430))

(declare-fun d!21432 () Bool)

(assert (=> d!21432 (validate_offset_bits!1 ((_ sign_extend 32) (size!1327 (buf!1708 (_2!3079 lt!107492)))) ((_ sign_extend 32) (currentByte!3392 thiss!1379)) ((_ sign_extend 32) (currentBit!3387 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!107729 () Unit!4539)

(assert (=> d!21432 (= lt!107729 (choose!9 thiss!1379 (buf!1708 (_2!3079 lt!107492)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2277 (buf!1708 (_2!3079 lt!107492)) (currentByte!3392 thiss!1379) (currentBit!3387 thiss!1379))))))

(assert (=> d!21432 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1708 (_2!3079 lt!107492)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!107729)))

(declare-fun bs!5189 () Bool)

(assert (= bs!5189 d!21432))

(assert (=> bs!5189 m!107491))

(declare-fun m!107685 () Bool)

(assert (=> bs!5189 m!107685))

(assert (=> b!67450 d!21432))

(declare-fun d!21434 () Bool)

(declare-fun res!55964 () Bool)

(declare-fun e!44289 () Bool)

(assert (=> d!21434 (=> (not res!55964) (not e!44289))))

(assert (=> d!21434 (= res!55964 (= (size!1327 (buf!1708 thiss!1379)) (size!1327 (buf!1708 (_2!3079 lt!107485)))))))

(assert (=> d!21434 (= (isPrefixOf!0 thiss!1379 (_2!3079 lt!107485)) e!44289)))

(declare-fun b!67607 () Bool)

(declare-fun res!55962 () Bool)

(assert (=> b!67607 (=> (not res!55962) (not e!44289))))

(assert (=> b!67607 (= res!55962 (bvsle (bitIndex!0 (size!1327 (buf!1708 thiss!1379)) (currentByte!3392 thiss!1379) (currentBit!3387 thiss!1379)) (bitIndex!0 (size!1327 (buf!1708 (_2!3079 lt!107485))) (currentByte!3392 (_2!3079 lt!107485)) (currentBit!3387 (_2!3079 lt!107485)))))))

(declare-fun b!67608 () Bool)

(declare-fun e!44288 () Bool)

(assert (=> b!67608 (= e!44289 e!44288)))

(declare-fun res!55963 () Bool)

(assert (=> b!67608 (=> res!55963 e!44288)))

(assert (=> b!67608 (= res!55963 (= (size!1327 (buf!1708 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!67609 () Bool)

(assert (=> b!67609 (= e!44288 (arrayBitRangesEq!0 (buf!1708 thiss!1379) (buf!1708 (_2!3079 lt!107485)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1327 (buf!1708 thiss!1379)) (currentByte!3392 thiss!1379) (currentBit!3387 thiss!1379))))))

(assert (= (and d!21434 res!55964) b!67607))

(assert (= (and b!67607 res!55962) b!67608))

(assert (= (and b!67608 (not res!55963)) b!67609))

(assert (=> b!67607 m!107443))

(assert (=> b!67607 m!107409))

(assert (=> b!67609 m!107443))

(assert (=> b!67609 m!107443))

(declare-fun m!107687 () Bool)

(assert (=> b!67609 m!107687))

(assert (=> b!67450 d!21434))

(declare-fun b!67610 () Bool)

(declare-fun res!55967 () Bool)

(declare-fun e!44290 () Bool)

(assert (=> b!67610 (=> (not res!55967) (not e!44290))))

(declare-fun lt!107736 () tuple2!5938)

(assert (=> b!67610 (= res!55967 (isPrefixOf!0 (_2!3080 lt!107736) (_2!3079 lt!107492)))))

(declare-fun d!21436 () Bool)

(assert (=> d!21436 e!44290))

(declare-fun res!55965 () Bool)

(assert (=> d!21436 (=> (not res!55965) (not e!44290))))

(assert (=> d!21436 (= res!55965 (isPrefixOf!0 (_1!3080 lt!107736) (_2!3080 lt!107736)))))

(declare-fun lt!107748 () BitStream!2276)

(assert (=> d!21436 (= lt!107736 (tuple2!5939 lt!107748 (_2!3079 lt!107492)))))

(declare-fun lt!107738 () Unit!4539)

(declare-fun lt!107735 () Unit!4539)

(assert (=> d!21436 (= lt!107738 lt!107735)))

(assert (=> d!21436 (isPrefixOf!0 lt!107748 (_2!3079 lt!107492))))

(assert (=> d!21436 (= lt!107735 (lemmaIsPrefixTransitive!0 lt!107748 (_2!3079 lt!107492) (_2!3079 lt!107492)))))

(declare-fun lt!107749 () Unit!4539)

(declare-fun lt!107737 () Unit!4539)

(assert (=> d!21436 (= lt!107749 lt!107737)))

(assert (=> d!21436 (isPrefixOf!0 lt!107748 (_2!3079 lt!107492))))

(assert (=> d!21436 (= lt!107737 (lemmaIsPrefixTransitive!0 lt!107748 thiss!1379 (_2!3079 lt!107492)))))

(declare-fun lt!107741 () Unit!4539)

(declare-fun e!44291 () Unit!4539)

(assert (=> d!21436 (= lt!107741 e!44291)))

(declare-fun c!4948 () Bool)

(assert (=> d!21436 (= c!4948 (not (= (size!1327 (buf!1708 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!107731 () Unit!4539)

(declare-fun lt!107745 () Unit!4539)

(assert (=> d!21436 (= lt!107731 lt!107745)))

(assert (=> d!21436 (isPrefixOf!0 (_2!3079 lt!107492) (_2!3079 lt!107492))))

(assert (=> d!21436 (= lt!107745 (lemmaIsPrefixRefl!0 (_2!3079 lt!107492)))))

(declare-fun lt!107743 () Unit!4539)

(declare-fun lt!107734 () Unit!4539)

(assert (=> d!21436 (= lt!107743 lt!107734)))

(assert (=> d!21436 (= lt!107734 (lemmaIsPrefixRefl!0 (_2!3079 lt!107492)))))

(declare-fun lt!107739 () Unit!4539)

(declare-fun lt!107732 () Unit!4539)

(assert (=> d!21436 (= lt!107739 lt!107732)))

(assert (=> d!21436 (isPrefixOf!0 lt!107748 lt!107748)))

(assert (=> d!21436 (= lt!107732 (lemmaIsPrefixRefl!0 lt!107748))))

(declare-fun lt!107740 () Unit!4539)

(declare-fun lt!107742 () Unit!4539)

(assert (=> d!21436 (= lt!107740 lt!107742)))

(assert (=> d!21436 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!21436 (= lt!107742 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!21436 (= lt!107748 (BitStream!2277 (buf!1708 (_2!3079 lt!107492)) (currentByte!3392 thiss!1379) (currentBit!3387 thiss!1379)))))

(assert (=> d!21436 (isPrefixOf!0 thiss!1379 (_2!3079 lt!107492))))

(assert (=> d!21436 (= (reader!0 thiss!1379 (_2!3079 lt!107492)) lt!107736)))

(declare-fun b!67611 () Bool)

(declare-fun lt!107733 () (_ BitVec 64))

(declare-fun lt!107730 () (_ BitVec 64))

(assert (=> b!67611 (= e!44290 (= (_1!3080 lt!107736) (withMovedBitIndex!0 (_2!3080 lt!107736) (bvsub lt!107733 lt!107730))))))

(assert (=> b!67611 (or (= (bvand lt!107733 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!107730 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!107733 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!107733 lt!107730) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!67611 (= lt!107730 (bitIndex!0 (size!1327 (buf!1708 (_2!3079 lt!107492))) (currentByte!3392 (_2!3079 lt!107492)) (currentBit!3387 (_2!3079 lt!107492))))))

(assert (=> b!67611 (= lt!107733 (bitIndex!0 (size!1327 (buf!1708 thiss!1379)) (currentByte!3392 thiss!1379) (currentBit!3387 thiss!1379)))))

(declare-fun b!67612 () Bool)

(declare-fun lt!107747 () Unit!4539)

(assert (=> b!67612 (= e!44291 lt!107747)))

(declare-fun lt!107746 () (_ BitVec 64))

(assert (=> b!67612 (= lt!107746 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107744 () (_ BitVec 64))

(assert (=> b!67612 (= lt!107744 (bitIndex!0 (size!1327 (buf!1708 thiss!1379)) (currentByte!3392 thiss!1379) (currentBit!3387 thiss!1379)))))

(assert (=> b!67612 (= lt!107747 (arrayBitRangesEqSymmetric!0 (buf!1708 thiss!1379) (buf!1708 (_2!3079 lt!107492)) lt!107746 lt!107744))))

(assert (=> b!67612 (arrayBitRangesEq!0 (buf!1708 (_2!3079 lt!107492)) (buf!1708 thiss!1379) lt!107746 lt!107744)))

(declare-fun b!67613 () Bool)

(declare-fun Unit!4562 () Unit!4539)

(assert (=> b!67613 (= e!44291 Unit!4562)))

(declare-fun b!67614 () Bool)

(declare-fun res!55966 () Bool)

(assert (=> b!67614 (=> (not res!55966) (not e!44290))))

(assert (=> b!67614 (= res!55966 (isPrefixOf!0 (_1!3080 lt!107736) thiss!1379))))

(assert (= (and d!21436 c!4948) b!67612))

(assert (= (and d!21436 (not c!4948)) b!67613))

(assert (= (and d!21436 res!55965) b!67614))

(assert (= (and b!67614 res!55966) b!67610))

(assert (= (and b!67610 res!55967) b!67611))

(declare-fun m!107689 () Bool)

(assert (=> b!67614 m!107689))

(declare-fun m!107691 () Bool)

(assert (=> b!67611 m!107691))

(assert (=> b!67611 m!107437))

(assert (=> b!67611 m!107443))

(declare-fun m!107693 () Bool)

(assert (=> b!67610 m!107693))

(assert (=> b!67612 m!107443))

(declare-fun m!107695 () Bool)

(assert (=> b!67612 m!107695))

(declare-fun m!107697 () Bool)

(assert (=> b!67612 m!107697))

(declare-fun m!107699 () Bool)

(assert (=> d!21436 m!107699))

(assert (=> d!21436 m!107439))

(declare-fun m!107701 () Bool)

(assert (=> d!21436 m!107701))

(declare-fun m!107703 () Bool)

(assert (=> d!21436 m!107703))

(assert (=> d!21436 m!107453))

(assert (=> d!21436 m!107631))

(assert (=> d!21436 m!107619))

(declare-fun m!107705 () Bool)

(assert (=> d!21436 m!107705))

(assert (=> d!21436 m!107441))

(declare-fun m!107707 () Bool)

(assert (=> d!21436 m!107707))

(declare-fun m!107709 () Bool)

(assert (=> d!21436 m!107709))

(assert (=> b!67450 d!21436))

(declare-fun b!67780 () Bool)

(declare-fun e!44367 () Bool)

(declare-fun lt!108338 () (_ BitVec 64))

(assert (=> b!67780 (= e!44367 (validate_offset_bits!1 ((_ sign_extend 32) (size!1327 (buf!1708 (_2!3079 lt!107492)))) ((_ sign_extend 32) (currentByte!3392 (_2!3079 lt!107492))) ((_ sign_extend 32) (currentBit!3387 (_2!3079 lt!107492))) lt!108338))))

(declare-fun b!67781 () Bool)

(declare-fun res!56078 () Bool)

(declare-fun e!44365 () Bool)

(assert (=> b!67781 (=> (not res!56078) (not e!44365))))

(declare-fun lt!108337 () tuple2!5936)

(assert (=> b!67781 (= res!56078 (= (size!1327 (buf!1708 (_2!3079 lt!108337))) (size!1327 (buf!1708 (_2!3079 lt!107492)))))))

(declare-fun b!67782 () Bool)

(declare-fun e!44366 () tuple2!5936)

(declare-fun Unit!4564 () Unit!4539)

(assert (=> b!67782 (= e!44366 (tuple2!5937 Unit!4564 (_2!3079 lt!107492)))))

(assert (=> b!67782 (= (size!1327 (buf!1708 (_2!3079 lt!107492))) (size!1327 (buf!1708 (_2!3079 lt!107492))))))

(declare-fun lt!108347 () Unit!4539)

(declare-fun Unit!4565 () Unit!4539)

(assert (=> b!67782 (= lt!108347 Unit!4565)))

(declare-fun call!871 () tuple2!5938)

(declare-fun checkByteArrayBitContent!0 (BitStream!2276 array!2870 array!2870 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!67782 (checkByteArrayBitContent!0 (_2!3079 lt!107492) srcBuffer!2 (_1!3086 (readBits!0 (_1!3080 call!871) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!67783 () Bool)

(declare-fun lt!108358 () tuple2!5936)

(declare-fun Unit!4566 () Unit!4539)

(assert (=> b!67783 (= e!44366 (tuple2!5937 Unit!4566 (_2!3079 lt!108358)))))

(declare-fun lt!108341 () tuple2!5936)

(assert (=> b!67783 (= lt!108341 (appendBitFromByte!0 (_2!3079 lt!107492) (select (arr!1897 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!108360 () (_ BitVec 64))

(assert (=> b!67783 (= lt!108360 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!108343 () (_ BitVec 64))

(assert (=> b!67783 (= lt!108343 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!108333 () Unit!4539)

(assert (=> b!67783 (= lt!108333 (validateOffsetBitsIneqLemma!0 (_2!3079 lt!107492) (_2!3079 lt!108341) lt!108360 lt!108343))))

(assert (=> b!67783 (validate_offset_bits!1 ((_ sign_extend 32) (size!1327 (buf!1708 (_2!3079 lt!108341)))) ((_ sign_extend 32) (currentByte!3392 (_2!3079 lt!108341))) ((_ sign_extend 32) (currentBit!3387 (_2!3079 lt!108341))) (bvsub lt!108360 lt!108343))))

(declare-fun lt!108364 () Unit!4539)

(assert (=> b!67783 (= lt!108364 lt!108333)))

(declare-fun lt!108376 () tuple2!5938)

(assert (=> b!67783 (= lt!108376 call!871)))

(declare-fun lt!108342 () (_ BitVec 64))

(assert (=> b!67783 (= lt!108342 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!108345 () Unit!4539)

(assert (=> b!67783 (= lt!108345 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3079 lt!107492) (buf!1708 (_2!3079 lt!108341)) lt!108342))))

(assert (=> b!67783 (validate_offset_bits!1 ((_ sign_extend 32) (size!1327 (buf!1708 (_2!3079 lt!108341)))) ((_ sign_extend 32) (currentByte!3392 (_2!3079 lt!107492))) ((_ sign_extend 32) (currentBit!3387 (_2!3079 lt!107492))) lt!108342)))

(declare-fun lt!108372 () Unit!4539)

(assert (=> b!67783 (= lt!108372 lt!108345)))

(assert (=> b!67783 (= (head!532 (byteArrayBitContentToList!0 (_2!3079 lt!108341) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!532 (bitStreamReadBitsIntoList!0 (_2!3079 lt!108341) (_1!3080 lt!108376) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!108363 () Unit!4539)

(declare-fun Unit!4567 () Unit!4539)

(assert (=> b!67783 (= lt!108363 Unit!4567)))

(assert (=> b!67783 (= lt!108358 (appendBitsMSBFirstLoop!0 (_2!3079 lt!108341) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!108349 () Unit!4539)

(assert (=> b!67783 (= lt!108349 (lemmaIsPrefixTransitive!0 (_2!3079 lt!107492) (_2!3079 lt!108341) (_2!3079 lt!108358)))))

(assert (=> b!67783 (isPrefixOf!0 (_2!3079 lt!107492) (_2!3079 lt!108358))))

(declare-fun lt!108361 () Unit!4539)

(assert (=> b!67783 (= lt!108361 lt!108349)))

(assert (=> b!67783 (= (size!1327 (buf!1708 (_2!3079 lt!108358))) (size!1327 (buf!1708 (_2!3079 lt!107492))))))

(declare-fun lt!108335 () Unit!4539)

(declare-fun Unit!4568 () Unit!4539)

(assert (=> b!67783 (= lt!108335 Unit!4568)))

(assert (=> b!67783 (= (bitIndex!0 (size!1327 (buf!1708 (_2!3079 lt!108358))) (currentByte!3392 (_2!3079 lt!108358)) (currentBit!3387 (_2!3079 lt!108358))) (bvsub (bvadd (bitIndex!0 (size!1327 (buf!1708 (_2!3079 lt!107492))) (currentByte!3392 (_2!3079 lt!107492)) (currentBit!3387 (_2!3079 lt!107492))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!108350 () Unit!4539)

(declare-fun Unit!4569 () Unit!4539)

(assert (=> b!67783 (= lt!108350 Unit!4569)))

(assert (=> b!67783 (= (bitIndex!0 (size!1327 (buf!1708 (_2!3079 lt!108358))) (currentByte!3392 (_2!3079 lt!108358)) (currentBit!3387 (_2!3079 lt!108358))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1327 (buf!1708 (_2!3079 lt!108341))) (currentByte!3392 (_2!3079 lt!108341)) (currentBit!3387 (_2!3079 lt!108341))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!108340 () Unit!4539)

(declare-fun Unit!4570 () Unit!4539)

(assert (=> b!67783 (= lt!108340 Unit!4570)))

(declare-fun lt!108352 () tuple2!5938)

(assert (=> b!67783 (= lt!108352 (reader!0 (_2!3079 lt!107492) (_2!3079 lt!108358)))))

(declare-fun lt!108355 () (_ BitVec 64))

(assert (=> b!67783 (= lt!108355 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!108365 () Unit!4539)

(assert (=> b!67783 (= lt!108365 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3079 lt!107492) (buf!1708 (_2!3079 lt!108358)) lt!108355))))

(assert (=> b!67783 (validate_offset_bits!1 ((_ sign_extend 32) (size!1327 (buf!1708 (_2!3079 lt!108358)))) ((_ sign_extend 32) (currentByte!3392 (_2!3079 lt!107492))) ((_ sign_extend 32) (currentBit!3387 (_2!3079 lt!107492))) lt!108355)))

(declare-fun lt!108354 () Unit!4539)

(assert (=> b!67783 (= lt!108354 lt!108365)))

(declare-fun lt!108348 () tuple2!5938)

(assert (=> b!67783 (= lt!108348 (reader!0 (_2!3079 lt!108341) (_2!3079 lt!108358)))))

(declare-fun lt!108356 () (_ BitVec 64))

(assert (=> b!67783 (= lt!108356 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!108373 () Unit!4539)

(assert (=> b!67783 (= lt!108373 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3079 lt!108341) (buf!1708 (_2!3079 lt!108358)) lt!108356))))

(assert (=> b!67783 (validate_offset_bits!1 ((_ sign_extend 32) (size!1327 (buf!1708 (_2!3079 lt!108358)))) ((_ sign_extend 32) (currentByte!3392 (_2!3079 lt!108341))) ((_ sign_extend 32) (currentBit!3387 (_2!3079 lt!108341))) lt!108356)))

(declare-fun lt!108344 () Unit!4539)

(assert (=> b!67783 (= lt!108344 lt!108373)))

(declare-fun lt!108375 () List!713)

(assert (=> b!67783 (= lt!108375 (byteArrayBitContentToList!0 (_2!3079 lt!108358) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!108370 () List!713)

(assert (=> b!67783 (= lt!108370 (byteArrayBitContentToList!0 (_2!3079 lt!108358) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!108374 () List!713)

(assert (=> b!67783 (= lt!108374 (bitStreamReadBitsIntoList!0 (_2!3079 lt!108358) (_1!3080 lt!108352) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!108336 () List!713)

(assert (=> b!67783 (= lt!108336 (bitStreamReadBitsIntoList!0 (_2!3079 lt!108358) (_1!3080 lt!108348) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!108346 () (_ BitVec 64))

(assert (=> b!67783 (= lt!108346 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!108357 () Unit!4539)

(assert (=> b!67783 (= lt!108357 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3079 lt!108358) (_2!3079 lt!108358) (_1!3080 lt!108352) (_1!3080 lt!108348) lt!108346 lt!108374))))

(assert (=> b!67783 (= (bitStreamReadBitsIntoList!0 (_2!3079 lt!108358) (_1!3080 lt!108348) (bvsub lt!108346 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!317 lt!108374))))

(declare-fun lt!108334 () Unit!4539)

(assert (=> b!67783 (= lt!108334 lt!108357)))

(declare-fun lt!108371 () (_ BitVec 64))

(declare-fun lt!108368 () Unit!4539)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2870 array!2870 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4539)

(assert (=> b!67783 (= lt!108368 (arrayBitRangesEqImpliesEq!0 (buf!1708 (_2!3079 lt!108341)) (buf!1708 (_2!3079 lt!108358)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!108371 (bitIndex!0 (size!1327 (buf!1708 (_2!3079 lt!108341))) (currentByte!3392 (_2!3079 lt!108341)) (currentBit!3387 (_2!3079 lt!108341)))))))

(assert (=> b!67783 (= (bitAt!0 (buf!1708 (_2!3079 lt!108341)) lt!108371) (bitAt!0 (buf!1708 (_2!3079 lt!108358)) lt!108371))))

(declare-fun lt!108359 () Unit!4539)

(assert (=> b!67783 (= lt!108359 lt!108368)))

(declare-fun lt!108366 () tuple2!5938)

(declare-fun b!67785 () Bool)

(assert (=> b!67785 (= e!44365 (= (bitStreamReadBitsIntoList!0 (_2!3079 lt!108337) (_1!3080 lt!108366) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!3079 lt!108337) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!67785 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!67785 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!108369 () Unit!4539)

(declare-fun lt!108351 () Unit!4539)

(assert (=> b!67785 (= lt!108369 lt!108351)))

(assert (=> b!67785 (validate_offset_bits!1 ((_ sign_extend 32) (size!1327 (buf!1708 (_2!3079 lt!108337)))) ((_ sign_extend 32) (currentByte!3392 (_2!3079 lt!107492))) ((_ sign_extend 32) (currentBit!3387 (_2!3079 lt!107492))) lt!108338)))

(assert (=> b!67785 (= lt!108351 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3079 lt!107492) (buf!1708 (_2!3079 lt!108337)) lt!108338))))

(assert (=> b!67785 e!44367))

(declare-fun res!56079 () Bool)

(assert (=> b!67785 (=> (not res!56079) (not e!44367))))

(assert (=> b!67785 (= res!56079 (and (= (size!1327 (buf!1708 (_2!3079 lt!107492))) (size!1327 (buf!1708 (_2!3079 lt!108337)))) (bvsge lt!108338 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!67785 (= lt!108338 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!67785 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!67785 (= lt!108366 (reader!0 (_2!3079 lt!107492) (_2!3079 lt!108337)))))

(declare-fun b!67786 () Bool)

(declare-fun res!56080 () Bool)

(assert (=> b!67786 (=> (not res!56080) (not e!44365))))

(assert (=> b!67786 (= res!56080 (invariant!0 (currentBit!3387 (_2!3079 lt!108337)) (currentByte!3392 (_2!3079 lt!108337)) (size!1327 (buf!1708 (_2!3079 lt!108337)))))))

(declare-fun b!67787 () Bool)

(declare-fun res!56083 () Bool)

(assert (=> b!67787 (=> (not res!56083) (not e!44365))))

(assert (=> b!67787 (= res!56083 (= (size!1327 (buf!1708 (_2!3079 lt!107492))) (size!1327 (buf!1708 (_2!3079 lt!108337)))))))

(declare-fun bm!868 () Bool)

(declare-fun c!4976 () Bool)

(assert (=> bm!868 (= call!871 (reader!0 (_2!3079 lt!107492) (ite c!4976 (_2!3079 lt!108341) (_2!3079 lt!107492))))))

(declare-fun b!67784 () Bool)

(declare-fun res!56081 () Bool)

(assert (=> b!67784 (=> (not res!56081) (not e!44365))))

(assert (=> b!67784 (= res!56081 (isPrefixOf!0 (_2!3079 lt!107492) (_2!3079 lt!108337)))))

(declare-fun d!21438 () Bool)

(assert (=> d!21438 e!44365))

(declare-fun res!56082 () Bool)

(assert (=> d!21438 (=> (not res!56082) (not e!44365))))

(declare-fun lt!108367 () (_ BitVec 64))

(assert (=> d!21438 (= res!56082 (= (bitIndex!0 (size!1327 (buf!1708 (_2!3079 lt!108337))) (currentByte!3392 (_2!3079 lt!108337)) (currentBit!3387 (_2!3079 lt!108337))) (bvsub lt!108367 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!21438 (or (= (bvand lt!108367 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!108367 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!108367 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!108362 () (_ BitVec 64))

(assert (=> d!21438 (= lt!108367 (bvadd lt!108362 to!314))))

(assert (=> d!21438 (or (not (= (bvand lt!108362 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!108362 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!108362 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!21438 (= lt!108362 (bitIndex!0 (size!1327 (buf!1708 (_2!3079 lt!107492))) (currentByte!3392 (_2!3079 lt!107492)) (currentBit!3387 (_2!3079 lt!107492))))))

(assert (=> d!21438 (= lt!108337 e!44366)))

(assert (=> d!21438 (= c!4976 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!108353 () Unit!4539)

(declare-fun lt!108339 () Unit!4539)

(assert (=> d!21438 (= lt!108353 lt!108339)))

(assert (=> d!21438 (isPrefixOf!0 (_2!3079 lt!107492) (_2!3079 lt!107492))))

(assert (=> d!21438 (= lt!108339 (lemmaIsPrefixRefl!0 (_2!3079 lt!107492)))))

(assert (=> d!21438 (= lt!108371 (bitIndex!0 (size!1327 (buf!1708 (_2!3079 lt!107492))) (currentByte!3392 (_2!3079 lt!107492)) (currentBit!3387 (_2!3079 lt!107492))))))

(assert (=> d!21438 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21438 (= (appendBitsMSBFirstLoop!0 (_2!3079 lt!107492) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!108337)))

(assert (= (and d!21438 c!4976) b!67783))

(assert (= (and d!21438 (not c!4976)) b!67782))

(assert (= (or b!67783 b!67782) bm!868))

(assert (= (and d!21438 res!56082) b!67786))

(assert (= (and b!67786 res!56080) b!67787))

(assert (= (and b!67787 res!56083) b!67784))

(assert (= (and b!67784 res!56081) b!67781))

(assert (= (and b!67781 res!56078) b!67785))

(assert (= (and b!67785 res!56079) b!67780))

(declare-fun m!108075 () Bool)

(assert (=> b!67784 m!108075))

(declare-fun m!108077 () Bool)

(assert (=> d!21438 m!108077))

(assert (=> d!21438 m!107437))

(assert (=> d!21438 m!107619))

(assert (=> d!21438 m!107631))

(declare-fun m!108079 () Bool)

(assert (=> b!67785 m!108079))

(declare-fun m!108081 () Bool)

(assert (=> b!67785 m!108081))

(declare-fun m!108083 () Bool)

(assert (=> b!67785 m!108083))

(declare-fun m!108085 () Bool)

(assert (=> b!67785 m!108085))

(declare-fun m!108087 () Bool)

(assert (=> b!67785 m!108087))

(declare-fun m!108089 () Bool)

(assert (=> b!67786 m!108089))

(declare-fun m!108091 () Bool)

(assert (=> bm!868 m!108091))

(declare-fun m!108093 () Bool)

(assert (=> b!67782 m!108093))

(declare-fun m!108095 () Bool)

(assert (=> b!67782 m!108095))

(declare-fun m!108097 () Bool)

(assert (=> b!67780 m!108097))

(declare-fun m!108099 () Bool)

(assert (=> b!67783 m!108099))

(declare-fun m!108101 () Bool)

(assert (=> b!67783 m!108101))

(declare-fun m!108103 () Bool)

(assert (=> b!67783 m!108103))

(declare-fun m!108105 () Bool)

(assert (=> b!67783 m!108105))

(declare-fun m!108107 () Bool)

(assert (=> b!67783 m!108107))

(declare-fun m!108109 () Bool)

(assert (=> b!67783 m!108109))

(assert (=> b!67783 m!108103))

(declare-fun m!108111 () Bool)

(assert (=> b!67783 m!108111))

(assert (=> b!67783 m!107437))

(declare-fun m!108113 () Bool)

(assert (=> b!67783 m!108113))

(declare-fun m!108115 () Bool)

(assert (=> b!67783 m!108115))

(declare-fun m!108117 () Bool)

(assert (=> b!67783 m!108117))

(declare-fun m!108119 () Bool)

(assert (=> b!67783 m!108119))

(declare-fun m!108121 () Bool)

(assert (=> b!67783 m!108121))

(declare-fun m!108123 () Bool)

(assert (=> b!67783 m!108123))

(assert (=> b!67783 m!108105))

(declare-fun m!108125 () Bool)

(assert (=> b!67783 m!108125))

(declare-fun m!108127 () Bool)

(assert (=> b!67783 m!108127))

(declare-fun m!108129 () Bool)

(assert (=> b!67783 m!108129))

(declare-fun m!108131 () Bool)

(assert (=> b!67783 m!108131))

(declare-fun m!108133 () Bool)

(assert (=> b!67783 m!108133))

(declare-fun m!108135 () Bool)

(assert (=> b!67783 m!108135))

(declare-fun m!108137 () Bool)

(assert (=> b!67783 m!108137))

(assert (=> b!67783 m!108119))

(declare-fun m!108139 () Bool)

(assert (=> b!67783 m!108139))

(declare-fun m!108141 () Bool)

(assert (=> b!67783 m!108141))

(declare-fun m!108143 () Bool)

(assert (=> b!67783 m!108143))

(assert (=> b!67783 m!108131))

(declare-fun m!108145 () Bool)

(assert (=> b!67783 m!108145))

(declare-fun m!108147 () Bool)

(assert (=> b!67783 m!108147))

(declare-fun m!108149 () Bool)

(assert (=> b!67783 m!108149))

(declare-fun m!108151 () Bool)

(assert (=> b!67783 m!108151))

(declare-fun m!108153 () Bool)

(assert (=> b!67783 m!108153))

(declare-fun m!108155 () Bool)

(assert (=> b!67783 m!108155))

(declare-fun m!108157 () Bool)

(assert (=> b!67783 m!108157))

(declare-fun m!108159 () Bool)

(assert (=> b!67783 m!108159))

(assert (=> b!67450 d!21438))

(declare-fun d!21514 () Bool)

(declare-fun res!56086 () Bool)

(declare-fun e!44369 () Bool)

(assert (=> d!21514 (=> (not res!56086) (not e!44369))))

(assert (=> d!21514 (= res!56086 (= (size!1327 (buf!1708 (_2!3079 lt!107492))) (size!1327 (buf!1708 (_2!3079 lt!107485)))))))

(assert (=> d!21514 (= (isPrefixOf!0 (_2!3079 lt!107492) (_2!3079 lt!107485)) e!44369)))

(declare-fun b!67788 () Bool)

(declare-fun res!56084 () Bool)

(assert (=> b!67788 (=> (not res!56084) (not e!44369))))

(assert (=> b!67788 (= res!56084 (bvsle (bitIndex!0 (size!1327 (buf!1708 (_2!3079 lt!107492))) (currentByte!3392 (_2!3079 lt!107492)) (currentBit!3387 (_2!3079 lt!107492))) (bitIndex!0 (size!1327 (buf!1708 (_2!3079 lt!107485))) (currentByte!3392 (_2!3079 lt!107485)) (currentBit!3387 (_2!3079 lt!107485)))))))

(declare-fun b!67789 () Bool)

(declare-fun e!44368 () Bool)

(assert (=> b!67789 (= e!44369 e!44368)))

(declare-fun res!56085 () Bool)

(assert (=> b!67789 (=> res!56085 e!44368)))

(assert (=> b!67789 (= res!56085 (= (size!1327 (buf!1708 (_2!3079 lt!107492))) #b00000000000000000000000000000000))))

(declare-fun b!67790 () Bool)

(assert (=> b!67790 (= e!44368 (arrayBitRangesEq!0 (buf!1708 (_2!3079 lt!107492)) (buf!1708 (_2!3079 lt!107485)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1327 (buf!1708 (_2!3079 lt!107492))) (currentByte!3392 (_2!3079 lt!107492)) (currentBit!3387 (_2!3079 lt!107492)))))))

(assert (= (and d!21514 res!56086) b!67788))

(assert (= (and b!67788 res!56084) b!67789))

(assert (= (and b!67789 (not res!56085)) b!67790))

(assert (=> b!67788 m!107437))

(assert (=> b!67788 m!107409))

(assert (=> b!67790 m!107437))

(assert (=> b!67790 m!107437))

(declare-fun m!108161 () Bool)

(assert (=> b!67790 m!108161))

(assert (=> b!67450 d!21514))

(declare-fun d!21516 () Bool)

(assert (=> d!21516 (isPrefixOf!0 thiss!1379 (_2!3079 lt!107485))))

(declare-fun lt!108388 () Unit!4539)

(declare-fun choose!30 (BitStream!2276 BitStream!2276 BitStream!2276) Unit!4539)

(assert (=> d!21516 (= lt!108388 (choose!30 thiss!1379 (_2!3079 lt!107492) (_2!3079 lt!107485)))))

(assert (=> d!21516 (isPrefixOf!0 thiss!1379 (_2!3079 lt!107492))))

(assert (=> d!21516 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3079 lt!107492) (_2!3079 lt!107485)) lt!108388)))

(declare-fun bs!5206 () Bool)

(assert (= bs!5206 d!21516))

(assert (=> bs!5206 m!107485))

(declare-fun m!108163 () Bool)

(assert (=> bs!5206 m!108163))

(assert (=> bs!5206 m!107453))

(assert (=> b!67450 d!21516))

(declare-fun d!21518 () Bool)

(assert (=> d!21518 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1327 (buf!1708 (_2!3079 lt!107492)))) ((_ sign_extend 32) (currentByte!3392 thiss!1379)) ((_ sign_extend 32) (currentBit!3387 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1327 (buf!1708 (_2!3079 lt!107492)))) ((_ sign_extend 32) (currentByte!3392 thiss!1379)) ((_ sign_extend 32) (currentBit!3387 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!5207 () Bool)

(assert (= bs!5207 d!21518))

(declare-fun m!108173 () Bool)

(assert (=> bs!5207 m!108173))

(assert (=> b!67450 d!21518))

(declare-fun d!21522 () Bool)

(assert (=> d!21522 (= (tail!317 lt!107489) (t!1463 lt!107489))))

(assert (=> b!67440 d!21522))

(declare-fun d!21524 () Bool)

(declare-fun e!44386 () Bool)

(assert (=> d!21524 e!44386))

(declare-fun res!56098 () Bool)

(assert (=> d!21524 (=> (not res!56098) (not e!44386))))

(declare-fun lt!108439 () (_ BitVec 64))

(assert (=> d!21524 (= res!56098 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!108439 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!108439) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!21524 (= lt!108439 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!108438 () Unit!4539)

(declare-fun choose!42 (BitStream!2276 BitStream!2276 BitStream!2276 BitStream!2276 (_ BitVec 64) List!713) Unit!4539)

(assert (=> d!21524 (= lt!108438 (choose!42 (_2!3079 lt!107485) (_2!3079 lt!107485) (_1!3080 lt!107474) (_1!3080 lt!107478) (bvsub to!314 i!635) lt!107489))))

(assert (=> d!21524 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21524 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3079 lt!107485) (_2!3079 lt!107485) (_1!3080 lt!107474) (_1!3080 lt!107478) (bvsub to!314 i!635) lt!107489) lt!108438)))

(declare-fun b!67822 () Bool)

(assert (=> b!67822 (= e!44386 (= (bitStreamReadBitsIntoList!0 (_2!3079 lt!107485) (_1!3080 lt!107478) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!317 lt!107489)))))

(assert (= (and d!21524 res!56098) b!67822))

(declare-fun m!108241 () Bool)

(assert (=> d!21524 m!108241))

(declare-fun m!108243 () Bool)

(assert (=> b!67822 m!108243))

(assert (=> b!67822 m!107477))

(assert (=> b!67440 d!21524))

(declare-fun d!21546 () Bool)

(declare-fun e!44387 () Bool)

(assert (=> d!21546 e!44387))

(declare-fun res!56099 () Bool)

(assert (=> d!21546 (=> (not res!56099) (not e!44387))))

(declare-fun lt!108445 () (_ BitVec 64))

(declare-fun lt!108442 () (_ BitVec 64))

(declare-fun lt!108443 () (_ BitVec 64))

(assert (=> d!21546 (= res!56099 (= lt!108442 (bvsub lt!108445 lt!108443)))))

(assert (=> d!21546 (or (= (bvand lt!108445 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!108443 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!108445 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!108445 lt!108443) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!21546 (= lt!108443 (remainingBits!0 ((_ sign_extend 32) (size!1327 (buf!1708 (_2!3079 lt!107485)))) ((_ sign_extend 32) (currentByte!3392 (_2!3079 lt!107485))) ((_ sign_extend 32) (currentBit!3387 (_2!3079 lt!107485)))))))

(declare-fun lt!108441 () (_ BitVec 64))

(declare-fun lt!108440 () (_ BitVec 64))

(assert (=> d!21546 (= lt!108445 (bvmul lt!108441 lt!108440))))

(assert (=> d!21546 (or (= lt!108441 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!108440 (bvsdiv (bvmul lt!108441 lt!108440) lt!108441)))))

(assert (=> d!21546 (= lt!108440 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!21546 (= lt!108441 ((_ sign_extend 32) (size!1327 (buf!1708 (_2!3079 lt!107485)))))))

(assert (=> d!21546 (= lt!108442 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3392 (_2!3079 lt!107485))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3387 (_2!3079 lt!107485)))))))

(assert (=> d!21546 (invariant!0 (currentBit!3387 (_2!3079 lt!107485)) (currentByte!3392 (_2!3079 lt!107485)) (size!1327 (buf!1708 (_2!3079 lt!107485))))))

(assert (=> d!21546 (= (bitIndex!0 (size!1327 (buf!1708 (_2!3079 lt!107485))) (currentByte!3392 (_2!3079 lt!107485)) (currentBit!3387 (_2!3079 lt!107485))) lt!108442)))

(declare-fun b!67823 () Bool)

(declare-fun res!56100 () Bool)

(assert (=> b!67823 (=> (not res!56100) (not e!44387))))

(assert (=> b!67823 (= res!56100 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!108442))))

(declare-fun b!67824 () Bool)

(declare-fun lt!108444 () (_ BitVec 64))

(assert (=> b!67824 (= e!44387 (bvsle lt!108442 (bvmul lt!108444 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!67824 (or (= lt!108444 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!108444 #b0000000000000000000000000000000000000000000000000000000000001000) lt!108444)))))

(assert (=> b!67824 (= lt!108444 ((_ sign_extend 32) (size!1327 (buf!1708 (_2!3079 lt!107485)))))))

(assert (= (and d!21546 res!56099) b!67823))

(assert (= (and b!67823 res!56100) b!67824))

(declare-fun m!108245 () Bool)

(assert (=> d!21546 m!108245))

(assert (=> d!21546 m!107481))

(assert (=> b!67451 d!21546))

(push 1)

(assert (not d!21364))

(assert (not d!21518))

(assert (not b!67822))

(assert (not d!21432))

(assert (not b!67607))

(assert (not b!67538))

(assert (not b!67784))

(assert (not b!67532))

(assert (not b!67602))

(assert (not bm!868))

(assert (not b!67596))

(assert (not b!67783))

(assert (not d!21416))

(assert (not d!21392))

(assert (not b!67593))

(assert (not b!67785))

(assert (not b!67594))

(assert (not b!67587))

(assert (not d!21408))

(assert (not b!67531))

(assert (not b!67506))

(assert (not b!67534))

(assert (not d!21422))

(assert (not b!67555))

(assert (not b!67554))

(assert (not d!21396))

(assert (not b!67600))

(assert (not d!21546))

(assert (not d!21406))

(assert (not b!67529))

(assert (not b!67589))

(assert (not b!67533))

(assert (not b!67614))

(assert (not b!67536))

(assert (not d!21410))

(assert (not d!21404))

(assert (not b!67788))

(assert (not d!21524))

(assert (not b!67565))

(assert (not b!67591))

(assert (not b!67588))

(assert (not b!67603))

(assert (not b!67530))

(assert (not d!21436))

(assert (not d!21438))

(assert (not b!67499))

(assert (not d!21516))

(assert (not d!21426))

(assert (not d!21362))

(assert (not d!21402))

(assert (not b!67563))

(assert (not b!67511))

(assert (not b!67535))

(assert (not b!67612))

(assert (not b!67611))

(assert (not b!67598))

(assert (not d!21366))

(assert (not b!67609))

(assert (not d!21388))

(assert (not b!67599))

(assert (not d!21412))

(assert (not b!67782))

(assert (not b!67592))

(assert (not b!67790))

(assert (not b!67786))

(assert (not b!67610))

(assert (not b!67780))

(assert (not b!67604))

(assert (not b!67556))

(assert (not b!67508))

(check-sat)

(pop 1)

(push 1)

(check-sat)

