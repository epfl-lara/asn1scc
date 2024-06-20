; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38952 () Bool)

(assert start!38952)

(declare-fun b!175453 () Bool)

(declare-fun e!122338 () Bool)

(assert (=> b!175453 (= e!122338 (not true))))

(declare-datatypes ((array!9462 0))(
  ( (array!9463 (arr!5106 (Array (_ BitVec 32) (_ BitVec 8))) (size!4176 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7460 0))(
  ( (BitStream!7461 (buf!4613 array!9462) (currentByte!8736 (_ BitVec 32)) (currentBit!8731 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15098 0))(
  ( (tuple2!15099 (_1!8194 BitStream!7460) (_2!8194 BitStream!7460)) )
))
(declare-fun lt!270489 () tuple2!15098)

(declare-fun thiss!1204 () BitStream!7460)

(declare-fun reader!0 (BitStream!7460 BitStream!7460) tuple2!15098)

(assert (=> b!175453 (= lt!270489 (reader!0 thiss!1204 thiss!1204))))

(declare-fun isPrefixOf!0 (BitStream!7460 BitStream!7460) Bool)

(assert (=> b!175453 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!12660 0))(
  ( (Unit!12661) )
))
(declare-fun lt!270490 () Unit!12660)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7460) Unit!12660)

(assert (=> b!175453 (= lt!270490 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!175454 () Bool)

(declare-fun res!145289 () Bool)

(declare-fun e!122335 () Bool)

(assert (=> b!175454 (=> (not res!145289) (not e!122335))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!175454 (= res!145289 (validate_offset_bits!1 ((_ sign_extend 32) (size!4176 (buf!4613 thiss!1204))) ((_ sign_extend 32) (currentByte!8736 thiss!1204)) ((_ sign_extend 32) (currentBit!8731 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!175455 () Bool)

(declare-fun res!145293 () Bool)

(assert (=> b!175455 (=> (not res!145293) (not e!122335))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!175455 (= res!145293 (invariant!0 (currentBit!8731 thiss!1204) (currentByte!8736 thiss!1204) (size!4176 (buf!4613 thiss!1204))))))

(declare-fun b!175456 () Bool)

(assert (=> b!175456 (= e!122335 e!122338)))

(declare-fun res!145290 () Bool)

(assert (=> b!175456 (=> (not res!145290) (not e!122338))))

(declare-fun lt!270491 () (_ BitVec 64))

(assert (=> b!175456 (= res!145290 (= lt!270491 (bvsub (bvadd lt!270491 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175456 (= lt!270491 (bitIndex!0 (size!4176 (buf!4613 thiss!1204)) (currentByte!8736 thiss!1204) (currentBit!8731 thiss!1204)))))

(declare-fun b!175457 () Bool)

(declare-fun res!145291 () Bool)

(assert (=> b!175457 (=> (not res!145291) (not e!122335))))

(assert (=> b!175457 (= res!145291 (= i!590 nBits!348))))

(declare-fun b!175458 () Bool)

(declare-fun e!122336 () Bool)

(declare-fun array_inv!3917 (array!9462) Bool)

(assert (=> b!175458 (= e!122336 (array_inv!3917 (buf!4613 thiss!1204)))))

(declare-fun res!145292 () Bool)

(assert (=> start!38952 (=> (not res!145292) (not e!122335))))

(assert (=> start!38952 (= res!145292 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!38952 e!122335))

(assert (=> start!38952 true))

(declare-fun inv!12 (BitStream!7460) Bool)

(assert (=> start!38952 (and (inv!12 thiss!1204) e!122336)))

(assert (= (and start!38952 res!145292) b!175454))

(assert (= (and b!175454 res!145289) b!175455))

(assert (= (and b!175455 res!145293) b!175457))

(assert (= (and b!175457 res!145291) b!175456))

(assert (= (and b!175456 res!145290) b!175453))

(assert (= start!38952 b!175458))

(declare-fun m!275631 () Bool)

(assert (=> b!175458 m!275631))

(declare-fun m!275633 () Bool)

(assert (=> b!175454 m!275633))

(declare-fun m!275635 () Bool)

(assert (=> b!175456 m!275635))

(declare-fun m!275637 () Bool)

(assert (=> start!38952 m!275637))

(declare-fun m!275639 () Bool)

(assert (=> b!175453 m!275639))

(declare-fun m!275641 () Bool)

(assert (=> b!175453 m!275641))

(declare-fun m!275643 () Bool)

(assert (=> b!175453 m!275643))

(declare-fun m!275645 () Bool)

(assert (=> b!175455 m!275645))

(push 1)

