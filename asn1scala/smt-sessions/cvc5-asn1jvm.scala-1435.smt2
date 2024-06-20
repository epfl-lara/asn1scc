; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39428 () Bool)

(assert start!39428)

(declare-fun b!177266 () Bool)

(declare-fun e!123526 () Bool)

(declare-fun e!123519 () Bool)

(assert (=> b!177266 (= e!123526 e!123519)))

(declare-fun res!146940 () Bool)

(assert (=> b!177266 (=> res!146940 e!123519)))

(declare-datatypes ((array!9569 0))(
  ( (array!9570 (arr!5149 (Array (_ BitVec 32) (_ BitVec 8))) (size!4219 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7546 0))(
  ( (BitStream!7547 (buf!4662 array!9569) (currentByte!8842 (_ BitVec 32)) (currentBit!8837 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7546)

(declare-datatypes ((Unit!12752 0))(
  ( (Unit!12753) )
))
(declare-datatypes ((tuple2!15272 0))(
  ( (tuple2!15273 (_1!8281 Unit!12752) (_2!8281 BitStream!7546)) )
))
(declare-fun lt!272374 () tuple2!15272)

(declare-fun isPrefixOf!0 (BitStream!7546 BitStream!7546) Bool)

(assert (=> b!177266 (= res!146940 (not (isPrefixOf!0 thiss!1204 (_2!8281 lt!272374))))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!272369 () tuple2!15272)

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7546 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15272)

(assert (=> b!177266 (= lt!272369 (appendBitsLSBFirstLoopTR!0 (_2!8281 lt!272374) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!177267 () Bool)

(declare-fun res!146945 () Bool)

(declare-fun e!123520 () Bool)

(assert (=> b!177267 (=> (not res!146945) (not e!123520))))

(assert (=> b!177267 (= res!146945 (not (= i!590 nBits!348)))))

(declare-fun b!177268 () Bool)

(declare-fun res!146942 () Bool)

(declare-fun e!123525 () Bool)

(assert (=> b!177268 (=> (not res!146942) (not e!123525))))

(assert (=> b!177268 (= res!146942 (isPrefixOf!0 thiss!1204 (_2!8281 lt!272374)))))

(declare-fun b!177269 () Bool)

(declare-fun e!123522 () Bool)

(assert (=> b!177269 (= e!123525 e!123522)))

(declare-fun res!146937 () Bool)

(assert (=> b!177269 (=> (not res!146937) (not e!123522))))

(declare-fun lt!272372 () Bool)

(declare-datatypes ((tuple2!15274 0))(
  ( (tuple2!15275 (_1!8282 BitStream!7546) (_2!8282 Bool)) )
))
(declare-fun lt!272373 () tuple2!15274)

(assert (=> b!177269 (= res!146937 (and (= (_2!8282 lt!272373) lt!272372) (= (_1!8282 lt!272373) (_2!8281 lt!272374))))))

(declare-fun readBitPure!0 (BitStream!7546) tuple2!15274)

(declare-fun readerFrom!0 (BitStream!7546 (_ BitVec 32) (_ BitVec 32)) BitStream!7546)

(assert (=> b!177269 (= lt!272373 (readBitPure!0 (readerFrom!0 (_2!8281 lt!272374) (currentBit!8837 thiss!1204) (currentByte!8842 thiss!1204))))))

(declare-fun b!177270 () Bool)

(declare-fun e!123521 () Bool)

(declare-fun array_inv!3960 (array!9569) Bool)

(assert (=> b!177270 (= e!123521 (array_inv!3960 (buf!4662 thiss!1204)))))

(declare-fun b!177271 () Bool)

(declare-fun res!146939 () Bool)

(assert (=> b!177271 (=> (not res!146939) (not e!123520))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!177271 (= res!146939 (invariant!0 (currentBit!8837 thiss!1204) (currentByte!8842 thiss!1204) (size!4219 (buf!4662 thiss!1204))))))

(declare-fun b!177272 () Bool)

(declare-fun res!146938 () Bool)

(assert (=> b!177272 (=> (not res!146938) (not e!123520))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!177272 (= res!146938 (validate_offset_bits!1 ((_ sign_extend 32) (size!4219 (buf!4662 thiss!1204))) ((_ sign_extend 32) (currentByte!8842 thiss!1204)) ((_ sign_extend 32) (currentBit!8837 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!177273 () Bool)

(assert (=> b!177273 (= e!123520 (not e!123526))))

(declare-fun res!146941 () Bool)

(assert (=> b!177273 (=> res!146941 e!123526)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!177273 (= res!146941 (not (= (bitIndex!0 (size!4219 (buf!4662 (_2!8281 lt!272374))) (currentByte!8842 (_2!8281 lt!272374)) (currentBit!8837 (_2!8281 lt!272374))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4219 (buf!4662 thiss!1204)) (currentByte!8842 thiss!1204) (currentBit!8837 thiss!1204))))))))

(declare-fun e!123524 () Bool)

(assert (=> b!177273 e!123524))

(declare-fun res!146944 () Bool)

(assert (=> b!177273 (=> (not res!146944) (not e!123524))))

(assert (=> b!177273 (= res!146944 (= (size!4219 (buf!4662 thiss!1204)) (size!4219 (buf!4662 (_2!8281 lt!272374)))))))

(declare-fun appendBit!0 (BitStream!7546 Bool) tuple2!15272)

(assert (=> b!177273 (= lt!272374 (appendBit!0 thiss!1204 lt!272372))))

(assert (=> b!177273 (= lt!272372 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!177274 () Bool)

(assert (=> b!177274 (= e!123519 true)))

(declare-fun lt!272375 () Bool)

(assert (=> b!177274 (= lt!272375 (isPrefixOf!0 (_2!8281 lt!272374) (_2!8281 lt!272369)))))

(declare-fun b!177275 () Bool)

(declare-fun lt!272370 () (_ BitVec 64))

(assert (=> b!177275 (= e!123522 (= (bitIndex!0 (size!4219 (buf!4662 (_1!8282 lt!272373))) (currentByte!8842 (_1!8282 lt!272373)) (currentBit!8837 (_1!8282 lt!272373))) lt!272370))))

(declare-fun b!177276 () Bool)

(assert (=> b!177276 (= e!123524 e!123525)))

(declare-fun res!146946 () Bool)

(assert (=> b!177276 (=> (not res!146946) (not e!123525))))

(declare-fun lt!272371 () (_ BitVec 64))

(assert (=> b!177276 (= res!146946 (= lt!272370 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!272371)))))

(assert (=> b!177276 (= lt!272370 (bitIndex!0 (size!4219 (buf!4662 (_2!8281 lt!272374))) (currentByte!8842 (_2!8281 lt!272374)) (currentBit!8837 (_2!8281 lt!272374))))))

(assert (=> b!177276 (= lt!272371 (bitIndex!0 (size!4219 (buf!4662 thiss!1204)) (currentByte!8842 thiss!1204) (currentBit!8837 thiss!1204)))))

(declare-fun res!146943 () Bool)

(assert (=> start!39428 (=> (not res!146943) (not e!123520))))

(assert (=> start!39428 (= res!146943 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39428 e!123520))

(assert (=> start!39428 true))

(declare-fun inv!12 (BitStream!7546) Bool)

(assert (=> start!39428 (and (inv!12 thiss!1204) e!123521)))

(assert (= (and start!39428 res!146943) b!177272))

(assert (= (and b!177272 res!146938) b!177271))

(assert (= (and b!177271 res!146939) b!177267))

(assert (= (and b!177267 res!146945) b!177273))

(assert (= (and b!177273 res!146944) b!177276))

(assert (= (and b!177276 res!146946) b!177268))

(assert (= (and b!177268 res!146942) b!177269))

(assert (= (and b!177269 res!146937) b!177275))

(assert (= (and b!177273 (not res!146941)) b!177266))

(assert (= (and b!177266 (not res!146940)) b!177274))

(assert (= start!39428 b!177270))

(declare-fun m!277201 () Bool)

(assert (=> b!177270 m!277201))

(declare-fun m!277203 () Bool)

(assert (=> b!177268 m!277203))

(declare-fun m!277205 () Bool)

(assert (=> start!39428 m!277205))

(declare-fun m!277207 () Bool)

(assert (=> b!177269 m!277207))

(assert (=> b!177269 m!277207))

(declare-fun m!277209 () Bool)

(assert (=> b!177269 m!277209))

(declare-fun m!277211 () Bool)

(assert (=> b!177275 m!277211))

(declare-fun m!277213 () Bool)

(assert (=> b!177272 m!277213))

(declare-fun m!277215 () Bool)

(assert (=> b!177276 m!277215))

(declare-fun m!277217 () Bool)

(assert (=> b!177276 m!277217))

(assert (=> b!177273 m!277215))

(assert (=> b!177273 m!277217))

(declare-fun m!277219 () Bool)

(assert (=> b!177273 m!277219))

(declare-fun m!277221 () Bool)

(assert (=> b!177271 m!277221))

(assert (=> b!177266 m!277203))

(declare-fun m!277223 () Bool)

(assert (=> b!177266 m!277223))

(declare-fun m!277225 () Bool)

(assert (=> b!177274 m!277225))

(push 1)

(assert (not b!177271))

(assert (not b!177272))

(assert (not b!177276))

(assert (not b!177274))

(assert (not start!39428))

(assert (not b!177273))

(assert (not b!177268))

