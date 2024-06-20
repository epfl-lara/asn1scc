; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39590 () Bool)

(assert start!39590)

(declare-fun res!147802 () Bool)

(declare-fun e!124149 () Bool)

(assert (=> start!39590 (=> (not res!147802) (not e!124149))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!39590 (= res!147802 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39590 e!124149))

(assert (=> start!39590 true))

(declare-datatypes ((array!9605 0))(
  ( (array!9606 (arr!5164 (Array (_ BitVec 32) (_ BitVec 8))) (size!4234 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7576 0))(
  ( (BitStream!7577 (buf!4677 array!9605) (currentByte!8875 (_ BitVec 32)) (currentBit!8870 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7576)

(declare-fun e!124147 () Bool)

(declare-fun inv!12 (BitStream!7576) Bool)

(assert (=> start!39590 (and (inv!12 thiss!1204) e!124147)))

(declare-fun b!178248 () Bool)

(declare-fun e!124146 () Bool)

(declare-datatypes ((tuple2!15368 0))(
  ( (tuple2!15369 (_1!8329 BitStream!7576) (_2!8329 Bool)) )
))
(declare-fun lt!273994 () tuple2!15368)

(declare-fun lt!273998 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!178248 (= e!124146 (= (bitIndex!0 (size!4234 (buf!4677 (_1!8329 lt!273994))) (currentByte!8875 (_1!8329 lt!273994)) (currentBit!8870 (_1!8329 lt!273994))) lt!273998))))

(declare-fun b!178249 () Bool)

(declare-fun e!124145 () Bool)

(assert (=> b!178249 (= e!124149 (not e!124145))))

(declare-fun res!147806 () Bool)

(assert (=> b!178249 (=> res!147806 e!124145)))

(declare-datatypes ((Unit!12848 0))(
  ( (Unit!12849) )
))
(declare-datatypes ((tuple2!15370 0))(
  ( (tuple2!15371 (_1!8330 Unit!12848) (_2!8330 BitStream!7576)) )
))
(declare-fun lt!273997 () tuple2!15370)

(assert (=> b!178249 (= res!147806 (not (= (bitIndex!0 (size!4234 (buf!4677 (_2!8330 lt!273997))) (currentByte!8875 (_2!8330 lt!273997)) (currentBit!8870 (_2!8330 lt!273997))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4234 (buf!4677 thiss!1204)) (currentByte!8875 thiss!1204) (currentBit!8870 thiss!1204))))))))

(declare-fun e!124148 () Bool)

(assert (=> b!178249 e!124148))

(declare-fun res!147810 () Bool)

(assert (=> b!178249 (=> (not res!147810) (not e!124148))))

(assert (=> b!178249 (= res!147810 (= (size!4234 (buf!4677 thiss!1204)) (size!4234 (buf!4677 (_2!8330 lt!273997)))))))

(declare-fun lt!273993 () Bool)

(declare-fun appendBit!0 (BitStream!7576 Bool) tuple2!15370)

(assert (=> b!178249 (= lt!273997 (appendBit!0 thiss!1204 lt!273993))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!178249 (= lt!273993 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!178250 () Bool)

(assert (=> b!178250 (= e!124145 true)))

(declare-fun lt!273996 () (_ BitVec 64))

(declare-fun lt!273992 () tuple2!15370)

(assert (=> b!178250 (= lt!273996 (bitIndex!0 (size!4234 (buf!4677 (_2!8330 lt!273992))) (currentByte!8875 (_2!8330 lt!273992)) (currentBit!8870 (_2!8330 lt!273992))))))

(declare-fun isPrefixOf!0 (BitStream!7576 BitStream!7576) Bool)

(assert (=> b!178250 (isPrefixOf!0 thiss!1204 (_2!8330 lt!273992))))

(declare-fun lt!273995 () Unit!12848)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7576 BitStream!7576 BitStream!7576) Unit!12848)

(assert (=> b!178250 (= lt!273995 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8330 lt!273997) (_2!8330 lt!273992)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7576 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15370)

(assert (=> b!178250 (= lt!273992 (appendBitsLSBFirstLoopTR!0 (_2!8330 lt!273997) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!178251 () Bool)

(declare-fun res!147807 () Bool)

(assert (=> b!178251 (=> (not res!147807) (not e!124149))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!178251 (= res!147807 (validate_offset_bits!1 ((_ sign_extend 32) (size!4234 (buf!4677 thiss!1204))) ((_ sign_extend 32) (currentByte!8875 thiss!1204)) ((_ sign_extend 32) (currentBit!8870 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!178252 () Bool)

(declare-fun array_inv!3975 (array!9605) Bool)

(assert (=> b!178252 (= e!124147 (array_inv!3975 (buf!4677 thiss!1204)))))

(declare-fun b!178253 () Bool)

(declare-fun e!124144 () Bool)

(assert (=> b!178253 (= e!124144 e!124146)))

(declare-fun res!147805 () Bool)

(assert (=> b!178253 (=> (not res!147805) (not e!124146))))

(assert (=> b!178253 (= res!147805 (and (= (_2!8329 lt!273994) lt!273993) (= (_1!8329 lt!273994) (_2!8330 lt!273997))))))

(declare-fun readBitPure!0 (BitStream!7576) tuple2!15368)

(declare-fun readerFrom!0 (BitStream!7576 (_ BitVec 32) (_ BitVec 32)) BitStream!7576)

(assert (=> b!178253 (= lt!273994 (readBitPure!0 (readerFrom!0 (_2!8330 lt!273997) (currentBit!8870 thiss!1204) (currentByte!8875 thiss!1204))))))

(declare-fun b!178254 () Bool)

(declare-fun res!147808 () Bool)

(assert (=> b!178254 (=> (not res!147808) (not e!124144))))

(assert (=> b!178254 (= res!147808 (isPrefixOf!0 thiss!1204 (_2!8330 lt!273997)))))

(declare-fun b!178255 () Bool)

(declare-fun res!147803 () Bool)

(assert (=> b!178255 (=> (not res!147803) (not e!124149))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!178255 (= res!147803 (invariant!0 (currentBit!8870 thiss!1204) (currentByte!8875 thiss!1204) (size!4234 (buf!4677 thiss!1204))))))

(declare-fun b!178256 () Bool)

(assert (=> b!178256 (= e!124148 e!124144)))

(declare-fun res!147809 () Bool)

(assert (=> b!178256 (=> (not res!147809) (not e!124144))))

(declare-fun lt!273991 () (_ BitVec 64))

(assert (=> b!178256 (= res!147809 (= lt!273998 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!273991)))))

(assert (=> b!178256 (= lt!273998 (bitIndex!0 (size!4234 (buf!4677 (_2!8330 lt!273997))) (currentByte!8875 (_2!8330 lt!273997)) (currentBit!8870 (_2!8330 lt!273997))))))

(assert (=> b!178256 (= lt!273991 (bitIndex!0 (size!4234 (buf!4677 thiss!1204)) (currentByte!8875 thiss!1204) (currentBit!8870 thiss!1204)))))

(declare-fun b!178257 () Bool)

(declare-fun res!147804 () Bool)

(assert (=> b!178257 (=> (not res!147804) (not e!124149))))

(assert (=> b!178257 (= res!147804 (not (= i!590 nBits!348)))))

(assert (= (and start!39590 res!147802) b!178251))

(assert (= (and b!178251 res!147807) b!178255))

(assert (= (and b!178255 res!147803) b!178257))

(assert (= (and b!178257 res!147804) b!178249))

(assert (= (and b!178249 res!147810) b!178256))

(assert (= (and b!178256 res!147809) b!178254))

(assert (= (and b!178254 res!147808) b!178253))

(assert (= (and b!178253 res!147805) b!178248))

(assert (= (and b!178249 (not res!147806)) b!178250))

(assert (= start!39590 b!178252))

(declare-fun m!278401 () Bool)

(assert (=> b!178254 m!278401))

(declare-fun m!278403 () Bool)

(assert (=> b!178252 m!278403))

(declare-fun m!278405 () Bool)

(assert (=> b!178255 m!278405))

(declare-fun m!278407 () Bool)

(assert (=> b!178249 m!278407))

(declare-fun m!278409 () Bool)

(assert (=> b!178249 m!278409))

(declare-fun m!278411 () Bool)

(assert (=> b!178249 m!278411))

(declare-fun m!278413 () Bool)

(assert (=> b!178253 m!278413))

(assert (=> b!178253 m!278413))

(declare-fun m!278415 () Bool)

(assert (=> b!178253 m!278415))

(declare-fun m!278417 () Bool)

(assert (=> b!178248 m!278417))

(assert (=> b!178256 m!278407))

(assert (=> b!178256 m!278409))

(declare-fun m!278419 () Bool)

(assert (=> b!178250 m!278419))

(declare-fun m!278421 () Bool)

(assert (=> b!178250 m!278421))

(declare-fun m!278423 () Bool)

(assert (=> b!178250 m!278423))

(declare-fun m!278425 () Bool)

(assert (=> b!178250 m!278425))

(declare-fun m!278427 () Bool)

(assert (=> b!178251 m!278427))

(declare-fun m!278429 () Bool)

(assert (=> start!39590 m!278429))

(push 1)

(assert (not start!39590))

(assert (not b!178250))

(assert (not b!178255))

(assert (not b!178248))

(assert (not b!178249))

(assert (not b!178254))

(assert (not b!178253))

(assert (not b!178251))

(assert (not b!178252))

(assert (not b!178256))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

