; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31400 () Bool)

(assert start!31400)

(declare-fun b!157695 () Bool)

(declare-fun e!106945 () Bool)

(declare-datatypes ((array!7303 0))(
  ( (array!7304 (arr!4201 (Array (_ BitVec 32) (_ BitVec 8))) (size!3306 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5804 0))(
  ( (BitStream!5805 (buf!3776 array!7303) (currentByte!6930 (_ BitVec 32)) (currentBit!6925 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5804)

(declare-fun lt!247966 () BitStream!5804)

(assert (=> b!157695 (= e!106945 (not (= (size!3306 (buf!3776 bs!65)) (size!3306 (buf!3776 lt!247966)))))))

(declare-datatypes ((tuple2!14286 0))(
  ( (tuple2!14287 (_1!7596 BitStream!5804) (_2!7596 (_ BitVec 8))) )
))
(declare-fun lt!247963 () tuple2!14286)

(declare-fun readBytePure!0 (BitStream!5804) tuple2!14286)

(assert (=> b!157695 (= lt!247963 (readBytePure!0 lt!247966))))

(declare-fun res!131752 () Bool)

(declare-fun e!106947 () Bool)

(assert (=> start!31400 (=> (not res!131752) (not e!106947))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun arr!153 () array!7303)

(assert (=> start!31400 (= res!131752 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3306 arr!153))))))

(assert (=> start!31400 e!106947))

(assert (=> start!31400 true))

(declare-fun array_inv!3065 (array!7303) Bool)

(assert (=> start!31400 (array_inv!3065 arr!153)))

(declare-fun e!106949 () Bool)

(declare-fun inv!12 (BitStream!5804) Bool)

(assert (=> start!31400 (and (inv!12 bs!65) e!106949)))

(declare-fun b!157694 () Bool)

(assert (=> b!157694 (= e!106947 e!106945)))

(declare-fun res!131753 () Bool)

(assert (=> b!157694 (=> (not res!131753) (not e!106945))))

(assert (=> b!157694 (= res!131753 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((tuple2!14288 0))(
  ( (tuple2!14289 (_1!7597 BitStream!5804) (_2!7597 array!7303)) )
))
(declare-fun lt!247964 () tuple2!14288)

(declare-fun readByteArrayLoopPure!0 (BitStream!5804 array!7303 (_ BitVec 32) (_ BitVec 32)) tuple2!14288)

(assert (=> b!157694 (= lt!247964 (readByteArrayLoopPure!0 lt!247966 (array!7304 (store (arr!4201 arr!153) from!240 (_2!7596 (readBytePure!0 bs!65))) (size!3306 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5804 (_ BitVec 32)) BitStream!5804)

(assert (=> b!157694 (= lt!247966 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!247965 () tuple2!14288)

(assert (=> b!157694 (= lt!247965 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!157696 () Bool)

(assert (=> b!157696 (= e!106949 (array_inv!3065 (buf!3776 bs!65)))))

(declare-fun b!157693 () Bool)

(declare-fun res!131751 () Bool)

(assert (=> b!157693 (=> (not res!131751) (not e!106947))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157693 (= res!131751 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3306 (buf!3776 bs!65))) ((_ sign_extend 32) (currentByte!6930 bs!65)) ((_ sign_extend 32) (currentBit!6925 bs!65)) (bvsub to!236 from!240)))))

(assert (= (and start!31400 res!131752) b!157693))

(assert (= (and b!157693 res!131751) b!157694))

(assert (= (and b!157694 res!131753) b!157695))

(assert (= start!31400 b!157696))

(declare-fun m!246943 () Bool)

(assert (=> b!157693 m!246943))

(declare-fun m!246945 () Bool)

(assert (=> b!157695 m!246945))

(declare-fun m!246947 () Bool)

(assert (=> b!157696 m!246947))

(declare-fun m!246949 () Bool)

(assert (=> start!31400 m!246949))

(declare-fun m!246951 () Bool)

(assert (=> start!31400 m!246951))

(declare-fun m!246953 () Bool)

(assert (=> b!157694 m!246953))

(declare-fun m!246955 () Bool)

(assert (=> b!157694 m!246955))

(declare-fun m!246957 () Bool)

(assert (=> b!157694 m!246957))

(declare-fun m!246959 () Bool)

(assert (=> b!157694 m!246959))

(declare-fun m!246961 () Bool)

(assert (=> b!157694 m!246961))

(push 1)

(assert (not start!31400))

(assert (not b!157696))

(assert (not b!157695))

(assert (not b!157694))

(assert (not b!157693))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!52654 () Bool)

(assert (=> d!52654 (= (array_inv!3065 arr!153) (bvsge (size!3306 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!31400 d!52654))

(declare-fun d!52658 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!52658 (= (inv!12 bs!65) (invariant!0 (currentBit!6925 bs!65) (currentByte!6930 bs!65) (size!3306 (buf!3776 bs!65))))))

(declare-fun bs!12953 () Bool)

(assert (= bs!12953 d!52658))

(declare-fun m!246967 () Bool)

(assert (=> bs!12953 m!246967))

(assert (=> start!31400 d!52658))

(declare-fun d!52660 () Bool)

(assert (=> d!52660 (= (array_inv!3065 (buf!3776 bs!65)) (bvsge (size!3306 (buf!3776 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!157696 d!52660))

(declare-fun d!52662 () Bool)

(declare-datatypes ((tuple2!14292 0))(
  ( (tuple2!14293 (_1!7599 (_ BitVec 8)) (_2!7599 BitStream!5804)) )
))
(declare-fun lt!247972 () tuple2!14292)

(declare-fun readByte!0 (BitStream!5804) tuple2!14292)

(assert (=> d!52662 (= lt!247972 (readByte!0 lt!247966))))

(assert (=> d!52662 (= (readBytePure!0 lt!247966) (tuple2!14287 (_2!7599 lt!247972) (_1!7599 lt!247972)))))

(declare-fun bs!12954 () Bool)

(assert (= bs!12954 d!52662))

(declare-fun m!246969 () Bool)

(assert (=> bs!12954 m!246969))

(assert (=> b!157695 d!52662))

(declare-datatypes ((Unit!10425 0))(
  ( (Unit!10426) )
))
(declare-datatypes ((tuple3!674 0))(
  ( (tuple3!675 (_1!7601 Unit!10425) (_2!7601 BitStream!5804) (_3!454 array!7303)) )
))
(declare-fun lt!247979 () tuple3!674)

(declare-fun d!52664 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!5804 array!7303 (_ BitVec 32) (_ BitVec 32)) tuple3!674)

(assert (=> d!52664 (= lt!247979 (readByteArrayLoop!0 lt!247966 (array!7304 (store (arr!4201 arr!153) from!240 (_2!7596 (readBytePure!0 bs!65))) (size!3306 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52664 (= (readByteArrayLoopPure!0 lt!247966 (array!7304 (store (arr!4201 arr!153) from!240 (_2!7596 (readBytePure!0 bs!65))) (size!3306 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) (tuple2!14289 (_2!7601 lt!247979) (_3!454 lt!247979)))))

(declare-fun bs!12957 () Bool)

(assert (= bs!12957 d!52664))

(declare-fun m!246975 () Bool)

(assert (=> bs!12957 m!246975))

(assert (=> b!157694 d!52664))

(declare-fun d!52670 () Bool)

(declare-fun lt!247980 () tuple2!14292)

(assert (=> d!52670 (= lt!247980 (readByte!0 bs!65))))

(assert (=> d!52670 (= (readBytePure!0 bs!65) (tuple2!14287 (_2!7599 lt!247980) (_1!7599 lt!247980)))))

(declare-fun bs!12958 () Bool)

(assert (= bs!12958 d!52670))

(declare-fun m!246977 () Bool)

(assert (=> bs!12958 m!246977))

(assert (=> b!157694 d!52670))

(declare-fun d!52672 () Bool)

(declare-datatypes ((tuple2!14296 0))(
  ( (tuple2!14297 (_1!7603 Unit!10425) (_2!7603 BitStream!5804)) )
))
(declare-fun moveByteIndex!0 (BitStream!5804 (_ BitVec 32)) tuple2!14296)

(assert (=> d!52672 (= (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7603 (moveByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun bs!12960 () Bool)

(assert (= bs!12960 d!52672))

(declare-fun m!246983 () Bool)

(assert (=> bs!12960 m!246983))

(assert (=> b!157694 d!52672))

(declare-fun d!52676 () Bool)

(declare-fun lt!247982 () tuple3!674)

(assert (=> d!52676 (= lt!247982 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!52676 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!14289 (_2!7601 lt!247982) (_3!454 lt!247982)))))

(declare-fun bs!12962 () Bool)

(assert (= bs!12962 d!52676))

(declare-fun m!246985 () Bool)

(assert (=> bs!12962 m!246985))

(assert (=> b!157694 d!52676))

(declare-fun d!52680 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!52680 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3306 (buf!3776 bs!65))) ((_ sign_extend 32) (currentByte!6930 bs!65)) ((_ sign_extend 32) (currentBit!6925 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3306 (buf!3776 bs!65))) ((_ sign_extend 32) (currentByte!6930 bs!65)) ((_ sign_extend 32) (currentBit!6925 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12963 () Bool)

(assert (= bs!12963 d!52680))

(declare-fun m!246987 () Bool)

(assert (=> bs!12963 m!246987))

(assert (=> b!157693 d!52680))

(push 1)

(assert (not d!52662))

(assert (not d!52680))

(assert (not d!52676))

(assert (not d!52672))

(assert (not d!52670))

(assert (not d!52664))

(assert (not d!52658))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!52700 () Bool)

(declare-fun e!106952 () Bool)

(assert (=> d!52700 e!106952))

(declare-fun res!131756 () Bool)

(assert (=> d!52700 (=> (not res!131756) (not e!106952))))

(declare-fun moveByteIndexPrecond!0 (BitStream!5804 (_ BitVec 32)) Bool)

(assert (=> d!52700 (= res!131756 (moveByteIndexPrecond!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun Unit!10429 () Unit!10425)

(assert (=> d!52700 (= (moveByteIndex!0 bs!65 #b00000000000000000000000000000001) (tuple2!14297 Unit!10429 (BitStream!5805 (buf!3776 bs!65) (bvadd (currentByte!6930 bs!65) #b00000000000000000000000000000001) (currentBit!6925 bs!65))))))

(declare-fun b!157699 () Bool)

(assert (=> b!157699 (= e!106952 (and (or (not (= (bvand (currentByte!6930 bs!65) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6930 bs!65) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6930 bs!65) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6930 bs!65) #b00000000000000000000000000000001) (bvadd (currentByte!6930 bs!65) #b00000000000000000000000000000001))))))

(assert (= (and d!52700 res!131756) b!157699))

(declare-fun m!247005 () Bool)

(assert (=> d!52700 m!247005))

(assert (=> d!52672 d!52700))

(declare-fun d!52702 () Bool)

(declare-fun lt!248006 () (_ BitVec 8))

(declare-fun lt!248011 () (_ BitVec 8))

(assert (=> d!52702 (= lt!248006 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4201 (buf!3776 bs!65)) (currentByte!6930 bs!65))) ((_ sign_extend 24) lt!248011))))))

(assert (=> d!52702 (= lt!248011 ((_ extract 7 0) (currentBit!6925 bs!65)))))

(declare-fun e!106958 () Bool)

(assert (=> d!52702 e!106958))

(declare-fun res!131762 () Bool)

(assert (=> d!52702 (=> (not res!131762) (not e!106958))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!52702 (= res!131762 (validate_offset_bits!1 ((_ sign_extend 32) (size!3306 (buf!3776 bs!65))) ((_ sign_extend 32) (currentByte!6930 bs!65)) ((_ sign_extend 32) (currentBit!6925 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!14302 0))(
  ( (tuple2!14303 (_1!7607 Unit!10425) (_2!7607 (_ BitVec 8))) )
))
(declare-fun Unit!10430 () Unit!10425)

(declare-fun Unit!10431 () Unit!10425)

(assert (=> d!52702 (= (readByte!0 bs!65) (tuple2!14293 (_2!7607 (ite (bvsgt ((_ sign_extend 24) lt!248011) #b00000000000000000000000000000000) (tuple2!14303 Unit!10430 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!248006) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4201 (buf!3776 bs!65)) (bvadd (currentByte!6930 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!248011)))))))) (tuple2!14303 Unit!10431 lt!248006))) (BitStream!5805 (buf!3776 bs!65) (bvadd (currentByte!6930 bs!65) #b00000000000000000000000000000001) (currentBit!6925 bs!65))))))

(declare-fun b!157704 () Bool)

(declare-fun e!106957 () Bool)

(assert (=> b!157704 (= e!106958 e!106957)))

(declare-fun res!131763 () Bool)

(assert (=> b!157704 (=> (not res!131763) (not e!106957))))

(declare-fun lt!248010 () tuple2!14292)

(assert (=> b!157704 (= res!131763 (= (buf!3776 (_2!7599 lt!248010)) (buf!3776 bs!65)))))

(declare-fun lt!248009 () (_ BitVec 8))

(declare-fun lt!248005 () (_ BitVec 8))

(declare-fun Unit!10432 () Unit!10425)

(declare-fun Unit!10433 () Unit!10425)

(assert (=> b!157704 (= lt!248010 (tuple2!14293 (_2!7607 (ite (bvsgt ((_ sign_extend 24) lt!248005) #b00000000000000000000000000000000) (tuple2!14303 Unit!10432 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!248009) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4201 (buf!3776 bs!65)) (bvadd (currentByte!6930 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!248005)))))))) (tuple2!14303 Unit!10433 lt!248009))) (BitStream!5805 (buf!3776 bs!65) (bvadd (currentByte!6930 bs!65) #b00000000000000000000000000000001) (currentBit!6925 bs!65))))))

(assert (=> b!157704 (= lt!248009 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4201 (buf!3776 bs!65)) (currentByte!6930 bs!65))) ((_ sign_extend 24) lt!248005))))))

(assert (=> b!157704 (= lt!248005 ((_ extract 7 0) (currentBit!6925 bs!65)))))

(declare-fun lt!248008 () (_ BitVec 64))

(declare-fun b!157705 () Bool)

(declare-fun lt!248007 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!157705 (= e!106957 (= (bitIndex!0 (size!3306 (buf!3776 (_2!7599 lt!248010))) (currentByte!6930 (_2!7599 lt!248010)) (currentBit!6925 (_2!7599 lt!248010))) (bvadd lt!248007 lt!248008)))))

(assert (=> b!157705 (or (not (= (bvand lt!248007 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!248008 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!248007 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!248007 lt!248008) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!157705 (= lt!248008 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!157705 (= lt!248007 (bitIndex!0 (size!3306 (buf!3776 bs!65)) (currentByte!6930 bs!65) (currentBit!6925 bs!65)))))

(assert (= (and d!52702 res!131762) b!157704))

(assert (= (and b!157704 res!131763) b!157705))

(declare-fun m!247007 () Bool)

(assert (=> d!52702 m!247007))

(declare-fun m!247009 () Bool)

(assert (=> d!52702 m!247009))

(declare-fun m!247011 () Bool)

(assert (=> d!52702 m!247011))

(assert (=> b!157704 m!247011))

(assert (=> b!157704 m!247007))

(declare-fun m!247013 () Bool)

(assert (=> b!157705 m!247013))

(declare-fun m!247015 () Bool)

(assert (=> b!157705 m!247015))

(assert (=> d!52670 d!52702))

(declare-fun d!52704 () Bool)

(assert (=> d!52704 (= (remainingBits!0 ((_ sign_extend 32) (size!3306 (buf!3776 bs!65))) ((_ sign_extend 32) (currentByte!6930 bs!65)) ((_ sign_extend 32) (currentBit!6925 bs!65))) (bvsub (bvmul ((_ sign_extend 32) (size!3306 (buf!3776 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6930 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6925 bs!65)))))))

(assert (=> d!52680 d!52704))

(declare-fun b!157725 () Bool)

(declare-fun res!131781 () Bool)

(declare-fun e!106976 () Bool)

(assert (=> b!157725 (=> (not res!131781) (not e!106976))))

(declare-fun lt!248128 () tuple3!674)

(assert (=> b!157725 (= res!131781 (and (= (buf!3776 lt!247966) (buf!3776 (_2!7601 lt!248128))) (= (size!3306 (array!7304 (store (arr!4201 arr!153) from!240 (_2!7596 (readBytePure!0 bs!65))) (size!3306 arr!153))) (size!3306 (_3!454 lt!248128)))))))

(declare-fun d!52706 () Bool)

(declare-fun e!106974 () Bool)

(assert (=> d!52706 e!106974))

(declare-fun res!131782 () Bool)

(assert (=> d!52706 (=> res!131782 e!106974)))

(assert (=> d!52706 (= res!131782 (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!248134 () Bool)

(assert (=> d!52706 (= lt!248134 e!106976)))

(declare-fun res!131780 () Bool)

(assert (=> d!52706 (=> (not res!131780) (not e!106976))))

(declare-fun lt!248123 () (_ BitVec 64))

(declare-fun lt!248115 () (_ BitVec 64))

(assert (=> d!52706 (= res!131780 (= (bvadd lt!248115 lt!248123) (bitIndex!0 (size!3306 (buf!3776 (_2!7601 lt!248128))) (currentByte!6930 (_2!7601 lt!248128)) (currentBit!6925 (_2!7601 lt!248128)))))))

(assert (=> d!52706 (or (not (= (bvand lt!248115 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!248123 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!248115 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!248115 lt!248123) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!248107 () (_ BitVec 64))

(assert (=> d!52706 (= lt!248123 (bvmul lt!248107 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!52706 (or (= lt!248107 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!248107 #b0000000000000000000000000000000000000000000000000000000000001000) lt!248107)))))

(assert (=> d!52706 (= lt!248107 ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))))))

(assert (=> d!52706 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!240) #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b10000000000000000000000000000000)))))

(assert (=> d!52706 (= lt!248115 (bitIndex!0 (size!3306 (buf!3776 lt!247966)) (currentByte!6930 lt!247966) (currentBit!6925 lt!247966)))))

(declare-fun e!106975 () tuple3!674)

(assert (=> d!52706 (= lt!248128 e!106975)))

(declare-fun c!8385 () Bool)

(assert (=> d!52706 (= c!8385 (bvslt (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52706 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsle (bvadd #b00000000000000000000000000000001 from!240) to!236) (bvsle to!236 (size!3306 (array!7304 (store (arr!4201 arr!153) from!240 (_2!7596 (readBytePure!0 bs!65))) (size!3306 arr!153)))))))

(assert (=> d!52706 (= (readByteArrayLoop!0 lt!247966 (array!7304 (store (arr!4201 arr!153) from!240 (_2!7596 (readBytePure!0 bs!65))) (size!3306 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) lt!248128)))

(declare-fun call!2589 () (_ BitVec 64))

(declare-fun bm!2586 () Bool)

(declare-fun lt!248140 () tuple3!674)

(assert (=> bm!2586 (= call!2589 (bitIndex!0 (ite c!8385 (size!3306 (buf!3776 (_2!7601 lt!248140))) (size!3306 (buf!3776 lt!247966))) (ite c!8385 (currentByte!6930 (_2!7601 lt!248140)) (currentByte!6930 lt!247966)) (ite c!8385 (currentBit!6925 (_2!7601 lt!248140)) (currentBit!6925 lt!247966))))))

(declare-fun b!157726 () Bool)

(assert (=> b!157726 (= e!106974 (= (select (arr!4201 (_3!454 lt!248128)) (bvadd #b00000000000000000000000000000001 from!240)) (_2!7596 (readBytePure!0 lt!247966))))))

(assert (=> b!157726 (and (bvsge (bvadd #b00000000000000000000000000000001 from!240) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!240) (size!3306 (_3!454 lt!248128))))))

(declare-fun lt!248110 () array!7303)

(declare-fun call!2591 () Bool)

(declare-fun lt!248124 () (_ BitVec 32))

(declare-fun bm!2587 () Bool)

(declare-fun lt!248127 () (_ BitVec 32))

(declare-fun lt!248121 () array!7303)

(declare-fun arrayRangesEq!440 (array!7303 array!7303 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2587 (= call!2591 (arrayRangesEq!440 (ite c!8385 (array!7304 (store (arr!4201 arr!153) from!240 (_2!7596 (readBytePure!0 bs!65))) (size!3306 arr!153)) lt!248121) (ite c!8385 (_3!454 lt!248140) lt!248110) (ite c!8385 #b00000000000000000000000000000000 lt!248124) (ite c!8385 (bvadd #b00000000000000000000000000000001 from!240) lt!248127)))))

(declare-fun b!157727 () Bool)

(assert (=> b!157727 (= e!106976 (arrayRangesEq!440 (array!7304 (store (arr!4201 arr!153) from!240 (_2!7596 (readBytePure!0 bs!65))) (size!3306 arr!153)) (_3!454 lt!248128) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!248114 () Unit!10425)

(declare-fun b!157728 () Bool)

(assert (=> b!157728 (= e!106975 (tuple3!675 lt!248114 lt!247966 (array!7304 (store (arr!4201 arr!153) from!240 (_2!7596 (readBytePure!0 bs!65))) (size!3306 arr!153))))))

(assert (=> b!157728 (= call!2589 call!2589)))

(declare-fun lt!248116 () Unit!10425)

(declare-fun Unit!10434 () Unit!10425)

(assert (=> b!157728 (= lt!248116 Unit!10434)))

(declare-fun lt!248132 () Unit!10425)

(declare-fun arrayRangesEqReflexiveLemma!48 (array!7303) Unit!10425)

(assert (=> b!157728 (= lt!248132 (arrayRangesEqReflexiveLemma!48 (array!7304 (store (arr!4201 arr!153) from!240 (_2!7596 (readBytePure!0 bs!65))) (size!3306 arr!153))))))

(declare-fun call!2590 () Bool)

(assert (=> b!157728 call!2590))

(declare-fun lt!248131 () Unit!10425)

(assert (=> b!157728 (= lt!248131 lt!248132)))

(assert (=> b!157728 (= lt!248121 (array!7304 (store (arr!4201 arr!153) from!240 (_2!7596 (readBytePure!0 bs!65))) (size!3306 arr!153)))))

(assert (=> b!157728 (= lt!248110 (array!7304 (store (arr!4201 arr!153) from!240 (_2!7596 (readBytePure!0 bs!65))) (size!3306 arr!153)))))

(declare-fun lt!248120 () (_ BitVec 32))

(assert (=> b!157728 (= lt!248120 #b00000000000000000000000000000000)))

(declare-fun lt!248109 () (_ BitVec 32))

(assert (=> b!157728 (= lt!248109 (size!3306 (array!7304 (store (arr!4201 arr!153) from!240 (_2!7596 (readBytePure!0 bs!65))) (size!3306 arr!153))))))

(assert (=> b!157728 (= lt!248124 #b00000000000000000000000000000000)))

(assert (=> b!157728 (= lt!248127 (bvadd #b00000000000000000000000000000001 from!240))))

(declare-fun arrayRangesEqSlicedLemma!48 (array!7303 array!7303 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10425)

(assert (=> b!157728 (= lt!248114 (arrayRangesEqSlicedLemma!48 lt!248121 lt!248110 lt!248120 lt!248109 lt!248124 lt!248127))))

(assert (=> b!157728 call!2591))

(declare-fun b!157729 () Bool)

(declare-fun lt!248106 () Unit!10425)

(assert (=> b!157729 (= e!106975 (tuple3!675 lt!248106 (_2!7601 lt!248140) (_3!454 lt!248140)))))

(declare-fun lt!248139 () tuple2!14292)

(assert (=> b!157729 (= lt!248139 (readByte!0 lt!247966))))

(declare-fun lt!248113 () array!7303)

(assert (=> b!157729 (= lt!248113 (array!7304 (store (arr!4201 (array!7304 (store (arr!4201 arr!153) from!240 (_2!7596 (readBytePure!0 bs!65))) (size!3306 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7599 lt!248139)) (size!3306 (array!7304 (store (arr!4201 arr!153) from!240 (_2!7596 (readBytePure!0 bs!65))) (size!3306 arr!153)))))))

(declare-fun lt!248130 () (_ BitVec 64))

(assert (=> b!157729 (= lt!248130 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!248136 () (_ BitVec 32))

(assert (=> b!157729 (= lt!248136 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!248117 () Unit!10425)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5804 BitStream!5804 (_ BitVec 64) (_ BitVec 32)) Unit!10425)

(assert (=> b!157729 (= lt!248117 (validateOffsetBytesFromBitIndexLemma!0 lt!247966 (_2!7599 lt!248139) lt!248130 lt!248136))))

(assert (=> b!157729 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3306 (buf!3776 (_2!7599 lt!248139)))) ((_ sign_extend 32) (currentByte!6930 (_2!7599 lt!248139))) ((_ sign_extend 32) (currentBit!6925 (_2!7599 lt!248139))) (bvsub lt!248136 ((_ extract 31 0) (bvsdiv (bvadd lt!248130 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!248105 () Unit!10425)

(assert (=> b!157729 (= lt!248105 lt!248117)))

(assert (=> b!157729 (= lt!248140 (readByteArrayLoop!0 (_2!7599 lt!248139) lt!248113 (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!157729 (= (bitIndex!0 (size!3306 (buf!3776 (_2!7599 lt!248139))) (currentByte!6930 (_2!7599 lt!248139)) (currentBit!6925 (_2!7599 lt!248139))) (bvadd (bitIndex!0 (size!3306 (buf!3776 lt!247966)) (currentByte!6930 lt!247966) (currentBit!6925 lt!247966)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!248137 () Unit!10425)

(declare-fun Unit!10435 () Unit!10425)

(assert (=> b!157729 (= lt!248137 Unit!10435)))

(assert (=> b!157729 (= (bvadd (bitIndex!0 (size!3306 (buf!3776 (_2!7599 lt!248139))) (currentByte!6930 (_2!7599 lt!248139)) (currentBit!6925 (_2!7599 lt!248139))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2589)))

(declare-fun lt!248122 () Unit!10425)

(declare-fun Unit!10436 () Unit!10425)

(assert (=> b!157729 (= lt!248122 Unit!10436)))

(assert (=> b!157729 (= (bvadd (bitIndex!0 (size!3306 (buf!3776 lt!247966)) (currentByte!6930 lt!247966) (currentBit!6925 lt!247966)) (bvmul ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2589)))

(declare-fun lt!248111 () Unit!10425)

(declare-fun Unit!10437 () Unit!10425)

(assert (=> b!157729 (= lt!248111 Unit!10437)))

(assert (=> b!157729 (and (= (buf!3776 lt!247966) (buf!3776 (_2!7601 lt!248140))) (= (size!3306 (array!7304 (store (arr!4201 arr!153) from!240 (_2!7596 (readBytePure!0 bs!65))) (size!3306 arr!153))) (size!3306 (_3!454 lt!248140))))))

(declare-fun lt!248133 () Unit!10425)

(declare-fun Unit!10438 () Unit!10425)

(assert (=> b!157729 (= lt!248133 Unit!10438)))

(declare-fun lt!248125 () Unit!10425)

(declare-fun arrayUpdatedAtPrefixLemma!48 (array!7303 (_ BitVec 32) (_ BitVec 8)) Unit!10425)

(assert (=> b!157729 (= lt!248125 (arrayUpdatedAtPrefixLemma!48 (array!7304 (store (arr!4201 arr!153) from!240 (_2!7596 (readBytePure!0 bs!65))) (size!3306 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) (_1!7599 lt!248139)))))

(assert (=> b!157729 call!2590))

(declare-fun lt!248126 () Unit!10425)

(assert (=> b!157729 (= lt!248126 lt!248125)))

(declare-fun lt!248135 () (_ BitVec 32))

(assert (=> b!157729 (= lt!248135 #b00000000000000000000000000000000)))

(declare-fun lt!248129 () Unit!10425)

(declare-fun arrayRangesEqTransitive!113 (array!7303 array!7303 array!7303 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10425)

(assert (=> b!157729 (= lt!248129 (arrayRangesEqTransitive!113 (array!7304 (store (arr!4201 arr!153) from!240 (_2!7596 (readBytePure!0 bs!65))) (size!3306 arr!153)) lt!248113 (_3!454 lt!248140) lt!248135 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157729 (arrayRangesEq!440 (array!7304 (store (arr!4201 arr!153) from!240 (_2!7596 (readBytePure!0 bs!65))) (size!3306 arr!153)) (_3!454 lt!248140) lt!248135 (bvadd #b00000000000000000000000000000001 from!240))))

(declare-fun lt!248119 () Unit!10425)

(assert (=> b!157729 (= lt!248119 lt!248129)))

(assert (=> b!157729 call!2591))

(declare-fun lt!248118 () Unit!10425)

(declare-fun Unit!10439 () Unit!10425)

(assert (=> b!157729 (= lt!248118 Unit!10439)))

(declare-fun lt!248138 () Unit!10425)

(declare-fun arrayRangesEqImpliesEq!57 (array!7303 array!7303 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10425)

(assert (=> b!157729 (= lt!248138 (arrayRangesEqImpliesEq!57 lt!248113 (_3!454 lt!248140) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157729 (= (select (store (arr!4201 (array!7304 (store (arr!4201 arr!153) from!240 (_2!7596 (readBytePure!0 bs!65))) (size!3306 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7599 lt!248139)) (bvadd #b00000000000000000000000000000001 from!240)) (select (arr!4201 (_3!454 lt!248140)) (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!248108 () Unit!10425)

(assert (=> b!157729 (= lt!248108 lt!248138)))

(declare-fun lt!248112 () Bool)

(assert (=> b!157729 (= lt!248112 (= (select (arr!4201 (_3!454 lt!248140)) (bvadd #b00000000000000000000000000000001 from!240)) (_1!7599 lt!248139)))))

(declare-fun Unit!10440 () Unit!10425)

(assert (=> b!157729 (= lt!248106 Unit!10440)))

(assert (=> b!157729 lt!248112))

(declare-fun bm!2588 () Bool)

(assert (=> bm!2588 (= call!2590 (arrayRangesEq!440 (array!7304 (store (arr!4201 arr!153) from!240 (_2!7596 (readBytePure!0 bs!65))) (size!3306 arr!153)) (ite c!8385 (array!7304 (store (arr!4201 (array!7304 (store (arr!4201 arr!153) from!240 (_2!7596 (readBytePure!0 bs!65))) (size!3306 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7599 lt!248139)) (size!3306 (array!7304 (store (arr!4201 arr!153) from!240 (_2!7596 (readBytePure!0 bs!65))) (size!3306 arr!153)))) (array!7304 (store (arr!4201 arr!153) from!240 (_2!7596 (readBytePure!0 bs!65))) (size!3306 arr!153))) #b00000000000000000000000000000000 (ite c!8385 (bvadd #b00000000000000000000000000000001 from!240) (size!3306 (array!7304 (store (arr!4201 arr!153) from!240 (_2!7596 (readBytePure!0 bs!65))) (size!3306 arr!153))))))))

(assert (= (and d!52706 c!8385) b!157729))

(assert (= (and d!52706 (not c!8385)) b!157728))

(assert (= (or b!157729 b!157728) bm!2587))

(assert (= (or b!157729 b!157728) bm!2588))

(assert (= (or b!157729 b!157728) bm!2586))

(assert (= (and d!52706 res!131780) b!157725))

(assert (= (and b!157725 res!131781) b!157727))

(assert (= (and d!52706 (not res!131782)) b!157726))

(declare-fun m!247029 () Bool)

(assert (=> b!157726 m!247029))

(assert (=> b!157726 m!246945))

(declare-fun m!247031 () Bool)

(assert (=> bm!2588 m!247031))

(declare-fun m!247033 () Bool)

(assert (=> bm!2588 m!247033))

(declare-fun m!247035 () Bool)

(assert (=> d!52706 m!247035))

(declare-fun m!247037 () Bool)

(assert (=> d!52706 m!247037))

(declare-fun m!247039 () Bool)

(assert (=> b!157728 m!247039))

(declare-fun m!247041 () Bool)

(assert (=> b!157728 m!247041))

(declare-fun m!247043 () Bool)

(assert (=> bm!2586 m!247043))

(declare-fun m!247045 () Bool)

(assert (=> b!157727 m!247045))

(declare-fun m!247047 () Bool)

(assert (=> b!157729 m!247047))

(declare-fun m!247049 () Bool)

(assert (=> b!157729 m!247049))

(declare-fun m!247051 () Bool)

(assert (=> b!157729 m!247051))

(declare-fun m!247053 () Bool)

(assert (=> b!157729 m!247053))

(declare-fun m!247055 () Bool)

(assert (=> b!157729 m!247055))

(declare-fun m!247057 () Bool)

(assert (=> b!157729 m!247057))

(declare-fun m!247059 () Bool)

(assert (=> b!157729 m!247059))

(assert (=> b!157729 m!247037))

(assert (=> b!157729 m!246969))

(declare-fun m!247061 () Bool)

(assert (=> b!157729 m!247061))

(assert (=> b!157729 m!247031))

(declare-fun m!247063 () Bool)

(assert (=> b!157729 m!247063))

(declare-fun m!247065 () Bool)

(assert (=> b!157729 m!247065))

(declare-fun m!247067 () Bool)

(assert (=> bm!2587 m!247067))

(assert (=> d!52664 d!52706))

(declare-fun d!52722 () Bool)

(assert (=> d!52722 (= (invariant!0 (currentBit!6925 bs!65) (currentByte!6930 bs!65) (size!3306 (buf!3776 bs!65))) (and (bvsge (currentBit!6925 bs!65) #b00000000000000000000000000000000) (bvslt (currentBit!6925 bs!65) #b00000000000000000000000000001000) (bvsge (currentByte!6930 bs!65) #b00000000000000000000000000000000) (or (bvslt (currentByte!6930 bs!65) (size!3306 (buf!3776 bs!65))) (and (= (currentBit!6925 bs!65) #b00000000000000000000000000000000) (= (currentByte!6930 bs!65) (size!3306 (buf!3776 bs!65)))))))))

(assert (=> d!52658 d!52722))

(declare-fun d!52724 () Bool)

(declare-fun lt!248142 () (_ BitVec 8))

(declare-fun lt!248147 () (_ BitVec 8))

(assert (=> d!52724 (= lt!248142 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4201 (buf!3776 lt!247966)) (currentByte!6930 lt!247966))) ((_ sign_extend 24) lt!248147))))))

(assert (=> d!52724 (= lt!248147 ((_ extract 7 0) (currentBit!6925 lt!247966)))))

(declare-fun e!106978 () Bool)

(assert (=> d!52724 e!106978))

(declare-fun res!131783 () Bool)

(assert (=> d!52724 (=> (not res!131783) (not e!106978))))

(assert (=> d!52724 (= res!131783 (validate_offset_bits!1 ((_ sign_extend 32) (size!3306 (buf!3776 lt!247966))) ((_ sign_extend 32) (currentByte!6930 lt!247966)) ((_ sign_extend 32) (currentBit!6925 lt!247966)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!10441 () Unit!10425)

(declare-fun Unit!10442 () Unit!10425)

(assert (=> d!52724 (= (readByte!0 lt!247966) (tuple2!14293 (_2!7607 (ite (bvsgt ((_ sign_extend 24) lt!248147) #b00000000000000000000000000000000) (tuple2!14303 Unit!10441 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!248142) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4201 (buf!3776 lt!247966)) (bvadd (currentByte!6930 lt!247966) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!248147)))))))) (tuple2!14303 Unit!10442 lt!248142))) (BitStream!5805 (buf!3776 lt!247966) (bvadd (currentByte!6930 lt!247966) #b00000000000000000000000000000001) (currentBit!6925 lt!247966))))))

(declare-fun b!157730 () Bool)

(declare-fun e!106977 () Bool)

(assert (=> b!157730 (= e!106978 e!106977)))

(declare-fun res!131784 () Bool)

(assert (=> b!157730 (=> (not res!131784) (not e!106977))))

(declare-fun lt!248146 () tuple2!14292)

(assert (=> b!157730 (= res!131784 (= (buf!3776 (_2!7599 lt!248146)) (buf!3776 lt!247966)))))

(declare-fun lt!248141 () (_ BitVec 8))

(declare-fun lt!248145 () (_ BitVec 8))

(declare-fun Unit!10443 () Unit!10425)

(declare-fun Unit!10444 () Unit!10425)

(assert (=> b!157730 (= lt!248146 (tuple2!14293 (_2!7607 (ite (bvsgt ((_ sign_extend 24) lt!248141) #b00000000000000000000000000000000) (tuple2!14303 Unit!10443 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!248145) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4201 (buf!3776 lt!247966)) (bvadd (currentByte!6930 lt!247966) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!248141)))))))) (tuple2!14303 Unit!10444 lt!248145))) (BitStream!5805 (buf!3776 lt!247966) (bvadd (currentByte!6930 lt!247966) #b00000000000000000000000000000001) (currentBit!6925 lt!247966))))))

(assert (=> b!157730 (= lt!248145 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4201 (buf!3776 lt!247966)) (currentByte!6930 lt!247966))) ((_ sign_extend 24) lt!248141))))))

(assert (=> b!157730 (= lt!248141 ((_ extract 7 0) (currentBit!6925 lt!247966)))))

(declare-fun lt!248143 () (_ BitVec 64))

(declare-fun b!157731 () Bool)

(declare-fun lt!248144 () (_ BitVec 64))

(assert (=> b!157731 (= e!106977 (= (bitIndex!0 (size!3306 (buf!3776 (_2!7599 lt!248146))) (currentByte!6930 (_2!7599 lt!248146)) (currentBit!6925 (_2!7599 lt!248146))) (bvadd lt!248143 lt!248144)))))

(assert (=> b!157731 (or (not (= (bvand lt!248143 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!248144 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!248143 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!248143 lt!248144) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!157731 (= lt!248144 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!157731 (= lt!248143 (bitIndex!0 (size!3306 (buf!3776 lt!247966)) (currentByte!6930 lt!247966) (currentBit!6925 lt!247966)))))

(assert (= (and d!52724 res!131783) b!157730))

(assert (= (and b!157730 res!131784) b!157731))

(declare-fun m!247069 () Bool)

(assert (=> d!52724 m!247069))

(declare-fun m!247071 () Bool)

(assert (=> d!52724 m!247071))

(declare-fun m!247073 () Bool)

(assert (=> d!52724 m!247073))

(assert (=> b!157730 m!247073))

(assert (=> b!157730 m!247069))

(declare-fun m!247075 () Bool)

(assert (=> b!157731 m!247075))

(assert (=> b!157731 m!247037))

(assert (=> d!52662 d!52724))

(declare-fun b!157732 () Bool)

(declare-fun res!131786 () Bool)

(declare-fun e!106981 () Bool)

(assert (=> b!157732 (=> (not res!131786) (not e!106981))))

(declare-fun lt!248171 () tuple3!674)

(assert (=> b!157732 (= res!131786 (and (= (buf!3776 bs!65) (buf!3776 (_2!7601 lt!248171))) (= (size!3306 arr!153) (size!3306 (_3!454 lt!248171)))))))

(declare-fun d!52726 () Bool)

(declare-fun e!106979 () Bool)

(assert (=> d!52726 e!106979))

(declare-fun res!131787 () Bool)

(assert (=> d!52726 (=> res!131787 e!106979)))

(assert (=> d!52726 (= res!131787 (bvsge from!240 to!236))))

(declare-fun lt!248177 () Bool)

(assert (=> d!52726 (= lt!248177 e!106981)))

(declare-fun res!131785 () Bool)

(assert (=> d!52726 (=> (not res!131785) (not e!106981))))

(declare-fun lt!248158 () (_ BitVec 64))

(declare-fun lt!248166 () (_ BitVec 64))

(assert (=> d!52726 (= res!131785 (= (bvadd lt!248158 lt!248166) (bitIndex!0 (size!3306 (buf!3776 (_2!7601 lt!248171))) (currentByte!6930 (_2!7601 lt!248171)) (currentBit!6925 (_2!7601 lt!248171)))))))

(assert (=> d!52726 (or (not (= (bvand lt!248158 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!248166 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!248158 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!248158 lt!248166) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!248150 () (_ BitVec 64))

(assert (=> d!52726 (= lt!248166 (bvmul lt!248150 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!52726 (or (= lt!248150 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!248150 #b0000000000000000000000000000000000000000000000000000000000001000) lt!248150)))))

(assert (=> d!52726 (= lt!248150 ((_ sign_extend 32) (bvsub to!236 from!240)))))

(assert (=> d!52726 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand from!240 #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000)))))

(assert (=> d!52726 (= lt!248158 (bitIndex!0 (size!3306 (buf!3776 bs!65)) (currentByte!6930 bs!65) (currentBit!6925 bs!65)))))

(declare-fun e!106980 () tuple3!674)

(assert (=> d!52726 (= lt!248171 e!106980)))

(declare-fun c!8386 () Bool)

(assert (=> d!52726 (= c!8386 (bvslt from!240 to!236))))

(assert (=> d!52726 (and (bvsle #b00000000000000000000000000000000 from!240) (bvsle from!240 to!236) (bvsle to!236 (size!3306 arr!153)))))

(assert (=> d!52726 (= (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236) lt!248171)))

(declare-fun call!2592 () (_ BitVec 64))

(declare-fun lt!248183 () tuple3!674)

(declare-fun bm!2589 () Bool)

(assert (=> bm!2589 (= call!2592 (bitIndex!0 (ite c!8386 (size!3306 (buf!3776 (_2!7601 lt!248183))) (size!3306 (buf!3776 bs!65))) (ite c!8386 (currentByte!6930 (_2!7601 lt!248183)) (currentByte!6930 bs!65)) (ite c!8386 (currentBit!6925 (_2!7601 lt!248183)) (currentBit!6925 bs!65))))))

(declare-fun b!157733 () Bool)

(assert (=> b!157733 (= e!106979 (= (select (arr!4201 (_3!454 lt!248171)) from!240) (_2!7596 (readBytePure!0 bs!65))))))

(assert (=> b!157733 (and (bvsge from!240 #b00000000000000000000000000000000) (bvslt from!240 (size!3306 (_3!454 lt!248171))))))

(declare-fun bm!2590 () Bool)

(declare-fun lt!248170 () (_ BitVec 32))

(declare-fun lt!248167 () (_ BitVec 32))

(declare-fun call!2594 () Bool)

(declare-fun lt!248153 () array!7303)

(declare-fun lt!248164 () array!7303)

(assert (=> bm!2590 (= call!2594 (arrayRangesEq!440 (ite c!8386 arr!153 lt!248164) (ite c!8386 (_3!454 lt!248183) lt!248153) (ite c!8386 #b00000000000000000000000000000000 lt!248167) (ite c!8386 from!240 lt!248170)))))

(declare-fun b!157734 () Bool)

(assert (=> b!157734 (= e!106981 (arrayRangesEq!440 arr!153 (_3!454 lt!248171) #b00000000000000000000000000000000 from!240))))

(declare-fun lt!248157 () Unit!10425)

(declare-fun b!157735 () Bool)

(assert (=> b!157735 (= e!106980 (tuple3!675 lt!248157 bs!65 arr!153))))

(assert (=> b!157735 (= call!2592 call!2592)))

(declare-fun lt!248159 () Unit!10425)

(declare-fun Unit!10445 () Unit!10425)

(assert (=> b!157735 (= lt!248159 Unit!10445)))

(declare-fun lt!248175 () Unit!10425)

(assert (=> b!157735 (= lt!248175 (arrayRangesEqReflexiveLemma!48 arr!153))))

(declare-fun call!2593 () Bool)

(assert (=> b!157735 call!2593))

(declare-fun lt!248174 () Unit!10425)

(assert (=> b!157735 (= lt!248174 lt!248175)))

(assert (=> b!157735 (= lt!248164 arr!153)))

(assert (=> b!157735 (= lt!248153 arr!153)))

(declare-fun lt!248163 () (_ BitVec 32))

(assert (=> b!157735 (= lt!248163 #b00000000000000000000000000000000)))

(declare-fun lt!248152 () (_ BitVec 32))

(assert (=> b!157735 (= lt!248152 (size!3306 arr!153))))

(assert (=> b!157735 (= lt!248167 #b00000000000000000000000000000000)))

(assert (=> b!157735 (= lt!248170 from!240)))

(assert (=> b!157735 (= lt!248157 (arrayRangesEqSlicedLemma!48 lt!248164 lt!248153 lt!248163 lt!248152 lt!248167 lt!248170))))

(assert (=> b!157735 call!2594))

(declare-fun b!157736 () Bool)

(declare-fun lt!248149 () Unit!10425)

(assert (=> b!157736 (= e!106980 (tuple3!675 lt!248149 (_2!7601 lt!248183) (_3!454 lt!248183)))))

(declare-fun lt!248182 () tuple2!14292)

(assert (=> b!157736 (= lt!248182 (readByte!0 bs!65))))

(declare-fun lt!248156 () array!7303)

(assert (=> b!157736 (= lt!248156 (array!7304 (store (arr!4201 arr!153) from!240 (_1!7599 lt!248182)) (size!3306 arr!153)))))

(declare-fun lt!248173 () (_ BitVec 64))

(assert (=> b!157736 (= lt!248173 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!248179 () (_ BitVec 32))

(assert (=> b!157736 (= lt!248179 (bvsub to!236 from!240))))

(declare-fun lt!248160 () Unit!10425)

(assert (=> b!157736 (= lt!248160 (validateOffsetBytesFromBitIndexLemma!0 bs!65 (_2!7599 lt!248182) lt!248173 lt!248179))))

(assert (=> b!157736 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3306 (buf!3776 (_2!7599 lt!248182)))) ((_ sign_extend 32) (currentByte!6930 (_2!7599 lt!248182))) ((_ sign_extend 32) (currentBit!6925 (_2!7599 lt!248182))) (bvsub lt!248179 ((_ extract 31 0) (bvsdiv (bvadd lt!248173 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!248148 () Unit!10425)

(assert (=> b!157736 (= lt!248148 lt!248160)))

(assert (=> b!157736 (= lt!248183 (readByteArrayLoop!0 (_2!7599 lt!248182) lt!248156 (bvadd from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!157736 (= (bitIndex!0 (size!3306 (buf!3776 (_2!7599 lt!248182))) (currentByte!6930 (_2!7599 lt!248182)) (currentBit!6925 (_2!7599 lt!248182))) (bvadd (bitIndex!0 (size!3306 (buf!3776 bs!65)) (currentByte!6930 bs!65) (currentBit!6925 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!248180 () Unit!10425)

(declare-fun Unit!10446 () Unit!10425)

(assert (=> b!157736 (= lt!248180 Unit!10446)))

(assert (=> b!157736 (= (bvadd (bitIndex!0 (size!3306 (buf!3776 (_2!7599 lt!248182))) (currentByte!6930 (_2!7599 lt!248182)) (currentBit!6925 (_2!7599 lt!248182))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2592)))

(declare-fun lt!248165 () Unit!10425)

(declare-fun Unit!10447 () Unit!10425)

(assert (=> b!157736 (= lt!248165 Unit!10447)))

(assert (=> b!157736 (= (bvadd (bitIndex!0 (size!3306 (buf!3776 bs!65)) (currentByte!6930 bs!65) (currentBit!6925 bs!65)) (bvmul ((_ sign_extend 32) (bvsub to!236 from!240)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2592)))

(declare-fun lt!248154 () Unit!10425)

(declare-fun Unit!10448 () Unit!10425)

(assert (=> b!157736 (= lt!248154 Unit!10448)))

(assert (=> b!157736 (and (= (buf!3776 bs!65) (buf!3776 (_2!7601 lt!248183))) (= (size!3306 arr!153) (size!3306 (_3!454 lt!248183))))))

(declare-fun lt!248176 () Unit!10425)

(declare-fun Unit!10449 () Unit!10425)

(assert (=> b!157736 (= lt!248176 Unit!10449)))

(declare-fun lt!248168 () Unit!10425)

(assert (=> b!157736 (= lt!248168 (arrayUpdatedAtPrefixLemma!48 arr!153 from!240 (_1!7599 lt!248182)))))

(assert (=> b!157736 call!2593))

(declare-fun lt!248169 () Unit!10425)

(assert (=> b!157736 (= lt!248169 lt!248168)))

(declare-fun lt!248178 () (_ BitVec 32))

(assert (=> b!157736 (= lt!248178 #b00000000000000000000000000000000)))

(declare-fun lt!248172 () Unit!10425)

(assert (=> b!157736 (= lt!248172 (arrayRangesEqTransitive!113 arr!153 lt!248156 (_3!454 lt!248183) lt!248178 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157736 (arrayRangesEq!440 arr!153 (_3!454 lt!248183) lt!248178 from!240)))

(declare-fun lt!248162 () Unit!10425)

(assert (=> b!157736 (= lt!248162 lt!248172)))

(assert (=> b!157736 call!2594))

(declare-fun lt!248161 () Unit!10425)

(declare-fun Unit!10450 () Unit!10425)

(assert (=> b!157736 (= lt!248161 Unit!10450)))

(declare-fun lt!248181 () Unit!10425)

(assert (=> b!157736 (= lt!248181 (arrayRangesEqImpliesEq!57 lt!248156 (_3!454 lt!248183) #b00000000000000000000000000000000 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157736 (= (select (store (arr!4201 arr!153) from!240 (_1!7599 lt!248182)) from!240) (select (arr!4201 (_3!454 lt!248183)) from!240))))

(declare-fun lt!248151 () Unit!10425)

(assert (=> b!157736 (= lt!248151 lt!248181)))

(declare-fun lt!248155 () Bool)

(assert (=> b!157736 (= lt!248155 (= (select (arr!4201 (_3!454 lt!248183)) from!240) (_1!7599 lt!248182)))))

(declare-fun Unit!10451 () Unit!10425)

(assert (=> b!157736 (= lt!248149 Unit!10451)))

(assert (=> b!157736 lt!248155))

(declare-fun bm!2591 () Bool)

(assert (=> bm!2591 (= call!2593 (arrayRangesEq!440 arr!153 (ite c!8386 (array!7304 (store (arr!4201 arr!153) from!240 (_1!7599 lt!248182)) (size!3306 arr!153)) arr!153) #b00000000000000000000000000000000 (ite c!8386 from!240 (size!3306 arr!153))))))

(assert (= (and d!52726 c!8386) b!157736))

(assert (= (and d!52726 (not c!8386)) b!157735))

(assert (= (or b!157736 b!157735) bm!2590))

(assert (= (or b!157736 b!157735) bm!2591))

(assert (= (or b!157736 b!157735) bm!2589))

(assert (= (and d!52726 res!131785) b!157732))

(assert (= (and b!157732 res!131786) b!157734))

(assert (= (and d!52726 (not res!131787)) b!157733))

(declare-fun m!247077 () Bool)

(assert (=> b!157733 m!247077))

(assert (=> b!157733 m!246953))

(declare-fun m!247079 () Bool)

(assert (=> bm!2591 m!247079))

(declare-fun m!247081 () Bool)

(assert (=> bm!2591 m!247081))

(declare-fun m!247083 () Bool)

(assert (=> d!52726 m!247083))

(assert (=> d!52726 m!247015))

(declare-fun m!247085 () Bool)

(assert (=> b!157735 m!247085))

(declare-fun m!247087 () Bool)

(assert (=> b!157735 m!247087))

(declare-fun m!247089 () Bool)

(assert (=> bm!2589 m!247089))

(declare-fun m!247091 () Bool)

(assert (=> b!157734 m!247091))

(declare-fun m!247093 () Bool)

(assert (=> b!157736 m!247093))

(declare-fun m!247095 () Bool)

(assert (=> b!157736 m!247095))

(declare-fun m!247097 () Bool)

(assert (=> b!157736 m!247097))

(declare-fun m!247099 () Bool)

(assert (=> b!157736 m!247099))

(declare-fun m!247101 () Bool)

(assert (=> b!157736 m!247101))

(declare-fun m!247103 () Bool)

(assert (=> b!157736 m!247103))

(declare-fun m!247105 () Bool)

(assert (=> b!157736 m!247105))

(assert (=> b!157736 m!247015))

(assert (=> b!157736 m!246977))

(declare-fun m!247107 () Bool)

(assert (=> b!157736 m!247107))

(assert (=> b!157736 m!247079))

(declare-fun m!247109 () Bool)

(assert (=> b!157736 m!247109))

(declare-fun m!247111 () Bool)

(assert (=> b!157736 m!247111))

(declare-fun m!247113 () Bool)

(assert (=> bm!2590 m!247113))

(assert (=> d!52676 d!52726))

(push 1)

(assert (not bm!2588))

(assert (not b!157705))

(assert (not d!52726))

(assert (not bm!2589))

(assert (not b!157726))

(assert (not b!157735))

(assert (not d!52706))

(assert (not bm!2591))

(assert (not bm!2586))

(assert (not bm!2587))

(assert (not b!157733))

(assert (not d!52700))

(assert (not b!157731))

(assert (not b!157736))

(assert (not d!52724))

(assert (not b!157734))

(assert (not bm!2590))

(assert (not b!157729))

(assert (not d!52702))

(assert (not b!157727))

(assert (not b!157728))

(check-sat)

(pop 1)

(push 1)

(check-sat)

