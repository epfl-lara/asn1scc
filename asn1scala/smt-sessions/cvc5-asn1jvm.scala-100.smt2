; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2360 () Bool)

(assert start!2360)

(declare-fun b!11095 () Bool)

(declare-fun res!10929 () Bool)

(declare-fun e!6775 () Bool)

(assert (=> b!11095 (=> (not res!10929) (not e!6775))))

(declare-datatypes ((array!651 0))(
  ( (array!652 (arr!700 (Array (_ BitVec 32) (_ BitVec 8))) (size!280 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!526 0))(
  ( (BitStream!527 (buf!625 array!651) (currentByte!1697 (_ BitVec 32)) (currentBit!1692 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!526)

(declare-datatypes ((Unit!956 0))(
  ( (Unit!957) )
))
(declare-datatypes ((tuple2!1354 0))(
  ( (tuple2!1355 (_1!723 Unit!956) (_2!723 BitStream!526)) )
))
(declare-fun lt!17575 () tuple2!1354)

(assert (=> b!11095 (= res!10929 (= (size!280 (buf!625 thiss!1486)) (size!280 (buf!625 (_2!723 lt!17575)))))))

(declare-fun b!11096 () Bool)

(declare-fun e!6779 () Bool)

(assert (=> b!11096 (= e!6779 e!6775)))

(declare-fun res!10933 () Bool)

(assert (=> b!11096 (=> (not res!10933) (not e!6775))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!11096 (= res!10933 (invariant!0 (currentBit!1692 (_2!723 lt!17575)) (currentByte!1697 (_2!723 lt!17575)) (size!280 (buf!625 (_2!723 lt!17575)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!651)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!526 array!651 (_ BitVec 64) (_ BitVec 64)) tuple2!1354)

(assert (=> b!11096 (= lt!17575 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun res!10932 () Bool)

(assert (=> start!2360 (=> (not res!10932) (not e!6779))))

(assert (=> start!2360 (= res!10932 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!280 srcBuffer!6))))))))

(assert (=> start!2360 e!6779))

(assert (=> start!2360 true))

(declare-fun array_inv!272 (array!651) Bool)

(assert (=> start!2360 (array_inv!272 srcBuffer!6)))

(declare-fun e!6777 () Bool)

(declare-fun inv!12 (BitStream!526) Bool)

(assert (=> start!2360 (and (inv!12 thiss!1486) e!6777)))

(declare-fun b!11097 () Bool)

(declare-fun res!10931 () Bool)

(assert (=> b!11097 (=> (not res!10931) (not e!6775))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!11097 (= res!10931 (= (bitIndex!0 (size!280 (buf!625 (_2!723 lt!17575))) (currentByte!1697 (_2!723 lt!17575)) (currentBit!1692 (_2!723 lt!17575))) (bvadd (bitIndex!0 (size!280 (buf!625 thiss!1486)) (currentByte!1697 thiss!1486) (currentBit!1692 thiss!1486)) nBits!460)))))

(declare-fun b!11098 () Bool)

(declare-fun res!10934 () Bool)

(declare-fun e!6776 () Bool)

(assert (=> b!11098 (=> res!10934 e!6776)))

(declare-datatypes ((List!159 0))(
  ( (Nil!156) (Cons!155 (h!274 Bool) (t!909 List!159)) )
))
(declare-fun lt!17571 () List!159)

(declare-fun byteArrayBitContentToList!0 (BitStream!526 array!651 (_ BitVec 64) (_ BitVec 64)) List!159)

(assert (=> b!11098 (= res!10934 (not (= lt!17571 (byteArrayBitContentToList!0 (_2!723 lt!17575) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!11099 () Bool)

(assert (=> b!11099 (= e!6775 (not e!6776))))

(declare-fun res!10935 () Bool)

(assert (=> b!11099 (=> res!10935 e!6776)))

(declare-datatypes ((tuple2!1356 0))(
  ( (tuple2!1357 (_1!724 array!651) (_2!724 BitStream!526)) )
))
(declare-fun lt!17576 () tuple2!1356)

(assert (=> b!11099 (= res!10935 (not (= (byteArrayBitContentToList!0 (_2!723 lt!17575) (_1!724 lt!17576) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!17571)))))

(declare-datatypes ((tuple2!1358 0))(
  ( (tuple2!1359 (_1!725 BitStream!526) (_2!725 BitStream!526)) )
))
(declare-fun lt!17572 () tuple2!1358)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!526 BitStream!526 (_ BitVec 64)) List!159)

(assert (=> b!11099 (= lt!17571 (bitStreamReadBitsIntoList!0 (_2!723 lt!17575) (_1!725 lt!17572) nBits!460))))

(declare-fun readBits!0 (BitStream!526 (_ BitVec 64)) tuple2!1356)

(assert (=> b!11099 (= lt!17576 (readBits!0 (_1!725 lt!17572) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!11099 (validate_offset_bits!1 ((_ sign_extend 32) (size!280 (buf!625 (_2!723 lt!17575)))) ((_ sign_extend 32) (currentByte!1697 thiss!1486)) ((_ sign_extend 32) (currentBit!1692 thiss!1486)) nBits!460)))

(declare-fun lt!17573 () Unit!956)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!526 array!651 (_ BitVec 64)) Unit!956)

(assert (=> b!11099 (= lt!17573 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!625 (_2!723 lt!17575)) nBits!460))))

(declare-fun reader!0 (BitStream!526 BitStream!526) tuple2!1358)

(assert (=> b!11099 (= lt!17572 (reader!0 thiss!1486 (_2!723 lt!17575)))))

(declare-fun b!11100 () Bool)

(declare-fun res!10936 () Bool)

(assert (=> b!11100 (=> (not res!10936) (not e!6775))))

(declare-fun isPrefixOf!0 (BitStream!526 BitStream!526) Bool)

(assert (=> b!11100 (= res!10936 (isPrefixOf!0 thiss!1486 (_2!723 lt!17575)))))

(declare-fun b!11101 () Bool)

(assert (=> b!11101 (= e!6777 (array_inv!272 (buf!625 thiss!1486)))))

(declare-fun b!11102 () Bool)

(assert (=> b!11102 (= e!6776 true)))

(declare-fun lt!17574 () Unit!956)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!526 array!651 array!651 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!956)

(assert (=> b!11102 (= lt!17574 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!723 lt!17575) srcBuffer!6 (_1!724 lt!17576) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!11103 () Bool)

(declare-fun res!10930 () Bool)

(assert (=> b!11103 (=> (not res!10930) (not e!6779))))

(assert (=> b!11103 (= res!10930 (validate_offset_bits!1 ((_ sign_extend 32) (size!280 (buf!625 thiss!1486))) ((_ sign_extend 32) (currentByte!1697 thiss!1486)) ((_ sign_extend 32) (currentBit!1692 thiss!1486)) nBits!460))))

(assert (= (and start!2360 res!10932) b!11103))

(assert (= (and b!11103 res!10930) b!11096))

(assert (= (and b!11096 res!10933) b!11095))

(assert (= (and b!11095 res!10929) b!11097))

(assert (= (and b!11097 res!10931) b!11100))

(assert (= (and b!11100 res!10936) b!11099))

(assert (= (and b!11099 (not res!10935)) b!11098))

(assert (= (and b!11098 (not res!10934)) b!11102))

(assert (= start!2360 b!11101))

(declare-fun m!16229 () Bool)

(assert (=> b!11101 m!16229))

(declare-fun m!16231 () Bool)

(assert (=> b!11102 m!16231))

(declare-fun m!16233 () Bool)

(assert (=> b!11099 m!16233))

(declare-fun m!16235 () Bool)

(assert (=> b!11099 m!16235))

(declare-fun m!16237 () Bool)

(assert (=> b!11099 m!16237))

(declare-fun m!16239 () Bool)

(assert (=> b!11099 m!16239))

(declare-fun m!16241 () Bool)

(assert (=> b!11099 m!16241))

(declare-fun m!16243 () Bool)

(assert (=> b!11099 m!16243))

(declare-fun m!16245 () Bool)

(assert (=> b!11096 m!16245))

(declare-fun m!16247 () Bool)

(assert (=> b!11096 m!16247))

(declare-fun m!16249 () Bool)

(assert (=> b!11097 m!16249))

(declare-fun m!16251 () Bool)

(assert (=> b!11097 m!16251))

(declare-fun m!16253 () Bool)

(assert (=> start!2360 m!16253))

(declare-fun m!16255 () Bool)

(assert (=> start!2360 m!16255))

(declare-fun m!16257 () Bool)

(assert (=> b!11098 m!16257))

(declare-fun m!16259 () Bool)

(assert (=> b!11103 m!16259))

(declare-fun m!16261 () Bool)

(assert (=> b!11100 m!16261))

(push 1)

(assert (not b!11096))

(assert (not b!11103))

(assert (not b!11102))

