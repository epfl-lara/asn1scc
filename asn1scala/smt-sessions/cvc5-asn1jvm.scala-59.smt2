; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1184 () Bool)

(assert start!1184)

(declare-fun res!6231 () Bool)

(declare-fun e!3219 () Bool)

(assert (=> start!1184 (=> (not res!6231) (not e!3219))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!378 0))(
  ( (array!379 (arr!553 (Array (_ BitVec 32) (_ BitVec 8))) (size!160 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!378)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!1184 (= res!6231 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!160 srcBuffer!6))))))))

(assert (=> start!1184 e!3219))

(assert (=> start!1184 true))

(declare-fun array_inv!155 (array!378) Bool)

(assert (=> start!1184 (array_inv!155 srcBuffer!6)))

(declare-datatypes ((BitStream!298 0))(
  ( (BitStream!299 (buf!484 array!378) (currentByte!1469 (_ BitVec 32)) (currentBit!1464 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!298)

(declare-fun e!3220 () Bool)

(declare-fun inv!12 (BitStream!298) Bool)

(assert (=> start!1184 (and (inv!12 thiss!1486) e!3220)))

(declare-fun b!5003 () Bool)

(declare-fun res!6232 () Bool)

(declare-fun e!3216 () Bool)

(assert (=> b!5003 (=> (not res!6232) (not e!3216))))

(declare-datatypes ((Unit!394 0))(
  ( (Unit!395) )
))
(declare-datatypes ((tuple2!616 0))(
  ( (tuple2!617 (_1!327 Unit!394) (_2!327 BitStream!298)) )
))
(declare-fun lt!6399 () tuple2!616)

(assert (=> b!5003 (= res!6232 (= (size!160 (buf!484 thiss!1486)) (size!160 (buf!484 (_2!327 lt!6399)))))))

(declare-fun b!5004 () Bool)

(declare-fun e!3221 () Bool)

(assert (=> b!5004 (= e!3216 (not e!3221))))

(declare-fun res!6230 () Bool)

(assert (=> b!5004 (=> res!6230 e!3221)))

(declare-datatypes ((List!60 0))(
  ( (Nil!57) (Cons!56 (h!175 Bool) (t!810 List!60)) )
))
(declare-fun lt!6400 () List!60)

(declare-fun lt!6398 () List!60)

(assert (=> b!5004 (= res!6230 (not (= lt!6400 lt!6398)))))

(declare-datatypes ((tuple2!618 0))(
  ( (tuple2!619 (_1!328 BitStream!298) (_2!328 BitStream!298)) )
))
(declare-fun lt!6395 () tuple2!618)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!298 BitStream!298 (_ BitVec 64)) List!60)

(assert (=> b!5004 (= lt!6398 (bitStreamReadBitsIntoList!0 (_2!327 lt!6399) (_1!328 lt!6395) nBits!460))))

(declare-datatypes ((tuple2!620 0))(
  ( (tuple2!621 (_1!329 array!378) (_2!329 BitStream!298)) )
))
(declare-fun lt!6401 () tuple2!620)

(declare-fun byteArrayBitContentToList!0 (BitStream!298 array!378 (_ BitVec 64) (_ BitVec 64)) List!60)

(assert (=> b!5004 (= lt!6400 (byteArrayBitContentToList!0 (_2!327 lt!6399) (_1!329 lt!6401) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun readBits!0 (BitStream!298 (_ BitVec 64)) tuple2!620)

(assert (=> b!5004 (= lt!6401 (readBits!0 (_1!328 lt!6395) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!5004 (validate_offset_bits!1 ((_ sign_extend 32) (size!160 (buf!484 (_2!327 lt!6399)))) ((_ sign_extend 32) (currentByte!1469 thiss!1486)) ((_ sign_extend 32) (currentBit!1464 thiss!1486)) nBits!460)))

(declare-fun lt!6396 () Unit!394)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!298 array!378 (_ BitVec 64)) Unit!394)

(assert (=> b!5004 (= lt!6396 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!484 (_2!327 lt!6399)) nBits!460))))

(declare-fun reader!0 (BitStream!298 BitStream!298) tuple2!618)

(assert (=> b!5004 (= lt!6395 (reader!0 thiss!1486 (_2!327 lt!6399)))))

(declare-fun b!5005 () Bool)

(declare-fun res!6226 () Bool)

(assert (=> b!5005 (=> (not res!6226) (not e!3216))))

(declare-fun isPrefixOf!0 (BitStream!298 BitStream!298) Bool)

(assert (=> b!5005 (= res!6226 (isPrefixOf!0 thiss!1486 (_2!327 lt!6399)))))

(declare-fun b!5006 () Bool)

(assert (=> b!5006 (= e!3220 (array_inv!155 (buf!484 thiss!1486)))))

(declare-fun b!5007 () Bool)

(declare-fun res!6227 () Bool)

(assert (=> b!5007 (=> (not res!6227) (not e!3216))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!5007 (= res!6227 (= (bitIndex!0 (size!160 (buf!484 (_2!327 lt!6399))) (currentByte!1469 (_2!327 lt!6399)) (currentBit!1464 (_2!327 lt!6399))) (bvadd (bitIndex!0 (size!160 (buf!484 thiss!1486)) (currentByte!1469 thiss!1486) (currentBit!1464 thiss!1486)) nBits!460)))))

(declare-fun lt!6397 () List!60)

(declare-fun b!5008 () Bool)

(assert (=> b!5008 (= e!3221 (or (not (= lt!6398 lt!6397)) (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsgt nBits!460 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!160 (_1!329 lt!6401))))) (= lt!6400 lt!6397)))))

(assert (=> b!5008 (= lt!6397 (byteArrayBitContentToList!0 (_2!327 lt!6399) srcBuffer!6 from!367 nBits!460))))

(declare-fun b!5009 () Bool)

(assert (=> b!5009 (= e!3219 e!3216)))

(declare-fun res!6228 () Bool)

(assert (=> b!5009 (=> (not res!6228) (not e!3216))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!5009 (= res!6228 (invariant!0 (currentBit!1464 (_2!327 lt!6399)) (currentByte!1469 (_2!327 lt!6399)) (size!160 (buf!484 (_2!327 lt!6399)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!298 array!378 (_ BitVec 64) (_ BitVec 64)) tuple2!616)

(assert (=> b!5009 (= lt!6399 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!5010 () Bool)

(declare-fun res!6229 () Bool)

(assert (=> b!5010 (=> (not res!6229) (not e!3219))))

(assert (=> b!5010 (= res!6229 (validate_offset_bits!1 ((_ sign_extend 32) (size!160 (buf!484 thiss!1486))) ((_ sign_extend 32) (currentByte!1469 thiss!1486)) ((_ sign_extend 32) (currentBit!1464 thiss!1486)) nBits!460))))

(assert (= (and start!1184 res!6231) b!5010))

(assert (= (and b!5010 res!6229) b!5009))

(assert (= (and b!5009 res!6228) b!5003))

(assert (= (and b!5003 res!6232) b!5007))

(assert (= (and b!5007 res!6227) b!5005))

(assert (= (and b!5005 res!6226) b!5004))

(assert (= (and b!5004 (not res!6230)) b!5008))

(assert (= start!1184 b!5006))

(declare-fun m!6087 () Bool)

(assert (=> b!5006 m!6087))

(declare-fun m!6089 () Bool)

(assert (=> b!5010 m!6089))

(declare-fun m!6091 () Bool)

(assert (=> b!5004 m!6091))

(declare-fun m!6093 () Bool)

(assert (=> b!5004 m!6093))

(declare-fun m!6095 () Bool)

(assert (=> b!5004 m!6095))

(declare-fun m!6097 () Bool)

(assert (=> b!5004 m!6097))

(declare-fun m!6099 () Bool)

(assert (=> b!5004 m!6099))

(declare-fun m!6101 () Bool)

(assert (=> b!5004 m!6101))

(declare-fun m!6103 () Bool)

(assert (=> b!5008 m!6103))

(declare-fun m!6105 () Bool)

(assert (=> b!5005 m!6105))

(declare-fun m!6107 () Bool)

(assert (=> b!5007 m!6107))

(declare-fun m!6109 () Bool)

(assert (=> b!5007 m!6109))

(declare-fun m!6111 () Bool)

(assert (=> b!5009 m!6111))

(declare-fun m!6113 () Bool)

(assert (=> b!5009 m!6113))

(declare-fun m!6115 () Bool)

(assert (=> start!1184 m!6115))

(declare-fun m!6117 () Bool)

(assert (=> start!1184 m!6117))

(push 1)

(assert (not start!1184))

(assert (not b!5005))

(assert (not b!5010))

(assert (not b!5007))

(assert (not b!5004))

(assert (not b!5006))

(assert (not b!5009))

(assert (not b!5008))

(check-sat)

(pop 1)

(push 1)

(check-sat)

