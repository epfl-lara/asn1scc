; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1070 () Bool)

(assert start!1070)

(declare-fun res!5634 () Bool)

(declare-fun e!2770 () Bool)

(assert (=> start!1070 (=> (not res!5634) (not e!2770))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!333 0))(
  ( (array!334 (arr!529 (Array (_ BitVec 32) (_ BitVec 8))) (size!139 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!333)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!1070 (= res!5634 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!139 srcBuffer!6))))))))

(assert (=> start!1070 e!2770))

(assert (=> start!1070 true))

(declare-fun array_inv!134 (array!333) Bool)

(assert (=> start!1070 (array_inv!134 srcBuffer!6)))

(declare-datatypes ((BitStream!256 0))(
  ( (BitStream!257 (buf!460 array!333) (currentByte!1439 (_ BitVec 32)) (currentBit!1434 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!256)

(declare-fun e!2768 () Bool)

(declare-fun inv!12 (BitStream!256) Bool)

(assert (=> start!1070 (and (inv!12 thiss!1486) e!2768)))

(declare-fun b!4251 () Bool)

(declare-fun e!2771 () Bool)

(assert (=> b!4251 (= e!2770 e!2771)))

(declare-fun res!5636 () Bool)

(assert (=> b!4251 (=> (not res!5636) (not e!2771))))

(declare-datatypes ((Unit!328 0))(
  ( (Unit!329) )
))
(declare-datatypes ((tuple2!478 0))(
  ( (tuple2!479 (_1!255 Unit!328) (_2!255 BitStream!256)) )
))
(declare-fun lt!5313 () tuple2!478)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!4251 (= res!5636 (invariant!0 (currentBit!1434 (_2!255 lt!5313)) (currentByte!1439 (_2!255 lt!5313)) (size!139 (buf!460 (_2!255 lt!5313)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!256 array!333 (_ BitVec 64) (_ BitVec 64)) tuple2!478)

(assert (=> b!4251 (= lt!5313 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!4252 () Bool)

(assert (=> b!4252 (= e!2768 (array_inv!134 (buf!460 thiss!1486)))))

(declare-fun b!4253 () Bool)

(declare-fun res!5638 () Bool)

(assert (=> b!4253 (=> (not res!5638) (not e!2771))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!4253 (= res!5638 (= (bitIndex!0 (size!139 (buf!460 (_2!255 lt!5313))) (currentByte!1439 (_2!255 lt!5313)) (currentBit!1434 (_2!255 lt!5313))) (bvadd (bitIndex!0 (size!139 (buf!460 thiss!1486)) (currentByte!1439 thiss!1486) (currentBit!1434 thiss!1486)) nBits!460)))))

(declare-fun b!4254 () Bool)

(declare-fun res!5633 () Bool)

(assert (=> b!4254 (=> (not res!5633) (not e!2771))))

(declare-fun isPrefixOf!0 (BitStream!256 BitStream!256) Bool)

(assert (=> b!4254 (= res!5633 (isPrefixOf!0 thiss!1486 (_2!255 lt!5313)))))

(declare-fun b!4255 () Bool)

(assert (=> b!4255 (= e!2771 (not true))))

(declare-datatypes ((List!39 0))(
  ( (Nil!36) (Cons!35 (h!154 Bool) (t!789 List!39)) )
))
(declare-fun lt!5315 () List!39)

(declare-datatypes ((tuple2!480 0))(
  ( (tuple2!481 (_1!256 BitStream!256) (_2!256 BitStream!256)) )
))
(declare-fun lt!5312 () tuple2!480)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!256 BitStream!256 (_ BitVec 64)) List!39)

(assert (=> b!4255 (= lt!5315 (bitStreamReadBitsIntoList!0 (_2!255 lt!5313) (_1!256 lt!5312) nBits!460))))

(declare-datatypes ((tuple2!482 0))(
  ( (tuple2!483 (_1!257 array!333) (_2!257 BitStream!256)) )
))
(declare-fun lt!5311 () tuple2!482)

(declare-fun readBits!0 (BitStream!256 (_ BitVec 64)) tuple2!482)

(assert (=> b!4255 (= lt!5311 (readBits!0 (_1!256 lt!5312) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!4255 (validate_offset_bits!1 ((_ sign_extend 32) (size!139 (buf!460 (_2!255 lt!5313)))) ((_ sign_extend 32) (currentByte!1439 thiss!1486)) ((_ sign_extend 32) (currentBit!1434 thiss!1486)) nBits!460)))

(declare-fun lt!5314 () Unit!328)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!256 array!333 (_ BitVec 64)) Unit!328)

(assert (=> b!4255 (= lt!5314 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!460 (_2!255 lt!5313)) nBits!460))))

(declare-fun reader!0 (BitStream!256 BitStream!256) tuple2!480)

(assert (=> b!4255 (= lt!5312 (reader!0 thiss!1486 (_2!255 lt!5313)))))

(declare-fun b!4256 () Bool)

(declare-fun res!5637 () Bool)

(assert (=> b!4256 (=> (not res!5637) (not e!2771))))

(assert (=> b!4256 (= res!5637 (= (size!139 (buf!460 thiss!1486)) (size!139 (buf!460 (_2!255 lt!5313)))))))

(declare-fun b!4257 () Bool)

(declare-fun res!5635 () Bool)

(assert (=> b!4257 (=> (not res!5635) (not e!2770))))

(assert (=> b!4257 (= res!5635 (validate_offset_bits!1 ((_ sign_extend 32) (size!139 (buf!460 thiss!1486))) ((_ sign_extend 32) (currentByte!1439 thiss!1486)) ((_ sign_extend 32) (currentBit!1434 thiss!1486)) nBits!460))))

(assert (= (and start!1070 res!5634) b!4257))

(assert (= (and b!4257 res!5635) b!4251))

(assert (= (and b!4251 res!5636) b!4256))

(assert (= (and b!4256 res!5637) b!4253))

(assert (= (and b!4253 res!5638) b!4254))

(assert (= (and b!4254 res!5633) b!4255))

(assert (= start!1070 b!4252))

(declare-fun m!5001 () Bool)

(assert (=> b!4253 m!5001))

(declare-fun m!5003 () Bool)

(assert (=> b!4253 m!5003))

(declare-fun m!5005 () Bool)

(assert (=> b!4255 m!5005))

(declare-fun m!5007 () Bool)

(assert (=> b!4255 m!5007))

(declare-fun m!5009 () Bool)

(assert (=> b!4255 m!5009))

(declare-fun m!5011 () Bool)

(assert (=> b!4255 m!5011))

(declare-fun m!5013 () Bool)

(assert (=> b!4255 m!5013))

(declare-fun m!5015 () Bool)

(assert (=> b!4252 m!5015))

(declare-fun m!5017 () Bool)

(assert (=> b!4254 m!5017))

(declare-fun m!5019 () Bool)

(assert (=> start!1070 m!5019))

(declare-fun m!5021 () Bool)

(assert (=> start!1070 m!5021))

(declare-fun m!5023 () Bool)

(assert (=> b!4257 m!5023))

(declare-fun m!5025 () Bool)

(assert (=> b!4251 m!5025))

(declare-fun m!5027 () Bool)

(assert (=> b!4251 m!5027))

(push 1)

(assert (not b!4252))

(assert (not b!4254))

(assert (not b!4257))

(assert (not b!4253))

(assert (not b!4251))

(assert (not b!4255))

(assert (not start!1070))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

