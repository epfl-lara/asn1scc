; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1224 () Bool)

(assert start!1224)

(declare-fun b!5536 () Bool)

(declare-fun e!3576 () Bool)

(declare-fun e!3578 () Bool)

(assert (=> b!5536 (= e!3576 e!3578)))

(declare-fun res!6702 () Bool)

(assert (=> b!5536 (=> (not res!6702) (not e!3578))))

(declare-datatypes ((array!418 0))(
  ( (array!419 (arr!573 (Array (_ BitVec 32) (_ BitVec 8))) (size!180 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!338 0))(
  ( (BitStream!339 (buf!504 array!418) (currentByte!1489 (_ BitVec 32)) (currentBit!1484 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!434 0))(
  ( (Unit!435) )
))
(declare-datatypes ((tuple2!736 0))(
  ( (tuple2!737 (_1!387 Unit!434) (_2!387 BitStream!338)) )
))
(declare-fun lt!6766 () tuple2!736)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!5536 (= res!6702 (invariant!0 (currentBit!1484 (_2!387 lt!6766)) (currentByte!1489 (_2!387 lt!6766)) (size!180 (buf!504 (_2!387 lt!6766)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!418)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun thiss!1486 () BitStream!338)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!338 array!418 (_ BitVec 64) (_ BitVec 64)) tuple2!736)

(assert (=> b!5536 (= lt!6766 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!5537 () Bool)

(declare-fun res!6701 () Bool)

(assert (=> b!5537 (=> (not res!6701) (not e!3576))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!5537 (= res!6701 (validate_offset_bits!1 ((_ sign_extend 32) (size!180 (buf!504 thiss!1486))) ((_ sign_extend 32) (currentByte!1489 thiss!1486)) ((_ sign_extend 32) (currentBit!1484 thiss!1486)) nBits!460))))

(declare-fun b!5538 () Bool)

(declare-fun e!3580 () Bool)

(assert (=> b!5538 (= e!3578 (not e!3580))))

(declare-fun res!6706 () Bool)

(assert (=> b!5538 (=> res!6706 e!3580)))

(declare-datatypes ((List!80 0))(
  ( (Nil!77) (Cons!76 (h!195 Bool) (t!830 List!80)) )
))
(declare-fun lt!6765 () List!80)

(declare-datatypes ((tuple2!738 0))(
  ( (tuple2!739 (_1!388 array!418) (_2!388 BitStream!338)) )
))
(declare-fun lt!6762 () tuple2!738)

(declare-fun byteArrayBitContentToList!0 (BitStream!338 array!418 (_ BitVec 64) (_ BitVec 64)) List!80)

(assert (=> b!5538 (= res!6706 (not (= (byteArrayBitContentToList!0 (_2!387 lt!6766) (_1!388 lt!6762) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!6765)))))

(declare-datatypes ((tuple2!740 0))(
  ( (tuple2!741 (_1!389 BitStream!338) (_2!389 BitStream!338)) )
))
(declare-fun lt!6767 () tuple2!740)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!338 BitStream!338 (_ BitVec 64)) List!80)

(assert (=> b!5538 (= lt!6765 (bitStreamReadBitsIntoList!0 (_2!387 lt!6766) (_1!389 lt!6767) nBits!460))))

(declare-fun readBits!0 (BitStream!338 (_ BitVec 64)) tuple2!738)

(assert (=> b!5538 (= lt!6762 (readBits!0 (_1!389 lt!6767) nBits!460))))

(assert (=> b!5538 (validate_offset_bits!1 ((_ sign_extend 32) (size!180 (buf!504 (_2!387 lt!6766)))) ((_ sign_extend 32) (currentByte!1489 thiss!1486)) ((_ sign_extend 32) (currentBit!1484 thiss!1486)) nBits!460)))

(declare-fun lt!6764 () Unit!434)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!338 array!418 (_ BitVec 64)) Unit!434)

(assert (=> b!5538 (= lt!6764 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!504 (_2!387 lt!6766)) nBits!460))))

(declare-fun reader!0 (BitStream!338 BitStream!338) tuple2!740)

(assert (=> b!5538 (= lt!6767 (reader!0 thiss!1486 (_2!387 lt!6766)))))

(declare-fun b!5539 () Bool)

(assert (=> b!5539 (= e!3580 true)))

(declare-fun lt!6763 () Unit!434)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!338 array!418 array!418 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!434)

(assert (=> b!5539 (= lt!6763 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!387 lt!6766) srcBuffer!6 (_1!388 lt!6762) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun res!6700 () Bool)

(assert (=> start!1224 (=> (not res!6700) (not e!3576))))

(assert (=> start!1224 (= res!6700 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!180 srcBuffer!6))))))))

(assert (=> start!1224 e!3576))

(assert (=> start!1224 true))

(declare-fun array_inv!175 (array!418) Bool)

(assert (=> start!1224 (array_inv!175 srcBuffer!6)))

(declare-fun e!3579 () Bool)

(declare-fun inv!12 (BitStream!338) Bool)

(assert (=> start!1224 (and (inv!12 thiss!1486) e!3579)))

(declare-fun b!5540 () Bool)

(declare-fun res!6703 () Bool)

(assert (=> b!5540 (=> (not res!6703) (not e!3578))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!5540 (= res!6703 (= (bitIndex!0 (size!180 (buf!504 (_2!387 lt!6766))) (currentByte!1489 (_2!387 lt!6766)) (currentBit!1484 (_2!387 lt!6766))) (bvadd (bitIndex!0 (size!180 (buf!504 thiss!1486)) (currentByte!1489 thiss!1486) (currentBit!1484 thiss!1486)) nBits!460)))))

(declare-fun b!5541 () Bool)

(declare-fun res!6699 () Bool)

(assert (=> b!5541 (=> res!6699 e!3580)))

(assert (=> b!5541 (= res!6699 (not (= lt!6765 (byteArrayBitContentToList!0 (_2!387 lt!6766) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!5542 () Bool)

(assert (=> b!5542 (= e!3579 (array_inv!175 (buf!504 thiss!1486)))))

(declare-fun b!5543 () Bool)

(declare-fun res!6705 () Bool)

(assert (=> b!5543 (=> (not res!6705) (not e!3578))))

(assert (=> b!5543 (= res!6705 (= (size!180 (buf!504 thiss!1486)) (size!180 (buf!504 (_2!387 lt!6766)))))))

(declare-fun b!5544 () Bool)

(declare-fun res!6704 () Bool)

(assert (=> b!5544 (=> (not res!6704) (not e!3578))))

(declare-fun isPrefixOf!0 (BitStream!338 BitStream!338) Bool)

(assert (=> b!5544 (= res!6704 (isPrefixOf!0 thiss!1486 (_2!387 lt!6766)))))

(assert (= (and start!1224 res!6700) b!5537))

(assert (= (and b!5537 res!6701) b!5536))

(assert (= (and b!5536 res!6702) b!5543))

(assert (= (and b!5543 res!6705) b!5540))

(assert (= (and b!5540 res!6703) b!5544))

(assert (= (and b!5544 res!6704) b!5538))

(assert (= (and b!5538 (not res!6706)) b!5541))

(assert (= (and b!5541 (not res!6699)) b!5539))

(assert (= start!1224 b!5542))

(declare-fun m!6761 () Bool)

(assert (=> b!5541 m!6761))

(declare-fun m!6763 () Bool)

(assert (=> b!5542 m!6763))

(declare-fun m!6765 () Bool)

(assert (=> b!5537 m!6765))

(declare-fun m!6767 () Bool)

(assert (=> b!5536 m!6767))

(declare-fun m!6769 () Bool)

(assert (=> b!5536 m!6769))

(declare-fun m!6771 () Bool)

(assert (=> start!1224 m!6771))

(declare-fun m!6773 () Bool)

(assert (=> start!1224 m!6773))

(declare-fun m!6775 () Bool)

(assert (=> b!5540 m!6775))

(declare-fun m!6777 () Bool)

(assert (=> b!5540 m!6777))

(declare-fun m!6779 () Bool)

(assert (=> b!5538 m!6779))

(declare-fun m!6781 () Bool)

(assert (=> b!5538 m!6781))

(declare-fun m!6783 () Bool)

(assert (=> b!5538 m!6783))

(declare-fun m!6785 () Bool)

(assert (=> b!5538 m!6785))

(declare-fun m!6787 () Bool)

(assert (=> b!5538 m!6787))

(declare-fun m!6789 () Bool)

(assert (=> b!5538 m!6789))

(declare-fun m!6791 () Bool)

(assert (=> b!5544 m!6791))

(declare-fun m!6793 () Bool)

(assert (=> b!5539 m!6793))

(push 1)

(assert (not b!5539))

(assert (not b!5537))

(assert (not b!5544))

(assert (not b!5542))

(assert (not b!5541))

(assert (not b!5540))

(assert (not start!1224))

(assert (not b!5538))

(assert (not b!5536))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

