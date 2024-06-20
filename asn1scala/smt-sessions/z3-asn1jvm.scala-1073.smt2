; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30942 () Bool)

(assert start!30942)

(declare-fun b!156364 () Bool)

(declare-fun res!130692 () Bool)

(declare-fun e!105634 () Bool)

(assert (=> b!156364 (=> (not res!130692) (not e!105634))))

(declare-datatypes ((array!7169 0))(
  ( (array!7170 (arr!4074 (Array (_ BitVec 32) (_ BitVec 8))) (size!3215 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5688 0))(
  ( (BitStream!5689 (buf!3718 array!7169) (currentByte!6833 (_ BitVec 32)) (currentBit!6828 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5688)

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!156364 (= res!130692 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3215 (buf!3718 bs!65))) ((_ sign_extend 32) (currentByte!6833 bs!65)) ((_ sign_extend 32) (currentBit!6828 bs!65)) (bvsub to!236 from!240)))))

(declare-fun res!130693 () Bool)

(assert (=> start!30942 (=> (not res!130693) (not e!105634))))

(declare-fun arr!153 () array!7169)

(assert (=> start!30942 (= res!130693 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3215 arr!153))))))

(assert (=> start!30942 e!105634))

(assert (=> start!30942 true))

(declare-fun array_inv!3004 (array!7169) Bool)

(assert (=> start!30942 (array_inv!3004 arr!153)))

(declare-fun e!105635 () Bool)

(declare-fun inv!12 (BitStream!5688) Bool)

(assert (=> start!30942 (and (inv!12 bs!65) e!105635)))

(declare-fun b!156366 () Bool)

(declare-fun e!105633 () Bool)

(declare-fun lt!244590 () BitStream!5688)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!156366 (= e!105633 (not (validate_offset_byte!0 ((_ sign_extend 32) (size!3215 (buf!3718 lt!244590))) ((_ sign_extend 32) (currentByte!6833 lt!244590)) ((_ sign_extend 32) (currentBit!6828 lt!244590)))))))

(declare-fun b!156365 () Bool)

(assert (=> b!156365 (= e!105634 e!105633)))

(declare-fun res!130694 () Bool)

(assert (=> b!156365 (=> (not res!130694) (not e!105633))))

(assert (=> b!156365 (= res!130694 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((tuple2!13982 0))(
  ( (tuple2!13983 (_1!7432 BitStream!5688) (_2!7432 array!7169)) )
))
(declare-fun lt!244589 () tuple2!13982)

(declare-fun readByteArrayLoopPure!0 (BitStream!5688 array!7169 (_ BitVec 32) (_ BitVec 32)) tuple2!13982)

(declare-datatypes ((tuple2!13984 0))(
  ( (tuple2!13985 (_1!7433 BitStream!5688) (_2!7433 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5688) tuple2!13984)

(assert (=> b!156365 (= lt!244589 (readByteArrayLoopPure!0 lt!244590 (array!7170 (store (arr!4074 arr!153) from!240 (_2!7433 (readBytePure!0 bs!65))) (size!3215 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5688 (_ BitVec 32)) BitStream!5688)

(assert (=> b!156365 (= lt!244590 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!244591 () tuple2!13982)

(assert (=> b!156365 (= lt!244591 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!156367 () Bool)

(assert (=> b!156367 (= e!105635 (array_inv!3004 (buf!3718 bs!65)))))

(assert (= (and start!30942 res!130693) b!156364))

(assert (= (and b!156364 res!130692) b!156365))

(assert (= (and b!156365 res!130694) b!156366))

(assert (= start!30942 b!156367))

(declare-fun m!243653 () Bool)

(assert (=> b!156364 m!243653))

(declare-fun m!243655 () Bool)

(assert (=> b!156366 m!243655))

(declare-fun m!243657 () Bool)

(assert (=> b!156367 m!243657))

(declare-fun m!243659 () Bool)

(assert (=> b!156365 m!243659))

(declare-fun m!243661 () Bool)

(assert (=> b!156365 m!243661))

(declare-fun m!243663 () Bool)

(assert (=> b!156365 m!243663))

(declare-fun m!243665 () Bool)

(assert (=> b!156365 m!243665))

(declare-fun m!243667 () Bool)

(assert (=> b!156365 m!243667))

(declare-fun m!243669 () Bool)

(assert (=> start!30942 m!243669))

(declare-fun m!243671 () Bool)

(assert (=> start!30942 m!243671))

(check-sat (not b!156365) (not b!156367) (not b!156366) (not start!30942) (not b!156364))
(check-sat)
(get-model)

(declare-datatypes ((Unit!10085 0))(
  ( (Unit!10086) )
))
(declare-datatypes ((tuple3!652 0))(
  ( (tuple3!653 (_1!7442 Unit!10085) (_2!7442 BitStream!5688) (_3!443 array!7169)) )
))
(declare-fun lt!244617 () tuple3!652)

(declare-fun d!52060 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!5688 array!7169 (_ BitVec 32) (_ BitVec 32)) tuple3!652)

(assert (=> d!52060 (= lt!244617 (readByteArrayLoop!0 lt!244590 (array!7170 (store (arr!4074 arr!153) from!240 (_2!7433 (readBytePure!0 bs!65))) (size!3215 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52060 (= (readByteArrayLoopPure!0 lt!244590 (array!7170 (store (arr!4074 arr!153) from!240 (_2!7433 (readBytePure!0 bs!65))) (size!3215 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) (tuple2!13983 (_2!7442 lt!244617) (_3!443 lt!244617)))))

(declare-fun bs!12755 () Bool)

(assert (= bs!12755 d!52060))

(declare-fun m!243721 () Bool)

(assert (=> bs!12755 m!243721))

(assert (=> b!156365 d!52060))

(declare-fun d!52062 () Bool)

(declare-datatypes ((tuple2!13998 0))(
  ( (tuple2!13999 (_1!7443 (_ BitVec 8)) (_2!7443 BitStream!5688)) )
))
(declare-fun lt!244620 () tuple2!13998)

(declare-fun readByte!0 (BitStream!5688) tuple2!13998)

(assert (=> d!52062 (= lt!244620 (readByte!0 bs!65))))

(assert (=> d!52062 (= (readBytePure!0 bs!65) (tuple2!13985 (_2!7443 lt!244620) (_1!7443 lt!244620)))))

(declare-fun bs!12756 () Bool)

(assert (= bs!12756 d!52062))

(declare-fun m!243723 () Bool)

(assert (=> bs!12756 m!243723))

(assert (=> b!156365 d!52062))

(declare-fun d!52064 () Bool)

(declare-datatypes ((tuple2!14000 0))(
  ( (tuple2!14001 (_1!7444 Unit!10085) (_2!7444 BitStream!5688)) )
))
(declare-fun moveByteIndex!0 (BitStream!5688 (_ BitVec 32)) tuple2!14000)

(assert (=> d!52064 (= (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7444 (moveByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun bs!12757 () Bool)

(assert (= bs!12757 d!52064))

(declare-fun m!243725 () Bool)

(assert (=> bs!12757 m!243725))

(assert (=> b!156365 d!52064))

(declare-fun lt!244621 () tuple3!652)

(declare-fun d!52066 () Bool)

(assert (=> d!52066 (= lt!244621 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!52066 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!13983 (_2!7442 lt!244621) (_3!443 lt!244621)))))

(declare-fun bs!12758 () Bool)

(assert (= bs!12758 d!52066))

(declare-fun m!243727 () Bool)

(assert (=> bs!12758 m!243727))

(assert (=> b!156365 d!52066))

(declare-fun d!52068 () Bool)

(assert (=> d!52068 (= (array_inv!3004 arr!153) (bvsge (size!3215 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!30942 d!52068))

(declare-fun d!52070 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!52070 (= (inv!12 bs!65) (invariant!0 (currentBit!6828 bs!65) (currentByte!6833 bs!65) (size!3215 (buf!3718 bs!65))))))

(declare-fun bs!12759 () Bool)

(assert (= bs!12759 d!52070))

(declare-fun m!243729 () Bool)

(assert (=> bs!12759 m!243729))

(assert (=> start!30942 d!52070))

(declare-fun d!52072 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!52072 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3215 (buf!3718 bs!65))) ((_ sign_extend 32) (currentByte!6833 bs!65)) ((_ sign_extend 32) (currentBit!6828 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3215 (buf!3718 bs!65))) ((_ sign_extend 32) (currentByte!6833 bs!65)) ((_ sign_extend 32) (currentBit!6828 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12760 () Bool)

(assert (= bs!12760 d!52072))

(declare-fun m!243731 () Bool)

(assert (=> bs!12760 m!243731))

(assert (=> b!156364 d!52072))

(declare-fun d!52074 () Bool)

(assert (=> d!52074 (= (array_inv!3004 (buf!3718 bs!65)) (bvsge (size!3215 (buf!3718 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!156367 d!52074))

(declare-fun d!52076 () Bool)

(assert (=> d!52076 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3215 (buf!3718 lt!244590))) ((_ sign_extend 32) (currentByte!6833 lt!244590)) ((_ sign_extend 32) (currentBit!6828 lt!244590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3215 (buf!3718 lt!244590))) ((_ sign_extend 32) (currentByte!6833 lt!244590)) ((_ sign_extend 32) (currentBit!6828 lt!244590))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!12761 () Bool)

(assert (= bs!12761 d!52076))

(declare-fun m!243733 () Bool)

(assert (=> bs!12761 m!243733))

(assert (=> b!156366 d!52076))

(check-sat (not d!52064) (not d!52070) (not d!52062) (not d!52066) (not d!52076) (not d!52060) (not d!52072))
(check-sat)
(get-model)

(declare-fun b!156412 () Bool)

(declare-fun e!105673 () tuple3!652)

(declare-fun lt!244844 () Unit!10085)

(declare-fun lt!244876 () tuple3!652)

(assert (=> b!156412 (= e!105673 (tuple3!653 lt!244844 (_2!7442 lt!244876) (_3!443 lt!244876)))))

(declare-fun lt!244853 () tuple2!13998)

(assert (=> b!156412 (= lt!244853 (readByte!0 lt!244590))))

(declare-fun lt!244847 () array!7169)

(assert (=> b!156412 (= lt!244847 (array!7170 (store (arr!4074 (array!7170 (store (arr!4074 arr!153) from!240 (_2!7433 (readBytePure!0 bs!65))) (size!3215 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7443 lt!244853)) (size!3215 (array!7170 (store (arr!4074 arr!153) from!240 (_2!7433 (readBytePure!0 bs!65))) (size!3215 arr!153)))))))

(declare-fun lt!244877 () (_ BitVec 64))

(assert (=> b!156412 (= lt!244877 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!244880 () (_ BitVec 32))

(assert (=> b!156412 (= lt!244880 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!244870 () Unit!10085)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5688 BitStream!5688 (_ BitVec 64) (_ BitVec 32)) Unit!10085)

(assert (=> b!156412 (= lt!244870 (validateOffsetBytesFromBitIndexLemma!0 lt!244590 (_2!7443 lt!244853) lt!244877 lt!244880))))

(assert (=> b!156412 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3215 (buf!3718 (_2!7443 lt!244853)))) ((_ sign_extend 32) (currentByte!6833 (_2!7443 lt!244853))) ((_ sign_extend 32) (currentBit!6828 (_2!7443 lt!244853))) (bvsub lt!244880 ((_ extract 31 0) (bvsdiv (bvadd lt!244877 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!244861 () Unit!10085)

(assert (=> b!156412 (= lt!244861 lt!244870)))

(assert (=> b!156412 (= lt!244876 (readByteArrayLoop!0 (_2!7443 lt!244853) lt!244847 (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!156412 (= (bitIndex!0 (size!3215 (buf!3718 (_2!7443 lt!244853))) (currentByte!6833 (_2!7443 lt!244853)) (currentBit!6828 (_2!7443 lt!244853))) (bvadd (bitIndex!0 (size!3215 (buf!3718 lt!244590)) (currentByte!6833 lt!244590) (currentBit!6828 lt!244590)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!244883 () Unit!10085)

(declare-fun Unit!10095 () Unit!10085)

(assert (=> b!156412 (= lt!244883 Unit!10095)))

(declare-fun call!2436 () (_ BitVec 64))

(assert (=> b!156412 (= (bvadd (bitIndex!0 (size!3215 (buf!3718 (_2!7443 lt!244853))) (currentByte!6833 (_2!7443 lt!244853)) (currentBit!6828 (_2!7443 lt!244853))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2436)))

(declare-fun lt!244854 () Unit!10085)

(declare-fun Unit!10096 () Unit!10085)

(assert (=> b!156412 (= lt!244854 Unit!10096)))

(assert (=> b!156412 (= (bvadd (bitIndex!0 (size!3215 (buf!3718 lt!244590)) (currentByte!6833 lt!244590) (currentBit!6828 lt!244590)) (bvmul ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2436)))

(declare-fun lt!244881 () Unit!10085)

(declare-fun Unit!10097 () Unit!10085)

(assert (=> b!156412 (= lt!244881 Unit!10097)))

(assert (=> b!156412 (and (= (buf!3718 lt!244590) (buf!3718 (_2!7442 lt!244876))) (= (size!3215 (array!7170 (store (arr!4074 arr!153) from!240 (_2!7433 (readBytePure!0 bs!65))) (size!3215 arr!153))) (size!3215 (_3!443 lt!244876))))))

(declare-fun lt!244863 () Unit!10085)

(declare-fun Unit!10098 () Unit!10085)

(assert (=> b!156412 (= lt!244863 Unit!10098)))

(declare-fun lt!244873 () Unit!10085)

(declare-fun arrayUpdatedAtPrefixLemma!37 (array!7169 (_ BitVec 32) (_ BitVec 8)) Unit!10085)

(assert (=> b!156412 (= lt!244873 (arrayUpdatedAtPrefixLemma!37 (array!7170 (store (arr!4074 arr!153) from!240 (_2!7433 (readBytePure!0 bs!65))) (size!3215 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) (_1!7443 lt!244853)))))

(declare-fun call!2438 () Bool)

(assert (=> b!156412 call!2438))

(declare-fun lt!244865 () Unit!10085)

(assert (=> b!156412 (= lt!244865 lt!244873)))

(declare-fun lt!244868 () (_ BitVec 32))

(assert (=> b!156412 (= lt!244868 #b00000000000000000000000000000000)))

(declare-fun lt!244864 () Unit!10085)

(declare-fun arrayRangesEqTransitive!102 (array!7169 array!7169 array!7169 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10085)

(assert (=> b!156412 (= lt!244864 (arrayRangesEqTransitive!102 (array!7170 (store (arr!4074 arr!153) from!240 (_2!7433 (readBytePure!0 bs!65))) (size!3215 arr!153)) lt!244847 (_3!443 lt!244876) lt!244868 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(declare-fun call!2437 () Bool)

(assert (=> b!156412 call!2437))

(declare-fun lt!244857 () Unit!10085)

(assert (=> b!156412 (= lt!244857 lt!244864)))

(declare-fun arrayRangesEq!426 (array!7169 array!7169 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!156412 (arrayRangesEq!426 (array!7170 (store (arr!4074 arr!153) from!240 (_2!7433 (readBytePure!0 bs!65))) (size!3215 arr!153)) (_3!443 lt!244876) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240))))

(declare-fun lt!244878 () Unit!10085)

(declare-fun Unit!10101 () Unit!10085)

(assert (=> b!156412 (= lt!244878 Unit!10101)))

(declare-fun lt!244849 () Unit!10085)

(declare-fun arrayRangesEqImpliesEq!46 (array!7169 array!7169 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10085)

(assert (=> b!156412 (= lt!244849 (arrayRangesEqImpliesEq!46 lt!244847 (_3!443 lt!244876) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!156412 (= (select (store (arr!4074 (array!7170 (store (arr!4074 arr!153) from!240 (_2!7433 (readBytePure!0 bs!65))) (size!3215 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7443 lt!244853)) (bvadd #b00000000000000000000000000000001 from!240)) (select (arr!4074 (_3!443 lt!244876)) (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!244858 () Unit!10085)

(assert (=> b!156412 (= lt!244858 lt!244849)))

(declare-fun lt!244860 () Bool)

(assert (=> b!156412 (= lt!244860 (= (select (arr!4074 (_3!443 lt!244876)) (bvadd #b00000000000000000000000000000001 from!240)) (_1!7443 lt!244853)))))

(declare-fun Unit!10103 () Unit!10085)

(assert (=> b!156412 (= lt!244844 Unit!10103)))

(assert (=> b!156412 lt!244860))

(declare-fun b!156413 () Bool)

(declare-fun lt!244867 () tuple3!652)

(declare-fun e!105672 () Bool)

(assert (=> b!156413 (= e!105672 (= (select (arr!4074 (_3!443 lt!244867)) (bvadd #b00000000000000000000000000000001 from!240)) (_2!7433 (readBytePure!0 lt!244590))))))

(assert (=> b!156413 (and (bvsge (bvadd #b00000000000000000000000000000001 from!240) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!240) (size!3215 (_3!443 lt!244867))))))

(declare-fun b!156414 () Bool)

(declare-fun res!130723 () Bool)

(declare-fun e!105671 () Bool)

(assert (=> b!156414 (=> (not res!130723) (not e!105671))))

(assert (=> b!156414 (= res!130723 (and (= (buf!3718 lt!244590) (buf!3718 (_2!7442 lt!244867))) (= (size!3215 (array!7170 (store (arr!4074 arr!153) from!240 (_2!7433 (readBytePure!0 bs!65))) (size!3215 arr!153))) (size!3215 (_3!443 lt!244867)))))))

(declare-fun d!52084 () Bool)

(assert (=> d!52084 e!105672))

(declare-fun res!130725 () Bool)

(assert (=> d!52084 (=> res!130725 e!105672)))

(assert (=> d!52084 (= res!130725 (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!244882 () Bool)

(assert (=> d!52084 (= lt!244882 e!105671)))

(declare-fun res!130724 () Bool)

(assert (=> d!52084 (=> (not res!130724) (not e!105671))))

(declare-fun lt!244862 () (_ BitVec 64))

(declare-fun lt!244859 () (_ BitVec 64))

(assert (=> d!52084 (= res!130724 (= (bvadd lt!244859 lt!244862) (bitIndex!0 (size!3215 (buf!3718 (_2!7442 lt!244867))) (currentByte!6833 (_2!7442 lt!244867)) (currentBit!6828 (_2!7442 lt!244867)))))))

(assert (=> d!52084 (or (not (= (bvand lt!244859 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!244862 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!244859 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!244859 lt!244862) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!244875 () (_ BitVec 64))

(assert (=> d!52084 (= lt!244862 (bvmul lt!244875 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!52084 (or (= lt!244875 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!244875 #b0000000000000000000000000000000000000000000000000000000000001000) lt!244875)))))

(assert (=> d!52084 (= lt!244875 ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))))))

(assert (=> d!52084 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!240) #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b10000000000000000000000000000000)))))

(assert (=> d!52084 (= lt!244859 (bitIndex!0 (size!3215 (buf!3718 lt!244590)) (currentByte!6833 lt!244590) (currentBit!6828 lt!244590)))))

(assert (=> d!52084 (= lt!244867 e!105673)))

(declare-fun c!8336 () Bool)

(assert (=> d!52084 (= c!8336 (bvslt (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52084 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsle (bvadd #b00000000000000000000000000000001 from!240) to!236) (bvsle to!236 (size!3215 (array!7170 (store (arr!4074 arr!153) from!240 (_2!7433 (readBytePure!0 bs!65))) (size!3215 arr!153)))))))

(assert (=> d!52084 (= (readByteArrayLoop!0 lt!244590 (array!7170 (store (arr!4074 arr!153) from!240 (_2!7433 (readBytePure!0 bs!65))) (size!3215 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) lt!244867)))

(declare-fun b!156415 () Bool)

(declare-fun lt!244879 () Unit!10085)

(assert (=> b!156415 (= e!105673 (tuple3!653 lt!244879 lt!244590 (array!7170 (store (arr!4074 arr!153) from!240 (_2!7433 (readBytePure!0 bs!65))) (size!3215 arr!153))))))

(assert (=> b!156415 (= call!2436 call!2436)))

(declare-fun lt!244851 () Unit!10085)

(declare-fun Unit!10105 () Unit!10085)

(assert (=> b!156415 (= lt!244851 Unit!10105)))

(declare-fun lt!244874 () Unit!10085)

(declare-fun arrayRangesEqReflexiveLemma!37 (array!7169) Unit!10085)

(assert (=> b!156415 (= lt!244874 (arrayRangesEqReflexiveLemma!37 (array!7170 (store (arr!4074 arr!153) from!240 (_2!7433 (readBytePure!0 bs!65))) (size!3215 arr!153))))))

(assert (=> b!156415 call!2437))

(declare-fun lt!244848 () Unit!10085)

(assert (=> b!156415 (= lt!244848 lt!244874)))

(declare-fun lt!244852 () array!7169)

(assert (=> b!156415 (= lt!244852 (array!7170 (store (arr!4074 arr!153) from!240 (_2!7433 (readBytePure!0 bs!65))) (size!3215 arr!153)))))

(declare-fun lt!244869 () array!7169)

(assert (=> b!156415 (= lt!244869 (array!7170 (store (arr!4074 arr!153) from!240 (_2!7433 (readBytePure!0 bs!65))) (size!3215 arr!153)))))

(declare-fun lt!244856 () (_ BitVec 32))

(assert (=> b!156415 (= lt!244856 #b00000000000000000000000000000000)))

(declare-fun lt!244850 () (_ BitVec 32))

(assert (=> b!156415 (= lt!244850 (size!3215 (array!7170 (store (arr!4074 arr!153) from!240 (_2!7433 (readBytePure!0 bs!65))) (size!3215 arr!153))))))

(declare-fun lt!244866 () (_ BitVec 32))

(assert (=> b!156415 (= lt!244866 #b00000000000000000000000000000000)))

(declare-fun lt!244855 () (_ BitVec 32))

(assert (=> b!156415 (= lt!244855 (bvadd #b00000000000000000000000000000001 from!240))))

(declare-fun arrayRangesEqSlicedLemma!37 (array!7169 array!7169 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10085)

(assert (=> b!156415 (= lt!244879 (arrayRangesEqSlicedLemma!37 lt!244852 lt!244869 lt!244856 lt!244850 lt!244866 lt!244855))))

(assert (=> b!156415 call!2438))

(declare-fun b!156416 () Bool)

(assert (=> b!156416 (= e!105671 (arrayRangesEq!426 (array!7170 (store (arr!4074 arr!153) from!240 (_2!7433 (readBytePure!0 bs!65))) (size!3215 arr!153)) (_3!443 lt!244867) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun bm!2433 () Bool)

(assert (=> bm!2433 (= call!2436 (bitIndex!0 (ite c!8336 (size!3215 (buf!3718 (_2!7442 lt!244876))) (size!3215 (buf!3718 lt!244590))) (ite c!8336 (currentByte!6833 (_2!7442 lt!244876)) (currentByte!6833 lt!244590)) (ite c!8336 (currentBit!6828 (_2!7442 lt!244876)) (currentBit!6828 lt!244590))))))

(declare-fun bm!2434 () Bool)

(assert (=> bm!2434 (= call!2437 (arrayRangesEq!426 (array!7170 (store (arr!4074 arr!153) from!240 (_2!7433 (readBytePure!0 bs!65))) (size!3215 arr!153)) (ite c!8336 (_3!443 lt!244876) (array!7170 (store (arr!4074 arr!153) from!240 (_2!7433 (readBytePure!0 bs!65))) (size!3215 arr!153))) (ite c!8336 lt!244868 #b00000000000000000000000000000000) (ite c!8336 (bvadd #b00000000000000000000000000000001 from!240) (size!3215 (array!7170 (store (arr!4074 arr!153) from!240 (_2!7433 (readBytePure!0 bs!65))) (size!3215 arr!153))))))))

(declare-fun bm!2435 () Bool)

(assert (=> bm!2435 (= call!2438 (arrayRangesEq!426 (ite c!8336 (array!7170 (store (arr!4074 arr!153) from!240 (_2!7433 (readBytePure!0 bs!65))) (size!3215 arr!153)) lt!244852) (ite c!8336 (array!7170 (store (arr!4074 (array!7170 (store (arr!4074 arr!153) from!240 (_2!7433 (readBytePure!0 bs!65))) (size!3215 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7443 lt!244853)) (size!3215 (array!7170 (store (arr!4074 arr!153) from!240 (_2!7433 (readBytePure!0 bs!65))) (size!3215 arr!153)))) lt!244869) (ite c!8336 #b00000000000000000000000000000000 lt!244866) (ite c!8336 (bvadd #b00000000000000000000000000000001 from!240) lt!244855)))))

(assert (= (and d!52084 c!8336) b!156412))

(assert (= (and d!52084 (not c!8336)) b!156415))

(assert (= (or b!156412 b!156415) bm!2435))

(assert (= (or b!156412 b!156415) bm!2434))

(assert (= (or b!156412 b!156415) bm!2433))

(assert (= (and d!52084 res!130724) b!156414))

(assert (= (and b!156414 res!130723) b!156416))

(assert (= (and d!52084 (not res!130725)) b!156413))

(declare-fun m!243781 () Bool)

(assert (=> b!156412 m!243781))

(declare-fun m!243783 () Bool)

(assert (=> b!156412 m!243783))

(declare-fun m!243785 () Bool)

(assert (=> b!156412 m!243785))

(declare-fun m!243787 () Bool)

(assert (=> b!156412 m!243787))

(declare-fun m!243789 () Bool)

(assert (=> b!156412 m!243789))

(declare-fun m!243791 () Bool)

(assert (=> b!156412 m!243791))

(declare-fun m!243793 () Bool)

(assert (=> b!156412 m!243793))

(declare-fun m!243795 () Bool)

(assert (=> b!156412 m!243795))

(declare-fun m!243797 () Bool)

(assert (=> b!156412 m!243797))

(declare-fun m!243799 () Bool)

(assert (=> b!156412 m!243799))

(declare-fun m!243801 () Bool)

(assert (=> b!156412 m!243801))

(declare-fun m!243803 () Bool)

(assert (=> b!156412 m!243803))

(declare-fun m!243805 () Bool)

(assert (=> b!156412 m!243805))

(assert (=> bm!2435 m!243787))

(declare-fun m!243807 () Bool)

(assert (=> bm!2435 m!243807))

(declare-fun m!243809 () Bool)

(assert (=> b!156415 m!243809))

(declare-fun m!243811 () Bool)

(assert (=> b!156415 m!243811))

(declare-fun m!243813 () Bool)

(assert (=> d!52084 m!243813))

(assert (=> d!52084 m!243797))

(declare-fun m!243815 () Bool)

(assert (=> b!156416 m!243815))

(declare-fun m!243817 () Bool)

(assert (=> b!156413 m!243817))

(declare-fun m!243819 () Bool)

(assert (=> b!156413 m!243819))

(declare-fun m!243821 () Bool)

(assert (=> bm!2434 m!243821))

(declare-fun m!243823 () Bool)

(assert (=> bm!2433 m!243823))

(assert (=> d!52060 d!52084))

(declare-fun d!52094 () Bool)

(assert (=> d!52094 (= (remainingBits!0 ((_ sign_extend 32) (size!3215 (buf!3718 bs!65))) ((_ sign_extend 32) (currentByte!6833 bs!65)) ((_ sign_extend 32) (currentBit!6828 bs!65))) (bvsub (bvmul ((_ sign_extend 32) (size!3215 (buf!3718 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6833 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6828 bs!65)))))))

(assert (=> d!52072 d!52094))

(declare-fun d!52096 () Bool)

(declare-fun e!105684 () Bool)

(assert (=> d!52096 e!105684))

(declare-fun res!130738 () Bool)

(assert (=> d!52096 (=> (not res!130738) (not e!105684))))

(declare-fun moveByteIndexPrecond!0 (BitStream!5688 (_ BitVec 32)) Bool)

(assert (=> d!52096 (= res!130738 (moveByteIndexPrecond!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun Unit!10112 () Unit!10085)

(assert (=> d!52096 (= (moveByteIndex!0 bs!65 #b00000000000000000000000000000001) (tuple2!14001 Unit!10112 (BitStream!5689 (buf!3718 bs!65) (bvadd (currentByte!6833 bs!65) #b00000000000000000000000000000001) (currentBit!6828 bs!65))))))

(declare-fun b!156429 () Bool)

(assert (=> b!156429 (= e!105684 (and (or (not (= (bvand (currentByte!6833 bs!65) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6833 bs!65) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6833 bs!65) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6833 bs!65) #b00000000000000000000000000000001) (bvadd (currentByte!6833 bs!65) #b00000000000000000000000000000001))))))

(assert (= (and d!52096 res!130738) b!156429))

(declare-fun m!243825 () Bool)

(assert (=> d!52096 m!243825))

(assert (=> d!52064 d!52096))

(declare-fun d!52098 () Bool)

(declare-fun lt!245058 () (_ BitVec 8))

(declare-fun lt!245055 () (_ BitVec 8))

(assert (=> d!52098 (= lt!245058 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4074 (buf!3718 bs!65)) (currentByte!6833 bs!65))) ((_ sign_extend 24) lt!245055))))))

(assert (=> d!52098 (= lt!245055 ((_ extract 7 0) (currentBit!6828 bs!65)))))

(declare-fun e!105703 () Bool)

(assert (=> d!52098 e!105703))

(declare-fun res!130759 () Bool)

(assert (=> d!52098 (=> (not res!130759) (not e!105703))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!52098 (= res!130759 (validate_offset_bits!1 ((_ sign_extend 32) (size!3215 (buf!3718 bs!65))) ((_ sign_extend 32) (currentByte!6833 bs!65)) ((_ sign_extend 32) (currentBit!6828 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!14004 0))(
  ( (tuple2!14005 (_1!7446 Unit!10085) (_2!7446 (_ BitVec 8))) )
))
(declare-fun Unit!10115 () Unit!10085)

(declare-fun Unit!10116 () Unit!10085)

(assert (=> d!52098 (= (readByte!0 bs!65) (tuple2!13999 (_2!7446 (ite (bvsgt ((_ sign_extend 24) lt!245055) #b00000000000000000000000000000000) (tuple2!14005 Unit!10115 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!245058) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4074 (buf!3718 bs!65)) (bvadd (currentByte!6833 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!245055)))))))) (tuple2!14005 Unit!10116 lt!245058))) (BitStream!5689 (buf!3718 bs!65) (bvadd (currentByte!6833 bs!65) #b00000000000000000000000000000001) (currentBit!6828 bs!65))))))

(declare-fun b!156454 () Bool)

(declare-fun e!105704 () Bool)

(assert (=> b!156454 (= e!105703 e!105704)))

(declare-fun res!130758 () Bool)

(assert (=> b!156454 (=> (not res!130758) (not e!105704))))

(declare-fun lt!245054 () tuple2!13998)

(assert (=> b!156454 (= res!130758 (= (buf!3718 (_2!7443 lt!245054)) (buf!3718 bs!65)))))

(declare-fun lt!245059 () (_ BitVec 8))

(declare-fun lt!245056 () (_ BitVec 8))

(declare-fun Unit!10119 () Unit!10085)

(declare-fun Unit!10120 () Unit!10085)

(assert (=> b!156454 (= lt!245054 (tuple2!13999 (_2!7446 (ite (bvsgt ((_ sign_extend 24) lt!245056) #b00000000000000000000000000000000) (tuple2!14005 Unit!10119 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!245059) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4074 (buf!3718 bs!65)) (bvadd (currentByte!6833 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!245056)))))))) (tuple2!14005 Unit!10120 lt!245059))) (BitStream!5689 (buf!3718 bs!65) (bvadd (currentByte!6833 bs!65) #b00000000000000000000000000000001) (currentBit!6828 bs!65))))))

(assert (=> b!156454 (= lt!245059 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4074 (buf!3718 bs!65)) (currentByte!6833 bs!65))) ((_ sign_extend 24) lt!245056))))))

(assert (=> b!156454 (= lt!245056 ((_ extract 7 0) (currentBit!6828 bs!65)))))

(declare-fun lt!245057 () (_ BitVec 64))

(declare-fun lt!245053 () (_ BitVec 64))

(declare-fun b!156455 () Bool)

(assert (=> b!156455 (= e!105704 (= (bitIndex!0 (size!3215 (buf!3718 (_2!7443 lt!245054))) (currentByte!6833 (_2!7443 lt!245054)) (currentBit!6828 (_2!7443 lt!245054))) (bvadd lt!245057 lt!245053)))))

(assert (=> b!156455 (or (not (= (bvand lt!245057 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!245053 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!245057 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!245057 lt!245053) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!156455 (= lt!245053 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!156455 (= lt!245057 (bitIndex!0 (size!3215 (buf!3718 bs!65)) (currentByte!6833 bs!65) (currentBit!6828 bs!65)))))

(assert (= (and d!52098 res!130759) b!156454))

(assert (= (and b!156454 res!130758) b!156455))

(declare-fun m!243961 () Bool)

(assert (=> d!52098 m!243961))

(declare-fun m!243963 () Bool)

(assert (=> d!52098 m!243963))

(declare-fun m!243965 () Bool)

(assert (=> d!52098 m!243965))

(assert (=> b!156454 m!243965))

(assert (=> b!156454 m!243961))

(declare-fun m!243967 () Bool)

(assert (=> b!156455 m!243967))

(declare-fun m!243969 () Bool)

(assert (=> b!156455 m!243969))

(assert (=> d!52062 d!52098))

(declare-fun d!52112 () Bool)

(assert (=> d!52112 (= (invariant!0 (currentBit!6828 bs!65) (currentByte!6833 bs!65) (size!3215 (buf!3718 bs!65))) (and (bvsge (currentBit!6828 bs!65) #b00000000000000000000000000000000) (bvslt (currentBit!6828 bs!65) #b00000000000000000000000000001000) (bvsge (currentByte!6833 bs!65) #b00000000000000000000000000000000) (or (bvslt (currentByte!6833 bs!65) (size!3215 (buf!3718 bs!65))) (and (= (currentBit!6828 bs!65) #b00000000000000000000000000000000) (= (currentByte!6833 bs!65) (size!3215 (buf!3718 bs!65)))))))))

(assert (=> d!52070 d!52112))

(declare-fun b!156456 () Bool)

(declare-fun e!105707 () tuple3!652)

(declare-fun lt!245060 () Unit!10085)

(declare-fun lt!245088 () tuple3!652)

(assert (=> b!156456 (= e!105707 (tuple3!653 lt!245060 (_2!7442 lt!245088) (_3!443 lt!245088)))))

(declare-fun lt!245067 () tuple2!13998)

(assert (=> b!156456 (= lt!245067 (readByte!0 bs!65))))

(declare-fun lt!245061 () array!7169)

(assert (=> b!156456 (= lt!245061 (array!7170 (store (arr!4074 arr!153) from!240 (_1!7443 lt!245067)) (size!3215 arr!153)))))

(declare-fun lt!245089 () (_ BitVec 64))

(assert (=> b!156456 (= lt!245089 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!245092 () (_ BitVec 32))

(assert (=> b!156456 (= lt!245092 (bvsub to!236 from!240))))

(declare-fun lt!245084 () Unit!10085)

(assert (=> b!156456 (= lt!245084 (validateOffsetBytesFromBitIndexLemma!0 bs!65 (_2!7443 lt!245067) lt!245089 lt!245092))))

(assert (=> b!156456 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3215 (buf!3718 (_2!7443 lt!245067)))) ((_ sign_extend 32) (currentByte!6833 (_2!7443 lt!245067))) ((_ sign_extend 32) (currentBit!6828 (_2!7443 lt!245067))) (bvsub lt!245092 ((_ extract 31 0) (bvsdiv (bvadd lt!245089 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!245075 () Unit!10085)

(assert (=> b!156456 (= lt!245075 lt!245084)))

(assert (=> b!156456 (= lt!245088 (readByteArrayLoop!0 (_2!7443 lt!245067) lt!245061 (bvadd from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!156456 (= (bitIndex!0 (size!3215 (buf!3718 (_2!7443 lt!245067))) (currentByte!6833 (_2!7443 lt!245067)) (currentBit!6828 (_2!7443 lt!245067))) (bvadd (bitIndex!0 (size!3215 (buf!3718 bs!65)) (currentByte!6833 bs!65) (currentBit!6828 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!245095 () Unit!10085)

(declare-fun Unit!10124 () Unit!10085)

(assert (=> b!156456 (= lt!245095 Unit!10124)))

(declare-fun call!2454 () (_ BitVec 64))

(assert (=> b!156456 (= (bvadd (bitIndex!0 (size!3215 (buf!3718 (_2!7443 lt!245067))) (currentByte!6833 (_2!7443 lt!245067)) (currentBit!6828 (_2!7443 lt!245067))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2454)))

(declare-fun lt!245068 () Unit!10085)

(declare-fun Unit!10125 () Unit!10085)

(assert (=> b!156456 (= lt!245068 Unit!10125)))

(assert (=> b!156456 (= (bvadd (bitIndex!0 (size!3215 (buf!3718 bs!65)) (currentByte!6833 bs!65) (currentBit!6828 bs!65)) (bvmul ((_ sign_extend 32) (bvsub to!236 from!240)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2454)))

(declare-fun lt!245093 () Unit!10085)

(declare-fun Unit!10126 () Unit!10085)

(assert (=> b!156456 (= lt!245093 Unit!10126)))

(assert (=> b!156456 (and (= (buf!3718 bs!65) (buf!3718 (_2!7442 lt!245088))) (= (size!3215 arr!153) (size!3215 (_3!443 lt!245088))))))

(declare-fun lt!245077 () Unit!10085)

(declare-fun Unit!10127 () Unit!10085)

(assert (=> b!156456 (= lt!245077 Unit!10127)))

(declare-fun lt!245085 () Unit!10085)

(assert (=> b!156456 (= lt!245085 (arrayUpdatedAtPrefixLemma!37 arr!153 from!240 (_1!7443 lt!245067)))))

(declare-fun call!2456 () Bool)

(assert (=> b!156456 call!2456))

(declare-fun lt!245079 () Unit!10085)

(assert (=> b!156456 (= lt!245079 lt!245085)))

(declare-fun lt!245082 () (_ BitVec 32))

(assert (=> b!156456 (= lt!245082 #b00000000000000000000000000000000)))

(declare-fun lt!245078 () Unit!10085)

(assert (=> b!156456 (= lt!245078 (arrayRangesEqTransitive!102 arr!153 lt!245061 (_3!443 lt!245088) lt!245082 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(declare-fun call!2455 () Bool)

(assert (=> b!156456 call!2455))

(declare-fun lt!245071 () Unit!10085)

(assert (=> b!156456 (= lt!245071 lt!245078)))

(assert (=> b!156456 (arrayRangesEq!426 arr!153 (_3!443 lt!245088) #b00000000000000000000000000000000 from!240)))

(declare-fun lt!245090 () Unit!10085)

(declare-fun Unit!10128 () Unit!10085)

(assert (=> b!156456 (= lt!245090 Unit!10128)))

(declare-fun lt!245063 () Unit!10085)

(assert (=> b!156456 (= lt!245063 (arrayRangesEqImpliesEq!46 lt!245061 (_3!443 lt!245088) #b00000000000000000000000000000000 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!156456 (= (select (store (arr!4074 arr!153) from!240 (_1!7443 lt!245067)) from!240) (select (arr!4074 (_3!443 lt!245088)) from!240))))

(declare-fun lt!245072 () Unit!10085)

(assert (=> b!156456 (= lt!245072 lt!245063)))

(declare-fun lt!245074 () Bool)

(assert (=> b!156456 (= lt!245074 (= (select (arr!4074 (_3!443 lt!245088)) from!240) (_1!7443 lt!245067)))))

(declare-fun Unit!10130 () Unit!10085)

(assert (=> b!156456 (= lt!245060 Unit!10130)))

(assert (=> b!156456 lt!245074))

(declare-fun e!105706 () Bool)

(declare-fun b!156457 () Bool)

(declare-fun lt!245081 () tuple3!652)

(assert (=> b!156457 (= e!105706 (= (select (arr!4074 (_3!443 lt!245081)) from!240) (_2!7433 (readBytePure!0 bs!65))))))

(assert (=> b!156457 (and (bvsge from!240 #b00000000000000000000000000000000) (bvslt from!240 (size!3215 (_3!443 lt!245081))))))

(declare-fun b!156458 () Bool)

(declare-fun res!130761 () Bool)

(declare-fun e!105705 () Bool)

(assert (=> b!156458 (=> (not res!130761) (not e!105705))))

(assert (=> b!156458 (= res!130761 (and (= (buf!3718 bs!65) (buf!3718 (_2!7442 lt!245081))) (= (size!3215 arr!153) (size!3215 (_3!443 lt!245081)))))))

(declare-fun d!52114 () Bool)

(assert (=> d!52114 e!105706))

(declare-fun res!130763 () Bool)

(assert (=> d!52114 (=> res!130763 e!105706)))

(assert (=> d!52114 (= res!130763 (bvsge from!240 to!236))))

(declare-fun lt!245094 () Bool)

(assert (=> d!52114 (= lt!245094 e!105705)))

(declare-fun res!130762 () Bool)

(assert (=> d!52114 (=> (not res!130762) (not e!105705))))

(declare-fun lt!245073 () (_ BitVec 64))

(declare-fun lt!245076 () (_ BitVec 64))

(assert (=> d!52114 (= res!130762 (= (bvadd lt!245073 lt!245076) (bitIndex!0 (size!3215 (buf!3718 (_2!7442 lt!245081))) (currentByte!6833 (_2!7442 lt!245081)) (currentBit!6828 (_2!7442 lt!245081)))))))

(assert (=> d!52114 (or (not (= (bvand lt!245073 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!245076 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!245073 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!245073 lt!245076) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!245087 () (_ BitVec 64))

(assert (=> d!52114 (= lt!245076 (bvmul lt!245087 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!52114 (or (= lt!245087 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!245087 #b0000000000000000000000000000000000000000000000000000000000001000) lt!245087)))))

(assert (=> d!52114 (= lt!245087 ((_ sign_extend 32) (bvsub to!236 from!240)))))

(assert (=> d!52114 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand from!240 #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000)))))

(assert (=> d!52114 (= lt!245073 (bitIndex!0 (size!3215 (buf!3718 bs!65)) (currentByte!6833 bs!65) (currentBit!6828 bs!65)))))

(assert (=> d!52114 (= lt!245081 e!105707)))

(declare-fun c!8340 () Bool)

(assert (=> d!52114 (= c!8340 (bvslt from!240 to!236))))

(assert (=> d!52114 (and (bvsle #b00000000000000000000000000000000 from!240) (bvsle from!240 to!236) (bvsle to!236 (size!3215 arr!153)))))

(assert (=> d!52114 (= (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236) lt!245081)))

(declare-fun b!156459 () Bool)

(declare-fun lt!245091 () Unit!10085)

(assert (=> b!156459 (= e!105707 (tuple3!653 lt!245091 bs!65 arr!153))))

(assert (=> b!156459 (= call!2454 call!2454)))

(declare-fun lt!245065 () Unit!10085)

(declare-fun Unit!10131 () Unit!10085)

(assert (=> b!156459 (= lt!245065 Unit!10131)))

(declare-fun lt!245086 () Unit!10085)

(assert (=> b!156459 (= lt!245086 (arrayRangesEqReflexiveLemma!37 arr!153))))

(assert (=> b!156459 call!2455))

(declare-fun lt!245062 () Unit!10085)

(assert (=> b!156459 (= lt!245062 lt!245086)))

(declare-fun lt!245066 () array!7169)

(assert (=> b!156459 (= lt!245066 arr!153)))

(declare-fun lt!245083 () array!7169)

(assert (=> b!156459 (= lt!245083 arr!153)))

(declare-fun lt!245070 () (_ BitVec 32))

(assert (=> b!156459 (= lt!245070 #b00000000000000000000000000000000)))

(declare-fun lt!245064 () (_ BitVec 32))

(assert (=> b!156459 (= lt!245064 (size!3215 arr!153))))

(declare-fun lt!245080 () (_ BitVec 32))

(assert (=> b!156459 (= lt!245080 #b00000000000000000000000000000000)))

(declare-fun lt!245069 () (_ BitVec 32))

(assert (=> b!156459 (= lt!245069 from!240)))

(assert (=> b!156459 (= lt!245091 (arrayRangesEqSlicedLemma!37 lt!245066 lt!245083 lt!245070 lt!245064 lt!245080 lt!245069))))

(assert (=> b!156459 call!2456))

(declare-fun b!156460 () Bool)

(assert (=> b!156460 (= e!105705 (arrayRangesEq!426 arr!153 (_3!443 lt!245081) #b00000000000000000000000000000000 from!240))))

(declare-fun bm!2451 () Bool)

(assert (=> bm!2451 (= call!2454 (bitIndex!0 (ite c!8340 (size!3215 (buf!3718 (_2!7442 lt!245088))) (size!3215 (buf!3718 bs!65))) (ite c!8340 (currentByte!6833 (_2!7442 lt!245088)) (currentByte!6833 bs!65)) (ite c!8340 (currentBit!6828 (_2!7442 lt!245088)) (currentBit!6828 bs!65))))))

(declare-fun bm!2452 () Bool)

(assert (=> bm!2452 (= call!2455 (arrayRangesEq!426 arr!153 (ite c!8340 (_3!443 lt!245088) arr!153) (ite c!8340 lt!245082 #b00000000000000000000000000000000) (ite c!8340 from!240 (size!3215 arr!153))))))

(declare-fun bm!2453 () Bool)

(assert (=> bm!2453 (= call!2456 (arrayRangesEq!426 (ite c!8340 arr!153 lt!245066) (ite c!8340 (array!7170 (store (arr!4074 arr!153) from!240 (_1!7443 lt!245067)) (size!3215 arr!153)) lt!245083) (ite c!8340 #b00000000000000000000000000000000 lt!245080) (ite c!8340 from!240 lt!245069)))))

(assert (= (and d!52114 c!8340) b!156456))

(assert (= (and d!52114 (not c!8340)) b!156459))

(assert (= (or b!156456 b!156459) bm!2453))

(assert (= (or b!156456 b!156459) bm!2452))

(assert (= (or b!156456 b!156459) bm!2451))

(assert (= (and d!52114 res!130762) b!156458))

(assert (= (and b!156458 res!130761) b!156460))

(assert (= (and d!52114 (not res!130763)) b!156457))

(declare-fun m!243971 () Bool)

(assert (=> b!156456 m!243971))

(declare-fun m!243973 () Bool)

(assert (=> b!156456 m!243973))

(declare-fun m!243975 () Bool)

(assert (=> b!156456 m!243975))

(declare-fun m!243977 () Bool)

(assert (=> b!156456 m!243977))

(declare-fun m!243979 () Bool)

(assert (=> b!156456 m!243979))

(declare-fun m!243981 () Bool)

(assert (=> b!156456 m!243981))

(declare-fun m!243983 () Bool)

(assert (=> b!156456 m!243983))

(declare-fun m!243985 () Bool)

(assert (=> b!156456 m!243985))

(assert (=> b!156456 m!243969))

(declare-fun m!243987 () Bool)

(assert (=> b!156456 m!243987))

(assert (=> b!156456 m!243723))

(declare-fun m!243989 () Bool)

(assert (=> b!156456 m!243989))

(declare-fun m!243991 () Bool)

(assert (=> b!156456 m!243991))

(assert (=> bm!2453 m!243977))

(declare-fun m!243993 () Bool)

(assert (=> bm!2453 m!243993))

(declare-fun m!243995 () Bool)

(assert (=> b!156459 m!243995))

(declare-fun m!243997 () Bool)

(assert (=> b!156459 m!243997))

(declare-fun m!243999 () Bool)

(assert (=> d!52114 m!243999))

(assert (=> d!52114 m!243969))

(declare-fun m!244001 () Bool)

(assert (=> b!156460 m!244001))

(declare-fun m!244003 () Bool)

(assert (=> b!156457 m!244003))

(assert (=> b!156457 m!243659))

(declare-fun m!244005 () Bool)

(assert (=> bm!2452 m!244005))

(declare-fun m!244007 () Bool)

(assert (=> bm!2451 m!244007))

(assert (=> d!52066 d!52114))

(declare-fun d!52116 () Bool)

(assert (=> d!52116 (= (remainingBits!0 ((_ sign_extend 32) (size!3215 (buf!3718 lt!244590))) ((_ sign_extend 32) (currentByte!6833 lt!244590)) ((_ sign_extend 32) (currentBit!6828 lt!244590))) (bvsub (bvmul ((_ sign_extend 32) (size!3215 (buf!3718 lt!244590))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6833 lt!244590)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6828 lt!244590)))))))

(assert (=> d!52076 d!52116))

(check-sat (not d!52084) (not bm!2433) (not b!156456) (not bm!2452) (not b!156416) (not b!156455) (not d!52096) (not bm!2453) (not bm!2434) (not b!156460) (not bm!2451) (not b!156459) (not b!156457) (not bm!2435) (not d!52098) (not b!156415) (not d!52114) (not b!156412) (not b!156413))
(check-sat)
