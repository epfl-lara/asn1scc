; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31398 () Bool)

(assert start!31398)

(declare-fun b!157682 () Bool)

(declare-fun e!106933 () Bool)

(declare-fun e!106930 () Bool)

(assert (=> b!157682 (= e!106933 e!106930)))

(declare-fun res!131742 () Bool)

(assert (=> b!157682 (=> (not res!131742) (not e!106930))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(assert (=> b!157682 (= res!131742 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((array!7301 0))(
  ( (array!7302 (arr!4200 (Array (_ BitVec 32) (_ BitVec 8))) (size!3305 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5802 0))(
  ( (BitStream!5803 (buf!3775 array!7301) (currentByte!6929 (_ BitVec 32)) (currentBit!6924 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5802)

(declare-fun lt!247954 () BitStream!5802)

(declare-datatypes ((tuple2!14282 0))(
  ( (tuple2!14283 (_1!7594 BitStream!5802) (_2!7594 array!7301)) )
))
(declare-fun lt!247952 () tuple2!14282)

(declare-fun arr!153 () array!7301)

(declare-fun readByteArrayLoopPure!0 (BitStream!5802 array!7301 (_ BitVec 32) (_ BitVec 32)) tuple2!14282)

(declare-datatypes ((tuple2!14284 0))(
  ( (tuple2!14285 (_1!7595 BitStream!5802) (_2!7595 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5802) tuple2!14284)

(assert (=> b!157682 (= lt!247952 (readByteArrayLoopPure!0 lt!247954 (array!7302 (store (arr!4200 arr!153) from!240 (_2!7595 (readBytePure!0 bs!65))) (size!3305 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5802 (_ BitVec 32)) BitStream!5802)

(assert (=> b!157682 (= lt!247954 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!247951 () tuple2!14282)

(assert (=> b!157682 (= lt!247951 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!157683 () Bool)

(assert (=> b!157683 (= e!106930 (not (= (size!3305 (buf!3775 bs!65)) (size!3305 (buf!3775 lt!247954)))))))

(declare-fun lt!247953 () tuple2!14284)

(assert (=> b!157683 (= lt!247953 (readBytePure!0 lt!247954))))

(declare-fun b!157684 () Bool)

(declare-fun e!106932 () Bool)

(declare-fun array_inv!3064 (array!7301) Bool)

(assert (=> b!157684 (= e!106932 (array_inv!3064 (buf!3775 bs!65)))))

(declare-fun res!131744 () Bool)

(assert (=> start!31398 (=> (not res!131744) (not e!106933))))

(assert (=> start!31398 (= res!131744 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3305 arr!153))))))

(assert (=> start!31398 e!106933))

(assert (=> start!31398 true))

(assert (=> start!31398 (array_inv!3064 arr!153)))

(declare-fun inv!12 (BitStream!5802) Bool)

(assert (=> start!31398 (and (inv!12 bs!65) e!106932)))

(declare-fun b!157681 () Bool)

(declare-fun res!131743 () Bool)

(assert (=> b!157681 (=> (not res!131743) (not e!106933))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157681 (= res!131743 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3305 (buf!3775 bs!65))) ((_ sign_extend 32) (currentByte!6929 bs!65)) ((_ sign_extend 32) (currentBit!6924 bs!65)) (bvsub to!236 from!240)))))

(assert (= (and start!31398 res!131744) b!157681))

(assert (= (and b!157681 res!131743) b!157682))

(assert (= (and b!157682 res!131742) b!157683))

(assert (= start!31398 b!157684))

(declare-fun m!246923 () Bool)

(assert (=> b!157684 m!246923))

(declare-fun m!246925 () Bool)

(assert (=> b!157682 m!246925))

(declare-fun m!246927 () Bool)

(assert (=> b!157682 m!246927))

(declare-fun m!246929 () Bool)

(assert (=> b!157682 m!246929))

(declare-fun m!246931 () Bool)

(assert (=> b!157682 m!246931))

(declare-fun m!246933 () Bool)

(assert (=> b!157682 m!246933))

(declare-fun m!246935 () Bool)

(assert (=> start!31398 m!246935))

(declare-fun m!246937 () Bool)

(assert (=> start!31398 m!246937))

(declare-fun m!246939 () Bool)

(assert (=> b!157681 m!246939))

(declare-fun m!246941 () Bool)

(assert (=> b!157683 m!246941))

(check-sat (not b!157683) (not b!157681) (not b!157682) (not start!31398) (not b!157684))
(check-sat)
(get-model)

(declare-fun d!52682 () Bool)

(declare-datatypes ((Unit!10427 0))(
  ( (Unit!10428) )
))
(declare-datatypes ((tuple3!676 0))(
  ( (tuple3!677 (_1!7604 Unit!10427) (_2!7604 BitStream!5802) (_3!455 array!7301)) )
))
(declare-fun lt!247985 () tuple3!676)

(declare-fun readByteArrayLoop!0 (BitStream!5802 array!7301 (_ BitVec 32) (_ BitVec 32)) tuple3!676)

(assert (=> d!52682 (= lt!247985 (readByteArrayLoop!0 lt!247954 (array!7302 (store (arr!4200 arr!153) from!240 (_2!7595 (readBytePure!0 bs!65))) (size!3305 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52682 (= (readByteArrayLoopPure!0 lt!247954 (array!7302 (store (arr!4200 arr!153) from!240 (_2!7595 (readBytePure!0 bs!65))) (size!3305 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) (tuple2!14283 (_2!7604 lt!247985) (_3!455 lt!247985)))))

(declare-fun bs!12965 () Bool)

(assert (= bs!12965 d!52682))

(declare-fun m!246991 () Bool)

(assert (=> bs!12965 m!246991))

(assert (=> b!157682 d!52682))

(declare-fun d!52684 () Bool)

(declare-datatypes ((tuple2!14298 0))(
  ( (tuple2!14299 (_1!7605 (_ BitVec 8)) (_2!7605 BitStream!5802)) )
))
(declare-fun lt!247988 () tuple2!14298)

(declare-fun readByte!0 (BitStream!5802) tuple2!14298)

(assert (=> d!52684 (= lt!247988 (readByte!0 bs!65))))

(assert (=> d!52684 (= (readBytePure!0 bs!65) (tuple2!14285 (_2!7605 lt!247988) (_1!7605 lt!247988)))))

(declare-fun bs!12966 () Bool)

(assert (= bs!12966 d!52684))

(declare-fun m!246993 () Bool)

(assert (=> bs!12966 m!246993))

(assert (=> b!157682 d!52684))

(declare-fun d!52686 () Bool)

(declare-datatypes ((tuple2!14300 0))(
  ( (tuple2!14301 (_1!7606 Unit!10427) (_2!7606 BitStream!5802)) )
))
(declare-fun moveByteIndex!0 (BitStream!5802 (_ BitVec 32)) tuple2!14300)

(assert (=> d!52686 (= (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7606 (moveByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun bs!12967 () Bool)

(assert (= bs!12967 d!52686))

(declare-fun m!246995 () Bool)

(assert (=> bs!12967 m!246995))

(assert (=> b!157682 d!52686))

(declare-fun lt!247989 () tuple3!676)

(declare-fun d!52688 () Bool)

(assert (=> d!52688 (= lt!247989 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!52688 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!14283 (_2!7604 lt!247989) (_3!455 lt!247989)))))

(declare-fun bs!12968 () Bool)

(assert (= bs!12968 d!52688))

(declare-fun m!246997 () Bool)

(assert (=> bs!12968 m!246997))

(assert (=> b!157682 d!52688))

(declare-fun d!52690 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!52690 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3305 (buf!3775 bs!65))) ((_ sign_extend 32) (currentByte!6929 bs!65)) ((_ sign_extend 32) (currentBit!6924 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3305 (buf!3775 bs!65))) ((_ sign_extend 32) (currentByte!6929 bs!65)) ((_ sign_extend 32) (currentBit!6924 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12969 () Bool)

(assert (= bs!12969 d!52690))

(declare-fun m!246999 () Bool)

(assert (=> bs!12969 m!246999))

(assert (=> b!157681 d!52690))

(declare-fun d!52692 () Bool)

(assert (=> d!52692 (= (array_inv!3064 (buf!3775 bs!65)) (bvsge (size!3305 (buf!3775 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!157684 d!52692))

(declare-fun d!52694 () Bool)

(assert (=> d!52694 (= (array_inv!3064 arr!153) (bvsge (size!3305 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!31398 d!52694))

(declare-fun d!52696 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!52696 (= (inv!12 bs!65) (invariant!0 (currentBit!6924 bs!65) (currentByte!6929 bs!65) (size!3305 (buf!3775 bs!65))))))

(declare-fun bs!12970 () Bool)

(assert (= bs!12970 d!52696))

(declare-fun m!247001 () Bool)

(assert (=> bs!12970 m!247001))

(assert (=> start!31398 d!52696))

(declare-fun d!52698 () Bool)

(declare-fun lt!247990 () tuple2!14298)

(assert (=> d!52698 (= lt!247990 (readByte!0 lt!247954))))

(assert (=> d!52698 (= (readBytePure!0 lt!247954) (tuple2!14285 (_2!7605 lt!247990) (_1!7605 lt!247990)))))

(declare-fun bs!12971 () Bool)

(assert (= bs!12971 d!52698))

(declare-fun m!247003 () Bool)

(assert (=> bs!12971 m!247003))

(assert (=> b!157683 d!52698))

(check-sat (not d!52684) (not d!52698) (not d!52688) (not d!52696) (not d!52686) (not d!52690) (not d!52682))
(check-sat)
(get-model)

(declare-fun d!52712 () Bool)

(assert (=> d!52712 (= (invariant!0 (currentBit!6924 bs!65) (currentByte!6929 bs!65) (size!3305 (buf!3775 bs!65))) (and (bvsge (currentBit!6924 bs!65) #b00000000000000000000000000000000) (bvslt (currentBit!6924 bs!65) #b00000000000000000000000000001000) (bvsge (currentByte!6929 bs!65) #b00000000000000000000000000000000) (or (bvslt (currentByte!6929 bs!65) (size!3305 (buf!3775 bs!65))) (and (= (currentBit!6924 bs!65) #b00000000000000000000000000000000) (= (currentByte!6929 bs!65) (size!3305 (buf!3775 bs!65)))))))))

(assert (=> d!52696 d!52712))

(declare-fun d!52714 () Bool)

(declare-fun lt!248028 () (_ BitVec 8))

(declare-fun lt!248031 () (_ BitVec 8))

(assert (=> d!52714 (= lt!248028 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4200 (buf!3775 bs!65)) (currentByte!6929 bs!65))) ((_ sign_extend 24) lt!248031))))))

(assert (=> d!52714 (= lt!248031 ((_ extract 7 0) (currentBit!6924 bs!65)))))

(declare-fun e!106963 () Bool)

(assert (=> d!52714 e!106963))

(declare-fun res!131769 () Bool)

(assert (=> d!52714 (=> (not res!131769) (not e!106963))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!52714 (= res!131769 (validate_offset_bits!1 ((_ sign_extend 32) (size!3305 (buf!3775 bs!65))) ((_ sign_extend 32) (currentByte!6929 bs!65)) ((_ sign_extend 32) (currentBit!6924 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!14304 0))(
  ( (tuple2!14305 (_1!7608 Unit!10427) (_2!7608 (_ BitVec 8))) )
))
(declare-fun Unit!10453 () Unit!10427)

(declare-fun Unit!10454 () Unit!10427)

(assert (=> d!52714 (= (readByte!0 bs!65) (tuple2!14299 (_2!7608 (ite (bvsgt ((_ sign_extend 24) lt!248031) #b00000000000000000000000000000000) (tuple2!14305 Unit!10453 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!248028) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4200 (buf!3775 bs!65)) (bvadd (currentByte!6929 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!248031)))))))) (tuple2!14305 Unit!10454 lt!248028))) (BitStream!5803 (buf!3775 bs!65) (bvadd (currentByte!6929 bs!65) #b00000000000000000000000000000001) (currentBit!6924 bs!65))))))

(declare-fun b!157710 () Bool)

(declare-fun e!106964 () Bool)

(assert (=> b!157710 (= e!106963 e!106964)))

(declare-fun res!131770 () Bool)

(assert (=> b!157710 (=> (not res!131770) (not e!106964))))

(declare-fun lt!248030 () tuple2!14298)

(assert (=> b!157710 (= res!131770 (= (buf!3775 (_2!7605 lt!248030)) (buf!3775 bs!65)))))

(declare-fun lt!248027 () (_ BitVec 8))

(declare-fun lt!248026 () (_ BitVec 8))

(declare-fun Unit!10457 () Unit!10427)

(declare-fun Unit!10458 () Unit!10427)

(assert (=> b!157710 (= lt!248030 (tuple2!14299 (_2!7608 (ite (bvsgt ((_ sign_extend 24) lt!248027) #b00000000000000000000000000000000) (tuple2!14305 Unit!10457 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!248026) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4200 (buf!3775 bs!65)) (bvadd (currentByte!6929 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!248027)))))))) (tuple2!14305 Unit!10458 lt!248026))) (BitStream!5803 (buf!3775 bs!65) (bvadd (currentByte!6929 bs!65) #b00000000000000000000000000000001) (currentBit!6924 bs!65))))))

(assert (=> b!157710 (= lt!248026 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4200 (buf!3775 bs!65)) (currentByte!6929 bs!65))) ((_ sign_extend 24) lt!248027))))))

(assert (=> b!157710 (= lt!248027 ((_ extract 7 0) (currentBit!6924 bs!65)))))

(declare-fun b!157711 () Bool)

(declare-fun lt!248029 () (_ BitVec 64))

(declare-fun lt!248032 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!157711 (= e!106964 (= (bitIndex!0 (size!3305 (buf!3775 (_2!7605 lt!248030))) (currentByte!6929 (_2!7605 lt!248030)) (currentBit!6924 (_2!7605 lt!248030))) (bvadd lt!248032 lt!248029)))))

(assert (=> b!157711 (or (not (= (bvand lt!248032 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!248029 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!248032 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!248032 lt!248029) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!157711 (= lt!248029 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!157711 (= lt!248032 (bitIndex!0 (size!3305 (buf!3775 bs!65)) (currentByte!6929 bs!65) (currentBit!6924 bs!65)))))

(assert (= (and d!52714 res!131769) b!157710))

(assert (= (and b!157710 res!131770) b!157711))

(declare-fun m!247017 () Bool)

(assert (=> d!52714 m!247017))

(declare-fun m!247019 () Bool)

(assert (=> d!52714 m!247019))

(declare-fun m!247021 () Bool)

(assert (=> d!52714 m!247021))

(assert (=> b!157710 m!247021))

(assert (=> b!157710 m!247017))

(declare-fun m!247023 () Bool)

(assert (=> b!157711 m!247023))

(declare-fun m!247025 () Bool)

(assert (=> b!157711 m!247025))

(assert (=> d!52684 d!52714))

(declare-fun d!52716 () Bool)

(declare-fun e!106967 () Bool)

(assert (=> d!52716 e!106967))

(declare-fun res!131773 () Bool)

(assert (=> d!52716 (=> (not res!131773) (not e!106967))))

(declare-fun moveByteIndexPrecond!0 (BitStream!5802 (_ BitVec 32)) Bool)

(assert (=> d!52716 (= res!131773 (moveByteIndexPrecond!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun Unit!10462 () Unit!10427)

(assert (=> d!52716 (= (moveByteIndex!0 bs!65 #b00000000000000000000000000000001) (tuple2!14301 Unit!10462 (BitStream!5803 (buf!3775 bs!65) (bvadd (currentByte!6929 bs!65) #b00000000000000000000000000000001) (currentBit!6924 bs!65))))))

(declare-fun b!157714 () Bool)

(assert (=> b!157714 (= e!106967 (and (or (not (= (bvand (currentByte!6929 bs!65) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6929 bs!65) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6929 bs!65) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6929 bs!65) #b00000000000000000000000000000001) (bvadd (currentByte!6929 bs!65) #b00000000000000000000000000000001))))))

(assert (= (and d!52716 res!131773) b!157714))

(declare-fun m!247027 () Bool)

(assert (=> d!52716 m!247027))

(assert (=> d!52686 d!52716))

(declare-fun d!52718 () Bool)

(assert (=> d!52718 (= (remainingBits!0 ((_ sign_extend 32) (size!3305 (buf!3775 bs!65))) ((_ sign_extend 32) (currentByte!6929 bs!65)) ((_ sign_extend 32) (currentBit!6924 bs!65))) (bvsub (bvmul ((_ sign_extend 32) (size!3305 (buf!3775 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6929 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6924 bs!65)))))))

(assert (=> d!52690 d!52718))

(declare-fun call!2613 () Bool)

(declare-fun lt!248452 () tuple2!14298)

(declare-fun bm!2610 () Bool)

(declare-fun c!8393 () Bool)

(declare-fun arrayRangesEq!442 (array!7301 array!7301 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2610 (= call!2613 (arrayRangesEq!442 arr!153 (ite c!8393 (array!7302 (store (arr!4200 arr!153) from!240 (_1!7605 lt!248452)) (size!3305 arr!153)) arr!153) #b00000000000000000000000000000000 (ite c!8393 from!240 (size!3305 arr!153))))))

(declare-fun lt!248463 () tuple3!676)

(declare-fun e!107012 () Bool)

(declare-fun b!157779 () Bool)

(assert (=> b!157779 (= e!107012 (= (select (arr!4200 (_3!455 lt!248463)) from!240) (_2!7595 (readBytePure!0 bs!65))))))

(assert (=> b!157779 (and (bvsge from!240 #b00000000000000000000000000000000) (bvslt from!240 (size!3305 (_3!455 lt!248463))))))

(declare-fun lt!248440 () tuple3!676)

(declare-fun bm!2611 () Bool)

(declare-fun call!2615 () (_ BitVec 64))

(assert (=> bm!2611 (= call!2615 (bitIndex!0 (ite c!8393 (size!3305 (buf!3775 (_2!7604 lt!248440))) (size!3305 (buf!3775 bs!65))) (ite c!8393 (currentByte!6929 (_2!7604 lt!248440)) (currentByte!6929 bs!65)) (ite c!8393 (currentBit!6924 (_2!7604 lt!248440)) (currentBit!6924 bs!65))))))

(declare-fun call!2614 () Bool)

(declare-fun lt!248434 () (_ BitVec 32))

(declare-fun bm!2612 () Bool)

(declare-fun lt!248449 () array!7301)

(declare-fun lt!248428 () (_ BitVec 32))

(declare-fun lt!248441 () (_ BitVec 32))

(declare-fun lt!248462 () array!7301)

(assert (=> bm!2612 (= call!2614 (arrayRangesEq!442 (ite c!8393 arr!153 lt!248462) (ite c!8393 (_3!455 lt!248440) lt!248449) (ite c!8393 lt!248441 lt!248428) (ite c!8393 from!240 lt!248434)))))

(declare-fun b!157780 () Bool)

(declare-fun e!107013 () tuple3!676)

(declare-fun lt!248429 () Unit!10427)

(assert (=> b!157780 (= e!107013 (tuple3!677 lt!248429 (_2!7604 lt!248440) (_3!455 lt!248440)))))

(assert (=> b!157780 (= lt!248452 (readByte!0 bs!65))))

(declare-fun lt!248459 () array!7301)

(assert (=> b!157780 (= lt!248459 (array!7302 (store (arr!4200 arr!153) from!240 (_1!7605 lt!248452)) (size!3305 arr!153)))))

(declare-fun lt!248447 () (_ BitVec 64))

(assert (=> b!157780 (= lt!248447 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!248438 () (_ BitVec 32))

(assert (=> b!157780 (= lt!248438 (bvsub to!236 from!240))))

(declare-fun lt!248451 () Unit!10427)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5802 BitStream!5802 (_ BitVec 64) (_ BitVec 32)) Unit!10427)

(assert (=> b!157780 (= lt!248451 (validateOffsetBytesFromBitIndexLemma!0 bs!65 (_2!7605 lt!248452) lt!248447 lt!248438))))

(assert (=> b!157780 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3305 (buf!3775 (_2!7605 lt!248452)))) ((_ sign_extend 32) (currentByte!6929 (_2!7605 lt!248452))) ((_ sign_extend 32) (currentBit!6924 (_2!7605 lt!248452))) (bvsub lt!248438 ((_ extract 31 0) (bvsdiv (bvadd lt!248447 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!248432 () Unit!10427)

(assert (=> b!157780 (= lt!248432 lt!248451)))

(assert (=> b!157780 (= lt!248440 (readByteArrayLoop!0 (_2!7605 lt!248452) lt!248459 (bvadd from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!157780 (= (bitIndex!0 (size!3305 (buf!3775 (_2!7605 lt!248452))) (currentByte!6929 (_2!7605 lt!248452)) (currentBit!6924 (_2!7605 lt!248452))) (bvadd (bitIndex!0 (size!3305 (buf!3775 bs!65)) (currentByte!6929 bs!65) (currentBit!6924 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!248448 () Unit!10427)

(declare-fun Unit!10464 () Unit!10427)

(assert (=> b!157780 (= lt!248448 Unit!10464)))

(assert (=> b!157780 (= (bvadd (bitIndex!0 (size!3305 (buf!3775 (_2!7605 lt!248452))) (currentByte!6929 (_2!7605 lt!248452)) (currentBit!6924 (_2!7605 lt!248452))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2615)))

(declare-fun lt!248446 () Unit!10427)

(declare-fun Unit!10465 () Unit!10427)

(assert (=> b!157780 (= lt!248446 Unit!10465)))

(assert (=> b!157780 (= (bvadd (bitIndex!0 (size!3305 (buf!3775 bs!65)) (currentByte!6929 bs!65) (currentBit!6924 bs!65)) (bvmul ((_ sign_extend 32) (bvsub to!236 from!240)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2615)))

(declare-fun lt!248455 () Unit!10427)

(declare-fun Unit!10466 () Unit!10427)

(assert (=> b!157780 (= lt!248455 Unit!10466)))

(assert (=> b!157780 (and (= (buf!3775 bs!65) (buf!3775 (_2!7604 lt!248440))) (= (size!3305 arr!153) (size!3305 (_3!455 lt!248440))))))

(declare-fun lt!248444 () Unit!10427)

(declare-fun Unit!10467 () Unit!10427)

(assert (=> b!157780 (= lt!248444 Unit!10467)))

(declare-fun lt!248439 () Unit!10427)

(declare-fun arrayUpdatedAtPrefixLemma!50 (array!7301 (_ BitVec 32) (_ BitVec 8)) Unit!10427)

(assert (=> b!157780 (= lt!248439 (arrayUpdatedAtPrefixLemma!50 arr!153 from!240 (_1!7605 lt!248452)))))

(assert (=> b!157780 call!2613))

(declare-fun lt!248437 () Unit!10427)

(assert (=> b!157780 (= lt!248437 lt!248439)))

(assert (=> b!157780 (= lt!248441 #b00000000000000000000000000000000)))

(declare-fun lt!248442 () Unit!10427)

(declare-fun arrayRangesEqTransitive!115 (array!7301 array!7301 array!7301 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10427)

(assert (=> b!157780 (= lt!248442 (arrayRangesEqTransitive!115 arr!153 lt!248459 (_3!455 lt!248440) lt!248441 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157780 call!2614))

(declare-fun lt!248431 () Unit!10427)

(assert (=> b!157780 (= lt!248431 lt!248442)))

(assert (=> b!157780 (arrayRangesEq!442 arr!153 (_3!455 lt!248440) #b00000000000000000000000000000000 from!240)))

(declare-fun lt!248450 () Unit!10427)

(declare-fun Unit!10469 () Unit!10427)

(assert (=> b!157780 (= lt!248450 Unit!10469)))

(declare-fun lt!248456 () Unit!10427)

(declare-fun arrayRangesEqImpliesEq!59 (array!7301 array!7301 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10427)

(assert (=> b!157780 (= lt!248456 (arrayRangesEqImpliesEq!59 lt!248459 (_3!455 lt!248440) #b00000000000000000000000000000000 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157780 (= (select (store (arr!4200 arr!153) from!240 (_1!7605 lt!248452)) from!240) (select (arr!4200 (_3!455 lt!248440)) from!240))))

(declare-fun lt!248453 () Unit!10427)

(assert (=> b!157780 (= lt!248453 lt!248456)))

(declare-fun lt!248433 () Bool)

(assert (=> b!157780 (= lt!248433 (= (select (arr!4200 (_3!455 lt!248440)) from!240) (_1!7605 lt!248452)))))

(declare-fun Unit!10470 () Unit!10427)

(assert (=> b!157780 (= lt!248429 Unit!10470)))

(assert (=> b!157780 lt!248433))

(declare-fun lt!248436 () Unit!10427)

(declare-fun b!157781 () Bool)

(assert (=> b!157781 (= e!107013 (tuple3!677 lt!248436 bs!65 arr!153))))

(assert (=> b!157781 (= call!2615 call!2615)))

(declare-fun lt!248430 () Unit!10427)

(declare-fun Unit!10471 () Unit!10427)

(assert (=> b!157781 (= lt!248430 Unit!10471)))

(declare-fun lt!248454 () Unit!10427)

(declare-fun arrayRangesEqReflexiveLemma!50 (array!7301) Unit!10427)

(assert (=> b!157781 (= lt!248454 (arrayRangesEqReflexiveLemma!50 arr!153))))

(assert (=> b!157781 call!2613))

(declare-fun lt!248461 () Unit!10427)

(assert (=> b!157781 (= lt!248461 lt!248454)))

(assert (=> b!157781 (= lt!248462 arr!153)))

(assert (=> b!157781 (= lt!248449 arr!153)))

(declare-fun lt!248460 () (_ BitVec 32))

(assert (=> b!157781 (= lt!248460 #b00000000000000000000000000000000)))

(declare-fun lt!248457 () (_ BitVec 32))

(assert (=> b!157781 (= lt!248457 (size!3305 arr!153))))

(assert (=> b!157781 (= lt!248428 #b00000000000000000000000000000000)))

(assert (=> b!157781 (= lt!248434 from!240)))

(declare-fun arrayRangesEqSlicedLemma!50 (array!7301 array!7301 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10427)

(assert (=> b!157781 (= lt!248436 (arrayRangesEqSlicedLemma!50 lt!248462 lt!248449 lt!248460 lt!248457 lt!248428 lt!248434))))

(assert (=> b!157781 call!2614))

(declare-fun b!157782 () Bool)

(declare-fun res!131820 () Bool)

(declare-fun e!107011 () Bool)

(assert (=> b!157782 (=> (not res!131820) (not e!107011))))

(assert (=> b!157782 (= res!131820 (and (= (buf!3775 bs!65) (buf!3775 (_2!7604 lt!248463))) (= (size!3305 arr!153) (size!3305 (_3!455 lt!248463)))))))

(declare-fun b!157778 () Bool)

(assert (=> b!157778 (= e!107011 (arrayRangesEq!442 arr!153 (_3!455 lt!248463) #b00000000000000000000000000000000 from!240))))

(declare-fun d!52720 () Bool)

(assert (=> d!52720 e!107012))

(declare-fun res!131818 () Bool)

(assert (=> d!52720 (=> res!131818 e!107012)))

(assert (=> d!52720 (= res!131818 (bvsge from!240 to!236))))

(declare-fun lt!248458 () Bool)

(assert (=> d!52720 (= lt!248458 e!107011)))

(declare-fun res!131819 () Bool)

(assert (=> d!52720 (=> (not res!131819) (not e!107011))))

(declare-fun lt!248445 () (_ BitVec 64))

(declare-fun lt!248435 () (_ BitVec 64))

(assert (=> d!52720 (= res!131819 (= (bvadd lt!248445 lt!248435) (bitIndex!0 (size!3305 (buf!3775 (_2!7604 lt!248463))) (currentByte!6929 (_2!7604 lt!248463)) (currentBit!6924 (_2!7604 lt!248463)))))))

(assert (=> d!52720 (or (not (= (bvand lt!248445 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!248435 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!248445 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!248445 lt!248435) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!248443 () (_ BitVec 64))

(assert (=> d!52720 (= lt!248435 (bvmul lt!248443 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!52720 (or (= lt!248443 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!248443 #b0000000000000000000000000000000000000000000000000000000000001000) lt!248443)))))

(assert (=> d!52720 (= lt!248443 ((_ sign_extend 32) (bvsub to!236 from!240)))))

(assert (=> d!52720 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand from!240 #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000)))))

(assert (=> d!52720 (= lt!248445 (bitIndex!0 (size!3305 (buf!3775 bs!65)) (currentByte!6929 bs!65) (currentBit!6924 bs!65)))))

(assert (=> d!52720 (= lt!248463 e!107013)))

(assert (=> d!52720 (= c!8393 (bvslt from!240 to!236))))

(assert (=> d!52720 (and (bvsle #b00000000000000000000000000000000 from!240) (bvsle from!240 to!236) (bvsle to!236 (size!3305 arr!153)))))

(assert (=> d!52720 (= (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236) lt!248463)))

(assert (= (and d!52720 c!8393) b!157780))

(assert (= (and d!52720 (not c!8393)) b!157781))

(assert (= (or b!157780 b!157781) bm!2612))

(assert (= (or b!157780 b!157781) bm!2610))

(assert (= (or b!157780 b!157781) bm!2611))

(assert (= (and d!52720 res!131819) b!157782))

(assert (= (and b!157782 res!131820) b!157778))

(assert (= (and d!52720 (not res!131818)) b!157779))

(declare-fun m!247213 () Bool)

(assert (=> b!157780 m!247213))

(declare-fun m!247215 () Bool)

(assert (=> b!157780 m!247215))

(declare-fun m!247217 () Bool)

(assert (=> b!157780 m!247217))

(assert (=> b!157780 m!247025))

(declare-fun m!247219 () Bool)

(assert (=> b!157780 m!247219))

(declare-fun m!247221 () Bool)

(assert (=> b!157780 m!247221))

(declare-fun m!247223 () Bool)

(assert (=> b!157780 m!247223))

(declare-fun m!247225 () Bool)

(assert (=> b!157780 m!247225))

(declare-fun m!247227 () Bool)

(assert (=> b!157780 m!247227))

(declare-fun m!247229 () Bool)

(assert (=> b!157780 m!247229))

(assert (=> b!157780 m!246993))

(declare-fun m!247231 () Bool)

(assert (=> b!157780 m!247231))

(declare-fun m!247233 () Bool)

(assert (=> b!157780 m!247233))

(declare-fun m!247235 () Bool)

(assert (=> bm!2611 m!247235))

(declare-fun m!247237 () Bool)

(assert (=> b!157779 m!247237))

(assert (=> b!157779 m!246927))

(declare-fun m!247239 () Bool)

(assert (=> b!157778 m!247239))

(declare-fun m!247241 () Bool)

(assert (=> d!52720 m!247241))

(assert (=> d!52720 m!247025))

(declare-fun m!247243 () Bool)

(assert (=> b!157781 m!247243))

(declare-fun m!247245 () Bool)

(assert (=> b!157781 m!247245))

(assert (=> bm!2610 m!247213))

(declare-fun m!247247 () Bool)

(assert (=> bm!2610 m!247247))

(declare-fun m!247249 () Bool)

(assert (=> bm!2612 m!247249))

(assert (=> d!52688 d!52720))

(declare-fun d!52738 () Bool)

(declare-fun lt!248466 () (_ BitVec 8))

(declare-fun lt!248469 () (_ BitVec 8))

(assert (=> d!52738 (= lt!248466 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4200 (buf!3775 lt!247954)) (currentByte!6929 lt!247954))) ((_ sign_extend 24) lt!248469))))))

(assert (=> d!52738 (= lt!248469 ((_ extract 7 0) (currentBit!6924 lt!247954)))))

(declare-fun e!107014 () Bool)

(assert (=> d!52738 e!107014))

(declare-fun res!131821 () Bool)

(assert (=> d!52738 (=> (not res!131821) (not e!107014))))

(assert (=> d!52738 (= res!131821 (validate_offset_bits!1 ((_ sign_extend 32) (size!3305 (buf!3775 lt!247954))) ((_ sign_extend 32) (currentByte!6929 lt!247954)) ((_ sign_extend 32) (currentBit!6924 lt!247954)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!10476 () Unit!10427)

(declare-fun Unit!10477 () Unit!10427)

(assert (=> d!52738 (= (readByte!0 lt!247954) (tuple2!14299 (_2!7608 (ite (bvsgt ((_ sign_extend 24) lt!248469) #b00000000000000000000000000000000) (tuple2!14305 Unit!10476 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!248466) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4200 (buf!3775 lt!247954)) (bvadd (currentByte!6929 lt!247954) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!248469)))))))) (tuple2!14305 Unit!10477 lt!248466))) (BitStream!5803 (buf!3775 lt!247954) (bvadd (currentByte!6929 lt!247954) #b00000000000000000000000000000001) (currentBit!6924 lt!247954))))))

(declare-fun b!157783 () Bool)

(declare-fun e!107015 () Bool)

(assert (=> b!157783 (= e!107014 e!107015)))

(declare-fun res!131822 () Bool)

(assert (=> b!157783 (=> (not res!131822) (not e!107015))))

(declare-fun lt!248468 () tuple2!14298)

(assert (=> b!157783 (= res!131822 (= (buf!3775 (_2!7605 lt!248468)) (buf!3775 lt!247954)))))

(declare-fun lt!248464 () (_ BitVec 8))

(declare-fun lt!248465 () (_ BitVec 8))

(declare-fun Unit!10480 () Unit!10427)

(declare-fun Unit!10481 () Unit!10427)

(assert (=> b!157783 (= lt!248468 (tuple2!14299 (_2!7608 (ite (bvsgt ((_ sign_extend 24) lt!248465) #b00000000000000000000000000000000) (tuple2!14305 Unit!10480 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!248464) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4200 (buf!3775 lt!247954)) (bvadd (currentByte!6929 lt!247954) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!248465)))))))) (tuple2!14305 Unit!10481 lt!248464))) (BitStream!5803 (buf!3775 lt!247954) (bvadd (currentByte!6929 lt!247954) #b00000000000000000000000000000001) (currentBit!6924 lt!247954))))))

(assert (=> b!157783 (= lt!248464 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4200 (buf!3775 lt!247954)) (currentByte!6929 lt!247954))) ((_ sign_extend 24) lt!248465))))))

(assert (=> b!157783 (= lt!248465 ((_ extract 7 0) (currentBit!6924 lt!247954)))))

(declare-fun lt!248467 () (_ BitVec 64))

(declare-fun b!157784 () Bool)

(declare-fun lt!248470 () (_ BitVec 64))

(assert (=> b!157784 (= e!107015 (= (bitIndex!0 (size!3305 (buf!3775 (_2!7605 lt!248468))) (currentByte!6929 (_2!7605 lt!248468)) (currentBit!6924 (_2!7605 lt!248468))) (bvadd lt!248470 lt!248467)))))

(assert (=> b!157784 (or (not (= (bvand lt!248470 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!248467 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!248470 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!248470 lt!248467) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!157784 (= lt!248467 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!157784 (= lt!248470 (bitIndex!0 (size!3305 (buf!3775 lt!247954)) (currentByte!6929 lt!247954) (currentBit!6924 lt!247954)))))

(assert (= (and d!52738 res!131821) b!157783))

(assert (= (and b!157783 res!131822) b!157784))

(declare-fun m!247251 () Bool)

(assert (=> d!52738 m!247251))

(declare-fun m!247253 () Bool)

(assert (=> d!52738 m!247253))

(declare-fun m!247255 () Bool)

(assert (=> d!52738 m!247255))

(assert (=> b!157783 m!247255))

(assert (=> b!157783 m!247251))

(declare-fun m!247257 () Bool)

(assert (=> b!157784 m!247257))

(declare-fun m!247259 () Bool)

(assert (=> b!157784 m!247259))

(assert (=> d!52698 d!52738))

(declare-fun c!8394 () Bool)

(declare-fun lt!248495 () tuple2!14298)

(declare-fun call!2616 () Bool)

(declare-fun bm!2613 () Bool)

(assert (=> bm!2613 (= call!2616 (arrayRangesEq!442 (array!7302 (store (arr!4200 arr!153) from!240 (_2!7595 (readBytePure!0 bs!65))) (size!3305 arr!153)) (ite c!8394 (array!7302 (store (arr!4200 (array!7302 (store (arr!4200 arr!153) from!240 (_2!7595 (readBytePure!0 bs!65))) (size!3305 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7605 lt!248495)) (size!3305 (array!7302 (store (arr!4200 arr!153) from!240 (_2!7595 (readBytePure!0 bs!65))) (size!3305 arr!153)))) (array!7302 (store (arr!4200 arr!153) from!240 (_2!7595 (readBytePure!0 bs!65))) (size!3305 arr!153))) #b00000000000000000000000000000000 (ite c!8394 (bvadd #b00000000000000000000000000000001 from!240) (size!3305 (array!7302 (store (arr!4200 arr!153) from!240 (_2!7595 (readBytePure!0 bs!65))) (size!3305 arr!153))))))))

(declare-fun e!107017 () Bool)

(declare-fun b!157786 () Bool)

(declare-fun lt!248506 () tuple3!676)

(assert (=> b!157786 (= e!107017 (= (select (arr!4200 (_3!455 lt!248506)) (bvadd #b00000000000000000000000000000001 from!240)) (_2!7595 (readBytePure!0 lt!247954))))))

(assert (=> b!157786 (and (bvsge (bvadd #b00000000000000000000000000000001 from!240) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!240) (size!3305 (_3!455 lt!248506))))))

(declare-fun lt!248483 () tuple3!676)

(declare-fun call!2618 () (_ BitVec 64))

(declare-fun bm!2614 () Bool)

(assert (=> bm!2614 (= call!2618 (bitIndex!0 (ite c!8394 (size!3305 (buf!3775 (_2!7604 lt!248483))) (size!3305 (buf!3775 lt!247954))) (ite c!8394 (currentByte!6929 (_2!7604 lt!248483)) (currentByte!6929 lt!247954)) (ite c!8394 (currentBit!6924 (_2!7604 lt!248483)) (currentBit!6924 lt!247954))))))

(declare-fun lt!248505 () array!7301)

(declare-fun lt!248484 () (_ BitVec 32))

(declare-fun lt!248492 () array!7301)

(declare-fun call!2617 () Bool)

(declare-fun lt!248477 () (_ BitVec 32))

(declare-fun bm!2615 () Bool)

(declare-fun lt!248471 () (_ BitVec 32))

(assert (=> bm!2615 (= call!2617 (arrayRangesEq!442 (ite c!8394 (array!7302 (store (arr!4200 arr!153) from!240 (_2!7595 (readBytePure!0 bs!65))) (size!3305 arr!153)) lt!248505) (ite c!8394 (_3!455 lt!248483) lt!248492) (ite c!8394 lt!248484 lt!248471) (ite c!8394 (bvadd #b00000000000000000000000000000001 from!240) lt!248477)))))

(declare-fun b!157787 () Bool)

(declare-fun e!107018 () tuple3!676)

(declare-fun lt!248472 () Unit!10427)

(assert (=> b!157787 (= e!107018 (tuple3!677 lt!248472 (_2!7604 lt!248483) (_3!455 lt!248483)))))

(assert (=> b!157787 (= lt!248495 (readByte!0 lt!247954))))

(declare-fun lt!248502 () array!7301)

(assert (=> b!157787 (= lt!248502 (array!7302 (store (arr!4200 (array!7302 (store (arr!4200 arr!153) from!240 (_2!7595 (readBytePure!0 bs!65))) (size!3305 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7605 lt!248495)) (size!3305 (array!7302 (store (arr!4200 arr!153) from!240 (_2!7595 (readBytePure!0 bs!65))) (size!3305 arr!153)))))))

(declare-fun lt!248490 () (_ BitVec 64))

(assert (=> b!157787 (= lt!248490 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!248481 () (_ BitVec 32))

(assert (=> b!157787 (= lt!248481 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!248494 () Unit!10427)

(assert (=> b!157787 (= lt!248494 (validateOffsetBytesFromBitIndexLemma!0 lt!247954 (_2!7605 lt!248495) lt!248490 lt!248481))))

(assert (=> b!157787 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3305 (buf!3775 (_2!7605 lt!248495)))) ((_ sign_extend 32) (currentByte!6929 (_2!7605 lt!248495))) ((_ sign_extend 32) (currentBit!6924 (_2!7605 lt!248495))) (bvsub lt!248481 ((_ extract 31 0) (bvsdiv (bvadd lt!248490 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!248475 () Unit!10427)

(assert (=> b!157787 (= lt!248475 lt!248494)))

(assert (=> b!157787 (= lt!248483 (readByteArrayLoop!0 (_2!7605 lt!248495) lt!248502 (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!157787 (= (bitIndex!0 (size!3305 (buf!3775 (_2!7605 lt!248495))) (currentByte!6929 (_2!7605 lt!248495)) (currentBit!6924 (_2!7605 lt!248495))) (bvadd (bitIndex!0 (size!3305 (buf!3775 lt!247954)) (currentByte!6929 lt!247954) (currentBit!6924 lt!247954)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!248491 () Unit!10427)

(declare-fun Unit!10483 () Unit!10427)

(assert (=> b!157787 (= lt!248491 Unit!10483)))

(assert (=> b!157787 (= (bvadd (bitIndex!0 (size!3305 (buf!3775 (_2!7605 lt!248495))) (currentByte!6929 (_2!7605 lt!248495)) (currentBit!6924 (_2!7605 lt!248495))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2618)))

(declare-fun lt!248489 () Unit!10427)

(declare-fun Unit!10486 () Unit!10427)

(assert (=> b!157787 (= lt!248489 Unit!10486)))

(assert (=> b!157787 (= (bvadd (bitIndex!0 (size!3305 (buf!3775 lt!247954)) (currentByte!6929 lt!247954) (currentBit!6924 lt!247954)) (bvmul ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2618)))

(declare-fun lt!248498 () Unit!10427)

(declare-fun Unit!10487 () Unit!10427)

(assert (=> b!157787 (= lt!248498 Unit!10487)))

(assert (=> b!157787 (and (= (buf!3775 lt!247954) (buf!3775 (_2!7604 lt!248483))) (= (size!3305 (array!7302 (store (arr!4200 arr!153) from!240 (_2!7595 (readBytePure!0 bs!65))) (size!3305 arr!153))) (size!3305 (_3!455 lt!248483))))))

(declare-fun lt!248487 () Unit!10427)

(declare-fun Unit!10488 () Unit!10427)

(assert (=> b!157787 (= lt!248487 Unit!10488)))

(declare-fun lt!248482 () Unit!10427)

(assert (=> b!157787 (= lt!248482 (arrayUpdatedAtPrefixLemma!50 (array!7302 (store (arr!4200 arr!153) from!240 (_2!7595 (readBytePure!0 bs!65))) (size!3305 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) (_1!7605 lt!248495)))))

(assert (=> b!157787 call!2616))

(declare-fun lt!248480 () Unit!10427)

(assert (=> b!157787 (= lt!248480 lt!248482)))

(assert (=> b!157787 (= lt!248484 #b00000000000000000000000000000000)))

(declare-fun lt!248485 () Unit!10427)

(assert (=> b!157787 (= lt!248485 (arrayRangesEqTransitive!115 (array!7302 (store (arr!4200 arr!153) from!240 (_2!7595 (readBytePure!0 bs!65))) (size!3305 arr!153)) lt!248502 (_3!455 lt!248483) lt!248484 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157787 call!2617))

(declare-fun lt!248474 () Unit!10427)

(assert (=> b!157787 (= lt!248474 lt!248485)))

(assert (=> b!157787 (arrayRangesEq!442 (array!7302 (store (arr!4200 arr!153) from!240 (_2!7595 (readBytePure!0 bs!65))) (size!3305 arr!153)) (_3!455 lt!248483) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240))))

(declare-fun lt!248493 () Unit!10427)

(declare-fun Unit!10491 () Unit!10427)

(assert (=> b!157787 (= lt!248493 Unit!10491)))

(declare-fun lt!248499 () Unit!10427)

(assert (=> b!157787 (= lt!248499 (arrayRangesEqImpliesEq!59 lt!248502 (_3!455 lt!248483) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157787 (= (select (store (arr!4200 (array!7302 (store (arr!4200 arr!153) from!240 (_2!7595 (readBytePure!0 bs!65))) (size!3305 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7605 lt!248495)) (bvadd #b00000000000000000000000000000001 from!240)) (select (arr!4200 (_3!455 lt!248483)) (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!248496 () Unit!10427)

(assert (=> b!157787 (= lt!248496 lt!248499)))

(declare-fun lt!248476 () Bool)

(assert (=> b!157787 (= lt!248476 (= (select (arr!4200 (_3!455 lt!248483)) (bvadd #b00000000000000000000000000000001 from!240)) (_1!7605 lt!248495)))))

(declare-fun Unit!10492 () Unit!10427)

(assert (=> b!157787 (= lt!248472 Unit!10492)))

(assert (=> b!157787 lt!248476))

(declare-fun lt!248479 () Unit!10427)

(declare-fun b!157788 () Bool)

(assert (=> b!157788 (= e!107018 (tuple3!677 lt!248479 lt!247954 (array!7302 (store (arr!4200 arr!153) from!240 (_2!7595 (readBytePure!0 bs!65))) (size!3305 arr!153))))))

(assert (=> b!157788 (= call!2618 call!2618)))

(declare-fun lt!248473 () Unit!10427)

(declare-fun Unit!10493 () Unit!10427)

(assert (=> b!157788 (= lt!248473 Unit!10493)))

(declare-fun lt!248497 () Unit!10427)

(assert (=> b!157788 (= lt!248497 (arrayRangesEqReflexiveLemma!50 (array!7302 (store (arr!4200 arr!153) from!240 (_2!7595 (readBytePure!0 bs!65))) (size!3305 arr!153))))))

(assert (=> b!157788 call!2616))

(declare-fun lt!248504 () Unit!10427)

(assert (=> b!157788 (= lt!248504 lt!248497)))

(assert (=> b!157788 (= lt!248505 (array!7302 (store (arr!4200 arr!153) from!240 (_2!7595 (readBytePure!0 bs!65))) (size!3305 arr!153)))))

(assert (=> b!157788 (= lt!248492 (array!7302 (store (arr!4200 arr!153) from!240 (_2!7595 (readBytePure!0 bs!65))) (size!3305 arr!153)))))

(declare-fun lt!248503 () (_ BitVec 32))

(assert (=> b!157788 (= lt!248503 #b00000000000000000000000000000000)))

(declare-fun lt!248500 () (_ BitVec 32))

(assert (=> b!157788 (= lt!248500 (size!3305 (array!7302 (store (arr!4200 arr!153) from!240 (_2!7595 (readBytePure!0 bs!65))) (size!3305 arr!153))))))

(assert (=> b!157788 (= lt!248471 #b00000000000000000000000000000000)))

(assert (=> b!157788 (= lt!248477 (bvadd #b00000000000000000000000000000001 from!240))))

(assert (=> b!157788 (= lt!248479 (arrayRangesEqSlicedLemma!50 lt!248505 lt!248492 lt!248503 lt!248500 lt!248471 lt!248477))))

(assert (=> b!157788 call!2617))

(declare-fun b!157789 () Bool)

(declare-fun res!131825 () Bool)

(declare-fun e!107016 () Bool)

(assert (=> b!157789 (=> (not res!131825) (not e!107016))))

(assert (=> b!157789 (= res!131825 (and (= (buf!3775 lt!247954) (buf!3775 (_2!7604 lt!248506))) (= (size!3305 (array!7302 (store (arr!4200 arr!153) from!240 (_2!7595 (readBytePure!0 bs!65))) (size!3305 arr!153))) (size!3305 (_3!455 lt!248506)))))))

(declare-fun b!157785 () Bool)

(assert (=> b!157785 (= e!107016 (arrayRangesEq!442 (array!7302 (store (arr!4200 arr!153) from!240 (_2!7595 (readBytePure!0 bs!65))) (size!3305 arr!153)) (_3!455 lt!248506) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun d!52740 () Bool)

(assert (=> d!52740 e!107017))

(declare-fun res!131823 () Bool)

(assert (=> d!52740 (=> res!131823 e!107017)))

(assert (=> d!52740 (= res!131823 (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!248501 () Bool)

(assert (=> d!52740 (= lt!248501 e!107016)))

(declare-fun res!131824 () Bool)

(assert (=> d!52740 (=> (not res!131824) (not e!107016))))

(declare-fun lt!248478 () (_ BitVec 64))

(declare-fun lt!248488 () (_ BitVec 64))

(assert (=> d!52740 (= res!131824 (= (bvadd lt!248488 lt!248478) (bitIndex!0 (size!3305 (buf!3775 (_2!7604 lt!248506))) (currentByte!6929 (_2!7604 lt!248506)) (currentBit!6924 (_2!7604 lt!248506)))))))

(assert (=> d!52740 (or (not (= (bvand lt!248488 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!248478 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!248488 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!248488 lt!248478) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!248486 () (_ BitVec 64))

(assert (=> d!52740 (= lt!248478 (bvmul lt!248486 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!52740 (or (= lt!248486 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!248486 #b0000000000000000000000000000000000000000000000000000000000001000) lt!248486)))))

(assert (=> d!52740 (= lt!248486 ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))))))

(assert (=> d!52740 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!240) #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b10000000000000000000000000000000)))))

(assert (=> d!52740 (= lt!248488 (bitIndex!0 (size!3305 (buf!3775 lt!247954)) (currentByte!6929 lt!247954) (currentBit!6924 lt!247954)))))

(assert (=> d!52740 (= lt!248506 e!107018)))

(assert (=> d!52740 (= c!8394 (bvslt (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52740 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsle (bvadd #b00000000000000000000000000000001 from!240) to!236) (bvsle to!236 (size!3305 (array!7302 (store (arr!4200 arr!153) from!240 (_2!7595 (readBytePure!0 bs!65))) (size!3305 arr!153)))))))

(assert (=> d!52740 (= (readByteArrayLoop!0 lt!247954 (array!7302 (store (arr!4200 arr!153) from!240 (_2!7595 (readBytePure!0 bs!65))) (size!3305 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) lt!248506)))

(assert (= (and d!52740 c!8394) b!157787))

(assert (= (and d!52740 (not c!8394)) b!157788))

(assert (= (or b!157787 b!157788) bm!2615))

(assert (= (or b!157787 b!157788) bm!2613))

(assert (= (or b!157787 b!157788) bm!2614))

(assert (= (and d!52740 res!131824) b!157789))

(assert (= (and b!157789 res!131825) b!157785))

(assert (= (and d!52740 (not res!131823)) b!157786))

(declare-fun m!247261 () Bool)

(assert (=> b!157787 m!247261))

(declare-fun m!247263 () Bool)

(assert (=> b!157787 m!247263))

(declare-fun m!247265 () Bool)

(assert (=> b!157787 m!247265))

(assert (=> b!157787 m!247259))

(declare-fun m!247267 () Bool)

(assert (=> b!157787 m!247267))

(declare-fun m!247269 () Bool)

(assert (=> b!157787 m!247269))

(declare-fun m!247271 () Bool)

(assert (=> b!157787 m!247271))

(declare-fun m!247273 () Bool)

(assert (=> b!157787 m!247273))

(declare-fun m!247275 () Bool)

(assert (=> b!157787 m!247275))

(declare-fun m!247277 () Bool)

(assert (=> b!157787 m!247277))

(assert (=> b!157787 m!247003))

(declare-fun m!247279 () Bool)

(assert (=> b!157787 m!247279))

(declare-fun m!247281 () Bool)

(assert (=> b!157787 m!247281))

(declare-fun m!247283 () Bool)

(assert (=> bm!2614 m!247283))

(declare-fun m!247285 () Bool)

(assert (=> b!157786 m!247285))

(assert (=> b!157786 m!246941))

(declare-fun m!247287 () Bool)

(assert (=> b!157785 m!247287))

(declare-fun m!247289 () Bool)

(assert (=> d!52740 m!247289))

(assert (=> d!52740 m!247259))

(declare-fun m!247291 () Bool)

(assert (=> b!157788 m!247291))

(declare-fun m!247293 () Bool)

(assert (=> b!157788 m!247293))

(assert (=> bm!2613 m!247261))

(declare-fun m!247295 () Bool)

(assert (=> bm!2613 m!247295))

(declare-fun m!247297 () Bool)

(assert (=> bm!2615 m!247297))

(assert (=> d!52682 d!52740))

(check-sat (not d!52738) (not b!157778) (not bm!2611) (not b!157787) (not bm!2615) (not d!52720) (not b!157786) (not bm!2612) (not b!157781) (not b!157785) (not b!157779) (not bm!2614) (not d!52740) (not bm!2613) (not d!52716) (not b!157711) (not bm!2610) (not b!157780) (not d!52714) (not b!157788) (not b!157784))
