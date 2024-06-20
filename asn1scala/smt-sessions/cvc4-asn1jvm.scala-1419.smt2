; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38946 () Bool)

(assert start!38946)

(declare-fun b!175399 () Bool)

(declare-fun e!122301 () Bool)

(declare-fun e!122300 () Bool)

(assert (=> b!175399 (= e!122301 e!122300)))

(declare-fun res!145247 () Bool)

(assert (=> b!175399 (=> (not res!145247) (not e!122300))))

(declare-fun lt!270463 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!175399 (= res!145247 (= lt!270463 (bvsub (bvadd lt!270463 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-datatypes ((array!9456 0))(
  ( (array!9457 (arr!5103 (Array (_ BitVec 32) (_ BitVec 8))) (size!4173 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7454 0))(
  ( (BitStream!7455 (buf!4610 array!9456) (currentByte!8733 (_ BitVec 32)) (currentBit!8728 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7454)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175399 (= lt!270463 (bitIndex!0 (size!4173 (buf!4610 thiss!1204)) (currentByte!8733 thiss!1204) (currentBit!8728 thiss!1204)))))

(declare-fun b!175400 () Bool)

(assert (=> b!175400 (= e!122300 (not true))))

(declare-datatypes ((tuple2!15092 0))(
  ( (tuple2!15093 (_1!8191 BitStream!7454) (_2!8191 BitStream!7454)) )
))
(declare-fun lt!270462 () tuple2!15092)

(declare-fun reader!0 (BitStream!7454 BitStream!7454) tuple2!15092)

(assert (=> b!175400 (= lt!270462 (reader!0 thiss!1204 thiss!1204))))

(declare-fun isPrefixOf!0 (BitStream!7454 BitStream!7454) Bool)

(assert (=> b!175400 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!12654 0))(
  ( (Unit!12655) )
))
(declare-fun lt!270464 () Unit!12654)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7454) Unit!12654)

(assert (=> b!175400 (= lt!270464 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun res!145244 () Bool)

(assert (=> start!38946 (=> (not res!145244) (not e!122301))))

(assert (=> start!38946 (= res!145244 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!38946 e!122301))

(assert (=> start!38946 true))

(declare-fun e!122299 () Bool)

(declare-fun inv!12 (BitStream!7454) Bool)

(assert (=> start!38946 (and (inv!12 thiss!1204) e!122299)))

(declare-fun b!175401 () Bool)

(declare-fun res!145246 () Bool)

(assert (=> b!175401 (=> (not res!145246) (not e!122301))))

(assert (=> b!175401 (= res!145246 (= i!590 nBits!348))))

(declare-fun b!175402 () Bool)

(declare-fun res!145248 () Bool)

(assert (=> b!175402 (=> (not res!145248) (not e!122301))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!175402 (= res!145248 (invariant!0 (currentBit!8728 thiss!1204) (currentByte!8733 thiss!1204) (size!4173 (buf!4610 thiss!1204))))))

(declare-fun b!175403 () Bool)

(declare-fun array_inv!3914 (array!9456) Bool)

(assert (=> b!175403 (= e!122299 (array_inv!3914 (buf!4610 thiss!1204)))))

(declare-fun b!175404 () Bool)

(declare-fun res!145245 () Bool)

(assert (=> b!175404 (=> (not res!145245) (not e!122301))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!175404 (= res!145245 (validate_offset_bits!1 ((_ sign_extend 32) (size!4173 (buf!4610 thiss!1204))) ((_ sign_extend 32) (currentByte!8733 thiss!1204)) ((_ sign_extend 32) (currentBit!8728 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(assert (= (and start!38946 res!145244) b!175404))

(assert (= (and b!175404 res!145245) b!175402))

(assert (= (and b!175402 res!145248) b!175401))

(assert (= (and b!175401 res!145246) b!175399))

(assert (= (and b!175399 res!145247) b!175400))

(assert (= start!38946 b!175403))

(declare-fun m!275583 () Bool)

(assert (=> b!175399 m!275583))

(declare-fun m!275585 () Bool)

(assert (=> start!38946 m!275585))

(declare-fun m!275587 () Bool)

(assert (=> b!175402 m!275587))

(declare-fun m!275589 () Bool)

(assert (=> b!175404 m!275589))

(declare-fun m!275591 () Bool)

(assert (=> b!175403 m!275591))

(declare-fun m!275593 () Bool)

(assert (=> b!175400 m!275593))

(declare-fun m!275595 () Bool)

(assert (=> b!175400 m!275595))

(declare-fun m!275597 () Bool)

(assert (=> b!175400 m!275597))

(push 1)

(assert (not start!38946))

(assert (not b!175399))

(assert (not b!175403))

(assert (not b!175404))

(assert (not b!175402))

(assert (not b!175400))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

