; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38950 () Bool)

(assert start!38950)

(declare-fun b!175435 () Bool)

(declare-fun res!145278 () Bool)

(declare-fun e!122326 () Bool)

(assert (=> b!175435 (=> (not res!145278) (not e!122326))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!175435 (= res!145278 (= i!590 nBits!348))))

(declare-fun b!175436 () Bool)

(declare-fun e!122324 () Bool)

(assert (=> b!175436 (= e!122326 e!122324)))

(declare-fun res!145276 () Bool)

(assert (=> b!175436 (=> (not res!145276) (not e!122324))))

(declare-fun lt!270482 () (_ BitVec 64))

(assert (=> b!175436 (= res!145276 (= lt!270482 (bvsub (bvadd lt!270482 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-datatypes ((array!9460 0))(
  ( (array!9461 (arr!5105 (Array (_ BitVec 32) (_ BitVec 8))) (size!4175 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7458 0))(
  ( (BitStream!7459 (buf!4612 array!9460) (currentByte!8735 (_ BitVec 32)) (currentBit!8730 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7458)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175436 (= lt!270482 (bitIndex!0 (size!4175 (buf!4612 thiss!1204)) (currentByte!8735 thiss!1204) (currentBit!8730 thiss!1204)))))

(declare-fun b!175437 () Bool)

(declare-fun res!145275 () Bool)

(assert (=> b!175437 (=> (not res!145275) (not e!122326))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!175437 (= res!145275 (invariant!0 (currentBit!8730 thiss!1204) (currentByte!8735 thiss!1204) (size!4175 (buf!4612 thiss!1204))))))

(declare-fun res!145274 () Bool)

(assert (=> start!38950 (=> (not res!145274) (not e!122326))))

(assert (=> start!38950 (= res!145274 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!38950 e!122326))

(assert (=> start!38950 true))

(declare-fun e!122325 () Bool)

(declare-fun inv!12 (BitStream!7458) Bool)

(assert (=> start!38950 (and (inv!12 thiss!1204) e!122325)))

(declare-fun b!175438 () Bool)

(assert (=> b!175438 (= e!122324 (not true))))

(declare-datatypes ((tuple2!15096 0))(
  ( (tuple2!15097 (_1!8193 BitStream!7458) (_2!8193 BitStream!7458)) )
))
(declare-fun lt!270481 () tuple2!15096)

(declare-fun reader!0 (BitStream!7458 BitStream!7458) tuple2!15096)

(assert (=> b!175438 (= lt!270481 (reader!0 thiss!1204 thiss!1204))))

(declare-fun isPrefixOf!0 (BitStream!7458 BitStream!7458) Bool)

(assert (=> b!175438 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!12658 0))(
  ( (Unit!12659) )
))
(declare-fun lt!270480 () Unit!12658)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7458) Unit!12658)

(assert (=> b!175438 (= lt!270480 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!175439 () Bool)

(declare-fun res!145277 () Bool)

(assert (=> b!175439 (=> (not res!145277) (not e!122326))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!175439 (= res!145277 (validate_offset_bits!1 ((_ sign_extend 32) (size!4175 (buf!4612 thiss!1204))) ((_ sign_extend 32) (currentByte!8735 thiss!1204)) ((_ sign_extend 32) (currentBit!8730 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!175440 () Bool)

(declare-fun array_inv!3916 (array!9460) Bool)

(assert (=> b!175440 (= e!122325 (array_inv!3916 (buf!4612 thiss!1204)))))

(assert (= (and start!38950 res!145274) b!175439))

(assert (= (and b!175439 res!145277) b!175437))

(assert (= (and b!175437 res!145275) b!175435))

(assert (= (and b!175435 res!145278) b!175436))

(assert (= (and b!175436 res!145276) b!175438))

(assert (= start!38950 b!175440))

(declare-fun m!275615 () Bool)

(assert (=> b!175438 m!275615))

(declare-fun m!275617 () Bool)

(assert (=> b!175438 m!275617))

(declare-fun m!275619 () Bool)

(assert (=> b!175438 m!275619))

(declare-fun m!275621 () Bool)

(assert (=> b!175436 m!275621))

(declare-fun m!275623 () Bool)

(assert (=> b!175440 m!275623))

(declare-fun m!275625 () Bool)

(assert (=> start!38950 m!275625))

(declare-fun m!275627 () Bool)

(assert (=> b!175439 m!275627))

(declare-fun m!275629 () Bool)

(assert (=> b!175437 m!275629))

(check-sat (not start!38950) (not b!175437) (not b!175439) (not b!175440) (not b!175438) (not b!175436))
