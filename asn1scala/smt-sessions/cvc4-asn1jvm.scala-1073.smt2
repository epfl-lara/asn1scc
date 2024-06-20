; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30944 () Bool)

(assert start!30944)

(declare-fun b!156376 () Bool)

(declare-fun res!130702 () Bool)

(declare-fun e!105647 () Bool)

(assert (=> b!156376 (=> (not res!130702) (not e!105647))))

(declare-datatypes ((array!7171 0))(
  ( (array!7172 (arr!4075 (Array (_ BitVec 32) (_ BitVec 8))) (size!3216 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5690 0))(
  ( (BitStream!5691 (buf!3719 array!7171) (currentByte!6834 (_ BitVec 32)) (currentBit!6829 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5690)

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!156376 (= res!130702 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3216 (buf!3719 bs!65))) ((_ sign_extend 32) (currentByte!6834 bs!65)) ((_ sign_extend 32) (currentBit!6829 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!156379 () Bool)

(declare-fun e!105646 () Bool)

(declare-fun array_inv!3005 (array!7171) Bool)

(assert (=> b!156379 (= e!105646 (array_inv!3005 (buf!3719 bs!65)))))

(declare-fun b!156377 () Bool)

(declare-fun e!105648 () Bool)

(assert (=> b!156377 (= e!105647 e!105648)))

(declare-fun res!130703 () Bool)

(assert (=> b!156377 (=> (not res!130703) (not e!105648))))

(assert (=> b!156377 (= res!130703 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((tuple2!13986 0))(
  ( (tuple2!13987 (_1!7434 BitStream!5690) (_2!7434 array!7171)) )
))
(declare-fun lt!244598 () tuple2!13986)

(declare-fun arr!153 () array!7171)

(declare-fun lt!244599 () BitStream!5690)

(declare-fun readByteArrayLoopPure!0 (BitStream!5690 array!7171 (_ BitVec 32) (_ BitVec 32)) tuple2!13986)

(declare-datatypes ((tuple2!13988 0))(
  ( (tuple2!13989 (_1!7435 BitStream!5690) (_2!7435 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5690) tuple2!13988)

(assert (=> b!156377 (= lt!244598 (readByteArrayLoopPure!0 lt!244599 (array!7172 (store (arr!4075 arr!153) from!240 (_2!7435 (readBytePure!0 bs!65))) (size!3216 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5690 (_ BitVec 32)) BitStream!5690)

(assert (=> b!156377 (= lt!244599 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!244600 () tuple2!13986)

(assert (=> b!156377 (= lt!244600 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!156378 () Bool)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!156378 (= e!105648 (not (validate_offset_byte!0 ((_ sign_extend 32) (size!3216 (buf!3719 lt!244599))) ((_ sign_extend 32) (currentByte!6834 lt!244599)) ((_ sign_extend 32) (currentBit!6829 lt!244599)))))))

(declare-fun res!130701 () Bool)

(assert (=> start!30944 (=> (not res!130701) (not e!105647))))

(assert (=> start!30944 (= res!130701 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3216 arr!153))))))

(assert (=> start!30944 e!105647))

(assert (=> start!30944 true))

(assert (=> start!30944 (array_inv!3005 arr!153)))

(declare-fun inv!12 (BitStream!5690) Bool)

(assert (=> start!30944 (and (inv!12 bs!65) e!105646)))

(assert (= (and start!30944 res!130701) b!156376))

(assert (= (and b!156376 res!130702) b!156377))

(assert (= (and b!156377 res!130703) b!156378))

(assert (= start!30944 b!156379))

(declare-fun m!243673 () Bool)

(assert (=> start!30944 m!243673))

(declare-fun m!243675 () Bool)

(assert (=> start!30944 m!243675))

(declare-fun m!243677 () Bool)

(assert (=> b!156379 m!243677))

(declare-fun m!243679 () Bool)

(assert (=> b!156376 m!243679))

(declare-fun m!243681 () Bool)

(assert (=> b!156377 m!243681))

(declare-fun m!243683 () Bool)

(assert (=> b!156377 m!243683))

(declare-fun m!243685 () Bool)

(assert (=> b!156377 m!243685))

(declare-fun m!243687 () Bool)

(assert (=> b!156377 m!243687))

(declare-fun m!243689 () Bool)

(assert (=> b!156377 m!243689))

(declare-fun m!243691 () Bool)

(assert (=> b!156378 m!243691))

(push 1)

(assert (not b!156377))

(assert (not b!156379))

(assert (not b!156376))

(assert (not b!156378))

(assert (not start!30944))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!52038 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!52038 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3216 (buf!3719 lt!244599))) ((_ sign_extend 32) (currentByte!6834 lt!244599)) ((_ sign_extend 32) (currentBit!6829 lt!244599))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3216 (buf!3719 lt!244599))) ((_ sign_extend 32) (currentByte!6834 lt!244599)) ((_ sign_extend 32) (currentBit!6829 lt!244599))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!12747 () Bool)

(assert (= bs!12747 d!52038))

(declare-fun m!243705 () Bool)

(assert (=> bs!12747 m!243705))

(assert (=> b!156378 d!52038))

(declare-fun d!52044 () Bool)

(declare-datatypes ((Unit!10083 0))(
  ( (Unit!10084) )
))
(declare-datatypes ((tuple3!650 0))(
  ( (tuple3!651 (_1!7439 Unit!10083) (_2!7439 BitStream!5690) (_3!442 array!7171)) )
))
(declare-fun lt!244610 () tuple3!650)

(declare-fun readByteArrayLoop!0 (BitStream!5690 array!7171 (_ BitVec 32) (_ BitVec 32)) tuple3!650)

(assert (=> d!52044 (= lt!244610 (readByteArrayLoop!0 lt!244599 (array!7172 (store (arr!4075 arr!153) from!240 (_2!7435 (readBytePure!0 bs!65))) (size!3216 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52044 (= (readByteArrayLoopPure!0 lt!244599 (array!7172 (store (arr!4075 arr!153) from!240 (_2!7435 (readBytePure!0 bs!65))) (size!3216 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) (tuple2!13987 (_2!7439 lt!244610) (_3!442 lt!244610)))))

(declare-fun bs!12749 () Bool)

(assert (= bs!12749 d!52044))

(declare-fun m!243709 () Bool)

(assert (=> bs!12749 m!243709))

(assert (=> b!156377 d!52044))

(declare-fun d!52046 () Bool)

(declare-datatypes ((tuple2!13994 0))(
  ( (tuple2!13995 (_1!7440 (_ BitVec 8)) (_2!7440 BitStream!5690)) )
))
(declare-fun lt!244613 () tuple2!13994)

(declare-fun readByte!0 (BitStream!5690) tuple2!13994)

(assert (=> d!52046 (= lt!244613 (readByte!0 bs!65))))

(assert (=> d!52046 (= (readBytePure!0 bs!65) (tuple2!13989 (_2!7440 lt!244613) (_1!7440 lt!244613)))))

(declare-fun bs!12750 () Bool)

(assert (= bs!12750 d!52046))

(declare-fun m!243711 () Bool)

(assert (=> bs!12750 m!243711))

(assert (=> b!156377 d!52046))

(declare-fun d!52048 () Bool)

(declare-datatypes ((tuple2!13996 0))(
  ( (tuple2!13997 (_1!7441 Unit!10083) (_2!7441 BitStream!5690)) )
))
(declare-fun moveByteIndex!0 (BitStream!5690 (_ BitVec 32)) tuple2!13996)

(assert (=> d!52048 (= (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7441 (moveByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun bs!12751 () Bool)

(assert (= bs!12751 d!52048))

(declare-fun m!243713 () Bool)

(assert (=> bs!12751 m!243713))

(assert (=> b!156377 d!52048))

(declare-fun d!52050 () Bool)

(declare-fun lt!244614 () tuple3!650)

(assert (=> d!52050 (= lt!244614 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!52050 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!13987 (_2!7439 lt!244614) (_3!442 lt!244614)))))

(declare-fun bs!12752 () Bool)

(assert (= bs!12752 d!52050))

(declare-fun m!243715 () Bool)

(assert (=> bs!12752 m!243715))

(assert (=> b!156377 d!52050))

(declare-fun d!52052 () Bool)

(assert (=> d!52052 (= (array_inv!3005 arr!153) (bvsge (size!3216 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!30944 d!52052))

(declare-fun d!52054 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!52054 (= (inv!12 bs!65) (invariant!0 (currentBit!6829 bs!65) (currentByte!6834 bs!65) (size!3216 (buf!3719 bs!65))))))

(declare-fun bs!12753 () Bool)

(assert (= bs!12753 d!52054))

(declare-fun m!243717 () Bool)

(assert (=> bs!12753 m!243717))

(assert (=> start!30944 d!52054))

(declare-fun d!52056 () Bool)

(assert (=> d!52056 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3216 (buf!3719 bs!65))) ((_ sign_extend 32) (currentByte!6834 bs!65)) ((_ sign_extend 32) (currentBit!6829 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3216 (buf!3719 bs!65))) ((_ sign_extend 32) (currentByte!6834 bs!65)) ((_ sign_extend 32) (currentBit!6829 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12754 () Bool)

(assert (= bs!12754 d!52056))

(declare-fun m!243719 () Bool)

(assert (=> bs!12754 m!243719))

(assert (=> b!156376 d!52056))

(declare-fun d!52058 () Bool)

(assert (=> d!52058 (= (array_inv!3005 (buf!3719 bs!65)) (bvsge (size!3216 (buf!3719 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!156379 d!52058))

(push 1)

(assert (not d!52046))

(assert (not d!52038))

(assert (not d!52044))

(assert (not d!52056))

(assert (not d!52048))

(assert (not d!52054))

(assert (not d!52050))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!52078 () Bool)

(assert (=> d!52078 (= (remainingBits!0 ((_ sign_extend 32) (size!3216 (buf!3719 lt!244599))) ((_ sign_extend 32) (currentByte!6834 lt!244599)) ((_ sign_extend 32) (currentBit!6829 lt!244599))) (bvsub (bvmul ((_ sign_extend 32) (size!3216 (buf!3719 lt!244599))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6834 lt!244599)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6829 lt!244599)))))))

(assert (=> d!52038 d!52078))

(declare-fun c!8338 () Bool)

(declare-fun bm!2445 () Bool)

(declare-fun lt!244994 () tuple2!13994)

(declare-fun call!2450 () Bool)

(declare-fun arrayRangesEq!427 (array!7171 array!7171 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2445 (= call!2450 (arrayRangesEq!427 arr!153 (ite c!8338 (array!7172 (store (arr!4075 arr!153) from!240 (_1!7440 lt!244994)) (size!3216 arr!153)) arr!153) #b00000000000000000000000000000000 (ite c!8338 from!240 (size!3216 arr!153))))))

(declare-fun lt!244987 () tuple3!650)

(declare-fun e!105690 () Bool)

(declare-fun b!156437 () Bool)

(assert (=> b!156437 (= e!105690 (arrayRangesEq!427 arr!153 (_3!442 lt!244987) #b00000000000000000000000000000000 from!240))))

(declare-fun e!105692 () Bool)

(declare-fun b!156438 () Bool)

(assert (=> b!156438 (= e!105692 (= (select (arr!4075 (_3!442 lt!244987)) from!240) (_2!7435 (readBytePure!0 bs!65))))))

(assert (=> b!156438 (and (bvsge from!240 #b00000000000000000000000000000000) (bvslt from!240 (size!3216 (_3!442 lt!244987))))))

(declare-fun lt!244974 () tuple3!650)

(declare-fun call!2449 () Bool)

(declare-fun lt!244986 () (_ BitVec 32))

(declare-fun lt!244969 () array!7171)

(declare-fun bm!2446 () Bool)

(declare-fun lt!244975 () array!7171)

(declare-fun lt!244996 () (_ BitVec 32))

(declare-fun lt!244988 () (_ BitVec 32))

(assert (=> bm!2446 (= call!2449 (arrayRangesEq!427 (ite c!8338 arr!153 lt!244969) (ite c!8338 (_3!442 lt!244974) lt!244975) (ite c!8338 lt!244988 lt!244986) (ite c!8338 from!240 lt!244996)))))

(declare-fun bm!2447 () Bool)

(declare-fun call!2448 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> bm!2447 (= call!2448 (bitIndex!0 (ite c!8338 (size!3216 (buf!3719 (_2!7440 lt!244994))) (size!3216 (buf!3719 bs!65))) (ite c!8338 (currentByte!6834 (_2!7440 lt!244994)) (currentByte!6834 bs!65)) (ite c!8338 (currentBit!6829 (_2!7440 lt!244994)) (currentBit!6829 bs!65))))))

(declare-fun b!156439 () Bool)

(declare-fun res!130746 () Bool)

(assert (=> b!156439 (=> (not res!130746) (not e!105690))))

(assert (=> b!156439 (= res!130746 (and (= (buf!3719 bs!65) (buf!3719 (_2!7439 lt!244987))) (= (size!3216 arr!153) (size!3216 (_3!442 lt!244987)))))))

(declare-fun b!156440 () Bool)

(declare-fun e!105691 () tuple3!650)

(declare-fun lt!244999 () Unit!10083)

(assert (=> b!156440 (= e!105691 (tuple3!651 lt!244999 (_2!7439 lt!244974) (_3!442 lt!244974)))))

(assert (=> b!156440 (= lt!244994 (readByte!0 bs!65))))

(declare-fun lt!244967 () array!7171)

(assert (=> b!156440 (= lt!244967 (array!7172 (store (arr!4075 arr!153) from!240 (_1!7440 lt!244994)) (size!3216 arr!153)))))

(declare-fun lt!244993 () (_ BitVec 64))

(assert (=> b!156440 (= lt!244993 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!244989 () (_ BitVec 32))

(assert (=> b!156440 (= lt!244989 (bvsub to!236 from!240))))

(declare-fun lt!244981 () Unit!10083)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5690 BitStream!5690 (_ BitVec 64) (_ BitVec 32)) Unit!10083)

(assert (=> b!156440 (= lt!244981 (validateOffsetBytesFromBitIndexLemma!0 bs!65 (_2!7440 lt!244994) lt!244993 lt!244989))))

(assert (=> b!156440 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3216 (buf!3719 (_2!7440 lt!244994)))) ((_ sign_extend 32) (currentByte!6834 (_2!7440 lt!244994))) ((_ sign_extend 32) (currentBit!6829 (_2!7440 lt!244994))) (bvsub lt!244989 ((_ extract 31 0) (bvsdiv (bvadd lt!244993 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!244973 () Unit!10083)

(assert (=> b!156440 (= lt!244973 lt!244981)))

(assert (=> b!156440 (= lt!244974 (readByteArrayLoop!0 (_2!7440 lt!244994) lt!244967 (bvadd from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!156440 (= call!2448 (bvadd (bitIndex!0 (size!3216 (buf!3719 bs!65)) (currentByte!6834 bs!65) (currentBit!6829 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!245001 () Unit!10083)

(declare-fun Unit!10113 () Unit!10083)

(assert (=> b!156440 (= lt!245001 Unit!10113)))

(assert (=> b!156440 (= (bvadd call!2448 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3216 (buf!3719 (_2!7439 lt!244974))) (currentByte!6834 (_2!7439 lt!244974)) (currentBit!6829 (_2!7439 lt!244974))))))

(declare-fun lt!244997 () Unit!10083)

(declare-fun Unit!10117 () Unit!10083)

(assert (=> b!156440 (= lt!244997 Unit!10117)))

(assert (=> b!156440 (= (bvadd (bitIndex!0 (size!3216 (buf!3719 bs!65)) (currentByte!6834 bs!65) (currentBit!6829 bs!65)) (bvmul ((_ sign_extend 32) (bvsub to!236 from!240)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3216 (buf!3719 (_2!7439 lt!244974))) (currentByte!6834 (_2!7439 lt!244974)) (currentBit!6829 (_2!7439 lt!244974))))))

(declare-fun lt!244979 () Unit!10083)

(declare-fun Unit!10118 () Unit!10083)

(assert (=> b!156440 (= lt!244979 Unit!10118)))

(assert (=> b!156440 (and (= (buf!3719 bs!65) (buf!3719 (_2!7439 lt!244974))) (= (size!3216 arr!153) (size!3216 (_3!442 lt!244974))))))

(declare-fun lt!244992 () Unit!10083)

(declare-fun Unit!10121 () Unit!10083)

(assert (=> b!156440 (= lt!244992 Unit!10121)))

(declare-fun lt!244977 () Unit!10083)

(declare-fun arrayUpdatedAtPrefixLemma!38 (array!7171 (_ BitVec 32) (_ BitVec 8)) Unit!10083)

(assert (=> b!156440 (= lt!244977 (arrayUpdatedAtPrefixLemma!38 arr!153 from!240 (_1!7440 lt!244994)))))

(assert (=> b!156440 call!2450))

(declare-fun lt!244990 () Unit!10083)

(assert (=> b!156440 (= lt!244990 lt!244977)))

(assert (=> b!156440 (= lt!244988 #b00000000000000000000000000000000)))

(declare-fun lt!244998 () Unit!10083)

(declare-fun arrayRangesEqTransitive!103 (array!7171 array!7171 array!7171 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10083)

(assert (=> b!156440 (= lt!244998 (arrayRangesEqTransitive!103 arr!153 lt!244967 (_3!442 lt!244974) lt!244988 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!156440 call!2449))

(declare-fun lt!244970 () Unit!10083)

(assert (=> b!156440 (= lt!244970 lt!244998)))

(assert (=> b!156440 (arrayRangesEq!427 arr!153 (_3!442 lt!244974) #b00000000000000000000000000000000 from!240)))

(declare-fun lt!244971 () Unit!10083)

(declare-fun Unit!10122 () Unit!10083)

(assert (=> b!156440 (= lt!244971 Unit!10122)))

(declare-fun lt!244985 () Unit!10083)

(declare-fun arrayRangesEqImpliesEq!47 (array!7171 array!7171 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10083)

(assert (=> b!156440 (= lt!244985 (arrayRangesEqImpliesEq!47 lt!244967 (_3!442 lt!244974) #b00000000000000000000000000000000 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!156440 (= (select (store (arr!4075 arr!153) from!240 (_1!7440 lt!244994)) from!240) (select (arr!4075 (_3!442 lt!244974)) from!240))))

(declare-fun lt!244976 () Unit!10083)

(assert (=> b!156440 (= lt!244976 lt!244985)))

(declare-fun lt!245000 () Bool)

(assert (=> b!156440 (= lt!245000 (= (select (arr!4075 (_3!442 lt!244974)) from!240) (_1!7440 lt!244994)))))

(declare-fun Unit!10123 () Unit!10083)

(assert (=> b!156440 (= lt!244999 Unit!10123)))

(assert (=> b!156440 lt!245000))

(declare-fun d!52080 () Bool)

(assert (=> d!52080 e!105692))

(declare-fun res!130747 () Bool)

(assert (=> d!52080 (=> res!130747 e!105692)))

(assert (=> d!52080 (= res!130747 (bvsge from!240 to!236))))

(declare-fun lt!244980 () Bool)

(assert (=> d!52080 (= lt!244980 e!105690)))

(declare-fun res!130745 () Bool)

(assert (=> d!52080 (=> (not res!130745) (not e!105690))))

(declare-fun lt!244983 () (_ BitVec 64))

(declare-fun lt!244995 () (_ BitVec 64))

(assert (=> d!52080 (= res!130745 (= (bvadd lt!244983 lt!244995) (bitIndex!0 (size!3216 (buf!3719 (_2!7439 lt!244987))) (currentByte!6834 (_2!7439 lt!244987)) (currentBit!6829 (_2!7439 lt!244987)))))))

(assert (=> d!52080 (or (not (= (bvand lt!244983 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!244995 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!244983 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!244983 lt!244995) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!244991 () (_ BitVec 64))

(assert (=> d!52080 (= lt!244995 (bvmul lt!244991 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!52080 (or (= lt!244991 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!244991 #b0000000000000000000000000000000000000000000000000000000000001000) lt!244991)))))

(assert (=> d!52080 (= lt!244991 ((_ sign_extend 32) (bvsub to!236 from!240)))))

(assert (=> d!52080 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand from!240 #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000)))))

(assert (=> d!52080 (= lt!244983 (bitIndex!0 (size!3216 (buf!3719 bs!65)) (currentByte!6834 bs!65) (currentBit!6829 bs!65)))))

(assert (=> d!52080 (= lt!244987 e!105691)))

(assert (=> d!52080 (= c!8338 (bvslt from!240 to!236))))

(assert (=> d!52080 (and (bvsle #b00000000000000000000000000000000 from!240) (bvsle from!240 to!236) (bvsle to!236 (size!3216 arr!153)))))

(assert (=> d!52080 (= (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236) lt!244987)))

(declare-fun lt!244982 () Unit!10083)

(declare-fun b!156441 () Bool)

(assert (=> b!156441 (= e!105691 (tuple3!651 lt!244982 bs!65 arr!153))))

(assert (=> b!156441 (= call!2448 call!2448)))

(declare-fun lt!244984 () Unit!10083)

(declare-fun Unit!10129 () Unit!10083)

(assert (=> b!156441 (= lt!244984 Unit!10129)))

(declare-fun lt!244968 () Unit!10083)

(declare-fun arrayRangesEqReflexiveLemma!38 (array!7171) Unit!10083)

(assert (=> b!156441 (= lt!244968 (arrayRangesEqReflexiveLemma!38 arr!153))))

(assert (=> b!156441 call!2450))

(declare-fun lt!244978 () Unit!10083)

(assert (=> b!156441 (= lt!244978 lt!244968)))

(assert (=> b!156441 (= lt!244969 arr!153)))

(assert (=> b!156441 (= lt!244975 arr!153)))

(declare-fun lt!245002 () (_ BitVec 32))

(assert (=> b!156441 (= lt!245002 #b00000000000000000000000000000000)))

(declare-fun lt!244972 () (_ BitVec 32))

(assert (=> b!156441 (= lt!244972 (size!3216 arr!153))))

(assert (=> b!156441 (= lt!244986 #b00000000000000000000000000000000)))

(assert (=> b!156441 (= lt!244996 from!240)))

(declare-fun arrayRangesEqSlicedLemma!38 (array!7171 array!7171 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10083)

(assert (=> b!156441 (= lt!244982 (arrayRangesEqSlicedLemma!38 lt!244969 lt!244975 lt!245002 lt!244972 lt!244986 lt!244996))))

(assert (=> b!156441 call!2449))

(assert (= (and d!52080 c!8338) b!156440))

(assert (= (and d!52080 (not c!8338)) b!156441))

(assert (= (or b!156440 b!156441) bm!2446))

(assert (= (or b!156440 b!156441) bm!2445))

(assert (= (or b!156440 b!156441) bm!2447))

(assert (= (and d!52080 res!130745) b!156439))

(assert (= (and b!156439 res!130746) b!156437))

(assert (= (and d!52080 (not res!130747)) b!156438))

(declare-fun m!243875 () Bool)

(assert (=> bm!2446 m!243875))

(declare-fun m!243877 () Bool)

(assert (=> bm!2445 m!243877))

(declare-fun m!243879 () Bool)

(assert (=> bm!2445 m!243879))

(declare-fun m!243881 () Bool)

(assert (=> b!156440 m!243881))

(declare-fun m!243883 () Bool)

(assert (=> b!156440 m!243883))

(declare-fun m!243885 () Bool)

(assert (=> b!156440 m!243885))

(declare-fun m!243887 () Bool)

(assert (=> b!156440 m!243887))

(declare-fun m!243889 () Bool)

(assert (=> b!156440 m!243889))

(assert (=> b!156440 m!243711))

(declare-fun m!243891 () Bool)

(assert (=> b!156440 m!243891))

(assert (=> b!156440 m!243877))

(declare-fun m!243893 () Bool)

(assert (=> b!156440 m!243893))

(declare-fun m!243895 () Bool)

(assert (=> b!156440 m!243895))

(declare-fun m!243897 () Bool)

(assert (=> b!156440 m!243897))

(declare-fun m!243899 () Bool)

(assert (=> b!156440 m!243899))

(declare-fun m!243901 () Bool)

(assert (=> b!156440 m!243901))

(declare-fun m!243903 () Bool)

(assert (=> b!156437 m!243903))

(declare-fun m!243905 () Bool)

(assert (=> b!156441 m!243905))

(declare-fun m!243907 () Bool)

(assert (=> b!156441 m!243907))

(declare-fun m!243909 () Bool)

(assert (=> d!52080 m!243909))

(assert (=> d!52080 m!243885))

(declare-fun m!243911 () Bool)

(assert (=> bm!2447 m!243911))

(declare-fun m!243913 () Bool)

(assert (=> b!156438 m!243913))

(assert (=> b!156438 m!243681))

(assert (=> d!52050 d!52080))

(declare-fun call!2453 () Bool)

(declare-fun bm!2448 () Bool)

(declare-fun c!8339 () Bool)

(declare-fun lt!245030 () tuple2!13994)

(assert (=> bm!2448 (= call!2453 (arrayRangesEq!427 (array!7172 (store (arr!4075 arr!153) from!240 (_2!7435 (readBytePure!0 bs!65))) (size!3216 arr!153)) (ite c!8339 (array!7172 (store (arr!4075 (array!7172 (store (arr!4075 arr!153) from!240 (_2!7435 (readBytePure!0 bs!65))) (size!3216 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7440 lt!245030)) (size!3216 (array!7172 (store (arr!4075 arr!153) from!240 (_2!7435 (readBytePure!0 bs!65))) (size!3216 arr!153)))) (array!7172 (store (arr!4075 arr!153) from!240 (_2!7435 (readBytePure!0 bs!65))) (size!3216 arr!153))) #b00000000000000000000000000000000 (ite c!8339 (bvadd #b00000000000000000000000000000001 from!240) (size!3216 (array!7172 (store (arr!4075 arr!153) from!240 (_2!7435 (readBytePure!0 bs!65))) (size!3216 arr!153))))))))

(declare-fun b!156442 () Bool)

(declare-fun lt!245023 () tuple3!650)

(declare-fun e!105693 () Bool)

(assert (=> b!156442 (= e!105693 (arrayRangesEq!427 (array!7172 (store (arr!4075 arr!153) from!240 (_2!7435 (readBytePure!0 bs!65))) (size!3216 arr!153)) (_3!442 lt!245023) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun e!105695 () Bool)

(declare-fun b!156443 () Bool)

(assert (=> b!156443 (= e!105695 (= (select (arr!4075 (_3!442 lt!245023)) (bvadd #b00000000000000000000000000000001 from!240)) (_2!7435 (readBytePure!0 lt!244599))))))

(assert (=> b!156443 (and (bvsge (bvadd #b00000000000000000000000000000001 from!240) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!240) (size!3216 (_3!442 lt!245023))))))

(declare-fun lt!245032 () (_ BitVec 32))

(declare-fun bm!2449 () Bool)

(declare-fun lt!245010 () tuple3!650)

(declare-fun call!2452 () Bool)

(declare-fun lt!245022 () (_ BitVec 32))

(declare-fun lt!245024 () (_ BitVec 32))

(declare-fun lt!245005 () array!7171)

(declare-fun lt!245011 () array!7171)

(assert (=> bm!2449 (= call!2452 (arrayRangesEq!427 (ite c!8339 (array!7172 (store (arr!4075 arr!153) from!240 (_2!7435 (readBytePure!0 bs!65))) (size!3216 arr!153)) lt!245005) (ite c!8339 (_3!442 lt!245010) lt!245011) (ite c!8339 lt!245024 lt!245022) (ite c!8339 (bvadd #b00000000000000000000000000000001 from!240) lt!245032)))))

(declare-fun call!2451 () (_ BitVec 64))

(declare-fun bm!2450 () Bool)

(assert (=> bm!2450 (= call!2451 (bitIndex!0 (ite c!8339 (size!3216 (buf!3719 (_2!7440 lt!245030))) (size!3216 (buf!3719 lt!244599))) (ite c!8339 (currentByte!6834 (_2!7440 lt!245030)) (currentByte!6834 lt!244599)) (ite c!8339 (currentBit!6829 (_2!7440 lt!245030)) (currentBit!6829 lt!244599))))))

(declare-fun b!156444 () Bool)

(declare-fun res!130749 () Bool)

(assert (=> b!156444 (=> (not res!130749) (not e!105693))))

(assert (=> b!156444 (= res!130749 (and (= (buf!3719 lt!244599) (buf!3719 (_2!7439 lt!245023))) (= (size!3216 (array!7172 (store (arr!4075 arr!153) from!240 (_2!7435 (readBytePure!0 bs!65))) (size!3216 arr!153))) (size!3216 (_3!442 lt!245023)))))))

(declare-fun b!156445 () Bool)

(declare-fun e!105694 () tuple3!650)

(declare-fun lt!245035 () Unit!10083)

(assert (=> b!156445 (= e!105694 (tuple3!651 lt!245035 (_2!7439 lt!245010) (_3!442 lt!245010)))))

(assert (=> b!156445 (= lt!245030 (readByte!0 lt!244599))))

(declare-fun lt!245003 () array!7171)

(assert (=> b!156445 (= lt!245003 (array!7172 (store (arr!4075 (array!7172 (store (arr!4075 arr!153) from!240 (_2!7435 (readBytePure!0 bs!65))) (size!3216 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7440 lt!245030)) (size!3216 (array!7172 (store (arr!4075 arr!153) from!240 (_2!7435 (readBytePure!0 bs!65))) (size!3216 arr!153)))))))

(declare-fun lt!245029 () (_ BitVec 64))

(assert (=> b!156445 (= lt!245029 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!245025 () (_ BitVec 32))

(assert (=> b!156445 (= lt!245025 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!245017 () Unit!10083)

(assert (=> b!156445 (= lt!245017 (validateOffsetBytesFromBitIndexLemma!0 lt!244599 (_2!7440 lt!245030) lt!245029 lt!245025))))

(assert (=> b!156445 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3216 (buf!3719 (_2!7440 lt!245030)))) ((_ sign_extend 32) (currentByte!6834 (_2!7440 lt!245030))) ((_ sign_extend 32) (currentBit!6829 (_2!7440 lt!245030))) (bvsub lt!245025 ((_ extract 31 0) (bvsdiv (bvadd lt!245029 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!245009 () Unit!10083)

(assert (=> b!156445 (= lt!245009 lt!245017)))

(assert (=> b!156445 (= lt!245010 (readByteArrayLoop!0 (_2!7440 lt!245030) lt!245003 (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!156445 (= call!2451 (bvadd (bitIndex!0 (size!3216 (buf!3719 lt!244599)) (currentByte!6834 lt!244599) (currentBit!6829 lt!244599)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!245037 () Unit!10083)

(declare-fun Unit!10132 () Unit!10083)

(assert (=> b!156445 (= lt!245037 Unit!10132)))

(assert (=> b!156445 (= (bvadd call!2451 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3216 (buf!3719 (_2!7439 lt!245010))) (currentByte!6834 (_2!7439 lt!245010)) (currentBit!6829 (_2!7439 lt!245010))))))

(declare-fun lt!245033 () Unit!10083)

(declare-fun Unit!10133 () Unit!10083)

(assert (=> b!156445 (= lt!245033 Unit!10133)))

(assert (=> b!156445 (= (bvadd (bitIndex!0 (size!3216 (buf!3719 lt!244599)) (currentByte!6834 lt!244599) (currentBit!6829 lt!244599)) (bvmul ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3216 (buf!3719 (_2!7439 lt!245010))) (currentByte!6834 (_2!7439 lt!245010)) (currentBit!6829 (_2!7439 lt!245010))))))

(declare-fun lt!245015 () Unit!10083)

(declare-fun Unit!10134 () Unit!10083)

(assert (=> b!156445 (= lt!245015 Unit!10134)))

(assert (=> b!156445 (and (= (buf!3719 lt!244599) (buf!3719 (_2!7439 lt!245010))) (= (size!3216 (array!7172 (store (arr!4075 arr!153) from!240 (_2!7435 (readBytePure!0 bs!65))) (size!3216 arr!153))) (size!3216 (_3!442 lt!245010))))))

(declare-fun lt!245028 () Unit!10083)

(declare-fun Unit!10135 () Unit!10083)

(assert (=> b!156445 (= lt!245028 Unit!10135)))

(declare-fun lt!245013 () Unit!10083)

(assert (=> b!156445 (= lt!245013 (arrayUpdatedAtPrefixLemma!38 (array!7172 (store (arr!4075 arr!153) from!240 (_2!7435 (readBytePure!0 bs!65))) (size!3216 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) (_1!7440 lt!245030)))))

(assert (=> b!156445 call!2453))

(declare-fun lt!245026 () Unit!10083)

(assert (=> b!156445 (= lt!245026 lt!245013)))

(assert (=> b!156445 (= lt!245024 #b00000000000000000000000000000000)))

(declare-fun lt!245034 () Unit!10083)

(assert (=> b!156445 (= lt!245034 (arrayRangesEqTransitive!103 (array!7172 (store (arr!4075 arr!153) from!240 (_2!7435 (readBytePure!0 bs!65))) (size!3216 arr!153)) lt!245003 (_3!442 lt!245010) lt!245024 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!156445 call!2452))

(declare-fun lt!245006 () Unit!10083)

(assert (=> b!156445 (= lt!245006 lt!245034)))

(assert (=> b!156445 (arrayRangesEq!427 (array!7172 (store (arr!4075 arr!153) from!240 (_2!7435 (readBytePure!0 bs!65))) (size!3216 arr!153)) (_3!442 lt!245010) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240))))

(declare-fun lt!245007 () Unit!10083)

(declare-fun Unit!10136 () Unit!10083)

(assert (=> b!156445 (= lt!245007 Unit!10136)))

(declare-fun lt!245021 () Unit!10083)

(assert (=> b!156445 (= lt!245021 (arrayRangesEqImpliesEq!47 lt!245003 (_3!442 lt!245010) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!156445 (= (select (store (arr!4075 (array!7172 (store (arr!4075 arr!153) from!240 (_2!7435 (readBytePure!0 bs!65))) (size!3216 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7440 lt!245030)) (bvadd #b00000000000000000000000000000001 from!240)) (select (arr!4075 (_3!442 lt!245010)) (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!245012 () Unit!10083)

(assert (=> b!156445 (= lt!245012 lt!245021)))

(declare-fun lt!245036 () Bool)

(assert (=> b!156445 (= lt!245036 (= (select (arr!4075 (_3!442 lt!245010)) (bvadd #b00000000000000000000000000000001 from!240)) (_1!7440 lt!245030)))))

(declare-fun Unit!10137 () Unit!10083)

(assert (=> b!156445 (= lt!245035 Unit!10137)))

(assert (=> b!156445 lt!245036))

(declare-fun d!52104 () Bool)

(assert (=> d!52104 e!105695))

(declare-fun res!130750 () Bool)

(assert (=> d!52104 (=> res!130750 e!105695)))

(assert (=> d!52104 (= res!130750 (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!245016 () Bool)

(assert (=> d!52104 (= lt!245016 e!105693)))

(declare-fun res!130748 () Bool)

(assert (=> d!52104 (=> (not res!130748) (not e!105693))))

(declare-fun lt!245019 () (_ BitVec 64))

(declare-fun lt!245031 () (_ BitVec 64))

(assert (=> d!52104 (= res!130748 (= (bvadd lt!245019 lt!245031) (bitIndex!0 (size!3216 (buf!3719 (_2!7439 lt!245023))) (currentByte!6834 (_2!7439 lt!245023)) (currentBit!6829 (_2!7439 lt!245023)))))))

(assert (=> d!52104 (or (not (= (bvand lt!245019 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!245031 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!245019 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!245019 lt!245031) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!245027 () (_ BitVec 64))

(assert (=> d!52104 (= lt!245031 (bvmul lt!245027 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!52104 (or (= lt!245027 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!245027 #b0000000000000000000000000000000000000000000000000000000000001000) lt!245027)))))

(assert (=> d!52104 (= lt!245027 ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))))))

(assert (=> d!52104 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!240) #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b10000000000000000000000000000000)))))

(assert (=> d!52104 (= lt!245019 (bitIndex!0 (size!3216 (buf!3719 lt!244599)) (currentByte!6834 lt!244599) (currentBit!6829 lt!244599)))))

(assert (=> d!52104 (= lt!245023 e!105694)))

(assert (=> d!52104 (= c!8339 (bvslt (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52104 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsle (bvadd #b00000000000000000000000000000001 from!240) to!236) (bvsle to!236 (size!3216 (array!7172 (store (arr!4075 arr!153) from!240 (_2!7435 (readBytePure!0 bs!65))) (size!3216 arr!153)))))))

(assert (=> d!52104 (= (readByteArrayLoop!0 lt!244599 (array!7172 (store (arr!4075 arr!153) from!240 (_2!7435 (readBytePure!0 bs!65))) (size!3216 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) lt!245023)))

(declare-fun b!156446 () Bool)

(declare-fun lt!245018 () Unit!10083)

(assert (=> b!156446 (= e!105694 (tuple3!651 lt!245018 lt!244599 (array!7172 (store (arr!4075 arr!153) from!240 (_2!7435 (readBytePure!0 bs!65))) (size!3216 arr!153))))))

(assert (=> b!156446 (= call!2451 call!2451)))

(declare-fun lt!245020 () Unit!10083)

(declare-fun Unit!10138 () Unit!10083)

(assert (=> b!156446 (= lt!245020 Unit!10138)))

(declare-fun lt!245004 () Unit!10083)

(assert (=> b!156446 (= lt!245004 (arrayRangesEqReflexiveLemma!38 (array!7172 (store (arr!4075 arr!153) from!240 (_2!7435 (readBytePure!0 bs!65))) (size!3216 arr!153))))))

(assert (=> b!156446 call!2453))

(declare-fun lt!245014 () Unit!10083)

(assert (=> b!156446 (= lt!245014 lt!245004)))

(assert (=> b!156446 (= lt!245005 (array!7172 (store (arr!4075 arr!153) from!240 (_2!7435 (readBytePure!0 bs!65))) (size!3216 arr!153)))))

(assert (=> b!156446 (= lt!245011 (array!7172 (store (arr!4075 arr!153) from!240 (_2!7435 (readBytePure!0 bs!65))) (size!3216 arr!153)))))

(declare-fun lt!245038 () (_ BitVec 32))

(assert (=> b!156446 (= lt!245038 #b00000000000000000000000000000000)))

(declare-fun lt!245008 () (_ BitVec 32))

(assert (=> b!156446 (= lt!245008 (size!3216 (array!7172 (store (arr!4075 arr!153) from!240 (_2!7435 (readBytePure!0 bs!65))) (size!3216 arr!153))))))

(assert (=> b!156446 (= lt!245022 #b00000000000000000000000000000000)))

(assert (=> b!156446 (= lt!245032 (bvadd #b00000000000000000000000000000001 from!240))))

(assert (=> b!156446 (= lt!245018 (arrayRangesEqSlicedLemma!38 lt!245005 lt!245011 lt!245038 lt!245008 lt!245022 lt!245032))))

(assert (=> b!156446 call!2452))

(assert (= (and d!52104 c!8339) b!156445))

(assert (= (and d!52104 (not c!8339)) b!156446))

(assert (= (or b!156445 b!156446) bm!2449))

(assert (= (or b!156445 b!156446) bm!2448))

(assert (= (or b!156445 b!156446) bm!2450))

(assert (= (and d!52104 res!130748) b!156444))

(assert (= (and b!156444 res!130749) b!156442))

(assert (= (and d!52104 (not res!130750)) b!156443))

(declare-fun m!243915 () Bool)

(assert (=> bm!2449 m!243915))

(declare-fun m!243917 () Bool)

(assert (=> bm!2448 m!243917))

(declare-fun m!243919 () Bool)

(assert (=> bm!2448 m!243919))

(declare-fun m!243921 () Bool)

(assert (=> b!156445 m!243921))

(declare-fun m!243923 () Bool)

(assert (=> b!156445 m!243923))

(declare-fun m!243925 () Bool)

(assert (=> b!156445 m!243925))

(declare-fun m!243927 () Bool)

(assert (=> b!156445 m!243927))

(declare-fun m!243929 () Bool)

(assert (=> b!156445 m!243929))

(declare-fun m!243931 () Bool)

(assert (=> b!156445 m!243931))

(declare-fun m!243933 () Bool)

(assert (=> b!156445 m!243933))

(assert (=> b!156445 m!243917))

(declare-fun m!243935 () Bool)

(assert (=> b!156445 m!243935))

(declare-fun m!243937 () Bool)

(assert (=> b!156445 m!243937))

(declare-fun m!243939 () Bool)

(assert (=> b!156445 m!243939))

(declare-fun m!243941 () Bool)

(assert (=> b!156445 m!243941))

(declare-fun m!243943 () Bool)

(assert (=> b!156445 m!243943))

(declare-fun m!243945 () Bool)

(assert (=> b!156442 m!243945))

(declare-fun m!243947 () Bool)

(assert (=> b!156446 m!243947))

(declare-fun m!243949 () Bool)

(assert (=> b!156446 m!243949))

(declare-fun m!243951 () Bool)

(assert (=> d!52104 m!243951))

(assert (=> d!52104 m!243925))

(declare-fun m!243953 () Bool)

(assert (=> bm!2450 m!243953))

(declare-fun m!243955 () Bool)

(assert (=> b!156443 m!243955))

(declare-fun m!243957 () Bool)

(assert (=> b!156443 m!243957))

(assert (=> d!52044 d!52104))

(declare-fun d!52106 () Bool)

(assert (=> d!52106 (= (remainingBits!0 ((_ sign_extend 32) (size!3216 (buf!3719 bs!65))) ((_ sign_extend 32) (currentByte!6834 bs!65)) ((_ sign_extend 32) (currentBit!6829 bs!65))) (bvsub (bvmul ((_ sign_extend 32) (size!3216 (buf!3719 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6834 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6829 bs!65)))))))

(assert (=> d!52056 d!52106))

(declare-fun d!52108 () Bool)

(declare-fun e!105700 () Bool)

(assert (=> d!52108 e!105700))

(declare-fun res!130755 () Bool)

(assert (=> d!52108 (=> (not res!130755) (not e!105700))))

(declare-fun moveByteIndexPrecond!0 (BitStream!5690 (_ BitVec 32)) Bool)

(assert (=> d!52108 (= res!130755 (moveByteIndexPrecond!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun Unit!10139 () Unit!10083)

(assert (=> d!52108 (= (moveByteIndex!0 bs!65 #b00000000000000000000000000000001) (tuple2!13997 Unit!10139 (BitStream!5691 (buf!3719 bs!65) (bvadd (currentByte!6834 bs!65) #b00000000000000000000000000000001) (currentBit!6829 bs!65))))))

(declare-fun b!156451 () Bool)

(assert (=> b!156451 (= e!105700 (and (or (not (= (bvand (currentByte!6834 bs!65) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6834 bs!65) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6834 bs!65) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6834 bs!65) #b00000000000000000000000000000001) (bvadd (currentByte!6834 bs!65) #b00000000000000000000000000000001))))))

(assert (= (and d!52108 res!130755) b!156451))

(declare-fun m!243959 () Bool)

(assert (=> d!52108 m!243959))

(assert (=> d!52048 d!52108))

(declare-fun d!52110 () Bool)

(declare-fun lt!245115 () (_ BitVec 8))

(declare-fun lt!245113 () (_ BitVec 8))

(assert (=> d!52110 (= lt!245115 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4075 (buf!3719 bs!65)) (currentByte!6834 bs!65))) ((_ sign_extend 24) lt!245113))))))

(assert (=> d!52110 (= lt!245113 ((_ extract 7 0) (currentBit!6829 bs!65)))))

(declare-fun e!105713 () Bool)

(assert (=> d!52110 e!105713))

(declare-fun res!130768 () Bool)

(assert (=> d!52110 (=> (not res!130768) (not e!105713))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!52110 (= res!130768 (validate_offset_bits!1 ((_ sign_extend 32) (size!3216 (buf!3719 bs!65))) ((_ sign_extend 32) (currentByte!6834 bs!65)) ((_ sign_extend 32) (currentBit!6829 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!14006 0))(
  ( (tuple2!14007 (_1!7447 Unit!10083) (_2!7447 (_ BitVec 8))) )
))
(declare-fun Unit!10140 () Unit!10083)

(declare-fun Unit!10141 () Unit!10083)

(assert (=> d!52110 (= (readByte!0 bs!65) (tuple2!13995 (_2!7447 (ite (bvsgt ((_ sign_extend 24) lt!245113) #b00000000000000000000000000000000) (tuple2!14007 Unit!10140 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!245115) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4075 (buf!3719 bs!65)) (bvadd (currentByte!6834 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!245113)))))))) (tuple2!14007 Unit!10141 lt!245115))) (BitStream!5691 (buf!3719 bs!65) (bvadd (currentByte!6834 bs!65) #b00000000000000000000000000000001) (currentBit!6829 bs!65))))))

(declare-fun b!156465 () Bool)

(declare-fun e!105712 () Bool)

(assert (=> b!156465 (= e!105713 e!105712)))

(declare-fun res!130769 () Bool)

(assert (=> b!156465 (=> (not res!130769) (not e!105712))))

(declare-fun lt!245112 () tuple2!13994)

(assert (=> b!156465 (= res!130769 (= (buf!3719 (_2!7440 lt!245112)) (buf!3719 bs!65)))))

(declare-fun lt!245114 () (_ BitVec 8))

(declare-fun lt!245110 () (_ BitVec 8))

(declare-fun Unit!10142 () Unit!10083)

(declare-fun Unit!10143 () Unit!10083)

(assert (=> b!156465 (= lt!245112 (tuple2!13995 (_2!7447 (ite (bvsgt ((_ sign_extend 24) lt!245114) #b00000000000000000000000000000000) (tuple2!14007 Unit!10142 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!245110) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4075 (buf!3719 bs!65)) (bvadd (currentByte!6834 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!245114)))))))) (tuple2!14007 Unit!10143 lt!245110))) (BitStream!5691 (buf!3719 bs!65) (bvadd (currentByte!6834 bs!65) #b00000000000000000000000000000001) (currentBit!6829 bs!65))))))

(assert (=> b!156465 (= lt!245110 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4075 (buf!3719 bs!65)) (currentByte!6834 bs!65))) ((_ sign_extend 24) lt!245114))))))

(assert (=> b!156465 (= lt!245114 ((_ extract 7 0) (currentBit!6829 bs!65)))))

(declare-fun lt!245111 () (_ BitVec 64))

(declare-fun b!156466 () Bool)

(declare-fun lt!245116 () (_ BitVec 64))

(assert (=> b!156466 (= e!105712 (= (bitIndex!0 (size!3216 (buf!3719 (_2!7440 lt!245112))) (currentByte!6834 (_2!7440 lt!245112)) (currentBit!6829 (_2!7440 lt!245112))) (bvadd lt!245116 lt!245111)))))

(assert (=> b!156466 (or (not (= (bvand lt!245116 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!245111 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!245116 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!245116 lt!245111) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!156466 (= lt!245111 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!156466 (= lt!245116 (bitIndex!0 (size!3216 (buf!3719 bs!65)) (currentByte!6834 bs!65) (currentBit!6829 bs!65)))))

(assert (= (and d!52110 res!130768) b!156465))

(assert (= (and b!156465 res!130769) b!156466))

(declare-fun m!244009 () Bool)

(assert (=> d!52110 m!244009))

(declare-fun m!244011 () Bool)

(assert (=> d!52110 m!244011))

(declare-fun m!244013 () Bool)

(assert (=> d!52110 m!244013))

(assert (=> b!156465 m!244013))

(assert (=> b!156465 m!244009))

(declare-fun m!244015 () Bool)

(assert (=> b!156466 m!244015))

(assert (=> b!156466 m!243885))

(assert (=> d!52046 d!52110))

(declare-fun d!52118 () Bool)

(assert (=> d!52118 (= (invariant!0 (currentBit!6829 bs!65) (currentByte!6834 bs!65) (size!3216 (buf!3719 bs!65))) (and (bvsge (currentBit!6829 bs!65) #b00000000000000000000000000000000) (bvslt (currentBit!6829 bs!65) #b00000000000000000000000000001000) (bvsge (currentByte!6834 bs!65) #b00000000000000000000000000000000) (or (bvslt (currentByte!6834 bs!65) (size!3216 (buf!3719 bs!65))) (and (= (currentBit!6829 bs!65) #b00000000000000000000000000000000) (= (currentByte!6834 bs!65) (size!3216 (buf!3719 bs!65)))))))))

(assert (=> d!52054 d!52118))

(push 1)

(assert (not d!52108))

(assert (not b!156446))

(assert (not b!156441))

(assert (not b!156442))

(assert (not d!52104))

(assert (not bm!2449))

(assert (not bm!2445))

(assert (not b!156443))

(assert (not b!156445))

(assert (not b!156438))

(assert (not b!156440))

(assert (not b!156466))

(assert (not d!52110))

(assert (not b!156437))

(assert (not bm!2447))

(assert (not d!52080))

(assert (not bm!2446))

(assert (not bm!2448))

(assert (not bm!2450))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

