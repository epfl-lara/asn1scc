; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39970 () Bool)

(assert start!39970)

(declare-fun b!182278 () Bool)

(declare-fun res!151493 () Bool)

(declare-fun e!126530 () Bool)

(assert (=> b!182278 (=> (not res!151493) (not e!126530))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!182278 (= res!151493 (not (= i!590 nBits!348)))))

(declare-fun e!126528 () Bool)

(declare-fun b!182279 () Bool)

(declare-datatypes ((array!9730 0))(
  ( (array!9731 (arr!5222 (Array (_ BitVec 32) (_ BitVec 8))) (size!4292 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7692 0))(
  ( (BitStream!7693 (buf!4741 array!9730) (currentByte!8963 (_ BitVec 32)) (currentBit!8958 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15748 0))(
  ( (tuple2!15749 (_1!8519 BitStream!7692) (_2!8519 BitStream!7692)) )
))
(declare-fun lt!279802 () tuple2!15748)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!182279 (= e!126528 (validate_offset_bits!1 ((_ sign_extend 32) (size!4292 (buf!4741 (_1!8519 lt!279802)))) ((_ sign_extend 32) (currentByte!8963 (_1!8519 lt!279802))) ((_ sign_extend 32) (currentBit!8958 (_1!8519 lt!279802))) ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun b!182280 () Bool)

(declare-fun e!126525 () Bool)

(declare-fun thiss!1204 () BitStream!7692)

(declare-datatypes ((Unit!13081 0))(
  ( (Unit!13082) )
))
(declare-datatypes ((tuple2!15750 0))(
  ( (tuple2!15751 (_1!8520 Unit!13081) (_2!8520 BitStream!7692)) )
))
(declare-fun lt!279795 () tuple2!15750)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!182280 (= e!126525 (invariant!0 (currentBit!8958 thiss!1204) (currentByte!8963 thiss!1204) (size!4292 (buf!4741 (_2!8520 lt!279795)))))))

(declare-fun b!182281 () Bool)

(declare-fun e!126532 () Bool)

(declare-fun e!126527 () Bool)

(assert (=> b!182281 (= e!126532 e!126527)))

(declare-fun res!151491 () Bool)

(assert (=> b!182281 (=> (not res!151491) (not e!126527))))

(declare-fun lt!279801 () tuple2!15750)

(declare-datatypes ((tuple2!15752 0))(
  ( (tuple2!15753 (_1!8521 BitStream!7692) (_2!8521 Bool)) )
))
(declare-fun lt!279807 () tuple2!15752)

(declare-fun lt!279810 () Bool)

(assert (=> b!182281 (= res!151491 (and (= (_2!8521 lt!279807) lt!279810) (= (_1!8521 lt!279807) (_2!8520 lt!279801))))))

(declare-fun readBitPure!0 (BitStream!7692) tuple2!15752)

(declare-fun readerFrom!0 (BitStream!7692 (_ BitVec 32) (_ BitVec 32)) BitStream!7692)

(assert (=> b!182281 (= lt!279807 (readBitPure!0 (readerFrom!0 (_2!8520 lt!279801) (currentBit!8958 thiss!1204) (currentByte!8963 thiss!1204))))))

(declare-fun b!182283 () Bool)

(declare-fun e!126531 () Bool)

(assert (=> b!182283 (= e!126531 e!126530)))

(declare-fun res!151489 () Bool)

(assert (=> b!182283 (=> (not res!151489) (not e!126530))))

(declare-fun lt!279793 () (_ BitVec 64))

(assert (=> b!182283 (= res!151489 (validate_offset_bits!1 ((_ sign_extend 32) (size!4292 (buf!4741 thiss!1204))) ((_ sign_extend 32) (currentByte!8963 thiss!1204)) ((_ sign_extend 32) (currentBit!8958 thiss!1204)) lt!279793))))

(assert (=> b!182283 (= lt!279793 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!182284 () Bool)

(declare-fun lt!279805 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!182284 (= e!126527 (= (bitIndex!0 (size!4292 (buf!4741 (_1!8521 lt!279807))) (currentByte!8963 (_1!8521 lt!279807)) (currentBit!8958 (_1!8521 lt!279807))) lt!279805))))

(declare-fun b!182285 () Bool)

(declare-fun res!151488 () Bool)

(assert (=> b!182285 (=> (not res!151488) (not e!126532))))

(declare-fun isPrefixOf!0 (BitStream!7692 BitStream!7692) Bool)

(assert (=> b!182285 (= res!151488 (isPrefixOf!0 thiss!1204 (_2!8520 lt!279801)))))

(declare-fun b!182286 () Bool)

(declare-fun res!151492 () Bool)

(declare-fun e!126529 () Bool)

(assert (=> b!182286 (=> res!151492 e!126529)))

(declare-fun lt!279803 () (_ BitVec 64))

(declare-fun lt!279804 () (_ BitVec 64))

(assert (=> b!182286 (= res!151492 (or (not (= (size!4292 (buf!4741 (_2!8520 lt!279795))) (size!4292 (buf!4741 thiss!1204)))) (not (= lt!279803 (bvsub (bvadd lt!279804 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!182287 () Bool)

(assert (=> b!182287 (= e!126529 e!126528)))

(declare-fun res!151484 () Bool)

(assert (=> b!182287 (=> res!151484 e!126528)))

(assert (=> b!182287 (= res!151484 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!590)) (bvsgt (bvadd #b00000000000000000000000000000001 i!590) nBits!348)))))

(declare-fun lt!279796 () (_ BitVec 64))

(assert (=> b!182287 (validate_offset_bits!1 ((_ sign_extend 32) (size!4292 (buf!4741 (_2!8520 lt!279795)))) ((_ sign_extend 32) (currentByte!8963 (_2!8520 lt!279801))) ((_ sign_extend 32) (currentBit!8958 (_2!8520 lt!279801))) lt!279796)))

(declare-fun lt!279800 () Unit!13081)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7692 array!9730 (_ BitVec 64)) Unit!13081)

(assert (=> b!182287 (= lt!279800 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8520 lt!279801) (buf!4741 (_2!8520 lt!279795)) lt!279796))))

(assert (=> b!182287 (= lt!279796 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!15754 0))(
  ( (tuple2!15755 (_1!8522 BitStream!7692) (_2!8522 (_ BitVec 64))) )
))
(declare-fun lt!279798 () tuple2!15754)

(declare-fun lt!279808 () tuple2!15748)

(declare-fun v!189 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7692 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15754)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!182287 (= lt!279798 (readNBitsLSBFirstsLoopPure!0 (_1!8519 lt!279808) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(assert (=> b!182287 (validate_offset_bits!1 ((_ sign_extend 32) (size!4292 (buf!4741 (_2!8520 lt!279795)))) ((_ sign_extend 32) (currentByte!8963 thiss!1204)) ((_ sign_extend 32) (currentBit!8958 thiss!1204)) lt!279793)))

(declare-fun lt!279797 () Unit!13081)

(assert (=> b!182287 (= lt!279797 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4741 (_2!8520 lt!279795)) lt!279793))))

(assert (=> b!182287 (= (_2!8521 (readBitPure!0 (_1!8519 lt!279808))) lt!279810)))

(declare-fun reader!0 (BitStream!7692 BitStream!7692) tuple2!15748)

(assert (=> b!182287 (= lt!279802 (reader!0 (_2!8520 lt!279801) (_2!8520 lt!279795)))))

(assert (=> b!182287 (= lt!279808 (reader!0 thiss!1204 (_2!8520 lt!279795)))))

(declare-fun e!126522 () Bool)

(assert (=> b!182287 e!126522))

(declare-fun res!151478 () Bool)

(assert (=> b!182287 (=> (not res!151478) (not e!126522))))

(declare-fun lt!279794 () tuple2!15752)

(declare-fun lt!279809 () tuple2!15752)

(assert (=> b!182287 (= res!151478 (= (bitIndex!0 (size!4292 (buf!4741 (_1!8521 lt!279794))) (currentByte!8963 (_1!8521 lt!279794)) (currentBit!8958 (_1!8521 lt!279794))) (bitIndex!0 (size!4292 (buf!4741 (_1!8521 lt!279809))) (currentByte!8963 (_1!8521 lt!279809)) (currentBit!8958 (_1!8521 lt!279809)))))))

(declare-fun lt!279812 () Unit!13081)

(declare-fun lt!279799 () BitStream!7692)

(declare-fun readBitPrefixLemma!0 (BitStream!7692 BitStream!7692) Unit!13081)

(assert (=> b!182287 (= lt!279812 (readBitPrefixLemma!0 lt!279799 (_2!8520 lt!279795)))))

(assert (=> b!182287 (= lt!279809 (readBitPure!0 (BitStream!7693 (buf!4741 (_2!8520 lt!279795)) (currentByte!8963 thiss!1204) (currentBit!8958 thiss!1204))))))

(assert (=> b!182287 (= lt!279794 (readBitPure!0 lt!279799))))

(assert (=> b!182287 e!126525))

(declare-fun res!151494 () Bool)

(assert (=> b!182287 (=> (not res!151494) (not e!126525))))

(assert (=> b!182287 (= res!151494 (invariant!0 (currentBit!8958 thiss!1204) (currentByte!8963 thiss!1204) (size!4292 (buf!4741 (_2!8520 lt!279801)))))))

(assert (=> b!182287 (= lt!279799 (BitStream!7693 (buf!4741 (_2!8520 lt!279801)) (currentByte!8963 thiss!1204) (currentBit!8958 thiss!1204)))))

(declare-fun b!182288 () Bool)

(declare-fun e!126523 () Bool)

(declare-fun array_inv!4033 (array!9730) Bool)

(assert (=> b!182288 (= e!126523 (array_inv!4033 (buf!4741 thiss!1204)))))

(declare-fun b!182289 () Bool)

(declare-fun res!151482 () Bool)

(assert (=> b!182289 (=> res!151482 e!126529)))

(assert (=> b!182289 (= res!151482 (not (invariant!0 (currentBit!8958 (_2!8520 lt!279795)) (currentByte!8963 (_2!8520 lt!279795)) (size!4292 (buf!4741 (_2!8520 lt!279795))))))))

(declare-fun b!182282 () Bool)

(declare-fun e!126526 () Bool)

(assert (=> b!182282 (= e!126526 e!126529)))

(declare-fun res!151485 () Bool)

(assert (=> b!182282 (=> res!151485 e!126529)))

(declare-fun lt!279811 () (_ BitVec 64))

(assert (=> b!182282 (= res!151485 (not (= lt!279803 (bvsub (bvsub (bvadd lt!279811 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!182282 (= lt!279803 (bitIndex!0 (size!4292 (buf!4741 (_2!8520 lt!279795))) (currentByte!8963 (_2!8520 lt!279795)) (currentBit!8958 (_2!8520 lt!279795))))))

(assert (=> b!182282 (isPrefixOf!0 thiss!1204 (_2!8520 lt!279795))))

(declare-fun lt!279792 () Unit!13081)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7692 BitStream!7692 BitStream!7692) Unit!13081)

(assert (=> b!182282 (= lt!279792 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8520 lt!279801) (_2!8520 lt!279795)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7692 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15750)

(assert (=> b!182282 (= lt!279795 (appendBitsLSBFirstLoopTR!0 (_2!8520 lt!279801) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun res!151480 () Bool)

(assert (=> start!39970 (=> (not res!151480) (not e!126531))))

(assert (=> start!39970 (= res!151480 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39970 e!126531))

(assert (=> start!39970 true))

(declare-fun inv!12 (BitStream!7692) Bool)

(assert (=> start!39970 (and (inv!12 thiss!1204) e!126523)))

(declare-fun b!182290 () Bool)

(declare-fun res!151486 () Bool)

(assert (=> b!182290 (=> (not res!151486) (not e!126530))))

(assert (=> b!182290 (= res!151486 (invariant!0 (currentBit!8958 thiss!1204) (currentByte!8963 thiss!1204) (size!4292 (buf!4741 thiss!1204))))))

(declare-fun b!182291 () Bool)

(declare-fun res!151483 () Bool)

(assert (=> b!182291 (=> res!151483 e!126529)))

(assert (=> b!182291 (= res!151483 (not (isPrefixOf!0 (_2!8520 lt!279801) (_2!8520 lt!279795))))))

(declare-fun b!182292 () Bool)

(assert (=> b!182292 (= e!126522 (= (_2!8521 lt!279794) (_2!8521 lt!279809)))))

(declare-fun b!182293 () Bool)

(declare-fun e!126524 () Bool)

(assert (=> b!182293 (= e!126524 e!126532)))

(declare-fun res!151481 () Bool)

(assert (=> b!182293 (=> (not res!151481) (not e!126532))))

(declare-fun lt!279806 () (_ BitVec 64))

(assert (=> b!182293 (= res!151481 (= lt!279805 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!279806)))))

(assert (=> b!182293 (= lt!279805 (bitIndex!0 (size!4292 (buf!4741 (_2!8520 lt!279801))) (currentByte!8963 (_2!8520 lt!279801)) (currentBit!8958 (_2!8520 lt!279801))))))

(assert (=> b!182293 (= lt!279806 (bitIndex!0 (size!4292 (buf!4741 thiss!1204)) (currentByte!8963 thiss!1204) (currentBit!8958 thiss!1204)))))

(declare-fun b!182294 () Bool)

(assert (=> b!182294 (= e!126530 (not e!126526))))

(declare-fun res!151487 () Bool)

(assert (=> b!182294 (=> res!151487 e!126526)))

(assert (=> b!182294 (= res!151487 (not (= lt!279811 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!279804))))))

(assert (=> b!182294 (= lt!279811 (bitIndex!0 (size!4292 (buf!4741 (_2!8520 lt!279801))) (currentByte!8963 (_2!8520 lt!279801)) (currentBit!8958 (_2!8520 lt!279801))))))

(assert (=> b!182294 (= lt!279804 (bitIndex!0 (size!4292 (buf!4741 thiss!1204)) (currentByte!8963 thiss!1204) (currentBit!8958 thiss!1204)))))

(assert (=> b!182294 e!126524))

(declare-fun res!151479 () Bool)

(assert (=> b!182294 (=> (not res!151479) (not e!126524))))

(assert (=> b!182294 (= res!151479 (= (size!4292 (buf!4741 thiss!1204)) (size!4292 (buf!4741 (_2!8520 lt!279801)))))))

(declare-fun appendBit!0 (BitStream!7692 Bool) tuple2!15750)

(assert (=> b!182294 (= lt!279801 (appendBit!0 thiss!1204 lt!279810))))

(assert (=> b!182294 (= lt!279810 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!182295 () Bool)

(declare-fun res!151490 () Bool)

(assert (=> b!182295 (=> res!151490 e!126529)))

(assert (=> b!182295 (= res!151490 (not (isPrefixOf!0 thiss!1204 (_2!8520 lt!279801))))))

(assert (= (and start!39970 res!151480) b!182283))

(assert (= (and b!182283 res!151489) b!182290))

(assert (= (and b!182290 res!151486) b!182278))

(assert (= (and b!182278 res!151493) b!182294))

(assert (= (and b!182294 res!151479) b!182293))

(assert (= (and b!182293 res!151481) b!182285))

(assert (= (and b!182285 res!151488) b!182281))

(assert (= (and b!182281 res!151491) b!182284))

(assert (= (and b!182294 (not res!151487)) b!182282))

(assert (= (and b!182282 (not res!151485)) b!182289))

(assert (= (and b!182289 (not res!151482)) b!182286))

(assert (= (and b!182286 (not res!151492)) b!182291))

(assert (= (and b!182291 (not res!151483)) b!182295))

(assert (= (and b!182295 (not res!151490)) b!182287))

(assert (= (and b!182287 res!151494) b!182280))

(assert (= (and b!182287 res!151478) b!182292))

(assert (= (and b!182287 (not res!151484)) b!182279))

(assert (= start!39970 b!182288))

(declare-fun m!283497 () Bool)

(assert (=> b!182288 m!283497))

(declare-fun m!283499 () Bool)

(assert (=> b!182289 m!283499))

(declare-fun m!283501 () Bool)

(assert (=> b!182294 m!283501))

(declare-fun m!283503 () Bool)

(assert (=> b!182294 m!283503))

(declare-fun m!283505 () Bool)

(assert (=> b!182294 m!283505))

(declare-fun m!283507 () Bool)

(assert (=> b!182290 m!283507))

(declare-fun m!283509 () Bool)

(assert (=> b!182295 m!283509))

(assert (=> b!182293 m!283501))

(assert (=> b!182293 m!283503))

(declare-fun m!283511 () Bool)

(assert (=> b!182283 m!283511))

(declare-fun m!283513 () Bool)

(assert (=> b!182282 m!283513))

(declare-fun m!283515 () Bool)

(assert (=> b!182282 m!283515))

(declare-fun m!283517 () Bool)

(assert (=> b!182282 m!283517))

(declare-fun m!283519 () Bool)

(assert (=> b!182282 m!283519))

(declare-fun m!283521 () Bool)

(assert (=> b!182280 m!283521))

(declare-fun m!283523 () Bool)

(assert (=> b!182287 m!283523))

(declare-fun m!283525 () Bool)

(assert (=> b!182287 m!283525))

(declare-fun m!283527 () Bool)

(assert (=> b!182287 m!283527))

(declare-fun m!283529 () Bool)

(assert (=> b!182287 m!283529))

(declare-fun m!283531 () Bool)

(assert (=> b!182287 m!283531))

(declare-fun m!283533 () Bool)

(assert (=> b!182287 m!283533))

(declare-fun m!283535 () Bool)

(assert (=> b!182287 m!283535))

(declare-fun m!283537 () Bool)

(assert (=> b!182287 m!283537))

(declare-fun m!283539 () Bool)

(assert (=> b!182287 m!283539))

(declare-fun m!283541 () Bool)

(assert (=> b!182287 m!283541))

(declare-fun m!283543 () Bool)

(assert (=> b!182287 m!283543))

(declare-fun m!283545 () Bool)

(assert (=> b!182287 m!283545))

(declare-fun m!283547 () Bool)

(assert (=> b!182287 m!283547))

(declare-fun m!283549 () Bool)

(assert (=> b!182287 m!283549))

(declare-fun m!283551 () Bool)

(assert (=> b!182287 m!283551))

(declare-fun m!283553 () Bool)

(assert (=> b!182281 m!283553))

(assert (=> b!182281 m!283553))

(declare-fun m!283555 () Bool)

(assert (=> b!182281 m!283555))

(assert (=> b!182285 m!283509))

(declare-fun m!283557 () Bool)

(assert (=> start!39970 m!283557))

(declare-fun m!283559 () Bool)

(assert (=> b!182279 m!283559))

(declare-fun m!283561 () Bool)

(assert (=> b!182291 m!283561))

(declare-fun m!283563 () Bool)

(assert (=> b!182284 m!283563))

(check-sat (not b!182279) (not b!182290) (not b!182293) (not b!182291) (not b!182289) (not b!182288) (not b!182284) (not b!182283) (not b!182295) (not b!182287) (not b!182282) (not b!182281) (not b!182280) (not b!182294) (not b!182285) (not start!39970))
(check-sat)
(get-model)

(declare-fun d!63203 () Bool)

(declare-fun res!151552 () Bool)

(declare-fun e!126573 () Bool)

(assert (=> d!63203 (=> (not res!151552) (not e!126573))))

(assert (=> d!63203 (= res!151552 (= (size!4292 (buf!4741 thiss!1204)) (size!4292 (buf!4741 (_2!8520 lt!279801)))))))

(assert (=> d!63203 (= (isPrefixOf!0 thiss!1204 (_2!8520 lt!279801)) e!126573)))

(declare-fun b!182356 () Bool)

(declare-fun res!151554 () Bool)

(assert (=> b!182356 (=> (not res!151554) (not e!126573))))

(assert (=> b!182356 (= res!151554 (bvsle (bitIndex!0 (size!4292 (buf!4741 thiss!1204)) (currentByte!8963 thiss!1204) (currentBit!8958 thiss!1204)) (bitIndex!0 (size!4292 (buf!4741 (_2!8520 lt!279801))) (currentByte!8963 (_2!8520 lt!279801)) (currentBit!8958 (_2!8520 lt!279801)))))))

(declare-fun b!182357 () Bool)

(declare-fun e!126574 () Bool)

(assert (=> b!182357 (= e!126573 e!126574)))

(declare-fun res!151553 () Bool)

(assert (=> b!182357 (=> res!151553 e!126574)))

(assert (=> b!182357 (= res!151553 (= (size!4292 (buf!4741 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!182358 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9730 array!9730 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!182358 (= e!126574 (arrayBitRangesEq!0 (buf!4741 thiss!1204) (buf!4741 (_2!8520 lt!279801)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4292 (buf!4741 thiss!1204)) (currentByte!8963 thiss!1204) (currentBit!8958 thiss!1204))))))

(assert (= (and d!63203 res!151552) b!182356))

(assert (= (and b!182356 res!151554) b!182357))

(assert (= (and b!182357 (not res!151553)) b!182358))

(assert (=> b!182356 m!283503))

(assert (=> b!182356 m!283501))

(assert (=> b!182358 m!283503))

(assert (=> b!182358 m!283503))

(declare-fun m!283633 () Bool)

(assert (=> b!182358 m!283633))

(assert (=> b!182295 d!63203))

(assert (=> b!182285 d!63203))

(declare-fun d!63205 () Bool)

(assert (=> d!63205 (= (invariant!0 (currentBit!8958 (_2!8520 lt!279795)) (currentByte!8963 (_2!8520 lt!279795)) (size!4292 (buf!4741 (_2!8520 lt!279795)))) (and (bvsge (currentBit!8958 (_2!8520 lt!279795)) #b00000000000000000000000000000000) (bvslt (currentBit!8958 (_2!8520 lt!279795)) #b00000000000000000000000000001000) (bvsge (currentByte!8963 (_2!8520 lt!279795)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8963 (_2!8520 lt!279795)) (size!4292 (buf!4741 (_2!8520 lt!279795)))) (and (= (currentBit!8958 (_2!8520 lt!279795)) #b00000000000000000000000000000000) (= (currentByte!8963 (_2!8520 lt!279795)) (size!4292 (buf!4741 (_2!8520 lt!279795))))))))))

(assert (=> b!182289 d!63205))

(declare-fun d!63207 () Bool)

(assert (=> d!63207 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!182287 d!63207))

(declare-fun d!63209 () Bool)

(assert (=> d!63209 (validate_offset_bits!1 ((_ sign_extend 32) (size!4292 (buf!4741 (_2!8520 lt!279795)))) ((_ sign_extend 32) (currentByte!8963 thiss!1204)) ((_ sign_extend 32) (currentBit!8958 thiss!1204)) lt!279793)))

(declare-fun lt!279878 () Unit!13081)

(declare-fun choose!9 (BitStream!7692 array!9730 (_ BitVec 64) BitStream!7692) Unit!13081)

(assert (=> d!63209 (= lt!279878 (choose!9 thiss!1204 (buf!4741 (_2!8520 lt!279795)) lt!279793 (BitStream!7693 (buf!4741 (_2!8520 lt!279795)) (currentByte!8963 thiss!1204) (currentBit!8958 thiss!1204))))))

(assert (=> d!63209 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4741 (_2!8520 lt!279795)) lt!279793) lt!279878)))

(declare-fun bs!15748 () Bool)

(assert (= bs!15748 d!63209))

(assert (=> bs!15748 m!283529))

(declare-fun m!283635 () Bool)

(assert (=> bs!15748 m!283635))

(assert (=> b!182287 d!63209))

(declare-fun d!63211 () Bool)

(assert (=> d!63211 (validate_offset_bits!1 ((_ sign_extend 32) (size!4292 (buf!4741 (_2!8520 lt!279795)))) ((_ sign_extend 32) (currentByte!8963 (_2!8520 lt!279801))) ((_ sign_extend 32) (currentBit!8958 (_2!8520 lt!279801))) lt!279796)))

(declare-fun lt!279879 () Unit!13081)

(assert (=> d!63211 (= lt!279879 (choose!9 (_2!8520 lt!279801) (buf!4741 (_2!8520 lt!279795)) lt!279796 (BitStream!7693 (buf!4741 (_2!8520 lt!279795)) (currentByte!8963 (_2!8520 lt!279801)) (currentBit!8958 (_2!8520 lt!279801)))))))

(assert (=> d!63211 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8520 lt!279801) (buf!4741 (_2!8520 lt!279795)) lt!279796) lt!279879)))

(declare-fun bs!15749 () Bool)

(assert (= bs!15749 d!63211))

(assert (=> bs!15749 m!283551))

(declare-fun m!283637 () Bool)

(assert (=> bs!15749 m!283637))

(assert (=> b!182287 d!63211))

(declare-fun d!63213 () Bool)

(declare-fun e!126577 () Bool)

(assert (=> d!63213 e!126577))

(declare-fun res!151559 () Bool)

(assert (=> d!63213 (=> (not res!151559) (not e!126577))))

(declare-fun lt!279893 () (_ BitVec 64))

(declare-fun lt!279896 () (_ BitVec 64))

(declare-fun lt!279894 () (_ BitVec 64))

(assert (=> d!63213 (= res!151559 (= lt!279896 (bvsub lt!279893 lt!279894)))))

(assert (=> d!63213 (or (= (bvand lt!279893 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!279894 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!279893 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!279893 lt!279894) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!63213 (= lt!279894 (remainingBits!0 ((_ sign_extend 32) (size!4292 (buf!4741 (_1!8521 lt!279809)))) ((_ sign_extend 32) (currentByte!8963 (_1!8521 lt!279809))) ((_ sign_extend 32) (currentBit!8958 (_1!8521 lt!279809)))))))

(declare-fun lt!279892 () (_ BitVec 64))

(declare-fun lt!279897 () (_ BitVec 64))

(assert (=> d!63213 (= lt!279893 (bvmul lt!279892 lt!279897))))

(assert (=> d!63213 (or (= lt!279892 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!279897 (bvsdiv (bvmul lt!279892 lt!279897) lt!279892)))))

(assert (=> d!63213 (= lt!279897 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63213 (= lt!279892 ((_ sign_extend 32) (size!4292 (buf!4741 (_1!8521 lt!279809)))))))

(assert (=> d!63213 (= lt!279896 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8963 (_1!8521 lt!279809))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8958 (_1!8521 lt!279809)))))))

(assert (=> d!63213 (invariant!0 (currentBit!8958 (_1!8521 lt!279809)) (currentByte!8963 (_1!8521 lt!279809)) (size!4292 (buf!4741 (_1!8521 lt!279809))))))

(assert (=> d!63213 (= (bitIndex!0 (size!4292 (buf!4741 (_1!8521 lt!279809))) (currentByte!8963 (_1!8521 lt!279809)) (currentBit!8958 (_1!8521 lt!279809))) lt!279896)))

(declare-fun b!182363 () Bool)

(declare-fun res!151560 () Bool)

(assert (=> b!182363 (=> (not res!151560) (not e!126577))))

(assert (=> b!182363 (= res!151560 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!279896))))

(declare-fun b!182364 () Bool)

(declare-fun lt!279895 () (_ BitVec 64))

(assert (=> b!182364 (= e!126577 (bvsle lt!279896 (bvmul lt!279895 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!182364 (or (= lt!279895 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!279895 #b0000000000000000000000000000000000000000000000000000000000001000) lt!279895)))))

(assert (=> b!182364 (= lt!279895 ((_ sign_extend 32) (size!4292 (buf!4741 (_1!8521 lt!279809)))))))

(assert (= (and d!63213 res!151559) b!182363))

(assert (= (and b!182363 res!151560) b!182364))

(declare-fun m!283639 () Bool)

(assert (=> d!63213 m!283639))

(declare-fun m!283641 () Bool)

(assert (=> d!63213 m!283641))

(assert (=> b!182287 d!63213))

(declare-fun d!63215 () Bool)

(declare-fun e!126580 () Bool)

(assert (=> d!63215 e!126580))

(declare-fun res!151563 () Bool)

(assert (=> d!63215 (=> (not res!151563) (not e!126580))))

(declare-fun lt!279908 () tuple2!15752)

(declare-fun lt!279909 () tuple2!15752)

(assert (=> d!63215 (= res!151563 (= (bitIndex!0 (size!4292 (buf!4741 (_1!8521 lt!279908))) (currentByte!8963 (_1!8521 lt!279908)) (currentBit!8958 (_1!8521 lt!279908))) (bitIndex!0 (size!4292 (buf!4741 (_1!8521 lt!279909))) (currentByte!8963 (_1!8521 lt!279909)) (currentBit!8958 (_1!8521 lt!279909)))))))

(declare-fun lt!279906 () Unit!13081)

(declare-fun lt!279907 () BitStream!7692)

(declare-fun choose!50 (BitStream!7692 BitStream!7692 BitStream!7692 tuple2!15752 tuple2!15752 BitStream!7692 Bool tuple2!15752 tuple2!15752 BitStream!7692 Bool) Unit!13081)

(assert (=> d!63215 (= lt!279906 (choose!50 lt!279799 (_2!8520 lt!279795) lt!279907 lt!279908 (tuple2!15753 (_1!8521 lt!279908) (_2!8521 lt!279908)) (_1!8521 lt!279908) (_2!8521 lt!279908) lt!279909 (tuple2!15753 (_1!8521 lt!279909) (_2!8521 lt!279909)) (_1!8521 lt!279909) (_2!8521 lt!279909)))))

(assert (=> d!63215 (= lt!279909 (readBitPure!0 lt!279907))))

(assert (=> d!63215 (= lt!279908 (readBitPure!0 lt!279799))))

(assert (=> d!63215 (= lt!279907 (BitStream!7693 (buf!4741 (_2!8520 lt!279795)) (currentByte!8963 lt!279799) (currentBit!8958 lt!279799)))))

(assert (=> d!63215 (invariant!0 (currentBit!8958 lt!279799) (currentByte!8963 lt!279799) (size!4292 (buf!4741 (_2!8520 lt!279795))))))

(assert (=> d!63215 (= (readBitPrefixLemma!0 lt!279799 (_2!8520 lt!279795)) lt!279906)))

(declare-fun b!182367 () Bool)

(assert (=> b!182367 (= e!126580 (= (_2!8521 lt!279908) (_2!8521 lt!279909)))))

(assert (= (and d!63215 res!151563) b!182367))

(declare-fun m!283643 () Bool)

(assert (=> d!63215 m!283643))

(assert (=> d!63215 m!283543))

(declare-fun m!283645 () Bool)

(assert (=> d!63215 m!283645))

(declare-fun m!283647 () Bool)

(assert (=> d!63215 m!283647))

(declare-fun m!283649 () Bool)

(assert (=> d!63215 m!283649))

(declare-fun m!283651 () Bool)

(assert (=> d!63215 m!283651))

(assert (=> b!182287 d!63215))

(declare-fun d!63217 () Bool)

(declare-datatypes ((tuple2!15764 0))(
  ( (tuple2!15765 (_1!8527 Bool) (_2!8527 BitStream!7692)) )
))
(declare-fun lt!279912 () tuple2!15764)

(declare-fun readBit!0 (BitStream!7692) tuple2!15764)

(assert (=> d!63217 (= lt!279912 (readBit!0 (BitStream!7693 (buf!4741 (_2!8520 lt!279795)) (currentByte!8963 thiss!1204) (currentBit!8958 thiss!1204))))))

(assert (=> d!63217 (= (readBitPure!0 (BitStream!7693 (buf!4741 (_2!8520 lt!279795)) (currentByte!8963 thiss!1204) (currentBit!8958 thiss!1204))) (tuple2!15753 (_2!8527 lt!279912) (_1!8527 lt!279912)))))

(declare-fun bs!15750 () Bool)

(assert (= bs!15750 d!63217))

(declare-fun m!283653 () Bool)

(assert (=> bs!15750 m!283653))

(assert (=> b!182287 d!63217))

(declare-fun d!63219 () Bool)

(declare-fun lt!279913 () tuple2!15764)

(assert (=> d!63219 (= lt!279913 (readBit!0 (_1!8519 lt!279808)))))

(assert (=> d!63219 (= (readBitPure!0 (_1!8519 lt!279808)) (tuple2!15753 (_2!8527 lt!279913) (_1!8527 lt!279913)))))

(declare-fun bs!15751 () Bool)

(assert (= bs!15751 d!63219))

(declare-fun m!283655 () Bool)

(assert (=> bs!15751 m!283655))

(assert (=> b!182287 d!63219))

(declare-fun d!63221 () Bool)

(declare-fun lt!279914 () tuple2!15764)

(assert (=> d!63221 (= lt!279914 (readBit!0 lt!279799))))

(assert (=> d!63221 (= (readBitPure!0 lt!279799) (tuple2!15753 (_2!8527 lt!279914) (_1!8527 lt!279914)))))

(declare-fun bs!15752 () Bool)

(assert (= bs!15752 d!63221))

(declare-fun m!283657 () Bool)

(assert (=> bs!15752 m!283657))

(assert (=> b!182287 d!63221))

(declare-fun b!182378 () Bool)

(declare-fun lt!279968 () tuple2!15748)

(declare-fun lt!279958 () (_ BitVec 64))

(declare-fun e!126585 () Bool)

(declare-fun lt!279959 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!7692 (_ BitVec 64)) BitStream!7692)

(assert (=> b!182378 (= e!126585 (= (_1!8519 lt!279968) (withMovedBitIndex!0 (_2!8519 lt!279968) (bvsub lt!279959 lt!279958))))))

(assert (=> b!182378 (or (= (bvand lt!279959 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!279958 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!279959 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!279959 lt!279958) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!182378 (= lt!279958 (bitIndex!0 (size!4292 (buf!4741 (_2!8520 lt!279795))) (currentByte!8963 (_2!8520 lt!279795)) (currentBit!8958 (_2!8520 lt!279795))))))

(assert (=> b!182378 (= lt!279959 (bitIndex!0 (size!4292 (buf!4741 (_2!8520 lt!279801))) (currentByte!8963 (_2!8520 lt!279801)) (currentBit!8958 (_2!8520 lt!279801))))))

(declare-fun b!182379 () Bool)

(declare-fun e!126586 () Unit!13081)

(declare-fun Unit!13085 () Unit!13081)

(assert (=> b!182379 (= e!126586 Unit!13085)))

(declare-fun d!63223 () Bool)

(assert (=> d!63223 e!126585))

(declare-fun res!151570 () Bool)

(assert (=> d!63223 (=> (not res!151570) (not e!126585))))

(assert (=> d!63223 (= res!151570 (isPrefixOf!0 (_1!8519 lt!279968) (_2!8519 lt!279968)))))

(declare-fun lt!279972 () BitStream!7692)

(assert (=> d!63223 (= lt!279968 (tuple2!15749 lt!279972 (_2!8520 lt!279795)))))

(declare-fun lt!279963 () Unit!13081)

(declare-fun lt!279969 () Unit!13081)

(assert (=> d!63223 (= lt!279963 lt!279969)))

(assert (=> d!63223 (isPrefixOf!0 lt!279972 (_2!8520 lt!279795))))

(assert (=> d!63223 (= lt!279969 (lemmaIsPrefixTransitive!0 lt!279972 (_2!8520 lt!279795) (_2!8520 lt!279795)))))

(declare-fun lt!279955 () Unit!13081)

(declare-fun lt!279956 () Unit!13081)

(assert (=> d!63223 (= lt!279955 lt!279956)))

(assert (=> d!63223 (isPrefixOf!0 lt!279972 (_2!8520 lt!279795))))

(assert (=> d!63223 (= lt!279956 (lemmaIsPrefixTransitive!0 lt!279972 (_2!8520 lt!279801) (_2!8520 lt!279795)))))

(declare-fun lt!279970 () Unit!13081)

(assert (=> d!63223 (= lt!279970 e!126586)))

(declare-fun c!9369 () Bool)

(assert (=> d!63223 (= c!9369 (not (= (size!4292 (buf!4741 (_2!8520 lt!279801))) #b00000000000000000000000000000000)))))

(declare-fun lt!279966 () Unit!13081)

(declare-fun lt!279973 () Unit!13081)

(assert (=> d!63223 (= lt!279966 lt!279973)))

(assert (=> d!63223 (isPrefixOf!0 (_2!8520 lt!279795) (_2!8520 lt!279795))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7692) Unit!13081)

(assert (=> d!63223 (= lt!279973 (lemmaIsPrefixRefl!0 (_2!8520 lt!279795)))))

(declare-fun lt!279961 () Unit!13081)

(declare-fun lt!279962 () Unit!13081)

(assert (=> d!63223 (= lt!279961 lt!279962)))

(assert (=> d!63223 (= lt!279962 (lemmaIsPrefixRefl!0 (_2!8520 lt!279795)))))

(declare-fun lt!279964 () Unit!13081)

(declare-fun lt!279965 () Unit!13081)

(assert (=> d!63223 (= lt!279964 lt!279965)))

(assert (=> d!63223 (isPrefixOf!0 lt!279972 lt!279972)))

(assert (=> d!63223 (= lt!279965 (lemmaIsPrefixRefl!0 lt!279972))))

(declare-fun lt!279967 () Unit!13081)

(declare-fun lt!279957 () Unit!13081)

(assert (=> d!63223 (= lt!279967 lt!279957)))

(assert (=> d!63223 (isPrefixOf!0 (_2!8520 lt!279801) (_2!8520 lt!279801))))

(assert (=> d!63223 (= lt!279957 (lemmaIsPrefixRefl!0 (_2!8520 lt!279801)))))

(assert (=> d!63223 (= lt!279972 (BitStream!7693 (buf!4741 (_2!8520 lt!279795)) (currentByte!8963 (_2!8520 lt!279801)) (currentBit!8958 (_2!8520 lt!279801))))))

(assert (=> d!63223 (isPrefixOf!0 (_2!8520 lt!279801) (_2!8520 lt!279795))))

(assert (=> d!63223 (= (reader!0 (_2!8520 lt!279801) (_2!8520 lt!279795)) lt!279968)))

(declare-fun b!182380 () Bool)

(declare-fun res!151572 () Bool)

(assert (=> b!182380 (=> (not res!151572) (not e!126585))))

(assert (=> b!182380 (= res!151572 (isPrefixOf!0 (_2!8519 lt!279968) (_2!8520 lt!279795)))))

(declare-fun b!182381 () Bool)

(declare-fun res!151571 () Bool)

(assert (=> b!182381 (=> (not res!151571) (not e!126585))))

(assert (=> b!182381 (= res!151571 (isPrefixOf!0 (_1!8519 lt!279968) (_2!8520 lt!279801)))))

(declare-fun b!182382 () Bool)

(declare-fun lt!279971 () Unit!13081)

(assert (=> b!182382 (= e!126586 lt!279971)))

(declare-fun lt!279960 () (_ BitVec 64))

(assert (=> b!182382 (= lt!279960 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!279974 () (_ BitVec 64))

(assert (=> b!182382 (= lt!279974 (bitIndex!0 (size!4292 (buf!4741 (_2!8520 lt!279801))) (currentByte!8963 (_2!8520 lt!279801)) (currentBit!8958 (_2!8520 lt!279801))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9730 array!9730 (_ BitVec 64) (_ BitVec 64)) Unit!13081)

(assert (=> b!182382 (= lt!279971 (arrayBitRangesEqSymmetric!0 (buf!4741 (_2!8520 lt!279801)) (buf!4741 (_2!8520 lt!279795)) lt!279960 lt!279974))))

(assert (=> b!182382 (arrayBitRangesEq!0 (buf!4741 (_2!8520 lt!279795)) (buf!4741 (_2!8520 lt!279801)) lt!279960 lt!279974)))

(assert (= (and d!63223 c!9369) b!182382))

(assert (= (and d!63223 (not c!9369)) b!182379))

(assert (= (and d!63223 res!151570) b!182381))

(assert (= (and b!182381 res!151571) b!182380))

(assert (= (and b!182380 res!151572) b!182378))

(declare-fun m!283659 () Bool)

(assert (=> b!182380 m!283659))

(assert (=> b!182382 m!283501))

(declare-fun m!283661 () Bool)

(assert (=> b!182382 m!283661))

(declare-fun m!283663 () Bool)

(assert (=> b!182382 m!283663))

(declare-fun m!283665 () Bool)

(assert (=> b!182381 m!283665))

(declare-fun m!283667 () Bool)

(assert (=> d!63223 m!283667))

(declare-fun m!283669 () Bool)

(assert (=> d!63223 m!283669))

(declare-fun m!283671 () Bool)

(assert (=> d!63223 m!283671))

(declare-fun m!283673 () Bool)

(assert (=> d!63223 m!283673))

(assert (=> d!63223 m!283561))

(declare-fun m!283675 () Bool)

(assert (=> d!63223 m!283675))

(declare-fun m!283677 () Bool)

(assert (=> d!63223 m!283677))

(declare-fun m!283679 () Bool)

(assert (=> d!63223 m!283679))

(declare-fun m!283681 () Bool)

(assert (=> d!63223 m!283681))

(declare-fun m!283683 () Bool)

(assert (=> d!63223 m!283683))

(declare-fun m!283685 () Bool)

(assert (=> d!63223 m!283685))

(declare-fun m!283687 () Bool)

(assert (=> b!182378 m!283687))

(assert (=> b!182378 m!283513))

(assert (=> b!182378 m!283501))

(assert (=> b!182287 d!63223))

(declare-datatypes ((tuple2!15766 0))(
  ( (tuple2!15767 (_1!8528 (_ BitVec 64)) (_2!8528 BitStream!7692)) )
))
(declare-fun lt!279977 () tuple2!15766)

(declare-fun d!63225 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!7692 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15766)

(assert (=> d!63225 (= lt!279977 (readNBitsLSBFirstsLoop!0 (_1!8519 lt!279808) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(assert (=> d!63225 (= (readNBitsLSBFirstsLoopPure!0 (_1!8519 lt!279808) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))) (tuple2!15755 (_2!8528 lt!279977) (_1!8528 lt!279977)))))

(declare-fun bs!15753 () Bool)

(assert (= bs!15753 d!63225))

(declare-fun m!283689 () Bool)

(assert (=> bs!15753 m!283689))

(assert (=> b!182287 d!63225))

(declare-fun d!63227 () Bool)

(declare-fun e!126587 () Bool)

(assert (=> d!63227 e!126587))

(declare-fun res!151573 () Bool)

(assert (=> d!63227 (=> (not res!151573) (not e!126587))))

(declare-fun lt!279979 () (_ BitVec 64))

(declare-fun lt!279982 () (_ BitVec 64))

(declare-fun lt!279980 () (_ BitVec 64))

(assert (=> d!63227 (= res!151573 (= lt!279982 (bvsub lt!279979 lt!279980)))))

(assert (=> d!63227 (or (= (bvand lt!279979 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!279980 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!279979 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!279979 lt!279980) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63227 (= lt!279980 (remainingBits!0 ((_ sign_extend 32) (size!4292 (buf!4741 (_1!8521 lt!279794)))) ((_ sign_extend 32) (currentByte!8963 (_1!8521 lt!279794))) ((_ sign_extend 32) (currentBit!8958 (_1!8521 lt!279794)))))))

(declare-fun lt!279978 () (_ BitVec 64))

(declare-fun lt!279983 () (_ BitVec 64))

(assert (=> d!63227 (= lt!279979 (bvmul lt!279978 lt!279983))))

(assert (=> d!63227 (or (= lt!279978 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!279983 (bvsdiv (bvmul lt!279978 lt!279983) lt!279978)))))

(assert (=> d!63227 (= lt!279983 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63227 (= lt!279978 ((_ sign_extend 32) (size!4292 (buf!4741 (_1!8521 lt!279794)))))))

(assert (=> d!63227 (= lt!279982 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8963 (_1!8521 lt!279794))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8958 (_1!8521 lt!279794)))))))

(assert (=> d!63227 (invariant!0 (currentBit!8958 (_1!8521 lt!279794)) (currentByte!8963 (_1!8521 lt!279794)) (size!4292 (buf!4741 (_1!8521 lt!279794))))))

(assert (=> d!63227 (= (bitIndex!0 (size!4292 (buf!4741 (_1!8521 lt!279794))) (currentByte!8963 (_1!8521 lt!279794)) (currentBit!8958 (_1!8521 lt!279794))) lt!279982)))

(declare-fun b!182383 () Bool)

(declare-fun res!151574 () Bool)

(assert (=> b!182383 (=> (not res!151574) (not e!126587))))

(assert (=> b!182383 (= res!151574 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!279982))))

(declare-fun b!182384 () Bool)

(declare-fun lt!279981 () (_ BitVec 64))

(assert (=> b!182384 (= e!126587 (bvsle lt!279982 (bvmul lt!279981 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!182384 (or (= lt!279981 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!279981 #b0000000000000000000000000000000000000000000000000000000000001000) lt!279981)))))

(assert (=> b!182384 (= lt!279981 ((_ sign_extend 32) (size!4292 (buf!4741 (_1!8521 lt!279794)))))))

(assert (= (and d!63227 res!151573) b!182383))

(assert (= (and b!182383 res!151574) b!182384))

(declare-fun m!283691 () Bool)

(assert (=> d!63227 m!283691))

(declare-fun m!283693 () Bool)

(assert (=> d!63227 m!283693))

(assert (=> b!182287 d!63227))

(declare-fun d!63229 () Bool)

(assert (=> d!63229 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4292 (buf!4741 (_2!8520 lt!279795)))) ((_ sign_extend 32) (currentByte!8963 thiss!1204)) ((_ sign_extend 32) (currentBit!8958 thiss!1204)) lt!279793) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4292 (buf!4741 (_2!8520 lt!279795)))) ((_ sign_extend 32) (currentByte!8963 thiss!1204)) ((_ sign_extend 32) (currentBit!8958 thiss!1204))) lt!279793))))

(declare-fun bs!15754 () Bool)

(assert (= bs!15754 d!63229))

(declare-fun m!283695 () Bool)

(assert (=> bs!15754 m!283695))

(assert (=> b!182287 d!63229))

(declare-fun d!63231 () Bool)

(assert (=> d!63231 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4292 (buf!4741 (_2!8520 lt!279795)))) ((_ sign_extend 32) (currentByte!8963 (_2!8520 lt!279801))) ((_ sign_extend 32) (currentBit!8958 (_2!8520 lt!279801))) lt!279796) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4292 (buf!4741 (_2!8520 lt!279795)))) ((_ sign_extend 32) (currentByte!8963 (_2!8520 lt!279801))) ((_ sign_extend 32) (currentBit!8958 (_2!8520 lt!279801)))) lt!279796))))

(declare-fun bs!15755 () Bool)

(assert (= bs!15755 d!63231))

(declare-fun m!283697 () Bool)

(assert (=> bs!15755 m!283697))

(assert (=> b!182287 d!63231))

(declare-fun d!63233 () Bool)

(assert (=> d!63233 (= (invariant!0 (currentBit!8958 thiss!1204) (currentByte!8963 thiss!1204) (size!4292 (buf!4741 (_2!8520 lt!279801)))) (and (bvsge (currentBit!8958 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8958 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8963 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8963 thiss!1204) (size!4292 (buf!4741 (_2!8520 lt!279801)))) (and (= (currentBit!8958 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8963 thiss!1204) (size!4292 (buf!4741 (_2!8520 lt!279801))))))))))

(assert (=> b!182287 d!63233))

(declare-fun lt!279997 () tuple2!15748)

(declare-fun e!126588 () Bool)

(declare-fun b!182385 () Bool)

(declare-fun lt!279988 () (_ BitVec 64))

(declare-fun lt!279987 () (_ BitVec 64))

(assert (=> b!182385 (= e!126588 (= (_1!8519 lt!279997) (withMovedBitIndex!0 (_2!8519 lt!279997) (bvsub lt!279988 lt!279987))))))

(assert (=> b!182385 (or (= (bvand lt!279988 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!279987 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!279988 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!279988 lt!279987) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!182385 (= lt!279987 (bitIndex!0 (size!4292 (buf!4741 (_2!8520 lt!279795))) (currentByte!8963 (_2!8520 lt!279795)) (currentBit!8958 (_2!8520 lt!279795))))))

(assert (=> b!182385 (= lt!279988 (bitIndex!0 (size!4292 (buf!4741 thiss!1204)) (currentByte!8963 thiss!1204) (currentBit!8958 thiss!1204)))))

(declare-fun b!182386 () Bool)

(declare-fun e!126589 () Unit!13081)

(declare-fun Unit!13096 () Unit!13081)

(assert (=> b!182386 (= e!126589 Unit!13096)))

(declare-fun d!63235 () Bool)

(assert (=> d!63235 e!126588))

(declare-fun res!151575 () Bool)

(assert (=> d!63235 (=> (not res!151575) (not e!126588))))

(assert (=> d!63235 (= res!151575 (isPrefixOf!0 (_1!8519 lt!279997) (_2!8519 lt!279997)))))

(declare-fun lt!280001 () BitStream!7692)

(assert (=> d!63235 (= lt!279997 (tuple2!15749 lt!280001 (_2!8520 lt!279795)))))

(declare-fun lt!279992 () Unit!13081)

(declare-fun lt!279998 () Unit!13081)

(assert (=> d!63235 (= lt!279992 lt!279998)))

(assert (=> d!63235 (isPrefixOf!0 lt!280001 (_2!8520 lt!279795))))

(assert (=> d!63235 (= lt!279998 (lemmaIsPrefixTransitive!0 lt!280001 (_2!8520 lt!279795) (_2!8520 lt!279795)))))

(declare-fun lt!279984 () Unit!13081)

(declare-fun lt!279985 () Unit!13081)

(assert (=> d!63235 (= lt!279984 lt!279985)))

(assert (=> d!63235 (isPrefixOf!0 lt!280001 (_2!8520 lt!279795))))

(assert (=> d!63235 (= lt!279985 (lemmaIsPrefixTransitive!0 lt!280001 thiss!1204 (_2!8520 lt!279795)))))

(declare-fun lt!279999 () Unit!13081)

(assert (=> d!63235 (= lt!279999 e!126589)))

(declare-fun c!9370 () Bool)

(assert (=> d!63235 (= c!9370 (not (= (size!4292 (buf!4741 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!279995 () Unit!13081)

(declare-fun lt!280002 () Unit!13081)

(assert (=> d!63235 (= lt!279995 lt!280002)))

(assert (=> d!63235 (isPrefixOf!0 (_2!8520 lt!279795) (_2!8520 lt!279795))))

(assert (=> d!63235 (= lt!280002 (lemmaIsPrefixRefl!0 (_2!8520 lt!279795)))))

(declare-fun lt!279990 () Unit!13081)

(declare-fun lt!279991 () Unit!13081)

(assert (=> d!63235 (= lt!279990 lt!279991)))

(assert (=> d!63235 (= lt!279991 (lemmaIsPrefixRefl!0 (_2!8520 lt!279795)))))

(declare-fun lt!279993 () Unit!13081)

(declare-fun lt!279994 () Unit!13081)

(assert (=> d!63235 (= lt!279993 lt!279994)))

(assert (=> d!63235 (isPrefixOf!0 lt!280001 lt!280001)))

(assert (=> d!63235 (= lt!279994 (lemmaIsPrefixRefl!0 lt!280001))))

(declare-fun lt!279996 () Unit!13081)

(declare-fun lt!279986 () Unit!13081)

(assert (=> d!63235 (= lt!279996 lt!279986)))

(assert (=> d!63235 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!63235 (= lt!279986 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!63235 (= lt!280001 (BitStream!7693 (buf!4741 (_2!8520 lt!279795)) (currentByte!8963 thiss!1204) (currentBit!8958 thiss!1204)))))

(assert (=> d!63235 (isPrefixOf!0 thiss!1204 (_2!8520 lt!279795))))

(assert (=> d!63235 (= (reader!0 thiss!1204 (_2!8520 lt!279795)) lt!279997)))

(declare-fun b!182387 () Bool)

(declare-fun res!151577 () Bool)

(assert (=> b!182387 (=> (not res!151577) (not e!126588))))

(assert (=> b!182387 (= res!151577 (isPrefixOf!0 (_2!8519 lt!279997) (_2!8520 lt!279795)))))

(declare-fun b!182388 () Bool)

(declare-fun res!151576 () Bool)

(assert (=> b!182388 (=> (not res!151576) (not e!126588))))

(assert (=> b!182388 (= res!151576 (isPrefixOf!0 (_1!8519 lt!279997) thiss!1204))))

(declare-fun b!182389 () Bool)

(declare-fun lt!280000 () Unit!13081)

(assert (=> b!182389 (= e!126589 lt!280000)))

(declare-fun lt!279989 () (_ BitVec 64))

(assert (=> b!182389 (= lt!279989 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!280003 () (_ BitVec 64))

(assert (=> b!182389 (= lt!280003 (bitIndex!0 (size!4292 (buf!4741 thiss!1204)) (currentByte!8963 thiss!1204) (currentBit!8958 thiss!1204)))))

(assert (=> b!182389 (= lt!280000 (arrayBitRangesEqSymmetric!0 (buf!4741 thiss!1204) (buf!4741 (_2!8520 lt!279795)) lt!279989 lt!280003))))

(assert (=> b!182389 (arrayBitRangesEq!0 (buf!4741 (_2!8520 lt!279795)) (buf!4741 thiss!1204) lt!279989 lt!280003)))

(assert (= (and d!63235 c!9370) b!182389))

(assert (= (and d!63235 (not c!9370)) b!182386))

(assert (= (and d!63235 res!151575) b!182388))

(assert (= (and b!182388 res!151576) b!182387))

(assert (= (and b!182387 res!151577) b!182385))

(declare-fun m!283699 () Bool)

(assert (=> b!182387 m!283699))

(assert (=> b!182389 m!283503))

(declare-fun m!283701 () Bool)

(assert (=> b!182389 m!283701))

(declare-fun m!283703 () Bool)

(assert (=> b!182389 m!283703))

(declare-fun m!283705 () Bool)

(assert (=> b!182388 m!283705))

(declare-fun m!283707 () Bool)

(assert (=> d!63235 m!283707))

(declare-fun m!283709 () Bool)

(assert (=> d!63235 m!283709))

(declare-fun m!283711 () Bool)

(assert (=> d!63235 m!283711))

(assert (=> d!63235 m!283673))

(assert (=> d!63235 m!283515))

(declare-fun m!283713 () Bool)

(assert (=> d!63235 m!283713))

(declare-fun m!283715 () Bool)

(assert (=> d!63235 m!283715))

(declare-fun m!283717 () Bool)

(assert (=> d!63235 m!283717))

(declare-fun m!283719 () Bool)

(assert (=> d!63235 m!283719))

(assert (=> d!63235 m!283683))

(declare-fun m!283721 () Bool)

(assert (=> d!63235 m!283721))

(declare-fun m!283723 () Bool)

(assert (=> b!182385 m!283723))

(assert (=> b!182385 m!283513))

(assert (=> b!182385 m!283503))

(assert (=> b!182287 d!63235))

(declare-fun d!63237 () Bool)

(assert (=> d!63237 (= (array_inv!4033 (buf!4741 thiss!1204)) (bvsge (size!4292 (buf!4741 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!182288 d!63237))

(declare-fun d!63239 () Bool)

(declare-fun res!151578 () Bool)

(declare-fun e!126590 () Bool)

(assert (=> d!63239 (=> (not res!151578) (not e!126590))))

(assert (=> d!63239 (= res!151578 (= (size!4292 (buf!4741 (_2!8520 lt!279801))) (size!4292 (buf!4741 (_2!8520 lt!279795)))))))

(assert (=> d!63239 (= (isPrefixOf!0 (_2!8520 lt!279801) (_2!8520 lt!279795)) e!126590)))

(declare-fun b!182390 () Bool)

(declare-fun res!151580 () Bool)

(assert (=> b!182390 (=> (not res!151580) (not e!126590))))

(assert (=> b!182390 (= res!151580 (bvsle (bitIndex!0 (size!4292 (buf!4741 (_2!8520 lt!279801))) (currentByte!8963 (_2!8520 lt!279801)) (currentBit!8958 (_2!8520 lt!279801))) (bitIndex!0 (size!4292 (buf!4741 (_2!8520 lt!279795))) (currentByte!8963 (_2!8520 lt!279795)) (currentBit!8958 (_2!8520 lt!279795)))))))

(declare-fun b!182391 () Bool)

(declare-fun e!126591 () Bool)

(assert (=> b!182391 (= e!126590 e!126591)))

(declare-fun res!151579 () Bool)

(assert (=> b!182391 (=> res!151579 e!126591)))

(assert (=> b!182391 (= res!151579 (= (size!4292 (buf!4741 (_2!8520 lt!279801))) #b00000000000000000000000000000000))))

(declare-fun b!182392 () Bool)

(assert (=> b!182392 (= e!126591 (arrayBitRangesEq!0 (buf!4741 (_2!8520 lt!279801)) (buf!4741 (_2!8520 lt!279795)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4292 (buf!4741 (_2!8520 lt!279801))) (currentByte!8963 (_2!8520 lt!279801)) (currentBit!8958 (_2!8520 lt!279801)))))))

(assert (= (and d!63239 res!151578) b!182390))

(assert (= (and b!182390 res!151580) b!182391))

(assert (= (and b!182391 (not res!151579)) b!182392))

(assert (=> b!182390 m!283501))

(assert (=> b!182390 m!283513))

(assert (=> b!182392 m!283501))

(assert (=> b!182392 m!283501))

(declare-fun m!283725 () Bool)

(assert (=> b!182392 m!283725))

(assert (=> b!182291 d!63239))

(declare-fun d!63241 () Bool)

(declare-fun lt!280004 () tuple2!15764)

(assert (=> d!63241 (= lt!280004 (readBit!0 (readerFrom!0 (_2!8520 lt!279801) (currentBit!8958 thiss!1204) (currentByte!8963 thiss!1204))))))

(assert (=> d!63241 (= (readBitPure!0 (readerFrom!0 (_2!8520 lt!279801) (currentBit!8958 thiss!1204) (currentByte!8963 thiss!1204))) (tuple2!15753 (_2!8527 lt!280004) (_1!8527 lt!280004)))))

(declare-fun bs!15756 () Bool)

(assert (= bs!15756 d!63241))

(assert (=> bs!15756 m!283553))

(declare-fun m!283727 () Bool)

(assert (=> bs!15756 m!283727))

(assert (=> b!182281 d!63241))

(declare-fun d!63243 () Bool)

(declare-fun e!126594 () Bool)

(assert (=> d!63243 e!126594))

(declare-fun res!151584 () Bool)

(assert (=> d!63243 (=> (not res!151584) (not e!126594))))

(assert (=> d!63243 (= res!151584 (invariant!0 (currentBit!8958 (_2!8520 lt!279801)) (currentByte!8963 (_2!8520 lt!279801)) (size!4292 (buf!4741 (_2!8520 lt!279801)))))))

(assert (=> d!63243 (= (readerFrom!0 (_2!8520 lt!279801) (currentBit!8958 thiss!1204) (currentByte!8963 thiss!1204)) (BitStream!7693 (buf!4741 (_2!8520 lt!279801)) (currentByte!8963 thiss!1204) (currentBit!8958 thiss!1204)))))

(declare-fun b!182395 () Bool)

(assert (=> b!182395 (= e!126594 (invariant!0 (currentBit!8958 thiss!1204) (currentByte!8963 thiss!1204) (size!4292 (buf!4741 (_2!8520 lt!279801)))))))

(assert (= (and d!63243 res!151584) b!182395))

(declare-fun m!283729 () Bool)

(assert (=> d!63243 m!283729))

(assert (=> b!182395 m!283547))

(assert (=> b!182281 d!63243))

(declare-fun d!63245 () Bool)

(assert (=> d!63245 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4292 (buf!4741 (_1!8519 lt!279802)))) ((_ sign_extend 32) (currentByte!8963 (_1!8519 lt!279802))) ((_ sign_extend 32) (currentBit!8958 (_1!8519 lt!279802))) ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4292 (buf!4741 (_1!8519 lt!279802)))) ((_ sign_extend 32) (currentByte!8963 (_1!8519 lt!279802))) ((_ sign_extend 32) (currentBit!8958 (_1!8519 lt!279802)))) ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun bs!15757 () Bool)

(assert (= bs!15757 d!63245))

(declare-fun m!283731 () Bool)

(assert (=> bs!15757 m!283731))

(assert (=> b!182279 d!63245))

(declare-fun d!63247 () Bool)

(assert (=> d!63247 (= (invariant!0 (currentBit!8958 thiss!1204) (currentByte!8963 thiss!1204) (size!4292 (buf!4741 thiss!1204))) (and (bvsge (currentBit!8958 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8958 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8963 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8963 thiss!1204) (size!4292 (buf!4741 thiss!1204))) (and (= (currentBit!8958 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8963 thiss!1204) (size!4292 (buf!4741 thiss!1204)))))))))

(assert (=> b!182290 d!63247))

(declare-fun d!63249 () Bool)

(assert (=> d!63249 (= (invariant!0 (currentBit!8958 thiss!1204) (currentByte!8963 thiss!1204) (size!4292 (buf!4741 (_2!8520 lt!279795)))) (and (bvsge (currentBit!8958 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8958 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8963 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8963 thiss!1204) (size!4292 (buf!4741 (_2!8520 lt!279795)))) (and (= (currentBit!8958 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8963 thiss!1204) (size!4292 (buf!4741 (_2!8520 lt!279795))))))))))

(assert (=> b!182280 d!63249))

(declare-fun d!63251 () Bool)

(assert (=> d!63251 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4292 (buf!4741 thiss!1204))) ((_ sign_extend 32) (currentByte!8963 thiss!1204)) ((_ sign_extend 32) (currentBit!8958 thiss!1204)) lt!279793) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4292 (buf!4741 thiss!1204))) ((_ sign_extend 32) (currentByte!8963 thiss!1204)) ((_ sign_extend 32) (currentBit!8958 thiss!1204))) lt!279793))))

(declare-fun bs!15758 () Bool)

(assert (= bs!15758 d!63251))

(declare-fun m!283733 () Bool)

(assert (=> bs!15758 m!283733))

(assert (=> b!182283 d!63251))

(declare-fun d!63253 () Bool)

(assert (=> d!63253 (= (inv!12 thiss!1204) (invariant!0 (currentBit!8958 thiss!1204) (currentByte!8963 thiss!1204) (size!4292 (buf!4741 thiss!1204))))))

(declare-fun bs!15759 () Bool)

(assert (= bs!15759 d!63253))

(assert (=> bs!15759 m!283507))

(assert (=> start!39970 d!63253))

(declare-fun d!63255 () Bool)

(declare-fun e!126595 () Bool)

(assert (=> d!63255 e!126595))

(declare-fun res!151585 () Bool)

(assert (=> d!63255 (=> (not res!151585) (not e!126595))))

(declare-fun lt!280006 () (_ BitVec 64))

(declare-fun lt!280009 () (_ BitVec 64))

(declare-fun lt!280007 () (_ BitVec 64))

(assert (=> d!63255 (= res!151585 (= lt!280009 (bvsub lt!280006 lt!280007)))))

(assert (=> d!63255 (or (= (bvand lt!280006 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!280007 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!280006 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!280006 lt!280007) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63255 (= lt!280007 (remainingBits!0 ((_ sign_extend 32) (size!4292 (buf!4741 (_2!8520 lt!279801)))) ((_ sign_extend 32) (currentByte!8963 (_2!8520 lt!279801))) ((_ sign_extend 32) (currentBit!8958 (_2!8520 lt!279801)))))))

(declare-fun lt!280005 () (_ BitVec 64))

(declare-fun lt!280010 () (_ BitVec 64))

(assert (=> d!63255 (= lt!280006 (bvmul lt!280005 lt!280010))))

(assert (=> d!63255 (or (= lt!280005 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!280010 (bvsdiv (bvmul lt!280005 lt!280010) lt!280005)))))

(assert (=> d!63255 (= lt!280010 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63255 (= lt!280005 ((_ sign_extend 32) (size!4292 (buf!4741 (_2!8520 lt!279801)))))))

(assert (=> d!63255 (= lt!280009 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8963 (_2!8520 lt!279801))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8958 (_2!8520 lt!279801)))))))

(assert (=> d!63255 (invariant!0 (currentBit!8958 (_2!8520 lt!279801)) (currentByte!8963 (_2!8520 lt!279801)) (size!4292 (buf!4741 (_2!8520 lt!279801))))))

(assert (=> d!63255 (= (bitIndex!0 (size!4292 (buf!4741 (_2!8520 lt!279801))) (currentByte!8963 (_2!8520 lt!279801)) (currentBit!8958 (_2!8520 lt!279801))) lt!280009)))

(declare-fun b!182396 () Bool)

(declare-fun res!151586 () Bool)

(assert (=> b!182396 (=> (not res!151586) (not e!126595))))

(assert (=> b!182396 (= res!151586 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!280009))))

(declare-fun b!182397 () Bool)

(declare-fun lt!280008 () (_ BitVec 64))

(assert (=> b!182397 (= e!126595 (bvsle lt!280009 (bvmul lt!280008 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!182397 (or (= lt!280008 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!280008 #b0000000000000000000000000000000000000000000000000000000000001000) lt!280008)))))

(assert (=> b!182397 (= lt!280008 ((_ sign_extend 32) (size!4292 (buf!4741 (_2!8520 lt!279801)))))))

(assert (= (and d!63255 res!151585) b!182396))

(assert (= (and b!182396 res!151586) b!182397))

(declare-fun m!283735 () Bool)

(assert (=> d!63255 m!283735))

(assert (=> d!63255 m!283729))

(assert (=> b!182294 d!63255))

(declare-fun d!63257 () Bool)

(declare-fun e!126596 () Bool)

(assert (=> d!63257 e!126596))

(declare-fun res!151587 () Bool)

(assert (=> d!63257 (=> (not res!151587) (not e!126596))))

(declare-fun lt!280015 () (_ BitVec 64))

(declare-fun lt!280012 () (_ BitVec 64))

(declare-fun lt!280013 () (_ BitVec 64))

(assert (=> d!63257 (= res!151587 (= lt!280015 (bvsub lt!280012 lt!280013)))))

(assert (=> d!63257 (or (= (bvand lt!280012 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!280013 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!280012 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!280012 lt!280013) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63257 (= lt!280013 (remainingBits!0 ((_ sign_extend 32) (size!4292 (buf!4741 thiss!1204))) ((_ sign_extend 32) (currentByte!8963 thiss!1204)) ((_ sign_extend 32) (currentBit!8958 thiss!1204))))))

(declare-fun lt!280011 () (_ BitVec 64))

(declare-fun lt!280016 () (_ BitVec 64))

(assert (=> d!63257 (= lt!280012 (bvmul lt!280011 lt!280016))))

(assert (=> d!63257 (or (= lt!280011 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!280016 (bvsdiv (bvmul lt!280011 lt!280016) lt!280011)))))

(assert (=> d!63257 (= lt!280016 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63257 (= lt!280011 ((_ sign_extend 32) (size!4292 (buf!4741 thiss!1204))))))

(assert (=> d!63257 (= lt!280015 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8963 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8958 thiss!1204))))))

(assert (=> d!63257 (invariant!0 (currentBit!8958 thiss!1204) (currentByte!8963 thiss!1204) (size!4292 (buf!4741 thiss!1204)))))

(assert (=> d!63257 (= (bitIndex!0 (size!4292 (buf!4741 thiss!1204)) (currentByte!8963 thiss!1204) (currentBit!8958 thiss!1204)) lt!280015)))

(declare-fun b!182398 () Bool)

(declare-fun res!151588 () Bool)

(assert (=> b!182398 (=> (not res!151588) (not e!126596))))

(assert (=> b!182398 (= res!151588 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!280015))))

(declare-fun b!182399 () Bool)

(declare-fun lt!280014 () (_ BitVec 64))

(assert (=> b!182399 (= e!126596 (bvsle lt!280015 (bvmul lt!280014 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!182399 (or (= lt!280014 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!280014 #b0000000000000000000000000000000000000000000000000000000000001000) lt!280014)))))

(assert (=> b!182399 (= lt!280014 ((_ sign_extend 32) (size!4292 (buf!4741 thiss!1204))))))

(assert (= (and d!63257 res!151587) b!182398))

(assert (= (and b!182398 res!151588) b!182399))

(assert (=> d!63257 m!283733))

(assert (=> d!63257 m!283507))

(assert (=> b!182294 d!63257))

(declare-fun b!182412 () Bool)

(declare-fun e!126601 () Bool)

(declare-fun lt!280026 () tuple2!15752)

(declare-fun lt!280027 () tuple2!15750)

(assert (=> b!182412 (= e!126601 (= (bitIndex!0 (size!4292 (buf!4741 (_1!8521 lt!280026))) (currentByte!8963 (_1!8521 lt!280026)) (currentBit!8958 (_1!8521 lt!280026))) (bitIndex!0 (size!4292 (buf!4741 (_2!8520 lt!280027))) (currentByte!8963 (_2!8520 lt!280027)) (currentBit!8958 (_2!8520 lt!280027)))))))

(declare-fun b!182411 () Bool)

(declare-fun e!126602 () Bool)

(assert (=> b!182411 (= e!126602 e!126601)))

(declare-fun res!151600 () Bool)

(assert (=> b!182411 (=> (not res!151600) (not e!126601))))

(assert (=> b!182411 (= res!151600 (and (= (_2!8521 lt!280026) lt!279810) (= (_1!8521 lt!280026) (_2!8520 lt!280027))))))

(assert (=> b!182411 (= lt!280026 (readBitPure!0 (readerFrom!0 (_2!8520 lt!280027) (currentBit!8958 thiss!1204) (currentByte!8963 thiss!1204))))))

(declare-fun d!63259 () Bool)

(assert (=> d!63259 e!126602))

(declare-fun res!151599 () Bool)

(assert (=> d!63259 (=> (not res!151599) (not e!126602))))

(assert (=> d!63259 (= res!151599 (= (size!4292 (buf!4741 thiss!1204)) (size!4292 (buf!4741 (_2!8520 lt!280027)))))))

(declare-fun choose!16 (BitStream!7692 Bool) tuple2!15750)

(assert (=> d!63259 (= lt!280027 (choose!16 thiss!1204 lt!279810))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!63259 (validate_offset_bit!0 ((_ sign_extend 32) (size!4292 (buf!4741 thiss!1204))) ((_ sign_extend 32) (currentByte!8963 thiss!1204)) ((_ sign_extend 32) (currentBit!8958 thiss!1204)))))

(assert (=> d!63259 (= (appendBit!0 thiss!1204 lt!279810) lt!280027)))

(declare-fun b!182410 () Bool)

(declare-fun res!151598 () Bool)

(assert (=> b!182410 (=> (not res!151598) (not e!126602))))

(assert (=> b!182410 (= res!151598 (isPrefixOf!0 thiss!1204 (_2!8520 lt!280027)))))

(declare-fun b!182409 () Bool)

(declare-fun res!151597 () Bool)

(assert (=> b!182409 (=> (not res!151597) (not e!126602))))

(declare-fun lt!280028 () (_ BitVec 64))

(declare-fun lt!280025 () (_ BitVec 64))

(assert (=> b!182409 (= res!151597 (= (bitIndex!0 (size!4292 (buf!4741 (_2!8520 lt!280027))) (currentByte!8963 (_2!8520 lt!280027)) (currentBit!8958 (_2!8520 lt!280027))) (bvadd lt!280025 lt!280028)))))

(assert (=> b!182409 (or (not (= (bvand lt!280025 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!280028 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!280025 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!280025 lt!280028) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!182409 (= lt!280028 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!182409 (= lt!280025 (bitIndex!0 (size!4292 (buf!4741 thiss!1204)) (currentByte!8963 thiss!1204) (currentBit!8958 thiss!1204)))))

(assert (= (and d!63259 res!151599) b!182409))

(assert (= (and b!182409 res!151597) b!182410))

(assert (= (and b!182410 res!151598) b!182411))

(assert (= (and b!182411 res!151600) b!182412))

(declare-fun m!283737 () Bool)

(assert (=> b!182411 m!283737))

(assert (=> b!182411 m!283737))

(declare-fun m!283739 () Bool)

(assert (=> b!182411 m!283739))

(declare-fun m!283741 () Bool)

(assert (=> b!182412 m!283741))

(declare-fun m!283743 () Bool)

(assert (=> b!182412 m!283743))

(declare-fun m!283745 () Bool)

(assert (=> d!63259 m!283745))

(declare-fun m!283747 () Bool)

(assert (=> d!63259 m!283747))

(declare-fun m!283749 () Bool)

(assert (=> b!182410 m!283749))

(assert (=> b!182409 m!283743))

(assert (=> b!182409 m!283503))

(assert (=> b!182294 d!63259))

(declare-fun d!63261 () Bool)

(declare-fun e!126603 () Bool)

(assert (=> d!63261 e!126603))

(declare-fun res!151601 () Bool)

(assert (=> d!63261 (=> (not res!151601) (not e!126603))))

(declare-fun lt!280031 () (_ BitVec 64))

(declare-fun lt!280033 () (_ BitVec 64))

(declare-fun lt!280030 () (_ BitVec 64))

(assert (=> d!63261 (= res!151601 (= lt!280033 (bvsub lt!280030 lt!280031)))))

(assert (=> d!63261 (or (= (bvand lt!280030 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!280031 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!280030 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!280030 lt!280031) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63261 (= lt!280031 (remainingBits!0 ((_ sign_extend 32) (size!4292 (buf!4741 (_1!8521 lt!279807)))) ((_ sign_extend 32) (currentByte!8963 (_1!8521 lt!279807))) ((_ sign_extend 32) (currentBit!8958 (_1!8521 lt!279807)))))))

(declare-fun lt!280029 () (_ BitVec 64))

(declare-fun lt!280034 () (_ BitVec 64))

(assert (=> d!63261 (= lt!280030 (bvmul lt!280029 lt!280034))))

(assert (=> d!63261 (or (= lt!280029 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!280034 (bvsdiv (bvmul lt!280029 lt!280034) lt!280029)))))

(assert (=> d!63261 (= lt!280034 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63261 (= lt!280029 ((_ sign_extend 32) (size!4292 (buf!4741 (_1!8521 lt!279807)))))))

(assert (=> d!63261 (= lt!280033 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8963 (_1!8521 lt!279807))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8958 (_1!8521 lt!279807)))))))

(assert (=> d!63261 (invariant!0 (currentBit!8958 (_1!8521 lt!279807)) (currentByte!8963 (_1!8521 lt!279807)) (size!4292 (buf!4741 (_1!8521 lt!279807))))))

(assert (=> d!63261 (= (bitIndex!0 (size!4292 (buf!4741 (_1!8521 lt!279807))) (currentByte!8963 (_1!8521 lt!279807)) (currentBit!8958 (_1!8521 lt!279807))) lt!280033)))

(declare-fun b!182413 () Bool)

(declare-fun res!151602 () Bool)

(assert (=> b!182413 (=> (not res!151602) (not e!126603))))

(assert (=> b!182413 (= res!151602 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!280033))))

(declare-fun b!182414 () Bool)

(declare-fun lt!280032 () (_ BitVec 64))

(assert (=> b!182414 (= e!126603 (bvsle lt!280033 (bvmul lt!280032 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!182414 (or (= lt!280032 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!280032 #b0000000000000000000000000000000000000000000000000000000000001000) lt!280032)))))

(assert (=> b!182414 (= lt!280032 ((_ sign_extend 32) (size!4292 (buf!4741 (_1!8521 lt!279807)))))))

(assert (= (and d!63261 res!151601) b!182413))

(assert (= (and b!182413 res!151602) b!182414))

(declare-fun m!283751 () Bool)

(assert (=> d!63261 m!283751))

(declare-fun m!283753 () Bool)

(assert (=> d!63261 m!283753))

(assert (=> b!182284 d!63261))

(declare-fun d!63263 () Bool)

(declare-fun e!126604 () Bool)

(assert (=> d!63263 e!126604))

(declare-fun res!151603 () Bool)

(assert (=> d!63263 (=> (not res!151603) (not e!126604))))

(declare-fun lt!280039 () (_ BitVec 64))

(declare-fun lt!280037 () (_ BitVec 64))

(declare-fun lt!280036 () (_ BitVec 64))

(assert (=> d!63263 (= res!151603 (= lt!280039 (bvsub lt!280036 lt!280037)))))

(assert (=> d!63263 (or (= (bvand lt!280036 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!280037 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!280036 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!280036 lt!280037) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63263 (= lt!280037 (remainingBits!0 ((_ sign_extend 32) (size!4292 (buf!4741 (_2!8520 lt!279795)))) ((_ sign_extend 32) (currentByte!8963 (_2!8520 lt!279795))) ((_ sign_extend 32) (currentBit!8958 (_2!8520 lt!279795)))))))

(declare-fun lt!280035 () (_ BitVec 64))

(declare-fun lt!280040 () (_ BitVec 64))

(assert (=> d!63263 (= lt!280036 (bvmul lt!280035 lt!280040))))

(assert (=> d!63263 (or (= lt!280035 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!280040 (bvsdiv (bvmul lt!280035 lt!280040) lt!280035)))))

(assert (=> d!63263 (= lt!280040 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63263 (= lt!280035 ((_ sign_extend 32) (size!4292 (buf!4741 (_2!8520 lt!279795)))))))

(assert (=> d!63263 (= lt!280039 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8963 (_2!8520 lt!279795))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8958 (_2!8520 lt!279795)))))))

(assert (=> d!63263 (invariant!0 (currentBit!8958 (_2!8520 lt!279795)) (currentByte!8963 (_2!8520 lt!279795)) (size!4292 (buf!4741 (_2!8520 lt!279795))))))

(assert (=> d!63263 (= (bitIndex!0 (size!4292 (buf!4741 (_2!8520 lt!279795))) (currentByte!8963 (_2!8520 lt!279795)) (currentBit!8958 (_2!8520 lt!279795))) lt!280039)))

(declare-fun b!182415 () Bool)

(declare-fun res!151604 () Bool)

(assert (=> b!182415 (=> (not res!151604) (not e!126604))))

(assert (=> b!182415 (= res!151604 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!280039))))

(declare-fun b!182416 () Bool)

(declare-fun lt!280038 () (_ BitVec 64))

(assert (=> b!182416 (= e!126604 (bvsle lt!280039 (bvmul lt!280038 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!182416 (or (= lt!280038 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!280038 #b0000000000000000000000000000000000000000000000000000000000001000) lt!280038)))))

(assert (=> b!182416 (= lt!280038 ((_ sign_extend 32) (size!4292 (buf!4741 (_2!8520 lt!279795)))))))

(assert (= (and d!63263 res!151603) b!182415))

(assert (= (and b!182415 res!151604) b!182416))

(declare-fun m!283755 () Bool)

(assert (=> d!63263 m!283755))

(assert (=> d!63263 m!283499))

(assert (=> b!182282 d!63263))

(declare-fun d!63265 () Bool)

(declare-fun res!151605 () Bool)

(declare-fun e!126605 () Bool)

(assert (=> d!63265 (=> (not res!151605) (not e!126605))))

(assert (=> d!63265 (= res!151605 (= (size!4292 (buf!4741 thiss!1204)) (size!4292 (buf!4741 (_2!8520 lt!279795)))))))

(assert (=> d!63265 (= (isPrefixOf!0 thiss!1204 (_2!8520 lt!279795)) e!126605)))

(declare-fun b!182417 () Bool)

(declare-fun res!151607 () Bool)

(assert (=> b!182417 (=> (not res!151607) (not e!126605))))

(assert (=> b!182417 (= res!151607 (bvsle (bitIndex!0 (size!4292 (buf!4741 thiss!1204)) (currentByte!8963 thiss!1204) (currentBit!8958 thiss!1204)) (bitIndex!0 (size!4292 (buf!4741 (_2!8520 lt!279795))) (currentByte!8963 (_2!8520 lt!279795)) (currentBit!8958 (_2!8520 lt!279795)))))))

(declare-fun b!182418 () Bool)

(declare-fun e!126606 () Bool)

(assert (=> b!182418 (= e!126605 e!126606)))

(declare-fun res!151606 () Bool)

(assert (=> b!182418 (=> res!151606 e!126606)))

(assert (=> b!182418 (= res!151606 (= (size!4292 (buf!4741 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!182419 () Bool)

(assert (=> b!182419 (= e!126606 (arrayBitRangesEq!0 (buf!4741 thiss!1204) (buf!4741 (_2!8520 lt!279795)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4292 (buf!4741 thiss!1204)) (currentByte!8963 thiss!1204) (currentBit!8958 thiss!1204))))))

(assert (= (and d!63265 res!151605) b!182417))

(assert (= (and b!182417 res!151607) b!182418))

(assert (= (and b!182418 (not res!151606)) b!182419))

(assert (=> b!182417 m!283503))

(assert (=> b!182417 m!283513))

(assert (=> b!182419 m!283503))

(assert (=> b!182419 m!283503))

(declare-fun m!283757 () Bool)

(assert (=> b!182419 m!283757))

(assert (=> b!182282 d!63265))

(declare-fun d!63267 () Bool)

(assert (=> d!63267 (isPrefixOf!0 thiss!1204 (_2!8520 lt!279795))))

(declare-fun lt!280043 () Unit!13081)

(declare-fun choose!30 (BitStream!7692 BitStream!7692 BitStream!7692) Unit!13081)

(assert (=> d!63267 (= lt!280043 (choose!30 thiss!1204 (_2!8520 lt!279801) (_2!8520 lt!279795)))))

(assert (=> d!63267 (isPrefixOf!0 thiss!1204 (_2!8520 lt!279801))))

(assert (=> d!63267 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8520 lt!279801) (_2!8520 lt!279795)) lt!280043)))

(declare-fun bs!15760 () Bool)

(assert (= bs!15760 d!63267))

(assert (=> bs!15760 m!283515))

(declare-fun m!283759 () Bool)

(assert (=> bs!15760 m!283759))

(assert (=> bs!15760 m!283509))

(assert (=> b!182282 d!63267))

(declare-fun b!182597 () Bool)

(declare-fun res!151757 () Bool)

(declare-fun e!126712 () Bool)

(assert (=> b!182597 (=> (not res!151757) (not e!126712))))

(declare-fun lt!280549 () tuple2!15750)

(assert (=> b!182597 (= res!151757 (isPrefixOf!0 (_2!8520 lt!279801) (_2!8520 lt!280549)))))

(declare-fun b!182598 () Bool)

(declare-fun res!151758 () Bool)

(declare-fun lt!280586 () tuple2!15750)

(assert (=> b!182598 (= res!151758 (= (bitIndex!0 (size!4292 (buf!4741 (_2!8520 lt!280586))) (currentByte!8963 (_2!8520 lt!280586)) (currentBit!8958 (_2!8520 lt!280586))) (bvadd (bitIndex!0 (size!4292 (buf!4741 (_2!8520 lt!279801))) (currentByte!8963 (_2!8520 lt!279801)) (currentBit!8958 (_2!8520 lt!279801))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!126711 () Bool)

(assert (=> b!182598 (=> (not res!151758) (not e!126711))))

(declare-fun b!182599 () Bool)

(declare-fun e!126714 () Bool)

(declare-fun lt!280585 () tuple2!15754)

(declare-fun lt!280571 () tuple2!15748)

(assert (=> b!182599 (= e!126714 (= (_1!8522 lt!280585) (_2!8519 lt!280571)))))

(declare-fun b!182600 () Bool)

(declare-fun e!126708 () (_ BitVec 64))

(assert (=> b!182600 (= e!126708 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun d!63269 () Bool)

(assert (=> d!63269 e!126712))

(declare-fun res!151762 () Bool)

(assert (=> d!63269 (=> (not res!151762) (not e!126712))))

(assert (=> d!63269 (= res!151762 (invariant!0 (currentBit!8958 (_2!8520 lt!280549)) (currentByte!8963 (_2!8520 lt!280549)) (size!4292 (buf!4741 (_2!8520 lt!280549)))))))

(declare-fun e!126707 () tuple2!15750)

(assert (=> d!63269 (= lt!280549 e!126707)))

(declare-fun c!9386 () Bool)

(assert (=> d!63269 (= c!9386 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!63269 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!63269 (= (appendBitsLSBFirstLoopTR!0 (_2!8520 lt!279801) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!280549)))

(declare-fun b!182601 () Bool)

(declare-fun e!126706 () Bool)

(declare-fun lt!280536 () tuple2!15754)

(declare-fun lt!280552 () tuple2!15748)

(assert (=> b!182601 (= e!126706 (= (_1!8522 lt!280536) (_2!8519 lt!280552)))))

(declare-fun b!182602 () Bool)

(declare-fun lt!280569 () tuple2!15750)

(assert (=> b!182602 (= e!126707 (tuple2!15751 (_1!8520 lt!280569) (_2!8520 lt!280569)))))

(declare-fun lt!280535 () Bool)

(assert (=> b!182602 (= lt!280535 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!182602 (= lt!280586 (appendBit!0 (_2!8520 lt!279801) lt!280535))))

(declare-fun res!151766 () Bool)

(assert (=> b!182602 (= res!151766 (= (size!4292 (buf!4741 (_2!8520 lt!279801))) (size!4292 (buf!4741 (_2!8520 lt!280586)))))))

(assert (=> b!182602 (=> (not res!151766) (not e!126711))))

(assert (=> b!182602 e!126711))

(declare-fun lt!280579 () tuple2!15750)

(assert (=> b!182602 (= lt!280579 lt!280586)))

(assert (=> b!182602 (= lt!280569 (appendBitsLSBFirstLoopTR!0 (_2!8520 lt!280579) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!280584 () Unit!13081)

(assert (=> b!182602 (= lt!280584 (lemmaIsPrefixTransitive!0 (_2!8520 lt!279801) (_2!8520 lt!280579) (_2!8520 lt!280569)))))

(declare-fun call!2960 () Bool)

(assert (=> b!182602 call!2960))

(declare-fun lt!280582 () Unit!13081)

(assert (=> b!182602 (= lt!280582 lt!280584)))

(assert (=> b!182602 (invariant!0 (currentBit!8958 (_2!8520 lt!279801)) (currentByte!8963 (_2!8520 lt!279801)) (size!4292 (buf!4741 (_2!8520 lt!280579))))))

(declare-fun lt!280564 () BitStream!7692)

(assert (=> b!182602 (= lt!280564 (BitStream!7693 (buf!4741 (_2!8520 lt!280579)) (currentByte!8963 (_2!8520 lt!279801)) (currentBit!8958 (_2!8520 lt!279801))))))

(assert (=> b!182602 (invariant!0 (currentBit!8958 lt!280564) (currentByte!8963 lt!280564) (size!4292 (buf!4741 (_2!8520 lt!280569))))))

(declare-fun lt!280545 () BitStream!7692)

(assert (=> b!182602 (= lt!280545 (BitStream!7693 (buf!4741 (_2!8520 lt!280569)) (currentByte!8963 lt!280564) (currentBit!8958 lt!280564)))))

(declare-fun lt!280557 () tuple2!15752)

(assert (=> b!182602 (= lt!280557 (readBitPure!0 lt!280564))))

(declare-fun lt!280542 () tuple2!15752)

(assert (=> b!182602 (= lt!280542 (readBitPure!0 lt!280545))))

(declare-fun lt!280539 () Unit!13081)

(assert (=> b!182602 (= lt!280539 (readBitPrefixLemma!0 lt!280564 (_2!8520 lt!280569)))))

(declare-fun res!151761 () Bool)

(assert (=> b!182602 (= res!151761 (= (bitIndex!0 (size!4292 (buf!4741 (_1!8521 lt!280557))) (currentByte!8963 (_1!8521 lt!280557)) (currentBit!8958 (_1!8521 lt!280557))) (bitIndex!0 (size!4292 (buf!4741 (_1!8521 lt!280542))) (currentByte!8963 (_1!8521 lt!280542)) (currentBit!8958 (_1!8521 lt!280542)))))))

(declare-fun e!126709 () Bool)

(assert (=> b!182602 (=> (not res!151761) (not e!126709))))

(assert (=> b!182602 e!126709))

(declare-fun lt!280562 () Unit!13081)

(assert (=> b!182602 (= lt!280562 lt!280539)))

(declare-fun lt!280551 () tuple2!15748)

(assert (=> b!182602 (= lt!280551 (reader!0 (_2!8520 lt!279801) (_2!8520 lt!280569)))))

(declare-fun lt!280540 () tuple2!15748)

(assert (=> b!182602 (= lt!280540 (reader!0 (_2!8520 lt!280579) (_2!8520 lt!280569)))))

(declare-fun lt!280563 () tuple2!15752)

(assert (=> b!182602 (= lt!280563 (readBitPure!0 (_1!8519 lt!280551)))))

(assert (=> b!182602 (= (_2!8521 lt!280563) lt!280535)))

(declare-fun lt!280568 () Unit!13081)

(declare-fun Unit!13100 () Unit!13081)

(assert (=> b!182602 (= lt!280568 Unit!13100)))

(declare-fun lt!280543 () (_ BitVec 64))

(assert (=> b!182602 (= lt!280543 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!280572 () (_ BitVec 64))

(assert (=> b!182602 (= lt!280572 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!280566 () Unit!13081)

(assert (=> b!182602 (= lt!280566 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8520 lt!279801) (buf!4741 (_2!8520 lt!280569)) lt!280572))))

(assert (=> b!182602 (validate_offset_bits!1 ((_ sign_extend 32) (size!4292 (buf!4741 (_2!8520 lt!280569)))) ((_ sign_extend 32) (currentByte!8963 (_2!8520 lt!279801))) ((_ sign_extend 32) (currentBit!8958 (_2!8520 lt!279801))) lt!280572)))

(declare-fun lt!280580 () Unit!13081)

(assert (=> b!182602 (= lt!280580 lt!280566)))

(declare-fun lt!280534 () tuple2!15754)

(assert (=> b!182602 (= lt!280534 (readNBitsLSBFirstsLoopPure!0 (_1!8519 lt!280551) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!280543))))

(declare-fun lt!280567 () (_ BitVec 64))

(assert (=> b!182602 (= lt!280567 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!280560 () Unit!13081)

(assert (=> b!182602 (= lt!280560 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8520 lt!280579) (buf!4741 (_2!8520 lt!280569)) lt!280567))))

(assert (=> b!182602 (validate_offset_bits!1 ((_ sign_extend 32) (size!4292 (buf!4741 (_2!8520 lt!280569)))) ((_ sign_extend 32) (currentByte!8963 (_2!8520 lt!280579))) ((_ sign_extend 32) (currentBit!8958 (_2!8520 lt!280579))) lt!280567)))

(declare-fun lt!280561 () Unit!13081)

(assert (=> b!182602 (= lt!280561 lt!280560)))

(declare-fun lt!280532 () tuple2!15754)

(assert (=> b!182602 (= lt!280532 (readNBitsLSBFirstsLoopPure!0 (_1!8519 lt!280540) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!280543 (ite (_2!8521 lt!280563) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!280555 () tuple2!15754)

(assert (=> b!182602 (= lt!280555 (readNBitsLSBFirstsLoopPure!0 (_1!8519 lt!280551) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!280543))))

(declare-fun c!9385 () Bool)

(assert (=> b!182602 (= c!9385 (_2!8521 (readBitPure!0 (_1!8519 lt!280551))))))

(declare-fun lt!280578 () tuple2!15754)

(assert (=> b!182602 (= lt!280578 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8519 lt!280551) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!280543 e!126708)))))

(declare-fun lt!280544 () Unit!13081)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7692 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13081)

(assert (=> b!182602 (= lt!280544 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8519 lt!280551) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!280543))))

(assert (=> b!182602 (and (= (_2!8522 lt!280555) (_2!8522 lt!280578)) (= (_1!8522 lt!280555) (_1!8522 lt!280578)))))

(declare-fun lt!280531 () Unit!13081)

(assert (=> b!182602 (= lt!280531 lt!280544)))

(assert (=> b!182602 (= (_1!8519 lt!280551) (withMovedBitIndex!0 (_2!8519 lt!280551) (bvsub (bitIndex!0 (size!4292 (buf!4741 (_2!8520 lt!279801))) (currentByte!8963 (_2!8520 lt!279801)) (currentBit!8958 (_2!8520 lt!279801))) (bitIndex!0 (size!4292 (buf!4741 (_2!8520 lt!280569))) (currentByte!8963 (_2!8520 lt!280569)) (currentBit!8958 (_2!8520 lt!280569))))))))

(declare-fun lt!280550 () Unit!13081)

(declare-fun Unit!13101 () Unit!13081)

(assert (=> b!182602 (= lt!280550 Unit!13101)))

(assert (=> b!182602 (= (_1!8519 lt!280540) (withMovedBitIndex!0 (_2!8519 lt!280540) (bvsub (bitIndex!0 (size!4292 (buf!4741 (_2!8520 lt!280579))) (currentByte!8963 (_2!8520 lt!280579)) (currentBit!8958 (_2!8520 lt!280579))) (bitIndex!0 (size!4292 (buf!4741 (_2!8520 lt!280569))) (currentByte!8963 (_2!8520 lt!280569)) (currentBit!8958 (_2!8520 lt!280569))))))))

(declare-fun lt!280577 () Unit!13081)

(declare-fun Unit!13102 () Unit!13081)

(assert (=> b!182602 (= lt!280577 Unit!13102)))

(assert (=> b!182602 (= (bitIndex!0 (size!4292 (buf!4741 (_2!8520 lt!279801))) (currentByte!8963 (_2!8520 lt!279801)) (currentBit!8958 (_2!8520 lt!279801))) (bvsub (bitIndex!0 (size!4292 (buf!4741 (_2!8520 lt!280579))) (currentByte!8963 (_2!8520 lt!280579)) (currentBit!8958 (_2!8520 lt!280579))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!280547 () Unit!13081)

(declare-fun Unit!13103 () Unit!13081)

(assert (=> b!182602 (= lt!280547 Unit!13103)))

(assert (=> b!182602 (= (_2!8522 lt!280534) (_2!8522 lt!280532))))

(declare-fun lt!280576 () Unit!13081)

(declare-fun Unit!13104 () Unit!13081)

(assert (=> b!182602 (= lt!280576 Unit!13104)))

(assert (=> b!182602 (invariant!0 (currentBit!8958 (_2!8520 lt!280569)) (currentByte!8963 (_2!8520 lt!280569)) (size!4292 (buf!4741 (_2!8520 lt!280569))))))

(declare-fun lt!280559 () Unit!13081)

(declare-fun Unit!13105 () Unit!13081)

(assert (=> b!182602 (= lt!280559 Unit!13105)))

(assert (=> b!182602 (= (size!4292 (buf!4741 (_2!8520 lt!279801))) (size!4292 (buf!4741 (_2!8520 lt!280569))))))

(declare-fun lt!280574 () Unit!13081)

(declare-fun Unit!13106 () Unit!13081)

(assert (=> b!182602 (= lt!280574 Unit!13106)))

(assert (=> b!182602 (= (bitIndex!0 (size!4292 (buf!4741 (_2!8520 lt!280569))) (currentByte!8963 (_2!8520 lt!280569)) (currentBit!8958 (_2!8520 lt!280569))) (bvsub (bvadd (bitIndex!0 (size!4292 (buf!4741 (_2!8520 lt!279801))) (currentByte!8963 (_2!8520 lt!279801)) (currentBit!8958 (_2!8520 lt!279801))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!280573 () Unit!13081)

(declare-fun Unit!13107 () Unit!13081)

(assert (=> b!182602 (= lt!280573 Unit!13107)))

(declare-fun lt!280541 () Unit!13081)

(declare-fun Unit!13108 () Unit!13081)

(assert (=> b!182602 (= lt!280541 Unit!13108)))

(assert (=> b!182602 (= lt!280552 (reader!0 (_2!8520 lt!279801) (_2!8520 lt!280569)))))

(declare-fun lt!280558 () (_ BitVec 64))

(assert (=> b!182602 (= lt!280558 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!280583 () Unit!13081)

(assert (=> b!182602 (= lt!280583 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8520 lt!279801) (buf!4741 (_2!8520 lt!280569)) lt!280558))))

(assert (=> b!182602 (validate_offset_bits!1 ((_ sign_extend 32) (size!4292 (buf!4741 (_2!8520 lt!280569)))) ((_ sign_extend 32) (currentByte!8963 (_2!8520 lt!279801))) ((_ sign_extend 32) (currentBit!8958 (_2!8520 lt!279801))) lt!280558)))

(declare-fun lt!280565 () Unit!13081)

(assert (=> b!182602 (= lt!280565 lt!280583)))

(assert (=> b!182602 (= lt!280536 (readNBitsLSBFirstsLoopPure!0 (_1!8519 lt!280552) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!151759 () Bool)

(assert (=> b!182602 (= res!151759 (= (_2!8522 lt!280536) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!182602 (=> (not res!151759) (not e!126706))))

(assert (=> b!182602 e!126706))

(declare-fun lt!280537 () Unit!13081)

(declare-fun Unit!13109 () Unit!13081)

(assert (=> b!182602 (= lt!280537 Unit!13109)))

(declare-fun b!182603 () Bool)

(assert (=> b!182603 (= e!126709 (= (_2!8521 lt!280557) (_2!8521 lt!280542)))))

(declare-fun b!182604 () Bool)

(declare-fun lt!280556 () tuple2!15752)

(assert (=> b!182604 (= lt!280556 (readBitPure!0 (readerFrom!0 (_2!8520 lt!280586) (currentBit!8958 (_2!8520 lt!279801)) (currentByte!8963 (_2!8520 lt!279801)))))))

(declare-fun res!151767 () Bool)

(assert (=> b!182604 (= res!151767 (and (= (_2!8521 lt!280556) lt!280535) (= (_1!8521 lt!280556) (_2!8520 lt!280586))))))

(declare-fun e!126713 () Bool)

(assert (=> b!182604 (=> (not res!151767) (not e!126713))))

(assert (=> b!182604 (= e!126711 e!126713)))

(declare-fun b!182605 () Bool)

(declare-fun res!151764 () Bool)

(assert (=> b!182605 (=> (not res!151764) (not e!126712))))

(declare-fun lt!280581 () (_ BitVec 64))

(declare-fun lt!280570 () (_ BitVec 64))

(assert (=> b!182605 (= res!151764 (= (bitIndex!0 (size!4292 (buf!4741 (_2!8520 lt!280549))) (currentByte!8963 (_2!8520 lt!280549)) (currentBit!8958 (_2!8520 lt!280549))) (bvsub lt!280581 lt!280570)))))

(assert (=> b!182605 (or (= (bvand lt!280581 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!280570 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!280581 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!280581 lt!280570) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!182605 (= lt!280570 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!280538 () (_ BitVec 64))

(declare-fun lt!280546 () (_ BitVec 64))

(assert (=> b!182605 (= lt!280581 (bvadd lt!280538 lt!280546))))

(assert (=> b!182605 (or (not (= (bvand lt!280538 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!280546 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!280538 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!280538 lt!280546) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!182605 (= lt!280546 ((_ sign_extend 32) nBits!348))))

(assert (=> b!182605 (= lt!280538 (bitIndex!0 (size!4292 (buf!4741 (_2!8520 lt!279801))) (currentByte!8963 (_2!8520 lt!279801)) (currentBit!8958 (_2!8520 lt!279801))))))

(declare-fun b!182606 () Bool)

(assert (=> b!182606 (= e!126708 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!182607 () Bool)

(declare-fun e!126710 () Bool)

(declare-fun lt!280553 () (_ BitVec 64))

(assert (=> b!182607 (= e!126710 (validate_offset_bits!1 ((_ sign_extend 32) (size!4292 (buf!4741 (_2!8520 lt!279801)))) ((_ sign_extend 32) (currentByte!8963 (_2!8520 lt!279801))) ((_ sign_extend 32) (currentBit!8958 (_2!8520 lt!279801))) lt!280553))))

(declare-fun b!182608 () Bool)

(declare-fun res!151765 () Bool)

(assert (=> b!182608 (=> (not res!151765) (not e!126712))))

(assert (=> b!182608 (= res!151765 (= (size!4292 (buf!4741 (_2!8520 lt!279801))) (size!4292 (buf!4741 (_2!8520 lt!280549)))))))

(declare-fun b!182609 () Bool)

(declare-fun Unit!13110 () Unit!13081)

(assert (=> b!182609 (= e!126707 (tuple2!15751 Unit!13110 (_2!8520 lt!279801)))))

(declare-fun lt!280554 () Unit!13081)

(assert (=> b!182609 (= lt!280554 (lemmaIsPrefixRefl!0 (_2!8520 lt!279801)))))

(assert (=> b!182609 call!2960))

(declare-fun lt!280575 () Unit!13081)

(assert (=> b!182609 (= lt!280575 lt!280554)))

(declare-fun bm!2957 () Bool)

(assert (=> bm!2957 (= call!2960 (isPrefixOf!0 (_2!8520 lt!279801) (ite c!9386 (_2!8520 lt!279801) (_2!8520 lt!280569))))))

(declare-fun b!182610 () Bool)

(assert (=> b!182610 (= e!126712 e!126714)))

(declare-fun res!151760 () Bool)

(assert (=> b!182610 (=> (not res!151760) (not e!126714))))

(assert (=> b!182610 (= res!151760 (= (_2!8522 lt!280585) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!182610 (= lt!280585 (readNBitsLSBFirstsLoopPure!0 (_1!8519 lt!280571) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!280548 () Unit!13081)

(declare-fun lt!280533 () Unit!13081)

(assert (=> b!182610 (= lt!280548 lt!280533)))

(assert (=> b!182610 (validate_offset_bits!1 ((_ sign_extend 32) (size!4292 (buf!4741 (_2!8520 lt!280549)))) ((_ sign_extend 32) (currentByte!8963 (_2!8520 lt!279801))) ((_ sign_extend 32) (currentBit!8958 (_2!8520 lt!279801))) lt!280553)))

(assert (=> b!182610 (= lt!280533 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8520 lt!279801) (buf!4741 (_2!8520 lt!280549)) lt!280553))))

(assert (=> b!182610 e!126710))

(declare-fun res!151768 () Bool)

(assert (=> b!182610 (=> (not res!151768) (not e!126710))))

(assert (=> b!182610 (= res!151768 (and (= (size!4292 (buf!4741 (_2!8520 lt!279801))) (size!4292 (buf!4741 (_2!8520 lt!280549)))) (bvsge lt!280553 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!182610 (= lt!280553 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!182610 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!182610 (= lt!280571 (reader!0 (_2!8520 lt!279801) (_2!8520 lt!280549)))))

(declare-fun b!182611 () Bool)

(assert (=> b!182611 (= e!126713 (= (bitIndex!0 (size!4292 (buf!4741 (_1!8521 lt!280556))) (currentByte!8963 (_1!8521 lt!280556)) (currentBit!8958 (_1!8521 lt!280556))) (bitIndex!0 (size!4292 (buf!4741 (_2!8520 lt!280586))) (currentByte!8963 (_2!8520 lt!280586)) (currentBit!8958 (_2!8520 lt!280586)))))))

(declare-fun b!182612 () Bool)

(declare-fun res!151763 () Bool)

(assert (=> b!182612 (= res!151763 (isPrefixOf!0 (_2!8520 lt!279801) (_2!8520 lt!280586)))))

(assert (=> b!182612 (=> (not res!151763) (not e!126711))))

(assert (= (and d!63269 c!9386) b!182609))

(assert (= (and d!63269 (not c!9386)) b!182602))

(assert (= (and b!182602 res!151766) b!182598))

(assert (= (and b!182598 res!151758) b!182612))

(assert (= (and b!182612 res!151763) b!182604))

(assert (= (and b!182604 res!151767) b!182611))

(assert (= (and b!182602 res!151761) b!182603))

(assert (= (and b!182602 c!9385) b!182600))

(assert (= (and b!182602 (not c!9385)) b!182606))

(assert (= (and b!182602 res!151759) b!182601))

(assert (= (or b!182609 b!182602) bm!2957))

(assert (= (and d!63269 res!151762) b!182608))

(assert (= (and b!182608 res!151765) b!182605))

(assert (= (and b!182605 res!151764) b!182597))

(assert (= (and b!182597 res!151757) b!182610))

(assert (= (and b!182610 res!151768) b!182607))

(assert (= (and b!182610 res!151760) b!182599))

(declare-fun m!284001 () Bool)

(assert (=> b!182597 m!284001))

(declare-fun m!284003 () Bool)

(assert (=> bm!2957 m!284003))

(declare-fun m!284005 () Bool)

(assert (=> b!182607 m!284005))

(declare-fun m!284007 () Bool)

(assert (=> b!182612 m!284007))

(declare-fun m!284009 () Bool)

(assert (=> b!182610 m!284009))

(declare-fun m!284011 () Bool)

(assert (=> b!182610 m!284011))

(declare-fun m!284013 () Bool)

(assert (=> b!182610 m!284013))

(declare-fun m!284015 () Bool)

(assert (=> b!182610 m!284015))

(declare-fun m!284017 () Bool)

(assert (=> b!182610 m!284017))

(declare-fun m!284019 () Bool)

(assert (=> b!182610 m!284019))

(assert (=> b!182609 m!283667))

(declare-fun m!284021 () Bool)

(assert (=> b!182611 m!284021))

(declare-fun m!284023 () Bool)

(assert (=> b!182611 m!284023))

(declare-fun m!284025 () Bool)

(assert (=> b!182605 m!284025))

(assert (=> b!182605 m!283501))

(assert (=> b!182598 m!284023))

(assert (=> b!182598 m!283501))

(declare-fun m!284027 () Bool)

(assert (=> b!182604 m!284027))

(assert (=> b!182604 m!284027))

(declare-fun m!284029 () Bool)

(assert (=> b!182604 m!284029))

(declare-fun m!284031 () Bool)

(assert (=> d!63269 m!284031))

(declare-fun m!284033 () Bool)

(assert (=> b!182602 m!284033))

(declare-fun m!284035 () Bool)

(assert (=> b!182602 m!284035))

(declare-fun m!284037 () Bool)

(assert (=> b!182602 m!284037))

(declare-fun m!284039 () Bool)

(assert (=> b!182602 m!284039))

(declare-fun m!284041 () Bool)

(assert (=> b!182602 m!284041))

(declare-fun m!284043 () Bool)

(assert (=> b!182602 m!284043))

(declare-fun m!284045 () Bool)

(assert (=> b!182602 m!284045))

(declare-fun m!284047 () Bool)

(assert (=> b!182602 m!284047))

(declare-fun m!284049 () Bool)

(assert (=> b!182602 m!284049))

(declare-fun m!284051 () Bool)

(assert (=> b!182602 m!284051))

(declare-fun m!284053 () Bool)

(assert (=> b!182602 m!284053))

(declare-fun m!284055 () Bool)

(assert (=> b!182602 m!284055))

(declare-fun m!284057 () Bool)

(assert (=> b!182602 m!284057))

(declare-fun m!284059 () Bool)

(assert (=> b!182602 m!284059))

(assert (=> b!182602 m!284009))

(declare-fun m!284061 () Bool)

(assert (=> b!182602 m!284061))

(declare-fun m!284063 () Bool)

(assert (=> b!182602 m!284063))

(declare-fun m!284065 () Bool)

(assert (=> b!182602 m!284065))

(declare-fun m!284067 () Bool)

(assert (=> b!182602 m!284067))

(assert (=> b!182602 m!283501))

(declare-fun m!284069 () Bool)

(assert (=> b!182602 m!284069))

(declare-fun m!284071 () Bool)

(assert (=> b!182602 m!284071))

(declare-fun m!284073 () Bool)

(assert (=> b!182602 m!284073))

(declare-fun m!284075 () Bool)

(assert (=> b!182602 m!284075))

(declare-fun m!284077 () Bool)

(assert (=> b!182602 m!284077))

(declare-fun m!284079 () Bool)

(assert (=> b!182602 m!284079))

(declare-fun m!284081 () Bool)

(assert (=> b!182602 m!284081))

(assert (=> b!182602 m!284069))

(assert (=> b!182602 m!284015))

(declare-fun m!284083 () Bool)

(assert (=> b!182602 m!284083))

(declare-fun m!284085 () Bool)

(assert (=> b!182602 m!284085))

(declare-fun m!284087 () Bool)

(assert (=> b!182602 m!284087))

(declare-fun m!284089 () Bool)

(assert (=> b!182602 m!284089))

(declare-fun m!284091 () Bool)

(assert (=> b!182602 m!284091))

(assert (=> b!182282 d!63269))

(assert (=> b!182293 d!63255))

(assert (=> b!182293 d!63257))

(check-sat (not b!182385) (not bm!2957) (not b!182380) (not d!63269) (not b!182410) (not d!63213) (not b!182388) (not b!182392) (not b!182381) (not d!63215) (not b!182598) (not b!182395) (not b!182378) (not b!182604) (not b!182419) (not d!63267) (not d!63261) (not b!182409) (not b!182358) (not d!63235) (not d!63211) (not d!63229) (not b!182609) (not b!182597) (not d!63225) (not b!182389) (not b!182611) (not d!63221) (not d!63253) (not b!182605) (not d!63217) (not d!63255) (not d!63245) (not b!182412) (not b!182417) (not d!63231) (not d!63209) (not b!182607) (not b!182612) (not b!182382) (not b!182390) (not d!63223) (not b!182387) (not d!63241) (not d!63257) (not b!182610) (not b!182602) (not d!63259) (not b!182411) (not d!63251) (not d!63227) (not d!63263) (not d!63243) (not b!182356) (not d!63219))
(check-sat)
