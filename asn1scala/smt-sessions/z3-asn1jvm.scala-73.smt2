; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1432 () Bool)

(assert start!1432)

(declare-fun b!6735 () Bool)

(declare-fun res!7641 () Bool)

(declare-fun e!4254 () Bool)

(assert (=> b!6735 (=> res!7641 e!4254)))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!470 0))(
  ( (array!471 (arr!602 (Array (_ BitVec 32) (_ BitVec 8))) (size!203 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!470)

(declare-datatypes ((BitStream!384 0))(
  ( (BitStream!385 (buf!533 array!470) (currentByte!1530 (_ BitVec 32)) (currentBit!1525 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!528 0))(
  ( (Unit!529) )
))
(declare-datatypes ((tuple2!898 0))(
  ( (tuple2!899 (_1!474 Unit!528) (_2!474 BitStream!384)) )
))
(declare-fun lt!8729 () tuple2!898)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-datatypes ((List!103 0))(
  ( (Nil!100) (Cons!99 (h!218 Bool) (t!853 List!103)) )
))
(declare-fun lt!8724 () List!103)

(declare-fun byteArrayBitContentToList!0 (BitStream!384 array!470 (_ BitVec 64) (_ BitVec 64)) List!103)

(assert (=> b!6735 (= res!7641 (not (= lt!8724 (byteArrayBitContentToList!0 (_2!474 lt!8729) srcBuffer!6 from!367 nBits!460))))))

(declare-fun res!7642 () Bool)

(declare-fun e!4255 () Bool)

(assert (=> start!1432 (=> (not res!7642) (not e!4255))))

(assert (=> start!1432 (= res!7642 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!203 srcBuffer!6))))))))

(assert (=> start!1432 e!4255))

(assert (=> start!1432 true))

(declare-fun array_inv!198 (array!470) Bool)

(assert (=> start!1432 (array_inv!198 srcBuffer!6)))

(declare-fun thiss!1486 () BitStream!384)

(declare-fun e!4251 () Bool)

(declare-fun inv!12 (BitStream!384) Bool)

(assert (=> start!1432 (and (inv!12 thiss!1486) e!4251)))

(declare-fun b!6736 () Bool)

(declare-fun res!7640 () Bool)

(assert (=> b!6736 (=> (not res!7640) (not e!4255))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!6736 (= res!7640 (validate_offset_bits!1 ((_ sign_extend 32) (size!203 (buf!533 thiss!1486))) ((_ sign_extend 32) (currentByte!1530 thiss!1486)) ((_ sign_extend 32) (currentBit!1525 thiss!1486)) nBits!460))))

(declare-fun b!6737 () Bool)

(declare-fun e!4252 () Bool)

(assert (=> b!6737 (= e!4254 e!4252)))

(declare-fun res!7643 () Bool)

(assert (=> b!6737 (=> res!7643 e!4252)))

(declare-datatypes ((tuple2!900 0))(
  ( (tuple2!901 (_1!475 array!470) (_2!475 BitStream!384)) )
))
(declare-fun lt!8727 () tuple2!900)

(declare-fun checkByteArrayBitContent!0 (BitStream!384 array!470 array!470 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!6737 (= res!7643 (not (checkByteArrayBitContent!0 (_2!474 lt!8729) srcBuffer!6 (_1!475 lt!8727) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))))

(declare-fun lt!8725 () Unit!528)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!384 array!470 array!470 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!528)

(assert (=> b!6737 (= lt!8725 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!474 lt!8729) srcBuffer!6 (_1!475 lt!8727) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!6738 () Bool)

(assert (=> b!6738 (= e!4252 (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(declare-fun b!6739 () Bool)

(declare-fun e!4253 () Bool)

(assert (=> b!6739 (= e!4255 e!4253)))

(declare-fun res!7639 () Bool)

(assert (=> b!6739 (=> (not res!7639) (not e!4253))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!6739 (= res!7639 (invariant!0 (currentBit!1525 (_2!474 lt!8729)) (currentByte!1530 (_2!474 lt!8729)) (size!203 (buf!533 (_2!474 lt!8729)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!384 array!470 (_ BitVec 64) (_ BitVec 64)) tuple2!898)

(assert (=> b!6739 (= lt!8729 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!6740 () Bool)

(declare-fun res!7638 () Bool)

(assert (=> b!6740 (=> (not res!7638) (not e!4253))))

(declare-fun isPrefixOf!0 (BitStream!384 BitStream!384) Bool)

(assert (=> b!6740 (= res!7638 (isPrefixOf!0 thiss!1486 (_2!474 lt!8729)))))

(declare-fun b!6741 () Bool)

(assert (=> b!6741 (= e!4251 (array_inv!198 (buf!533 thiss!1486)))))

(declare-fun b!6742 () Bool)

(declare-fun res!7645 () Bool)

(assert (=> b!6742 (=> (not res!7645) (not e!4253))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!6742 (= res!7645 (= (bitIndex!0 (size!203 (buf!533 (_2!474 lt!8729))) (currentByte!1530 (_2!474 lt!8729)) (currentBit!1525 (_2!474 lt!8729))) (bvadd (bitIndex!0 (size!203 (buf!533 thiss!1486)) (currentByte!1530 thiss!1486) (currentBit!1525 thiss!1486)) nBits!460)))))

(declare-fun b!6743 () Bool)

(declare-fun res!7637 () Bool)

(assert (=> b!6743 (=> (not res!7637) (not e!4253))))

(assert (=> b!6743 (= res!7637 (= (size!203 (buf!533 thiss!1486)) (size!203 (buf!533 (_2!474 lt!8729)))))))

(declare-fun b!6744 () Bool)

(assert (=> b!6744 (= e!4253 (not e!4254))))

(declare-fun res!7644 () Bool)

(assert (=> b!6744 (=> res!7644 e!4254)))

(assert (=> b!6744 (= res!7644 (not (= (byteArrayBitContentToList!0 (_2!474 lt!8729) (_1!475 lt!8727) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!8724)))))

(declare-datatypes ((tuple2!902 0))(
  ( (tuple2!903 (_1!476 BitStream!384) (_2!476 BitStream!384)) )
))
(declare-fun lt!8728 () tuple2!902)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!384 BitStream!384 (_ BitVec 64)) List!103)

(assert (=> b!6744 (= lt!8724 (bitStreamReadBitsIntoList!0 (_2!474 lt!8729) (_1!476 lt!8728) nBits!460))))

(declare-fun readBits!0 (BitStream!384 (_ BitVec 64)) tuple2!900)

(assert (=> b!6744 (= lt!8727 (readBits!0 (_1!476 lt!8728) nBits!460))))

(assert (=> b!6744 (validate_offset_bits!1 ((_ sign_extend 32) (size!203 (buf!533 (_2!474 lt!8729)))) ((_ sign_extend 32) (currentByte!1530 thiss!1486)) ((_ sign_extend 32) (currentBit!1525 thiss!1486)) nBits!460)))

(declare-fun lt!8726 () Unit!528)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!384 array!470 (_ BitVec 64)) Unit!528)

(assert (=> b!6744 (= lt!8726 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!533 (_2!474 lt!8729)) nBits!460))))

(declare-fun reader!0 (BitStream!384 BitStream!384) tuple2!902)

(assert (=> b!6744 (= lt!8728 (reader!0 thiss!1486 (_2!474 lt!8729)))))

(assert (= (and start!1432 res!7642) b!6736))

(assert (= (and b!6736 res!7640) b!6739))

(assert (= (and b!6739 res!7639) b!6743))

(assert (= (and b!6743 res!7637) b!6742))

(assert (= (and b!6742 res!7645) b!6740))

(assert (= (and b!6740 res!7638) b!6744))

(assert (= (and b!6744 (not res!7644)) b!6735))

(assert (= (and b!6735 (not res!7641)) b!6737))

(assert (= (and b!6737 (not res!7643)) b!6738))

(assert (= start!1432 b!6741))

(declare-fun m!8523 () Bool)

(assert (=> b!6742 m!8523))

(declare-fun m!8525 () Bool)

(assert (=> b!6742 m!8525))

(declare-fun m!8527 () Bool)

(assert (=> b!6736 m!8527))

(declare-fun m!8529 () Bool)

(assert (=> b!6741 m!8529))

(declare-fun m!8531 () Bool)

(assert (=> start!1432 m!8531))

(declare-fun m!8533 () Bool)

(assert (=> start!1432 m!8533))

(declare-fun m!8535 () Bool)

(assert (=> b!6744 m!8535))

(declare-fun m!8537 () Bool)

(assert (=> b!6744 m!8537))

(declare-fun m!8539 () Bool)

(assert (=> b!6744 m!8539))

(declare-fun m!8541 () Bool)

(assert (=> b!6744 m!8541))

(declare-fun m!8543 () Bool)

(assert (=> b!6744 m!8543))

(declare-fun m!8545 () Bool)

(assert (=> b!6744 m!8545))

(declare-fun m!8547 () Bool)

(assert (=> b!6735 m!8547))

(declare-fun m!8549 () Bool)

(assert (=> b!6737 m!8549))

(declare-fun m!8551 () Bool)

(assert (=> b!6737 m!8551))

(declare-fun m!8553 () Bool)

(assert (=> b!6739 m!8553))

(declare-fun m!8555 () Bool)

(assert (=> b!6739 m!8555))

(declare-fun m!8557 () Bool)

(assert (=> b!6740 m!8557))

(check-sat (not b!6742) (not b!6740) (not b!6741) (not b!6736) (not b!6735) (not start!1432) (not b!6737) (not b!6744) (not b!6739))
(check-sat)
