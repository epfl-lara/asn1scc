; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38912 () Bool)

(assert start!38912)

(declare-fun b!175093 () Bool)

(declare-fun res!144990 () Bool)

(declare-fun e!122095 () Bool)

(assert (=> b!175093 (=> (not res!144990) (not e!122095))))

(declare-datatypes ((array!9422 0))(
  ( (array!9423 (arr!5086 (Array (_ BitVec 32) (_ BitVec 8))) (size!4156 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7420 0))(
  ( (BitStream!7421 (buf!4593 array!9422) (currentByte!8716 (_ BitVec 32)) (currentBit!8711 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7420)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!175093 (= res!144990 (invariant!0 (currentBit!8711 thiss!1204) (currentByte!8716 thiss!1204) (size!4156 (buf!4593 thiss!1204))))))

(declare-fun b!175094 () Bool)

(declare-fun res!144993 () Bool)

(assert (=> b!175094 (=> (not res!144993) (not e!122095))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!175094 (= res!144993 (= i!590 nBits!348))))

(declare-fun b!175095 () Bool)

(declare-fun res!144992 () Bool)

(assert (=> b!175095 (=> (not res!144992) (not e!122095))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!175095 (= res!144992 (validate_offset_bits!1 ((_ sign_extend 32) (size!4156 (buf!4593 thiss!1204))) ((_ sign_extend 32) (currentByte!8716 thiss!1204)) ((_ sign_extend 32) (currentBit!8711 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!175097 () Bool)

(declare-fun e!122097 () Bool)

(assert (=> b!175097 (= e!122097 (not true))))

(declare-fun isPrefixOf!0 (BitStream!7420 BitStream!7420) Bool)

(assert (=> b!175097 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!12620 0))(
  ( (Unit!12621) )
))
(declare-fun lt!270335 () Unit!12620)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7420) Unit!12620)

(assert (=> b!175097 (= lt!270335 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!175098 () Bool)

(declare-fun e!122096 () Bool)

(declare-fun array_inv!3897 (array!9422) Bool)

(assert (=> b!175098 (= e!122096 (array_inv!3897 (buf!4593 thiss!1204)))))

(declare-fun res!144989 () Bool)

(assert (=> start!38912 (=> (not res!144989) (not e!122095))))

(assert (=> start!38912 (= res!144989 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!38912 e!122095))

(assert (=> start!38912 true))

(declare-fun inv!12 (BitStream!7420) Bool)

(assert (=> start!38912 (and (inv!12 thiss!1204) e!122096)))

(declare-fun b!175096 () Bool)

(assert (=> b!175096 (= e!122095 e!122097)))

(declare-fun res!144991 () Bool)

(assert (=> b!175096 (=> (not res!144991) (not e!122097))))

(declare-fun lt!270334 () (_ BitVec 64))

(assert (=> b!175096 (= res!144991 (= lt!270334 (bvsub (bvadd lt!270334 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175096 (= lt!270334 (bitIndex!0 (size!4156 (buf!4593 thiss!1204)) (currentByte!8716 thiss!1204) (currentBit!8711 thiss!1204)))))

(assert (= (and start!38912 res!144989) b!175095))

(assert (= (and b!175095 res!144992) b!175093))

(assert (= (and b!175093 res!144990) b!175094))

(assert (= (and b!175094 res!144993) b!175096))

(assert (= (and b!175096 res!144991) b!175097))

(assert (= start!38912 b!175098))

(declare-fun m!275329 () Bool)

(assert (=> b!175096 m!275329))

(declare-fun m!275331 () Bool)

(assert (=> b!175095 m!275331))

(declare-fun m!275333 () Bool)

(assert (=> start!38912 m!275333))

(declare-fun m!275335 () Bool)

(assert (=> b!175098 m!275335))

(declare-fun m!275337 () Bool)

(assert (=> b!175097 m!275337))

(declare-fun m!275339 () Bool)

(assert (=> b!175097 m!275339))

(declare-fun m!275341 () Bool)

(assert (=> b!175093 m!275341))

(push 1)

(assert (not b!175098))

(assert (not b!175096))

(assert (not b!175097))

(assert (not start!38912))

(assert (not b!175095))

(assert (not b!175093))

(check-sat)

