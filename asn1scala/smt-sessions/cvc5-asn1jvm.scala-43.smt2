; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!884 () Bool)

(assert start!884)

(declare-fun b!3195 () Bool)

(declare-fun e!2161 () Bool)

(declare-datatypes ((array!273 0))(
  ( (array!274 (arr!499 (Array (_ BitVec 32) (_ BitVec 8))) (size!112 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!202 0))(
  ( (BitStream!203 (buf!427 array!273) (currentByte!1394 (_ BitVec 32)) (currentBit!1389 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!202)

(declare-fun array_inv!107 (array!273) Bool)

(assert (=> b!3195 (= e!2161 (array_inv!107 (buf!427 thiss!1486)))))

(declare-fun res!4787 () Bool)

(declare-fun e!2162 () Bool)

(assert (=> start!884 (=> (not res!4787) (not e!2162))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!273)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!884 (= res!4787 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!112 srcBuffer!6))))))))

(assert (=> start!884 e!2162))

(assert (=> start!884 true))

(assert (=> start!884 (array_inv!107 srcBuffer!6)))

(declare-fun inv!12 (BitStream!202) Bool)

(assert (=> start!884 (and (inv!12 thiss!1486) e!2161)))

(declare-fun b!3196 () Bool)

(declare-fun res!4789 () Bool)

(declare-fun e!2160 () Bool)

(assert (=> b!3196 (=> (not res!4789) (not e!2160))))

(declare-datatypes ((Unit!226 0))(
  ( (Unit!227) )
))
(declare-datatypes ((tuple2!304 0))(
  ( (tuple2!305 (_1!162 Unit!226) (_2!162 BitStream!202)) )
))
(declare-fun lt!3439 () tuple2!304)

(declare-fun isPrefixOf!0 (BitStream!202 BitStream!202) Bool)

(assert (=> b!3196 (= res!4789 (isPrefixOf!0 thiss!1486 (_2!162 lt!3439)))))

(declare-fun b!3197 () Bool)

(declare-fun res!4784 () Bool)

(assert (=> b!3197 (=> (not res!4784) (not e!2160))))

(assert (=> b!3197 (= res!4784 (= (size!112 (buf!427 thiss!1486)) (size!112 (buf!427 (_2!162 lt!3439)))))))

(declare-fun b!3198 () Bool)

(declare-fun res!4785 () Bool)

(assert (=> b!3198 (=> (not res!4785) (not e!2160))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!3198 (= res!4785 (= (bitIndex!0 (size!112 (buf!427 (_2!162 lt!3439))) (currentByte!1394 (_2!162 lt!3439)) (currentBit!1389 (_2!162 lt!3439))) (bvadd (bitIndex!0 (size!112 (buf!427 thiss!1486)) (currentByte!1394 thiss!1486) (currentBit!1389 thiss!1486)) nBits!460)))))

(declare-fun b!3199 () Bool)

(assert (=> b!3199 (= e!2160 (not true))))

(declare-datatypes ((tuple2!306 0))(
  ( (tuple2!307 (_1!163 array!273) (_2!163 BitStream!202)) )
))
(declare-fun lt!3438 () tuple2!306)

(declare-datatypes ((tuple2!308 0))(
  ( (tuple2!309 (_1!164 BitStream!202) (_2!164 BitStream!202)) )
))
(declare-fun lt!3437 () tuple2!308)

(declare-fun readBits!0 (BitStream!202 (_ BitVec 64)) tuple2!306)

(assert (=> b!3199 (= lt!3438 (readBits!0 (_1!164 lt!3437) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!3199 (validate_offset_bits!1 ((_ sign_extend 32) (size!112 (buf!427 (_2!162 lt!3439)))) ((_ sign_extend 32) (currentByte!1394 thiss!1486)) ((_ sign_extend 32) (currentBit!1389 thiss!1486)) nBits!460)))

(declare-fun lt!3440 () Unit!226)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!202 array!273 (_ BitVec 64)) Unit!226)

(assert (=> b!3199 (= lt!3440 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!427 (_2!162 lt!3439)) nBits!460))))

(declare-fun reader!0 (BitStream!202 BitStream!202) tuple2!308)

(assert (=> b!3199 (= lt!3437 (reader!0 thiss!1486 (_2!162 lt!3439)))))

(declare-fun b!3200 () Bool)

(declare-fun res!4786 () Bool)

(assert (=> b!3200 (=> (not res!4786) (not e!2162))))

(assert (=> b!3200 (= res!4786 (validate_offset_bits!1 ((_ sign_extend 32) (size!112 (buf!427 thiss!1486))) ((_ sign_extend 32) (currentByte!1394 thiss!1486)) ((_ sign_extend 32) (currentBit!1389 thiss!1486)) nBits!460))))

(declare-fun b!3201 () Bool)

(assert (=> b!3201 (= e!2162 e!2160)))

(declare-fun res!4788 () Bool)

(assert (=> b!3201 (=> (not res!4788) (not e!2160))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!3201 (= res!4788 (invariant!0 (currentBit!1389 (_2!162 lt!3439)) (currentByte!1394 (_2!162 lt!3439)) (size!112 (buf!427 (_2!162 lt!3439)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!202 array!273 (_ BitVec 64) (_ BitVec 64)) tuple2!304)

(assert (=> b!3201 (= lt!3439 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(assert (= (and start!884 res!4787) b!3200))

(assert (= (and b!3200 res!4786) b!3201))

(assert (= (and b!3201 res!4788) b!3197))

(assert (= (and b!3197 res!4784) b!3198))

(assert (= (and b!3198 res!4785) b!3196))

(assert (= (and b!3196 res!4789) b!3199))

(assert (= start!884 b!3195))

(declare-fun m!3345 () Bool)

(assert (=> b!3201 m!3345))

(declare-fun m!3347 () Bool)

(assert (=> b!3201 m!3347))

(declare-fun m!3349 () Bool)

(assert (=> b!3195 m!3349))

(declare-fun m!3351 () Bool)

(assert (=> b!3196 m!3351))

(declare-fun m!3353 () Bool)

(assert (=> b!3200 m!3353))

(declare-fun m!3355 () Bool)

(assert (=> b!3198 m!3355))

(declare-fun m!3357 () Bool)

(assert (=> b!3198 m!3357))

(declare-fun m!3359 () Bool)

(assert (=> start!884 m!3359))

(declare-fun m!3361 () Bool)

(assert (=> start!884 m!3361))

(declare-fun m!3363 () Bool)

(assert (=> b!3199 m!3363))

(declare-fun m!3365 () Bool)

(assert (=> b!3199 m!3365))

(declare-fun m!3367 () Bool)

(assert (=> b!3199 m!3367))

(declare-fun m!3369 () Bool)

(assert (=> b!3199 m!3369))

(push 1)

(assert (not b!3195))

(assert (not b!3199))

(assert (not b!3200))

(assert (not b!3198))

(assert (not b!3196))

(assert (not b!3201))

(assert (not start!884))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

