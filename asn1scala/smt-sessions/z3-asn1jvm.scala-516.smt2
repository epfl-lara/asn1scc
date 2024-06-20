; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15076 () Bool)

(assert start!15076)

(declare-fun b!77287 () Bool)

(declare-fun res!63862 () Bool)

(declare-fun e!50697 () Bool)

(assert (=> b!77287 (=> (not res!63862) (not e!50697))))

(declare-datatypes ((array!3238 0))(
  ( (array!3239 (arr!2107 (Array (_ BitVec 32) (_ BitVec 8))) (size!1506 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2586 0))(
  ( (BitStream!2587 (buf!1896 array!3238) (currentByte!3707 (_ BitVec 32)) (currentBit!3702 (_ BitVec 32))) )
))
(declare-fun thiss!1090 () BitStream!2586)

(declare-datatypes ((Unit!5103 0))(
  ( (Unit!5104) )
))
(declare-datatypes ((tuple2!6818 0))(
  ( (tuple2!6819 (_1!3543 Unit!5103) (_2!3543 BitStream!2586)) )
))
(declare-fun lt!123801 () tuple2!6818)

(declare-fun isPrefixOf!0 (BitStream!2586 BitStream!2586) Bool)

(assert (=> b!77287 (= res!63862 (isPrefixOf!0 thiss!1090 (_2!3543 lt!123801)))))

(declare-fun b!77288 () Bool)

(declare-fun res!63863 () Bool)

(declare-fun e!50699 () Bool)

(assert (=> b!77288 (=> (not res!63863) (not e!50699))))

(declare-fun nBits!322 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!77288 (= res!63863 (validate_offset_bits!1 ((_ sign_extend 32) (size!1506 (buf!1896 thiss!1090))) ((_ sign_extend 32) (currentByte!3707 thiss!1090)) ((_ sign_extend 32) (currentBit!3702 thiss!1090)) nBits!322))))

(declare-fun b!77289 () Bool)

(declare-datatypes ((tuple2!6820 0))(
  ( (tuple2!6821 (_1!3544 BitStream!2586) (_2!3544 BitStream!2586)) )
))
(declare-fun lt!123800 () tuple2!6820)

(assert (=> b!77289 (= e!50699 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!1506 (buf!1896 (_1!3544 lt!123800)))) ((_ sign_extend 32) (currentByte!3707 (_1!3544 lt!123800))) ((_ sign_extend 32) (currentBit!3702 (_1!3544 lt!123800))) nBits!322)))))

(assert (=> b!77289 (validate_offset_bits!1 ((_ sign_extend 32) (size!1506 (buf!1896 (_2!3543 lt!123801)))) ((_ sign_extend 32) (currentByte!3707 thiss!1090)) ((_ sign_extend 32) (currentBit!3702 thiss!1090)) nBits!322)))

(declare-fun lt!123804 () Unit!5103)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2586 array!3238 (_ BitVec 64)) Unit!5103)

(assert (=> b!77289 (= lt!123804 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1896 (_2!3543 lt!123801)) nBits!322))))

(declare-fun reader!0 (BitStream!2586 BitStream!2586) tuple2!6820)

(assert (=> b!77289 (= lt!123800 (reader!0 thiss!1090 (_2!3543 lt!123801)))))

(declare-fun lt!123799 () Bool)

(assert (=> b!77289 (= lt!123799 (isPrefixOf!0 thiss!1090 (_2!3543 lt!123801)))))

(declare-fun lt!123803 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!77289 (= lt!123803 (bitIndex!0 (size!1506 (buf!1896 (_2!3543 lt!123801))) (currentByte!3707 (_2!3543 lt!123801)) (currentBit!3702 (_2!3543 lt!123801))))))

(declare-fun lt!123802 () (_ BitVec 64))

(assert (=> b!77289 (= lt!123802 (bitIndex!0 (size!1506 (buf!1896 thiss!1090)) (currentByte!3707 thiss!1090) (currentBit!3702 thiss!1090)))))

(assert (=> b!77289 e!50697))

(declare-fun res!63861 () Bool)

(assert (=> b!77289 (=> (not res!63861) (not e!50697))))

(assert (=> b!77289 (= res!63861 (= (size!1506 (buf!1896 thiss!1090)) (size!1506 (buf!1896 (_2!3543 lt!123801)))))))

(declare-fun appendNBits!0 (BitStream!2586 (_ BitVec 64) Bool) tuple2!6818)

(assert (=> b!77289 (= lt!123801 (appendNBits!0 thiss!1090 nBits!322 false))))

(declare-fun b!77290 () Bool)

(declare-fun e!50698 () Bool)

(declare-fun array_inv!1352 (array!3238) Bool)

(assert (=> b!77290 (= e!50698 (array_inv!1352 (buf!1896 thiss!1090)))))

(declare-fun b!77291 () Bool)

(declare-fun res!63864 () Bool)

(assert (=> b!77291 (=> (not res!63864) (not e!50697))))

(assert (=> b!77291 (= res!63864 (= (bitIndex!0 (size!1506 (buf!1896 (_2!3543 lt!123801))) (currentByte!3707 (_2!3543 lt!123801)) (currentBit!3702 (_2!3543 lt!123801))) (bvadd (bitIndex!0 (size!1506 (buf!1896 thiss!1090)) (currentByte!3707 thiss!1090) (currentBit!3702 thiss!1090)) nBits!322)))))

(declare-fun res!63865 () Bool)

(assert (=> start!15076 (=> (not res!63865) (not e!50699))))

(assert (=> start!15076 (= res!63865 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15076 e!50699))

(assert (=> start!15076 true))

(declare-fun inv!12 (BitStream!2586) Bool)

(assert (=> start!15076 (and (inv!12 thiss!1090) e!50698)))

(declare-fun b!77292 () Bool)

(declare-datatypes ((tuple2!6822 0))(
  ( (tuple2!6823 (_1!3545 BitStream!2586) (_2!3545 Bool)) )
))
(declare-fun lt!123797 () tuple2!6822)

(declare-fun lt!123798 () tuple2!6820)

(assert (=> b!77292 (= e!50697 (not (or (not (_2!3545 lt!123797)) (not (= (_1!3545 lt!123797) (_2!3544 lt!123798))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!2586 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6822)

(assert (=> b!77292 (= lt!123797 (checkBitsLoopPure!0 (_1!3544 lt!123798) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!77292 (validate_offset_bits!1 ((_ sign_extend 32) (size!1506 (buf!1896 (_2!3543 lt!123801)))) ((_ sign_extend 32) (currentByte!3707 thiss!1090)) ((_ sign_extend 32) (currentBit!3702 thiss!1090)) nBits!322)))

(declare-fun lt!123796 () Unit!5103)

(assert (=> b!77292 (= lt!123796 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1896 (_2!3543 lt!123801)) nBits!322))))

(assert (=> b!77292 (= lt!123798 (reader!0 thiss!1090 (_2!3543 lt!123801)))))

(assert (= (and start!15076 res!63865) b!77288))

(assert (= (and b!77288 res!63863) b!77289))

(assert (= (and b!77289 res!63861) b!77291))

(assert (= (and b!77291 res!63864) b!77287))

(assert (= (and b!77287 res!63862) b!77292))

(assert (= start!15076 b!77290))

(declare-fun m!122723 () Bool)

(assert (=> b!77292 m!122723))

(declare-fun m!122725 () Bool)

(assert (=> b!77292 m!122725))

(declare-fun m!122727 () Bool)

(assert (=> b!77292 m!122727))

(declare-fun m!122729 () Bool)

(assert (=> b!77292 m!122729))

(declare-fun m!122731 () Bool)

(assert (=> start!15076 m!122731))

(declare-fun m!122733 () Bool)

(assert (=> b!77289 m!122733))

(assert (=> b!77289 m!122727))

(declare-fun m!122735 () Bool)

(assert (=> b!77289 m!122735))

(declare-fun m!122737 () Bool)

(assert (=> b!77289 m!122737))

(assert (=> b!77289 m!122725))

(declare-fun m!122739 () Bool)

(assert (=> b!77289 m!122739))

(declare-fun m!122741 () Bool)

(assert (=> b!77289 m!122741))

(assert (=> b!77289 m!122729))

(assert (=> b!77287 m!122737))

(declare-fun m!122743 () Bool)

(assert (=> b!77288 m!122743))

(declare-fun m!122745 () Bool)

(assert (=> b!77290 m!122745))

(assert (=> b!77291 m!122735))

(assert (=> b!77291 m!122733))

(check-sat (not start!15076) (not b!77287) (not b!77290) (not b!77292) (not b!77289) (not b!77288) (not b!77291))
(check-sat)
(get-model)

(declare-fun d!24380 () Bool)

(declare-fun e!50715 () Bool)

(assert (=> d!24380 e!50715))

(declare-fun res!63886 () Bool)

(assert (=> d!24380 (=> (not res!63886) (not e!50715))))

(declare-fun lt!123846 () (_ BitVec 64))

(declare-fun lt!123851 () (_ BitVec 64))

(declare-fun lt!123850 () (_ BitVec 64))

(assert (=> d!24380 (= res!63886 (= lt!123846 (bvsub lt!123851 lt!123850)))))

(assert (=> d!24380 (or (= (bvand lt!123851 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!123850 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!123851 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!123851 lt!123850) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!24380 (= lt!123850 (remainingBits!0 ((_ sign_extend 32) (size!1506 (buf!1896 (_2!3543 lt!123801)))) ((_ sign_extend 32) (currentByte!3707 (_2!3543 lt!123801))) ((_ sign_extend 32) (currentBit!3702 (_2!3543 lt!123801)))))))

(declare-fun lt!123847 () (_ BitVec 64))

(declare-fun lt!123848 () (_ BitVec 64))

(assert (=> d!24380 (= lt!123851 (bvmul lt!123847 lt!123848))))

(assert (=> d!24380 (or (= lt!123847 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!123848 (bvsdiv (bvmul lt!123847 lt!123848) lt!123847)))))

(assert (=> d!24380 (= lt!123848 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24380 (= lt!123847 ((_ sign_extend 32) (size!1506 (buf!1896 (_2!3543 lt!123801)))))))

(assert (=> d!24380 (= lt!123846 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3707 (_2!3543 lt!123801))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3702 (_2!3543 lt!123801)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!24380 (invariant!0 (currentBit!3702 (_2!3543 lt!123801)) (currentByte!3707 (_2!3543 lt!123801)) (size!1506 (buf!1896 (_2!3543 lt!123801))))))

(assert (=> d!24380 (= (bitIndex!0 (size!1506 (buf!1896 (_2!3543 lt!123801))) (currentByte!3707 (_2!3543 lt!123801)) (currentBit!3702 (_2!3543 lt!123801))) lt!123846)))

(declare-fun b!77315 () Bool)

(declare-fun res!63885 () Bool)

(assert (=> b!77315 (=> (not res!63885) (not e!50715))))

(assert (=> b!77315 (= res!63885 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!123846))))

(declare-fun b!77316 () Bool)

(declare-fun lt!123849 () (_ BitVec 64))

(assert (=> b!77316 (= e!50715 (bvsle lt!123846 (bvmul lt!123849 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!77316 (or (= lt!123849 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!123849 #b0000000000000000000000000000000000000000000000000000000000001000) lt!123849)))))

(assert (=> b!77316 (= lt!123849 ((_ sign_extend 32) (size!1506 (buf!1896 (_2!3543 lt!123801)))))))

(assert (= (and d!24380 res!63886) b!77315))

(assert (= (and b!77315 res!63885) b!77316))

(declare-fun m!122771 () Bool)

(assert (=> d!24380 m!122771))

(declare-fun m!122773 () Bool)

(assert (=> d!24380 m!122773))

(assert (=> b!77291 d!24380))

(declare-fun d!24388 () Bool)

(declare-fun e!50718 () Bool)

(assert (=> d!24388 e!50718))

(declare-fun res!63892 () Bool)

(assert (=> d!24388 (=> (not res!63892) (not e!50718))))

(declare-fun lt!123867 () (_ BitVec 64))

(declare-fun lt!123862 () (_ BitVec 64))

(declare-fun lt!123866 () (_ BitVec 64))

(assert (=> d!24388 (= res!63892 (= lt!123862 (bvsub lt!123867 lt!123866)))))

(assert (=> d!24388 (or (= (bvand lt!123867 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!123866 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!123867 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!123867 lt!123866) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24388 (= lt!123866 (remainingBits!0 ((_ sign_extend 32) (size!1506 (buf!1896 thiss!1090))) ((_ sign_extend 32) (currentByte!3707 thiss!1090)) ((_ sign_extend 32) (currentBit!3702 thiss!1090))))))

(declare-fun lt!123863 () (_ BitVec 64))

(declare-fun lt!123864 () (_ BitVec 64))

(assert (=> d!24388 (= lt!123867 (bvmul lt!123863 lt!123864))))

(assert (=> d!24388 (or (= lt!123863 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!123864 (bvsdiv (bvmul lt!123863 lt!123864) lt!123863)))))

(assert (=> d!24388 (= lt!123864 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24388 (= lt!123863 ((_ sign_extend 32) (size!1506 (buf!1896 thiss!1090))))))

(assert (=> d!24388 (= lt!123862 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3707 thiss!1090)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3702 thiss!1090))))))

(assert (=> d!24388 (invariant!0 (currentBit!3702 thiss!1090) (currentByte!3707 thiss!1090) (size!1506 (buf!1896 thiss!1090)))))

(assert (=> d!24388 (= (bitIndex!0 (size!1506 (buf!1896 thiss!1090)) (currentByte!3707 thiss!1090) (currentBit!3702 thiss!1090)) lt!123862)))

(declare-fun b!77321 () Bool)

(declare-fun res!63891 () Bool)

(assert (=> b!77321 (=> (not res!63891) (not e!50718))))

(assert (=> b!77321 (= res!63891 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!123862))))

(declare-fun b!77322 () Bool)

(declare-fun lt!123865 () (_ BitVec 64))

(assert (=> b!77322 (= e!50718 (bvsle lt!123862 (bvmul lt!123865 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!77322 (or (= lt!123865 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!123865 #b0000000000000000000000000000000000000000000000000000000000001000) lt!123865)))))

(assert (=> b!77322 (= lt!123865 ((_ sign_extend 32) (size!1506 (buf!1896 thiss!1090))))))

(assert (= (and d!24388 res!63892) b!77321))

(assert (= (and b!77321 res!63891) b!77322))

(declare-fun m!122775 () Bool)

(assert (=> d!24388 m!122775))

(declare-fun m!122777 () Bool)

(assert (=> d!24388 m!122777))

(assert (=> b!77291 d!24388))

(declare-fun d!24390 () Bool)

(declare-datatypes ((tuple2!6830 0))(
  ( (tuple2!6831 (_1!3549 Bool) (_2!3549 BitStream!2586)) )
))
(declare-fun lt!123906 () tuple2!6830)

(declare-fun checkBitsLoop!0 (BitStream!2586 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6830)

(assert (=> d!24390 (= lt!123906 (checkBitsLoop!0 (_1!3544 lt!123798) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24390 (= (checkBitsLoopPure!0 (_1!3544 lt!123798) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000) (tuple2!6823 (_2!3549 lt!123906) (_1!3549 lt!123906)))))

(declare-fun bs!5903 () Bool)

(assert (= bs!5903 d!24390))

(declare-fun m!122795 () Bool)

(assert (=> bs!5903 m!122795))

(assert (=> b!77292 d!24390))

(declare-fun d!24402 () Bool)

(assert (=> d!24402 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1506 (buf!1896 (_2!3543 lt!123801)))) ((_ sign_extend 32) (currentByte!3707 thiss!1090)) ((_ sign_extend 32) (currentBit!3702 thiss!1090)) nBits!322) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1506 (buf!1896 (_2!3543 lt!123801)))) ((_ sign_extend 32) (currentByte!3707 thiss!1090)) ((_ sign_extend 32) (currentBit!3702 thiss!1090))) nBits!322))))

(declare-fun bs!5904 () Bool)

(assert (= bs!5904 d!24402))

(declare-fun m!122797 () Bool)

(assert (=> bs!5904 m!122797))

(assert (=> b!77292 d!24402))

(declare-fun d!24404 () Bool)

(assert (=> d!24404 (validate_offset_bits!1 ((_ sign_extend 32) (size!1506 (buf!1896 (_2!3543 lt!123801)))) ((_ sign_extend 32) (currentByte!3707 thiss!1090)) ((_ sign_extend 32) (currentBit!3702 thiss!1090)) nBits!322)))

(declare-fun lt!123912 () Unit!5103)

(declare-fun choose!9 (BitStream!2586 array!3238 (_ BitVec 64) BitStream!2586) Unit!5103)

(assert (=> d!24404 (= lt!123912 (choose!9 thiss!1090 (buf!1896 (_2!3543 lt!123801)) nBits!322 (BitStream!2587 (buf!1896 (_2!3543 lt!123801)) (currentByte!3707 thiss!1090) (currentBit!3702 thiss!1090))))))

(assert (=> d!24404 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1896 (_2!3543 lt!123801)) nBits!322) lt!123912)))

(declare-fun bs!5907 () Bool)

(assert (= bs!5907 d!24404))

(assert (=> bs!5907 m!122725))

(declare-fun m!122803 () Bool)

(assert (=> bs!5907 m!122803))

(assert (=> b!77292 d!24404))

(declare-fun b!77374 () Bool)

(declare-fun res!63934 () Bool)

(declare-fun e!50744 () Bool)

(assert (=> b!77374 (=> (not res!63934) (not e!50744))))

(declare-fun lt!124054 () tuple2!6820)

(assert (=> b!77374 (= res!63934 (isPrefixOf!0 (_2!3544 lt!124054) (_2!3543 lt!123801)))))

(declare-fun lt!124052 () (_ BitVec 64))

(declare-fun b!77375 () Bool)

(declare-fun lt!124043 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2586 (_ BitVec 64)) BitStream!2586)

(assert (=> b!77375 (= e!50744 (= (_1!3544 lt!124054) (withMovedBitIndex!0 (_2!3544 lt!124054) (bvsub lt!124052 lt!124043))))))

(assert (=> b!77375 (or (= (bvand lt!124052 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!124043 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!124052 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!124052 lt!124043) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!77375 (= lt!124043 (bitIndex!0 (size!1506 (buf!1896 (_2!3543 lt!123801))) (currentByte!3707 (_2!3543 lt!123801)) (currentBit!3702 (_2!3543 lt!123801))))))

(assert (=> b!77375 (= lt!124052 (bitIndex!0 (size!1506 (buf!1896 thiss!1090)) (currentByte!3707 thiss!1090) (currentBit!3702 thiss!1090)))))

(declare-fun b!77376 () Bool)

(declare-fun e!50743 () Unit!5103)

(declare-fun Unit!5107 () Unit!5103)

(assert (=> b!77376 (= e!50743 Unit!5107)))

(declare-fun d!24410 () Bool)

(assert (=> d!24410 e!50744))

(declare-fun res!63933 () Bool)

(assert (=> d!24410 (=> (not res!63933) (not e!50744))))

(assert (=> d!24410 (= res!63933 (isPrefixOf!0 (_1!3544 lt!124054) (_2!3544 lt!124054)))))

(declare-fun lt!124045 () BitStream!2586)

(assert (=> d!24410 (= lt!124054 (tuple2!6821 lt!124045 (_2!3543 lt!123801)))))

(declare-fun lt!124055 () Unit!5103)

(declare-fun lt!124050 () Unit!5103)

(assert (=> d!24410 (= lt!124055 lt!124050)))

(assert (=> d!24410 (isPrefixOf!0 lt!124045 (_2!3543 lt!123801))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2586 BitStream!2586 BitStream!2586) Unit!5103)

(assert (=> d!24410 (= lt!124050 (lemmaIsPrefixTransitive!0 lt!124045 (_2!3543 lt!123801) (_2!3543 lt!123801)))))

(declare-fun lt!124057 () Unit!5103)

(declare-fun lt!124042 () Unit!5103)

(assert (=> d!24410 (= lt!124057 lt!124042)))

(assert (=> d!24410 (isPrefixOf!0 lt!124045 (_2!3543 lt!123801))))

(assert (=> d!24410 (= lt!124042 (lemmaIsPrefixTransitive!0 lt!124045 thiss!1090 (_2!3543 lt!123801)))))

(declare-fun lt!124044 () Unit!5103)

(assert (=> d!24410 (= lt!124044 e!50743)))

(declare-fun c!5601 () Bool)

(assert (=> d!24410 (= c!5601 (not (= (size!1506 (buf!1896 thiss!1090)) #b00000000000000000000000000000000)))))

(declare-fun lt!124049 () Unit!5103)

(declare-fun lt!124048 () Unit!5103)

(assert (=> d!24410 (= lt!124049 lt!124048)))

(assert (=> d!24410 (isPrefixOf!0 (_2!3543 lt!123801) (_2!3543 lt!123801))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2586) Unit!5103)

(assert (=> d!24410 (= lt!124048 (lemmaIsPrefixRefl!0 (_2!3543 lt!123801)))))

(declare-fun lt!124041 () Unit!5103)

(declare-fun lt!124047 () Unit!5103)

(assert (=> d!24410 (= lt!124041 lt!124047)))

(assert (=> d!24410 (= lt!124047 (lemmaIsPrefixRefl!0 (_2!3543 lt!123801)))))

(declare-fun lt!124039 () Unit!5103)

(declare-fun lt!124046 () Unit!5103)

(assert (=> d!24410 (= lt!124039 lt!124046)))

(assert (=> d!24410 (isPrefixOf!0 lt!124045 lt!124045)))

(assert (=> d!24410 (= lt!124046 (lemmaIsPrefixRefl!0 lt!124045))))

(declare-fun lt!124056 () Unit!5103)

(declare-fun lt!124051 () Unit!5103)

(assert (=> d!24410 (= lt!124056 lt!124051)))

(assert (=> d!24410 (isPrefixOf!0 thiss!1090 thiss!1090)))

(assert (=> d!24410 (= lt!124051 (lemmaIsPrefixRefl!0 thiss!1090))))

(assert (=> d!24410 (= lt!124045 (BitStream!2587 (buf!1896 (_2!3543 lt!123801)) (currentByte!3707 thiss!1090) (currentBit!3702 thiss!1090)))))

(assert (=> d!24410 (isPrefixOf!0 thiss!1090 (_2!3543 lt!123801))))

(assert (=> d!24410 (= (reader!0 thiss!1090 (_2!3543 lt!123801)) lt!124054)))

(declare-fun b!77377 () Bool)

(declare-fun res!63932 () Bool)

(assert (=> b!77377 (=> (not res!63932) (not e!50744))))

(assert (=> b!77377 (= res!63932 (isPrefixOf!0 (_1!3544 lt!124054) thiss!1090))))

(declare-fun b!77378 () Bool)

(declare-fun lt!124053 () Unit!5103)

(assert (=> b!77378 (= e!50743 lt!124053)))

(declare-fun lt!124058 () (_ BitVec 64))

(assert (=> b!77378 (= lt!124058 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124040 () (_ BitVec 64))

(assert (=> b!77378 (= lt!124040 (bitIndex!0 (size!1506 (buf!1896 thiss!1090)) (currentByte!3707 thiss!1090) (currentBit!3702 thiss!1090)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!3238 array!3238 (_ BitVec 64) (_ BitVec 64)) Unit!5103)

(assert (=> b!77378 (= lt!124053 (arrayBitRangesEqSymmetric!0 (buf!1896 thiss!1090) (buf!1896 (_2!3543 lt!123801)) lt!124058 lt!124040))))

(declare-fun arrayBitRangesEq!0 (array!3238 array!3238 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!77378 (arrayBitRangesEq!0 (buf!1896 (_2!3543 lt!123801)) (buf!1896 thiss!1090) lt!124058 lt!124040)))

(assert (= (and d!24410 c!5601) b!77378))

(assert (= (and d!24410 (not c!5601)) b!77376))

(assert (= (and d!24410 res!63933) b!77377))

(assert (= (and b!77377 res!63932) b!77374))

(assert (= (and b!77374 res!63934) b!77375))

(declare-fun m!122815 () Bool)

(assert (=> d!24410 m!122815))

(declare-fun m!122817 () Bool)

(assert (=> d!24410 m!122817))

(assert (=> d!24410 m!122737))

(declare-fun m!122819 () Bool)

(assert (=> d!24410 m!122819))

(declare-fun m!122821 () Bool)

(assert (=> d!24410 m!122821))

(declare-fun m!122823 () Bool)

(assert (=> d!24410 m!122823))

(declare-fun m!122825 () Bool)

(assert (=> d!24410 m!122825))

(declare-fun m!122827 () Bool)

(assert (=> d!24410 m!122827))

(declare-fun m!122829 () Bool)

(assert (=> d!24410 m!122829))

(declare-fun m!122831 () Bool)

(assert (=> d!24410 m!122831))

(declare-fun m!122833 () Bool)

(assert (=> d!24410 m!122833))

(assert (=> b!77378 m!122733))

(declare-fun m!122835 () Bool)

(assert (=> b!77378 m!122835))

(declare-fun m!122837 () Bool)

(assert (=> b!77378 m!122837))

(declare-fun m!122839 () Bool)

(assert (=> b!77375 m!122839))

(assert (=> b!77375 m!122735))

(assert (=> b!77375 m!122733))

(declare-fun m!122841 () Bool)

(assert (=> b!77377 m!122841))

(declare-fun m!122843 () Bool)

(assert (=> b!77374 m!122843))

(assert (=> b!77292 d!24410))

(declare-fun d!24422 () Bool)

(declare-fun res!63947 () Bool)

(declare-fun e!50754 () Bool)

(assert (=> d!24422 (=> (not res!63947) (not e!50754))))

(assert (=> d!24422 (= res!63947 (= (size!1506 (buf!1896 thiss!1090)) (size!1506 (buf!1896 (_2!3543 lt!123801)))))))

(assert (=> d!24422 (= (isPrefixOf!0 thiss!1090 (_2!3543 lt!123801)) e!50754)))

(declare-fun b!77395 () Bool)

(declare-fun res!63949 () Bool)

(assert (=> b!77395 (=> (not res!63949) (not e!50754))))

(assert (=> b!77395 (= res!63949 (bvsle (bitIndex!0 (size!1506 (buf!1896 thiss!1090)) (currentByte!3707 thiss!1090) (currentBit!3702 thiss!1090)) (bitIndex!0 (size!1506 (buf!1896 (_2!3543 lt!123801))) (currentByte!3707 (_2!3543 lt!123801)) (currentBit!3702 (_2!3543 lt!123801)))))))

(declare-fun b!77396 () Bool)

(declare-fun e!50753 () Bool)

(assert (=> b!77396 (= e!50754 e!50753)))

(declare-fun res!63948 () Bool)

(assert (=> b!77396 (=> res!63948 e!50753)))

(assert (=> b!77396 (= res!63948 (= (size!1506 (buf!1896 thiss!1090)) #b00000000000000000000000000000000))))

(declare-fun b!77397 () Bool)

(assert (=> b!77397 (= e!50753 (arrayBitRangesEq!0 (buf!1896 thiss!1090) (buf!1896 (_2!3543 lt!123801)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1506 (buf!1896 thiss!1090)) (currentByte!3707 thiss!1090) (currentBit!3702 thiss!1090))))))

(assert (= (and d!24422 res!63947) b!77395))

(assert (= (and b!77395 res!63949) b!77396))

(assert (= (and b!77396 (not res!63948)) b!77397))

(assert (=> b!77395 m!122733))

(assert (=> b!77395 m!122735))

(assert (=> b!77397 m!122733))

(assert (=> b!77397 m!122733))

(declare-fun m!122905 () Bool)

(assert (=> b!77397 m!122905))

(assert (=> b!77287 d!24422))

(declare-fun d!24428 () Bool)

(assert (=> d!24428 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1506 (buf!1896 thiss!1090))) ((_ sign_extend 32) (currentByte!3707 thiss!1090)) ((_ sign_extend 32) (currentBit!3702 thiss!1090)) nBits!322) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1506 (buf!1896 thiss!1090))) ((_ sign_extend 32) (currentByte!3707 thiss!1090)) ((_ sign_extend 32) (currentBit!3702 thiss!1090))) nBits!322))))

(declare-fun bs!5912 () Bool)

(assert (= bs!5912 d!24428))

(assert (=> bs!5912 m!122775))

(assert (=> b!77288 d!24428))

(declare-fun d!24430 () Bool)

(assert (=> d!24430 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1506 (buf!1896 (_1!3544 lt!123800)))) ((_ sign_extend 32) (currentByte!3707 (_1!3544 lt!123800))) ((_ sign_extend 32) (currentBit!3702 (_1!3544 lt!123800))) nBits!322) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1506 (buf!1896 (_1!3544 lt!123800)))) ((_ sign_extend 32) (currentByte!3707 (_1!3544 lt!123800))) ((_ sign_extend 32) (currentBit!3702 (_1!3544 lt!123800)))) nBits!322))))

(declare-fun bs!5913 () Bool)

(assert (= bs!5913 d!24430))

(declare-fun m!122907 () Bool)

(assert (=> bs!5913 m!122907))

(assert (=> b!77289 d!24430))

(assert (=> b!77289 d!24422))

(assert (=> b!77289 d!24380))

(assert (=> b!77289 d!24388))

(declare-fun b!77430 () Bool)

(declare-fun e!50771 () Bool)

(assert (=> b!77430 (= e!50771 (validate_offset_bits!1 ((_ sign_extend 32) (size!1506 (buf!1896 thiss!1090))) ((_ sign_extend 32) (currentByte!3707 thiss!1090)) ((_ sign_extend 32) (currentBit!3702 thiss!1090)) nBits!322))))

(declare-fun b!77429 () Bool)

(declare-fun e!50772 () Bool)

(declare-fun lt!124130 () tuple2!6822)

(declare-fun lt!124134 () tuple2!6820)

(assert (=> b!77429 (= e!50772 (and (_2!3545 lt!124130) (= (_1!3545 lt!124130) (_2!3544 lt!124134))))))

(assert (=> b!77429 (= lt!124130 (checkBitsLoopPure!0 (_1!3544 lt!124134) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!124131 () Unit!5103)

(declare-fun lt!124132 () Unit!5103)

(assert (=> b!77429 (= lt!124131 lt!124132)))

(declare-fun lt!124133 () tuple2!6818)

(assert (=> b!77429 (validate_offset_bits!1 ((_ sign_extend 32) (size!1506 (buf!1896 (_2!3543 lt!124133)))) ((_ sign_extend 32) (currentByte!3707 thiss!1090)) ((_ sign_extend 32) (currentBit!3702 thiss!1090)) nBits!322)))

(assert (=> b!77429 (= lt!124132 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1896 (_2!3543 lt!124133)) nBits!322))))

(assert (=> b!77429 e!50771))

(declare-fun res!63980 () Bool)

(assert (=> b!77429 (=> (not res!63980) (not e!50771))))

(assert (=> b!77429 (= res!63980 (and (= (size!1506 (buf!1896 thiss!1090)) (size!1506 (buf!1896 (_2!3543 lt!124133)))) (bvsge nBits!322 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!77429 (= lt!124134 (reader!0 thiss!1090 (_2!3543 lt!124133)))))

(declare-fun b!77428 () Bool)

(declare-fun res!63982 () Bool)

(assert (=> b!77428 (=> (not res!63982) (not e!50772))))

(assert (=> b!77428 (= res!63982 (isPrefixOf!0 thiss!1090 (_2!3543 lt!124133)))))

(declare-fun b!77427 () Bool)

(declare-fun res!63979 () Bool)

(assert (=> b!77427 (=> (not res!63979) (not e!50772))))

(declare-fun lt!124129 () (_ BitVec 64))

(assert (=> b!77427 (= res!63979 (= (bitIndex!0 (size!1506 (buf!1896 (_2!3543 lt!124133))) (currentByte!3707 (_2!3543 lt!124133)) (currentBit!3702 (_2!3543 lt!124133))) (bvadd lt!124129 nBits!322)))))

(assert (=> b!77427 (or (not (= (bvand lt!124129 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!322 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!124129 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!124129 nBits!322) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!77427 (= lt!124129 (bitIndex!0 (size!1506 (buf!1896 thiss!1090)) (currentByte!3707 thiss!1090) (currentBit!3702 thiss!1090)))))

(declare-fun d!24432 () Bool)

(assert (=> d!24432 e!50772))

(declare-fun res!63981 () Bool)

(assert (=> d!24432 (=> (not res!63981) (not e!50772))))

(assert (=> d!24432 (= res!63981 (= (size!1506 (buf!1896 thiss!1090)) (size!1506 (buf!1896 (_2!3543 lt!124133)))))))

(declare-fun choose!36 (BitStream!2586 (_ BitVec 64) Bool) tuple2!6818)

(assert (=> d!24432 (= lt!124133 (choose!36 thiss!1090 nBits!322 false))))

(assert (=> d!24432 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!24432 (= (appendNBits!0 thiss!1090 nBits!322 false) lt!124133)))

(assert (= (and d!24432 res!63981) b!77427))

(assert (= (and b!77427 res!63979) b!77428))

(assert (= (and b!77428 res!63982) b!77429))

(assert (= (and b!77429 res!63980) b!77430))

(declare-fun m!122927 () Bool)

(assert (=> b!77429 m!122927))

(declare-fun m!122929 () Bool)

(assert (=> b!77429 m!122929))

(declare-fun m!122931 () Bool)

(assert (=> b!77429 m!122931))

(declare-fun m!122933 () Bool)

(assert (=> b!77429 m!122933))

(declare-fun m!122935 () Bool)

(assert (=> b!77427 m!122935))

(assert (=> b!77427 m!122733))

(assert (=> b!77430 m!122743))

(declare-fun m!122937 () Bool)

(assert (=> b!77428 m!122937))

(declare-fun m!122939 () Bool)

(assert (=> d!24432 m!122939))

(assert (=> b!77289 d!24432))

(assert (=> b!77289 d!24404))

(assert (=> b!77289 d!24410))

(assert (=> b!77289 d!24402))

(declare-fun d!24446 () Bool)

(assert (=> d!24446 (= (inv!12 thiss!1090) (invariant!0 (currentBit!3702 thiss!1090) (currentByte!3707 thiss!1090) (size!1506 (buf!1896 thiss!1090))))))

(declare-fun bs!5917 () Bool)

(assert (= bs!5917 d!24446))

(assert (=> bs!5917 m!122777))

(assert (=> start!15076 d!24446))

(declare-fun d!24448 () Bool)

(assert (=> d!24448 (= (array_inv!1352 (buf!1896 thiss!1090)) (bvsge (size!1506 (buf!1896 thiss!1090)) #b00000000000000000000000000000000))))

(assert (=> b!77290 d!24448))

(check-sat (not d!24432) (not d!24430) (not b!77375) (not b!77430) (not b!77377) (not d!24390) (not d!24402) (not d!24404) (not b!77429) (not d!24446) (not b!77378) (not b!77427) (not b!77374) (not b!77397) (not b!77428) (not d!24380) (not b!77395) (not d!24428) (not d!24410) (not d!24388))
(check-sat)
