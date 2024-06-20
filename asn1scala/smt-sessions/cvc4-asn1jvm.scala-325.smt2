; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7074 () Bool)

(assert start!7074)

(declare-fun b!34470 () Bool)

(declare-fun e!22865 () Bool)

(declare-fun e!22853 () Bool)

(assert (=> b!34470 (= e!22865 e!22853)))

(declare-fun res!29506 () Bool)

(assert (=> b!34470 (=> res!29506 e!22853)))

(declare-datatypes ((List!431 0))(
  ( (Nil!428) (Cons!427 (h!546 Bool) (t!1181 List!431)) )
))
(declare-fun lt!50864 () List!431)

(declare-fun lt!50871 () List!431)

(assert (=> b!34470 (= res!29506 (not (= lt!50864 lt!50871)))))

(assert (=> b!34470 (= lt!50871 lt!50864)))

(declare-fun lt!50867 () List!431)

(declare-fun tail!148 (List!431) List!431)

(assert (=> b!34470 (= lt!50864 (tail!148 lt!50867))))

(declare-datatypes ((Unit!2553 0))(
  ( (Unit!2554) )
))
(declare-fun lt!50854 () Unit!2553)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-datatypes ((array!1887 0))(
  ( (array!1888 (arr!1315 (Array (_ BitVec 32) (_ BitVec 8))) (size!837 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1460 0))(
  ( (BitStream!1461 (buf!1165 array!1887) (currentByte!2538 (_ BitVec 32)) (currentBit!2533 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3474 0))(
  ( (tuple2!3475 (_1!1824 Unit!2553) (_2!1824 BitStream!1460)) )
))
(declare-fun lt!50853 () tuple2!3474)

(declare-datatypes ((tuple2!3476 0))(
  ( (tuple2!3477 (_1!1825 BitStream!1460) (_2!1825 BitStream!1460)) )
))
(declare-fun lt!50868 () tuple2!3476)

(declare-fun lt!50872 () tuple2!3476)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1460 BitStream!1460 BitStream!1460 BitStream!1460 (_ BitVec 64) List!431) Unit!2553)

(assert (=> b!34470 (= lt!50854 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1824 lt!50853) (_2!1824 lt!50853) (_1!1825 lt!50872) (_1!1825 lt!50868) (bvsub to!314 i!635) lt!50867))))

(declare-fun b!34471 () Bool)

(declare-fun e!22859 () Bool)

(declare-fun e!22862 () Bool)

(assert (=> b!34471 (= e!22859 e!22862)))

(declare-fun res!29517 () Bool)

(assert (=> b!34471 (=> res!29517 e!22862)))

(declare-fun thiss!1379 () BitStream!1460)

(declare-fun lt!50851 () tuple2!3474)

(declare-fun isPrefixOf!0 (BitStream!1460 BitStream!1460) Bool)

(assert (=> b!34471 (= res!29517 (not (isPrefixOf!0 thiss!1379 (_2!1824 lt!50851))))))

(declare-fun lt!50869 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!34471 (validate_offset_bits!1 ((_ sign_extend 32) (size!837 (buf!1165 (_2!1824 lt!50851)))) ((_ sign_extend 32) (currentByte!2538 (_2!1824 lt!50851))) ((_ sign_extend 32) (currentBit!2533 (_2!1824 lt!50851))) lt!50869)))

(assert (=> b!34471 (= lt!50869 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!50870 () Unit!2553)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1460 BitStream!1460 (_ BitVec 64) (_ BitVec 64)) Unit!2553)

(assert (=> b!34471 (= lt!50870 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1824 lt!50851) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1887)

(declare-fun appendBitFromByte!0 (BitStream!1460 (_ BitVec 8) (_ BitVec 32)) tuple2!3474)

(assert (=> b!34471 (= lt!50851 (appendBitFromByte!0 thiss!1379 (select (arr!1315 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!34472 () Bool)

(declare-fun res!29505 () Bool)

(declare-fun e!22867 () Bool)

(assert (=> b!34472 (=> res!29505 e!22867)))

(assert (=> b!34472 (= res!29505 (not (= (size!837 (buf!1165 thiss!1379)) (size!837 (buf!1165 (_2!1824 lt!50853))))))))

(declare-fun b!34473 () Bool)

(declare-fun e!22863 () Bool)

(declare-fun e!22858 () Bool)

(assert (=> b!34473 (= e!22863 e!22858)))

(declare-fun res!29520 () Bool)

(assert (=> b!34473 (=> res!29520 e!22858)))

(declare-fun lt!50857 () Bool)

(declare-fun head!268 (List!431) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1460 array!1887 (_ BitVec 64) (_ BitVec 64)) List!431)

(assert (=> b!34473 (= res!29520 (not (= (head!268 (byteArrayBitContentToList!0 (_2!1824 lt!50853) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!50857)))))

(declare-fun bitAt!0 (array!1887 (_ BitVec 64)) Bool)

(assert (=> b!34473 (= lt!50857 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!34474 () Bool)

(declare-fun res!29519 () Bool)

(assert (=> b!34474 (=> res!29519 e!22863)))

(declare-fun lt!50862 () Bool)

(assert (=> b!34474 (= res!29519 (not (= (head!268 lt!50867) lt!50862)))))

(declare-fun b!34475 () Bool)

(declare-fun res!29522 () Bool)

(declare-fun e!22856 () Bool)

(assert (=> b!34475 (=> (not res!29522) (not e!22856))))

(assert (=> b!34475 (= res!29522 (validate_offset_bits!1 ((_ sign_extend 32) (size!837 (buf!1165 thiss!1379))) ((_ sign_extend 32) (currentByte!2538 thiss!1379)) ((_ sign_extend 32) (currentBit!2533 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!34476 () Bool)

(declare-fun e!22857 () Bool)

(declare-fun lt!50856 () (_ BitVec 64))

(assert (=> b!34476 (= e!22857 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!50856) (bvslt lt!50856 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!837 (buf!1165 (_2!1824 lt!50853))))))))))

(declare-fun lt!50850 () Bool)

(assert (=> b!34476 (= lt!50850 (bitAt!0 (buf!1165 (_2!1824 lt!50853)) lt!50856))))

(declare-fun lt!50858 () (_ BitVec 64))

(declare-fun lt!50861 () Unit!2553)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1887 array!1887 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2553)

(assert (=> b!34476 (= lt!50861 (arrayBitRangesEqImpliesEq!0 (buf!1165 (_2!1824 lt!50851)) (buf!1165 (_2!1824 lt!50853)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!50856 lt!50858))))

(declare-fun res!29515 () Bool)

(assert (=> start!7074 (=> (not res!29515) (not e!22856))))

(assert (=> start!7074 (= res!29515 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!837 srcBuffer!2))))))))

(assert (=> start!7074 e!22856))

(assert (=> start!7074 true))

(declare-fun array_inv!783 (array!1887) Bool)

(assert (=> start!7074 (array_inv!783 srcBuffer!2)))

(declare-fun e!22861 () Bool)

(declare-fun inv!12 (BitStream!1460) Bool)

(assert (=> start!7074 (and (inv!12 thiss!1379) e!22861)))

(declare-fun b!34477 () Bool)

(declare-fun e!22854 () Bool)

(assert (=> b!34477 (= e!22854 e!22867)))

(declare-fun res!29511 () Bool)

(assert (=> b!34477 (=> res!29511 e!22867)))

(declare-fun lt!50852 () (_ BitVec 64))

(assert (=> b!34477 (= res!29511 (not (= lt!50852 (bvsub (bvadd lt!50856 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!34477 (= lt!50852 (bitIndex!0 (size!837 (buf!1165 (_2!1824 lt!50853))) (currentByte!2538 (_2!1824 lt!50853)) (currentBit!2533 (_2!1824 lt!50853))))))

(declare-fun b!34478 () Bool)

(assert (=> b!34478 (= e!22856 (not e!22859))))

(declare-fun res!29523 () Bool)

(assert (=> b!34478 (=> res!29523 e!22859)))

(assert (=> b!34478 (= res!29523 (bvsge i!635 to!314))))

(assert (=> b!34478 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!50855 () Unit!2553)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1460) Unit!2553)

(assert (=> b!34478 (= lt!50855 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!34478 (= lt!50856 (bitIndex!0 (size!837 (buf!1165 thiss!1379)) (currentByte!2538 thiss!1379) (currentBit!2533 thiss!1379)))))

(declare-fun b!34479 () Bool)

(assert (=> b!34479 (= e!22853 e!22863)))

(declare-fun res!29510 () Bool)

(assert (=> b!34479 (=> res!29510 e!22863)))

(assert (=> b!34479 (= res!29510 (not (= lt!50862 (bitAt!0 (buf!1165 (_1!1825 lt!50868)) lt!50856))))))

(assert (=> b!34479 (= lt!50862 (bitAt!0 (buf!1165 (_1!1825 lt!50872)) lt!50856))))

(declare-fun e!22855 () Bool)

(declare-fun b!34480 () Bool)

(declare-fun lt!50863 () tuple2!3476)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1460 BitStream!1460 (_ BitVec 64)) List!431)

(assert (=> b!34480 (= e!22855 (= (head!268 (byteArrayBitContentToList!0 (_2!1824 lt!50851) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!268 (bitStreamReadBitsIntoList!0 (_2!1824 lt!50851) (_1!1825 lt!50863) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!34481 () Bool)

(assert (=> b!34481 (= e!22862 e!22854)))

(declare-fun res!29512 () Bool)

(assert (=> b!34481 (=> res!29512 e!22854)))

(assert (=> b!34481 (= res!29512 (not (isPrefixOf!0 (_2!1824 lt!50851) (_2!1824 lt!50853))))))

(assert (=> b!34481 (isPrefixOf!0 thiss!1379 (_2!1824 lt!50853))))

(declare-fun lt!50866 () Unit!2553)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1460 BitStream!1460 BitStream!1460) Unit!2553)

(assert (=> b!34481 (= lt!50866 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1824 lt!50851) (_2!1824 lt!50853)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1460 array!1887 (_ BitVec 64) (_ BitVec 64)) tuple2!3474)

(assert (=> b!34481 (= lt!50853 (appendBitsMSBFirstLoop!0 (_2!1824 lt!50851) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!34481 e!22855))

(declare-fun res!29507 () Bool)

(assert (=> b!34481 (=> (not res!29507) (not e!22855))))

(assert (=> b!34481 (= res!29507 (validate_offset_bits!1 ((_ sign_extend 32) (size!837 (buf!1165 (_2!1824 lt!50851)))) ((_ sign_extend 32) (currentByte!2538 thiss!1379)) ((_ sign_extend 32) (currentBit!2533 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!50865 () Unit!2553)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1460 array!1887 (_ BitVec 64)) Unit!2553)

(assert (=> b!34481 (= lt!50865 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1165 (_2!1824 lt!50851)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1460 BitStream!1460) tuple2!3476)

(assert (=> b!34481 (= lt!50863 (reader!0 thiss!1379 (_2!1824 lt!50851)))))

(declare-fun b!34482 () Bool)

(declare-fun res!29521 () Bool)

(declare-fun e!22860 () Bool)

(assert (=> b!34482 (=> res!29521 e!22860)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!34482 (= res!29521 (not (invariant!0 (currentBit!2533 (_2!1824 lt!50851)) (currentByte!2538 (_2!1824 lt!50851)) (size!837 (buf!1165 (_2!1824 lt!50853))))))))

(declare-fun b!34483 () Bool)

(assert (=> b!34483 (= e!22858 e!22857)))

(declare-fun res!29508 () Bool)

(assert (=> b!34483 (=> res!29508 e!22857)))

(assert (=> b!34483 (= res!29508 (not (= lt!50850 lt!50857)))))

(assert (=> b!34483 (= lt!50850 (bitAt!0 (buf!1165 (_2!1824 lt!50851)) lt!50856))))

(declare-fun b!34484 () Bool)

(declare-fun res!29516 () Bool)

(assert (=> b!34484 (=> res!29516 e!22865)))

(declare-fun length!157 (List!431) Int)

(assert (=> b!34484 (= res!29516 (<= (length!157 lt!50867) 0))))

(declare-fun b!34485 () Bool)

(declare-fun res!29518 () Bool)

(assert (=> b!34485 (=> res!29518 e!22860)))

(assert (=> b!34485 (= res!29518 (not (invariant!0 (currentBit!2533 (_2!1824 lt!50851)) (currentByte!2538 (_2!1824 lt!50851)) (size!837 (buf!1165 (_2!1824 lt!50851))))))))

(declare-fun b!34486 () Bool)

(assert (=> b!34486 (= e!22861 (array_inv!783 (buf!1165 thiss!1379)))))

(declare-fun b!34487 () Bool)

(declare-fun res!29509 () Bool)

(assert (=> b!34487 (=> res!29509 e!22867)))

(assert (=> b!34487 (= res!29509 (not (invariant!0 (currentBit!2533 (_2!1824 lt!50853)) (currentByte!2538 (_2!1824 lt!50853)) (size!837 (buf!1165 (_2!1824 lt!50853))))))))

(declare-fun b!34488 () Bool)

(assert (=> b!34488 (= e!22860 e!22865)))

(declare-fun res!29513 () Bool)

(assert (=> b!34488 (=> res!29513 e!22865)))

(assert (=> b!34488 (= res!29513 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!34488 (= lt!50871 (bitStreamReadBitsIntoList!0 (_2!1824 lt!50853) (_1!1825 lt!50868) lt!50869))))

(assert (=> b!34488 (= lt!50867 (bitStreamReadBitsIntoList!0 (_2!1824 lt!50853) (_1!1825 lt!50872) (bvsub to!314 i!635)))))

(assert (=> b!34488 (validate_offset_bits!1 ((_ sign_extend 32) (size!837 (buf!1165 (_2!1824 lt!50853)))) ((_ sign_extend 32) (currentByte!2538 (_2!1824 lt!50851))) ((_ sign_extend 32) (currentBit!2533 (_2!1824 lt!50851))) lt!50869)))

(declare-fun lt!50859 () Unit!2553)

(assert (=> b!34488 (= lt!50859 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1824 lt!50851) (buf!1165 (_2!1824 lt!50853)) lt!50869))))

(assert (=> b!34488 (= lt!50868 (reader!0 (_2!1824 lt!50851) (_2!1824 lt!50853)))))

(assert (=> b!34488 (validate_offset_bits!1 ((_ sign_extend 32) (size!837 (buf!1165 (_2!1824 lt!50853)))) ((_ sign_extend 32) (currentByte!2538 thiss!1379)) ((_ sign_extend 32) (currentBit!2533 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!50860 () Unit!2553)

(assert (=> b!34488 (= lt!50860 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1165 (_2!1824 lt!50853)) (bvsub to!314 i!635)))))

(assert (=> b!34488 (= lt!50872 (reader!0 thiss!1379 (_2!1824 lt!50853)))))

(declare-fun b!34489 () Bool)

(assert (=> b!34489 (= e!22867 e!22860)))

(declare-fun res!29514 () Bool)

(assert (=> b!34489 (=> res!29514 e!22860)))

(assert (=> b!34489 (= res!29514 (not (= (size!837 (buf!1165 (_2!1824 lt!50851))) (size!837 (buf!1165 (_2!1824 lt!50853))))))))

(assert (=> b!34489 (= lt!50852 (bvsub (bvsub (bvadd lt!50858 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!34489 (= lt!50858 (bitIndex!0 (size!837 (buf!1165 (_2!1824 lt!50851))) (currentByte!2538 (_2!1824 lt!50851)) (currentBit!2533 (_2!1824 lt!50851))))))

(assert (=> b!34489 (= (size!837 (buf!1165 (_2!1824 lt!50853))) (size!837 (buf!1165 thiss!1379)))))

(assert (= (and start!7074 res!29515) b!34475))

(assert (= (and b!34475 res!29522) b!34478))

(assert (= (and b!34478 (not res!29523)) b!34471))

(assert (= (and b!34471 (not res!29517)) b!34481))

(assert (= (and b!34481 res!29507) b!34480))

(assert (= (and b!34481 (not res!29512)) b!34477))

(assert (= (and b!34477 (not res!29511)) b!34487))

(assert (= (and b!34487 (not res!29509)) b!34472))

(assert (= (and b!34472 (not res!29505)) b!34489))

(assert (= (and b!34489 (not res!29514)) b!34485))

(assert (= (and b!34485 (not res!29518)) b!34482))

(assert (= (and b!34482 (not res!29521)) b!34488))

(assert (= (and b!34488 (not res!29513)) b!34484))

(assert (= (and b!34484 (not res!29516)) b!34470))

(assert (= (and b!34470 (not res!29506)) b!34479))

(assert (= (and b!34479 (not res!29510)) b!34474))

(assert (= (and b!34474 (not res!29519)) b!34473))

(assert (= (and b!34473 (not res!29520)) b!34483))

(assert (= (and b!34483 (not res!29508)) b!34476))

(assert (= start!7074 b!34486))

(declare-fun m!51399 () Bool)

(assert (=> start!7074 m!51399))

(declare-fun m!51401 () Bool)

(assert (=> start!7074 m!51401))

(declare-fun m!51403 () Bool)

(assert (=> b!34474 m!51403))

(declare-fun m!51405 () Bool)

(assert (=> b!34470 m!51405))

(declare-fun m!51407 () Bool)

(assert (=> b!34470 m!51407))

(declare-fun m!51409 () Bool)

(assert (=> b!34484 m!51409))

(declare-fun m!51411 () Bool)

(assert (=> b!34481 m!51411))

(declare-fun m!51413 () Bool)

(assert (=> b!34481 m!51413))

(declare-fun m!51415 () Bool)

(assert (=> b!34481 m!51415))

(declare-fun m!51417 () Bool)

(assert (=> b!34481 m!51417))

(declare-fun m!51419 () Bool)

(assert (=> b!34481 m!51419))

(declare-fun m!51421 () Bool)

(assert (=> b!34481 m!51421))

(declare-fun m!51423 () Bool)

(assert (=> b!34481 m!51423))

(declare-fun m!51425 () Bool)

(assert (=> b!34477 m!51425))

(declare-fun m!51427 () Bool)

(assert (=> b!34482 m!51427))

(declare-fun m!51429 () Bool)

(assert (=> b!34479 m!51429))

(declare-fun m!51431 () Bool)

(assert (=> b!34479 m!51431))

(declare-fun m!51433 () Bool)

(assert (=> b!34486 m!51433))

(declare-fun m!51435 () Bool)

(assert (=> b!34483 m!51435))

(declare-fun m!51437 () Bool)

(assert (=> b!34473 m!51437))

(assert (=> b!34473 m!51437))

(declare-fun m!51439 () Bool)

(assert (=> b!34473 m!51439))

(declare-fun m!51441 () Bool)

(assert (=> b!34473 m!51441))

(declare-fun m!51443 () Bool)

(assert (=> b!34489 m!51443))

(declare-fun m!51445 () Bool)

(assert (=> b!34476 m!51445))

(declare-fun m!51447 () Bool)

(assert (=> b!34476 m!51447))

(declare-fun m!51449 () Bool)

(assert (=> b!34488 m!51449))

(declare-fun m!51451 () Bool)

(assert (=> b!34488 m!51451))

(declare-fun m!51453 () Bool)

(assert (=> b!34488 m!51453))

(declare-fun m!51455 () Bool)

(assert (=> b!34488 m!51455))

(declare-fun m!51457 () Bool)

(assert (=> b!34488 m!51457))

(declare-fun m!51459 () Bool)

(assert (=> b!34488 m!51459))

(declare-fun m!51461 () Bool)

(assert (=> b!34488 m!51461))

(declare-fun m!51463 () Bool)

(assert (=> b!34488 m!51463))

(declare-fun m!51465 () Bool)

(assert (=> b!34485 m!51465))

(declare-fun m!51467 () Bool)

(assert (=> b!34475 m!51467))

(declare-fun m!51469 () Bool)

(assert (=> b!34471 m!51469))

(declare-fun m!51471 () Bool)

(assert (=> b!34471 m!51471))

(declare-fun m!51473 () Bool)

(assert (=> b!34471 m!51473))

(declare-fun m!51475 () Bool)

(assert (=> b!34471 m!51475))

(assert (=> b!34471 m!51471))

(declare-fun m!51477 () Bool)

(assert (=> b!34471 m!51477))

(declare-fun m!51479 () Bool)

(assert (=> b!34478 m!51479))

(declare-fun m!51481 () Bool)

(assert (=> b!34478 m!51481))

(declare-fun m!51483 () Bool)

(assert (=> b!34478 m!51483))

(declare-fun m!51485 () Bool)

(assert (=> b!34487 m!51485))

(declare-fun m!51487 () Bool)

(assert (=> b!34480 m!51487))

(assert (=> b!34480 m!51487))

(declare-fun m!51489 () Bool)

(assert (=> b!34480 m!51489))

(declare-fun m!51491 () Bool)

(assert (=> b!34480 m!51491))

(assert (=> b!34480 m!51491))

(declare-fun m!51493 () Bool)

(assert (=> b!34480 m!51493))

(push 1)

(assert (not b!34485))

(assert (not b!34489))

(assert (not b!34471))

(assert (not b!34477))

(assert (not b!34473))

(assert (not b!34487))

(assert (not b!34474))

(assert (not b!34484))

(assert (not b!34483))

(assert (not b!34478))

(assert (not b!34476))

(assert (not b!34481))

(assert (not b!34479))

(assert (not b!34470))

(assert (not b!34488))

(assert (not b!34482))

(assert (not b!34486))

(assert (not b!34480))

(assert (not b!34475))

(assert (not start!7074))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9920 () Bool)

(declare-fun size!839 (List!431) Int)

(assert (=> d!9920 (= (length!157 lt!50867) (size!839 lt!50867))))

(declare-fun bs!2706 () Bool)

(assert (= bs!2706 d!9920))

(declare-fun m!51573 () Bool)

(assert (=> bs!2706 m!51573))

(assert (=> b!34484 d!9920))

(declare-fun d!9922 () Bool)

(assert (=> d!9922 (= (head!268 (byteArrayBitContentToList!0 (_2!1824 lt!50853) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!546 (byteArrayBitContentToList!0 (_2!1824 lt!50853) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!34473 d!9922))

(declare-fun d!9924 () Bool)

(declare-fun c!2298 () Bool)

(assert (=> d!9924 (= c!2298 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!22907 () List!431)

(assert (=> d!9924 (= (byteArrayBitContentToList!0 (_2!1824 lt!50853) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!22907)))

(declare-fun b!34564 () Bool)

(assert (=> b!34564 (= e!22907 Nil!428)))

(declare-fun b!34565 () Bool)

(assert (=> b!34565 (= e!22907 (Cons!427 (not (= (bvand ((_ sign_extend 24) (select (arr!1315 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1824 lt!50853) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!9924 c!2298) b!34564))

(assert (= (and d!9924 (not c!2298)) b!34565))

(assert (=> b!34565 m!51471))

(declare-fun m!51577 () Bool)

(assert (=> b!34565 m!51577))

(declare-fun m!51579 () Bool)

(assert (=> b!34565 m!51579))

(assert (=> b!34473 d!9924))

(declare-fun d!9928 () Bool)

(assert (=> d!9928 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1315 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2708 () Bool)

(assert (= bs!2708 d!9928))

(assert (=> bs!2708 m!51471))

(assert (=> bs!2708 m!51577))

(assert (=> b!34473 d!9928))

(declare-fun d!9930 () Bool)

(assert (=> d!9930 (= (bitAt!0 (buf!1165 (_2!1824 lt!50851)) lt!50856) (not (= (bvand ((_ sign_extend 24) (select (arr!1315 (buf!1165 (_2!1824 lt!50851))) ((_ extract 31 0) (bvsdiv lt!50856 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!50856 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2709 () Bool)

(assert (= bs!2709 d!9930))

(declare-fun m!51581 () Bool)

(assert (=> bs!2709 m!51581))

(declare-fun m!51583 () Bool)

(assert (=> bs!2709 m!51583))

(assert (=> b!34483 d!9930))

(declare-fun d!9932 () Bool)

(assert (=> d!9932 (= (invariant!0 (currentBit!2533 (_2!1824 lt!50851)) (currentByte!2538 (_2!1824 lt!50851)) (size!837 (buf!1165 (_2!1824 lt!50853)))) (and (bvsge (currentBit!2533 (_2!1824 lt!50851)) #b00000000000000000000000000000000) (bvslt (currentBit!2533 (_2!1824 lt!50851)) #b00000000000000000000000000001000) (bvsge (currentByte!2538 (_2!1824 lt!50851)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2538 (_2!1824 lt!50851)) (size!837 (buf!1165 (_2!1824 lt!50853)))) (and (= (currentBit!2533 (_2!1824 lt!50851)) #b00000000000000000000000000000000) (= (currentByte!2538 (_2!1824 lt!50851)) (size!837 (buf!1165 (_2!1824 lt!50853))))))))))

(assert (=> b!34482 d!9932))

(declare-fun d!9934 () Bool)

(assert (=> d!9934 (= (array_inv!783 srcBuffer!2) (bvsge (size!837 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!7074 d!9934))

(declare-fun d!9936 () Bool)

(assert (=> d!9936 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2533 thiss!1379) (currentByte!2538 thiss!1379) (size!837 (buf!1165 thiss!1379))))))

(declare-fun bs!2710 () Bool)

(assert (= bs!2710 d!9936))

(declare-fun m!51585 () Bool)

(assert (=> bs!2710 m!51585))

(assert (=> start!7074 d!9936))

(declare-fun d!9938 () Bool)

(assert (=> d!9938 (= (invariant!0 (currentBit!2533 (_2!1824 lt!50853)) (currentByte!2538 (_2!1824 lt!50853)) (size!837 (buf!1165 (_2!1824 lt!50853)))) (and (bvsge (currentBit!2533 (_2!1824 lt!50853)) #b00000000000000000000000000000000) (bvslt (currentBit!2533 (_2!1824 lt!50853)) #b00000000000000000000000000001000) (bvsge (currentByte!2538 (_2!1824 lt!50853)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2538 (_2!1824 lt!50853)) (size!837 (buf!1165 (_2!1824 lt!50853)))) (and (= (currentBit!2533 (_2!1824 lt!50853)) #b00000000000000000000000000000000) (= (currentByte!2538 (_2!1824 lt!50853)) (size!837 (buf!1165 (_2!1824 lt!50853))))))))))

(assert (=> b!34487 d!9938))

(declare-fun d!9940 () Bool)

(assert (=> d!9940 (= (bitAt!0 (buf!1165 (_2!1824 lt!50853)) lt!50856) (not (= (bvand ((_ sign_extend 24) (select (arr!1315 (buf!1165 (_2!1824 lt!50853))) ((_ extract 31 0) (bvsdiv lt!50856 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!50856 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2711 () Bool)

(assert (= bs!2711 d!9940))

(declare-fun m!51587 () Bool)

(assert (=> bs!2711 m!51587))

(assert (=> bs!2711 m!51583))

(assert (=> b!34476 d!9940))

(declare-fun d!9942 () Bool)

(assert (=> d!9942 (= (bitAt!0 (buf!1165 (_2!1824 lt!50851)) lt!50856) (bitAt!0 (buf!1165 (_2!1824 lt!50853)) lt!50856))))

(declare-fun lt!51004 () Unit!2553)

(declare-fun choose!31 (array!1887 array!1887 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2553)

(assert (=> d!9942 (= lt!51004 (choose!31 (buf!1165 (_2!1824 lt!50851)) (buf!1165 (_2!1824 lt!50853)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!50856 lt!50858))))

(assert (=> d!9942 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!50858))))

(assert (=> d!9942 (= (arrayBitRangesEqImpliesEq!0 (buf!1165 (_2!1824 lt!50851)) (buf!1165 (_2!1824 lt!50853)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!50856 lt!50858) lt!51004)))

(declare-fun bs!2712 () Bool)

(assert (= bs!2712 d!9942))

(assert (=> bs!2712 m!51435))

(assert (=> bs!2712 m!51445))

(declare-fun m!51589 () Bool)

(assert (=> bs!2712 m!51589))

(assert (=> b!34476 d!9942))

(declare-fun d!9944 () Bool)

(assert (=> d!9944 (= (array_inv!783 (buf!1165 thiss!1379)) (bvsge (size!837 (buf!1165 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!34486 d!9944))

(declare-fun d!9946 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!9946 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!837 (buf!1165 thiss!1379))) ((_ sign_extend 32) (currentByte!2538 thiss!1379)) ((_ sign_extend 32) (currentBit!2533 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!837 (buf!1165 thiss!1379))) ((_ sign_extend 32) (currentByte!2538 thiss!1379)) ((_ sign_extend 32) (currentBit!2533 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2713 () Bool)

(assert (= bs!2713 d!9946))

(declare-fun m!51591 () Bool)

(assert (=> bs!2713 m!51591))

(assert (=> b!34475 d!9946))

(declare-fun d!9948 () Bool)

(assert (=> d!9948 (= (invariant!0 (currentBit!2533 (_2!1824 lt!50851)) (currentByte!2538 (_2!1824 lt!50851)) (size!837 (buf!1165 (_2!1824 lt!50851)))) (and (bvsge (currentBit!2533 (_2!1824 lt!50851)) #b00000000000000000000000000000000) (bvslt (currentBit!2533 (_2!1824 lt!50851)) #b00000000000000000000000000001000) (bvsge (currentByte!2538 (_2!1824 lt!50851)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2538 (_2!1824 lt!50851)) (size!837 (buf!1165 (_2!1824 lt!50851)))) (and (= (currentBit!2533 (_2!1824 lt!50851)) #b00000000000000000000000000000000) (= (currentByte!2538 (_2!1824 lt!50851)) (size!837 (buf!1165 (_2!1824 lt!50851))))))))))

(assert (=> b!34485 d!9948))

(declare-fun d!9950 () Bool)

(assert (=> d!9950 (= (head!268 lt!50867) (h!546 lt!50867))))

(assert (=> b!34474 d!9950))

(declare-fun d!9952 () Bool)

(assert (=> d!9952 (= (bitAt!0 (buf!1165 (_1!1825 lt!50868)) lt!50856) (not (= (bvand ((_ sign_extend 24) (select (arr!1315 (buf!1165 (_1!1825 lt!50868))) ((_ extract 31 0) (bvsdiv lt!50856 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!50856 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2714 () Bool)

(assert (= bs!2714 d!9952))

(declare-fun m!51593 () Bool)

(assert (=> bs!2714 m!51593))

(assert (=> bs!2714 m!51583))

(assert (=> b!34479 d!9952))

(declare-fun d!9954 () Bool)

(assert (=> d!9954 (= (bitAt!0 (buf!1165 (_1!1825 lt!50872)) lt!50856) (not (= (bvand ((_ sign_extend 24) (select (arr!1315 (buf!1165 (_1!1825 lt!50872))) ((_ extract 31 0) (bvsdiv lt!50856 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!50856 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2715 () Bool)

(assert (= bs!2715 d!9954))

(declare-fun m!51595 () Bool)

(assert (=> bs!2715 m!51595))

(assert (=> bs!2715 m!51583))

(assert (=> b!34479 d!9954))

(declare-fun d!9956 () Bool)

(declare-fun e!22910 () Bool)

(assert (=> d!9956 e!22910))

(declare-fun res!29586 () Bool)

(assert (=> d!9956 (=> (not res!29586) (not e!22910))))

(declare-fun lt!51022 () (_ BitVec 64))

(declare-fun lt!51018 () (_ BitVec 64))

(declare-fun lt!51021 () (_ BitVec 64))

(assert (=> d!9956 (= res!29586 (= lt!51018 (bvsub lt!51022 lt!51021)))))

(assert (=> d!9956 (or (= (bvand lt!51022 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!51021 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!51022 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!51022 lt!51021) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!9956 (= lt!51021 (remainingBits!0 ((_ sign_extend 32) (size!837 (buf!1165 (_2!1824 lt!50851)))) ((_ sign_extend 32) (currentByte!2538 (_2!1824 lt!50851))) ((_ sign_extend 32) (currentBit!2533 (_2!1824 lt!50851)))))))

(declare-fun lt!51017 () (_ BitVec 64))

(declare-fun lt!51020 () (_ BitVec 64))

(assert (=> d!9956 (= lt!51022 (bvmul lt!51017 lt!51020))))

(assert (=> d!9956 (or (= lt!51017 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!51020 (bvsdiv (bvmul lt!51017 lt!51020) lt!51017)))))

(assert (=> d!9956 (= lt!51020 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!9956 (= lt!51017 ((_ sign_extend 32) (size!837 (buf!1165 (_2!1824 lt!50851)))))))

(assert (=> d!9956 (= lt!51018 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2538 (_2!1824 lt!50851))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2533 (_2!1824 lt!50851)))))))

(assert (=> d!9956 (invariant!0 (currentBit!2533 (_2!1824 lt!50851)) (currentByte!2538 (_2!1824 lt!50851)) (size!837 (buf!1165 (_2!1824 lt!50851))))))

(assert (=> d!9956 (= (bitIndex!0 (size!837 (buf!1165 (_2!1824 lt!50851))) (currentByte!2538 (_2!1824 lt!50851)) (currentBit!2533 (_2!1824 lt!50851))) lt!51018)))

(declare-fun b!34570 () Bool)

(declare-fun res!29585 () Bool)

(assert (=> b!34570 (=> (not res!29585) (not e!22910))))

(assert (=> b!34570 (= res!29585 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!51018))))

(declare-fun b!34571 () Bool)

(declare-fun lt!51019 () (_ BitVec 64))

(assert (=> b!34571 (= e!22910 (bvsle lt!51018 (bvmul lt!51019 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!34571 (or (= lt!51019 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!51019 #b0000000000000000000000000000000000000000000000000000000000001000) lt!51019)))))

(assert (=> b!34571 (= lt!51019 ((_ sign_extend 32) (size!837 (buf!1165 (_2!1824 lt!50851)))))))

(assert (= (and d!9956 res!29586) b!34570))

(assert (= (and b!34570 res!29585) b!34571))

(declare-fun m!51597 () Bool)

(assert (=> d!9956 m!51597))

(assert (=> d!9956 m!51465))

(assert (=> b!34489 d!9956))

(declare-fun d!9958 () Bool)

(declare-fun res!29595 () Bool)

(declare-fun e!22916 () Bool)

(assert (=> d!9958 (=> (not res!29595) (not e!22916))))

(assert (=> d!9958 (= res!29595 (= (size!837 (buf!1165 thiss!1379)) (size!837 (buf!1165 thiss!1379))))))

(assert (=> d!9958 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!22916)))

(declare-fun b!34578 () Bool)

(declare-fun res!29593 () Bool)

(assert (=> b!34578 (=> (not res!29593) (not e!22916))))

(assert (=> b!34578 (= res!29593 (bvsle (bitIndex!0 (size!837 (buf!1165 thiss!1379)) (currentByte!2538 thiss!1379) (currentBit!2533 thiss!1379)) (bitIndex!0 (size!837 (buf!1165 thiss!1379)) (currentByte!2538 thiss!1379) (currentBit!2533 thiss!1379))))))

(declare-fun b!34579 () Bool)

(declare-fun e!22915 () Bool)

(assert (=> b!34579 (= e!22916 e!22915)))

(declare-fun res!29594 () Bool)

(assert (=> b!34579 (=> res!29594 e!22915)))

(assert (=> b!34579 (= res!29594 (= (size!837 (buf!1165 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!34580 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1887 array!1887 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!34580 (= e!22915 (arrayBitRangesEq!0 (buf!1165 thiss!1379) (buf!1165 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!837 (buf!1165 thiss!1379)) (currentByte!2538 thiss!1379) (currentBit!2533 thiss!1379))))))

(assert (= (and d!9958 res!29595) b!34578))

(assert (= (and b!34578 res!29593) b!34579))

(assert (= (and b!34579 (not res!29594)) b!34580))

(assert (=> b!34578 m!51483))

(assert (=> b!34578 m!51483))

(assert (=> b!34580 m!51483))

(assert (=> b!34580 m!51483))

(declare-fun m!51599 () Bool)

(assert (=> b!34580 m!51599))

(assert (=> b!34478 d!9958))

(declare-fun d!9960 () Bool)

(assert (=> d!9960 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!51025 () Unit!2553)

(declare-fun choose!11 (BitStream!1460) Unit!2553)

(assert (=> d!9960 (= lt!51025 (choose!11 thiss!1379))))

(assert (=> d!9960 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!51025)))

(declare-fun bs!2717 () Bool)

(assert (= bs!2717 d!9960))

(assert (=> bs!2717 m!51479))

(declare-fun m!51601 () Bool)

(assert (=> bs!2717 m!51601))

(assert (=> b!34478 d!9960))

(declare-fun d!9962 () Bool)

(declare-fun e!22917 () Bool)

(assert (=> d!9962 e!22917))

(declare-fun res!29597 () Bool)

(assert (=> d!9962 (=> (not res!29597) (not e!22917))))

(declare-fun lt!51030 () (_ BitVec 64))

(declare-fun lt!51031 () (_ BitVec 64))

(declare-fun lt!51027 () (_ BitVec 64))

(assert (=> d!9962 (= res!29597 (= lt!51027 (bvsub lt!51031 lt!51030)))))

(assert (=> d!9962 (or (= (bvand lt!51031 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!51030 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!51031 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!51031 lt!51030) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!9962 (= lt!51030 (remainingBits!0 ((_ sign_extend 32) (size!837 (buf!1165 thiss!1379))) ((_ sign_extend 32) (currentByte!2538 thiss!1379)) ((_ sign_extend 32) (currentBit!2533 thiss!1379))))))

(declare-fun lt!51026 () (_ BitVec 64))

(declare-fun lt!51029 () (_ BitVec 64))

(assert (=> d!9962 (= lt!51031 (bvmul lt!51026 lt!51029))))

(assert (=> d!9962 (or (= lt!51026 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!51029 (bvsdiv (bvmul lt!51026 lt!51029) lt!51026)))))

(assert (=> d!9962 (= lt!51029 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!9962 (= lt!51026 ((_ sign_extend 32) (size!837 (buf!1165 thiss!1379))))))

(assert (=> d!9962 (= lt!51027 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2538 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2533 thiss!1379))))))

(assert (=> d!9962 (invariant!0 (currentBit!2533 thiss!1379) (currentByte!2538 thiss!1379) (size!837 (buf!1165 thiss!1379)))))

(assert (=> d!9962 (= (bitIndex!0 (size!837 (buf!1165 thiss!1379)) (currentByte!2538 thiss!1379) (currentBit!2533 thiss!1379)) lt!51027)))

(declare-fun b!34581 () Bool)

(declare-fun res!29596 () Bool)

(assert (=> b!34581 (=> (not res!29596) (not e!22917))))

(assert (=> b!34581 (= res!29596 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!51027))))

(declare-fun b!34582 () Bool)

(declare-fun lt!51028 () (_ BitVec 64))

(assert (=> b!34582 (= e!22917 (bvsle lt!51027 (bvmul lt!51028 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!34582 (or (= lt!51028 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!51028 #b0000000000000000000000000000000000000000000000000000000000001000) lt!51028)))))

(assert (=> b!34582 (= lt!51028 ((_ sign_extend 32) (size!837 (buf!1165 thiss!1379))))))

(assert (= (and d!9962 res!29597) b!34581))

(assert (= (and b!34581 res!29596) b!34582))

(assert (=> d!9962 m!51591))

(assert (=> d!9962 m!51585))

(assert (=> b!34478 d!9962))

(declare-fun lt!51091 () tuple2!3476)

(declare-fun b!34593 () Bool)

(declare-fun lt!51084 () (_ BitVec 64))

(declare-fun e!22922 () Bool)

(declare-fun lt!51085 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1460 (_ BitVec 64)) BitStream!1460)

(assert (=> b!34593 (= e!22922 (= (_1!1825 lt!51091) (withMovedBitIndex!0 (_2!1825 lt!51091) (bvsub lt!51085 lt!51084))))))

(assert (=> b!34593 (or (= (bvand lt!51085 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!51084 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!51085 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!51085 lt!51084) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!34593 (= lt!51084 (bitIndex!0 (size!837 (buf!1165 (_2!1824 lt!50853))) (currentByte!2538 (_2!1824 lt!50853)) (currentBit!2533 (_2!1824 lt!50853))))))

(assert (=> b!34593 (= lt!51085 (bitIndex!0 (size!837 (buf!1165 (_2!1824 lt!50851))) (currentByte!2538 (_2!1824 lt!50851)) (currentBit!2533 (_2!1824 lt!50851))))))

(declare-fun d!9964 () Bool)

(assert (=> d!9964 e!22922))

(declare-fun res!29606 () Bool)

(assert (=> d!9964 (=> (not res!29606) (not e!22922))))

(assert (=> d!9964 (= res!29606 (isPrefixOf!0 (_1!1825 lt!51091) (_2!1825 lt!51091)))))

(declare-fun lt!51081 () BitStream!1460)

(assert (=> d!9964 (= lt!51091 (tuple2!3477 lt!51081 (_2!1824 lt!50853)))))

(declare-fun lt!51082 () Unit!2553)

(declare-fun lt!51089 () Unit!2553)

(assert (=> d!9964 (= lt!51082 lt!51089)))

(assert (=> d!9964 (isPrefixOf!0 lt!51081 (_2!1824 lt!50853))))

(assert (=> d!9964 (= lt!51089 (lemmaIsPrefixTransitive!0 lt!51081 (_2!1824 lt!50853) (_2!1824 lt!50853)))))

(declare-fun lt!51079 () Unit!2553)

(declare-fun lt!51083 () Unit!2553)

(assert (=> d!9964 (= lt!51079 lt!51083)))

(assert (=> d!9964 (isPrefixOf!0 lt!51081 (_2!1824 lt!50853))))

(assert (=> d!9964 (= lt!51083 (lemmaIsPrefixTransitive!0 lt!51081 (_2!1824 lt!50851) (_2!1824 lt!50853)))))

(declare-fun lt!51088 () Unit!2553)

(declare-fun e!22923 () Unit!2553)

(assert (=> d!9964 (= lt!51088 e!22923)))

(declare-fun c!2301 () Bool)

(assert (=> d!9964 (= c!2301 (not (= (size!837 (buf!1165 (_2!1824 lt!50851))) #b00000000000000000000000000000000)))))

(declare-fun lt!51076 () Unit!2553)

(declare-fun lt!51075 () Unit!2553)

(assert (=> d!9964 (= lt!51076 lt!51075)))

(assert (=> d!9964 (isPrefixOf!0 (_2!1824 lt!50853) (_2!1824 lt!50853))))

(assert (=> d!9964 (= lt!51075 (lemmaIsPrefixRefl!0 (_2!1824 lt!50853)))))

(declare-fun lt!51080 () Unit!2553)

(declare-fun lt!51087 () Unit!2553)

(assert (=> d!9964 (= lt!51080 lt!51087)))

(assert (=> d!9964 (= lt!51087 (lemmaIsPrefixRefl!0 (_2!1824 lt!50853)))))

(declare-fun lt!51073 () Unit!2553)

(declare-fun lt!51072 () Unit!2553)

(assert (=> d!9964 (= lt!51073 lt!51072)))

(assert (=> d!9964 (isPrefixOf!0 lt!51081 lt!51081)))

(assert (=> d!9964 (= lt!51072 (lemmaIsPrefixRefl!0 lt!51081))))

(declare-fun lt!51086 () Unit!2553)

(declare-fun lt!51077 () Unit!2553)

(assert (=> d!9964 (= lt!51086 lt!51077)))

(assert (=> d!9964 (isPrefixOf!0 (_2!1824 lt!50851) (_2!1824 lt!50851))))

(assert (=> d!9964 (= lt!51077 (lemmaIsPrefixRefl!0 (_2!1824 lt!50851)))))

(assert (=> d!9964 (= lt!51081 (BitStream!1461 (buf!1165 (_2!1824 lt!50853)) (currentByte!2538 (_2!1824 lt!50851)) (currentBit!2533 (_2!1824 lt!50851))))))

(assert (=> d!9964 (isPrefixOf!0 (_2!1824 lt!50851) (_2!1824 lt!50853))))

(assert (=> d!9964 (= (reader!0 (_2!1824 lt!50851) (_2!1824 lt!50853)) lt!51091)))

(declare-fun b!34594 () Bool)

(declare-fun res!29605 () Bool)

(assert (=> b!34594 (=> (not res!29605) (not e!22922))))

(assert (=> b!34594 (= res!29605 (isPrefixOf!0 (_2!1825 lt!51091) (_2!1824 lt!50853)))))

(declare-fun b!34595 () Bool)

(declare-fun res!29604 () Bool)

(assert (=> b!34595 (=> (not res!29604) (not e!22922))))

(assert (=> b!34595 (= res!29604 (isPrefixOf!0 (_1!1825 lt!51091) (_2!1824 lt!50851)))))

(declare-fun b!34596 () Bool)

(declare-fun lt!51078 () Unit!2553)

(assert (=> b!34596 (= e!22923 lt!51078)))

(declare-fun lt!51074 () (_ BitVec 64))

(assert (=> b!34596 (= lt!51074 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51090 () (_ BitVec 64))

(assert (=> b!34596 (= lt!51090 (bitIndex!0 (size!837 (buf!1165 (_2!1824 lt!50851))) (currentByte!2538 (_2!1824 lt!50851)) (currentBit!2533 (_2!1824 lt!50851))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1887 array!1887 (_ BitVec 64) (_ BitVec 64)) Unit!2553)

(assert (=> b!34596 (= lt!51078 (arrayBitRangesEqSymmetric!0 (buf!1165 (_2!1824 lt!50851)) (buf!1165 (_2!1824 lt!50853)) lt!51074 lt!51090))))

(assert (=> b!34596 (arrayBitRangesEq!0 (buf!1165 (_2!1824 lt!50853)) (buf!1165 (_2!1824 lt!50851)) lt!51074 lt!51090)))

(declare-fun b!34597 () Bool)

(declare-fun Unit!2565 () Unit!2553)

(assert (=> b!34597 (= e!22923 Unit!2565)))

(assert (= (and d!9964 c!2301) b!34596))

(assert (= (and d!9964 (not c!2301)) b!34597))

(assert (= (and d!9964 res!29606) b!34595))

(assert (= (and b!34595 res!29604) b!34594))

(assert (= (and b!34594 res!29605) b!34593))

(declare-fun m!51603 () Bool)

(assert (=> d!9964 m!51603))

(declare-fun m!51605 () Bool)

(assert (=> d!9964 m!51605))

(declare-fun m!51607 () Bool)

(assert (=> d!9964 m!51607))

(declare-fun m!51609 () Bool)

(assert (=> d!9964 m!51609))

(declare-fun m!51611 () Bool)

(assert (=> d!9964 m!51611))

(declare-fun m!51613 () Bool)

(assert (=> d!9964 m!51613))

(declare-fun m!51615 () Bool)

(assert (=> d!9964 m!51615))

(assert (=> d!9964 m!51415))

(declare-fun m!51617 () Bool)

(assert (=> d!9964 m!51617))

(declare-fun m!51619 () Bool)

(assert (=> d!9964 m!51619))

(declare-fun m!51621 () Bool)

(assert (=> d!9964 m!51621))

(declare-fun m!51623 () Bool)

(assert (=> b!34593 m!51623))

(assert (=> b!34593 m!51425))

(assert (=> b!34593 m!51443))

(declare-fun m!51625 () Bool)

(assert (=> b!34595 m!51625))

(assert (=> b!34596 m!51443))

(declare-fun m!51627 () Bool)

(assert (=> b!34596 m!51627))

(declare-fun m!51629 () Bool)

(assert (=> b!34596 m!51629))

(declare-fun m!51631 () Bool)

(assert (=> b!34594 m!51631))

(assert (=> b!34488 d!9964))

(declare-fun b!34608 () Bool)

(declare-fun e!22928 () Bool)

(declare-fun lt!51100 () List!431)

(declare-fun isEmpty!94 (List!431) Bool)

(assert (=> b!34608 (= e!22928 (isEmpty!94 lt!51100))))

(declare-fun b!34606 () Bool)

(declare-datatypes ((tuple2!3486 0))(
  ( (tuple2!3487 (_1!1830 List!431) (_2!1830 BitStream!1460)) )
))
(declare-fun e!22929 () tuple2!3486)

(assert (=> b!34606 (= e!22929 (tuple2!3487 Nil!428 (_1!1825 lt!50872)))))

(declare-fun b!34609 () Bool)

(assert (=> b!34609 (= e!22928 (> (length!157 lt!51100) 0))))

(declare-fun lt!51098 () (_ BitVec 64))

(declare-fun b!34607 () Bool)

(declare-datatypes ((tuple2!3488 0))(
  ( (tuple2!3489 (_1!1831 Bool) (_2!1831 BitStream!1460)) )
))
(declare-fun lt!51099 () tuple2!3488)

(assert (=> b!34607 (= e!22929 (tuple2!3487 (Cons!427 (_1!1831 lt!51099) (bitStreamReadBitsIntoList!0 (_2!1824 lt!50853) (_2!1831 lt!51099) (bvsub (bvsub to!314 i!635) lt!51098))) (_2!1831 lt!51099)))))

(declare-fun readBit!0 (BitStream!1460) tuple2!3488)

(assert (=> b!34607 (= lt!51099 (readBit!0 (_1!1825 lt!50872)))))

(assert (=> b!34607 (= lt!51098 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!9966 () Bool)

(assert (=> d!9966 e!22928))

(declare-fun c!2306 () Bool)

(assert (=> d!9966 (= c!2306 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9966 (= lt!51100 (_1!1830 e!22929))))

(declare-fun c!2307 () Bool)

(assert (=> d!9966 (= c!2307 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9966 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9966 (= (bitStreamReadBitsIntoList!0 (_2!1824 lt!50853) (_1!1825 lt!50872) (bvsub to!314 i!635)) lt!51100)))

(assert (= (and d!9966 c!2307) b!34606))

(assert (= (and d!9966 (not c!2307)) b!34607))

(assert (= (and d!9966 c!2306) b!34608))

(assert (= (and d!9966 (not c!2306)) b!34609))

(declare-fun m!51633 () Bool)

(assert (=> b!34608 m!51633))

(declare-fun m!51635 () Bool)

(assert (=> b!34609 m!51635))

(declare-fun m!51637 () Bool)

(assert (=> b!34607 m!51637))

(declare-fun m!51639 () Bool)

(assert (=> b!34607 m!51639))

(assert (=> b!34488 d!9966))

(declare-fun d!9968 () Bool)

(assert (=> d!9968 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!837 (buf!1165 (_2!1824 lt!50853)))) ((_ sign_extend 32) (currentByte!2538 (_2!1824 lt!50851))) ((_ sign_extend 32) (currentBit!2533 (_2!1824 lt!50851))) lt!50869) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!837 (buf!1165 (_2!1824 lt!50853)))) ((_ sign_extend 32) (currentByte!2538 (_2!1824 lt!50851))) ((_ sign_extend 32) (currentBit!2533 (_2!1824 lt!50851)))) lt!50869))))

(declare-fun bs!2718 () Bool)

(assert (= bs!2718 d!9968))

(declare-fun m!51641 () Bool)

(assert (=> bs!2718 m!51641))

(assert (=> b!34488 d!9968))

(declare-fun d!9970 () Bool)

(assert (=> d!9970 (validate_offset_bits!1 ((_ sign_extend 32) (size!837 (buf!1165 (_2!1824 lt!50853)))) ((_ sign_extend 32) (currentByte!2538 thiss!1379)) ((_ sign_extend 32) (currentBit!2533 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!51103 () Unit!2553)

(declare-fun choose!9 (BitStream!1460 array!1887 (_ BitVec 64) BitStream!1460) Unit!2553)

(assert (=> d!9970 (= lt!51103 (choose!9 thiss!1379 (buf!1165 (_2!1824 lt!50853)) (bvsub to!314 i!635) (BitStream!1461 (buf!1165 (_2!1824 lt!50853)) (currentByte!2538 thiss!1379) (currentBit!2533 thiss!1379))))))

(assert (=> d!9970 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1165 (_2!1824 lt!50853)) (bvsub to!314 i!635)) lt!51103)))

(declare-fun bs!2719 () Bool)

(assert (= bs!2719 d!9970))

(assert (=> bs!2719 m!51451))

(declare-fun m!51643 () Bool)

(assert (=> bs!2719 m!51643))

(assert (=> b!34488 d!9970))

(declare-fun d!9972 () Bool)

(assert (=> d!9972 (validate_offset_bits!1 ((_ sign_extend 32) (size!837 (buf!1165 (_2!1824 lt!50853)))) ((_ sign_extend 32) (currentByte!2538 (_2!1824 lt!50851))) ((_ sign_extend 32) (currentBit!2533 (_2!1824 lt!50851))) lt!50869)))

(declare-fun lt!51104 () Unit!2553)

(assert (=> d!9972 (= lt!51104 (choose!9 (_2!1824 lt!50851) (buf!1165 (_2!1824 lt!50853)) lt!50869 (BitStream!1461 (buf!1165 (_2!1824 lt!50853)) (currentByte!2538 (_2!1824 lt!50851)) (currentBit!2533 (_2!1824 lt!50851)))))))

(assert (=> d!9972 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1824 lt!50851) (buf!1165 (_2!1824 lt!50853)) lt!50869) lt!51104)))

(declare-fun bs!2720 () Bool)

(assert (= bs!2720 d!9972))

(assert (=> bs!2720 m!51453))

(declare-fun m!51645 () Bool)

(assert (=> bs!2720 m!51645))

(assert (=> b!34488 d!9972))

(declare-fun d!9974 () Bool)

(assert (=> d!9974 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!837 (buf!1165 (_2!1824 lt!50853)))) ((_ sign_extend 32) (currentByte!2538 thiss!1379)) ((_ sign_extend 32) (currentBit!2533 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!837 (buf!1165 (_2!1824 lt!50853)))) ((_ sign_extend 32) (currentByte!2538 thiss!1379)) ((_ sign_extend 32) (currentBit!2533 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2721 () Bool)

(assert (= bs!2721 d!9974))

(declare-fun m!51647 () Bool)

(assert (=> bs!2721 m!51647))

(assert (=> b!34488 d!9974))

(declare-fun b!34610 () Bool)

(declare-fun lt!51118 () (_ BitVec 64))

(declare-fun e!22930 () Bool)

(declare-fun lt!51124 () tuple2!3476)

(declare-fun lt!51117 () (_ BitVec 64))

(assert (=> b!34610 (= e!22930 (= (_1!1825 lt!51124) (withMovedBitIndex!0 (_2!1825 lt!51124) (bvsub lt!51118 lt!51117))))))

(assert (=> b!34610 (or (= (bvand lt!51118 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!51117 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!51118 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!51118 lt!51117) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!34610 (= lt!51117 (bitIndex!0 (size!837 (buf!1165 (_2!1824 lt!50853))) (currentByte!2538 (_2!1824 lt!50853)) (currentBit!2533 (_2!1824 lt!50853))))))

(assert (=> b!34610 (= lt!51118 (bitIndex!0 (size!837 (buf!1165 thiss!1379)) (currentByte!2538 thiss!1379) (currentBit!2533 thiss!1379)))))

(declare-fun d!9976 () Bool)

(assert (=> d!9976 e!22930))

(declare-fun res!29609 () Bool)

(assert (=> d!9976 (=> (not res!29609) (not e!22930))))

(assert (=> d!9976 (= res!29609 (isPrefixOf!0 (_1!1825 lt!51124) (_2!1825 lt!51124)))))

(declare-fun lt!51114 () BitStream!1460)

(assert (=> d!9976 (= lt!51124 (tuple2!3477 lt!51114 (_2!1824 lt!50853)))))

(declare-fun lt!51115 () Unit!2553)

(declare-fun lt!51122 () Unit!2553)

(assert (=> d!9976 (= lt!51115 lt!51122)))

(assert (=> d!9976 (isPrefixOf!0 lt!51114 (_2!1824 lt!50853))))

(assert (=> d!9976 (= lt!51122 (lemmaIsPrefixTransitive!0 lt!51114 (_2!1824 lt!50853) (_2!1824 lt!50853)))))

(declare-fun lt!51112 () Unit!2553)

(declare-fun lt!51116 () Unit!2553)

(assert (=> d!9976 (= lt!51112 lt!51116)))

(assert (=> d!9976 (isPrefixOf!0 lt!51114 (_2!1824 lt!50853))))

(assert (=> d!9976 (= lt!51116 (lemmaIsPrefixTransitive!0 lt!51114 thiss!1379 (_2!1824 lt!50853)))))

(declare-fun lt!51121 () Unit!2553)

(declare-fun e!22931 () Unit!2553)

(assert (=> d!9976 (= lt!51121 e!22931)))

(declare-fun c!2308 () Bool)

(assert (=> d!9976 (= c!2308 (not (= (size!837 (buf!1165 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!51109 () Unit!2553)

(declare-fun lt!51108 () Unit!2553)

(assert (=> d!9976 (= lt!51109 lt!51108)))

(assert (=> d!9976 (isPrefixOf!0 (_2!1824 lt!50853) (_2!1824 lt!50853))))

(assert (=> d!9976 (= lt!51108 (lemmaIsPrefixRefl!0 (_2!1824 lt!50853)))))

(declare-fun lt!51113 () Unit!2553)

(declare-fun lt!51120 () Unit!2553)

(assert (=> d!9976 (= lt!51113 lt!51120)))

(assert (=> d!9976 (= lt!51120 (lemmaIsPrefixRefl!0 (_2!1824 lt!50853)))))

(declare-fun lt!51106 () Unit!2553)

(declare-fun lt!51105 () Unit!2553)

(assert (=> d!9976 (= lt!51106 lt!51105)))

(assert (=> d!9976 (isPrefixOf!0 lt!51114 lt!51114)))

(assert (=> d!9976 (= lt!51105 (lemmaIsPrefixRefl!0 lt!51114))))

(declare-fun lt!51119 () Unit!2553)

(declare-fun lt!51110 () Unit!2553)

(assert (=> d!9976 (= lt!51119 lt!51110)))

(assert (=> d!9976 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!9976 (= lt!51110 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!9976 (= lt!51114 (BitStream!1461 (buf!1165 (_2!1824 lt!50853)) (currentByte!2538 thiss!1379) (currentBit!2533 thiss!1379)))))

(assert (=> d!9976 (isPrefixOf!0 thiss!1379 (_2!1824 lt!50853))))

(assert (=> d!9976 (= (reader!0 thiss!1379 (_2!1824 lt!50853)) lt!51124)))

(declare-fun b!34611 () Bool)

(declare-fun res!29608 () Bool)

(assert (=> b!34611 (=> (not res!29608) (not e!22930))))

(assert (=> b!34611 (= res!29608 (isPrefixOf!0 (_2!1825 lt!51124) (_2!1824 lt!50853)))))

(declare-fun b!34612 () Bool)

(declare-fun res!29607 () Bool)

(assert (=> b!34612 (=> (not res!29607) (not e!22930))))

(assert (=> b!34612 (= res!29607 (isPrefixOf!0 (_1!1825 lt!51124) thiss!1379))))

(declare-fun b!34613 () Bool)

(declare-fun lt!51111 () Unit!2553)

(assert (=> b!34613 (= e!22931 lt!51111)))

(declare-fun lt!51107 () (_ BitVec 64))

(assert (=> b!34613 (= lt!51107 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51123 () (_ BitVec 64))

(assert (=> b!34613 (= lt!51123 (bitIndex!0 (size!837 (buf!1165 thiss!1379)) (currentByte!2538 thiss!1379) (currentBit!2533 thiss!1379)))))

(assert (=> b!34613 (= lt!51111 (arrayBitRangesEqSymmetric!0 (buf!1165 thiss!1379) (buf!1165 (_2!1824 lt!50853)) lt!51107 lt!51123))))

(assert (=> b!34613 (arrayBitRangesEq!0 (buf!1165 (_2!1824 lt!50853)) (buf!1165 thiss!1379) lt!51107 lt!51123)))

(declare-fun b!34614 () Bool)

(declare-fun Unit!2566 () Unit!2553)

(assert (=> b!34614 (= e!22931 Unit!2566)))

(assert (= (and d!9976 c!2308) b!34613))

(assert (= (and d!9976 (not c!2308)) b!34614))

(assert (= (and d!9976 res!29609) b!34612))

(assert (= (and b!34612 res!29607) b!34611))

(assert (= (and b!34611 res!29608) b!34610))

(assert (=> d!9976 m!51603))

(assert (=> d!9976 m!51479))

(declare-fun m!51649 () Bool)

(assert (=> d!9976 m!51649))

(assert (=> d!9976 m!51609))

(declare-fun m!51651 () Bool)

(assert (=> d!9976 m!51651))

(assert (=> d!9976 m!51481))

(declare-fun m!51653 () Bool)

(assert (=> d!9976 m!51653))

(assert (=> d!9976 m!51417))

(declare-fun m!51655 () Bool)

(assert (=> d!9976 m!51655))

(declare-fun m!51657 () Bool)

(assert (=> d!9976 m!51657))

(declare-fun m!51659 () Bool)

(assert (=> d!9976 m!51659))

(declare-fun m!51661 () Bool)

(assert (=> b!34610 m!51661))

(assert (=> b!34610 m!51425))

(assert (=> b!34610 m!51483))

(declare-fun m!51663 () Bool)

(assert (=> b!34612 m!51663))

(assert (=> b!34613 m!51483))

(declare-fun m!51665 () Bool)

(assert (=> b!34613 m!51665))

(declare-fun m!51667 () Bool)

(assert (=> b!34613 m!51667))

(declare-fun m!51669 () Bool)

(assert (=> b!34611 m!51669))

(assert (=> b!34488 d!9976))

(declare-fun b!34617 () Bool)

(declare-fun e!22932 () Bool)

(declare-fun lt!51127 () List!431)

(assert (=> b!34617 (= e!22932 (isEmpty!94 lt!51127))))

(declare-fun b!34615 () Bool)

(declare-fun e!22933 () tuple2!3486)

(assert (=> b!34615 (= e!22933 (tuple2!3487 Nil!428 (_1!1825 lt!50868)))))

(declare-fun b!34618 () Bool)

(assert (=> b!34618 (= e!22932 (> (length!157 lt!51127) 0))))

(declare-fun lt!51126 () tuple2!3488)

(declare-fun b!34616 () Bool)

(declare-fun lt!51125 () (_ BitVec 64))

(assert (=> b!34616 (= e!22933 (tuple2!3487 (Cons!427 (_1!1831 lt!51126) (bitStreamReadBitsIntoList!0 (_2!1824 lt!50853) (_2!1831 lt!51126) (bvsub lt!50869 lt!51125))) (_2!1831 lt!51126)))))

(assert (=> b!34616 (= lt!51126 (readBit!0 (_1!1825 lt!50868)))))

(assert (=> b!34616 (= lt!51125 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!9978 () Bool)

(assert (=> d!9978 e!22932))

(declare-fun c!2309 () Bool)

(assert (=> d!9978 (= c!2309 (= lt!50869 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9978 (= lt!51127 (_1!1830 e!22933))))

(declare-fun c!2310 () Bool)

(assert (=> d!9978 (= c!2310 (= lt!50869 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9978 (bvsge lt!50869 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9978 (= (bitStreamReadBitsIntoList!0 (_2!1824 lt!50853) (_1!1825 lt!50868) lt!50869) lt!51127)))

(assert (= (and d!9978 c!2310) b!34615))

(assert (= (and d!9978 (not c!2310)) b!34616))

(assert (= (and d!9978 c!2309) b!34617))

(assert (= (and d!9978 (not c!2309)) b!34618))

(declare-fun m!51671 () Bool)

(assert (=> b!34617 m!51671))

(declare-fun m!51673 () Bool)

(assert (=> b!34618 m!51673))

(declare-fun m!51675 () Bool)

(assert (=> b!34616 m!51675))

(declare-fun m!51677 () Bool)

(assert (=> b!34616 m!51677))

(assert (=> b!34488 d!9978))

(declare-fun d!9980 () Bool)

(declare-fun e!22934 () Bool)

(assert (=> d!9980 e!22934))

(declare-fun res!29611 () Bool)

(assert (=> d!9980 (=> (not res!29611) (not e!22934))))

(declare-fun lt!51129 () (_ BitVec 64))

(declare-fun lt!51133 () (_ BitVec 64))

(declare-fun lt!51132 () (_ BitVec 64))

(assert (=> d!9980 (= res!29611 (= lt!51129 (bvsub lt!51133 lt!51132)))))

(assert (=> d!9980 (or (= (bvand lt!51133 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!51132 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!51133 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!51133 lt!51132) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!9980 (= lt!51132 (remainingBits!0 ((_ sign_extend 32) (size!837 (buf!1165 (_2!1824 lt!50853)))) ((_ sign_extend 32) (currentByte!2538 (_2!1824 lt!50853))) ((_ sign_extend 32) (currentBit!2533 (_2!1824 lt!50853)))))))

(declare-fun lt!51128 () (_ BitVec 64))

(declare-fun lt!51131 () (_ BitVec 64))

(assert (=> d!9980 (= lt!51133 (bvmul lt!51128 lt!51131))))

(assert (=> d!9980 (or (= lt!51128 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!51131 (bvsdiv (bvmul lt!51128 lt!51131) lt!51128)))))

(assert (=> d!9980 (= lt!51131 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!9980 (= lt!51128 ((_ sign_extend 32) (size!837 (buf!1165 (_2!1824 lt!50853)))))))

(assert (=> d!9980 (= lt!51129 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2538 (_2!1824 lt!50853))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2533 (_2!1824 lt!50853)))))))

(assert (=> d!9980 (invariant!0 (currentBit!2533 (_2!1824 lt!50853)) (currentByte!2538 (_2!1824 lt!50853)) (size!837 (buf!1165 (_2!1824 lt!50853))))))

(assert (=> d!9980 (= (bitIndex!0 (size!837 (buf!1165 (_2!1824 lt!50853))) (currentByte!2538 (_2!1824 lt!50853)) (currentBit!2533 (_2!1824 lt!50853))) lt!51129)))

(declare-fun b!34619 () Bool)

(declare-fun res!29610 () Bool)

(assert (=> b!34619 (=> (not res!29610) (not e!22934))))

(assert (=> b!34619 (= res!29610 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!51129))))

(declare-fun b!34620 () Bool)

(declare-fun lt!51130 () (_ BitVec 64))

(assert (=> b!34620 (= e!22934 (bvsle lt!51129 (bvmul lt!51130 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!34620 (or (= lt!51130 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!51130 #b0000000000000000000000000000000000000000000000000000000000001000) lt!51130)))))

(assert (=> b!34620 (= lt!51130 ((_ sign_extend 32) (size!837 (buf!1165 (_2!1824 lt!50853)))))))

(assert (= (and d!9980 res!29611) b!34619))

(assert (= (and b!34619 res!29610) b!34620))

(declare-fun m!51679 () Bool)

(assert (=> d!9980 m!51679))

(assert (=> d!9980 m!51485))

(assert (=> b!34477 d!9980))

(declare-fun d!9982 () Bool)

(declare-fun res!29614 () Bool)

(declare-fun e!22936 () Bool)

(assert (=> d!9982 (=> (not res!29614) (not e!22936))))

(assert (=> d!9982 (= res!29614 (= (size!837 (buf!1165 thiss!1379)) (size!837 (buf!1165 (_2!1824 lt!50851)))))))

(assert (=> d!9982 (= (isPrefixOf!0 thiss!1379 (_2!1824 lt!50851)) e!22936)))

(declare-fun b!34621 () Bool)

(declare-fun res!29612 () Bool)

(assert (=> b!34621 (=> (not res!29612) (not e!22936))))

(assert (=> b!34621 (= res!29612 (bvsle (bitIndex!0 (size!837 (buf!1165 thiss!1379)) (currentByte!2538 thiss!1379) (currentBit!2533 thiss!1379)) (bitIndex!0 (size!837 (buf!1165 (_2!1824 lt!50851))) (currentByte!2538 (_2!1824 lt!50851)) (currentBit!2533 (_2!1824 lt!50851)))))))

(declare-fun b!34622 () Bool)

(declare-fun e!22935 () Bool)

(assert (=> b!34622 (= e!22936 e!22935)))

(declare-fun res!29613 () Bool)

(assert (=> b!34622 (=> res!29613 e!22935)))

(assert (=> b!34622 (= res!29613 (= (size!837 (buf!1165 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!34623 () Bool)

(assert (=> b!34623 (= e!22935 (arrayBitRangesEq!0 (buf!1165 thiss!1379) (buf!1165 (_2!1824 lt!50851)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!837 (buf!1165 thiss!1379)) (currentByte!2538 thiss!1379) (currentBit!2533 thiss!1379))))))

(assert (= (and d!9982 res!29614) b!34621))

(assert (= (and b!34621 res!29612) b!34622))

(assert (= (and b!34622 (not res!29613)) b!34623))

(assert (=> b!34621 m!51483))

(assert (=> b!34621 m!51443))

(assert (=> b!34623 m!51483))

(assert (=> b!34623 m!51483))

(declare-fun m!51681 () Bool)

(assert (=> b!34623 m!51681))

(assert (=> b!34471 d!9982))

(declare-fun d!9984 () Bool)

(assert (=> d!9984 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!837 (buf!1165 (_2!1824 lt!50851)))) ((_ sign_extend 32) (currentByte!2538 (_2!1824 lt!50851))) ((_ sign_extend 32) (currentBit!2533 (_2!1824 lt!50851))) lt!50869) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!837 (buf!1165 (_2!1824 lt!50851)))) ((_ sign_extend 32) (currentByte!2538 (_2!1824 lt!50851))) ((_ sign_extend 32) (currentBit!2533 (_2!1824 lt!50851)))) lt!50869))))

(declare-fun bs!2722 () Bool)

(assert (= bs!2722 d!9984))

(assert (=> bs!2722 m!51597))

(assert (=> b!34471 d!9984))

(declare-fun d!9986 () Bool)

(declare-fun e!22939 () Bool)

(assert (=> d!9986 e!22939))

(declare-fun res!29617 () Bool)

(assert (=> d!9986 (=> (not res!29617) (not e!22939))))

(assert (=> d!9986 (= res!29617 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!51136 () Unit!2553)

(declare-fun choose!27 (BitStream!1460 BitStream!1460 (_ BitVec 64) (_ BitVec 64)) Unit!2553)

(assert (=> d!9986 (= lt!51136 (choose!27 thiss!1379 (_2!1824 lt!50851) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!9986 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!9986 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1824 lt!50851) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!51136)))

(declare-fun b!34626 () Bool)

(assert (=> b!34626 (= e!22939 (validate_offset_bits!1 ((_ sign_extend 32) (size!837 (buf!1165 (_2!1824 lt!50851)))) ((_ sign_extend 32) (currentByte!2538 (_2!1824 lt!50851))) ((_ sign_extend 32) (currentBit!2533 (_2!1824 lt!50851))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!9986 res!29617) b!34626))

(declare-fun m!51683 () Bool)

(assert (=> d!9986 m!51683))

(declare-fun m!51685 () Bool)

(assert (=> b!34626 m!51685))

(assert (=> b!34471 d!9986))

(declare-fun d!9988 () Bool)

(declare-fun e!22951 () Bool)

(assert (=> d!9988 e!22951))

(declare-fun res!29641 () Bool)

(assert (=> d!9988 (=> (not res!29641) (not e!22951))))

(declare-fun lt!51165 () tuple2!3474)

(assert (=> d!9988 (= res!29641 (= (size!837 (buf!1165 (_2!1824 lt!51165))) (size!837 (buf!1165 thiss!1379))))))

(declare-fun lt!51162 () (_ BitVec 8))

(declare-fun lt!51164 () array!1887)

(assert (=> d!9988 (= lt!51162 (select (arr!1315 lt!51164) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!9988 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!837 lt!51164)))))

(assert (=> d!9988 (= lt!51164 (array!1888 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!51161 () tuple2!3474)

(assert (=> d!9988 (= lt!51165 (tuple2!3475 (_1!1824 lt!51161) (_2!1824 lt!51161)))))

(declare-fun lt!51172 () tuple2!3474)

(assert (=> d!9988 (= lt!51161 lt!51172)))

(declare-fun e!22948 () Bool)

(assert (=> d!9988 e!22948))

(declare-fun res!29640 () Bool)

(assert (=> d!9988 (=> (not res!29640) (not e!22948))))

(assert (=> d!9988 (= res!29640 (= (size!837 (buf!1165 thiss!1379)) (size!837 (buf!1165 (_2!1824 lt!51172)))))))

(declare-fun lt!51168 () Bool)

(declare-fun appendBit!0 (BitStream!1460 Bool) tuple2!3474)

(assert (=> d!9988 (= lt!51172 (appendBit!0 thiss!1379 lt!51168))))

(assert (=> d!9988 (= lt!51168 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1315 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!9988 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!9988 (= (appendBitFromByte!0 thiss!1379 (select (arr!1315 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!51165)))

(declare-fun b!34644 () Bool)

(declare-fun res!29637 () Bool)

(assert (=> b!34644 (=> (not res!29637) (not e!22951))))

(declare-fun lt!51169 () (_ BitVec 64))

(declare-fun lt!51170 () (_ BitVec 64))

(assert (=> b!34644 (= res!29637 (= (bitIndex!0 (size!837 (buf!1165 (_2!1824 lt!51165))) (currentByte!2538 (_2!1824 lt!51165)) (currentBit!2533 (_2!1824 lt!51165))) (bvadd lt!51170 lt!51169)))))

(assert (=> b!34644 (or (not (= (bvand lt!51170 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!51169 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!51170 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!51170 lt!51169) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!34644 (= lt!51169 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!34644 (= lt!51170 (bitIndex!0 (size!837 (buf!1165 thiss!1379)) (currentByte!2538 thiss!1379) (currentBit!2533 thiss!1379)))))

(declare-fun b!34645 () Bool)

(declare-fun res!29639 () Bool)

(assert (=> b!34645 (=> (not res!29639) (not e!22948))))

(assert (=> b!34645 (= res!29639 (isPrefixOf!0 thiss!1379 (_2!1824 lt!51172)))))

(declare-fun b!34646 () Bool)

(declare-fun res!29636 () Bool)

(assert (=> b!34646 (=> (not res!29636) (not e!22951))))

(assert (=> b!34646 (= res!29636 (isPrefixOf!0 thiss!1379 (_2!1824 lt!51165)))))

(declare-fun b!34647 () Bool)

(declare-fun res!29634 () Bool)

(assert (=> b!34647 (=> (not res!29634) (not e!22948))))

(assert (=> b!34647 (= res!29634 (= (bitIndex!0 (size!837 (buf!1165 (_2!1824 lt!51172))) (currentByte!2538 (_2!1824 lt!51172)) (currentBit!2533 (_2!1824 lt!51172))) (bvadd (bitIndex!0 (size!837 (buf!1165 thiss!1379)) (currentByte!2538 thiss!1379) (currentBit!2533 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!34648 () Bool)

(declare-fun e!22949 () Bool)

(assert (=> b!34648 (= e!22951 e!22949)))

(declare-fun res!29638 () Bool)

(assert (=> b!34648 (=> (not res!29638) (not e!22949))))

(declare-datatypes ((tuple2!3492 0))(
  ( (tuple2!3493 (_1!1833 BitStream!1460) (_2!1833 Bool)) )
))
(declare-fun lt!51171 () tuple2!3492)

(assert (=> b!34648 (= res!29638 (and (= (_2!1833 lt!51171) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1315 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!51162)) #b00000000000000000000000000000000))) (= (_1!1833 lt!51171) (_2!1824 lt!51165))))))

(declare-datatypes ((tuple2!3494 0))(
  ( (tuple2!3495 (_1!1834 array!1887) (_2!1834 BitStream!1460)) )
))
(declare-fun lt!51167 () tuple2!3494)

(declare-fun lt!51163 () BitStream!1460)

(declare-fun readBits!0 (BitStream!1460 (_ BitVec 64)) tuple2!3494)

(assert (=> b!34648 (= lt!51167 (readBits!0 lt!51163 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1460) tuple2!3492)

(assert (=> b!34648 (= lt!51171 (readBitPure!0 lt!51163))))

(declare-fun readerFrom!0 (BitStream!1460 (_ BitVec 32) (_ BitVec 32)) BitStream!1460)

(assert (=> b!34648 (= lt!51163 (readerFrom!0 (_2!1824 lt!51165) (currentBit!2533 thiss!1379) (currentByte!2538 thiss!1379)))))

(declare-fun b!34649 () Bool)

(declare-fun e!22950 () Bool)

(declare-fun lt!51166 () tuple2!3492)

(assert (=> b!34649 (= e!22950 (= (bitIndex!0 (size!837 (buf!1165 (_1!1833 lt!51166))) (currentByte!2538 (_1!1833 lt!51166)) (currentBit!2533 (_1!1833 lt!51166))) (bitIndex!0 (size!837 (buf!1165 (_2!1824 lt!51172))) (currentByte!2538 (_2!1824 lt!51172)) (currentBit!2533 (_2!1824 lt!51172)))))))

(declare-fun b!34650 () Bool)

(assert (=> b!34650 (= e!22949 (= (bitIndex!0 (size!837 (buf!1165 (_1!1833 lt!51171))) (currentByte!2538 (_1!1833 lt!51171)) (currentBit!2533 (_1!1833 lt!51171))) (bitIndex!0 (size!837 (buf!1165 (_2!1824 lt!51165))) (currentByte!2538 (_2!1824 lt!51165)) (currentBit!2533 (_2!1824 lt!51165)))))))

(declare-fun b!34651 () Bool)

(assert (=> b!34651 (= e!22948 e!22950)))

(declare-fun res!29635 () Bool)

(assert (=> b!34651 (=> (not res!29635) (not e!22950))))

(assert (=> b!34651 (= res!29635 (and (= (_2!1833 lt!51166) lt!51168) (= (_1!1833 lt!51166) (_2!1824 lt!51172))))))

(assert (=> b!34651 (= lt!51166 (readBitPure!0 (readerFrom!0 (_2!1824 lt!51172) (currentBit!2533 thiss!1379) (currentByte!2538 thiss!1379))))))

(assert (= (and d!9988 res!29640) b!34647))

(assert (= (and b!34647 res!29634) b!34645))

(assert (= (and b!34645 res!29639) b!34651))

(assert (= (and b!34651 res!29635) b!34649))

(assert (= (and d!9988 res!29641) b!34644))

(assert (= (and b!34644 res!29637) b!34646))

(assert (= (and b!34646 res!29636) b!34648))

(assert (= (and b!34648 res!29638) b!34650))

(declare-fun m!51687 () Bool)

(assert (=> b!34650 m!51687))

(declare-fun m!51689 () Bool)

(assert (=> b!34650 m!51689))

(declare-fun m!51691 () Bool)

(assert (=> d!9988 m!51691))

(declare-fun m!51693 () Bool)

(assert (=> d!9988 m!51693))

(assert (=> d!9988 m!51577))

(declare-fun m!51695 () Bool)

(assert (=> b!34646 m!51695))

(declare-fun m!51697 () Bool)

(assert (=> b!34651 m!51697))

(assert (=> b!34651 m!51697))

(declare-fun m!51699 () Bool)

(assert (=> b!34651 m!51699))

(declare-fun m!51701 () Bool)

(assert (=> b!34647 m!51701))

(assert (=> b!34647 m!51483))

(declare-fun m!51703 () Bool)

(assert (=> b!34648 m!51703))

(declare-fun m!51705 () Bool)

(assert (=> b!34648 m!51705))

(declare-fun m!51707 () Bool)

(assert (=> b!34648 m!51707))

(assert (=> b!34644 m!51689))

(assert (=> b!34644 m!51483))

(declare-fun m!51709 () Bool)

(assert (=> b!34649 m!51709))

(assert (=> b!34649 m!51701))

(declare-fun m!51711 () Bool)

(assert (=> b!34645 m!51711))

(assert (=> b!34471 d!9988))

(declare-fun d!9990 () Bool)

(assert (=> d!9990 (validate_offset_bits!1 ((_ sign_extend 32) (size!837 (buf!1165 (_2!1824 lt!50851)))) ((_ sign_extend 32) (currentByte!2538 thiss!1379)) ((_ sign_extend 32) (currentBit!2533 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!51173 () Unit!2553)

(assert (=> d!9990 (= lt!51173 (choose!9 thiss!1379 (buf!1165 (_2!1824 lt!50851)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1461 (buf!1165 (_2!1824 lt!50851)) (currentByte!2538 thiss!1379) (currentBit!2533 thiss!1379))))))

(assert (=> d!9990 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1165 (_2!1824 lt!50851)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!51173)))

(declare-fun bs!2723 () Bool)

(assert (= bs!2723 d!9990))

(assert (=> bs!2723 m!51423))

(declare-fun m!51713 () Bool)

(assert (=> bs!2723 m!51713))

(assert (=> b!34481 d!9990))

(declare-fun d!9992 () Bool)

(declare-fun res!29644 () Bool)

(declare-fun e!22953 () Bool)

(assert (=> d!9992 (=> (not res!29644) (not e!22953))))

(assert (=> d!9992 (= res!29644 (= (size!837 (buf!1165 thiss!1379)) (size!837 (buf!1165 (_2!1824 lt!50853)))))))

(assert (=> d!9992 (= (isPrefixOf!0 thiss!1379 (_2!1824 lt!50853)) e!22953)))

(declare-fun b!34652 () Bool)

(declare-fun res!29642 () Bool)

(assert (=> b!34652 (=> (not res!29642) (not e!22953))))

(assert (=> b!34652 (= res!29642 (bvsle (bitIndex!0 (size!837 (buf!1165 thiss!1379)) (currentByte!2538 thiss!1379) (currentBit!2533 thiss!1379)) (bitIndex!0 (size!837 (buf!1165 (_2!1824 lt!50853))) (currentByte!2538 (_2!1824 lt!50853)) (currentBit!2533 (_2!1824 lt!50853)))))))

(declare-fun b!34653 () Bool)

(declare-fun e!22952 () Bool)

(assert (=> b!34653 (= e!22953 e!22952)))

(declare-fun res!29643 () Bool)

(assert (=> b!34653 (=> res!29643 e!22952)))

(assert (=> b!34653 (= res!29643 (= (size!837 (buf!1165 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!34654 () Bool)

(assert (=> b!34654 (= e!22952 (arrayBitRangesEq!0 (buf!1165 thiss!1379) (buf!1165 (_2!1824 lt!50853)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!837 (buf!1165 thiss!1379)) (currentByte!2538 thiss!1379) (currentBit!2533 thiss!1379))))))

(assert (= (and d!9992 res!29644) b!34652))

(assert (= (and b!34652 res!29642) b!34653))

(assert (= (and b!34653 (not res!29643)) b!34654))

(assert (=> b!34652 m!51483))

(assert (=> b!34652 m!51425))

(assert (=> b!34654 m!51483))

(assert (=> b!34654 m!51483))

(declare-fun m!51715 () Bool)

(assert (=> b!34654 m!51715))

(assert (=> b!34481 d!9992))

(declare-fun d!9994 () Bool)

(assert (=> d!9994 (isPrefixOf!0 thiss!1379 (_2!1824 lt!50853))))

(declare-fun lt!51176 () Unit!2553)

(declare-fun choose!30 (BitStream!1460 BitStream!1460 BitStream!1460) Unit!2553)

(assert (=> d!9994 (= lt!51176 (choose!30 thiss!1379 (_2!1824 lt!50851) (_2!1824 lt!50853)))))

(assert (=> d!9994 (isPrefixOf!0 thiss!1379 (_2!1824 lt!50851))))

(assert (=> d!9994 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1824 lt!50851) (_2!1824 lt!50853)) lt!51176)))

(declare-fun bs!2724 () Bool)

(assert (= bs!2724 d!9994))

(assert (=> bs!2724 m!51417))

(declare-fun m!51717 () Bool)

(assert (=> bs!2724 m!51717))

(assert (=> bs!2724 m!51469))

(assert (=> b!34481 d!9994))

(declare-fun lt!51776 () tuple2!3476)

(declare-fun b!34831 () Bool)

(declare-fun lt!51791 () tuple2!3474)

(declare-fun e!23035 () Bool)

(assert (=> b!34831 (= e!23035 (= (bitStreamReadBitsIntoList!0 (_2!1824 lt!51791) (_1!1825 lt!51776) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1824 lt!51791) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!34831 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!34831 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!51779 () Unit!2553)

(declare-fun lt!51764 () Unit!2553)

(assert (=> b!34831 (= lt!51779 lt!51764)))

(declare-fun lt!51774 () (_ BitVec 64))

(assert (=> b!34831 (validate_offset_bits!1 ((_ sign_extend 32) (size!837 (buf!1165 (_2!1824 lt!51791)))) ((_ sign_extend 32) (currentByte!2538 (_2!1824 lt!50851))) ((_ sign_extend 32) (currentBit!2533 (_2!1824 lt!50851))) lt!51774)))

(assert (=> b!34831 (= lt!51764 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1824 lt!50851) (buf!1165 (_2!1824 lt!51791)) lt!51774))))

(declare-fun e!23037 () Bool)

(assert (=> b!34831 e!23037))

(declare-fun res!29747 () Bool)

(assert (=> b!34831 (=> (not res!29747) (not e!23037))))

(assert (=> b!34831 (= res!29747 (and (= (size!837 (buf!1165 (_2!1824 lt!50851))) (size!837 (buf!1165 (_2!1824 lt!51791)))) (bvsge lt!51774 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!34831 (= lt!51774 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!34831 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!34831 (= lt!51776 (reader!0 (_2!1824 lt!50851) (_2!1824 lt!51791)))))

(declare-fun b!34832 () Bool)

(declare-fun e!23036 () tuple2!3474)

(declare-fun lt!51762 () tuple2!3474)

(declare-fun Unit!2575 () Unit!2553)

(assert (=> b!34832 (= e!23036 (tuple2!3475 Unit!2575 (_2!1824 lt!51762)))))

(declare-fun lt!51778 () tuple2!3474)

(assert (=> b!34832 (= lt!51778 (appendBitFromByte!0 (_2!1824 lt!50851) (select (arr!1315 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!51781 () (_ BitVec 64))

(assert (=> b!34832 (= lt!51781 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!51785 () (_ BitVec 64))

(assert (=> b!34832 (= lt!51785 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!51782 () Unit!2553)

(assert (=> b!34832 (= lt!51782 (validateOffsetBitsIneqLemma!0 (_2!1824 lt!50851) (_2!1824 lt!51778) lt!51781 lt!51785))))

(assert (=> b!34832 (validate_offset_bits!1 ((_ sign_extend 32) (size!837 (buf!1165 (_2!1824 lt!51778)))) ((_ sign_extend 32) (currentByte!2538 (_2!1824 lt!51778))) ((_ sign_extend 32) (currentBit!2533 (_2!1824 lt!51778))) (bvsub lt!51781 lt!51785))))

(declare-fun lt!51792 () Unit!2553)

(assert (=> b!34832 (= lt!51792 lt!51782)))

(declare-fun lt!51777 () tuple2!3476)

(assert (=> b!34832 (= lt!51777 (reader!0 (_2!1824 lt!50851) (_2!1824 lt!51778)))))

(declare-fun lt!51763 () (_ BitVec 64))

(assert (=> b!34832 (= lt!51763 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!51787 () Unit!2553)

(assert (=> b!34832 (= lt!51787 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1824 lt!50851) (buf!1165 (_2!1824 lt!51778)) lt!51763))))

(assert (=> b!34832 (validate_offset_bits!1 ((_ sign_extend 32) (size!837 (buf!1165 (_2!1824 lt!51778)))) ((_ sign_extend 32) (currentByte!2538 (_2!1824 lt!50851))) ((_ sign_extend 32) (currentBit!2533 (_2!1824 lt!50851))) lt!51763)))

(declare-fun lt!51758 () Unit!2553)

(assert (=> b!34832 (= lt!51758 lt!51787)))

(assert (=> b!34832 (= (head!268 (byteArrayBitContentToList!0 (_2!1824 lt!51778) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!268 (bitStreamReadBitsIntoList!0 (_2!1824 lt!51778) (_1!1825 lt!51777) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!51780 () Unit!2553)

(declare-fun Unit!2576 () Unit!2553)

(assert (=> b!34832 (= lt!51780 Unit!2576)))

(assert (=> b!34832 (= lt!51762 (appendBitsMSBFirstLoop!0 (_2!1824 lt!51778) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!51773 () Unit!2553)

(assert (=> b!34832 (= lt!51773 (lemmaIsPrefixTransitive!0 (_2!1824 lt!50851) (_2!1824 lt!51778) (_2!1824 lt!51762)))))

(assert (=> b!34832 (isPrefixOf!0 (_2!1824 lt!50851) (_2!1824 lt!51762))))

(declare-fun lt!51765 () Unit!2553)

(assert (=> b!34832 (= lt!51765 lt!51773)))

(assert (=> b!34832 (= (size!837 (buf!1165 (_2!1824 lt!51762))) (size!837 (buf!1165 (_2!1824 lt!50851))))))

(declare-fun lt!51786 () Unit!2553)

(declare-fun Unit!2577 () Unit!2553)

(assert (=> b!34832 (= lt!51786 Unit!2577)))

(assert (=> b!34832 (= (bitIndex!0 (size!837 (buf!1165 (_2!1824 lt!51762))) (currentByte!2538 (_2!1824 lt!51762)) (currentBit!2533 (_2!1824 lt!51762))) (bvsub (bvadd (bitIndex!0 (size!837 (buf!1165 (_2!1824 lt!50851))) (currentByte!2538 (_2!1824 lt!50851)) (currentBit!2533 (_2!1824 lt!50851))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!51766 () Unit!2553)

(declare-fun Unit!2578 () Unit!2553)

(assert (=> b!34832 (= lt!51766 Unit!2578)))

(assert (=> b!34832 (= (bitIndex!0 (size!837 (buf!1165 (_2!1824 lt!51762))) (currentByte!2538 (_2!1824 lt!51762)) (currentBit!2533 (_2!1824 lt!51762))) (bvsub (bvsub (bvadd (bitIndex!0 (size!837 (buf!1165 (_2!1824 lt!51778))) (currentByte!2538 (_2!1824 lt!51778)) (currentBit!2533 (_2!1824 lt!51778))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!51753 () Unit!2553)

(declare-fun Unit!2579 () Unit!2553)

(assert (=> b!34832 (= lt!51753 Unit!2579)))

(declare-fun lt!51783 () tuple2!3476)

(assert (=> b!34832 (= lt!51783 (reader!0 (_2!1824 lt!50851) (_2!1824 lt!51762)))))

(declare-fun lt!51771 () (_ BitVec 64))

(assert (=> b!34832 (= lt!51771 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!51788 () Unit!2553)

(assert (=> b!34832 (= lt!51788 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1824 lt!50851) (buf!1165 (_2!1824 lt!51762)) lt!51771))))

(assert (=> b!34832 (validate_offset_bits!1 ((_ sign_extend 32) (size!837 (buf!1165 (_2!1824 lt!51762)))) ((_ sign_extend 32) (currentByte!2538 (_2!1824 lt!50851))) ((_ sign_extend 32) (currentBit!2533 (_2!1824 lt!50851))) lt!51771)))

(declare-fun lt!51761 () Unit!2553)

(assert (=> b!34832 (= lt!51761 lt!51788)))

(declare-fun lt!51794 () tuple2!3476)

(declare-fun call!436 () tuple2!3476)

(assert (=> b!34832 (= lt!51794 call!436)))

(declare-fun lt!51789 () (_ BitVec 64))

(assert (=> b!34832 (= lt!51789 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!51775 () Unit!2553)

(assert (=> b!34832 (= lt!51775 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1824 lt!51778) (buf!1165 (_2!1824 lt!51762)) lt!51789))))

(assert (=> b!34832 (validate_offset_bits!1 ((_ sign_extend 32) (size!837 (buf!1165 (_2!1824 lt!51762)))) ((_ sign_extend 32) (currentByte!2538 (_2!1824 lt!51778))) ((_ sign_extend 32) (currentBit!2533 (_2!1824 lt!51778))) lt!51789)))

(declare-fun lt!51793 () Unit!2553)

(assert (=> b!34832 (= lt!51793 lt!51775)))

(declare-fun lt!51767 () List!431)

(assert (=> b!34832 (= lt!51767 (byteArrayBitContentToList!0 (_2!1824 lt!51762) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!51754 () List!431)

(assert (=> b!34832 (= lt!51754 (byteArrayBitContentToList!0 (_2!1824 lt!51762) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!51760 () List!431)

(assert (=> b!34832 (= lt!51760 (bitStreamReadBitsIntoList!0 (_2!1824 lt!51762) (_1!1825 lt!51783) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!51751 () List!431)

(assert (=> b!34832 (= lt!51751 (bitStreamReadBitsIntoList!0 (_2!1824 lt!51762) (_1!1825 lt!51794) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!51772 () (_ BitVec 64))

(assert (=> b!34832 (= lt!51772 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!51755 () Unit!2553)

(assert (=> b!34832 (= lt!51755 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1824 lt!51762) (_2!1824 lt!51762) (_1!1825 lt!51783) (_1!1825 lt!51794) lt!51772 lt!51760))))

(assert (=> b!34832 (= (bitStreamReadBitsIntoList!0 (_2!1824 lt!51762) (_1!1825 lt!51794) (bvsub lt!51772 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!148 lt!51760))))

(declare-fun lt!51768 () Unit!2553)

(assert (=> b!34832 (= lt!51768 lt!51755)))

(declare-fun lt!51784 () Unit!2553)

(declare-fun lt!51752 () (_ BitVec 64))

(assert (=> b!34832 (= lt!51784 (arrayBitRangesEqImpliesEq!0 (buf!1165 (_2!1824 lt!51778)) (buf!1165 (_2!1824 lt!51762)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!51752 (bitIndex!0 (size!837 (buf!1165 (_2!1824 lt!51778))) (currentByte!2538 (_2!1824 lt!51778)) (currentBit!2533 (_2!1824 lt!51778)))))))

(assert (=> b!34832 (= (bitAt!0 (buf!1165 (_2!1824 lt!51778)) lt!51752) (bitAt!0 (buf!1165 (_2!1824 lt!51762)) lt!51752))))

(declare-fun lt!51769 () Unit!2553)

(assert (=> b!34832 (= lt!51769 lt!51784)))

(declare-fun b!34833 () Bool)

(assert (=> b!34833 (= e!23037 (validate_offset_bits!1 ((_ sign_extend 32) (size!837 (buf!1165 (_2!1824 lt!50851)))) ((_ sign_extend 32) (currentByte!2538 (_2!1824 lt!50851))) ((_ sign_extend 32) (currentBit!2533 (_2!1824 lt!50851))) lt!51774))))

(declare-fun b!34834 () Bool)

(declare-fun res!29752 () Bool)

(assert (=> b!34834 (=> (not res!29752) (not e!23035))))

(assert (=> b!34834 (= res!29752 (= (size!837 (buf!1165 (_2!1824 lt!51791))) (size!837 (buf!1165 (_2!1824 lt!50851)))))))

(declare-fun b!34835 () Bool)

(declare-fun res!29749 () Bool)

(assert (=> b!34835 (=> (not res!29749) (not e!23035))))

(assert (=> b!34835 (= res!29749 (= (size!837 (buf!1165 (_2!1824 lt!50851))) (size!837 (buf!1165 (_2!1824 lt!51791)))))))

(declare-fun bm!433 () Bool)

(declare-fun c!2348 () Bool)

(assert (=> bm!433 (= call!436 (reader!0 (ite c!2348 (_2!1824 lt!51778) (_2!1824 lt!50851)) (ite c!2348 (_2!1824 lt!51762) (_2!1824 lt!50851))))))

(declare-fun b!34836 () Bool)

(declare-fun res!29751 () Bool)

(assert (=> b!34836 (=> (not res!29751) (not e!23035))))

(assert (=> b!34836 (= res!29751 (isPrefixOf!0 (_2!1824 lt!50851) (_2!1824 lt!51791)))))

(declare-fun b!34837 () Bool)

(declare-fun Unit!2581 () Unit!2553)

(assert (=> b!34837 (= e!23036 (tuple2!3475 Unit!2581 (_2!1824 lt!50851)))))

(assert (=> b!34837 (= (size!837 (buf!1165 (_2!1824 lt!50851))) (size!837 (buf!1165 (_2!1824 lt!50851))))))

(declare-fun lt!51759 () Unit!2553)

(declare-fun Unit!2582 () Unit!2553)

(assert (=> b!34837 (= lt!51759 Unit!2582)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1460 array!1887 array!1887 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!34837 (checkByteArrayBitContent!0 (_2!1824 lt!50851) srcBuffer!2 (_1!1834 (readBits!0 (_1!1825 call!436) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!34838 () Bool)

(declare-fun res!29748 () Bool)

(assert (=> b!34838 (=> (not res!29748) (not e!23035))))

(assert (=> b!34838 (= res!29748 (invariant!0 (currentBit!2533 (_2!1824 lt!51791)) (currentByte!2538 (_2!1824 lt!51791)) (size!837 (buf!1165 (_2!1824 lt!51791)))))))

(declare-fun d!9996 () Bool)

(assert (=> d!9996 e!23035))

(declare-fun res!29750 () Bool)

(assert (=> d!9996 (=> (not res!29750) (not e!23035))))

(declare-fun lt!51756 () (_ BitVec 64))

(assert (=> d!9996 (= res!29750 (= (bitIndex!0 (size!837 (buf!1165 (_2!1824 lt!51791))) (currentByte!2538 (_2!1824 lt!51791)) (currentBit!2533 (_2!1824 lt!51791))) (bvsub lt!51756 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!9996 (or (= (bvand lt!51756 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!51756 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!51756 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!51770 () (_ BitVec 64))

(assert (=> d!9996 (= lt!51756 (bvadd lt!51770 to!314))))

(assert (=> d!9996 (or (not (= (bvand lt!51770 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!51770 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!51770 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!9996 (= lt!51770 (bitIndex!0 (size!837 (buf!1165 (_2!1824 lt!50851))) (currentByte!2538 (_2!1824 lt!50851)) (currentBit!2533 (_2!1824 lt!50851))))))

(assert (=> d!9996 (= lt!51791 e!23036)))

(assert (=> d!9996 (= c!2348 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!51790 () Unit!2553)

(declare-fun lt!51757 () Unit!2553)

(assert (=> d!9996 (= lt!51790 lt!51757)))

(assert (=> d!9996 (isPrefixOf!0 (_2!1824 lt!50851) (_2!1824 lt!50851))))

(assert (=> d!9996 (= lt!51757 (lemmaIsPrefixRefl!0 (_2!1824 lt!50851)))))

(assert (=> d!9996 (= lt!51752 (bitIndex!0 (size!837 (buf!1165 (_2!1824 lt!50851))) (currentByte!2538 (_2!1824 lt!50851)) (currentBit!2533 (_2!1824 lt!50851))))))

(assert (=> d!9996 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9996 (= (appendBitsMSBFirstLoop!0 (_2!1824 lt!50851) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!51791)))

(assert (= (and d!9996 c!2348) b!34832))

(assert (= (and d!9996 (not c!2348)) b!34837))

(assert (= (or b!34832 b!34837) bm!433))

(assert (= (and d!9996 res!29750) b!34838))

(assert (= (and b!34838 res!29748) b!34835))

(assert (= (and b!34835 res!29749) b!34836))

(assert (= (and b!34836 res!29751) b!34834))

(assert (= (and b!34834 res!29752) b!34831))

(assert (= (and b!34831 res!29747) b!34833))

(declare-fun m!52123 () Bool)

(assert (=> b!34836 m!52123))

(declare-fun m!52125 () Bool)

(assert (=> b!34837 m!52125))

(declare-fun m!52127 () Bool)

(assert (=> b!34837 m!52127))

(declare-fun m!52129 () Bool)

(assert (=> b!34832 m!52129))

(declare-fun m!52131 () Bool)

(assert (=> b!34832 m!52131))

(declare-fun m!52133 () Bool)

(assert (=> b!34832 m!52133))

(declare-fun m!52135 () Bool)

(assert (=> b!34832 m!52135))

(assert (=> b!34832 m!52133))

(declare-fun m!52137 () Bool)

(assert (=> b!34832 m!52137))

(declare-fun m!52139 () Bool)

(assert (=> b!34832 m!52139))

(declare-fun m!52141 () Bool)

(assert (=> b!34832 m!52141))

(declare-fun m!52143 () Bool)

(assert (=> b!34832 m!52143))

(declare-fun m!52145 () Bool)

(assert (=> b!34832 m!52145))

(declare-fun m!52147 () Bool)

(assert (=> b!34832 m!52147))

(declare-fun m!52149 () Bool)

(assert (=> b!34832 m!52149))

(declare-fun m!52151 () Bool)

(assert (=> b!34832 m!52151))

(declare-fun m!52153 () Bool)

(assert (=> b!34832 m!52153))

(declare-fun m!52155 () Bool)

(assert (=> b!34832 m!52155))

(declare-fun m!52159 () Bool)

(assert (=> b!34832 m!52159))

(declare-fun m!52161 () Bool)

(assert (=> b!34832 m!52161))

(declare-fun m!52163 () Bool)

(assert (=> b!34832 m!52163))

(declare-fun m!52165 () Bool)

(assert (=> b!34832 m!52165))

(declare-fun m!52167 () Bool)

(assert (=> b!34832 m!52167))

(declare-fun m!52169 () Bool)

(assert (=> b!34832 m!52169))

(declare-fun m!52171 () Bool)

(assert (=> b!34832 m!52171))

(declare-fun m!52173 () Bool)

(assert (=> b!34832 m!52173))

(declare-fun m!52175 () Bool)

(assert (=> b!34832 m!52175))

(assert (=> b!34832 m!51443))

(declare-fun m!52177 () Bool)

(assert (=> b!34832 m!52177))

(declare-fun m!52179 () Bool)

(assert (=> b!34832 m!52179))

(declare-fun m!52181 () Bool)

(assert (=> b!34832 m!52181))

(declare-fun m!52183 () Bool)

(assert (=> b!34832 m!52183))

(declare-fun m!52185 () Bool)

(assert (=> b!34832 m!52185))

(declare-fun m!52187 () Bool)

(assert (=> b!34832 m!52187))

(assert (=> b!34832 m!52151))

(assert (=> b!34832 m!52129))

(declare-fun m!52189 () Bool)

(assert (=> b!34832 m!52189))

(assert (=> b!34832 m!52169))

(declare-fun m!52191 () Bool)

(assert (=> b!34832 m!52191))

(declare-fun m!52193 () Bool)

(assert (=> b!34831 m!52193))

(declare-fun m!52195 () Bool)

(assert (=> b!34831 m!52195))

(declare-fun m!52197 () Bool)

(assert (=> b!34831 m!52197))

(declare-fun m!52199 () Bool)

(assert (=> b!34831 m!52199))

(declare-fun m!52201 () Bool)

(assert (=> b!34831 m!52201))

(declare-fun m!52203 () Bool)

(assert (=> b!34833 m!52203))

(declare-fun m!52205 () Bool)

(assert (=> b!34838 m!52205))

(declare-fun m!52207 () Bool)

(assert (=> bm!433 m!52207))

(declare-fun m!52209 () Bool)

(assert (=> d!9996 m!52209))

(assert (=> d!9996 m!51443))

(assert (=> d!9996 m!51605))

(assert (=> d!9996 m!51613))

(assert (=> b!34481 d!9996))

(declare-fun d!10114 () Bool)

(assert (=> d!10114 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!837 (buf!1165 (_2!1824 lt!50851)))) ((_ sign_extend 32) (currentByte!2538 thiss!1379)) ((_ sign_extend 32) (currentBit!2533 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!837 (buf!1165 (_2!1824 lt!50851)))) ((_ sign_extend 32) (currentByte!2538 thiss!1379)) ((_ sign_extend 32) (currentBit!2533 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2750 () Bool)

(assert (= bs!2750 d!10114))

(declare-fun m!52211 () Bool)

(assert (=> bs!2750 m!52211))

(assert (=> b!34481 d!10114))

(declare-fun d!10116 () Bool)

(declare-fun res!29758 () Bool)

(declare-fun e!23041 () Bool)

(assert (=> d!10116 (=> (not res!29758) (not e!23041))))

(assert (=> d!10116 (= res!29758 (= (size!837 (buf!1165 (_2!1824 lt!50851))) (size!837 (buf!1165 (_2!1824 lt!50853)))))))

(assert (=> d!10116 (= (isPrefixOf!0 (_2!1824 lt!50851) (_2!1824 lt!50853)) e!23041)))

(declare-fun b!34842 () Bool)

(declare-fun res!29756 () Bool)

(assert (=> b!34842 (=> (not res!29756) (not e!23041))))

(assert (=> b!34842 (= res!29756 (bvsle (bitIndex!0 (size!837 (buf!1165 (_2!1824 lt!50851))) (currentByte!2538 (_2!1824 lt!50851)) (currentBit!2533 (_2!1824 lt!50851))) (bitIndex!0 (size!837 (buf!1165 (_2!1824 lt!50853))) (currentByte!2538 (_2!1824 lt!50853)) (currentBit!2533 (_2!1824 lt!50853)))))))

(declare-fun b!34843 () Bool)

(declare-fun e!23040 () Bool)

(assert (=> b!34843 (= e!23041 e!23040)))

(declare-fun res!29757 () Bool)

(assert (=> b!34843 (=> res!29757 e!23040)))

(assert (=> b!34843 (= res!29757 (= (size!837 (buf!1165 (_2!1824 lt!50851))) #b00000000000000000000000000000000))))

(declare-fun b!34844 () Bool)

(assert (=> b!34844 (= e!23040 (arrayBitRangesEq!0 (buf!1165 (_2!1824 lt!50851)) (buf!1165 (_2!1824 lt!50853)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!837 (buf!1165 (_2!1824 lt!50851))) (currentByte!2538 (_2!1824 lt!50851)) (currentBit!2533 (_2!1824 lt!50851)))))))

(assert (= (and d!10116 res!29758) b!34842))

(assert (= (and b!34842 res!29756) b!34843))

(assert (= (and b!34843 (not res!29757)) b!34844))

(assert (=> b!34842 m!51443))

(assert (=> b!34842 m!51425))

(assert (=> b!34844 m!51443))

(assert (=> b!34844 m!51443))

(declare-fun m!52213 () Bool)

(assert (=> b!34844 m!52213))

(assert (=> b!34481 d!10116))

(declare-fun lt!51807 () (_ BitVec 64))

(declare-fun e!23042 () Bool)

(declare-fun lt!51808 () (_ BitVec 64))

(declare-fun b!34845 () Bool)

(declare-fun lt!51814 () tuple2!3476)

(assert (=> b!34845 (= e!23042 (= (_1!1825 lt!51814) (withMovedBitIndex!0 (_2!1825 lt!51814) (bvsub lt!51808 lt!51807))))))

(assert (=> b!34845 (or (= (bvand lt!51808 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!51807 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!51808 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!51808 lt!51807) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!34845 (= lt!51807 (bitIndex!0 (size!837 (buf!1165 (_2!1824 lt!50851))) (currentByte!2538 (_2!1824 lt!50851)) (currentBit!2533 (_2!1824 lt!50851))))))

(assert (=> b!34845 (= lt!51808 (bitIndex!0 (size!837 (buf!1165 thiss!1379)) (currentByte!2538 thiss!1379) (currentBit!2533 thiss!1379)))))

(declare-fun d!10118 () Bool)

(assert (=> d!10118 e!23042))

(declare-fun res!29761 () Bool)

(assert (=> d!10118 (=> (not res!29761) (not e!23042))))

(assert (=> d!10118 (= res!29761 (isPrefixOf!0 (_1!1825 lt!51814) (_2!1825 lt!51814)))))

(declare-fun lt!51804 () BitStream!1460)

(assert (=> d!10118 (= lt!51814 (tuple2!3477 lt!51804 (_2!1824 lt!50851)))))

(declare-fun lt!51805 () Unit!2553)

(declare-fun lt!51812 () Unit!2553)

(assert (=> d!10118 (= lt!51805 lt!51812)))

(assert (=> d!10118 (isPrefixOf!0 lt!51804 (_2!1824 lt!50851))))

(assert (=> d!10118 (= lt!51812 (lemmaIsPrefixTransitive!0 lt!51804 (_2!1824 lt!50851) (_2!1824 lt!50851)))))

(declare-fun lt!51802 () Unit!2553)

(declare-fun lt!51806 () Unit!2553)

(assert (=> d!10118 (= lt!51802 lt!51806)))

(assert (=> d!10118 (isPrefixOf!0 lt!51804 (_2!1824 lt!50851))))

(assert (=> d!10118 (= lt!51806 (lemmaIsPrefixTransitive!0 lt!51804 thiss!1379 (_2!1824 lt!50851)))))

(declare-fun lt!51811 () Unit!2553)

(declare-fun e!23043 () Unit!2553)

(assert (=> d!10118 (= lt!51811 e!23043)))

(declare-fun c!2349 () Bool)

(assert (=> d!10118 (= c!2349 (not (= (size!837 (buf!1165 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!51799 () Unit!2553)

(declare-fun lt!51798 () Unit!2553)

(assert (=> d!10118 (= lt!51799 lt!51798)))

(assert (=> d!10118 (isPrefixOf!0 (_2!1824 lt!50851) (_2!1824 lt!50851))))

(assert (=> d!10118 (= lt!51798 (lemmaIsPrefixRefl!0 (_2!1824 lt!50851)))))

(declare-fun lt!51803 () Unit!2553)

(declare-fun lt!51810 () Unit!2553)

(assert (=> d!10118 (= lt!51803 lt!51810)))

(assert (=> d!10118 (= lt!51810 (lemmaIsPrefixRefl!0 (_2!1824 lt!50851)))))

(declare-fun lt!51796 () Unit!2553)

(declare-fun lt!51795 () Unit!2553)

(assert (=> d!10118 (= lt!51796 lt!51795)))

(assert (=> d!10118 (isPrefixOf!0 lt!51804 lt!51804)))

(assert (=> d!10118 (= lt!51795 (lemmaIsPrefixRefl!0 lt!51804))))

(declare-fun lt!51809 () Unit!2553)

(declare-fun lt!51800 () Unit!2553)

(assert (=> d!10118 (= lt!51809 lt!51800)))

(assert (=> d!10118 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!10118 (= lt!51800 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!10118 (= lt!51804 (BitStream!1461 (buf!1165 (_2!1824 lt!50851)) (currentByte!2538 thiss!1379) (currentBit!2533 thiss!1379)))))

(assert (=> d!10118 (isPrefixOf!0 thiss!1379 (_2!1824 lt!50851))))

(assert (=> d!10118 (= (reader!0 thiss!1379 (_2!1824 lt!50851)) lt!51814)))

(declare-fun b!34846 () Bool)

(declare-fun res!29760 () Bool)

(assert (=> b!34846 (=> (not res!29760) (not e!23042))))

(assert (=> b!34846 (= res!29760 (isPrefixOf!0 (_2!1825 lt!51814) (_2!1824 lt!50851)))))

(declare-fun b!34847 () Bool)

(declare-fun res!29759 () Bool)

(assert (=> b!34847 (=> (not res!29759) (not e!23042))))

(assert (=> b!34847 (= res!29759 (isPrefixOf!0 (_1!1825 lt!51814) thiss!1379))))

(declare-fun b!34848 () Bool)

(declare-fun lt!51801 () Unit!2553)

(assert (=> b!34848 (= e!23043 lt!51801)))

(declare-fun lt!51797 () (_ BitVec 64))

(assert (=> b!34848 (= lt!51797 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51813 () (_ BitVec 64))

(assert (=> b!34848 (= lt!51813 (bitIndex!0 (size!837 (buf!1165 thiss!1379)) (currentByte!2538 thiss!1379) (currentBit!2533 thiss!1379)))))

(assert (=> b!34848 (= lt!51801 (arrayBitRangesEqSymmetric!0 (buf!1165 thiss!1379) (buf!1165 (_2!1824 lt!50851)) lt!51797 lt!51813))))

(assert (=> b!34848 (arrayBitRangesEq!0 (buf!1165 (_2!1824 lt!50851)) (buf!1165 thiss!1379) lt!51797 lt!51813)))

(declare-fun b!34849 () Bool)

(declare-fun Unit!2584 () Unit!2553)

(assert (=> b!34849 (= e!23043 Unit!2584)))

(assert (= (and d!10118 c!2349) b!34848))

(assert (= (and d!10118 (not c!2349)) b!34849))

(assert (= (and d!10118 res!29761) b!34847))

(assert (= (and b!34847 res!29759) b!34846))

(assert (= (and b!34846 res!29760) b!34845))

(assert (=> d!10118 m!51605))

(assert (=> d!10118 m!51479))

(declare-fun m!52215 () Bool)

(assert (=> d!10118 m!52215))

(assert (=> d!10118 m!51613))

(declare-fun m!52217 () Bool)

(assert (=> d!10118 m!52217))

(assert (=> d!10118 m!51481))

(declare-fun m!52219 () Bool)

(assert (=> d!10118 m!52219))

(assert (=> d!10118 m!51469))

(declare-fun m!52221 () Bool)

(assert (=> d!10118 m!52221))

(declare-fun m!52223 () Bool)

(assert (=> d!10118 m!52223))

(declare-fun m!52225 () Bool)

(assert (=> d!10118 m!52225))

(declare-fun m!52227 () Bool)

(assert (=> b!34845 m!52227))

(assert (=> b!34845 m!51443))

(assert (=> b!34845 m!51483))

(declare-fun m!52229 () Bool)

(assert (=> b!34847 m!52229))

(assert (=> b!34848 m!51483))

(declare-fun m!52231 () Bool)

(assert (=> b!34848 m!52231))

(declare-fun m!52233 () Bool)

(assert (=> b!34848 m!52233))

(declare-fun m!52235 () Bool)

(assert (=> b!34846 m!52235))

(assert (=> b!34481 d!10118))

(declare-fun d!10120 () Bool)

(assert (=> d!10120 (= (tail!148 lt!50867) (t!1181 lt!50867))))

(assert (=> b!34470 d!10120))

(declare-fun d!10122 () Bool)

(declare-fun e!23049 () Bool)

(assert (=> d!10122 e!23049))

(declare-fun res!29767 () Bool)

(assert (=> d!10122 (=> (not res!29767) (not e!23049))))

(declare-fun lt!51823 () (_ BitVec 64))

(assert (=> d!10122 (= res!29767 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!51823 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!51823) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!10122 (= lt!51823 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!51822 () Unit!2553)

(declare-fun choose!42 (BitStream!1460 BitStream!1460 BitStream!1460 BitStream!1460 (_ BitVec 64) List!431) Unit!2553)

(assert (=> d!10122 (= lt!51822 (choose!42 (_2!1824 lt!50853) (_2!1824 lt!50853) (_1!1825 lt!50872) (_1!1825 lt!50868) (bvsub to!314 i!635) lt!50867))))

(assert (=> d!10122 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10122 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1824 lt!50853) (_2!1824 lt!50853) (_1!1825 lt!50872) (_1!1825 lt!50868) (bvsub to!314 i!635) lt!50867) lt!51822)))

(declare-fun b!34855 () Bool)

(assert (=> b!34855 (= e!23049 (= (bitStreamReadBitsIntoList!0 (_2!1824 lt!50853) (_1!1825 lt!50868) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!148 lt!50867)))))

(assert (= (and d!10122 res!29767) b!34855))

(declare-fun m!52241 () Bool)

(assert (=> d!10122 m!52241))

(declare-fun m!52243 () Bool)

(assert (=> b!34855 m!52243))

(assert (=> b!34855 m!51405))

(assert (=> b!34470 d!10122))

(declare-fun d!10126 () Bool)

(assert (=> d!10126 (= (head!268 (byteArrayBitContentToList!0 (_2!1824 lt!50851) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!546 (byteArrayBitContentToList!0 (_2!1824 lt!50851) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!34480 d!10126))

(declare-fun d!10128 () Bool)

(declare-fun c!2350 () Bool)

(assert (=> d!10128 (= c!2350 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!23050 () List!431)

(assert (=> d!10128 (= (byteArrayBitContentToList!0 (_2!1824 lt!50851) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!23050)))

(declare-fun b!34856 () Bool)

(assert (=> b!34856 (= e!23050 Nil!428)))

(declare-fun b!34857 () Bool)

(assert (=> b!34857 (= e!23050 (Cons!427 (not (= (bvand ((_ sign_extend 24) (select (arr!1315 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1824 lt!50851) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!10128 c!2350) b!34856))

(assert (= (and d!10128 (not c!2350)) b!34857))

(assert (=> b!34857 m!51471))

(assert (=> b!34857 m!51577))

(declare-fun m!52245 () Bool)

(assert (=> b!34857 m!52245))

(assert (=> b!34480 d!10128))

(declare-fun d!10130 () Bool)

(assert (=> d!10130 (= (head!268 (bitStreamReadBitsIntoList!0 (_2!1824 lt!50851) (_1!1825 lt!50863) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!546 (bitStreamReadBitsIntoList!0 (_2!1824 lt!50851) (_1!1825 lt!50863) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!34480 d!10130))

(declare-fun b!34860 () Bool)

(declare-fun e!23051 () Bool)

(declare-fun lt!51826 () List!431)

(assert (=> b!34860 (= e!23051 (isEmpty!94 lt!51826))))

(declare-fun b!34858 () Bool)

(declare-fun e!23052 () tuple2!3486)

(assert (=> b!34858 (= e!23052 (tuple2!3487 Nil!428 (_1!1825 lt!50863)))))

(declare-fun b!34861 () Bool)

(assert (=> b!34861 (= e!23051 (> (length!157 lt!51826) 0))))

(declare-fun b!34859 () Bool)

(declare-fun lt!51824 () (_ BitVec 64))

(declare-fun lt!51825 () tuple2!3488)

(assert (=> b!34859 (= e!23052 (tuple2!3487 (Cons!427 (_1!1831 lt!51825) (bitStreamReadBitsIntoList!0 (_2!1824 lt!50851) (_2!1831 lt!51825) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!51824))) (_2!1831 lt!51825)))))

(assert (=> b!34859 (= lt!51825 (readBit!0 (_1!1825 lt!50863)))))

(assert (=> b!34859 (= lt!51824 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!10132 () Bool)

(assert (=> d!10132 e!23051))

(declare-fun c!2351 () Bool)

(assert (=> d!10132 (= c!2351 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10132 (= lt!51826 (_1!1830 e!23052))))

(declare-fun c!2352 () Bool)

(assert (=> d!10132 (= c!2352 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10132 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10132 (= (bitStreamReadBitsIntoList!0 (_2!1824 lt!50851) (_1!1825 lt!50863) #b0000000000000000000000000000000000000000000000000000000000000001) lt!51826)))

(assert (= (and d!10132 c!2352) b!34858))

(assert (= (and d!10132 (not c!2352)) b!34859))

(assert (= (and d!10132 c!2351) b!34860))

(assert (= (and d!10132 (not c!2351)) b!34861))

(declare-fun m!52247 () Bool)

(assert (=> b!34860 m!52247))

(declare-fun m!52249 () Bool)

(assert (=> b!34861 m!52249))

(declare-fun m!52251 () Bool)

(assert (=> b!34859 m!52251))

(declare-fun m!52253 () Bool)

(assert (=> b!34859 m!52253))

(assert (=> b!34480 d!10132))

(push 1)

(assert (not b!34612))

(assert (not b!34607))

(assert (not b!34861))

(assert (not b!34846))

(assert (not b!34648))

(assert (not d!9960))

(assert (not b!34617))

(assert (not d!9996))

(assert (not d!9980))

(assert (not d!9920))

(assert (not d!9986))

(assert (not b!34578))

(assert (not b!34650))

(assert (not d!9964))

(assert (not b!34646))

(assert (not d!9972))

(assert (not b!34848))

(assert (not b!34647))

(assert (not d!10118))

(assert (not bm!433))

(assert (not b!34611))

(assert (not b!34845))

(assert (not b!34860))

(assert (not b!34859))

(assert (not b!34580))

(assert (not b!34610))

(assert (not b!34595))

(assert (not b!34565))

(assert (not b!34837))

(assert (not b!34847))

(assert (not b!34593))

(assert (not d!9962))

(assert (not b!34596))

(assert (not d!9942))

(assert (not b!34651))

(assert (not b!34616))

(assert (not b!34855))

(assert (not b!34838))

(assert (not b!34831))

(assert (not b!34626))

(assert (not b!34609))

(assert (not b!34857))

(assert (not b!34652))

(assert (not b!34649))

(assert (not d!9994))

(assert (not b!34644))

(assert (not b!34832))

(assert (not b!34613))

(assert (not d!9990))

(assert (not d!9974))

(assert (not d!9968))

(assert (not d!9988))

(assert (not d!9984))

(assert (not b!34594))

(assert (not d!9956))

(assert (not d!9970))

(assert (not d!10122))

(assert (not d!9946))

(assert (not d!9976))

(assert (not b!34623))

(assert (not b!34621))

(assert (not b!34645))

(assert (not d!10114))

(assert (not d!9936))

(assert (not b!34654))

(assert (not b!34608))

(assert (not b!34833))

(assert (not b!34844))

(assert (not b!34618))

(assert (not b!34842))

(assert (not b!34836))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

