; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1208 () Bool)

(assert start!1208)

(declare-fun b!5320 () Bool)

(declare-fun res!6511 () Bool)

(declare-fun e!3437 () Bool)

(assert (=> b!5320 (=> (not res!6511) (not e!3437))))

(declare-datatypes ((array!402 0))(
  ( (array!403 (arr!565 (Array (_ BitVec 32) (_ BitVec 8))) (size!172 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!322 0))(
  ( (BitStream!323 (buf!496 array!402) (currentByte!1481 (_ BitVec 32)) (currentBit!1476 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!322)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!5320 (= res!6511 (validate_offset_bits!1 ((_ sign_extend 32) (size!172 (buf!496 thiss!1486))) ((_ sign_extend 32) (currentByte!1481 thiss!1486)) ((_ sign_extend 32) (currentBit!1476 thiss!1486)) nBits!460))))

(declare-fun b!5321 () Bool)

(declare-fun e!3435 () Bool)

(declare-fun array_inv!167 (array!402) Bool)

(assert (=> b!5321 (= e!3435 (array_inv!167 (buf!496 thiss!1486)))))

(declare-fun b!5323 () Bool)

(declare-fun e!3432 () Bool)

(assert (=> b!5323 (= e!3432 (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((Unit!418 0))(
  ( (Unit!419) )
))
(declare-fun lt!6618 () Unit!418)

(declare-datatypes ((tuple2!688 0))(
  ( (tuple2!689 (_1!363 Unit!418) (_2!363 BitStream!322)) )
))
(declare-fun lt!6619 () tuple2!688)

(declare-fun srcBuffer!6 () array!402)

(declare-datatypes ((tuple2!690 0))(
  ( (tuple2!691 (_1!364 array!402) (_2!364 BitStream!322)) )
))
(declare-fun lt!6623 () tuple2!690)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!322 array!402 array!402 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!418)

(assert (=> b!5323 (= lt!6618 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!363 lt!6619) srcBuffer!6 (_1!364 lt!6623) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!5324 () Bool)

(declare-fun res!6509 () Bool)

(assert (=> b!5324 (=> res!6509 e!3432)))

(declare-datatypes ((List!72 0))(
  ( (Nil!69) (Cons!68 (h!187 Bool) (t!822 List!72)) )
))
(declare-fun lt!6621 () List!72)

(declare-fun byteArrayBitContentToList!0 (BitStream!322 array!402 (_ BitVec 64) (_ BitVec 64)) List!72)

(assert (=> b!5324 (= res!6509 (not (= lt!6621 (byteArrayBitContentToList!0 (_2!363 lt!6619) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!5325 () Bool)

(declare-fun e!3436 () Bool)

(assert (=> b!5325 (= e!3436 (not e!3432))))

(declare-fun res!6514 () Bool)

(assert (=> b!5325 (=> res!6514 e!3432)))

(assert (=> b!5325 (= res!6514 (not (= (byteArrayBitContentToList!0 (_2!363 lt!6619) (_1!364 lt!6623) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!6621)))))

(declare-datatypes ((tuple2!692 0))(
  ( (tuple2!693 (_1!365 BitStream!322) (_2!365 BitStream!322)) )
))
(declare-fun lt!6620 () tuple2!692)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!322 BitStream!322 (_ BitVec 64)) List!72)

(assert (=> b!5325 (= lt!6621 (bitStreamReadBitsIntoList!0 (_2!363 lt!6619) (_1!365 lt!6620) nBits!460))))

(declare-fun readBits!0 (BitStream!322 (_ BitVec 64)) tuple2!690)

(assert (=> b!5325 (= lt!6623 (readBits!0 (_1!365 lt!6620) nBits!460))))

(assert (=> b!5325 (validate_offset_bits!1 ((_ sign_extend 32) (size!172 (buf!496 (_2!363 lt!6619)))) ((_ sign_extend 32) (currentByte!1481 thiss!1486)) ((_ sign_extend 32) (currentBit!1476 thiss!1486)) nBits!460)))

(declare-fun lt!6622 () Unit!418)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!322 array!402 (_ BitVec 64)) Unit!418)

(assert (=> b!5325 (= lt!6622 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!496 (_2!363 lt!6619)) nBits!460))))

(declare-fun reader!0 (BitStream!322 BitStream!322) tuple2!692)

(assert (=> b!5325 (= lt!6620 (reader!0 thiss!1486 (_2!363 lt!6619)))))

(declare-fun b!5326 () Bool)

(declare-fun res!6512 () Bool)

(assert (=> b!5326 (=> (not res!6512) (not e!3436))))

(declare-fun isPrefixOf!0 (BitStream!322 BitStream!322) Bool)

(assert (=> b!5326 (= res!6512 (isPrefixOf!0 thiss!1486 (_2!363 lt!6619)))))

(declare-fun b!5327 () Bool)

(assert (=> b!5327 (= e!3437 e!3436)))

(declare-fun res!6508 () Bool)

(assert (=> b!5327 (=> (not res!6508) (not e!3436))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!5327 (= res!6508 (invariant!0 (currentBit!1476 (_2!363 lt!6619)) (currentByte!1481 (_2!363 lt!6619)) (size!172 (buf!496 (_2!363 lt!6619)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!322 array!402 (_ BitVec 64) (_ BitVec 64)) tuple2!688)

(assert (=> b!5327 (= lt!6619 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!5328 () Bool)

(declare-fun res!6513 () Bool)

(assert (=> b!5328 (=> (not res!6513) (not e!3436))))

(assert (=> b!5328 (= res!6513 (= (size!172 (buf!496 thiss!1486)) (size!172 (buf!496 (_2!363 lt!6619)))))))

(declare-fun res!6510 () Bool)

(assert (=> start!1208 (=> (not res!6510) (not e!3437))))

(assert (=> start!1208 (= res!6510 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!172 srcBuffer!6))))))))

(assert (=> start!1208 e!3437))

(assert (=> start!1208 true))

(assert (=> start!1208 (array_inv!167 srcBuffer!6)))

(declare-fun inv!12 (BitStream!322) Bool)

(assert (=> start!1208 (and (inv!12 thiss!1486) e!3435)))

(declare-fun b!5322 () Bool)

(declare-fun res!6507 () Bool)

(assert (=> b!5322 (=> (not res!6507) (not e!3436))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!5322 (= res!6507 (= (bitIndex!0 (size!172 (buf!496 (_2!363 lt!6619))) (currentByte!1481 (_2!363 lt!6619)) (currentBit!1476 (_2!363 lt!6619))) (bvadd (bitIndex!0 (size!172 (buf!496 thiss!1486)) (currentByte!1481 thiss!1486) (currentBit!1476 thiss!1486)) nBits!460)))))

(assert (= (and start!1208 res!6510) b!5320))

(assert (= (and b!5320 res!6511) b!5327))

(assert (= (and b!5327 res!6508) b!5328))

(assert (= (and b!5328 res!6513) b!5322))

(assert (= (and b!5322 res!6507) b!5326))

(assert (= (and b!5326 res!6512) b!5325))

(assert (= (and b!5325 (not res!6514)) b!5324))

(assert (= (and b!5324 (not res!6509)) b!5323))

(assert (= start!1208 b!5321))

(declare-fun m!6489 () Bool)

(assert (=> b!5321 m!6489))

(declare-fun m!6491 () Bool)

(assert (=> b!5323 m!6491))

(declare-fun m!6493 () Bool)

(assert (=> b!5322 m!6493))

(declare-fun m!6495 () Bool)

(assert (=> b!5322 m!6495))

(declare-fun m!6497 () Bool)

(assert (=> start!1208 m!6497))

(declare-fun m!6499 () Bool)

(assert (=> start!1208 m!6499))

(declare-fun m!6501 () Bool)

(assert (=> b!5320 m!6501))

(declare-fun m!6503 () Bool)

(assert (=> b!5325 m!6503))

(declare-fun m!6505 () Bool)

(assert (=> b!5325 m!6505))

(declare-fun m!6507 () Bool)

(assert (=> b!5325 m!6507))

(declare-fun m!6509 () Bool)

(assert (=> b!5325 m!6509))

(declare-fun m!6511 () Bool)

(assert (=> b!5325 m!6511))

(declare-fun m!6513 () Bool)

(assert (=> b!5325 m!6513))

(declare-fun m!6515 () Bool)

(assert (=> b!5327 m!6515))

(declare-fun m!6517 () Bool)

(assert (=> b!5327 m!6517))

(declare-fun m!6519 () Bool)

(assert (=> b!5324 m!6519))

(declare-fun m!6521 () Bool)

(assert (=> b!5326 m!6521))

(push 1)

(assert (not b!5321))

(assert (not b!5327))

(assert (not b!5324))

(assert (not b!5326))

(assert (not start!1208))

(assert (not b!5320))

(assert (not b!5322))

(assert (not b!5325))

(assert (not b!5323))

(check-sat)

(pop 1)

(push 1)

(check-sat)

