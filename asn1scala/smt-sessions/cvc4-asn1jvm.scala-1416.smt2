; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38928 () Bool)

(assert start!38928)

(declare-fun b!175237 () Bool)

(declare-fun res!145111 () Bool)

(declare-fun e!122194 () Bool)

(assert (=> b!175237 (=> (not res!145111) (not e!122194))))

(declare-datatypes ((array!9438 0))(
  ( (array!9439 (arr!5094 (Array (_ BitVec 32) (_ BitVec 8))) (size!4164 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7436 0))(
  ( (BitStream!7437 (buf!4601 array!9438) (currentByte!8724 (_ BitVec 32)) (currentBit!8719 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7436)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!175237 (= res!145111 (invariant!0 (currentBit!8719 thiss!1204) (currentByte!8724 thiss!1204) (size!4164 (buf!4601 thiss!1204))))))

(declare-fun b!175238 () Bool)

(declare-fun e!122192 () Bool)

(assert (=> b!175238 (= e!122194 e!122192)))

(declare-fun res!145109 () Bool)

(assert (=> b!175238 (=> (not res!145109) (not e!122192))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!270383 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!175238 (= res!145109 (= lt!270383 (bvsub (bvadd lt!270383 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175238 (= lt!270383 (bitIndex!0 (size!4164 (buf!4601 thiss!1204)) (currentByte!8724 thiss!1204) (currentBit!8719 thiss!1204)))))

(declare-fun b!175239 () Bool)

(declare-fun e!122191 () Bool)

(declare-fun array_inv!3905 (array!9438) Bool)

(assert (=> b!175239 (= e!122191 (array_inv!3905 (buf!4601 thiss!1204)))))

(declare-fun b!175240 () Bool)

(declare-fun res!145112 () Bool)

(assert (=> b!175240 (=> (not res!145112) (not e!122194))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!175240 (= res!145112 (validate_offset_bits!1 ((_ sign_extend 32) (size!4164 (buf!4601 thiss!1204))) ((_ sign_extend 32) (currentByte!8724 thiss!1204)) ((_ sign_extend 32) (currentBit!8719 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun res!145113 () Bool)

(assert (=> start!38928 (=> (not res!145113) (not e!122194))))

(assert (=> start!38928 (= res!145113 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!38928 e!122194))

(assert (=> start!38928 true))

(declare-fun inv!12 (BitStream!7436) Bool)

(assert (=> start!38928 (and (inv!12 thiss!1204) e!122191)))

(declare-fun b!175241 () Bool)

(declare-fun res!145110 () Bool)

(assert (=> b!175241 (=> (not res!145110) (not e!122194))))

(assert (=> b!175241 (= res!145110 (= i!590 nBits!348))))

(declare-fun b!175242 () Bool)

(assert (=> b!175242 (= e!122192 (not true))))

(declare-fun isPrefixOf!0 (BitStream!7436 BitStream!7436) Bool)

(assert (=> b!175242 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!12636 0))(
  ( (Unit!12637) )
))
(declare-fun lt!270382 () Unit!12636)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7436) Unit!12636)

(assert (=> b!175242 (= lt!270382 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (= (and start!38928 res!145113) b!175240))

(assert (= (and b!175240 res!145112) b!175237))

(assert (= (and b!175237 res!145111) b!175241))

(assert (= (and b!175241 res!145110) b!175238))

(assert (= (and b!175238 res!145109) b!175242))

(assert (= start!38928 b!175239))

(declare-fun m!275441 () Bool)

(assert (=> start!38928 m!275441))

(declare-fun m!275443 () Bool)

(assert (=> b!175242 m!275443))

(declare-fun m!275445 () Bool)

(assert (=> b!175242 m!275445))

(declare-fun m!275447 () Bool)

(assert (=> b!175238 m!275447))

(declare-fun m!275449 () Bool)

(assert (=> b!175240 m!275449))

(declare-fun m!275451 () Bool)

(assert (=> b!175237 m!275451))

(declare-fun m!275453 () Bool)

(assert (=> b!175239 m!275453))

(push 1)

(assert (not b!175237))

(assert (not b!175240))

(assert (not b!175242))

(assert (not start!38928))

(assert (not b!175238))

(assert (not b!175239))

(check-sat)

(pop 1)

