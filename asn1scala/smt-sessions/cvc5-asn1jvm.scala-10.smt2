; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!178 () Bool)

(assert start!178)

(declare-fun b!427 () Bool)

(declare-fun e!190 () Bool)

(declare-fun e!188 () Bool)

(assert (=> b!427 (= e!190 e!188)))

(declare-fun res!2534 () Bool)

(assert (=> b!427 (=> (not res!2534) (not e!188))))

(declare-fun lt!8 () (_ BitVec 64))

(declare-fun lt!11 () (_ BitVec 64))

(assert (=> b!427 (= res!2534 (= lt!8 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!11)))))

(declare-datatypes ((array!72 0))(
  ( (array!73 (arr!415 (Array (_ BitVec 32) (_ BitVec 8))) (size!28 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!40 0))(
  ( (BitStream!41 (buf!340 array!72) (currentByte!1238 (_ BitVec 32)) (currentBit!1233 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1 0))(
  ( (Unit!2) )
))
(declare-datatypes ((tuple2!0 0))(
  ( (tuple2!1 (_1!0 Unit!1) (_2!0 BitStream!40)) )
))
(declare-fun lt!9 () tuple2!0)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!427 (= lt!8 (bitIndex!0 (size!28 (buf!340 (_2!0 lt!9))) (currentByte!1238 (_2!0 lt!9)) (currentBit!1233 (_2!0 lt!9))))))

(declare-fun thiss!932 () BitStream!40)

(assert (=> b!427 (= lt!11 (bitIndex!0 (size!28 (buf!340 thiss!932)) (currentByte!1238 thiss!932) (currentBit!1233 thiss!932)))))

(declare-fun b!428 () Bool)

(declare-fun e!185 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!428 (= e!185 (invariant!0 (currentBit!1233 (_2!0 lt!9)) (currentByte!1238 (_2!0 lt!9)) (size!28 (buf!340 (_2!0 lt!9)))))))

(declare-fun b!429 () Bool)

(declare-fun e!186 () Bool)

(declare-datatypes ((tuple2!2 0))(
  ( (tuple2!3 (_1!1 BitStream!40) (_2!1 Bool)) )
))
(declare-fun lt!10 () tuple2!2)

(assert (=> b!429 (= e!186 (= (bitIndex!0 (size!28 (buf!340 (_1!1 lt!10))) (currentByte!1238 (_1!1 lt!10)) (currentBit!1233 (_1!1 lt!10))) lt!8))))

(declare-fun b!430 () Bool)

(assert (=> b!430 (= e!188 e!186)))

(declare-fun res!2532 () Bool)

(assert (=> b!430 (=> (not res!2532) (not e!186))))

(assert (=> b!430 (= res!2532 (and (_2!1 lt!10) (= (_1!1 lt!10) (_2!0 lt!9))))))

(declare-fun readBitPure!0 (BitStream!40) tuple2!2)

(declare-fun readerFrom!0 (BitStream!40 (_ BitVec 32) (_ BitVec 32)) BitStream!40)

(assert (=> b!430 (= lt!10 (readBitPure!0 (readerFrom!0 (_2!0 lt!9) (currentBit!1233 thiss!932) (currentByte!1238 thiss!932))))))

(declare-fun res!2536 () Bool)

(declare-fun e!191 () Bool)

(assert (=> start!178 (=> (not res!2536) (not e!191))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!178 (= res!2536 (validate_offset_bit!0 ((_ sign_extend 32) (size!28 (buf!340 thiss!932))) ((_ sign_extend 32) (currentByte!1238 thiss!932)) ((_ sign_extend 32) (currentBit!1233 thiss!932))))))

(assert (=> start!178 e!191))

(declare-fun e!189 () Bool)

(declare-fun inv!12 (BitStream!40) Bool)

(assert (=> start!178 (and (inv!12 thiss!932) e!189)))

(declare-fun b!431 () Bool)

(declare-fun array_inv!25 (array!72) Bool)

(assert (=> b!431 (= e!189 (array_inv!25 (buf!340 thiss!932)))))

(declare-fun b!432 () Bool)

(declare-fun res!2533 () Bool)

(assert (=> b!432 (=> (not res!2533) (not e!188))))

(declare-fun isPrefixOf!0 (BitStream!40 BitStream!40) Bool)

(assert (=> b!432 (= res!2533 (isPrefixOf!0 thiss!932 (_2!0 lt!9)))))

(declare-fun b!433 () Bool)

(assert (=> b!433 (= e!191 (not e!185))))

(declare-fun res!2535 () Bool)

(assert (=> b!433 (=> res!2535 e!185)))

(assert (=> b!433 (= res!2535 (not (= (size!28 (buf!340 (_2!0 lt!9))) (size!28 (buf!340 thiss!932)))))))

(assert (=> b!433 e!190))

(declare-fun res!2531 () Bool)

(assert (=> b!433 (=> (not res!2531) (not e!190))))

(assert (=> b!433 (= res!2531 (= (size!28 (buf!340 thiss!932)) (size!28 (buf!340 (_2!0 lt!9)))))))

(declare-fun appendBit!0 (BitStream!40 Bool) tuple2!0)

(assert (=> b!433 (= lt!9 (appendBit!0 thiss!932 true))))

(assert (= (and start!178 res!2536) b!433))

(assert (= (and b!433 res!2531) b!427))

(assert (= (and b!427 res!2534) b!432))

(assert (= (and b!432 res!2533) b!430))

(assert (= (and b!430 res!2532) b!429))

(assert (= (and b!433 (not res!2535)) b!428))

(assert (= start!178 b!431))

(declare-fun m!175 () Bool)

(assert (=> start!178 m!175))

(declare-fun m!177 () Bool)

(assert (=> start!178 m!177))

(declare-fun m!179 () Bool)

(assert (=> b!428 m!179))

(declare-fun m!181 () Bool)

(assert (=> b!429 m!181))

(declare-fun m!183 () Bool)

(assert (=> b!430 m!183))

(assert (=> b!430 m!183))

(declare-fun m!185 () Bool)

(assert (=> b!430 m!185))

(declare-fun m!187 () Bool)

(assert (=> b!431 m!187))

(declare-fun m!189 () Bool)

(assert (=> b!432 m!189))

(declare-fun m!191 () Bool)

(assert (=> b!427 m!191))

(declare-fun m!193 () Bool)

(assert (=> b!427 m!193))

(declare-fun m!195 () Bool)

(assert (=> b!433 m!195))

(push 1)

(assert (not b!427))

(assert (not b!428))

(assert (not b!432))

(assert (not b!433))

(assert (not start!178))

(assert (not b!431))

(assert (not b!429))

(assert (not b!430))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!844 () Bool)

(assert (=> d!844 (= (array_inv!25 (buf!340 thiss!932)) (bvsge (size!28 (buf!340 thiss!932)) #b00000000000000000000000000000000))))

(assert (=> b!431 d!844))

(declare-fun d!846 () Bool)

(declare-fun res!2581 () Bool)

(declare-fun e!239 () Bool)

(assert (=> d!846 (=> (not res!2581) (not e!239))))

(assert (=> d!846 (= res!2581 (= (size!28 (buf!340 thiss!932)) (size!28 (buf!340 (_2!0 lt!9)))))))

(assert (=> d!846 (= (isPrefixOf!0 thiss!932 (_2!0 lt!9)) e!239)))

(declare-fun b!482 () Bool)

(declare-fun res!2580 () Bool)

(assert (=> b!482 (=> (not res!2580) (not e!239))))

(assert (=> b!482 (= res!2580 (bvsle (bitIndex!0 (size!28 (buf!340 thiss!932)) (currentByte!1238 thiss!932) (currentBit!1233 thiss!932)) (bitIndex!0 (size!28 (buf!340 (_2!0 lt!9))) (currentByte!1238 (_2!0 lt!9)) (currentBit!1233 (_2!0 lt!9)))))))

(declare-fun b!483 () Bool)

(declare-fun e!238 () Bool)

(assert (=> b!483 (= e!239 e!238)))

(declare-fun res!2579 () Bool)

(assert (=> b!483 (=> res!2579 e!238)))

(assert (=> b!483 (= res!2579 (= (size!28 (buf!340 thiss!932)) #b00000000000000000000000000000000))))

(declare-fun b!484 () Bool)

(declare-fun arrayBitRangesEq!0 (array!72 array!72 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!484 (= e!238 (arrayBitRangesEq!0 (buf!340 thiss!932) (buf!340 (_2!0 lt!9)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!28 (buf!340 thiss!932)) (currentByte!1238 thiss!932) (currentBit!1233 thiss!932))))))

(assert (= (and d!846 res!2581) b!482))

(assert (= (and b!482 res!2580) b!483))

(assert (= (and b!483 (not res!2579)) b!484))

(assert (=> b!482 m!193))

(assert (=> b!482 m!191))

(assert (=> b!484 m!193))

(assert (=> b!484 m!193))

(declare-fun m!243 () Bool)

(assert (=> b!484 m!243))

(assert (=> b!432 d!846))

(declare-fun d!852 () Bool)

(declare-datatypes ((tuple2!14 0))(
  ( (tuple2!15 (_1!7 Bool) (_2!7 BitStream!40)) )
))
(declare-fun lt!41 () tuple2!14)

(declare-fun readBit!0 (BitStream!40) tuple2!14)

(assert (=> d!852 (= lt!41 (readBit!0 (readerFrom!0 (_2!0 lt!9) (currentBit!1233 thiss!932) (currentByte!1238 thiss!932))))))

(assert (=> d!852 (= (readBitPure!0 (readerFrom!0 (_2!0 lt!9) (currentBit!1233 thiss!932) (currentByte!1238 thiss!932))) (tuple2!3 (_2!7 lt!41) (_1!7 lt!41)))))

(declare-fun bs!379 () Bool)

(assert (= bs!379 d!852))

(assert (=> bs!379 m!183))

(declare-fun m!245 () Bool)

(assert (=> bs!379 m!245))

(assert (=> b!430 d!852))

(declare-fun d!854 () Bool)

(declare-fun e!247 () Bool)

(assert (=> d!854 e!247))

(declare-fun res!2593 () Bool)

(assert (=> d!854 (=> (not res!2593) (not e!247))))

(assert (=> d!854 (= res!2593 (invariant!0 (currentBit!1233 (_2!0 lt!9)) (currentByte!1238 (_2!0 lt!9)) (size!28 (buf!340 (_2!0 lt!9)))))))

(assert (=> d!854 (= (readerFrom!0 (_2!0 lt!9) (currentBit!1233 thiss!932) (currentByte!1238 thiss!932)) (BitStream!41 (buf!340 (_2!0 lt!9)) (currentByte!1238 thiss!932) (currentBit!1233 thiss!932)))))

(declare-fun b!494 () Bool)

(assert (=> b!494 (= e!247 (invariant!0 (currentBit!1233 thiss!932) (currentByte!1238 thiss!932) (size!28 (buf!340 (_2!0 lt!9)))))))

(assert (= (and d!854 res!2593) b!494))

(assert (=> d!854 m!179))

(declare-fun m!249 () Bool)

(assert (=> b!494 m!249))

(assert (=> b!430 d!854))

(declare-fun d!858 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!858 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!28 (buf!340 thiss!932))) ((_ sign_extend 32) (currentByte!1238 thiss!932)) ((_ sign_extend 32) (currentBit!1233 thiss!932))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!28 (buf!340 thiss!932))) ((_ sign_extend 32) (currentByte!1238 thiss!932)) ((_ sign_extend 32) (currentBit!1233 thiss!932))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!380 () Bool)

(assert (= bs!380 d!858))

(declare-fun m!251 () Bool)

(assert (=> bs!380 m!251))

(assert (=> start!178 d!858))

(declare-fun d!860 () Bool)

(assert (=> d!860 (= (inv!12 thiss!932) (invariant!0 (currentBit!1233 thiss!932) (currentByte!1238 thiss!932) (size!28 (buf!340 thiss!932))))))

(declare-fun bs!381 () Bool)

(assert (= bs!381 d!860))

(declare-fun m!255 () Bool)

(assert (=> bs!381 m!255))

(assert (=> start!178 d!860))

(declare-fun d!864 () Bool)

(declare-fun e!262 () Bool)

(assert (=> d!864 e!262))

(declare-fun res!2619 () Bool)

(assert (=> d!864 (=> (not res!2619) (not e!262))))

(declare-fun lt!102 () (_ BitVec 64))

(declare-fun lt!105 () (_ BitVec 64))

(declare-fun lt!103 () (_ BitVec 64))

(assert (=> d!864 (= res!2619 (= lt!102 (bvsub lt!105 lt!103)))))

(assert (=> d!864 (or (= (bvand lt!105 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!103 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!105 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!105 lt!103) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!864 (= lt!103 (remainingBits!0 ((_ sign_extend 32) (size!28 (buf!340 (_1!1 lt!10)))) ((_ sign_extend 32) (currentByte!1238 (_1!1 lt!10))) ((_ sign_extend 32) (currentBit!1233 (_1!1 lt!10)))))))

(declare-fun lt!104 () (_ BitVec 64))

(declare-fun lt!107 () (_ BitVec 64))

(assert (=> d!864 (= lt!105 (bvmul lt!104 lt!107))))

(assert (=> d!864 (or (= lt!104 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!107 (bvsdiv (bvmul lt!104 lt!107) lt!104)))))

(assert (=> d!864 (= lt!107 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!864 (= lt!104 ((_ sign_extend 32) (size!28 (buf!340 (_1!1 lt!10)))))))

(assert (=> d!864 (= lt!102 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1238 (_1!1 lt!10))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1233 (_1!1 lt!10)))))))

(assert (=> d!864 (invariant!0 (currentBit!1233 (_1!1 lt!10)) (currentByte!1238 (_1!1 lt!10)) (size!28 (buf!340 (_1!1 lt!10))))))

(assert (=> d!864 (= (bitIndex!0 (size!28 (buf!340 (_1!1 lt!10))) (currentByte!1238 (_1!1 lt!10)) (currentBit!1233 (_1!1 lt!10))) lt!102)))

(declare-fun b!520 () Bool)

(declare-fun res!2620 () Bool)

(assert (=> b!520 (=> (not res!2620) (not e!262))))

(assert (=> b!520 (= res!2620 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!102))))

(declare-fun b!521 () Bool)

(declare-fun lt!106 () (_ BitVec 64))

(assert (=> b!521 (= e!262 (bvsle lt!102 (bvmul lt!106 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!521 (or (= lt!106 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!106 #b0000000000000000000000000000000000000000000000000000000000001000) lt!106)))))

(assert (=> b!521 (= lt!106 ((_ sign_extend 32) (size!28 (buf!340 (_1!1 lt!10)))))))

(assert (= (and d!864 res!2619) b!520))

(assert (= (and b!520 res!2620) b!521))

(declare-fun m!269 () Bool)

(assert (=> d!864 m!269))

(declare-fun m!271 () Bool)

(assert (=> d!864 m!271))

(assert (=> b!429 d!864))

(declare-fun d!878 () Bool)

(declare-fun e!264 () Bool)

(assert (=> d!878 e!264))

(declare-fun res!2623 () Bool)

(assert (=> d!878 (=> (not res!2623) (not e!264))))

(declare-fun lt!115 () (_ BitVec 64))

(declare-fun lt!114 () (_ BitVec 64))

(declare-fun lt!117 () (_ BitVec 64))

(assert (=> d!878 (= res!2623 (= lt!114 (bvsub lt!117 lt!115)))))

(assert (=> d!878 (or (= (bvand lt!117 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!115 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!117 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!117 lt!115) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!878 (= lt!115 (remainingBits!0 ((_ sign_extend 32) (size!28 (buf!340 (_2!0 lt!9)))) ((_ sign_extend 32) (currentByte!1238 (_2!0 lt!9))) ((_ sign_extend 32) (currentBit!1233 (_2!0 lt!9)))))))

(declare-fun lt!116 () (_ BitVec 64))

(declare-fun lt!119 () (_ BitVec 64))

(assert (=> d!878 (= lt!117 (bvmul lt!116 lt!119))))

(assert (=> d!878 (or (= lt!116 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!119 (bvsdiv (bvmul lt!116 lt!119) lt!116)))))

(assert (=> d!878 (= lt!119 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!878 (= lt!116 ((_ sign_extend 32) (size!28 (buf!340 (_2!0 lt!9)))))))

(assert (=> d!878 (= lt!114 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1238 (_2!0 lt!9))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1233 (_2!0 lt!9)))))))

(assert (=> d!878 (invariant!0 (currentBit!1233 (_2!0 lt!9)) (currentByte!1238 (_2!0 lt!9)) (size!28 (buf!340 (_2!0 lt!9))))))

(assert (=> d!878 (= (bitIndex!0 (size!28 (buf!340 (_2!0 lt!9))) (currentByte!1238 (_2!0 lt!9)) (currentBit!1233 (_2!0 lt!9))) lt!114)))

(declare-fun b!524 () Bool)

(declare-fun res!2624 () Bool)

(assert (=> b!524 (=> (not res!2624) (not e!264))))

(assert (=> b!524 (= res!2624 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!114))))

(declare-fun b!525 () Bool)

(declare-fun lt!118 () (_ BitVec 64))

(assert (=> b!525 (= e!264 (bvsle lt!114 (bvmul lt!118 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!525 (or (= lt!118 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!118 #b0000000000000000000000000000000000000000000000000000000000001000) lt!118)))))

(assert (=> b!525 (= lt!118 ((_ sign_extend 32) (size!28 (buf!340 (_2!0 lt!9)))))))

(assert (= (and d!878 res!2623) b!524))

(assert (= (and b!524 res!2624) b!525))

(declare-fun m!277 () Bool)

(assert (=> d!878 m!277))

(assert (=> d!878 m!179))

(assert (=> b!427 d!878))

(declare-fun d!882 () Bool)

(declare-fun e!265 () Bool)

(assert (=> d!882 e!265))

(declare-fun res!2625 () Bool)

(assert (=> d!882 (=> (not res!2625) (not e!265))))

(declare-fun lt!121 () (_ BitVec 64))

(declare-fun lt!120 () (_ BitVec 64))

(declare-fun lt!123 () (_ BitVec 64))

(assert (=> d!882 (= res!2625 (= lt!120 (bvsub lt!123 lt!121)))))

(assert (=> d!882 (or (= (bvand lt!123 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!121 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!123 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!123 lt!121) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!882 (= lt!121 (remainingBits!0 ((_ sign_extend 32) (size!28 (buf!340 thiss!932))) ((_ sign_extend 32) (currentByte!1238 thiss!932)) ((_ sign_extend 32) (currentBit!1233 thiss!932))))))

(declare-fun lt!122 () (_ BitVec 64))

(declare-fun lt!125 () (_ BitVec 64))

(assert (=> d!882 (= lt!123 (bvmul lt!122 lt!125))))

(assert (=> d!882 (or (= lt!122 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125 (bvsdiv (bvmul lt!122 lt!125) lt!122)))))

(assert (=> d!882 (= lt!125 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!882 (= lt!122 ((_ sign_extend 32) (size!28 (buf!340 thiss!932))))))

(assert (=> d!882 (= lt!120 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1238 thiss!932)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1233 thiss!932))))))

(assert (=> d!882 (invariant!0 (currentBit!1233 thiss!932) (currentByte!1238 thiss!932) (size!28 (buf!340 thiss!932)))))

(assert (=> d!882 (= (bitIndex!0 (size!28 (buf!340 thiss!932)) (currentByte!1238 thiss!932) (currentBit!1233 thiss!932)) lt!120)))

(declare-fun b!526 () Bool)

(declare-fun res!2626 () Bool)

(assert (=> b!526 (=> (not res!2626) (not e!265))))

(assert (=> b!526 (= res!2626 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!120))))

(declare-fun b!527 () Bool)

(declare-fun lt!124 () (_ BitVec 64))

(assert (=> b!527 (= e!265 (bvsle lt!120 (bvmul lt!124 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!527 (or (= lt!124 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!124 #b0000000000000000000000000000000000000000000000000000000000001000) lt!124)))))

(assert (=> b!527 (= lt!124 ((_ sign_extend 32) (size!28 (buf!340 thiss!932))))))

(assert (= (and d!882 res!2625) b!526))

(assert (= (and b!526 res!2626) b!527))

(assert (=> d!882 m!251))

(assert (=> d!882 m!255))

(assert (=> b!427 d!882))

(declare-fun d!884 () Bool)

(assert (=> d!884 (= (invariant!0 (currentBit!1233 (_2!0 lt!9)) (currentByte!1238 (_2!0 lt!9)) (size!28 (buf!340 (_2!0 lt!9)))) (and (bvsge (currentBit!1233 (_2!0 lt!9)) #b00000000000000000000000000000000) (bvslt (currentBit!1233 (_2!0 lt!9)) #b00000000000000000000000000001000) (bvsge (currentByte!1238 (_2!0 lt!9)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1238 (_2!0 lt!9)) (size!28 (buf!340 (_2!0 lt!9)))) (and (= (currentBit!1233 (_2!0 lt!9)) #b00000000000000000000000000000000) (= (currentByte!1238 (_2!0 lt!9)) (size!28 (buf!340 (_2!0 lt!9))))))))))

(assert (=> b!428 d!884))

(declare-fun b!569 () Bool)

(declare-fun e!286 () Bool)

(declare-fun lt!163 () tuple2!2)

(declare-fun lt!161 () tuple2!0)

(assert (=> b!569 (= e!286 (= (bitIndex!0 (size!28 (buf!340 (_1!1 lt!163))) (currentByte!1238 (_1!1 lt!163)) (currentBit!1233 (_1!1 lt!163))) (bitIndex!0 (size!28 (buf!340 (_2!0 lt!161))) (currentByte!1238 (_2!0 lt!161)) (currentBit!1233 (_2!0 lt!161)))))))

(declare-fun b!567 () Bool)

(declare-fun res!2665 () Bool)

(declare-fun e!285 () Bool)

(assert (=> b!567 (=> (not res!2665) (not e!285))))

(assert (=> b!567 (= res!2665 (isPrefixOf!0 thiss!932 (_2!0 lt!161)))))

(declare-fun d!886 () Bool)

(assert (=> d!886 e!285))

(declare-fun res!2664 () Bool)

(assert (=> d!886 (=> (not res!2664) (not e!285))))

(assert (=> d!886 (= res!2664 (= (size!28 (buf!340 thiss!932)) (size!28 (buf!340 (_2!0 lt!161)))))))

(declare-fun choose!16 (BitStream!40 Bool) tuple2!0)

(assert (=> d!886 (= lt!161 (choose!16 thiss!932 true))))

(assert (=> d!886 (validate_offset_bit!0 ((_ sign_extend 32) (size!28 (buf!340 thiss!932))) ((_ sign_extend 32) (currentByte!1238 thiss!932)) ((_ sign_extend 32) (currentBit!1233 thiss!932)))))

(assert (=> d!886 (= (appendBit!0 thiss!932 true) lt!161)))

(declare-fun b!568 () Bool)

(assert (=> b!568 (= e!285 e!286)))

(declare-fun res!2666 () Bool)

(assert (=> b!568 (=> (not res!2666) (not e!286))))

(assert (=> b!568 (= res!2666 (and (= (_2!1 lt!163) true) (= (_1!1 lt!163) (_2!0 lt!161))))))

(assert (=> b!568 (= lt!163 (readBitPure!0 (readerFrom!0 (_2!0 lt!161) (currentBit!1233 thiss!932) (currentByte!1238 thiss!932))))))

(declare-fun b!566 () Bool)

(declare-fun res!2663 () Bool)

(assert (=> b!566 (=> (not res!2663) (not e!285))))

(declare-fun lt!162 () (_ BitVec 64))

(declare-fun lt!164 () (_ BitVec 64))

(assert (=> b!566 (= res!2663 (= (bitIndex!0 (size!28 (buf!340 (_2!0 lt!161))) (currentByte!1238 (_2!0 lt!161)) (currentBit!1233 (_2!0 lt!161))) (bvadd lt!162 lt!164)))))

(assert (=> b!566 (or (not (= (bvand lt!162 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!164 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!162 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!162 lt!164) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!566 (= lt!164 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!566 (= lt!162 (bitIndex!0 (size!28 (buf!340 thiss!932)) (currentByte!1238 thiss!932) (currentBit!1233 thiss!932)))))

(assert (= (and d!886 res!2664) b!566))

(assert (= (and b!566 res!2663) b!567))

(assert (= (and b!567 res!2665) b!568))

(assert (= (and b!568 res!2666) b!569))

(declare-fun m!307 () Bool)

(assert (=> b!567 m!307))

(declare-fun m!309 () Bool)

(assert (=> d!886 m!309))

(assert (=> d!886 m!175))

(declare-fun m!311 () Bool)

(assert (=> b!568 m!311))

(assert (=> b!568 m!311))

(declare-fun m!313 () Bool)

(assert (=> b!568 m!313))

(declare-fun m!315 () Bool)

(assert (=> b!566 m!315))

(assert (=> b!566 m!193))

(declare-fun m!317 () Bool)

(assert (=> b!569 m!317))

(assert (=> b!569 m!315))

(assert (=> b!433 d!886))

(push 1)

(assert (not d!882))

(assert (not b!482))

(assert (not b!568))

(assert (not b!566))

(assert (not b!494))

(assert (not d!854))

(assert (not d!852))

(assert (not d!878))

(assert (not b!567))

(assert (not b!569))

(assert (not d!860))

(assert (not d!858))

(assert (not d!886))

(assert (not d!864))

(assert (not b!484))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

