; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2688 () Bool)

(assert start!2688)

(declare-fun b!12940 () Bool)

(declare-fun e!7844 () Bool)

(assert (=> b!12940 (= e!7844 true)))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!703 0))(
  ( (array!704 (arr!735 (Array (_ BitVec 32) (_ BitVec 8))) (size!306 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!572 0))(
  ( (BitStream!573 (buf!657 array!703) (currentByte!1741 (_ BitVec 32)) (currentBit!1736 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1095 0))(
  ( (Unit!1096) )
))
(declare-datatypes ((tuple2!1522 0))(
  ( (tuple2!1523 (_1!816 Unit!1095) (_2!816 BitStream!572)) )
))
(declare-fun lt!20726 () tuple2!1522)

(declare-fun srcBuffer!6 () array!703)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun lt!20722 () Unit!1095)

(declare-datatypes ((tuple2!1524 0))(
  ( (tuple2!1525 (_1!817 array!703) (_2!817 BitStream!572)) )
))
(declare-fun lt!20723 () tuple2!1524)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!572 array!703 array!703 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1095)

(assert (=> b!12940 (= lt!20722 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!816 lt!20726) srcBuffer!6 (_1!817 lt!20723) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!12941 () Bool)

(declare-fun e!7846 () Bool)

(assert (=> b!12941 (= e!7846 (not e!7844))))

(declare-fun res!12313 () Bool)

(assert (=> b!12941 (=> res!12313 e!7844)))

(declare-datatypes ((List!182 0))(
  ( (Nil!179) (Cons!178 (h!297 Bool) (t!932 List!182)) )
))
(declare-fun lt!20721 () List!182)

(declare-fun byteArrayBitContentToList!0 (BitStream!572 array!703 (_ BitVec 64) (_ BitVec 64)) List!182)

(assert (=> b!12941 (= res!12313 (not (= (byteArrayBitContentToList!0 (_2!816 lt!20726) (_1!817 lt!20723) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!20721)))))

(declare-datatypes ((tuple2!1526 0))(
  ( (tuple2!1527 (_1!818 BitStream!572) (_2!818 BitStream!572)) )
))
(declare-fun lt!20725 () tuple2!1526)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!572 BitStream!572 (_ BitVec 64)) List!182)

(assert (=> b!12941 (= lt!20721 (bitStreamReadBitsIntoList!0 (_2!816 lt!20726) (_1!818 lt!20725) nBits!460))))

(declare-fun readBits!0 (BitStream!572 (_ BitVec 64)) tuple2!1524)

(assert (=> b!12941 (= lt!20723 (readBits!0 (_1!818 lt!20725) nBits!460))))

(declare-fun thiss!1486 () BitStream!572)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!12941 (validate_offset_bits!1 ((_ sign_extend 32) (size!306 (buf!657 (_2!816 lt!20726)))) ((_ sign_extend 32) (currentByte!1741 thiss!1486)) ((_ sign_extend 32) (currentBit!1736 thiss!1486)) nBits!460)))

(declare-fun lt!20724 () Unit!1095)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!572 array!703 (_ BitVec 64)) Unit!1095)

(assert (=> b!12941 (= lt!20724 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!657 (_2!816 lt!20726)) nBits!460))))

(declare-fun reader!0 (BitStream!572 BitStream!572) tuple2!1526)

(assert (=> b!12941 (= lt!20725 (reader!0 thiss!1486 (_2!816 lt!20726)))))

(declare-fun b!12942 () Bool)

(declare-fun e!7843 () Bool)

(declare-fun array_inv!295 (array!703) Bool)

(assert (=> b!12942 (= e!7843 (array_inv!295 (buf!657 thiss!1486)))))

(declare-fun b!12943 () Bool)

(declare-fun res!12318 () Bool)

(assert (=> b!12943 (=> (not res!12318) (not e!7846))))

(assert (=> b!12943 (= res!12318 (= (size!306 (buf!657 thiss!1486)) (size!306 (buf!657 (_2!816 lt!20726)))))))

(declare-fun b!12944 () Bool)

(declare-fun res!12316 () Bool)

(assert (=> b!12944 (=> res!12316 e!7844)))

(assert (=> b!12944 (= res!12316 (not (= lt!20721 (byteArrayBitContentToList!0 (_2!816 lt!20726) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!12945 () Bool)

(declare-fun res!12312 () Bool)

(assert (=> b!12945 (=> (not res!12312) (not e!7846))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!12945 (= res!12312 (= (bitIndex!0 (size!306 (buf!657 (_2!816 lt!20726))) (currentByte!1741 (_2!816 lt!20726)) (currentBit!1736 (_2!816 lt!20726))) (bvadd (bitIndex!0 (size!306 (buf!657 thiss!1486)) (currentByte!1741 thiss!1486) (currentBit!1736 thiss!1486)) nBits!460)))))

(declare-fun b!12946 () Bool)

(declare-fun e!7847 () Bool)

(assert (=> b!12946 (= e!7847 e!7846)))

(declare-fun res!12317 () Bool)

(assert (=> b!12946 (=> (not res!12317) (not e!7846))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!12946 (= res!12317 (invariant!0 (currentBit!1736 (_2!816 lt!20726)) (currentByte!1741 (_2!816 lt!20726)) (size!306 (buf!657 (_2!816 lt!20726)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!572 array!703 (_ BitVec 64) (_ BitVec 64)) tuple2!1522)

(assert (=> b!12946 (= lt!20726 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!12947 () Bool)

(declare-fun res!12315 () Bool)

(assert (=> b!12947 (=> (not res!12315) (not e!7846))))

(declare-fun isPrefixOf!0 (BitStream!572 BitStream!572) Bool)

(assert (=> b!12947 (= res!12315 (isPrefixOf!0 thiss!1486 (_2!816 lt!20726)))))

(declare-fun b!12948 () Bool)

(declare-fun res!12319 () Bool)

(assert (=> b!12948 (=> (not res!12319) (not e!7847))))

(assert (=> b!12948 (= res!12319 (validate_offset_bits!1 ((_ sign_extend 32) (size!306 (buf!657 thiss!1486))) ((_ sign_extend 32) (currentByte!1741 thiss!1486)) ((_ sign_extend 32) (currentBit!1736 thiss!1486)) nBits!460))))

(declare-fun res!12314 () Bool)

(assert (=> start!2688 (=> (not res!12314) (not e!7847))))

(assert (=> start!2688 (= res!12314 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!306 srcBuffer!6))))))))

(assert (=> start!2688 e!7847))

(assert (=> start!2688 true))

(assert (=> start!2688 (array_inv!295 srcBuffer!6)))

(declare-fun inv!12 (BitStream!572) Bool)

(assert (=> start!2688 (and (inv!12 thiss!1486) e!7843)))

(assert (= (and start!2688 res!12314) b!12948))

(assert (= (and b!12948 res!12319) b!12946))

(assert (= (and b!12946 res!12317) b!12943))

(assert (= (and b!12943 res!12318) b!12945))

(assert (= (and b!12945 res!12312) b!12947))

(assert (= (and b!12947 res!12315) b!12941))

(assert (= (and b!12941 (not res!12313)) b!12944))

(assert (= (and b!12944 (not res!12316)) b!12940))

(assert (= start!2688 b!12942))

(declare-fun m!19525 () Bool)

(assert (=> b!12947 m!19525))

(declare-fun m!19527 () Bool)

(assert (=> b!12944 m!19527))

(declare-fun m!19529 () Bool)

(assert (=> b!12945 m!19529))

(declare-fun m!19531 () Bool)

(assert (=> b!12945 m!19531))

(declare-fun m!19533 () Bool)

(assert (=> b!12946 m!19533))

(declare-fun m!19535 () Bool)

(assert (=> b!12946 m!19535))

(declare-fun m!19537 () Bool)

(assert (=> b!12941 m!19537))

(declare-fun m!19539 () Bool)

(assert (=> b!12941 m!19539))

(declare-fun m!19541 () Bool)

(assert (=> b!12941 m!19541))

(declare-fun m!19543 () Bool)

(assert (=> b!12941 m!19543))

(declare-fun m!19545 () Bool)

(assert (=> b!12941 m!19545))

(declare-fun m!19547 () Bool)

(assert (=> b!12941 m!19547))

(declare-fun m!19549 () Bool)

(assert (=> b!12948 m!19549))

(declare-fun m!19551 () Bool)

(assert (=> b!12942 m!19551))

(declare-fun m!19553 () Bool)

(assert (=> b!12940 m!19553))

(declare-fun m!19555 () Bool)

(assert (=> start!2688 m!19555))

(declare-fun m!19557 () Bool)

(assert (=> start!2688 m!19557))

(push 1)

(assert (not b!12944))

(assert (not b!12940))

(assert (not b!12945))

(assert (not b!12946))

(assert (not b!12941))

(assert (not b!12947))

(assert (not b!12942))

(assert (not b!12948))

(assert (not start!2688))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

