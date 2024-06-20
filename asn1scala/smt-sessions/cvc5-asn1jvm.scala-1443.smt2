; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39608 () Bool)

(assert start!39608)

(declare-fun b!178678 () Bool)

(declare-fun res!148214 () Bool)

(declare-fun e!124373 () Bool)

(assert (=> b!178678 (=> res!148214 e!124373)))

(declare-datatypes ((array!9623 0))(
  ( (array!9624 (arr!5173 (Array (_ BitVec 32) (_ BitVec 8))) (size!4243 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7594 0))(
  ( (BitStream!7595 (buf!4686 array!9623) (currentByte!8884 (_ BitVec 32)) (currentBit!8879 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!12866 0))(
  ( (Unit!12867) )
))
(declare-datatypes ((tuple2!15404 0))(
  ( (tuple2!15405 (_1!8347 Unit!12866) (_2!8347 BitStream!7594)) )
))
(declare-fun lt!274294 () tuple2!15404)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!178678 (= res!148214 (not (invariant!0 (currentBit!8879 (_2!8347 lt!274294)) (currentByte!8884 (_2!8347 lt!274294)) (size!4243 (buf!4686 (_2!8347 lt!274294))))))))

(declare-fun b!178679 () Bool)

(declare-fun res!148217 () Bool)

(declare-fun e!124377 () Bool)

(assert (=> b!178679 (=> res!148217 e!124377)))

(declare-fun lt!274288 () tuple2!15404)

(declare-fun thiss!1204 () BitStream!7594)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!178679 (= res!148217 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!4243 (buf!4686 (_2!8347 lt!274288)))) ((_ sign_extend 32) (currentByte!8884 thiss!1204)) ((_ sign_extend 32) (currentBit!8879 thiss!1204)))))))

(declare-fun res!148221 () Bool)

(declare-fun e!124375 () Bool)

(assert (=> start!39608 (=> (not res!148221) (not e!124375))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!39608 (= res!148221 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39608 e!124375))

(assert (=> start!39608 true))

(declare-fun e!124378 () Bool)

(declare-fun inv!12 (BitStream!7594) Bool)

(assert (=> start!39608 (and (inv!12 thiss!1204) e!124378)))

(declare-fun b!178680 () Bool)

(declare-fun e!124379 () Bool)

(assert (=> b!178680 (= e!124379 e!124373)))

(declare-fun res!148208 () Bool)

(assert (=> b!178680 (=> res!148208 e!124373)))

(declare-fun lt!274298 () (_ BitVec 64))

(declare-fun lt!274287 () (_ BitVec 64))

(assert (=> b!178680 (= res!148208 (not (= lt!274298 (bvsub (bvsub (bvadd lt!274287 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!178680 (= lt!274298 (bitIndex!0 (size!4243 (buf!4686 (_2!8347 lt!274294))) (currentByte!8884 (_2!8347 lt!274294)) (currentBit!8879 (_2!8347 lt!274294))))))

(declare-fun isPrefixOf!0 (BitStream!7594 BitStream!7594) Bool)

(assert (=> b!178680 (isPrefixOf!0 thiss!1204 (_2!8347 lt!274294))))

(declare-fun lt!274296 () Unit!12866)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7594 BitStream!7594 BitStream!7594) Unit!12866)

(assert (=> b!178680 (= lt!274296 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8347 lt!274288) (_2!8347 lt!274294)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7594 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15404)

(assert (=> b!178680 (= lt!274294 (appendBitsLSBFirstLoopTR!0 (_2!8347 lt!274288) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!178681 () Bool)

(assert (=> b!178681 (= e!124375 (not e!124379))))

(declare-fun res!148220 () Bool)

(assert (=> b!178681 (=> res!148220 e!124379)))

(declare-fun lt!274297 () (_ BitVec 64))

(assert (=> b!178681 (= res!148220 (not (= lt!274287 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!274297))))))

(assert (=> b!178681 (= lt!274287 (bitIndex!0 (size!4243 (buf!4686 (_2!8347 lt!274288))) (currentByte!8884 (_2!8347 lt!274288)) (currentBit!8879 (_2!8347 lt!274288))))))

(assert (=> b!178681 (= lt!274297 (bitIndex!0 (size!4243 (buf!4686 thiss!1204)) (currentByte!8884 thiss!1204) (currentBit!8879 thiss!1204)))))

(declare-fun e!124374 () Bool)

(assert (=> b!178681 e!124374))

(declare-fun res!148210 () Bool)

(assert (=> b!178681 (=> (not res!148210) (not e!124374))))

(assert (=> b!178681 (= res!148210 (= (size!4243 (buf!4686 thiss!1204)) (size!4243 (buf!4686 (_2!8347 lt!274288)))))))

(declare-fun lt!274295 () Bool)

(declare-fun appendBit!0 (BitStream!7594 Bool) tuple2!15404)

(assert (=> b!178681 (= lt!274288 (appendBit!0 thiss!1204 lt!274295))))

(assert (=> b!178681 (= lt!274295 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!178682 () Bool)

(declare-fun array_inv!3984 (array!9623) Bool)

(assert (=> b!178682 (= e!124378 (array_inv!3984 (buf!4686 thiss!1204)))))

(declare-fun b!178683 () Bool)

(declare-fun e!124376 () Bool)

(assert (=> b!178683 (= e!124374 e!124376)))

(declare-fun res!148211 () Bool)

(assert (=> b!178683 (=> (not res!148211) (not e!124376))))

(declare-fun lt!274290 () (_ BitVec 64))

(declare-fun lt!274289 () (_ BitVec 64))

(assert (=> b!178683 (= res!148211 (= lt!274290 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!274289)))))

(assert (=> b!178683 (= lt!274290 (bitIndex!0 (size!4243 (buf!4686 (_2!8347 lt!274288))) (currentByte!8884 (_2!8347 lt!274288)) (currentBit!8879 (_2!8347 lt!274288))))))

(assert (=> b!178683 (= lt!274289 (bitIndex!0 (size!4243 (buf!4686 thiss!1204)) (currentByte!8884 thiss!1204) (currentBit!8879 thiss!1204)))))

(declare-fun b!178684 () Bool)

(declare-fun res!148209 () Bool)

(assert (=> b!178684 (=> (not res!148209) (not e!124375))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!178684 (= res!148209 (validate_offset_bits!1 ((_ sign_extend 32) (size!4243 (buf!4686 thiss!1204))) ((_ sign_extend 32) (currentByte!8884 thiss!1204)) ((_ sign_extend 32) (currentBit!8879 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!178685 () Bool)

(declare-fun res!148212 () Bool)

(assert (=> b!178685 (=> (not res!148212) (not e!124375))))

(assert (=> b!178685 (= res!148212 (invariant!0 (currentBit!8879 thiss!1204) (currentByte!8884 thiss!1204) (size!4243 (buf!4686 thiss!1204))))))

(declare-fun b!178686 () Bool)

(declare-fun res!148216 () Bool)

(assert (=> b!178686 (=> res!148216 e!124373)))

(assert (=> b!178686 (= res!148216 (not (isPrefixOf!0 (_2!8347 lt!274288) (_2!8347 lt!274294))))))

(declare-fun b!178687 () Bool)

(declare-fun res!148215 () Bool)

(assert (=> b!178687 (=> res!148215 e!124373)))

(assert (=> b!178687 (= res!148215 (not (isPrefixOf!0 thiss!1204 (_2!8347 lt!274288))))))

(declare-fun b!178688 () Bool)

(declare-fun e!124381 () Bool)

(assert (=> b!178688 (= e!124376 e!124381)))

(declare-fun res!148206 () Bool)

(assert (=> b!178688 (=> (not res!148206) (not e!124381))))

(declare-datatypes ((tuple2!15406 0))(
  ( (tuple2!15407 (_1!8348 BitStream!7594) (_2!8348 Bool)) )
))
(declare-fun lt!274292 () tuple2!15406)

(assert (=> b!178688 (= res!148206 (and (= (_2!8348 lt!274292) lt!274295) (= (_1!8348 lt!274292) (_2!8347 lt!274288))))))

(declare-fun readBitPure!0 (BitStream!7594) tuple2!15406)

(declare-fun readerFrom!0 (BitStream!7594 (_ BitVec 32) (_ BitVec 32)) BitStream!7594)

(assert (=> b!178688 (= lt!274292 (readBitPure!0 (readerFrom!0 (_2!8347 lt!274288) (currentBit!8879 thiss!1204) (currentByte!8884 thiss!1204))))))

(declare-fun b!178689 () Bool)

(declare-fun res!148218 () Bool)

(assert (=> b!178689 (=> (not res!148218) (not e!124376))))

(assert (=> b!178689 (= res!148218 (isPrefixOf!0 thiss!1204 (_2!8347 lt!274288)))))

(declare-fun b!178690 () Bool)

(assert (=> b!178690 (= e!124373 e!124377)))

(declare-fun res!148207 () Bool)

(assert (=> b!178690 (=> res!148207 e!124377)))

(assert (=> b!178690 (= res!148207 (not (= (size!4243 (buf!4686 (_2!8347 lt!274288))) (size!4243 (buf!4686 (_2!8347 lt!274294))))))))

(assert (=> b!178690 (invariant!0 (currentBit!8879 thiss!1204) (currentByte!8884 thiss!1204) (size!4243 (buf!4686 (_2!8347 lt!274288))))))

(declare-fun b!178691 () Bool)

(assert (=> b!178691 (= e!124381 (= (bitIndex!0 (size!4243 (buf!4686 (_1!8348 lt!274292))) (currentByte!8884 (_1!8348 lt!274292)) (currentBit!8879 (_1!8348 lt!274292))) lt!274290))))

(declare-fun b!178692 () Bool)

(declare-fun res!148219 () Bool)

(assert (=> b!178692 (=> res!148219 e!124373)))

(assert (=> b!178692 (= res!148219 (or (not (= (size!4243 (buf!4686 (_2!8347 lt!274294))) (size!4243 (buf!4686 thiss!1204)))) (not (= lt!274298 (bvsub (bvadd lt!274297 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!178693 () Bool)

(declare-fun res!148213 () Bool)

(assert (=> b!178693 (=> (not res!148213) (not e!124375))))

(assert (=> b!178693 (= res!148213 (not (= i!590 nBits!348)))))

(declare-fun b!178694 () Bool)

(declare-fun res!148205 () Bool)

(assert (=> b!178694 (=> res!148205 e!124377)))

(declare-fun arrayBitRangesEq!0 (array!9623 array!9623 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!178694 (= res!148205 (not (arrayBitRangesEq!0 (buf!4686 (_2!8347 lt!274288)) (buf!4686 (_2!8347 lt!274294)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4243 (buf!4686 (_2!8347 lt!274288))) (currentByte!8884 thiss!1204) (currentBit!8879 thiss!1204))))))))

(declare-fun b!178695 () Bool)

(assert (=> b!178695 (= e!124377 true)))

(declare-fun lt!274293 () tuple2!15406)

(assert (=> b!178695 (= lt!274293 (readBitPure!0 (BitStream!7595 (buf!4686 (_2!8347 lt!274294)) (currentByte!8884 thiss!1204) (currentBit!8879 thiss!1204))))))

(declare-fun lt!274291 () tuple2!15406)

(assert (=> b!178695 (= lt!274291 (readBitPure!0 (BitStream!7595 (buf!4686 (_2!8347 lt!274288)) (currentByte!8884 thiss!1204) (currentBit!8879 thiss!1204))))))

(assert (=> b!178695 (invariant!0 (currentBit!8879 thiss!1204) (currentByte!8884 thiss!1204) (size!4243 (buf!4686 (_2!8347 lt!274294))))))

(assert (= (and start!39608 res!148221) b!178684))

(assert (= (and b!178684 res!148209) b!178685))

(assert (= (and b!178685 res!148212) b!178693))

(assert (= (and b!178693 res!148213) b!178681))

(assert (= (and b!178681 res!148210) b!178683))

(assert (= (and b!178683 res!148211) b!178689))

(assert (= (and b!178689 res!148218) b!178688))

(assert (= (and b!178688 res!148206) b!178691))

(assert (= (and b!178681 (not res!148220)) b!178680))

(assert (= (and b!178680 (not res!148208)) b!178678))

(assert (= (and b!178678 (not res!148214)) b!178692))

(assert (= (and b!178692 (not res!148219)) b!178686))

(assert (= (and b!178686 (not res!148216)) b!178687))

(assert (= (and b!178687 (not res!148215)) b!178690))

(assert (= (and b!178690 (not res!148207)) b!178679))

(assert (= (and b!178679 (not res!148217)) b!178694))

(assert (= (and b!178694 (not res!148205)) b!178695))

(assert (= start!39608 b!178682))

(declare-fun m!278779 () Bool)

(assert (=> b!178683 m!278779))

(declare-fun m!278781 () Bool)

(assert (=> b!178683 m!278781))

(declare-fun m!278783 () Bool)

(assert (=> b!178695 m!278783))

(declare-fun m!278785 () Bool)

(assert (=> b!178695 m!278785))

(declare-fun m!278787 () Bool)

(assert (=> b!178695 m!278787))

(declare-fun m!278789 () Bool)

(assert (=> b!178684 m!278789))

(declare-fun m!278791 () Bool)

(assert (=> b!178691 m!278791))

(declare-fun m!278793 () Bool)

(assert (=> b!178682 m!278793))

(declare-fun m!278795 () Bool)

(assert (=> b!178694 m!278795))

(declare-fun m!278797 () Bool)

(assert (=> b!178694 m!278797))

(declare-fun m!278799 () Bool)

(assert (=> b!178679 m!278799))

(declare-fun m!278801 () Bool)

(assert (=> b!178689 m!278801))

(declare-fun m!278803 () Bool)

(assert (=> b!178690 m!278803))

(declare-fun m!278805 () Bool)

(assert (=> b!178680 m!278805))

(declare-fun m!278807 () Bool)

(assert (=> b!178680 m!278807))

(declare-fun m!278809 () Bool)

(assert (=> b!178680 m!278809))

(declare-fun m!278811 () Bool)

(assert (=> b!178680 m!278811))

(declare-fun m!278813 () Bool)

(assert (=> b!178678 m!278813))

(declare-fun m!278815 () Bool)

(assert (=> b!178686 m!278815))

(assert (=> b!178681 m!278779))

(assert (=> b!178681 m!278781))

(declare-fun m!278817 () Bool)

(assert (=> b!178681 m!278817))

(declare-fun m!278819 () Bool)

(assert (=> start!39608 m!278819))

(declare-fun m!278821 () Bool)

(assert (=> b!178685 m!278821))

(declare-fun m!278823 () Bool)

(assert (=> b!178688 m!278823))

(assert (=> b!178688 m!278823))

(declare-fun m!278825 () Bool)

(assert (=> b!178688 m!278825))

(assert (=> b!178687 m!278801))

(push 1)

(assert (not b!178680))

(assert (not b!178682))

(assert (not b!178678))

(assert (not b!178687))

(assert (not b!178694))

(assert (not b!178679))

(assert (not b!178688))

(assert (not start!39608))

(assert (not b!178686))

(assert (not b!178690))

(assert (not b!178695))

(assert (not b!178684))

(assert (not b!178689))

(assert (not b!178683))

(assert (not b!178691))

(assert (not b!178681))

(assert (not b!178685))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

