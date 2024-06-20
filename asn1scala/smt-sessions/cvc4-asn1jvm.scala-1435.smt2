; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39432 () Bool)

(assert start!39432)

(declare-fun b!177332 () Bool)

(declare-fun e!123571 () Bool)

(declare-fun e!123570 () Bool)

(assert (=> b!177332 (= e!123571 e!123570)))

(declare-fun res!147002 () Bool)

(assert (=> b!177332 (=> (not res!147002) (not e!123570))))

(declare-fun lt!272412 () Bool)

(declare-datatypes ((array!9573 0))(
  ( (array!9574 (arr!5151 (Array (_ BitVec 32) (_ BitVec 8))) (size!4221 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7550 0))(
  ( (BitStream!7551 (buf!4664 array!9573) (currentByte!8844 (_ BitVec 32)) (currentBit!8839 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15280 0))(
  ( (tuple2!15281 (_1!8285 BitStream!7550) (_2!8285 Bool)) )
))
(declare-fun lt!272411 () tuple2!15280)

(declare-datatypes ((Unit!12756 0))(
  ( (Unit!12757) )
))
(declare-datatypes ((tuple2!15282 0))(
  ( (tuple2!15283 (_1!8286 Unit!12756) (_2!8286 BitStream!7550)) )
))
(declare-fun lt!272417 () tuple2!15282)

(assert (=> b!177332 (= res!147002 (and (= (_2!8285 lt!272411) lt!272412) (= (_1!8285 lt!272411) (_2!8286 lt!272417))))))

(declare-fun thiss!1204 () BitStream!7550)

(declare-fun readBitPure!0 (BitStream!7550) tuple2!15280)

(declare-fun readerFrom!0 (BitStream!7550 (_ BitVec 32) (_ BitVec 32)) BitStream!7550)

(assert (=> b!177332 (= lt!272411 (readBitPure!0 (readerFrom!0 (_2!8286 lt!272417) (currentBit!8839 thiss!1204) (currentByte!8844 thiss!1204))))))

(declare-fun b!177333 () Bool)

(declare-fun res!146999 () Bool)

(declare-fun e!123568 () Bool)

(assert (=> b!177333 (=> (not res!146999) (not e!123568))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!177333 (= res!146999 (invariant!0 (currentBit!8839 thiss!1204) (currentByte!8844 thiss!1204) (size!4221 (buf!4664 thiss!1204))))))

(declare-fun b!177334 () Bool)

(declare-fun e!123567 () Bool)

(declare-fun array_inv!3962 (array!9573) Bool)

(assert (=> b!177334 (= e!123567 (array_inv!3962 (buf!4664 thiss!1204)))))

(declare-fun b!177335 () Bool)

(declare-fun res!147006 () Bool)

(assert (=> b!177335 (=> (not res!147006) (not e!123571))))

(declare-fun isPrefixOf!0 (BitStream!7550 BitStream!7550) Bool)

(assert (=> b!177335 (= res!147006 (isPrefixOf!0 thiss!1204 (_2!8286 lt!272417)))))

(declare-fun b!177336 () Bool)

(declare-fun res!146997 () Bool)

(assert (=> b!177336 (=> (not res!146997) (not e!123568))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!177336 (= res!146997 (not (= i!590 nBits!348)))))

(declare-fun b!177337 () Bool)

(declare-fun res!147003 () Bool)

(assert (=> b!177337 (=> (not res!147003) (not e!123568))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!177337 (= res!147003 (validate_offset_bits!1 ((_ sign_extend 32) (size!4221 (buf!4664 thiss!1204))) ((_ sign_extend 32) (currentByte!8844 thiss!1204)) ((_ sign_extend 32) (currentBit!8839 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun res!147005 () Bool)

(assert (=> start!39432 (=> (not res!147005) (not e!123568))))

(assert (=> start!39432 (= res!147005 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39432 e!123568))

(assert (=> start!39432 true))

(declare-fun inv!12 (BitStream!7550) Bool)

(assert (=> start!39432 (and (inv!12 thiss!1204) e!123567)))

(declare-fun b!177338 () Bool)

(declare-fun e!123572 () Bool)

(assert (=> b!177338 (= e!123568 (not e!123572))))

(declare-fun res!147004 () Bool)

(assert (=> b!177338 (=> res!147004 e!123572)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!177338 (= res!147004 (not (= (bitIndex!0 (size!4221 (buf!4664 (_2!8286 lt!272417))) (currentByte!8844 (_2!8286 lt!272417)) (currentBit!8839 (_2!8286 lt!272417))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4221 (buf!4664 thiss!1204)) (currentByte!8844 thiss!1204) (currentBit!8839 thiss!1204))))))))

(declare-fun e!123573 () Bool)

(assert (=> b!177338 e!123573))

(declare-fun res!146998 () Bool)

(assert (=> b!177338 (=> (not res!146998) (not e!123573))))

(assert (=> b!177338 (= res!146998 (= (size!4221 (buf!4664 thiss!1204)) (size!4221 (buf!4664 (_2!8286 lt!272417)))))))

(declare-fun appendBit!0 (BitStream!7550 Bool) tuple2!15282)

(assert (=> b!177338 (= lt!272417 (appendBit!0 thiss!1204 lt!272412))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!177338 (= lt!272412 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!177339 () Bool)

(declare-fun e!123574 () Bool)

(assert (=> b!177339 (= e!123572 e!123574)))

(declare-fun res!147001 () Bool)

(assert (=> b!177339 (=> res!147001 e!123574)))

(assert (=> b!177339 (= res!147001 (not (isPrefixOf!0 thiss!1204 (_2!8286 lt!272417))))))

(declare-fun lt!272416 () tuple2!15282)

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7550 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15282)

(assert (=> b!177339 (= lt!272416 (appendBitsLSBFirstLoopTR!0 (_2!8286 lt!272417) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!177340 () Bool)

(assert (=> b!177340 (= e!123574 true)))

(declare-fun lt!272413 () Bool)

(assert (=> b!177340 (= lt!272413 (isPrefixOf!0 (_2!8286 lt!272417) (_2!8286 lt!272416)))))

(declare-fun b!177341 () Bool)

(declare-fun lt!272414 () (_ BitVec 64))

(assert (=> b!177341 (= e!123570 (= (bitIndex!0 (size!4221 (buf!4664 (_1!8285 lt!272411))) (currentByte!8844 (_1!8285 lt!272411)) (currentBit!8839 (_1!8285 lt!272411))) lt!272414))))

(declare-fun b!177342 () Bool)

(assert (=> b!177342 (= e!123573 e!123571)))

(declare-fun res!147000 () Bool)

(assert (=> b!177342 (=> (not res!147000) (not e!123571))))

(declare-fun lt!272415 () (_ BitVec 64))

(assert (=> b!177342 (= res!147000 (= lt!272414 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!272415)))))

(assert (=> b!177342 (= lt!272414 (bitIndex!0 (size!4221 (buf!4664 (_2!8286 lt!272417))) (currentByte!8844 (_2!8286 lt!272417)) (currentBit!8839 (_2!8286 lt!272417))))))

(assert (=> b!177342 (= lt!272415 (bitIndex!0 (size!4221 (buf!4664 thiss!1204)) (currentByte!8844 thiss!1204) (currentBit!8839 thiss!1204)))))

(assert (= (and start!39432 res!147005) b!177337))

(assert (= (and b!177337 res!147003) b!177333))

(assert (= (and b!177333 res!146999) b!177336))

(assert (= (and b!177336 res!146997) b!177338))

(assert (= (and b!177338 res!146998) b!177342))

(assert (= (and b!177342 res!147000) b!177335))

(assert (= (and b!177335 res!147006) b!177332))

(assert (= (and b!177332 res!147002) b!177341))

(assert (= (and b!177338 (not res!147004)) b!177339))

(assert (= (and b!177339 (not res!147001)) b!177340))

(assert (= start!39432 b!177334))

(declare-fun m!277253 () Bool)

(assert (=> b!177340 m!277253))

(declare-fun m!277255 () Bool)

(assert (=> b!177339 m!277255))

(declare-fun m!277257 () Bool)

(assert (=> b!177339 m!277257))

(declare-fun m!277259 () Bool)

(assert (=> b!177337 m!277259))

(declare-fun m!277261 () Bool)

(assert (=> b!177334 m!277261))

(declare-fun m!277263 () Bool)

(assert (=> start!39432 m!277263))

(declare-fun m!277265 () Bool)

(assert (=> b!177341 m!277265))

(declare-fun m!277267 () Bool)

(assert (=> b!177333 m!277267))

(declare-fun m!277269 () Bool)

(assert (=> b!177332 m!277269))

(assert (=> b!177332 m!277269))

(declare-fun m!277271 () Bool)

(assert (=> b!177332 m!277271))

(declare-fun m!277273 () Bool)

(assert (=> b!177338 m!277273))

(declare-fun m!277275 () Bool)

(assert (=> b!177338 m!277275))

(declare-fun m!277277 () Bool)

(assert (=> b!177338 m!277277))

(assert (=> b!177342 m!277273))

(assert (=> b!177342 m!277275))

(assert (=> b!177335 m!277255))

(push 1)

(assert (not b!177335))

(assert (not b!177333))

(assert (not b!177334))

(assert (not b!177338))

(assert (not b!177340))

(assert (not b!177342))

(assert (not b!177337))

(assert (not start!39432))

(assert (not b!177332))

(assert (not b!177341))

(assert (not b!177339))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

