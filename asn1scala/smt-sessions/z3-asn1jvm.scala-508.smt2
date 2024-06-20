; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14908 () Bool)

(assert start!14908)

(declare-fun b!76591 () Bool)

(declare-fun res!63274 () Bool)

(declare-fun e!50278 () Bool)

(assert (=> b!76591 (=> (not res!63274) (not e!50278))))

(declare-datatypes ((array!3184 0))(
  ( (array!3185 (arr!2083 (Array (_ BitVec 32) (_ BitVec 8))) (size!1482 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2538 0))(
  ( (BitStream!2539 (buf!1866 array!3184) (currentByte!3665 (_ BitVec 32)) (currentBit!3660 (_ BitVec 32))) )
))
(declare-fun thiss!1090 () BitStream!2538)

(declare-datatypes ((Unit!5049 0))(
  ( (Unit!5050) )
))
(declare-datatypes ((tuple2!6662 0))(
  ( (tuple2!6663 (_1!3465 Unit!5049) (_2!3465 BitStream!2538)) )
))
(declare-fun lt!122610 () tuple2!6662)

(declare-fun isPrefixOf!0 (BitStream!2538 BitStream!2538) Bool)

(assert (=> b!76591 (= res!63274 (isPrefixOf!0 thiss!1090 (_2!3465 lt!122610)))))

(declare-fun b!76592 () Bool)

(declare-fun res!63276 () Bool)

(assert (=> b!76592 (=> (not res!63276) (not e!50278))))

(declare-fun nBits!322 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!76592 (= res!63276 (= (bitIndex!0 (size!1482 (buf!1866 (_2!3465 lt!122610))) (currentByte!3665 (_2!3465 lt!122610)) (currentBit!3660 (_2!3465 lt!122610))) (bvadd (bitIndex!0 (size!1482 (buf!1866 thiss!1090)) (currentByte!3665 thiss!1090) (currentBit!3660 thiss!1090)) nBits!322)))))

(declare-fun b!76593 () Bool)

(declare-datatypes ((tuple2!6664 0))(
  ( (tuple2!6665 (_1!3466 BitStream!2538) (_2!3466 Bool)) )
))
(declare-fun lt!122611 () tuple2!6664)

(declare-datatypes ((tuple2!6666 0))(
  ( (tuple2!6667 (_1!3467 BitStream!2538) (_2!3467 BitStream!2538)) )
))
(declare-fun lt!122613 () tuple2!6666)

(assert (=> b!76593 (= e!50278 (not (or (not (_2!3466 lt!122611)) (not (= (_1!3466 lt!122611) (_2!3467 lt!122613))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!2538 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6664)

(assert (=> b!76593 (= lt!122611 (checkBitsLoopPure!0 (_1!3467 lt!122613) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76593 (validate_offset_bits!1 ((_ sign_extend 32) (size!1482 (buf!1866 (_2!3465 lt!122610)))) ((_ sign_extend 32) (currentByte!3665 thiss!1090)) ((_ sign_extend 32) (currentBit!3660 thiss!1090)) nBits!322)))

(declare-fun lt!122612 () Unit!5049)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2538 array!3184 (_ BitVec 64)) Unit!5049)

(assert (=> b!76593 (= lt!122612 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1866 (_2!3465 lt!122610)) nBits!322))))

(declare-fun reader!0 (BitStream!2538 BitStream!2538) tuple2!6666)

(assert (=> b!76593 (= lt!122613 (reader!0 thiss!1090 (_2!3465 lt!122610)))))

(declare-fun res!63275 () Bool)

(declare-fun e!50277 () Bool)

(assert (=> start!14908 (=> (not res!63275) (not e!50277))))

(assert (=> start!14908 (= res!63275 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!14908 e!50277))

(assert (=> start!14908 true))

(declare-fun e!50280 () Bool)

(declare-fun inv!12 (BitStream!2538) Bool)

(assert (=> start!14908 (and (inv!12 thiss!1090) e!50280)))

(declare-fun b!76594 () Bool)

(declare-fun array_inv!1328 (array!3184) Bool)

(assert (=> b!76594 (= e!50280 (array_inv!1328 (buf!1866 thiss!1090)))))

(declare-fun b!76595 () Bool)

(declare-fun res!63273 () Bool)

(assert (=> b!76595 (=> (not res!63273) (not e!50277))))

(assert (=> b!76595 (= res!63273 (validate_offset_bits!1 ((_ sign_extend 32) (size!1482 (buf!1866 thiss!1090))) ((_ sign_extend 32) (currentByte!3665 thiss!1090)) ((_ sign_extend 32) (currentBit!3660 thiss!1090)) nBits!322))))

(declare-fun b!76596 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!76596 (= e!50277 (not (invariant!0 (currentBit!3660 (_2!3465 lt!122610)) (currentByte!3665 (_2!3465 lt!122610)) (size!1482 (buf!1866 (_2!3465 lt!122610))))))))

(assert (=> b!76596 e!50278))

(declare-fun res!63277 () Bool)

(assert (=> b!76596 (=> (not res!63277) (not e!50278))))

(assert (=> b!76596 (= res!63277 (= (size!1482 (buf!1866 thiss!1090)) (size!1482 (buf!1866 (_2!3465 lt!122610)))))))

(declare-fun appendNBits!0 (BitStream!2538 (_ BitVec 64) Bool) tuple2!6662)

(assert (=> b!76596 (= lt!122610 (appendNBits!0 thiss!1090 nBits!322 false))))

(assert (= (and start!14908 res!63275) b!76595))

(assert (= (and b!76595 res!63273) b!76596))

(assert (= (and b!76596 res!63277) b!76592))

(assert (= (and b!76592 res!63276) b!76591))

(assert (= (and b!76591 res!63274) b!76593))

(assert (= start!14908 b!76594))

(declare-fun m!121835 () Bool)

(assert (=> b!76596 m!121835))

(declare-fun m!121837 () Bool)

(assert (=> b!76596 m!121837))

(declare-fun m!121839 () Bool)

(assert (=> start!14908 m!121839))

(declare-fun m!121841 () Bool)

(assert (=> b!76593 m!121841))

(declare-fun m!121843 () Bool)

(assert (=> b!76593 m!121843))

(declare-fun m!121845 () Bool)

(assert (=> b!76593 m!121845))

(declare-fun m!121847 () Bool)

(assert (=> b!76593 m!121847))

(declare-fun m!121849 () Bool)

(assert (=> b!76595 m!121849))

(declare-fun m!121851 () Bool)

(assert (=> b!76594 m!121851))

(declare-fun m!121853 () Bool)

(assert (=> b!76592 m!121853))

(declare-fun m!121855 () Bool)

(assert (=> b!76592 m!121855))

(declare-fun m!121857 () Bool)

(assert (=> b!76591 m!121857))

(check-sat (not b!76591) (not start!14908) (not b!76593) (not b!76596) (not b!76594) (not b!76595) (not b!76592))
(check-sat)
(get-model)

(declare-fun d!24220 () Bool)

(declare-datatypes ((tuple2!6676 0))(
  ( (tuple2!6677 (_1!3472 Bool) (_2!3472 BitStream!2538)) )
))
(declare-fun lt!122628 () tuple2!6676)

(declare-fun checkBitsLoop!0 (BitStream!2538 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6676)

(assert (=> d!24220 (= lt!122628 (checkBitsLoop!0 (_1!3467 lt!122613) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24220 (= (checkBitsLoopPure!0 (_1!3467 lt!122613) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000) (tuple2!6665 (_2!3472 lt!122628) (_1!3472 lt!122628)))))

(declare-fun bs!5851 () Bool)

(assert (= bs!5851 d!24220))

(declare-fun m!121887 () Bool)

(assert (=> bs!5851 m!121887))

(assert (=> b!76593 d!24220))

(declare-fun d!24232 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!24232 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1482 (buf!1866 (_2!3465 lt!122610)))) ((_ sign_extend 32) (currentByte!3665 thiss!1090)) ((_ sign_extend 32) (currentBit!3660 thiss!1090)) nBits!322) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1482 (buf!1866 (_2!3465 lt!122610)))) ((_ sign_extend 32) (currentByte!3665 thiss!1090)) ((_ sign_extend 32) (currentBit!3660 thiss!1090))) nBits!322))))

(declare-fun bs!5852 () Bool)

(assert (= bs!5852 d!24232))

(declare-fun m!121891 () Bool)

(assert (=> bs!5852 m!121891))

(assert (=> b!76593 d!24232))

(declare-fun d!24236 () Bool)

(assert (=> d!24236 (validate_offset_bits!1 ((_ sign_extend 32) (size!1482 (buf!1866 (_2!3465 lt!122610)))) ((_ sign_extend 32) (currentByte!3665 thiss!1090)) ((_ sign_extend 32) (currentBit!3660 thiss!1090)) nBits!322)))

(declare-fun lt!122631 () Unit!5049)

(declare-fun choose!9 (BitStream!2538 array!3184 (_ BitVec 64) BitStream!2538) Unit!5049)

(assert (=> d!24236 (= lt!122631 (choose!9 thiss!1090 (buf!1866 (_2!3465 lt!122610)) nBits!322 (BitStream!2539 (buf!1866 (_2!3465 lt!122610)) (currentByte!3665 thiss!1090) (currentBit!3660 thiss!1090))))))

(assert (=> d!24236 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1866 (_2!3465 lt!122610)) nBits!322) lt!122631)))

(declare-fun bs!5853 () Bool)

(assert (= bs!5853 d!24236))

(assert (=> bs!5853 m!121843))

(declare-fun m!121893 () Bool)

(assert (=> bs!5853 m!121893))

(assert (=> b!76593 d!24236))

(declare-fun b!76645 () Bool)

(declare-fun e!50307 () Unit!5049)

(declare-fun lt!122728 () Unit!5049)

(assert (=> b!76645 (= e!50307 lt!122728)))

(declare-fun lt!122735 () (_ BitVec 64))

(assert (=> b!76645 (= lt!122735 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122732 () (_ BitVec 64))

(assert (=> b!76645 (= lt!122732 (bitIndex!0 (size!1482 (buf!1866 thiss!1090)) (currentByte!3665 thiss!1090) (currentBit!3660 thiss!1090)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!3184 array!3184 (_ BitVec 64) (_ BitVec 64)) Unit!5049)

(assert (=> b!76645 (= lt!122728 (arrayBitRangesEqSymmetric!0 (buf!1866 thiss!1090) (buf!1866 (_2!3465 lt!122610)) lt!122735 lt!122732))))

(declare-fun arrayBitRangesEq!0 (array!3184 array!3184 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76645 (arrayBitRangesEq!0 (buf!1866 (_2!3465 lt!122610)) (buf!1866 thiss!1090) lt!122735 lt!122732)))

(declare-fun b!76646 () Bool)

(declare-fun res!63321 () Bool)

(declare-fun e!50308 () Bool)

(assert (=> b!76646 (=> (not res!63321) (not e!50308))))

(declare-fun lt!122725 () tuple2!6666)

(assert (=> b!76646 (= res!63321 (isPrefixOf!0 (_2!3467 lt!122725) (_2!3465 lt!122610)))))

(declare-fun b!76647 () Bool)

(declare-fun lt!122724 () (_ BitVec 64))

(declare-fun lt!122731 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2538 (_ BitVec 64)) BitStream!2538)

(assert (=> b!76647 (= e!50308 (= (_1!3467 lt!122725) (withMovedBitIndex!0 (_2!3467 lt!122725) (bvsub lt!122724 lt!122731))))))

(assert (=> b!76647 (or (= (bvand lt!122724 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!122731 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!122724 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!122724 lt!122731) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!76647 (= lt!122731 (bitIndex!0 (size!1482 (buf!1866 (_2!3465 lt!122610))) (currentByte!3665 (_2!3465 lt!122610)) (currentBit!3660 (_2!3465 lt!122610))))))

(assert (=> b!76647 (= lt!122724 (bitIndex!0 (size!1482 (buf!1866 thiss!1090)) (currentByte!3665 thiss!1090) (currentBit!3660 thiss!1090)))))

(declare-fun d!24238 () Bool)

(assert (=> d!24238 e!50308))

(declare-fun res!63319 () Bool)

(assert (=> d!24238 (=> (not res!63319) (not e!50308))))

(assert (=> d!24238 (= res!63319 (isPrefixOf!0 (_1!3467 lt!122725) (_2!3467 lt!122725)))))

(declare-fun lt!122737 () BitStream!2538)

(assert (=> d!24238 (= lt!122725 (tuple2!6667 lt!122737 (_2!3465 lt!122610)))))

(declare-fun lt!122736 () Unit!5049)

(declare-fun lt!122730 () Unit!5049)

(assert (=> d!24238 (= lt!122736 lt!122730)))

(assert (=> d!24238 (isPrefixOf!0 lt!122737 (_2!3465 lt!122610))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2538 BitStream!2538 BitStream!2538) Unit!5049)

(assert (=> d!24238 (= lt!122730 (lemmaIsPrefixTransitive!0 lt!122737 (_2!3465 lt!122610) (_2!3465 lt!122610)))))

(declare-fun lt!122720 () Unit!5049)

(declare-fun lt!122726 () Unit!5049)

(assert (=> d!24238 (= lt!122720 lt!122726)))

(assert (=> d!24238 (isPrefixOf!0 lt!122737 (_2!3465 lt!122610))))

(assert (=> d!24238 (= lt!122726 (lemmaIsPrefixTransitive!0 lt!122737 thiss!1090 (_2!3465 lt!122610)))))

(declare-fun lt!122723 () Unit!5049)

(assert (=> d!24238 (= lt!122723 e!50307)))

(declare-fun c!5579 () Bool)

(assert (=> d!24238 (= c!5579 (not (= (size!1482 (buf!1866 thiss!1090)) #b00000000000000000000000000000000)))))

(declare-fun lt!122739 () Unit!5049)

(declare-fun lt!122734 () Unit!5049)

(assert (=> d!24238 (= lt!122739 lt!122734)))

(assert (=> d!24238 (isPrefixOf!0 (_2!3465 lt!122610) (_2!3465 lt!122610))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2538) Unit!5049)

(assert (=> d!24238 (= lt!122734 (lemmaIsPrefixRefl!0 (_2!3465 lt!122610)))))

(declare-fun lt!122729 () Unit!5049)

(declare-fun lt!122727 () Unit!5049)

(assert (=> d!24238 (= lt!122729 lt!122727)))

(assert (=> d!24238 (= lt!122727 (lemmaIsPrefixRefl!0 (_2!3465 lt!122610)))))

(declare-fun lt!122738 () Unit!5049)

(declare-fun lt!122722 () Unit!5049)

(assert (=> d!24238 (= lt!122738 lt!122722)))

(assert (=> d!24238 (isPrefixOf!0 lt!122737 lt!122737)))

(assert (=> d!24238 (= lt!122722 (lemmaIsPrefixRefl!0 lt!122737))))

(declare-fun lt!122733 () Unit!5049)

(declare-fun lt!122721 () Unit!5049)

(assert (=> d!24238 (= lt!122733 lt!122721)))

(assert (=> d!24238 (isPrefixOf!0 thiss!1090 thiss!1090)))

(assert (=> d!24238 (= lt!122721 (lemmaIsPrefixRefl!0 thiss!1090))))

(assert (=> d!24238 (= lt!122737 (BitStream!2539 (buf!1866 (_2!3465 lt!122610)) (currentByte!3665 thiss!1090) (currentBit!3660 thiss!1090)))))

(assert (=> d!24238 (isPrefixOf!0 thiss!1090 (_2!3465 lt!122610))))

(assert (=> d!24238 (= (reader!0 thiss!1090 (_2!3465 lt!122610)) lt!122725)))

(declare-fun b!76648 () Bool)

(declare-fun res!63320 () Bool)

(assert (=> b!76648 (=> (not res!63320) (not e!50308))))

(assert (=> b!76648 (= res!63320 (isPrefixOf!0 (_1!3467 lt!122725) thiss!1090))))

(declare-fun b!76649 () Bool)

(declare-fun Unit!5054 () Unit!5049)

(assert (=> b!76649 (= e!50307 Unit!5054)))

(assert (= (and d!24238 c!5579) b!76645))

(assert (= (and d!24238 (not c!5579)) b!76649))

(assert (= (and d!24238 res!63319) b!76648))

(assert (= (and b!76648 res!63320) b!76646))

(assert (= (and b!76646 res!63321) b!76647))

(assert (=> b!76645 m!121855))

(declare-fun m!121917 () Bool)

(assert (=> b!76645 m!121917))

(declare-fun m!121919 () Bool)

(assert (=> b!76645 m!121919))

(declare-fun m!121921 () Bool)

(assert (=> b!76648 m!121921))

(declare-fun m!121923 () Bool)

(assert (=> b!76647 m!121923))

(assert (=> b!76647 m!121853))

(assert (=> b!76647 m!121855))

(declare-fun m!121925 () Bool)

(assert (=> d!24238 m!121925))

(assert (=> d!24238 m!121857))

(declare-fun m!121927 () Bool)

(assert (=> d!24238 m!121927))

(declare-fun m!121929 () Bool)

(assert (=> d!24238 m!121929))

(declare-fun m!121931 () Bool)

(assert (=> d!24238 m!121931))

(declare-fun m!121933 () Bool)

(assert (=> d!24238 m!121933))

(declare-fun m!121935 () Bool)

(assert (=> d!24238 m!121935))

(declare-fun m!121937 () Bool)

(assert (=> d!24238 m!121937))

(declare-fun m!121939 () Bool)

(assert (=> d!24238 m!121939))

(declare-fun m!121941 () Bool)

(assert (=> d!24238 m!121941))

(declare-fun m!121943 () Bool)

(assert (=> d!24238 m!121943))

(declare-fun m!121945 () Bool)

(assert (=> b!76646 m!121945))

(assert (=> b!76593 d!24238))

(declare-fun d!24254 () Bool)

(declare-fun e!50315 () Bool)

(assert (=> d!24254 e!50315))

(declare-fun res!63333 () Bool)

(assert (=> d!24254 (=> (not res!63333) (not e!50315))))

(declare-fun lt!122796 () (_ BitVec 64))

(declare-fun lt!122794 () (_ BitVec 64))

(declare-fun lt!122795 () (_ BitVec 64))

(assert (=> d!24254 (= res!63333 (= lt!122795 (bvsub lt!122796 lt!122794)))))

(assert (=> d!24254 (or (= (bvand lt!122796 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!122794 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!122796 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!122796 lt!122794) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24254 (= lt!122794 (remainingBits!0 ((_ sign_extend 32) (size!1482 (buf!1866 (_2!3465 lt!122610)))) ((_ sign_extend 32) (currentByte!3665 (_2!3465 lt!122610))) ((_ sign_extend 32) (currentBit!3660 (_2!3465 lt!122610)))))))

(declare-fun lt!122797 () (_ BitVec 64))

(declare-fun lt!122798 () (_ BitVec 64))

(assert (=> d!24254 (= lt!122796 (bvmul lt!122797 lt!122798))))

(assert (=> d!24254 (or (= lt!122797 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!122798 (bvsdiv (bvmul lt!122797 lt!122798) lt!122797)))))

(assert (=> d!24254 (= lt!122798 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24254 (= lt!122797 ((_ sign_extend 32) (size!1482 (buf!1866 (_2!3465 lt!122610)))))))

(assert (=> d!24254 (= lt!122795 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3665 (_2!3465 lt!122610))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3660 (_2!3465 lt!122610)))))))

(assert (=> d!24254 (invariant!0 (currentBit!3660 (_2!3465 lt!122610)) (currentByte!3665 (_2!3465 lt!122610)) (size!1482 (buf!1866 (_2!3465 lt!122610))))))

(assert (=> d!24254 (= (bitIndex!0 (size!1482 (buf!1866 (_2!3465 lt!122610))) (currentByte!3665 (_2!3465 lt!122610)) (currentBit!3660 (_2!3465 lt!122610))) lt!122795)))

(declare-fun b!76664 () Bool)

(declare-fun res!63332 () Bool)

(assert (=> b!76664 (=> (not res!63332) (not e!50315))))

(assert (=> b!76664 (= res!63332 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!122795))))

(declare-fun b!76665 () Bool)

(declare-fun lt!122799 () (_ BitVec 64))

(assert (=> b!76665 (= e!50315 (bvsle lt!122795 (bvmul lt!122799 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!76665 (or (= lt!122799 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!122799 #b0000000000000000000000000000000000000000000000000000000000001000) lt!122799)))))

(assert (=> b!76665 (= lt!122799 ((_ sign_extend 32) (size!1482 (buf!1866 (_2!3465 lt!122610)))))))

(assert (= (and d!24254 res!63333) b!76664))

(assert (= (and b!76664 res!63332) b!76665))

(declare-fun m!121947 () Bool)

(assert (=> d!24254 m!121947))

(assert (=> d!24254 m!121835))

(assert (=> b!76592 d!24254))

(declare-fun d!24256 () Bool)

(declare-fun e!50318 () Bool)

(assert (=> d!24256 e!50318))

(declare-fun res!63341 () Bool)

(assert (=> d!24256 (=> (not res!63341) (not e!50318))))

(declare-fun lt!122808 () (_ BitVec 64))

(declare-fun lt!122807 () (_ BitVec 64))

(declare-fun lt!122806 () (_ BitVec 64))

(assert (=> d!24256 (= res!63341 (= lt!122807 (bvsub lt!122808 lt!122806)))))

(assert (=> d!24256 (or (= (bvand lt!122808 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!122806 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!122808 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!122808 lt!122806) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24256 (= lt!122806 (remainingBits!0 ((_ sign_extend 32) (size!1482 (buf!1866 thiss!1090))) ((_ sign_extend 32) (currentByte!3665 thiss!1090)) ((_ sign_extend 32) (currentBit!3660 thiss!1090))))))

(declare-fun lt!122809 () (_ BitVec 64))

(declare-fun lt!122810 () (_ BitVec 64))

(assert (=> d!24256 (= lt!122808 (bvmul lt!122809 lt!122810))))

(assert (=> d!24256 (or (= lt!122809 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!122810 (bvsdiv (bvmul lt!122809 lt!122810) lt!122809)))))

(assert (=> d!24256 (= lt!122810 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24256 (= lt!122809 ((_ sign_extend 32) (size!1482 (buf!1866 thiss!1090))))))

(assert (=> d!24256 (= lt!122807 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3665 thiss!1090)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3660 thiss!1090))))))

(assert (=> d!24256 (invariant!0 (currentBit!3660 thiss!1090) (currentByte!3665 thiss!1090) (size!1482 (buf!1866 thiss!1090)))))

(assert (=> d!24256 (= (bitIndex!0 (size!1482 (buf!1866 thiss!1090)) (currentByte!3665 thiss!1090) (currentBit!3660 thiss!1090)) lt!122807)))

(declare-fun b!76672 () Bool)

(declare-fun res!63340 () Bool)

(assert (=> b!76672 (=> (not res!63340) (not e!50318))))

(assert (=> b!76672 (= res!63340 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!122807))))

(declare-fun b!76673 () Bool)

(declare-fun lt!122811 () (_ BitVec 64))

(assert (=> b!76673 (= e!50318 (bvsle lt!122807 (bvmul lt!122811 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!76673 (or (= lt!122811 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!122811 #b0000000000000000000000000000000000000000000000000000000000001000) lt!122811)))))

(assert (=> b!76673 (= lt!122811 ((_ sign_extend 32) (size!1482 (buf!1866 thiss!1090))))))

(assert (= (and d!24256 res!63341) b!76672))

(assert (= (and b!76672 res!63340) b!76673))

(declare-fun m!121949 () Bool)

(assert (=> d!24256 m!121949))

(declare-fun m!121951 () Bool)

(assert (=> d!24256 m!121951))

(assert (=> b!76592 d!24256))

(declare-fun d!24258 () Bool)

(assert (=> d!24258 (= (inv!12 thiss!1090) (invariant!0 (currentBit!3660 thiss!1090) (currentByte!3665 thiss!1090) (size!1482 (buf!1866 thiss!1090))))))

(declare-fun bs!5857 () Bool)

(assert (= bs!5857 d!24258))

(assert (=> bs!5857 m!121951))

(assert (=> start!14908 d!24258))

(declare-fun d!24260 () Bool)

(assert (=> d!24260 (= (invariant!0 (currentBit!3660 (_2!3465 lt!122610)) (currentByte!3665 (_2!3465 lt!122610)) (size!1482 (buf!1866 (_2!3465 lt!122610)))) (and (bvsge (currentBit!3660 (_2!3465 lt!122610)) #b00000000000000000000000000000000) (bvslt (currentBit!3660 (_2!3465 lt!122610)) #b00000000000000000000000000001000) (bvsge (currentByte!3665 (_2!3465 lt!122610)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3665 (_2!3465 lt!122610)) (size!1482 (buf!1866 (_2!3465 lt!122610)))) (and (= (currentBit!3660 (_2!3465 lt!122610)) #b00000000000000000000000000000000) (= (currentByte!3665 (_2!3465 lt!122610)) (size!1482 (buf!1866 (_2!3465 lt!122610))))))))))

(assert (=> b!76596 d!24260))

(declare-fun d!24266 () Bool)

(declare-fun e!50346 () Bool)

(assert (=> d!24266 e!50346))

(declare-fun res!63386 () Bool)

(assert (=> d!24266 (=> (not res!63386) (not e!50346))))

(declare-fun lt!122888 () tuple2!6662)

(assert (=> d!24266 (= res!63386 (= (size!1482 (buf!1866 thiss!1090)) (size!1482 (buf!1866 (_2!3465 lt!122888)))))))

(declare-fun choose!36 (BitStream!2538 (_ BitVec 64) Bool) tuple2!6662)

(assert (=> d!24266 (= lt!122888 (choose!36 thiss!1090 nBits!322 false))))

(assert (=> d!24266 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!24266 (= (appendNBits!0 thiss!1090 nBits!322 false) lt!122888)))

(declare-fun b!76720 () Bool)

(declare-fun res!63387 () Bool)

(assert (=> b!76720 (=> (not res!63387) (not e!50346))))

(assert (=> b!76720 (= res!63387 (isPrefixOf!0 thiss!1090 (_2!3465 lt!122888)))))

(declare-fun b!76722 () Bool)

(declare-fun e!50345 () Bool)

(assert (=> b!76722 (= e!50345 (validate_offset_bits!1 ((_ sign_extend 32) (size!1482 (buf!1866 thiss!1090))) ((_ sign_extend 32) (currentByte!3665 thiss!1090)) ((_ sign_extend 32) (currentBit!3660 thiss!1090)) nBits!322))))

(declare-fun b!76721 () Bool)

(declare-fun lt!122889 () tuple2!6664)

(declare-fun lt!122885 () tuple2!6666)

(assert (=> b!76721 (= e!50346 (and (_2!3466 lt!122889) (= (_1!3466 lt!122889) (_2!3467 lt!122885))))))

(assert (=> b!76721 (= lt!122889 (checkBitsLoopPure!0 (_1!3467 lt!122885) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!122887 () Unit!5049)

(declare-fun lt!122886 () Unit!5049)

(assert (=> b!76721 (= lt!122887 lt!122886)))

(assert (=> b!76721 (validate_offset_bits!1 ((_ sign_extend 32) (size!1482 (buf!1866 (_2!3465 lt!122888)))) ((_ sign_extend 32) (currentByte!3665 thiss!1090)) ((_ sign_extend 32) (currentBit!3660 thiss!1090)) nBits!322)))

(assert (=> b!76721 (= lt!122886 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1866 (_2!3465 lt!122888)) nBits!322))))

(assert (=> b!76721 e!50345))

(declare-fun res!63385 () Bool)

(assert (=> b!76721 (=> (not res!63385) (not e!50345))))

(assert (=> b!76721 (= res!63385 (and (= (size!1482 (buf!1866 thiss!1090)) (size!1482 (buf!1866 (_2!3465 lt!122888)))) (bvsge nBits!322 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!76721 (= lt!122885 (reader!0 thiss!1090 (_2!3465 lt!122888)))))

(declare-fun b!76719 () Bool)

(declare-fun res!63388 () Bool)

(assert (=> b!76719 (=> (not res!63388) (not e!50346))))

(declare-fun lt!122884 () (_ BitVec 64))

(assert (=> b!76719 (= res!63388 (= (bitIndex!0 (size!1482 (buf!1866 (_2!3465 lt!122888))) (currentByte!3665 (_2!3465 lt!122888)) (currentBit!3660 (_2!3465 lt!122888))) (bvadd lt!122884 nBits!322)))))

(assert (=> b!76719 (or (not (= (bvand lt!122884 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!322 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!122884 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!122884 nBits!322) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!76719 (= lt!122884 (bitIndex!0 (size!1482 (buf!1866 thiss!1090)) (currentByte!3665 thiss!1090) (currentBit!3660 thiss!1090)))))

(assert (= (and d!24266 res!63386) b!76719))

(assert (= (and b!76719 res!63388) b!76720))

(assert (= (and b!76720 res!63387) b!76721))

(assert (= (and b!76721 res!63385) b!76722))

(declare-fun m!122011 () Bool)

(assert (=> b!76720 m!122011))

(declare-fun m!122013 () Bool)

(assert (=> d!24266 m!122013))

(declare-fun m!122015 () Bool)

(assert (=> b!76721 m!122015))

(declare-fun m!122017 () Bool)

(assert (=> b!76721 m!122017))

(declare-fun m!122019 () Bool)

(assert (=> b!76721 m!122019))

(declare-fun m!122021 () Bool)

(assert (=> b!76721 m!122021))

(declare-fun m!122023 () Bool)

(assert (=> b!76719 m!122023))

(assert (=> b!76719 m!121855))

(assert (=> b!76722 m!121849))

(assert (=> b!76596 d!24266))

(declare-fun d!24284 () Bool)

(declare-fun res!63401 () Bool)

(declare-fun e!50355 () Bool)

(assert (=> d!24284 (=> (not res!63401) (not e!50355))))

(assert (=> d!24284 (= res!63401 (= (size!1482 (buf!1866 thiss!1090)) (size!1482 (buf!1866 (_2!3465 lt!122610)))))))

(assert (=> d!24284 (= (isPrefixOf!0 thiss!1090 (_2!3465 lt!122610)) e!50355)))

(declare-fun b!76739 () Bool)

(declare-fun res!63403 () Bool)

(assert (=> b!76739 (=> (not res!63403) (not e!50355))))

(assert (=> b!76739 (= res!63403 (bvsle (bitIndex!0 (size!1482 (buf!1866 thiss!1090)) (currentByte!3665 thiss!1090) (currentBit!3660 thiss!1090)) (bitIndex!0 (size!1482 (buf!1866 (_2!3465 lt!122610))) (currentByte!3665 (_2!3465 lt!122610)) (currentBit!3660 (_2!3465 lt!122610)))))))

(declare-fun b!76740 () Bool)

(declare-fun e!50356 () Bool)

(assert (=> b!76740 (= e!50355 e!50356)))

(declare-fun res!63402 () Bool)

(assert (=> b!76740 (=> res!63402 e!50356)))

(assert (=> b!76740 (= res!63402 (= (size!1482 (buf!1866 thiss!1090)) #b00000000000000000000000000000000))))

(declare-fun b!76741 () Bool)

(assert (=> b!76741 (= e!50356 (arrayBitRangesEq!0 (buf!1866 thiss!1090) (buf!1866 (_2!3465 lt!122610)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1482 (buf!1866 thiss!1090)) (currentByte!3665 thiss!1090) (currentBit!3660 thiss!1090))))))

(assert (= (and d!24284 res!63401) b!76739))

(assert (= (and b!76739 res!63403) b!76740))

(assert (= (and b!76740 (not res!63402)) b!76741))

(assert (=> b!76739 m!121855))

(assert (=> b!76739 m!121853))

(assert (=> b!76741 m!121855))

(assert (=> b!76741 m!121855))

(declare-fun m!122025 () Bool)

(assert (=> b!76741 m!122025))

(assert (=> b!76591 d!24284))

(declare-fun d!24286 () Bool)

(assert (=> d!24286 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1482 (buf!1866 thiss!1090))) ((_ sign_extend 32) (currentByte!3665 thiss!1090)) ((_ sign_extend 32) (currentBit!3660 thiss!1090)) nBits!322) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1482 (buf!1866 thiss!1090))) ((_ sign_extend 32) (currentByte!3665 thiss!1090)) ((_ sign_extend 32) (currentBit!3660 thiss!1090))) nBits!322))))

(declare-fun bs!5862 () Bool)

(assert (= bs!5862 d!24286))

(assert (=> bs!5862 m!121949))

(assert (=> b!76595 d!24286))

(declare-fun d!24288 () Bool)

(assert (=> d!24288 (= (array_inv!1328 (buf!1866 thiss!1090)) (bvsge (size!1482 (buf!1866 thiss!1090)) #b00000000000000000000000000000000))))

(assert (=> b!76594 d!24288))

(check-sat (not b!76648) (not b!76645) (not d!24256) (not b!76741) (not b!76720) (not b!76722) (not d!24254) (not d!24232) (not b!76646) (not b!76719) (not d!24220) (not d!24236) (not b!76739) (not d!24286) (not b!76721) (not d!24238) (not b!76647) (not d!24266) (not d!24258))
