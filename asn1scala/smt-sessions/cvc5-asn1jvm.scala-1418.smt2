; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38936 () Bool)

(assert start!38936)

(declare-fun b!175309 () Bool)

(declare-fun e!122239 () Bool)

(assert (=> b!175309 (= e!122239 (not true))))

(declare-datatypes ((array!9446 0))(
  ( (array!9447 (arr!5098 (Array (_ BitVec 32) (_ BitVec 8))) (size!4168 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7444 0))(
  ( (BitStream!7445 (buf!4605 array!9446) (currentByte!8728 (_ BitVec 32)) (currentBit!8723 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15082 0))(
  ( (tuple2!15083 (_1!8186 BitStream!7444) (_2!8186 BitStream!7444)) )
))
(declare-fun lt!270417 () tuple2!15082)

(declare-fun thiss!1204 () BitStream!7444)

(declare-fun reader!0 (BitStream!7444 BitStream!7444) tuple2!15082)

(assert (=> b!175309 (= lt!270417 (reader!0 thiss!1204 thiss!1204))))

(declare-fun isPrefixOf!0 (BitStream!7444 BitStream!7444) Bool)

(assert (=> b!175309 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!12644 0))(
  ( (Unit!12645) )
))
(declare-fun lt!270418 () Unit!12644)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7444) Unit!12644)

(assert (=> b!175309 (= lt!270418 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!175310 () Bool)

(declare-fun res!145169 () Bool)

(declare-fun e!122240 () Bool)

(assert (=> b!175310 (=> (not res!145169) (not e!122240))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!175310 (= res!145169 (= i!590 nBits!348))))

(declare-fun b!175311 () Bool)

(declare-fun res!145170 () Bool)

(assert (=> b!175311 (=> (not res!145170) (not e!122240))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!175311 (= res!145170 (invariant!0 (currentBit!8723 thiss!1204) (currentByte!8728 thiss!1204) (size!4168 (buf!4605 thiss!1204))))))

(declare-fun b!175312 () Bool)

(assert (=> b!175312 (= e!122240 e!122239)))

(declare-fun res!145173 () Bool)

(assert (=> b!175312 (=> (not res!145173) (not e!122239))))

(declare-fun lt!270419 () (_ BitVec 64))

(assert (=> b!175312 (= res!145173 (= lt!270419 (bvsub (bvadd lt!270419 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175312 (= lt!270419 (bitIndex!0 (size!4168 (buf!4605 thiss!1204)) (currentByte!8728 thiss!1204) (currentBit!8723 thiss!1204)))))

(declare-fun b!175313 () Bool)

(declare-fun e!122242 () Bool)

(declare-fun array_inv!3909 (array!9446) Bool)

(assert (=> b!175313 (= e!122242 (array_inv!3909 (buf!4605 thiss!1204)))))

(declare-fun res!145172 () Bool)

(assert (=> start!38936 (=> (not res!145172) (not e!122240))))

(assert (=> start!38936 (= res!145172 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!38936 e!122240))

(assert (=> start!38936 true))

(declare-fun inv!12 (BitStream!7444) Bool)

(assert (=> start!38936 (and (inv!12 thiss!1204) e!122242)))

(declare-fun b!175314 () Bool)

(declare-fun res!145171 () Bool)

(assert (=> b!175314 (=> (not res!145171) (not e!122240))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!175314 (= res!145171 (validate_offset_bits!1 ((_ sign_extend 32) (size!4168 (buf!4605 thiss!1204))) ((_ sign_extend 32) (currentByte!8728 thiss!1204)) ((_ sign_extend 32) (currentBit!8723 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(assert (= (and start!38936 res!145172) b!175314))

(assert (= (and b!175314 res!145171) b!175311))

(assert (= (and b!175311 res!145170) b!175310))

(assert (= (and b!175310 res!145169) b!175312))

(assert (= (and b!175312 res!145173) b!175309))

(assert (= start!38936 b!175313))

(declare-fun m!275503 () Bool)

(assert (=> b!175312 m!275503))

(declare-fun m!275505 () Bool)

(assert (=> b!175314 m!275505))

(declare-fun m!275507 () Bool)

(assert (=> start!38936 m!275507))

(declare-fun m!275509 () Bool)

(assert (=> b!175309 m!275509))

(declare-fun m!275511 () Bool)

(assert (=> b!175309 m!275511))

(declare-fun m!275513 () Bool)

(assert (=> b!175309 m!275513))

(declare-fun m!275515 () Bool)

(assert (=> b!175311 m!275515))

(declare-fun m!275517 () Bool)

(assert (=> b!175313 m!275517))

(push 1)

(assert (not start!38936))

(assert (not b!175311))

(assert (not b!175309))

(assert (not b!175313))

(assert (not b!175314))

(assert (not b!175312))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

