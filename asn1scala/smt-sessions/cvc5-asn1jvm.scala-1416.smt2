; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38924 () Bool)

(assert start!38924)

(declare-fun res!145082 () Bool)

(declare-fun e!122170 () Bool)

(assert (=> start!38924 (=> (not res!145082) (not e!122170))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!38924 (= res!145082 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!38924 e!122170))

(assert (=> start!38924 true))

(declare-datatypes ((array!9434 0))(
  ( (array!9435 (arr!5092 (Array (_ BitVec 32) (_ BitVec 8))) (size!4162 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7432 0))(
  ( (BitStream!7433 (buf!4599 array!9434) (currentByte!8722 (_ BitVec 32)) (currentBit!8717 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7432)

(declare-fun e!122168 () Bool)

(declare-fun inv!12 (BitStream!7432) Bool)

(assert (=> start!38924 (and (inv!12 thiss!1204) e!122168)))

(declare-fun b!175201 () Bool)

(declare-fun e!122169 () Bool)

(assert (=> b!175201 (= e!122169 (not true))))

(declare-fun isPrefixOf!0 (BitStream!7432 BitStream!7432) Bool)

(assert (=> b!175201 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!12632 0))(
  ( (Unit!12633) )
))
(declare-fun lt!270370 () Unit!12632)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7432) Unit!12632)

(assert (=> b!175201 (= lt!270370 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!175202 () Bool)

(declare-fun res!145080 () Bool)

(assert (=> b!175202 (=> (not res!145080) (not e!122170))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!175202 (= res!145080 (validate_offset_bits!1 ((_ sign_extend 32) (size!4162 (buf!4599 thiss!1204))) ((_ sign_extend 32) (currentByte!8722 thiss!1204)) ((_ sign_extend 32) (currentBit!8717 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!175203 () Bool)

(assert (=> b!175203 (= e!122170 e!122169)))

(declare-fun res!145081 () Bool)

(assert (=> b!175203 (=> (not res!145081) (not e!122169))))

(declare-fun lt!270371 () (_ BitVec 64))

(assert (=> b!175203 (= res!145081 (= lt!270371 (bvsub (bvadd lt!270371 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175203 (= lt!270371 (bitIndex!0 (size!4162 (buf!4599 thiss!1204)) (currentByte!8722 thiss!1204) (currentBit!8717 thiss!1204)))))

(declare-fun b!175204 () Bool)

(declare-fun array_inv!3903 (array!9434) Bool)

(assert (=> b!175204 (= e!122168 (array_inv!3903 (buf!4599 thiss!1204)))))

(declare-fun b!175205 () Bool)

(declare-fun res!145083 () Bool)

(assert (=> b!175205 (=> (not res!145083) (not e!122170))))

(assert (=> b!175205 (= res!145083 (= i!590 nBits!348))))

(declare-fun b!175206 () Bool)

(declare-fun res!145079 () Bool)

(assert (=> b!175206 (=> (not res!145079) (not e!122170))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!175206 (= res!145079 (invariant!0 (currentBit!8717 thiss!1204) (currentByte!8722 thiss!1204) (size!4162 (buf!4599 thiss!1204))))))

(assert (= (and start!38924 res!145082) b!175202))

(assert (= (and b!175202 res!145080) b!175206))

(assert (= (and b!175206 res!145079) b!175205))

(assert (= (and b!175205 res!145083) b!175203))

(assert (= (and b!175203 res!145081) b!175201))

(assert (= start!38924 b!175204))

(declare-fun m!275413 () Bool)

(assert (=> b!175206 m!275413))

(declare-fun m!275415 () Bool)

(assert (=> start!38924 m!275415))

(declare-fun m!275417 () Bool)

(assert (=> b!175201 m!275417))

(declare-fun m!275419 () Bool)

(assert (=> b!175201 m!275419))

(declare-fun m!275421 () Bool)

(assert (=> b!175204 m!275421))

(declare-fun m!275423 () Bool)

(assert (=> b!175202 m!275423))

(declare-fun m!275425 () Bool)

(assert (=> b!175203 m!275425))

(push 1)

(assert (not start!38924))

(assert (not b!175204))

(assert (not b!175202))

(assert (not b!175201))

(assert (not b!175206))

(assert (not b!175203))

