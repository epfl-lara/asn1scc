; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38948 () Bool)

(assert start!38948)

(declare-fun b!175417 () Bool)

(declare-fun e!122312 () Bool)

(declare-datatypes ((array!9458 0))(
  ( (array!9459 (arr!5104 (Array (_ BitVec 32) (_ BitVec 8))) (size!4174 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7456 0))(
  ( (BitStream!7457 (buf!4611 array!9458) (currentByte!8734 (_ BitVec 32)) (currentBit!8729 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7456)

(declare-fun array_inv!3915 (array!9458) Bool)

(assert (=> b!175417 (= e!122312 (array_inv!3915 (buf!4611 thiss!1204)))))

(declare-fun res!145263 () Bool)

(declare-fun e!122311 () Bool)

(assert (=> start!38948 (=> (not res!145263) (not e!122311))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!38948 (= res!145263 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!38948 e!122311))

(assert (=> start!38948 true))

(declare-fun inv!12 (BitStream!7456) Bool)

(assert (=> start!38948 (and (inv!12 thiss!1204) e!122312)))

(declare-fun b!175418 () Bool)

(declare-fun e!122313 () Bool)

(assert (=> b!175418 (= e!122313 (not true))))

(declare-datatypes ((tuple2!15094 0))(
  ( (tuple2!15095 (_1!8192 BitStream!7456) (_2!8192 BitStream!7456)) )
))
(declare-fun lt!270472 () tuple2!15094)

(declare-fun reader!0 (BitStream!7456 BitStream!7456) tuple2!15094)

(assert (=> b!175418 (= lt!270472 (reader!0 thiss!1204 thiss!1204))))

(declare-fun isPrefixOf!0 (BitStream!7456 BitStream!7456) Bool)

(assert (=> b!175418 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!12656 0))(
  ( (Unit!12657) )
))
(declare-fun lt!270471 () Unit!12656)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7456) Unit!12656)

(assert (=> b!175418 (= lt!270471 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!175419 () Bool)

(declare-fun res!145262 () Bool)

(assert (=> b!175419 (=> (not res!145262) (not e!122311))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!175419 (= res!145262 (invariant!0 (currentBit!8729 thiss!1204) (currentByte!8734 thiss!1204) (size!4174 (buf!4611 thiss!1204))))))

(declare-fun b!175420 () Bool)

(declare-fun res!145259 () Bool)

(assert (=> b!175420 (=> (not res!145259) (not e!122311))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!175420 (= res!145259 (validate_offset_bits!1 ((_ sign_extend 32) (size!4174 (buf!4611 thiss!1204))) ((_ sign_extend 32) (currentByte!8734 thiss!1204)) ((_ sign_extend 32) (currentBit!8729 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!175421 () Bool)

(declare-fun res!145260 () Bool)

(assert (=> b!175421 (=> (not res!145260) (not e!122311))))

(assert (=> b!175421 (= res!145260 (= i!590 nBits!348))))

(declare-fun b!175422 () Bool)

(assert (=> b!175422 (= e!122311 e!122313)))

(declare-fun res!145261 () Bool)

(assert (=> b!175422 (=> (not res!145261) (not e!122313))))

(declare-fun lt!270473 () (_ BitVec 64))

(assert (=> b!175422 (= res!145261 (= lt!270473 (bvsub (bvadd lt!270473 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175422 (= lt!270473 (bitIndex!0 (size!4174 (buf!4611 thiss!1204)) (currentByte!8734 thiss!1204) (currentBit!8729 thiss!1204)))))

(assert (= (and start!38948 res!145263) b!175420))

(assert (= (and b!175420 res!145259) b!175419))

(assert (= (and b!175419 res!145262) b!175421))

(assert (= (and b!175421 res!145260) b!175422))

(assert (= (and b!175422 res!145261) b!175418))

(assert (= start!38948 b!175417))

(declare-fun m!275599 () Bool)

(assert (=> b!175422 m!275599))

(declare-fun m!275601 () Bool)

(assert (=> b!175418 m!275601))

(declare-fun m!275603 () Bool)

(assert (=> b!175418 m!275603))

(declare-fun m!275605 () Bool)

(assert (=> b!175418 m!275605))

(declare-fun m!275607 () Bool)

(assert (=> b!175417 m!275607))

(declare-fun m!275609 () Bool)

(assert (=> b!175419 m!275609))

(declare-fun m!275611 () Bool)

(assert (=> b!175420 m!275611))

(declare-fun m!275613 () Bool)

(assert (=> start!38948 m!275613))

(push 1)

(assert (not b!175418))

(assert (not start!38948))

(assert (not b!175419))

(assert (not b!175420))

(assert (not b!175417))

(assert (not b!175422))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

