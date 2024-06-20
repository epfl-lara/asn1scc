; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18622 () Bool)

(assert start!18622)

(declare-fun b!92437 () Bool)

(declare-fun res!76301 () Bool)

(declare-fun e!60766 () Bool)

(assert (=> b!92437 (=> (not res!76301) (not e!60766))))

(declare-datatypes ((array!4327 0))(
  ( (array!4328 (arr!2582 (Array (_ BitVec 32) (_ BitVec 8))) (size!1957 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3452 0))(
  ( (BitStream!3453 (buf!2335 array!4327) (currentByte!4654 (_ BitVec 32)) (currentBit!4649 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3452)

(declare-fun bitStream2!8 () BitStream!3452)

(declare-fun base!8 () BitStream!3452)

(assert (=> b!92437 (= res!76301 (and (= (buf!2335 bitStream1!8) (buf!2335 bitStream2!8)) (= (buf!2335 bitStream1!8) (buf!2335 base!8))))))

(declare-fun b!92438 () Bool)

(declare-fun e!60764 () Bool)

(declare-fun array_inv!1791 (array!4327) Bool)

(assert (=> b!92438 (= e!60764 (array_inv!1791 (buf!2335 bitStream1!8)))))

(declare-fun b!92439 () Bool)

(declare-fun e!60762 () Bool)

(assert (=> b!92439 (= e!60762 (array_inv!1791 (buf!2335 base!8)))))

(declare-fun b!92440 () Bool)

(declare-fun res!76302 () Bool)

(assert (=> b!92440 (=> (not res!76302) (not e!60766))))

(declare-datatypes ((List!832 0))(
  ( (Nil!829) (Cons!828 (h!947 Bool) (t!1582 List!832)) )
))
(declare-fun listBits!13 () List!832)

(declare-fun length!423 (List!832) Int)

(assert (=> b!92440 (= res!76302 (> (length!423 listBits!13) 0))))

(declare-fun res!76307 () Bool)

(assert (=> start!18622 (=> (not res!76307) (not e!60766))))

(declare-fun nBits!484 () (_ BitVec 64))

(assert (=> start!18622 (= res!76307 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18622 e!60766))

(assert (=> start!18622 true))

(declare-fun inv!12 (BitStream!3452) Bool)

(assert (=> start!18622 (and (inv!12 bitStream1!8) e!60764)))

(declare-fun e!60767 () Bool)

(assert (=> start!18622 (and (inv!12 bitStream2!8) e!60767)))

(assert (=> start!18622 (and (inv!12 base!8) e!60762)))

(declare-fun b!92441 () Bool)

(assert (=> b!92441 (= e!60767 (array_inv!1791 (buf!2335 bitStream2!8)))))

(declare-fun b!92442 () Bool)

(declare-fun res!76299 () Bool)

(assert (=> b!92442 (=> (not res!76299) (not e!60766))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!92442 (= res!76299 (bvslt (bitIndex!0 (size!1957 (buf!2335 base!8)) (currentByte!4654 base!8) (currentBit!4649 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!92443 () Bool)

(declare-fun res!76303 () Bool)

(assert (=> b!92443 (=> (not res!76303) (not e!60766))))

(declare-fun isPrefixOf!0 (BitStream!3452 BitStream!3452) Bool)

(assert (=> b!92443 (= res!76303 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!92444 () Bool)

(declare-fun res!76305 () Bool)

(assert (=> b!92444 (=> (not res!76305) (not e!60766))))

(assert (=> b!92444 (= res!76305 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1957 (buf!2335 bitStream1!8)) (currentByte!4654 bitStream1!8) (currentBit!4649 bitStream1!8))) (bitIndex!0 (size!1957 (buf!2335 bitStream2!8)) (currentByte!4654 bitStream2!8) (currentBit!4649 bitStream2!8))))))

(declare-fun b!92445 () Bool)

(declare-fun res!76304 () Bool)

(assert (=> b!92445 (=> (not res!76304) (not e!60766))))

(assert (=> b!92445 (= res!76304 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!92446 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!92446 (= e!60766 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4649 bitStream1!8))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4654 bitStream1!8))) ((_ extract 31 0) ((_ sign_extend 32) (size!1957 (buf!2335 bitStream1!8)))))))))

(declare-fun b!92447 () Bool)

(declare-fun res!76306 () Bool)

(assert (=> b!92447 (=> (not res!76306) (not e!60766))))

(assert (=> b!92447 (= res!76306 (and (bvsle ((_ sign_extend 32) (size!1957 (buf!2335 bitStream1!8))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4654 bitStream1!8)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4649 bitStream1!8)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!1957 (buf!2335 bitStream1!8))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4654 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4649 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!92448 () Bool)

(declare-fun res!76300 () Bool)

(assert (=> b!92448 (=> (not res!76300) (not e!60766))))

(assert (=> b!92448 (= res!76300 (isPrefixOf!0 bitStream2!8 base!8))))

(assert (= (and start!18622 res!76307) b!92440))

(assert (= (and b!92440 res!76302) b!92445))

(assert (= (and b!92445 res!76304) b!92448))

(assert (= (and b!92448 res!76300) b!92443))

(assert (= (and b!92443 res!76303) b!92437))

(assert (= (and b!92437 res!76301) b!92442))

(assert (= (and b!92442 res!76299) b!92444))

(assert (= (and b!92444 res!76305) b!92447))

(assert (= (and b!92447 res!76306) b!92446))

(assert (= start!18622 b!92438))

(assert (= start!18622 b!92441))

(assert (= start!18622 b!92439))

(declare-fun m!136417 () Bool)

(assert (=> b!92442 m!136417))

(declare-fun m!136419 () Bool)

(assert (=> start!18622 m!136419))

(declare-fun m!136421 () Bool)

(assert (=> start!18622 m!136421))

(declare-fun m!136423 () Bool)

(assert (=> start!18622 m!136423))

(declare-fun m!136425 () Bool)

(assert (=> b!92446 m!136425))

(declare-fun m!136427 () Bool)

(assert (=> b!92443 m!136427))

(declare-fun m!136429 () Bool)

(assert (=> b!92438 m!136429))

(declare-fun m!136431 () Bool)

(assert (=> b!92445 m!136431))

(declare-fun m!136433 () Bool)

(assert (=> b!92439 m!136433))

(declare-fun m!136435 () Bool)

(assert (=> b!92441 m!136435))

(declare-fun m!136437 () Bool)

(assert (=> b!92440 m!136437))

(declare-fun m!136439 () Bool)

(assert (=> b!92444 m!136439))

(declare-fun m!136441 () Bool)

(assert (=> b!92444 m!136441))

(declare-fun m!136443 () Bool)

(assert (=> b!92448 m!136443))

(push 1)

(assert (not b!92446))

(assert (not start!18622))

(assert (not b!92448))

(assert (not b!92440))

(assert (not b!92438))

(assert (not b!92445))

(assert (not b!92443))

(assert (not b!92442))

(assert (not b!92444))

(assert (not b!92441))

(assert (not b!92439))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!28832 () Bool)

(assert (=> d!28832 (= (array_inv!1791 (buf!2335 bitStream1!8)) (bvsge (size!1957 (buf!2335 bitStream1!8)) #b00000000000000000000000000000000))))

(assert (=> b!92438 d!28832))

(declare-fun d!28836 () Bool)

(assert (=> d!28836 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4649 bitStream1!8) (currentByte!4654 bitStream1!8) (size!1957 (buf!2335 bitStream1!8))))))

(declare-fun bs!7098 () Bool)

(assert (= bs!7098 d!28836))

(declare-fun m!136469 () Bool)

(assert (=> bs!7098 m!136469))

(assert (=> start!18622 d!28836))

(declare-fun d!28838 () Bool)

(assert (=> d!28838 (= (inv!12 bitStream2!8) (invariant!0 (currentBit!4649 bitStream2!8) (currentByte!4654 bitStream2!8) (size!1957 (buf!2335 bitStream2!8))))))

(declare-fun bs!7099 () Bool)

(assert (= bs!7099 d!28838))

(declare-fun m!136471 () Bool)

(assert (=> bs!7099 m!136471))

(assert (=> start!18622 d!28838))

(declare-fun d!28840 () Bool)

(assert (=> d!28840 (= (inv!12 base!8) (invariant!0 (currentBit!4649 base!8) (currentByte!4654 base!8) (size!1957 (buf!2335 base!8))))))

(declare-fun bs!7100 () Bool)

(assert (= bs!7100 d!28840))

(declare-fun m!136473 () Bool)

(assert (=> bs!7100 m!136473))

(assert (=> start!18622 d!28840))

(declare-fun d!28842 () Bool)

(declare-fun res!76354 () Bool)

(declare-fun e!60798 () Bool)

(assert (=> d!28842 (=> (not res!76354) (not e!60798))))

(assert (=> d!28842 (= res!76354 (= (size!1957 (buf!2335 bitStream2!8)) (size!1957 (buf!2335 base!8))))))

(assert (=> d!28842 (= (isPrefixOf!0 bitStream2!8 base!8) e!60798)))

(declare-fun b!92495 () Bool)

(declare-fun res!76355 () Bool)

(assert (=> b!92495 (=> (not res!76355) (not e!60798))))

(assert (=> b!92495 (= res!76355 (bvsle (bitIndex!0 (size!1957 (buf!2335 bitStream2!8)) (currentByte!4654 bitStream2!8) (currentBit!4649 bitStream2!8)) (bitIndex!0 (size!1957 (buf!2335 base!8)) (currentByte!4654 base!8) (currentBit!4649 base!8))))))

(declare-fun b!92496 () Bool)

(declare-fun e!60797 () Bool)

(assert (=> b!92496 (= e!60798 e!60797)))

(declare-fun res!76356 () Bool)

(assert (=> b!92496 (=> res!76356 e!60797)))

(assert (=> b!92496 (= res!76356 (= (size!1957 (buf!2335 bitStream2!8)) #b00000000000000000000000000000000))))

(declare-fun b!92497 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4327 array!4327 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!92497 (= e!60797 (arrayBitRangesEq!0 (buf!2335 bitStream2!8) (buf!2335 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1957 (buf!2335 bitStream2!8)) (currentByte!4654 bitStream2!8) (currentBit!4649 bitStream2!8))))))

(assert (= (and d!28842 res!76354) b!92495))

(assert (= (and b!92495 res!76355) b!92496))

(assert (= (and b!92496 (not res!76356)) b!92497))

(assert (=> b!92495 m!136441))

(assert (=> b!92495 m!136417))

(assert (=> b!92497 m!136441))

(assert (=> b!92497 m!136441))

(declare-fun m!136479 () Bool)

(assert (=> b!92497 m!136479))

(assert (=> b!92448 d!28842))

(declare-fun d!28852 () Bool)

(assert (=> d!28852 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4649 bitStream1!8))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4654 bitStream1!8))) ((_ extract 31 0) ((_ sign_extend 32) (size!1957 (buf!2335 bitStream1!8))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4649 bitStream1!8))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4649 bitStream1!8))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4654 bitStream1!8))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4654 bitStream1!8))) ((_ extract 31 0) ((_ sign_extend 32) (size!1957 (buf!2335 bitStream1!8))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4649 bitStream1!8))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4654 bitStream1!8))) ((_ extract 31 0) ((_ sign_extend 32) (size!1957 (buf!2335 bitStream1!8)))))))))))

(assert (=> b!92446 d!28852))

(declare-fun d!28858 () Bool)

(declare-fun res!76361 () Bool)

(declare-fun e!60802 () Bool)

(assert (=> d!28858 (=> (not res!76361) (not e!60802))))

(assert (=> d!28858 (= res!76361 (= (size!1957 (buf!2335 bitStream1!8)) (size!1957 (buf!2335 base!8))))))

(assert (=> d!28858 (= (isPrefixOf!0 bitStream1!8 base!8) e!60802)))

(declare-fun b!92502 () Bool)

(declare-fun res!76362 () Bool)

(assert (=> b!92502 (=> (not res!76362) (not e!60802))))

(assert (=> b!92502 (= res!76362 (bvsle (bitIndex!0 (size!1957 (buf!2335 bitStream1!8)) (currentByte!4654 bitStream1!8) (currentBit!4649 bitStream1!8)) (bitIndex!0 (size!1957 (buf!2335 base!8)) (currentByte!4654 base!8) (currentBit!4649 base!8))))))

(declare-fun b!92503 () Bool)

(declare-fun e!60801 () Bool)

(assert (=> b!92503 (= e!60802 e!60801)))

(declare-fun res!76363 () Bool)

(assert (=> b!92503 (=> res!76363 e!60801)))

(assert (=> b!92503 (= res!76363 (= (size!1957 (buf!2335 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!92504 () Bool)

(assert (=> b!92504 (= e!60801 (arrayBitRangesEq!0 (buf!2335 bitStream1!8) (buf!2335 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1957 (buf!2335 bitStream1!8)) (currentByte!4654 bitStream1!8) (currentBit!4649 bitStream1!8))))))

(assert (= (and d!28858 res!76361) b!92502))

(assert (= (and b!92502 res!76362) b!92503))

(assert (= (and b!92503 (not res!76363)) b!92504))

(assert (=> b!92502 m!136439))

(assert (=> b!92502 m!136417))

(assert (=> b!92504 m!136439))

(assert (=> b!92504 m!136439))

(declare-fun m!136489 () Bool)

(assert (=> b!92504 m!136489))

(assert (=> b!92445 d!28858))

(declare-fun d!28862 () Bool)

(declare-fun res!76364 () Bool)

(declare-fun e!60804 () Bool)

(assert (=> d!28862 (=> (not res!76364) (not e!60804))))

(assert (=> d!28862 (= res!76364 (= (size!1957 (buf!2335 bitStream1!8)) (size!1957 (buf!2335 bitStream2!8))))))

(assert (=> d!28862 (= (isPrefixOf!0 bitStream1!8 bitStream2!8) e!60804)))

(declare-fun b!92505 () Bool)

(declare-fun res!76365 () Bool)

(assert (=> b!92505 (=> (not res!76365) (not e!60804))))

(assert (=> b!92505 (= res!76365 (bvsle (bitIndex!0 (size!1957 (buf!2335 bitStream1!8)) (currentByte!4654 bitStream1!8) (currentBit!4649 bitStream1!8)) (bitIndex!0 (size!1957 (buf!2335 bitStream2!8)) (currentByte!4654 bitStream2!8) (currentBit!4649 bitStream2!8))))))

(declare-fun b!92506 () Bool)

(declare-fun e!60803 () Bool)

(assert (=> b!92506 (= e!60804 e!60803)))

(declare-fun res!76366 () Bool)

(assert (=> b!92506 (=> res!76366 e!60803)))

(assert (=> b!92506 (= res!76366 (= (size!1957 (buf!2335 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!92507 () Bool)

(assert (=> b!92507 (= e!60803 (arrayBitRangesEq!0 (buf!2335 bitStream1!8) (buf!2335 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1957 (buf!2335 bitStream1!8)) (currentByte!4654 bitStream1!8) (currentBit!4649 bitStream1!8))))))

(assert (= (and d!28862 res!76364) b!92505))

(assert (= (and b!92505 res!76365) b!92506))

(assert (= (and b!92506 (not res!76366)) b!92507))

(assert (=> b!92505 m!136439))

(assert (=> b!92505 m!136441))

(assert (=> b!92507 m!136439))

(assert (=> b!92507 m!136439))

(declare-fun m!136491 () Bool)

(assert (=> b!92507 m!136491))

(assert (=> b!92443 d!28862))

(declare-fun d!28864 () Bool)

(declare-fun e!60811 () Bool)

(assert (=> d!28864 e!60811))

(declare-fun res!76377 () Bool)

(assert (=> d!28864 (=> (not res!76377) (not e!60811))))

(declare-fun lt!138212 () (_ BitVec 64))

(declare-fun lt!138213 () (_ BitVec 64))

(declare-fun lt!138211 () (_ BitVec 64))

(assert (=> d!28864 (= res!76377 (= lt!138212 (bvsub lt!138211 lt!138213)))))

(assert (=> d!28864 (or (= (bvand lt!138211 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138213 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138211 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138211 lt!138213) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!28864 (= lt!138213 (remainingBits!0 ((_ sign_extend 32) (size!1957 (buf!2335 bitStream1!8))) ((_ sign_extend 32) (currentByte!4654 bitStream1!8)) ((_ sign_extend 32) (currentBit!4649 bitStream1!8))))))

(declare-fun lt!138215 () (_ BitVec 64))

(declare-fun lt!138216 () (_ BitVec 64))

(assert (=> d!28864 (= lt!138211 (bvmul lt!138215 lt!138216))))

(assert (=> d!28864 (or (= lt!138215 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138216 (bvsdiv (bvmul lt!138215 lt!138216) lt!138215)))))

(assert (=> d!28864 (= lt!138216 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28864 (= lt!138215 ((_ sign_extend 32) (size!1957 (buf!2335 bitStream1!8))))))

(assert (=> d!28864 (= lt!138212 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4654 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4649 bitStream1!8))))))

(assert (=> d!28864 (invariant!0 (currentBit!4649 bitStream1!8) (currentByte!4654 bitStream1!8) (size!1957 (buf!2335 bitStream1!8)))))

(assert (=> d!28864 (= (bitIndex!0 (size!1957 (buf!2335 bitStream1!8)) (currentByte!4654 bitStream1!8) (currentBit!4649 bitStream1!8)) lt!138212)))

(declare-fun b!92518 () Bool)

(declare-fun res!76378 () Bool)

(assert (=> b!92518 (=> (not res!76378) (not e!60811))))

(assert (=> b!92518 (= res!76378 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138212))))

(declare-fun b!92519 () Bool)

(declare-fun lt!138214 () (_ BitVec 64))

(assert (=> b!92519 (= e!60811 (bvsle lt!138212 (bvmul lt!138214 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!92519 (or (= lt!138214 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138214 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138214)))))

(assert (=> b!92519 (= lt!138214 ((_ sign_extend 32) (size!1957 (buf!2335 bitStream1!8))))))

(assert (= (and d!28864 res!76377) b!92518))

(assert (= (and b!92518 res!76378) b!92519))

(declare-fun m!136497 () Bool)

(assert (=> d!28864 m!136497))

(assert (=> d!28864 m!136469))

(assert (=> b!92444 d!28864))

(declare-fun d!28874 () Bool)

(declare-fun e!60812 () Bool)

(assert (=> d!28874 e!60812))

(declare-fun res!76379 () Bool)

(assert (=> d!28874 (=> (not res!76379) (not e!60812))))

(declare-fun lt!138218 () (_ BitVec 64))

(declare-fun lt!138219 () (_ BitVec 64))

(declare-fun lt!138217 () (_ BitVec 64))

(assert (=> d!28874 (= res!76379 (= lt!138218 (bvsub lt!138217 lt!138219)))))

(assert (=> d!28874 (or (= (bvand lt!138217 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138219 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138217 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138217 lt!138219) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28874 (= lt!138219 (remainingBits!0 ((_ sign_extend 32) (size!1957 (buf!2335 bitStream2!8))) ((_ sign_extend 32) (currentByte!4654 bitStream2!8)) ((_ sign_extend 32) (currentBit!4649 bitStream2!8))))))

(declare-fun lt!138221 () (_ BitVec 64))

(declare-fun lt!138222 () (_ BitVec 64))

(assert (=> d!28874 (= lt!138217 (bvmul lt!138221 lt!138222))))

(assert (=> d!28874 (or (= lt!138221 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138222 (bvsdiv (bvmul lt!138221 lt!138222) lt!138221)))))

(assert (=> d!28874 (= lt!138222 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28874 (= lt!138221 ((_ sign_extend 32) (size!1957 (buf!2335 bitStream2!8))))))

(assert (=> d!28874 (= lt!138218 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4654 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4649 bitStream2!8))))))

(assert (=> d!28874 (invariant!0 (currentBit!4649 bitStream2!8) (currentByte!4654 bitStream2!8) (size!1957 (buf!2335 bitStream2!8)))))

(assert (=> d!28874 (= (bitIndex!0 (size!1957 (buf!2335 bitStream2!8)) (currentByte!4654 bitStream2!8) (currentBit!4649 bitStream2!8)) lt!138218)))

(declare-fun b!92520 () Bool)

(declare-fun res!76380 () Bool)

(assert (=> b!92520 (=> (not res!76380) (not e!60812))))

(assert (=> b!92520 (= res!76380 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138218))))

(declare-fun b!92521 () Bool)

(declare-fun lt!138220 () (_ BitVec 64))

(assert (=> b!92521 (= e!60812 (bvsle lt!138218 (bvmul lt!138220 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!92521 (or (= lt!138220 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138220 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138220)))))

(assert (=> b!92521 (= lt!138220 ((_ sign_extend 32) (size!1957 (buf!2335 bitStream2!8))))))

(assert (= (and d!28874 res!76379) b!92520))

(assert (= (and b!92520 res!76380) b!92521))

(declare-fun m!136499 () Bool)

(assert (=> d!28874 m!136499))

(assert (=> d!28874 m!136471))

(assert (=> b!92444 d!28874))

(declare-fun d!28876 () Bool)

(declare-fun e!60813 () Bool)

(assert (=> d!28876 e!60813))

(declare-fun res!76381 () Bool)

(assert (=> d!28876 (=> (not res!76381) (not e!60813))))

(declare-fun lt!138223 () (_ BitVec 64))

(declare-fun lt!138225 () (_ BitVec 64))

(declare-fun lt!138224 () (_ BitVec 64))

(assert (=> d!28876 (= res!76381 (= lt!138224 (bvsub lt!138223 lt!138225)))))

(assert (=> d!28876 (or (= (bvand lt!138223 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138225 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138223 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138223 lt!138225) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28876 (= lt!138225 (remainingBits!0 ((_ sign_extend 32) (size!1957 (buf!2335 base!8))) ((_ sign_extend 32) (currentByte!4654 base!8)) ((_ sign_extend 32) (currentBit!4649 base!8))))))

(declare-fun lt!138227 () (_ BitVec 64))

(declare-fun lt!138228 () (_ BitVec 64))

(assert (=> d!28876 (= lt!138223 (bvmul lt!138227 lt!138228))))

(assert (=> d!28876 (or (= lt!138227 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138228 (bvsdiv (bvmul lt!138227 lt!138228) lt!138227)))))

(assert (=> d!28876 (= lt!138228 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28876 (= lt!138227 ((_ sign_extend 32) (size!1957 (buf!2335 base!8))))))

(assert (=> d!28876 (= lt!138224 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4654 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4649 base!8))))))

