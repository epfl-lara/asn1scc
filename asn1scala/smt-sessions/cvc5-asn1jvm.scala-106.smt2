; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2678 () Bool)

(assert start!2678)

(declare-fun b!12805 () Bool)

(declare-fun res!12198 () Bool)

(declare-fun e!7757 () Bool)

(assert (=> b!12805 (=> (not res!12198) (not e!7757))))

(declare-datatypes ((array!693 0))(
  ( (array!694 (arr!730 (Array (_ BitVec 32) (_ BitVec 8))) (size!301 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!562 0))(
  ( (BitStream!563 (buf!652 array!693) (currentByte!1736 (_ BitVec 32)) (currentBit!1731 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!562)

(declare-datatypes ((Unit!1085 0))(
  ( (Unit!1086) )
))
(declare-datatypes ((tuple2!1492 0))(
  ( (tuple2!1493 (_1!801 Unit!1085) (_2!801 BitStream!562)) )
))
(declare-fun lt!20633 () tuple2!1492)

(declare-fun isPrefixOf!0 (BitStream!562 BitStream!562) Bool)

(assert (=> b!12805 (= res!12198 (isPrefixOf!0 thiss!1486 (_2!801 lt!20633)))))

(declare-fun b!12806 () Bool)

(declare-fun res!12193 () Bool)

(declare-fun e!7753 () Bool)

(assert (=> b!12806 (=> (not res!12193) (not e!7753))))

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!12806 (= res!12193 (validate_offset_bits!1 ((_ sign_extend 32) (size!301 (buf!652 thiss!1486))) ((_ sign_extend 32) (currentByte!1736 thiss!1486)) ((_ sign_extend 32) (currentBit!1731 thiss!1486)) nBits!460))))

(declare-fun b!12807 () Bool)

(declare-fun e!7752 () Bool)

(declare-fun array_inv!290 (array!693) Bool)

(assert (=> b!12807 (= e!7752 (array_inv!290 (buf!652 thiss!1486)))))

(declare-fun b!12808 () Bool)

(declare-fun res!12199 () Bool)

(declare-fun e!7755 () Bool)

(assert (=> b!12808 (=> res!12199 e!7755)))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((List!177 0))(
  ( (Nil!174) (Cons!173 (h!292 Bool) (t!927 List!177)) )
))
(declare-fun lt!20632 () List!177)

(declare-fun srcBuffer!6 () array!693)

(declare-fun byteArrayBitContentToList!0 (BitStream!562 array!693 (_ BitVec 64) (_ BitVec 64)) List!177)

(assert (=> b!12808 (= res!12199 (not (= lt!20632 (byteArrayBitContentToList!0 (_2!801 lt!20633) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!12809 () Bool)

(assert (=> b!12809 (= e!7757 (not e!7755))))

(declare-fun res!12197 () Bool)

(assert (=> b!12809 (=> res!12197 e!7755)))

(declare-datatypes ((tuple2!1494 0))(
  ( (tuple2!1495 (_1!802 array!693) (_2!802 BitStream!562)) )
))
(declare-fun lt!20636 () tuple2!1494)

(assert (=> b!12809 (= res!12197 (not (= (byteArrayBitContentToList!0 (_2!801 lt!20633) (_1!802 lt!20636) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!20632)))))

(declare-datatypes ((tuple2!1496 0))(
  ( (tuple2!1497 (_1!803 BitStream!562) (_2!803 BitStream!562)) )
))
(declare-fun lt!20634 () tuple2!1496)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!562 BitStream!562 (_ BitVec 64)) List!177)

(assert (=> b!12809 (= lt!20632 (bitStreamReadBitsIntoList!0 (_2!801 lt!20633) (_1!803 lt!20634) nBits!460))))

(declare-fun readBits!0 (BitStream!562 (_ BitVec 64)) tuple2!1494)

(assert (=> b!12809 (= lt!20636 (readBits!0 (_1!803 lt!20634) nBits!460))))

(assert (=> b!12809 (validate_offset_bits!1 ((_ sign_extend 32) (size!301 (buf!652 (_2!801 lt!20633)))) ((_ sign_extend 32) (currentByte!1736 thiss!1486)) ((_ sign_extend 32) (currentBit!1731 thiss!1486)) nBits!460)))

(declare-fun lt!20635 () Unit!1085)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!562 array!693 (_ BitVec 64)) Unit!1085)

(assert (=> b!12809 (= lt!20635 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!652 (_2!801 lt!20633)) nBits!460))))

(declare-fun reader!0 (BitStream!562 BitStream!562) tuple2!1496)

(assert (=> b!12809 (= lt!20634 (reader!0 thiss!1486 (_2!801 lt!20633)))))

(declare-fun b!12810 () Bool)

(declare-fun res!12192 () Bool)

(assert (=> b!12810 (=> (not res!12192) (not e!7757))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!12810 (= res!12192 (= (bitIndex!0 (size!301 (buf!652 (_2!801 lt!20633))) (currentByte!1736 (_2!801 lt!20633)) (currentBit!1731 (_2!801 lt!20633))) (bvadd (bitIndex!0 (size!301 (buf!652 thiss!1486)) (currentByte!1736 thiss!1486) (currentBit!1731 thiss!1486)) nBits!460)))))

(declare-fun b!12811 () Bool)

(assert (=> b!12811 (= e!7755 true)))

(declare-fun lt!20631 () Unit!1085)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!562 array!693 array!693 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1085)

(assert (=> b!12811 (= lt!20631 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!801 lt!20633) srcBuffer!6 (_1!802 lt!20636) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun res!12196 () Bool)

(assert (=> start!2678 (=> (not res!12196) (not e!7753))))

(assert (=> start!2678 (= res!12196 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!301 srcBuffer!6))))))))

(assert (=> start!2678 e!7753))

(assert (=> start!2678 true))

(assert (=> start!2678 (array_inv!290 srcBuffer!6)))

(declare-fun inv!12 (BitStream!562) Bool)

(assert (=> start!2678 (and (inv!12 thiss!1486) e!7752)))

(declare-fun b!12812 () Bool)

(declare-fun res!12195 () Bool)

(assert (=> b!12812 (=> (not res!12195) (not e!7757))))

(assert (=> b!12812 (= res!12195 (= (size!301 (buf!652 thiss!1486)) (size!301 (buf!652 (_2!801 lt!20633)))))))

(declare-fun b!12813 () Bool)

(assert (=> b!12813 (= e!7753 e!7757)))

(declare-fun res!12194 () Bool)

(assert (=> b!12813 (=> (not res!12194) (not e!7757))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!12813 (= res!12194 (invariant!0 (currentBit!1731 (_2!801 lt!20633)) (currentByte!1736 (_2!801 lt!20633)) (size!301 (buf!652 (_2!801 lt!20633)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!562 array!693 (_ BitVec 64) (_ BitVec 64)) tuple2!1492)

(assert (=> b!12813 (= lt!20633 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(assert (= (and start!2678 res!12196) b!12806))

(assert (= (and b!12806 res!12193) b!12813))

(assert (= (and b!12813 res!12194) b!12812))

(assert (= (and b!12812 res!12195) b!12810))

(assert (= (and b!12810 res!12192) b!12805))

(assert (= (and b!12805 res!12198) b!12809))

(assert (= (and b!12809 (not res!12197)) b!12808))

(assert (= (and b!12808 (not res!12199)) b!12811))

(assert (= start!2678 b!12807))

(declare-fun m!19355 () Bool)

(assert (=> b!12811 m!19355))

(declare-fun m!19357 () Bool)

(assert (=> b!12809 m!19357))

(declare-fun m!19359 () Bool)

(assert (=> b!12809 m!19359))

(declare-fun m!19361 () Bool)

(assert (=> b!12809 m!19361))

(declare-fun m!19363 () Bool)

(assert (=> b!12809 m!19363))

(declare-fun m!19365 () Bool)

(assert (=> b!12809 m!19365))

(declare-fun m!19367 () Bool)

(assert (=> b!12809 m!19367))

(declare-fun m!19369 () Bool)

(assert (=> b!12806 m!19369))

(declare-fun m!19371 () Bool)

(assert (=> b!12810 m!19371))

(declare-fun m!19373 () Bool)

(assert (=> b!12810 m!19373))

(declare-fun m!19375 () Bool)

(assert (=> b!12808 m!19375))

(declare-fun m!19377 () Bool)

(assert (=> b!12807 m!19377))

(declare-fun m!19379 () Bool)

(assert (=> b!12813 m!19379))

(declare-fun m!19381 () Bool)

(assert (=> b!12813 m!19381))

(declare-fun m!19383 () Bool)

(assert (=> start!2678 m!19383))

(declare-fun m!19385 () Bool)

(assert (=> start!2678 m!19385))

(declare-fun m!19387 () Bool)

(assert (=> b!12805 m!19387))

(push 1)

(assert (not b!12811))

(assert (not b!12813))

(assert (not start!2678))

(assert (not b!12807))

(assert (not b!12810))

(assert (not b!12806))

(assert (not b!12808))

(assert (not b!12809))

(assert (not b!12805))

(check-sat)

