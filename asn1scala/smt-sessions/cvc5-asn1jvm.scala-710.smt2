; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19918 () Bool)

(assert start!19918)

(declare-fun b!99236 () Bool)

(declare-fun res!81390 () Bool)

(declare-fun e!64951 () Bool)

(assert (=> b!99236 (=> (not res!81390) (not e!64951))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99236 (= res!81390 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!99237 () Bool)

(declare-fun e!64956 () Bool)

(assert (=> b!99237 (= e!64951 (not e!64956))))

(declare-fun res!81393 () Bool)

(assert (=> b!99237 (=> res!81393 e!64956)))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!99237 (= res!81393 (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!64952 () Bool)

(assert (=> b!99237 e!64952))

(declare-fun res!81388 () Bool)

(assert (=> b!99237 (=> (not res!81388) (not e!64952))))

(declare-datatypes ((array!4668 0))(
  ( (array!4669 (arr!2724 (Array (_ BitVec 32) (_ BitVec 8))) (size!2131 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3736 0))(
  ( (BitStream!3737 (buf!2488 array!4668) (currentByte!4928 (_ BitVec 32)) (currentBit!4923 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3736)

(declare-datatypes ((Unit!6089 0))(
  ( (Unit!6090) )
))
(declare-datatypes ((tuple2!7984 0))(
  ( (tuple2!7985 (_1!4247 Unit!6089) (_2!4247 BitStream!3736)) )
))
(declare-fun lt!144110 () tuple2!7984)

(assert (=> b!99237 (= res!81388 (= (size!2131 (buf!2488 thiss!1305)) (size!2131 (buf!2488 (_2!4247 lt!144110)))))))

(declare-fun lt!144108 () Bool)

(declare-fun appendBit!0 (BitStream!3736 Bool) tuple2!7984)

(assert (=> b!99237 (= lt!144110 (appendBit!0 thiss!1305 lt!144108))))

(assert (=> b!99237 (= lt!144108 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!99238 () Bool)

(declare-fun res!81395 () Bool)

(assert (=> b!99238 (=> (not res!81395) (not e!64951))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!99238 (= res!81395 (validate_offset_bits!1 ((_ sign_extend 32) (size!2131 (buf!2488 thiss!1305))) ((_ sign_extend 32) (currentByte!4928 thiss!1305)) ((_ sign_extend 32) (currentBit!4923 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!99239 () Bool)

(declare-fun res!81394 () Bool)

(assert (=> b!99239 (=> (not res!81394) (not e!64951))))

(assert (=> b!99239 (= res!81394 (bvslt i!615 nBits!396))))

(declare-fun b!99240 () Bool)

(declare-fun e!64953 () Bool)

(assert (=> b!99240 (= e!64952 e!64953)))

(declare-fun res!81392 () Bool)

(assert (=> b!99240 (=> (not res!81392) (not e!64953))))

(declare-fun lt!144111 () (_ BitVec 64))

(declare-fun lt!144112 () (_ BitVec 64))

(assert (=> b!99240 (= res!81392 (= lt!144111 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!144112)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99240 (= lt!144111 (bitIndex!0 (size!2131 (buf!2488 (_2!4247 lt!144110))) (currentByte!4928 (_2!4247 lt!144110)) (currentBit!4923 (_2!4247 lt!144110))))))

(assert (=> b!99240 (= lt!144112 (bitIndex!0 (size!2131 (buf!2488 thiss!1305)) (currentByte!4928 thiss!1305) (currentBit!4923 thiss!1305)))))

(declare-fun b!99241 () Bool)

(declare-fun e!64954 () Bool)

(declare-datatypes ((tuple2!7986 0))(
  ( (tuple2!7987 (_1!4248 BitStream!3736) (_2!4248 Bool)) )
))
(declare-fun lt!144109 () tuple2!7986)

(assert (=> b!99241 (= e!64954 (= (bitIndex!0 (size!2131 (buf!2488 (_1!4248 lt!144109))) (currentByte!4928 (_1!4248 lt!144109)) (currentBit!4923 (_1!4248 lt!144109))) lt!144111))))

(declare-fun b!99242 () Bool)

(declare-fun e!64950 () Bool)

(declare-fun array_inv!1933 (array!4668) Bool)

(assert (=> b!99242 (= e!64950 (array_inv!1933 (buf!2488 thiss!1305)))))

(declare-fun b!99243 () Bool)

(assert (=> b!99243 (= e!64956 (validate_offset_bits!1 ((_ sign_extend 32) (size!2131 (buf!2488 (_2!4247 lt!144110)))) ((_ sign_extend 32) (currentByte!4928 (_2!4247 lt!144110))) ((_ sign_extend 32) (currentBit!4923 (_2!4247 lt!144110))) ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun res!81389 () Bool)

(assert (=> start!19918 (=> (not res!81389) (not e!64951))))

(assert (=> start!19918 (= res!81389 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!19918 e!64951))

(assert (=> start!19918 true))

(declare-fun inv!12 (BitStream!3736) Bool)

(assert (=> start!19918 (and (inv!12 thiss!1305) e!64950)))

(declare-fun b!99244 () Bool)

(declare-fun res!81391 () Bool)

(assert (=> b!99244 (=> (not res!81391) (not e!64953))))

(declare-fun isPrefixOf!0 (BitStream!3736 BitStream!3736) Bool)

(assert (=> b!99244 (= res!81391 (isPrefixOf!0 thiss!1305 (_2!4247 lt!144110)))))

(declare-fun b!99245 () Bool)

(assert (=> b!99245 (= e!64953 e!64954)))

(declare-fun res!81387 () Bool)

(assert (=> b!99245 (=> (not res!81387) (not e!64954))))

(assert (=> b!99245 (= res!81387 (and (= (_2!4248 lt!144109) lt!144108) (= (_1!4248 lt!144109) (_2!4247 lt!144110))))))

(declare-fun readBitPure!0 (BitStream!3736) tuple2!7986)

(declare-fun readerFrom!0 (BitStream!3736 (_ BitVec 32) (_ BitVec 32)) BitStream!3736)

(assert (=> b!99245 (= lt!144109 (readBitPure!0 (readerFrom!0 (_2!4247 lt!144110) (currentBit!4923 thiss!1305) (currentByte!4928 thiss!1305))))))

(assert (= (and start!19918 res!81389) b!99238))

(assert (= (and b!99238 res!81395) b!99236))

(assert (= (and b!99236 res!81390) b!99239))

(assert (= (and b!99239 res!81394) b!99237))

(assert (= (and b!99237 res!81388) b!99240))

(assert (= (and b!99240 res!81392) b!99244))

(assert (= (and b!99244 res!81391) b!99245))

(assert (= (and b!99245 res!81387) b!99241))

(assert (= (and b!99237 (not res!81393)) b!99243))

(assert (= start!19918 b!99242))

(declare-fun m!144631 () Bool)

(assert (=> b!99238 m!144631))

(declare-fun m!144633 () Bool)

(assert (=> b!99237 m!144633))

(declare-fun m!144635 () Bool)

(assert (=> b!99241 m!144635))

(declare-fun m!144637 () Bool)

(assert (=> start!19918 m!144637))

(declare-fun m!144639 () Bool)

(assert (=> b!99245 m!144639))

(assert (=> b!99245 m!144639))

(declare-fun m!144641 () Bool)

(assert (=> b!99245 m!144641))

(declare-fun m!144643 () Bool)

(assert (=> b!99242 m!144643))

(declare-fun m!144645 () Bool)

(assert (=> b!99244 m!144645))

(declare-fun m!144647 () Bool)

(assert (=> b!99243 m!144647))

(declare-fun m!144649 () Bool)

(assert (=> b!99240 m!144649))

(declare-fun m!144651 () Bool)

(assert (=> b!99240 m!144651))

(declare-fun m!144653 () Bool)

(assert (=> b!99236 m!144653))

(push 1)

(assert (not b!99245))

(assert (not b!99240))

(assert (not b!99236))

(assert (not b!99241))

(assert (not b!99243))

(assert (not b!99242))

(assert (not b!99238))

(assert (not start!19918))

(assert (not b!99244))

(assert (not b!99237))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!31296 () Bool)

(declare-fun res!81477 () Bool)

(declare-fun e!65015 () Bool)

(assert (=> d!31296 (=> (not res!81477) (not e!65015))))

(assert (=> d!31296 (= res!81477 (= (size!2131 (buf!2488 thiss!1305)) (size!2131 (buf!2488 (_2!4247 lt!144110)))))))

(assert (=> d!31296 (= (isPrefixOf!0 thiss!1305 (_2!4247 lt!144110)) e!65015)))

(declare-fun b!99334 () Bool)

(declare-fun res!81479 () Bool)

(assert (=> b!99334 (=> (not res!81479) (not e!65015))))

(assert (=> b!99334 (= res!81479 (bvsle (bitIndex!0 (size!2131 (buf!2488 thiss!1305)) (currentByte!4928 thiss!1305) (currentBit!4923 thiss!1305)) (bitIndex!0 (size!2131 (buf!2488 (_2!4247 lt!144110))) (currentByte!4928 (_2!4247 lt!144110)) (currentBit!4923 (_2!4247 lt!144110)))))))

(declare-fun b!99335 () Bool)

(declare-fun e!65016 () Bool)

(assert (=> b!99335 (= e!65015 e!65016)))

(declare-fun res!81478 () Bool)

(assert (=> b!99335 (=> res!81478 e!65016)))

(assert (=> b!99335 (= res!81478 (= (size!2131 (buf!2488 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!99336 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4668 array!4668 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!99336 (= e!65016 (arrayBitRangesEq!0 (buf!2488 thiss!1305) (buf!2488 (_2!4247 lt!144110)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2131 (buf!2488 thiss!1305)) (currentByte!4928 thiss!1305) (currentBit!4923 thiss!1305))))))

(assert (= (and d!31296 res!81477) b!99334))

(assert (= (and b!99334 res!81479) b!99335))

(assert (= (and b!99335 (not res!81478)) b!99336))

(assert (=> b!99334 m!144651))

(assert (=> b!99334 m!144649))

(assert (=> b!99336 m!144651))

(assert (=> b!99336 m!144651))

(declare-fun m!144719 () Bool)

(assert (=> b!99336 m!144719))

(assert (=> b!99244 d!31296))

(declare-fun d!31300 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!31300 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2131 (buf!2488 thiss!1305))) ((_ sign_extend 32) (currentByte!4928 thiss!1305)) ((_ sign_extend 32) (currentBit!4923 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2131 (buf!2488 thiss!1305))) ((_ sign_extend 32) (currentByte!4928 thiss!1305)) ((_ sign_extend 32) (currentBit!4923 thiss!1305))) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun bs!7669 () Bool)

(assert (= bs!7669 d!31300))

(declare-fun m!144721 () Bool)

(assert (=> bs!7669 m!144721))

(assert (=> b!99238 d!31300))

(declare-fun d!31302 () Bool)

(declare-fun e!65023 () Bool)

(assert (=> d!31302 e!65023))

(declare-fun res!81494 () Bool)

(assert (=> d!31302 (=> (not res!81494) (not e!65023))))

(declare-fun lt!144199 () (_ BitVec 64))

(declare-fun lt!144197 () (_ BitVec 64))

(declare-fun lt!144195 () (_ BitVec 64))

(assert (=> d!31302 (= res!81494 (= lt!144197 (bvsub lt!144195 lt!144199)))))

(assert (=> d!31302 (or (= (bvand lt!144195 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!144199 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!144195 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!144195 lt!144199) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31302 (= lt!144199 (remainingBits!0 ((_ sign_extend 32) (size!2131 (buf!2488 (_2!4247 lt!144110)))) ((_ sign_extend 32) (currentByte!4928 (_2!4247 lt!144110))) ((_ sign_extend 32) (currentBit!4923 (_2!4247 lt!144110)))))))

(declare-fun lt!144198 () (_ BitVec 64))

(declare-fun lt!144194 () (_ BitVec 64))

(assert (=> d!31302 (= lt!144195 (bvmul lt!144198 lt!144194))))

(assert (=> d!31302 (or (= lt!144198 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!144194 (bvsdiv (bvmul lt!144198 lt!144194) lt!144198)))))

(assert (=> d!31302 (= lt!144194 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31302 (= lt!144198 ((_ sign_extend 32) (size!2131 (buf!2488 (_2!4247 lt!144110)))))))

(assert (=> d!31302 (= lt!144197 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4928 (_2!4247 lt!144110))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4923 (_2!4247 lt!144110)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!31302 (invariant!0 (currentBit!4923 (_2!4247 lt!144110)) (currentByte!4928 (_2!4247 lt!144110)) (size!2131 (buf!2488 (_2!4247 lt!144110))))))

(assert (=> d!31302 (= (bitIndex!0 (size!2131 (buf!2488 (_2!4247 lt!144110))) (currentByte!4928 (_2!4247 lt!144110)) (currentBit!4923 (_2!4247 lt!144110))) lt!144197)))

(declare-fun b!99349 () Bool)

(declare-fun res!81493 () Bool)

(assert (=> b!99349 (=> (not res!81493) (not e!65023))))

(assert (=> b!99349 (= res!81493 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!144197))))

(declare-fun b!99350 () Bool)

(declare-fun lt!144196 () (_ BitVec 64))

(assert (=> b!99350 (= e!65023 (bvsle lt!144197 (bvmul lt!144196 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!99350 (or (= lt!144196 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!144196 #b0000000000000000000000000000000000000000000000000000000000001000) lt!144196)))))

(assert (=> b!99350 (= lt!144196 ((_ sign_extend 32) (size!2131 (buf!2488 (_2!4247 lt!144110)))))))

(assert (= (and d!31302 res!81494) b!99349))

(assert (= (and b!99349 res!81493) b!99350))

(declare-fun m!144733 () Bool)

(assert (=> d!31302 m!144733))

(declare-fun m!144735 () Bool)

(assert (=> d!31302 m!144735))

(assert (=> b!99240 d!31302))

(declare-fun d!31314 () Bool)

(declare-fun e!65024 () Bool)

(assert (=> d!31314 e!65024))

(declare-fun res!81496 () Bool)

(assert (=> d!31314 (=> (not res!81496) (not e!65024))))

(declare-fun lt!144205 () (_ BitVec 64))

(declare-fun lt!144201 () (_ BitVec 64))

(declare-fun lt!144203 () (_ BitVec 64))

(assert (=> d!31314 (= res!81496 (= lt!144203 (bvsub lt!144201 lt!144205)))))

(assert (=> d!31314 (or (= (bvand lt!144201 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!144205 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!144201 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!144201 lt!144205) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31314 (= lt!144205 (remainingBits!0 ((_ sign_extend 32) (size!2131 (buf!2488 thiss!1305))) ((_ sign_extend 32) (currentByte!4928 thiss!1305)) ((_ sign_extend 32) (currentBit!4923 thiss!1305))))))

(declare-fun lt!144204 () (_ BitVec 64))

(declare-fun lt!144200 () (_ BitVec 64))

(assert (=> d!31314 (= lt!144201 (bvmul lt!144204 lt!144200))))

(assert (=> d!31314 (or (= lt!144204 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!144200 (bvsdiv (bvmul lt!144204 lt!144200) lt!144204)))))

(assert (=> d!31314 (= lt!144200 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31314 (= lt!144204 ((_ sign_extend 32) (size!2131 (buf!2488 thiss!1305))))))

(assert (=> d!31314 (= lt!144203 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4928 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4923 thiss!1305))))))

(assert (=> d!31314 (invariant!0 (currentBit!4923 thiss!1305) (currentByte!4928 thiss!1305) (size!2131 (buf!2488 thiss!1305)))))

(assert (=> d!31314 (= (bitIndex!0 (size!2131 (buf!2488 thiss!1305)) (currentByte!4928 thiss!1305) (currentBit!4923 thiss!1305)) lt!144203)))

(declare-fun b!99351 () Bool)

(declare-fun res!81495 () Bool)

(assert (=> b!99351 (=> (not res!81495) (not e!65024))))

(assert (=> b!99351 (= res!81495 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!144203))))

(declare-fun b!99352 () Bool)

(declare-fun lt!144202 () (_ BitVec 64))

(assert (=> b!99352 (= e!65024 (bvsle lt!144203 (bvmul lt!144202 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!99352 (or (= lt!144202 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!144202 #b0000000000000000000000000000000000000000000000000000000000001000) lt!144202)))))

(assert (=> b!99352 (= lt!144202 ((_ sign_extend 32) (size!2131 (buf!2488 thiss!1305))))))

(assert (= (and d!31314 res!81496) b!99351))

(assert (= (and b!99351 res!81495) b!99352))

(assert (=> d!31314 m!144721))

(declare-fun m!144737 () Bool)

(assert (=> d!31314 m!144737))

(assert (=> b!99240 d!31314))

(declare-fun d!31316 () Bool)

(declare-datatypes ((tuple2!7998 0))(
  ( (tuple2!7999 (_1!4254 Bool) (_2!4254 BitStream!3736)) )
))
(declare-fun lt!144208 () tuple2!7998)

(declare-fun readBit!0 (BitStream!3736) tuple2!7998)

(assert (=> d!31316 (= lt!144208 (readBit!0 (readerFrom!0 (_2!4247 lt!144110) (currentBit!4923 thiss!1305) (currentByte!4928 thiss!1305))))))

(assert (=> d!31316 (= (readBitPure!0 (readerFrom!0 (_2!4247 lt!144110) (currentBit!4923 thiss!1305) (currentByte!4928 thiss!1305))) (tuple2!7987 (_2!4254 lt!144208) (_1!4254 lt!144208)))))

(declare-fun bs!7673 () Bool)

(assert (= bs!7673 d!31316))

(assert (=> bs!7673 m!144639))

(declare-fun m!144741 () Bool)

(assert (=> bs!7673 m!144741))

(assert (=> b!99245 d!31316))

(declare-fun d!31324 () Bool)

(declare-fun e!65031 () Bool)

(assert (=> d!31324 e!65031))

(declare-fun res!81505 () Bool)

(assert (=> d!31324 (=> (not res!81505) (not e!65031))))

(assert (=> d!31324 (= res!81505 (invariant!0 (currentBit!4923 (_2!4247 lt!144110)) (currentByte!4928 (_2!4247 lt!144110)) (size!2131 (buf!2488 (_2!4247 lt!144110)))))))

(assert (=> d!31324 (= (readerFrom!0 (_2!4247 lt!144110) (currentBit!4923 thiss!1305) (currentByte!4928 thiss!1305)) (BitStream!3737 (buf!2488 (_2!4247 lt!144110)) (currentByte!4928 thiss!1305) (currentBit!4923 thiss!1305)))))

(declare-fun b!99360 () Bool)

(assert (=> b!99360 (= e!65031 (invariant!0 (currentBit!4923 thiss!1305) (currentByte!4928 thiss!1305) (size!2131 (buf!2488 (_2!4247 lt!144110)))))))

(assert (= (and d!31324 res!81505) b!99360))

(assert (=> d!31324 m!144735))

(declare-fun m!144749 () Bool)

(assert (=> b!99360 m!144749))

(assert (=> b!99245 d!31324))

(declare-fun d!31332 () Bool)

(assert (=> d!31332 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!99236 d!31332))

(declare-fun d!31334 () Bool)

(declare-fun e!65032 () Bool)

(assert (=> d!31334 e!65032))

(declare-fun res!81507 () Bool)

(assert (=> d!31334 (=> (not res!81507) (not e!65032))))

(declare-fun lt!144218 () (_ BitVec 64))

(declare-fun lt!144220 () (_ BitVec 64))

(declare-fun lt!144216 () (_ BitVec 64))

(assert (=> d!31334 (= res!81507 (= lt!144218 (bvsub lt!144216 lt!144220)))))

(assert (=> d!31334 (or (= (bvand lt!144216 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!144220 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!144216 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!144216 lt!144220) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31334 (= lt!144220 (remainingBits!0 ((_ sign_extend 32) (size!2131 (buf!2488 (_1!4248 lt!144109)))) ((_ sign_extend 32) (currentByte!4928 (_1!4248 lt!144109))) ((_ sign_extend 32) (currentBit!4923 (_1!4248 lt!144109)))))))

(declare-fun lt!144219 () (_ BitVec 64))

(declare-fun lt!144215 () (_ BitVec 64))

(assert (=> d!31334 (= lt!144216 (bvmul lt!144219 lt!144215))))

(assert (=> d!31334 (or (= lt!144219 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!144215 (bvsdiv (bvmul lt!144219 lt!144215) lt!144219)))))

(assert (=> d!31334 (= lt!144215 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31334 (= lt!144219 ((_ sign_extend 32) (size!2131 (buf!2488 (_1!4248 lt!144109)))))))

(assert (=> d!31334 (= lt!144218 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4928 (_1!4248 lt!144109))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4923 (_1!4248 lt!144109)))))))

(assert (=> d!31334 (invariant!0 (currentBit!4923 (_1!4248 lt!144109)) (currentByte!4928 (_1!4248 lt!144109)) (size!2131 (buf!2488 (_1!4248 lt!144109))))))

(assert (=> d!31334 (= (bitIndex!0 (size!2131 (buf!2488 (_1!4248 lt!144109))) (currentByte!4928 (_1!4248 lt!144109)) (currentBit!4923 (_1!4248 lt!144109))) lt!144218)))

(declare-fun b!99361 () Bool)

(declare-fun res!81506 () Bool)

(assert (=> b!99361 (=> (not res!81506) (not e!65032))))

(assert (=> b!99361 (= res!81506 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!144218))))

(declare-fun b!99362 () Bool)

(declare-fun lt!144217 () (_ BitVec 64))

(assert (=> b!99362 (= e!65032 (bvsle lt!144218 (bvmul lt!144217 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!99362 (or (= lt!144217 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!144217 #b0000000000000000000000000000000000000000000000000000000000001000) lt!144217)))))

(assert (=> b!99362 (= lt!144217 ((_ sign_extend 32) (size!2131 (buf!2488 (_1!4248 lt!144109)))))))

(assert (= (and d!31334 res!81507) b!99361))

(assert (= (and b!99361 res!81506) b!99362))

(declare-fun m!144751 () Bool)

(assert (=> d!31334 m!144751))

(declare-fun m!144753 () Bool)

(assert (=> d!31334 m!144753))

(assert (=> b!99241 d!31334))

(declare-fun d!31338 () Bool)

(assert (=> d!31338 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2131 (buf!2488 (_2!4247 lt!144110)))) ((_ sign_extend 32) (currentByte!4928 (_2!4247 lt!144110))) ((_ sign_extend 32) (currentBit!4923 (_2!4247 lt!144110))) ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2131 (buf!2488 (_2!4247 lt!144110)))) ((_ sign_extend 32) (currentByte!4928 (_2!4247 lt!144110))) ((_ sign_extend 32) (currentBit!4923 (_2!4247 lt!144110)))) ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun bs!7676 () Bool)

(assert (= bs!7676 d!31338))

(assert (=> bs!7676 m!144733))

(assert (=> b!99243 d!31338))

(declare-fun d!31340 () Bool)

(assert (=> d!31340 (= (inv!12 thiss!1305) (invariant!0 (currentBit!4923 thiss!1305) (currentByte!4928 thiss!1305) (size!2131 (buf!2488 thiss!1305))))))

(declare-fun bs!7677 () Bool)

(assert (= bs!7677 d!31340))

(assert (=> bs!7677 m!144737))

(assert (=> start!19918 d!31340))

(declare-fun b!99378 () Bool)

(declare-fun res!81525 () Bool)

(declare-fun e!65040 () Bool)

(assert (=> b!99378 (=> (not res!81525) (not e!65040))))

(declare-fun lt!144250 () (_ BitVec 64))

(declare-fun lt!144247 () tuple2!7984)

(declare-fun lt!144248 () (_ BitVec 64))

(assert (=> b!99378 (= res!81525 (= (bitIndex!0 (size!2131 (buf!2488 (_2!4247 lt!144247))) (currentByte!4928 (_2!4247 lt!144247)) (currentBit!4923 (_2!4247 lt!144247))) (bvadd lt!144250 lt!144248)))))

(assert (=> b!99378 (or (not (= (bvand lt!144250 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!144248 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!144250 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!144250 lt!144248) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!99378 (= lt!144248 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!99378 (= lt!144250 (bitIndex!0 (size!2131 (buf!2488 thiss!1305)) (currentByte!4928 thiss!1305) (currentBit!4923 thiss!1305)))))

(declare-fun d!31342 () Bool)

(assert (=> d!31342 e!65040))

(declare-fun res!81523 () Bool)

(assert (=> d!31342 (=> (not res!81523) (not e!65040))))

(assert (=> d!31342 (= res!81523 (= (size!2131 (buf!2488 thiss!1305)) (size!2131 (buf!2488 (_2!4247 lt!144247)))))))

(declare-fun choose!16 (BitStream!3736 Bool) tuple2!7984)

(assert (=> d!31342 (= lt!144247 (choose!16 thiss!1305 lt!144108))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!31342 (validate_offset_bit!0 ((_ sign_extend 32) (size!2131 (buf!2488 thiss!1305))) ((_ sign_extend 32) (currentByte!4928 thiss!1305)) ((_ sign_extend 32) (currentBit!4923 thiss!1305)))))

(assert (=> d!31342 (= (appendBit!0 thiss!1305 lt!144108) lt!144247)))

(declare-fun b!99380 () Bool)

(declare-fun e!65041 () Bool)

(assert (=> b!99380 (= e!65040 e!65041)))

(declare-fun res!81522 () Bool)

(assert (=> b!99380 (=> (not res!81522) (not e!65041))))

(declare-fun lt!144249 () tuple2!7986)

(assert (=> b!99380 (= res!81522 (and (= (_2!4248 lt!144249) lt!144108) (= (_1!4248 lt!144249) (_2!4247 lt!144247))))))

(assert (=> b!99380 (= lt!144249 (readBitPure!0 (readerFrom!0 (_2!4247 lt!144247) (currentBit!4923 thiss!1305) (currentByte!4928 thiss!1305))))))

(declare-fun b!99379 () Bool)

(declare-fun res!81524 () Bool)

(assert (=> b!99379 (=> (not res!81524) (not e!65040))))

(assert (=> b!99379 (= res!81524 (isPrefixOf!0 thiss!1305 (_2!4247 lt!144247)))))

(declare-fun b!99381 () Bool)

(assert (=> b!99381 (= e!65041 (= (bitIndex!0 (size!2131 (buf!2488 (_1!4248 lt!144249))) (currentByte!4928 (_1!4248 lt!144249)) (currentBit!4923 (_1!4248 lt!144249))) (bitIndex!0 (size!2131 (buf!2488 (_2!4247 lt!144247))) (currentByte!4928 (_2!4247 lt!144247)) (currentBit!4923 (_2!4247 lt!144247)))))))

(assert (= (and d!31342 res!81523) b!99378))

(assert (= (and b!99378 res!81525) b!99379))

(assert (= (and b!99379 res!81524) b!99380))

(assert (= (and b!99380 res!81522) b!99381))

(declare-fun m!144761 () Bool)

(assert (=> b!99381 m!144761))

(declare-fun m!144763 () Bool)

(assert (=> b!99381 m!144763))

(declare-fun m!144765 () Bool)

(assert (=> b!99379 m!144765))

(assert (=> b!99378 m!144763))

(assert (=> b!99378 m!144651))

(declare-fun m!144767 () Bool)

(assert (=> b!99380 m!144767))

(assert (=> b!99380 m!144767))

(declare-fun m!144769 () Bool)

(assert (=> b!99380 m!144769))

(declare-fun m!144771 () Bool)

(assert (=> d!31342 m!144771))

(declare-fun m!144773 () Bool)

(assert (=> d!31342 m!144773))

(assert (=> b!99237 d!31342))

(declare-fun d!31348 () Bool)

(assert (=> d!31348 (= (array_inv!1933 (buf!2488 thiss!1305)) (bvsge (size!2131 (buf!2488 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!99242 d!31348))

(push 1)

(assert (not d!31314))

(assert (not d!31342))

(assert (not d!31324))

(assert (not b!99378))

(assert (not d!31300))

(assert (not b!99380))

(assert (not b!99360))

(assert (not b!99381))

(assert (not b!99334))

(assert (not d!31302))

(assert (not d!31338))

(assert (not d!31316))

(assert (not b!99379))

(assert (not d!31340))

(assert (not b!99336))

(assert (not d!31334))

(check-sat)

(pop 1)

(push 1)

(check-sat)

