; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39744 () Bool)

(assert start!39744)

(declare-fun b!180365 () Bool)

(declare-fun res!149763 () Bool)

(declare-fun e!125355 () Bool)

(assert (=> b!180365 (=> res!149763 e!125355)))

(declare-datatypes ((array!9678 0))(
  ( (array!9679 (arr!5199 (Array (_ BitVec 32) (_ BitVec 8))) (size!4269 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7646 0))(
  ( (BitStream!7647 (buf!4712 array!9678) (currentByte!8922 (_ BitVec 32)) (currentBit!8917 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!12957 0))(
  ( (Unit!12958) )
))
(declare-datatypes ((tuple2!15560 0))(
  ( (tuple2!15561 (_1!8425 Unit!12957) (_2!8425 BitStream!7646)) )
))
(declare-fun lt!276496 () tuple2!15560)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!180365 (= res!149763 (not (invariant!0 (currentBit!8917 (_2!8425 lt!276496)) (currentByte!8922 (_2!8425 lt!276496)) (size!4269 (buf!4712 (_2!8425 lt!276496))))))))

(declare-fun b!180366 () Bool)

(declare-fun e!125356 () Bool)

(declare-fun e!125357 () Bool)

(assert (=> b!180366 (= e!125356 e!125357)))

(declare-fun res!149760 () Bool)

(assert (=> b!180366 (=> (not res!149760) (not e!125357))))

(declare-fun lt!276487 () tuple2!15560)

(declare-fun lt!276497 () Bool)

(declare-datatypes ((tuple2!15562 0))(
  ( (tuple2!15563 (_1!8426 BitStream!7646) (_2!8426 Bool)) )
))
(declare-fun lt!276493 () tuple2!15562)

(assert (=> b!180366 (= res!149760 (and (= (_2!8426 lt!276493) lt!276497) (= (_1!8426 lt!276493) (_2!8425 lt!276487))))))

(declare-fun thiss!1204 () BitStream!7646)

(declare-fun readBitPure!0 (BitStream!7646) tuple2!15562)

(declare-fun readerFrom!0 (BitStream!7646 (_ BitVec 32) (_ BitVec 32)) BitStream!7646)

(assert (=> b!180366 (= lt!276493 (readBitPure!0 (readerFrom!0 (_2!8425 lt!276487) (currentBit!8917 thiss!1204) (currentByte!8922 thiss!1204))))))

(declare-fun b!180367 () Bool)

(declare-fun lt!276488 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!180367 (= e!125357 (= (bitIndex!0 (size!4269 (buf!4712 (_1!8426 lt!276493))) (currentByte!8922 (_1!8426 lt!276493)) (currentBit!8917 (_1!8426 lt!276493))) lt!276488))))

(declare-fun b!180368 () Bool)

(declare-fun e!125353 () Bool)

(declare-fun e!125349 () Bool)

(assert (=> b!180368 (= e!125353 e!125349)))

(declare-fun res!149761 () Bool)

(assert (=> b!180368 (=> (not res!149761) (not e!125349))))

(declare-fun lt!276490 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!180368 (= res!149761 (validate_offset_bits!1 ((_ sign_extend 32) (size!4269 (buf!4712 thiss!1204))) ((_ sign_extend 32) (currentByte!8922 thiss!1204)) ((_ sign_extend 32) (currentBit!8917 thiss!1204)) lt!276490))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!180368 (= lt!276490 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!180369 () Bool)

(declare-fun e!125358 () Bool)

(declare-fun array_inv!4010 (array!9678) Bool)

(assert (=> b!180369 (= e!125358 (array_inv!4010 (buf!4712 thiss!1204)))))

(declare-fun b!180371 () Bool)

(declare-fun e!125354 () Bool)

(assert (=> b!180371 (= e!125354 e!125355)))

(declare-fun res!149764 () Bool)

(assert (=> b!180371 (=> res!149764 e!125355)))

(declare-fun lt!276481 () (_ BitVec 64))

(declare-fun lt!276483 () (_ BitVec 64))

(assert (=> b!180371 (= res!149764 (not (= lt!276483 (bvsub (bvsub (bvadd lt!276481 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!180371 (= lt!276483 (bitIndex!0 (size!4269 (buf!4712 (_2!8425 lt!276496))) (currentByte!8922 (_2!8425 lt!276496)) (currentBit!8917 (_2!8425 lt!276496))))))

(declare-fun isPrefixOf!0 (BitStream!7646 BitStream!7646) Bool)

(assert (=> b!180371 (isPrefixOf!0 thiss!1204 (_2!8425 lt!276496))))

(declare-fun lt!276489 () Unit!12957)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7646 BitStream!7646 BitStream!7646) Unit!12957)

(assert (=> b!180371 (= lt!276489 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8425 lt!276487) (_2!8425 lt!276496)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7646 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15560)

(assert (=> b!180371 (= lt!276496 (appendBitsLSBFirstLoopTR!0 (_2!8425 lt!276487) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!180372 () Bool)

(declare-fun res!149756 () Bool)

(assert (=> b!180372 (=> res!149756 e!125355)))

(assert (=> b!180372 (= res!149756 (not (isPrefixOf!0 thiss!1204 (_2!8425 lt!276487))))))

(declare-fun b!180373 () Bool)

(declare-fun res!149767 () Bool)

(assert (=> b!180373 (=> res!149767 e!125355)))

(declare-fun lt!276492 () (_ BitVec 64))

(assert (=> b!180373 (= res!149767 (or (not (= (size!4269 (buf!4712 (_2!8425 lt!276496))) (size!4269 (buf!4712 thiss!1204)))) (not (= lt!276483 (bvsub (bvadd lt!276492 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!180374 () Bool)

(assert (=> b!180374 (= e!125349 (not e!125354))))

(declare-fun res!149768 () Bool)

(assert (=> b!180374 (=> res!149768 e!125354)))

(assert (=> b!180374 (= res!149768 (not (= lt!276481 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!276492))))))

(assert (=> b!180374 (= lt!276481 (bitIndex!0 (size!4269 (buf!4712 (_2!8425 lt!276487))) (currentByte!8922 (_2!8425 lt!276487)) (currentBit!8917 (_2!8425 lt!276487))))))

(assert (=> b!180374 (= lt!276492 (bitIndex!0 (size!4269 (buf!4712 thiss!1204)) (currentByte!8922 thiss!1204) (currentBit!8917 thiss!1204)))))

(declare-fun e!125352 () Bool)

(assert (=> b!180374 e!125352))

(declare-fun res!149759 () Bool)

(assert (=> b!180374 (=> (not res!149759) (not e!125352))))

(assert (=> b!180374 (= res!149759 (= (size!4269 (buf!4712 thiss!1204)) (size!4269 (buf!4712 (_2!8425 lt!276487)))))))

(declare-fun appendBit!0 (BitStream!7646 Bool) tuple2!15560)

(assert (=> b!180374 (= lt!276487 (appendBit!0 thiss!1204 lt!276497))))

(assert (=> b!180374 (= lt!276497 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!180375 () Bool)

(declare-fun e!125350 () Bool)

(declare-fun lt!276491 () tuple2!15562)

(declare-fun lt!276485 () tuple2!15562)

(assert (=> b!180375 (= e!125350 (= (_2!8426 lt!276491) (_2!8426 lt!276485)))))

(declare-fun b!180376 () Bool)

(declare-fun res!149758 () Bool)

(assert (=> b!180376 (=> (not res!149758) (not e!125349))))

(assert (=> b!180376 (= res!149758 (not (= i!590 nBits!348)))))

(declare-fun b!180377 () Bool)

(assert (=> b!180377 (= e!125355 true)))

(assert (=> b!180377 (validate_offset_bits!1 ((_ sign_extend 32) (size!4269 (buf!4712 (_2!8425 lt!276496)))) ((_ sign_extend 32) (currentByte!8922 thiss!1204)) ((_ sign_extend 32) (currentBit!8917 thiss!1204)) lt!276490)))

(declare-fun lt!276486 () Unit!12957)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7646 array!9678 (_ BitVec 64)) Unit!12957)

(assert (=> b!180377 (= lt!276486 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4712 (_2!8425 lt!276496)) lt!276490))))

(declare-datatypes ((tuple2!15564 0))(
  ( (tuple2!15565 (_1!8427 BitStream!7646) (_2!8427 BitStream!7646)) )
))
(declare-fun lt!276484 () tuple2!15564)

(assert (=> b!180377 (= (_2!8426 (readBitPure!0 (_1!8427 lt!276484))) lt!276497)))

(declare-fun lt!276494 () tuple2!15564)

(declare-fun reader!0 (BitStream!7646 BitStream!7646) tuple2!15564)

(assert (=> b!180377 (= lt!276494 (reader!0 (_2!8425 lt!276487) (_2!8425 lt!276496)))))

(assert (=> b!180377 (= lt!276484 (reader!0 thiss!1204 (_2!8425 lt!276496)))))

(assert (=> b!180377 e!125350))

(declare-fun res!149765 () Bool)

(assert (=> b!180377 (=> (not res!149765) (not e!125350))))

(assert (=> b!180377 (= res!149765 (= (bitIndex!0 (size!4269 (buf!4712 (_1!8426 lt!276491))) (currentByte!8922 (_1!8426 lt!276491)) (currentBit!8917 (_1!8426 lt!276491))) (bitIndex!0 (size!4269 (buf!4712 (_1!8426 lt!276485))) (currentByte!8922 (_1!8426 lt!276485)) (currentBit!8917 (_1!8426 lt!276485)))))))

(declare-fun lt!276482 () Unit!12957)

(declare-fun lt!276480 () BitStream!7646)

(declare-fun readBitPrefixLemma!0 (BitStream!7646 BitStream!7646) Unit!12957)

(assert (=> b!180377 (= lt!276482 (readBitPrefixLemma!0 lt!276480 (_2!8425 lt!276496)))))

(assert (=> b!180377 (= lt!276485 (readBitPure!0 (BitStream!7647 (buf!4712 (_2!8425 lt!276496)) (currentByte!8922 thiss!1204) (currentBit!8917 thiss!1204))))))

(assert (=> b!180377 (= lt!276491 (readBitPure!0 lt!276480))))

(declare-fun e!125359 () Bool)

(assert (=> b!180377 e!125359))

(declare-fun res!149757 () Bool)

(assert (=> b!180377 (=> (not res!149757) (not e!125359))))

(assert (=> b!180377 (= res!149757 (invariant!0 (currentBit!8917 thiss!1204) (currentByte!8922 thiss!1204) (size!4269 (buf!4712 (_2!8425 lt!276487)))))))

(assert (=> b!180377 (= lt!276480 (BitStream!7647 (buf!4712 (_2!8425 lt!276487)) (currentByte!8922 thiss!1204) (currentBit!8917 thiss!1204)))))

(declare-fun b!180370 () Bool)

(declare-fun res!149755 () Bool)

(assert (=> b!180370 (=> res!149755 e!125355)))

(assert (=> b!180370 (= res!149755 (not (isPrefixOf!0 (_2!8425 lt!276487) (_2!8425 lt!276496))))))

(declare-fun res!149769 () Bool)

(assert (=> start!39744 (=> (not res!149769) (not e!125353))))

(assert (=> start!39744 (= res!149769 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39744 e!125353))

(assert (=> start!39744 true))

(declare-fun inv!12 (BitStream!7646) Bool)

(assert (=> start!39744 (and (inv!12 thiss!1204) e!125358)))

(declare-fun b!180378 () Bool)

(declare-fun res!149754 () Bool)

(assert (=> b!180378 (=> (not res!149754) (not e!125349))))

(assert (=> b!180378 (= res!149754 (invariant!0 (currentBit!8917 thiss!1204) (currentByte!8922 thiss!1204) (size!4269 (buf!4712 thiss!1204))))))

(declare-fun b!180379 () Bool)

(declare-fun res!149766 () Bool)

(assert (=> b!180379 (=> (not res!149766) (not e!125356))))

(assert (=> b!180379 (= res!149766 (isPrefixOf!0 thiss!1204 (_2!8425 lt!276487)))))

(declare-fun b!180380 () Bool)

(assert (=> b!180380 (= e!125352 e!125356)))

(declare-fun res!149762 () Bool)

(assert (=> b!180380 (=> (not res!149762) (not e!125356))))

(declare-fun lt!276495 () (_ BitVec 64))

(assert (=> b!180380 (= res!149762 (= lt!276488 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!276495)))))

(assert (=> b!180380 (= lt!276488 (bitIndex!0 (size!4269 (buf!4712 (_2!8425 lt!276487))) (currentByte!8922 (_2!8425 lt!276487)) (currentBit!8917 (_2!8425 lt!276487))))))

(assert (=> b!180380 (= lt!276495 (bitIndex!0 (size!4269 (buf!4712 thiss!1204)) (currentByte!8922 thiss!1204) (currentBit!8917 thiss!1204)))))

(declare-fun b!180381 () Bool)

(assert (=> b!180381 (= e!125359 (invariant!0 (currentBit!8917 thiss!1204) (currentByte!8922 thiss!1204) (size!4269 (buf!4712 (_2!8425 lt!276496)))))))

(assert (= (and start!39744 res!149769) b!180368))

(assert (= (and b!180368 res!149761) b!180378))

(assert (= (and b!180378 res!149754) b!180376))

(assert (= (and b!180376 res!149758) b!180374))

(assert (= (and b!180374 res!149759) b!180380))

(assert (= (and b!180380 res!149762) b!180379))

(assert (= (and b!180379 res!149766) b!180366))

(assert (= (and b!180366 res!149760) b!180367))

(assert (= (and b!180374 (not res!149768)) b!180371))

(assert (= (and b!180371 (not res!149764)) b!180365))

(assert (= (and b!180365 (not res!149763)) b!180373))

(assert (= (and b!180373 (not res!149767)) b!180370))

(assert (= (and b!180370 (not res!149755)) b!180372))

(assert (= (and b!180372 (not res!149756)) b!180377))

(assert (= (and b!180377 res!149757) b!180381))

(assert (= (and b!180377 res!149765) b!180375))

(assert (= start!39744 b!180369))

(declare-fun m!280767 () Bool)

(assert (=> b!180369 m!280767))

(declare-fun m!280769 () Bool)

(assert (=> b!180378 m!280769))

(declare-fun m!280771 () Bool)

(assert (=> b!180374 m!280771))

(declare-fun m!280773 () Bool)

(assert (=> b!180374 m!280773))

(declare-fun m!280775 () Bool)

(assert (=> b!180374 m!280775))

(declare-fun m!280777 () Bool)

(assert (=> b!180367 m!280777))

(declare-fun m!280779 () Bool)

(assert (=> b!180371 m!280779))

(declare-fun m!280781 () Bool)

(assert (=> b!180371 m!280781))

(declare-fun m!280783 () Bool)

(assert (=> b!180371 m!280783))

(declare-fun m!280785 () Bool)

(assert (=> b!180371 m!280785))

(declare-fun m!280787 () Bool)

(assert (=> b!180366 m!280787))

(assert (=> b!180366 m!280787))

(declare-fun m!280789 () Bool)

(assert (=> b!180366 m!280789))

(declare-fun m!280791 () Bool)

(assert (=> start!39744 m!280791))

(declare-fun m!280793 () Bool)

(assert (=> b!180377 m!280793))

(declare-fun m!280795 () Bool)

(assert (=> b!180377 m!280795))

(declare-fun m!280797 () Bool)

(assert (=> b!180377 m!280797))

(declare-fun m!280799 () Bool)

(assert (=> b!180377 m!280799))

(declare-fun m!280801 () Bool)

(assert (=> b!180377 m!280801))

(declare-fun m!280803 () Bool)

(assert (=> b!180377 m!280803))

(declare-fun m!280805 () Bool)

(assert (=> b!180377 m!280805))

(declare-fun m!280807 () Bool)

(assert (=> b!180377 m!280807))

(declare-fun m!280809 () Bool)

(assert (=> b!180377 m!280809))

(declare-fun m!280811 () Bool)

(assert (=> b!180377 m!280811))

(declare-fun m!280813 () Bool)

(assert (=> b!180377 m!280813))

(declare-fun m!280815 () Bool)

(assert (=> b!180370 m!280815))

(declare-fun m!280817 () Bool)

(assert (=> b!180365 m!280817))

(declare-fun m!280819 () Bool)

(assert (=> b!180372 m!280819))

(declare-fun m!280821 () Bool)

(assert (=> b!180368 m!280821))

(declare-fun m!280823 () Bool)

(assert (=> b!180381 m!280823))

(assert (=> b!180379 m!280819))

(assert (=> b!180380 m!280771))

(assert (=> b!180380 m!280773))

(push 1)

(assert (not b!180366))

(assert (not b!180377))

(assert (not start!39744))

(assert (not b!180379))

(assert (not b!180381))

(assert (not b!180369))

(assert (not b!180367))

(assert (not b!180372))

(assert (not b!180368))

(assert (not b!180370))

(assert (not b!180380))

(assert (not b!180378))

(assert (not b!180374))

(assert (not b!180371))

(assert (not b!180365))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

