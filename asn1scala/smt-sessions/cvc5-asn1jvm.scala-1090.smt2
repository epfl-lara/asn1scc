; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31306 () Bool)

(assert start!31306)

(declare-fun b!157450 () Bool)

(declare-fun res!131563 () Bool)

(declare-fun e!106695 () Bool)

(assert (=> b!157450 (=> (not res!131563) (not e!106695))))

(declare-datatypes ((array!7278 0))(
  ( (array!7279 (arr!4184 (Array (_ BitVec 32) (_ BitVec 8))) (size!3295 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5782 0))(
  ( (BitStream!5783 (buf!3765 array!7278) (currentByte!6910 (_ BitVec 32)) (currentBit!6905 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5782)

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157450 (= res!131563 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3295 (buf!3765 bs!65))) ((_ sign_extend 32) (currentByte!6910 bs!65)) ((_ sign_extend 32) (currentBit!6905 bs!65)) (bvsub to!236 from!240)))))

(declare-fun res!131562 () Bool)

(assert (=> start!31306 (=> (not res!131562) (not e!106695))))

(declare-fun arr!153 () array!7278)

(assert (=> start!31306 (= res!131562 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3295 arr!153))))))

(assert (=> start!31306 e!106695))

(assert (=> start!31306 true))

(declare-fun array_inv!3054 (array!7278) Bool)

(assert (=> start!31306 (array_inv!3054 arr!153)))

(declare-fun e!106693 () Bool)

(declare-fun inv!12 (BitStream!5782) Bool)

(assert (=> start!31306 (and (inv!12 bs!65) e!106693)))

(declare-fun b!157452 () Bool)

(declare-datatypes ((tuple2!14224 0))(
  ( (tuple2!14225 (_1!7562 BitStream!5782) (_2!7562 array!7278)) )
))
(declare-fun lt!247329 () tuple2!14224)

(declare-fun lt!247330 () tuple2!14224)

(declare-fun e!106697 () Bool)

(declare-fun arrayRangesEq!437 (array!7278 array!7278 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!157452 (= e!106697 (not (arrayRangesEq!437 (_2!7562 lt!247329) (_2!7562 lt!247330) #b00000000000000000000000000000000 to!236)))))

(declare-fun b!157453 () Bool)

(assert (=> b!157453 (= e!106693 (array_inv!3054 (buf!3765 bs!65)))))

(declare-fun b!157451 () Bool)

(assert (=> b!157451 (= e!106695 e!106697)))

(declare-fun res!131564 () Bool)

(assert (=> b!157451 (=> (not res!131564) (not e!106697))))

(assert (=> b!157451 (= res!131564 (= from!240 (bvsub to!236 #b00000000000000000000000000000001)))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5782 array!7278 (_ BitVec 32) (_ BitVec 32)) tuple2!14224)

(declare-fun withMovedByteIndex!0 (BitStream!5782 (_ BitVec 32)) BitStream!5782)

(declare-datatypes ((tuple2!14226 0))(
  ( (tuple2!14227 (_1!7563 BitStream!5782) (_2!7563 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5782) tuple2!14226)

(assert (=> b!157451 (= lt!247330 (readByteArrayLoopPure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7279 (store (arr!4184 arr!153) from!240 (_2!7563 (readBytePure!0 bs!65))) (size!3295 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> b!157451 (= lt!247329 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(assert (= (and start!31306 res!131562) b!157450))

(assert (= (and b!157450 res!131563) b!157451))

(assert (= (and b!157451 res!131564) b!157452))

(assert (= start!31306 b!157453))

(declare-fun m!246369 () Bool)

(assert (=> b!157450 m!246369))

(declare-fun m!246371 () Bool)

(assert (=> start!31306 m!246371))

(declare-fun m!246373 () Bool)

(assert (=> start!31306 m!246373))

(declare-fun m!246375 () Bool)

(assert (=> b!157452 m!246375))

(declare-fun m!246377 () Bool)

(assert (=> b!157451 m!246377))

(declare-fun m!246379 () Bool)

(assert (=> b!157451 m!246379))

(assert (=> b!157451 m!246379))

(declare-fun m!246381 () Bool)

(assert (=> b!157451 m!246381))

(declare-fun m!246383 () Bool)

(assert (=> b!157451 m!246383))

(declare-fun m!246385 () Bool)

(assert (=> b!157451 m!246385))

(declare-fun m!246387 () Bool)

(assert (=> b!157453 m!246387))

(push 1)

(assert (not b!157451))

(assert (not b!157450))

(assert (not b!157453))

(assert (not start!31306))

(assert (not b!157452))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!52544 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!52544 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3295 (buf!3765 bs!65))) ((_ sign_extend 32) (currentByte!6910 bs!65)) ((_ sign_extend 32) (currentBit!6905 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3295 (buf!3765 bs!65))) ((_ sign_extend 32) (currentByte!6910 bs!65)) ((_ sign_extend 32) (currentBit!6905 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12924 () Bool)

(assert (= bs!12924 d!52544))

(declare-fun m!246429 () Bool)

(assert (=> bs!12924 m!246429))

(assert (=> b!157450 d!52544))

(declare-fun d!52546 () Bool)

(declare-datatypes ((Unit!10360 0))(
  ( (Unit!10361) )
))
(declare-datatypes ((tuple3!666 0))(
  ( (tuple3!667 (_1!7568 Unit!10360) (_2!7568 BitStream!5782) (_3!450 array!7278)) )
))
(declare-fun lt!247345 () tuple3!666)

(declare-fun readByteArrayLoop!0 (BitStream!5782 array!7278 (_ BitVec 32) (_ BitVec 32)) tuple3!666)

(assert (=> d!52546 (= lt!247345 (readByteArrayLoop!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7279 (store (arr!4184 arr!153) from!240 (_2!7563 (readBytePure!0 bs!65))) (size!3295 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52546 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7279 (store (arr!4184 arr!153) from!240 (_2!7563 (readBytePure!0 bs!65))) (size!3295 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) (tuple2!14225 (_2!7568 lt!247345) (_3!450 lt!247345)))))

(declare-fun bs!12926 () Bool)

(assert (= bs!12926 d!52546))

(assert (=> bs!12926 m!246379))

(declare-fun m!246433 () Bool)

(assert (=> bs!12926 m!246433))

(assert (=> b!157451 d!52546))

(declare-fun d!52552 () Bool)

(declare-datatypes ((tuple2!14236 0))(
  ( (tuple2!14237 (_1!7569 Unit!10360) (_2!7569 BitStream!5782)) )
))
(declare-fun moveByteIndex!0 (BitStream!5782 (_ BitVec 32)) tuple2!14236)

(assert (=> d!52552 (= (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7569 (moveByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun bs!12927 () Bool)

(assert (= bs!12927 d!52552))

(declare-fun m!246435 () Bool)

(assert (=> bs!12927 m!246435))

(assert (=> b!157451 d!52552))

(declare-fun d!52554 () Bool)

(declare-datatypes ((tuple2!14238 0))(
  ( (tuple2!14239 (_1!7571 (_ BitVec 8)) (_2!7571 BitStream!5782)) )
))
(declare-fun lt!247351 () tuple2!14238)

(declare-fun readByte!0 (BitStream!5782) tuple2!14238)

(assert (=> d!52554 (= lt!247351 (readByte!0 bs!65))))

(assert (=> d!52554 (= (readBytePure!0 bs!65) (tuple2!14227 (_2!7571 lt!247351) (_1!7571 lt!247351)))))

(declare-fun bs!12929 () Bool)

(assert (= bs!12929 d!52554))

(declare-fun m!246439 () Bool)

(assert (=> bs!12929 m!246439))

(assert (=> b!157451 d!52554))

(declare-fun d!52558 () Bool)

(declare-fun lt!247352 () tuple3!666)

(assert (=> d!52558 (= lt!247352 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!52558 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!14225 (_2!7568 lt!247352) (_3!450 lt!247352)))))

(declare-fun bs!12931 () Bool)

(assert (= bs!12931 d!52558))

(declare-fun m!246443 () Bool)

(assert (=> bs!12931 m!246443))

(assert (=> b!157451 d!52558))

(declare-fun d!52562 () Bool)

(declare-fun res!131587 () Bool)

(declare-fun e!106732 () Bool)

(assert (=> d!52562 (=> res!131587 e!106732)))

(assert (=> d!52562 (= res!131587 (= #b00000000000000000000000000000000 to!236))))

(assert (=> d!52562 (= (arrayRangesEq!437 (_2!7562 lt!247329) (_2!7562 lt!247330) #b00000000000000000000000000000000 to!236) e!106732)))

(declare-fun b!157482 () Bool)

(declare-fun e!106733 () Bool)

(assert (=> b!157482 (= e!106732 e!106733)))

(declare-fun res!131588 () Bool)

(assert (=> b!157482 (=> (not res!131588) (not e!106733))))

(assert (=> b!157482 (= res!131588 (= (select (arr!4184 (_2!7562 lt!247329)) #b00000000000000000000000000000000) (select (arr!4184 (_2!7562 lt!247330)) #b00000000000000000000000000000000)))))

(declare-fun b!157483 () Bool)

(assert (=> b!157483 (= e!106733 (arrayRangesEq!437 (_2!7562 lt!247329) (_2!7562 lt!247330) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236))))

(assert (= (and d!52562 (not res!131587)) b!157482))

(assert (= (and b!157482 res!131588) b!157483))

(declare-fun m!246449 () Bool)

(assert (=> b!157482 m!246449))

(declare-fun m!246451 () Bool)

(assert (=> b!157482 m!246451))

(declare-fun m!246453 () Bool)

(assert (=> b!157483 m!246453))

(assert (=> b!157452 d!52562))

(declare-fun d!52568 () Bool)

(assert (=> d!52568 (= (array_inv!3054 (buf!3765 bs!65)) (bvsge (size!3295 (buf!3765 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!157453 d!52568))

(declare-fun d!52570 () Bool)

(assert (=> d!52570 (= (array_inv!3054 arr!153) (bvsge (size!3295 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!31306 d!52570))

(declare-fun d!52572 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!52572 (= (inv!12 bs!65) (invariant!0 (currentBit!6905 bs!65) (currentByte!6910 bs!65) (size!3295 (buf!3765 bs!65))))))

(declare-fun bs!12934 () Bool)

(assert (= bs!12934 d!52572))

(declare-fun m!246455 () Bool)

(assert (=> bs!12934 m!246455))

(assert (=> start!31306 d!52572))

(push 1)

(assert (not d!52572))

(assert (not d!52552))

(assert (not d!52546))

(assert (not d!52544))

(assert (not d!52558))

(assert (not b!157483))

(assert (not d!52554))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!52598 () Bool)

(assert (=> d!52598 (= (invariant!0 (currentBit!6905 bs!65) (currentByte!6910 bs!65) (size!3295 (buf!3765 bs!65))) (and (bvsge (currentBit!6905 bs!65) #b00000000000000000000000000000000) (bvslt (currentBit!6905 bs!65) #b00000000000000000000000000001000) (bvsge (currentByte!6910 bs!65) #b00000000000000000000000000000000) (or (bvslt (currentByte!6910 bs!65) (size!3295 (buf!3765 bs!65))) (and (= (currentBit!6905 bs!65) #b00000000000000000000000000000000) (= (currentByte!6910 bs!65) (size!3295 (buf!3765 bs!65)))))))))

(assert (=> d!52572 d!52598))

(declare-fun d!52600 () Bool)

(declare-fun lt!247382 () (_ BitVec 8))

(declare-fun lt!247379 () (_ BitVec 8))

(assert (=> d!52600 (= lt!247382 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4184 (buf!3765 bs!65)) (currentByte!6910 bs!65))) ((_ sign_extend 24) lt!247379))))))

(assert (=> d!52600 (= lt!247379 ((_ extract 7 0) (currentBit!6905 bs!65)))))

(declare-fun e!106752 () Bool)

(assert (=> d!52600 e!106752))

(declare-fun res!131608 () Bool)

(assert (=> d!52600 (=> (not res!131608) (not e!106752))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!52600 (= res!131608 (validate_offset_bits!1 ((_ sign_extend 32) (size!3295 (buf!3765 bs!65))) ((_ sign_extend 32) (currentByte!6910 bs!65)) ((_ sign_extend 32) (currentBit!6905 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!14248 0))(
  ( (tuple2!14249 (_1!7577 Unit!10360) (_2!7577 (_ BitVec 8))) )
))
(declare-fun Unit!10366 () Unit!10360)

(declare-fun Unit!10367 () Unit!10360)

(assert (=> d!52600 (= (readByte!0 bs!65) (tuple2!14239 (_2!7577 (ite (bvsgt ((_ sign_extend 24) lt!247379) #b00000000000000000000000000000000) (tuple2!14249 Unit!10366 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!247382) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4184 (buf!3765 bs!65)) (bvadd (currentByte!6910 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!247379)))))))) (tuple2!14249 Unit!10367 lt!247382))) (BitStream!5783 (buf!3765 bs!65) (bvadd (currentByte!6910 bs!65) #b00000000000000000000000000000001) (currentBit!6905 bs!65))))))

(declare-fun b!157502 () Bool)

(declare-fun e!106753 () Bool)

(assert (=> b!157502 (= e!106752 e!106753)))

(declare-fun res!131609 () Bool)

(assert (=> b!157502 (=> (not res!131609) (not e!106753))))

(declare-fun lt!247381 () tuple2!14238)

(assert (=> b!157502 (= res!131609 (= (buf!3765 (_2!7571 lt!247381)) (buf!3765 bs!65)))))

(declare-fun lt!247383 () (_ BitVec 8))

(declare-fun lt!247378 () (_ BitVec 8))

(declare-fun Unit!10368 () Unit!10360)

(declare-fun Unit!10369 () Unit!10360)

(assert (=> b!157502 (= lt!247381 (tuple2!14239 (_2!7577 (ite (bvsgt ((_ sign_extend 24) lt!247378) #b00000000000000000000000000000000) (tuple2!14249 Unit!10368 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!247383) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4184 (buf!3765 bs!65)) (bvadd (currentByte!6910 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!247378)))))))) (tuple2!14249 Unit!10369 lt!247383))) (BitStream!5783 (buf!3765 bs!65) (bvadd (currentByte!6910 bs!65) #b00000000000000000000000000000001) (currentBit!6905 bs!65))))))

(assert (=> b!157502 (= lt!247383 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4184 (buf!3765 bs!65)) (currentByte!6910 bs!65))) ((_ sign_extend 24) lt!247378))))))

(assert (=> b!157502 (= lt!247378 ((_ extract 7 0) (currentBit!6905 bs!65)))))

(declare-fun b!157503 () Bool)

(declare-fun lt!247380 () (_ BitVec 64))

(declare-fun lt!247384 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!157503 (= e!106753 (= (bitIndex!0 (size!3295 (buf!3765 (_2!7571 lt!247381))) (currentByte!6910 (_2!7571 lt!247381)) (currentBit!6905 (_2!7571 lt!247381))) (bvadd lt!247380 lt!247384)))))

(assert (=> b!157503 (or (not (= (bvand lt!247380 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!247384 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!247380 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!247380 lt!247384) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!157503 (= lt!247384 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!157503 (= lt!247380 (bitIndex!0 (size!3295 (buf!3765 bs!65)) (currentByte!6910 bs!65) (currentBit!6905 bs!65)))))

(assert (= (and d!52600 res!131608) b!157502))

(assert (= (and b!157502 res!131609) b!157503))

(declare-fun m!246489 () Bool)

(assert (=> d!52600 m!246489))

(declare-fun m!246491 () Bool)

(assert (=> d!52600 m!246491))

(declare-fun m!246493 () Bool)

(assert (=> d!52600 m!246493))

(assert (=> b!157502 m!246493))

(assert (=> b!157502 m!246489))

(declare-fun m!246495 () Bool)

(assert (=> b!157503 m!246495))

(declare-fun m!246497 () Bool)

(assert (=> b!157503 m!246497))

(assert (=> d!52554 d!52600))

(declare-fun d!52606 () Bool)

(declare-fun res!131610 () Bool)

(declare-fun e!106754 () Bool)

(assert (=> d!52606 (=> res!131610 e!106754)))

(assert (=> d!52606 (= res!131610 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236))))

(assert (=> d!52606 (= (arrayRangesEq!437 (_2!7562 lt!247329) (_2!7562 lt!247330) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236) e!106754)))

(declare-fun b!157504 () Bool)

(declare-fun e!106755 () Bool)

(assert (=> b!157504 (= e!106754 e!106755)))

(declare-fun res!131611 () Bool)

(assert (=> b!157504 (=> (not res!131611) (not e!106755))))

(assert (=> b!157504 (= res!131611 (= (select (arr!4184 (_2!7562 lt!247329)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4184 (_2!7562 lt!247330)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!157505 () Bool)

(assert (=> b!157505 (= e!106755 (arrayRangesEq!437 (_2!7562 lt!247329) (_2!7562 lt!247330) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!236))))

(assert (= (and d!52606 (not res!131610)) b!157504))

(assert (= (and b!157504 res!131611) b!157505))

(declare-fun m!246499 () Bool)

(assert (=> b!157504 m!246499))

(declare-fun m!246501 () Bool)

(assert (=> b!157504 m!246501))

(declare-fun m!246503 () Bool)

(assert (=> b!157505 m!246503))

(assert (=> b!157483 d!52606))

(declare-fun e!106771 () Bool)

(declare-fun b!157531 () Bool)

(declare-fun lt!247576 () tuple3!666)

(assert (=> b!157531 (= e!106771 (arrayRangesEq!437 (array!7279 (store (arr!4184 arr!153) from!240 (_2!7563 (readBytePure!0 bs!65))) (size!3295 arr!153)) (_3!450 lt!247576) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun d!52608 () Bool)

(declare-fun e!106772 () Bool)

(assert (=> d!52608 e!106772))

(declare-fun res!131627 () Bool)

(assert (=> d!52608 (=> res!131627 e!106772)))

(assert (=> d!52608 (= res!131627 (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!247565 () Bool)

(assert (=> d!52608 (= lt!247565 e!106771)))

(declare-fun res!131628 () Bool)

(assert (=> d!52608 (=> (not res!131628) (not e!106771))))

(declare-fun lt!247570 () (_ BitVec 64))

(declare-fun lt!247578 () (_ BitVec 64))

(assert (=> d!52608 (= res!131628 (= (bvadd lt!247578 lt!247570) (bitIndex!0 (size!3295 (buf!3765 (_2!7568 lt!247576))) (currentByte!6910 (_2!7568 lt!247576)) (currentBit!6905 (_2!7568 lt!247576)))))))

(assert (=> d!52608 (or (not (= (bvand lt!247578 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!247570 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!247578 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!247578 lt!247570) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!247588 () (_ BitVec 64))

(assert (=> d!52608 (= lt!247570 (bvmul lt!247588 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!52608 (or (= lt!247588 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!247588 #b0000000000000000000000000000000000000000000000000000000000001000) lt!247588)))))

(assert (=> d!52608 (= lt!247588 ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))))))

(assert (=> d!52608 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!240) #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b10000000000000000000000000000000)))))

(assert (=> d!52608 (= lt!247578 (bitIndex!0 (size!3295 (buf!3765 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (currentByte!6910 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (currentBit!6905 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))))

(declare-fun e!106773 () tuple3!666)

(assert (=> d!52608 (= lt!247576 e!106773)))

(declare-fun c!8376 () Bool)

(assert (=> d!52608 (= c!8376 (bvslt (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52608 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsle (bvadd #b00000000000000000000000000000001 from!240) to!236) (bvsle to!236 (size!3295 (array!7279 (store (arr!4184 arr!153) from!240 (_2!7563 (readBytePure!0 bs!65))) (size!3295 arr!153)))))))

(assert (=> d!52608 (= (readByteArrayLoop!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7279 (store (arr!4184 arr!153) from!240 (_2!7563 (readBytePure!0 bs!65))) (size!3295 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) lt!247576)))

(declare-fun b!157532 () Bool)

(declare-fun res!131629 () Bool)

(assert (=> b!157532 (=> (not res!131629) (not e!106771))))

(assert (=> b!157532 (= res!131629 (and (= (buf!3765 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (buf!3765 (_2!7568 lt!247576))) (= (size!3295 (array!7279 (store (arr!4184 arr!153) from!240 (_2!7563 (readBytePure!0 bs!65))) (size!3295 arr!153))) (size!3295 (_3!450 lt!247576)))))))

(declare-fun b!157533 () Bool)

(assert (=> b!157533 (= e!106772 (= (select (arr!4184 (_3!450 lt!247576)) (bvadd #b00000000000000000000000000000001 from!240)) (_2!7563 (readBytePure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)))))))

(assert (=> b!157533 (and (bvsge (bvadd #b00000000000000000000000000000001 from!240) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!240) (size!3295 (_3!450 lt!247576))))))

(declare-fun lt!247599 () tuple3!666)

(declare-fun bm!2559 () Bool)

(declare-fun call!2564 () Bool)

(assert (=> bm!2559 (= call!2564 (arrayRangesEq!437 (array!7279 (store (arr!4184 arr!153) from!240 (_2!7563 (readBytePure!0 bs!65))) (size!3295 arr!153)) (ite c!8376 (_3!450 lt!247599) (array!7279 (store (arr!4184 arr!153) from!240 (_2!7563 (readBytePure!0 bs!65))) (size!3295 arr!153))) #b00000000000000000000000000000000 (ite c!8376 (bvadd #b00000000000000000000000000000001 from!240) (size!3295 (array!7279 (store (arr!4184 arr!153) from!240 (_2!7563 (readBytePure!0 bs!65))) (size!3295 arr!153))))))))

(declare-fun b!157534 () Bool)

(declare-fun lt!247567 () Unit!10360)

(assert (=> b!157534 (= e!106773 (tuple3!667 lt!247567 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7279 (store (arr!4184 arr!153) from!240 (_2!7563 (readBytePure!0 bs!65))) (size!3295 arr!153))))))

(declare-fun call!2563 () (_ BitVec 64))

(assert (=> b!157534 (= call!2563 call!2563)))

(declare-fun lt!247579 () Unit!10360)

(declare-fun Unit!10370 () Unit!10360)

(assert (=> b!157534 (= lt!247579 Unit!10370)))

(declare-fun lt!247597 () Unit!10360)

(declare-fun arrayRangesEqReflexiveLemma!45 (array!7278) Unit!10360)

(assert (=> b!157534 (= lt!247597 (arrayRangesEqReflexiveLemma!45 (array!7279 (store (arr!4184 arr!153) from!240 (_2!7563 (readBytePure!0 bs!65))) (size!3295 arr!153))))))

(assert (=> b!157534 call!2564))

(declare-fun lt!247586 () Unit!10360)

(assert (=> b!157534 (= lt!247586 lt!247597)))

(declare-fun lt!247575 () array!7278)

(assert (=> b!157534 (= lt!247575 (array!7279 (store (arr!4184 arr!153) from!240 (_2!7563 (readBytePure!0 bs!65))) (size!3295 arr!153)))))

(declare-fun lt!247595 () array!7278)

(assert (=> b!157534 (= lt!247595 (array!7279 (store (arr!4184 arr!153) from!240 (_2!7563 (readBytePure!0 bs!65))) (size!3295 arr!153)))))

(declare-fun lt!247574 () (_ BitVec 32))

(assert (=> b!157534 (= lt!247574 #b00000000000000000000000000000000)))

(declare-fun lt!247571 () (_ BitVec 32))

(assert (=> b!157534 (= lt!247571 (size!3295 (array!7279 (store (arr!4184 arr!153) from!240 (_2!7563 (readBytePure!0 bs!65))) (size!3295 arr!153))))))

(declare-fun lt!247594 () (_ BitVec 32))

(assert (=> b!157534 (= lt!247594 #b00000000000000000000000000000000)))

(declare-fun lt!247566 () (_ BitVec 32))

(assert (=> b!157534 (= lt!247566 (bvadd #b00000000000000000000000000000001 from!240))))

(declare-fun arrayRangesEqSlicedLemma!45 (array!7278 array!7278 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10360)

(assert (=> b!157534 (= lt!247567 (arrayRangesEqSlicedLemma!45 lt!247575 lt!247595 lt!247574 lt!247571 lt!247594 lt!247566))))

(declare-fun call!2562 () Bool)

(assert (=> b!157534 call!2562))

(declare-fun bm!2560 () Bool)

(declare-fun lt!247596 () (_ BitVec 32))

(assert (=> bm!2560 (= call!2562 (arrayRangesEq!437 (ite c!8376 (array!7279 (store (arr!4184 arr!153) from!240 (_2!7563 (readBytePure!0 bs!65))) (size!3295 arr!153)) lt!247575) (ite c!8376 (_3!450 lt!247599) lt!247595) (ite c!8376 lt!247596 lt!247594) (ite c!8376 (bvadd #b00000000000000000000000000000001 from!240) lt!247566)))))

(declare-fun bm!2561 () Bool)

(assert (=> bm!2561 (= call!2563 (bitIndex!0 (ite c!8376 (size!3295 (buf!3765 (_2!7568 lt!247599))) (size!3295 (buf!3765 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)))) (ite c!8376 (currentByte!6910 (_2!7568 lt!247599)) (currentByte!6910 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (ite c!8376 (currentBit!6905 (_2!7568 lt!247599)) (currentBit!6905 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)))))))

(declare-fun b!157535 () Bool)

(declare-fun lt!247584 () Unit!10360)

(assert (=> b!157535 (= e!106773 (tuple3!667 lt!247584 (_2!7568 lt!247599) (_3!450 lt!247599)))))

(declare-fun lt!247592 () tuple2!14238)

(assert (=> b!157535 (= lt!247592 (readByte!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun lt!247589 () array!7278)

(assert (=> b!157535 (= lt!247589 (array!7279 (store (arr!4184 (array!7279 (store (arr!4184 arr!153) from!240 (_2!7563 (readBytePure!0 bs!65))) (size!3295 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7571 lt!247592)) (size!3295 (array!7279 (store (arr!4184 arr!153) from!240 (_2!7563 (readBytePure!0 bs!65))) (size!3295 arr!153)))))))

(declare-fun lt!247577 () (_ BitVec 64))

(assert (=> b!157535 (= lt!247577 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!247600 () (_ BitVec 32))

(assert (=> b!157535 (= lt!247600 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!247591 () Unit!10360)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5782 BitStream!5782 (_ BitVec 64) (_ BitVec 32)) Unit!10360)

(assert (=> b!157535 (= lt!247591 (validateOffsetBytesFromBitIndexLemma!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7571 lt!247592) lt!247577 lt!247600))))

(assert (=> b!157535 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3295 (buf!3765 (_2!7571 lt!247592)))) ((_ sign_extend 32) (currentByte!6910 (_2!7571 lt!247592))) ((_ sign_extend 32) (currentBit!6905 (_2!7571 lt!247592))) (bvsub lt!247600 ((_ extract 31 0) (bvsdiv (bvadd lt!247577 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!247585 () Unit!10360)

(assert (=> b!157535 (= lt!247585 lt!247591)))

(assert (=> b!157535 (= lt!247599 (readByteArrayLoop!0 (_2!7571 lt!247592) lt!247589 (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!157535 (= (bitIndex!0 (size!3295 (buf!3765 (_2!7571 lt!247592))) (currentByte!6910 (_2!7571 lt!247592)) (currentBit!6905 (_2!7571 lt!247592))) (bvadd (bitIndex!0 (size!3295 (buf!3765 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (currentByte!6910 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (currentBit!6905 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!247590 () Unit!10360)

(declare-fun Unit!10371 () Unit!10360)

(assert (=> b!157535 (= lt!247590 Unit!10371)))

(assert (=> b!157535 (= (bvadd (bitIndex!0 (size!3295 (buf!3765 (_2!7571 lt!247592))) (currentByte!6910 (_2!7571 lt!247592)) (currentBit!6905 (_2!7571 lt!247592))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2563)))

(declare-fun lt!247582 () Unit!10360)

(declare-fun Unit!10372 () Unit!10360)

(assert (=> b!157535 (= lt!247582 Unit!10372)))

(assert (=> b!157535 (= (bvadd (bitIndex!0 (size!3295 (buf!3765 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (currentByte!6910 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (currentBit!6905 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (bvmul ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2563)))

(declare-fun lt!247572 () Unit!10360)

(declare-fun Unit!10373 () Unit!10360)

(assert (=> b!157535 (= lt!247572 Unit!10373)))

(assert (=> b!157535 (and (= (buf!3765 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (buf!3765 (_2!7568 lt!247599))) (= (size!3295 (array!7279 (store (arr!4184 arr!153) from!240 (_2!7563 (readBytePure!0 bs!65))) (size!3295 arr!153))) (size!3295 (_3!450 lt!247599))))))

(declare-fun lt!247581 () Unit!10360)

(declare-fun Unit!10374 () Unit!10360)

(assert (=> b!157535 (= lt!247581 Unit!10374)))

(declare-fun lt!247598 () Unit!10360)

(declare-fun arrayUpdatedAtPrefixLemma!45 (array!7278 (_ BitVec 32) (_ BitVec 8)) Unit!10360)

(assert (=> b!157535 (= lt!247598 (arrayUpdatedAtPrefixLemma!45 (array!7279 (store (arr!4184 arr!153) from!240 (_2!7563 (readBytePure!0 bs!65))) (size!3295 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) (_1!7571 lt!247592)))))

(assert (=> b!157535 (arrayRangesEq!437 (array!7279 (store (arr!4184 arr!153) from!240 (_2!7563 (readBytePure!0 bs!65))) (size!3295 arr!153)) (array!7279 (store (arr!4184 (array!7279 (store (arr!4184 arr!153) from!240 (_2!7563 (readBytePure!0 bs!65))) (size!3295 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7571 lt!247592)) (size!3295 (array!7279 (store (arr!4184 arr!153) from!240 (_2!7563 (readBytePure!0 bs!65))) (size!3295 arr!153)))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240))))

(declare-fun lt!247568 () Unit!10360)

(assert (=> b!157535 (= lt!247568 lt!247598)))

(assert (=> b!157535 (= lt!247596 #b00000000000000000000000000000000)))

(declare-fun lt!247587 () Unit!10360)

(declare-fun arrayRangesEqTransitive!110 (array!7278 array!7278 array!7278 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10360)

(assert (=> b!157535 (= lt!247587 (arrayRangesEqTransitive!110 (array!7279 (store (arr!4184 arr!153) from!240 (_2!7563 (readBytePure!0 bs!65))) (size!3295 arr!153)) lt!247589 (_3!450 lt!247599) lt!247596 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157535 call!2562))

(declare-fun lt!247580 () Unit!10360)

(assert (=> b!157535 (= lt!247580 lt!247587)))

(assert (=> b!157535 call!2564))

(declare-fun lt!247583 () Unit!10360)

(declare-fun Unit!10375 () Unit!10360)

(assert (=> b!157535 (= lt!247583 Unit!10375)))

(declare-fun lt!247569 () Unit!10360)

(declare-fun arrayRangesEqImpliesEq!54 (array!7278 array!7278 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10360)

(assert (=> b!157535 (= lt!247569 (arrayRangesEqImpliesEq!54 lt!247589 (_3!450 lt!247599) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157535 (= (select (store (arr!4184 (array!7279 (store (arr!4184 arr!153) from!240 (_2!7563 (readBytePure!0 bs!65))) (size!3295 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7571 lt!247592)) (bvadd #b00000000000000000000000000000001 from!240)) (select (arr!4184 (_3!450 lt!247599)) (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!247573 () Unit!10360)

(assert (=> b!157535 (= lt!247573 lt!247569)))

(declare-fun lt!247593 () Bool)

(assert (=> b!157535 (= lt!247593 (= (select (arr!4184 (_3!450 lt!247599)) (bvadd #b00000000000000000000000000000001 from!240)) (_1!7571 lt!247592)))))

(declare-fun Unit!10377 () Unit!10360)

(assert (=> b!157535 (= lt!247584 Unit!10377)))

(assert (=> b!157535 lt!247593))

(assert (= (and d!52608 c!8376) b!157535))

(assert (= (and d!52608 (not c!8376)) b!157534))

(assert (= (or b!157535 b!157534) bm!2559))

(assert (= (or b!157535 b!157534) bm!2560))

(assert (= (or b!157535 b!157534) bm!2561))

(assert (= (and d!52608 res!131628) b!157532))

(assert (= (and b!157532 res!131629) b!157531))

(assert (= (and d!52608 (not res!131627)) b!157533))

(declare-fun m!246517 () Bool)

(assert (=> b!157531 m!246517))

(declare-fun m!246523 () Bool)

(assert (=> bm!2560 m!246523))

(declare-fun m!246529 () Bool)

(assert (=> d!52608 m!246529))

(declare-fun m!246533 () Bool)

(assert (=> d!52608 m!246533))

(declare-fun m!246541 () Bool)

(assert (=> bm!2561 m!246541))

(declare-fun m!246545 () Bool)

(assert (=> b!157534 m!246545))

(declare-fun m!246549 () Bool)

(assert (=> b!157534 m!246549))

(declare-fun m!246553 () Bool)

(assert (=> b!157533 m!246553))

(assert (=> b!157533 m!246379))

(declare-fun m!246557 () Bool)

(assert (=> b!157533 m!246557))

(declare-fun m!246561 () Bool)

(assert (=> bm!2559 m!246561))

(declare-fun m!246563 () Bool)

(assert (=> b!157535 m!246563))

(assert (=> b!157535 m!246379))

(declare-fun m!246565 () Bool)

(assert (=> b!157535 m!246565))

(declare-fun m!246569 () Bool)

(assert (=> b!157535 m!246569))

(declare-fun m!246571 () Bool)

(assert (=> b!157535 m!246571))

(declare-fun m!246573 () Bool)

(assert (=> b!157535 m!246573))

(assert (=> b!157535 m!246533))

(declare-fun m!246575 () Bool)

(assert (=> b!157535 m!246575))

(declare-fun m!246577 () Bool)

(assert (=> b!157535 m!246577))

(declare-fun m!246579 () Bool)

(assert (=> b!157535 m!246579))

(assert (=> b!157535 m!246379))

(declare-fun m!246581 () Bool)

(assert (=> b!157535 m!246581))

(declare-fun m!246583 () Bool)

(assert (=> b!157535 m!246583))

(declare-fun m!246585 () Bool)

(assert (=> b!157535 m!246585))

(declare-fun m!246587 () Bool)

(assert (=> b!157535 m!246587))

(assert (=> d!52546 d!52608))

(declare-fun d!52614 () Bool)

(assert (=> d!52614 (= (remainingBits!0 ((_ sign_extend 32) (size!3295 (buf!3765 bs!65))) ((_ sign_extend 32) (currentByte!6910 bs!65)) ((_ sign_extend 32) (currentBit!6905 bs!65))) (bvsub (bvmul ((_ sign_extend 32) (size!3295 (buf!3765 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6910 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6905 bs!65)))))))

(assert (=> d!52544 d!52614))

(declare-fun d!52618 () Bool)

(declare-fun e!106779 () Bool)

(assert (=> d!52618 e!106779))

(declare-fun res!131635 () Bool)

(assert (=> d!52618 (=> (not res!131635) (not e!106779))))

(declare-fun moveByteIndexPrecond!0 (BitStream!5782 (_ BitVec 32)) Bool)

(assert (=> d!52618 (= res!131635 (moveByteIndexPrecond!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun Unit!10378 () Unit!10360)

(assert (=> d!52618 (= (moveByteIndex!0 bs!65 #b00000000000000000000000000000001) (tuple2!14237 Unit!10378 (BitStream!5783 (buf!3765 bs!65) (bvadd (currentByte!6910 bs!65) #b00000000000000000000000000000001) (currentBit!6905 bs!65))))))

(declare-fun b!157541 () Bool)

(assert (=> b!157541 (= e!106779 (and (or (not (= (bvand (currentByte!6910 bs!65) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6910 bs!65) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6910 bs!65) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6910 bs!65) #b00000000000000000000000000000001) (bvadd (currentByte!6910 bs!65) #b00000000000000000000000000000001))))))

(assert (= (and d!52618 res!131635) b!157541))

(declare-fun m!246591 () Bool)

(assert (=> d!52618 m!246591))

(assert (=> d!52552 d!52618))

(declare-fun lt!247612 () tuple3!666)

(declare-fun b!157542 () Bool)

(declare-fun e!106780 () Bool)

(assert (=> b!157542 (= e!106780 (arrayRangesEq!437 arr!153 (_3!450 lt!247612) #b00000000000000000000000000000000 from!240))))

(declare-fun d!52622 () Bool)

(declare-fun e!106781 () Bool)

(assert (=> d!52622 e!106781))

(declare-fun res!131636 () Bool)

(assert (=> d!52622 (=> res!131636 e!106781)))

(assert (=> d!52622 (= res!131636 (bvsge from!240 to!236))))

(declare-fun lt!247601 () Bool)

(assert (=> d!52622 (= lt!247601 e!106780)))

(declare-fun res!131637 () Bool)

(assert (=> d!52622 (=> (not res!131637) (not e!106780))))

(declare-fun lt!247614 () (_ BitVec 64))

(declare-fun lt!247606 () (_ BitVec 64))

(assert (=> d!52622 (= res!131637 (= (bvadd lt!247614 lt!247606) (bitIndex!0 (size!3295 (buf!3765 (_2!7568 lt!247612))) (currentByte!6910 (_2!7568 lt!247612)) (currentBit!6905 (_2!7568 lt!247612)))))))

(assert (=> d!52622 (or (not (= (bvand lt!247614 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!247606 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!247614 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!247614 lt!247606) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!247624 () (_ BitVec 64))

(assert (=> d!52622 (= lt!247606 (bvmul lt!247624 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!52622 (or (= lt!247624 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!247624 #b0000000000000000000000000000000000000000000000000000000000001000) lt!247624)))))

(assert (=> d!52622 (= lt!247624 ((_ sign_extend 32) (bvsub to!236 from!240)))))

(assert (=> d!52622 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand from!240 #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000)))))

(assert (=> d!52622 (= lt!247614 (bitIndex!0 (size!3295 (buf!3765 bs!65)) (currentByte!6910 bs!65) (currentBit!6905 bs!65)))))

(declare-fun e!106782 () tuple3!666)

(assert (=> d!52622 (= lt!247612 e!106782)))

(declare-fun c!8377 () Bool)

(assert (=> d!52622 (= c!8377 (bvslt from!240 to!236))))

(assert (=> d!52622 (and (bvsle #b00000000000000000000000000000000 from!240) (bvsle from!240 to!236) (bvsle to!236 (size!3295 arr!153)))))

(assert (=> d!52622 (= (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236) lt!247612)))

(declare-fun b!157543 () Bool)

(declare-fun res!131638 () Bool)

(assert (=> b!157543 (=> (not res!131638) (not e!106780))))

(assert (=> b!157543 (= res!131638 (and (= (buf!3765 bs!65) (buf!3765 (_2!7568 lt!247612))) (= (size!3295 arr!153) (size!3295 (_3!450 lt!247612)))))))

(declare-fun b!157544 () Bool)

(assert (=> b!157544 (= e!106781 (= (select (arr!4184 (_3!450 lt!247612)) from!240) (_2!7563 (readBytePure!0 bs!65))))))

(assert (=> b!157544 (and (bvsge from!240 #b00000000000000000000000000000000) (bvslt from!240 (size!3295 (_3!450 lt!247612))))))

(declare-fun bm!2562 () Bool)

(declare-fun lt!247635 () tuple3!666)

(declare-fun call!2567 () Bool)

(assert (=> bm!2562 (= call!2567 (arrayRangesEq!437 arr!153 (ite c!8377 (_3!450 lt!247635) arr!153) #b00000000000000000000000000000000 (ite c!8377 from!240 (size!3295 arr!153))))))

(declare-fun b!157545 () Bool)

(declare-fun lt!247603 () Unit!10360)

(assert (=> b!157545 (= e!106782 (tuple3!667 lt!247603 bs!65 arr!153))))

(declare-fun call!2566 () (_ BitVec 64))

(assert (=> b!157545 (= call!2566 call!2566)))

(declare-fun lt!247615 () Unit!10360)

(declare-fun Unit!10380 () Unit!10360)

(assert (=> b!157545 (= lt!247615 Unit!10380)))

(declare-fun lt!247633 () Unit!10360)

(assert (=> b!157545 (= lt!247633 (arrayRangesEqReflexiveLemma!45 arr!153))))

(assert (=> b!157545 call!2567))

(declare-fun lt!247622 () Unit!10360)

(assert (=> b!157545 (= lt!247622 lt!247633)))

(declare-fun lt!247611 () array!7278)

(assert (=> b!157545 (= lt!247611 arr!153)))

(declare-fun lt!247631 () array!7278)

(assert (=> b!157545 (= lt!247631 arr!153)))

(declare-fun lt!247610 () (_ BitVec 32))

(assert (=> b!157545 (= lt!247610 #b00000000000000000000000000000000)))

(declare-fun lt!247607 () (_ BitVec 32))

(assert (=> b!157545 (= lt!247607 (size!3295 arr!153))))

(declare-fun lt!247630 () (_ BitVec 32))

(assert (=> b!157545 (= lt!247630 #b00000000000000000000000000000000)))

(declare-fun lt!247602 () (_ BitVec 32))

(assert (=> b!157545 (= lt!247602 from!240)))

(assert (=> b!157545 (= lt!247603 (arrayRangesEqSlicedLemma!45 lt!247611 lt!247631 lt!247610 lt!247607 lt!247630 lt!247602))))

(declare-fun call!2565 () Bool)

(assert (=> b!157545 call!2565))

(declare-fun lt!247632 () (_ BitVec 32))

(declare-fun bm!2563 () Bool)

(assert (=> bm!2563 (= call!2565 (arrayRangesEq!437 (ite c!8377 arr!153 lt!247611) (ite c!8377 (_3!450 lt!247635) lt!247631) (ite c!8377 lt!247632 lt!247630) (ite c!8377 from!240 lt!247602)))))

(declare-fun bm!2564 () Bool)

(assert (=> bm!2564 (= call!2566 (bitIndex!0 (ite c!8377 (size!3295 (buf!3765 (_2!7568 lt!247635))) (size!3295 (buf!3765 bs!65))) (ite c!8377 (currentByte!6910 (_2!7568 lt!247635)) (currentByte!6910 bs!65)) (ite c!8377 (currentBit!6905 (_2!7568 lt!247635)) (currentBit!6905 bs!65))))))

(declare-fun b!157546 () Bool)

(declare-fun lt!247620 () Unit!10360)

(assert (=> b!157546 (= e!106782 (tuple3!667 lt!247620 (_2!7568 lt!247635) (_3!450 lt!247635)))))

(declare-fun lt!247628 () tuple2!14238)

(assert (=> b!157546 (= lt!247628 (readByte!0 bs!65))))

(declare-fun lt!247625 () array!7278)

(assert (=> b!157546 (= lt!247625 (array!7279 (store (arr!4184 arr!153) from!240 (_1!7571 lt!247628)) (size!3295 arr!153)))))

(declare-fun lt!247613 () (_ BitVec 64))

(assert (=> b!157546 (= lt!247613 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!247636 () (_ BitVec 32))

(assert (=> b!157546 (= lt!247636 (bvsub to!236 from!240))))

(declare-fun lt!247627 () Unit!10360)

(assert (=> b!157546 (= lt!247627 (validateOffsetBytesFromBitIndexLemma!0 bs!65 (_2!7571 lt!247628) lt!247613 lt!247636))))

(assert (=> b!157546 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3295 (buf!3765 (_2!7571 lt!247628)))) ((_ sign_extend 32) (currentByte!6910 (_2!7571 lt!247628))) ((_ sign_extend 32) (currentBit!6905 (_2!7571 lt!247628))) (bvsub lt!247636 ((_ extract 31 0) (bvsdiv (bvadd lt!247613 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!247621 () Unit!10360)

(assert (=> b!157546 (= lt!247621 lt!247627)))

(assert (=> b!157546 (= lt!247635 (readByteArrayLoop!0 (_2!7571 lt!247628) lt!247625 (bvadd from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!157546 (= (bitIndex!0 (size!3295 (buf!3765 (_2!7571 lt!247628))) (currentByte!6910 (_2!7571 lt!247628)) (currentBit!6905 (_2!7571 lt!247628))) (bvadd (bitIndex!0 (size!3295 (buf!3765 bs!65)) (currentByte!6910 bs!65) (currentBit!6905 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!247626 () Unit!10360)

(declare-fun Unit!10385 () Unit!10360)

(assert (=> b!157546 (= lt!247626 Unit!10385)))

(assert (=> b!157546 (= (bvadd (bitIndex!0 (size!3295 (buf!3765 (_2!7571 lt!247628))) (currentByte!6910 (_2!7571 lt!247628)) (currentBit!6905 (_2!7571 lt!247628))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2566)))

(declare-fun lt!247618 () Unit!10360)

(declare-fun Unit!10386 () Unit!10360)

(assert (=> b!157546 (= lt!247618 Unit!10386)))

(assert (=> b!157546 (= (bvadd (bitIndex!0 (size!3295 (buf!3765 bs!65)) (currentByte!6910 bs!65) (currentBit!6905 bs!65)) (bvmul ((_ sign_extend 32) (bvsub to!236 from!240)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2566)))

(declare-fun lt!247608 () Unit!10360)

(declare-fun Unit!10387 () Unit!10360)

(assert (=> b!157546 (= lt!247608 Unit!10387)))

(assert (=> b!157546 (and (= (buf!3765 bs!65) (buf!3765 (_2!7568 lt!247635))) (= (size!3295 arr!153) (size!3295 (_3!450 lt!247635))))))

(declare-fun lt!247617 () Unit!10360)

(declare-fun Unit!10389 () Unit!10360)

(assert (=> b!157546 (= lt!247617 Unit!10389)))

(declare-fun lt!247634 () Unit!10360)

(assert (=> b!157546 (= lt!247634 (arrayUpdatedAtPrefixLemma!45 arr!153 from!240 (_1!7571 lt!247628)))))

(assert (=> b!157546 (arrayRangesEq!437 arr!153 (array!7279 (store (arr!4184 arr!153) from!240 (_1!7571 lt!247628)) (size!3295 arr!153)) #b00000000000000000000000000000000 from!240)))

(declare-fun lt!247604 () Unit!10360)

(assert (=> b!157546 (= lt!247604 lt!247634)))

(assert (=> b!157546 (= lt!247632 #b00000000000000000000000000000000)))

(declare-fun lt!247623 () Unit!10360)

(assert (=> b!157546 (= lt!247623 (arrayRangesEqTransitive!110 arr!153 lt!247625 (_3!450 lt!247635) lt!247632 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157546 call!2565))

(declare-fun lt!247616 () Unit!10360)

(assert (=> b!157546 (= lt!247616 lt!247623)))

(assert (=> b!157546 call!2567))

(declare-fun lt!247619 () Unit!10360)

(declare-fun Unit!10390 () Unit!10360)

(assert (=> b!157546 (= lt!247619 Unit!10390)))

(declare-fun lt!247605 () Unit!10360)

(assert (=> b!157546 (= lt!247605 (arrayRangesEqImpliesEq!54 lt!247625 (_3!450 lt!247635) #b00000000000000000000000000000000 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157546 (= (select (store (arr!4184 arr!153) from!240 (_1!7571 lt!247628)) from!240) (select (arr!4184 (_3!450 lt!247635)) from!240))))

(declare-fun lt!247609 () Unit!10360)

(assert (=> b!157546 (= lt!247609 lt!247605)))

(declare-fun lt!247629 () Bool)

(assert (=> b!157546 (= lt!247629 (= (select (arr!4184 (_3!450 lt!247635)) from!240) (_1!7571 lt!247628)))))

(declare-fun Unit!10391 () Unit!10360)

(assert (=> b!157546 (= lt!247620 Unit!10391)))

(assert (=> b!157546 lt!247629))

(assert (= (and d!52622 c!8377) b!157546))

(assert (= (and d!52622 (not c!8377)) b!157545))

(assert (= (or b!157546 b!157545) bm!2562))

(assert (= (or b!157546 b!157545) bm!2563))

(assert (= (or b!157546 b!157545) bm!2564))

(assert (= (and d!52622 res!131637) b!157543))

(assert (= (and b!157543 res!131638) b!157542))

(assert (= (and d!52622 (not res!131636)) b!157544))

(declare-fun m!246593 () Bool)

(assert (=> b!157542 m!246593))

(declare-fun m!246595 () Bool)

(assert (=> bm!2563 m!246595))

(declare-fun m!246597 () Bool)

(assert (=> d!52622 m!246597))

(assert (=> d!52622 m!246497))

(declare-fun m!246599 () Bool)

(assert (=> bm!2564 m!246599))

(declare-fun m!246601 () Bool)

(assert (=> b!157545 m!246601))

(declare-fun m!246603 () Bool)

(assert (=> b!157545 m!246603))

(declare-fun m!246605 () Bool)

(assert (=> b!157544 m!246605))

(assert (=> b!157544 m!246377))

(declare-fun m!246607 () Bool)

(assert (=> bm!2562 m!246607))

(declare-fun m!246609 () Bool)

(assert (=> b!157546 m!246609))

(declare-fun m!246611 () Bool)

(assert (=> b!157546 m!246611))

(declare-fun m!246613 () Bool)

(assert (=> b!157546 m!246613))

(declare-fun m!246615 () Bool)

(assert (=> b!157546 m!246615))

(declare-fun m!246617 () Bool)

(assert (=> b!157546 m!246617))

(assert (=> b!157546 m!246497))

(declare-fun m!246619 () Bool)

(assert (=> b!157546 m!246619))

(declare-fun m!246621 () Bool)

(assert (=> b!157546 m!246621))

(declare-fun m!246623 () Bool)

(assert (=> b!157546 m!246623))

(assert (=> b!157546 m!246439))

(declare-fun m!246625 () Bool)

(assert (=> b!157546 m!246625))

(declare-fun m!246627 () Bool)

(assert (=> b!157546 m!246627))

(declare-fun m!246629 () Bool)

(assert (=> b!157546 m!246629))

(assert (=> d!52558 d!52622))

(push 1)

(assert (not d!52622))

(assert (not bm!2563))

(assert (not b!157503))

(assert (not b!157531))

(assert (not d!52618))

(assert (not bm!2560))

(assert (not b!157545))

(assert (not b!157534))

(assert (not b!157535))

(assert (not b!157505))

(assert (not b!157544))

(assert (not bm!2559))

(assert (not b!157546))

(assert (not d!52600))

(assert (not b!157542))

(assert (not b!157533))

(assert (not bm!2564))

(assert (not bm!2561))

(assert (not d!52608))

(assert (not bm!2562))

(check-sat)

(pop 1)

(push 1)

(check-sat)

