; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5836 () Bool)

(assert start!5836)

(declare-fun b!25545 () Bool)

(declare-fun res!22038 () Bool)

(declare-fun e!17419 () Bool)

(assert (=> b!25545 (=> (not res!22038) (not e!17419))))

(declare-datatypes ((array!1666 0))(
  ( (array!1667 (arr!1176 (Array (_ BitVec 32) (_ BitVec 8))) (size!717 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1266 0))(
  ( (BitStream!1267 (buf!1041 array!1666) (currentByte!2360 (_ BitVec 32)) (currentBit!2355 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1266)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!25545 (= res!22038 (validate_offset_bits!1 ((_ sign_extend 32) (size!717 (buf!1041 thiss!1379))) ((_ sign_extend 32) (currentByte!2360 thiss!1379)) ((_ sign_extend 32) (currentBit!2355 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!25546 () Bool)

(declare-fun e!17418 () Bool)

(declare-fun e!17416 () Bool)

(assert (=> b!25546 (= e!17418 e!17416)))

(declare-fun res!22046 () Bool)

(assert (=> b!25546 (=> res!22046 e!17416)))

(declare-fun lt!36620 () (_ BitVec 64))

(declare-fun lt!36624 () (_ BitVec 64))

(assert (=> b!25546 (= res!22046 (not (= lt!36624 (bvsub (bvadd lt!36620 to!314) i!635))))))

(declare-datatypes ((Unit!2107 0))(
  ( (Unit!2108) )
))
(declare-datatypes ((tuple2!2874 0))(
  ( (tuple2!2875 (_1!1524 Unit!2107) (_2!1524 BitStream!1266)) )
))
(declare-fun lt!36633 () tuple2!2874)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!25546 (= lt!36624 (bitIndex!0 (size!717 (buf!1041 (_2!1524 lt!36633))) (currentByte!2360 (_2!1524 lt!36633)) (currentBit!2355 (_2!1524 lt!36633))))))

(declare-fun b!25547 () Bool)

(declare-fun e!17414 () Bool)

(declare-fun array_inv!686 (array!1666) Bool)

(assert (=> b!25547 (= e!17414 (array_inv!686 (buf!1041 thiss!1379)))))

(declare-fun lt!36631 () tuple2!2874)

(declare-fun b!25548 () Bool)

(declare-fun e!17422 () Bool)

(declare-datatypes ((tuple2!2876 0))(
  ( (tuple2!2877 (_1!1525 BitStream!1266) (_2!1525 BitStream!1266)) )
))
(declare-fun lt!36629 () tuple2!2876)

(declare-fun srcBuffer!2 () array!1666)

(declare-datatypes ((List!334 0))(
  ( (Nil!331) (Cons!330 (h!449 Bool) (t!1084 List!334)) )
))
(declare-fun head!171 (List!334) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1266 array!1666 (_ BitVec 64) (_ BitVec 64)) List!334)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1266 BitStream!1266 (_ BitVec 64)) List!334)

(assert (=> b!25548 (= e!17422 (= (head!171 (byteArrayBitContentToList!0 (_2!1524 lt!36631) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!171 (bitStreamReadBitsIntoList!0 (_2!1524 lt!36631) (_1!1525 lt!36629) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!25549 () Bool)

(declare-fun e!17412 () Bool)

(assert (=> b!25549 (= e!17416 e!17412)))

(declare-fun res!22043 () Bool)

(assert (=> b!25549 (=> res!22043 e!17412)))

(assert (=> b!25549 (= res!22043 (not (= (size!717 (buf!1041 (_2!1524 lt!36631))) (size!717 (buf!1041 (_2!1524 lt!36633))))))))

(declare-fun e!17421 () Bool)

(assert (=> b!25549 e!17421))

(declare-fun res!22050 () Bool)

(assert (=> b!25549 (=> (not res!22050) (not e!17421))))

(assert (=> b!25549 (= res!22050 (= (size!717 (buf!1041 (_2!1524 lt!36633))) (size!717 (buf!1041 thiss!1379))))))

(declare-fun b!25550 () Bool)

(declare-fun e!17413 () Bool)

(assert (=> b!25550 (= e!17419 (not e!17413))))

(declare-fun res!22045 () Bool)

(assert (=> b!25550 (=> res!22045 e!17413)))

(assert (=> b!25550 (= res!22045 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1266 BitStream!1266) Bool)

(assert (=> b!25550 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!36621 () Unit!2107)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1266) Unit!2107)

(assert (=> b!25550 (= lt!36621 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!25550 (= lt!36620 (bitIndex!0 (size!717 (buf!1041 thiss!1379)) (currentByte!2360 thiss!1379) (currentBit!2355 thiss!1379)))))

(declare-fun b!25551 () Bool)

(declare-fun e!17420 () Bool)

(assert (=> b!25551 (= e!17420 e!17418)))

(declare-fun res!22042 () Bool)

(assert (=> b!25551 (=> res!22042 e!17418)))

(assert (=> b!25551 (= res!22042 (not (isPrefixOf!0 (_2!1524 lt!36631) (_2!1524 lt!36633))))))

(assert (=> b!25551 (isPrefixOf!0 thiss!1379 (_2!1524 lt!36633))))

(declare-fun lt!36626 () Unit!2107)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1266 BitStream!1266 BitStream!1266) Unit!2107)

(assert (=> b!25551 (= lt!36626 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1524 lt!36631) (_2!1524 lt!36633)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1266 array!1666 (_ BitVec 64) (_ BitVec 64)) tuple2!2874)

(assert (=> b!25551 (= lt!36633 (appendBitsMSBFirstLoop!0 (_2!1524 lt!36631) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!25551 e!17422))

(declare-fun res!22041 () Bool)

(assert (=> b!25551 (=> (not res!22041) (not e!17422))))

(assert (=> b!25551 (= res!22041 (validate_offset_bits!1 ((_ sign_extend 32) (size!717 (buf!1041 (_2!1524 lt!36631)))) ((_ sign_extend 32) (currentByte!2360 thiss!1379)) ((_ sign_extend 32) (currentBit!2355 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!36622 () Unit!2107)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1266 array!1666 (_ BitVec 64)) Unit!2107)

(assert (=> b!25551 (= lt!36622 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1041 (_2!1524 lt!36631)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1266 BitStream!1266) tuple2!2876)

(assert (=> b!25551 (= lt!36629 (reader!0 thiss!1379 (_2!1524 lt!36631)))))

(declare-fun b!25552 () Bool)

(assert (=> b!25552 (= e!17421 (= lt!36624 (bvsub (bvsub (bvadd (bitIndex!0 (size!717 (buf!1041 (_2!1524 lt!36631))) (currentByte!2360 (_2!1524 lt!36631)) (currentBit!2355 (_2!1524 lt!36631))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun res!22048 () Bool)

(assert (=> start!5836 (=> (not res!22048) (not e!17419))))

(assert (=> start!5836 (= res!22048 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!717 srcBuffer!2))))))))

(assert (=> start!5836 e!17419))

(assert (=> start!5836 true))

(assert (=> start!5836 (array_inv!686 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1266) Bool)

(assert (=> start!5836 (and (inv!12 thiss!1379) e!17414)))

(declare-fun b!25553 () Bool)

(declare-fun res!22040 () Bool)

(assert (=> b!25553 (=> res!22040 e!17416)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!25553 (= res!22040 (not (invariant!0 (currentBit!2355 (_2!1524 lt!36633)) (currentByte!2360 (_2!1524 lt!36633)) (size!717 (buf!1041 (_2!1524 lt!36633))))))))

(declare-fun b!25554 () Bool)

(assert (=> b!25554 (= e!17413 e!17420)))

(declare-fun res!22039 () Bool)

(assert (=> b!25554 (=> res!22039 e!17420)))

(assert (=> b!25554 (= res!22039 (not (isPrefixOf!0 thiss!1379 (_2!1524 lt!36631))))))

(declare-fun lt!36623 () (_ BitVec 64))

(assert (=> b!25554 (validate_offset_bits!1 ((_ sign_extend 32) (size!717 (buf!1041 (_2!1524 lt!36631)))) ((_ sign_extend 32) (currentByte!2360 (_2!1524 lt!36631))) ((_ sign_extend 32) (currentBit!2355 (_2!1524 lt!36631))) lt!36623)))

(assert (=> b!25554 (= lt!36623 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!36632 () Unit!2107)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1266 BitStream!1266 (_ BitVec 64) (_ BitVec 64)) Unit!2107)

(assert (=> b!25554 (= lt!36632 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1524 lt!36631) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1266 (_ BitVec 8) (_ BitVec 32)) tuple2!2874)

(assert (=> b!25554 (= lt!36631 (appendBitFromByte!0 thiss!1379 (select (arr!1176 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!25555 () Bool)

(assert (=> b!25555 (= e!17412 true)))

(declare-fun lt!36625 () tuple2!2876)

(declare-fun lt!36627 () List!334)

(assert (=> b!25555 (= lt!36627 (bitStreamReadBitsIntoList!0 (_2!1524 lt!36633) (_1!1525 lt!36625) (bvsub to!314 i!635)))))

(assert (=> b!25555 (validate_offset_bits!1 ((_ sign_extend 32) (size!717 (buf!1041 (_2!1524 lt!36633)))) ((_ sign_extend 32) (currentByte!2360 (_2!1524 lt!36631))) ((_ sign_extend 32) (currentBit!2355 (_2!1524 lt!36631))) lt!36623)))

(declare-fun lt!36634 () Unit!2107)

(assert (=> b!25555 (= lt!36634 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1524 lt!36631) (buf!1041 (_2!1524 lt!36633)) lt!36623))))

(declare-fun lt!36630 () tuple2!2876)

(assert (=> b!25555 (= lt!36630 (reader!0 (_2!1524 lt!36631) (_2!1524 lt!36633)))))

(assert (=> b!25555 (validate_offset_bits!1 ((_ sign_extend 32) (size!717 (buf!1041 (_2!1524 lt!36633)))) ((_ sign_extend 32) (currentByte!2360 thiss!1379)) ((_ sign_extend 32) (currentBit!2355 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!36628 () Unit!2107)

(assert (=> b!25555 (= lt!36628 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1041 (_2!1524 lt!36633)) (bvsub to!314 i!635)))))

(assert (=> b!25555 (= lt!36625 (reader!0 thiss!1379 (_2!1524 lt!36633)))))

(declare-fun b!25556 () Bool)

(declare-fun res!22047 () Bool)

(assert (=> b!25556 (=> res!22047 e!17412)))

(assert (=> b!25556 (= res!22047 (not (invariant!0 (currentBit!2355 (_2!1524 lt!36631)) (currentByte!2360 (_2!1524 lt!36631)) (size!717 (buf!1041 (_2!1524 lt!36631))))))))

(declare-fun b!25557 () Bool)

(declare-fun res!22044 () Bool)

(assert (=> b!25557 (=> res!22044 e!17412)))

(assert (=> b!25557 (= res!22044 (not (invariant!0 (currentBit!2355 (_2!1524 lt!36631)) (currentByte!2360 (_2!1524 lt!36631)) (size!717 (buf!1041 (_2!1524 lt!36633))))))))

(declare-fun b!25558 () Bool)

(declare-fun res!22049 () Bool)

(assert (=> b!25558 (=> res!22049 e!17416)))

(assert (=> b!25558 (= res!22049 (not (= (size!717 (buf!1041 thiss!1379)) (size!717 (buf!1041 (_2!1524 lt!36633))))))))

(assert (= (and start!5836 res!22048) b!25545))

(assert (= (and b!25545 res!22038) b!25550))

(assert (= (and b!25550 (not res!22045)) b!25554))

(assert (= (and b!25554 (not res!22039)) b!25551))

(assert (= (and b!25551 res!22041) b!25548))

(assert (= (and b!25551 (not res!22042)) b!25546))

(assert (= (and b!25546 (not res!22046)) b!25553))

(assert (= (and b!25553 (not res!22040)) b!25558))

(assert (= (and b!25558 (not res!22049)) b!25549))

(assert (= (and b!25549 res!22050) b!25552))

(assert (= (and b!25549 (not res!22043)) b!25556))

(assert (= (and b!25556 (not res!22047)) b!25557))

(assert (= (and b!25557 (not res!22044)) b!25555))

(assert (= start!5836 b!25547))

(declare-fun m!36421 () Bool)

(assert (=> b!25547 m!36421))

(declare-fun m!36423 () Bool)

(assert (=> b!25556 m!36423))

(declare-fun m!36425 () Bool)

(assert (=> b!25553 m!36425))

(declare-fun m!36427 () Bool)

(assert (=> b!25552 m!36427))

(declare-fun m!36429 () Bool)

(assert (=> b!25551 m!36429))

(declare-fun m!36431 () Bool)

(assert (=> b!25551 m!36431))

(declare-fun m!36433 () Bool)

(assert (=> b!25551 m!36433))

(declare-fun m!36435 () Bool)

(assert (=> b!25551 m!36435))

(declare-fun m!36437 () Bool)

(assert (=> b!25551 m!36437))

(declare-fun m!36439 () Bool)

(assert (=> b!25551 m!36439))

(declare-fun m!36441 () Bool)

(assert (=> b!25551 m!36441))

(declare-fun m!36443 () Bool)

(assert (=> b!25557 m!36443))

(declare-fun m!36445 () Bool)

(assert (=> b!25550 m!36445))

(declare-fun m!36447 () Bool)

(assert (=> b!25550 m!36447))

(declare-fun m!36449 () Bool)

(assert (=> b!25550 m!36449))

(declare-fun m!36451 () Bool)

(assert (=> b!25546 m!36451))

(declare-fun m!36453 () Bool)

(assert (=> b!25555 m!36453))

(declare-fun m!36455 () Bool)

(assert (=> b!25555 m!36455))

(declare-fun m!36457 () Bool)

(assert (=> b!25555 m!36457))

(declare-fun m!36459 () Bool)

(assert (=> b!25555 m!36459))

(declare-fun m!36461 () Bool)

(assert (=> b!25555 m!36461))

(declare-fun m!36463 () Bool)

(assert (=> b!25555 m!36463))

(declare-fun m!36465 () Bool)

(assert (=> b!25555 m!36465))

(declare-fun m!36467 () Bool)

(assert (=> b!25545 m!36467))

(declare-fun m!36469 () Bool)

(assert (=> start!5836 m!36469))

(declare-fun m!36471 () Bool)

(assert (=> start!5836 m!36471))

(declare-fun m!36473 () Bool)

(assert (=> b!25548 m!36473))

(assert (=> b!25548 m!36473))

(declare-fun m!36475 () Bool)

(assert (=> b!25548 m!36475))

(declare-fun m!36477 () Bool)

(assert (=> b!25548 m!36477))

(assert (=> b!25548 m!36477))

(declare-fun m!36479 () Bool)

(assert (=> b!25548 m!36479))

(declare-fun m!36481 () Bool)

(assert (=> b!25554 m!36481))

(declare-fun m!36483 () Bool)

(assert (=> b!25554 m!36483))

(assert (=> b!25554 m!36481))

(declare-fun m!36485 () Bool)

(assert (=> b!25554 m!36485))

(declare-fun m!36487 () Bool)

(assert (=> b!25554 m!36487))

(declare-fun m!36489 () Bool)

(assert (=> b!25554 m!36489))

(check-sat (not b!25545) (not b!25548) (not b!25547) (not b!25553) (not b!25555) (not b!25557) (not start!5836) (not b!25550) (not b!25554) (not b!25546) (not b!25556) (not b!25552) (not b!25551))
