; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19022 () Bool)

(assert start!19022)

(declare-fun b!95045 () Bool)

(declare-fun res!78265 () Bool)

(declare-fun e!62301 () Bool)

(assert (=> b!95045 (=> (not res!78265) (not e!62301))))

(declare-datatypes ((array!4440 0))(
  ( (array!4441 (arr!2628 (Array (_ BitVec 32) (_ BitVec 8))) (size!2023 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3544 0))(
  ( (BitStream!3545 (buf!2381 array!4440) (currentByte!4750 (_ BitVec 32)) (currentBit!4745 (_ BitVec 32))) )
))
(declare-fun bitStream2!8 () BitStream!3544)

(declare-fun base!8 () BitStream!3544)

(declare-fun isPrefixOf!0 (BitStream!3544 BitStream!3544) Bool)

(assert (=> b!95045 (= res!78265 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun res!78270 () Bool)

(assert (=> start!19022 (=> (not res!78270) (not e!62301))))

(declare-fun nBits!484 () (_ BitVec 64))

(assert (=> start!19022 (= res!78270 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!19022 e!62301))

(assert (=> start!19022 true))

(declare-fun bitStream1!8 () BitStream!3544)

(declare-fun e!62303 () Bool)

(declare-fun inv!12 (BitStream!3544) Bool)

(assert (=> start!19022 (and (inv!12 bitStream1!8) e!62303)))

(declare-fun e!62296 () Bool)

(assert (=> start!19022 (and (inv!12 bitStream2!8) e!62296)))

(declare-fun e!62300 () Bool)

(assert (=> start!19022 (and (inv!12 base!8) e!62300)))

(declare-fun thiss!1534 () BitStream!3544)

(declare-fun e!62299 () Bool)

(assert (=> start!19022 (and (inv!12 thiss!1534) e!62299)))

(declare-fun b!95046 () Bool)

(declare-fun res!78268 () Bool)

(assert (=> b!95046 (=> (not res!78268) (not e!62301))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!95046 (= res!78268 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2023 (buf!2381 bitStream1!8)) (currentByte!4750 bitStream1!8) (currentBit!4745 bitStream1!8))) (bitIndex!0 (size!2023 (buf!2381 bitStream2!8)) (currentByte!4750 bitStream2!8) (currentBit!4745 bitStream2!8))))))

(declare-fun b!95047 () Bool)

(declare-fun res!78260 () Bool)

(assert (=> b!95047 (=> (not res!78260) (not e!62301))))

(assert (=> b!95047 (= res!78260 (bvslt (bitIndex!0 (size!2023 (buf!2381 base!8)) (currentByte!4750 base!8) (currentBit!4745 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!95048 () Bool)

(declare-fun array_inv!1837 (array!4440) Bool)

(assert (=> b!95048 (= e!62299 (array_inv!1837 (buf!2381 thiss!1534)))))

(declare-fun b!95049 () Bool)

(declare-fun res!78267 () Bool)

(assert (=> b!95049 (=> (not res!78267) (not e!62301))))

(declare-datatypes ((List!878 0))(
  ( (Nil!875) (Cons!874 (h!993 Bool) (t!1628 List!878)) )
))
(declare-fun listBits!13 () List!878)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!3544 BitStream!3544 (_ BitVec 64)) List!878)

(assert (=> b!95049 (= res!78267 (= listBits!13 (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484)))))

(declare-fun b!95050 () Bool)

(assert (=> b!95050 (= e!62303 (array_inv!1837 (buf!2381 bitStream1!8)))))

(declare-fun b!95051 () Bool)

(declare-datatypes ((tuple2!7684 0))(
  ( (tuple2!7685 (_1!4089 BitStream!3544) (_2!4089 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!3544) tuple2!7684)

(declare-fun head!590 (List!878) Bool)

(assert (=> b!95051 (= e!62301 (not (= (_2!4089 (readBitPure!0 bitStream1!8)) (head!590 listBits!13))))))

(declare-fun b!95052 () Bool)

(declare-fun res!78266 () Bool)

(assert (=> b!95052 (=> (not res!78266) (not e!62301))))

(assert (=> b!95052 (= res!78266 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!95053 () Bool)

(assert (=> b!95053 (= e!62296 (array_inv!1837 (buf!2381 bitStream2!8)))))

(declare-fun b!95054 () Bool)

(declare-fun res!78269 () Bool)

(assert (=> b!95054 (=> (not res!78269) (not e!62301))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!95054 (= res!78269 (validate_offset_bits!1 ((_ sign_extend 32) (size!2023 (buf!2381 bitStream2!8))) ((_ sign_extend 32) (currentByte!4750 bitStream2!8)) ((_ sign_extend 32) (currentBit!4745 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!95055 () Bool)

(declare-fun res!78262 () Bool)

(assert (=> b!95055 (=> (not res!78262) (not e!62301))))

(assert (=> b!95055 (= res!78262 (validate_offset_bits!1 ((_ sign_extend 32) (size!2023 (buf!2381 bitStream1!8))) ((_ sign_extend 32) (currentByte!4750 bitStream1!8)) ((_ sign_extend 32) (currentBit!4745 bitStream1!8)) nBits!484))))

(declare-fun b!95056 () Bool)

(assert (=> b!95056 (= e!62300 (array_inv!1837 (buf!2381 base!8)))))

(declare-fun b!95057 () Bool)

(declare-fun res!78259 () Bool)

(assert (=> b!95057 (=> (not res!78259) (not e!62301))))

(assert (=> b!95057 (= res!78259 (and (= (buf!2381 bitStream1!8) (buf!2381 bitStream2!8)) (= (buf!2381 bitStream1!8) (buf!2381 base!8))))))

(declare-fun b!95058 () Bool)

(declare-fun res!78264 () Bool)

(assert (=> b!95058 (=> (not res!78264) (not e!62301))))

(assert (=> b!95058 (= res!78264 (not (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!95059 () Bool)

(declare-fun res!78261 () Bool)

(assert (=> b!95059 (=> (not res!78261) (not e!62301))))

(declare-fun length!469 (List!878) Int)

(assert (=> b!95059 (= res!78261 (> (length!469 listBits!13) 0))))

(declare-fun b!95060 () Bool)

(declare-fun res!78263 () Bool)

(assert (=> b!95060 (=> (not res!78263) (not e!62301))))

(assert (=> b!95060 (= res!78263 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(assert (= (and start!19022 res!78270) b!95059))

(assert (= (and b!95059 res!78261) b!95052))

(assert (= (and b!95052 res!78266) b!95045))

(assert (= (and b!95045 res!78265) b!95060))

(assert (= (and b!95060 res!78263) b!95057))

(assert (= (and b!95057 res!78259) b!95047))

(assert (= (and b!95047 res!78260) b!95046))

(assert (= (and b!95046 res!78268) b!95055))

(assert (= (and b!95055 res!78262) b!95054))

(assert (= (and b!95054 res!78269) b!95049))

(assert (= (and b!95049 res!78267) b!95058))

(assert (= (and b!95058 res!78264) b!95051))

(assert (= start!19022 b!95050))

(assert (= start!19022 b!95053))

(assert (= start!19022 b!95056))

(assert (= start!19022 b!95048))

(declare-fun m!138515 () Bool)

(assert (=> b!95052 m!138515))

(declare-fun m!138517 () Bool)

(assert (=> b!95059 m!138517))

(declare-fun m!138519 () Bool)

(assert (=> b!95055 m!138519))

(declare-fun m!138521 () Bool)

(assert (=> b!95051 m!138521))

(declare-fun m!138523 () Bool)

(assert (=> b!95051 m!138523))

(declare-fun m!138525 () Bool)

(assert (=> b!95048 m!138525))

(declare-fun m!138527 () Bool)

(assert (=> b!95049 m!138527))

(declare-fun m!138529 () Bool)

(assert (=> b!95046 m!138529))

(declare-fun m!138531 () Bool)

(assert (=> b!95046 m!138531))

(declare-fun m!138533 () Bool)

(assert (=> b!95054 m!138533))

(declare-fun m!138535 () Bool)

(assert (=> b!95047 m!138535))

(declare-fun m!138537 () Bool)

(assert (=> b!95045 m!138537))

(declare-fun m!138539 () Bool)

(assert (=> start!19022 m!138539))

(declare-fun m!138541 () Bool)

(assert (=> start!19022 m!138541))

(declare-fun m!138543 () Bool)

(assert (=> start!19022 m!138543))

(declare-fun m!138545 () Bool)

(assert (=> start!19022 m!138545))

(declare-fun m!138547 () Bool)

(assert (=> b!95053 m!138547))

(declare-fun m!138549 () Bool)

(assert (=> b!95050 m!138549))

(declare-fun m!138551 () Bool)

(assert (=> b!95060 m!138551))

(declare-fun m!138553 () Bool)

(assert (=> b!95056 m!138553))

(push 1)

(assert (not b!95045))

(assert (not b!95055))

(assert (not b!95051))

(assert (not b!95056))

(assert (not b!95060))

(assert (not b!95048))

(assert (not start!19022))

(assert (not b!95047))

(assert (not b!95054))

(assert (not b!95052))

(assert (not b!95049))

(assert (not b!95053))

(assert (not b!95050))

(assert (not b!95046))

(assert (not b!95059))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!29600 () Bool)

(declare-fun res!78374 () Bool)

(declare-fun e!62384 () Bool)

(assert (=> d!29600 (=> (not res!78374) (not e!62384))))

(assert (=> d!29600 (= res!78374 (= (size!2023 (buf!2381 bitStream1!8)) (size!2023 (buf!2381 bitStream2!8))))))

(assert (=> d!29600 (= (isPrefixOf!0 bitStream1!8 bitStream2!8) e!62384)))

(declare-fun b!95200 () Bool)

(declare-fun res!78376 () Bool)

(assert (=> b!95200 (=> (not res!78376) (not e!62384))))

(assert (=> b!95200 (= res!78376 (bvsle (bitIndex!0 (size!2023 (buf!2381 bitStream1!8)) (currentByte!4750 bitStream1!8) (currentBit!4745 bitStream1!8)) (bitIndex!0 (size!2023 (buf!2381 bitStream2!8)) (currentByte!4750 bitStream2!8) (currentBit!4745 bitStream2!8))))))

(declare-fun b!95201 () Bool)

(declare-fun e!62385 () Bool)

(assert (=> b!95201 (= e!62384 e!62385)))

(declare-fun res!78375 () Bool)

(assert (=> b!95201 (=> res!78375 e!62385)))

(assert (=> b!95201 (= res!78375 (= (size!2023 (buf!2381 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!95202 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4440 array!4440 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!95202 (= e!62385 (arrayBitRangesEq!0 (buf!2381 bitStream1!8) (buf!2381 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2023 (buf!2381 bitStream1!8)) (currentByte!4750 bitStream1!8) (currentBit!4745 bitStream1!8))))))

(assert (= (and d!29600 res!78374) b!95200))

(assert (= (and b!95200 res!78376) b!95201))

(assert (= (and b!95201 (not res!78375)) b!95202))

(assert (=> b!95200 m!138529))

(assert (=> b!95200 m!138531))

(assert (=> b!95202 m!138529))

(assert (=> b!95202 m!138529))

(declare-fun m!138665 () Bool)

(assert (=> b!95202 m!138665))

(assert (=> b!95060 d!29600))

(declare-fun b!95212 () Bool)

(declare-datatypes ((tuple2!7694 0))(
  ( (tuple2!7695 (_1!4094 List!878) (_2!4094 BitStream!3544)) )
))
(declare-fun e!62393 () tuple2!7694)

(declare-fun lt!139032 () (_ BitVec 64))

(declare-datatypes ((tuple2!7696 0))(
  ( (tuple2!7697 (_1!4095 Bool) (_2!4095 BitStream!3544)) )
))
(declare-fun lt!139033 () tuple2!7696)

(assert (=> b!95212 (= e!62393 (tuple2!7695 (Cons!874 (_1!4095 lt!139033) (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4095 lt!139033) (bvsub nBits!484 lt!139032))) (_2!4095 lt!139033)))))

(declare-fun readBit!0 (BitStream!3544) tuple2!7696)

(assert (=> b!95212 (= lt!139033 (readBit!0 bitStream1!8))))

(assert (=> b!95212 (= lt!139032 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!95214 () Bool)

(declare-fun e!62392 () Bool)

(declare-fun lt!139034 () List!878)

(assert (=> b!95214 (= e!62392 (> (length!469 lt!139034) 0))))

(declare-fun d!29602 () Bool)

(assert (=> d!29602 e!62392))

(declare-fun c!5985 () Bool)

(assert (=> d!29602 (= c!5985 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!29602 (= lt!139034 (_1!4094 e!62393))))

(declare-fun c!5984 () Bool)

(assert (=> d!29602 (= c!5984 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!29602 (bvsge nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!29602 (= (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484) lt!139034)))

(declare-fun b!95213 () Bool)

(declare-fun isEmpty!260 (List!878) Bool)

(assert (=> b!95213 (= e!62392 (isEmpty!260 lt!139034))))

(declare-fun b!95211 () Bool)

(assert (=> b!95211 (= e!62393 (tuple2!7695 Nil!875 bitStream1!8))))

(assert (= (and d!29602 c!5984) b!95211))

(assert (= (and d!29602 (not c!5984)) b!95212))

(assert (= (and d!29602 c!5985) b!95213))

(assert (= (and d!29602 (not c!5985)) b!95214))

(declare-fun m!138667 () Bool)

(assert (=> b!95212 m!138667))

(declare-fun m!138669 () Bool)

(assert (=> b!95212 m!138669))

(declare-fun m!138671 () Bool)

(assert (=> b!95214 m!138671))

(declare-fun m!138673 () Bool)

(assert (=> b!95213 m!138673))

(assert (=> b!95049 d!29602))

(declare-fun d!29606 () Bool)

(assert (=> d!29606 (= (array_inv!1837 (buf!2381 bitStream1!8)) (bvsge (size!2023 (buf!2381 bitStream1!8)) #b00000000000000000000000000000000))))

(assert (=> b!95050 d!29606))

(declare-fun d!29608 () Bool)

(declare-fun lt!139053 () tuple2!7696)

(assert (=> d!29608 (= lt!139053 (readBit!0 bitStream1!8))))

(assert (=> d!29608 (= (readBitPure!0 bitStream1!8) (tuple2!7685 (_2!4095 lt!139053) (_1!4095 lt!139053)))))

(declare-fun bs!7282 () Bool)

(assert (= bs!7282 d!29608))

(assert (=> bs!7282 m!138669))

(assert (=> b!95051 d!29608))

(declare-fun d!29614 () Bool)

(assert (=> d!29614 (= (head!590 listBits!13) (h!993 listBits!13))))

(assert (=> b!95051 d!29614))

(declare-fun d!29616 () Bool)

(declare-fun res!78385 () Bool)

(declare-fun e!62396 () Bool)

(assert (=> d!29616 (=> (not res!78385) (not e!62396))))

(assert (=> d!29616 (= res!78385 (= (size!2023 (buf!2381 bitStream1!8)) (size!2023 (buf!2381 base!8))))))

(assert (=> d!29616 (= (isPrefixOf!0 bitStream1!8 base!8) e!62396)))

(declare-fun b!95223 () Bool)

(declare-fun res!78387 () Bool)

(assert (=> b!95223 (=> (not res!78387) (not e!62396))))

(assert (=> b!95223 (= res!78387 (bvsle (bitIndex!0 (size!2023 (buf!2381 bitStream1!8)) (currentByte!4750 bitStream1!8) (currentBit!4745 bitStream1!8)) (bitIndex!0 (size!2023 (buf!2381 base!8)) (currentByte!4750 base!8) (currentBit!4745 base!8))))))

(declare-fun b!95224 () Bool)

(declare-fun e!62397 () Bool)

(assert (=> b!95224 (= e!62396 e!62397)))

(declare-fun res!78386 () Bool)

(assert (=> b!95224 (=> res!78386 e!62397)))

(assert (=> b!95224 (= res!78386 (= (size!2023 (buf!2381 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!95225 () Bool)

(assert (=> b!95225 (= e!62397 (arrayBitRangesEq!0 (buf!2381 bitStream1!8) (buf!2381 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2023 (buf!2381 bitStream1!8)) (currentByte!4750 bitStream1!8) (currentBit!4745 bitStream1!8))))))

(assert (= (and d!29616 res!78385) b!95223))

(assert (= (and b!95223 res!78387) b!95224))

(assert (= (and b!95224 (not res!78386)) b!95225))

(assert (=> b!95223 m!138529))

(assert (=> b!95223 m!138535))

(assert (=> b!95225 m!138529))

(assert (=> b!95225 m!138529))

(declare-fun m!138683 () Bool)

(assert (=> b!95225 m!138683))

(assert (=> b!95052 d!29616))

(declare-fun d!29618 () Bool)

(assert (=> d!29618 (= (array_inv!1837 (buf!2381 bitStream2!8)) (bvsge (size!2023 (buf!2381 bitStream2!8)) #b00000000000000000000000000000000))))

(assert (=> b!95053 d!29618))

(declare-fun d!29620 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!29620 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2023 (buf!2381 bitStream2!8))) ((_ sign_extend 32) (currentByte!4750 bitStream2!8)) ((_ sign_extend 32) (currentBit!4745 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2023 (buf!2381 bitStream2!8))) ((_ sign_extend 32) (currentByte!4750 bitStream2!8)) ((_ sign_extend 32) (currentBit!4745 bitStream2!8))) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!7283 () Bool)

(assert (= bs!7283 d!29620))

(declare-fun m!138685 () Bool)

(assert (=> bs!7283 m!138685))

(assert (=> b!95054 d!29620))

(declare-fun d!29622 () Bool)

(assert (=> d!29622 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2023 (buf!2381 bitStream1!8))) ((_ sign_extend 32) (currentByte!4750 bitStream1!8)) ((_ sign_extend 32) (currentBit!4745 bitStream1!8)) nBits!484) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2023 (buf!2381 bitStream1!8))) ((_ sign_extend 32) (currentByte!4750 bitStream1!8)) ((_ sign_extend 32) (currentBit!4745 bitStream1!8))) nBits!484))))

(declare-fun bs!7284 () Bool)

(assert (= bs!7284 d!29622))

(declare-fun m!138687 () Bool)

(assert (=> bs!7284 m!138687))

(assert (=> b!95055 d!29622))

(declare-fun d!29624 () Bool)

(assert (=> d!29624 (= (array_inv!1837 (buf!2381 base!8)) (bvsge (size!2023 (buf!2381 base!8)) #b00000000000000000000000000000000))))

(assert (=> b!95056 d!29624))

(declare-fun d!29626 () Bool)

(declare-fun res!78394 () Bool)

(declare-fun e!62402 () Bool)

(assert (=> d!29626 (=> (not res!78394) (not e!62402))))

(assert (=> d!29626 (= res!78394 (= (size!2023 (buf!2381 bitStream2!8)) (size!2023 (buf!2381 base!8))))))

(assert (=> d!29626 (= (isPrefixOf!0 bitStream2!8 base!8) e!62402)))

(declare-fun b!95232 () Bool)

(declare-fun res!78396 () Bool)

(assert (=> b!95232 (=> (not res!78396) (not e!62402))))

(assert (=> b!95232 (= res!78396 (bvsle (bitIndex!0 (size!2023 (buf!2381 bitStream2!8)) (currentByte!4750 bitStream2!8) (currentBit!4745 bitStream2!8)) (bitIndex!0 (size!2023 (buf!2381 base!8)) (currentByte!4750 base!8) (currentBit!4745 base!8))))))

(declare-fun b!95233 () Bool)

(declare-fun e!62403 () Bool)

(assert (=> b!95233 (= e!62402 e!62403)))

(declare-fun res!78395 () Bool)

(assert (=> b!95233 (=> res!78395 e!62403)))

(assert (=> b!95233 (= res!78395 (= (size!2023 (buf!2381 bitStream2!8)) #b00000000000000000000000000000000))))

(declare-fun b!95234 () Bool)

(assert (=> b!95234 (= e!62403 (arrayBitRangesEq!0 (buf!2381 bitStream2!8) (buf!2381 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2023 (buf!2381 bitStream2!8)) (currentByte!4750 bitStream2!8) (currentBit!4745 bitStream2!8))))))

(assert (= (and d!29626 res!78394) b!95232))

(assert (= (and b!95232 res!78396) b!95233))

(assert (= (and b!95233 (not res!78395)) b!95234))

(assert (=> b!95232 m!138531))

(assert (=> b!95232 m!138535))

(assert (=> b!95234 m!138531))

(assert (=> b!95234 m!138531))

(declare-fun m!138689 () Bool)

(assert (=> b!95234 m!138689))

(assert (=> b!95045 d!29626))

(declare-fun d!29628 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!29628 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4745 bitStream1!8) (currentByte!4750 bitStream1!8) (size!2023 (buf!2381 bitStream1!8))))))

(declare-fun bs!7285 () Bool)

(assert (= bs!7285 d!29628))

(declare-fun m!138691 () Bool)

(assert (=> bs!7285 m!138691))

(assert (=> start!19022 d!29628))

(declare-fun d!29630 () Bool)

(assert (=> d!29630 (= (inv!12 bitStream2!8) (invariant!0 (currentBit!4745 bitStream2!8) (currentByte!4750 bitStream2!8) (size!2023 (buf!2381 bitStream2!8))))))

(declare-fun bs!7286 () Bool)

(assert (= bs!7286 d!29630))

(declare-fun m!138693 () Bool)

(assert (=> bs!7286 m!138693))

(assert (=> start!19022 d!29630))

(declare-fun d!29632 () Bool)

(assert (=> d!29632 (= (inv!12 base!8) (invariant!0 (currentBit!4745 base!8) (currentByte!4750 base!8) (size!2023 (buf!2381 base!8))))))

(declare-fun bs!7287 () Bool)

(assert (= bs!7287 d!29632))

(declare-fun m!138695 () Bool)

(assert (=> bs!7287 m!138695))

(assert (=> start!19022 d!29632))

(declare-fun d!29634 () Bool)

(assert (=> d!29634 (= (inv!12 thiss!1534) (invariant!0 (currentBit!4745 thiss!1534) (currentByte!4750 thiss!1534) (size!2023 (buf!2381 thiss!1534))))))

(declare-fun bs!7288 () Bool)

(assert (= bs!7288 d!29634))

(declare-fun m!138697 () Bool)

(assert (=> bs!7288 m!138697))

(assert (=> start!19022 d!29634))

(declare-fun d!29636 () Bool)

(declare-fun e!62412 () Bool)

(assert (=> d!29636 e!62412))

(declare-fun res!78410 () Bool)

(assert (=> d!29636 (=> (not res!78410) (not e!62412))))

(declare-fun lt!139067 () (_ BitVec 64))

(declare-fun lt!139070 () (_ BitVec 64))

(declare-fun lt!139071 () (_ BitVec 64))

(assert (=> d!29636 (= res!78410 (= lt!139070 (bvsub lt!139067 lt!139071)))))

(assert (=> d!29636 (or (= (bvand lt!139067 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139071 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!139067 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!139067 lt!139071) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29636 (= lt!139071 (remainingBits!0 ((_ sign_extend 32) (size!2023 (buf!2381 bitStream1!8))) ((_ sign_extend 32) (currentByte!4750 bitStream1!8)) ((_ sign_extend 32) (currentBit!4745 bitStream1!8))))))

(declare-fun lt!139068 () (_ BitVec 64))

(declare-fun lt!139066 () (_ BitVec 64))

(assert (=> d!29636 (= lt!139067 (bvmul lt!139068 lt!139066))))

(assert (=> d!29636 (or (= lt!139068 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!139066 (bvsdiv (bvmul lt!139068 lt!139066) lt!139068)))))

(assert (=> d!29636 (= lt!139066 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29636 (= lt!139068 ((_ sign_extend 32) (size!2023 (buf!2381 bitStream1!8))))))

(assert (=> d!29636 (= lt!139070 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4750 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4745 bitStream1!8))))))

(assert (=> d!29636 (invariant!0 (currentBit!4745 bitStream1!8) (currentByte!4750 bitStream1!8) (size!2023 (buf!2381 bitStream1!8)))))

(assert (=> d!29636 (= (bitIndex!0 (size!2023 (buf!2381 bitStream1!8)) (currentByte!4750 bitStream1!8) (currentBit!4745 bitStream1!8)) lt!139070)))

(declare-fun b!95248 () Bool)

(declare-fun res!78411 () Bool)

(assert (=> b!95248 (=> (not res!78411) (not e!62412))))

(assert (=> b!95248 (= res!78411 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!139070))))

(declare-fun b!95249 () Bool)

(declare-fun lt!139069 () (_ BitVec 64))

(assert (=> b!95249 (= e!62412 (bvsle lt!139070 (bvmul lt!139069 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!95249 (or (= lt!139069 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!139069 #b0000000000000000000000000000000000000000000000000000000000001000) lt!139069)))))

(assert (=> b!95249 (= lt!139069 ((_ sign_extend 32) (size!2023 (buf!2381 bitStream1!8))))))

(assert (= (and d!29636 res!78410) b!95248))

(assert (= (and b!95248 res!78411) b!95249))

(assert (=> d!29636 m!138687))

(assert (=> d!29636 m!138691))

(assert (=> b!95046 d!29636))

(declare-fun d!29654 () Bool)

(declare-fun e!62415 () Bool)

(assert (=> d!29654 e!62415))

(declare-fun res!78412 () Bool)

(assert (=> d!29654 (=> (not res!78412) (not e!62415))))

(declare-fun lt!139082 () (_ BitVec 64))

(declare-fun lt!139079 () (_ BitVec 64))

(declare-fun lt!139083 () (_ BitVec 64))

(assert (=> d!29654 (= res!78412 (= lt!139082 (bvsub lt!139079 lt!139083)))))

(assert (=> d!29654 (or (= (bvand lt!139079 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139083 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!139079 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!139079 lt!139083) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29654 (= lt!139083 (remainingBits!0 ((_ sign_extend 32) (size!2023 (buf!2381 bitStream2!8))) ((_ sign_extend 32) (currentByte!4750 bitStream2!8)) ((_ sign_extend 32) (currentBit!4745 bitStream2!8))))))

(declare-fun lt!139080 () (_ BitVec 64))

(declare-fun lt!139078 () (_ BitVec 64))

(assert (=> d!29654 (= lt!139079 (bvmul lt!139080 lt!139078))))

(assert (=> d!29654 (or (= lt!139080 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!139078 (bvsdiv (bvmul lt!139080 lt!139078) lt!139080)))))

(assert (=> d!29654 (= lt!139078 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29654 (= lt!139080 ((_ sign_extend 32) (size!2023 (buf!2381 bitStream2!8))))))

(assert (=> d!29654 (= lt!139082 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4750 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4745 bitStream2!8))))))

(assert (=> d!29654 (invariant!0 (currentBit!4745 bitStream2!8) (currentByte!4750 bitStream2!8) (size!2023 (buf!2381 bitStream2!8)))))

(assert (=> d!29654 (= (bitIndex!0 (size!2023 (buf!2381 bitStream2!8)) (currentByte!4750 bitStream2!8) (currentBit!4745 bitStream2!8)) lt!139082)))

(declare-fun b!95254 () Bool)

(declare-fun res!78413 () Bool)

(assert (=> b!95254 (=> (not res!78413) (not e!62415))))

(assert (=> b!95254 (= res!78413 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!139082))))

(declare-fun b!95255 () Bool)

(declare-fun lt!139081 () (_ BitVec 64))

(assert (=> b!95255 (= e!62415 (bvsle lt!139082 (bvmul lt!139081 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!95255 (or (= lt!139081 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!139081 #b0000000000000000000000000000000000000000000000000000000000001000) lt!139081)))))

(assert (=> b!95255 (= lt!139081 ((_ sign_extend 32) (size!2023 (buf!2381 bitStream2!8))))))

(assert (= (and d!29654 res!78412) b!95254))

(assert (= (and b!95254 res!78413) b!95255))

(assert (=> d!29654 m!138685))

(assert (=> d!29654 m!138693))

(assert (=> b!95046 d!29654))

(declare-fun d!29656 () Bool)

(declare-fun e!62418 () Bool)

(assert (=> d!29656 e!62418))

(declare-fun res!78414 () Bool)

(assert (=> d!29656 (=> (not res!78414) (not e!62418))))

(declare-fun lt!139085 () (_ BitVec 64))

(declare-fun lt!139088 () (_ BitVec 64))

(declare-fun lt!139089 () (_ BitVec 64))

(assert (=> d!29656 (= res!78414 (= lt!139088 (bvsub lt!139085 lt!139089)))))

(assert (=> d!29656 (or (= (bvand lt!139085 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139089 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!139085 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!139085 lt!139089) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29656 (= lt!139089 (remainingBits!0 ((_ sign_extend 32) (size!2023 (buf!2381 base!8))) ((_ sign_extend 32) (currentByte!4750 base!8)) ((_ sign_extend 32) (currentBit!4745 base!8))))))

(declare-fun lt!139086 () (_ BitVec 64))

(declare-fun lt!139084 () (_ BitVec 64))

(assert (=> d!29656 (= lt!139085 (bvmul lt!139086 lt!139084))))

(assert (=> d!29656 (or (= lt!139086 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!139084 (bvsdiv (bvmul lt!139086 lt!139084) lt!139086)))))

(assert (=> d!29656 (= lt!139084 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29656 (= lt!139086 ((_ sign_extend 32) (size!2023 (buf!2381 base!8))))))

(assert (=> d!29656 (= lt!139088 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4750 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4745 base!8))))))

(assert (=> d!29656 (invariant!0 (currentBit!4745 base!8) (currentByte!4750 base!8) (size!2023 (buf!2381 base!8)))))

(assert (=> d!29656 (= (bitIndex!0 (size!2023 (buf!2381 base!8)) (currentByte!4750 base!8) (currentBit!4745 base!8)) lt!139088)))

(declare-fun b!95260 () Bool)

(declare-fun res!78415 () Bool)

(assert (=> b!95260 (=> (not res!78415) (not e!62418))))

(assert (=> b!95260 (= res!78415 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!139088))))

(declare-fun b!95261 () Bool)

(declare-fun lt!139087 () (_ BitVec 64))

(assert (=> b!95261 (= e!62418 (bvsle lt!139088 (bvmul lt!139087 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!95261 (or (= lt!139087 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!139087 #b0000000000000000000000000000000000000000000000000000000000001000) lt!139087)))))

(assert (=> b!95261 (= lt!139087 ((_ sign_extend 32) (size!2023 (buf!2381 base!8))))))

(assert (= (and d!29656 res!78414) b!95260))

(assert (= (and b!95260 res!78415) b!95261))

(declare-fun m!138709 () Bool)

(assert (=> d!29656 m!138709))

(assert (=> d!29656 m!138695))

(assert (=> b!95047 d!29656))

(declare-fun d!29658 () Bool)

(assert (=> d!29658 (= (array_inv!1837 (buf!2381 thiss!1534)) (bvsge (size!2023 (buf!2381 thiss!1534)) #b00000000000000000000000000000000))))

(assert (=> b!95048 d!29658))

(declare-fun d!29660 () Bool)

(declare-fun size!2027 (List!878) Int)

(assert (=> d!29660 (= (length!469 listBits!13) (size!2027 listBits!13))))

(declare-fun bs!7293 () Bool)

(assert (= bs!7293 d!29660))

(declare-fun m!138711 () Bool)

(assert (=> bs!7293 m!138711))

(assert (=> b!95059 d!29660))

(push 1)

(assert (not b!95202))

(assert (not b!95214))

(assert (not b!95212))

(assert (not d!29620))

(assert (not b!95200))

(assert (not d!29632))

(assert (not d!29660))

(assert (not d!29634))

(assert (not d!29628))

(assert (not b!95223))

(assert (not d!29654))

(assert (not b!95234))

(assert (not d!29636))

(assert (not d!29608))

(assert (not b!95225))

(assert (not b!95213))

(assert (not d!29656))

(assert (not d!29622))

(assert (not b!95232))

(assert (not d!29630))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

