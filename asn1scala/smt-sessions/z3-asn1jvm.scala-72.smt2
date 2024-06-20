; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1426 () Bool)

(assert start!1426)

(declare-fun b!6649 () Bool)

(declare-fun res!7564 () Bool)

(declare-fun e!4193 () Bool)

(assert (=> b!6649 (=> (not res!7564) (not e!4193))))

(declare-datatypes ((array!464 0))(
  ( (array!465 (arr!599 (Array (_ BitVec 32) (_ BitVec 8))) (size!200 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!378 0))(
  ( (BitStream!379 (buf!530 array!464) (currentByte!1527 (_ BitVec 32)) (currentBit!1522 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!378)

(declare-datatypes ((Unit!522 0))(
  ( (Unit!523) )
))
(declare-datatypes ((tuple2!880 0))(
  ( (tuple2!881 (_1!465 Unit!522) (_2!465 BitStream!378)) )
))
(declare-fun lt!8674 () tuple2!880)

(declare-fun isPrefixOf!0 (BitStream!378 BitStream!378) Bool)

(assert (=> b!6649 (= res!7564 (isPrefixOf!0 thiss!1486 (_2!465 lt!8674)))))

(declare-fun res!7567 () Bool)

(declare-fun e!4196 () Bool)

(assert (=> start!1426 (=> (not res!7567) (not e!4196))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!464)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!1426 (= res!7567 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!200 srcBuffer!6))))))))

(assert (=> start!1426 e!4196))

(assert (=> start!1426 true))

(declare-fun array_inv!195 (array!464) Bool)

(assert (=> start!1426 (array_inv!195 srcBuffer!6)))

(declare-fun e!4191 () Bool)

(declare-fun inv!12 (BitStream!378) Bool)

(assert (=> start!1426 (and (inv!12 thiss!1486) e!4191)))

(declare-fun b!6650 () Bool)

(declare-fun res!7563 () Bool)

(assert (=> b!6650 (=> (not res!7563) (not e!4193))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!6650 (= res!7563 (= (bitIndex!0 (size!200 (buf!530 (_2!465 lt!8674))) (currentByte!1527 (_2!465 lt!8674)) (currentBit!1522 (_2!465 lt!8674))) (bvadd (bitIndex!0 (size!200 (buf!530 thiss!1486)) (currentByte!1527 thiss!1486) (currentBit!1522 thiss!1486)) nBits!460)))))

(declare-fun b!6651 () Bool)

(assert (=> b!6651 (= e!4191 (array_inv!195 (buf!530 thiss!1486)))))

(declare-fun b!6652 () Bool)

(declare-fun e!4195 () Bool)

(assert (=> b!6652 (= e!4195 true)))

(declare-datatypes ((tuple2!882 0))(
  ( (tuple2!883 (_1!466 array!464) (_2!466 BitStream!378)) )
))
(declare-fun lt!8670 () tuple2!882)

(declare-fun lt!8675 () Unit!522)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!378 array!464 array!464 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!522)

(assert (=> b!6652 (= lt!8675 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!465 lt!8674) srcBuffer!6 (_1!466 lt!8670) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!6653 () Bool)

(declare-fun res!7561 () Bool)

(assert (=> b!6653 (=> (not res!7561) (not e!4196))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!6653 (= res!7561 (validate_offset_bits!1 ((_ sign_extend 32) (size!200 (buf!530 thiss!1486))) ((_ sign_extend 32) (currentByte!1527 thiss!1486)) ((_ sign_extend 32) (currentBit!1522 thiss!1486)) nBits!460))))

(declare-fun b!6654 () Bool)

(assert (=> b!6654 (= e!4196 e!4193)))

(declare-fun res!7566 () Bool)

(assert (=> b!6654 (=> (not res!7566) (not e!4193))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!6654 (= res!7566 (invariant!0 (currentBit!1522 (_2!465 lt!8674)) (currentByte!1527 (_2!465 lt!8674)) (size!200 (buf!530 (_2!465 lt!8674)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!378 array!464 (_ BitVec 64) (_ BitVec 64)) tuple2!880)

(assert (=> b!6654 (= lt!8674 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!6655 () Bool)

(declare-fun res!7565 () Bool)

(assert (=> b!6655 (=> res!7565 e!4195)))

(declare-datatypes ((List!100 0))(
  ( (Nil!97) (Cons!96 (h!215 Bool) (t!850 List!100)) )
))
(declare-fun lt!8673 () List!100)

(declare-fun byteArrayBitContentToList!0 (BitStream!378 array!464 (_ BitVec 64) (_ BitVec 64)) List!100)

(assert (=> b!6655 (= res!7565 (not (= lt!8673 (byteArrayBitContentToList!0 (_2!465 lt!8674) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!6656 () Bool)

(declare-fun res!7560 () Bool)

(assert (=> b!6656 (=> (not res!7560) (not e!4193))))

(assert (=> b!6656 (= res!7560 (= (size!200 (buf!530 thiss!1486)) (size!200 (buf!530 (_2!465 lt!8674)))))))

(declare-fun b!6657 () Bool)

(assert (=> b!6657 (= e!4193 (not e!4195))))

(declare-fun res!7562 () Bool)

(assert (=> b!6657 (=> res!7562 e!4195)))

(assert (=> b!6657 (= res!7562 (not (= (byteArrayBitContentToList!0 (_2!465 lt!8674) (_1!466 lt!8670) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!8673)))))

(declare-datatypes ((tuple2!884 0))(
  ( (tuple2!885 (_1!467 BitStream!378) (_2!467 BitStream!378)) )
))
(declare-fun lt!8672 () tuple2!884)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!378 BitStream!378 (_ BitVec 64)) List!100)

(assert (=> b!6657 (= lt!8673 (bitStreamReadBitsIntoList!0 (_2!465 lt!8674) (_1!467 lt!8672) nBits!460))))

(declare-fun readBits!0 (BitStream!378 (_ BitVec 64)) tuple2!882)

(assert (=> b!6657 (= lt!8670 (readBits!0 (_1!467 lt!8672) nBits!460))))

(assert (=> b!6657 (validate_offset_bits!1 ((_ sign_extend 32) (size!200 (buf!530 (_2!465 lt!8674)))) ((_ sign_extend 32) (currentByte!1527 thiss!1486)) ((_ sign_extend 32) (currentBit!1522 thiss!1486)) nBits!460)))

(declare-fun lt!8671 () Unit!522)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!378 array!464 (_ BitVec 64)) Unit!522)

(assert (=> b!6657 (= lt!8671 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!530 (_2!465 lt!8674)) nBits!460))))

(declare-fun reader!0 (BitStream!378 BitStream!378) tuple2!884)

(assert (=> b!6657 (= lt!8672 (reader!0 thiss!1486 (_2!465 lt!8674)))))

(assert (= (and start!1426 res!7567) b!6653))

(assert (= (and b!6653 res!7561) b!6654))

(assert (= (and b!6654 res!7566) b!6656))

(assert (= (and b!6656 res!7560) b!6650))

(assert (= (and b!6650 res!7563) b!6649))

(assert (= (and b!6649 res!7564) b!6657))

(assert (= (and b!6657 (not res!7562)) b!6655))

(assert (= (and b!6655 (not res!7565)) b!6652))

(assert (= start!1426 b!6651))

(declare-fun m!8419 () Bool)

(assert (=> b!6657 m!8419))

(declare-fun m!8421 () Bool)

(assert (=> b!6657 m!8421))

(declare-fun m!8423 () Bool)

(assert (=> b!6657 m!8423))

(declare-fun m!8425 () Bool)

(assert (=> b!6657 m!8425))

(declare-fun m!8427 () Bool)

(assert (=> b!6657 m!8427))

(declare-fun m!8429 () Bool)

(assert (=> b!6657 m!8429))

(declare-fun m!8431 () Bool)

(assert (=> b!6653 m!8431))

(declare-fun m!8433 () Bool)

(assert (=> start!1426 m!8433))

(declare-fun m!8435 () Bool)

(assert (=> start!1426 m!8435))

(declare-fun m!8437 () Bool)

(assert (=> b!6654 m!8437))

(declare-fun m!8439 () Bool)

(assert (=> b!6654 m!8439))

(declare-fun m!8441 () Bool)

(assert (=> b!6652 m!8441))

(declare-fun m!8443 () Bool)

(assert (=> b!6655 m!8443))

(declare-fun m!8445 () Bool)

(assert (=> b!6651 m!8445))

(declare-fun m!8447 () Bool)

(assert (=> b!6649 m!8447))

(declare-fun m!8449 () Bool)

(assert (=> b!6650 m!8449))

(declare-fun m!8451 () Bool)

(assert (=> b!6650 m!8451))

(check-sat (not b!6651) (not start!1426) (not b!6652) (not b!6657) (not b!6653) (not b!6654) (not b!6650) (not b!6655) (not b!6649))
