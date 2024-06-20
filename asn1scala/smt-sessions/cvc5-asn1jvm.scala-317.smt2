; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6896 () Bool)

(assert start!6896)

(declare-fun b!32746 () Bool)

(declare-fun res!27995 () Bool)

(declare-fun e!21673 () Bool)

(assert (=> b!32746 (=> res!27995 e!21673)))

(declare-datatypes ((List!405 0))(
  ( (Nil!402) (Cons!401 (h!520 Bool) (t!1155 List!405)) )
))
(declare-fun lt!48418 () List!405)

(declare-fun length!131 (List!405) Int)

(assert (=> b!32746 (= res!27995 (<= (length!131 lt!48418) 0))))

(declare-fun lt!48429 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun e!21664 () Bool)

(declare-fun to!314 () (_ BitVec 64))

(declare-datatypes ((array!1832 0))(
  ( (array!1833 (arr!1283 (Array (_ BitVec 32) (_ BitVec 8))) (size!808 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1408 0))(
  ( (BitStream!1409 (buf!1136 array!1832) (currentByte!2503 (_ BitVec 32)) (currentBit!2498 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2471 0))(
  ( (Unit!2472) )
))
(declare-datatypes ((tuple2!3346 0))(
  ( (tuple2!3347 (_1!1760 Unit!2471) (_2!1760 BitStream!1408)) )
))
(declare-fun lt!48415 () tuple2!3346)

(declare-fun b!32747 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!32747 (= e!21664 (= lt!48429 (bvsub (bvsub (bvadd (bitIndex!0 (size!808 (buf!1136 (_2!1760 lt!48415))) (currentByte!2503 (_2!1760 lt!48415)) (currentBit!2498 (_2!1760 lt!48415))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!32748 () Bool)

(declare-fun e!21663 () Bool)

(declare-fun e!21668 () Bool)

(assert (=> b!32748 (= e!21663 e!21668)))

(declare-fun res!28000 () Bool)

(assert (=> b!32748 (=> res!28000 e!21668)))

(declare-fun lt!48425 () tuple2!3346)

(assert (=> b!32748 (= res!28000 (not (= (size!808 (buf!1136 (_2!1760 lt!48415))) (size!808 (buf!1136 (_2!1760 lt!48425))))))))

(assert (=> b!32748 e!21664))

(declare-fun res!28004 () Bool)

(assert (=> b!32748 (=> (not res!28004) (not e!21664))))

(declare-fun thiss!1379 () BitStream!1408)

(assert (=> b!32748 (= res!28004 (= (size!808 (buf!1136 (_2!1760 lt!48425))) (size!808 (buf!1136 thiss!1379))))))

(declare-fun b!32749 () Bool)

(assert (=> b!32749 (= e!21673 true)))

(declare-fun lt!48414 () List!405)

(declare-fun tail!122 (List!405) List!405)

(assert (=> b!32749 (= lt!48414 (tail!122 lt!48418))))

(declare-datatypes ((tuple2!3348 0))(
  ( (tuple2!3349 (_1!1761 BitStream!1408) (_2!1761 BitStream!1408)) )
))
(declare-fun lt!48427 () tuple2!3348)

(declare-fun lt!48430 () Unit!2471)

(declare-fun lt!48428 () tuple2!3348)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1408 BitStream!1408 BitStream!1408 BitStream!1408 (_ BitVec 64) List!405) Unit!2471)

(assert (=> b!32749 (= lt!48430 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1760 lt!48425) (_2!1760 lt!48425) (_1!1761 lt!48428) (_1!1761 lt!48427) (bvsub to!314 i!635) lt!48418))))

(declare-fun b!32750 () Bool)

(declare-fun e!21666 () Bool)

(declare-fun e!21665 () Bool)

(assert (=> b!32750 (= e!21666 (not e!21665))))

(declare-fun res!27996 () Bool)

(assert (=> b!32750 (=> res!27996 e!21665)))

(assert (=> b!32750 (= res!27996 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1408 BitStream!1408) Bool)

(assert (=> b!32750 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!48420 () Unit!2471)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1408) Unit!2471)

(assert (=> b!32750 (= lt!48420 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!48416 () (_ BitVec 64))

(assert (=> b!32750 (= lt!48416 (bitIndex!0 (size!808 (buf!1136 thiss!1379)) (currentByte!2503 thiss!1379) (currentBit!2498 thiss!1379)))))

(declare-fun b!32751 () Bool)

(declare-fun res!28002 () Bool)

(assert (=> b!32751 (=> res!28002 e!21668)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!32751 (= res!28002 (not (invariant!0 (currentBit!2498 (_2!1760 lt!48415)) (currentByte!2503 (_2!1760 lt!48415)) (size!808 (buf!1136 (_2!1760 lt!48425))))))))

(declare-fun b!32752 () Bool)

(declare-fun res!27999 () Bool)

(assert (=> b!32752 (=> res!27999 e!21663)))

(assert (=> b!32752 (= res!27999 (not (invariant!0 (currentBit!2498 (_2!1760 lt!48425)) (currentByte!2503 (_2!1760 lt!48425)) (size!808 (buf!1136 (_2!1760 lt!48425))))))))

(declare-fun b!32753 () Bool)

(declare-fun e!21667 () Bool)

(assert (=> b!32753 (= e!21665 e!21667)))

(declare-fun res!27994 () Bool)

(assert (=> b!32753 (=> res!27994 e!21667)))

(assert (=> b!32753 (= res!27994 (not (isPrefixOf!0 thiss!1379 (_2!1760 lt!48415))))))

(declare-fun lt!48423 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!32753 (validate_offset_bits!1 ((_ sign_extend 32) (size!808 (buf!1136 (_2!1760 lt!48415)))) ((_ sign_extend 32) (currentByte!2503 (_2!1760 lt!48415))) ((_ sign_extend 32) (currentBit!2498 (_2!1760 lt!48415))) lt!48423)))

(assert (=> b!32753 (= lt!48423 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48426 () Unit!2471)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1408 BitStream!1408 (_ BitVec 64) (_ BitVec 64)) Unit!2471)

(assert (=> b!32753 (= lt!48426 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1760 lt!48415) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1832)

(declare-fun appendBitFromByte!0 (BitStream!1408 (_ BitVec 8) (_ BitVec 32)) tuple2!3346)

(assert (=> b!32753 (= lt!48415 (appendBitFromByte!0 thiss!1379 (select (arr!1283 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!32754 () Bool)

(declare-fun e!21671 () Bool)

(assert (=> b!32754 (= e!21667 e!21671)))

(declare-fun res!27998 () Bool)

(assert (=> b!32754 (=> res!27998 e!21671)))

(assert (=> b!32754 (= res!27998 (not (isPrefixOf!0 (_2!1760 lt!48415) (_2!1760 lt!48425))))))

(assert (=> b!32754 (isPrefixOf!0 thiss!1379 (_2!1760 lt!48425))))

(declare-fun lt!48419 () Unit!2471)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1408 BitStream!1408 BitStream!1408) Unit!2471)

(assert (=> b!32754 (= lt!48419 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1760 lt!48415) (_2!1760 lt!48425)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1408 array!1832 (_ BitVec 64) (_ BitVec 64)) tuple2!3346)

(assert (=> b!32754 (= lt!48425 (appendBitsMSBFirstLoop!0 (_2!1760 lt!48415) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!21662 () Bool)

(assert (=> b!32754 e!21662))

(declare-fun res!28006 () Bool)

(assert (=> b!32754 (=> (not res!28006) (not e!21662))))

(assert (=> b!32754 (= res!28006 (validate_offset_bits!1 ((_ sign_extend 32) (size!808 (buf!1136 (_2!1760 lt!48415)))) ((_ sign_extend 32) (currentByte!2503 thiss!1379)) ((_ sign_extend 32) (currentBit!2498 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48417 () Unit!2471)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1408 array!1832 (_ BitVec 64)) Unit!2471)

(assert (=> b!32754 (= lt!48417 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1136 (_2!1760 lt!48415)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48421 () tuple2!3348)

(declare-fun reader!0 (BitStream!1408 BitStream!1408) tuple2!3348)

(assert (=> b!32754 (= lt!48421 (reader!0 thiss!1379 (_2!1760 lt!48415)))))

(declare-fun b!32755 () Bool)

(assert (=> b!32755 (= e!21668 e!21673)))

(declare-fun res!28005 () Bool)

(assert (=> b!32755 (=> res!28005 e!21673)))

(assert (=> b!32755 (= res!28005 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1408 BitStream!1408 (_ BitVec 64)) List!405)

(assert (=> b!32755 (= lt!48414 (bitStreamReadBitsIntoList!0 (_2!1760 lt!48425) (_1!1761 lt!48427) lt!48423))))

(assert (=> b!32755 (= lt!48418 (bitStreamReadBitsIntoList!0 (_2!1760 lt!48425) (_1!1761 lt!48428) (bvsub to!314 i!635)))))

(assert (=> b!32755 (validate_offset_bits!1 ((_ sign_extend 32) (size!808 (buf!1136 (_2!1760 lt!48425)))) ((_ sign_extend 32) (currentByte!2503 (_2!1760 lt!48415))) ((_ sign_extend 32) (currentBit!2498 (_2!1760 lt!48415))) lt!48423)))

(declare-fun lt!48424 () Unit!2471)

(assert (=> b!32755 (= lt!48424 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1760 lt!48415) (buf!1136 (_2!1760 lt!48425)) lt!48423))))

(assert (=> b!32755 (= lt!48427 (reader!0 (_2!1760 lt!48415) (_2!1760 lt!48425)))))

(assert (=> b!32755 (validate_offset_bits!1 ((_ sign_extend 32) (size!808 (buf!1136 (_2!1760 lt!48425)))) ((_ sign_extend 32) (currentByte!2503 thiss!1379)) ((_ sign_extend 32) (currentBit!2498 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!48422 () Unit!2471)

(assert (=> b!32755 (= lt!48422 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1136 (_2!1760 lt!48425)) (bvsub to!314 i!635)))))

(assert (=> b!32755 (= lt!48428 (reader!0 thiss!1379 (_2!1760 lt!48425)))))

(declare-fun b!32756 () Bool)

(declare-fun res!28003 () Bool)

(assert (=> b!32756 (=> res!28003 e!21663)))

(assert (=> b!32756 (= res!28003 (not (= (size!808 (buf!1136 thiss!1379)) (size!808 (buf!1136 (_2!1760 lt!48425))))))))

(declare-fun b!32757 () Bool)

(declare-fun res!27997 () Bool)

(assert (=> b!32757 (=> (not res!27997) (not e!21666))))

(assert (=> b!32757 (= res!27997 (validate_offset_bits!1 ((_ sign_extend 32) (size!808 (buf!1136 thiss!1379))) ((_ sign_extend 32) (currentByte!2503 thiss!1379)) ((_ sign_extend 32) (currentBit!2498 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!32758 () Bool)

(declare-fun e!21669 () Bool)

(declare-fun array_inv!757 (array!1832) Bool)

(assert (=> b!32758 (= e!21669 (array_inv!757 (buf!1136 thiss!1379)))))

(declare-fun b!32759 () Bool)

(declare-fun head!242 (List!405) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1408 array!1832 (_ BitVec 64) (_ BitVec 64)) List!405)

(assert (=> b!32759 (= e!21662 (= (head!242 (byteArrayBitContentToList!0 (_2!1760 lt!48415) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!242 (bitStreamReadBitsIntoList!0 (_2!1760 lt!48415) (_1!1761 lt!48421) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!32760 () Bool)

(assert (=> b!32760 (= e!21671 e!21663)))

(declare-fun res!28008 () Bool)

(assert (=> b!32760 (=> res!28008 e!21663)))

(assert (=> b!32760 (= res!28008 (not (= lt!48429 (bvsub (bvadd lt!48416 to!314) i!635))))))

(assert (=> b!32760 (= lt!48429 (bitIndex!0 (size!808 (buf!1136 (_2!1760 lt!48425))) (currentByte!2503 (_2!1760 lt!48425)) (currentBit!2498 (_2!1760 lt!48425))))))

(declare-fun b!32761 () Bool)

(declare-fun res!28001 () Bool)

(assert (=> b!32761 (=> res!28001 e!21668)))

(assert (=> b!32761 (= res!28001 (not (invariant!0 (currentBit!2498 (_2!1760 lt!48415)) (currentByte!2503 (_2!1760 lt!48415)) (size!808 (buf!1136 (_2!1760 lt!48415))))))))

(declare-fun res!28007 () Bool)

(assert (=> start!6896 (=> (not res!28007) (not e!21666))))

(assert (=> start!6896 (= res!28007 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!808 srcBuffer!2))))))))

(assert (=> start!6896 e!21666))

(assert (=> start!6896 true))

(assert (=> start!6896 (array_inv!757 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1408) Bool)

(assert (=> start!6896 (and (inv!12 thiss!1379) e!21669)))

(assert (= (and start!6896 res!28007) b!32757))

(assert (= (and b!32757 res!27997) b!32750))

(assert (= (and b!32750 (not res!27996)) b!32753))

(assert (= (and b!32753 (not res!27994)) b!32754))

(assert (= (and b!32754 res!28006) b!32759))

(assert (= (and b!32754 (not res!27998)) b!32760))

(assert (= (and b!32760 (not res!28008)) b!32752))

(assert (= (and b!32752 (not res!27999)) b!32756))

(assert (= (and b!32756 (not res!28003)) b!32748))

(assert (= (and b!32748 res!28004) b!32747))

(assert (= (and b!32748 (not res!28000)) b!32761))

(assert (= (and b!32761 (not res!28001)) b!32751))

(assert (= (and b!32751 (not res!28002)) b!32755))

(assert (= (and b!32755 (not res!28005)) b!32746))

(assert (= (and b!32746 (not res!27995)) b!32749))

(assert (= start!6896 b!32758))

(declare-fun m!48471 () Bool)

(assert (=> b!32753 m!48471))

(declare-fun m!48473 () Bool)

(assert (=> b!32753 m!48473))

(declare-fun m!48475 () Bool)

(assert (=> b!32753 m!48475))

(declare-fun m!48477 () Bool)

(assert (=> b!32753 m!48477))

(assert (=> b!32753 m!48473))

(declare-fun m!48479 () Bool)

(assert (=> b!32753 m!48479))

(declare-fun m!48481 () Bool)

(assert (=> b!32747 m!48481))

(declare-fun m!48483 () Bool)

(assert (=> b!32759 m!48483))

(assert (=> b!32759 m!48483))

(declare-fun m!48485 () Bool)

(assert (=> b!32759 m!48485))

(declare-fun m!48487 () Bool)

(assert (=> b!32759 m!48487))

(assert (=> b!32759 m!48487))

(declare-fun m!48489 () Bool)

(assert (=> b!32759 m!48489))

(declare-fun m!48491 () Bool)

(assert (=> b!32750 m!48491))

(declare-fun m!48493 () Bool)

(assert (=> b!32750 m!48493))

(declare-fun m!48495 () Bool)

(assert (=> b!32750 m!48495))

(declare-fun m!48497 () Bool)

(assert (=> b!32751 m!48497))

(declare-fun m!48499 () Bool)

(assert (=> b!32758 m!48499))

(declare-fun m!48501 () Bool)

(assert (=> b!32761 m!48501))

(declare-fun m!48503 () Bool)

(assert (=> b!32760 m!48503))

(declare-fun m!48505 () Bool)

(assert (=> b!32746 m!48505))

(declare-fun m!48507 () Bool)

(assert (=> b!32752 m!48507))

(declare-fun m!48509 () Bool)

(assert (=> start!6896 m!48509))

(declare-fun m!48511 () Bool)

(assert (=> start!6896 m!48511))

(declare-fun m!48513 () Bool)

(assert (=> b!32755 m!48513))

(declare-fun m!48515 () Bool)

(assert (=> b!32755 m!48515))

(declare-fun m!48517 () Bool)

(assert (=> b!32755 m!48517))

(declare-fun m!48519 () Bool)

(assert (=> b!32755 m!48519))

(declare-fun m!48521 () Bool)

(assert (=> b!32755 m!48521))

(declare-fun m!48523 () Bool)

(assert (=> b!32755 m!48523))

(declare-fun m!48525 () Bool)

(assert (=> b!32755 m!48525))

(declare-fun m!48527 () Bool)

(assert (=> b!32755 m!48527))

(declare-fun m!48529 () Bool)

(assert (=> b!32757 m!48529))

(declare-fun m!48531 () Bool)

(assert (=> b!32749 m!48531))

(declare-fun m!48533 () Bool)

(assert (=> b!32749 m!48533))

(declare-fun m!48535 () Bool)

(assert (=> b!32754 m!48535))

(declare-fun m!48537 () Bool)

(assert (=> b!32754 m!48537))

(declare-fun m!48539 () Bool)

(assert (=> b!32754 m!48539))

(declare-fun m!48541 () Bool)

(assert (=> b!32754 m!48541))

(declare-fun m!48543 () Bool)

(assert (=> b!32754 m!48543))

(declare-fun m!48545 () Bool)

(assert (=> b!32754 m!48545))

(declare-fun m!48547 () Bool)

(assert (=> b!32754 m!48547))

(push 1)

(assert (not b!32758))

(assert (not b!32752))

(assert (not b!32761))

(assert (not b!32749))

(assert (not b!32755))

(assert (not start!6896))

(assert (not b!32753))

(assert (not b!32751))

(assert (not b!32757))

(assert (not b!32759))

(assert (not b!32760))

(assert (not b!32754))

(assert (not b!32750))

(assert (not b!32746))

(assert (not b!32747))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

