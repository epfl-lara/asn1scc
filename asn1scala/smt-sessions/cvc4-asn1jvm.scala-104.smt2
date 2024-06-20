; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2670 () Bool)

(assert start!2670)

(declare-fun res!12098 () Bool)

(declare-fun e!7682 () Bool)

(assert (=> start!2670 (=> (not res!12098) (not e!7682))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!685 0))(
  ( (array!686 (arr!726 (Array (_ BitVec 32) (_ BitVec 8))) (size!297 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!685)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!2670 (= res!12098 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!297 srcBuffer!6))))))))

(assert (=> start!2670 e!7682))

(assert (=> start!2670 true))

(declare-fun array_inv!286 (array!685) Bool)

(assert (=> start!2670 (array_inv!286 srcBuffer!6)))

(declare-datatypes ((BitStream!554 0))(
  ( (BitStream!555 (buf!648 array!685) (currentByte!1732 (_ BitVec 32)) (currentBit!1727 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!554)

(declare-fun e!7680 () Bool)

(declare-fun inv!12 (BitStream!554) Bool)

(assert (=> start!2670 (and (inv!12 thiss!1486) e!7680)))

(declare-fun b!12697 () Bool)

(declare-fun e!7681 () Bool)

(declare-fun e!7683 () Bool)

(assert (=> b!12697 (= e!7681 (not e!7683))))

(declare-fun res!12097 () Bool)

(assert (=> b!12697 (=> res!12097 e!7683)))

(declare-datatypes ((List!173 0))(
  ( (Nil!170) (Cons!169 (h!288 Bool) (t!923 List!173)) )
))
(declare-fun lt!20559 () List!173)

(declare-datatypes ((Unit!1077 0))(
  ( (Unit!1078) )
))
(declare-datatypes ((tuple2!1468 0))(
  ( (tuple2!1469 (_1!789 Unit!1077) (_2!789 BitStream!554)) )
))
(declare-fun lt!20562 () tuple2!1468)

(declare-datatypes ((tuple2!1470 0))(
  ( (tuple2!1471 (_1!790 array!685) (_2!790 BitStream!554)) )
))
(declare-fun lt!20564 () tuple2!1470)

(declare-fun byteArrayBitContentToList!0 (BitStream!554 array!685 (_ BitVec 64) (_ BitVec 64)) List!173)

(assert (=> b!12697 (= res!12097 (not (= (byteArrayBitContentToList!0 (_2!789 lt!20562) (_1!790 lt!20564) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!20559)))))

(declare-datatypes ((tuple2!1472 0))(
  ( (tuple2!1473 (_1!791 BitStream!554) (_2!791 BitStream!554)) )
))
(declare-fun lt!20560 () tuple2!1472)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!554 BitStream!554 (_ BitVec 64)) List!173)

(assert (=> b!12697 (= lt!20559 (bitStreamReadBitsIntoList!0 (_2!789 lt!20562) (_1!791 lt!20560) nBits!460))))

(declare-fun readBits!0 (BitStream!554 (_ BitVec 64)) tuple2!1470)

(assert (=> b!12697 (= lt!20564 (readBits!0 (_1!791 lt!20560) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!12697 (validate_offset_bits!1 ((_ sign_extend 32) (size!297 (buf!648 (_2!789 lt!20562)))) ((_ sign_extend 32) (currentByte!1732 thiss!1486)) ((_ sign_extend 32) (currentBit!1727 thiss!1486)) nBits!460)))

(declare-fun lt!20563 () Unit!1077)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!554 array!685 (_ BitVec 64)) Unit!1077)

(assert (=> b!12697 (= lt!20563 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!648 (_2!789 lt!20562)) nBits!460))))

(declare-fun reader!0 (BitStream!554 BitStream!554) tuple2!1472)

(assert (=> b!12697 (= lt!20560 (reader!0 thiss!1486 (_2!789 lt!20562)))))

(declare-fun b!12698 () Bool)

(assert (=> b!12698 (= e!7682 e!7681)))

(declare-fun res!12100 () Bool)

(assert (=> b!12698 (=> (not res!12100) (not e!7681))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!12698 (= res!12100 (invariant!0 (currentBit!1727 (_2!789 lt!20562)) (currentByte!1732 (_2!789 lt!20562)) (size!297 (buf!648 (_2!789 lt!20562)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!554 array!685 (_ BitVec 64) (_ BitVec 64)) tuple2!1468)

(assert (=> b!12698 (= lt!20562 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!12699 () Bool)

(declare-fun res!12101 () Bool)

(assert (=> b!12699 (=> (not res!12101) (not e!7681))))

(assert (=> b!12699 (= res!12101 (= (size!297 (buf!648 thiss!1486)) (size!297 (buf!648 (_2!789 lt!20562)))))))

(declare-fun b!12700 () Bool)

(declare-fun res!12099 () Bool)

(assert (=> b!12700 (=> (not res!12099) (not e!7682))))

(assert (=> b!12700 (= res!12099 (validate_offset_bits!1 ((_ sign_extend 32) (size!297 (buf!648 thiss!1486))) ((_ sign_extend 32) (currentByte!1732 thiss!1486)) ((_ sign_extend 32) (currentBit!1727 thiss!1486)) nBits!460))))

(declare-fun b!12701 () Bool)

(declare-fun res!12096 () Bool)

(assert (=> b!12701 (=> (not res!12096) (not e!7681))))

(declare-fun isPrefixOf!0 (BitStream!554 BitStream!554) Bool)

(assert (=> b!12701 (= res!12096 (isPrefixOf!0 thiss!1486 (_2!789 lt!20562)))))

(declare-fun b!12702 () Bool)

(declare-fun res!12102 () Bool)

(assert (=> b!12702 (=> (not res!12102) (not e!7681))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!12702 (= res!12102 (= (bitIndex!0 (size!297 (buf!648 (_2!789 lt!20562))) (currentByte!1732 (_2!789 lt!20562)) (currentBit!1727 (_2!789 lt!20562))) (bvadd (bitIndex!0 (size!297 (buf!648 thiss!1486)) (currentByte!1732 thiss!1486) (currentBit!1727 thiss!1486)) nBits!460)))))

(declare-fun b!12703 () Bool)

(assert (=> b!12703 (= e!7683 true)))

(declare-fun lt!20561 () Unit!1077)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!554 array!685 array!685 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1077)

(assert (=> b!12703 (= lt!20561 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!789 lt!20562) srcBuffer!6 (_1!790 lt!20564) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!12704 () Bool)

(declare-fun res!12103 () Bool)

(assert (=> b!12704 (=> res!12103 e!7683)))

(assert (=> b!12704 (= res!12103 (not (= lt!20559 (byteArrayBitContentToList!0 (_2!789 lt!20562) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!12705 () Bool)

(assert (=> b!12705 (= e!7680 (array_inv!286 (buf!648 thiss!1486)))))

(assert (= (and start!2670 res!12098) b!12700))

(assert (= (and b!12700 res!12099) b!12698))

(assert (= (and b!12698 res!12100) b!12699))

(assert (= (and b!12699 res!12101) b!12702))

(assert (= (and b!12702 res!12102) b!12701))

(assert (= (and b!12701 res!12096) b!12697))

(assert (= (and b!12697 (not res!12097)) b!12704))

(assert (= (and b!12704 (not res!12103)) b!12703))

(assert (= start!2670 b!12705))

(declare-fun m!19219 () Bool)

(assert (=> start!2670 m!19219))

(declare-fun m!19221 () Bool)

(assert (=> start!2670 m!19221))

(declare-fun m!19223 () Bool)

(assert (=> b!12698 m!19223))

(declare-fun m!19225 () Bool)

(assert (=> b!12698 m!19225))

(declare-fun m!19227 () Bool)

(assert (=> b!12701 m!19227))

(declare-fun m!19229 () Bool)

(assert (=> b!12700 m!19229))

(declare-fun m!19231 () Bool)

(assert (=> b!12702 m!19231))

(declare-fun m!19233 () Bool)

(assert (=> b!12702 m!19233))

(declare-fun m!19235 () Bool)

(assert (=> b!12704 m!19235))

(declare-fun m!19237 () Bool)

(assert (=> b!12703 m!19237))

(declare-fun m!19239 () Bool)

(assert (=> b!12705 m!19239))

(declare-fun m!19241 () Bool)

(assert (=> b!12697 m!19241))

(declare-fun m!19243 () Bool)

(assert (=> b!12697 m!19243))

(declare-fun m!19245 () Bool)

(assert (=> b!12697 m!19245))

(declare-fun m!19247 () Bool)

(assert (=> b!12697 m!19247))

(declare-fun m!19249 () Bool)

(assert (=> b!12697 m!19249))

(declare-fun m!19251 () Bool)

(assert (=> b!12697 m!19251))

(push 1)

(assert (not b!12700))

(assert (not b!12705))

(assert (not b!12698))

(assert (not b!12701))

(assert (not b!12704))

(assert (not b!12697))

(assert (not b!12702))

(assert (not b!12703))

(assert (not start!2670))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

