; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1076 () Bool)

(assert start!1076)

(declare-fun res!5688 () Bool)

(declare-fun e!2815 () Bool)

(assert (=> start!1076 (=> (not res!5688) (not e!2815))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!339 0))(
  ( (array!340 (arr!532 (Array (_ BitVec 32) (_ BitVec 8))) (size!142 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!339)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!1076 (= res!5688 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!142 srcBuffer!6))))))))

(assert (=> start!1076 e!2815))

(assert (=> start!1076 true))

(declare-fun array_inv!137 (array!339) Bool)

(assert (=> start!1076 (array_inv!137 srcBuffer!6)))

(declare-datatypes ((BitStream!262 0))(
  ( (BitStream!263 (buf!463 array!339) (currentByte!1442 (_ BitVec 32)) (currentBit!1437 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!262)

(declare-fun e!2816 () Bool)

(declare-fun inv!12 (BitStream!262) Bool)

(assert (=> start!1076 (and (inv!12 thiss!1486) e!2816)))

(declare-fun b!4314 () Bool)

(declare-fun e!2813 () Bool)

(assert (=> b!4314 (= e!2815 e!2813)))

(declare-fun res!5692 () Bool)

(assert (=> b!4314 (=> (not res!5692) (not e!2813))))

(declare-datatypes ((Unit!334 0))(
  ( (Unit!335) )
))
(declare-datatypes ((tuple2!496 0))(
  ( (tuple2!497 (_1!264 Unit!334) (_2!264 BitStream!262)) )
))
(declare-fun lt!5360 () tuple2!496)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!4314 (= res!5692 (invariant!0 (currentBit!1437 (_2!264 lt!5360)) (currentByte!1442 (_2!264 lt!5360)) (size!142 (buf!463 (_2!264 lt!5360)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!262 array!339 (_ BitVec 64) (_ BitVec 64)) tuple2!496)

(assert (=> b!4314 (= lt!5360 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!4315 () Bool)

(declare-fun res!5689 () Bool)

(assert (=> b!4315 (=> (not res!5689) (not e!2813))))

(assert (=> b!4315 (= res!5689 (= (size!142 (buf!463 thiss!1486)) (size!142 (buf!463 (_2!264 lt!5360)))))))

(declare-fun b!4316 () Bool)

(assert (=> b!4316 (= e!2816 (array_inv!137 (buf!463 thiss!1486)))))

(declare-fun b!4317 () Bool)

(assert (=> b!4317 (= e!2813 (not true))))

(declare-datatypes ((tuple2!498 0))(
  ( (tuple2!499 (_1!265 BitStream!262) (_2!265 BitStream!262)) )
))
(declare-fun lt!5358 () tuple2!498)

(declare-datatypes ((List!42 0))(
  ( (Nil!39) (Cons!38 (h!157 Bool) (t!792 List!42)) )
))
(declare-fun lt!5357 () List!42)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!262 BitStream!262 (_ BitVec 64)) List!42)

(assert (=> b!4317 (= lt!5357 (bitStreamReadBitsIntoList!0 (_2!264 lt!5360) (_1!265 lt!5358) nBits!460))))

(declare-datatypes ((tuple2!500 0))(
  ( (tuple2!501 (_1!266 array!339) (_2!266 BitStream!262)) )
))
(declare-fun lt!5356 () tuple2!500)

(declare-fun readBits!0 (BitStream!262 (_ BitVec 64)) tuple2!500)

(assert (=> b!4317 (= lt!5356 (readBits!0 (_1!265 lt!5358) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!4317 (validate_offset_bits!1 ((_ sign_extend 32) (size!142 (buf!463 (_2!264 lt!5360)))) ((_ sign_extend 32) (currentByte!1442 thiss!1486)) ((_ sign_extend 32) (currentBit!1437 thiss!1486)) nBits!460)))

(declare-fun lt!5359 () Unit!334)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!262 array!339 (_ BitVec 64)) Unit!334)

(assert (=> b!4317 (= lt!5359 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!463 (_2!264 lt!5360)) nBits!460))))

(declare-fun reader!0 (BitStream!262 BitStream!262) tuple2!498)

(assert (=> b!4317 (= lt!5358 (reader!0 thiss!1486 (_2!264 lt!5360)))))

(declare-fun b!4318 () Bool)

(declare-fun res!5691 () Bool)

(assert (=> b!4318 (=> (not res!5691) (not e!2815))))

(assert (=> b!4318 (= res!5691 (validate_offset_bits!1 ((_ sign_extend 32) (size!142 (buf!463 thiss!1486))) ((_ sign_extend 32) (currentByte!1442 thiss!1486)) ((_ sign_extend 32) (currentBit!1437 thiss!1486)) nBits!460))))

(declare-fun b!4319 () Bool)

(declare-fun res!5687 () Bool)

(assert (=> b!4319 (=> (not res!5687) (not e!2813))))

(declare-fun isPrefixOf!0 (BitStream!262 BitStream!262) Bool)

(assert (=> b!4319 (= res!5687 (isPrefixOf!0 thiss!1486 (_2!264 lt!5360)))))

(declare-fun b!4320 () Bool)

(declare-fun res!5690 () Bool)

(assert (=> b!4320 (=> (not res!5690) (not e!2813))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!4320 (= res!5690 (= (bitIndex!0 (size!142 (buf!463 (_2!264 lt!5360))) (currentByte!1442 (_2!264 lt!5360)) (currentBit!1437 (_2!264 lt!5360))) (bvadd (bitIndex!0 (size!142 (buf!463 thiss!1486)) (currentByte!1442 thiss!1486) (currentBit!1437 thiss!1486)) nBits!460)))))

(assert (= (and start!1076 res!5688) b!4318))

(assert (= (and b!4318 res!5691) b!4314))

(assert (= (and b!4314 res!5692) b!4315))

(assert (= (and b!4315 res!5689) b!4320))

(assert (= (and b!4320 res!5690) b!4319))

(assert (= (and b!4319 res!5687) b!4317))

(assert (= start!1076 b!4316))

(declare-fun m!5085 () Bool)

(assert (=> b!4318 m!5085))

(declare-fun m!5087 () Bool)

(assert (=> start!1076 m!5087))

(declare-fun m!5089 () Bool)

(assert (=> start!1076 m!5089))

(declare-fun m!5091 () Bool)

(assert (=> b!4314 m!5091))

(declare-fun m!5093 () Bool)

(assert (=> b!4314 m!5093))

(declare-fun m!5095 () Bool)

(assert (=> b!4316 m!5095))

(declare-fun m!5097 () Bool)

(assert (=> b!4320 m!5097))

(declare-fun m!5099 () Bool)

(assert (=> b!4320 m!5099))

(declare-fun m!5101 () Bool)

(assert (=> b!4317 m!5101))

(declare-fun m!5103 () Bool)

(assert (=> b!4317 m!5103))

(declare-fun m!5105 () Bool)

(assert (=> b!4317 m!5105))

(declare-fun m!5107 () Bool)

(assert (=> b!4317 m!5107))

(declare-fun m!5109 () Bool)

(assert (=> b!4317 m!5109))

(declare-fun m!5111 () Bool)

(assert (=> b!4319 m!5111))

(push 1)

(assert (not b!4314))

(assert (not b!4316))

(assert (not b!4320))

(assert (not b!4318))

(assert (not b!4317))

(assert (not start!1076))

(assert (not b!4319))

(check-sat)

(pop 1)

