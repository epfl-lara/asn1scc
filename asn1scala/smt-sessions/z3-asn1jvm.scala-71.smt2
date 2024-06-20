; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1420 () Bool)

(assert start!1420)

(declare-fun b!6568 () Bool)

(declare-fun e!4140 () Bool)

(declare-datatypes ((array!458 0))(
  ( (array!459 (arr!596 (Array (_ BitVec 32) (_ BitVec 8))) (size!197 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!372 0))(
  ( (BitStream!373 (buf!527 array!458) (currentByte!1524 (_ BitVec 32)) (currentBit!1519 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!372)

(declare-fun array_inv!192 (array!458) Bool)

(assert (=> b!6568 (= e!4140 (array_inv!192 (buf!527 thiss!1486)))))

(declare-fun res!7492 () Bool)

(declare-fun e!4139 () Bool)

(assert (=> start!1420 (=> (not res!7492) (not e!4139))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!458)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!1420 (= res!7492 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!197 srcBuffer!6))))))))

(assert (=> start!1420 e!4139))

(assert (=> start!1420 true))

(assert (=> start!1420 (array_inv!192 srcBuffer!6)))

(declare-fun inv!12 (BitStream!372) Bool)

(assert (=> start!1420 (and (inv!12 thiss!1486) e!4140)))

(declare-fun b!6569 () Bool)

(declare-fun res!7489 () Bool)

(declare-fun e!4137 () Bool)

(assert (=> b!6569 (=> (not res!7489) (not e!4137))))

(declare-datatypes ((Unit!516 0))(
  ( (Unit!517) )
))
(declare-datatypes ((tuple2!862 0))(
  ( (tuple2!863 (_1!456 Unit!516) (_2!456 BitStream!372)) )
))
(declare-fun lt!8616 () tuple2!862)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!6569 (= res!7489 (= (bitIndex!0 (size!197 (buf!527 (_2!456 lt!8616))) (currentByte!1524 (_2!456 lt!8616)) (currentBit!1519 (_2!456 lt!8616))) (bvadd (bitIndex!0 (size!197 (buf!527 thiss!1486)) (currentByte!1524 thiss!1486) (currentBit!1519 thiss!1486)) nBits!460)))))

(declare-fun b!6570 () Bool)

(declare-fun res!7490 () Bool)

(assert (=> b!6570 (=> (not res!7490) (not e!4137))))

(declare-fun isPrefixOf!0 (BitStream!372 BitStream!372) Bool)

(assert (=> b!6570 (= res!7490 (isPrefixOf!0 thiss!1486 (_2!456 lt!8616)))))

(declare-fun b!6571 () Bool)

(declare-fun e!4142 () Bool)

(assert (=> b!6571 (= e!4137 (not e!4142))))

(declare-fun res!7495 () Bool)

(assert (=> b!6571 (=> res!7495 e!4142)))

(declare-datatypes ((tuple2!864 0))(
  ( (tuple2!865 (_1!457 array!458) (_2!457 BitStream!372)) )
))
(declare-fun lt!8620 () tuple2!864)

(declare-datatypes ((List!97 0))(
  ( (Nil!94) (Cons!93 (h!212 Bool) (t!847 List!97)) )
))
(declare-fun lt!8621 () List!97)

(declare-fun byteArrayBitContentToList!0 (BitStream!372 array!458 (_ BitVec 64) (_ BitVec 64)) List!97)

(assert (=> b!6571 (= res!7495 (not (= (byteArrayBitContentToList!0 (_2!456 lt!8616) (_1!457 lt!8620) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!8621)))))

(declare-datatypes ((tuple2!866 0))(
  ( (tuple2!867 (_1!458 BitStream!372) (_2!458 BitStream!372)) )
))
(declare-fun lt!8617 () tuple2!866)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!372 BitStream!372 (_ BitVec 64)) List!97)

(assert (=> b!6571 (= lt!8621 (bitStreamReadBitsIntoList!0 (_2!456 lt!8616) (_1!458 lt!8617) nBits!460))))

(declare-fun readBits!0 (BitStream!372 (_ BitVec 64)) tuple2!864)

(assert (=> b!6571 (= lt!8620 (readBits!0 (_1!458 lt!8617) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!6571 (validate_offset_bits!1 ((_ sign_extend 32) (size!197 (buf!527 (_2!456 lt!8616)))) ((_ sign_extend 32) (currentByte!1524 thiss!1486)) ((_ sign_extend 32) (currentBit!1519 thiss!1486)) nBits!460)))

(declare-fun lt!8618 () Unit!516)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!372 array!458 (_ BitVec 64)) Unit!516)

(assert (=> b!6571 (= lt!8618 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!527 (_2!456 lt!8616)) nBits!460))))

(declare-fun reader!0 (BitStream!372 BitStream!372) tuple2!866)

(assert (=> b!6571 (= lt!8617 (reader!0 thiss!1486 (_2!456 lt!8616)))))

(declare-fun b!6572 () Bool)

(assert (=> b!6572 (= e!4142 true)))

(declare-fun lt!8619 () Unit!516)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!372 array!458 array!458 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!516)

(assert (=> b!6572 (= lt!8619 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!456 lt!8616) srcBuffer!6 (_1!457 lt!8620) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!6573 () Bool)

(declare-fun res!7493 () Bool)

(assert (=> b!6573 (=> (not res!7493) (not e!4137))))

(assert (=> b!6573 (= res!7493 (= (size!197 (buf!527 thiss!1486)) (size!197 (buf!527 (_2!456 lt!8616)))))))

(declare-fun b!6574 () Bool)

(declare-fun res!7494 () Bool)

(assert (=> b!6574 (=> res!7494 e!4142)))

(assert (=> b!6574 (= res!7494 (not (= lt!8621 (byteArrayBitContentToList!0 (_2!456 lt!8616) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!6575 () Bool)

(assert (=> b!6575 (= e!4139 e!4137)))

(declare-fun res!7488 () Bool)

(assert (=> b!6575 (=> (not res!7488) (not e!4137))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!6575 (= res!7488 (invariant!0 (currentBit!1519 (_2!456 lt!8616)) (currentByte!1524 (_2!456 lt!8616)) (size!197 (buf!527 (_2!456 lt!8616)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!372 array!458 (_ BitVec 64) (_ BitVec 64)) tuple2!862)

(assert (=> b!6575 (= lt!8616 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!6576 () Bool)

(declare-fun res!7491 () Bool)

(assert (=> b!6576 (=> (not res!7491) (not e!4139))))

(assert (=> b!6576 (= res!7491 (validate_offset_bits!1 ((_ sign_extend 32) (size!197 (buf!527 thiss!1486))) ((_ sign_extend 32) (currentByte!1524 thiss!1486)) ((_ sign_extend 32) (currentBit!1519 thiss!1486)) nBits!460))))

(assert (= (and start!1420 res!7492) b!6576))

(assert (= (and b!6576 res!7491) b!6575))

(assert (= (and b!6575 res!7488) b!6573))

(assert (= (and b!6573 res!7493) b!6569))

(assert (= (and b!6569 res!7489) b!6570))

(assert (= (and b!6570 res!7490) b!6571))

(assert (= (and b!6571 (not res!7495)) b!6574))

(assert (= (and b!6574 (not res!7494)) b!6572))

(assert (= start!1420 b!6568))

(declare-fun m!8317 () Bool)

(assert (=> b!6572 m!8317))

(declare-fun m!8319 () Bool)

(assert (=> b!6575 m!8319))

(declare-fun m!8321 () Bool)

(assert (=> b!6575 m!8321))

(declare-fun m!8323 () Bool)

(assert (=> b!6568 m!8323))

(declare-fun m!8325 () Bool)

(assert (=> b!6576 m!8325))

(declare-fun m!8327 () Bool)

(assert (=> b!6570 m!8327))

(declare-fun m!8329 () Bool)

(assert (=> b!6569 m!8329))

(declare-fun m!8331 () Bool)

(assert (=> b!6569 m!8331))

(declare-fun m!8333 () Bool)

(assert (=> b!6571 m!8333))

(declare-fun m!8335 () Bool)

(assert (=> b!6571 m!8335))

(declare-fun m!8337 () Bool)

(assert (=> b!6571 m!8337))

(declare-fun m!8339 () Bool)

(assert (=> b!6571 m!8339))

(declare-fun m!8341 () Bool)

(assert (=> b!6571 m!8341))

(declare-fun m!8343 () Bool)

(assert (=> b!6571 m!8343))

(declare-fun m!8345 () Bool)

(assert (=> start!1420 m!8345))

(declare-fun m!8347 () Bool)

(assert (=> start!1420 m!8347))

(declare-fun m!8349 () Bool)

(assert (=> b!6574 m!8349))

(check-sat (not b!6576) (not b!6569) (not b!6570) (not b!6571) (not start!1420) (not b!6572) (not b!6568) (not b!6575) (not b!6574))
