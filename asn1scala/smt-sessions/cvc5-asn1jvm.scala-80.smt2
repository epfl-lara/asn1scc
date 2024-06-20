; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1556 () Bool)

(assert start!1556)

(declare-fun b!7597 () Bool)

(declare-fun e!4766 () Bool)

(declare-fun e!4764 () Bool)

(assert (=> b!7597 (= e!4766 (not e!4764))))

(declare-fun res!8348 () Bool)

(assert (=> b!7597 (=> res!8348 e!4764)))

(declare-datatypes ((array!513 0))(
  ( (array!514 (arr!625 (Array (_ BitVec 32) (_ BitVec 8))) (size!223 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!424 0))(
  ( (BitStream!425 (buf!556 array!513) (currentByte!1559 (_ BitVec 32)) (currentBit!1554 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!592 0))(
  ( (Unit!593) )
))
(declare-datatypes ((tuple2!1030 0))(
  ( (tuple2!1031 (_1!543 Unit!592) (_2!543 BitStream!424)) )
))
(declare-fun lt!9863 () tuple2!1030)

(declare-datatypes ((List!123 0))(
  ( (Nil!120) (Cons!119 (h!238 Bool) (t!873 List!123)) )
))
(declare-fun lt!9862 () List!123)

(declare-datatypes ((tuple2!1032 0))(
  ( (tuple2!1033 (_1!544 array!513) (_2!544 BitStream!424)) )
))
(declare-fun lt!9860 () tuple2!1032)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun byteArrayBitContentToList!0 (BitStream!424 array!513 (_ BitVec 64) (_ BitVec 64)) List!123)

(assert (=> b!7597 (= res!8348 (not (= (byteArrayBitContentToList!0 (_2!543 lt!9863) (_1!544 lt!9860) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!9862)))))

(declare-datatypes ((tuple2!1034 0))(
  ( (tuple2!1035 (_1!545 BitStream!424) (_2!545 BitStream!424)) )
))
(declare-fun lt!9861 () tuple2!1034)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!424 BitStream!424 (_ BitVec 64)) List!123)

(assert (=> b!7597 (= lt!9862 (bitStreamReadBitsIntoList!0 (_2!543 lt!9863) (_1!545 lt!9861) nBits!460))))

(declare-fun readBits!0 (BitStream!424 (_ BitVec 64)) tuple2!1032)

(assert (=> b!7597 (= lt!9860 (readBits!0 (_1!545 lt!9861) nBits!460))))

(declare-fun thiss!1486 () BitStream!424)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!7597 (validate_offset_bits!1 ((_ sign_extend 32) (size!223 (buf!556 (_2!543 lt!9863)))) ((_ sign_extend 32) (currentByte!1559 thiss!1486)) ((_ sign_extend 32) (currentBit!1554 thiss!1486)) nBits!460)))

(declare-fun lt!9858 () Unit!592)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!424 array!513 (_ BitVec 64)) Unit!592)

(assert (=> b!7597 (= lt!9858 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!556 (_2!543 lt!9863)) nBits!460))))

(declare-fun reader!0 (BitStream!424 BitStream!424) tuple2!1034)

(assert (=> b!7597 (= lt!9861 (reader!0 thiss!1486 (_2!543 lt!9863)))))

(declare-fun b!7599 () Bool)

(declare-fun res!8349 () Bool)

(assert (=> b!7599 (=> (not res!8349) (not e!4766))))

(assert (=> b!7599 (= res!8349 (= (size!223 (buf!556 thiss!1486)) (size!223 (buf!556 (_2!543 lt!9863)))))))

(declare-fun b!7600 () Bool)

(declare-fun e!4765 () Bool)

(assert (=> b!7600 (= e!4765 e!4766)))

(declare-fun res!8350 () Bool)

(assert (=> b!7600 (=> (not res!8350) (not e!4766))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!7600 (= res!8350 (invariant!0 (currentBit!1554 (_2!543 lt!9863)) (currentByte!1559 (_2!543 lt!9863)) (size!223 (buf!556 (_2!543 lt!9863)))))))

(declare-fun srcBuffer!6 () array!513)

(declare-fun from!367 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!424 array!513 (_ BitVec 64) (_ BitVec 64)) tuple2!1030)

(assert (=> b!7600 (= lt!9863 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!7601 () Bool)

(declare-fun e!4768 () Bool)

(declare-fun array_inv!218 (array!513) Bool)

(assert (=> b!7601 (= e!4768 (array_inv!218 (buf!556 thiss!1486)))))

(declare-fun b!7602 () Bool)

(assert (=> b!7602 (= e!4764 true)))

(declare-fun lt!9859 () Unit!592)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!424 array!513 array!513 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!592)

(assert (=> b!7602 (= lt!9859 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!543 lt!9863) srcBuffer!6 (_1!544 lt!9860) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!7603 () Bool)

(declare-fun res!8345 () Bool)

(assert (=> b!7603 (=> (not res!8345) (not e!4766))))

(declare-fun isPrefixOf!0 (BitStream!424 BitStream!424) Bool)

(assert (=> b!7603 (= res!8345 (isPrefixOf!0 thiss!1486 (_2!543 lt!9863)))))

(declare-fun b!7604 () Bool)

(declare-fun res!8347 () Bool)

(assert (=> b!7604 (=> res!8347 e!4764)))

(assert (=> b!7604 (= res!8347 (not (= lt!9862 (byteArrayBitContentToList!0 (_2!543 lt!9863) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!7605 () Bool)

(declare-fun res!8343 () Bool)

(assert (=> b!7605 (=> (not res!8343) (not e!4765))))

(assert (=> b!7605 (= res!8343 (validate_offset_bits!1 ((_ sign_extend 32) (size!223 (buf!556 thiss!1486))) ((_ sign_extend 32) (currentByte!1559 thiss!1486)) ((_ sign_extend 32) (currentBit!1554 thiss!1486)) nBits!460))))

(declare-fun res!8346 () Bool)

(assert (=> start!1556 (=> (not res!8346) (not e!4765))))

(assert (=> start!1556 (= res!8346 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!223 srcBuffer!6))))))))

(assert (=> start!1556 e!4765))

(assert (=> start!1556 true))

(assert (=> start!1556 (array_inv!218 srcBuffer!6)))

(declare-fun inv!12 (BitStream!424) Bool)

(assert (=> start!1556 (and (inv!12 thiss!1486) e!4768)))

(declare-fun b!7598 () Bool)

(declare-fun res!8344 () Bool)

(assert (=> b!7598 (=> (not res!8344) (not e!4766))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!7598 (= res!8344 (= (bitIndex!0 (size!223 (buf!556 (_2!543 lt!9863))) (currentByte!1559 (_2!543 lt!9863)) (currentBit!1554 (_2!543 lt!9863))) (bvadd (bitIndex!0 (size!223 (buf!556 thiss!1486)) (currentByte!1559 thiss!1486) (currentBit!1554 thiss!1486)) nBits!460)))))

(assert (= (and start!1556 res!8346) b!7605))

(assert (= (and b!7605 res!8343) b!7600))

(assert (= (and b!7600 res!8350) b!7599))

(assert (= (and b!7599 res!8349) b!7598))

(assert (= (and b!7598 res!8344) b!7603))

(assert (= (and b!7603 res!8345) b!7597))

(assert (= (and b!7597 (not res!8348)) b!7604))

(assert (= (and b!7604 (not res!8347)) b!7602))

(assert (= start!1556 b!7601))

(declare-fun m!9717 () Bool)

(assert (=> b!7603 m!9717))

(declare-fun m!9719 () Bool)

(assert (=> b!7601 m!9719))

(declare-fun m!9721 () Bool)

(assert (=> b!7605 m!9721))

(declare-fun m!9723 () Bool)

(assert (=> b!7604 m!9723))

(declare-fun m!9725 () Bool)

(assert (=> b!7598 m!9725))

(declare-fun m!9727 () Bool)

(assert (=> b!7598 m!9727))

(declare-fun m!9729 () Bool)

(assert (=> start!1556 m!9729))

(declare-fun m!9731 () Bool)

(assert (=> start!1556 m!9731))

(declare-fun m!9733 () Bool)

(assert (=> b!7600 m!9733))

(declare-fun m!9735 () Bool)

(assert (=> b!7600 m!9735))

(declare-fun m!9737 () Bool)

(assert (=> b!7602 m!9737))

(declare-fun m!9739 () Bool)

(assert (=> b!7597 m!9739))

(declare-fun m!9741 () Bool)

(assert (=> b!7597 m!9741))

(declare-fun m!9743 () Bool)

(assert (=> b!7597 m!9743))

(declare-fun m!9745 () Bool)

(assert (=> b!7597 m!9745))

(declare-fun m!9747 () Bool)

(assert (=> b!7597 m!9747))

(declare-fun m!9749 () Bool)

(assert (=> b!7597 m!9749))

(push 1)

(assert (not b!7603))

(assert (not b!7601))

(assert (not b!7600))

(assert (not b!7602))

(assert (not b!7598))

(assert (not b!7605))

(assert (not start!1556))

(assert (not b!7597))

(assert (not b!7604))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

