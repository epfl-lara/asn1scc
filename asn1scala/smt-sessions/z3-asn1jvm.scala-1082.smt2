; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31068 () Bool)

(assert start!31068)

(declare-fun b!156929 () Bool)

(declare-fun e!106179 () Bool)

(declare-datatypes ((array!7226 0))(
  ( (array!7227 (arr!4129 (Array (_ BitVec 32) (_ BitVec 8))) (size!3264 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5742 0))(
  ( (BitStream!5743 (buf!3745 array!7226) (currentByte!6872 (_ BitVec 32)) (currentBit!6867 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5742)

(declare-fun array_inv!3031 (array!7226) Bool)

(assert (=> b!156929 (= e!106179 (array_inv!3031 (buf!3745 bs!65)))))

(declare-fun b!156930 () Bool)

(declare-fun e!106177 () Bool)

(declare-fun e!106178 () Bool)

(assert (=> b!156930 (= e!106177 e!106178)))

(declare-fun res!131159 () Bool)

(assert (=> b!156930 (=> (not res!131159) (not e!106178))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(assert (=> b!156930 (= res!131159 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((tuple2!14108 0))(
  ( (tuple2!14109 (_1!7498 BitStream!5742) (_2!7498 array!7226)) )
))
(declare-fun lt!245650 () tuple2!14108)

(declare-fun lt!245644 () BitStream!5742)

(declare-fun lt!245645 () array!7226)

(declare-fun readByteArrayLoopPure!0 (BitStream!5742 array!7226 (_ BitVec 32) (_ BitVec 32)) tuple2!14108)

(assert (=> b!156930 (= lt!245650 (readByteArrayLoopPure!0 lt!245644 lt!245645 (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun arr!153 () array!7226)

(declare-datatypes ((tuple2!14110 0))(
  ( (tuple2!14111 (_1!7499 BitStream!5742) (_2!7499 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5742) tuple2!14110)

(assert (=> b!156930 (= lt!245645 (array!7227 (store (arr!4129 arr!153) from!240 (_2!7499 (readBytePure!0 bs!65))) (size!3264 arr!153)))))

(declare-fun withMovedByteIndex!0 (BitStream!5742 (_ BitVec 32)) BitStream!5742)

(assert (=> b!156930 (= lt!245644 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!245649 () tuple2!14108)

(assert (=> b!156930 (= lt!245649 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!156931 () Bool)

(declare-fun res!131157 () Bool)

(assert (=> b!156931 (=> (not res!131157) (not e!106177))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!156931 (= res!131157 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3264 (buf!3745 bs!65))) ((_ sign_extend 32) (currentByte!6872 bs!65)) ((_ sign_extend 32) (currentBit!6867 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!156932 () Bool)

(declare-fun e!106181 () Bool)

(assert (=> b!156932 (= e!106181 (or (bvsgt #b00000000000000000000000000000000 to!236) (bvsle (size!3264 (_2!7498 lt!245649)) (size!3264 (_2!7498 lt!245650)))))))

(declare-fun lt!245643 () tuple2!14108)

(declare-fun arrayRangesEq!432 (array!7226 array!7226 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!156932 (arrayRangesEq!432 (_2!7498 lt!245650) (_2!7498 lt!245643) #b00000000000000000000000000000000 to!236)))

(declare-datatypes ((Unit!10164 0))(
  ( (Unit!10165) )
))
(declare-fun lt!245641 () Unit!10164)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5742 array!7226 (_ BitVec 32) (_ BitVec 32)) Unit!10164)

(assert (=> b!156932 (= lt!245641 (readByteArrayLoopArrayPrefixLemma!0 lt!245644 lt!245645 (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!245648 () tuple2!14110)

(assert (=> b!156932 (= lt!245643 (readByteArrayLoopPure!0 (withMovedByteIndex!0 lt!245644 #b00000000000000000000000000000001) (array!7227 (store (store (arr!4129 arr!153) from!240 (_2!7499 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7499 lt!245648)) (size!3264 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(declare-fun lt!245642 () (Array (_ BitVec 32) (_ BitVec 8)))

(assert (=> b!156932 (= lt!245642 (store (arr!4129 arr!153) from!240 (_2!7499 (readBytePure!0 bs!65))))))

(declare-fun b!156933 () Bool)

(assert (=> b!156933 (= e!106178 (not e!106181))))

(declare-fun res!131158 () Bool)

(assert (=> b!156933 (=> res!131158 e!106181)))

(assert (=> b!156933 (= res!131158 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236)))))

(declare-fun lt!245647 () (_ BitVec 64))

(declare-fun lt!245646 () (_ BitVec 64))

(assert (=> b!156933 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3264 (buf!3745 lt!245644))) lt!245646 lt!245647 (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001))))

(assert (=> b!156933 (= lt!245647 ((_ sign_extend 32) (currentBit!6867 lt!245644)))))

(assert (=> b!156933 (= lt!245646 ((_ sign_extend 32) (currentByte!6872 lt!245644)))))

(declare-fun lt!245640 () Unit!10164)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5742 BitStream!5742 (_ BitVec 64) (_ BitVec 32)) Unit!10164)

(assert (=> b!156933 (= lt!245640 (validateOffsetBytesFromBitIndexLemma!0 bs!65 lt!245644 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)))))

(assert (=> b!156933 (= lt!245648 (readBytePure!0 lt!245644))))

(declare-fun b!156934 () Bool)

(declare-fun res!131156 () Bool)

(assert (=> b!156934 (=> res!131156 e!106181)))

(assert (=> b!156934 (= res!131156 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!3264 (buf!3745 lt!245644))) lt!245646 lt!245647 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))))

(declare-fun res!131155 () Bool)

(assert (=> start!31068 (=> (not res!131155) (not e!106177))))

(assert (=> start!31068 (= res!131155 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3264 arr!153))))))

(assert (=> start!31068 e!106177))

(assert (=> start!31068 true))

(assert (=> start!31068 (array_inv!3031 arr!153)))

(declare-fun inv!12 (BitStream!5742) Bool)

(assert (=> start!31068 (and (inv!12 bs!65) e!106179)))

(assert (= (and start!31068 res!131155) b!156931))

(assert (= (and b!156931 res!131157) b!156930))

(assert (= (and b!156930 res!131159) b!156933))

(assert (= (and b!156933 (not res!131158)) b!156934))

(assert (= (and b!156934 (not res!131156)) b!156932))

(assert (= start!31068 b!156929))

(declare-fun m!244713 () Bool)

(assert (=> b!156932 m!244713))

(declare-fun m!244715 () Bool)

(assert (=> b!156932 m!244715))

(declare-fun m!244717 () Bool)

(assert (=> b!156932 m!244717))

(declare-fun m!244719 () Bool)

(assert (=> b!156932 m!244719))

(assert (=> b!156932 m!244715))

(declare-fun m!244721 () Bool)

(assert (=> b!156932 m!244721))

(declare-fun m!244723 () Bool)

(assert (=> b!156932 m!244723))

(declare-fun m!244725 () Bool)

(assert (=> b!156932 m!244725))

(declare-fun m!244727 () Bool)

(assert (=> b!156931 m!244727))

(declare-fun m!244729 () Bool)

(assert (=> b!156934 m!244729))

(declare-fun m!244731 () Bool)

(assert (=> b!156929 m!244731))

(declare-fun m!244733 () Bool)

(assert (=> b!156933 m!244733))

(declare-fun m!244735 () Bool)

(assert (=> b!156933 m!244735))

(declare-fun m!244737 () Bool)

(assert (=> b!156933 m!244737))

(declare-fun m!244739 () Bool)

(assert (=> start!31068 m!244739))

(declare-fun m!244741 () Bool)

(assert (=> start!31068 m!244741))

(assert (=> b!156930 m!244713))

(assert (=> b!156930 m!244721))

(declare-fun m!244743 () Bool)

(assert (=> b!156930 m!244743))

(declare-fun m!244745 () Bool)

(assert (=> b!156930 m!244745))

(declare-fun m!244747 () Bool)

(assert (=> b!156930 m!244747))

(check-sat (not b!156932) (not b!156934) (not b!156931) (not b!156929) (not b!156933) (not b!156930) (not start!31068))
(check-sat)
(get-model)

(declare-fun d!52230 () Bool)

(declare-datatypes ((tuple3!658 0))(
  ( (tuple3!659 (_1!7509 Unit!10164) (_2!7509 BitStream!5742) (_3!446 array!7226)) )
))
(declare-fun lt!245933 () tuple3!658)

(declare-fun readByteArrayLoop!0 (BitStream!5742 array!7226 (_ BitVec 32) (_ BitVec 32)) tuple3!658)

(assert (=> d!52230 (= lt!245933 (readByteArrayLoop!0 lt!245644 lt!245645 (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52230 (= (readByteArrayLoopPure!0 lt!245644 lt!245645 (bvadd #b00000000000000000000000000000001 from!240) to!236) (tuple2!14109 (_2!7509 lt!245933) (_3!446 lt!245933)))))

(declare-fun bs!12820 () Bool)

(assert (= bs!12820 d!52230))

(declare-fun m!244951 () Bool)

(assert (=> bs!12820 m!244951))

(assert (=> b!156930 d!52230))

(declare-fun d!52236 () Bool)

(declare-datatypes ((tuple2!14126 0))(
  ( (tuple2!14127 (_1!7510 (_ BitVec 8)) (_2!7510 BitStream!5742)) )
))
(declare-fun lt!245979 () tuple2!14126)

(declare-fun readByte!0 (BitStream!5742) tuple2!14126)

(assert (=> d!52236 (= lt!245979 (readByte!0 bs!65))))

(assert (=> d!52236 (= (readBytePure!0 bs!65) (tuple2!14111 (_2!7510 lt!245979) (_1!7510 lt!245979)))))

(declare-fun bs!12821 () Bool)

(assert (= bs!12821 d!52236))

(declare-fun m!244999 () Bool)

(assert (=> bs!12821 m!244999))

(assert (=> b!156930 d!52236))

(declare-fun d!52242 () Bool)

(declare-datatypes ((tuple2!14128 0))(
  ( (tuple2!14129 (_1!7511 Unit!10164) (_2!7511 BitStream!5742)) )
))
(declare-fun moveByteIndex!0 (BitStream!5742 (_ BitVec 32)) tuple2!14128)

(assert (=> d!52242 (= (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7511 (moveByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun bs!12822 () Bool)

(assert (= bs!12822 d!52242))

(declare-fun m!245001 () Bool)

(assert (=> bs!12822 m!245001))

(assert (=> b!156930 d!52242))

(declare-fun d!52244 () Bool)

(declare-fun lt!245980 () tuple3!658)

(assert (=> d!52244 (= lt!245980 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!52244 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!14109 (_2!7509 lt!245980) (_3!446 lt!245980)))))

(declare-fun bs!12823 () Bool)

(assert (= bs!12823 d!52244))

(declare-fun m!245007 () Bool)

(assert (=> bs!12823 m!245007))

(assert (=> b!156930 d!52244))

(declare-fun d!52246 () Bool)

(assert (=> d!52246 (= (array_inv!3031 arr!153) (bvsge (size!3264 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!31068 d!52246))

(declare-fun d!52248 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!52248 (= (inv!12 bs!65) (invariant!0 (currentBit!6867 bs!65) (currentByte!6872 bs!65) (size!3264 (buf!3745 bs!65))))))

(declare-fun bs!12824 () Bool)

(assert (= bs!12824 d!52248))

(declare-fun m!245051 () Bool)

(assert (=> bs!12824 m!245051))

(assert (=> start!31068 d!52248))

(declare-fun d!52254 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!52254 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3264 (buf!3745 bs!65))) ((_ sign_extend 32) (currentByte!6872 bs!65)) ((_ sign_extend 32) (currentBit!6867 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3264 (buf!3745 bs!65))) ((_ sign_extend 32) (currentByte!6872 bs!65)) ((_ sign_extend 32) (currentBit!6867 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12825 () Bool)

(assert (= bs!12825 d!52254))

(declare-fun m!245053 () Bool)

(assert (=> bs!12825 m!245053))

(assert (=> b!156931 d!52254))

(declare-fun d!52256 () Bool)

(assert (=> d!52256 (= (withMovedByteIndex!0 lt!245644 #b00000000000000000000000000000001) (_2!7511 (moveByteIndex!0 lt!245644 #b00000000000000000000000000000001)))))

(declare-fun bs!12826 () Bool)

(assert (= bs!12826 d!52256))

(declare-fun m!245055 () Bool)

(assert (=> bs!12826 m!245055))

(assert (=> b!156932 d!52256))

(declare-fun d!52258 () Bool)

(declare-fun lt!246061 () tuple2!14108)

(declare-fun lt!246063 () tuple2!14108)

(assert (=> d!52258 (arrayRangesEq!432 (_2!7498 lt!246061) (_2!7498 lt!246063) #b00000000000000000000000000000000 to!236)))

(declare-fun lt!246062 () BitStream!5742)

(declare-fun lt!246064 () Unit!10164)

(declare-fun choose!35 (BitStream!5742 array!7226 (_ BitVec 32) (_ BitVec 32) tuple2!14108 array!7226 BitStream!5742 tuple2!14108 array!7226) Unit!10164)

(assert (=> d!52258 (= lt!246064 (choose!35 lt!245644 lt!245645 (bvadd #b00000000000000000000000000000001 from!240) to!236 lt!246061 (_2!7498 lt!246061) lt!246062 lt!246063 (_2!7498 lt!246063)))))

(assert (=> d!52258 (= lt!246063 (readByteArrayLoopPure!0 lt!246062 (array!7227 (store (arr!4129 lt!245645) (bvadd #b00000000000000000000000000000001 from!240) (_2!7499 (readBytePure!0 lt!245644))) (size!3264 lt!245645)) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> d!52258 (= lt!246062 (withMovedByteIndex!0 lt!245644 #b00000000000000000000000000000001))))

(assert (=> d!52258 (= lt!246061 (readByteArrayLoopPure!0 lt!245644 lt!245645 (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52258 (= (readByteArrayLoopArrayPrefixLemma!0 lt!245644 lt!245645 (bvadd #b00000000000000000000000000000001 from!240) to!236) lt!246064)))

(declare-fun bs!12828 () Bool)

(assert (= bs!12828 d!52258))

(assert (=> bs!12828 m!244745))

(declare-fun m!245057 () Bool)

(assert (=> bs!12828 m!245057))

(assert (=> bs!12828 m!244715))

(declare-fun m!245059 () Bool)

(assert (=> bs!12828 m!245059))

(declare-fun m!245061 () Bool)

(assert (=> bs!12828 m!245061))

(declare-fun m!245063 () Bool)

(assert (=> bs!12828 m!245063))

(assert (=> bs!12828 m!244737))

(assert (=> b!156932 d!52258))

(declare-fun lt!246065 () tuple3!658)

(declare-fun d!52260 () Bool)

(assert (=> d!52260 (= lt!246065 (readByteArrayLoop!0 (withMovedByteIndex!0 lt!245644 #b00000000000000000000000000000001) (array!7227 (store (store (arr!4129 arr!153) from!240 (_2!7499 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7499 lt!245648)) (size!3264 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(assert (=> d!52260 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 lt!245644 #b00000000000000000000000000000001) (array!7227 (store (store (arr!4129 arr!153) from!240 (_2!7499 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7499 lt!245648)) (size!3264 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236) (tuple2!14109 (_2!7509 lt!246065) (_3!446 lt!246065)))))

(declare-fun bs!12829 () Bool)

(assert (= bs!12829 d!52260))

(assert (=> bs!12829 m!244715))

(declare-fun m!245065 () Bool)

(assert (=> bs!12829 m!245065))

(assert (=> b!156932 d!52260))

(declare-fun d!52262 () Bool)

(declare-fun res!131244 () Bool)

(declare-fun e!106267 () Bool)

(assert (=> d!52262 (=> res!131244 e!106267)))

(assert (=> d!52262 (= res!131244 (= #b00000000000000000000000000000000 to!236))))

(assert (=> d!52262 (= (arrayRangesEq!432 (_2!7498 lt!245650) (_2!7498 lt!245643) #b00000000000000000000000000000000 to!236) e!106267)))

(declare-fun b!157034 () Bool)

(declare-fun e!106268 () Bool)

(assert (=> b!157034 (= e!106267 e!106268)))

(declare-fun res!131245 () Bool)

(assert (=> b!157034 (=> (not res!131245) (not e!106268))))

(assert (=> b!157034 (= res!131245 (= (select (arr!4129 (_2!7498 lt!245650)) #b00000000000000000000000000000000) (select (arr!4129 (_2!7498 lt!245643)) #b00000000000000000000000000000000)))))

(declare-fun b!157035 () Bool)

(assert (=> b!157035 (= e!106268 (arrayRangesEq!432 (_2!7498 lt!245650) (_2!7498 lt!245643) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236))))

(assert (= (and d!52262 (not res!131244)) b!157034))

(assert (= (and b!157034 res!131245) b!157035))

(declare-fun m!245067 () Bool)

(assert (=> b!157034 m!245067))

(declare-fun m!245069 () Bool)

(assert (=> b!157034 m!245069))

(declare-fun m!245071 () Bool)

(assert (=> b!157035 m!245071))

(assert (=> b!156932 d!52262))

(assert (=> b!156932 d!52236))

(declare-fun d!52264 () Bool)

(assert (=> d!52264 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3264 (buf!3745 lt!245644))) lt!245646 lt!245647 (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3264 (buf!3745 lt!245644))) lt!245646 lt!245647) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12830 () Bool)

(assert (= bs!12830 d!52264))

(declare-fun m!245073 () Bool)

(assert (=> bs!12830 m!245073))

(assert (=> b!156933 d!52264))

(declare-fun d!52266 () Bool)

(declare-fun e!106278 () Bool)

(assert (=> d!52266 e!106278))

(declare-fun res!131255 () Bool)

(assert (=> d!52266 (=> (not res!131255) (not e!106278))))

(assert (=> d!52266 (= res!131255 (and (or (let ((rhs!3434 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3434 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3434) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!52267 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!52267 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!52267 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3433 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3433 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3433) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!246117 () Unit!10164)

(declare-fun choose!57 (BitStream!5742 BitStream!5742 (_ BitVec 64) (_ BitVec 32)) Unit!10164)

(assert (=> d!52266 (= lt!246117 (choose!57 bs!65 lt!245644 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)))))

(assert (=> d!52266 (= (validateOffsetBytesFromBitIndexLemma!0 bs!65 lt!245644 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)) lt!246117)))

(declare-fun b!157047 () Bool)

(declare-fun lt!246115 () (_ BitVec 32))

(assert (=> b!157047 (= e!106278 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3264 (buf!3745 lt!245644))) ((_ sign_extend 32) (currentByte!6872 lt!245644)) ((_ sign_extend 32) (currentBit!6867 lt!245644)) (bvsub (bvsub to!236 from!240) lt!246115)))))

(assert (=> b!157047 (or (= (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000) (bvand lt!246115 #b10000000000000000000000000000000)) (= (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!236 from!240) lt!246115) #b10000000000000000000000000000000)))))

(declare-fun lt!246116 () (_ BitVec 64))

(assert (=> b!157047 (= lt!246115 ((_ extract 31 0) lt!246116))))

(assert (=> b!157047 (and (bvslt lt!246116 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!246116 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!157047 (= lt!246116 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!52266 res!131255) b!157047))

(declare-fun m!245129 () Bool)

(assert (=> d!52266 m!245129))

(declare-fun m!245131 () Bool)

(assert (=> b!157047 m!245131))

(assert (=> b!156933 d!52266))

(declare-fun d!52275 () Bool)

(declare-fun lt!246118 () tuple2!14126)

(assert (=> d!52275 (= lt!246118 (readByte!0 lt!245644))))

(assert (=> d!52275 (= (readBytePure!0 lt!245644) (tuple2!14111 (_2!7510 lt!246118) (_1!7510 lt!246118)))))

(declare-fun bs!12831 () Bool)

(assert (= bs!12831 d!52275))

(declare-fun m!245135 () Bool)

(assert (=> bs!12831 m!245135))

(assert (=> b!156933 d!52275))

(declare-fun d!52279 () Bool)

(assert (=> d!52279 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3264 (buf!3745 lt!245644))) lt!245646 lt!245647 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) (bvsle ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3264 (buf!3745 lt!245644))) lt!245646 lt!245647) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12832 () Bool)

(assert (= bs!12832 d!52279))

(assert (=> bs!12832 m!245073))

(assert (=> b!156934 d!52279))

(declare-fun d!52281 () Bool)

(assert (=> d!52281 (= (array_inv!3031 (buf!3745 bs!65)) (bvsge (size!3264 (buf!3745 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!156929 d!52281))

(check-sat (not d!52242) (not d!52230) (not d!52279) (not d!52264) (not d!52236) (not d!52258) (not d!52256) (not b!157035) (not d!52260) (not d!52248) (not d!52266) (not d!52244) (not b!157047) (not d!52254) (not d!52275))
(check-sat)
(get-model)

(declare-fun d!52301 () Bool)

(assert (=> d!52301 (= (invariant!0 (currentBit!6867 bs!65) (currentByte!6872 bs!65) (size!3264 (buf!3745 bs!65))) (and (bvsge (currentBit!6867 bs!65) #b00000000000000000000000000000000) (bvslt (currentBit!6867 bs!65) #b00000000000000000000000000001000) (bvsge (currentByte!6872 bs!65) #b00000000000000000000000000000000) (or (bvslt (currentByte!6872 bs!65) (size!3264 (buf!3745 bs!65))) (and (= (currentBit!6867 bs!65) #b00000000000000000000000000000000) (= (currentByte!6872 bs!65) (size!3264 (buf!3745 bs!65)))))))))

(assert (=> d!52248 d!52301))

(declare-fun d!52303 () Bool)

(declare-fun res!131266 () Bool)

(declare-fun e!106289 () Bool)

(assert (=> d!52303 (=> res!131266 e!106289)))

(assert (=> d!52303 (= res!131266 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236))))

(assert (=> d!52303 (= (arrayRangesEq!432 (_2!7498 lt!245650) (_2!7498 lt!245643) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236) e!106289)))

(declare-fun b!157062 () Bool)

(declare-fun e!106290 () Bool)

(assert (=> b!157062 (= e!106289 e!106290)))

(declare-fun res!131267 () Bool)

(assert (=> b!157062 (=> (not res!131267) (not e!106290))))

(assert (=> b!157062 (= res!131267 (= (select (arr!4129 (_2!7498 lt!245650)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4129 (_2!7498 lt!245643)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!157063 () Bool)

(assert (=> b!157063 (= e!106290 (arrayRangesEq!432 (_2!7498 lt!245650) (_2!7498 lt!245643) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!236))))

(assert (= (and d!52303 (not res!131266)) b!157062))

(assert (= (and b!157062 res!131267) b!157063))

(declare-fun m!245231 () Bool)

(assert (=> b!157062 m!245231))

(declare-fun m!245233 () Bool)

(assert (=> b!157062 m!245233))

(declare-fun m!245235 () Bool)

(assert (=> b!157063 m!245235))

(assert (=> b!157035 d!52303))

(declare-fun d!52305 () Bool)

(assert (=> d!52305 (= (remainingBits!0 ((_ sign_extend 32) (size!3264 (buf!3745 bs!65))) ((_ sign_extend 32) (currentByte!6872 bs!65)) ((_ sign_extend 32) (currentBit!6867 bs!65))) (bvsub (bvmul ((_ sign_extend 32) (size!3264 (buf!3745 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6872 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6867 bs!65)))))))

(assert (=> d!52254 d!52305))

(declare-fun d!52307 () Bool)

(assert (=> d!52307 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3264 (buf!3745 lt!245644))) ((_ sign_extend 32) (currentByte!6872 lt!245644)) ((_ sign_extend 32) (currentBit!6867 lt!245644)) (bvsub (bvsub to!236 from!240) lt!246115)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) lt!246115)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3264 (buf!3745 lt!245644))) ((_ sign_extend 32) (currentByte!6872 lt!245644)) ((_ sign_extend 32) (currentBit!6867 lt!245644))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12838 () Bool)

(assert (= bs!12838 d!52307))

(declare-fun m!245237 () Bool)

(assert (=> bs!12838 m!245237))

(assert (=> b!157047 d!52307))

(assert (=> d!52258 d!52230))

(declare-fun d!52309 () Bool)

(assert (=> d!52309 (arrayRangesEq!432 (_2!7498 (readByteArrayLoopPure!0 lt!245644 lt!245645 (bvadd #b00000000000000000000000000000001 from!240) to!236)) (_2!7498 (readByteArrayLoopPure!0 (withMovedByteIndex!0 lt!245644 #b00000000000000000000000000000001) (array!7227 (store (arr!4129 lt!245645) (bvadd #b00000000000000000000000000000001 from!240) (_2!7499 (readBytePure!0 lt!245644))) (size!3264 lt!245645)) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236)) #b00000000000000000000000000000000 to!236)))

(assert (=> d!52309 true))

(declare-fun _$13!85 () Unit!10164)

(assert (=> d!52309 (= (choose!35 lt!245644 lt!245645 (bvadd #b00000000000000000000000000000001 from!240) to!236 lt!246061 (_2!7498 lt!246061) lt!246062 lt!246063 (_2!7498 lt!246063)) _$13!85)))

(declare-fun bs!12840 () Bool)

(assert (= bs!12840 d!52309))

(declare-fun m!245239 () Bool)

(assert (=> bs!12840 m!245239))

(assert (=> bs!12840 m!244715))

(assert (=> bs!12840 m!245057))

(assert (=> bs!12840 m!244715))

(declare-fun m!245241 () Bool)

(assert (=> bs!12840 m!245241))

(assert (=> bs!12840 m!244737))

(assert (=> bs!12840 m!244745))

(assert (=> d!52258 d!52309))

(assert (=> d!52258 d!52256))

(declare-fun d!52311 () Bool)

(declare-fun res!131268 () Bool)

(declare-fun e!106291 () Bool)

(assert (=> d!52311 (=> res!131268 e!106291)))

(assert (=> d!52311 (= res!131268 (= #b00000000000000000000000000000000 to!236))))

(assert (=> d!52311 (= (arrayRangesEq!432 (_2!7498 lt!246061) (_2!7498 lt!246063) #b00000000000000000000000000000000 to!236) e!106291)))

(declare-fun b!157064 () Bool)

(declare-fun e!106292 () Bool)

(assert (=> b!157064 (= e!106291 e!106292)))

(declare-fun res!131269 () Bool)

(assert (=> b!157064 (=> (not res!131269) (not e!106292))))

(assert (=> b!157064 (= res!131269 (= (select (arr!4129 (_2!7498 lt!246061)) #b00000000000000000000000000000000) (select (arr!4129 (_2!7498 lt!246063)) #b00000000000000000000000000000000)))))

(declare-fun b!157065 () Bool)

(assert (=> b!157065 (= e!106292 (arrayRangesEq!432 (_2!7498 lt!246061) (_2!7498 lt!246063) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236))))

(assert (= (and d!52311 (not res!131268)) b!157064))

(assert (= (and b!157064 res!131269) b!157065))

(declare-fun m!245243 () Bool)

(assert (=> b!157064 m!245243))

(declare-fun m!245245 () Bool)

(assert (=> b!157064 m!245245))

(declare-fun m!245247 () Bool)

(assert (=> b!157065 m!245247))

(assert (=> d!52258 d!52311))

(assert (=> d!52258 d!52275))

(declare-fun d!52313 () Bool)

(declare-fun lt!246192 () tuple3!658)

(assert (=> d!52313 (= lt!246192 (readByteArrayLoop!0 lt!246062 (array!7227 (store (arr!4129 lt!245645) (bvadd #b00000000000000000000000000000001 from!240) (_2!7499 (readBytePure!0 lt!245644))) (size!3264 lt!245645)) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> d!52313 (= (readByteArrayLoopPure!0 lt!246062 (array!7227 (store (arr!4129 lt!245645) (bvadd #b00000000000000000000000000000001 from!240) (_2!7499 (readBytePure!0 lt!245644))) (size!3264 lt!245645)) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236) (tuple2!14109 (_2!7509 lt!246192) (_3!446 lt!246192)))))

(declare-fun bs!12841 () Bool)

(assert (= bs!12841 d!52313))

(declare-fun m!245249 () Bool)

(assert (=> bs!12841 m!245249))

(assert (=> d!52258 d!52313))

(declare-fun d!52315 () Bool)

(assert (=> d!52315 (= (remainingBits!0 ((_ sign_extend 32) (size!3264 (buf!3745 lt!245644))) lt!245646 lt!245647) (bvsub (bvmul ((_ sign_extend 32) (size!3264 (buf!3745 lt!245644))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul lt!245646 #b0000000000000000000000000000000000000000000000000000000000001000) lt!245647)))))

(assert (=> d!52264 d!52315))

(declare-fun d!52317 () Bool)

(declare-fun lt!246212 () (_ BitVec 8))

(declare-fun lt!246207 () (_ BitVec 8))

(assert (=> d!52317 (= lt!246212 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4129 (buf!3745 lt!245644)) (currentByte!6872 lt!245644))) ((_ sign_extend 24) lt!246207))))))

(assert (=> d!52317 (= lt!246207 ((_ extract 7 0) (currentBit!6867 lt!245644)))))

(declare-fun e!106297 () Bool)

(assert (=> d!52317 e!106297))

(declare-fun res!131276 () Bool)

(assert (=> d!52317 (=> (not res!131276) (not e!106297))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!52317 (= res!131276 (validate_offset_bits!1 ((_ sign_extend 32) (size!3264 (buf!3745 lt!245644))) ((_ sign_extend 32) (currentByte!6872 lt!245644)) ((_ sign_extend 32) (currentBit!6867 lt!245644)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!14132 0))(
  ( (tuple2!14133 (_1!7513 Unit!10164) (_2!7513 (_ BitVec 8))) )
))
(declare-fun Unit!10230 () Unit!10164)

(declare-fun Unit!10231 () Unit!10164)

(assert (=> d!52317 (= (readByte!0 lt!245644) (tuple2!14127 (_2!7513 (ite (bvsgt ((_ sign_extend 24) lt!246207) #b00000000000000000000000000000000) (tuple2!14133 Unit!10230 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!246212) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4129 (buf!3745 lt!245644)) (bvadd (currentByte!6872 lt!245644) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!246207)))))))) (tuple2!14133 Unit!10231 lt!246212))) (BitStream!5743 (buf!3745 lt!245644) (bvadd (currentByte!6872 lt!245644) #b00000000000000000000000000000001) (currentBit!6867 lt!245644))))))

(declare-fun b!157070 () Bool)

(declare-fun e!106298 () Bool)

(assert (=> b!157070 (= e!106297 e!106298)))

(declare-fun res!131275 () Bool)

(assert (=> b!157070 (=> (not res!131275) (not e!106298))))

(declare-fun lt!246213 () tuple2!14126)

(assert (=> b!157070 (= res!131275 (= (buf!3745 (_2!7510 lt!246213)) (buf!3745 lt!245644)))))

(declare-fun lt!246211 () (_ BitVec 8))

(declare-fun lt!246208 () (_ BitVec 8))

(declare-fun Unit!10232 () Unit!10164)

(declare-fun Unit!10233 () Unit!10164)

(assert (=> b!157070 (= lt!246213 (tuple2!14127 (_2!7513 (ite (bvsgt ((_ sign_extend 24) lt!246208) #b00000000000000000000000000000000) (tuple2!14133 Unit!10232 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!246211) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4129 (buf!3745 lt!245644)) (bvadd (currentByte!6872 lt!245644) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!246208)))))))) (tuple2!14133 Unit!10233 lt!246211))) (BitStream!5743 (buf!3745 lt!245644) (bvadd (currentByte!6872 lt!245644) #b00000000000000000000000000000001) (currentBit!6867 lt!245644))))))

(assert (=> b!157070 (= lt!246211 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4129 (buf!3745 lt!245644)) (currentByte!6872 lt!245644))) ((_ sign_extend 24) lt!246208))))))

(assert (=> b!157070 (= lt!246208 ((_ extract 7 0) (currentBit!6867 lt!245644)))))

(declare-fun lt!246210 () (_ BitVec 64))

(declare-fun b!157071 () Bool)

(declare-fun lt!246209 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!157071 (= e!106298 (= (bitIndex!0 (size!3264 (buf!3745 (_2!7510 lt!246213))) (currentByte!6872 (_2!7510 lt!246213)) (currentBit!6867 (_2!7510 lt!246213))) (bvadd lt!246210 lt!246209)))))

(assert (=> b!157071 (or (not (= (bvand lt!246210 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!246209 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!246210 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!246210 lt!246209) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!157071 (= lt!246209 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!157071 (= lt!246210 (bitIndex!0 (size!3264 (buf!3745 lt!245644)) (currentByte!6872 lt!245644) (currentBit!6867 lt!245644)))))

(assert (= (and d!52317 res!131276) b!157070))

(assert (= (and b!157070 res!131275) b!157071))

(declare-fun m!245251 () Bool)

(assert (=> d!52317 m!245251))

(declare-fun m!245253 () Bool)

(assert (=> d!52317 m!245253))

(declare-fun m!245255 () Bool)

(assert (=> d!52317 m!245255))

(assert (=> b!157070 m!245255))

(assert (=> b!157070 m!245251))

(declare-fun m!245257 () Bool)

(assert (=> b!157071 m!245257))

(declare-fun m!245259 () Bool)

(assert (=> b!157071 m!245259))

(assert (=> d!52275 d!52317))

(declare-fun d!52319 () Bool)

(declare-fun lt!246219 () (_ BitVec 8))

(declare-fun lt!246214 () (_ BitVec 8))

(assert (=> d!52319 (= lt!246219 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4129 (buf!3745 bs!65)) (currentByte!6872 bs!65))) ((_ sign_extend 24) lt!246214))))))

(assert (=> d!52319 (= lt!246214 ((_ extract 7 0) (currentBit!6867 bs!65)))))

(declare-fun e!106299 () Bool)

(assert (=> d!52319 e!106299))

(declare-fun res!131278 () Bool)

(assert (=> d!52319 (=> (not res!131278) (not e!106299))))

(assert (=> d!52319 (= res!131278 (validate_offset_bits!1 ((_ sign_extend 32) (size!3264 (buf!3745 bs!65))) ((_ sign_extend 32) (currentByte!6872 bs!65)) ((_ sign_extend 32) (currentBit!6867 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!10234 () Unit!10164)

(declare-fun Unit!10235 () Unit!10164)

(assert (=> d!52319 (= (readByte!0 bs!65) (tuple2!14127 (_2!7513 (ite (bvsgt ((_ sign_extend 24) lt!246214) #b00000000000000000000000000000000) (tuple2!14133 Unit!10234 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!246219) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4129 (buf!3745 bs!65)) (bvadd (currentByte!6872 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!246214)))))))) (tuple2!14133 Unit!10235 lt!246219))) (BitStream!5743 (buf!3745 bs!65) (bvadd (currentByte!6872 bs!65) #b00000000000000000000000000000001) (currentBit!6867 bs!65))))))

(declare-fun b!157072 () Bool)

(declare-fun e!106300 () Bool)

(assert (=> b!157072 (= e!106299 e!106300)))

(declare-fun res!131277 () Bool)

(assert (=> b!157072 (=> (not res!131277) (not e!106300))))

(declare-fun lt!246220 () tuple2!14126)

(assert (=> b!157072 (= res!131277 (= (buf!3745 (_2!7510 lt!246220)) (buf!3745 bs!65)))))

(declare-fun lt!246215 () (_ BitVec 8))

(declare-fun lt!246218 () (_ BitVec 8))

(declare-fun Unit!10236 () Unit!10164)

(declare-fun Unit!10237 () Unit!10164)

(assert (=> b!157072 (= lt!246220 (tuple2!14127 (_2!7513 (ite (bvsgt ((_ sign_extend 24) lt!246215) #b00000000000000000000000000000000) (tuple2!14133 Unit!10236 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!246218) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4129 (buf!3745 bs!65)) (bvadd (currentByte!6872 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!246215)))))))) (tuple2!14133 Unit!10237 lt!246218))) (BitStream!5743 (buf!3745 bs!65) (bvadd (currentByte!6872 bs!65) #b00000000000000000000000000000001) (currentBit!6867 bs!65))))))

(assert (=> b!157072 (= lt!246218 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4129 (buf!3745 bs!65)) (currentByte!6872 bs!65))) ((_ sign_extend 24) lt!246215))))))

(assert (=> b!157072 (= lt!246215 ((_ extract 7 0) (currentBit!6867 bs!65)))))

(declare-fun b!157073 () Bool)

(declare-fun lt!246216 () (_ BitVec 64))

(declare-fun lt!246217 () (_ BitVec 64))

(assert (=> b!157073 (= e!106300 (= (bitIndex!0 (size!3264 (buf!3745 (_2!7510 lt!246220))) (currentByte!6872 (_2!7510 lt!246220)) (currentBit!6867 (_2!7510 lt!246220))) (bvadd lt!246217 lt!246216)))))

(assert (=> b!157073 (or (not (= (bvand lt!246217 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!246216 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!246217 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!246217 lt!246216) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!157073 (= lt!246216 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!157073 (= lt!246217 (bitIndex!0 (size!3264 (buf!3745 bs!65)) (currentByte!6872 bs!65) (currentBit!6867 bs!65)))))

(assert (= (and d!52319 res!131278) b!157072))

(assert (= (and b!157072 res!131277) b!157073))

(declare-fun m!245261 () Bool)

(assert (=> d!52319 m!245261))

(declare-fun m!245263 () Bool)

(assert (=> d!52319 m!245263))

(declare-fun m!245265 () Bool)

(assert (=> d!52319 m!245265))

(assert (=> b!157072 m!245265))

(assert (=> b!157072 m!245261))

(declare-fun m!245267 () Bool)

(assert (=> b!157073 m!245267))

(declare-fun m!245269 () Bool)

(assert (=> b!157073 m!245269))

(assert (=> d!52236 d!52319))

(declare-fun d!52321 () Bool)

(declare-fun e!106303 () Bool)

(assert (=> d!52321 e!106303))

(declare-fun res!131281 () Bool)

(assert (=> d!52321 (=> (not res!131281) (not e!106303))))

(declare-fun moveByteIndexPrecond!0 (BitStream!5742 (_ BitVec 32)) Bool)

(assert (=> d!52321 (= res!131281 (moveByteIndexPrecond!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun Unit!10238 () Unit!10164)

(assert (=> d!52321 (= (moveByteIndex!0 bs!65 #b00000000000000000000000000000001) (tuple2!14129 Unit!10238 (BitStream!5743 (buf!3745 bs!65) (bvadd (currentByte!6872 bs!65) #b00000000000000000000000000000001) (currentBit!6867 bs!65))))))

(declare-fun b!157076 () Bool)

(assert (=> b!157076 (= e!106303 (and (or (not (= (bvand (currentByte!6872 bs!65) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6872 bs!65) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6872 bs!65) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6872 bs!65) #b00000000000000000000000000000001) (bvadd (currentByte!6872 bs!65) #b00000000000000000000000000000001))))))

(assert (= (and d!52321 res!131281) b!157076))

(declare-fun m!245271 () Bool)

(assert (=> d!52321 m!245271))

(assert (=> d!52242 d!52321))

(declare-fun e!106312 () Bool)

(declare-fun lt!246328 () tuple3!658)

(declare-fun b!157087 () Bool)

(assert (=> b!157087 (= e!106312 (arrayRangesEq!432 lt!245645 (_3!446 lt!246328) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun b!157088 () Bool)

(declare-fun lt!246304 () Unit!10164)

(declare-fun e!106310 () tuple3!658)

(assert (=> b!157088 (= e!106310 (tuple3!659 lt!246304 lt!245644 lt!245645))))

(declare-fun call!2494 () (_ BitVec 64))

(assert (=> b!157088 (= call!2494 call!2494)))

(declare-fun lt!246320 () Unit!10164)

(declare-fun Unit!10239 () Unit!10164)

(assert (=> b!157088 (= lt!246320 Unit!10239)))

(declare-fun lt!246299 () Unit!10164)

(declare-fun arrayRangesEqReflexiveLemma!41 (array!7226) Unit!10164)

(assert (=> b!157088 (= lt!246299 (arrayRangesEqReflexiveLemma!41 lt!245645))))

(declare-fun call!2495 () Bool)

(assert (=> b!157088 call!2495))

(declare-fun lt!246311 () Unit!10164)

(assert (=> b!157088 (= lt!246311 lt!246299)))

(declare-fun lt!246312 () array!7226)

(assert (=> b!157088 (= lt!246312 lt!245645)))

(declare-fun lt!246321 () array!7226)

(assert (=> b!157088 (= lt!246321 lt!245645)))

(declare-fun lt!246314 () (_ BitVec 32))

(assert (=> b!157088 (= lt!246314 #b00000000000000000000000000000000)))

(declare-fun lt!246315 () (_ BitVec 32))

(assert (=> b!157088 (= lt!246315 (size!3264 lt!245645))))

(declare-fun lt!246293 () (_ BitVec 32))

(assert (=> b!157088 (= lt!246293 #b00000000000000000000000000000000)))

(declare-fun lt!246301 () (_ BitVec 32))

(assert (=> b!157088 (= lt!246301 (bvadd #b00000000000000000000000000000001 from!240))))

(declare-fun arrayRangesEqSlicedLemma!41 (array!7226 array!7226 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10164)

(assert (=> b!157088 (= lt!246304 (arrayRangesEqSlicedLemma!41 lt!246312 lt!246321 lt!246314 lt!246315 lt!246293 lt!246301))))

(declare-fun call!2493 () Bool)

(assert (=> b!157088 call!2493))

(declare-fun lt!246313 () tuple3!658)

(declare-fun c!8353 () Bool)

(declare-fun bm!2491 () Bool)

(assert (=> bm!2491 (= call!2494 (bitIndex!0 (ite c!8353 (size!3264 (buf!3745 (_2!7509 lt!246313))) (size!3264 (buf!3745 lt!245644))) (ite c!8353 (currentByte!6872 (_2!7509 lt!246313)) (currentByte!6872 lt!245644)) (ite c!8353 (currentBit!6867 (_2!7509 lt!246313)) (currentBit!6867 lt!245644))))))

(declare-fun e!106311 () Bool)

(declare-fun b!157089 () Bool)

(assert (=> b!157089 (= e!106311 (= (select (arr!4129 (_3!446 lt!246328)) (bvadd #b00000000000000000000000000000001 from!240)) (_2!7499 (readBytePure!0 lt!245644))))))

(assert (=> b!157089 (and (bvsge (bvadd #b00000000000000000000000000000001 from!240) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!240) (size!3264 (_3!446 lt!246328))))))

(declare-fun b!157090 () Bool)

(declare-fun lt!246294 () Unit!10164)

(assert (=> b!157090 (= e!106310 (tuple3!659 lt!246294 (_2!7509 lt!246313) (_3!446 lt!246313)))))

(declare-fun lt!246296 () tuple2!14126)

(assert (=> b!157090 (= lt!246296 (readByte!0 lt!245644))))

(declare-fun lt!246302 () array!7226)

(assert (=> b!157090 (= lt!246302 (array!7227 (store (arr!4129 lt!245645) (bvadd #b00000000000000000000000000000001 from!240) (_1!7510 lt!246296)) (size!3264 lt!245645)))))

(declare-fun lt!246307 () (_ BitVec 64))

(assert (=> b!157090 (= lt!246307 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!246297 () (_ BitVec 32))

(assert (=> b!157090 (= lt!246297 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!246310 () Unit!10164)

(assert (=> b!157090 (= lt!246310 (validateOffsetBytesFromBitIndexLemma!0 lt!245644 (_2!7510 lt!246296) lt!246307 lt!246297))))

(assert (=> b!157090 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3264 (buf!3745 (_2!7510 lt!246296)))) ((_ sign_extend 32) (currentByte!6872 (_2!7510 lt!246296))) ((_ sign_extend 32) (currentBit!6867 (_2!7510 lt!246296))) (bvsub lt!246297 ((_ extract 31 0) (bvsdiv (bvadd lt!246307 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!246308 () Unit!10164)

(assert (=> b!157090 (= lt!246308 lt!246310)))

(assert (=> b!157090 (= lt!246313 (readByteArrayLoop!0 (_2!7510 lt!246296) lt!246302 (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!157090 (= (bitIndex!0 (size!3264 (buf!3745 (_2!7510 lt!246296))) (currentByte!6872 (_2!7510 lt!246296)) (currentBit!6867 (_2!7510 lt!246296))) (bvadd (bitIndex!0 (size!3264 (buf!3745 lt!245644)) (currentByte!6872 lt!245644) (currentBit!6867 lt!245644)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!246324 () Unit!10164)

(declare-fun Unit!10240 () Unit!10164)

(assert (=> b!157090 (= lt!246324 Unit!10240)))

(assert (=> b!157090 (= (bvadd (bitIndex!0 (size!3264 (buf!3745 (_2!7510 lt!246296))) (currentByte!6872 (_2!7510 lt!246296)) (currentBit!6867 (_2!7510 lt!246296))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2494)))

(declare-fun lt!246305 () Unit!10164)

(declare-fun Unit!10241 () Unit!10164)

(assert (=> b!157090 (= lt!246305 Unit!10241)))

(assert (=> b!157090 (= (bvadd (bitIndex!0 (size!3264 (buf!3745 lt!245644)) (currentByte!6872 lt!245644) (currentBit!6867 lt!245644)) (bvmul ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2494)))

(declare-fun lt!246318 () Unit!10164)

(declare-fun Unit!10242 () Unit!10164)

(assert (=> b!157090 (= lt!246318 Unit!10242)))

(assert (=> b!157090 (and (= (buf!3745 lt!245644) (buf!3745 (_2!7509 lt!246313))) (= (size!3264 lt!245645) (size!3264 (_3!446 lt!246313))))))

(declare-fun lt!246319 () Unit!10164)

(declare-fun Unit!10243 () Unit!10164)

(assert (=> b!157090 (= lt!246319 Unit!10243)))

(declare-fun lt!246322 () Unit!10164)

(declare-fun arrayUpdatedAtPrefixLemma!41 (array!7226 (_ BitVec 32) (_ BitVec 8)) Unit!10164)

(assert (=> b!157090 (= lt!246322 (arrayUpdatedAtPrefixLemma!41 lt!245645 (bvadd #b00000000000000000000000000000001 from!240) (_1!7510 lt!246296)))))

(assert (=> b!157090 call!2495))

(declare-fun lt!246316 () Unit!10164)

(assert (=> b!157090 (= lt!246316 lt!246322)))

(declare-fun lt!246306 () (_ BitVec 32))

(assert (=> b!157090 (= lt!246306 #b00000000000000000000000000000000)))

(declare-fun lt!246300 () Unit!10164)

(declare-fun arrayRangesEqTransitive!106 (array!7226 array!7226 array!7226 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10164)

(assert (=> b!157090 (= lt!246300 (arrayRangesEqTransitive!106 lt!245645 lt!246302 (_3!446 lt!246313) lt!246306 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157090 call!2493))

(declare-fun lt!246303 () Unit!10164)

(assert (=> b!157090 (= lt!246303 lt!246300)))

(assert (=> b!157090 (arrayRangesEq!432 lt!245645 (_3!446 lt!246313) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240))))

(declare-fun lt!246323 () Unit!10164)

(declare-fun Unit!10244 () Unit!10164)

(assert (=> b!157090 (= lt!246323 Unit!10244)))

(declare-fun lt!246309 () Unit!10164)

(declare-fun arrayRangesEqImpliesEq!50 (array!7226 array!7226 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10164)

(assert (=> b!157090 (= lt!246309 (arrayRangesEqImpliesEq!50 lt!246302 (_3!446 lt!246313) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157090 (= (select (store (arr!4129 lt!245645) (bvadd #b00000000000000000000000000000001 from!240) (_1!7510 lt!246296)) (bvadd #b00000000000000000000000000000001 from!240)) (select (arr!4129 (_3!446 lt!246313)) (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!246295 () Unit!10164)

(assert (=> b!157090 (= lt!246295 lt!246309)))

(declare-fun lt!246327 () Bool)

(assert (=> b!157090 (= lt!246327 (= (select (arr!4129 (_3!446 lt!246313)) (bvadd #b00000000000000000000000000000001 from!240)) (_1!7510 lt!246296)))))

(declare-fun Unit!10245 () Unit!10164)

(assert (=> b!157090 (= lt!246294 Unit!10245)))

(assert (=> b!157090 lt!246327))

(declare-fun bm!2492 () Bool)

(assert (=> bm!2492 (= call!2493 (arrayRangesEq!432 (ite c!8353 lt!245645 lt!246312) (ite c!8353 (_3!446 lt!246313) lt!246321) (ite c!8353 lt!246306 lt!246293) (ite c!8353 (bvadd #b00000000000000000000000000000001 from!240) lt!246301)))))

(declare-fun b!157091 () Bool)

(declare-fun res!131289 () Bool)

(assert (=> b!157091 (=> (not res!131289) (not e!106312))))

(assert (=> b!157091 (= res!131289 (and (= (buf!3745 lt!245644) (buf!3745 (_2!7509 lt!246328))) (= (size!3264 lt!245645) (size!3264 (_3!446 lt!246328)))))))

(declare-fun d!52323 () Bool)

(assert (=> d!52323 e!106311))

(declare-fun res!131288 () Bool)

(assert (=> d!52323 (=> res!131288 e!106311)))

(assert (=> d!52323 (= res!131288 (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!246298 () Bool)

(assert (=> d!52323 (= lt!246298 e!106312)))

(declare-fun res!131290 () Bool)

(assert (=> d!52323 (=> (not res!131290) (not e!106312))))

(declare-fun lt!246326 () (_ BitVec 64))

(declare-fun lt!246317 () (_ BitVec 64))

(assert (=> d!52323 (= res!131290 (= (bvadd lt!246326 lt!246317) (bitIndex!0 (size!3264 (buf!3745 (_2!7509 lt!246328))) (currentByte!6872 (_2!7509 lt!246328)) (currentBit!6867 (_2!7509 lt!246328)))))))

(assert (=> d!52323 (or (not (= (bvand lt!246326 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!246317 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!246326 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!246326 lt!246317) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!246325 () (_ BitVec 64))

(assert (=> d!52323 (= lt!246317 (bvmul lt!246325 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!52323 (or (= lt!246325 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!246325 #b0000000000000000000000000000000000000000000000000000000000001000) lt!246325)))))

(assert (=> d!52323 (= lt!246325 ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))))))

(assert (=> d!52323 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!240) #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b10000000000000000000000000000000)))))

(assert (=> d!52323 (= lt!246326 (bitIndex!0 (size!3264 (buf!3745 lt!245644)) (currentByte!6872 lt!245644) (currentBit!6867 lt!245644)))))

(assert (=> d!52323 (= lt!246328 e!106310)))

(assert (=> d!52323 (= c!8353 (bvslt (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52323 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsle (bvadd #b00000000000000000000000000000001 from!240) to!236) (bvsle to!236 (size!3264 lt!245645)))))

(assert (=> d!52323 (= (readByteArrayLoop!0 lt!245644 lt!245645 (bvadd #b00000000000000000000000000000001 from!240) to!236) lt!246328)))

(declare-fun bm!2490 () Bool)

(assert (=> bm!2490 (= call!2495 (arrayRangesEq!432 lt!245645 (ite c!8353 (array!7227 (store (arr!4129 lt!245645) (bvadd #b00000000000000000000000000000001 from!240) (_1!7510 lt!246296)) (size!3264 lt!245645)) lt!245645) #b00000000000000000000000000000000 (ite c!8353 (bvadd #b00000000000000000000000000000001 from!240) (size!3264 lt!245645))))))

(assert (= (and d!52323 c!8353) b!157090))

(assert (= (and d!52323 (not c!8353)) b!157088))

(assert (= (or b!157090 b!157088) bm!2490))

(assert (= (or b!157090 b!157088) bm!2492))

(assert (= (or b!157090 b!157088) bm!2491))

(assert (= (and d!52323 res!131290) b!157091))

(assert (= (and b!157091 res!131289) b!157087))

(assert (= (and d!52323 (not res!131288)) b!157089))

(declare-fun m!245273 () Bool)

(assert (=> b!157088 m!245273))

(declare-fun m!245275 () Bool)

(assert (=> b!157088 m!245275))

(declare-fun m!245277 () Bool)

(assert (=> b!157089 m!245277))

(assert (=> b!157089 m!244737))

(declare-fun m!245279 () Bool)

(assert (=> bm!2492 m!245279))

(declare-fun m!245281 () Bool)

(assert (=> d!52323 m!245281))

(assert (=> d!52323 m!245259))

(declare-fun m!245283 () Bool)

(assert (=> b!157090 m!245283))

(declare-fun m!245285 () Bool)

(assert (=> b!157090 m!245285))

(declare-fun m!245287 () Bool)

(assert (=> b!157090 m!245287))

(declare-fun m!245289 () Bool)

(assert (=> b!157090 m!245289))

(declare-fun m!245291 () Bool)

(assert (=> b!157090 m!245291))

(assert (=> b!157090 m!245135))

(declare-fun m!245293 () Bool)

(assert (=> b!157090 m!245293))

(assert (=> b!157090 m!245259))

(declare-fun m!245295 () Bool)

(assert (=> b!157090 m!245295))

(declare-fun m!245297 () Bool)

(assert (=> b!157090 m!245297))

(declare-fun m!245299 () Bool)

(assert (=> b!157090 m!245299))

(declare-fun m!245301 () Bool)

(assert (=> b!157090 m!245301))

(declare-fun m!245303 () Bool)

(assert (=> b!157090 m!245303))

(declare-fun m!245305 () Bool)

(assert (=> bm!2491 m!245305))

(assert (=> bm!2490 m!245297))

(declare-fun m!245307 () Bool)

(assert (=> bm!2490 m!245307))

(declare-fun m!245309 () Bool)

(assert (=> b!157087 m!245309))

(assert (=> d!52230 d!52323))

(assert (=> d!52279 d!52315))

(declare-fun e!106315 () Bool)

(declare-fun b!157092 () Bool)

(declare-fun lt!246364 () tuple3!658)

(assert (=> b!157092 (= e!106315 (arrayRangesEq!432 (array!7227 (store (store (arr!4129 arr!153) from!240 (_2!7499 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7499 lt!245648)) (size!3264 arr!153)) (_3!446 lt!246364) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000010 from!240)))))

(declare-fun lt!246340 () Unit!10164)

(declare-fun b!157093 () Bool)

(declare-fun e!106313 () tuple3!658)

(assert (=> b!157093 (= e!106313 (tuple3!659 lt!246340 (withMovedByteIndex!0 lt!245644 #b00000000000000000000000000000001) (array!7227 (store (store (arr!4129 arr!153) from!240 (_2!7499 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7499 lt!245648)) (size!3264 arr!153))))))

(declare-fun call!2497 () (_ BitVec 64))

(assert (=> b!157093 (= call!2497 call!2497)))

(declare-fun lt!246356 () Unit!10164)

(declare-fun Unit!10246 () Unit!10164)

(assert (=> b!157093 (= lt!246356 Unit!10246)))

(declare-fun lt!246335 () Unit!10164)

(assert (=> b!157093 (= lt!246335 (arrayRangesEqReflexiveLemma!41 (array!7227 (store (store (arr!4129 arr!153) from!240 (_2!7499 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7499 lt!245648)) (size!3264 arr!153))))))

(declare-fun call!2498 () Bool)

(assert (=> b!157093 call!2498))

(declare-fun lt!246347 () Unit!10164)

(assert (=> b!157093 (= lt!246347 lt!246335)))

(declare-fun lt!246348 () array!7226)

(assert (=> b!157093 (= lt!246348 (array!7227 (store (store (arr!4129 arr!153) from!240 (_2!7499 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7499 lt!245648)) (size!3264 arr!153)))))

(declare-fun lt!246357 () array!7226)

(assert (=> b!157093 (= lt!246357 (array!7227 (store (store (arr!4129 arr!153) from!240 (_2!7499 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7499 lt!245648)) (size!3264 arr!153)))))

(declare-fun lt!246350 () (_ BitVec 32))

(assert (=> b!157093 (= lt!246350 #b00000000000000000000000000000000)))

(declare-fun lt!246351 () (_ BitVec 32))

(assert (=> b!157093 (= lt!246351 (size!3264 (array!7227 (store (store (arr!4129 arr!153) from!240 (_2!7499 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7499 lt!245648)) (size!3264 arr!153))))))

(declare-fun lt!246329 () (_ BitVec 32))

(assert (=> b!157093 (= lt!246329 #b00000000000000000000000000000000)))

(declare-fun lt!246337 () (_ BitVec 32))

(assert (=> b!157093 (= lt!246337 (bvadd #b00000000000000000000000000000010 from!240))))

(assert (=> b!157093 (= lt!246340 (arrayRangesEqSlicedLemma!41 lt!246348 lt!246357 lt!246350 lt!246351 lt!246329 lt!246337))))

(declare-fun call!2496 () Bool)

(assert (=> b!157093 call!2496))

(declare-fun bm!2494 () Bool)

(declare-fun c!8354 () Bool)

(declare-fun lt!246349 () tuple3!658)

(assert (=> bm!2494 (= call!2497 (bitIndex!0 (ite c!8354 (size!3264 (buf!3745 (_2!7509 lt!246349))) (size!3264 (buf!3745 (withMovedByteIndex!0 lt!245644 #b00000000000000000000000000000001)))) (ite c!8354 (currentByte!6872 (_2!7509 lt!246349)) (currentByte!6872 (withMovedByteIndex!0 lt!245644 #b00000000000000000000000000000001))) (ite c!8354 (currentBit!6867 (_2!7509 lt!246349)) (currentBit!6867 (withMovedByteIndex!0 lt!245644 #b00000000000000000000000000000001)))))))

(declare-fun b!157094 () Bool)

(declare-fun e!106314 () Bool)

(assert (=> b!157094 (= e!106314 (= (select (arr!4129 (_3!446 lt!246364)) (bvadd #b00000000000000000000000000000010 from!240)) (_2!7499 (readBytePure!0 (withMovedByteIndex!0 lt!245644 #b00000000000000000000000000000001)))))))

(assert (=> b!157094 (and (bvsge (bvadd #b00000000000000000000000000000010 from!240) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000010 from!240) (size!3264 (_3!446 lt!246364))))))

(declare-fun b!157095 () Bool)

(declare-fun lt!246330 () Unit!10164)

(assert (=> b!157095 (= e!106313 (tuple3!659 lt!246330 (_2!7509 lt!246349) (_3!446 lt!246349)))))

(declare-fun lt!246332 () tuple2!14126)

(assert (=> b!157095 (= lt!246332 (readByte!0 (withMovedByteIndex!0 lt!245644 #b00000000000000000000000000000001)))))

(declare-fun lt!246338 () array!7226)

(assert (=> b!157095 (= lt!246338 (array!7227 (store (arr!4129 (array!7227 (store (store (arr!4129 arr!153) from!240 (_2!7499 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7499 lt!245648)) (size!3264 arr!153))) (bvadd #b00000000000000000000000000000010 from!240) (_1!7510 lt!246332)) (size!3264 (array!7227 (store (store (arr!4129 arr!153) from!240 (_2!7499 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7499 lt!245648)) (size!3264 arr!153)))))))

(declare-fun lt!246343 () (_ BitVec 64))

(assert (=> b!157095 (= lt!246343 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!246333 () (_ BitVec 32))

(assert (=> b!157095 (= lt!246333 (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240)))))

(declare-fun lt!246346 () Unit!10164)

(assert (=> b!157095 (= lt!246346 (validateOffsetBytesFromBitIndexLemma!0 (withMovedByteIndex!0 lt!245644 #b00000000000000000000000000000001) (_2!7510 lt!246332) lt!246343 lt!246333))))

(assert (=> b!157095 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3264 (buf!3745 (_2!7510 lt!246332)))) ((_ sign_extend 32) (currentByte!6872 (_2!7510 lt!246332))) ((_ sign_extend 32) (currentBit!6867 (_2!7510 lt!246332))) (bvsub lt!246333 ((_ extract 31 0) (bvsdiv (bvadd lt!246343 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!246344 () Unit!10164)

(assert (=> b!157095 (= lt!246344 lt!246346)))

(assert (=> b!157095 (= lt!246349 (readByteArrayLoop!0 (_2!7510 lt!246332) lt!246338 (bvadd #b00000000000000000000000000000010 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!157095 (= (bitIndex!0 (size!3264 (buf!3745 (_2!7510 lt!246332))) (currentByte!6872 (_2!7510 lt!246332)) (currentBit!6867 (_2!7510 lt!246332))) (bvadd (bitIndex!0 (size!3264 (buf!3745 (withMovedByteIndex!0 lt!245644 #b00000000000000000000000000000001))) (currentByte!6872 (withMovedByteIndex!0 lt!245644 #b00000000000000000000000000000001)) (currentBit!6867 (withMovedByteIndex!0 lt!245644 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!246360 () Unit!10164)

(declare-fun Unit!10247 () Unit!10164)

(assert (=> b!157095 (= lt!246360 Unit!10247)))

(assert (=> b!157095 (= (bvadd (bitIndex!0 (size!3264 (buf!3745 (_2!7510 lt!246332))) (currentByte!6872 (_2!7510 lt!246332)) (currentBit!6867 (_2!7510 lt!246332))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2497)))

(declare-fun lt!246341 () Unit!10164)

(declare-fun Unit!10248 () Unit!10164)

(assert (=> b!157095 (= lt!246341 Unit!10248)))

(assert (=> b!157095 (= (bvadd (bitIndex!0 (size!3264 (buf!3745 (withMovedByteIndex!0 lt!245644 #b00000000000000000000000000000001))) (currentByte!6872 (withMovedByteIndex!0 lt!245644 #b00000000000000000000000000000001)) (currentBit!6867 (withMovedByteIndex!0 lt!245644 #b00000000000000000000000000000001))) (bvmul ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240))) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2497)))

(declare-fun lt!246354 () Unit!10164)

(declare-fun Unit!10249 () Unit!10164)

(assert (=> b!157095 (= lt!246354 Unit!10249)))

(assert (=> b!157095 (and (= (buf!3745 (withMovedByteIndex!0 lt!245644 #b00000000000000000000000000000001)) (buf!3745 (_2!7509 lt!246349))) (= (size!3264 (array!7227 (store (store (arr!4129 arr!153) from!240 (_2!7499 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7499 lt!245648)) (size!3264 arr!153))) (size!3264 (_3!446 lt!246349))))))

(declare-fun lt!246355 () Unit!10164)

(declare-fun Unit!10250 () Unit!10164)

(assert (=> b!157095 (= lt!246355 Unit!10250)))

(declare-fun lt!246358 () Unit!10164)

(assert (=> b!157095 (= lt!246358 (arrayUpdatedAtPrefixLemma!41 (array!7227 (store (store (arr!4129 arr!153) from!240 (_2!7499 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7499 lt!245648)) (size!3264 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) (_1!7510 lt!246332)))))

(assert (=> b!157095 call!2498))

(declare-fun lt!246352 () Unit!10164)

(assert (=> b!157095 (= lt!246352 lt!246358)))

(declare-fun lt!246342 () (_ BitVec 32))

(assert (=> b!157095 (= lt!246342 #b00000000000000000000000000000000)))

(declare-fun lt!246336 () Unit!10164)

(assert (=> b!157095 (= lt!246336 (arrayRangesEqTransitive!106 (array!7227 (store (store (arr!4129 arr!153) from!240 (_2!7499 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7499 lt!245648)) (size!3264 arr!153)) lt!246338 (_3!446 lt!246349) lt!246342 (bvadd #b00000000000000000000000000000010 from!240) (bvadd #b00000000000000000000000000000010 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157095 call!2496))

(declare-fun lt!246339 () Unit!10164)

(assert (=> b!157095 (= lt!246339 lt!246336)))

(assert (=> b!157095 (arrayRangesEq!432 (array!7227 (store (store (arr!4129 arr!153) from!240 (_2!7499 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7499 lt!245648)) (size!3264 arr!153)) (_3!446 lt!246349) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000010 from!240))))

(declare-fun lt!246359 () Unit!10164)

(declare-fun Unit!10251 () Unit!10164)

(assert (=> b!157095 (= lt!246359 Unit!10251)))

(declare-fun lt!246345 () Unit!10164)

(assert (=> b!157095 (= lt!246345 (arrayRangesEqImpliesEq!50 lt!246338 (_3!446 lt!246349) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000010 from!240) (bvadd #b00000000000000000000000000000010 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157095 (= (select (store (arr!4129 (array!7227 (store (store (arr!4129 arr!153) from!240 (_2!7499 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7499 lt!245648)) (size!3264 arr!153))) (bvadd #b00000000000000000000000000000010 from!240) (_1!7510 lt!246332)) (bvadd #b00000000000000000000000000000010 from!240)) (select (arr!4129 (_3!446 lt!246349)) (bvadd #b00000000000000000000000000000010 from!240)))))

(declare-fun lt!246331 () Unit!10164)

(assert (=> b!157095 (= lt!246331 lt!246345)))

(declare-fun lt!246363 () Bool)

(assert (=> b!157095 (= lt!246363 (= (select (arr!4129 (_3!446 lt!246349)) (bvadd #b00000000000000000000000000000010 from!240)) (_1!7510 lt!246332)))))

(declare-fun Unit!10252 () Unit!10164)

(assert (=> b!157095 (= lt!246330 Unit!10252)))

(assert (=> b!157095 lt!246363))

(declare-fun bm!2495 () Bool)

(assert (=> bm!2495 (= call!2496 (arrayRangesEq!432 (ite c!8354 (array!7227 (store (store (arr!4129 arr!153) from!240 (_2!7499 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7499 lt!245648)) (size!3264 arr!153)) lt!246348) (ite c!8354 (_3!446 lt!246349) lt!246357) (ite c!8354 lt!246342 lt!246329) (ite c!8354 (bvadd #b00000000000000000000000000000010 from!240) lt!246337)))))

(declare-fun b!157096 () Bool)

(declare-fun res!131292 () Bool)

(assert (=> b!157096 (=> (not res!131292) (not e!106315))))

(assert (=> b!157096 (= res!131292 (and (= (buf!3745 (withMovedByteIndex!0 lt!245644 #b00000000000000000000000000000001)) (buf!3745 (_2!7509 lt!246364))) (= (size!3264 (array!7227 (store (store (arr!4129 arr!153) from!240 (_2!7499 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7499 lt!245648)) (size!3264 arr!153))) (size!3264 (_3!446 lt!246364)))))))

(declare-fun d!52325 () Bool)

(assert (=> d!52325 e!106314))

(declare-fun res!131291 () Bool)

(assert (=> d!52325 (=> res!131291 e!106314)))

(assert (=> d!52325 (= res!131291 (bvsge (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(declare-fun lt!246334 () Bool)

(assert (=> d!52325 (= lt!246334 e!106315)))

(declare-fun res!131293 () Bool)

(assert (=> d!52325 (=> (not res!131293) (not e!106315))))

(declare-fun lt!246362 () (_ BitVec 64))

(declare-fun lt!246353 () (_ BitVec 64))

(assert (=> d!52325 (= res!131293 (= (bvadd lt!246362 lt!246353) (bitIndex!0 (size!3264 (buf!3745 (_2!7509 lt!246364))) (currentByte!6872 (_2!7509 lt!246364)) (currentBit!6867 (_2!7509 lt!246364)))))))

(assert (=> d!52325 (or (not (= (bvand lt!246362 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!246353 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!246362 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!246362 lt!246353) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!246361 () (_ BitVec 64))

(assert (=> d!52325 (= lt!246353 (bvmul lt!246361 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!52325 (or (= lt!246361 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!246361 #b0000000000000000000000000000000000000000000000000000000000001000) lt!246361)))))

(assert (=> d!52325 (= lt!246361 ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240))))))

(assert (=> d!52325 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000010 from!240) #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240)) #b10000000000000000000000000000000)))))

(assert (=> d!52325 (= lt!246362 (bitIndex!0 (size!3264 (buf!3745 (withMovedByteIndex!0 lt!245644 #b00000000000000000000000000000001))) (currentByte!6872 (withMovedByteIndex!0 lt!245644 #b00000000000000000000000000000001)) (currentBit!6867 (withMovedByteIndex!0 lt!245644 #b00000000000000000000000000000001))))))

(assert (=> d!52325 (= lt!246364 e!106313)))

(assert (=> d!52325 (= c!8354 (bvslt (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(assert (=> d!52325 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000010 from!240)) (bvsle (bvadd #b00000000000000000000000000000010 from!240) to!236) (bvsle to!236 (size!3264 (array!7227 (store (store (arr!4129 arr!153) from!240 (_2!7499 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7499 lt!245648)) (size!3264 arr!153)))))))

(assert (=> d!52325 (= (readByteArrayLoop!0 (withMovedByteIndex!0 lt!245644 #b00000000000000000000000000000001) (array!7227 (store (store (arr!4129 arr!153) from!240 (_2!7499 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7499 lt!245648)) (size!3264 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236) lt!246364)))

(declare-fun bm!2493 () Bool)

(assert (=> bm!2493 (= call!2498 (arrayRangesEq!432 (array!7227 (store (store (arr!4129 arr!153) from!240 (_2!7499 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7499 lt!245648)) (size!3264 arr!153)) (ite c!8354 (array!7227 (store (arr!4129 (array!7227 (store (store (arr!4129 arr!153) from!240 (_2!7499 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7499 lt!245648)) (size!3264 arr!153))) (bvadd #b00000000000000000000000000000010 from!240) (_1!7510 lt!246332)) (size!3264 (array!7227 (store (store (arr!4129 arr!153) from!240 (_2!7499 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7499 lt!245648)) (size!3264 arr!153)))) (array!7227 (store (store (arr!4129 arr!153) from!240 (_2!7499 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7499 lt!245648)) (size!3264 arr!153))) #b00000000000000000000000000000000 (ite c!8354 (bvadd #b00000000000000000000000000000010 from!240) (size!3264 (array!7227 (store (store (arr!4129 arr!153) from!240 (_2!7499 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7499 lt!245648)) (size!3264 arr!153))))))))

(assert (= (and d!52325 c!8354) b!157095))

(assert (= (and d!52325 (not c!8354)) b!157093))

(assert (= (or b!157095 b!157093) bm!2493))

(assert (= (or b!157095 b!157093) bm!2495))

(assert (= (or b!157095 b!157093) bm!2494))

(assert (= (and d!52325 res!131293) b!157096))

(assert (= (and b!157096 res!131292) b!157092))

(assert (= (and d!52325 (not res!131291)) b!157094))

(declare-fun m!245311 () Bool)

(assert (=> b!157093 m!245311))

(declare-fun m!245313 () Bool)

(assert (=> b!157093 m!245313))

(declare-fun m!245315 () Bool)

(assert (=> b!157094 m!245315))

(assert (=> b!157094 m!244715))

(declare-fun m!245317 () Bool)

(assert (=> b!157094 m!245317))

(declare-fun m!245319 () Bool)

(assert (=> bm!2495 m!245319))

(declare-fun m!245321 () Bool)

(assert (=> d!52325 m!245321))

(declare-fun m!245323 () Bool)

(assert (=> d!52325 m!245323))

(declare-fun m!245325 () Bool)

(assert (=> b!157095 m!245325))

(declare-fun m!245327 () Bool)

(assert (=> b!157095 m!245327))

(declare-fun m!245329 () Bool)

(assert (=> b!157095 m!245329))

(declare-fun m!245331 () Bool)

(assert (=> b!157095 m!245331))

(declare-fun m!245333 () Bool)

(assert (=> b!157095 m!245333))

(assert (=> b!157095 m!244715))

(declare-fun m!245335 () Bool)

(assert (=> b!157095 m!245335))

(assert (=> b!157095 m!244715))

(declare-fun m!245337 () Bool)

(assert (=> b!157095 m!245337))

(assert (=> b!157095 m!245323))

(declare-fun m!245339 () Bool)

(assert (=> b!157095 m!245339))

(declare-fun m!245341 () Bool)

(assert (=> b!157095 m!245341))

(declare-fun m!245343 () Bool)

(assert (=> b!157095 m!245343))

(declare-fun m!245345 () Bool)

(assert (=> b!157095 m!245345))

(declare-fun m!245347 () Bool)

(assert (=> b!157095 m!245347))

(declare-fun m!245349 () Bool)

(assert (=> bm!2494 m!245349))

(assert (=> bm!2493 m!245341))

(declare-fun m!245351 () Bool)

(assert (=> bm!2493 m!245351))

(declare-fun m!245353 () Bool)

(assert (=> b!157092 m!245353))

(assert (=> d!52260 d!52325))

(declare-fun d!52327 () Bool)

(assert (=> d!52327 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3264 (buf!3745 lt!245644))) ((_ sign_extend 32) (currentByte!6872 lt!245644)) ((_ sign_extend 32) (currentBit!6867 lt!245644)) (bvsub (bvsub to!236 from!240) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!52327 true))

(declare-fun _$7!103 () Unit!10164)

(assert (=> d!52327 (= (choose!57 bs!65 lt!245644 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)) _$7!103)))

(declare-fun bs!12842 () Bool)

(assert (= bs!12842 d!52327))

(declare-fun m!245355 () Bool)

(assert (=> bs!12842 m!245355))

(assert (=> d!52266 d!52327))

(declare-fun d!52329 () Bool)

(declare-fun e!106316 () Bool)

(assert (=> d!52329 e!106316))

(declare-fun res!131294 () Bool)

(assert (=> d!52329 (=> (not res!131294) (not e!106316))))

(assert (=> d!52329 (= res!131294 (moveByteIndexPrecond!0 lt!245644 #b00000000000000000000000000000001))))

(declare-fun Unit!10253 () Unit!10164)

(assert (=> d!52329 (= (moveByteIndex!0 lt!245644 #b00000000000000000000000000000001) (tuple2!14129 Unit!10253 (BitStream!5743 (buf!3745 lt!245644) (bvadd (currentByte!6872 lt!245644) #b00000000000000000000000000000001) (currentBit!6867 lt!245644))))))

(declare-fun b!157097 () Bool)

(assert (=> b!157097 (= e!106316 (and (or (not (= (bvand (currentByte!6872 lt!245644) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6872 lt!245644) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6872 lt!245644) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6872 lt!245644) #b00000000000000000000000000000001) (bvadd (currentByte!6872 lt!245644) #b00000000000000000000000000000001))))))

(assert (= (and d!52329 res!131294) b!157097))

(declare-fun m!245357 () Bool)

(assert (=> d!52329 m!245357))

(assert (=> d!52256 d!52329))

(declare-fun lt!246400 () tuple3!658)

(declare-fun b!157098 () Bool)

(declare-fun e!106319 () Bool)

(assert (=> b!157098 (= e!106319 (arrayRangesEq!432 arr!153 (_3!446 lt!246400) #b00000000000000000000000000000000 from!240))))

(declare-fun lt!246376 () Unit!10164)

(declare-fun b!157099 () Bool)

(declare-fun e!106317 () tuple3!658)

(assert (=> b!157099 (= e!106317 (tuple3!659 lt!246376 bs!65 arr!153))))

(declare-fun call!2500 () (_ BitVec 64))

(assert (=> b!157099 (= call!2500 call!2500)))

(declare-fun lt!246392 () Unit!10164)

(declare-fun Unit!10254 () Unit!10164)

(assert (=> b!157099 (= lt!246392 Unit!10254)))

(declare-fun lt!246371 () Unit!10164)

(assert (=> b!157099 (= lt!246371 (arrayRangesEqReflexiveLemma!41 arr!153))))

(declare-fun call!2501 () Bool)

(assert (=> b!157099 call!2501))

(declare-fun lt!246383 () Unit!10164)

(assert (=> b!157099 (= lt!246383 lt!246371)))

(declare-fun lt!246384 () array!7226)

(assert (=> b!157099 (= lt!246384 arr!153)))

(declare-fun lt!246393 () array!7226)

(assert (=> b!157099 (= lt!246393 arr!153)))

(declare-fun lt!246386 () (_ BitVec 32))

(assert (=> b!157099 (= lt!246386 #b00000000000000000000000000000000)))

(declare-fun lt!246387 () (_ BitVec 32))

(assert (=> b!157099 (= lt!246387 (size!3264 arr!153))))

(declare-fun lt!246365 () (_ BitVec 32))

(assert (=> b!157099 (= lt!246365 #b00000000000000000000000000000000)))

(declare-fun lt!246373 () (_ BitVec 32))

(assert (=> b!157099 (= lt!246373 from!240)))

(assert (=> b!157099 (= lt!246376 (arrayRangesEqSlicedLemma!41 lt!246384 lt!246393 lt!246386 lt!246387 lt!246365 lt!246373))))

(declare-fun call!2499 () Bool)

(assert (=> b!157099 call!2499))

(declare-fun bm!2497 () Bool)

(declare-fun c!8355 () Bool)

(declare-fun lt!246385 () tuple3!658)

(assert (=> bm!2497 (= call!2500 (bitIndex!0 (ite c!8355 (size!3264 (buf!3745 (_2!7509 lt!246385))) (size!3264 (buf!3745 bs!65))) (ite c!8355 (currentByte!6872 (_2!7509 lt!246385)) (currentByte!6872 bs!65)) (ite c!8355 (currentBit!6867 (_2!7509 lt!246385)) (currentBit!6867 bs!65))))))

(declare-fun b!157100 () Bool)

(declare-fun e!106318 () Bool)

(assert (=> b!157100 (= e!106318 (= (select (arr!4129 (_3!446 lt!246400)) from!240) (_2!7499 (readBytePure!0 bs!65))))))

(assert (=> b!157100 (and (bvsge from!240 #b00000000000000000000000000000000) (bvslt from!240 (size!3264 (_3!446 lt!246400))))))

(declare-fun b!157101 () Bool)

(declare-fun lt!246366 () Unit!10164)

(assert (=> b!157101 (= e!106317 (tuple3!659 lt!246366 (_2!7509 lt!246385) (_3!446 lt!246385)))))

(declare-fun lt!246368 () tuple2!14126)

(assert (=> b!157101 (= lt!246368 (readByte!0 bs!65))))

(declare-fun lt!246374 () array!7226)

(assert (=> b!157101 (= lt!246374 (array!7227 (store (arr!4129 arr!153) from!240 (_1!7510 lt!246368)) (size!3264 arr!153)))))

(declare-fun lt!246379 () (_ BitVec 64))

(assert (=> b!157101 (= lt!246379 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!246369 () (_ BitVec 32))

(assert (=> b!157101 (= lt!246369 (bvsub to!236 from!240))))

(declare-fun lt!246382 () Unit!10164)

(assert (=> b!157101 (= lt!246382 (validateOffsetBytesFromBitIndexLemma!0 bs!65 (_2!7510 lt!246368) lt!246379 lt!246369))))

(assert (=> b!157101 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3264 (buf!3745 (_2!7510 lt!246368)))) ((_ sign_extend 32) (currentByte!6872 (_2!7510 lt!246368))) ((_ sign_extend 32) (currentBit!6867 (_2!7510 lt!246368))) (bvsub lt!246369 ((_ extract 31 0) (bvsdiv (bvadd lt!246379 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!246380 () Unit!10164)

(assert (=> b!157101 (= lt!246380 lt!246382)))

(assert (=> b!157101 (= lt!246385 (readByteArrayLoop!0 (_2!7510 lt!246368) lt!246374 (bvadd from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!157101 (= (bitIndex!0 (size!3264 (buf!3745 (_2!7510 lt!246368))) (currentByte!6872 (_2!7510 lt!246368)) (currentBit!6867 (_2!7510 lt!246368))) (bvadd (bitIndex!0 (size!3264 (buf!3745 bs!65)) (currentByte!6872 bs!65) (currentBit!6867 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!246396 () Unit!10164)

(declare-fun Unit!10255 () Unit!10164)

(assert (=> b!157101 (= lt!246396 Unit!10255)))

(assert (=> b!157101 (= (bvadd (bitIndex!0 (size!3264 (buf!3745 (_2!7510 lt!246368))) (currentByte!6872 (_2!7510 lt!246368)) (currentBit!6867 (_2!7510 lt!246368))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2500)))

(declare-fun lt!246377 () Unit!10164)

(declare-fun Unit!10256 () Unit!10164)

(assert (=> b!157101 (= lt!246377 Unit!10256)))

(assert (=> b!157101 (= (bvadd (bitIndex!0 (size!3264 (buf!3745 bs!65)) (currentByte!6872 bs!65) (currentBit!6867 bs!65)) (bvmul ((_ sign_extend 32) (bvsub to!236 from!240)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2500)))

(declare-fun lt!246390 () Unit!10164)

(declare-fun Unit!10257 () Unit!10164)

(assert (=> b!157101 (= lt!246390 Unit!10257)))

(assert (=> b!157101 (and (= (buf!3745 bs!65) (buf!3745 (_2!7509 lt!246385))) (= (size!3264 arr!153) (size!3264 (_3!446 lt!246385))))))

(declare-fun lt!246391 () Unit!10164)

(declare-fun Unit!10258 () Unit!10164)

(assert (=> b!157101 (= lt!246391 Unit!10258)))

(declare-fun lt!246394 () Unit!10164)

(assert (=> b!157101 (= lt!246394 (arrayUpdatedAtPrefixLemma!41 arr!153 from!240 (_1!7510 lt!246368)))))

(assert (=> b!157101 call!2501))

(declare-fun lt!246388 () Unit!10164)

(assert (=> b!157101 (= lt!246388 lt!246394)))

(declare-fun lt!246378 () (_ BitVec 32))

(assert (=> b!157101 (= lt!246378 #b00000000000000000000000000000000)))

(declare-fun lt!246372 () Unit!10164)

(assert (=> b!157101 (= lt!246372 (arrayRangesEqTransitive!106 arr!153 lt!246374 (_3!446 lt!246385) lt!246378 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157101 call!2499))

(declare-fun lt!246375 () Unit!10164)

(assert (=> b!157101 (= lt!246375 lt!246372)))

(assert (=> b!157101 (arrayRangesEq!432 arr!153 (_3!446 lt!246385) #b00000000000000000000000000000000 from!240)))

(declare-fun lt!246395 () Unit!10164)

(declare-fun Unit!10259 () Unit!10164)

(assert (=> b!157101 (= lt!246395 Unit!10259)))

(declare-fun lt!246381 () Unit!10164)

(assert (=> b!157101 (= lt!246381 (arrayRangesEqImpliesEq!50 lt!246374 (_3!446 lt!246385) #b00000000000000000000000000000000 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157101 (= (select (store (arr!4129 arr!153) from!240 (_1!7510 lt!246368)) from!240) (select (arr!4129 (_3!446 lt!246385)) from!240))))

(declare-fun lt!246367 () Unit!10164)

(assert (=> b!157101 (= lt!246367 lt!246381)))

(declare-fun lt!246399 () Bool)

(assert (=> b!157101 (= lt!246399 (= (select (arr!4129 (_3!446 lt!246385)) from!240) (_1!7510 lt!246368)))))

(declare-fun Unit!10260 () Unit!10164)

(assert (=> b!157101 (= lt!246366 Unit!10260)))

(assert (=> b!157101 lt!246399))

(declare-fun bm!2498 () Bool)

(assert (=> bm!2498 (= call!2499 (arrayRangesEq!432 (ite c!8355 arr!153 lt!246384) (ite c!8355 (_3!446 lt!246385) lt!246393) (ite c!8355 lt!246378 lt!246365) (ite c!8355 from!240 lt!246373)))))

(declare-fun b!157102 () Bool)

(declare-fun res!131296 () Bool)

(assert (=> b!157102 (=> (not res!131296) (not e!106319))))

(assert (=> b!157102 (= res!131296 (and (= (buf!3745 bs!65) (buf!3745 (_2!7509 lt!246400))) (= (size!3264 arr!153) (size!3264 (_3!446 lt!246400)))))))

(declare-fun d!52331 () Bool)

(assert (=> d!52331 e!106318))

(declare-fun res!131295 () Bool)

(assert (=> d!52331 (=> res!131295 e!106318)))

(assert (=> d!52331 (= res!131295 (bvsge from!240 to!236))))

(declare-fun lt!246370 () Bool)

(assert (=> d!52331 (= lt!246370 e!106319)))

(declare-fun res!131297 () Bool)

(assert (=> d!52331 (=> (not res!131297) (not e!106319))))

(declare-fun lt!246398 () (_ BitVec 64))

(declare-fun lt!246389 () (_ BitVec 64))

(assert (=> d!52331 (= res!131297 (= (bvadd lt!246398 lt!246389) (bitIndex!0 (size!3264 (buf!3745 (_2!7509 lt!246400))) (currentByte!6872 (_2!7509 lt!246400)) (currentBit!6867 (_2!7509 lt!246400)))))))

(assert (=> d!52331 (or (not (= (bvand lt!246398 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!246389 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!246398 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!246398 lt!246389) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!246397 () (_ BitVec 64))

(assert (=> d!52331 (= lt!246389 (bvmul lt!246397 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!52331 (or (= lt!246397 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!246397 #b0000000000000000000000000000000000000000000000000000000000001000) lt!246397)))))

(assert (=> d!52331 (= lt!246397 ((_ sign_extend 32) (bvsub to!236 from!240)))))

(assert (=> d!52331 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand from!240 #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000)))))

(assert (=> d!52331 (= lt!246398 (bitIndex!0 (size!3264 (buf!3745 bs!65)) (currentByte!6872 bs!65) (currentBit!6867 bs!65)))))

(assert (=> d!52331 (= lt!246400 e!106317)))

(assert (=> d!52331 (= c!8355 (bvslt from!240 to!236))))

(assert (=> d!52331 (and (bvsle #b00000000000000000000000000000000 from!240) (bvsle from!240 to!236) (bvsle to!236 (size!3264 arr!153)))))

(assert (=> d!52331 (= (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236) lt!246400)))

(declare-fun bm!2496 () Bool)

(assert (=> bm!2496 (= call!2501 (arrayRangesEq!432 arr!153 (ite c!8355 (array!7227 (store (arr!4129 arr!153) from!240 (_1!7510 lt!246368)) (size!3264 arr!153)) arr!153) #b00000000000000000000000000000000 (ite c!8355 from!240 (size!3264 arr!153))))))

(assert (= (and d!52331 c!8355) b!157101))

(assert (= (and d!52331 (not c!8355)) b!157099))

(assert (= (or b!157101 b!157099) bm!2496))

(assert (= (or b!157101 b!157099) bm!2498))

(assert (= (or b!157101 b!157099) bm!2497))

(assert (= (and d!52331 res!131297) b!157102))

(assert (= (and b!157102 res!131296) b!157098))

(assert (= (and d!52331 (not res!131295)) b!157100))

(declare-fun m!245359 () Bool)

(assert (=> b!157099 m!245359))

(declare-fun m!245361 () Bool)

(assert (=> b!157099 m!245361))

(declare-fun m!245363 () Bool)

(assert (=> b!157100 m!245363))

(assert (=> b!157100 m!244713))

(declare-fun m!245365 () Bool)

(assert (=> bm!2498 m!245365))

(declare-fun m!245367 () Bool)

(assert (=> d!52331 m!245367))

(assert (=> d!52331 m!245269))

(declare-fun m!245369 () Bool)

(assert (=> b!157101 m!245369))

(declare-fun m!245371 () Bool)

(assert (=> b!157101 m!245371))

(declare-fun m!245373 () Bool)

(assert (=> b!157101 m!245373))

(declare-fun m!245375 () Bool)

(assert (=> b!157101 m!245375))

(declare-fun m!245377 () Bool)

(assert (=> b!157101 m!245377))

(assert (=> b!157101 m!244999))

(declare-fun m!245379 () Bool)

(assert (=> b!157101 m!245379))

(assert (=> b!157101 m!245269))

(declare-fun m!245381 () Bool)

(assert (=> b!157101 m!245381))

(declare-fun m!245383 () Bool)

(assert (=> b!157101 m!245383))

(declare-fun m!245385 () Bool)

(assert (=> b!157101 m!245385))

(declare-fun m!245387 () Bool)

(assert (=> b!157101 m!245387))

(declare-fun m!245389 () Bool)

(assert (=> b!157101 m!245389))

(declare-fun m!245391 () Bool)

(assert (=> bm!2497 m!245391))

(assert (=> bm!2496 m!245383))

(declare-fun m!245393 () Bool)

(assert (=> bm!2496 m!245393))

(declare-fun m!245395 () Bool)

(assert (=> b!157098 m!245395))

(assert (=> d!52244 d!52331))

(check-sat (not bm!2496) (not d!52321) (not b!157063) (not d!52331) (not b!157065) (not d!52313) (not bm!2495) (not b!157092) (not b!157089) (not bm!2494) (not d!52325) (not b!157094) (not b!157073) (not b!157099) (not b!157090) (not bm!2491) (not d!52327) (not d!52309) (not bm!2493) (not d!52329) (not b!157101) (not d!52317) (not bm!2490) (not b!157071) (not b!157087) (not b!157088) (not d!52307) (not b!157098) (not d!52319) (not bm!2497) (not bm!2498) (not b!157095) (not bm!2492) (not b!157100) (not d!52323) (not b!157093))
(check-sat)
