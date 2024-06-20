; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38918 () Bool)

(assert start!38918)

(declare-fun b!175147 () Bool)

(declare-fun e!122134 () Bool)

(assert (=> b!175147 (= e!122134 (not true))))

(declare-datatypes ((array!9428 0))(
  ( (array!9429 (arr!5089 (Array (_ BitVec 32) (_ BitVec 8))) (size!4159 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7426 0))(
  ( (BitStream!7427 (buf!4596 array!9428) (currentByte!8719 (_ BitVec 32)) (currentBit!8714 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7426)

(declare-fun isPrefixOf!0 (BitStream!7426 BitStream!7426) Bool)

(assert (=> b!175147 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!12626 0))(
  ( (Unit!12627) )
))
(declare-fun lt!270353 () Unit!12626)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7426) Unit!12626)

(assert (=> b!175147 (= lt!270353 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!175148 () Bool)

(declare-fun e!122133 () Bool)

(declare-fun array_inv!3900 (array!9428) Bool)

(assert (=> b!175148 (= e!122133 (array_inv!3900 (buf!4596 thiss!1204)))))

(declare-fun b!175150 () Bool)

(declare-fun e!122131 () Bool)

(assert (=> b!175150 (= e!122131 e!122134)))

(declare-fun res!145036 () Bool)

(assert (=> b!175150 (=> (not res!145036) (not e!122134))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!270352 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!175150 (= res!145036 (= lt!270352 (bvsub (bvadd lt!270352 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175150 (= lt!270352 (bitIndex!0 (size!4159 (buf!4596 thiss!1204)) (currentByte!8719 thiss!1204) (currentBit!8714 thiss!1204)))))

(declare-fun b!175151 () Bool)

(declare-fun res!145034 () Bool)

(assert (=> b!175151 (=> (not res!145034) (not e!122131))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!175151 (= res!145034 (invariant!0 (currentBit!8714 thiss!1204) (currentByte!8719 thiss!1204) (size!4159 (buf!4596 thiss!1204))))))

(declare-fun b!175152 () Bool)

(declare-fun res!145037 () Bool)

(assert (=> b!175152 (=> (not res!145037) (not e!122131))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!175152 (= res!145037 (validate_offset_bits!1 ((_ sign_extend 32) (size!4159 (buf!4596 thiss!1204))) ((_ sign_extend 32) (currentByte!8719 thiss!1204)) ((_ sign_extend 32) (currentBit!8714 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun res!145035 () Bool)

(assert (=> start!38918 (=> (not res!145035) (not e!122131))))

(assert (=> start!38918 (= res!145035 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!38918 e!122131))

(assert (=> start!38918 true))

(declare-fun inv!12 (BitStream!7426) Bool)

(assert (=> start!38918 (and (inv!12 thiss!1204) e!122133)))

(declare-fun b!175149 () Bool)

(declare-fun res!145038 () Bool)

(assert (=> b!175149 (=> (not res!145038) (not e!122131))))

(assert (=> b!175149 (= res!145038 (= i!590 nBits!348))))

(assert (= (and start!38918 res!145035) b!175152))

(assert (= (and b!175152 res!145037) b!175151))

(assert (= (and b!175151 res!145034) b!175149))

(assert (= (and b!175149 res!145038) b!175150))

(assert (= (and b!175150 res!145036) b!175147))

(assert (= start!38918 b!175148))

(declare-fun m!275371 () Bool)

(assert (=> start!38918 m!275371))

(declare-fun m!275373 () Bool)

(assert (=> b!175152 m!275373))

(declare-fun m!275375 () Bool)

(assert (=> b!175147 m!275375))

(declare-fun m!275377 () Bool)

(assert (=> b!175147 m!275377))

(declare-fun m!275379 () Bool)

(assert (=> b!175151 m!275379))

(declare-fun m!275381 () Bool)

(assert (=> b!175148 m!275381))

(declare-fun m!275383 () Bool)

(assert (=> b!175150 m!275383))

(push 1)

(assert (not b!175151))

(assert (not b!175147))

(assert (not start!38918))

(assert (not b!175152))

(assert (not b!175148))

(assert (not b!175150))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

