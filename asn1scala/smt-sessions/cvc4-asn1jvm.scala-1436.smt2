; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39438 () Bool)

(assert start!39438)

(declare-fun b!177431 () Bool)

(declare-fun e!123640 () Bool)

(assert (=> b!177431 (= e!123640 true)))

(declare-fun lt!272474 () Bool)

(declare-datatypes ((array!9579 0))(
  ( (array!9580 (arr!5154 (Array (_ BitVec 32) (_ BitVec 8))) (size!4224 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7556 0))(
  ( (BitStream!7557 (buf!4667 array!9579) (currentByte!8847 (_ BitVec 32)) (currentBit!8842 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!12762 0))(
  ( (Unit!12763) )
))
(declare-datatypes ((tuple2!15292 0))(
  ( (tuple2!15293 (_1!8291 Unit!12762) (_2!8291 BitStream!7556)) )
))
(declare-fun lt!272480 () tuple2!15292)

(declare-fun lt!272478 () tuple2!15292)

(declare-fun isPrefixOf!0 (BitStream!7556 BitStream!7556) Bool)

(assert (=> b!177431 (= lt!272474 (isPrefixOf!0 (_2!8291 lt!272480) (_2!8291 lt!272478)))))

(declare-fun b!177432 () Bool)

(declare-fun res!147091 () Bool)

(declare-fun e!123643 () Bool)

(assert (=> b!177432 (=> (not res!147091) (not e!123643))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!177432 (= res!147091 (not (= i!590 nBits!348)))))

(declare-fun b!177433 () Bool)

(declare-fun res!147089 () Bool)

(assert (=> b!177433 (=> (not res!147089) (not e!123643))))

(declare-fun thiss!1204 () BitStream!7556)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!177433 (= res!147089 (validate_offset_bits!1 ((_ sign_extend 32) (size!4224 (buf!4667 thiss!1204))) ((_ sign_extend 32) (currentByte!8847 thiss!1204)) ((_ sign_extend 32) (currentBit!8842 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!177434 () Bool)

(declare-fun e!123639 () Bool)

(declare-datatypes ((tuple2!15294 0))(
  ( (tuple2!15295 (_1!8292 BitStream!7556) (_2!8292 Bool)) )
))
(declare-fun lt!272479 () tuple2!15294)

(declare-fun lt!272476 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!177434 (= e!123639 (= (bitIndex!0 (size!4224 (buf!4667 (_1!8292 lt!272479))) (currentByte!8847 (_1!8292 lt!272479)) (currentBit!8842 (_1!8292 lt!272479))) lt!272476))))

(declare-fun b!177435 () Bool)

(declare-fun e!123641 () Bool)

(assert (=> b!177435 (= e!123643 (not e!123641))))

(declare-fun res!147092 () Bool)

(assert (=> b!177435 (=> res!147092 e!123641)))

(assert (=> b!177435 (= res!147092 (not (= (bitIndex!0 (size!4224 (buf!4667 (_2!8291 lt!272480))) (currentByte!8847 (_2!8291 lt!272480)) (currentBit!8842 (_2!8291 lt!272480))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4224 (buf!4667 thiss!1204)) (currentByte!8847 thiss!1204) (currentBit!8842 thiss!1204))))))))

(declare-fun e!123644 () Bool)

(assert (=> b!177435 e!123644))

(declare-fun res!147090 () Bool)

(assert (=> b!177435 (=> (not res!147090) (not e!123644))))

(assert (=> b!177435 (= res!147090 (= (size!4224 (buf!4667 thiss!1204)) (size!4224 (buf!4667 (_2!8291 lt!272480)))))))

(declare-fun lt!272475 () Bool)

(declare-fun appendBit!0 (BitStream!7556 Bool) tuple2!15292)

(assert (=> b!177435 (= lt!272480 (appendBit!0 thiss!1204 lt!272475))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!177435 (= lt!272475 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!177436 () Bool)

(assert (=> b!177436 (= e!123641 e!123640)))

(declare-fun res!147093 () Bool)

(assert (=> b!177436 (=> res!147093 e!123640)))

(assert (=> b!177436 (= res!147093 (not (isPrefixOf!0 thiss!1204 (_2!8291 lt!272480))))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7556 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15292)

(assert (=> b!177436 (= lt!272478 (appendBitsLSBFirstLoopTR!0 (_2!8291 lt!272480) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!177437 () Bool)

(declare-fun e!123645 () Bool)

(assert (=> b!177437 (= e!123644 e!123645)))

(declare-fun res!147088 () Bool)

(assert (=> b!177437 (=> (not res!147088) (not e!123645))))

(declare-fun lt!272477 () (_ BitVec 64))

(assert (=> b!177437 (= res!147088 (= lt!272476 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!272477)))))

(assert (=> b!177437 (= lt!272476 (bitIndex!0 (size!4224 (buf!4667 (_2!8291 lt!272480))) (currentByte!8847 (_2!8291 lt!272480)) (currentBit!8842 (_2!8291 lt!272480))))))

(assert (=> b!177437 (= lt!272477 (bitIndex!0 (size!4224 (buf!4667 thiss!1204)) (currentByte!8847 thiss!1204) (currentBit!8842 thiss!1204)))))

(declare-fun res!147094 () Bool)

(assert (=> start!39438 (=> (not res!147094) (not e!123643))))

(assert (=> start!39438 (= res!147094 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39438 e!123643))

(assert (=> start!39438 true))

(declare-fun e!123646 () Bool)

(declare-fun inv!12 (BitStream!7556) Bool)

(assert (=> start!39438 (and (inv!12 thiss!1204) e!123646)))

(declare-fun b!177438 () Bool)

(declare-fun array_inv!3965 (array!9579) Bool)

(assert (=> b!177438 (= e!123646 (array_inv!3965 (buf!4667 thiss!1204)))))

(declare-fun b!177439 () Bool)

(declare-fun res!147096 () Bool)

(assert (=> b!177439 (=> (not res!147096) (not e!123645))))

(assert (=> b!177439 (= res!147096 (isPrefixOf!0 thiss!1204 (_2!8291 lt!272480)))))

(declare-fun b!177440 () Bool)

(assert (=> b!177440 (= e!123645 e!123639)))

(declare-fun res!147087 () Bool)

(assert (=> b!177440 (=> (not res!147087) (not e!123639))))

(assert (=> b!177440 (= res!147087 (and (= (_2!8292 lt!272479) lt!272475) (= (_1!8292 lt!272479) (_2!8291 lt!272480))))))

(declare-fun readBitPure!0 (BitStream!7556) tuple2!15294)

(declare-fun readerFrom!0 (BitStream!7556 (_ BitVec 32) (_ BitVec 32)) BitStream!7556)

(assert (=> b!177440 (= lt!272479 (readBitPure!0 (readerFrom!0 (_2!8291 lt!272480) (currentBit!8842 thiss!1204) (currentByte!8847 thiss!1204))))))

(declare-fun b!177441 () Bool)

(declare-fun res!147095 () Bool)

(assert (=> b!177441 (=> (not res!147095) (not e!123643))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!177441 (= res!147095 (invariant!0 (currentBit!8842 thiss!1204) (currentByte!8847 thiss!1204) (size!4224 (buf!4667 thiss!1204))))))

(assert (= (and start!39438 res!147094) b!177433))

(assert (= (and b!177433 res!147089) b!177441))

(assert (= (and b!177441 res!147095) b!177432))

(assert (= (and b!177432 res!147091) b!177435))

(assert (= (and b!177435 res!147090) b!177437))

(assert (= (and b!177437 res!147088) b!177439))

(assert (= (and b!177439 res!147096) b!177440))

(assert (= (and b!177440 res!147087) b!177434))

(assert (= (and b!177435 (not res!147092)) b!177436))

(assert (= (and b!177436 (not res!147093)) b!177431))

(assert (= start!39438 b!177438))

(declare-fun m!277331 () Bool)

(assert (=> b!177438 m!277331))

(declare-fun m!277333 () Bool)

(assert (=> b!177439 m!277333))

(declare-fun m!277335 () Bool)

(assert (=> b!177440 m!277335))

(assert (=> b!177440 m!277335))

(declare-fun m!277337 () Bool)

(assert (=> b!177440 m!277337))

(declare-fun m!277339 () Bool)

(assert (=> b!177434 m!277339))

(declare-fun m!277341 () Bool)

(assert (=> b!177431 m!277341))

(declare-fun m!277343 () Bool)

(assert (=> b!177435 m!277343))

(declare-fun m!277345 () Bool)

(assert (=> b!177435 m!277345))

(declare-fun m!277347 () Bool)

(assert (=> b!177435 m!277347))

(assert (=> b!177437 m!277343))

(assert (=> b!177437 m!277345))

(declare-fun m!277349 () Bool)

(assert (=> b!177433 m!277349))

(assert (=> b!177436 m!277333))

(declare-fun m!277351 () Bool)

(assert (=> b!177436 m!277351))

(declare-fun m!277353 () Bool)

(assert (=> b!177441 m!277353))

(declare-fun m!277355 () Bool)

(assert (=> start!39438 m!277355))

(push 1)

(assert (not b!177440))

(assert (not b!177439))

(assert (not b!177435))

(assert (not b!177441))

(assert (not b!177433))

(assert (not b!177431))

(assert (not b!177437))

(assert (not b!177438))

(assert (not b!177434))

(assert (not b!177436))

(assert (not start!39438))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

