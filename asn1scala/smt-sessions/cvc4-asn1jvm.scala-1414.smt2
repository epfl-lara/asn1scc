; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38916 () Bool)

(assert start!38916)

(declare-fun b!175129 () Bool)

(declare-fun e!122121 () Bool)

(declare-fun e!122122 () Bool)

(assert (=> b!175129 (= e!122121 e!122122)))

(declare-fun res!145021 () Bool)

(assert (=> b!175129 (=> (not res!145021) (not e!122122))))

(declare-fun lt!270347 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!175129 (= res!145021 (= lt!270347 (bvsub (bvadd lt!270347 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-datatypes ((array!9426 0))(
  ( (array!9427 (arr!5088 (Array (_ BitVec 32) (_ BitVec 8))) (size!4158 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7424 0))(
  ( (BitStream!7425 (buf!4595 array!9426) (currentByte!8718 (_ BitVec 32)) (currentBit!8713 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7424)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175129 (= lt!270347 (bitIndex!0 (size!4158 (buf!4595 thiss!1204)) (currentByte!8718 thiss!1204) (currentBit!8713 thiss!1204)))))

(declare-fun b!175130 () Bool)

(declare-fun res!145020 () Bool)

(assert (=> b!175130 (=> (not res!145020) (not e!122121))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!175130 (= res!145020 (invariant!0 (currentBit!8713 thiss!1204) (currentByte!8718 thiss!1204) (size!4158 (buf!4595 thiss!1204))))))

(declare-fun b!175131 () Bool)

(assert (=> b!175131 (= e!122122 (not true))))

(declare-fun isPrefixOf!0 (BitStream!7424 BitStream!7424) Bool)

(assert (=> b!175131 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!12624 0))(
  ( (Unit!12625) )
))
(declare-fun lt!270346 () Unit!12624)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7424) Unit!12624)

(assert (=> b!175131 (= lt!270346 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!175132 () Bool)

(declare-fun res!145023 () Bool)

(assert (=> b!175132 (=> (not res!145023) (not e!122121))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!175132 (= res!145023 (validate_offset_bits!1 ((_ sign_extend 32) (size!4158 (buf!4595 thiss!1204))) ((_ sign_extend 32) (currentByte!8718 thiss!1204)) ((_ sign_extend 32) (currentBit!8713 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!175133 () Bool)

(declare-fun e!122119 () Bool)

(declare-fun array_inv!3899 (array!9426) Bool)

(assert (=> b!175133 (= e!122119 (array_inv!3899 (buf!4595 thiss!1204)))))

(declare-fun b!175134 () Bool)

(declare-fun res!145022 () Bool)

(assert (=> b!175134 (=> (not res!145022) (not e!122121))))

(assert (=> b!175134 (= res!145022 (= i!590 nBits!348))))

(declare-fun res!145019 () Bool)

(assert (=> start!38916 (=> (not res!145019) (not e!122121))))

(assert (=> start!38916 (= res!145019 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!38916 e!122121))

(assert (=> start!38916 true))

(declare-fun inv!12 (BitStream!7424) Bool)

(assert (=> start!38916 (and (inv!12 thiss!1204) e!122119)))

(assert (= (and start!38916 res!145019) b!175132))

(assert (= (and b!175132 res!145023) b!175130))

(assert (= (and b!175130 res!145020) b!175134))

(assert (= (and b!175134 res!145022) b!175129))

(assert (= (and b!175129 res!145021) b!175131))

(assert (= start!38916 b!175133))

(declare-fun m!275357 () Bool)

(assert (=> b!175133 m!275357))

(declare-fun m!275359 () Bool)

(assert (=> start!38916 m!275359))

(declare-fun m!275361 () Bool)

(assert (=> b!175131 m!275361))

(declare-fun m!275363 () Bool)

(assert (=> b!175131 m!275363))

(declare-fun m!275365 () Bool)

(assert (=> b!175130 m!275365))

(declare-fun m!275367 () Bool)

(assert (=> b!175132 m!275367))

(declare-fun m!275369 () Bool)

(assert (=> b!175129 m!275369))

(push 1)

(assert (not start!38916))

(assert (not b!175129))

(assert (not b!175130))

(assert (not b!175132))

(assert (not b!175133))

(assert (not b!175131))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

