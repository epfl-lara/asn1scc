; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1072 () Bool)

(assert start!1072)

(declare-fun b!4272 () Bool)

(declare-fun res!5653 () Bool)

(declare-fun e!2782 () Bool)

(assert (=> b!4272 (=> (not res!5653) (not e!2782))))

(declare-datatypes ((array!335 0))(
  ( (array!336 (arr!530 (Array (_ BitVec 32) (_ BitVec 8))) (size!140 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!258 0))(
  ( (BitStream!259 (buf!461 array!335) (currentByte!1440 (_ BitVec 32)) (currentBit!1435 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!258)

(declare-datatypes ((Unit!330 0))(
  ( (Unit!331) )
))
(declare-datatypes ((tuple2!484 0))(
  ( (tuple2!485 (_1!258 Unit!330) (_2!258 BitStream!258)) )
))
(declare-fun lt!5326 () tuple2!484)

(assert (=> b!4272 (= res!5653 (= (size!140 (buf!461 thiss!1486)) (size!140 (buf!461 (_2!258 lt!5326)))))))

(declare-fun b!4273 () Bool)

(declare-fun res!5655 () Bool)

(assert (=> b!4273 (=> (not res!5655) (not e!2782))))

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!4273 (= res!5655 (= (bitIndex!0 (size!140 (buf!461 (_2!258 lt!5326))) (currentByte!1440 (_2!258 lt!5326)) (currentBit!1435 (_2!258 lt!5326))) (bvadd (bitIndex!0 (size!140 (buf!461 thiss!1486)) (currentByte!1440 thiss!1486) (currentBit!1435 thiss!1486)) nBits!460)))))

(declare-fun res!5656 () Bool)

(declare-fun e!2783 () Bool)

(assert (=> start!1072 (=> (not res!5656) (not e!2783))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!335)

(assert (=> start!1072 (= res!5656 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!140 srcBuffer!6))))))))

(assert (=> start!1072 e!2783))

(assert (=> start!1072 true))

(declare-fun array_inv!135 (array!335) Bool)

(assert (=> start!1072 (array_inv!135 srcBuffer!6)))

(declare-fun e!2786 () Bool)

(declare-fun inv!12 (BitStream!258) Bool)

(assert (=> start!1072 (and (inv!12 thiss!1486) e!2786)))

(declare-fun b!4274 () Bool)

(assert (=> b!4274 (= e!2782 (not true))))

(declare-datatypes ((List!40 0))(
  ( (Nil!37) (Cons!36 (h!155 Bool) (t!790 List!40)) )
))
(declare-fun lt!5327 () List!40)

(declare-datatypes ((tuple2!486 0))(
  ( (tuple2!487 (_1!259 BitStream!258) (_2!259 BitStream!258)) )
))
(declare-fun lt!5330 () tuple2!486)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!258 BitStream!258 (_ BitVec 64)) List!40)

(assert (=> b!4274 (= lt!5327 (bitStreamReadBitsIntoList!0 (_2!258 lt!5326) (_1!259 lt!5330) nBits!460))))

(declare-datatypes ((tuple2!488 0))(
  ( (tuple2!489 (_1!260 array!335) (_2!260 BitStream!258)) )
))
(declare-fun lt!5328 () tuple2!488)

(declare-fun readBits!0 (BitStream!258 (_ BitVec 64)) tuple2!488)

(assert (=> b!4274 (= lt!5328 (readBits!0 (_1!259 lt!5330) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!4274 (validate_offset_bits!1 ((_ sign_extend 32) (size!140 (buf!461 (_2!258 lt!5326)))) ((_ sign_extend 32) (currentByte!1440 thiss!1486)) ((_ sign_extend 32) (currentBit!1435 thiss!1486)) nBits!460)))

(declare-fun lt!5329 () Unit!330)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!258 array!335 (_ BitVec 64)) Unit!330)

(assert (=> b!4274 (= lt!5329 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!461 (_2!258 lt!5326)) nBits!460))))

(declare-fun reader!0 (BitStream!258 BitStream!258) tuple2!486)

(assert (=> b!4274 (= lt!5330 (reader!0 thiss!1486 (_2!258 lt!5326)))))

(declare-fun b!4275 () Bool)

(assert (=> b!4275 (= e!2786 (array_inv!135 (buf!461 thiss!1486)))))

(declare-fun b!4276 () Bool)

(assert (=> b!4276 (= e!2783 e!2782)))

(declare-fun res!5651 () Bool)

(assert (=> b!4276 (=> (not res!5651) (not e!2782))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!4276 (= res!5651 (invariant!0 (currentBit!1435 (_2!258 lt!5326)) (currentByte!1440 (_2!258 lt!5326)) (size!140 (buf!461 (_2!258 lt!5326)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!258 array!335 (_ BitVec 64) (_ BitVec 64)) tuple2!484)

(assert (=> b!4276 (= lt!5326 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!4277 () Bool)

(declare-fun res!5652 () Bool)

(assert (=> b!4277 (=> (not res!5652) (not e!2782))))

(declare-fun isPrefixOf!0 (BitStream!258 BitStream!258) Bool)

(assert (=> b!4277 (= res!5652 (isPrefixOf!0 thiss!1486 (_2!258 lt!5326)))))

(declare-fun b!4278 () Bool)

(declare-fun res!5654 () Bool)

(assert (=> b!4278 (=> (not res!5654) (not e!2783))))

(assert (=> b!4278 (= res!5654 (validate_offset_bits!1 ((_ sign_extend 32) (size!140 (buf!461 thiss!1486))) ((_ sign_extend 32) (currentByte!1440 thiss!1486)) ((_ sign_extend 32) (currentBit!1435 thiss!1486)) nBits!460))))

(assert (= (and start!1072 res!5656) b!4278))

(assert (= (and b!4278 res!5654) b!4276))

(assert (= (and b!4276 res!5651) b!4272))

(assert (= (and b!4272 res!5653) b!4273))

(assert (= (and b!4273 res!5655) b!4277))

(assert (= (and b!4277 res!5652) b!4274))

(assert (= start!1072 b!4275))

(declare-fun m!5029 () Bool)

(assert (=> b!4274 m!5029))

(declare-fun m!5031 () Bool)

(assert (=> b!4274 m!5031))

(declare-fun m!5033 () Bool)

(assert (=> b!4274 m!5033))

(declare-fun m!5035 () Bool)

(assert (=> b!4274 m!5035))

(declare-fun m!5037 () Bool)

(assert (=> b!4274 m!5037))

(declare-fun m!5039 () Bool)

(assert (=> start!1072 m!5039))

(declare-fun m!5041 () Bool)

(assert (=> start!1072 m!5041))

(declare-fun m!5043 () Bool)

(assert (=> b!4275 m!5043))

(declare-fun m!5045 () Bool)

(assert (=> b!4276 m!5045))

(declare-fun m!5047 () Bool)

(assert (=> b!4276 m!5047))

(declare-fun m!5049 () Bool)

(assert (=> b!4278 m!5049))

(declare-fun m!5051 () Bool)

(assert (=> b!4277 m!5051))

(declare-fun m!5053 () Bool)

(assert (=> b!4273 m!5053))

(declare-fun m!5055 () Bool)

(assert (=> b!4273 m!5055))

(check-sat (not start!1072) (not b!4277) (not b!4273) (not b!4278) (not b!4275) (not b!4274) (not b!4276))
