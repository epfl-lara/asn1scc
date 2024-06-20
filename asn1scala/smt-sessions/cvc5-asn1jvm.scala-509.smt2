; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14972 () Bool)

(assert start!14972)

(declare-fun b!76759 () Bool)

(declare-fun res!63418 () Bool)

(declare-fun e!50367 () Bool)

(assert (=> b!76759 (=> (not res!63418) (not e!50367))))

(declare-datatypes ((array!3191 0))(
  ( (array!3192 (arr!2085 (Array (_ BitVec 32) (_ BitVec 8))) (size!1484 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2542 0))(
  ( (BitStream!2543 (buf!1871 array!3191) (currentByte!3676 (_ BitVec 32)) (currentBit!3671 (_ BitVec 32))) )
))
(declare-fun thiss!1090 () BitStream!2542)

(declare-fun nBits!322 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76759 (= res!63418 (validate_offset_bits!1 ((_ sign_extend 32) (size!1484 (buf!1871 thiss!1090))) ((_ sign_extend 32) (currentByte!3676 thiss!1090)) ((_ sign_extend 32) (currentBit!3671 thiss!1090)) nBits!322))))

(declare-fun b!76760 () Bool)

(declare-fun res!63420 () Bool)

(declare-fun e!50370 () Bool)

(assert (=> b!76760 (=> (not res!63420) (not e!50370))))

(declare-datatypes ((Unit!5056 0))(
  ( (Unit!5057) )
))
(declare-datatypes ((tuple2!6680 0))(
  ( (tuple2!6681 (_1!3474 Unit!5056) (_2!3474 BitStream!2542)) )
))
(declare-fun lt!122958 () tuple2!6680)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!76760 (= res!63420 (= (bitIndex!0 (size!1484 (buf!1871 (_2!3474 lt!122958))) (currentByte!3676 (_2!3474 lt!122958)) (currentBit!3671 (_2!3474 lt!122958))) (bvadd (bitIndex!0 (size!1484 (buf!1871 thiss!1090)) (currentByte!3676 thiss!1090) (currentBit!3671 thiss!1090)) nBits!322)))))

(declare-fun b!76761 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!76761 (= e!50367 (not (invariant!0 (currentBit!3671 thiss!1090) (currentByte!3676 thiss!1090) (size!1484 (buf!1871 thiss!1090)))))))

(assert (=> b!76761 e!50370))

(declare-fun res!63421 () Bool)

(assert (=> b!76761 (=> (not res!63421) (not e!50370))))

(assert (=> b!76761 (= res!63421 (= (size!1484 (buf!1871 thiss!1090)) (size!1484 (buf!1871 (_2!3474 lt!122958)))))))

(declare-fun appendNBits!0 (BitStream!2542 (_ BitVec 64) Bool) tuple2!6680)

(assert (=> b!76761 (= lt!122958 (appendNBits!0 thiss!1090 nBits!322 false))))

(declare-fun b!76762 () Bool)

(declare-datatypes ((tuple2!6682 0))(
  ( (tuple2!6683 (_1!3475 BitStream!2542) (_2!3475 Bool)) )
))
(declare-fun lt!122961 () tuple2!6682)

(declare-datatypes ((tuple2!6684 0))(
  ( (tuple2!6685 (_1!3476 BitStream!2542) (_2!3476 BitStream!2542)) )
))
(declare-fun lt!122960 () tuple2!6684)

(assert (=> b!76762 (= e!50370 (not (or (not (_2!3475 lt!122961)) (not (= (_1!3475 lt!122961) (_2!3476 lt!122960))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!2542 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6682)

(assert (=> b!76762 (= lt!122961 (checkBitsLoopPure!0 (_1!3476 lt!122960) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!76762 (validate_offset_bits!1 ((_ sign_extend 32) (size!1484 (buf!1871 (_2!3474 lt!122958)))) ((_ sign_extend 32) (currentByte!3676 thiss!1090)) ((_ sign_extend 32) (currentBit!3671 thiss!1090)) nBits!322)))

(declare-fun lt!122959 () Unit!5056)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2542 array!3191 (_ BitVec 64)) Unit!5056)

(assert (=> b!76762 (= lt!122959 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1871 (_2!3474 lt!122958)) nBits!322))))

(declare-fun reader!0 (BitStream!2542 BitStream!2542) tuple2!6684)

(assert (=> b!76762 (= lt!122960 (reader!0 thiss!1090 (_2!3474 lt!122958)))))

(declare-fun res!63419 () Bool)

(assert (=> start!14972 (=> (not res!63419) (not e!50367))))

(assert (=> start!14972 (= res!63419 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!14972 e!50367))

(assert (=> start!14972 true))

(declare-fun e!50369 () Bool)

(declare-fun inv!12 (BitStream!2542) Bool)

(assert (=> start!14972 (and (inv!12 thiss!1090) e!50369)))

(declare-fun b!76763 () Bool)

(declare-fun res!63417 () Bool)

(assert (=> b!76763 (=> (not res!63417) (not e!50370))))

(declare-fun isPrefixOf!0 (BitStream!2542 BitStream!2542) Bool)

(assert (=> b!76763 (= res!63417 (isPrefixOf!0 thiss!1090 (_2!3474 lt!122958)))))

(declare-fun b!76764 () Bool)

(declare-fun array_inv!1330 (array!3191) Bool)

(assert (=> b!76764 (= e!50369 (array_inv!1330 (buf!1871 thiss!1090)))))

(assert (= (and start!14972 res!63419) b!76759))

(assert (= (and b!76759 res!63418) b!76761))

(assert (= (and b!76761 res!63421) b!76760))

(assert (= (and b!76760 res!63420) b!76763))

(assert (= (and b!76763 res!63417) b!76762))

(assert (= start!14972 b!76764))

(declare-fun m!122057 () Bool)

(assert (=> b!76759 m!122057))

(declare-fun m!122059 () Bool)

(assert (=> b!76762 m!122059))

(declare-fun m!122061 () Bool)

(assert (=> b!76762 m!122061))

(declare-fun m!122063 () Bool)

(assert (=> b!76762 m!122063))

(declare-fun m!122065 () Bool)

(assert (=> b!76762 m!122065))

(declare-fun m!122067 () Bool)

(assert (=> b!76763 m!122067))

(declare-fun m!122069 () Bool)

(assert (=> b!76760 m!122069))

(declare-fun m!122071 () Bool)

(assert (=> b!76760 m!122071))

(declare-fun m!122073 () Bool)

(assert (=> b!76764 m!122073))

(declare-fun m!122075 () Bool)

(assert (=> b!76761 m!122075))

(declare-fun m!122077 () Bool)

(assert (=> b!76761 m!122077))

(declare-fun m!122079 () Bool)

(assert (=> start!14972 m!122079))

(push 1)

(assert (not b!76763))

(assert (not b!76762))

(assert (not b!76760))

(assert (not b!76759))

(assert (not b!76761))

(assert (not b!76764))

(assert (not start!14972))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!24296 () Bool)

(assert (=> d!24296 (= (array_inv!1330 (buf!1871 thiss!1090)) (bvsge (size!1484 (buf!1871 thiss!1090)) #b00000000000000000000000000000000))))

(assert (=> b!76764 d!24296))

(declare-fun d!24298 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!24298 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1484 (buf!1871 thiss!1090))) ((_ sign_extend 32) (currentByte!3676 thiss!1090)) ((_ sign_extend 32) (currentBit!3671 thiss!1090)) nBits!322) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1484 (buf!1871 thiss!1090))) ((_ sign_extend 32) (currentByte!3676 thiss!1090)) ((_ sign_extend 32) (currentBit!3671 thiss!1090))) nBits!322))))

(declare-fun bs!5866 () Bool)

(assert (= bs!5866 d!24298))

(declare-fun m!122129 () Bool)

(assert (=> bs!5866 m!122129))

(assert (=> b!76759 d!24298))

(declare-fun d!24300 () Bool)

(declare-fun res!63458 () Bool)

(declare-fun e!50399 () Bool)

(assert (=> d!24300 (=> (not res!63458) (not e!50399))))

(assert (=> d!24300 (= res!63458 (= (size!1484 (buf!1871 thiss!1090)) (size!1484 (buf!1871 (_2!3474 lt!122958)))))))

(assert (=> d!24300 (= (isPrefixOf!0 thiss!1090 (_2!3474 lt!122958)) e!50399)))

(declare-fun b!76807 () Bool)

(declare-fun res!63460 () Bool)

(assert (=> b!76807 (=> (not res!63460) (not e!50399))))

(assert (=> b!76807 (= res!63460 (bvsle (bitIndex!0 (size!1484 (buf!1871 thiss!1090)) (currentByte!3676 thiss!1090) (currentBit!3671 thiss!1090)) (bitIndex!0 (size!1484 (buf!1871 (_2!3474 lt!122958))) (currentByte!3676 (_2!3474 lt!122958)) (currentBit!3671 (_2!3474 lt!122958)))))))

(declare-fun b!76808 () Bool)

(declare-fun e!50400 () Bool)

(assert (=> b!76808 (= e!50399 e!50400)))

(declare-fun res!63459 () Bool)

(assert (=> b!76808 (=> res!63459 e!50400)))

(assert (=> b!76808 (= res!63459 (= (size!1484 (buf!1871 thiss!1090)) #b00000000000000000000000000000000))))

(declare-fun b!76809 () Bool)

(declare-fun arrayBitRangesEq!0 (array!3191 array!3191 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76809 (= e!50400 (arrayBitRangesEq!0 (buf!1871 thiss!1090) (buf!1871 (_2!3474 lt!122958)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1484 (buf!1871 thiss!1090)) (currentByte!3676 thiss!1090) (currentBit!3671 thiss!1090))))))

(assert (= (and d!24300 res!63458) b!76807))

(assert (= (and b!76807 res!63460) b!76808))

(assert (= (and b!76808 (not res!63459)) b!76809))

(assert (=> b!76807 m!122071))

(assert (=> b!76807 m!122069))

(assert (=> b!76809 m!122071))

(assert (=> b!76809 m!122071))

(declare-fun m!122131 () Bool)

(assert (=> b!76809 m!122131))

(assert (=> b!76763 d!24300))

(declare-fun d!24306 () Bool)

(assert (=> d!24306 (= (invariant!0 (currentBit!3671 thiss!1090) (currentByte!3676 thiss!1090) (size!1484 (buf!1871 thiss!1090))) (and (bvsge (currentBit!3671 thiss!1090) #b00000000000000000000000000000000) (bvslt (currentBit!3671 thiss!1090) #b00000000000000000000000000001000) (bvsge (currentByte!3676 thiss!1090) #b00000000000000000000000000000000) (or (bvslt (currentByte!3676 thiss!1090) (size!1484 (buf!1871 thiss!1090))) (and (= (currentBit!3671 thiss!1090) #b00000000000000000000000000000000) (= (currentByte!3676 thiss!1090) (size!1484 (buf!1871 thiss!1090)))))))))

(assert (=> b!76761 d!24306))

(declare-fun b!76841 () Bool)

(declare-fun e!50416 () Bool)

(assert (=> b!76841 (= e!50416 (validate_offset_bits!1 ((_ sign_extend 32) (size!1484 (buf!1871 thiss!1090))) ((_ sign_extend 32) (currentByte!3676 thiss!1090)) ((_ sign_extend 32) (currentBit!3671 thiss!1090)) nBits!322))))

(declare-fun d!24310 () Bool)

(declare-fun e!50415 () Bool)

(assert (=> d!24310 e!50415))

(declare-fun res!63492 () Bool)

(assert (=> d!24310 (=> (not res!63492) (not e!50415))))

(declare-fun lt!123042 () tuple2!6680)

(assert (=> d!24310 (= res!63492 (= (size!1484 (buf!1871 thiss!1090)) (size!1484 (buf!1871 (_2!3474 lt!123042)))))))

(declare-fun choose!36 (BitStream!2542 (_ BitVec 64) Bool) tuple2!6680)

(assert (=> d!24310 (= lt!123042 (choose!36 thiss!1090 nBits!322 false))))

(assert (=> d!24310 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!24310 (= (appendNBits!0 thiss!1090 nBits!322 false) lt!123042)))

(declare-fun b!76838 () Bool)

(declare-fun res!63491 () Bool)

(assert (=> b!76838 (=> (not res!63491) (not e!50415))))

(declare-fun lt!123041 () (_ BitVec 64))

(assert (=> b!76838 (= res!63491 (= (bitIndex!0 (size!1484 (buf!1871 (_2!3474 lt!123042))) (currentByte!3676 (_2!3474 lt!123042)) (currentBit!3671 (_2!3474 lt!123042))) (bvadd lt!123041 nBits!322)))))

(assert (=> b!76838 (or (not (= (bvand lt!123041 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!322 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!123041 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!123041 nBits!322) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!76838 (= lt!123041 (bitIndex!0 (size!1484 (buf!1871 thiss!1090)) (currentByte!3676 thiss!1090) (currentBit!3671 thiss!1090)))))

(declare-fun b!76840 () Bool)

(declare-fun lt!123044 () tuple2!6682)

(declare-fun lt!123045 () tuple2!6684)

(assert (=> b!76840 (= e!50415 (and (_2!3475 lt!123044) (= (_1!3475 lt!123044) (_2!3476 lt!123045))))))

(assert (=> b!76840 (= lt!123044 (checkBitsLoopPure!0 (_1!3476 lt!123045) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!123040 () Unit!5056)

(declare-fun lt!123043 () Unit!5056)

(assert (=> b!76840 (= lt!123040 lt!123043)))

(assert (=> b!76840 (validate_offset_bits!1 ((_ sign_extend 32) (size!1484 (buf!1871 (_2!3474 lt!123042)))) ((_ sign_extend 32) (currentByte!3676 thiss!1090)) ((_ sign_extend 32) (currentBit!3671 thiss!1090)) nBits!322)))

(assert (=> b!76840 (= lt!123043 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1871 (_2!3474 lt!123042)) nBits!322))))

(assert (=> b!76840 e!50416))

(declare-fun res!63490 () Bool)

(assert (=> b!76840 (=> (not res!63490) (not e!50416))))

(assert (=> b!76840 (= res!63490 (and (= (size!1484 (buf!1871 thiss!1090)) (size!1484 (buf!1871 (_2!3474 lt!123042)))) (bvsge nBits!322 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!76840 (= lt!123045 (reader!0 thiss!1090 (_2!3474 lt!123042)))))

(declare-fun b!76839 () Bool)

(declare-fun res!63489 () Bool)

(assert (=> b!76839 (=> (not res!63489) (not e!50415))))

(assert (=> b!76839 (= res!63489 (isPrefixOf!0 thiss!1090 (_2!3474 lt!123042)))))

(assert (= (and d!24310 res!63492) b!76838))

(assert (= (and b!76838 res!63491) b!76839))

(assert (= (and b!76839 res!63489) b!76840))

(assert (= (and b!76840 res!63490) b!76841))

(declare-fun m!122143 () Bool)

(assert (=> b!76838 m!122143))

(assert (=> b!76838 m!122071))

(assert (=> b!76841 m!122057))

(declare-fun m!122151 () Bool)

(assert (=> d!24310 m!122151))

(declare-fun m!122155 () Bool)

(assert (=> b!76840 m!122155))

(declare-fun m!122159 () Bool)

(assert (=> b!76840 m!122159))

(declare-fun m!122163 () Bool)

(assert (=> b!76840 m!122163))

(declare-fun m!122165 () Bool)

(assert (=> b!76840 m!122165))

(declare-fun m!122167 () Bool)

(assert (=> b!76839 m!122167))

(assert (=> b!76761 d!24310))

(declare-fun d!24321 () Bool)

(declare-datatypes ((tuple2!6698 0))(
  ( (tuple2!6699 (_1!3483 Bool) (_2!3483 BitStream!2542)) )
))
(declare-fun lt!123060 () tuple2!6698)

(declare-fun checkBitsLoop!0 (BitStream!2542 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6698)

(assert (=> d!24321 (= lt!123060 (checkBitsLoop!0 (_1!3476 lt!122960) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24321 (= (checkBitsLoopPure!0 (_1!3476 lt!122960) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000) (tuple2!6683 (_2!3483 lt!123060) (_1!3483 lt!123060)))))

(declare-fun bs!5869 () Bool)

(assert (= bs!5869 d!24321))

(declare-fun m!122169 () Bool)

(assert (=> bs!5869 m!122169))

(assert (=> b!76762 d!24321))

(declare-fun d!24326 () Bool)

(assert (=> d!24326 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1484 (buf!1871 (_2!3474 lt!122958)))) ((_ sign_extend 32) (currentByte!3676 thiss!1090)) ((_ sign_extend 32) (currentBit!3671 thiss!1090)) nBits!322) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1484 (buf!1871 (_2!3474 lt!122958)))) ((_ sign_extend 32) (currentByte!3676 thiss!1090)) ((_ sign_extend 32) (currentBit!3671 thiss!1090))) nBits!322))))

(declare-fun bs!5870 () Bool)

(assert (= bs!5870 d!24326))

(declare-fun m!122171 () Bool)

(assert (=> bs!5870 m!122171))

(assert (=> b!76762 d!24326))

(declare-fun d!24328 () Bool)

(assert (=> d!24328 (validate_offset_bits!1 ((_ sign_extend 32) (size!1484 (buf!1871 (_2!3474 lt!122958)))) ((_ sign_extend 32) (currentByte!3676 thiss!1090)) ((_ sign_extend 32) (currentBit!3671 thiss!1090)) nBits!322)))

(declare-fun lt!123069 () Unit!5056)

(declare-fun choose!9 (BitStream!2542 array!3191 (_ BitVec 64) BitStream!2542) Unit!5056)

(assert (=> d!24328 (= lt!123069 (choose!9 thiss!1090 (buf!1871 (_2!3474 lt!122958)) nBits!322 (BitStream!2543 (buf!1871 (_2!3474 lt!122958)) (currentByte!3676 thiss!1090) (currentBit!3671 thiss!1090))))))

(assert (=> d!24328 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1871 (_2!3474 lt!122958)) nBits!322) lt!123069)))

(declare-fun bs!5872 () Bool)

(assert (= bs!5872 d!24328))

(assert (=> bs!5872 m!122061))

(declare-fun m!122189 () Bool)

(assert (=> bs!5872 m!122189))

(assert (=> b!76762 d!24328))

(declare-fun b!76890 () Bool)

(declare-fun res!63539 () Bool)

(declare-fun e!50443 () Bool)

(assert (=> b!76890 (=> (not res!63539) (not e!50443))))

(declare-fun lt!123147 () tuple2!6684)

(assert (=> b!76890 (= res!63539 (isPrefixOf!0 (_1!3476 lt!123147) thiss!1090))))

(declare-fun b!76891 () Bool)

(declare-fun res!63538 () Bool)

(assert (=> b!76891 (=> (not res!63538) (not e!50443))))

(assert (=> b!76891 (= res!63538 (isPrefixOf!0 (_2!3476 lt!123147) (_2!3474 lt!122958)))))

(declare-fun lt!123148 () (_ BitVec 64))

(declare-fun b!76892 () Bool)

(declare-fun lt!123154 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2542 (_ BitVec 64)) BitStream!2542)

(assert (=> b!76892 (= e!50443 (= (_1!3476 lt!123147) (withMovedBitIndex!0 (_2!3476 lt!123147) (bvsub lt!123154 lt!123148))))))

(assert (=> b!76892 (or (= (bvand lt!123154 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!123148 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!123154 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!123154 lt!123148) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!76892 (= lt!123148 (bitIndex!0 (size!1484 (buf!1871 (_2!3474 lt!122958))) (currentByte!3676 (_2!3474 lt!122958)) (currentBit!3671 (_2!3474 lt!122958))))))

(assert (=> b!76892 (= lt!123154 (bitIndex!0 (size!1484 (buf!1871 thiss!1090)) (currentByte!3676 thiss!1090) (currentBit!3671 thiss!1090)))))

(declare-fun b!76894 () Bool)

(declare-fun e!50444 () Unit!5056)

(declare-fun Unit!5062 () Unit!5056)

(assert (=> b!76894 (= e!50444 Unit!5062)))

(declare-fun d!24336 () Bool)

(assert (=> d!24336 e!50443))

(declare-fun res!63537 () Bool)

(assert (=> d!24336 (=> (not res!63537) (not e!50443))))

(assert (=> d!24336 (= res!63537 (isPrefixOf!0 (_1!3476 lt!123147) (_2!3476 lt!123147)))))

(declare-fun lt!123162 () BitStream!2542)

(assert (=> d!24336 (= lt!123147 (tuple2!6685 lt!123162 (_2!3474 lt!122958)))))

(declare-fun lt!123164 () Unit!5056)

(declare-fun lt!123146 () Unit!5056)

(assert (=> d!24336 (= lt!123164 lt!123146)))

(assert (=> d!24336 (isPrefixOf!0 lt!123162 (_2!3474 lt!122958))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2542 BitStream!2542 BitStream!2542) Unit!5056)

(assert (=> d!24336 (= lt!123146 (lemmaIsPrefixTransitive!0 lt!123162 (_2!3474 lt!122958) (_2!3474 lt!122958)))))

(declare-fun lt!123152 () Unit!5056)

(declare-fun lt!123156 () Unit!5056)

(assert (=> d!24336 (= lt!123152 lt!123156)))

(assert (=> d!24336 (isPrefixOf!0 lt!123162 (_2!3474 lt!122958))))

(assert (=> d!24336 (= lt!123156 (lemmaIsPrefixTransitive!0 lt!123162 thiss!1090 (_2!3474 lt!122958)))))

(declare-fun lt!123163 () Unit!5056)

(assert (=> d!24336 (= lt!123163 e!50444)))

(declare-fun c!5588 () Bool)

(assert (=> d!24336 (= c!5588 (not (= (size!1484 (buf!1871 thiss!1090)) #b00000000000000000000000000000000)))))

(declare-fun lt!123150 () Unit!5056)

(declare-fun lt!123158 () Unit!5056)

(assert (=> d!24336 (= lt!123150 lt!123158)))

(assert (=> d!24336 (isPrefixOf!0 (_2!3474 lt!122958) (_2!3474 lt!122958))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2542) Unit!5056)

(assert (=> d!24336 (= lt!123158 (lemmaIsPrefixRefl!0 (_2!3474 lt!122958)))))

(declare-fun lt!123161 () Unit!5056)

(declare-fun lt!123165 () Unit!5056)

(assert (=> d!24336 (= lt!123161 lt!123165)))

(assert (=> d!24336 (= lt!123165 (lemmaIsPrefixRefl!0 (_2!3474 lt!122958)))))

(declare-fun lt!123153 () Unit!5056)

(declare-fun lt!123149 () Unit!5056)

(assert (=> d!24336 (= lt!123153 lt!123149)))

(assert (=> d!24336 (isPrefixOf!0 lt!123162 lt!123162)))

(assert (=> d!24336 (= lt!123149 (lemmaIsPrefixRefl!0 lt!123162))))

(declare-fun lt!123151 () Unit!5056)

(declare-fun lt!123155 () Unit!5056)

(assert (=> d!24336 (= lt!123151 lt!123155)))

(assert (=> d!24336 (isPrefixOf!0 thiss!1090 thiss!1090)))

(assert (=> d!24336 (= lt!123155 (lemmaIsPrefixRefl!0 thiss!1090))))

(assert (=> d!24336 (= lt!123162 (BitStream!2543 (buf!1871 (_2!3474 lt!122958)) (currentByte!3676 thiss!1090) (currentBit!3671 thiss!1090)))))

(assert (=> d!24336 (isPrefixOf!0 thiss!1090 (_2!3474 lt!122958))))

(assert (=> d!24336 (= (reader!0 thiss!1090 (_2!3474 lt!122958)) lt!123147)))

(declare-fun b!76893 () Bool)

(declare-fun lt!123160 () Unit!5056)

(assert (=> b!76893 (= e!50444 lt!123160)))

(declare-fun lt!123157 () (_ BitVec 64))

(assert (=> b!76893 (= lt!123157 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123159 () (_ BitVec 64))

(assert (=> b!76893 (= lt!123159 (bitIndex!0 (size!1484 (buf!1871 thiss!1090)) (currentByte!3676 thiss!1090) (currentBit!3671 thiss!1090)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!3191 array!3191 (_ BitVec 64) (_ BitVec 64)) Unit!5056)

(assert (=> b!76893 (= lt!123160 (arrayBitRangesEqSymmetric!0 (buf!1871 thiss!1090) (buf!1871 (_2!3474 lt!122958)) lt!123157 lt!123159))))

(assert (=> b!76893 (arrayBitRangesEq!0 (buf!1871 (_2!3474 lt!122958)) (buf!1871 thiss!1090) lt!123157 lt!123159)))

(assert (= (and d!24336 c!5588) b!76893))

(assert (= (and d!24336 (not c!5588)) b!76894))

(assert (= (and d!24336 res!63537) b!76890))

(assert (= (and b!76890 res!63539) b!76891))

(assert (= (and b!76891 res!63538) b!76892))

(declare-fun m!122209 () Bool)

(assert (=> b!76891 m!122209))

(declare-fun m!122211 () Bool)

(assert (=> d!24336 m!122211))

(declare-fun m!122213 () Bool)

(assert (=> d!24336 m!122213))

(declare-fun m!122215 () Bool)

(assert (=> d!24336 m!122215))

(declare-fun m!122217 () Bool)

(assert (=> d!24336 m!122217))

(assert (=> d!24336 m!122067))

(declare-fun m!122219 () Bool)

(assert (=> d!24336 m!122219))

(declare-fun m!122221 () Bool)

(assert (=> d!24336 m!122221))

(declare-fun m!122223 () Bool)

(assert (=> d!24336 m!122223))

(declare-fun m!122225 () Bool)

(assert (=> d!24336 m!122225))

(declare-fun m!122227 () Bool)

(assert (=> d!24336 m!122227))

(declare-fun m!122229 () Bool)

(assert (=> d!24336 m!122229))

(declare-fun m!122231 () Bool)

(assert (=> b!76892 m!122231))

(assert (=> b!76892 m!122069))

(assert (=> b!76892 m!122071))

(declare-fun m!122233 () Bool)

(assert (=> b!76890 m!122233))

(assert (=> b!76893 m!122071))

(declare-fun m!122235 () Bool)

(assert (=> b!76893 m!122235))

(declare-fun m!122237 () Bool)

(assert (=> b!76893 m!122237))

(assert (=> b!76762 d!24336))

(declare-fun d!24358 () Bool)

(declare-fun e!50455 () Bool)

(assert (=> d!24358 e!50455))

(declare-fun res!63553 () Bool)

(assert (=> d!24358 (=> (not res!63553) (not e!50455))))

(declare-fun lt!123271 () (_ BitVec 64))

(declare-fun lt!123270 () (_ BitVec 64))

(declare-fun lt!123268 () (_ BitVec 64))

(assert (=> d!24358 (= res!63553 (= lt!123270 (bvsub lt!123271 lt!123268)))))

(assert (=> d!24358 (or (= (bvand lt!123271 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!123268 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!123271 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!123271 lt!123268) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24358 (= lt!123268 (remainingBits!0 ((_ sign_extend 32) (size!1484 (buf!1871 (_2!3474 lt!122958)))) ((_ sign_extend 32) (currentByte!3676 (_2!3474 lt!122958))) ((_ sign_extend 32) (currentBit!3671 (_2!3474 lt!122958)))))))

(declare-fun lt!123269 () (_ BitVec 64))

(declare-fun lt!123267 () (_ BitVec 64))

(assert (=> d!24358 (= lt!123271 (bvmul lt!123269 lt!123267))))

(assert (=> d!24358 (or (= lt!123269 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!123267 (bvsdiv (bvmul lt!123269 lt!123267) lt!123269)))))

(assert (=> d!24358 (= lt!123267 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24358 (= lt!123269 ((_ sign_extend 32) (size!1484 (buf!1871 (_2!3474 lt!122958)))))))

(assert (=> d!24358 (= lt!123270 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3676 (_2!3474 lt!122958))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3671 (_2!3474 lt!122958)))))))

(assert (=> d!24358 (invariant!0 (currentBit!3671 (_2!3474 lt!122958)) (currentByte!3676 (_2!3474 lt!122958)) (size!1484 (buf!1871 (_2!3474 lt!122958))))))

(assert (=> d!24358 (= (bitIndex!0 (size!1484 (buf!1871 (_2!3474 lt!122958))) (currentByte!3676 (_2!3474 lt!122958)) (currentBit!3671 (_2!3474 lt!122958))) lt!123270)))

(declare-fun b!76918 () Bool)

(declare-fun res!63554 () Bool)

(assert (=> b!76918 (=> (not res!63554) (not e!50455))))

(assert (=> b!76918 (= res!63554 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!123270))))

(declare-fun b!76919 () Bool)

(declare-fun lt!123266 () (_ BitVec 64))

(assert (=> b!76919 (= e!50455 (bvsle lt!123270 (bvmul lt!123266 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!76919 (or (= lt!123266 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!123266 #b0000000000000000000000000000000000000000000000000000000000001000) lt!123266)))))

(assert (=> b!76919 (= lt!123266 ((_ sign_extend 32) (size!1484 (buf!1871 (_2!3474 lt!122958)))))))

(assert (= (and d!24358 res!63553) b!76918))

(assert (= (and b!76918 res!63554) b!76919))

(declare-fun m!122269 () Bool)

(assert (=> d!24358 m!122269))

(declare-fun m!122271 () Bool)

(assert (=> d!24358 m!122271))

(assert (=> b!76760 d!24358))

(declare-fun d!24362 () Bool)

(declare-fun e!50458 () Bool)

(assert (=> d!24362 e!50458))

(declare-fun res!63561 () Bool)

(assert (=> d!24362 (=> (not res!63561) (not e!50458))))

(declare-fun lt!123288 () (_ BitVec 64))

(declare-fun lt!123286 () (_ BitVec 64))

(declare-fun lt!123289 () (_ BitVec 64))

(assert (=> d!24362 (= res!63561 (= lt!123288 (bvsub lt!123289 lt!123286)))))

(assert (=> d!24362 (or (= (bvand lt!123289 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!123286 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!123289 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!123289 lt!123286) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24362 (= lt!123286 (remainingBits!0 ((_ sign_extend 32) (size!1484 (buf!1871 thiss!1090))) ((_ sign_extend 32) (currentByte!3676 thiss!1090)) ((_ sign_extend 32) (currentBit!3671 thiss!1090))))))

(declare-fun lt!123287 () (_ BitVec 64))

(declare-fun lt!123285 () (_ BitVec 64))

(assert (=> d!24362 (= lt!123289 (bvmul lt!123287 lt!123285))))

(assert (=> d!24362 (or (= lt!123287 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!123285 (bvsdiv (bvmul lt!123287 lt!123285) lt!123287)))))

(assert (=> d!24362 (= lt!123285 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24362 (= lt!123287 ((_ sign_extend 32) (size!1484 (buf!1871 thiss!1090))))))

(assert (=> d!24362 (= lt!123288 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3676 thiss!1090)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3671 thiss!1090))))))

(assert (=> d!24362 (invariant!0 (currentBit!3671 thiss!1090) (currentByte!3676 thiss!1090) (size!1484 (buf!1871 thiss!1090)))))

(assert (=> d!24362 (= (bitIndex!0 (size!1484 (buf!1871 thiss!1090)) (currentByte!3676 thiss!1090) (currentBit!3671 thiss!1090)) lt!123288)))

(declare-fun b!76926 () Bool)

(declare-fun res!63562 () Bool)

(assert (=> b!76926 (=> (not res!63562) (not e!50458))))

(assert (=> b!76926 (= res!63562 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!123288))))

(declare-fun b!76927 () Bool)

(declare-fun lt!123284 () (_ BitVec 64))

(assert (=> b!76927 (= e!50458 (bvsle lt!123288 (bvmul lt!123284 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!76927 (or (= lt!123284 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!123284 #b0000000000000000000000000000000000000000000000000000000000001000) lt!123284)))))

(assert (=> b!76927 (= lt!123284 ((_ sign_extend 32) (size!1484 (buf!1871 thiss!1090))))))

(assert (= (and d!24362 res!63561) b!76926))

(assert (= (and b!76926 res!63562) b!76927))

(assert (=> d!24362 m!122129))

(assert (=> d!24362 m!122075))

(assert (=> b!76760 d!24362))

(declare-fun d!24364 () Bool)

(assert (=> d!24364 (= (inv!12 thiss!1090) (invariant!0 (currentBit!3671 thiss!1090) (currentByte!3676 thiss!1090) (size!1484 (buf!1871 thiss!1090))))))

(declare-fun bs!5880 () Bool)

(assert (= bs!5880 d!24364))

(assert (=> bs!5880 m!122075))

(assert (=> start!14972 d!24364))

(push 1)

(assert (not b!76841))

(assert (not d!24326))

(assert (not b!76891))

(assert (not d!24310))

(assert (not d!24328))

(assert (not b!76838))

(assert (not b!76890))

(assert (not d!24358))

(assert (not b!76809))

(assert (not b!76807))

(assert (not d!24336))

(assert (not b!76892))

(assert (not d!24298))

(assert (not d!24362))

(assert (not b!76839))

(assert (not b!76893))

(assert (not d!24321))

(assert (not b!76840))

(assert (not d!24364))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

