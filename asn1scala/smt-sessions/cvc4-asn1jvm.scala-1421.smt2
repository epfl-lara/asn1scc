; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38958 () Bool)

(assert start!38958)

(declare-fun b!175507 () Bool)

(declare-fun e!122382 () Bool)

(assert (=> b!175507 (= e!122382 (not true))))

(declare-datatypes ((Unit!12666 0))(
  ( (Unit!12667) )
))
(declare-fun lt!270535 () Unit!12666)

(declare-datatypes ((array!9468 0))(
  ( (array!9469 (arr!5109 (Array (_ BitVec 32) (_ BitVec 8))) (size!4179 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7466 0))(
  ( (BitStream!7467 (buf!4616 array!9468) (currentByte!8739 (_ BitVec 32)) (currentBit!8734 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7466)

(declare-fun lt!270536 () (_ BitVec 64))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7466 array!9468 (_ BitVec 64)) Unit!12666)

(assert (=> b!175507 (= lt!270535 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4616 thiss!1204) lt!270536))))

(declare-datatypes ((tuple2!15104 0))(
  ( (tuple2!15105 (_1!8197 BitStream!7466) (_2!8197 BitStream!7466)) )
))
(declare-fun lt!270534 () tuple2!15104)

(declare-fun reader!0 (BitStream!7466 BitStream!7466) tuple2!15104)

(assert (=> b!175507 (= lt!270534 (reader!0 thiss!1204 thiss!1204))))

(declare-fun isPrefixOf!0 (BitStream!7466 BitStream!7466) Bool)

(assert (=> b!175507 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-fun lt!270533 () Unit!12666)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7466) Unit!12666)

(assert (=> b!175507 (= lt!270533 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun res!145336 () Bool)

(declare-fun e!122379 () Bool)

(assert (=> start!38958 (=> (not res!145336) (not e!122379))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!38958 (= res!145336 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!38958 e!122379))

(assert (=> start!38958 true))

(declare-fun e!122380 () Bool)

(declare-fun inv!12 (BitStream!7466) Bool)

(assert (=> start!38958 (and (inv!12 thiss!1204) e!122380)))

(declare-fun b!175508 () Bool)

(declare-fun res!145337 () Bool)

(declare-fun e!122383 () Bool)

(assert (=> b!175508 (=> (not res!145337) (not e!122383))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!175508 (= res!145337 (invariant!0 (currentBit!8734 thiss!1204) (currentByte!8739 thiss!1204) (size!4179 (buf!4616 thiss!1204))))))

(declare-fun b!175509 () Bool)

(declare-fun array_inv!3920 (array!9468) Bool)

(assert (=> b!175509 (= e!122380 (array_inv!3920 (buf!4616 thiss!1204)))))

(declare-fun b!175510 () Bool)

(declare-fun res!145334 () Bool)

(assert (=> b!175510 (=> (not res!145334) (not e!122383))))

(assert (=> b!175510 (= res!145334 (= i!590 nBits!348))))

(declare-fun b!175511 () Bool)

(assert (=> b!175511 (= e!122383 e!122382)))

(declare-fun res!145335 () Bool)

(assert (=> b!175511 (=> (not res!145335) (not e!122382))))

(declare-fun lt!270532 () (_ BitVec 64))

(assert (=> b!175511 (= res!145335 (= lt!270532 (bvsub (bvadd lt!270532 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175511 (= lt!270532 (bitIndex!0 (size!4179 (buf!4616 thiss!1204)) (currentByte!8739 thiss!1204) (currentBit!8734 thiss!1204)))))

(declare-fun b!175512 () Bool)

(assert (=> b!175512 (= e!122379 e!122383)))

(declare-fun res!145338 () Bool)

(assert (=> b!175512 (=> (not res!145338) (not e!122383))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!175512 (= res!145338 (validate_offset_bits!1 ((_ sign_extend 32) (size!4179 (buf!4616 thiss!1204))) ((_ sign_extend 32) (currentByte!8739 thiss!1204)) ((_ sign_extend 32) (currentBit!8734 thiss!1204)) lt!270536))))

(assert (=> b!175512 (= lt!270536 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(assert (= (and start!38958 res!145336) b!175512))

(assert (= (and b!175512 res!145338) b!175508))

(assert (= (and b!175508 res!145337) b!175510))

(assert (= (and b!175510 res!145334) b!175511))

(assert (= (and b!175511 res!145335) b!175507))

(assert (= start!38958 b!175509))

(declare-fun m!275683 () Bool)

(assert (=> b!175507 m!275683))

(declare-fun m!275685 () Bool)

(assert (=> b!175507 m!275685))

(declare-fun m!275687 () Bool)

(assert (=> b!175507 m!275687))

(declare-fun m!275689 () Bool)

(assert (=> b!175507 m!275689))

(declare-fun m!275691 () Bool)

(assert (=> b!175512 m!275691))

(declare-fun m!275693 () Bool)

(assert (=> b!175511 m!275693))

(declare-fun m!275695 () Bool)

(assert (=> start!38958 m!275695))

(declare-fun m!275697 () Bool)

(assert (=> b!175508 m!275697))

(declare-fun m!275699 () Bool)

(assert (=> b!175509 m!275699))

(push 1)

(assert (not b!175511))

