; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1538 () Bool)

(assert start!1538)

(declare-fun b!7345 () Bool)

(declare-fun e!4597 () Bool)

(declare-fun e!4594 () Bool)

(assert (=> b!7345 (= e!4597 (not e!4594))))

(declare-fun res!8123 () Bool)

(assert (=> b!7345 (=> res!8123 e!4594)))

(declare-datatypes ((List!114 0))(
  ( (Nil!111) (Cons!110 (h!229 Bool) (t!864 List!114)) )
))
(declare-fun lt!9696 () List!114)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-datatypes ((array!495 0))(
  ( (array!496 (arr!616 (Array (_ BitVec 32) (_ BitVec 8))) (size!214 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!406 0))(
  ( (BitStream!407 (buf!547 array!495) (currentByte!1550 (_ BitVec 32)) (currentBit!1545 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!574 0))(
  ( (Unit!575) )
))
(declare-datatypes ((tuple2!976 0))(
  ( (tuple2!977 (_1!516 Unit!574) (_2!516 BitStream!406)) )
))
(declare-fun lt!9701 () tuple2!976)

(declare-datatypes ((tuple2!978 0))(
  ( (tuple2!979 (_1!517 array!495) (_2!517 BitStream!406)) )
))
(declare-fun lt!9699 () tuple2!978)

(declare-fun byteArrayBitContentToList!0 (BitStream!406 array!495 (_ BitVec 64) (_ BitVec 64)) List!114)

(assert (=> b!7345 (= res!8123 (not (= (byteArrayBitContentToList!0 (_2!516 lt!9701) (_1!517 lt!9699) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!9696)))))

(declare-datatypes ((tuple2!980 0))(
  ( (tuple2!981 (_1!518 BitStream!406) (_2!518 BitStream!406)) )
))
(declare-fun lt!9700 () tuple2!980)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!406 BitStream!406 (_ BitVec 64)) List!114)

(assert (=> b!7345 (= lt!9696 (bitStreamReadBitsIntoList!0 (_2!516 lt!9701) (_1!518 lt!9700) nBits!460))))

(declare-fun readBits!0 (BitStream!406 (_ BitVec 64)) tuple2!978)

(assert (=> b!7345 (= lt!9699 (readBits!0 (_1!518 lt!9700) nBits!460))))

(declare-fun thiss!1486 () BitStream!406)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!7345 (validate_offset_bits!1 ((_ sign_extend 32) (size!214 (buf!547 (_2!516 lt!9701)))) ((_ sign_extend 32) (currentByte!1550 thiss!1486)) ((_ sign_extend 32) (currentBit!1545 thiss!1486)) nBits!460)))

(declare-fun lt!9697 () Unit!574)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!406 array!495 (_ BitVec 64)) Unit!574)

(assert (=> b!7345 (= lt!9697 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!547 (_2!516 lt!9701)) nBits!460))))

(declare-fun reader!0 (BitStream!406 BitStream!406) tuple2!980)

(assert (=> b!7345 (= lt!9700 (reader!0 thiss!1486 (_2!516 lt!9701)))))

(declare-fun b!7346 () Bool)

(declare-fun res!8120 () Bool)

(assert (=> b!7346 (=> (not res!8120) (not e!4597))))

(declare-fun isPrefixOf!0 (BitStream!406 BitStream!406) Bool)

(assert (=> b!7346 (= res!8120 (isPrefixOf!0 thiss!1486 (_2!516 lt!9701)))))

(declare-fun b!7347 () Bool)

(assert (=> b!7347 (= e!4594 true)))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!495)

(declare-fun lt!9698 () Unit!574)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!406 array!495 array!495 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!574)

(assert (=> b!7347 (= lt!9698 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!516 lt!9701) srcBuffer!6 (_1!517 lt!9699) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!7348 () Bool)

(declare-fun res!8124 () Bool)

(assert (=> b!7348 (=> (not res!8124) (not e!4597))))

(assert (=> b!7348 (= res!8124 (= (size!214 (buf!547 thiss!1486)) (size!214 (buf!547 (_2!516 lt!9701)))))))

(declare-fun b!7349 () Bool)

(declare-fun res!8121 () Bool)

(assert (=> b!7349 (=> (not res!8121) (not e!4597))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!7349 (= res!8121 (= (bitIndex!0 (size!214 (buf!547 (_2!516 lt!9701))) (currentByte!1550 (_2!516 lt!9701)) (currentBit!1545 (_2!516 lt!9701))) (bvadd (bitIndex!0 (size!214 (buf!547 thiss!1486)) (currentByte!1550 thiss!1486) (currentBit!1545 thiss!1486)) nBits!460)))))

(declare-fun res!8119 () Bool)

(declare-fun e!4596 () Bool)

(assert (=> start!1538 (=> (not res!8119) (not e!4596))))

(assert (=> start!1538 (= res!8119 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!214 srcBuffer!6))))))))

(assert (=> start!1538 e!4596))

(assert (=> start!1538 true))

(declare-fun array_inv!209 (array!495) Bool)

(assert (=> start!1538 (array_inv!209 srcBuffer!6)))

(declare-fun e!4595 () Bool)

(declare-fun inv!12 (BitStream!406) Bool)

(assert (=> start!1538 (and (inv!12 thiss!1486) e!4595)))

(declare-fun b!7350 () Bool)

(assert (=> b!7350 (= e!4596 e!4597)))

(declare-fun res!8125 () Bool)

(assert (=> b!7350 (=> (not res!8125) (not e!4597))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!7350 (= res!8125 (invariant!0 (currentBit!1545 (_2!516 lt!9701)) (currentByte!1550 (_2!516 lt!9701)) (size!214 (buf!547 (_2!516 lt!9701)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!406 array!495 (_ BitVec 64) (_ BitVec 64)) tuple2!976)

(assert (=> b!7350 (= lt!9701 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!7351 () Bool)

(declare-fun res!8118 () Bool)

(assert (=> b!7351 (=> res!8118 e!4594)))

(assert (=> b!7351 (= res!8118 (not (= lt!9696 (byteArrayBitContentToList!0 (_2!516 lt!9701) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!7352 () Bool)

(assert (=> b!7352 (= e!4595 (array_inv!209 (buf!547 thiss!1486)))))

(declare-fun b!7353 () Bool)

(declare-fun res!8122 () Bool)

(assert (=> b!7353 (=> (not res!8122) (not e!4596))))

(assert (=> b!7353 (= res!8122 (validate_offset_bits!1 ((_ sign_extend 32) (size!214 (buf!547 thiss!1486))) ((_ sign_extend 32) (currentByte!1550 thiss!1486)) ((_ sign_extend 32) (currentBit!1545 thiss!1486)) nBits!460))))

(assert (= (and start!1538 res!8119) b!7353))

(assert (= (and b!7353 res!8122) b!7350))

(assert (= (and b!7350 res!8125) b!7348))

(assert (= (and b!7348 res!8124) b!7349))

(assert (= (and b!7349 res!8121) b!7346))

(assert (= (and b!7346 res!8120) b!7345))

(assert (= (and b!7345 (not res!8123)) b!7351))

(assert (= (and b!7351 (not res!8118)) b!7347))

(assert (= start!1538 b!7352))

(declare-fun m!9405 () Bool)

(assert (=> b!7352 m!9405))

(declare-fun m!9407 () Bool)

(assert (=> start!1538 m!9407))

(declare-fun m!9409 () Bool)

(assert (=> start!1538 m!9409))

(declare-fun m!9411 () Bool)

(assert (=> b!7350 m!9411))

(declare-fun m!9413 () Bool)

(assert (=> b!7350 m!9413))

(declare-fun m!9415 () Bool)

(assert (=> b!7353 m!9415))

(declare-fun m!9417 () Bool)

(assert (=> b!7351 m!9417))

(declare-fun m!9419 () Bool)

(assert (=> b!7345 m!9419))

(declare-fun m!9421 () Bool)

(assert (=> b!7345 m!9421))

(declare-fun m!9423 () Bool)

(assert (=> b!7345 m!9423))

(declare-fun m!9425 () Bool)

(assert (=> b!7345 m!9425))

(declare-fun m!9427 () Bool)

(assert (=> b!7345 m!9427))

(declare-fun m!9429 () Bool)

(assert (=> b!7345 m!9429))

(declare-fun m!9431 () Bool)

(assert (=> b!7349 m!9431))

(declare-fun m!9433 () Bool)

(assert (=> b!7349 m!9433))

(declare-fun m!9435 () Bool)

(assert (=> b!7346 m!9435))

(declare-fun m!9437 () Bool)

(assert (=> b!7347 m!9437))

(push 1)

(assert (not b!7349))

(assert (not b!7353))

(assert (not b!7346))

(assert (not b!7351))

(assert (not start!1538))

(assert (not b!7347))

(assert (not b!7352))

(assert (not b!7345))

(assert (not b!7350))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

