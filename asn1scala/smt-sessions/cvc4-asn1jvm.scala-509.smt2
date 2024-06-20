; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14976 () Bool)

(assert start!14976)

(declare-fun b!76795 () Bool)

(declare-fun res!63448 () Bool)

(declare-fun e!50394 () Bool)

(assert (=> b!76795 (=> (not res!63448) (not e!50394))))

(declare-datatypes ((array!3195 0))(
  ( (array!3196 (arr!2087 (Array (_ BitVec 32) (_ BitVec 8))) (size!1486 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2546 0))(
  ( (BitStream!2547 (buf!1873 array!3195) (currentByte!3678 (_ BitVec 32)) (currentBit!3673 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!5060 0))(
  ( (Unit!5061) )
))
(declare-datatypes ((tuple2!6692 0))(
  ( (tuple2!6693 (_1!3480 Unit!5060) (_2!3480 BitStream!2546)) )
))
(declare-fun lt!122984 () tuple2!6692)

(declare-fun thiss!1090 () BitStream!2546)

(declare-fun nBits!322 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!76795 (= res!63448 (= (bitIndex!0 (size!1486 (buf!1873 (_2!3480 lt!122984))) (currentByte!3678 (_2!3480 lt!122984)) (currentBit!3673 (_2!3480 lt!122984))) (bvadd (bitIndex!0 (size!1486 (buf!1873 thiss!1090)) (currentByte!3678 thiss!1090) (currentBit!3673 thiss!1090)) nBits!322)))))

(declare-fun res!63449 () Bool)

(declare-fun e!50393 () Bool)

(assert (=> start!14976 (=> (not res!63449) (not e!50393))))

(assert (=> start!14976 (= res!63449 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!14976 e!50393))

(assert (=> start!14976 true))

(declare-fun e!50392 () Bool)

(declare-fun inv!12 (BitStream!2546) Bool)

(assert (=> start!14976 (and (inv!12 thiss!1090) e!50392)))

(declare-fun b!76796 () Bool)

(declare-datatypes ((tuple2!6694 0))(
  ( (tuple2!6695 (_1!3481 BitStream!2546) (_2!3481 Bool)) )
))
(declare-fun lt!122982 () tuple2!6694)

(declare-datatypes ((tuple2!6696 0))(
  ( (tuple2!6697 (_1!3482 BitStream!2546) (_2!3482 BitStream!2546)) )
))
(declare-fun lt!122985 () tuple2!6696)

(assert (=> b!76796 (= e!50394 (not (or (not (_2!3481 lt!122982)) (not (= (_1!3481 lt!122982) (_2!3482 lt!122985))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!2546 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6694)

(assert (=> b!76796 (= lt!122982 (checkBitsLoopPure!0 (_1!3482 lt!122985) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76796 (validate_offset_bits!1 ((_ sign_extend 32) (size!1486 (buf!1873 (_2!3480 lt!122984)))) ((_ sign_extend 32) (currentByte!3678 thiss!1090)) ((_ sign_extend 32) (currentBit!3673 thiss!1090)) nBits!322)))

(declare-fun lt!122983 () Unit!5060)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2546 array!3195 (_ BitVec 64)) Unit!5060)

(assert (=> b!76796 (= lt!122983 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1873 (_2!3480 lt!122984)) nBits!322))))

(declare-fun reader!0 (BitStream!2546 BitStream!2546) tuple2!6696)

(assert (=> b!76796 (= lt!122985 (reader!0 thiss!1090 (_2!3480 lt!122984)))))

(declare-fun b!76797 () Bool)

(declare-fun res!63451 () Bool)

(assert (=> b!76797 (=> (not res!63451) (not e!50394))))

(declare-fun isPrefixOf!0 (BitStream!2546 BitStream!2546) Bool)

(assert (=> b!76797 (= res!63451 (isPrefixOf!0 thiss!1090 (_2!3480 lt!122984)))))

(declare-fun b!76798 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!76798 (= e!50393 (not (invariant!0 (currentBit!3673 thiss!1090) (currentByte!3678 thiss!1090) (size!1486 (buf!1873 thiss!1090)))))))

(assert (=> b!76798 e!50394))

(declare-fun res!63447 () Bool)

(assert (=> b!76798 (=> (not res!63447) (not e!50394))))

(assert (=> b!76798 (= res!63447 (= (size!1486 (buf!1873 thiss!1090)) (size!1486 (buf!1873 (_2!3480 lt!122984)))))))

(declare-fun appendNBits!0 (BitStream!2546 (_ BitVec 64) Bool) tuple2!6692)

(assert (=> b!76798 (= lt!122984 (appendNBits!0 thiss!1090 nBits!322 false))))

(declare-fun b!76799 () Bool)

(declare-fun array_inv!1332 (array!3195) Bool)

(assert (=> b!76799 (= e!50392 (array_inv!1332 (buf!1873 thiss!1090)))))

(declare-fun b!76800 () Bool)

(declare-fun res!63450 () Bool)

(assert (=> b!76800 (=> (not res!63450) (not e!50393))))

(assert (=> b!76800 (= res!63450 (validate_offset_bits!1 ((_ sign_extend 32) (size!1486 (buf!1873 thiss!1090))) ((_ sign_extend 32) (currentByte!3678 thiss!1090)) ((_ sign_extend 32) (currentBit!3673 thiss!1090)) nBits!322))))

(assert (= (and start!14976 res!63449) b!76800))

(assert (= (and b!76800 res!63450) b!76798))

(assert (= (and b!76798 res!63447) b!76795))

(assert (= (and b!76795 res!63448) b!76797))

(assert (= (and b!76797 res!63451) b!76796))

(assert (= start!14976 b!76799))

(declare-fun m!122105 () Bool)

(assert (=> start!14976 m!122105))

(declare-fun m!122107 () Bool)

(assert (=> b!76800 m!122107))

(declare-fun m!122109 () Bool)

(assert (=> b!76798 m!122109))

(declare-fun m!122111 () Bool)

(assert (=> b!76798 m!122111))

(declare-fun m!122113 () Bool)

(assert (=> b!76799 m!122113))

(declare-fun m!122115 () Bool)

(assert (=> b!76797 m!122115))

(declare-fun m!122117 () Bool)

(assert (=> b!76795 m!122117))

(declare-fun m!122119 () Bool)

(assert (=> b!76795 m!122119))

(declare-fun m!122121 () Bool)

(assert (=> b!76796 m!122121))

(declare-fun m!122123 () Bool)

(assert (=> b!76796 m!122123))

(declare-fun m!122125 () Bool)

(assert (=> b!76796 m!122125))

(declare-fun m!122127 () Bool)

(assert (=> b!76796 m!122127))

(push 1)

(assert (not b!76796))

(assert (not b!76798))

(assert (not b!76797))

(assert (not b!76795))

(assert (not start!14976))

(assert (not b!76800))

(assert (not b!76799))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!24302 () Bool)

(assert (=> d!24302 (= (array_inv!1332 (buf!1873 thiss!1090)) (bvsge (size!1486 (buf!1873 thiss!1090)) #b00000000000000000000000000000000))))

(assert (=> b!76799 d!24302))

(declare-fun d!24304 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!24304 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1486 (buf!1873 thiss!1090))) ((_ sign_extend 32) (currentByte!3678 thiss!1090)) ((_ sign_extend 32) (currentBit!3673 thiss!1090)) nBits!322) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1486 (buf!1873 thiss!1090))) ((_ sign_extend 32) (currentByte!3678 thiss!1090)) ((_ sign_extend 32) (currentBit!3673 thiss!1090))) nBits!322))))

(declare-fun bs!5867 () Bool)

(assert (= bs!5867 d!24304))

(declare-fun m!122133 () Bool)

(assert (=> bs!5867 m!122133))

(assert (=> b!76800 d!24304))

(declare-fun d!24308 () Bool)

(assert (=> d!24308 (= (invariant!0 (currentBit!3673 thiss!1090) (currentByte!3678 thiss!1090) (size!1486 (buf!1873 thiss!1090))) (and (bvsge (currentBit!3673 thiss!1090) #b00000000000000000000000000000000) (bvslt (currentBit!3673 thiss!1090) #b00000000000000000000000000001000) (bvsge (currentByte!3678 thiss!1090) #b00000000000000000000000000000000) (or (bvslt (currentByte!3678 thiss!1090) (size!1486 (buf!1873 thiss!1090))) (and (= (currentBit!3673 thiss!1090) #b00000000000000000000000000000000) (= (currentByte!3678 thiss!1090) (size!1486 (buf!1873 thiss!1090)))))))))

(assert (=> b!76798 d!24308))

(declare-fun b!76836 () Bool)

(declare-fun e!50414 () Bool)

(declare-fun lt!123038 () tuple2!6694)

(declare-fun lt!123035 () tuple2!6696)

(assert (=> b!76836 (= e!50414 (and (_2!3481 lt!123038) (= (_1!3481 lt!123038) (_2!3482 lt!123035))))))

(assert (=> b!76836 (= lt!123038 (checkBitsLoopPure!0 (_1!3482 lt!123035) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!123036 () Unit!5060)

(declare-fun lt!123037 () Unit!5060)

(assert (=> b!76836 (= lt!123036 lt!123037)))

(declare-fun lt!123034 () tuple2!6692)

(assert (=> b!76836 (validate_offset_bits!1 ((_ sign_extend 32) (size!1486 (buf!1873 (_2!3480 lt!123034)))) ((_ sign_extend 32) (currentByte!3678 thiss!1090)) ((_ sign_extend 32) (currentBit!3673 thiss!1090)) nBits!322)))

(assert (=> b!76836 (= lt!123037 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1873 (_2!3480 lt!123034)) nBits!322))))

(declare-fun e!50413 () Bool)

(assert (=> b!76836 e!50413))

(declare-fun res!63486 () Bool)

(assert (=> b!76836 (=> (not res!63486) (not e!50413))))

(assert (=> b!76836 (= res!63486 (and (= (size!1486 (buf!1873 thiss!1090)) (size!1486 (buf!1873 (_2!3480 lt!123034)))) (bvsge nBits!322 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!76836 (= lt!123035 (reader!0 thiss!1090 (_2!3480 lt!123034)))))

(declare-fun b!76835 () Bool)

(declare-fun res!63488 () Bool)

(assert (=> b!76835 (=> (not res!63488) (not e!50414))))

(assert (=> b!76835 (= res!63488 (isPrefixOf!0 thiss!1090 (_2!3480 lt!123034)))))

(declare-fun d!24312 () Bool)

(assert (=> d!24312 e!50414))

(declare-fun res!63485 () Bool)

(assert (=> d!24312 (=> (not res!63485) (not e!50414))))

(assert (=> d!24312 (= res!63485 (= (size!1486 (buf!1873 thiss!1090)) (size!1486 (buf!1873 (_2!3480 lt!123034)))))))

(declare-fun choose!36 (BitStream!2546 (_ BitVec 64) Bool) tuple2!6692)

(assert (=> d!24312 (= lt!123034 (choose!36 thiss!1090 nBits!322 false))))

(assert (=> d!24312 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!24312 (= (appendNBits!0 thiss!1090 nBits!322 false) lt!123034)))

(declare-fun b!76837 () Bool)

(assert (=> b!76837 (= e!50413 (validate_offset_bits!1 ((_ sign_extend 32) (size!1486 (buf!1873 thiss!1090))) ((_ sign_extend 32) (currentByte!3678 thiss!1090)) ((_ sign_extend 32) (currentBit!3673 thiss!1090)) nBits!322))))

(declare-fun b!76834 () Bool)

(declare-fun res!63487 () Bool)

(assert (=> b!76834 (=> (not res!63487) (not e!50414))))

(declare-fun lt!123039 () (_ BitVec 64))

(assert (=> b!76834 (= res!63487 (= (bitIndex!0 (size!1486 (buf!1873 (_2!3480 lt!123034))) (currentByte!3678 (_2!3480 lt!123034)) (currentBit!3673 (_2!3480 lt!123034))) (bvadd lt!123039 nBits!322)))))

(assert (=> b!76834 (or (not (= (bvand lt!123039 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!322 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!123039 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!123039 nBits!322) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!76834 (= lt!123039 (bitIndex!0 (size!1486 (buf!1873 thiss!1090)) (currentByte!3678 thiss!1090) (currentBit!3673 thiss!1090)))))

(assert (= (and d!24312 res!63485) b!76834))

(assert (= (and b!76834 res!63487) b!76835))

(assert (= (and b!76835 res!63488) b!76836))

(assert (= (and b!76836 res!63486) b!76837))

(declare-fun m!122141 () Bool)

(assert (=> d!24312 m!122141))

(declare-fun m!122145 () Bool)

(assert (=> b!76836 m!122145))

(declare-fun m!122147 () Bool)

(assert (=> b!76836 m!122147))

(declare-fun m!122149 () Bool)

(assert (=> b!76836 m!122149))

(declare-fun m!122153 () Bool)

(assert (=> b!76836 m!122153))

(declare-fun m!122157 () Bool)

(assert (=> b!76835 m!122157))

(declare-fun m!122161 () Bool)

(assert (=> b!76834 m!122161))

(assert (=> b!76834 m!122119))

(assert (=> b!76837 m!122107))

(assert (=> b!76798 d!24312))

(declare-fun d!24322 () Bool)

(assert (=> d!24322 (= (inv!12 thiss!1090) (invariant!0 (currentBit!3673 thiss!1090) (currentByte!3678 thiss!1090) (size!1486 (buf!1873 thiss!1090))))))

(declare-fun bs!5868 () Bool)

(assert (= bs!5868 d!24322))

(assert (=> bs!5868 m!122109))

(assert (=> start!14976 d!24322))

(declare-fun d!24324 () Bool)

(declare-fun res!63513 () Bool)

(declare-fun e!50428 () Bool)

(assert (=> d!24324 (=> (not res!63513) (not e!50428))))

(assert (=> d!24324 (= res!63513 (= (size!1486 (buf!1873 thiss!1090)) (size!1486 (buf!1873 (_2!3480 lt!122984)))))))

(assert (=> d!24324 (= (isPrefixOf!0 thiss!1090 (_2!3480 lt!122984)) e!50428)))

(declare-fun b!76860 () Bool)

(declare-fun res!63512 () Bool)

(assert (=> b!76860 (=> (not res!63512) (not e!50428))))

(assert (=> b!76860 (= res!63512 (bvsle (bitIndex!0 (size!1486 (buf!1873 thiss!1090)) (currentByte!3678 thiss!1090) (currentBit!3673 thiss!1090)) (bitIndex!0 (size!1486 (buf!1873 (_2!3480 lt!122984))) (currentByte!3678 (_2!3480 lt!122984)) (currentBit!3673 (_2!3480 lt!122984)))))))

(declare-fun b!76861 () Bool)

(declare-fun e!50427 () Bool)

(assert (=> b!76861 (= e!50428 e!50427)))

(declare-fun res!63511 () Bool)

(assert (=> b!76861 (=> res!63511 e!50427)))

(assert (=> b!76861 (= res!63511 (= (size!1486 (buf!1873 thiss!1090)) #b00000000000000000000000000000000))))

(declare-fun b!76862 () Bool)

(declare-fun arrayBitRangesEq!0 (array!3195 array!3195 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76862 (= e!50427 (arrayBitRangesEq!0 (buf!1873 thiss!1090) (buf!1873 (_2!3480 lt!122984)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1486 (buf!1873 thiss!1090)) (currentByte!3678 thiss!1090) (currentBit!3673 thiss!1090))))))

(assert (= (and d!24324 res!63513) b!76860))

(assert (= (and b!76860 res!63512) b!76861))

(assert (= (and b!76861 (not res!63511)) b!76862))

(assert (=> b!76860 m!122119))

(assert (=> b!76860 m!122117))

(assert (=> b!76862 m!122119))

(assert (=> b!76862 m!122119))

(declare-fun m!122187 () Bool)

(assert (=> b!76862 m!122187))

(assert (=> b!76797 d!24324))

(declare-fun d!24332 () Bool)

(declare-fun e!50437 () Bool)

(assert (=> d!24332 e!50437))

(declare-fun res!63527 () Bool)

(assert (=> d!24332 (=> (not res!63527) (not e!50437))))

(declare-fun lt!123087 () (_ BitVec 64))

(declare-fun lt!123088 () (_ BitVec 64))

(declare-fun lt!123086 () (_ BitVec 64))

(assert (=> d!24332 (= res!63527 (= lt!123088 (bvsub lt!123086 lt!123087)))))

(assert (=> d!24332 (or (= (bvand lt!123086 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!123087 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!123086 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!123086 lt!123087) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24332 (= lt!123087 (remainingBits!0 ((_ sign_extend 32) (size!1486 (buf!1873 (_2!3480 lt!122984)))) ((_ sign_extend 32) (currentByte!3678 (_2!3480 lt!122984))) ((_ sign_extend 32) (currentBit!3673 (_2!3480 lt!122984)))))))

(declare-fun lt!123085 () (_ BitVec 64))

(declare-fun lt!123090 () (_ BitVec 64))

(assert (=> d!24332 (= lt!123086 (bvmul lt!123085 lt!123090))))

(assert (=> d!24332 (or (= lt!123085 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!123090 (bvsdiv (bvmul lt!123085 lt!123090) lt!123085)))))

(assert (=> d!24332 (= lt!123090 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24332 (= lt!123085 ((_ sign_extend 32) (size!1486 (buf!1873 (_2!3480 lt!122984)))))))

(assert (=> d!24332 (= lt!123088 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3678 (_2!3480 lt!122984))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3673 (_2!3480 lt!122984)))))))

(assert (=> d!24332 (invariant!0 (currentBit!3673 (_2!3480 lt!122984)) (currentByte!3678 (_2!3480 lt!122984)) (size!1486 (buf!1873 (_2!3480 lt!122984))))))

(assert (=> d!24332 (= (bitIndex!0 (size!1486 (buf!1873 (_2!3480 lt!122984))) (currentByte!3678 (_2!3480 lt!122984)) (currentBit!3673 (_2!3480 lt!122984))) lt!123088)))

(declare-fun b!76876 () Bool)

(declare-fun res!63528 () Bool)

(assert (=> b!76876 (=> (not res!63528) (not e!50437))))

(assert (=> b!76876 (= res!63528 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!123088))))

(declare-fun b!76877 () Bool)

(declare-fun lt!123089 () (_ BitVec 64))

(assert (=> b!76877 (= e!50437 (bvsle lt!123088 (bvmul lt!123089 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!76877 (or (= lt!123089 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!123089 #b0000000000000000000000000000000000000000000000000000000000001000) lt!123089)))))

(assert (=> b!76877 (= lt!123089 ((_ sign_extend 32) (size!1486 (buf!1873 (_2!3480 lt!122984)))))))

(assert (= (and d!24332 res!63527) b!76876))

(assert (= (and b!76876 res!63528) b!76877))

(declare-fun m!122197 () Bool)

(assert (=> d!24332 m!122197))

(declare-fun m!122199 () Bool)

(assert (=> d!24332 m!122199))

(assert (=> b!76795 d!24332))

(declare-fun d!24346 () Bool)

(declare-fun e!50438 () Bool)

(assert (=> d!24346 e!50438))

(declare-fun res!63529 () Bool)

(assert (=> d!24346 (=> (not res!63529) (not e!50438))))

(declare-fun lt!123096 () (_ BitVec 64))

(declare-fun lt!123095 () (_ BitVec 64))

(declare-fun lt!123094 () (_ BitVec 64))

(assert (=> d!24346 (= res!63529 (= lt!123096 (bvsub lt!123094 lt!123095)))))

(assert (=> d!24346 (or (= (bvand lt!123094 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!123095 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!123094 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!123094 lt!123095) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24346 (= lt!123095 (remainingBits!0 ((_ sign_extend 32) (size!1486 (buf!1873 thiss!1090))) ((_ sign_extend 32) (currentByte!3678 thiss!1090)) ((_ sign_extend 32) (currentBit!3673 thiss!1090))))))

(declare-fun lt!123093 () (_ BitVec 64))

(declare-fun lt!123098 () (_ BitVec 64))

(assert (=> d!24346 (= lt!123094 (bvmul lt!123093 lt!123098))))

(assert (=> d!24346 (or (= lt!123093 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!123098 (bvsdiv (bvmul lt!123093 lt!123098) lt!123093)))))

(assert (=> d!24346 (= lt!123098 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24346 (= lt!123093 ((_ sign_extend 32) (size!1486 (buf!1873 thiss!1090))))))

(assert (=> d!24346 (= lt!123096 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3678 thiss!1090)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3673 thiss!1090))))))

(assert (=> d!24346 (invariant!0 (currentBit!3673 thiss!1090) (currentByte!3678 thiss!1090) (size!1486 (buf!1873 thiss!1090)))))

(assert (=> d!24346 (= (bitIndex!0 (size!1486 (buf!1873 thiss!1090)) (currentByte!3678 thiss!1090) (currentBit!3673 thiss!1090)) lt!123096)))

(declare-fun b!76878 () Bool)

(declare-fun res!63530 () Bool)

(assert (=> b!76878 (=> (not res!63530) (not e!50438))))

(assert (=> b!76878 (= res!63530 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!123096))))

(declare-fun b!76879 () Bool)

(declare-fun lt!123097 () (_ BitVec 64))

(assert (=> b!76879 (= e!50438 (bvsle lt!123096 (bvmul lt!123097 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!76879 (or (= lt!123097 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!123097 #b0000000000000000000000000000000000000000000000000000000000001000) lt!123097)))))

(assert (=> b!76879 (= lt!123097 ((_ sign_extend 32) (size!1486 (buf!1873 thiss!1090))))))

(assert (= (and d!24346 res!63529) b!76878))

(assert (= (and b!76878 res!63530) b!76879))

(assert (=> d!24346 m!122133))

(assert (=> d!24346 m!122109))

(assert (=> b!76795 d!24346))

(declare-fun d!24348 () Bool)

(declare-datatypes ((tuple2!6702 0))(
  ( (tuple2!6703 (_1!3485 Bool) (_2!3485 BitStream!2546)) )
))
(declare-fun lt!123102 () tuple2!6702)

(declare-fun checkBitsLoop!0 (BitStream!2546 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6702)

(assert (=> d!24348 (= lt!123102 (checkBitsLoop!0 (_1!3482 lt!122985) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24348 (= (checkBitsLoopPure!0 (_1!3482 lt!122985) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000) (tuple2!6695 (_2!3485 lt!123102) (_1!3485 lt!123102)))))

(declare-fun bs!5876 () Bool)

(assert (= bs!5876 d!24348))

(declare-fun m!122203 () Bool)

(assert (=> bs!5876 m!122203))

(assert (=> b!76796 d!24348))

(declare-fun d!24352 () Bool)

(assert (=> d!24352 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1486 (buf!1873 (_2!3480 lt!122984)))) ((_ sign_extend 32) (currentByte!3678 thiss!1090)) ((_ sign_extend 32) (currentBit!3673 thiss!1090)) nBits!322) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1486 (buf!1873 (_2!3480 lt!122984)))) ((_ sign_extend 32) (currentByte!3678 thiss!1090)) ((_ sign_extend 32) (currentBit!3673 thiss!1090))) nBits!322))))

(declare-fun bs!5877 () Bool)

(assert (= bs!5877 d!24352))

(declare-fun m!122205 () Bool)

(assert (=> bs!5877 m!122205))

(assert (=> b!76796 d!24352))

(declare-fun d!24354 () Bool)

(assert (=> d!24354 (validate_offset_bits!1 ((_ sign_extend 32) (size!1486 (buf!1873 (_2!3480 lt!122984)))) ((_ sign_extend 32) (currentByte!3678 thiss!1090)) ((_ sign_extend 32) (currentBit!3673 thiss!1090)) nBits!322)))

(declare-fun lt!123105 () Unit!5060)

(declare-fun choose!9 (BitStream!2546 array!3195 (_ BitVec 64) BitStream!2546) Unit!5060)

(assert (=> d!24354 (= lt!123105 (choose!9 thiss!1090 (buf!1873 (_2!3480 lt!122984)) nBits!322 (BitStream!2547 (buf!1873 (_2!3480 lt!122984)) (currentByte!3678 thiss!1090) (currentBit!3673 thiss!1090))))))

(assert (=> d!24354 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1873 (_2!3480 lt!122984)) nBits!322) lt!123105)))

(declare-fun bs!5878 () Bool)

(assert (= bs!5878 d!24354))

(assert (=> bs!5878 m!122123))

(declare-fun m!122207 () Bool)

(assert (=> bs!5878 m!122207))

(assert (=> b!76796 d!24354))

(declare-fun lt!123292 () tuple2!6696)

(declare-fun lt!123298 () (_ BitVec 64))

(declare-fun b!76928 () Bool)

(declare-fun e!50460 () Bool)

(declare-fun lt!123294 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2546 (_ BitVec 64)) BitStream!2546)

(assert (=> b!76928 (= e!50460 (= (_1!3482 lt!123292) (withMovedBitIndex!0 (_2!3482 lt!123292) (bvsub lt!123298 lt!123294))))))

(assert (=> b!76928 (or (= (bvand lt!123298 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!123294 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!123298 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!123298 lt!123294) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!76928 (= lt!123294 (bitIndex!0 (size!1486 (buf!1873 (_2!3480 lt!122984))) (currentByte!3678 (_2!3480 lt!122984)) (currentBit!3673 (_2!3480 lt!122984))))))

(assert (=> b!76928 (= lt!123298 (bitIndex!0 (size!1486 (buf!1873 thiss!1090)) (currentByte!3678 thiss!1090) (currentBit!3673 thiss!1090)))))

(declare-fun b!76929 () Bool)

(declare-fun e!50459 () Unit!5060)

(declare-fun Unit!5064 () Unit!5060)

(assert (=> b!76929 (= e!50459 Unit!5064)))

(declare-fun b!76930 () Bool)

(declare-fun lt!123306 () Unit!5060)

(assert (=> b!76930 (= e!50459 lt!123306)))

(declare-fun lt!123299 () (_ BitVec 64))

(assert (=> b!76930 (= lt!123299 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123301 () (_ BitVec 64))

(assert (=> b!76930 (= lt!123301 (bitIndex!0 (size!1486 (buf!1873 thiss!1090)) (currentByte!3678 thiss!1090) (currentBit!3673 thiss!1090)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!3195 array!3195 (_ BitVec 64) (_ BitVec 64)) Unit!5060)

(assert (=> b!76930 (= lt!123306 (arrayBitRangesEqSymmetric!0 (buf!1873 thiss!1090) (buf!1873 (_2!3480 lt!122984)) lt!123299 lt!123301))))

(assert (=> b!76930 (arrayBitRangesEq!0 (buf!1873 (_2!3480 lt!122984)) (buf!1873 thiss!1090) lt!123299 lt!123301)))

(declare-fun d!24356 () Bool)

(assert (=> d!24356 e!50460))

(declare-fun res!63564 () Bool)

(assert (=> d!24356 (=> (not res!63564) (not e!50460))))

(assert (=> d!24356 (= res!63564 (isPrefixOf!0 (_1!3482 lt!123292) (_2!3482 lt!123292)))))

