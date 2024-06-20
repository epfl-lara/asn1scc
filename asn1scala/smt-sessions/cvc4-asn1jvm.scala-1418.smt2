; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38940 () Bool)

(assert start!38940)

(declare-fun b!175345 () Bool)

(declare-fun e!122266 () Bool)

(declare-fun e!122263 () Bool)

(assert (=> b!175345 (= e!122266 e!122263)))

(declare-fun res!145200 () Bool)

(assert (=> b!175345 (=> (not res!145200) (not e!122263))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!270437 () (_ BitVec 64))

(assert (=> b!175345 (= res!145200 (= lt!270437 (bvsub (bvadd lt!270437 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-datatypes ((array!9450 0))(
  ( (array!9451 (arr!5100 (Array (_ BitVec 32) (_ BitVec 8))) (size!4170 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7448 0))(
  ( (BitStream!7449 (buf!4607 array!9450) (currentByte!8730 (_ BitVec 32)) (currentBit!8725 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7448)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175345 (= lt!270437 (bitIndex!0 (size!4170 (buf!4607 thiss!1204)) (currentByte!8730 thiss!1204) (currentBit!8725 thiss!1204)))))

(declare-fun res!145202 () Bool)

(assert (=> start!38940 (=> (not res!145202) (not e!122266))))

(assert (=> start!38940 (= res!145202 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!38940 e!122266))

(assert (=> start!38940 true))

(declare-fun e!122265 () Bool)

(declare-fun inv!12 (BitStream!7448) Bool)

(assert (=> start!38940 (and (inv!12 thiss!1204) e!122265)))

(declare-fun b!175346 () Bool)

(declare-fun res!145203 () Bool)

(assert (=> b!175346 (=> (not res!145203) (not e!122266))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!175346 (= res!145203 (validate_offset_bits!1 ((_ sign_extend 32) (size!4170 (buf!4607 thiss!1204))) ((_ sign_extend 32) (currentByte!8730 thiss!1204)) ((_ sign_extend 32) (currentBit!8725 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!175347 () Bool)

(assert (=> b!175347 (= e!122263 (not true))))

(declare-datatypes ((tuple2!15086 0))(
  ( (tuple2!15087 (_1!8188 BitStream!7448) (_2!8188 BitStream!7448)) )
))
(declare-fun lt!270435 () tuple2!15086)

(declare-fun reader!0 (BitStream!7448 BitStream!7448) tuple2!15086)

(assert (=> b!175347 (= lt!270435 (reader!0 thiss!1204 thiss!1204))))

(declare-fun isPrefixOf!0 (BitStream!7448 BitStream!7448) Bool)

(assert (=> b!175347 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!12648 0))(
  ( (Unit!12649) )
))
(declare-fun lt!270436 () Unit!12648)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7448) Unit!12648)

(assert (=> b!175347 (= lt!270436 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!175348 () Bool)

(declare-fun res!145201 () Bool)

(assert (=> b!175348 (=> (not res!145201) (not e!122266))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!175348 (= res!145201 (invariant!0 (currentBit!8725 thiss!1204) (currentByte!8730 thiss!1204) (size!4170 (buf!4607 thiss!1204))))))

(declare-fun b!175349 () Bool)

(declare-fun array_inv!3911 (array!9450) Bool)

(assert (=> b!175349 (= e!122265 (array_inv!3911 (buf!4607 thiss!1204)))))

(declare-fun b!175350 () Bool)

(declare-fun res!145199 () Bool)

(assert (=> b!175350 (=> (not res!145199) (not e!122266))))

(assert (=> b!175350 (= res!145199 (= i!590 nBits!348))))

(assert (= (and start!38940 res!145202) b!175346))

(assert (= (and b!175346 res!145203) b!175348))

(assert (= (and b!175348 res!145201) b!175350))

(assert (= (and b!175350 res!145199) b!175345))

(assert (= (and b!175345 res!145200) b!175347))

(assert (= start!38940 b!175349))

(declare-fun m!275535 () Bool)

(assert (=> b!175346 m!275535))

(declare-fun m!275537 () Bool)

(assert (=> b!175347 m!275537))

(declare-fun m!275539 () Bool)

(assert (=> b!175347 m!275539))

(declare-fun m!275541 () Bool)

(assert (=> b!175347 m!275541))

(declare-fun m!275543 () Bool)

(assert (=> b!175345 m!275543))

(declare-fun m!275545 () Bool)

(assert (=> start!38940 m!275545))

(declare-fun m!275547 () Bool)

(assert (=> b!175349 m!275547))

(declare-fun m!275549 () Bool)

(assert (=> b!175348 m!275549))

(push 1)

(assert (not b!175349))

(assert (not b!175348))

(assert (not b!175345))

(assert (not start!38940))

(assert (not b!175347))

(assert (not b!175346))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

