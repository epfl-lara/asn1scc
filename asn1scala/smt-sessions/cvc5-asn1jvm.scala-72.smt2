; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1424 () Bool)

(assert start!1424)

(declare-fun b!6622 () Bool)

(declare-fun e!4175 () Bool)

(declare-fun e!4176 () Bool)

(assert (=> b!6622 (= e!4175 e!4176)))

(declare-fun res!7541 () Bool)

(assert (=> b!6622 (=> (not res!7541) (not e!4176))))

(declare-datatypes ((array!462 0))(
  ( (array!463 (arr!598 (Array (_ BitVec 32) (_ BitVec 8))) (size!199 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!376 0))(
  ( (BitStream!377 (buf!529 array!462) (currentByte!1526 (_ BitVec 32)) (currentBit!1521 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!520 0))(
  ( (Unit!521) )
))
(declare-datatypes ((tuple2!874 0))(
  ( (tuple2!875 (_1!462 Unit!520) (_2!462 BitStream!376)) )
))
(declare-fun lt!8653 () tuple2!874)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!6622 (= res!7541 (invariant!0 (currentBit!1521 (_2!462 lt!8653)) (currentByte!1526 (_2!462 lt!8653)) (size!199 (buf!529 (_2!462 lt!8653)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!462)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun thiss!1486 () BitStream!376)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!376 array!462 (_ BitVec 64) (_ BitVec 64)) tuple2!874)

(assert (=> b!6622 (= lt!8653 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!6623 () Bool)

(declare-fun res!7538 () Bool)

(assert (=> b!6623 (=> (not res!7538) (not e!4176))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!6623 (= res!7538 (= (bitIndex!0 (size!199 (buf!529 (_2!462 lt!8653))) (currentByte!1526 (_2!462 lt!8653)) (currentBit!1521 (_2!462 lt!8653))) (bvadd (bitIndex!0 (size!199 (buf!529 thiss!1486)) (currentByte!1526 thiss!1486) (currentBit!1521 thiss!1486)) nBits!460)))))

(declare-fun b!6624 () Bool)

(declare-fun e!4173 () Bool)

(assert (=> b!6624 (= e!4176 (not e!4173))))

(declare-fun res!7536 () Bool)

(assert (=> b!6624 (=> res!7536 e!4173)))

(declare-datatypes ((List!99 0))(
  ( (Nil!96) (Cons!95 (h!214 Bool) (t!849 List!99)) )
))
(declare-fun lt!8656 () List!99)

(declare-datatypes ((tuple2!876 0))(
  ( (tuple2!877 (_1!463 array!462) (_2!463 BitStream!376)) )
))
(declare-fun lt!8657 () tuple2!876)

(declare-fun byteArrayBitContentToList!0 (BitStream!376 array!462 (_ BitVec 64) (_ BitVec 64)) List!99)

(assert (=> b!6624 (= res!7536 (not (= (byteArrayBitContentToList!0 (_2!462 lt!8653) (_1!463 lt!8657) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!8656)))))

(declare-datatypes ((tuple2!878 0))(
  ( (tuple2!879 (_1!464 BitStream!376) (_2!464 BitStream!376)) )
))
(declare-fun lt!8655 () tuple2!878)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!376 BitStream!376 (_ BitVec 64)) List!99)

(assert (=> b!6624 (= lt!8656 (bitStreamReadBitsIntoList!0 (_2!462 lt!8653) (_1!464 lt!8655) nBits!460))))

(declare-fun readBits!0 (BitStream!376 (_ BitVec 64)) tuple2!876)

(assert (=> b!6624 (= lt!8657 (readBits!0 (_1!464 lt!8655) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!6624 (validate_offset_bits!1 ((_ sign_extend 32) (size!199 (buf!529 (_2!462 lt!8653)))) ((_ sign_extend 32) (currentByte!1526 thiss!1486)) ((_ sign_extend 32) (currentBit!1521 thiss!1486)) nBits!460)))

(declare-fun lt!8652 () Unit!520)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!376 array!462 (_ BitVec 64)) Unit!520)

(assert (=> b!6624 (= lt!8652 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!529 (_2!462 lt!8653)) nBits!460))))

(declare-fun reader!0 (BitStream!376 BitStream!376) tuple2!878)

(assert (=> b!6624 (= lt!8655 (reader!0 thiss!1486 (_2!462 lt!8653)))))

(declare-fun b!6625 () Bool)

(assert (=> b!6625 (= e!4173 true)))

(declare-fun lt!8654 () Unit!520)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!376 array!462 array!462 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!520)

(assert (=> b!6625 (= lt!8654 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!462 lt!8653) srcBuffer!6 (_1!463 lt!8657) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!6626 () Bool)

(declare-fun res!7537 () Bool)

(assert (=> b!6626 (=> res!7537 e!4173)))

(assert (=> b!6626 (= res!7537 (not (= lt!8656 (byteArrayBitContentToList!0 (_2!462 lt!8653) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!6627 () Bool)

(declare-fun res!7542 () Bool)

(assert (=> b!6627 (=> (not res!7542) (not e!4176))))

(declare-fun isPrefixOf!0 (BitStream!376 BitStream!376) Bool)

(assert (=> b!6627 (= res!7542 (isPrefixOf!0 thiss!1486 (_2!462 lt!8653)))))

(declare-fun res!7543 () Bool)

(assert (=> start!1424 (=> (not res!7543) (not e!4175))))

(assert (=> start!1424 (= res!7543 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!199 srcBuffer!6))))))))

(assert (=> start!1424 e!4175))

(assert (=> start!1424 true))

(declare-fun array_inv!194 (array!462) Bool)

(assert (=> start!1424 (array_inv!194 srcBuffer!6)))

(declare-fun e!4174 () Bool)

(declare-fun inv!12 (BitStream!376) Bool)

(assert (=> start!1424 (and (inv!12 thiss!1486) e!4174)))

(declare-fun b!6628 () Bool)

(declare-fun res!7539 () Bool)

(assert (=> b!6628 (=> (not res!7539) (not e!4176))))

(assert (=> b!6628 (= res!7539 (= (size!199 (buf!529 thiss!1486)) (size!199 (buf!529 (_2!462 lt!8653)))))))

(declare-fun b!6629 () Bool)

(declare-fun res!7540 () Bool)

(assert (=> b!6629 (=> (not res!7540) (not e!4175))))

(assert (=> b!6629 (= res!7540 (validate_offset_bits!1 ((_ sign_extend 32) (size!199 (buf!529 thiss!1486))) ((_ sign_extend 32) (currentByte!1526 thiss!1486)) ((_ sign_extend 32) (currentBit!1521 thiss!1486)) nBits!460))))

(declare-fun b!6630 () Bool)

(assert (=> b!6630 (= e!4174 (array_inv!194 (buf!529 thiss!1486)))))

(assert (= (and start!1424 res!7543) b!6629))

(assert (= (and b!6629 res!7540) b!6622))

(assert (= (and b!6622 res!7541) b!6628))

(assert (= (and b!6628 res!7539) b!6623))

(assert (= (and b!6623 res!7538) b!6627))

(assert (= (and b!6627 res!7542) b!6624))

(assert (= (and b!6624 (not res!7536)) b!6626))

(assert (= (and b!6626 (not res!7537)) b!6625))

(assert (= start!1424 b!6630))

(declare-fun m!8385 () Bool)

(assert (=> b!6622 m!8385))

(declare-fun m!8387 () Bool)

(assert (=> b!6622 m!8387))

(declare-fun m!8389 () Bool)

(assert (=> b!6630 m!8389))

(declare-fun m!8391 () Bool)

(assert (=> b!6627 m!8391))

(declare-fun m!8393 () Bool)

(assert (=> start!1424 m!8393))

(declare-fun m!8395 () Bool)

(assert (=> start!1424 m!8395))

(declare-fun m!8397 () Bool)

(assert (=> b!6623 m!8397))

(declare-fun m!8399 () Bool)

(assert (=> b!6623 m!8399))

(declare-fun m!8401 () Bool)

(assert (=> b!6629 m!8401))

(declare-fun m!8403 () Bool)

(assert (=> b!6626 m!8403))

(declare-fun m!8405 () Bool)

(assert (=> b!6624 m!8405))

(declare-fun m!8407 () Bool)

(assert (=> b!6624 m!8407))

(declare-fun m!8409 () Bool)

(assert (=> b!6624 m!8409))

(declare-fun m!8411 () Bool)

(assert (=> b!6624 m!8411))

(declare-fun m!8413 () Bool)

(assert (=> b!6624 m!8413))

(declare-fun m!8415 () Bool)

(assert (=> b!6624 m!8415))

(declare-fun m!8417 () Bool)

(assert (=> b!6625 m!8417))

(push 1)

(assert (not b!6622))

(assert (not b!6623))

(assert (not b!6625))

(assert (not b!6629))

(assert (not b!6624))

(assert (not b!6626))

(assert (not start!1424))

(assert (not b!6630))

(assert (not b!6627))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

