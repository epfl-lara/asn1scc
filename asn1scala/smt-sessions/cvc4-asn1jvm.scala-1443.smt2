; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39612 () Bool)

(assert start!39612)

(declare-fun b!178786 () Bool)

(declare-fun e!124434 () Bool)

(declare-datatypes ((array!9627 0))(
  ( (array!9628 (arr!5175 (Array (_ BitVec 32) (_ BitVec 8))) (size!4245 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7598 0))(
  ( (BitStream!7599 (buf!4688 array!9627) (currentByte!8886 (_ BitVec 32)) (currentBit!8881 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7598)

(declare-fun array_inv!3986 (array!9627) Bool)

(assert (=> b!178786 (= e!124434 (array_inv!3986 (buf!4688 thiss!1204)))))

(declare-fun b!178787 () Bool)

(declare-fun res!148308 () Bool)

(declare-fun e!124429 () Bool)

(assert (=> b!178787 (=> res!148308 e!124429)))

(declare-datatypes ((Unit!12870 0))(
  ( (Unit!12871) )
))
(declare-datatypes ((tuple2!15412 0))(
  ( (tuple2!15413 (_1!8351 Unit!12870) (_2!8351 BitStream!7598)) )
))
(declare-fun lt!274360 () tuple2!15412)

(declare-fun isPrefixOf!0 (BitStream!7598 BitStream!7598) Bool)

(assert (=> b!178787 (= res!148308 (not (isPrefixOf!0 thiss!1204 (_2!8351 lt!274360))))))

(declare-fun b!178788 () Bool)

(declare-fun res!148312 () Bool)

(declare-fun e!124435 () Bool)

(assert (=> b!178788 (=> (not res!148312) (not e!124435))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!178788 (= res!148312 (not (= i!590 nBits!348)))))

(declare-fun b!178789 () Bool)

(declare-fun e!124430 () Bool)

(assert (=> b!178789 (= e!124435 (not e!124430))))

(declare-fun res!148311 () Bool)

(assert (=> b!178789 (=> res!148311 e!124430)))

(declare-fun lt!274361 () (_ BitVec 64))

(declare-fun lt!274359 () (_ BitVec 64))

(assert (=> b!178789 (= res!148311 (not (= lt!274361 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!274359))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!178789 (= lt!274361 (bitIndex!0 (size!4245 (buf!4688 (_2!8351 lt!274360))) (currentByte!8886 (_2!8351 lt!274360)) (currentBit!8881 (_2!8351 lt!274360))))))

(assert (=> b!178789 (= lt!274359 (bitIndex!0 (size!4245 (buf!4688 thiss!1204)) (currentByte!8886 thiss!1204) (currentBit!8881 thiss!1204)))))

(declare-fun e!124433 () Bool)

(assert (=> b!178789 e!124433))

(declare-fun res!148317 () Bool)

(assert (=> b!178789 (=> (not res!148317) (not e!124433))))

(assert (=> b!178789 (= res!148317 (= (size!4245 (buf!4688 thiss!1204)) (size!4245 (buf!4688 (_2!8351 lt!274360)))))))

(declare-fun lt!274365 () Bool)

(declare-fun appendBit!0 (BitStream!7598 Bool) tuple2!15412)

(assert (=> b!178789 (= lt!274360 (appendBit!0 thiss!1204 lt!274365))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!178789 (= lt!274365 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!178791 () Bool)

(declare-fun res!148314 () Bool)

(declare-fun e!124428 () Bool)

(assert (=> b!178791 (=> (not res!148314) (not e!124428))))

(assert (=> b!178791 (= res!148314 (isPrefixOf!0 thiss!1204 (_2!8351 lt!274360)))))

(declare-fun b!178792 () Bool)

(declare-fun res!148307 () Bool)

(assert (=> b!178792 (=> res!148307 e!124429)))

(declare-fun lt!274368 () (_ BitVec 64))

(declare-fun lt!274364 () tuple2!15412)

(assert (=> b!178792 (= res!148307 (or (not (= (size!4245 (buf!4688 (_2!8351 lt!274364))) (size!4245 (buf!4688 thiss!1204)))) (not (= lt!274368 (bvsub (bvadd lt!274359 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!178793 () Bool)

(declare-fun res!148323 () Bool)

(declare-fun e!124431 () Bool)

(assert (=> b!178793 (=> res!148323 e!124431)))

(declare-fun arrayBitRangesEq!0 (array!9627 array!9627 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!178793 (= res!148323 (not (arrayBitRangesEq!0 (buf!4688 (_2!8351 lt!274360)) (buf!4688 (_2!8351 lt!274364)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4245 (buf!4688 (_2!8351 lt!274360))) (currentByte!8886 thiss!1204) (currentBit!8881 thiss!1204))))))))

(declare-fun b!178794 () Bool)

(assert (=> b!178794 (= e!124430 e!124429)))

(declare-fun res!148309 () Bool)

(assert (=> b!178794 (=> res!148309 e!124429)))

(assert (=> b!178794 (= res!148309 (not (= lt!274368 (bvsub (bvsub (bvadd lt!274361 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!178794 (= lt!274368 (bitIndex!0 (size!4245 (buf!4688 (_2!8351 lt!274364))) (currentByte!8886 (_2!8351 lt!274364)) (currentBit!8881 (_2!8351 lt!274364))))))

(assert (=> b!178794 (isPrefixOf!0 thiss!1204 (_2!8351 lt!274364))))

(declare-fun lt!274363 () Unit!12870)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7598 BitStream!7598 BitStream!7598) Unit!12870)

(assert (=> b!178794 (= lt!274363 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8351 lt!274360) (_2!8351 lt!274364)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7598 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15412)

(assert (=> b!178794 (= lt!274364 (appendBitsLSBFirstLoopTR!0 (_2!8351 lt!274360) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!178795 () Bool)

(declare-fun e!124427 () Bool)

(assert (=> b!178795 (= e!124428 e!124427)))

(declare-fun res!148319 () Bool)

(assert (=> b!178795 (=> (not res!148319) (not e!124427))))

(declare-datatypes ((tuple2!15414 0))(
  ( (tuple2!15415 (_1!8352 BitStream!7598) (_2!8352 Bool)) )
))
(declare-fun lt!274370 () tuple2!15414)

(assert (=> b!178795 (= res!148319 (and (= (_2!8352 lt!274370) lt!274365) (= (_1!8352 lt!274370) (_2!8351 lt!274360))))))

(declare-fun readBitPure!0 (BitStream!7598) tuple2!15414)

(declare-fun readerFrom!0 (BitStream!7598 (_ BitVec 32) (_ BitVec 32)) BitStream!7598)

(assert (=> b!178795 (= lt!274370 (readBitPure!0 (readerFrom!0 (_2!8351 lt!274360) (currentBit!8881 thiss!1204) (currentByte!8886 thiss!1204))))))

(declare-fun b!178796 () Bool)

(declare-fun res!148320 () Bool)

(assert (=> b!178796 (=> res!148320 e!124429)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!178796 (= res!148320 (not (invariant!0 (currentBit!8881 (_2!8351 lt!274364)) (currentByte!8886 (_2!8351 lt!274364)) (size!4245 (buf!4688 (_2!8351 lt!274364))))))))

(declare-fun b!178797 () Bool)

(declare-fun res!148315 () Bool)

(assert (=> b!178797 (=> res!148315 e!124431)))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!178797 (= res!148315 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!4245 (buf!4688 (_2!8351 lt!274360)))) ((_ sign_extend 32) (currentByte!8886 thiss!1204)) ((_ sign_extend 32) (currentBit!8881 thiss!1204)))))))

(declare-fun b!178798 () Bool)

(declare-fun res!148322 () Bool)

(assert (=> b!178798 (=> (not res!148322) (not e!124435))))

(assert (=> b!178798 (= res!148322 (invariant!0 (currentBit!8881 thiss!1204) (currentByte!8886 thiss!1204) (size!4245 (buf!4688 thiss!1204))))))

(declare-fun b!178799 () Bool)

(declare-fun res!148310 () Bool)

(assert (=> b!178799 (=> (not res!148310) (not e!124435))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!178799 (= res!148310 (validate_offset_bits!1 ((_ sign_extend 32) (size!4245 (buf!4688 thiss!1204))) ((_ sign_extend 32) (currentByte!8886 thiss!1204)) ((_ sign_extend 32) (currentBit!8881 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!178790 () Bool)

(declare-fun lt!274366 () (_ BitVec 64))

(assert (=> b!178790 (= e!124427 (= (bitIndex!0 (size!4245 (buf!4688 (_1!8352 lt!274370))) (currentByte!8886 (_1!8352 lt!274370)) (currentBit!8881 (_1!8352 lt!274370))) lt!274366))))

(declare-fun res!148316 () Bool)

(assert (=> start!39612 (=> (not res!148316) (not e!124435))))

(assert (=> start!39612 (= res!148316 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39612 e!124435))

(assert (=> start!39612 true))

(declare-fun inv!12 (BitStream!7598) Bool)

(assert (=> start!39612 (and (inv!12 thiss!1204) e!124434)))

(declare-fun b!178800 () Bool)

(assert (=> b!178800 (= e!124429 e!124431)))

(declare-fun res!148318 () Bool)

(assert (=> b!178800 (=> res!148318 e!124431)))

(assert (=> b!178800 (= res!148318 (not (= (size!4245 (buf!4688 (_2!8351 lt!274360))) (size!4245 (buf!4688 (_2!8351 lt!274364))))))))

(assert (=> b!178800 (invariant!0 (currentBit!8881 thiss!1204) (currentByte!8886 thiss!1204) (size!4245 (buf!4688 (_2!8351 lt!274360))))))

(declare-fun b!178801 () Bool)

(declare-fun res!148321 () Bool)

(assert (=> b!178801 (=> res!148321 e!124429)))

(assert (=> b!178801 (= res!148321 (not (isPrefixOf!0 (_2!8351 lt!274360) (_2!8351 lt!274364))))))

(declare-fun b!178802 () Bool)

(assert (=> b!178802 (= e!124433 e!124428)))

(declare-fun res!148313 () Bool)

(assert (=> b!178802 (=> (not res!148313) (not e!124428))))

(declare-fun lt!274369 () (_ BitVec 64))

(assert (=> b!178802 (= res!148313 (= lt!274366 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!274369)))))

(assert (=> b!178802 (= lt!274366 (bitIndex!0 (size!4245 (buf!4688 (_2!8351 lt!274360))) (currentByte!8886 (_2!8351 lt!274360)) (currentBit!8881 (_2!8351 lt!274360))))))

(assert (=> b!178802 (= lt!274369 (bitIndex!0 (size!4245 (buf!4688 thiss!1204)) (currentByte!8886 thiss!1204) (currentBit!8881 thiss!1204)))))

(declare-fun b!178803 () Bool)

(assert (=> b!178803 (= e!124431 true)))

(declare-fun lt!274362 () tuple2!15414)

(assert (=> b!178803 (= lt!274362 (readBitPure!0 (BitStream!7599 (buf!4688 (_2!8351 lt!274364)) (currentByte!8886 thiss!1204) (currentBit!8881 thiss!1204))))))

(declare-fun lt!274367 () tuple2!15414)

(assert (=> b!178803 (= lt!274367 (readBitPure!0 (BitStream!7599 (buf!4688 (_2!8351 lt!274360)) (currentByte!8886 thiss!1204) (currentBit!8881 thiss!1204))))))

(assert (=> b!178803 (invariant!0 (currentBit!8881 thiss!1204) (currentByte!8886 thiss!1204) (size!4245 (buf!4688 (_2!8351 lt!274364))))))

(assert (= (and start!39612 res!148316) b!178799))

(assert (= (and b!178799 res!148310) b!178798))

(assert (= (and b!178798 res!148322) b!178788))

(assert (= (and b!178788 res!148312) b!178789))

(assert (= (and b!178789 res!148317) b!178802))

(assert (= (and b!178802 res!148313) b!178791))

(assert (= (and b!178791 res!148314) b!178795))

(assert (= (and b!178795 res!148319) b!178790))

(assert (= (and b!178789 (not res!148311)) b!178794))

(assert (= (and b!178794 (not res!148309)) b!178796))

(assert (= (and b!178796 (not res!148320)) b!178792))

(assert (= (and b!178792 (not res!148307)) b!178801))

(assert (= (and b!178801 (not res!148321)) b!178787))

(assert (= (and b!178787 (not res!148308)) b!178800))

(assert (= (and b!178800 (not res!148318)) b!178797))

(assert (= (and b!178797 (not res!148315)) b!178793))

(assert (= (and b!178793 (not res!148323)) b!178803))

(assert (= start!39612 b!178786))

(declare-fun m!278875 () Bool)

(assert (=> b!178803 m!278875))

(declare-fun m!278877 () Bool)

(assert (=> b!178803 m!278877))

(declare-fun m!278879 () Bool)

(assert (=> b!178803 m!278879))

(declare-fun m!278881 () Bool)

(assert (=> b!178794 m!278881))

(declare-fun m!278883 () Bool)

(assert (=> b!178794 m!278883))

(declare-fun m!278885 () Bool)

(assert (=> b!178794 m!278885))

(declare-fun m!278887 () Bool)

(assert (=> b!178794 m!278887))

(declare-fun m!278889 () Bool)

(assert (=> b!178787 m!278889))

(declare-fun m!278891 () Bool)

(assert (=> b!178796 m!278891))

(declare-fun m!278893 () Bool)

(assert (=> b!178802 m!278893))

(declare-fun m!278895 () Bool)

(assert (=> b!178802 m!278895))

(declare-fun m!278897 () Bool)

(assert (=> start!39612 m!278897))

(declare-fun m!278899 () Bool)

(assert (=> b!178797 m!278899))

(assert (=> b!178791 m!278889))

(declare-fun m!278901 () Bool)

(assert (=> b!178800 m!278901))

(declare-fun m!278903 () Bool)

(assert (=> b!178786 m!278903))

(declare-fun m!278905 () Bool)

(assert (=> b!178790 m!278905))

(declare-fun m!278907 () Bool)

(assert (=> b!178801 m!278907))

(declare-fun m!278909 () Bool)

(assert (=> b!178799 m!278909))

(assert (=> b!178789 m!278893))

(assert (=> b!178789 m!278895))

(declare-fun m!278911 () Bool)

(assert (=> b!178789 m!278911))

(declare-fun m!278913 () Bool)

(assert (=> b!178795 m!278913))

(assert (=> b!178795 m!278913))

(declare-fun m!278915 () Bool)

(assert (=> b!178795 m!278915))

(declare-fun m!278917 () Bool)

(assert (=> b!178793 m!278917))

(declare-fun m!278919 () Bool)

(assert (=> b!178793 m!278919))

(declare-fun m!278921 () Bool)

(assert (=> b!178798 m!278921))

(push 1)

