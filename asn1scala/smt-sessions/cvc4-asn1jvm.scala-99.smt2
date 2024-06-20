; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2358 () Bool)

(assert start!2358)

(declare-fun b!11068 () Bool)

(declare-fun e!6760 () Bool)

(assert (=> b!11068 (= e!6760 true)))

(declare-datatypes ((array!649 0))(
  ( (array!650 (arr!699 (Array (_ BitVec 32) (_ BitVec 8))) (size!279 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!524 0))(
  ( (BitStream!525 (buf!624 array!649) (currentByte!1696 (_ BitVec 32)) (currentBit!1691 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!1348 0))(
  ( (tuple2!1349 (_1!720 array!649) (_2!720 BitStream!524)) )
))
(declare-fun lt!17555 () tuple2!1348)

(declare-fun srcBuffer!6 () array!649)

(declare-datatypes ((Unit!954 0))(
  ( (Unit!955) )
))
(declare-datatypes ((tuple2!1350 0))(
  ( (tuple2!1351 (_1!721 Unit!954) (_2!721 BitStream!524)) )
))
(declare-fun lt!17556 () tuple2!1350)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun lt!17553 () Unit!954)

(declare-fun from!367 () (_ BitVec 64))

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!524 array!649 array!649 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!954)

(assert (=> b!11068 (= lt!17553 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!721 lt!17556) srcBuffer!6 (_1!720 lt!17555) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!11070 () Bool)

(declare-fun res!10905 () Bool)

(declare-fun e!6756 () Bool)

(assert (=> b!11070 (=> (not res!10905) (not e!6756))))

(declare-fun thiss!1486 () BitStream!524)

(assert (=> b!11070 (= res!10905 (= (size!279 (buf!624 thiss!1486)) (size!279 (buf!624 (_2!721 lt!17556)))))))

(declare-fun b!11071 () Bool)

(declare-fun e!6757 () Bool)

(declare-fun array_inv!271 (array!649) Bool)

(assert (=> b!11071 (= e!6757 (array_inv!271 (buf!624 thiss!1486)))))

(declare-fun b!11072 () Bool)

(declare-fun res!10908 () Bool)

(declare-fun e!6759 () Bool)

(assert (=> b!11072 (=> (not res!10908) (not e!6759))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!11072 (= res!10908 (validate_offset_bits!1 ((_ sign_extend 32) (size!279 (buf!624 thiss!1486))) ((_ sign_extend 32) (currentByte!1696 thiss!1486)) ((_ sign_extend 32) (currentBit!1691 thiss!1486)) nBits!460))))

(declare-fun b!11073 () Bool)

(assert (=> b!11073 (= e!6756 (not e!6760))))

(declare-fun res!10910 () Bool)

(assert (=> b!11073 (=> res!10910 e!6760)))

(declare-datatypes ((List!158 0))(
  ( (Nil!155) (Cons!154 (h!273 Bool) (t!908 List!158)) )
))
(declare-fun lt!17554 () List!158)

(declare-fun byteArrayBitContentToList!0 (BitStream!524 array!649 (_ BitVec 64) (_ BitVec 64)) List!158)

(assert (=> b!11073 (= res!10910 (not (= (byteArrayBitContentToList!0 (_2!721 lt!17556) (_1!720 lt!17555) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!17554)))))

(declare-datatypes ((tuple2!1352 0))(
  ( (tuple2!1353 (_1!722 BitStream!524) (_2!722 BitStream!524)) )
))
(declare-fun lt!17558 () tuple2!1352)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!524 BitStream!524 (_ BitVec 64)) List!158)

(assert (=> b!11073 (= lt!17554 (bitStreamReadBitsIntoList!0 (_2!721 lt!17556) (_1!722 lt!17558) nBits!460))))

(declare-fun readBits!0 (BitStream!524 (_ BitVec 64)) tuple2!1348)

(assert (=> b!11073 (= lt!17555 (readBits!0 (_1!722 lt!17558) nBits!460))))

(assert (=> b!11073 (validate_offset_bits!1 ((_ sign_extend 32) (size!279 (buf!624 (_2!721 lt!17556)))) ((_ sign_extend 32) (currentByte!1696 thiss!1486)) ((_ sign_extend 32) (currentBit!1691 thiss!1486)) nBits!460)))

(declare-fun lt!17557 () Unit!954)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!524 array!649 (_ BitVec 64)) Unit!954)

(assert (=> b!11073 (= lt!17557 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!624 (_2!721 lt!17556)) nBits!460))))

(declare-fun reader!0 (BitStream!524 BitStream!524) tuple2!1352)

(assert (=> b!11073 (= lt!17558 (reader!0 thiss!1486 (_2!721 lt!17556)))))

(declare-fun b!11074 () Bool)

(declare-fun res!10907 () Bool)

(assert (=> b!11074 (=> (not res!10907) (not e!6756))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!11074 (= res!10907 (= (bitIndex!0 (size!279 (buf!624 (_2!721 lt!17556))) (currentByte!1696 (_2!721 lt!17556)) (currentBit!1691 (_2!721 lt!17556))) (bvadd (bitIndex!0 (size!279 (buf!624 thiss!1486)) (currentByte!1696 thiss!1486) (currentBit!1691 thiss!1486)) nBits!460)))))

(declare-fun b!11075 () Bool)

(assert (=> b!11075 (= e!6759 e!6756)))

(declare-fun res!10906 () Bool)

(assert (=> b!11075 (=> (not res!10906) (not e!6756))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!11075 (= res!10906 (invariant!0 (currentBit!1691 (_2!721 lt!17556)) (currentByte!1696 (_2!721 lt!17556)) (size!279 (buf!624 (_2!721 lt!17556)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!524 array!649 (_ BitVec 64) (_ BitVec 64)) tuple2!1350)

(assert (=> b!11075 (= lt!17556 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!11076 () Bool)

(declare-fun res!10912 () Bool)

(assert (=> b!11076 (=> (not res!10912) (not e!6756))))

(declare-fun isPrefixOf!0 (BitStream!524 BitStream!524) Bool)

(assert (=> b!11076 (= res!10912 (isPrefixOf!0 thiss!1486 (_2!721 lt!17556)))))

(declare-fun res!10911 () Bool)

(assert (=> start!2358 (=> (not res!10911) (not e!6759))))

(assert (=> start!2358 (= res!10911 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!279 srcBuffer!6))))))))

(assert (=> start!2358 e!6759))

(assert (=> start!2358 true))

(assert (=> start!2358 (array_inv!271 srcBuffer!6)))

(declare-fun inv!12 (BitStream!524) Bool)

(assert (=> start!2358 (and (inv!12 thiss!1486) e!6757)))

(declare-fun b!11069 () Bool)

(declare-fun res!10909 () Bool)

(assert (=> b!11069 (=> res!10909 e!6760)))

(assert (=> b!11069 (= res!10909 (not (= lt!17554 (byteArrayBitContentToList!0 (_2!721 lt!17556) srcBuffer!6 from!367 nBits!460))))))

(assert (= (and start!2358 res!10911) b!11072))

(assert (= (and b!11072 res!10908) b!11075))

(assert (= (and b!11075 res!10906) b!11070))

(assert (= (and b!11070 res!10905) b!11074))

(assert (= (and b!11074 res!10907) b!11076))

(assert (= (and b!11076 res!10912) b!11073))

(assert (= (and b!11073 (not res!10910)) b!11069))

(assert (= (and b!11069 (not res!10909)) b!11068))

(assert (= start!2358 b!11071))

(declare-fun m!16195 () Bool)

(assert (=> b!11069 m!16195))

(declare-fun m!16197 () Bool)

(assert (=> b!11073 m!16197))

(declare-fun m!16199 () Bool)

(assert (=> b!11073 m!16199))

(declare-fun m!16201 () Bool)

(assert (=> b!11073 m!16201))

(declare-fun m!16203 () Bool)

(assert (=> b!11073 m!16203))

(declare-fun m!16205 () Bool)

(assert (=> b!11073 m!16205))

(declare-fun m!16207 () Bool)

(assert (=> b!11073 m!16207))

(declare-fun m!16209 () Bool)

(assert (=> b!11075 m!16209))

(declare-fun m!16211 () Bool)

(assert (=> b!11075 m!16211))

(declare-fun m!16213 () Bool)

(assert (=> b!11074 m!16213))

(declare-fun m!16215 () Bool)

(assert (=> b!11074 m!16215))

(declare-fun m!16217 () Bool)

(assert (=> start!2358 m!16217))

(declare-fun m!16219 () Bool)

(assert (=> start!2358 m!16219))

(declare-fun m!16221 () Bool)

(assert (=> b!11071 m!16221))

(declare-fun m!16223 () Bool)

(assert (=> b!11072 m!16223))

(declare-fun m!16225 () Bool)

(assert (=> b!11068 m!16225))

(declare-fun m!16227 () Bool)

(assert (=> b!11076 m!16227))

(push 1)

(assert (not b!11071))

(assert (not b!11069))

(assert (not b!11073))

(assert (not b!11074))

(assert (not b!11076))

(assert (not start!2358))

(assert (not b!11075))

(assert (not b!11068))

(assert (not b!11072))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

