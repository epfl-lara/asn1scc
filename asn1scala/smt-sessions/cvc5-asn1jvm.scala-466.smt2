; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13386 () Bool)

(assert start!13386)

(declare-fun b!68488 () Bool)

(declare-fun res!56607 () Bool)

(declare-fun e!44766 () Bool)

(assert (=> b!68488 (=> res!56607 e!44766)))

(declare-datatypes ((array!2884 0))(
  ( (array!2885 (arr!1913 (Array (_ BitVec 32) (_ BitVec 8))) (size!1337 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2284 0))(
  ( (BitStream!2285 (buf!1718 array!2884) (currentByte!3414 (_ BitVec 32)) (currentBit!3409 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4607 0))(
  ( (Unit!4608) )
))
(declare-datatypes ((tuple2!6000 0))(
  ( (tuple2!6001 (_1!3111 Unit!4607) (_2!3111 BitStream!2284)) )
))
(declare-fun lt!109722 () tuple2!6000)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!68488 (= res!56607 (not (invariant!0 (currentBit!3409 (_2!3111 lt!109722)) (currentByte!3414 (_2!3111 lt!109722)) (size!1337 (buf!1718 (_2!3111 lt!109722))))))))

(declare-fun b!68489 () Bool)

(declare-fun e!44774 () Bool)

(assert (=> b!68489 (= e!44774 e!44766)))

(declare-fun res!56619 () Bool)

(assert (=> b!68489 (=> res!56619 e!44766)))

(declare-fun lt!109729 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!109717 () (_ BitVec 64))

(assert (=> b!68489 (= res!56619 (not (= lt!109729 (bvsub (bvadd lt!109717 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!68489 (= lt!109729 (bitIndex!0 (size!1337 (buf!1718 (_2!3111 lt!109722))) (currentByte!3414 (_2!3111 lt!109722)) (currentBit!3409 (_2!3111 lt!109722))))))

(declare-fun b!68490 () Bool)

(declare-fun res!56610 () Bool)

(assert (=> b!68490 (=> res!56610 e!44766)))

(declare-fun thiss!1379 () BitStream!2284)

(assert (=> b!68490 (= res!56610 (not (= (size!1337 (buf!1718 thiss!1379)) (size!1337 (buf!1718 (_2!3111 lt!109722))))))))

(declare-fun b!68491 () Bool)

(declare-fun e!44777 () Bool)

(declare-fun e!44769 () Bool)

(assert (=> b!68491 (= e!44777 e!44769)))

(declare-fun res!56615 () Bool)

(assert (=> b!68491 (=> res!56615 e!44769)))

(declare-fun lt!109730 () tuple2!6000)

(declare-fun isPrefixOf!0 (BitStream!2284 BitStream!2284) Bool)

(assert (=> b!68491 (= res!56615 (not (isPrefixOf!0 thiss!1379 (_2!3111 lt!109730))))))

(declare-fun lt!109731 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!68491 (validate_offset_bits!1 ((_ sign_extend 32) (size!1337 (buf!1718 (_2!3111 lt!109730)))) ((_ sign_extend 32) (currentByte!3414 (_2!3111 lt!109730))) ((_ sign_extend 32) (currentBit!3409 (_2!3111 lt!109730))) lt!109731)))

(assert (=> b!68491 (= lt!109731 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!109724 () Unit!4607)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2284 BitStream!2284 (_ BitVec 64) (_ BitVec 64)) Unit!4607)

(assert (=> b!68491 (= lt!109724 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3111 lt!109730) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2884)

(declare-fun appendBitFromByte!0 (BitStream!2284 (_ BitVec 8) (_ BitVec 32)) tuple2!6000)

(assert (=> b!68491 (= lt!109730 (appendBitFromByte!0 thiss!1379 (select (arr!1913 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!68492 () Bool)

(declare-fun res!56608 () Bool)

(declare-fun e!44772 () Bool)

(assert (=> b!68492 (=> res!56608 e!44772)))

(declare-datatypes ((List!717 0))(
  ( (Nil!714) (Cons!713 (h!832 Bool) (t!1467 List!717)) )
))
(declare-fun lt!109718 () List!717)

(declare-fun length!345 (List!717) Int)

(assert (=> b!68492 (= res!56608 (<= (length!345 lt!109718) 0))))

(declare-fun res!56613 () Bool)

(declare-fun e!44771 () Bool)

(assert (=> start!13386 (=> (not res!56613) (not e!44771))))

(assert (=> start!13386 (= res!56613 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1337 srcBuffer!2))))))))

(assert (=> start!13386 e!44771))

(assert (=> start!13386 true))

(declare-fun array_inv!1201 (array!2884) Bool)

(assert (=> start!13386 (array_inv!1201 srcBuffer!2)))

(declare-fun e!44768 () Bool)

(declare-fun inv!12 (BitStream!2284) Bool)

(assert (=> start!13386 (and (inv!12 thiss!1379) e!44768)))

(declare-fun b!68493 () Bool)

(assert (=> b!68493 (= e!44772 true)))

(declare-fun lt!109732 () List!717)

(declare-fun tail!321 (List!717) List!717)

(assert (=> b!68493 (= lt!109732 (tail!321 lt!109718))))

(declare-fun lt!109719 () Unit!4607)

(declare-datatypes ((tuple2!6002 0))(
  ( (tuple2!6003 (_1!3112 BitStream!2284) (_2!3112 BitStream!2284)) )
))
(declare-fun lt!109716 () tuple2!6002)

(declare-fun lt!109726 () tuple2!6002)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2284 BitStream!2284 BitStream!2284 BitStream!2284 (_ BitVec 64) List!717) Unit!4607)

(assert (=> b!68493 (= lt!109719 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3111 lt!109722) (_2!3111 lt!109722) (_1!3112 lt!109716) (_1!3112 lt!109726) (bvsub to!314 i!635) lt!109718))))

(declare-fun b!68494 () Bool)

(assert (=> b!68494 (= e!44769 e!44774)))

(declare-fun res!56612 () Bool)

(assert (=> b!68494 (=> res!56612 e!44774)))

(assert (=> b!68494 (= res!56612 (not (isPrefixOf!0 (_2!3111 lt!109730) (_2!3111 lt!109722))))))

(assert (=> b!68494 (isPrefixOf!0 thiss!1379 (_2!3111 lt!109722))))

(declare-fun lt!109728 () Unit!4607)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2284 BitStream!2284 BitStream!2284) Unit!4607)

(assert (=> b!68494 (= lt!109728 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3111 lt!109730) (_2!3111 lt!109722)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2284 array!2884 (_ BitVec 64) (_ BitVec 64)) tuple2!6000)

(assert (=> b!68494 (= lt!109722 (appendBitsMSBFirstLoop!0 (_2!3111 lt!109730) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!44770 () Bool)

(assert (=> b!68494 e!44770))

(declare-fun res!56618 () Bool)

(assert (=> b!68494 (=> (not res!56618) (not e!44770))))

(assert (=> b!68494 (= res!56618 (validate_offset_bits!1 ((_ sign_extend 32) (size!1337 (buf!1718 (_2!3111 lt!109730)))) ((_ sign_extend 32) (currentByte!3414 thiss!1379)) ((_ sign_extend 32) (currentBit!3409 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!109720 () Unit!4607)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2284 array!2884 (_ BitVec 64)) Unit!4607)

(assert (=> b!68494 (= lt!109720 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1718 (_2!3111 lt!109730)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!109723 () tuple2!6002)

(declare-fun reader!0 (BitStream!2284 BitStream!2284) tuple2!6002)

(assert (=> b!68494 (= lt!109723 (reader!0 thiss!1379 (_2!3111 lt!109730)))))

(declare-fun b!68495 () Bool)

(declare-fun head!536 (List!717) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2284 array!2884 (_ BitVec 64) (_ BitVec 64)) List!717)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2284 BitStream!2284 (_ BitVec 64)) List!717)

(assert (=> b!68495 (= e!44770 (= (head!536 (byteArrayBitContentToList!0 (_2!3111 lt!109730) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!536 (bitStreamReadBitsIntoList!0 (_2!3111 lt!109730) (_1!3112 lt!109723) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!68496 () Bool)

(declare-fun e!44773 () Bool)

(assert (=> b!68496 (= e!44773 e!44772)))

(declare-fun res!56609 () Bool)

(assert (=> b!68496 (=> res!56609 e!44772)))

(assert (=> b!68496 (= res!56609 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!68496 (= lt!109732 (bitStreamReadBitsIntoList!0 (_2!3111 lt!109722) (_1!3112 lt!109726) lt!109731))))

(assert (=> b!68496 (= lt!109718 (bitStreamReadBitsIntoList!0 (_2!3111 lt!109722) (_1!3112 lt!109716) (bvsub to!314 i!635)))))

(assert (=> b!68496 (validate_offset_bits!1 ((_ sign_extend 32) (size!1337 (buf!1718 (_2!3111 lt!109722)))) ((_ sign_extend 32) (currentByte!3414 (_2!3111 lt!109730))) ((_ sign_extend 32) (currentBit!3409 (_2!3111 lt!109730))) lt!109731)))

(declare-fun lt!109725 () Unit!4607)

(assert (=> b!68496 (= lt!109725 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3111 lt!109730) (buf!1718 (_2!3111 lt!109722)) lt!109731))))

(assert (=> b!68496 (= lt!109726 (reader!0 (_2!3111 lt!109730) (_2!3111 lt!109722)))))

(assert (=> b!68496 (validate_offset_bits!1 ((_ sign_extend 32) (size!1337 (buf!1718 (_2!3111 lt!109722)))) ((_ sign_extend 32) (currentByte!3414 thiss!1379)) ((_ sign_extend 32) (currentBit!3409 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!109721 () Unit!4607)

(assert (=> b!68496 (= lt!109721 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1718 (_2!3111 lt!109722)) (bvsub to!314 i!635)))))

(assert (=> b!68496 (= lt!109716 (reader!0 thiss!1379 (_2!3111 lt!109722)))))

(declare-fun b!68497 () Bool)

(assert (=> b!68497 (= e!44771 (not e!44777))))

(declare-fun res!56605 () Bool)

(assert (=> b!68497 (=> res!56605 e!44777)))

(assert (=> b!68497 (= res!56605 (bvsge i!635 to!314))))

(assert (=> b!68497 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!109727 () Unit!4607)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2284) Unit!4607)

(assert (=> b!68497 (= lt!109727 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!68497 (= lt!109717 (bitIndex!0 (size!1337 (buf!1718 thiss!1379)) (currentByte!3414 thiss!1379) (currentBit!3409 thiss!1379)))))

(declare-fun b!68498 () Bool)

(declare-fun res!56606 () Bool)

(assert (=> b!68498 (=> res!56606 e!44773)))

(assert (=> b!68498 (= res!56606 (not (invariant!0 (currentBit!3409 (_2!3111 lt!109730)) (currentByte!3414 (_2!3111 lt!109730)) (size!1337 (buf!1718 (_2!3111 lt!109730))))))))

(declare-fun e!44767 () Bool)

(declare-fun b!68499 () Bool)

(assert (=> b!68499 (= e!44767 (= lt!109729 (bvsub (bvsub (bvadd (bitIndex!0 (size!1337 (buf!1718 (_2!3111 lt!109730))) (currentByte!3414 (_2!3111 lt!109730)) (currentBit!3409 (_2!3111 lt!109730))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!68500 () Bool)

(declare-fun res!56614 () Bool)

(assert (=> b!68500 (=> (not res!56614) (not e!44771))))

(assert (=> b!68500 (= res!56614 (validate_offset_bits!1 ((_ sign_extend 32) (size!1337 (buf!1718 thiss!1379))) ((_ sign_extend 32) (currentByte!3414 thiss!1379)) ((_ sign_extend 32) (currentBit!3409 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!68501 () Bool)

(declare-fun res!56617 () Bool)

(assert (=> b!68501 (=> res!56617 e!44773)))

(assert (=> b!68501 (= res!56617 (not (invariant!0 (currentBit!3409 (_2!3111 lt!109730)) (currentByte!3414 (_2!3111 lt!109730)) (size!1337 (buf!1718 (_2!3111 lt!109722))))))))

(declare-fun b!68502 () Bool)

(assert (=> b!68502 (= e!44766 e!44773)))

(declare-fun res!56611 () Bool)

(assert (=> b!68502 (=> res!56611 e!44773)))

(assert (=> b!68502 (= res!56611 (not (= (size!1337 (buf!1718 (_2!3111 lt!109730))) (size!1337 (buf!1718 (_2!3111 lt!109722))))))))

(assert (=> b!68502 e!44767))

(declare-fun res!56616 () Bool)

(assert (=> b!68502 (=> (not res!56616) (not e!44767))))

(assert (=> b!68502 (= res!56616 (= (size!1337 (buf!1718 (_2!3111 lt!109722))) (size!1337 (buf!1718 thiss!1379))))))

(declare-fun b!68503 () Bool)

(assert (=> b!68503 (= e!44768 (array_inv!1201 (buf!1718 thiss!1379)))))

(assert (= (and start!13386 res!56613) b!68500))

(assert (= (and b!68500 res!56614) b!68497))

(assert (= (and b!68497 (not res!56605)) b!68491))

(assert (= (and b!68491 (not res!56615)) b!68494))

(assert (= (and b!68494 res!56618) b!68495))

(assert (= (and b!68494 (not res!56612)) b!68489))

(assert (= (and b!68489 (not res!56619)) b!68488))

(assert (= (and b!68488 (not res!56607)) b!68490))

(assert (= (and b!68490 (not res!56610)) b!68502))

(assert (= (and b!68502 res!56616) b!68499))

(assert (= (and b!68502 (not res!56611)) b!68498))

(assert (= (and b!68498 (not res!56606)) b!68501))

(assert (= (and b!68501 (not res!56617)) b!68496))

(assert (= (and b!68496 (not res!56609)) b!68492))

(assert (= (and b!68492 (not res!56608)) b!68493))

(assert (= start!13386 b!68503))

(declare-fun m!109369 () Bool)

(assert (=> b!68491 m!109369))

(declare-fun m!109371 () Bool)

(assert (=> b!68491 m!109371))

(declare-fun m!109373 () Bool)

(assert (=> b!68491 m!109373))

(assert (=> b!68491 m!109369))

(declare-fun m!109375 () Bool)

(assert (=> b!68491 m!109375))

(declare-fun m!109377 () Bool)

(assert (=> b!68491 m!109377))

(declare-fun m!109379 () Bool)

(assert (=> b!68489 m!109379))

(declare-fun m!109381 () Bool)

(assert (=> b!68501 m!109381))

(declare-fun m!109383 () Bool)

(assert (=> b!68493 m!109383))

(declare-fun m!109385 () Bool)

(assert (=> b!68493 m!109385))

(declare-fun m!109387 () Bool)

(assert (=> b!68499 m!109387))

(declare-fun m!109389 () Bool)

(assert (=> b!68503 m!109389))

(declare-fun m!109391 () Bool)

(assert (=> b!68488 m!109391))

(declare-fun m!109393 () Bool)

(assert (=> b!68494 m!109393))

(declare-fun m!109395 () Bool)

(assert (=> b!68494 m!109395))

(declare-fun m!109397 () Bool)

(assert (=> b!68494 m!109397))

(declare-fun m!109399 () Bool)

(assert (=> b!68494 m!109399))

(declare-fun m!109401 () Bool)

(assert (=> b!68494 m!109401))

(declare-fun m!109403 () Bool)

(assert (=> b!68494 m!109403))

(declare-fun m!109405 () Bool)

(assert (=> b!68494 m!109405))

(declare-fun m!109407 () Bool)

(assert (=> b!68496 m!109407))

(declare-fun m!109409 () Bool)

(assert (=> b!68496 m!109409))

(declare-fun m!109411 () Bool)

(assert (=> b!68496 m!109411))

(declare-fun m!109413 () Bool)

(assert (=> b!68496 m!109413))

(declare-fun m!109415 () Bool)

(assert (=> b!68496 m!109415))

(declare-fun m!109417 () Bool)

(assert (=> b!68496 m!109417))

(declare-fun m!109419 () Bool)

(assert (=> b!68496 m!109419))

(declare-fun m!109421 () Bool)

(assert (=> b!68496 m!109421))

(declare-fun m!109423 () Bool)

(assert (=> b!68495 m!109423))

(assert (=> b!68495 m!109423))

(declare-fun m!109425 () Bool)

(assert (=> b!68495 m!109425))

(declare-fun m!109427 () Bool)

(assert (=> b!68495 m!109427))

(assert (=> b!68495 m!109427))

(declare-fun m!109429 () Bool)

(assert (=> b!68495 m!109429))

(declare-fun m!109431 () Bool)

(assert (=> b!68492 m!109431))

(declare-fun m!109433 () Bool)

(assert (=> start!13386 m!109433))

(declare-fun m!109435 () Bool)

(assert (=> start!13386 m!109435))

(declare-fun m!109437 () Bool)

(assert (=> b!68497 m!109437))

(declare-fun m!109439 () Bool)

(assert (=> b!68497 m!109439))

(declare-fun m!109441 () Bool)

(assert (=> b!68497 m!109441))

(declare-fun m!109443 () Bool)

(assert (=> b!68498 m!109443))

(declare-fun m!109445 () Bool)

(assert (=> b!68500 m!109445))

(push 1)

