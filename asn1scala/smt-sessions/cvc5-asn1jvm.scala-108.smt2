; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2690 () Bool)

(assert start!2690)

(declare-fun res!12338 () Bool)

(declare-fun e!7863 () Bool)

(assert (=> start!2690 (=> (not res!12338) (not e!7863))))

(declare-datatypes ((array!705 0))(
  ( (array!706 (arr!736 (Array (_ BitVec 32) (_ BitVec 8))) (size!307 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!705)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun from!367 () (_ BitVec 64))

(assert (=> start!2690 (= res!12338 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!307 srcBuffer!6))))))))

(assert (=> start!2690 e!7863))

(assert (=> start!2690 true))

(declare-fun array_inv!296 (array!705) Bool)

(assert (=> start!2690 (array_inv!296 srcBuffer!6)))

(declare-datatypes ((BitStream!574 0))(
  ( (BitStream!575 (buf!658 array!705) (currentByte!1742 (_ BitVec 32)) (currentBit!1737 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!574)

(declare-fun e!7865 () Bool)

(declare-fun inv!12 (BitStream!574) Bool)

(assert (=> start!2690 (and (inv!12 thiss!1486) e!7865)))

(declare-fun b!12967 () Bool)

(declare-fun res!12341 () Bool)

(assert (=> b!12967 (=> (not res!12341) (not e!7863))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!12967 (= res!12341 (validate_offset_bits!1 ((_ sign_extend 32) (size!307 (buf!658 thiss!1486))) ((_ sign_extend 32) (currentByte!1742 thiss!1486)) ((_ sign_extend 32) (currentBit!1737 thiss!1486)) nBits!460))))

(declare-fun b!12968 () Bool)

(assert (=> b!12968 (= e!7865 (array_inv!296 (buf!658 thiss!1486)))))

(declare-fun b!12969 () Bool)

(declare-fun res!12339 () Bool)

(declare-fun e!7860 () Bool)

(assert (=> b!12969 (=> res!12339 e!7860)))

(declare-datatypes ((List!183 0))(
  ( (Nil!180) (Cons!179 (h!298 Bool) (t!933 List!183)) )
))
(declare-fun lt!20740 () List!183)

(declare-datatypes ((Unit!1097 0))(
  ( (Unit!1098) )
))
(declare-datatypes ((tuple2!1528 0))(
  ( (tuple2!1529 (_1!819 Unit!1097) (_2!819 BitStream!574)) )
))
(declare-fun lt!20742 () tuple2!1528)

(declare-fun byteArrayBitContentToList!0 (BitStream!574 array!705 (_ BitVec 64) (_ BitVec 64)) List!183)

(assert (=> b!12969 (= res!12339 (not (= lt!20740 (byteArrayBitContentToList!0 (_2!819 lt!20742) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!12970 () Bool)

(declare-fun res!12340 () Bool)

(declare-fun e!7862 () Bool)

(assert (=> b!12970 (=> (not res!12340) (not e!7862))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!12970 (= res!12340 (= (bitIndex!0 (size!307 (buf!658 (_2!819 lt!20742))) (currentByte!1742 (_2!819 lt!20742)) (currentBit!1737 (_2!819 lt!20742))) (bvadd (bitIndex!0 (size!307 (buf!658 thiss!1486)) (currentByte!1742 thiss!1486) (currentBit!1737 thiss!1486)) nBits!460)))))

(declare-fun b!12971 () Bool)

(declare-fun res!12343 () Bool)

(assert (=> b!12971 (=> (not res!12343) (not e!7862))))

(declare-fun isPrefixOf!0 (BitStream!574 BitStream!574) Bool)

(assert (=> b!12971 (= res!12343 (isPrefixOf!0 thiss!1486 (_2!819 lt!20742)))))

(declare-fun b!12972 () Bool)

(assert (=> b!12972 (= e!7862 (not e!7860))))

(declare-fun res!12336 () Bool)

(assert (=> b!12972 (=> res!12336 e!7860)))

(declare-datatypes ((tuple2!1530 0))(
  ( (tuple2!1531 (_1!820 array!705) (_2!820 BitStream!574)) )
))
(declare-fun lt!20743 () tuple2!1530)

(assert (=> b!12972 (= res!12336 (not (= (byteArrayBitContentToList!0 (_2!819 lt!20742) (_1!820 lt!20743) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!20740)))))

(declare-datatypes ((tuple2!1532 0))(
  ( (tuple2!1533 (_1!821 BitStream!574) (_2!821 BitStream!574)) )
))
(declare-fun lt!20741 () tuple2!1532)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!574 BitStream!574 (_ BitVec 64)) List!183)

(assert (=> b!12972 (= lt!20740 (bitStreamReadBitsIntoList!0 (_2!819 lt!20742) (_1!821 lt!20741) nBits!460))))

(declare-fun readBits!0 (BitStream!574 (_ BitVec 64)) tuple2!1530)

(assert (=> b!12972 (= lt!20743 (readBits!0 (_1!821 lt!20741) nBits!460))))

(assert (=> b!12972 (validate_offset_bits!1 ((_ sign_extend 32) (size!307 (buf!658 (_2!819 lt!20742)))) ((_ sign_extend 32) (currentByte!1742 thiss!1486)) ((_ sign_extend 32) (currentBit!1737 thiss!1486)) nBits!460)))

(declare-fun lt!20739 () Unit!1097)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!574 array!705 (_ BitVec 64)) Unit!1097)

(assert (=> b!12972 (= lt!20739 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!658 (_2!819 lt!20742)) nBits!460))))

(declare-fun reader!0 (BitStream!574 BitStream!574) tuple2!1532)

(assert (=> b!12972 (= lt!20741 (reader!0 thiss!1486 (_2!819 lt!20742)))))

(declare-fun b!12973 () Bool)

(assert (=> b!12973 (= e!7863 e!7862)))

(declare-fun res!12342 () Bool)

(assert (=> b!12973 (=> (not res!12342) (not e!7862))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!12973 (= res!12342 (invariant!0 (currentBit!1737 (_2!819 lt!20742)) (currentByte!1742 (_2!819 lt!20742)) (size!307 (buf!658 (_2!819 lt!20742)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!574 array!705 (_ BitVec 64) (_ BitVec 64)) tuple2!1528)

(assert (=> b!12973 (= lt!20742 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!12974 () Bool)

(declare-fun res!12337 () Bool)

(assert (=> b!12974 (=> (not res!12337) (not e!7862))))

(assert (=> b!12974 (= res!12337 (= (size!307 (buf!658 thiss!1486)) (size!307 (buf!658 (_2!819 lt!20742)))))))

(declare-fun b!12975 () Bool)

(assert (=> b!12975 (= e!7860 true)))

(declare-fun lt!20744 () Unit!1097)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!574 array!705 array!705 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1097)

(assert (=> b!12975 (= lt!20744 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!819 lt!20742) srcBuffer!6 (_1!820 lt!20743) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (= (and start!2690 res!12338) b!12967))

(assert (= (and b!12967 res!12341) b!12973))

(assert (= (and b!12973 res!12342) b!12974))

(assert (= (and b!12974 res!12337) b!12970))

(assert (= (and b!12970 res!12340) b!12971))

(assert (= (and b!12971 res!12343) b!12972))

(assert (= (and b!12972 (not res!12336)) b!12969))

(assert (= (and b!12969 (not res!12339)) b!12975))

(assert (= start!2690 b!12968))

(declare-fun m!19559 () Bool)

(assert (=> b!12968 m!19559))

(declare-fun m!19561 () Bool)

(assert (=> b!12972 m!19561))

(declare-fun m!19563 () Bool)

(assert (=> b!12972 m!19563))

(declare-fun m!19565 () Bool)

(assert (=> b!12972 m!19565))

(declare-fun m!19567 () Bool)

(assert (=> b!12972 m!19567))

(declare-fun m!19569 () Bool)

(assert (=> b!12972 m!19569))

(declare-fun m!19571 () Bool)

(assert (=> b!12972 m!19571))

(declare-fun m!19573 () Bool)

(assert (=> b!12971 m!19573))

(declare-fun m!19575 () Bool)

(assert (=> b!12975 m!19575))

(declare-fun m!19577 () Bool)

(assert (=> b!12973 m!19577))

(declare-fun m!19579 () Bool)

(assert (=> b!12973 m!19579))

(declare-fun m!19581 () Bool)

(assert (=> b!12970 m!19581))

(declare-fun m!19583 () Bool)

(assert (=> b!12970 m!19583))

(declare-fun m!19585 () Bool)

(assert (=> b!12967 m!19585))

(declare-fun m!19587 () Bool)

(assert (=> start!2690 m!19587))

(declare-fun m!19589 () Bool)

(assert (=> start!2690 m!19589))

(declare-fun m!19591 () Bool)

(assert (=> b!12969 m!19591))

(push 1)

(assert (not b!12970))

(assert (not b!12968))

(assert (not b!12969))

(assert (not b!12967))

(assert (not b!12973))

(assert (not b!12972))

(assert (not start!2690))

(assert (not b!12975))

(assert (not b!12971))

(check-sat)

