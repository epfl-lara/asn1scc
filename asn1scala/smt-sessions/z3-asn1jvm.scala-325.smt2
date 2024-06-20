; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7072 () Bool)

(assert start!7072)

(declare-fun b!34410 () Bool)

(declare-fun res!29465 () Bool)

(declare-fun e!22816 () Bool)

(assert (=> b!34410 (=> res!29465 e!22816)))

(declare-datatypes ((array!1885 0))(
  ( (array!1886 (arr!1314 (Array (_ BitVec 32) (_ BitVec 8))) (size!836 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1458 0))(
  ( (BitStream!1459 (buf!1164 array!1885) (currentByte!2537 (_ BitVec 32)) (currentBit!2532 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2551 0))(
  ( (Unit!2552) )
))
(declare-datatypes ((tuple2!3470 0))(
  ( (tuple2!3471 (_1!1822 Unit!2551) (_2!1822 BitStream!1458)) )
))
(declare-fun lt!50802 () tuple2!3470)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!34410 (= res!29465 (not (invariant!0 (currentBit!2532 (_2!1822 lt!50802)) (currentByte!2537 (_2!1822 lt!50802)) (size!836 (buf!1164 (_2!1822 lt!50802))))))))

(declare-fun b!34411 () Bool)

(declare-fun res!29463 () Bool)

(declare-fun e!22810 () Bool)

(assert (=> b!34411 (=> res!29463 e!22810)))

(declare-datatypes ((List!430 0))(
  ( (Nil!427) (Cons!426 (h!545 Bool) (t!1180 List!430)) )
))
(declare-fun lt!50799 () List!430)

(declare-fun lt!50796 () Bool)

(declare-fun head!267 (List!430) Bool)

(assert (=> b!34411 (= res!29463 (not (= (head!267 lt!50799) lt!50796)))))

(declare-fun b!34412 () Bool)

(declare-fun e!22821 () Bool)

(assert (=> b!34412 (= e!22821 e!22810)))

(declare-fun res!29448 () Bool)

(assert (=> b!34412 (=> res!29448 e!22810)))

(declare-datatypes ((tuple2!3472 0))(
  ( (tuple2!3473 (_1!1823 BitStream!1458) (_2!1823 BitStream!1458)) )
))
(declare-fun lt!50789 () tuple2!3472)

(declare-fun lt!50803 () (_ BitVec 64))

(declare-fun bitAt!0 (array!1885 (_ BitVec 64)) Bool)

(assert (=> b!34412 (= res!29448 (not (= lt!50796 (bitAt!0 (buf!1164 (_1!1823 lt!50789)) lt!50803))))))

(declare-fun lt!50787 () tuple2!3472)

(assert (=> b!34412 (= lt!50796 (bitAt!0 (buf!1164 (_1!1823 lt!50787)) lt!50803))))

(declare-fun b!34413 () Bool)

(declare-fun res!29454 () Bool)

(assert (=> b!34413 (=> res!29454 e!22816)))

(declare-fun lt!50794 () tuple2!3470)

(assert (=> b!34413 (= res!29454 (not (invariant!0 (currentBit!2532 (_2!1822 lt!50802)) (currentByte!2537 (_2!1822 lt!50802)) (size!836 (buf!1164 (_2!1822 lt!50794))))))))

(declare-fun srcBuffer!2 () array!1885)

(declare-fun lt!50783 () tuple2!3472)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun b!34414 () Bool)

(declare-fun e!22812 () Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1458 array!1885 (_ BitVec 64) (_ BitVec 64)) List!430)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1458 BitStream!1458 (_ BitVec 64)) List!430)

(assert (=> b!34414 (= e!22812 (= (head!267 (byteArrayBitContentToList!0 (_2!1822 lt!50802) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!267 (bitStreamReadBitsIntoList!0 (_2!1822 lt!50802) (_1!1823 lt!50783) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!34415 () Bool)

(declare-fun e!22817 () Bool)

(declare-fun e!22822 () Bool)

(assert (=> b!34415 (= e!22817 e!22822)))

(declare-fun res!29455 () Bool)

(assert (=> b!34415 (=> res!29455 e!22822)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!50795 () (_ BitVec 64))

(assert (=> b!34415 (= res!29455 (not (= lt!50795 (bvsub (bvadd lt!50803 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!34415 (= lt!50795 (bitIndex!0 (size!836 (buf!1164 (_2!1822 lt!50794))) (currentByte!2537 (_2!1822 lt!50794)) (currentBit!2532 (_2!1822 lt!50794))))))

(declare-fun b!34416 () Bool)

(declare-fun e!22809 () Bool)

(assert (=> b!34416 (= e!22809 e!22821)))

(declare-fun res!29461 () Bool)

(assert (=> b!34416 (=> res!29461 e!22821)))

(declare-fun lt!50801 () List!430)

(declare-fun lt!50793 () List!430)

(assert (=> b!34416 (= res!29461 (not (= lt!50801 lt!50793)))))

(assert (=> b!34416 (= lt!50793 lt!50801)))

(declare-fun tail!147 (List!430) List!430)

(assert (=> b!34416 (= lt!50801 (tail!147 lt!50799))))

(declare-fun lt!50785 () Unit!2551)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1458 BitStream!1458 BitStream!1458 BitStream!1458 (_ BitVec 64) List!430) Unit!2551)

(assert (=> b!34416 (= lt!50785 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1822 lt!50794) (_2!1822 lt!50794) (_1!1823 lt!50787) (_1!1823 lt!50789) (bvsub to!314 i!635) lt!50799))))

(declare-fun b!34417 () Bool)

(declare-fun res!29453 () Bool)

(assert (=> b!34417 (=> res!29453 e!22809)))

(declare-fun length!156 (List!430) Int)

(assert (=> b!34417 (= res!29453 (<= (length!156 lt!50799) 0))))

(declare-fun b!34418 () Bool)

(declare-fun e!22808 () Bool)

(assert (=> b!34418 (= e!22808 e!22817)))

(declare-fun res!29462 () Bool)

(assert (=> b!34418 (=> res!29462 e!22817)))

(declare-fun isPrefixOf!0 (BitStream!1458 BitStream!1458) Bool)

(assert (=> b!34418 (= res!29462 (not (isPrefixOf!0 (_2!1822 lt!50802) (_2!1822 lt!50794))))))

(declare-fun thiss!1379 () BitStream!1458)

(assert (=> b!34418 (isPrefixOf!0 thiss!1379 (_2!1822 lt!50794))))

(declare-fun lt!50800 () Unit!2551)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1458 BitStream!1458 BitStream!1458) Unit!2551)

(assert (=> b!34418 (= lt!50800 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1822 lt!50802) (_2!1822 lt!50794)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1458 array!1885 (_ BitVec 64) (_ BitVec 64)) tuple2!3470)

(assert (=> b!34418 (= lt!50794 (appendBitsMSBFirstLoop!0 (_2!1822 lt!50802) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!34418 e!22812))

(declare-fun res!29457 () Bool)

(assert (=> b!34418 (=> (not res!29457) (not e!22812))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!34418 (= res!29457 (validate_offset_bits!1 ((_ sign_extend 32) (size!836 (buf!1164 (_2!1822 lt!50802)))) ((_ sign_extend 32) (currentByte!2537 thiss!1379)) ((_ sign_extend 32) (currentBit!2532 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!50792 () Unit!2551)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1458 array!1885 (_ BitVec 64)) Unit!2551)

(assert (=> b!34418 (= lt!50792 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1164 (_2!1822 lt!50802)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1458 BitStream!1458) tuple2!3472)

(assert (=> b!34418 (= lt!50783 (reader!0 thiss!1379 (_2!1822 lt!50802)))))

(declare-fun b!34419 () Bool)

(assert (=> b!34419 (= e!22822 e!22816)))

(declare-fun res!29451 () Bool)

(assert (=> b!34419 (=> res!29451 e!22816)))

(assert (=> b!34419 (= res!29451 (not (= (size!836 (buf!1164 (_2!1822 lt!50802))) (size!836 (buf!1164 (_2!1822 lt!50794))))))))

(declare-fun lt!50782 () (_ BitVec 64))

(assert (=> b!34419 (= lt!50795 (bvsub (bvsub (bvadd lt!50782 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!34419 (= lt!50782 (bitIndex!0 (size!836 (buf!1164 (_2!1822 lt!50802))) (currentByte!2537 (_2!1822 lt!50802)) (currentBit!2532 (_2!1822 lt!50802))))))

(assert (=> b!34419 (= (size!836 (buf!1164 (_2!1822 lt!50794))) (size!836 (buf!1164 thiss!1379)))))

(declare-fun b!34420 () Bool)

(declare-fun res!29456 () Bool)

(assert (=> b!34420 (=> res!29456 e!22822)))

(assert (=> b!34420 (= res!29456 (not (= (size!836 (buf!1164 thiss!1379)) (size!836 (buf!1164 (_2!1822 lt!50794))))))))

(declare-fun b!34421 () Bool)

(declare-fun e!22813 () Bool)

(assert (=> b!34421 (= e!22813 e!22808)))

(declare-fun res!29460 () Bool)

(assert (=> b!34421 (=> res!29460 e!22808)))

(assert (=> b!34421 (= res!29460 (not (isPrefixOf!0 thiss!1379 (_2!1822 lt!50802))))))

(declare-fun lt!50786 () (_ BitVec 64))

(assert (=> b!34421 (validate_offset_bits!1 ((_ sign_extend 32) (size!836 (buf!1164 (_2!1822 lt!50802)))) ((_ sign_extend 32) (currentByte!2537 (_2!1822 lt!50802))) ((_ sign_extend 32) (currentBit!2532 (_2!1822 lt!50802))) lt!50786)))

(assert (=> b!34421 (= lt!50786 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!50788 () Unit!2551)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1458 BitStream!1458 (_ BitVec 64) (_ BitVec 64)) Unit!2551)

(assert (=> b!34421 (= lt!50788 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1822 lt!50802) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1458 (_ BitVec 8) (_ BitVec 32)) tuple2!3470)

(assert (=> b!34421 (= lt!50802 (appendBitFromByte!0 thiss!1379 (select (arr!1314 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!34422 () Bool)

(declare-fun e!22820 () Bool)

(declare-fun e!22818 () Bool)

(assert (=> b!34422 (= e!22820 e!22818)))

(declare-fun res!29466 () Bool)

(assert (=> b!34422 (=> res!29466 e!22818)))

(declare-fun lt!50791 () Bool)

(declare-fun lt!50790 () Bool)

(assert (=> b!34422 (= res!29466 (not (= lt!50791 lt!50790)))))

(assert (=> b!34422 (= lt!50791 (bitAt!0 (buf!1164 (_2!1822 lt!50802)) lt!50803))))

(declare-fun b!34423 () Bool)

(assert (=> b!34423 (= e!22818 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!50803) (bvslt lt!50803 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!836 (buf!1164 (_2!1822 lt!50794))))))))))

(assert (=> b!34423 (= lt!50791 (bitAt!0 (buf!1164 (_2!1822 lt!50794)) lt!50803))))

(declare-fun lt!50798 () Unit!2551)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1885 array!1885 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2551)

(assert (=> b!34423 (= lt!50798 (arrayBitRangesEqImpliesEq!0 (buf!1164 (_2!1822 lt!50802)) (buf!1164 (_2!1822 lt!50794)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!50803 lt!50782))))

(declare-fun b!34424 () Bool)

(declare-fun res!29459 () Bool)

(declare-fun e!22819 () Bool)

(assert (=> b!34424 (=> (not res!29459) (not e!22819))))

(assert (=> b!34424 (= res!29459 (validate_offset_bits!1 ((_ sign_extend 32) (size!836 (buf!1164 thiss!1379))) ((_ sign_extend 32) (currentByte!2537 thiss!1379)) ((_ sign_extend 32) (currentBit!2532 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!34425 () Bool)

(assert (=> b!34425 (= e!22819 (not e!22813))))

(declare-fun res!29449 () Bool)

(assert (=> b!34425 (=> res!29449 e!22813)))

(assert (=> b!34425 (= res!29449 (bvsge i!635 to!314))))

(assert (=> b!34425 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!50781 () Unit!2551)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1458) Unit!2551)

(assert (=> b!34425 (= lt!50781 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!34425 (= lt!50803 (bitIndex!0 (size!836 (buf!1164 thiss!1379)) (currentByte!2537 thiss!1379) (currentBit!2532 thiss!1379)))))

(declare-fun b!34426 () Bool)

(assert (=> b!34426 (= e!22816 e!22809)))

(declare-fun res!29464 () Bool)

(assert (=> b!34426 (=> res!29464 e!22809)))

(assert (=> b!34426 (= res!29464 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!34426 (= lt!50793 (bitStreamReadBitsIntoList!0 (_2!1822 lt!50794) (_1!1823 lt!50789) lt!50786))))

(assert (=> b!34426 (= lt!50799 (bitStreamReadBitsIntoList!0 (_2!1822 lt!50794) (_1!1823 lt!50787) (bvsub to!314 i!635)))))

(assert (=> b!34426 (validate_offset_bits!1 ((_ sign_extend 32) (size!836 (buf!1164 (_2!1822 lt!50794)))) ((_ sign_extend 32) (currentByte!2537 (_2!1822 lt!50802))) ((_ sign_extend 32) (currentBit!2532 (_2!1822 lt!50802))) lt!50786)))

(declare-fun lt!50784 () Unit!2551)

(assert (=> b!34426 (= lt!50784 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1822 lt!50802) (buf!1164 (_2!1822 lt!50794)) lt!50786))))

(assert (=> b!34426 (= lt!50789 (reader!0 (_2!1822 lt!50802) (_2!1822 lt!50794)))))

(assert (=> b!34426 (validate_offset_bits!1 ((_ sign_extend 32) (size!836 (buf!1164 (_2!1822 lt!50794)))) ((_ sign_extend 32) (currentByte!2537 thiss!1379)) ((_ sign_extend 32) (currentBit!2532 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!50797 () Unit!2551)

(assert (=> b!34426 (= lt!50797 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1164 (_2!1822 lt!50794)) (bvsub to!314 i!635)))))

(assert (=> b!34426 (= lt!50787 (reader!0 thiss!1379 (_2!1822 lt!50794)))))

(declare-fun b!34427 () Bool)

(assert (=> b!34427 (= e!22810 e!22820)))

(declare-fun res!29450 () Bool)

(assert (=> b!34427 (=> res!29450 e!22820)))

(assert (=> b!34427 (= res!29450 (not (= (head!267 (byteArrayBitContentToList!0 (_2!1822 lt!50794) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!50790)))))

(assert (=> b!34427 (= lt!50790 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!34428 () Bool)

(declare-fun res!29458 () Bool)

(assert (=> b!34428 (=> res!29458 e!22822)))

(assert (=> b!34428 (= res!29458 (not (invariant!0 (currentBit!2532 (_2!1822 lt!50794)) (currentByte!2537 (_2!1822 lt!50794)) (size!836 (buf!1164 (_2!1822 lt!50794))))))))

(declare-fun res!29452 () Bool)

(assert (=> start!7072 (=> (not res!29452) (not e!22819))))

(assert (=> start!7072 (= res!29452 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!836 srcBuffer!2))))))))

(assert (=> start!7072 e!22819))

(assert (=> start!7072 true))

(declare-fun array_inv!782 (array!1885) Bool)

(assert (=> start!7072 (array_inv!782 srcBuffer!2)))

(declare-fun e!22811 () Bool)

(declare-fun inv!12 (BitStream!1458) Bool)

(assert (=> start!7072 (and (inv!12 thiss!1379) e!22811)))

(declare-fun b!34429 () Bool)

(assert (=> b!34429 (= e!22811 (array_inv!782 (buf!1164 thiss!1379)))))

(assert (= (and start!7072 res!29452) b!34424))

(assert (= (and b!34424 res!29459) b!34425))

(assert (= (and b!34425 (not res!29449)) b!34421))

(assert (= (and b!34421 (not res!29460)) b!34418))

(assert (= (and b!34418 res!29457) b!34414))

(assert (= (and b!34418 (not res!29462)) b!34415))

(assert (= (and b!34415 (not res!29455)) b!34428))

(assert (= (and b!34428 (not res!29458)) b!34420))

(assert (= (and b!34420 (not res!29456)) b!34419))

(assert (= (and b!34419 (not res!29451)) b!34410))

(assert (= (and b!34410 (not res!29465)) b!34413))

(assert (= (and b!34413 (not res!29454)) b!34426))

(assert (= (and b!34426 (not res!29464)) b!34417))

(assert (= (and b!34417 (not res!29453)) b!34416))

(assert (= (and b!34416 (not res!29461)) b!34412))

(assert (= (and b!34412 (not res!29448)) b!34411))

(assert (= (and b!34411 (not res!29463)) b!34427))

(assert (= (and b!34427 (not res!29450)) b!34422))

(assert (= (and b!34422 (not res!29466)) b!34423))

(assert (= start!7072 b!34429))

(declare-fun m!51303 () Bool)

(assert (=> b!34425 m!51303))

(declare-fun m!51305 () Bool)

(assert (=> b!34425 m!51305))

(declare-fun m!51307 () Bool)

(assert (=> b!34425 m!51307))

(declare-fun m!51309 () Bool)

(assert (=> b!34429 m!51309))

(declare-fun m!51311 () Bool)

(assert (=> b!34416 m!51311))

(declare-fun m!51313 () Bool)

(assert (=> b!34416 m!51313))

(declare-fun m!51315 () Bool)

(assert (=> b!34414 m!51315))

(assert (=> b!34414 m!51315))

(declare-fun m!51317 () Bool)

(assert (=> b!34414 m!51317))

(declare-fun m!51319 () Bool)

(assert (=> b!34414 m!51319))

(assert (=> b!34414 m!51319))

(declare-fun m!51321 () Bool)

(assert (=> b!34414 m!51321))

(declare-fun m!51323 () Bool)

(assert (=> b!34411 m!51323))

(declare-fun m!51325 () Bool)

(assert (=> b!34421 m!51325))

(declare-fun m!51327 () Bool)

(assert (=> b!34421 m!51327))

(declare-fun m!51329 () Bool)

(assert (=> b!34421 m!51329))

(declare-fun m!51331 () Bool)

(assert (=> b!34421 m!51331))

(assert (=> b!34421 m!51327))

(declare-fun m!51333 () Bool)

(assert (=> b!34421 m!51333))

(declare-fun m!51335 () Bool)

(assert (=> b!34417 m!51335))

(declare-fun m!51337 () Bool)

(assert (=> b!34419 m!51337))

(declare-fun m!51339 () Bool)

(assert (=> b!34413 m!51339))

(declare-fun m!51341 () Bool)

(assert (=> b!34418 m!51341))

(declare-fun m!51343 () Bool)

(assert (=> b!34418 m!51343))

(declare-fun m!51345 () Bool)

(assert (=> b!34418 m!51345))

(declare-fun m!51347 () Bool)

(assert (=> b!34418 m!51347))

(declare-fun m!51349 () Bool)

(assert (=> b!34418 m!51349))

(declare-fun m!51351 () Bool)

(assert (=> b!34418 m!51351))

(declare-fun m!51353 () Bool)

(assert (=> b!34418 m!51353))

(declare-fun m!51355 () Bool)

(assert (=> b!34426 m!51355))

(declare-fun m!51357 () Bool)

(assert (=> b!34426 m!51357))

(declare-fun m!51359 () Bool)

(assert (=> b!34426 m!51359))

(declare-fun m!51361 () Bool)

(assert (=> b!34426 m!51361))

(declare-fun m!51363 () Bool)

(assert (=> b!34426 m!51363))

(declare-fun m!51365 () Bool)

(assert (=> b!34426 m!51365))

(declare-fun m!51367 () Bool)

(assert (=> b!34426 m!51367))

(declare-fun m!51369 () Bool)

(assert (=> b!34426 m!51369))

(declare-fun m!51371 () Bool)

(assert (=> b!34424 m!51371))

(declare-fun m!51373 () Bool)

(assert (=> b!34422 m!51373))

(declare-fun m!51375 () Bool)

(assert (=> b!34423 m!51375))

(declare-fun m!51377 () Bool)

(assert (=> b!34423 m!51377))

(declare-fun m!51379 () Bool)

(assert (=> b!34415 m!51379))

(declare-fun m!51381 () Bool)

(assert (=> b!34428 m!51381))

(declare-fun m!51383 () Bool)

(assert (=> b!34412 m!51383))

(declare-fun m!51385 () Bool)

(assert (=> b!34412 m!51385))

(declare-fun m!51387 () Bool)

(assert (=> start!7072 m!51387))

(declare-fun m!51389 () Bool)

(assert (=> start!7072 m!51389))

(declare-fun m!51391 () Bool)

(assert (=> b!34427 m!51391))

(assert (=> b!34427 m!51391))

(declare-fun m!51393 () Bool)

(assert (=> b!34427 m!51393))

(declare-fun m!51395 () Bool)

(assert (=> b!34427 m!51395))

(declare-fun m!51397 () Bool)

(assert (=> b!34410 m!51397))

(check-sat (not b!34423) (not b!34419) (not b!34416) (not b!34413) (not b!34422) (not b!34429) (not b!34418) (not b!34426) (not b!34415) (not b!34425) (not b!34417) (not b!34412) (not start!7072) (not b!34424) (not b!34428) (not b!34411) (not b!34421) (not b!34410) (not b!34427) (not b!34414))
(check-sat)
(get-model)

(declare-fun d!9878 () Bool)

(declare-fun e!22870 () Bool)

(assert (=> d!9878 e!22870))

(declare-fun res!29529 () Bool)

(assert (=> d!9878 (=> (not res!29529) (not e!22870))))

(declare-fun lt!50889 () (_ BitVec 64))

(declare-fun lt!50887 () (_ BitVec 64))

(declare-fun lt!50885 () (_ BitVec 64))

(assert (=> d!9878 (= res!29529 (= lt!50885 (bvsub lt!50887 lt!50889)))))

(assert (=> d!9878 (or (= (bvand lt!50887 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!50889 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!50887 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!50887 lt!50889) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!9878 (= lt!50889 (remainingBits!0 ((_ sign_extend 32) (size!836 (buf!1164 (_2!1822 lt!50802)))) ((_ sign_extend 32) (currentByte!2537 (_2!1822 lt!50802))) ((_ sign_extend 32) (currentBit!2532 (_2!1822 lt!50802)))))))

(declare-fun lt!50888 () (_ BitVec 64))

(declare-fun lt!50890 () (_ BitVec 64))

(assert (=> d!9878 (= lt!50887 (bvmul lt!50888 lt!50890))))

(assert (=> d!9878 (or (= lt!50888 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!50890 (bvsdiv (bvmul lt!50888 lt!50890) lt!50888)))))

(assert (=> d!9878 (= lt!50890 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!9878 (= lt!50888 ((_ sign_extend 32) (size!836 (buf!1164 (_2!1822 lt!50802)))))))

(assert (=> d!9878 (= lt!50885 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2537 (_2!1822 lt!50802))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2532 (_2!1822 lt!50802)))))))

(assert (=> d!9878 (invariant!0 (currentBit!2532 (_2!1822 lt!50802)) (currentByte!2537 (_2!1822 lt!50802)) (size!836 (buf!1164 (_2!1822 lt!50802))))))

(assert (=> d!9878 (= (bitIndex!0 (size!836 (buf!1164 (_2!1822 lt!50802))) (currentByte!2537 (_2!1822 lt!50802)) (currentBit!2532 (_2!1822 lt!50802))) lt!50885)))

(declare-fun b!34494 () Bool)

(declare-fun res!29528 () Bool)

(assert (=> b!34494 (=> (not res!29528) (not e!22870))))

(assert (=> b!34494 (= res!29528 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!50885))))

(declare-fun b!34495 () Bool)

(declare-fun lt!50886 () (_ BitVec 64))

(assert (=> b!34495 (= e!22870 (bvsle lt!50885 (bvmul lt!50886 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!34495 (or (= lt!50886 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!50886 #b0000000000000000000000000000000000000000000000000000000000001000) lt!50886)))))

(assert (=> b!34495 (= lt!50886 ((_ sign_extend 32) (size!836 (buf!1164 (_2!1822 lt!50802)))))))

(assert (= (and d!9878 res!29529) b!34494))

(assert (= (and b!34494 res!29528) b!34495))

(declare-fun m!51495 () Bool)

(assert (=> d!9878 m!51495))

(assert (=> d!9878 m!51397))

(assert (=> b!34419 d!9878))

(declare-fun d!9880 () Bool)

(assert (=> d!9880 (= (invariant!0 (currentBit!2532 (_2!1822 lt!50802)) (currentByte!2537 (_2!1822 lt!50802)) (size!836 (buf!1164 (_2!1822 lt!50802)))) (and (bvsge (currentBit!2532 (_2!1822 lt!50802)) #b00000000000000000000000000000000) (bvslt (currentBit!2532 (_2!1822 lt!50802)) #b00000000000000000000000000001000) (bvsge (currentByte!2537 (_2!1822 lt!50802)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2537 (_2!1822 lt!50802)) (size!836 (buf!1164 (_2!1822 lt!50802)))) (and (= (currentBit!2532 (_2!1822 lt!50802)) #b00000000000000000000000000000000) (= (currentByte!2537 (_2!1822 lt!50802)) (size!836 (buf!1164 (_2!1822 lt!50802))))))))))

(assert (=> b!34410 d!9880))

(declare-fun d!9882 () Bool)

(declare-fun res!29536 () Bool)

(declare-fun e!22876 () Bool)

(assert (=> d!9882 (=> (not res!29536) (not e!22876))))

(assert (=> d!9882 (= res!29536 (= (size!836 (buf!1164 thiss!1379)) (size!836 (buf!1164 (_2!1822 lt!50802)))))))

(assert (=> d!9882 (= (isPrefixOf!0 thiss!1379 (_2!1822 lt!50802)) e!22876)))

(declare-fun b!34502 () Bool)

(declare-fun res!29537 () Bool)

(assert (=> b!34502 (=> (not res!29537) (not e!22876))))

(assert (=> b!34502 (= res!29537 (bvsle (bitIndex!0 (size!836 (buf!1164 thiss!1379)) (currentByte!2537 thiss!1379) (currentBit!2532 thiss!1379)) (bitIndex!0 (size!836 (buf!1164 (_2!1822 lt!50802))) (currentByte!2537 (_2!1822 lt!50802)) (currentBit!2532 (_2!1822 lt!50802)))))))

(declare-fun b!34503 () Bool)

(declare-fun e!22875 () Bool)

(assert (=> b!34503 (= e!22876 e!22875)))

(declare-fun res!29538 () Bool)

(assert (=> b!34503 (=> res!29538 e!22875)))

(assert (=> b!34503 (= res!29538 (= (size!836 (buf!1164 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!34504 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1885 array!1885 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!34504 (= e!22875 (arrayBitRangesEq!0 (buf!1164 thiss!1379) (buf!1164 (_2!1822 lt!50802)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!836 (buf!1164 thiss!1379)) (currentByte!2537 thiss!1379) (currentBit!2532 thiss!1379))))))

(assert (= (and d!9882 res!29536) b!34502))

(assert (= (and b!34502 res!29537) b!34503))

(assert (= (and b!34503 (not res!29538)) b!34504))

(assert (=> b!34502 m!51307))

(assert (=> b!34502 m!51337))

(assert (=> b!34504 m!51307))

(assert (=> b!34504 m!51307))

(declare-fun m!51497 () Bool)

(assert (=> b!34504 m!51497))

(assert (=> b!34421 d!9882))

(declare-fun d!9884 () Bool)

(assert (=> d!9884 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!836 (buf!1164 (_2!1822 lt!50802)))) ((_ sign_extend 32) (currentByte!2537 (_2!1822 lt!50802))) ((_ sign_extend 32) (currentBit!2532 (_2!1822 lt!50802))) lt!50786) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!836 (buf!1164 (_2!1822 lt!50802)))) ((_ sign_extend 32) (currentByte!2537 (_2!1822 lt!50802))) ((_ sign_extend 32) (currentBit!2532 (_2!1822 lt!50802)))) lt!50786))))

(declare-fun bs!2699 () Bool)

(assert (= bs!2699 d!9884))

(assert (=> bs!2699 m!51495))

(assert (=> b!34421 d!9884))

(declare-fun d!9886 () Bool)

(declare-fun e!22879 () Bool)

(assert (=> d!9886 e!22879))

(declare-fun res!29541 () Bool)

(assert (=> d!9886 (=> (not res!29541) (not e!22879))))

(assert (=> d!9886 (= res!29541 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!50893 () Unit!2551)

(declare-fun choose!27 (BitStream!1458 BitStream!1458 (_ BitVec 64) (_ BitVec 64)) Unit!2551)

(assert (=> d!9886 (= lt!50893 (choose!27 thiss!1379 (_2!1822 lt!50802) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!9886 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!9886 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1822 lt!50802) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!50893)))

(declare-fun b!34507 () Bool)

(assert (=> b!34507 (= e!22879 (validate_offset_bits!1 ((_ sign_extend 32) (size!836 (buf!1164 (_2!1822 lt!50802)))) ((_ sign_extend 32) (currentByte!2537 (_2!1822 lt!50802))) ((_ sign_extend 32) (currentBit!2532 (_2!1822 lt!50802))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!9886 res!29541) b!34507))

(declare-fun m!51499 () Bool)

(assert (=> d!9886 m!51499))

(declare-fun m!51501 () Bool)

(assert (=> b!34507 m!51501))

(assert (=> b!34421 d!9886))

(declare-fun b!34525 () Bool)

(declare-fun res!29560 () Bool)

(declare-fun e!22889 () Bool)

(assert (=> b!34525 (=> (not res!29560) (not e!22889))))

(declare-fun lt!50926 () tuple2!3470)

(assert (=> b!34525 (= res!29560 (isPrefixOf!0 thiss!1379 (_2!1822 lt!50926)))))

(declare-fun b!34526 () Bool)

(declare-fun e!22888 () Bool)

(declare-datatypes ((tuple2!3478 0))(
  ( (tuple2!3479 (_1!1826 BitStream!1458) (_2!1826 Bool)) )
))
(declare-fun lt!50918 () tuple2!3478)

(assert (=> b!34526 (= e!22888 (= (bitIndex!0 (size!836 (buf!1164 (_1!1826 lt!50918))) (currentByte!2537 (_1!1826 lt!50918)) (currentBit!2532 (_1!1826 lt!50918))) (bitIndex!0 (size!836 (buf!1164 (_2!1822 lt!50926))) (currentByte!2537 (_2!1822 lt!50926)) (currentBit!2532 (_2!1822 lt!50926)))))))

(declare-fun b!34527 () Bool)

(declare-fun e!22890 () Bool)

(declare-fun e!22891 () Bool)

(assert (=> b!34527 (= e!22890 e!22891)))

(declare-fun res!29561 () Bool)

(assert (=> b!34527 (=> (not res!29561) (not e!22891))))

(declare-fun lt!50922 () (_ BitVec 8))

(declare-fun lt!50925 () tuple2!3470)

(declare-fun lt!50924 () tuple2!3478)

(assert (=> b!34527 (= res!29561 (and (= (_2!1826 lt!50924) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1314 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!50922)) #b00000000000000000000000000000000))) (= (_1!1826 lt!50924) (_2!1822 lt!50925))))))

(declare-datatypes ((tuple2!3480 0))(
  ( (tuple2!3481 (_1!1827 array!1885) (_2!1827 BitStream!1458)) )
))
(declare-fun lt!50923 () tuple2!3480)

(declare-fun lt!50929 () BitStream!1458)

(declare-fun readBits!0 (BitStream!1458 (_ BitVec 64)) tuple2!3480)

(assert (=> b!34527 (= lt!50923 (readBits!0 lt!50929 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1458) tuple2!3478)

(assert (=> b!34527 (= lt!50924 (readBitPure!0 lt!50929))))

(declare-fun readerFrom!0 (BitStream!1458 (_ BitVec 32) (_ BitVec 32)) BitStream!1458)

(assert (=> b!34527 (= lt!50929 (readerFrom!0 (_2!1822 lt!50925) (currentBit!2532 thiss!1379) (currentByte!2537 thiss!1379)))))

(declare-fun b!34528 () Bool)

(declare-fun res!29559 () Bool)

(assert (=> b!34528 (=> (not res!29559) (not e!22890))))

(declare-fun lt!50927 () (_ BitVec 64))

(declare-fun lt!50920 () (_ BitVec 64))

(assert (=> b!34528 (= res!29559 (= (bitIndex!0 (size!836 (buf!1164 (_2!1822 lt!50925))) (currentByte!2537 (_2!1822 lt!50925)) (currentBit!2532 (_2!1822 lt!50925))) (bvadd lt!50927 lt!50920)))))

(assert (=> b!34528 (or (not (= (bvand lt!50927 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!50920 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!50927 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!50927 lt!50920) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!34528 (= lt!50920 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!34528 (= lt!50927 (bitIndex!0 (size!836 (buf!1164 thiss!1379)) (currentByte!2537 thiss!1379) (currentBit!2532 thiss!1379)))))

(declare-fun b!34530 () Bool)

(declare-fun res!29565 () Bool)

(assert (=> b!34530 (=> (not res!29565) (not e!22889))))

(assert (=> b!34530 (= res!29565 (= (bitIndex!0 (size!836 (buf!1164 (_2!1822 lt!50926))) (currentByte!2537 (_2!1822 lt!50926)) (currentBit!2532 (_2!1822 lt!50926))) (bvadd (bitIndex!0 (size!836 (buf!1164 thiss!1379)) (currentByte!2537 thiss!1379) (currentBit!2532 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!34531 () Bool)

(declare-fun res!29558 () Bool)

(assert (=> b!34531 (=> (not res!29558) (not e!22890))))

(assert (=> b!34531 (= res!29558 (isPrefixOf!0 thiss!1379 (_2!1822 lt!50925)))))

(declare-fun b!34532 () Bool)

(assert (=> b!34532 (= e!22891 (= (bitIndex!0 (size!836 (buf!1164 (_1!1826 lt!50924))) (currentByte!2537 (_1!1826 lt!50924)) (currentBit!2532 (_1!1826 lt!50924))) (bitIndex!0 (size!836 (buf!1164 (_2!1822 lt!50925))) (currentByte!2537 (_2!1822 lt!50925)) (currentBit!2532 (_2!1822 lt!50925)))))))

(declare-fun d!9888 () Bool)

(assert (=> d!9888 e!22890))

(declare-fun res!29563 () Bool)

(assert (=> d!9888 (=> (not res!29563) (not e!22890))))

(assert (=> d!9888 (= res!29563 (= (size!836 (buf!1164 (_2!1822 lt!50925))) (size!836 (buf!1164 thiss!1379))))))

(declare-fun lt!50928 () array!1885)

(assert (=> d!9888 (= lt!50922 (select (arr!1314 lt!50928) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!9888 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!836 lt!50928)))))

(assert (=> d!9888 (= lt!50928 (array!1886 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!50919 () tuple2!3470)

(assert (=> d!9888 (= lt!50925 (tuple2!3471 (_1!1822 lt!50919) (_2!1822 lt!50919)))))

(assert (=> d!9888 (= lt!50919 lt!50926)))

(assert (=> d!9888 e!22889))

(declare-fun res!29564 () Bool)

(assert (=> d!9888 (=> (not res!29564) (not e!22889))))

(assert (=> d!9888 (= res!29564 (= (size!836 (buf!1164 thiss!1379)) (size!836 (buf!1164 (_2!1822 lt!50926)))))))

(declare-fun lt!50921 () Bool)

(declare-fun appendBit!0 (BitStream!1458 Bool) tuple2!3470)

(assert (=> d!9888 (= lt!50926 (appendBit!0 thiss!1379 lt!50921))))

(assert (=> d!9888 (= lt!50921 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1314 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!9888 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!9888 (= (appendBitFromByte!0 thiss!1379 (select (arr!1314 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!50925)))

(declare-fun b!34529 () Bool)

(assert (=> b!34529 (= e!22889 e!22888)))

(declare-fun res!29562 () Bool)

(assert (=> b!34529 (=> (not res!29562) (not e!22888))))

(assert (=> b!34529 (= res!29562 (and (= (_2!1826 lt!50918) lt!50921) (= (_1!1826 lt!50918) (_2!1822 lt!50926))))))

(assert (=> b!34529 (= lt!50918 (readBitPure!0 (readerFrom!0 (_2!1822 lt!50926) (currentBit!2532 thiss!1379) (currentByte!2537 thiss!1379))))))

(assert (= (and d!9888 res!29564) b!34530))

(assert (= (and b!34530 res!29565) b!34525))

(assert (= (and b!34525 res!29560) b!34529))

(assert (= (and b!34529 res!29562) b!34526))

(assert (= (and d!9888 res!29563) b!34528))

(assert (= (and b!34528 res!29559) b!34531))

(assert (= (and b!34531 res!29558) b!34527))

(assert (= (and b!34527 res!29561) b!34532))

(declare-fun m!51503 () Bool)

(assert (=> b!34532 m!51503))

(declare-fun m!51505 () Bool)

(assert (=> b!34532 m!51505))

(declare-fun m!51507 () Bool)

(assert (=> b!34527 m!51507))

(declare-fun m!51509 () Bool)

(assert (=> b!34527 m!51509))

(declare-fun m!51511 () Bool)

(assert (=> b!34527 m!51511))

(declare-fun m!51513 () Bool)

(assert (=> b!34529 m!51513))

(assert (=> b!34529 m!51513))

(declare-fun m!51515 () Bool)

(assert (=> b!34529 m!51515))

(declare-fun m!51517 () Bool)

(assert (=> b!34526 m!51517))

(declare-fun m!51519 () Bool)

(assert (=> b!34526 m!51519))

(declare-fun m!51521 () Bool)

(assert (=> b!34525 m!51521))

(declare-fun m!51523 () Bool)

(assert (=> b!34531 m!51523))

(declare-fun m!51525 () Bool)

(assert (=> d!9888 m!51525))

(declare-fun m!51527 () Bool)

(assert (=> d!9888 m!51527))

(declare-fun m!51529 () Bool)

(assert (=> d!9888 m!51529))

(assert (=> b!34528 m!51505))

(assert (=> b!34528 m!51307))

(assert (=> b!34530 m!51519))

(assert (=> b!34530 m!51307))

(assert (=> b!34421 d!9888))

(declare-fun d!9890 () Bool)

(assert (=> d!9890 (= (head!267 (byteArrayBitContentToList!0 (_2!1822 lt!50794) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!545 (byteArrayBitContentToList!0 (_2!1822 lt!50794) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!34427 d!9890))

(declare-fun d!9892 () Bool)

(declare-fun c!2292 () Bool)

(assert (=> d!9892 (= c!2292 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!22894 () List!430)

(assert (=> d!9892 (= (byteArrayBitContentToList!0 (_2!1822 lt!50794) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!22894)))

(declare-fun b!34537 () Bool)

(assert (=> b!34537 (= e!22894 Nil!427)))

(declare-fun b!34538 () Bool)

(assert (=> b!34538 (= e!22894 (Cons!426 (not (= (bvand ((_ sign_extend 24) (select (arr!1314 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1822 lt!50794) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!9892 c!2292) b!34537))

(assert (= (and d!9892 (not c!2292)) b!34538))

(assert (=> b!34538 m!51327))

(assert (=> b!34538 m!51529))

(declare-fun m!51531 () Bool)

(assert (=> b!34538 m!51531))

(assert (=> b!34427 d!9892))

(declare-fun d!9894 () Bool)

(assert (=> d!9894 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1314 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2700 () Bool)

(assert (= bs!2700 d!9894))

(assert (=> bs!2700 m!51327))

(assert (=> bs!2700 m!51529))

(assert (=> b!34427 d!9894))

(declare-fun d!9896 () Bool)

(declare-fun size!838 (List!430) Int)

(assert (=> d!9896 (= (length!156 lt!50799) (size!838 lt!50799))))

(declare-fun bs!2701 () Bool)

(assert (= bs!2701 d!9896))

(declare-fun m!51533 () Bool)

(assert (=> bs!2701 m!51533))

(assert (=> b!34417 d!9896))

(declare-fun d!9898 () Bool)

(assert (=> d!9898 (= (invariant!0 (currentBit!2532 (_2!1822 lt!50794)) (currentByte!2537 (_2!1822 lt!50794)) (size!836 (buf!1164 (_2!1822 lt!50794)))) (and (bvsge (currentBit!2532 (_2!1822 lt!50794)) #b00000000000000000000000000000000) (bvslt (currentBit!2532 (_2!1822 lt!50794)) #b00000000000000000000000000001000) (bvsge (currentByte!2537 (_2!1822 lt!50794)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2537 (_2!1822 lt!50794)) (size!836 (buf!1164 (_2!1822 lt!50794)))) (and (= (currentBit!2532 (_2!1822 lt!50794)) #b00000000000000000000000000000000) (= (currentByte!2537 (_2!1822 lt!50794)) (size!836 (buf!1164 (_2!1822 lt!50794))))))))))

(assert (=> b!34428 d!9898))

(declare-fun lt!50972 () (_ BitVec 64))

(declare-fun e!22899 () Bool)

(declare-fun lt!50983 () (_ BitVec 64))

(declare-fun lt!50970 () tuple2!3472)

(declare-fun b!34549 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!1458 (_ BitVec 64)) BitStream!1458)

(assert (=> b!34549 (= e!22899 (= (_1!1823 lt!50970) (withMovedBitIndex!0 (_2!1823 lt!50970) (bvsub lt!50972 lt!50983))))))

(assert (=> b!34549 (or (= (bvand lt!50972 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!50983 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!50972 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!50972 lt!50983) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!34549 (= lt!50983 (bitIndex!0 (size!836 (buf!1164 (_2!1822 lt!50802))) (currentByte!2537 (_2!1822 lt!50802)) (currentBit!2532 (_2!1822 lt!50802))))))

(assert (=> b!34549 (= lt!50972 (bitIndex!0 (size!836 (buf!1164 thiss!1379)) (currentByte!2537 thiss!1379) (currentBit!2532 thiss!1379)))))

(declare-fun b!34550 () Bool)

(declare-fun res!29574 () Bool)

(assert (=> b!34550 (=> (not res!29574) (not e!22899))))

(assert (=> b!34550 (= res!29574 (isPrefixOf!0 (_2!1823 lt!50970) (_2!1822 lt!50802)))))

(declare-fun b!34551 () Bool)

(declare-fun e!22900 () Unit!2551)

(declare-fun lt!50989 () Unit!2551)

(assert (=> b!34551 (= e!22900 lt!50989)))

(declare-fun lt!50978 () (_ BitVec 64))

(assert (=> b!34551 (= lt!50978 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!50980 () (_ BitVec 64))

(assert (=> b!34551 (= lt!50980 (bitIndex!0 (size!836 (buf!1164 thiss!1379)) (currentByte!2537 thiss!1379) (currentBit!2532 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1885 array!1885 (_ BitVec 64) (_ BitVec 64)) Unit!2551)

(assert (=> b!34551 (= lt!50989 (arrayBitRangesEqSymmetric!0 (buf!1164 thiss!1379) (buf!1164 (_2!1822 lt!50802)) lt!50978 lt!50980))))

(assert (=> b!34551 (arrayBitRangesEq!0 (buf!1164 (_2!1822 lt!50802)) (buf!1164 thiss!1379) lt!50978 lt!50980)))

(declare-fun d!9900 () Bool)

(assert (=> d!9900 e!22899))

(declare-fun res!29573 () Bool)

(assert (=> d!9900 (=> (not res!29573) (not e!22899))))

(assert (=> d!9900 (= res!29573 (isPrefixOf!0 (_1!1823 lt!50970) (_2!1823 lt!50970)))))

(declare-fun lt!50977 () BitStream!1458)

(assert (=> d!9900 (= lt!50970 (tuple2!3473 lt!50977 (_2!1822 lt!50802)))))

(declare-fun lt!50985 () Unit!2551)

(declare-fun lt!50974 () Unit!2551)

(assert (=> d!9900 (= lt!50985 lt!50974)))

(assert (=> d!9900 (isPrefixOf!0 lt!50977 (_2!1822 lt!50802))))

(assert (=> d!9900 (= lt!50974 (lemmaIsPrefixTransitive!0 lt!50977 (_2!1822 lt!50802) (_2!1822 lt!50802)))))

(declare-fun lt!50973 () Unit!2551)

(declare-fun lt!50975 () Unit!2551)

(assert (=> d!9900 (= lt!50973 lt!50975)))

(assert (=> d!9900 (isPrefixOf!0 lt!50977 (_2!1822 lt!50802))))

(assert (=> d!9900 (= lt!50975 (lemmaIsPrefixTransitive!0 lt!50977 thiss!1379 (_2!1822 lt!50802)))))

(declare-fun lt!50987 () Unit!2551)

(assert (=> d!9900 (= lt!50987 e!22900)))

(declare-fun c!2295 () Bool)

(assert (=> d!9900 (= c!2295 (not (= (size!836 (buf!1164 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!50982 () Unit!2551)

(declare-fun lt!50981 () Unit!2551)

(assert (=> d!9900 (= lt!50982 lt!50981)))

(assert (=> d!9900 (isPrefixOf!0 (_2!1822 lt!50802) (_2!1822 lt!50802))))

(assert (=> d!9900 (= lt!50981 (lemmaIsPrefixRefl!0 (_2!1822 lt!50802)))))

(declare-fun lt!50979 () Unit!2551)

(declare-fun lt!50986 () Unit!2551)

(assert (=> d!9900 (= lt!50979 lt!50986)))

(assert (=> d!9900 (= lt!50986 (lemmaIsPrefixRefl!0 (_2!1822 lt!50802)))))

(declare-fun lt!50988 () Unit!2551)

(declare-fun lt!50984 () Unit!2551)

(assert (=> d!9900 (= lt!50988 lt!50984)))

(assert (=> d!9900 (isPrefixOf!0 lt!50977 lt!50977)))

(assert (=> d!9900 (= lt!50984 (lemmaIsPrefixRefl!0 lt!50977))))

(declare-fun lt!50971 () Unit!2551)

(declare-fun lt!50976 () Unit!2551)

(assert (=> d!9900 (= lt!50971 lt!50976)))

(assert (=> d!9900 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!9900 (= lt!50976 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!9900 (= lt!50977 (BitStream!1459 (buf!1164 (_2!1822 lt!50802)) (currentByte!2537 thiss!1379) (currentBit!2532 thiss!1379)))))

(assert (=> d!9900 (isPrefixOf!0 thiss!1379 (_2!1822 lt!50802))))

(assert (=> d!9900 (= (reader!0 thiss!1379 (_2!1822 lt!50802)) lt!50970)))

(declare-fun b!34552 () Bool)

(declare-fun res!29572 () Bool)

(assert (=> b!34552 (=> (not res!29572) (not e!22899))))

(assert (=> b!34552 (= res!29572 (isPrefixOf!0 (_1!1823 lt!50970) thiss!1379))))

(declare-fun b!34553 () Bool)

(declare-fun Unit!2555 () Unit!2551)

(assert (=> b!34553 (= e!22900 Unit!2555)))

(assert (= (and d!9900 c!2295) b!34551))

(assert (= (and d!9900 (not c!2295)) b!34553))

(assert (= (and d!9900 res!29573) b!34552))

(assert (= (and b!34552 res!29572) b!34550))

(assert (= (and b!34550 res!29574) b!34549))

(declare-fun m!51535 () Bool)

(assert (=> d!9900 m!51535))

(assert (=> d!9900 m!51325))

(declare-fun m!51537 () Bool)

(assert (=> d!9900 m!51537))

(assert (=> d!9900 m!51305))

(declare-fun m!51539 () Bool)

(assert (=> d!9900 m!51539))

(assert (=> d!9900 m!51303))

(declare-fun m!51541 () Bool)

(assert (=> d!9900 m!51541))

(declare-fun m!51543 () Bool)

(assert (=> d!9900 m!51543))

(declare-fun m!51545 () Bool)

(assert (=> d!9900 m!51545))

(declare-fun m!51547 () Bool)

(assert (=> d!9900 m!51547))

(declare-fun m!51549 () Bool)

(assert (=> d!9900 m!51549))

(assert (=> b!34551 m!51307))

(declare-fun m!51551 () Bool)

(assert (=> b!34551 m!51551))

(declare-fun m!51553 () Bool)

(assert (=> b!34551 m!51553))

(declare-fun m!51555 () Bool)

(assert (=> b!34549 m!51555))

(assert (=> b!34549 m!51337))

(assert (=> b!34549 m!51307))

(declare-fun m!51557 () Bool)

(assert (=> b!34552 m!51557))

(declare-fun m!51559 () Bool)

(assert (=> b!34550 m!51559))

(assert (=> b!34418 d!9900))

(declare-fun d!9902 () Bool)

(declare-fun res!29575 () Bool)

(declare-fun e!22902 () Bool)

(assert (=> d!9902 (=> (not res!29575) (not e!22902))))

(assert (=> d!9902 (= res!29575 (= (size!836 (buf!1164 (_2!1822 lt!50802))) (size!836 (buf!1164 (_2!1822 lt!50794)))))))

(assert (=> d!9902 (= (isPrefixOf!0 (_2!1822 lt!50802) (_2!1822 lt!50794)) e!22902)))

(declare-fun b!34554 () Bool)

(declare-fun res!29576 () Bool)

(assert (=> b!34554 (=> (not res!29576) (not e!22902))))

(assert (=> b!34554 (= res!29576 (bvsle (bitIndex!0 (size!836 (buf!1164 (_2!1822 lt!50802))) (currentByte!2537 (_2!1822 lt!50802)) (currentBit!2532 (_2!1822 lt!50802))) (bitIndex!0 (size!836 (buf!1164 (_2!1822 lt!50794))) (currentByte!2537 (_2!1822 lt!50794)) (currentBit!2532 (_2!1822 lt!50794)))))))

(declare-fun b!34555 () Bool)

(declare-fun e!22901 () Bool)

(assert (=> b!34555 (= e!22902 e!22901)))

(declare-fun res!29577 () Bool)

(assert (=> b!34555 (=> res!29577 e!22901)))

(assert (=> b!34555 (= res!29577 (= (size!836 (buf!1164 (_2!1822 lt!50802))) #b00000000000000000000000000000000))))

(declare-fun b!34556 () Bool)

(assert (=> b!34556 (= e!22901 (arrayBitRangesEq!0 (buf!1164 (_2!1822 lt!50802)) (buf!1164 (_2!1822 lt!50794)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!836 (buf!1164 (_2!1822 lt!50802))) (currentByte!2537 (_2!1822 lt!50802)) (currentBit!2532 (_2!1822 lt!50802)))))))

(assert (= (and d!9902 res!29575) b!34554))

(assert (= (and b!34554 res!29576) b!34555))

(assert (= (and b!34555 (not res!29577)) b!34556))

(assert (=> b!34554 m!51337))

(assert (=> b!34554 m!51379))

(assert (=> b!34556 m!51337))

(assert (=> b!34556 m!51337))

(declare-fun m!51561 () Bool)

(assert (=> b!34556 m!51561))

(assert (=> b!34418 d!9902))

(declare-fun d!9904 () Bool)

(assert (=> d!9904 (isPrefixOf!0 thiss!1379 (_2!1822 lt!50794))))

(declare-fun lt!50992 () Unit!2551)

(declare-fun choose!30 (BitStream!1458 BitStream!1458 BitStream!1458) Unit!2551)

(assert (=> d!9904 (= lt!50992 (choose!30 thiss!1379 (_2!1822 lt!50802) (_2!1822 lt!50794)))))

(assert (=> d!9904 (isPrefixOf!0 thiss!1379 (_2!1822 lt!50802))))

(assert (=> d!9904 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1822 lt!50802) (_2!1822 lt!50794)) lt!50992)))

(declare-fun bs!2702 () Bool)

(assert (= bs!2702 d!9904))

(assert (=> bs!2702 m!51341))

(declare-fun m!51563 () Bool)

(assert (=> bs!2702 m!51563))

(assert (=> bs!2702 m!51325))

(assert (=> b!34418 d!9904))

(declare-fun d!9906 () Bool)

(assert (=> d!9906 (validate_offset_bits!1 ((_ sign_extend 32) (size!836 (buf!1164 (_2!1822 lt!50802)))) ((_ sign_extend 32) (currentByte!2537 thiss!1379)) ((_ sign_extend 32) (currentBit!2532 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!50995 () Unit!2551)

(declare-fun choose!9 (BitStream!1458 array!1885 (_ BitVec 64) BitStream!1458) Unit!2551)

(assert (=> d!9906 (= lt!50995 (choose!9 thiss!1379 (buf!1164 (_2!1822 lt!50802)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1459 (buf!1164 (_2!1822 lt!50802)) (currentByte!2537 thiss!1379) (currentBit!2532 thiss!1379))))))

(assert (=> d!9906 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1164 (_2!1822 lt!50802)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!50995)))

(declare-fun bs!2703 () Bool)

(assert (= bs!2703 d!9906))

(assert (=> bs!2703 m!51347))

(declare-fun m!51565 () Bool)

(assert (=> bs!2703 m!51565))

(assert (=> b!34418 d!9906))

(declare-fun d!9908 () Bool)

(assert (=> d!9908 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!836 (buf!1164 (_2!1822 lt!50802)))) ((_ sign_extend 32) (currentByte!2537 thiss!1379)) ((_ sign_extend 32) (currentBit!2532 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!836 (buf!1164 (_2!1822 lt!50802)))) ((_ sign_extend 32) (currentByte!2537 thiss!1379)) ((_ sign_extend 32) (currentBit!2532 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2704 () Bool)

(assert (= bs!2704 d!9908))

(declare-fun m!51567 () Bool)

(assert (=> bs!2704 m!51567))

(assert (=> b!34418 d!9908))

(declare-fun d!9910 () Bool)

(declare-fun res!29578 () Bool)

(declare-fun e!22904 () Bool)

(assert (=> d!9910 (=> (not res!29578) (not e!22904))))

(assert (=> d!9910 (= res!29578 (= (size!836 (buf!1164 thiss!1379)) (size!836 (buf!1164 (_2!1822 lt!50794)))))))

(assert (=> d!9910 (= (isPrefixOf!0 thiss!1379 (_2!1822 lt!50794)) e!22904)))

(declare-fun b!34557 () Bool)

(declare-fun res!29579 () Bool)

(assert (=> b!34557 (=> (not res!29579) (not e!22904))))

(assert (=> b!34557 (= res!29579 (bvsle (bitIndex!0 (size!836 (buf!1164 thiss!1379)) (currentByte!2537 thiss!1379) (currentBit!2532 thiss!1379)) (bitIndex!0 (size!836 (buf!1164 (_2!1822 lt!50794))) (currentByte!2537 (_2!1822 lt!50794)) (currentBit!2532 (_2!1822 lt!50794)))))))

(declare-fun b!34558 () Bool)

(declare-fun e!22903 () Bool)

(assert (=> b!34558 (= e!22904 e!22903)))

(declare-fun res!29580 () Bool)

(assert (=> b!34558 (=> res!29580 e!22903)))

(assert (=> b!34558 (= res!29580 (= (size!836 (buf!1164 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!34559 () Bool)

(assert (=> b!34559 (= e!22903 (arrayBitRangesEq!0 (buf!1164 thiss!1379) (buf!1164 (_2!1822 lt!50794)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!836 (buf!1164 thiss!1379)) (currentByte!2537 thiss!1379) (currentBit!2532 thiss!1379))))))

(assert (= (and d!9910 res!29578) b!34557))

(assert (= (and b!34557 res!29579) b!34558))

(assert (= (and b!34558 (not res!29580)) b!34559))

(assert (=> b!34557 m!51307))

(assert (=> b!34557 m!51379))

(assert (=> b!34559 m!51307))

(assert (=> b!34559 m!51307))

(declare-fun m!51569 () Bool)

(assert (=> b!34559 m!51569))

(assert (=> b!34418 d!9910))

(declare-fun b!34671 () Bool)

(declare-fun e!22961 () tuple2!3470)

(declare-fun Unit!2556 () Unit!2551)

(assert (=> b!34671 (= e!22961 (tuple2!3471 Unit!2556 (_2!1822 lt!50802)))))

(assert (=> b!34671 (= (size!836 (buf!1164 (_2!1822 lt!50802))) (size!836 (buf!1164 (_2!1822 lt!50802))))))

(declare-fun lt!51308 () Unit!2551)

(declare-fun Unit!2557 () Unit!2551)

(assert (=> b!34671 (= lt!51308 Unit!2557)))

(declare-fun call!430 () tuple2!3472)

(declare-fun checkByteArrayBitContent!0 (BitStream!1458 array!1885 array!1885 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!34671 (checkByteArrayBitContent!0 (_2!1822 lt!50802) srcBuffer!2 (_1!1827 (readBits!0 (_1!1823 call!430) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun bm!427 () Bool)

(declare-fun c!2313 () Bool)

(declare-fun lt!51267 () tuple2!3470)

(assert (=> bm!427 (= call!430 (reader!0 (_2!1822 lt!50802) (ite c!2313 (_2!1822 lt!51267) (_2!1822 lt!50802))))))

(declare-fun b!34672 () Bool)

(declare-fun e!22960 () Bool)

(declare-fun lt!51295 () (_ BitVec 64))

(assert (=> b!34672 (= e!22960 (validate_offset_bits!1 ((_ sign_extend 32) (size!836 (buf!1164 (_2!1822 lt!50802)))) ((_ sign_extend 32) (currentByte!2537 (_2!1822 lt!50802))) ((_ sign_extend 32) (currentBit!2532 (_2!1822 lt!50802))) lt!51295))))

(declare-fun b!34673 () Bool)

(declare-fun res!29661 () Bool)

(declare-fun e!22962 () Bool)

(assert (=> b!34673 (=> (not res!29661) (not e!22962))))

(declare-fun lt!51282 () tuple2!3470)

(assert (=> b!34673 (= res!29661 (= (size!836 (buf!1164 (_2!1822 lt!50802))) (size!836 (buf!1164 (_2!1822 lt!51282)))))))

(declare-fun b!34674 () Bool)

(declare-fun res!29657 () Bool)

(assert (=> b!34674 (=> (not res!29657) (not e!22962))))

(assert (=> b!34674 (= res!29657 (invariant!0 (currentBit!2532 (_2!1822 lt!51282)) (currentByte!2537 (_2!1822 lt!51282)) (size!836 (buf!1164 (_2!1822 lt!51282)))))))

(declare-fun b!34675 () Bool)

(declare-fun res!29658 () Bool)

(assert (=> b!34675 (=> (not res!29658) (not e!22962))))

(assert (=> b!34675 (= res!29658 (isPrefixOf!0 (_2!1822 lt!50802) (_2!1822 lt!51282)))))

(declare-fun b!34676 () Bool)

(declare-fun lt!51307 () tuple2!3472)

(assert (=> b!34676 (= e!22962 (= (bitStreamReadBitsIntoList!0 (_2!1822 lt!51282) (_1!1823 lt!51307) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1822 lt!51282) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!34676 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!34676 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!51266 () Unit!2551)

(declare-fun lt!51304 () Unit!2551)

(assert (=> b!34676 (= lt!51266 lt!51304)))

(assert (=> b!34676 (validate_offset_bits!1 ((_ sign_extend 32) (size!836 (buf!1164 (_2!1822 lt!51282)))) ((_ sign_extend 32) (currentByte!2537 (_2!1822 lt!50802))) ((_ sign_extend 32) (currentBit!2532 (_2!1822 lt!50802))) lt!51295)))

(assert (=> b!34676 (= lt!51304 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1822 lt!50802) (buf!1164 (_2!1822 lt!51282)) lt!51295))))

(assert (=> b!34676 e!22960))

(declare-fun res!29659 () Bool)

(assert (=> b!34676 (=> (not res!29659) (not e!22960))))

(assert (=> b!34676 (= res!29659 (and (= (size!836 (buf!1164 (_2!1822 lt!50802))) (size!836 (buf!1164 (_2!1822 lt!51282)))) (bvsge lt!51295 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!34676 (= lt!51295 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!34676 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!34676 (= lt!51307 (reader!0 (_2!1822 lt!50802) (_2!1822 lt!51282)))))

(declare-fun d!9912 () Bool)

(assert (=> d!9912 e!22962))

(declare-fun res!29660 () Bool)

(assert (=> d!9912 (=> (not res!29660) (not e!22962))))

(declare-fun lt!51296 () (_ BitVec 64))

(assert (=> d!9912 (= res!29660 (= (bitIndex!0 (size!836 (buf!1164 (_2!1822 lt!51282))) (currentByte!2537 (_2!1822 lt!51282)) (currentBit!2532 (_2!1822 lt!51282))) (bvsub lt!51296 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!9912 (or (= (bvand lt!51296 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!51296 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!51296 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!51306 () (_ BitVec 64))

(assert (=> d!9912 (= lt!51296 (bvadd lt!51306 to!314))))

(assert (=> d!9912 (or (not (= (bvand lt!51306 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!51306 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!51306 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!9912 (= lt!51306 (bitIndex!0 (size!836 (buf!1164 (_2!1822 lt!50802))) (currentByte!2537 (_2!1822 lt!50802)) (currentBit!2532 (_2!1822 lt!50802))))))

(assert (=> d!9912 (= lt!51282 e!22961)))

(assert (=> d!9912 (= c!2313 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!51278 () Unit!2551)

(declare-fun lt!51300 () Unit!2551)

(assert (=> d!9912 (= lt!51278 lt!51300)))

(assert (=> d!9912 (isPrefixOf!0 (_2!1822 lt!50802) (_2!1822 lt!50802))))

(assert (=> d!9912 (= lt!51300 (lemmaIsPrefixRefl!0 (_2!1822 lt!50802)))))

(declare-fun lt!51298 () (_ BitVec 64))

(assert (=> d!9912 (= lt!51298 (bitIndex!0 (size!836 (buf!1164 (_2!1822 lt!50802))) (currentByte!2537 (_2!1822 lt!50802)) (currentBit!2532 (_2!1822 lt!50802))))))

(assert (=> d!9912 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9912 (= (appendBitsMSBFirstLoop!0 (_2!1822 lt!50802) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!51282)))

(declare-fun b!34677 () Bool)

(declare-fun res!29662 () Bool)

(assert (=> b!34677 (=> (not res!29662) (not e!22962))))

(assert (=> b!34677 (= res!29662 (= (size!836 (buf!1164 (_2!1822 lt!51282))) (size!836 (buf!1164 (_2!1822 lt!50802)))))))

(declare-fun b!34678 () Bool)

(declare-fun lt!51277 () tuple2!3470)

(declare-fun Unit!2558 () Unit!2551)

(assert (=> b!34678 (= e!22961 (tuple2!3471 Unit!2558 (_2!1822 lt!51277)))))

(assert (=> b!34678 (= lt!51267 (appendBitFromByte!0 (_2!1822 lt!50802) (select (arr!1314 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!51287 () (_ BitVec 64))

(assert (=> b!34678 (= lt!51287 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!51301 () (_ BitVec 64))

(assert (=> b!34678 (= lt!51301 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!51283 () Unit!2551)

(assert (=> b!34678 (= lt!51283 (validateOffsetBitsIneqLemma!0 (_2!1822 lt!50802) (_2!1822 lt!51267) lt!51287 lt!51301))))

(assert (=> b!34678 (validate_offset_bits!1 ((_ sign_extend 32) (size!836 (buf!1164 (_2!1822 lt!51267)))) ((_ sign_extend 32) (currentByte!2537 (_2!1822 lt!51267))) ((_ sign_extend 32) (currentBit!2532 (_2!1822 lt!51267))) (bvsub lt!51287 lt!51301))))

(declare-fun lt!51288 () Unit!2551)

(assert (=> b!34678 (= lt!51288 lt!51283)))

(declare-fun lt!51289 () tuple2!3472)

(assert (=> b!34678 (= lt!51289 call!430)))

(declare-fun lt!51275 () (_ BitVec 64))

(assert (=> b!34678 (= lt!51275 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!51299 () Unit!2551)

(assert (=> b!34678 (= lt!51299 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1822 lt!50802) (buf!1164 (_2!1822 lt!51267)) lt!51275))))

(assert (=> b!34678 (validate_offset_bits!1 ((_ sign_extend 32) (size!836 (buf!1164 (_2!1822 lt!51267)))) ((_ sign_extend 32) (currentByte!2537 (_2!1822 lt!50802))) ((_ sign_extend 32) (currentBit!2532 (_2!1822 lt!50802))) lt!51275)))

(declare-fun lt!51281 () Unit!2551)

(assert (=> b!34678 (= lt!51281 lt!51299)))

(assert (=> b!34678 (= (head!267 (byteArrayBitContentToList!0 (_2!1822 lt!51267) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!267 (bitStreamReadBitsIntoList!0 (_2!1822 lt!51267) (_1!1823 lt!51289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!51292 () Unit!2551)

(declare-fun Unit!2559 () Unit!2551)

(assert (=> b!34678 (= lt!51292 Unit!2559)))

(assert (=> b!34678 (= lt!51277 (appendBitsMSBFirstLoop!0 (_2!1822 lt!51267) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!51265 () Unit!2551)

(assert (=> b!34678 (= lt!51265 (lemmaIsPrefixTransitive!0 (_2!1822 lt!50802) (_2!1822 lt!51267) (_2!1822 lt!51277)))))

(assert (=> b!34678 (isPrefixOf!0 (_2!1822 lt!50802) (_2!1822 lt!51277))))

(declare-fun lt!51276 () Unit!2551)

(assert (=> b!34678 (= lt!51276 lt!51265)))

(assert (=> b!34678 (= (size!836 (buf!1164 (_2!1822 lt!51277))) (size!836 (buf!1164 (_2!1822 lt!50802))))))

(declare-fun lt!51271 () Unit!2551)

(declare-fun Unit!2560 () Unit!2551)

(assert (=> b!34678 (= lt!51271 Unit!2560)))

(assert (=> b!34678 (= (bitIndex!0 (size!836 (buf!1164 (_2!1822 lt!51277))) (currentByte!2537 (_2!1822 lt!51277)) (currentBit!2532 (_2!1822 lt!51277))) (bvsub (bvadd (bitIndex!0 (size!836 (buf!1164 (_2!1822 lt!50802))) (currentByte!2537 (_2!1822 lt!50802)) (currentBit!2532 (_2!1822 lt!50802))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!51290 () Unit!2551)

(declare-fun Unit!2561 () Unit!2551)

(assert (=> b!34678 (= lt!51290 Unit!2561)))

(assert (=> b!34678 (= (bitIndex!0 (size!836 (buf!1164 (_2!1822 lt!51277))) (currentByte!2537 (_2!1822 lt!51277)) (currentBit!2532 (_2!1822 lt!51277))) (bvsub (bvsub (bvadd (bitIndex!0 (size!836 (buf!1164 (_2!1822 lt!51267))) (currentByte!2537 (_2!1822 lt!51267)) (currentBit!2532 (_2!1822 lt!51267))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!51291 () Unit!2551)

(declare-fun Unit!2562 () Unit!2551)

(assert (=> b!34678 (= lt!51291 Unit!2562)))

(declare-fun lt!51286 () tuple2!3472)

(assert (=> b!34678 (= lt!51286 (reader!0 (_2!1822 lt!50802) (_2!1822 lt!51277)))))

(declare-fun lt!51303 () (_ BitVec 64))

(assert (=> b!34678 (= lt!51303 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!51269 () Unit!2551)

(assert (=> b!34678 (= lt!51269 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1822 lt!50802) (buf!1164 (_2!1822 lt!51277)) lt!51303))))

(assert (=> b!34678 (validate_offset_bits!1 ((_ sign_extend 32) (size!836 (buf!1164 (_2!1822 lt!51277)))) ((_ sign_extend 32) (currentByte!2537 (_2!1822 lt!50802))) ((_ sign_extend 32) (currentBit!2532 (_2!1822 lt!50802))) lt!51303)))

(declare-fun lt!51273 () Unit!2551)

(assert (=> b!34678 (= lt!51273 lt!51269)))

(declare-fun lt!51272 () tuple2!3472)

(assert (=> b!34678 (= lt!51272 (reader!0 (_2!1822 lt!51267) (_2!1822 lt!51277)))))

(declare-fun lt!51268 () (_ BitVec 64))

(assert (=> b!34678 (= lt!51268 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!51294 () Unit!2551)

(assert (=> b!34678 (= lt!51294 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1822 lt!51267) (buf!1164 (_2!1822 lt!51277)) lt!51268))))

(assert (=> b!34678 (validate_offset_bits!1 ((_ sign_extend 32) (size!836 (buf!1164 (_2!1822 lt!51277)))) ((_ sign_extend 32) (currentByte!2537 (_2!1822 lt!51267))) ((_ sign_extend 32) (currentBit!2532 (_2!1822 lt!51267))) lt!51268)))

(declare-fun lt!51305 () Unit!2551)

(assert (=> b!34678 (= lt!51305 lt!51294)))

(declare-fun lt!51285 () List!430)

(assert (=> b!34678 (= lt!51285 (byteArrayBitContentToList!0 (_2!1822 lt!51277) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!51274 () List!430)

(assert (=> b!34678 (= lt!51274 (byteArrayBitContentToList!0 (_2!1822 lt!51277) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!51297 () List!430)

(assert (=> b!34678 (= lt!51297 (bitStreamReadBitsIntoList!0 (_2!1822 lt!51277) (_1!1823 lt!51286) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!51302 () List!430)

(assert (=> b!34678 (= lt!51302 (bitStreamReadBitsIntoList!0 (_2!1822 lt!51277) (_1!1823 lt!51272) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!51279 () (_ BitVec 64))

(assert (=> b!34678 (= lt!51279 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!51270 () Unit!2551)

(assert (=> b!34678 (= lt!51270 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1822 lt!51277) (_2!1822 lt!51277) (_1!1823 lt!51286) (_1!1823 lt!51272) lt!51279 lt!51297))))

(assert (=> b!34678 (= (bitStreamReadBitsIntoList!0 (_2!1822 lt!51277) (_1!1823 lt!51272) (bvsub lt!51279 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!147 lt!51297))))

(declare-fun lt!51280 () Unit!2551)

(assert (=> b!34678 (= lt!51280 lt!51270)))

(declare-fun lt!51284 () Unit!2551)

(assert (=> b!34678 (= lt!51284 (arrayBitRangesEqImpliesEq!0 (buf!1164 (_2!1822 lt!51267)) (buf!1164 (_2!1822 lt!51277)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!51298 (bitIndex!0 (size!836 (buf!1164 (_2!1822 lt!51267))) (currentByte!2537 (_2!1822 lt!51267)) (currentBit!2532 (_2!1822 lt!51267)))))))

(assert (=> b!34678 (= (bitAt!0 (buf!1164 (_2!1822 lt!51267)) lt!51298) (bitAt!0 (buf!1164 (_2!1822 lt!51277)) lt!51298))))

(declare-fun lt!51293 () Unit!2551)

(assert (=> b!34678 (= lt!51293 lt!51284)))

(assert (= (and d!9912 c!2313) b!34678))

(assert (= (and d!9912 (not c!2313)) b!34671))

(assert (= (or b!34678 b!34671) bm!427))

(assert (= (and d!9912 res!29660) b!34674))

(assert (= (and b!34674 res!29657) b!34673))

(assert (= (and b!34673 res!29661) b!34675))

(assert (= (and b!34675 res!29658) b!34677))

(assert (= (and b!34677 res!29662) b!34676))

(assert (= (and b!34676 res!29659) b!34672))

(declare-fun m!51719 () Bool)

(assert (=> d!9912 m!51719))

(assert (=> d!9912 m!51337))

(assert (=> d!9912 m!51543))

(assert (=> d!9912 m!51545))

(declare-fun m!51721 () Bool)

(assert (=> b!34672 m!51721))

(declare-fun m!51723 () Bool)

(assert (=> b!34678 m!51723))

(declare-fun m!51725 () Bool)

(assert (=> b!34678 m!51725))

(declare-fun m!51727 () Bool)

(assert (=> b!34678 m!51727))

(declare-fun m!51729 () Bool)

(assert (=> b!34678 m!51729))

(declare-fun m!51731 () Bool)

(assert (=> b!34678 m!51731))

(declare-fun m!51733 () Bool)

(assert (=> b!34678 m!51733))

(declare-fun m!51735 () Bool)

(assert (=> b!34678 m!51735))

(declare-fun m!51737 () Bool)

(assert (=> b!34678 m!51737))

(declare-fun m!51739 () Bool)

(assert (=> b!34678 m!51739))

(declare-fun m!51741 () Bool)

(assert (=> b!34678 m!51741))

(declare-fun m!51743 () Bool)

(assert (=> b!34678 m!51743))

(declare-fun m!51745 () Bool)

(assert (=> b!34678 m!51745))

(declare-fun m!51747 () Bool)

(assert (=> b!34678 m!51747))

(declare-fun m!51749 () Bool)

(assert (=> b!34678 m!51749))

(declare-fun m!51751 () Bool)

(assert (=> b!34678 m!51751))

(declare-fun m!51753 () Bool)

(assert (=> b!34678 m!51753))

(assert (=> b!34678 m!51337))

(declare-fun m!51755 () Bool)

(assert (=> b!34678 m!51755))

(declare-fun m!51757 () Bool)

(assert (=> b!34678 m!51757))

(declare-fun m!51759 () Bool)

(assert (=> b!34678 m!51759))

(declare-fun m!51761 () Bool)

(assert (=> b!34678 m!51761))

(declare-fun m!51763 () Bool)

(assert (=> b!34678 m!51763))

(declare-fun m!51765 () Bool)

(assert (=> b!34678 m!51765))

(assert (=> b!34678 m!51729))

(assert (=> b!34678 m!51761))

(declare-fun m!51767 () Bool)

(assert (=> b!34678 m!51767))

(declare-fun m!51769 () Bool)

(assert (=> b!34678 m!51769))

(declare-fun m!51771 () Bool)

(assert (=> b!34678 m!51771))

(declare-fun m!51773 () Bool)

(assert (=> b!34678 m!51773))

(assert (=> b!34678 m!51745))

(declare-fun m!51775 () Bool)

(assert (=> b!34678 m!51775))

(declare-fun m!51777 () Bool)

(assert (=> b!34678 m!51777))

(assert (=> b!34678 m!51735))

(declare-fun m!51779 () Bool)

(assert (=> b!34678 m!51779))

(declare-fun m!51781 () Bool)

(assert (=> b!34678 m!51781))

(declare-fun m!51783 () Bool)

(assert (=> b!34678 m!51783))

(declare-fun m!51785 () Bool)

(assert (=> b!34675 m!51785))

(declare-fun m!51787 () Bool)

(assert (=> b!34674 m!51787))

(declare-fun m!51789 () Bool)

(assert (=> bm!427 m!51789))

(declare-fun m!51791 () Bool)

(assert (=> b!34676 m!51791))

(declare-fun m!51793 () Bool)

(assert (=> b!34676 m!51793))

(declare-fun m!51795 () Bool)

(assert (=> b!34676 m!51795))

(declare-fun m!51797 () Bool)

(assert (=> b!34676 m!51797))

(declare-fun m!51799 () Bool)

(assert (=> b!34676 m!51799))

(declare-fun m!51801 () Bool)

(assert (=> b!34671 m!51801))

(declare-fun m!51803 () Bool)

(assert (=> b!34671 m!51803))

(assert (=> b!34418 d!9912))

(declare-fun d!9998 () Bool)

(assert (=> d!9998 (= (array_inv!782 (buf!1164 thiss!1379)) (bvsge (size!836 (buf!1164 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!34429 d!9998))

(declare-fun d!10000 () Bool)

(assert (=> d!10000 (= (head!267 (byteArrayBitContentToList!0 (_2!1822 lt!50802) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!545 (byteArrayBitContentToList!0 (_2!1822 lt!50802) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!34414 d!10000))

(declare-fun d!10002 () Bool)

(declare-fun c!2314 () Bool)

(assert (=> d!10002 (= c!2314 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!22963 () List!430)

(assert (=> d!10002 (= (byteArrayBitContentToList!0 (_2!1822 lt!50802) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!22963)))

(declare-fun b!34679 () Bool)

(assert (=> b!34679 (= e!22963 Nil!427)))

(declare-fun b!34680 () Bool)

(assert (=> b!34680 (= e!22963 (Cons!426 (not (= (bvand ((_ sign_extend 24) (select (arr!1314 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1822 lt!50802) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!10002 c!2314) b!34679))

(assert (= (and d!10002 (not c!2314)) b!34680))

(assert (=> b!34680 m!51327))

(assert (=> b!34680 m!51529))

(declare-fun m!51805 () Bool)

(assert (=> b!34680 m!51805))

(assert (=> b!34414 d!10002))

(declare-fun d!10004 () Bool)

(assert (=> d!10004 (= (head!267 (bitStreamReadBitsIntoList!0 (_2!1822 lt!50802) (_1!1823 lt!50783) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!545 (bitStreamReadBitsIntoList!0 (_2!1822 lt!50802) (_1!1823 lt!50783) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!34414 d!10004))

(declare-fun b!34691 () Bool)

(declare-fun e!22968 () Bool)

(declare-fun lt!51316 () List!430)

(declare-fun isEmpty!93 (List!430) Bool)

(assert (=> b!34691 (= e!22968 (isEmpty!93 lt!51316))))

(declare-fun b!34689 () Bool)

(declare-datatypes ((tuple2!3482 0))(
  ( (tuple2!3483 (_1!1828 List!430) (_2!1828 BitStream!1458)) )
))
(declare-fun e!22969 () tuple2!3482)

(assert (=> b!34689 (= e!22969 (tuple2!3483 Nil!427 (_1!1823 lt!50783)))))

(declare-fun d!10006 () Bool)

(assert (=> d!10006 e!22968))

(declare-fun c!2319 () Bool)

(assert (=> d!10006 (= c!2319 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10006 (= lt!51316 (_1!1828 e!22969))))

(declare-fun c!2320 () Bool)

(assert (=> d!10006 (= c!2320 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10006 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10006 (= (bitStreamReadBitsIntoList!0 (_2!1822 lt!50802) (_1!1823 lt!50783) #b0000000000000000000000000000000000000000000000000000000000000001) lt!51316)))

(declare-fun b!34692 () Bool)

(assert (=> b!34692 (= e!22968 (> (length!156 lt!51316) 0))))

(declare-fun lt!51315 () (_ BitVec 64))

(declare-datatypes ((tuple2!3484 0))(
  ( (tuple2!3485 (_1!1829 Bool) (_2!1829 BitStream!1458)) )
))
(declare-fun lt!51317 () tuple2!3484)

(declare-fun b!34690 () Bool)

(assert (=> b!34690 (= e!22969 (tuple2!3483 (Cons!426 (_1!1829 lt!51317) (bitStreamReadBitsIntoList!0 (_2!1822 lt!50802) (_2!1829 lt!51317) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!51315))) (_2!1829 lt!51317)))))

(declare-fun readBit!0 (BitStream!1458) tuple2!3484)

(assert (=> b!34690 (= lt!51317 (readBit!0 (_1!1823 lt!50783)))))

(assert (=> b!34690 (= lt!51315 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!10006 c!2320) b!34689))

(assert (= (and d!10006 (not c!2320)) b!34690))

(assert (= (and d!10006 c!2319) b!34691))

(assert (= (and d!10006 (not c!2319)) b!34692))

(declare-fun m!51807 () Bool)

(assert (=> b!34691 m!51807))

(declare-fun m!51809 () Bool)

(assert (=> b!34692 m!51809))

(declare-fun m!51811 () Bool)

(assert (=> b!34690 m!51811))

(declare-fun m!51813 () Bool)

(assert (=> b!34690 m!51813))

(assert (=> b!34414 d!10006))

(declare-fun d!10008 () Bool)

(declare-fun res!29663 () Bool)

(declare-fun e!22971 () Bool)

(assert (=> d!10008 (=> (not res!29663) (not e!22971))))

(assert (=> d!10008 (= res!29663 (= (size!836 (buf!1164 thiss!1379)) (size!836 (buf!1164 thiss!1379))))))

(assert (=> d!10008 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!22971)))

(declare-fun b!34693 () Bool)

(declare-fun res!29664 () Bool)

(assert (=> b!34693 (=> (not res!29664) (not e!22971))))

(assert (=> b!34693 (= res!29664 (bvsle (bitIndex!0 (size!836 (buf!1164 thiss!1379)) (currentByte!2537 thiss!1379) (currentBit!2532 thiss!1379)) (bitIndex!0 (size!836 (buf!1164 thiss!1379)) (currentByte!2537 thiss!1379) (currentBit!2532 thiss!1379))))))

(declare-fun b!34694 () Bool)

(declare-fun e!22970 () Bool)

(assert (=> b!34694 (= e!22971 e!22970)))

(declare-fun res!29665 () Bool)

(assert (=> b!34694 (=> res!29665 e!22970)))

(assert (=> b!34694 (= res!29665 (= (size!836 (buf!1164 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!34695 () Bool)

(assert (=> b!34695 (= e!22970 (arrayBitRangesEq!0 (buf!1164 thiss!1379) (buf!1164 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!836 (buf!1164 thiss!1379)) (currentByte!2537 thiss!1379) (currentBit!2532 thiss!1379))))))

(assert (= (and d!10008 res!29663) b!34693))

(assert (= (and b!34693 res!29664) b!34694))

(assert (= (and b!34694 (not res!29665)) b!34695))

(assert (=> b!34693 m!51307))

(assert (=> b!34693 m!51307))

(assert (=> b!34695 m!51307))

(assert (=> b!34695 m!51307))

(declare-fun m!51815 () Bool)

(assert (=> b!34695 m!51815))

(assert (=> b!34425 d!10008))

(declare-fun d!10010 () Bool)

(assert (=> d!10010 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!51320 () Unit!2551)

(declare-fun choose!11 (BitStream!1458) Unit!2551)

(assert (=> d!10010 (= lt!51320 (choose!11 thiss!1379))))

(assert (=> d!10010 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!51320)))

(declare-fun bs!2726 () Bool)

(assert (= bs!2726 d!10010))

(assert (=> bs!2726 m!51303))

(declare-fun m!51817 () Bool)

(assert (=> bs!2726 m!51817))

(assert (=> b!34425 d!10010))

(declare-fun d!10012 () Bool)

(declare-fun e!22972 () Bool)

(assert (=> d!10012 e!22972))

(declare-fun res!29667 () Bool)

(assert (=> d!10012 (=> (not res!29667) (not e!22972))))

(declare-fun lt!51321 () (_ BitVec 64))

(declare-fun lt!51325 () (_ BitVec 64))

(declare-fun lt!51323 () (_ BitVec 64))

(assert (=> d!10012 (= res!29667 (= lt!51321 (bvsub lt!51323 lt!51325)))))

(assert (=> d!10012 (or (= (bvand lt!51323 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!51325 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!51323 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!51323 lt!51325) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!10012 (= lt!51325 (remainingBits!0 ((_ sign_extend 32) (size!836 (buf!1164 thiss!1379))) ((_ sign_extend 32) (currentByte!2537 thiss!1379)) ((_ sign_extend 32) (currentBit!2532 thiss!1379))))))

(declare-fun lt!51324 () (_ BitVec 64))

(declare-fun lt!51326 () (_ BitVec 64))

(assert (=> d!10012 (= lt!51323 (bvmul lt!51324 lt!51326))))

(assert (=> d!10012 (or (= lt!51324 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!51326 (bvsdiv (bvmul lt!51324 lt!51326) lt!51324)))))

(assert (=> d!10012 (= lt!51326 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!10012 (= lt!51324 ((_ sign_extend 32) (size!836 (buf!1164 thiss!1379))))))

(assert (=> d!10012 (= lt!51321 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2537 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2532 thiss!1379))))))

(assert (=> d!10012 (invariant!0 (currentBit!2532 thiss!1379) (currentByte!2537 thiss!1379) (size!836 (buf!1164 thiss!1379)))))

(assert (=> d!10012 (= (bitIndex!0 (size!836 (buf!1164 thiss!1379)) (currentByte!2537 thiss!1379) (currentBit!2532 thiss!1379)) lt!51321)))

(declare-fun b!34696 () Bool)

(declare-fun res!29666 () Bool)

(assert (=> b!34696 (=> (not res!29666) (not e!22972))))

(assert (=> b!34696 (= res!29666 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!51321))))

(declare-fun b!34697 () Bool)

(declare-fun lt!51322 () (_ BitVec 64))

(assert (=> b!34697 (= e!22972 (bvsle lt!51321 (bvmul lt!51322 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!34697 (or (= lt!51322 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!51322 #b0000000000000000000000000000000000000000000000000000000000001000) lt!51322)))))

(assert (=> b!34697 (= lt!51322 ((_ sign_extend 32) (size!836 (buf!1164 thiss!1379))))))

(assert (= (and d!10012 res!29667) b!34696))

(assert (= (and b!34696 res!29666) b!34697))

(declare-fun m!51819 () Bool)

(assert (=> d!10012 m!51819))

(declare-fun m!51821 () Bool)

(assert (=> d!10012 m!51821))

(assert (=> b!34425 d!10012))

(declare-fun d!10014 () Bool)

(declare-fun e!22973 () Bool)

(assert (=> d!10014 e!22973))

(declare-fun res!29669 () Bool)

(assert (=> d!10014 (=> (not res!29669) (not e!22973))))

(declare-fun lt!51331 () (_ BitVec 64))

(declare-fun lt!51327 () (_ BitVec 64))

(declare-fun lt!51329 () (_ BitVec 64))

(assert (=> d!10014 (= res!29669 (= lt!51327 (bvsub lt!51329 lt!51331)))))

(assert (=> d!10014 (or (= (bvand lt!51329 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!51331 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!51329 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!51329 lt!51331) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!10014 (= lt!51331 (remainingBits!0 ((_ sign_extend 32) (size!836 (buf!1164 (_2!1822 lt!50794)))) ((_ sign_extend 32) (currentByte!2537 (_2!1822 lt!50794))) ((_ sign_extend 32) (currentBit!2532 (_2!1822 lt!50794)))))))

(declare-fun lt!51330 () (_ BitVec 64))

(declare-fun lt!51332 () (_ BitVec 64))

(assert (=> d!10014 (= lt!51329 (bvmul lt!51330 lt!51332))))

(assert (=> d!10014 (or (= lt!51330 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!51332 (bvsdiv (bvmul lt!51330 lt!51332) lt!51330)))))

(assert (=> d!10014 (= lt!51332 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!10014 (= lt!51330 ((_ sign_extend 32) (size!836 (buf!1164 (_2!1822 lt!50794)))))))

(assert (=> d!10014 (= lt!51327 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2537 (_2!1822 lt!50794))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2532 (_2!1822 lt!50794)))))))

(assert (=> d!10014 (invariant!0 (currentBit!2532 (_2!1822 lt!50794)) (currentByte!2537 (_2!1822 lt!50794)) (size!836 (buf!1164 (_2!1822 lt!50794))))))

(assert (=> d!10014 (= (bitIndex!0 (size!836 (buf!1164 (_2!1822 lt!50794))) (currentByte!2537 (_2!1822 lt!50794)) (currentBit!2532 (_2!1822 lt!50794))) lt!51327)))

(declare-fun b!34698 () Bool)

(declare-fun res!29668 () Bool)

(assert (=> b!34698 (=> (not res!29668) (not e!22973))))

(assert (=> b!34698 (= res!29668 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!51327))))

(declare-fun b!34699 () Bool)

(declare-fun lt!51328 () (_ BitVec 64))

(assert (=> b!34699 (= e!22973 (bvsle lt!51327 (bvmul lt!51328 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!34699 (or (= lt!51328 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!51328 #b0000000000000000000000000000000000000000000000000000000000001000) lt!51328)))))

(assert (=> b!34699 (= lt!51328 ((_ sign_extend 32) (size!836 (buf!1164 (_2!1822 lt!50794)))))))

(assert (= (and d!10014 res!29669) b!34698))

(assert (= (and b!34698 res!29668) b!34699))

(declare-fun m!51823 () Bool)

(assert (=> d!10014 m!51823))

(assert (=> d!10014 m!51381))

(assert (=> b!34415 d!10014))

(declare-fun d!10016 () Bool)

(assert (=> d!10016 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!836 (buf!1164 (_2!1822 lt!50794)))) ((_ sign_extend 32) (currentByte!2537 (_2!1822 lt!50802))) ((_ sign_extend 32) (currentBit!2532 (_2!1822 lt!50802))) lt!50786) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!836 (buf!1164 (_2!1822 lt!50794)))) ((_ sign_extend 32) (currentByte!2537 (_2!1822 lt!50802))) ((_ sign_extend 32) (currentBit!2532 (_2!1822 lt!50802)))) lt!50786))))

(declare-fun bs!2727 () Bool)

(assert (= bs!2727 d!10016))

(declare-fun m!51825 () Bool)

(assert (=> bs!2727 m!51825))

(assert (=> b!34426 d!10016))

(declare-fun lt!51333 () tuple2!3472)

(declare-fun lt!51346 () (_ BitVec 64))

(declare-fun b!34700 () Bool)

(declare-fun e!22974 () Bool)

(declare-fun lt!51335 () (_ BitVec 64))

(assert (=> b!34700 (= e!22974 (= (_1!1823 lt!51333) (withMovedBitIndex!0 (_2!1823 lt!51333) (bvsub lt!51335 lt!51346))))))

(assert (=> b!34700 (or (= (bvand lt!51335 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!51346 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!51335 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!51335 lt!51346) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!34700 (= lt!51346 (bitIndex!0 (size!836 (buf!1164 (_2!1822 lt!50794))) (currentByte!2537 (_2!1822 lt!50794)) (currentBit!2532 (_2!1822 lt!50794))))))

(assert (=> b!34700 (= lt!51335 (bitIndex!0 (size!836 (buf!1164 thiss!1379)) (currentByte!2537 thiss!1379) (currentBit!2532 thiss!1379)))))

(declare-fun b!34701 () Bool)

(declare-fun res!29672 () Bool)

(assert (=> b!34701 (=> (not res!29672) (not e!22974))))

(assert (=> b!34701 (= res!29672 (isPrefixOf!0 (_2!1823 lt!51333) (_2!1822 lt!50794)))))

(declare-fun b!34702 () Bool)

(declare-fun e!22975 () Unit!2551)

(declare-fun lt!51352 () Unit!2551)

(assert (=> b!34702 (= e!22975 lt!51352)))

(declare-fun lt!51341 () (_ BitVec 64))

(assert (=> b!34702 (= lt!51341 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51343 () (_ BitVec 64))

(assert (=> b!34702 (= lt!51343 (bitIndex!0 (size!836 (buf!1164 thiss!1379)) (currentByte!2537 thiss!1379) (currentBit!2532 thiss!1379)))))

(assert (=> b!34702 (= lt!51352 (arrayBitRangesEqSymmetric!0 (buf!1164 thiss!1379) (buf!1164 (_2!1822 lt!50794)) lt!51341 lt!51343))))

(assert (=> b!34702 (arrayBitRangesEq!0 (buf!1164 (_2!1822 lt!50794)) (buf!1164 thiss!1379) lt!51341 lt!51343)))

(declare-fun d!10018 () Bool)

(assert (=> d!10018 e!22974))

(declare-fun res!29671 () Bool)

(assert (=> d!10018 (=> (not res!29671) (not e!22974))))

(assert (=> d!10018 (= res!29671 (isPrefixOf!0 (_1!1823 lt!51333) (_2!1823 lt!51333)))))

(declare-fun lt!51340 () BitStream!1458)

(assert (=> d!10018 (= lt!51333 (tuple2!3473 lt!51340 (_2!1822 lt!50794)))))

(declare-fun lt!51348 () Unit!2551)

(declare-fun lt!51337 () Unit!2551)

(assert (=> d!10018 (= lt!51348 lt!51337)))

(assert (=> d!10018 (isPrefixOf!0 lt!51340 (_2!1822 lt!50794))))

(assert (=> d!10018 (= lt!51337 (lemmaIsPrefixTransitive!0 lt!51340 (_2!1822 lt!50794) (_2!1822 lt!50794)))))

(declare-fun lt!51336 () Unit!2551)

(declare-fun lt!51338 () Unit!2551)

(assert (=> d!10018 (= lt!51336 lt!51338)))

(assert (=> d!10018 (isPrefixOf!0 lt!51340 (_2!1822 lt!50794))))

(assert (=> d!10018 (= lt!51338 (lemmaIsPrefixTransitive!0 lt!51340 thiss!1379 (_2!1822 lt!50794)))))

(declare-fun lt!51350 () Unit!2551)

(assert (=> d!10018 (= lt!51350 e!22975)))

(declare-fun c!2321 () Bool)

(assert (=> d!10018 (= c!2321 (not (= (size!836 (buf!1164 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!51345 () Unit!2551)

(declare-fun lt!51344 () Unit!2551)

(assert (=> d!10018 (= lt!51345 lt!51344)))

(assert (=> d!10018 (isPrefixOf!0 (_2!1822 lt!50794) (_2!1822 lt!50794))))

(assert (=> d!10018 (= lt!51344 (lemmaIsPrefixRefl!0 (_2!1822 lt!50794)))))

(declare-fun lt!51342 () Unit!2551)

(declare-fun lt!51349 () Unit!2551)

(assert (=> d!10018 (= lt!51342 lt!51349)))

(assert (=> d!10018 (= lt!51349 (lemmaIsPrefixRefl!0 (_2!1822 lt!50794)))))

(declare-fun lt!51351 () Unit!2551)

(declare-fun lt!51347 () Unit!2551)

(assert (=> d!10018 (= lt!51351 lt!51347)))

(assert (=> d!10018 (isPrefixOf!0 lt!51340 lt!51340)))

(assert (=> d!10018 (= lt!51347 (lemmaIsPrefixRefl!0 lt!51340))))

(declare-fun lt!51334 () Unit!2551)

(declare-fun lt!51339 () Unit!2551)

(assert (=> d!10018 (= lt!51334 lt!51339)))

(assert (=> d!10018 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!10018 (= lt!51339 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!10018 (= lt!51340 (BitStream!1459 (buf!1164 (_2!1822 lt!50794)) (currentByte!2537 thiss!1379) (currentBit!2532 thiss!1379)))))

(assert (=> d!10018 (isPrefixOf!0 thiss!1379 (_2!1822 lt!50794))))

(assert (=> d!10018 (= (reader!0 thiss!1379 (_2!1822 lt!50794)) lt!51333)))

(declare-fun b!34703 () Bool)

(declare-fun res!29670 () Bool)

(assert (=> b!34703 (=> (not res!29670) (not e!22974))))

(assert (=> b!34703 (= res!29670 (isPrefixOf!0 (_1!1823 lt!51333) thiss!1379))))

(declare-fun b!34704 () Bool)

(declare-fun Unit!2563 () Unit!2551)

(assert (=> b!34704 (= e!22975 Unit!2563)))

(assert (= (and d!10018 c!2321) b!34702))

(assert (= (and d!10018 (not c!2321)) b!34704))

(assert (= (and d!10018 res!29671) b!34703))

(assert (= (and b!34703 res!29670) b!34701))

(assert (= (and b!34701 res!29672) b!34700))

(declare-fun m!51827 () Bool)

(assert (=> d!10018 m!51827))

(assert (=> d!10018 m!51341))

(declare-fun m!51829 () Bool)

(assert (=> d!10018 m!51829))

(assert (=> d!10018 m!51305))

(declare-fun m!51831 () Bool)

(assert (=> d!10018 m!51831))

(assert (=> d!10018 m!51303))

(declare-fun m!51833 () Bool)

(assert (=> d!10018 m!51833))

(declare-fun m!51835 () Bool)

(assert (=> d!10018 m!51835))

(declare-fun m!51837 () Bool)

(assert (=> d!10018 m!51837))

(declare-fun m!51839 () Bool)

(assert (=> d!10018 m!51839))

(declare-fun m!51841 () Bool)

(assert (=> d!10018 m!51841))

(assert (=> b!34702 m!51307))

(declare-fun m!51843 () Bool)

(assert (=> b!34702 m!51843))

(declare-fun m!51845 () Bool)

(assert (=> b!34702 m!51845))

(declare-fun m!51847 () Bool)

(assert (=> b!34700 m!51847))

(assert (=> b!34700 m!51379))

(assert (=> b!34700 m!51307))

(declare-fun m!51849 () Bool)

(assert (=> b!34703 m!51849))

(declare-fun m!51851 () Bool)

(assert (=> b!34701 m!51851))

(assert (=> b!34426 d!10018))

(declare-fun d!10020 () Bool)

(assert (=> d!10020 (validate_offset_bits!1 ((_ sign_extend 32) (size!836 (buf!1164 (_2!1822 lt!50794)))) ((_ sign_extend 32) (currentByte!2537 thiss!1379)) ((_ sign_extend 32) (currentBit!2532 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!51353 () Unit!2551)

(assert (=> d!10020 (= lt!51353 (choose!9 thiss!1379 (buf!1164 (_2!1822 lt!50794)) (bvsub to!314 i!635) (BitStream!1459 (buf!1164 (_2!1822 lt!50794)) (currentByte!2537 thiss!1379) (currentBit!2532 thiss!1379))))))

(assert (=> d!10020 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1164 (_2!1822 lt!50794)) (bvsub to!314 i!635)) lt!51353)))

(declare-fun bs!2728 () Bool)

(assert (= bs!2728 d!10020))

(assert (=> bs!2728 m!51369))

(declare-fun m!51853 () Bool)

(assert (=> bs!2728 m!51853))

(assert (=> b!34426 d!10020))

(declare-fun lt!51356 () (_ BitVec 64))

(declare-fun lt!51367 () (_ BitVec 64))

(declare-fun e!22976 () Bool)

(declare-fun lt!51354 () tuple2!3472)

(declare-fun b!34705 () Bool)

(assert (=> b!34705 (= e!22976 (= (_1!1823 lt!51354) (withMovedBitIndex!0 (_2!1823 lt!51354) (bvsub lt!51356 lt!51367))))))

(assert (=> b!34705 (or (= (bvand lt!51356 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!51367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!51356 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!51356 lt!51367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!34705 (= lt!51367 (bitIndex!0 (size!836 (buf!1164 (_2!1822 lt!50794))) (currentByte!2537 (_2!1822 lt!50794)) (currentBit!2532 (_2!1822 lt!50794))))))

(assert (=> b!34705 (= lt!51356 (bitIndex!0 (size!836 (buf!1164 (_2!1822 lt!50802))) (currentByte!2537 (_2!1822 lt!50802)) (currentBit!2532 (_2!1822 lt!50802))))))

(declare-fun b!34706 () Bool)

(declare-fun res!29675 () Bool)

(assert (=> b!34706 (=> (not res!29675) (not e!22976))))

(assert (=> b!34706 (= res!29675 (isPrefixOf!0 (_2!1823 lt!51354) (_2!1822 lt!50794)))))

(declare-fun b!34707 () Bool)

(declare-fun e!22977 () Unit!2551)

(declare-fun lt!51373 () Unit!2551)

(assert (=> b!34707 (= e!22977 lt!51373)))

(declare-fun lt!51362 () (_ BitVec 64))

(assert (=> b!34707 (= lt!51362 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51364 () (_ BitVec 64))

(assert (=> b!34707 (= lt!51364 (bitIndex!0 (size!836 (buf!1164 (_2!1822 lt!50802))) (currentByte!2537 (_2!1822 lt!50802)) (currentBit!2532 (_2!1822 lt!50802))))))

(assert (=> b!34707 (= lt!51373 (arrayBitRangesEqSymmetric!0 (buf!1164 (_2!1822 lt!50802)) (buf!1164 (_2!1822 lt!50794)) lt!51362 lt!51364))))

(assert (=> b!34707 (arrayBitRangesEq!0 (buf!1164 (_2!1822 lt!50794)) (buf!1164 (_2!1822 lt!50802)) lt!51362 lt!51364)))

(declare-fun d!10022 () Bool)

(assert (=> d!10022 e!22976))

(declare-fun res!29674 () Bool)

(assert (=> d!10022 (=> (not res!29674) (not e!22976))))

(assert (=> d!10022 (= res!29674 (isPrefixOf!0 (_1!1823 lt!51354) (_2!1823 lt!51354)))))

(declare-fun lt!51361 () BitStream!1458)

(assert (=> d!10022 (= lt!51354 (tuple2!3473 lt!51361 (_2!1822 lt!50794)))))

(declare-fun lt!51369 () Unit!2551)

(declare-fun lt!51358 () Unit!2551)

(assert (=> d!10022 (= lt!51369 lt!51358)))

(assert (=> d!10022 (isPrefixOf!0 lt!51361 (_2!1822 lt!50794))))

(assert (=> d!10022 (= lt!51358 (lemmaIsPrefixTransitive!0 lt!51361 (_2!1822 lt!50794) (_2!1822 lt!50794)))))

(declare-fun lt!51357 () Unit!2551)

(declare-fun lt!51359 () Unit!2551)

(assert (=> d!10022 (= lt!51357 lt!51359)))

(assert (=> d!10022 (isPrefixOf!0 lt!51361 (_2!1822 lt!50794))))

(assert (=> d!10022 (= lt!51359 (lemmaIsPrefixTransitive!0 lt!51361 (_2!1822 lt!50802) (_2!1822 lt!50794)))))

(declare-fun lt!51371 () Unit!2551)

(assert (=> d!10022 (= lt!51371 e!22977)))

(declare-fun c!2322 () Bool)

(assert (=> d!10022 (= c!2322 (not (= (size!836 (buf!1164 (_2!1822 lt!50802))) #b00000000000000000000000000000000)))))

(declare-fun lt!51366 () Unit!2551)

(declare-fun lt!51365 () Unit!2551)

(assert (=> d!10022 (= lt!51366 lt!51365)))

(assert (=> d!10022 (isPrefixOf!0 (_2!1822 lt!50794) (_2!1822 lt!50794))))

(assert (=> d!10022 (= lt!51365 (lemmaIsPrefixRefl!0 (_2!1822 lt!50794)))))

(declare-fun lt!51363 () Unit!2551)

(declare-fun lt!51370 () Unit!2551)

(assert (=> d!10022 (= lt!51363 lt!51370)))

(assert (=> d!10022 (= lt!51370 (lemmaIsPrefixRefl!0 (_2!1822 lt!50794)))))

(declare-fun lt!51372 () Unit!2551)

(declare-fun lt!51368 () Unit!2551)

(assert (=> d!10022 (= lt!51372 lt!51368)))

(assert (=> d!10022 (isPrefixOf!0 lt!51361 lt!51361)))

(assert (=> d!10022 (= lt!51368 (lemmaIsPrefixRefl!0 lt!51361))))

(declare-fun lt!51355 () Unit!2551)

(declare-fun lt!51360 () Unit!2551)

(assert (=> d!10022 (= lt!51355 lt!51360)))

(assert (=> d!10022 (isPrefixOf!0 (_2!1822 lt!50802) (_2!1822 lt!50802))))

(assert (=> d!10022 (= lt!51360 (lemmaIsPrefixRefl!0 (_2!1822 lt!50802)))))

(assert (=> d!10022 (= lt!51361 (BitStream!1459 (buf!1164 (_2!1822 lt!50794)) (currentByte!2537 (_2!1822 lt!50802)) (currentBit!2532 (_2!1822 lt!50802))))))

(assert (=> d!10022 (isPrefixOf!0 (_2!1822 lt!50802) (_2!1822 lt!50794))))

(assert (=> d!10022 (= (reader!0 (_2!1822 lt!50802) (_2!1822 lt!50794)) lt!51354)))

(declare-fun b!34708 () Bool)

(declare-fun res!29673 () Bool)

(assert (=> b!34708 (=> (not res!29673) (not e!22976))))

(assert (=> b!34708 (= res!29673 (isPrefixOf!0 (_1!1823 lt!51354) (_2!1822 lt!50802)))))

(declare-fun b!34709 () Bool)

(declare-fun Unit!2564 () Unit!2551)

(assert (=> b!34709 (= e!22977 Unit!2564)))

(assert (= (and d!10022 c!2322) b!34707))

(assert (= (and d!10022 (not c!2322)) b!34709))

(assert (= (and d!10022 res!29674) b!34708))

(assert (= (and b!34708 res!29673) b!34706))

(assert (= (and b!34706 res!29675) b!34705))

(declare-fun m!51855 () Bool)

(assert (=> d!10022 m!51855))

(assert (=> d!10022 m!51345))

(declare-fun m!51857 () Bool)

(assert (=> d!10022 m!51857))

(assert (=> d!10022 m!51545))

(declare-fun m!51859 () Bool)

(assert (=> d!10022 m!51859))

(assert (=> d!10022 m!51543))

(declare-fun m!51861 () Bool)

(assert (=> d!10022 m!51861))

(assert (=> d!10022 m!51835))

(assert (=> d!10022 m!51837))

(declare-fun m!51863 () Bool)

(assert (=> d!10022 m!51863))

(declare-fun m!51865 () Bool)

(assert (=> d!10022 m!51865))

(assert (=> b!34707 m!51337))

(declare-fun m!51867 () Bool)

(assert (=> b!34707 m!51867))

(declare-fun m!51869 () Bool)

(assert (=> b!34707 m!51869))

(declare-fun m!51871 () Bool)

(assert (=> b!34705 m!51871))

(assert (=> b!34705 m!51379))

(assert (=> b!34705 m!51337))

(declare-fun m!51873 () Bool)

(assert (=> b!34708 m!51873))

(declare-fun m!51875 () Bool)

(assert (=> b!34706 m!51875))

(assert (=> b!34426 d!10022))

(declare-fun b!34712 () Bool)

(declare-fun e!22978 () Bool)

(declare-fun lt!51375 () List!430)

(assert (=> b!34712 (= e!22978 (isEmpty!93 lt!51375))))

(declare-fun b!34710 () Bool)

(declare-fun e!22979 () tuple2!3482)

(assert (=> b!34710 (= e!22979 (tuple2!3483 Nil!427 (_1!1823 lt!50789)))))

(declare-fun d!10024 () Bool)

(assert (=> d!10024 e!22978))

(declare-fun c!2323 () Bool)

(assert (=> d!10024 (= c!2323 (= lt!50786 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10024 (= lt!51375 (_1!1828 e!22979))))

(declare-fun c!2324 () Bool)

(assert (=> d!10024 (= c!2324 (= lt!50786 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10024 (bvsge lt!50786 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10024 (= (bitStreamReadBitsIntoList!0 (_2!1822 lt!50794) (_1!1823 lt!50789) lt!50786) lt!51375)))

(declare-fun b!34713 () Bool)

(assert (=> b!34713 (= e!22978 (> (length!156 lt!51375) 0))))

(declare-fun lt!51374 () (_ BitVec 64))

(declare-fun lt!51376 () tuple2!3484)

(declare-fun b!34711 () Bool)

(assert (=> b!34711 (= e!22979 (tuple2!3483 (Cons!426 (_1!1829 lt!51376) (bitStreamReadBitsIntoList!0 (_2!1822 lt!50794) (_2!1829 lt!51376) (bvsub lt!50786 lt!51374))) (_2!1829 lt!51376)))))

(assert (=> b!34711 (= lt!51376 (readBit!0 (_1!1823 lt!50789)))))

(assert (=> b!34711 (= lt!51374 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!10024 c!2324) b!34710))

(assert (= (and d!10024 (not c!2324)) b!34711))

(assert (= (and d!10024 c!2323) b!34712))

(assert (= (and d!10024 (not c!2323)) b!34713))

(declare-fun m!51877 () Bool)

(assert (=> b!34712 m!51877))

(declare-fun m!51879 () Bool)

(assert (=> b!34713 m!51879))

(declare-fun m!51881 () Bool)

(assert (=> b!34711 m!51881))

(declare-fun m!51883 () Bool)

(assert (=> b!34711 m!51883))

(assert (=> b!34426 d!10024))

(declare-fun d!10026 () Bool)

(assert (=> d!10026 (validate_offset_bits!1 ((_ sign_extend 32) (size!836 (buf!1164 (_2!1822 lt!50794)))) ((_ sign_extend 32) (currentByte!2537 (_2!1822 lt!50802))) ((_ sign_extend 32) (currentBit!2532 (_2!1822 lt!50802))) lt!50786)))

(declare-fun lt!51377 () Unit!2551)

(assert (=> d!10026 (= lt!51377 (choose!9 (_2!1822 lt!50802) (buf!1164 (_2!1822 lt!50794)) lt!50786 (BitStream!1459 (buf!1164 (_2!1822 lt!50794)) (currentByte!2537 (_2!1822 lt!50802)) (currentBit!2532 (_2!1822 lt!50802)))))))

(assert (=> d!10026 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1822 lt!50802) (buf!1164 (_2!1822 lt!50794)) lt!50786) lt!51377)))

(declare-fun bs!2729 () Bool)

(assert (= bs!2729 d!10026))

(assert (=> bs!2729 m!51361))

(declare-fun m!51885 () Bool)

(assert (=> bs!2729 m!51885))

(assert (=> b!34426 d!10026))

(declare-fun d!10028 () Bool)

(assert (=> d!10028 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!836 (buf!1164 (_2!1822 lt!50794)))) ((_ sign_extend 32) (currentByte!2537 thiss!1379)) ((_ sign_extend 32) (currentBit!2532 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!836 (buf!1164 (_2!1822 lt!50794)))) ((_ sign_extend 32) (currentByte!2537 thiss!1379)) ((_ sign_extend 32) (currentBit!2532 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2730 () Bool)

(assert (= bs!2730 d!10028))

(declare-fun m!51887 () Bool)

(assert (=> bs!2730 m!51887))

(assert (=> b!34426 d!10028))

(declare-fun b!34716 () Bool)

(declare-fun e!22980 () Bool)

(declare-fun lt!51379 () List!430)

(assert (=> b!34716 (= e!22980 (isEmpty!93 lt!51379))))

(declare-fun b!34714 () Bool)

(declare-fun e!22981 () tuple2!3482)

(assert (=> b!34714 (= e!22981 (tuple2!3483 Nil!427 (_1!1823 lt!50787)))))

(declare-fun d!10030 () Bool)

(assert (=> d!10030 e!22980))

(declare-fun c!2325 () Bool)

(assert (=> d!10030 (= c!2325 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10030 (= lt!51379 (_1!1828 e!22981))))

(declare-fun c!2326 () Bool)

(assert (=> d!10030 (= c!2326 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10030 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10030 (= (bitStreamReadBitsIntoList!0 (_2!1822 lt!50794) (_1!1823 lt!50787) (bvsub to!314 i!635)) lt!51379)))

(declare-fun b!34717 () Bool)

(assert (=> b!34717 (= e!22980 (> (length!156 lt!51379) 0))))

(declare-fun lt!51380 () tuple2!3484)

(declare-fun lt!51378 () (_ BitVec 64))

(declare-fun b!34715 () Bool)

(assert (=> b!34715 (= e!22981 (tuple2!3483 (Cons!426 (_1!1829 lt!51380) (bitStreamReadBitsIntoList!0 (_2!1822 lt!50794) (_2!1829 lt!51380) (bvsub (bvsub to!314 i!635) lt!51378))) (_2!1829 lt!51380)))))

(assert (=> b!34715 (= lt!51380 (readBit!0 (_1!1823 lt!50787)))))

(assert (=> b!34715 (= lt!51378 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!10030 c!2326) b!34714))

(assert (= (and d!10030 (not c!2326)) b!34715))

(assert (= (and d!10030 c!2325) b!34716))

(assert (= (and d!10030 (not c!2325)) b!34717))

(declare-fun m!51889 () Bool)

(assert (=> b!34716 m!51889))

(declare-fun m!51891 () Bool)

(assert (=> b!34717 m!51891))

(declare-fun m!51893 () Bool)

(assert (=> b!34715 m!51893))

(declare-fun m!51895 () Bool)

(assert (=> b!34715 m!51895))

(assert (=> b!34426 d!10030))

(declare-fun d!10032 () Bool)

(assert (=> d!10032 (= (tail!147 lt!50799) (t!1180 lt!50799))))

(assert (=> b!34416 d!10032))

(declare-fun d!10034 () Bool)

(declare-fun e!22984 () Bool)

(assert (=> d!10034 e!22984))

(declare-fun res!29678 () Bool)

(assert (=> d!10034 (=> (not res!29678) (not e!22984))))

(declare-fun lt!51386 () (_ BitVec 64))

(assert (=> d!10034 (= res!29678 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!51386 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!51386) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!10034 (= lt!51386 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!51385 () Unit!2551)

(declare-fun choose!42 (BitStream!1458 BitStream!1458 BitStream!1458 BitStream!1458 (_ BitVec 64) List!430) Unit!2551)

(assert (=> d!10034 (= lt!51385 (choose!42 (_2!1822 lt!50794) (_2!1822 lt!50794) (_1!1823 lt!50787) (_1!1823 lt!50789) (bvsub to!314 i!635) lt!50799))))

(assert (=> d!10034 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10034 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1822 lt!50794) (_2!1822 lt!50794) (_1!1823 lt!50787) (_1!1823 lt!50789) (bvsub to!314 i!635) lt!50799) lt!51385)))

(declare-fun b!34720 () Bool)

(assert (=> b!34720 (= e!22984 (= (bitStreamReadBitsIntoList!0 (_2!1822 lt!50794) (_1!1823 lt!50789) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!147 lt!50799)))))

(assert (= (and d!10034 res!29678) b!34720))

(declare-fun m!51897 () Bool)

(assert (=> d!10034 m!51897))

(declare-fun m!51899 () Bool)

(assert (=> b!34720 m!51899))

(assert (=> b!34720 m!51311))

(assert (=> b!34416 d!10034))

(declare-fun d!10036 () Bool)

(assert (=> d!10036 (= (head!267 lt!50799) (h!545 lt!50799))))

(assert (=> b!34411 d!10036))

(declare-fun d!10038 () Bool)

(assert (=> d!10038 (= (bitAt!0 (buf!1164 (_2!1822 lt!50802)) lt!50803) (not (= (bvand ((_ sign_extend 24) (select (arr!1314 (buf!1164 (_2!1822 lt!50802))) ((_ extract 31 0) (bvsdiv lt!50803 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!50803 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2731 () Bool)

(assert (= bs!2731 d!10038))

(declare-fun m!51901 () Bool)

(assert (=> bs!2731 m!51901))

(declare-fun m!51903 () Bool)

(assert (=> bs!2731 m!51903))

(assert (=> b!34422 d!10038))

(declare-fun d!10040 () Bool)

(assert (=> d!10040 (= (array_inv!782 srcBuffer!2) (bvsge (size!836 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!7072 d!10040))

(declare-fun d!10042 () Bool)

(assert (=> d!10042 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2532 thiss!1379) (currentByte!2537 thiss!1379) (size!836 (buf!1164 thiss!1379))))))

(declare-fun bs!2732 () Bool)

(assert (= bs!2732 d!10042))

(assert (=> bs!2732 m!51821))

(assert (=> start!7072 d!10042))

(declare-fun d!10044 () Bool)

(assert (=> d!10044 (= (bitAt!0 (buf!1164 (_1!1823 lt!50789)) lt!50803) (not (= (bvand ((_ sign_extend 24) (select (arr!1314 (buf!1164 (_1!1823 lt!50789))) ((_ extract 31 0) (bvsdiv lt!50803 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!50803 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2733 () Bool)

(assert (= bs!2733 d!10044))

(declare-fun m!51905 () Bool)

(assert (=> bs!2733 m!51905))

(assert (=> bs!2733 m!51903))

(assert (=> b!34412 d!10044))

(declare-fun d!10046 () Bool)

(assert (=> d!10046 (= (bitAt!0 (buf!1164 (_1!1823 lt!50787)) lt!50803) (not (= (bvand ((_ sign_extend 24) (select (arr!1314 (buf!1164 (_1!1823 lt!50787))) ((_ extract 31 0) (bvsdiv lt!50803 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!50803 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2734 () Bool)

(assert (= bs!2734 d!10046))

(declare-fun m!51907 () Bool)

(assert (=> bs!2734 m!51907))

(assert (=> bs!2734 m!51903))

(assert (=> b!34412 d!10046))

(declare-fun d!10048 () Bool)

(assert (=> d!10048 (= (bitAt!0 (buf!1164 (_2!1822 lt!50794)) lt!50803) (not (= (bvand ((_ sign_extend 24) (select (arr!1314 (buf!1164 (_2!1822 lt!50794))) ((_ extract 31 0) (bvsdiv lt!50803 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!50803 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2735 () Bool)

(assert (= bs!2735 d!10048))

(declare-fun m!51909 () Bool)

(assert (=> bs!2735 m!51909))

(assert (=> bs!2735 m!51903))

(assert (=> b!34423 d!10048))

(declare-fun d!10050 () Bool)

(assert (=> d!10050 (= (bitAt!0 (buf!1164 (_2!1822 lt!50802)) lt!50803) (bitAt!0 (buf!1164 (_2!1822 lt!50794)) lt!50803))))

(declare-fun lt!51389 () Unit!2551)

(declare-fun choose!31 (array!1885 array!1885 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2551)

(assert (=> d!10050 (= lt!51389 (choose!31 (buf!1164 (_2!1822 lt!50802)) (buf!1164 (_2!1822 lt!50794)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!50803 lt!50782))))

(assert (=> d!10050 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!50782))))

(assert (=> d!10050 (= (arrayBitRangesEqImpliesEq!0 (buf!1164 (_2!1822 lt!50802)) (buf!1164 (_2!1822 lt!50794)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!50803 lt!50782) lt!51389)))

(declare-fun bs!2736 () Bool)

(assert (= bs!2736 d!10050))

(assert (=> bs!2736 m!51373))

(assert (=> bs!2736 m!51375))

(declare-fun m!51911 () Bool)

(assert (=> bs!2736 m!51911))

(assert (=> b!34423 d!10050))

(declare-fun d!10052 () Bool)

(assert (=> d!10052 (= (invariant!0 (currentBit!2532 (_2!1822 lt!50802)) (currentByte!2537 (_2!1822 lt!50802)) (size!836 (buf!1164 (_2!1822 lt!50794)))) (and (bvsge (currentBit!2532 (_2!1822 lt!50802)) #b00000000000000000000000000000000) (bvslt (currentBit!2532 (_2!1822 lt!50802)) #b00000000000000000000000000001000) (bvsge (currentByte!2537 (_2!1822 lt!50802)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2537 (_2!1822 lt!50802)) (size!836 (buf!1164 (_2!1822 lt!50794)))) (and (= (currentBit!2532 (_2!1822 lt!50802)) #b00000000000000000000000000000000) (= (currentByte!2537 (_2!1822 lt!50802)) (size!836 (buf!1164 (_2!1822 lt!50794))))))))))

(assert (=> b!34413 d!10052))

(declare-fun d!10054 () Bool)

(assert (=> d!10054 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!836 (buf!1164 thiss!1379))) ((_ sign_extend 32) (currentByte!2537 thiss!1379)) ((_ sign_extend 32) (currentBit!2532 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!836 (buf!1164 thiss!1379))) ((_ sign_extend 32) (currentByte!2537 thiss!1379)) ((_ sign_extend 32) (currentBit!2532 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2737 () Bool)

(assert (= bs!2737 d!10054))

(assert (=> bs!2737 m!51819))

(assert (=> b!34424 d!10054))

(check-sat (not d!10054) (not b!34690) (not d!9886) (not d!9888) (not d!10016) (not d!9896) (not d!9884) (not b!34559) (not d!9908) (not b!34712) (not d!9904) (not b!34674) (not b!34717) (not d!9912) (not b!34556) (not b!34529) (not d!10026) (not b!34678) (not b!34526) (not b!34530) (not b!34672) (not b!34693) (not b!34551) (not b!34702) (not b!34708) (not d!10050) (not b!34706) (not b!34504) (not b!34502) (not b!34507) (not b!34552) (not d!10010) (not b!34538) (not b!34525) (not b!34700) (not d!9900) (not d!10034) (not b!34720) (not d!10022) (not b!34705) (not d!9906) (not d!10014) (not b!34707) (not b!34549) (not b!34557) (not b!34691) (not b!34554) (not d!9878) (not b!34713) (not d!10012) (not b!34692) (not b!34711) (not b!34527) (not b!34715) (not b!34550) (not d!10020) (not b!34676) (not b!34703) (not b!34701) (not b!34671) (not b!34532) (not d!10018) (not b!34695) (not b!34716) (not b!34528) (not b!34531) (not b!34675) (not bm!427) (not d!10042) (not d!10028) (not b!34680))
(check-sat)
