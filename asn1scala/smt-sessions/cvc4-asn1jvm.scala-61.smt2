; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1200 () Bool)

(assert start!1200)

(declare-fun res!6414 () Bool)

(declare-fun e!3361 () Bool)

(assert (=> start!1200 (=> (not res!6414) (not e!3361))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!394 0))(
  ( (array!395 (arr!561 (Array (_ BitVec 32) (_ BitVec 8))) (size!168 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!394)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!1200 (= res!6414 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!168 srcBuffer!6))))))))

(assert (=> start!1200 e!3361))

(assert (=> start!1200 true))

(declare-fun array_inv!163 (array!394) Bool)

(assert (=> start!1200 (array_inv!163 srcBuffer!6)))

(declare-datatypes ((BitStream!314 0))(
  ( (BitStream!315 (buf!492 array!394) (currentByte!1477 (_ BitVec 32)) (currentBit!1472 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!314)

(declare-fun e!3365 () Bool)

(declare-fun inv!12 (BitStream!314) Bool)

(assert (=> start!1200 (and (inv!12 thiss!1486) e!3365)))

(declare-fun b!5212 () Bool)

(declare-fun e!3364 () Bool)

(declare-fun e!3363 () Bool)

(assert (=> b!5212 (= e!3364 (not e!3363))))

(declare-fun res!6417 () Bool)

(assert (=> b!5212 (=> res!6417 e!3363)))

(declare-datatypes ((tuple2!664 0))(
  ( (tuple2!665 (_1!351 array!394) (_2!351 BitStream!314)) )
))
(declare-fun lt!6548 () tuple2!664)

(declare-datatypes ((Unit!410 0))(
  ( (Unit!411) )
))
(declare-datatypes ((tuple2!666 0))(
  ( (tuple2!667 (_1!352 Unit!410) (_2!352 BitStream!314)) )
))
(declare-fun lt!6546 () tuple2!666)

(declare-datatypes ((List!68 0))(
  ( (Nil!65) (Cons!64 (h!183 Bool) (t!818 List!68)) )
))
(declare-fun lt!6547 () List!68)

(declare-fun byteArrayBitContentToList!0 (BitStream!314 array!394 (_ BitVec 64) (_ BitVec 64)) List!68)

(assert (=> b!5212 (= res!6417 (not (= (byteArrayBitContentToList!0 (_2!352 lt!6546) (_1!351 lt!6548) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!6547)))))

(declare-datatypes ((tuple2!668 0))(
  ( (tuple2!669 (_1!353 BitStream!314) (_2!353 BitStream!314)) )
))
(declare-fun lt!6550 () tuple2!668)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!314 BitStream!314 (_ BitVec 64)) List!68)

(assert (=> b!5212 (= lt!6547 (bitStreamReadBitsIntoList!0 (_2!352 lt!6546) (_1!353 lt!6550) nBits!460))))

(declare-fun readBits!0 (BitStream!314 (_ BitVec 64)) tuple2!664)

(assert (=> b!5212 (= lt!6548 (readBits!0 (_1!353 lt!6550) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!5212 (validate_offset_bits!1 ((_ sign_extend 32) (size!168 (buf!492 (_2!352 lt!6546)))) ((_ sign_extend 32) (currentByte!1477 thiss!1486)) ((_ sign_extend 32) (currentBit!1472 thiss!1486)) nBits!460)))

(declare-fun lt!6549 () Unit!410)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!314 array!394 (_ BitVec 64)) Unit!410)

(assert (=> b!5212 (= lt!6549 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!492 (_2!352 lt!6546)) nBits!460))))

(declare-fun reader!0 (BitStream!314 BitStream!314) tuple2!668)

(assert (=> b!5212 (= lt!6550 (reader!0 thiss!1486 (_2!352 lt!6546)))))

(declare-fun b!5213 () Bool)

(assert (=> b!5213 (= e!3361 e!3364)))

(declare-fun res!6415 () Bool)

(assert (=> b!5213 (=> (not res!6415) (not e!3364))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!5213 (= res!6415 (invariant!0 (currentBit!1472 (_2!352 lt!6546)) (currentByte!1477 (_2!352 lt!6546)) (size!168 (buf!492 (_2!352 lt!6546)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!314 array!394 (_ BitVec 64) (_ BitVec 64)) tuple2!666)

(assert (=> b!5213 (= lt!6546 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!5214 () Bool)

(declare-fun res!6416 () Bool)

(assert (=> b!5214 (=> (not res!6416) (not e!3364))))

(declare-fun isPrefixOf!0 (BitStream!314 BitStream!314) Bool)

(assert (=> b!5214 (= res!6416 (isPrefixOf!0 thiss!1486 (_2!352 lt!6546)))))

(declare-fun b!5215 () Bool)

(declare-fun res!6412 () Bool)

(assert (=> b!5215 (=> res!6412 e!3363)))

(assert (=> b!5215 (= res!6412 (not (= lt!6547 (byteArrayBitContentToList!0 (_2!352 lt!6546) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!5216 () Bool)

(declare-fun res!6413 () Bool)

(assert (=> b!5216 (=> (not res!6413) (not e!3364))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!5216 (= res!6413 (= (bitIndex!0 (size!168 (buf!492 (_2!352 lt!6546))) (currentByte!1477 (_2!352 lt!6546)) (currentBit!1472 (_2!352 lt!6546))) (bvadd (bitIndex!0 (size!168 (buf!492 thiss!1486)) (currentByte!1477 thiss!1486) (currentBit!1472 thiss!1486)) nBits!460)))))

(declare-fun b!5217 () Bool)

(declare-fun res!6411 () Bool)

(assert (=> b!5217 (=> (not res!6411) (not e!3361))))

(assert (=> b!5217 (= res!6411 (validate_offset_bits!1 ((_ sign_extend 32) (size!168 (buf!492 thiss!1486))) ((_ sign_extend 32) (currentByte!1477 thiss!1486)) ((_ sign_extend 32) (currentBit!1472 thiss!1486)) nBits!460))))

(declare-fun b!5218 () Bool)

(declare-fun res!6418 () Bool)

(assert (=> b!5218 (=> (not res!6418) (not e!3364))))

(assert (=> b!5218 (= res!6418 (= (size!168 (buf!492 thiss!1486)) (size!168 (buf!492 (_2!352 lt!6546)))))))

(declare-fun b!5219 () Bool)

(assert (=> b!5219 (= e!3363 true)))

(declare-fun lt!6551 () Unit!410)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!314 array!394 array!394 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!410)

(assert (=> b!5219 (= lt!6551 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!352 lt!6546) srcBuffer!6 (_1!351 lt!6548) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!5220 () Bool)

(assert (=> b!5220 (= e!3365 (array_inv!163 (buf!492 thiss!1486)))))

(assert (= (and start!1200 res!6414) b!5217))

(assert (= (and b!5217 res!6411) b!5213))

(assert (= (and b!5213 res!6415) b!5218))

(assert (= (and b!5218 res!6418) b!5216))

(assert (= (and b!5216 res!6413) b!5214))

(assert (= (and b!5214 res!6416) b!5212))

(assert (= (and b!5212 (not res!6417)) b!5215))

(assert (= (and b!5215 (not res!6412)) b!5219))

(assert (= start!1200 b!5220))

(declare-fun m!6353 () Bool)

(assert (=> b!5215 m!6353))

(declare-fun m!6355 () Bool)

(assert (=> b!5219 m!6355))

(declare-fun m!6357 () Bool)

(assert (=> b!5216 m!6357))

(declare-fun m!6359 () Bool)

(assert (=> b!5216 m!6359))

(declare-fun m!6361 () Bool)

(assert (=> b!5220 m!6361))

(declare-fun m!6363 () Bool)

(assert (=> b!5213 m!6363))

(declare-fun m!6365 () Bool)

(assert (=> b!5213 m!6365))

(declare-fun m!6367 () Bool)

(assert (=> b!5214 m!6367))

(declare-fun m!6369 () Bool)

(assert (=> b!5217 m!6369))

(declare-fun m!6371 () Bool)

(assert (=> b!5212 m!6371))

(declare-fun m!6373 () Bool)

(assert (=> b!5212 m!6373))

(declare-fun m!6375 () Bool)

(assert (=> b!5212 m!6375))

(declare-fun m!6377 () Bool)

(assert (=> b!5212 m!6377))

(declare-fun m!6379 () Bool)

(assert (=> b!5212 m!6379))

(declare-fun m!6381 () Bool)

(assert (=> b!5212 m!6381))

(declare-fun m!6383 () Bool)

(assert (=> start!1200 m!6383))

(declare-fun m!6385 () Bool)

(assert (=> start!1200 m!6385))

(push 1)

(assert (not b!5212))

(assert (not b!5215))

(assert (not b!5220))

(assert (not start!1200))

(assert (not b!5216))

(assert (not b!5219))

(assert (not b!5213))

(assert (not b!5214))

(assert (not b!5217))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

