; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18618 () Bool)

(assert start!18618)

(declare-fun b!92365 () Bool)

(declare-fun res!76252 () Bool)

(declare-fun e!60721 () Bool)

(assert (=> b!92365 (=> (not res!76252) (not e!60721))))

(declare-datatypes ((array!4323 0))(
  ( (array!4324 (arr!2580 (Array (_ BitVec 32) (_ BitVec 8))) (size!1955 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3448 0))(
  ( (BitStream!3449 (buf!2333 array!4323) (currentByte!4652 (_ BitVec 32)) (currentBit!4647 (_ BitVec 32))) )
))
(declare-fun base!8 () BitStream!3448)

(declare-fun nBits!484 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!92365 (= res!76252 (bvslt (bitIndex!0 (size!1955 (buf!2333 base!8)) (currentByte!4652 base!8) (currentBit!4647 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!92366 () Bool)

(declare-fun res!76251 () Bool)

(assert (=> b!92366 (=> (not res!76251) (not e!60721))))

(declare-fun bitStream2!8 () BitStream!3448)

(declare-fun bitStream1!8 () BitStream!3448)

(assert (=> b!92366 (= res!76251 (and (= (buf!2333 bitStream1!8) (buf!2333 bitStream2!8)) (= (buf!2333 bitStream1!8) (buf!2333 base!8))))))

(declare-fun b!92367 () Bool)

(declare-fun res!76249 () Bool)

(assert (=> b!92367 (=> (not res!76249) (not e!60721))))

(assert (=> b!92367 (= res!76249 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1955 (buf!2333 bitStream1!8)) (currentByte!4652 bitStream1!8) (currentBit!4647 bitStream1!8))) (bitIndex!0 (size!1955 (buf!2333 bitStream2!8)) (currentByte!4652 bitStream2!8) (currentBit!4647 bitStream2!8))))))

(declare-fun b!92368 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!92368 (= e!60721 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4647 bitStream1!8))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4652 bitStream1!8))) ((_ extract 31 0) ((_ sign_extend 32) (size!1955 (buf!2333 bitStream1!8)))))))))

(declare-fun b!92369 () Bool)

(declare-fun e!60720 () Bool)

(declare-fun array_inv!1789 (array!4323) Bool)

(assert (=> b!92369 (= e!60720 (array_inv!1789 (buf!2333 base!8)))))

(declare-fun b!92370 () Bool)

(declare-fun res!76253 () Bool)

(assert (=> b!92370 (=> (not res!76253) (not e!60721))))

(declare-datatypes ((List!830 0))(
  ( (Nil!827) (Cons!826 (h!945 Bool) (t!1580 List!830)) )
))
(declare-fun listBits!13 () List!830)

(declare-fun length!421 (List!830) Int)

(assert (=> b!92370 (= res!76253 (> (length!421 listBits!13) 0))))

(declare-fun res!76245 () Bool)

(assert (=> start!18618 (=> (not res!76245) (not e!60721))))

(assert (=> start!18618 (= res!76245 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18618 e!60721))

(assert (=> start!18618 true))

(declare-fun e!60722 () Bool)

(declare-fun inv!12 (BitStream!3448) Bool)

(assert (=> start!18618 (and (inv!12 bitStream1!8) e!60722)))

(declare-fun e!60723 () Bool)

(assert (=> start!18618 (and (inv!12 bitStream2!8) e!60723)))

(assert (=> start!18618 (and (inv!12 base!8) e!60720)))

(declare-fun b!92371 () Bool)

(declare-fun res!76250 () Bool)

(assert (=> b!92371 (=> (not res!76250) (not e!60721))))

(declare-fun isPrefixOf!0 (BitStream!3448 BitStream!3448) Bool)

(assert (=> b!92371 (= res!76250 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!92372 () Bool)

(declare-fun res!76247 () Bool)

(assert (=> b!92372 (=> (not res!76247) (not e!60721))))

(assert (=> b!92372 (= res!76247 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!92373 () Bool)

(assert (=> b!92373 (= e!60723 (array_inv!1789 (buf!2333 bitStream2!8)))))

(declare-fun b!92374 () Bool)

(declare-fun res!76246 () Bool)

(assert (=> b!92374 (=> (not res!76246) (not e!60721))))

(assert (=> b!92374 (= res!76246 (and (bvsle ((_ sign_extend 32) (size!1955 (buf!2333 bitStream1!8))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4652 bitStream1!8)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4647 bitStream1!8)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!1955 (buf!2333 bitStream1!8))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4652 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4647 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!92375 () Bool)

(declare-fun res!76248 () Bool)

(assert (=> b!92375 (=> (not res!76248) (not e!60721))))

(assert (=> b!92375 (= res!76248 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!92376 () Bool)

(assert (=> b!92376 (= e!60722 (array_inv!1789 (buf!2333 bitStream1!8)))))

(assert (= (and start!18618 res!76245) b!92370))

(assert (= (and b!92370 res!76253) b!92371))

(assert (= (and b!92371 res!76250) b!92372))

(assert (= (and b!92372 res!76247) b!92375))

(assert (= (and b!92375 res!76248) b!92366))

(assert (= (and b!92366 res!76251) b!92365))

(assert (= (and b!92365 res!76252) b!92367))

(assert (= (and b!92367 res!76249) b!92374))

(assert (= (and b!92374 res!76246) b!92368))

(assert (= start!18618 b!92376))

(assert (= start!18618 b!92373))

(assert (= start!18618 b!92369))

(declare-fun m!136361 () Bool)

(assert (=> b!92373 m!136361))

(declare-fun m!136363 () Bool)

(assert (=> b!92370 m!136363))

(declare-fun m!136365 () Bool)

(assert (=> b!92367 m!136365))

(declare-fun m!136367 () Bool)

(assert (=> b!92367 m!136367))

(declare-fun m!136369 () Bool)

(assert (=> b!92369 m!136369))

(declare-fun m!136371 () Bool)

(assert (=> b!92365 m!136371))

(declare-fun m!136373 () Bool)

(assert (=> b!92375 m!136373))

(declare-fun m!136375 () Bool)

(assert (=> b!92371 m!136375))

(declare-fun m!136377 () Bool)

(assert (=> start!18618 m!136377))

(declare-fun m!136379 () Bool)

(assert (=> start!18618 m!136379))

(declare-fun m!136381 () Bool)

(assert (=> start!18618 m!136381))

(declare-fun m!136383 () Bool)

(assert (=> b!92372 m!136383))

(declare-fun m!136385 () Bool)

(assert (=> b!92368 m!136385))

(declare-fun m!136387 () Bool)

(assert (=> b!92376 m!136387))

(push 1)

(assert (not b!92372))

(assert (not b!92373))

(assert (not b!92367))

(assert (not b!92376))

(assert (not b!92370))

(assert (not start!18618))

(assert (not b!92369))

(assert (not b!92368))

(assert (not b!92365))

(assert (not b!92375))

(assert (not b!92371))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!28828 () Bool)

(declare-fun e!60786 () Bool)

(assert (=> d!28828 e!60786))

(declare-fun res!76337 () Bool)

(assert (=> d!28828 (=> (not res!76337) (not e!60786))))

(declare-fun lt!138184 () (_ BitVec 64))

(declare-fun lt!138185 () (_ BitVec 64))

(declare-fun lt!138183 () (_ BitVec 64))

(assert (=> d!28828 (= res!76337 (= lt!138184 (bvsub lt!138183 lt!138185)))))

(assert (=> d!28828 (or (= (bvand lt!138183 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138185 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138183 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138183 lt!138185) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!28828 (= lt!138185 (remainingBits!0 ((_ sign_extend 32) (size!1955 (buf!2333 base!8))) ((_ sign_extend 32) (currentByte!4652 base!8)) ((_ sign_extend 32) (currentBit!4647 base!8))))))

(declare-fun lt!138182 () (_ BitVec 64))

(declare-fun lt!138186 () (_ BitVec 64))

(assert (=> d!28828 (= lt!138183 (bvmul lt!138182 lt!138186))))

(assert (=> d!28828 (or (= lt!138182 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138186 (bvsdiv (bvmul lt!138182 lt!138186) lt!138182)))))

(assert (=> d!28828 (= lt!138186 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28828 (= lt!138182 ((_ sign_extend 32) (size!1955 (buf!2333 base!8))))))

(assert (=> d!28828 (= lt!138184 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4652 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4647 base!8))))))

(assert (=> d!28828 (invariant!0 (currentBit!4647 base!8) (currentByte!4652 base!8) (size!1955 (buf!2333 base!8)))))

(assert (=> d!28828 (= (bitIndex!0 (size!1955 (buf!2333 base!8)) (currentByte!4652 base!8) (currentBit!4647 base!8)) lt!138184)))

(declare-fun b!92478 () Bool)

(declare-fun res!76338 () Bool)

(assert (=> b!92478 (=> (not res!76338) (not e!60786))))

(assert (=> b!92478 (= res!76338 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138184))))

(declare-fun b!92479 () Bool)

(declare-fun lt!138181 () (_ BitVec 64))

(assert (=> b!92479 (= e!60786 (bvsle lt!138184 (bvmul lt!138181 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!92479 (or (= lt!138181 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138181 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138181)))))

(assert (=> b!92479 (= lt!138181 ((_ sign_extend 32) (size!1955 (buf!2333 base!8))))))

(assert (= (and d!28828 res!76337) b!92478))

(assert (= (and b!92478 res!76338) b!92479))

(declare-fun m!136465 () Bool)

(assert (=> d!28828 m!136465))

(declare-fun m!136467 () Bool)

(assert (=> d!28828 m!136467))

(assert (=> b!92365 d!28828))

(declare-fun d!28830 () Bool)

(assert (=> d!28830 (= (array_inv!1789 (buf!2333 bitStream1!8)) (bvsge (size!1955 (buf!2333 bitStream1!8)) #b00000000000000000000000000000000))))

(assert (=> b!92376 d!28830))

(declare-fun d!28834 () Bool)

(declare-fun res!76351 () Bool)

(declare-fun e!60796 () Bool)

(assert (=> d!28834 (=> (not res!76351) (not e!60796))))

(assert (=> d!28834 (= res!76351 (= (size!1955 (buf!2333 bitStream1!8)) (size!1955 (buf!2333 bitStream2!8))))))

(assert (=> d!28834 (= (isPrefixOf!0 bitStream1!8 bitStream2!8) e!60796)))

(declare-fun b!92492 () Bool)

(declare-fun res!76353 () Bool)

(assert (=> b!92492 (=> (not res!76353) (not e!60796))))

(assert (=> b!92492 (= res!76353 (bvsle (bitIndex!0 (size!1955 (buf!2333 bitStream1!8)) (currentByte!4652 bitStream1!8) (currentBit!4647 bitStream1!8)) (bitIndex!0 (size!1955 (buf!2333 bitStream2!8)) (currentByte!4652 bitStream2!8) (currentBit!4647 bitStream2!8))))))

(declare-fun b!92493 () Bool)

(declare-fun e!60795 () Bool)

(assert (=> b!92493 (= e!60796 e!60795)))

(declare-fun res!76352 () Bool)

(assert (=> b!92493 (=> res!76352 e!60795)))

(assert (=> b!92493 (= res!76352 (= (size!1955 (buf!2333 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!92494 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4323 array!4323 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!92494 (= e!60795 (arrayBitRangesEq!0 (buf!2333 bitStream1!8) (buf!2333 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1955 (buf!2333 bitStream1!8)) (currentByte!4652 bitStream1!8) (currentBit!4647 bitStream1!8))))))

(assert (= (and d!28834 res!76351) b!92492))

(assert (= (and b!92492 res!76353) b!92493))

(assert (= (and b!92493 (not res!76352)) b!92494))

(assert (=> b!92492 m!136365))

(assert (=> b!92492 m!136367))

(assert (=> b!92494 m!136365))

(assert (=> b!92494 m!136365))

(declare-fun m!136475 () Bool)

(assert (=> b!92494 m!136475))

(assert (=> b!92375 d!28834))

(declare-fun d!28844 () Bool)

(declare-fun size!1959 (List!830) Int)

(assert (=> d!28844 (= (length!421 listBits!13) (size!1959 listBits!13))))

(declare-fun bs!7101 () Bool)

(assert (= bs!7101 d!28844))

(declare-fun m!136477 () Bool)

(assert (=> bs!7101 m!136477))

(assert (=> b!92370 d!28844))

(declare-fun d!28846 () Bool)

(assert (=> d!28846 (= (array_inv!1789 (buf!2333 base!8)) (bvsge (size!1955 (buf!2333 base!8)) #b00000000000000000000000000000000))))

(assert (=> b!92369 d!28846))

(declare-fun d!28848 () Bool)

(assert (=> d!28848 (= (array_inv!1789 (buf!2333 bitStream2!8)) (bvsge (size!1955 (buf!2333 bitStream2!8)) #b00000000000000000000000000000000))))

(assert (=> b!92373 d!28848))

(declare-fun d!28850 () Bool)

(assert (=> d!28850 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4647 bitStream1!8))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4652 bitStream1!8))) ((_ extract 31 0) ((_ sign_extend 32) (size!1955 (buf!2333 bitStream1!8))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4647 bitStream1!8))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4647 bitStream1!8))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4652 bitStream1!8))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4652 bitStream1!8))) ((_ extract 31 0) ((_ sign_extend 32) (size!1955 (buf!2333 bitStream1!8))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4647 bitStream1!8))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4652 bitStream1!8))) ((_ extract 31 0) ((_ sign_extend 32) (size!1955 (buf!2333 bitStream1!8)))))))))))

(assert (=> b!92368 d!28850))

(declare-fun d!28854 () Bool)

(declare-fun e!60799 () Bool)

(assert (=> d!28854 e!60799))

(declare-fun res!76357 () Bool)

(assert (=> d!28854 (=> (not res!76357) (not e!60799))))

(declare-fun lt!138190 () (_ BitVec 64))

(declare-fun lt!138189 () (_ BitVec 64))

(declare-fun lt!138191 () (_ BitVec 64))

(assert (=> d!28854 (= res!76357 (= lt!138190 (bvsub lt!138189 lt!138191)))))

(assert (=> d!28854 (or (= (bvand lt!138189 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138191 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138189 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138189 lt!138191) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28854 (= lt!138191 (remainingBits!0 ((_ sign_extend 32) (size!1955 (buf!2333 bitStream1!8))) ((_ sign_extend 32) (currentByte!4652 bitStream1!8)) ((_ sign_extend 32) (currentBit!4647 bitStream1!8))))))

(declare-fun lt!138188 () (_ BitVec 64))

(declare-fun lt!138192 () (_ BitVec 64))

(assert (=> d!28854 (= lt!138189 (bvmul lt!138188 lt!138192))))

(assert (=> d!28854 (or (= lt!138188 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138192 (bvsdiv (bvmul lt!138188 lt!138192) lt!138188)))))

(assert (=> d!28854 (= lt!138192 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28854 (= lt!138188 ((_ sign_extend 32) (size!1955 (buf!2333 bitStream1!8))))))

(assert (=> d!28854 (= lt!138190 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4652 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4647 bitStream1!8))))))

(assert (=> d!28854 (invariant!0 (currentBit!4647 bitStream1!8) (currentByte!4652 bitStream1!8) (size!1955 (buf!2333 bitStream1!8)))))

(assert (=> d!28854 (= (bitIndex!0 (size!1955 (buf!2333 bitStream1!8)) (currentByte!4652 bitStream1!8) (currentBit!4647 bitStream1!8)) lt!138190)))

(declare-fun b!92498 () Bool)

(declare-fun res!76358 () Bool)

(assert (=> b!92498 (=> (not res!76358) (not e!60799))))

(assert (=> b!92498 (= res!76358 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138190))))

(declare-fun b!92499 () Bool)

(declare-fun lt!138187 () (_ BitVec 64))

(assert (=> b!92499 (= e!60799 (bvsle lt!138190 (bvmul lt!138187 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!92499 (or (= lt!138187 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138187 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138187)))))

(assert (=> b!92499 (= lt!138187 ((_ sign_extend 32) (size!1955 (buf!2333 bitStream1!8))))))

(assert (= (and d!28854 res!76357) b!92498))

(assert (= (and b!92498 res!76358) b!92499))

(declare-fun m!136481 () Bool)

(assert (=> d!28854 m!136481))

(declare-fun m!136483 () Bool)

(assert (=> d!28854 m!136483))

(assert (=> b!92367 d!28854))

(declare-fun d!28856 () Bool)

(declare-fun e!60800 () Bool)

(assert (=> d!28856 e!60800))

(declare-fun res!76359 () Bool)

(assert (=> d!28856 (=> (not res!76359) (not e!60800))))

(declare-fun lt!138195 () (_ BitVec 64))

(declare-fun lt!138197 () (_ BitVec 64))

(declare-fun lt!138196 () (_ BitVec 64))

(assert (=> d!28856 (= res!76359 (= lt!138196 (bvsub lt!138195 lt!138197)))))

(assert (=> d!28856 (or (= (bvand lt!138195 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138197 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138195 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138195 lt!138197) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28856 (= lt!138197 (remainingBits!0 ((_ sign_extend 32) (size!1955 (buf!2333 bitStream2!8))) ((_ sign_extend 32) (currentByte!4652 bitStream2!8)) ((_ sign_extend 32) (currentBit!4647 bitStream2!8))))))

(declare-fun lt!138194 () (_ BitVec 64))

(declare-fun lt!138198 () (_ BitVec 64))

(assert (=> d!28856 (= lt!138195 (bvmul lt!138194 lt!138198))))

(assert (=> d!28856 (or (= lt!138194 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138198 (bvsdiv (bvmul lt!138194 lt!138198) lt!138194)))))

(assert (=> d!28856 (= lt!138198 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28856 (= lt!138194 ((_ sign_extend 32) (size!1955 (buf!2333 bitStream2!8))))))

(assert (=> d!28856 (= lt!138196 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4652 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4647 bitStream2!8))))))

(assert (=> d!28856 (invariant!0 (currentBit!4647 bitStream2!8) (currentByte!4652 bitStream2!8) (size!1955 (buf!2333 bitStream2!8)))))

(assert (=> d!28856 (= (bitIndex!0 (size!1955 (buf!2333 bitStream2!8)) (currentByte!4652 bitStream2!8) (currentBit!4647 bitStream2!8)) lt!138196)))

(declare-fun b!92500 () Bool)

(declare-fun res!76360 () Bool)

(assert (=> b!92500 (=> (not res!76360) (not e!60800))))

(assert (=> b!92500 (= res!76360 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138196))))

(declare-fun b!92501 () Bool)

(declare-fun lt!138193 () (_ BitVec 64))

(assert (=> b!92501 (= e!60800 (bvsle lt!138196 (bvmul lt!138193 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!92501 (or (= lt!138193 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138193 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138193)))))

(assert (=> b!92501 (= lt!138193 ((_ sign_extend 32) (size!1955 (buf!2333 bitStream2!8))))))

(assert (= (and d!28856 res!76359) b!92500))

(assert (= (and b!92500 res!76360) b!92501))

(declare-fun m!136485 () Bool)

(assert (=> d!28856 m!136485))

(declare-fun m!136487 () Bool)

(assert (=> d!28856 m!136487))

(assert (=> b!92367 d!28856))

(declare-fun d!28860 () Bool)

(assert (=> d!28860 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4647 bitStream1!8) (currentByte!4652 bitStream1!8) (size!1955 (buf!2333 bitStream1!8))))))

(declare-fun bs!7102 () Bool)

(assert (= bs!7102 d!28860))

(assert (=> bs!7102 m!136483))

(assert (=> start!18618 d!28860))

(declare-fun d!28866 () Bool)

(assert (=> d!28866 (= (inv!12 bitStream2!8) (invariant!0 (currentBit!4647 bitStream2!8) (currentByte!4652 bitStream2!8) (size!1955 (buf!2333 bitStream2!8))))))

(declare-fun bs!7103 () Bool)

(assert (= bs!7103 d!28866))

(assert (=> bs!7103 m!136487))

(assert (=> start!18618 d!28866))

(declare-fun d!28868 () Bool)

(assert (=> d!28868 (= (inv!12 base!8) (invariant!0 (currentBit!4647 base!8) (currentByte!4652 base!8) (size!1955 (buf!2333 base!8))))))

(declare-fun bs!7104 () Bool)

(assert (= bs!7104 d!28868))

(assert (=> bs!7104 m!136467))

(assert (=> start!18618 d!28868))

(declare-fun d!28870 () Bool)

(declare-fun res!76367 () Bool)

(declare-fun e!60806 () Bool)

(assert (=> d!28870 (=> (not res!76367) (not e!60806))))

(assert (=> d!28870 (= res!76367 (= (size!1955 (buf!2333 bitStream2!8)) (size!1955 (buf!2333 base!8))))))

(assert (=> d!28870 (= (isPrefixOf!0 bitStream2!8 base!8) e!60806)))

(declare-fun b!92508 () Bool)

(declare-fun res!76369 () Bool)

(assert (=> b!92508 (=> (not res!76369) (not e!60806))))

(assert (=> b!92508 (= res!76369 (bvsle (bitIndex!0 (size!1955 (buf!2333 bitStream2!8)) (currentByte!4652 bitStream2!8) (currentBit!4647 bitStream2!8)) (bitIndex!0 (size!1955 (buf!2333 base!8)) (currentByte!4652 base!8) (currentBit!4647 base!8))))))

(declare-fun b!92509 () Bool)

(declare-fun e!60805 () Bool)

(assert (=> b!92509 (= e!60806 e!60805)))

(declare-fun res!76368 () Bool)

(assert (=> b!92509 (=> res!76368 e!60805)))

(assert (=> b!92509 (= res!76368 (= (size!1955 (buf!2333 bitStream2!8)) #b00000000000000000000000000000000))))

(declare-fun b!92510 () Bool)

(assert (=> b!92510 (= e!60805 (arrayBitRangesEq!0 (buf!2333 bitStream2!8) (buf!2333 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1955 (buf!2333 bitStream2!8)) (currentByte!4652 bitStream2!8) (currentBit!4647 bitStream2!8))))))

(assert (= (and d!28870 res!76367) b!92508))

(assert (= (and b!92508 res!76369) b!92509))

(assert (= (and b!92509 (not res!76368)) b!92510))

(assert (=> b!92508 m!136367))

(assert (=> b!92508 m!136371))

(assert (=> b!92510 m!136367))

(assert (=> b!92510 m!136367))

(declare-fun m!136493 () Bool)

(assert (=> b!92510 m!136493))

(assert (=> b!92372 d!28870))

(declare-fun d!28872 () Bool)

(declare-fun res!76370 () Bool)

(declare-fun e!60808 () Bool)

(assert (=> d!28872 (=> (not res!76370) (not e!60808))))

(assert (=> d!28872 (= res!76370 (= (size!1955 (buf!2333 bitStream1!8)) (size!1955 (buf!2333 base!8))))))

(assert (=> d!28872 (= (isPrefixOf!0 bitStream1!8 base!8) e!60808)))

(declare-fun b!92511 () Bool)

(declare-fun res!76372 () Bool)

(assert (=> b!92511 (=> (not res!76372) (not e!60808))))

(assert (=> b!92511 (= res!76372 (bvsle (bitIndex!0 (size!1955 (buf!2333 bitStream1!8)) (currentByte!4652 bitStream1!8) (currentBit!4647 bitStream1!8)) (bitIndex!0 (size!1955 (buf!2333 base!8)) (currentByte!4652 base!8) (currentBit!4647 base!8))))))

(declare-fun b!92512 () Bool)

(declare-fun e!60807 () Bool)

(assert (=> b!92512 (= e!60808 e!60807)))

(declare-fun res!76371 () Bool)

(assert (=> b!92512 (=> res!76371 e!60807)))

(assert (=> b!92512 (= res!76371 (= (size!1955 (buf!2333 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!92513 () Bool)

(assert (=> b!92513 (= e!60807 (arrayBitRangesEq!0 (buf!2333 bitStream1!8) (buf!2333 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1955 (buf!2333 bitStream1!8)) (currentByte!4652 bitStream1!8) (currentBit!4647 bitStream1!8))))))

(assert (= (and d!28872 res!76370) b!92511))

(assert (= (and b!92511 res!76372) b!92512))

(assert (= (and b!92512 (not res!76371)) b!92513))

(assert (=> b!92511 m!136365))

(assert (=> b!92511 m!136371))

(assert (=> b!92513 m!136365))

(assert (=> b!92513 m!136365))

(declare-fun m!136495 () Bool)

(assert (=> b!92513 m!136495))

(assert (=> b!92371 d!28872))

(push 1)

(assert (not d!28856))

(assert (not b!92508))

(assert (not d!28860))

(assert (not b!92492))

(assert (not d!28844))

(assert (not d!28854))

(assert (not b!92513))

(assert (not b!92510))

(assert (not d!28828))

(assert (not b!92494))

(assert (not b!92511))

(assert (not d!28868))

(assert (not d!28866))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

