; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!958 () Bool)

(assert start!958)

(declare-fun b!3555 () Bool)

(declare-fun res!5092 () Bool)

(declare-fun e!2347 () Bool)

(assert (=> b!3555 (=> (not res!5092) (not e!2347))))

(declare-datatypes ((array!290 0))(
  ( (array!291 (arr!506 (Array (_ BitVec 32) (_ BitVec 8))) (size!119 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!216 0))(
  ( (BitStream!217 (buf!437 array!290) (currentByte!1410 (_ BitVec 32)) (currentBit!1405 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!264 0))(
  ( (Unit!265) )
))
(declare-datatypes ((tuple2!346 0))(
  ( (tuple2!347 (_1!186 Unit!264) (_2!186 BitStream!216)) )
))
(declare-fun lt!4265 () tuple2!346)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun thiss!1486 () BitStream!216)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!3555 (= res!5092 (= (bitIndex!0 (size!119 (buf!437 (_2!186 lt!4265))) (currentByte!1410 (_2!186 lt!4265)) (currentBit!1405 (_2!186 lt!4265))) (bvadd (bitIndex!0 (size!119 (buf!437 thiss!1486)) (currentByte!1410 thiss!1486) (currentBit!1405 thiss!1486)) nBits!460)))))

(declare-fun b!3556 () Bool)

(declare-fun res!5087 () Bool)

(assert (=> b!3556 (=> (not res!5087) (not e!2347))))

(declare-fun isPrefixOf!0 (BitStream!216 BitStream!216) Bool)

(assert (=> b!3556 (= res!5087 (isPrefixOf!0 thiss!1486 (_2!186 lt!4265)))))

(declare-fun b!3557 () Bool)

(assert (=> b!3557 (= e!2347 (not true))))

(declare-datatypes ((List!19 0))(
  ( (Nil!16) (Cons!15 (h!134 Bool) (t!769 List!19)) )
))
(declare-fun lt!4264 () List!19)

(declare-datatypes ((tuple2!348 0))(
  ( (tuple2!349 (_1!187 BitStream!216) (_2!187 BitStream!216)) )
))
(declare-fun lt!4267 () tuple2!348)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!216 BitStream!216 (_ BitVec 64)) List!19)

(assert (=> b!3557 (= lt!4264 (bitStreamReadBitsIntoList!0 (_2!186 lt!4265) (_1!187 lt!4267) nBits!460))))

(declare-datatypes ((tuple2!350 0))(
  ( (tuple2!351 (_1!188 array!290) (_2!188 BitStream!216)) )
))
(declare-fun lt!4268 () tuple2!350)

(declare-fun readBits!0 (BitStream!216 (_ BitVec 64)) tuple2!350)

(assert (=> b!3557 (= lt!4268 (readBits!0 (_1!187 lt!4267) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!3557 (validate_offset_bits!1 ((_ sign_extend 32) (size!119 (buf!437 (_2!186 lt!4265)))) ((_ sign_extend 32) (currentByte!1410 thiss!1486)) ((_ sign_extend 32) (currentBit!1405 thiss!1486)) nBits!460)))

(declare-fun lt!4266 () Unit!264)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!216 array!290 (_ BitVec 64)) Unit!264)

(assert (=> b!3557 (= lt!4266 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!437 (_2!186 lt!4265)) nBits!460))))

(declare-fun reader!0 (BitStream!216 BitStream!216) tuple2!348)

(assert (=> b!3557 (= lt!4267 (reader!0 thiss!1486 (_2!186 lt!4265)))))

(declare-fun b!3558 () Bool)

(declare-fun e!2351 () Bool)

(declare-fun array_inv!114 (array!290) Bool)

(assert (=> b!3558 (= e!2351 (array_inv!114 (buf!437 thiss!1486)))))

(declare-fun b!3559 () Bool)

(declare-fun e!2349 () Bool)

(assert (=> b!3559 (= e!2349 e!2347)))

(declare-fun res!5089 () Bool)

(assert (=> b!3559 (=> (not res!5089) (not e!2347))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!3559 (= res!5089 (invariant!0 (currentBit!1405 (_2!186 lt!4265)) (currentByte!1410 (_2!186 lt!4265)) (size!119 (buf!437 (_2!186 lt!4265)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!290)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!216 array!290 (_ BitVec 64) (_ BitVec 64)) tuple2!346)

(assert (=> b!3559 (= lt!4265 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!3560 () Bool)

(declare-fun res!5091 () Bool)

(assert (=> b!3560 (=> (not res!5091) (not e!2347))))

(assert (=> b!3560 (= res!5091 (= (size!119 (buf!437 thiss!1486)) (size!119 (buf!437 (_2!186 lt!4265)))))))

(declare-fun b!3561 () Bool)

(declare-fun res!5090 () Bool)

(assert (=> b!3561 (=> (not res!5090) (not e!2349))))

(assert (=> b!3561 (= res!5090 (validate_offset_bits!1 ((_ sign_extend 32) (size!119 (buf!437 thiss!1486))) ((_ sign_extend 32) (currentByte!1410 thiss!1486)) ((_ sign_extend 32) (currentBit!1405 thiss!1486)) nBits!460))))

(declare-fun res!5088 () Bool)

(assert (=> start!958 (=> (not res!5088) (not e!2349))))

(assert (=> start!958 (= res!5088 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!119 srcBuffer!6))))))))

(assert (=> start!958 e!2349))

(assert (=> start!958 true))

(assert (=> start!958 (array_inv!114 srcBuffer!6)))

(declare-fun inv!12 (BitStream!216) Bool)

(assert (=> start!958 (and (inv!12 thiss!1486) e!2351)))

(assert (= (and start!958 res!5088) b!3561))

(assert (= (and b!3561 res!5090) b!3559))

(assert (= (and b!3559 res!5089) b!3560))

(assert (= (and b!3560 res!5091) b!3555))

(assert (= (and b!3555 res!5092) b!3556))

(assert (= (and b!3556 res!5087) b!3557))

(assert (= start!958 b!3558))

(declare-fun m!3961 () Bool)

(assert (=> b!3559 m!3961))

(declare-fun m!3963 () Bool)

(assert (=> b!3559 m!3963))

(declare-fun m!3965 () Bool)

(assert (=> b!3558 m!3965))

(declare-fun m!3967 () Bool)

(assert (=> b!3557 m!3967))

(declare-fun m!3969 () Bool)

(assert (=> b!3557 m!3969))

(declare-fun m!3971 () Bool)

(assert (=> b!3557 m!3971))

(declare-fun m!3973 () Bool)

(assert (=> b!3557 m!3973))

(declare-fun m!3975 () Bool)

(assert (=> b!3557 m!3975))

(declare-fun m!3977 () Bool)

(assert (=> b!3556 m!3977))

(declare-fun m!3979 () Bool)

(assert (=> start!958 m!3979))

(declare-fun m!3981 () Bool)

(assert (=> start!958 m!3981))

(declare-fun m!3983 () Bool)

(assert (=> b!3555 m!3983))

(declare-fun m!3985 () Bool)

(assert (=> b!3555 m!3985))

(declare-fun m!3987 () Bool)

(assert (=> b!3561 m!3987))

(check-sat (not b!3555) (not b!3561) (not b!3558) (not b!3559) (not b!3556) (not b!3557) (not start!958))
