; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!886 () Bool)

(assert start!886)

(declare-fun b!3216 () Bool)

(declare-fun e!2177 () Bool)

(declare-fun e!2174 () Bool)

(assert (=> b!3216 (= e!2177 e!2174)))

(declare-fun res!4802 () Bool)

(assert (=> b!3216 (=> (not res!4802) (not e!2174))))

(declare-datatypes ((array!275 0))(
  ( (array!276 (arr!500 (Array (_ BitVec 32) (_ BitVec 8))) (size!113 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!204 0))(
  ( (BitStream!205 (buf!428 array!275) (currentByte!1395 (_ BitVec 32)) (currentBit!1390 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!228 0))(
  ( (Unit!229) )
))
(declare-datatypes ((tuple2!310 0))(
  ( (tuple2!311 (_1!165 Unit!228) (_2!165 BitStream!204)) )
))
(declare-fun lt!3452 () tuple2!310)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!3216 (= res!4802 (invariant!0 (currentBit!1390 (_2!165 lt!3452)) (currentByte!1395 (_2!165 lt!3452)) (size!113 (buf!428 (_2!165 lt!3452)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!275)

(declare-fun thiss!1486 () BitStream!204)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!204 array!275 (_ BitVec 64) (_ BitVec 64)) tuple2!310)

(assert (=> b!3216 (= lt!3452 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!3217 () Bool)

(declare-fun e!2175 () Bool)

(declare-fun array_inv!108 (array!275) Bool)

(assert (=> b!3217 (= e!2175 (array_inv!108 (buf!428 thiss!1486)))))

(declare-fun b!3218 () Bool)

(declare-fun res!4806 () Bool)

(assert (=> b!3218 (=> (not res!4806) (not e!2174))))

(assert (=> b!3218 (= res!4806 (= (size!113 (buf!428 thiss!1486)) (size!113 (buf!428 (_2!165 lt!3452)))))))

(declare-fun b!3219 () Bool)

(declare-fun res!4804 () Bool)

(assert (=> b!3219 (=> (not res!4804) (not e!2174))))

(declare-fun isPrefixOf!0 (BitStream!204 BitStream!204) Bool)

(assert (=> b!3219 (= res!4804 (isPrefixOf!0 thiss!1486 (_2!165 lt!3452)))))

(declare-fun res!4807 () Bool)

(assert (=> start!886 (=> (not res!4807) (not e!2177))))

(assert (=> start!886 (= res!4807 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!113 srcBuffer!6))))))))

(assert (=> start!886 e!2177))

(assert (=> start!886 true))

(assert (=> start!886 (array_inv!108 srcBuffer!6)))

(declare-fun inv!12 (BitStream!204) Bool)

(assert (=> start!886 (and (inv!12 thiss!1486) e!2175)))

(declare-fun b!3220 () Bool)

(declare-fun res!4803 () Bool)

(assert (=> b!3220 (=> (not res!4803) (not e!2174))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!3220 (= res!4803 (= (bitIndex!0 (size!113 (buf!428 (_2!165 lt!3452))) (currentByte!1395 (_2!165 lt!3452)) (currentBit!1390 (_2!165 lt!3452))) (bvadd (bitIndex!0 (size!113 (buf!428 thiss!1486)) (currentByte!1395 thiss!1486) (currentBit!1390 thiss!1486)) nBits!460)))))

(declare-fun b!3221 () Bool)

(assert (=> b!3221 (= e!2174 (not true))))

(declare-datatypes ((tuple2!312 0))(
  ( (tuple2!313 (_1!166 array!275) (_2!166 BitStream!204)) )
))
(declare-fun lt!3450 () tuple2!312)

(declare-datatypes ((tuple2!314 0))(
  ( (tuple2!315 (_1!167 BitStream!204) (_2!167 BitStream!204)) )
))
(declare-fun lt!3449 () tuple2!314)

(declare-fun readBits!0 (BitStream!204 (_ BitVec 64)) tuple2!312)

(assert (=> b!3221 (= lt!3450 (readBits!0 (_1!167 lt!3449) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!3221 (validate_offset_bits!1 ((_ sign_extend 32) (size!113 (buf!428 (_2!165 lt!3452)))) ((_ sign_extend 32) (currentByte!1395 thiss!1486)) ((_ sign_extend 32) (currentBit!1390 thiss!1486)) nBits!460)))

(declare-fun lt!3451 () Unit!228)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!204 array!275 (_ BitVec 64)) Unit!228)

(assert (=> b!3221 (= lt!3451 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!428 (_2!165 lt!3452)) nBits!460))))

(declare-fun reader!0 (BitStream!204 BitStream!204) tuple2!314)

(assert (=> b!3221 (= lt!3449 (reader!0 thiss!1486 (_2!165 lt!3452)))))

(declare-fun b!3222 () Bool)

(declare-fun res!4805 () Bool)

(assert (=> b!3222 (=> (not res!4805) (not e!2177))))

(assert (=> b!3222 (= res!4805 (validate_offset_bits!1 ((_ sign_extend 32) (size!113 (buf!428 thiss!1486))) ((_ sign_extend 32) (currentByte!1395 thiss!1486)) ((_ sign_extend 32) (currentBit!1390 thiss!1486)) nBits!460))))

(assert (= (and start!886 res!4807) b!3222))

(assert (= (and b!3222 res!4805) b!3216))

(assert (= (and b!3216 res!4802) b!3218))

(assert (= (and b!3218 res!4806) b!3220))

(assert (= (and b!3220 res!4803) b!3219))

(assert (= (and b!3219 res!4804) b!3221))

(assert (= start!886 b!3217))

(declare-fun m!3371 () Bool)

(assert (=> b!3217 m!3371))

(declare-fun m!3373 () Bool)

(assert (=> b!3220 m!3373))

(declare-fun m!3375 () Bool)

(assert (=> b!3220 m!3375))

(declare-fun m!3377 () Bool)

(assert (=> b!3222 m!3377))

(declare-fun m!3379 () Bool)

(assert (=> start!886 m!3379))

(declare-fun m!3381 () Bool)

(assert (=> start!886 m!3381))

(declare-fun m!3383 () Bool)

(assert (=> b!3221 m!3383))

(declare-fun m!3385 () Bool)

(assert (=> b!3221 m!3385))

(declare-fun m!3387 () Bool)

(assert (=> b!3221 m!3387))

(declare-fun m!3389 () Bool)

(assert (=> b!3221 m!3389))

(declare-fun m!3391 () Bool)

(assert (=> b!3219 m!3391))

(declare-fun m!3393 () Bool)

(assert (=> b!3216 m!3393))

(declare-fun m!3395 () Bool)

(assert (=> b!3216 m!3395))

(check-sat (not b!3222) (not b!3220) (not start!886) (not b!3221) (not b!3219) (not b!3217) (not b!3216))
