; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43426 () Bool)

(assert start!43426)

(declare-fun b!205133 () Bool)

(declare-fun e!140383 () Bool)

(declare-fun e!140384 () Bool)

(assert (=> b!205133 (= e!140383 e!140384)))

(declare-fun res!171953 () Bool)

(assert (=> b!205133 (=> (not res!171953) (not e!140384))))

(declare-datatypes ((array!10359 0))(
  ( (array!10360 (arr!5484 (Array (_ BitVec 32) (_ BitVec 8))) (size!4554 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8216 0))(
  ( (BitStream!8217 (buf!5059 array!10359) (currentByte!9556 (_ BitVec 32)) (currentBit!9551 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!14632 0))(
  ( (Unit!14633) )
))
(declare-datatypes ((tuple2!17542 0))(
  ( (tuple2!17543 (_1!9423 Unit!14632) (_2!9423 BitStream!8216)) )
))
(declare-fun lt!320351 () tuple2!17542)

(declare-fun lt!320345 () Bool)

(declare-datatypes ((tuple2!17544 0))(
  ( (tuple2!17545 (_1!9424 BitStream!8216) (_2!9424 Bool)) )
))
(declare-fun lt!320349 () tuple2!17544)

(assert (=> b!205133 (= res!171953 (and (= (_2!9424 lt!320349) lt!320345) (= (_1!9424 lt!320349) (_2!9423 lt!320351))))))

(declare-fun thiss!1204 () BitStream!8216)

(declare-fun readBitPure!0 (BitStream!8216) tuple2!17544)

(declare-fun readerFrom!0 (BitStream!8216 (_ BitVec 32) (_ BitVec 32)) BitStream!8216)

(assert (=> b!205133 (= lt!320349 (readBitPure!0 (readerFrom!0 (_2!9423 lt!320351) (currentBit!9551 thiss!1204) (currentByte!9556 thiss!1204))))))

(declare-fun lt!320354 () tuple2!17542)

(declare-fun e!140381 () Bool)

(declare-fun b!205134 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10359 array!10359 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!205134 (= e!140381 (arrayBitRangesEq!0 (buf!5059 (_2!9423 lt!320351)) (buf!5059 (_2!9423 lt!320354)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4554 (buf!5059 (_2!9423 lt!320351))) (currentByte!9556 thiss!1204) (currentBit!9551 thiss!1204)))))))

(declare-fun b!205135 () Bool)

(declare-fun lt!320347 () (_ BitVec 64))

(assert (=> b!205135 (= e!140384 (= (bitIndex!0 (size!4554 (buf!5059 (_1!9424 lt!320349))) (currentByte!9556 (_1!9424 lt!320349)) (currentBit!9551 (_1!9424 lt!320349))) lt!320347))))

(declare-fun b!205137 () Bool)

(declare-fun res!171956 () Bool)

(declare-fun e!140387 () Bool)

(assert (=> b!205137 (=> res!171956 e!140387)))

(declare-fun isPrefixOf!0 (BitStream!8216 BitStream!8216) Bool)

(assert (=> b!205137 (= res!171956 (not (isPrefixOf!0 (_2!9423 lt!320351) (_2!9423 lt!320354))))))

(declare-fun b!205138 () Bool)

(assert (=> b!205138 (= e!140387 e!140381)))

(declare-fun res!171955 () Bool)

(assert (=> b!205138 (=> res!171955 e!140381)))

(assert (=> b!205138 (= res!171955 (not (= (size!4554 (buf!5059 (_2!9423 lt!320351))) (size!4554 (buf!5059 (_2!9423 lt!320354))))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!205138 (invariant!0 (currentBit!9551 thiss!1204) (currentByte!9556 thiss!1204) (size!4554 (buf!5059 (_2!9423 lt!320351))))))

(declare-fun b!205139 () Bool)

(declare-fun res!171946 () Bool)

(assert (=> b!205139 (=> (not res!171946) (not e!140383))))

(assert (=> b!205139 (= res!171946 (isPrefixOf!0 thiss!1204 (_2!9423 lt!320351)))))

(declare-fun b!205140 () Bool)

(declare-fun e!140385 () Bool)

(declare-fun e!140380 () Bool)

(assert (=> b!205140 (= e!140385 (not e!140380))))

(declare-fun res!171945 () Bool)

(assert (=> b!205140 (=> res!171945 e!140380)))

(declare-fun lt!320350 () (_ BitVec 64))

(declare-fun lt!320346 () (_ BitVec 64))

(assert (=> b!205140 (= res!171945 (not (= lt!320350 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!320346))))))

(assert (=> b!205140 (= lt!320350 (bitIndex!0 (size!4554 (buf!5059 (_2!9423 lt!320351))) (currentByte!9556 (_2!9423 lt!320351)) (currentBit!9551 (_2!9423 lt!320351))))))

(assert (=> b!205140 (= lt!320346 (bitIndex!0 (size!4554 (buf!5059 thiss!1204)) (currentByte!9556 thiss!1204) (currentBit!9551 thiss!1204)))))

(declare-fun e!140386 () Bool)

(assert (=> b!205140 e!140386))

(declare-fun res!171950 () Bool)

(assert (=> b!205140 (=> (not res!171950) (not e!140386))))

(assert (=> b!205140 (= res!171950 (= (size!4554 (buf!5059 thiss!1204)) (size!4554 (buf!5059 (_2!9423 lt!320351)))))))

(declare-fun appendBit!0 (BitStream!8216 Bool) tuple2!17542)

(assert (=> b!205140 (= lt!320351 (appendBit!0 thiss!1204 lt!320345))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!205140 (= lt!320345 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!205141 () Bool)

(declare-fun res!171954 () Bool)

(assert (=> b!205141 (=> res!171954 e!140387)))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!320352 () (_ BitVec 64))

(assert (=> b!205141 (= res!171954 (or (not (= (size!4554 (buf!5059 (_2!9423 lt!320354))) (size!4554 (buf!5059 thiss!1204)))) (not (= lt!320352 (bvsub (bvadd lt!320346 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!205142 () Bool)

(assert (=> b!205142 (= e!140380 e!140387)))

(declare-fun res!171951 () Bool)

(assert (=> b!205142 (=> res!171951 e!140387)))

(assert (=> b!205142 (= res!171951 (not (= lt!320352 (bvsub (bvsub (bvadd lt!320350 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!205142 (= lt!320352 (bitIndex!0 (size!4554 (buf!5059 (_2!9423 lt!320354))) (currentByte!9556 (_2!9423 lt!320354)) (currentBit!9551 (_2!9423 lt!320354))))))

(assert (=> b!205142 (isPrefixOf!0 thiss!1204 (_2!9423 lt!320354))))

(declare-fun lt!320348 () Unit!14632)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8216 BitStream!8216 BitStream!8216) Unit!14632)

(assert (=> b!205142 (= lt!320348 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9423 lt!320351) (_2!9423 lt!320354)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8216 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17542)

(assert (=> b!205142 (= lt!320354 (appendBitsLSBFirstLoopTR!0 (_2!9423 lt!320351) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!205143 () Bool)

(declare-fun res!171947 () Bool)

(assert (=> b!205143 (=> res!171947 e!140387)))

(assert (=> b!205143 (= res!171947 (not (isPrefixOf!0 thiss!1204 (_2!9423 lt!320351))))))

(declare-fun b!205144 () Bool)

(assert (=> b!205144 (= e!140386 e!140383)))

(declare-fun res!171942 () Bool)

(assert (=> b!205144 (=> (not res!171942) (not e!140383))))

(declare-fun lt!320353 () (_ BitVec 64))

(assert (=> b!205144 (= res!171942 (= lt!320347 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!320353)))))

(assert (=> b!205144 (= lt!320347 (bitIndex!0 (size!4554 (buf!5059 (_2!9423 lt!320351))) (currentByte!9556 (_2!9423 lt!320351)) (currentBit!9551 (_2!9423 lt!320351))))))

(assert (=> b!205144 (= lt!320353 (bitIndex!0 (size!4554 (buf!5059 thiss!1204)) (currentByte!9556 thiss!1204) (currentBit!9551 thiss!1204)))))

(declare-fun res!171952 () Bool)

(assert (=> start!43426 (=> (not res!171952) (not e!140385))))

(assert (=> start!43426 (= res!171952 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43426 e!140385))

(assert (=> start!43426 true))

(declare-fun e!140388 () Bool)

(declare-fun inv!12 (BitStream!8216) Bool)

(assert (=> start!43426 (and (inv!12 thiss!1204) e!140388)))

(declare-fun b!205136 () Bool)

(declare-fun res!171941 () Bool)

(assert (=> b!205136 (=> (not res!171941) (not e!140385))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!205136 (= res!171941 (validate_offset_bits!1 ((_ sign_extend 32) (size!4554 (buf!5059 thiss!1204))) ((_ sign_extend 32) (currentByte!9556 thiss!1204)) ((_ sign_extend 32) (currentBit!9551 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!205145 () Bool)

(declare-fun res!171944 () Bool)

(assert (=> b!205145 (=> (not res!171944) (not e!140385))))

(assert (=> b!205145 (= res!171944 (not (= i!590 nBits!348)))))

(declare-fun b!205146 () Bool)

(declare-fun array_inv!4295 (array!10359) Bool)

(assert (=> b!205146 (= e!140388 (array_inv!4295 (buf!5059 thiss!1204)))))

(declare-fun b!205147 () Bool)

(declare-fun res!171949 () Bool)

(assert (=> b!205147 (=> res!171949 e!140387)))

(assert (=> b!205147 (= res!171949 (not (invariant!0 (currentBit!9551 (_2!9423 lt!320354)) (currentByte!9556 (_2!9423 lt!320354)) (size!4554 (buf!5059 (_2!9423 lt!320354))))))))

(declare-fun b!205148 () Bool)

(declare-fun res!171943 () Bool)

(assert (=> b!205148 (=> (not res!171943) (not e!140385))))

(assert (=> b!205148 (= res!171943 (invariant!0 (currentBit!9551 thiss!1204) (currentByte!9556 thiss!1204) (size!4554 (buf!5059 thiss!1204))))))

(declare-fun b!205149 () Bool)

(declare-fun res!171948 () Bool)

(assert (=> b!205149 (=> res!171948 e!140381)))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!205149 (= res!171948 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!4554 (buf!5059 (_2!9423 lt!320351)))) ((_ sign_extend 32) (currentByte!9556 thiss!1204)) ((_ sign_extend 32) (currentBit!9551 thiss!1204)))))))

(assert (= (and start!43426 res!171952) b!205136))

(assert (= (and b!205136 res!171941) b!205148))

(assert (= (and b!205148 res!171943) b!205145))

(assert (= (and b!205145 res!171944) b!205140))

(assert (= (and b!205140 res!171950) b!205144))

(assert (= (and b!205144 res!171942) b!205139))

(assert (= (and b!205139 res!171946) b!205133))

(assert (= (and b!205133 res!171953) b!205135))

(assert (= (and b!205140 (not res!171945)) b!205142))

(assert (= (and b!205142 (not res!171951)) b!205147))

(assert (= (and b!205147 (not res!171949)) b!205141))

(assert (= (and b!205141 (not res!171954)) b!205137))

(assert (= (and b!205137 (not res!171956)) b!205143))

(assert (= (and b!205143 (not res!171947)) b!205138))

(assert (= (and b!205138 (not res!171955)) b!205149))

(assert (= (and b!205149 (not res!171948)) b!205134))

(assert (= start!43426 b!205146))

(declare-fun m!316299 () Bool)

(assert (=> b!205140 m!316299))

(declare-fun m!316301 () Bool)

(assert (=> b!205140 m!316301))

(declare-fun m!316303 () Bool)

(assert (=> b!205140 m!316303))

(declare-fun m!316305 () Bool)

(assert (=> b!205137 m!316305))

(declare-fun m!316307 () Bool)

(assert (=> start!43426 m!316307))

(declare-fun m!316309 () Bool)

(assert (=> b!205148 m!316309))

(declare-fun m!316311 () Bool)

(assert (=> b!205134 m!316311))

(declare-fun m!316313 () Bool)

(assert (=> b!205134 m!316313))

(declare-fun m!316315 () Bool)

(assert (=> b!205146 m!316315))

(declare-fun m!316317 () Bool)

(assert (=> b!205133 m!316317))

(assert (=> b!205133 m!316317))

(declare-fun m!316319 () Bool)

(assert (=> b!205133 m!316319))

(assert (=> b!205144 m!316299))

(assert (=> b!205144 m!316301))

(declare-fun m!316321 () Bool)

(assert (=> b!205142 m!316321))

(declare-fun m!316323 () Bool)

(assert (=> b!205142 m!316323))

(declare-fun m!316325 () Bool)

(assert (=> b!205142 m!316325))

(declare-fun m!316327 () Bool)

(assert (=> b!205142 m!316327))

(declare-fun m!316329 () Bool)

(assert (=> b!205139 m!316329))

(assert (=> b!205143 m!316329))

(declare-fun m!316331 () Bool)

(assert (=> b!205138 m!316331))

(declare-fun m!316333 () Bool)

(assert (=> b!205147 m!316333))

(declare-fun m!316335 () Bool)

(assert (=> b!205136 m!316335))

(declare-fun m!316337 () Bool)

(assert (=> b!205149 m!316337))

(declare-fun m!316339 () Bool)

(assert (=> b!205135 m!316339))

(push 1)

(assert (not b!205139))

(assert (not b!205137))

(assert (not b!205144))

(assert (not b!205136))

(assert (not b!205133))

(assert (not b!205140))

(assert (not b!205148))

(assert (not b!205147))

(assert (not start!43426))

(assert (not b!205146))

(assert (not b!205135))

(assert (not b!205142))

(assert (not b!205143))

(assert (not b!205149))

(assert (not b!205138))

(assert (not b!205134))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!69907 () Bool)

(declare-fun e!140435 () Bool)

(assert (=> d!69907 e!140435))

(declare-fun res!172038 () Bool)

(assert (=> d!69907 (=> (not res!172038) (not e!140435))))

(declare-fun lt!320468 () (_ BitVec 64))

(declare-fun lt!320471 () (_ BitVec 64))

(declare-fun lt!320466 () (_ BitVec 64))

(assert (=> d!69907 (= res!172038 (= lt!320466 (bvsub lt!320471 lt!320468)))))

(assert (=> d!69907 (or (= (bvand lt!320471 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!320468 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!320471 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!320471 lt!320468) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!69907 (= lt!320468 (remainingBits!0 ((_ sign_extend 32) (size!4554 (buf!5059 (_1!9424 lt!320349)))) ((_ sign_extend 32) (currentByte!9556 (_1!9424 lt!320349))) ((_ sign_extend 32) (currentBit!9551 (_1!9424 lt!320349)))))))

(declare-fun lt!320467 () (_ BitVec 64))

(declare-fun lt!320470 () (_ BitVec 64))

(assert (=> d!69907 (= lt!320471 (bvmul lt!320467 lt!320470))))

(assert (=> d!69907 (or (= lt!320467 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!320470 (bvsdiv (bvmul lt!320467 lt!320470) lt!320467)))))

(assert (=> d!69907 (= lt!320470 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69907 (= lt!320467 ((_ sign_extend 32) (size!4554 (buf!5059 (_1!9424 lt!320349)))))))

(assert (=> d!69907 (= lt!320466 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9556 (_1!9424 lt!320349))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9551 (_1!9424 lt!320349)))))))

(assert (=> d!69907 (invariant!0 (currentBit!9551 (_1!9424 lt!320349)) (currentByte!9556 (_1!9424 lt!320349)) (size!4554 (buf!5059 (_1!9424 lt!320349))))))

(assert (=> d!69907 (= (bitIndex!0 (size!4554 (buf!5059 (_1!9424 lt!320349))) (currentByte!9556 (_1!9424 lt!320349)) (currentBit!9551 (_1!9424 lt!320349))) lt!320466)))

(declare-fun b!205232 () Bool)

(declare-fun res!172039 () Bool)

(assert (=> b!205232 (=> (not res!172039) (not e!140435))))

(assert (=> b!205232 (= res!172039 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!320466))))

(declare-fun b!205233 () Bool)

(declare-fun lt!320469 () (_ BitVec 64))

(assert (=> b!205233 (= e!140435 (bvsle lt!320466 (bvmul lt!320469 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!205233 (or (= lt!320469 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!320469 #b0000000000000000000000000000000000000000000000000000000000001000) lt!320469)))))

(assert (=> b!205233 (= lt!320469 ((_ sign_extend 32) (size!4554 (buf!5059 (_1!9424 lt!320349)))))))

(assert (= (and d!69907 res!172038) b!205232))

(assert (= (and b!205232 res!172039) b!205233))

(declare-fun m!316407 () Bool)

(assert (=> d!69907 m!316407))

(declare-fun m!316409 () Bool)

(assert (=> d!69907 m!316409))

(assert (=> b!205135 d!69907))

(declare-datatypes ((tuple4!276 0))(
  ( (tuple4!277 (_1!9433 (_ BitVec 32)) (_2!9433 (_ BitVec 32)) (_3!654 (_ BitVec 32)) (_4!138 (_ BitVec 32))) )
))
(declare-fun lt!320478 () tuple4!276)

(declare-fun b!205248 () Bool)

(declare-fun e!140448 () Bool)

(declare-fun arrayRangesEq!700 (array!10359 array!10359 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!205248 (= e!140448 (arrayRangesEq!700 (buf!5059 (_2!9423 lt!320351)) (buf!5059 (_2!9423 lt!320354)) (_1!9433 lt!320478) (_2!9433 lt!320478)))))

(declare-fun d!69921 () Bool)

(declare-fun res!172053 () Bool)

(declare-fun e!140453 () Bool)

(assert (=> d!69921 (=> res!172053 e!140453)))

(assert (=> d!69921 (= res!172053 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4554 (buf!5059 (_2!9423 lt!320351))) (currentByte!9556 thiss!1204) (currentBit!9551 thiss!1204)))))))

(assert (=> d!69921 (= (arrayBitRangesEq!0 (buf!5059 (_2!9423 lt!320351)) (buf!5059 (_2!9423 lt!320354)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4554 (buf!5059 (_2!9423 lt!320351))) (currentByte!9556 thiss!1204) (currentBit!9551 thiss!1204)))) e!140453)))

(declare-fun b!205249 () Bool)

(declare-fun e!140450 () Bool)

(declare-fun e!140451 () Bool)

(assert (=> b!205249 (= e!140450 e!140451)))

(declare-fun c!10154 () Bool)

(assert (=> b!205249 (= c!10154 (= (_3!654 lt!320478) (_4!138 lt!320478)))))

(declare-fun b!205250 () Bool)

(assert (=> b!205250 (= e!140453 e!140450)))

(declare-fun res!172050 () Bool)

(assert (=> b!205250 (=> (not res!172050) (not e!140450))))

(assert (=> b!205250 (= res!172050 e!140448)))

(declare-fun res!172054 () Bool)

(assert (=> b!205250 (=> res!172054 e!140448)))

(assert (=> b!205250 (= res!172054 (bvsge (_1!9433 lt!320478) (_2!9433 lt!320478)))))

(declare-fun lt!320480 () (_ BitVec 32))

(assert (=> b!205250 (= lt!320480 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4554 (buf!5059 (_2!9423 lt!320351))) (currentByte!9556 thiss!1204) (currentBit!9551 thiss!1204))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!320479 () (_ BitVec 32))

(assert (=> b!205250 (= lt!320479 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!276)

(assert (=> b!205250 (= lt!320478 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4554 (buf!5059 (_2!9423 lt!320351))) (currentByte!9556 thiss!1204) (currentBit!9551 thiss!1204)))))))

(declare-fun e!140449 () Bool)

(declare-fun b!205251 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!205251 (= e!140449 (byteRangesEq!0 (select (arr!5484 (buf!5059 (_2!9423 lt!320351))) (_4!138 lt!320478)) (select (arr!5484 (buf!5059 (_2!9423 lt!320354))) (_4!138 lt!320478)) #b00000000000000000000000000000000 lt!320480))))

(declare-fun b!205252 () Bool)

(declare-fun res!172052 () Bool)

(assert (=> b!205252 (= res!172052 (= lt!320480 #b00000000000000000000000000000000))))

(assert (=> b!205252 (=> res!172052 e!140449)))

(declare-fun e!140452 () Bool)

(assert (=> b!205252 (= e!140452 e!140449)))

(declare-fun b!205253 () Bool)

(declare-fun call!3246 () Bool)

(assert (=> b!205253 (= e!140451 call!3246)))

(declare-fun b!205254 () Bool)

(assert (=> b!205254 (= e!140451 e!140452)))

(declare-fun res!172051 () Bool)

(assert (=> b!205254 (= res!172051 call!3246)))

(assert (=> b!205254 (=> (not res!172051) (not e!140452))))

(declare-fun bm!3243 () Bool)

(assert (=> bm!3243 (= call!3246 (byteRangesEq!0 (select (arr!5484 (buf!5059 (_2!9423 lt!320351))) (_3!654 lt!320478)) (select (arr!5484 (buf!5059 (_2!9423 lt!320354))) (_3!654 lt!320478)) lt!320479 (ite c!10154 lt!320480 #b00000000000000000000000000001000)))))

(assert (= (and d!69921 (not res!172053)) b!205250))

(assert (= (and b!205250 (not res!172054)) b!205248))

(assert (= (and b!205250 res!172050) b!205249))

(assert (= (and b!205249 c!10154) b!205253))

(assert (= (and b!205249 (not c!10154)) b!205254))

(assert (= (and b!205254 res!172051) b!205252))

(assert (= (and b!205252 (not res!172052)) b!205251))

(assert (= (or b!205253 b!205254) bm!3243))

(declare-fun m!316411 () Bool)

(assert (=> b!205248 m!316411))

(declare-fun m!316413 () Bool)

(assert (=> b!205250 m!316413))

(declare-fun m!316415 () Bool)

(assert (=> b!205251 m!316415))

(declare-fun m!316417 () Bool)

(assert (=> b!205251 m!316417))

(assert (=> b!205251 m!316415))

(assert (=> b!205251 m!316417))

(declare-fun m!316419 () Bool)

(assert (=> b!205251 m!316419))

(declare-fun m!316421 () Bool)

(assert (=> bm!3243 m!316421))

(declare-fun m!316423 () Bool)

(assert (=> bm!3243 m!316423))

(assert (=> bm!3243 m!316421))

(assert (=> bm!3243 m!316423))

(declare-fun m!316425 () Bool)

(assert (=> bm!3243 m!316425))

(assert (=> b!205134 d!69921))

(declare-fun d!69923 () Bool)

(declare-fun e!140454 () Bool)

(assert (=> d!69923 e!140454))

(declare-fun res!172055 () Bool)

(assert (=> d!69923 (=> (not res!172055) (not e!140454))))

(declare-fun lt!320483 () (_ BitVec 64))

(declare-fun lt!320486 () (_ BitVec 64))

(declare-fun lt!320481 () (_ BitVec 64))

(assert (=> d!69923 (= res!172055 (= lt!320481 (bvsub lt!320486 lt!320483)))))

(assert (=> d!69923 (or (= (bvand lt!320486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!320483 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!320486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!320486 lt!320483) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69923 (= lt!320483 (remainingBits!0 ((_ sign_extend 32) (size!4554 (buf!5059 (_2!9423 lt!320351)))) ((_ sign_extend 32) (currentByte!9556 thiss!1204)) ((_ sign_extend 32) (currentBit!9551 thiss!1204))))))

(declare-fun lt!320482 () (_ BitVec 64))

(declare-fun lt!320485 () (_ BitVec 64))

(assert (=> d!69923 (= lt!320486 (bvmul lt!320482 lt!320485))))

(assert (=> d!69923 (or (= lt!320482 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!320485 (bvsdiv (bvmul lt!320482 lt!320485) lt!320482)))))

(assert (=> d!69923 (= lt!320485 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69923 (= lt!320482 ((_ sign_extend 32) (size!4554 (buf!5059 (_2!9423 lt!320351)))))))

(assert (=> d!69923 (= lt!320481 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9556 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9551 thiss!1204))))))

(assert (=> d!69923 (invariant!0 (currentBit!9551 thiss!1204) (currentByte!9556 thiss!1204) (size!4554 (buf!5059 (_2!9423 lt!320351))))))

(assert (=> d!69923 (= (bitIndex!0 (size!4554 (buf!5059 (_2!9423 lt!320351))) (currentByte!9556 thiss!1204) (currentBit!9551 thiss!1204)) lt!320481)))

(declare-fun b!205255 () Bool)

(declare-fun res!172056 () Bool)

(assert (=> b!205255 (=> (not res!172056) (not e!140454))))

(assert (=> b!205255 (= res!172056 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!320481))))

(declare-fun b!205256 () Bool)

(declare-fun lt!320484 () (_ BitVec 64))

(assert (=> b!205256 (= e!140454 (bvsle lt!320481 (bvmul lt!320484 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!205256 (or (= lt!320484 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!320484 #b0000000000000000000000000000000000000000000000000000000000001000) lt!320484)))))

(assert (=> b!205256 (= lt!320484 ((_ sign_extend 32) (size!4554 (buf!5059 (_2!9423 lt!320351)))))))

(assert (= (and d!69923 res!172055) b!205255))

(assert (= (and b!205255 res!172056) b!205256))

(declare-fun m!316427 () Bool)

(assert (=> d!69923 m!316427))

(assert (=> d!69923 m!316331))

(assert (=> b!205134 d!69923))

(declare-fun d!69925 () Bool)

(declare-fun e!140455 () Bool)

(assert (=> d!69925 e!140455))

(declare-fun res!172057 () Bool)

(assert (=> d!69925 (=> (not res!172057) (not e!140455))))

(declare-fun lt!320489 () (_ BitVec 64))

(declare-fun lt!320492 () (_ BitVec 64))

(declare-fun lt!320487 () (_ BitVec 64))

(assert (=> d!69925 (= res!172057 (= lt!320487 (bvsub lt!320492 lt!320489)))))

(assert (=> d!69925 (or (= (bvand lt!320492 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!320489 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!320492 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!320492 lt!320489) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69925 (= lt!320489 (remainingBits!0 ((_ sign_extend 32) (size!4554 (buf!5059 (_2!9423 lt!320351)))) ((_ sign_extend 32) (currentByte!9556 (_2!9423 lt!320351))) ((_ sign_extend 32) (currentBit!9551 (_2!9423 lt!320351)))))))

(declare-fun lt!320488 () (_ BitVec 64))

(declare-fun lt!320491 () (_ BitVec 64))

(assert (=> d!69925 (= lt!320492 (bvmul lt!320488 lt!320491))))

(assert (=> d!69925 (or (= lt!320488 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!320491 (bvsdiv (bvmul lt!320488 lt!320491) lt!320488)))))

(assert (=> d!69925 (= lt!320491 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69925 (= lt!320488 ((_ sign_extend 32) (size!4554 (buf!5059 (_2!9423 lt!320351)))))))

(assert (=> d!69925 (= lt!320487 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9556 (_2!9423 lt!320351))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9551 (_2!9423 lt!320351)))))))

(assert (=> d!69925 (invariant!0 (currentBit!9551 (_2!9423 lt!320351)) (currentByte!9556 (_2!9423 lt!320351)) (size!4554 (buf!5059 (_2!9423 lt!320351))))))

(assert (=> d!69925 (= (bitIndex!0 (size!4554 (buf!5059 (_2!9423 lt!320351))) (currentByte!9556 (_2!9423 lt!320351)) (currentBit!9551 (_2!9423 lt!320351))) lt!320487)))

(declare-fun b!205257 () Bool)

(declare-fun res!172058 () Bool)

(assert (=> b!205257 (=> (not res!172058) (not e!140455))))

(assert (=> b!205257 (= res!172058 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!320487))))

(declare-fun b!205258 () Bool)

(declare-fun lt!320490 () (_ BitVec 64))

(assert (=> b!205258 (= e!140455 (bvsle lt!320487 (bvmul lt!320490 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!205258 (or (= lt!320490 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!320490 #b0000000000000000000000000000000000000000000000000000000000001000) lt!320490)))))

(assert (=> b!205258 (= lt!320490 ((_ sign_extend 32) (size!4554 (buf!5059 (_2!9423 lt!320351)))))))

(assert (= (and d!69925 res!172057) b!205257))

(assert (= (and b!205257 res!172058) b!205258))

(declare-fun m!316429 () Bool)

(assert (=> d!69925 m!316429))

(declare-fun m!316431 () Bool)

(assert (=> d!69925 m!316431))

(assert (=> b!205144 d!69925))

(declare-fun d!69927 () Bool)

(declare-fun e!140456 () Bool)

(assert (=> d!69927 e!140456))

(declare-fun res!172059 () Bool)

(assert (=> d!69927 (=> (not res!172059) (not e!140456))))

(declare-fun lt!320498 () (_ BitVec 64))

(declare-fun lt!320495 () (_ BitVec 64))

(declare-fun lt!320493 () (_ BitVec 64))

(assert (=> d!69927 (= res!172059 (= lt!320493 (bvsub lt!320498 lt!320495)))))

(assert (=> d!69927 (or (= (bvand lt!320498 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!320495 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!320498 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!320498 lt!320495) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69927 (= lt!320495 (remainingBits!0 ((_ sign_extend 32) (size!4554 (buf!5059 thiss!1204))) ((_ sign_extend 32) (currentByte!9556 thiss!1204)) ((_ sign_extend 32) (currentBit!9551 thiss!1204))))))

(declare-fun lt!320494 () (_ BitVec 64))

(declare-fun lt!320497 () (_ BitVec 64))

(assert (=> d!69927 (= lt!320498 (bvmul lt!320494 lt!320497))))

(assert (=> d!69927 (or (= lt!320494 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!320497 (bvsdiv (bvmul lt!320494 lt!320497) lt!320494)))))

(assert (=> d!69927 (= lt!320497 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69927 (= lt!320494 ((_ sign_extend 32) (size!4554 (buf!5059 thiss!1204))))))

(assert (=> d!69927 (= lt!320493 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9556 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9551 thiss!1204))))))

(assert (=> d!69927 (invariant!0 (currentBit!9551 thiss!1204) (currentByte!9556 thiss!1204) (size!4554 (buf!5059 thiss!1204)))))

(assert (=> d!69927 (= (bitIndex!0 (size!4554 (buf!5059 thiss!1204)) (currentByte!9556 thiss!1204) (currentBit!9551 thiss!1204)) lt!320493)))

(declare-fun b!205259 () Bool)

(declare-fun res!172060 () Bool)

(assert (=> b!205259 (=> (not res!172060) (not e!140456))))

(assert (=> b!205259 (= res!172060 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!320493))))

(declare-fun b!205260 () Bool)

(declare-fun lt!320496 () (_ BitVec 64))

(assert (=> b!205260 (= e!140456 (bvsle lt!320493 (bvmul lt!320496 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!205260 (or (= lt!320496 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!320496 #b0000000000000000000000000000000000000000000000000000000000001000) lt!320496)))))

(assert (=> b!205260 (= lt!320496 ((_ sign_extend 32) (size!4554 (buf!5059 thiss!1204))))))

(assert (= (and d!69927 res!172059) b!205259))

(assert (= (and b!205259 res!172060) b!205260))

(declare-fun m!316433 () Bool)

(assert (=> d!69927 m!316433))

(assert (=> d!69927 m!316309))

(assert (=> b!205144 d!69927))

(declare-fun d!69929 () Bool)

(declare-datatypes ((tuple2!17558 0))(
  ( (tuple2!17559 (_1!9434 Bool) (_2!9434 BitStream!8216)) )
))
(declare-fun lt!320501 () tuple2!17558)

(declare-fun readBit!0 (BitStream!8216) tuple2!17558)

(assert (=> d!69929 (= lt!320501 (readBit!0 (readerFrom!0 (_2!9423 lt!320351) (currentBit!9551 thiss!1204) (currentByte!9556 thiss!1204))))))

(assert (=> d!69929 (= (readBitPure!0 (readerFrom!0 (_2!9423 lt!320351) (currentBit!9551 thiss!1204) (currentByte!9556 thiss!1204))) (tuple2!17545 (_2!9434 lt!320501) (_1!9434 lt!320501)))))

(declare-fun bs!17200 () Bool)

(assert (= bs!17200 d!69929))

(assert (=> bs!17200 m!316317))

(declare-fun m!316435 () Bool)

(assert (=> bs!17200 m!316435))

(assert (=> b!205133 d!69929))

(declare-fun d!69931 () Bool)

(declare-fun e!140459 () Bool)

(assert (=> d!69931 e!140459))

(declare-fun res!172064 () Bool)

(assert (=> d!69931 (=> (not res!172064) (not e!140459))))

(assert (=> d!69931 (= res!172064 (invariant!0 (currentBit!9551 (_2!9423 lt!320351)) (currentByte!9556 (_2!9423 lt!320351)) (size!4554 (buf!5059 (_2!9423 lt!320351)))))))

(assert (=> d!69931 (= (readerFrom!0 (_2!9423 lt!320351) (currentBit!9551 thiss!1204) (currentByte!9556 thiss!1204)) (BitStream!8217 (buf!5059 (_2!9423 lt!320351)) (currentByte!9556 thiss!1204) (currentBit!9551 thiss!1204)))))

(declare-fun b!205263 () Bool)

(assert (=> b!205263 (= e!140459 (invariant!0 (currentBit!9551 thiss!1204) (currentByte!9556 thiss!1204) (size!4554 (buf!5059 (_2!9423 lt!320351)))))))

(assert (= (and d!69931 res!172064) b!205263))

(assert (=> d!69931 m!316431))

(assert (=> b!205263 m!316331))

(assert (=> b!205133 d!69931))

(declare-fun d!69933 () Bool)

(assert (=> d!69933 (= (invariant!0 (currentBit!9551 thiss!1204) (currentByte!9556 thiss!1204) (size!4554 (buf!5059 thiss!1204))) (and (bvsge (currentBit!9551 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9551 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9556 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9556 thiss!1204) (size!4554 (buf!5059 thiss!1204))) (and (= (currentBit!9551 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9556 thiss!1204) (size!4554 (buf!5059 thiss!1204)))))))))

(assert (=> b!205148 d!69933))

(declare-fun d!69935 () Bool)

(declare-fun res!172072 () Bool)

(declare-fun e!140465 () Bool)

(assert (=> d!69935 (=> (not res!172072) (not e!140465))))

(assert (=> d!69935 (= res!172072 (= (size!4554 (buf!5059 (_2!9423 lt!320351))) (size!4554 (buf!5059 (_2!9423 lt!320354)))))))

(assert (=> d!69935 (= (isPrefixOf!0 (_2!9423 lt!320351) (_2!9423 lt!320354)) e!140465)))

(declare-fun b!205270 () Bool)

(declare-fun res!172073 () Bool)

(assert (=> b!205270 (=> (not res!172073) (not e!140465))))

(assert (=> b!205270 (= res!172073 (bvsle (bitIndex!0 (size!4554 (buf!5059 (_2!9423 lt!320351))) (currentByte!9556 (_2!9423 lt!320351)) (currentBit!9551 (_2!9423 lt!320351))) (bitIndex!0 (size!4554 (buf!5059 (_2!9423 lt!320354))) (currentByte!9556 (_2!9423 lt!320354)) (currentBit!9551 (_2!9423 lt!320354)))))))

(declare-fun b!205271 () Bool)

(declare-fun e!140464 () Bool)

(assert (=> b!205271 (= e!140465 e!140464)))

(declare-fun res!172071 () Bool)

(assert (=> b!205271 (=> res!172071 e!140464)))

(assert (=> b!205271 (= res!172071 (= (size!4554 (buf!5059 (_2!9423 lt!320351))) #b00000000000000000000000000000000))))

(declare-fun b!205272 () Bool)

(assert (=> b!205272 (= e!140464 (arrayBitRangesEq!0 (buf!5059 (_2!9423 lt!320351)) (buf!5059 (_2!9423 lt!320354)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4554 (buf!5059 (_2!9423 lt!320351))) (currentByte!9556 (_2!9423 lt!320351)) (currentBit!9551 (_2!9423 lt!320351)))))))

(assert (= (and d!69935 res!172072) b!205270))

(assert (= (and b!205270 res!172073) b!205271))

(assert (= (and b!205271 (not res!172071)) b!205272))

(assert (=> b!205270 m!316299))

(assert (=> b!205270 m!316321))

(assert (=> b!205272 m!316299))

(assert (=> b!205272 m!316299))

(declare-fun m!316437 () Bool)

(assert (=> b!205272 m!316437))

(assert (=> b!205137 d!69935))

(declare-fun d!69937 () Bool)

(assert (=> d!69937 (= (invariant!0 (currentBit!9551 (_2!9423 lt!320354)) (currentByte!9556 (_2!9423 lt!320354)) (size!4554 (buf!5059 (_2!9423 lt!320354)))) (and (bvsge (currentBit!9551 (_2!9423 lt!320354)) #b00000000000000000000000000000000) (bvslt (currentBit!9551 (_2!9423 lt!320354)) #b00000000000000000000000000001000) (bvsge (currentByte!9556 (_2!9423 lt!320354)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9556 (_2!9423 lt!320354)) (size!4554 (buf!5059 (_2!9423 lt!320354)))) (and (= (currentBit!9551 (_2!9423 lt!320354)) #b00000000000000000000000000000000) (= (currentByte!9556 (_2!9423 lt!320354)) (size!4554 (buf!5059 (_2!9423 lt!320354))))))))))

(assert (=> b!205147 d!69937))

(declare-fun d!69939 () Bool)

(assert (=> d!69939 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4554 (buf!5059 thiss!1204))) ((_ sign_extend 32) (currentByte!9556 thiss!1204)) ((_ sign_extend 32) (currentBit!9551 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4554 (buf!5059 thiss!1204))) ((_ sign_extend 32) (currentByte!9556 thiss!1204)) ((_ sign_extend 32) (currentBit!9551 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!17201 () Bool)

(assert (= bs!17201 d!69939))

(assert (=> bs!17201 m!316433))

(assert (=> b!205136 d!69939))

(declare-fun d!69941 () Bool)

(assert (=> d!69941 (= (array_inv!4295 (buf!5059 thiss!1204)) (bvsge (size!4554 (buf!5059 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!205146 d!69941))

(assert (=> b!205140 d!69925))

(assert (=> b!205140 d!69927))

(declare-fun b!205283 () Bool)

(declare-fun res!172084 () Bool)

(declare-fun e!140470 () Bool)

(assert (=> b!205283 (=> (not res!172084) (not e!140470))))

(declare-fun lt!320513 () tuple2!17542)

(assert (=> b!205283 (= res!172084 (isPrefixOf!0 thiss!1204 (_2!9423 lt!320513)))))

(declare-fun b!205285 () Bool)

(declare-fun e!140471 () Bool)

(declare-fun lt!320510 () tuple2!17544)

(assert (=> b!205285 (= e!140471 (= (bitIndex!0 (size!4554 (buf!5059 (_1!9424 lt!320510))) (currentByte!9556 (_1!9424 lt!320510)) (currentBit!9551 (_1!9424 lt!320510))) (bitIndex!0 (size!4554 (buf!5059 (_2!9423 lt!320513))) (currentByte!9556 (_2!9423 lt!320513)) (currentBit!9551 (_2!9423 lt!320513)))))))

(declare-fun b!205282 () Bool)

(declare-fun res!172083 () Bool)

(assert (=> b!205282 (=> (not res!172083) (not e!140470))))

(declare-fun lt!320511 () (_ BitVec 64))

(declare-fun lt!320512 () (_ BitVec 64))

(assert (=> b!205282 (= res!172083 (= (bitIndex!0 (size!4554 (buf!5059 (_2!9423 lt!320513))) (currentByte!9556 (_2!9423 lt!320513)) (currentBit!9551 (_2!9423 lt!320513))) (bvadd lt!320512 lt!320511)))))

(assert (=> b!205282 (or (not (= (bvand lt!320512 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!320511 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!320512 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!320512 lt!320511) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!205282 (= lt!320511 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!205282 (= lt!320512 (bitIndex!0 (size!4554 (buf!5059 thiss!1204)) (currentByte!9556 thiss!1204) (currentBit!9551 thiss!1204)))))

(declare-fun d!69943 () Bool)

(assert (=> d!69943 e!140470))

(declare-fun res!172085 () Bool)

(assert (=> d!69943 (=> (not res!172085) (not e!140470))))

(assert (=> d!69943 (= res!172085 (= (size!4554 (buf!5059 thiss!1204)) (size!4554 (buf!5059 (_2!9423 lt!320513)))))))

(declare-fun choose!16 (BitStream!8216 Bool) tuple2!17542)

(assert (=> d!69943 (= lt!320513 (choose!16 thiss!1204 lt!320345))))

(assert (=> d!69943 (validate_offset_bit!0 ((_ sign_extend 32) (size!4554 (buf!5059 thiss!1204))) ((_ sign_extend 32) (currentByte!9556 thiss!1204)) ((_ sign_extend 32) (currentBit!9551 thiss!1204)))))

(assert (=> d!69943 (= (appendBit!0 thiss!1204 lt!320345) lt!320513)))

(declare-fun b!205284 () Bool)

(assert (=> b!205284 (= e!140470 e!140471)))

(declare-fun res!172082 () Bool)

(assert (=> b!205284 (=> (not res!172082) (not e!140471))))

(assert (=> b!205284 (= res!172082 (and (= (_2!9424 lt!320510) lt!320345) (= (_1!9424 lt!320510) (_2!9423 lt!320513))))))

(assert (=> b!205284 (= lt!320510 (readBitPure!0 (readerFrom!0 (_2!9423 lt!320513) (currentBit!9551 thiss!1204) (currentByte!9556 thiss!1204))))))

(assert (= (and d!69943 res!172085) b!205282))

(assert (= (and b!205282 res!172083) b!205283))

(assert (= (and b!205283 res!172084) b!205284))

(assert (= (and b!205284 res!172082) b!205285))

(declare-fun m!316439 () Bool)

(assert (=> b!205285 m!316439))

(declare-fun m!316441 () Bool)

(assert (=> b!205285 m!316441))

(declare-fun m!316443 () Bool)

(assert (=> b!205284 m!316443))

(assert (=> b!205284 m!316443))

(declare-fun m!316445 () Bool)

(assert (=> b!205284 m!316445))

(declare-fun m!316447 () Bool)

(assert (=> d!69943 m!316447))

(declare-fun m!316449 () Bool)

(assert (=> d!69943 m!316449))

(assert (=> b!205282 m!316441))

(assert (=> b!205282 m!316301))

(declare-fun m!316451 () Bool)

(assert (=> b!205283 m!316451))

(assert (=> b!205140 d!69943))

(declare-fun d!69945 () Bool)

(declare-fun res!172087 () Bool)

(declare-fun e!140473 () Bool)

(assert (=> d!69945 (=> (not res!172087) (not e!140473))))

(assert (=> d!69945 (= res!172087 (= (size!4554 (buf!5059 thiss!1204)) (size!4554 (buf!5059 (_2!9423 lt!320351)))))))

(assert (=> d!69945 (= (isPrefixOf!0 thiss!1204 (_2!9423 lt!320351)) e!140473)))

(declare-fun b!205286 () Bool)

(declare-fun res!172088 () Bool)

(assert (=> b!205286 (=> (not res!172088) (not e!140473))))

(assert (=> b!205286 (= res!172088 (bvsle (bitIndex!0 (size!4554 (buf!5059 thiss!1204)) (currentByte!9556 thiss!1204) (currentBit!9551 thiss!1204)) (bitIndex!0 (size!4554 (buf!5059 (_2!9423 lt!320351))) (currentByte!9556 (_2!9423 lt!320351)) (currentBit!9551 (_2!9423 lt!320351)))))))

(declare-fun b!205287 () Bool)

(declare-fun e!140472 () Bool)

(assert (=> b!205287 (= e!140473 e!140472)))

(declare-fun res!172086 () Bool)

(assert (=> b!205287 (=> res!172086 e!140472)))

(assert (=> b!205287 (= res!172086 (= (size!4554 (buf!5059 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!205288 () Bool)

(assert (=> b!205288 (= e!140472 (arrayBitRangesEq!0 (buf!5059 thiss!1204) (buf!5059 (_2!9423 lt!320351)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4554 (buf!5059 thiss!1204)) (currentByte!9556 thiss!1204) (currentBit!9551 thiss!1204))))))

(assert (= (and d!69945 res!172087) b!205286))

(assert (= (and b!205286 res!172088) b!205287))

(assert (= (and b!205287 (not res!172086)) b!205288))

(assert (=> b!205286 m!316301))

(assert (=> b!205286 m!316299))

(assert (=> b!205288 m!316301))

(assert (=> b!205288 m!316301))

(declare-fun m!316453 () Bool)

(assert (=> b!205288 m!316453))

(assert (=> b!205139 d!69945))

(declare-fun d!69947 () Bool)

(assert (=> d!69947 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!4554 (buf!5059 (_2!9423 lt!320351)))) ((_ sign_extend 32) (currentByte!9556 thiss!1204)) ((_ sign_extend 32) (currentBit!9551 thiss!1204))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4554 (buf!5059 (_2!9423 lt!320351)))) ((_ sign_extend 32) (currentByte!9556 thiss!1204)) ((_ sign_extend 32) (currentBit!9551 thiss!1204))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!17202 () Bool)

(assert (= bs!17202 d!69947))

(assert (=> bs!17202 m!316427))

(assert (=> b!205149 d!69947))

(declare-fun d!69949 () Bool)

(assert (=> d!69949 (= (invariant!0 (currentBit!9551 thiss!1204) (currentByte!9556 thiss!1204) (size!4554 (buf!5059 (_2!9423 lt!320351)))) (and (bvsge (currentBit!9551 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9551 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9556 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9556 thiss!1204) (size!4554 (buf!5059 (_2!9423 lt!320351)))) (and (= (currentBit!9551 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9556 thiss!1204) (size!4554 (buf!5059 (_2!9423 lt!320351))))))))))

(assert (=> b!205138 d!69949))

(assert (=> b!205143 d!69945))

(declare-fun d!69951 () Bool)

(assert (=> d!69951 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9551 thiss!1204) (currentByte!9556 thiss!1204) (size!4554 (buf!5059 thiss!1204))))))

(declare-fun bs!17203 () Bool)

(assert (= bs!17203 d!69951))

(assert (=> bs!17203 m!316309))

(assert (=> start!43426 d!69951))

(declare-fun d!69953 () Bool)

(declare-fun e!140474 () Bool)

(assert (=> d!69953 e!140474))

(declare-fun res!172089 () Bool)

(assert (=> d!69953 (=> (not res!172089) (not e!140474))))

(declare-fun lt!320516 () (_ BitVec 64))

(declare-fun lt!320519 () (_ BitVec 64))

(declare-fun lt!320514 () (_ BitVec 64))

(assert (=> d!69953 (= res!172089 (= lt!320514 (bvsub lt!320519 lt!320516)))))

(assert (=> d!69953 (or (= (bvand lt!320519 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!320516 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!320519 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!320519 lt!320516) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69953 (= lt!320516 (remainingBits!0 ((_ sign_extend 32) (size!4554 (buf!5059 (_2!9423 lt!320354)))) ((_ sign_extend 32) (currentByte!9556 (_2!9423 lt!320354))) ((_ sign_extend 32) (currentBit!9551 (_2!9423 lt!320354)))))))

(declare-fun lt!320515 () (_ BitVec 64))

(declare-fun lt!320518 () (_ BitVec 64))

(assert (=> d!69953 (= lt!320519 (bvmul lt!320515 lt!320518))))

(assert (=> d!69953 (or (= lt!320515 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!320518 (bvsdiv (bvmul lt!320515 lt!320518) lt!320515)))))

(assert (=> d!69953 (= lt!320518 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69953 (= lt!320515 ((_ sign_extend 32) (size!4554 (buf!5059 (_2!9423 lt!320354)))))))

(assert (=> d!69953 (= lt!320514 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9556 (_2!9423 lt!320354))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9551 (_2!9423 lt!320354)))))))

(assert (=> d!69953 (invariant!0 (currentBit!9551 (_2!9423 lt!320354)) (currentByte!9556 (_2!9423 lt!320354)) (size!4554 (buf!5059 (_2!9423 lt!320354))))))

(assert (=> d!69953 (= (bitIndex!0 (size!4554 (buf!5059 (_2!9423 lt!320354))) (currentByte!9556 (_2!9423 lt!320354)) (currentBit!9551 (_2!9423 lt!320354))) lt!320514)))

(declare-fun b!205289 () Bool)

(declare-fun res!172090 () Bool)

(assert (=> b!205289 (=> (not res!172090) (not e!140474))))

(assert (=> b!205289 (= res!172090 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!320514))))

(declare-fun b!205290 () Bool)

(declare-fun lt!320517 () (_ BitVec 64))

(assert (=> b!205290 (= e!140474 (bvsle lt!320514 (bvmul lt!320517 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!205290 (or (= lt!320517 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!320517 #b0000000000000000000000000000000000000000000000000000000000001000) lt!320517)))))

(assert (=> b!205290 (= lt!320517 ((_ sign_extend 32) (size!4554 (buf!5059 (_2!9423 lt!320354)))))))

(assert (= (and d!69953 res!172089) b!205289))

(assert (= (and b!205289 res!172090) b!205290))

(declare-fun m!316455 () Bool)

(assert (=> d!69953 m!316455))

(assert (=> d!69953 m!316333))

(assert (=> b!205142 d!69953))

(declare-fun d!69955 () Bool)

(declare-fun res!172092 () Bool)

(declare-fun e!140476 () Bool)

(assert (=> d!69955 (=> (not res!172092) (not e!140476))))

(assert (=> d!69955 (= res!172092 (= (size!4554 (buf!5059 thiss!1204)) (size!4554 (buf!5059 (_2!9423 lt!320354)))))))

(assert (=> d!69955 (= (isPrefixOf!0 thiss!1204 (_2!9423 lt!320354)) e!140476)))

(declare-fun b!205291 () Bool)

(declare-fun res!172093 () Bool)

(assert (=> b!205291 (=> (not res!172093) (not e!140476))))

(assert (=> b!205291 (= res!172093 (bvsle (bitIndex!0 (size!4554 (buf!5059 thiss!1204)) (currentByte!9556 thiss!1204) (currentBit!9551 thiss!1204)) (bitIndex!0 (size!4554 (buf!5059 (_2!9423 lt!320354))) (currentByte!9556 (_2!9423 lt!320354)) (currentBit!9551 (_2!9423 lt!320354)))))))

(declare-fun b!205292 () Bool)

(declare-fun e!140475 () Bool)

(assert (=> b!205292 (= e!140476 e!140475)))

(declare-fun res!172091 () Bool)

(assert (=> b!205292 (=> res!172091 e!140475)))

(assert (=> b!205292 (= res!172091 (= (size!4554 (buf!5059 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!205293 () Bool)

(assert (=> b!205293 (= e!140475 (arrayBitRangesEq!0 (buf!5059 thiss!1204) (buf!5059 (_2!9423 lt!320354)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4554 (buf!5059 thiss!1204)) (currentByte!9556 thiss!1204) (currentBit!9551 thiss!1204))))))

(assert (= (and d!69955 res!172092) b!205291))

(assert (= (and b!205291 res!172093) b!205292))

(assert (= (and b!205292 (not res!172091)) b!205293))

(assert (=> b!205291 m!316301))

(assert (=> b!205291 m!316321))

(assert (=> b!205293 m!316301))

(assert (=> b!205293 m!316301))

(declare-fun m!316457 () Bool)

(assert (=> b!205293 m!316457))

(assert (=> b!205142 d!69955))

(declare-fun d!69957 () Bool)

(assert (=> d!69957 (isPrefixOf!0 thiss!1204 (_2!9423 lt!320354))))

(declare-fun lt!320522 () Unit!14632)

(declare-fun choose!30 (BitStream!8216 BitStream!8216 BitStream!8216) Unit!14632)

(assert (=> d!69957 (= lt!320522 (choose!30 thiss!1204 (_2!9423 lt!320351) (_2!9423 lt!320354)))))

(assert (=> d!69957 (isPrefixOf!0 thiss!1204 (_2!9423 lt!320351))))

(assert (=> d!69957 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9423 lt!320351) (_2!9423 lt!320354)) lt!320522)))

(declare-fun bs!17204 () Bool)

(assert (= bs!17204 d!69957))

(assert (=> bs!17204 m!316323))

(declare-fun m!316459 () Bool)

(assert (=> bs!17204 m!316459))

(assert (=> bs!17204 m!316329))

(assert (=> b!205142 d!69957))

(declare-fun b!205476 () Bool)

(declare-fun res!172244 () Bool)

(declare-fun e!140596 () Bool)

(assert (=> b!205476 (=> (not res!172244) (not e!140596))))

(declare-fun lt!321039 () (_ BitVec 64))

(declare-fun lt!321062 () (_ BitVec 64))

(declare-fun lt!321045 () tuple2!17542)

(assert (=> b!205476 (= res!172244 (= (bitIndex!0 (size!4554 (buf!5059 (_2!9423 lt!321045))) (currentByte!9556 (_2!9423 lt!321045)) (currentBit!9551 (_2!9423 lt!321045))) (bvsub lt!321062 lt!321039)))))

(assert (=> b!205476 (or (= (bvand lt!321062 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!321039 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!321062 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!321062 lt!321039) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!205476 (= lt!321039 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!321015 () (_ BitVec 64))

(declare-fun lt!321034 () (_ BitVec 64))

(assert (=> b!205476 (= lt!321062 (bvadd lt!321015 lt!321034))))

(assert (=> b!205476 (or (not (= (bvand lt!321015 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!321034 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!321015 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!321015 lt!321034) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!205476 (= lt!321034 ((_ sign_extend 32) nBits!348))))

(assert (=> b!205476 (= lt!321015 (bitIndex!0 (size!4554 (buf!5059 (_2!9423 lt!320351))) (currentByte!9556 (_2!9423 lt!320351)) (currentBit!9551 (_2!9423 lt!320351))))))

(declare-fun c!10177 () Bool)

(declare-fun lt!321038 () tuple2!17542)

(declare-fun call!3261 () Bool)

(declare-fun bm!3258 () Bool)

(assert (=> bm!3258 (= call!3261 (isPrefixOf!0 (_2!9423 lt!320351) (ite c!10177 (_2!9423 lt!320351) (_2!9423 lt!321038))))))

(declare-fun b!205477 () Bool)

(declare-fun e!140594 () tuple2!17542)

(assert (=> b!205477 (= e!140594 (tuple2!17543 (_1!9423 lt!321038) (_2!9423 lt!321038)))))

(declare-fun lt!321020 () Bool)

(assert (=> b!205477 (= lt!321020 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!321052 () tuple2!17542)

(assert (=> b!205477 (= lt!321052 (appendBit!0 (_2!9423 lt!320351) lt!321020))))

(declare-fun res!172235 () Bool)

(assert (=> b!205477 (= res!172235 (= (size!4554 (buf!5059 (_2!9423 lt!320351))) (size!4554 (buf!5059 (_2!9423 lt!321052)))))))

(declare-fun e!140598 () Bool)

(assert (=> b!205477 (=> (not res!172235) (not e!140598))))

(assert (=> b!205477 e!140598))

(declare-fun lt!321044 () tuple2!17542)

(assert (=> b!205477 (= lt!321044 lt!321052)))

(assert (=> b!205477 (= lt!321038 (appendBitsLSBFirstLoopTR!0 (_2!9423 lt!321044) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!321027 () Unit!14632)

(assert (=> b!205477 (= lt!321027 (lemmaIsPrefixTransitive!0 (_2!9423 lt!320351) (_2!9423 lt!321044) (_2!9423 lt!321038)))))

(assert (=> b!205477 call!3261))

(declare-fun lt!321065 () Unit!14632)

(assert (=> b!205477 (= lt!321065 lt!321027)))

(assert (=> b!205477 (invariant!0 (currentBit!9551 (_2!9423 lt!320351)) (currentByte!9556 (_2!9423 lt!320351)) (size!4554 (buf!5059 (_2!9423 lt!321044))))))

(declare-fun lt!321026 () BitStream!8216)

(assert (=> b!205477 (= lt!321026 (BitStream!8217 (buf!5059 (_2!9423 lt!321044)) (currentByte!9556 (_2!9423 lt!320351)) (currentBit!9551 (_2!9423 lt!320351))))))

(assert (=> b!205477 (invariant!0 (currentBit!9551 lt!321026) (currentByte!9556 lt!321026) (size!4554 (buf!5059 (_2!9423 lt!321038))))))

(declare-fun lt!321063 () BitStream!8216)

(assert (=> b!205477 (= lt!321063 (BitStream!8217 (buf!5059 (_2!9423 lt!321038)) (currentByte!9556 lt!321026) (currentBit!9551 lt!321026)))))

(declare-fun lt!321016 () tuple2!17544)

(assert (=> b!205477 (= lt!321016 (readBitPure!0 lt!321026))))

(declare-fun lt!321019 () tuple2!17544)

(assert (=> b!205477 (= lt!321019 (readBitPure!0 lt!321063))))

(declare-fun lt!321023 () Unit!14632)

(declare-fun readBitPrefixLemma!0 (BitStream!8216 BitStream!8216) Unit!14632)

(assert (=> b!205477 (= lt!321023 (readBitPrefixLemma!0 lt!321026 (_2!9423 lt!321038)))))

(declare-fun res!172241 () Bool)

(assert (=> b!205477 (= res!172241 (= (bitIndex!0 (size!4554 (buf!5059 (_1!9424 lt!321016))) (currentByte!9556 (_1!9424 lt!321016)) (currentBit!9551 (_1!9424 lt!321016))) (bitIndex!0 (size!4554 (buf!5059 (_1!9424 lt!321019))) (currentByte!9556 (_1!9424 lt!321019)) (currentBit!9551 (_1!9424 lt!321019)))))))

(declare-fun e!140599 () Bool)

(assert (=> b!205477 (=> (not res!172241) (not e!140599))))

(assert (=> b!205477 e!140599))

(declare-fun lt!321061 () Unit!14632)

(assert (=> b!205477 (= lt!321061 lt!321023)))

(declare-datatypes ((tuple2!17560 0))(
  ( (tuple2!17561 (_1!9435 BitStream!8216) (_2!9435 BitStream!8216)) )
))
(declare-fun lt!321051 () tuple2!17560)

(declare-fun reader!0 (BitStream!8216 BitStream!8216) tuple2!17560)

(assert (=> b!205477 (= lt!321051 (reader!0 (_2!9423 lt!320351) (_2!9423 lt!321038)))))

(declare-fun lt!321029 () tuple2!17560)

(assert (=> b!205477 (= lt!321029 (reader!0 (_2!9423 lt!321044) (_2!9423 lt!321038)))))

(declare-fun lt!321054 () tuple2!17544)

(assert (=> b!205477 (= lt!321054 (readBitPure!0 (_1!9435 lt!321051)))))

(assert (=> b!205477 (= (_2!9424 lt!321054) lt!321020)))

(declare-fun lt!321049 () Unit!14632)

(declare-fun Unit!14656 () Unit!14632)

(assert (=> b!205477 (= lt!321049 Unit!14656)))

(declare-fun lt!321014 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!205477 (= lt!321014 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!321022 () (_ BitVec 64))

(assert (=> b!205477 (= lt!321022 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!321042 () Unit!14632)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8216 array!10359 (_ BitVec 64)) Unit!14632)

(assert (=> b!205477 (= lt!321042 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9423 lt!320351) (buf!5059 (_2!9423 lt!321038)) lt!321022))))

(assert (=> b!205477 (validate_offset_bits!1 ((_ sign_extend 32) (size!4554 (buf!5059 (_2!9423 lt!321038)))) ((_ sign_extend 32) (currentByte!9556 (_2!9423 lt!320351))) ((_ sign_extend 32) (currentBit!9551 (_2!9423 lt!320351))) lt!321022)))

(declare-fun lt!321056 () Unit!14632)

(assert (=> b!205477 (= lt!321056 lt!321042)))

(declare-datatypes ((tuple2!17562 0))(
  ( (tuple2!17563 (_1!9436 BitStream!8216) (_2!9436 (_ BitVec 64))) )
))
(declare-fun lt!321013 () tuple2!17562)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8216 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17562)

(assert (=> b!205477 (= lt!321013 (readNBitsLSBFirstsLoopPure!0 (_1!9435 lt!321051) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!321014))))

(declare-fun lt!321064 () (_ BitVec 64))

(assert (=> b!205477 (= lt!321064 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!321043 () Unit!14632)

(assert (=> b!205477 (= lt!321043 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9423 lt!321044) (buf!5059 (_2!9423 lt!321038)) lt!321064))))

(assert (=> b!205477 (validate_offset_bits!1 ((_ sign_extend 32) (size!4554 (buf!5059 (_2!9423 lt!321038)))) ((_ sign_extend 32) (currentByte!9556 (_2!9423 lt!321044))) ((_ sign_extend 32) (currentBit!9551 (_2!9423 lt!321044))) lt!321064)))

(declare-fun lt!321048 () Unit!14632)

(assert (=> b!205477 (= lt!321048 lt!321043)))

(declare-fun lt!321036 () tuple2!17562)

(assert (=> b!205477 (= lt!321036 (readNBitsLSBFirstsLoopPure!0 (_1!9435 lt!321029) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!321014 (ite (_2!9424 lt!321054) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!321050 () tuple2!17562)

(assert (=> b!205477 (= lt!321050 (readNBitsLSBFirstsLoopPure!0 (_1!9435 lt!321051) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!321014))))

(declare-fun c!10178 () Bool)

(assert (=> b!205477 (= c!10178 (_2!9424 (readBitPure!0 (_1!9435 lt!321051))))))

(declare-fun lt!321055 () tuple2!17562)

(declare-fun e!140593 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!8216 (_ BitVec 64)) BitStream!8216)

(assert (=> b!205477 (= lt!321055 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9435 lt!321051) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!321014 e!140593)))))

(declare-fun lt!321033 () Unit!14632)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8216 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14632)

(assert (=> b!205477 (= lt!321033 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9435 lt!321051) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!321014))))

(assert (=> b!205477 (and (= (_2!9436 lt!321050) (_2!9436 lt!321055)) (= (_1!9436 lt!321050) (_1!9436 lt!321055)))))

(declare-fun lt!321040 () Unit!14632)

(assert (=> b!205477 (= lt!321040 lt!321033)))

(assert (=> b!205477 (= (_1!9435 lt!321051) (withMovedBitIndex!0 (_2!9435 lt!321051) (bvsub (bitIndex!0 (size!4554 (buf!5059 (_2!9423 lt!320351))) (currentByte!9556 (_2!9423 lt!320351)) (currentBit!9551 (_2!9423 lt!320351))) (bitIndex!0 (size!4554 (buf!5059 (_2!9423 lt!321038))) (currentByte!9556 (_2!9423 lt!321038)) (currentBit!9551 (_2!9423 lt!321038))))))))

(declare-fun lt!321037 () Unit!14632)

(declare-fun Unit!14657 () Unit!14632)

(assert (=> b!205477 (= lt!321037 Unit!14657)))

(assert (=> b!205477 (= (_1!9435 lt!321029) (withMovedBitIndex!0 (_2!9435 lt!321029) (bvsub (bitIndex!0 (size!4554 (buf!5059 (_2!9423 lt!321044))) (currentByte!9556 (_2!9423 lt!321044)) (currentBit!9551 (_2!9423 lt!321044))) (bitIndex!0 (size!4554 (buf!5059 (_2!9423 lt!321038))) (currentByte!9556 (_2!9423 lt!321038)) (currentBit!9551 (_2!9423 lt!321038))))))))

(declare-fun lt!321018 () Unit!14632)

(declare-fun Unit!14658 () Unit!14632)

(assert (=> b!205477 (= lt!321018 Unit!14658)))

(assert (=> b!205477 (= (bitIndex!0 (size!4554 (buf!5059 (_2!9423 lt!320351))) (currentByte!9556 (_2!9423 lt!320351)) (currentBit!9551 (_2!9423 lt!320351))) (bvsub (bitIndex!0 (size!4554 (buf!5059 (_2!9423 lt!321044))) (currentByte!9556 (_2!9423 lt!321044)) (currentBit!9551 (_2!9423 lt!321044))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!321058 () Unit!14632)

(declare-fun Unit!14659 () Unit!14632)

(assert (=> b!205477 (= lt!321058 Unit!14659)))

(assert (=> b!205477 (= (_2!9436 lt!321013) (_2!9436 lt!321036))))

(declare-fun lt!321053 () Unit!14632)

(declare-fun Unit!14660 () Unit!14632)

(assert (=> b!205477 (= lt!321053 Unit!14660)))

(assert (=> b!205477 (invariant!0 (currentBit!9551 (_2!9423 lt!321038)) (currentByte!9556 (_2!9423 lt!321038)) (size!4554 (buf!5059 (_2!9423 lt!321038))))))

(declare-fun lt!321031 () Unit!14632)

(declare-fun Unit!14661 () Unit!14632)

(assert (=> b!205477 (= lt!321031 Unit!14661)))

(assert (=> b!205477 (= (size!4554 (buf!5059 (_2!9423 lt!320351))) (size!4554 (buf!5059 (_2!9423 lt!321038))))))

(declare-fun lt!321017 () Unit!14632)

(declare-fun Unit!14662 () Unit!14632)

(assert (=> b!205477 (= lt!321017 Unit!14662)))

(assert (=> b!205477 (= (bitIndex!0 (size!4554 (buf!5059 (_2!9423 lt!321038))) (currentByte!9556 (_2!9423 lt!321038)) (currentBit!9551 (_2!9423 lt!321038))) (bvsub (bvadd (bitIndex!0 (size!4554 (buf!5059 (_2!9423 lt!320351))) (currentByte!9556 (_2!9423 lt!320351)) (currentBit!9551 (_2!9423 lt!320351))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!321035 () Unit!14632)

(declare-fun Unit!14663 () Unit!14632)

(assert (=> b!205477 (= lt!321035 Unit!14663)))

(declare-fun lt!321059 () Unit!14632)

(declare-fun Unit!14664 () Unit!14632)

(assert (=> b!205477 (= lt!321059 Unit!14664)))

(declare-fun lt!321025 () tuple2!17560)

(assert (=> b!205477 (= lt!321025 (reader!0 (_2!9423 lt!320351) (_2!9423 lt!321038)))))

(declare-fun lt!321060 () (_ BitVec 64))

(assert (=> b!205477 (= lt!321060 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!321012 () Unit!14632)

(assert (=> b!205477 (= lt!321012 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9423 lt!320351) (buf!5059 (_2!9423 lt!321038)) lt!321060))))

(assert (=> b!205477 (validate_offset_bits!1 ((_ sign_extend 32) (size!4554 (buf!5059 (_2!9423 lt!321038)))) ((_ sign_extend 32) (currentByte!9556 (_2!9423 lt!320351))) ((_ sign_extend 32) (currentBit!9551 (_2!9423 lt!320351))) lt!321060)))

(declare-fun lt!321041 () Unit!14632)

(assert (=> b!205477 (= lt!321041 lt!321012)))

(declare-fun lt!321046 () tuple2!17562)

(assert (=> b!205477 (= lt!321046 (readNBitsLSBFirstsLoopPure!0 (_1!9435 lt!321025) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!172237 () Bool)

(assert (=> b!205477 (= res!172237 (= (_2!9436 lt!321046) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!140600 () Bool)

(assert (=> b!205477 (=> (not res!172237) (not e!140600))))

(assert (=> b!205477 e!140600))

(declare-fun lt!321024 () Unit!14632)

(declare-fun Unit!14665 () Unit!14632)

(assert (=> b!205477 (= lt!321024 Unit!14665)))

(declare-fun b!205479 () Bool)

(assert (=> b!205479 (= e!140593 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!205480 () Bool)

(declare-fun Unit!14666 () Unit!14632)

(assert (=> b!205480 (= e!140594 (tuple2!17543 Unit!14666 (_2!9423 lt!320351)))))

(declare-fun lt!321021 () Unit!14632)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8216) Unit!14632)

(assert (=> b!205480 (= lt!321021 (lemmaIsPrefixRefl!0 (_2!9423 lt!320351)))))

(assert (=> b!205480 call!3261))

(declare-fun lt!321032 () Unit!14632)

(assert (=> b!205480 (= lt!321032 lt!321021)))

(declare-fun b!205481 () Bool)

(declare-fun e!140595 () Bool)

(declare-fun lt!321011 () tuple2!17562)

(declare-fun lt!321047 () tuple2!17560)

(assert (=> b!205481 (= e!140595 (= (_1!9436 lt!321011) (_2!9435 lt!321047)))))

(declare-fun b!205482 () Bool)

(assert (=> b!205482 (= e!140596 e!140595)))

(declare-fun res!172242 () Bool)

(assert (=> b!205482 (=> (not res!172242) (not e!140595))))

(assert (=> b!205482 (= res!172242 (= (_2!9436 lt!321011) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!205482 (= lt!321011 (readNBitsLSBFirstsLoopPure!0 (_1!9435 lt!321047) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!321057 () Unit!14632)

(declare-fun lt!321028 () Unit!14632)

(assert (=> b!205482 (= lt!321057 lt!321028)))

(declare-fun lt!321010 () (_ BitVec 64))

(assert (=> b!205482 (validate_offset_bits!1 ((_ sign_extend 32) (size!4554 (buf!5059 (_2!9423 lt!321045)))) ((_ sign_extend 32) (currentByte!9556 (_2!9423 lt!320351))) ((_ sign_extend 32) (currentBit!9551 (_2!9423 lt!320351))) lt!321010)))

(assert (=> b!205482 (= lt!321028 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9423 lt!320351) (buf!5059 (_2!9423 lt!321045)) lt!321010))))

(declare-fun e!140597 () Bool)

(assert (=> b!205482 e!140597))

(declare-fun res!172243 () Bool)

(assert (=> b!205482 (=> (not res!172243) (not e!140597))))

(assert (=> b!205482 (= res!172243 (and (= (size!4554 (buf!5059 (_2!9423 lt!320351))) (size!4554 (buf!5059 (_2!9423 lt!321045)))) (bvsge lt!321010 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!205482 (= lt!321010 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!205482 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!205482 (= lt!321047 (reader!0 (_2!9423 lt!320351) (_2!9423 lt!321045)))))

(declare-fun b!205483 () Bool)

(assert (=> b!205483 (= e!140593 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!205484 () Bool)

(declare-fun res!172240 () Bool)

(assert (=> b!205484 (= res!172240 (= (bitIndex!0 (size!4554 (buf!5059 (_2!9423 lt!321052))) (currentByte!9556 (_2!9423 lt!321052)) (currentBit!9551 (_2!9423 lt!321052))) (bvadd (bitIndex!0 (size!4554 (buf!5059 (_2!9423 lt!320351))) (currentByte!9556 (_2!9423 lt!320351)) (currentBit!9551 (_2!9423 lt!320351))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!205484 (=> (not res!172240) (not e!140598))))

(declare-fun b!205485 () Bool)

(declare-fun res!172234 () Bool)

(assert (=> b!205485 (=> (not res!172234) (not e!140596))))

(assert (=> b!205485 (= res!172234 (isPrefixOf!0 (_2!9423 lt!320351) (_2!9423 lt!321045)))))

(declare-fun b!205486 () Bool)

(assert (=> b!205486 (= e!140600 (= (_1!9436 lt!321046) (_2!9435 lt!321025)))))

(declare-fun b!205487 () Bool)

(assert (=> b!205487 (= e!140599 (= (_2!9424 lt!321016) (_2!9424 lt!321019)))))

(declare-fun b!205488 () Bool)

(declare-fun res!172233 () Bool)

(assert (=> b!205488 (=> (not res!172233) (not e!140596))))

(assert (=> b!205488 (= res!172233 (= (size!4554 (buf!5059 (_2!9423 lt!320351))) (size!4554 (buf!5059 (_2!9423 lt!321045)))))))

(declare-fun d!69959 () Bool)

(assert (=> d!69959 e!140596))

(declare-fun res!172236 () Bool)

(assert (=> d!69959 (=> (not res!172236) (not e!140596))))

(assert (=> d!69959 (= res!172236 (invariant!0 (currentBit!9551 (_2!9423 lt!321045)) (currentByte!9556 (_2!9423 lt!321045)) (size!4554 (buf!5059 (_2!9423 lt!321045)))))))

(assert (=> d!69959 (= lt!321045 e!140594)))

(assert (=> d!69959 (= c!10177 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!69959 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!69959 (= (appendBitsLSBFirstLoopTR!0 (_2!9423 lt!320351) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!321045)))

(declare-fun b!205478 () Bool)

(declare-fun lt!321030 () tuple2!17544)

(assert (=> b!205478 (= lt!321030 (readBitPure!0 (readerFrom!0 (_2!9423 lt!321052) (currentBit!9551 (_2!9423 lt!320351)) (currentByte!9556 (_2!9423 lt!320351)))))))

(declare-fun res!172239 () Bool)

(assert (=> b!205478 (= res!172239 (and (= (_2!9424 lt!321030) lt!321020) (= (_1!9424 lt!321030) (_2!9423 lt!321052))))))

(declare-fun e!140601 () Bool)

(assert (=> b!205478 (=> (not res!172239) (not e!140601))))

(assert (=> b!205478 (= e!140598 e!140601)))

(declare-fun b!205489 () Bool)

(declare-fun res!172238 () Bool)

(assert (=> b!205489 (= res!172238 (isPrefixOf!0 (_2!9423 lt!320351) (_2!9423 lt!321052)))))

(assert (=> b!205489 (=> (not res!172238) (not e!140598))))

(declare-fun b!205490 () Bool)

(assert (=> b!205490 (= e!140601 (= (bitIndex!0 (size!4554 (buf!5059 (_1!9424 lt!321030))) (currentByte!9556 (_1!9424 lt!321030)) (currentBit!9551 (_1!9424 lt!321030))) (bitIndex!0 (size!4554 (buf!5059 (_2!9423 lt!321052))) (currentByte!9556 (_2!9423 lt!321052)) (currentBit!9551 (_2!9423 lt!321052)))))))

(declare-fun b!205491 () Bool)

(assert (=> b!205491 (= e!140597 (validate_offset_bits!1 ((_ sign_extend 32) (size!4554 (buf!5059 (_2!9423 lt!320351)))) ((_ sign_extend 32) (currentByte!9556 (_2!9423 lt!320351))) ((_ sign_extend 32) (currentBit!9551 (_2!9423 lt!320351))) lt!321010))))

(assert (= (and d!69959 c!10177) b!205480))

(assert (= (and d!69959 (not c!10177)) b!205477))

(assert (= (and b!205477 res!172235) b!205484))

(assert (= (and b!205484 res!172240) b!205489))

(assert (= (and b!205489 res!172238) b!205478))

(assert (= (and b!205478 res!172239) b!205490))

(assert (= (and b!205477 res!172241) b!205487))

(assert (= (and b!205477 c!10178) b!205479))

(assert (= (and b!205477 (not c!10178)) b!205483))

(assert (= (and b!205477 res!172237) b!205486))

(assert (= (or b!205480 b!205477) bm!3258))

(assert (= (and d!69959 res!172236) b!205488))

(assert (= (and b!205488 res!172233) b!205476))

(assert (= (and b!205476 res!172244) b!205485))

(assert (= (and b!205485 res!172234) b!205482))

(assert (= (and b!205482 res!172243) b!205491))

(assert (= (and b!205482 res!172242) b!205481))

(declare-fun m!316691 () Bool)

(assert (=> bm!3258 m!316691))

(declare-fun m!316693 () Bool)

(assert (=> b!205490 m!316693))

(declare-fun m!316695 () Bool)

(assert (=> b!205490 m!316695))

(declare-fun m!316697 () Bool)

(assert (=> b!205482 m!316697))

(declare-fun m!316699 () Bool)

(assert (=> b!205482 m!316699))

(declare-fun m!316701 () Bool)

(assert (=> b!205482 m!316701))

(declare-fun m!316703 () Bool)

(assert (=> b!205482 m!316703))

(declare-fun m!316705 () Bool)

(assert (=> b!205482 m!316705))

(declare-fun m!316707 () Bool)

(assert (=> b!205482 m!316707))

(declare-fun m!316709 () Bool)

(assert (=> b!205480 m!316709))

(assert (=> b!205484 m!316695))

(assert (=> b!205484 m!316299))

(assert (=> b!205477 m!316299))

(declare-fun m!316711 () Bool)

(assert (=> b!205477 m!316711))

(declare-fun m!316713 () Bool)

(assert (=> b!205477 m!316713))

(declare-fun m!316715 () Bool)

(assert (=> b!205477 m!316715))

(declare-fun m!316717 () Bool)

(assert (=> b!205477 m!316717))

(declare-fun m!316719 () Bool)

(assert (=> b!205477 m!316719))

(declare-fun m!316721 () Bool)

(assert (=> b!205477 m!316721))

(declare-fun m!316723 () Bool)

(assert (=> b!205477 m!316723))

(declare-fun m!316725 () Bool)

(assert (=> b!205477 m!316725))

(declare-fun m!316727 () Bool)

(assert (=> b!205477 m!316727))

(declare-fun m!316729 () Bool)

(assert (=> b!205477 m!316729))

(declare-fun m!316731 () Bool)

(assert (=> b!205477 m!316731))

(declare-fun m!316733 () Bool)

(assert (=> b!205477 m!316733))

(declare-fun m!316735 () Bool)

(assert (=> b!205477 m!316735))

(declare-fun m!316737 () Bool)

(assert (=> b!205477 m!316737))

(declare-fun m!316739 () Bool)

(assert (=> b!205477 m!316739))

(assert (=> b!205477 m!316703))

(declare-fun m!316741 () Bool)

(assert (=> b!205477 m!316741))

(declare-fun m!316743 () Bool)

(assert (=> b!205477 m!316743))

(declare-fun m!316745 () Bool)

(assert (=> b!205477 m!316745))

(declare-fun m!316747 () Bool)

(assert (=> b!205477 m!316747))

(declare-fun m!316749 () Bool)

(assert (=> b!205477 m!316749))

(declare-fun m!316751 () Bool)

(assert (=> b!205477 m!316751))

(declare-fun m!316753 () Bool)

(assert (=> b!205477 m!316753))

(declare-fun m!316755 () Bool)

(assert (=> b!205477 m!316755))

(declare-fun m!316757 () Bool)

(assert (=> b!205477 m!316757))

(assert (=> b!205477 m!316705))

(assert (=> b!205477 m!316739))

(declare-fun m!316759 () Bool)

(assert (=> b!205477 m!316759))

(declare-fun m!316761 () Bool)

(assert (=> b!205477 m!316761))

(declare-fun m!316763 () Bool)

(assert (=> b!205477 m!316763))

(declare-fun m!316765 () Bool)

(assert (=> b!205477 m!316765))

(declare-fun m!316767 () Bool)

(assert (=> b!205477 m!316767))

(declare-fun m!316769 () Bool)

(assert (=> b!205477 m!316769))

(declare-fun m!316771 () Bool)

(assert (=> d!69959 m!316771))

(declare-fun m!316773 () Bool)

(assert (=> b!205491 m!316773))

(declare-fun m!316775 () Bool)

(assert (=> b!205485 m!316775))

(declare-fun m!316777 () Bool)

(assert (=> b!205478 m!316777))

(assert (=> b!205478 m!316777))

(declare-fun m!316779 () Bool)

(assert (=> b!205478 m!316779))

(declare-fun m!316781 () Bool)

(assert (=> b!205476 m!316781))

(assert (=> b!205476 m!316299))

(declare-fun m!316783 () Bool)

(assert (=> b!205489 m!316783))

(assert (=> b!205142 d!69959))

(push 1)

(assert (not d!69939))

(assert (not b!205489))

(assert (not b!205283))

(assert (not d!69943))

(assert (not b!205282))

(assert (not b!205491))

(assert (not b!205478))

(assert (not b!205484))

(assert (not b!205251))

(assert (not d!69953))

(assert (not d!69951))

(assert (not d!69927))

(assert (not b!205476))

(assert (not d!69947))

(assert (not d!69907))

(assert (not b!205482))

(assert (not b!205248))

(assert (not d!69923))

(assert (not b!205285))

(assert (not b!205270))

(assert (not b!205485))

(assert (not d!69929))

(assert (not b!205250))

(assert (not bm!3243))

(assert (not b!205286))

(assert (not d!69957))

(assert (not d!69925))

(assert (not b!205490))

(assert (not bm!3258))

(assert (not d!69959))

(assert (not b!205263))

(assert (not b!205291))

(assert (not b!205293))

(assert (not b!205477))

(assert (not b!205288))

(assert (not b!205284))

(assert (not b!205272))

(assert (not d!69931))

(assert (not b!205480))

(check-sat)

(pop 1)

(push 1)

(check-sat)

