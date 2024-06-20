; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19224 () Bool)

(assert start!19224)

(declare-fun b!96404 () Bool)

(declare-fun res!79249 () Bool)

(declare-fun e!63131 () Bool)

(assert (=> b!96404 (=> (not res!79249) (not e!63131))))

(declare-datatypes ((array!4495 0))(
  ( (array!4496 (arr!2651 (Array (_ BitVec 32) (_ BitVec 8))) (size!2055 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3590 0))(
  ( (BitStream!3591 (buf!2404 array!4495) (currentByte!4792 (_ BitVec 32)) (currentBit!4787 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3590)

(declare-fun bitStream2!8 () BitStream!3590)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!96404 (= res!79249 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2055 (buf!2404 bitStream1!8)) (currentByte!4792 bitStream1!8) (currentBit!4787 bitStream1!8))) (bitIndex!0 (size!2055 (buf!2404 bitStream2!8)) (currentByte!4792 bitStream2!8) (currentBit!4787 bitStream2!8))))))

(declare-fun b!96405 () Bool)

(declare-fun res!79239 () Bool)

(assert (=> b!96405 (=> (not res!79239) (not e!63131))))

(declare-fun base!8 () BitStream!3590)

(declare-fun isPrefixOf!0 (BitStream!3590 BitStream!3590) Bool)

(assert (=> b!96405 (= res!79239 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!96406 () Bool)

(declare-fun res!79238 () Bool)

(assert (=> b!96406 (=> (not res!79238) (not e!63131))))

(assert (=> b!96406 (= res!79238 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!96407 () Bool)

(declare-fun res!79245 () Bool)

(assert (=> b!96407 (=> (not res!79245) (not e!63131))))

(declare-fun nBits!484 () (_ BitVec 64))

(assert (=> b!96407 (= res!79245 (bvslt (bitIndex!0 (size!2055 (buf!2404 base!8)) (currentByte!4792 base!8) (currentBit!4787 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!96408 () Bool)

(declare-fun e!63128 () Bool)

(declare-fun thiss!1534 () BitStream!3590)

(declare-fun array_inv!1860 (array!4495) Bool)

(assert (=> b!96408 (= e!63128 (array_inv!1860 (buf!2404 thiss!1534)))))

(declare-fun b!96409 () Bool)

(declare-fun res!79247 () Bool)

(assert (=> b!96409 (=> (not res!79247) (not e!63131))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!96409 (= res!79247 (validate_offset_bits!1 ((_ sign_extend 32) (size!2055 (buf!2404 bitStream2!8))) ((_ sign_extend 32) (currentByte!4792 bitStream2!8)) ((_ sign_extend 32) (currentBit!4787 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!96410 () Bool)

(declare-fun res!79246 () Bool)

(assert (=> b!96410 (=> (not res!79246) (not e!63131))))

(declare-datatypes ((List!901 0))(
  ( (Nil!898) (Cons!897 (h!1016 Bool) (t!1651 List!901)) )
))
(declare-fun listBits!13 () List!901)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!3590 BitStream!3590 (_ BitVec 64)) List!901)

(assert (=> b!96410 (= res!79246 (= listBits!13 (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484)))))

(declare-fun b!96411 () Bool)

(declare-fun res!79248 () Bool)

(assert (=> b!96411 (=> (not res!79248) (not e!63131))))

(assert (=> b!96411 (= res!79248 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!96412 () Bool)

(declare-fun res!79241 () Bool)

(assert (=> b!96412 (=> (not res!79241) (not e!63131))))

(assert (=> b!96412 (= res!79241 (validate_offset_bits!1 ((_ sign_extend 32) (size!2055 (buf!2404 bitStream1!8))) ((_ sign_extend 32) (currentByte!4792 bitStream1!8)) ((_ sign_extend 32) (currentBit!4787 bitStream1!8)) nBits!484))))

(declare-fun b!96413 () Bool)

(declare-fun res!79237 () Bool)

(assert (=> b!96413 (=> (not res!79237) (not e!63131))))

(declare-fun length!492 (List!901) Int)

(assert (=> b!96413 (= res!79237 (> (length!492 listBits!13) 0))))

(declare-fun b!96414 () Bool)

(declare-fun res!79243 () Bool)

(assert (=> b!96414 (=> (not res!79243) (not e!63131))))

(assert (=> b!96414 (= res!79243 (not (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!96415 () Bool)

(declare-fun res!79242 () Bool)

(assert (=> b!96415 (=> (not res!79242) (not e!63131))))

(declare-datatypes ((tuple2!7728 0))(
  ( (tuple2!7729 (_1!4113 BitStream!3590) (_2!4113 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!3590) tuple2!7728)

(declare-fun head!598 (List!901) Bool)

(assert (=> b!96415 (= res!79242 (= (_2!4113 (readBitPure!0 bitStream1!8)) (head!598 listBits!13)))))

(declare-fun b!96416 () Bool)

(declare-fun e!63135 () Bool)

(assert (=> b!96416 (= e!63135 (array_inv!1860 (buf!2404 base!8)))))

(declare-fun b!96417 () Bool)

(declare-fun e!63127 () Bool)

(assert (=> b!96417 (= e!63127 (array_inv!1860 (buf!2404 bitStream1!8)))))

(declare-fun b!96418 () Bool)

(declare-fun e!63129 () Bool)

(assert (=> b!96418 (= e!63129 (array_inv!1860 (buf!2404 bitStream2!8)))))

(declare-fun res!79244 () Bool)

(assert (=> start!19224 (=> (not res!79244) (not e!63131))))

(assert (=> start!19224 (= res!79244 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!19224 e!63131))

(assert (=> start!19224 true))

(declare-fun inv!12 (BitStream!3590) Bool)

(assert (=> start!19224 (and (inv!12 bitStream1!8) e!63127)))

(assert (=> start!19224 (and (inv!12 bitStream2!8) e!63129)))

(assert (=> start!19224 (and (inv!12 base!8) e!63135)))

(assert (=> start!19224 (and (inv!12 thiss!1534) e!63128)))

(declare-fun b!96419 () Bool)

(declare-fun res!79240 () Bool)

(assert (=> b!96419 (=> (not res!79240) (not e!63131))))

(assert (=> b!96419 (= res!79240 (and (= (buf!2404 bitStream1!8) (buf!2404 bitStream2!8)) (= (buf!2404 bitStream1!8) (buf!2404 base!8))))))

(declare-fun b!96420 () Bool)

(declare-fun tail!377 (List!901) List!901)

(assert (=> b!96420 (= e!63131 (not (= (bitStreamReadBitsIntoList!0 thiss!1534 bitStream2!8 (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!377 listBits!13))))))

(assert (= (and start!19224 res!79244) b!96413))

(assert (= (and b!96413 res!79237) b!96406))

(assert (= (and b!96406 res!79238) b!96405))

(assert (= (and b!96405 res!79239) b!96411))

(assert (= (and b!96411 res!79248) b!96419))

(assert (= (and b!96419 res!79240) b!96407))

(assert (= (and b!96407 res!79245) b!96404))

(assert (= (and b!96404 res!79249) b!96412))

(assert (= (and b!96412 res!79241) b!96409))

(assert (= (and b!96409 res!79247) b!96410))

(assert (= (and b!96410 res!79246) b!96414))

(assert (= (and b!96414 res!79243) b!96415))

(assert (= (and b!96415 res!79242) b!96420))

(assert (= start!19224 b!96417))

(assert (= start!19224 b!96418))

(assert (= start!19224 b!96416))

(assert (= start!19224 b!96408))

(declare-fun m!139727 () Bool)

(assert (=> b!96408 m!139727))

(declare-fun m!139729 () Bool)

(assert (=> b!96415 m!139729))

(declare-fun m!139731 () Bool)

(assert (=> b!96415 m!139731))

(declare-fun m!139733 () Bool)

(assert (=> b!96418 m!139733))

(declare-fun m!139735 () Bool)

(assert (=> b!96405 m!139735))

(declare-fun m!139737 () Bool)

(assert (=> b!96413 m!139737))

(declare-fun m!139739 () Bool)

(assert (=> b!96420 m!139739))

(declare-fun m!139741 () Bool)

(assert (=> b!96420 m!139741))

(declare-fun m!139743 () Bool)

(assert (=> b!96416 m!139743))

(declare-fun m!139745 () Bool)

(assert (=> b!96407 m!139745))

(declare-fun m!139747 () Bool)

(assert (=> b!96417 m!139747))

(declare-fun m!139749 () Bool)

(assert (=> b!96406 m!139749))

(declare-fun m!139751 () Bool)

(assert (=> b!96412 m!139751))

(declare-fun m!139753 () Bool)

(assert (=> b!96411 m!139753))

(declare-fun m!139755 () Bool)

(assert (=> b!96409 m!139755))

(declare-fun m!139757 () Bool)

(assert (=> start!19224 m!139757))

(declare-fun m!139759 () Bool)

(assert (=> start!19224 m!139759))

(declare-fun m!139761 () Bool)

(assert (=> start!19224 m!139761))

(declare-fun m!139763 () Bool)

(assert (=> start!19224 m!139763))

(declare-fun m!139765 () Bool)

(assert (=> b!96410 m!139765))

(declare-fun m!139767 () Bool)

(assert (=> b!96404 m!139767))

(declare-fun m!139769 () Bool)

(assert (=> b!96404 m!139769))

(push 1)

(assert (not b!96404))

(assert (not b!96412))

(assert (not b!96406))

(assert (not b!96411))

(assert (not b!96408))

(assert (not b!96405))

(assert (not b!96413))

(assert (not b!96409))

(assert (not b!96407))

(assert (not b!96416))

(assert (not b!96415))

(assert (not b!96420))

(assert (not b!96417))

(assert (not b!96410))

(assert (not start!19224))

(assert (not b!96418))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!30002 () Bool)

(declare-fun size!2058 (List!901) Int)

(assert (=> d!30002 (= (length!492 listBits!13) (size!2058 listBits!13))))

(declare-fun bs!7365 () Bool)

(assert (= bs!7365 d!30002))

(declare-fun m!139811 () Bool)

(assert (=> bs!7365 m!139811))

(assert (=> b!96413 d!30002))

(declare-fun d!30008 () Bool)

(declare-fun e!63175 () Bool)

(assert (=> d!30008 e!63175))

(declare-fun res!79289 () Bool)

(assert (=> d!30008 (=> (not res!79289) (not e!63175))))

(declare-fun lt!139491 () (_ BitVec 64))

(declare-fun lt!139492 () (_ BitVec 64))

(declare-fun lt!139494 () (_ BitVec 64))

(assert (=> d!30008 (= res!79289 (= lt!139491 (bvsub lt!139494 lt!139492)))))

(assert (=> d!30008 (or (= (bvand lt!139494 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139492 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!139494 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!139494 lt!139492) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!30008 (= lt!139492 (remainingBits!0 ((_ sign_extend 32) (size!2055 (buf!2404 bitStream1!8))) ((_ sign_extend 32) (currentByte!4792 bitStream1!8)) ((_ sign_extend 32) (currentBit!4787 bitStream1!8))))))

(declare-fun lt!139495 () (_ BitVec 64))

(declare-fun lt!139493 () (_ BitVec 64))

(assert (=> d!30008 (= lt!139494 (bvmul lt!139495 lt!139493))))

(assert (=> d!30008 (or (= lt!139495 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!139493 (bvsdiv (bvmul lt!139495 lt!139493) lt!139495)))))

(assert (=> d!30008 (= lt!139493 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30008 (= lt!139495 ((_ sign_extend 32) (size!2055 (buf!2404 bitStream1!8))))))

(assert (=> d!30008 (= lt!139491 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4792 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4787 bitStream1!8))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!30008 (invariant!0 (currentBit!4787 bitStream1!8) (currentByte!4792 bitStream1!8) (size!2055 (buf!2404 bitStream1!8)))))

(assert (=> d!30008 (= (bitIndex!0 (size!2055 (buf!2404 bitStream1!8)) (currentByte!4792 bitStream1!8) (currentBit!4787 bitStream1!8)) lt!139491)))

(declare-fun b!96491 () Bool)

(declare-fun res!79288 () Bool)

(assert (=> b!96491 (=> (not res!79288) (not e!63175))))

(assert (=> b!96491 (= res!79288 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!139491))))

(declare-fun b!96492 () Bool)

(declare-fun lt!139496 () (_ BitVec 64))

(assert (=> b!96492 (= e!63175 (bvsle lt!139491 (bvmul lt!139496 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!96492 (or (= lt!139496 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!139496 #b0000000000000000000000000000000000000000000000000000000000001000) lt!139496)))))

(assert (=> b!96492 (= lt!139496 ((_ sign_extend 32) (size!2055 (buf!2404 bitStream1!8))))))

(assert (= (and d!30008 res!79289) b!96491))

(assert (= (and b!96491 res!79288) b!96492))

(declare-fun m!139841 () Bool)

(assert (=> d!30008 m!139841))

(declare-fun m!139843 () Bool)

(assert (=> d!30008 m!139843))

(assert (=> b!96404 d!30008))

(declare-fun d!30034 () Bool)

(declare-fun e!63176 () Bool)

(assert (=> d!30034 e!63176))

(declare-fun res!79291 () Bool)

(assert (=> d!30034 (=> (not res!79291) (not e!63176))))

(declare-fun lt!139500 () (_ BitVec 64))

(declare-fun lt!139497 () (_ BitVec 64))

(declare-fun lt!139498 () (_ BitVec 64))

(assert (=> d!30034 (= res!79291 (= lt!139497 (bvsub lt!139500 lt!139498)))))

(assert (=> d!30034 (or (= (bvand lt!139500 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139498 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!139500 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!139500 lt!139498) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30034 (= lt!139498 (remainingBits!0 ((_ sign_extend 32) (size!2055 (buf!2404 bitStream2!8))) ((_ sign_extend 32) (currentByte!4792 bitStream2!8)) ((_ sign_extend 32) (currentBit!4787 bitStream2!8))))))

(declare-fun lt!139501 () (_ BitVec 64))

(declare-fun lt!139499 () (_ BitVec 64))

(assert (=> d!30034 (= lt!139500 (bvmul lt!139501 lt!139499))))

(assert (=> d!30034 (or (= lt!139501 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!139499 (bvsdiv (bvmul lt!139501 lt!139499) lt!139501)))))

(assert (=> d!30034 (= lt!139499 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30034 (= lt!139501 ((_ sign_extend 32) (size!2055 (buf!2404 bitStream2!8))))))

(assert (=> d!30034 (= lt!139497 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4792 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4787 bitStream2!8))))))

(assert (=> d!30034 (invariant!0 (currentBit!4787 bitStream2!8) (currentByte!4792 bitStream2!8) (size!2055 (buf!2404 bitStream2!8)))))

(assert (=> d!30034 (= (bitIndex!0 (size!2055 (buf!2404 bitStream2!8)) (currentByte!4792 bitStream2!8) (currentBit!4787 bitStream2!8)) lt!139497)))

(declare-fun b!96493 () Bool)

(declare-fun res!79290 () Bool)

(assert (=> b!96493 (=> (not res!79290) (not e!63176))))

(assert (=> b!96493 (= res!79290 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!139497))))

(declare-fun b!96494 () Bool)

(declare-fun lt!139502 () (_ BitVec 64))

(assert (=> b!96494 (= e!63176 (bvsle lt!139497 (bvmul lt!139502 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!96494 (or (= lt!139502 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!139502 #b0000000000000000000000000000000000000000000000000000000000001000) lt!139502)))))

(assert (=> b!96494 (= lt!139502 ((_ sign_extend 32) (size!2055 (buf!2404 bitStream2!8))))))

(assert (= (and d!30034 res!79291) b!96493))

(assert (= (and b!96493 res!79290) b!96494))

(declare-fun m!139845 () Bool)

(assert (=> d!30034 m!139845))

(declare-fun m!139847 () Bool)

(assert (=> d!30034 m!139847))

(assert (=> b!96404 d!30034))

(declare-fun d!30036 () Bool)

(assert (=> d!30036 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4787 bitStream1!8) (currentByte!4792 bitStream1!8) (size!2055 (buf!2404 bitStream1!8))))))

(declare-fun bs!7371 () Bool)

(assert (= bs!7371 d!30036))

(assert (=> bs!7371 m!139843))

(assert (=> start!19224 d!30036))

(declare-fun d!30038 () Bool)

(assert (=> d!30038 (= (inv!12 bitStream2!8) (invariant!0 (currentBit!4787 bitStream2!8) (currentByte!4792 bitStream2!8) (size!2055 (buf!2404 bitStream2!8))))))

(declare-fun bs!7372 () Bool)

(assert (= bs!7372 d!30038))

(assert (=> bs!7372 m!139847))

(assert (=> start!19224 d!30038))

(declare-fun d!30040 () Bool)

(assert (=> d!30040 (= (inv!12 base!8) (invariant!0 (currentBit!4787 base!8) (currentByte!4792 base!8) (size!2055 (buf!2404 base!8))))))

(declare-fun bs!7373 () Bool)

(assert (= bs!7373 d!30040))

(declare-fun m!139849 () Bool)

(assert (=> bs!7373 m!139849))

(assert (=> start!19224 d!30040))

(declare-fun d!30042 () Bool)

(assert (=> d!30042 (= (inv!12 thiss!1534) (invariant!0 (currentBit!4787 thiss!1534) (currentByte!4792 thiss!1534) (size!2055 (buf!2404 thiss!1534))))))

(declare-fun bs!7374 () Bool)

(assert (= bs!7374 d!30042))

(declare-fun m!139851 () Bool)

(assert (=> bs!7374 m!139851))

(assert (=> start!19224 d!30042))

(declare-fun b!96521 () Bool)

(declare-fun e!63191 () Bool)

(declare-fun lt!139543 () List!901)

(declare-fun isEmpty!267 (List!901) Bool)

(assert (=> b!96521 (= e!63191 (isEmpty!267 lt!139543))))

(declare-fun b!96519 () Bool)

(declare-datatypes ((tuple2!7738 0))(
  ( (tuple2!7739 (_1!4118 List!901) (_2!4118 BitStream!3590)) )
))
(declare-fun e!63190 () tuple2!7738)

(assert (=> b!96519 (= e!63190 (tuple2!7739 Nil!898 bitStream1!8))))

(declare-fun b!96522 () Bool)

(assert (=> b!96522 (= e!63191 (> (length!492 lt!139543) 0))))

(declare-fun d!30044 () Bool)

(assert (=> d!30044 e!63191))

(declare-fun c!6060 () Bool)

(assert (=> d!30044 (= c!6060 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!30044 (= lt!139543 (_1!4118 e!63190))))

(declare-fun c!6061 () Bool)

(assert (=> d!30044 (= c!6061 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!30044 (bvsge nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!30044 (= (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484) lt!139543)))

(declare-datatypes ((tuple2!7740 0))(
  ( (tuple2!7741 (_1!4119 Bool) (_2!4119 BitStream!3590)) )
))
(declare-fun lt!139542 () tuple2!7740)

(declare-fun b!96520 () Bool)

(declare-fun lt!139544 () (_ BitVec 64))

(assert (=> b!96520 (= e!63190 (tuple2!7739 (Cons!897 (_1!4119 lt!139542) (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4119 lt!139542) (bvsub nBits!484 lt!139544))) (_2!4119 lt!139542)))))

(declare-fun readBit!0 (BitStream!3590) tuple2!7740)

(assert (=> b!96520 (= lt!139542 (readBit!0 bitStream1!8))))

(assert (=> b!96520 (= lt!139544 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!30044 c!6061) b!96519))

(assert (= (and d!30044 (not c!6061)) b!96520))

(assert (= (and d!30044 c!6060) b!96521))

(assert (= (and d!30044 (not c!6060)) b!96522))

(declare-fun m!139861 () Bool)

(assert (=> b!96521 m!139861))

(declare-fun m!139863 () Bool)

(assert (=> b!96522 m!139863))

(declare-fun m!139865 () Bool)

(assert (=> b!96520 m!139865))

(declare-fun m!139867 () Bool)

(assert (=> b!96520 m!139867))

(assert (=> b!96410 d!30044))

(declare-fun d!30066 () Bool)

(assert (=> d!30066 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2055 (buf!2404 bitStream1!8))) ((_ sign_extend 32) (currentByte!4792 bitStream1!8)) ((_ sign_extend 32) (currentBit!4787 bitStream1!8)) nBits!484) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2055 (buf!2404 bitStream1!8))) ((_ sign_extend 32) (currentByte!4792 bitStream1!8)) ((_ sign_extend 32) (currentBit!4787 bitStream1!8))) nBits!484))))

(declare-fun bs!7377 () Bool)

(assert (= bs!7377 d!30066))

(assert (=> bs!7377 m!139841))

(assert (=> b!96412 d!30066))

(declare-fun d!30068 () Bool)

(declare-fun res!79316 () Bool)

(declare-fun e!63196 () Bool)

(assert (=> d!30068 (=> (not res!79316) (not e!63196))))

(assert (=> d!30068 (= res!79316 (= (size!2055 (buf!2404 bitStream1!8)) (size!2055 (buf!2404 bitStream2!8))))))

(assert (=> d!30068 (= (isPrefixOf!0 bitStream1!8 bitStream2!8) e!63196)))

(declare-fun b!96529 () Bool)

(declare-fun res!79314 () Bool)

(assert (=> b!96529 (=> (not res!79314) (not e!63196))))

(assert (=> b!96529 (= res!79314 (bvsle (bitIndex!0 (size!2055 (buf!2404 bitStream1!8)) (currentByte!4792 bitStream1!8) (currentBit!4787 bitStream1!8)) (bitIndex!0 (size!2055 (buf!2404 bitStream2!8)) (currentByte!4792 bitStream2!8) (currentBit!4787 bitStream2!8))))))

(declare-fun b!96530 () Bool)

(declare-fun e!63197 () Bool)

(assert (=> b!96530 (= e!63196 e!63197)))

(declare-fun res!79315 () Bool)

(assert (=> b!96530 (=> res!79315 e!63197)))

(assert (=> b!96530 (= res!79315 (= (size!2055 (buf!2404 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!96531 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4495 array!4495 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!96531 (= e!63197 (arrayBitRangesEq!0 (buf!2404 bitStream1!8) (buf!2404 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2055 (buf!2404 bitStream1!8)) (currentByte!4792 bitStream1!8) (currentBit!4787 bitStream1!8))))))

(assert (= (and d!30068 res!79316) b!96529))

(assert (= (and b!96529 res!79314) b!96530))

(assert (= (and b!96530 (not res!79315)) b!96531))

(assert (=> b!96529 m!139767))

(assert (=> b!96529 m!139769))

(assert (=> b!96531 m!139767))

(assert (=> b!96531 m!139767))

(declare-fun m!139869 () Bool)

(assert (=> b!96531 m!139869))

(assert (=> b!96411 d!30068))

(declare-fun d!30070 () Bool)

(assert (=> d!30070 (= (array_inv!1860 (buf!2404 thiss!1534)) (bvsge (size!2055 (buf!2404 thiss!1534)) #b00000000000000000000000000000000))))

(assert (=> b!96408 d!30070))

(declare-fun d!30072 () Bool)

(declare-fun e!63198 () Bool)

(assert (=> d!30072 e!63198))

(declare-fun res!79318 () Bool)

(assert (=> d!30072 (=> (not res!79318) (not e!63198))))

(declare-fun lt!139546 () (_ BitVec 64))

(declare-fun lt!139545 () (_ BitVec 64))

(declare-fun lt!139548 () (_ BitVec 64))

(assert (=> d!30072 (= res!79318 (= lt!139545 (bvsub lt!139548 lt!139546)))))

(assert (=> d!30072 (or (= (bvand lt!139548 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139546 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!139548 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!139548 lt!139546) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30072 (= lt!139546 (remainingBits!0 ((_ sign_extend 32) (size!2055 (buf!2404 base!8))) ((_ sign_extend 32) (currentByte!4792 base!8)) ((_ sign_extend 32) (currentBit!4787 base!8))))))

(declare-fun lt!139549 () (_ BitVec 64))

(declare-fun lt!139547 () (_ BitVec 64))

(assert (=> d!30072 (= lt!139548 (bvmul lt!139549 lt!139547))))

(assert (=> d!30072 (or (= lt!139549 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!139547 (bvsdiv (bvmul lt!139549 lt!139547) lt!139549)))))

(assert (=> d!30072 (= lt!139547 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30072 (= lt!139549 ((_ sign_extend 32) (size!2055 (buf!2404 base!8))))))

(assert (=> d!30072 (= lt!139545 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4792 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4787 base!8))))))

(assert (=> d!30072 (invariant!0 (currentBit!4787 base!8) (currentByte!4792 base!8) (size!2055 (buf!2404 base!8)))))

(assert (=> d!30072 (= (bitIndex!0 (size!2055 (buf!2404 base!8)) (currentByte!4792 base!8) (currentBit!4787 base!8)) lt!139545)))

(declare-fun b!96532 () Bool)

(declare-fun res!79317 () Bool)

(assert (=> b!96532 (=> (not res!79317) (not e!63198))))

(assert (=> b!96532 (= res!79317 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!139545))))

(declare-fun b!96533 () Bool)

(declare-fun lt!139550 () (_ BitVec 64))

(assert (=> b!96533 (= e!63198 (bvsle lt!139545 (bvmul lt!139550 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!96533 (or (= lt!139550 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!139550 #b0000000000000000000000000000000000000000000000000000000000001000) lt!139550)))))

(assert (=> b!96533 (= lt!139550 ((_ sign_extend 32) (size!2055 (buf!2404 base!8))))))

(assert (= (and d!30072 res!79318) b!96532))

(assert (= (and b!96532 res!79317) b!96533))

(declare-fun m!139871 () Bool)

(assert (=> d!30072 m!139871))

(assert (=> d!30072 m!139849))

(assert (=> b!96407 d!30072))

(declare-fun d!30074 () Bool)

(assert (=> d!30074 (= (array_inv!1860 (buf!2404 bitStream2!8)) (bvsge (size!2055 (buf!2404 bitStream2!8)) #b00000000000000000000000000000000))))

(assert (=> b!96418 d!30074))

(declare-fun d!30076 () Bool)

(assert (=> d!30076 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2055 (buf!2404 bitStream2!8))) ((_ sign_extend 32) (currentByte!4792 bitStream2!8)) ((_ sign_extend 32) (currentBit!4787 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2055 (buf!2404 bitStream2!8))) ((_ sign_extend 32) (currentByte!4792 bitStream2!8)) ((_ sign_extend 32) (currentBit!4787 bitStream2!8))) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!7378 () Bool)

(assert (= bs!7378 d!30076))

(assert (=> bs!7378 m!139845))

(assert (=> b!96409 d!30076))

(declare-fun b!96536 () Bool)

(declare-fun e!63200 () Bool)

(declare-fun lt!139552 () List!901)

(assert (=> b!96536 (= e!63200 (isEmpty!267 lt!139552))))

(declare-fun b!96534 () Bool)

(declare-fun e!63199 () tuple2!7738)

(assert (=> b!96534 (= e!63199 (tuple2!7739 Nil!898 bitStream2!8))))

(declare-fun b!96537 () Bool)

(assert (=> b!96537 (= e!63200 (> (length!492 lt!139552) 0))))

(declare-fun d!30078 () Bool)

(assert (=> d!30078 e!63200))

(declare-fun c!6062 () Bool)

(assert (=> d!30078 (= c!6062 (= (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!30078 (= lt!139552 (_1!4118 e!63199))))

(declare-fun c!6063 () Bool)

(assert (=> d!30078 (= c!6063 (= (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!30078 (bvsge (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!30078 (= (bitStreamReadBitsIntoList!0 thiss!1534 bitStream2!8 (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!139552)))

(declare-fun lt!139551 () tuple2!7740)

(declare-fun b!96535 () Bool)

(declare-fun lt!139553 () (_ BitVec 64))

(assert (=> b!96535 (= e!63199 (tuple2!7739 (Cons!897 (_1!4119 lt!139551) (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4119 lt!139551) (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139553))) (_2!4119 lt!139551)))))

(assert (=> b!96535 (= lt!139551 (readBit!0 bitStream2!8))))

(assert (=> b!96535 (= lt!139553 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!30078 c!6063) b!96534))

(assert (= (and d!30078 (not c!6063)) b!96535))

(assert (= (and d!30078 c!6062) b!96536))

(assert (= (and d!30078 (not c!6062)) b!96537))

(declare-fun m!139873 () Bool)

(assert (=> b!96536 m!139873))

(declare-fun m!139875 () Bool)

(assert (=> b!96537 m!139875))

(declare-fun m!139877 () Bool)

(assert (=> b!96535 m!139877))

(declare-fun m!139879 () Bool)

(assert (=> b!96535 m!139879))

(assert (=> b!96420 d!30078))

(declare-fun d!30080 () Bool)

(assert (=> d!30080 (= (tail!377 listBits!13) (t!1651 listBits!13))))

(assert (=> b!96420 d!30080))

(declare-fun d!30082 () Bool)

(declare-fun res!79321 () Bool)

(declare-fun e!63201 () Bool)

(assert (=> d!30082 (=> (not res!79321) (not e!63201))))

(assert (=> d!30082 (= res!79321 (= (size!2055 (buf!2404 bitStream2!8)) (size!2055 (buf!2404 base!8))))))

(assert (=> d!30082 (= (isPrefixOf!0 bitStream2!8 base!8) e!63201)))

(declare-fun b!96538 () Bool)

(declare-fun res!79319 () Bool)

(assert (=> b!96538 (=> (not res!79319) (not e!63201))))

(assert (=> b!96538 (= res!79319 (bvsle (bitIndex!0 (size!2055 (buf!2404 bitStream2!8)) (currentByte!4792 bitStream2!8) (currentBit!4787 bitStream2!8)) (bitIndex!0 (size!2055 (buf!2404 base!8)) (currentByte!4792 base!8) (currentBit!4787 base!8))))))

(declare-fun b!96539 () Bool)

(declare-fun e!63202 () Bool)

(assert (=> b!96539 (= e!63201 e!63202)))

(declare-fun res!79320 () Bool)

(assert (=> b!96539 (=> res!79320 e!63202)))

(assert (=> b!96539 (= res!79320 (= (size!2055 (buf!2404 bitStream2!8)) #b00000000000000000000000000000000))))

(declare-fun b!96540 () Bool)

(assert (=> b!96540 (= e!63202 (arrayBitRangesEq!0 (buf!2404 bitStream2!8) (buf!2404 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2055 (buf!2404 bitStream2!8)) (currentByte!4792 bitStream2!8) (currentBit!4787 bitStream2!8))))))

(assert (= (and d!30082 res!79321) b!96538))

(assert (= (and b!96538 res!79319) b!96539))

(assert (= (and b!96539 (not res!79320)) b!96540))

(assert (=> b!96538 m!139769))

(assert (=> b!96538 m!139745))

(assert (=> b!96540 m!139769))

(assert (=> b!96540 m!139769))

(declare-fun m!139881 () Bool)

(assert (=> b!96540 m!139881))

(assert (=> b!96405 d!30082))

(declare-fun d!30084 () Bool)

(assert (=> d!30084 (= (array_inv!1860 (buf!2404 base!8)) (bvsge (size!2055 (buf!2404 base!8)) #b00000000000000000000000000000000))))

(assert (=> b!96416 d!30084))

(declare-fun d!30086 () Bool)

(declare-fun lt!139556 () tuple2!7740)

(assert (=> d!30086 (= lt!139556 (readBit!0 bitStream1!8))))

(assert (=> d!30086 (= (readBitPure!0 bitStream1!8) (tuple2!7729 (_2!4119 lt!139556) (_1!4119 lt!139556)))))

(declare-fun bs!7379 () Bool)

(assert (= bs!7379 d!30086))

(assert (=> bs!7379 m!139867))

(assert (=> b!96415 d!30086))

(declare-fun d!30088 () Bool)

(assert (=> d!30088 (= (head!598 listBits!13) (h!1016 listBits!13))))

(assert (=> b!96415 d!30088))

(declare-fun d!30090 () Bool)

(assert (=> d!30090 (= (array_inv!1860 (buf!2404 bitStream1!8)) (bvsge (size!2055 (buf!2404 bitStream1!8)) #b00000000000000000000000000000000))))

(assert (=> b!96417 d!30090))

(declare-fun d!30092 () Bool)

(declare-fun res!79324 () Bool)

(declare-fun e!63203 () Bool)

(assert (=> d!30092 (=> (not res!79324) (not e!63203))))

(assert (=> d!30092 (= res!79324 (= (size!2055 (buf!2404 bitStream1!8)) (size!2055 (buf!2404 base!8))))))

(assert (=> d!30092 (= (isPrefixOf!0 bitStream1!8 base!8) e!63203)))

(declare-fun b!96541 () Bool)

(declare-fun res!79322 () Bool)

(assert (=> b!96541 (=> (not res!79322) (not e!63203))))

(assert (=> b!96541 (= res!79322 (bvsle (bitIndex!0 (size!2055 (buf!2404 bitStream1!8)) (currentByte!4792 bitStream1!8) (currentBit!4787 bitStream1!8)) (bitIndex!0 (size!2055 (buf!2404 base!8)) (currentByte!4792 base!8) (currentBit!4787 base!8))))))

(declare-fun b!96542 () Bool)

(declare-fun e!63204 () Bool)

(assert (=> b!96542 (= e!63203 e!63204)))

(declare-fun res!79323 () Bool)

(assert (=> b!96542 (=> res!79323 e!63204)))

(assert (=> b!96542 (= res!79323 (= (size!2055 (buf!2404 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!96543 () Bool)

(assert (=> b!96543 (= e!63204 (arrayBitRangesEq!0 (buf!2404 bitStream1!8) (buf!2404 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2055 (buf!2404 bitStream1!8)) (currentByte!4792 bitStream1!8) (currentBit!4787 bitStream1!8))))))

(assert (= (and d!30092 res!79324) b!96541))

(assert (= (and b!96541 res!79322) b!96542))

(assert (= (and b!96542 (not res!79323)) b!96543))

(assert (=> b!96541 m!139767))

(assert (=> b!96541 m!139745))

(assert (=> b!96543 m!139767))

(assert (=> b!96543 m!139767))

(declare-fun m!139883 () Bool)

(assert (=> b!96543 m!139883))

(assert (=> b!96406 d!30092))

(push 1)

(assert (not d!30040))

(assert (not b!96529))

(assert (not d!30076))

(assert (not b!96541))

(assert (not b!96540))

(assert (not b!96520))

(assert (not b!96535))

(assert (not b!96543))

(assert (not b!96521))

(assert (not d!30034))

(assert (not d!30086))

(assert (not b!96537))

(assert (not b!96536))

(assert (not d!30072))

(assert (not d!30066))

(assert (not d!30036))

(assert (not d!30008))

(assert (not d!30002))

(assert (not b!96531))

(assert (not b!96538))

(assert (not b!96522))

(assert (not d!30042))

(assert (not d!30038))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!30188 () Bool)

(assert (=> d!30188 (= (isEmpty!267 lt!139552) (is-Nil!898 lt!139552))))

(assert (=> b!96536 d!30188))

(declare-fun d!30190 () Bool)

(assert (=> d!30190 (= (invariant!0 (currentBit!4787 base!8) (currentByte!4792 base!8) (size!2055 (buf!2404 base!8))) (and (bvsge (currentBit!4787 base!8) #b00000000000000000000000000000000) (bvslt (currentBit!4787 base!8) #b00000000000000000000000000001000) (bvsge (currentByte!4792 base!8) #b00000000000000000000000000000000) (or (bvslt (currentByte!4792 base!8) (size!2055 (buf!2404 base!8))) (and (= (currentBit!4787 base!8) #b00000000000000000000000000000000) (= (currentByte!4792 base!8) (size!2055 (buf!2404 base!8)))))))))

(assert (=> d!30040 d!30190))

(declare-fun d!30192 () Bool)

(assert (=> d!30192 (= (length!492 lt!139552) (size!2058 lt!139552))))

(declare-fun bs!7392 () Bool)

(assert (= bs!7392 d!30192))

(declare-fun m!140077 () Bool)

(assert (=> bs!7392 m!140077))

(assert (=> b!96537 d!30192))

(assert (=> b!96529 d!30008))

(assert (=> b!96529 d!30034))

(declare-fun d!30194 () Bool)

(assert (=> d!30194 (= (remainingBits!0 ((_ sign_extend 32) (size!2055 (buf!2404 bitStream1!8))) ((_ sign_extend 32) (currentByte!4792 bitStream1!8)) ((_ sign_extend 32) (currentBit!4787 bitStream1!8))) (bvsub (bvmul ((_ sign_extend 32) (size!2055 (buf!2404 bitStream1!8))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4792 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4787 bitStream1!8)))))))

(assert (=> d!30008 d!30194))

(declare-fun d!30196 () Bool)

(assert (=> d!30196 (= (invariant!0 (currentBit!4787 bitStream1!8) (currentByte!4792 bitStream1!8) (size!2055 (buf!2404 bitStream1!8))) (and (bvsge (currentBit!4787 bitStream1!8) #b00000000000000000000000000000000) (bvslt (currentBit!4787 bitStream1!8) #b00000000000000000000000000001000) (bvsge (currentByte!4792 bitStream1!8) #b00000000000000000000000000000000) (or (bvslt (currentByte!4792 bitStream1!8) (size!2055 (buf!2404 bitStream1!8))) (and (= (currentBit!4787 bitStream1!8) #b00000000000000000000000000000000) (= (currentByte!4792 bitStream1!8) (size!2055 (buf!2404 bitStream1!8)))))))))

(assert (=> d!30008 d!30196))

(declare-fun b!96637 () Bool)

(declare-fun e!63276 () Bool)

(declare-fun lt!139665 () List!901)

(assert (=> b!96637 (= e!63276 (isEmpty!267 lt!139665))))

(declare-fun b!96635 () Bool)

(declare-fun e!63275 () tuple2!7738)

(assert (=> b!96635 (= e!63275 (tuple2!7739 Nil!898 (_2!4119 lt!139551)))))

(declare-fun b!96638 () Bool)

(assert (=> b!96638 (= e!63276 (> (length!492 lt!139665) 0))))

(declare-fun d!30198 () Bool)

(assert (=> d!30198 e!63276))

(declare-fun c!6083 () Bool)

(assert (=> d!30198 (= c!6083 (= (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139553) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!30198 (= lt!139665 (_1!4118 e!63275))))

(declare-fun c!6084 () Bool)

(assert (=> d!30198 (= c!6084 (= (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139553) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!30198 (bvsge (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139553) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!30198 (= (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4119 lt!139551) (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139553)) lt!139665)))

(declare-fun lt!139664 () tuple2!7740)

(declare-fun b!96636 () Bool)

(declare-fun lt!139666 () (_ BitVec 64))

(assert (=> b!96636 (= e!63275 (tuple2!7739 (Cons!897 (_1!4119 lt!139664) (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4119 lt!139664) (bvsub (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139553) lt!139666))) (_2!4119 lt!139664)))))

(assert (=> b!96636 (= lt!139664 (readBit!0 (_2!4119 lt!139551)))))

(assert (=> b!96636 (= lt!139666 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!30198 c!6084) b!96635))

(assert (= (and d!30198 (not c!6084)) b!96636))

(assert (= (and d!30198 c!6083) b!96637))

(assert (= (and d!30198 (not c!6083)) b!96638))

(declare-fun m!140079 () Bool)

(assert (=> b!96637 m!140079))

(declare-fun m!140081 () Bool)

(assert (=> b!96638 m!140081))

(declare-fun m!140083 () Bool)

(assert (=> b!96636 m!140083))

(declare-fun m!140085 () Bool)

(assert (=> b!96636 m!140085))

(assert (=> b!96535 d!30198))

(declare-fun d!30200 () Bool)

(declare-fun e!63283 () Bool)

(assert (=> d!30200 e!63283))

(declare-fun res!79380 () Bool)

(assert (=> d!30200 (=> (not res!79380) (not e!63283))))

(declare-datatypes ((Unit!5858 0))(
  ( (Unit!5859) )
))
(declare-datatypes ((tuple2!7744 0))(
  ( (tuple2!7745 (_1!4122 Unit!5858) (_2!4122 BitStream!3590)) )
))
(declare-fun increaseBitIndex!0 (BitStream!3590) tuple2!7744)

(assert (=> d!30200 (= res!79380 (= (buf!2404 (_2!4122 (increaseBitIndex!0 bitStream2!8))) (buf!2404 bitStream2!8)))))

(declare-fun lt!139684 () Bool)

(assert (=> d!30200 (= lt!139684 (not (= (bvand ((_ sign_extend 24) (select (arr!2651 (buf!2404 bitStream2!8)) (currentByte!4792 bitStream2!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4787 bitStream2!8)))) #b00000000000000000000000000000000)))))

(declare-fun lt!139683 () tuple2!7740)

(assert (=> d!30200 (= lt!139683 (tuple2!7741 (not (= (bvand ((_ sign_extend 24) (select (arr!2651 (buf!2404 bitStream2!8)) (currentByte!4792 bitStream2!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4787 bitStream2!8)))) #b00000000000000000000000000000000)) (_2!4122 (increaseBitIndex!0 bitStream2!8))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!30200 (validate_offset_bit!0 ((_ sign_extend 32) (size!2055 (buf!2404 bitStream2!8))) ((_ sign_extend 32) (currentByte!4792 bitStream2!8)) ((_ sign_extend 32) (currentBit!4787 bitStream2!8)))))

(assert (=> d!30200 (= (readBit!0 bitStream2!8) lt!139683)))

(declare-fun b!96641 () Bool)

(declare-fun lt!139682 () (_ BitVec 64))

(declare-fun lt!139687 () (_ BitVec 64))

(assert (=> b!96641 (= e!63283 (= (bitIndex!0 (size!2055 (buf!2404 (_2!4122 (increaseBitIndex!0 bitStream2!8)))) (currentByte!4792 (_2!4122 (increaseBitIndex!0 bitStream2!8))) (currentBit!4787 (_2!4122 (increaseBitIndex!0 bitStream2!8)))) (bvadd lt!139687 lt!139682)))))

(assert (=> b!96641 (or (not (= (bvand lt!139687 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139682 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!139687 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!139687 lt!139682) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!96641 (= lt!139682 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!96641 (= lt!139687 (bitIndex!0 (size!2055 (buf!2404 bitStream2!8)) (currentByte!4792 bitStream2!8) (currentBit!4787 bitStream2!8)))))

(declare-fun lt!139686 () Bool)

(assert (=> b!96641 (= lt!139686 (not (= (bvand ((_ sign_extend 24) (select (arr!2651 (buf!2404 bitStream2!8)) (currentByte!4792 bitStream2!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4787 bitStream2!8)))) #b00000000000000000000000000000000)))))

(declare-fun lt!139681 () Bool)

(assert (=> b!96641 (= lt!139681 (not (= (bvand ((_ sign_extend 24) (select (arr!2651 (buf!2404 bitStream2!8)) (currentByte!4792 bitStream2!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4787 bitStream2!8)))) #b00000000000000000000000000000000)))))

(declare-fun lt!139685 () Bool)

(assert (=> b!96641 (= lt!139685 (not (= (bvand ((_ sign_extend 24) (select (arr!2651 (buf!2404 bitStream2!8)) (currentByte!4792 bitStream2!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4787 bitStream2!8)))) #b00000000000000000000000000000000)))))

(assert (= (and d!30200 res!79380) b!96641))

(declare-fun m!140087 () Bool)

(assert (=> d!30200 m!140087))

(declare-fun m!140089 () Bool)

(assert (=> d!30200 m!140089))

(declare-fun m!140091 () Bool)

(assert (=> d!30200 m!140091))

(declare-fun m!140093 () Bool)

(assert (=> d!30200 m!140093))

(assert (=> b!96641 m!140087))

(assert (=> b!96641 m!140089))

(assert (=> b!96641 m!140091))

(assert (=> b!96641 m!139769))

(declare-fun m!140095 () Bool)

(assert (=> b!96641 m!140095))

(assert (=> b!96535 d!30200))

(declare-fun lt!139695 () (_ BitVec 32))

(declare-fun call!1177 () Bool)

(declare-datatypes ((tuple4!58 0))(
  ( (tuple4!59 (_1!4123 (_ BitVec 32)) (_2!4123 (_ BitVec 32)) (_3!250 (_ BitVec 32)) (_4!29 (_ BitVec 32))) )
))
(declare-fun lt!139696 () tuple4!58)

(declare-fun bm!1174 () Bool)

(declare-fun lt!139694 () (_ BitVec 32))

(declare-fun c!6087 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!1174 (= call!1177 (byteRangesEq!0 (select (arr!2651 (buf!2404 bitStream2!8)) (_3!250 lt!139696)) (select (arr!2651 (buf!2404 base!8)) (_3!250 lt!139696)) lt!139695 (ite c!6087 lt!139694 #b00000000000000000000000000001000)))))

(declare-fun b!96656 () Bool)

(declare-fun e!63300 () Bool)

(assert (=> b!96656 (= e!63300 call!1177)))

(declare-fun b!96657 () Bool)

(declare-fun e!63296 () Bool)

(assert (=> b!96657 (= e!63296 (byteRangesEq!0 (select (arr!2651 (buf!2404 bitStream2!8)) (_4!29 lt!139696)) (select (arr!2651 (buf!2404 base!8)) (_4!29 lt!139696)) #b00000000000000000000000000000000 lt!139694))))

(declare-fun e!63298 () Bool)

(declare-fun b!96658 () Bool)

(declare-fun arrayRangesEq!30 (array!4495 array!4495 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!96658 (= e!63298 (arrayRangesEq!30 (buf!2404 bitStream2!8) (buf!2404 base!8) (_1!4123 lt!139696) (_2!4123 lt!139696)))))

(declare-fun b!96659 () Bool)

(declare-fun e!63297 () Bool)

(assert (=> b!96659 (= e!63297 e!63300)))

(assert (=> b!96659 (= c!6087 (= (_3!250 lt!139696) (_4!29 lt!139696)))))

(declare-fun d!30202 () Bool)

(declare-fun res!79395 () Bool)

(declare-fun e!63299 () Bool)

(assert (=> d!30202 (=> res!79395 e!63299)))

(assert (=> d!30202 (= res!79395 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2055 (buf!2404 bitStream2!8)) (currentByte!4792 bitStream2!8) (currentBit!4787 bitStream2!8))))))

(assert (=> d!30202 (= (arrayBitRangesEq!0 (buf!2404 bitStream2!8) (buf!2404 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2055 (buf!2404 bitStream2!8)) (currentByte!4792 bitStream2!8) (currentBit!4787 bitStream2!8))) e!63299)))

(declare-fun b!96660 () Bool)

(assert (=> b!96660 (= e!63299 e!63297)))

(declare-fun res!79392 () Bool)

(assert (=> b!96660 (=> (not res!79392) (not e!63297))))

(assert (=> b!96660 (= res!79392 e!63298)))

(declare-fun res!79394 () Bool)

(assert (=> b!96660 (=> res!79394 e!63298)))

(assert (=> b!96660 (= res!79394 (bvsge (_1!4123 lt!139696) (_2!4123 lt!139696)))))

(assert (=> b!96660 (= lt!139694 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2055 (buf!2404 bitStream2!8)) (currentByte!4792 bitStream2!8) (currentBit!4787 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!96660 (= lt!139695 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!58)

(assert (=> b!96660 (= lt!139696 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2055 (buf!2404 bitStream2!8)) (currentByte!4792 bitStream2!8) (currentBit!4787 bitStream2!8))))))

(declare-fun b!96661 () Bool)

(declare-fun res!79391 () Bool)

(assert (=> b!96661 (= res!79391 (= lt!139694 #b00000000000000000000000000000000))))

(assert (=> b!96661 (=> res!79391 e!63296)))

(declare-fun e!63301 () Bool)

(assert (=> b!96661 (= e!63301 e!63296)))

(declare-fun b!96662 () Bool)

(assert (=> b!96662 (= e!63300 e!63301)))

(declare-fun res!79393 () Bool)

(assert (=> b!96662 (= res!79393 call!1177)))

(assert (=> b!96662 (=> (not res!79393) (not e!63301))))

(assert (= (and d!30202 (not res!79395)) b!96660))

(assert (= (and b!96660 (not res!79394)) b!96658))

(assert (= (and b!96660 res!79392) b!96659))

(assert (= (and b!96659 c!6087) b!96656))

(assert (= (and b!96659 (not c!6087)) b!96662))

(assert (= (and b!96662 res!79393) b!96661))

(assert (= (and b!96661 (not res!79391)) b!96657))

(assert (= (or b!96656 b!96662) bm!1174))

(declare-fun m!140097 () Bool)

(assert (=> bm!1174 m!140097))

(declare-fun m!140099 () Bool)

(assert (=> bm!1174 m!140099))

(assert (=> bm!1174 m!140097))

(assert (=> bm!1174 m!140099))

(declare-fun m!140101 () Bool)

(assert (=> bm!1174 m!140101))

(declare-fun m!140103 () Bool)

(assert (=> b!96657 m!140103))

(declare-fun m!140105 () Bool)

(assert (=> b!96657 m!140105))

(assert (=> b!96657 m!140103))

(assert (=> b!96657 m!140105))

(declare-fun m!140107 () Bool)

(assert (=> b!96657 m!140107))

(declare-fun m!140109 () Bool)

(assert (=> b!96658 m!140109))

(assert (=> b!96660 m!139769))

(declare-fun m!140111 () Bool)

(assert (=> b!96660 m!140111))

(assert (=> b!96540 d!30202))

(assert (=> b!96540 d!30034))

(declare-fun lt!139699 () tuple4!58)

(declare-fun bm!1175 () Bool)

(declare-fun call!1178 () Bool)

(declare-fun lt!139697 () (_ BitVec 32))

(declare-fun c!6088 () Bool)

(declare-fun lt!139698 () (_ BitVec 32))

(assert (=> bm!1175 (= call!1178 (byteRangesEq!0 (select (arr!2651 (buf!2404 bitStream1!8)) (_3!250 lt!139699)) (select (arr!2651 (buf!2404 bitStream2!8)) (_3!250 lt!139699)) lt!139698 (ite c!6088 lt!139697 #b00000000000000000000000000001000)))))

(declare-fun b!96663 () Bool)

(declare-fun e!63306 () Bool)

(assert (=> b!96663 (= e!63306 call!1178)))

(declare-fun e!63302 () Bool)

(declare-fun b!96664 () Bool)

(assert (=> b!96664 (= e!63302 (byteRangesEq!0 (select (arr!2651 (buf!2404 bitStream1!8)) (_4!29 lt!139699)) (select (arr!2651 (buf!2404 bitStream2!8)) (_4!29 lt!139699)) #b00000000000000000000000000000000 lt!139697))))

(declare-fun e!63304 () Bool)

(declare-fun b!96665 () Bool)

(assert (=> b!96665 (= e!63304 (arrayRangesEq!30 (buf!2404 bitStream1!8) (buf!2404 bitStream2!8) (_1!4123 lt!139699) (_2!4123 lt!139699)))))

(declare-fun b!96666 () Bool)

(declare-fun e!63303 () Bool)

(assert (=> b!96666 (= e!63303 e!63306)))

(assert (=> b!96666 (= c!6088 (= (_3!250 lt!139699) (_4!29 lt!139699)))))

(declare-fun d!30204 () Bool)

(declare-fun res!79400 () Bool)

(declare-fun e!63305 () Bool)

(assert (=> d!30204 (=> res!79400 e!63305)))

(assert (=> d!30204 (= res!79400 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2055 (buf!2404 bitStream1!8)) (currentByte!4792 bitStream1!8) (currentBit!4787 bitStream1!8))))))

(assert (=> d!30204 (= (arrayBitRangesEq!0 (buf!2404 bitStream1!8) (buf!2404 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2055 (buf!2404 bitStream1!8)) (currentByte!4792 bitStream1!8) (currentBit!4787 bitStream1!8))) e!63305)))

(declare-fun b!96667 () Bool)

(assert (=> b!96667 (= e!63305 e!63303)))

(declare-fun res!79397 () Bool)

(assert (=> b!96667 (=> (not res!79397) (not e!63303))))

(assert (=> b!96667 (= res!79397 e!63304)))

(declare-fun res!79399 () Bool)

(assert (=> b!96667 (=> res!79399 e!63304)))

(assert (=> b!96667 (= res!79399 (bvsge (_1!4123 lt!139699) (_2!4123 lt!139699)))))

(assert (=> b!96667 (= lt!139697 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2055 (buf!2404 bitStream1!8)) (currentByte!4792 bitStream1!8) (currentBit!4787 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!96667 (= lt!139698 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!96667 (= lt!139699 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2055 (buf!2404 bitStream1!8)) (currentByte!4792 bitStream1!8) (currentBit!4787 bitStream1!8))))))

(declare-fun b!96668 () Bool)

(declare-fun res!79396 () Bool)

(assert (=> b!96668 (= res!79396 (= lt!139697 #b00000000000000000000000000000000))))

(assert (=> b!96668 (=> res!79396 e!63302)))

(declare-fun e!63307 () Bool)

(assert (=> b!96668 (= e!63307 e!63302)))

(declare-fun b!96669 () Bool)

(assert (=> b!96669 (= e!63306 e!63307)))

(declare-fun res!79398 () Bool)

(assert (=> b!96669 (= res!79398 call!1178)))

(assert (=> b!96669 (=> (not res!79398) (not e!63307))))

(assert (= (and d!30204 (not res!79400)) b!96667))

(assert (= (and b!96667 (not res!79399)) b!96665))

(assert (= (and b!96667 res!79397) b!96666))

(assert (= (and b!96666 c!6088) b!96663))

(assert (= (and b!96666 (not c!6088)) b!96669))

(assert (= (and b!96669 res!79398) b!96668))

(assert (= (and b!96668 (not res!79396)) b!96664))

(assert (= (or b!96663 b!96669) bm!1175))

(declare-fun m!140113 () Bool)

(assert (=> bm!1175 m!140113))

(declare-fun m!140115 () Bool)

(assert (=> bm!1175 m!140115))

(assert (=> bm!1175 m!140113))

(assert (=> bm!1175 m!140115))

(declare-fun m!140117 () Bool)

(assert (=> bm!1175 m!140117))

(declare-fun m!140119 () Bool)

(assert (=> b!96664 m!140119))

(declare-fun m!140121 () Bool)

(assert (=> b!96664 m!140121))

(assert (=> b!96664 m!140119))

(assert (=> b!96664 m!140121))

(declare-fun m!140123 () Bool)

(assert (=> b!96664 m!140123))

(declare-fun m!140125 () Bool)

(assert (=> b!96665 m!140125))

(assert (=> b!96667 m!139767))

(declare-fun m!140127 () Bool)

(assert (=> b!96667 m!140127))

(assert (=> b!96531 d!30204))

(assert (=> b!96531 d!30008))

(assert (=> d!30066 d!30194))

(declare-fun d!30206 () Bool)

(assert (=> d!30206 (= (invariant!0 (currentBit!4787 thiss!1534) (currentByte!4792 thiss!1534) (size!2055 (buf!2404 thiss!1534))) (and (bvsge (currentBit!4787 thiss!1534) #b00000000000000000000000000000000) (bvslt (currentBit!4787 thiss!1534) #b00000000000000000000000000001000) (bvsge (currentByte!4792 thiss!1534) #b00000000000000000000000000000000) (or (bvslt (currentByte!4792 thiss!1534) (size!2055 (buf!2404 thiss!1534))) (and (= (currentBit!4787 thiss!1534) #b00000000000000000000000000000000) (= (currentByte!4792 thiss!1534) (size!2055 (buf!2404 thiss!1534)))))))))

(assert (=> d!30042 d!30206))

(assert (=> b!96538 d!30034))

(assert (=> b!96538 d!30072))

(declare-fun d!30208 () Bool)

(assert (=> d!30208 (= (isEmpty!267 lt!139543) (is-Nil!898 lt!139543))))

(assert (=> b!96521 d!30208))

(declare-fun d!30210 () Bool)

(assert (=> d!30210 (= (length!492 lt!139543) (size!2058 lt!139543))))

(declare-fun bs!7393 () Bool)

(assert (= bs!7393 d!30210))

(declare-fun m!140129 () Bool)

(assert (=> bs!7393 m!140129))

(assert (=> b!96522 d!30210))

(assert (=> d!30036 d!30196))

(declare-fun d!30212 () Bool)

(assert (=> d!30212 (= (remainingBits!0 ((_ sign_extend 32) (size!2055 (buf!2404 base!8))) ((_ sign_extend 32) (currentByte!4792 base!8)) ((_ sign_extend 32) (currentBit!4787 base!8))) (bvsub (bvmul ((_ sign_extend 32) (size!2055 (buf!2404 base!8))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4792 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4787 base!8)))))))

(assert (=> d!30072 d!30212))

(assert (=> d!30072 d!30190))

(declare-fun d!30214 () Bool)

(declare-fun e!63308 () Bool)

(assert (=> d!30214 e!63308))

(declare-fun res!79401 () Bool)

(assert (=> d!30214 (=> (not res!79401) (not e!63308))))

(assert (=> d!30214 (= res!79401 (= (buf!2404 (_2!4122 (increaseBitIndex!0 bitStream1!8))) (buf!2404 bitStream1!8)))))

(declare-fun lt!139703 () Bool)

(assert (=> d!30214 (= lt!139703 (not (= (bvand ((_ sign_extend 24) (select (arr!2651 (buf!2404 bitStream1!8)) (currentByte!4792 bitStream1!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4787 bitStream1!8)))) #b00000000000000000000000000000000)))))

(declare-fun lt!139702 () tuple2!7740)

(assert (=> d!30214 (= lt!139702 (tuple2!7741 (not (= (bvand ((_ sign_extend 24) (select (arr!2651 (buf!2404 bitStream1!8)) (currentByte!4792 bitStream1!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4787 bitStream1!8)))) #b00000000000000000000000000000000)) (_2!4122 (increaseBitIndex!0 bitStream1!8))))))

(assert (=> d!30214 (validate_offset_bit!0 ((_ sign_extend 32) (size!2055 (buf!2404 bitStream1!8))) ((_ sign_extend 32) (currentByte!4792 bitStream1!8)) ((_ sign_extend 32) (currentBit!4787 bitStream1!8)))))

(assert (=> d!30214 (= (readBit!0 bitStream1!8) lt!139702)))

(declare-fun lt!139701 () (_ BitVec 64))

(declare-fun b!96670 () Bool)

(declare-fun lt!139706 () (_ BitVec 64))

(assert (=> b!96670 (= e!63308 (= (bitIndex!0 (size!2055 (buf!2404 (_2!4122 (increaseBitIndex!0 bitStream1!8)))) (currentByte!4792 (_2!4122 (increaseBitIndex!0 bitStream1!8))) (currentBit!4787 (_2!4122 (increaseBitIndex!0 bitStream1!8)))) (bvadd lt!139706 lt!139701)))))

(assert (=> b!96670 (or (not (= (bvand lt!139706 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139701 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!139706 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!139706 lt!139701) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!96670 (= lt!139701 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!96670 (= lt!139706 (bitIndex!0 (size!2055 (buf!2404 bitStream1!8)) (currentByte!4792 bitStream1!8) (currentBit!4787 bitStream1!8)))))

(declare-fun lt!139705 () Bool)

(assert (=> b!96670 (= lt!139705 (not (= (bvand ((_ sign_extend 24) (select (arr!2651 (buf!2404 bitStream1!8)) (currentByte!4792 bitStream1!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4787 bitStream1!8)))) #b00000000000000000000000000000000)))))

(declare-fun lt!139700 () Bool)

(assert (=> b!96670 (= lt!139700 (not (= (bvand ((_ sign_extend 24) (select (arr!2651 (buf!2404 bitStream1!8)) (currentByte!4792 bitStream1!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4787 bitStream1!8)))) #b00000000000000000000000000000000)))))

(declare-fun lt!139704 () Bool)

(assert (=> b!96670 (= lt!139704 (not (= (bvand ((_ sign_extend 24) (select (arr!2651 (buf!2404 bitStream1!8)) (currentByte!4792 bitStream1!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4787 bitStream1!8)))) #b00000000000000000000000000000000)))))

(assert (= (and d!30214 res!79401) b!96670))

(declare-fun m!140131 () Bool)

(assert (=> d!30214 m!140131))

(declare-fun m!140133 () Bool)

(assert (=> d!30214 m!140133))

(declare-fun m!140135 () Bool)

(assert (=> d!30214 m!140135))

(declare-fun m!140137 () Bool)

(assert (=> d!30214 m!140137))

(assert (=> b!96670 m!140131))

(assert (=> b!96670 m!140133))

(assert (=> b!96670 m!140135))

(assert (=> b!96670 m!139767))

(declare-fun m!140139 () Bool)

(assert (=> b!96670 m!140139))

(assert (=> d!30086 d!30214))

(declare-fun d!30216 () Bool)

(assert (=> d!30216 (= (remainingBits!0 ((_ sign_extend 32) (size!2055 (buf!2404 bitStream2!8))) ((_ sign_extend 32) (currentByte!4792 bitStream2!8)) ((_ sign_extend 32) (currentBit!4787 bitStream2!8))) (bvsub (bvmul ((_ sign_extend 32) (size!2055 (buf!2404 bitStream2!8))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4792 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4787 bitStream2!8)))))))

(assert (=> d!30076 d!30216))

(declare-fun b!96673 () Bool)

(declare-fun e!63310 () Bool)

(declare-fun lt!139708 () List!901)

(assert (=> b!96673 (= e!63310 (isEmpty!267 lt!139708))))

(declare-fun b!96671 () Bool)

(declare-fun e!63309 () tuple2!7738)

(assert (=> b!96671 (= e!63309 (tuple2!7739 Nil!898 (_2!4119 lt!139542)))))

(declare-fun b!96674 () Bool)

(assert (=> b!96674 (= e!63310 (> (length!492 lt!139708) 0))))

(declare-fun d!30218 () Bool)

(assert (=> d!30218 e!63310))

(declare-fun c!6089 () Bool)

(assert (=> d!30218 (= c!6089 (= (bvsub nBits!484 lt!139544) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!30218 (= lt!139708 (_1!4118 e!63309))))

(declare-fun c!6090 () Bool)

(assert (=> d!30218 (= c!6090 (= (bvsub nBits!484 lt!139544) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!30218 (bvsge (bvsub nBits!484 lt!139544) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!30218 (= (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4119 lt!139542) (bvsub nBits!484 lt!139544)) lt!139708)))

(declare-fun b!96672 () Bool)

(declare-fun lt!139709 () (_ BitVec 64))

(declare-fun lt!139707 () tuple2!7740)

(assert (=> b!96672 (= e!63309 (tuple2!7739 (Cons!897 (_1!4119 lt!139707) (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4119 lt!139707) (bvsub (bvsub nBits!484 lt!139544) lt!139709))) (_2!4119 lt!139707)))))

(assert (=> b!96672 (= lt!139707 (readBit!0 (_2!4119 lt!139542)))))

(assert (=> b!96672 (= lt!139709 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!30218 c!6090) b!96671))

(assert (= (and d!30218 (not c!6090)) b!96672))

(assert (= (and d!30218 c!6089) b!96673))

(assert (= (and d!30218 (not c!6089)) b!96674))

(declare-fun m!140141 () Bool)

(assert (=> b!96673 m!140141))

(declare-fun m!140143 () Bool)

(assert (=> b!96674 m!140143))

(declare-fun m!140145 () Bool)

(assert (=> b!96672 m!140145))

(declare-fun m!140147 () Bool)

(assert (=> b!96672 m!140147))

(assert (=> b!96520 d!30218))

(assert (=> b!96520 d!30214))

(declare-fun call!1179 () Bool)

(declare-fun lt!139711 () (_ BitVec 32))

(declare-fun lt!139712 () tuple4!58)

(declare-fun lt!139710 () (_ BitVec 32))

(declare-fun c!6091 () Bool)

(declare-fun bm!1176 () Bool)

(assert (=> bm!1176 (= call!1179 (byteRangesEq!0 (select (arr!2651 (buf!2404 bitStream1!8)) (_3!250 lt!139712)) (select (arr!2651 (buf!2404 base!8)) (_3!250 lt!139712)) lt!139711 (ite c!6091 lt!139710 #b00000000000000000000000000001000)))))

(declare-fun b!96675 () Bool)

(declare-fun e!63315 () Bool)

(assert (=> b!96675 (= e!63315 call!1179)))

(declare-fun e!63311 () Bool)

(declare-fun b!96676 () Bool)

(assert (=> b!96676 (= e!63311 (byteRangesEq!0 (select (arr!2651 (buf!2404 bitStream1!8)) (_4!29 lt!139712)) (select (arr!2651 (buf!2404 base!8)) (_4!29 lt!139712)) #b00000000000000000000000000000000 lt!139710))))

(declare-fun b!96677 () Bool)

(declare-fun e!63313 () Bool)

(assert (=> b!96677 (= e!63313 (arrayRangesEq!30 (buf!2404 bitStream1!8) (buf!2404 base!8) (_1!4123 lt!139712) (_2!4123 lt!139712)))))

(declare-fun b!96678 () Bool)

(declare-fun e!63312 () Bool)

(assert (=> b!96678 (= e!63312 e!63315)))

(assert (=> b!96678 (= c!6091 (= (_3!250 lt!139712) (_4!29 lt!139712)))))

(declare-fun d!30220 () Bool)

(declare-fun res!79406 () Bool)

(declare-fun e!63314 () Bool)

(assert (=> d!30220 (=> res!79406 e!63314)))

(assert (=> d!30220 (= res!79406 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2055 (buf!2404 bitStream1!8)) (currentByte!4792 bitStream1!8) (currentBit!4787 bitStream1!8))))))

(assert (=> d!30220 (= (arrayBitRangesEq!0 (buf!2404 bitStream1!8) (buf!2404 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2055 (buf!2404 bitStream1!8)) (currentByte!4792 bitStream1!8) (currentBit!4787 bitStream1!8))) e!63314)))

(declare-fun b!96679 () Bool)

(assert (=> b!96679 (= e!63314 e!63312)))

(declare-fun res!79403 () Bool)

(assert (=> b!96679 (=> (not res!79403) (not e!63312))))

(assert (=> b!96679 (= res!79403 e!63313)))

(declare-fun res!79405 () Bool)

(assert (=> b!96679 (=> res!79405 e!63313)))

(assert (=> b!96679 (= res!79405 (bvsge (_1!4123 lt!139712) (_2!4123 lt!139712)))))

(assert (=> b!96679 (= lt!139710 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2055 (buf!2404 bitStream1!8)) (currentByte!4792 bitStream1!8) (currentBit!4787 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!96679 (= lt!139711 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!96679 (= lt!139712 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2055 (buf!2404 bitStream1!8)) (currentByte!4792 bitStream1!8) (currentBit!4787 bitStream1!8))))))

(declare-fun b!96680 () Bool)

(declare-fun res!79402 () Bool)

(assert (=> b!96680 (= res!79402 (= lt!139710 #b00000000000000000000000000000000))))

(assert (=> b!96680 (=> res!79402 e!63311)))

(declare-fun e!63316 () Bool)

(assert (=> b!96680 (= e!63316 e!63311)))

(declare-fun b!96681 () Bool)

(assert (=> b!96681 (= e!63315 e!63316)))

(declare-fun res!79404 () Bool)

(assert (=> b!96681 (= res!79404 call!1179)))

(assert (=> b!96681 (=> (not res!79404) (not e!63316))))

(assert (= (and d!30220 (not res!79406)) b!96679))

(assert (= (and b!96679 (not res!79405)) b!96677))

(assert (= (and b!96679 res!79403) b!96678))

(assert (= (and b!96678 c!6091) b!96675))

(assert (= (and b!96678 (not c!6091)) b!96681))

(assert (= (and b!96681 res!79404) b!96680))

(assert (= (and b!96680 (not res!79402)) b!96676))

(assert (= (or b!96675 b!96681) bm!1176))

(declare-fun m!140149 () Bool)

(assert (=> bm!1176 m!140149))

(declare-fun m!140151 () Bool)

(assert (=> bm!1176 m!140151))

(assert (=> bm!1176 m!140149))

(assert (=> bm!1176 m!140151))

(declare-fun m!140153 () Bool)

(assert (=> bm!1176 m!140153))

(declare-fun m!140155 () Bool)

(assert (=> b!96676 m!140155))

(declare-fun m!140157 () Bool)

(assert (=> b!96676 m!140157))

(assert (=> b!96676 m!140155))

(assert (=> b!96676 m!140157))

(declare-fun m!140159 () Bool)

(assert (=> b!96676 m!140159))

(declare-fun m!140161 () Bool)

(assert (=> b!96677 m!140161))

(assert (=> b!96679 m!139767))

(assert (=> b!96679 m!140127))

(assert (=> b!96543 d!30220))

(assert (=> b!96543 d!30008))

(assert (=> d!30034 d!30216))

(declare-fun d!30222 () Bool)

(assert (=> d!30222 (= (invariant!0 (currentBit!4787 bitStream2!8) (currentByte!4792 bitStream2!8) (size!2055 (buf!2404 bitStream2!8))) (and (bvsge (currentBit!4787 bitStream2!8) #b00000000000000000000000000000000) (bvslt (currentBit!4787 bitStream2!8) #b00000000000000000000000000001000) (bvsge (currentByte!4792 bitStream2!8) #b00000000000000000000000000000000) (or (bvslt (currentByte!4792 bitStream2!8) (size!2055 (buf!2404 bitStream2!8))) (and (= (currentBit!4787 bitStream2!8) #b00000000000000000000000000000000) (= (currentByte!4792 bitStream2!8) (size!2055 (buf!2404 bitStream2!8)))))))))

(assert (=> d!30034 d!30222))

(declare-fun d!30224 () Bool)

(declare-fun lt!139715 () Int)

(assert (=> d!30224 (>= lt!139715 0)))

(declare-fun e!63319 () Int)

(assert (=> d!30224 (= lt!139715 e!63319)))

(declare-fun c!6094 () Bool)

(assert (=> d!30224 (= c!6094 (is-Nil!898 listBits!13))))

(assert (=> d!30224 (= (size!2058 listBits!13) lt!139715)))

(declare-fun b!96686 () Bool)

(assert (=> b!96686 (= e!63319 0)))

(declare-fun b!96687 () Bool)

(assert (=> b!96687 (= e!63319 (+ 1 (size!2058 (t!1651 listBits!13))))))

(assert (= (and d!30224 c!6094) b!96686))

(assert (= (and d!30224 (not c!6094)) b!96687))

(declare-fun m!140163 () Bool)

(assert (=> b!96687 m!140163))

(assert (=> d!30002 d!30224))

(assert (=> d!30038 d!30222))

(assert (=> b!96541 d!30008))

(assert (=> b!96541 d!30072))

(push 1)

(assert (not b!96638))

(assert (not b!96676))

(assert (not b!96667))

(assert (not b!96664))

(assert (not b!96636))

(assert (not b!96672))

(assert (not bm!1175))

(assert (not d!30192))

(assert (not b!96657))

(assert (not b!96670))

(assert (not b!96679))

(assert (not d!30214))

(assert (not b!96687))

(assert (not bm!1176))

(assert (not d!30200))

(assert (not b!96665))

(assert (not b!96641))

(assert (not bm!1174))

(assert (not b!96674))

(assert (not b!96660))

(assert (not b!96637))

(assert (not b!96677))

(assert (not b!96673))

(assert (not d!30210))

(assert (not b!96658))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!30226 () Bool)

(assert (=> d!30226 (= (isEmpty!267 lt!139665) (is-Nil!898 lt!139665))))

(assert (=> b!96637 d!30226))

(declare-fun d!30228 () Bool)

(declare-fun e!63322 () Bool)

(assert (=> d!30228 e!63322))

(declare-fun res!79412 () Bool)

(assert (=> d!30228 (=> (not res!79412) (not e!63322))))

(declare-fun lt!139726 () (_ BitVec 64))

(declare-fun lt!139728 () (_ BitVec 64))

(declare-fun lt!139730 () tuple2!7744)

(assert (=> d!30228 (= res!79412 (= (bvadd lt!139728 lt!139726) (bitIndex!0 (size!2055 (buf!2404 (_2!4122 lt!139730))) (currentByte!4792 (_2!4122 lt!139730)) (currentBit!4787 (_2!4122 lt!139730)))))))

(assert (=> d!30228 (or (not (= (bvand lt!139728 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139726 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!139728 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!139728 lt!139726) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30228 (= lt!139726 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!30228 (= lt!139728 (bitIndex!0 (size!2055 (buf!2404 bitStream1!8)) (currentByte!4792 bitStream1!8) (currentBit!4787 bitStream1!8)))))

(declare-fun Unit!5860 () Unit!5858)

(declare-fun Unit!5861 () Unit!5858)

(assert (=> d!30228 (= lt!139730 (ite (bvslt (currentBit!4787 bitStream1!8) #b00000000000000000000000000000111) (tuple2!7745 Unit!5860 (BitStream!3591 (buf!2404 bitStream1!8) (currentByte!4792 bitStream1!8) (bvadd (currentBit!4787 bitStream1!8) #b00000000000000000000000000000001))) (tuple2!7745 Unit!5861 (BitStream!3591 (buf!2404 bitStream1!8) (bvadd (currentByte!4792 bitStream1!8) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!30228 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!2055 (buf!2404 bitStream1!8))) ((_ sign_extend 32) (currentByte!4792 bitStream1!8)) ((_ sign_extend 32) (currentBit!4787 bitStream1!8))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!30228 (= (increaseBitIndex!0 bitStream1!8) lt!139730)))

(declare-fun b!96692 () Bool)

(declare-fun res!79411 () Bool)

(assert (=> b!96692 (=> (not res!79411) (not e!63322))))

(declare-fun lt!139729 () (_ BitVec 64))

(declare-fun lt!139727 () (_ BitVec 64))

(assert (=> b!96692 (= res!79411 (= (bvsub lt!139729 lt!139727) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!96692 (or (= (bvand lt!139729 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139727 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!139729 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!139729 lt!139727) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!96692 (= lt!139727 (remainingBits!0 ((_ sign_extend 32) (size!2055 (buf!2404 (_2!4122 lt!139730)))) ((_ sign_extend 32) (currentByte!4792 (_2!4122 lt!139730))) ((_ sign_extend 32) (currentBit!4787 (_2!4122 lt!139730)))))))

(assert (=> b!96692 (= lt!139729 (remainingBits!0 ((_ sign_extend 32) (size!2055 (buf!2404 bitStream1!8))) ((_ sign_extend 32) (currentByte!4792 bitStream1!8)) ((_ sign_extend 32) (currentBit!4787 bitStream1!8))))))

(declare-fun b!96693 () Bool)

(assert (=> b!96693 (= e!63322 (= (size!2055 (buf!2404 bitStream1!8)) (size!2055 (buf!2404 (_2!4122 lt!139730)))))))

(assert (= (and d!30228 res!79412) b!96692))

(assert (= (and b!96692 res!79411) b!96693))

(declare-fun m!140165 () Bool)

(assert (=> d!30228 m!140165))

(assert (=> d!30228 m!139767))

(assert (=> d!30228 m!139841))

(declare-fun m!140167 () Bool)

(assert (=> b!96692 m!140167))

(assert (=> b!96692 m!139841))

(assert (=> d!30214 d!30228))

(declare-fun d!30230 () Bool)

(assert (=> d!30230 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!2055 (buf!2404 bitStream1!8))) ((_ sign_extend 32) (currentByte!4792 bitStream1!8)) ((_ sign_extend 32) (currentBit!4787 bitStream1!8))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2055 (buf!2404 bitStream1!8))) ((_ sign_extend 32) (currentByte!4792 bitStream1!8)) ((_ sign_extend 32) (currentBit!4787 bitStream1!8))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!7394 () Bool)

(assert (= bs!7394 d!30230))

(assert (=> bs!7394 m!139841))

(assert (=> d!30214 d!30230))

(declare-fun d!30232 () Bool)

(assert (=> d!30232 (= (byteRangesEq!0 (select (arr!2651 (buf!2404 bitStream1!8)) (_4!29 lt!139712)) (select (arr!2651 (buf!2404 base!8)) (_4!29 lt!139712)) #b00000000000000000000000000000000 lt!139710) (or (= #b00000000000000000000000000000000 lt!139710) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!2651 (buf!2404 bitStream1!8)) (_4!29 lt!139712))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!139710))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!2651 (buf!2404 base!8)) (_4!29 lt!139712))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!139710))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!7395 () Bool)

(assert (= bs!7395 d!30232))

(declare-fun m!140169 () Bool)

(assert (=> bs!7395 m!140169))

(declare-fun m!140171 () Bool)

(assert (=> bs!7395 m!140171))

(assert (=> b!96676 d!30232))

(declare-fun d!30234 () Bool)

(assert (=> d!30234 (= (length!492 lt!139665) (size!2058 lt!139665))))

(declare-fun bs!7396 () Bool)

(assert (= bs!7396 d!30234))

(declare-fun m!140173 () Bool)

(assert (=> bs!7396 m!140173))

(assert (=> b!96638 d!30234))

(declare-fun d!30236 () Bool)

(declare-fun res!79417 () Bool)

(declare-fun e!63327 () Bool)

(assert (=> d!30236 (=> res!79417 e!63327)))

(assert (=> d!30236 (= res!79417 (= (_1!4123 lt!139712) (_2!4123 lt!139712)))))

(assert (=> d!30236 (= (arrayRangesEq!30 (buf!2404 bitStream1!8) (buf!2404 base!8) (_1!4123 lt!139712) (_2!4123 lt!139712)) e!63327)))

(declare-fun b!96698 () Bool)

(declare-fun e!63328 () Bool)

(assert (=> b!96698 (= e!63327 e!63328)))

(declare-fun res!79418 () Bool)

(assert (=> b!96698 (=> (not res!79418) (not e!63328))))

(assert (=> b!96698 (= res!79418 (= (select (arr!2651 (buf!2404 bitStream1!8)) (_1!4123 lt!139712)) (select (arr!2651 (buf!2404 base!8)) (_1!4123 lt!139712))))))

(declare-fun b!96699 () Bool)

(assert (=> b!96699 (= e!63328 (arrayRangesEq!30 (buf!2404 bitStream1!8) (buf!2404 base!8) (bvadd (_1!4123 lt!139712) #b00000000000000000000000000000001) (_2!4123 lt!139712)))))

(assert (= (and d!30236 (not res!79417)) b!96698))

(assert (= (and b!96698 res!79418) b!96699))

(declare-fun m!140175 () Bool)

(assert (=> b!96698 m!140175))

(declare-fun m!140177 () Bool)

(assert (=> b!96698 m!140177))

(declare-fun m!140179 () Bool)

(assert (=> b!96699 m!140179))

(assert (=> b!96677 d!30236))

(declare-fun d!30238 () Bool)

(declare-fun lt!139731 () Int)

(assert (=> d!30238 (>= lt!139731 0)))

(declare-fun e!63329 () Int)

(assert (=> d!30238 (= lt!139731 e!63329)))

(declare-fun c!6095 () Bool)

(assert (=> d!30238 (= c!6095 (is-Nil!898 lt!139552))))

(assert (=> d!30238 (= (size!2058 lt!139552) lt!139731)))

(declare-fun b!96700 () Bool)

(assert (=> b!96700 (= e!63329 0)))

(declare-fun b!96701 () Bool)

(assert (=> b!96701 (= e!63329 (+ 1 (size!2058 (t!1651 lt!139552))))))

(assert (= (and d!30238 c!6095) b!96700))

(assert (= (and d!30238 (not c!6095)) b!96701))

(declare-fun m!140181 () Bool)

(assert (=> b!96701 m!140181))

(assert (=> d!30192 d!30238))

(declare-fun d!30240 () Bool)

(assert (=> d!30240 (= (byteRangesEq!0 (select (arr!2651 (buf!2404 bitStream1!8)) (_3!250 lt!139712)) (select (arr!2651 (buf!2404 base!8)) (_3!250 lt!139712)) lt!139711 (ite c!6091 lt!139710 #b00000000000000000000000000001000)) (or (= lt!139711 (ite c!6091 lt!139710 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!2651 (buf!2404 bitStream1!8)) (_3!250 lt!139712))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!6091 lt!139710 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!139711)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!2651 (buf!2404 base!8)) (_3!250 lt!139712))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!6091 lt!139710 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!139711)))) #b00000000000000000000000011111111))))))

(declare-fun bs!7397 () Bool)

(assert (= bs!7397 d!30240))

(declare-fun m!140183 () Bool)

(assert (=> bs!7397 m!140183))

(declare-fun m!140185 () Bool)

(assert (=> bs!7397 m!140185))

(assert (=> bm!1176 d!30240))

(declare-fun d!30242 () Bool)

(declare-fun lt!139732 () Int)

(assert (=> d!30242 (>= lt!139732 0)))

(declare-fun e!63330 () Int)

(assert (=> d!30242 (= lt!139732 e!63330)))

(declare-fun c!6096 () Bool)

(assert (=> d!30242 (= c!6096 (is-Nil!898 (t!1651 listBits!13)))))

(assert (=> d!30242 (= (size!2058 (t!1651 listBits!13)) lt!139732)))

(declare-fun b!96702 () Bool)

(assert (=> b!96702 (= e!63330 0)))

(declare-fun b!96703 () Bool)

(assert (=> b!96703 (= e!63330 (+ 1 (size!2058 (t!1651 (t!1651 listBits!13)))))))

(assert (= (and d!30242 c!6096) b!96702))

(assert (= (and d!30242 (not c!6096)) b!96703))

(declare-fun m!140187 () Bool)

(assert (=> b!96703 m!140187))

(assert (=> b!96687 d!30242))

(declare-fun b!96706 () Bool)

(declare-fun e!63332 () Bool)

(declare-fun lt!139734 () List!901)

(assert (=> b!96706 (= e!63332 (isEmpty!267 lt!139734))))

(declare-fun b!96704 () Bool)

(declare-fun e!63331 () tuple2!7738)

(assert (=> b!96704 (= e!63331 (tuple2!7739 Nil!898 (_2!4119 lt!139664)))))

(declare-fun b!96707 () Bool)

(assert (=> b!96707 (= e!63332 (> (length!492 lt!139734) 0))))

(declare-fun d!30244 () Bool)

(assert (=> d!30244 e!63332))

(declare-fun c!6097 () Bool)

(assert (=> d!30244 (= c!6097 (= (bvsub (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139553) lt!139666) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!30244 (= lt!139734 (_1!4118 e!63331))))

(declare-fun c!6098 () Bool)

(assert (=> d!30244 (= c!6098 (= (bvsub (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139553) lt!139666) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!30244 (bvsge (bvsub (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139553) lt!139666) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!30244 (= (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4119 lt!139664) (bvsub (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139553) lt!139666)) lt!139734)))

(declare-fun b!96705 () Bool)

(declare-fun lt!139735 () (_ BitVec 64))

(declare-fun lt!139733 () tuple2!7740)

(assert (=> b!96705 (= e!63331 (tuple2!7739 (Cons!897 (_1!4119 lt!139733) (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4119 lt!139733) (bvsub (bvsub (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139553) lt!139666) lt!139735))) (_2!4119 lt!139733)))))

(assert (=> b!96705 (= lt!139733 (readBit!0 (_2!4119 lt!139664)))))

(assert (=> b!96705 (= lt!139735 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!30244 c!6098) b!96704))

(assert (= (and d!30244 (not c!6098)) b!96705))

(assert (= (and d!30244 c!6097) b!96706))

(assert (= (and d!30244 (not c!6097)) b!96707))

(declare-fun m!140189 () Bool)

(assert (=> b!96706 m!140189))

(declare-fun m!140191 () Bool)

(assert (=> b!96707 m!140191))

(declare-fun m!140193 () Bool)

(assert (=> b!96705 m!140193))

(declare-fun m!140195 () Bool)

(assert (=> b!96705 m!140195))

(assert (=> b!96636 d!30244))

(declare-fun d!30246 () Bool)

(declare-fun e!63333 () Bool)

(assert (=> d!30246 e!63333))

(declare-fun res!79419 () Bool)

(assert (=> d!30246 (=> (not res!79419) (not e!63333))))

(assert (=> d!30246 (= res!79419 (= (buf!2404 (_2!4122 (increaseBitIndex!0 (_2!4119 lt!139551)))) (buf!2404 (_2!4119 lt!139551))))))

(declare-fun lt!139739 () Bool)

(assert (=> d!30246 (= lt!139739 (not (= (bvand ((_ sign_extend 24) (select (arr!2651 (buf!2404 (_2!4119 lt!139551))) (currentByte!4792 (_2!4119 lt!139551)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4787 (_2!4119 lt!139551))))) #b00000000000000000000000000000000)))))

(declare-fun lt!139738 () tuple2!7740)

(assert (=> d!30246 (= lt!139738 (tuple2!7741 (not (= (bvand ((_ sign_extend 24) (select (arr!2651 (buf!2404 (_2!4119 lt!139551))) (currentByte!4792 (_2!4119 lt!139551)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4787 (_2!4119 lt!139551))))) #b00000000000000000000000000000000)) (_2!4122 (increaseBitIndex!0 (_2!4119 lt!139551)))))))

(assert (=> d!30246 (validate_offset_bit!0 ((_ sign_extend 32) (size!2055 (buf!2404 (_2!4119 lt!139551)))) ((_ sign_extend 32) (currentByte!4792 (_2!4119 lt!139551))) ((_ sign_extend 32) (currentBit!4787 (_2!4119 lt!139551))))))

(assert (=> d!30246 (= (readBit!0 (_2!4119 lt!139551)) lt!139738)))

(declare-fun b!96708 () Bool)

(declare-fun lt!139742 () (_ BitVec 64))

(declare-fun lt!139737 () (_ BitVec 64))

(assert (=> b!96708 (= e!63333 (= (bitIndex!0 (size!2055 (buf!2404 (_2!4122 (increaseBitIndex!0 (_2!4119 lt!139551))))) (currentByte!4792 (_2!4122 (increaseBitIndex!0 (_2!4119 lt!139551)))) (currentBit!4787 (_2!4122 (increaseBitIndex!0 (_2!4119 lt!139551))))) (bvadd lt!139742 lt!139737)))))

(assert (=> b!96708 (or (not (= (bvand lt!139742 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139737 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!139742 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!139742 lt!139737) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!96708 (= lt!139737 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!96708 (= lt!139742 (bitIndex!0 (size!2055 (buf!2404 (_2!4119 lt!139551))) (currentByte!4792 (_2!4119 lt!139551)) (currentBit!4787 (_2!4119 lt!139551))))))

(declare-fun lt!139741 () Bool)

(assert (=> b!96708 (= lt!139741 (not (= (bvand ((_ sign_extend 24) (select (arr!2651 (buf!2404 (_2!4119 lt!139551))) (currentByte!4792 (_2!4119 lt!139551)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4787 (_2!4119 lt!139551))))) #b00000000000000000000000000000000)))))

(declare-fun lt!139736 () Bool)

(assert (=> b!96708 (= lt!139736 (not (= (bvand ((_ sign_extend 24) (select (arr!2651 (buf!2404 (_2!4119 lt!139551))) (currentByte!4792 (_2!4119 lt!139551)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4787 (_2!4119 lt!139551))))) #b00000000000000000000000000000000)))))

(declare-fun lt!139740 () Bool)

(assert (=> b!96708 (= lt!139740 (not (= (bvand ((_ sign_extend 24) (select (arr!2651 (buf!2404 (_2!4119 lt!139551))) (currentByte!4792 (_2!4119 lt!139551)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4787 (_2!4119 lt!139551))))) #b00000000000000000000000000000000)))))

(assert (= (and d!30246 res!79419) b!96708))

(declare-fun m!140197 () Bool)

(assert (=> d!30246 m!140197))

(declare-fun m!140199 () Bool)

(assert (=> d!30246 m!140199))

(declare-fun m!140201 () Bool)

(assert (=> d!30246 m!140201))

(declare-fun m!140203 () Bool)

(assert (=> d!30246 m!140203))

(assert (=> b!96708 m!140197))

(assert (=> b!96708 m!140199))

(assert (=> b!96708 m!140201))

(declare-fun m!140205 () Bool)

(assert (=> b!96708 m!140205))

(declare-fun m!140207 () Bool)

(assert (=> b!96708 m!140207))

(assert (=> b!96636 d!30246))

(declare-fun d!30248 () Bool)

(assert (=> d!30248 (= (byteRangesEq!0 (select (arr!2651 (buf!2404 bitStream1!8)) (_3!250 lt!139699)) (select (arr!2651 (buf!2404 bitStream2!8)) (_3!250 lt!139699)) lt!139698 (ite c!6088 lt!139697 #b00000000000000000000000000001000)) (or (= lt!139698 (ite c!6088 lt!139697 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!2651 (buf!2404 bitStream1!8)) (_3!250 lt!139699))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!6088 lt!139697 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!139698)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!2651 (buf!2404 bitStream2!8)) (_3!250 lt!139699))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!6088 lt!139697 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!139698)))) #b00000000000000000000000011111111))))))

(declare-fun bs!7398 () Bool)

(assert (= bs!7398 d!30248))

(declare-fun m!140209 () Bool)

(assert (=> bs!7398 m!140209))

(declare-fun m!140211 () Bool)

(assert (=> bs!7398 m!140211))

(assert (=> bm!1175 d!30248))

(declare-fun d!30250 () Bool)

(assert (=> d!30250 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2055 (buf!2404 bitStream1!8)) (currentByte!4792 bitStream1!8) (currentBit!4787 bitStream1!8))) (tuple4!59 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!2055 (buf!2404 bitStream1!8)) (currentByte!4792 bitStream1!8) (currentBit!4787 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!2055 (buf!2404 bitStream1!8)) (currentByte!4792 bitStream1!8) (currentBit!4787 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!96679 d!30250))

(declare-fun d!30252 () Bool)

(declare-fun e!63334 () Bool)

(assert (=> d!30252 e!63334))

(declare-fun res!79421 () Bool)

(assert (=> d!30252 (=> (not res!79421) (not e!63334))))

(declare-fun lt!139744 () (_ BitVec 64))

(declare-fun lt!139743 () (_ BitVec 64))

(declare-fun lt!139746 () (_ BitVec 64))

(assert (=> d!30252 (= res!79421 (= lt!139743 (bvsub lt!139746 lt!139744)))))

(assert (=> d!30252 (or (= (bvand lt!139746 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139744 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!139746 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!139746 lt!139744) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30252 (= lt!139744 (remainingBits!0 ((_ sign_extend 32) (size!2055 (buf!2404 (_2!4122 (increaseBitIndex!0 bitStream1!8))))) ((_ sign_extend 32) (currentByte!4792 (_2!4122 (increaseBitIndex!0 bitStream1!8)))) ((_ sign_extend 32) (currentBit!4787 (_2!4122 (increaseBitIndex!0 bitStream1!8))))))))

(declare-fun lt!139747 () (_ BitVec 64))

(declare-fun lt!139745 () (_ BitVec 64))

(assert (=> d!30252 (= lt!139746 (bvmul lt!139747 lt!139745))))

(assert (=> d!30252 (or (= lt!139747 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!139745 (bvsdiv (bvmul lt!139747 lt!139745) lt!139747)))))

(assert (=> d!30252 (= lt!139745 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30252 (= lt!139747 ((_ sign_extend 32) (size!2055 (buf!2404 (_2!4122 (increaseBitIndex!0 bitStream1!8))))))))

(assert (=> d!30252 (= lt!139743 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4792 (_2!4122 (increaseBitIndex!0 bitStream1!8)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4787 (_2!4122 (increaseBitIndex!0 bitStream1!8))))))))

(assert (=> d!30252 (invariant!0 (currentBit!4787 (_2!4122 (increaseBitIndex!0 bitStream1!8))) (currentByte!4792 (_2!4122 (increaseBitIndex!0 bitStream1!8))) (size!2055 (buf!2404 (_2!4122 (increaseBitIndex!0 bitStream1!8)))))))

(assert (=> d!30252 (= (bitIndex!0 (size!2055 (buf!2404 (_2!4122 (increaseBitIndex!0 bitStream1!8)))) (currentByte!4792 (_2!4122 (increaseBitIndex!0 bitStream1!8))) (currentBit!4787 (_2!4122 (increaseBitIndex!0 bitStream1!8)))) lt!139743)))

(declare-fun b!96709 () Bool)

(declare-fun res!79420 () Bool)

(assert (=> b!96709 (=> (not res!79420) (not e!63334))))

(assert (=> b!96709 (= res!79420 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!139743))))

(declare-fun b!96710 () Bool)

(declare-fun lt!139748 () (_ BitVec 64))

(assert (=> b!96710 (= e!63334 (bvsle lt!139743 (bvmul lt!139748 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!96710 (or (= lt!139748 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!139748 #b0000000000000000000000000000000000000000000000000000000000001000) lt!139748)))))

(assert (=> b!96710 (= lt!139748 ((_ sign_extend 32) (size!2055 (buf!2404 (_2!4122 (increaseBitIndex!0 bitStream1!8))))))))

(assert (= (and d!30252 res!79421) b!96709))

(assert (= (and b!96709 res!79420) b!96710))

(declare-fun m!140213 () Bool)

(assert (=> d!30252 m!140213))

(declare-fun m!140215 () Bool)

(assert (=> d!30252 m!140215))

(assert (=> b!96670 d!30252))

(assert (=> b!96670 d!30228))

(assert (=> b!96670 d!30008))

(declare-fun d!30254 () Bool)

(declare-fun res!79422 () Bool)

(declare-fun e!63335 () Bool)

(assert (=> d!30254 (=> res!79422 e!63335)))

(assert (=> d!30254 (= res!79422 (= (_1!4123 lt!139696) (_2!4123 lt!139696)))))

(assert (=> d!30254 (= (arrayRangesEq!30 (buf!2404 bitStream2!8) (buf!2404 base!8) (_1!4123 lt!139696) (_2!4123 lt!139696)) e!63335)))

(declare-fun b!96711 () Bool)

(declare-fun e!63336 () Bool)

(assert (=> b!96711 (= e!63335 e!63336)))

(declare-fun res!79423 () Bool)

(assert (=> b!96711 (=> (not res!79423) (not e!63336))))

(assert (=> b!96711 (= res!79423 (= (select (arr!2651 (buf!2404 bitStream2!8)) (_1!4123 lt!139696)) (select (arr!2651 (buf!2404 base!8)) (_1!4123 lt!139696))))))

(declare-fun b!96712 () Bool)

(assert (=> b!96712 (= e!63336 (arrayRangesEq!30 (buf!2404 bitStream2!8) (buf!2404 base!8) (bvadd (_1!4123 lt!139696) #b00000000000000000000000000000001) (_2!4123 lt!139696)))))

(assert (= (and d!30254 (not res!79422)) b!96711))

(assert (= (and b!96711 res!79423) b!96712))

(declare-fun m!140217 () Bool)

(assert (=> b!96711 m!140217))

(declare-fun m!140219 () Bool)

(assert (=> b!96711 m!140219))

(declare-fun m!140221 () Bool)

(assert (=> b!96712 m!140221))

(assert (=> b!96658 d!30254))

(declare-fun d!30256 () Bool)

(declare-fun e!63337 () Bool)

(assert (=> d!30256 e!63337))

(declare-fun res!79425 () Bool)

(assert (=> d!30256 (=> (not res!79425) (not e!63337))))

(declare-fun lt!139751 () (_ BitVec 64))

(declare-fun lt!139753 () tuple2!7744)

(declare-fun lt!139749 () (_ BitVec 64))

(assert (=> d!30256 (= res!79425 (= (bvadd lt!139751 lt!139749) (bitIndex!0 (size!2055 (buf!2404 (_2!4122 lt!139753))) (currentByte!4792 (_2!4122 lt!139753)) (currentBit!4787 (_2!4122 lt!139753)))))))

(assert (=> d!30256 (or (not (= (bvand lt!139751 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139749 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!139751 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!139751 lt!139749) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30256 (= lt!139749 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!30256 (= lt!139751 (bitIndex!0 (size!2055 (buf!2404 bitStream2!8)) (currentByte!4792 bitStream2!8) (currentBit!4787 bitStream2!8)))))

(declare-fun Unit!5862 () Unit!5858)

(declare-fun Unit!5863 () Unit!5858)

(assert (=> d!30256 (= lt!139753 (ite (bvslt (currentBit!4787 bitStream2!8) #b00000000000000000000000000000111) (tuple2!7745 Unit!5862 (BitStream!3591 (buf!2404 bitStream2!8) (currentByte!4792 bitStream2!8) (bvadd (currentBit!4787 bitStream2!8) #b00000000000000000000000000000001))) (tuple2!7745 Unit!5863 (BitStream!3591 (buf!2404 bitStream2!8) (bvadd (currentByte!4792 bitStream2!8) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!30256 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!2055 (buf!2404 bitStream2!8))) ((_ sign_extend 32) (currentByte!4792 bitStream2!8)) ((_ sign_extend 32) (currentBit!4787 bitStream2!8))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!30256 (= (increaseBitIndex!0 bitStream2!8) lt!139753)))

(declare-fun b!96713 () Bool)

(declare-fun res!79424 () Bool)

(assert (=> b!96713 (=> (not res!79424) (not e!63337))))

(declare-fun lt!139752 () (_ BitVec 64))

(declare-fun lt!139750 () (_ BitVec 64))

(assert (=> b!96713 (= res!79424 (= (bvsub lt!139752 lt!139750) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!96713 (or (= (bvand lt!139752 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139750 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!139752 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!139752 lt!139750) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!96713 (= lt!139750 (remainingBits!0 ((_ sign_extend 32) (size!2055 (buf!2404 (_2!4122 lt!139753)))) ((_ sign_extend 32) (currentByte!4792 (_2!4122 lt!139753))) ((_ sign_extend 32) (currentBit!4787 (_2!4122 lt!139753)))))))

(assert (=> b!96713 (= lt!139752 (remainingBits!0 ((_ sign_extend 32) (size!2055 (buf!2404 bitStream2!8))) ((_ sign_extend 32) (currentByte!4792 bitStream2!8)) ((_ sign_extend 32) (currentBit!4787 bitStream2!8))))))

(declare-fun b!96714 () Bool)

(assert (=> b!96714 (= e!63337 (= (size!2055 (buf!2404 bitStream2!8)) (size!2055 (buf!2404 (_2!4122 lt!139753)))))))

(assert (= (and d!30256 res!79425) b!96713))

(assert (= (and b!96713 res!79424) b!96714))

(declare-fun m!140223 () Bool)

(assert (=> d!30256 m!140223))

(assert (=> d!30256 m!139769))

(assert (=> d!30256 m!139845))

(declare-fun m!140225 () Bool)

(assert (=> b!96713 m!140225))

(assert (=> b!96713 m!139845))

(assert (=> d!30200 d!30256))

(declare-fun d!30258 () Bool)

(assert (=> d!30258 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!2055 (buf!2404 bitStream2!8))) ((_ sign_extend 32) (currentByte!4792 bitStream2!8)) ((_ sign_extend 32) (currentBit!4787 bitStream2!8))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2055 (buf!2404 bitStream2!8))) ((_ sign_extend 32) (currentByte!4792 bitStream2!8)) ((_ sign_extend 32) (currentBit!4787 bitStream2!8))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!7399 () Bool)

(assert (= bs!7399 d!30258))

(assert (=> bs!7399 m!139845))

(assert (=> d!30200 d!30258))

(assert (=> b!96667 d!30250))

(declare-fun b!96717 () Bool)

(declare-fun e!63339 () Bool)

(declare-fun lt!139755 () List!901)

(assert (=> b!96717 (= e!63339 (isEmpty!267 lt!139755))))

(declare-fun b!96715 () Bool)

(declare-fun e!63338 () tuple2!7738)

(assert (=> b!96715 (= e!63338 (tuple2!7739 Nil!898 (_2!4119 lt!139707)))))

(declare-fun b!96718 () Bool)

(assert (=> b!96718 (= e!63339 (> (length!492 lt!139755) 0))))

(declare-fun d!30260 () Bool)

(assert (=> d!30260 e!63339))

(declare-fun c!6099 () Bool)

(assert (=> d!30260 (= c!6099 (= (bvsub (bvsub nBits!484 lt!139544) lt!139709) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!30260 (= lt!139755 (_1!4118 e!63338))))

(declare-fun c!6100 () Bool)

(assert (=> d!30260 (= c!6100 (= (bvsub (bvsub nBits!484 lt!139544) lt!139709) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!30260 (bvsge (bvsub (bvsub nBits!484 lt!139544) lt!139709) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!30260 (= (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4119 lt!139707) (bvsub (bvsub nBits!484 lt!139544) lt!139709)) lt!139755)))

(declare-fun b!96716 () Bool)

(declare-fun lt!139754 () tuple2!7740)

(declare-fun lt!139756 () (_ BitVec 64))

(assert (=> b!96716 (= e!63338 (tuple2!7739 (Cons!897 (_1!4119 lt!139754) (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4119 lt!139754) (bvsub (bvsub (bvsub nBits!484 lt!139544) lt!139709) lt!139756))) (_2!4119 lt!139754)))))

(assert (=> b!96716 (= lt!139754 (readBit!0 (_2!4119 lt!139707)))))

(assert (=> b!96716 (= lt!139756 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!30260 c!6100) b!96715))

(assert (= (and d!30260 (not c!6100)) b!96716))

(assert (= (and d!30260 c!6099) b!96717))

(assert (= (and d!30260 (not c!6099)) b!96718))

(declare-fun m!140227 () Bool)

(assert (=> b!96717 m!140227))

(declare-fun m!140229 () Bool)

(assert (=> b!96718 m!140229))

(declare-fun m!140231 () Bool)

(assert (=> b!96716 m!140231))

(declare-fun m!140233 () Bool)

(assert (=> b!96716 m!140233))

(assert (=> b!96672 d!30260))

(declare-fun d!30262 () Bool)

(declare-fun e!63340 () Bool)

(assert (=> d!30262 e!63340))

(declare-fun res!79426 () Bool)

(assert (=> d!30262 (=> (not res!79426) (not e!63340))))

(assert (=> d!30262 (= res!79426 (= (buf!2404 (_2!4122 (increaseBitIndex!0 (_2!4119 lt!139542)))) (buf!2404 (_2!4119 lt!139542))))))

(declare-fun lt!139760 () Bool)

(assert (=> d!30262 (= lt!139760 (not (= (bvand ((_ sign_extend 24) (select (arr!2651 (buf!2404 (_2!4119 lt!139542))) (currentByte!4792 (_2!4119 lt!139542)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4787 (_2!4119 lt!139542))))) #b00000000000000000000000000000000)))))

(declare-fun lt!139759 () tuple2!7740)

(assert (=> d!30262 (= lt!139759 (tuple2!7741 (not (= (bvand ((_ sign_extend 24) (select (arr!2651 (buf!2404 (_2!4119 lt!139542))) (currentByte!4792 (_2!4119 lt!139542)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4787 (_2!4119 lt!139542))))) #b00000000000000000000000000000000)) (_2!4122 (increaseBitIndex!0 (_2!4119 lt!139542)))))))

(assert (=> d!30262 (validate_offset_bit!0 ((_ sign_extend 32) (size!2055 (buf!2404 (_2!4119 lt!139542)))) ((_ sign_extend 32) (currentByte!4792 (_2!4119 lt!139542))) ((_ sign_extend 32) (currentBit!4787 (_2!4119 lt!139542))))))

(assert (=> d!30262 (= (readBit!0 (_2!4119 lt!139542)) lt!139759)))

(declare-fun lt!139758 () (_ BitVec 64))

(declare-fun b!96719 () Bool)

(declare-fun lt!139763 () (_ BitVec 64))

(assert (=> b!96719 (= e!63340 (= (bitIndex!0 (size!2055 (buf!2404 (_2!4122 (increaseBitIndex!0 (_2!4119 lt!139542))))) (currentByte!4792 (_2!4122 (increaseBitIndex!0 (_2!4119 lt!139542)))) (currentBit!4787 (_2!4122 (increaseBitIndex!0 (_2!4119 lt!139542))))) (bvadd lt!139763 lt!139758)))))

(assert (=> b!96719 (or (not (= (bvand lt!139763 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139758 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!139763 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!139763 lt!139758) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!96719 (= lt!139758 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!96719 (= lt!139763 (bitIndex!0 (size!2055 (buf!2404 (_2!4119 lt!139542))) (currentByte!4792 (_2!4119 lt!139542)) (currentBit!4787 (_2!4119 lt!139542))))))

(declare-fun lt!139762 () Bool)

(assert (=> b!96719 (= lt!139762 (not (= (bvand ((_ sign_extend 24) (select (arr!2651 (buf!2404 (_2!4119 lt!139542))) (currentByte!4792 (_2!4119 lt!139542)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4787 (_2!4119 lt!139542))))) #b00000000000000000000000000000000)))))

(declare-fun lt!139757 () Bool)

(assert (=> b!96719 (= lt!139757 (not (= (bvand ((_ sign_extend 24) (select (arr!2651 (buf!2404 (_2!4119 lt!139542))) (currentByte!4792 (_2!4119 lt!139542)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4787 (_2!4119 lt!139542))))) #b00000000000000000000000000000000)))))

(declare-fun lt!139761 () Bool)

(assert (=> b!96719 (= lt!139761 (not (= (bvand ((_ sign_extend 24) (select (arr!2651 (buf!2404 (_2!4119 lt!139542))) (currentByte!4792 (_2!4119 lt!139542)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4787 (_2!4119 lt!139542))))) #b00000000000000000000000000000000)))))

(assert (= (and d!30262 res!79426) b!96719))

(declare-fun m!140235 () Bool)

(assert (=> d!30262 m!140235))

(declare-fun m!140237 () Bool)

(assert (=> d!30262 m!140237))

(declare-fun m!140239 () Bool)

(assert (=> d!30262 m!140239))

(declare-fun m!140241 () Bool)

(assert (=> d!30262 m!140241))

(assert (=> b!96719 m!140235))

(assert (=> b!96719 m!140237))

(assert (=> b!96719 m!140239))

(declare-fun m!140243 () Bool)

(assert (=> b!96719 m!140243))

(declare-fun m!140245 () Bool)

(assert (=> b!96719 m!140245))

(assert (=> b!96672 d!30262))

(declare-fun d!30264 () Bool)

(assert (=> d!30264 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2055 (buf!2404 bitStream2!8)) (currentByte!4792 bitStream2!8) (currentBit!4787 bitStream2!8))) (tuple4!59 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!2055 (buf!2404 bitStream2!8)) (currentByte!4792 bitStream2!8) (currentBit!4787 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!2055 (buf!2404 bitStream2!8)) (currentByte!4792 bitStream2!8) (currentBit!4787 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!96660 d!30264))

(declare-fun d!30266 () Bool)

(assert (=> d!30266 (= (byteRangesEq!0 (select (arr!2651 (buf!2404 bitStream2!8)) (_3!250 lt!139696)) (select (arr!2651 (buf!2404 base!8)) (_3!250 lt!139696)) lt!139695 (ite c!6087 lt!139694 #b00000000000000000000000000001000)) (or (= lt!139695 (ite c!6087 lt!139694 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!2651 (buf!2404 bitStream2!8)) (_3!250 lt!139696))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!6087 lt!139694 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!139695)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!2651 (buf!2404 base!8)) (_3!250 lt!139696))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!6087 lt!139694 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!139695)))) #b00000000000000000000000011111111))))))

(declare-fun bs!7400 () Bool)

(assert (= bs!7400 d!30266))

(declare-fun m!140247 () Bool)

(assert (=> bs!7400 m!140247))

(declare-fun m!140249 () Bool)

(assert (=> bs!7400 m!140249))

(assert (=> bm!1174 d!30266))

(declare-fun d!30268 () Bool)

(assert (=> d!30268 (= (byteRangesEq!0 (select (arr!2651 (buf!2404 bitStream1!8)) (_4!29 lt!139699)) (select (arr!2651 (buf!2404 bitStream2!8)) (_4!29 lt!139699)) #b00000000000000000000000000000000 lt!139697) (or (= #b00000000000000000000000000000000 lt!139697) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!2651 (buf!2404 bitStream1!8)) (_4!29 lt!139699))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!139697))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!2651 (buf!2404 bitStream2!8)) (_4!29 lt!139699))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!139697))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!7401 () Bool)

(assert (= bs!7401 d!30268))

(declare-fun m!140251 () Bool)

(assert (=> bs!7401 m!140251))

(assert (=> bs!7401 m!140171))

(assert (=> b!96664 d!30268))

(declare-fun d!30270 () Bool)

(assert (=> d!30270 (= (byteRangesEq!0 (select (arr!2651 (buf!2404 bitStream2!8)) (_4!29 lt!139696)) (select (arr!2651 (buf!2404 base!8)) (_4!29 lt!139696)) #b00000000000000000000000000000000 lt!139694) (or (= #b00000000000000000000000000000000 lt!139694) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!2651 (buf!2404 bitStream2!8)) (_4!29 lt!139696))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!139694))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!2651 (buf!2404 base!8)) (_4!29 lt!139696))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!139694))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!7402 () Bool)

(assert (= bs!7402 d!30270))

(declare-fun m!140253 () Bool)

(assert (=> bs!7402 m!140253))

(assert (=> bs!7402 m!140171))

(assert (=> b!96657 d!30270))

(declare-fun d!30272 () Bool)

(declare-fun res!79427 () Bool)

(declare-fun e!63341 () Bool)

(assert (=> d!30272 (=> res!79427 e!63341)))

(assert (=> d!30272 (= res!79427 (= (_1!4123 lt!139699) (_2!4123 lt!139699)))))

(assert (=> d!30272 (= (arrayRangesEq!30 (buf!2404 bitStream1!8) (buf!2404 bitStream2!8) (_1!4123 lt!139699) (_2!4123 lt!139699)) e!63341)))

(declare-fun b!96720 () Bool)

(declare-fun e!63342 () Bool)

(assert (=> b!96720 (= e!63341 e!63342)))

(declare-fun res!79428 () Bool)

(assert (=> b!96720 (=> (not res!79428) (not e!63342))))

(assert (=> b!96720 (= res!79428 (= (select (arr!2651 (buf!2404 bitStream1!8)) (_1!4123 lt!139699)) (select (arr!2651 (buf!2404 bitStream2!8)) (_1!4123 lt!139699))))))

(declare-fun b!96721 () Bool)

(assert (=> b!96721 (= e!63342 (arrayRangesEq!30 (buf!2404 bitStream1!8) (buf!2404 bitStream2!8) (bvadd (_1!4123 lt!139699) #b00000000000000000000000000000001) (_2!4123 lt!139699)))))

(assert (= (and d!30272 (not res!79427)) b!96720))

(assert (= (and b!96720 res!79428) b!96721))

(declare-fun m!140255 () Bool)

(assert (=> b!96720 m!140255))

(declare-fun m!140257 () Bool)

(assert (=> b!96720 m!140257))

(declare-fun m!140259 () Bool)

(assert (=> b!96721 m!140259))

(assert (=> b!96665 d!30272))

(declare-fun d!30274 () Bool)

(declare-fun e!63343 () Bool)

(assert (=> d!30274 e!63343))

(declare-fun res!79430 () Bool)

(assert (=> d!30274 (=> (not res!79430) (not e!63343))))

(declare-fun lt!139765 () (_ BitVec 64))

(declare-fun lt!139767 () (_ BitVec 64))

(declare-fun lt!139764 () (_ BitVec 64))

(assert (=> d!30274 (= res!79430 (= lt!139764 (bvsub lt!139767 lt!139765)))))

(assert (=> d!30274 (or (= (bvand lt!139767 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139765 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!139767 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!139767 lt!139765) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30274 (= lt!139765 (remainingBits!0 ((_ sign_extend 32) (size!2055 (buf!2404 (_2!4122 (increaseBitIndex!0 bitStream2!8))))) ((_ sign_extend 32) (currentByte!4792 (_2!4122 (increaseBitIndex!0 bitStream2!8)))) ((_ sign_extend 32) (currentBit!4787 (_2!4122 (increaseBitIndex!0 bitStream2!8))))))))

(declare-fun lt!139768 () (_ BitVec 64))

(declare-fun lt!139766 () (_ BitVec 64))

(assert (=> d!30274 (= lt!139767 (bvmul lt!139768 lt!139766))))

(assert (=> d!30274 (or (= lt!139768 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!139766 (bvsdiv (bvmul lt!139768 lt!139766) lt!139768)))))

(assert (=> d!30274 (= lt!139766 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30274 (= lt!139768 ((_ sign_extend 32) (size!2055 (buf!2404 (_2!4122 (increaseBitIndex!0 bitStream2!8))))))))

(assert (=> d!30274 (= lt!139764 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4792 (_2!4122 (increaseBitIndex!0 bitStream2!8)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4787 (_2!4122 (increaseBitIndex!0 bitStream2!8))))))))

(assert (=> d!30274 (invariant!0 (currentBit!4787 (_2!4122 (increaseBitIndex!0 bitStream2!8))) (currentByte!4792 (_2!4122 (increaseBitIndex!0 bitStream2!8))) (size!2055 (buf!2404 (_2!4122 (increaseBitIndex!0 bitStream2!8)))))))

(assert (=> d!30274 (= (bitIndex!0 (size!2055 (buf!2404 (_2!4122 (increaseBitIndex!0 bitStream2!8)))) (currentByte!4792 (_2!4122 (increaseBitIndex!0 bitStream2!8))) (currentBit!4787 (_2!4122 (increaseBitIndex!0 bitStream2!8)))) lt!139764)))

(declare-fun b!96722 () Bool)

(declare-fun res!79429 () Bool)

(assert (=> b!96722 (=> (not res!79429) (not e!63343))))

(assert (=> b!96722 (= res!79429 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!139764))))

(declare-fun b!96723 () Bool)

(declare-fun lt!139769 () (_ BitVec 64))

(assert (=> b!96723 (= e!63343 (bvsle lt!139764 (bvmul lt!139769 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!96723 (or (= lt!139769 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!139769 #b0000000000000000000000000000000000000000000000000000000000001000) lt!139769)))))

(assert (=> b!96723 (= lt!139769 ((_ sign_extend 32) (size!2055 (buf!2404 (_2!4122 (increaseBitIndex!0 bitStream2!8))))))))

(assert (= (and d!30274 res!79430) b!96722))

(assert (= (and b!96722 res!79429) b!96723))

(declare-fun m!140261 () Bool)

(assert (=> d!30274 m!140261))

(declare-fun m!140263 () Bool)

(assert (=> d!30274 m!140263))

(assert (=> b!96641 d!30274))

(assert (=> b!96641 d!30256))

(assert (=> b!96641 d!30034))

(declare-fun d!30276 () Bool)

(assert (=> d!30276 (= (isEmpty!267 lt!139708) (is-Nil!898 lt!139708))))

(assert (=> b!96673 d!30276))

(declare-fun d!30278 () Bool)

(assert (=> d!30278 (= (length!492 lt!139708) (size!2058 lt!139708))))

(declare-fun bs!7403 () Bool)

(assert (= bs!7403 d!30278))

(declare-fun m!140265 () Bool)

(assert (=> bs!7403 m!140265))

(assert (=> b!96674 d!30278))

(declare-fun d!30280 () Bool)

(declare-fun lt!139770 () Int)

(assert (=> d!30280 (>= lt!139770 0)))

(declare-fun e!63344 () Int)

(assert (=> d!30280 (= lt!139770 e!63344)))

(declare-fun c!6101 () Bool)

(assert (=> d!30280 (= c!6101 (is-Nil!898 lt!139543))))

(assert (=> d!30280 (= (size!2058 lt!139543) lt!139770)))

(declare-fun b!96724 () Bool)

(assert (=> b!96724 (= e!63344 0)))

(declare-fun b!96725 () Bool)

(assert (=> b!96725 (= e!63344 (+ 1 (size!2058 (t!1651 lt!139543))))))

(assert (= (and d!30280 c!6101) b!96724))

(assert (= (and d!30280 (not c!6101)) b!96725))

(declare-fun m!140267 () Bool)

(assert (=> b!96725 m!140267))

(assert (=> d!30210 d!30280))

(push 1)

(assert (not b!96718))

(assert (not d!30258))

(assert (not d!30234))

(assert (not b!96725))

(assert (not d!30262))

(assert (not d!30246))

(assert (not d!30274))

(assert (not b!96705))

(assert (not b!96717))

(assert (not b!96703))

(assert (not d!30278))

(assert (not b!96712))

(assert (not d!30252))

(assert (not b!96719))

(assert (not b!96713))

(assert (not b!96692))

(assert (not b!96716))

(assert (not b!96708))

(assert (not b!96721))

(assert (not b!96701))

(assert (not b!96707))

(assert (not b!96706))

(assert (not d!30230))

(assert (not d!30228))

(assert (not b!96699))

(assert (not d!30256))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

