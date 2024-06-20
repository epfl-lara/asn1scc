; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!888 () Bool)

(assert start!888)

(declare-fun b!3237 () Bool)

(declare-fun e!2189 () Bool)

(declare-fun e!2192 () Bool)

(assert (=> b!3237 (= e!2189 e!2192)))

(declare-fun res!4823 () Bool)

(assert (=> b!3237 (=> (not res!4823) (not e!2192))))

(declare-datatypes ((array!277 0))(
  ( (array!278 (arr!501 (Array (_ BitVec 32) (_ BitVec 8))) (size!114 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!206 0))(
  ( (BitStream!207 (buf!429 array!277) (currentByte!1396 (_ BitVec 32)) (currentBit!1391 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!230 0))(
  ( (Unit!231) )
))
(declare-datatypes ((tuple2!316 0))(
  ( (tuple2!317 (_1!168 Unit!230) (_2!168 BitStream!206)) )
))
(declare-fun lt!3462 () tuple2!316)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!3237 (= res!4823 (invariant!0 (currentBit!1391 (_2!168 lt!3462)) (currentByte!1396 (_2!168 lt!3462)) (size!114 (buf!429 (_2!168 lt!3462)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!277)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun thiss!1486 () BitStream!206)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!206 array!277 (_ BitVec 64) (_ BitVec 64)) tuple2!316)

(assert (=> b!3237 (= lt!3462 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun res!4825 () Bool)

(assert (=> start!888 (=> (not res!4825) (not e!2189))))

(assert (=> start!888 (= res!4825 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!114 srcBuffer!6))))))))

(assert (=> start!888 e!2189))

(assert (=> start!888 true))

(declare-fun array_inv!109 (array!277) Bool)

(assert (=> start!888 (array_inv!109 srcBuffer!6)))

(declare-fun e!2190 () Bool)

(declare-fun inv!12 (BitStream!206) Bool)

(assert (=> start!888 (and (inv!12 thiss!1486) e!2190)))

(declare-fun b!3238 () Bool)

(declare-fun res!4824 () Bool)

(assert (=> b!3238 (=> (not res!4824) (not e!2192))))

(declare-fun isPrefixOf!0 (BitStream!206 BitStream!206) Bool)

(assert (=> b!3238 (= res!4824 (isPrefixOf!0 thiss!1486 (_2!168 lt!3462)))))

(declare-fun b!3239 () Bool)

(declare-fun res!4820 () Bool)

(assert (=> b!3239 (=> (not res!4820) (not e!2192))))

(assert (=> b!3239 (= res!4820 (= (size!114 (buf!429 thiss!1486)) (size!114 (buf!429 (_2!168 lt!3462)))))))

(declare-fun b!3240 () Bool)

(declare-fun res!4821 () Bool)

(assert (=> b!3240 (=> (not res!4821) (not e!2192))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!3240 (= res!4821 (= (bitIndex!0 (size!114 (buf!429 (_2!168 lt!3462))) (currentByte!1396 (_2!168 lt!3462)) (currentBit!1391 (_2!168 lt!3462))) (bvadd (bitIndex!0 (size!114 (buf!429 thiss!1486)) (currentByte!1396 thiss!1486) (currentBit!1391 thiss!1486)) nBits!460)))))

(declare-fun b!3241 () Bool)

(assert (=> b!3241 (= e!2190 (array_inv!109 (buf!429 thiss!1486)))))

(declare-fun b!3242 () Bool)

(declare-fun res!4822 () Bool)

(assert (=> b!3242 (=> (not res!4822) (not e!2189))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!3242 (= res!4822 (validate_offset_bits!1 ((_ sign_extend 32) (size!114 (buf!429 thiss!1486))) ((_ sign_extend 32) (currentByte!1396 thiss!1486)) ((_ sign_extend 32) (currentBit!1391 thiss!1486)) nBits!460))))

(declare-fun b!3243 () Bool)

(assert (=> b!3243 (= e!2192 (not true))))

(declare-datatypes ((tuple2!318 0))(
  ( (tuple2!319 (_1!169 array!277) (_2!169 BitStream!206)) )
))
(declare-fun lt!3461 () tuple2!318)

(declare-datatypes ((tuple2!320 0))(
  ( (tuple2!321 (_1!170 BitStream!206) (_2!170 BitStream!206)) )
))
(declare-fun lt!3463 () tuple2!320)

(declare-fun readBits!0 (BitStream!206 (_ BitVec 64)) tuple2!318)

(assert (=> b!3243 (= lt!3461 (readBits!0 (_1!170 lt!3463) nBits!460))))

(assert (=> b!3243 (validate_offset_bits!1 ((_ sign_extend 32) (size!114 (buf!429 (_2!168 lt!3462)))) ((_ sign_extend 32) (currentByte!1396 thiss!1486)) ((_ sign_extend 32) (currentBit!1391 thiss!1486)) nBits!460)))

(declare-fun lt!3464 () Unit!230)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!206 array!277 (_ BitVec 64)) Unit!230)

(assert (=> b!3243 (= lt!3464 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!429 (_2!168 lt!3462)) nBits!460))))

(declare-fun reader!0 (BitStream!206 BitStream!206) tuple2!320)

(assert (=> b!3243 (= lt!3463 (reader!0 thiss!1486 (_2!168 lt!3462)))))

(assert (= (and start!888 res!4825) b!3242))

(assert (= (and b!3242 res!4822) b!3237))

(assert (= (and b!3237 res!4823) b!3239))

(assert (= (and b!3239 res!4820) b!3240))

(assert (= (and b!3240 res!4821) b!3238))

(assert (= (and b!3238 res!4824) b!3243))

(assert (= start!888 b!3241))

(declare-fun m!3397 () Bool)

(assert (=> b!3241 m!3397))

(declare-fun m!3399 () Bool)

(assert (=> b!3240 m!3399))

(declare-fun m!3401 () Bool)

(assert (=> b!3240 m!3401))

(declare-fun m!3403 () Bool)

(assert (=> b!3242 m!3403))

(declare-fun m!3405 () Bool)

(assert (=> b!3237 m!3405))

(declare-fun m!3407 () Bool)

(assert (=> b!3237 m!3407))

(declare-fun m!3409 () Bool)

(assert (=> b!3238 m!3409))

(declare-fun m!3411 () Bool)

(assert (=> start!888 m!3411))

(declare-fun m!3413 () Bool)

(assert (=> start!888 m!3413))

(declare-fun m!3415 () Bool)

(assert (=> b!3243 m!3415))

(declare-fun m!3417 () Bool)

(assert (=> b!3243 m!3417))

(declare-fun m!3419 () Bool)

(assert (=> b!3243 m!3419))

(declare-fun m!3421 () Bool)

(assert (=> b!3243 m!3421))

(push 1)

(assert (not b!3241))

(assert (not b!3242))

(assert (not b!3240))

(assert (not start!888))

(assert (not b!3237))

(assert (not b!3243))

(assert (not b!3238))

(check-sat)

(pop 1)

