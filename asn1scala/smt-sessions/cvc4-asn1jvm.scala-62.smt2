; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1206 () Bool)

(assert start!1206)

(declare-fun b!5293 () Bool)

(declare-fun res!6483 () Bool)

(declare-fun e!3419 () Bool)

(assert (=> b!5293 (=> (not res!6483) (not e!3419))))

(declare-datatypes ((array!400 0))(
  ( (array!401 (arr!564 (Array (_ BitVec 32) (_ BitVec 8))) (size!171 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!320 0))(
  ( (BitStream!321 (buf!495 array!400) (currentByte!1480 (_ BitVec 32)) (currentBit!1475 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!320)

(declare-datatypes ((Unit!416 0))(
  ( (Unit!417) )
))
(declare-datatypes ((tuple2!682 0))(
  ( (tuple2!683 (_1!360 Unit!416) (_2!360 BitStream!320)) )
))
(declare-fun lt!6603 () tuple2!682)

(declare-fun isPrefixOf!0 (BitStream!320 BitStream!320) Bool)

(assert (=> b!5293 (= res!6483 (isPrefixOf!0 thiss!1486 (_2!360 lt!6603)))))

(declare-fun b!5294 () Bool)

(declare-fun e!3416 () Bool)

(assert (=> b!5294 (= e!3419 (not e!3416))))

(declare-fun res!6488 () Bool)

(assert (=> b!5294 (=> res!6488 e!3416)))

(declare-datatypes ((List!71 0))(
  ( (Nil!68) (Cons!67 (h!186 Bool) (t!821 List!71)) )
))
(declare-fun lt!6605 () List!71)

(declare-datatypes ((tuple2!684 0))(
  ( (tuple2!685 (_1!361 array!400) (_2!361 BitStream!320)) )
))
(declare-fun lt!6602 () tuple2!684)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun byteArrayBitContentToList!0 (BitStream!320 array!400 (_ BitVec 64) (_ BitVec 64)) List!71)

(assert (=> b!5294 (= res!6488 (not (= (byteArrayBitContentToList!0 (_2!360 lt!6603) (_1!361 lt!6602) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!6605)))))

(declare-datatypes ((tuple2!686 0))(
  ( (tuple2!687 (_1!362 BitStream!320) (_2!362 BitStream!320)) )
))
(declare-fun lt!6601 () tuple2!686)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!320 BitStream!320 (_ BitVec 64)) List!71)

(assert (=> b!5294 (= lt!6605 (bitStreamReadBitsIntoList!0 (_2!360 lt!6603) (_1!362 lt!6601) nBits!460))))

(declare-fun readBits!0 (BitStream!320 (_ BitVec 64)) tuple2!684)

(assert (=> b!5294 (= lt!6602 (readBits!0 (_1!362 lt!6601) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!5294 (validate_offset_bits!1 ((_ sign_extend 32) (size!171 (buf!495 (_2!360 lt!6603)))) ((_ sign_extend 32) (currentByte!1480 thiss!1486)) ((_ sign_extend 32) (currentBit!1475 thiss!1486)) nBits!460)))

(declare-fun lt!6604 () Unit!416)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!320 array!400 (_ BitVec 64)) Unit!416)

(assert (=> b!5294 (= lt!6604 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!495 (_2!360 lt!6603)) nBits!460))))

(declare-fun reader!0 (BitStream!320 BitStream!320) tuple2!686)

(assert (=> b!5294 (= lt!6601 (reader!0 thiss!1486 (_2!360 lt!6603)))))

(declare-fun b!5295 () Bool)

(declare-fun e!3415 () Bool)

(declare-fun array_inv!166 (array!400) Bool)

(assert (=> b!5295 (= e!3415 (array_inv!166 (buf!495 thiss!1486)))))

(declare-fun b!5296 () Bool)

(declare-fun res!6487 () Bool)

(declare-fun e!3418 () Bool)

(assert (=> b!5296 (=> (not res!6487) (not e!3418))))

(assert (=> b!5296 (= res!6487 (validate_offset_bits!1 ((_ sign_extend 32) (size!171 (buf!495 thiss!1486))) ((_ sign_extend 32) (currentByte!1480 thiss!1486)) ((_ sign_extend 32) (currentBit!1475 thiss!1486)) nBits!460))))

(declare-fun res!6490 () Bool)

(assert (=> start!1206 (=> (not res!6490) (not e!3418))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!400)

(assert (=> start!1206 (= res!6490 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!171 srcBuffer!6))))))))

(assert (=> start!1206 e!3418))

(assert (=> start!1206 true))

(assert (=> start!1206 (array_inv!166 srcBuffer!6)))

(declare-fun inv!12 (BitStream!320) Bool)

(assert (=> start!1206 (and (inv!12 thiss!1486) e!3415)))

(declare-fun b!5297 () Bool)

(assert (=> b!5297 (= e!3416 true)))

(declare-fun lt!6600 () Unit!416)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!320 array!400 array!400 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!416)

(assert (=> b!5297 (= lt!6600 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!360 lt!6603) srcBuffer!6 (_1!361 lt!6602) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!5298 () Bool)

(declare-fun res!6484 () Bool)

(assert (=> b!5298 (=> res!6484 e!3416)))

(assert (=> b!5298 (= res!6484 (not (= lt!6605 (byteArrayBitContentToList!0 (_2!360 lt!6603) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!5299 () Bool)

(declare-fun res!6486 () Bool)

(assert (=> b!5299 (=> (not res!6486) (not e!3419))))

(assert (=> b!5299 (= res!6486 (= (size!171 (buf!495 thiss!1486)) (size!171 (buf!495 (_2!360 lt!6603)))))))

(declare-fun b!5300 () Bool)

(assert (=> b!5300 (= e!3418 e!3419)))

(declare-fun res!6485 () Bool)

(assert (=> b!5300 (=> (not res!6485) (not e!3419))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!5300 (= res!6485 (invariant!0 (currentBit!1475 (_2!360 lt!6603)) (currentByte!1480 (_2!360 lt!6603)) (size!171 (buf!495 (_2!360 lt!6603)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!320 array!400 (_ BitVec 64) (_ BitVec 64)) tuple2!682)

(assert (=> b!5300 (= lt!6603 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!5301 () Bool)

(declare-fun res!6489 () Bool)

(assert (=> b!5301 (=> (not res!6489) (not e!3419))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!5301 (= res!6489 (= (bitIndex!0 (size!171 (buf!495 (_2!360 lt!6603))) (currentByte!1480 (_2!360 lt!6603)) (currentBit!1475 (_2!360 lt!6603))) (bvadd (bitIndex!0 (size!171 (buf!495 thiss!1486)) (currentByte!1480 thiss!1486) (currentBit!1475 thiss!1486)) nBits!460)))))

(assert (= (and start!1206 res!6490) b!5296))

(assert (= (and b!5296 res!6487) b!5300))

(assert (= (and b!5300 res!6485) b!5299))

(assert (= (and b!5299 res!6486) b!5301))

(assert (= (and b!5301 res!6489) b!5293))

(assert (= (and b!5293 res!6483) b!5294))

(assert (= (and b!5294 (not res!6488)) b!5298))

(assert (= (and b!5298 (not res!6484)) b!5297))

(assert (= start!1206 b!5295))

(declare-fun m!6455 () Bool)

(assert (=> b!5295 m!6455))

(declare-fun m!6457 () Bool)

(assert (=> b!5300 m!6457))

(declare-fun m!6459 () Bool)

(assert (=> b!5300 m!6459))

(declare-fun m!6461 () Bool)

(assert (=> b!5301 m!6461))

(declare-fun m!6463 () Bool)

(assert (=> b!5301 m!6463))

(declare-fun m!6465 () Bool)

(assert (=> b!5294 m!6465))

(declare-fun m!6467 () Bool)

(assert (=> b!5294 m!6467))

(declare-fun m!6469 () Bool)

(assert (=> b!5294 m!6469))

(declare-fun m!6471 () Bool)

(assert (=> b!5294 m!6471))

(declare-fun m!6473 () Bool)

(assert (=> b!5294 m!6473))

(declare-fun m!6475 () Bool)

(assert (=> b!5294 m!6475))

(declare-fun m!6477 () Bool)

(assert (=> b!5293 m!6477))

(declare-fun m!6479 () Bool)

(assert (=> b!5298 m!6479))

(declare-fun m!6481 () Bool)

(assert (=> start!1206 m!6481))

(declare-fun m!6483 () Bool)

(assert (=> start!1206 m!6483))

(declare-fun m!6485 () Bool)

(assert (=> b!5296 m!6485))

(declare-fun m!6487 () Bool)

(assert (=> b!5297 m!6487))

(push 1)

(assert (not b!5295))

(assert (not b!5293))

(assert (not b!5294))

(assert (not start!1206))

(assert (not b!5296))

(assert (not b!5300))

(assert (not b!5301))

(assert (not b!5297))

(assert (not b!5298))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

