; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1408 () Bool)

(assert start!1408)

(declare-fun b!6406 () Bool)

(declare-fun res!7346 () Bool)

(declare-fun e!4033 () Bool)

(assert (=> b!6406 (=> res!7346 e!4033)))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((List!91 0))(
  ( (Nil!88) (Cons!87 (h!206 Bool) (t!841 List!91)) )
))
(declare-fun lt!8512 () List!91)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-datatypes ((array!446 0))(
  ( (array!447 (arr!590 (Array (_ BitVec 32) (_ BitVec 8))) (size!191 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!360 0))(
  ( (BitStream!361 (buf!521 array!446) (currentByte!1518 (_ BitVec 32)) (currentBit!1513 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!504 0))(
  ( (Unit!505) )
))
(declare-datatypes ((tuple2!826 0))(
  ( (tuple2!827 (_1!438 Unit!504) (_2!438 BitStream!360)) )
))
(declare-fun lt!8511 () tuple2!826)

(declare-fun srcBuffer!6 () array!446)

(declare-fun byteArrayBitContentToList!0 (BitStream!360 array!446 (_ BitVec 64) (_ BitVec 64)) List!91)

(assert (=> b!6406 (= res!7346 (not (= lt!8512 (byteArrayBitContentToList!0 (_2!438 lt!8511) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!6407 () Bool)

(declare-fun e!4029 () Bool)

(declare-fun thiss!1486 () BitStream!360)

(declare-fun array_inv!186 (array!446) Bool)

(assert (=> b!6407 (= e!4029 (array_inv!186 (buf!521 thiss!1486)))))

(declare-fun b!6409 () Bool)

(declare-fun e!4034 () Bool)

(assert (=> b!6409 (= e!4034 (not e!4033))))

(declare-fun res!7345 () Bool)

(assert (=> b!6409 (=> res!7345 e!4033)))

(declare-datatypes ((tuple2!828 0))(
  ( (tuple2!829 (_1!439 array!446) (_2!439 BitStream!360)) )
))
(declare-fun lt!8509 () tuple2!828)

(assert (=> b!6409 (= res!7345 (not (= (byteArrayBitContentToList!0 (_2!438 lt!8511) (_1!439 lt!8509) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!8512)))))

(declare-datatypes ((tuple2!830 0))(
  ( (tuple2!831 (_1!440 BitStream!360) (_2!440 BitStream!360)) )
))
(declare-fun lt!8513 () tuple2!830)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!360 BitStream!360 (_ BitVec 64)) List!91)

(assert (=> b!6409 (= lt!8512 (bitStreamReadBitsIntoList!0 (_2!438 lt!8511) (_1!440 lt!8513) nBits!460))))

(declare-fun readBits!0 (BitStream!360 (_ BitVec 64)) tuple2!828)

(assert (=> b!6409 (= lt!8509 (readBits!0 (_1!440 lt!8513) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!6409 (validate_offset_bits!1 ((_ sign_extend 32) (size!191 (buf!521 (_2!438 lt!8511)))) ((_ sign_extend 32) (currentByte!1518 thiss!1486)) ((_ sign_extend 32) (currentBit!1513 thiss!1486)) nBits!460)))

(declare-fun lt!8510 () Unit!504)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!360 array!446 (_ BitVec 64)) Unit!504)

(assert (=> b!6409 (= lt!8510 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!521 (_2!438 lt!8511)) nBits!460))))

(declare-fun reader!0 (BitStream!360 BitStream!360) tuple2!830)

(assert (=> b!6409 (= lt!8513 (reader!0 thiss!1486 (_2!438 lt!8511)))))

(declare-fun b!6410 () Bool)

(declare-fun res!7347 () Bool)

(assert (=> b!6410 (=> (not res!7347) (not e!4034))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!6410 (= res!7347 (= (bitIndex!0 (size!191 (buf!521 (_2!438 lt!8511))) (currentByte!1518 (_2!438 lt!8511)) (currentBit!1513 (_2!438 lt!8511))) (bvadd (bitIndex!0 (size!191 (buf!521 thiss!1486)) (currentByte!1518 thiss!1486) (currentBit!1513 thiss!1486)) nBits!460)))))

(declare-fun b!6411 () Bool)

(declare-fun res!7348 () Bool)

(assert (=> b!6411 (=> (not res!7348) (not e!4034))))

(declare-fun isPrefixOf!0 (BitStream!360 BitStream!360) Bool)

(assert (=> b!6411 (= res!7348 (isPrefixOf!0 thiss!1486 (_2!438 lt!8511)))))

(declare-fun b!6412 () Bool)

(declare-fun e!4030 () Bool)

(assert (=> b!6412 (= e!4030 e!4034)))

(declare-fun res!7350 () Bool)

(assert (=> b!6412 (=> (not res!7350) (not e!4034))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!6412 (= res!7350 (invariant!0 (currentBit!1513 (_2!438 lt!8511)) (currentByte!1518 (_2!438 lt!8511)) (size!191 (buf!521 (_2!438 lt!8511)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!360 array!446 (_ BitVec 64) (_ BitVec 64)) tuple2!826)

(assert (=> b!6412 (= lt!8511 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!6413 () Bool)

(declare-fun res!7349 () Bool)

(assert (=> b!6413 (=> (not res!7349) (not e!4034))))

(assert (=> b!6413 (= res!7349 (= (size!191 (buf!521 thiss!1486)) (size!191 (buf!521 (_2!438 lt!8511)))))))

(declare-fun b!6414 () Bool)

(assert (=> b!6414 (= e!4033 true)))

(declare-fun lt!8508 () Unit!504)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!360 array!446 array!446 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!504)

(assert (=> b!6414 (= lt!8508 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!438 lt!8511) srcBuffer!6 (_1!439 lt!8509) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!6408 () Bool)

(declare-fun res!7344 () Bool)

(assert (=> b!6408 (=> (not res!7344) (not e!4030))))

(assert (=> b!6408 (= res!7344 (validate_offset_bits!1 ((_ sign_extend 32) (size!191 (buf!521 thiss!1486))) ((_ sign_extend 32) (currentByte!1518 thiss!1486)) ((_ sign_extend 32) (currentBit!1513 thiss!1486)) nBits!460))))

(declare-fun res!7351 () Bool)

(assert (=> start!1408 (=> (not res!7351) (not e!4030))))

(assert (=> start!1408 (= res!7351 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!191 srcBuffer!6))))))))

(assert (=> start!1408 e!4030))

(assert (=> start!1408 true))

(assert (=> start!1408 (array_inv!186 srcBuffer!6)))

(declare-fun inv!12 (BitStream!360) Bool)

(assert (=> start!1408 (and (inv!12 thiss!1486) e!4029)))

(assert (= (and start!1408 res!7351) b!6408))

(assert (= (and b!6408 res!7344) b!6412))

(assert (= (and b!6412 res!7350) b!6413))

(assert (= (and b!6413 res!7349) b!6410))

(assert (= (and b!6410 res!7347) b!6411))

(assert (= (and b!6411 res!7348) b!6409))

(assert (= (and b!6409 (not res!7345)) b!6406))

(assert (= (and b!6406 (not res!7346)) b!6414))

(assert (= start!1408 b!6407))

(declare-fun m!8113 () Bool)

(assert (=> b!6406 m!8113))

(declare-fun m!8115 () Bool)

(assert (=> b!6412 m!8115))

(declare-fun m!8117 () Bool)

(assert (=> b!6412 m!8117))

(declare-fun m!8119 () Bool)

(assert (=> start!1408 m!8119))

(declare-fun m!8121 () Bool)

(assert (=> start!1408 m!8121))

(declare-fun m!8123 () Bool)

(assert (=> b!6410 m!8123))

(declare-fun m!8125 () Bool)

(assert (=> b!6410 m!8125))

(declare-fun m!8127 () Bool)

(assert (=> b!6408 m!8127))

(declare-fun m!8129 () Bool)

(assert (=> b!6411 m!8129))

(declare-fun m!8131 () Bool)

(assert (=> b!6407 m!8131))

(declare-fun m!8133 () Bool)

(assert (=> b!6414 m!8133))

(declare-fun m!8135 () Bool)

(assert (=> b!6409 m!8135))

(declare-fun m!8137 () Bool)

(assert (=> b!6409 m!8137))

(declare-fun m!8139 () Bool)

(assert (=> b!6409 m!8139))

(declare-fun m!8141 () Bool)

(assert (=> b!6409 m!8141))

(declare-fun m!8143 () Bool)

(assert (=> b!6409 m!8143))

(declare-fun m!8145 () Bool)

(assert (=> b!6409 m!8145))

(check-sat (not b!6411) (not b!6409) (not b!6408) (not b!6406) (not b!6414) (not b!6410) (not start!1408) (not b!6407) (not b!6412))
