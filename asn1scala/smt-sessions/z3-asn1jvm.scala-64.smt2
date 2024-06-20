; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1216 () Bool)

(assert start!1216)

(declare-fun b!5428 () Bool)

(declare-fun res!6605 () Bool)

(declare-fun e!3504 () Bool)

(assert (=> b!5428 (=> (not res!6605) (not e!3504))))

(declare-datatypes ((array!410 0))(
  ( (array!411 (arr!569 (Array (_ BitVec 32) (_ BitVec 8))) (size!176 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!330 0))(
  ( (BitStream!331 (buf!500 array!410) (currentByte!1485 (_ BitVec 32)) (currentBit!1480 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!426 0))(
  ( (Unit!427) )
))
(declare-datatypes ((tuple2!712 0))(
  ( (tuple2!713 (_1!375 Unit!426) (_2!375 BitStream!330)) )
))
(declare-fun lt!6695 () tuple2!712)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun thiss!1486 () BitStream!330)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!5428 (= res!6605 (= (bitIndex!0 (size!176 (buf!500 (_2!375 lt!6695))) (currentByte!1485 (_2!375 lt!6695)) (currentBit!1480 (_2!375 lt!6695))) (bvadd (bitIndex!0 (size!176 (buf!500 thiss!1486)) (currentByte!1485 thiss!1486) (currentBit!1480 thiss!1486)) nBits!460)))))

(declare-fun res!6604 () Bool)

(declare-fun e!3509 () Bool)

(assert (=> start!1216 (=> (not res!6604) (not e!3509))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!410)

(assert (=> start!1216 (= res!6604 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!176 srcBuffer!6))))))))

(assert (=> start!1216 e!3509))

(assert (=> start!1216 true))

(declare-fun array_inv!171 (array!410) Bool)

(assert (=> start!1216 (array_inv!171 srcBuffer!6)))

(declare-fun e!3508 () Bool)

(declare-fun inv!12 (BitStream!330) Bool)

(assert (=> start!1216 (and (inv!12 thiss!1486) e!3508)))

(declare-fun b!5429 () Bool)

(declare-fun res!6610 () Bool)

(assert (=> b!5429 (=> (not res!6610) (not e!3504))))

(declare-fun isPrefixOf!0 (BitStream!330 BitStream!330) Bool)

(assert (=> b!5429 (= res!6610 (isPrefixOf!0 thiss!1486 (_2!375 lt!6695)))))

(declare-fun b!5430 () Bool)

(declare-fun res!6603 () Bool)

(assert (=> b!5430 (=> (not res!6603) (not e!3504))))

(assert (=> b!5430 (= res!6603 (= (size!176 (buf!500 thiss!1486)) (size!176 (buf!500 (_2!375 lt!6695)))))))

(declare-fun b!5431 () Bool)

(assert (=> b!5431 (= e!3509 e!3504)))

(declare-fun res!6606 () Bool)

(assert (=> b!5431 (=> (not res!6606) (not e!3504))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!5431 (= res!6606 (invariant!0 (currentBit!1480 (_2!375 lt!6695)) (currentByte!1485 (_2!375 lt!6695)) (size!176 (buf!500 (_2!375 lt!6695)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!330 array!410 (_ BitVec 64) (_ BitVec 64)) tuple2!712)

(assert (=> b!5431 (= lt!6695 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!5432 () Bool)

(declare-fun res!6608 () Bool)

(declare-fun e!3507 () Bool)

(assert (=> b!5432 (=> res!6608 e!3507)))

(declare-datatypes ((List!76 0))(
  ( (Nil!73) (Cons!72 (h!191 Bool) (t!826 List!76)) )
))
(declare-fun lt!6693 () List!76)

(declare-fun byteArrayBitContentToList!0 (BitStream!330 array!410 (_ BitVec 64) (_ BitVec 64)) List!76)

(assert (=> b!5432 (= res!6608 (not (= lt!6693 (byteArrayBitContentToList!0 (_2!375 lt!6695) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!5433 () Bool)

(assert (=> b!5433 (= e!3507 true)))

(declare-datatypes ((tuple2!714 0))(
  ( (tuple2!715 (_1!376 array!410) (_2!376 BitStream!330)) )
))
(declare-fun lt!6694 () tuple2!714)

(declare-fun lt!6690 () Unit!426)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!330 array!410 array!410 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!426)

(assert (=> b!5433 (= lt!6690 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!375 lt!6695) srcBuffer!6 (_1!376 lt!6694) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!5434 () Bool)

(declare-fun res!6607 () Bool)

(assert (=> b!5434 (=> (not res!6607) (not e!3509))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!5434 (= res!6607 (validate_offset_bits!1 ((_ sign_extend 32) (size!176 (buf!500 thiss!1486))) ((_ sign_extend 32) (currentByte!1485 thiss!1486)) ((_ sign_extend 32) (currentBit!1480 thiss!1486)) nBits!460))))

(declare-fun b!5435 () Bool)

(assert (=> b!5435 (= e!3508 (array_inv!171 (buf!500 thiss!1486)))))

(declare-fun b!5436 () Bool)

(assert (=> b!5436 (= e!3504 (not e!3507))))

(declare-fun res!6609 () Bool)

(assert (=> b!5436 (=> res!6609 e!3507)))

(assert (=> b!5436 (= res!6609 (not (= (byteArrayBitContentToList!0 (_2!375 lt!6695) (_1!376 lt!6694) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!6693)))))

(declare-datatypes ((tuple2!716 0))(
  ( (tuple2!717 (_1!377 BitStream!330) (_2!377 BitStream!330)) )
))
(declare-fun lt!6691 () tuple2!716)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!330 BitStream!330 (_ BitVec 64)) List!76)

(assert (=> b!5436 (= lt!6693 (bitStreamReadBitsIntoList!0 (_2!375 lt!6695) (_1!377 lt!6691) nBits!460))))

(declare-fun readBits!0 (BitStream!330 (_ BitVec 64)) tuple2!714)

(assert (=> b!5436 (= lt!6694 (readBits!0 (_1!377 lt!6691) nBits!460))))

(assert (=> b!5436 (validate_offset_bits!1 ((_ sign_extend 32) (size!176 (buf!500 (_2!375 lt!6695)))) ((_ sign_extend 32) (currentByte!1485 thiss!1486)) ((_ sign_extend 32) (currentBit!1480 thiss!1486)) nBits!460)))

(declare-fun lt!6692 () Unit!426)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!330 array!410 (_ BitVec 64)) Unit!426)

(assert (=> b!5436 (= lt!6692 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!500 (_2!375 lt!6695)) nBits!460))))

(declare-fun reader!0 (BitStream!330 BitStream!330) tuple2!716)

(assert (=> b!5436 (= lt!6691 (reader!0 thiss!1486 (_2!375 lt!6695)))))

(assert (= (and start!1216 res!6604) b!5434))

(assert (= (and b!5434 res!6607) b!5431))

(assert (= (and b!5431 res!6606) b!5430))

(assert (= (and b!5430 res!6603) b!5428))

(assert (= (and b!5428 res!6605) b!5429))

(assert (= (and b!5429 res!6610) b!5436))

(assert (= (and b!5436 (not res!6609)) b!5432))

(assert (= (and b!5432 (not res!6608)) b!5433))

(assert (= start!1216 b!5435))

(declare-fun m!6625 () Bool)

(assert (=> b!5428 m!6625))

(declare-fun m!6627 () Bool)

(assert (=> b!5428 m!6627))

(declare-fun m!6629 () Bool)

(assert (=> b!5434 m!6629))

(declare-fun m!6631 () Bool)

(assert (=> b!5432 m!6631))

(declare-fun m!6633 () Bool)

(assert (=> start!1216 m!6633))

(declare-fun m!6635 () Bool)

(assert (=> start!1216 m!6635))

(declare-fun m!6637 () Bool)

(assert (=> b!5435 m!6637))

(declare-fun m!6639 () Bool)

(assert (=> b!5431 m!6639))

(declare-fun m!6641 () Bool)

(assert (=> b!5431 m!6641))

(declare-fun m!6643 () Bool)

(assert (=> b!5433 m!6643))

(declare-fun m!6645 () Bool)

(assert (=> b!5436 m!6645))

(declare-fun m!6647 () Bool)

(assert (=> b!5436 m!6647))

(declare-fun m!6649 () Bool)

(assert (=> b!5436 m!6649))

(declare-fun m!6651 () Bool)

(assert (=> b!5436 m!6651))

(declare-fun m!6653 () Bool)

(assert (=> b!5436 m!6653))

(declare-fun m!6655 () Bool)

(assert (=> b!5436 m!6655))

(declare-fun m!6657 () Bool)

(assert (=> b!5429 m!6657))

(check-sat (not b!5434) (not start!1216) (not b!5435) (not b!5428) (not b!5433) (not b!5429) (not b!5432) (not b!5431) (not b!5436))
