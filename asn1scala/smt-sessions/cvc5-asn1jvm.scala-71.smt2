; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1418 () Bool)

(assert start!1418)

(declare-fun b!6541 () Bool)

(declare-fun res!7464 () Bool)

(declare-fun e!4119 () Bool)

(assert (=> b!6541 (=> (not res!7464) (not e!4119))))

(declare-datatypes ((array!456 0))(
  ( (array!457 (arr!595 (Array (_ BitVec 32) (_ BitVec 8))) (size!196 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!370 0))(
  ( (BitStream!371 (buf!526 array!456) (currentByte!1523 (_ BitVec 32)) (currentBit!1518 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!370)

(declare-datatypes ((Unit!514 0))(
  ( (Unit!515) )
))
(declare-datatypes ((tuple2!856 0))(
  ( (tuple2!857 (_1!453 Unit!514) (_2!453 BitStream!370)) )
))
(declare-fun lt!8599 () tuple2!856)

(assert (=> b!6541 (= res!7464 (= (size!196 (buf!526 thiss!1486)) (size!196 (buf!526 (_2!453 lt!8599)))))))

(declare-fun b!6542 () Bool)

(declare-fun res!7469 () Bool)

(declare-fun e!4121 () Bool)

(assert (=> b!6542 (=> res!7469 e!4121)))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!456)

(declare-datatypes ((List!96 0))(
  ( (Nil!93) (Cons!92 (h!211 Bool) (t!846 List!96)) )
))
(declare-fun lt!8601 () List!96)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun byteArrayBitContentToList!0 (BitStream!370 array!456 (_ BitVec 64) (_ BitVec 64)) List!96)

(assert (=> b!6542 (= res!7469 (not (= lt!8601 (byteArrayBitContentToList!0 (_2!453 lt!8599) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!6543 () Bool)

(declare-fun res!7468 () Bool)

(declare-fun e!4123 () Bool)

(assert (=> b!6543 (=> (not res!7468) (not e!4123))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!6543 (= res!7468 (validate_offset_bits!1 ((_ sign_extend 32) (size!196 (buf!526 thiss!1486))) ((_ sign_extend 32) (currentByte!1523 thiss!1486)) ((_ sign_extend 32) (currentBit!1518 thiss!1486)) nBits!460))))

(declare-fun b!6544 () Bool)

(assert (=> b!6544 (= e!4119 (not e!4121))))

(declare-fun res!7470 () Bool)

(assert (=> b!6544 (=> res!7470 e!4121)))

(declare-datatypes ((tuple2!858 0))(
  ( (tuple2!859 (_1!454 array!456) (_2!454 BitStream!370)) )
))
(declare-fun lt!8602 () tuple2!858)

(assert (=> b!6544 (= res!7470 (not (= (byteArrayBitContentToList!0 (_2!453 lt!8599) (_1!454 lt!8602) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!8601)))))

(declare-datatypes ((tuple2!860 0))(
  ( (tuple2!861 (_1!455 BitStream!370) (_2!455 BitStream!370)) )
))
(declare-fun lt!8600 () tuple2!860)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!370 BitStream!370 (_ BitVec 64)) List!96)

(assert (=> b!6544 (= lt!8601 (bitStreamReadBitsIntoList!0 (_2!453 lt!8599) (_1!455 lt!8600) nBits!460))))

(declare-fun readBits!0 (BitStream!370 (_ BitVec 64)) tuple2!858)

(assert (=> b!6544 (= lt!8602 (readBits!0 (_1!455 lt!8600) nBits!460))))

(assert (=> b!6544 (validate_offset_bits!1 ((_ sign_extend 32) (size!196 (buf!526 (_2!453 lt!8599)))) ((_ sign_extend 32) (currentByte!1523 thiss!1486)) ((_ sign_extend 32) (currentBit!1518 thiss!1486)) nBits!460)))

(declare-fun lt!8598 () Unit!514)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!370 array!456 (_ BitVec 64)) Unit!514)

(assert (=> b!6544 (= lt!8598 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!526 (_2!453 lt!8599)) nBits!460))))

(declare-fun reader!0 (BitStream!370 BitStream!370) tuple2!860)

(assert (=> b!6544 (= lt!8600 (reader!0 thiss!1486 (_2!453 lt!8599)))))

(declare-fun b!6545 () Bool)

(assert (=> b!6545 (= e!4123 e!4119)))

(declare-fun res!7465 () Bool)

(assert (=> b!6545 (=> (not res!7465) (not e!4119))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!6545 (= res!7465 (invariant!0 (currentBit!1518 (_2!453 lt!8599)) (currentByte!1523 (_2!453 lt!8599)) (size!196 (buf!526 (_2!453 lt!8599)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!370 array!456 (_ BitVec 64) (_ BitVec 64)) tuple2!856)

(assert (=> b!6545 (= lt!8599 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!6546 () Bool)

(declare-fun e!4120 () Bool)

(declare-fun array_inv!191 (array!456) Bool)

(assert (=> b!6546 (= e!4120 (array_inv!191 (buf!526 thiss!1486)))))

(declare-fun b!6547 () Bool)

(declare-fun res!7466 () Bool)

(assert (=> b!6547 (=> (not res!7466) (not e!4119))))

(declare-fun isPrefixOf!0 (BitStream!370 BitStream!370) Bool)

(assert (=> b!6547 (= res!7466 (isPrefixOf!0 thiss!1486 (_2!453 lt!8599)))))

(declare-fun b!6548 () Bool)

(declare-fun res!7471 () Bool)

(assert (=> b!6548 (=> (not res!7471) (not e!4119))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!6548 (= res!7471 (= (bitIndex!0 (size!196 (buf!526 (_2!453 lt!8599))) (currentByte!1523 (_2!453 lt!8599)) (currentBit!1518 (_2!453 lt!8599))) (bvadd (bitIndex!0 (size!196 (buf!526 thiss!1486)) (currentByte!1523 thiss!1486) (currentBit!1518 thiss!1486)) nBits!460)))))

(declare-fun res!7467 () Bool)

(assert (=> start!1418 (=> (not res!7467) (not e!4123))))

(assert (=> start!1418 (= res!7467 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!196 srcBuffer!6))))))))

(assert (=> start!1418 e!4123))

(assert (=> start!1418 true))

(assert (=> start!1418 (array_inv!191 srcBuffer!6)))

(declare-fun inv!12 (BitStream!370) Bool)

(assert (=> start!1418 (and (inv!12 thiss!1486) e!4120)))

(declare-fun b!6549 () Bool)

(assert (=> b!6549 (= e!4121 true)))

(declare-fun lt!8603 () Unit!514)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!370 array!456 array!456 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!514)

(assert (=> b!6549 (= lt!8603 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!453 lt!8599) srcBuffer!6 (_1!454 lt!8602) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (= (and start!1418 res!7467) b!6543))

(assert (= (and b!6543 res!7468) b!6545))

(assert (= (and b!6545 res!7465) b!6541))

(assert (= (and b!6541 res!7464) b!6548))

(assert (= (and b!6548 res!7471) b!6547))

(assert (= (and b!6547 res!7466) b!6544))

(assert (= (and b!6544 (not res!7470)) b!6542))

(assert (= (and b!6542 (not res!7469)) b!6549))

(assert (= start!1418 b!6546))

(declare-fun m!8283 () Bool)

(assert (=> b!6545 m!8283))

(declare-fun m!8285 () Bool)

(assert (=> b!6545 m!8285))

(declare-fun m!8287 () Bool)

(assert (=> b!6544 m!8287))

(declare-fun m!8289 () Bool)

(assert (=> b!6544 m!8289))

(declare-fun m!8291 () Bool)

(assert (=> b!6544 m!8291))

(declare-fun m!8293 () Bool)

(assert (=> b!6544 m!8293))

(declare-fun m!8295 () Bool)

(assert (=> b!6544 m!8295))

(declare-fun m!8297 () Bool)

(assert (=> b!6544 m!8297))

(declare-fun m!8299 () Bool)

(assert (=> start!1418 m!8299))

(declare-fun m!8301 () Bool)

(assert (=> start!1418 m!8301))

(declare-fun m!8303 () Bool)

(assert (=> b!6543 m!8303))

(declare-fun m!8305 () Bool)

(assert (=> b!6542 m!8305))

(declare-fun m!8307 () Bool)

(assert (=> b!6548 m!8307))

(declare-fun m!8309 () Bool)

(assert (=> b!6548 m!8309))

(declare-fun m!8311 () Bool)

(assert (=> b!6547 m!8311))

(declare-fun m!8313 () Bool)

(assert (=> b!6549 m!8313))

(declare-fun m!8315 () Bool)

(assert (=> b!6546 m!8315))

(push 1)

(assert (not b!6549))

(assert (not b!6547))

(assert (not b!6542))

(assert (not b!6545))

(assert (not b!6546))

(assert (not b!6543))

(assert (not b!6544))

(assert (not b!6548))

(assert (not start!1418))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

