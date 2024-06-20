; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1210 () Bool)

(assert start!1210)

(declare-fun b!5347 () Bool)

(declare-fun res!6533 () Bool)

(declare-fun e!3455 () Bool)

(assert (=> b!5347 (=> (not res!6533) (not e!3455))))

(declare-datatypes ((array!404 0))(
  ( (array!405 (arr!566 (Array (_ BitVec 32) (_ BitVec 8))) (size!173 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!324 0))(
  ( (BitStream!325 (buf!497 array!404) (currentByte!1482 (_ BitVec 32)) (currentBit!1477 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!324)

(declare-datatypes ((Unit!420 0))(
  ( (Unit!421) )
))
(declare-datatypes ((tuple2!694 0))(
  ( (tuple2!695 (_1!366 Unit!420) (_2!366 BitStream!324)) )
))
(declare-fun lt!6641 () tuple2!694)

(declare-fun isPrefixOf!0 (BitStream!324 BitStream!324) Bool)

(assert (=> b!5347 (= res!6533 (isPrefixOf!0 thiss!1486 (_2!366 lt!6641)))))

(declare-fun b!5348 () Bool)

(declare-fun e!3453 () Bool)

(assert (=> b!5348 (= e!3455 (not e!3453))))

(declare-fun res!6537 () Bool)

(assert (=> b!5348 (=> res!6537 e!3453)))

(declare-datatypes ((List!73 0))(
  ( (Nil!70) (Cons!69 (h!188 Bool) (t!823 List!73)) )
))
(declare-fun lt!6639 () List!73)

(declare-datatypes ((tuple2!696 0))(
  ( (tuple2!697 (_1!367 array!404) (_2!367 BitStream!324)) )
))
(declare-fun lt!6637 () tuple2!696)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun byteArrayBitContentToList!0 (BitStream!324 array!404 (_ BitVec 64) (_ BitVec 64)) List!73)

(assert (=> b!5348 (= res!6537 (not (= (byteArrayBitContentToList!0 (_2!366 lt!6641) (_1!367 lt!6637) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!6639)))))

(declare-datatypes ((tuple2!698 0))(
  ( (tuple2!699 (_1!368 BitStream!324) (_2!368 BitStream!324)) )
))
(declare-fun lt!6638 () tuple2!698)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!324 BitStream!324 (_ BitVec 64)) List!73)

(assert (=> b!5348 (= lt!6639 (bitStreamReadBitsIntoList!0 (_2!366 lt!6641) (_1!368 lt!6638) nBits!460))))

(declare-fun readBits!0 (BitStream!324 (_ BitVec 64)) tuple2!696)

(assert (=> b!5348 (= lt!6637 (readBits!0 (_1!368 lt!6638) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!5348 (validate_offset_bits!1 ((_ sign_extend 32) (size!173 (buf!497 (_2!366 lt!6641)))) ((_ sign_extend 32) (currentByte!1482 thiss!1486)) ((_ sign_extend 32) (currentBit!1477 thiss!1486)) nBits!460)))

(declare-fun lt!6636 () Unit!420)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!324 array!404 (_ BitVec 64)) Unit!420)

(assert (=> b!5348 (= lt!6636 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!497 (_2!366 lt!6641)) nBits!460))))

(declare-fun reader!0 (BitStream!324 BitStream!324) tuple2!698)

(assert (=> b!5348 (= lt!6638 (reader!0 thiss!1486 (_2!366 lt!6641)))))

(declare-fun b!5349 () Bool)

(declare-fun res!6535 () Bool)

(assert (=> b!5349 (=> res!6535 e!3453)))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!404)

(assert (=> b!5349 (= res!6535 (not (= lt!6639 (byteArrayBitContentToList!0 (_2!366 lt!6641) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!5350 () Bool)

(declare-fun res!6531 () Bool)

(assert (=> b!5350 (=> (not res!6531) (not e!3455))))

(assert (=> b!5350 (= res!6531 (= (size!173 (buf!497 thiss!1486)) (size!173 (buf!497 (_2!366 lt!6641)))))))

(declare-fun b!5351 () Bool)

(declare-fun res!6536 () Bool)

(declare-fun e!3451 () Bool)

(assert (=> b!5351 (=> (not res!6536) (not e!3451))))

(assert (=> b!5351 (= res!6536 (validate_offset_bits!1 ((_ sign_extend 32) (size!173 (buf!497 thiss!1486))) ((_ sign_extend 32) (currentByte!1482 thiss!1486)) ((_ sign_extend 32) (currentBit!1477 thiss!1486)) nBits!460))))

(declare-fun res!6538 () Bool)

(assert (=> start!1210 (=> (not res!6538) (not e!3451))))

(assert (=> start!1210 (= res!6538 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!173 srcBuffer!6))))))))

(assert (=> start!1210 e!3451))

(assert (=> start!1210 true))

(declare-fun array_inv!168 (array!404) Bool)

(assert (=> start!1210 (array_inv!168 srcBuffer!6)))

(declare-fun e!3454 () Bool)

(declare-fun inv!12 (BitStream!324) Bool)

(assert (=> start!1210 (and (inv!12 thiss!1486) e!3454)))

(declare-fun b!5352 () Bool)

(declare-fun res!6534 () Bool)

(assert (=> b!5352 (=> (not res!6534) (not e!3455))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!5352 (= res!6534 (= (bitIndex!0 (size!173 (buf!497 (_2!366 lt!6641))) (currentByte!1482 (_2!366 lt!6641)) (currentBit!1477 (_2!366 lt!6641))) (bvadd (bitIndex!0 (size!173 (buf!497 thiss!1486)) (currentByte!1482 thiss!1486) (currentBit!1477 thiss!1486)) nBits!460)))))

(declare-fun b!5353 () Bool)

(assert (=> b!5353 (= e!3454 (array_inv!168 (buf!497 thiss!1486)))))

(declare-fun b!5354 () Bool)

(assert (=> b!5354 (= e!3451 e!3455)))

(declare-fun res!6532 () Bool)

(assert (=> b!5354 (=> (not res!6532) (not e!3455))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!5354 (= res!6532 (invariant!0 (currentBit!1477 (_2!366 lt!6641)) (currentByte!1482 (_2!366 lt!6641)) (size!173 (buf!497 (_2!366 lt!6641)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!324 array!404 (_ BitVec 64) (_ BitVec 64)) tuple2!694)

(assert (=> b!5354 (= lt!6641 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!5355 () Bool)

(assert (=> b!5355 (= e!3453 (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)))))

(declare-fun lt!6640 () Unit!420)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!324 array!404 array!404 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!420)

(assert (=> b!5355 (= lt!6640 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!366 lt!6641) srcBuffer!6 (_1!367 lt!6637) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (= (and start!1210 res!6538) b!5351))

(assert (= (and b!5351 res!6536) b!5354))

(assert (= (and b!5354 res!6532) b!5350))

(assert (= (and b!5350 res!6531) b!5352))

(assert (= (and b!5352 res!6534) b!5347))

(assert (= (and b!5347 res!6533) b!5348))

(assert (= (and b!5348 (not res!6537)) b!5349))

(assert (= (and b!5349 (not res!6535)) b!5355))

(assert (= start!1210 b!5353))

(declare-fun m!6523 () Bool)

(assert (=> b!5351 m!6523))

(declare-fun m!6525 () Bool)

(assert (=> b!5353 m!6525))

(declare-fun m!6527 () Bool)

(assert (=> b!5349 m!6527))

(declare-fun m!6529 () Bool)

(assert (=> b!5348 m!6529))

(declare-fun m!6531 () Bool)

(assert (=> b!5348 m!6531))

(declare-fun m!6533 () Bool)

(assert (=> b!5348 m!6533))

(declare-fun m!6535 () Bool)

(assert (=> b!5348 m!6535))

(declare-fun m!6537 () Bool)

(assert (=> b!5348 m!6537))

(declare-fun m!6539 () Bool)

(assert (=> b!5348 m!6539))

(declare-fun m!6541 () Bool)

(assert (=> b!5352 m!6541))

(declare-fun m!6543 () Bool)

(assert (=> b!5352 m!6543))

(declare-fun m!6545 () Bool)

(assert (=> b!5347 m!6545))

(declare-fun m!6547 () Bool)

(assert (=> b!5355 m!6547))

(declare-fun m!6549 () Bool)

(assert (=> start!1210 m!6549))

(declare-fun m!6551 () Bool)

(assert (=> start!1210 m!6551))

(declare-fun m!6553 () Bool)

(assert (=> b!5354 m!6553))

(declare-fun m!6555 () Bool)

(assert (=> b!5354 m!6555))

(check-sat (not b!5351) (not b!5348) (not b!5347) (not b!5353) (not b!5349) (not b!5352) (not b!5354) (not start!1210) (not b!5355))
(check-sat)
