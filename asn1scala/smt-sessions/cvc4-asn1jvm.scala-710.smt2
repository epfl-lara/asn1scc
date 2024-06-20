; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19922 () Bool)

(assert start!19922)

(declare-fun b!99296 () Bool)

(declare-fun e!64992 () Bool)

(declare-datatypes ((array!4672 0))(
  ( (array!4673 (arr!2726 (Array (_ BitVec 32) (_ BitVec 8))) (size!2133 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3740 0))(
  ( (BitStream!3741 (buf!2490 array!4672) (currentByte!4930 (_ BitVec 32)) (currentBit!4925 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3740)

(declare-fun array_inv!1935 (array!4672) Bool)

(assert (=> b!99296 (= e!64992 (array_inv!1935 (buf!2490 thiss!1305)))))

(declare-fun b!99297 () Bool)

(declare-fun e!64993 () Bool)

(declare-fun e!64997 () Bool)

(assert (=> b!99297 (= e!64993 (not e!64997))))

(declare-fun res!81449 () Bool)

(assert (=> b!99297 (=> res!81449 e!64997)))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!99297 (= res!81449 (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!64998 () Bool)

(assert (=> b!99297 e!64998))

(declare-fun res!81444 () Bool)

(assert (=> b!99297 (=> (not res!81444) (not e!64998))))

(declare-datatypes ((Unit!6093 0))(
  ( (Unit!6094) )
))
(declare-datatypes ((tuple2!7992 0))(
  ( (tuple2!7993 (_1!4251 Unit!6093) (_2!4251 BitStream!3740)) )
))
(declare-fun lt!144139 () tuple2!7992)

(assert (=> b!99297 (= res!81444 (= (size!2133 (buf!2490 thiss!1305)) (size!2133 (buf!2490 (_2!4251 lt!144139)))))))

(declare-fun lt!144142 () Bool)

(declare-fun appendBit!0 (BitStream!3740 Bool) tuple2!7992)

(assert (=> b!99297 (= lt!144139 (appendBit!0 thiss!1305 lt!144142))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!99297 (= lt!144142 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!99298 () Bool)

(declare-fun res!81443 () Bool)

(assert (=> b!99298 (=> (not res!81443) (not e!64993))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!99298 (= res!81443 (validate_offset_bits!1 ((_ sign_extend 32) (size!2133 (buf!2490 thiss!1305))) ((_ sign_extend 32) (currentByte!4930 thiss!1305)) ((_ sign_extend 32) (currentBit!4925 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!99299 () Bool)

(declare-fun res!81447 () Bool)

(declare-fun e!64995 () Bool)

(assert (=> b!99299 (=> (not res!81447) (not e!64995))))

(declare-fun isPrefixOf!0 (BitStream!3740 BitStream!3740) Bool)

(assert (=> b!99299 (= res!81447 (isPrefixOf!0 thiss!1305 (_2!4251 lt!144139)))))

(declare-fun res!81446 () Bool)

(assert (=> start!19922 (=> (not res!81446) (not e!64993))))

(assert (=> start!19922 (= res!81446 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!19922 e!64993))

(assert (=> start!19922 true))

(declare-fun inv!12 (BitStream!3740) Bool)

(assert (=> start!19922 (and (inv!12 thiss!1305) e!64992)))

(declare-fun b!99300 () Bool)

(declare-fun res!81442 () Bool)

(assert (=> b!99300 (=> (not res!81442) (not e!64993))))

(assert (=> b!99300 (= res!81442 (bvslt i!615 nBits!396))))

(declare-fun b!99301 () Bool)

(assert (=> b!99301 (= e!64998 e!64995)))

(declare-fun res!81448 () Bool)

(assert (=> b!99301 (=> (not res!81448) (not e!64995))))

(declare-fun lt!144141 () (_ BitVec 64))

(declare-fun lt!144138 () (_ BitVec 64))

(assert (=> b!99301 (= res!81448 (= lt!144141 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!144138)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99301 (= lt!144141 (bitIndex!0 (size!2133 (buf!2490 (_2!4251 lt!144139))) (currentByte!4930 (_2!4251 lt!144139)) (currentBit!4925 (_2!4251 lt!144139))))))

(assert (=> b!99301 (= lt!144138 (bitIndex!0 (size!2133 (buf!2490 thiss!1305)) (currentByte!4930 thiss!1305) (currentBit!4925 thiss!1305)))))

(declare-fun b!99302 () Bool)

(declare-fun e!64994 () Bool)

(assert (=> b!99302 (= e!64995 e!64994)))

(declare-fun res!81445 () Bool)

(assert (=> b!99302 (=> (not res!81445) (not e!64994))))

(declare-datatypes ((tuple2!7994 0))(
  ( (tuple2!7995 (_1!4252 BitStream!3740) (_2!4252 Bool)) )
))
(declare-fun lt!144140 () tuple2!7994)

(assert (=> b!99302 (= res!81445 (and (= (_2!4252 lt!144140) lt!144142) (= (_1!4252 lt!144140) (_2!4251 lt!144139))))))

(declare-fun readBitPure!0 (BitStream!3740) tuple2!7994)

(declare-fun readerFrom!0 (BitStream!3740 (_ BitVec 32) (_ BitVec 32)) BitStream!3740)

(assert (=> b!99302 (= lt!144140 (readBitPure!0 (readerFrom!0 (_2!4251 lt!144139) (currentBit!4925 thiss!1305) (currentByte!4930 thiss!1305))))))

(declare-fun b!99303 () Bool)

(declare-fun res!81441 () Bool)

(assert (=> b!99303 (=> (not res!81441) (not e!64993))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99303 (= res!81441 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!99304 () Bool)

(assert (=> b!99304 (= e!64997 (validate_offset_bits!1 ((_ sign_extend 32) (size!2133 (buf!2490 (_2!4251 lt!144139)))) ((_ sign_extend 32) (currentByte!4930 (_2!4251 lt!144139))) ((_ sign_extend 32) (currentBit!4925 (_2!4251 lt!144139))) ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!99305 () Bool)

(assert (=> b!99305 (= e!64994 (= (bitIndex!0 (size!2133 (buf!2490 (_1!4252 lt!144140))) (currentByte!4930 (_1!4252 lt!144140)) (currentBit!4925 (_1!4252 lt!144140))) lt!144141))))

(assert (= (and start!19922 res!81446) b!99298))

(assert (= (and b!99298 res!81443) b!99303))

(assert (= (and b!99303 res!81441) b!99300))

(assert (= (and b!99300 res!81442) b!99297))

(assert (= (and b!99297 res!81444) b!99301))

(assert (= (and b!99301 res!81448) b!99299))

(assert (= (and b!99299 res!81447) b!99302))

(assert (= (and b!99302 res!81445) b!99305))

(assert (= (and b!99297 (not res!81449)) b!99304))

(assert (= start!19922 b!99296))

(declare-fun m!144679 () Bool)

(assert (=> b!99301 m!144679))

(declare-fun m!144681 () Bool)

(assert (=> b!99301 m!144681))

(declare-fun m!144683 () Bool)

(assert (=> b!99305 m!144683))

(declare-fun m!144685 () Bool)

(assert (=> b!99304 m!144685))

(declare-fun m!144687 () Bool)

(assert (=> b!99303 m!144687))

(declare-fun m!144689 () Bool)

(assert (=> b!99296 m!144689))

(declare-fun m!144691 () Bool)

(assert (=> b!99299 m!144691))

(declare-fun m!144693 () Bool)

(assert (=> b!99298 m!144693))

(declare-fun m!144695 () Bool)

(assert (=> start!19922 m!144695))

(declare-fun m!144697 () Bool)

(assert (=> b!99297 m!144697))

(declare-fun m!144699 () Bool)

(assert (=> b!99302 m!144699))

(assert (=> b!99302 m!144699))

(declare-fun m!144701 () Bool)

(assert (=> b!99302 m!144701))

(push 1)

(assert (not b!99301))

(assert (not start!19922))

(assert (not b!99296))

(assert (not b!99298))

(assert (not b!99304))

(assert (not b!99299))

(assert (not b!99303))

(assert (not b!99297))

(assert (not b!99302))

(assert (not b!99305))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!31326 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!31326 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2133 (buf!2490 thiss!1305))) ((_ sign_extend 32) (currentByte!4930 thiss!1305)) ((_ sign_extend 32) (currentBit!4925 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2133 (buf!2490 thiss!1305))) ((_ sign_extend 32) (currentByte!4930 thiss!1305)) ((_ sign_extend 32) (currentBit!4925 thiss!1305))) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun bs!7675 () Bool)

(assert (= bs!7675 d!31326))

(declare-fun m!144747 () Bool)

(assert (=> bs!7675 m!144747))

(assert (=> b!99298 d!31326))

(declare-fun d!31330 () Bool)

(assert (=> d!31330 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!99303 d!31330))

(declare-fun d!31336 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!31336 (= (inv!12 thiss!1305) (invariant!0 (currentBit!4925 thiss!1305) (currentByte!4930 thiss!1305) (size!2133 (buf!2490 thiss!1305))))))

(declare-fun bs!7678 () Bool)

(assert (= bs!7678 d!31336))

(declare-fun m!144755 () Bool)

(assert (=> bs!7678 m!144755))

(assert (=> start!19922 d!31336))

(declare-fun d!31344 () Bool)

(declare-fun e!65039 () Bool)

(assert (=> d!31344 e!65039))

(declare-fun res!81521 () Bool)

(assert (=> d!31344 (=> (not res!81521) (not e!65039))))

(declare-fun lt!144243 () (_ BitVec 64))

(declare-fun lt!144245 () (_ BitVec 64))

(declare-fun lt!144244 () (_ BitVec 64))

(assert (=> d!31344 (= res!81521 (= lt!144245 (bvsub lt!144243 lt!144244)))))

(assert (=> d!31344 (or (= (bvand lt!144243 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!144244 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!144243 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!144243 lt!144244) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31344 (= lt!144244 (remainingBits!0 ((_ sign_extend 32) (size!2133 (buf!2490 (_1!4252 lt!144140)))) ((_ sign_extend 32) (currentByte!4930 (_1!4252 lt!144140))) ((_ sign_extend 32) (currentBit!4925 (_1!4252 lt!144140)))))))

(declare-fun lt!144242 () (_ BitVec 64))

(declare-fun lt!144241 () (_ BitVec 64))

(assert (=> d!31344 (= lt!144243 (bvmul lt!144242 lt!144241))))

(assert (=> d!31344 (or (= lt!144242 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!144241 (bvsdiv (bvmul lt!144242 lt!144241) lt!144242)))))

(assert (=> d!31344 (= lt!144241 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31344 (= lt!144242 ((_ sign_extend 32) (size!2133 (buf!2490 (_1!4252 lt!144140)))))))

(assert (=> d!31344 (= lt!144245 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4930 (_1!4252 lt!144140))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4925 (_1!4252 lt!144140)))))))

(assert (=> d!31344 (invariant!0 (currentBit!4925 (_1!4252 lt!144140)) (currentByte!4930 (_1!4252 lt!144140)) (size!2133 (buf!2490 (_1!4252 lt!144140))))))

(assert (=> d!31344 (= (bitIndex!0 (size!2133 (buf!2490 (_1!4252 lt!144140))) (currentByte!4930 (_1!4252 lt!144140)) (currentBit!4925 (_1!4252 lt!144140))) lt!144245)))

(declare-fun b!99376 () Bool)

(declare-fun res!81520 () Bool)

(assert (=> b!99376 (=> (not res!81520) (not e!65039))))

(assert (=> b!99376 (= res!81520 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!144245))))

(declare-fun b!99377 () Bool)

(declare-fun lt!144246 () (_ BitVec 64))

(assert (=> b!99377 (= e!65039 (bvsle lt!144245 (bvmul lt!144246 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!99377 (or (= lt!144246 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!144246 #b0000000000000000000000000000000000000000000000000000000000001000) lt!144246)))))

(assert (=> b!99377 (= lt!144246 ((_ sign_extend 32) (size!2133 (buf!2490 (_1!4252 lt!144140)))))))

(assert (= (and d!31344 res!81521) b!99376))

(assert (= (and b!99376 res!81520) b!99377))

(declare-fun m!144757 () Bool)

(assert (=> d!31344 m!144757))

(declare-fun m!144759 () Bool)

(assert (=> d!31344 m!144759))

(assert (=> b!99305 d!31344))

(declare-fun d!31346 () Bool)

(declare-fun res!81533 () Bool)

(declare-fun e!65046 () Bool)

(assert (=> d!31346 (=> (not res!81533) (not e!65046))))

(assert (=> d!31346 (= res!81533 (= (size!2133 (buf!2490 thiss!1305)) (size!2133 (buf!2490 (_2!4251 lt!144139)))))))

(assert (=> d!31346 (= (isPrefixOf!0 thiss!1305 (_2!4251 lt!144139)) e!65046)))

(declare-fun b!99388 () Bool)

(declare-fun res!81534 () Bool)

(assert (=> b!99388 (=> (not res!81534) (not e!65046))))

(assert (=> b!99388 (= res!81534 (bvsle (bitIndex!0 (size!2133 (buf!2490 thiss!1305)) (currentByte!4930 thiss!1305) (currentBit!4925 thiss!1305)) (bitIndex!0 (size!2133 (buf!2490 (_2!4251 lt!144139))) (currentByte!4930 (_2!4251 lt!144139)) (currentBit!4925 (_2!4251 lt!144139)))))))

(declare-fun b!99389 () Bool)

(declare-fun e!65047 () Bool)

(assert (=> b!99389 (= e!65046 e!65047)))

(declare-fun res!81532 () Bool)

(assert (=> b!99389 (=> res!81532 e!65047)))

(assert (=> b!99389 (= res!81532 (= (size!2133 (buf!2490 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!99390 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4672 array!4672 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!99390 (= e!65047 (arrayBitRangesEq!0 (buf!2490 thiss!1305) (buf!2490 (_2!4251 lt!144139)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2133 (buf!2490 thiss!1305)) (currentByte!4930 thiss!1305) (currentBit!4925 thiss!1305))))))

(assert (= (and d!31346 res!81533) b!99388))

(assert (= (and b!99388 res!81534) b!99389))

(assert (= (and b!99389 (not res!81532)) b!99390))

(assert (=> b!99388 m!144681))

(assert (=> b!99388 m!144679))

(assert (=> b!99390 m!144681))

(assert (=> b!99390 m!144681))

(declare-fun m!144775 () Bool)

(assert (=> b!99390 m!144775))

(assert (=> b!99299 d!31346))

(declare-fun d!31350 () Bool)

(assert (=> d!31350 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2133 (buf!2490 (_2!4251 lt!144139)))) ((_ sign_extend 32) (currentByte!4930 (_2!4251 lt!144139))) ((_ sign_extend 32) (currentBit!4925 (_2!4251 lt!144139))) ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2133 (buf!2490 (_2!4251 lt!144139)))) ((_ sign_extend 32) (currentByte!4930 (_2!4251 lt!144139))) ((_ sign_extend 32) (currentBit!4925 (_2!4251 lt!144139)))) ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun bs!7679 () Bool)

(assert (= bs!7679 d!31350))

(declare-fun m!144777 () Bool)

(assert (=> bs!7679 m!144777))

(assert (=> b!99304 d!31350))

(declare-fun d!31352 () Bool)

(declare-fun e!65048 () Bool)

(assert (=> d!31352 e!65048))

(declare-fun res!81536 () Bool)

(assert (=> d!31352 (=> (not res!81536) (not e!65048))))

(declare-fun lt!144253 () (_ BitVec 64))

(declare-fun lt!144254 () (_ BitVec 64))

(declare-fun lt!144255 () (_ BitVec 64))

(assert (=> d!31352 (= res!81536 (= lt!144255 (bvsub lt!144253 lt!144254)))))

(assert (=> d!31352 (or (= (bvand lt!144253 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!144254 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!144253 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!144253 lt!144254) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31352 (= lt!144254 (remainingBits!0 ((_ sign_extend 32) (size!2133 (buf!2490 (_2!4251 lt!144139)))) ((_ sign_extend 32) (currentByte!4930 (_2!4251 lt!144139))) ((_ sign_extend 32) (currentBit!4925 (_2!4251 lt!144139)))))))

(declare-fun lt!144252 () (_ BitVec 64))

(declare-fun lt!144251 () (_ BitVec 64))

(assert (=> d!31352 (= lt!144253 (bvmul lt!144252 lt!144251))))

(assert (=> d!31352 (or (= lt!144252 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!144251 (bvsdiv (bvmul lt!144252 lt!144251) lt!144252)))))

(assert (=> d!31352 (= lt!144251 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31352 (= lt!144252 ((_ sign_extend 32) (size!2133 (buf!2490 (_2!4251 lt!144139)))))))

(assert (=> d!31352 (= lt!144255 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4930 (_2!4251 lt!144139))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4925 (_2!4251 lt!144139)))))))

(assert (=> d!31352 (invariant!0 (currentBit!4925 (_2!4251 lt!144139)) (currentByte!4930 (_2!4251 lt!144139)) (size!2133 (buf!2490 (_2!4251 lt!144139))))))

(assert (=> d!31352 (= (bitIndex!0 (size!2133 (buf!2490 (_2!4251 lt!144139))) (currentByte!4930 (_2!4251 lt!144139)) (currentBit!4925 (_2!4251 lt!144139))) lt!144255)))

(declare-fun b!99391 () Bool)

(declare-fun res!81535 () Bool)

(assert (=> b!99391 (=> (not res!81535) (not e!65048))))

(assert (=> b!99391 (= res!81535 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!144255))))

(declare-fun b!99392 () Bool)

(declare-fun lt!144256 () (_ BitVec 64))

(assert (=> b!99392 (= e!65048 (bvsle lt!144255 (bvmul lt!144256 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!99392 (or (= lt!144256 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!144256 #b0000000000000000000000000000000000000000000000000000000000001000) lt!144256)))))

(assert (=> b!99392 (= lt!144256 ((_ sign_extend 32) (size!2133 (buf!2490 (_2!4251 lt!144139)))))))

(assert (= (and d!31352 res!81536) b!99391))

(assert (= (and b!99391 res!81535) b!99392))

(assert (=> d!31352 m!144777))

(declare-fun m!144779 () Bool)

(assert (=> d!31352 m!144779))

(assert (=> b!99301 d!31352))

(declare-fun d!31354 () Bool)

(declare-fun e!65049 () Bool)

(assert (=> d!31354 e!65049))

(declare-fun res!81538 () Bool)

(assert (=> d!31354 (=> (not res!81538) (not e!65049))))

(declare-fun lt!144261 () (_ BitVec 64))

(declare-fun lt!144260 () (_ BitVec 64))

(declare-fun lt!144259 () (_ BitVec 64))

(assert (=> d!31354 (= res!81538 (= lt!144261 (bvsub lt!144259 lt!144260)))))

(assert (=> d!31354 (or (= (bvand lt!144259 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!144260 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!144259 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!144259 lt!144260) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31354 (= lt!144260 (remainingBits!0 ((_ sign_extend 32) (size!2133 (buf!2490 thiss!1305))) ((_ sign_extend 32) (currentByte!4930 thiss!1305)) ((_ sign_extend 32) (currentBit!4925 thiss!1305))))))

(declare-fun lt!144258 () (_ BitVec 64))

(declare-fun lt!144257 () (_ BitVec 64))

(assert (=> d!31354 (= lt!144259 (bvmul lt!144258 lt!144257))))

(assert (=> d!31354 (or (= lt!144258 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!144257 (bvsdiv (bvmul lt!144258 lt!144257) lt!144258)))))

(assert (=> d!31354 (= lt!144257 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31354 (= lt!144258 ((_ sign_extend 32) (size!2133 (buf!2490 thiss!1305))))))

(assert (=> d!31354 (= lt!144261 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4930 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4925 thiss!1305))))))

(assert (=> d!31354 (invariant!0 (currentBit!4925 thiss!1305) (currentByte!4930 thiss!1305) (size!2133 (buf!2490 thiss!1305)))))

(assert (=> d!31354 (= (bitIndex!0 (size!2133 (buf!2490 thiss!1305)) (currentByte!4930 thiss!1305) (currentBit!4925 thiss!1305)) lt!144261)))

(declare-fun b!99393 () Bool)

(declare-fun res!81537 () Bool)

(assert (=> b!99393 (=> (not res!81537) (not e!65049))))

(assert (=> b!99393 (= res!81537 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!144261))))

(declare-fun b!99394 () Bool)

(declare-fun lt!144262 () (_ BitVec 64))

(assert (=> b!99394 (= e!65049 (bvsle lt!144261 (bvmul lt!144262 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!99394 (or (= lt!144262 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!144262 #b0000000000000000000000000000000000000000000000000000000000001000) lt!144262)))))

(assert (=> b!99394 (= lt!144262 ((_ sign_extend 32) (size!2133 (buf!2490 thiss!1305))))))

(assert (= (and d!31354 res!81538) b!99393))

(assert (= (and b!99393 res!81537) b!99394))

(assert (=> d!31354 m!144747))

(assert (=> d!31354 m!144755))

(assert (=> b!99301 d!31354))

(declare-fun b!99406 () Bool)

(declare-fun e!65055 () Bool)

(declare-fun e!65054 () Bool)

(assert (=> b!99406 (= e!65055 e!65054)))

(declare-fun res!81549 () Bool)

(assert (=> b!99406 (=> (not res!81549) (not e!65054))))

(declare-fun lt!144271 () tuple2!7994)

(declare-fun lt!144274 () tuple2!7992)

(assert (=> b!99406 (= res!81549 (and (= (_2!4252 lt!144271) lt!144142) (= (_1!4252 lt!144271) (_2!4251 lt!144274))))))

(assert (=> b!99406 (= lt!144271 (readBitPure!0 (readerFrom!0 (_2!4251 lt!144274) (currentBit!4925 thiss!1305) (currentByte!4930 thiss!1305))))))

(declare-fun b!99405 () Bool)

(declare-fun res!81548 () Bool)

(assert (=> b!99405 (=> (not res!81548) (not e!65055))))

(assert (=> b!99405 (= res!81548 (isPrefixOf!0 thiss!1305 (_2!4251 lt!144274)))))

(declare-fun b!99407 () Bool)

(assert (=> b!99407 (= e!65054 (= (bitIndex!0 (size!2133 (buf!2490 (_1!4252 lt!144271))) (currentByte!4930 (_1!4252 lt!144271)) (currentBit!4925 (_1!4252 lt!144271))) (bitIndex!0 (size!2133 (buf!2490 (_2!4251 lt!144274))) (currentByte!4930 (_2!4251 lt!144274)) (currentBit!4925 (_2!4251 lt!144274)))))))

(declare-fun b!99404 () Bool)

(declare-fun res!81547 () Bool)

(assert (=> b!99404 (=> (not res!81547) (not e!65055))))

(declare-fun lt!144273 () (_ BitVec 64))

(declare-fun lt!144272 () (_ BitVec 64))

(assert (=> b!99404 (= res!81547 (= (bitIndex!0 (size!2133 (buf!2490 (_2!4251 lt!144274))) (currentByte!4930 (_2!4251 lt!144274)) (currentBit!4925 (_2!4251 lt!144274))) (bvadd lt!144272 lt!144273)))))

(assert (=> b!99404 (or (not (= (bvand lt!144272 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!144273 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!144272 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!144272 lt!144273) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!99404 (= lt!144273 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!99404 (= lt!144272 (bitIndex!0 (size!2133 (buf!2490 thiss!1305)) (currentByte!4930 thiss!1305) (currentBit!4925 thiss!1305)))))

(declare-fun d!31356 () Bool)

(assert (=> d!31356 e!65055))

(declare-fun res!81550 () Bool)

(assert (=> d!31356 (=> (not res!81550) (not e!65055))))

(assert (=> d!31356 (= res!81550 (= (size!2133 (buf!2490 thiss!1305)) (size!2133 (buf!2490 (_2!4251 lt!144274)))))))

(declare-fun choose!16 (BitStream!3740 Bool) tuple2!7992)

(assert (=> d!31356 (= lt!144274 (choose!16 thiss!1305 lt!144142))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!31356 (validate_offset_bit!0 ((_ sign_extend 32) (size!2133 (buf!2490 thiss!1305))) ((_ sign_extend 32) (currentByte!4930 thiss!1305)) ((_ sign_extend 32) (currentBit!4925 thiss!1305)))))

(assert (=> d!31356 (= (appendBit!0 thiss!1305 lt!144142) lt!144274)))

(assert (= (and d!31356 res!81550) b!99404))

(assert (= (and b!99404 res!81547) b!99405))

(assert (= (and b!99405 res!81548) b!99406))

(assert (= (and b!99406 res!81549) b!99407))

(declare-fun m!144781 () Bool)

(assert (=> b!99405 m!144781))

(declare-fun m!144783 () Bool)

(assert (=> b!99406 m!144783))

(assert (=> b!99406 m!144783))

(declare-fun m!144785 () Bool)

(assert (=> b!99406 m!144785))

(declare-fun m!144787 () Bool)

(assert (=> d!31356 m!144787))

(declare-fun m!144789 () Bool)

(assert (=> d!31356 m!144789))

(declare-fun m!144791 () Bool)

(assert (=> b!99407 m!144791))

(declare-fun m!144793 () Bool)

(assert (=> b!99407 m!144793))

(assert (=> b!99404 m!144793))

(assert (=> b!99404 m!144681))

(assert (=> b!99297 d!31356))

(declare-fun d!31358 () Bool)

(declare-datatypes ((tuple2!8000 0))(
  ( (tuple2!8001 (_1!4255 Bool) (_2!4255 BitStream!3740)) )
))
(declare-fun lt!144277 () tuple2!8000)

(declare-fun readBit!0 (BitStream!3740) tuple2!8000)

(assert (=> d!31358 (= lt!144277 (readBit!0 (readerFrom!0 (_2!4251 lt!144139) (currentBit!4925 thiss!1305) (currentByte!4930 thiss!1305))))))

(assert (=> d!31358 (= (readBitPure!0 (readerFrom!0 (_2!4251 lt!144139) (currentBit!4925 thiss!1305) (currentByte!4930 thiss!1305))) (tuple2!7995 (_2!4255 lt!144277) (_1!4255 lt!144277)))))

(declare-fun bs!7680 () Bool)

(assert (= bs!7680 d!31358))

(assert (=> bs!7680 m!144699))

(declare-fun m!144795 () Bool)

(assert (=> bs!7680 m!144795))

(assert (=> b!99302 d!31358))

(declare-fun d!31360 () Bool)

(declare-fun e!65058 () Bool)

(assert (=> d!31360 e!65058))

(declare-fun res!81554 () Bool)

(assert (=> d!31360 (=> (not res!81554) (not e!65058))))

(assert (=> d!31360 (= res!81554 (invariant!0 (currentBit!4925 (_2!4251 lt!144139)) (currentByte!4930 (_2!4251 lt!144139)) (size!2133 (buf!2490 (_2!4251 lt!144139)))))))

(assert (=> d!31360 (= (readerFrom!0 (_2!4251 lt!144139) (currentBit!4925 thiss!1305) (currentByte!4930 thiss!1305)) (BitStream!3741 (buf!2490 (_2!4251 lt!144139)) (currentByte!4930 thiss!1305) (currentBit!4925 thiss!1305)))))

(declare-fun b!99410 () Bool)

(assert (=> b!99410 (= e!65058 (invariant!0 (currentBit!4925 thiss!1305) (currentByte!4930 thiss!1305) (size!2133 (buf!2490 (_2!4251 lt!144139)))))))

(assert (= (and d!31360 res!81554) b!99410))

(assert (=> d!31360 m!144779))

(declare-fun m!144797 () Bool)

(assert (=> b!99410 m!144797))

(assert (=> b!99302 d!31360))

(declare-fun d!31362 () Bool)

(assert (=> d!31362 (= (array_inv!1935 (buf!2490 thiss!1305)) (bvsge (size!2133 (buf!2490 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!99296 d!31362))

(push 1)

(assert (not d!31354))

(assert (not b!99390))

(assert (not b!99404))

(assert (not b!99407))

(assert (not b!99410))

(assert (not d!31326))

(assert (not d!31336))

(assert (not b!99388))

(assert (not d!31352))

(assert (not d!31344))

(assert (not d!31356))

(assert (not d!31360))

(assert (not b!99405))

(assert (not b!99406))

(assert (not d!31350))

(assert (not d!31358))

(check-sat)

(pop 1)

(push 1)

(check-sat)

