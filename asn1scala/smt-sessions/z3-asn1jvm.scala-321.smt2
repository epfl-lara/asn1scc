; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6922 () Bool)

(assert start!6922)

(declare-fun b!33370 () Bool)

(declare-fun e!22138 () Bool)

(assert (=> b!33370 (= e!22138 true)))

(declare-datatypes ((List!418 0))(
  ( (Nil!415) (Cons!414 (h!533 Bool) (t!1168 List!418)) )
))
(declare-fun lt!49091 () List!418)

(declare-fun lt!49083 () List!418)

(declare-fun tail!135 (List!418) List!418)

(assert (=> b!33370 (= lt!49091 (tail!135 lt!49083))))

(declare-datatypes ((array!1858 0))(
  ( (array!1859 (arr!1296 (Array (_ BitVec 32) (_ BitVec 8))) (size!821 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1434 0))(
  ( (BitStream!1435 (buf!1149 array!1858) (currentByte!2516 (_ BitVec 32)) (currentBit!2511 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3398 0))(
  ( (tuple2!3399 (_1!1786 BitStream!1434) (_2!1786 BitStream!1434)) )
))
(declare-fun lt!49086 () tuple2!3398)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((Unit!2497 0))(
  ( (Unit!2498) )
))
(declare-fun lt!49087 () Unit!2497)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!49079 () tuple2!3398)

(declare-datatypes ((tuple2!3400 0))(
  ( (tuple2!3401 (_1!1787 Unit!2497) (_2!1787 BitStream!1434)) )
))
(declare-fun lt!49082 () tuple2!3400)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1434 BitStream!1434 BitStream!1434 BitStream!1434 (_ BitVec 64) List!418) Unit!2497)

(assert (=> b!33370 (= lt!49087 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1787 lt!49082) (_2!1787 lt!49082) (_1!1786 lt!49079) (_1!1786 lt!49086) (bvsub to!314 i!635) lt!49083))))

(declare-fun b!33371 () Bool)

(declare-fun res!28580 () Bool)

(declare-fun e!22133 () Bool)

(assert (=> b!33371 (=> res!28580 e!22133)))

(declare-fun lt!49089 () tuple2!3400)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!33371 (= res!28580 (not (invariant!0 (currentBit!2511 (_2!1787 lt!49089)) (currentByte!2516 (_2!1787 lt!49089)) (size!821 (buf!1149 (_2!1787 lt!49082))))))))

(declare-fun b!33372 () Bool)

(declare-fun e!22136 () Bool)

(declare-fun e!22141 () Bool)

(assert (=> b!33372 (= e!22136 (not e!22141))))

(declare-fun res!28593 () Bool)

(assert (=> b!33372 (=> res!28593 e!22141)))

(assert (=> b!33372 (= res!28593 (bvsge i!635 to!314))))

(declare-fun thiss!1379 () BitStream!1434)

(declare-fun isPrefixOf!0 (BitStream!1434 BitStream!1434) Bool)

(assert (=> b!33372 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!49081 () Unit!2497)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1434) Unit!2497)

(assert (=> b!33372 (= lt!49081 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!49080 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!33372 (= lt!49080 (bitIndex!0 (size!821 (buf!1149 thiss!1379)) (currentByte!2516 thiss!1379) (currentBit!2511 thiss!1379)))))

(declare-fun b!33373 () Bool)

(declare-fun res!28587 () Bool)

(assert (=> b!33373 (=> res!28587 e!22133)))

(assert (=> b!33373 (= res!28587 (not (invariant!0 (currentBit!2511 (_2!1787 lt!49089)) (currentByte!2516 (_2!1787 lt!49089)) (size!821 (buf!1149 (_2!1787 lt!49089))))))))

(declare-fun b!33374 () Bool)

(declare-fun e!22130 () Bool)

(assert (=> b!33374 (= e!22130 e!22133)))

(declare-fun res!28582 () Bool)

(assert (=> b!33374 (=> res!28582 e!22133)))

(assert (=> b!33374 (= res!28582 (not (= (size!821 (buf!1149 (_2!1787 lt!49089))) (size!821 (buf!1149 (_2!1787 lt!49082))))))))

(declare-fun e!22135 () Bool)

(assert (=> b!33374 e!22135))

(declare-fun res!28589 () Bool)

(assert (=> b!33374 (=> (not res!28589) (not e!22135))))

(assert (=> b!33374 (= res!28589 (= (size!821 (buf!1149 (_2!1787 lt!49082))) (size!821 (buf!1149 thiss!1379))))))

(declare-fun b!33375 () Bool)

(declare-fun res!28591 () Bool)

(assert (=> b!33375 (=> res!28591 e!22138)))

(declare-fun length!144 (List!418) Int)

(assert (=> b!33375 (= res!28591 (<= (length!144 lt!49083) 0))))

(declare-fun b!33377 () Bool)

(declare-fun res!28590 () Bool)

(assert (=> b!33377 (=> (not res!28590) (not e!22136))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!33377 (= res!28590 (validate_offset_bits!1 ((_ sign_extend 32) (size!821 (buf!1149 thiss!1379))) ((_ sign_extend 32) (currentByte!2516 thiss!1379)) ((_ sign_extend 32) (currentBit!2511 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!33378 () Bool)

(declare-fun e!22139 () Bool)

(declare-fun array_inv!770 (array!1858) Bool)

(assert (=> b!33378 (= e!22139 (array_inv!770 (buf!1149 thiss!1379)))))

(declare-fun b!33379 () Bool)

(declare-fun e!22140 () Bool)

(assert (=> b!33379 (= e!22141 e!22140)))

(declare-fun res!28579 () Bool)

(assert (=> b!33379 (=> res!28579 e!22140)))

(assert (=> b!33379 (= res!28579 (not (isPrefixOf!0 thiss!1379 (_2!1787 lt!49089))))))

(declare-fun lt!49092 () (_ BitVec 64))

(assert (=> b!33379 (validate_offset_bits!1 ((_ sign_extend 32) (size!821 (buf!1149 (_2!1787 lt!49089)))) ((_ sign_extend 32) (currentByte!2516 (_2!1787 lt!49089))) ((_ sign_extend 32) (currentBit!2511 (_2!1787 lt!49089))) lt!49092)))

(assert (=> b!33379 (= lt!49092 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!49085 () Unit!2497)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1434 BitStream!1434 (_ BitVec 64) (_ BitVec 64)) Unit!2497)

(assert (=> b!33379 (= lt!49085 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1787 lt!49089) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1858)

(declare-fun appendBitFromByte!0 (BitStream!1434 (_ BitVec 8) (_ BitVec 32)) tuple2!3400)

(assert (=> b!33379 (= lt!49089 (appendBitFromByte!0 thiss!1379 (select (arr!1296 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!49078 () tuple2!3398)

(declare-fun b!33380 () Bool)

(declare-fun e!22137 () Bool)

(declare-fun head!255 (List!418) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1434 array!1858 (_ BitVec 64) (_ BitVec 64)) List!418)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1434 BitStream!1434 (_ BitVec 64)) List!418)

(assert (=> b!33380 (= e!22137 (= (head!255 (byteArrayBitContentToList!0 (_2!1787 lt!49089) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!255 (bitStreamReadBitsIntoList!0 (_2!1787 lt!49089) (_1!1786 lt!49078) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!33381 () Bool)

(declare-fun lt!49088 () (_ BitVec 64))

(assert (=> b!33381 (= e!22135 (= lt!49088 (bvsub (bvsub (bvadd (bitIndex!0 (size!821 (buf!1149 (_2!1787 lt!49089))) (currentByte!2516 (_2!1787 lt!49089)) (currentBit!2511 (_2!1787 lt!49089))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!33382 () Bool)

(declare-fun res!28581 () Bool)

(assert (=> b!33382 (=> res!28581 e!22130)))

(assert (=> b!33382 (= res!28581 (not (= (size!821 (buf!1149 thiss!1379)) (size!821 (buf!1149 (_2!1787 lt!49082))))))))

(declare-fun b!33383 () Bool)

(declare-fun e!22134 () Bool)

(assert (=> b!33383 (= e!22134 e!22130)))

(declare-fun res!28586 () Bool)

(assert (=> b!33383 (=> res!28586 e!22130)))

(assert (=> b!33383 (= res!28586 (not (= lt!49088 (bvsub (bvadd lt!49080 to!314) i!635))))))

(assert (=> b!33383 (= lt!49088 (bitIndex!0 (size!821 (buf!1149 (_2!1787 lt!49082))) (currentByte!2516 (_2!1787 lt!49082)) (currentBit!2511 (_2!1787 lt!49082))))))

(declare-fun res!28584 () Bool)

(assert (=> start!6922 (=> (not res!28584) (not e!22136))))

(assert (=> start!6922 (= res!28584 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!821 srcBuffer!2))))))))

(assert (=> start!6922 e!22136))

(assert (=> start!6922 true))

(assert (=> start!6922 (array_inv!770 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1434) Bool)

(assert (=> start!6922 (and (inv!12 thiss!1379) e!22139)))

(declare-fun b!33376 () Bool)

(assert (=> b!33376 (= e!22133 e!22138)))

(declare-fun res!28583 () Bool)

(assert (=> b!33376 (=> res!28583 e!22138)))

(assert (=> b!33376 (= res!28583 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!33376 (= lt!49091 (bitStreamReadBitsIntoList!0 (_2!1787 lt!49082) (_1!1786 lt!49086) lt!49092))))

(assert (=> b!33376 (= lt!49083 (bitStreamReadBitsIntoList!0 (_2!1787 lt!49082) (_1!1786 lt!49079) (bvsub to!314 i!635)))))

(assert (=> b!33376 (validate_offset_bits!1 ((_ sign_extend 32) (size!821 (buf!1149 (_2!1787 lt!49082)))) ((_ sign_extend 32) (currentByte!2516 (_2!1787 lt!49089))) ((_ sign_extend 32) (currentBit!2511 (_2!1787 lt!49089))) lt!49092)))

(declare-fun lt!49090 () Unit!2497)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1434 array!1858 (_ BitVec 64)) Unit!2497)

(assert (=> b!33376 (= lt!49090 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1787 lt!49089) (buf!1149 (_2!1787 lt!49082)) lt!49092))))

(declare-fun reader!0 (BitStream!1434 BitStream!1434) tuple2!3398)

(assert (=> b!33376 (= lt!49086 (reader!0 (_2!1787 lt!49089) (_2!1787 lt!49082)))))

(assert (=> b!33376 (validate_offset_bits!1 ((_ sign_extend 32) (size!821 (buf!1149 (_2!1787 lt!49082)))) ((_ sign_extend 32) (currentByte!2516 thiss!1379)) ((_ sign_extend 32) (currentBit!2511 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!49077 () Unit!2497)

(assert (=> b!33376 (= lt!49077 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1149 (_2!1787 lt!49082)) (bvsub to!314 i!635)))))

(assert (=> b!33376 (= lt!49079 (reader!0 thiss!1379 (_2!1787 lt!49082)))))

(declare-fun b!33384 () Bool)

(declare-fun res!28585 () Bool)

(assert (=> b!33384 (=> res!28585 e!22130)))

(assert (=> b!33384 (= res!28585 (not (invariant!0 (currentBit!2511 (_2!1787 lt!49082)) (currentByte!2516 (_2!1787 lt!49082)) (size!821 (buf!1149 (_2!1787 lt!49082))))))))

(declare-fun b!33385 () Bool)

(assert (=> b!33385 (= e!22140 e!22134)))

(declare-fun res!28592 () Bool)

(assert (=> b!33385 (=> res!28592 e!22134)))

(assert (=> b!33385 (= res!28592 (not (isPrefixOf!0 (_2!1787 lt!49089) (_2!1787 lt!49082))))))

(assert (=> b!33385 (isPrefixOf!0 thiss!1379 (_2!1787 lt!49082))))

(declare-fun lt!49084 () Unit!2497)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1434 BitStream!1434 BitStream!1434) Unit!2497)

(assert (=> b!33385 (= lt!49084 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1787 lt!49089) (_2!1787 lt!49082)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1434 array!1858 (_ BitVec 64) (_ BitVec 64)) tuple2!3400)

(assert (=> b!33385 (= lt!49082 (appendBitsMSBFirstLoop!0 (_2!1787 lt!49089) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!33385 e!22137))

(declare-fun res!28588 () Bool)

(assert (=> b!33385 (=> (not res!28588) (not e!22137))))

(assert (=> b!33385 (= res!28588 (validate_offset_bits!1 ((_ sign_extend 32) (size!821 (buf!1149 (_2!1787 lt!49089)))) ((_ sign_extend 32) (currentByte!2516 thiss!1379)) ((_ sign_extend 32) (currentBit!2511 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!49093 () Unit!2497)

(assert (=> b!33385 (= lt!49093 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1149 (_2!1787 lt!49089)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!33385 (= lt!49078 (reader!0 thiss!1379 (_2!1787 lt!49089)))))

(assert (= (and start!6922 res!28584) b!33377))

(assert (= (and b!33377 res!28590) b!33372))

(assert (= (and b!33372 (not res!28593)) b!33379))

(assert (= (and b!33379 (not res!28579)) b!33385))

(assert (= (and b!33385 res!28588) b!33380))

(assert (= (and b!33385 (not res!28592)) b!33383))

(assert (= (and b!33383 (not res!28586)) b!33384))

(assert (= (and b!33384 (not res!28585)) b!33382))

(assert (= (and b!33382 (not res!28581)) b!33374))

(assert (= (and b!33374 res!28589) b!33381))

(assert (= (and b!33374 (not res!28582)) b!33373))

(assert (= (and b!33373 (not res!28587)) b!33371))

(assert (= (and b!33371 (not res!28580)) b!33376))

(assert (= (and b!33376 (not res!28583)) b!33375))

(assert (= (and b!33375 (not res!28591)) b!33370))

(assert (= start!6922 b!33378))

(declare-fun m!49485 () Bool)

(assert (=> b!33385 m!49485))

(declare-fun m!49487 () Bool)

(assert (=> b!33385 m!49487))

(declare-fun m!49489 () Bool)

(assert (=> b!33385 m!49489))

(declare-fun m!49491 () Bool)

(assert (=> b!33385 m!49491))

(declare-fun m!49493 () Bool)

(assert (=> b!33385 m!49493))

(declare-fun m!49495 () Bool)

(assert (=> b!33385 m!49495))

(declare-fun m!49497 () Bool)

(assert (=> b!33385 m!49497))

(declare-fun m!49499 () Bool)

(assert (=> b!33371 m!49499))

(declare-fun m!49501 () Bool)

(assert (=> b!33370 m!49501))

(declare-fun m!49503 () Bool)

(assert (=> b!33370 m!49503))

(declare-fun m!49505 () Bool)

(assert (=> b!33381 m!49505))

(declare-fun m!49507 () Bool)

(assert (=> b!33377 m!49507))

(declare-fun m!49509 () Bool)

(assert (=> b!33372 m!49509))

(declare-fun m!49511 () Bool)

(assert (=> b!33372 m!49511))

(declare-fun m!49513 () Bool)

(assert (=> b!33372 m!49513))

(declare-fun m!49515 () Bool)

(assert (=> b!33379 m!49515))

(assert (=> b!33379 m!49515))

(declare-fun m!49517 () Bool)

(assert (=> b!33379 m!49517))

(declare-fun m!49519 () Bool)

(assert (=> b!33379 m!49519))

(declare-fun m!49521 () Bool)

(assert (=> b!33379 m!49521))

(declare-fun m!49523 () Bool)

(assert (=> b!33379 m!49523))

(declare-fun m!49525 () Bool)

(assert (=> b!33375 m!49525))

(declare-fun m!49527 () Bool)

(assert (=> b!33376 m!49527))

(declare-fun m!49529 () Bool)

(assert (=> b!33376 m!49529))

(declare-fun m!49531 () Bool)

(assert (=> b!33376 m!49531))

(declare-fun m!49533 () Bool)

(assert (=> b!33376 m!49533))

(declare-fun m!49535 () Bool)

(assert (=> b!33376 m!49535))

(declare-fun m!49537 () Bool)

(assert (=> b!33376 m!49537))

(declare-fun m!49539 () Bool)

(assert (=> b!33376 m!49539))

(declare-fun m!49541 () Bool)

(assert (=> b!33376 m!49541))

(declare-fun m!49543 () Bool)

(assert (=> b!33373 m!49543))

(declare-fun m!49545 () Bool)

(assert (=> b!33380 m!49545))

(assert (=> b!33380 m!49545))

(declare-fun m!49547 () Bool)

(assert (=> b!33380 m!49547))

(declare-fun m!49549 () Bool)

(assert (=> b!33380 m!49549))

(assert (=> b!33380 m!49549))

(declare-fun m!49551 () Bool)

(assert (=> b!33380 m!49551))

(declare-fun m!49553 () Bool)

(assert (=> b!33383 m!49553))

(declare-fun m!49555 () Bool)

(assert (=> b!33384 m!49555))

(declare-fun m!49557 () Bool)

(assert (=> b!33378 m!49557))

(declare-fun m!49559 () Bool)

(assert (=> start!6922 m!49559))

(declare-fun m!49561 () Bool)

(assert (=> start!6922 m!49561))

(check-sat (not b!33383) (not b!33376) (not b!33384) (not b!33378) (not b!33380) (not b!33372) (not b!33381) (not b!33379) (not b!33373) (not start!6922) (not b!33375) (not b!33371) (not b!33385) (not b!33370) (not b!33377))
