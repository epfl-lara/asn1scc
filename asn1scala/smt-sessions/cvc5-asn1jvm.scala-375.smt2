; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8942 () Bool)

(assert start!8942)

(declare-fun b!44287 () Bool)

(declare-fun res!37504 () Bool)

(declare-fun e!29494 () Bool)

(assert (=> b!44287 (=> (not res!37504) (not e!29494))))

(declare-datatypes ((array!2233 0))(
  ( (array!2234 (arr!1517 (Array (_ BitVec 32) (_ BitVec 8))) (size!1006 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1756 0))(
  ( (BitStream!1757 (buf!1349 array!2233) (currentByte!2830 (_ BitVec 32)) (currentBit!2825 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1756)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!44287 (= res!37504 (validate_offset_bits!1 ((_ sign_extend 32) (size!1006 (buf!1349 thiss!1379))) ((_ sign_extend 32) (currentByte!2830 thiss!1379)) ((_ sign_extend 32) (currentBit!2825 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun srcBuffer!2 () array!2233)

(declare-fun b!44288 () Bool)

(declare-datatypes ((tuple2!4334 0))(
  ( (tuple2!4335 (_1!2260 BitStream!1756) (_2!2260 BitStream!1756)) )
))
(declare-fun lt!67658 () tuple2!4334)

(declare-datatypes ((Unit!3154 0))(
  ( (Unit!3155) )
))
(declare-datatypes ((tuple2!4336 0))(
  ( (tuple2!4337 (_1!2261 Unit!3154) (_2!2261 BitStream!1756)) )
))
(declare-fun lt!67663 () tuple2!4336)

(declare-fun e!29488 () Bool)

(declare-datatypes ((List!519 0))(
  ( (Nil!516) (Cons!515 (h!634 Bool) (t!1269 List!519)) )
))
(declare-fun head!338 (List!519) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1756 array!2233 (_ BitVec 64) (_ BitVec 64)) List!519)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1756 BitStream!1756 (_ BitVec 64)) List!519)

(assert (=> b!44288 (= e!29488 (= (head!338 (byteArrayBitContentToList!0 (_2!2261 lt!67663) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!338 (bitStreamReadBitsIntoList!0 (_2!2261 lt!67663) (_1!2260 lt!67658) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!44289 () Bool)

(declare-fun e!29492 () Bool)

(declare-fun e!29493 () Bool)

(assert (=> b!44289 (= e!29492 e!29493)))

(declare-fun res!37507 () Bool)

(assert (=> b!44289 (=> res!37507 e!29493)))

(declare-fun isPrefixOf!0 (BitStream!1756 BitStream!1756) Bool)

(assert (=> b!44289 (= res!37507 (not (isPrefixOf!0 thiss!1379 (_2!2261 lt!67663))))))

(assert (=> b!44289 (validate_offset_bits!1 ((_ sign_extend 32) (size!1006 (buf!1349 (_2!2261 lt!67663)))) ((_ sign_extend 32) (currentByte!2830 (_2!2261 lt!67663))) ((_ sign_extend 32) (currentBit!2825 (_2!2261 lt!67663))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!67660 () Unit!3154)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1756 BitStream!1756 (_ BitVec 64) (_ BitVec 64)) Unit!3154)

(assert (=> b!44289 (= lt!67660 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2261 lt!67663) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1756 (_ BitVec 8) (_ BitVec 32)) tuple2!4336)

(assert (=> b!44289 (= lt!67663 (appendBitFromByte!0 thiss!1379 (select (arr!1517 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!44290 () Bool)

(assert (=> b!44290 (= e!29494 (not e!29492))))

(declare-fun res!37508 () Bool)

(assert (=> b!44290 (=> res!37508 e!29492)))

(assert (=> b!44290 (= res!37508 (bvsge i!635 to!314))))

(assert (=> b!44290 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!67655 () Unit!3154)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1756) Unit!3154)

(assert (=> b!44290 (= lt!67655 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!67661 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!44290 (= lt!67661 (bitIndex!0 (size!1006 (buf!1349 thiss!1379)) (currentByte!2830 thiss!1379) (currentBit!2825 thiss!1379)))))

(declare-fun b!44291 () Bool)

(declare-fun e!29491 () Bool)

(assert (=> b!44291 (= e!29491 true)))

(declare-fun lt!67656 () (_ BitVec 64))

(declare-fun lt!67659 () tuple2!4336)

(assert (=> b!44291 (= lt!67656 (bitIndex!0 (size!1006 (buf!1349 (_2!2261 lt!67659))) (currentByte!2830 (_2!2261 lt!67659)) (currentBit!2825 (_2!2261 lt!67659))))))

(declare-fun b!44292 () Bool)

(assert (=> b!44292 (= e!29493 e!29491)))

(declare-fun res!37509 () Bool)

(assert (=> b!44292 (=> res!37509 e!29491)))

(assert (=> b!44292 (= res!37509 (not (isPrefixOf!0 (_2!2261 lt!67663) (_2!2261 lt!67659))))))

(assert (=> b!44292 (isPrefixOf!0 thiss!1379 (_2!2261 lt!67659))))

(declare-fun lt!67662 () Unit!3154)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1756 BitStream!1756 BitStream!1756) Unit!3154)

(assert (=> b!44292 (= lt!67662 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2261 lt!67663) (_2!2261 lt!67659)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1756 array!2233 (_ BitVec 64) (_ BitVec 64)) tuple2!4336)

(assert (=> b!44292 (= lt!67659 (appendBitsMSBFirstLoop!0 (_2!2261 lt!67663) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!44292 e!29488))

(declare-fun res!37506 () Bool)

(assert (=> b!44292 (=> (not res!37506) (not e!29488))))

(assert (=> b!44292 (= res!37506 (validate_offset_bits!1 ((_ sign_extend 32) (size!1006 (buf!1349 (_2!2261 lt!67663)))) ((_ sign_extend 32) (currentByte!2830 thiss!1379)) ((_ sign_extend 32) (currentBit!2825 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!67657 () Unit!3154)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1756 array!2233 (_ BitVec 64)) Unit!3154)

(assert (=> b!44292 (= lt!67657 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1349 (_2!2261 lt!67663)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1756 BitStream!1756) tuple2!4334)

(assert (=> b!44292 (= lt!67658 (reader!0 thiss!1379 (_2!2261 lt!67663)))))

(declare-fun res!37505 () Bool)

(assert (=> start!8942 (=> (not res!37505) (not e!29494))))

(assert (=> start!8942 (= res!37505 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1006 srcBuffer!2))))))))

(assert (=> start!8942 e!29494))

(assert (=> start!8942 true))

(declare-fun array_inv!931 (array!2233) Bool)

(assert (=> start!8942 (array_inv!931 srcBuffer!2)))

(declare-fun e!29495 () Bool)

(declare-fun inv!12 (BitStream!1756) Bool)

(assert (=> start!8942 (and (inv!12 thiss!1379) e!29495)))

(declare-fun b!44293 () Bool)

(assert (=> b!44293 (= e!29495 (array_inv!931 (buf!1349 thiss!1379)))))

(assert (= (and start!8942 res!37505) b!44287))

(assert (= (and b!44287 res!37504) b!44290))

(assert (= (and b!44290 (not res!37508)) b!44289))

(assert (= (and b!44289 (not res!37507)) b!44292))

(assert (= (and b!44292 res!37506) b!44288))

(assert (= (and b!44292 (not res!37509)) b!44291))

(assert (= start!8942 b!44293))

(declare-fun m!67507 () Bool)

(assert (=> b!44292 m!67507))

(declare-fun m!67509 () Bool)

(assert (=> b!44292 m!67509))

(declare-fun m!67511 () Bool)

(assert (=> b!44292 m!67511))

(declare-fun m!67513 () Bool)

(assert (=> b!44292 m!67513))

(declare-fun m!67515 () Bool)

(assert (=> b!44292 m!67515))

(declare-fun m!67517 () Bool)

(assert (=> b!44292 m!67517))

(declare-fun m!67519 () Bool)

(assert (=> b!44292 m!67519))

(declare-fun m!67521 () Bool)

(assert (=> start!8942 m!67521))

(declare-fun m!67523 () Bool)

(assert (=> start!8942 m!67523))

(declare-fun m!67525 () Bool)

(assert (=> b!44290 m!67525))

(declare-fun m!67527 () Bool)

(assert (=> b!44290 m!67527))

(declare-fun m!67529 () Bool)

(assert (=> b!44290 m!67529))

(declare-fun m!67531 () Bool)

(assert (=> b!44291 m!67531))

(declare-fun m!67533 () Bool)

(assert (=> b!44293 m!67533))

(declare-fun m!67535 () Bool)

(assert (=> b!44287 m!67535))

(declare-fun m!67537 () Bool)

(assert (=> b!44289 m!67537))

(declare-fun m!67539 () Bool)

(assert (=> b!44289 m!67539))

(declare-fun m!67541 () Bool)

(assert (=> b!44289 m!67541))

(declare-fun m!67543 () Bool)

(assert (=> b!44289 m!67543))

(assert (=> b!44289 m!67539))

(declare-fun m!67545 () Bool)

(assert (=> b!44289 m!67545))

(declare-fun m!67547 () Bool)

(assert (=> b!44288 m!67547))

(assert (=> b!44288 m!67547))

(declare-fun m!67549 () Bool)

(assert (=> b!44288 m!67549))

(declare-fun m!67551 () Bool)

(assert (=> b!44288 m!67551))

(assert (=> b!44288 m!67551))

(declare-fun m!67553 () Bool)

(assert (=> b!44288 m!67553))

(push 1)

(assert (not b!44293))

(assert (not b!44288))

(assert (not b!44289))

(assert (not b!44290))

(assert (not start!8942))

(assert (not b!44292))

(assert (not b!44291))

(assert (not b!44287))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

