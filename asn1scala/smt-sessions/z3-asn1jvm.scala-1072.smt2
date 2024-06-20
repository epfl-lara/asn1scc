; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30894 () Bool)

(assert start!30894)

(declare-fun res!130666 () Bool)

(declare-fun e!105586 () Bool)

(assert (=> start!30894 (=> (not res!130666) (not e!105586))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7160 0))(
  ( (array!7161 (arr!4068 (Array (_ BitVec 32) (_ BitVec 8))) (size!3212 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7160)

(assert (=> start!30894 (= res!130666 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3212 arr!153))))))

(assert (=> start!30894 e!105586))

(assert (=> start!30894 true))

(declare-fun array_inv!3001 (array!7160) Bool)

(assert (=> start!30894 (array_inv!3001 arr!153)))

(declare-datatypes ((BitStream!5682 0))(
  ( (BitStream!5683 (buf!3715 array!7160) (currentByte!6824 (_ BitVec 32)) (currentBit!6819 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5682)

(declare-fun e!105589 () Bool)

(declare-fun inv!12 (BitStream!5682) Bool)

(assert (=> start!30894 (and (inv!12 bs!65) e!105589)))

(declare-fun b!156329 () Bool)

(declare-fun e!105590 () Bool)

(assert (=> b!156329 (= e!105586 e!105590)))

(declare-fun res!130667 () Bool)

(assert (=> b!156329 (=> (not res!130667) (not e!105590))))

(assert (=> b!156329 (= res!130667 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((tuple2!13958 0))(
  ( (tuple2!13959 (_1!7417 BitStream!5682) (_2!7417 array!7160)) )
))
(declare-fun lt!244545 () tuple2!13958)

(declare-fun readByteArrayLoopPure!0 (BitStream!5682 array!7160 (_ BitVec 32) (_ BitVec 32)) tuple2!13958)

(declare-fun withMovedByteIndex!0 (BitStream!5682 (_ BitVec 32)) BitStream!5682)

(declare-datatypes ((tuple2!13960 0))(
  ( (tuple2!13961 (_1!7418 BitStream!5682) (_2!7418 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5682) tuple2!13960)

(assert (=> b!156329 (= lt!244545 (readByteArrayLoopPure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7161 (store (arr!4068 arr!153) from!240 (_2!7418 (readBytePure!0 bs!65))) (size!3212 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!244546 () tuple2!13958)

(assert (=> b!156329 (= lt!244546 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!156331 () Bool)

(assert (=> b!156331 (= e!105589 (array_inv!3001 (buf!3715 bs!65)))))

(declare-fun b!156330 () Bool)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!156330 (= e!105590 (not (validate_offset_byte!0 ((_ sign_extend 32) (size!3212 (buf!3715 bs!65))) ((_ sign_extend 32) (currentByte!6824 bs!65)) ((_ sign_extend 32) (currentBit!6819 bs!65)))))))

(declare-fun b!156328 () Bool)

(declare-fun res!130665 () Bool)

(assert (=> b!156328 (=> (not res!130665) (not e!105586))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!156328 (= res!130665 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3212 (buf!3715 bs!65))) ((_ sign_extend 32) (currentByte!6824 bs!65)) ((_ sign_extend 32) (currentBit!6819 bs!65)) (bvsub to!236 from!240)))))

(assert (= (and start!30894 res!130666) b!156328))

(assert (= (and b!156328 res!130665) b!156329))

(assert (= (and b!156329 res!130667) b!156330))

(assert (= start!30894 b!156331))

(declare-fun m!243557 () Bool)

(assert (=> start!30894 m!243557))

(declare-fun m!243559 () Bool)

(assert (=> start!30894 m!243559))

(declare-fun m!243561 () Bool)

(assert (=> b!156328 m!243561))

(declare-fun m!243563 () Bool)

(assert (=> b!156330 m!243563))

(declare-fun m!243565 () Bool)

(assert (=> b!156329 m!243565))

(declare-fun m!243567 () Bool)

(assert (=> b!156329 m!243567))

(assert (=> b!156329 m!243567))

(declare-fun m!243569 () Bool)

(assert (=> b!156329 m!243569))

(declare-fun m!243571 () Bool)

(assert (=> b!156329 m!243571))

(declare-fun m!243573 () Bool)

(assert (=> b!156329 m!243573))

(declare-fun m!243575 () Bool)

(assert (=> b!156331 m!243575))

(check-sat (not b!156330) (not start!30894) (not b!156328) (not b!156329) (not b!156331))
(check-sat)
(get-model)

(declare-fun d!52004 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!52004 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3212 (buf!3715 bs!65))) ((_ sign_extend 32) (currentByte!6824 bs!65)) ((_ sign_extend 32) (currentBit!6819 bs!65))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3212 (buf!3715 bs!65))) ((_ sign_extend 32) (currentByte!6824 bs!65)) ((_ sign_extend 32) (currentBit!6819 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!12731 () Bool)

(assert (= bs!12731 d!52004))

(declare-fun m!243621 () Bool)

(assert (=> bs!12731 m!243621))

(assert (=> b!156330 d!52004))

(declare-fun d!52006 () Bool)

(assert (=> d!52006 (= (array_inv!3001 (buf!3715 bs!65)) (bvsge (size!3212 (buf!3715 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!156331 d!52006))

(declare-fun d!52008 () Bool)

(assert (=> d!52008 (= (array_inv!3001 arr!153) (bvsge (size!3212 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!30894 d!52008))

(declare-fun d!52010 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!52010 (= (inv!12 bs!65) (invariant!0 (currentBit!6819 bs!65) (currentByte!6824 bs!65) (size!3212 (buf!3715 bs!65))))))

(declare-fun bs!12732 () Bool)

(assert (= bs!12732 d!52010))

(declare-fun m!243623 () Bool)

(assert (=> bs!12732 m!243623))

(assert (=> start!30894 d!52010))

(declare-fun d!52012 () Bool)

(assert (=> d!52012 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3212 (buf!3715 bs!65))) ((_ sign_extend 32) (currentByte!6824 bs!65)) ((_ sign_extend 32) (currentBit!6819 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3212 (buf!3715 bs!65))) ((_ sign_extend 32) (currentByte!6824 bs!65)) ((_ sign_extend 32) (currentBit!6819 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12733 () Bool)

(assert (= bs!12733 d!52012))

(assert (=> bs!12733 m!243621))

(assert (=> b!156328 d!52012))

(declare-fun d!52014 () Bool)

(declare-datatypes ((Unit!10079 0))(
  ( (Unit!10080) )
))
(declare-datatypes ((tuple3!646 0))(
  ( (tuple3!647 (_1!7427 Unit!10079) (_2!7427 BitStream!5682) (_3!440 array!7160)) )
))
(declare-fun lt!244569 () tuple3!646)

(declare-fun readByteArrayLoop!0 (BitStream!5682 array!7160 (_ BitVec 32) (_ BitVec 32)) tuple3!646)

(assert (=> d!52014 (= lt!244569 (readByteArrayLoop!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7161 (store (arr!4068 arr!153) from!240 (_2!7418 (readBytePure!0 bs!65))) (size!3212 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52014 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7161 (store (arr!4068 arr!153) from!240 (_2!7418 (readBytePure!0 bs!65))) (size!3212 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) (tuple2!13959 (_2!7427 lt!244569) (_3!440 lt!244569)))))

(declare-fun bs!12734 () Bool)

(assert (= bs!12734 d!52014))

(assert (=> bs!12734 m!243567))

(declare-fun m!243625 () Bool)

(assert (=> bs!12734 m!243625))

(assert (=> b!156329 d!52014))

(declare-fun d!52016 () Bool)

(declare-datatypes ((tuple2!13974 0))(
  ( (tuple2!13975 (_1!7428 Unit!10079) (_2!7428 BitStream!5682)) )
))
(declare-fun moveByteIndex!0 (BitStream!5682 (_ BitVec 32)) tuple2!13974)

(assert (=> d!52016 (= (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7428 (moveByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun bs!12735 () Bool)

(assert (= bs!12735 d!52016))

(declare-fun m!243627 () Bool)

(assert (=> bs!12735 m!243627))

(assert (=> b!156329 d!52016))

(declare-fun d!52018 () Bool)

(declare-datatypes ((tuple2!13976 0))(
  ( (tuple2!13977 (_1!7429 (_ BitVec 8)) (_2!7429 BitStream!5682)) )
))
(declare-fun lt!244572 () tuple2!13976)

(declare-fun readByte!0 (BitStream!5682) tuple2!13976)

(assert (=> d!52018 (= lt!244572 (readByte!0 bs!65))))

(assert (=> d!52018 (= (readBytePure!0 bs!65) (tuple2!13961 (_2!7429 lt!244572) (_1!7429 lt!244572)))))

(declare-fun bs!12736 () Bool)

(assert (= bs!12736 d!52018))

(declare-fun m!243629 () Bool)

(assert (=> bs!12736 m!243629))

(assert (=> b!156329 d!52018))

(declare-fun lt!244573 () tuple3!646)

(declare-fun d!52020 () Bool)

(assert (=> d!52020 (= lt!244573 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!52020 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!13959 (_2!7427 lt!244573) (_3!440 lt!244573)))))

(declare-fun bs!12737 () Bool)

(assert (= bs!12737 d!52020))

(declare-fun m!243631 () Bool)

(assert (=> bs!12737 m!243631))

(assert (=> b!156329 d!52020))

(check-sat (not d!52018) (not d!52016) (not d!52012) (not d!52010) (not d!52020) (not d!52004) (not d!52014))
(check-sat)
