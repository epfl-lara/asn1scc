; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31468 () Bool)

(assert start!31468)

(declare-fun b!157800 () Bool)

(declare-fun res!131835 () Bool)

(declare-fun e!107035 () Bool)

(assert (=> b!157800 (=> (not res!131835) (not e!107035))))

(declare-datatypes ((array!7308 0))(
  ( (array!7309 (arr!4208 (Array (_ BitVec 32) (_ BitVec 8))) (size!3307 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5806 0))(
  ( (BitStream!5807 (buf!3777 array!7308) (currentByte!6940 (_ BitVec 32)) (currentBit!6935 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5806)

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157800 (= res!131835 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3307 (buf!3777 bs!65))) ((_ sign_extend 32) (currentByte!6940 bs!65)) ((_ sign_extend 32) (currentBit!6935 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!157801 () Bool)

(declare-fun e!107031 () Bool)

(declare-fun lt!248515 () BitStream!5806)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!157801 (= e!107031 (bvsgt #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3307 (buf!3777 lt!248515)) (currentByte!6940 lt!248515) (currentBit!6935 lt!248515))))))

(declare-fun res!131836 () Bool)

(assert (=> start!31468 (=> (not res!131836) (not e!107035))))

(declare-fun arr!153 () array!7308)

(assert (=> start!31468 (= res!131836 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3307 arr!153))))))

(assert (=> start!31468 e!107035))

(assert (=> start!31468 true))

(declare-fun array_inv!3066 (array!7308) Bool)

(assert (=> start!31468 (array_inv!3066 arr!153)))

(declare-fun e!107034 () Bool)

(declare-fun inv!12 (BitStream!5806) Bool)

(assert (=> start!31468 (and (inv!12 bs!65) e!107034)))

(declare-fun b!157802 () Bool)

(declare-fun e!107033 () Bool)

(assert (=> b!157802 (= e!107033 e!107031)))

(declare-fun res!131834 () Bool)

(assert (=> b!157802 (=> (not res!131834) (not e!107031))))

(assert (=> b!157802 (= res!131834 (= (size!3307 (buf!3777 bs!65)) (size!3307 (buf!3777 lt!248515))))))

(declare-datatypes ((tuple2!14308 0))(
  ( (tuple2!14309 (_1!7610 BitStream!5806) (_2!7610 (_ BitVec 8))) )
))
(declare-fun lt!248517 () tuple2!14308)

(declare-fun readBytePure!0 (BitStream!5806) tuple2!14308)

(assert (=> b!157802 (= lt!248517 (readBytePure!0 lt!248515))))

(declare-fun b!157803 () Bool)

(assert (=> b!157803 (= e!107034 (array_inv!3066 (buf!3777 bs!65)))))

(declare-fun b!157804 () Bool)

(assert (=> b!157804 (= e!107035 e!107033)))

(declare-fun res!131837 () Bool)

(assert (=> b!157804 (=> (not res!131837) (not e!107033))))

(assert (=> b!157804 (= res!131837 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((tuple2!14310 0))(
  ( (tuple2!14311 (_1!7611 BitStream!5806) (_2!7611 array!7308)) )
))
(declare-fun lt!248516 () tuple2!14310)

(declare-fun readByteArrayLoopPure!0 (BitStream!5806 array!7308 (_ BitVec 32) (_ BitVec 32)) tuple2!14310)

(assert (=> b!157804 (= lt!248516 (readByteArrayLoopPure!0 lt!248515 (array!7309 (store (arr!4208 arr!153) from!240 (_2!7610 (readBytePure!0 bs!65))) (size!3307 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5806 (_ BitVec 32)) BitStream!5806)

(assert (=> b!157804 (= lt!248515 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!248518 () tuple2!14310)

(assert (=> b!157804 (= lt!248518 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(assert (= (and start!31468 res!131836) b!157800))

(assert (= (and b!157800 res!131835) b!157804))

(assert (= (and b!157804 res!131837) b!157802))

(assert (= (and b!157802 res!131834) b!157801))

(assert (= start!31468 b!157803))

(declare-fun m!247299 () Bool)

(assert (=> b!157802 m!247299))

(declare-fun m!247301 () Bool)

(assert (=> start!31468 m!247301))

(declare-fun m!247303 () Bool)

(assert (=> start!31468 m!247303))

(declare-fun m!247305 () Bool)

(assert (=> b!157803 m!247305))

(declare-fun m!247307 () Bool)

(assert (=> b!157800 m!247307))

(declare-fun m!247309 () Bool)

(assert (=> b!157804 m!247309))

(declare-fun m!247311 () Bool)

(assert (=> b!157804 m!247311))

(declare-fun m!247313 () Bool)

(assert (=> b!157804 m!247313))

(declare-fun m!247315 () Bool)

(assert (=> b!157804 m!247315))

(declare-fun m!247317 () Bool)

(assert (=> b!157804 m!247317))

(declare-fun m!247319 () Bool)

(assert (=> b!157801 m!247319))

(push 1)

(assert (not b!157803))

(assert (not b!157801))

(assert (not b!157804))

(assert (not b!157802))

(assert (not b!157800))

(assert (not start!31468))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!52744 () Bool)

(declare-datatypes ((tuple2!14320 0))(
  ( (tuple2!14321 (_1!7616 (_ BitVec 8)) (_2!7616 BitStream!5806)) )
))
(declare-fun lt!248545 () tuple2!14320)

(declare-fun readByte!0 (BitStream!5806) tuple2!14320)

(assert (=> d!52744 (= lt!248545 (readByte!0 lt!248515))))

(assert (=> d!52744 (= (readBytePure!0 lt!248515) (tuple2!14309 (_2!7616 lt!248545) (_1!7616 lt!248545)))))

(declare-fun bs!12975 () Bool)

(assert (= bs!12975 d!52744))

(declare-fun m!247365 () Bool)

(assert (=> bs!12975 m!247365))

(assert (=> b!157802 d!52744))

(declare-fun d!52746 () Bool)

(assert (=> d!52746 (= (array_inv!3066 arr!153) (bvsge (size!3307 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!31468 d!52746))

(declare-fun d!52748 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!52748 (= (inv!12 bs!65) (invariant!0 (currentBit!6935 bs!65) (currentByte!6940 bs!65) (size!3307 (buf!3777 bs!65))))))

(declare-fun bs!12976 () Bool)

(assert (= bs!12976 d!52748))

(declare-fun m!247367 () Bool)

(assert (=> bs!12976 m!247367))

(assert (=> start!31468 d!52748))

(declare-fun d!52750 () Bool)

(declare-fun e!107075 () Bool)

(assert (=> d!52750 e!107075))

(declare-fun res!131867 () Bool)

(assert (=> d!52750 (=> (not res!131867) (not e!107075))))

(declare-fun lt!248563 () (_ BitVec 64))

(declare-fun lt!248566 () (_ BitVec 64))

(declare-fun lt!248565 () (_ BitVec 64))

(assert (=> d!52750 (= res!131867 (= lt!248565 (bvsub lt!248566 lt!248563)))))

(assert (=> d!52750 (or (= (bvand lt!248566 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!248563 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!248566 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!248566 lt!248563) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!52750 (= lt!248563 (remainingBits!0 ((_ sign_extend 32) (size!3307 (buf!3777 lt!248515))) ((_ sign_extend 32) (currentByte!6940 lt!248515)) ((_ sign_extend 32) (currentBit!6935 lt!248515))))))

(declare-fun lt!248562 () (_ BitVec 64))

(declare-fun lt!248561 () (_ BitVec 64))

(assert (=> d!52750 (= lt!248566 (bvmul lt!248562 lt!248561))))

(assert (=> d!52750 (or (= lt!248562 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!248561 (bvsdiv (bvmul lt!248562 lt!248561) lt!248562)))))

(assert (=> d!52750 (= lt!248561 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!52750 (= lt!248562 ((_ sign_extend 32) (size!3307 (buf!3777 lt!248515))))))

(assert (=> d!52750 (= lt!248565 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6940 lt!248515)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6935 lt!248515))))))

(assert (=> d!52750 (invariant!0 (currentBit!6935 lt!248515) (currentByte!6940 lt!248515) (size!3307 (buf!3777 lt!248515)))))

(assert (=> d!52750 (= (bitIndex!0 (size!3307 (buf!3777 lt!248515)) (currentByte!6940 lt!248515) (currentBit!6935 lt!248515)) lt!248565)))

(declare-fun b!157839 () Bool)

(declare-fun res!131866 () Bool)

(assert (=> b!157839 (=> (not res!131866) (not e!107075))))

(assert (=> b!157839 (= res!131866 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!248565))))

(declare-fun b!157840 () Bool)

(declare-fun lt!248564 () (_ BitVec 64))

(assert (=> b!157840 (= e!107075 (bvsle lt!248565 (bvmul lt!248564 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!157840 (or (= lt!248564 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!248564 #b0000000000000000000000000000000000000000000000000000000000001000) lt!248564)))))

(assert (=> b!157840 (= lt!248564 ((_ sign_extend 32) (size!3307 (buf!3777 lt!248515))))))

(assert (= (and d!52750 res!131867) b!157839))

(assert (= (and b!157839 res!131866) b!157840))

(declare-fun m!247375 () Bool)

(assert (=> d!52750 m!247375))

(declare-fun m!247377 () Bool)

(assert (=> d!52750 m!247377))

(assert (=> b!157801 d!52750))

(declare-fun d!52764 () Bool)

(assert (=> d!52764 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3307 (buf!3777 bs!65))) ((_ sign_extend 32) (currentByte!6940 bs!65)) ((_ sign_extend 32) (currentBit!6935 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3307 (buf!3777 bs!65))) ((_ sign_extend 32) (currentByte!6940 bs!65)) ((_ sign_extend 32) (currentBit!6935 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12980 () Bool)

(assert (= bs!12980 d!52764))

(declare-fun m!247379 () Bool)

(assert (=> bs!12980 m!247379))

(assert (=> b!157800 d!52764))

(declare-fun d!52766 () Bool)

(assert (=> d!52766 (= (array_inv!3066 (buf!3777 bs!65)) (bvsge (size!3307 (buf!3777 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!157803 d!52766))

(declare-datatypes ((Unit!10498 0))(
  ( (Unit!10499) )
))
(declare-datatypes ((tuple3!678 0))(
  ( (tuple3!679 (_1!7617 Unit!10498) (_2!7617 BitStream!5806) (_3!456 array!7308)) )
))
(declare-fun lt!248574 () tuple3!678)

(declare-fun d!52768 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!5806 array!7308 (_ BitVec 32) (_ BitVec 32)) tuple3!678)

(assert (=> d!52768 (= lt!248574 (readByteArrayLoop!0 lt!248515 (array!7309 (store (arr!4208 arr!153) from!240 (_2!7610 (readBytePure!0 bs!65))) (size!3307 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52768 (= (readByteArrayLoopPure!0 lt!248515 (array!7309 (store (arr!4208 arr!153) from!240 (_2!7610 (readBytePure!0 bs!65))) (size!3307 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) (tuple2!14311 (_2!7617 lt!248574) (_3!456 lt!248574)))))

(declare-fun bs!12985 () Bool)

(assert (= bs!12985 d!52768))

(declare-fun m!247389 () Bool)

(assert (=> bs!12985 m!247389))

(assert (=> b!157804 d!52768))

(declare-fun d!52778 () Bool)

(declare-fun lt!248575 () tuple2!14320)

(assert (=> d!52778 (= lt!248575 (readByte!0 bs!65))))

(assert (=> d!52778 (= (readBytePure!0 bs!65) (tuple2!14309 (_2!7616 lt!248575) (_1!7616 lt!248575)))))

(declare-fun bs!12986 () Bool)

(assert (= bs!12986 d!52778))

(declare-fun m!247391 () Bool)

(assert (=> bs!12986 m!247391))

(assert (=> b!157804 d!52778))

(declare-fun d!52780 () Bool)

(declare-datatypes ((tuple2!14324 0))(
  ( (tuple2!14325 (_1!7619 Unit!10498) (_2!7619 BitStream!5806)) )
))
(declare-fun moveByteIndex!0 (BitStream!5806 (_ BitVec 32)) tuple2!14324)

(assert (=> d!52780 (= (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7619 (moveByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun bs!12987 () Bool)

(assert (= bs!12987 d!52780))

(declare-fun m!247393 () Bool)

(assert (=> bs!12987 m!247393))

(assert (=> b!157804 d!52780))

(declare-fun lt!248576 () tuple3!678)

(declare-fun d!52782 () Bool)

(assert (=> d!52782 (= lt!248576 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!52782 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!14311 (_2!7617 lt!248576) (_3!456 lt!248576)))))

(declare-fun bs!12988 () Bool)

(assert (= bs!12988 d!52782))

(declare-fun m!247395 () Bool)

(assert (=> bs!12988 m!247395))

(assert (=> b!157804 d!52782))

(push 1)

(assert (not d!52748))

(assert (not d!52782))

(assert (not d!52780))

(assert (not d!52778))

(assert (not d!52764))

(assert (not d!52744))

(assert (not d!52750))

(assert (not d!52768))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!52804 () Bool)

(declare-fun lt!248638 () (_ BitVec 8))

(declare-fun lt!248640 () (_ BitVec 8))

(assert (=> d!52804 (= lt!248638 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4208 (buf!3777 bs!65)) (currentByte!6940 bs!65))) ((_ sign_extend 24) lt!248640))))))

(assert (=> d!52804 (= lt!248640 ((_ extract 7 0) (currentBit!6935 bs!65)))))

(declare-fun e!107087 () Bool)

(assert (=> d!52804 e!107087))

(declare-fun res!131885 () Bool)

(assert (=> d!52804 (=> (not res!131885) (not e!107087))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!52804 (= res!131885 (validate_offset_bits!1 ((_ sign_extend 32) (size!3307 (buf!3777 bs!65))) ((_ sign_extend 32) (currentByte!6940 bs!65)) ((_ sign_extend 32) (currentBit!6935 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!14332 0))(
  ( (tuple2!14333 (_1!7625 Unit!10498) (_2!7625 (_ BitVec 8))) )
))
(declare-fun Unit!10504 () Unit!10498)

(declare-fun Unit!10505 () Unit!10498)

(assert (=> d!52804 (= (readByte!0 bs!65) (tuple2!14321 (_2!7625 (ite (bvsgt ((_ sign_extend 24) lt!248640) #b00000000000000000000000000000000) (tuple2!14333 Unit!10504 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!248638) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4208 (buf!3777 bs!65)) (bvadd (currentByte!6940 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!248640)))))))) (tuple2!14333 Unit!10505 lt!248638))) (BitStream!5807 (buf!3777 bs!65) (bvadd (currentByte!6940 bs!65) #b00000000000000000000000000000001) (currentBit!6935 bs!65))))))

(declare-fun b!157857 () Bool)

(declare-fun e!107086 () Bool)

(assert (=> b!157857 (= e!107087 e!107086)))

(declare-fun res!131886 () Bool)

(assert (=> b!157857 (=> (not res!131886) (not e!107086))))

(declare-fun lt!248639 () tuple2!14320)

(assert (=> b!157857 (= res!131886 (= (buf!3777 (_2!7616 lt!248639)) (buf!3777 bs!65)))))

(declare-fun lt!248637 () (_ BitVec 8))

(declare-fun lt!248641 () (_ BitVec 8))

(declare-fun Unit!10506 () Unit!10498)

(declare-fun Unit!10507 () Unit!10498)

(assert (=> b!157857 (= lt!248639 (tuple2!14321 (_2!7625 (ite (bvsgt ((_ sign_extend 24) lt!248637) #b00000000000000000000000000000000) (tuple2!14333 Unit!10506 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!248641) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4208 (buf!3777 bs!65)) (bvadd (currentByte!6940 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!248637)))))))) (tuple2!14333 Unit!10507 lt!248641))) (BitStream!5807 (buf!3777 bs!65) (bvadd (currentByte!6940 bs!65) #b00000000000000000000000000000001) (currentBit!6935 bs!65))))))

(assert (=> b!157857 (= lt!248641 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4208 (buf!3777 bs!65)) (currentByte!6940 bs!65))) ((_ sign_extend 24) lt!248637))))))

(assert (=> b!157857 (= lt!248637 ((_ extract 7 0) (currentBit!6935 bs!65)))))

(declare-fun lt!248635 () (_ BitVec 64))

(declare-fun lt!248636 () (_ BitVec 64))

(declare-fun b!157858 () Bool)

(assert (=> b!157858 (= e!107086 (= (bitIndex!0 (size!3307 (buf!3777 (_2!7616 lt!248639))) (currentByte!6940 (_2!7616 lt!248639)) (currentBit!6935 (_2!7616 lt!248639))) (bvadd lt!248635 lt!248636)))))

(assert (=> b!157858 (or (not (= (bvand lt!248635 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!248636 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!248635 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!248635 lt!248636) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!157858 (= lt!248636 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!157858 (= lt!248635 (bitIndex!0 (size!3307 (buf!3777 bs!65)) (currentByte!6940 bs!65) (currentBit!6935 bs!65)))))

(assert (= (and d!52804 res!131885) b!157857))

(assert (= (and b!157857 res!131886) b!157858))

(declare-fun m!247419 () Bool)

(assert (=> d!52804 m!247419))

(declare-fun m!247421 () Bool)

(assert (=> d!52804 m!247421))

(declare-fun m!247423 () Bool)

(assert (=> d!52804 m!247423))

(assert (=> b!157857 m!247423))

(assert (=> b!157857 m!247419))

(declare-fun m!247425 () Bool)

(assert (=> b!157858 m!247425))

(declare-fun m!247427 () Bool)

(assert (=> b!157858 m!247427))

(assert (=> d!52778 d!52804))

(declare-fun b!157869 () Bool)

(declare-fun e!107096 () tuple3!678)

(declare-fun lt!248735 () Unit!10498)

(declare-fun lt!248727 () tuple3!678)

(assert (=> b!157869 (= e!107096 (tuple3!679 lt!248735 (_2!7617 lt!248727) (_3!456 lt!248727)))))

(declare-fun lt!248739 () tuple2!14320)

(assert (=> b!157869 (= lt!248739 (readByte!0 bs!65))))

(declare-fun lt!248743 () array!7308)

(assert (=> b!157869 (= lt!248743 (array!7309 (store (arr!4208 arr!153) from!240 (_1!7616 lt!248739)) (size!3307 arr!153)))))

(declare-fun lt!248714 () (_ BitVec 64))

(assert (=> b!157869 (= lt!248714 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!248730 () (_ BitVec 32))

(assert (=> b!157869 (= lt!248730 (bvsub to!236 from!240))))

(declare-fun lt!248719 () Unit!10498)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5806 BitStream!5806 (_ BitVec 64) (_ BitVec 32)) Unit!10498)

(assert (=> b!157869 (= lt!248719 (validateOffsetBytesFromBitIndexLemma!0 bs!65 (_2!7616 lt!248739) lt!248714 lt!248730))))

(assert (=> b!157869 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3307 (buf!3777 (_2!7616 lt!248739)))) ((_ sign_extend 32) (currentByte!6940 (_2!7616 lt!248739))) ((_ sign_extend 32) (currentBit!6935 (_2!7616 lt!248739))) (bvsub lt!248730 ((_ extract 31 0) (bvsdiv (bvadd lt!248714 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!248720 () Unit!10498)

(assert (=> b!157869 (= lt!248720 lt!248719)))

(assert (=> b!157869 (= lt!248727 (readByteArrayLoop!0 (_2!7616 lt!248739) lt!248743 (bvadd from!240 #b00000000000000000000000000000001) to!236))))

(declare-fun call!2627 () (_ BitVec 64))

(assert (=> b!157869 (= call!2627 (bvadd (bitIndex!0 (size!3307 (buf!3777 bs!65)) (currentByte!6940 bs!65) (currentBit!6935 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!248728 () Unit!10498)

(declare-fun Unit!10508 () Unit!10498)

(assert (=> b!157869 (= lt!248728 Unit!10508)))

(assert (=> b!157869 (= (bvadd call!2627 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3307 (buf!3777 (_2!7617 lt!248727))) (currentByte!6940 (_2!7617 lt!248727)) (currentBit!6935 (_2!7617 lt!248727))))))

(declare-fun lt!248729 () Unit!10498)

(declare-fun Unit!10509 () Unit!10498)

(assert (=> b!157869 (= lt!248729 Unit!10509)))

(assert (=> b!157869 (= (bvadd (bitIndex!0 (size!3307 (buf!3777 bs!65)) (currentByte!6940 bs!65) (currentBit!6935 bs!65)) (bvmul ((_ sign_extend 32) (bvsub to!236 from!240)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3307 (buf!3777 (_2!7617 lt!248727))) (currentByte!6940 (_2!7617 lt!248727)) (currentBit!6935 (_2!7617 lt!248727))))))

(declare-fun lt!248726 () Unit!10498)

(declare-fun Unit!10510 () Unit!10498)

(assert (=> b!157869 (= lt!248726 Unit!10510)))

(assert (=> b!157869 (and (= (buf!3777 bs!65) (buf!3777 (_2!7617 lt!248727))) (= (size!3307 arr!153) (size!3307 (_3!456 lt!248727))))))

(declare-fun lt!248734 () Unit!10498)

(declare-fun Unit!10511 () Unit!10498)

(assert (=> b!157869 (= lt!248734 Unit!10511)))

(declare-fun lt!248740 () Unit!10498)

(declare-fun arrayUpdatedAtPrefixLemma!51 (array!7308 (_ BitVec 32) (_ BitVec 8)) Unit!10498)

(assert (=> b!157869 (= lt!248740 (arrayUpdatedAtPrefixLemma!51 arr!153 from!240 (_1!7616 lt!248739)))))

(declare-fun call!2626 () Bool)

(assert (=> b!157869 call!2626))

(declare-fun lt!248718 () Unit!10498)

(assert (=> b!157869 (= lt!248718 lt!248740)))

(declare-fun lt!248744 () (_ BitVec 32))

(assert (=> b!157869 (= lt!248744 #b00000000000000000000000000000000)))

(declare-fun lt!248745 () Unit!10498)

(declare-fun arrayRangesEqTransitive!116 (array!7308 array!7308 array!7308 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10498)

(assert (=> b!157869 (= lt!248745 (arrayRangesEqTransitive!116 arr!153 lt!248743 (_3!456 lt!248727) lt!248744 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(declare-fun arrayRangesEq!443 (array!7308 array!7308 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!157869 (arrayRangesEq!443 arr!153 (_3!456 lt!248727) lt!248744 from!240)))

(declare-fun lt!248747 () Unit!10498)

(assert (=> b!157869 (= lt!248747 lt!248745)))

(declare-fun call!2625 () Bool)

(assert (=> b!157869 call!2625))

(declare-fun lt!248736 () Unit!10498)

(declare-fun Unit!10512 () Unit!10498)

(assert (=> b!157869 (= lt!248736 Unit!10512)))

(declare-fun lt!248721 () Unit!10498)

(declare-fun arrayRangesEqImpliesEq!60 (array!7308 array!7308 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10498)

(assert (=> b!157869 (= lt!248721 (arrayRangesEqImpliesEq!60 lt!248743 (_3!456 lt!248727) #b00000000000000000000000000000000 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157869 (= (select (store (arr!4208 arr!153) from!240 (_1!7616 lt!248739)) from!240) (select (arr!4208 (_3!456 lt!248727)) from!240))))

(declare-fun lt!248724 () Unit!10498)

(assert (=> b!157869 (= lt!248724 lt!248721)))

(declare-fun lt!248748 () Bool)

(assert (=> b!157869 (= lt!248748 (= (select (arr!4208 (_3!456 lt!248727)) from!240) (_1!7616 lt!248739)))))

(declare-fun Unit!10513 () Unit!10498)

(assert (=> b!157869 (= lt!248735 Unit!10513)))

(assert (=> b!157869 lt!248748))

(declare-fun lt!248737 () tuple3!678)

(declare-fun b!157870 () Bool)

(declare-fun e!107095 () Bool)

(assert (=> b!157870 (= e!107095 (= (select (arr!4208 (_3!456 lt!248737)) from!240) (_2!7610 (readBytePure!0 bs!65))))))

(assert (=> b!157870 (and (bvsge from!240 #b00000000000000000000000000000000) (bvslt from!240 (size!3307 (_3!456 lt!248737))))))

(declare-fun bm!2622 () Bool)

(declare-fun c!8397 () Bool)

(assert (=> bm!2622 (= call!2627 (bitIndex!0 (ite c!8397 (size!3307 (buf!3777 (_2!7616 lt!248739))) (size!3307 (buf!3777 bs!65))) (ite c!8397 (currentByte!6940 (_2!7616 lt!248739)) (currentByte!6940 bs!65)) (ite c!8397 (currentBit!6935 (_2!7616 lt!248739)) (currentBit!6935 bs!65))))))

(declare-fun bm!2623 () Bool)

(assert (=> bm!2623 (= call!2625 (arrayRangesEq!443 arr!153 (ite c!8397 (_3!456 lt!248727) arr!153) #b00000000000000000000000000000000 (ite c!8397 from!240 (size!3307 arr!153))))))

(declare-fun b!157871 () Bool)

(declare-fun res!131894 () Bool)

(declare-fun e!107094 () Bool)

(assert (=> b!157871 (=> (not res!131894) (not e!107094))))

(assert (=> b!157871 (= res!131894 (and (= (buf!3777 bs!65) (buf!3777 (_2!7617 lt!248737))) (= (size!3307 arr!153) (size!3307 (_3!456 lt!248737)))))))

(declare-fun lt!248725 () array!7308)

(declare-fun bm!2624 () Bool)

(declare-fun lt!248746 () (_ BitVec 32))

(declare-fun lt!248716 () array!7308)

(declare-fun lt!248733 () (_ BitVec 32))

(assert (=> bm!2624 (= call!2626 (arrayRangesEq!443 (ite c!8397 arr!153 lt!248716) (ite c!8397 (array!7309 (store (arr!4208 arr!153) from!240 (_1!7616 lt!248739)) (size!3307 arr!153)) lt!248725) (ite c!8397 #b00000000000000000000000000000000 lt!248733) (ite c!8397 from!240 lt!248746)))))

(declare-fun b!157872 () Bool)

(assert (=> b!157872 (= e!107094 (arrayRangesEq!443 arr!153 (_3!456 lt!248737) #b00000000000000000000000000000000 from!240))))

(declare-fun d!52806 () Bool)

(assert (=> d!52806 e!107095))

(declare-fun res!131893 () Bool)

(assert (=> d!52806 (=> res!131893 e!107095)))

(assert (=> d!52806 (= res!131893 (bvsge from!240 to!236))))

(declare-fun lt!248723 () Bool)

(assert (=> d!52806 (= lt!248723 e!107094)))

(declare-fun res!131895 () Bool)

(assert (=> d!52806 (=> (not res!131895) (not e!107094))))

(declare-fun lt!248731 () (_ BitVec 64))

(declare-fun lt!248749 () (_ BitVec 64))

(assert (=> d!52806 (= res!131895 (= (bvadd lt!248749 lt!248731) (bitIndex!0 (size!3307 (buf!3777 (_2!7617 lt!248737))) (currentByte!6940 (_2!7617 lt!248737)) (currentBit!6935 (_2!7617 lt!248737)))))))

(assert (=> d!52806 (or (not (= (bvand lt!248749 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!248731 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!248749 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!248749 lt!248731) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!248715 () (_ BitVec 64))

(assert (=> d!52806 (= lt!248731 (bvmul lt!248715 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!52806 (or (= lt!248715 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!248715 #b0000000000000000000000000000000000000000000000000000000000001000) lt!248715)))))

(assert (=> d!52806 (= lt!248715 ((_ sign_extend 32) (bvsub to!236 from!240)))))

(assert (=> d!52806 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand from!240 #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000)))))

(assert (=> d!52806 (= lt!248749 (bitIndex!0 (size!3307 (buf!3777 bs!65)) (currentByte!6940 bs!65) (currentBit!6935 bs!65)))))

(assert (=> d!52806 (= lt!248737 e!107096)))

(assert (=> d!52806 (= c!8397 (bvslt from!240 to!236))))

(assert (=> d!52806 (and (bvsle #b00000000000000000000000000000000 from!240) (bvsle from!240 to!236) (bvsle to!236 (size!3307 arr!153)))))

(assert (=> d!52806 (= (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236) lt!248737)))

(declare-fun lt!248722 () Unit!10498)

(declare-fun b!157873 () Bool)

(assert (=> b!157873 (= e!107096 (tuple3!679 lt!248722 bs!65 arr!153))))

(assert (=> b!157873 (= call!2627 call!2627)))

(declare-fun lt!248717 () Unit!10498)

(declare-fun Unit!10514 () Unit!10498)

(assert (=> b!157873 (= lt!248717 Unit!10514)))

(declare-fun lt!248742 () Unit!10498)

(declare-fun arrayRangesEqReflexiveLemma!51 (array!7308) Unit!10498)

(assert (=> b!157873 (= lt!248742 (arrayRangesEqReflexiveLemma!51 arr!153))))

(assert (=> b!157873 call!2625))

(declare-fun lt!248732 () Unit!10498)

(assert (=> b!157873 (= lt!248732 lt!248742)))

(assert (=> b!157873 (= lt!248716 arr!153)))

(assert (=> b!157873 (= lt!248725 arr!153)))

(declare-fun lt!248741 () (_ BitVec 32))

(assert (=> b!157873 (= lt!248741 #b00000000000000000000000000000000)))

(declare-fun lt!248738 () (_ BitVec 32))

(assert (=> b!157873 (= lt!248738 (size!3307 arr!153))))

(assert (=> b!157873 (= lt!248733 #b00000000000000000000000000000000)))

(assert (=> b!157873 (= lt!248746 from!240)))

(declare-fun arrayRangesEqSlicedLemma!51 (array!7308 array!7308 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10498)

(assert (=> b!157873 (= lt!248722 (arrayRangesEqSlicedLemma!51 lt!248716 lt!248725 lt!248741 lt!248738 lt!248733 lt!248746))))

(assert (=> b!157873 call!2626))

(assert (= (and d!52806 c!8397) b!157869))

(assert (= (and d!52806 (not c!8397)) b!157873))

(assert (= (or b!157869 b!157873) bm!2624))

(assert (= (or b!157869 b!157873) bm!2623))

(assert (= (or b!157869 b!157873) bm!2622))

(assert (= (and d!52806 res!131895) b!157871))

(assert (= (and b!157871 res!131894) b!157872))

(assert (= (and d!52806 (not res!131893)) b!157870))

(declare-fun m!247429 () Bool)

(assert (=> bm!2623 m!247429))

(declare-fun m!247431 () Bool)

(assert (=> bm!2622 m!247431))

(assert (=> b!157869 m!247391))

(declare-fun m!247433 () Bool)

(assert (=> b!157869 m!247433))

(declare-fun m!247435 () Bool)

(assert (=> b!157869 m!247435))

(declare-fun m!247437 () Bool)

(assert (=> b!157869 m!247437))

(declare-fun m!247439 () Bool)

(assert (=> b!157869 m!247439))

(declare-fun m!247441 () Bool)

(assert (=> b!157869 m!247441))

(declare-fun m!247443 () Bool)

(assert (=> b!157869 m!247443))

(assert (=> b!157869 m!247427))

(declare-fun m!247445 () Bool)

(assert (=> b!157869 m!247445))

(declare-fun m!247447 () Bool)

(assert (=> b!157869 m!247447))

(declare-fun m!247449 () Bool)

(assert (=> b!157869 m!247449))

(declare-fun m!247451 () Bool)

(assert (=> b!157869 m!247451))

(declare-fun m!247453 () Bool)

(assert (=> b!157869 m!247453))

(declare-fun m!247455 () Bool)

(assert (=> b!157872 m!247455))

(declare-fun m!247457 () Bool)

(assert (=> b!157870 m!247457))

(assert (=> b!157870 m!247309))

(assert (=> bm!2624 m!247447))

(declare-fun m!247459 () Bool)

(assert (=> bm!2624 m!247459))

(declare-fun m!247461 () Bool)

(assert (=> d!52806 m!247461))

(assert (=> d!52806 m!247427))

(declare-fun m!247463 () Bool)

(assert (=> b!157873 m!247463))

(declare-fun m!247465 () Bool)

(assert (=> b!157873 m!247465))

(assert (=> d!52782 d!52806))

(declare-fun d!52808 () Bool)

(assert (=> d!52808 (= (remainingBits!0 ((_ sign_extend 32) (size!3307 (buf!3777 lt!248515))) ((_ sign_extend 32) (currentByte!6940 lt!248515)) ((_ sign_extend 32) (currentBit!6935 lt!248515))) (bvsub (bvmul ((_ sign_extend 32) (size!3307 (buf!3777 lt!248515))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6940 lt!248515)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6935 lt!248515)))))))

(assert (=> d!52750 d!52808))

(declare-fun d!52810 () Bool)

(assert (=> d!52810 (= (invariant!0 (currentBit!6935 lt!248515) (currentByte!6940 lt!248515) (size!3307 (buf!3777 lt!248515))) (and (bvsge (currentBit!6935 lt!248515) #b00000000000000000000000000000000) (bvslt (currentBit!6935 lt!248515) #b00000000000000000000000000001000) (bvsge (currentByte!6940 lt!248515) #b00000000000000000000000000000000) (or (bvslt (currentByte!6940 lt!248515) (size!3307 (buf!3777 lt!248515))) (and (= (currentBit!6935 lt!248515) #b00000000000000000000000000000000) (= (currentByte!6940 lt!248515) (size!3307 (buf!3777 lt!248515)))))))))

(assert (=> d!52750 d!52810))

(declare-fun b!157874 () Bool)

(declare-fun e!107099 () tuple3!678)

(declare-fun lt!248771 () Unit!10498)

(declare-fun lt!248763 () tuple3!678)

(assert (=> b!157874 (= e!107099 (tuple3!679 lt!248771 (_2!7617 lt!248763) (_3!456 lt!248763)))))

(declare-fun lt!248775 () tuple2!14320)

(assert (=> b!157874 (= lt!248775 (readByte!0 lt!248515))))

(declare-fun lt!248779 () array!7308)

(assert (=> b!157874 (= lt!248779 (array!7309 (store (arr!4208 (array!7309 (store (arr!4208 arr!153) from!240 (_2!7610 (readBytePure!0 bs!65))) (size!3307 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7616 lt!248775)) (size!3307 (array!7309 (store (arr!4208 arr!153) from!240 (_2!7610 (readBytePure!0 bs!65))) (size!3307 arr!153)))))))

(declare-fun lt!248750 () (_ BitVec 64))

(assert (=> b!157874 (= lt!248750 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!248766 () (_ BitVec 32))

(assert (=> b!157874 (= lt!248766 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!248755 () Unit!10498)

(assert (=> b!157874 (= lt!248755 (validateOffsetBytesFromBitIndexLemma!0 lt!248515 (_2!7616 lt!248775) lt!248750 lt!248766))))

(assert (=> b!157874 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3307 (buf!3777 (_2!7616 lt!248775)))) ((_ sign_extend 32) (currentByte!6940 (_2!7616 lt!248775))) ((_ sign_extend 32) (currentBit!6935 (_2!7616 lt!248775))) (bvsub lt!248766 ((_ extract 31 0) (bvsdiv (bvadd lt!248750 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!248756 () Unit!10498)

(assert (=> b!157874 (= lt!248756 lt!248755)))

(assert (=> b!157874 (= lt!248763 (readByteArrayLoop!0 (_2!7616 lt!248775) lt!248779 (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(declare-fun call!2630 () (_ BitVec 64))

(assert (=> b!157874 (= call!2630 (bvadd (bitIndex!0 (size!3307 (buf!3777 lt!248515)) (currentByte!6940 lt!248515) (currentBit!6935 lt!248515)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!248764 () Unit!10498)

(declare-fun Unit!10515 () Unit!10498)

(assert (=> b!157874 (= lt!248764 Unit!10515)))

(assert (=> b!157874 (= (bvadd call!2630 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3307 (buf!3777 (_2!7617 lt!248763))) (currentByte!6940 (_2!7617 lt!248763)) (currentBit!6935 (_2!7617 lt!248763))))))

(declare-fun lt!248765 () Unit!10498)

(declare-fun Unit!10516 () Unit!10498)

(assert (=> b!157874 (= lt!248765 Unit!10516)))

(assert (=> b!157874 (= (bvadd (bitIndex!0 (size!3307 (buf!3777 lt!248515)) (currentByte!6940 lt!248515) (currentBit!6935 lt!248515)) (bvmul ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3307 (buf!3777 (_2!7617 lt!248763))) (currentByte!6940 (_2!7617 lt!248763)) (currentBit!6935 (_2!7617 lt!248763))))))

(declare-fun lt!248762 () Unit!10498)

(declare-fun Unit!10517 () Unit!10498)

(assert (=> b!157874 (= lt!248762 Unit!10517)))

(assert (=> b!157874 (and (= (buf!3777 lt!248515) (buf!3777 (_2!7617 lt!248763))) (= (size!3307 (array!7309 (store (arr!4208 arr!153) from!240 (_2!7610 (readBytePure!0 bs!65))) (size!3307 arr!153))) (size!3307 (_3!456 lt!248763))))))

(declare-fun lt!248770 () Unit!10498)

(declare-fun Unit!10518 () Unit!10498)

(assert (=> b!157874 (= lt!248770 Unit!10518)))

(declare-fun lt!248776 () Unit!10498)

(assert (=> b!157874 (= lt!248776 (arrayUpdatedAtPrefixLemma!51 (array!7309 (store (arr!4208 arr!153) from!240 (_2!7610 (readBytePure!0 bs!65))) (size!3307 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) (_1!7616 lt!248775)))))

(declare-fun call!2629 () Bool)

(assert (=> b!157874 call!2629))

(declare-fun lt!248754 () Unit!10498)

(assert (=> b!157874 (= lt!248754 lt!248776)))

(declare-fun lt!248780 () (_ BitVec 32))

(assert (=> b!157874 (= lt!248780 #b00000000000000000000000000000000)))

(declare-fun lt!248781 () Unit!10498)

(assert (=> b!157874 (= lt!248781 (arrayRangesEqTransitive!116 (array!7309 (store (arr!4208 arr!153) from!240 (_2!7610 (readBytePure!0 bs!65))) (size!3307 arr!153)) lt!248779 (_3!456 lt!248763) lt!248780 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157874 (arrayRangesEq!443 (array!7309 (store (arr!4208 arr!153) from!240 (_2!7610 (readBytePure!0 bs!65))) (size!3307 arr!153)) (_3!456 lt!248763) lt!248780 (bvadd #b00000000000000000000000000000001 from!240))))

(declare-fun lt!248783 () Unit!10498)

(assert (=> b!157874 (= lt!248783 lt!248781)))

(declare-fun call!2628 () Bool)

(assert (=> b!157874 call!2628))

(declare-fun lt!248772 () Unit!10498)

(declare-fun Unit!10519 () Unit!10498)

(assert (=> b!157874 (= lt!248772 Unit!10519)))

(declare-fun lt!248757 () Unit!10498)

(assert (=> b!157874 (= lt!248757 (arrayRangesEqImpliesEq!60 lt!248779 (_3!456 lt!248763) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157874 (= (select (store (arr!4208 (array!7309 (store (arr!4208 arr!153) from!240 (_2!7610 (readBytePure!0 bs!65))) (size!3307 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7616 lt!248775)) (bvadd #b00000000000000000000000000000001 from!240)) (select (arr!4208 (_3!456 lt!248763)) (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!248760 () Unit!10498)

(assert (=> b!157874 (= lt!248760 lt!248757)))

(declare-fun lt!248784 () Bool)

(assert (=> b!157874 (= lt!248784 (= (select (arr!4208 (_3!456 lt!248763)) (bvadd #b00000000000000000000000000000001 from!240)) (_1!7616 lt!248775)))))

(declare-fun Unit!10520 () Unit!10498)

(assert (=> b!157874 (= lt!248771 Unit!10520)))

(assert (=> b!157874 lt!248784))

(declare-fun e!107098 () Bool)

(declare-fun b!157875 () Bool)

(declare-fun lt!248773 () tuple3!678)

(assert (=> b!157875 (= e!107098 (= (select (arr!4208 (_3!456 lt!248773)) (bvadd #b00000000000000000000000000000001 from!240)) (_2!7610 (readBytePure!0 lt!248515))))))

(assert (=> b!157875 (and (bvsge (bvadd #b00000000000000000000000000000001 from!240) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!240) (size!3307 (_3!456 lt!248773))))))

(declare-fun bm!2625 () Bool)

(declare-fun c!8398 () Bool)

(assert (=> bm!2625 (= call!2630 (bitIndex!0 (ite c!8398 (size!3307 (buf!3777 (_2!7616 lt!248775))) (size!3307 (buf!3777 lt!248515))) (ite c!8398 (currentByte!6940 (_2!7616 lt!248775)) (currentByte!6940 lt!248515)) (ite c!8398 (currentBit!6935 (_2!7616 lt!248775)) (currentBit!6935 lt!248515))))))

(declare-fun bm!2626 () Bool)

(assert (=> bm!2626 (= call!2628 (arrayRangesEq!443 (array!7309 (store (arr!4208 arr!153) from!240 (_2!7610 (readBytePure!0 bs!65))) (size!3307 arr!153)) (ite c!8398 (_3!456 lt!248763) (array!7309 (store (arr!4208 arr!153) from!240 (_2!7610 (readBytePure!0 bs!65))) (size!3307 arr!153))) #b00000000000000000000000000000000 (ite c!8398 (bvadd #b00000000000000000000000000000001 from!240) (size!3307 (array!7309 (store (arr!4208 arr!153) from!240 (_2!7610 (readBytePure!0 bs!65))) (size!3307 arr!153))))))))

(declare-fun b!157876 () Bool)

(declare-fun res!131897 () Bool)

(declare-fun e!107097 () Bool)

(assert (=> b!157876 (=> (not res!131897) (not e!107097))))

(assert (=> b!157876 (= res!131897 (and (= (buf!3777 lt!248515) (buf!3777 (_2!7617 lt!248773))) (= (size!3307 (array!7309 (store (arr!4208 arr!153) from!240 (_2!7610 (readBytePure!0 bs!65))) (size!3307 arr!153))) (size!3307 (_3!456 lt!248773)))))))

(declare-fun lt!248761 () array!7308)

(declare-fun lt!248769 () (_ BitVec 32))

(declare-fun lt!248782 () (_ BitVec 32))

(declare-fun lt!248752 () array!7308)

(declare-fun bm!2627 () Bool)

(assert (=> bm!2627 (= call!2629 (arrayRangesEq!443 (ite c!8398 (array!7309 (store (arr!4208 arr!153) from!240 (_2!7610 (readBytePure!0 bs!65))) (size!3307 arr!153)) lt!248752) (ite c!8398 (array!7309 (store (arr!4208 (array!7309 (store (arr!4208 arr!153) from!240 (_2!7610 (readBytePure!0 bs!65))) (size!3307 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7616 lt!248775)) (size!3307 (array!7309 (store (arr!4208 arr!153) from!240 (_2!7610 (readBytePure!0 bs!65))) (size!3307 arr!153)))) lt!248761) (ite c!8398 #b00000000000000000000000000000000 lt!248769) (ite c!8398 (bvadd #b00000000000000000000000000000001 from!240) lt!248782)))))

(declare-fun b!157877 () Bool)

(assert (=> b!157877 (= e!107097 (arrayRangesEq!443 (array!7309 (store (arr!4208 arr!153) from!240 (_2!7610 (readBytePure!0 bs!65))) (size!3307 arr!153)) (_3!456 lt!248773) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun d!52812 () Bool)

(assert (=> d!52812 e!107098))

(declare-fun res!131896 () Bool)

(assert (=> d!52812 (=> res!131896 e!107098)))

(assert (=> d!52812 (= res!131896 (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!248759 () Bool)

(assert (=> d!52812 (= lt!248759 e!107097)))

(declare-fun res!131898 () Bool)

(assert (=> d!52812 (=> (not res!131898) (not e!107097))))

(declare-fun lt!248767 () (_ BitVec 64))

(declare-fun lt!248785 () (_ BitVec 64))

(assert (=> d!52812 (= res!131898 (= (bvadd lt!248785 lt!248767) (bitIndex!0 (size!3307 (buf!3777 (_2!7617 lt!248773))) (currentByte!6940 (_2!7617 lt!248773)) (currentBit!6935 (_2!7617 lt!248773)))))))

(assert (=> d!52812 (or (not (= (bvand lt!248785 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!248767 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!248785 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!248785 lt!248767) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!248751 () (_ BitVec 64))

(assert (=> d!52812 (= lt!248767 (bvmul lt!248751 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!52812 (or (= lt!248751 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!248751 #b0000000000000000000000000000000000000000000000000000000000001000) lt!248751)))))

(assert (=> d!52812 (= lt!248751 ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))))))

(assert (=> d!52812 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!240) #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b10000000000000000000000000000000)))))

(assert (=> d!52812 (= lt!248785 (bitIndex!0 (size!3307 (buf!3777 lt!248515)) (currentByte!6940 lt!248515) (currentBit!6935 lt!248515)))))

(assert (=> d!52812 (= lt!248773 e!107099)))

(assert (=> d!52812 (= c!8398 (bvslt (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52812 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsle (bvadd #b00000000000000000000000000000001 from!240) to!236) (bvsle to!236 (size!3307 (array!7309 (store (arr!4208 arr!153) from!240 (_2!7610 (readBytePure!0 bs!65))) (size!3307 arr!153)))))))

(assert (=> d!52812 (= (readByteArrayLoop!0 lt!248515 (array!7309 (store (arr!4208 arr!153) from!240 (_2!7610 (readBytePure!0 bs!65))) (size!3307 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) lt!248773)))

(declare-fun lt!248758 () Unit!10498)

(declare-fun b!157878 () Bool)

(assert (=> b!157878 (= e!107099 (tuple3!679 lt!248758 lt!248515 (array!7309 (store (arr!4208 arr!153) from!240 (_2!7610 (readBytePure!0 bs!65))) (size!3307 arr!153))))))

(assert (=> b!157878 (= call!2630 call!2630)))

(declare-fun lt!248753 () Unit!10498)

(declare-fun Unit!10521 () Unit!10498)

(assert (=> b!157878 (= lt!248753 Unit!10521)))

(declare-fun lt!248778 () Unit!10498)

(assert (=> b!157878 (= lt!248778 (arrayRangesEqReflexiveLemma!51 (array!7309 (store (arr!4208 arr!153) from!240 (_2!7610 (readBytePure!0 bs!65))) (size!3307 arr!153))))))

(assert (=> b!157878 call!2628))

(declare-fun lt!248768 () Unit!10498)

(assert (=> b!157878 (= lt!248768 lt!248778)))

(assert (=> b!157878 (= lt!248752 (array!7309 (store (arr!4208 arr!153) from!240 (_2!7610 (readBytePure!0 bs!65))) (size!3307 arr!153)))))

(assert (=> b!157878 (= lt!248761 (array!7309 (store (arr!4208 arr!153) from!240 (_2!7610 (readBytePure!0 bs!65))) (size!3307 arr!153)))))

(declare-fun lt!248777 () (_ BitVec 32))

(assert (=> b!157878 (= lt!248777 #b00000000000000000000000000000000)))

(declare-fun lt!248774 () (_ BitVec 32))

(assert (=> b!157878 (= lt!248774 (size!3307 (array!7309 (store (arr!4208 arr!153) from!240 (_2!7610 (readBytePure!0 bs!65))) (size!3307 arr!153))))))

(assert (=> b!157878 (= lt!248769 #b00000000000000000000000000000000)))

(assert (=> b!157878 (= lt!248782 (bvadd #b00000000000000000000000000000001 from!240))))

(assert (=> b!157878 (= lt!248758 (arrayRangesEqSlicedLemma!51 lt!248752 lt!248761 lt!248777 lt!248774 lt!248769 lt!248782))))

(assert (=> b!157878 call!2629))

(assert (= (and d!52812 c!8398) b!157874))

(assert (= (and d!52812 (not c!8398)) b!157878))

(assert (= (or b!157874 b!157878) bm!2627))

(assert (= (or b!157874 b!157878) bm!2626))

(assert (= (or b!157874 b!157878) bm!2625))

(assert (= (and d!52812 res!131898) b!157876))

(assert (= (and b!157876 res!131897) b!157877))

(assert (= (and d!52812 (not res!131896)) b!157875))

(declare-fun m!247467 () Bool)

(assert (=> bm!2626 m!247467))

(declare-fun m!247469 () Bool)

(assert (=> bm!2625 m!247469))

(assert (=> b!157874 m!247365))

(declare-fun m!247471 () Bool)

(assert (=> b!157874 m!247471))

(declare-fun m!247473 () Bool)

(assert (=> b!157874 m!247473))

(declare-fun m!247475 () Bool)

(assert (=> b!157874 m!247475))

(declare-fun m!247477 () Bool)

(assert (=> b!157874 m!247477))

(declare-fun m!247479 () Bool)

(assert (=> b!157874 m!247479))

(declare-fun m!247481 () Bool)

(assert (=> b!157874 m!247481))

(assert (=> b!157874 m!247319))

(declare-fun m!247483 () Bool)

(assert (=> b!157874 m!247483))

(declare-fun m!247485 () Bool)

(assert (=> b!157874 m!247485))

(declare-fun m!247487 () Bool)

(assert (=> b!157874 m!247487))

(declare-fun m!247489 () Bool)

(assert (=> b!157874 m!247489))

(declare-fun m!247491 () Bool)

(assert (=> b!157874 m!247491))

(declare-fun m!247493 () Bool)

(assert (=> b!157877 m!247493))

(declare-fun m!247495 () Bool)

(assert (=> b!157875 m!247495))

(assert (=> b!157875 m!247299))

(assert (=> bm!2627 m!247485))

(declare-fun m!247497 () Bool)

(assert (=> bm!2627 m!247497))

(declare-fun m!247499 () Bool)

(assert (=> d!52812 m!247499))

(assert (=> d!52812 m!247319))

(declare-fun m!247501 () Bool)

(assert (=> b!157878 m!247501))

(declare-fun m!247503 () Bool)

(assert (=> b!157878 m!247503))

(assert (=> d!52768 d!52812))

(declare-fun d!52814 () Bool)

(assert (=> d!52814 (= (remainingBits!0 ((_ sign_extend 32) (size!3307 (buf!3777 bs!65))) ((_ sign_extend 32) (currentByte!6940 bs!65)) ((_ sign_extend 32) (currentBit!6935 bs!65))) (bvsub (bvmul ((_ sign_extend 32) (size!3307 (buf!3777 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6940 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6935 bs!65)))))))

(assert (=> d!52764 d!52814))

(declare-fun d!52816 () Bool)

(declare-fun e!107102 () Bool)

(assert (=> d!52816 e!107102))

(declare-fun res!131901 () Bool)

(assert (=> d!52816 (=> (not res!131901) (not e!107102))))

(declare-fun moveByteIndexPrecond!0 (BitStream!5806 (_ BitVec 32)) Bool)

(assert (=> d!52816 (= res!131901 (moveByteIndexPrecond!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun Unit!10522 () Unit!10498)

(assert (=> d!52816 (= (moveByteIndex!0 bs!65 #b00000000000000000000000000000001) (tuple2!14325 Unit!10522 (BitStream!5807 (buf!3777 bs!65) (bvadd (currentByte!6940 bs!65) #b00000000000000000000000000000001) (currentBit!6935 bs!65))))))

(declare-fun b!157881 () Bool)

(assert (=> b!157881 (= e!107102 (and (or (not (= (bvand (currentByte!6940 bs!65) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6940 bs!65) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6940 bs!65) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6940 bs!65) #b00000000000000000000000000000001) (bvadd (currentByte!6940 bs!65) #b00000000000000000000000000000001))))))

(assert (= (and d!52816 res!131901) b!157881))

(declare-fun m!247505 () Bool)

(assert (=> d!52816 m!247505))

(assert (=> d!52780 d!52816))

(declare-fun d!52818 () Bool)

(declare-fun lt!248789 () (_ BitVec 8))

(declare-fun lt!248791 () (_ BitVec 8))

(assert (=> d!52818 (= lt!248789 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4208 (buf!3777 lt!248515)) (currentByte!6940 lt!248515))) ((_ sign_extend 24) lt!248791))))))

(assert (=> d!52818 (= lt!248791 ((_ extract 7 0) (currentBit!6935 lt!248515)))))

(declare-fun e!107104 () Bool)

(assert (=> d!52818 e!107104))

(declare-fun res!131902 () Bool)

(assert (=> d!52818 (=> (not res!131902) (not e!107104))))

(assert (=> d!52818 (= res!131902 (validate_offset_bits!1 ((_ sign_extend 32) (size!3307 (buf!3777 lt!248515))) ((_ sign_extend 32) (currentByte!6940 lt!248515)) ((_ sign_extend 32) (currentBit!6935 lt!248515)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!10523 () Unit!10498)

(declare-fun Unit!10524 () Unit!10498)

(assert (=> d!52818 (= (readByte!0 lt!248515) (tuple2!14321 (_2!7625 (ite (bvsgt ((_ sign_extend 24) lt!248791) #b00000000000000000000000000000000) (tuple2!14333 Unit!10523 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!248789) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4208 (buf!3777 lt!248515)) (bvadd (currentByte!6940 lt!248515) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!248791)))))))) (tuple2!14333 Unit!10524 lt!248789))) (BitStream!5807 (buf!3777 lt!248515) (bvadd (currentByte!6940 lt!248515) #b00000000000000000000000000000001) (currentBit!6935 lt!248515))))))

(declare-fun b!157882 () Bool)

(declare-fun e!107103 () Bool)

(assert (=> b!157882 (= e!107104 e!107103)))

(declare-fun res!131903 () Bool)

(assert (=> b!157882 (=> (not res!131903) (not e!107103))))

(declare-fun lt!248790 () tuple2!14320)

(assert (=> b!157882 (= res!131903 (= (buf!3777 (_2!7616 lt!248790)) (buf!3777 lt!248515)))))

(declare-fun lt!248792 () (_ BitVec 8))

(declare-fun lt!248788 () (_ BitVec 8))

(declare-fun Unit!10525 () Unit!10498)

(declare-fun Unit!10526 () Unit!10498)

(assert (=> b!157882 (= lt!248790 (tuple2!14321 (_2!7625 (ite (bvsgt ((_ sign_extend 24) lt!248788) #b00000000000000000000000000000000) (tuple2!14333 Unit!10525 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!248792) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4208 (buf!3777 lt!248515)) (bvadd (currentByte!6940 lt!248515) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!248788)))))))) (tuple2!14333 Unit!10526 lt!248792))) (BitStream!5807 (buf!3777 lt!248515) (bvadd (currentByte!6940 lt!248515) #b00000000000000000000000000000001) (currentBit!6935 lt!248515))))))

(assert (=> b!157882 (= lt!248792 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4208 (buf!3777 lt!248515)) (currentByte!6940 lt!248515))) ((_ sign_extend 24) lt!248788))))))

(assert (=> b!157882 (= lt!248788 ((_ extract 7 0) (currentBit!6935 lt!248515)))))

(declare-fun b!157883 () Bool)

(declare-fun lt!248787 () (_ BitVec 64))

(declare-fun lt!248786 () (_ BitVec 64))

(assert (=> b!157883 (= e!107103 (= (bitIndex!0 (size!3307 (buf!3777 (_2!7616 lt!248790))) (currentByte!6940 (_2!7616 lt!248790)) (currentBit!6935 (_2!7616 lt!248790))) (bvadd lt!248786 lt!248787)))))

(assert (=> b!157883 (or (not (= (bvand lt!248786 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!248787 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!248786 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!248786 lt!248787) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!157883 (= lt!248787 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!157883 (= lt!248786 (bitIndex!0 (size!3307 (buf!3777 lt!248515)) (currentByte!6940 lt!248515) (currentBit!6935 lt!248515)))))

(assert (= (and d!52818 res!131902) b!157882))

(assert (= (and b!157882 res!131903) b!157883))

(declare-fun m!247507 () Bool)

(assert (=> d!52818 m!247507))

(declare-fun m!247509 () Bool)

(assert (=> d!52818 m!247509))

(declare-fun m!247511 () Bool)

(assert (=> d!52818 m!247511))

(assert (=> b!157882 m!247511))

(assert (=> b!157882 m!247507))

(declare-fun m!247513 () Bool)

(assert (=> b!157883 m!247513))

(assert (=> b!157883 m!247319))

(assert (=> d!52744 d!52818))

(declare-fun d!52820 () Bool)

(assert (=> d!52820 (= (invariant!0 (currentBit!6935 bs!65) (currentByte!6940 bs!65) (size!3307 (buf!3777 bs!65))) (and (bvsge (currentBit!6935 bs!65) #b00000000000000000000000000000000) (bvslt (currentBit!6935 bs!65) #b00000000000000000000000000001000) (bvsge (currentByte!6940 bs!65) #b00000000000000000000000000000000) (or (bvslt (currentByte!6940 bs!65) (size!3307 (buf!3777 bs!65))) (and (= (currentBit!6935 bs!65) #b00000000000000000000000000000000) (= (currentByte!6940 bs!65) (size!3307 (buf!3777 bs!65)))))))))

(assert (=> d!52748 d!52820))

(push 1)

(assert (not b!157869))

(assert (not b!157874))

(assert (not bm!2622))

(assert (not b!157870))

(assert (not d!52806))

(assert (not d!52812))

(assert (not d!52816))

(assert (not d!52804))

(assert (not bm!2627))

(assert (not b!157877))

(assert (not b!157858))

(assert (not b!157875))

(assert (not b!157873))

(assert (not d!52818))

(assert (not bm!2626))

(assert (not bm!2623))

(assert (not b!157872))

(assert (not bm!2625))

(assert (not bm!2624))

(assert (not b!157878))

(assert (not b!157883))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

