; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2680 () Bool)

(assert start!2680)

(declare-fun b!12832 () Bool)

(declare-fun res!12222 () Bool)

(declare-fun e!7775 () Bool)

(assert (=> b!12832 (=> (not res!12222) (not e!7775))))

(declare-fun nBits!460 () (_ BitVec 64))

(declare-datatypes ((array!695 0))(
  ( (array!696 (arr!731 (Array (_ BitVec 32) (_ BitVec 8))) (size!302 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!564 0))(
  ( (BitStream!565 (buf!653 array!695) (currentByte!1737 (_ BitVec 32)) (currentBit!1732 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1087 0))(
  ( (Unit!1088) )
))
(declare-datatypes ((tuple2!1498 0))(
  ( (tuple2!1499 (_1!804 Unit!1087) (_2!804 BitStream!564)) )
))
(declare-fun lt!20649 () tuple2!1498)

(declare-fun thiss!1486 () BitStream!564)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!12832 (= res!12222 (= (bitIndex!0 (size!302 (buf!653 (_2!804 lt!20649))) (currentByte!1737 (_2!804 lt!20649)) (currentBit!1732 (_2!804 lt!20649))) (bvadd (bitIndex!0 (size!302 (buf!653 thiss!1486)) (currentByte!1737 thiss!1486) (currentBit!1732 thiss!1486)) nBits!460)))))

(declare-fun b!12833 () Bool)

(declare-fun res!12216 () Bool)

(declare-fun e!7772 () Bool)

(assert (=> b!12833 (=> (not res!12216) (not e!7772))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!12833 (= res!12216 (validate_offset_bits!1 ((_ sign_extend 32) (size!302 (buf!653 thiss!1486))) ((_ sign_extend 32) (currentByte!1737 thiss!1486)) ((_ sign_extend 32) (currentBit!1732 thiss!1486)) nBits!460))))

(declare-fun res!12218 () Bool)

(assert (=> start!2680 (=> (not res!12218) (not e!7772))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!695)

(assert (=> start!2680 (= res!12218 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!302 srcBuffer!6))))))))

(assert (=> start!2680 e!7772))

(assert (=> start!2680 true))

(declare-fun array_inv!291 (array!695) Bool)

(assert (=> start!2680 (array_inv!291 srcBuffer!6)))

(declare-fun e!7774 () Bool)

(declare-fun inv!12 (BitStream!564) Bool)

(assert (=> start!2680 (and (inv!12 thiss!1486) e!7774)))

(declare-fun b!12834 () Bool)

(assert (=> b!12834 (= e!7774 (array_inv!291 (buf!653 thiss!1486)))))

(declare-fun b!12835 () Bool)

(declare-fun e!7773 () Bool)

(assert (=> b!12835 (= e!7775 (not e!7773))))

(declare-fun res!12217 () Bool)

(assert (=> b!12835 (=> res!12217 e!7773)))

(declare-datatypes ((tuple2!1500 0))(
  ( (tuple2!1501 (_1!805 array!695) (_2!805 BitStream!564)) )
))
(declare-fun lt!20654 () tuple2!1500)

(declare-datatypes ((List!178 0))(
  ( (Nil!175) (Cons!174 (h!293 Bool) (t!928 List!178)) )
))
(declare-fun lt!20650 () List!178)

(declare-fun byteArrayBitContentToList!0 (BitStream!564 array!695 (_ BitVec 64) (_ BitVec 64)) List!178)

(assert (=> b!12835 (= res!12217 (not (= (byteArrayBitContentToList!0 (_2!804 lt!20649) (_1!805 lt!20654) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!20650)))))

(declare-datatypes ((tuple2!1502 0))(
  ( (tuple2!1503 (_1!806 BitStream!564) (_2!806 BitStream!564)) )
))
(declare-fun lt!20651 () tuple2!1502)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!564 BitStream!564 (_ BitVec 64)) List!178)

(assert (=> b!12835 (= lt!20650 (bitStreamReadBitsIntoList!0 (_2!804 lt!20649) (_1!806 lt!20651) nBits!460))))

(declare-fun readBits!0 (BitStream!564 (_ BitVec 64)) tuple2!1500)

(assert (=> b!12835 (= lt!20654 (readBits!0 (_1!806 lt!20651) nBits!460))))

(assert (=> b!12835 (validate_offset_bits!1 ((_ sign_extend 32) (size!302 (buf!653 (_2!804 lt!20649)))) ((_ sign_extend 32) (currentByte!1737 thiss!1486)) ((_ sign_extend 32) (currentBit!1732 thiss!1486)) nBits!460)))

(declare-fun lt!20653 () Unit!1087)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!564 array!695 (_ BitVec 64)) Unit!1087)

(assert (=> b!12835 (= lt!20653 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!653 (_2!804 lt!20649)) nBits!460))))

(declare-fun reader!0 (BitStream!564 BitStream!564) tuple2!1502)

(assert (=> b!12835 (= lt!20651 (reader!0 thiss!1486 (_2!804 lt!20649)))))

(declare-fun b!12836 () Bool)

(assert (=> b!12836 (= e!7773 true)))

(declare-fun lt!20652 () Unit!1087)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!564 array!695 array!695 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1087)

(assert (=> b!12836 (= lt!20652 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!804 lt!20649) srcBuffer!6 (_1!805 lt!20654) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!12837 () Bool)

(assert (=> b!12837 (= e!7772 e!7775)))

(declare-fun res!12220 () Bool)

(assert (=> b!12837 (=> (not res!12220) (not e!7775))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!12837 (= res!12220 (invariant!0 (currentBit!1732 (_2!804 lt!20649)) (currentByte!1737 (_2!804 lt!20649)) (size!302 (buf!653 (_2!804 lt!20649)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!564 array!695 (_ BitVec 64) (_ BitVec 64)) tuple2!1498)

(assert (=> b!12837 (= lt!20649 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!12838 () Bool)

(declare-fun res!12219 () Bool)

(assert (=> b!12838 (=> (not res!12219) (not e!7775))))

(assert (=> b!12838 (= res!12219 (= (size!302 (buf!653 thiss!1486)) (size!302 (buf!653 (_2!804 lt!20649)))))))

(declare-fun b!12839 () Bool)

(declare-fun res!12221 () Bool)

(assert (=> b!12839 (=> res!12221 e!7773)))

(assert (=> b!12839 (= res!12221 (not (= lt!20650 (byteArrayBitContentToList!0 (_2!804 lt!20649) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!12840 () Bool)

(declare-fun res!12223 () Bool)

(assert (=> b!12840 (=> (not res!12223) (not e!7775))))

(declare-fun isPrefixOf!0 (BitStream!564 BitStream!564) Bool)

(assert (=> b!12840 (= res!12223 (isPrefixOf!0 thiss!1486 (_2!804 lt!20649)))))

(assert (= (and start!2680 res!12218) b!12833))

(assert (= (and b!12833 res!12216) b!12837))

(assert (= (and b!12837 res!12220) b!12838))

(assert (= (and b!12838 res!12219) b!12832))

(assert (= (and b!12832 res!12222) b!12840))

(assert (= (and b!12840 res!12223) b!12835))

(assert (= (and b!12835 (not res!12217)) b!12839))

(assert (= (and b!12839 (not res!12221)) b!12836))

(assert (= start!2680 b!12834))

(declare-fun m!19389 () Bool)

(assert (=> b!12835 m!19389))

(declare-fun m!19391 () Bool)

(assert (=> b!12835 m!19391))

(declare-fun m!19393 () Bool)

(assert (=> b!12835 m!19393))

(declare-fun m!19395 () Bool)

(assert (=> b!12835 m!19395))

(declare-fun m!19397 () Bool)

(assert (=> b!12835 m!19397))

(declare-fun m!19399 () Bool)

(assert (=> b!12835 m!19399))

(declare-fun m!19401 () Bool)

(assert (=> b!12832 m!19401))

(declare-fun m!19403 () Bool)

(assert (=> b!12832 m!19403))

(declare-fun m!19405 () Bool)

(assert (=> b!12837 m!19405))

(declare-fun m!19407 () Bool)

(assert (=> b!12837 m!19407))

(declare-fun m!19409 () Bool)

(assert (=> start!2680 m!19409))

(declare-fun m!19411 () Bool)

(assert (=> start!2680 m!19411))

(declare-fun m!19413 () Bool)

(assert (=> b!12836 m!19413))

(declare-fun m!19415 () Bool)

(assert (=> b!12834 m!19415))

(declare-fun m!19417 () Bool)

(assert (=> b!12840 m!19417))

(declare-fun m!19419 () Bool)

(assert (=> b!12839 m!19419))

(declare-fun m!19421 () Bool)

(assert (=> b!12833 m!19421))

(check-sat (not b!12834) (not start!2680) (not b!12837) (not b!12833) (not b!12836) (not b!12840) (not b!12839) (not b!12835) (not b!12832))
