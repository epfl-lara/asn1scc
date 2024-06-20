; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47438 () Bool)

(assert start!47438)

(declare-fun b!226171 () Bool)

(declare-fun res!189788 () Bool)

(declare-fun e!154564 () Bool)

(assert (=> b!226171 (=> (not res!189788) (not e!154564))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!226171 (= res!189788 (bvslt i!761 to!496))))

(declare-fun b!226170 () Bool)

(declare-fun res!189789 () Bool)

(assert (=> b!226170 (=> (not res!189789) (not e!154564))))

(declare-datatypes ((array!11300 0))(
  ( (array!11301 (arr!5917 (Array (_ BitVec 32) (_ BitVec 8))) (size!4957 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9010 0))(
  ( (BitStream!9011 (buf!5498 array!11300) (currentByte!10306 (_ BitVec 32)) (currentBit!10301 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9010)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226170 (= res!189789 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4957 (buf!5498 thiss!1870))) ((_ sign_extend 32) (currentByte!10306 thiss!1870)) ((_ sign_extend 32) (currentBit!10301 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!226173 () Bool)

(declare-fun e!154562 () Bool)

(declare-fun array_inv!4698 (array!11300) Bool)

(assert (=> b!226173 (= e!154562 (array_inv!4698 (buf!5498 thiss!1870)))))

(declare-fun res!189790 () Bool)

(assert (=> start!47438 (=> (not res!189790) (not e!154564))))

(declare-fun arr!308 () array!11300)

(assert (=> start!47438 (= res!189790 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4957 arr!308))))))

(assert (=> start!47438 e!154564))

(assert (=> start!47438 true))

(assert (=> start!47438 (array_inv!4698 arr!308)))

(declare-fun inv!12 (BitStream!9010) Bool)

(assert (=> start!47438 (and (inv!12 thiss!1870) e!154562)))

(declare-fun b!226172 () Bool)

(declare-datatypes ((tuple2!19376 0))(
  ( (tuple2!19377 (_1!10478 (_ BitVec 8)) (_2!10478 BitStream!9010)) )
))
(declare-fun lt!359655 () tuple2!19376)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!226172 (= e!154564 (not (= (bitIndex!0 (size!4957 (buf!5498 (_2!10478 lt!359655))) (currentByte!10306 (_2!10478 lt!359655)) (currentBit!10301 (_2!10478 lt!359655))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!4957 (buf!5498 thiss!1870)) (currentByte!10306 thiss!1870) (currentBit!10301 thiss!1870))))))))

(declare-datatypes ((Unit!16692 0))(
  ( (Unit!16693) )
))
(declare-datatypes ((tuple3!1296 0))(
  ( (tuple3!1297 (_1!10479 Unit!16692) (_2!10479 BitStream!9010) (_3!790 array!11300)) )
))
(declare-fun lt!359653 () tuple3!1296)

(declare-fun readByteArrayLoop!0 (BitStream!9010 array!11300 (_ BitVec 32) (_ BitVec 32)) tuple3!1296)

(assert (=> b!226172 (= lt!359653 (readByteArrayLoop!0 (_2!10478 lt!359655) (array!11301 (store (arr!5917 arr!308) i!761 (_1!10478 lt!359655)) (size!4957 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!226172 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4957 (buf!5498 (_2!10478 lt!359655)))) ((_ sign_extend 32) (currentByte!10306 (_2!10478 lt!359655))) ((_ sign_extend 32) (currentBit!10301 (_2!10478 lt!359655))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!359654 () Unit!16692)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9010 BitStream!9010 (_ BitVec 64) (_ BitVec 32)) Unit!16692)

(assert (=> b!226172 (= lt!359654 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10478 lt!359655) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!9010) tuple2!19376)

(assert (=> b!226172 (= lt!359655 (readByte!0 thiss!1870))))

(assert (= (and start!47438 res!189790) b!226170))

(assert (= (and b!226170 res!189789) b!226171))

(assert (= (and b!226171 res!189788) b!226172))

(assert (= start!47438 b!226173))

(declare-fun m!347335 () Bool)

(assert (=> b!226170 m!347335))

(declare-fun m!347337 () Bool)

(assert (=> b!226173 m!347337))

(declare-fun m!347339 () Bool)

(assert (=> start!47438 m!347339))

(declare-fun m!347341 () Bool)

(assert (=> start!47438 m!347341))

(declare-fun m!347343 () Bool)

(assert (=> b!226172 m!347343))

(declare-fun m!347345 () Bool)

(assert (=> b!226172 m!347345))

(declare-fun m!347347 () Bool)

(assert (=> b!226172 m!347347))

(declare-fun m!347349 () Bool)

(assert (=> b!226172 m!347349))

(declare-fun m!347351 () Bool)

(assert (=> b!226172 m!347351))

(declare-fun m!347353 () Bool)

(assert (=> b!226172 m!347353))

(declare-fun m!347355 () Bool)

(assert (=> b!226172 m!347355))

(push 1)

(assert (not b!226170))

(assert (not b!226172))

(assert (not b!226173))

(assert (not start!47438))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76759 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!76759 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4957 (buf!5498 thiss!1870))) ((_ sign_extend 32) (currentByte!10306 thiss!1870)) ((_ sign_extend 32) (currentBit!10301 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4957 (buf!5498 thiss!1870))) ((_ sign_extend 32) (currentByte!10306 thiss!1870)) ((_ sign_extend 32) (currentBit!10301 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18765 () Bool)

(assert (= bs!18765 d!76759))

(declare-fun m!347401 () Bool)

(assert (=> bs!18765 m!347401))

(assert (=> b!226170 d!76759))

(declare-fun d!76761 () Bool)

(assert (=> d!76761 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4957 (buf!5498 (_2!10478 lt!359655)))) ((_ sign_extend 32) (currentByte!10306 (_2!10478 lt!359655))) ((_ sign_extend 32) (currentBit!10301 (_2!10478 lt!359655))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4957 (buf!5498 (_2!10478 lt!359655)))) ((_ sign_extend 32) (currentByte!10306 (_2!10478 lt!359655))) ((_ sign_extend 32) (currentBit!10301 (_2!10478 lt!359655)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18766 () Bool)

(assert (= bs!18766 d!76761))

(declare-fun m!347403 () Bool)

(assert (=> bs!18766 m!347403))

(assert (=> b!226172 d!76761))

(declare-fun d!76763 () Bool)

(declare-fun lt!359693 () (_ BitVec 8))

(declare-fun lt!359689 () (_ BitVec 8))

(assert (=> d!76763 (= lt!359693 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5917 (buf!5498 thiss!1870)) (currentByte!10306 thiss!1870))) ((_ sign_extend 24) lt!359689))))))

(assert (=> d!76763 (= lt!359689 ((_ extract 7 0) (currentBit!10301 thiss!1870)))))

(declare-fun e!154594 () Bool)

(assert (=> d!76763 e!154594))

(declare-fun res!189815 () Bool)

(assert (=> d!76763 (=> (not res!189815) (not e!154594))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!76763 (= res!189815 (validate_offset_bits!1 ((_ sign_extend 32) (size!4957 (buf!5498 thiss!1870))) ((_ sign_extend 32) (currentByte!10306 thiss!1870)) ((_ sign_extend 32) (currentBit!10301 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19382 0))(
  ( (tuple2!19383 (_1!10484 Unit!16692) (_2!10484 (_ BitVec 8))) )
))
(declare-fun Unit!16698 () Unit!16692)

(declare-fun Unit!16699 () Unit!16692)

(assert (=> d!76763 (= (readByte!0 thiss!1870) (tuple2!19377 (_2!10484 (ite (bvsgt ((_ sign_extend 24) lt!359689) #b00000000000000000000000000000000) (tuple2!19383 Unit!16698 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!359693) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5917 (buf!5498 thiss!1870)) (bvadd (currentByte!10306 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!359689)))))))) (tuple2!19383 Unit!16699 lt!359693))) (BitStream!9011 (buf!5498 thiss!1870) (bvadd (currentByte!10306 thiss!1870) #b00000000000000000000000000000001) (currentBit!10301 thiss!1870))))))

(declare-fun b!226202 () Bool)

(declare-fun e!154593 () Bool)

(assert (=> b!226202 (= e!154594 e!154593)))

(declare-fun res!189816 () Bool)

(assert (=> b!226202 (=> (not res!189816) (not e!154593))))

(declare-fun lt!359694 () tuple2!19376)

(assert (=> b!226202 (= res!189816 (= (buf!5498 (_2!10478 lt!359694)) (buf!5498 thiss!1870)))))

(declare-fun lt!359690 () (_ BitVec 8))

(declare-fun lt!359692 () (_ BitVec 8))

(declare-fun Unit!16700 () Unit!16692)

(declare-fun Unit!16701 () Unit!16692)

(assert (=> b!226202 (= lt!359694 (tuple2!19377 (_2!10484 (ite (bvsgt ((_ sign_extend 24) lt!359690) #b00000000000000000000000000000000) (tuple2!19383 Unit!16700 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!359692) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5917 (buf!5498 thiss!1870)) (bvadd (currentByte!10306 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!359690)))))))) (tuple2!19383 Unit!16701 lt!359692))) (BitStream!9011 (buf!5498 thiss!1870) (bvadd (currentByte!10306 thiss!1870) #b00000000000000000000000000000001) (currentBit!10301 thiss!1870))))))

(assert (=> b!226202 (= lt!359692 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5917 (buf!5498 thiss!1870)) (currentByte!10306 thiss!1870))) ((_ sign_extend 24) lt!359690))))))

(assert (=> b!226202 (= lt!359690 ((_ extract 7 0) (currentBit!10301 thiss!1870)))))

(declare-fun lt!359691 () (_ BitVec 64))

(declare-fun b!226203 () Bool)

(declare-fun lt!359688 () (_ BitVec 64))

(assert (=> b!226203 (= e!154593 (= (bitIndex!0 (size!4957 (buf!5498 (_2!10478 lt!359694))) (currentByte!10306 (_2!10478 lt!359694)) (currentBit!10301 (_2!10478 lt!359694))) (bvadd lt!359691 lt!359688)))))

(assert (=> b!226203 (or (not (= (bvand lt!359691 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!359688 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!359691 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!359691 lt!359688) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!226203 (= lt!359688 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!226203 (= lt!359691 (bitIndex!0 (size!4957 (buf!5498 thiss!1870)) (currentByte!10306 thiss!1870) (currentBit!10301 thiss!1870)))))

(assert (= (and d!76763 res!189815) b!226202))

(assert (= (and b!226202 res!189816) b!226203))

(declare-fun m!347407 () Bool)

(assert (=> d!76763 m!347407))

(declare-fun m!347409 () Bool)

(assert (=> d!76763 m!347409))

(declare-fun m!347411 () Bool)

(assert (=> d!76763 m!347411))

(assert (=> b!226202 m!347411))

(assert (=> b!226202 m!347407))

(declare-fun m!347413 () Bool)

(assert (=> b!226203 m!347413))

(assert (=> b!226203 m!347353))

(assert (=> b!226172 d!76763))

(declare-fun d!76769 () Bool)

(declare-fun e!154603 () Bool)

(assert (=> d!76769 e!154603))

(declare-fun res!189828 () Bool)

(assert (=> d!76769 (=> (not res!189828) (not e!154603))))

(declare-fun lt!359733 () (_ BitVec 64))

(declare-fun lt!359730 () (_ BitVec 64))

(declare-fun lt!359731 () (_ BitVec 64))

(assert (=> d!76769 (= res!189828 (= lt!359730 (bvsub lt!359731 lt!359733)))))

(assert (=> d!76769 (or (= (bvand lt!359731 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!359733 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!359731 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!359731 lt!359733) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76769 (= lt!359733 (remainingBits!0 ((_ sign_extend 32) (size!4957 (buf!5498 thiss!1870))) ((_ sign_extend 32) (currentByte!10306 thiss!1870)) ((_ sign_extend 32) (currentBit!10301 thiss!1870))))))

(declare-fun lt!359732 () (_ BitVec 64))

(declare-fun lt!359729 () (_ BitVec 64))

(assert (=> d!76769 (= lt!359731 (bvmul lt!359732 lt!359729))))

(assert (=> d!76769 (or (= lt!359732 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!359729 (bvsdiv (bvmul lt!359732 lt!359729) lt!359732)))))

(assert (=> d!76769 (= lt!359729 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76769 (= lt!359732 ((_ sign_extend 32) (size!4957 (buf!5498 thiss!1870))))))

(assert (=> d!76769 (= lt!359730 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10306 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10301 thiss!1870))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!76769 (invariant!0 (currentBit!10301 thiss!1870) (currentByte!10306 thiss!1870) (size!4957 (buf!5498 thiss!1870)))))

(assert (=> d!76769 (= (bitIndex!0 (size!4957 (buf!5498 thiss!1870)) (currentByte!10306 thiss!1870) (currentBit!10301 thiss!1870)) lt!359730)))

(declare-fun b!226214 () Bool)

(declare-fun res!189827 () Bool)

(assert (=> b!226214 (=> (not res!189827) (not e!154603))))

(assert (=> b!226214 (= res!189827 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!359730))))

(declare-fun b!226215 () Bool)

(declare-fun lt!359728 () (_ BitVec 64))

(assert (=> b!226215 (= e!154603 (bvsle lt!359730 (bvmul lt!359728 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!226215 (or (= lt!359728 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!359728 #b0000000000000000000000000000000000000000000000000000000000001000) lt!359728)))))

(assert (=> b!226215 (= lt!359728 ((_ sign_extend 32) (size!4957 (buf!5498 thiss!1870))))))

(assert (= (and d!76769 res!189828) b!226214))

(assert (= (and b!226214 res!189827) b!226215))

(assert (=> d!76769 m!347401))

(declare-fun m!347423 () Bool)

(assert (=> d!76769 m!347423))

(assert (=> b!226172 d!76769))

(declare-fun d!76773 () Bool)

(declare-fun e!154606 () Bool)

(assert (=> d!76773 e!154606))

(declare-fun res!189831 () Bool)

(assert (=> d!76773 (=> (not res!189831) (not e!154606))))

(assert (=> d!76773 (= res!189831 (and (or (let ((rhs!3856 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3856 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3856) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!76776 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!76776 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!76776 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3855 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3855 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3855) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!359740 () Unit!16692)

(declare-fun choose!57 (BitStream!9010 BitStream!9010 (_ BitVec 64) (_ BitVec 32)) Unit!16692)

(assert (=> d!76773 (= lt!359740 (choose!57 thiss!1870 (_2!10478 lt!359655) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!76773 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10478 lt!359655) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!359740)))

(declare-fun b!226218 () Bool)

(declare-fun lt!359742 () (_ BitVec 32))

(assert (=> b!226218 (= e!154606 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4957 (buf!5498 (_2!10478 lt!359655)))) ((_ sign_extend 32) (currentByte!10306 (_2!10478 lt!359655))) ((_ sign_extend 32) (currentBit!10301 (_2!10478 lt!359655))) (bvsub (bvsub to!496 i!761) lt!359742)))))

(assert (=> b!226218 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!359742 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!359742) #b10000000000000000000000000000000)))))

(declare-fun lt!359741 () (_ BitVec 64))

(assert (=> b!226218 (= lt!359742 ((_ extract 31 0) lt!359741))))

(assert (=> b!226218 (and (bvslt lt!359741 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!359741 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!226218 (= lt!359741 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!76773 res!189831) b!226218))

(declare-fun m!347429 () Bool)

(assert (=> d!76773 m!347429))

(declare-fun m!347431 () Bool)

(assert (=> b!226218 m!347431))

(assert (=> b!226172 d!76773))

(declare-fun bm!3706 () Bool)

(declare-fun c!11164 () Bool)

(declare-fun call!3710 () Bool)

(declare-fun lt!360006 () tuple3!1296)

(declare-fun arrayRangesEq!814 (array!11300 array!11300 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!3706 (= call!3710 (arrayRangesEq!814 (array!11301 (store (arr!5917 arr!308) i!761 (_1!10478 lt!359655)) (size!4957 arr!308)) (ite c!11164 (_3!790 lt!360006) (array!11301 (store (arr!5917 arr!308) i!761 (_1!10478 lt!359655)) (size!4957 arr!308))) #b00000000000000000000000000000000 (ite c!11164 (bvadd #b00000000000000000000000000000001 i!761) (size!4957 (array!11301 (store (arr!5917 arr!308) i!761 (_1!10478 lt!359655)) (size!4957 arr!308))))))))

(declare-fun b!226262 () Bool)

(declare-fun res!189868 () Bool)

(declare-fun e!154634 () Bool)

(assert (=> b!226262 (=> (not res!189868) (not e!154634))))

(declare-fun lt!360000 () tuple3!1296)

(assert (=> b!226262 (= res!189868 (and (= (buf!5498 (_2!10478 lt!359655)) (buf!5498 (_2!10479 lt!360000))) (= (size!4957 (array!11301 (store (arr!5917 arr!308) i!761 (_1!10478 lt!359655)) (size!4957 arr!308))) (size!4957 (_3!790 lt!360000)))))))

(declare-fun bm!3707 () Bool)

(declare-fun call!3709 () (_ BitVec 64))

(assert (=> bm!3707 (= call!3709 (bitIndex!0 (size!4957 (buf!5498 (_2!10478 lt!359655))) (currentByte!10306 (_2!10478 lt!359655)) (currentBit!10301 (_2!10478 lt!359655))))))

(declare-fun b!226263 () Bool)

(declare-fun e!154636 () Bool)

(declare-datatypes ((tuple2!19386 0))(
  ( (tuple2!19387 (_1!10486 BitStream!9010) (_2!10486 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!9010) tuple2!19386)

(assert (=> b!226263 (= e!154636 (= (select (arr!5917 (_3!790 lt!360000)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10486 (readBytePure!0 (_2!10478 lt!359655)))))))

(assert (=> b!226263 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4957 (_3!790 lt!360000))))))

(declare-fun d!76786 () Bool)

(assert (=> d!76786 e!154636))

(declare-fun res!189866 () Bool)

(assert (=> d!76786 (=> res!189866 e!154636)))

(assert (=> d!76786 (= res!189866 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!359997 () Bool)

(assert (=> d!76786 (= lt!359997 e!154634)))

(declare-fun res!189867 () Bool)

(assert (=> d!76786 (=> (not res!189867) (not e!154634))))

(declare-fun lt!359985 () (_ BitVec 64))

(declare-fun lt!359992 () (_ BitVec 64))

(assert (=> d!76786 (= res!189867 (= (bvadd lt!359992 lt!359985) (bitIndex!0 (size!4957 (buf!5498 (_2!10479 lt!360000))) (currentByte!10306 (_2!10479 lt!360000)) (currentBit!10301 (_2!10479 lt!360000)))))))

(assert (=> d!76786 (or (not (= (bvand lt!359992 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!359985 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!359992 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!359992 lt!359985) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!359995 () (_ BitVec 64))

(assert (=> d!76786 (= lt!359985 (bvmul lt!359995 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!76786 (or (= lt!359995 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!359995 #b0000000000000000000000000000000000000000000000000000000000001000) lt!359995)))))

(assert (=> d!76786 (= lt!359995 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!76786 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!76786 (= lt!359992 (bitIndex!0 (size!4957 (buf!5498 (_2!10478 lt!359655))) (currentByte!10306 (_2!10478 lt!359655)) (currentBit!10301 (_2!10478 lt!359655))))))

(declare-fun e!154635 () tuple3!1296)

(assert (=> d!76786 (= lt!360000 e!154635)))

(assert (=> d!76786 (= c!11164 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!76786 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!4957 (array!11301 (store (arr!5917 arr!308) i!761 (_1!10478 lt!359655)) (size!4957 arr!308)))))))

(assert (=> d!76786 (= (readByteArrayLoop!0 (_2!10478 lt!359655) (array!11301 (store (arr!5917 arr!308) i!761 (_1!10478 lt!359655)) (size!4957 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!360000)))

(declare-fun b!226264 () Bool)

(declare-fun lt!359998 () Unit!16692)

(assert (=> b!226264 (= e!154635 (tuple3!1297 lt!359998 (_2!10479 lt!360006) (_3!790 lt!360006)))))

(declare-fun lt!360015 () tuple2!19376)

(assert (=> b!226264 (= lt!360015 (readByte!0 (_2!10478 lt!359655)))))

(declare-fun lt!360003 () array!11300)

(assert (=> b!226264 (= lt!360003 (array!11301 (store (arr!5917 (array!11301 (store (arr!5917 arr!308) i!761 (_1!10478 lt!359655)) (size!4957 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10478 lt!360015)) (size!4957 (array!11301 (store (arr!5917 arr!308) i!761 (_1!10478 lt!359655)) (size!4957 arr!308)))))))

(declare-fun lt!360010 () (_ BitVec 64))

(assert (=> b!226264 (= lt!360010 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!360007 () (_ BitVec 32))

(assert (=> b!226264 (= lt!360007 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!360002 () Unit!16692)

(assert (=> b!226264 (= lt!360002 (validateOffsetBytesFromBitIndexLemma!0 (_2!10478 lt!359655) (_2!10478 lt!360015) lt!360010 lt!360007))))

(assert (=> b!226264 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4957 (buf!5498 (_2!10478 lt!360015)))) ((_ sign_extend 32) (currentByte!10306 (_2!10478 lt!360015))) ((_ sign_extend 32) (currentBit!10301 (_2!10478 lt!360015))) (bvsub lt!360007 ((_ extract 31 0) (bvsdiv (bvadd lt!360010 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!359987 () Unit!16692)

(assert (=> b!226264 (= lt!359987 lt!360002)))

(assert (=> b!226264 (= lt!360006 (readByteArrayLoop!0 (_2!10478 lt!360015) lt!360003 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> b!226264 (= (bitIndex!0 (size!4957 (buf!5498 (_2!10478 lt!360015))) (currentByte!10306 (_2!10478 lt!360015)) (currentBit!10301 (_2!10478 lt!360015))) (bvadd call!3709 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!359996 () Unit!16692)

(declare-fun Unit!16707 () Unit!16692)

(assert (=> b!226264 (= lt!359996 Unit!16707)))

(assert (=> b!226264 (= (bvadd (bitIndex!0 (size!4957 (buf!5498 (_2!10478 lt!360015))) (currentByte!10306 (_2!10478 lt!360015)) (currentBit!10301 (_2!10478 lt!360015))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4957 (buf!5498 (_2!10479 lt!360006))) (currentByte!10306 (_2!10479 lt!360006)) (currentBit!10301 (_2!10479 lt!360006))))))

(declare-fun lt!360001 () Unit!16692)

(declare-fun Unit!16708 () Unit!16692)

(assert (=> b!226264 (= lt!360001 Unit!16708)))

(assert (=> b!226264 (= (bvadd call!3709 (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4957 (buf!5498 (_2!10479 lt!360006))) (currentByte!10306 (_2!10479 lt!360006)) (currentBit!10301 (_2!10479 lt!360006))))))

(declare-fun lt!359980 () Unit!16692)

(declare-fun Unit!16709 () Unit!16692)

(assert (=> b!226264 (= lt!359980 Unit!16709)))

(assert (=> b!226264 (and (= (buf!5498 (_2!10478 lt!359655)) (buf!5498 (_2!10479 lt!360006))) (= (size!4957 (array!11301 (store (arr!5917 arr!308) i!761 (_1!10478 lt!359655)) (size!4957 arr!308))) (size!4957 (_3!790 lt!360006))))))

(declare-fun lt!359982 () Unit!16692)

(declare-fun Unit!16710 () Unit!16692)

(assert (=> b!226264 (= lt!359982 Unit!16710)))

(declare-fun lt!359991 () Unit!16692)

(declare-fun arrayUpdatedAtPrefixLemma!373 (array!11300 (_ BitVec 32) (_ BitVec 8)) Unit!16692)

(assert (=> b!226264 (= lt!359991 (arrayUpdatedAtPrefixLemma!373 (array!11301 (store (arr!5917 arr!308) i!761 (_1!10478 lt!359655)) (size!4957 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) (_1!10478 lt!360015)))))

(assert (=> b!226264 (arrayRangesEq!814 (array!11301 (store (arr!5917 arr!308) i!761 (_1!10478 lt!359655)) (size!4957 arr!308)) (array!11301 (store (arr!5917 (array!11301 (store (arr!5917 arr!308) i!761 (_1!10478 lt!359655)) (size!4957 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10478 lt!360015)) (size!4957 (array!11301 (store (arr!5917 arr!308) i!761 (_1!10478 lt!359655)) (size!4957 arr!308)))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!359986 () Unit!16692)

(assert (=> b!226264 (= lt!359986 lt!359991)))

(declare-fun lt!360009 () (_ BitVec 32))

(assert (=> b!226264 (= lt!360009 #b00000000000000000000000000000000)))

(declare-fun lt!359993 () Unit!16692)

(declare-fun arrayRangesEqTransitive!252 (array!11300 array!11300 array!11300 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16692)

(assert (=> b!226264 (= lt!359993 (arrayRangesEqTransitive!252 (array!11301 (store (arr!5917 arr!308) i!761 (_1!10478 lt!359655)) (size!4957 arr!308)) lt!360003 (_3!790 lt!360006) lt!360009 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(declare-fun call!3711 () Bool)

(assert (=> b!226264 call!3711))

(declare-fun lt!359989 () Unit!16692)

(assert (=> b!226264 (= lt!359989 lt!359993)))

(assert (=> b!226264 call!3710))

(declare-fun lt!360014 () Unit!16692)

(declare-fun Unit!16711 () Unit!16692)

(assert (=> b!226264 (= lt!360014 Unit!16711)))

(declare-fun lt!360004 () Unit!16692)

(declare-fun arrayRangesEqImpliesEq!103 (array!11300 array!11300 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16692)

(assert (=> b!226264 (= lt!360004 (arrayRangesEqImpliesEq!103 lt!360003 (_3!790 lt!360006) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!226264 (= (select (store (arr!5917 (array!11301 (store (arr!5917 arr!308) i!761 (_1!10478 lt!359655)) (size!4957 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10478 lt!360015)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5917 (_3!790 lt!360006)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!360013 () Unit!16692)

(assert (=> b!226264 (= lt!360013 lt!360004)))

(declare-fun lt!360005 () Bool)

(assert (=> b!226264 (= lt!360005 (= (select (arr!5917 (_3!790 lt!360006)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10478 lt!360015)))))

(declare-fun Unit!16712 () Unit!16692)

(assert (=> b!226264 (= lt!359998 Unit!16712)))

(assert (=> b!226264 lt!360005))

(declare-fun b!226265 () Bool)

(assert (=> b!226265 (= e!154634 (arrayRangesEq!814 (array!11301 (store (arr!5917 arr!308) i!761 (_1!10478 lt!359655)) (size!4957 arr!308)) (_3!790 lt!360000) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun b!226266 () Bool)

(declare-fun lt!359990 () Unit!16692)

(assert (=> b!226266 (= e!154635 (tuple3!1297 lt!359990 (_2!10478 lt!359655) (array!11301 (store (arr!5917 arr!308) i!761 (_1!10478 lt!359655)) (size!4957 arr!308))))))

(assert (=> b!226266 (= call!3709 call!3709)))

(declare-fun lt!359999 () Unit!16692)

(declare-fun Unit!16714 () Unit!16692)

(assert (=> b!226266 (= lt!359999 Unit!16714)))

(declare-fun lt!359984 () Unit!16692)

(declare-fun arrayRangesEqReflexiveLemma!119 (array!11300) Unit!16692)

(assert (=> b!226266 (= lt!359984 (arrayRangesEqReflexiveLemma!119 (array!11301 (store (arr!5917 arr!308) i!761 (_1!10478 lt!359655)) (size!4957 arr!308))))))

(assert (=> b!226266 call!3710))

(declare-fun lt!359981 () Unit!16692)

(assert (=> b!226266 (= lt!359981 lt!359984)))

(declare-fun lt!359983 () array!11300)

(assert (=> b!226266 (= lt!359983 (array!11301 (store (arr!5917 arr!308) i!761 (_1!10478 lt!359655)) (size!4957 arr!308)))))

(declare-fun lt!360012 () array!11300)

(assert (=> b!226266 (= lt!360012 (array!11301 (store (arr!5917 arr!308) i!761 (_1!10478 lt!359655)) (size!4957 arr!308)))))

(declare-fun lt!360011 () (_ BitVec 32))

(assert (=> b!226266 (= lt!360011 #b00000000000000000000000000000000)))

(declare-fun lt!359994 () (_ BitVec 32))

(assert (=> b!226266 (= lt!359994 (size!4957 (array!11301 (store (arr!5917 arr!308) i!761 (_1!10478 lt!359655)) (size!4957 arr!308))))))

(declare-fun lt!359988 () (_ BitVec 32))

(assert (=> b!226266 (= lt!359988 #b00000000000000000000000000000000)))

(declare-fun lt!360008 () (_ BitVec 32))

(assert (=> b!226266 (= lt!360008 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!104 (array!11300 array!11300 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16692)

(assert (=> b!226266 (= lt!359990 (arrayRangesEqSlicedLemma!104 lt!359983 lt!360012 lt!360011 lt!359994 lt!359988 lt!360008))))

(assert (=> b!226266 call!3711))

(declare-fun bm!3708 () Bool)

(assert (=> bm!3708 (= call!3711 (arrayRangesEq!814 (ite c!11164 (array!11301 (store (arr!5917 arr!308) i!761 (_1!10478 lt!359655)) (size!4957 arr!308)) lt!359983) (ite c!11164 (_3!790 lt!360006) lt!360012) (ite c!11164 lt!360009 lt!359988) (ite c!11164 (bvadd #b00000000000000000000000000000001 i!761) lt!360008)))))

(assert (= (and d!76786 c!11164) b!226264))

(assert (= (and d!76786 (not c!11164)) b!226266))

(assert (= (or b!226264 b!226266) bm!3708))

(assert (= (or b!226264 b!226266) bm!3706))

(assert (= (or b!226264 b!226266) bm!3707))

(assert (= (and d!76786 res!189867) b!226262))

(assert (= (and b!226262 res!189868) b!226265))

(assert (= (and d!76786 (not res!189866)) b!226263))

(declare-fun m!347491 () Bool)

(assert (=> bm!3706 m!347491))

(declare-fun m!347493 () Bool)

(assert (=> d!76786 m!347493))

(assert (=> d!76786 m!347349))

(assert (=> bm!3707 m!347349))

(declare-fun m!347495 () Bool)

(assert (=> bm!3708 m!347495))

(declare-fun m!347497 () Bool)

(assert (=> b!226263 m!347497))

(declare-fun m!347499 () Bool)

(assert (=> b!226263 m!347499))

(declare-fun m!347501 () Bool)

(assert (=> b!226264 m!347501))

(declare-fun m!347503 () Bool)

(assert (=> b!226264 m!347503))

(declare-fun m!347505 () Bool)

(assert (=> b!226264 m!347505))

(declare-fun m!347507 () Bool)

(assert (=> b!226264 m!347507))

(declare-fun m!347509 () Bool)

(assert (=> b!226264 m!347509))

(declare-fun m!347511 () Bool)

(assert (=> b!226264 m!347511))

(declare-fun m!347513 () Bool)

(assert (=> b!226264 m!347513))

(declare-fun m!347515 () Bool)

(assert (=> b!226264 m!347515))

(declare-fun m!347517 () Bool)

(assert (=> b!226264 m!347517))

(declare-fun m!347519 () Bool)

(assert (=> b!226264 m!347519))

(declare-fun m!347521 () Bool)

(assert (=> b!226264 m!347521))

(declare-fun m!347523 () Bool)

(assert (=> b!226264 m!347523))

(declare-fun m!347525 () Bool)

(assert (=> b!226264 m!347525))

(declare-fun m!347527 () Bool)

(assert (=> b!226265 m!347527))

(declare-fun m!347529 () Bool)

(assert (=> b!226266 m!347529))

(declare-fun m!347531 () Bool)

(assert (=> b!226266 m!347531))

(assert (=> b!226172 d!76786))

(declare-fun d!76797 () Bool)

(declare-fun e!154637 () Bool)

(assert (=> d!76797 e!154637))

(declare-fun res!189870 () Bool)

(assert (=> d!76797 (=> (not res!189870) (not e!154637))))

(declare-fun lt!360021 () (_ BitVec 64))

(declare-fun lt!360018 () (_ BitVec 64))

(declare-fun lt!360019 () (_ BitVec 64))

(assert (=> d!76797 (= res!189870 (= lt!360018 (bvsub lt!360019 lt!360021)))))

(assert (=> d!76797 (or (= (bvand lt!360019 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!360021 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!360019 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!360019 lt!360021) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76797 (= lt!360021 (remainingBits!0 ((_ sign_extend 32) (size!4957 (buf!5498 (_2!10478 lt!359655)))) ((_ sign_extend 32) (currentByte!10306 (_2!10478 lt!359655))) ((_ sign_extend 32) (currentBit!10301 (_2!10478 lt!359655)))))))

(declare-fun lt!360020 () (_ BitVec 64))

(declare-fun lt!360017 () (_ BitVec 64))

(assert (=> d!76797 (= lt!360019 (bvmul lt!360020 lt!360017))))

(assert (=> d!76797 (or (= lt!360020 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!360017 (bvsdiv (bvmul lt!360020 lt!360017) lt!360020)))))

(assert (=> d!76797 (= lt!360017 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76797 (= lt!360020 ((_ sign_extend 32) (size!4957 (buf!5498 (_2!10478 lt!359655)))))))

(assert (=> d!76797 (= lt!360018 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10306 (_2!10478 lt!359655))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10301 (_2!10478 lt!359655)))))))

(assert (=> d!76797 (invariant!0 (currentBit!10301 (_2!10478 lt!359655)) (currentByte!10306 (_2!10478 lt!359655)) (size!4957 (buf!5498 (_2!10478 lt!359655))))))

(assert (=> d!76797 (= (bitIndex!0 (size!4957 (buf!5498 (_2!10478 lt!359655))) (currentByte!10306 (_2!10478 lt!359655)) (currentBit!10301 (_2!10478 lt!359655))) lt!360018)))

(declare-fun b!226267 () Bool)

(declare-fun res!189869 () Bool)

(assert (=> b!226267 (=> (not res!189869) (not e!154637))))

(assert (=> b!226267 (= res!189869 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!360018))))

(declare-fun b!226268 () Bool)

(declare-fun lt!360016 () (_ BitVec 64))

(assert (=> b!226268 (= e!154637 (bvsle lt!360018 (bvmul lt!360016 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!226268 (or (= lt!360016 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!360016 #b0000000000000000000000000000000000000000000000000000000000001000) lt!360016)))))

(assert (=> b!226268 (= lt!360016 ((_ sign_extend 32) (size!4957 (buf!5498 (_2!10478 lt!359655)))))))

(assert (= (and d!76797 res!189870) b!226267))

(assert (= (and b!226267 res!189869) b!226268))

(assert (=> d!76797 m!347403))

(declare-fun m!347533 () Bool)

(assert (=> d!76797 m!347533))

(assert (=> b!226172 d!76797))

(declare-fun d!76799 () Bool)

(assert (=> d!76799 (= (array_inv!4698 (buf!5498 thiss!1870)) (bvsge (size!4957 (buf!5498 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!226173 d!76799))

(declare-fun d!76801 () Bool)

(assert (=> d!76801 (= (array_inv!4698 arr!308) (bvsge (size!4957 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47438 d!76801))

(declare-fun d!76803 () Bool)

(assert (=> d!76803 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10301 thiss!1870) (currentByte!10306 thiss!1870) (size!4957 (buf!5498 thiss!1870))))))

(declare-fun bs!18770 () Bool)

(assert (= bs!18770 d!76803))

(assert (=> bs!18770 m!347423))

(assert (=> start!47438 d!76803))

(push 1)

(assert (not b!226266))

(assert (not d!76773))

(assert (not d!76803))

(assert (not d!76786))

(assert (not b!226264))

(assert (not b!226218))

(assert (not d!76763))

(assert (not b!226203))

(assert (not b!226265))

(assert (not d!76797))

(assert (not d!76759))

(assert (not d!76761))

(assert (not bm!3706))

(assert (not bm!3708))

(assert (not b!226263))

(assert (not bm!3707))

(assert (not d!76769))

(check-sat)

(pop 1)

(push 1)

(check-sat)

