; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15078 () Bool)

(assert start!15078)

(declare-fun b!77305 () Bool)

(declare-fun res!63878 () Bool)

(declare-fun e!50709 () Bool)

(assert (=> b!77305 (=> (not res!63878) (not e!50709))))

(declare-datatypes ((array!3240 0))(
  ( (array!3241 (arr!2108 (Array (_ BitVec 32) (_ BitVec 8))) (size!1507 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2588 0))(
  ( (BitStream!2589 (buf!1897 array!3240) (currentByte!3708 (_ BitVec 32)) (currentBit!3703 (_ BitVec 32))) )
))
(declare-fun thiss!1090 () BitStream!2588)

(declare-datatypes ((Unit!5105 0))(
  ( (Unit!5106) )
))
(declare-datatypes ((tuple2!6824 0))(
  ( (tuple2!6825 (_1!3546 Unit!5105) (_2!3546 BitStream!2588)) )
))
(declare-fun lt!123828 () tuple2!6824)

(declare-fun isPrefixOf!0 (BitStream!2588 BitStream!2588) Bool)

(assert (=> b!77305 (= res!63878 (isPrefixOf!0 thiss!1090 (_2!3546 lt!123828)))))

(declare-fun res!63876 () Bool)

(declare-fun e!50710 () Bool)

(assert (=> start!15078 (=> (not res!63876) (not e!50710))))

(declare-fun nBits!322 () (_ BitVec 64))

(assert (=> start!15078 (= res!63876 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15078 e!50710))

(assert (=> start!15078 true))

(declare-fun e!50712 () Bool)

(declare-fun inv!12 (BitStream!2588) Bool)

(assert (=> start!15078 (and (inv!12 thiss!1090) e!50712)))

(declare-fun b!77306 () Bool)

(declare-fun array_inv!1353 (array!3240) Bool)

(assert (=> b!77306 (= e!50712 (array_inv!1353 (buf!1897 thiss!1090)))))

(declare-fun b!77307 () Bool)

(declare-fun res!63877 () Bool)

(assert (=> b!77307 (=> (not res!63877) (not e!50710))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!77307 (= res!63877 (validate_offset_bits!1 ((_ sign_extend 32) (size!1507 (buf!1897 thiss!1090))) ((_ sign_extend 32) (currentByte!3708 thiss!1090)) ((_ sign_extend 32) (currentBit!3703 thiss!1090)) nBits!322))))

(declare-fun b!77308 () Bool)

(declare-datatypes ((tuple2!6826 0))(
  ( (tuple2!6827 (_1!3547 BitStream!2588) (_2!3547 BitStream!2588)) )
))
(declare-fun lt!123827 () tuple2!6826)

(assert (=> b!77308 (= e!50710 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!1507 (buf!1897 (_1!3547 lt!123827)))) ((_ sign_extend 32) (currentByte!3708 (_1!3547 lt!123827))) ((_ sign_extend 32) (currentBit!3703 (_1!3547 lt!123827))) nBits!322)))))

(assert (=> b!77308 (validate_offset_bits!1 ((_ sign_extend 32) (size!1507 (buf!1897 (_2!3546 lt!123828)))) ((_ sign_extend 32) (currentByte!3708 thiss!1090)) ((_ sign_extend 32) (currentBit!3703 thiss!1090)) nBits!322)))

(declare-fun lt!123823 () Unit!5105)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2588 array!3240 (_ BitVec 64)) Unit!5105)

(assert (=> b!77308 (= lt!123823 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1897 (_2!3546 lt!123828)) nBits!322))))

(declare-fun reader!0 (BitStream!2588 BitStream!2588) tuple2!6826)

(assert (=> b!77308 (= lt!123827 (reader!0 thiss!1090 (_2!3546 lt!123828)))))

(declare-fun lt!123826 () Bool)

(assert (=> b!77308 (= lt!123826 (isPrefixOf!0 thiss!1090 (_2!3546 lt!123828)))))

(declare-fun lt!123825 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!77308 (= lt!123825 (bitIndex!0 (size!1507 (buf!1897 (_2!3546 lt!123828))) (currentByte!3708 (_2!3546 lt!123828)) (currentBit!3703 (_2!3546 lt!123828))))))

(declare-fun lt!123831 () (_ BitVec 64))

(assert (=> b!77308 (= lt!123831 (bitIndex!0 (size!1507 (buf!1897 thiss!1090)) (currentByte!3708 thiss!1090) (currentBit!3703 thiss!1090)))))

(assert (=> b!77308 e!50709))

(declare-fun res!63879 () Bool)

(assert (=> b!77308 (=> (not res!63879) (not e!50709))))

(assert (=> b!77308 (= res!63879 (= (size!1507 (buf!1897 thiss!1090)) (size!1507 (buf!1897 (_2!3546 lt!123828)))))))

(declare-fun appendNBits!0 (BitStream!2588 (_ BitVec 64) Bool) tuple2!6824)

(assert (=> b!77308 (= lt!123828 (appendNBits!0 thiss!1090 nBits!322 false))))

(declare-fun b!77309 () Bool)

(declare-fun res!63880 () Bool)

(assert (=> b!77309 (=> (not res!63880) (not e!50709))))

(assert (=> b!77309 (= res!63880 (= (bitIndex!0 (size!1507 (buf!1897 (_2!3546 lt!123828))) (currentByte!3708 (_2!3546 lt!123828)) (currentBit!3703 (_2!3546 lt!123828))) (bvadd (bitIndex!0 (size!1507 (buf!1897 thiss!1090)) (currentByte!3708 thiss!1090) (currentBit!3703 thiss!1090)) nBits!322)))))

(declare-fun b!77310 () Bool)

(declare-datatypes ((tuple2!6828 0))(
  ( (tuple2!6829 (_1!3548 BitStream!2588) (_2!3548 Bool)) )
))
(declare-fun lt!123824 () tuple2!6828)

(declare-fun lt!123829 () tuple2!6826)

(assert (=> b!77310 (= e!50709 (not (or (not (_2!3548 lt!123824)) (not (= (_1!3548 lt!123824) (_2!3547 lt!123829))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!2588 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6828)

(assert (=> b!77310 (= lt!123824 (checkBitsLoopPure!0 (_1!3547 lt!123829) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!77310 (validate_offset_bits!1 ((_ sign_extend 32) (size!1507 (buf!1897 (_2!3546 lt!123828)))) ((_ sign_extend 32) (currentByte!3708 thiss!1090)) ((_ sign_extend 32) (currentBit!3703 thiss!1090)) nBits!322)))

(declare-fun lt!123830 () Unit!5105)

(assert (=> b!77310 (= lt!123830 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1897 (_2!3546 lt!123828)) nBits!322))))

(assert (=> b!77310 (= lt!123829 (reader!0 thiss!1090 (_2!3546 lt!123828)))))

(assert (= (and start!15078 res!63876) b!77307))

(assert (= (and b!77307 res!63877) b!77308))

(assert (= (and b!77308 res!63879) b!77309))

(assert (= (and b!77309 res!63880) b!77305))

(assert (= (and b!77305 res!63878) b!77310))

(assert (= start!15078 b!77306))

(declare-fun m!122747 () Bool)

(assert (=> b!77309 m!122747))

(declare-fun m!122749 () Bool)

(assert (=> b!77309 m!122749))

(declare-fun m!122751 () Bool)

(assert (=> b!77308 m!122751))

(assert (=> b!77308 m!122749))

(declare-fun m!122753 () Bool)

(assert (=> b!77308 m!122753))

(declare-fun m!122755 () Bool)

(assert (=> b!77308 m!122755))

(declare-fun m!122757 () Bool)

(assert (=> b!77308 m!122757))

(assert (=> b!77308 m!122747))

(declare-fun m!122759 () Bool)

(assert (=> b!77308 m!122759))

(declare-fun m!122761 () Bool)

(assert (=> b!77308 m!122761))

(assert (=> b!77305 m!122751))

(declare-fun m!122763 () Bool)

(assert (=> b!77307 m!122763))

(declare-fun m!122765 () Bool)

(assert (=> b!77310 m!122765))

(assert (=> b!77310 m!122761))

(assert (=> b!77310 m!122753))

(assert (=> b!77310 m!122759))

(declare-fun m!122767 () Bool)

(assert (=> b!77306 m!122767))

(declare-fun m!122769 () Bool)

(assert (=> start!15078 m!122769))

(push 1)

(assert (not b!77306))

(assert (not b!77307))

(assert (not b!77309))

(assert (not b!77308))

(assert (not b!77305))

(assert (not start!15078))

(assert (not b!77310))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!24386 () Bool)

(declare-fun e!50723 () Bool)

(assert (=> d!24386 e!50723))

(declare-fun res!63902 () Bool)

(assert (=> d!24386 (=> (not res!63902) (not e!50723))))

(declare-fun lt!123893 () (_ BitVec 64))

(declare-fun lt!123892 () (_ BitVec 64))

(declare-fun lt!123897 () (_ BitVec 64))

(assert (=> d!24386 (= res!63902 (= lt!123893 (bvsub lt!123892 lt!123897)))))

(assert (=> d!24386 (or (= (bvand lt!123892 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!123897 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!123892 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!123892 lt!123897) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!24386 (= lt!123897 (remainingBits!0 ((_ sign_extend 32) (size!1507 (buf!1897 (_2!3546 lt!123828)))) ((_ sign_extend 32) (currentByte!3708 (_2!3546 lt!123828))) ((_ sign_extend 32) (currentBit!3703 (_2!3546 lt!123828)))))))

(declare-fun lt!123894 () (_ BitVec 64))

(declare-fun lt!123896 () (_ BitVec 64))

(assert (=> d!24386 (= lt!123892 (bvmul lt!123894 lt!123896))))

(assert (=> d!24386 (or (= lt!123894 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!123896 (bvsdiv (bvmul lt!123894 lt!123896) lt!123894)))))

(assert (=> d!24386 (= lt!123896 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24386 (= lt!123894 ((_ sign_extend 32) (size!1507 (buf!1897 (_2!3546 lt!123828)))))))

(assert (=> d!24386 (= lt!123893 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3708 (_2!3546 lt!123828))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3703 (_2!3546 lt!123828)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!24386 (invariant!0 (currentBit!3703 (_2!3546 lt!123828)) (currentByte!3708 (_2!3546 lt!123828)) (size!1507 (buf!1897 (_2!3546 lt!123828))))))

(assert (=> d!24386 (= (bitIndex!0 (size!1507 (buf!1897 (_2!3546 lt!123828))) (currentByte!3708 (_2!3546 lt!123828)) (currentBit!3703 (_2!3546 lt!123828))) lt!123893)))

(declare-fun b!77331 () Bool)

(declare-fun res!63901 () Bool)

(assert (=> b!77331 (=> (not res!63901) (not e!50723))))

(assert (=> b!77331 (= res!63901 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!123893))))

(declare-fun b!77332 () Bool)

(declare-fun lt!123895 () (_ BitVec 64))

(assert (=> b!77332 (= e!50723 (bvsle lt!123893 (bvmul lt!123895 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!77332 (or (= lt!123895 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!123895 #b0000000000000000000000000000000000000000000000000000000000001000) lt!123895)))))

(assert (=> b!77332 (= lt!123895 ((_ sign_extend 32) (size!1507 (buf!1897 (_2!3546 lt!123828)))))))

(assert (= (and d!24386 res!63902) b!77331))

(assert (= (and b!77331 res!63901) b!77332))

(declare-fun m!122787 () Bool)

(assert (=> d!24386 m!122787))

(declare-fun m!122789 () Bool)

(assert (=> d!24386 m!122789))

(assert (=> b!77309 d!24386))

(declare-fun d!24396 () Bool)

(declare-fun e!50724 () Bool)

(assert (=> d!24396 e!50724))

(declare-fun res!63904 () Bool)

(assert (=> d!24396 (=> (not res!63904) (not e!50724))))

(declare-fun lt!123899 () (_ BitVec 64))

(declare-fun lt!123903 () (_ BitVec 64))

(declare-fun lt!123898 () (_ BitVec 64))

(assert (=> d!24396 (= res!63904 (= lt!123899 (bvsub lt!123898 lt!123903)))))

(assert (=> d!24396 (or (= (bvand lt!123898 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!123903 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!123898 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!123898 lt!123903) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24396 (= lt!123903 (remainingBits!0 ((_ sign_extend 32) (size!1507 (buf!1897 thiss!1090))) ((_ sign_extend 32) (currentByte!3708 thiss!1090)) ((_ sign_extend 32) (currentBit!3703 thiss!1090))))))

(declare-fun lt!123900 () (_ BitVec 64))

(declare-fun lt!123902 () (_ BitVec 64))

(assert (=> d!24396 (= lt!123898 (bvmul lt!123900 lt!123902))))

(assert (=> d!24396 (or (= lt!123900 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!123902 (bvsdiv (bvmul lt!123900 lt!123902) lt!123900)))))

(assert (=> d!24396 (= lt!123902 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24396 (= lt!123900 ((_ sign_extend 32) (size!1507 (buf!1897 thiss!1090))))))

(assert (=> d!24396 (= lt!123899 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3708 thiss!1090)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3703 thiss!1090))))))

(assert (=> d!24396 (invariant!0 (currentBit!3703 thiss!1090) (currentByte!3708 thiss!1090) (size!1507 (buf!1897 thiss!1090)))))

(assert (=> d!24396 (= (bitIndex!0 (size!1507 (buf!1897 thiss!1090)) (currentByte!3708 thiss!1090) (currentBit!3703 thiss!1090)) lt!123899)))

(declare-fun b!77333 () Bool)

(declare-fun res!63903 () Bool)

(assert (=> b!77333 (=> (not res!63903) (not e!50724))))

(assert (=> b!77333 (= res!63903 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!123899))))

(declare-fun b!77334 () Bool)

(declare-fun lt!123901 () (_ BitVec 64))

(assert (=> b!77334 (= e!50724 (bvsle lt!123899 (bvmul lt!123901 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!77334 (or (= lt!123901 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!123901 #b0000000000000000000000000000000000000000000000000000000000001000) lt!123901)))))

(assert (=> b!77334 (= lt!123901 ((_ sign_extend 32) (size!1507 (buf!1897 thiss!1090))))))

(assert (= (and d!24396 res!63904) b!77333))

(assert (= (and b!77333 res!63903) b!77334))

(declare-fun m!122791 () Bool)

(assert (=> d!24396 m!122791))

(declare-fun m!122793 () Bool)

(assert (=> d!24396 m!122793))

(assert (=> b!77309 d!24396))

(declare-fun d!24398 () Bool)

(declare-datatypes ((tuple2!6832 0))(
  ( (tuple2!6833 (_1!3550 Bool) (_2!3550 BitStream!2588)) )
))
(declare-fun lt!123909 () tuple2!6832)

(declare-fun checkBitsLoop!0 (BitStream!2588 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6832)

(assert (=> d!24398 (= lt!123909 (checkBitsLoop!0 (_1!3547 lt!123829) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24398 (= (checkBitsLoopPure!0 (_1!3547 lt!123829) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000) (tuple2!6829 (_2!3550 lt!123909) (_1!3550 lt!123909)))))

(declare-fun bs!5905 () Bool)

(assert (= bs!5905 d!24398))

(declare-fun m!122799 () Bool)

(assert (=> bs!5905 m!122799))

(assert (=> b!77310 d!24398))

(declare-fun d!24406 () Bool)

(assert (=> d!24406 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1507 (buf!1897 (_2!3546 lt!123828)))) ((_ sign_extend 32) (currentByte!3708 thiss!1090)) ((_ sign_extend 32) (currentBit!3703 thiss!1090)) nBits!322) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1507 (buf!1897 (_2!3546 lt!123828)))) ((_ sign_extend 32) (currentByte!3708 thiss!1090)) ((_ sign_extend 32) (currentBit!3703 thiss!1090))) nBits!322))))

(declare-fun bs!5906 () Bool)

(assert (= bs!5906 d!24406))

(declare-fun m!122801 () Bool)

(assert (=> bs!5906 m!122801))

(assert (=> b!77310 d!24406))

(declare-fun d!24408 () Bool)

(assert (=> d!24408 (validate_offset_bits!1 ((_ sign_extend 32) (size!1507 (buf!1897 (_2!3546 lt!123828)))) ((_ sign_extend 32) (currentByte!3708 thiss!1090)) ((_ sign_extend 32) (currentBit!3703 thiss!1090)) nBits!322)))

(declare-fun lt!123915 () Unit!5105)

(declare-fun choose!9 (BitStream!2588 array!3240 (_ BitVec 64) BitStream!2588) Unit!5105)

(assert (=> d!24408 (= lt!123915 (choose!9 thiss!1090 (buf!1897 (_2!3546 lt!123828)) nBits!322 (BitStream!2589 (buf!1897 (_2!3546 lt!123828)) (currentByte!3708 thiss!1090) (currentBit!3703 thiss!1090))))))

(assert (=> d!24408 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1897 (_2!3546 lt!123828)) nBits!322) lt!123915)))

(declare-fun bs!5910 () Bool)

(assert (= bs!5910 d!24408))

(assert (=> bs!5910 m!122761))

(declare-fun m!122811 () Bool)

(assert (=> bs!5910 m!122811))

(assert (=> b!77310 d!24408))

(declare-fun b!77379 () Bool)

(declare-fun e!50746 () Unit!5105)

(declare-fun Unit!5109 () Unit!5105)

(assert (=> b!77379 (= e!50746 Unit!5109)))

(declare-fun b!77380 () Bool)

(declare-fun res!63935 () Bool)

(declare-fun e!50745 () Bool)

(assert (=> b!77380 (=> (not res!63935) (not e!50745))))

(declare-fun lt!124069 () tuple2!6826)

(assert (=> b!77380 (= res!63935 (isPrefixOf!0 (_1!3547 lt!124069) thiss!1090))))

(declare-fun b!77381 () Bool)

(declare-fun res!63937 () Bool)

(assert (=> b!77381 (=> (not res!63937) (not e!50745))))

(assert (=> b!77381 (= res!63937 (isPrefixOf!0 (_2!3547 lt!124069) (_2!3546 lt!123828)))))

(declare-fun d!24418 () Bool)

(assert (=> d!24418 e!50745))

(declare-fun res!63936 () Bool)

(assert (=> d!24418 (=> (not res!63936) (not e!50745))))

(assert (=> d!24418 (= res!63936 (isPrefixOf!0 (_1!3547 lt!124069) (_2!3547 lt!124069)))))

(declare-fun lt!124070 () BitStream!2588)

(assert (=> d!24418 (= lt!124069 (tuple2!6827 lt!124070 (_2!3546 lt!123828)))))

(declare-fun lt!124072 () Unit!5105)

(declare-fun lt!124064 () Unit!5105)

(assert (=> d!24418 (= lt!124072 lt!124064)))

(assert (=> d!24418 (isPrefixOf!0 lt!124070 (_2!3546 lt!123828))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2588 BitStream!2588 BitStream!2588) Unit!5105)

(assert (=> d!24418 (= lt!124064 (lemmaIsPrefixTransitive!0 lt!124070 (_2!3546 lt!123828) (_2!3546 lt!123828)))))

(declare-fun lt!124059 () Unit!5105)

(declare-fun lt!124063 () Unit!5105)

(assert (=> d!24418 (= lt!124059 lt!124063)))

(assert (=> d!24418 (isPrefixOf!0 lt!124070 (_2!3546 lt!123828))))

(assert (=> d!24418 (= lt!124063 (lemmaIsPrefixTransitive!0 lt!124070 thiss!1090 (_2!3546 lt!123828)))))

(declare-fun lt!124062 () Unit!5105)

(assert (=> d!24418 (= lt!124062 e!50746)))

(declare-fun c!5602 () Bool)

(assert (=> d!24418 (= c!5602 (not (= (size!1507 (buf!1897 thiss!1090)) #b00000000000000000000000000000000)))))

(declare-fun lt!124075 () Unit!5105)

(declare-fun lt!124078 () Unit!5105)

(assert (=> d!24418 (= lt!124075 lt!124078)))

(assert (=> d!24418 (isPrefixOf!0 (_2!3546 lt!123828) (_2!3546 lt!123828))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2588) Unit!5105)

(assert (=> d!24418 (= lt!124078 (lemmaIsPrefixRefl!0 (_2!3546 lt!123828)))))

(declare-fun lt!124065 () Unit!5105)

(declare-fun lt!124077 () Unit!5105)

(assert (=> d!24418 (= lt!124065 lt!124077)))

(assert (=> d!24418 (= lt!124077 (lemmaIsPrefixRefl!0 (_2!3546 lt!123828)))))

(declare-fun lt!124061 () Unit!5105)

(declare-fun lt!124060 () Unit!5105)

(assert (=> d!24418 (= lt!124061 lt!124060)))

(assert (=> d!24418 (isPrefixOf!0 lt!124070 lt!124070)))

(assert (=> d!24418 (= lt!124060 (lemmaIsPrefixRefl!0 lt!124070))))

(declare-fun lt!124071 () Unit!5105)

(declare-fun lt!124067 () Unit!5105)

(assert (=> d!24418 (= lt!124071 lt!124067)))

(assert (=> d!24418 (isPrefixOf!0 thiss!1090 thiss!1090)))

(assert (=> d!24418 (= lt!124067 (lemmaIsPrefixRefl!0 thiss!1090))))

(assert (=> d!24418 (= lt!124070 (BitStream!2589 (buf!1897 (_2!3546 lt!123828)) (currentByte!3708 thiss!1090) (currentBit!3703 thiss!1090)))))

(assert (=> d!24418 (isPrefixOf!0 thiss!1090 (_2!3546 lt!123828))))

(assert (=> d!24418 (= (reader!0 thiss!1090 (_2!3546 lt!123828)) lt!124069)))

(declare-fun lt!124073 () (_ BitVec 64))

(declare-fun b!77382 () Bool)

(declare-fun lt!124068 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2588 (_ BitVec 64)) BitStream!2588)

(assert (=> b!77382 (= e!50745 (= (_1!3547 lt!124069) (withMovedBitIndex!0 (_2!3547 lt!124069) (bvsub lt!124068 lt!124073))))))

(assert (=> b!77382 (or (= (bvand lt!124068 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!124073 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!124068 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!124068 lt!124073) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!77382 (= lt!124073 (bitIndex!0 (size!1507 (buf!1897 (_2!3546 lt!123828))) (currentByte!3708 (_2!3546 lt!123828)) (currentBit!3703 (_2!3546 lt!123828))))))

(assert (=> b!77382 (= lt!124068 (bitIndex!0 (size!1507 (buf!1897 thiss!1090)) (currentByte!3708 thiss!1090) (currentBit!3703 thiss!1090)))))

(declare-fun b!77383 () Bool)

(declare-fun lt!124074 () Unit!5105)

(assert (=> b!77383 (= e!50746 lt!124074)))

(declare-fun lt!124076 () (_ BitVec 64))

(assert (=> b!77383 (= lt!124076 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124066 () (_ BitVec 64))

(assert (=> b!77383 (= lt!124066 (bitIndex!0 (size!1507 (buf!1897 thiss!1090)) (currentByte!3708 thiss!1090) (currentBit!3703 thiss!1090)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!3240 array!3240 (_ BitVec 64) (_ BitVec 64)) Unit!5105)

(assert (=> b!77383 (= lt!124074 (arrayBitRangesEqSymmetric!0 (buf!1897 thiss!1090) (buf!1897 (_2!3546 lt!123828)) lt!124076 lt!124066))))

(declare-fun arrayBitRangesEq!0 (array!3240 array!3240 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!77383 (arrayBitRangesEq!0 (buf!1897 (_2!3546 lt!123828)) (buf!1897 thiss!1090) lt!124076 lt!124066)))

(assert (= (and d!24418 c!5602) b!77383))

(assert (= (and d!24418 (not c!5602)) b!77379))

(assert (= (and d!24418 res!63936) b!77380))

(assert (= (and b!77380 res!63935) b!77381))

(assert (= (and b!77381 res!63937) b!77382))

(declare-fun m!122845 () Bool)

(assert (=> b!77382 m!122845))

(assert (=> b!77382 m!122747))

(assert (=> b!77382 m!122749))

(declare-fun m!122847 () Bool)

(assert (=> b!77380 m!122847))

(declare-fun m!122849 () Bool)

(assert (=> b!77381 m!122849))

(assert (=> b!77383 m!122749))

(declare-fun m!122851 () Bool)

(assert (=> b!77383 m!122851))

(declare-fun m!122855 () Bool)

(assert (=> b!77383 m!122855))

(declare-fun m!122857 () Bool)

(assert (=> d!24418 m!122857))

(declare-fun m!122861 () Bool)

(assert (=> d!24418 m!122861))

(declare-fun m!122863 () Bool)

(assert (=> d!24418 m!122863))

(declare-fun m!122865 () Bool)

(assert (=> d!24418 m!122865))

(assert (=> d!24418 m!122751))

(declare-fun m!122867 () Bool)

(assert (=> d!24418 m!122867))

(declare-fun m!122869 () Bool)

(assert (=> d!24418 m!122869))

(declare-fun m!122871 () Bool)

(assert (=> d!24418 m!122871))

(declare-fun m!122875 () Bool)

(assert (=> d!24418 m!122875))

(declare-fun m!122877 () Bool)

(assert (=> d!24418 m!122877))

(declare-fun m!122881 () Bool)

(assert (=> d!24418 m!122881))

(assert (=> b!77310 d!24418))

(declare-fun d!24424 () Bool)

(declare-fun res!63957 () Bool)

(declare-fun e!50760 () Bool)

(assert (=> d!24424 (=> (not res!63957) (not e!50760))))

(assert (=> d!24424 (= res!63957 (= (size!1507 (buf!1897 thiss!1090)) (size!1507 (buf!1897 (_2!3546 lt!123828)))))))

(assert (=> d!24424 (= (isPrefixOf!0 thiss!1090 (_2!3546 lt!123828)) e!50760)))

(declare-fun b!77404 () Bool)

(declare-fun res!63958 () Bool)

(assert (=> b!77404 (=> (not res!63958) (not e!50760))))

(assert (=> b!77404 (= res!63958 (bvsle (bitIndex!0 (size!1507 (buf!1897 thiss!1090)) (currentByte!3708 thiss!1090) (currentBit!3703 thiss!1090)) (bitIndex!0 (size!1507 (buf!1897 (_2!3546 lt!123828))) (currentByte!3708 (_2!3546 lt!123828)) (currentBit!3703 (_2!3546 lt!123828)))))))

(declare-fun b!77405 () Bool)

(declare-fun e!50759 () Bool)

(assert (=> b!77405 (= e!50760 e!50759)))

(declare-fun res!63956 () Bool)

(assert (=> b!77405 (=> res!63956 e!50759)))

(assert (=> b!77405 (= res!63956 (= (size!1507 (buf!1897 thiss!1090)) #b00000000000000000000000000000000))))

(declare-fun b!77406 () Bool)

(assert (=> b!77406 (= e!50759 (arrayBitRangesEq!0 (buf!1897 thiss!1090) (buf!1897 (_2!3546 lt!123828)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1507 (buf!1897 thiss!1090)) (currentByte!3708 thiss!1090) (currentBit!3703 thiss!1090))))))

(assert (= (and d!24424 res!63957) b!77404))

(assert (= (and b!77404 res!63958) b!77405))

(assert (= (and b!77405 (not res!63956)) b!77406))

(assert (=> b!77404 m!122749))

(assert (=> b!77404 m!122747))

(assert (=> b!77406 m!122749))

(assert (=> b!77406 m!122749))

(declare-fun m!122909 () Bool)

(assert (=> b!77406 m!122909))

(assert (=> b!77305 d!24424))

(declare-fun d!24434 () Bool)

(assert (=> d!24434 (= (array_inv!1353 (buf!1897 thiss!1090)) (bvsge (size!1507 (buf!1897 thiss!1090)) #b00000000000000000000000000000000))))

(assert (=> b!77306 d!24434))

(declare-fun d!24436 () Bool)

(assert (=> d!24436 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1507 (buf!1897 thiss!1090))) ((_ sign_extend 32) (currentByte!3708 thiss!1090)) ((_ sign_extend 32) (currentBit!3703 thiss!1090)) nBits!322) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1507 (buf!1897 thiss!1090))) ((_ sign_extend 32) (currentByte!3708 thiss!1090)) ((_ sign_extend 32) (currentBit!3703 thiss!1090))) nBits!322))))

(declare-fun bs!5914 () Bool)

(assert (= bs!5914 d!24436))

(assert (=> bs!5914 m!122791))

(assert (=> b!77307 d!24436))

(declare-fun d!24438 () Bool)

(assert (=> d!24438 (= (inv!12 thiss!1090) (invariant!0 (currentBit!3703 thiss!1090) (currentByte!3708 thiss!1090) (size!1507 (buf!1897 thiss!1090))))))

(declare-fun bs!5915 () Bool)

(assert (= bs!5915 d!24438))

(assert (=> bs!5915 m!122793))

(assert (=> start!15078 d!24438))

(declare-fun d!24440 () Bool)

(assert (=> d!24440 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1507 (buf!1897 (_1!3547 lt!123827)))) ((_ sign_extend 32) (currentByte!3708 (_1!3547 lt!123827))) ((_ sign_extend 32) (currentBit!3703 (_1!3547 lt!123827))) nBits!322) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1507 (buf!1897 (_1!3547 lt!123827)))) ((_ sign_extend 32) (currentByte!3708 (_1!3547 lt!123827))) ((_ sign_extend 32) (currentBit!3703 (_1!3547 lt!123827)))) nBits!322))))

(declare-fun bs!5916 () Bool)

(assert (= bs!5916 d!24440))

(declare-fun m!122911 () Bool)

(assert (=> bs!5916 m!122911))

(assert (=> b!77308 d!24440))

(assert (=> b!77308 d!24408))

(assert (=> b!77308 d!24396))

(assert (=> b!77308 d!24424))

(assert (=> b!77308 d!24386))

(assert (=> b!77308 d!24418))

(assert (=> b!77308 d!24406))

(declare-fun b!77440 () Bool)

(declare-fun res!63994 () Bool)

(declare-fun e!50777 () Bool)

(assert (=> b!77440 (=> (not res!63994) (not e!50777))))

(declare-fun lt!124152 () tuple2!6824)

(assert (=> b!77440 (= res!63994 (isPrefixOf!0 thiss!1090 (_2!3546 lt!124152)))))

(declare-fun b!77439 () Bool)

(declare-fun res!63993 () Bool)

(assert (=> b!77439 (=> (not res!63993) (not e!50777))))

(declare-fun lt!124151 () (_ BitVec 64))

(assert (=> b!77439 (= res!63993 (= (bitIndex!0 (size!1507 (buf!1897 (_2!3546 lt!124152))) (currentByte!3708 (_2!3546 lt!124152)) (currentBit!3703 (_2!3546 lt!124152))) (bvadd lt!124151 nBits!322)))))

(assert (=> b!77439 (or (not (= (bvand lt!124151 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!322 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!124151 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!124151 nBits!322) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!77439 (= lt!124151 (bitIndex!0 (size!1507 (buf!1897 thiss!1090)) (currentByte!3708 thiss!1090) (currentBit!3703 thiss!1090)))))

(declare-fun b!77441 () Bool)

(declare-fun lt!124155 () tuple2!6828)

(declare-fun lt!124153 () tuple2!6826)

(assert (=> b!77441 (= e!50777 (and (_2!3548 lt!124155) (= (_1!3548 lt!124155) (_2!3547 lt!124153))))))

(assert (=> b!77441 (= lt!124155 (checkBitsLoopPure!0 (_1!3547 lt!124153) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!124150 () Unit!5105)

(declare-fun lt!124154 () Unit!5105)

(assert (=> b!77441 (= lt!124150 lt!124154)))

(assert (=> b!77441 (validate_offset_bits!1 ((_ sign_extend 32) (size!1507 (buf!1897 (_2!3546 lt!124152)))) ((_ sign_extend 32) (currentByte!3708 thiss!1090)) ((_ sign_extend 32) (currentBit!3703 thiss!1090)) nBits!322)))

(assert (=> b!77441 (= lt!124154 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1897 (_2!3546 lt!124152)) nBits!322))))

(declare-fun e!50778 () Bool)

(assert (=> b!77441 e!50778))

(declare-fun res!63992 () Bool)

(assert (=> b!77441 (=> (not res!63992) (not e!50778))))

(assert (=> b!77441 (= res!63992 (and (= (size!1507 (buf!1897 thiss!1090)) (size!1507 (buf!1897 (_2!3546 lt!124152)))) (bvsge nBits!322 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!77441 (= lt!124153 (reader!0 thiss!1090 (_2!3546 lt!124152)))))

(declare-fun b!77442 () Bool)

(assert (=> b!77442 (= e!50778 (validate_offset_bits!1 ((_ sign_extend 32) (size!1507 (buf!1897 thiss!1090))) ((_ sign_extend 32) (currentByte!3708 thiss!1090)) ((_ sign_extend 32) (currentBit!3703 thiss!1090)) nBits!322))))

(declare-fun d!24442 () Bool)

(assert (=> d!24442 e!50777))

(declare-fun res!63991 () Bool)

(assert (=> d!24442 (=> (not res!63991) (not e!50777))))

(assert (=> d!24442 (= res!63991 (= (size!1507 (buf!1897 thiss!1090)) (size!1507 (buf!1897 (_2!3546 lt!124152)))))))

(declare-fun choose!36 (BitStream!2588 (_ BitVec 64) Bool) tuple2!6824)

(assert (=> d!24442 (= lt!124152 (choose!36 thiss!1090 nBits!322 false))))

(assert (=> d!24442 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!24442 (= (appendNBits!0 thiss!1090 nBits!322 false) lt!124152)))

(assert (= (and d!24442 res!63991) b!77439))

(assert (= (and b!77439 res!63993) b!77440))

(assert (= (and b!77440 res!63994) b!77441))

(assert (= (and b!77441 res!63992) b!77442))

(declare-fun m!122943 () Bool)

(assert (=> d!24442 m!122943))

(declare-fun m!122945 () Bool)

(assert (=> b!77440 m!122945))

(declare-fun m!122947 () Bool)

(assert (=> b!77439 m!122947))

(assert (=> b!77439 m!122749))

(assert (=> b!77442 m!122763))

(declare-fun m!122949 () Bool)

(assert (=> b!77441 m!122949))

(declare-fun m!122951 () Bool)

(assert (=> b!77441 m!122951))

(declare-fun m!122953 () Bool)

(assert (=> b!77441 m!122953))

(declare-fun m!122955 () Bool)

(assert (=> b!77441 m!122955))

(assert (=> b!77308 d!24442))

(push 1)

(assert (not b!77380))

(assert (not d!24436))

(assert (not b!77439))

(assert (not b!77406))

(assert (not b!77441))

(assert (not b!77383))

(assert (not d!24418))

(assert (not d!24406))

(assert (not b!77440))

(assert (not d!24408))

(assert (not d!24438))

(assert (not b!77382))

(assert (not d!24442))

(assert (not b!77404))

(assert (not b!77442))

(assert (not d!24398))

(assert (not d!24440))

(assert (not d!24396))

(assert (not b!77381))

(assert (not d!24386))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

