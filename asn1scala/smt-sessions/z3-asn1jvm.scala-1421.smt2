; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38956 () Bool)

(assert start!38956)

(declare-fun res!145321 () Bool)

(declare-fun e!122366 () Bool)

(assert (=> start!38956 (=> (not res!145321) (not e!122366))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!38956 (= res!145321 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!38956 e!122366))

(assert (=> start!38956 true))

(declare-datatypes ((array!9466 0))(
  ( (array!9467 (arr!5108 (Array (_ BitVec 32) (_ BitVec 8))) (size!4178 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7464 0))(
  ( (BitStream!7465 (buf!4615 array!9466) (currentByte!8738 (_ BitVec 32)) (currentBit!8733 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7464)

(declare-fun e!122367 () Bool)

(declare-fun inv!12 (BitStream!7464) Bool)

(assert (=> start!38956 (and (inv!12 thiss!1204) e!122367)))

(declare-fun b!175489 () Bool)

(declare-fun array_inv!3919 (array!9466) Bool)

(assert (=> b!175489 (= e!122367 (array_inv!3919 (buf!4615 thiss!1204)))))

(declare-fun b!175490 () Bool)

(declare-fun res!145320 () Bool)

(declare-fun e!122364 () Bool)

(assert (=> b!175490 (=> (not res!145320) (not e!122364))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!175490 (= res!145320 (invariant!0 (currentBit!8733 thiss!1204) (currentByte!8738 thiss!1204) (size!4178 (buf!4615 thiss!1204))))))

(declare-fun b!175491 () Bool)

(declare-fun res!145322 () Bool)

(assert (=> b!175491 (=> (not res!145322) (not e!122364))))

(assert (=> b!175491 (= res!145322 (= i!590 nBits!348))))

(declare-fun b!175492 () Bool)

(declare-fun e!122365 () Bool)

(assert (=> b!175492 (= e!122364 e!122365)))

(declare-fun res!145319 () Bool)

(assert (=> b!175492 (=> (not res!145319) (not e!122365))))

(declare-fun lt!270518 () (_ BitVec 64))

(assert (=> b!175492 (= res!145319 (= lt!270518 (bvsub (bvadd lt!270518 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175492 (= lt!270518 (bitIndex!0 (size!4178 (buf!4615 thiss!1204)) (currentByte!8738 thiss!1204) (currentBit!8733 thiss!1204)))))

(declare-fun b!175493 () Bool)

(assert (=> b!175493 (= e!122366 e!122364)))

(declare-fun res!145323 () Bool)

(assert (=> b!175493 (=> (not res!145323) (not e!122364))))

(declare-fun lt!270519 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!175493 (= res!145323 (validate_offset_bits!1 ((_ sign_extend 32) (size!4178 (buf!4615 thiss!1204))) ((_ sign_extend 32) (currentByte!8738 thiss!1204)) ((_ sign_extend 32) (currentBit!8733 thiss!1204)) lt!270519))))

(assert (=> b!175493 (= lt!270519 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!175494 () Bool)

(assert (=> b!175494 (= e!122365 (not true))))

(declare-datatypes ((Unit!12664 0))(
  ( (Unit!12665) )
))
(declare-fun lt!270517 () Unit!12664)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7464 array!9466 (_ BitVec 64)) Unit!12664)

(assert (=> b!175494 (= lt!270517 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4615 thiss!1204) lt!270519))))

(declare-datatypes ((tuple2!15102 0))(
  ( (tuple2!15103 (_1!8196 BitStream!7464) (_2!8196 BitStream!7464)) )
))
(declare-fun lt!270521 () tuple2!15102)

(declare-fun reader!0 (BitStream!7464 BitStream!7464) tuple2!15102)

(assert (=> b!175494 (= lt!270521 (reader!0 thiss!1204 thiss!1204))))

(declare-fun isPrefixOf!0 (BitStream!7464 BitStream!7464) Bool)

(assert (=> b!175494 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-fun lt!270520 () Unit!12664)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7464) Unit!12664)

(assert (=> b!175494 (= lt!270520 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (= (and start!38956 res!145321) b!175493))

(assert (= (and b!175493 res!145323) b!175490))

(assert (= (and b!175490 res!145320) b!175491))

(assert (= (and b!175491 res!145322) b!175492))

(assert (= (and b!175492 res!145319) b!175494))

(assert (= start!38956 b!175489))

(declare-fun m!275665 () Bool)

(assert (=> b!175493 m!275665))

(declare-fun m!275667 () Bool)

(assert (=> b!175489 m!275667))

(declare-fun m!275669 () Bool)

(assert (=> start!38956 m!275669))

(declare-fun m!275671 () Bool)

(assert (=> b!175490 m!275671))

(declare-fun m!275673 () Bool)

(assert (=> b!175494 m!275673))

(declare-fun m!275675 () Bool)

(assert (=> b!175494 m!275675))

(declare-fun m!275677 () Bool)

(assert (=> b!175494 m!275677))

(declare-fun m!275679 () Bool)

(assert (=> b!175494 m!275679))

(declare-fun m!275681 () Bool)

(assert (=> b!175492 m!275681))

(check-sat (not start!38956) (not b!175492) (not b!175494) (not b!175490) (not b!175493) (not b!175489))
