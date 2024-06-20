; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39594 () Bool)

(assert start!39594)

(declare-fun b!178308 () Bool)

(declare-fun res!147862 () Bool)

(declare-fun e!124191 () Bool)

(assert (=> b!178308 (=> (not res!147862) (not e!124191))))

(declare-datatypes ((array!9609 0))(
  ( (array!9610 (arr!5166 (Array (_ BitVec 32) (_ BitVec 8))) (size!4236 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7580 0))(
  ( (BitStream!7581 (buf!4679 array!9609) (currentByte!8877 (_ BitVec 32)) (currentBit!8872 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7580)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!178308 (= res!147862 (invariant!0 (currentBit!8872 thiss!1204) (currentByte!8877 thiss!1204) (size!4236 (buf!4679 thiss!1204))))))

(declare-fun res!147859 () Bool)

(assert (=> start!39594 (=> (not res!147859) (not e!124191))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!39594 (= res!147859 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39594 e!124191))

(assert (=> start!39594 true))

(declare-fun e!124186 () Bool)

(declare-fun inv!12 (BitStream!7580) Bool)

(assert (=> start!39594 (and (inv!12 thiss!1204) e!124186)))

(declare-fun b!178309 () Bool)

(declare-fun res!147858 () Bool)

(assert (=> b!178309 (=> (not res!147858) (not e!124191))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!178309 (= res!147858 (validate_offset_bits!1 ((_ sign_extend 32) (size!4236 (buf!4679 thiss!1204))) ((_ sign_extend 32) (currentByte!8877 thiss!1204)) ((_ sign_extend 32) (currentBit!8872 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!178310 () Bool)

(declare-fun e!124188 () Bool)

(declare-datatypes ((tuple2!15376 0))(
  ( (tuple2!15377 (_1!8333 BitStream!7580) (_2!8333 Bool)) )
))
(declare-fun lt!274042 () tuple2!15376)

(declare-fun lt!274041 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!178310 (= e!124188 (= (bitIndex!0 (size!4236 (buf!4679 (_1!8333 lt!274042))) (currentByte!8877 (_1!8333 lt!274042)) (currentBit!8872 (_1!8333 lt!274042))) lt!274041))))

(declare-fun b!178311 () Bool)

(declare-fun array_inv!3977 (array!9609) Bool)

(assert (=> b!178311 (= e!124186 (array_inv!3977 (buf!4679 thiss!1204)))))

(declare-fun b!178312 () Bool)

(declare-fun e!124189 () Bool)

(assert (=> b!178312 (= e!124191 (not e!124189))))

(declare-fun res!147857 () Bool)

(assert (=> b!178312 (=> res!147857 e!124189)))

(declare-datatypes ((Unit!12852 0))(
  ( (Unit!12853) )
))
(declare-datatypes ((tuple2!15378 0))(
  ( (tuple2!15379 (_1!8334 Unit!12852) (_2!8334 BitStream!7580)) )
))
(declare-fun lt!274045 () tuple2!15378)

(assert (=> b!178312 (= res!147857 (not (= (bitIndex!0 (size!4236 (buf!4679 (_2!8334 lt!274045))) (currentByte!8877 (_2!8334 lt!274045)) (currentBit!8872 (_2!8334 lt!274045))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4236 (buf!4679 thiss!1204)) (currentByte!8877 thiss!1204) (currentBit!8872 thiss!1204))))))))

(declare-fun e!124190 () Bool)

(assert (=> b!178312 e!124190))

(declare-fun res!147860 () Bool)

(assert (=> b!178312 (=> (not res!147860) (not e!124190))))

(assert (=> b!178312 (= res!147860 (= (size!4236 (buf!4679 thiss!1204)) (size!4236 (buf!4679 (_2!8334 lt!274045)))))))

(declare-fun lt!274044 () Bool)

(declare-fun appendBit!0 (BitStream!7580 Bool) tuple2!15378)

(assert (=> b!178312 (= lt!274045 (appendBit!0 thiss!1204 lt!274044))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!178312 (= lt!274044 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!178313 () Bool)

(declare-fun res!147864 () Bool)

(assert (=> b!178313 (=> (not res!147864) (not e!124191))))

(assert (=> b!178313 (= res!147864 (not (= i!590 nBits!348)))))

(declare-fun b!178314 () Bool)

(declare-fun res!147863 () Bool)

(declare-fun e!124192 () Bool)

(assert (=> b!178314 (=> (not res!147863) (not e!124192))))

(declare-fun isPrefixOf!0 (BitStream!7580 BitStream!7580) Bool)

(assert (=> b!178314 (= res!147863 (isPrefixOf!0 thiss!1204 (_2!8334 lt!274045)))))

(declare-fun b!178315 () Bool)

(assert (=> b!178315 (= e!124192 e!124188)))

(declare-fun res!147856 () Bool)

(assert (=> b!178315 (=> (not res!147856) (not e!124188))))

(assert (=> b!178315 (= res!147856 (and (= (_2!8333 lt!274042) lt!274044) (= (_1!8333 lt!274042) (_2!8334 lt!274045))))))

(declare-fun readBitPure!0 (BitStream!7580) tuple2!15376)

(declare-fun readerFrom!0 (BitStream!7580 (_ BitVec 32) (_ BitVec 32)) BitStream!7580)

(assert (=> b!178315 (= lt!274042 (readBitPure!0 (readerFrom!0 (_2!8334 lt!274045) (currentBit!8872 thiss!1204) (currentByte!8877 thiss!1204))))))

(declare-fun b!178316 () Bool)

(assert (=> b!178316 (= e!124190 e!124192)))

(declare-fun res!147861 () Bool)

(assert (=> b!178316 (=> (not res!147861) (not e!124192))))

(declare-fun lt!274040 () (_ BitVec 64))

(assert (=> b!178316 (= res!147861 (= lt!274041 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!274040)))))

(assert (=> b!178316 (= lt!274041 (bitIndex!0 (size!4236 (buf!4679 (_2!8334 lt!274045))) (currentByte!8877 (_2!8334 lt!274045)) (currentBit!8872 (_2!8334 lt!274045))))))

(assert (=> b!178316 (= lt!274040 (bitIndex!0 (size!4236 (buf!4679 thiss!1204)) (currentByte!8877 thiss!1204) (currentBit!8872 thiss!1204)))))

(declare-fun b!178317 () Bool)

(assert (=> b!178317 (= e!124189 true)))

(declare-fun lt!274046 () (_ BitVec 64))

(declare-fun lt!274039 () tuple2!15378)

(assert (=> b!178317 (= lt!274046 (bitIndex!0 (size!4236 (buf!4679 (_2!8334 lt!274039))) (currentByte!8877 (_2!8334 lt!274039)) (currentBit!8872 (_2!8334 lt!274039))))))

(assert (=> b!178317 (isPrefixOf!0 thiss!1204 (_2!8334 lt!274039))))

(declare-fun lt!274043 () Unit!12852)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7580 BitStream!7580 BitStream!7580) Unit!12852)

(assert (=> b!178317 (= lt!274043 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8334 lt!274045) (_2!8334 lt!274039)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7580 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15378)

(assert (=> b!178317 (= lt!274039 (appendBitsLSBFirstLoopTR!0 (_2!8334 lt!274045) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(assert (= (and start!39594 res!147859) b!178309))

(assert (= (and b!178309 res!147858) b!178308))

(assert (= (and b!178308 res!147862) b!178313))

(assert (= (and b!178313 res!147864) b!178312))

(assert (= (and b!178312 res!147860) b!178316))

(assert (= (and b!178316 res!147861) b!178314))

(assert (= (and b!178314 res!147863) b!178315))

(assert (= (and b!178315 res!147856) b!178310))

(assert (= (and b!178312 (not res!147857)) b!178317))

(assert (= start!39594 b!178311))

(declare-fun m!278461 () Bool)

(assert (=> b!178308 m!278461))

(declare-fun m!278463 () Bool)

(assert (=> b!178315 m!278463))

(assert (=> b!178315 m!278463))

(declare-fun m!278465 () Bool)

(assert (=> b!178315 m!278465))

(declare-fun m!278467 () Bool)

(assert (=> b!178309 m!278467))

(declare-fun m!278469 () Bool)

(assert (=> b!178311 m!278469))

(declare-fun m!278471 () Bool)

(assert (=> b!178312 m!278471))

(declare-fun m!278473 () Bool)

(assert (=> b!178312 m!278473))

(declare-fun m!278475 () Bool)

(assert (=> b!178312 m!278475))

(declare-fun m!278477 () Bool)

(assert (=> start!39594 m!278477))

(declare-fun m!278479 () Bool)

(assert (=> b!178310 m!278479))

(declare-fun m!278481 () Bool)

(assert (=> b!178317 m!278481))

(declare-fun m!278483 () Bool)

(assert (=> b!178317 m!278483))

(declare-fun m!278485 () Bool)

(assert (=> b!178317 m!278485))

(declare-fun m!278487 () Bool)

(assert (=> b!178317 m!278487))

(assert (=> b!178316 m!278471))

(assert (=> b!178316 m!278473))

(declare-fun m!278489 () Bool)

(assert (=> b!178314 m!278489))

(push 1)

(assert (not b!178316))

(assert (not start!39594))

(assert (not b!178317))

(assert (not b!178314))

(assert (not b!178315))

(assert (not b!178308))

(assert (not b!178310))

(assert (not b!178312))

(assert (not b!178311))

(assert (not b!178309))

(check-sat)

(pop 1)

