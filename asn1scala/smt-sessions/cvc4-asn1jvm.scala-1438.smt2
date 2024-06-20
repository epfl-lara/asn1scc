; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39516 () Bool)

(assert start!39516)

(declare-fun b!177870 () Bool)

(declare-fun res!147477 () Bool)

(declare-fun e!123917 () Bool)

(assert (=> b!177870 (=> (not res!147477) (not e!123917))))

(declare-datatypes ((array!9594 0))(
  ( (array!9595 (arr!5160 (Array (_ BitVec 32) (_ BitVec 8))) (size!4230 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7568 0))(
  ( (BitStream!7569 (buf!4673 array!9594) (currentByte!8862 (_ BitVec 32)) (currentBit!8857 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7568)

(declare-datatypes ((Unit!12807 0))(
  ( (Unit!12808) )
))
(declare-datatypes ((tuple2!15334 0))(
  ( (tuple2!15335 (_1!8312 Unit!12807) (_2!8312 BitStream!7568)) )
))
(declare-fun lt!273252 () tuple2!15334)

(declare-fun isPrefixOf!0 (BitStream!7568 BitStream!7568) Bool)

(assert (=> b!177870 (= res!147477 (isPrefixOf!0 thiss!1204 (_2!8312 lt!273252)))))

(declare-fun b!177871 () Bool)

(declare-fun e!123915 () Bool)

(assert (=> b!177871 (= e!123917 e!123915)))

(declare-fun res!147472 () Bool)

(assert (=> b!177871 (=> (not res!147472) (not e!123915))))

(declare-fun lt!273254 () Bool)

(declare-datatypes ((tuple2!15336 0))(
  ( (tuple2!15337 (_1!8313 BitStream!7568) (_2!8313 Bool)) )
))
(declare-fun lt!273249 () tuple2!15336)

(assert (=> b!177871 (= res!147472 (and (= (_2!8313 lt!273249) lt!273254) (= (_1!8313 lt!273249) (_2!8312 lt!273252))))))

(declare-fun readBitPure!0 (BitStream!7568) tuple2!15336)

(declare-fun readerFrom!0 (BitStream!7568 (_ BitVec 32) (_ BitVec 32)) BitStream!7568)

(assert (=> b!177871 (= lt!273249 (readBitPure!0 (readerFrom!0 (_2!8312 lt!273252) (currentBit!8857 thiss!1204) (currentByte!8862 thiss!1204))))))

(declare-fun b!177872 () Bool)

(declare-fun e!123913 () Bool)

(declare-fun array_inv!3971 (array!9594) Bool)

(assert (=> b!177872 (= e!123913 (array_inv!3971 (buf!4673 thiss!1204)))))

(declare-fun b!177873 () Bool)

(declare-fun res!147474 () Bool)

(declare-fun e!123919 () Bool)

(assert (=> b!177873 (=> (not res!147474) (not e!123919))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!177873 (= res!147474 (invariant!0 (currentBit!8857 thiss!1204) (currentByte!8862 thiss!1204) (size!4230 (buf!4673 thiss!1204))))))

(declare-fun b!177874 () Bool)

(declare-fun res!147479 () Bool)

(assert (=> b!177874 (=> (not res!147479) (not e!123919))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!177874 (= res!147479 (not (= i!590 nBits!348)))))

(declare-fun b!177875 () Bool)

(declare-fun e!123916 () Bool)

(assert (=> b!177875 (= e!123916 e!123917)))

(declare-fun res!147480 () Bool)

(assert (=> b!177875 (=> (not res!147480) (not e!123917))))

(declare-fun lt!273251 () (_ BitVec 64))

(declare-fun lt!273253 () (_ BitVec 64))

(assert (=> b!177875 (= res!147480 (= lt!273251 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!273253)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!177875 (= lt!273251 (bitIndex!0 (size!4230 (buf!4673 (_2!8312 lt!273252))) (currentByte!8862 (_2!8312 lt!273252)) (currentBit!8857 (_2!8312 lt!273252))))))

(assert (=> b!177875 (= lt!273253 (bitIndex!0 (size!4230 (buf!4673 thiss!1204)) (currentByte!8862 thiss!1204) (currentBit!8857 thiss!1204)))))

(declare-fun b!177876 () Bool)

(assert (=> b!177876 (= e!123915 (= (bitIndex!0 (size!4230 (buf!4673 (_1!8313 lt!273249))) (currentByte!8862 (_1!8313 lt!273249)) (currentBit!8857 (_1!8313 lt!273249))) lt!273251))))

(declare-fun b!177877 () Bool)

(declare-fun e!123918 () Bool)

(assert (=> b!177877 (= e!123919 (not e!123918))))

(declare-fun res!147478 () Bool)

(assert (=> b!177877 (=> res!147478 e!123918)))

(assert (=> b!177877 (= res!147478 (not (= (bitIndex!0 (size!4230 (buf!4673 (_2!8312 lt!273252))) (currentByte!8862 (_2!8312 lt!273252)) (currentBit!8857 (_2!8312 lt!273252))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4230 (buf!4673 thiss!1204)) (currentByte!8862 thiss!1204) (currentBit!8857 thiss!1204))))))))

(assert (=> b!177877 e!123916))

(declare-fun res!147476 () Bool)

(assert (=> b!177877 (=> (not res!147476) (not e!123916))))

(assert (=> b!177877 (= res!147476 (= (size!4230 (buf!4673 thiss!1204)) (size!4230 (buf!4673 (_2!8312 lt!273252)))))))

(declare-fun appendBit!0 (BitStream!7568 Bool) tuple2!15334)

(assert (=> b!177877 (= lt!273252 (appendBit!0 thiss!1204 lt!273254))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!177877 (= lt!273254 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!147473 () Bool)

(assert (=> start!39516 (=> (not res!147473) (not e!123919))))

(assert (=> start!39516 (= res!147473 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39516 e!123919))

(assert (=> start!39516 true))

(declare-fun inv!12 (BitStream!7568) Bool)

(assert (=> start!39516 (and (inv!12 thiss!1204) e!123913)))

(declare-fun b!177878 () Bool)

(declare-fun res!147475 () Bool)

(assert (=> b!177878 (=> (not res!147475) (not e!123919))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!177878 (= res!147475 (validate_offset_bits!1 ((_ sign_extend 32) (size!4230 (buf!4673 thiss!1204))) ((_ sign_extend 32) (currentByte!8862 thiss!1204)) ((_ sign_extend 32) (currentBit!8857 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!177879 () Bool)

(assert (=> b!177879 (= e!123918 (invariant!0 (currentBit!8857 (_2!8312 lt!273252)) (currentByte!8862 (_2!8312 lt!273252)) (size!4230 (buf!4673 (_2!8312 lt!273252)))))))

(declare-fun lt!273250 () tuple2!15334)

(assert (=> b!177879 (isPrefixOf!0 thiss!1204 (_2!8312 lt!273250))))

(declare-fun lt!273248 () Unit!12807)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7568 BitStream!7568 BitStream!7568) Unit!12807)

(assert (=> b!177879 (= lt!273248 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8312 lt!273252) (_2!8312 lt!273250)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7568 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15334)

(assert (=> b!177879 (= lt!273250 (appendBitsLSBFirstLoopTR!0 (_2!8312 lt!273252) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(assert (= (and start!39516 res!147473) b!177878))

(assert (= (and b!177878 res!147475) b!177873))

(assert (= (and b!177873 res!147474) b!177874))

(assert (= (and b!177874 res!147479) b!177877))

(assert (= (and b!177877 res!147476) b!177875))

(assert (= (and b!177875 res!147480) b!177870))

(assert (= (and b!177870 res!147477) b!177871))

(assert (= (and b!177871 res!147472) b!177876))

(assert (= (and b!177877 (not res!147478)) b!177879))

(assert (= start!39516 b!177872))

(declare-fun m!277897 () Bool)

(assert (=> b!177878 m!277897))

(declare-fun m!277899 () Bool)

(assert (=> b!177870 m!277899))

(declare-fun m!277901 () Bool)

(assert (=> b!177873 m!277901))

(declare-fun m!277903 () Bool)

(assert (=> b!177876 m!277903))

(declare-fun m!277905 () Bool)

(assert (=> b!177872 m!277905))

(declare-fun m!277907 () Bool)

(assert (=> b!177875 m!277907))

(declare-fun m!277909 () Bool)

(assert (=> b!177875 m!277909))

(assert (=> b!177877 m!277907))

(assert (=> b!177877 m!277909))

(declare-fun m!277911 () Bool)

(assert (=> b!177877 m!277911))

(declare-fun m!277913 () Bool)

(assert (=> b!177879 m!277913))

(declare-fun m!277915 () Bool)

(assert (=> b!177879 m!277915))

(declare-fun m!277917 () Bool)

(assert (=> b!177879 m!277917))

(declare-fun m!277919 () Bool)

(assert (=> b!177879 m!277919))

(declare-fun m!277921 () Bool)

(assert (=> start!39516 m!277921))

(declare-fun m!277923 () Bool)

(assert (=> b!177871 m!277923))

(assert (=> b!177871 m!277923))

(declare-fun m!277925 () Bool)

(assert (=> b!177871 m!277925))

(push 1)

(assert (not start!39516))

(assert (not b!177872))

(assert (not b!177875))

(assert (not b!177877))

(assert (not b!177876))

(assert (not b!177878))

(assert (not b!177879))

(assert (not b!177873))

(assert (not b!177871))

(assert (not b!177870))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!62563 () Bool)

(declare-fun e!123937 () Bool)

(assert (=> d!62563 e!123937))

(declare-fun res!147508 () Bool)

(assert (=> d!62563 (=> (not res!147508) (not e!123937))))

(declare-fun lt!273278 () (_ BitVec 64))

(declare-fun lt!273281 () (_ BitVec 64))

(declare-fun lt!273280 () (_ BitVec 64))

(assert (=> d!62563 (= res!147508 (= lt!273281 (bvsub lt!273280 lt!273278)))))

(assert (=> d!62563 (or (= (bvand lt!273280 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!273278 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!273280 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!273280 lt!273278) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!62563 (= lt!273278 (remainingBits!0 ((_ sign_extend 32) (size!4230 (buf!4673 (_2!8312 lt!273252)))) ((_ sign_extend 32) (currentByte!8862 (_2!8312 lt!273252))) ((_ sign_extend 32) (currentBit!8857 (_2!8312 lt!273252)))))))

(declare-fun lt!273279 () (_ BitVec 64))

(declare-fun lt!273276 () (_ BitVec 64))

(assert (=> d!62563 (= lt!273280 (bvmul lt!273279 lt!273276))))

(assert (=> d!62563 (or (= lt!273279 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!273276 (bvsdiv (bvmul lt!273279 lt!273276) lt!273279)))))

(assert (=> d!62563 (= lt!273276 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62563 (= lt!273279 ((_ sign_extend 32) (size!4230 (buf!4673 (_2!8312 lt!273252)))))))

(assert (=> d!62563 (= lt!273281 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8862 (_2!8312 lt!273252))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8857 (_2!8312 lt!273252)))))))

(assert (=> d!62563 (invariant!0 (currentBit!8857 (_2!8312 lt!273252)) (currentByte!8862 (_2!8312 lt!273252)) (size!4230 (buf!4673 (_2!8312 lt!273252))))))

(assert (=> d!62563 (= (bitIndex!0 (size!4230 (buf!4673 (_2!8312 lt!273252))) (currentByte!8862 (_2!8312 lt!273252)) (currentBit!8857 (_2!8312 lt!273252))) lt!273281)))

(declare-fun b!177905 () Bool)

(declare-fun res!147507 () Bool)

(assert (=> b!177905 (=> (not res!147507) (not e!123937))))

(assert (=> b!177905 (= res!147507 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!273281))))

(declare-fun b!177906 () Bool)

(declare-fun lt!273277 () (_ BitVec 64))

(assert (=> b!177906 (= e!123937 (bvsle lt!273281 (bvmul lt!273277 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!177906 (or (= lt!273277 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!273277 #b0000000000000000000000000000000000000000000000000000000000001000) lt!273277)))))

(assert (=> b!177906 (= lt!273277 ((_ sign_extend 32) (size!4230 (buf!4673 (_2!8312 lt!273252)))))))

(assert (= (and d!62563 res!147508) b!177905))

(assert (= (and b!177905 res!147507) b!177906))

(declare-fun m!277945 () Bool)

(assert (=> d!62563 m!277945))

(assert (=> d!62563 m!277913))

(assert (=> b!177875 d!62563))

(declare-fun d!62565 () Bool)

(declare-fun e!123938 () Bool)

(assert (=> d!62565 e!123938))

(declare-fun res!147510 () Bool)

(assert (=> d!62565 (=> (not res!147510) (not e!123938))))

(declare-fun lt!273284 () (_ BitVec 64))

(declare-fun lt!273287 () (_ BitVec 64))

(declare-fun lt!273286 () (_ BitVec 64))

(assert (=> d!62565 (= res!147510 (= lt!273287 (bvsub lt!273286 lt!273284)))))

(assert (=> d!62565 (or (= (bvand lt!273286 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!273284 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!273286 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!273286 lt!273284) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62565 (= lt!273284 (remainingBits!0 ((_ sign_extend 32) (size!4230 (buf!4673 thiss!1204))) ((_ sign_extend 32) (currentByte!8862 thiss!1204)) ((_ sign_extend 32) (currentBit!8857 thiss!1204))))))

(declare-fun lt!273285 () (_ BitVec 64))

(declare-fun lt!273282 () (_ BitVec 64))

(assert (=> d!62565 (= lt!273286 (bvmul lt!273285 lt!273282))))

(assert (=> d!62565 (or (= lt!273285 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!273282 (bvsdiv (bvmul lt!273285 lt!273282) lt!273285)))))

(assert (=> d!62565 (= lt!273282 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62565 (= lt!273285 ((_ sign_extend 32) (size!4230 (buf!4673 thiss!1204))))))

(assert (=> d!62565 (= lt!273287 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8862 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8857 thiss!1204))))))

(assert (=> d!62565 (invariant!0 (currentBit!8857 thiss!1204) (currentByte!8862 thiss!1204) (size!4230 (buf!4673 thiss!1204)))))

(assert (=> d!62565 (= (bitIndex!0 (size!4230 (buf!4673 thiss!1204)) (currentByte!8862 thiss!1204) (currentBit!8857 thiss!1204)) lt!273287)))

(declare-fun b!177907 () Bool)

(declare-fun res!147509 () Bool)

(assert (=> b!177907 (=> (not res!147509) (not e!123938))))

(assert (=> b!177907 (= res!147509 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!273287))))

(declare-fun b!177908 () Bool)

(declare-fun lt!273283 () (_ BitVec 64))

(assert (=> b!177908 (= e!123938 (bvsle lt!273287 (bvmul lt!273283 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!177908 (or (= lt!273283 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!273283 #b0000000000000000000000000000000000000000000000000000000000001000) lt!273283)))))

(assert (=> b!177908 (= lt!273283 ((_ sign_extend 32) (size!4230 (buf!4673 thiss!1204))))))

(assert (= (and d!62565 res!147510) b!177907))

(assert (= (and b!177907 res!147509) b!177908))

(declare-fun m!277947 () Bool)

(assert (=> d!62565 m!277947))

(assert (=> d!62565 m!277901))

(assert (=> b!177875 d!62565))

(declare-fun d!62567 () Bool)

(declare-fun res!147517 () Bool)

(declare-fun e!123944 () Bool)

(assert (=> d!62567 (=> (not res!147517) (not e!123944))))

(assert (=> d!62567 (= res!147517 (= (size!4230 (buf!4673 thiss!1204)) (size!4230 (buf!4673 (_2!8312 lt!273252)))))))

(assert (=> d!62567 (= (isPrefixOf!0 thiss!1204 (_2!8312 lt!273252)) e!123944)))

(declare-fun b!177915 () Bool)

(declare-fun res!147519 () Bool)

(assert (=> b!177915 (=> (not res!147519) (not e!123944))))

(assert (=> b!177915 (= res!147519 (bvsle (bitIndex!0 (size!4230 (buf!4673 thiss!1204)) (currentByte!8862 thiss!1204) (currentBit!8857 thiss!1204)) (bitIndex!0 (size!4230 (buf!4673 (_2!8312 lt!273252))) (currentByte!8862 (_2!8312 lt!273252)) (currentBit!8857 (_2!8312 lt!273252)))))))

(declare-fun b!177916 () Bool)

(declare-fun e!123943 () Bool)

(assert (=> b!177916 (= e!123944 e!123943)))

(declare-fun res!147518 () Bool)

(assert (=> b!177916 (=> res!147518 e!123943)))

(assert (=> b!177916 (= res!147518 (= (size!4230 (buf!4673 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!177917 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9594 array!9594 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!177917 (= e!123943 (arrayBitRangesEq!0 (buf!4673 thiss!1204) (buf!4673 (_2!8312 lt!273252)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4230 (buf!4673 thiss!1204)) (currentByte!8862 thiss!1204) (currentBit!8857 thiss!1204))))))

(assert (= (and d!62567 res!147517) b!177915))

(assert (= (and b!177915 res!147519) b!177916))

(assert (= (and b!177916 (not res!147518)) b!177917))

(assert (=> b!177915 m!277909))

(assert (=> b!177915 m!277907))

(assert (=> b!177917 m!277909))

(assert (=> b!177917 m!277909))

(declare-fun m!277949 () Bool)

(assert (=> b!177917 m!277949))

(assert (=> b!177870 d!62567))

(declare-fun d!62569 () Bool)

(assert (=> d!62569 (= (inv!12 thiss!1204) (invariant!0 (currentBit!8857 thiss!1204) (currentByte!8862 thiss!1204) (size!4230 (buf!4673 thiss!1204))))))

(declare-fun bs!15597 () Bool)

(assert (= bs!15597 d!62569))

(assert (=> bs!15597 m!277901))

(assert (=> start!39516 d!62569))

(declare-fun d!62571 () Bool)

(declare-fun e!123945 () Bool)

(assert (=> d!62571 e!123945))

(declare-fun res!147521 () Bool)

(assert (=> d!62571 (=> (not res!147521) (not e!123945))))

(declare-fun lt!273293 () (_ BitVec 64))

(declare-fun lt!273292 () (_ BitVec 64))

(declare-fun lt!273290 () (_ BitVec 64))

(assert (=> d!62571 (= res!147521 (= lt!273293 (bvsub lt!273292 lt!273290)))))

(assert (=> d!62571 (or (= (bvand lt!273292 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!273290 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!273292 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!273292 lt!273290) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62571 (= lt!273290 (remainingBits!0 ((_ sign_extend 32) (size!4230 (buf!4673 (_1!8313 lt!273249)))) ((_ sign_extend 32) (currentByte!8862 (_1!8313 lt!273249))) ((_ sign_extend 32) (currentBit!8857 (_1!8313 lt!273249)))))))

(declare-fun lt!273291 () (_ BitVec 64))

(declare-fun lt!273288 () (_ BitVec 64))

(assert (=> d!62571 (= lt!273292 (bvmul lt!273291 lt!273288))))

(assert (=> d!62571 (or (= lt!273291 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!273288 (bvsdiv (bvmul lt!273291 lt!273288) lt!273291)))))

(assert (=> d!62571 (= lt!273288 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62571 (= lt!273291 ((_ sign_extend 32) (size!4230 (buf!4673 (_1!8313 lt!273249)))))))

(assert (=> d!62571 (= lt!273293 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8862 (_1!8313 lt!273249))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8857 (_1!8313 lt!273249)))))))

(assert (=> d!62571 (invariant!0 (currentBit!8857 (_1!8313 lt!273249)) (currentByte!8862 (_1!8313 lt!273249)) (size!4230 (buf!4673 (_1!8313 lt!273249))))))

(assert (=> d!62571 (= (bitIndex!0 (size!4230 (buf!4673 (_1!8313 lt!273249))) (currentByte!8862 (_1!8313 lt!273249)) (currentBit!8857 (_1!8313 lt!273249))) lt!273293)))

(declare-fun b!177918 () Bool)

(declare-fun res!147520 () Bool)

(assert (=> b!177918 (=> (not res!147520) (not e!123945))))

(assert (=> b!177918 (= res!147520 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!273293))))

(declare-fun b!177919 () Bool)

(declare-fun lt!273289 () (_ BitVec 64))

(assert (=> b!177919 (= e!123945 (bvsle lt!273293 (bvmul lt!273289 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!177919 (or (= lt!273289 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!273289 #b0000000000000000000000000000000000000000000000000000000000001000) lt!273289)))))

(assert (=> b!177919 (= lt!273289 ((_ sign_extend 32) (size!4230 (buf!4673 (_1!8313 lt!273249)))))))

(assert (= (and d!62571 res!147521) b!177918))

(assert (= (and b!177918 res!147520) b!177919))

(declare-fun m!277951 () Bool)

(assert (=> d!62571 m!277951))

(declare-fun m!277953 () Bool)

(assert (=> d!62571 m!277953))

(assert (=> b!177876 d!62571))

(declare-fun d!62573 () Bool)

(declare-datatypes ((tuple2!15344 0))(
  ( (tuple2!15345 (_1!8317 Bool) (_2!8317 BitStream!7568)) )
))
(declare-fun lt!273296 () tuple2!15344)

(declare-fun readBit!0 (BitStream!7568) tuple2!15344)

(assert (=> d!62573 (= lt!273296 (readBit!0 (readerFrom!0 (_2!8312 lt!273252) (currentBit!8857 thiss!1204) (currentByte!8862 thiss!1204))))))

(assert (=> d!62573 (= (readBitPure!0 (readerFrom!0 (_2!8312 lt!273252) (currentBit!8857 thiss!1204) (currentByte!8862 thiss!1204))) (tuple2!15337 (_2!8317 lt!273296) (_1!8317 lt!273296)))))

(declare-fun bs!15598 () Bool)

(assert (= bs!15598 d!62573))

(assert (=> bs!15598 m!277923))

(declare-fun m!277955 () Bool)

(assert (=> bs!15598 m!277955))

(assert (=> b!177871 d!62573))

(declare-fun d!62575 () Bool)

(declare-fun e!123948 () Bool)

(assert (=> d!62575 e!123948))

(declare-fun res!147525 () Bool)

(assert (=> d!62575 (=> (not res!147525) (not e!123948))))

(assert (=> d!62575 (= res!147525 (invariant!0 (currentBit!8857 (_2!8312 lt!273252)) (currentByte!8862 (_2!8312 lt!273252)) (size!4230 (buf!4673 (_2!8312 lt!273252)))))))

(assert (=> d!62575 (= (readerFrom!0 (_2!8312 lt!273252) (currentBit!8857 thiss!1204) (currentByte!8862 thiss!1204)) (BitStream!7569 (buf!4673 (_2!8312 lt!273252)) (currentByte!8862 thiss!1204) (currentBit!8857 thiss!1204)))))

(declare-fun b!177922 () Bool)

(assert (=> b!177922 (= e!123948 (invariant!0 (currentBit!8857 thiss!1204) (currentByte!8862 thiss!1204) (size!4230 (buf!4673 (_2!8312 lt!273252)))))))

(assert (= (and d!62575 res!147525) b!177922))

(assert (=> d!62575 m!277913))

(declare-fun m!277957 () Bool)

(assert (=> b!177922 m!277957))

(assert (=> b!177871 d!62575))

(assert (=> b!177877 d!62563))

(assert (=> b!177877 d!62565))

(declare-fun b!177933 () Bool)

(declare-fun res!147535 () Bool)

(declare-fun e!123953 () Bool)

(assert (=> b!177933 (=> (not res!147535) (not e!123953))))

(declare-fun lt!273308 () tuple2!15334)

(assert (=> b!177933 (= res!147535 (isPrefixOf!0 thiss!1204 (_2!8312 lt!273308)))))

(declare-fun b!177934 () Bool)

(declare-fun e!123954 () Bool)

(assert (=> b!177934 (= e!123953 e!123954)))

(declare-fun res!147537 () Bool)

(assert (=> b!177934 (=> (not res!147537) (not e!123954))))

(declare-fun lt!273307 () tuple2!15336)

(assert (=> b!177934 (= res!147537 (and (= (_2!8313 lt!273307) lt!273254) (= (_1!8313 lt!273307) (_2!8312 lt!273308))))))

(assert (=> b!177934 (= lt!273307 (readBitPure!0 (readerFrom!0 (_2!8312 lt!273308) (currentBit!8857 thiss!1204) (currentByte!8862 thiss!1204))))))

(declare-fun b!177935 () Bool)

(assert (=> b!177935 (= e!123954 (= (bitIndex!0 (size!4230 (buf!4673 (_1!8313 lt!273307))) (currentByte!8862 (_1!8313 lt!273307)) (currentBit!8857 (_1!8313 lt!273307))) (bitIndex!0 (size!4230 (buf!4673 (_2!8312 lt!273308))) (currentByte!8862 (_2!8312 lt!273308)) (currentBit!8857 (_2!8312 lt!273308)))))))

(declare-fun d!62577 () Bool)

(assert (=> d!62577 e!123953))

(declare-fun res!147534 () Bool)

(assert (=> d!62577 (=> (not res!147534) (not e!123953))))

(assert (=> d!62577 (= res!147534 (= (size!4230 (buf!4673 thiss!1204)) (size!4230 (buf!4673 (_2!8312 lt!273308)))))))

(declare-fun choose!16 (BitStream!7568 Bool) tuple2!15334)

(assert (=> d!62577 (= lt!273308 (choose!16 thiss!1204 lt!273254))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!62577 (validate_offset_bit!0 ((_ sign_extend 32) (size!4230 (buf!4673 thiss!1204))) ((_ sign_extend 32) (currentByte!8862 thiss!1204)) ((_ sign_extend 32) (currentBit!8857 thiss!1204)))))

(assert (=> d!62577 (= (appendBit!0 thiss!1204 lt!273254) lt!273308)))

(declare-fun b!177932 () Bool)

(declare-fun res!147536 () Bool)

(assert (=> b!177932 (=> (not res!147536) (not e!123953))))

(declare-fun lt!273305 () (_ BitVec 64))

(declare-fun lt!273306 () (_ BitVec 64))

(assert (=> b!177932 (= res!147536 (= (bitIndex!0 (size!4230 (buf!4673 (_2!8312 lt!273308))) (currentByte!8862 (_2!8312 lt!273308)) (currentBit!8857 (_2!8312 lt!273308))) (bvadd lt!273305 lt!273306)))))

(assert (=> b!177932 (or (not (= (bvand lt!273305 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!273306 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!273305 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!273305 lt!273306) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!177932 (= lt!273306 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!177932 (= lt!273305 (bitIndex!0 (size!4230 (buf!4673 thiss!1204)) (currentByte!8862 thiss!1204) (currentBit!8857 thiss!1204)))))

(assert (= (and d!62577 res!147534) b!177932))

(assert (= (and b!177932 res!147536) b!177933))

(assert (= (and b!177933 res!147535) b!177934))

(assert (= (and b!177934 res!147537) b!177935))

(declare-fun m!277959 () Bool)

(assert (=> b!177932 m!277959))

(assert (=> b!177932 m!277909))

(declare-fun m!277961 () Bool)

(assert (=> b!177934 m!277961))

(assert (=> b!177934 m!277961))

(declare-fun m!277963 () Bool)

(assert (=> b!177934 m!277963))

(declare-fun m!277965 () Bool)

(assert (=> b!177935 m!277965))

(assert (=> b!177935 m!277959))

(declare-fun m!277967 () Bool)

(assert (=> b!177933 m!277967))

(declare-fun m!277969 () Bool)

(assert (=> d!62577 m!277969))

(declare-fun m!277971 () Bool)

(assert (=> d!62577 m!277971))

(assert (=> b!177877 d!62577))

(declare-fun d!62579 () Bool)

(assert (=> d!62579 (= (array_inv!3971 (buf!4673 thiss!1204)) (bvsge (size!4230 (buf!4673 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!177872 d!62579))

(declare-fun d!62581 () Bool)

(assert (=> d!62581 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4230 (buf!4673 thiss!1204))) ((_ sign_extend 32) (currentByte!8862 thiss!1204)) ((_ sign_extend 32) (currentBit!8857 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4230 (buf!4673 thiss!1204))) ((_ sign_extend 32) (currentByte!8862 thiss!1204)) ((_ sign_extend 32) (currentBit!8857 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!15599 () Bool)

(assert (= bs!15599 d!62581))

(assert (=> bs!15599 m!277947))

(assert (=> b!177878 d!62581))

(declare-fun d!62583 () Bool)

(assert (=> d!62583 (= (invariant!0 (currentBit!8857 thiss!1204) (currentByte!8862 thiss!1204) (size!4230 (buf!4673 thiss!1204))) (and (bvsge (currentBit!8857 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8857 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8862 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8862 thiss!1204) (size!4230 (buf!4673 thiss!1204))) (and (= (currentBit!8857 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8862 thiss!1204) (size!4230 (buf!4673 thiss!1204)))))))))

(assert (=> b!177873 d!62583))

(declare-fun d!62585 () Bool)

(assert (=> d!62585 (= (invariant!0 (currentBit!8857 (_2!8312 lt!273252)) (currentByte!8862 (_2!8312 lt!273252)) (size!4230 (buf!4673 (_2!8312 lt!273252)))) (and (bvsge (currentBit!8857 (_2!8312 lt!273252)) #b00000000000000000000000000000000) (bvslt (currentBit!8857 (_2!8312 lt!273252)) #b00000000000000000000000000001000) (bvsge (currentByte!8862 (_2!8312 lt!273252)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8862 (_2!8312 lt!273252)) (size!4230 (buf!4673 (_2!8312 lt!273252)))) (and (= (currentBit!8857 (_2!8312 lt!273252)) #b00000000000000000000000000000000) (= (currentByte!8862 (_2!8312 lt!273252)) (size!4230 (buf!4673 (_2!8312 lt!273252))))))))))

(assert (=> b!177879 d!62585))

(declare-fun d!62587 () Bool)

(declare-fun res!147538 () Bool)

(declare-fun e!123956 () Bool)

(assert (=> d!62587 (=> (not res!147538) (not e!123956))))

(assert (=> d!62587 (= res!147538 (= (size!4230 (buf!4673 thiss!1204)) (size!4230 (buf!4673 (_2!8312 lt!273250)))))))

(assert (=> d!62587 (= (isPrefixOf!0 thiss!1204 (_2!8312 lt!273250)) e!123956)))

(declare-fun b!177936 () Bool)

(declare-fun res!147540 () Bool)

(assert (=> b!177936 (=> (not res!147540) (not e!123956))))

(assert (=> b!177936 (= res!147540 (bvsle (bitIndex!0 (size!4230 (buf!4673 thiss!1204)) (currentByte!8862 thiss!1204) (currentBit!8857 thiss!1204)) (bitIndex!0 (size!4230 (buf!4673 (_2!8312 lt!273250))) (currentByte!8862 (_2!8312 lt!273250)) (currentBit!8857 (_2!8312 lt!273250)))))))

(declare-fun b!177937 () Bool)

(declare-fun e!123955 () Bool)

(assert (=> b!177937 (= e!123956 e!123955)))

(declare-fun res!147539 () Bool)

(assert (=> b!177937 (=> res!147539 e!123955)))

(assert (=> b!177937 (= res!147539 (= (size!4230 (buf!4673 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!177938 () Bool)

(assert (=> b!177938 (= e!123955 (arrayBitRangesEq!0 (buf!4673 thiss!1204) (buf!4673 (_2!8312 lt!273250)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4230 (buf!4673 thiss!1204)) (currentByte!8862 thiss!1204) (currentBit!8857 thiss!1204))))))

(assert (= (and d!62587 res!147538) b!177936))

(assert (= (and b!177936 res!147540) b!177937))

(assert (= (and b!177937 (not res!147539)) b!177938))

(assert (=> b!177936 m!277909))

(declare-fun m!277973 () Bool)

(assert (=> b!177936 m!277973))

(assert (=> b!177938 m!277909))

(assert (=> b!177938 m!277909))

(declare-fun m!277975 () Bool)

(assert (=> b!177938 m!277975))

(assert (=> b!177879 d!62587))

(declare-fun d!62589 () Bool)

(assert (=> d!62589 (isPrefixOf!0 thiss!1204 (_2!8312 lt!273250))))

(declare-fun lt!273311 () Unit!12807)

(declare-fun choose!30 (BitStream!7568 BitStream!7568 BitStream!7568) Unit!12807)

(assert (=> d!62589 (= lt!273311 (choose!30 thiss!1204 (_2!8312 lt!273252) (_2!8312 lt!273250)))))

(assert (=> d!62589 (isPrefixOf!0 thiss!1204 (_2!8312 lt!273252))))

(assert (=> d!62589 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8312 lt!273252) (_2!8312 lt!273250)) lt!273311)))

(declare-fun bs!15600 () Bool)

(assert (= bs!15600 d!62589))

(assert (=> bs!15600 m!277915))

(declare-fun m!277977 () Bool)

(assert (=> bs!15600 m!277977))

(assert (=> bs!15600 m!277899))

(assert (=> b!177879 d!62589))

(declare-fun b!178080 () Bool)

(declare-fun e!124036 () Bool)

(declare-datatypes ((tuple2!15352 0))(
  ( (tuple2!15353 (_1!8321 BitStream!7568) (_2!8321 (_ BitVec 64))) )
))
(declare-fun lt!273799 () tuple2!15352)

(declare-datatypes ((tuple2!15354 0))(
  ( (tuple2!15355 (_1!8322 BitStream!7568) (_2!8322 BitStream!7568)) )
))
(declare-fun lt!273789 () tuple2!15354)

(assert (=> b!178080 (= e!124036 (= (_1!8321 lt!273799) (_2!8322 lt!273789)))))

(declare-fun call!2926 () Bool)

(declare-fun bm!2923 () Bool)

(declare-fun c!9274 () Bool)

(declare-fun lt!273773 () tuple2!15334)

(assert (=> bm!2923 (= call!2926 (isPrefixOf!0 (_2!8312 lt!273252) (ite c!9274 (_2!8312 lt!273252) (_2!8312 lt!273773))))))

(declare-fun b!178081 () Bool)

(declare-fun e!124038 () tuple2!15334)

(declare-fun lt!273756 () tuple2!15334)

(assert (=> b!178081 (= e!124038 (tuple2!15335 (_1!8312 lt!273756) (_2!8312 lt!273756)))))

(declare-fun lt!273769 () Bool)

(assert (=> b!178081 (= lt!273769 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!178081 (= lt!273773 (appendBit!0 (_2!8312 lt!273252) lt!273769))))

(declare-fun res!147656 () Bool)

(assert (=> b!178081 (= res!147656 (= (size!4230 (buf!4673 (_2!8312 lt!273252))) (size!4230 (buf!4673 (_2!8312 lt!273773)))))))

(declare-fun e!124039 () Bool)

(assert (=> b!178081 (=> (not res!147656) (not e!124039))))

(assert (=> b!178081 e!124039))

(declare-fun lt!273750 () tuple2!15334)

(assert (=> b!178081 (= lt!273750 lt!273773)))

(assert (=> b!178081 (= lt!273756 (appendBitsLSBFirstLoopTR!0 (_2!8312 lt!273750) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!273786 () Unit!12807)

(assert (=> b!178081 (= lt!273786 (lemmaIsPrefixTransitive!0 (_2!8312 lt!273252) (_2!8312 lt!273750) (_2!8312 lt!273756)))))

(assert (=> b!178081 (isPrefixOf!0 (_2!8312 lt!273252) (_2!8312 lt!273756))))

(declare-fun lt!273804 () Unit!12807)

(assert (=> b!178081 (= lt!273804 lt!273786)))

(assert (=> b!178081 (invariant!0 (currentBit!8857 (_2!8312 lt!273252)) (currentByte!8862 (_2!8312 lt!273252)) (size!4230 (buf!4673 (_2!8312 lt!273750))))))

(declare-fun lt!273788 () BitStream!7568)

(assert (=> b!178081 (= lt!273788 (BitStream!7569 (buf!4673 (_2!8312 lt!273750)) (currentByte!8862 (_2!8312 lt!273252)) (currentBit!8857 (_2!8312 lt!273252))))))

(assert (=> b!178081 (invariant!0 (currentBit!8857 lt!273788) (currentByte!8862 lt!273788) (size!4230 (buf!4673 (_2!8312 lt!273756))))))

(declare-fun lt!273770 () BitStream!7568)

(assert (=> b!178081 (= lt!273770 (BitStream!7569 (buf!4673 (_2!8312 lt!273756)) (currentByte!8862 lt!273788) (currentBit!8857 lt!273788)))))

(declare-fun lt!273757 () tuple2!15336)

(assert (=> b!178081 (= lt!273757 (readBitPure!0 lt!273788))))

(declare-fun lt!273802 () tuple2!15336)

(assert (=> b!178081 (= lt!273802 (readBitPure!0 lt!273770))))

(declare-fun lt!273798 () Unit!12807)

(declare-fun readBitPrefixLemma!0 (BitStream!7568 BitStream!7568) Unit!12807)

(assert (=> b!178081 (= lt!273798 (readBitPrefixLemma!0 lt!273788 (_2!8312 lt!273756)))))

(declare-fun res!147657 () Bool)

(assert (=> b!178081 (= res!147657 (= (bitIndex!0 (size!4230 (buf!4673 (_1!8313 lt!273757))) (currentByte!8862 (_1!8313 lt!273757)) (currentBit!8857 (_1!8313 lt!273757))) (bitIndex!0 (size!4230 (buf!4673 (_1!8313 lt!273802))) (currentByte!8862 (_1!8313 lt!273802)) (currentBit!8857 (_1!8313 lt!273802)))))))

(declare-fun e!124043 () Bool)

(assert (=> b!178081 (=> (not res!147657) (not e!124043))))

(assert (=> b!178081 e!124043))

(declare-fun lt!273781 () Unit!12807)

(assert (=> b!178081 (= lt!273781 lt!273798)))

(declare-fun lt!273774 () tuple2!15354)

(declare-fun reader!0 (BitStream!7568 BitStream!7568) tuple2!15354)

(assert (=> b!178081 (= lt!273774 (reader!0 (_2!8312 lt!273252) (_2!8312 lt!273756)))))

(declare-fun lt!273761 () tuple2!15354)

(assert (=> b!178081 (= lt!273761 (reader!0 (_2!8312 lt!273750) (_2!8312 lt!273756)))))

(declare-fun lt!273797 () tuple2!15336)

(assert (=> b!178081 (= lt!273797 (readBitPure!0 (_1!8322 lt!273774)))))

(assert (=> b!178081 (= (_2!8313 lt!273797) lt!273769)))

(declare-fun lt!273767 () Unit!12807)

(declare-fun Unit!12821 () Unit!12807)

(assert (=> b!178081 (= lt!273767 Unit!12821)))

(declare-fun lt!273783 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!178081 (= lt!273783 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!273777 () (_ BitVec 64))

(assert (=> b!178081 (= lt!273777 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!273763 () Unit!12807)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7568 array!9594 (_ BitVec 64)) Unit!12807)

(assert (=> b!178081 (= lt!273763 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8312 lt!273252) (buf!4673 (_2!8312 lt!273756)) lt!273777))))

(assert (=> b!178081 (validate_offset_bits!1 ((_ sign_extend 32) (size!4230 (buf!4673 (_2!8312 lt!273756)))) ((_ sign_extend 32) (currentByte!8862 (_2!8312 lt!273252))) ((_ sign_extend 32) (currentBit!8857 (_2!8312 lt!273252))) lt!273777)))

(declare-fun lt!273766 () Unit!12807)

(assert (=> b!178081 (= lt!273766 lt!273763)))

(declare-fun lt!273794 () tuple2!15352)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7568 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15352)

(assert (=> b!178081 (= lt!273794 (readNBitsLSBFirstsLoopPure!0 (_1!8322 lt!273774) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!273783))))

(declare-fun lt!273772 () (_ BitVec 64))

(assert (=> b!178081 (= lt!273772 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!273759 () Unit!12807)

(assert (=> b!178081 (= lt!273759 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8312 lt!273750) (buf!4673 (_2!8312 lt!273756)) lt!273772))))

(assert (=> b!178081 (validate_offset_bits!1 ((_ sign_extend 32) (size!4230 (buf!4673 (_2!8312 lt!273756)))) ((_ sign_extend 32) (currentByte!8862 (_2!8312 lt!273750))) ((_ sign_extend 32) (currentBit!8857 (_2!8312 lt!273750))) lt!273772)))

(declare-fun lt!273771 () Unit!12807)

(assert (=> b!178081 (= lt!273771 lt!273759)))

(declare-fun lt!273795 () tuple2!15352)

(assert (=> b!178081 (= lt!273795 (readNBitsLSBFirstsLoopPure!0 (_1!8322 lt!273761) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!273783 (ite (_2!8313 lt!273797) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!273764 () tuple2!15352)

(assert (=> b!178081 (= lt!273764 (readNBitsLSBFirstsLoopPure!0 (_1!8322 lt!273774) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!273783))))

(declare-fun c!9273 () Bool)

(assert (=> b!178081 (= c!9273 (_2!8313 (readBitPure!0 (_1!8322 lt!273774))))))

(declare-fun e!124042 () (_ BitVec 64))

(declare-fun lt!273775 () tuple2!15352)

(declare-fun withMovedBitIndex!0 (BitStream!7568 (_ BitVec 64)) BitStream!7568)

(assert (=> b!178081 (= lt!273775 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8322 lt!273774) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!273783 e!124042)))))

(declare-fun lt!273782 () Unit!12807)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7568 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!12807)

(assert (=> b!178081 (= lt!273782 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8322 lt!273774) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!273783))))

(assert (=> b!178081 (and (= (_2!8321 lt!273764) (_2!8321 lt!273775)) (= (_1!8321 lt!273764) (_1!8321 lt!273775)))))

(declare-fun lt!273753 () Unit!12807)

(assert (=> b!178081 (= lt!273753 lt!273782)))

(assert (=> b!178081 (= (_1!8322 lt!273774) (withMovedBitIndex!0 (_2!8322 lt!273774) (bvsub (bitIndex!0 (size!4230 (buf!4673 (_2!8312 lt!273252))) (currentByte!8862 (_2!8312 lt!273252)) (currentBit!8857 (_2!8312 lt!273252))) (bitIndex!0 (size!4230 (buf!4673 (_2!8312 lt!273756))) (currentByte!8862 (_2!8312 lt!273756)) (currentBit!8857 (_2!8312 lt!273756))))))))

(declare-fun lt!273768 () Unit!12807)

(declare-fun Unit!12829 () Unit!12807)

(assert (=> b!178081 (= lt!273768 Unit!12829)))

(assert (=> b!178081 (= (_1!8322 lt!273761) (withMovedBitIndex!0 (_2!8322 lt!273761) (bvsub (bitIndex!0 (size!4230 (buf!4673 (_2!8312 lt!273750))) (currentByte!8862 (_2!8312 lt!273750)) (currentBit!8857 (_2!8312 lt!273750))) (bitIndex!0 (size!4230 (buf!4673 (_2!8312 lt!273756))) (currentByte!8862 (_2!8312 lt!273756)) (currentBit!8857 (_2!8312 lt!273756))))))))

(declare-fun lt!273800 () Unit!12807)

(declare-fun Unit!12831 () Unit!12807)

(assert (=> b!178081 (= lt!273800 Unit!12831)))

(assert (=> b!178081 (= (bitIndex!0 (size!4230 (buf!4673 (_2!8312 lt!273252))) (currentByte!8862 (_2!8312 lt!273252)) (currentBit!8857 (_2!8312 lt!273252))) (bvsub (bitIndex!0 (size!4230 (buf!4673 (_2!8312 lt!273750))) (currentByte!8862 (_2!8312 lt!273750)) (currentBit!8857 (_2!8312 lt!273750))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!273778 () Unit!12807)

(declare-fun Unit!12832 () Unit!12807)

(assert (=> b!178081 (= lt!273778 Unit!12832)))

(assert (=> b!178081 (= (_2!8321 lt!273794) (_2!8321 lt!273795))))

(declare-fun lt!273760 () Unit!12807)

(declare-fun Unit!12834 () Unit!12807)

(assert (=> b!178081 (= lt!273760 Unit!12834)))

(assert (=> b!178081 (invariant!0 (currentBit!8857 (_2!8312 lt!273756)) (currentByte!8862 (_2!8312 lt!273756)) (size!4230 (buf!4673 (_2!8312 lt!273756))))))

(declare-fun lt!273787 () Unit!12807)

(declare-fun Unit!12835 () Unit!12807)

(assert (=> b!178081 (= lt!273787 Unit!12835)))

(assert (=> b!178081 (= (size!4230 (buf!4673 (_2!8312 lt!273252))) (size!4230 (buf!4673 (_2!8312 lt!273756))))))

(declare-fun lt!273779 () Unit!12807)

(declare-fun Unit!12837 () Unit!12807)

(assert (=> b!178081 (= lt!273779 Unit!12837)))

(assert (=> b!178081 (= (bitIndex!0 (size!4230 (buf!4673 (_2!8312 lt!273756))) (currentByte!8862 (_2!8312 lt!273756)) (currentBit!8857 (_2!8312 lt!273756))) (bvsub (bvadd (bitIndex!0 (size!4230 (buf!4673 (_2!8312 lt!273252))) (currentByte!8862 (_2!8312 lt!273252)) (currentBit!8857 (_2!8312 lt!273252))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!273780 () Unit!12807)

(declare-fun Unit!12838 () Unit!12807)

(assert (=> b!178081 (= lt!273780 Unit!12838)))

(declare-fun lt!273751 () Unit!12807)

(declare-fun Unit!12839 () Unit!12807)

(assert (=> b!178081 (= lt!273751 Unit!12839)))

(assert (=> b!178081 (= lt!273789 (reader!0 (_2!8312 lt!273252) (_2!8312 lt!273756)))))

(declare-fun lt!273784 () (_ BitVec 64))

(assert (=> b!178081 (= lt!273784 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!273801 () Unit!12807)

(assert (=> b!178081 (= lt!273801 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8312 lt!273252) (buf!4673 (_2!8312 lt!273756)) lt!273784))))

(assert (=> b!178081 (validate_offset_bits!1 ((_ sign_extend 32) (size!4230 (buf!4673 (_2!8312 lt!273756)))) ((_ sign_extend 32) (currentByte!8862 (_2!8312 lt!273252))) ((_ sign_extend 32) (currentBit!8857 (_2!8312 lt!273252))) lt!273784)))

(declare-fun lt!273793 () Unit!12807)

(assert (=> b!178081 (= lt!273793 lt!273801)))

(assert (=> b!178081 (= lt!273799 (readNBitsLSBFirstsLoopPure!0 (_1!8322 lt!273789) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!147663 () Bool)

(assert (=> b!178081 (= res!147663 (= (_2!8321 lt!273799) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!178081 (=> (not res!147663) (not e!124036))))

(assert (=> b!178081 e!124036))

(declare-fun lt!273762 () Unit!12807)

(declare-fun Unit!12840 () Unit!12807)

(assert (=> b!178081 (= lt!273762 Unit!12840)))

(declare-fun b!178082 () Bool)

(declare-fun res!147665 () Bool)

(assert (=> b!178082 (= res!147665 call!2926)))

(assert (=> b!178082 (=> (not res!147665) (not e!124039))))

(declare-fun b!178084 () Bool)

(declare-fun Unit!12841 () Unit!12807)

(assert (=> b!178084 (= e!124038 (tuple2!15335 Unit!12841 (_2!8312 lt!273252)))))

(declare-fun lt!273796 () Unit!12807)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7568) Unit!12807)

(assert (=> b!178084 (= lt!273796 (lemmaIsPrefixRefl!0 (_2!8312 lt!273252)))))

(assert (=> b!178084 call!2926))

(declare-fun lt!273792 () Unit!12807)

(assert (=> b!178084 (= lt!273792 lt!273796)))

(declare-fun b!178085 () Bool)

(declare-fun res!147655 () Bool)

(declare-fun e!124037 () Bool)

(assert (=> b!178085 (=> (not res!147655) (not e!124037))))

(declare-fun lt!273785 () tuple2!15334)

(assert (=> b!178085 (= res!147655 (isPrefixOf!0 (_2!8312 lt!273252) (_2!8312 lt!273785)))))

(declare-fun b!178086 () Bool)

(assert (=> b!178086 (= e!124042 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!178087 () Bool)

(assert (=> b!178087 (= e!124043 (= (_2!8313 lt!273757) (_2!8313 lt!273802)))))

(declare-fun b!178088 () Bool)

(declare-fun e!124040 () Bool)

(assert (=> b!178088 (= e!124037 e!124040)))

(declare-fun res!147658 () Bool)

(assert (=> b!178088 (=> (not res!147658) (not e!124040))))

(declare-fun lt!273776 () tuple2!15352)

(assert (=> b!178088 (= res!147658 (= (_2!8321 lt!273776) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!273791 () tuple2!15354)

(assert (=> b!178088 (= lt!273776 (readNBitsLSBFirstsLoopPure!0 (_1!8322 lt!273791) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!273755 () Unit!12807)

(declare-fun lt!273749 () Unit!12807)

(assert (=> b!178088 (= lt!273755 lt!273749)))

(declare-fun lt!273752 () (_ BitVec 64))

(assert (=> b!178088 (validate_offset_bits!1 ((_ sign_extend 32) (size!4230 (buf!4673 (_2!8312 lt!273785)))) ((_ sign_extend 32) (currentByte!8862 (_2!8312 lt!273252))) ((_ sign_extend 32) (currentBit!8857 (_2!8312 lt!273252))) lt!273752)))

(assert (=> b!178088 (= lt!273749 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8312 lt!273252) (buf!4673 (_2!8312 lt!273785)) lt!273752))))

(declare-fun e!124044 () Bool)

(assert (=> b!178088 e!124044))

(declare-fun res!147664 () Bool)

(assert (=> b!178088 (=> (not res!147664) (not e!124044))))

(assert (=> b!178088 (= res!147664 (and (= (size!4230 (buf!4673 (_2!8312 lt!273252))) (size!4230 (buf!4673 (_2!8312 lt!273785)))) (bvsge lt!273752 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!178088 (= lt!273752 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!178088 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!178088 (= lt!273791 (reader!0 (_2!8312 lt!273252) (_2!8312 lt!273785)))))

(declare-fun b!178089 () Bool)

(declare-fun lt!273765 () tuple2!15336)

(assert (=> b!178089 (= lt!273765 (readBitPure!0 (readerFrom!0 (_2!8312 lt!273773) (currentBit!8857 (_2!8312 lt!273252)) (currentByte!8862 (_2!8312 lt!273252)))))))

(declare-fun res!147662 () Bool)

(assert (=> b!178089 (= res!147662 (and (= (_2!8313 lt!273765) lt!273769) (= (_1!8313 lt!273765) (_2!8312 lt!273773))))))

(declare-fun e!124041 () Bool)

(assert (=> b!178089 (=> (not res!147662) (not e!124041))))

(assert (=> b!178089 (= e!124039 e!124041)))

(declare-fun b!178090 () Bool)

(declare-fun res!147654 () Bool)

(assert (=> b!178090 (=> (not res!147654) (not e!124037))))

(assert (=> b!178090 (= res!147654 (= (size!4230 (buf!4673 (_2!8312 lt!273252))) (size!4230 (buf!4673 (_2!8312 lt!273785)))))))

(declare-fun b!178091 () Bool)

(declare-fun res!147659 () Bool)

(assert (=> b!178091 (= res!147659 (= (bitIndex!0 (size!4230 (buf!4673 (_2!8312 lt!273773))) (currentByte!8862 (_2!8312 lt!273773)) (currentBit!8857 (_2!8312 lt!273773))) (bvadd (bitIndex!0 (size!4230 (buf!4673 (_2!8312 lt!273252))) (currentByte!8862 (_2!8312 lt!273252)) (currentBit!8857 (_2!8312 lt!273252))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!178091 (=> (not res!147659) (not e!124039))))

(declare-fun b!178092 () Bool)

(assert (=> b!178092 (= e!124042 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!178093 () Bool)

(assert (=> b!178093 (= e!124044 (validate_offset_bits!1 ((_ sign_extend 32) (size!4230 (buf!4673 (_2!8312 lt!273252)))) ((_ sign_extend 32) (currentByte!8862 (_2!8312 lt!273252))) ((_ sign_extend 32) (currentBit!8857 (_2!8312 lt!273252))) lt!273752))))

(declare-fun d!62591 () Bool)

(assert (=> d!62591 e!124037))

(declare-fun res!147661 () Bool)

(assert (=> d!62591 (=> (not res!147661) (not e!124037))))

(assert (=> d!62591 (= res!147661 (invariant!0 (currentBit!8857 (_2!8312 lt!273785)) (currentByte!8862 (_2!8312 lt!273785)) (size!4230 (buf!4673 (_2!8312 lt!273785)))))))

(assert (=> d!62591 (= lt!273785 e!124038)))

(assert (=> d!62591 (= c!9274 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!62591 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!62591 (= (appendBitsLSBFirstLoopTR!0 (_2!8312 lt!273252) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!273785)))

(declare-fun b!178083 () Bool)

(assert (=> b!178083 (= e!124040 (= (_1!8321 lt!273776) (_2!8322 lt!273791)))))

(declare-fun b!178094 () Bool)

(assert (=> b!178094 (= e!124041 (= (bitIndex!0 (size!4230 (buf!4673 (_1!8313 lt!273765))) (currentByte!8862 (_1!8313 lt!273765)) (currentBit!8857 (_1!8313 lt!273765))) (bitIndex!0 (size!4230 (buf!4673 (_2!8312 lt!273773))) (currentByte!8862 (_2!8312 lt!273773)) (currentBit!8857 (_2!8312 lt!273773)))))))

(declare-fun b!178095 () Bool)

(declare-fun res!147660 () Bool)

(assert (=> b!178095 (=> (not res!147660) (not e!124037))))

(declare-fun lt!273754 () (_ BitVec 64))

(declare-fun lt!273803 () (_ BitVec 64))

(assert (=> b!178095 (= res!147660 (= (bitIndex!0 (size!4230 (buf!4673 (_2!8312 lt!273785))) (currentByte!8862 (_2!8312 lt!273785)) (currentBit!8857 (_2!8312 lt!273785))) (bvsub lt!273803 lt!273754)))))

(assert (=> b!178095 (or (= (bvand lt!273803 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!273754 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!273803 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!273803 lt!273754) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!178095 (= lt!273754 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!273790 () (_ BitVec 64))

(declare-fun lt!273758 () (_ BitVec 64))

(assert (=> b!178095 (= lt!273803 (bvadd lt!273790 lt!273758))))

(assert (=> b!178095 (or (not (= (bvand lt!273790 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!273758 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!273790 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!273790 lt!273758) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!178095 (= lt!273758 ((_ sign_extend 32) nBits!348))))

(assert (=> b!178095 (= lt!273790 (bitIndex!0 (size!4230 (buf!4673 (_2!8312 lt!273252))) (currentByte!8862 (_2!8312 lt!273252)) (currentBit!8857 (_2!8312 lt!273252))))))

(assert (= (and d!62591 c!9274) b!178084))

(assert (= (and d!62591 (not c!9274)) b!178081))

(assert (= (and b!178081 res!147656) b!178091))

(assert (= (and b!178091 res!147659) b!178082))

(assert (= (and b!178082 res!147665) b!178089))

(assert (= (and b!178089 res!147662) b!178094))

(assert (= (and b!178081 res!147657) b!178087))

(assert (= (and b!178081 c!9273) b!178092))

(assert (= (and b!178081 (not c!9273)) b!178086))

(assert (= (and b!178081 res!147663) b!178080))

(assert (= (or b!178084 b!178082) bm!2923))

(assert (= (and d!62591 res!147661) b!178090))

(assert (= (and b!178090 res!147654) b!178095))

(assert (= (and b!178095 res!147660) b!178085))

(assert (= (and b!178085 res!147655) b!178088))

(assert (= (and b!178088 res!147664) b!178093))

(assert (= (and b!178088 res!147658) b!178083))

(declare-fun m!278101 () Bool)

(assert (=> b!178081 m!278101))

(declare-fun m!278103 () Bool)

(assert (=> b!178081 m!278103))

(declare-fun m!278105 () Bool)

(assert (=> b!178081 m!278105))

(declare-fun m!278107 () Bool)

(assert (=> b!178081 m!278107))

(declare-fun m!278109 () Bool)

(assert (=> b!178081 m!278109))

(declare-fun m!278111 () Bool)

(assert (=> b!178081 m!278111))

(declare-fun m!278113 () Bool)

(assert (=> b!178081 m!278113))

(declare-fun m!278115 () Bool)

(assert (=> b!178081 m!278115))

(declare-fun m!278117 () Bool)

(assert (=> b!178081 m!278117))

(assert (=> b!178081 m!277907))

(declare-fun m!278119 () Bool)

(assert (=> b!178081 m!278119))

(declare-fun m!278121 () Bool)

(assert (=> b!178081 m!278121))

(declare-fun m!278123 () Bool)

(assert (=> b!178081 m!278123))

(declare-fun m!278125 () Bool)

(assert (=> b!178081 m!278125))

(declare-fun m!278127 () Bool)

(assert (=> b!178081 m!278127))

(declare-fun m!278129 () Bool)

(assert (=> b!178081 m!278129))

(assert (=> b!178081 m!278101))

(declare-fun m!278131 () Bool)

(assert (=> b!178081 m!278131))

(declare-fun m!278133 () Bool)

(assert (=> b!178081 m!278133))

(declare-fun m!278135 () Bool)

(assert (=> b!178081 m!278135))

(declare-fun m!278137 () Bool)

(assert (=> b!178081 m!278137))

(declare-fun m!278139 () Bool)

(assert (=> b!178081 m!278139))

(declare-fun m!278141 () Bool)

(assert (=> b!178081 m!278141))

(declare-fun m!278143 () Bool)

(assert (=> b!178081 m!278143))

(declare-fun m!278145 () Bool)

(assert (=> b!178081 m!278145))

(declare-fun m!278147 () Bool)

(assert (=> b!178081 m!278147))

(declare-fun m!278149 () Bool)

(assert (=> b!178081 m!278149))

(declare-fun m!278151 () Bool)

(assert (=> b!178081 m!278151))

(declare-fun m!278153 () Bool)

(assert (=> b!178081 m!278153))

(declare-fun m!278155 () Bool)

(assert (=> b!178081 m!278155))

(declare-fun m!278157 () Bool)

(assert (=> b!178081 m!278157))

(declare-fun m!278159 () Bool)

(assert (=> b!178081 m!278159))

(declare-fun m!278161 () Bool)

(assert (=> b!178081 m!278161))

(declare-fun m!278163 () Bool)

(assert (=> b!178081 m!278163))

(declare-fun m!278165 () Bool)

(assert (=> b!178081 m!278165))

(declare-fun m!278167 () Bool)

(assert (=> d!62591 m!278167))

(declare-fun m!278169 () Bool)

(assert (=> b!178093 m!278169))

(declare-fun m!278171 () Bool)

(assert (=> bm!2923 m!278171))

(declare-fun m!278173 () Bool)

(assert (=> b!178089 m!278173))

(assert (=> b!178089 m!278173))

(declare-fun m!278175 () Bool)

(assert (=> b!178089 m!278175))

(declare-fun m!278177 () Bool)

(assert (=> b!178084 m!278177))

(declare-fun m!278179 () Bool)

(assert (=> b!178085 m!278179))

(declare-fun m!278181 () Bool)

(assert (=> b!178094 m!278181))

(declare-fun m!278183 () Bool)

(assert (=> b!178094 m!278183))

(assert (=> b!178091 m!278183))

(assert (=> b!178091 m!277907))

(declare-fun m!278185 () Bool)

(assert (=> b!178088 m!278185))

(assert (=> b!178088 m!278137))

(assert (=> b!178088 m!278109))

(declare-fun m!278187 () Bool)

(assert (=> b!178088 m!278187))

(declare-fun m!278189 () Bool)

(assert (=> b!178088 m!278189))

(declare-fun m!278191 () Bool)

(assert (=> b!178088 m!278191))

(declare-fun m!278193 () Bool)

(assert (=> b!178095 m!278193))

(assert (=> b!178095 m!277907))

(assert (=> b!177879 d!62591))

(push 1)

(assert (not d!62591))

(assert (not b!177922))

(assert (not d!62569))

(assert (not d!62563))

(assert (not b!178095))

(assert (not d!62571))

(assert (not b!177934))

(assert (not b!178091))

(assert (not d!62581))

(assert (not b!177938))

(assert (not b!177935))

(assert (not b!178094))

(assert (not b!177917))

(assert (not b!177933))

(assert (not d!62565))

(assert (not b!178093))

(assert (not d!62573))

(assert (not b!178088))

(assert (not b!178089))

(assert (not b!178084))

(assert (not b!177915))

(assert (not d!62575))

(assert (not d!62589))

(assert (not b!177936))

(assert (not b!178085))

(assert (not b!177932))

(assert (not bm!2923))

(assert (not b!178081))

(assert (not d!62577))

(check-sat)

