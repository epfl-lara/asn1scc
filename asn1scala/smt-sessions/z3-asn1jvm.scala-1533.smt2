; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42770 () Bool)

(assert start!42770)

(declare-fun b!201568 () Bool)

(declare-fun e!138243 () Bool)

(declare-fun lt!314389 () (_ BitVec 64))

(declare-fun lt!314393 () (_ BitVec 64))

(assert (=> b!201568 (= e!138243 (not (or (not (= lt!314389 #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!314389 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!314393) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!201568 (= lt!314389 (bvand lt!314393 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!10246 0))(
  ( (array!10247 (arr!5441 (Array (_ BitVec 32) (_ BitVec 8))) (size!4511 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8130 0))(
  ( (BitStream!8131 (buf!5016 array!10246) (currentByte!9429 (_ BitVec 32)) (currentBit!9424 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8130)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!201568 (= lt!314393 (bitIndex!0 (size!4511 (buf!5016 thiss!1204)) (currentByte!9429 thiss!1204) (currentBit!9424 thiss!1204)))))

(declare-fun e!138238 () Bool)

(assert (=> b!201568 e!138238))

(declare-fun res!168759 () Bool)

(assert (=> b!201568 (=> (not res!168759) (not e!138238))))

(declare-datatypes ((Unit!14315 0))(
  ( (Unit!14316) )
))
(declare-datatypes ((tuple2!17232 0))(
  ( (tuple2!17233 (_1!9268 Unit!14315) (_2!9268 BitStream!8130)) )
))
(declare-fun lt!314387 () tuple2!17232)

(assert (=> b!201568 (= res!168759 (= (size!4511 (buf!5016 thiss!1204)) (size!4511 (buf!5016 (_2!9268 lt!314387)))))))

(declare-fun lt!314390 () Bool)

(declare-fun appendBit!0 (BitStream!8130 Bool) tuple2!17232)

(assert (=> b!201568 (= lt!314387 (appendBit!0 thiss!1204 lt!314390))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!201568 (= lt!314390 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!201569 () Bool)

(declare-fun e!138239 () Bool)

(declare-fun e!138241 () Bool)

(assert (=> b!201569 (= e!138239 e!138241)))

(declare-fun res!168758 () Bool)

(assert (=> b!201569 (=> (not res!168758) (not e!138241))))

(declare-datatypes ((tuple2!17234 0))(
  ( (tuple2!17235 (_1!9269 BitStream!8130) (_2!9269 Bool)) )
))
(declare-fun lt!314388 () tuple2!17234)

(assert (=> b!201569 (= res!168758 (and (= (_2!9269 lt!314388) lt!314390) (= (_1!9269 lt!314388) (_2!9268 lt!314387))))))

(declare-fun readBitPure!0 (BitStream!8130) tuple2!17234)

(declare-fun readerFrom!0 (BitStream!8130 (_ BitVec 32) (_ BitVec 32)) BitStream!8130)

(assert (=> b!201569 (= lt!314388 (readBitPure!0 (readerFrom!0 (_2!9268 lt!314387) (currentBit!9424 thiss!1204) (currentByte!9429 thiss!1204))))))

(declare-fun b!201570 () Bool)

(declare-fun lt!314392 () (_ BitVec 64))

(assert (=> b!201570 (= e!138241 (= (bitIndex!0 (size!4511 (buf!5016 (_1!9269 lt!314388))) (currentByte!9429 (_1!9269 lt!314388)) (currentBit!9424 (_1!9269 lt!314388))) lt!314392))))

(declare-fun b!201571 () Bool)

(declare-fun res!168764 () Bool)

(assert (=> b!201571 (=> (not res!168764) (not e!138243))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!201571 (= res!168764 (invariant!0 (currentBit!9424 thiss!1204) (currentByte!9429 thiss!1204) (size!4511 (buf!5016 thiss!1204))))))

(declare-fun b!201572 () Bool)

(assert (=> b!201572 (= e!138238 e!138239)))

(declare-fun res!168762 () Bool)

(assert (=> b!201572 (=> (not res!168762) (not e!138239))))

(declare-fun lt!314391 () (_ BitVec 64))

(assert (=> b!201572 (= res!168762 (= lt!314392 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!314391)))))

(assert (=> b!201572 (= lt!314392 (bitIndex!0 (size!4511 (buf!5016 (_2!9268 lt!314387))) (currentByte!9429 (_2!9268 lt!314387)) (currentBit!9424 (_2!9268 lt!314387))))))

(assert (=> b!201572 (= lt!314391 (bitIndex!0 (size!4511 (buf!5016 thiss!1204)) (currentByte!9429 thiss!1204) (currentBit!9424 thiss!1204)))))

(declare-fun b!201573 () Bool)

(declare-fun res!168760 () Bool)

(assert (=> b!201573 (=> (not res!168760) (not e!138243))))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!201573 (= res!168760 (not (= i!590 nBits!348)))))

(declare-fun b!201574 () Bool)

(declare-fun res!168761 () Bool)

(assert (=> b!201574 (=> (not res!168761) (not e!138243))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!201574 (= res!168761 (validate_offset_bits!1 ((_ sign_extend 32) (size!4511 (buf!5016 thiss!1204))) ((_ sign_extend 32) (currentByte!9429 thiss!1204)) ((_ sign_extend 32) (currentBit!9424 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!201575 () Bool)

(declare-fun res!168763 () Bool)

(assert (=> b!201575 (=> (not res!168763) (not e!138239))))

(declare-fun isPrefixOf!0 (BitStream!8130 BitStream!8130) Bool)

(assert (=> b!201575 (= res!168763 (isPrefixOf!0 thiss!1204 (_2!9268 lt!314387)))))

(declare-fun b!201576 () Bool)

(declare-fun e!138240 () Bool)

(declare-fun array_inv!4252 (array!10246) Bool)

(assert (=> b!201576 (= e!138240 (array_inv!4252 (buf!5016 thiss!1204)))))

(declare-fun res!168757 () Bool)

(assert (=> start!42770 (=> (not res!168757) (not e!138243))))

(assert (=> start!42770 (= res!168757 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42770 e!138243))

(assert (=> start!42770 true))

(declare-fun inv!12 (BitStream!8130) Bool)

(assert (=> start!42770 (and (inv!12 thiss!1204) e!138240)))

(assert (= (and start!42770 res!168757) b!201574))

(assert (= (and b!201574 res!168761) b!201571))

(assert (= (and b!201571 res!168764) b!201573))

(assert (= (and b!201573 res!168760) b!201568))

(assert (= (and b!201568 res!168759) b!201572))

(assert (= (and b!201572 res!168762) b!201575))

(assert (= (and b!201575 res!168763) b!201569))

(assert (= (and b!201569 res!168758) b!201570))

(assert (= start!42770 b!201576))

(declare-fun m!312145 () Bool)

(assert (=> b!201574 m!312145))

(declare-fun m!312147 () Bool)

(assert (=> b!201570 m!312147))

(declare-fun m!312149 () Bool)

(assert (=> start!42770 m!312149))

(declare-fun m!312151 () Bool)

(assert (=> b!201576 m!312151))

(declare-fun m!312153 () Bool)

(assert (=> b!201571 m!312153))

(declare-fun m!312155 () Bool)

(assert (=> b!201575 m!312155))

(declare-fun m!312157 () Bool)

(assert (=> b!201572 m!312157))

(declare-fun m!312159 () Bool)

(assert (=> b!201572 m!312159))

(declare-fun m!312161 () Bool)

(assert (=> b!201569 m!312161))

(assert (=> b!201569 m!312161))

(declare-fun m!312163 () Bool)

(assert (=> b!201569 m!312163))

(assert (=> b!201568 m!312159))

(declare-fun m!312165 () Bool)

(assert (=> b!201568 m!312165))

(check-sat (not b!201572) (not b!201574) (not b!201576) (not b!201570) (not b!201575) (not b!201568) (not start!42770) (not b!201569) (not b!201571))
(check-sat)
(get-model)

(declare-fun d!69067 () Bool)

(assert (=> d!69067 (= (array_inv!4252 (buf!5016 thiss!1204)) (bvsge (size!4511 (buf!5016 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!201576 d!69067))

(declare-fun d!69069 () Bool)

(declare-fun res!168797 () Bool)

(declare-fun e!138267 () Bool)

(assert (=> d!69069 (=> (not res!168797) (not e!138267))))

(assert (=> d!69069 (= res!168797 (= (size!4511 (buf!5016 thiss!1204)) (size!4511 (buf!5016 (_2!9268 lt!314387)))))))

(assert (=> d!69069 (= (isPrefixOf!0 thiss!1204 (_2!9268 lt!314387)) e!138267)))

(declare-fun b!201610 () Bool)

(declare-fun res!168795 () Bool)

(assert (=> b!201610 (=> (not res!168795) (not e!138267))))

(assert (=> b!201610 (= res!168795 (bvsle (bitIndex!0 (size!4511 (buf!5016 thiss!1204)) (currentByte!9429 thiss!1204) (currentBit!9424 thiss!1204)) (bitIndex!0 (size!4511 (buf!5016 (_2!9268 lt!314387))) (currentByte!9429 (_2!9268 lt!314387)) (currentBit!9424 (_2!9268 lt!314387)))))))

(declare-fun b!201611 () Bool)

(declare-fun e!138266 () Bool)

(assert (=> b!201611 (= e!138267 e!138266)))

(declare-fun res!168796 () Bool)

(assert (=> b!201611 (=> res!168796 e!138266)))

(assert (=> b!201611 (= res!168796 (= (size!4511 (buf!5016 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!201612 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10246 array!10246 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!201612 (= e!138266 (arrayBitRangesEq!0 (buf!5016 thiss!1204) (buf!5016 (_2!9268 lt!314387)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4511 (buf!5016 thiss!1204)) (currentByte!9429 thiss!1204) (currentBit!9424 thiss!1204))))))

(assert (= (and d!69069 res!168797) b!201610))

(assert (= (and b!201610 res!168795) b!201611))

(assert (= (and b!201611 (not res!168796)) b!201612))

(assert (=> b!201610 m!312159))

(assert (=> b!201610 m!312157))

(assert (=> b!201612 m!312159))

(assert (=> b!201612 m!312159))

(declare-fun m!312189 () Bool)

(assert (=> b!201612 m!312189))

(assert (=> b!201575 d!69069))

(declare-fun d!69071 () Bool)

(declare-fun e!138270 () Bool)

(assert (=> d!69071 e!138270))

(declare-fun res!168802 () Bool)

(assert (=> d!69071 (=> (not res!168802) (not e!138270))))

(declare-fun lt!314429 () (_ BitVec 64))

(declare-fun lt!314431 () (_ BitVec 64))

(declare-fun lt!314432 () (_ BitVec 64))

(assert (=> d!69071 (= res!168802 (= lt!314429 (bvsub lt!314431 lt!314432)))))

(assert (=> d!69071 (or (= (bvand lt!314431 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!314432 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!314431 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!314431 lt!314432) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!69071 (= lt!314432 (remainingBits!0 ((_ sign_extend 32) (size!4511 (buf!5016 (_1!9269 lt!314388)))) ((_ sign_extend 32) (currentByte!9429 (_1!9269 lt!314388))) ((_ sign_extend 32) (currentBit!9424 (_1!9269 lt!314388)))))))

(declare-fun lt!314427 () (_ BitVec 64))

(declare-fun lt!314430 () (_ BitVec 64))

(assert (=> d!69071 (= lt!314431 (bvmul lt!314427 lt!314430))))

(assert (=> d!69071 (or (= lt!314427 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!314430 (bvsdiv (bvmul lt!314427 lt!314430) lt!314427)))))

(assert (=> d!69071 (= lt!314430 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69071 (= lt!314427 ((_ sign_extend 32) (size!4511 (buf!5016 (_1!9269 lt!314388)))))))

(assert (=> d!69071 (= lt!314429 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9429 (_1!9269 lt!314388))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9424 (_1!9269 lt!314388)))))))

(assert (=> d!69071 (invariant!0 (currentBit!9424 (_1!9269 lt!314388)) (currentByte!9429 (_1!9269 lt!314388)) (size!4511 (buf!5016 (_1!9269 lt!314388))))))

(assert (=> d!69071 (= (bitIndex!0 (size!4511 (buf!5016 (_1!9269 lt!314388))) (currentByte!9429 (_1!9269 lt!314388)) (currentBit!9424 (_1!9269 lt!314388))) lt!314429)))

(declare-fun b!201617 () Bool)

(declare-fun res!168803 () Bool)

(assert (=> b!201617 (=> (not res!168803) (not e!138270))))

(assert (=> b!201617 (= res!168803 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!314429))))

(declare-fun b!201618 () Bool)

(declare-fun lt!314428 () (_ BitVec 64))

(assert (=> b!201618 (= e!138270 (bvsle lt!314429 (bvmul lt!314428 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!201618 (or (= lt!314428 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!314428 #b0000000000000000000000000000000000000000000000000000000000001000) lt!314428)))))

(assert (=> b!201618 (= lt!314428 ((_ sign_extend 32) (size!4511 (buf!5016 (_1!9269 lt!314388)))))))

(assert (= (and d!69071 res!168802) b!201617))

(assert (= (and b!201617 res!168803) b!201618))

(declare-fun m!312191 () Bool)

(assert (=> d!69071 m!312191))

(declare-fun m!312193 () Bool)

(assert (=> d!69071 m!312193))

(assert (=> b!201570 d!69071))

(declare-fun d!69079 () Bool)

(declare-datatypes ((tuple2!17240 0))(
  ( (tuple2!17241 (_1!9272 Bool) (_2!9272 BitStream!8130)) )
))
(declare-fun lt!314440 () tuple2!17240)

(declare-fun readBit!0 (BitStream!8130) tuple2!17240)

(assert (=> d!69079 (= lt!314440 (readBit!0 (readerFrom!0 (_2!9268 lt!314387) (currentBit!9424 thiss!1204) (currentByte!9429 thiss!1204))))))

(assert (=> d!69079 (= (readBitPure!0 (readerFrom!0 (_2!9268 lt!314387) (currentBit!9424 thiss!1204) (currentByte!9429 thiss!1204))) (tuple2!17235 (_2!9272 lt!314440) (_1!9272 lt!314440)))))

(declare-fun bs!17051 () Bool)

(assert (= bs!17051 d!69079))

(assert (=> bs!17051 m!312161))

(declare-fun m!312197 () Bool)

(assert (=> bs!17051 m!312197))

(assert (=> b!201569 d!69079))

(declare-fun d!69083 () Bool)

(declare-fun e!138279 () Bool)

(assert (=> d!69083 e!138279))

(declare-fun res!168817 () Bool)

(assert (=> d!69083 (=> (not res!168817) (not e!138279))))

(assert (=> d!69083 (= res!168817 (invariant!0 (currentBit!9424 (_2!9268 lt!314387)) (currentByte!9429 (_2!9268 lt!314387)) (size!4511 (buf!5016 (_2!9268 lt!314387)))))))

(assert (=> d!69083 (= (readerFrom!0 (_2!9268 lt!314387) (currentBit!9424 thiss!1204) (currentByte!9429 thiss!1204)) (BitStream!8131 (buf!5016 (_2!9268 lt!314387)) (currentByte!9429 thiss!1204) (currentBit!9424 thiss!1204)))))

(declare-fun b!201630 () Bool)

(assert (=> b!201630 (= e!138279 (invariant!0 (currentBit!9424 thiss!1204) (currentByte!9429 thiss!1204) (size!4511 (buf!5016 (_2!9268 lt!314387)))))))

(assert (= (and d!69083 res!168817) b!201630))

(declare-fun m!312209 () Bool)

(assert (=> d!69083 m!312209))

(declare-fun m!312211 () Bool)

(assert (=> b!201630 m!312211))

(assert (=> b!201569 d!69083))

(declare-fun d!69093 () Bool)

(assert (=> d!69093 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4511 (buf!5016 thiss!1204))) ((_ sign_extend 32) (currentByte!9429 thiss!1204)) ((_ sign_extend 32) (currentBit!9424 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4511 (buf!5016 thiss!1204))) ((_ sign_extend 32) (currentByte!9429 thiss!1204)) ((_ sign_extend 32) (currentBit!9424 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!17053 () Bool)

(assert (= bs!17053 d!69093))

(declare-fun m!312217 () Bool)

(assert (=> bs!17053 m!312217))

(assert (=> b!201574 d!69093))

(declare-fun d!69099 () Bool)

(declare-fun e!138282 () Bool)

(assert (=> d!69099 e!138282))

(declare-fun res!168822 () Bool)

(assert (=> d!69099 (=> (not res!168822) (not e!138282))))

(declare-fun lt!314471 () (_ BitVec 64))

(declare-fun lt!314474 () (_ BitVec 64))

(declare-fun lt!314473 () (_ BitVec 64))

(assert (=> d!69099 (= res!168822 (= lt!314471 (bvsub lt!314473 lt!314474)))))

(assert (=> d!69099 (or (= (bvand lt!314473 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!314474 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!314473 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!314473 lt!314474) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69099 (= lt!314474 (remainingBits!0 ((_ sign_extend 32) (size!4511 (buf!5016 thiss!1204))) ((_ sign_extend 32) (currentByte!9429 thiss!1204)) ((_ sign_extend 32) (currentBit!9424 thiss!1204))))))

(declare-fun lt!314469 () (_ BitVec 64))

(declare-fun lt!314472 () (_ BitVec 64))

(assert (=> d!69099 (= lt!314473 (bvmul lt!314469 lt!314472))))

(assert (=> d!69099 (or (= lt!314469 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!314472 (bvsdiv (bvmul lt!314469 lt!314472) lt!314469)))))

(assert (=> d!69099 (= lt!314472 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69099 (= lt!314469 ((_ sign_extend 32) (size!4511 (buf!5016 thiss!1204))))))

(assert (=> d!69099 (= lt!314471 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9429 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9424 thiss!1204))))))

(assert (=> d!69099 (invariant!0 (currentBit!9424 thiss!1204) (currentByte!9429 thiss!1204) (size!4511 (buf!5016 thiss!1204)))))

(assert (=> d!69099 (= (bitIndex!0 (size!4511 (buf!5016 thiss!1204)) (currentByte!9429 thiss!1204) (currentBit!9424 thiss!1204)) lt!314471)))

(declare-fun b!201635 () Bool)

(declare-fun res!168823 () Bool)

(assert (=> b!201635 (=> (not res!168823) (not e!138282))))

(assert (=> b!201635 (= res!168823 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!314471))))

(declare-fun b!201636 () Bool)

(declare-fun lt!314470 () (_ BitVec 64))

(assert (=> b!201636 (= e!138282 (bvsle lt!314471 (bvmul lt!314470 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!201636 (or (= lt!314470 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!314470 #b0000000000000000000000000000000000000000000000000000000000001000) lt!314470)))))

(assert (=> b!201636 (= lt!314470 ((_ sign_extend 32) (size!4511 (buf!5016 thiss!1204))))))

(assert (= (and d!69099 res!168822) b!201635))

(assert (= (and b!201635 res!168823) b!201636))

(assert (=> d!69099 m!312217))

(assert (=> d!69099 m!312153))

(assert (=> b!201568 d!69099))

(declare-fun b!201678 () Bool)

(declare-fun e!138304 () Bool)

(declare-fun lt!314516 () tuple2!17234)

(declare-fun lt!314515 () tuple2!17232)

(assert (=> b!201678 (= e!138304 (= (bitIndex!0 (size!4511 (buf!5016 (_1!9269 lt!314516))) (currentByte!9429 (_1!9269 lt!314516)) (currentBit!9424 (_1!9269 lt!314516))) (bitIndex!0 (size!4511 (buf!5016 (_2!9268 lt!314515))) (currentByte!9429 (_2!9268 lt!314515)) (currentBit!9424 (_2!9268 lt!314515)))))))

(declare-fun b!201676 () Bool)

(declare-fun res!168862 () Bool)

(declare-fun e!138305 () Bool)

(assert (=> b!201676 (=> (not res!168862) (not e!138305))))

(assert (=> b!201676 (= res!168862 (isPrefixOf!0 thiss!1204 (_2!9268 lt!314515)))))

(declare-fun d!69103 () Bool)

(assert (=> d!69103 e!138305))

(declare-fun res!168860 () Bool)

(assert (=> d!69103 (=> (not res!168860) (not e!138305))))

(assert (=> d!69103 (= res!168860 (= (size!4511 (buf!5016 thiss!1204)) (size!4511 (buf!5016 (_2!9268 lt!314515)))))))

(declare-fun choose!16 (BitStream!8130 Bool) tuple2!17232)

(assert (=> d!69103 (= lt!314515 (choose!16 thiss!1204 lt!314390))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!69103 (validate_offset_bit!0 ((_ sign_extend 32) (size!4511 (buf!5016 thiss!1204))) ((_ sign_extend 32) (currentByte!9429 thiss!1204)) ((_ sign_extend 32) (currentBit!9424 thiss!1204)))))

(assert (=> d!69103 (= (appendBit!0 thiss!1204 lt!314390) lt!314515)))

(declare-fun b!201675 () Bool)

(declare-fun res!168863 () Bool)

(assert (=> b!201675 (=> (not res!168863) (not e!138305))))

(declare-fun lt!314514 () (_ BitVec 64))

(declare-fun lt!314513 () (_ BitVec 64))

(assert (=> b!201675 (= res!168863 (= (bitIndex!0 (size!4511 (buf!5016 (_2!9268 lt!314515))) (currentByte!9429 (_2!9268 lt!314515)) (currentBit!9424 (_2!9268 lt!314515))) (bvadd lt!314514 lt!314513)))))

(assert (=> b!201675 (or (not (= (bvand lt!314514 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!314513 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!314514 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!314514 lt!314513) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!201675 (= lt!314513 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!201675 (= lt!314514 (bitIndex!0 (size!4511 (buf!5016 thiss!1204)) (currentByte!9429 thiss!1204) (currentBit!9424 thiss!1204)))))

(declare-fun b!201677 () Bool)

(assert (=> b!201677 (= e!138305 e!138304)))

(declare-fun res!168861 () Bool)

(assert (=> b!201677 (=> (not res!168861) (not e!138304))))

(assert (=> b!201677 (= res!168861 (and (= (_2!9269 lt!314516) lt!314390) (= (_1!9269 lt!314516) (_2!9268 lt!314515))))))

(assert (=> b!201677 (= lt!314516 (readBitPure!0 (readerFrom!0 (_2!9268 lt!314515) (currentBit!9424 thiss!1204) (currentByte!9429 thiss!1204))))))

(assert (= (and d!69103 res!168860) b!201675))

(assert (= (and b!201675 res!168863) b!201676))

(assert (= (and b!201676 res!168862) b!201677))

(assert (= (and b!201677 res!168861) b!201678))

(declare-fun m!312231 () Bool)

(assert (=> b!201675 m!312231))

(assert (=> b!201675 m!312159))

(declare-fun m!312233 () Bool)

(assert (=> b!201676 m!312233))

(declare-fun m!312235 () Bool)

(assert (=> d!69103 m!312235))

(declare-fun m!312237 () Bool)

(assert (=> d!69103 m!312237))

(declare-fun m!312239 () Bool)

(assert (=> b!201677 m!312239))

(assert (=> b!201677 m!312239))

(declare-fun m!312241 () Bool)

(assert (=> b!201677 m!312241))

(declare-fun m!312243 () Bool)

(assert (=> b!201678 m!312243))

(assert (=> b!201678 m!312231))

(assert (=> b!201568 d!69103))

(declare-fun d!69123 () Bool)

(declare-fun e!138310 () Bool)

(assert (=> d!69123 e!138310))

(declare-fun res!168872 () Bool)

(assert (=> d!69123 (=> (not res!168872) (not e!138310))))

(declare-fun lt!314527 () (_ BitVec 64))

(declare-fun lt!314530 () (_ BitVec 64))

(declare-fun lt!314529 () (_ BitVec 64))

(assert (=> d!69123 (= res!168872 (= lt!314527 (bvsub lt!314529 lt!314530)))))

(assert (=> d!69123 (or (= (bvand lt!314529 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!314530 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!314529 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!314529 lt!314530) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69123 (= lt!314530 (remainingBits!0 ((_ sign_extend 32) (size!4511 (buf!5016 (_2!9268 lt!314387)))) ((_ sign_extend 32) (currentByte!9429 (_2!9268 lt!314387))) ((_ sign_extend 32) (currentBit!9424 (_2!9268 lt!314387)))))))

(declare-fun lt!314525 () (_ BitVec 64))

(declare-fun lt!314528 () (_ BitVec 64))

(assert (=> d!69123 (= lt!314529 (bvmul lt!314525 lt!314528))))

(assert (=> d!69123 (or (= lt!314525 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!314528 (bvsdiv (bvmul lt!314525 lt!314528) lt!314525)))))

(assert (=> d!69123 (= lt!314528 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69123 (= lt!314525 ((_ sign_extend 32) (size!4511 (buf!5016 (_2!9268 lt!314387)))))))

(assert (=> d!69123 (= lt!314527 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9429 (_2!9268 lt!314387))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9424 (_2!9268 lt!314387)))))))

(assert (=> d!69123 (invariant!0 (currentBit!9424 (_2!9268 lt!314387)) (currentByte!9429 (_2!9268 lt!314387)) (size!4511 (buf!5016 (_2!9268 lt!314387))))))

(assert (=> d!69123 (= (bitIndex!0 (size!4511 (buf!5016 (_2!9268 lt!314387))) (currentByte!9429 (_2!9268 lt!314387)) (currentBit!9424 (_2!9268 lt!314387))) lt!314527)))

(declare-fun b!201687 () Bool)

(declare-fun res!168873 () Bool)

(assert (=> b!201687 (=> (not res!168873) (not e!138310))))

(assert (=> b!201687 (= res!168873 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!314527))))

(declare-fun b!201688 () Bool)

(declare-fun lt!314526 () (_ BitVec 64))

(assert (=> b!201688 (= e!138310 (bvsle lt!314527 (bvmul lt!314526 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!201688 (or (= lt!314526 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!314526 #b0000000000000000000000000000000000000000000000000000000000001000) lt!314526)))))

(assert (=> b!201688 (= lt!314526 ((_ sign_extend 32) (size!4511 (buf!5016 (_2!9268 lt!314387)))))))

(assert (= (and d!69123 res!168872) b!201687))

(assert (= (and b!201687 res!168873) b!201688))

(declare-fun m!312245 () Bool)

(assert (=> d!69123 m!312245))

(assert (=> d!69123 m!312209))

(assert (=> b!201572 d!69123))

(assert (=> b!201572 d!69099))

(declare-fun d!69125 () Bool)

(assert (=> d!69125 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9424 thiss!1204) (currentByte!9429 thiss!1204) (size!4511 (buf!5016 thiss!1204))))))

(declare-fun bs!17056 () Bool)

(assert (= bs!17056 d!69125))

(assert (=> bs!17056 m!312153))

(assert (=> start!42770 d!69125))

(declare-fun d!69127 () Bool)

(assert (=> d!69127 (= (invariant!0 (currentBit!9424 thiss!1204) (currentByte!9429 thiss!1204) (size!4511 (buf!5016 thiss!1204))) (and (bvsge (currentBit!9424 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9424 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9429 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9429 thiss!1204) (size!4511 (buf!5016 thiss!1204))) (and (= (currentBit!9424 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9429 thiss!1204) (size!4511 (buf!5016 thiss!1204)))))))))

(assert (=> b!201571 d!69127))

(check-sat (not d!69079) (not b!201678) (not d!69123) (not d!69103) (not b!201610) (not d!69083) (not d!69125) (not b!201677) (not b!201676) (not d!69093) (not b!201630) (not d!69099) (not b!201612) (not d!69071) (not b!201675))
