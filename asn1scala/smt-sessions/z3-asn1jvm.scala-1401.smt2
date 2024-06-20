; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38522 () Bool)

(assert start!38522)

(declare-fun b!173294 () Bool)

(declare-fun res!143538 () Bool)

(declare-fun e!120995 () Bool)

(assert (=> b!173294 (=> (not res!143538) (not e!120995))))

(declare-datatypes ((array!9328 0))(
  ( (array!9329 (arr!5048 (Array (_ BitVec 32) (_ BitVec 8))) (size!4118 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7344 0))(
  ( (BitStream!7345 (buf!4546 array!9328) (currentByte!8633 (_ BitVec 32)) (currentBit!8628 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7344)

(declare-datatypes ((Unit!12405 0))(
  ( (Unit!12406) )
))
(declare-datatypes ((tuple2!14924 0))(
  ( (tuple2!14925 (_1!8104 Unit!12405) (_2!8104 BitStream!7344)) )
))
(declare-fun lt!266696 () tuple2!14924)

(declare-fun isPrefixOf!0 (BitStream!7344 BitStream!7344) Bool)

(assert (=> b!173294 (= res!143538 (isPrefixOf!0 thiss!1187 (_2!8104 lt!266696)))))

(declare-fun b!173295 () Bool)

(declare-fun e!120997 () Bool)

(assert (=> b!173295 (= e!120997 e!120995)))

(declare-fun res!143543 () Bool)

(assert (=> b!173295 (=> (not res!143543) (not e!120995))))

(assert (=> b!173295 (= res!143543 (= (size!4118 (buf!4546 (_2!8104 lt!266696))) (size!4118 (buf!4546 thiss!1187))))))

(declare-fun nBits!340 () (_ BitVec 32))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7344 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!14924)

(assert (=> b!173295 (= lt!266696 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(declare-fun b!173296 () Bool)

(declare-datatypes ((tuple2!14926 0))(
  ( (tuple2!14927 (_1!8105 BitStream!7344) (_2!8105 BitStream!7344)) )
))
(declare-fun lt!266694 () tuple2!14926)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!173296 (= e!120995 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4118 (buf!4546 (_1!8105 lt!266694)))) ((_ sign_extend 32) (currentByte!8633 (_1!8105 lt!266694))) ((_ sign_extend 32) (currentBit!8628 (_1!8105 lt!266694))) ((_ sign_extend 32) nBits!340))))))

(assert (=> b!173296 (validate_offset_bits!1 ((_ sign_extend 32) (size!4118 (buf!4546 (_2!8104 lt!266696)))) ((_ sign_extend 32) (currentByte!8633 thiss!1187)) ((_ sign_extend 32) (currentBit!8628 thiss!1187)) ((_ sign_extend 32) nBits!340))))

(declare-fun lt!266695 () Unit!12405)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7344 array!9328 (_ BitVec 64)) Unit!12405)

(assert (=> b!173296 (= lt!266695 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4546 (_2!8104 lt!266696)) ((_ sign_extend 32) nBits!340)))))

(declare-fun reader!0 (BitStream!7344 BitStream!7344) tuple2!14926)

(assert (=> b!173296 (= lt!266694 (reader!0 thiss!1187 (_2!8104 lt!266696)))))

(declare-fun b!173297 () Bool)

(declare-fun res!143544 () Bool)

(assert (=> b!173297 (=> (not res!143544) (not e!120997))))

(assert (=> b!173297 (= res!143544 (validate_offset_bits!1 ((_ sign_extend 32) (size!4118 (buf!4546 thiss!1187))) ((_ sign_extend 32) (currentByte!8633 thiss!1187)) ((_ sign_extend 32) (currentBit!8628 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun b!173298 () Bool)

(declare-fun e!120994 () Bool)

(declare-fun array_inv!3859 (array!9328) Bool)

(assert (=> b!173298 (= e!120994 (array_inv!3859 (buf!4546 thiss!1187)))))

(declare-fun b!173299 () Bool)

(declare-fun res!143541 () Bool)

(assert (=> b!173299 (=> (not res!143541) (not e!120997))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!173299 (= res!143541 (invariant!0 (currentBit!8628 thiss!1187) (currentByte!8633 thiss!1187) (size!4118 (buf!4546 thiss!1187))))))

(declare-fun res!143540 () Bool)

(assert (=> start!38522 (=> (not res!143540) (not e!120997))))

(assert (=> start!38522 (= res!143540 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38522 e!120997))

(assert (=> start!38522 true))

(declare-fun inv!12 (BitStream!7344) Bool)

(assert (=> start!38522 (and (inv!12 thiss!1187) e!120994)))

(declare-fun b!173300 () Bool)

(declare-fun res!143542 () Bool)

(assert (=> b!173300 (=> (not res!143542) (not e!120995))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!173300 (= res!143542 (= (bitIndex!0 (size!4118 (buf!4546 (_2!8104 lt!266696))) (currentByte!8633 (_2!8104 lt!266696)) (currentBit!8628 (_2!8104 lt!266696))) (bvadd (bitIndex!0 (size!4118 (buf!4546 thiss!1187)) (currentByte!8633 thiss!1187) (currentBit!8628 thiss!1187)) ((_ sign_extend 32) nBits!340))))))

(declare-fun b!173301 () Bool)

(declare-fun res!143539 () Bool)

(assert (=> b!173301 (=> (not res!143539) (not e!120995))))

(assert (=> b!173301 (= res!143539 (= (size!4118 (buf!4546 thiss!1187)) (size!4118 (buf!4546 (_2!8104 lt!266696)))))))

(assert (= (and start!38522 res!143540) b!173297))

(assert (= (and b!173297 res!143544) b!173299))

(assert (= (and b!173299 res!143541) b!173295))

(assert (= (and b!173295 res!143543) b!173300))

(assert (= (and b!173300 res!143542) b!173301))

(assert (= (and b!173301 res!143539) b!173294))

(assert (= (and b!173294 res!143538) b!173296))

(assert (= start!38522 b!173298))

(declare-fun m!272385 () Bool)

(assert (=> b!173297 m!272385))

(declare-fun m!272387 () Bool)

(assert (=> b!173295 m!272387))

(declare-fun m!272389 () Bool)

(assert (=> b!173296 m!272389))

(declare-fun m!272391 () Bool)

(assert (=> b!173296 m!272391))

(declare-fun m!272393 () Bool)

(assert (=> b!173296 m!272393))

(declare-fun m!272395 () Bool)

(assert (=> b!173296 m!272395))

(declare-fun m!272397 () Bool)

(assert (=> start!38522 m!272397))

(declare-fun m!272399 () Bool)

(assert (=> b!173299 m!272399))

(declare-fun m!272401 () Bool)

(assert (=> b!173300 m!272401))

(declare-fun m!272403 () Bool)

(assert (=> b!173300 m!272403))

(declare-fun m!272405 () Bool)

(assert (=> b!173298 m!272405))

(declare-fun m!272407 () Bool)

(assert (=> b!173294 m!272407))

(check-sat (not b!173294) (not b!173297) (not b!173299) (not b!173298) (not start!38522) (not b!173295) (not b!173296) (not b!173300))
(check-sat)
(get-model)

(declare-fun d!61223 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!61223 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4118 (buf!4546 thiss!1187))) ((_ sign_extend 32) (currentByte!8633 thiss!1187)) ((_ sign_extend 32) (currentBit!8628 thiss!1187)) ((_ sign_extend 32) nBits!340)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4118 (buf!4546 thiss!1187))) ((_ sign_extend 32) (currentByte!8633 thiss!1187)) ((_ sign_extend 32) (currentBit!8628 thiss!1187))) ((_ sign_extend 32) nBits!340)))))

(declare-fun bs!15250 () Bool)

(assert (= bs!15250 d!61223))

(declare-fun m!272439 () Bool)

(assert (=> bs!15250 m!272439))

(assert (=> b!173297 d!61223))

(declare-fun d!61225 () Bool)

(assert (=> d!61225 (= (array_inv!3859 (buf!4546 thiss!1187)) (bvsge (size!4118 (buf!4546 thiss!1187)) #b00000000000000000000000000000000))))

(assert (=> b!173298 d!61225))

(declare-fun d!61227 () Bool)

(assert (=> d!61227 (= (invariant!0 (currentBit!8628 thiss!1187) (currentByte!8633 thiss!1187) (size!4118 (buf!4546 thiss!1187))) (and (bvsge (currentBit!8628 thiss!1187) #b00000000000000000000000000000000) (bvslt (currentBit!8628 thiss!1187) #b00000000000000000000000000001000) (bvsge (currentByte!8633 thiss!1187) #b00000000000000000000000000000000) (or (bvslt (currentByte!8633 thiss!1187) (size!4118 (buf!4546 thiss!1187))) (and (= (currentBit!8628 thiss!1187) #b00000000000000000000000000000000) (= (currentByte!8633 thiss!1187) (size!4118 (buf!4546 thiss!1187)))))))))

(assert (=> b!173299 d!61227))

(declare-fun d!61231 () Bool)

(assert (=> d!61231 (= (inv!12 thiss!1187) (invariant!0 (currentBit!8628 thiss!1187) (currentByte!8633 thiss!1187) (size!4118 (buf!4546 thiss!1187))))))

(declare-fun bs!15251 () Bool)

(assert (= bs!15251 d!61231))

(assert (=> bs!15251 m!272399))

(assert (=> start!38522 d!61231))

(declare-fun d!61235 () Bool)

(declare-fun res!143591 () Bool)

(declare-fun e!121024 () Bool)

(assert (=> d!61235 (=> (not res!143591) (not e!121024))))

(assert (=> d!61235 (= res!143591 (= (size!4118 (buf!4546 thiss!1187)) (size!4118 (buf!4546 (_2!8104 lt!266696)))))))

(assert (=> d!61235 (= (isPrefixOf!0 thiss!1187 (_2!8104 lt!266696)) e!121024)))

(declare-fun b!173349 () Bool)

(declare-fun res!143590 () Bool)

(assert (=> b!173349 (=> (not res!143590) (not e!121024))))

(assert (=> b!173349 (= res!143590 (bvsle (bitIndex!0 (size!4118 (buf!4546 thiss!1187)) (currentByte!8633 thiss!1187) (currentBit!8628 thiss!1187)) (bitIndex!0 (size!4118 (buf!4546 (_2!8104 lt!266696))) (currentByte!8633 (_2!8104 lt!266696)) (currentBit!8628 (_2!8104 lt!266696)))))))

(declare-fun b!173350 () Bool)

(declare-fun e!121025 () Bool)

(assert (=> b!173350 (= e!121024 e!121025)))

(declare-fun res!143589 () Bool)

(assert (=> b!173350 (=> res!143589 e!121025)))

(assert (=> b!173350 (= res!143589 (= (size!4118 (buf!4546 thiss!1187)) #b00000000000000000000000000000000))))

(declare-fun b!173351 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9328 array!9328 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!173351 (= e!121025 (arrayBitRangesEq!0 (buf!4546 thiss!1187) (buf!4546 (_2!8104 lt!266696)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4118 (buf!4546 thiss!1187)) (currentByte!8633 thiss!1187) (currentBit!8628 thiss!1187))))))

(assert (= (and d!61235 res!143591) b!173349))

(assert (= (and b!173349 res!143590) b!173350))

(assert (= (and b!173350 (not res!143589)) b!173351))

(assert (=> b!173349 m!272403))

(assert (=> b!173349 m!272401))

(assert (=> b!173351 m!272403))

(assert (=> b!173351 m!272403))

(declare-fun m!272449 () Bool)

(assert (=> b!173351 m!272449))

(assert (=> b!173294 d!61235))

(declare-fun d!61243 () Bool)

(declare-fun e!121030 () Bool)

(assert (=> d!61243 e!121030))

(declare-fun res!143596 () Bool)

(assert (=> d!61243 (=> (not res!143596) (not e!121030))))

(declare-fun lt!266776 () (_ BitVec 64))

(declare-fun lt!266778 () (_ BitVec 64))

(declare-fun lt!266777 () (_ BitVec 64))

(assert (=> d!61243 (= res!143596 (= lt!266777 (bvsub lt!266778 lt!266776)))))

(assert (=> d!61243 (or (= (bvand lt!266778 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!266776 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!266778 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!266778 lt!266776) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61243 (= lt!266776 (remainingBits!0 ((_ sign_extend 32) (size!4118 (buf!4546 (_2!8104 lt!266696)))) ((_ sign_extend 32) (currentByte!8633 (_2!8104 lt!266696))) ((_ sign_extend 32) (currentBit!8628 (_2!8104 lt!266696)))))))

(declare-fun lt!266775 () (_ BitVec 64))

(declare-fun lt!266773 () (_ BitVec 64))

(assert (=> d!61243 (= lt!266778 (bvmul lt!266775 lt!266773))))

(assert (=> d!61243 (or (= lt!266775 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!266773 (bvsdiv (bvmul lt!266775 lt!266773) lt!266775)))))

(assert (=> d!61243 (= lt!266773 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61243 (= lt!266775 ((_ sign_extend 32) (size!4118 (buf!4546 (_2!8104 lt!266696)))))))

(assert (=> d!61243 (= lt!266777 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8633 (_2!8104 lt!266696))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8628 (_2!8104 lt!266696)))))))

(assert (=> d!61243 (invariant!0 (currentBit!8628 (_2!8104 lt!266696)) (currentByte!8633 (_2!8104 lt!266696)) (size!4118 (buf!4546 (_2!8104 lt!266696))))))

(assert (=> d!61243 (= (bitIndex!0 (size!4118 (buf!4546 (_2!8104 lt!266696))) (currentByte!8633 (_2!8104 lt!266696)) (currentBit!8628 (_2!8104 lt!266696))) lt!266777)))

(declare-fun b!173360 () Bool)

(declare-fun res!143597 () Bool)

(assert (=> b!173360 (=> (not res!143597) (not e!121030))))

(assert (=> b!173360 (= res!143597 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!266777))))

(declare-fun b!173361 () Bool)

(declare-fun lt!266774 () (_ BitVec 64))

(assert (=> b!173361 (= e!121030 (bvsle lt!266777 (bvmul lt!266774 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!173361 (or (= lt!266774 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!266774 #b0000000000000000000000000000000000000000000000000000000000001000) lt!266774)))))

(assert (=> b!173361 (= lt!266774 ((_ sign_extend 32) (size!4118 (buf!4546 (_2!8104 lt!266696)))))))

(assert (= (and d!61243 res!143596) b!173360))

(assert (= (and b!173360 res!143597) b!173361))

(declare-fun m!272451 () Bool)

(assert (=> d!61243 m!272451))

(declare-fun m!272453 () Bool)

(assert (=> d!61243 m!272453))

(assert (=> b!173300 d!61243))

(declare-fun d!61245 () Bool)

(declare-fun e!121033 () Bool)

(assert (=> d!61245 e!121033))

(declare-fun res!143604 () Bool)

(assert (=> d!61245 (=> (not res!143604) (not e!121033))))

(declare-fun lt!266794 () (_ BitVec 64))

(declare-fun lt!266796 () (_ BitVec 64))

(declare-fun lt!266795 () (_ BitVec 64))

(assert (=> d!61245 (= res!143604 (= lt!266795 (bvsub lt!266796 lt!266794)))))

(assert (=> d!61245 (or (= (bvand lt!266796 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!266794 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!266796 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!266796 lt!266794) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61245 (= lt!266794 (remainingBits!0 ((_ sign_extend 32) (size!4118 (buf!4546 thiss!1187))) ((_ sign_extend 32) (currentByte!8633 thiss!1187)) ((_ sign_extend 32) (currentBit!8628 thiss!1187))))))

(declare-fun lt!266793 () (_ BitVec 64))

(declare-fun lt!266791 () (_ BitVec 64))

(assert (=> d!61245 (= lt!266796 (bvmul lt!266793 lt!266791))))

(assert (=> d!61245 (or (= lt!266793 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!266791 (bvsdiv (bvmul lt!266793 lt!266791) lt!266793)))))

(assert (=> d!61245 (= lt!266791 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61245 (= lt!266793 ((_ sign_extend 32) (size!4118 (buf!4546 thiss!1187))))))

(assert (=> d!61245 (= lt!266795 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8633 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8628 thiss!1187))))))

(assert (=> d!61245 (invariant!0 (currentBit!8628 thiss!1187) (currentByte!8633 thiss!1187) (size!4118 (buf!4546 thiss!1187)))))

(assert (=> d!61245 (= (bitIndex!0 (size!4118 (buf!4546 thiss!1187)) (currentByte!8633 thiss!1187) (currentBit!8628 thiss!1187)) lt!266795)))

(declare-fun b!173368 () Bool)

(declare-fun res!143605 () Bool)

(assert (=> b!173368 (=> (not res!143605) (not e!121033))))

(assert (=> b!173368 (= res!143605 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!266795))))

(declare-fun b!173369 () Bool)

(declare-fun lt!266792 () (_ BitVec 64))

(assert (=> b!173369 (= e!121033 (bvsle lt!266795 (bvmul lt!266792 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!173369 (or (= lt!266792 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!266792 #b0000000000000000000000000000000000000000000000000000000000001000) lt!266792)))))

(assert (=> b!173369 (= lt!266792 ((_ sign_extend 32) (size!4118 (buf!4546 thiss!1187))))))

(assert (= (and d!61245 res!143604) b!173368))

(assert (= (and b!173368 res!143605) b!173369))

(assert (=> d!61245 m!272439))

(assert (=> d!61245 m!272399))

(assert (=> b!173300 d!61245))

(declare-fun b!173535 () Bool)

(declare-fun e!121129 () Bool)

(declare-datatypes ((tuple2!14940 0))(
  ( (tuple2!14941 (_1!8112 BitStream!7344) (_2!8112 (_ BitVec 64))) )
))
(declare-fun lt!267363 () tuple2!14940)

(declare-fun lt!267358 () tuple2!14926)

(assert (=> b!173535 (= e!121129 (= (_1!8112 lt!267363) (_2!8105 lt!267358)))))

(declare-fun b!173536 () Bool)

(declare-fun res!143737 () Bool)

(declare-fun lt!267375 () tuple2!14924)

(assert (=> b!173536 (= res!143737 (= (bitIndex!0 (size!4118 (buf!4546 (_2!8104 lt!267375))) (currentByte!8633 (_2!8104 lt!267375)) (currentBit!8628 (_2!8104 lt!267375))) (bvadd (bitIndex!0 (size!4118 (buf!4546 thiss!1187)) (currentByte!8633 thiss!1187) (currentBit!8628 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!121124 () Bool)

(assert (=> b!173536 (=> (not res!143737) (not e!121124))))

(declare-fun b!173537 () Bool)

(declare-fun e!121125 () (_ BitVec 64))

(assert (=> b!173537 (= e!121125 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!173538 () Bool)

(declare-fun e!121128 () Bool)

(declare-fun lt!267365 () (_ BitVec 64))

(assert (=> b!173538 (= e!121128 (validate_offset_bits!1 ((_ sign_extend 32) (size!4118 (buf!4546 thiss!1187))) ((_ sign_extend 32) (currentByte!8633 thiss!1187)) ((_ sign_extend 32) (currentBit!8628 thiss!1187)) lt!267365))))

(declare-fun b!173539 () Bool)

(assert (=> b!173539 (= e!121125 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun b!173540 () Bool)

(declare-fun res!143732 () Bool)

(declare-fun e!121127 () Bool)

(assert (=> b!173540 (=> (not res!143732) (not e!121127))))

(declare-fun lt!267396 () tuple2!14924)

(declare-fun lt!267406 () (_ BitVec 64))

(declare-fun lt!267389 () (_ BitVec 64))

(assert (=> b!173540 (= res!143732 (= (bitIndex!0 (size!4118 (buf!4546 (_2!8104 lt!267396))) (currentByte!8633 (_2!8104 lt!267396)) (currentBit!8628 (_2!8104 lt!267396))) (bvsub lt!267389 lt!267406)))))

(assert (=> b!173540 (or (= (bvand lt!267389 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!267406 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!267389 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!267389 lt!267406) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!173540 (= lt!267406 ((_ sign_extend 32) #b00000000000000000000000000000000))))

(declare-fun lt!267403 () (_ BitVec 64))

(declare-fun lt!267357 () (_ BitVec 64))

(assert (=> b!173540 (= lt!267389 (bvadd lt!267403 lt!267357))))

(assert (=> b!173540 (or (not (= (bvand lt!267403 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!267357 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!267403 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!267403 lt!267357) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!173540 (= lt!267357 ((_ sign_extend 32) nBits!340))))

(assert (=> b!173540 (= lt!267403 (bitIndex!0 (size!4118 (buf!4546 thiss!1187)) (currentByte!8633 thiss!1187) (currentBit!8628 thiss!1187)))))

(declare-fun b!173541 () Bool)

(declare-fun e!121131 () tuple2!14924)

(declare-fun lt!267383 () tuple2!14924)

(assert (=> b!173541 (= e!121131 (tuple2!14925 (_1!8104 lt!267383) (_2!8104 lt!267383)))))

(declare-fun lt!267366 () Bool)

(assert (=> b!173541 (= lt!267366 (not (= (bvand v!186 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun appendBit!0 (BitStream!7344 Bool) tuple2!14924)

(assert (=> b!173541 (= lt!267375 (appendBit!0 thiss!1187 lt!267366))))

(declare-fun res!143738 () Bool)

(assert (=> b!173541 (= res!143738 (= (size!4118 (buf!4546 thiss!1187)) (size!4118 (buf!4546 (_2!8104 lt!267375)))))))

(assert (=> b!173541 (=> (not res!143738) (not e!121124))))

(assert (=> b!173541 e!121124))

(declare-fun lt!267379 () tuple2!14924)

(assert (=> b!173541 (= lt!267379 lt!267375)))

(assert (=> b!173541 (= lt!267383 (appendBitsLSBFirstLoopTR!0 (_2!8104 lt!267379) v!186 nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!267391 () Unit!12405)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7344 BitStream!7344 BitStream!7344) Unit!12405)

(assert (=> b!173541 (= lt!267391 (lemmaIsPrefixTransitive!0 thiss!1187 (_2!8104 lt!267379) (_2!8104 lt!267383)))))

(assert (=> b!173541 (isPrefixOf!0 thiss!1187 (_2!8104 lt!267383))))

(declare-fun lt!267355 () Unit!12405)

(assert (=> b!173541 (= lt!267355 lt!267391)))

(assert (=> b!173541 (invariant!0 (currentBit!8628 thiss!1187) (currentByte!8633 thiss!1187) (size!4118 (buf!4546 (_2!8104 lt!267379))))))

(declare-fun lt!267388 () BitStream!7344)

(assert (=> b!173541 (= lt!267388 (BitStream!7345 (buf!4546 (_2!8104 lt!267379)) (currentByte!8633 thiss!1187) (currentBit!8628 thiss!1187)))))

(assert (=> b!173541 (invariant!0 (currentBit!8628 lt!267388) (currentByte!8633 lt!267388) (size!4118 (buf!4546 (_2!8104 lt!267383))))))

(declare-fun lt!267372 () BitStream!7344)

(assert (=> b!173541 (= lt!267372 (BitStream!7345 (buf!4546 (_2!8104 lt!267383)) (currentByte!8633 lt!267388) (currentBit!8628 lt!267388)))))

(declare-datatypes ((tuple2!14942 0))(
  ( (tuple2!14943 (_1!8113 BitStream!7344) (_2!8113 Bool)) )
))
(declare-fun lt!267402 () tuple2!14942)

(declare-fun readBitPure!0 (BitStream!7344) tuple2!14942)

(assert (=> b!173541 (= lt!267402 (readBitPure!0 lt!267388))))

(declare-fun lt!267352 () tuple2!14942)

(assert (=> b!173541 (= lt!267352 (readBitPure!0 lt!267372))))

(declare-fun lt!267369 () Unit!12405)

(declare-fun readBitPrefixLemma!0 (BitStream!7344 BitStream!7344) Unit!12405)

(assert (=> b!173541 (= lt!267369 (readBitPrefixLemma!0 lt!267388 (_2!8104 lt!267383)))))

(declare-fun res!143735 () Bool)

(assert (=> b!173541 (= res!143735 (= (bitIndex!0 (size!4118 (buf!4546 (_1!8113 lt!267402))) (currentByte!8633 (_1!8113 lt!267402)) (currentBit!8628 (_1!8113 lt!267402))) (bitIndex!0 (size!4118 (buf!4546 (_1!8113 lt!267352))) (currentByte!8633 (_1!8113 lt!267352)) (currentBit!8628 (_1!8113 lt!267352)))))))

(declare-fun e!121130 () Bool)

(assert (=> b!173541 (=> (not res!143735) (not e!121130))))

(assert (=> b!173541 e!121130))

(declare-fun lt!267364 () Unit!12405)

(assert (=> b!173541 (= lt!267364 lt!267369)))

(declare-fun lt!267400 () tuple2!14926)

(assert (=> b!173541 (= lt!267400 (reader!0 thiss!1187 (_2!8104 lt!267383)))))

(declare-fun lt!267405 () tuple2!14926)

(assert (=> b!173541 (= lt!267405 (reader!0 (_2!8104 lt!267379) (_2!8104 lt!267383)))))

(declare-fun lt!267374 () tuple2!14942)

(assert (=> b!173541 (= lt!267374 (readBitPure!0 (_1!8105 lt!267400)))))

(assert (=> b!173541 (= (_2!8113 lt!267374) lt!267366)))

(declare-fun lt!267384 () Unit!12405)

(declare-fun Unit!12433 () Unit!12405)

(assert (=> b!173541 (= lt!267384 Unit!12433)))

(declare-fun lt!267373 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!173541 (= lt!267373 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000)))))

(declare-fun lt!267386 () (_ BitVec 64))

(assert (=> b!173541 (= lt!267386 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(declare-fun lt!267359 () Unit!12405)

(assert (=> b!173541 (= lt!267359 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4546 (_2!8104 lt!267383)) lt!267386))))

(assert (=> b!173541 (validate_offset_bits!1 ((_ sign_extend 32) (size!4118 (buf!4546 (_2!8104 lt!267383)))) ((_ sign_extend 32) (currentByte!8633 thiss!1187)) ((_ sign_extend 32) (currentBit!8628 thiss!1187)) lt!267386)))

(declare-fun lt!267390 () Unit!12405)

(assert (=> b!173541 (= lt!267390 lt!267359)))

(declare-fun lt!267356 () tuple2!14940)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7344 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!14940)

(assert (=> b!173541 (= lt!267356 (readNBitsLSBFirstsLoopPure!0 (_1!8105 lt!267400) nBits!340 #b00000000000000000000000000000000 lt!267373))))

(declare-fun lt!267378 () (_ BitVec 64))

(assert (=> b!173541 (= lt!267378 ((_ sign_extend 32) (bvsub (bvsub nBits!340 #b00000000000000000000000000000000) #b00000000000000000000000000000001)))))

(declare-fun lt!267360 () Unit!12405)

(assert (=> b!173541 (= lt!267360 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8104 lt!267379) (buf!4546 (_2!8104 lt!267383)) lt!267378))))

(assert (=> b!173541 (validate_offset_bits!1 ((_ sign_extend 32) (size!4118 (buf!4546 (_2!8104 lt!267383)))) ((_ sign_extend 32) (currentByte!8633 (_2!8104 lt!267379))) ((_ sign_extend 32) (currentBit!8628 (_2!8104 lt!267379))) lt!267378)))

(declare-fun lt!267370 () Unit!12405)

(assert (=> b!173541 (= lt!267370 lt!267360)))

(declare-fun lt!267377 () tuple2!14940)

(assert (=> b!173541 (= lt!267377 (readNBitsLSBFirstsLoopPure!0 (_1!8105 lt!267405) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!267373 (ite (_2!8113 lt!267374) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!267371 () tuple2!14940)

(assert (=> b!173541 (= lt!267371 (readNBitsLSBFirstsLoopPure!0 (_1!8105 lt!267400) nBits!340 #b00000000000000000000000000000000 lt!267373))))

(declare-fun c!9129 () Bool)

(assert (=> b!173541 (= c!9129 (_2!8113 (readBitPure!0 (_1!8105 lt!267400))))))

(declare-fun lt!267367 () tuple2!14940)

(declare-fun withMovedBitIndex!0 (BitStream!7344 (_ BitVec 64)) BitStream!7344)

(assert (=> b!173541 (= lt!267367 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8105 lt!267400) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!267373 e!121125)))))

(declare-fun lt!267362 () Unit!12405)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7344 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!12405)

(assert (=> b!173541 (= lt!267362 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8105 lt!267400) nBits!340 #b00000000000000000000000000000000 lt!267373))))

(assert (=> b!173541 (and (= (_2!8112 lt!267371) (_2!8112 lt!267367)) (= (_1!8112 lt!267371) (_1!8112 lt!267367)))))

(declare-fun lt!267407 () Unit!12405)

(assert (=> b!173541 (= lt!267407 lt!267362)))

(assert (=> b!173541 (= (_1!8105 lt!267400) (withMovedBitIndex!0 (_2!8105 lt!267400) (bvsub (bitIndex!0 (size!4118 (buf!4546 thiss!1187)) (currentByte!8633 thiss!1187) (currentBit!8628 thiss!1187)) (bitIndex!0 (size!4118 (buf!4546 (_2!8104 lt!267383))) (currentByte!8633 (_2!8104 lt!267383)) (currentBit!8628 (_2!8104 lt!267383))))))))

(declare-fun lt!267392 () Unit!12405)

(declare-fun Unit!12434 () Unit!12405)

(assert (=> b!173541 (= lt!267392 Unit!12434)))

(assert (=> b!173541 (= (_1!8105 lt!267405) (withMovedBitIndex!0 (_2!8105 lt!267405) (bvsub (bitIndex!0 (size!4118 (buf!4546 (_2!8104 lt!267379))) (currentByte!8633 (_2!8104 lt!267379)) (currentBit!8628 (_2!8104 lt!267379))) (bitIndex!0 (size!4118 (buf!4546 (_2!8104 lt!267383))) (currentByte!8633 (_2!8104 lt!267383)) (currentBit!8628 (_2!8104 lt!267383))))))))

(declare-fun lt!267385 () Unit!12405)

(declare-fun Unit!12435 () Unit!12405)

(assert (=> b!173541 (= lt!267385 Unit!12435)))

(assert (=> b!173541 (= (bitIndex!0 (size!4118 (buf!4546 thiss!1187)) (currentByte!8633 thiss!1187) (currentBit!8628 thiss!1187)) (bvsub (bitIndex!0 (size!4118 (buf!4546 (_2!8104 lt!267379))) (currentByte!8633 (_2!8104 lt!267379)) (currentBit!8628 (_2!8104 lt!267379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!267395 () Unit!12405)

(declare-fun Unit!12436 () Unit!12405)

(assert (=> b!173541 (= lt!267395 Unit!12436)))

(assert (=> b!173541 (= (_2!8112 lt!267356) (_2!8112 lt!267377))))

(declare-fun lt!267368 () Unit!12405)

(declare-fun Unit!12437 () Unit!12405)

(assert (=> b!173541 (= lt!267368 Unit!12437)))

(assert (=> b!173541 (invariant!0 (currentBit!8628 (_2!8104 lt!267383)) (currentByte!8633 (_2!8104 lt!267383)) (size!4118 (buf!4546 (_2!8104 lt!267383))))))

(declare-fun lt!267398 () Unit!12405)

(declare-fun Unit!12438 () Unit!12405)

(assert (=> b!173541 (= lt!267398 Unit!12438)))

(assert (=> b!173541 (= (size!4118 (buf!4546 thiss!1187)) (size!4118 (buf!4546 (_2!8104 lt!267383))))))

(declare-fun lt!267376 () Unit!12405)

(declare-fun Unit!12439 () Unit!12405)

(assert (=> b!173541 (= lt!267376 Unit!12439)))

(assert (=> b!173541 (= (bitIndex!0 (size!4118 (buf!4546 (_2!8104 lt!267383))) (currentByte!8633 (_2!8104 lt!267383)) (currentBit!8628 (_2!8104 lt!267383))) (bvsub (bvadd (bitIndex!0 (size!4118 (buf!4546 thiss!1187)) (currentByte!8633 thiss!1187) (currentBit!8628 thiss!1187)) ((_ sign_extend 32) nBits!340)) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun lt!267361 () Unit!12405)

(declare-fun Unit!12440 () Unit!12405)

(assert (=> b!173541 (= lt!267361 Unit!12440)))

(declare-fun lt!267353 () Unit!12405)

(declare-fun Unit!12441 () Unit!12405)

(assert (=> b!173541 (= lt!267353 Unit!12441)))

(assert (=> b!173541 (= lt!267358 (reader!0 thiss!1187 (_2!8104 lt!267383)))))

(declare-fun lt!267393 () (_ BitVec 64))

(assert (=> b!173541 (= lt!267393 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(declare-fun lt!267401 () Unit!12405)

(assert (=> b!173541 (= lt!267401 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4546 (_2!8104 lt!267383)) lt!267393))))

(assert (=> b!173541 (validate_offset_bits!1 ((_ sign_extend 32) (size!4118 (buf!4546 (_2!8104 lt!267383)))) ((_ sign_extend 32) (currentByte!8633 thiss!1187)) ((_ sign_extend 32) (currentBit!8628 thiss!1187)) lt!267393)))

(declare-fun lt!267381 () Unit!12405)

(assert (=> b!173541 (= lt!267381 lt!267401)))

(assert (=> b!173541 (= lt!267363 (readNBitsLSBFirstsLoopPure!0 (_1!8105 lt!267358) nBits!340 #b00000000000000000000000000000000 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(declare-fun res!143736 () Bool)

(assert (=> b!173541 (= res!143736 (= (_2!8112 lt!267363) (bvand v!186 (onesLSBLong!0 nBits!340))))))

(assert (=> b!173541 (=> (not res!143736) (not e!121129))))

(assert (=> b!173541 e!121129))

(declare-fun lt!267354 () Unit!12405)

(declare-fun Unit!12442 () Unit!12405)

(assert (=> b!173541 (= lt!267354 Unit!12442)))

(declare-fun c!9128 () Bool)

(declare-fun call!2867 () Bool)

(declare-fun bm!2864 () Bool)

(assert (=> bm!2864 (= call!2867 (isPrefixOf!0 thiss!1187 (ite c!9128 thiss!1187 (_2!8104 lt!267375))))))

(declare-fun b!173542 () Bool)

(declare-fun res!143741 () Bool)

(assert (=> b!173542 (=> (not res!143741) (not e!121127))))

(assert (=> b!173542 (= res!143741 (isPrefixOf!0 thiss!1187 (_2!8104 lt!267396)))))

(declare-fun b!173544 () Bool)

(declare-fun lt!267404 () tuple2!14942)

(declare-fun readerFrom!0 (BitStream!7344 (_ BitVec 32) (_ BitVec 32)) BitStream!7344)

(assert (=> b!173544 (= lt!267404 (readBitPure!0 (readerFrom!0 (_2!8104 lt!267375) (currentBit!8628 thiss!1187) (currentByte!8633 thiss!1187))))))

(declare-fun res!143742 () Bool)

(assert (=> b!173544 (= res!143742 (and (= (_2!8113 lt!267404) lt!267366) (= (_1!8113 lt!267404) (_2!8104 lt!267375))))))

(declare-fun e!121132 () Bool)

(assert (=> b!173544 (=> (not res!143742) (not e!121132))))

(assert (=> b!173544 (= e!121124 e!121132)))

(declare-fun b!173545 () Bool)

(assert (=> b!173545 (= e!121132 (= (bitIndex!0 (size!4118 (buf!4546 (_1!8113 lt!267404))) (currentByte!8633 (_1!8113 lt!267404)) (currentBit!8628 (_1!8113 lt!267404))) (bitIndex!0 (size!4118 (buf!4546 (_2!8104 lt!267375))) (currentByte!8633 (_2!8104 lt!267375)) (currentBit!8628 (_2!8104 lt!267375)))))))

(declare-fun b!173546 () Bool)

(assert (=> b!173546 (= e!121130 (= (_2!8113 lt!267402) (_2!8113 lt!267352)))))

(declare-fun b!173547 () Bool)

(declare-fun Unit!12443 () Unit!12405)

(assert (=> b!173547 (= e!121131 (tuple2!14925 Unit!12443 thiss!1187))))

(declare-fun lt!267380 () Unit!12405)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7344) Unit!12405)

(assert (=> b!173547 (= lt!267380 (lemmaIsPrefixRefl!0 thiss!1187))))

(assert (=> b!173547 call!2867))

(declare-fun lt!267382 () Unit!12405)

(assert (=> b!173547 (= lt!267382 lt!267380)))

(declare-fun d!61247 () Bool)

(assert (=> d!61247 e!121127))

(declare-fun res!143734 () Bool)

(assert (=> d!61247 (=> (not res!143734) (not e!121127))))

(assert (=> d!61247 (= res!143734 (invariant!0 (currentBit!8628 (_2!8104 lt!267396)) (currentByte!8633 (_2!8104 lt!267396)) (size!4118 (buf!4546 (_2!8104 lt!267396)))))))

(assert (=> d!61247 (= lt!267396 e!121131)))

(assert (=> d!61247 (= c!9128 (= #b00000000000000000000000000000000 nBits!340))))

(assert (=> d!61247 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000))))

(assert (=> d!61247 (= (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000) lt!267396)))

(declare-fun b!173543 () Bool)

(declare-fun res!143739 () Bool)

(assert (=> b!173543 (= res!143739 call!2867)))

(assert (=> b!173543 (=> (not res!143739) (not e!121124))))

(declare-fun b!173548 () Bool)

(declare-fun e!121126 () Bool)

(assert (=> b!173548 (= e!121127 e!121126)))

(declare-fun res!143731 () Bool)

(assert (=> b!173548 (=> (not res!143731) (not e!121126))))

(declare-fun lt!267399 () tuple2!14940)

(assert (=> b!173548 (= res!143731 (= (_2!8112 lt!267399) (bvand v!186 (onesLSBLong!0 nBits!340))))))

(declare-fun lt!267387 () tuple2!14926)

(assert (=> b!173548 (= lt!267399 (readNBitsLSBFirstsLoopPure!0 (_1!8105 lt!267387) nBits!340 #b00000000000000000000000000000000 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(declare-fun lt!267397 () Unit!12405)

(declare-fun lt!267394 () Unit!12405)

(assert (=> b!173548 (= lt!267397 lt!267394)))

(assert (=> b!173548 (validate_offset_bits!1 ((_ sign_extend 32) (size!4118 (buf!4546 (_2!8104 lt!267396)))) ((_ sign_extend 32) (currentByte!8633 thiss!1187)) ((_ sign_extend 32) (currentBit!8628 thiss!1187)) lt!267365)))

(assert (=> b!173548 (= lt!267394 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4546 (_2!8104 lt!267396)) lt!267365))))

(assert (=> b!173548 e!121128))

(declare-fun res!143733 () Bool)

(assert (=> b!173548 (=> (not res!143733) (not e!121128))))

(assert (=> b!173548 (= res!143733 (and (= (size!4118 (buf!4546 thiss!1187)) (size!4118 (buf!4546 (_2!8104 lt!267396)))) (bvsge lt!267365 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!173548 (= lt!267365 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(assert (=> b!173548 (or (= (bvand nBits!340 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!340 #b10000000000000000000000000000000) (bvand (bvsub nBits!340 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!173548 (= lt!267387 (reader!0 thiss!1187 (_2!8104 lt!267396)))))

(declare-fun b!173549 () Bool)

(assert (=> b!173549 (= e!121126 (= (_1!8112 lt!267399) (_2!8105 lt!267387)))))

(declare-fun b!173550 () Bool)

(declare-fun res!143740 () Bool)

(assert (=> b!173550 (=> (not res!143740) (not e!121127))))

(assert (=> b!173550 (= res!143740 (= (size!4118 (buf!4546 thiss!1187)) (size!4118 (buf!4546 (_2!8104 lt!267396)))))))

(assert (= (and d!61247 c!9128) b!173547))

(assert (= (and d!61247 (not c!9128)) b!173541))

(assert (= (and b!173541 res!143738) b!173536))

(assert (= (and b!173536 res!143737) b!173543))

(assert (= (and b!173543 res!143739) b!173544))

(assert (= (and b!173544 res!143742) b!173545))

(assert (= (and b!173541 res!143735) b!173546))

(assert (= (and b!173541 c!9129) b!173539))

(assert (= (and b!173541 (not c!9129)) b!173537))

(assert (= (and b!173541 res!143736) b!173535))

(assert (= (or b!173547 b!173543) bm!2864))

(assert (= (and d!61247 res!143734) b!173550))

(assert (= (and b!173550 res!143740) b!173540))

(assert (= (and b!173540 res!143732) b!173542))

(assert (= (and b!173542 res!143741) b!173548))

(assert (= (and b!173548 res!143733) b!173538))

(assert (= (and b!173548 res!143731) b!173549))

(declare-fun m!272713 () Bool)

(assert (=> b!173545 m!272713))

(declare-fun m!272715 () Bool)

(assert (=> b!173545 m!272715))

(declare-fun m!272717 () Bool)

(assert (=> b!173547 m!272717))

(declare-fun m!272719 () Bool)

(assert (=> b!173541 m!272719))

(declare-fun m!272721 () Bool)

(assert (=> b!173541 m!272721))

(declare-fun m!272723 () Bool)

(assert (=> b!173541 m!272723))

(declare-fun m!272725 () Bool)

(assert (=> b!173541 m!272725))

(declare-fun m!272727 () Bool)

(assert (=> b!173541 m!272727))

(declare-fun m!272729 () Bool)

(assert (=> b!173541 m!272729))

(declare-fun m!272731 () Bool)

(assert (=> b!173541 m!272731))

(declare-fun m!272733 () Bool)

(assert (=> b!173541 m!272733))

(declare-fun m!272735 () Bool)

(assert (=> b!173541 m!272735))

(declare-fun m!272737 () Bool)

(assert (=> b!173541 m!272737))

(declare-fun m!272739 () Bool)

(assert (=> b!173541 m!272739))

(declare-fun m!272741 () Bool)

(assert (=> b!173541 m!272741))

(declare-fun m!272743 () Bool)

(assert (=> b!173541 m!272743))

(declare-fun m!272745 () Bool)

(assert (=> b!173541 m!272745))

(declare-fun m!272747 () Bool)

(assert (=> b!173541 m!272747))

(declare-fun m!272749 () Bool)

(assert (=> b!173541 m!272749))

(declare-fun m!272751 () Bool)

(assert (=> b!173541 m!272751))

(declare-fun m!272753 () Bool)

(assert (=> b!173541 m!272753))

(declare-fun m!272755 () Bool)

(assert (=> b!173541 m!272755))

(declare-fun m!272757 () Bool)

(assert (=> b!173541 m!272757))

(declare-fun m!272759 () Bool)

(assert (=> b!173541 m!272759))

(declare-fun m!272761 () Bool)

(assert (=> b!173541 m!272761))

(declare-fun m!272763 () Bool)

(assert (=> b!173541 m!272763))

(declare-fun m!272765 () Bool)

(assert (=> b!173541 m!272765))

(declare-fun m!272767 () Bool)

(assert (=> b!173541 m!272767))

(assert (=> b!173541 m!272403))

(declare-fun m!272769 () Bool)

(assert (=> b!173541 m!272769))

(declare-fun m!272771 () Bool)

(assert (=> b!173541 m!272771))

(declare-fun m!272773 () Bool)

(assert (=> b!173541 m!272773))

(declare-fun m!272775 () Bool)

(assert (=> b!173541 m!272775))

(declare-fun m!272777 () Bool)

(assert (=> b!173541 m!272777))

(declare-fun m!272779 () Bool)

(assert (=> b!173541 m!272779))

(assert (=> b!173541 m!272733))

(declare-fun m!272781 () Bool)

(assert (=> b!173541 m!272781))

(declare-fun m!272783 () Bool)

(assert (=> b!173541 m!272783))

(declare-fun m!272785 () Bool)

(assert (=> b!173544 m!272785))

(assert (=> b!173544 m!272785))

(declare-fun m!272787 () Bool)

(assert (=> b!173544 m!272787))

(declare-fun m!272789 () Bool)

(assert (=> b!173542 m!272789))

(assert (=> b!173536 m!272715))

(assert (=> b!173536 m!272403))

(declare-fun m!272791 () Bool)

(assert (=> b!173538 m!272791))

(declare-fun m!272793 () Bool)

(assert (=> bm!2864 m!272793))

(declare-fun m!272795 () Bool)

(assert (=> b!173540 m!272795))

(assert (=> b!173540 m!272403))

(declare-fun m!272797 () Bool)

(assert (=> b!173548 m!272797))

(assert (=> b!173548 m!272751))

(assert (=> b!173548 m!272763))

(declare-fun m!272799 () Bool)

(assert (=> b!173548 m!272799))

(declare-fun m!272801 () Bool)

(assert (=> b!173548 m!272801))

(declare-fun m!272803 () Bool)

(assert (=> b!173548 m!272803))

(declare-fun m!272805 () Bool)

(assert (=> d!61247 m!272805))

(assert (=> b!173295 d!61247))

(declare-fun d!61277 () Bool)

(assert (=> d!61277 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4118 (buf!4546 (_1!8105 lt!266694)))) ((_ sign_extend 32) (currentByte!8633 (_1!8105 lt!266694))) ((_ sign_extend 32) (currentBit!8628 (_1!8105 lt!266694))) ((_ sign_extend 32) nBits!340)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4118 (buf!4546 (_1!8105 lt!266694)))) ((_ sign_extend 32) (currentByte!8633 (_1!8105 lt!266694))) ((_ sign_extend 32) (currentBit!8628 (_1!8105 lt!266694)))) ((_ sign_extend 32) nBits!340)))))

(declare-fun bs!15259 () Bool)

(assert (= bs!15259 d!61277))

(declare-fun m!272807 () Bool)

(assert (=> bs!15259 m!272807))

(assert (=> b!173296 d!61277))

(declare-fun d!61279 () Bool)

(assert (=> d!61279 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4118 (buf!4546 (_2!8104 lt!266696)))) ((_ sign_extend 32) (currentByte!8633 thiss!1187)) ((_ sign_extend 32) (currentBit!8628 thiss!1187)) ((_ sign_extend 32) nBits!340)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4118 (buf!4546 (_2!8104 lt!266696)))) ((_ sign_extend 32) (currentByte!8633 thiss!1187)) ((_ sign_extend 32) (currentBit!8628 thiss!1187))) ((_ sign_extend 32) nBits!340)))))

(declare-fun bs!15260 () Bool)

(assert (= bs!15260 d!61279))

(declare-fun m!272809 () Bool)

(assert (=> bs!15260 m!272809))

(assert (=> b!173296 d!61279))

(declare-fun d!61281 () Bool)

(assert (=> d!61281 (validate_offset_bits!1 ((_ sign_extend 32) (size!4118 (buf!4546 (_2!8104 lt!266696)))) ((_ sign_extend 32) (currentByte!8633 thiss!1187)) ((_ sign_extend 32) (currentBit!8628 thiss!1187)) ((_ sign_extend 32) nBits!340))))

(declare-fun lt!267410 () Unit!12405)

(declare-fun choose!9 (BitStream!7344 array!9328 (_ BitVec 64) BitStream!7344) Unit!12405)

(assert (=> d!61281 (= lt!267410 (choose!9 thiss!1187 (buf!4546 (_2!8104 lt!266696)) ((_ sign_extend 32) nBits!340) (BitStream!7345 (buf!4546 (_2!8104 lt!266696)) (currentByte!8633 thiss!1187) (currentBit!8628 thiss!1187))))))

(assert (=> d!61281 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4546 (_2!8104 lt!266696)) ((_ sign_extend 32) nBits!340)) lt!267410)))

(declare-fun bs!15261 () Bool)

(assert (= bs!15261 d!61281))

(assert (=> bs!15261 m!272391))

(declare-fun m!272811 () Bool)

(assert (=> bs!15261 m!272811))

(assert (=> b!173296 d!61281))

(declare-fun b!173561 () Bool)

(declare-fun e!121137 () Unit!12405)

(declare-fun Unit!12444 () Unit!12405)

(assert (=> b!173561 (= e!121137 Unit!12444)))

(declare-fun b!173562 () Bool)

(declare-fun lt!267457 () Unit!12405)

(assert (=> b!173562 (= e!121137 lt!267457)))

(declare-fun lt!267460 () (_ BitVec 64))

(assert (=> b!173562 (= lt!267460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!267455 () (_ BitVec 64))

(assert (=> b!173562 (= lt!267455 (bitIndex!0 (size!4118 (buf!4546 thiss!1187)) (currentByte!8633 thiss!1187) (currentBit!8628 thiss!1187)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9328 array!9328 (_ BitVec 64) (_ BitVec 64)) Unit!12405)

(assert (=> b!173562 (= lt!267457 (arrayBitRangesEqSymmetric!0 (buf!4546 thiss!1187) (buf!4546 (_2!8104 lt!266696)) lt!267460 lt!267455))))

(assert (=> b!173562 (arrayBitRangesEq!0 (buf!4546 (_2!8104 lt!266696)) (buf!4546 thiss!1187) lt!267460 lt!267455)))

(declare-fun b!173563 () Bool)

(declare-fun res!143749 () Bool)

(declare-fun e!121138 () Bool)

(assert (=> b!173563 (=> (not res!143749) (not e!121138))))

(declare-fun lt!267459 () tuple2!14926)

(assert (=> b!173563 (= res!143749 (isPrefixOf!0 (_2!8105 lt!267459) (_2!8104 lt!266696)))))

(declare-fun d!61283 () Bool)

(assert (=> d!61283 e!121138))

(declare-fun res!143751 () Bool)

(assert (=> d!61283 (=> (not res!143751) (not e!121138))))

(assert (=> d!61283 (= res!143751 (isPrefixOf!0 (_1!8105 lt!267459) (_2!8105 lt!267459)))))

(declare-fun lt!267470 () BitStream!7344)

(assert (=> d!61283 (= lt!267459 (tuple2!14927 lt!267470 (_2!8104 lt!266696)))))

(declare-fun lt!267466 () Unit!12405)

(declare-fun lt!267458 () Unit!12405)

(assert (=> d!61283 (= lt!267466 lt!267458)))

(assert (=> d!61283 (isPrefixOf!0 lt!267470 (_2!8104 lt!266696))))

(assert (=> d!61283 (= lt!267458 (lemmaIsPrefixTransitive!0 lt!267470 (_2!8104 lt!266696) (_2!8104 lt!266696)))))

(declare-fun lt!267469 () Unit!12405)

(declare-fun lt!267452 () Unit!12405)

(assert (=> d!61283 (= lt!267469 lt!267452)))

(assert (=> d!61283 (isPrefixOf!0 lt!267470 (_2!8104 lt!266696))))

(assert (=> d!61283 (= lt!267452 (lemmaIsPrefixTransitive!0 lt!267470 thiss!1187 (_2!8104 lt!266696)))))

(declare-fun lt!267453 () Unit!12405)

(assert (=> d!61283 (= lt!267453 e!121137)))

(declare-fun c!9132 () Bool)

(assert (=> d!61283 (= c!9132 (not (= (size!4118 (buf!4546 thiss!1187)) #b00000000000000000000000000000000)))))

(declare-fun lt!267456 () Unit!12405)

(declare-fun lt!267462 () Unit!12405)

(assert (=> d!61283 (= lt!267456 lt!267462)))

(assert (=> d!61283 (isPrefixOf!0 (_2!8104 lt!266696) (_2!8104 lt!266696))))

(assert (=> d!61283 (= lt!267462 (lemmaIsPrefixRefl!0 (_2!8104 lt!266696)))))

(declare-fun lt!267467 () Unit!12405)

(declare-fun lt!267451 () Unit!12405)

(assert (=> d!61283 (= lt!267467 lt!267451)))

(assert (=> d!61283 (= lt!267451 (lemmaIsPrefixRefl!0 (_2!8104 lt!266696)))))

(declare-fun lt!267463 () Unit!12405)

(declare-fun lt!267468 () Unit!12405)

(assert (=> d!61283 (= lt!267463 lt!267468)))

(assert (=> d!61283 (isPrefixOf!0 lt!267470 lt!267470)))

(assert (=> d!61283 (= lt!267468 (lemmaIsPrefixRefl!0 lt!267470))))

(declare-fun lt!267461 () Unit!12405)

(declare-fun lt!267465 () Unit!12405)

(assert (=> d!61283 (= lt!267461 lt!267465)))

(assert (=> d!61283 (isPrefixOf!0 thiss!1187 thiss!1187)))

(assert (=> d!61283 (= lt!267465 (lemmaIsPrefixRefl!0 thiss!1187))))

(assert (=> d!61283 (= lt!267470 (BitStream!7345 (buf!4546 (_2!8104 lt!266696)) (currentByte!8633 thiss!1187) (currentBit!8628 thiss!1187)))))

(assert (=> d!61283 (isPrefixOf!0 thiss!1187 (_2!8104 lt!266696))))

(assert (=> d!61283 (= (reader!0 thiss!1187 (_2!8104 lt!266696)) lt!267459)))

(declare-fun lt!267464 () (_ BitVec 64))

(declare-fun b!173564 () Bool)

(declare-fun lt!267454 () (_ BitVec 64))

(assert (=> b!173564 (= e!121138 (= (_1!8105 lt!267459) (withMovedBitIndex!0 (_2!8105 lt!267459) (bvsub lt!267454 lt!267464))))))

(assert (=> b!173564 (or (= (bvand lt!267454 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!267464 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!267454 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!267454 lt!267464) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!173564 (= lt!267464 (bitIndex!0 (size!4118 (buf!4546 (_2!8104 lt!266696))) (currentByte!8633 (_2!8104 lt!266696)) (currentBit!8628 (_2!8104 lt!266696))))))

(assert (=> b!173564 (= lt!267454 (bitIndex!0 (size!4118 (buf!4546 thiss!1187)) (currentByte!8633 thiss!1187) (currentBit!8628 thiss!1187)))))

(declare-fun b!173565 () Bool)

(declare-fun res!143750 () Bool)

(assert (=> b!173565 (=> (not res!143750) (not e!121138))))

(assert (=> b!173565 (= res!143750 (isPrefixOf!0 (_1!8105 lt!267459) thiss!1187))))

(assert (= (and d!61283 c!9132) b!173562))

(assert (= (and d!61283 (not c!9132)) b!173561))

(assert (= (and d!61283 res!143751) b!173565))

(assert (= (and b!173565 res!143750) b!173563))

(assert (= (and b!173563 res!143749) b!173564))

(declare-fun m!272813 () Bool)

(assert (=> b!173564 m!272813))

(assert (=> b!173564 m!272401))

(assert (=> b!173564 m!272403))

(assert (=> b!173562 m!272403))

(declare-fun m!272815 () Bool)

(assert (=> b!173562 m!272815))

(declare-fun m!272817 () Bool)

(assert (=> b!173562 m!272817))

(declare-fun m!272819 () Bool)

(assert (=> b!173563 m!272819))

(declare-fun m!272821 () Bool)

(assert (=> d!61283 m!272821))

(declare-fun m!272823 () Bool)

(assert (=> d!61283 m!272823))

(declare-fun m!272825 () Bool)

(assert (=> d!61283 m!272825))

(declare-fun m!272827 () Bool)

(assert (=> d!61283 m!272827))

(declare-fun m!272829 () Bool)

(assert (=> d!61283 m!272829))

(assert (=> d!61283 m!272717))

(assert (=> d!61283 m!272407))

(declare-fun m!272831 () Bool)

(assert (=> d!61283 m!272831))

(declare-fun m!272833 () Bool)

(assert (=> d!61283 m!272833))

(declare-fun m!272835 () Bool)

(assert (=> d!61283 m!272835))

(declare-fun m!272837 () Bool)

(assert (=> d!61283 m!272837))

(declare-fun m!272839 () Bool)

(assert (=> b!173565 m!272839))

(assert (=> b!173296 d!61283))

(check-sat (not d!61245) (not d!61223) (not d!61231) (not b!173564) (not b!173538) (not b!173562) (not b!173541) (not b!173565) (not b!173563) (not b!173547) (not b!173545) (not d!61243) (not b!173536) (not b!173542) (not b!173540) (not b!173544) (not b!173548) (not d!61279) (not bm!2864) (not d!61281) (not d!61283) (not b!173349) (not d!61247) (not b!173351) (not d!61277))
(check-sat)
