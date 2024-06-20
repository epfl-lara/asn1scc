; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38930 () Bool)

(assert start!38930)

(declare-fun b!175255 () Bool)

(declare-fun res!145128 () Bool)

(declare-fun e!122205 () Bool)

(assert (=> b!175255 (=> (not res!145128) (not e!122205))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((array!9440 0))(
  ( (array!9441 (arr!5095 (Array (_ BitVec 32) (_ BitVec 8))) (size!4165 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7438 0))(
  ( (BitStream!7439 (buf!4602 array!9440) (currentByte!8725 (_ BitVec 32)) (currentBit!8720 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7438)

(declare-fun i!590 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!175255 (= res!145128 (validate_offset_bits!1 ((_ sign_extend 32) (size!4165 (buf!4602 thiss!1204))) ((_ sign_extend 32) (currentByte!8725 thiss!1204)) ((_ sign_extend 32) (currentBit!8720 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!175256 () Bool)

(declare-fun res!145124 () Bool)

(assert (=> b!175256 (=> (not res!145124) (not e!122205))))

(assert (=> b!175256 (= res!145124 (= i!590 nBits!348))))

(declare-fun res!145127 () Bool)

(assert (=> start!38930 (=> (not res!145127) (not e!122205))))

(assert (=> start!38930 (= res!145127 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!38930 e!122205))

(assert (=> start!38930 true))

(declare-fun e!122204 () Bool)

(declare-fun inv!12 (BitStream!7438) Bool)

(assert (=> start!38930 (and (inv!12 thiss!1204) e!122204)))

(declare-fun b!175257 () Bool)

(declare-fun e!122206 () Bool)

(assert (=> b!175257 (= e!122205 e!122206)))

(declare-fun res!145126 () Bool)

(assert (=> b!175257 (=> (not res!145126) (not e!122206))))

(declare-fun lt!270390 () (_ BitVec 64))

(assert (=> b!175257 (= res!145126 (= lt!270390 (bvsub (bvadd lt!270390 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175257 (= lt!270390 (bitIndex!0 (size!4165 (buf!4602 thiss!1204)) (currentByte!8725 thiss!1204) (currentBit!8720 thiss!1204)))))

(declare-fun b!175258 () Bool)

(assert (=> b!175258 (= e!122206 (not (bvsle i!590 #b00000000000000000000000001000000)))))

(declare-datatypes ((tuple2!15076 0))(
  ( (tuple2!15077 (_1!8183 BitStream!7438) (_2!8183 BitStream!7438)) )
))
(declare-fun lt!270392 () tuple2!15076)

(declare-fun reader!0 (BitStream!7438 BitStream!7438) tuple2!15076)

(assert (=> b!175258 (= lt!270392 (reader!0 thiss!1204 thiss!1204))))

(declare-fun isPrefixOf!0 (BitStream!7438 BitStream!7438) Bool)

(assert (=> b!175258 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!12638 0))(
  ( (Unit!12639) )
))
(declare-fun lt!270391 () Unit!12638)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7438) Unit!12638)

(assert (=> b!175258 (= lt!270391 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!175259 () Bool)

(declare-fun array_inv!3906 (array!9440) Bool)

(assert (=> b!175259 (= e!122204 (array_inv!3906 (buf!4602 thiss!1204)))))

(declare-fun b!175260 () Bool)

(declare-fun res!145125 () Bool)

(assert (=> b!175260 (=> (not res!145125) (not e!122205))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!175260 (= res!145125 (invariant!0 (currentBit!8720 thiss!1204) (currentByte!8725 thiss!1204) (size!4165 (buf!4602 thiss!1204))))))

(assert (= (and start!38930 res!145127) b!175255))

(assert (= (and b!175255 res!145128) b!175260))

(assert (= (and b!175260 res!145125) b!175256))

(assert (= (and b!175256 res!145124) b!175257))

(assert (= (and b!175257 res!145126) b!175258))

(assert (= start!38930 b!175259))

(declare-fun m!275455 () Bool)

(assert (=> start!38930 m!275455))

(declare-fun m!275457 () Bool)

(assert (=> b!175260 m!275457))

(declare-fun m!275459 () Bool)

(assert (=> b!175258 m!275459))

(declare-fun m!275461 () Bool)

(assert (=> b!175258 m!275461))

(declare-fun m!275463 () Bool)

(assert (=> b!175258 m!275463))

(declare-fun m!275465 () Bool)

(assert (=> b!175255 m!275465))

(declare-fun m!275467 () Bool)

(assert (=> b!175259 m!275467))

(declare-fun m!275469 () Bool)

(assert (=> b!175257 m!275469))

(push 1)

(assert (not b!175255))

(assert (not start!38930))

(assert (not b!175257))

(assert (not b!175259))

(assert (not b!175260))

(assert (not b!175258))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

