; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1310 () Bool)

(assert start!1310)

(declare-fun b!5917 () Bool)

(declare-fun res!6978 () Bool)

(declare-fun e!3767 () Bool)

(assert (=> b!5917 (=> res!6978 e!3767)))

(declare-datatypes ((List!84 0))(
  ( (Nil!81) (Cons!80 (h!199 Bool) (t!834 List!84)) )
))
(declare-fun lt!7611 () List!84)

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!429 0))(
  ( (array!430 (arr!580 (Array (_ BitVec 32) (_ BitVec 8))) (size!184 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!346 0))(
  ( (BitStream!347 (buf!511 array!429) (currentByte!1502 (_ BitVec 32)) (currentBit!1497 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!466 0))(
  ( (Unit!467) )
))
(declare-datatypes ((tuple2!772 0))(
  ( (tuple2!773 (_1!408 Unit!466) (_2!408 BitStream!346)) )
))
(declare-fun lt!7609 () tuple2!772)

(declare-fun srcBuffer!6 () array!429)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun byteArrayBitContentToList!0 (BitStream!346 array!429 (_ BitVec 64) (_ BitVec 64)) List!84)

(assert (=> b!5917 (= res!6978 (not (= lt!7611 (byteArrayBitContentToList!0 (_2!408 lt!7609) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!5918 () Bool)

(declare-fun e!3765 () Bool)

(declare-fun e!3764 () Bool)

(assert (=> b!5918 (= e!3765 e!3764)))

(declare-fun res!6974 () Bool)

(assert (=> b!5918 (=> (not res!6974) (not e!3764))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!5918 (= res!6974 (invariant!0 (currentBit!1497 (_2!408 lt!7609)) (currentByte!1502 (_2!408 lt!7609)) (size!184 (buf!511 (_2!408 lt!7609)))))))

(declare-fun thiss!1486 () BitStream!346)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!346 array!429 (_ BitVec 64) (_ BitVec 64)) tuple2!772)

(assert (=> b!5918 (= lt!7609 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!5919 () Bool)

(assert (=> b!5919 (= e!3767 true)))

(declare-fun lt!7610 () Unit!466)

(declare-datatypes ((tuple2!774 0))(
  ( (tuple2!775 (_1!409 array!429) (_2!409 BitStream!346)) )
))
(declare-fun lt!7613 () tuple2!774)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!346 array!429 array!429 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!466)

(assert (=> b!5919 (= lt!7610 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!408 lt!7609) srcBuffer!6 (_1!409 lt!7613) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!5920 () Bool)

(declare-fun res!6979 () Bool)

(assert (=> b!5920 (=> (not res!6979) (not e!3765))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!5920 (= res!6979 (validate_offset_bits!1 ((_ sign_extend 32) (size!184 (buf!511 thiss!1486))) ((_ sign_extend 32) (currentByte!1502 thiss!1486)) ((_ sign_extend 32) (currentBit!1497 thiss!1486)) nBits!460))))

(declare-fun b!5921 () Bool)

(declare-fun e!3766 () Bool)

(declare-fun array_inv!179 (array!429) Bool)

(assert (=> b!5921 (= e!3766 (array_inv!179 (buf!511 thiss!1486)))))

(declare-fun b!5922 () Bool)

(declare-fun res!6976 () Bool)

(assert (=> b!5922 (=> (not res!6976) (not e!3764))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!5922 (= res!6976 (= (bitIndex!0 (size!184 (buf!511 (_2!408 lt!7609))) (currentByte!1502 (_2!408 lt!7609)) (currentBit!1497 (_2!408 lt!7609))) (bvadd (bitIndex!0 (size!184 (buf!511 thiss!1486)) (currentByte!1502 thiss!1486) (currentBit!1497 thiss!1486)) nBits!460)))))

(declare-fun b!5923 () Bool)

(assert (=> b!5923 (= e!3764 (not e!3767))))

(declare-fun res!6977 () Bool)

(assert (=> b!5923 (=> res!6977 e!3767)))

(assert (=> b!5923 (= res!6977 (not (= (byteArrayBitContentToList!0 (_2!408 lt!7609) (_1!409 lt!7613) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!7611)))))

(declare-datatypes ((tuple2!776 0))(
  ( (tuple2!777 (_1!410 BitStream!346) (_2!410 BitStream!346)) )
))
(declare-fun lt!7612 () tuple2!776)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!346 BitStream!346 (_ BitVec 64)) List!84)

(assert (=> b!5923 (= lt!7611 (bitStreamReadBitsIntoList!0 (_2!408 lt!7609) (_1!410 lt!7612) nBits!460))))

(declare-fun readBits!0 (BitStream!346 (_ BitVec 64)) tuple2!774)

(assert (=> b!5923 (= lt!7613 (readBits!0 (_1!410 lt!7612) nBits!460))))

(assert (=> b!5923 (validate_offset_bits!1 ((_ sign_extend 32) (size!184 (buf!511 (_2!408 lt!7609)))) ((_ sign_extend 32) (currentByte!1502 thiss!1486)) ((_ sign_extend 32) (currentBit!1497 thiss!1486)) nBits!460)))

(declare-fun lt!7608 () Unit!466)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!346 array!429 (_ BitVec 64)) Unit!466)

(assert (=> b!5923 (= lt!7608 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!511 (_2!408 lt!7609)) nBits!460))))

(declare-fun reader!0 (BitStream!346 BitStream!346) tuple2!776)

(assert (=> b!5923 (= lt!7612 (reader!0 thiss!1486 (_2!408 lt!7609)))))

(declare-fun b!5924 () Bool)

(declare-fun res!6972 () Bool)

(assert (=> b!5924 (=> (not res!6972) (not e!3764))))

(declare-fun isPrefixOf!0 (BitStream!346 BitStream!346) Bool)

(assert (=> b!5924 (= res!6972 (isPrefixOf!0 thiss!1486 (_2!408 lt!7609)))))

(declare-fun b!5925 () Bool)

(declare-fun res!6973 () Bool)

(assert (=> b!5925 (=> (not res!6973) (not e!3764))))

(assert (=> b!5925 (= res!6973 (= (size!184 (buf!511 thiss!1486)) (size!184 (buf!511 (_2!408 lt!7609)))))))

(declare-fun res!6975 () Bool)

(assert (=> start!1310 (=> (not res!6975) (not e!3765))))

(assert (=> start!1310 (= res!6975 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!184 srcBuffer!6))))))))

(assert (=> start!1310 e!3765))

(assert (=> start!1310 true))

(assert (=> start!1310 (array_inv!179 srcBuffer!6)))

(declare-fun inv!12 (BitStream!346) Bool)

(assert (=> start!1310 (and (inv!12 thiss!1486) e!3766)))

(assert (= (and start!1310 res!6975) b!5920))

(assert (= (and b!5920 res!6979) b!5918))

(assert (= (and b!5918 res!6974) b!5925))

(assert (= (and b!5925 res!6973) b!5922))

(assert (= (and b!5922 res!6976) b!5924))

(assert (= (and b!5924 res!6972) b!5923))

(assert (= (and b!5923 (not res!6977)) b!5917))

(assert (= (and b!5917 (not res!6978)) b!5919))

(assert (= start!1310 b!5921))

(declare-fun m!7383 () Bool)

(assert (=> b!5917 m!7383))

(declare-fun m!7385 () Bool)

(assert (=> b!5924 m!7385))

(declare-fun m!7387 () Bool)

(assert (=> start!1310 m!7387))

(declare-fun m!7389 () Bool)

(assert (=> start!1310 m!7389))

(declare-fun m!7391 () Bool)

(assert (=> b!5922 m!7391))

(declare-fun m!7393 () Bool)

(assert (=> b!5922 m!7393))

(declare-fun m!7395 () Bool)

(assert (=> b!5921 m!7395))

(declare-fun m!7397 () Bool)

(assert (=> b!5923 m!7397))

(declare-fun m!7399 () Bool)

(assert (=> b!5923 m!7399))

(declare-fun m!7401 () Bool)

(assert (=> b!5923 m!7401))

(declare-fun m!7403 () Bool)

(assert (=> b!5923 m!7403))

(declare-fun m!7405 () Bool)

(assert (=> b!5923 m!7405))

(declare-fun m!7407 () Bool)

(assert (=> b!5923 m!7407))

(declare-fun m!7409 () Bool)

(assert (=> b!5919 m!7409))

(declare-fun m!7411 () Bool)

(assert (=> b!5918 m!7411))

(declare-fun m!7413 () Bool)

(assert (=> b!5918 m!7413))

(declare-fun m!7415 () Bool)

(assert (=> b!5920 m!7415))

(push 1)

(assert (not b!5924))

(assert (not b!5919))

(assert (not start!1310))

(assert (not b!5921))

(assert (not b!5917))

(assert (not b!5922))

(assert (not b!5923))

(assert (not b!5920))

(assert (not b!5918))

(check-sat)

