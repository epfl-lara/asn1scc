; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8082 () Bool)

(assert start!8082)

(declare-fun b!40394 () Bool)

(declare-fun e!26593 () Bool)

(declare-fun e!26598 () Bool)

(assert (=> b!40394 (= e!26593 e!26598)))

(declare-fun res!34355 () Bool)

(assert (=> b!40394 (=> res!34355 e!26598)))

(declare-fun lt!61528 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun lt!61524 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!40394 (= res!34355 (not (= lt!61528 (bvsub (bvadd lt!61524 to!314) i!635))))))

(declare-datatypes ((array!2004 0))(
  ( (array!2005 (arr!1405 (Array (_ BitVec 32) (_ BitVec 8))) (size!906 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1556 0))(
  ( (BitStream!1557 (buf!1234 array!2004) (currentByte!2652 (_ BitVec 32)) (currentBit!2647 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2857 0))(
  ( (Unit!2858) )
))
(declare-datatypes ((tuple2!3880 0))(
  ( (tuple2!3881 (_1!2027 Unit!2857) (_2!2027 BitStream!1556)) )
))
(declare-fun lt!61527 () tuple2!3880)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!40394 (= lt!61528 (bitIndex!0 (size!906 (buf!1234 (_2!2027 lt!61527))) (currentByte!2652 (_2!2027 lt!61527)) (currentBit!2647 (_2!2027 lt!61527))))))

(declare-fun b!40395 () Bool)

(declare-fun e!26600 () Bool)

(declare-fun thiss!1379 () BitStream!1556)

(declare-fun array_inv!831 (array!2004) Bool)

(assert (=> b!40395 (= e!26600 (array_inv!831 (buf!1234 thiss!1379)))))

(declare-fun b!40396 () Bool)

(declare-fun e!26601 () Bool)

(declare-fun e!26597 () Bool)

(assert (=> b!40396 (= e!26601 e!26597)))

(declare-fun res!34357 () Bool)

(assert (=> b!40396 (=> res!34357 e!26597)))

(assert (=> b!40396 (= res!34357 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((List!479 0))(
  ( (Nil!476) (Cons!475 (h!594 Bool) (t!1229 List!479)) )
))
(declare-fun lt!61536 () List!479)

(declare-fun lt!61535 () (_ BitVec 64))

(declare-datatypes ((tuple2!3882 0))(
  ( (tuple2!3883 (_1!2028 BitStream!1556) (_2!2028 BitStream!1556)) )
))
(declare-fun lt!61521 () tuple2!3882)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1556 BitStream!1556 (_ BitVec 64)) List!479)

(assert (=> b!40396 (= lt!61536 (bitStreamReadBitsIntoList!0 (_2!2027 lt!61527) (_1!2028 lt!61521) lt!61535))))

(declare-fun lt!61522 () tuple2!3882)

(declare-fun lt!61515 () List!479)

(assert (=> b!40396 (= lt!61515 (bitStreamReadBitsIntoList!0 (_2!2027 lt!61527) (_1!2028 lt!61522) (bvsub to!314 i!635)))))

(declare-fun lt!61518 () tuple2!3880)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!40396 (validate_offset_bits!1 ((_ sign_extend 32) (size!906 (buf!1234 (_2!2027 lt!61527)))) ((_ sign_extend 32) (currentByte!2652 (_2!2027 lt!61518))) ((_ sign_extend 32) (currentBit!2647 (_2!2027 lt!61518))) lt!61535)))

(declare-fun lt!61529 () Unit!2857)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1556 array!2004 (_ BitVec 64)) Unit!2857)

(assert (=> b!40396 (= lt!61529 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2027 lt!61518) (buf!1234 (_2!2027 lt!61527)) lt!61535))))

(declare-fun reader!0 (BitStream!1556 BitStream!1556) tuple2!3882)

(assert (=> b!40396 (= lt!61521 (reader!0 (_2!2027 lt!61518) (_2!2027 lt!61527)))))

(assert (=> b!40396 (validate_offset_bits!1 ((_ sign_extend 32) (size!906 (buf!1234 (_2!2027 lt!61527)))) ((_ sign_extend 32) (currentByte!2652 thiss!1379)) ((_ sign_extend 32) (currentBit!2647 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!61525 () Unit!2857)

(assert (=> b!40396 (= lt!61525 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1234 (_2!2027 lt!61527)) (bvsub to!314 i!635)))))

(assert (=> b!40396 (= lt!61522 (reader!0 thiss!1379 (_2!2027 lt!61527)))))

(declare-fun b!40397 () Bool)

(declare-fun e!26602 () Bool)

(assert (=> b!40397 (= e!26602 true)))

(declare-datatypes ((tuple2!3884 0))(
  ( (tuple2!3885 (_1!2029 BitStream!1556) (_2!2029 Bool)) )
))
(declare-fun lt!61513 () tuple2!3884)

(declare-fun readBitPure!0 (BitStream!1556) tuple2!3884)

(assert (=> b!40397 (= lt!61513 (readBitPure!0 (_1!2028 lt!61522)))))

(declare-fun b!40398 () Bool)

(declare-fun res!34341 () Bool)

(assert (=> b!40398 (=> res!34341 e!26597)))

(declare-fun length!205 (List!479) Int)

(assert (=> b!40398 (= res!34341 (<= (length!205 lt!61515) 0))))

(declare-fun b!40399 () Bool)

(declare-fun e!26606 () Bool)

(declare-fun e!26596 () Bool)

(assert (=> b!40399 (= e!26606 e!26596)))

(declare-fun res!34358 () Bool)

(assert (=> b!40399 (=> res!34358 e!26596)))

(declare-fun isPrefixOf!0 (BitStream!1556 BitStream!1556) Bool)

(assert (=> b!40399 (= res!34358 (not (isPrefixOf!0 thiss!1379 (_2!2027 lt!61518))))))

(assert (=> b!40399 (validate_offset_bits!1 ((_ sign_extend 32) (size!906 (buf!1234 (_2!2027 lt!61518)))) ((_ sign_extend 32) (currentByte!2652 (_2!2027 lt!61518))) ((_ sign_extend 32) (currentBit!2647 (_2!2027 lt!61518))) lt!61535)))

(assert (=> b!40399 (= lt!61535 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!61519 () Unit!2857)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1556 BitStream!1556 (_ BitVec 64) (_ BitVec 64)) Unit!2857)

(assert (=> b!40399 (= lt!61519 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2027 lt!61518) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2004)

(declare-fun appendBitFromByte!0 (BitStream!1556 (_ BitVec 8) (_ BitVec 32)) tuple2!3880)

(assert (=> b!40399 (= lt!61518 (appendBitFromByte!0 thiss!1379 (select (arr!1405 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!40400 () Bool)

(assert (=> b!40400 (= e!26596 e!26593)))

(declare-fun res!34348 () Bool)

(assert (=> b!40400 (=> res!34348 e!26593)))

(assert (=> b!40400 (= res!34348 (not (isPrefixOf!0 (_2!2027 lt!61518) (_2!2027 lt!61527))))))

(assert (=> b!40400 (isPrefixOf!0 thiss!1379 (_2!2027 lt!61527))))

(declare-fun lt!61517 () Unit!2857)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1556 BitStream!1556 BitStream!1556) Unit!2857)

(assert (=> b!40400 (= lt!61517 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2027 lt!61518) (_2!2027 lt!61527)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1556 array!2004 (_ BitVec 64) (_ BitVec 64)) tuple2!3880)

(assert (=> b!40400 (= lt!61527 (appendBitsMSBFirstLoop!0 (_2!2027 lt!61518) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!26605 () Bool)

(assert (=> b!40400 e!26605))

(declare-fun res!34349 () Bool)

(assert (=> b!40400 (=> (not res!34349) (not e!26605))))

(assert (=> b!40400 (= res!34349 (validate_offset_bits!1 ((_ sign_extend 32) (size!906 (buf!1234 (_2!2027 lt!61518)))) ((_ sign_extend 32) (currentByte!2652 thiss!1379)) ((_ sign_extend 32) (currentBit!2647 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!61520 () Unit!2857)

(assert (=> b!40400 (= lt!61520 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1234 (_2!2027 lt!61518)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!61533 () tuple2!3882)

(assert (=> b!40400 (= lt!61533 (reader!0 thiss!1379 (_2!2027 lt!61518)))))

(declare-fun b!40401 () Bool)

(declare-fun e!26594 () Bool)

(assert (=> b!40401 (= e!26594 e!26602)))

(declare-fun res!34347 () Bool)

(assert (=> b!40401 (=> res!34347 e!26602)))

(declare-fun lt!61537 () Bool)

(declare-fun lt!61516 () Bool)

(assert (=> b!40401 (= res!34347 (not (= lt!61537 lt!61516)))))

(declare-fun lt!61534 () Bool)

(assert (=> b!40401 (= lt!61534 lt!61537)))

(declare-fun bitAt!0 (array!2004 (_ BitVec 64)) Bool)

(assert (=> b!40401 (= lt!61537 (bitAt!0 (buf!1234 (_2!2027 lt!61527)) lt!61524))))

(declare-fun lt!61530 () Unit!2857)

(declare-fun lt!61532 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2004 array!2004 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2857)

(assert (=> b!40401 (= lt!61530 (arrayBitRangesEqImpliesEq!0 (buf!1234 (_2!2027 lt!61518)) (buf!1234 (_2!2027 lt!61527)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!61524 lt!61532))))

(declare-fun res!34344 () Bool)

(declare-fun e!26608 () Bool)

(assert (=> start!8082 (=> (not res!34344) (not e!26608))))

(assert (=> start!8082 (= res!34344 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!906 srcBuffer!2))))))))

(assert (=> start!8082 e!26608))

(assert (=> start!8082 true))

(assert (=> start!8082 (array_inv!831 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1556) Bool)

(assert (=> start!8082 (and (inv!12 thiss!1379) e!26600)))

(declare-fun b!40402 () Bool)

(declare-fun res!34351 () Bool)

(declare-fun e!26603 () Bool)

(assert (=> b!40402 (=> res!34351 e!26603)))

(declare-fun lt!61526 () Bool)

(declare-fun head!316 (List!479) Bool)

(assert (=> b!40402 (= res!34351 (not (= (head!316 lt!61515) lt!61526)))))

(declare-fun b!40403 () Bool)

(declare-fun e!26604 () Bool)

(assert (=> b!40403 (= e!26604 e!26594)))

(declare-fun res!34343 () Bool)

(assert (=> b!40403 (=> res!34343 e!26594)))

(assert (=> b!40403 (= res!34343 (not (= lt!61534 lt!61516)))))

(assert (=> b!40403 (= lt!61534 (bitAt!0 (buf!1234 (_2!2027 lt!61518)) lt!61524))))

(declare-fun b!40404 () Bool)

(declare-fun res!34345 () Bool)

(assert (=> b!40404 (=> res!34345 e!26598)))

(assert (=> b!40404 (= res!34345 (not (= (size!906 (buf!1234 thiss!1379)) (size!906 (buf!1234 (_2!2027 lt!61527))))))))

(declare-fun b!40405 () Bool)

(declare-fun res!34356 () Bool)

(assert (=> b!40405 (=> res!34356 e!26601)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!40405 (= res!34356 (not (invariant!0 (currentBit!2647 (_2!2027 lt!61518)) (currentByte!2652 (_2!2027 lt!61518)) (size!906 (buf!1234 (_2!2027 lt!61518))))))))

(declare-fun b!40406 () Bool)

(declare-fun e!26599 () Bool)

(assert (=> b!40406 (= e!26597 e!26599)))

(declare-fun res!34352 () Bool)

(assert (=> b!40406 (=> res!34352 e!26599)))

(declare-fun lt!61531 () List!479)

(assert (=> b!40406 (= res!34352 (not (= lt!61531 lt!61536)))))

(assert (=> b!40406 (= lt!61536 lt!61531)))

(declare-fun tail!196 (List!479) List!479)

(assert (=> b!40406 (= lt!61531 (tail!196 lt!61515))))

(declare-fun lt!61523 () Unit!2857)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1556 BitStream!1556 BitStream!1556 BitStream!1556 (_ BitVec 64) List!479) Unit!2857)

(assert (=> b!40406 (= lt!61523 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2027 lt!61527) (_2!2027 lt!61527) (_1!2028 lt!61522) (_1!2028 lt!61521) (bvsub to!314 i!635) lt!61515))))

(declare-fun b!40407 () Bool)

(declare-fun res!34340 () Bool)

(assert (=> b!40407 (=> res!34340 e!26601)))

(assert (=> b!40407 (= res!34340 (not (invariant!0 (currentBit!2647 (_2!2027 lt!61518)) (currentByte!2652 (_2!2027 lt!61518)) (size!906 (buf!1234 (_2!2027 lt!61527))))))))

(declare-fun b!40408 () Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1556 array!2004 (_ BitVec 64) (_ BitVec 64)) List!479)

(assert (=> b!40408 (= e!26605 (= (head!316 (byteArrayBitContentToList!0 (_2!2027 lt!61518) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!316 (bitStreamReadBitsIntoList!0 (_2!2027 lt!61518) (_1!2028 lt!61533) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!40409 () Bool)

(assert (=> b!40409 (= e!26608 (not e!26606))))

(declare-fun res!34354 () Bool)

(assert (=> b!40409 (=> res!34354 e!26606)))

(assert (=> b!40409 (= res!34354 (bvsge i!635 to!314))))

(assert (=> b!40409 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!61514 () Unit!2857)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1556) Unit!2857)

(assert (=> b!40409 (= lt!61514 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!40409 (= lt!61524 (bitIndex!0 (size!906 (buf!1234 thiss!1379)) (currentByte!2652 thiss!1379) (currentBit!2647 thiss!1379)))))

(declare-fun b!40410 () Bool)

(assert (=> b!40410 (= e!26603 e!26604)))

(declare-fun res!34353 () Bool)

(assert (=> b!40410 (=> res!34353 e!26604)))

(assert (=> b!40410 (= res!34353 (not (= (head!316 (byteArrayBitContentToList!0 (_2!2027 lt!61527) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!61516)))))

(assert (=> b!40410 (= lt!61516 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!40411 () Bool)

(declare-fun res!34359 () Bool)

(assert (=> b!40411 (=> res!34359 e!26598)))

(assert (=> b!40411 (= res!34359 (not (invariant!0 (currentBit!2647 (_2!2027 lt!61527)) (currentByte!2652 (_2!2027 lt!61527)) (size!906 (buf!1234 (_2!2027 lt!61527))))))))

(declare-fun b!40412 () Bool)

(declare-fun res!34346 () Bool)

(assert (=> b!40412 (=> (not res!34346) (not e!26608))))

(assert (=> b!40412 (= res!34346 (validate_offset_bits!1 ((_ sign_extend 32) (size!906 (buf!1234 thiss!1379))) ((_ sign_extend 32) (currentByte!2652 thiss!1379)) ((_ sign_extend 32) (currentBit!2647 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!40413 () Bool)

(assert (=> b!40413 (= e!26599 e!26603)))

(declare-fun res!34350 () Bool)

(assert (=> b!40413 (=> res!34350 e!26603)))

(assert (=> b!40413 (= res!34350 (not (= lt!61526 (bitAt!0 (buf!1234 (_1!2028 lt!61521)) lt!61524))))))

(assert (=> b!40413 (= lt!61526 (bitAt!0 (buf!1234 (_1!2028 lt!61522)) lt!61524))))

(declare-fun b!40414 () Bool)

(assert (=> b!40414 (= e!26598 e!26601)))

(declare-fun res!34342 () Bool)

(assert (=> b!40414 (=> res!34342 e!26601)))

(assert (=> b!40414 (= res!34342 (not (= (size!906 (buf!1234 (_2!2027 lt!61518))) (size!906 (buf!1234 (_2!2027 lt!61527))))))))

(assert (=> b!40414 (= lt!61528 (bvsub (bvsub (bvadd lt!61532 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!40414 (= lt!61532 (bitIndex!0 (size!906 (buf!1234 (_2!2027 lt!61518))) (currentByte!2652 (_2!2027 lt!61518)) (currentBit!2647 (_2!2027 lt!61518))))))

(assert (=> b!40414 (= (size!906 (buf!1234 (_2!2027 lt!61527))) (size!906 (buf!1234 thiss!1379)))))

(assert (= (and start!8082 res!34344) b!40412))

(assert (= (and b!40412 res!34346) b!40409))

(assert (= (and b!40409 (not res!34354)) b!40399))

(assert (= (and b!40399 (not res!34358)) b!40400))

(assert (= (and b!40400 res!34349) b!40408))

(assert (= (and b!40400 (not res!34348)) b!40394))

(assert (= (and b!40394 (not res!34355)) b!40411))

(assert (= (and b!40411 (not res!34359)) b!40404))

(assert (= (and b!40404 (not res!34345)) b!40414))

(assert (= (and b!40414 (not res!34342)) b!40405))

(assert (= (and b!40405 (not res!34356)) b!40407))

(assert (= (and b!40407 (not res!34340)) b!40396))

(assert (= (and b!40396 (not res!34357)) b!40398))

(assert (= (and b!40398 (not res!34341)) b!40406))

(assert (= (and b!40406 (not res!34352)) b!40413))

(assert (= (and b!40413 (not res!34350)) b!40402))

(assert (= (and b!40402 (not res!34351)) b!40410))

(assert (= (and b!40410 (not res!34353)) b!40403))

(assert (= (and b!40403 (not res!34343)) b!40401))

(assert (= (and b!40401 (not res!34347)) b!40397))

(assert (= start!8082 b!40395))

(declare-fun m!61771 () Bool)

(assert (=> b!40394 m!61771))

(declare-fun m!61773 () Bool)

(assert (=> b!40413 m!61773))

(declare-fun m!61775 () Bool)

(assert (=> b!40413 m!61775))

(declare-fun m!61777 () Bool)

(assert (=> b!40414 m!61777))

(declare-fun m!61779 () Bool)

(assert (=> b!40399 m!61779))

(declare-fun m!61781 () Bool)

(assert (=> b!40399 m!61781))

(declare-fun m!61783 () Bool)

(assert (=> b!40399 m!61783))

(assert (=> b!40399 m!61779))

(declare-fun m!61785 () Bool)

(assert (=> b!40399 m!61785))

(declare-fun m!61787 () Bool)

(assert (=> b!40399 m!61787))

(declare-fun m!61789 () Bool)

(assert (=> b!40406 m!61789))

(declare-fun m!61791 () Bool)

(assert (=> b!40406 m!61791))

(declare-fun m!61793 () Bool)

(assert (=> b!40401 m!61793))

(declare-fun m!61795 () Bool)

(assert (=> b!40401 m!61795))

(declare-fun m!61797 () Bool)

(assert (=> b!40397 m!61797))

(declare-fun m!61799 () Bool)

(assert (=> b!40410 m!61799))

(assert (=> b!40410 m!61799))

(declare-fun m!61801 () Bool)

(assert (=> b!40410 m!61801))

(declare-fun m!61803 () Bool)

(assert (=> b!40410 m!61803))

(declare-fun m!61805 () Bool)

(assert (=> b!40411 m!61805))

(declare-fun m!61807 () Bool)

(assert (=> b!40395 m!61807))

(declare-fun m!61809 () Bool)

(assert (=> b!40407 m!61809))

(declare-fun m!61811 () Bool)

(assert (=> b!40408 m!61811))

(assert (=> b!40408 m!61811))

(declare-fun m!61813 () Bool)

(assert (=> b!40408 m!61813))

(declare-fun m!61815 () Bool)

(assert (=> b!40408 m!61815))

(assert (=> b!40408 m!61815))

(declare-fun m!61817 () Bool)

(assert (=> b!40408 m!61817))

(declare-fun m!61819 () Bool)

(assert (=> b!40398 m!61819))

(declare-fun m!61821 () Bool)

(assert (=> b!40402 m!61821))

(declare-fun m!61823 () Bool)

(assert (=> b!40412 m!61823))

(declare-fun m!61825 () Bool)

(assert (=> b!40400 m!61825))

(declare-fun m!61827 () Bool)

(assert (=> b!40400 m!61827))

(declare-fun m!61829 () Bool)

(assert (=> b!40400 m!61829))

(declare-fun m!61831 () Bool)

(assert (=> b!40400 m!61831))

(declare-fun m!61833 () Bool)

(assert (=> b!40400 m!61833))

(declare-fun m!61835 () Bool)

(assert (=> b!40400 m!61835))

(declare-fun m!61837 () Bool)

(assert (=> b!40400 m!61837))

(declare-fun m!61839 () Bool)

(assert (=> b!40409 m!61839))

(declare-fun m!61841 () Bool)

(assert (=> b!40409 m!61841))

(declare-fun m!61843 () Bool)

(assert (=> b!40409 m!61843))

(declare-fun m!61845 () Bool)

(assert (=> b!40396 m!61845))

(declare-fun m!61847 () Bool)

(assert (=> b!40396 m!61847))

(declare-fun m!61849 () Bool)

(assert (=> b!40396 m!61849))

(declare-fun m!61851 () Bool)

(assert (=> b!40396 m!61851))

(declare-fun m!61853 () Bool)

(assert (=> b!40396 m!61853))

(declare-fun m!61855 () Bool)

(assert (=> b!40396 m!61855))

(declare-fun m!61857 () Bool)

(assert (=> b!40396 m!61857))

(declare-fun m!61859 () Bool)

(assert (=> b!40396 m!61859))

(declare-fun m!61861 () Bool)

(assert (=> b!40405 m!61861))

(declare-fun m!61863 () Bool)

(assert (=> b!40403 m!61863))

(declare-fun m!61865 () Bool)

(assert (=> start!8082 m!61865))

(declare-fun m!61867 () Bool)

(assert (=> start!8082 m!61867))

(push 1)

(assert (not b!40414))

(assert (not b!40408))

(assert (not b!40394))

(assert (not b!40397))

(assert (not b!40398))

(assert (not b!40406))

(assert (not start!8082))

(assert (not b!40413))

(assert (not b!40400))

(assert (not b!40403))

(assert (not b!40412))

(assert (not b!40396))

(assert (not b!40409))

(assert (not b!40401))

(assert (not b!40407))

(assert (not b!40405))

(assert (not b!40410))

(assert (not b!40411))

(assert (not b!40402))

(assert (not b!40399))

(assert (not b!40395))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

