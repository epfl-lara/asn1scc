; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38944 () Bool)

(assert start!38944)

(declare-fun b!175381 () Bool)

(declare-fun e!122289 () Bool)

(declare-datatypes ((array!9454 0))(
  ( (array!9455 (arr!5102 (Array (_ BitVec 32) (_ BitVec 8))) (size!4172 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7452 0))(
  ( (BitStream!7453 (buf!4609 array!9454) (currentByte!8732 (_ BitVec 32)) (currentBit!8727 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7452)

(declare-fun array_inv!3913 (array!9454) Bool)

(assert (=> b!175381 (= e!122289 (array_inv!3913 (buf!4609 thiss!1204)))))

(declare-fun b!175382 () Bool)

(declare-fun e!122287 () Bool)

(assert (=> b!175382 (= e!122287 (not true))))

(declare-datatypes ((tuple2!15090 0))(
  ( (tuple2!15091 (_1!8190 BitStream!7452) (_2!8190 BitStream!7452)) )
))
(declare-fun lt!270454 () tuple2!15090)

(declare-fun reader!0 (BitStream!7452 BitStream!7452) tuple2!15090)

(assert (=> b!175382 (= lt!270454 (reader!0 thiss!1204 thiss!1204))))

(declare-fun isPrefixOf!0 (BitStream!7452 BitStream!7452) Bool)

(assert (=> b!175382 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!12652 0))(
  ( (Unit!12653) )
))
(declare-fun lt!270453 () Unit!12652)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7452) Unit!12652)

(assert (=> b!175382 (= lt!270453 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!175383 () Bool)

(declare-fun res!145232 () Bool)

(declare-fun e!122288 () Bool)

(assert (=> b!175383 (=> (not res!145232) (not e!122288))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!175383 (= res!145232 (validate_offset_bits!1 ((_ sign_extend 32) (size!4172 (buf!4609 thiss!1204))) ((_ sign_extend 32) (currentByte!8732 thiss!1204)) ((_ sign_extend 32) (currentBit!8727 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!175384 () Bool)

(declare-fun res!145231 () Bool)

(assert (=> b!175384 (=> (not res!145231) (not e!122288))))

(assert (=> b!175384 (= res!145231 (= i!590 nBits!348))))

(declare-fun b!175385 () Bool)

(declare-fun res!145230 () Bool)

(assert (=> b!175385 (=> (not res!145230) (not e!122288))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!175385 (= res!145230 (invariant!0 (currentBit!8727 thiss!1204) (currentByte!8732 thiss!1204) (size!4172 (buf!4609 thiss!1204))))))

(declare-fun res!145233 () Bool)

(assert (=> start!38944 (=> (not res!145233) (not e!122288))))

(assert (=> start!38944 (= res!145233 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!38944 e!122288))

(assert (=> start!38944 true))

(declare-fun inv!12 (BitStream!7452) Bool)

(assert (=> start!38944 (and (inv!12 thiss!1204) e!122289)))

(declare-fun b!175386 () Bool)

(assert (=> b!175386 (= e!122288 e!122287)))

(declare-fun res!145229 () Bool)

(assert (=> b!175386 (=> (not res!145229) (not e!122287))))

(declare-fun lt!270455 () (_ BitVec 64))

(assert (=> b!175386 (= res!145229 (= lt!270455 (bvsub (bvadd lt!270455 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175386 (= lt!270455 (bitIndex!0 (size!4172 (buf!4609 thiss!1204)) (currentByte!8732 thiss!1204) (currentBit!8727 thiss!1204)))))

(assert (= (and start!38944 res!145233) b!175383))

(assert (= (and b!175383 res!145232) b!175385))

(assert (= (and b!175385 res!145230) b!175384))

(assert (= (and b!175384 res!145231) b!175386))

(assert (= (and b!175386 res!145229) b!175382))

(assert (= start!38944 b!175381))

(declare-fun m!275567 () Bool)

(assert (=> b!175385 m!275567))

(declare-fun m!275569 () Bool)

(assert (=> b!175386 m!275569))

(declare-fun m!275571 () Bool)

(assert (=> start!38944 m!275571))

(declare-fun m!275573 () Bool)

(assert (=> b!175383 m!275573))

(declare-fun m!275575 () Bool)

(assert (=> b!175382 m!275575))

(declare-fun m!275577 () Bool)

(assert (=> b!175382 m!275577))

(declare-fun m!275579 () Bool)

(assert (=> b!175382 m!275579))

(declare-fun m!275581 () Bool)

(assert (=> b!175381 m!275581))

(check-sat (not start!38944) (not b!175385) (not b!175386) (not b!175382) (not b!175383) (not b!175381))
