; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39972 () Bool)

(assert start!39972)

(declare-fun b!182333 () Bool)

(declare-fun res!151529 () Bool)

(declare-fun e!126562 () Bool)

(assert (=> b!182333 (=> (not res!151529) (not e!126562))))

(declare-datatypes ((array!9732 0))(
  ( (array!9733 (arr!5223 (Array (_ BitVec 32) (_ BitVec 8))) (size!4293 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7694 0))(
  ( (BitStream!7695 (buf!4742 array!9732) (currentByte!8964 (_ BitVec 32)) (currentBit!8959 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7694)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!182333 (= res!151529 (invariant!0 (currentBit!8959 thiss!1204) (currentByte!8964 thiss!1204) (size!4293 (buf!4742 thiss!1204))))))

(declare-datatypes ((tuple2!15756 0))(
  ( (tuple2!15757 (_1!8523 BitStream!7694) (_2!8523 BitStream!7694)) )
))
(declare-fun lt!279867 () tuple2!15756)

(declare-fun i!590 () (_ BitVec 32))

(declare-fun b!182334 () Bool)

(declare-fun e!126565 () Bool)

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!182334 (= e!126565 (validate_offset_bits!1 ((_ sign_extend 32) (size!4293 (buf!4742 (_1!8523 lt!279867)))) ((_ sign_extend 32) (currentByte!8964 (_1!8523 lt!279867))) ((_ sign_extend 32) (currentBit!8959 (_1!8523 lt!279867))) ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun b!182335 () Bool)

(declare-fun e!126558 () Bool)

(declare-datatypes ((Unit!13083 0))(
  ( (Unit!13084) )
))
(declare-datatypes ((tuple2!15758 0))(
  ( (tuple2!15759 (_1!8524 Unit!13083) (_2!8524 BitStream!7694)) )
))
(declare-fun lt!279863 () tuple2!15758)

(assert (=> b!182335 (= e!126558 (invariant!0 (currentBit!8959 thiss!1204) (currentByte!8964 thiss!1204) (size!4293 (buf!4742 (_2!8524 lt!279863)))))))

(declare-fun b!182336 () Bool)

(declare-fun res!151532 () Bool)

(declare-fun e!126561 () Bool)

(assert (=> b!182336 (=> res!151532 e!126561)))

(assert (=> b!182336 (= res!151532 (not (invariant!0 (currentBit!8959 (_2!8524 lt!279863)) (currentByte!8964 (_2!8524 lt!279863)) (size!4293 (buf!4742 (_2!8524 lt!279863))))))))

(declare-fun b!182337 () Bool)

(declare-fun res!151540 () Bool)

(assert (=> b!182337 (=> res!151540 e!126561)))

(declare-fun lt!279858 () tuple2!15758)

(declare-fun isPrefixOf!0 (BitStream!7694 BitStream!7694) Bool)

(assert (=> b!182337 (= res!151540 (not (isPrefixOf!0 thiss!1204 (_2!8524 lt!279858))))))

(declare-fun b!182338 () Bool)

(declare-fun e!126568 () Bool)

(declare-datatypes ((tuple2!15760 0))(
  ( (tuple2!15761 (_1!8525 BitStream!7694) (_2!8525 Bool)) )
))
(declare-fun lt!279864 () tuple2!15760)

(declare-fun lt!279869 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!182338 (= e!126568 (= (bitIndex!0 (size!4293 (buf!4742 (_1!8525 lt!279864))) (currentByte!8964 (_1!8525 lt!279864)) (currentBit!8959 (_1!8525 lt!279864))) lt!279869))))

(declare-fun b!182339 () Bool)

(declare-fun res!151538 () Bool)

(assert (=> b!182339 (=> res!151538 e!126561)))

(assert (=> b!182339 (= res!151538 (not (isPrefixOf!0 (_2!8524 lt!279858) (_2!8524 lt!279863))))))

(declare-fun b!182340 () Bool)

(declare-fun res!151536 () Bool)

(declare-fun e!126564 () Bool)

(assert (=> b!182340 (=> (not res!151536) (not e!126564))))

(assert (=> b!182340 (= res!151536 (isPrefixOf!0 thiss!1204 (_2!8524 lt!279858)))))

(declare-fun b!182341 () Bool)

(declare-fun res!151542 () Bool)

(assert (=> b!182341 (=> (not res!151542) (not e!126562))))

(assert (=> b!182341 (= res!151542 (not (= i!590 nBits!348)))))

(declare-fun b!182332 () Bool)

(declare-fun e!126567 () Bool)

(declare-fun array_inv!4034 (array!9732) Bool)

(assert (=> b!182332 (= e!126567 (array_inv!4034 (buf!4742 thiss!1204)))))

(declare-fun res!151544 () Bool)

(declare-fun e!126560 () Bool)

(assert (=> start!39972 (=> (not res!151544) (not e!126560))))

(assert (=> start!39972 (= res!151544 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39972 e!126560))

(assert (=> start!39972 true))

(declare-fun inv!12 (BitStream!7694) Bool)

(assert (=> start!39972 (and (inv!12 thiss!1204) e!126567)))

(declare-fun b!182342 () Bool)

(declare-fun res!151530 () Bool)

(assert (=> b!182342 (=> res!151530 e!126561)))

(declare-fun lt!279871 () (_ BitVec 64))

(declare-fun lt!279860 () (_ BitVec 64))

(assert (=> b!182342 (= res!151530 (or (not (= (size!4293 (buf!4742 (_2!8524 lt!279863))) (size!4293 (buf!4742 thiss!1204)))) (not (= lt!279871 (bvsub (bvadd lt!279860 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!182343 () Bool)

(declare-fun e!126563 () Bool)

(declare-fun lt!279874 () tuple2!15760)

(declare-fun lt!279866 () tuple2!15760)

(assert (=> b!182343 (= e!126563 (= (_2!8525 lt!279874) (_2!8525 lt!279866)))))

(declare-fun b!182344 () Bool)

(assert (=> b!182344 (= e!126561 e!126565)))

(declare-fun res!151535 () Bool)

(assert (=> b!182344 (=> res!151535 e!126565)))

(assert (=> b!182344 (= res!151535 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!590)) (bvsgt (bvadd #b00000000000000000000000000000001 i!590) nBits!348)))))

(declare-fun lt!279865 () (_ BitVec 64))

(assert (=> b!182344 (validate_offset_bits!1 ((_ sign_extend 32) (size!4293 (buf!4742 (_2!8524 lt!279863)))) ((_ sign_extend 32) (currentByte!8964 (_2!8524 lt!279858))) ((_ sign_extend 32) (currentBit!8959 (_2!8524 lt!279858))) lt!279865)))

(declare-fun lt!279856 () Unit!13083)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7694 array!9732 (_ BitVec 64)) Unit!13083)

(assert (=> b!182344 (= lt!279856 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8524 lt!279858) (buf!4742 (_2!8524 lt!279863)) lt!279865))))

(assert (=> b!182344 (= lt!279865 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!279872 () tuple2!15756)

(declare-datatypes ((tuple2!15762 0))(
  ( (tuple2!15763 (_1!8526 BitStream!7694) (_2!8526 (_ BitVec 64))) )
))
(declare-fun lt!279875 () tuple2!15762)

(declare-fun v!189 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7694 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15762)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!182344 (= lt!279875 (readNBitsLSBFirstsLoopPure!0 (_1!8523 lt!279872) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(declare-fun lt!279857 () (_ BitVec 64))

(assert (=> b!182344 (validate_offset_bits!1 ((_ sign_extend 32) (size!4293 (buf!4742 (_2!8524 lt!279863)))) ((_ sign_extend 32) (currentByte!8964 thiss!1204)) ((_ sign_extend 32) (currentBit!8959 thiss!1204)) lt!279857)))

(declare-fun lt!279870 () Unit!13083)

(assert (=> b!182344 (= lt!279870 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4742 (_2!8524 lt!279863)) lt!279857))))

(declare-fun lt!279873 () Bool)

(declare-fun readBitPure!0 (BitStream!7694) tuple2!15760)

(assert (=> b!182344 (= (_2!8525 (readBitPure!0 (_1!8523 lt!279872))) lt!279873)))

(declare-fun reader!0 (BitStream!7694 BitStream!7694) tuple2!15756)

(assert (=> b!182344 (= lt!279867 (reader!0 (_2!8524 lt!279858) (_2!8524 lt!279863)))))

(assert (=> b!182344 (= lt!279872 (reader!0 thiss!1204 (_2!8524 lt!279863)))))

(assert (=> b!182344 e!126563))

(declare-fun res!151534 () Bool)

(assert (=> b!182344 (=> (not res!151534) (not e!126563))))

(assert (=> b!182344 (= res!151534 (= (bitIndex!0 (size!4293 (buf!4742 (_1!8525 lt!279874))) (currentByte!8964 (_1!8525 lt!279874)) (currentBit!8959 (_1!8525 lt!279874))) (bitIndex!0 (size!4293 (buf!4742 (_1!8525 lt!279866))) (currentByte!8964 (_1!8525 lt!279866)) (currentBit!8959 (_1!8525 lt!279866)))))))

(declare-fun lt!279859 () Unit!13083)

(declare-fun lt!279868 () BitStream!7694)

(declare-fun readBitPrefixLemma!0 (BitStream!7694 BitStream!7694) Unit!13083)

(assert (=> b!182344 (= lt!279859 (readBitPrefixLemma!0 lt!279868 (_2!8524 lt!279863)))))

(assert (=> b!182344 (= lt!279866 (readBitPure!0 (BitStream!7695 (buf!4742 (_2!8524 lt!279863)) (currentByte!8964 thiss!1204) (currentBit!8959 thiss!1204))))))

(assert (=> b!182344 (= lt!279874 (readBitPure!0 lt!279868))))

(assert (=> b!182344 e!126558))

(declare-fun res!151531 () Bool)

(assert (=> b!182344 (=> (not res!151531) (not e!126558))))

(assert (=> b!182344 (= res!151531 (invariant!0 (currentBit!8959 thiss!1204) (currentByte!8964 thiss!1204) (size!4293 (buf!4742 (_2!8524 lt!279858)))))))

(assert (=> b!182344 (= lt!279868 (BitStream!7695 (buf!4742 (_2!8524 lt!279858)) (currentByte!8964 thiss!1204) (currentBit!8959 thiss!1204)))))

(declare-fun b!182345 () Bool)

(assert (=> b!182345 (= e!126564 e!126568)))

(declare-fun res!151539 () Bool)

(assert (=> b!182345 (=> (not res!151539) (not e!126568))))

(assert (=> b!182345 (= res!151539 (and (= (_2!8525 lt!279864) lt!279873) (= (_1!8525 lt!279864) (_2!8524 lt!279858))))))

(declare-fun readerFrom!0 (BitStream!7694 (_ BitVec 32) (_ BitVec 32)) BitStream!7694)

(assert (=> b!182345 (= lt!279864 (readBitPure!0 (readerFrom!0 (_2!8524 lt!279858) (currentBit!8959 thiss!1204) (currentByte!8964 thiss!1204))))))

(declare-fun b!182346 () Bool)

(declare-fun e!126559 () Bool)

(assert (=> b!182346 (= e!126562 (not e!126559))))

(declare-fun res!151533 () Bool)

(assert (=> b!182346 (=> res!151533 e!126559)))

(declare-fun lt!279862 () (_ BitVec 64))

(assert (=> b!182346 (= res!151533 (not (= lt!279862 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!279860))))))

(assert (=> b!182346 (= lt!279862 (bitIndex!0 (size!4293 (buf!4742 (_2!8524 lt!279858))) (currentByte!8964 (_2!8524 lt!279858)) (currentBit!8959 (_2!8524 lt!279858))))))

(assert (=> b!182346 (= lt!279860 (bitIndex!0 (size!4293 (buf!4742 thiss!1204)) (currentByte!8964 thiss!1204) (currentBit!8959 thiss!1204)))))

(declare-fun e!126566 () Bool)

(assert (=> b!182346 e!126566))

(declare-fun res!151537 () Bool)

(assert (=> b!182346 (=> (not res!151537) (not e!126566))))

(assert (=> b!182346 (= res!151537 (= (size!4293 (buf!4742 thiss!1204)) (size!4293 (buf!4742 (_2!8524 lt!279858)))))))

(declare-fun appendBit!0 (BitStream!7694 Bool) tuple2!15758)

(assert (=> b!182346 (= lt!279858 (appendBit!0 thiss!1204 lt!279873))))

(assert (=> b!182346 (= lt!279873 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!182347 () Bool)

(assert (=> b!182347 (= e!126566 e!126564)))

(declare-fun res!151541 () Bool)

(assert (=> b!182347 (=> (not res!151541) (not e!126564))))

(declare-fun lt!279861 () (_ BitVec 64))

(assert (=> b!182347 (= res!151541 (= lt!279869 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!279861)))))

(assert (=> b!182347 (= lt!279869 (bitIndex!0 (size!4293 (buf!4742 (_2!8524 lt!279858))) (currentByte!8964 (_2!8524 lt!279858)) (currentBit!8959 (_2!8524 lt!279858))))))

(assert (=> b!182347 (= lt!279861 (bitIndex!0 (size!4293 (buf!4742 thiss!1204)) (currentByte!8964 thiss!1204) (currentBit!8959 thiss!1204)))))

(declare-fun b!182348 () Bool)

(assert (=> b!182348 (= e!126560 e!126562)))

(declare-fun res!151543 () Bool)

(assert (=> b!182348 (=> (not res!151543) (not e!126562))))

(assert (=> b!182348 (= res!151543 (validate_offset_bits!1 ((_ sign_extend 32) (size!4293 (buf!4742 thiss!1204))) ((_ sign_extend 32) (currentByte!8964 thiss!1204)) ((_ sign_extend 32) (currentBit!8959 thiss!1204)) lt!279857))))

(assert (=> b!182348 (= lt!279857 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!182349 () Bool)

(assert (=> b!182349 (= e!126559 e!126561)))

(declare-fun res!151545 () Bool)

(assert (=> b!182349 (=> res!151545 e!126561)))

(assert (=> b!182349 (= res!151545 (not (= lt!279871 (bvsub (bvsub (bvadd lt!279862 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!182349 (= lt!279871 (bitIndex!0 (size!4293 (buf!4742 (_2!8524 lt!279863))) (currentByte!8964 (_2!8524 lt!279863)) (currentBit!8959 (_2!8524 lt!279863))))))

(assert (=> b!182349 (isPrefixOf!0 thiss!1204 (_2!8524 lt!279863))))

(declare-fun lt!279855 () Unit!13083)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7694 BitStream!7694 BitStream!7694) Unit!13083)

(assert (=> b!182349 (= lt!279855 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8524 lt!279858) (_2!8524 lt!279863)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7694 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15758)

(assert (=> b!182349 (= lt!279863 (appendBitsLSBFirstLoopTR!0 (_2!8524 lt!279858) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(assert (= (and start!39972 res!151544) b!182348))

(assert (= (and b!182348 res!151543) b!182333))

(assert (= (and b!182333 res!151529) b!182341))

(assert (= (and b!182341 res!151542) b!182346))

(assert (= (and b!182346 res!151537) b!182347))

(assert (= (and b!182347 res!151541) b!182340))

(assert (= (and b!182340 res!151536) b!182345))

(assert (= (and b!182345 res!151539) b!182338))

(assert (= (and b!182346 (not res!151533)) b!182349))

(assert (= (and b!182349 (not res!151545)) b!182336))

(assert (= (and b!182336 (not res!151532)) b!182342))

(assert (= (and b!182342 (not res!151530)) b!182339))

(assert (= (and b!182339 (not res!151538)) b!182337))

(assert (= (and b!182337 (not res!151540)) b!182344))

(assert (= (and b!182344 res!151531) b!182335))

(assert (= (and b!182344 res!151534) b!182343))

(assert (= (and b!182344 (not res!151535)) b!182334))

(assert (= start!39972 b!182332))

(declare-fun m!283565 () Bool)

(assert (=> b!182344 m!283565))

(declare-fun m!283567 () Bool)

(assert (=> b!182344 m!283567))

(declare-fun m!283569 () Bool)

(assert (=> b!182344 m!283569))

(declare-fun m!283571 () Bool)

(assert (=> b!182344 m!283571))

(declare-fun m!283573 () Bool)

(assert (=> b!182344 m!283573))

(declare-fun m!283575 () Bool)

(assert (=> b!182344 m!283575))

(declare-fun m!283577 () Bool)

(assert (=> b!182344 m!283577))

(declare-fun m!283579 () Bool)

(assert (=> b!182344 m!283579))

(declare-fun m!283581 () Bool)

(assert (=> b!182344 m!283581))

(declare-fun m!283583 () Bool)

(assert (=> b!182344 m!283583))

(declare-fun m!283585 () Bool)

(assert (=> b!182344 m!283585))

(declare-fun m!283587 () Bool)

(assert (=> b!182344 m!283587))

(declare-fun m!283589 () Bool)

(assert (=> b!182344 m!283589))

(declare-fun m!283591 () Bool)

(assert (=> b!182344 m!283591))

(declare-fun m!283593 () Bool)

(assert (=> b!182344 m!283593))

(declare-fun m!283595 () Bool)

(assert (=> b!182335 m!283595))

(declare-fun m!283597 () Bool)

(assert (=> b!182337 m!283597))

(declare-fun m!283599 () Bool)

(assert (=> b!182339 m!283599))

(declare-fun m!283601 () Bool)

(assert (=> b!182348 m!283601))

(assert (=> b!182340 m!283597))

(declare-fun m!283603 () Bool)

(assert (=> b!182334 m!283603))

(declare-fun m!283605 () Bool)

(assert (=> b!182345 m!283605))

(assert (=> b!182345 m!283605))

(declare-fun m!283607 () Bool)

(assert (=> b!182345 m!283607))

(declare-fun m!283609 () Bool)

(assert (=> b!182349 m!283609))

(declare-fun m!283611 () Bool)

(assert (=> b!182349 m!283611))

(declare-fun m!283613 () Bool)

(assert (=> b!182349 m!283613))

(declare-fun m!283615 () Bool)

(assert (=> b!182349 m!283615))

(declare-fun m!283617 () Bool)

(assert (=> b!182333 m!283617))

(declare-fun m!283619 () Bool)

(assert (=> start!39972 m!283619))

(declare-fun m!283621 () Bool)

(assert (=> b!182332 m!283621))

(declare-fun m!283623 () Bool)

(assert (=> b!182347 m!283623))

(declare-fun m!283625 () Bool)

(assert (=> b!182347 m!283625))

(declare-fun m!283627 () Bool)

(assert (=> b!182336 m!283627))

(declare-fun m!283629 () Bool)

(assert (=> b!182338 m!283629))

(assert (=> b!182346 m!283623))

(assert (=> b!182346 m!283625))

(declare-fun m!283631 () Bool)

(assert (=> b!182346 m!283631))

(push 1)

(assert (not b!182344))

(assert (not b!182334))

(assert (not b!182337))

(assert (not b!182346))

(assert (not b!182332))

(assert (not b!182340))

(assert (not start!39972))

(assert (not b!182336))

(assert (not b!182349))

(assert (not b!182335))

(assert (not b!182333))

(assert (not b!182345))

(assert (not b!182348))

(assert (not b!182338))

(assert (not b!182347))

(assert (not b!182339))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!63291 () Bool)

(declare-fun e!126623 () Bool)

(assert (=> d!63291 e!126623))

(declare-fun res!151637 () Bool)

(assert (=> d!63291 (=> (not res!151637) (not e!126623))))

(declare-fun lt!280099 () (_ BitVec 64))

(declare-fun lt!280095 () (_ BitVec 64))

(declare-fun lt!280098 () (_ BitVec 64))

(assert (=> d!63291 (= res!151637 (= lt!280098 (bvsub lt!280095 lt!280099)))))

(assert (=> d!63291 (or (= (bvand lt!280095 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!280099 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!280095 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!280095 lt!280099) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!63291 (= lt!280099 (remainingBits!0 ((_ sign_extend 32) (size!4293 (buf!4742 (_2!8524 lt!279858)))) ((_ sign_extend 32) (currentByte!8964 (_2!8524 lt!279858))) ((_ sign_extend 32) (currentBit!8959 (_2!8524 lt!279858)))))))

(declare-fun lt!280096 () (_ BitVec 64))

(declare-fun lt!280097 () (_ BitVec 64))

(assert (=> d!63291 (= lt!280095 (bvmul lt!280096 lt!280097))))

(assert (=> d!63291 (or (= lt!280096 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!280097 (bvsdiv (bvmul lt!280096 lt!280097) lt!280096)))))

(assert (=> d!63291 (= lt!280097 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63291 (= lt!280096 ((_ sign_extend 32) (size!4293 (buf!4742 (_2!8524 lt!279858)))))))

(assert (=> d!63291 (= lt!280098 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8964 (_2!8524 lt!279858))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8959 (_2!8524 lt!279858)))))))

(assert (=> d!63291 (invariant!0 (currentBit!8959 (_2!8524 lt!279858)) (currentByte!8964 (_2!8524 lt!279858)) (size!4293 (buf!4742 (_2!8524 lt!279858))))))

(assert (=> d!63291 (= (bitIndex!0 (size!4293 (buf!4742 (_2!8524 lt!279858))) (currentByte!8964 (_2!8524 lt!279858)) (currentBit!8959 (_2!8524 lt!279858))) lt!280098)))

(declare-fun b!182448 () Bool)

(declare-fun res!151636 () Bool)

(assert (=> b!182448 (=> (not res!151636) (not e!126623))))

(assert (=> b!182448 (= res!151636 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!280098))))

(declare-fun b!182449 () Bool)

(declare-fun lt!280100 () (_ BitVec 64))

(assert (=> b!182449 (= e!126623 (bvsle lt!280098 (bvmul lt!280100 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!182449 (or (= lt!280100 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!280100 #b0000000000000000000000000000000000000000000000000000000000001000) lt!280100)))))

(assert (=> b!182449 (= lt!280100 ((_ sign_extend 32) (size!4293 (buf!4742 (_2!8524 lt!279858)))))))

(assert (= (and d!63291 res!151637) b!182448))

(assert (= (and b!182448 res!151636) b!182449))

(declare-fun m!283781 () Bool)

(assert (=> d!63291 m!283781))

(declare-fun m!283783 () Bool)

(assert (=> d!63291 m!283783))

(assert (=> b!182347 d!63291))

(declare-fun d!63293 () Bool)

(declare-fun e!126624 () Bool)

(assert (=> d!63293 e!126624))

(declare-fun res!151639 () Bool)

(assert (=> d!63293 (=> (not res!151639) (not e!126624))))

(declare-fun lt!280105 () (_ BitVec 64))

(declare-fun lt!280101 () (_ BitVec 64))

(declare-fun lt!280104 () (_ BitVec 64))

(assert (=> d!63293 (= res!151639 (= lt!280104 (bvsub lt!280101 lt!280105)))))

(assert (=> d!63293 (or (= (bvand lt!280101 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!280105 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!280101 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!280101 lt!280105) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63293 (= lt!280105 (remainingBits!0 ((_ sign_extend 32) (size!4293 (buf!4742 thiss!1204))) ((_ sign_extend 32) (currentByte!8964 thiss!1204)) ((_ sign_extend 32) (currentBit!8959 thiss!1204))))))

(declare-fun lt!280102 () (_ BitVec 64))

(declare-fun lt!280103 () (_ BitVec 64))

(assert (=> d!63293 (= lt!280101 (bvmul lt!280102 lt!280103))))

(assert (=> d!63293 (or (= lt!280102 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!280103 (bvsdiv (bvmul lt!280102 lt!280103) lt!280102)))))

(assert (=> d!63293 (= lt!280103 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63293 (= lt!280102 ((_ sign_extend 32) (size!4293 (buf!4742 thiss!1204))))))

(assert (=> d!63293 (= lt!280104 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8964 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8959 thiss!1204))))))

(assert (=> d!63293 (invariant!0 (currentBit!8959 thiss!1204) (currentByte!8964 thiss!1204) (size!4293 (buf!4742 thiss!1204)))))

(assert (=> d!63293 (= (bitIndex!0 (size!4293 (buf!4742 thiss!1204)) (currentByte!8964 thiss!1204) (currentBit!8959 thiss!1204)) lt!280104)))

(declare-fun b!182450 () Bool)

(declare-fun res!151638 () Bool)

(assert (=> b!182450 (=> (not res!151638) (not e!126624))))

(assert (=> b!182450 (= res!151638 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!280104))))

(declare-fun b!182451 () Bool)

(declare-fun lt!280106 () (_ BitVec 64))

(assert (=> b!182451 (= e!126624 (bvsle lt!280104 (bvmul lt!280106 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!182451 (or (= lt!280106 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!280106 #b0000000000000000000000000000000000000000000000000000000000001000) lt!280106)))))

(assert (=> b!182451 (= lt!280106 ((_ sign_extend 32) (size!4293 (buf!4742 thiss!1204))))))

(assert (= (and d!63293 res!151639) b!182450))

(assert (= (and b!182450 res!151638) b!182451))

(declare-fun m!283785 () Bool)

(assert (=> d!63293 m!283785))

(assert (=> d!63293 m!283617))

(assert (=> b!182347 d!63293))

(declare-fun d!63295 () Bool)

(declare-fun res!151648 () Bool)

(declare-fun e!126630 () Bool)

(assert (=> d!63295 (=> (not res!151648) (not e!126630))))

(assert (=> d!63295 (= res!151648 (= (size!4293 (buf!4742 thiss!1204)) (size!4293 (buf!4742 (_2!8524 lt!279858)))))))

(assert (=> d!63295 (= (isPrefixOf!0 thiss!1204 (_2!8524 lt!279858)) e!126630)))

(declare-fun b!182458 () Bool)

(declare-fun res!151647 () Bool)

(assert (=> b!182458 (=> (not res!151647) (not e!126630))))

(assert (=> b!182458 (= res!151647 (bvsle (bitIndex!0 (size!4293 (buf!4742 thiss!1204)) (currentByte!8964 thiss!1204) (currentBit!8959 thiss!1204)) (bitIndex!0 (size!4293 (buf!4742 (_2!8524 lt!279858))) (currentByte!8964 (_2!8524 lt!279858)) (currentBit!8959 (_2!8524 lt!279858)))))))

(declare-fun b!182459 () Bool)

(declare-fun e!126629 () Bool)

(assert (=> b!182459 (= e!126630 e!126629)))

(declare-fun res!151646 () Bool)

(assert (=> b!182459 (=> res!151646 e!126629)))

(assert (=> b!182459 (= res!151646 (= (size!4293 (buf!4742 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!182460 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9732 array!9732 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!182460 (= e!126629 (arrayBitRangesEq!0 (buf!4742 thiss!1204) (buf!4742 (_2!8524 lt!279858)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4293 (buf!4742 thiss!1204)) (currentByte!8964 thiss!1204) (currentBit!8959 thiss!1204))))))

(assert (= (and d!63295 res!151648) b!182458))

(assert (= (and b!182458 res!151647) b!182459))

(assert (= (and b!182459 (not res!151646)) b!182460))

(assert (=> b!182458 m!283625))

(assert (=> b!182458 m!283623))

(assert (=> b!182460 m!283625))

(assert (=> b!182460 m!283625))

(declare-fun m!283787 () Bool)

(assert (=> b!182460 m!283787))

(assert (=> b!182337 d!63295))

(declare-fun d!63297 () Bool)

(assert (=> d!63297 (= (inv!12 thiss!1204) (invariant!0 (currentBit!8959 thiss!1204) (currentByte!8964 thiss!1204) (size!4293 (buf!4742 thiss!1204))))))

(declare-fun bs!15763 () Bool)

(assert (= bs!15763 d!63297))

(assert (=> bs!15763 m!283617))

(assert (=> start!39972 d!63297))

(declare-fun d!63299 () Bool)

(assert (=> d!63299 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4293 (buf!4742 thiss!1204))) ((_ sign_extend 32) (currentByte!8964 thiss!1204)) ((_ sign_extend 32) (currentBit!8959 thiss!1204)) lt!279857) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4293 (buf!4742 thiss!1204))) ((_ sign_extend 32) (currentByte!8964 thiss!1204)) ((_ sign_extend 32) (currentBit!8959 thiss!1204))) lt!279857))))

(declare-fun bs!15764 () Bool)

(assert (= bs!15764 d!63299))

(assert (=> bs!15764 m!283785))

(assert (=> b!182348 d!63299))

(declare-fun d!63301 () Bool)

(assert (=> d!63301 (= (invariant!0 (currentBit!8959 thiss!1204) (currentByte!8964 thiss!1204) (size!4293 (buf!4742 (_2!8524 lt!279863)))) (and (bvsge (currentBit!8959 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8959 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8964 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8964 thiss!1204) (size!4293 (buf!4742 (_2!8524 lt!279863)))) (and (= (currentBit!8959 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8964 thiss!1204) (size!4293 (buf!4742 (_2!8524 lt!279863))))))))))

(assert (=> b!182335 d!63301))

(assert (=> b!182346 d!63291))

(assert (=> b!182346 d!63293))

(declare-fun d!63303 () Bool)

(declare-fun e!126636 () Bool)

(assert (=> d!63303 e!126636))

(declare-fun res!151658 () Bool)

(assert (=> d!63303 (=> (not res!151658) (not e!126636))))

(declare-fun lt!280118 () tuple2!15758)

(assert (=> d!63303 (= res!151658 (= (size!4293 (buf!4742 thiss!1204)) (size!4293 (buf!4742 (_2!8524 lt!280118)))))))

(declare-fun choose!16 (BitStream!7694 Bool) tuple2!15758)

(assert (=> d!63303 (= lt!280118 (choose!16 thiss!1204 lt!279873))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!63303 (validate_offset_bit!0 ((_ sign_extend 32) (size!4293 (buf!4742 thiss!1204))) ((_ sign_extend 32) (currentByte!8964 thiss!1204)) ((_ sign_extend 32) (currentBit!8959 thiss!1204)))))

(assert (=> d!63303 (= (appendBit!0 thiss!1204 lt!279873) lt!280118)))

(declare-fun b!182471 () Bool)

(declare-fun res!151660 () Bool)

(assert (=> b!182471 (=> (not res!151660) (not e!126636))))

(assert (=> b!182471 (= res!151660 (isPrefixOf!0 thiss!1204 (_2!8524 lt!280118)))))

(declare-fun b!182473 () Bool)

(declare-fun e!126635 () Bool)

(declare-fun lt!280117 () tuple2!15760)

(assert (=> b!182473 (= e!126635 (= (bitIndex!0 (size!4293 (buf!4742 (_1!8525 lt!280117))) (currentByte!8964 (_1!8525 lt!280117)) (currentBit!8959 (_1!8525 lt!280117))) (bitIndex!0 (size!4293 (buf!4742 (_2!8524 lt!280118))) (currentByte!8964 (_2!8524 lt!280118)) (currentBit!8959 (_2!8524 lt!280118)))))))

(declare-fun b!182472 () Bool)

(assert (=> b!182472 (= e!126636 e!126635)))

(declare-fun res!151657 () Bool)

(assert (=> b!182472 (=> (not res!151657) (not e!126635))))

(assert (=> b!182472 (= res!151657 (and (= (_2!8525 lt!280117) lt!279873) (= (_1!8525 lt!280117) (_2!8524 lt!280118))))))

(assert (=> b!182472 (= lt!280117 (readBitPure!0 (readerFrom!0 (_2!8524 lt!280118) (currentBit!8959 thiss!1204) (currentByte!8964 thiss!1204))))))

(declare-fun b!182470 () Bool)

(declare-fun res!151659 () Bool)

(assert (=> b!182470 (=> (not res!151659) (not e!126636))))

(declare-fun lt!280116 () (_ BitVec 64))

(declare-fun lt!280115 () (_ BitVec 64))

(assert (=> b!182470 (= res!151659 (= (bitIndex!0 (size!4293 (buf!4742 (_2!8524 lt!280118))) (currentByte!8964 (_2!8524 lt!280118)) (currentBit!8959 (_2!8524 lt!280118))) (bvadd lt!280116 lt!280115)))))

(assert (=> b!182470 (or (not (= (bvand lt!280116 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!280115 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!280116 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!280116 lt!280115) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!182470 (= lt!280115 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!182470 (= lt!280116 (bitIndex!0 (size!4293 (buf!4742 thiss!1204)) (currentByte!8964 thiss!1204) (currentBit!8959 thiss!1204)))))

(assert (= (and d!63303 res!151658) b!182470))

(assert (= (and b!182470 res!151659) b!182471))

(assert (= (and b!182471 res!151660) b!182472))

(assert (= (and b!182472 res!151657) b!182473))

(declare-fun m!283789 () Bool)

(assert (=> b!182472 m!283789))

(assert (=> b!182472 m!283789))

(declare-fun m!283791 () Bool)

(assert (=> b!182472 m!283791))

(declare-fun m!283793 () Bool)

(assert (=> d!63303 m!283793))

(declare-fun m!283795 () Bool)

(assert (=> d!63303 m!283795))

(declare-fun m!283797 () Bool)

(assert (=> b!182471 m!283797))

(declare-fun m!283799 () Bool)

(assert (=> b!182470 m!283799))

(assert (=> b!182470 m!283625))

(declare-fun m!283801 () Bool)

(assert (=> b!182473 m!283801))

(assert (=> b!182473 m!283799))

(assert (=> b!182346 d!63303))

(declare-fun d!63305 () Bool)

(assert (=> d!63305 (= (invariant!0 (currentBit!8959 (_2!8524 lt!279863)) (currentByte!8964 (_2!8524 lt!279863)) (size!4293 (buf!4742 (_2!8524 lt!279863)))) (and (bvsge (currentBit!8959 (_2!8524 lt!279863)) #b00000000000000000000000000000000) (bvslt (currentBit!8959 (_2!8524 lt!279863)) #b00000000000000000000000000001000) (bvsge (currentByte!8964 (_2!8524 lt!279863)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8964 (_2!8524 lt!279863)) (size!4293 (buf!4742 (_2!8524 lt!279863)))) (and (= (currentBit!8959 (_2!8524 lt!279863)) #b00000000000000000000000000000000) (= (currentByte!8964 (_2!8524 lt!279863)) (size!4293 (buf!4742 (_2!8524 lt!279863))))))))))

(assert (=> b!182336 d!63305))

(declare-fun d!63307 () Bool)

(declare-fun res!151663 () Bool)

(declare-fun e!126638 () Bool)

(assert (=> d!63307 (=> (not res!151663) (not e!126638))))

(assert (=> d!63307 (= res!151663 (= (size!4293 (buf!4742 (_2!8524 lt!279858))) (size!4293 (buf!4742 (_2!8524 lt!279863)))))))

(assert (=> d!63307 (= (isPrefixOf!0 (_2!8524 lt!279858) (_2!8524 lt!279863)) e!126638)))

(declare-fun b!182474 () Bool)

(declare-fun res!151662 () Bool)

(assert (=> b!182474 (=> (not res!151662) (not e!126638))))

(assert (=> b!182474 (= res!151662 (bvsle (bitIndex!0 (size!4293 (buf!4742 (_2!8524 lt!279858))) (currentByte!8964 (_2!8524 lt!279858)) (currentBit!8959 (_2!8524 lt!279858))) (bitIndex!0 (size!4293 (buf!4742 (_2!8524 lt!279863))) (currentByte!8964 (_2!8524 lt!279863)) (currentBit!8959 (_2!8524 lt!279863)))))))

(declare-fun b!182475 () Bool)

(declare-fun e!126637 () Bool)

(assert (=> b!182475 (= e!126638 e!126637)))

(declare-fun res!151661 () Bool)

(assert (=> b!182475 (=> res!151661 e!126637)))

(assert (=> b!182475 (= res!151661 (= (size!4293 (buf!4742 (_2!8524 lt!279858))) #b00000000000000000000000000000000))))

(declare-fun b!182476 () Bool)

(assert (=> b!182476 (= e!126637 (arrayBitRangesEq!0 (buf!4742 (_2!8524 lt!279858)) (buf!4742 (_2!8524 lt!279863)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4293 (buf!4742 (_2!8524 lt!279858))) (currentByte!8964 (_2!8524 lt!279858)) (currentBit!8959 (_2!8524 lt!279858)))))))

(assert (= (and d!63307 res!151663) b!182474))

(assert (= (and b!182474 res!151662) b!182475))

(assert (= (and b!182475 (not res!151661)) b!182476))

(assert (=> b!182474 m!283623))

(assert (=> b!182474 m!283609))

(assert (=> b!182476 m!283623))

(assert (=> b!182476 m!283623))

(declare-fun m!283803 () Bool)

(assert (=> b!182476 m!283803))

(assert (=> b!182339 d!63307))

(assert (=> b!182340 d!63295))

(declare-fun d!63309 () Bool)

(declare-fun e!126639 () Bool)

(assert (=> d!63309 e!126639))

(declare-fun res!151665 () Bool)

(assert (=> d!63309 (=> (not res!151665) (not e!126639))))

(declare-fun lt!280122 () (_ BitVec 64))

(declare-fun lt!280123 () (_ BitVec 64))

(declare-fun lt!280119 () (_ BitVec 64))

(assert (=> d!63309 (= res!151665 (= lt!280122 (bvsub lt!280119 lt!280123)))))

(assert (=> d!63309 (or (= (bvand lt!280119 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!280123 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!280119 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!280119 lt!280123) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63309 (= lt!280123 (remainingBits!0 ((_ sign_extend 32) (size!4293 (buf!4742 (_1!8525 lt!279864)))) ((_ sign_extend 32) (currentByte!8964 (_1!8525 lt!279864))) ((_ sign_extend 32) (currentBit!8959 (_1!8525 lt!279864)))))))

(declare-fun lt!280120 () (_ BitVec 64))

(declare-fun lt!280121 () (_ BitVec 64))

(assert (=> d!63309 (= lt!280119 (bvmul lt!280120 lt!280121))))

(assert (=> d!63309 (or (= lt!280120 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!280121 (bvsdiv (bvmul lt!280120 lt!280121) lt!280120)))))

(assert (=> d!63309 (= lt!280121 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63309 (= lt!280120 ((_ sign_extend 32) (size!4293 (buf!4742 (_1!8525 lt!279864)))))))

(assert (=> d!63309 (= lt!280122 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8964 (_1!8525 lt!279864))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8959 (_1!8525 lt!279864)))))))

(assert (=> d!63309 (invariant!0 (currentBit!8959 (_1!8525 lt!279864)) (currentByte!8964 (_1!8525 lt!279864)) (size!4293 (buf!4742 (_1!8525 lt!279864))))))

(assert (=> d!63309 (= (bitIndex!0 (size!4293 (buf!4742 (_1!8525 lt!279864))) (currentByte!8964 (_1!8525 lt!279864)) (currentBit!8959 (_1!8525 lt!279864))) lt!280122)))

(declare-fun b!182477 () Bool)

(declare-fun res!151664 () Bool)

(assert (=> b!182477 (=> (not res!151664) (not e!126639))))

(assert (=> b!182477 (= res!151664 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!280122))))

(declare-fun b!182478 () Bool)

(declare-fun lt!280124 () (_ BitVec 64))

(assert (=> b!182478 (= e!126639 (bvsle lt!280122 (bvmul lt!280124 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!182478 (or (= lt!280124 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!280124 #b0000000000000000000000000000000000000000000000000000000000001000) lt!280124)))))

(assert (=> b!182478 (= lt!280124 ((_ sign_extend 32) (size!4293 (buf!4742 (_1!8525 lt!279864)))))))

(assert (= (and d!63309 res!151665) b!182477))

(assert (= (and b!182477 res!151664) b!182478))

(declare-fun m!283805 () Bool)

(assert (=> d!63309 m!283805))

(declare-fun m!283807 () Bool)

(assert (=> d!63309 m!283807))

(assert (=> b!182338 d!63309))

(declare-fun d!63311 () Bool)

(declare-fun e!126640 () Bool)

(assert (=> d!63311 e!126640))

(declare-fun res!151667 () Bool)

(assert (=> d!63311 (=> (not res!151667) (not e!126640))))

(declare-fun lt!280129 () (_ BitVec 64))

(declare-fun lt!280125 () (_ BitVec 64))

(declare-fun lt!280128 () (_ BitVec 64))

(assert (=> d!63311 (= res!151667 (= lt!280128 (bvsub lt!280125 lt!280129)))))

(assert (=> d!63311 (or (= (bvand lt!280125 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!280129 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!280125 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!280125 lt!280129) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63311 (= lt!280129 (remainingBits!0 ((_ sign_extend 32) (size!4293 (buf!4742 (_2!8524 lt!279863)))) ((_ sign_extend 32) (currentByte!8964 (_2!8524 lt!279863))) ((_ sign_extend 32) (currentBit!8959 (_2!8524 lt!279863)))))))

(declare-fun lt!280126 () (_ BitVec 64))

(declare-fun lt!280127 () (_ BitVec 64))

(assert (=> d!63311 (= lt!280125 (bvmul lt!280126 lt!280127))))

(assert (=> d!63311 (or (= lt!280126 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!280127 (bvsdiv (bvmul lt!280126 lt!280127) lt!280126)))))

(assert (=> d!63311 (= lt!280127 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63311 (= lt!280126 ((_ sign_extend 32) (size!4293 (buf!4742 (_2!8524 lt!279863)))))))

(assert (=> d!63311 (= lt!280128 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8964 (_2!8524 lt!279863))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8959 (_2!8524 lt!279863)))))))

(assert (=> d!63311 (invariant!0 (currentBit!8959 (_2!8524 lt!279863)) (currentByte!8964 (_2!8524 lt!279863)) (size!4293 (buf!4742 (_2!8524 lt!279863))))))

(assert (=> d!63311 (= (bitIndex!0 (size!4293 (buf!4742 (_2!8524 lt!279863))) (currentByte!8964 (_2!8524 lt!279863)) (currentBit!8959 (_2!8524 lt!279863))) lt!280128)))

(declare-fun b!182479 () Bool)

(declare-fun res!151666 () Bool)

(assert (=> b!182479 (=> (not res!151666) (not e!126640))))

(assert (=> b!182479 (= res!151666 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!280128))))

(declare-fun b!182480 () Bool)

(declare-fun lt!280130 () (_ BitVec 64))

(assert (=> b!182480 (= e!126640 (bvsle lt!280128 (bvmul lt!280130 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!182480 (or (= lt!280130 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!280130 #b0000000000000000000000000000000000000000000000000000000000001000) lt!280130)))))

(assert (=> b!182480 (= lt!280130 ((_ sign_extend 32) (size!4293 (buf!4742 (_2!8524 lt!279863)))))))

(assert (= (and d!63311 res!151667) b!182479))

(assert (= (and b!182479 res!151666) b!182480))

(declare-fun m!283809 () Bool)

(assert (=> d!63311 m!283809))

(assert (=> d!63311 m!283627))

(assert (=> b!182349 d!63311))

(declare-fun d!63313 () Bool)

(declare-fun res!151670 () Bool)

(declare-fun e!126642 () Bool)

(assert (=> d!63313 (=> (not res!151670) (not e!126642))))

(assert (=> d!63313 (= res!151670 (= (size!4293 (buf!4742 thiss!1204)) (size!4293 (buf!4742 (_2!8524 lt!279863)))))))

(assert (=> d!63313 (= (isPrefixOf!0 thiss!1204 (_2!8524 lt!279863)) e!126642)))

(declare-fun b!182481 () Bool)

(declare-fun res!151669 () Bool)

(assert (=> b!182481 (=> (not res!151669) (not e!126642))))

(assert (=> b!182481 (= res!151669 (bvsle (bitIndex!0 (size!4293 (buf!4742 thiss!1204)) (currentByte!8964 thiss!1204) (currentBit!8959 thiss!1204)) (bitIndex!0 (size!4293 (buf!4742 (_2!8524 lt!279863))) (currentByte!8964 (_2!8524 lt!279863)) (currentBit!8959 (_2!8524 lt!279863)))))))

(declare-fun b!182482 () Bool)

(declare-fun e!126641 () Bool)

(assert (=> b!182482 (= e!126642 e!126641)))

(declare-fun res!151668 () Bool)

(assert (=> b!182482 (=> res!151668 e!126641)))

(assert (=> b!182482 (= res!151668 (= (size!4293 (buf!4742 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!182483 () Bool)

(assert (=> b!182483 (= e!126641 (arrayBitRangesEq!0 (buf!4742 thiss!1204) (buf!4742 (_2!8524 lt!279863)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4293 (buf!4742 thiss!1204)) (currentByte!8964 thiss!1204) (currentBit!8959 thiss!1204))))))

(assert (= (and d!63313 res!151670) b!182481))

(assert (= (and b!182481 res!151669) b!182482))

(assert (= (and b!182482 (not res!151668)) b!182483))

(assert (=> b!182481 m!283625))

(assert (=> b!182481 m!283609))

(assert (=> b!182483 m!283625))

(assert (=> b!182483 m!283625))

(declare-fun m!283811 () Bool)

(assert (=> b!182483 m!283811))

(assert (=> b!182349 d!63313))

(declare-fun d!63315 () Bool)

(assert (=> d!63315 (isPrefixOf!0 thiss!1204 (_2!8524 lt!279863))))

(declare-fun lt!280133 () Unit!13083)

(declare-fun choose!30 (BitStream!7694 BitStream!7694 BitStream!7694) Unit!13083)

(assert (=> d!63315 (= lt!280133 (choose!30 thiss!1204 (_2!8524 lt!279858) (_2!8524 lt!279863)))))

(assert (=> d!63315 (isPrefixOf!0 thiss!1204 (_2!8524 lt!279858))))

(assert (=> d!63315 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8524 lt!279858) (_2!8524 lt!279863)) lt!280133)))

(declare-fun bs!15765 () Bool)

(assert (= bs!15765 d!63315))

(assert (=> bs!15765 m!283611))

(declare-fun m!283813 () Bool)

(assert (=> bs!15765 m!283813))

(assert (=> bs!15765 m!283597))

(assert (=> b!182349 d!63315))

(declare-fun b!182658 () Bool)

(declare-fun e!126739 () (_ BitVec 64))

(assert (=> b!182658 (= e!126739 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!182659 () Bool)

(assert (=> b!182659 (= e!126739 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!182660 () Bool)

(declare-fun e!126742 () Bool)

(declare-fun lt!280738 () tuple2!15760)

(declare-fun lt!280713 () tuple2!15760)

(assert (=> b!182660 (= e!126742 (= (_2!8525 lt!280738) (_2!8525 lt!280713)))))

(declare-fun b!182661 () Bool)

(declare-fun e!126744 () tuple2!15758)

(declare-fun lt!280732 () tuple2!15758)

(assert (=> b!182661 (= e!126744 (tuple2!15759 (_1!8524 lt!280732) (_2!8524 lt!280732)))))

(declare-fun lt!280763 () Bool)

(assert (=> b!182661 (= lt!280763 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!280758 () tuple2!15758)

(assert (=> b!182661 (= lt!280758 (appendBit!0 (_2!8524 lt!279858) lt!280763))))

(declare-fun res!151812 () Bool)

(assert (=> b!182661 (= res!151812 (= (size!4293 (buf!4742 (_2!8524 lt!279858))) (size!4293 (buf!4742 (_2!8524 lt!280758)))))))

(declare-fun e!126741 () Bool)

(assert (=> b!182661 (=> (not res!151812) (not e!126741))))

(assert (=> b!182661 e!126741))

(declare-fun lt!280720 () tuple2!15758)

(assert (=> b!182661 (= lt!280720 lt!280758)))

(assert (=> b!182661 (= lt!280732 (appendBitsLSBFirstLoopTR!0 (_2!8524 lt!280720) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!280733 () Unit!13083)

(assert (=> b!182661 (= lt!280733 (lemmaIsPrefixTransitive!0 (_2!8524 lt!279858) (_2!8524 lt!280720) (_2!8524 lt!280732)))))

(declare-fun call!2963 () Bool)

(assert (=> b!182661 call!2963))

(declare-fun lt!280749 () Unit!13083)

(assert (=> b!182661 (= lt!280749 lt!280733)))

(assert (=> b!182661 (invariant!0 (currentBit!8959 (_2!8524 lt!279858)) (currentByte!8964 (_2!8524 lt!279858)) (size!4293 (buf!4742 (_2!8524 lt!280720))))))

(declare-fun lt!280735 () BitStream!7694)

(assert (=> b!182661 (= lt!280735 (BitStream!7695 (buf!4742 (_2!8524 lt!280720)) (currentByte!8964 (_2!8524 lt!279858)) (currentBit!8959 (_2!8524 lt!279858))))))

(assert (=> b!182661 (invariant!0 (currentBit!8959 lt!280735) (currentByte!8964 lt!280735) (size!4293 (buf!4742 (_2!8524 lt!280732))))))

(declare-fun lt!280753 () BitStream!7694)

(assert (=> b!182661 (= lt!280753 (BitStream!7695 (buf!4742 (_2!8524 lt!280732)) (currentByte!8964 lt!280735) (currentBit!8959 lt!280735)))))

(assert (=> b!182661 (= lt!280738 (readBitPure!0 lt!280735))))

(assert (=> b!182661 (= lt!280713 (readBitPure!0 lt!280753))))

(declare-fun lt!280760 () Unit!13083)

(assert (=> b!182661 (= lt!280760 (readBitPrefixLemma!0 lt!280735 (_2!8524 lt!280732)))))

(declare-fun res!151806 () Bool)

(assert (=> b!182661 (= res!151806 (= (bitIndex!0 (size!4293 (buf!4742 (_1!8525 lt!280738))) (currentByte!8964 (_1!8525 lt!280738)) (currentBit!8959 (_1!8525 lt!280738))) (bitIndex!0 (size!4293 (buf!4742 (_1!8525 lt!280713))) (currentByte!8964 (_1!8525 lt!280713)) (currentBit!8959 (_1!8525 lt!280713)))))))

(assert (=> b!182661 (=> (not res!151806) (not e!126742))))

(assert (=> b!182661 e!126742))

(declare-fun lt!280748 () Unit!13083)

(assert (=> b!182661 (= lt!280748 lt!280760)))

(declare-fun lt!280743 () tuple2!15756)

(assert (=> b!182661 (= lt!280743 (reader!0 (_2!8524 lt!279858) (_2!8524 lt!280732)))))

(declare-fun lt!280761 () tuple2!15756)

(assert (=> b!182661 (= lt!280761 (reader!0 (_2!8524 lt!280720) (_2!8524 lt!280732)))))

(declare-fun lt!280751 () tuple2!15760)

(assert (=> b!182661 (= lt!280751 (readBitPure!0 (_1!8523 lt!280743)))))

(assert (=> b!182661 (= (_2!8525 lt!280751) lt!280763)))

(declare-fun lt!280756 () Unit!13083)

(declare-fun Unit!13111 () Unit!13083)

(assert (=> b!182661 (= lt!280756 Unit!13111)))

(declare-fun lt!280719 () (_ BitVec 64))

(assert (=> b!182661 (= lt!280719 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!280757 () (_ BitVec 64))

(assert (=> b!182661 (= lt!280757 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!280723 () Unit!13083)

(assert (=> b!182661 (= lt!280723 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8524 lt!279858) (buf!4742 (_2!8524 lt!280732)) lt!280757))))

(assert (=> b!182661 (validate_offset_bits!1 ((_ sign_extend 32) (size!4293 (buf!4742 (_2!8524 lt!280732)))) ((_ sign_extend 32) (currentByte!8964 (_2!8524 lt!279858))) ((_ sign_extend 32) (currentBit!8959 (_2!8524 lt!279858))) lt!280757)))

(declare-fun lt!280754 () Unit!13083)

(assert (=> b!182661 (= lt!280754 lt!280723)))

(declare-fun lt!280721 () tuple2!15762)

(assert (=> b!182661 (= lt!280721 (readNBitsLSBFirstsLoopPure!0 (_1!8523 lt!280743) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!280719))))

(declare-fun lt!280724 () (_ BitVec 64))

(assert (=> b!182661 (= lt!280724 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!280730 () Unit!13083)

(assert (=> b!182661 (= lt!280730 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8524 lt!280720) (buf!4742 (_2!8524 lt!280732)) lt!280724))))

(assert (=> b!182661 (validate_offset_bits!1 ((_ sign_extend 32) (size!4293 (buf!4742 (_2!8524 lt!280732)))) ((_ sign_extend 32) (currentByte!8964 (_2!8524 lt!280720))) ((_ sign_extend 32) (currentBit!8959 (_2!8524 lt!280720))) lt!280724)))

(declare-fun lt!280728 () Unit!13083)

(assert (=> b!182661 (= lt!280728 lt!280730)))

(declare-fun lt!280727 () tuple2!15762)

(assert (=> b!182661 (= lt!280727 (readNBitsLSBFirstsLoopPure!0 (_1!8523 lt!280761) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!280719 (ite (_2!8525 lt!280751) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!280734 () tuple2!15762)

(assert (=> b!182661 (= lt!280734 (readNBitsLSBFirstsLoopPure!0 (_1!8523 lt!280743) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!280719))))

(declare-fun c!9392 () Bool)

(assert (=> b!182661 (= c!9392 (_2!8525 (readBitPure!0 (_1!8523 lt!280743))))))

(declare-fun lt!280718 () tuple2!15762)

(declare-fun withMovedBitIndex!0 (BitStream!7694 (_ BitVec 64)) BitStream!7694)

(assert (=> b!182661 (= lt!280718 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8523 lt!280743) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!280719 e!126739)))))

(declare-fun lt!280736 () Unit!13083)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7694 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13083)

(assert (=> b!182661 (= lt!280736 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8523 lt!280743) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!280719))))

(assert (=> b!182661 (and (= (_2!8526 lt!280734) (_2!8526 lt!280718)) (= (_1!8526 lt!280734) (_1!8526 lt!280718)))))

(declare-fun lt!280711 () Unit!13083)

(assert (=> b!182661 (= lt!280711 lt!280736)))

(assert (=> b!182661 (= (_1!8523 lt!280743) (withMovedBitIndex!0 (_2!8523 lt!280743) (bvsub (bitIndex!0 (size!4293 (buf!4742 (_2!8524 lt!279858))) (currentByte!8964 (_2!8524 lt!279858)) (currentBit!8959 (_2!8524 lt!279858))) (bitIndex!0 (size!4293 (buf!4742 (_2!8524 lt!280732))) (currentByte!8964 (_2!8524 lt!280732)) (currentBit!8959 (_2!8524 lt!280732))))))))

(declare-fun lt!280752 () Unit!13083)

(declare-fun Unit!13112 () Unit!13083)

(assert (=> b!182661 (= lt!280752 Unit!13112)))

(assert (=> b!182661 (= (_1!8523 lt!280761) (withMovedBitIndex!0 (_2!8523 lt!280761) (bvsub (bitIndex!0 (size!4293 (buf!4742 (_2!8524 lt!280720))) (currentByte!8964 (_2!8524 lt!280720)) (currentBit!8959 (_2!8524 lt!280720))) (bitIndex!0 (size!4293 (buf!4742 (_2!8524 lt!280732))) (currentByte!8964 (_2!8524 lt!280732)) (currentBit!8959 (_2!8524 lt!280732))))))))

(declare-fun lt!280750 () Unit!13083)

(declare-fun Unit!13113 () Unit!13083)

(assert (=> b!182661 (= lt!280750 Unit!13113)))

(assert (=> b!182661 (= (bitIndex!0 (size!4293 (buf!4742 (_2!8524 lt!279858))) (currentByte!8964 (_2!8524 lt!279858)) (currentBit!8959 (_2!8524 lt!279858))) (bvsub (bitIndex!0 (size!4293 (buf!4742 (_2!8524 lt!280720))) (currentByte!8964 (_2!8524 lt!280720)) (currentBit!8959 (_2!8524 lt!280720))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!280715 () Unit!13083)

(declare-fun Unit!13114 () Unit!13083)

(assert (=> b!182661 (= lt!280715 Unit!13114)))

(assert (=> b!182661 (= (_2!8526 lt!280721) (_2!8526 lt!280727))))

(declare-fun lt!280726 () Unit!13083)

(declare-fun Unit!13115 () Unit!13083)

(assert (=> b!182661 (= lt!280726 Unit!13115)))

(assert (=> b!182661 (invariant!0 (currentBit!8959 (_2!8524 lt!280732)) (currentByte!8964 (_2!8524 lt!280732)) (size!4293 (buf!4742 (_2!8524 lt!280732))))))

(declare-fun lt!280725 () Unit!13083)

(declare-fun Unit!13116 () Unit!13083)

(assert (=> b!182661 (= lt!280725 Unit!13116)))

(assert (=> b!182661 (= (size!4293 (buf!4742 (_2!8524 lt!279858))) (size!4293 (buf!4742 (_2!8524 lt!280732))))))

(declare-fun lt!280755 () Unit!13083)

(declare-fun Unit!13117 () Unit!13083)

(assert (=> b!182661 (= lt!280755 Unit!13117)))

(assert (=> b!182661 (= (bitIndex!0 (size!4293 (buf!4742 (_2!8524 lt!280732))) (currentByte!8964 (_2!8524 lt!280732)) (currentBit!8959 (_2!8524 lt!280732))) (bvsub (bvadd (bitIndex!0 (size!4293 (buf!4742 (_2!8524 lt!279858))) (currentByte!8964 (_2!8524 lt!279858)) (currentBit!8959 (_2!8524 lt!279858))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!280712 () Unit!13083)

(declare-fun Unit!13118 () Unit!13083)

(assert (=> b!182661 (= lt!280712 Unit!13118)))

(declare-fun lt!280745 () Unit!13083)

(declare-fun Unit!13119 () Unit!13083)

(assert (=> b!182661 (= lt!280745 Unit!13119)))

(declare-fun lt!280746 () tuple2!15756)

(assert (=> b!182661 (= lt!280746 (reader!0 (_2!8524 lt!279858) (_2!8524 lt!280732)))))

(declare-fun lt!280729 () (_ BitVec 64))

(assert (=> b!182661 (= lt!280729 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!280717 () Unit!13083)

(assert (=> b!182661 (= lt!280717 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8524 lt!279858) (buf!4742 (_2!8524 lt!280732)) lt!280729))))

(assert (=> b!182661 (validate_offset_bits!1 ((_ sign_extend 32) (size!4293 (buf!4742 (_2!8524 lt!280732)))) ((_ sign_extend 32) (currentByte!8964 (_2!8524 lt!279858))) ((_ sign_extend 32) (currentBit!8959 (_2!8524 lt!279858))) lt!280729)))

(declare-fun lt!280764 () Unit!13083)

(assert (=> b!182661 (= lt!280764 lt!280717)))

(declare-fun lt!280731 () tuple2!15762)

(assert (=> b!182661 (= lt!280731 (readNBitsLSBFirstsLoopPure!0 (_1!8523 lt!280746) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!151805 () Bool)

(assert (=> b!182661 (= res!151805 (= (_2!8526 lt!280731) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!126740 () Bool)

(assert (=> b!182661 (=> (not res!151805) (not e!126740))))

(assert (=> b!182661 e!126740))

(declare-fun lt!280762 () Unit!13083)

(declare-fun Unit!13120 () Unit!13083)

(assert (=> b!182661 (= lt!280762 Unit!13120)))

(declare-fun b!182662 () Bool)

(declare-fun res!151808 () Bool)

(assert (=> b!182662 (= res!151808 (isPrefixOf!0 (_2!8524 lt!279858) (_2!8524 lt!280758)))))

(assert (=> b!182662 (=> (not res!151808) (not e!126741))))

(declare-fun d!63317 () Bool)

(declare-fun e!126747 () Bool)

(assert (=> d!63317 e!126747))

(declare-fun res!151810 () Bool)

(assert (=> d!63317 (=> (not res!151810) (not e!126747))))

(declare-fun lt!280714 () tuple2!15758)

(assert (=> d!63317 (= res!151810 (invariant!0 (currentBit!8959 (_2!8524 lt!280714)) (currentByte!8964 (_2!8524 lt!280714)) (size!4293 (buf!4742 (_2!8524 lt!280714)))))))

(assert (=> d!63317 (= lt!280714 e!126744)))

(declare-fun c!9391 () Bool)

(assert (=> d!63317 (= c!9391 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!63317 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!63317 (= (appendBitsLSBFirstLoopTR!0 (_2!8524 lt!279858) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!280714)))

(declare-fun b!182663 () Bool)

(assert (=> b!182663 (= e!126740 (= (_1!8526 lt!280731) (_2!8523 lt!280746)))))

(declare-fun bm!2960 () Bool)

(assert (=> bm!2960 (= call!2963 (isPrefixOf!0 (_2!8524 lt!279858) (ite c!9391 (_2!8524 lt!279858) (_2!8524 lt!280732))))))

(declare-fun b!182664 () Bool)

(declare-fun res!151809 () Bool)

(assert (=> b!182664 (=> (not res!151809) (not e!126747))))

(assert (=> b!182664 (= res!151809 (= (size!4293 (buf!4742 (_2!8524 lt!279858))) (size!4293 (buf!4742 (_2!8524 lt!280714)))))))

(declare-fun b!182665 () Bool)

(declare-fun res!151813 () Bool)

(assert (=> b!182665 (= res!151813 (= (bitIndex!0 (size!4293 (buf!4742 (_2!8524 lt!280758))) (currentByte!8964 (_2!8524 lt!280758)) (currentBit!8959 (_2!8524 lt!280758))) (bvadd (bitIndex!0 (size!4293 (buf!4742 (_2!8524 lt!279858))) (currentByte!8964 (_2!8524 lt!279858)) (currentBit!8959 (_2!8524 lt!279858))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!182665 (=> (not res!151813) (not e!126741))))

(declare-fun b!182666 () Bool)

(declare-fun Unit!13121 () Unit!13083)

(assert (=> b!182666 (= e!126744 (tuple2!15759 Unit!13121 (_2!8524 lt!279858)))))

(declare-fun lt!280747 () Unit!13083)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7694) Unit!13083)

(assert (=> b!182666 (= lt!280747 (lemmaIsPrefixRefl!0 (_2!8524 lt!279858)))))

(assert (=> b!182666 call!2963))

(declare-fun lt!280759 () Unit!13083)

(assert (=> b!182666 (= lt!280759 lt!280747)))

(declare-fun b!182667 () Bool)

(declare-fun e!126745 () Bool)

(declare-fun lt!280716 () tuple2!15762)

(declare-fun lt!280742 () tuple2!15756)

(assert (=> b!182667 (= e!126745 (= (_1!8526 lt!280716) (_2!8523 lt!280742)))))

(declare-fun b!182668 () Bool)

(assert (=> b!182668 (= e!126747 e!126745)))

(declare-fun res!151815 () Bool)

(assert (=> b!182668 (=> (not res!151815) (not e!126745))))

(assert (=> b!182668 (= res!151815 (= (_2!8526 lt!280716) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!182668 (= lt!280716 (readNBitsLSBFirstsLoopPure!0 (_1!8523 lt!280742) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!280766 () Unit!13083)

(declare-fun lt!280741 () Unit!13083)

(assert (=> b!182668 (= lt!280766 lt!280741)))

(declare-fun lt!280740 () (_ BitVec 64))

(assert (=> b!182668 (validate_offset_bits!1 ((_ sign_extend 32) (size!4293 (buf!4742 (_2!8524 lt!280714)))) ((_ sign_extend 32) (currentByte!8964 (_2!8524 lt!279858))) ((_ sign_extend 32) (currentBit!8959 (_2!8524 lt!279858))) lt!280740)))

(assert (=> b!182668 (= lt!280741 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8524 lt!279858) (buf!4742 (_2!8524 lt!280714)) lt!280740))))

(declare-fun e!126743 () Bool)

(assert (=> b!182668 e!126743))

(declare-fun res!151807 () Bool)

(assert (=> b!182668 (=> (not res!151807) (not e!126743))))

(assert (=> b!182668 (= res!151807 (and (= (size!4293 (buf!4742 (_2!8524 lt!279858))) (size!4293 (buf!4742 (_2!8524 lt!280714)))) (bvsge lt!280740 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!182668 (= lt!280740 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!182668 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!182668 (= lt!280742 (reader!0 (_2!8524 lt!279858) (_2!8524 lt!280714)))))

(declare-fun b!182669 () Bool)

(declare-fun res!151816 () Bool)

(assert (=> b!182669 (=> (not res!151816) (not e!126747))))

(assert (=> b!182669 (= res!151816 (isPrefixOf!0 (_2!8524 lt!279858) (_2!8524 lt!280714)))))

(declare-fun b!182670 () Bool)

(declare-fun lt!280765 () tuple2!15760)

(assert (=> b!182670 (= lt!280765 (readBitPure!0 (readerFrom!0 (_2!8524 lt!280758) (currentBit!8959 (_2!8524 lt!279858)) (currentByte!8964 (_2!8524 lt!279858)))))))

(declare-fun res!151814 () Bool)

(assert (=> b!182670 (= res!151814 (and (= (_2!8525 lt!280765) lt!280763) (= (_1!8525 lt!280765) (_2!8524 lt!280758))))))

(declare-fun e!126746 () Bool)

(assert (=> b!182670 (=> (not res!151814) (not e!126746))))

(assert (=> b!182670 (= e!126741 e!126746)))

(declare-fun b!182671 () Bool)

(declare-fun res!151811 () Bool)

(assert (=> b!182671 (=> (not res!151811) (not e!126747))))

(declare-fun lt!280737 () (_ BitVec 64))

(declare-fun lt!280722 () (_ BitVec 64))

(assert (=> b!182671 (= res!151811 (= (bitIndex!0 (size!4293 (buf!4742 (_2!8524 lt!280714))) (currentByte!8964 (_2!8524 lt!280714)) (currentBit!8959 (_2!8524 lt!280714))) (bvsub lt!280722 lt!280737)))))

(assert (=> b!182671 (or (= (bvand lt!280722 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!280737 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!280722 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!280722 lt!280737) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!182671 (= lt!280737 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!280739 () (_ BitVec 64))

(declare-fun lt!280744 () (_ BitVec 64))

(assert (=> b!182671 (= lt!280722 (bvadd lt!280739 lt!280744))))

(assert (=> b!182671 (or (not (= (bvand lt!280739 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!280744 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!280739 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!280739 lt!280744) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!182671 (= lt!280744 ((_ sign_extend 32) nBits!348))))

(assert (=> b!182671 (= lt!280739 (bitIndex!0 (size!4293 (buf!4742 (_2!8524 lt!279858))) (currentByte!8964 (_2!8524 lt!279858)) (currentBit!8959 (_2!8524 lt!279858))))))

(declare-fun b!182672 () Bool)

(assert (=> b!182672 (= e!126746 (= (bitIndex!0 (size!4293 (buf!4742 (_1!8525 lt!280765))) (currentByte!8964 (_1!8525 lt!280765)) (currentBit!8959 (_1!8525 lt!280765))) (bitIndex!0 (size!4293 (buf!4742 (_2!8524 lt!280758))) (currentByte!8964 (_2!8524 lt!280758)) (currentBit!8959 (_2!8524 lt!280758)))))))

(declare-fun b!182673 () Bool)

(assert (=> b!182673 (= e!126743 (validate_offset_bits!1 ((_ sign_extend 32) (size!4293 (buf!4742 (_2!8524 lt!279858)))) ((_ sign_extend 32) (currentByte!8964 (_2!8524 lt!279858))) ((_ sign_extend 32) (currentBit!8959 (_2!8524 lt!279858))) lt!280740))))

(assert (= (and d!63317 c!9391) b!182666))

(assert (= (and d!63317 (not c!9391)) b!182661))

(assert (= (and b!182661 res!151812) b!182665))

(assert (= (and b!182665 res!151813) b!182662))

(assert (= (and b!182662 res!151808) b!182670))

(assert (= (and b!182670 res!151814) b!182672))

(assert (= (and b!182661 res!151806) b!182660))

(assert (= (and b!182661 c!9392) b!182659))

(assert (= (and b!182661 (not c!9392)) b!182658))

(assert (= (and b!182661 res!151805) b!182663))

(assert (= (or b!182666 b!182661) bm!2960))

(assert (= (and d!63317 res!151810) b!182664))

(assert (= (and b!182664 res!151809) b!182671))

(assert (= (and b!182671 res!151811) b!182669))

(assert (= (and b!182669 res!151816) b!182668))

(assert (= (and b!182668 res!151807) b!182673))

(assert (= (and b!182668 res!151815) b!182667))

(declare-fun m!284107 () Bool)

(assert (=> b!182668 m!284107))

(declare-fun m!284109 () Bool)

(assert (=> b!182668 m!284109))

(declare-fun m!284111 () Bool)

(assert (=> b!182668 m!284111))

(declare-fun m!284113 () Bool)

(assert (=> b!182668 m!284113))

(declare-fun m!284115 () Bool)

(assert (=> b!182668 m!284115))

(declare-fun m!284117 () Bool)

(assert (=> b!182668 m!284117))

(declare-fun m!284119 () Bool)

(assert (=> bm!2960 m!284119))

(declare-fun m!284121 () Bool)

(assert (=> b!182670 m!284121))

(assert (=> b!182670 m!284121))

(declare-fun m!284123 () Bool)

(assert (=> b!182670 m!284123))

(declare-fun m!284125 () Bool)

(assert (=> b!182669 m!284125))

(declare-fun m!284127 () Bool)

(assert (=> b!182666 m!284127))

(declare-fun m!284129 () Bool)

(assert (=> d!63317 m!284129))

(declare-fun m!284131 () Bool)

(assert (=> b!182662 m!284131))

(declare-fun m!284133 () Bool)

(assert (=> b!182671 m!284133))

(assert (=> b!182671 m!283623))

(declare-fun m!284135 () Bool)

(assert (=> b!182665 m!284135))

(assert (=> b!182665 m!283623))

(declare-fun m!284137 () Bool)

(assert (=> b!182661 m!284137))

(declare-fun m!284139 () Bool)

(assert (=> b!182661 m!284139))

(declare-fun m!284141 () Bool)

(assert (=> b!182661 m!284141))

(declare-fun m!284143 () Bool)

(assert (=> b!182661 m!284143))

(declare-fun m!284145 () Bool)

(assert (=> b!182661 m!284145))

(declare-fun m!284147 () Bool)

(assert (=> b!182661 m!284147))

(declare-fun m!284149 () Bool)

(assert (=> b!182661 m!284149))

(declare-fun m!284151 () Bool)

(assert (=> b!182661 m!284151))

(declare-fun m!284153 () Bool)

(assert (=> b!182661 m!284153))

(declare-fun m!284155 () Bool)

(assert (=> b!182661 m!284155))

(declare-fun m!284157 () Bool)

(assert (=> b!182661 m!284157))

(declare-fun m!284159 () Bool)

(assert (=> b!182661 m!284159))

(declare-fun m!284161 () Bool)

(assert (=> b!182661 m!284161))

(declare-fun m!284163 () Bool)

(assert (=> b!182661 m!284163))

(assert (=> b!182661 m!284109))

(declare-fun m!284165 () Bool)

(assert (=> b!182661 m!284165))

(assert (=> b!182661 m!283623))

(declare-fun m!284167 () Bool)

(assert (=> b!182661 m!284167))

(declare-fun m!284169 () Bool)

(assert (=> b!182661 m!284169))

(declare-fun m!284171 () Bool)

(assert (=> b!182661 m!284171))

(declare-fun m!284173 () Bool)

(assert (=> b!182661 m!284173))

(declare-fun m!284175 () Bool)

(assert (=> b!182661 m!284175))

(assert (=> b!182661 m!284145))

(declare-fun m!284177 () Bool)

(assert (=> b!182661 m!284177))

(declare-fun m!284179 () Bool)

(assert (=> b!182661 m!284179))

(declare-fun m!284181 () Bool)

(assert (=> b!182661 m!284181))

(assert (=> b!182661 m!284117))

(declare-fun m!284183 () Bool)

(assert (=> b!182661 m!284183))

(declare-fun m!284185 () Bool)

(assert (=> b!182661 m!284185))

(declare-fun m!284187 () Bool)

(assert (=> b!182661 m!284187))

(declare-fun m!284189 () Bool)

(assert (=> b!182661 m!284189))

(declare-fun m!284191 () Bool)

(assert (=> b!182661 m!284191))

(declare-fun m!284193 () Bool)

(assert (=> b!182661 m!284193))

(declare-fun m!284195 () Bool)

(assert (=> b!182661 m!284195))

(declare-fun m!284197 () Bool)

(assert (=> b!182673 m!284197))

(declare-fun m!284199 () Bool)

(assert (=> b!182672 m!284199))

(assert (=> b!182672 m!284135))

(assert (=> b!182349 d!63317))

(declare-fun d!63367 () Bool)

(assert (=> d!63367 (= (array_inv!4034 (buf!4742 thiss!1204)) (bvsge (size!4293 (buf!4742 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!182332 d!63367))

(declare-fun d!63369 () Bool)

(assert (=> d!63369 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4293 (buf!4742 (_1!8523 lt!279867)))) ((_ sign_extend 32) (currentByte!8964 (_1!8523 lt!279867))) ((_ sign_extend 32) (currentBit!8959 (_1!8523 lt!279867))) ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4293 (buf!4742 (_1!8523 lt!279867)))) ((_ sign_extend 32) (currentByte!8964 (_1!8523 lt!279867))) ((_ sign_extend 32) (currentBit!8959 (_1!8523 lt!279867)))) ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun bs!15777 () Bool)

(assert (= bs!15777 d!63369))

(declare-fun m!284201 () Bool)

(assert (=> bs!15777 m!284201))

(assert (=> b!182334 d!63369))

(declare-fun d!63371 () Bool)

(declare-datatypes ((tuple2!15772 0))(
  ( (tuple2!15773 (_1!8531 Bool) (_2!8531 BitStream!7694)) )
))
(declare-fun lt!280769 () tuple2!15772)

(declare-fun readBit!0 (BitStream!7694) tuple2!15772)

(assert (=> d!63371 (= lt!280769 (readBit!0 (readerFrom!0 (_2!8524 lt!279858) (currentBit!8959 thiss!1204) (currentByte!8964 thiss!1204))))))

(assert (=> d!63371 (= (readBitPure!0 (readerFrom!0 (_2!8524 lt!279858) (currentBit!8959 thiss!1204) (currentByte!8964 thiss!1204))) (tuple2!15761 (_2!8531 lt!280769) (_1!8531 lt!280769)))))

(declare-fun bs!15778 () Bool)

(assert (= bs!15778 d!63371))

(assert (=> bs!15778 m!283605))

(declare-fun m!284203 () Bool)

(assert (=> bs!15778 m!284203))

(assert (=> b!182345 d!63371))

(declare-fun d!63373 () Bool)

(declare-fun e!126750 () Bool)

(assert (=> d!63373 e!126750))

(declare-fun res!151820 () Bool)

(assert (=> d!63373 (=> (not res!151820) (not e!126750))))

(assert (=> d!63373 (= res!151820 (invariant!0 (currentBit!8959 (_2!8524 lt!279858)) (currentByte!8964 (_2!8524 lt!279858)) (size!4293 (buf!4742 (_2!8524 lt!279858)))))))

(assert (=> d!63373 (= (readerFrom!0 (_2!8524 lt!279858) (currentBit!8959 thiss!1204) (currentByte!8964 thiss!1204)) (BitStream!7695 (buf!4742 (_2!8524 lt!279858)) (currentByte!8964 thiss!1204) (currentBit!8959 thiss!1204)))))

(declare-fun b!182676 () Bool)

(assert (=> b!182676 (= e!126750 (invariant!0 (currentBit!8959 thiss!1204) (currentByte!8964 thiss!1204) (size!4293 (buf!4742 (_2!8524 lt!279858)))))))

(assert (= (and d!63373 res!151820) b!182676))

(assert (=> d!63373 m!283783))

(assert (=> b!182676 m!283569))

(assert (=> b!182345 d!63373))

(declare-fun d!63375 () Bool)

(assert (=> d!63375 (= (invariant!0 (currentBit!8959 thiss!1204) (currentByte!8964 thiss!1204) (size!4293 (buf!4742 thiss!1204))) (and (bvsge (currentBit!8959 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8959 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8964 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8964 thiss!1204) (size!4293 (buf!4742 thiss!1204))) (and (= (currentBit!8959 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8964 thiss!1204) (size!4293 (buf!4742 thiss!1204)))))))))

(assert (=> b!182333 d!63375))

(declare-fun b!182687 () Bool)

(declare-fun e!126756 () Unit!13083)

(declare-fun lt!280829 () Unit!13083)

(assert (=> b!182687 (= e!126756 lt!280829)))

(declare-fun lt!280821 () (_ BitVec 64))

(assert (=> b!182687 (= lt!280821 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!280815 () (_ BitVec 64))

(assert (=> b!182687 (= lt!280815 (bitIndex!0 (size!4293 (buf!4742 thiss!1204)) (currentByte!8964 thiss!1204) (currentBit!8959 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9732 array!9732 (_ BitVec 64) (_ BitVec 64)) Unit!13083)

(assert (=> b!182687 (= lt!280829 (arrayBitRangesEqSymmetric!0 (buf!4742 thiss!1204) (buf!4742 (_2!8524 lt!279863)) lt!280821 lt!280815))))

(assert (=> b!182687 (arrayBitRangesEq!0 (buf!4742 (_2!8524 lt!279863)) (buf!4742 thiss!1204) lt!280821 lt!280815)))

(declare-fun lt!280824 () (_ BitVec 64))

(declare-fun lt!280814 () (_ BitVec 64))

(declare-fun lt!280817 () tuple2!15756)

(declare-fun b!182688 () Bool)

(declare-fun e!126755 () Bool)

(assert (=> b!182688 (= e!126755 (= (_1!8523 lt!280817) (withMovedBitIndex!0 (_2!8523 lt!280817) (bvsub lt!280814 lt!280824))))))

(assert (=> b!182688 (or (= (bvand lt!280814 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!280824 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!280814 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!280814 lt!280824) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!182688 (= lt!280824 (bitIndex!0 (size!4293 (buf!4742 (_2!8524 lt!279863))) (currentByte!8964 (_2!8524 lt!279863)) (currentBit!8959 (_2!8524 lt!279863))))))

(assert (=> b!182688 (= lt!280814 (bitIndex!0 (size!4293 (buf!4742 thiss!1204)) (currentByte!8964 thiss!1204) (currentBit!8959 thiss!1204)))))

(declare-fun b!182689 () Bool)

(declare-fun res!151827 () Bool)

(assert (=> b!182689 (=> (not res!151827) (not e!126755))))

(assert (=> b!182689 (= res!151827 (isPrefixOf!0 (_2!8523 lt!280817) (_2!8524 lt!279863)))))

(declare-fun b!182690 () Bool)

(declare-fun res!151829 () Bool)

(assert (=> b!182690 (=> (not res!151829) (not e!126755))))

(assert (=> b!182690 (= res!151829 (isPrefixOf!0 (_1!8523 lt!280817) thiss!1204))))

(declare-fun b!182691 () Bool)

(declare-fun Unit!13122 () Unit!13083)

(assert (=> b!182691 (= e!126756 Unit!13122)))

(declare-fun d!63377 () Bool)

(assert (=> d!63377 e!126755))

(declare-fun res!151828 () Bool)

(assert (=> d!63377 (=> (not res!151828) (not e!126755))))

(assert (=> d!63377 (= res!151828 (isPrefixOf!0 (_1!8523 lt!280817) (_2!8523 lt!280817)))))

(declare-fun lt!280827 () BitStream!7694)

(assert (=> d!63377 (= lt!280817 (tuple2!15757 lt!280827 (_2!8524 lt!279863)))))

(declare-fun lt!280810 () Unit!13083)

(declare-fun lt!280823 () Unit!13083)

(assert (=> d!63377 (= lt!280810 lt!280823)))

(assert (=> d!63377 (isPrefixOf!0 lt!280827 (_2!8524 lt!279863))))

(assert (=> d!63377 (= lt!280823 (lemmaIsPrefixTransitive!0 lt!280827 (_2!8524 lt!279863) (_2!8524 lt!279863)))))

(declare-fun lt!280812 () Unit!13083)

(declare-fun lt!280819 () Unit!13083)

(assert (=> d!63377 (= lt!280812 lt!280819)))

(assert (=> d!63377 (isPrefixOf!0 lt!280827 (_2!8524 lt!279863))))

(assert (=> d!63377 (= lt!280819 (lemmaIsPrefixTransitive!0 lt!280827 thiss!1204 (_2!8524 lt!279863)))))

(declare-fun lt!280818 () Unit!13083)

(assert (=> d!63377 (= lt!280818 e!126756)))

(declare-fun c!9395 () Bool)

(assert (=> d!63377 (= c!9395 (not (= (size!4293 (buf!4742 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!280820 () Unit!13083)

(declare-fun lt!280825 () Unit!13083)

(assert (=> d!63377 (= lt!280820 lt!280825)))

(assert (=> d!63377 (isPrefixOf!0 (_2!8524 lt!279863) (_2!8524 lt!279863))))

(assert (=> d!63377 (= lt!280825 (lemmaIsPrefixRefl!0 (_2!8524 lt!279863)))))

(declare-fun lt!280811 () Unit!13083)

(declare-fun lt!280822 () Unit!13083)

(assert (=> d!63377 (= lt!280811 lt!280822)))

(assert (=> d!63377 (= lt!280822 (lemmaIsPrefixRefl!0 (_2!8524 lt!279863)))))

(declare-fun lt!280828 () Unit!13083)

(declare-fun lt!280816 () Unit!13083)

(assert (=> d!63377 (= lt!280828 lt!280816)))

(assert (=> d!63377 (isPrefixOf!0 lt!280827 lt!280827)))

(assert (=> d!63377 (= lt!280816 (lemmaIsPrefixRefl!0 lt!280827))))

(declare-fun lt!280826 () Unit!13083)

(declare-fun lt!280813 () Unit!13083)

(assert (=> d!63377 (= lt!280826 lt!280813)))

(assert (=> d!63377 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!63377 (= lt!280813 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!63377 (= lt!280827 (BitStream!7695 (buf!4742 (_2!8524 lt!279863)) (currentByte!8964 thiss!1204) (currentBit!8959 thiss!1204)))))

(assert (=> d!63377 (isPrefixOf!0 thiss!1204 (_2!8524 lt!279863))))

(assert (=> d!63377 (= (reader!0 thiss!1204 (_2!8524 lt!279863)) lt!280817)))

(assert (= (and d!63377 c!9395) b!182687))

(assert (= (and d!63377 (not c!9395)) b!182691))

(assert (= (and d!63377 res!151828) b!182690))

(assert (= (and b!182690 res!151829) b!182689))

(assert (= (and b!182689 res!151827) b!182688))

(declare-fun m!284205 () Bool)

(assert (=> b!182688 m!284205))

(assert (=> b!182688 m!283609))

(assert (=> b!182688 m!283625))

(declare-fun m!284207 () Bool)

(assert (=> b!182689 m!284207))

(assert (=> b!182687 m!283625))

(declare-fun m!284209 () Bool)

(assert (=> b!182687 m!284209))

(declare-fun m!284211 () Bool)

(assert (=> b!182687 m!284211))

(declare-fun m!284213 () Bool)

(assert (=> d!63377 m!284213))

(declare-fun m!284215 () Bool)

(assert (=> d!63377 m!284215))

(declare-fun m!284217 () Bool)

(assert (=> d!63377 m!284217))

(declare-fun m!284219 () Bool)

(assert (=> d!63377 m!284219))

(declare-fun m!284221 () Bool)

(assert (=> d!63377 m!284221))

(assert (=> d!63377 m!283611))

(declare-fun m!284223 () Bool)

(assert (=> d!63377 m!284223))

(declare-fun m!284225 () Bool)

(assert (=> d!63377 m!284225))

(declare-fun m!284227 () Bool)

(assert (=> d!63377 m!284227))

(declare-fun m!284229 () Bool)

(assert (=> d!63377 m!284229))

(declare-fun m!284231 () Bool)

(assert (=> d!63377 m!284231))

(declare-fun m!284233 () Bool)

(assert (=> b!182690 m!284233))

(assert (=> b!182344 d!63377))

(declare-fun d!63379 () Bool)

(declare-fun lt!280830 () tuple2!15772)

(assert (=> d!63379 (= lt!280830 (readBit!0 (BitStream!7695 (buf!4742 (_2!8524 lt!279863)) (currentByte!8964 thiss!1204) (currentBit!8959 thiss!1204))))))

(assert (=> d!63379 (= (readBitPure!0 (BitStream!7695 (buf!4742 (_2!8524 lt!279863)) (currentByte!8964 thiss!1204) (currentBit!8959 thiss!1204))) (tuple2!15761 (_2!8531 lt!280830) (_1!8531 lt!280830)))))

(declare-fun bs!15779 () Bool)

(assert (= bs!15779 d!63379))

(declare-fun m!284235 () Bool)

(assert (=> bs!15779 m!284235))

(assert (=> b!182344 d!63379))

(declare-fun d!63381 () Bool)

(assert (=> d!63381 (validate_offset_bits!1 ((_ sign_extend 32) (size!4293 (buf!4742 (_2!8524 lt!279863)))) ((_ sign_extend 32) (currentByte!8964 thiss!1204)) ((_ sign_extend 32) (currentBit!8959 thiss!1204)) lt!279857)))

(declare-fun lt!280833 () Unit!13083)

(declare-fun choose!9 (BitStream!7694 array!9732 (_ BitVec 64) BitStream!7694) Unit!13083)

(assert (=> d!63381 (= lt!280833 (choose!9 thiss!1204 (buf!4742 (_2!8524 lt!279863)) lt!279857 (BitStream!7695 (buf!4742 (_2!8524 lt!279863)) (currentByte!8964 thiss!1204) (currentBit!8959 thiss!1204))))))

(assert (=> d!63381 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4742 (_2!8524 lt!279863)) lt!279857) lt!280833)))

(declare-fun bs!15780 () Bool)

(assert (= bs!15780 d!63381))

(assert (=> bs!15780 m!283591))

(declare-fun m!284237 () Bool)

(assert (=> bs!15780 m!284237))

(assert (=> b!182344 d!63381))

(declare-datatypes ((tuple2!15774 0))(
  ( (tuple2!15775 (_1!8532 (_ BitVec 64)) (_2!8532 BitStream!7694)) )
))
(declare-fun lt!280836 () tuple2!15774)

(declare-fun d!63383 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!7694 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15774)

(assert (=> d!63383 (= lt!280836 (readNBitsLSBFirstsLoop!0 (_1!8523 lt!279872) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(assert (=> d!63383 (= (readNBitsLSBFirstsLoopPure!0 (_1!8523 lt!279872) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))) (tuple2!15763 (_2!8532 lt!280836) (_1!8532 lt!280836)))))

(declare-fun bs!15781 () Bool)

(assert (= bs!15781 d!63383))

(declare-fun m!284239 () Bool)

(assert (=> bs!15781 m!284239))

(assert (=> b!182344 d!63383))

(declare-fun d!63385 () Bool)

(assert (=> d!63385 (= (invariant!0 (currentBit!8959 thiss!1204) (currentByte!8964 thiss!1204) (size!4293 (buf!4742 (_2!8524 lt!279858)))) (and (bvsge (currentBit!8959 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8959 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8964 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8964 thiss!1204) (size!4293 (buf!4742 (_2!8524 lt!279858)))) (and (= (currentBit!8959 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8964 thiss!1204) (size!4293 (buf!4742 (_2!8524 lt!279858))))))))))

(assert (=> b!182344 d!63385))

(declare-fun b!182692 () Bool)

(declare-fun e!126758 () Unit!13083)

(declare-fun lt!280856 () Unit!13083)

(assert (=> b!182692 (= e!126758 lt!280856)))

(declare-fun lt!280848 () (_ BitVec 64))

(assert (=> b!182692 (= lt!280848 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!280842 () (_ BitVec 64))

(assert (=> b!182692 (= lt!280842 (bitIndex!0 (size!4293 (buf!4742 (_2!8524 lt!279858))) (currentByte!8964 (_2!8524 lt!279858)) (currentBit!8959 (_2!8524 lt!279858))))))

(assert (=> b!182692 (= lt!280856 (arrayBitRangesEqSymmetric!0 (buf!4742 (_2!8524 lt!279858)) (buf!4742 (_2!8524 lt!279863)) lt!280848 lt!280842))))

(assert (=> b!182692 (arrayBitRangesEq!0 (buf!4742 (_2!8524 lt!279863)) (buf!4742 (_2!8524 lt!279858)) lt!280848 lt!280842)))

(declare-fun lt!280841 () (_ BitVec 64))

(declare-fun lt!280844 () tuple2!15756)

(declare-fun lt!280851 () (_ BitVec 64))

(declare-fun b!182693 () Bool)

(declare-fun e!126757 () Bool)

(assert (=> b!182693 (= e!126757 (= (_1!8523 lt!280844) (withMovedBitIndex!0 (_2!8523 lt!280844) (bvsub lt!280841 lt!280851))))))

(assert (=> b!182693 (or (= (bvand lt!280841 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!280851 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!280841 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!280841 lt!280851) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!182693 (= lt!280851 (bitIndex!0 (size!4293 (buf!4742 (_2!8524 lt!279863))) (currentByte!8964 (_2!8524 lt!279863)) (currentBit!8959 (_2!8524 lt!279863))))))

(assert (=> b!182693 (= lt!280841 (bitIndex!0 (size!4293 (buf!4742 (_2!8524 lt!279858))) (currentByte!8964 (_2!8524 lt!279858)) (currentBit!8959 (_2!8524 lt!279858))))))

(declare-fun b!182694 () Bool)

(declare-fun res!151830 () Bool)

(assert (=> b!182694 (=> (not res!151830) (not e!126757))))

(assert (=> b!182694 (= res!151830 (isPrefixOf!0 (_2!8523 lt!280844) (_2!8524 lt!279863)))))

(declare-fun b!182695 () Bool)

(declare-fun res!151832 () Bool)

(assert (=> b!182695 (=> (not res!151832) (not e!126757))))

(assert (=> b!182695 (= res!151832 (isPrefixOf!0 (_1!8523 lt!280844) (_2!8524 lt!279858)))))

(declare-fun b!182696 () Bool)

(declare-fun Unit!13123 () Unit!13083)

(assert (=> b!182696 (= e!126758 Unit!13123)))

(declare-fun d!63387 () Bool)

(assert (=> d!63387 e!126757))

(declare-fun res!151831 () Bool)

(assert (=> d!63387 (=> (not res!151831) (not e!126757))))

(assert (=> d!63387 (= res!151831 (isPrefixOf!0 (_1!8523 lt!280844) (_2!8523 lt!280844)))))

(declare-fun lt!280854 () BitStream!7694)

(assert (=> d!63387 (= lt!280844 (tuple2!15757 lt!280854 (_2!8524 lt!279863)))))

(declare-fun lt!280837 () Unit!13083)

(declare-fun lt!280850 () Unit!13083)

(assert (=> d!63387 (= lt!280837 lt!280850)))

(assert (=> d!63387 (isPrefixOf!0 lt!280854 (_2!8524 lt!279863))))

(assert (=> d!63387 (= lt!280850 (lemmaIsPrefixTransitive!0 lt!280854 (_2!8524 lt!279863) (_2!8524 lt!279863)))))

(declare-fun lt!280839 () Unit!13083)

(declare-fun lt!280846 () Unit!13083)

(assert (=> d!63387 (= lt!280839 lt!280846)))

(assert (=> d!63387 (isPrefixOf!0 lt!280854 (_2!8524 lt!279863))))

(assert (=> d!63387 (= lt!280846 (lemmaIsPrefixTransitive!0 lt!280854 (_2!8524 lt!279858) (_2!8524 lt!279863)))))

(declare-fun lt!280845 () Unit!13083)

(assert (=> d!63387 (= lt!280845 e!126758)))

(declare-fun c!9396 () Bool)

(assert (=> d!63387 (= c!9396 (not (= (size!4293 (buf!4742 (_2!8524 lt!279858))) #b00000000000000000000000000000000)))))

(declare-fun lt!280847 () Unit!13083)

(declare-fun lt!280852 () Unit!13083)

(assert (=> d!63387 (= lt!280847 lt!280852)))

(assert (=> d!63387 (isPrefixOf!0 (_2!8524 lt!279863) (_2!8524 lt!279863))))

(assert (=> d!63387 (= lt!280852 (lemmaIsPrefixRefl!0 (_2!8524 lt!279863)))))

(declare-fun lt!280838 () Unit!13083)

(declare-fun lt!280849 () Unit!13083)

(assert (=> d!63387 (= lt!280838 lt!280849)))

(assert (=> d!63387 (= lt!280849 (lemmaIsPrefixRefl!0 (_2!8524 lt!279863)))))

(declare-fun lt!280855 () Unit!13083)

(declare-fun lt!280843 () Unit!13083)

(assert (=> d!63387 (= lt!280855 lt!280843)))

(assert (=> d!63387 (isPrefixOf!0 lt!280854 lt!280854)))

(assert (=> d!63387 (= lt!280843 (lemmaIsPrefixRefl!0 lt!280854))))

(declare-fun lt!280853 () Unit!13083)

(declare-fun lt!280840 () Unit!13083)

(assert (=> d!63387 (= lt!280853 lt!280840)))

(assert (=> d!63387 (isPrefixOf!0 (_2!8524 lt!279858) (_2!8524 lt!279858))))

(assert (=> d!63387 (= lt!280840 (lemmaIsPrefixRefl!0 (_2!8524 lt!279858)))))

(assert (=> d!63387 (= lt!280854 (BitStream!7695 (buf!4742 (_2!8524 lt!279863)) (currentByte!8964 (_2!8524 lt!279858)) (currentBit!8959 (_2!8524 lt!279858))))))

(assert (=> d!63387 (isPrefixOf!0 (_2!8524 lt!279858) (_2!8524 lt!279863))))

(assert (=> d!63387 (= (reader!0 (_2!8524 lt!279858) (_2!8524 lt!279863)) lt!280844)))

(assert (= (and d!63387 c!9396) b!182692))

(assert (= (and d!63387 (not c!9396)) b!182696))

(assert (= (and d!63387 res!151831) b!182695))

(assert (= (and b!182695 res!151832) b!182694))

(assert (= (and b!182694 res!151830) b!182693))

(declare-fun m!284241 () Bool)

(assert (=> b!182693 m!284241))

(assert (=> b!182693 m!283609))

(assert (=> b!182693 m!283623))

(declare-fun m!284243 () Bool)

(assert (=> b!182694 m!284243))

(assert (=> b!182692 m!283623))

(declare-fun m!284245 () Bool)

(assert (=> b!182692 m!284245))

(declare-fun m!284247 () Bool)

(assert (=> b!182692 m!284247))

(declare-fun m!284249 () Bool)

(assert (=> d!63387 m!284249))

(declare-fun m!284251 () Bool)

(assert (=> d!63387 m!284251))

(declare-fun m!284253 () Bool)

(assert (=> d!63387 m!284253))

(declare-fun m!284255 () Bool)

(assert (=> d!63387 m!284255))

(declare-fun m!284257 () Bool)

(assert (=> d!63387 m!284257))

(assert (=> d!63387 m!283599))

(assert (=> d!63387 m!284127))

(declare-fun m!284259 () Bool)

(assert (=> d!63387 m!284259))

(declare-fun m!284261 () Bool)

(assert (=> d!63387 m!284261))

(assert (=> d!63387 m!284229))

(assert (=> d!63387 m!284231))

(declare-fun m!284263 () Bool)

(assert (=> b!182695 m!284263))

(assert (=> b!182344 d!63387))

(declare-fun d!63389 () Bool)

(declare-fun e!126761 () Bool)

(assert (=> d!63389 e!126761))

(declare-fun res!151835 () Bool)

(assert (=> d!63389 (=> (not res!151835) (not e!126761))))

(declare-fun lt!280866 () tuple2!15760)

(declare-fun lt!280865 () tuple2!15760)

(assert (=> d!63389 (= res!151835 (= (bitIndex!0 (size!4293 (buf!4742 (_1!8525 lt!280866))) (currentByte!8964 (_1!8525 lt!280866)) (currentBit!8959 (_1!8525 lt!280866))) (bitIndex!0 (size!4293 (buf!4742 (_1!8525 lt!280865))) (currentByte!8964 (_1!8525 lt!280865)) (currentBit!8959 (_1!8525 lt!280865)))))))

(declare-fun lt!280868 () BitStream!7694)

(declare-fun lt!280867 () Unit!13083)

(declare-fun choose!50 (BitStream!7694 BitStream!7694 BitStream!7694 tuple2!15760 tuple2!15760 BitStream!7694 Bool tuple2!15760 tuple2!15760 BitStream!7694 Bool) Unit!13083)

(assert (=> d!63389 (= lt!280867 (choose!50 lt!279868 (_2!8524 lt!279863) lt!280868 lt!280866 (tuple2!15761 (_1!8525 lt!280866) (_2!8525 lt!280866)) (_1!8525 lt!280866) (_2!8525 lt!280866) lt!280865 (tuple2!15761 (_1!8525 lt!280865) (_2!8525 lt!280865)) (_1!8525 lt!280865) (_2!8525 lt!280865)))))

(assert (=> d!63389 (= lt!280865 (readBitPure!0 lt!280868))))

(assert (=> d!63389 (= lt!280866 (readBitPure!0 lt!279868))))

(assert (=> d!63389 (= lt!280868 (BitStream!7695 (buf!4742 (_2!8524 lt!279863)) (currentByte!8964 lt!279868) (currentBit!8959 lt!279868)))))

(assert (=> d!63389 (invariant!0 (currentBit!8959 lt!279868) (currentByte!8964 lt!279868) (size!4293 (buf!4742 (_2!8524 lt!279863))))))

(assert (=> d!63389 (= (readBitPrefixLemma!0 lt!279868 (_2!8524 lt!279863)) lt!280867)))

(declare-fun b!182699 () Bool)

(assert (=> b!182699 (= e!126761 (= (_2!8525 lt!280866) (_2!8525 lt!280865)))))

(assert (= (and d!63389 res!151835) b!182699))

(declare-fun m!284265 () Bool)

(assert (=> d!63389 m!284265))

(assert (=> d!63389 m!283575))

(declare-fun m!284267 () Bool)

(assert (=> d!63389 m!284267))

(declare-fun m!284269 () Bool)

(assert (=> d!63389 m!284269))

(declare-fun m!284271 () Bool)

(assert (=> d!63389 m!284271))

(declare-fun m!284273 () Bool)

(assert (=> d!63389 m!284273))

(assert (=> b!182344 d!63389))

(declare-fun d!63391 () Bool)

(declare-fun e!126762 () Bool)

(assert (=> d!63391 e!126762))

(declare-fun res!151837 () Bool)

(assert (=> d!63391 (=> (not res!151837) (not e!126762))))

(declare-fun lt!280872 () (_ BitVec 64))

(declare-fun lt!280869 () (_ BitVec 64))

(declare-fun lt!280873 () (_ BitVec 64))

(assert (=> d!63391 (= res!151837 (= lt!280872 (bvsub lt!280869 lt!280873)))))

(assert (=> d!63391 (or (= (bvand lt!280869 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!280873 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!280869 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!280869 lt!280873) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63391 (= lt!280873 (remainingBits!0 ((_ sign_extend 32) (size!4293 (buf!4742 (_1!8525 lt!279866)))) ((_ sign_extend 32) (currentByte!8964 (_1!8525 lt!279866))) ((_ sign_extend 32) (currentBit!8959 (_1!8525 lt!279866)))))))

(declare-fun lt!280870 () (_ BitVec 64))

(declare-fun lt!280871 () (_ BitVec 64))

(assert (=> d!63391 (= lt!280869 (bvmul lt!280870 lt!280871))))

(assert (=> d!63391 (or (= lt!280870 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!280871 (bvsdiv (bvmul lt!280870 lt!280871) lt!280870)))))

(assert (=> d!63391 (= lt!280871 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63391 (= lt!280870 ((_ sign_extend 32) (size!4293 (buf!4742 (_1!8525 lt!279866)))))))

(assert (=> d!63391 (= lt!280872 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8964 (_1!8525 lt!279866))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8959 (_1!8525 lt!279866)))))))

(assert (=> d!63391 (invariant!0 (currentBit!8959 (_1!8525 lt!279866)) (currentByte!8964 (_1!8525 lt!279866)) (size!4293 (buf!4742 (_1!8525 lt!279866))))))

(assert (=> d!63391 (= (bitIndex!0 (size!4293 (buf!4742 (_1!8525 lt!279866))) (currentByte!8964 (_1!8525 lt!279866)) (currentBit!8959 (_1!8525 lt!279866))) lt!280872)))

(declare-fun b!182700 () Bool)

(declare-fun res!151836 () Bool)

(assert (=> b!182700 (=> (not res!151836) (not e!126762))))

(assert (=> b!182700 (= res!151836 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!280872))))

(declare-fun b!182701 () Bool)

(declare-fun lt!280874 () (_ BitVec 64))

(assert (=> b!182701 (= e!126762 (bvsle lt!280872 (bvmul lt!280874 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!182701 (or (= lt!280874 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!280874 #b0000000000000000000000000000000000000000000000000000000000001000) lt!280874)))))

(assert (=> b!182701 (= lt!280874 ((_ sign_extend 32) (size!4293 (buf!4742 (_1!8525 lt!279866)))))))

(assert (= (and d!63391 res!151837) b!182700))

(assert (= (and b!182700 res!151836) b!182701))

(declare-fun m!284275 () Bool)

(assert (=> d!63391 m!284275))

(declare-fun m!284277 () Bool)

(assert (=> d!63391 m!284277))

(assert (=> b!182344 d!63391))

(declare-fun d!63393 () Bool)

(declare-fun e!126763 () Bool)

(assert (=> d!63393 e!126763))

(declare-fun res!151839 () Bool)

(assert (=> d!63393 (=> (not res!151839) (not e!126763))))

(declare-fun lt!280878 () (_ BitVec 64))

(declare-fun lt!280875 () (_ BitVec 64))

(declare-fun lt!280879 () (_ BitVec 64))

(assert (=> d!63393 (= res!151839 (= lt!280878 (bvsub lt!280875 lt!280879)))))

(assert (=> d!63393 (or (= (bvand lt!280875 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!280879 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!280875 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!280875 lt!280879) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63393 (= lt!280879 (remainingBits!0 ((_ sign_extend 32) (size!4293 (buf!4742 (_1!8525 lt!279874)))) ((_ sign_extend 32) (currentByte!8964 (_1!8525 lt!279874))) ((_ sign_extend 32) (currentBit!8959 (_1!8525 lt!279874)))))))

(declare-fun lt!280876 () (_ BitVec 64))

(declare-fun lt!280877 () (_ BitVec 64))

(assert (=> d!63393 (= lt!280875 (bvmul lt!280876 lt!280877))))

(assert (=> d!63393 (or (= lt!280876 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!280877 (bvsdiv (bvmul lt!280876 lt!280877) lt!280876)))))

(assert (=> d!63393 (= lt!280877 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63393 (= lt!280876 ((_ sign_extend 32) (size!4293 (buf!4742 (_1!8525 lt!279874)))))))

(assert (=> d!63393 (= lt!280878 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8964 (_1!8525 lt!279874))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8959 (_1!8525 lt!279874)))))))

(assert (=> d!63393 (invariant!0 (currentBit!8959 (_1!8525 lt!279874)) (currentByte!8964 (_1!8525 lt!279874)) (size!4293 (buf!4742 (_1!8525 lt!279874))))))

(assert (=> d!63393 (= (bitIndex!0 (size!4293 (buf!4742 (_1!8525 lt!279874))) (currentByte!8964 (_1!8525 lt!279874)) (currentBit!8959 (_1!8525 lt!279874))) lt!280878)))

(declare-fun b!182702 () Bool)

(declare-fun res!151838 () Bool)

(assert (=> b!182702 (=> (not res!151838) (not e!126763))))

(assert (=> b!182702 (= res!151838 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!280878))))

(declare-fun b!182703 () Bool)

(declare-fun lt!280880 () (_ BitVec 64))

(assert (=> b!182703 (= e!126763 (bvsle lt!280878 (bvmul lt!280880 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!182703 (or (= lt!280880 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!280880 #b0000000000000000000000000000000000000000000000000000000000001000) lt!280880)))))

(assert (=> b!182703 (= lt!280880 ((_ sign_extend 32) (size!4293 (buf!4742 (_1!8525 lt!279874)))))))

(assert (= (and d!63393 res!151839) b!182702))

(assert (= (and b!182702 res!151838) b!182703))

(declare-fun m!284279 () Bool)

(assert (=> d!63393 m!284279))

(declare-fun m!284281 () Bool)

(assert (=> d!63393 m!284281))

(assert (=> b!182344 d!63393))

(declare-fun d!63395 () Bool)

(declare-fun lt!280881 () tuple2!15772)

(assert (=> d!63395 (= lt!280881 (readBit!0 (_1!8523 lt!279872)))))

(assert (=> d!63395 (= (readBitPure!0 (_1!8523 lt!279872)) (tuple2!15761 (_2!8531 lt!280881) (_1!8531 lt!280881)))))

(declare-fun bs!15782 () Bool)

(assert (= bs!15782 d!63395))

(declare-fun m!284283 () Bool)

(assert (=> bs!15782 m!284283))

(assert (=> b!182344 d!63395))

(declare-fun d!63397 () Bool)

(assert (=> d!63397 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!182344 d!63397))

(declare-fun d!63399 () Bool)

(assert (=> d!63399 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4293 (buf!4742 (_2!8524 lt!279863)))) ((_ sign_extend 32) (currentByte!8964 thiss!1204)) ((_ sign_extend 32) (currentBit!8959 thiss!1204)) lt!279857) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4293 (buf!4742 (_2!8524 lt!279863)))) ((_ sign_extend 32) (currentByte!8964 thiss!1204)) ((_ sign_extend 32) (currentBit!8959 thiss!1204))) lt!279857))))

(declare-fun bs!15783 () Bool)

(assert (= bs!15783 d!63399))

(declare-fun m!284285 () Bool)

(assert (=> bs!15783 m!284285))

(assert (=> b!182344 d!63399))

(declare-fun d!63401 () Bool)

(declare-fun lt!280882 () tuple2!15772)

(assert (=> d!63401 (= lt!280882 (readBit!0 lt!279868))))

(assert (=> d!63401 (= (readBitPure!0 lt!279868) (tuple2!15761 (_2!8531 lt!280882) (_1!8531 lt!280882)))))

(declare-fun bs!15784 () Bool)

(assert (= bs!15784 d!63401))

(declare-fun m!284287 () Bool)

(assert (=> bs!15784 m!284287))

(assert (=> b!182344 d!63401))

(declare-fun d!63403 () Bool)

(assert (=> d!63403 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4293 (buf!4742 (_2!8524 lt!279863)))) ((_ sign_extend 32) (currentByte!8964 (_2!8524 lt!279858))) ((_ sign_extend 32) (currentBit!8959 (_2!8524 lt!279858))) lt!279865) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4293 (buf!4742 (_2!8524 lt!279863)))) ((_ sign_extend 32) (currentByte!8964 (_2!8524 lt!279858))) ((_ sign_extend 32) (currentBit!8959 (_2!8524 lt!279858)))) lt!279865))))

(declare-fun bs!15785 () Bool)

(assert (= bs!15785 d!63403))

(declare-fun m!284289 () Bool)

(assert (=> bs!15785 m!284289))

(assert (=> b!182344 d!63403))

(declare-fun d!63405 () Bool)

(assert (=> d!63405 (validate_offset_bits!1 ((_ sign_extend 32) (size!4293 (buf!4742 (_2!8524 lt!279863)))) ((_ sign_extend 32) (currentByte!8964 (_2!8524 lt!279858))) ((_ sign_extend 32) (currentBit!8959 (_2!8524 lt!279858))) lt!279865)))

(declare-fun lt!280883 () Unit!13083)

(assert (=> d!63405 (= lt!280883 (choose!9 (_2!8524 lt!279858) (buf!4742 (_2!8524 lt!279863)) lt!279865 (BitStream!7695 (buf!4742 (_2!8524 lt!279863)) (currentByte!8964 (_2!8524 lt!279858)) (currentBit!8959 (_2!8524 lt!279858)))))))

(assert (=> d!63405 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8524 lt!279858) (buf!4742 (_2!8524 lt!279863)) lt!279865) lt!280883)))

(declare-fun bs!15786 () Bool)

(assert (= bs!15786 d!63405))

(assert (=> bs!15786 m!283579))

(declare-fun m!284291 () Bool)

(assert (=> bs!15786 m!284291))

(assert (=> b!182344 d!63405))

(push 1)

(assert (not b!182476))

(assert (not b!182661))

(assert (not b!182666))

(assert (not d!63369))

(assert (not d!63297))

(assert (not d!63311))

(assert (not b!182474))

(assert (not b!182693))

(assert (not b!182692))

(assert (not d!63389))

(assert (not d!63291))

(assert (not b!182662))

(assert (not b!182687))

(assert (not b!182472))

(assert (not b!182473))

(assert (not d!63377))

(assert (not b!182689))

(assert (not d!63399))

(assert (not d!63371))

(assert (not b!182672))

(assert (not d!63393))

(assert (not d!63315))

(assert (not d!63309))

(assert (not b!182665))

(assert (not b!182483))

(assert (not d!63401))

(assert (not d!63405))

(assert (not d!63387))

(assert (not b!182668))

(assert (not b!182676))

(assert (not d!63317))

(assert (not b!182690))

(assert (not d!63391))

(assert (not d!63403))

(assert (not d!63299))

(assert (not d!63293))

(assert (not d!63373))

(assert (not b!182673))

(assert (not b!182470))

(assert (not bm!2960))

(assert (not b!182458))

(assert (not d!63381))

(assert (not b!182671))

(assert (not d!63303))

(assert (not b!182670))

(assert (not d!63379))

(assert (not b!182471))

(assert (not b!182460))

(assert (not b!182695))

(assert (not d!63383))

(assert (not b!182688))

(assert (not d!63395))

(assert (not b!182694))

(assert (not b!182669))

(assert (not b!182481))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

