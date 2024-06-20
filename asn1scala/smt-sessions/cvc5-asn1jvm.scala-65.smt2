; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1220 () Bool)

(assert start!1220)

(declare-fun b!5483 () Bool)

(declare-fun e!3545 () Bool)

(declare-fun e!3540 () Bool)

(assert (=> b!5483 (= e!3545 e!3540)))

(declare-fun res!6651 () Bool)

(assert (=> b!5483 (=> (not res!6651) (not e!3540))))

(declare-datatypes ((array!414 0))(
  ( (array!415 (arr!571 (Array (_ BitVec 32) (_ BitVec 8))) (size!178 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!334 0))(
  ( (BitStream!335 (buf!502 array!414) (currentByte!1487 (_ BitVec 32)) (currentBit!1482 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!430 0))(
  ( (Unit!431) )
))
(declare-datatypes ((tuple2!724 0))(
  ( (tuple2!725 (_1!381 Unit!430) (_2!381 BitStream!334)) )
))
(declare-fun lt!6728 () tuple2!724)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!5483 (= res!6651 (invariant!0 (currentBit!1482 (_2!381 lt!6728)) (currentByte!1487 (_2!381 lt!6728)) (size!178 (buf!502 (_2!381 lt!6728)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!414)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun thiss!1486 () BitStream!334)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!334 array!414 (_ BitVec 64) (_ BitVec 64)) tuple2!724)

(assert (=> b!5483 (= lt!6728 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!5484 () Bool)

(declare-fun e!3541 () Bool)

(declare-fun array_inv!173 (array!414) Bool)

(assert (=> b!5484 (= e!3541 (array_inv!173 (buf!502 thiss!1486)))))

(declare-fun b!5485 () Bool)

(declare-fun res!6655 () Bool)

(assert (=> b!5485 (=> (not res!6655) (not e!3540))))

(assert (=> b!5485 (= res!6655 (= (size!178 (buf!502 thiss!1486)) (size!178 (buf!502 (_2!381 lt!6728)))))))

(declare-fun b!5486 () Bool)

(declare-fun res!6652 () Bool)

(declare-fun e!3542 () Bool)

(assert (=> b!5486 (=> res!6652 e!3542)))

(declare-datatypes ((List!78 0))(
  ( (Nil!75) (Cons!74 (h!193 Bool) (t!828 List!78)) )
))
(declare-fun lt!6726 () List!78)

(declare-fun byteArrayBitContentToList!0 (BitStream!334 array!414 (_ BitVec 64) (_ BitVec 64)) List!78)

(assert (=> b!5486 (= res!6652 (not (= lt!6726 (byteArrayBitContentToList!0 (_2!381 lt!6728) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!5487 () Bool)

(assert (=> b!5487 (= e!3540 (not e!3542))))

(declare-fun res!6654 () Bool)

(assert (=> b!5487 (=> res!6654 e!3542)))

(declare-datatypes ((tuple2!726 0))(
  ( (tuple2!727 (_1!382 array!414) (_2!382 BitStream!334)) )
))
(declare-fun lt!6731 () tuple2!726)

(assert (=> b!5487 (= res!6654 (not (= (byteArrayBitContentToList!0 (_2!381 lt!6728) (_1!382 lt!6731) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!6726)))))

(declare-datatypes ((tuple2!728 0))(
  ( (tuple2!729 (_1!383 BitStream!334) (_2!383 BitStream!334)) )
))
(declare-fun lt!6729 () tuple2!728)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!334 BitStream!334 (_ BitVec 64)) List!78)

(assert (=> b!5487 (= lt!6726 (bitStreamReadBitsIntoList!0 (_2!381 lt!6728) (_1!383 lt!6729) nBits!460))))

(declare-fun readBits!0 (BitStream!334 (_ BitVec 64)) tuple2!726)

(assert (=> b!5487 (= lt!6731 (readBits!0 (_1!383 lt!6729) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!5487 (validate_offset_bits!1 ((_ sign_extend 32) (size!178 (buf!502 (_2!381 lt!6728)))) ((_ sign_extend 32) (currentByte!1487 thiss!1486)) ((_ sign_extend 32) (currentBit!1482 thiss!1486)) nBits!460)))

(declare-fun lt!6730 () Unit!430)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!334 array!414 (_ BitVec 64)) Unit!430)

(assert (=> b!5487 (= lt!6730 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!502 (_2!381 lt!6728)) nBits!460))))

(declare-fun reader!0 (BitStream!334 BitStream!334) tuple2!728)

(assert (=> b!5487 (= lt!6729 (reader!0 thiss!1486 (_2!381 lt!6728)))))

(declare-fun b!5488 () Bool)

(declare-fun res!6653 () Bool)

(assert (=> b!5488 (=> (not res!6653) (not e!3540))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!5488 (= res!6653 (= (bitIndex!0 (size!178 (buf!502 (_2!381 lt!6728))) (currentByte!1487 (_2!381 lt!6728)) (currentBit!1482 (_2!381 lt!6728))) (bvadd (bitIndex!0 (size!178 (buf!502 thiss!1486)) (currentByte!1487 thiss!1486) (currentBit!1482 thiss!1486)) nBits!460)))))

(declare-fun b!5489 () Bool)

(declare-fun res!6658 () Bool)

(assert (=> b!5489 (=> (not res!6658) (not e!3545))))

(assert (=> b!5489 (= res!6658 (validate_offset_bits!1 ((_ sign_extend 32) (size!178 (buf!502 thiss!1486))) ((_ sign_extend 32) (currentByte!1487 thiss!1486)) ((_ sign_extend 32) (currentBit!1482 thiss!1486)) nBits!460))))

(declare-fun b!5490 () Bool)

(declare-fun res!6657 () Bool)

(assert (=> b!5490 (=> (not res!6657) (not e!3540))))

(declare-fun isPrefixOf!0 (BitStream!334 BitStream!334) Bool)

(assert (=> b!5490 (= res!6657 (isPrefixOf!0 thiss!1486 (_2!381 lt!6728)))))

(declare-fun res!6656 () Bool)

(assert (=> start!1220 (=> (not res!6656) (not e!3545))))

(assert (=> start!1220 (= res!6656 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!178 srcBuffer!6))))))))

(assert (=> start!1220 e!3545))

(assert (=> start!1220 true))

(assert (=> start!1220 (array_inv!173 srcBuffer!6)))

(declare-fun inv!12 (BitStream!334) Bool)

(assert (=> start!1220 (and (inv!12 thiss!1486) e!3541)))

(declare-fun b!5482 () Bool)

(assert (=> b!5482 (= e!3542 true)))

(declare-fun lt!6727 () Unit!430)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!334 array!414 array!414 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!430)

(assert (=> b!5482 (= lt!6727 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!381 lt!6728) srcBuffer!6 (_1!382 lt!6731) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (= (and start!1220 res!6656) b!5489))

(assert (= (and b!5489 res!6658) b!5483))

(assert (= (and b!5483 res!6651) b!5485))

(assert (= (and b!5485 res!6655) b!5488))

(assert (= (and b!5488 res!6653) b!5490))

(assert (= (and b!5490 res!6657) b!5487))

(assert (= (and b!5487 (not res!6654)) b!5486))

(assert (= (and b!5486 (not res!6652)) b!5482))

(assert (= start!1220 b!5484))

(declare-fun m!6693 () Bool)

(assert (=> b!5484 m!6693))

(declare-fun m!6695 () Bool)

(assert (=> b!5490 m!6695))

(declare-fun m!6697 () Bool)

(assert (=> b!5486 m!6697))

(declare-fun m!6699 () Bool)

(assert (=> b!5487 m!6699))

(declare-fun m!6701 () Bool)

(assert (=> b!5487 m!6701))

(declare-fun m!6703 () Bool)

(assert (=> b!5487 m!6703))

(declare-fun m!6705 () Bool)

(assert (=> b!5487 m!6705))

(declare-fun m!6707 () Bool)

(assert (=> b!5487 m!6707))

(declare-fun m!6709 () Bool)

(assert (=> b!5487 m!6709))

(declare-fun m!6711 () Bool)

(assert (=> b!5489 m!6711))

(declare-fun m!6713 () Bool)

(assert (=> b!5482 m!6713))

(declare-fun m!6715 () Bool)

(assert (=> b!5483 m!6715))

(declare-fun m!6717 () Bool)

(assert (=> b!5483 m!6717))

(declare-fun m!6719 () Bool)

(assert (=> b!5488 m!6719))

(declare-fun m!6721 () Bool)

(assert (=> b!5488 m!6721))

(declare-fun m!6723 () Bool)

(assert (=> start!1220 m!6723))

(declare-fun m!6725 () Bool)

(assert (=> start!1220 m!6725))

(push 1)

(assert (not b!5484))

(assert (not start!1220))

(assert (not b!5489))

(assert (not b!5487))

(assert (not b!5486))

(assert (not b!5482))

(assert (not b!5488))

(assert (not b!5490))

(assert (not b!5483))

(check-sat)

(pop 1)

