; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38926 () Bool)

(assert start!38926)

(declare-fun b!175219 () Bool)

(declare-fun res!145097 () Bool)

(declare-fun e!122182 () Bool)

(assert (=> b!175219 (=> (not res!145097) (not e!122182))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((array!9436 0))(
  ( (array!9437 (arr!5093 (Array (_ BitVec 32) (_ BitVec 8))) (size!4163 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7434 0))(
  ( (BitStream!7435 (buf!4600 array!9436) (currentByte!8723 (_ BitVec 32)) (currentBit!8718 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7434)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!175219 (= res!145097 (validate_offset_bits!1 ((_ sign_extend 32) (size!4163 (buf!4600 thiss!1204))) ((_ sign_extend 32) (currentByte!8723 thiss!1204)) ((_ sign_extend 32) (currentBit!8718 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!175220 () Bool)

(declare-fun res!145096 () Bool)

(assert (=> b!175220 (=> (not res!145096) (not e!122182))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!175220 (= res!145096 (invariant!0 (currentBit!8718 thiss!1204) (currentByte!8723 thiss!1204) (size!4163 (buf!4600 thiss!1204))))))

(declare-fun b!175222 () Bool)

(declare-fun e!122181 () Bool)

(declare-fun array_inv!3904 (array!9436) Bool)

(assert (=> b!175222 (= e!122181 (array_inv!3904 (buf!4600 thiss!1204)))))

(declare-fun b!175223 () Bool)

(declare-fun e!122179 () Bool)

(assert (=> b!175223 (= e!122182 e!122179)))

(declare-fun res!145095 () Bool)

(assert (=> b!175223 (=> (not res!145095) (not e!122179))))

(declare-fun lt!270376 () (_ BitVec 64))

(assert (=> b!175223 (= res!145095 (= lt!270376 (bvsub (bvadd lt!270376 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175223 (= lt!270376 (bitIndex!0 (size!4163 (buf!4600 thiss!1204)) (currentByte!8723 thiss!1204) (currentBit!8718 thiss!1204)))))

(declare-fun b!175224 () Bool)

(assert (=> b!175224 (= e!122179 (not true))))

(declare-fun isPrefixOf!0 (BitStream!7434 BitStream!7434) Bool)

(assert (=> b!175224 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!12634 0))(
  ( (Unit!12635) )
))
(declare-fun lt!270377 () Unit!12634)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7434) Unit!12634)

(assert (=> b!175224 (= lt!270377 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun res!145098 () Bool)

(assert (=> start!38926 (=> (not res!145098) (not e!122182))))

(assert (=> start!38926 (= res!145098 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!38926 e!122182))

(assert (=> start!38926 true))

(declare-fun inv!12 (BitStream!7434) Bool)

(assert (=> start!38926 (and (inv!12 thiss!1204) e!122181)))

(declare-fun b!175221 () Bool)

(declare-fun res!145094 () Bool)

(assert (=> b!175221 (=> (not res!145094) (not e!122182))))

(assert (=> b!175221 (= res!145094 (= i!590 nBits!348))))

(assert (= (and start!38926 res!145098) b!175219))

(assert (= (and b!175219 res!145097) b!175220))

(assert (= (and b!175220 res!145096) b!175221))

(assert (= (and b!175221 res!145094) b!175223))

(assert (= (and b!175223 res!145095) b!175224))

(assert (= start!38926 b!175222))

(declare-fun m!275427 () Bool)

(assert (=> b!175219 m!275427))

(declare-fun m!275429 () Bool)

(assert (=> b!175222 m!275429))

(declare-fun m!275431 () Bool)

(assert (=> b!175224 m!275431))

(declare-fun m!275433 () Bool)

(assert (=> b!175224 m!275433))

(declare-fun m!275435 () Bool)

(assert (=> b!175220 m!275435))

(declare-fun m!275437 () Bool)

(assert (=> b!175223 m!275437))

(declare-fun m!275439 () Bool)

(assert (=> start!38926 m!275439))

(check-sat (not b!175224) (not b!175222) (not b!175223) (not b!175220) (not start!38926) (not b!175219))
(check-sat)
