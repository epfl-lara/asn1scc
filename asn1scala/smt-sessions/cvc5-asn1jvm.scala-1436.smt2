; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39434 () Bool)

(assert start!39434)

(declare-fun res!147030 () Bool)

(declare-fun e!123591 () Bool)

(assert (=> start!39434 (=> (not res!147030) (not e!123591))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!39434 (= res!147030 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39434 e!123591))

(assert (=> start!39434 true))

(declare-datatypes ((array!9575 0))(
  ( (array!9576 (arr!5152 (Array (_ BitVec 32) (_ BitVec 8))) (size!4222 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7552 0))(
  ( (BitStream!7553 (buf!4665 array!9575) (currentByte!8845 (_ BitVec 32)) (currentBit!8840 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7552)

(declare-fun e!123595 () Bool)

(declare-fun inv!12 (BitStream!7552) Bool)

(assert (=> start!39434 (and (inv!12 thiss!1204) e!123595)))

(declare-fun b!177365 () Bool)

(declare-fun e!123598 () Bool)

(declare-fun e!123594 () Bool)

(assert (=> b!177365 (= e!123598 e!123594)))

(declare-fun res!147033 () Bool)

(assert (=> b!177365 (=> res!147033 e!123594)))

(declare-datatypes ((Unit!12758 0))(
  ( (Unit!12759) )
))
(declare-datatypes ((tuple2!15284 0))(
  ( (tuple2!15285 (_1!8287 Unit!12758) (_2!8287 BitStream!7552)) )
))
(declare-fun lt!272438 () tuple2!15284)

(declare-fun isPrefixOf!0 (BitStream!7552 BitStream!7552) Bool)

(assert (=> b!177365 (= res!147033 (not (isPrefixOf!0 thiss!1204 (_2!8287 lt!272438))))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!272433 () tuple2!15284)

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7552 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15284)

(assert (=> b!177365 (= lt!272433 (appendBitsLSBFirstLoopTR!0 (_2!8287 lt!272438) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!177366 () Bool)

(assert (=> b!177366 (= e!123591 (not e!123598))))

(declare-fun res!147029 () Bool)

(assert (=> b!177366 (=> res!147029 e!123598)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!177366 (= res!147029 (not (= (bitIndex!0 (size!4222 (buf!4665 (_2!8287 lt!272438))) (currentByte!8845 (_2!8287 lt!272438)) (currentBit!8840 (_2!8287 lt!272438))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4222 (buf!4665 thiss!1204)) (currentByte!8845 thiss!1204) (currentBit!8840 thiss!1204))))))))

(declare-fun e!123596 () Bool)

(assert (=> b!177366 e!123596))

(declare-fun res!147036 () Bool)

(assert (=> b!177366 (=> (not res!147036) (not e!123596))))

(assert (=> b!177366 (= res!147036 (= (size!4222 (buf!4665 thiss!1204)) (size!4222 (buf!4665 (_2!8287 lt!272438)))))))

(declare-fun lt!272437 () Bool)

(declare-fun appendBit!0 (BitStream!7552 Bool) tuple2!15284)

(assert (=> b!177366 (= lt!272438 (appendBit!0 thiss!1204 lt!272437))))

(assert (=> b!177366 (= lt!272437 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!177367 () Bool)

(declare-fun e!123592 () Bool)

(assert (=> b!177367 (= e!123596 e!123592)))

(declare-fun res!147032 () Bool)

(assert (=> b!177367 (=> (not res!147032) (not e!123592))))

(declare-fun lt!272434 () (_ BitVec 64))

(declare-fun lt!272432 () (_ BitVec 64))

(assert (=> b!177367 (= res!147032 (= lt!272434 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!272432)))))

(assert (=> b!177367 (= lt!272434 (bitIndex!0 (size!4222 (buf!4665 (_2!8287 lt!272438))) (currentByte!8845 (_2!8287 lt!272438)) (currentBit!8840 (_2!8287 lt!272438))))))

(assert (=> b!177367 (= lt!272432 (bitIndex!0 (size!4222 (buf!4665 thiss!1204)) (currentByte!8845 thiss!1204) (currentBit!8840 thiss!1204)))))

(declare-fun b!177368 () Bool)

(declare-fun array_inv!3963 (array!9575) Bool)

(assert (=> b!177368 (= e!123595 (array_inv!3963 (buf!4665 thiss!1204)))))

(declare-fun b!177369 () Bool)

(declare-fun e!123593 () Bool)

(declare-datatypes ((tuple2!15286 0))(
  ( (tuple2!15287 (_1!8288 BitStream!7552) (_2!8288 Bool)) )
))
(declare-fun lt!272436 () tuple2!15286)

(assert (=> b!177369 (= e!123593 (= (bitIndex!0 (size!4222 (buf!4665 (_1!8288 lt!272436))) (currentByte!8845 (_1!8288 lt!272436)) (currentBit!8840 (_1!8288 lt!272436))) lt!272434))))

(declare-fun b!177370 () Bool)

(assert (=> b!177370 (= e!123594 true)))

(declare-fun lt!272435 () Bool)

(assert (=> b!177370 (= lt!272435 (isPrefixOf!0 (_2!8287 lt!272438) (_2!8287 lt!272433)))))

(declare-fun b!177371 () Bool)

(assert (=> b!177371 (= e!123592 e!123593)))

(declare-fun res!147035 () Bool)

(assert (=> b!177371 (=> (not res!147035) (not e!123593))))

(assert (=> b!177371 (= res!147035 (and (= (_2!8288 lt!272436) lt!272437) (= (_1!8288 lt!272436) (_2!8287 lt!272438))))))

(declare-fun readBitPure!0 (BitStream!7552) tuple2!15286)

(declare-fun readerFrom!0 (BitStream!7552 (_ BitVec 32) (_ BitVec 32)) BitStream!7552)

(assert (=> b!177371 (= lt!272436 (readBitPure!0 (readerFrom!0 (_2!8287 lt!272438) (currentBit!8840 thiss!1204) (currentByte!8845 thiss!1204))))))

(declare-fun b!177372 () Bool)

(declare-fun res!147034 () Bool)

(assert (=> b!177372 (=> (not res!147034) (not e!123591))))

(assert (=> b!177372 (= res!147034 (not (= i!590 nBits!348)))))

(declare-fun b!177373 () Bool)

(declare-fun res!147031 () Bool)

(assert (=> b!177373 (=> (not res!147031) (not e!123591))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!177373 (= res!147031 (validate_offset_bits!1 ((_ sign_extend 32) (size!4222 (buf!4665 thiss!1204))) ((_ sign_extend 32) (currentByte!8845 thiss!1204)) ((_ sign_extend 32) (currentBit!8840 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!177374 () Bool)

(declare-fun res!147028 () Bool)

(assert (=> b!177374 (=> (not res!147028) (not e!123592))))

(assert (=> b!177374 (= res!147028 (isPrefixOf!0 thiss!1204 (_2!8287 lt!272438)))))

(declare-fun b!177375 () Bool)

(declare-fun res!147027 () Bool)

(assert (=> b!177375 (=> (not res!147027) (not e!123591))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!177375 (= res!147027 (invariant!0 (currentBit!8840 thiss!1204) (currentByte!8845 thiss!1204) (size!4222 (buf!4665 thiss!1204))))))

(assert (= (and start!39434 res!147030) b!177373))

(assert (= (and b!177373 res!147031) b!177375))

(assert (= (and b!177375 res!147027) b!177372))

(assert (= (and b!177372 res!147034) b!177366))

(assert (= (and b!177366 res!147036) b!177367))

(assert (= (and b!177367 res!147032) b!177374))

(assert (= (and b!177374 res!147028) b!177371))

(assert (= (and b!177371 res!147035) b!177369))

(assert (= (and b!177366 (not res!147029)) b!177365))

(assert (= (and b!177365 (not res!147033)) b!177370))

(assert (= start!39434 b!177368))

(declare-fun m!277279 () Bool)

(assert (=> b!177375 m!277279))

(declare-fun m!277281 () Bool)

(assert (=> b!177368 m!277281))

(declare-fun m!277283 () Bool)

(assert (=> b!177370 m!277283))

(declare-fun m!277285 () Bool)

(assert (=> b!177373 m!277285))

(declare-fun m!277287 () Bool)

(assert (=> b!177369 m!277287))

(declare-fun m!277289 () Bool)

(assert (=> b!177371 m!277289))

(assert (=> b!177371 m!277289))

(declare-fun m!277291 () Bool)

(assert (=> b!177371 m!277291))

(declare-fun m!277293 () Bool)

(assert (=> start!39434 m!277293))

(declare-fun m!277295 () Bool)

(assert (=> b!177367 m!277295))

(declare-fun m!277297 () Bool)

(assert (=> b!177367 m!277297))

(declare-fun m!277299 () Bool)

(assert (=> b!177365 m!277299))

(declare-fun m!277301 () Bool)

(assert (=> b!177365 m!277301))

(assert (=> b!177374 m!277299))

(assert (=> b!177366 m!277295))

(assert (=> b!177366 m!277297))

(declare-fun m!277303 () Bool)

(assert (=> b!177366 m!277303))

(push 1)

(assert (not b!177370))

(assert (not b!177367))

(assert (not b!177371))

(assert (not b!177373))

(assert (not start!39434))

(assert (not b!177365))

(assert (not b!177368))

(assert (not b!177369))

