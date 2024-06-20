; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43760 () Bool)

(assert start!43760)

(declare-fun b!208302 () Bool)

(declare-fun res!174827 () Bool)

(declare-fun e!142327 () Bool)

(assert (=> b!208302 (=> res!174827 e!142327)))

(declare-datatypes ((array!10450 0))(
  ( (array!10451 (arr!5525 (Array (_ BitVec 32) (_ BitVec 8))) (size!4595 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8298 0))(
  ( (BitStream!8299 (buf!5103 array!10450) (currentByte!9627 (_ BitVec 32)) (currentBit!9622 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8298)

(declare-datatypes ((Unit!14823 0))(
  ( (Unit!14824) )
))
(declare-datatypes ((tuple2!17878 0))(
  ( (tuple2!17879 (_1!9594 Unit!14823) (_2!9594 BitStream!8298)) )
))
(declare-fun lt!325367 () tuple2!17878)

(declare-fun isPrefixOf!0 (BitStream!8298 BitStream!8298) Bool)

(assert (=> b!208302 (= res!174827 (not (isPrefixOf!0 thiss!1204 (_2!9594 lt!325367))))))

(declare-fun b!208304 () Bool)

(declare-fun res!174817 () Bool)

(declare-fun e!142326 () Bool)

(assert (=> b!208304 (=> res!174817 e!142326)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!208304 (= res!174817 (bvsge i!590 nBits!348))))

(declare-fun b!208305 () Bool)

(declare-fun res!174828 () Bool)

(assert (=> b!208305 (=> res!174828 e!142327)))

(declare-fun lt!325384 () tuple2!17878)

(assert (=> b!208305 (= res!174828 (not (isPrefixOf!0 (_2!9594 lt!325367) (_2!9594 lt!325384))))))

(declare-fun b!208306 () Bool)

(declare-datatypes ((tuple2!17880 0))(
  ( (tuple2!17881 (_1!9595 BitStream!8298) (_2!9595 BitStream!8298)) )
))
(declare-fun lt!325374 () tuple2!17880)

(declare-fun lt!325366 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!208306 (= e!142326 (validate_offset_bits!1 ((_ sign_extend 32) (size!4595 (buf!5103 (_1!9595 lt!325374)))) ((_ sign_extend 32) (currentByte!9627 (_1!9595 lt!325374))) ((_ sign_extend 32) (currentBit!9622 (_1!9595 lt!325374))) lt!325366))))

(declare-fun b!208307 () Bool)

(declare-fun e!142330 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!208307 (= e!142330 (invariant!0 (currentBit!9622 thiss!1204) (currentByte!9627 thiss!1204) (size!4595 (buf!5103 (_2!9594 lt!325384)))))))

(declare-fun b!208308 () Bool)

(declare-fun res!174823 () Bool)

(assert (=> b!208308 (=> res!174823 e!142327)))

(assert (=> b!208308 (= res!174823 (not (invariant!0 (currentBit!9622 (_2!9594 lt!325384)) (currentByte!9627 (_2!9594 lt!325384)) (size!4595 (buf!5103 (_2!9594 lt!325384))))))))

(declare-fun b!208309 () Bool)

(declare-fun e!142322 () Bool)

(declare-datatypes ((tuple2!17882 0))(
  ( (tuple2!17883 (_1!9596 BitStream!8298) (_2!9596 Bool)) )
))
(declare-fun lt!325379 () tuple2!17882)

(declare-fun lt!325380 () tuple2!17882)

(assert (=> b!208309 (= e!142322 (= (_2!9596 lt!325379) (_2!9596 lt!325380)))))

(declare-fun b!208310 () Bool)

(declare-fun e!142325 () Bool)

(declare-fun e!142329 () Bool)

(assert (=> b!208310 (= e!142325 e!142329)))

(declare-fun res!174825 () Bool)

(assert (=> b!208310 (=> (not res!174825) (not e!142329))))

(declare-fun lt!325372 () tuple2!17882)

(declare-fun lt!325369 () Bool)

(assert (=> b!208310 (= res!174825 (and (= (_2!9596 lt!325372) lt!325369) (= (_1!9596 lt!325372) (_2!9594 lt!325367))))))

(declare-fun readBitPure!0 (BitStream!8298) tuple2!17882)

(declare-fun readerFrom!0 (BitStream!8298 (_ BitVec 32) (_ BitVec 32)) BitStream!8298)

(assert (=> b!208310 (= lt!325372 (readBitPure!0 (readerFrom!0 (_2!9594 lt!325367) (currentBit!9622 thiss!1204) (currentByte!9627 thiss!1204))))))

(declare-fun b!208311 () Bool)

(declare-fun res!174826 () Bool)

(assert (=> b!208311 (=> (not res!174826) (not e!142325))))

(assert (=> b!208311 (= res!174826 (isPrefixOf!0 thiss!1204 (_2!9594 lt!325367)))))

(declare-fun b!208312 () Bool)

(declare-fun lt!325371 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!208312 (= e!142329 (= (bitIndex!0 (size!4595 (buf!5103 (_1!9596 lt!325372))) (currentByte!9627 (_1!9596 lt!325372)) (currentBit!9622 (_1!9596 lt!325372))) lt!325371))))

(declare-fun b!208313 () Bool)

(declare-fun res!174818 () Bool)

(declare-fun e!142331 () Bool)

(assert (=> b!208313 (=> (not res!174818) (not e!142331))))

(assert (=> b!208313 (= res!174818 (not (= i!590 nBits!348)))))

(declare-fun b!208314 () Bool)

(assert (=> b!208314 (= e!142327 e!142326)))

(declare-fun res!174824 () Bool)

(assert (=> b!208314 (=> res!174824 e!142326)))

(declare-fun lt!325385 () (_ BitVec 64))

(declare-fun lt!325365 () (_ BitVec 64))

(declare-fun lt!325382 () tuple2!17882)

(declare-fun lt!325388 () tuple2!17880)

(declare-datatypes ((tuple2!17884 0))(
  ( (tuple2!17885 (_1!9597 BitStream!8298) (_2!9597 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8298 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17884)

(assert (=> b!208314 (= res!174824 (not (= (_1!9597 (readNBitsLSBFirstsLoopPure!0 (_1!9595 lt!325388) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvor lt!325365 (ite (_2!9596 lt!325382) lt!325385 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9595 lt!325388))))))

(declare-fun lt!325381 () (_ BitVec 64))

(assert (=> b!208314 (validate_offset_bits!1 ((_ sign_extend 32) (size!4595 (buf!5103 (_2!9594 lt!325384)))) ((_ sign_extend 32) (currentByte!9627 (_2!9594 lt!325367))) ((_ sign_extend 32) (currentBit!9622 (_2!9594 lt!325367))) lt!325381)))

(declare-fun lt!325370 () Unit!14823)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8298 array!10450 (_ BitVec 64)) Unit!14823)

(assert (=> b!208314 (= lt!325370 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9594 lt!325367) (buf!5103 (_2!9594 lt!325384)) lt!325381))))

(assert (=> b!208314 (= lt!325381 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!325377 () tuple2!17884)

(assert (=> b!208314 (= lt!325377 (readNBitsLSBFirstsLoopPure!0 (_1!9595 lt!325374) nBits!348 i!590 lt!325365))))

(assert (=> b!208314 (validate_offset_bits!1 ((_ sign_extend 32) (size!4595 (buf!5103 (_2!9594 lt!325384)))) ((_ sign_extend 32) (currentByte!9627 thiss!1204)) ((_ sign_extend 32) (currentBit!9622 thiss!1204)) lt!325366)))

(declare-fun lt!325373 () Unit!14823)

(assert (=> b!208314 (= lt!325373 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5103 (_2!9594 lt!325384)) lt!325366))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!208314 (= lt!325365 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!208314 (= (_2!9596 lt!325382) lt!325369)))

(assert (=> b!208314 (= lt!325382 (readBitPure!0 (_1!9595 lt!325374)))))

(declare-fun reader!0 (BitStream!8298 BitStream!8298) tuple2!17880)

(assert (=> b!208314 (= lt!325388 (reader!0 (_2!9594 lt!325367) (_2!9594 lt!325384)))))

(assert (=> b!208314 (= lt!325374 (reader!0 thiss!1204 (_2!9594 lt!325384)))))

(assert (=> b!208314 e!142322))

(declare-fun res!174829 () Bool)

(assert (=> b!208314 (=> (not res!174829) (not e!142322))))

(assert (=> b!208314 (= res!174829 (= (bitIndex!0 (size!4595 (buf!5103 (_1!9596 lt!325379))) (currentByte!9627 (_1!9596 lt!325379)) (currentBit!9622 (_1!9596 lt!325379))) (bitIndex!0 (size!4595 (buf!5103 (_1!9596 lt!325380))) (currentByte!9627 (_1!9596 lt!325380)) (currentBit!9622 (_1!9596 lt!325380)))))))

(declare-fun lt!325375 () Unit!14823)

(declare-fun lt!325387 () BitStream!8298)

(declare-fun readBitPrefixLemma!0 (BitStream!8298 BitStream!8298) Unit!14823)

(assert (=> b!208314 (= lt!325375 (readBitPrefixLemma!0 lt!325387 (_2!9594 lt!325384)))))

(assert (=> b!208314 (= lt!325380 (readBitPure!0 (BitStream!8299 (buf!5103 (_2!9594 lt!325384)) (currentByte!9627 thiss!1204) (currentBit!9622 thiss!1204))))))

(assert (=> b!208314 (= lt!325379 (readBitPure!0 lt!325387))))

(assert (=> b!208314 e!142330))

(declare-fun res!174813 () Bool)

(assert (=> b!208314 (=> (not res!174813) (not e!142330))))

(assert (=> b!208314 (= res!174813 (invariant!0 (currentBit!9622 thiss!1204) (currentByte!9627 thiss!1204) (size!4595 (buf!5103 (_2!9594 lt!325367)))))))

(assert (=> b!208314 (= lt!325387 (BitStream!8299 (buf!5103 (_2!9594 lt!325367)) (currentByte!9627 thiss!1204) (currentBit!9622 thiss!1204)))))

(declare-fun b!208315 () Bool)

(declare-fun res!174820 () Bool)

(assert (=> b!208315 (=> res!174820 e!142327)))

(declare-fun lt!325378 () (_ BitVec 64))

(declare-fun lt!325376 () (_ BitVec 64))

(assert (=> b!208315 (= res!174820 (or (not (= (size!4595 (buf!5103 (_2!9594 lt!325384))) (size!4595 (buf!5103 thiss!1204)))) (not (= lt!325376 (bvsub (bvadd lt!325378 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!208316 () Bool)

(declare-fun e!142324 () Bool)

(assert (=> b!208316 (= e!142324 e!142331)))

(declare-fun res!174814 () Bool)

(assert (=> b!208316 (=> (not res!174814) (not e!142331))))

(assert (=> b!208316 (= res!174814 (validate_offset_bits!1 ((_ sign_extend 32) (size!4595 (buf!5103 thiss!1204))) ((_ sign_extend 32) (currentByte!9627 thiss!1204)) ((_ sign_extend 32) (currentBit!9622 thiss!1204)) lt!325366))))

(assert (=> b!208316 (= lt!325366 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!208317 () Bool)

(declare-fun e!142328 () Bool)

(assert (=> b!208317 (= e!142328 e!142325)))

(declare-fun res!174816 () Bool)

(assert (=> b!208317 (=> (not res!174816) (not e!142325))))

(declare-fun lt!325383 () (_ BitVec 64))

(assert (=> b!208317 (= res!174816 (= lt!325371 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!325383)))))

(assert (=> b!208317 (= lt!325371 (bitIndex!0 (size!4595 (buf!5103 (_2!9594 lt!325367))) (currentByte!9627 (_2!9594 lt!325367)) (currentBit!9622 (_2!9594 lt!325367))))))

(assert (=> b!208317 (= lt!325383 (bitIndex!0 (size!4595 (buf!5103 thiss!1204)) (currentByte!9627 thiss!1204) (currentBit!9622 thiss!1204)))))

(declare-fun b!208318 () Bool)

(declare-fun e!142323 () Bool)

(declare-fun array_inv!4336 (array!10450) Bool)

(assert (=> b!208318 (= e!142323 (array_inv!4336 (buf!5103 thiss!1204)))))

(declare-fun b!208303 () Bool)

(declare-fun e!142321 () Bool)

(assert (=> b!208303 (= e!142321 e!142327)))

(declare-fun res!174822 () Bool)

(assert (=> b!208303 (=> res!174822 e!142327)))

(declare-fun lt!325386 () (_ BitVec 64))

(assert (=> b!208303 (= res!174822 (not (= lt!325376 (bvsub (bvsub (bvadd lt!325386 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!208303 (= lt!325376 (bitIndex!0 (size!4595 (buf!5103 (_2!9594 lt!325384))) (currentByte!9627 (_2!9594 lt!325384)) (currentBit!9622 (_2!9594 lt!325384))))))

(assert (=> b!208303 (isPrefixOf!0 thiss!1204 (_2!9594 lt!325384))))

(declare-fun lt!325368 () Unit!14823)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8298 BitStream!8298 BitStream!8298) Unit!14823)

(assert (=> b!208303 (= lt!325368 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9594 lt!325367) (_2!9594 lt!325384)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8298 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17878)

(assert (=> b!208303 (= lt!325384 (appendBitsLSBFirstLoopTR!0 (_2!9594 lt!325367) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun res!174815 () Bool)

(assert (=> start!43760 (=> (not res!174815) (not e!142324))))

(assert (=> start!43760 (= res!174815 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43760 e!142324))

(assert (=> start!43760 true))

(declare-fun inv!12 (BitStream!8298) Bool)

(assert (=> start!43760 (and (inv!12 thiss!1204) e!142323)))

(declare-fun b!208319 () Bool)

(declare-fun res!174821 () Bool)

(assert (=> b!208319 (=> (not res!174821) (not e!142331))))

(assert (=> b!208319 (= res!174821 (invariant!0 (currentBit!9622 thiss!1204) (currentByte!9627 thiss!1204) (size!4595 (buf!5103 thiss!1204))))))

(declare-fun b!208320 () Bool)

(assert (=> b!208320 (= e!142331 (not e!142321))))

(declare-fun res!174830 () Bool)

(assert (=> b!208320 (=> res!174830 e!142321)))

(assert (=> b!208320 (= res!174830 (not (= lt!325386 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!325378))))))

(assert (=> b!208320 (= lt!325386 (bitIndex!0 (size!4595 (buf!5103 (_2!9594 lt!325367))) (currentByte!9627 (_2!9594 lt!325367)) (currentBit!9622 (_2!9594 lt!325367))))))

(assert (=> b!208320 (= lt!325378 (bitIndex!0 (size!4595 (buf!5103 thiss!1204)) (currentByte!9627 thiss!1204) (currentBit!9622 thiss!1204)))))

(assert (=> b!208320 e!142328))

(declare-fun res!174819 () Bool)

(assert (=> b!208320 (=> (not res!174819) (not e!142328))))

(assert (=> b!208320 (= res!174819 (= (size!4595 (buf!5103 thiss!1204)) (size!4595 (buf!5103 (_2!9594 lt!325367)))))))

(declare-fun appendBit!0 (BitStream!8298 Bool) tuple2!17878)

(assert (=> b!208320 (= lt!325367 (appendBit!0 thiss!1204 lt!325369))))

(assert (=> b!208320 (= lt!325369 (not (= (bvand v!189 lt!325385) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!208320 (= lt!325385 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(assert (= (and start!43760 res!174815) b!208316))

(assert (= (and b!208316 res!174814) b!208319))

(assert (= (and b!208319 res!174821) b!208313))

(assert (= (and b!208313 res!174818) b!208320))

(assert (= (and b!208320 res!174819) b!208317))

(assert (= (and b!208317 res!174816) b!208311))

(assert (= (and b!208311 res!174826) b!208310))

(assert (= (and b!208310 res!174825) b!208312))

(assert (= (and b!208320 (not res!174830)) b!208303))

(assert (= (and b!208303 (not res!174822)) b!208308))

(assert (= (and b!208308 (not res!174823)) b!208315))

(assert (= (and b!208315 (not res!174820)) b!208305))

(assert (= (and b!208305 (not res!174828)) b!208302))

(assert (= (and b!208302 (not res!174827)) b!208314))

(assert (= (and b!208314 res!174813) b!208307))

(assert (= (and b!208314 res!174829) b!208309))

(assert (= (and b!208314 (not res!174824)) b!208304))

(assert (= (and b!208304 (not res!174817)) b!208306))

(assert (= start!43760 b!208318))

(declare-fun m!320455 () Bool)

(assert (=> b!208319 m!320455))

(declare-fun m!320457 () Bool)

(assert (=> b!208314 m!320457))

(declare-fun m!320459 () Bool)

(assert (=> b!208314 m!320459))

(declare-fun m!320461 () Bool)

(assert (=> b!208314 m!320461))

(declare-fun m!320463 () Bool)

(assert (=> b!208314 m!320463))

(declare-fun m!320465 () Bool)

(assert (=> b!208314 m!320465))

(declare-fun m!320467 () Bool)

(assert (=> b!208314 m!320467))

(declare-fun m!320469 () Bool)

(assert (=> b!208314 m!320469))

(declare-fun m!320471 () Bool)

(assert (=> b!208314 m!320471))

(declare-fun m!320473 () Bool)

(assert (=> b!208314 m!320473))

(declare-fun m!320475 () Bool)

(assert (=> b!208314 m!320475))

(declare-fun m!320477 () Bool)

(assert (=> b!208314 m!320477))

(declare-fun m!320479 () Bool)

(assert (=> b!208314 m!320479))

(declare-fun m!320481 () Bool)

(assert (=> b!208314 m!320481))

(declare-fun m!320483 () Bool)

(assert (=> b!208314 m!320483))

(declare-fun m!320485 () Bool)

(assert (=> b!208314 m!320485))

(declare-fun m!320487 () Bool)

(assert (=> b!208314 m!320487))

(declare-fun m!320489 () Bool)

(assert (=> b!208308 m!320489))

(declare-fun m!320491 () Bool)

(assert (=> b!208305 m!320491))

(declare-fun m!320493 () Bool)

(assert (=> b!208316 m!320493))

(declare-fun m!320495 () Bool)

(assert (=> b!208312 m!320495))

(declare-fun m!320497 () Bool)

(assert (=> b!208303 m!320497))

(declare-fun m!320499 () Bool)

(assert (=> b!208303 m!320499))

(declare-fun m!320501 () Bool)

(assert (=> b!208303 m!320501))

(declare-fun m!320503 () Bool)

(assert (=> b!208303 m!320503))

(declare-fun m!320505 () Bool)

(assert (=> b!208318 m!320505))

(declare-fun m!320507 () Bool)

(assert (=> b!208310 m!320507))

(assert (=> b!208310 m!320507))

(declare-fun m!320509 () Bool)

(assert (=> b!208310 m!320509))

(declare-fun m!320511 () Bool)

(assert (=> b!208307 m!320511))

(declare-fun m!320513 () Bool)

(assert (=> b!208311 m!320513))

(assert (=> b!208302 m!320513))

(declare-fun m!320515 () Bool)

(assert (=> b!208317 m!320515))

(declare-fun m!320517 () Bool)

(assert (=> b!208317 m!320517))

(declare-fun m!320519 () Bool)

(assert (=> start!43760 m!320519))

(declare-fun m!320521 () Bool)

(assert (=> b!208306 m!320521))

(assert (=> b!208320 m!320515))

(assert (=> b!208320 m!320517))

(declare-fun m!320523 () Bool)

(assert (=> b!208320 m!320523))

(check-sat (not b!208317) (not b!208302) (not b!208306) (not b!208312) (not b!208307) (not b!208320) (not start!43760) (not b!208311) (not b!208310) (not b!208318) (not b!208308) (not b!208319) (not b!208314) (not b!208305) (not b!208316) (not b!208303))
(check-sat)
(get-model)

(declare-fun d!70371 () Bool)

(declare-fun res!174892 () Bool)

(declare-fun e!142374 () Bool)

(assert (=> d!70371 (=> (not res!174892) (not e!142374))))

(assert (=> d!70371 (= res!174892 (= (size!4595 (buf!5103 thiss!1204)) (size!4595 (buf!5103 (_2!9594 lt!325367)))))))

(assert (=> d!70371 (= (isPrefixOf!0 thiss!1204 (_2!9594 lt!325367)) e!142374)))

(declare-fun b!208384 () Bool)

(declare-fun res!174891 () Bool)

(assert (=> b!208384 (=> (not res!174891) (not e!142374))))

(assert (=> b!208384 (= res!174891 (bvsle (bitIndex!0 (size!4595 (buf!5103 thiss!1204)) (currentByte!9627 thiss!1204) (currentBit!9622 thiss!1204)) (bitIndex!0 (size!4595 (buf!5103 (_2!9594 lt!325367))) (currentByte!9627 (_2!9594 lt!325367)) (currentBit!9622 (_2!9594 lt!325367)))))))

(declare-fun b!208385 () Bool)

(declare-fun e!142373 () Bool)

(assert (=> b!208385 (= e!142374 e!142373)))

(declare-fun res!174893 () Bool)

(assert (=> b!208385 (=> res!174893 e!142373)))

(assert (=> b!208385 (= res!174893 (= (size!4595 (buf!5103 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!208386 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10450 array!10450 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!208386 (= e!142373 (arrayBitRangesEq!0 (buf!5103 thiss!1204) (buf!5103 (_2!9594 lt!325367)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4595 (buf!5103 thiss!1204)) (currentByte!9627 thiss!1204) (currentBit!9622 thiss!1204))))))

(assert (= (and d!70371 res!174892) b!208384))

(assert (= (and b!208384 res!174891) b!208385))

(assert (= (and b!208385 (not res!174893)) b!208386))

(assert (=> b!208384 m!320517))

(assert (=> b!208384 m!320515))

(assert (=> b!208386 m!320517))

(assert (=> b!208386 m!320517))

(declare-fun m!320595 () Bool)

(assert (=> b!208386 m!320595))

(assert (=> b!208311 d!70371))

(assert (=> b!208302 d!70371))

(declare-fun d!70373 () Bool)

(declare-fun e!142377 () Bool)

(assert (=> d!70373 e!142377))

(declare-fun res!174899 () Bool)

(assert (=> d!70373 (=> (not res!174899) (not e!142377))))

(declare-fun lt!325477 () (_ BitVec 64))

(declare-fun lt!325478 () (_ BitVec 64))

(declare-fun lt!325474 () (_ BitVec 64))

(assert (=> d!70373 (= res!174899 (= lt!325474 (bvsub lt!325477 lt!325478)))))

(assert (=> d!70373 (or (= (bvand lt!325477 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!325478 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!325477 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!325477 lt!325478) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!70373 (= lt!325478 (remainingBits!0 ((_ sign_extend 32) (size!4595 (buf!5103 (_1!9596 lt!325372)))) ((_ sign_extend 32) (currentByte!9627 (_1!9596 lt!325372))) ((_ sign_extend 32) (currentBit!9622 (_1!9596 lt!325372)))))))

(declare-fun lt!325475 () (_ BitVec 64))

(declare-fun lt!325476 () (_ BitVec 64))

(assert (=> d!70373 (= lt!325477 (bvmul lt!325475 lt!325476))))

(assert (=> d!70373 (or (= lt!325475 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!325476 (bvsdiv (bvmul lt!325475 lt!325476) lt!325475)))))

(assert (=> d!70373 (= lt!325476 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70373 (= lt!325475 ((_ sign_extend 32) (size!4595 (buf!5103 (_1!9596 lt!325372)))))))

(assert (=> d!70373 (= lt!325474 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9627 (_1!9596 lt!325372))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9622 (_1!9596 lt!325372)))))))

(assert (=> d!70373 (invariant!0 (currentBit!9622 (_1!9596 lt!325372)) (currentByte!9627 (_1!9596 lt!325372)) (size!4595 (buf!5103 (_1!9596 lt!325372))))))

(assert (=> d!70373 (= (bitIndex!0 (size!4595 (buf!5103 (_1!9596 lt!325372))) (currentByte!9627 (_1!9596 lt!325372)) (currentBit!9622 (_1!9596 lt!325372))) lt!325474)))

(declare-fun b!208391 () Bool)

(declare-fun res!174898 () Bool)

(assert (=> b!208391 (=> (not res!174898) (not e!142377))))

(assert (=> b!208391 (= res!174898 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!325474))))

(declare-fun b!208392 () Bool)

(declare-fun lt!325473 () (_ BitVec 64))

(assert (=> b!208392 (= e!142377 (bvsle lt!325474 (bvmul lt!325473 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!208392 (or (= lt!325473 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!325473 #b0000000000000000000000000000000000000000000000000000000000001000) lt!325473)))))

(assert (=> b!208392 (= lt!325473 ((_ sign_extend 32) (size!4595 (buf!5103 (_1!9596 lt!325372)))))))

(assert (= (and d!70373 res!174899) b!208391))

(assert (= (and b!208391 res!174898) b!208392))

(declare-fun m!320597 () Bool)

(assert (=> d!70373 m!320597))

(declare-fun m!320599 () Bool)

(assert (=> d!70373 m!320599))

(assert (=> b!208312 d!70373))

(declare-fun d!70375 () Bool)

(assert (=> d!70375 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!208314 d!70375))

(declare-fun d!70377 () Bool)

(declare-fun e!142378 () Bool)

(assert (=> d!70377 e!142378))

(declare-fun res!174901 () Bool)

(assert (=> d!70377 (=> (not res!174901) (not e!142378))))

(declare-fun lt!325484 () (_ BitVec 64))

(declare-fun lt!325483 () (_ BitVec 64))

(declare-fun lt!325480 () (_ BitVec 64))

(assert (=> d!70377 (= res!174901 (= lt!325480 (bvsub lt!325483 lt!325484)))))

(assert (=> d!70377 (or (= (bvand lt!325483 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!325484 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!325483 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!325483 lt!325484) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70377 (= lt!325484 (remainingBits!0 ((_ sign_extend 32) (size!4595 (buf!5103 (_1!9596 lt!325379)))) ((_ sign_extend 32) (currentByte!9627 (_1!9596 lt!325379))) ((_ sign_extend 32) (currentBit!9622 (_1!9596 lt!325379)))))))

(declare-fun lt!325481 () (_ BitVec 64))

(declare-fun lt!325482 () (_ BitVec 64))

(assert (=> d!70377 (= lt!325483 (bvmul lt!325481 lt!325482))))

(assert (=> d!70377 (or (= lt!325481 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!325482 (bvsdiv (bvmul lt!325481 lt!325482) lt!325481)))))

(assert (=> d!70377 (= lt!325482 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70377 (= lt!325481 ((_ sign_extend 32) (size!4595 (buf!5103 (_1!9596 lt!325379)))))))

(assert (=> d!70377 (= lt!325480 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9627 (_1!9596 lt!325379))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9622 (_1!9596 lt!325379)))))))

(assert (=> d!70377 (invariant!0 (currentBit!9622 (_1!9596 lt!325379)) (currentByte!9627 (_1!9596 lt!325379)) (size!4595 (buf!5103 (_1!9596 lt!325379))))))

(assert (=> d!70377 (= (bitIndex!0 (size!4595 (buf!5103 (_1!9596 lt!325379))) (currentByte!9627 (_1!9596 lt!325379)) (currentBit!9622 (_1!9596 lt!325379))) lt!325480)))

(declare-fun b!208393 () Bool)

(declare-fun res!174900 () Bool)

(assert (=> b!208393 (=> (not res!174900) (not e!142378))))

(assert (=> b!208393 (= res!174900 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!325480))))

(declare-fun b!208394 () Bool)

(declare-fun lt!325479 () (_ BitVec 64))

(assert (=> b!208394 (= e!142378 (bvsle lt!325480 (bvmul lt!325479 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!208394 (or (= lt!325479 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!325479 #b0000000000000000000000000000000000000000000000000000000000001000) lt!325479)))))

(assert (=> b!208394 (= lt!325479 ((_ sign_extend 32) (size!4595 (buf!5103 (_1!9596 lt!325379)))))))

(assert (= (and d!70377 res!174901) b!208393))

(assert (= (and b!208393 res!174900) b!208394))

(declare-fun m!320601 () Bool)

(assert (=> d!70377 m!320601))

(declare-fun m!320603 () Bool)

(assert (=> d!70377 m!320603))

(assert (=> b!208314 d!70377))

(declare-fun d!70379 () Bool)

(declare-fun e!142379 () Bool)

(assert (=> d!70379 e!142379))

(declare-fun res!174903 () Bool)

(assert (=> d!70379 (=> (not res!174903) (not e!142379))))

(declare-fun lt!325490 () (_ BitVec 64))

(declare-fun lt!325489 () (_ BitVec 64))

(declare-fun lt!325486 () (_ BitVec 64))

(assert (=> d!70379 (= res!174903 (= lt!325486 (bvsub lt!325489 lt!325490)))))

(assert (=> d!70379 (or (= (bvand lt!325489 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!325490 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!325489 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!325489 lt!325490) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70379 (= lt!325490 (remainingBits!0 ((_ sign_extend 32) (size!4595 (buf!5103 (_1!9596 lt!325380)))) ((_ sign_extend 32) (currentByte!9627 (_1!9596 lt!325380))) ((_ sign_extend 32) (currentBit!9622 (_1!9596 lt!325380)))))))

(declare-fun lt!325487 () (_ BitVec 64))

(declare-fun lt!325488 () (_ BitVec 64))

(assert (=> d!70379 (= lt!325489 (bvmul lt!325487 lt!325488))))

(assert (=> d!70379 (or (= lt!325487 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!325488 (bvsdiv (bvmul lt!325487 lt!325488) lt!325487)))))

(assert (=> d!70379 (= lt!325488 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70379 (= lt!325487 ((_ sign_extend 32) (size!4595 (buf!5103 (_1!9596 lt!325380)))))))

(assert (=> d!70379 (= lt!325486 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9627 (_1!9596 lt!325380))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9622 (_1!9596 lt!325380)))))))

(assert (=> d!70379 (invariant!0 (currentBit!9622 (_1!9596 lt!325380)) (currentByte!9627 (_1!9596 lt!325380)) (size!4595 (buf!5103 (_1!9596 lt!325380))))))

(assert (=> d!70379 (= (bitIndex!0 (size!4595 (buf!5103 (_1!9596 lt!325380))) (currentByte!9627 (_1!9596 lt!325380)) (currentBit!9622 (_1!9596 lt!325380))) lt!325486)))

(declare-fun b!208395 () Bool)

(declare-fun res!174902 () Bool)

(assert (=> b!208395 (=> (not res!174902) (not e!142379))))

(assert (=> b!208395 (= res!174902 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!325486))))

(declare-fun b!208396 () Bool)

(declare-fun lt!325485 () (_ BitVec 64))

(assert (=> b!208396 (= e!142379 (bvsle lt!325486 (bvmul lt!325485 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!208396 (or (= lt!325485 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!325485 #b0000000000000000000000000000000000000000000000000000000000001000) lt!325485)))))

(assert (=> b!208396 (= lt!325485 ((_ sign_extend 32) (size!4595 (buf!5103 (_1!9596 lt!325380)))))))

(assert (= (and d!70379 res!174903) b!208395))

(assert (= (and b!208395 res!174902) b!208396))

(declare-fun m!320605 () Bool)

(assert (=> d!70379 m!320605))

(declare-fun m!320607 () Bool)

(assert (=> d!70379 m!320607))

(assert (=> b!208314 d!70379))

(declare-fun d!70381 () Bool)

(declare-fun e!142384 () Bool)

(assert (=> d!70381 e!142384))

(declare-fun res!174911 () Bool)

(assert (=> d!70381 (=> (not res!174911) (not e!142384))))

(declare-fun lt!325538 () tuple2!17880)

(assert (=> d!70381 (= res!174911 (isPrefixOf!0 (_1!9595 lt!325538) (_2!9595 lt!325538)))))

(declare-fun lt!325533 () BitStream!8298)

(assert (=> d!70381 (= lt!325538 (tuple2!17881 lt!325533 (_2!9594 lt!325384)))))

(declare-fun lt!325541 () Unit!14823)

(declare-fun lt!325549 () Unit!14823)

(assert (=> d!70381 (= lt!325541 lt!325549)))

(assert (=> d!70381 (isPrefixOf!0 lt!325533 (_2!9594 lt!325384))))

(assert (=> d!70381 (= lt!325549 (lemmaIsPrefixTransitive!0 lt!325533 (_2!9594 lt!325384) (_2!9594 lt!325384)))))

(declare-fun lt!325539 () Unit!14823)

(declare-fun lt!325547 () Unit!14823)

(assert (=> d!70381 (= lt!325539 lt!325547)))

(assert (=> d!70381 (isPrefixOf!0 lt!325533 (_2!9594 lt!325384))))

(assert (=> d!70381 (= lt!325547 (lemmaIsPrefixTransitive!0 lt!325533 thiss!1204 (_2!9594 lt!325384)))))

(declare-fun lt!325534 () Unit!14823)

(declare-fun e!142385 () Unit!14823)

(assert (=> d!70381 (= lt!325534 e!142385)))

(declare-fun c!10241 () Bool)

(assert (=> d!70381 (= c!10241 (not (= (size!4595 (buf!5103 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!325543 () Unit!14823)

(declare-fun lt!325546 () Unit!14823)

(assert (=> d!70381 (= lt!325543 lt!325546)))

(assert (=> d!70381 (isPrefixOf!0 (_2!9594 lt!325384) (_2!9594 lt!325384))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8298) Unit!14823)

(assert (=> d!70381 (= lt!325546 (lemmaIsPrefixRefl!0 (_2!9594 lt!325384)))))

(declare-fun lt!325542 () Unit!14823)

(declare-fun lt!325548 () Unit!14823)

(assert (=> d!70381 (= lt!325542 lt!325548)))

(assert (=> d!70381 (= lt!325548 (lemmaIsPrefixRefl!0 (_2!9594 lt!325384)))))

(declare-fun lt!325550 () Unit!14823)

(declare-fun lt!325540 () Unit!14823)

(assert (=> d!70381 (= lt!325550 lt!325540)))

(assert (=> d!70381 (isPrefixOf!0 lt!325533 lt!325533)))

(assert (=> d!70381 (= lt!325540 (lemmaIsPrefixRefl!0 lt!325533))))

(declare-fun lt!325537 () Unit!14823)

(declare-fun lt!325531 () Unit!14823)

(assert (=> d!70381 (= lt!325537 lt!325531)))

(assert (=> d!70381 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!70381 (= lt!325531 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!70381 (= lt!325533 (BitStream!8299 (buf!5103 (_2!9594 lt!325384)) (currentByte!9627 thiss!1204) (currentBit!9622 thiss!1204)))))

(assert (=> d!70381 (isPrefixOf!0 thiss!1204 (_2!9594 lt!325384))))

(assert (=> d!70381 (= (reader!0 thiss!1204 (_2!9594 lt!325384)) lt!325538)))

(declare-fun b!208407 () Bool)

(declare-fun res!174910 () Bool)

(assert (=> b!208407 (=> (not res!174910) (not e!142384))))

(assert (=> b!208407 (= res!174910 (isPrefixOf!0 (_2!9595 lt!325538) (_2!9594 lt!325384)))))

(declare-fun b!208408 () Bool)

(declare-fun lt!325545 () Unit!14823)

(assert (=> b!208408 (= e!142385 lt!325545)))

(declare-fun lt!325535 () (_ BitVec 64))

(assert (=> b!208408 (= lt!325535 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!325544 () (_ BitVec 64))

(assert (=> b!208408 (= lt!325544 (bitIndex!0 (size!4595 (buf!5103 thiss!1204)) (currentByte!9627 thiss!1204) (currentBit!9622 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10450 array!10450 (_ BitVec 64) (_ BitVec 64)) Unit!14823)

(assert (=> b!208408 (= lt!325545 (arrayBitRangesEqSymmetric!0 (buf!5103 thiss!1204) (buf!5103 (_2!9594 lt!325384)) lt!325535 lt!325544))))

(assert (=> b!208408 (arrayBitRangesEq!0 (buf!5103 (_2!9594 lt!325384)) (buf!5103 thiss!1204) lt!325535 lt!325544)))

(declare-fun b!208409 () Bool)

(declare-fun res!174912 () Bool)

(assert (=> b!208409 (=> (not res!174912) (not e!142384))))

(assert (=> b!208409 (= res!174912 (isPrefixOf!0 (_1!9595 lt!325538) thiss!1204))))

(declare-fun lt!325532 () (_ BitVec 64))

(declare-fun b!208410 () Bool)

(declare-fun lt!325536 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!8298 (_ BitVec 64)) BitStream!8298)

(assert (=> b!208410 (= e!142384 (= (_1!9595 lt!325538) (withMovedBitIndex!0 (_2!9595 lt!325538) (bvsub lt!325536 lt!325532))))))

(assert (=> b!208410 (or (= (bvand lt!325536 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!325532 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!325536 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!325536 lt!325532) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!208410 (= lt!325532 (bitIndex!0 (size!4595 (buf!5103 (_2!9594 lt!325384))) (currentByte!9627 (_2!9594 lt!325384)) (currentBit!9622 (_2!9594 lt!325384))))))

(assert (=> b!208410 (= lt!325536 (bitIndex!0 (size!4595 (buf!5103 thiss!1204)) (currentByte!9627 thiss!1204) (currentBit!9622 thiss!1204)))))

(declare-fun b!208411 () Bool)

(declare-fun Unit!14827 () Unit!14823)

(assert (=> b!208411 (= e!142385 Unit!14827)))

(assert (= (and d!70381 c!10241) b!208408))

(assert (= (and d!70381 (not c!10241)) b!208411))

(assert (= (and d!70381 res!174911) b!208409))

(assert (= (and b!208409 res!174912) b!208407))

(assert (= (and b!208407 res!174910) b!208410))

(declare-fun m!320609 () Bool)

(assert (=> b!208407 m!320609))

(declare-fun m!320611 () Bool)

(assert (=> b!208409 m!320611))

(declare-fun m!320613 () Bool)

(assert (=> d!70381 m!320613))

(declare-fun m!320615 () Bool)

(assert (=> d!70381 m!320615))

(declare-fun m!320617 () Bool)

(assert (=> d!70381 m!320617))

(declare-fun m!320619 () Bool)

(assert (=> d!70381 m!320619))

(declare-fun m!320621 () Bool)

(assert (=> d!70381 m!320621))

(declare-fun m!320623 () Bool)

(assert (=> d!70381 m!320623))

(declare-fun m!320625 () Bool)

(assert (=> d!70381 m!320625))

(assert (=> d!70381 m!320499))

(declare-fun m!320627 () Bool)

(assert (=> d!70381 m!320627))

(declare-fun m!320629 () Bool)

(assert (=> d!70381 m!320629))

(declare-fun m!320631 () Bool)

(assert (=> d!70381 m!320631))

(assert (=> b!208408 m!320517))

(declare-fun m!320633 () Bool)

(assert (=> b!208408 m!320633))

(declare-fun m!320635 () Bool)

(assert (=> b!208408 m!320635))

(declare-fun m!320637 () Bool)

(assert (=> b!208410 m!320637))

(assert (=> b!208410 m!320497))

(assert (=> b!208410 m!320517))

(assert (=> b!208314 d!70381))

(declare-fun d!70383 () Bool)

(declare-datatypes ((tuple2!17894 0))(
  ( (tuple2!17895 (_1!9602 Bool) (_2!9602 BitStream!8298)) )
))
(declare-fun lt!325553 () tuple2!17894)

(declare-fun readBit!0 (BitStream!8298) tuple2!17894)

(assert (=> d!70383 (= lt!325553 (readBit!0 lt!325387))))

(assert (=> d!70383 (= (readBitPure!0 lt!325387) (tuple2!17883 (_2!9602 lt!325553) (_1!9602 lt!325553)))))

(declare-fun bs!17304 () Bool)

(assert (= bs!17304 d!70383))

(declare-fun m!320639 () Bool)

(assert (=> bs!17304 m!320639))

(assert (=> b!208314 d!70383))

(declare-fun d!70385 () Bool)

(assert (=> d!70385 (= (invariant!0 (currentBit!9622 thiss!1204) (currentByte!9627 thiss!1204) (size!4595 (buf!5103 (_2!9594 lt!325367)))) (and (bvsge (currentBit!9622 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9622 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9627 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9627 thiss!1204) (size!4595 (buf!5103 (_2!9594 lt!325367)))) (and (= (currentBit!9622 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9627 thiss!1204) (size!4595 (buf!5103 (_2!9594 lt!325367))))))))))

(assert (=> b!208314 d!70385))

(declare-fun d!70387 () Bool)

(declare-datatypes ((tuple2!17896 0))(
  ( (tuple2!17897 (_1!9603 (_ BitVec 64)) (_2!9603 BitStream!8298)) )
))
(declare-fun lt!325556 () tuple2!17896)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8298 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17896)

(assert (=> d!70387 (= lt!325556 (readNBitsLSBFirstsLoop!0 (_1!9595 lt!325374) nBits!348 i!590 lt!325365))))

(assert (=> d!70387 (= (readNBitsLSBFirstsLoopPure!0 (_1!9595 lt!325374) nBits!348 i!590 lt!325365) (tuple2!17885 (_2!9603 lt!325556) (_1!9603 lt!325556)))))

(declare-fun bs!17305 () Bool)

(assert (= bs!17305 d!70387))

(declare-fun m!320641 () Bool)

(assert (=> bs!17305 m!320641))

(assert (=> b!208314 d!70387))

(declare-fun d!70389 () Bool)

(assert (=> d!70389 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4595 (buf!5103 (_2!9594 lt!325384)))) ((_ sign_extend 32) (currentByte!9627 thiss!1204)) ((_ sign_extend 32) (currentBit!9622 thiss!1204)) lt!325366) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4595 (buf!5103 (_2!9594 lt!325384)))) ((_ sign_extend 32) (currentByte!9627 thiss!1204)) ((_ sign_extend 32) (currentBit!9622 thiss!1204))) lt!325366))))

(declare-fun bs!17306 () Bool)

(assert (= bs!17306 d!70389))

(declare-fun m!320643 () Bool)

(assert (=> bs!17306 m!320643))

(assert (=> b!208314 d!70389))

(declare-fun d!70391 () Bool)

(declare-fun e!142386 () Bool)

(assert (=> d!70391 e!142386))

(declare-fun res!174914 () Bool)

(assert (=> d!70391 (=> (not res!174914) (not e!142386))))

(declare-fun lt!325564 () tuple2!17880)

(assert (=> d!70391 (= res!174914 (isPrefixOf!0 (_1!9595 lt!325564) (_2!9595 lt!325564)))))

(declare-fun lt!325559 () BitStream!8298)

(assert (=> d!70391 (= lt!325564 (tuple2!17881 lt!325559 (_2!9594 lt!325384)))))

(declare-fun lt!325567 () Unit!14823)

(declare-fun lt!325575 () Unit!14823)

(assert (=> d!70391 (= lt!325567 lt!325575)))

(assert (=> d!70391 (isPrefixOf!0 lt!325559 (_2!9594 lt!325384))))

(assert (=> d!70391 (= lt!325575 (lemmaIsPrefixTransitive!0 lt!325559 (_2!9594 lt!325384) (_2!9594 lt!325384)))))

(declare-fun lt!325565 () Unit!14823)

(declare-fun lt!325573 () Unit!14823)

(assert (=> d!70391 (= lt!325565 lt!325573)))

(assert (=> d!70391 (isPrefixOf!0 lt!325559 (_2!9594 lt!325384))))

(assert (=> d!70391 (= lt!325573 (lemmaIsPrefixTransitive!0 lt!325559 (_2!9594 lt!325367) (_2!9594 lt!325384)))))

(declare-fun lt!325560 () Unit!14823)

(declare-fun e!142387 () Unit!14823)

(assert (=> d!70391 (= lt!325560 e!142387)))

(declare-fun c!10242 () Bool)

(assert (=> d!70391 (= c!10242 (not (= (size!4595 (buf!5103 (_2!9594 lt!325367))) #b00000000000000000000000000000000)))))

(declare-fun lt!325569 () Unit!14823)

(declare-fun lt!325572 () Unit!14823)

(assert (=> d!70391 (= lt!325569 lt!325572)))

(assert (=> d!70391 (isPrefixOf!0 (_2!9594 lt!325384) (_2!9594 lt!325384))))

(assert (=> d!70391 (= lt!325572 (lemmaIsPrefixRefl!0 (_2!9594 lt!325384)))))

(declare-fun lt!325568 () Unit!14823)

(declare-fun lt!325574 () Unit!14823)

(assert (=> d!70391 (= lt!325568 lt!325574)))

(assert (=> d!70391 (= lt!325574 (lemmaIsPrefixRefl!0 (_2!9594 lt!325384)))))

(declare-fun lt!325576 () Unit!14823)

(declare-fun lt!325566 () Unit!14823)

(assert (=> d!70391 (= lt!325576 lt!325566)))

(assert (=> d!70391 (isPrefixOf!0 lt!325559 lt!325559)))

(assert (=> d!70391 (= lt!325566 (lemmaIsPrefixRefl!0 lt!325559))))

(declare-fun lt!325563 () Unit!14823)

(declare-fun lt!325557 () Unit!14823)

(assert (=> d!70391 (= lt!325563 lt!325557)))

(assert (=> d!70391 (isPrefixOf!0 (_2!9594 lt!325367) (_2!9594 lt!325367))))

(assert (=> d!70391 (= lt!325557 (lemmaIsPrefixRefl!0 (_2!9594 lt!325367)))))

(assert (=> d!70391 (= lt!325559 (BitStream!8299 (buf!5103 (_2!9594 lt!325384)) (currentByte!9627 (_2!9594 lt!325367)) (currentBit!9622 (_2!9594 lt!325367))))))

(assert (=> d!70391 (isPrefixOf!0 (_2!9594 lt!325367) (_2!9594 lt!325384))))

(assert (=> d!70391 (= (reader!0 (_2!9594 lt!325367) (_2!9594 lt!325384)) lt!325564)))

(declare-fun b!208412 () Bool)

(declare-fun res!174913 () Bool)

(assert (=> b!208412 (=> (not res!174913) (not e!142386))))

(assert (=> b!208412 (= res!174913 (isPrefixOf!0 (_2!9595 lt!325564) (_2!9594 lt!325384)))))

(declare-fun b!208413 () Bool)

(declare-fun lt!325571 () Unit!14823)

(assert (=> b!208413 (= e!142387 lt!325571)))

(declare-fun lt!325561 () (_ BitVec 64))

(assert (=> b!208413 (= lt!325561 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!325570 () (_ BitVec 64))

(assert (=> b!208413 (= lt!325570 (bitIndex!0 (size!4595 (buf!5103 (_2!9594 lt!325367))) (currentByte!9627 (_2!9594 lt!325367)) (currentBit!9622 (_2!9594 lt!325367))))))

(assert (=> b!208413 (= lt!325571 (arrayBitRangesEqSymmetric!0 (buf!5103 (_2!9594 lt!325367)) (buf!5103 (_2!9594 lt!325384)) lt!325561 lt!325570))))

(assert (=> b!208413 (arrayBitRangesEq!0 (buf!5103 (_2!9594 lt!325384)) (buf!5103 (_2!9594 lt!325367)) lt!325561 lt!325570)))

(declare-fun b!208414 () Bool)

(declare-fun res!174915 () Bool)

(assert (=> b!208414 (=> (not res!174915) (not e!142386))))

(assert (=> b!208414 (= res!174915 (isPrefixOf!0 (_1!9595 lt!325564) (_2!9594 lt!325367)))))

(declare-fun lt!325562 () (_ BitVec 64))

(declare-fun lt!325558 () (_ BitVec 64))

(declare-fun b!208415 () Bool)

(assert (=> b!208415 (= e!142386 (= (_1!9595 lt!325564) (withMovedBitIndex!0 (_2!9595 lt!325564) (bvsub lt!325562 lt!325558))))))

(assert (=> b!208415 (or (= (bvand lt!325562 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!325558 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!325562 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!325562 lt!325558) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!208415 (= lt!325558 (bitIndex!0 (size!4595 (buf!5103 (_2!9594 lt!325384))) (currentByte!9627 (_2!9594 lt!325384)) (currentBit!9622 (_2!9594 lt!325384))))))

(assert (=> b!208415 (= lt!325562 (bitIndex!0 (size!4595 (buf!5103 (_2!9594 lt!325367))) (currentByte!9627 (_2!9594 lt!325367)) (currentBit!9622 (_2!9594 lt!325367))))))

(declare-fun b!208416 () Bool)

(declare-fun Unit!14828 () Unit!14823)

(assert (=> b!208416 (= e!142387 Unit!14828)))

(assert (= (and d!70391 c!10242) b!208413))

(assert (= (and d!70391 (not c!10242)) b!208416))

(assert (= (and d!70391 res!174914) b!208414))

(assert (= (and b!208414 res!174915) b!208412))

(assert (= (and b!208412 res!174913) b!208415))

(declare-fun m!320645 () Bool)

(assert (=> b!208412 m!320645))

(declare-fun m!320647 () Bool)

(assert (=> b!208414 m!320647))

(declare-fun m!320649 () Bool)

(assert (=> d!70391 m!320649))

(declare-fun m!320651 () Bool)

(assert (=> d!70391 m!320651))

(declare-fun m!320653 () Bool)

(assert (=> d!70391 m!320653))

(assert (=> d!70391 m!320619))

(declare-fun m!320655 () Bool)

(assert (=> d!70391 m!320655))

(declare-fun m!320657 () Bool)

(assert (=> d!70391 m!320657))

(assert (=> d!70391 m!320625))

(assert (=> d!70391 m!320491))

(declare-fun m!320659 () Bool)

(assert (=> d!70391 m!320659))

(declare-fun m!320661 () Bool)

(assert (=> d!70391 m!320661))

(declare-fun m!320663 () Bool)

(assert (=> d!70391 m!320663))

(assert (=> b!208413 m!320515))

(declare-fun m!320665 () Bool)

(assert (=> b!208413 m!320665))

(declare-fun m!320667 () Bool)

(assert (=> b!208413 m!320667))

(declare-fun m!320669 () Bool)

(assert (=> b!208415 m!320669))

(assert (=> b!208415 m!320497))

(assert (=> b!208415 m!320515))

(assert (=> b!208314 d!70391))

(declare-fun lt!325577 () tuple2!17896)

(declare-fun d!70393 () Bool)

(assert (=> d!70393 (= lt!325577 (readNBitsLSBFirstsLoop!0 (_1!9595 lt!325388) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvor lt!325365 (ite (_2!9596 lt!325382) lt!325385 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!70393 (= (readNBitsLSBFirstsLoopPure!0 (_1!9595 lt!325388) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvor lt!325365 (ite (_2!9596 lt!325382) lt!325385 #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!17885 (_2!9603 lt!325577) (_1!9603 lt!325577)))))

(declare-fun bs!17307 () Bool)

(assert (= bs!17307 d!70393))

(declare-fun m!320671 () Bool)

(assert (=> bs!17307 m!320671))

(assert (=> b!208314 d!70393))

(declare-fun d!70395 () Bool)

(declare-fun lt!325578 () tuple2!17894)

(assert (=> d!70395 (= lt!325578 (readBit!0 (_1!9595 lt!325374)))))

(assert (=> d!70395 (= (readBitPure!0 (_1!9595 lt!325374)) (tuple2!17883 (_2!9602 lt!325578) (_1!9602 lt!325578)))))

(declare-fun bs!17308 () Bool)

(assert (= bs!17308 d!70395))

(declare-fun m!320673 () Bool)

(assert (=> bs!17308 m!320673))

(assert (=> b!208314 d!70395))

(declare-fun d!70397 () Bool)

(assert (=> d!70397 (validate_offset_bits!1 ((_ sign_extend 32) (size!4595 (buf!5103 (_2!9594 lt!325384)))) ((_ sign_extend 32) (currentByte!9627 thiss!1204)) ((_ sign_extend 32) (currentBit!9622 thiss!1204)) lt!325366)))

(declare-fun lt!325581 () Unit!14823)

(declare-fun choose!9 (BitStream!8298 array!10450 (_ BitVec 64) BitStream!8298) Unit!14823)

(assert (=> d!70397 (= lt!325581 (choose!9 thiss!1204 (buf!5103 (_2!9594 lt!325384)) lt!325366 (BitStream!8299 (buf!5103 (_2!9594 lt!325384)) (currentByte!9627 thiss!1204) (currentBit!9622 thiss!1204))))))

(assert (=> d!70397 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5103 (_2!9594 lt!325384)) lt!325366) lt!325581)))

(declare-fun bs!17309 () Bool)

(assert (= bs!17309 d!70397))

(assert (=> bs!17309 m!320465))

(declare-fun m!320675 () Bool)

(assert (=> bs!17309 m!320675))

(assert (=> b!208314 d!70397))

(declare-fun d!70399 () Bool)

(declare-fun lt!325582 () tuple2!17894)

(assert (=> d!70399 (= lt!325582 (readBit!0 (BitStream!8299 (buf!5103 (_2!9594 lt!325384)) (currentByte!9627 thiss!1204) (currentBit!9622 thiss!1204))))))

(assert (=> d!70399 (= (readBitPure!0 (BitStream!8299 (buf!5103 (_2!9594 lt!325384)) (currentByte!9627 thiss!1204) (currentBit!9622 thiss!1204))) (tuple2!17883 (_2!9602 lt!325582) (_1!9602 lt!325582)))))

(declare-fun bs!17310 () Bool)

(assert (= bs!17310 d!70399))

(declare-fun m!320677 () Bool)

(assert (=> bs!17310 m!320677))

(assert (=> b!208314 d!70399))

(declare-fun d!70401 () Bool)

(assert (=> d!70401 (validate_offset_bits!1 ((_ sign_extend 32) (size!4595 (buf!5103 (_2!9594 lt!325384)))) ((_ sign_extend 32) (currentByte!9627 (_2!9594 lt!325367))) ((_ sign_extend 32) (currentBit!9622 (_2!9594 lt!325367))) lt!325381)))

(declare-fun lt!325583 () Unit!14823)

(assert (=> d!70401 (= lt!325583 (choose!9 (_2!9594 lt!325367) (buf!5103 (_2!9594 lt!325384)) lt!325381 (BitStream!8299 (buf!5103 (_2!9594 lt!325384)) (currentByte!9627 (_2!9594 lt!325367)) (currentBit!9622 (_2!9594 lt!325367)))))))

(assert (=> d!70401 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9594 lt!325367) (buf!5103 (_2!9594 lt!325384)) lt!325381) lt!325583)))

(declare-fun bs!17311 () Bool)

(assert (= bs!17311 d!70401))

(assert (=> bs!17311 m!320471))

(declare-fun m!320679 () Bool)

(assert (=> bs!17311 m!320679))

(assert (=> b!208314 d!70401))

(declare-fun d!70403 () Bool)

(assert (=> d!70403 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4595 (buf!5103 (_2!9594 lt!325384)))) ((_ sign_extend 32) (currentByte!9627 (_2!9594 lt!325367))) ((_ sign_extend 32) (currentBit!9622 (_2!9594 lt!325367))) lt!325381) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4595 (buf!5103 (_2!9594 lt!325384)))) ((_ sign_extend 32) (currentByte!9627 (_2!9594 lt!325367))) ((_ sign_extend 32) (currentBit!9622 (_2!9594 lt!325367)))) lt!325381))))

(declare-fun bs!17312 () Bool)

(assert (= bs!17312 d!70403))

(declare-fun m!320681 () Bool)

(assert (=> bs!17312 m!320681))

(assert (=> b!208314 d!70403))

(declare-fun d!70405 () Bool)

(declare-fun e!142390 () Bool)

(assert (=> d!70405 e!142390))

(declare-fun res!174918 () Bool)

(assert (=> d!70405 (=> (not res!174918) (not e!142390))))

(declare-fun lt!325593 () tuple2!17882)

(declare-fun lt!325594 () tuple2!17882)

(assert (=> d!70405 (= res!174918 (= (bitIndex!0 (size!4595 (buf!5103 (_1!9596 lt!325593))) (currentByte!9627 (_1!9596 lt!325593)) (currentBit!9622 (_1!9596 lt!325593))) (bitIndex!0 (size!4595 (buf!5103 (_1!9596 lt!325594))) (currentByte!9627 (_1!9596 lt!325594)) (currentBit!9622 (_1!9596 lt!325594)))))))

(declare-fun lt!325592 () Unit!14823)

(declare-fun lt!325595 () BitStream!8298)

(declare-fun choose!50 (BitStream!8298 BitStream!8298 BitStream!8298 tuple2!17882 tuple2!17882 BitStream!8298 Bool tuple2!17882 tuple2!17882 BitStream!8298 Bool) Unit!14823)

(assert (=> d!70405 (= lt!325592 (choose!50 lt!325387 (_2!9594 lt!325384) lt!325595 lt!325593 (tuple2!17883 (_1!9596 lt!325593) (_2!9596 lt!325593)) (_1!9596 lt!325593) (_2!9596 lt!325593) lt!325594 (tuple2!17883 (_1!9596 lt!325594) (_2!9596 lt!325594)) (_1!9596 lt!325594) (_2!9596 lt!325594)))))

(assert (=> d!70405 (= lt!325594 (readBitPure!0 lt!325595))))

(assert (=> d!70405 (= lt!325593 (readBitPure!0 lt!325387))))

(assert (=> d!70405 (= lt!325595 (BitStream!8299 (buf!5103 (_2!9594 lt!325384)) (currentByte!9627 lt!325387) (currentBit!9622 lt!325387)))))

(assert (=> d!70405 (invariant!0 (currentBit!9622 lt!325387) (currentByte!9627 lt!325387) (size!4595 (buf!5103 (_2!9594 lt!325384))))))

(assert (=> d!70405 (= (readBitPrefixLemma!0 lt!325387 (_2!9594 lt!325384)) lt!325592)))

(declare-fun b!208419 () Bool)

(assert (=> b!208419 (= e!142390 (= (_2!9596 lt!325593) (_2!9596 lt!325594)))))

(assert (= (and d!70405 res!174918) b!208419))

(declare-fun m!320683 () Bool)

(assert (=> d!70405 m!320683))

(declare-fun m!320685 () Bool)

(assert (=> d!70405 m!320685))

(declare-fun m!320687 () Bool)

(assert (=> d!70405 m!320687))

(declare-fun m!320689 () Bool)

(assert (=> d!70405 m!320689))

(assert (=> d!70405 m!320463))

(declare-fun m!320691 () Bool)

(assert (=> d!70405 m!320691))

(assert (=> b!208314 d!70405))

(declare-fun d!70407 () Bool)

(declare-fun e!142391 () Bool)

(assert (=> d!70407 e!142391))

(declare-fun res!174920 () Bool)

(assert (=> d!70407 (=> (not res!174920) (not e!142391))))

(declare-fun lt!325597 () (_ BitVec 64))

(declare-fun lt!325601 () (_ BitVec 64))

(declare-fun lt!325600 () (_ BitVec 64))

(assert (=> d!70407 (= res!174920 (= lt!325597 (bvsub lt!325600 lt!325601)))))

(assert (=> d!70407 (or (= (bvand lt!325600 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!325601 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!325600 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!325600 lt!325601) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70407 (= lt!325601 (remainingBits!0 ((_ sign_extend 32) (size!4595 (buf!5103 (_2!9594 lt!325384)))) ((_ sign_extend 32) (currentByte!9627 (_2!9594 lt!325384))) ((_ sign_extend 32) (currentBit!9622 (_2!9594 lt!325384)))))))

(declare-fun lt!325598 () (_ BitVec 64))

(declare-fun lt!325599 () (_ BitVec 64))

(assert (=> d!70407 (= lt!325600 (bvmul lt!325598 lt!325599))))

(assert (=> d!70407 (or (= lt!325598 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!325599 (bvsdiv (bvmul lt!325598 lt!325599) lt!325598)))))

(assert (=> d!70407 (= lt!325599 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70407 (= lt!325598 ((_ sign_extend 32) (size!4595 (buf!5103 (_2!9594 lt!325384)))))))

(assert (=> d!70407 (= lt!325597 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9627 (_2!9594 lt!325384))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9622 (_2!9594 lt!325384)))))))

(assert (=> d!70407 (invariant!0 (currentBit!9622 (_2!9594 lt!325384)) (currentByte!9627 (_2!9594 lt!325384)) (size!4595 (buf!5103 (_2!9594 lt!325384))))))

(assert (=> d!70407 (= (bitIndex!0 (size!4595 (buf!5103 (_2!9594 lt!325384))) (currentByte!9627 (_2!9594 lt!325384)) (currentBit!9622 (_2!9594 lt!325384))) lt!325597)))

(declare-fun b!208420 () Bool)

(declare-fun res!174919 () Bool)

(assert (=> b!208420 (=> (not res!174919) (not e!142391))))

(assert (=> b!208420 (= res!174919 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!325597))))

(declare-fun b!208421 () Bool)

(declare-fun lt!325596 () (_ BitVec 64))

(assert (=> b!208421 (= e!142391 (bvsle lt!325597 (bvmul lt!325596 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!208421 (or (= lt!325596 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!325596 #b0000000000000000000000000000000000000000000000000000000000001000) lt!325596)))))

(assert (=> b!208421 (= lt!325596 ((_ sign_extend 32) (size!4595 (buf!5103 (_2!9594 lt!325384)))))))

(assert (= (and d!70407 res!174920) b!208420))

(assert (= (and b!208420 res!174919) b!208421))

(declare-fun m!320693 () Bool)

(assert (=> d!70407 m!320693))

(assert (=> d!70407 m!320489))

(assert (=> b!208303 d!70407))

(declare-fun d!70409 () Bool)

(declare-fun res!174922 () Bool)

(declare-fun e!142393 () Bool)

(assert (=> d!70409 (=> (not res!174922) (not e!142393))))

(assert (=> d!70409 (= res!174922 (= (size!4595 (buf!5103 thiss!1204)) (size!4595 (buf!5103 (_2!9594 lt!325384)))))))

(assert (=> d!70409 (= (isPrefixOf!0 thiss!1204 (_2!9594 lt!325384)) e!142393)))

(declare-fun b!208422 () Bool)

(declare-fun res!174921 () Bool)

(assert (=> b!208422 (=> (not res!174921) (not e!142393))))

(assert (=> b!208422 (= res!174921 (bvsle (bitIndex!0 (size!4595 (buf!5103 thiss!1204)) (currentByte!9627 thiss!1204) (currentBit!9622 thiss!1204)) (bitIndex!0 (size!4595 (buf!5103 (_2!9594 lt!325384))) (currentByte!9627 (_2!9594 lt!325384)) (currentBit!9622 (_2!9594 lt!325384)))))))

(declare-fun b!208423 () Bool)

(declare-fun e!142392 () Bool)

(assert (=> b!208423 (= e!142393 e!142392)))

(declare-fun res!174923 () Bool)

(assert (=> b!208423 (=> res!174923 e!142392)))

(assert (=> b!208423 (= res!174923 (= (size!4595 (buf!5103 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!208424 () Bool)

(assert (=> b!208424 (= e!142392 (arrayBitRangesEq!0 (buf!5103 thiss!1204) (buf!5103 (_2!9594 lt!325384)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4595 (buf!5103 thiss!1204)) (currentByte!9627 thiss!1204) (currentBit!9622 thiss!1204))))))

(assert (= (and d!70409 res!174922) b!208422))

(assert (= (and b!208422 res!174921) b!208423))

(assert (= (and b!208423 (not res!174923)) b!208424))

(assert (=> b!208422 m!320517))

(assert (=> b!208422 m!320497))

(assert (=> b!208424 m!320517))

(assert (=> b!208424 m!320517))

(declare-fun m!320695 () Bool)

(assert (=> b!208424 m!320695))

(assert (=> b!208303 d!70409))

(declare-fun d!70411 () Bool)

(assert (=> d!70411 (isPrefixOf!0 thiss!1204 (_2!9594 lt!325384))))

(declare-fun lt!325604 () Unit!14823)

(declare-fun choose!30 (BitStream!8298 BitStream!8298 BitStream!8298) Unit!14823)

(assert (=> d!70411 (= lt!325604 (choose!30 thiss!1204 (_2!9594 lt!325367) (_2!9594 lt!325384)))))

(assert (=> d!70411 (isPrefixOf!0 thiss!1204 (_2!9594 lt!325367))))

(assert (=> d!70411 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9594 lt!325367) (_2!9594 lt!325384)) lt!325604)))

(declare-fun bs!17313 () Bool)

(assert (= bs!17313 d!70411))

(assert (=> bs!17313 m!320499))

(declare-fun m!320697 () Bool)

(assert (=> bs!17313 m!320697))

(assert (=> bs!17313 m!320513))

(assert (=> b!208303 d!70411))

(declare-fun b!208507 () Bool)

(declare-fun e!142444 () Bool)

(declare-fun lt!325794 () tuple2!17884)

(declare-fun lt!325789 () tuple2!17880)

(assert (=> b!208507 (= e!142444 (= (_1!9597 lt!325794) (_2!9595 lt!325789)))))

(declare-fun b!208508 () Bool)

(declare-fun res!175000 () Bool)

(declare-fun e!142448 () Bool)

(assert (=> b!208508 (=> (not res!175000) (not e!142448))))

(declare-fun lt!325787 () tuple2!17878)

(assert (=> b!208508 (= res!175000 (isPrefixOf!0 (_2!9594 lt!325367) (_2!9594 lt!325787)))))

(declare-fun b!208509 () Bool)

(declare-fun res!175008 () Bool)

(assert (=> b!208509 (=> (not res!175008) (not e!142448))))

(assert (=> b!208509 (= res!175008 (= (size!4595 (buf!5103 (_2!9594 lt!325367))) (size!4595 (buf!5103 (_2!9594 lt!325787)))))))

(declare-fun b!208510 () Bool)

(declare-fun e!142443 () Bool)

(declare-fun lt!325790 () (_ BitVec 64))

(assert (=> b!208510 (= e!142443 (validate_offset_bits!1 ((_ sign_extend 32) (size!4595 (buf!5103 (_2!9594 lt!325367)))) ((_ sign_extend 32) (currentByte!9627 (_2!9594 lt!325367))) ((_ sign_extend 32) (currentBit!9622 (_2!9594 lt!325367))) lt!325790))))

(declare-fun b!208511 () Bool)

(declare-fun e!142441 () tuple2!17878)

(declare-fun Unit!14829 () Unit!14823)

(assert (=> b!208511 (= e!142441 (tuple2!17879 Unit!14829 (_2!9594 lt!325367)))))

(declare-fun lt!325784 () Unit!14823)

(assert (=> b!208511 (= lt!325784 (lemmaIsPrefixRefl!0 (_2!9594 lt!325367)))))

(declare-fun call!3282 () Bool)

(assert (=> b!208511 call!3282))

(declare-fun lt!325805 () Unit!14823)

(assert (=> b!208511 (= lt!325805 lt!325784)))

(declare-fun b!208512 () Bool)

(assert (=> b!208512 (= e!142448 e!142444)))

(declare-fun res!174999 () Bool)

(assert (=> b!208512 (=> (not res!174999) (not e!142444))))

(assert (=> b!208512 (= res!174999 (= (_2!9597 lt!325794) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!208512 (= lt!325794 (readNBitsLSBFirstsLoopPure!0 (_1!9595 lt!325789) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!325797 () Unit!14823)

(declare-fun lt!325838 () Unit!14823)

(assert (=> b!208512 (= lt!325797 lt!325838)))

(assert (=> b!208512 (validate_offset_bits!1 ((_ sign_extend 32) (size!4595 (buf!5103 (_2!9594 lt!325787)))) ((_ sign_extend 32) (currentByte!9627 (_2!9594 lt!325367))) ((_ sign_extend 32) (currentBit!9622 (_2!9594 lt!325367))) lt!325790)))

(assert (=> b!208512 (= lt!325838 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9594 lt!325367) (buf!5103 (_2!9594 lt!325787)) lt!325790))))

(assert (=> b!208512 e!142443))

(declare-fun res!174997 () Bool)

(assert (=> b!208512 (=> (not res!174997) (not e!142443))))

(assert (=> b!208512 (= res!174997 (and (= (size!4595 (buf!5103 (_2!9594 lt!325367))) (size!4595 (buf!5103 (_2!9594 lt!325787)))) (bvsge lt!325790 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!208512 (= lt!325790 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!208512 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!208512 (= lt!325789 (reader!0 (_2!9594 lt!325367) (_2!9594 lt!325787)))))

(declare-fun b!208513 () Bool)

(declare-fun e!142440 () Bool)

(declare-fun lt!325814 () tuple2!17884)

(declare-fun lt!325810 () tuple2!17880)

(assert (=> b!208513 (= e!142440 (= (_1!9597 lt!325814) (_2!9595 lt!325810)))))

(declare-fun b!208514 () Bool)

(declare-fun res!174998 () Bool)

(assert (=> b!208514 (=> (not res!174998) (not e!142448))))

(declare-fun lt!325783 () (_ BitVec 64))

(declare-fun lt!325815 () (_ BitVec 64))

(assert (=> b!208514 (= res!174998 (= (bitIndex!0 (size!4595 (buf!5103 (_2!9594 lt!325787))) (currentByte!9627 (_2!9594 lt!325787)) (currentBit!9622 (_2!9594 lt!325787))) (bvsub lt!325815 lt!325783)))))

(assert (=> b!208514 (or (= (bvand lt!325815 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!325783 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!325815 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!325815 lt!325783) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!208514 (= lt!325783 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!325813 () (_ BitVec 64))

(declare-fun lt!325798 () (_ BitVec 64))

(assert (=> b!208514 (= lt!325815 (bvadd lt!325813 lt!325798))))

(assert (=> b!208514 (or (not (= (bvand lt!325813 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!325798 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!325813 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!325813 lt!325798) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!208514 (= lt!325798 ((_ sign_extend 32) nBits!348))))

(assert (=> b!208514 (= lt!325813 (bitIndex!0 (size!4595 (buf!5103 (_2!9594 lt!325367))) (currentByte!9627 (_2!9594 lt!325367)) (currentBit!9622 (_2!9594 lt!325367))))))

(declare-fun b!208516 () Bool)

(declare-fun lt!325826 () tuple2!17882)

(declare-fun lt!325831 () tuple2!17878)

(assert (=> b!208516 (= lt!325826 (readBitPure!0 (readerFrom!0 (_2!9594 lt!325831) (currentBit!9622 (_2!9594 lt!325367)) (currentByte!9627 (_2!9594 lt!325367)))))))

(declare-fun res!175005 () Bool)

(declare-fun lt!325820 () Bool)

(assert (=> b!208516 (= res!175005 (and (= (_2!9596 lt!325826) lt!325820) (= (_1!9596 lt!325826) (_2!9594 lt!325831))))))

(declare-fun e!142446 () Bool)

(assert (=> b!208516 (=> (not res!175005) (not e!142446))))

(declare-fun e!142445 () Bool)

(assert (=> b!208516 (= e!142445 e!142446)))

(declare-fun b!208517 () Bool)

(declare-fun res!175002 () Bool)

(assert (=> b!208517 (= res!175002 call!3282)))

(assert (=> b!208517 (=> (not res!175002) (not e!142445))))

(declare-fun b!208518 () Bool)

(declare-fun e!142447 () (_ BitVec 64))

(assert (=> b!208518 (= e!142447 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!208515 () Bool)

(assert (=> b!208515 (= e!142446 (= (bitIndex!0 (size!4595 (buf!5103 (_1!9596 lt!325826))) (currentByte!9627 (_1!9596 lt!325826)) (currentBit!9622 (_1!9596 lt!325826))) (bitIndex!0 (size!4595 (buf!5103 (_2!9594 lt!325831))) (currentByte!9627 (_2!9594 lt!325831)) (currentBit!9622 (_2!9594 lt!325831)))))))

(declare-fun d!70413 () Bool)

(assert (=> d!70413 e!142448))

(declare-fun res!175006 () Bool)

(assert (=> d!70413 (=> (not res!175006) (not e!142448))))

(assert (=> d!70413 (= res!175006 (invariant!0 (currentBit!9622 (_2!9594 lt!325787)) (currentByte!9627 (_2!9594 lt!325787)) (size!4595 (buf!5103 (_2!9594 lt!325787)))))))

(assert (=> d!70413 (= lt!325787 e!142441)))

(declare-fun c!10247 () Bool)

(assert (=> d!70413 (= c!10247 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!70413 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!70413 (= (appendBitsLSBFirstLoopTR!0 (_2!9594 lt!325367) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!325787)))

(declare-fun b!208519 () Bool)

(assert (=> b!208519 (= e!142447 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!208520 () Bool)

(declare-fun e!142442 () Bool)

(declare-fun lt!325834 () tuple2!17882)

(declare-fun lt!325803 () tuple2!17882)

(assert (=> b!208520 (= e!142442 (= (_2!9596 lt!325834) (_2!9596 lt!325803)))))

(declare-fun b!208521 () Bool)

(declare-fun res!175004 () Bool)

(assert (=> b!208521 (= res!175004 (= (bitIndex!0 (size!4595 (buf!5103 (_2!9594 lt!325831))) (currentByte!9627 (_2!9594 lt!325831)) (currentBit!9622 (_2!9594 lt!325831))) (bvadd (bitIndex!0 (size!4595 (buf!5103 (_2!9594 lt!325367))) (currentByte!9627 (_2!9594 lt!325367)) (currentBit!9622 (_2!9594 lt!325367))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!208521 (=> (not res!175004) (not e!142445))))

(declare-fun b!208522 () Bool)

(declare-fun lt!325822 () tuple2!17878)

(assert (=> b!208522 (= e!142441 (tuple2!17879 (_1!9594 lt!325822) (_2!9594 lt!325822)))))

(assert (=> b!208522 (= lt!325820 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!208522 (= lt!325831 (appendBit!0 (_2!9594 lt!325367) lt!325820))))

(declare-fun res!175007 () Bool)

(assert (=> b!208522 (= res!175007 (= (size!4595 (buf!5103 (_2!9594 lt!325367))) (size!4595 (buf!5103 (_2!9594 lt!325831)))))))

(assert (=> b!208522 (=> (not res!175007) (not e!142445))))

(assert (=> b!208522 e!142445))

(declare-fun lt!325804 () tuple2!17878)

(assert (=> b!208522 (= lt!325804 lt!325831)))

(assert (=> b!208522 (= lt!325822 (appendBitsLSBFirstLoopTR!0 (_2!9594 lt!325804) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!325817 () Unit!14823)

(assert (=> b!208522 (= lt!325817 (lemmaIsPrefixTransitive!0 (_2!9594 lt!325367) (_2!9594 lt!325804) (_2!9594 lt!325822)))))

(assert (=> b!208522 (isPrefixOf!0 (_2!9594 lt!325367) (_2!9594 lt!325822))))

(declare-fun lt!325829 () Unit!14823)

(assert (=> b!208522 (= lt!325829 lt!325817)))

(assert (=> b!208522 (invariant!0 (currentBit!9622 (_2!9594 lt!325367)) (currentByte!9627 (_2!9594 lt!325367)) (size!4595 (buf!5103 (_2!9594 lt!325804))))))

(declare-fun lt!325800 () BitStream!8298)

(assert (=> b!208522 (= lt!325800 (BitStream!8299 (buf!5103 (_2!9594 lt!325804)) (currentByte!9627 (_2!9594 lt!325367)) (currentBit!9622 (_2!9594 lt!325367))))))

(assert (=> b!208522 (invariant!0 (currentBit!9622 lt!325800) (currentByte!9627 lt!325800) (size!4595 (buf!5103 (_2!9594 lt!325822))))))

(declare-fun lt!325818 () BitStream!8298)

(assert (=> b!208522 (= lt!325818 (BitStream!8299 (buf!5103 (_2!9594 lt!325822)) (currentByte!9627 lt!325800) (currentBit!9622 lt!325800)))))

(assert (=> b!208522 (= lt!325834 (readBitPure!0 lt!325800))))

(assert (=> b!208522 (= lt!325803 (readBitPure!0 lt!325818))))

(declare-fun lt!325799 () Unit!14823)

(assert (=> b!208522 (= lt!325799 (readBitPrefixLemma!0 lt!325800 (_2!9594 lt!325822)))))

(declare-fun res!175003 () Bool)

(assert (=> b!208522 (= res!175003 (= (bitIndex!0 (size!4595 (buf!5103 (_1!9596 lt!325834))) (currentByte!9627 (_1!9596 lt!325834)) (currentBit!9622 (_1!9596 lt!325834))) (bitIndex!0 (size!4595 (buf!5103 (_1!9596 lt!325803))) (currentByte!9627 (_1!9596 lt!325803)) (currentBit!9622 (_1!9596 lt!325803)))))))

(assert (=> b!208522 (=> (not res!175003) (not e!142442))))

(assert (=> b!208522 e!142442))

(declare-fun lt!325833 () Unit!14823)

(assert (=> b!208522 (= lt!325833 lt!325799)))

(declare-fun lt!325791 () tuple2!17880)

(assert (=> b!208522 (= lt!325791 (reader!0 (_2!9594 lt!325367) (_2!9594 lt!325822)))))

(declare-fun lt!325821 () tuple2!17880)

(assert (=> b!208522 (= lt!325821 (reader!0 (_2!9594 lt!325804) (_2!9594 lt!325822)))))

(declare-fun lt!325836 () tuple2!17882)

(assert (=> b!208522 (= lt!325836 (readBitPure!0 (_1!9595 lt!325791)))))

(assert (=> b!208522 (= (_2!9596 lt!325836) lt!325820)))

(declare-fun lt!325796 () Unit!14823)

(declare-fun Unit!14830 () Unit!14823)

(assert (=> b!208522 (= lt!325796 Unit!14830)))

(declare-fun lt!325827 () (_ BitVec 64))

(assert (=> b!208522 (= lt!325827 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!325828 () (_ BitVec 64))

(assert (=> b!208522 (= lt!325828 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!325832 () Unit!14823)

(assert (=> b!208522 (= lt!325832 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9594 lt!325367) (buf!5103 (_2!9594 lt!325822)) lt!325828))))

(assert (=> b!208522 (validate_offset_bits!1 ((_ sign_extend 32) (size!4595 (buf!5103 (_2!9594 lt!325822)))) ((_ sign_extend 32) (currentByte!9627 (_2!9594 lt!325367))) ((_ sign_extend 32) (currentBit!9622 (_2!9594 lt!325367))) lt!325828)))

(declare-fun lt!325835 () Unit!14823)

(assert (=> b!208522 (= lt!325835 lt!325832)))

(declare-fun lt!325786 () tuple2!17884)

(assert (=> b!208522 (= lt!325786 (readNBitsLSBFirstsLoopPure!0 (_1!9595 lt!325791) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!325827))))

(declare-fun lt!325793 () (_ BitVec 64))

(assert (=> b!208522 (= lt!325793 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!325788 () Unit!14823)

(assert (=> b!208522 (= lt!325788 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9594 lt!325804) (buf!5103 (_2!9594 lt!325822)) lt!325793))))

(assert (=> b!208522 (validate_offset_bits!1 ((_ sign_extend 32) (size!4595 (buf!5103 (_2!9594 lt!325822)))) ((_ sign_extend 32) (currentByte!9627 (_2!9594 lt!325804))) ((_ sign_extend 32) (currentBit!9622 (_2!9594 lt!325804))) lt!325793)))

(declare-fun lt!325801 () Unit!14823)

(assert (=> b!208522 (= lt!325801 lt!325788)))

(declare-fun lt!325807 () tuple2!17884)

(assert (=> b!208522 (= lt!325807 (readNBitsLSBFirstsLoopPure!0 (_1!9595 lt!325821) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!325827 (ite (_2!9596 lt!325836) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!325806 () tuple2!17884)

(assert (=> b!208522 (= lt!325806 (readNBitsLSBFirstsLoopPure!0 (_1!9595 lt!325791) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!325827))))

(declare-fun c!10248 () Bool)

(assert (=> b!208522 (= c!10248 (_2!9596 (readBitPure!0 (_1!9595 lt!325791))))))

(declare-fun lt!325785 () tuple2!17884)

(assert (=> b!208522 (= lt!325785 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9595 lt!325791) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!325827 e!142447)))))

(declare-fun lt!325830 () Unit!14823)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8298 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14823)

(assert (=> b!208522 (= lt!325830 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9595 lt!325791) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!325827))))

(assert (=> b!208522 (and (= (_2!9597 lt!325806) (_2!9597 lt!325785)) (= (_1!9597 lt!325806) (_1!9597 lt!325785)))))

(declare-fun lt!325808 () Unit!14823)

(assert (=> b!208522 (= lt!325808 lt!325830)))

(assert (=> b!208522 (= (_1!9595 lt!325791) (withMovedBitIndex!0 (_2!9595 lt!325791) (bvsub (bitIndex!0 (size!4595 (buf!5103 (_2!9594 lt!325367))) (currentByte!9627 (_2!9594 lt!325367)) (currentBit!9622 (_2!9594 lt!325367))) (bitIndex!0 (size!4595 (buf!5103 (_2!9594 lt!325822))) (currentByte!9627 (_2!9594 lt!325822)) (currentBit!9622 (_2!9594 lt!325822))))))))

(declare-fun lt!325816 () Unit!14823)

(declare-fun Unit!14831 () Unit!14823)

(assert (=> b!208522 (= lt!325816 Unit!14831)))

(assert (=> b!208522 (= (_1!9595 lt!325821) (withMovedBitIndex!0 (_2!9595 lt!325821) (bvsub (bitIndex!0 (size!4595 (buf!5103 (_2!9594 lt!325804))) (currentByte!9627 (_2!9594 lt!325804)) (currentBit!9622 (_2!9594 lt!325804))) (bitIndex!0 (size!4595 (buf!5103 (_2!9594 lt!325822))) (currentByte!9627 (_2!9594 lt!325822)) (currentBit!9622 (_2!9594 lt!325822))))))))

(declare-fun lt!325825 () Unit!14823)

(declare-fun Unit!14832 () Unit!14823)

(assert (=> b!208522 (= lt!325825 Unit!14832)))

(assert (=> b!208522 (= (bitIndex!0 (size!4595 (buf!5103 (_2!9594 lt!325367))) (currentByte!9627 (_2!9594 lt!325367)) (currentBit!9622 (_2!9594 lt!325367))) (bvsub (bitIndex!0 (size!4595 (buf!5103 (_2!9594 lt!325804))) (currentByte!9627 (_2!9594 lt!325804)) (currentBit!9622 (_2!9594 lt!325804))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!325802 () Unit!14823)

(declare-fun Unit!14833 () Unit!14823)

(assert (=> b!208522 (= lt!325802 Unit!14833)))

(assert (=> b!208522 (= (_2!9597 lt!325786) (_2!9597 lt!325807))))

(declare-fun lt!325837 () Unit!14823)

(declare-fun Unit!14834 () Unit!14823)

(assert (=> b!208522 (= lt!325837 Unit!14834)))

(assert (=> b!208522 (invariant!0 (currentBit!9622 (_2!9594 lt!325822)) (currentByte!9627 (_2!9594 lt!325822)) (size!4595 (buf!5103 (_2!9594 lt!325822))))))

(declare-fun lt!325795 () Unit!14823)

(declare-fun Unit!14835 () Unit!14823)

(assert (=> b!208522 (= lt!325795 Unit!14835)))

(assert (=> b!208522 (= (size!4595 (buf!5103 (_2!9594 lt!325367))) (size!4595 (buf!5103 (_2!9594 lt!325822))))))

(declare-fun lt!325823 () Unit!14823)

(declare-fun Unit!14836 () Unit!14823)

(assert (=> b!208522 (= lt!325823 Unit!14836)))

(assert (=> b!208522 (= (bitIndex!0 (size!4595 (buf!5103 (_2!9594 lt!325822))) (currentByte!9627 (_2!9594 lt!325822)) (currentBit!9622 (_2!9594 lt!325822))) (bvsub (bvadd (bitIndex!0 (size!4595 (buf!5103 (_2!9594 lt!325367))) (currentByte!9627 (_2!9594 lt!325367)) (currentBit!9622 (_2!9594 lt!325367))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!325792 () Unit!14823)

(declare-fun Unit!14837 () Unit!14823)

(assert (=> b!208522 (= lt!325792 Unit!14837)))

(declare-fun lt!325819 () Unit!14823)

(declare-fun Unit!14838 () Unit!14823)

(assert (=> b!208522 (= lt!325819 Unit!14838)))

(assert (=> b!208522 (= lt!325810 (reader!0 (_2!9594 lt!325367) (_2!9594 lt!325822)))))

(declare-fun lt!325812 () (_ BitVec 64))

(assert (=> b!208522 (= lt!325812 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!325809 () Unit!14823)

(assert (=> b!208522 (= lt!325809 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9594 lt!325367) (buf!5103 (_2!9594 lt!325822)) lt!325812))))

(assert (=> b!208522 (validate_offset_bits!1 ((_ sign_extend 32) (size!4595 (buf!5103 (_2!9594 lt!325822)))) ((_ sign_extend 32) (currentByte!9627 (_2!9594 lt!325367))) ((_ sign_extend 32) (currentBit!9622 (_2!9594 lt!325367))) lt!325812)))

(declare-fun lt!325811 () Unit!14823)

(assert (=> b!208522 (= lt!325811 lt!325809)))

(assert (=> b!208522 (= lt!325814 (readNBitsLSBFirstsLoopPure!0 (_1!9595 lt!325810) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!175001 () Bool)

(assert (=> b!208522 (= res!175001 (= (_2!9597 lt!325814) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!208522 (=> (not res!175001) (not e!142440))))

(assert (=> b!208522 e!142440))

(declare-fun lt!325824 () Unit!14823)

(declare-fun Unit!14839 () Unit!14823)

(assert (=> b!208522 (= lt!325824 Unit!14839)))

(declare-fun bm!3279 () Bool)

(assert (=> bm!3279 (= call!3282 (isPrefixOf!0 (_2!9594 lt!325367) (ite c!10247 (_2!9594 lt!325367) (_2!9594 lt!325831))))))

(assert (= (and d!70413 c!10247) b!208511))

(assert (= (and d!70413 (not c!10247)) b!208522))

(assert (= (and b!208522 res!175007) b!208521))

(assert (= (and b!208521 res!175004) b!208517))

(assert (= (and b!208517 res!175002) b!208516))

(assert (= (and b!208516 res!175005) b!208515))

(assert (= (and b!208522 res!175003) b!208520))

(assert (= (and b!208522 c!10248) b!208518))

(assert (= (and b!208522 (not c!10248)) b!208519))

(assert (= (and b!208522 res!175001) b!208513))

(assert (= (or b!208511 b!208517) bm!3279))

(assert (= (and d!70413 res!175006) b!208509))

(assert (= (and b!208509 res!175008) b!208514))

(assert (= (and b!208514 res!174998) b!208508))

(assert (= (and b!208508 res!175000) b!208512))

(assert (= (and b!208512 res!174997) b!208510))

(assert (= (and b!208512 res!174999) b!208507))

(declare-fun m!320735 () Bool)

(assert (=> b!208521 m!320735))

(assert (=> b!208521 m!320515))

(assert (=> b!208511 m!320659))

(declare-fun m!320737 () Bool)

(assert (=> b!208516 m!320737))

(assert (=> b!208516 m!320737))

(declare-fun m!320739 () Bool)

(assert (=> b!208516 m!320739))

(declare-fun m!320741 () Bool)

(assert (=> b!208515 m!320741))

(assert (=> b!208515 m!320735))

(declare-fun m!320743 () Bool)

(assert (=> b!208508 m!320743))

(declare-fun m!320745 () Bool)

(assert (=> b!208512 m!320745))

(declare-fun m!320747 () Bool)

(assert (=> b!208512 m!320747))

(declare-fun m!320749 () Bool)

(assert (=> b!208512 m!320749))

(declare-fun m!320751 () Bool)

(assert (=> b!208512 m!320751))

(declare-fun m!320753 () Bool)

(assert (=> b!208512 m!320753))

(declare-fun m!320755 () Bool)

(assert (=> b!208512 m!320755))

(declare-fun m!320757 () Bool)

(assert (=> b!208522 m!320757))

(declare-fun m!320759 () Bool)

(assert (=> b!208522 m!320759))

(declare-fun m!320761 () Bool)

(assert (=> b!208522 m!320761))

(declare-fun m!320763 () Bool)

(assert (=> b!208522 m!320763))

(declare-fun m!320765 () Bool)

(assert (=> b!208522 m!320765))

(declare-fun m!320767 () Bool)

(assert (=> b!208522 m!320767))

(declare-fun m!320769 () Bool)

(assert (=> b!208522 m!320769))

(declare-fun m!320771 () Bool)

(assert (=> b!208522 m!320771))

(declare-fun m!320773 () Bool)

(assert (=> b!208522 m!320773))

(declare-fun m!320775 () Bool)

(assert (=> b!208522 m!320775))

(declare-fun m!320777 () Bool)

(assert (=> b!208522 m!320777))

(declare-fun m!320779 () Bool)

(assert (=> b!208522 m!320779))

(declare-fun m!320781 () Bool)

(assert (=> b!208522 m!320781))

(declare-fun m!320783 () Bool)

(assert (=> b!208522 m!320783))

(declare-fun m!320785 () Bool)

(assert (=> b!208522 m!320785))

(assert (=> b!208522 m!320515))

(declare-fun m!320787 () Bool)

(assert (=> b!208522 m!320787))

(declare-fun m!320789 () Bool)

(assert (=> b!208522 m!320789))

(declare-fun m!320791 () Bool)

(assert (=> b!208522 m!320791))

(declare-fun m!320793 () Bool)

(assert (=> b!208522 m!320793))

(assert (=> b!208522 m!320753))

(assert (=> b!208522 m!320755))

(declare-fun m!320795 () Bool)

(assert (=> b!208522 m!320795))

(declare-fun m!320797 () Bool)

(assert (=> b!208522 m!320797))

(declare-fun m!320799 () Bool)

(assert (=> b!208522 m!320799))

(declare-fun m!320801 () Bool)

(assert (=> b!208522 m!320801))

(assert (=> b!208522 m!320763))

(declare-fun m!320803 () Bool)

(assert (=> b!208522 m!320803))

(declare-fun m!320805 () Bool)

(assert (=> b!208522 m!320805))

(declare-fun m!320807 () Bool)

(assert (=> b!208522 m!320807))

(declare-fun m!320809 () Bool)

(assert (=> b!208522 m!320809))

(declare-fun m!320811 () Bool)

(assert (=> b!208522 m!320811))

(declare-fun m!320813 () Bool)

(assert (=> b!208522 m!320813))

(declare-fun m!320815 () Bool)

(assert (=> b!208522 m!320815))

(declare-fun m!320817 () Bool)

(assert (=> b!208522 m!320817))

(declare-fun m!320819 () Bool)

(assert (=> b!208514 m!320819))

(assert (=> b!208514 m!320515))

(declare-fun m!320821 () Bool)

(assert (=> d!70413 m!320821))

(declare-fun m!320823 () Bool)

(assert (=> bm!3279 m!320823))

(declare-fun m!320825 () Bool)

(assert (=> b!208510 m!320825))

(assert (=> b!208303 d!70413))

(declare-fun d!70445 () Bool)

(assert (=> d!70445 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9622 thiss!1204) (currentByte!9627 thiss!1204) (size!4595 (buf!5103 thiss!1204))))))

(declare-fun bs!17317 () Bool)

(assert (= bs!17317 d!70445))

(assert (=> bs!17317 m!320455))

(assert (=> start!43760 d!70445))

(declare-fun d!70447 () Bool)

(assert (=> d!70447 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4595 (buf!5103 (_1!9595 lt!325374)))) ((_ sign_extend 32) (currentByte!9627 (_1!9595 lt!325374))) ((_ sign_extend 32) (currentBit!9622 (_1!9595 lt!325374))) lt!325366) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4595 (buf!5103 (_1!9595 lt!325374)))) ((_ sign_extend 32) (currentByte!9627 (_1!9595 lt!325374))) ((_ sign_extend 32) (currentBit!9622 (_1!9595 lt!325374)))) lt!325366))))

(declare-fun bs!17318 () Bool)

(assert (= bs!17318 d!70447))

(declare-fun m!320827 () Bool)

(assert (=> bs!17318 m!320827))

(assert (=> b!208306 d!70447))

(declare-fun d!70449 () Bool)

(assert (=> d!70449 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4595 (buf!5103 thiss!1204))) ((_ sign_extend 32) (currentByte!9627 thiss!1204)) ((_ sign_extend 32) (currentBit!9622 thiss!1204)) lt!325366) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4595 (buf!5103 thiss!1204))) ((_ sign_extend 32) (currentByte!9627 thiss!1204)) ((_ sign_extend 32) (currentBit!9622 thiss!1204))) lt!325366))))

(declare-fun bs!17319 () Bool)

(assert (= bs!17319 d!70449))

(declare-fun m!320829 () Bool)

(assert (=> bs!17319 m!320829))

(assert (=> b!208316 d!70449))

(declare-fun d!70451 () Bool)

(declare-fun res!175010 () Bool)

(declare-fun e!142450 () Bool)

(assert (=> d!70451 (=> (not res!175010) (not e!142450))))

(assert (=> d!70451 (= res!175010 (= (size!4595 (buf!5103 (_2!9594 lt!325367))) (size!4595 (buf!5103 (_2!9594 lt!325384)))))))

(assert (=> d!70451 (= (isPrefixOf!0 (_2!9594 lt!325367) (_2!9594 lt!325384)) e!142450)))

(declare-fun b!208523 () Bool)

(declare-fun res!175009 () Bool)

(assert (=> b!208523 (=> (not res!175009) (not e!142450))))

(assert (=> b!208523 (= res!175009 (bvsle (bitIndex!0 (size!4595 (buf!5103 (_2!9594 lt!325367))) (currentByte!9627 (_2!9594 lt!325367)) (currentBit!9622 (_2!9594 lt!325367))) (bitIndex!0 (size!4595 (buf!5103 (_2!9594 lt!325384))) (currentByte!9627 (_2!9594 lt!325384)) (currentBit!9622 (_2!9594 lt!325384)))))))

(declare-fun b!208524 () Bool)

(declare-fun e!142449 () Bool)

(assert (=> b!208524 (= e!142450 e!142449)))

(declare-fun res!175011 () Bool)

(assert (=> b!208524 (=> res!175011 e!142449)))

(assert (=> b!208524 (= res!175011 (= (size!4595 (buf!5103 (_2!9594 lt!325367))) #b00000000000000000000000000000000))))

(declare-fun b!208525 () Bool)

(assert (=> b!208525 (= e!142449 (arrayBitRangesEq!0 (buf!5103 (_2!9594 lt!325367)) (buf!5103 (_2!9594 lt!325384)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4595 (buf!5103 (_2!9594 lt!325367))) (currentByte!9627 (_2!9594 lt!325367)) (currentBit!9622 (_2!9594 lt!325367)))))))

(assert (= (and d!70451 res!175010) b!208523))

(assert (= (and b!208523 res!175009) b!208524))

(assert (= (and b!208524 (not res!175011)) b!208525))

(assert (=> b!208523 m!320515))

(assert (=> b!208523 m!320497))

(assert (=> b!208525 m!320515))

(assert (=> b!208525 m!320515))

(declare-fun m!320831 () Bool)

(assert (=> b!208525 m!320831))

(assert (=> b!208305 d!70451))

(declare-fun d!70453 () Bool)

(assert (=> d!70453 (= (array_inv!4336 (buf!5103 thiss!1204)) (bvsge (size!4595 (buf!5103 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!208318 d!70453))

(declare-fun d!70455 () Bool)

(assert (=> d!70455 (= (invariant!0 (currentBit!9622 thiss!1204) (currentByte!9627 thiss!1204) (size!4595 (buf!5103 (_2!9594 lt!325384)))) (and (bvsge (currentBit!9622 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9622 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9627 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9627 thiss!1204) (size!4595 (buf!5103 (_2!9594 lt!325384)))) (and (= (currentBit!9622 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9627 thiss!1204) (size!4595 (buf!5103 (_2!9594 lt!325384))))))))))

(assert (=> b!208307 d!70455))

(declare-fun d!70457 () Bool)

(declare-fun e!142451 () Bool)

(assert (=> d!70457 e!142451))

(declare-fun res!175013 () Bool)

(assert (=> d!70457 (=> (not res!175013) (not e!142451))))

(declare-fun lt!325844 () (_ BitVec 64))

(declare-fun lt!325840 () (_ BitVec 64))

(declare-fun lt!325843 () (_ BitVec 64))

(assert (=> d!70457 (= res!175013 (= lt!325840 (bvsub lt!325843 lt!325844)))))

(assert (=> d!70457 (or (= (bvand lt!325843 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!325844 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!325843 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!325843 lt!325844) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70457 (= lt!325844 (remainingBits!0 ((_ sign_extend 32) (size!4595 (buf!5103 (_2!9594 lt!325367)))) ((_ sign_extend 32) (currentByte!9627 (_2!9594 lt!325367))) ((_ sign_extend 32) (currentBit!9622 (_2!9594 lt!325367)))))))

(declare-fun lt!325841 () (_ BitVec 64))

(declare-fun lt!325842 () (_ BitVec 64))

(assert (=> d!70457 (= lt!325843 (bvmul lt!325841 lt!325842))))

(assert (=> d!70457 (or (= lt!325841 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!325842 (bvsdiv (bvmul lt!325841 lt!325842) lt!325841)))))

(assert (=> d!70457 (= lt!325842 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70457 (= lt!325841 ((_ sign_extend 32) (size!4595 (buf!5103 (_2!9594 lt!325367)))))))

(assert (=> d!70457 (= lt!325840 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9627 (_2!9594 lt!325367))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9622 (_2!9594 lt!325367)))))))

(assert (=> d!70457 (invariant!0 (currentBit!9622 (_2!9594 lt!325367)) (currentByte!9627 (_2!9594 lt!325367)) (size!4595 (buf!5103 (_2!9594 lt!325367))))))

(assert (=> d!70457 (= (bitIndex!0 (size!4595 (buf!5103 (_2!9594 lt!325367))) (currentByte!9627 (_2!9594 lt!325367)) (currentBit!9622 (_2!9594 lt!325367))) lt!325840)))

(declare-fun b!208526 () Bool)

(declare-fun res!175012 () Bool)

(assert (=> b!208526 (=> (not res!175012) (not e!142451))))

(assert (=> b!208526 (= res!175012 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!325840))))

(declare-fun b!208527 () Bool)

(declare-fun lt!325839 () (_ BitVec 64))

(assert (=> b!208527 (= e!142451 (bvsle lt!325840 (bvmul lt!325839 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!208527 (or (= lt!325839 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!325839 #b0000000000000000000000000000000000000000000000000000000000001000) lt!325839)))))

(assert (=> b!208527 (= lt!325839 ((_ sign_extend 32) (size!4595 (buf!5103 (_2!9594 lt!325367)))))))

(assert (= (and d!70457 res!175013) b!208526))

(assert (= (and b!208526 res!175012) b!208527))

(declare-fun m!320833 () Bool)

(assert (=> d!70457 m!320833))

(declare-fun m!320835 () Bool)

(assert (=> d!70457 m!320835))

(assert (=> b!208317 d!70457))

(declare-fun d!70459 () Bool)

(declare-fun e!142452 () Bool)

(assert (=> d!70459 e!142452))

(declare-fun res!175015 () Bool)

(assert (=> d!70459 (=> (not res!175015) (not e!142452))))

(declare-fun lt!325849 () (_ BitVec 64))

(declare-fun lt!325846 () (_ BitVec 64))

(declare-fun lt!325850 () (_ BitVec 64))

(assert (=> d!70459 (= res!175015 (= lt!325846 (bvsub lt!325849 lt!325850)))))

(assert (=> d!70459 (or (= (bvand lt!325849 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!325850 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!325849 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!325849 lt!325850) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70459 (= lt!325850 (remainingBits!0 ((_ sign_extend 32) (size!4595 (buf!5103 thiss!1204))) ((_ sign_extend 32) (currentByte!9627 thiss!1204)) ((_ sign_extend 32) (currentBit!9622 thiss!1204))))))

(declare-fun lt!325847 () (_ BitVec 64))

(declare-fun lt!325848 () (_ BitVec 64))

(assert (=> d!70459 (= lt!325849 (bvmul lt!325847 lt!325848))))

(assert (=> d!70459 (or (= lt!325847 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!325848 (bvsdiv (bvmul lt!325847 lt!325848) lt!325847)))))

(assert (=> d!70459 (= lt!325848 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70459 (= lt!325847 ((_ sign_extend 32) (size!4595 (buf!5103 thiss!1204))))))

(assert (=> d!70459 (= lt!325846 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9627 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9622 thiss!1204))))))

(assert (=> d!70459 (invariant!0 (currentBit!9622 thiss!1204) (currentByte!9627 thiss!1204) (size!4595 (buf!5103 thiss!1204)))))

(assert (=> d!70459 (= (bitIndex!0 (size!4595 (buf!5103 thiss!1204)) (currentByte!9627 thiss!1204) (currentBit!9622 thiss!1204)) lt!325846)))

(declare-fun b!208528 () Bool)

(declare-fun res!175014 () Bool)

(assert (=> b!208528 (=> (not res!175014) (not e!142452))))

(assert (=> b!208528 (= res!175014 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!325846))))

(declare-fun b!208529 () Bool)

(declare-fun lt!325845 () (_ BitVec 64))

(assert (=> b!208529 (= e!142452 (bvsle lt!325846 (bvmul lt!325845 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!208529 (or (= lt!325845 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!325845 #b0000000000000000000000000000000000000000000000000000000000001000) lt!325845)))))

(assert (=> b!208529 (= lt!325845 ((_ sign_extend 32) (size!4595 (buf!5103 thiss!1204))))))

(assert (= (and d!70459 res!175015) b!208528))

(assert (= (and b!208528 res!175014) b!208529))

(assert (=> d!70459 m!320829))

(assert (=> d!70459 m!320455))

(assert (=> b!208317 d!70459))

(declare-fun d!70461 () Bool)

(assert (=> d!70461 (= (invariant!0 (currentBit!9622 thiss!1204) (currentByte!9627 thiss!1204) (size!4595 (buf!5103 thiss!1204))) (and (bvsge (currentBit!9622 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9622 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9627 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9627 thiss!1204) (size!4595 (buf!5103 thiss!1204))) (and (= (currentBit!9622 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9627 thiss!1204) (size!4595 (buf!5103 thiss!1204)))))))))

(assert (=> b!208319 d!70461))

(declare-fun d!70463 () Bool)

(assert (=> d!70463 (= (invariant!0 (currentBit!9622 (_2!9594 lt!325384)) (currentByte!9627 (_2!9594 lt!325384)) (size!4595 (buf!5103 (_2!9594 lt!325384)))) (and (bvsge (currentBit!9622 (_2!9594 lt!325384)) #b00000000000000000000000000000000) (bvslt (currentBit!9622 (_2!9594 lt!325384)) #b00000000000000000000000000001000) (bvsge (currentByte!9627 (_2!9594 lt!325384)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9627 (_2!9594 lt!325384)) (size!4595 (buf!5103 (_2!9594 lt!325384)))) (and (= (currentBit!9622 (_2!9594 lt!325384)) #b00000000000000000000000000000000) (= (currentByte!9627 (_2!9594 lt!325384)) (size!4595 (buf!5103 (_2!9594 lt!325384))))))))))

(assert (=> b!208308 d!70463))

(declare-fun d!70465 () Bool)

(declare-fun lt!325851 () tuple2!17894)

(assert (=> d!70465 (= lt!325851 (readBit!0 (readerFrom!0 (_2!9594 lt!325367) (currentBit!9622 thiss!1204) (currentByte!9627 thiss!1204))))))

(assert (=> d!70465 (= (readBitPure!0 (readerFrom!0 (_2!9594 lt!325367) (currentBit!9622 thiss!1204) (currentByte!9627 thiss!1204))) (tuple2!17883 (_2!9602 lt!325851) (_1!9602 lt!325851)))))

(declare-fun bs!17320 () Bool)

(assert (= bs!17320 d!70465))

(assert (=> bs!17320 m!320507))

(declare-fun m!320837 () Bool)

(assert (=> bs!17320 m!320837))

(assert (=> b!208310 d!70465))

(declare-fun d!70467 () Bool)

(declare-fun e!142455 () Bool)

(assert (=> d!70467 e!142455))

(declare-fun res!175019 () Bool)

(assert (=> d!70467 (=> (not res!175019) (not e!142455))))

(assert (=> d!70467 (= res!175019 (invariant!0 (currentBit!9622 (_2!9594 lt!325367)) (currentByte!9627 (_2!9594 lt!325367)) (size!4595 (buf!5103 (_2!9594 lt!325367)))))))

(assert (=> d!70467 (= (readerFrom!0 (_2!9594 lt!325367) (currentBit!9622 thiss!1204) (currentByte!9627 thiss!1204)) (BitStream!8299 (buf!5103 (_2!9594 lt!325367)) (currentByte!9627 thiss!1204) (currentBit!9622 thiss!1204)))))

(declare-fun b!208532 () Bool)

(assert (=> b!208532 (= e!142455 (invariant!0 (currentBit!9622 thiss!1204) (currentByte!9627 thiss!1204) (size!4595 (buf!5103 (_2!9594 lt!325367)))))))

(assert (= (and d!70467 res!175019) b!208532))

(assert (=> d!70467 m!320835))

(assert (=> b!208532 m!320461))

(assert (=> b!208310 d!70467))

(assert (=> b!208320 d!70457))

(assert (=> b!208320 d!70459))

(declare-fun b!208542 () Bool)

(declare-fun res!175029 () Bool)

(declare-fun e!142460 () Bool)

(assert (=> b!208542 (=> (not res!175029) (not e!142460))))

(declare-fun lt!325860 () (_ BitVec 64))

(declare-fun lt!325861 () tuple2!17878)

(declare-fun lt!325863 () (_ BitVec 64))

(assert (=> b!208542 (= res!175029 (= (bitIndex!0 (size!4595 (buf!5103 (_2!9594 lt!325861))) (currentByte!9627 (_2!9594 lt!325861)) (currentBit!9622 (_2!9594 lt!325861))) (bvadd lt!325863 lt!325860)))))

(assert (=> b!208542 (or (not (= (bvand lt!325863 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!325860 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!325863 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!325863 lt!325860) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!208542 (= lt!325860 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!208542 (= lt!325863 (bitIndex!0 (size!4595 (buf!5103 thiss!1204)) (currentByte!9627 thiss!1204) (currentBit!9622 thiss!1204)))))

(declare-fun b!208545 () Bool)

(declare-fun e!142461 () Bool)

(declare-fun lt!325862 () tuple2!17882)

(assert (=> b!208545 (= e!142461 (= (bitIndex!0 (size!4595 (buf!5103 (_1!9596 lt!325862))) (currentByte!9627 (_1!9596 lt!325862)) (currentBit!9622 (_1!9596 lt!325862))) (bitIndex!0 (size!4595 (buf!5103 (_2!9594 lt!325861))) (currentByte!9627 (_2!9594 lt!325861)) (currentBit!9622 (_2!9594 lt!325861)))))))

(declare-fun b!208543 () Bool)

(declare-fun res!175030 () Bool)

(assert (=> b!208543 (=> (not res!175030) (not e!142460))))

(assert (=> b!208543 (= res!175030 (isPrefixOf!0 thiss!1204 (_2!9594 lt!325861)))))

(declare-fun b!208544 () Bool)

(assert (=> b!208544 (= e!142460 e!142461)))

(declare-fun res!175028 () Bool)

(assert (=> b!208544 (=> (not res!175028) (not e!142461))))

(assert (=> b!208544 (= res!175028 (and (= (_2!9596 lt!325862) lt!325369) (= (_1!9596 lt!325862) (_2!9594 lt!325861))))))

(assert (=> b!208544 (= lt!325862 (readBitPure!0 (readerFrom!0 (_2!9594 lt!325861) (currentBit!9622 thiss!1204) (currentByte!9627 thiss!1204))))))

(declare-fun d!70469 () Bool)

(assert (=> d!70469 e!142460))

(declare-fun res!175031 () Bool)

(assert (=> d!70469 (=> (not res!175031) (not e!142460))))

(assert (=> d!70469 (= res!175031 (= (size!4595 (buf!5103 thiss!1204)) (size!4595 (buf!5103 (_2!9594 lt!325861)))))))

(declare-fun choose!16 (BitStream!8298 Bool) tuple2!17878)

(assert (=> d!70469 (= lt!325861 (choose!16 thiss!1204 lt!325369))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!70469 (validate_offset_bit!0 ((_ sign_extend 32) (size!4595 (buf!5103 thiss!1204))) ((_ sign_extend 32) (currentByte!9627 thiss!1204)) ((_ sign_extend 32) (currentBit!9622 thiss!1204)))))

(assert (=> d!70469 (= (appendBit!0 thiss!1204 lt!325369) lt!325861)))

(assert (= (and d!70469 res!175031) b!208542))

(assert (= (and b!208542 res!175029) b!208543))

(assert (= (and b!208543 res!175030) b!208544))

(assert (= (and b!208544 res!175028) b!208545))

(declare-fun m!320839 () Bool)

(assert (=> b!208545 m!320839))

(declare-fun m!320841 () Bool)

(assert (=> b!208545 m!320841))

(declare-fun m!320843 () Bool)

(assert (=> b!208544 m!320843))

(assert (=> b!208544 m!320843))

(declare-fun m!320845 () Bool)

(assert (=> b!208544 m!320845))

(declare-fun m!320847 () Bool)

(assert (=> b!208543 m!320847))

(declare-fun m!320849 () Bool)

(assert (=> d!70469 m!320849))

(declare-fun m!320851 () Bool)

(assert (=> d!70469 m!320851))

(assert (=> b!208542 m!320841))

(assert (=> b!208542 m!320517))

(assert (=> b!208320 d!70469))

(check-sat (not d!70399) (not d!70413) (not b!208422) (not b!208386) (not b!208515) (not b!208543) (not b!208523) (not b!208512) (not b!208407) (not d!70403) (not d!70397) (not b!208544) (not d!70387) (not b!208410) (not b!208525) (not d!70457) (not d!70445) (not b!208384) (not d!70377) (not b!208424) (not b!208412) (not b!208532) (not d!70395) (not d!70393) (not b!208510) (not b!208414) (not b!208413) (not b!208514) (not d!70469) (not b!208542) (not b!208511) (not d!70381) (not b!208516) (not d!70405) (not d!70391) (not d!70447) (not b!208408) (not d!70459) (not d!70383) (not b!208545) (not bm!3279) (not d!70407) (not d!70373) (not b!208415) (not d!70379) (not d!70401) (not b!208409) (not d!70449) (not b!208508) (not b!208522) (not d!70411) (not d!70465) (not b!208521) (not d!70467) (not d!70389))
(check-sat)
