; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31172 () Bool)

(assert start!31172)

(declare-fun b!157151 () Bool)

(declare-fun e!106371 () Bool)

(declare-fun e!106372 () Bool)

(assert (=> b!157151 (= e!106371 (not e!106372))))

(declare-fun res!131341 () Bool)

(assert (=> b!157151 (=> res!131341 e!106372)))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(assert (=> b!157151 (= res!131341 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236)))))

(declare-fun lt!246496 () (_ BitVec 64))

(declare-fun lt!246494 () (_ BitVec 64))

(declare-datatypes ((array!7237 0))(
  ( (array!7238 (arr!4153 (Array (_ BitVec 32) (_ BitVec 8))) (size!3276 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5750 0))(
  ( (BitStream!5751 (buf!3749 array!7237) (currentByte!6885 (_ BitVec 32)) (currentBit!6880 (_ BitVec 32))) )
))
(declare-fun lt!246493 () BitStream!5750)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157151 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3276 (buf!3749 lt!246493))) lt!246496 lt!246494 (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001))))

(assert (=> b!157151 (= lt!246494 ((_ sign_extend 32) (currentBit!6880 lt!246493)))))

(assert (=> b!157151 (= lt!246496 ((_ sign_extend 32) (currentByte!6885 lt!246493)))))

(declare-fun bs!65 () BitStream!5750)

(declare-datatypes ((Unit!10265 0))(
  ( (Unit!10266) )
))
(declare-fun lt!246490 () Unit!10265)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5750 BitStream!5750 (_ BitVec 64) (_ BitVec 32)) Unit!10265)

(assert (=> b!157151 (= lt!246490 (validateOffsetBytesFromBitIndexLemma!0 bs!65 lt!246493 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)))))

(declare-datatypes ((tuple2!14142 0))(
  ( (tuple2!14143 (_1!7518 BitStream!5750) (_2!7518 (_ BitVec 8))) )
))
(declare-fun lt!246499 () tuple2!14142)

(declare-fun readBytePure!0 (BitStream!5750) tuple2!14142)

(assert (=> b!157151 (= lt!246499 (readBytePure!0 lt!246493))))

(declare-fun b!157152 () Bool)

(declare-datatypes ((tuple2!14144 0))(
  ( (tuple2!14145 (_1!7519 BitStream!5750) (_2!7519 array!7237)) )
))
(declare-fun lt!246497 () tuple2!14144)

(declare-fun lt!246491 () tuple2!14144)

(assert (=> b!157152 (= e!106372 (or (bvsgt #b00000000000000000000000000000000 to!236) (bvsgt (size!3276 (_2!7519 lt!246497)) (size!3276 (_2!7519 lt!246491))) (bvsle to!236 (size!3276 (_2!7519 lt!246497)))))))

(declare-fun lt!246498 () tuple2!14144)

(declare-fun arrayRangesEq!436 (array!7237 array!7237 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!157152 (arrayRangesEq!436 (_2!7519 lt!246491) (_2!7519 lt!246498) #b00000000000000000000000000000000 to!236)))

(declare-fun lt!246495 () array!7237)

(declare-fun lt!246492 () Unit!10265)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5750 array!7237 (_ BitVec 32) (_ BitVec 32)) Unit!10265)

(assert (=> b!157152 (= lt!246492 (readByteArrayLoopArrayPrefixLemma!0 lt!246493 lt!246495 (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun arr!153 () array!7237)

(declare-fun readByteArrayLoopPure!0 (BitStream!5750 array!7237 (_ BitVec 32) (_ BitVec 32)) tuple2!14144)

(declare-fun withMovedByteIndex!0 (BitStream!5750 (_ BitVec 32)) BitStream!5750)

(assert (=> b!157152 (= lt!246498 (readByteArrayLoopPure!0 (withMovedByteIndex!0 lt!246493 #b00000000000000000000000000000001) (array!7238 (store (store (arr!4153 arr!153) from!240 (_2!7518 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7518 lt!246499)) (size!3276 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(declare-fun lt!246489 () (Array (_ BitVec 32) (_ BitVec 8)))

(assert (=> b!157152 (= lt!246489 (store (arr!4153 arr!153) from!240 (_2!7518 (readBytePure!0 bs!65))))))

(declare-fun b!157153 () Bool)

(declare-fun e!106370 () Bool)

(declare-fun array_inv!3035 (array!7237) Bool)

(assert (=> b!157153 (= e!106370 (array_inv!3035 (buf!3749 bs!65)))))

(declare-fun res!131342 () Bool)

(declare-fun e!106368 () Bool)

(assert (=> start!31172 (=> (not res!131342) (not e!106368))))

(assert (=> start!31172 (= res!131342 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3276 arr!153))))))

(assert (=> start!31172 e!106368))

(assert (=> start!31172 true))

(assert (=> start!31172 (array_inv!3035 arr!153)))

(declare-fun inv!12 (BitStream!5750) Bool)

(assert (=> start!31172 (and (inv!12 bs!65) e!106370)))

(declare-fun b!157154 () Bool)

(declare-fun res!131340 () Bool)

(assert (=> b!157154 (=> (not res!131340) (not e!106368))))

(assert (=> b!157154 (= res!131340 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3276 (buf!3749 bs!65))) ((_ sign_extend 32) (currentByte!6885 bs!65)) ((_ sign_extend 32) (currentBit!6880 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!157155 () Bool)

(assert (=> b!157155 (= e!106368 e!106371)))

(declare-fun res!131338 () Bool)

(assert (=> b!157155 (=> (not res!131338) (not e!106371))))

(assert (=> b!157155 (= res!131338 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(assert (=> b!157155 (= lt!246491 (readByteArrayLoopPure!0 lt!246493 lt!246495 (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> b!157155 (= lt!246495 (array!7238 (store (arr!4153 arr!153) from!240 (_2!7518 (readBytePure!0 bs!65))) (size!3276 arr!153)))))

(assert (=> b!157155 (= lt!246493 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(assert (=> b!157155 (= lt!246497 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!157156 () Bool)

(declare-fun res!131339 () Bool)

(assert (=> b!157156 (=> res!131339 e!106372)))

(assert (=> b!157156 (= res!131339 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!3276 (buf!3749 lt!246493))) lt!246496 lt!246494 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))))

(assert (= (and start!31172 res!131342) b!157154))

(assert (= (and b!157154 res!131340) b!157155))

(assert (= (and b!157155 res!131338) b!157151))

(assert (= (and b!157151 (not res!131341)) b!157156))

(assert (= (and b!157156 (not res!131339)) b!157152))

(assert (= start!31172 b!157153))

(declare-fun m!245469 () Bool)

(assert (=> b!157154 m!245469))

(declare-fun m!245471 () Bool)

(assert (=> b!157153 m!245471))

(declare-fun m!245473 () Bool)

(assert (=> b!157156 m!245473))

(declare-fun m!245475 () Bool)

(assert (=> start!31172 m!245475))

(declare-fun m!245477 () Bool)

(assert (=> start!31172 m!245477))

(declare-fun m!245479 () Bool)

(assert (=> b!157155 m!245479))

(declare-fun m!245481 () Bool)

(assert (=> b!157155 m!245481))

(declare-fun m!245483 () Bool)

(assert (=> b!157155 m!245483))

(declare-fun m!245485 () Bool)

(assert (=> b!157155 m!245485))

(declare-fun m!245487 () Bool)

(assert (=> b!157155 m!245487))

(declare-fun m!245489 () Bool)

(assert (=> b!157151 m!245489))

(declare-fun m!245491 () Bool)

(assert (=> b!157151 m!245491))

(declare-fun m!245493 () Bool)

(assert (=> b!157151 m!245493))

(assert (=> b!157152 m!245479))

(assert (=> b!157152 m!245485))

(declare-fun m!245495 () Bool)

(assert (=> b!157152 m!245495))

(declare-fun m!245497 () Bool)

(assert (=> b!157152 m!245497))

(declare-fun m!245499 () Bool)

(assert (=> b!157152 m!245499))

(assert (=> b!157152 m!245497))

(declare-fun m!245501 () Bool)

(assert (=> b!157152 m!245501))

(declare-fun m!245503 () Bool)

(assert (=> b!157152 m!245503))

(push 1)

(assert (not b!157155))

(assert (not b!157154))

(assert (not b!157151))

(assert (not start!31172))

(assert (not b!157156))

(assert (not b!157153))

(assert (not b!157152))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!52340 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!52340 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3276 (buf!3749 lt!246493))) lt!246496 lt!246494 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) (bvsle ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3276 (buf!3749 lt!246493))) lt!246496 lt!246494) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12847 () Bool)

(assert (= bs!12847 d!52340))

(declare-fun m!245507 () Bool)

(assert (=> bs!12847 m!245507))

(assert (=> b!157156 d!52340))

(declare-fun d!52342 () Bool)

(assert (=> d!52342 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3276 (buf!3749 lt!246493))) lt!246496 lt!246494 (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3276 (buf!3749 lt!246493))) lt!246496 lt!246494) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12848 () Bool)

(assert (= bs!12848 d!52342))

(assert (=> bs!12848 m!245507))

(assert (=> b!157151 d!52342))

(declare-fun d!52344 () Bool)

(declare-fun e!106385 () Bool)

(assert (=> d!52344 e!106385))

(declare-fun res!131354 () Bool)

(assert (=> d!52344 (=> (not res!131354) (not e!106385))))

(assert (=> d!52344 (= res!131354 (and (or (let ((rhs!3444 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3444 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3444) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!52345 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!52345 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!52345 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3443 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3443 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3443) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!246519 () Unit!10265)

(declare-fun choose!57 (BitStream!5750 BitStream!5750 (_ BitVec 64) (_ BitVec 32)) Unit!10265)

(assert (=> d!52344 (= lt!246519 (choose!57 bs!65 lt!246493 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)))))

(assert (=> d!52344 (= (validateOffsetBytesFromBitIndexLemma!0 bs!65 lt!246493 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)) lt!246519)))

(declare-fun lt!246520 () (_ BitVec 32))

(declare-fun b!157168 () Bool)

(assert (=> b!157168 (= e!106385 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3276 (buf!3749 lt!246493))) ((_ sign_extend 32) (currentByte!6885 lt!246493)) ((_ sign_extend 32) (currentBit!6880 lt!246493)) (bvsub (bvsub to!236 from!240) lt!246520)))))

(assert (=> b!157168 (or (= (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000) (bvand lt!246520 #b10000000000000000000000000000000)) (= (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!236 from!240) lt!246520) #b10000000000000000000000000000000)))))

(declare-fun lt!246521 () (_ BitVec 64))

(assert (=> b!157168 (= lt!246520 ((_ extract 31 0) lt!246521))))

(assert (=> b!157168 (and (bvslt lt!246521 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!246521 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!157168 (= lt!246521 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!52344 res!131354) b!157168))

(declare-fun m!245525 () Bool)

(assert (=> d!52344 m!245525))

(declare-fun m!245527 () Bool)

(assert (=> b!157168 m!245527))

(assert (=> b!157151 d!52344))

(declare-fun d!52357 () Bool)

(declare-datatypes ((tuple2!14150 0))(
  ( (tuple2!14151 (_1!7523 (_ BitVec 8)) (_2!7523 BitStream!5750)) )
))
(declare-fun lt!246524 () tuple2!14150)

(declare-fun readByte!0 (BitStream!5750) tuple2!14150)

(assert (=> d!52357 (= lt!246524 (readByte!0 lt!246493))))

(assert (=> d!52357 (= (readBytePure!0 lt!246493) (tuple2!14143 (_2!7523 lt!246524) (_1!7523 lt!246524)))))

(declare-fun bs!12852 () Bool)

(assert (= bs!12852 d!52357))

(declare-fun m!245529 () Bool)

(assert (=> bs!12852 m!245529))

(assert (=> b!157151 d!52357))

(declare-datatypes ((tuple3!662 0))(
  ( (tuple3!663 (_1!7524 Unit!10265) (_2!7524 BitStream!5750) (_3!448 array!7237)) )
))
(declare-fun lt!246530 () tuple3!662)

(declare-fun d!52359 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!5750 array!7237 (_ BitVec 32) (_ BitVec 32)) tuple3!662)

(assert (=> d!52359 (= lt!246530 (readByteArrayLoop!0 lt!246493 lt!246495 (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52359 (= (readByteArrayLoopPure!0 lt!246493 lt!246495 (bvadd #b00000000000000000000000000000001 from!240) to!236) (tuple2!14145 (_2!7524 lt!246530) (_3!448 lt!246530)))))

(declare-fun bs!12854 () Bool)

(assert (= bs!12854 d!52359))

(declare-fun m!245533 () Bool)

(assert (=> bs!12854 m!245533))

(assert (=> b!157155 d!52359))

(declare-fun d!52363 () Bool)

(declare-fun lt!246531 () tuple2!14150)

(assert (=> d!52363 (= lt!246531 (readByte!0 bs!65))))

(assert (=> d!52363 (= (readBytePure!0 bs!65) (tuple2!14143 (_2!7523 lt!246531) (_1!7523 lt!246531)))))

(declare-fun bs!12855 () Bool)

(assert (= bs!12855 d!52363))

(declare-fun m!245535 () Bool)

(assert (=> bs!12855 m!245535))

(assert (=> b!157155 d!52363))

(declare-fun d!52365 () Bool)

(declare-datatypes ((tuple2!14152 0))(
  ( (tuple2!14153 (_1!7525 Unit!10265) (_2!7525 BitStream!5750)) )
))
(declare-fun moveByteIndex!0 (BitStream!5750 (_ BitVec 32)) tuple2!14152)

(assert (=> d!52365 (= (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7525 (moveByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun bs!12856 () Bool)

(assert (= bs!12856 d!52365))

(declare-fun m!245537 () Bool)

(assert (=> bs!12856 m!245537))

(assert (=> b!157155 d!52365))

(declare-fun d!52367 () Bool)

(declare-fun lt!246532 () tuple3!662)

(assert (=> d!52367 (= lt!246532 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!52367 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!14145 (_2!7524 lt!246532) (_3!448 lt!246532)))))

(declare-fun bs!12857 () Bool)

(assert (= bs!12857 d!52367))

(declare-fun m!245539 () Bool)

(assert (=> bs!12857 m!245539))

(assert (=> b!157155 d!52367))

(declare-fun d!52369 () Bool)

(assert (=> d!52369 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3276 (buf!3749 bs!65))) ((_ sign_extend 32) (currentByte!6885 bs!65)) ((_ sign_extend 32) (currentBit!6880 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3276 (buf!3749 bs!65))) ((_ sign_extend 32) (currentByte!6885 bs!65)) ((_ sign_extend 32) (currentBit!6880 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12858 () Bool)

(assert (= bs!12858 d!52369))

(declare-fun m!245541 () Bool)

(assert (=> bs!12858 m!245541))

(assert (=> b!157154 d!52369))

(declare-fun d!52371 () Bool)

(assert (=> d!52371 (= (array_inv!3035 arr!153) (bvsge (size!3276 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!31172 d!52371))

(declare-fun d!52373 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!52373 (= (inv!12 bs!65) (invariant!0 (currentBit!6880 bs!65) (currentByte!6885 bs!65) (size!3276 (buf!3749 bs!65))))))

(declare-fun bs!12859 () Bool)

(assert (= bs!12859 d!52373))

(declare-fun m!245543 () Bool)

(assert (=> bs!12859 m!245543))

(assert (=> start!31172 d!52373))

(declare-fun d!52375 () Bool)

(assert (=> d!52375 (= (array_inv!3035 (buf!3749 bs!65)) (bvsge (size!3276 (buf!3749 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!157153 d!52375))

(declare-fun d!52377 () Bool)

(declare-fun res!131359 () Bool)

(declare-fun e!106390 () Bool)

(assert (=> d!52377 (=> res!131359 e!106390)))

(assert (=> d!52377 (= res!131359 (= #b00000000000000000000000000000000 to!236))))

(assert (=> d!52377 (= (arrayRangesEq!436 (_2!7519 lt!246491) (_2!7519 lt!246498) #b00000000000000000000000000000000 to!236) e!106390)))

(declare-fun b!157173 () Bool)

(declare-fun e!106391 () Bool)

(assert (=> b!157173 (= e!106390 e!106391)))

(declare-fun res!131360 () Bool)

(assert (=> b!157173 (=> (not res!131360) (not e!106391))))

(assert (=> b!157173 (= res!131360 (= (select (arr!4153 (_2!7519 lt!246491)) #b00000000000000000000000000000000) (select (arr!4153 (_2!7519 lt!246498)) #b00000000000000000000000000000000)))))

(declare-fun b!157174 () Bool)

(assert (=> b!157174 (= e!106391 (arrayRangesEq!436 (_2!7519 lt!246491) (_2!7519 lt!246498) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236))))

(assert (= (and d!52377 (not res!131359)) b!157173))

(assert (= (and b!157173 res!131360) b!157174))

(declare-fun m!245545 () Bool)

(assert (=> b!157173 m!245545))

(declare-fun m!245547 () Bool)

(assert (=> b!157173 m!245547))

(declare-fun m!245549 () Bool)

(assert (=> b!157174 m!245549))

(assert (=> b!157152 d!52377))

(declare-fun d!52379 () Bool)

(declare-fun lt!246555 () tuple2!14144)

(declare-fun lt!246557 () tuple2!14144)

(assert (=> d!52379 (arrayRangesEq!436 (_2!7519 lt!246555) (_2!7519 lt!246557) #b00000000000000000000000000000000 to!236)))

(declare-fun lt!246558 () Unit!10265)

(declare-fun lt!246556 () BitStream!5750)

(declare-fun choose!35 (BitStream!5750 array!7237 (_ BitVec 32) (_ BitVec 32) tuple2!14144 array!7237 BitStream!5750 tuple2!14144 array!7237) Unit!10265)

(assert (=> d!52379 (= lt!246558 (choose!35 lt!246493 lt!246495 (bvadd #b00000000000000000000000000000001 from!240) to!236 lt!246555 (_2!7519 lt!246555) lt!246556 lt!246557 (_2!7519 lt!246557)))))

(assert (=> d!52379 (= lt!246557 (readByteArrayLoopPure!0 lt!246556 (array!7238 (store (arr!4153 lt!246495) (bvadd #b00000000000000000000000000000001 from!240) (_2!7518 (readBytePure!0 lt!246493))) (size!3276 lt!246495)) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> d!52379 (= lt!246556 (withMovedByteIndex!0 lt!246493 #b00000000000000000000000000000001))))

(assert (=> d!52379 (= lt!246555 (readByteArrayLoopPure!0 lt!246493 lt!246495 (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52379 (= (readByteArrayLoopArrayPrefixLemma!0 lt!246493 lt!246495 (bvadd #b00000000000000000000000000000001 from!240) to!236) lt!246558)))

(declare-fun bs!12869 () Bool)

(assert (= bs!12869 d!52379))

(assert (=> bs!12869 m!245497))

(assert (=> bs!12869 m!245483))

(declare-fun m!245569 () Bool)

(assert (=> bs!12869 m!245569))

(declare-fun m!245571 () Bool)

(assert (=> bs!12869 m!245571))

(declare-fun m!245573 () Bool)

(assert (=> bs!12869 m!245573))

(declare-fun m!245575 () Bool)

(assert (=> bs!12869 m!245575))

(assert (=> bs!12869 m!245493))

(assert (=> b!157152 d!52379))

(assert (=> b!157152 d!52363))

(declare-fun lt!246559 () tuple3!662)

(declare-fun d!52397 () Bool)

(assert (=> d!52397 (= lt!246559 (readByteArrayLoop!0 (withMovedByteIndex!0 lt!246493 #b00000000000000000000000000000001) (array!7238 (store (store (arr!4153 arr!153) from!240 (_2!7518 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7518 lt!246499)) (size!3276 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(assert (=> d!52397 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 lt!246493 #b00000000000000000000000000000001) (array!7238 (store (store (arr!4153 arr!153) from!240 (_2!7518 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7518 lt!246499)) (size!3276 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236) (tuple2!14145 (_2!7524 lt!246559) (_3!448 lt!246559)))))

(declare-fun bs!12870 () Bool)

(assert (= bs!12870 d!52397))

(assert (=> bs!12870 m!245497))

(declare-fun m!245577 () Bool)

(assert (=> bs!12870 m!245577))

(assert (=> b!157152 d!52397))

(declare-fun d!52399 () Bool)

(assert (=> d!52399 (= (withMovedByteIndex!0 lt!246493 #b00000000000000000000000000000001) (_2!7525 (moveByteIndex!0 lt!246493 #b00000000000000000000000000000001)))))

(declare-fun bs!12871 () Bool)

(assert (= bs!12871 d!52399))

(declare-fun m!245579 () Bool)

(assert (=> bs!12871 m!245579))

(assert (=> b!157152 d!52399))

(push 1)

(assert (not d!52342))

(assert (not d!52357))

(assert (not d!52340))

(assert (not d!52379))

(assert (not d!52397))

(assert (not d!52399))

(assert (not d!52344))

(assert (not d!52367))

(assert (not d!52373))

(assert (not d!52365))

(assert (not d!52363))

(assert (not b!157174))

(assert (not d!52369))

(assert (not b!157168))

(assert (not d!52359))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bm!2505 () Bool)

(declare-fun lt!246653 () tuple3!662)

(declare-fun call!2509 () (_ BitVec 64))

(declare-fun c!8358 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> bm!2505 (= call!2509 (bitIndex!0 (ite c!8358 (size!3276 (buf!3749 (_2!7524 lt!246653))) (size!3276 (buf!3749 (withMovedByteIndex!0 lt!246493 #b00000000000000000000000000000001)))) (ite c!8358 (currentByte!6885 (_2!7524 lt!246653)) (currentByte!6885 (withMovedByteIndex!0 lt!246493 #b00000000000000000000000000000001))) (ite c!8358 (currentBit!6880 (_2!7524 lt!246653)) (currentBit!6880 (withMovedByteIndex!0 lt!246493 #b00000000000000000000000000000001)))))))

(declare-fun b!157188 () Bool)

(declare-fun e!106403 () tuple3!662)

(declare-fun lt!246679 () Unit!10265)

(assert (=> b!157188 (= e!106403 (tuple3!663 lt!246679 (_2!7524 lt!246653) (_3!448 lt!246653)))))

(declare-fun lt!246667 () tuple2!14150)

(assert (=> b!157188 (= lt!246667 (readByte!0 (withMovedByteIndex!0 lt!246493 #b00000000000000000000000000000001)))))

(declare-fun lt!246680 () array!7237)

(assert (=> b!157188 (= lt!246680 (array!7238 (store (arr!4153 (array!7238 (store (store (arr!4153 arr!153) from!240 (_2!7518 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7518 lt!246499)) (size!3276 arr!153))) (bvadd #b00000000000000000000000000000010 from!240) (_1!7523 lt!246667)) (size!3276 (array!7238 (store (store (arr!4153 arr!153) from!240 (_2!7518 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7518 lt!246499)) (size!3276 arr!153)))))))

(declare-fun lt!246648 () (_ BitVec 64))

(assert (=> b!157188 (= lt!246648 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!246651 () (_ BitVec 32))

(assert (=> b!157188 (= lt!246651 (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240)))))

(declare-fun lt!246665 () Unit!10265)

(assert (=> b!157188 (= lt!246665 (validateOffsetBytesFromBitIndexLemma!0 (withMovedByteIndex!0 lt!246493 #b00000000000000000000000000000001) (_2!7523 lt!246667) lt!246648 lt!246651))))

(assert (=> b!157188 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3276 (buf!3749 (_2!7523 lt!246667)))) ((_ sign_extend 32) (currentByte!6885 (_2!7523 lt!246667))) ((_ sign_extend 32) (currentBit!6880 (_2!7523 lt!246667))) (bvsub lt!246651 ((_ extract 31 0) (bvsdiv (bvadd lt!246648 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!246660 () Unit!10265)

(assert (=> b!157188 (= lt!246660 lt!246665)))

(assert (=> b!157188 (= lt!246653 (readByteArrayLoop!0 (_2!7523 lt!246667) lt!246680 (bvadd #b00000000000000000000000000000010 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!157188 (= (bitIndex!0 (size!3276 (buf!3749 (_2!7523 lt!246667))) (currentByte!6885 (_2!7523 lt!246667)) (currentBit!6880 (_2!7523 lt!246667))) (bvadd (bitIndex!0 (size!3276 (buf!3749 (withMovedByteIndex!0 lt!246493 #b00000000000000000000000000000001))) (currentByte!6885 (withMovedByteIndex!0 lt!246493 #b00000000000000000000000000000001)) (currentBit!6880 (withMovedByteIndex!0 lt!246493 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!246681 () Unit!10265)

(declare-fun Unit!10267 () Unit!10265)

(assert (=> b!157188 (= lt!246681 Unit!10267)))

(assert (=> b!157188 (= (bvadd (bitIndex!0 (size!3276 (buf!3749 (_2!7523 lt!246667))) (currentByte!6885 (_2!7523 lt!246667)) (currentBit!6880 (_2!7523 lt!246667))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2509)))

(declare-fun lt!246658 () Unit!10265)

(declare-fun Unit!10268 () Unit!10265)

(assert (=> b!157188 (= lt!246658 Unit!10268)))

(assert (=> b!157188 (= (bvadd (bitIndex!0 (size!3276 (buf!3749 (withMovedByteIndex!0 lt!246493 #b00000000000000000000000000000001))) (currentByte!6885 (withMovedByteIndex!0 lt!246493 #b00000000000000000000000000000001)) (currentBit!6880 (withMovedByteIndex!0 lt!246493 #b00000000000000000000000000000001))) (bvmul ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240))) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2509)))

(declare-fun lt!246657 () Unit!10265)

(declare-fun Unit!10269 () Unit!10265)

(assert (=> b!157188 (= lt!246657 Unit!10269)))

(assert (=> b!157188 (and (= (buf!3749 (withMovedByteIndex!0 lt!246493 #b00000000000000000000000000000001)) (buf!3749 (_2!7524 lt!246653))) (= (size!3276 (array!7238 (store (store (arr!4153 arr!153) from!240 (_2!7518 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7518 lt!246499)) (size!3276 arr!153))) (size!3276 (_3!448 lt!246653))))))

(declare-fun lt!246663 () Unit!10265)

(declare-fun Unit!10270 () Unit!10265)

(assert (=> b!157188 (= lt!246663 Unit!10270)))

(declare-fun lt!246659 () Unit!10265)

(declare-fun arrayUpdatedAtPrefixLemma!42 (array!7237 (_ BitVec 32) (_ BitVec 8)) Unit!10265)

(assert (=> b!157188 (= lt!246659 (arrayUpdatedAtPrefixLemma!42 (array!7238 (store (store (arr!4153 arr!153) from!240 (_2!7518 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7518 lt!246499)) (size!3276 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) (_1!7523 lt!246667)))))

(declare-fun call!2510 () Bool)

(assert (=> b!157188 call!2510))

(declare-fun lt!246649 () Unit!10265)

(assert (=> b!157188 (= lt!246649 lt!246659)))

(declare-fun lt!246670 () (_ BitVec 32))

(assert (=> b!157188 (= lt!246670 #b00000000000000000000000000000000)))

(declare-fun lt!246647 () Unit!10265)

(declare-fun arrayRangesEqTransitive!107 (array!7237 array!7237 array!7237 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10265)

(assert (=> b!157188 (= lt!246647 (arrayRangesEqTransitive!107 (array!7238 (store (store (arr!4153 arr!153) from!240 (_2!7518 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7518 lt!246499)) (size!3276 arr!153)) lt!246680 (_3!448 lt!246653) lt!246670 (bvadd #b00000000000000000000000000000010 from!240) (bvadd #b00000000000000000000000000000010 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157188 (arrayRangesEq!436 (array!7238 (store (store (arr!4153 arr!153) from!240 (_2!7518 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7518 lt!246499)) (size!3276 arr!153)) (_3!448 lt!246653) lt!246670 (bvadd #b00000000000000000000000000000010 from!240))))

(declare-fun lt!246668 () Unit!10265)

(assert (=> b!157188 (= lt!246668 lt!246647)))

(declare-fun call!2508 () Bool)

(assert (=> b!157188 call!2508))

(declare-fun lt!246674 () Unit!10265)

(declare-fun Unit!10271 () Unit!10265)

(assert (=> b!157188 (= lt!246674 Unit!10271)))

(declare-fun lt!246656 () Unit!10265)

(declare-fun arrayRangesEqImpliesEq!51 (array!7237 array!7237 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10265)

(assert (=> b!157188 (= lt!246656 (arrayRangesEqImpliesEq!51 lt!246680 (_3!448 lt!246653) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000010 from!240) (bvadd #b00000000000000000000000000000010 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157188 (= (select (store (arr!4153 (array!7238 (store (store (arr!4153 arr!153) from!240 (_2!7518 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7518 lt!246499)) (size!3276 arr!153))) (bvadd #b00000000000000000000000000000010 from!240) (_1!7523 lt!246667)) (bvadd #b00000000000000000000000000000010 from!240)) (select (arr!4153 (_3!448 lt!246653)) (bvadd #b00000000000000000000000000000010 from!240)))))

(declare-fun lt!246673 () Unit!10265)

(assert (=> b!157188 (= lt!246673 lt!246656)))

(declare-fun lt!246676 () Bool)

(assert (=> b!157188 (= lt!246676 (= (select (arr!4153 (_3!448 lt!246653)) (bvadd #b00000000000000000000000000000010 from!240)) (_1!7523 lt!246667)))))

(declare-fun Unit!10272 () Unit!10265)

(assert (=> b!157188 (= lt!246679 Unit!10272)))

(assert (=> b!157188 lt!246676))

(declare-fun e!106401 () Bool)

(declare-fun lt!246671 () tuple3!662)

(declare-fun b!157189 () Bool)

(assert (=> b!157189 (= e!106401 (= (select (arr!4153 (_3!448 lt!246671)) (bvadd #b00000000000000000000000000000010 from!240)) (_2!7518 (readBytePure!0 (withMovedByteIndex!0 lt!246493 #b00000000000000000000000000000001)))))))

(assert (=> b!157189 (and (bvsge (bvadd #b00000000000000000000000000000010 from!240) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000010 from!240) (size!3276 (_3!448 lt!246671))))))

(declare-fun lt!246661 () Unit!10265)

(declare-fun b!157190 () Bool)

(assert (=> b!157190 (= e!106403 (tuple3!663 lt!246661 (withMovedByteIndex!0 lt!246493 #b00000000000000000000000000000001) (array!7238 (store (store (arr!4153 arr!153) from!240 (_2!7518 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7518 lt!246499)) (size!3276 arr!153))))))

(assert (=> b!157190 (= call!2509 call!2509)))

(declare-fun lt!246677 () Unit!10265)

(declare-fun Unit!10273 () Unit!10265)

(assert (=> b!157190 (= lt!246677 Unit!10273)))

(declare-fun lt!246662 () Unit!10265)

(declare-fun arrayRangesEqReflexiveLemma!42 (array!7237) Unit!10265)

(assert (=> b!157190 (= lt!246662 (arrayRangesEqReflexiveLemma!42 (array!7238 (store (store (arr!4153 arr!153) from!240 (_2!7518 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7518 lt!246499)) (size!3276 arr!153))))))

(assert (=> b!157190 call!2510))

(declare-fun lt!246650 () Unit!10265)

(assert (=> b!157190 (= lt!246650 lt!246662)))

(declare-fun lt!246675 () array!7237)

(assert (=> b!157190 (= lt!246675 (array!7238 (store (store (arr!4153 arr!153) from!240 (_2!7518 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7518 lt!246499)) (size!3276 arr!153)))))

(declare-fun lt!246654 () array!7237)

(assert (=> b!157190 (= lt!246654 (array!7238 (store (store (arr!4153 arr!153) from!240 (_2!7518 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7518 lt!246499)) (size!3276 arr!153)))))

(declare-fun lt!246682 () (_ BitVec 32))

(assert (=> b!157190 (= lt!246682 #b00000000000000000000000000000000)))

(declare-fun lt!246666 () (_ BitVec 32))

(assert (=> b!157190 (= lt!246666 (size!3276 (array!7238 (store (store (arr!4153 arr!153) from!240 (_2!7518 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7518 lt!246499)) (size!3276 arr!153))))))

(declare-fun lt!246678 () (_ BitVec 32))

(assert (=> b!157190 (= lt!246678 #b00000000000000000000000000000000)))

(declare-fun lt!246669 () (_ BitVec 32))

(assert (=> b!157190 (= lt!246669 (bvadd #b00000000000000000000000000000010 from!240))))

(declare-fun arrayRangesEqSlicedLemma!42 (array!7237 array!7237 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10265)

(assert (=> b!157190 (= lt!246661 (arrayRangesEqSlicedLemma!42 lt!246675 lt!246654 lt!246682 lt!246666 lt!246678 lt!246669))))

(assert (=> b!157190 call!2508))

(declare-fun d!52401 () Bool)

(assert (=> d!52401 e!106401))

(declare-fun res!131372 () Bool)

(assert (=> d!52401 (=> res!131372 e!106401)))

(assert (=> d!52401 (= res!131372 (bvsge (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(declare-fun lt!246652 () Bool)

(declare-fun e!106402 () Bool)

(assert (=> d!52401 (= lt!246652 e!106402)))

(declare-fun res!131370 () Bool)

(assert (=> d!52401 (=> (not res!131370) (not e!106402))))

(declare-fun lt!246672 () (_ BitVec 64))

(declare-fun lt!246664 () (_ BitVec 64))

(assert (=> d!52401 (= res!131370 (= (bvadd lt!246664 lt!246672) (bitIndex!0 (size!3276 (buf!3749 (_2!7524 lt!246671))) (currentByte!6885 (_2!7524 lt!246671)) (currentBit!6880 (_2!7524 lt!246671)))))))

(assert (=> d!52401 (or (not (= (bvand lt!246664 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!246672 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!246664 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!246664 lt!246672) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!246655 () (_ BitVec 64))

(assert (=> d!52401 (= lt!246672 (bvmul lt!246655 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!52401 (or (= lt!246655 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!246655 #b0000000000000000000000000000000000000000000000000000000000001000) lt!246655)))))

(assert (=> d!52401 (= lt!246655 ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240))))))

(assert (=> d!52401 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000010 from!240) #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240)) #b10000000000000000000000000000000)))))

(assert (=> d!52401 (= lt!246664 (bitIndex!0 (size!3276 (buf!3749 (withMovedByteIndex!0 lt!246493 #b00000000000000000000000000000001))) (currentByte!6885 (withMovedByteIndex!0 lt!246493 #b00000000000000000000000000000001)) (currentBit!6880 (withMovedByteIndex!0 lt!246493 #b00000000000000000000000000000001))))))

(assert (=> d!52401 (= lt!246671 e!106403)))

(assert (=> d!52401 (= c!8358 (bvslt (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(assert (=> d!52401 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000010 from!240)) (bvsle (bvadd #b00000000000000000000000000000010 from!240) to!236) (bvsle to!236 (size!3276 (array!7238 (store (store (arr!4153 arr!153) from!240 (_2!7518 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7518 lt!246499)) (size!3276 arr!153)))))))

(assert (=> d!52401 (= (readByteArrayLoop!0 (withMovedByteIndex!0 lt!246493 #b00000000000000000000000000000001) (array!7238 (store (store (arr!4153 arr!153) from!240 (_2!7518 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7518 lt!246499)) (size!3276 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236) lt!246671)))

(declare-fun bm!2506 () Bool)

(assert (=> bm!2506 (= call!2510 (arrayRangesEq!436 (array!7238 (store (store (arr!4153 arr!153) from!240 (_2!7518 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7518 lt!246499)) (size!3276 arr!153)) (ite c!8358 (array!7238 (store (arr!4153 (array!7238 (store (store (arr!4153 arr!153) from!240 (_2!7518 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7518 lt!246499)) (size!3276 arr!153))) (bvadd #b00000000000000000000000000000010 from!240) (_1!7523 lt!246667)) (size!3276 (array!7238 (store (store (arr!4153 arr!153) from!240 (_2!7518 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7518 lt!246499)) (size!3276 arr!153)))) (array!7238 (store (store (arr!4153 arr!153) from!240 (_2!7518 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7518 lt!246499)) (size!3276 arr!153))) #b00000000000000000000000000000000 (ite c!8358 (bvadd #b00000000000000000000000000000010 from!240) (size!3276 (array!7238 (store (store (arr!4153 arr!153) from!240 (_2!7518 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7518 lt!246499)) (size!3276 arr!153))))))))

(declare-fun bm!2507 () Bool)

(assert (=> bm!2507 (= call!2508 (arrayRangesEq!436 (ite c!8358 (array!7238 (store (store (arr!4153 arr!153) from!240 (_2!7518 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7518 lt!246499)) (size!3276 arr!153)) lt!246675) (ite c!8358 (_3!448 lt!246653) lt!246654) (ite c!8358 #b00000000000000000000000000000000 lt!246678) (ite c!8358 (bvadd #b00000000000000000000000000000010 from!240) lt!246669)))))

(declare-fun b!157191 () Bool)

(declare-fun res!131371 () Bool)

(assert (=> b!157191 (=> (not res!131371) (not e!106402))))

(assert (=> b!157191 (= res!131371 (and (= (buf!3749 (withMovedByteIndex!0 lt!246493 #b00000000000000000000000000000001)) (buf!3749 (_2!7524 lt!246671))) (= (size!3276 (array!7238 (store (store (arr!4153 arr!153) from!240 (_2!7518 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7518 lt!246499)) (size!3276 arr!153))) (size!3276 (_3!448 lt!246671)))))))

(declare-fun b!157192 () Bool)

(assert (=> b!157192 (= e!106402 (arrayRangesEq!436 (array!7238 (store (store (arr!4153 arr!153) from!240 (_2!7518 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7518 lt!246499)) (size!3276 arr!153)) (_3!448 lt!246671) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000010 from!240)))))

(assert (= (and d!52401 c!8358) b!157188))

(assert (= (and d!52401 (not c!8358)) b!157190))

(assert (= (or b!157188 b!157190) bm!2507))

(assert (= (or b!157188 b!157190) bm!2506))

(assert (= (or b!157188 b!157190) bm!2505))

(assert (= (and d!52401 res!131370) b!157191))

(assert (= (and b!157191 res!131371) b!157192))

(assert (= (and d!52401 (not res!131372)) b!157189))

(declare-fun m!245595 () Bool)

(assert (=> bm!2507 m!245595))

(declare-fun m!245597 () Bool)

(assert (=> b!157189 m!245597))

(assert (=> b!157189 m!245497))

(declare-fun m!245599 () Bool)

(assert (=> b!157189 m!245599))

(declare-fun m!245601 () Bool)

(assert (=> b!157190 m!245601))

(declare-fun m!245603 () Bool)

(assert (=> b!157190 m!245603))

(declare-fun m!245605 () Bool)

(assert (=> bm!2506 m!245605))

(declare-fun m!245607 () Bool)

(assert (=> bm!2506 m!245607))

(declare-fun m!245609 () Bool)

(assert (=> d!52401 m!245609))

(declare-fun m!245611 () Bool)

(assert (=> d!52401 m!245611))

(declare-fun m!245613 () Bool)

(assert (=> bm!2505 m!245613))

(assert (=> b!157188 m!245497))

(declare-fun m!245615 () Bool)

(assert (=> b!157188 m!245615))

(declare-fun m!245617 () Bool)

(assert (=> b!157188 m!245617))

(assert (=> b!157188 m!245611))

(assert (=> b!157188 m!245605))

(declare-fun m!245619 () Bool)

(assert (=> b!157188 m!245619))

(declare-fun m!245621 () Bool)

(assert (=> b!157188 m!245621))

(declare-fun m!245623 () Bool)

(assert (=> b!157188 m!245623))

(declare-fun m!245625 () Bool)

(assert (=> b!157188 m!245625))

(declare-fun m!245627 () Bool)

(assert (=> b!157188 m!245627))

(declare-fun m!245629 () Bool)

(assert (=> b!157188 m!245629))

(declare-fun m!245631 () Bool)

(assert (=> b!157188 m!245631))

(assert (=> b!157188 m!245497))

(declare-fun m!245633 () Bool)

(assert (=> b!157188 m!245633))

(declare-fun m!245635 () Bool)

(assert (=> b!157188 m!245635))

(declare-fun m!245637 () Bool)

(assert (=> b!157192 m!245637))

(assert (=> d!52397 d!52401))

(declare-fun d!52420 () Bool)

(assert (=> d!52420 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3276 (buf!3749 lt!246493))) ((_ sign_extend 32) (currentByte!6885 lt!246493)) ((_ sign_extend 32) (currentBit!6880 lt!246493)) (bvsub (bvsub to!236 from!240) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!52420 true))

(declare-fun _$7!106 () Unit!10265)

(assert (=> d!52420 (= (choose!57 bs!65 lt!246493 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)) _$7!106)))

(declare-fun bs!12878 () Bool)

(assert (= bs!12878 d!52420))

(declare-fun m!245639 () Bool)

(assert (=> bs!12878 m!245639))

(assert (=> d!52344 d!52420))

(declare-fun d!52422 () Bool)

(assert (=> d!52422 (= (remainingBits!0 ((_ sign_extend 32) (size!3276 (buf!3749 bs!65))) ((_ sign_extend 32) (currentByte!6885 bs!65)) ((_ sign_extend 32) (currentBit!6880 bs!65))) (bvsub (bvmul ((_ sign_extend 32) (size!3276 (buf!3749 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6885 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6880 bs!65)))))))

(assert (=> d!52369 d!52422))

(declare-fun d!52424 () Bool)

(declare-fun lt!246714 () (_ BitVec 8))

(declare-fun lt!246717 () (_ BitVec 8))

(assert (=> d!52424 (= lt!246714 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4153 (buf!3749 bs!65)) (currentByte!6885 bs!65))) ((_ sign_extend 24) lt!246717))))))

(assert (=> d!52424 (= lt!246717 ((_ extract 7 0) (currentBit!6880 bs!65)))))

(declare-fun e!106414 () Bool)

(assert (=> d!52424 e!106414))

(declare-fun res!131384 () Bool)

(assert (=> d!52424 (=> (not res!131384) (not e!106414))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!52424 (= res!131384 (validate_offset_bits!1 ((_ sign_extend 32) (size!3276 (buf!3749 bs!65))) ((_ sign_extend 32) (currentByte!6885 bs!65)) ((_ sign_extend 32) (currentBit!6880 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!14158 0))(
  ( (tuple2!14159 (_1!7529 Unit!10265) (_2!7529 (_ BitVec 8))) )
))
(declare-fun Unit!10274 () Unit!10265)

(declare-fun Unit!10275 () Unit!10265)

(assert (=> d!52424 (= (readByte!0 bs!65) (tuple2!14151 (_2!7529 (ite (bvsgt ((_ sign_extend 24) lt!246717) #b00000000000000000000000000000000) (tuple2!14159 Unit!10274 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!246714) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4153 (buf!3749 bs!65)) (bvadd (currentByte!6885 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!246717)))))))) (tuple2!14159 Unit!10275 lt!246714))) (BitStream!5751 (buf!3749 bs!65) (bvadd (currentByte!6885 bs!65) #b00000000000000000000000000000001) (currentBit!6880 bs!65))))))

(declare-fun b!157203 () Bool)

(declare-fun e!106415 () Bool)

(assert (=> b!157203 (= e!106414 e!106415)))

(declare-fun res!131385 () Bool)

(assert (=> b!157203 (=> (not res!131385) (not e!106415))))

(declare-fun lt!246713 () tuple2!14150)

(assert (=> b!157203 (= res!131385 (= (buf!3749 (_2!7523 lt!246713)) (buf!3749 bs!65)))))

(declare-fun lt!246718 () (_ BitVec 8))

(declare-fun lt!246716 () (_ BitVec 8))

(declare-fun Unit!10276 () Unit!10265)

(declare-fun Unit!10277 () Unit!10265)

(assert (=> b!157203 (= lt!246713 (tuple2!14151 (_2!7529 (ite (bvsgt ((_ sign_extend 24) lt!246716) #b00000000000000000000000000000000) (tuple2!14159 Unit!10276 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!246718) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4153 (buf!3749 bs!65)) (bvadd (currentByte!6885 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!246716)))))))) (tuple2!14159 Unit!10277 lt!246718))) (BitStream!5751 (buf!3749 bs!65) (bvadd (currentByte!6885 bs!65) #b00000000000000000000000000000001) (currentBit!6880 bs!65))))))

(assert (=> b!157203 (= lt!246718 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4153 (buf!3749 bs!65)) (currentByte!6885 bs!65))) ((_ sign_extend 24) lt!246716))))))

(assert (=> b!157203 (= lt!246716 ((_ extract 7 0) (currentBit!6880 bs!65)))))

(declare-fun lt!246715 () (_ BitVec 64))

(declare-fun lt!246712 () (_ BitVec 64))

(declare-fun b!157204 () Bool)

(assert (=> b!157204 (= e!106415 (= (bitIndex!0 (size!3276 (buf!3749 (_2!7523 lt!246713))) (currentByte!6885 (_2!7523 lt!246713)) (currentBit!6880 (_2!7523 lt!246713))) (bvadd lt!246715 lt!246712)))))

(assert (=> b!157204 (or (not (= (bvand lt!246715 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!246712 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!246715 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!246715 lt!246712) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!157204 (= lt!246712 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!157204 (= lt!246715 (bitIndex!0 (size!3276 (buf!3749 bs!65)) (currentByte!6885 bs!65) (currentBit!6880 bs!65)))))

(assert (= (and d!52424 res!131384) b!157203))

(assert (= (and b!157203 res!131385) b!157204))

(declare-fun m!245665 () Bool)

(assert (=> d!52424 m!245665))

(declare-fun m!245667 () Bool)

(assert (=> d!52424 m!245667))

(declare-fun m!245669 () Bool)

(assert (=> d!52424 m!245669))

(assert (=> b!157203 m!245669))

(assert (=> b!157203 m!245665))

(declare-fun m!245671 () Bool)

(assert (=> b!157204 m!245671))

(declare-fun m!245673 () Bool)

(assert (=> b!157204 m!245673))

(assert (=> d!52363 d!52424))

(declare-fun d!52442 () Bool)

(assert (=> d!52442 (= (invariant!0 (currentBit!6880 bs!65) (currentByte!6885 bs!65) (size!3276 (buf!3749 bs!65))) (and (bvsge (currentBit!6880 bs!65) #b00000000000000000000000000000000) (bvslt (currentBit!6880 bs!65) #b00000000000000000000000000001000) (bvsge (currentByte!6885 bs!65) #b00000000000000000000000000000000) (or (bvslt (currentByte!6885 bs!65) (size!3276 (buf!3749 bs!65))) (and (= (currentBit!6880 bs!65) #b00000000000000000000000000000000) (= (currentByte!6885 bs!65) (size!3276 (buf!3749 bs!65)))))))))

(assert (=> d!52373 d!52442))

(declare-fun d!52444 () Bool)

(declare-fun lt!246721 () (_ BitVec 8))

(declare-fun lt!246724 () (_ BitVec 8))

(assert (=> d!52444 (= lt!246721 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4153 (buf!3749 lt!246493)) (currentByte!6885 lt!246493))) ((_ sign_extend 24) lt!246724))))))

(assert (=> d!52444 (= lt!246724 ((_ extract 7 0) (currentBit!6880 lt!246493)))))

(declare-fun e!106416 () Bool)

(assert (=> d!52444 e!106416))

(declare-fun res!131386 () Bool)

(assert (=> d!52444 (=> (not res!131386) (not e!106416))))

(assert (=> d!52444 (= res!131386 (validate_offset_bits!1 ((_ sign_extend 32) (size!3276 (buf!3749 lt!246493))) ((_ sign_extend 32) (currentByte!6885 lt!246493)) ((_ sign_extend 32) (currentBit!6880 lt!246493)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!10278 () Unit!10265)

(declare-fun Unit!10279 () Unit!10265)

(assert (=> d!52444 (= (readByte!0 lt!246493) (tuple2!14151 (_2!7529 (ite (bvsgt ((_ sign_extend 24) lt!246724) #b00000000000000000000000000000000) (tuple2!14159 Unit!10278 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!246721) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4153 (buf!3749 lt!246493)) (bvadd (currentByte!6885 lt!246493) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!246724)))))))) (tuple2!14159 Unit!10279 lt!246721))) (BitStream!5751 (buf!3749 lt!246493) (bvadd (currentByte!6885 lt!246493) #b00000000000000000000000000000001) (currentBit!6880 lt!246493))))))

(declare-fun b!157205 () Bool)

(declare-fun e!106417 () Bool)

(assert (=> b!157205 (= e!106416 e!106417)))

(declare-fun res!131387 () Bool)

(assert (=> b!157205 (=> (not res!131387) (not e!106417))))

(declare-fun lt!246720 () tuple2!14150)

(assert (=> b!157205 (= res!131387 (= (buf!3749 (_2!7523 lt!246720)) (buf!3749 lt!246493)))))

(declare-fun lt!246723 () (_ BitVec 8))

(declare-fun lt!246725 () (_ BitVec 8))

(declare-fun Unit!10280 () Unit!10265)

(declare-fun Unit!10281 () Unit!10265)

(assert (=> b!157205 (= lt!246720 (tuple2!14151 (_2!7529 (ite (bvsgt ((_ sign_extend 24) lt!246723) #b00000000000000000000000000000000) (tuple2!14159 Unit!10280 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!246725) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4153 (buf!3749 lt!246493)) (bvadd (currentByte!6885 lt!246493) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!246723)))))))) (tuple2!14159 Unit!10281 lt!246725))) (BitStream!5751 (buf!3749 lt!246493) (bvadd (currentByte!6885 lt!246493) #b00000000000000000000000000000001) (currentBit!6880 lt!246493))))))

(assert (=> b!157205 (= lt!246725 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4153 (buf!3749 lt!246493)) (currentByte!6885 lt!246493))) ((_ sign_extend 24) lt!246723))))))

(assert (=> b!157205 (= lt!246723 ((_ extract 7 0) (currentBit!6880 lt!246493)))))

(declare-fun b!157206 () Bool)

(declare-fun lt!246719 () (_ BitVec 64))

(declare-fun lt!246722 () (_ BitVec 64))

(assert (=> b!157206 (= e!106417 (= (bitIndex!0 (size!3276 (buf!3749 (_2!7523 lt!246720))) (currentByte!6885 (_2!7523 lt!246720)) (currentBit!6880 (_2!7523 lt!246720))) (bvadd lt!246722 lt!246719)))))

(assert (=> b!157206 (or (not (= (bvand lt!246722 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!246719 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!246722 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!246722 lt!246719) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!157206 (= lt!246719 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!157206 (= lt!246722 (bitIndex!0 (size!3276 (buf!3749 lt!246493)) (currentByte!6885 lt!246493) (currentBit!6880 lt!246493)))))

(assert (= (and d!52444 res!131386) b!157205))

(assert (= (and b!157205 res!131387) b!157206))

(declare-fun m!245675 () Bool)

(assert (=> d!52444 m!245675))

(declare-fun m!245677 () Bool)

(assert (=> d!52444 m!245677))

(declare-fun m!245679 () Bool)

(assert (=> d!52444 m!245679))

(assert (=> b!157205 m!245679))

(assert (=> b!157205 m!245675))

(declare-fun m!245681 () Bool)

(assert (=> b!157206 m!245681))

(declare-fun m!245683 () Bool)

(assert (=> b!157206 m!245683))

(assert (=> d!52357 d!52444))

(declare-fun c!8359 () Bool)

(declare-fun lt!246732 () tuple3!662)

(declare-fun call!2512 () (_ BitVec 64))

(declare-fun bm!2508 () Bool)

(assert (=> bm!2508 (= call!2512 (bitIndex!0 (ite c!8359 (size!3276 (buf!3749 (_2!7524 lt!246732))) (size!3276 (buf!3749 lt!246493))) (ite c!8359 (currentByte!6885 (_2!7524 lt!246732)) (currentByte!6885 lt!246493)) (ite c!8359 (currentBit!6880 (_2!7524 lt!246732)) (currentBit!6880 lt!246493))))))

(declare-fun b!157207 () Bool)

(declare-fun e!106420 () tuple3!662)

(declare-fun lt!246758 () Unit!10265)

(assert (=> b!157207 (= e!106420 (tuple3!663 lt!246758 (_2!7524 lt!246732) (_3!448 lt!246732)))))

(declare-fun lt!246746 () tuple2!14150)

(assert (=> b!157207 (= lt!246746 (readByte!0 lt!246493))))

(declare-fun lt!246759 () array!7237)

(assert (=> b!157207 (= lt!246759 (array!7238 (store (arr!4153 lt!246495) (bvadd #b00000000000000000000000000000001 from!240) (_1!7523 lt!246746)) (size!3276 lt!246495)))))

(declare-fun lt!246727 () (_ BitVec 64))

(assert (=> b!157207 (= lt!246727 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!246730 () (_ BitVec 32))

(assert (=> b!157207 (= lt!246730 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!246744 () Unit!10265)

(assert (=> b!157207 (= lt!246744 (validateOffsetBytesFromBitIndexLemma!0 lt!246493 (_2!7523 lt!246746) lt!246727 lt!246730))))

(assert (=> b!157207 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3276 (buf!3749 (_2!7523 lt!246746)))) ((_ sign_extend 32) (currentByte!6885 (_2!7523 lt!246746))) ((_ sign_extend 32) (currentBit!6880 (_2!7523 lt!246746))) (bvsub lt!246730 ((_ extract 31 0) (bvsdiv (bvadd lt!246727 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!246739 () Unit!10265)

(assert (=> b!157207 (= lt!246739 lt!246744)))

(assert (=> b!157207 (= lt!246732 (readByteArrayLoop!0 (_2!7523 lt!246746) lt!246759 (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!157207 (= (bitIndex!0 (size!3276 (buf!3749 (_2!7523 lt!246746))) (currentByte!6885 (_2!7523 lt!246746)) (currentBit!6880 (_2!7523 lt!246746))) (bvadd (bitIndex!0 (size!3276 (buf!3749 lt!246493)) (currentByte!6885 lt!246493) (currentBit!6880 lt!246493)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!246760 () Unit!10265)

(declare-fun Unit!10282 () Unit!10265)

(assert (=> b!157207 (= lt!246760 Unit!10282)))

(assert (=> b!157207 (= (bvadd (bitIndex!0 (size!3276 (buf!3749 (_2!7523 lt!246746))) (currentByte!6885 (_2!7523 lt!246746)) (currentBit!6880 (_2!7523 lt!246746))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2512)))

(declare-fun lt!246737 () Unit!10265)

(declare-fun Unit!10283 () Unit!10265)

(assert (=> b!157207 (= lt!246737 Unit!10283)))

(assert (=> b!157207 (= (bvadd (bitIndex!0 (size!3276 (buf!3749 lt!246493)) (currentByte!6885 lt!246493) (currentBit!6880 lt!246493)) (bvmul ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2512)))

(declare-fun lt!246736 () Unit!10265)

(declare-fun Unit!10284 () Unit!10265)

(assert (=> b!157207 (= lt!246736 Unit!10284)))

(assert (=> b!157207 (and (= (buf!3749 lt!246493) (buf!3749 (_2!7524 lt!246732))) (= (size!3276 lt!246495) (size!3276 (_3!448 lt!246732))))))

(declare-fun lt!246742 () Unit!10265)

(declare-fun Unit!10285 () Unit!10265)

(assert (=> b!157207 (= lt!246742 Unit!10285)))

(declare-fun lt!246738 () Unit!10265)

(assert (=> b!157207 (= lt!246738 (arrayUpdatedAtPrefixLemma!42 lt!246495 (bvadd #b00000000000000000000000000000001 from!240) (_1!7523 lt!246746)))))

(declare-fun call!2513 () Bool)

(assert (=> b!157207 call!2513))

(declare-fun lt!246728 () Unit!10265)

(assert (=> b!157207 (= lt!246728 lt!246738)))

(declare-fun lt!246749 () (_ BitVec 32))

(assert (=> b!157207 (= lt!246749 #b00000000000000000000000000000000)))

(declare-fun lt!246726 () Unit!10265)

(assert (=> b!157207 (= lt!246726 (arrayRangesEqTransitive!107 lt!246495 lt!246759 (_3!448 lt!246732) lt!246749 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157207 (arrayRangesEq!436 lt!246495 (_3!448 lt!246732) lt!246749 (bvadd #b00000000000000000000000000000001 from!240))))

(declare-fun lt!246747 () Unit!10265)

(assert (=> b!157207 (= lt!246747 lt!246726)))

(declare-fun call!2511 () Bool)

(assert (=> b!157207 call!2511))

(declare-fun lt!246753 () Unit!10265)

(declare-fun Unit!10286 () Unit!10265)

(assert (=> b!157207 (= lt!246753 Unit!10286)))

(declare-fun lt!246735 () Unit!10265)

(assert (=> b!157207 (= lt!246735 (arrayRangesEqImpliesEq!51 lt!246759 (_3!448 lt!246732) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157207 (= (select (store (arr!4153 lt!246495) (bvadd #b00000000000000000000000000000001 from!240) (_1!7523 lt!246746)) (bvadd #b00000000000000000000000000000001 from!240)) (select (arr!4153 (_3!448 lt!246732)) (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!246752 () Unit!10265)

(assert (=> b!157207 (= lt!246752 lt!246735)))

(declare-fun lt!246755 () Bool)

(assert (=> b!157207 (= lt!246755 (= (select (arr!4153 (_3!448 lt!246732)) (bvadd #b00000000000000000000000000000001 from!240)) (_1!7523 lt!246746)))))

(declare-fun Unit!10287 () Unit!10265)

(assert (=> b!157207 (= lt!246758 Unit!10287)))

(assert (=> b!157207 lt!246755))

(declare-fun b!157208 () Bool)

(declare-fun lt!246750 () tuple3!662)

(declare-fun e!106418 () Bool)

(assert (=> b!157208 (= e!106418 (= (select (arr!4153 (_3!448 lt!246750)) (bvadd #b00000000000000000000000000000001 from!240)) (_2!7518 (readBytePure!0 lt!246493))))))

(assert (=> b!157208 (and (bvsge (bvadd #b00000000000000000000000000000001 from!240) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!240) (size!3276 (_3!448 lt!246750))))))

(declare-fun b!157209 () Bool)

(declare-fun lt!246740 () Unit!10265)

(assert (=> b!157209 (= e!106420 (tuple3!663 lt!246740 lt!246493 lt!246495))))

(assert (=> b!157209 (= call!2512 call!2512)))

(declare-fun lt!246756 () Unit!10265)

(declare-fun Unit!10288 () Unit!10265)

(assert (=> b!157209 (= lt!246756 Unit!10288)))

(declare-fun lt!246741 () Unit!10265)

(assert (=> b!157209 (= lt!246741 (arrayRangesEqReflexiveLemma!42 lt!246495))))

(assert (=> b!157209 call!2513))

(declare-fun lt!246729 () Unit!10265)

(assert (=> b!157209 (= lt!246729 lt!246741)))

(declare-fun lt!246754 () array!7237)

(assert (=> b!157209 (= lt!246754 lt!246495)))

(declare-fun lt!246733 () array!7237)

(assert (=> b!157209 (= lt!246733 lt!246495)))

(declare-fun lt!246761 () (_ BitVec 32))

(assert (=> b!157209 (= lt!246761 #b00000000000000000000000000000000)))

(declare-fun lt!246745 () (_ BitVec 32))

(assert (=> b!157209 (= lt!246745 (size!3276 lt!246495))))

(declare-fun lt!246757 () (_ BitVec 32))

(assert (=> b!157209 (= lt!246757 #b00000000000000000000000000000000)))

(declare-fun lt!246748 () (_ BitVec 32))

(assert (=> b!157209 (= lt!246748 (bvadd #b00000000000000000000000000000001 from!240))))

(assert (=> b!157209 (= lt!246740 (arrayRangesEqSlicedLemma!42 lt!246754 lt!246733 lt!246761 lt!246745 lt!246757 lt!246748))))

(assert (=> b!157209 call!2511))

(declare-fun d!52446 () Bool)

(assert (=> d!52446 e!106418))

(declare-fun res!131390 () Bool)

(assert (=> d!52446 (=> res!131390 e!106418)))

(assert (=> d!52446 (= res!131390 (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!246731 () Bool)

(declare-fun e!106419 () Bool)

(assert (=> d!52446 (= lt!246731 e!106419)))

(declare-fun res!131388 () Bool)

(assert (=> d!52446 (=> (not res!131388) (not e!106419))))

(declare-fun lt!246751 () (_ BitVec 64))

(declare-fun lt!246743 () (_ BitVec 64))

(assert (=> d!52446 (= res!131388 (= (bvadd lt!246743 lt!246751) (bitIndex!0 (size!3276 (buf!3749 (_2!7524 lt!246750))) (currentByte!6885 (_2!7524 lt!246750)) (currentBit!6880 (_2!7524 lt!246750)))))))

(assert (=> d!52446 (or (not (= (bvand lt!246743 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!246751 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!246743 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!246743 lt!246751) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!246734 () (_ BitVec 64))

(assert (=> d!52446 (= lt!246751 (bvmul lt!246734 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!52446 (or (= lt!246734 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!246734 #b0000000000000000000000000000000000000000000000000000000000001000) lt!246734)))))

(assert (=> d!52446 (= lt!246734 ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))))))

(assert (=> d!52446 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!240) #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b10000000000000000000000000000000)))))

(assert (=> d!52446 (= lt!246743 (bitIndex!0 (size!3276 (buf!3749 lt!246493)) (currentByte!6885 lt!246493) (currentBit!6880 lt!246493)))))

(assert (=> d!52446 (= lt!246750 e!106420)))

(assert (=> d!52446 (= c!8359 (bvslt (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52446 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsle (bvadd #b00000000000000000000000000000001 from!240) to!236) (bvsle to!236 (size!3276 lt!246495)))))

(assert (=> d!52446 (= (readByteArrayLoop!0 lt!246493 lt!246495 (bvadd #b00000000000000000000000000000001 from!240) to!236) lt!246750)))

(declare-fun bm!2509 () Bool)

(assert (=> bm!2509 (= call!2513 (arrayRangesEq!436 lt!246495 (ite c!8359 (array!7238 (store (arr!4153 lt!246495) (bvadd #b00000000000000000000000000000001 from!240) (_1!7523 lt!246746)) (size!3276 lt!246495)) lt!246495) #b00000000000000000000000000000000 (ite c!8359 (bvadd #b00000000000000000000000000000001 from!240) (size!3276 lt!246495))))))

(declare-fun bm!2510 () Bool)

(assert (=> bm!2510 (= call!2511 (arrayRangesEq!436 (ite c!8359 lt!246495 lt!246754) (ite c!8359 (_3!448 lt!246732) lt!246733) (ite c!8359 #b00000000000000000000000000000000 lt!246757) (ite c!8359 (bvadd #b00000000000000000000000000000001 from!240) lt!246748)))))

(declare-fun b!157210 () Bool)

(declare-fun res!131389 () Bool)

(assert (=> b!157210 (=> (not res!131389) (not e!106419))))

(assert (=> b!157210 (= res!131389 (and (= (buf!3749 lt!246493) (buf!3749 (_2!7524 lt!246750))) (= (size!3276 lt!246495) (size!3276 (_3!448 lt!246750)))))))

(declare-fun b!157211 () Bool)

(assert (=> b!157211 (= e!106419 (arrayRangesEq!436 lt!246495 (_3!448 lt!246750) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)))))

(assert (= (and d!52446 c!8359) b!157207))

(assert (= (and d!52446 (not c!8359)) b!157209))

(assert (= (or b!157207 b!157209) bm!2510))

(assert (= (or b!157207 b!157209) bm!2509))

(assert (= (or b!157207 b!157209) bm!2508))

(assert (= (and d!52446 res!131388) b!157210))

(assert (= (and b!157210 res!131389) b!157211))

(assert (= (and d!52446 (not res!131390)) b!157208))

(declare-fun m!245685 () Bool)

(assert (=> bm!2510 m!245685))

(declare-fun m!245687 () Bool)

(assert (=> b!157208 m!245687))

(assert (=> b!157208 m!245493))

(declare-fun m!245689 () Bool)

(assert (=> b!157209 m!245689))

(declare-fun m!245691 () Bool)

(assert (=> b!157209 m!245691))

(declare-fun m!245693 () Bool)

(assert (=> bm!2509 m!245693))

(declare-fun m!245695 () Bool)

(assert (=> bm!2509 m!245695))

(declare-fun m!245697 () Bool)

(assert (=> d!52446 m!245697))

(assert (=> d!52446 m!245683))

(declare-fun m!245699 () Bool)

(assert (=> bm!2508 m!245699))

(assert (=> b!157207 m!245529))

(declare-fun m!245701 () Bool)

(assert (=> b!157207 m!245701))

(assert (=> b!157207 m!245683))

(assert (=> b!157207 m!245693))

(declare-fun m!245703 () Bool)

(assert (=> b!157207 m!245703))

(declare-fun m!245705 () Bool)

(assert (=> b!157207 m!245705))

(declare-fun m!245707 () Bool)

(assert (=> b!157207 m!245707))

(declare-fun m!245709 () Bool)

(assert (=> b!157207 m!245709))

(declare-fun m!245711 () Bool)

(assert (=> b!157207 m!245711))

(declare-fun m!245713 () Bool)

(assert (=> b!157207 m!245713))

(declare-fun m!245715 () Bool)

(assert (=> b!157207 m!245715))

(declare-fun m!245717 () Bool)

(assert (=> b!157207 m!245717))

(declare-fun m!245719 () Bool)

(assert (=> b!157207 m!245719))

(declare-fun m!245721 () Bool)

(assert (=> b!157211 m!245721))

(assert (=> d!52359 d!52446))

(declare-fun d!52448 () Bool)

(assert (=> d!52448 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3276 (buf!3749 lt!246493))) ((_ sign_extend 32) (currentByte!6885 lt!246493)) ((_ sign_extend 32) (currentBit!6880 lt!246493)) (bvsub (bvsub to!236 from!240) lt!246520)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) lt!246520)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3276 (buf!3749 lt!246493))) ((_ sign_extend 32) (currentByte!6885 lt!246493)) ((_ sign_extend 32) (currentBit!6880 lt!246493))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12886 () Bool)

(assert (= bs!12886 d!52448))

(declare-fun m!245723 () Bool)

(assert (=> bs!12886 m!245723))

(assert (=> b!157168 d!52448))

(assert (=> d!52379 d!52359))

(declare-fun d!52450 () Bool)

(assert (=> d!52450 (arrayRangesEq!436 (_2!7519 (readByteArrayLoopPure!0 lt!246493 lt!246495 (bvadd #b00000000000000000000000000000001 from!240) to!236)) (_2!7519 (readByteArrayLoopPure!0 (withMovedByteIndex!0 lt!246493 #b00000000000000000000000000000001) (array!7238 (store (arr!4153 lt!246495) (bvadd #b00000000000000000000000000000001 from!240) (_2!7518 (readBytePure!0 lt!246493))) (size!3276 lt!246495)) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236)) #b00000000000000000000000000000000 to!236)))

(assert (=> d!52450 true))

(declare-fun _$13!88 () Unit!10265)

(assert (=> d!52450 (= (choose!35 lt!246493 lt!246495 (bvadd #b00000000000000000000000000000001 from!240) to!236 lt!246555 (_2!7519 lt!246555) lt!246556 lt!246557 (_2!7519 lt!246557)) _$13!88)))

(declare-fun bs!12888 () Bool)

(assert (= bs!12888 d!52450))

(assert (=> bs!12888 m!245483))

(assert (=> bs!12888 m!245497))

(assert (=> bs!12888 m!245497))

(declare-fun m!245725 () Bool)

(assert (=> bs!12888 m!245725))

(assert (=> bs!12888 m!245493))

(assert (=> bs!12888 m!245573))

(declare-fun m!245727 () Bool)

(assert (=> bs!12888 m!245727))

(assert (=> d!52379 d!52450))

(assert (=> d!52379 d!52357))

(declare-fun d!52452 () Bool)

(declare-fun res!131391 () Bool)

(declare-fun e!106421 () Bool)

(assert (=> d!52452 (=> res!131391 e!106421)))

(assert (=> d!52452 (= res!131391 (= #b00000000000000000000000000000000 to!236))))

(assert (=> d!52452 (= (arrayRangesEq!436 (_2!7519 lt!246555) (_2!7519 lt!246557) #b00000000000000000000000000000000 to!236) e!106421)))

(declare-fun b!157212 () Bool)

(declare-fun e!106422 () Bool)

(assert (=> b!157212 (= e!106421 e!106422)))

(declare-fun res!131392 () Bool)

(assert (=> b!157212 (=> (not res!131392) (not e!106422))))

(assert (=> b!157212 (= res!131392 (= (select (arr!4153 (_2!7519 lt!246555)) #b00000000000000000000000000000000) (select (arr!4153 (_2!7519 lt!246557)) #b00000000000000000000000000000000)))))

(declare-fun b!157213 () Bool)

(assert (=> b!157213 (= e!106422 (arrayRangesEq!436 (_2!7519 lt!246555) (_2!7519 lt!246557) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236))))

(assert (= (and d!52452 (not res!131391)) b!157212))

(assert (= (and b!157212 res!131392) b!157213))

(declare-fun m!245729 () Bool)

(assert (=> b!157212 m!245729))

(declare-fun m!245731 () Bool)

(assert (=> b!157212 m!245731))

(declare-fun m!245733 () Bool)

(assert (=> b!157213 m!245733))

(assert (=> d!52379 d!52452))

(declare-fun d!52454 () Bool)

(declare-fun lt!246762 () tuple3!662)

(assert (=> d!52454 (= lt!246762 (readByteArrayLoop!0 lt!246556 (array!7238 (store (arr!4153 lt!246495) (bvadd #b00000000000000000000000000000001 from!240) (_2!7518 (readBytePure!0 lt!246493))) (size!3276 lt!246495)) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> d!52454 (= (readByteArrayLoopPure!0 lt!246556 (array!7238 (store (arr!4153 lt!246495) (bvadd #b00000000000000000000000000000001 from!240) (_2!7518 (readBytePure!0 lt!246493))) (size!3276 lt!246495)) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236) (tuple2!14145 (_2!7524 lt!246762) (_3!448 lt!246762)))))

(declare-fun bs!12889 () Bool)

(assert (= bs!12889 d!52454))

(declare-fun m!245735 () Bool)

(assert (=> bs!12889 m!245735))

(assert (=> d!52379 d!52454))

(assert (=> d!52379 d!52399))

(declare-fun d!52456 () Bool)

(assert (=> d!52456 (= (remainingBits!0 ((_ sign_extend 32) (size!3276 (buf!3749 lt!246493))) lt!246496 lt!246494) (bvsub (bvmul ((_ sign_extend 32) (size!3276 (buf!3749 lt!246493))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul lt!246496 #b0000000000000000000000000000000000000000000000000000000000001000) lt!246494)))))

(assert (=> d!52342 d!52456))

(declare-fun d!52458 () Bool)

(declare-fun e!106425 () Bool)

(assert (=> d!52458 e!106425))

(declare-fun res!131395 () Bool)

(assert (=> d!52458 (=> (not res!131395) (not e!106425))))

(declare-fun moveByteIndexPrecond!0 (BitStream!5750 (_ BitVec 32)) Bool)

(assert (=> d!52458 (= res!131395 (moveByteIndexPrecond!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun Unit!10289 () Unit!10265)

(assert (=> d!52458 (= (moveByteIndex!0 bs!65 #b00000000000000000000000000000001) (tuple2!14153 Unit!10289 (BitStream!5751 (buf!3749 bs!65) (bvadd (currentByte!6885 bs!65) #b00000000000000000000000000000001) (currentBit!6880 bs!65))))))

(declare-fun b!157216 () Bool)

(assert (=> b!157216 (= e!106425 (and (or (not (= (bvand (currentByte!6885 bs!65) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6885 bs!65) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6885 bs!65) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6885 bs!65) #b00000000000000000000000000000001) (bvadd (currentByte!6885 bs!65) #b00000000000000000000000000000001))))))

(assert (= (and d!52458 res!131395) b!157216))

(declare-fun m!245737 () Bool)

(assert (=> d!52458 m!245737))

(assert (=> d!52365 d!52458))

(assert (=> d!52340 d!52456))

(declare-fun d!52460 () Bool)

(declare-fun e!106426 () Bool)

(assert (=> d!52460 e!106426))

(declare-fun res!131396 () Bool)

(assert (=> d!52460 (=> (not res!131396) (not e!106426))))

(assert (=> d!52460 (= res!131396 (moveByteIndexPrecond!0 lt!246493 #b00000000000000000000000000000001))))

(declare-fun Unit!10290 () Unit!10265)

(assert (=> d!52460 (= (moveByteIndex!0 lt!246493 #b00000000000000000000000000000001) (tuple2!14153 Unit!10290 (BitStream!5751 (buf!3749 lt!246493) (bvadd (currentByte!6885 lt!246493) #b00000000000000000000000000000001) (currentBit!6880 lt!246493))))))

(declare-fun b!157217 () Bool)

(assert (=> b!157217 (= e!106426 (and (or (not (= (bvand (currentByte!6885 lt!246493) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6885 lt!246493) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6885 lt!246493) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6885 lt!246493) #b00000000000000000000000000000001) (bvadd (currentByte!6885 lt!246493) #b00000000000000000000000000000001))))))

(assert (= (and d!52460 res!131396) b!157217))

(declare-fun m!245739 () Bool)

(assert (=> d!52460 m!245739))

(assert (=> d!52399 d!52460))

(declare-fun lt!246769 () tuple3!662)

(declare-fun bm!2511 () Bool)

(declare-fun call!2515 () (_ BitVec 64))

(declare-fun c!8360 () Bool)

(assert (=> bm!2511 (= call!2515 (bitIndex!0 (ite c!8360 (size!3276 (buf!3749 (_2!7524 lt!246769))) (size!3276 (buf!3749 bs!65))) (ite c!8360 (currentByte!6885 (_2!7524 lt!246769)) (currentByte!6885 bs!65)) (ite c!8360 (currentBit!6880 (_2!7524 lt!246769)) (currentBit!6880 bs!65))))))

(declare-fun b!157218 () Bool)

(declare-fun e!106429 () tuple3!662)

(declare-fun lt!246795 () Unit!10265)

(assert (=> b!157218 (= e!106429 (tuple3!663 lt!246795 (_2!7524 lt!246769) (_3!448 lt!246769)))))

(declare-fun lt!246783 () tuple2!14150)

(assert (=> b!157218 (= lt!246783 (readByte!0 bs!65))))

(declare-fun lt!246796 () array!7237)

(assert (=> b!157218 (= lt!246796 (array!7238 (store (arr!4153 arr!153) from!240 (_1!7523 lt!246783)) (size!3276 arr!153)))))

(declare-fun lt!246764 () (_ BitVec 64))

(assert (=> b!157218 (= lt!246764 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!246767 () (_ BitVec 32))

(assert (=> b!157218 (= lt!246767 (bvsub to!236 from!240))))

(declare-fun lt!246781 () Unit!10265)

(assert (=> b!157218 (= lt!246781 (validateOffsetBytesFromBitIndexLemma!0 bs!65 (_2!7523 lt!246783) lt!246764 lt!246767))))

(assert (=> b!157218 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3276 (buf!3749 (_2!7523 lt!246783)))) ((_ sign_extend 32) (currentByte!6885 (_2!7523 lt!246783))) ((_ sign_extend 32) (currentBit!6880 (_2!7523 lt!246783))) (bvsub lt!246767 ((_ extract 31 0) (bvsdiv (bvadd lt!246764 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!246776 () Unit!10265)

(assert (=> b!157218 (= lt!246776 lt!246781)))

(assert (=> b!157218 (= lt!246769 (readByteArrayLoop!0 (_2!7523 lt!246783) lt!246796 (bvadd from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!157218 (= (bitIndex!0 (size!3276 (buf!3749 (_2!7523 lt!246783))) (currentByte!6885 (_2!7523 lt!246783)) (currentBit!6880 (_2!7523 lt!246783))) (bvadd (bitIndex!0 (size!3276 (buf!3749 bs!65)) (currentByte!6885 bs!65) (currentBit!6880 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!246797 () Unit!10265)

(declare-fun Unit!10291 () Unit!10265)

(assert (=> b!157218 (= lt!246797 Unit!10291)))

(assert (=> b!157218 (= (bvadd (bitIndex!0 (size!3276 (buf!3749 (_2!7523 lt!246783))) (currentByte!6885 (_2!7523 lt!246783)) (currentBit!6880 (_2!7523 lt!246783))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2515)))

(declare-fun lt!246774 () Unit!10265)

(declare-fun Unit!10292 () Unit!10265)

(assert (=> b!157218 (= lt!246774 Unit!10292)))

(assert (=> b!157218 (= (bvadd (bitIndex!0 (size!3276 (buf!3749 bs!65)) (currentByte!6885 bs!65) (currentBit!6880 bs!65)) (bvmul ((_ sign_extend 32) (bvsub to!236 from!240)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2515)))

(declare-fun lt!246773 () Unit!10265)

(declare-fun Unit!10293 () Unit!10265)

(assert (=> b!157218 (= lt!246773 Unit!10293)))

(assert (=> b!157218 (and (= (buf!3749 bs!65) (buf!3749 (_2!7524 lt!246769))) (= (size!3276 arr!153) (size!3276 (_3!448 lt!246769))))))

(declare-fun lt!246779 () Unit!10265)

(declare-fun Unit!10294 () Unit!10265)

(assert (=> b!157218 (= lt!246779 Unit!10294)))

(declare-fun lt!246775 () Unit!10265)

(assert (=> b!157218 (= lt!246775 (arrayUpdatedAtPrefixLemma!42 arr!153 from!240 (_1!7523 lt!246783)))))

(declare-fun call!2516 () Bool)

(assert (=> b!157218 call!2516))

(declare-fun lt!246765 () Unit!10265)

(assert (=> b!157218 (= lt!246765 lt!246775)))

(declare-fun lt!246786 () (_ BitVec 32))

(assert (=> b!157218 (= lt!246786 #b00000000000000000000000000000000)))

(declare-fun lt!246763 () Unit!10265)

(assert (=> b!157218 (= lt!246763 (arrayRangesEqTransitive!107 arr!153 lt!246796 (_3!448 lt!246769) lt!246786 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157218 (arrayRangesEq!436 arr!153 (_3!448 lt!246769) lt!246786 from!240)))

(declare-fun lt!246784 () Unit!10265)

(assert (=> b!157218 (= lt!246784 lt!246763)))

(declare-fun call!2514 () Bool)

(assert (=> b!157218 call!2514))

(declare-fun lt!246790 () Unit!10265)

(declare-fun Unit!10295 () Unit!10265)

(assert (=> b!157218 (= lt!246790 Unit!10295)))

(declare-fun lt!246772 () Unit!10265)

(assert (=> b!157218 (= lt!246772 (arrayRangesEqImpliesEq!51 lt!246796 (_3!448 lt!246769) #b00000000000000000000000000000000 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157218 (= (select (store (arr!4153 arr!153) from!240 (_1!7523 lt!246783)) from!240) (select (arr!4153 (_3!448 lt!246769)) from!240))))

(declare-fun lt!246789 () Unit!10265)

(assert (=> b!157218 (= lt!246789 lt!246772)))

(declare-fun lt!246792 () Bool)

(assert (=> b!157218 (= lt!246792 (= (select (arr!4153 (_3!448 lt!246769)) from!240) (_1!7523 lt!246783)))))

(declare-fun Unit!10296 () Unit!10265)

(assert (=> b!157218 (= lt!246795 Unit!10296)))

(assert (=> b!157218 lt!246792))

(declare-fun b!157219 () Bool)

(declare-fun e!106427 () Bool)

(declare-fun lt!246787 () tuple3!662)

(assert (=> b!157219 (= e!106427 (= (select (arr!4153 (_3!448 lt!246787)) from!240) (_2!7518 (readBytePure!0 bs!65))))))

(assert (=> b!157219 (and (bvsge from!240 #b00000000000000000000000000000000) (bvslt from!240 (size!3276 (_3!448 lt!246787))))))

(declare-fun lt!246777 () Unit!10265)

(declare-fun b!157220 () Bool)

(assert (=> b!157220 (= e!106429 (tuple3!663 lt!246777 bs!65 arr!153))))

(assert (=> b!157220 (= call!2515 call!2515)))

(declare-fun lt!246793 () Unit!10265)

(declare-fun Unit!10297 () Unit!10265)

(assert (=> b!157220 (= lt!246793 Unit!10297)))

(declare-fun lt!246778 () Unit!10265)

(assert (=> b!157220 (= lt!246778 (arrayRangesEqReflexiveLemma!42 arr!153))))

(assert (=> b!157220 call!2516))

(declare-fun lt!246766 () Unit!10265)

(assert (=> b!157220 (= lt!246766 lt!246778)))

(declare-fun lt!246791 () array!7237)

(assert (=> b!157220 (= lt!246791 arr!153)))

(declare-fun lt!246770 () array!7237)

(assert (=> b!157220 (= lt!246770 arr!153)))

(declare-fun lt!246798 () (_ BitVec 32))

(assert (=> b!157220 (= lt!246798 #b00000000000000000000000000000000)))

(declare-fun lt!246782 () (_ BitVec 32))

(assert (=> b!157220 (= lt!246782 (size!3276 arr!153))))

(declare-fun lt!246794 () (_ BitVec 32))

(assert (=> b!157220 (= lt!246794 #b00000000000000000000000000000000)))

(declare-fun lt!246785 () (_ BitVec 32))

(assert (=> b!157220 (= lt!246785 from!240)))

(assert (=> b!157220 (= lt!246777 (arrayRangesEqSlicedLemma!42 lt!246791 lt!246770 lt!246798 lt!246782 lt!246794 lt!246785))))

(assert (=> b!157220 call!2514))

(declare-fun d!52462 () Bool)

(assert (=> d!52462 e!106427))

(declare-fun res!131399 () Bool)

(assert (=> d!52462 (=> res!131399 e!106427)))

(assert (=> d!52462 (= res!131399 (bvsge from!240 to!236))))

(declare-fun lt!246768 () Bool)

(declare-fun e!106428 () Bool)

(assert (=> d!52462 (= lt!246768 e!106428)))

(declare-fun res!131397 () Bool)

(assert (=> d!52462 (=> (not res!131397) (not e!106428))))

(declare-fun lt!246780 () (_ BitVec 64))

(declare-fun lt!246788 () (_ BitVec 64))

(assert (=> d!52462 (= res!131397 (= (bvadd lt!246780 lt!246788) (bitIndex!0 (size!3276 (buf!3749 (_2!7524 lt!246787))) (currentByte!6885 (_2!7524 lt!246787)) (currentBit!6880 (_2!7524 lt!246787)))))))

(assert (=> d!52462 (or (not (= (bvand lt!246780 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!246788 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!246780 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!246780 lt!246788) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!246771 () (_ BitVec 64))

(assert (=> d!52462 (= lt!246788 (bvmul lt!246771 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!52462 (or (= lt!246771 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!246771 #b0000000000000000000000000000000000000000000000000000000000001000) lt!246771)))))

(assert (=> d!52462 (= lt!246771 ((_ sign_extend 32) (bvsub to!236 from!240)))))

(assert (=> d!52462 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand from!240 #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000)))))

(assert (=> d!52462 (= lt!246780 (bitIndex!0 (size!3276 (buf!3749 bs!65)) (currentByte!6885 bs!65) (currentBit!6880 bs!65)))))

(assert (=> d!52462 (= lt!246787 e!106429)))

(assert (=> d!52462 (= c!8360 (bvslt from!240 to!236))))

(assert (=> d!52462 (and (bvsle #b00000000000000000000000000000000 from!240) (bvsle from!240 to!236) (bvsle to!236 (size!3276 arr!153)))))

(assert (=> d!52462 (= (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236) lt!246787)))

(declare-fun bm!2512 () Bool)

(assert (=> bm!2512 (= call!2516 (arrayRangesEq!436 arr!153 (ite c!8360 (array!7238 (store (arr!4153 arr!153) from!240 (_1!7523 lt!246783)) (size!3276 arr!153)) arr!153) #b00000000000000000000000000000000 (ite c!8360 from!240 (size!3276 arr!153))))))

(declare-fun bm!2513 () Bool)

(assert (=> bm!2513 (= call!2514 (arrayRangesEq!436 (ite c!8360 arr!153 lt!246791) (ite c!8360 (_3!448 lt!246769) lt!246770) (ite c!8360 #b00000000000000000000000000000000 lt!246794) (ite c!8360 from!240 lt!246785)))))

(declare-fun b!157221 () Bool)

(declare-fun res!131398 () Bool)

(assert (=> b!157221 (=> (not res!131398) (not e!106428))))

(assert (=> b!157221 (= res!131398 (and (= (buf!3749 bs!65) (buf!3749 (_2!7524 lt!246787))) (= (size!3276 arr!153) (size!3276 (_3!448 lt!246787)))))))

(declare-fun b!157222 () Bool)

(assert (=> b!157222 (= e!106428 (arrayRangesEq!436 arr!153 (_3!448 lt!246787) #b00000000000000000000000000000000 from!240))))

(assert (= (and d!52462 c!8360) b!157218))

(assert (= (and d!52462 (not c!8360)) b!157220))

(assert (= (or b!157218 b!157220) bm!2513))

(assert (= (or b!157218 b!157220) bm!2512))

(assert (= (or b!157218 b!157220) bm!2511))

(assert (= (and d!52462 res!131397) b!157221))

(assert (= (and b!157221 res!131398) b!157222))

(assert (= (and d!52462 (not res!131399)) b!157219))

(declare-fun m!245741 () Bool)

(assert (=> bm!2513 m!245741))

(declare-fun m!245743 () Bool)

(assert (=> b!157219 m!245743))

(assert (=> b!157219 m!245479))

(declare-fun m!245745 () Bool)

(assert (=> b!157220 m!245745))

(declare-fun m!245747 () Bool)

(assert (=> b!157220 m!245747))

(declare-fun m!245749 () Bool)

(assert (=> bm!2512 m!245749))

(declare-fun m!245751 () Bool)

(assert (=> bm!2512 m!245751))

(declare-fun m!245753 () Bool)

(assert (=> d!52462 m!245753))

(assert (=> d!52462 m!245673))

(declare-fun m!245755 () Bool)

(assert (=> bm!2511 m!245755))

(assert (=> b!157218 m!245535))

(declare-fun m!245757 () Bool)

(assert (=> b!157218 m!245757))

(assert (=> b!157218 m!245673))

(assert (=> b!157218 m!245749))

(declare-fun m!245759 () Bool)

(assert (=> b!157218 m!245759))

(declare-fun m!245761 () Bool)

(assert (=> b!157218 m!245761))

(declare-fun m!245763 () Bool)

(assert (=> b!157218 m!245763))

(declare-fun m!245765 () Bool)

(assert (=> b!157218 m!245765))

(declare-fun m!245767 () Bool)

(assert (=> b!157218 m!245767))

(declare-fun m!245769 () Bool)

(assert (=> b!157218 m!245769))

(declare-fun m!245771 () Bool)

(assert (=> b!157218 m!245771))

(declare-fun m!245773 () Bool)

(assert (=> b!157218 m!245773))

(declare-fun m!245775 () Bool)

(assert (=> b!157218 m!245775))

(declare-fun m!245777 () Bool)

(assert (=> b!157222 m!245777))

(assert (=> d!52367 d!52462))

(declare-fun d!52464 () Bool)

(declare-fun res!131400 () Bool)

(declare-fun e!106430 () Bool)

(assert (=> d!52464 (=> res!131400 e!106430)))

(assert (=> d!52464 (= res!131400 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236))))

(assert (=> d!52464 (= (arrayRangesEq!436 (_2!7519 lt!246491) (_2!7519 lt!246498) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236) e!106430)))

(declare-fun b!157223 () Bool)

(declare-fun e!106431 () Bool)

(assert (=> b!157223 (= e!106430 e!106431)))

(declare-fun res!131401 () Bool)

(assert (=> b!157223 (=> (not res!131401) (not e!106431))))

(assert (=> b!157223 (= res!131401 (= (select (arr!4153 (_2!7519 lt!246491)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4153 (_2!7519 lt!246498)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!157224 () Bool)

(assert (=> b!157224 (= e!106431 (arrayRangesEq!436 (_2!7519 lt!246491) (_2!7519 lt!246498) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!236))))

(assert (= (and d!52464 (not res!131400)) b!157223))

(assert (= (and b!157223 res!131401) b!157224))

(declare-fun m!245779 () Bool)

(assert (=> b!157223 m!245779))

(declare-fun m!245781 () Bool)

(assert (=> b!157223 m!245781))

(declare-fun m!245783 () Bool)

(assert (=> b!157224 m!245783))

(assert (=> b!157174 d!52464))

(push 1)

(assert (not b!157211))

(assert (not d!52401))

(assert (not bm!2509))

(assert (not bm!2507))

(assert (not bm!2512))

(assert (not bm!2506))

(assert (not bm!2505))

(assert (not b!157204))

(assert (not d!52446))

(assert (not b!157189))

(assert (not d!52462))

(assert (not b!157209))

(assert (not b!157190))

(assert (not d!52454))

(assert (not d!52424))

(assert (not d!52420))

(assert (not b!157206))

(assert (not bm!2510))

(assert (not b!157213))

(assert (not b!157218))

(assert (not b!157192))

(assert (not b!157222))

(assert (not bm!2511))

(assert (not d!52448))

(assert (not d!52450))

(assert (not bm!2513))

(assert (not b!157220))

(assert (not d!52444))

(assert (not bm!2508))

(assert (not b!157224))

(assert (not b!157208))

(assert (not b!157207))

(assert (not b!157219))

(assert (not b!157188))

(assert (not d!52460))

(assert (not d!52458))

(check-sat)

(pop 1)

(push 1)

(check-sat)

