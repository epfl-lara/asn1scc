; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38920 () Bool)

(assert start!38920)

(declare-fun b!175165 () Bool)

(declare-fun e!122144 () Bool)

(declare-datatypes ((array!9430 0))(
  ( (array!9431 (arr!5090 (Array (_ BitVec 32) (_ BitVec 8))) (size!4160 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7428 0))(
  ( (BitStream!7429 (buf!4597 array!9430) (currentByte!8720 (_ BitVec 32)) (currentBit!8715 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7428)

(declare-fun array_inv!3901 (array!9430) Bool)

(assert (=> b!175165 (= e!122144 (array_inv!3901 (buf!4597 thiss!1204)))))

(declare-fun b!175166 () Bool)

(declare-fun e!122146 () Bool)

(assert (=> b!175166 (= e!122146 (not true))))

(declare-fun isPrefixOf!0 (BitStream!7428 BitStream!7428) Bool)

(assert (=> b!175166 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!12628 0))(
  ( (Unit!12629) )
))
(declare-fun lt!270358 () Unit!12628)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7428) Unit!12628)

(assert (=> b!175166 (= lt!270358 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun res!145052 () Bool)

(declare-fun e!122145 () Bool)

(assert (=> start!38920 (=> (not res!145052) (not e!122145))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!38920 (= res!145052 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!38920 e!122145))

(assert (=> start!38920 true))

(declare-fun inv!12 (BitStream!7428) Bool)

(assert (=> start!38920 (and (inv!12 thiss!1204) e!122144)))

(declare-fun b!175167 () Bool)

(assert (=> b!175167 (= e!122145 e!122146)))

(declare-fun res!145049 () Bool)

(assert (=> b!175167 (=> (not res!145049) (not e!122146))))

(declare-fun lt!270359 () (_ BitVec 64))

(assert (=> b!175167 (= res!145049 (= lt!270359 (bvsub (bvadd lt!270359 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175167 (= lt!270359 (bitIndex!0 (size!4160 (buf!4597 thiss!1204)) (currentByte!8720 thiss!1204) (currentBit!8715 thiss!1204)))))

(declare-fun b!175168 () Bool)

(declare-fun res!145053 () Bool)

(assert (=> b!175168 (=> (not res!145053) (not e!122145))))

(assert (=> b!175168 (= res!145053 (= i!590 nBits!348))))

(declare-fun b!175169 () Bool)

(declare-fun res!145050 () Bool)

(assert (=> b!175169 (=> (not res!145050) (not e!122145))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!175169 (= res!145050 (validate_offset_bits!1 ((_ sign_extend 32) (size!4160 (buf!4597 thiss!1204))) ((_ sign_extend 32) (currentByte!8720 thiss!1204)) ((_ sign_extend 32) (currentBit!8715 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!175170 () Bool)

(declare-fun res!145051 () Bool)

(assert (=> b!175170 (=> (not res!145051) (not e!122145))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!175170 (= res!145051 (invariant!0 (currentBit!8715 thiss!1204) (currentByte!8720 thiss!1204) (size!4160 (buf!4597 thiss!1204))))))

(assert (= (and start!38920 res!145052) b!175169))

(assert (= (and b!175169 res!145050) b!175170))

(assert (= (and b!175170 res!145051) b!175168))

(assert (= (and b!175168 res!145053) b!175167))

(assert (= (and b!175167 res!145049) b!175166))

(assert (= start!38920 b!175165))

(declare-fun m!275385 () Bool)

(assert (=> start!38920 m!275385))

(declare-fun m!275387 () Bool)

(assert (=> b!175166 m!275387))

(declare-fun m!275389 () Bool)

(assert (=> b!175166 m!275389))

(declare-fun m!275391 () Bool)

(assert (=> b!175169 m!275391))

(declare-fun m!275393 () Bool)

(assert (=> b!175165 m!275393))

(declare-fun m!275395 () Bool)

(assert (=> b!175167 m!275395))

(declare-fun m!275397 () Bool)

(assert (=> b!175170 m!275397))

(check-sat (not b!175170) (not start!38920) (not b!175169) (not b!175166) (not b!175165) (not b!175167))
