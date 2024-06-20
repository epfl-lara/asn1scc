; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1222 () Bool)

(assert start!1222)

(declare-fun b!5510 () Bool)

(declare-fun res!6677 () Bool)

(declare-fun e!3560 () Bool)

(assert (=> b!5510 (=> (not res!6677) (not e!3560))))

(declare-datatypes ((array!416 0))(
  ( (array!417 (arr!572 (Array (_ BitVec 32) (_ BitVec 8))) (size!179 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!336 0))(
  ( (BitStream!337 (buf!503 array!416) (currentByte!1488 (_ BitVec 32)) (currentBit!1483 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!336)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!5510 (= res!6677 (validate_offset_bits!1 ((_ sign_extend 32) (size!179 (buf!503 thiss!1486))) ((_ sign_extend 32) (currentByte!1488 thiss!1486)) ((_ sign_extend 32) (currentBit!1483 thiss!1486)) nBits!460))))

(declare-fun b!5511 () Bool)

(declare-fun e!3561 () Bool)

(assert (=> b!5511 (= e!3560 e!3561)))

(declare-fun res!6675 () Bool)

(assert (=> b!5511 (=> (not res!6675) (not e!3561))))

(declare-datatypes ((Unit!432 0))(
  ( (Unit!433) )
))
(declare-datatypes ((tuple2!730 0))(
  ( (tuple2!731 (_1!384 Unit!432) (_2!384 BitStream!336)) )
))
(declare-fun lt!6745 () tuple2!730)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!5511 (= res!6675 (invariant!0 (currentBit!1483 (_2!384 lt!6745)) (currentByte!1488 (_2!384 lt!6745)) (size!179 (buf!503 (_2!384 lt!6745)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!416)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!336 array!416 (_ BitVec 64) (_ BitVec 64)) tuple2!730)

(assert (=> b!5511 (= lt!6745 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!5512 () Bool)

(declare-fun res!6678 () Bool)

(assert (=> b!5512 (=> (not res!6678) (not e!3561))))

(assert (=> b!5512 (= res!6678 (= (size!179 (buf!503 thiss!1486)) (size!179 (buf!503 (_2!384 lt!6745)))))))

(declare-fun b!5513 () Bool)

(declare-fun e!3558 () Bool)

(assert (=> b!5513 (= e!3561 (not e!3558))))

(declare-fun res!6682 () Bool)

(assert (=> b!5513 (=> res!6682 e!3558)))

(declare-datatypes ((List!79 0))(
  ( (Nil!76) (Cons!75 (h!194 Bool) (t!829 List!79)) )
))
(declare-fun lt!6748 () List!79)

(declare-datatypes ((tuple2!732 0))(
  ( (tuple2!733 (_1!385 array!416) (_2!385 BitStream!336)) )
))
(declare-fun lt!6747 () tuple2!732)

(declare-fun byteArrayBitContentToList!0 (BitStream!336 array!416 (_ BitVec 64) (_ BitVec 64)) List!79)

(assert (=> b!5513 (= res!6682 (not (= (byteArrayBitContentToList!0 (_2!384 lt!6745) (_1!385 lt!6747) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!6748)))))

(declare-datatypes ((tuple2!734 0))(
  ( (tuple2!735 (_1!386 BitStream!336) (_2!386 BitStream!336)) )
))
(declare-fun lt!6744 () tuple2!734)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!336 BitStream!336 (_ BitVec 64)) List!79)

(assert (=> b!5513 (= lt!6748 (bitStreamReadBitsIntoList!0 (_2!384 lt!6745) (_1!386 lt!6744) nBits!460))))

(declare-fun readBits!0 (BitStream!336 (_ BitVec 64)) tuple2!732)

(assert (=> b!5513 (= lt!6747 (readBits!0 (_1!386 lt!6744) nBits!460))))

(assert (=> b!5513 (validate_offset_bits!1 ((_ sign_extend 32) (size!179 (buf!503 (_2!384 lt!6745)))) ((_ sign_extend 32) (currentByte!1488 thiss!1486)) ((_ sign_extend 32) (currentBit!1483 thiss!1486)) nBits!460)))

(declare-fun lt!6749 () Unit!432)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!336 array!416 (_ BitVec 64)) Unit!432)

(assert (=> b!5513 (= lt!6749 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!503 (_2!384 lt!6745)) nBits!460))))

(declare-fun reader!0 (BitStream!336 BitStream!336) tuple2!734)

(assert (=> b!5513 (= lt!6744 (reader!0 thiss!1486 (_2!384 lt!6745)))))

(declare-fun b!5514 () Bool)

(assert (=> b!5514 (= e!3558 true)))

(declare-fun lt!6746 () Unit!432)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!336 array!416 array!416 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!432)

(assert (=> b!5514 (= lt!6746 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!384 lt!6745) srcBuffer!6 (_1!385 lt!6747) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!5515 () Bool)

(declare-fun res!6679 () Bool)

(assert (=> b!5515 (=> (not res!6679) (not e!3561))))

(declare-fun isPrefixOf!0 (BitStream!336 BitStream!336) Bool)

(assert (=> b!5515 (= res!6679 (isPrefixOf!0 thiss!1486 (_2!384 lt!6745)))))

(declare-fun res!6676 () Bool)

(assert (=> start!1222 (=> (not res!6676) (not e!3560))))

(assert (=> start!1222 (= res!6676 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!179 srcBuffer!6))))))))

(assert (=> start!1222 e!3560))

(assert (=> start!1222 true))

(declare-fun array_inv!174 (array!416) Bool)

(assert (=> start!1222 (array_inv!174 srcBuffer!6)))

(declare-fun e!3563 () Bool)

(declare-fun inv!12 (BitStream!336) Bool)

(assert (=> start!1222 (and (inv!12 thiss!1486) e!3563)))

(declare-fun b!5509 () Bool)

(declare-fun res!6681 () Bool)

(assert (=> b!5509 (=> (not res!6681) (not e!3561))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!5509 (= res!6681 (= (bitIndex!0 (size!179 (buf!503 (_2!384 lt!6745))) (currentByte!1488 (_2!384 lt!6745)) (currentBit!1483 (_2!384 lt!6745))) (bvadd (bitIndex!0 (size!179 (buf!503 thiss!1486)) (currentByte!1488 thiss!1486) (currentBit!1483 thiss!1486)) nBits!460)))))

(declare-fun b!5516 () Bool)

(declare-fun res!6680 () Bool)

(assert (=> b!5516 (=> res!6680 e!3558)))

(assert (=> b!5516 (= res!6680 (not (= lt!6748 (byteArrayBitContentToList!0 (_2!384 lt!6745) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!5517 () Bool)

(assert (=> b!5517 (= e!3563 (array_inv!174 (buf!503 thiss!1486)))))

(assert (= (and start!1222 res!6676) b!5510))

(assert (= (and b!5510 res!6677) b!5511))

(assert (= (and b!5511 res!6675) b!5512))

(assert (= (and b!5512 res!6678) b!5509))

(assert (= (and b!5509 res!6681) b!5515))

(assert (= (and b!5515 res!6679) b!5513))

(assert (= (and b!5513 (not res!6682)) b!5516))

(assert (= (and b!5516 (not res!6680)) b!5514))

(assert (= start!1222 b!5517))

(declare-fun m!6727 () Bool)

(assert (=> b!5517 m!6727))

(declare-fun m!6729 () Bool)

(assert (=> b!5510 m!6729))

(declare-fun m!6731 () Bool)

(assert (=> b!5511 m!6731))

(declare-fun m!6733 () Bool)

(assert (=> b!5511 m!6733))

(declare-fun m!6735 () Bool)

(assert (=> b!5509 m!6735))

(declare-fun m!6737 () Bool)

(assert (=> b!5509 m!6737))

(declare-fun m!6739 () Bool)

(assert (=> start!1222 m!6739))

(declare-fun m!6741 () Bool)

(assert (=> start!1222 m!6741))

(declare-fun m!6743 () Bool)

(assert (=> b!5513 m!6743))

(declare-fun m!6745 () Bool)

(assert (=> b!5513 m!6745))

(declare-fun m!6747 () Bool)

(assert (=> b!5513 m!6747))

(declare-fun m!6749 () Bool)

(assert (=> b!5513 m!6749))

(declare-fun m!6751 () Bool)

(assert (=> b!5513 m!6751))

(declare-fun m!6753 () Bool)

(assert (=> b!5513 m!6753))

(declare-fun m!6755 () Bool)

(assert (=> b!5515 m!6755))

(declare-fun m!6757 () Bool)

(assert (=> b!5514 m!6757))

(declare-fun m!6759 () Bool)

(assert (=> b!5516 m!6759))

(check-sat (not b!5517) (not b!5511) (not b!5509) (not b!5514) (not b!5510) (not b!5516) (not b!5513) (not b!5515) (not start!1222))
