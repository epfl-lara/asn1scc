; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19222 () Bool)

(assert start!19222)

(declare-fun b!96353 () Bool)

(declare-fun e!63107 () Bool)

(declare-datatypes ((array!4493 0))(
  ( (array!4494 (arr!2650 (Array (_ BitVec 32) (_ BitVec 8))) (size!2054 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3588 0))(
  ( (BitStream!3589 (buf!2403 array!4493) (currentByte!4791 (_ BitVec 32)) (currentBit!4786 (_ BitVec 32))) )
))
(declare-fun bitStream2!8 () BitStream!3588)

(declare-fun array_inv!1859 (array!4493) Bool)

(assert (=> b!96353 (= e!63107 (array_inv!1859 (buf!2403 bitStream2!8)))))

(declare-fun res!79204 () Bool)

(declare-fun e!63101 () Bool)

(assert (=> start!19222 (=> (not res!79204) (not e!63101))))

(declare-fun nBits!484 () (_ BitVec 64))

(assert (=> start!19222 (= res!79204 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!19222 e!63101))

(assert (=> start!19222 true))

(declare-fun bitStream1!8 () BitStream!3588)

(declare-fun e!63105 () Bool)

(declare-fun inv!12 (BitStream!3588) Bool)

(assert (=> start!19222 (and (inv!12 bitStream1!8) e!63105)))

(assert (=> start!19222 (and (inv!12 bitStream2!8) e!63107)))

(declare-fun base!8 () BitStream!3588)

(declare-fun e!63102 () Bool)

(assert (=> start!19222 (and (inv!12 base!8) e!63102)))

(declare-fun thiss!1534 () BitStream!3588)

(declare-fun e!63103 () Bool)

(assert (=> start!19222 (and (inv!12 thiss!1534) e!63103)))

(declare-fun b!96354 () Bool)

(declare-fun res!79207 () Bool)

(assert (=> b!96354 (=> (not res!79207) (not e!63101))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!96354 (= res!79207 (validate_offset_bits!1 ((_ sign_extend 32) (size!2054 (buf!2403 bitStream2!8))) ((_ sign_extend 32) (currentByte!4791 bitStream2!8)) ((_ sign_extend 32) (currentBit!4786 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!96355 () Bool)

(declare-fun res!79200 () Bool)

(assert (=> b!96355 (=> (not res!79200) (not e!63101))))

(declare-datatypes ((List!900 0))(
  ( (Nil!897) (Cons!896 (h!1015 Bool) (t!1650 List!900)) )
))
(declare-fun listBits!13 () List!900)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!3588 BitStream!3588 (_ BitVec 64)) List!900)

(assert (=> b!96355 (= res!79200 (= listBits!13 (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484)))))

(declare-fun b!96356 () Bool)

(declare-fun res!79199 () Bool)

(assert (=> b!96356 (=> (not res!79199) (not e!63101))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!96356 (= res!79199 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2054 (buf!2403 bitStream1!8)) (currentByte!4791 bitStream1!8) (currentBit!4786 bitStream1!8))) (bitIndex!0 (size!2054 (buf!2403 bitStream2!8)) (currentByte!4791 bitStream2!8) (currentBit!4786 bitStream2!8))))))

(declare-fun b!96357 () Bool)

(declare-fun res!79206 () Bool)

(assert (=> b!96357 (=> (not res!79206) (not e!63101))))

(assert (=> b!96357 (= res!79206 (not (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!96358 () Bool)

(declare-fun res!79205 () Bool)

(assert (=> b!96358 (=> (not res!79205) (not e!63101))))

(declare-fun isPrefixOf!0 (BitStream!3588 BitStream!3588) Bool)

(assert (=> b!96358 (= res!79205 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!96359 () Bool)

(declare-fun res!79203 () Bool)

(assert (=> b!96359 (=> (not res!79203) (not e!63101))))

(assert (=> b!96359 (= res!79203 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!96360 () Bool)

(declare-fun res!79201 () Bool)

(assert (=> b!96360 (=> (not res!79201) (not e!63101))))

(assert (=> b!96360 (= res!79201 (bvslt (bitIndex!0 (size!2054 (buf!2403 base!8)) (currentByte!4791 base!8) (currentBit!4786 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!96361 () Bool)

(declare-fun res!79210 () Bool)

(assert (=> b!96361 (=> (not res!79210) (not e!63101))))

(declare-datatypes ((tuple2!7726 0))(
  ( (tuple2!7727 (_1!4112 BitStream!3588) (_2!4112 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!3588) tuple2!7726)

(declare-fun head!597 (List!900) Bool)

(assert (=> b!96361 (= res!79210 (= (_2!4112 (readBitPure!0 bitStream1!8)) (head!597 listBits!13)))))

(declare-fun b!96362 () Bool)

(declare-fun res!79208 () Bool)

(assert (=> b!96362 (=> (not res!79208) (not e!63101))))

(assert (=> b!96362 (= res!79208 (validate_offset_bits!1 ((_ sign_extend 32) (size!2054 (buf!2403 bitStream1!8))) ((_ sign_extend 32) (currentByte!4791 bitStream1!8)) ((_ sign_extend 32) (currentBit!4786 bitStream1!8)) nBits!484))))

(declare-fun b!96363 () Bool)

(declare-fun res!79209 () Bool)

(assert (=> b!96363 (=> (not res!79209) (not e!63101))))

(assert (=> b!96363 (= res!79209 (and (= (buf!2403 bitStream1!8) (buf!2403 bitStream2!8)) (= (buf!2403 bitStream1!8) (buf!2403 base!8))))))

(declare-fun b!96364 () Bool)

(assert (=> b!96364 (= e!63102 (array_inv!1859 (buf!2403 base!8)))))

(declare-fun b!96365 () Bool)

(assert (=> b!96365 (= e!63105 (array_inv!1859 (buf!2403 bitStream1!8)))))

(declare-fun b!96366 () Bool)

(declare-fun res!79202 () Bool)

(assert (=> b!96366 (=> (not res!79202) (not e!63101))))

(declare-fun length!491 (List!900) Int)

(assert (=> b!96366 (= res!79202 (> (length!491 listBits!13) 0))))

(declare-fun b!96367 () Bool)

(assert (=> b!96367 (= e!63103 (array_inv!1859 (buf!2403 thiss!1534)))))

(declare-fun b!96368 () Bool)

(declare-fun res!79198 () Bool)

(assert (=> b!96368 (=> (not res!79198) (not e!63101))))

(assert (=> b!96368 (= res!79198 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!96369 () Bool)

(declare-fun tail!376 (List!900) List!900)

(assert (=> b!96369 (= e!63101 (not (= (bitStreamReadBitsIntoList!0 thiss!1534 bitStream2!8 (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!376 listBits!13))))))

(assert (= (and start!19222 res!79204) b!96366))

(assert (= (and b!96366 res!79202) b!96368))

(assert (= (and b!96368 res!79198) b!96359))

(assert (= (and b!96359 res!79203) b!96358))

(assert (= (and b!96358 res!79205) b!96363))

(assert (= (and b!96363 res!79209) b!96360))

(assert (= (and b!96360 res!79201) b!96356))

(assert (= (and b!96356 res!79199) b!96362))

(assert (= (and b!96362 res!79208) b!96354))

(assert (= (and b!96354 res!79207) b!96355))

(assert (= (and b!96355 res!79200) b!96357))

(assert (= (and b!96357 res!79206) b!96361))

(assert (= (and b!96361 res!79210) b!96369))

(assert (= start!19222 b!96365))

(assert (= start!19222 b!96353))

(assert (= start!19222 b!96364))

(assert (= start!19222 b!96367))

(declare-fun m!139683 () Bool)

(assert (=> start!19222 m!139683))

(declare-fun m!139685 () Bool)

(assert (=> start!19222 m!139685))

(declare-fun m!139687 () Bool)

(assert (=> start!19222 m!139687))

(declare-fun m!139689 () Bool)

(assert (=> start!19222 m!139689))

(declare-fun m!139691 () Bool)

(assert (=> b!96367 m!139691))

(declare-fun m!139693 () Bool)

(assert (=> b!96364 m!139693))

(declare-fun m!139695 () Bool)

(assert (=> b!96366 m!139695))

(declare-fun m!139697 () Bool)

(assert (=> b!96354 m!139697))

(declare-fun m!139699 () Bool)

(assert (=> b!96368 m!139699))

(declare-fun m!139701 () Bool)

(assert (=> b!96355 m!139701))

(declare-fun m!139703 () Bool)

(assert (=> b!96356 m!139703))

(declare-fun m!139705 () Bool)

(assert (=> b!96356 m!139705))

(declare-fun m!139707 () Bool)

(assert (=> b!96362 m!139707))

(declare-fun m!139709 () Bool)

(assert (=> b!96360 m!139709))

(declare-fun m!139711 () Bool)

(assert (=> b!96369 m!139711))

(declare-fun m!139713 () Bool)

(assert (=> b!96369 m!139713))

(declare-fun m!139715 () Bool)

(assert (=> b!96361 m!139715))

(declare-fun m!139717 () Bool)

(assert (=> b!96361 m!139717))

(declare-fun m!139719 () Bool)

(assert (=> b!96358 m!139719))

(declare-fun m!139721 () Bool)

(assert (=> b!96359 m!139721))

(declare-fun m!139723 () Bool)

(assert (=> b!96353 m!139723))

(declare-fun m!139725 () Bool)

(assert (=> b!96365 m!139725))

(check-sat (not b!96362) (not b!96361) (not b!96354) (not b!96355) (not b!96364) (not b!96358) (not start!19222) (not b!96367) (not b!96356) (not b!96359) (not b!96365) (not b!96366) (not b!96360) (not b!96368) (not b!96369) (not b!96353))
(check-sat)
(get-model)

(declare-fun lt!139429 () (_ BitVec 64))

(declare-datatypes ((tuple2!7730 0))(
  ( (tuple2!7731 (_1!4114 List!900) (_2!4114 BitStream!3588)) )
))
(declare-fun e!63140 () tuple2!7730)

(declare-fun b!96430 () Bool)

(declare-datatypes ((tuple2!7732 0))(
  ( (tuple2!7733 (_1!4115 Bool) (_2!4115 BitStream!3588)) )
))
(declare-fun lt!139428 () tuple2!7732)

(assert (=> b!96430 (= e!63140 (tuple2!7731 (Cons!896 (_1!4115 lt!139428) (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4115 lt!139428) (bvsub nBits!484 lt!139429))) (_2!4115 lt!139428)))))

(declare-fun readBit!0 (BitStream!3588) tuple2!7732)

(assert (=> b!96430 (= lt!139428 (readBit!0 bitStream1!8))))

(assert (=> b!96430 (= lt!139429 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!96429 () Bool)

(assert (=> b!96429 (= e!63140 (tuple2!7731 Nil!897 bitStream1!8))))

(declare-fun b!96432 () Bool)

(declare-fun e!63141 () Bool)

(declare-fun lt!139430 () List!900)

(assert (=> b!96432 (= e!63141 (> (length!491 lt!139430) 0))))

(declare-fun d!29962 () Bool)

(assert (=> d!29962 e!63141))

(declare-fun c!6044 () Bool)

(assert (=> d!29962 (= c!6044 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!29962 (= lt!139430 (_1!4114 e!63140))))

(declare-fun c!6045 () Bool)

(assert (=> d!29962 (= c!6045 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!29962 (bvsge nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!29962 (= (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484) lt!139430)))

(declare-fun b!96431 () Bool)

(declare-fun isEmpty!265 (List!900) Bool)

(assert (=> b!96431 (= e!63141 (isEmpty!265 lt!139430))))

(assert (= (and d!29962 c!6045) b!96429))

(assert (= (and d!29962 (not c!6045)) b!96430))

(assert (= (and d!29962 c!6044) b!96431))

(assert (= (and d!29962 (not c!6044)) b!96432))

(declare-fun m!139771 () Bool)

(assert (=> b!96430 m!139771))

(declare-fun m!139773 () Bool)

(assert (=> b!96430 m!139773))

(declare-fun m!139775 () Bool)

(assert (=> b!96432 m!139775))

(declare-fun m!139777 () Bool)

(assert (=> b!96431 m!139777))

(assert (=> b!96355 d!29962))

(declare-fun d!29964 () Bool)

(declare-fun size!2056 (List!900) Int)

(assert (=> d!29964 (= (length!491 listBits!13) (size!2056 listBits!13))))

(declare-fun bs!7356 () Bool)

(assert (= bs!7356 d!29964))

(declare-fun m!139779 () Bool)

(assert (=> bs!7356 m!139779))

(assert (=> b!96366 d!29964))

(declare-fun d!29966 () Bool)

(assert (=> d!29966 (= (array_inv!1859 (buf!2403 bitStream1!8)) (bvsge (size!2054 (buf!2403 bitStream1!8)) #b00000000000000000000000000000000))))

(assert (=> b!96365 d!29966))

(declare-fun d!29968 () Bool)

(assert (=> d!29968 (= (array_inv!1859 (buf!2403 thiss!1534)) (bvsge (size!2054 (buf!2403 thiss!1534)) #b00000000000000000000000000000000))))

(assert (=> b!96367 d!29968))

(declare-fun d!29970 () Bool)

(declare-fun e!63144 () Bool)

(assert (=> d!29970 e!63144))

(declare-fun res!79254 () Bool)

(assert (=> d!29970 (=> (not res!79254) (not e!63144))))

(declare-fun lt!139443 () (_ BitVec 64))

(declare-fun lt!139446 () (_ BitVec 64))

(declare-fun lt!139448 () (_ BitVec 64))

(assert (=> d!29970 (= res!79254 (= lt!139446 (bvsub lt!139443 lt!139448)))))

(assert (=> d!29970 (or (= (bvand lt!139443 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139448 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!139443 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!139443 lt!139448) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!29970 (= lt!139448 (remainingBits!0 ((_ sign_extend 32) (size!2054 (buf!2403 bitStream1!8))) ((_ sign_extend 32) (currentByte!4791 bitStream1!8)) ((_ sign_extend 32) (currentBit!4786 bitStream1!8))))))

(declare-fun lt!139447 () (_ BitVec 64))

(declare-fun lt!139445 () (_ BitVec 64))

(assert (=> d!29970 (= lt!139443 (bvmul lt!139447 lt!139445))))

(assert (=> d!29970 (or (= lt!139447 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!139445 (bvsdiv (bvmul lt!139447 lt!139445) lt!139447)))))

(assert (=> d!29970 (= lt!139445 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29970 (= lt!139447 ((_ sign_extend 32) (size!2054 (buf!2403 bitStream1!8))))))

(assert (=> d!29970 (= lt!139446 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4791 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4786 bitStream1!8))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!29970 (invariant!0 (currentBit!4786 bitStream1!8) (currentByte!4791 bitStream1!8) (size!2054 (buf!2403 bitStream1!8)))))

(assert (=> d!29970 (= (bitIndex!0 (size!2054 (buf!2403 bitStream1!8)) (currentByte!4791 bitStream1!8) (currentBit!4786 bitStream1!8)) lt!139446)))

(declare-fun b!96437 () Bool)

(declare-fun res!79255 () Bool)

(assert (=> b!96437 (=> (not res!79255) (not e!63144))))

(assert (=> b!96437 (= res!79255 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!139446))))

(declare-fun b!96438 () Bool)

(declare-fun lt!139444 () (_ BitVec 64))

(assert (=> b!96438 (= e!63144 (bvsle lt!139446 (bvmul lt!139444 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!96438 (or (= lt!139444 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!139444 #b0000000000000000000000000000000000000000000000000000000000001000) lt!139444)))))

(assert (=> b!96438 (= lt!139444 ((_ sign_extend 32) (size!2054 (buf!2403 bitStream1!8))))))

(assert (= (and d!29970 res!79254) b!96437))

(assert (= (and b!96437 res!79255) b!96438))

(declare-fun m!139791 () Bool)

(assert (=> d!29970 m!139791))

(declare-fun m!139793 () Bool)

(assert (=> d!29970 m!139793))

(assert (=> b!96356 d!29970))

(declare-fun d!29984 () Bool)

(declare-fun e!63145 () Bool)

(assert (=> d!29984 e!63145))

(declare-fun res!79256 () Bool)

(assert (=> d!29984 (=> (not res!79256) (not e!63145))))

(declare-fun lt!139452 () (_ BitVec 64))

(declare-fun lt!139449 () (_ BitVec 64))

(declare-fun lt!139454 () (_ BitVec 64))

(assert (=> d!29984 (= res!79256 (= lt!139452 (bvsub lt!139449 lt!139454)))))

(assert (=> d!29984 (or (= (bvand lt!139449 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139454 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!139449 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!139449 lt!139454) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29984 (= lt!139454 (remainingBits!0 ((_ sign_extend 32) (size!2054 (buf!2403 bitStream2!8))) ((_ sign_extend 32) (currentByte!4791 bitStream2!8)) ((_ sign_extend 32) (currentBit!4786 bitStream2!8))))))

(declare-fun lt!139453 () (_ BitVec 64))

(declare-fun lt!139451 () (_ BitVec 64))

(assert (=> d!29984 (= lt!139449 (bvmul lt!139453 lt!139451))))

(assert (=> d!29984 (or (= lt!139453 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!139451 (bvsdiv (bvmul lt!139453 lt!139451) lt!139453)))))

(assert (=> d!29984 (= lt!139451 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29984 (= lt!139453 ((_ sign_extend 32) (size!2054 (buf!2403 bitStream2!8))))))

(assert (=> d!29984 (= lt!139452 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4791 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4786 bitStream2!8))))))

(assert (=> d!29984 (invariant!0 (currentBit!4786 bitStream2!8) (currentByte!4791 bitStream2!8) (size!2054 (buf!2403 bitStream2!8)))))

(assert (=> d!29984 (= (bitIndex!0 (size!2054 (buf!2403 bitStream2!8)) (currentByte!4791 bitStream2!8) (currentBit!4786 bitStream2!8)) lt!139452)))

(declare-fun b!96439 () Bool)

(declare-fun res!79257 () Bool)

(assert (=> b!96439 (=> (not res!79257) (not e!63145))))

(assert (=> b!96439 (= res!79257 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!139452))))

(declare-fun b!96440 () Bool)

(declare-fun lt!139450 () (_ BitVec 64))

(assert (=> b!96440 (= e!63145 (bvsle lt!139452 (bvmul lt!139450 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!96440 (or (= lt!139450 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!139450 #b0000000000000000000000000000000000000000000000000000000000001000) lt!139450)))))

(assert (=> b!96440 (= lt!139450 ((_ sign_extend 32) (size!2054 (buf!2403 bitStream2!8))))))

(assert (= (and d!29984 res!79256) b!96439))

(assert (= (and b!96439 res!79257) b!96440))

(declare-fun m!139795 () Bool)

(assert (=> d!29984 m!139795))

(declare-fun m!139797 () Bool)

(assert (=> d!29984 m!139797))

(assert (=> b!96356 d!29984))

(declare-fun d!29986 () Bool)

(assert (=> d!29986 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2054 (buf!2403 bitStream2!8))) ((_ sign_extend 32) (currentByte!4791 bitStream2!8)) ((_ sign_extend 32) (currentBit!4786 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2054 (buf!2403 bitStream2!8))) ((_ sign_extend 32) (currentByte!4791 bitStream2!8)) ((_ sign_extend 32) (currentBit!4786 bitStream2!8))) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!7362 () Bool)

(assert (= bs!7362 d!29986))

(assert (=> bs!7362 m!139795))

(assert (=> b!96354 d!29986))

(declare-fun d!29988 () Bool)

(assert (=> d!29988 (= (array_inv!1859 (buf!2403 bitStream2!8)) (bvsge (size!2054 (buf!2403 bitStream2!8)) #b00000000000000000000000000000000))))

(assert (=> b!96353 d!29988))

(declare-fun d!29990 () Bool)

(assert (=> d!29990 (= (array_inv!1859 (buf!2403 base!8)) (bvsge (size!2054 (buf!2403 base!8)) #b00000000000000000000000000000000))))

(assert (=> b!96364 d!29990))

(declare-fun d!29992 () Bool)

(declare-fun e!63146 () Bool)

(assert (=> d!29992 e!63146))

(declare-fun res!79258 () Bool)

(assert (=> d!29992 (=> (not res!79258) (not e!63146))))

(declare-fun lt!139460 () (_ BitVec 64))

(declare-fun lt!139458 () (_ BitVec 64))

(declare-fun lt!139455 () (_ BitVec 64))

(assert (=> d!29992 (= res!79258 (= lt!139458 (bvsub lt!139455 lt!139460)))))

(assert (=> d!29992 (or (= (bvand lt!139455 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139460 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!139455 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!139455 lt!139460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29992 (= lt!139460 (remainingBits!0 ((_ sign_extend 32) (size!2054 (buf!2403 base!8))) ((_ sign_extend 32) (currentByte!4791 base!8)) ((_ sign_extend 32) (currentBit!4786 base!8))))))

(declare-fun lt!139459 () (_ BitVec 64))

(declare-fun lt!139457 () (_ BitVec 64))

(assert (=> d!29992 (= lt!139455 (bvmul lt!139459 lt!139457))))

(assert (=> d!29992 (or (= lt!139459 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!139457 (bvsdiv (bvmul lt!139459 lt!139457) lt!139459)))))

(assert (=> d!29992 (= lt!139457 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29992 (= lt!139459 ((_ sign_extend 32) (size!2054 (buf!2403 base!8))))))

(assert (=> d!29992 (= lt!139458 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4791 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4786 base!8))))))

(assert (=> d!29992 (invariant!0 (currentBit!4786 base!8) (currentByte!4791 base!8) (size!2054 (buf!2403 base!8)))))

(assert (=> d!29992 (= (bitIndex!0 (size!2054 (buf!2403 base!8)) (currentByte!4791 base!8) (currentBit!4786 base!8)) lt!139458)))

(declare-fun b!96441 () Bool)

(declare-fun res!79259 () Bool)

(assert (=> b!96441 (=> (not res!79259) (not e!63146))))

(assert (=> b!96441 (= res!79259 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!139458))))

(declare-fun b!96442 () Bool)

(declare-fun lt!139456 () (_ BitVec 64))

(assert (=> b!96442 (= e!63146 (bvsle lt!139458 (bvmul lt!139456 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!96442 (or (= lt!139456 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!139456 #b0000000000000000000000000000000000000000000000000000000000001000) lt!139456)))))

(assert (=> b!96442 (= lt!139456 ((_ sign_extend 32) (size!2054 (buf!2403 base!8))))))

(assert (= (and d!29992 res!79258) b!96441))

(assert (= (and b!96441 res!79259) b!96442))

(declare-fun m!139799 () Bool)

(assert (=> d!29992 m!139799))

(declare-fun m!139801 () Bool)

(assert (=> d!29992 m!139801))

(assert (=> b!96360 d!29992))

(declare-fun d!29994 () Bool)

(assert (=> d!29994 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2054 (buf!2403 bitStream1!8))) ((_ sign_extend 32) (currentByte!4791 bitStream1!8)) ((_ sign_extend 32) (currentBit!4786 bitStream1!8)) nBits!484) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2054 (buf!2403 bitStream1!8))) ((_ sign_extend 32) (currentByte!4791 bitStream1!8)) ((_ sign_extend 32) (currentBit!4786 bitStream1!8))) nBits!484))))

(declare-fun bs!7363 () Bool)

(assert (= bs!7363 d!29994))

(assert (=> bs!7363 m!139791))

(assert (=> b!96362 d!29994))

(declare-fun d!29996 () Bool)

(declare-fun lt!139469 () tuple2!7732)

(assert (=> d!29996 (= lt!139469 (readBit!0 bitStream1!8))))

(assert (=> d!29996 (= (readBitPure!0 bitStream1!8) (tuple2!7727 (_2!4115 lt!139469) (_1!4115 lt!139469)))))

(declare-fun bs!7364 () Bool)

(assert (= bs!7364 d!29996))

(assert (=> bs!7364 m!139773))

(assert (=> b!96361 d!29996))

(declare-fun d!29998 () Bool)

(assert (=> d!29998 (= (head!597 listBits!13) (h!1015 listBits!13))))

(assert (=> b!96361 d!29998))

(declare-fun d!30004 () Bool)

(declare-fun res!79267 () Bool)

(declare-fun e!63159 () Bool)

(assert (=> d!30004 (=> (not res!79267) (not e!63159))))

(assert (=> d!30004 (= res!79267 (= (size!2054 (buf!2403 bitStream1!8)) (size!2054 (buf!2403 bitStream2!8))))))

(assert (=> d!30004 (= (isPrefixOf!0 bitStream1!8 bitStream2!8) e!63159)))

(declare-fun b!96465 () Bool)

(declare-fun res!79268 () Bool)

(assert (=> b!96465 (=> (not res!79268) (not e!63159))))

(assert (=> b!96465 (= res!79268 (bvsle (bitIndex!0 (size!2054 (buf!2403 bitStream1!8)) (currentByte!4791 bitStream1!8) (currentBit!4786 bitStream1!8)) (bitIndex!0 (size!2054 (buf!2403 bitStream2!8)) (currentByte!4791 bitStream2!8) (currentBit!4786 bitStream2!8))))))

(declare-fun b!96466 () Bool)

(declare-fun e!63160 () Bool)

(assert (=> b!96466 (= e!63159 e!63160)))

(declare-fun res!79266 () Bool)

(assert (=> b!96466 (=> res!79266 e!63160)))

(assert (=> b!96466 (= res!79266 (= (size!2054 (buf!2403 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!96467 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4493 array!4493 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!96467 (= e!63160 (arrayBitRangesEq!0 (buf!2403 bitStream1!8) (buf!2403 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2054 (buf!2403 bitStream1!8)) (currentByte!4791 bitStream1!8) (currentBit!4786 bitStream1!8))))))

(assert (= (and d!30004 res!79267) b!96465))

(assert (= (and b!96465 res!79268) b!96466))

(assert (= (and b!96466 (not res!79266)) b!96467))

(assert (=> b!96465 m!139703))

(assert (=> b!96465 m!139705))

(assert (=> b!96467 m!139703))

(assert (=> b!96467 m!139703))

(declare-fun m!139823 () Bool)

(assert (=> b!96467 m!139823))

(assert (=> b!96358 d!30004))

(declare-fun d!30016 () Bool)

(declare-fun res!79270 () Bool)

(declare-fun e!63161 () Bool)

(assert (=> d!30016 (=> (not res!79270) (not e!63161))))

(assert (=> d!30016 (= res!79270 (= (size!2054 (buf!2403 bitStream1!8)) (size!2054 (buf!2403 base!8))))))

(assert (=> d!30016 (= (isPrefixOf!0 bitStream1!8 base!8) e!63161)))

(declare-fun b!96468 () Bool)

(declare-fun res!79271 () Bool)

(assert (=> b!96468 (=> (not res!79271) (not e!63161))))

(assert (=> b!96468 (= res!79271 (bvsle (bitIndex!0 (size!2054 (buf!2403 bitStream1!8)) (currentByte!4791 bitStream1!8) (currentBit!4786 bitStream1!8)) (bitIndex!0 (size!2054 (buf!2403 base!8)) (currentByte!4791 base!8) (currentBit!4786 base!8))))))

(declare-fun b!96469 () Bool)

(declare-fun e!63162 () Bool)

(assert (=> b!96469 (= e!63161 e!63162)))

(declare-fun res!79269 () Bool)

(assert (=> b!96469 (=> res!79269 e!63162)))

(assert (=> b!96469 (= res!79269 (= (size!2054 (buf!2403 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!96470 () Bool)

(assert (=> b!96470 (= e!63162 (arrayBitRangesEq!0 (buf!2403 bitStream1!8) (buf!2403 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2054 (buf!2403 bitStream1!8)) (currentByte!4791 bitStream1!8) (currentBit!4786 bitStream1!8))))))

(assert (= (and d!30016 res!79270) b!96468))

(assert (= (and b!96468 res!79271) b!96469))

(assert (= (and b!96469 (not res!79269)) b!96470))

(assert (=> b!96468 m!139703))

(assert (=> b!96468 m!139709))

(assert (=> b!96470 m!139703))

(assert (=> b!96470 m!139703))

(declare-fun m!139825 () Bool)

(assert (=> b!96470 m!139825))

(assert (=> b!96368 d!30016))

(declare-fun d!30018 () Bool)

(declare-fun res!79279 () Bool)

(declare-fun e!63167 () Bool)

(assert (=> d!30018 (=> (not res!79279) (not e!63167))))

(assert (=> d!30018 (= res!79279 (= (size!2054 (buf!2403 bitStream2!8)) (size!2054 (buf!2403 base!8))))))

(assert (=> d!30018 (= (isPrefixOf!0 bitStream2!8 base!8) e!63167)))

(declare-fun b!96477 () Bool)

(declare-fun res!79280 () Bool)

(assert (=> b!96477 (=> (not res!79280) (not e!63167))))

(assert (=> b!96477 (= res!79280 (bvsle (bitIndex!0 (size!2054 (buf!2403 bitStream2!8)) (currentByte!4791 bitStream2!8) (currentBit!4786 bitStream2!8)) (bitIndex!0 (size!2054 (buf!2403 base!8)) (currentByte!4791 base!8) (currentBit!4786 base!8))))))

(declare-fun b!96478 () Bool)

(declare-fun e!63168 () Bool)

(assert (=> b!96478 (= e!63167 e!63168)))

(declare-fun res!79278 () Bool)

(assert (=> b!96478 (=> res!79278 e!63168)))

(assert (=> b!96478 (= res!79278 (= (size!2054 (buf!2403 bitStream2!8)) #b00000000000000000000000000000000))))

(declare-fun b!96479 () Bool)

(assert (=> b!96479 (= e!63168 (arrayBitRangesEq!0 (buf!2403 bitStream2!8) (buf!2403 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2054 (buf!2403 bitStream2!8)) (currentByte!4791 bitStream2!8) (currentBit!4786 bitStream2!8))))))

(assert (= (and d!30018 res!79279) b!96477))

(assert (= (and b!96477 res!79280) b!96478))

(assert (= (and b!96478 (not res!79278)) b!96479))

(assert (=> b!96477 m!139705))

(assert (=> b!96477 m!139709))

(assert (=> b!96479 m!139705))

(assert (=> b!96479 m!139705))

(declare-fun m!139827 () Bool)

(assert (=> b!96479 m!139827))

(assert (=> b!96359 d!30018))

(declare-fun e!63169 () tuple2!7730)

(declare-fun b!96481 () Bool)

(declare-fun lt!139476 () tuple2!7732)

(declare-fun lt!139477 () (_ BitVec 64))

(assert (=> b!96481 (= e!63169 (tuple2!7731 (Cons!896 (_1!4115 lt!139476) (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4115 lt!139476) (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139477))) (_2!4115 lt!139476)))))

(assert (=> b!96481 (= lt!139476 (readBit!0 bitStream2!8))))

(assert (=> b!96481 (= lt!139477 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!96480 () Bool)

(assert (=> b!96480 (= e!63169 (tuple2!7731 Nil!897 bitStream2!8))))

(declare-fun b!96483 () Bool)

(declare-fun e!63170 () Bool)

(declare-fun lt!139478 () List!900)

(assert (=> b!96483 (= e!63170 (> (length!491 lt!139478) 0))))

(declare-fun d!30020 () Bool)

(assert (=> d!30020 e!63170))

(declare-fun c!6054 () Bool)

(assert (=> d!30020 (= c!6054 (= (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!30020 (= lt!139478 (_1!4114 e!63169))))

(declare-fun c!6055 () Bool)

(assert (=> d!30020 (= c!6055 (= (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!30020 (bvsge (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!30020 (= (bitStreamReadBitsIntoList!0 thiss!1534 bitStream2!8 (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!139478)))

(declare-fun b!96482 () Bool)

(assert (=> b!96482 (= e!63170 (isEmpty!265 lt!139478))))

(assert (= (and d!30020 c!6055) b!96480))

(assert (= (and d!30020 (not c!6055)) b!96481))

(assert (= (and d!30020 c!6054) b!96482))

(assert (= (and d!30020 (not c!6054)) b!96483))

(declare-fun m!139829 () Bool)

(assert (=> b!96481 m!139829))

(declare-fun m!139831 () Bool)

(assert (=> b!96481 m!139831))

(declare-fun m!139833 () Bool)

(assert (=> b!96483 m!139833))

(declare-fun m!139835 () Bool)

(assert (=> b!96482 m!139835))

(assert (=> b!96369 d!30020))

(declare-fun d!30022 () Bool)

(assert (=> d!30022 (= (tail!376 listBits!13) (t!1650 listBits!13))))

(assert (=> b!96369 d!30022))

(declare-fun d!30026 () Bool)

(assert (=> d!30026 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4786 bitStream1!8) (currentByte!4791 bitStream1!8) (size!2054 (buf!2403 bitStream1!8))))))

(declare-fun bs!7367 () Bool)

(assert (= bs!7367 d!30026))

(assert (=> bs!7367 m!139793))

(assert (=> start!19222 d!30026))

(declare-fun d!30028 () Bool)

(assert (=> d!30028 (= (inv!12 bitStream2!8) (invariant!0 (currentBit!4786 bitStream2!8) (currentByte!4791 bitStream2!8) (size!2054 (buf!2403 bitStream2!8))))))

(declare-fun bs!7368 () Bool)

(assert (= bs!7368 d!30028))

(assert (=> bs!7368 m!139797))

(assert (=> start!19222 d!30028))

(declare-fun d!30030 () Bool)

(assert (=> d!30030 (= (inv!12 base!8) (invariant!0 (currentBit!4786 base!8) (currentByte!4791 base!8) (size!2054 (buf!2403 base!8))))))

(declare-fun bs!7369 () Bool)

(assert (= bs!7369 d!30030))

(assert (=> bs!7369 m!139801))

(assert (=> start!19222 d!30030))

(declare-fun d!30032 () Bool)

(assert (=> d!30032 (= (inv!12 thiss!1534) (invariant!0 (currentBit!4786 thiss!1534) (currentByte!4791 thiss!1534) (size!2054 (buf!2403 thiss!1534))))))

(declare-fun bs!7370 () Bool)

(assert (= bs!7370 d!30032))

(declare-fun m!139839 () Bool)

(assert (=> bs!7370 m!139839))

(assert (=> start!19222 d!30032))

(check-sat (not b!96468) (not d!29964) (not d!29996) (not d!29994) (not d!30032) (not b!96432) (not b!96482) (not b!96470) (not d!29992) (not b!96483) (not b!96430) (not d!29984) (not d!30030) (not b!96477) (not b!96479) (not b!96431) (not d!29986) (not b!96467) (not d!30028) (not d!29970) (not d!30026) (not b!96465) (not b!96481))
(check-sat)
(get-model)

(assert (=> b!96465 d!29970))

(assert (=> b!96465 d!29984))

(declare-fun d!30094 () Bool)

(assert (=> d!30094 (= (remainingBits!0 ((_ sign_extend 32) (size!2054 (buf!2403 bitStream1!8))) ((_ sign_extend 32) (currentByte!4791 bitStream1!8)) ((_ sign_extend 32) (currentBit!4786 bitStream1!8))) (bvsub (bvmul ((_ sign_extend 32) (size!2054 (buf!2403 bitStream1!8))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4791 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4786 bitStream1!8)))))))

(assert (=> d!29970 d!30094))

(declare-fun d!30096 () Bool)

(assert (=> d!30096 (= (invariant!0 (currentBit!4786 bitStream1!8) (currentByte!4791 bitStream1!8) (size!2054 (buf!2403 bitStream1!8))) (and (bvsge (currentBit!4786 bitStream1!8) #b00000000000000000000000000000000) (bvslt (currentBit!4786 bitStream1!8) #b00000000000000000000000000001000) (bvsge (currentByte!4791 bitStream1!8) #b00000000000000000000000000000000) (or (bvslt (currentByte!4791 bitStream1!8) (size!2054 (buf!2403 bitStream1!8))) (and (= (currentBit!4786 bitStream1!8) #b00000000000000000000000000000000) (= (currentByte!4791 bitStream1!8) (size!2054 (buf!2403 bitStream1!8)))))))))

(assert (=> d!29970 d!30096))

(declare-fun d!30098 () Bool)

(assert (=> d!30098 (= (remainingBits!0 ((_ sign_extend 32) (size!2054 (buf!2403 base!8))) ((_ sign_extend 32) (currentByte!4791 base!8)) ((_ sign_extend 32) (currentBit!4786 base!8))) (bvsub (bvmul ((_ sign_extend 32) (size!2054 (buf!2403 base!8))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4791 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4786 base!8)))))))

(assert (=> d!29992 d!30098))

(declare-fun d!30100 () Bool)

(assert (=> d!30100 (= (invariant!0 (currentBit!4786 base!8) (currentByte!4791 base!8) (size!2054 (buf!2403 base!8))) (and (bvsge (currentBit!4786 base!8) #b00000000000000000000000000000000) (bvslt (currentBit!4786 base!8) #b00000000000000000000000000001000) (bvsge (currentByte!4791 base!8) #b00000000000000000000000000000000) (or (bvslt (currentByte!4791 base!8) (size!2054 (buf!2403 base!8))) (and (= (currentBit!4786 base!8) #b00000000000000000000000000000000) (= (currentByte!4791 base!8) (size!2054 (buf!2403 base!8)))))))))

(assert (=> d!29992 d!30100))

(assert (=> b!96477 d!29984))

(assert (=> b!96477 d!29992))

(declare-fun d!30102 () Bool)

(assert (=> d!30102 (= (remainingBits!0 ((_ sign_extend 32) (size!2054 (buf!2403 bitStream2!8))) ((_ sign_extend 32) (currentByte!4791 bitStream2!8)) ((_ sign_extend 32) (currentBit!4786 bitStream2!8))) (bvsub (bvmul ((_ sign_extend 32) (size!2054 (buf!2403 bitStream2!8))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4791 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4786 bitStream2!8)))))))

(assert (=> d!29984 d!30102))

(declare-fun d!30104 () Bool)

(assert (=> d!30104 (= (invariant!0 (currentBit!4786 bitStream2!8) (currentByte!4791 bitStream2!8) (size!2054 (buf!2403 bitStream2!8))) (and (bvsge (currentBit!4786 bitStream2!8) #b00000000000000000000000000000000) (bvslt (currentBit!4786 bitStream2!8) #b00000000000000000000000000001000) (bvsge (currentByte!4791 bitStream2!8) #b00000000000000000000000000000000) (or (bvslt (currentByte!4791 bitStream2!8) (size!2054 (buf!2403 bitStream2!8))) (and (= (currentBit!4786 bitStream2!8) #b00000000000000000000000000000000) (= (currentByte!4791 bitStream2!8) (size!2054 (buf!2403 bitStream2!8)))))))))

(assert (=> d!29984 d!30104))

(assert (=> d!30030 d!30100))

(declare-fun e!63219 () Bool)

(declare-fun b!96558 () Bool)

(declare-datatypes ((tuple4!56 0))(
  ( (tuple4!57 (_1!4120 (_ BitVec 32)) (_2!4120 (_ BitVec 32)) (_3!249 (_ BitVec 32)) (_4!28 (_ BitVec 32))) )
))
(declare-fun lt!139564 () tuple4!56)

(declare-fun arrayRangesEq!29 (array!4493 array!4493 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!96558 (= e!63219 (arrayRangesEq!29 (buf!2403 bitStream1!8) (buf!2403 bitStream2!8) (_1!4120 lt!139564) (_2!4120 lt!139564)))))

(declare-fun b!96559 () Bool)

(declare-fun res!79336 () Bool)

(declare-fun lt!139565 () (_ BitVec 32))

(assert (=> b!96559 (= res!79336 (= lt!139565 #b00000000000000000000000000000000))))

(declare-fun e!63220 () Bool)

(assert (=> b!96559 (=> res!79336 e!63220)))

(declare-fun e!63222 () Bool)

(assert (=> b!96559 (= e!63222 e!63220)))

(declare-fun b!96560 () Bool)

(declare-fun e!63217 () Bool)

(assert (=> b!96560 (= e!63217 e!63222)))

(declare-fun res!79335 () Bool)

(declare-fun call!1172 () Bool)

(assert (=> b!96560 (= res!79335 call!1172)))

(assert (=> b!96560 (=> (not res!79335) (not e!63222))))

(declare-fun d!30106 () Bool)

(declare-fun res!79339 () Bool)

(declare-fun e!63221 () Bool)

(assert (=> d!30106 (=> res!79339 e!63221)))

(assert (=> d!30106 (= res!79339 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2054 (buf!2403 bitStream1!8)) (currentByte!4791 bitStream1!8) (currentBit!4786 bitStream1!8))))))

(assert (=> d!30106 (= (arrayBitRangesEq!0 (buf!2403 bitStream1!8) (buf!2403 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2054 (buf!2403 bitStream1!8)) (currentByte!4791 bitStream1!8) (currentBit!4786 bitStream1!8))) e!63221)))

(declare-fun b!96561 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!96561 (= e!63220 (byteRangesEq!0 (select (arr!2650 (buf!2403 bitStream1!8)) (_4!28 lt!139564)) (select (arr!2650 (buf!2403 bitStream2!8)) (_4!28 lt!139564)) #b00000000000000000000000000000000 lt!139565))))

(declare-fun b!96562 () Bool)

(declare-fun e!63218 () Bool)

(assert (=> b!96562 (= e!63221 e!63218)))

(declare-fun res!79337 () Bool)

(assert (=> b!96562 (=> (not res!79337) (not e!63218))))

(assert (=> b!96562 (= res!79337 e!63219)))

(declare-fun res!79338 () Bool)

(assert (=> b!96562 (=> res!79338 e!63219)))

(assert (=> b!96562 (= res!79338 (bvsge (_1!4120 lt!139564) (_2!4120 lt!139564)))))

(assert (=> b!96562 (= lt!139565 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2054 (buf!2403 bitStream1!8)) (currentByte!4791 bitStream1!8) (currentBit!4786 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!139563 () (_ BitVec 32))

(assert (=> b!96562 (= lt!139563 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!56)

(assert (=> b!96562 (= lt!139564 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2054 (buf!2403 bitStream1!8)) (currentByte!4791 bitStream1!8) (currentBit!4786 bitStream1!8))))))

(declare-fun c!6066 () Bool)

(declare-fun bm!1169 () Bool)

(assert (=> bm!1169 (= call!1172 (byteRangesEq!0 (select (arr!2650 (buf!2403 bitStream1!8)) (_3!249 lt!139564)) (select (arr!2650 (buf!2403 bitStream2!8)) (_3!249 lt!139564)) lt!139563 (ite c!6066 lt!139565 #b00000000000000000000000000001000)))))

(declare-fun b!96563 () Bool)

(assert (=> b!96563 (= e!63218 e!63217)))

(assert (=> b!96563 (= c!6066 (= (_3!249 lt!139564) (_4!28 lt!139564)))))

(declare-fun b!96564 () Bool)

(assert (=> b!96564 (= e!63217 call!1172)))

(assert (= (and d!30106 (not res!79339)) b!96562))

(assert (= (and b!96562 (not res!79338)) b!96558))

(assert (= (and b!96562 res!79337) b!96563))

(assert (= (and b!96563 c!6066) b!96564))

(assert (= (and b!96563 (not c!6066)) b!96560))

(assert (= (and b!96560 res!79335) b!96559))

(assert (= (and b!96559 (not res!79336)) b!96561))

(assert (= (or b!96564 b!96560) bm!1169))

(declare-fun m!139885 () Bool)

(assert (=> b!96558 m!139885))

(declare-fun m!139887 () Bool)

(assert (=> b!96561 m!139887))

(declare-fun m!139889 () Bool)

(assert (=> b!96561 m!139889))

(assert (=> b!96561 m!139887))

(assert (=> b!96561 m!139889))

(declare-fun m!139891 () Bool)

(assert (=> b!96561 m!139891))

(assert (=> b!96562 m!139703))

(declare-fun m!139893 () Bool)

(assert (=> b!96562 m!139893))

(declare-fun m!139895 () Bool)

(assert (=> bm!1169 m!139895))

(declare-fun m!139897 () Bool)

(assert (=> bm!1169 m!139897))

(assert (=> bm!1169 m!139895))

(assert (=> bm!1169 m!139897))

(declare-fun m!139899 () Bool)

(assert (=> bm!1169 m!139899))

(assert (=> b!96467 d!30106))

(assert (=> b!96467 d!29970))

(assert (=> d!29986 d!30102))

(declare-fun d!30108 () Bool)

(assert (=> d!30108 (= (length!491 lt!139478) (size!2056 lt!139478))))

(declare-fun bs!7380 () Bool)

(assert (= bs!7380 d!30108))

(declare-fun m!139901 () Bool)

(assert (=> bs!7380 m!139901))

(assert (=> b!96483 d!30108))

(assert (=> d!30028 d!30104))

(declare-fun d!30110 () Bool)

(declare-fun e!63229 () Bool)

(assert (=> d!30110 e!63229))

(declare-fun res!79342 () Bool)

(assert (=> d!30110 (=> (not res!79342) (not e!63229))))

(declare-datatypes ((Unit!5852 0))(
  ( (Unit!5853) )
))
(declare-datatypes ((tuple2!7742 0))(
  ( (tuple2!7743 (_1!4121 Unit!5852) (_2!4121 BitStream!3588)) )
))
(declare-fun increaseBitIndex!0 (BitStream!3588) tuple2!7742)

(assert (=> d!30110 (= res!79342 (= (buf!2403 (_2!4121 (increaseBitIndex!0 bitStream1!8))) (buf!2403 bitStream1!8)))))

(declare-fun lt!139583 () Bool)

(assert (=> d!30110 (= lt!139583 (not (= (bvand ((_ sign_extend 24) (select (arr!2650 (buf!2403 bitStream1!8)) (currentByte!4791 bitStream1!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4786 bitStream1!8)))) #b00000000000000000000000000000000)))))

(declare-fun lt!139584 () tuple2!7732)

(assert (=> d!30110 (= lt!139584 (tuple2!7733 (not (= (bvand ((_ sign_extend 24) (select (arr!2650 (buf!2403 bitStream1!8)) (currentByte!4791 bitStream1!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4786 bitStream1!8)))) #b00000000000000000000000000000000)) (_2!4121 (increaseBitIndex!0 bitStream1!8))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!30110 (validate_offset_bit!0 ((_ sign_extend 32) (size!2054 (buf!2403 bitStream1!8))) ((_ sign_extend 32) (currentByte!4791 bitStream1!8)) ((_ sign_extend 32) (currentBit!4786 bitStream1!8)))))

(assert (=> d!30110 (= (readBit!0 bitStream1!8) lt!139584)))

(declare-fun lt!139581 () (_ BitVec 64))

(declare-fun lt!139585 () (_ BitVec 64))

(declare-fun b!96567 () Bool)

(assert (=> b!96567 (= e!63229 (= (bitIndex!0 (size!2054 (buf!2403 (_2!4121 (increaseBitIndex!0 bitStream1!8)))) (currentByte!4791 (_2!4121 (increaseBitIndex!0 bitStream1!8))) (currentBit!4786 (_2!4121 (increaseBitIndex!0 bitStream1!8)))) (bvadd lt!139585 lt!139581)))))

(assert (=> b!96567 (or (not (= (bvand lt!139585 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139581 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!139585 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!139585 lt!139581) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!96567 (= lt!139581 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!96567 (= lt!139585 (bitIndex!0 (size!2054 (buf!2403 bitStream1!8)) (currentByte!4791 bitStream1!8) (currentBit!4786 bitStream1!8)))))

(declare-fun lt!139586 () Bool)

(assert (=> b!96567 (= lt!139586 (not (= (bvand ((_ sign_extend 24) (select (arr!2650 (buf!2403 bitStream1!8)) (currentByte!4791 bitStream1!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4786 bitStream1!8)))) #b00000000000000000000000000000000)))))

(declare-fun lt!139582 () Bool)

(assert (=> b!96567 (= lt!139582 (not (= (bvand ((_ sign_extend 24) (select (arr!2650 (buf!2403 bitStream1!8)) (currentByte!4791 bitStream1!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4786 bitStream1!8)))) #b00000000000000000000000000000000)))))

(declare-fun lt!139580 () Bool)

(assert (=> b!96567 (= lt!139580 (not (= (bvand ((_ sign_extend 24) (select (arr!2650 (buf!2403 bitStream1!8)) (currentByte!4791 bitStream1!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4786 bitStream1!8)))) #b00000000000000000000000000000000)))))

(assert (= (and d!30110 res!79342) b!96567))

(declare-fun m!139903 () Bool)

(assert (=> d!30110 m!139903))

(declare-fun m!139905 () Bool)

(assert (=> d!30110 m!139905))

(declare-fun m!139907 () Bool)

(assert (=> d!30110 m!139907))

(declare-fun m!139909 () Bool)

(assert (=> d!30110 m!139909))

(assert (=> b!96567 m!139905))

(assert (=> b!96567 m!139907))

(declare-fun m!139911 () Bool)

(assert (=> b!96567 m!139911))

(assert (=> b!96567 m!139903))

(assert (=> b!96567 m!139703))

(assert (=> d!29996 d!30110))

(declare-fun d!30112 () Bool)

(get-info :version)

(assert (=> d!30112 (= (isEmpty!265 lt!139430) ((_ is Nil!897) lt!139430))))

(assert (=> b!96431 d!30112))

(assert (=> b!96468 d!29970))

(assert (=> b!96468 d!29992))

(declare-fun d!30114 () Bool)

(declare-fun lt!139589 () Int)

(assert (=> d!30114 (>= lt!139589 0)))

(declare-fun e!63232 () Int)

(assert (=> d!30114 (= lt!139589 e!63232)))

(declare-fun c!6069 () Bool)

(assert (=> d!30114 (= c!6069 ((_ is Nil!897) listBits!13))))

(assert (=> d!30114 (= (size!2056 listBits!13) lt!139589)))

(declare-fun b!96572 () Bool)

(assert (=> b!96572 (= e!63232 0)))

(declare-fun b!96573 () Bool)

(assert (=> b!96573 (= e!63232 (+ 1 (size!2056 (t!1650 listBits!13))))))

(assert (= (and d!30114 c!6069) b!96572))

(assert (= (and d!30114 (not c!6069)) b!96573))

(declare-fun m!139913 () Bool)

(assert (=> b!96573 m!139913))

(assert (=> d!29964 d!30114))

(declare-fun lt!139591 () (_ BitVec 64))

(declare-fun e!63233 () tuple2!7730)

(declare-fun b!96575 () Bool)

(declare-fun lt!139590 () tuple2!7732)

(assert (=> b!96575 (= e!63233 (tuple2!7731 (Cons!896 (_1!4115 lt!139590) (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4115 lt!139590) (bvsub (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139477) lt!139591))) (_2!4115 lt!139590)))))

(assert (=> b!96575 (= lt!139590 (readBit!0 (_2!4115 lt!139476)))))

(assert (=> b!96575 (= lt!139591 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!96574 () Bool)

(assert (=> b!96574 (= e!63233 (tuple2!7731 Nil!897 (_2!4115 lt!139476)))))

(declare-fun b!96577 () Bool)

(declare-fun e!63234 () Bool)

(declare-fun lt!139592 () List!900)

(assert (=> b!96577 (= e!63234 (> (length!491 lt!139592) 0))))

(declare-fun d!30116 () Bool)

(assert (=> d!30116 e!63234))

(declare-fun c!6070 () Bool)

(assert (=> d!30116 (= c!6070 (= (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139477) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!30116 (= lt!139592 (_1!4114 e!63233))))

(declare-fun c!6071 () Bool)

(assert (=> d!30116 (= c!6071 (= (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139477) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!30116 (bvsge (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139477) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!30116 (= (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4115 lt!139476) (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139477)) lt!139592)))

(declare-fun b!96576 () Bool)

(assert (=> b!96576 (= e!63234 (isEmpty!265 lt!139592))))

(assert (= (and d!30116 c!6071) b!96574))

(assert (= (and d!30116 (not c!6071)) b!96575))

(assert (= (and d!30116 c!6070) b!96576))

(assert (= (and d!30116 (not c!6070)) b!96577))

(declare-fun m!139915 () Bool)

(assert (=> b!96575 m!139915))

(declare-fun m!139917 () Bool)

(assert (=> b!96575 m!139917))

(declare-fun m!139919 () Bool)

(assert (=> b!96577 m!139919))

(declare-fun m!139921 () Bool)

(assert (=> b!96576 m!139921))

(assert (=> b!96481 d!30116))

(declare-fun d!30118 () Bool)

(declare-fun e!63235 () Bool)

(assert (=> d!30118 e!63235))

(declare-fun res!79343 () Bool)

(assert (=> d!30118 (=> (not res!79343) (not e!63235))))

(assert (=> d!30118 (= res!79343 (= (buf!2403 (_2!4121 (increaseBitIndex!0 bitStream2!8))) (buf!2403 bitStream2!8)))))

(declare-fun lt!139596 () Bool)

(assert (=> d!30118 (= lt!139596 (not (= (bvand ((_ sign_extend 24) (select (arr!2650 (buf!2403 bitStream2!8)) (currentByte!4791 bitStream2!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4786 bitStream2!8)))) #b00000000000000000000000000000000)))))

(declare-fun lt!139597 () tuple2!7732)

(assert (=> d!30118 (= lt!139597 (tuple2!7733 (not (= (bvand ((_ sign_extend 24) (select (arr!2650 (buf!2403 bitStream2!8)) (currentByte!4791 bitStream2!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4786 bitStream2!8)))) #b00000000000000000000000000000000)) (_2!4121 (increaseBitIndex!0 bitStream2!8))))))

(assert (=> d!30118 (validate_offset_bit!0 ((_ sign_extend 32) (size!2054 (buf!2403 bitStream2!8))) ((_ sign_extend 32) (currentByte!4791 bitStream2!8)) ((_ sign_extend 32) (currentBit!4786 bitStream2!8)))))

(assert (=> d!30118 (= (readBit!0 bitStream2!8) lt!139597)))

(declare-fun b!96578 () Bool)

(declare-fun lt!139598 () (_ BitVec 64))

(declare-fun lt!139594 () (_ BitVec 64))

(assert (=> b!96578 (= e!63235 (= (bitIndex!0 (size!2054 (buf!2403 (_2!4121 (increaseBitIndex!0 bitStream2!8)))) (currentByte!4791 (_2!4121 (increaseBitIndex!0 bitStream2!8))) (currentBit!4786 (_2!4121 (increaseBitIndex!0 bitStream2!8)))) (bvadd lt!139598 lt!139594)))))

(assert (=> b!96578 (or (not (= (bvand lt!139598 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139594 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!139598 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!139598 lt!139594) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!96578 (= lt!139594 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!96578 (= lt!139598 (bitIndex!0 (size!2054 (buf!2403 bitStream2!8)) (currentByte!4791 bitStream2!8) (currentBit!4786 bitStream2!8)))))

(declare-fun lt!139599 () Bool)

(assert (=> b!96578 (= lt!139599 (not (= (bvand ((_ sign_extend 24) (select (arr!2650 (buf!2403 bitStream2!8)) (currentByte!4791 bitStream2!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4786 bitStream2!8)))) #b00000000000000000000000000000000)))))

(declare-fun lt!139595 () Bool)

(assert (=> b!96578 (= lt!139595 (not (= (bvand ((_ sign_extend 24) (select (arr!2650 (buf!2403 bitStream2!8)) (currentByte!4791 bitStream2!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4786 bitStream2!8)))) #b00000000000000000000000000000000)))))

(declare-fun lt!139593 () Bool)

(assert (=> b!96578 (= lt!139593 (not (= (bvand ((_ sign_extend 24) (select (arr!2650 (buf!2403 bitStream2!8)) (currentByte!4791 bitStream2!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4786 bitStream2!8)))) #b00000000000000000000000000000000)))))

(assert (= (and d!30118 res!79343) b!96578))

(declare-fun m!139923 () Bool)

(assert (=> d!30118 m!139923))

(declare-fun m!139925 () Bool)

(assert (=> d!30118 m!139925))

(declare-fun m!139927 () Bool)

(assert (=> d!30118 m!139927))

(declare-fun m!139929 () Bool)

(assert (=> d!30118 m!139929))

(assert (=> b!96578 m!139925))

(assert (=> b!96578 m!139927))

(declare-fun m!139931 () Bool)

(assert (=> b!96578 m!139931))

(assert (=> b!96578 m!139923))

(assert (=> b!96578 m!139705))

(assert (=> b!96481 d!30118))

(declare-fun d!30120 () Bool)

(assert (=> d!30120 (= (isEmpty!265 lt!139478) ((_ is Nil!897) lt!139478))))

(assert (=> b!96482 d!30120))

(assert (=> d!29994 d!30094))

(declare-fun lt!139601 () tuple4!56)

(declare-fun b!96579 () Bool)

(declare-fun e!63238 () Bool)

(assert (=> b!96579 (= e!63238 (arrayRangesEq!29 (buf!2403 bitStream1!8) (buf!2403 base!8) (_1!4120 lt!139601) (_2!4120 lt!139601)))))

(declare-fun b!96580 () Bool)

(declare-fun res!79345 () Bool)

(declare-fun lt!139602 () (_ BitVec 32))

(assert (=> b!96580 (= res!79345 (= lt!139602 #b00000000000000000000000000000000))))

(declare-fun e!63239 () Bool)

(assert (=> b!96580 (=> res!79345 e!63239)))

(declare-fun e!63241 () Bool)

(assert (=> b!96580 (= e!63241 e!63239)))

(declare-fun b!96581 () Bool)

(declare-fun e!63236 () Bool)

(assert (=> b!96581 (= e!63236 e!63241)))

(declare-fun res!79344 () Bool)

(declare-fun call!1173 () Bool)

(assert (=> b!96581 (= res!79344 call!1173)))

(assert (=> b!96581 (=> (not res!79344) (not e!63241))))

(declare-fun d!30122 () Bool)

(declare-fun res!79348 () Bool)

(declare-fun e!63240 () Bool)

(assert (=> d!30122 (=> res!79348 e!63240)))

(assert (=> d!30122 (= res!79348 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2054 (buf!2403 bitStream1!8)) (currentByte!4791 bitStream1!8) (currentBit!4786 bitStream1!8))))))

(assert (=> d!30122 (= (arrayBitRangesEq!0 (buf!2403 bitStream1!8) (buf!2403 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2054 (buf!2403 bitStream1!8)) (currentByte!4791 bitStream1!8) (currentBit!4786 bitStream1!8))) e!63240)))

(declare-fun b!96582 () Bool)

(assert (=> b!96582 (= e!63239 (byteRangesEq!0 (select (arr!2650 (buf!2403 bitStream1!8)) (_4!28 lt!139601)) (select (arr!2650 (buf!2403 base!8)) (_4!28 lt!139601)) #b00000000000000000000000000000000 lt!139602))))

(declare-fun b!96583 () Bool)

(declare-fun e!63237 () Bool)

(assert (=> b!96583 (= e!63240 e!63237)))

(declare-fun res!79346 () Bool)

(assert (=> b!96583 (=> (not res!79346) (not e!63237))))

(assert (=> b!96583 (= res!79346 e!63238)))

(declare-fun res!79347 () Bool)

(assert (=> b!96583 (=> res!79347 e!63238)))

(assert (=> b!96583 (= res!79347 (bvsge (_1!4120 lt!139601) (_2!4120 lt!139601)))))

(assert (=> b!96583 (= lt!139602 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2054 (buf!2403 bitStream1!8)) (currentByte!4791 bitStream1!8) (currentBit!4786 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!139600 () (_ BitVec 32))

(assert (=> b!96583 (= lt!139600 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!96583 (= lt!139601 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2054 (buf!2403 bitStream1!8)) (currentByte!4791 bitStream1!8) (currentBit!4786 bitStream1!8))))))

(declare-fun c!6072 () Bool)

(declare-fun bm!1170 () Bool)

(assert (=> bm!1170 (= call!1173 (byteRangesEq!0 (select (arr!2650 (buf!2403 bitStream1!8)) (_3!249 lt!139601)) (select (arr!2650 (buf!2403 base!8)) (_3!249 lt!139601)) lt!139600 (ite c!6072 lt!139602 #b00000000000000000000000000001000)))))

(declare-fun b!96584 () Bool)

(assert (=> b!96584 (= e!63237 e!63236)))

(assert (=> b!96584 (= c!6072 (= (_3!249 lt!139601) (_4!28 lt!139601)))))

(declare-fun b!96585 () Bool)

(assert (=> b!96585 (= e!63236 call!1173)))

(assert (= (and d!30122 (not res!79348)) b!96583))

(assert (= (and b!96583 (not res!79347)) b!96579))

(assert (= (and b!96583 res!79346) b!96584))

(assert (= (and b!96584 c!6072) b!96585))

(assert (= (and b!96584 (not c!6072)) b!96581))

(assert (= (and b!96581 res!79344) b!96580))

(assert (= (and b!96580 (not res!79345)) b!96582))

(assert (= (or b!96585 b!96581) bm!1170))

(declare-fun m!139933 () Bool)

(assert (=> b!96579 m!139933))

(declare-fun m!139935 () Bool)

(assert (=> b!96582 m!139935))

(declare-fun m!139937 () Bool)

(assert (=> b!96582 m!139937))

(assert (=> b!96582 m!139935))

(assert (=> b!96582 m!139937))

(declare-fun m!139939 () Bool)

(assert (=> b!96582 m!139939))

(assert (=> b!96583 m!139703))

(assert (=> b!96583 m!139893))

(declare-fun m!139941 () Bool)

(assert (=> bm!1170 m!139941))

(declare-fun m!139943 () Bool)

(assert (=> bm!1170 m!139943))

(assert (=> bm!1170 m!139941))

(assert (=> bm!1170 m!139943))

(declare-fun m!139945 () Bool)

(assert (=> bm!1170 m!139945))

(assert (=> b!96470 d!30122))

(assert (=> b!96470 d!29970))

(declare-fun d!30124 () Bool)

(assert (=> d!30124 (= (length!491 lt!139430) (size!2056 lt!139430))))

(declare-fun bs!7381 () Bool)

(assert (= bs!7381 d!30124))

(declare-fun m!139947 () Bool)

(assert (=> bs!7381 m!139947))

(assert (=> b!96432 d!30124))

(assert (=> d!30026 d!30096))

(declare-fun e!63244 () Bool)

(declare-fun b!96586 () Bool)

(declare-fun lt!139604 () tuple4!56)

(assert (=> b!96586 (= e!63244 (arrayRangesEq!29 (buf!2403 bitStream2!8) (buf!2403 base!8) (_1!4120 lt!139604) (_2!4120 lt!139604)))))

(declare-fun b!96587 () Bool)

(declare-fun res!79350 () Bool)

(declare-fun lt!139605 () (_ BitVec 32))

(assert (=> b!96587 (= res!79350 (= lt!139605 #b00000000000000000000000000000000))))

(declare-fun e!63245 () Bool)

(assert (=> b!96587 (=> res!79350 e!63245)))

(declare-fun e!63247 () Bool)

(assert (=> b!96587 (= e!63247 e!63245)))

(declare-fun b!96588 () Bool)

(declare-fun e!63242 () Bool)

(assert (=> b!96588 (= e!63242 e!63247)))

(declare-fun res!79349 () Bool)

(declare-fun call!1174 () Bool)

(assert (=> b!96588 (= res!79349 call!1174)))

(assert (=> b!96588 (=> (not res!79349) (not e!63247))))

(declare-fun d!30126 () Bool)

(declare-fun res!79353 () Bool)

(declare-fun e!63246 () Bool)

(assert (=> d!30126 (=> res!79353 e!63246)))

(assert (=> d!30126 (= res!79353 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2054 (buf!2403 bitStream2!8)) (currentByte!4791 bitStream2!8) (currentBit!4786 bitStream2!8))))))

(assert (=> d!30126 (= (arrayBitRangesEq!0 (buf!2403 bitStream2!8) (buf!2403 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2054 (buf!2403 bitStream2!8)) (currentByte!4791 bitStream2!8) (currentBit!4786 bitStream2!8))) e!63246)))

(declare-fun b!96589 () Bool)

(assert (=> b!96589 (= e!63245 (byteRangesEq!0 (select (arr!2650 (buf!2403 bitStream2!8)) (_4!28 lt!139604)) (select (arr!2650 (buf!2403 base!8)) (_4!28 lt!139604)) #b00000000000000000000000000000000 lt!139605))))

(declare-fun b!96590 () Bool)

(declare-fun e!63243 () Bool)

(assert (=> b!96590 (= e!63246 e!63243)))

(declare-fun res!79351 () Bool)

(assert (=> b!96590 (=> (not res!79351) (not e!63243))))

(assert (=> b!96590 (= res!79351 e!63244)))

(declare-fun res!79352 () Bool)

(assert (=> b!96590 (=> res!79352 e!63244)))

(assert (=> b!96590 (= res!79352 (bvsge (_1!4120 lt!139604) (_2!4120 lt!139604)))))

(assert (=> b!96590 (= lt!139605 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2054 (buf!2403 bitStream2!8)) (currentByte!4791 bitStream2!8) (currentBit!4786 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!139603 () (_ BitVec 32))

(assert (=> b!96590 (= lt!139603 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!96590 (= lt!139604 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2054 (buf!2403 bitStream2!8)) (currentByte!4791 bitStream2!8) (currentBit!4786 bitStream2!8))))))

(declare-fun bm!1171 () Bool)

(declare-fun c!6073 () Bool)

(assert (=> bm!1171 (= call!1174 (byteRangesEq!0 (select (arr!2650 (buf!2403 bitStream2!8)) (_3!249 lt!139604)) (select (arr!2650 (buf!2403 base!8)) (_3!249 lt!139604)) lt!139603 (ite c!6073 lt!139605 #b00000000000000000000000000001000)))))

(declare-fun b!96591 () Bool)

(assert (=> b!96591 (= e!63243 e!63242)))

(assert (=> b!96591 (= c!6073 (= (_3!249 lt!139604) (_4!28 lt!139604)))))

(declare-fun b!96592 () Bool)

(assert (=> b!96592 (= e!63242 call!1174)))

(assert (= (and d!30126 (not res!79353)) b!96590))

(assert (= (and b!96590 (not res!79352)) b!96586))

(assert (= (and b!96590 res!79351) b!96591))

(assert (= (and b!96591 c!6073) b!96592))

(assert (= (and b!96591 (not c!6073)) b!96588))

(assert (= (and b!96588 res!79349) b!96587))

(assert (= (and b!96587 (not res!79350)) b!96589))

(assert (= (or b!96592 b!96588) bm!1171))

(declare-fun m!139949 () Bool)

(assert (=> b!96586 m!139949))

(declare-fun m!139951 () Bool)

(assert (=> b!96589 m!139951))

(declare-fun m!139953 () Bool)

(assert (=> b!96589 m!139953))

(assert (=> b!96589 m!139951))

(assert (=> b!96589 m!139953))

(declare-fun m!139955 () Bool)

(assert (=> b!96589 m!139955))

(assert (=> b!96590 m!139705))

(declare-fun m!139957 () Bool)

(assert (=> b!96590 m!139957))

(declare-fun m!139959 () Bool)

(assert (=> bm!1171 m!139959))

(declare-fun m!139961 () Bool)

(assert (=> bm!1171 m!139961))

(assert (=> bm!1171 m!139959))

(assert (=> bm!1171 m!139961))

(declare-fun m!139963 () Bool)

(assert (=> bm!1171 m!139963))

(assert (=> b!96479 d!30126))

(assert (=> b!96479 d!29984))

(declare-fun d!30128 () Bool)

(assert (=> d!30128 (= (invariant!0 (currentBit!4786 thiss!1534) (currentByte!4791 thiss!1534) (size!2054 (buf!2403 thiss!1534))) (and (bvsge (currentBit!4786 thiss!1534) #b00000000000000000000000000000000) (bvslt (currentBit!4786 thiss!1534) #b00000000000000000000000000001000) (bvsge (currentByte!4791 thiss!1534) #b00000000000000000000000000000000) (or (bvslt (currentByte!4791 thiss!1534) (size!2054 (buf!2403 thiss!1534))) (and (= (currentBit!4786 thiss!1534) #b00000000000000000000000000000000) (= (currentByte!4791 thiss!1534) (size!2054 (buf!2403 thiss!1534)))))))))

(assert (=> d!30032 d!30128))

(declare-fun b!96594 () Bool)

(declare-fun lt!139606 () tuple2!7732)

(declare-fun e!63248 () tuple2!7730)

(declare-fun lt!139607 () (_ BitVec 64))

(assert (=> b!96594 (= e!63248 (tuple2!7731 (Cons!896 (_1!4115 lt!139606) (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4115 lt!139606) (bvsub (bvsub nBits!484 lt!139429) lt!139607))) (_2!4115 lt!139606)))))

(assert (=> b!96594 (= lt!139606 (readBit!0 (_2!4115 lt!139428)))))

(assert (=> b!96594 (= lt!139607 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!96593 () Bool)

(assert (=> b!96593 (= e!63248 (tuple2!7731 Nil!897 (_2!4115 lt!139428)))))

(declare-fun b!96596 () Bool)

(declare-fun e!63249 () Bool)

(declare-fun lt!139608 () List!900)

(assert (=> b!96596 (= e!63249 (> (length!491 lt!139608) 0))))

(declare-fun d!30130 () Bool)

(assert (=> d!30130 e!63249))

(declare-fun c!6074 () Bool)

(assert (=> d!30130 (= c!6074 (= (bvsub nBits!484 lt!139429) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!30130 (= lt!139608 (_1!4114 e!63248))))

(declare-fun c!6075 () Bool)

(assert (=> d!30130 (= c!6075 (= (bvsub nBits!484 lt!139429) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!30130 (bvsge (bvsub nBits!484 lt!139429) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!30130 (= (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4115 lt!139428) (bvsub nBits!484 lt!139429)) lt!139608)))

(declare-fun b!96595 () Bool)

(assert (=> b!96595 (= e!63249 (isEmpty!265 lt!139608))))

(assert (= (and d!30130 c!6075) b!96593))

(assert (= (and d!30130 (not c!6075)) b!96594))

(assert (= (and d!30130 c!6074) b!96595))

(assert (= (and d!30130 (not c!6074)) b!96596))

(declare-fun m!139965 () Bool)

(assert (=> b!96594 m!139965))

(declare-fun m!139967 () Bool)

(assert (=> b!96594 m!139967))

(declare-fun m!139969 () Bool)

(assert (=> b!96596 m!139969))

(declare-fun m!139971 () Bool)

(assert (=> b!96595 m!139971))

(assert (=> b!96430 d!30130))

(assert (=> b!96430 d!30110))

(check-sat (not b!96586) (not bm!1171) (not b!96595) (not d!30118) (not bm!1170) (not b!96576) (not b!96590) (not b!96558) (not b!96594) (not b!96573) (not b!96582) (not bm!1169) (not d!30110) (not b!96577) (not b!96562) (not b!96579) (not b!96596) (not b!96561) (not b!96583) (not d!30124) (not b!96567) (not b!96589) (not b!96575) (not d!30108) (not b!96578))
(check-sat)
(get-model)

(declare-fun d!30132 () Bool)

(assert (=> d!30132 (= (byteRangesEq!0 (select (arr!2650 (buf!2403 bitStream1!8)) (_3!249 lt!139564)) (select (arr!2650 (buf!2403 bitStream2!8)) (_3!249 lt!139564)) lt!139563 (ite c!6066 lt!139565 #b00000000000000000000000000001000)) (or (= lt!139563 (ite c!6066 lt!139565 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!2650 (buf!2403 bitStream1!8)) (_3!249 lt!139564))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!6066 lt!139565 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!139563)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!2650 (buf!2403 bitStream2!8)) (_3!249 lt!139564))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!6066 lt!139565 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!139563)))) #b00000000000000000000000011111111))))))

(declare-fun bs!7382 () Bool)

(assert (= bs!7382 d!30132))

(declare-fun m!139973 () Bool)

(assert (=> bs!7382 m!139973))

(declare-fun m!139975 () Bool)

(assert (=> bs!7382 m!139975))

(assert (=> bm!1169 d!30132))

(declare-fun d!30134 () Bool)

(declare-fun res!79358 () Bool)

(declare-fun e!63254 () Bool)

(assert (=> d!30134 (=> res!79358 e!63254)))

(assert (=> d!30134 (= res!79358 (= (_1!4120 lt!139604) (_2!4120 lt!139604)))))

(assert (=> d!30134 (= (arrayRangesEq!29 (buf!2403 bitStream2!8) (buf!2403 base!8) (_1!4120 lt!139604) (_2!4120 lt!139604)) e!63254)))

(declare-fun b!96601 () Bool)

(declare-fun e!63255 () Bool)

(assert (=> b!96601 (= e!63254 e!63255)))

(declare-fun res!79359 () Bool)

(assert (=> b!96601 (=> (not res!79359) (not e!63255))))

(assert (=> b!96601 (= res!79359 (= (select (arr!2650 (buf!2403 bitStream2!8)) (_1!4120 lt!139604)) (select (arr!2650 (buf!2403 base!8)) (_1!4120 lt!139604))))))

(declare-fun b!96602 () Bool)

(assert (=> b!96602 (= e!63255 (arrayRangesEq!29 (buf!2403 bitStream2!8) (buf!2403 base!8) (bvadd (_1!4120 lt!139604) #b00000000000000000000000000000001) (_2!4120 lt!139604)))))

(assert (= (and d!30134 (not res!79358)) b!96601))

(assert (= (and b!96601 res!79359) b!96602))

(declare-fun m!139977 () Bool)

(assert (=> b!96601 m!139977))

(declare-fun m!139979 () Bool)

(assert (=> b!96601 m!139979))

(declare-fun m!139981 () Bool)

(assert (=> b!96602 m!139981))

(assert (=> b!96586 d!30134))

(declare-fun d!30136 () Bool)

(assert (=> d!30136 (= (byteRangesEq!0 (select (arr!2650 (buf!2403 bitStream1!8)) (_4!28 lt!139601)) (select (arr!2650 (buf!2403 base!8)) (_4!28 lt!139601)) #b00000000000000000000000000000000 lt!139602) (or (= #b00000000000000000000000000000000 lt!139602) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!2650 (buf!2403 bitStream1!8)) (_4!28 lt!139601))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!139602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!2650 (buf!2403 base!8)) (_4!28 lt!139601))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!139602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!7383 () Bool)

(assert (= bs!7383 d!30136))

(declare-fun m!139983 () Bool)

(assert (=> bs!7383 m!139983))

(declare-fun m!139985 () Bool)

(assert (=> bs!7383 m!139985))

(assert (=> b!96582 d!30136))

(declare-fun d!30138 () Bool)

(assert (=> d!30138 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2054 (buf!2403 bitStream1!8)) (currentByte!4791 bitStream1!8) (currentBit!4786 bitStream1!8))) (tuple4!57 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!2054 (buf!2403 bitStream1!8)) (currentByte!4791 bitStream1!8) (currentBit!4786 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!2054 (buf!2403 bitStream1!8)) (currentByte!4791 bitStream1!8) (currentBit!4786 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!96583 d!30138))

(declare-fun d!30140 () Bool)

(declare-fun res!79360 () Bool)

(declare-fun e!63256 () Bool)

(assert (=> d!30140 (=> res!79360 e!63256)))

(assert (=> d!30140 (= res!79360 (= (_1!4120 lt!139601) (_2!4120 lt!139601)))))

(assert (=> d!30140 (= (arrayRangesEq!29 (buf!2403 bitStream1!8) (buf!2403 base!8) (_1!4120 lt!139601) (_2!4120 lt!139601)) e!63256)))

(declare-fun b!96603 () Bool)

(declare-fun e!63257 () Bool)

(assert (=> b!96603 (= e!63256 e!63257)))

(declare-fun res!79361 () Bool)

(assert (=> b!96603 (=> (not res!79361) (not e!63257))))

(assert (=> b!96603 (= res!79361 (= (select (arr!2650 (buf!2403 bitStream1!8)) (_1!4120 lt!139601)) (select (arr!2650 (buf!2403 base!8)) (_1!4120 lt!139601))))))

(declare-fun b!96604 () Bool)

(assert (=> b!96604 (= e!63257 (arrayRangesEq!29 (buf!2403 bitStream1!8) (buf!2403 base!8) (bvadd (_1!4120 lt!139601) #b00000000000000000000000000000001) (_2!4120 lt!139601)))))

(assert (= (and d!30140 (not res!79360)) b!96603))

(assert (= (and b!96603 res!79361) b!96604))

(declare-fun m!139987 () Bool)

(assert (=> b!96603 m!139987))

(declare-fun m!139989 () Bool)

(assert (=> b!96603 m!139989))

(declare-fun m!139991 () Bool)

(assert (=> b!96604 m!139991))

(assert (=> b!96579 d!30140))

(declare-fun d!30142 () Bool)

(assert (=> d!30142 (= (byteRangesEq!0 (select (arr!2650 (buf!2403 bitStream1!8)) (_4!28 lt!139564)) (select (arr!2650 (buf!2403 bitStream2!8)) (_4!28 lt!139564)) #b00000000000000000000000000000000 lt!139565) (or (= #b00000000000000000000000000000000 lt!139565) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!2650 (buf!2403 bitStream1!8)) (_4!28 lt!139564))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!139565))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!2650 (buf!2403 bitStream2!8)) (_4!28 lt!139564))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!139565))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!7384 () Bool)

(assert (= bs!7384 d!30142))

(declare-fun m!139993 () Bool)

(assert (=> bs!7384 m!139993))

(assert (=> bs!7384 m!139985))

(assert (=> b!96561 d!30142))

(declare-fun d!30144 () Bool)

(declare-fun lt!139609 () Int)

(assert (=> d!30144 (>= lt!139609 0)))

(declare-fun e!63258 () Int)

(assert (=> d!30144 (= lt!139609 e!63258)))

(declare-fun c!6076 () Bool)

(assert (=> d!30144 (= c!6076 ((_ is Nil!897) lt!139478))))

(assert (=> d!30144 (= (size!2056 lt!139478) lt!139609)))

(declare-fun b!96605 () Bool)

(assert (=> b!96605 (= e!63258 0)))

(declare-fun b!96606 () Bool)

(assert (=> b!96606 (= e!63258 (+ 1 (size!2056 (t!1650 lt!139478))))))

(assert (= (and d!30144 c!6076) b!96605))

(assert (= (and d!30144 (not c!6076)) b!96606))

(declare-fun m!139995 () Bool)

(assert (=> b!96606 m!139995))

(assert (=> d!30108 d!30144))

(declare-fun d!30146 () Bool)

(declare-fun lt!139610 () Int)

(assert (=> d!30146 (>= lt!139610 0)))

(declare-fun e!63259 () Int)

(assert (=> d!30146 (= lt!139610 e!63259)))

(declare-fun c!6077 () Bool)

(assert (=> d!30146 (= c!6077 ((_ is Nil!897) lt!139430))))

(assert (=> d!30146 (= (size!2056 lt!139430) lt!139610)))

(declare-fun b!96607 () Bool)

(assert (=> b!96607 (= e!63259 0)))

(declare-fun b!96608 () Bool)

(assert (=> b!96608 (= e!63259 (+ 1 (size!2056 (t!1650 lt!139430))))))

(assert (= (and d!30146 c!6077) b!96607))

(assert (= (and d!30146 (not c!6077)) b!96608))

(declare-fun m!139997 () Bool)

(assert (=> b!96608 m!139997))

(assert (=> d!30124 d!30146))

(declare-fun d!30148 () Bool)

(declare-fun e!63262 () Bool)

(assert (=> d!30148 e!63262))

(declare-fun res!79366 () Bool)

(assert (=> d!30148 (=> (not res!79366) (not e!63262))))

(declare-fun lt!139623 () (_ BitVec 64))

(declare-fun lt!139622 () (_ BitVec 64))

(declare-fun lt!139624 () tuple2!7742)

(assert (=> d!30148 (= res!79366 (= (bvadd lt!139623 lt!139622) (bitIndex!0 (size!2054 (buf!2403 (_2!4121 lt!139624))) (currentByte!4791 (_2!4121 lt!139624)) (currentBit!4786 (_2!4121 lt!139624)))))))

(assert (=> d!30148 (or (not (= (bvand lt!139623 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139622 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!139623 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!139623 lt!139622) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30148 (= lt!139622 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!30148 (= lt!139623 (bitIndex!0 (size!2054 (buf!2403 bitStream2!8)) (currentByte!4791 bitStream2!8) (currentBit!4786 bitStream2!8)))))

(declare-fun Unit!5854 () Unit!5852)

(declare-fun Unit!5855 () Unit!5852)

(assert (=> d!30148 (= lt!139624 (ite (bvslt (currentBit!4786 bitStream2!8) #b00000000000000000000000000000111) (tuple2!7743 Unit!5854 (BitStream!3589 (buf!2403 bitStream2!8) (currentByte!4791 bitStream2!8) (bvadd (currentBit!4786 bitStream2!8) #b00000000000000000000000000000001))) (tuple2!7743 Unit!5855 (BitStream!3589 (buf!2403 bitStream2!8) (bvadd (currentByte!4791 bitStream2!8) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!30148 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!2054 (buf!2403 bitStream2!8))) ((_ sign_extend 32) (currentByte!4791 bitStream2!8)) ((_ sign_extend 32) (currentBit!4786 bitStream2!8))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!30148 (= (increaseBitIndex!0 bitStream2!8) lt!139624)))

(declare-fun b!96613 () Bool)

(declare-fun res!79367 () Bool)

(assert (=> b!96613 (=> (not res!79367) (not e!63262))))

(declare-fun lt!139621 () (_ BitVec 64))

(declare-fun lt!139625 () (_ BitVec 64))

(assert (=> b!96613 (= res!79367 (= (bvsub lt!139621 lt!139625) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!96613 (or (= (bvand lt!139621 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139625 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!139621 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!139621 lt!139625) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!96613 (= lt!139625 (remainingBits!0 ((_ sign_extend 32) (size!2054 (buf!2403 (_2!4121 lt!139624)))) ((_ sign_extend 32) (currentByte!4791 (_2!4121 lt!139624))) ((_ sign_extend 32) (currentBit!4786 (_2!4121 lt!139624)))))))

(assert (=> b!96613 (= lt!139621 (remainingBits!0 ((_ sign_extend 32) (size!2054 (buf!2403 bitStream2!8))) ((_ sign_extend 32) (currentByte!4791 bitStream2!8)) ((_ sign_extend 32) (currentBit!4786 bitStream2!8))))))

(declare-fun b!96614 () Bool)

(assert (=> b!96614 (= e!63262 (= (size!2054 (buf!2403 bitStream2!8)) (size!2054 (buf!2403 (_2!4121 lt!139624)))))))

(assert (= (and d!30148 res!79366) b!96613))

(assert (= (and b!96613 res!79367) b!96614))

(declare-fun m!139999 () Bool)

(assert (=> d!30148 m!139999))

(assert (=> d!30148 m!139705))

(assert (=> d!30148 m!139795))

(declare-fun m!140001 () Bool)

(assert (=> b!96613 m!140001))

(assert (=> b!96613 m!139795))

(assert (=> d!30118 d!30148))

(declare-fun d!30150 () Bool)

(assert (=> d!30150 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!2054 (buf!2403 bitStream2!8))) ((_ sign_extend 32) (currentByte!4791 bitStream2!8)) ((_ sign_extend 32) (currentBit!4786 bitStream2!8))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2054 (buf!2403 bitStream2!8))) ((_ sign_extend 32) (currentByte!4791 bitStream2!8)) ((_ sign_extend 32) (currentBit!4786 bitStream2!8))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!7385 () Bool)

(assert (= bs!7385 d!30150))

(assert (=> bs!7385 m!139795))

(assert (=> d!30118 d!30150))

(assert (=> b!96562 d!30138))

(declare-fun d!30152 () Bool)

(assert (=> d!30152 (= (byteRangesEq!0 (select (arr!2650 (buf!2403 bitStream2!8)) (_4!28 lt!139604)) (select (arr!2650 (buf!2403 base!8)) (_4!28 lt!139604)) #b00000000000000000000000000000000 lt!139605) (or (= #b00000000000000000000000000000000 lt!139605) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!2650 (buf!2403 bitStream2!8)) (_4!28 lt!139604))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!139605))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!2650 (buf!2403 base!8)) (_4!28 lt!139604))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!139605))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!7386 () Bool)

(assert (= bs!7386 d!30152))

(declare-fun m!140003 () Bool)

(assert (=> bs!7386 m!140003))

(assert (=> bs!7386 m!139985))

(assert (=> b!96589 d!30152))

(declare-fun d!30154 () Bool)

(assert (=> d!30154 (= (byteRangesEq!0 (select (arr!2650 (buf!2403 bitStream1!8)) (_3!249 lt!139601)) (select (arr!2650 (buf!2403 base!8)) (_3!249 lt!139601)) lt!139600 (ite c!6072 lt!139602 #b00000000000000000000000000001000)) (or (= lt!139600 (ite c!6072 lt!139602 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!2650 (buf!2403 bitStream1!8)) (_3!249 lt!139601))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!6072 lt!139602 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!139600)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!2650 (buf!2403 base!8)) (_3!249 lt!139601))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!6072 lt!139602 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!139600)))) #b00000000000000000000000011111111))))))

(declare-fun bs!7387 () Bool)

(assert (= bs!7387 d!30154))

(declare-fun m!140005 () Bool)

(assert (=> bs!7387 m!140005))

(declare-fun m!140007 () Bool)

(assert (=> bs!7387 m!140007))

(assert (=> bm!1170 d!30154))

(declare-fun d!30156 () Bool)

(declare-fun e!63263 () Bool)

(assert (=> d!30156 e!63263))

(declare-fun res!79368 () Bool)

(assert (=> d!30156 (=> (not res!79368) (not e!63263))))

(declare-fun lt!139631 () (_ BitVec 64))

(declare-fun lt!139629 () (_ BitVec 64))

(declare-fun lt!139626 () (_ BitVec 64))

(assert (=> d!30156 (= res!79368 (= lt!139629 (bvsub lt!139626 lt!139631)))))

(assert (=> d!30156 (or (= (bvand lt!139626 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139631 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!139626 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!139626 lt!139631) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30156 (= lt!139631 (remainingBits!0 ((_ sign_extend 32) (size!2054 (buf!2403 (_2!4121 (increaseBitIndex!0 bitStream1!8))))) ((_ sign_extend 32) (currentByte!4791 (_2!4121 (increaseBitIndex!0 bitStream1!8)))) ((_ sign_extend 32) (currentBit!4786 (_2!4121 (increaseBitIndex!0 bitStream1!8))))))))

(declare-fun lt!139630 () (_ BitVec 64))

(declare-fun lt!139628 () (_ BitVec 64))

(assert (=> d!30156 (= lt!139626 (bvmul lt!139630 lt!139628))))

(assert (=> d!30156 (or (= lt!139630 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!139628 (bvsdiv (bvmul lt!139630 lt!139628) lt!139630)))))

(assert (=> d!30156 (= lt!139628 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30156 (= lt!139630 ((_ sign_extend 32) (size!2054 (buf!2403 (_2!4121 (increaseBitIndex!0 bitStream1!8))))))))

(assert (=> d!30156 (= lt!139629 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4791 (_2!4121 (increaseBitIndex!0 bitStream1!8)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4786 (_2!4121 (increaseBitIndex!0 bitStream1!8))))))))

(assert (=> d!30156 (invariant!0 (currentBit!4786 (_2!4121 (increaseBitIndex!0 bitStream1!8))) (currentByte!4791 (_2!4121 (increaseBitIndex!0 bitStream1!8))) (size!2054 (buf!2403 (_2!4121 (increaseBitIndex!0 bitStream1!8)))))))

(assert (=> d!30156 (= (bitIndex!0 (size!2054 (buf!2403 (_2!4121 (increaseBitIndex!0 bitStream1!8)))) (currentByte!4791 (_2!4121 (increaseBitIndex!0 bitStream1!8))) (currentBit!4786 (_2!4121 (increaseBitIndex!0 bitStream1!8)))) lt!139629)))

(declare-fun b!96615 () Bool)

(declare-fun res!79369 () Bool)

(assert (=> b!96615 (=> (not res!79369) (not e!63263))))

(assert (=> b!96615 (= res!79369 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!139629))))

(declare-fun b!96616 () Bool)

(declare-fun lt!139627 () (_ BitVec 64))

(assert (=> b!96616 (= e!63263 (bvsle lt!139629 (bvmul lt!139627 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!96616 (or (= lt!139627 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!139627 #b0000000000000000000000000000000000000000000000000000000000001000) lt!139627)))))

(assert (=> b!96616 (= lt!139627 ((_ sign_extend 32) (size!2054 (buf!2403 (_2!4121 (increaseBitIndex!0 bitStream1!8))))))))

(assert (= (and d!30156 res!79368) b!96615))

(assert (= (and b!96615 res!79369) b!96616))

(declare-fun m!140009 () Bool)

(assert (=> d!30156 m!140009))

(declare-fun m!140011 () Bool)

(assert (=> d!30156 m!140011))

(assert (=> b!96567 d!30156))

(declare-fun d!30158 () Bool)

(declare-fun e!63264 () Bool)

(assert (=> d!30158 e!63264))

(declare-fun res!79370 () Bool)

(assert (=> d!30158 (=> (not res!79370) (not e!63264))))

(declare-fun lt!139634 () (_ BitVec 64))

(declare-fun lt!139633 () (_ BitVec 64))

(declare-fun lt!139635 () tuple2!7742)

(assert (=> d!30158 (= res!79370 (= (bvadd lt!139634 lt!139633) (bitIndex!0 (size!2054 (buf!2403 (_2!4121 lt!139635))) (currentByte!4791 (_2!4121 lt!139635)) (currentBit!4786 (_2!4121 lt!139635)))))))

(assert (=> d!30158 (or (not (= (bvand lt!139634 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139633 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!139634 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!139634 lt!139633) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30158 (= lt!139633 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!30158 (= lt!139634 (bitIndex!0 (size!2054 (buf!2403 bitStream1!8)) (currentByte!4791 bitStream1!8) (currentBit!4786 bitStream1!8)))))

(declare-fun Unit!5856 () Unit!5852)

(declare-fun Unit!5857 () Unit!5852)

(assert (=> d!30158 (= lt!139635 (ite (bvslt (currentBit!4786 bitStream1!8) #b00000000000000000000000000000111) (tuple2!7743 Unit!5856 (BitStream!3589 (buf!2403 bitStream1!8) (currentByte!4791 bitStream1!8) (bvadd (currentBit!4786 bitStream1!8) #b00000000000000000000000000000001))) (tuple2!7743 Unit!5857 (BitStream!3589 (buf!2403 bitStream1!8) (bvadd (currentByte!4791 bitStream1!8) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!30158 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!2054 (buf!2403 bitStream1!8))) ((_ sign_extend 32) (currentByte!4791 bitStream1!8)) ((_ sign_extend 32) (currentBit!4786 bitStream1!8))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!30158 (= (increaseBitIndex!0 bitStream1!8) lt!139635)))

(declare-fun b!96617 () Bool)

(declare-fun res!79371 () Bool)

(assert (=> b!96617 (=> (not res!79371) (not e!63264))))

(declare-fun lt!139632 () (_ BitVec 64))

(declare-fun lt!139636 () (_ BitVec 64))

(assert (=> b!96617 (= res!79371 (= (bvsub lt!139632 lt!139636) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!96617 (or (= (bvand lt!139632 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139636 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!139632 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!139632 lt!139636) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!96617 (= lt!139636 (remainingBits!0 ((_ sign_extend 32) (size!2054 (buf!2403 (_2!4121 lt!139635)))) ((_ sign_extend 32) (currentByte!4791 (_2!4121 lt!139635))) ((_ sign_extend 32) (currentBit!4786 (_2!4121 lt!139635)))))))

(assert (=> b!96617 (= lt!139632 (remainingBits!0 ((_ sign_extend 32) (size!2054 (buf!2403 bitStream1!8))) ((_ sign_extend 32) (currentByte!4791 bitStream1!8)) ((_ sign_extend 32) (currentBit!4786 bitStream1!8))))))

(declare-fun b!96618 () Bool)

(assert (=> b!96618 (= e!63264 (= (size!2054 (buf!2403 bitStream1!8)) (size!2054 (buf!2403 (_2!4121 lt!139635)))))))

(assert (= (and d!30158 res!79370) b!96617))

(assert (= (and b!96617 res!79371) b!96618))

(declare-fun m!140013 () Bool)

(assert (=> d!30158 m!140013))

(assert (=> d!30158 m!139703))

(assert (=> d!30158 m!139791))

(declare-fun m!140015 () Bool)

(assert (=> b!96617 m!140015))

(assert (=> b!96617 m!139791))

(assert (=> b!96567 d!30158))

(assert (=> b!96567 d!29970))

(declare-fun d!30160 () Bool)

(assert (=> d!30160 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2054 (buf!2403 bitStream2!8)) (currentByte!4791 bitStream2!8) (currentBit!4786 bitStream2!8))) (tuple4!57 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!2054 (buf!2403 bitStream2!8)) (currentByte!4791 bitStream2!8) (currentBit!4786 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!2054 (buf!2403 bitStream2!8)) (currentByte!4791 bitStream2!8) (currentBit!4786 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!96590 d!30160))

(assert (=> d!30110 d!30158))

(declare-fun d!30162 () Bool)

(assert (=> d!30162 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!2054 (buf!2403 bitStream1!8))) ((_ sign_extend 32) (currentByte!4791 bitStream1!8)) ((_ sign_extend 32) (currentBit!4786 bitStream1!8))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2054 (buf!2403 bitStream1!8))) ((_ sign_extend 32) (currentByte!4791 bitStream1!8)) ((_ sign_extend 32) (currentBit!4786 bitStream1!8))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!7388 () Bool)

(assert (= bs!7388 d!30162))

(assert (=> bs!7388 m!139791))

(assert (=> d!30110 d!30162))

(declare-fun d!30164 () Bool)

(assert (=> d!30164 (= (byteRangesEq!0 (select (arr!2650 (buf!2403 bitStream2!8)) (_3!249 lt!139604)) (select (arr!2650 (buf!2403 base!8)) (_3!249 lt!139604)) lt!139603 (ite c!6073 lt!139605 #b00000000000000000000000000001000)) (or (= lt!139603 (ite c!6073 lt!139605 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!2650 (buf!2403 bitStream2!8)) (_3!249 lt!139604))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!6073 lt!139605 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!139603)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!2650 (buf!2403 base!8)) (_3!249 lt!139604))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!6073 lt!139605 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!139603)))) #b00000000000000000000000011111111))))))

(declare-fun bs!7389 () Bool)

(assert (= bs!7389 d!30164))

(declare-fun m!140017 () Bool)

(assert (=> bs!7389 m!140017))

(declare-fun m!140019 () Bool)

(assert (=> bs!7389 m!140019))

(assert (=> bm!1171 d!30164))

(declare-fun d!30166 () Bool)

(assert (=> d!30166 (= (length!491 lt!139592) (size!2056 lt!139592))))

(declare-fun bs!7390 () Bool)

(assert (= bs!7390 d!30166))

(declare-fun m!140021 () Bool)

(assert (=> bs!7390 m!140021))

(assert (=> b!96577 d!30166))

(declare-fun e!63265 () tuple2!7730)

(declare-fun lt!139637 () tuple2!7732)

(declare-fun b!96620 () Bool)

(declare-fun lt!139638 () (_ BitVec 64))

(assert (=> b!96620 (= e!63265 (tuple2!7731 (Cons!896 (_1!4115 lt!139637) (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4115 lt!139637) (bvsub (bvsub (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139477) lt!139591) lt!139638))) (_2!4115 lt!139637)))))

(assert (=> b!96620 (= lt!139637 (readBit!0 (_2!4115 lt!139590)))))

(assert (=> b!96620 (= lt!139638 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!96619 () Bool)

(assert (=> b!96619 (= e!63265 (tuple2!7731 Nil!897 (_2!4115 lt!139590)))))

(declare-fun b!96622 () Bool)

(declare-fun e!63266 () Bool)

(declare-fun lt!139639 () List!900)

(assert (=> b!96622 (= e!63266 (> (length!491 lt!139639) 0))))

(declare-fun d!30168 () Bool)

(assert (=> d!30168 e!63266))

(declare-fun c!6078 () Bool)

(assert (=> d!30168 (= c!6078 (= (bvsub (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139477) lt!139591) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!30168 (= lt!139639 (_1!4114 e!63265))))

(declare-fun c!6079 () Bool)

(assert (=> d!30168 (= c!6079 (= (bvsub (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139477) lt!139591) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!30168 (bvsge (bvsub (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139477) lt!139591) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!30168 (= (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4115 lt!139590) (bvsub (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139477) lt!139591)) lt!139639)))

(declare-fun b!96621 () Bool)

(assert (=> b!96621 (= e!63266 (isEmpty!265 lt!139639))))

(assert (= (and d!30168 c!6079) b!96619))

(assert (= (and d!30168 (not c!6079)) b!96620))

(assert (= (and d!30168 c!6078) b!96621))

(assert (= (and d!30168 (not c!6078)) b!96622))

(declare-fun m!140023 () Bool)

(assert (=> b!96620 m!140023))

(declare-fun m!140025 () Bool)

(assert (=> b!96620 m!140025))

(declare-fun m!140027 () Bool)

(assert (=> b!96622 m!140027))

(declare-fun m!140029 () Bool)

(assert (=> b!96621 m!140029))

(assert (=> b!96575 d!30168))

(declare-fun d!30170 () Bool)

(declare-fun e!63267 () Bool)

(assert (=> d!30170 e!63267))

(declare-fun res!79372 () Bool)

(assert (=> d!30170 (=> (not res!79372) (not e!63267))))

(assert (=> d!30170 (= res!79372 (= (buf!2403 (_2!4121 (increaseBitIndex!0 (_2!4115 lt!139476)))) (buf!2403 (_2!4115 lt!139476))))))

(declare-fun lt!139643 () Bool)

(assert (=> d!30170 (= lt!139643 (not (= (bvand ((_ sign_extend 24) (select (arr!2650 (buf!2403 (_2!4115 lt!139476))) (currentByte!4791 (_2!4115 lt!139476)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4786 (_2!4115 lt!139476))))) #b00000000000000000000000000000000)))))

(declare-fun lt!139644 () tuple2!7732)

(assert (=> d!30170 (= lt!139644 (tuple2!7733 (not (= (bvand ((_ sign_extend 24) (select (arr!2650 (buf!2403 (_2!4115 lt!139476))) (currentByte!4791 (_2!4115 lt!139476)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4786 (_2!4115 lt!139476))))) #b00000000000000000000000000000000)) (_2!4121 (increaseBitIndex!0 (_2!4115 lt!139476)))))))

(assert (=> d!30170 (validate_offset_bit!0 ((_ sign_extend 32) (size!2054 (buf!2403 (_2!4115 lt!139476)))) ((_ sign_extend 32) (currentByte!4791 (_2!4115 lt!139476))) ((_ sign_extend 32) (currentBit!4786 (_2!4115 lt!139476))))))

(assert (=> d!30170 (= (readBit!0 (_2!4115 lt!139476)) lt!139644)))

(declare-fun lt!139641 () (_ BitVec 64))

(declare-fun b!96623 () Bool)

(declare-fun lt!139645 () (_ BitVec 64))

(assert (=> b!96623 (= e!63267 (= (bitIndex!0 (size!2054 (buf!2403 (_2!4121 (increaseBitIndex!0 (_2!4115 lt!139476))))) (currentByte!4791 (_2!4121 (increaseBitIndex!0 (_2!4115 lt!139476)))) (currentBit!4786 (_2!4121 (increaseBitIndex!0 (_2!4115 lt!139476))))) (bvadd lt!139645 lt!139641)))))

(assert (=> b!96623 (or (not (= (bvand lt!139645 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139641 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!139645 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!139645 lt!139641) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!96623 (= lt!139641 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!96623 (= lt!139645 (bitIndex!0 (size!2054 (buf!2403 (_2!4115 lt!139476))) (currentByte!4791 (_2!4115 lt!139476)) (currentBit!4786 (_2!4115 lt!139476))))))

(declare-fun lt!139646 () Bool)

(assert (=> b!96623 (= lt!139646 (not (= (bvand ((_ sign_extend 24) (select (arr!2650 (buf!2403 (_2!4115 lt!139476))) (currentByte!4791 (_2!4115 lt!139476)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4786 (_2!4115 lt!139476))))) #b00000000000000000000000000000000)))))

(declare-fun lt!139642 () Bool)

(assert (=> b!96623 (= lt!139642 (not (= (bvand ((_ sign_extend 24) (select (arr!2650 (buf!2403 (_2!4115 lt!139476))) (currentByte!4791 (_2!4115 lt!139476)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4786 (_2!4115 lt!139476))))) #b00000000000000000000000000000000)))))

(declare-fun lt!139640 () Bool)

(assert (=> b!96623 (= lt!139640 (not (= (bvand ((_ sign_extend 24) (select (arr!2650 (buf!2403 (_2!4115 lt!139476))) (currentByte!4791 (_2!4115 lt!139476)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4786 (_2!4115 lt!139476))))) #b00000000000000000000000000000000)))))

(assert (= (and d!30170 res!79372) b!96623))

(declare-fun m!140031 () Bool)

(assert (=> d!30170 m!140031))

(declare-fun m!140033 () Bool)

(assert (=> d!30170 m!140033))

(declare-fun m!140035 () Bool)

(assert (=> d!30170 m!140035))

(declare-fun m!140037 () Bool)

(assert (=> d!30170 m!140037))

(assert (=> b!96623 m!140033))

(assert (=> b!96623 m!140035))

(declare-fun m!140039 () Bool)

(assert (=> b!96623 m!140039))

(assert (=> b!96623 m!140031))

(declare-fun m!140041 () Bool)

(assert (=> b!96623 m!140041))

(assert (=> b!96575 d!30170))

(declare-fun d!30172 () Bool)

(assert (=> d!30172 (= (isEmpty!265 lt!139592) ((_ is Nil!897) lt!139592))))

(assert (=> b!96576 d!30172))

(declare-fun d!30174 () Bool)

(declare-fun e!63268 () Bool)

(assert (=> d!30174 e!63268))

(declare-fun res!79373 () Bool)

(assert (=> d!30174 (=> (not res!79373) (not e!63268))))

(declare-fun lt!139650 () (_ BitVec 64))

(declare-fun lt!139647 () (_ BitVec 64))

(declare-fun lt!139652 () (_ BitVec 64))

(assert (=> d!30174 (= res!79373 (= lt!139650 (bvsub lt!139647 lt!139652)))))

(assert (=> d!30174 (or (= (bvand lt!139647 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139652 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!139647 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!139647 lt!139652) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30174 (= lt!139652 (remainingBits!0 ((_ sign_extend 32) (size!2054 (buf!2403 (_2!4121 (increaseBitIndex!0 bitStream2!8))))) ((_ sign_extend 32) (currentByte!4791 (_2!4121 (increaseBitIndex!0 bitStream2!8)))) ((_ sign_extend 32) (currentBit!4786 (_2!4121 (increaseBitIndex!0 bitStream2!8))))))))

(declare-fun lt!139651 () (_ BitVec 64))

(declare-fun lt!139649 () (_ BitVec 64))

(assert (=> d!30174 (= lt!139647 (bvmul lt!139651 lt!139649))))

(assert (=> d!30174 (or (= lt!139651 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!139649 (bvsdiv (bvmul lt!139651 lt!139649) lt!139651)))))

(assert (=> d!30174 (= lt!139649 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30174 (= lt!139651 ((_ sign_extend 32) (size!2054 (buf!2403 (_2!4121 (increaseBitIndex!0 bitStream2!8))))))))

(assert (=> d!30174 (= lt!139650 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4791 (_2!4121 (increaseBitIndex!0 bitStream2!8)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4786 (_2!4121 (increaseBitIndex!0 bitStream2!8))))))))

(assert (=> d!30174 (invariant!0 (currentBit!4786 (_2!4121 (increaseBitIndex!0 bitStream2!8))) (currentByte!4791 (_2!4121 (increaseBitIndex!0 bitStream2!8))) (size!2054 (buf!2403 (_2!4121 (increaseBitIndex!0 bitStream2!8)))))))

(assert (=> d!30174 (= (bitIndex!0 (size!2054 (buf!2403 (_2!4121 (increaseBitIndex!0 bitStream2!8)))) (currentByte!4791 (_2!4121 (increaseBitIndex!0 bitStream2!8))) (currentBit!4786 (_2!4121 (increaseBitIndex!0 bitStream2!8)))) lt!139650)))

(declare-fun b!96624 () Bool)

(declare-fun res!79374 () Bool)

(assert (=> b!96624 (=> (not res!79374) (not e!63268))))

(assert (=> b!96624 (= res!79374 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!139650))))

(declare-fun b!96625 () Bool)

(declare-fun lt!139648 () (_ BitVec 64))

(assert (=> b!96625 (= e!63268 (bvsle lt!139650 (bvmul lt!139648 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!96625 (or (= lt!139648 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!139648 #b0000000000000000000000000000000000000000000000000000000000001000) lt!139648)))))

(assert (=> b!96625 (= lt!139648 ((_ sign_extend 32) (size!2054 (buf!2403 (_2!4121 (increaseBitIndex!0 bitStream2!8))))))))

(assert (= (and d!30174 res!79373) b!96624))

(assert (= (and b!96624 res!79374) b!96625))

(declare-fun m!140043 () Bool)

(assert (=> d!30174 m!140043))

(declare-fun m!140045 () Bool)

(assert (=> d!30174 m!140045))

(assert (=> b!96578 d!30174))

(assert (=> b!96578 d!30148))

(assert (=> b!96578 d!29984))

(declare-fun d!30176 () Bool)

(declare-fun lt!139653 () Int)

(assert (=> d!30176 (>= lt!139653 0)))

(declare-fun e!63269 () Int)

(assert (=> d!30176 (= lt!139653 e!63269)))

(declare-fun c!6080 () Bool)

(assert (=> d!30176 (= c!6080 ((_ is Nil!897) (t!1650 listBits!13)))))

(assert (=> d!30176 (= (size!2056 (t!1650 listBits!13)) lt!139653)))

(declare-fun b!96626 () Bool)

(assert (=> b!96626 (= e!63269 0)))

(declare-fun b!96627 () Bool)

(assert (=> b!96627 (= e!63269 (+ 1 (size!2056 (t!1650 (t!1650 listBits!13)))))))

(assert (= (and d!30176 c!6080) b!96626))

(assert (= (and d!30176 (not c!6080)) b!96627))

(declare-fun m!140047 () Bool)

(assert (=> b!96627 m!140047))

(assert (=> b!96573 d!30176))

(declare-fun d!30178 () Bool)

(assert (=> d!30178 (= (length!491 lt!139608) (size!2056 lt!139608))))

(declare-fun bs!7391 () Bool)

(assert (= bs!7391 d!30178))

(declare-fun m!140049 () Bool)

(assert (=> bs!7391 m!140049))

(assert (=> b!96596 d!30178))

(declare-fun d!30180 () Bool)

(declare-fun res!79375 () Bool)

(declare-fun e!63270 () Bool)

(assert (=> d!30180 (=> res!79375 e!63270)))

(assert (=> d!30180 (= res!79375 (= (_1!4120 lt!139564) (_2!4120 lt!139564)))))

(assert (=> d!30180 (= (arrayRangesEq!29 (buf!2403 bitStream1!8) (buf!2403 bitStream2!8) (_1!4120 lt!139564) (_2!4120 lt!139564)) e!63270)))

(declare-fun b!96628 () Bool)

(declare-fun e!63271 () Bool)

(assert (=> b!96628 (= e!63270 e!63271)))

(declare-fun res!79376 () Bool)

(assert (=> b!96628 (=> (not res!79376) (not e!63271))))

(assert (=> b!96628 (= res!79376 (= (select (arr!2650 (buf!2403 bitStream1!8)) (_1!4120 lt!139564)) (select (arr!2650 (buf!2403 bitStream2!8)) (_1!4120 lt!139564))))))

(declare-fun b!96629 () Bool)

(assert (=> b!96629 (= e!63271 (arrayRangesEq!29 (buf!2403 bitStream1!8) (buf!2403 bitStream2!8) (bvadd (_1!4120 lt!139564) #b00000000000000000000000000000001) (_2!4120 lt!139564)))))

(assert (= (and d!30180 (not res!79375)) b!96628))

(assert (= (and b!96628 res!79376) b!96629))

(declare-fun m!140051 () Bool)

(assert (=> b!96628 m!140051))

(declare-fun m!140053 () Bool)

(assert (=> b!96628 m!140053))

(declare-fun m!140055 () Bool)

(assert (=> b!96629 m!140055))

(assert (=> b!96558 d!30180))

(declare-fun lt!139654 () tuple2!7732)

(declare-fun lt!139655 () (_ BitVec 64))

(declare-fun b!96631 () Bool)

(declare-fun e!63272 () tuple2!7730)

(assert (=> b!96631 (= e!63272 (tuple2!7731 (Cons!896 (_1!4115 lt!139654) (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4115 lt!139654) (bvsub (bvsub (bvsub nBits!484 lt!139429) lt!139607) lt!139655))) (_2!4115 lt!139654)))))

(assert (=> b!96631 (= lt!139654 (readBit!0 (_2!4115 lt!139606)))))

(assert (=> b!96631 (= lt!139655 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!96630 () Bool)

(assert (=> b!96630 (= e!63272 (tuple2!7731 Nil!897 (_2!4115 lt!139606)))))

(declare-fun b!96633 () Bool)

(declare-fun e!63273 () Bool)

(declare-fun lt!139656 () List!900)

(assert (=> b!96633 (= e!63273 (> (length!491 lt!139656) 0))))

(declare-fun d!30182 () Bool)

(assert (=> d!30182 e!63273))

(declare-fun c!6081 () Bool)

(assert (=> d!30182 (= c!6081 (= (bvsub (bvsub nBits!484 lt!139429) lt!139607) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!30182 (= lt!139656 (_1!4114 e!63272))))

(declare-fun c!6082 () Bool)

(assert (=> d!30182 (= c!6082 (= (bvsub (bvsub nBits!484 lt!139429) lt!139607) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!30182 (bvsge (bvsub (bvsub nBits!484 lt!139429) lt!139607) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!30182 (= (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4115 lt!139606) (bvsub (bvsub nBits!484 lt!139429) lt!139607)) lt!139656)))

(declare-fun b!96632 () Bool)

(assert (=> b!96632 (= e!63273 (isEmpty!265 lt!139656))))

(assert (= (and d!30182 c!6082) b!96630))

(assert (= (and d!30182 (not c!6082)) b!96631))

(assert (= (and d!30182 c!6081) b!96632))

(assert (= (and d!30182 (not c!6081)) b!96633))

(declare-fun m!140057 () Bool)

(assert (=> b!96631 m!140057))

(declare-fun m!140059 () Bool)

(assert (=> b!96631 m!140059))

(declare-fun m!140061 () Bool)

(assert (=> b!96633 m!140061))

(declare-fun m!140063 () Bool)

(assert (=> b!96632 m!140063))

(assert (=> b!96594 d!30182))

(declare-fun d!30184 () Bool)

(declare-fun e!63274 () Bool)

(assert (=> d!30184 e!63274))

(declare-fun res!79377 () Bool)

(assert (=> d!30184 (=> (not res!79377) (not e!63274))))

(assert (=> d!30184 (= res!79377 (= (buf!2403 (_2!4121 (increaseBitIndex!0 (_2!4115 lt!139428)))) (buf!2403 (_2!4115 lt!139428))))))

(declare-fun lt!139660 () Bool)

(assert (=> d!30184 (= lt!139660 (not (= (bvand ((_ sign_extend 24) (select (arr!2650 (buf!2403 (_2!4115 lt!139428))) (currentByte!4791 (_2!4115 lt!139428)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4786 (_2!4115 lt!139428))))) #b00000000000000000000000000000000)))))

(declare-fun lt!139661 () tuple2!7732)

(assert (=> d!30184 (= lt!139661 (tuple2!7733 (not (= (bvand ((_ sign_extend 24) (select (arr!2650 (buf!2403 (_2!4115 lt!139428))) (currentByte!4791 (_2!4115 lt!139428)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4786 (_2!4115 lt!139428))))) #b00000000000000000000000000000000)) (_2!4121 (increaseBitIndex!0 (_2!4115 lt!139428)))))))

(assert (=> d!30184 (validate_offset_bit!0 ((_ sign_extend 32) (size!2054 (buf!2403 (_2!4115 lt!139428)))) ((_ sign_extend 32) (currentByte!4791 (_2!4115 lt!139428))) ((_ sign_extend 32) (currentBit!4786 (_2!4115 lt!139428))))))

(assert (=> d!30184 (= (readBit!0 (_2!4115 lt!139428)) lt!139661)))

(declare-fun b!96634 () Bool)

(declare-fun lt!139662 () (_ BitVec 64))

(declare-fun lt!139658 () (_ BitVec 64))

(assert (=> b!96634 (= e!63274 (= (bitIndex!0 (size!2054 (buf!2403 (_2!4121 (increaseBitIndex!0 (_2!4115 lt!139428))))) (currentByte!4791 (_2!4121 (increaseBitIndex!0 (_2!4115 lt!139428)))) (currentBit!4786 (_2!4121 (increaseBitIndex!0 (_2!4115 lt!139428))))) (bvadd lt!139662 lt!139658)))))

(assert (=> b!96634 (or (not (= (bvand lt!139662 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139658 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!139662 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!139662 lt!139658) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!96634 (= lt!139658 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!96634 (= lt!139662 (bitIndex!0 (size!2054 (buf!2403 (_2!4115 lt!139428))) (currentByte!4791 (_2!4115 lt!139428)) (currentBit!4786 (_2!4115 lt!139428))))))

(declare-fun lt!139663 () Bool)

(assert (=> b!96634 (= lt!139663 (not (= (bvand ((_ sign_extend 24) (select (arr!2650 (buf!2403 (_2!4115 lt!139428))) (currentByte!4791 (_2!4115 lt!139428)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4786 (_2!4115 lt!139428))))) #b00000000000000000000000000000000)))))

(declare-fun lt!139659 () Bool)

(assert (=> b!96634 (= lt!139659 (not (= (bvand ((_ sign_extend 24) (select (arr!2650 (buf!2403 (_2!4115 lt!139428))) (currentByte!4791 (_2!4115 lt!139428)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4786 (_2!4115 lt!139428))))) #b00000000000000000000000000000000)))))

(declare-fun lt!139657 () Bool)

(assert (=> b!96634 (= lt!139657 (not (= (bvand ((_ sign_extend 24) (select (arr!2650 (buf!2403 (_2!4115 lt!139428))) (currentByte!4791 (_2!4115 lt!139428)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4786 (_2!4115 lt!139428))))) #b00000000000000000000000000000000)))))

(assert (= (and d!30184 res!79377) b!96634))

(declare-fun m!140065 () Bool)

(assert (=> d!30184 m!140065))

(declare-fun m!140067 () Bool)

(assert (=> d!30184 m!140067))

(declare-fun m!140069 () Bool)

(assert (=> d!30184 m!140069))

(declare-fun m!140071 () Bool)

(assert (=> d!30184 m!140071))

(assert (=> b!96634 m!140067))

(assert (=> b!96634 m!140069))

(declare-fun m!140073 () Bool)

(assert (=> b!96634 m!140073))

(assert (=> b!96634 m!140065))

(declare-fun m!140075 () Bool)

(assert (=> b!96634 m!140075))

(assert (=> b!96594 d!30184))

(declare-fun d!30186 () Bool)

(assert (=> d!30186 (= (isEmpty!265 lt!139608) ((_ is Nil!897) lt!139608))))

(assert (=> b!96595 d!30186))

(check-sat (not b!96621) (not b!96631) (not d!30174) (not d!30148) (not d!30158) (not d!30184) (not b!96623) (not b!96622) (not d!30166) (not b!96632) (not d!30178) (not b!96617) (not b!96633) (not b!96620) (not b!96606) (not b!96634) (not d!30150) (not d!30162) (not d!30170) (not b!96627) (not b!96604) (not b!96629) (not b!96602) (not d!30156) (not b!96608) (not b!96613))
(check-sat)
