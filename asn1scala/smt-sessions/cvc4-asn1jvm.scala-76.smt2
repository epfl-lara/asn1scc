; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1536 () Bool)

(assert start!1536)

(declare-fun b!7318 () Bool)

(declare-fun e!4578 () Bool)

(declare-fun e!4579 () Bool)

(assert (=> b!7318 (= e!4578 (not e!4579))))

(declare-fun res!8094 () Bool)

(assert (=> b!7318 (=> res!8094 e!4579)))

(declare-datatypes ((array!493 0))(
  ( (array!494 (arr!615 (Array (_ BitVec 32) (_ BitVec 8))) (size!213 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!404 0))(
  ( (BitStream!405 (buf!546 array!493) (currentByte!1549 (_ BitVec 32)) (currentBit!1544 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!572 0))(
  ( (Unit!573) )
))
(declare-datatypes ((tuple2!970 0))(
  ( (tuple2!971 (_1!513 Unit!572) (_2!513 BitStream!404)) )
))
(declare-fun lt!9681 () tuple2!970)

(declare-datatypes ((List!113 0))(
  ( (Nil!110) (Cons!109 (h!228 Bool) (t!863 List!113)) )
))
(declare-fun lt!9680 () List!113)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-datatypes ((tuple2!972 0))(
  ( (tuple2!973 (_1!514 array!493) (_2!514 BitStream!404)) )
))
(declare-fun lt!9678 () tuple2!972)

(declare-fun byteArrayBitContentToList!0 (BitStream!404 array!493 (_ BitVec 64) (_ BitVec 64)) List!113)

(assert (=> b!7318 (= res!8094 (not (= (byteArrayBitContentToList!0 (_2!513 lt!9681) (_1!514 lt!9678) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!9680)))))

(declare-datatypes ((tuple2!974 0))(
  ( (tuple2!975 (_1!515 BitStream!404) (_2!515 BitStream!404)) )
))
(declare-fun lt!9683 () tuple2!974)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!404 BitStream!404 (_ BitVec 64)) List!113)

(assert (=> b!7318 (= lt!9680 (bitStreamReadBitsIntoList!0 (_2!513 lt!9681) (_1!515 lt!9683) nBits!460))))

(declare-fun readBits!0 (BitStream!404 (_ BitVec 64)) tuple2!972)

(assert (=> b!7318 (= lt!9678 (readBits!0 (_1!515 lt!9683) nBits!460))))

(declare-fun thiss!1486 () BitStream!404)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!7318 (validate_offset_bits!1 ((_ sign_extend 32) (size!213 (buf!546 (_2!513 lt!9681)))) ((_ sign_extend 32) (currentByte!1549 thiss!1486)) ((_ sign_extend 32) (currentBit!1544 thiss!1486)) nBits!460)))

(declare-fun lt!9679 () Unit!572)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!404 array!493 (_ BitVec 64)) Unit!572)

(assert (=> b!7318 (= lt!9679 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!546 (_2!513 lt!9681)) nBits!460))))

(declare-fun reader!0 (BitStream!404 BitStream!404) tuple2!974)

(assert (=> b!7318 (= lt!9683 (reader!0 thiss!1486 (_2!513 lt!9681)))))

(declare-fun b!7319 () Bool)

(declare-fun e!4577 () Bool)

(declare-fun array_inv!208 (array!493) Bool)

(assert (=> b!7319 (= e!4577 (array_inv!208 (buf!546 thiss!1486)))))

(declare-fun b!7320 () Bool)

(assert (=> b!7320 (= e!4579 true)))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun lt!9682 () Unit!572)

(declare-fun srcBuffer!6 () array!493)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!404 array!493 array!493 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!572)

(assert (=> b!7320 (= lt!9682 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!513 lt!9681) srcBuffer!6 (_1!514 lt!9678) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!7321 () Bool)

(declare-fun res!8101 () Bool)

(assert (=> b!7321 (=> (not res!8101) (not e!4578))))

(assert (=> b!7321 (= res!8101 (= (size!213 (buf!546 thiss!1486)) (size!213 (buf!546 (_2!513 lt!9681)))))))

(declare-fun res!8100 () Bool)

(declare-fun e!4575 () Bool)

(assert (=> start!1536 (=> (not res!8100) (not e!4575))))

(assert (=> start!1536 (= res!8100 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!213 srcBuffer!6))))))))

(assert (=> start!1536 e!4575))

(assert (=> start!1536 true))

(assert (=> start!1536 (array_inv!208 srcBuffer!6)))

(declare-fun inv!12 (BitStream!404) Bool)

(assert (=> start!1536 (and (inv!12 thiss!1486) e!4577)))

(declare-fun b!7322 () Bool)

(declare-fun res!8096 () Bool)

(assert (=> b!7322 (=> (not res!8096) (not e!4578))))

(declare-fun isPrefixOf!0 (BitStream!404 BitStream!404) Bool)

(assert (=> b!7322 (= res!8096 (isPrefixOf!0 thiss!1486 (_2!513 lt!9681)))))

(declare-fun b!7323 () Bool)

(declare-fun res!8098 () Bool)

(assert (=> b!7323 (=> res!8098 e!4579)))

(assert (=> b!7323 (= res!8098 (not (= lt!9680 (byteArrayBitContentToList!0 (_2!513 lt!9681) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!7324 () Bool)

(assert (=> b!7324 (= e!4575 e!4578)))

(declare-fun res!8095 () Bool)

(assert (=> b!7324 (=> (not res!8095) (not e!4578))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!7324 (= res!8095 (invariant!0 (currentBit!1544 (_2!513 lt!9681)) (currentByte!1549 (_2!513 lt!9681)) (size!213 (buf!546 (_2!513 lt!9681)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!404 array!493 (_ BitVec 64) (_ BitVec 64)) tuple2!970)

(assert (=> b!7324 (= lt!9681 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!7325 () Bool)

(declare-fun res!8097 () Bool)

(assert (=> b!7325 (=> (not res!8097) (not e!4575))))

(assert (=> b!7325 (= res!8097 (validate_offset_bits!1 ((_ sign_extend 32) (size!213 (buf!546 thiss!1486))) ((_ sign_extend 32) (currentByte!1549 thiss!1486)) ((_ sign_extend 32) (currentBit!1544 thiss!1486)) nBits!460))))

(declare-fun b!7326 () Bool)

(declare-fun res!8099 () Bool)

(assert (=> b!7326 (=> (not res!8099) (not e!4578))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!7326 (= res!8099 (= (bitIndex!0 (size!213 (buf!546 (_2!513 lt!9681))) (currentByte!1549 (_2!513 lt!9681)) (currentBit!1544 (_2!513 lt!9681))) (bvadd (bitIndex!0 (size!213 (buf!546 thiss!1486)) (currentByte!1549 thiss!1486) (currentBit!1544 thiss!1486)) nBits!460)))))

(assert (= (and start!1536 res!8100) b!7325))

(assert (= (and b!7325 res!8097) b!7324))

(assert (= (and b!7324 res!8095) b!7321))

(assert (= (and b!7321 res!8101) b!7326))

(assert (= (and b!7326 res!8099) b!7322))

(assert (= (and b!7322 res!8096) b!7318))

(assert (= (and b!7318 (not res!8094)) b!7323))

(assert (= (and b!7323 (not res!8098)) b!7320))

(assert (= start!1536 b!7319))

(declare-fun m!9371 () Bool)

(assert (=> b!7323 m!9371))

(declare-fun m!9373 () Bool)

(assert (=> start!1536 m!9373))

(declare-fun m!9375 () Bool)

(assert (=> start!1536 m!9375))

(declare-fun m!9377 () Bool)

(assert (=> b!7322 m!9377))

(declare-fun m!9379 () Bool)

(assert (=> b!7318 m!9379))

(declare-fun m!9381 () Bool)

(assert (=> b!7318 m!9381))

(declare-fun m!9383 () Bool)

(assert (=> b!7318 m!9383))

(declare-fun m!9385 () Bool)

(assert (=> b!7318 m!9385))

(declare-fun m!9387 () Bool)

(assert (=> b!7318 m!9387))

(declare-fun m!9389 () Bool)

(assert (=> b!7318 m!9389))

(declare-fun m!9391 () Bool)

(assert (=> b!7320 m!9391))

(declare-fun m!9393 () Bool)

(assert (=> b!7326 m!9393))

(declare-fun m!9395 () Bool)

(assert (=> b!7326 m!9395))

(declare-fun m!9397 () Bool)

(assert (=> b!7319 m!9397))

(declare-fun m!9399 () Bool)

(assert (=> b!7325 m!9399))

(declare-fun m!9401 () Bool)

(assert (=> b!7324 m!9401))

(declare-fun m!9403 () Bool)

(assert (=> b!7324 m!9403))

(push 1)

