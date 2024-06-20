; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38938 () Bool)

(assert start!38938)

(declare-fun b!175327 () Bool)

(declare-fun res!145185 () Bool)

(declare-fun e!122252 () Bool)

(assert (=> b!175327 (=> (not res!145185) (not e!122252))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!175327 (= res!145185 (= i!590 nBits!348))))

(declare-fun b!175328 () Bool)

(declare-fun res!145184 () Bool)

(assert (=> b!175328 (=> (not res!145184) (not e!122252))))

(declare-datatypes ((array!9448 0))(
  ( (array!9449 (arr!5099 (Array (_ BitVec 32) (_ BitVec 8))) (size!4169 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7446 0))(
  ( (BitStream!7447 (buf!4606 array!9448) (currentByte!8729 (_ BitVec 32)) (currentBit!8724 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7446)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!175328 (= res!145184 (validate_offset_bits!1 ((_ sign_extend 32) (size!4169 (buf!4606 thiss!1204))) ((_ sign_extend 32) (currentByte!8729 thiss!1204)) ((_ sign_extend 32) (currentBit!8724 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!175329 () Bool)

(declare-fun res!145186 () Bool)

(assert (=> b!175329 (=> (not res!145186) (not e!122252))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!175329 (= res!145186 (invariant!0 (currentBit!8724 thiss!1204) (currentByte!8729 thiss!1204) (size!4169 (buf!4606 thiss!1204))))))

(declare-fun b!175330 () Bool)

(declare-fun e!122251 () Bool)

(assert (=> b!175330 (= e!122252 e!122251)))

(declare-fun res!145188 () Bool)

(assert (=> b!175330 (=> (not res!145188) (not e!122251))))

(declare-fun lt!270428 () (_ BitVec 64))

(assert (=> b!175330 (= res!145188 (= lt!270428 (bvsub (bvadd lt!270428 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175330 (= lt!270428 (bitIndex!0 (size!4169 (buf!4606 thiss!1204)) (currentByte!8729 thiss!1204) (currentBit!8724 thiss!1204)))))

(declare-fun b!175331 () Bool)

(assert (=> b!175331 (= e!122251 (not true))))

(declare-datatypes ((tuple2!15084 0))(
  ( (tuple2!15085 (_1!8187 BitStream!7446) (_2!8187 BitStream!7446)) )
))
(declare-fun lt!270426 () tuple2!15084)

(declare-fun reader!0 (BitStream!7446 BitStream!7446) tuple2!15084)

(assert (=> b!175331 (= lt!270426 (reader!0 thiss!1204 thiss!1204))))

(declare-fun isPrefixOf!0 (BitStream!7446 BitStream!7446) Bool)

(assert (=> b!175331 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!12646 0))(
  ( (Unit!12647) )
))
(declare-fun lt!270427 () Unit!12646)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7446) Unit!12646)

(assert (=> b!175331 (= lt!270427 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun res!145187 () Bool)

(assert (=> start!38938 (=> (not res!145187) (not e!122252))))

(assert (=> start!38938 (= res!145187 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!38938 e!122252))

(assert (=> start!38938 true))

(declare-fun e!122253 () Bool)

(declare-fun inv!12 (BitStream!7446) Bool)

(assert (=> start!38938 (and (inv!12 thiss!1204) e!122253)))

(declare-fun b!175332 () Bool)

(declare-fun array_inv!3910 (array!9448) Bool)

(assert (=> b!175332 (= e!122253 (array_inv!3910 (buf!4606 thiss!1204)))))

(assert (= (and start!38938 res!145187) b!175328))

(assert (= (and b!175328 res!145184) b!175329))

(assert (= (and b!175329 res!145186) b!175327))

(assert (= (and b!175327 res!145185) b!175330))

(assert (= (and b!175330 res!145188) b!175331))

(assert (= start!38938 b!175332))

(declare-fun m!275519 () Bool)

(assert (=> b!175329 m!275519))

(declare-fun m!275521 () Bool)

(assert (=> start!38938 m!275521))

(declare-fun m!275523 () Bool)

(assert (=> b!175331 m!275523))

(declare-fun m!275525 () Bool)

(assert (=> b!175331 m!275525))

(declare-fun m!275527 () Bool)

(assert (=> b!175331 m!275527))

(declare-fun m!275529 () Bool)

(assert (=> b!175332 m!275529))

(declare-fun m!275531 () Bool)

(assert (=> b!175328 m!275531))

(declare-fun m!275533 () Bool)

(assert (=> b!175330 m!275533))

(check-sat (not start!38938) (not b!175328) (not b!175332) (not b!175329) (not b!175330) (not b!175331))
