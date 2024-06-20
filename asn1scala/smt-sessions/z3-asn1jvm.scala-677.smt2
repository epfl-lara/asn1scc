; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18964 () Bool)

(assert start!18964)

(declare-fun b!94834 () Bool)

(declare-fun e!62182 () Bool)

(declare-datatypes ((array!4433 0))(
  ( (array!4434 (arr!2626 (Array (_ BitVec 32) (_ BitVec 8))) (size!2018 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3540 0))(
  ( (BitStream!3541 (buf!2379 array!4433) (currentByte!4742 (_ BitVec 32)) (currentBit!4737 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3540)

(declare-fun array_inv!1835 (array!4433) Bool)

(assert (=> b!94834 (= e!62182 (array_inv!1835 (buf!2379 bitStream1!8)))))

(declare-fun b!94835 () Bool)

(declare-fun res!78119 () Bool)

(declare-fun e!62183 () Bool)

(assert (=> b!94835 (=> (not res!78119) (not e!62183))))

(declare-fun bitStream2!8 () BitStream!3540)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!94835 (= res!78119 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2018 (buf!2379 bitStream1!8)) (currentByte!4742 bitStream1!8) (currentBit!4737 bitStream1!8))) (bitIndex!0 (size!2018 (buf!2379 bitStream2!8)) (currentByte!4742 bitStream2!8) (currentBit!4737 bitStream2!8))))))

(declare-fun b!94836 () Bool)

(declare-fun res!78118 () Bool)

(assert (=> b!94836 (=> (not res!78118) (not e!62183))))

(declare-fun nBits!484 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!94836 (= res!78118 (validate_offset_bits!1 ((_ sign_extend 32) (size!2018 (buf!2379 bitStream2!8))) ((_ sign_extend 32) (currentByte!4742 bitStream2!8)) ((_ sign_extend 32) (currentBit!4737 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!94837 () Bool)

(declare-fun res!78120 () Bool)

(assert (=> b!94837 (=> (not res!78120) (not e!62183))))

(declare-fun base!8 () BitStream!3540)

(assert (=> b!94837 (= res!78120 (bvslt (bitIndex!0 (size!2018 (buf!2379 base!8)) (currentByte!4742 base!8) (currentBit!4737 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!94838 () Bool)

(declare-fun res!78111 () Bool)

(assert (=> b!94838 (=> (not res!78111) (not e!62183))))

(declare-fun isPrefixOf!0 (BitStream!3540 BitStream!3540) Bool)

(assert (=> b!94838 (= res!78111 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!94839 () Bool)

(declare-fun res!78112 () Bool)

(assert (=> b!94839 (=> (not res!78112) (not e!62183))))

(assert (=> b!94839 (= res!78112 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!94840 () Bool)

(declare-fun res!78117 () Bool)

(assert (=> b!94840 (=> (not res!78117) (not e!62183))))

(assert (=> b!94840 (= res!78117 (not (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!94841 () Bool)

(declare-fun e!62185 () Bool)

(declare-fun thiss!1534 () BitStream!3540)

(assert (=> b!94841 (= e!62185 (array_inv!1835 (buf!2379 thiss!1534)))))

(declare-fun b!94842 () Bool)

(declare-fun e!62186 () Bool)

(assert (=> b!94842 (= e!62186 (array_inv!1835 (buf!2379 bitStream2!8)))))

(declare-fun res!78116 () Bool)

(assert (=> start!18964 (=> (not res!78116) (not e!62183))))

(assert (=> start!18964 (= res!78116 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18964 e!62183))

(assert (=> start!18964 true))

(declare-fun inv!12 (BitStream!3540) Bool)

(assert (=> start!18964 (and (inv!12 bitStream1!8) e!62182)))

(assert (=> start!18964 (and (inv!12 bitStream2!8) e!62186)))

(declare-fun e!62180 () Bool)

(assert (=> start!18964 (and (inv!12 base!8) e!62180)))

(assert (=> start!18964 (and (inv!12 thiss!1534) e!62185)))

(declare-fun b!94843 () Bool)

(declare-fun res!78115 () Bool)

(assert (=> b!94843 (=> (not res!78115) (not e!62183))))

(assert (=> b!94843 (= res!78115 (validate_offset_bits!1 ((_ sign_extend 32) (size!2018 (buf!2379 bitStream1!8))) ((_ sign_extend 32) (currentByte!4742 bitStream1!8)) ((_ sign_extend 32) (currentBit!4737 bitStream1!8)) nBits!484))))

(declare-fun b!94844 () Bool)

(assert (=> b!94844 (= e!62180 (array_inv!1835 (buf!2379 base!8)))))

(declare-fun b!94845 () Bool)

(declare-fun res!78109 () Bool)

(assert (=> b!94845 (=> (not res!78109) (not e!62183))))

(declare-datatypes ((List!876 0))(
  ( (Nil!873) (Cons!872 (h!991 Bool) (t!1626 List!876)) )
))
(declare-fun listBits!13 () List!876)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!3540 BitStream!3540 (_ BitVec 64)) List!876)

(assert (=> b!94845 (= res!78109 (= listBits!13 (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484)))))

(declare-fun b!94846 () Bool)

(declare-fun res!78114 () Bool)

(assert (=> b!94846 (=> (not res!78114) (not e!62183))))

(declare-fun length!467 (List!876) Int)

(assert (=> b!94846 (= res!78114 (> (length!467 listBits!13) 0))))

(declare-fun b!94847 () Bool)

(declare-fun res!78113 () Bool)

(assert (=> b!94847 (=> (not res!78113) (not e!62183))))

(assert (=> b!94847 (= res!78113 (and (= (buf!2379 bitStream1!8) (buf!2379 bitStream2!8)) (= (buf!2379 bitStream1!8) (buf!2379 base!8))))))

(declare-fun b!94848 () Bool)

(declare-fun res!78110 () Bool)

(assert (=> b!94848 (=> (not res!78110) (not e!62183))))

(declare-datatypes ((tuple2!7668 0))(
  ( (tuple2!7669 (_1!4081 BitStream!3540) (_2!4081 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!3540) tuple2!7668)

(declare-fun head!588 (List!876) Bool)

(assert (=> b!94848 (= res!78110 (= (_2!4081 (readBitPure!0 bitStream1!8)) (head!588 listBits!13)))))

(declare-fun b!94849 () Bool)

(declare-fun res!78108 () Bool)

(assert (=> b!94849 (=> (not res!78108) (not e!62183))))

(assert (=> b!94849 (= res!78108 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!94850 () Bool)

(assert (=> b!94850 (= e!62183 (= listBits!13 Nil!873))))

(assert (= (and start!18964 res!78116) b!94846))

(assert (= (and b!94846 res!78114) b!94839))

(assert (= (and b!94839 res!78112) b!94849))

(assert (= (and b!94849 res!78108) b!94838))

(assert (= (and b!94838 res!78111) b!94847))

(assert (= (and b!94847 res!78113) b!94837))

(assert (= (and b!94837 res!78120) b!94835))

(assert (= (and b!94835 res!78119) b!94843))

(assert (= (and b!94843 res!78115) b!94836))

(assert (= (and b!94836 res!78118) b!94845))

(assert (= (and b!94845 res!78109) b!94840))

(assert (= (and b!94840 res!78117) b!94848))

(assert (= (and b!94848 res!78110) b!94850))

(assert (= start!18964 b!94834))

(assert (= start!18964 b!94842))

(assert (= start!18964 b!94844))

(assert (= start!18964 b!94841))

(declare-fun m!138345 () Bool)

(assert (=> b!94849 m!138345))

(declare-fun m!138347 () Bool)

(assert (=> b!94848 m!138347))

(declare-fun m!138349 () Bool)

(assert (=> b!94848 m!138349))

(declare-fun m!138351 () Bool)

(assert (=> b!94837 m!138351))

(declare-fun m!138353 () Bool)

(assert (=> b!94846 m!138353))

(declare-fun m!138355 () Bool)

(assert (=> b!94839 m!138355))

(declare-fun m!138357 () Bool)

(assert (=> b!94834 m!138357))

(declare-fun m!138359 () Bool)

(assert (=> b!94842 m!138359))

(declare-fun m!138361 () Bool)

(assert (=> b!94845 m!138361))

(declare-fun m!138363 () Bool)

(assert (=> b!94844 m!138363))

(declare-fun m!138365 () Bool)

(assert (=> b!94835 m!138365))

(declare-fun m!138367 () Bool)

(assert (=> b!94835 m!138367))

(declare-fun m!138369 () Bool)

(assert (=> b!94838 m!138369))

(declare-fun m!138371 () Bool)

(assert (=> start!18964 m!138371))

(declare-fun m!138373 () Bool)

(assert (=> start!18964 m!138373))

(declare-fun m!138375 () Bool)

(assert (=> start!18964 m!138375))

(declare-fun m!138377 () Bool)

(assert (=> start!18964 m!138377))

(declare-fun m!138379 () Bool)

(assert (=> b!94836 m!138379))

(declare-fun m!138381 () Bool)

(assert (=> b!94841 m!138381))

(declare-fun m!138383 () Bool)

(assert (=> b!94843 m!138383))

(check-sat (not b!94836) (not b!94849) (not b!94839) (not start!18964) (not b!94835) (not b!94838) (not b!94848) (not b!94844) (not b!94845) (not b!94837) (not b!94842) (not b!94841) (not b!94834) (not b!94846) (not b!94843))
(check-sat)
(get-model)

(declare-fun d!29438 () Bool)

(declare-fun e!62217 () Bool)

(assert (=> d!29438 e!62217))

(declare-fun res!78165 () Bool)

(assert (=> d!29438 (=> (not res!78165) (not e!62217))))

(declare-fun lt!138864 () (_ BitVec 64))

(declare-fun lt!138867 () (_ BitVec 64))

(declare-fun lt!138866 () (_ BitVec 64))

(assert (=> d!29438 (= res!78165 (= lt!138866 (bvsub lt!138864 lt!138867)))))

(assert (=> d!29438 (or (= (bvand lt!138864 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138867 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138864 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138864 lt!138867) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!29438 (= lt!138867 (remainingBits!0 ((_ sign_extend 32) (size!2018 (buf!2379 bitStream1!8))) ((_ sign_extend 32) (currentByte!4742 bitStream1!8)) ((_ sign_extend 32) (currentBit!4737 bitStream1!8))))))

(declare-fun lt!138862 () (_ BitVec 64))

(declare-fun lt!138863 () (_ BitVec 64))

(assert (=> d!29438 (= lt!138864 (bvmul lt!138862 lt!138863))))

(assert (=> d!29438 (or (= lt!138862 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138863 (bvsdiv (bvmul lt!138862 lt!138863) lt!138862)))))

(assert (=> d!29438 (= lt!138863 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29438 (= lt!138862 ((_ sign_extend 32) (size!2018 (buf!2379 bitStream1!8))))))

(assert (=> d!29438 (= lt!138866 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4742 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4737 bitStream1!8))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!29438 (invariant!0 (currentBit!4737 bitStream1!8) (currentByte!4742 bitStream1!8) (size!2018 (buf!2379 bitStream1!8)))))

(assert (=> d!29438 (= (bitIndex!0 (size!2018 (buf!2379 bitStream1!8)) (currentByte!4742 bitStream1!8) (currentBit!4737 bitStream1!8)) lt!138866)))

(declare-fun b!94906 () Bool)

(declare-fun res!78164 () Bool)

(assert (=> b!94906 (=> (not res!78164) (not e!62217))))

(assert (=> b!94906 (= res!78164 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138866))))

(declare-fun b!94907 () Bool)

(declare-fun lt!138865 () (_ BitVec 64))

(assert (=> b!94907 (= e!62217 (bvsle lt!138866 (bvmul lt!138865 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!94907 (or (= lt!138865 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138865 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138865)))))

(assert (=> b!94907 (= lt!138865 ((_ sign_extend 32) (size!2018 (buf!2379 bitStream1!8))))))

(assert (= (and d!29438 res!78165) b!94906))

(assert (= (and b!94906 res!78164) b!94907))

(declare-fun m!138425 () Bool)

(assert (=> d!29438 m!138425))

(declare-fun m!138427 () Bool)

(assert (=> d!29438 m!138427))

(assert (=> b!94835 d!29438))

(declare-fun d!29440 () Bool)

(declare-fun e!62218 () Bool)

(assert (=> d!29440 e!62218))

(declare-fun res!78167 () Bool)

(assert (=> d!29440 (=> (not res!78167) (not e!62218))))

(declare-fun lt!138872 () (_ BitVec 64))

(declare-fun lt!138870 () (_ BitVec 64))

(declare-fun lt!138873 () (_ BitVec 64))

(assert (=> d!29440 (= res!78167 (= lt!138872 (bvsub lt!138870 lt!138873)))))

(assert (=> d!29440 (or (= (bvand lt!138870 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138873 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138870 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138870 lt!138873) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29440 (= lt!138873 (remainingBits!0 ((_ sign_extend 32) (size!2018 (buf!2379 bitStream2!8))) ((_ sign_extend 32) (currentByte!4742 bitStream2!8)) ((_ sign_extend 32) (currentBit!4737 bitStream2!8))))))

(declare-fun lt!138868 () (_ BitVec 64))

(declare-fun lt!138869 () (_ BitVec 64))

(assert (=> d!29440 (= lt!138870 (bvmul lt!138868 lt!138869))))

(assert (=> d!29440 (or (= lt!138868 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138869 (bvsdiv (bvmul lt!138868 lt!138869) lt!138868)))))

(assert (=> d!29440 (= lt!138869 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29440 (= lt!138868 ((_ sign_extend 32) (size!2018 (buf!2379 bitStream2!8))))))

(assert (=> d!29440 (= lt!138872 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4742 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4737 bitStream2!8))))))

(assert (=> d!29440 (invariant!0 (currentBit!4737 bitStream2!8) (currentByte!4742 bitStream2!8) (size!2018 (buf!2379 bitStream2!8)))))

(assert (=> d!29440 (= (bitIndex!0 (size!2018 (buf!2379 bitStream2!8)) (currentByte!4742 bitStream2!8) (currentBit!4737 bitStream2!8)) lt!138872)))

(declare-fun b!94908 () Bool)

(declare-fun res!78166 () Bool)

(assert (=> b!94908 (=> (not res!78166) (not e!62218))))

(assert (=> b!94908 (= res!78166 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138872))))

(declare-fun b!94909 () Bool)

(declare-fun lt!138871 () (_ BitVec 64))

(assert (=> b!94909 (= e!62218 (bvsle lt!138872 (bvmul lt!138871 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!94909 (or (= lt!138871 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138871 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138871)))))

(assert (=> b!94909 (= lt!138871 ((_ sign_extend 32) (size!2018 (buf!2379 bitStream2!8))))))

(assert (= (and d!29440 res!78167) b!94908))

(assert (= (and b!94908 res!78166) b!94909))

(declare-fun m!138429 () Bool)

(assert (=> d!29440 m!138429))

(declare-fun m!138431 () Bool)

(assert (=> d!29440 m!138431))

(assert (=> b!94835 d!29440))

(declare-fun d!29442 () Bool)

(declare-fun size!2020 (List!876) Int)

(assert (=> d!29442 (= (length!467 listBits!13) (size!2020 listBits!13))))

(declare-fun bs!7247 () Bool)

(assert (= bs!7247 d!29442))

(declare-fun m!138433 () Bool)

(assert (=> bs!7247 m!138433))

(assert (=> b!94846 d!29442))

(declare-fun b!94918 () Bool)

(declare-datatypes ((tuple2!7672 0))(
  ( (tuple2!7673 (_1!4083 List!876) (_2!4083 BitStream!3540)) )
))
(declare-fun e!62223 () tuple2!7672)

(assert (=> b!94918 (= e!62223 (tuple2!7673 Nil!873 bitStream1!8))))

(declare-fun lt!138881 () (_ BitVec 64))

(declare-datatypes ((tuple2!7674 0))(
  ( (tuple2!7675 (_1!4084 Bool) (_2!4084 BitStream!3540)) )
))
(declare-fun lt!138882 () tuple2!7674)

(declare-fun b!94919 () Bool)

(assert (=> b!94919 (= e!62223 (tuple2!7673 (Cons!872 (_1!4084 lt!138882) (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4084 lt!138882) (bvsub nBits!484 lt!138881))) (_2!4084 lt!138882)))))

(declare-fun readBit!0 (BitStream!3540) tuple2!7674)

(assert (=> b!94919 (= lt!138882 (readBit!0 bitStream1!8))))

(assert (=> b!94919 (= lt!138881 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!94920 () Bool)

(declare-fun e!62224 () Bool)

(declare-fun lt!138880 () List!876)

(declare-fun isEmpty!256 (List!876) Bool)

(assert (=> b!94920 (= e!62224 (isEmpty!256 lt!138880))))

(declare-fun d!29444 () Bool)

(assert (=> d!29444 e!62224))

(declare-fun c!5960 () Bool)

(assert (=> d!29444 (= c!5960 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!29444 (= lt!138880 (_1!4083 e!62223))))

(declare-fun c!5961 () Bool)

(assert (=> d!29444 (= c!5961 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!29444 (bvsge nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!29444 (= (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484) lt!138880)))

(declare-fun b!94921 () Bool)

(assert (=> b!94921 (= e!62224 (> (length!467 lt!138880) 0))))

(assert (= (and d!29444 c!5961) b!94918))

(assert (= (and d!29444 (not c!5961)) b!94919))

(assert (= (and d!29444 c!5960) b!94920))

(assert (= (and d!29444 (not c!5960)) b!94921))

(declare-fun m!138435 () Bool)

(assert (=> b!94919 m!138435))

(declare-fun m!138437 () Bool)

(assert (=> b!94919 m!138437))

(declare-fun m!138439 () Bool)

(assert (=> b!94920 m!138439))

(declare-fun m!138441 () Bool)

(assert (=> b!94921 m!138441))

(assert (=> b!94845 d!29444))

(declare-fun d!29446 () Bool)

(assert (=> d!29446 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2018 (buf!2379 bitStream2!8))) ((_ sign_extend 32) (currentByte!4742 bitStream2!8)) ((_ sign_extend 32) (currentBit!4737 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2018 (buf!2379 bitStream2!8))) ((_ sign_extend 32) (currentByte!4742 bitStream2!8)) ((_ sign_extend 32) (currentBit!4737 bitStream2!8))) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!7248 () Bool)

(assert (= bs!7248 d!29446))

(assert (=> bs!7248 m!138429))

(assert (=> b!94836 d!29446))

(declare-fun d!29448 () Bool)

(declare-fun res!78175 () Bool)

(declare-fun e!62229 () Bool)

(assert (=> d!29448 (=> (not res!78175) (not e!62229))))

(assert (=> d!29448 (= res!78175 (= (size!2018 (buf!2379 bitStream1!8)) (size!2018 (buf!2379 bitStream2!8))))))

(assert (=> d!29448 (= (isPrefixOf!0 bitStream1!8 bitStream2!8) e!62229)))

(declare-fun b!94928 () Bool)

(declare-fun res!78174 () Bool)

(assert (=> b!94928 (=> (not res!78174) (not e!62229))))

(assert (=> b!94928 (= res!78174 (bvsle (bitIndex!0 (size!2018 (buf!2379 bitStream1!8)) (currentByte!4742 bitStream1!8) (currentBit!4737 bitStream1!8)) (bitIndex!0 (size!2018 (buf!2379 bitStream2!8)) (currentByte!4742 bitStream2!8) (currentBit!4737 bitStream2!8))))))

(declare-fun b!94929 () Bool)

(declare-fun e!62230 () Bool)

(assert (=> b!94929 (= e!62229 e!62230)))

(declare-fun res!78176 () Bool)

(assert (=> b!94929 (=> res!78176 e!62230)))

(assert (=> b!94929 (= res!78176 (= (size!2018 (buf!2379 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!94930 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4433 array!4433 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!94930 (= e!62230 (arrayBitRangesEq!0 (buf!2379 bitStream1!8) (buf!2379 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2018 (buf!2379 bitStream1!8)) (currentByte!4742 bitStream1!8) (currentBit!4737 bitStream1!8))))))

(assert (= (and d!29448 res!78175) b!94928))

(assert (= (and b!94928 res!78174) b!94929))

(assert (= (and b!94929 (not res!78176)) b!94930))

(assert (=> b!94928 m!138365))

(assert (=> b!94928 m!138367))

(assert (=> b!94930 m!138365))

(assert (=> b!94930 m!138365))

(declare-fun m!138443 () Bool)

(assert (=> b!94930 m!138443))

(assert (=> b!94838 d!29448))

(declare-fun d!29450 () Bool)

(declare-fun e!62231 () Bool)

(assert (=> d!29450 e!62231))

(declare-fun res!78178 () Bool)

(assert (=> d!29450 (=> (not res!78178) (not e!62231))))

(declare-fun lt!138888 () (_ BitVec 64))

(declare-fun lt!138887 () (_ BitVec 64))

(declare-fun lt!138885 () (_ BitVec 64))

(assert (=> d!29450 (= res!78178 (= lt!138887 (bvsub lt!138885 lt!138888)))))

(assert (=> d!29450 (or (= (bvand lt!138885 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138888 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138885 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138885 lt!138888) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29450 (= lt!138888 (remainingBits!0 ((_ sign_extend 32) (size!2018 (buf!2379 base!8))) ((_ sign_extend 32) (currentByte!4742 base!8)) ((_ sign_extend 32) (currentBit!4737 base!8))))))

(declare-fun lt!138883 () (_ BitVec 64))

(declare-fun lt!138884 () (_ BitVec 64))

(assert (=> d!29450 (= lt!138885 (bvmul lt!138883 lt!138884))))

(assert (=> d!29450 (or (= lt!138883 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138884 (bvsdiv (bvmul lt!138883 lt!138884) lt!138883)))))

(assert (=> d!29450 (= lt!138884 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29450 (= lt!138883 ((_ sign_extend 32) (size!2018 (buf!2379 base!8))))))

(assert (=> d!29450 (= lt!138887 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4742 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4737 base!8))))))

(assert (=> d!29450 (invariant!0 (currentBit!4737 base!8) (currentByte!4742 base!8) (size!2018 (buf!2379 base!8)))))

(assert (=> d!29450 (= (bitIndex!0 (size!2018 (buf!2379 base!8)) (currentByte!4742 base!8) (currentBit!4737 base!8)) lt!138887)))

(declare-fun b!94931 () Bool)

(declare-fun res!78177 () Bool)

(assert (=> b!94931 (=> (not res!78177) (not e!62231))))

(assert (=> b!94931 (= res!78177 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138887))))

(declare-fun b!94932 () Bool)

(declare-fun lt!138886 () (_ BitVec 64))

(assert (=> b!94932 (= e!62231 (bvsle lt!138887 (bvmul lt!138886 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!94932 (or (= lt!138886 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138886 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138886)))))

(assert (=> b!94932 (= lt!138886 ((_ sign_extend 32) (size!2018 (buf!2379 base!8))))))

(assert (= (and d!29450 res!78178) b!94931))

(assert (= (and b!94931 res!78177) b!94932))

(declare-fun m!138445 () Bool)

(assert (=> d!29450 m!138445))

(declare-fun m!138447 () Bool)

(assert (=> d!29450 m!138447))

(assert (=> b!94837 d!29450))

(declare-fun d!29452 () Bool)

(declare-fun lt!138891 () tuple2!7674)

(assert (=> d!29452 (= lt!138891 (readBit!0 bitStream1!8))))

(assert (=> d!29452 (= (readBitPure!0 bitStream1!8) (tuple2!7669 (_2!4084 lt!138891) (_1!4084 lt!138891)))))

(declare-fun bs!7249 () Bool)

(assert (= bs!7249 d!29452))

(assert (=> bs!7249 m!138437))

(assert (=> b!94848 d!29452))

(declare-fun d!29454 () Bool)

(assert (=> d!29454 (= (head!588 listBits!13) (h!991 listBits!13))))

(assert (=> b!94848 d!29454))

(declare-fun d!29456 () Bool)

(declare-fun res!78180 () Bool)

(declare-fun e!62232 () Bool)

(assert (=> d!29456 (=> (not res!78180) (not e!62232))))

(assert (=> d!29456 (= res!78180 (= (size!2018 (buf!2379 bitStream1!8)) (size!2018 (buf!2379 base!8))))))

(assert (=> d!29456 (= (isPrefixOf!0 bitStream1!8 base!8) e!62232)))

(declare-fun b!94933 () Bool)

(declare-fun res!78179 () Bool)

(assert (=> b!94933 (=> (not res!78179) (not e!62232))))

(assert (=> b!94933 (= res!78179 (bvsle (bitIndex!0 (size!2018 (buf!2379 bitStream1!8)) (currentByte!4742 bitStream1!8) (currentBit!4737 bitStream1!8)) (bitIndex!0 (size!2018 (buf!2379 base!8)) (currentByte!4742 base!8) (currentBit!4737 base!8))))))

(declare-fun b!94934 () Bool)

(declare-fun e!62233 () Bool)

(assert (=> b!94934 (= e!62232 e!62233)))

(declare-fun res!78181 () Bool)

(assert (=> b!94934 (=> res!78181 e!62233)))

(assert (=> b!94934 (= res!78181 (= (size!2018 (buf!2379 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!94935 () Bool)

(assert (=> b!94935 (= e!62233 (arrayBitRangesEq!0 (buf!2379 bitStream1!8) (buf!2379 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2018 (buf!2379 bitStream1!8)) (currentByte!4742 bitStream1!8) (currentBit!4737 bitStream1!8))))))

(assert (= (and d!29456 res!78180) b!94933))

(assert (= (and b!94933 res!78179) b!94934))

(assert (= (and b!94934 (not res!78181)) b!94935))

(assert (=> b!94933 m!138365))

(assert (=> b!94933 m!138351))

(assert (=> b!94935 m!138365))

(assert (=> b!94935 m!138365))

(declare-fun m!138449 () Bool)

(assert (=> b!94935 m!138449))

(assert (=> b!94839 d!29456))

(declare-fun d!29458 () Bool)

(declare-fun res!78183 () Bool)

(declare-fun e!62234 () Bool)

(assert (=> d!29458 (=> (not res!78183) (not e!62234))))

(assert (=> d!29458 (= res!78183 (= (size!2018 (buf!2379 bitStream2!8)) (size!2018 (buf!2379 base!8))))))

(assert (=> d!29458 (= (isPrefixOf!0 bitStream2!8 base!8) e!62234)))

(declare-fun b!94936 () Bool)

(declare-fun res!78182 () Bool)

(assert (=> b!94936 (=> (not res!78182) (not e!62234))))

(assert (=> b!94936 (= res!78182 (bvsle (bitIndex!0 (size!2018 (buf!2379 bitStream2!8)) (currentByte!4742 bitStream2!8) (currentBit!4737 bitStream2!8)) (bitIndex!0 (size!2018 (buf!2379 base!8)) (currentByte!4742 base!8) (currentBit!4737 base!8))))))

(declare-fun b!94937 () Bool)

(declare-fun e!62235 () Bool)

(assert (=> b!94937 (= e!62234 e!62235)))

(declare-fun res!78184 () Bool)

(assert (=> b!94937 (=> res!78184 e!62235)))

(assert (=> b!94937 (= res!78184 (= (size!2018 (buf!2379 bitStream2!8)) #b00000000000000000000000000000000))))

(declare-fun b!94938 () Bool)

(assert (=> b!94938 (= e!62235 (arrayBitRangesEq!0 (buf!2379 bitStream2!8) (buf!2379 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2018 (buf!2379 bitStream2!8)) (currentByte!4742 bitStream2!8) (currentBit!4737 bitStream2!8))))))

(assert (= (and d!29458 res!78183) b!94936))

(assert (= (and b!94936 res!78182) b!94937))

(assert (= (and b!94937 (not res!78184)) b!94938))

(assert (=> b!94936 m!138367))

(assert (=> b!94936 m!138351))

(assert (=> b!94938 m!138367))

(assert (=> b!94938 m!138367))

(declare-fun m!138451 () Bool)

(assert (=> b!94938 m!138451))

(assert (=> b!94849 d!29458))

(declare-fun d!29460 () Bool)

(assert (=> d!29460 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4737 bitStream1!8) (currentByte!4742 bitStream1!8) (size!2018 (buf!2379 bitStream1!8))))))

(declare-fun bs!7250 () Bool)

(assert (= bs!7250 d!29460))

(assert (=> bs!7250 m!138427))

(assert (=> start!18964 d!29460))

(declare-fun d!29462 () Bool)

(assert (=> d!29462 (= (inv!12 bitStream2!8) (invariant!0 (currentBit!4737 bitStream2!8) (currentByte!4742 bitStream2!8) (size!2018 (buf!2379 bitStream2!8))))))

(declare-fun bs!7251 () Bool)

(assert (= bs!7251 d!29462))

(assert (=> bs!7251 m!138431))

(assert (=> start!18964 d!29462))

(declare-fun d!29464 () Bool)

(assert (=> d!29464 (= (inv!12 base!8) (invariant!0 (currentBit!4737 base!8) (currentByte!4742 base!8) (size!2018 (buf!2379 base!8))))))

(declare-fun bs!7252 () Bool)

(assert (= bs!7252 d!29464))

(assert (=> bs!7252 m!138447))

(assert (=> start!18964 d!29464))

(declare-fun d!29466 () Bool)

(assert (=> d!29466 (= (inv!12 thiss!1534) (invariant!0 (currentBit!4737 thiss!1534) (currentByte!4742 thiss!1534) (size!2018 (buf!2379 thiss!1534))))))

(declare-fun bs!7253 () Bool)

(assert (= bs!7253 d!29466))

(declare-fun m!138453 () Bool)

(assert (=> bs!7253 m!138453))

(assert (=> start!18964 d!29466))

(declare-fun d!29468 () Bool)

(assert (=> d!29468 (= (array_inv!1835 (buf!2379 bitStream2!8)) (bvsge (size!2018 (buf!2379 bitStream2!8)) #b00000000000000000000000000000000))))

(assert (=> b!94842 d!29468))

(declare-fun d!29470 () Bool)

(assert (=> d!29470 (= (array_inv!1835 (buf!2379 thiss!1534)) (bvsge (size!2018 (buf!2379 thiss!1534)) #b00000000000000000000000000000000))))

(assert (=> b!94841 d!29470))

(declare-fun d!29472 () Bool)

(assert (=> d!29472 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2018 (buf!2379 bitStream1!8))) ((_ sign_extend 32) (currentByte!4742 bitStream1!8)) ((_ sign_extend 32) (currentBit!4737 bitStream1!8)) nBits!484) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2018 (buf!2379 bitStream1!8))) ((_ sign_extend 32) (currentByte!4742 bitStream1!8)) ((_ sign_extend 32) (currentBit!4737 bitStream1!8))) nBits!484))))

(declare-fun bs!7254 () Bool)

(assert (= bs!7254 d!29472))

(assert (=> bs!7254 m!138425))

(assert (=> b!94843 d!29472))

(declare-fun d!29474 () Bool)

(assert (=> d!29474 (= (array_inv!1835 (buf!2379 bitStream1!8)) (bvsge (size!2018 (buf!2379 bitStream1!8)) #b00000000000000000000000000000000))))

(assert (=> b!94834 d!29474))

(declare-fun d!29476 () Bool)

(assert (=> d!29476 (= (array_inv!1835 (buf!2379 base!8)) (bvsge (size!2018 (buf!2379 base!8)) #b00000000000000000000000000000000))))

(assert (=> b!94844 d!29476))

(check-sat (not b!94935) (not b!94921) (not b!94936) (not d!29438) (not d!29450) (not d!29464) (not d!29460) (not d!29462) (not d!29472) (not b!94938) (not d!29466) (not d!29452) (not b!94920) (not b!94919) (not d!29446) (not b!94933) (not b!94928) (not b!94930) (not d!29440) (not d!29442))
