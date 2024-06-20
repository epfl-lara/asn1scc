; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38964 () Bool)

(assert start!38964)

(declare-fun b!175561 () Bool)

(declare-fun res!145380 () Bool)

(declare-fun e!122427 () Bool)

(assert (=> b!175561 (=> (not res!145380) (not e!122427))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!175561 (= res!145380 (= i!590 nBits!348))))

(declare-fun b!175562 () Bool)

(declare-fun e!122426 () Bool)

(assert (=> b!175562 (= e!122427 e!122426)))

(declare-fun res!145383 () Bool)

(assert (=> b!175562 (=> (not res!145383) (not e!122426))))

(declare-fun lt!270578 () (_ BitVec 64))

(assert (=> b!175562 (= res!145383 (= lt!270578 (bvsub (bvadd lt!270578 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-datatypes ((array!9474 0))(
  ( (array!9475 (arr!5112 (Array (_ BitVec 32) (_ BitVec 8))) (size!4182 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7472 0))(
  ( (BitStream!7473 (buf!4619 array!9474) (currentByte!8742 (_ BitVec 32)) (currentBit!8737 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7472)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175562 (= lt!270578 (bitIndex!0 (size!4182 (buf!4619 thiss!1204)) (currentByte!8742 thiss!1204) (currentBit!8737 thiss!1204)))))

(declare-fun b!175563 () Bool)

(declare-fun res!145379 () Bool)

(assert (=> b!175563 (=> (not res!145379) (not e!122427))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!175563 (= res!145379 (invariant!0 (currentBit!8737 thiss!1204) (currentByte!8742 thiss!1204) (size!4182 (buf!4619 thiss!1204))))))

(declare-fun b!175564 () Bool)

(declare-fun e!122424 () Bool)

(declare-fun array_inv!3923 (array!9474) Bool)

(assert (=> b!175564 (= e!122424 (array_inv!3923 (buf!4619 thiss!1204)))))

(declare-fun res!145381 () Bool)

(declare-fun e!122425 () Bool)

(assert (=> start!38964 (=> (not res!145381) (not e!122425))))

(assert (=> start!38964 (= res!145381 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!38964 e!122425))

(assert (=> start!38964 true))

(declare-fun inv!12 (BitStream!7472) Bool)

(assert (=> start!38964 (and (inv!12 thiss!1204) e!122424)))

(declare-fun b!175565 () Bool)

(declare-datatypes ((tuple2!15110 0))(
  ( (tuple2!15111 (_1!8200 BitStream!7472) (_2!8200 BitStream!7472)) )
))
(declare-fun lt!270579 () tuple2!15110)

(declare-fun lt!270580 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!175565 (= e!122426 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4182 (buf!4619 (_1!8200 lt!270579)))) ((_ sign_extend 32) (currentByte!8742 (_1!8200 lt!270579))) ((_ sign_extend 32) (currentBit!8737 (_1!8200 lt!270579))) lt!270580)))))

(declare-datatypes ((Unit!12672 0))(
  ( (Unit!12673) )
))
(declare-fun lt!270581 () Unit!12672)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7472 array!9474 (_ BitVec 64)) Unit!12672)

(assert (=> b!175565 (= lt!270581 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4619 thiss!1204) lt!270580))))

(declare-fun reader!0 (BitStream!7472 BitStream!7472) tuple2!15110)

(assert (=> b!175565 (= lt!270579 (reader!0 thiss!1204 thiss!1204))))

(declare-fun isPrefixOf!0 (BitStream!7472 BitStream!7472) Bool)

(assert (=> b!175565 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-fun lt!270577 () Unit!12672)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7472) Unit!12672)

(assert (=> b!175565 (= lt!270577 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!175566 () Bool)

(assert (=> b!175566 (= e!122425 e!122427)))

(declare-fun res!145382 () Bool)

(assert (=> b!175566 (=> (not res!145382) (not e!122427))))

(assert (=> b!175566 (= res!145382 (validate_offset_bits!1 ((_ sign_extend 32) (size!4182 (buf!4619 thiss!1204))) ((_ sign_extend 32) (currentByte!8742 thiss!1204)) ((_ sign_extend 32) (currentBit!8737 thiss!1204)) lt!270580))))

(assert (=> b!175566 (= lt!270580 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(assert (= (and start!38964 res!145381) b!175566))

(assert (= (and b!175566 res!145382) b!175563))

(assert (= (and b!175563 res!145379) b!175561))

(assert (= (and b!175561 res!145380) b!175562))

(assert (= (and b!175562 res!145383) b!175565))

(assert (= start!38964 b!175564))

(declare-fun m!275741 () Bool)

(assert (=> b!175563 m!275741))

(declare-fun m!275743 () Bool)

(assert (=> b!175565 m!275743))

(declare-fun m!275745 () Bool)

(assert (=> b!175565 m!275745))

(declare-fun m!275747 () Bool)

(assert (=> b!175565 m!275747))

(declare-fun m!275749 () Bool)

(assert (=> b!175565 m!275749))

(declare-fun m!275751 () Bool)

(assert (=> b!175565 m!275751))

(declare-fun m!275753 () Bool)

(assert (=> start!38964 m!275753))

(declare-fun m!275755 () Bool)

(assert (=> b!175564 m!275755))

(declare-fun m!275757 () Bool)

(assert (=> b!175566 m!275757))

(declare-fun m!275759 () Bool)

(assert (=> b!175562 m!275759))

(push 1)

(assert (not b!175566))

(assert (not b!175564))

(assert (not b!175562))

(assert (not start!38964))

(assert (not b!175565))

(assert (not b!175563))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!61937 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!61937 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4182 (buf!4619 thiss!1204))) ((_ sign_extend 32) (currentByte!8742 thiss!1204)) ((_ sign_extend 32) (currentBit!8737 thiss!1204)) lt!270580) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4182 (buf!4619 thiss!1204))) ((_ sign_extend 32) (currentByte!8742 thiss!1204)) ((_ sign_extend 32) (currentBit!8737 thiss!1204))) lt!270580))))

(declare-fun bs!15453 () Bool)

(assert (= bs!15453 d!61937))

(declare-fun m!275769 () Bool)

(assert (=> bs!15453 m!275769))

(assert (=> b!175566 d!61937))

(declare-fun d!61939 () Bool)

(assert (=> d!61939 (validate_offset_bits!1 ((_ sign_extend 32) (size!4182 (buf!4619 thiss!1204))) ((_ sign_extend 32) (currentByte!8742 thiss!1204)) ((_ sign_extend 32) (currentBit!8737 thiss!1204)) lt!270580)))

(declare-fun lt!270608 () Unit!12672)

(declare-fun choose!9 (BitStream!7472 array!9474 (_ BitVec 64) BitStream!7472) Unit!12672)

(assert (=> d!61939 (= lt!270608 (choose!9 thiss!1204 (buf!4619 thiss!1204) lt!270580 (BitStream!7473 (buf!4619 thiss!1204) (currentByte!8742 thiss!1204) (currentBit!8737 thiss!1204))))))

(assert (=> d!61939 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4619 thiss!1204) lt!270580) lt!270608)))

(declare-fun bs!15454 () Bool)

(assert (= bs!15454 d!61939))

(assert (=> bs!15454 m!275757))

(declare-fun m!275771 () Bool)

(assert (=> bs!15454 m!275771))

(assert (=> b!175565 d!61939))

(declare-fun d!61941 () Bool)

(assert (=> d!61941 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-fun lt!270611 () Unit!12672)

(declare-fun choose!11 (BitStream!7472) Unit!12672)

(assert (=> d!61941 (= lt!270611 (choose!11 thiss!1204))))

(assert (=> d!61941 (= (lemmaIsPrefixRefl!0 thiss!1204) lt!270611)))

(declare-fun bs!15456 () Bool)

(assert (= bs!15456 d!61941))

(assert (=> bs!15456 m!275745))

(declare-fun m!275773 () Bool)

(assert (=> bs!15456 m!275773))

(assert (=> b!175565 d!61941))

(declare-fun b!175637 () Bool)

(declare-fun e!122463 () Unit!12672)

(declare-fun lt!270806 () Unit!12672)

(assert (=> b!175637 (= e!122463 lt!270806)))

(declare-fun lt!270809 () (_ BitVec 64))

(assert (=> b!175637 (= lt!270809 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!270810 () (_ BitVec 64))

(assert (=> b!175637 (= lt!270810 (bitIndex!0 (size!4182 (buf!4619 thiss!1204)) (currentByte!8742 thiss!1204) (currentBit!8737 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9474 array!9474 (_ BitVec 64) (_ BitVec 64)) Unit!12672)

(assert (=> b!175637 (= lt!270806 (arrayBitRangesEqSymmetric!0 (buf!4619 thiss!1204) (buf!4619 thiss!1204) lt!270809 lt!270810))))

(declare-fun arrayBitRangesEq!0 (array!9474 array!9474 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!175637 (arrayBitRangesEq!0 (buf!4619 thiss!1204) (buf!4619 thiss!1204) lt!270809 lt!270810)))

(declare-fun b!175638 () Bool)

(declare-fun res!145440 () Bool)

(declare-fun e!122464 () Bool)

(assert (=> b!175638 (=> (not res!145440) (not e!122464))))

(declare-fun lt!270808 () tuple2!15110)

(assert (=> b!175638 (= res!145440 (isPrefixOf!0 (_1!8200 lt!270808) thiss!1204))))

(declare-fun b!175639 () Bool)

(declare-fun Unit!12676 () Unit!12672)

(assert (=> b!175639 (= e!122463 Unit!12676)))

(declare-fun d!61943 () Bool)

(assert (=> d!61943 e!122464))

(declare-fun res!145438 () Bool)

(assert (=> d!61943 (=> (not res!145438) (not e!122464))))

(assert (=> d!61943 (= res!145438 (isPrefixOf!0 (_1!8200 lt!270808) (_2!8200 lt!270808)))))

(declare-fun lt!270813 () BitStream!7472)

(assert (=> d!61943 (= lt!270808 (tuple2!15111 lt!270813 thiss!1204))))

(declare-fun lt!270799 () Unit!12672)

(declare-fun lt!270796 () Unit!12672)

(assert (=> d!61943 (= lt!270799 lt!270796)))

(assert (=> d!61943 (isPrefixOf!0 lt!270813 thiss!1204)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7472 BitStream!7472 BitStream!7472) Unit!12672)

(assert (=> d!61943 (= lt!270796 (lemmaIsPrefixTransitive!0 lt!270813 thiss!1204 thiss!1204))))

(declare-fun lt!270800 () Unit!12672)

(declare-fun lt!270814 () Unit!12672)

(assert (=> d!61943 (= lt!270800 lt!270814)))

(assert (=> d!61943 (isPrefixOf!0 lt!270813 thiss!1204)))

(assert (=> d!61943 (= lt!270814 (lemmaIsPrefixTransitive!0 lt!270813 thiss!1204 thiss!1204))))

(declare-fun lt!270801 () Unit!12672)

(assert (=> d!61943 (= lt!270801 e!122463)))

(declare-fun c!9231 () Bool)

(assert (=> d!61943 (= c!9231 (not (= (size!4182 (buf!4619 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!270802 () Unit!12672)

(declare-fun lt!270805 () Unit!12672)

(assert (=> d!61943 (= lt!270802 lt!270805)))

(assert (=> d!61943 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!61943 (= lt!270805 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun lt!270798 () Unit!12672)

(declare-fun lt!270804 () Unit!12672)

(assert (=> d!61943 (= lt!270798 lt!270804)))

(assert (=> d!61943 (= lt!270804 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun lt!270812 () Unit!12672)

(declare-fun lt!270811 () Unit!12672)

(assert (=> d!61943 (= lt!270812 lt!270811)))

(assert (=> d!61943 (isPrefixOf!0 lt!270813 lt!270813)))

(assert (=> d!61943 (= lt!270811 (lemmaIsPrefixRefl!0 lt!270813))))

(declare-fun lt!270797 () Unit!12672)

(declare-fun lt!270807 () Unit!12672)

(assert (=> d!61943 (= lt!270797 lt!270807)))

(assert (=> d!61943 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!61943 (= lt!270807 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!61943 (= lt!270813 (BitStream!7473 (buf!4619 thiss!1204) (currentByte!8742 thiss!1204) (currentBit!8737 thiss!1204)))))

(assert (=> d!61943 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!61943 (= (reader!0 thiss!1204 thiss!1204) lt!270808)))

(declare-fun b!175640 () Bool)

(declare-fun res!145439 () Bool)

(assert (=> b!175640 (=> (not res!145439) (not e!122464))))

(assert (=> b!175640 (= res!145439 (isPrefixOf!0 (_2!8200 lt!270808) thiss!1204))))

(declare-fun lt!270803 () (_ BitVec 64))

(declare-fun lt!270815 () (_ BitVec 64))

(declare-fun b!175641 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!7472 (_ BitVec 64)) BitStream!7472)

(assert (=> b!175641 (= e!122464 (= (_1!8200 lt!270808) (withMovedBitIndex!0 (_2!8200 lt!270808) (bvsub lt!270803 lt!270815))))))

(assert (=> b!175641 (or (= (bvand lt!270803 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!270815 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!270803 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!270803 lt!270815) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!175641 (= lt!270815 (bitIndex!0 (size!4182 (buf!4619 thiss!1204)) (currentByte!8742 thiss!1204) (currentBit!8737 thiss!1204)))))

(assert (=> b!175641 (= lt!270803 (bitIndex!0 (size!4182 (buf!4619 thiss!1204)) (currentByte!8742 thiss!1204) (currentBit!8737 thiss!1204)))))

(assert (= (and d!61943 c!9231) b!175637))

(assert (= (and d!61943 (not c!9231)) b!175639))

(assert (= (and d!61943 res!145438) b!175638))

(assert (= (and b!175638 res!145440) b!175640))

(assert (= (and b!175640 res!145439) b!175641))

(declare-fun m!275827 () Bool)

(assert (=> b!175641 m!275827))

(assert (=> b!175641 m!275759))

(assert (=> b!175641 m!275759))

(declare-fun m!275829 () Bool)

(assert (=> b!175638 m!275829))

(assert (=> d!61943 m!275743))

(declare-fun m!275831 () Bool)

(assert (=> d!61943 m!275831))

(assert (=> d!61943 m!275745))

(declare-fun m!275833 () Bool)

(assert (=> d!61943 m!275833))

(declare-fun m!275835 () Bool)

(assert (=> d!61943 m!275835))

(assert (=> d!61943 m!275743))

(declare-fun m!275837 () Bool)

(assert (=> d!61943 m!275837))

(declare-fun m!275839 () Bool)

(assert (=> d!61943 m!275839))

(assert (=> d!61943 m!275745))

(assert (=> d!61943 m!275837))

(assert (=> d!61943 m!275745))

(declare-fun m!275841 () Bool)

(assert (=> b!175640 m!275841))

(assert (=> b!175637 m!275759))

(declare-fun m!275843 () Bool)

(assert (=> b!175637 m!275843))

(declare-fun m!275845 () Bool)

(assert (=> b!175637 m!275845))

(assert (=> b!175565 d!61943))

(declare-fun d!61971 () Bool)

(declare-fun res!145447 () Bool)

(declare-fun e!122469 () Bool)

(assert (=> d!61971 (=> (not res!145447) (not e!122469))))

(assert (=> d!61971 (= res!145447 (= (size!4182 (buf!4619 thiss!1204)) (size!4182 (buf!4619 thiss!1204))))))

(assert (=> d!61971 (= (isPrefixOf!0 thiss!1204 thiss!1204) e!122469)))

(declare-fun b!175648 () Bool)

(declare-fun res!145449 () Bool)

(assert (=> b!175648 (=> (not res!145449) (not e!122469))))

(assert (=> b!175648 (= res!145449 (bvsle (bitIndex!0 (size!4182 (buf!4619 thiss!1204)) (currentByte!8742 thiss!1204) (currentBit!8737 thiss!1204)) (bitIndex!0 (size!4182 (buf!4619 thiss!1204)) (currentByte!8742 thiss!1204) (currentBit!8737 thiss!1204))))))

(declare-fun b!175649 () Bool)

(declare-fun e!122470 () Bool)

(assert (=> b!175649 (= e!122469 e!122470)))

(declare-fun res!145448 () Bool)

(assert (=> b!175649 (=> res!145448 e!122470)))

(assert (=> b!175649 (= res!145448 (= (size!4182 (buf!4619 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!175650 () Bool)

(assert (=> b!175650 (= e!122470 (arrayBitRangesEq!0 (buf!4619 thiss!1204) (buf!4619 thiss!1204) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4182 (buf!4619 thiss!1204)) (currentByte!8742 thiss!1204) (currentBit!8737 thiss!1204))))))

(assert (= (and d!61971 res!145447) b!175648))

(assert (= (and b!175648 res!145449) b!175649))

(assert (= (and b!175649 (not res!145448)) b!175650))

(assert (=> b!175648 m!275759))

(assert (=> b!175648 m!275759))

(assert (=> b!175650 m!275759))

(assert (=> b!175650 m!275759))

(declare-fun m!275847 () Bool)

(assert (=> b!175650 m!275847))

(assert (=> b!175565 d!61971))

(declare-fun d!61973 () Bool)

(assert (=> d!61973 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4182 (buf!4619 (_1!8200 lt!270579)))) ((_ sign_extend 32) (currentByte!8742 (_1!8200 lt!270579))) ((_ sign_extend 32) (currentBit!8737 (_1!8200 lt!270579))) lt!270580) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4182 (buf!4619 (_1!8200 lt!270579)))) ((_ sign_extend 32) (currentByte!8742 (_1!8200 lt!270579))) ((_ sign_extend 32) (currentBit!8737 (_1!8200 lt!270579)))) lt!270580))))

(declare-fun bs!15464 () Bool)

(assert (= bs!15464 d!61973))

(declare-fun m!275849 () Bool)

(assert (=> bs!15464 m!275849))

(assert (=> b!175565 d!61973))

(declare-fun d!61975 () Bool)

(assert (=> d!61975 (= (array_inv!3923 (buf!4619 thiss!1204)) (bvsge (size!4182 (buf!4619 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!175564 d!61975))

(declare-fun d!61977 () Bool)

(assert (=> d!61977 (= (invariant!0 (currentBit!8737 thiss!1204) (currentByte!8742 thiss!1204) (size!4182 (buf!4619 thiss!1204))) (and (bvsge (currentBit!8737 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8737 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8742 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8742 thiss!1204) (size!4182 (buf!4619 thiss!1204))) (and (= (currentBit!8737 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8742 thiss!1204) (size!4182 (buf!4619 thiss!1204)))))))))

(assert (=> b!175563 d!61977))

(declare-fun d!61979 () Bool)

(declare-fun e!122473 () Bool)

(assert (=> d!61979 e!122473))

(declare-fun res!145454 () Bool)

(assert (=> d!61979 (=> (not res!145454) (not e!122473))))

(declare-fun lt!270829 () (_ BitVec 64))

(declare-fun lt!270831 () (_ BitVec 64))

(declare-fun lt!270830 () (_ BitVec 64))

(assert (=> d!61979 (= res!145454 (= lt!270830 (bvsub lt!270829 lt!270831)))))

(assert (=> d!61979 (or (= (bvand lt!270829 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!270831 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!270829 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!270829 lt!270831) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61979 (= lt!270831 (remainingBits!0 ((_ sign_extend 32) (size!4182 (buf!4619 thiss!1204))) ((_ sign_extend 32) (currentByte!8742 thiss!1204)) ((_ sign_extend 32) (currentBit!8737 thiss!1204))))))

(declare-fun lt!270832 () (_ BitVec 64))

(declare-fun lt!270833 () (_ BitVec 64))

(assert (=> d!61979 (= lt!270829 (bvmul lt!270832 lt!270833))))

(assert (=> d!61979 (or (= lt!270832 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!270833 (bvsdiv (bvmul lt!270832 lt!270833) lt!270832)))))

(assert (=> d!61979 (= lt!270833 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61979 (= lt!270832 ((_ sign_extend 32) (size!4182 (buf!4619 thiss!1204))))))

(assert (=> d!61979 (= lt!270830 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8742 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8737 thiss!1204))))))

(assert (=> d!61979 (invariant!0 (currentBit!8737 thiss!1204) (currentByte!8742 thiss!1204) (size!4182 (buf!4619 thiss!1204)))))

(assert (=> d!61979 (= (bitIndex!0 (size!4182 (buf!4619 thiss!1204)) (currentByte!8742 thiss!1204) (currentBit!8737 thiss!1204)) lt!270830)))

(declare-fun b!175655 () Bool)

(declare-fun res!145455 () Bool)

(assert (=> b!175655 (=> (not res!145455) (not e!122473))))

(assert (=> b!175655 (= res!145455 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!270830))))

(declare-fun b!175656 () Bool)

(declare-fun lt!270828 () (_ BitVec 64))

(assert (=> b!175656 (= e!122473 (bvsle lt!270830 (bvmul lt!270828 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!175656 (or (= lt!270828 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!270828 #b0000000000000000000000000000000000000000000000000000000000001000) lt!270828)))))

(assert (=> b!175656 (= lt!270828 ((_ sign_extend 32) (size!4182 (buf!4619 thiss!1204))))))

(assert (= (and d!61979 res!145454) b!175655))

(assert (= (and b!175655 res!145455) b!175656))

(assert (=> d!61979 m!275769))

(assert (=> d!61979 m!275741))

(assert (=> b!175562 d!61979))

(declare-fun d!61981 () Bool)

(assert (=> d!61981 (= (inv!12 thiss!1204) (invariant!0 (currentBit!8737 thiss!1204) (currentByte!8742 thiss!1204) (size!4182 (buf!4619 thiss!1204))))))

(declare-fun bs!15465 () Bool)

(assert (= bs!15465 d!61981))

(assert (=> bs!15465 m!275741))

(assert (=> start!38964 d!61981))

(push 1)

(assert (not b!175650))

(assert (not b!175648))

(assert (not d!61943))

(assert (not b!175637))

(assert (not d!61981))

(assert (not d!61941))

(assert (not b!175640))

(assert (not b!175638))

(assert (not d!61973))

(assert (not d!61979))

(assert (not b!175641))

(assert (not d!61937))

(assert (not d!61939))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

