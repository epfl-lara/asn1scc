; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1084 () Bool)

(assert start!1084)

(declare-fun b!4398 () Bool)

(declare-fun res!5762 () Bool)

(declare-fun e!2872 () Bool)

(assert (=> b!4398 (=> (not res!5762) (not e!2872))))

(declare-datatypes ((array!347 0))(
  ( (array!348 (arr!536 (Array (_ BitVec 32) (_ BitVec 8))) (size!146 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!270 0))(
  ( (BitStream!271 (buf!467 array!347) (currentByte!1446 (_ BitVec 32)) (currentBit!1441 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!270)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!4398 (= res!5762 (validate_offset_bits!1 ((_ sign_extend 32) (size!146 (buf!467 thiss!1486))) ((_ sign_extend 32) (currentByte!1446 thiss!1486)) ((_ sign_extend 32) (currentBit!1441 thiss!1486)) nBits!460))))

(declare-fun b!4399 () Bool)

(declare-fun e!2876 () Bool)

(assert (=> b!4399 (= e!2872 e!2876)))

(declare-fun res!5759 () Bool)

(assert (=> b!4399 (=> (not res!5759) (not e!2876))))

(declare-datatypes ((Unit!342 0))(
  ( (Unit!343) )
))
(declare-datatypes ((tuple2!520 0))(
  ( (tuple2!521 (_1!276 Unit!342) (_2!276 BitStream!270)) )
))
(declare-fun lt!5417 () tuple2!520)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!4399 (= res!5759 (invariant!0 (currentBit!1441 (_2!276 lt!5417)) (currentByte!1446 (_2!276 lt!5417)) (size!146 (buf!467 (_2!276 lt!5417)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!347)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!270 array!347 (_ BitVec 64) (_ BitVec 64)) tuple2!520)

(assert (=> b!4399 (= lt!5417 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!4400 () Bool)

(declare-fun res!5763 () Bool)

(assert (=> b!4400 (=> (not res!5763) (not e!2876))))

(declare-fun isPrefixOf!0 (BitStream!270 BitStream!270) Bool)

(assert (=> b!4400 (= res!5763 (isPrefixOf!0 thiss!1486 (_2!276 lt!5417)))))

(declare-fun b!4401 () Bool)

(declare-fun e!2875 () Bool)

(declare-fun array_inv!141 (array!347) Bool)

(assert (=> b!4401 (= e!2875 (array_inv!141 (buf!467 thiss!1486)))))

(declare-fun res!5761 () Bool)

(assert (=> start!1084 (=> (not res!5761) (not e!2872))))

(assert (=> start!1084 (= res!5761 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!146 srcBuffer!6))))))))

(assert (=> start!1084 e!2872))

(assert (=> start!1084 true))

(assert (=> start!1084 (array_inv!141 srcBuffer!6)))

(declare-fun inv!12 (BitStream!270) Bool)

(assert (=> start!1084 (and (inv!12 thiss!1486) e!2875)))

(declare-fun b!4402 () Bool)

(declare-fun res!5764 () Bool)

(assert (=> b!4402 (=> (not res!5764) (not e!2876))))

(assert (=> b!4402 (= res!5764 (= (size!146 (buf!467 thiss!1486)) (size!146 (buf!467 (_2!276 lt!5417)))))))

(declare-fun b!4403 () Bool)

(assert (=> b!4403 (= e!2876 (not true))))

(declare-datatypes ((List!46 0))(
  ( (Nil!43) (Cons!42 (h!161 Bool) (t!796 List!46)) )
))
(declare-fun lt!5418 () List!46)

(declare-datatypes ((tuple2!522 0))(
  ( (tuple2!523 (_1!277 BitStream!270) (_2!277 BitStream!270)) )
))
(declare-fun lt!5416 () tuple2!522)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!270 BitStream!270 (_ BitVec 64)) List!46)

(assert (=> b!4403 (= lt!5418 (bitStreamReadBitsIntoList!0 (_2!276 lt!5417) (_1!277 lt!5416) nBits!460))))

(declare-datatypes ((tuple2!524 0))(
  ( (tuple2!525 (_1!278 array!347) (_2!278 BitStream!270)) )
))
(declare-fun lt!5419 () tuple2!524)

(declare-fun readBits!0 (BitStream!270 (_ BitVec 64)) tuple2!524)

(assert (=> b!4403 (= lt!5419 (readBits!0 (_1!277 lt!5416) nBits!460))))

(assert (=> b!4403 (validate_offset_bits!1 ((_ sign_extend 32) (size!146 (buf!467 (_2!276 lt!5417)))) ((_ sign_extend 32) (currentByte!1446 thiss!1486)) ((_ sign_extend 32) (currentBit!1441 thiss!1486)) nBits!460)))

(declare-fun lt!5420 () Unit!342)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!270 array!347 (_ BitVec 64)) Unit!342)

(assert (=> b!4403 (= lt!5420 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!467 (_2!276 lt!5417)) nBits!460))))

(declare-fun reader!0 (BitStream!270 BitStream!270) tuple2!522)

(assert (=> b!4403 (= lt!5416 (reader!0 thiss!1486 (_2!276 lt!5417)))))

(declare-fun b!4404 () Bool)

(declare-fun res!5760 () Bool)

(assert (=> b!4404 (=> (not res!5760) (not e!2876))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!4404 (= res!5760 (= (bitIndex!0 (size!146 (buf!467 (_2!276 lt!5417))) (currentByte!1446 (_2!276 lt!5417)) (currentBit!1441 (_2!276 lt!5417))) (bvadd (bitIndex!0 (size!146 (buf!467 thiss!1486)) (currentByte!1446 thiss!1486) (currentBit!1441 thiss!1486)) nBits!460)))))

(assert (= (and start!1084 res!5761) b!4398))

(assert (= (and b!4398 res!5762) b!4399))

(assert (= (and b!4399 res!5759) b!4402))

(assert (= (and b!4402 res!5764) b!4404))

(assert (= (and b!4404 res!5760) b!4400))

(assert (= (and b!4400 res!5763) b!4403))

(assert (= start!1084 b!4401))

(declare-fun m!5197 () Bool)

(assert (=> b!4404 m!5197))

(declare-fun m!5199 () Bool)

(assert (=> b!4404 m!5199))

(declare-fun m!5201 () Bool)

(assert (=> b!4403 m!5201))

(declare-fun m!5203 () Bool)

(assert (=> b!4403 m!5203))

(declare-fun m!5205 () Bool)

(assert (=> b!4403 m!5205))

(declare-fun m!5207 () Bool)

(assert (=> b!4403 m!5207))

(declare-fun m!5209 () Bool)

(assert (=> b!4403 m!5209))

(declare-fun m!5211 () Bool)

(assert (=> b!4399 m!5211))

(declare-fun m!5213 () Bool)

(assert (=> b!4399 m!5213))

(declare-fun m!5215 () Bool)

(assert (=> b!4400 m!5215))

(declare-fun m!5217 () Bool)

(assert (=> b!4398 m!5217))

(declare-fun m!5219 () Bool)

(assert (=> start!1084 m!5219))

(declare-fun m!5221 () Bool)

(assert (=> start!1084 m!5221))

(declare-fun m!5223 () Bool)

(assert (=> b!4401 m!5223))

(check-sat (not b!4403) (not b!4404) (not start!1084) (not b!4400) (not b!4399) (not b!4401) (not b!4398))
