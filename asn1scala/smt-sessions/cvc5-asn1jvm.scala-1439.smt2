; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39584 () Bool)

(assert start!39584)

(declare-fun b!178158 () Bool)

(declare-fun res!147722 () Bool)

(declare-fun e!124082 () Bool)

(assert (=> b!178158 (=> (not res!147722) (not e!124082))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((array!9599 0))(
  ( (array!9600 (arr!5161 (Array (_ BitVec 32) (_ BitVec 8))) (size!4231 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7570 0))(
  ( (BitStream!7571 (buf!4674 array!9599) (currentByte!8872 (_ BitVec 32)) (currentBit!8867 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7570)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!178158 (= res!147722 (validate_offset_bits!1 ((_ sign_extend 32) (size!4231 (buf!4674 thiss!1204))) ((_ sign_extend 32) (currentByte!8872 thiss!1204)) ((_ sign_extend 32) (currentBit!8867 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!178159 () Bool)

(declare-fun res!147721 () Bool)

(assert (=> b!178159 (=> (not res!147721) (not e!124082))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!178159 (= res!147721 (invariant!0 (currentBit!8867 thiss!1204) (currentByte!8872 thiss!1204) (size!4231 (buf!4674 thiss!1204))))))

(declare-fun b!178160 () Bool)

(declare-fun e!124087 () Bool)

(declare-fun array_inv!3972 (array!9599) Bool)

(assert (=> b!178160 (= e!124087 (array_inv!3972 (buf!4674 thiss!1204)))))

(declare-fun b!178161 () Bool)

(declare-fun e!124081 () Bool)

(assert (=> b!178161 (= e!124082 (not e!124081))))

(declare-fun res!147727 () Bool)

(assert (=> b!178161 (=> res!147727 e!124081)))

(declare-datatypes ((Unit!12842 0))(
  ( (Unit!12843) )
))
(declare-datatypes ((tuple2!15356 0))(
  ( (tuple2!15357 (_1!8323 Unit!12842) (_2!8323 BitStream!7570)) )
))
(declare-fun lt!273925 () tuple2!15356)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!178161 (= res!147727 (not (= (bitIndex!0 (size!4231 (buf!4674 (_2!8323 lt!273925))) (currentByte!8872 (_2!8323 lt!273925)) (currentBit!8867 (_2!8323 lt!273925))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4231 (buf!4674 thiss!1204)) (currentByte!8872 thiss!1204) (currentBit!8867 thiss!1204))))))))

(declare-fun e!124083 () Bool)

(assert (=> b!178161 e!124083))

(declare-fun res!147729 () Bool)

(assert (=> b!178161 (=> (not res!147729) (not e!124083))))

(assert (=> b!178161 (= res!147729 (= (size!4231 (buf!4674 thiss!1204)) (size!4231 (buf!4674 (_2!8323 lt!273925)))))))

(declare-fun lt!273921 () Bool)

(declare-fun appendBit!0 (BitStream!7570 Bool) tuple2!15356)

(assert (=> b!178161 (= lt!273925 (appendBit!0 thiss!1204 lt!273921))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!178161 (= lt!273921 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!178162 () Bool)

(declare-fun e!124086 () Bool)

(declare-datatypes ((tuple2!15358 0))(
  ( (tuple2!15359 (_1!8324 BitStream!7570) (_2!8324 Bool)) )
))
(declare-fun lt!273923 () tuple2!15358)

(declare-fun lt!273919 () (_ BitVec 64))

(assert (=> b!178162 (= e!124086 (= (bitIndex!0 (size!4231 (buf!4674 (_1!8324 lt!273923))) (currentByte!8872 (_1!8324 lt!273923)) (currentBit!8867 (_1!8324 lt!273923))) lt!273919))))

(declare-fun b!178163 () Bool)

(declare-fun e!124085 () Bool)

(assert (=> b!178163 (= e!124083 e!124085)))

(declare-fun res!147723 () Bool)

(assert (=> b!178163 (=> (not res!147723) (not e!124085))))

(declare-fun lt!273922 () (_ BitVec 64))

(assert (=> b!178163 (= res!147723 (= lt!273919 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!273922)))))

(assert (=> b!178163 (= lt!273919 (bitIndex!0 (size!4231 (buf!4674 (_2!8323 lt!273925))) (currentByte!8872 (_2!8323 lt!273925)) (currentBit!8867 (_2!8323 lt!273925))))))

(assert (=> b!178163 (= lt!273922 (bitIndex!0 (size!4231 (buf!4674 thiss!1204)) (currentByte!8872 thiss!1204) (currentBit!8867 thiss!1204)))))

(declare-fun res!147725 () Bool)

(assert (=> start!39584 (=> (not res!147725) (not e!124082))))

(assert (=> start!39584 (= res!147725 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39584 e!124082))

(assert (=> start!39584 true))

(declare-fun inv!12 (BitStream!7570) Bool)

(assert (=> start!39584 (and (inv!12 thiss!1204) e!124087)))

(declare-fun b!178164 () Bool)

(assert (=> b!178164 (= e!124081 true)))

(declare-fun lt!273924 () (_ BitVec 64))

(declare-fun lt!273920 () tuple2!15356)

(assert (=> b!178164 (= lt!273924 (bitIndex!0 (size!4231 (buf!4674 (_2!8323 lt!273920))) (currentByte!8872 (_2!8323 lt!273920)) (currentBit!8867 (_2!8323 lt!273920))))))

(declare-fun isPrefixOf!0 (BitStream!7570 BitStream!7570) Bool)

(assert (=> b!178164 (isPrefixOf!0 thiss!1204 (_2!8323 lt!273920))))

(declare-fun lt!273926 () Unit!12842)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7570 BitStream!7570 BitStream!7570) Unit!12842)

(assert (=> b!178164 (= lt!273926 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8323 lt!273925) (_2!8323 lt!273920)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7570 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15356)

(assert (=> b!178164 (= lt!273920 (appendBitsLSBFirstLoopTR!0 (_2!8323 lt!273925) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!178165 () Bool)

(declare-fun res!147724 () Bool)

(assert (=> b!178165 (=> (not res!147724) (not e!124085))))

(assert (=> b!178165 (= res!147724 (isPrefixOf!0 thiss!1204 (_2!8323 lt!273925)))))

(declare-fun b!178166 () Bool)

(declare-fun res!147726 () Bool)

(assert (=> b!178166 (=> (not res!147726) (not e!124082))))

(assert (=> b!178166 (= res!147726 (not (= i!590 nBits!348)))))

(declare-fun b!178167 () Bool)

(assert (=> b!178167 (= e!124085 e!124086)))

(declare-fun res!147728 () Bool)

(assert (=> b!178167 (=> (not res!147728) (not e!124086))))

(assert (=> b!178167 (= res!147728 (and (= (_2!8324 lt!273923) lt!273921) (= (_1!8324 lt!273923) (_2!8323 lt!273925))))))

(declare-fun readBitPure!0 (BitStream!7570) tuple2!15358)

(declare-fun readerFrom!0 (BitStream!7570 (_ BitVec 32) (_ BitVec 32)) BitStream!7570)

(assert (=> b!178167 (= lt!273923 (readBitPure!0 (readerFrom!0 (_2!8323 lt!273925) (currentBit!8867 thiss!1204) (currentByte!8872 thiss!1204))))))

(assert (= (and start!39584 res!147725) b!178158))

(assert (= (and b!178158 res!147722) b!178159))

(assert (= (and b!178159 res!147721) b!178166))

(assert (= (and b!178166 res!147726) b!178161))

(assert (= (and b!178161 res!147729) b!178163))

(assert (= (and b!178163 res!147723) b!178165))

(assert (= (and b!178165 res!147724) b!178167))

(assert (= (and b!178167 res!147728) b!178162))

(assert (= (and b!178161 (not res!147727)) b!178164))

(assert (= start!39584 b!178160))

(declare-fun m!278311 () Bool)

(assert (=> b!178161 m!278311))

(declare-fun m!278313 () Bool)

(assert (=> b!178161 m!278313))

(declare-fun m!278315 () Bool)

(assert (=> b!178161 m!278315))

(declare-fun m!278317 () Bool)

(assert (=> start!39584 m!278317))

(declare-fun m!278319 () Bool)

(assert (=> b!178159 m!278319))

(declare-fun m!278321 () Bool)

(assert (=> b!178165 m!278321))

(declare-fun m!278323 () Bool)

(assert (=> b!178167 m!278323))

(assert (=> b!178167 m!278323))

(declare-fun m!278325 () Bool)

(assert (=> b!178167 m!278325))

(declare-fun m!278327 () Bool)

(assert (=> b!178160 m!278327))

(declare-fun m!278329 () Bool)

(assert (=> b!178164 m!278329))

(declare-fun m!278331 () Bool)

(assert (=> b!178164 m!278331))

(declare-fun m!278333 () Bool)

(assert (=> b!178164 m!278333))

(declare-fun m!278335 () Bool)

(assert (=> b!178164 m!278335))

(assert (=> b!178163 m!278311))

(assert (=> b!178163 m!278313))

(declare-fun m!278337 () Bool)

(assert (=> b!178158 m!278337))

(declare-fun m!278339 () Bool)

(assert (=> b!178162 m!278339))

(push 1)

(assert (not b!178161))

(assert (not b!178163))

(assert (not b!178165))

(assert (not start!39584))

(assert (not b!178167))

(assert (not b!178162))

(assert (not b!178160))

(assert (not b!178159))

(assert (not b!178158))

(assert (not b!178164))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

