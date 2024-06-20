; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38914 () Bool)

(assert start!38914)

(declare-fun b!175111 () Bool)

(declare-fun e!122110 () Bool)

(declare-datatypes ((array!9424 0))(
  ( (array!9425 (arr!5087 (Array (_ BitVec 32) (_ BitVec 8))) (size!4157 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7422 0))(
  ( (BitStream!7423 (buf!4594 array!9424) (currentByte!8717 (_ BitVec 32)) (currentBit!8712 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7422)

(declare-fun array_inv!3898 (array!9424) Bool)

(assert (=> b!175111 (= e!122110 (array_inv!3898 (buf!4594 thiss!1204)))))

(declare-fun b!175112 () Bool)

(declare-fun res!145005 () Bool)

(declare-fun e!122107 () Bool)

(assert (=> b!175112 (=> (not res!145005) (not e!122107))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!175112 (= res!145005 (validate_offset_bits!1 ((_ sign_extend 32) (size!4157 (buf!4594 thiss!1204))) ((_ sign_extend 32) (currentByte!8717 thiss!1204)) ((_ sign_extend 32) (currentBit!8712 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!175113 () Bool)

(declare-fun e!122108 () Bool)

(assert (=> b!175113 (= e!122107 e!122108)))

(declare-fun res!145007 () Bool)

(assert (=> b!175113 (=> (not res!145007) (not e!122108))))

(declare-fun lt!270340 () (_ BitVec 64))

(assert (=> b!175113 (= res!145007 (= lt!270340 (bvsub (bvadd lt!270340 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175113 (= lt!270340 (bitIndex!0 (size!4157 (buf!4594 thiss!1204)) (currentByte!8717 thiss!1204) (currentBit!8712 thiss!1204)))))

(declare-fun res!145006 () Bool)

(assert (=> start!38914 (=> (not res!145006) (not e!122107))))

(assert (=> start!38914 (= res!145006 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!38914 e!122107))

(assert (=> start!38914 true))

(declare-fun inv!12 (BitStream!7422) Bool)

(assert (=> start!38914 (and (inv!12 thiss!1204) e!122110)))

(declare-fun b!175114 () Bool)

(declare-fun res!145004 () Bool)

(assert (=> b!175114 (=> (not res!145004) (not e!122107))))

(assert (=> b!175114 (= res!145004 (= i!590 nBits!348))))

(declare-fun b!175115 () Bool)

(assert (=> b!175115 (= e!122108 (not true))))

(declare-fun isPrefixOf!0 (BitStream!7422 BitStream!7422) Bool)

(assert (=> b!175115 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!12622 0))(
  ( (Unit!12623) )
))
(declare-fun lt!270341 () Unit!12622)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7422) Unit!12622)

(assert (=> b!175115 (= lt!270341 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!175116 () Bool)

(declare-fun res!145008 () Bool)

(assert (=> b!175116 (=> (not res!145008) (not e!122107))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!175116 (= res!145008 (invariant!0 (currentBit!8712 thiss!1204) (currentByte!8717 thiss!1204) (size!4157 (buf!4594 thiss!1204))))))

(assert (= (and start!38914 res!145006) b!175112))

(assert (= (and b!175112 res!145005) b!175116))

(assert (= (and b!175116 res!145008) b!175114))

(assert (= (and b!175114 res!145004) b!175113))

(assert (= (and b!175113 res!145007) b!175115))

(assert (= start!38914 b!175111))

(declare-fun m!275343 () Bool)

(assert (=> start!38914 m!275343))

(declare-fun m!275345 () Bool)

(assert (=> b!175112 m!275345))

(declare-fun m!275347 () Bool)

(assert (=> b!175116 m!275347))

(declare-fun m!275349 () Bool)

(assert (=> b!175111 m!275349))

(declare-fun m!275351 () Bool)

(assert (=> b!175115 m!275351))

(declare-fun m!275353 () Bool)

(assert (=> b!175115 m!275353))

(declare-fun m!275355 () Bool)

(assert (=> b!175113 m!275355))

(check-sat (not start!38914) (not b!175116) (not b!175112) (not b!175113) (not b!175115) (not b!175111))
(check-sat)
