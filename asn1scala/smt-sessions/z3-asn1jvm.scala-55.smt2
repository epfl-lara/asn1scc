; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1090 () Bool)

(assert start!1090)

(declare-fun b!4461 () Bool)

(declare-fun res!5818 () Bool)

(declare-fun e!2917 () Bool)

(assert (=> b!4461 (=> (not res!5818) (not e!2917))))

(declare-datatypes ((array!353 0))(
  ( (array!354 (arr!539 (Array (_ BitVec 32) (_ BitVec 8))) (size!149 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!276 0))(
  ( (BitStream!277 (buf!470 array!353) (currentByte!1449 (_ BitVec 32)) (currentBit!1444 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!276)

(declare-datatypes ((Unit!348 0))(
  ( (Unit!349) )
))
(declare-datatypes ((tuple2!538 0))(
  ( (tuple2!539 (_1!285 Unit!348) (_2!285 BitStream!276)) )
))
(declare-fun lt!5464 () tuple2!538)

(assert (=> b!4461 (= res!5818 (= (size!149 (buf!470 thiss!1486)) (size!149 (buf!470 (_2!285 lt!5464)))))))

(declare-fun b!4462 () Bool)

(declare-fun e!2918 () Bool)

(declare-fun array_inv!144 (array!353) Bool)

(assert (=> b!4462 (= e!2918 (array_inv!144 (buf!470 thiss!1486)))))

(declare-fun b!4463 () Bool)

(declare-fun res!5816 () Bool)

(declare-fun e!2920 () Bool)

(assert (=> b!4463 (=> (not res!5816) (not e!2920))))

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!4463 (= res!5816 (validate_offset_bits!1 ((_ sign_extend 32) (size!149 (buf!470 thiss!1486))) ((_ sign_extend 32) (currentByte!1449 thiss!1486)) ((_ sign_extend 32) (currentBit!1444 thiss!1486)) nBits!460))))

(declare-fun b!4464 () Bool)

(assert (=> b!4464 (= e!2920 e!2917)))

(declare-fun res!5813 () Bool)

(assert (=> b!4464 (=> (not res!5813) (not e!2917))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!4464 (= res!5813 (invariant!0 (currentBit!1444 (_2!285 lt!5464)) (currentByte!1449 (_2!285 lt!5464)) (size!149 (buf!470 (_2!285 lt!5464)))))))

(declare-fun srcBuffer!6 () array!353)

(declare-fun from!367 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!276 array!353 (_ BitVec 64) (_ BitVec 64)) tuple2!538)

(assert (=> b!4464 (= lt!5464 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!4465 () Bool)

(declare-fun res!5817 () Bool)

(assert (=> b!4465 (=> (not res!5817) (not e!2917))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!4465 (= res!5817 (= (bitIndex!0 (size!149 (buf!470 (_2!285 lt!5464))) (currentByte!1449 (_2!285 lt!5464)) (currentBit!1444 (_2!285 lt!5464))) (bvadd (bitIndex!0 (size!149 (buf!470 thiss!1486)) (currentByte!1449 thiss!1486) (currentBit!1444 thiss!1486)) nBits!460)))))

(declare-fun res!5814 () Bool)

(assert (=> start!1090 (=> (not res!5814) (not e!2920))))

(assert (=> start!1090 (= res!5814 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!149 srcBuffer!6))))))))

(assert (=> start!1090 e!2920))

(assert (=> start!1090 true))

(assert (=> start!1090 (array_inv!144 srcBuffer!6)))

(declare-fun inv!12 (BitStream!276) Bool)

(assert (=> start!1090 (and (inv!12 thiss!1486) e!2918)))

(declare-fun b!4466 () Bool)

(assert (=> b!4466 (= e!2917 (not true))))

(declare-datatypes ((tuple2!540 0))(
  ( (tuple2!541 (_1!286 BitStream!276) (_2!286 BitStream!276)) )
))
(declare-fun lt!5462 () tuple2!540)

(declare-datatypes ((List!49 0))(
  ( (Nil!46) (Cons!45 (h!164 Bool) (t!799 List!49)) )
))
(declare-fun lt!5461 () List!49)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!276 BitStream!276 (_ BitVec 64)) List!49)

(assert (=> b!4466 (= lt!5461 (bitStreamReadBitsIntoList!0 (_2!285 lt!5464) (_1!286 lt!5462) nBits!460))))

(declare-datatypes ((tuple2!542 0))(
  ( (tuple2!543 (_1!287 array!353) (_2!287 BitStream!276)) )
))
(declare-fun lt!5465 () tuple2!542)

(declare-fun readBits!0 (BitStream!276 (_ BitVec 64)) tuple2!542)

(assert (=> b!4466 (= lt!5465 (readBits!0 (_1!286 lt!5462) nBits!460))))

(assert (=> b!4466 (validate_offset_bits!1 ((_ sign_extend 32) (size!149 (buf!470 (_2!285 lt!5464)))) ((_ sign_extend 32) (currentByte!1449 thiss!1486)) ((_ sign_extend 32) (currentBit!1444 thiss!1486)) nBits!460)))

(declare-fun lt!5463 () Unit!348)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!276 array!353 (_ BitVec 64)) Unit!348)

(assert (=> b!4466 (= lt!5463 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!470 (_2!285 lt!5464)) nBits!460))))

(declare-fun reader!0 (BitStream!276 BitStream!276) tuple2!540)

(assert (=> b!4466 (= lt!5462 (reader!0 thiss!1486 (_2!285 lt!5464)))))

(declare-fun b!4467 () Bool)

(declare-fun res!5815 () Bool)

(assert (=> b!4467 (=> (not res!5815) (not e!2917))))

(declare-fun isPrefixOf!0 (BitStream!276 BitStream!276) Bool)

(assert (=> b!4467 (= res!5815 (isPrefixOf!0 thiss!1486 (_2!285 lt!5464)))))

(assert (= (and start!1090 res!5814) b!4463))

(assert (= (and b!4463 res!5816) b!4464))

(assert (= (and b!4464 res!5813) b!4461))

(assert (= (and b!4461 res!5818) b!4465))

(assert (= (and b!4465 res!5817) b!4467))

(assert (= (and b!4467 res!5815) b!4466))

(assert (= start!1090 b!4462))

(declare-fun m!5281 () Bool)

(assert (=> start!1090 m!5281))

(declare-fun m!5283 () Bool)

(assert (=> start!1090 m!5283))

(declare-fun m!5285 () Bool)

(assert (=> b!4462 m!5285))

(declare-fun m!5287 () Bool)

(assert (=> b!4467 m!5287))

(declare-fun m!5289 () Bool)

(assert (=> b!4464 m!5289))

(declare-fun m!5291 () Bool)

(assert (=> b!4464 m!5291))

(declare-fun m!5293 () Bool)

(assert (=> b!4463 m!5293))

(declare-fun m!5295 () Bool)

(assert (=> b!4466 m!5295))

(declare-fun m!5297 () Bool)

(assert (=> b!4466 m!5297))

(declare-fun m!5299 () Bool)

(assert (=> b!4466 m!5299))

(declare-fun m!5301 () Bool)

(assert (=> b!4466 m!5301))

(declare-fun m!5303 () Bool)

(assert (=> b!4466 m!5303))

(declare-fun m!5305 () Bool)

(assert (=> b!4465 m!5305))

(declare-fun m!5307 () Bool)

(assert (=> b!4465 m!5307))

(check-sat (not b!4464) (not start!1090) (not b!4466) (not b!4462) (not b!4467) (not b!4465) (not b!4463))
