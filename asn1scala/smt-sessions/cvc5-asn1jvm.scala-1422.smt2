; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38960 () Bool)

(assert start!38960)

(declare-fun res!145350 () Bool)

(declare-fun e!122398 () Bool)

(assert (=> start!38960 (=> (not res!145350) (not e!122398))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!38960 (= res!145350 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!38960 e!122398))

(assert (=> start!38960 true))

(declare-datatypes ((array!9470 0))(
  ( (array!9471 (arr!5110 (Array (_ BitVec 32) (_ BitVec 8))) (size!4180 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7468 0))(
  ( (BitStream!7469 (buf!4617 array!9470) (currentByte!8740 (_ BitVec 32)) (currentBit!8735 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7468)

(declare-fun e!122394 () Bool)

(declare-fun inv!12 (BitStream!7468) Bool)

(assert (=> start!38960 (and (inv!12 thiss!1204) e!122394)))

(declare-fun b!175525 () Bool)

(declare-fun array_inv!3921 (array!9470) Bool)

(assert (=> b!175525 (= e!122394 (array_inv!3921 (buf!4617 thiss!1204)))))

(declare-fun b!175526 () Bool)

(declare-fun res!145351 () Bool)

(declare-fun e!122397 () Bool)

(assert (=> b!175526 (=> (not res!145351) (not e!122397))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!175526 (= res!145351 (invariant!0 (currentBit!8735 thiss!1204) (currentByte!8740 thiss!1204) (size!4180 (buf!4617 thiss!1204))))))

(declare-fun b!175527 () Bool)

(declare-fun e!122396 () Bool)

(assert (=> b!175527 (= e!122397 e!122396)))

(declare-fun res!145353 () Bool)

(assert (=> b!175527 (=> (not res!145353) (not e!122396))))

(declare-fun lt!270550 () (_ BitVec 64))

(assert (=> b!175527 (= res!145353 (= lt!270550 (bvsub (bvadd lt!270550 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175527 (= lt!270550 (bitIndex!0 (size!4180 (buf!4617 thiss!1204)) (currentByte!8740 thiss!1204) (currentBit!8735 thiss!1204)))))

(declare-fun b!175528 () Bool)

(assert (=> b!175528 (= e!122398 e!122397)))

(declare-fun res!145349 () Bool)

(assert (=> b!175528 (=> (not res!145349) (not e!122397))))

(declare-fun lt!270547 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!175528 (= res!145349 (validate_offset_bits!1 ((_ sign_extend 32) (size!4180 (buf!4617 thiss!1204))) ((_ sign_extend 32) (currentByte!8740 thiss!1204)) ((_ sign_extend 32) (currentBit!8735 thiss!1204)) lt!270547))))

(assert (=> b!175528 (= lt!270547 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!175529 () Bool)

(declare-fun res!145352 () Bool)

(assert (=> b!175529 (=> (not res!145352) (not e!122397))))

(assert (=> b!175529 (= res!145352 (= i!590 nBits!348))))

(declare-fun b!175530 () Bool)

(declare-datatypes ((tuple2!15106 0))(
  ( (tuple2!15107 (_1!8198 BitStream!7468) (_2!8198 BitStream!7468)) )
))
(declare-fun lt!270549 () tuple2!15106)

(assert (=> b!175530 (= e!122396 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4180 (buf!4617 (_1!8198 lt!270549)))) ((_ sign_extend 32) (currentByte!8740 (_1!8198 lt!270549))) ((_ sign_extend 32) (currentBit!8735 (_1!8198 lt!270549))) lt!270547)))))

(declare-datatypes ((Unit!12668 0))(
  ( (Unit!12669) )
))
(declare-fun lt!270548 () Unit!12668)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7468 array!9470 (_ BitVec 64)) Unit!12668)

(assert (=> b!175530 (= lt!270548 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4617 thiss!1204) lt!270547))))

(declare-fun reader!0 (BitStream!7468 BitStream!7468) tuple2!15106)

(assert (=> b!175530 (= lt!270549 (reader!0 thiss!1204 thiss!1204))))

(declare-fun isPrefixOf!0 (BitStream!7468 BitStream!7468) Bool)

(assert (=> b!175530 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-fun lt!270551 () Unit!12668)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7468) Unit!12668)

(assert (=> b!175530 (= lt!270551 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (= (and start!38960 res!145350) b!175528))

(assert (= (and b!175528 res!145349) b!175526))

(assert (= (and b!175526 res!145351) b!175529))

(assert (= (and b!175529 res!145352) b!175527))

(assert (= (and b!175527 res!145353) b!175530))

(assert (= start!38960 b!175525))

(declare-fun m!275701 () Bool)

(assert (=> b!175530 m!275701))

(declare-fun m!275703 () Bool)

(assert (=> b!175530 m!275703))

(declare-fun m!275705 () Bool)

(assert (=> b!175530 m!275705))

(declare-fun m!275707 () Bool)

(assert (=> b!175530 m!275707))

(declare-fun m!275709 () Bool)

(assert (=> b!175530 m!275709))

(declare-fun m!275711 () Bool)

(assert (=> b!175525 m!275711))

(declare-fun m!275713 () Bool)

(assert (=> b!175528 m!275713))

(declare-fun m!275715 () Bool)

(assert (=> start!38960 m!275715))

(declare-fun m!275717 () Bool)

(assert (=> b!175527 m!275717))

(declare-fun m!275719 () Bool)

(assert (=> b!175526 m!275719))

(push 1)

(assert (not b!175525))

(assert (not b!175526))

(assert (not b!175528))

(assert (not start!38960))

(assert (not b!175527))

(assert (not b!175530))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!61925 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!61925 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4180 (buf!4617 (_1!8198 lt!270549)))) ((_ sign_extend 32) (currentByte!8740 (_1!8198 lt!270549))) ((_ sign_extend 32) (currentBit!8735 (_1!8198 lt!270549))) lt!270547) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4180 (buf!4617 (_1!8198 lt!270549)))) ((_ sign_extend 32) (currentByte!8740 (_1!8198 lt!270549))) ((_ sign_extend 32) (currentBit!8735 (_1!8198 lt!270549)))) lt!270547))))

(declare-fun bs!15448 () Bool)

(assert (= bs!15448 d!61925))

(declare-fun m!275761 () Bool)

(assert (=> bs!15448 m!275761))

(assert (=> b!175530 d!61925))

(declare-fun d!61927 () Bool)

(assert (=> d!61927 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-fun lt!270602 () Unit!12668)

(declare-fun choose!11 (BitStream!7468) Unit!12668)

(assert (=> d!61927 (= lt!270602 (choose!11 thiss!1204))))

(assert (=> d!61927 (= (lemmaIsPrefixRefl!0 thiss!1204) lt!270602)))

(declare-fun bs!15451 () Bool)

(assert (= bs!15451 d!61927))

(assert (=> bs!15451 m!275705))

(declare-fun m!275765 () Bool)

(assert (=> bs!15451 m!275765))

(assert (=> b!175530 d!61927))

(declare-fun d!61933 () Bool)

(assert (=> d!61933 (validate_offset_bits!1 ((_ sign_extend 32) (size!4180 (buf!4617 thiss!1204))) ((_ sign_extend 32) (currentByte!8740 thiss!1204)) ((_ sign_extend 32) (currentBit!8735 thiss!1204)) lt!270547)))

(declare-fun lt!270605 () Unit!12668)

(declare-fun choose!9 (BitStream!7468 array!9470 (_ BitVec 64) BitStream!7468) Unit!12668)

(assert (=> d!61933 (= lt!270605 (choose!9 thiss!1204 (buf!4617 thiss!1204) lt!270547 (BitStream!7469 (buf!4617 thiss!1204) (currentByte!8740 thiss!1204) (currentBit!8735 thiss!1204))))))

(assert (=> d!61933 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4617 thiss!1204) lt!270547) lt!270605)))

(declare-fun bs!15452 () Bool)

(assert (= bs!15452 d!61933))

(assert (=> bs!15452 m!275713))

(declare-fun m!275767 () Bool)

(assert (=> bs!15452 m!275767))

(assert (=> b!175530 d!61933))

(declare-fun b!175598 () Bool)

(declare-fun e!122443 () Unit!12668)

(declare-fun lt!270712 () Unit!12668)

(assert (=> b!175598 (= e!122443 lt!270712)))

(declare-fun lt!270730 () (_ BitVec 64))

(assert (=> b!175598 (= lt!270730 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!270716 () (_ BitVec 64))

(assert (=> b!175598 (= lt!270716 (bitIndex!0 (size!4180 (buf!4617 thiss!1204)) (currentByte!8740 thiss!1204) (currentBit!8735 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9470 array!9470 (_ BitVec 64) (_ BitVec 64)) Unit!12668)

(assert (=> b!175598 (= lt!270712 (arrayBitRangesEqSymmetric!0 (buf!4617 thiss!1204) (buf!4617 thiss!1204) lt!270730 lt!270716))))

(declare-fun arrayBitRangesEq!0 (array!9470 array!9470 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!175598 (arrayBitRangesEq!0 (buf!4617 thiss!1204) (buf!4617 thiss!1204) lt!270730 lt!270716)))

(declare-fun d!61935 () Bool)

(declare-fun e!122442 () Bool)

(assert (=> d!61935 e!122442))

(declare-fun res!145405 () Bool)

(assert (=> d!61935 (=> (not res!145405) (not e!122442))))

(declare-fun lt!270715 () tuple2!15106)

(assert (=> d!61935 (= res!145405 (isPrefixOf!0 (_1!8198 lt!270715) (_2!8198 lt!270715)))))

(declare-fun lt!270726 () BitStream!7468)

(assert (=> d!61935 (= lt!270715 (tuple2!15107 lt!270726 thiss!1204))))

(declare-fun lt!270725 () Unit!12668)

(declare-fun lt!270728 () Unit!12668)

(assert (=> d!61935 (= lt!270725 lt!270728)))

(assert (=> d!61935 (isPrefixOf!0 lt!270726 thiss!1204)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7468 BitStream!7468 BitStream!7468) Unit!12668)

(assert (=> d!61935 (= lt!270728 (lemmaIsPrefixTransitive!0 lt!270726 thiss!1204 thiss!1204))))

(declare-fun lt!270718 () Unit!12668)

(declare-fun lt!270731 () Unit!12668)

(assert (=> d!61935 (= lt!270718 lt!270731)))

(assert (=> d!61935 (isPrefixOf!0 lt!270726 thiss!1204)))

(assert (=> d!61935 (= lt!270731 (lemmaIsPrefixTransitive!0 lt!270726 thiss!1204 thiss!1204))))

(declare-fun lt!270713 () Unit!12668)

(assert (=> d!61935 (= lt!270713 e!122443)))

(declare-fun c!9228 () Bool)

(assert (=> d!61935 (= c!9228 (not (= (size!4180 (buf!4617 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!270727 () Unit!12668)

(declare-fun lt!270722 () Unit!12668)

(assert (=> d!61935 (= lt!270727 lt!270722)))

(assert (=> d!61935 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!61935 (= lt!270722 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun lt!270714 () Unit!12668)

(declare-fun lt!270721 () Unit!12668)

(assert (=> d!61935 (= lt!270714 lt!270721)))

(assert (=> d!61935 (= lt!270721 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun lt!270719 () Unit!12668)

(declare-fun lt!270724 () Unit!12668)

(assert (=> d!61935 (= lt!270719 lt!270724)))

(assert (=> d!61935 (isPrefixOf!0 lt!270726 lt!270726)))

(assert (=> d!61935 (= lt!270724 (lemmaIsPrefixRefl!0 lt!270726))))

(declare-fun lt!270723 () Unit!12668)

(declare-fun lt!270720 () Unit!12668)

(assert (=> d!61935 (= lt!270723 lt!270720)))

(assert (=> d!61935 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!61935 (= lt!270720 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!61935 (= lt!270726 (BitStream!7469 (buf!4617 thiss!1204) (currentByte!8740 thiss!1204) (currentBit!8735 thiss!1204)))))

(assert (=> d!61935 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!61935 (= (reader!0 thiss!1204 thiss!1204) lt!270715)))

(declare-fun b!175599 () Bool)

(declare-fun Unit!12675 () Unit!12668)

(assert (=> b!175599 (= e!122443 Unit!12675)))

(declare-fun lt!270729 () (_ BitVec 64))

(declare-fun lt!270717 () (_ BitVec 64))

(declare-fun b!175600 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!7468 (_ BitVec 64)) BitStream!7468)

(assert (=> b!175600 (= e!122442 (= (_1!8198 lt!270715) (withMovedBitIndex!0 (_2!8198 lt!270715) (bvsub lt!270717 lt!270729))))))

(assert (=> b!175600 (or (= (bvand lt!270717 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!270729 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!270717 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!270717 lt!270729) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!175600 (= lt!270729 (bitIndex!0 (size!4180 (buf!4617 thiss!1204)) (currentByte!8740 thiss!1204) (currentBit!8735 thiss!1204)))))

(assert (=> b!175600 (= lt!270717 (bitIndex!0 (size!4180 (buf!4617 thiss!1204)) (currentByte!8740 thiss!1204) (currentBit!8735 thiss!1204)))))

(declare-fun b!175601 () Bool)

(declare-fun res!145407 () Bool)

(assert (=> b!175601 (=> (not res!145407) (not e!122442))))

(assert (=> b!175601 (= res!145407 (isPrefixOf!0 (_2!8198 lt!270715) thiss!1204))))

(declare-fun b!175602 () Bool)

(declare-fun res!145406 () Bool)

(assert (=> b!175602 (=> (not res!145406) (not e!122442))))

(assert (=> b!175602 (= res!145406 (isPrefixOf!0 (_1!8198 lt!270715) thiss!1204))))

(assert (= (and d!61935 c!9228) b!175598))

(assert (= (and d!61935 (not c!9228)) b!175599))

(assert (= (and d!61935 res!145405) b!175602))

(assert (= (and b!175602 res!145406) b!175601))

(assert (= (and b!175601 res!145407) b!175600))

(declare-fun m!275795 () Bool)

(assert (=> b!175601 m!275795))

(declare-fun m!275797 () Bool)

(assert (=> b!175600 m!275797))

(assert (=> b!175600 m!275717))

(assert (=> b!175600 m!275717))

(declare-fun m!275799 () Bool)

(assert (=> d!61935 m!275799))

(declare-fun m!275801 () Bool)

(assert (=> d!61935 m!275801))

(assert (=> d!61935 m!275705))

(assert (=> d!61935 m!275703))

(assert (=> d!61935 m!275705))

(declare-fun m!275803 () Bool)

(assert (=> d!61935 m!275803))

(declare-fun m!275805 () Bool)

(assert (=> d!61935 m!275805))

(assert (=> d!61935 m!275703))

(declare-fun m!275807 () Bool)

(assert (=> d!61935 m!275807))

(assert (=> d!61935 m!275801))

(assert (=> d!61935 m!275705))

(assert (=> b!175598 m!275717))

(declare-fun m!275809 () Bool)

(assert (=> b!175598 m!275809))

(declare-fun m!275811 () Bool)

(assert (=> b!175598 m!275811))

(declare-fun m!275813 () Bool)

(assert (=> b!175602 m!275813))

(assert (=> b!175530 d!61935))

(declare-fun d!61947 () Bool)

(declare-fun res!145425 () Bool)

(declare-fun e!122455 () Bool)

(assert (=> d!61947 (=> (not res!145425) (not e!122455))))

(assert (=> d!61947 (= res!145425 (= (size!4180 (buf!4617 thiss!1204)) (size!4180 (buf!4617 thiss!1204))))))

(assert (=> d!61947 (= (isPrefixOf!0 thiss!1204 thiss!1204) e!122455)))

(declare-fun b!175618 () Bool)

(declare-fun res!145423 () Bool)

(assert (=> b!175618 (=> (not res!145423) (not e!122455))))

(assert (=> b!175618 (= res!145423 (bvsle (bitIndex!0 (size!4180 (buf!4617 thiss!1204)) (currentByte!8740 thiss!1204) (currentBit!8735 thiss!1204)) (bitIndex!0 (size!4180 (buf!4617 thiss!1204)) (currentByte!8740 thiss!1204) (currentBit!8735 thiss!1204))))))

(declare-fun b!175619 () Bool)

(declare-fun e!122454 () Bool)

(assert (=> b!175619 (= e!122455 e!122454)))

(declare-fun res!145424 () Bool)

(assert (=> b!175619 (=> res!145424 e!122454)))

(assert (=> b!175619 (= res!145424 (= (size!4180 (buf!4617 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!175620 () Bool)

(assert (=> b!175620 (= e!122454 (arrayBitRangesEq!0 (buf!4617 thiss!1204) (buf!4617 thiss!1204) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4180 (buf!4617 thiss!1204)) (currentByte!8740 thiss!1204) (currentBit!8735 thiss!1204))))))

(assert (= (and d!61947 res!145425) b!175618))

(assert (= (and b!175618 res!145423) b!175619))

(assert (= (and b!175619 (not res!145424)) b!175620))

(assert (=> b!175618 m!275717))

(assert (=> b!175618 m!275717))

(assert (=> b!175620 m!275717))

(assert (=> b!175620 m!275717))

(declare-fun m!275821 () Bool)

(assert (=> b!175620 m!275821))

(assert (=> b!175530 d!61947))

(declare-fun d!61955 () Bool)

(assert (=> d!61955 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4180 (buf!4617 thiss!1204))) ((_ sign_extend 32) (currentByte!8740 thiss!1204)) ((_ sign_extend 32) (currentBit!8735 thiss!1204)) lt!270547) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4180 (buf!4617 thiss!1204))) ((_ sign_extend 32) (currentByte!8740 thiss!1204)) ((_ sign_extend 32) (currentBit!8735 thiss!1204))) lt!270547))))

(declare-fun bs!15460 () Bool)

(assert (= bs!15460 d!61955))

(declare-fun m!275823 () Bool)

(assert (=> bs!15460 m!275823))

(assert (=> b!175528 d!61955))

(declare-fun d!61957 () Bool)

(declare-fun e!122460 () Bool)

(assert (=> d!61957 e!122460))

(declare-fun res!145431 () Bool)

(assert (=> d!61957 (=> (not res!145431) (not e!122460))))

(declare-fun lt!270780 () (_ BitVec 64))

(declare-fun lt!270779 () (_ BitVec 64))

(declare-fun lt!270782 () (_ BitVec 64))

(assert (=> d!61957 (= res!145431 (= lt!270779 (bvsub lt!270780 lt!270782)))))

(assert (=> d!61957 (or (= (bvand lt!270780 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!270782 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!270780 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!270780 lt!270782) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61957 (= lt!270782 (remainingBits!0 ((_ sign_extend 32) (size!4180 (buf!4617 thiss!1204))) ((_ sign_extend 32) (currentByte!8740 thiss!1204)) ((_ sign_extend 32) (currentBit!8735 thiss!1204))))))

(declare-fun lt!270778 () (_ BitVec 64))

(declare-fun lt!270781 () (_ BitVec 64))

(assert (=> d!61957 (= lt!270780 (bvmul lt!270778 lt!270781))))

(assert (=> d!61957 (or (= lt!270778 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!270781 (bvsdiv (bvmul lt!270778 lt!270781) lt!270778)))))

(assert (=> d!61957 (= lt!270781 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61957 (= lt!270778 ((_ sign_extend 32) (size!4180 (buf!4617 thiss!1204))))))

(assert (=> d!61957 (= lt!270779 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8740 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8735 thiss!1204))))))

(assert (=> d!61957 (invariant!0 (currentBit!8735 thiss!1204) (currentByte!8740 thiss!1204) (size!4180 (buf!4617 thiss!1204)))))

(assert (=> d!61957 (= (bitIndex!0 (size!4180 (buf!4617 thiss!1204)) (currentByte!8740 thiss!1204) (currentBit!8735 thiss!1204)) lt!270779)))

(declare-fun b!175629 () Bool)

(declare-fun res!145430 () Bool)

(assert (=> b!175629 (=> (not res!145430) (not e!122460))))

(assert (=> b!175629 (= res!145430 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!270779))))

(declare-fun b!175630 () Bool)

(declare-fun lt!270783 () (_ BitVec 64))

(assert (=> b!175630 (= e!122460 (bvsle lt!270779 (bvmul lt!270783 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!175630 (or (= lt!270783 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!270783 #b0000000000000000000000000000000000000000000000000000000000001000) lt!270783)))))

(assert (=> b!175630 (= lt!270783 ((_ sign_extend 32) (size!4180 (buf!4617 thiss!1204))))))

(assert (= (and d!61957 res!145431) b!175629))

(assert (= (and b!175629 res!145430) b!175630))

(assert (=> d!61957 m!275823))

(assert (=> d!61957 m!275719))

(assert (=> b!175527 d!61957))

(declare-fun d!61965 () Bool)

(assert (=> d!61965 (= (invariant!0 (currentBit!8735 thiss!1204) (currentByte!8740 thiss!1204) (size!4180 (buf!4617 thiss!1204))) (and (bvsge (currentBit!8735 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8735 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8740 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8740 thiss!1204) (size!4180 (buf!4617 thiss!1204))) (and (= (currentBit!8735 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8740 thiss!1204) (size!4180 (buf!4617 thiss!1204)))))))))

(assert (=> b!175526 d!61965))

(declare-fun d!61967 () Bool)

(assert (=> d!61967 (= (inv!12 thiss!1204) (invariant!0 (currentBit!8735 thiss!1204) (currentByte!8740 thiss!1204) (size!4180 (buf!4617 thiss!1204))))))

(declare-fun bs!15463 () Bool)

(assert (= bs!15463 d!61967))

(assert (=> bs!15463 m!275719))

(assert (=> start!38960 d!61967))

(declare-fun d!61969 () Bool)

(assert (=> d!61969 (= (array_inv!3921 (buf!4617 thiss!1204)) (bvsge (size!4180 (buf!4617 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!175525 d!61969))

(push 1)

(assert (not d!61957))

(assert (not b!175602))

(assert (not d!61955))

(assert (not d!61933))

(assert (not d!61967))

(assert (not b!175618))

(assert (not b!175601))

(assert (not d!61927))

(assert (not b!175598))

(assert (not d!61925))

(assert (not b!175620))

(assert (not d!61935))

(assert (not b!175600))

(check-sat)

(pop 1)

(push 1)

(check-sat)

