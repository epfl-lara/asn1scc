; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2980 () Bool)

(assert start!2980)

(declare-fun b!13719 () Bool)

(declare-fun e!8423 () Bool)

(declare-fun e!8427 () Bool)

(assert (=> b!13719 (= e!8423 e!8427)))

(declare-fun res!13016 () Bool)

(assert (=> b!13719 (=> (not res!13016) (not e!8427))))

(declare-fun lt!21371 () (_ BitVec 64))

(declare-fun lt!21368 () (_ BitVec 64))

(assert (=> b!13719 (= res!13016 (= lt!21371 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!21368)))))

(declare-datatypes ((array!770 0))(
  ( (array!771 (arr!761 (Array (_ BitVec 32) (_ BitVec 8))) (size!332 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!624 0))(
  ( (BitStream!625 (buf!683 array!770) (currentByte!1800 (_ BitVec 32)) (currentBit!1795 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1129 0))(
  ( (Unit!1130) )
))
(declare-datatypes ((tuple2!1620 0))(
  ( (tuple2!1621 (_1!865 Unit!1129) (_2!865 BitStream!624)) )
))
(declare-fun lt!21369 () tuple2!1620)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!13719 (= lt!21371 (bitIndex!0 (size!332 (buf!683 (_2!865 lt!21369))) (currentByte!1800 (_2!865 lt!21369)) (currentBit!1795 (_2!865 lt!21369))))))

(declare-fun thiss!957 () BitStream!624)

(assert (=> b!13719 (= lt!21368 (bitIndex!0 (size!332 (buf!683 thiss!957)) (currentByte!1800 thiss!957) (currentBit!1795 thiss!957)))))

(declare-fun b!13720 () Bool)

(declare-fun e!8426 () Bool)

(declare-datatypes ((tuple2!1622 0))(
  ( (tuple2!1623 (_1!866 BitStream!624) (_2!866 Bool)) )
))
(declare-fun lt!21370 () tuple2!1622)

(assert (=> b!13720 (= e!8426 (= (bitIndex!0 (size!332 (buf!683 (_1!866 lt!21370))) (currentByte!1800 (_1!866 lt!21370)) (currentBit!1795 (_1!866 lt!21370))) lt!21371))))

(declare-fun b!13721 () Bool)

(declare-fun res!13021 () Bool)

(declare-fun e!8428 () Bool)

(assert (=> b!13721 (=> res!13021 e!8428)))

(declare-fun isPrefixOf!0 (BitStream!624 BitStream!624) Bool)

(assert (=> b!13721 (= res!13021 (not (isPrefixOf!0 thiss!957 (_2!865 lt!21369))))))

(declare-fun b!13722 () Bool)

(declare-fun e!8429 () Bool)

(declare-fun array_inv!321 (array!770) Bool)

(assert (=> b!13722 (= e!8429 (array_inv!321 (buf!683 thiss!957)))))

(declare-fun res!13020 () Bool)

(declare-fun e!8425 () Bool)

(assert (=> start!2980 (=> (not res!13020) (not e!8425))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!2980 (= res!13020 (validate_offset_bit!0 ((_ sign_extend 32) (size!332 (buf!683 thiss!957))) ((_ sign_extend 32) (currentByte!1800 thiss!957)) ((_ sign_extend 32) (currentBit!1795 thiss!957))))))

(assert (=> start!2980 e!8425))

(declare-fun inv!12 (BitStream!624) Bool)

(assert (=> start!2980 (and (inv!12 thiss!957) e!8429)))

(declare-fun b!13723 () Bool)

(declare-fun res!13018 () Bool)

(assert (=> b!13723 (=> res!13018 e!8428)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!13723 (= res!13018 (not (invariant!0 (currentBit!1795 (_2!865 lt!21369)) (currentByte!1800 (_2!865 lt!21369)) (size!332 (buf!683 (_2!865 lt!21369))))))))

(declare-fun b!13724 () Bool)

(assert (=> b!13724 (= e!8427 e!8426)))

(declare-fun res!13019 () Bool)

(assert (=> b!13724 (=> (not res!13019) (not e!8426))))

(assert (=> b!13724 (= res!13019 (and (not (_2!866 lt!21370)) (= (_1!866 lt!21370) (_2!865 lt!21369))))))

(declare-fun readBitPure!0 (BitStream!624) tuple2!1622)

(declare-fun readerFrom!0 (BitStream!624 (_ BitVec 32) (_ BitVec 32)) BitStream!624)

(assert (=> b!13724 (= lt!21370 (readBitPure!0 (readerFrom!0 (_2!865 lt!21369) (currentBit!1795 thiss!957) (currentByte!1800 thiss!957))))))

(declare-fun b!13725 () Bool)

(declare-fun res!13017 () Bool)

(assert (=> b!13725 (=> res!13017 e!8428)))

(assert (=> b!13725 (= res!13017 (not (= (bitIndex!0 (size!332 (buf!683 (_2!865 lt!21369))) (currentByte!1800 (_2!865 lt!21369)) (currentBit!1795 (_2!865 lt!21369))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!332 (buf!683 thiss!957)) (currentByte!1800 thiss!957) (currentBit!1795 thiss!957))))))))

(declare-fun b!13726 () Bool)

(assert (=> b!13726 (= e!8425 (not e!8428))))

(declare-fun res!13014 () Bool)

(assert (=> b!13726 (=> res!13014 e!8428)))

(assert (=> b!13726 (= res!13014 (not (= (size!332 (buf!683 (_2!865 lt!21369))) (size!332 (buf!683 thiss!957)))))))

(assert (=> b!13726 e!8423))

(declare-fun res!13013 () Bool)

(assert (=> b!13726 (=> (not res!13013) (not e!8423))))

(assert (=> b!13726 (= res!13013 (= (size!332 (buf!683 thiss!957)) (size!332 (buf!683 (_2!865 lt!21369)))))))

(declare-fun appendBit!0 (BitStream!624 Bool) tuple2!1620)

(assert (=> b!13726 (= lt!21369 (appendBit!0 thiss!957 false))))

(declare-fun b!13727 () Bool)

(assert (=> b!13727 (= e!8428 (invariant!0 (currentBit!1795 thiss!957) (currentByte!1800 thiss!957) (size!332 (buf!683 (_2!865 lt!21369)))))))

(declare-fun b!13728 () Bool)

(declare-fun res!13015 () Bool)

(assert (=> b!13728 (=> (not res!13015) (not e!8427))))

(assert (=> b!13728 (= res!13015 (isPrefixOf!0 thiss!957 (_2!865 lt!21369)))))

(assert (= (and start!2980 res!13020) b!13726))

(assert (= (and b!13726 res!13013) b!13719))

(assert (= (and b!13719 res!13016) b!13728))

(assert (= (and b!13728 res!13015) b!13724))

(assert (= (and b!13724 res!13019) b!13720))

(assert (= (and b!13726 (not res!13014)) b!13725))

(assert (= (and b!13725 (not res!13017)) b!13721))

(assert (= (and b!13721 (not res!13021)) b!13723))

(assert (= (and b!13723 (not res!13018)) b!13727))

(assert (= start!2980 b!13722))

(declare-fun m!20289 () Bool)

(assert (=> b!13724 m!20289))

(assert (=> b!13724 m!20289))

(declare-fun m!20291 () Bool)

(assert (=> b!13724 m!20291))

(declare-fun m!20293 () Bool)

(assert (=> start!2980 m!20293))

(declare-fun m!20295 () Bool)

(assert (=> start!2980 m!20295))

(declare-fun m!20297 () Bool)

(assert (=> b!13728 m!20297))

(declare-fun m!20299 () Bool)

(assert (=> b!13722 m!20299))

(declare-fun m!20301 () Bool)

(assert (=> b!13719 m!20301))

(declare-fun m!20303 () Bool)

(assert (=> b!13719 m!20303))

(assert (=> b!13725 m!20301))

(assert (=> b!13725 m!20303))

(declare-fun m!20305 () Bool)

(assert (=> b!13720 m!20305))

(declare-fun m!20307 () Bool)

(assert (=> b!13727 m!20307))

(assert (=> b!13721 m!20297))

(declare-fun m!20309 () Bool)

(assert (=> b!13726 m!20309))

(declare-fun m!20311 () Bool)

(assert (=> b!13723 m!20311))

(check-sat (not b!13726) (not b!13723) (not b!13722) (not b!13719) (not b!13724) (not b!13727) (not b!13721) (not b!13725) (not b!13728) (not b!13720) (not start!2980))
(check-sat)
(get-model)

(declare-fun d!4432 () Bool)

(declare-fun e!8457 () Bool)

(assert (=> d!4432 e!8457))

(declare-fun res!13059 () Bool)

(assert (=> d!4432 (=> (not res!13059) (not e!8457))))

(declare-fun lt!21400 () (_ BitVec 64))

(declare-fun lt!21398 () (_ BitVec 64))

(declare-fun lt!21397 () (_ BitVec 64))

(assert (=> d!4432 (= res!13059 (= lt!21398 (bvsub lt!21397 lt!21400)))))

(assert (=> d!4432 (or (= (bvand lt!21397 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21400 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21397 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21397 lt!21400) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!4432 (= lt!21400 (remainingBits!0 ((_ sign_extend 32) (size!332 (buf!683 (_1!866 lt!21370)))) ((_ sign_extend 32) (currentByte!1800 (_1!866 lt!21370))) ((_ sign_extend 32) (currentBit!1795 (_1!866 lt!21370)))))))

(declare-fun lt!21396 () (_ BitVec 64))

(declare-fun lt!21399 () (_ BitVec 64))

(assert (=> d!4432 (= lt!21397 (bvmul lt!21396 lt!21399))))

(assert (=> d!4432 (or (= lt!21396 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21399 (bvsdiv (bvmul lt!21396 lt!21399) lt!21396)))))

(assert (=> d!4432 (= lt!21399 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4432 (= lt!21396 ((_ sign_extend 32) (size!332 (buf!683 (_1!866 lt!21370)))))))

(assert (=> d!4432 (= lt!21398 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1800 (_1!866 lt!21370))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1795 (_1!866 lt!21370)))))))

(assert (=> d!4432 (invariant!0 (currentBit!1795 (_1!866 lt!21370)) (currentByte!1800 (_1!866 lt!21370)) (size!332 (buf!683 (_1!866 lt!21370))))))

(assert (=> d!4432 (= (bitIndex!0 (size!332 (buf!683 (_1!866 lt!21370))) (currentByte!1800 (_1!866 lt!21370)) (currentBit!1795 (_1!866 lt!21370))) lt!21398)))

(declare-fun b!13769 () Bool)

(declare-fun res!13060 () Bool)

(assert (=> b!13769 (=> (not res!13060) (not e!8457))))

(assert (=> b!13769 (= res!13060 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21398))))

(declare-fun b!13770 () Bool)

(declare-fun lt!21401 () (_ BitVec 64))

(assert (=> b!13770 (= e!8457 (bvsle lt!21398 (bvmul lt!21401 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!13770 (or (= lt!21401 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21401 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21401)))))

(assert (=> b!13770 (= lt!21401 ((_ sign_extend 32) (size!332 (buf!683 (_1!866 lt!21370)))))))

(assert (= (and d!4432 res!13059) b!13769))

(assert (= (and b!13769 res!13060) b!13770))

(declare-fun m!20337 () Bool)

(assert (=> d!4432 m!20337))

(declare-fun m!20339 () Bool)

(assert (=> d!4432 m!20339))

(assert (=> b!13720 d!4432))

(declare-fun d!4438 () Bool)

(declare-fun e!8460 () Bool)

(assert (=> d!4438 e!8460))

(declare-fun res!13064 () Bool)

(assert (=> d!4438 (=> (not res!13064) (not e!8460))))

(declare-fun lt!21403 () (_ BitVec 64))

(declare-fun lt!21404 () (_ BitVec 64))

(declare-fun lt!21406 () (_ BitVec 64))

(assert (=> d!4438 (= res!13064 (= lt!21404 (bvsub lt!21403 lt!21406)))))

(assert (=> d!4438 (or (= (bvand lt!21403 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21406 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21403 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21403 lt!21406) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4438 (= lt!21406 (remainingBits!0 ((_ sign_extend 32) (size!332 (buf!683 (_2!865 lt!21369)))) ((_ sign_extend 32) (currentByte!1800 (_2!865 lt!21369))) ((_ sign_extend 32) (currentBit!1795 (_2!865 lt!21369)))))))

(declare-fun lt!21402 () (_ BitVec 64))

(declare-fun lt!21405 () (_ BitVec 64))

(assert (=> d!4438 (= lt!21403 (bvmul lt!21402 lt!21405))))

(assert (=> d!4438 (or (= lt!21402 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21405 (bvsdiv (bvmul lt!21402 lt!21405) lt!21402)))))

(assert (=> d!4438 (= lt!21405 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4438 (= lt!21402 ((_ sign_extend 32) (size!332 (buf!683 (_2!865 lt!21369)))))))

(assert (=> d!4438 (= lt!21404 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1800 (_2!865 lt!21369))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1795 (_2!865 lt!21369)))))))

(assert (=> d!4438 (invariant!0 (currentBit!1795 (_2!865 lt!21369)) (currentByte!1800 (_2!865 lt!21369)) (size!332 (buf!683 (_2!865 lt!21369))))))

(assert (=> d!4438 (= (bitIndex!0 (size!332 (buf!683 (_2!865 lt!21369))) (currentByte!1800 (_2!865 lt!21369)) (currentBit!1795 (_2!865 lt!21369))) lt!21404)))

(declare-fun b!13774 () Bool)

(declare-fun res!13065 () Bool)

(assert (=> b!13774 (=> (not res!13065) (not e!8460))))

(assert (=> b!13774 (= res!13065 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21404))))

(declare-fun b!13775 () Bool)

(declare-fun lt!21407 () (_ BitVec 64))

(assert (=> b!13775 (= e!8460 (bvsle lt!21404 (bvmul lt!21407 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!13775 (or (= lt!21407 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21407 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21407)))))

(assert (=> b!13775 (= lt!21407 ((_ sign_extend 32) (size!332 (buf!683 (_2!865 lt!21369)))))))

(assert (= (and d!4438 res!13064) b!13774))

(assert (= (and b!13774 res!13065) b!13775))

(declare-fun m!20343 () Bool)

(assert (=> d!4438 m!20343))

(assert (=> d!4438 m!20311))

(assert (=> b!13719 d!4438))

(declare-fun d!4442 () Bool)

(declare-fun e!8461 () Bool)

(assert (=> d!4442 e!8461))

(declare-fun res!13066 () Bool)

(assert (=> d!4442 (=> (not res!13066) (not e!8461))))

(declare-fun lt!21412 () (_ BitVec 64))

(declare-fun lt!21409 () (_ BitVec 64))

(declare-fun lt!21410 () (_ BitVec 64))

(assert (=> d!4442 (= res!13066 (= lt!21410 (bvsub lt!21409 lt!21412)))))

(assert (=> d!4442 (or (= (bvand lt!21409 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21412 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21409 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21409 lt!21412) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4442 (= lt!21412 (remainingBits!0 ((_ sign_extend 32) (size!332 (buf!683 thiss!957))) ((_ sign_extend 32) (currentByte!1800 thiss!957)) ((_ sign_extend 32) (currentBit!1795 thiss!957))))))

(declare-fun lt!21408 () (_ BitVec 64))

(declare-fun lt!21411 () (_ BitVec 64))

(assert (=> d!4442 (= lt!21409 (bvmul lt!21408 lt!21411))))

(assert (=> d!4442 (or (= lt!21408 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21411 (bvsdiv (bvmul lt!21408 lt!21411) lt!21408)))))

(assert (=> d!4442 (= lt!21411 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4442 (= lt!21408 ((_ sign_extend 32) (size!332 (buf!683 thiss!957))))))

(assert (=> d!4442 (= lt!21410 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1800 thiss!957)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1795 thiss!957))))))

(assert (=> d!4442 (invariant!0 (currentBit!1795 thiss!957) (currentByte!1800 thiss!957) (size!332 (buf!683 thiss!957)))))

(assert (=> d!4442 (= (bitIndex!0 (size!332 (buf!683 thiss!957)) (currentByte!1800 thiss!957) (currentBit!1795 thiss!957)) lt!21410)))

(declare-fun b!13776 () Bool)

(declare-fun res!13067 () Bool)

(assert (=> b!13776 (=> (not res!13067) (not e!8461))))

(assert (=> b!13776 (= res!13067 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21410))))

(declare-fun b!13777 () Bool)

(declare-fun lt!21413 () (_ BitVec 64))

(assert (=> b!13777 (= e!8461 (bvsle lt!21410 (bvmul lt!21413 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!13777 (or (= lt!21413 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21413 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21413)))))

(assert (=> b!13777 (= lt!21413 ((_ sign_extend 32) (size!332 (buf!683 thiss!957))))))

(assert (= (and d!4442 res!13066) b!13776))

(assert (= (and b!13776 res!13067) b!13777))

(declare-fun m!20345 () Bool)

(assert (=> d!4442 m!20345))

(declare-fun m!20347 () Bool)

(assert (=> d!4442 m!20347))

(assert (=> b!13719 d!4442))

(declare-fun d!4444 () Bool)

(assert (=> d!4444 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!332 (buf!683 thiss!957))) ((_ sign_extend 32) (currentByte!1800 thiss!957)) ((_ sign_extend 32) (currentBit!1795 thiss!957))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!332 (buf!683 thiss!957))) ((_ sign_extend 32) (currentByte!1800 thiss!957)) ((_ sign_extend 32) (currentBit!1795 thiss!957))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!1229 () Bool)

(assert (= bs!1229 d!4444))

(assert (=> bs!1229 m!20345))

(assert (=> start!2980 d!4444))

(declare-fun d!4448 () Bool)

(assert (=> d!4448 (= (inv!12 thiss!957) (invariant!0 (currentBit!1795 thiss!957) (currentByte!1800 thiss!957) (size!332 (buf!683 thiss!957))))))

(declare-fun bs!1231 () Bool)

(assert (= bs!1231 d!4448))

(assert (=> bs!1231 m!20347))

(assert (=> start!2980 d!4448))

(declare-fun d!4452 () Bool)

(assert (=> d!4452 (= (invariant!0 (currentBit!1795 (_2!865 lt!21369)) (currentByte!1800 (_2!865 lt!21369)) (size!332 (buf!683 (_2!865 lt!21369)))) (and (bvsge (currentBit!1795 (_2!865 lt!21369)) #b00000000000000000000000000000000) (bvslt (currentBit!1795 (_2!865 lt!21369)) #b00000000000000000000000000001000) (bvsge (currentByte!1800 (_2!865 lt!21369)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1800 (_2!865 lt!21369)) (size!332 (buf!683 (_2!865 lt!21369)))) (and (= (currentBit!1795 (_2!865 lt!21369)) #b00000000000000000000000000000000) (= (currentByte!1800 (_2!865 lt!21369)) (size!332 (buf!683 (_2!865 lt!21369))))))))))

(assert (=> b!13723 d!4452))

(declare-fun d!4454 () Bool)

(assert (=> d!4454 (= (array_inv!321 (buf!683 thiss!957)) (bvsge (size!332 (buf!683 thiss!957)) #b00000000000000000000000000000000))))

(assert (=> b!13722 d!4454))

(declare-fun d!4456 () Bool)

(declare-fun res!13082 () Bool)

(declare-fun e!8470 () Bool)

(assert (=> d!4456 (=> (not res!13082) (not e!8470))))

(assert (=> d!4456 (= res!13082 (= (size!332 (buf!683 thiss!957)) (size!332 (buf!683 (_2!865 lt!21369)))))))

(assert (=> d!4456 (= (isPrefixOf!0 thiss!957 (_2!865 lt!21369)) e!8470)))

(declare-fun b!13792 () Bool)

(declare-fun res!13083 () Bool)

(assert (=> b!13792 (=> (not res!13083) (not e!8470))))

(assert (=> b!13792 (= res!13083 (bvsle (bitIndex!0 (size!332 (buf!683 thiss!957)) (currentByte!1800 thiss!957) (currentBit!1795 thiss!957)) (bitIndex!0 (size!332 (buf!683 (_2!865 lt!21369))) (currentByte!1800 (_2!865 lt!21369)) (currentBit!1795 (_2!865 lt!21369)))))))

(declare-fun b!13793 () Bool)

(declare-fun e!8471 () Bool)

(assert (=> b!13793 (= e!8470 e!8471)))

(declare-fun res!13084 () Bool)

(assert (=> b!13793 (=> res!13084 e!8471)))

(assert (=> b!13793 (= res!13084 (= (size!332 (buf!683 thiss!957)) #b00000000000000000000000000000000))))

(declare-fun b!13794 () Bool)

(declare-fun arrayBitRangesEq!0 (array!770 array!770 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!13794 (= e!8471 (arrayBitRangesEq!0 (buf!683 thiss!957) (buf!683 (_2!865 lt!21369)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!332 (buf!683 thiss!957)) (currentByte!1800 thiss!957) (currentBit!1795 thiss!957))))))

(assert (= (and d!4456 res!13082) b!13792))

(assert (= (and b!13792 res!13083) b!13793))

(assert (= (and b!13793 (not res!13084)) b!13794))

(assert (=> b!13792 m!20303))

(assert (=> b!13792 m!20301))

(assert (=> b!13794 m!20303))

(assert (=> b!13794 m!20303))

(declare-fun m!20359 () Bool)

(assert (=> b!13794 m!20359))

(assert (=> b!13721 d!4456))

(declare-fun d!4462 () Bool)

(declare-fun e!8489 () Bool)

(assert (=> d!4462 e!8489))

(declare-fun res!13115 () Bool)

(assert (=> d!4462 (=> (not res!13115) (not e!8489))))

(declare-fun lt!21490 () tuple2!1620)

(assert (=> d!4462 (= res!13115 (= (size!332 (buf!683 thiss!957)) (size!332 (buf!683 (_2!865 lt!21490)))))))

(declare-fun choose!16 (BitStream!624 Bool) tuple2!1620)

(assert (=> d!4462 (= lt!21490 (choose!16 thiss!957 false))))

(assert (=> d!4462 (validate_offset_bit!0 ((_ sign_extend 32) (size!332 (buf!683 thiss!957))) ((_ sign_extend 32) (currentByte!1800 thiss!957)) ((_ sign_extend 32) (currentBit!1795 thiss!957)))))

(assert (=> d!4462 (= (appendBit!0 thiss!957 false) lt!21490)))

(declare-fun b!13829 () Bool)

(declare-fun e!8488 () Bool)

(declare-fun lt!21488 () tuple2!1622)

(assert (=> b!13829 (= e!8488 (= (bitIndex!0 (size!332 (buf!683 (_1!866 lt!21488))) (currentByte!1800 (_1!866 lt!21488)) (currentBit!1795 (_1!866 lt!21488))) (bitIndex!0 (size!332 (buf!683 (_2!865 lt!21490))) (currentByte!1800 (_2!865 lt!21490)) (currentBit!1795 (_2!865 lt!21490)))))))

(declare-fun b!13826 () Bool)

(declare-fun res!13116 () Bool)

(assert (=> b!13826 (=> (not res!13116) (not e!8489))))

(declare-fun lt!21487 () (_ BitVec 64))

(declare-fun lt!21489 () (_ BitVec 64))

(assert (=> b!13826 (= res!13116 (= (bitIndex!0 (size!332 (buf!683 (_2!865 lt!21490))) (currentByte!1800 (_2!865 lt!21490)) (currentBit!1795 (_2!865 lt!21490))) (bvadd lt!21489 lt!21487)))))

(assert (=> b!13826 (or (not (= (bvand lt!21489 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21487 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!21489 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!21489 lt!21487) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!13826 (= lt!21487 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!13826 (= lt!21489 (bitIndex!0 (size!332 (buf!683 thiss!957)) (currentByte!1800 thiss!957) (currentBit!1795 thiss!957)))))

(declare-fun b!13828 () Bool)

(assert (=> b!13828 (= e!8489 e!8488)))

(declare-fun res!13117 () Bool)

(assert (=> b!13828 (=> (not res!13117) (not e!8488))))

(assert (=> b!13828 (= res!13117 (and (= (_2!866 lt!21488) false) (= (_1!866 lt!21488) (_2!865 lt!21490))))))

(assert (=> b!13828 (= lt!21488 (readBitPure!0 (readerFrom!0 (_2!865 lt!21490) (currentBit!1795 thiss!957) (currentByte!1800 thiss!957))))))

(declare-fun b!13827 () Bool)

(declare-fun res!13118 () Bool)

(assert (=> b!13827 (=> (not res!13118) (not e!8489))))

(assert (=> b!13827 (= res!13118 (isPrefixOf!0 thiss!957 (_2!865 lt!21490)))))

(assert (= (and d!4462 res!13115) b!13826))

(assert (= (and b!13826 res!13116) b!13827))

(assert (= (and b!13827 res!13118) b!13828))

(assert (= (and b!13828 res!13117) b!13829))

(declare-fun m!20369 () Bool)

(assert (=> b!13826 m!20369))

(assert (=> b!13826 m!20303))

(declare-fun m!20371 () Bool)

(assert (=> b!13829 m!20371))

(assert (=> b!13829 m!20369))

(declare-fun m!20373 () Bool)

(assert (=> d!4462 m!20373))

(assert (=> d!4462 m!20293))

(declare-fun m!20375 () Bool)

(assert (=> b!13827 m!20375))

(declare-fun m!20377 () Bool)

(assert (=> b!13828 m!20377))

(assert (=> b!13828 m!20377))

(declare-fun m!20379 () Bool)

(assert (=> b!13828 m!20379))

(assert (=> b!13726 d!4462))

(assert (=> b!13725 d!4438))

(assert (=> b!13725 d!4442))

(declare-fun d!4480 () Bool)

(declare-datatypes ((tuple2!1628 0))(
  ( (tuple2!1629 (_1!869 Bool) (_2!869 BitStream!624)) )
))
(declare-fun lt!21497 () tuple2!1628)

(declare-fun readBit!0 (BitStream!624) tuple2!1628)

(assert (=> d!4480 (= lt!21497 (readBit!0 (readerFrom!0 (_2!865 lt!21369) (currentBit!1795 thiss!957) (currentByte!1800 thiss!957))))))

(assert (=> d!4480 (= (readBitPure!0 (readerFrom!0 (_2!865 lt!21369) (currentBit!1795 thiss!957) (currentByte!1800 thiss!957))) (tuple2!1623 (_2!869 lt!21497) (_1!869 lt!21497)))))

(declare-fun bs!1234 () Bool)

(assert (= bs!1234 d!4480))

(assert (=> bs!1234 m!20289))

(declare-fun m!20393 () Bool)

(assert (=> bs!1234 m!20393))

(assert (=> b!13724 d!4480))

(declare-fun d!4486 () Bool)

(declare-fun e!8497 () Bool)

(assert (=> d!4486 e!8497))

(declare-fun res!13132 () Bool)

(assert (=> d!4486 (=> (not res!13132) (not e!8497))))

(assert (=> d!4486 (= res!13132 (invariant!0 (currentBit!1795 (_2!865 lt!21369)) (currentByte!1800 (_2!865 lt!21369)) (size!332 (buf!683 (_2!865 lt!21369)))))))

(assert (=> d!4486 (= (readerFrom!0 (_2!865 lt!21369) (currentBit!1795 thiss!957) (currentByte!1800 thiss!957)) (BitStream!625 (buf!683 (_2!865 lt!21369)) (currentByte!1800 thiss!957) (currentBit!1795 thiss!957)))))

(declare-fun b!13841 () Bool)

(assert (=> b!13841 (= e!8497 (invariant!0 (currentBit!1795 thiss!957) (currentByte!1800 thiss!957) (size!332 (buf!683 (_2!865 lt!21369)))))))

(assert (= (and d!4486 res!13132) b!13841))

(assert (=> d!4486 m!20311))

(assert (=> b!13841 m!20307))

(assert (=> b!13724 d!4486))

(assert (=> b!13728 d!4456))

(declare-fun d!4494 () Bool)

(assert (=> d!4494 (= (invariant!0 (currentBit!1795 thiss!957) (currentByte!1800 thiss!957) (size!332 (buf!683 (_2!865 lt!21369)))) (and (bvsge (currentBit!1795 thiss!957) #b00000000000000000000000000000000) (bvslt (currentBit!1795 thiss!957) #b00000000000000000000000000001000) (bvsge (currentByte!1800 thiss!957) #b00000000000000000000000000000000) (or (bvslt (currentByte!1800 thiss!957) (size!332 (buf!683 (_2!865 lt!21369)))) (and (= (currentBit!1795 thiss!957) #b00000000000000000000000000000000) (= (currentByte!1800 thiss!957) (size!332 (buf!683 (_2!865 lt!21369))))))))))

(assert (=> b!13727 d!4494))

(check-sat (not b!13829) (not d!4448) (not b!13828) (not b!13841) (not b!13827) (not d!4480) (not d!4432) (not b!13794) (not d!4462) (not d!4444) (not b!13792) (not d!4442) (not d!4486) (not d!4438) (not b!13826))
