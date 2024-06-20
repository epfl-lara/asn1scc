; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31170 () Bool)

(assert start!31170)

(declare-fun b!157133 () Bool)

(declare-fun e!106351 () Bool)

(declare-datatypes ((array!7235 0))(
  ( (array!7236 (arr!4150 (Array (_ BitVec 32) (_ BitVec 8))) (size!3273 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5748 0))(
  ( (BitStream!5749 (buf!3748 array!7235) (currentByte!6884 (_ BitVec 32)) (currentBit!6879 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5748)

(declare-fun array_inv!3034 (array!7235) Bool)

(assert (=> b!157133 (= e!106351 (array_inv!3034 (buf!3748 bs!65)))))

(declare-fun res!131326 () Bool)

(declare-fun e!106353 () Bool)

(assert (=> start!31170 (=> (not res!131326) (not e!106353))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun arr!153 () array!7235)

(assert (=> start!31170 (= res!131326 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3273 arr!153))))))

(assert (=> start!31170 e!106353))

(assert (=> start!31170 true))

(assert (=> start!31170 (array_inv!3034 arr!153)))

(declare-fun inv!12 (BitStream!5748) Bool)

(assert (=> start!31170 (and (inv!12 bs!65) e!106351)))

(declare-fun b!157134 () Bool)

(declare-datatypes ((tuple2!14138 0))(
  ( (tuple2!14139 (_1!7516 BitStream!5748) (_2!7516 array!7235)) )
))
(declare-fun lt!246456 () tuple2!14138)

(declare-fun e!106352 () Bool)

(declare-fun lt!246466 () tuple2!14138)

(assert (=> b!157134 (= e!106352 (or (bvsgt #b00000000000000000000000000000000 to!236) (bvsgt (size!3273 (_2!7516 lt!246456)) (size!3273 (_2!7516 lt!246466))) (bvsle to!236 (size!3273 (_2!7516 lt!246456)))))))

(declare-fun lt!246460 () tuple2!14138)

(declare-fun arrayRangesEq!435 (array!7235 array!7235 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!157134 (arrayRangesEq!435 (_2!7516 lt!246466) (_2!7516 lt!246460) #b00000000000000000000000000000000 to!236)))

(declare-datatypes ((Unit!10263 0))(
  ( (Unit!10264) )
))
(declare-fun lt!246461 () Unit!10263)

(declare-fun lt!246463 () BitStream!5748)

(declare-fun lt!246462 () array!7235)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5748 array!7235 (_ BitVec 32) (_ BitVec 32)) Unit!10263)

(assert (=> b!157134 (= lt!246461 (readByteArrayLoopArrayPrefixLemma!0 lt!246463 lt!246462 (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-datatypes ((tuple2!14140 0))(
  ( (tuple2!14141 (_1!7517 BitStream!5748) (_2!7517 (_ BitVec 8))) )
))
(declare-fun lt!246457 () tuple2!14140)

(declare-fun readByteArrayLoopPure!0 (BitStream!5748 array!7235 (_ BitVec 32) (_ BitVec 32)) tuple2!14138)

(declare-fun withMovedByteIndex!0 (BitStream!5748 (_ BitVec 32)) BitStream!5748)

(declare-fun readBytePure!0 (BitStream!5748) tuple2!14140)

(assert (=> b!157134 (= lt!246460 (readByteArrayLoopPure!0 (withMovedByteIndex!0 lt!246463 #b00000000000000000000000000000001) (array!7236 (store (store (arr!4150 arr!153) from!240 (_2!7517 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7517 lt!246457)) (size!3273 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(declare-fun lt!246459 () (Array (_ BitVec 32) (_ BitVec 8)))

(assert (=> b!157134 (= lt!246459 (store (arr!4150 arr!153) from!240 (_2!7517 (readBytePure!0 bs!65))))))

(declare-fun b!157135 () Bool)

(declare-fun e!106355 () Bool)

(assert (=> b!157135 (= e!106355 (not e!106352))))

(declare-fun res!131327 () Bool)

(assert (=> b!157135 (=> res!131327 e!106352)))

(assert (=> b!157135 (= res!131327 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236)))))

(declare-fun lt!246465 () (_ BitVec 64))

(declare-fun lt!246464 () (_ BitVec 64))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157135 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3273 (buf!3748 lt!246463))) lt!246465 lt!246464 (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001))))

(assert (=> b!157135 (= lt!246464 ((_ sign_extend 32) (currentBit!6879 lt!246463)))))

(assert (=> b!157135 (= lt!246465 ((_ sign_extend 32) (currentByte!6884 lt!246463)))))

(declare-fun lt!246458 () Unit!10263)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5748 BitStream!5748 (_ BitVec 64) (_ BitVec 32)) Unit!10263)

(assert (=> b!157135 (= lt!246458 (validateOffsetBytesFromBitIndexLemma!0 bs!65 lt!246463 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)))))

(assert (=> b!157135 (= lt!246457 (readBytePure!0 lt!246463))))

(declare-fun b!157136 () Bool)

(declare-fun res!131325 () Bool)

(assert (=> b!157136 (=> (not res!131325) (not e!106353))))

(assert (=> b!157136 (= res!131325 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3273 (buf!3748 bs!65))) ((_ sign_extend 32) (currentByte!6884 bs!65)) ((_ sign_extend 32) (currentBit!6879 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!157137 () Bool)

(declare-fun res!131323 () Bool)

(assert (=> b!157137 (=> res!131323 e!106352)))

(assert (=> b!157137 (= res!131323 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!3273 (buf!3748 lt!246463))) lt!246465 lt!246464 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))))

(declare-fun b!157138 () Bool)

(assert (=> b!157138 (= e!106353 e!106355)))

(declare-fun res!131324 () Bool)

(assert (=> b!157138 (=> (not res!131324) (not e!106355))))

(assert (=> b!157138 (= res!131324 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(assert (=> b!157138 (= lt!246466 (readByteArrayLoopPure!0 lt!246463 lt!246462 (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> b!157138 (= lt!246462 (array!7236 (store (arr!4150 arr!153) from!240 (_2!7517 (readBytePure!0 bs!65))) (size!3273 arr!153)))))

(assert (=> b!157138 (= lt!246463 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(assert (=> b!157138 (= lt!246456 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(assert (= (and start!31170 res!131326) b!157136))

(assert (= (and b!157136 res!131325) b!157138))

(assert (= (and b!157138 res!131324) b!157135))

(assert (= (and b!157135 (not res!131327)) b!157137))

(assert (= (and b!157137 (not res!131323)) b!157134))

(assert (= start!31170 b!157133))

(declare-fun m!245433 () Bool)

(assert (=> b!157133 m!245433))

(declare-fun m!245435 () Bool)

(assert (=> b!157136 m!245435))

(declare-fun m!245437 () Bool)

(assert (=> start!31170 m!245437))

(declare-fun m!245439 () Bool)

(assert (=> start!31170 m!245439))

(declare-fun m!245441 () Bool)

(assert (=> b!157138 m!245441))

(declare-fun m!245443 () Bool)

(assert (=> b!157138 m!245443))

(declare-fun m!245445 () Bool)

(assert (=> b!157138 m!245445))

(declare-fun m!245447 () Bool)

(assert (=> b!157138 m!245447))

(declare-fun m!245449 () Bool)

(assert (=> b!157138 m!245449))

(declare-fun m!245451 () Bool)

(assert (=> b!157134 m!245451))

(assert (=> b!157134 m!245441))

(declare-fun m!245453 () Bool)

(assert (=> b!157134 m!245453))

(assert (=> b!157134 m!245445))

(declare-fun m!245455 () Bool)

(assert (=> b!157134 m!245455))

(declare-fun m!245457 () Bool)

(assert (=> b!157134 m!245457))

(assert (=> b!157134 m!245451))

(declare-fun m!245459 () Bool)

(assert (=> b!157134 m!245459))

(declare-fun m!245461 () Bool)

(assert (=> b!157137 m!245461))

(declare-fun m!245463 () Bool)

(assert (=> b!157135 m!245463))

(declare-fun m!245465 () Bool)

(assert (=> b!157135 m!245465))

(declare-fun m!245467 () Bool)

(assert (=> b!157135 m!245467))

(check-sat (not start!31170) (not b!157136) (not b!157133) (not b!157134) (not b!157135) (not b!157138) (not b!157137))
(check-sat)
(get-model)

(declare-fun d!52403 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!52403 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3273 (buf!3748 bs!65))) ((_ sign_extend 32) (currentByte!6884 bs!65)) ((_ sign_extend 32) (currentBit!6879 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3273 (buf!3748 bs!65))) ((_ sign_extend 32) (currentByte!6884 bs!65)) ((_ sign_extend 32) (currentBit!6879 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12872 () Bool)

(assert (= bs!12872 d!52403))

(declare-fun m!245581 () Bool)

(assert (=> bs!12872 m!245581))

(assert (=> b!157136 d!52403))

(declare-fun d!52405 () Bool)

(assert (=> d!52405 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3273 (buf!3748 lt!246463))) lt!246465 lt!246464 (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3273 (buf!3748 lt!246463))) lt!246465 lt!246464) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12873 () Bool)

(assert (= bs!12873 d!52405))

(declare-fun m!245583 () Bool)

(assert (=> bs!12873 m!245583))

(assert (=> b!157135 d!52405))

(declare-fun d!52407 () Bool)

(declare-fun e!106396 () Bool)

(assert (=> d!52407 e!106396))

(declare-fun res!131363 () Bool)

(assert (=> d!52407 (=> (not res!131363) (not e!106396))))

(assert (=> d!52407 (= res!131363 (and (or (let ((rhs!3447 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3447 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3447) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!52408 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!52408 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!52408 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3446 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3446 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3446) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!246632 () Unit!10263)

(declare-fun choose!57 (BitStream!5748 BitStream!5748 (_ BitVec 64) (_ BitVec 32)) Unit!10263)

(assert (=> d!52407 (= lt!246632 (choose!57 bs!65 lt!246463 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)))))

(assert (=> d!52407 (= (validateOffsetBytesFromBitIndexLemma!0 bs!65 lt!246463 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)) lt!246632)))

(declare-fun b!157181 () Bool)

(declare-fun lt!246630 () (_ BitVec 32))

(assert (=> b!157181 (= e!106396 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3273 (buf!3748 lt!246463))) ((_ sign_extend 32) (currentByte!6884 lt!246463)) ((_ sign_extend 32) (currentBit!6879 lt!246463)) (bvsub (bvsub to!236 from!240) lt!246630)))))

(assert (=> b!157181 (or (= (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000) (bvand lt!246630 #b10000000000000000000000000000000)) (= (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!236 from!240) lt!246630) #b10000000000000000000000000000000)))))

(declare-fun lt!246631 () (_ BitVec 64))

(assert (=> b!157181 (= lt!246630 ((_ extract 31 0) lt!246631))))

(assert (=> b!157181 (and (bvslt lt!246631 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!246631 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!157181 (= lt!246631 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!52407 res!131363) b!157181))

(declare-fun m!245585 () Bool)

(assert (=> d!52407 m!245585))

(declare-fun m!245587 () Bool)

(assert (=> b!157181 m!245587))

(assert (=> b!157135 d!52407))

(declare-fun d!52410 () Bool)

(declare-datatypes ((tuple2!14154 0))(
  ( (tuple2!14155 (_1!7526 (_ BitVec 8)) (_2!7526 BitStream!5748)) )
))
(declare-fun lt!246643 () tuple2!14154)

(declare-fun readByte!0 (BitStream!5748) tuple2!14154)

(assert (=> d!52410 (= lt!246643 (readByte!0 lt!246463))))

(assert (=> d!52410 (= (readBytePure!0 lt!246463) (tuple2!14141 (_2!7526 lt!246643) (_1!7526 lt!246643)))))

(declare-fun bs!12874 () Bool)

(assert (= bs!12874 d!52410))

(declare-fun m!245589 () Bool)

(assert (=> bs!12874 m!245589))

(assert (=> b!157135 d!52410))

(declare-fun d!52412 () Bool)

(assert (=> d!52412 (= (array_inv!3034 arr!153) (bvsge (size!3273 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!31170 d!52412))

(declare-fun d!52414 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!52414 (= (inv!12 bs!65) (invariant!0 (currentBit!6879 bs!65) (currentByte!6884 bs!65) (size!3273 (buf!3748 bs!65))))))

(declare-fun bs!12875 () Bool)

(assert (= bs!12875 d!52414))

(declare-fun m!245591 () Bool)

(assert (=> bs!12875 m!245591))

(assert (=> start!31170 d!52414))

(declare-fun d!52416 () Bool)

(declare-datatypes ((tuple3!664 0))(
  ( (tuple3!665 (_1!7527 Unit!10263) (_2!7527 BitStream!5748) (_3!449 array!7235)) )
))
(declare-fun lt!246646 () tuple3!664)

(declare-fun readByteArrayLoop!0 (BitStream!5748 array!7235 (_ BitVec 32) (_ BitVec 32)) tuple3!664)

(assert (=> d!52416 (= lt!246646 (readByteArrayLoop!0 (withMovedByteIndex!0 lt!246463 #b00000000000000000000000000000001) (array!7236 (store (store (arr!4150 arr!153) from!240 (_2!7517 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7517 lt!246457)) (size!3273 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(assert (=> d!52416 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 lt!246463 #b00000000000000000000000000000001) (array!7236 (store (store (arr!4150 arr!153) from!240 (_2!7517 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7517 lt!246457)) (size!3273 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236) (tuple2!14139 (_2!7527 lt!246646) (_3!449 lt!246646)))))

(declare-fun bs!12876 () Bool)

(assert (= bs!12876 d!52416))

(assert (=> bs!12876 m!245451))

(declare-fun m!245593 () Bool)

(assert (=> bs!12876 m!245593))

(assert (=> b!157134 d!52416))

(declare-fun d!52418 () Bool)

(declare-fun lt!246691 () tuple2!14138)

(declare-fun lt!246693 () tuple2!14138)

(assert (=> d!52418 (arrayRangesEq!435 (_2!7516 lt!246691) (_2!7516 lt!246693) #b00000000000000000000000000000000 to!236)))

(declare-fun lt!246694 () Unit!10263)

(declare-fun lt!246692 () BitStream!5748)

(declare-fun choose!35 (BitStream!5748 array!7235 (_ BitVec 32) (_ BitVec 32) tuple2!14138 array!7235 BitStream!5748 tuple2!14138 array!7235) Unit!10263)

(assert (=> d!52418 (= lt!246694 (choose!35 lt!246463 lt!246462 (bvadd #b00000000000000000000000000000001 from!240) to!236 lt!246691 (_2!7516 lt!246691) lt!246692 lt!246693 (_2!7516 lt!246693)))))

(assert (=> d!52418 (= lt!246693 (readByteArrayLoopPure!0 lt!246692 (array!7236 (store (arr!4150 lt!246462) (bvadd #b00000000000000000000000000000001 from!240) (_2!7517 (readBytePure!0 lt!246463))) (size!3273 lt!246462)) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> d!52418 (= lt!246692 (withMovedByteIndex!0 lt!246463 #b00000000000000000000000000000001))))

(assert (=> d!52418 (= lt!246691 (readByteArrayLoopPure!0 lt!246463 lt!246462 (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52418 (= (readByteArrayLoopArrayPrefixLemma!0 lt!246463 lt!246462 (bvadd #b00000000000000000000000000000001 from!240) to!236) lt!246694)))

(declare-fun bs!12879 () Bool)

(assert (= bs!12879 d!52418))

(declare-fun m!245641 () Bool)

(assert (=> bs!12879 m!245641))

(declare-fun m!245643 () Bool)

(assert (=> bs!12879 m!245643))

(assert (=> bs!12879 m!245467))

(declare-fun m!245645 () Bool)

(assert (=> bs!12879 m!245645))

(assert (=> bs!12879 m!245447))

(declare-fun m!245647 () Bool)

(assert (=> bs!12879 m!245647))

(assert (=> bs!12879 m!245451))

(assert (=> b!157134 d!52418))

(declare-fun d!52426 () Bool)

(declare-datatypes ((tuple2!14156 0))(
  ( (tuple2!14157 (_1!7528 Unit!10263) (_2!7528 BitStream!5748)) )
))
(declare-fun moveByteIndex!0 (BitStream!5748 (_ BitVec 32)) tuple2!14156)

(assert (=> d!52426 (= (withMovedByteIndex!0 lt!246463 #b00000000000000000000000000000001) (_2!7528 (moveByteIndex!0 lt!246463 #b00000000000000000000000000000001)))))

(declare-fun bs!12880 () Bool)

(assert (= bs!12880 d!52426))

(declare-fun m!245649 () Bool)

(assert (=> bs!12880 m!245649))

(assert (=> b!157134 d!52426))

(declare-fun d!52428 () Bool)

(declare-fun lt!246695 () tuple2!14154)

(assert (=> d!52428 (= lt!246695 (readByte!0 bs!65))))

(assert (=> d!52428 (= (readBytePure!0 bs!65) (tuple2!14141 (_2!7526 lt!246695) (_1!7526 lt!246695)))))

(declare-fun bs!12881 () Bool)

(assert (= bs!12881 d!52428))

(declare-fun m!245651 () Bool)

(assert (=> bs!12881 m!245651))

(assert (=> b!157134 d!52428))

(declare-fun d!52430 () Bool)

(declare-fun res!131378 () Bool)

(declare-fun e!106408 () Bool)

(assert (=> d!52430 (=> res!131378 e!106408)))

(assert (=> d!52430 (= res!131378 (= #b00000000000000000000000000000000 to!236))))

(assert (=> d!52430 (= (arrayRangesEq!435 (_2!7516 lt!246466) (_2!7516 lt!246460) #b00000000000000000000000000000000 to!236) e!106408)))

(declare-fun b!157197 () Bool)

(declare-fun e!106409 () Bool)

(assert (=> b!157197 (= e!106408 e!106409)))

(declare-fun res!131379 () Bool)

(assert (=> b!157197 (=> (not res!131379) (not e!106409))))

(assert (=> b!157197 (= res!131379 (= (select (arr!4150 (_2!7516 lt!246466)) #b00000000000000000000000000000000) (select (arr!4150 (_2!7516 lt!246460)) #b00000000000000000000000000000000)))))

(declare-fun b!157198 () Bool)

(assert (=> b!157198 (= e!106409 (arrayRangesEq!435 (_2!7516 lt!246466) (_2!7516 lt!246460) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236))))

(assert (= (and d!52430 (not res!131378)) b!157197))

(assert (= (and b!157197 res!131379) b!157198))

(declare-fun m!245653 () Bool)

(assert (=> b!157197 m!245653))

(declare-fun m!245655 () Bool)

(assert (=> b!157197 m!245655))

(declare-fun m!245657 () Bool)

(assert (=> b!157198 m!245657))

(assert (=> b!157134 d!52430))

(declare-fun d!52432 () Bool)

(assert (=> d!52432 (= (array_inv!3034 (buf!3748 bs!65)) (bvsge (size!3273 (buf!3748 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!157133 d!52432))

(declare-fun d!52434 () Bool)

(declare-fun lt!246696 () tuple3!664)

(assert (=> d!52434 (= lt!246696 (readByteArrayLoop!0 lt!246463 lt!246462 (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52434 (= (readByteArrayLoopPure!0 lt!246463 lt!246462 (bvadd #b00000000000000000000000000000001 from!240) to!236) (tuple2!14139 (_2!7527 lt!246696) (_3!449 lt!246696)))))

(declare-fun bs!12882 () Bool)

(assert (= bs!12882 d!52434))

(declare-fun m!245659 () Bool)

(assert (=> bs!12882 m!245659))

(assert (=> b!157138 d!52434))

(assert (=> b!157138 d!52428))

(declare-fun d!52436 () Bool)

(assert (=> d!52436 (= (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7528 (moveByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun bs!12883 () Bool)

(assert (= bs!12883 d!52436))

(declare-fun m!245661 () Bool)

(assert (=> bs!12883 m!245661))

(assert (=> b!157138 d!52436))

(declare-fun d!52438 () Bool)

(declare-fun lt!246697 () tuple3!664)

(assert (=> d!52438 (= lt!246697 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!52438 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!14139 (_2!7527 lt!246697) (_3!449 lt!246697)))))

(declare-fun bs!12884 () Bool)

(assert (= bs!12884 d!52438))

(declare-fun m!245663 () Bool)

(assert (=> bs!12884 m!245663))

(assert (=> b!157138 d!52438))

(declare-fun d!52440 () Bool)

(assert (=> d!52440 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3273 (buf!3748 lt!246463))) lt!246465 lt!246464 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) (bvsle ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3273 (buf!3748 lt!246463))) lt!246465 lt!246464) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12885 () Bool)

(assert (= bs!12885 d!52440))

(assert (=> bs!12885 m!245583))

(assert (=> b!157137 d!52440))

(check-sat (not d!52407) (not d!52414) (not d!52416) (not d!52440) (not b!157198) (not d!52405) (not d!52410) (not d!52403) (not d!52428) (not d!52434) (not d!52418) (not d!52426) (not d!52436) (not b!157181) (not d!52438))
(check-sat)
(get-model)

(declare-fun d!52498 () Bool)

(declare-fun res!131434 () Bool)

(declare-fun e!106463 () Bool)

(assert (=> d!52498 (=> res!131434 e!106463)))

(assert (=> d!52498 (= res!131434 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236))))

(assert (=> d!52498 (= (arrayRangesEq!435 (_2!7516 lt!246466) (_2!7516 lt!246460) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236) e!106463)))

(declare-fun b!157266 () Bool)

(declare-fun e!106464 () Bool)

(assert (=> b!157266 (= e!106463 e!106464)))

(declare-fun res!131435 () Bool)

(assert (=> b!157266 (=> (not res!131435) (not e!106464))))

(assert (=> b!157266 (= res!131435 (= (select (arr!4150 (_2!7516 lt!246466)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4150 (_2!7516 lt!246460)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!157267 () Bool)

(assert (=> b!157267 (= e!106464 (arrayRangesEq!435 (_2!7516 lt!246466) (_2!7516 lt!246460) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!236))))

(assert (= (and d!52498 (not res!131434)) b!157266))

(assert (= (and b!157266 res!131435) b!157267))

(declare-fun m!245951 () Bool)

(assert (=> b!157266 m!245951))

(declare-fun m!245953 () Bool)

(assert (=> b!157266 m!245953))

(declare-fun m!245955 () Bool)

(assert (=> b!157267 m!245955))

(assert (=> b!157198 d!52498))

(declare-fun d!52500 () Bool)

(declare-fun e!106471 () Bool)

(assert (=> d!52500 e!106471))

(declare-fun res!131443 () Bool)

(assert (=> d!52500 (=> res!131443 e!106471)))

(assert (=> d!52500 (= res!131443 (bvsge from!240 to!236))))

(declare-fun lt!247084 () Bool)

(declare-fun e!106472 () Bool)

(assert (=> d!52500 (= lt!247084 e!106472)))

(declare-fun res!131442 () Bool)

(assert (=> d!52500 (=> (not res!131442) (not e!106472))))

(declare-fun lt!247095 () tuple3!664)

(declare-fun lt!247100 () (_ BitVec 64))

(declare-fun lt!247109 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!52500 (= res!131442 (= (bvadd lt!247109 lt!247100) (bitIndex!0 (size!3273 (buf!3748 (_2!7527 lt!247095))) (currentByte!6884 (_2!7527 lt!247095)) (currentBit!6879 (_2!7527 lt!247095)))))))

(assert (=> d!52500 (or (not (= (bvand lt!247109 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!247100 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!247109 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!247109 lt!247100) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!247080 () (_ BitVec 64))

(assert (=> d!52500 (= lt!247100 (bvmul lt!247080 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!52500 (or (= lt!247080 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!247080 #b0000000000000000000000000000000000000000000000000000000000001000) lt!247080)))))

(assert (=> d!52500 (= lt!247080 ((_ sign_extend 32) (bvsub to!236 from!240)))))

(assert (=> d!52500 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand from!240 #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000)))))

(assert (=> d!52500 (= lt!247109 (bitIndex!0 (size!3273 (buf!3748 bs!65)) (currentByte!6884 bs!65) (currentBit!6879 bs!65)))))

(declare-fun e!106473 () tuple3!664)

(assert (=> d!52500 (= lt!247095 e!106473)))

(declare-fun c!8368 () Bool)

(assert (=> d!52500 (= c!8368 (bvslt from!240 to!236))))

(assert (=> d!52500 (and (bvsle #b00000000000000000000000000000000 from!240) (bvsle from!240 to!236) (bvsle to!236 (size!3273 arr!153)))))

(assert (=> d!52500 (= (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236) lt!247095)))

(declare-fun bm!2535 () Bool)

(declare-fun call!2538 () (_ BitVec 64))

(assert (=> bm!2535 (= call!2538 (bitIndex!0 (size!3273 (buf!3748 bs!65)) (currentByte!6884 bs!65) (currentBit!6879 bs!65)))))

(declare-fun b!157278 () Bool)

(assert (=> b!157278 (= e!106472 (arrayRangesEq!435 arr!153 (_3!449 lt!247095) #b00000000000000000000000000000000 from!240))))

(declare-fun b!157279 () Bool)

(assert (=> b!157279 (= e!106471 (= (select (arr!4150 (_3!449 lt!247095)) from!240) (_2!7517 (readBytePure!0 bs!65))))))

(assert (=> b!157279 (and (bvsge from!240 #b00000000000000000000000000000000) (bvslt from!240 (size!3273 (_3!449 lt!247095))))))

(declare-fun b!157280 () Bool)

(declare-fun res!131444 () Bool)

(assert (=> b!157280 (=> (not res!131444) (not e!106472))))

(assert (=> b!157280 (= res!131444 (and (= (buf!3748 bs!65) (buf!3748 (_2!7527 lt!247095))) (= (size!3273 arr!153) (size!3273 (_3!449 lt!247095)))))))

(declare-fun call!2539 () Bool)

(declare-fun lt!247087 () tuple2!14154)

(declare-fun bm!2536 () Bool)

(declare-fun lt!247096 () array!7235)

(declare-fun lt!247112 () (_ BitVec 32))

(declare-fun lt!247089 () (_ BitVec 32))

(declare-fun lt!247108 () array!7235)

(assert (=> bm!2536 (= call!2539 (arrayRangesEq!435 (ite c!8368 arr!153 lt!247096) (ite c!8368 (array!7236 (store (arr!4150 arr!153) from!240 (_1!7526 lt!247087)) (size!3273 arr!153)) lt!247108) (ite c!8368 #b00000000000000000000000000000000 lt!247089) (ite c!8368 from!240 lt!247112)))))

(declare-fun bm!2537 () Bool)

(declare-fun lt!247104 () tuple3!664)

(declare-fun call!2540 () Bool)

(declare-fun lt!247081 () (_ BitVec 32))

(assert (=> bm!2537 (= call!2540 (arrayRangesEq!435 arr!153 (ite c!8368 (_3!449 lt!247104) arr!153) (ite c!8368 lt!247081 #b00000000000000000000000000000000) (ite c!8368 from!240 (size!3273 arr!153))))))

(declare-fun b!157281 () Bool)

(declare-fun lt!247085 () Unit!10263)

(assert (=> b!157281 (= e!106473 (tuple3!665 lt!247085 (_2!7527 lt!247104) (_3!449 lt!247104)))))

(assert (=> b!157281 (= lt!247087 (readByte!0 bs!65))))

(declare-fun lt!247103 () array!7235)

(assert (=> b!157281 (= lt!247103 (array!7236 (store (arr!4150 arr!153) from!240 (_1!7526 lt!247087)) (size!3273 arr!153)))))

(declare-fun lt!247111 () (_ BitVec 64))

(assert (=> b!157281 (= lt!247111 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!247113 () (_ BitVec 32))

(assert (=> b!157281 (= lt!247113 (bvsub to!236 from!240))))

(declare-fun lt!247115 () Unit!10263)

(assert (=> b!157281 (= lt!247115 (validateOffsetBytesFromBitIndexLemma!0 bs!65 (_2!7526 lt!247087) lt!247111 lt!247113))))

(assert (=> b!157281 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3273 (buf!3748 (_2!7526 lt!247087)))) ((_ sign_extend 32) (currentByte!6884 (_2!7526 lt!247087))) ((_ sign_extend 32) (currentBit!6879 (_2!7526 lt!247087))) (bvsub lt!247113 ((_ extract 31 0) (bvsdiv (bvadd lt!247111 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!247107 () Unit!10263)

(assert (=> b!157281 (= lt!247107 lt!247115)))

(assert (=> b!157281 (= lt!247104 (readByteArrayLoop!0 (_2!7526 lt!247087) lt!247103 (bvadd from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!157281 (= (bitIndex!0 (size!3273 (buf!3748 (_2!7526 lt!247087))) (currentByte!6884 (_2!7526 lt!247087)) (currentBit!6879 (_2!7526 lt!247087))) (bvadd call!2538 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!247114 () Unit!10263)

(declare-fun Unit!10329 () Unit!10263)

(assert (=> b!157281 (= lt!247114 Unit!10329)))

(assert (=> b!157281 (= (bvadd (bitIndex!0 (size!3273 (buf!3748 (_2!7526 lt!247087))) (currentByte!6884 (_2!7526 lt!247087)) (currentBit!6879 (_2!7526 lt!247087))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3273 (buf!3748 (_2!7527 lt!247104))) (currentByte!6884 (_2!7527 lt!247104)) (currentBit!6879 (_2!7527 lt!247104))))))

(declare-fun lt!247090 () Unit!10263)

(declare-fun Unit!10330 () Unit!10263)

(assert (=> b!157281 (= lt!247090 Unit!10330)))

(assert (=> b!157281 (= (bvadd call!2538 (bvmul ((_ sign_extend 32) (bvsub to!236 from!240)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3273 (buf!3748 (_2!7527 lt!247104))) (currentByte!6884 (_2!7527 lt!247104)) (currentBit!6879 (_2!7527 lt!247104))))))

(declare-fun lt!247091 () Unit!10263)

(declare-fun Unit!10331 () Unit!10263)

(assert (=> b!157281 (= lt!247091 Unit!10331)))

(assert (=> b!157281 (and (= (buf!3748 bs!65) (buf!3748 (_2!7527 lt!247104))) (= (size!3273 arr!153) (size!3273 (_3!449 lt!247104))))))

(declare-fun lt!247099 () Unit!10263)

(declare-fun Unit!10332 () Unit!10263)

(assert (=> b!157281 (= lt!247099 Unit!10332)))

(declare-fun lt!247083 () Unit!10263)

(declare-fun arrayUpdatedAtPrefixLemma!44 (array!7235 (_ BitVec 32) (_ BitVec 8)) Unit!10263)

(assert (=> b!157281 (= lt!247083 (arrayUpdatedAtPrefixLemma!44 arr!153 from!240 (_1!7526 lt!247087)))))

(assert (=> b!157281 call!2539))

(declare-fun lt!247101 () Unit!10263)

(assert (=> b!157281 (= lt!247101 lt!247083)))

(assert (=> b!157281 (= lt!247081 #b00000000000000000000000000000000)))

(declare-fun lt!247102 () Unit!10263)

(declare-fun arrayRangesEqTransitive!109 (array!7235 array!7235 array!7235 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10263)

(assert (=> b!157281 (= lt!247102 (arrayRangesEqTransitive!109 arr!153 lt!247103 (_3!449 lt!247104) lt!247081 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157281 call!2540))

(declare-fun lt!247105 () Unit!10263)

(assert (=> b!157281 (= lt!247105 lt!247102)))

(assert (=> b!157281 (arrayRangesEq!435 arr!153 (_3!449 lt!247104) #b00000000000000000000000000000000 from!240)))

(declare-fun lt!247097 () Unit!10263)

(declare-fun Unit!10333 () Unit!10263)

(assert (=> b!157281 (= lt!247097 Unit!10333)))

(declare-fun lt!247093 () Unit!10263)

(declare-fun arrayRangesEqImpliesEq!53 (array!7235 array!7235 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10263)

(assert (=> b!157281 (= lt!247093 (arrayRangesEqImpliesEq!53 lt!247103 (_3!449 lt!247104) #b00000000000000000000000000000000 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157281 (= (select (store (arr!4150 arr!153) from!240 (_1!7526 lt!247087)) from!240) (select (arr!4150 (_3!449 lt!247104)) from!240))))

(declare-fun lt!247098 () Unit!10263)

(assert (=> b!157281 (= lt!247098 lt!247093)))

(declare-fun lt!247088 () Bool)

(assert (=> b!157281 (= lt!247088 (= (select (arr!4150 (_3!449 lt!247104)) from!240) (_1!7526 lt!247087)))))

(declare-fun Unit!10334 () Unit!10263)

(assert (=> b!157281 (= lt!247085 Unit!10334)))

(assert (=> b!157281 lt!247088))

(declare-fun b!157282 () Bool)

(declare-fun lt!247092 () Unit!10263)

(assert (=> b!157282 (= e!106473 (tuple3!665 lt!247092 bs!65 arr!153))))

(assert (=> b!157282 (= call!2538 call!2538)))

(declare-fun lt!247110 () Unit!10263)

(declare-fun Unit!10335 () Unit!10263)

(assert (=> b!157282 (= lt!247110 Unit!10335)))

(declare-fun lt!247106 () Unit!10263)

(declare-fun arrayRangesEqReflexiveLemma!44 (array!7235) Unit!10263)

(assert (=> b!157282 (= lt!247106 (arrayRangesEqReflexiveLemma!44 arr!153))))

(assert (=> b!157282 call!2540))

(declare-fun lt!247086 () Unit!10263)

(assert (=> b!157282 (= lt!247086 lt!247106)))

(assert (=> b!157282 (= lt!247096 arr!153)))

(assert (=> b!157282 (= lt!247108 arr!153)))

(declare-fun lt!247094 () (_ BitVec 32))

(assert (=> b!157282 (= lt!247094 #b00000000000000000000000000000000)))

(declare-fun lt!247082 () (_ BitVec 32))

(assert (=> b!157282 (= lt!247082 (size!3273 arr!153))))

(assert (=> b!157282 (= lt!247089 #b00000000000000000000000000000000)))

(assert (=> b!157282 (= lt!247112 from!240)))

(declare-fun arrayRangesEqSlicedLemma!44 (array!7235 array!7235 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10263)

(assert (=> b!157282 (= lt!247092 (arrayRangesEqSlicedLemma!44 lt!247096 lt!247108 lt!247094 lt!247082 lt!247089 lt!247112))))

(assert (=> b!157282 call!2539))

(assert (= (and d!52500 c!8368) b!157281))

(assert (= (and d!52500 (not c!8368)) b!157282))

(assert (= (or b!157281 b!157282) bm!2536))

(assert (= (or b!157281 b!157282) bm!2537))

(assert (= (or b!157281 b!157282) bm!2535))

(assert (= (and d!52500 res!131442) b!157280))

(assert (= (and b!157280 res!131444) b!157278))

(assert (= (and d!52500 (not res!131443)) b!157279))

(declare-fun m!245957 () Bool)

(assert (=> b!157282 m!245957))

(declare-fun m!245959 () Bool)

(assert (=> b!157282 m!245959))

(declare-fun m!245961 () Bool)

(assert (=> bm!2536 m!245961))

(declare-fun m!245963 () Bool)

(assert (=> bm!2536 m!245963))

(declare-fun m!245965 () Bool)

(assert (=> bm!2535 m!245965))

(declare-fun m!245967 () Bool)

(assert (=> bm!2537 m!245967))

(declare-fun m!245969 () Bool)

(assert (=> b!157279 m!245969))

(assert (=> b!157279 m!245441))

(declare-fun m!245971 () Bool)

(assert (=> b!157278 m!245971))

(declare-fun m!245973 () Bool)

(assert (=> d!52500 m!245973))

(assert (=> d!52500 m!245965))

(declare-fun m!245975 () Bool)

(assert (=> b!157281 m!245975))

(declare-fun m!245977 () Bool)

(assert (=> b!157281 m!245977))

(declare-fun m!245979 () Bool)

(assert (=> b!157281 m!245979))

(declare-fun m!245981 () Bool)

(assert (=> b!157281 m!245981))

(assert (=> b!157281 m!245961))

(declare-fun m!245983 () Bool)

(assert (=> b!157281 m!245983))

(declare-fun m!245985 () Bool)

(assert (=> b!157281 m!245985))

(declare-fun m!245987 () Bool)

(assert (=> b!157281 m!245987))

(assert (=> b!157281 m!245651))

(declare-fun m!245989 () Bool)

(assert (=> b!157281 m!245989))

(declare-fun m!245991 () Bool)

(assert (=> b!157281 m!245991))

(declare-fun m!245993 () Bool)

(assert (=> b!157281 m!245993))

(declare-fun m!245995 () Bool)

(assert (=> b!157281 m!245995))

(assert (=> d!52438 d!52500))

(declare-fun d!52502 () Bool)

(assert (=> d!52502 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3273 (buf!3748 lt!246463))) ((_ sign_extend 32) (currentByte!6884 lt!246463)) ((_ sign_extend 32) (currentBit!6879 lt!246463)) (bvsub (bvsub to!236 from!240) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!52502 true))

(declare-fun _$7!112 () Unit!10263)

(assert (=> d!52502 (= (choose!57 bs!65 lt!246463 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)) _$7!112)))

(declare-fun bs!12895 () Bool)

(assert (= bs!12895 d!52502))

(declare-fun m!245997 () Bool)

(assert (=> bs!12895 m!245997))

(assert (=> d!52407 d!52502))

(declare-fun d!52504 () Bool)

(declare-fun e!106474 () Bool)

(assert (=> d!52504 e!106474))

(declare-fun res!131446 () Bool)

(assert (=> d!52504 (=> res!131446 e!106474)))

(assert (=> d!52504 (= res!131446 (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!247120 () Bool)

(declare-fun e!106475 () Bool)

(assert (=> d!52504 (= lt!247120 e!106475)))

(declare-fun res!131445 () Bool)

(assert (=> d!52504 (=> (not res!131445) (not e!106475))))

(declare-fun lt!247145 () (_ BitVec 64))

(declare-fun lt!247131 () tuple3!664)

(declare-fun lt!247136 () (_ BitVec 64))

(assert (=> d!52504 (= res!131445 (= (bvadd lt!247145 lt!247136) (bitIndex!0 (size!3273 (buf!3748 (_2!7527 lt!247131))) (currentByte!6884 (_2!7527 lt!247131)) (currentBit!6879 (_2!7527 lt!247131)))))))

(assert (=> d!52504 (or (not (= (bvand lt!247145 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!247136 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!247145 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!247145 lt!247136) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!247116 () (_ BitVec 64))

(assert (=> d!52504 (= lt!247136 (bvmul lt!247116 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!52504 (or (= lt!247116 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!247116 #b0000000000000000000000000000000000000000000000000000000000001000) lt!247116)))))

(assert (=> d!52504 (= lt!247116 ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))))))

(assert (=> d!52504 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!240) #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b10000000000000000000000000000000)))))

(assert (=> d!52504 (= lt!247145 (bitIndex!0 (size!3273 (buf!3748 lt!246463)) (currentByte!6884 lt!246463) (currentBit!6879 lt!246463)))))

(declare-fun e!106476 () tuple3!664)

(assert (=> d!52504 (= lt!247131 e!106476)))

(declare-fun c!8369 () Bool)

(assert (=> d!52504 (= c!8369 (bvslt (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52504 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsle (bvadd #b00000000000000000000000000000001 from!240) to!236) (bvsle to!236 (size!3273 lt!246462)))))

(assert (=> d!52504 (= (readByteArrayLoop!0 lt!246463 lt!246462 (bvadd #b00000000000000000000000000000001 from!240) to!236) lt!247131)))

(declare-fun bm!2538 () Bool)

(declare-fun call!2541 () (_ BitVec 64))

(assert (=> bm!2538 (= call!2541 (bitIndex!0 (size!3273 (buf!3748 lt!246463)) (currentByte!6884 lt!246463) (currentBit!6879 lt!246463)))))

(declare-fun b!157283 () Bool)

(assert (=> b!157283 (= e!106475 (arrayRangesEq!435 lt!246462 (_3!449 lt!247131) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun b!157284 () Bool)

(assert (=> b!157284 (= e!106474 (= (select (arr!4150 (_3!449 lt!247131)) (bvadd #b00000000000000000000000000000001 from!240)) (_2!7517 (readBytePure!0 lt!246463))))))

(assert (=> b!157284 (and (bvsge (bvadd #b00000000000000000000000000000001 from!240) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!240) (size!3273 (_3!449 lt!247131))))))

(declare-fun b!157285 () Bool)

(declare-fun res!131447 () Bool)

(assert (=> b!157285 (=> (not res!131447) (not e!106475))))

(assert (=> b!157285 (= res!131447 (and (= (buf!3748 lt!246463) (buf!3748 (_2!7527 lt!247131))) (= (size!3273 lt!246462) (size!3273 (_3!449 lt!247131)))))))

(declare-fun lt!247144 () array!7235)

(declare-fun lt!247125 () (_ BitVec 32))

(declare-fun lt!247148 () (_ BitVec 32))

(declare-fun lt!247123 () tuple2!14154)

(declare-fun call!2542 () Bool)

(declare-fun lt!247132 () array!7235)

(declare-fun bm!2539 () Bool)

(assert (=> bm!2539 (= call!2542 (arrayRangesEq!435 (ite c!8369 lt!246462 lt!247132) (ite c!8369 (array!7236 (store (arr!4150 lt!246462) (bvadd #b00000000000000000000000000000001 from!240) (_1!7526 lt!247123)) (size!3273 lt!246462)) lt!247144) (ite c!8369 #b00000000000000000000000000000000 lt!247125) (ite c!8369 (bvadd #b00000000000000000000000000000001 from!240) lt!247148)))))

(declare-fun bm!2540 () Bool)

(declare-fun lt!247117 () (_ BitVec 32))

(declare-fun call!2543 () Bool)

(declare-fun lt!247140 () tuple3!664)

(assert (=> bm!2540 (= call!2543 (arrayRangesEq!435 lt!246462 (ite c!8369 (_3!449 lt!247140) lt!246462) (ite c!8369 lt!247117 #b00000000000000000000000000000000) (ite c!8369 (bvadd #b00000000000000000000000000000001 from!240) (size!3273 lt!246462))))))

(declare-fun b!157286 () Bool)

(declare-fun lt!247121 () Unit!10263)

(assert (=> b!157286 (= e!106476 (tuple3!665 lt!247121 (_2!7527 lt!247140) (_3!449 lt!247140)))))

(assert (=> b!157286 (= lt!247123 (readByte!0 lt!246463))))

(declare-fun lt!247139 () array!7235)

(assert (=> b!157286 (= lt!247139 (array!7236 (store (arr!4150 lt!246462) (bvadd #b00000000000000000000000000000001 from!240) (_1!7526 lt!247123)) (size!3273 lt!246462)))))

(declare-fun lt!247147 () (_ BitVec 64))

(assert (=> b!157286 (= lt!247147 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!247149 () (_ BitVec 32))

(assert (=> b!157286 (= lt!247149 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!247151 () Unit!10263)

(assert (=> b!157286 (= lt!247151 (validateOffsetBytesFromBitIndexLemma!0 lt!246463 (_2!7526 lt!247123) lt!247147 lt!247149))))

(assert (=> b!157286 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3273 (buf!3748 (_2!7526 lt!247123)))) ((_ sign_extend 32) (currentByte!6884 (_2!7526 lt!247123))) ((_ sign_extend 32) (currentBit!6879 (_2!7526 lt!247123))) (bvsub lt!247149 ((_ extract 31 0) (bvsdiv (bvadd lt!247147 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!247143 () Unit!10263)

(assert (=> b!157286 (= lt!247143 lt!247151)))

(assert (=> b!157286 (= lt!247140 (readByteArrayLoop!0 (_2!7526 lt!247123) lt!247139 (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!157286 (= (bitIndex!0 (size!3273 (buf!3748 (_2!7526 lt!247123))) (currentByte!6884 (_2!7526 lt!247123)) (currentBit!6879 (_2!7526 lt!247123))) (bvadd call!2541 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!247150 () Unit!10263)

(declare-fun Unit!10336 () Unit!10263)

(assert (=> b!157286 (= lt!247150 Unit!10336)))

(assert (=> b!157286 (= (bvadd (bitIndex!0 (size!3273 (buf!3748 (_2!7526 lt!247123))) (currentByte!6884 (_2!7526 lt!247123)) (currentBit!6879 (_2!7526 lt!247123))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3273 (buf!3748 (_2!7527 lt!247140))) (currentByte!6884 (_2!7527 lt!247140)) (currentBit!6879 (_2!7527 lt!247140))))))

(declare-fun lt!247126 () Unit!10263)

(declare-fun Unit!10337 () Unit!10263)

(assert (=> b!157286 (= lt!247126 Unit!10337)))

(assert (=> b!157286 (= (bvadd call!2541 (bvmul ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3273 (buf!3748 (_2!7527 lt!247140))) (currentByte!6884 (_2!7527 lt!247140)) (currentBit!6879 (_2!7527 lt!247140))))))

(declare-fun lt!247127 () Unit!10263)

(declare-fun Unit!10338 () Unit!10263)

(assert (=> b!157286 (= lt!247127 Unit!10338)))

(assert (=> b!157286 (and (= (buf!3748 lt!246463) (buf!3748 (_2!7527 lt!247140))) (= (size!3273 lt!246462) (size!3273 (_3!449 lt!247140))))))

(declare-fun lt!247135 () Unit!10263)

(declare-fun Unit!10339 () Unit!10263)

(assert (=> b!157286 (= lt!247135 Unit!10339)))

(declare-fun lt!247119 () Unit!10263)

(assert (=> b!157286 (= lt!247119 (arrayUpdatedAtPrefixLemma!44 lt!246462 (bvadd #b00000000000000000000000000000001 from!240) (_1!7526 lt!247123)))))

(assert (=> b!157286 call!2542))

(declare-fun lt!247137 () Unit!10263)

(assert (=> b!157286 (= lt!247137 lt!247119)))

(assert (=> b!157286 (= lt!247117 #b00000000000000000000000000000000)))

(declare-fun lt!247138 () Unit!10263)

(assert (=> b!157286 (= lt!247138 (arrayRangesEqTransitive!109 lt!246462 lt!247139 (_3!449 lt!247140) lt!247117 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157286 call!2543))

(declare-fun lt!247141 () Unit!10263)

(assert (=> b!157286 (= lt!247141 lt!247138)))

(assert (=> b!157286 (arrayRangesEq!435 lt!246462 (_3!449 lt!247140) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240))))

(declare-fun lt!247133 () Unit!10263)

(declare-fun Unit!10340 () Unit!10263)

(assert (=> b!157286 (= lt!247133 Unit!10340)))

(declare-fun lt!247129 () Unit!10263)

(assert (=> b!157286 (= lt!247129 (arrayRangesEqImpliesEq!53 lt!247139 (_3!449 lt!247140) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157286 (= (select (store (arr!4150 lt!246462) (bvadd #b00000000000000000000000000000001 from!240) (_1!7526 lt!247123)) (bvadd #b00000000000000000000000000000001 from!240)) (select (arr!4150 (_3!449 lt!247140)) (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!247134 () Unit!10263)

(assert (=> b!157286 (= lt!247134 lt!247129)))

(declare-fun lt!247124 () Bool)

(assert (=> b!157286 (= lt!247124 (= (select (arr!4150 (_3!449 lt!247140)) (bvadd #b00000000000000000000000000000001 from!240)) (_1!7526 lt!247123)))))

(declare-fun Unit!10341 () Unit!10263)

(assert (=> b!157286 (= lt!247121 Unit!10341)))

(assert (=> b!157286 lt!247124))

(declare-fun lt!247128 () Unit!10263)

(declare-fun b!157287 () Bool)

(assert (=> b!157287 (= e!106476 (tuple3!665 lt!247128 lt!246463 lt!246462))))

(assert (=> b!157287 (= call!2541 call!2541)))

(declare-fun lt!247146 () Unit!10263)

(declare-fun Unit!10342 () Unit!10263)

(assert (=> b!157287 (= lt!247146 Unit!10342)))

(declare-fun lt!247142 () Unit!10263)

(assert (=> b!157287 (= lt!247142 (arrayRangesEqReflexiveLemma!44 lt!246462))))

(assert (=> b!157287 call!2543))

(declare-fun lt!247122 () Unit!10263)

(assert (=> b!157287 (= lt!247122 lt!247142)))

(assert (=> b!157287 (= lt!247132 lt!246462)))

(assert (=> b!157287 (= lt!247144 lt!246462)))

(declare-fun lt!247130 () (_ BitVec 32))

(assert (=> b!157287 (= lt!247130 #b00000000000000000000000000000000)))

(declare-fun lt!247118 () (_ BitVec 32))

(assert (=> b!157287 (= lt!247118 (size!3273 lt!246462))))

(assert (=> b!157287 (= lt!247125 #b00000000000000000000000000000000)))

(assert (=> b!157287 (= lt!247148 (bvadd #b00000000000000000000000000000001 from!240))))

(assert (=> b!157287 (= lt!247128 (arrayRangesEqSlicedLemma!44 lt!247132 lt!247144 lt!247130 lt!247118 lt!247125 lt!247148))))

(assert (=> b!157287 call!2542))

(assert (= (and d!52504 c!8369) b!157286))

(assert (= (and d!52504 (not c!8369)) b!157287))

(assert (= (or b!157286 b!157287) bm!2539))

(assert (= (or b!157286 b!157287) bm!2540))

(assert (= (or b!157286 b!157287) bm!2538))

(assert (= (and d!52504 res!131445) b!157285))

(assert (= (and b!157285 res!131447) b!157283))

(assert (= (and d!52504 (not res!131446)) b!157284))

(declare-fun m!245999 () Bool)

(assert (=> b!157287 m!245999))

(declare-fun m!246001 () Bool)

(assert (=> b!157287 m!246001))

(declare-fun m!246003 () Bool)

(assert (=> bm!2539 m!246003))

(declare-fun m!246005 () Bool)

(assert (=> bm!2539 m!246005))

(declare-fun m!246007 () Bool)

(assert (=> bm!2538 m!246007))

(declare-fun m!246009 () Bool)

(assert (=> bm!2540 m!246009))

(declare-fun m!246011 () Bool)

(assert (=> b!157284 m!246011))

(assert (=> b!157284 m!245467))

(declare-fun m!246013 () Bool)

(assert (=> b!157283 m!246013))

(declare-fun m!246015 () Bool)

(assert (=> d!52504 m!246015))

(assert (=> d!52504 m!246007))

(declare-fun m!246017 () Bool)

(assert (=> b!157286 m!246017))

(declare-fun m!246019 () Bool)

(assert (=> b!157286 m!246019))

(declare-fun m!246021 () Bool)

(assert (=> b!157286 m!246021))

(declare-fun m!246023 () Bool)

(assert (=> b!157286 m!246023))

(assert (=> b!157286 m!246003))

(declare-fun m!246025 () Bool)

(assert (=> b!157286 m!246025))

(declare-fun m!246027 () Bool)

(assert (=> b!157286 m!246027))

(declare-fun m!246029 () Bool)

(assert (=> b!157286 m!246029))

(assert (=> b!157286 m!245589))

(declare-fun m!246031 () Bool)

(assert (=> b!157286 m!246031))

(declare-fun m!246033 () Bool)

(assert (=> b!157286 m!246033))

(declare-fun m!246035 () Bool)

(assert (=> b!157286 m!246035))

(declare-fun m!246037 () Bool)

(assert (=> b!157286 m!246037))

(assert (=> d!52434 d!52504))

(declare-fun d!52506 () Bool)

(declare-fun lt!247166 () (_ BitVec 8))

(declare-fun lt!247171 () (_ BitVec 8))

(assert (=> d!52506 (= lt!247166 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4150 (buf!3748 lt!246463)) (currentByte!6884 lt!246463))) ((_ sign_extend 24) lt!247171))))))

(assert (=> d!52506 (= lt!247171 ((_ extract 7 0) (currentBit!6879 lt!246463)))))

(declare-fun e!106482 () Bool)

(assert (=> d!52506 e!106482))

(declare-fun res!131454 () Bool)

(assert (=> d!52506 (=> (not res!131454) (not e!106482))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!52506 (= res!131454 (validate_offset_bits!1 ((_ sign_extend 32) (size!3273 (buf!3748 lt!246463))) ((_ sign_extend 32) (currentByte!6884 lt!246463)) ((_ sign_extend 32) (currentBit!6879 lt!246463)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!14162 0))(
  ( (tuple2!14163 (_1!7531 Unit!10263) (_2!7531 (_ BitVec 8))) )
))
(declare-fun Unit!10343 () Unit!10263)

(declare-fun Unit!10344 () Unit!10263)

(assert (=> d!52506 (= (readByte!0 lt!246463) (tuple2!14155 (_2!7531 (ite (bvsgt ((_ sign_extend 24) lt!247171) #b00000000000000000000000000000000) (tuple2!14163 Unit!10343 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!247166) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4150 (buf!3748 lt!246463)) (bvadd (currentByte!6884 lt!246463) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!247171)))))))) (tuple2!14163 Unit!10344 lt!247166))) (BitStream!5749 (buf!3748 lt!246463) (bvadd (currentByte!6884 lt!246463) #b00000000000000000000000000000001) (currentBit!6879 lt!246463))))))

(declare-fun b!157292 () Bool)

(declare-fun e!106481 () Bool)

(assert (=> b!157292 (= e!106482 e!106481)))

(declare-fun res!131453 () Bool)

(assert (=> b!157292 (=> (not res!131453) (not e!106481))))

(declare-fun lt!247168 () tuple2!14154)

(assert (=> b!157292 (= res!131453 (= (buf!3748 (_2!7526 lt!247168)) (buf!3748 lt!246463)))))

(declare-fun lt!247170 () (_ BitVec 8))

(declare-fun lt!247169 () (_ BitVec 8))

(declare-fun Unit!10345 () Unit!10263)

(declare-fun Unit!10346 () Unit!10263)

(assert (=> b!157292 (= lt!247168 (tuple2!14155 (_2!7531 (ite (bvsgt ((_ sign_extend 24) lt!247169) #b00000000000000000000000000000000) (tuple2!14163 Unit!10345 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!247170) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4150 (buf!3748 lt!246463)) (bvadd (currentByte!6884 lt!246463) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!247169)))))))) (tuple2!14163 Unit!10346 lt!247170))) (BitStream!5749 (buf!3748 lt!246463) (bvadd (currentByte!6884 lt!246463) #b00000000000000000000000000000001) (currentBit!6879 lt!246463))))))

(assert (=> b!157292 (= lt!247170 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4150 (buf!3748 lt!246463)) (currentByte!6884 lt!246463))) ((_ sign_extend 24) lt!247169))))))

(assert (=> b!157292 (= lt!247169 ((_ extract 7 0) (currentBit!6879 lt!246463)))))

(declare-fun lt!247167 () (_ BitVec 64))

(declare-fun lt!247172 () (_ BitVec 64))

(declare-fun b!157293 () Bool)

(assert (=> b!157293 (= e!106481 (= (bitIndex!0 (size!3273 (buf!3748 (_2!7526 lt!247168))) (currentByte!6884 (_2!7526 lt!247168)) (currentBit!6879 (_2!7526 lt!247168))) (bvadd lt!247167 lt!247172)))))

(assert (=> b!157293 (or (not (= (bvand lt!247167 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!247172 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!247167 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!247167 lt!247172) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!157293 (= lt!247172 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!157293 (= lt!247167 (bitIndex!0 (size!3273 (buf!3748 lt!246463)) (currentByte!6884 lt!246463) (currentBit!6879 lt!246463)))))

(assert (= (and d!52506 res!131454) b!157292))

(assert (= (and b!157292 res!131453) b!157293))

(declare-fun m!246039 () Bool)

(assert (=> d!52506 m!246039))

(declare-fun m!246041 () Bool)

(assert (=> d!52506 m!246041))

(declare-fun m!246043 () Bool)

(assert (=> d!52506 m!246043))

(assert (=> b!157292 m!246043))

(assert (=> b!157292 m!246039))

(declare-fun m!246045 () Bool)

(assert (=> b!157293 m!246045))

(assert (=> b!157293 m!246007))

(assert (=> d!52410 d!52506))

(declare-fun d!52508 () Bool)

(declare-fun e!106483 () Bool)

(assert (=> d!52508 e!106483))

(declare-fun res!131456 () Bool)

(assert (=> d!52508 (=> res!131456 e!106483)))

(assert (=> d!52508 (= res!131456 (bvsge (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(declare-fun lt!247177 () Bool)

(declare-fun e!106484 () Bool)

(assert (=> d!52508 (= lt!247177 e!106484)))

(declare-fun res!131455 () Bool)

(assert (=> d!52508 (=> (not res!131455) (not e!106484))))

(declare-fun lt!247202 () (_ BitVec 64))

(declare-fun lt!247188 () tuple3!664)

(declare-fun lt!247193 () (_ BitVec 64))

(assert (=> d!52508 (= res!131455 (= (bvadd lt!247202 lt!247193) (bitIndex!0 (size!3273 (buf!3748 (_2!7527 lt!247188))) (currentByte!6884 (_2!7527 lt!247188)) (currentBit!6879 (_2!7527 lt!247188)))))))

(assert (=> d!52508 (or (not (= (bvand lt!247202 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!247193 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!247202 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!247202 lt!247193) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!247173 () (_ BitVec 64))

(assert (=> d!52508 (= lt!247193 (bvmul lt!247173 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!52508 (or (= lt!247173 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!247173 #b0000000000000000000000000000000000000000000000000000000000001000) lt!247173)))))

(assert (=> d!52508 (= lt!247173 ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240))))))

(assert (=> d!52508 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000010 from!240) #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240)) #b10000000000000000000000000000000)))))

(assert (=> d!52508 (= lt!247202 (bitIndex!0 (size!3273 (buf!3748 (withMovedByteIndex!0 lt!246463 #b00000000000000000000000000000001))) (currentByte!6884 (withMovedByteIndex!0 lt!246463 #b00000000000000000000000000000001)) (currentBit!6879 (withMovedByteIndex!0 lt!246463 #b00000000000000000000000000000001))))))

(declare-fun e!106485 () tuple3!664)

(assert (=> d!52508 (= lt!247188 e!106485)))

(declare-fun c!8370 () Bool)

(assert (=> d!52508 (= c!8370 (bvslt (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(assert (=> d!52508 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000010 from!240)) (bvsle (bvadd #b00000000000000000000000000000010 from!240) to!236) (bvsle to!236 (size!3273 (array!7236 (store (store (arr!4150 arr!153) from!240 (_2!7517 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7517 lt!246457)) (size!3273 arr!153)))))))

(assert (=> d!52508 (= (readByteArrayLoop!0 (withMovedByteIndex!0 lt!246463 #b00000000000000000000000000000001) (array!7236 (store (store (arr!4150 arr!153) from!240 (_2!7517 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7517 lt!246457)) (size!3273 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236) lt!247188)))

(declare-fun bm!2541 () Bool)

(declare-fun call!2544 () (_ BitVec 64))

(assert (=> bm!2541 (= call!2544 (bitIndex!0 (size!3273 (buf!3748 (withMovedByteIndex!0 lt!246463 #b00000000000000000000000000000001))) (currentByte!6884 (withMovedByteIndex!0 lt!246463 #b00000000000000000000000000000001)) (currentBit!6879 (withMovedByteIndex!0 lt!246463 #b00000000000000000000000000000001))))))

(declare-fun b!157294 () Bool)

(assert (=> b!157294 (= e!106484 (arrayRangesEq!435 (array!7236 (store (store (arr!4150 arr!153) from!240 (_2!7517 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7517 lt!246457)) (size!3273 arr!153)) (_3!449 lt!247188) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000010 from!240)))))

(declare-fun b!157295 () Bool)

(assert (=> b!157295 (= e!106483 (= (select (arr!4150 (_3!449 lt!247188)) (bvadd #b00000000000000000000000000000010 from!240)) (_2!7517 (readBytePure!0 (withMovedByteIndex!0 lt!246463 #b00000000000000000000000000000001)))))))

(assert (=> b!157295 (and (bvsge (bvadd #b00000000000000000000000000000010 from!240) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000010 from!240) (size!3273 (_3!449 lt!247188))))))

(declare-fun b!157296 () Bool)

(declare-fun res!131457 () Bool)

(assert (=> b!157296 (=> (not res!131457) (not e!106484))))

(assert (=> b!157296 (= res!131457 (and (= (buf!3748 (withMovedByteIndex!0 lt!246463 #b00000000000000000000000000000001)) (buf!3748 (_2!7527 lt!247188))) (= (size!3273 (array!7236 (store (store (arr!4150 arr!153) from!240 (_2!7517 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7517 lt!246457)) (size!3273 arr!153))) (size!3273 (_3!449 lt!247188)))))))

(declare-fun call!2545 () Bool)

(declare-fun lt!247189 () array!7235)

(declare-fun bm!2542 () Bool)

(declare-fun lt!247182 () (_ BitVec 32))

(declare-fun lt!247201 () array!7235)

(declare-fun lt!247205 () (_ BitVec 32))

(declare-fun lt!247180 () tuple2!14154)

(assert (=> bm!2542 (= call!2545 (arrayRangesEq!435 (ite c!8370 (array!7236 (store (store (arr!4150 arr!153) from!240 (_2!7517 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7517 lt!246457)) (size!3273 arr!153)) lt!247189) (ite c!8370 (array!7236 (store (arr!4150 (array!7236 (store (store (arr!4150 arr!153) from!240 (_2!7517 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7517 lt!246457)) (size!3273 arr!153))) (bvadd #b00000000000000000000000000000010 from!240) (_1!7526 lt!247180)) (size!3273 (array!7236 (store (store (arr!4150 arr!153) from!240 (_2!7517 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7517 lt!246457)) (size!3273 arr!153)))) lt!247201) (ite c!8370 #b00000000000000000000000000000000 lt!247182) (ite c!8370 (bvadd #b00000000000000000000000000000010 from!240) lt!247205)))))

(declare-fun lt!247174 () (_ BitVec 32))

(declare-fun bm!2543 () Bool)

(declare-fun lt!247197 () tuple3!664)

(declare-fun call!2546 () Bool)

(assert (=> bm!2543 (= call!2546 (arrayRangesEq!435 (array!7236 (store (store (arr!4150 arr!153) from!240 (_2!7517 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7517 lt!246457)) (size!3273 arr!153)) (ite c!8370 (_3!449 lt!247197) (array!7236 (store (store (arr!4150 arr!153) from!240 (_2!7517 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7517 lt!246457)) (size!3273 arr!153))) (ite c!8370 lt!247174 #b00000000000000000000000000000000) (ite c!8370 (bvadd #b00000000000000000000000000000010 from!240) (size!3273 (array!7236 (store (store (arr!4150 arr!153) from!240 (_2!7517 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7517 lt!246457)) (size!3273 arr!153))))))))

(declare-fun b!157297 () Bool)

(declare-fun lt!247178 () Unit!10263)

(assert (=> b!157297 (= e!106485 (tuple3!665 lt!247178 (_2!7527 lt!247197) (_3!449 lt!247197)))))

(assert (=> b!157297 (= lt!247180 (readByte!0 (withMovedByteIndex!0 lt!246463 #b00000000000000000000000000000001)))))

(declare-fun lt!247196 () array!7235)

(assert (=> b!157297 (= lt!247196 (array!7236 (store (arr!4150 (array!7236 (store (store (arr!4150 arr!153) from!240 (_2!7517 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7517 lt!246457)) (size!3273 arr!153))) (bvadd #b00000000000000000000000000000010 from!240) (_1!7526 lt!247180)) (size!3273 (array!7236 (store (store (arr!4150 arr!153) from!240 (_2!7517 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7517 lt!246457)) (size!3273 arr!153)))))))

(declare-fun lt!247204 () (_ BitVec 64))

(assert (=> b!157297 (= lt!247204 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!247206 () (_ BitVec 32))

(assert (=> b!157297 (= lt!247206 (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240)))))

(declare-fun lt!247208 () Unit!10263)

(assert (=> b!157297 (= lt!247208 (validateOffsetBytesFromBitIndexLemma!0 (withMovedByteIndex!0 lt!246463 #b00000000000000000000000000000001) (_2!7526 lt!247180) lt!247204 lt!247206))))

(assert (=> b!157297 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3273 (buf!3748 (_2!7526 lt!247180)))) ((_ sign_extend 32) (currentByte!6884 (_2!7526 lt!247180))) ((_ sign_extend 32) (currentBit!6879 (_2!7526 lt!247180))) (bvsub lt!247206 ((_ extract 31 0) (bvsdiv (bvadd lt!247204 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!247200 () Unit!10263)

(assert (=> b!157297 (= lt!247200 lt!247208)))

(assert (=> b!157297 (= lt!247197 (readByteArrayLoop!0 (_2!7526 lt!247180) lt!247196 (bvadd #b00000000000000000000000000000010 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!157297 (= (bitIndex!0 (size!3273 (buf!3748 (_2!7526 lt!247180))) (currentByte!6884 (_2!7526 lt!247180)) (currentBit!6879 (_2!7526 lt!247180))) (bvadd call!2544 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!247207 () Unit!10263)

(declare-fun Unit!10347 () Unit!10263)

(assert (=> b!157297 (= lt!247207 Unit!10347)))

(assert (=> b!157297 (= (bvadd (bitIndex!0 (size!3273 (buf!3748 (_2!7526 lt!247180))) (currentByte!6884 (_2!7526 lt!247180)) (currentBit!6879 (_2!7526 lt!247180))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3273 (buf!3748 (_2!7527 lt!247197))) (currentByte!6884 (_2!7527 lt!247197)) (currentBit!6879 (_2!7527 lt!247197))))))

(declare-fun lt!247183 () Unit!10263)

(declare-fun Unit!10348 () Unit!10263)

(assert (=> b!157297 (= lt!247183 Unit!10348)))

(assert (=> b!157297 (= (bvadd call!2544 (bvmul ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3273 (buf!3748 (_2!7527 lt!247197))) (currentByte!6884 (_2!7527 lt!247197)) (currentBit!6879 (_2!7527 lt!247197))))))

(declare-fun lt!247184 () Unit!10263)

(declare-fun Unit!10349 () Unit!10263)

(assert (=> b!157297 (= lt!247184 Unit!10349)))

(assert (=> b!157297 (and (= (buf!3748 (withMovedByteIndex!0 lt!246463 #b00000000000000000000000000000001)) (buf!3748 (_2!7527 lt!247197))) (= (size!3273 (array!7236 (store (store (arr!4150 arr!153) from!240 (_2!7517 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7517 lt!246457)) (size!3273 arr!153))) (size!3273 (_3!449 lt!247197))))))

(declare-fun lt!247192 () Unit!10263)

(declare-fun Unit!10350 () Unit!10263)

(assert (=> b!157297 (= lt!247192 Unit!10350)))

(declare-fun lt!247176 () Unit!10263)

(assert (=> b!157297 (= lt!247176 (arrayUpdatedAtPrefixLemma!44 (array!7236 (store (store (arr!4150 arr!153) from!240 (_2!7517 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7517 lt!246457)) (size!3273 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) (_1!7526 lt!247180)))))

(assert (=> b!157297 call!2545))

(declare-fun lt!247194 () Unit!10263)

(assert (=> b!157297 (= lt!247194 lt!247176)))

(assert (=> b!157297 (= lt!247174 #b00000000000000000000000000000000)))

(declare-fun lt!247195 () Unit!10263)

(assert (=> b!157297 (= lt!247195 (arrayRangesEqTransitive!109 (array!7236 (store (store (arr!4150 arr!153) from!240 (_2!7517 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7517 lt!246457)) (size!3273 arr!153)) lt!247196 (_3!449 lt!247197) lt!247174 (bvadd #b00000000000000000000000000000010 from!240) (bvadd #b00000000000000000000000000000010 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157297 call!2546))

(declare-fun lt!247198 () Unit!10263)

(assert (=> b!157297 (= lt!247198 lt!247195)))

(assert (=> b!157297 (arrayRangesEq!435 (array!7236 (store (store (arr!4150 arr!153) from!240 (_2!7517 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7517 lt!246457)) (size!3273 arr!153)) (_3!449 lt!247197) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000010 from!240))))

(declare-fun lt!247190 () Unit!10263)

(declare-fun Unit!10351 () Unit!10263)

(assert (=> b!157297 (= lt!247190 Unit!10351)))

(declare-fun lt!247186 () Unit!10263)

(assert (=> b!157297 (= lt!247186 (arrayRangesEqImpliesEq!53 lt!247196 (_3!449 lt!247197) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000010 from!240) (bvadd #b00000000000000000000000000000010 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157297 (= (select (store (arr!4150 (array!7236 (store (store (arr!4150 arr!153) from!240 (_2!7517 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7517 lt!246457)) (size!3273 arr!153))) (bvadd #b00000000000000000000000000000010 from!240) (_1!7526 lt!247180)) (bvadd #b00000000000000000000000000000010 from!240)) (select (arr!4150 (_3!449 lt!247197)) (bvadd #b00000000000000000000000000000010 from!240)))))

(declare-fun lt!247191 () Unit!10263)

(assert (=> b!157297 (= lt!247191 lt!247186)))

(declare-fun lt!247181 () Bool)

(assert (=> b!157297 (= lt!247181 (= (select (arr!4150 (_3!449 lt!247197)) (bvadd #b00000000000000000000000000000010 from!240)) (_1!7526 lt!247180)))))

(declare-fun Unit!10352 () Unit!10263)

(assert (=> b!157297 (= lt!247178 Unit!10352)))

(assert (=> b!157297 lt!247181))

(declare-fun b!157298 () Bool)

(declare-fun lt!247185 () Unit!10263)

(assert (=> b!157298 (= e!106485 (tuple3!665 lt!247185 (withMovedByteIndex!0 lt!246463 #b00000000000000000000000000000001) (array!7236 (store (store (arr!4150 arr!153) from!240 (_2!7517 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7517 lt!246457)) (size!3273 arr!153))))))

(assert (=> b!157298 (= call!2544 call!2544)))

(declare-fun lt!247203 () Unit!10263)

(declare-fun Unit!10353 () Unit!10263)

(assert (=> b!157298 (= lt!247203 Unit!10353)))

(declare-fun lt!247199 () Unit!10263)

(assert (=> b!157298 (= lt!247199 (arrayRangesEqReflexiveLemma!44 (array!7236 (store (store (arr!4150 arr!153) from!240 (_2!7517 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7517 lt!246457)) (size!3273 arr!153))))))

(assert (=> b!157298 call!2546))

(declare-fun lt!247179 () Unit!10263)

(assert (=> b!157298 (= lt!247179 lt!247199)))

(assert (=> b!157298 (= lt!247189 (array!7236 (store (store (arr!4150 arr!153) from!240 (_2!7517 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7517 lt!246457)) (size!3273 arr!153)))))

(assert (=> b!157298 (= lt!247201 (array!7236 (store (store (arr!4150 arr!153) from!240 (_2!7517 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7517 lt!246457)) (size!3273 arr!153)))))

(declare-fun lt!247187 () (_ BitVec 32))

(assert (=> b!157298 (= lt!247187 #b00000000000000000000000000000000)))

(declare-fun lt!247175 () (_ BitVec 32))

(assert (=> b!157298 (= lt!247175 (size!3273 (array!7236 (store (store (arr!4150 arr!153) from!240 (_2!7517 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7517 lt!246457)) (size!3273 arr!153))))))

(assert (=> b!157298 (= lt!247182 #b00000000000000000000000000000000)))

(assert (=> b!157298 (= lt!247205 (bvadd #b00000000000000000000000000000010 from!240))))

(assert (=> b!157298 (= lt!247185 (arrayRangesEqSlicedLemma!44 lt!247189 lt!247201 lt!247187 lt!247175 lt!247182 lt!247205))))

(assert (=> b!157298 call!2545))

(assert (= (and d!52508 c!8370) b!157297))

(assert (= (and d!52508 (not c!8370)) b!157298))

(assert (= (or b!157297 b!157298) bm!2542))

(assert (= (or b!157297 b!157298) bm!2543))

(assert (= (or b!157297 b!157298) bm!2541))

(assert (= (and d!52508 res!131455) b!157296))

(assert (= (and b!157296 res!131457) b!157294))

(assert (= (and d!52508 (not res!131456)) b!157295))

(declare-fun m!246047 () Bool)

(assert (=> b!157298 m!246047))

(declare-fun m!246049 () Bool)

(assert (=> b!157298 m!246049))

(declare-fun m!246051 () Bool)

(assert (=> bm!2542 m!246051))

(declare-fun m!246053 () Bool)

(assert (=> bm!2542 m!246053))

(declare-fun m!246055 () Bool)

(assert (=> bm!2541 m!246055))

(declare-fun m!246057 () Bool)

(assert (=> bm!2543 m!246057))

(declare-fun m!246059 () Bool)

(assert (=> b!157295 m!246059))

(assert (=> b!157295 m!245451))

(declare-fun m!246061 () Bool)

(assert (=> b!157295 m!246061))

(declare-fun m!246063 () Bool)

(assert (=> b!157294 m!246063))

(declare-fun m!246065 () Bool)

(assert (=> d!52508 m!246065))

(assert (=> d!52508 m!246055))

(declare-fun m!246067 () Bool)

(assert (=> b!157297 m!246067))

(declare-fun m!246069 () Bool)

(assert (=> b!157297 m!246069))

(declare-fun m!246071 () Bool)

(assert (=> b!157297 m!246071))

(declare-fun m!246073 () Bool)

(assert (=> b!157297 m!246073))

(assert (=> b!157297 m!246051))

(declare-fun m!246075 () Bool)

(assert (=> b!157297 m!246075))

(declare-fun m!246077 () Bool)

(assert (=> b!157297 m!246077))

(declare-fun m!246079 () Bool)

(assert (=> b!157297 m!246079))

(assert (=> b!157297 m!245451))

(declare-fun m!246081 () Bool)

(assert (=> b!157297 m!246081))

(declare-fun m!246083 () Bool)

(assert (=> b!157297 m!246083))

(assert (=> b!157297 m!245451))

(declare-fun m!246085 () Bool)

(assert (=> b!157297 m!246085))

(declare-fun m!246087 () Bool)

(assert (=> b!157297 m!246087))

(declare-fun m!246089 () Bool)

(assert (=> b!157297 m!246089))

(assert (=> d!52416 d!52508))

(declare-fun d!52510 () Bool)

(declare-fun e!106488 () Bool)

(assert (=> d!52510 e!106488))

(declare-fun res!131460 () Bool)

(assert (=> d!52510 (=> (not res!131460) (not e!106488))))

(declare-fun moveByteIndexPrecond!0 (BitStream!5748 (_ BitVec 32)) Bool)

(assert (=> d!52510 (= res!131460 (moveByteIndexPrecond!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun Unit!10354 () Unit!10263)

(assert (=> d!52510 (= (moveByteIndex!0 bs!65 #b00000000000000000000000000000001) (tuple2!14157 Unit!10354 (BitStream!5749 (buf!3748 bs!65) (bvadd (currentByte!6884 bs!65) #b00000000000000000000000000000001) (currentBit!6879 bs!65))))))

(declare-fun b!157301 () Bool)

(assert (=> b!157301 (= e!106488 (and (or (not (= (bvand (currentByte!6884 bs!65) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6884 bs!65) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6884 bs!65) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6884 bs!65) #b00000000000000000000000000000001) (bvadd (currentByte!6884 bs!65) #b00000000000000000000000000000001))))))

(assert (= (and d!52510 res!131460) b!157301))

(declare-fun m!246091 () Bool)

(assert (=> d!52510 m!246091))

(assert (=> d!52436 d!52510))

(declare-fun lt!247209 () tuple3!664)

(declare-fun d!52512 () Bool)

(assert (=> d!52512 (= lt!247209 (readByteArrayLoop!0 lt!246692 (array!7236 (store (arr!4150 lt!246462) (bvadd #b00000000000000000000000000000001 from!240) (_2!7517 (readBytePure!0 lt!246463))) (size!3273 lt!246462)) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> d!52512 (= (readByteArrayLoopPure!0 lt!246692 (array!7236 (store (arr!4150 lt!246462) (bvadd #b00000000000000000000000000000001 from!240) (_2!7517 (readBytePure!0 lt!246463))) (size!3273 lt!246462)) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236) (tuple2!14139 (_2!7527 lt!247209) (_3!449 lt!247209)))))

(declare-fun bs!12896 () Bool)

(assert (= bs!12896 d!52512))

(declare-fun m!246093 () Bool)

(assert (=> bs!12896 m!246093))

(assert (=> d!52418 d!52512))

(assert (=> d!52418 d!52434))

(declare-fun d!52514 () Bool)

(declare-fun res!131461 () Bool)

(declare-fun e!106489 () Bool)

(assert (=> d!52514 (=> res!131461 e!106489)))

(assert (=> d!52514 (= res!131461 (= #b00000000000000000000000000000000 to!236))))

(assert (=> d!52514 (= (arrayRangesEq!435 (_2!7516 lt!246691) (_2!7516 lt!246693) #b00000000000000000000000000000000 to!236) e!106489)))

(declare-fun b!157302 () Bool)

(declare-fun e!106490 () Bool)

(assert (=> b!157302 (= e!106489 e!106490)))

(declare-fun res!131462 () Bool)

(assert (=> b!157302 (=> (not res!131462) (not e!106490))))

(assert (=> b!157302 (= res!131462 (= (select (arr!4150 (_2!7516 lt!246691)) #b00000000000000000000000000000000) (select (arr!4150 (_2!7516 lt!246693)) #b00000000000000000000000000000000)))))

(declare-fun b!157303 () Bool)

(assert (=> b!157303 (= e!106490 (arrayRangesEq!435 (_2!7516 lt!246691) (_2!7516 lt!246693) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236))))

(assert (= (and d!52514 (not res!131461)) b!157302))

(assert (= (and b!157302 res!131462) b!157303))

(declare-fun m!246095 () Bool)

(assert (=> b!157302 m!246095))

(declare-fun m!246097 () Bool)

(assert (=> b!157302 m!246097))

(declare-fun m!246099 () Bool)

(assert (=> b!157303 m!246099))

(assert (=> d!52418 d!52514))

(assert (=> d!52418 d!52426))

(assert (=> d!52418 d!52410))

(declare-fun d!52516 () Bool)

(assert (=> d!52516 (arrayRangesEq!435 (_2!7516 (readByteArrayLoopPure!0 lt!246463 lt!246462 (bvadd #b00000000000000000000000000000001 from!240) to!236)) (_2!7516 (readByteArrayLoopPure!0 (withMovedByteIndex!0 lt!246463 #b00000000000000000000000000000001) (array!7236 (store (arr!4150 lt!246462) (bvadd #b00000000000000000000000000000001 from!240) (_2!7517 (readBytePure!0 lt!246463))) (size!3273 lt!246462)) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236)) #b00000000000000000000000000000000 to!236)))

(assert (=> d!52516 true))

(declare-fun _$13!94 () Unit!10263)

(assert (=> d!52516 (= (choose!35 lt!246463 lt!246462 (bvadd #b00000000000000000000000000000001 from!240) to!236 lt!246691 (_2!7516 lt!246691) lt!246692 lt!246693 (_2!7516 lt!246693)) _$13!94)))

(declare-fun bs!12898 () Bool)

(assert (= bs!12898 d!52516))

(assert (=> bs!12898 m!245467))

(assert (=> bs!12898 m!245451))

(assert (=> bs!12898 m!245447))

(assert (=> bs!12898 m!245647))

(assert (=> bs!12898 m!245451))

(declare-fun m!246101 () Bool)

(assert (=> bs!12898 m!246101))

(declare-fun m!246103 () Bool)

(assert (=> bs!12898 m!246103))

(assert (=> d!52418 d!52516))

(declare-fun d!52518 () Bool)

(assert (=> d!52518 (= (remainingBits!0 ((_ sign_extend 32) (size!3273 (buf!3748 lt!246463))) lt!246465 lt!246464) (bvsub (bvmul ((_ sign_extend 32) (size!3273 (buf!3748 lt!246463))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul lt!246465 #b0000000000000000000000000000000000000000000000000000000000001000) lt!246464)))))

(assert (=> d!52405 d!52518))

(assert (=> d!52440 d!52518))

(declare-fun d!52520 () Bool)

(declare-fun e!106491 () Bool)

(assert (=> d!52520 e!106491))

(declare-fun res!131463 () Bool)

(assert (=> d!52520 (=> (not res!131463) (not e!106491))))

(assert (=> d!52520 (= res!131463 (moveByteIndexPrecond!0 lt!246463 #b00000000000000000000000000000001))))

(declare-fun Unit!10355 () Unit!10263)

(assert (=> d!52520 (= (moveByteIndex!0 lt!246463 #b00000000000000000000000000000001) (tuple2!14157 Unit!10355 (BitStream!5749 (buf!3748 lt!246463) (bvadd (currentByte!6884 lt!246463) #b00000000000000000000000000000001) (currentBit!6879 lt!246463))))))

(declare-fun b!157304 () Bool)

(assert (=> b!157304 (= e!106491 (and (or (not (= (bvand (currentByte!6884 lt!246463) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6884 lt!246463) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6884 lt!246463) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6884 lt!246463) #b00000000000000000000000000000001) (bvadd (currentByte!6884 lt!246463) #b00000000000000000000000000000001))))))

(assert (= (and d!52520 res!131463) b!157304))

(declare-fun m!246105 () Bool)

(assert (=> d!52520 m!246105))

(assert (=> d!52426 d!52520))

(declare-fun d!52522 () Bool)

(declare-fun lt!247210 () (_ BitVec 8))

(declare-fun lt!247215 () (_ BitVec 8))

(assert (=> d!52522 (= lt!247210 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4150 (buf!3748 bs!65)) (currentByte!6884 bs!65))) ((_ sign_extend 24) lt!247215))))))

(assert (=> d!52522 (= lt!247215 ((_ extract 7 0) (currentBit!6879 bs!65)))))

(declare-fun e!106493 () Bool)

(assert (=> d!52522 e!106493))

(declare-fun res!131465 () Bool)

(assert (=> d!52522 (=> (not res!131465) (not e!106493))))

(assert (=> d!52522 (= res!131465 (validate_offset_bits!1 ((_ sign_extend 32) (size!3273 (buf!3748 bs!65))) ((_ sign_extend 32) (currentByte!6884 bs!65)) ((_ sign_extend 32) (currentBit!6879 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!10356 () Unit!10263)

(declare-fun Unit!10357 () Unit!10263)

(assert (=> d!52522 (= (readByte!0 bs!65) (tuple2!14155 (_2!7531 (ite (bvsgt ((_ sign_extend 24) lt!247215) #b00000000000000000000000000000000) (tuple2!14163 Unit!10356 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!247210) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4150 (buf!3748 bs!65)) (bvadd (currentByte!6884 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!247215)))))))) (tuple2!14163 Unit!10357 lt!247210))) (BitStream!5749 (buf!3748 bs!65) (bvadd (currentByte!6884 bs!65) #b00000000000000000000000000000001) (currentBit!6879 bs!65))))))

(declare-fun b!157305 () Bool)

(declare-fun e!106492 () Bool)

(assert (=> b!157305 (= e!106493 e!106492)))

(declare-fun res!131464 () Bool)

(assert (=> b!157305 (=> (not res!131464) (not e!106492))))

(declare-fun lt!247212 () tuple2!14154)

(assert (=> b!157305 (= res!131464 (= (buf!3748 (_2!7526 lt!247212)) (buf!3748 bs!65)))))

(declare-fun lt!247214 () (_ BitVec 8))

(declare-fun lt!247213 () (_ BitVec 8))

(declare-fun Unit!10358 () Unit!10263)

(declare-fun Unit!10359 () Unit!10263)

(assert (=> b!157305 (= lt!247212 (tuple2!14155 (_2!7531 (ite (bvsgt ((_ sign_extend 24) lt!247213) #b00000000000000000000000000000000) (tuple2!14163 Unit!10358 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!247214) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4150 (buf!3748 bs!65)) (bvadd (currentByte!6884 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!247213)))))))) (tuple2!14163 Unit!10359 lt!247214))) (BitStream!5749 (buf!3748 bs!65) (bvadd (currentByte!6884 bs!65) #b00000000000000000000000000000001) (currentBit!6879 bs!65))))))

(assert (=> b!157305 (= lt!247214 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4150 (buf!3748 bs!65)) (currentByte!6884 bs!65))) ((_ sign_extend 24) lt!247213))))))

(assert (=> b!157305 (= lt!247213 ((_ extract 7 0) (currentBit!6879 bs!65)))))

(declare-fun b!157306 () Bool)

(declare-fun lt!247211 () (_ BitVec 64))

(declare-fun lt!247216 () (_ BitVec 64))

(assert (=> b!157306 (= e!106492 (= (bitIndex!0 (size!3273 (buf!3748 (_2!7526 lt!247212))) (currentByte!6884 (_2!7526 lt!247212)) (currentBit!6879 (_2!7526 lt!247212))) (bvadd lt!247211 lt!247216)))))

(assert (=> b!157306 (or (not (= (bvand lt!247211 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!247216 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!247211 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!247211 lt!247216) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!157306 (= lt!247216 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!157306 (= lt!247211 (bitIndex!0 (size!3273 (buf!3748 bs!65)) (currentByte!6884 bs!65) (currentBit!6879 bs!65)))))

(assert (= (and d!52522 res!131465) b!157305))

(assert (= (and b!157305 res!131464) b!157306))

(declare-fun m!246107 () Bool)

(assert (=> d!52522 m!246107))

(declare-fun m!246109 () Bool)

(assert (=> d!52522 m!246109))

(declare-fun m!246111 () Bool)

(assert (=> d!52522 m!246111))

(assert (=> b!157305 m!246111))

(assert (=> b!157305 m!246107))

(declare-fun m!246113 () Bool)

(assert (=> b!157306 m!246113))

(assert (=> b!157306 m!245965))

(assert (=> d!52428 d!52522))

(declare-fun d!52524 () Bool)

(assert (=> d!52524 (= (remainingBits!0 ((_ sign_extend 32) (size!3273 (buf!3748 bs!65))) ((_ sign_extend 32) (currentByte!6884 bs!65)) ((_ sign_extend 32) (currentBit!6879 bs!65))) (bvsub (bvmul ((_ sign_extend 32) (size!3273 (buf!3748 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6884 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6879 bs!65)))))))

(assert (=> d!52403 d!52524))

(declare-fun d!52526 () Bool)

(assert (=> d!52526 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3273 (buf!3748 lt!246463))) ((_ sign_extend 32) (currentByte!6884 lt!246463)) ((_ sign_extend 32) (currentBit!6879 lt!246463)) (bvsub (bvsub to!236 from!240) lt!246630)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) lt!246630)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3273 (buf!3748 lt!246463))) ((_ sign_extend 32) (currentByte!6884 lt!246463)) ((_ sign_extend 32) (currentBit!6879 lt!246463))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12899 () Bool)

(assert (= bs!12899 d!52526))

(declare-fun m!246115 () Bool)

(assert (=> bs!12899 m!246115))

(assert (=> b!157181 d!52526))

(declare-fun d!52528 () Bool)

(assert (=> d!52528 (= (invariant!0 (currentBit!6879 bs!65) (currentByte!6884 bs!65) (size!3273 (buf!3748 bs!65))) (and (bvsge (currentBit!6879 bs!65) #b00000000000000000000000000000000) (bvslt (currentBit!6879 bs!65) #b00000000000000000000000000001000) (bvsge (currentByte!6884 bs!65) #b00000000000000000000000000000000) (or (bvslt (currentByte!6884 bs!65) (size!3273 (buf!3748 bs!65))) (and (= (currentBit!6879 bs!65) #b00000000000000000000000000000000) (= (currentByte!6884 bs!65) (size!3273 (buf!3748 bs!65)))))))))

(assert (=> d!52414 d!52528))

(check-sat (not b!157287) (not bm!2540) (not b!157283) (not b!157281) (not b!157306) (not b!157286) (not d!52500) (not bm!2535) (not bm!2537) (not d!52522) (not bm!2542) (not b!157303) (not b!157297) (not bm!2543) (not b!157295) (not d!52516) (not b!157298) (not bm!2539) (not b!157293) (not d!52512) (not d!52502) (not d!52520) (not d!52504) (not b!157294) (not b!157267) (not bm!2541) (not b!157284) (not d!52508) (not d!52506) (not bm!2536) (not d!52526) (not b!157282) (not b!157279) (not bm!2538) (not d!52510) (not b!157278))
(check-sat)
