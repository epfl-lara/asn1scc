; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31066 () Bool)

(assert start!31066)

(declare-fun to!236 () (_ BitVec 32))

(declare-fun b!156911 () Bool)

(declare-datatypes ((array!7224 0))(
  ( (array!7225 (arr!4126 (Array (_ BitVec 32) (_ BitVec 8))) (size!3261 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5740 0))(
  ( (BitStream!5741 (buf!3744 array!7224) (currentByte!6871 (_ BitVec 32)) (currentBit!6866 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!14104 0))(
  ( (tuple2!14105 (_1!7496 BitStream!5740) (_2!7496 array!7224)) )
))
(declare-fun lt!245609 () tuple2!14104)

(declare-fun e!106161 () Bool)

(declare-fun lt!245612 () tuple2!14104)

(assert (=> b!156911 (= e!106161 (or (bvsgt #b00000000000000000000000000000000 to!236) (bvsle (size!3261 (_2!7496 lt!245609)) (size!3261 (_2!7496 lt!245612)))))))

(declare-fun lt!245614 () tuple2!14104)

(declare-fun arrayRangesEq!431 (array!7224 array!7224 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!156911 (arrayRangesEq!431 (_2!7496 lt!245612) (_2!7496 lt!245614) #b00000000000000000000000000000000 to!236)))

(declare-datatypes ((Unit!10162 0))(
  ( (Unit!10163) )
))
(declare-fun lt!245613 () Unit!10162)

(declare-fun lt!245617 () BitStream!5740)

(declare-fun from!240 () (_ BitVec 32))

(declare-fun lt!245608 () array!7224)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5740 array!7224 (_ BitVec 32) (_ BitVec 32)) Unit!10162)

(assert (=> b!156911 (= lt!245613 (readByteArrayLoopArrayPrefixLemma!0 lt!245617 lt!245608 (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun bs!65 () BitStream!5740)

(declare-fun arr!153 () array!7224)

(declare-datatypes ((tuple2!14106 0))(
  ( (tuple2!14107 (_1!7497 BitStream!5740) (_2!7497 (_ BitVec 8))) )
))
(declare-fun lt!245610 () tuple2!14106)

(declare-fun readByteArrayLoopPure!0 (BitStream!5740 array!7224 (_ BitVec 32) (_ BitVec 32)) tuple2!14104)

(declare-fun withMovedByteIndex!0 (BitStream!5740 (_ BitVec 32)) BitStream!5740)

(declare-fun readBytePure!0 (BitStream!5740) tuple2!14106)

(assert (=> b!156911 (= lt!245614 (readByteArrayLoopPure!0 (withMovedByteIndex!0 lt!245617 #b00000000000000000000000000000001) (array!7225 (store (store (arr!4126 arr!153) from!240 (_2!7497 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7497 lt!245610)) (size!3261 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(declare-fun lt!245616 () (Array (_ BitVec 32) (_ BitVec 8)))

(assert (=> b!156911 (= lt!245616 (store (arr!4126 arr!153) from!240 (_2!7497 (readBytePure!0 bs!65))))))

(declare-fun res!131141 () Bool)

(declare-fun e!106158 () Bool)

(assert (=> start!31066 (=> (not res!131141) (not e!106158))))

(assert (=> start!31066 (= res!131141 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3261 arr!153))))))

(assert (=> start!31066 e!106158))

(assert (=> start!31066 true))

(declare-fun array_inv!3030 (array!7224) Bool)

(assert (=> start!31066 (array_inv!3030 arr!153)))

(declare-fun e!106162 () Bool)

(declare-fun inv!12 (BitStream!5740) Bool)

(assert (=> start!31066 (and (inv!12 bs!65) e!106162)))

(declare-fun b!156912 () Bool)

(declare-fun e!106160 () Bool)

(assert (=> b!156912 (= e!106160 (not e!106161))))

(declare-fun res!131143 () Bool)

(assert (=> b!156912 (=> res!131143 e!106161)))

(assert (=> b!156912 (= res!131143 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236)))))

(declare-fun lt!245607 () (_ BitVec 64))

(declare-fun lt!245611 () (_ BitVec 64))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!156912 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3261 (buf!3744 lt!245617))) lt!245607 lt!245611 (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001))))

(assert (=> b!156912 (= lt!245611 ((_ sign_extend 32) (currentBit!6866 lt!245617)))))

(assert (=> b!156912 (= lt!245607 ((_ sign_extend 32) (currentByte!6871 lt!245617)))))

(declare-fun lt!245615 () Unit!10162)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5740 BitStream!5740 (_ BitVec 64) (_ BitVec 32)) Unit!10162)

(assert (=> b!156912 (= lt!245615 (validateOffsetBytesFromBitIndexLemma!0 bs!65 lt!245617 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)))))

(assert (=> b!156912 (= lt!245610 (readBytePure!0 lt!245617))))

(declare-fun b!156913 () Bool)

(assert (=> b!156913 (= e!106158 e!106160)))

(declare-fun res!131140 () Bool)

(assert (=> b!156913 (=> (not res!131140) (not e!106160))))

(assert (=> b!156913 (= res!131140 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(assert (=> b!156913 (= lt!245612 (readByteArrayLoopPure!0 lt!245617 lt!245608 (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> b!156913 (= lt!245608 (array!7225 (store (arr!4126 arr!153) from!240 (_2!7497 (readBytePure!0 bs!65))) (size!3261 arr!153)))))

(assert (=> b!156913 (= lt!245617 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(assert (=> b!156913 (= lt!245609 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!156914 () Bool)

(declare-fun res!131142 () Bool)

(assert (=> b!156914 (=> (not res!131142) (not e!106158))))

(assert (=> b!156914 (= res!131142 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3261 (buf!3744 bs!65))) ((_ sign_extend 32) (currentByte!6871 bs!65)) ((_ sign_extend 32) (currentBit!6866 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!156915 () Bool)

(assert (=> b!156915 (= e!106162 (array_inv!3030 (buf!3744 bs!65)))))

(declare-fun b!156916 () Bool)

(declare-fun res!131144 () Bool)

(assert (=> b!156916 (=> res!131144 e!106161)))

(assert (=> b!156916 (= res!131144 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!3261 (buf!3744 lt!245617))) lt!245607 lt!245611 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))))

(assert (= (and start!31066 res!131141) b!156914))

(assert (= (and b!156914 res!131142) b!156913))

(assert (= (and b!156913 res!131140) b!156912))

(assert (= (and b!156912 (not res!131143)) b!156916))

(assert (= (and b!156916 (not res!131144)) b!156911))

(assert (= start!31066 b!156915))

(declare-fun m!244677 () Bool)

(assert (=> b!156911 m!244677))

(declare-fun m!244679 () Bool)

(assert (=> b!156911 m!244679))

(declare-fun m!244681 () Bool)

(assert (=> b!156911 m!244681))

(declare-fun m!244683 () Bool)

(assert (=> b!156911 m!244683))

(declare-fun m!244685 () Bool)

(assert (=> b!156911 m!244685))

(declare-fun m!244687 () Bool)

(assert (=> b!156911 m!244687))

(declare-fun m!244689 () Bool)

(assert (=> b!156911 m!244689))

(assert (=> b!156911 m!244681))

(declare-fun m!244691 () Bool)

(assert (=> start!31066 m!244691))

(declare-fun m!244693 () Bool)

(assert (=> start!31066 m!244693))

(assert (=> b!156913 m!244687))

(declare-fun m!244695 () Bool)

(assert (=> b!156913 m!244695))

(declare-fun m!244697 () Bool)

(assert (=> b!156913 m!244697))

(assert (=> b!156913 m!244679))

(declare-fun m!244699 () Bool)

(assert (=> b!156913 m!244699))

(declare-fun m!244701 () Bool)

(assert (=> b!156916 m!244701))

(declare-fun m!244703 () Bool)

(assert (=> b!156912 m!244703))

(declare-fun m!244705 () Bool)

(assert (=> b!156912 m!244705))

(declare-fun m!244707 () Bool)

(assert (=> b!156912 m!244707))

(declare-fun m!244709 () Bool)

(assert (=> b!156914 m!244709))

(declare-fun m!244711 () Bool)

(assert (=> b!156915 m!244711))

(push 1)

(assert (not b!156913))

(assert (not start!31066))

(assert (not b!156911))

(assert (not b!156915))

(assert (not b!156912))

(assert (not b!156916))

(assert (not b!156914))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!52138 () Bool)

(assert (=> d!52138 (= (array_inv!3030 (buf!3744 bs!65)) (bvsge (size!3261 (buf!3744 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!156915 d!52138))

(declare-fun d!52140 () Bool)

(declare-datatypes ((tuple2!14116 0))(
  ( (tuple2!14117 (_1!7502 (_ BitVec 8)) (_2!7502 BitStream!5740)) )
))
(declare-fun lt!245686 () tuple2!14116)

(declare-fun readByte!0 (BitStream!5740) tuple2!14116)

(assert (=> d!52140 (= lt!245686 (readByte!0 bs!65))))

(assert (=> d!52140 (= (readBytePure!0 bs!65) (tuple2!14107 (_2!7502 lt!245686) (_1!7502 lt!245686)))))

(declare-fun bs!12789 () Bool)

(assert (= bs!12789 d!52140))

(declare-fun m!244785 () Bool)

(assert (=> bs!12789 m!244785))

(assert (=> b!156911 d!52140))

(declare-fun d!52142 () Bool)

(declare-datatypes ((tuple2!14118 0))(
  ( (tuple2!14119 (_1!7503 Unit!10162) (_2!7503 BitStream!5740)) )
))
(declare-fun moveByteIndex!0 (BitStream!5740 (_ BitVec 32)) tuple2!14118)

(assert (=> d!52142 (= (withMovedByteIndex!0 lt!245617 #b00000000000000000000000000000001) (_2!7503 (moveByteIndex!0 lt!245617 #b00000000000000000000000000000001)))))

(declare-fun bs!12790 () Bool)

(assert (= bs!12790 d!52142))

(declare-fun m!244787 () Bool)

(assert (=> bs!12790 m!244787))

(assert (=> b!156911 d!52142))

(declare-fun d!52144 () Bool)

(declare-fun lt!245695 () tuple2!14104)

(declare-fun lt!245697 () tuple2!14104)

(assert (=> d!52144 (arrayRangesEq!431 (_2!7496 lt!245695) (_2!7496 lt!245697) #b00000000000000000000000000000000 to!236)))

(declare-fun lt!245696 () BitStream!5740)

(declare-fun lt!245698 () Unit!10162)

(declare-fun choose!35 (BitStream!5740 array!7224 (_ BitVec 32) (_ BitVec 32) tuple2!14104 array!7224 BitStream!5740 tuple2!14104 array!7224) Unit!10162)

(assert (=> d!52144 (= lt!245698 (choose!35 lt!245617 lt!245608 (bvadd #b00000000000000000000000000000001 from!240) to!236 lt!245695 (_2!7496 lt!245695) lt!245696 lt!245697 (_2!7496 lt!245697)))))

(assert (=> d!52144 (= lt!245697 (readByteArrayLoopPure!0 lt!245696 (array!7225 (store (arr!4126 lt!245608) (bvadd #b00000000000000000000000000000001 from!240) (_2!7497 (readBytePure!0 lt!245617))) (size!3261 lt!245608)) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> d!52144 (= lt!245696 (withMovedByteIndex!0 lt!245617 #b00000000000000000000000000000001))))

(assert (=> d!52144 (= lt!245695 (readByteArrayLoopPure!0 lt!245617 lt!245608 (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52144 (= (readByteArrayLoopArrayPrefixLemma!0 lt!245617 lt!245608 (bvadd #b00000000000000000000000000000001 from!240) to!236) lt!245698)))

(declare-fun bs!12792 () Bool)

(assert (= bs!12792 d!52144))

(assert (=> bs!12792 m!244681))

(declare-fun m!244789 () Bool)

(assert (=> bs!12792 m!244789))

(declare-fun m!244791 () Bool)

(assert (=> bs!12792 m!244791))

(declare-fun m!244793 () Bool)

(assert (=> bs!12792 m!244793))

(declare-fun m!244795 () Bool)

(assert (=> bs!12792 m!244795))

(assert (=> bs!12792 m!244697))

(assert (=> bs!12792 m!244707))

(assert (=> b!156911 d!52144))

(declare-fun d!52146 () Bool)

(declare-datatypes ((tuple3!654 0))(
  ( (tuple3!655 (_1!7504 Unit!10162) (_2!7504 BitStream!5740) (_3!444 array!7224)) )
))
(declare-fun lt!245701 () tuple3!654)

(declare-fun readByteArrayLoop!0 (BitStream!5740 array!7224 (_ BitVec 32) (_ BitVec 32)) tuple3!654)

(assert (=> d!52146 (= lt!245701 (readByteArrayLoop!0 (withMovedByteIndex!0 lt!245617 #b00000000000000000000000000000001) (array!7225 (store (store (arr!4126 arr!153) from!240 (_2!7497 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7497 lt!245610)) (size!3261 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(assert (=> d!52146 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 lt!245617 #b00000000000000000000000000000001) (array!7225 (store (store (arr!4126 arr!153) from!240 (_2!7497 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7497 lt!245610)) (size!3261 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236) (tuple2!14105 (_2!7504 lt!245701) (_3!444 lt!245701)))))

(declare-fun bs!12793 () Bool)

(assert (= bs!12793 d!52146))

(assert (=> bs!12793 m!244681))

(declare-fun m!244797 () Bool)

(assert (=> bs!12793 m!244797))

(assert (=> b!156911 d!52146))

(declare-fun d!52150 () Bool)

(declare-fun res!131185 () Bool)

(declare-fun e!106210 () Bool)

(assert (=> d!52150 (=> res!131185 e!106210)))

(assert (=> d!52150 (= res!131185 (= #b00000000000000000000000000000000 to!236))))

(assert (=> d!52150 (= (arrayRangesEq!431 (_2!7496 lt!245612) (_2!7496 lt!245614) #b00000000000000000000000000000000 to!236) e!106210)))

(declare-fun b!156963 () Bool)

(declare-fun e!106211 () Bool)

(assert (=> b!156963 (= e!106210 e!106211)))

(declare-fun res!131186 () Bool)

(assert (=> b!156963 (=> (not res!131186) (not e!106211))))

(assert (=> b!156963 (= res!131186 (= (select (arr!4126 (_2!7496 lt!245612)) #b00000000000000000000000000000000) (select (arr!4126 (_2!7496 lt!245614)) #b00000000000000000000000000000000)))))

(declare-fun b!156964 () Bool)

(assert (=> b!156964 (= e!106211 (arrayRangesEq!431 (_2!7496 lt!245612) (_2!7496 lt!245614) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236))))

(assert (= (and d!52150 (not res!131185)) b!156963))

(assert (= (and b!156963 res!131186) b!156964))

(declare-fun m!244805 () Bool)

(assert (=> b!156963 m!244805))

(declare-fun m!244807 () Bool)

(assert (=> b!156963 m!244807))

(declare-fun m!244809 () Bool)

(assert (=> b!156964 m!244809))

(assert (=> b!156911 d!52150))

(declare-fun d!52154 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!52154 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3261 (buf!3744 lt!245617))) lt!245607 lt!245611 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) (bvsle ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3261 (buf!3744 lt!245617))) lt!245607 lt!245611) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12795 () Bool)

(assert (= bs!12795 d!52154))

(declare-fun m!244813 () Bool)

(assert (=> bs!12795 m!244813))

(assert (=> b!156916 d!52154))

(declare-fun d!52158 () Bool)

(assert (=> d!52158 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3261 (buf!3744 lt!245617))) lt!245607 lt!245611 (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3261 (buf!3744 lt!245617))) lt!245607 lt!245611) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12796 () Bool)

(assert (= bs!12796 d!52158))

(assert (=> bs!12796 m!244813))

(assert (=> b!156912 d!52158))

(declare-fun d!52160 () Bool)

(declare-fun e!106214 () Bool)

(assert (=> d!52160 e!106214))

(declare-fun res!131189 () Bool)

(assert (=> d!52160 (=> (not res!131189) (not e!106214))))

(assert (=> d!52160 (= res!131189 (and (or (let ((rhs!3420 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3420 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3420) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!52161 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!52161 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!52161 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3419 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3419 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3419) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!245723 () Unit!10162)

(declare-fun choose!57 (BitStream!5740 BitStream!5740 (_ BitVec 64) (_ BitVec 32)) Unit!10162)

(assert (=> d!52160 (= lt!245723 (choose!57 bs!65 lt!245617 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)))))

(assert (=> d!52160 (= (validateOffsetBytesFromBitIndexLemma!0 bs!65 lt!245617 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)) lt!245723)))

(declare-fun b!156967 () Bool)

(declare-fun lt!245725 () (_ BitVec 32))

(assert (=> b!156967 (= e!106214 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3261 (buf!3744 lt!245617))) ((_ sign_extend 32) (currentByte!6871 lt!245617)) ((_ sign_extend 32) (currentBit!6866 lt!245617)) (bvsub (bvsub to!236 from!240) lt!245725)))))

(assert (=> b!156967 (or (= (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000) (bvand lt!245725 #b10000000000000000000000000000000)) (= (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!236 from!240) lt!245725) #b10000000000000000000000000000000)))))

(declare-fun lt!245724 () (_ BitVec 64))

(assert (=> b!156967 (= lt!245725 ((_ extract 31 0) lt!245724))))

(assert (=> b!156967 (and (bvslt lt!245724 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!245724 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!156967 (= lt!245724 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!52160 res!131189) b!156967))

(declare-fun m!244823 () Bool)

(assert (=> d!52160 m!244823))

(declare-fun m!244825 () Bool)

(assert (=> b!156967 m!244825))

(assert (=> b!156912 d!52160))

(declare-fun d!52165 () Bool)

(declare-fun lt!245726 () tuple2!14116)

(assert (=> d!52165 (= lt!245726 (readByte!0 lt!245617))))

(assert (=> d!52165 (= (readBytePure!0 lt!245617) (tuple2!14107 (_2!7502 lt!245726) (_1!7502 lt!245726)))))

(declare-fun bs!12799 () Bool)

(assert (= bs!12799 d!52165))

(declare-fun m!244827 () Bool)

(assert (=> bs!12799 m!244827))

(assert (=> b!156912 d!52165))

(declare-fun lt!245727 () tuple3!654)

(declare-fun d!52167 () Bool)

(assert (=> d!52167 (= lt!245727 (readByteArrayLoop!0 lt!245617 lt!245608 (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52167 (= (readByteArrayLoopPure!0 lt!245617 lt!245608 (bvadd #b00000000000000000000000000000001 from!240) to!236) (tuple2!14105 (_2!7504 lt!245727) (_3!444 lt!245727)))))

(declare-fun bs!12800 () Bool)

(assert (= bs!12800 d!52167))

(declare-fun m!244829 () Bool)

(assert (=> bs!12800 m!244829))

(assert (=> b!156913 d!52167))

(assert (=> b!156913 d!52140))

(declare-fun d!52169 () Bool)

(assert (=> d!52169 (= (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7503 (moveByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun bs!12801 () Bool)

(assert (= bs!12801 d!52169))

(declare-fun m!244831 () Bool)

(assert (=> bs!12801 m!244831))

(assert (=> b!156913 d!52169))

(declare-fun lt!245728 () tuple3!654)

(declare-fun d!52171 () Bool)

(assert (=> d!52171 (= lt!245728 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!52171 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!14105 (_2!7504 lt!245728) (_3!444 lt!245728)))))

(declare-fun bs!12802 () Bool)

(assert (= bs!12802 d!52171))

(declare-fun m!244833 () Bool)

(assert (=> bs!12802 m!244833))

(assert (=> b!156913 d!52171))

(declare-fun d!52173 () Bool)

(assert (=> d!52173 (= (array_inv!3030 arr!153) (bvsge (size!3261 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!31066 d!52173))

(declare-fun d!52175 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!52175 (= (inv!12 bs!65) (invariant!0 (currentBit!6866 bs!65) (currentByte!6871 bs!65) (size!3261 (buf!3744 bs!65))))))

(declare-fun bs!12803 () Bool)

(assert (= bs!12803 d!52175))

(declare-fun m!244835 () Bool)

(assert (=> bs!12803 m!244835))

(assert (=> start!31066 d!52175))

(declare-fun d!52177 () Bool)

(assert (=> d!52177 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3261 (buf!3744 bs!65))) ((_ sign_extend 32) (currentByte!6871 bs!65)) ((_ sign_extend 32) (currentBit!6866 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3261 (buf!3744 bs!65))) ((_ sign_extend 32) (currentByte!6871 bs!65)) ((_ sign_extend 32) (currentBit!6866 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12804 () Bool)

(assert (= bs!12804 d!52177))

(declare-fun m!244837 () Bool)

(assert (=> bs!12804 m!244837))

(assert (=> b!156914 d!52177))

(push 1)

(assert (not d!52146))

(assert (not d!52158))

(assert (not d!52175))

(assert (not d!52169))

(assert (not d!52171))

(assert (not d!52165))

(assert (not d!52160))

(assert (not d!52177))

(assert (not d!52154))

(assert (not b!156967))

(assert (not b!156964))

(assert (not d!52167))

(assert (not d!52142))

(assert (not d!52140))

(assert (not d!52144))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!52204 () Bool)

(declare-fun res!131193 () Bool)

(declare-fun e!106218 () Bool)

(assert (=> d!52204 (=> res!131193 e!106218)))

(assert (=> d!52204 (= res!131193 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236))))

(assert (=> d!52204 (= (arrayRangesEq!431 (_2!7496 lt!245612) (_2!7496 lt!245614) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236) e!106218)))

(declare-fun b!156971 () Bool)

(declare-fun e!106219 () Bool)

(assert (=> b!156971 (= e!106218 e!106219)))

(declare-fun res!131194 () Bool)

(assert (=> b!156971 (=> (not res!131194) (not e!106219))))

(assert (=> b!156971 (= res!131194 (= (select (arr!4126 (_2!7496 lt!245612)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4126 (_2!7496 lt!245614)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!156972 () Bool)

(assert (=> b!156972 (= e!106219 (arrayRangesEq!431 (_2!7496 lt!245612) (_2!7496 lt!245614) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!236))))

(assert (= (and d!52204 (not res!131193)) b!156971))

(assert (= (and b!156971 res!131194) b!156972))

(declare-fun m!244861 () Bool)

(assert (=> b!156971 m!244861))

(declare-fun m!244863 () Bool)

(assert (=> b!156971 m!244863))

(declare-fun m!244865 () Bool)

(assert (=> b!156972 m!244865))

(assert (=> b!156964 d!52204))

(declare-fun d!52206 () Bool)

(declare-fun lt!245762 () (_ BitVec 8))

(declare-fun lt!245760 () (_ BitVec 8))

(assert (=> d!52206 (= lt!245762 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4126 (buf!3744 lt!245617)) (currentByte!6871 lt!245617))) ((_ sign_extend 24) lt!245760))))))

(assert (=> d!52206 (= lt!245760 ((_ extract 7 0) (currentBit!6866 lt!245617)))))

(declare-fun e!106225 () Bool)

(assert (=> d!52206 e!106225))

(declare-fun res!131201 () Bool)

(assert (=> d!52206 (=> (not res!131201) (not e!106225))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!52206 (= res!131201 (validate_offset_bits!1 ((_ sign_extend 32) (size!3261 (buf!3744 lt!245617))) ((_ sign_extend 32) (currentByte!6871 lt!245617)) ((_ sign_extend 32) (currentBit!6866 lt!245617)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!14124 0))(
  ( (tuple2!14125 (_1!7508 Unit!10162) (_2!7508 (_ BitVec 8))) )
))
(declare-fun Unit!10168 () Unit!10162)

(declare-fun Unit!10169 () Unit!10162)

(assert (=> d!52206 (= (readByte!0 lt!245617) (tuple2!14117 (_2!7508 (ite (bvsgt ((_ sign_extend 24) lt!245760) #b00000000000000000000000000000000) (tuple2!14125 Unit!10168 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!245762) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4126 (buf!3744 lt!245617)) (bvadd (currentByte!6871 lt!245617) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!245760)))))))) (tuple2!14125 Unit!10169 lt!245762))) (BitStream!5741 (buf!3744 lt!245617) (bvadd (currentByte!6871 lt!245617) #b00000000000000000000000000000001) (currentBit!6866 lt!245617))))))

(declare-fun b!156977 () Bool)

(declare-fun e!106224 () Bool)

(assert (=> b!156977 (= e!106225 e!106224)))

(declare-fun res!131200 () Bool)

(assert (=> b!156977 (=> (not res!131200) (not e!106224))))

(declare-fun lt!245761 () tuple2!14116)

(assert (=> b!156977 (= res!131200 (= (buf!3744 (_2!7502 lt!245761)) (buf!3744 lt!245617)))))

(declare-fun lt!245764 () (_ BitVec 8))

(declare-fun lt!245759 () (_ BitVec 8))

(declare-fun Unit!10170 () Unit!10162)

(declare-fun Unit!10171 () Unit!10162)

(assert (=> b!156977 (= lt!245761 (tuple2!14117 (_2!7508 (ite (bvsgt ((_ sign_extend 24) lt!245759) #b00000000000000000000000000000000) (tuple2!14125 Unit!10170 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!245764) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4126 (buf!3744 lt!245617)) (bvadd (currentByte!6871 lt!245617) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!245759)))))))) (tuple2!14125 Unit!10171 lt!245764))) (BitStream!5741 (buf!3744 lt!245617) (bvadd (currentByte!6871 lt!245617) #b00000000000000000000000000000001) (currentBit!6866 lt!245617))))))

(assert (=> b!156977 (= lt!245764 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4126 (buf!3744 lt!245617)) (currentByte!6871 lt!245617))) ((_ sign_extend 24) lt!245759))))))

(assert (=> b!156977 (= lt!245759 ((_ extract 7 0) (currentBit!6866 lt!245617)))))

(declare-fun lt!245763 () (_ BitVec 64))

(declare-fun lt!245758 () (_ BitVec 64))

(declare-fun b!156978 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!156978 (= e!106224 (= (bitIndex!0 (size!3261 (buf!3744 (_2!7502 lt!245761))) (currentByte!6871 (_2!7502 lt!245761)) (currentBit!6866 (_2!7502 lt!245761))) (bvadd lt!245763 lt!245758)))))

(assert (=> b!156978 (or (not (= (bvand lt!245763 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!245758 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!245763 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!245763 lt!245758) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!156978 (= lt!245758 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!156978 (= lt!245763 (bitIndex!0 (size!3261 (buf!3744 lt!245617)) (currentByte!6871 lt!245617) (currentBit!6866 lt!245617)))))

(assert (= (and d!52206 res!131201) b!156977))

(assert (= (and b!156977 res!131200) b!156978))

(declare-fun m!244867 () Bool)

(assert (=> d!52206 m!244867))

(declare-fun m!244869 () Bool)

(assert (=> d!52206 m!244869))

(declare-fun m!244871 () Bool)

(assert (=> d!52206 m!244871))

(assert (=> b!156977 m!244871))

(assert (=> b!156977 m!244867))

(declare-fun m!244873 () Bool)

(assert (=> b!156978 m!244873))

(declare-fun m!244875 () Bool)

(assert (=> b!156978 m!244875))

(assert (=> d!52165 d!52206))

(declare-fun d!52208 () Bool)

(assert (=> d!52208 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3261 (buf!3744 lt!245617))) ((_ sign_extend 32) (currentByte!6871 lt!245617)) ((_ sign_extend 32) (currentBit!6866 lt!245617)) (bvsub (bvsub to!236 from!240) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!52208 true))

(declare-fun _$7!97 () Unit!10162)

(assert (=> d!52208 (= (choose!57 bs!65 lt!245617 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)) _$7!97)))

(declare-fun bs!12815 () Bool)

(assert (= bs!12815 d!52208))

(declare-fun m!244877 () Bool)

(assert (=> bs!12815 m!244877))

(assert (=> d!52160 d!52208))

(declare-fun d!52210 () Bool)

(assert (=> d!52210 (= (remainingBits!0 ((_ sign_extend 32) (size!3261 (buf!3744 bs!65))) ((_ sign_extend 32) (currentByte!6871 bs!65)) ((_ sign_extend 32) (currentBit!6866 bs!65))) (bvsub (bvmul ((_ sign_extend 32) (size!3261 (buf!3744 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6871 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6866 bs!65)))))))

(assert (=> d!52177 d!52210))

(declare-fun d!52212 () Bool)

(assert (=> d!52212 (= (remainingBits!0 ((_ sign_extend 32) (size!3261 (buf!3744 lt!245617))) lt!245607 lt!245611) (bvsub (bvmul ((_ sign_extend 32) (size!3261 (buf!3744 lt!245617))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul lt!245607 #b0000000000000000000000000000000000000000000000000000000000001000) lt!245611)))))

(assert (=> d!52154 d!52212))

(assert (=> d!52158 d!52212))

(declare-fun d!52214 () Bool)

(assert (=> d!52214 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3261 (buf!3744 lt!245617))) ((_ sign_extend 32) (currentByte!6871 lt!245617)) ((_ sign_extend 32) (currentBit!6866 lt!245617)) (bvsub (bvsub to!236 from!240) lt!245725)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) lt!245725)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3261 (buf!3744 lt!245617))) ((_ sign_extend 32) (currentByte!6871 lt!245617)) ((_ sign_extend 32) (currentBit!6866 lt!245617))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12816 () Bool)

(assert (= bs!12816 d!52214))

(declare-fun m!244879 () Bool)

(assert (=> bs!12816 m!244879))

(assert (=> b!156967 d!52214))

(assert (=> d!52144 d!52167))

(assert (=> d!52144 d!52142))

(declare-fun lt!245765 () tuple3!654)

(declare-fun d!52216 () Bool)

(assert (=> d!52216 (= lt!245765 (readByteArrayLoop!0 lt!245696 (array!7225 (store (arr!4126 lt!245608) (bvadd #b00000000000000000000000000000001 from!240) (_2!7497 (readBytePure!0 lt!245617))) (size!3261 lt!245608)) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> d!52216 (= (readByteArrayLoopPure!0 lt!245696 (array!7225 (store (arr!4126 lt!245608) (bvadd #b00000000000000000000000000000001 from!240) (_2!7497 (readBytePure!0 lt!245617))) (size!3261 lt!245608)) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236) (tuple2!14105 (_2!7504 lt!245765) (_3!444 lt!245765)))))

(declare-fun bs!12817 () Bool)

(assert (= bs!12817 d!52216))

(declare-fun m!244881 () Bool)

(assert (=> bs!12817 m!244881))

(assert (=> d!52144 d!52216))

(declare-fun d!52218 () Bool)

(assert (=> d!52218 (arrayRangesEq!431 (_2!7496 (readByteArrayLoopPure!0 lt!245617 lt!245608 (bvadd #b00000000000000000000000000000001 from!240) to!236)) (_2!7496 (readByteArrayLoopPure!0 (withMovedByteIndex!0 lt!245617 #b00000000000000000000000000000001) (array!7225 (store (arr!4126 lt!245608) (bvadd #b00000000000000000000000000000001 from!240) (_2!7497 (readBytePure!0 lt!245617))) (size!3261 lt!245608)) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236)) #b00000000000000000000000000000000 to!236)))

(assert (=> d!52218 true))

(declare-fun _$13!79 () Unit!10162)

(assert (=> d!52218 (= (choose!35 lt!245617 lt!245608 (bvadd #b00000000000000000000000000000001 from!240) to!236 lt!245695 (_2!7496 lt!245695) lt!245696 lt!245697 (_2!7496 lt!245697)) _$13!79)))

(declare-fun bs!12819 () Bool)

(assert (= bs!12819 d!52218))

(assert (=> bs!12819 m!244681))

(declare-fun m!244883 () Bool)

(assert (=> bs!12819 m!244883))

(assert (=> bs!12819 m!244681))

(assert (=> bs!12819 m!244707))

(assert (=> bs!12819 m!244697))

(declare-fun m!244885 () Bool)

(assert (=> bs!12819 m!244885))

(assert (=> bs!12819 m!244789))

(assert (=> d!52144 d!52218))

(assert (=> d!52144 d!52165))

(declare-fun d!52220 () Bool)

(declare-fun res!131202 () Bool)

(declare-fun e!106226 () Bool)

(assert (=> d!52220 (=> res!131202 e!106226)))

(assert (=> d!52220 (= res!131202 (= #b00000000000000000000000000000000 to!236))))

(assert (=> d!52220 (= (arrayRangesEq!431 (_2!7496 lt!245695) (_2!7496 lt!245697) #b00000000000000000000000000000000 to!236) e!106226)))

(declare-fun b!156979 () Bool)

(declare-fun e!106227 () Bool)

(assert (=> b!156979 (= e!106226 e!106227)))

(declare-fun res!131203 () Bool)

(assert (=> b!156979 (=> (not res!131203) (not e!106227))))

(assert (=> b!156979 (= res!131203 (= (select (arr!4126 (_2!7496 lt!245695)) #b00000000000000000000000000000000) (select (arr!4126 (_2!7496 lt!245697)) #b00000000000000000000000000000000)))))

(declare-fun b!156980 () Bool)

(assert (=> b!156980 (= e!106227 (arrayRangesEq!431 (_2!7496 lt!245695) (_2!7496 lt!245697) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236))))

(assert (= (and d!52220 (not res!131202)) b!156979))

(assert (= (and b!156979 res!131203) b!156980))

(declare-fun m!244887 () Bool)

(assert (=> b!156979 m!244887))

(declare-fun m!244889 () Bool)

(assert (=> b!156979 m!244889))

(declare-fun m!244891 () Bool)

(assert (=> b!156980 m!244891))

(assert (=> d!52144 d!52220))

(declare-fun b!156999 () Bool)

(declare-fun e!106242 () tuple3!654)

(declare-fun lt!245862 () Unit!10162)

(declare-fun lt!245885 () tuple3!654)

(assert (=> b!156999 (= e!106242 (tuple3!655 lt!245862 (_2!7504 lt!245885) (_3!444 lt!245885)))))

(declare-fun lt!245878 () tuple2!14116)

(assert (=> b!156999 (= lt!245878 (readByte!0 bs!65))))

(declare-fun lt!245874 () array!7224)

(assert (=> b!156999 (= lt!245874 (array!7225 (store (arr!4126 arr!153) from!240 (_1!7502 lt!245878)) (size!3261 arr!153)))))

(declare-fun lt!245865 () (_ BitVec 64))

(assert (=> b!156999 (= lt!245865 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!245883 () (_ BitVec 32))

(assert (=> b!156999 (= lt!245883 (bvsub to!236 from!240))))

(declare-fun lt!245887 () Unit!10162)

(assert (=> b!156999 (= lt!245887 (validateOffsetBytesFromBitIndexLemma!0 bs!65 (_2!7502 lt!245878) lt!245865 lt!245883))))

(assert (=> b!156999 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3261 (buf!3744 (_2!7502 lt!245878)))) ((_ sign_extend 32) (currentByte!6871 (_2!7502 lt!245878))) ((_ sign_extend 32) (currentBit!6866 (_2!7502 lt!245878))) (bvsub lt!245883 ((_ extract 31 0) (bvsdiv (bvadd lt!245865 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!245860 () Unit!10162)

(assert (=> b!156999 (= lt!245860 lt!245887)))

(assert (=> b!156999 (= lt!245885 (readByteArrayLoop!0 (_2!7502 lt!245878) lt!245874 (bvadd from!240 #b00000000000000000000000000000001) to!236))))

(declare-fun call!2463 () (_ BitVec 64))

(assert (=> b!156999 (= (bitIndex!0 (size!3261 (buf!3744 (_2!7502 lt!245878))) (currentByte!6871 (_2!7502 lt!245878)) (currentBit!6866 (_2!7502 lt!245878))) (bvadd call!2463 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!245881 () Unit!10162)

(declare-fun Unit!10172 () Unit!10162)

(assert (=> b!156999 (= lt!245881 Unit!10172)))

(assert (=> b!156999 (= (bvadd (bitIndex!0 (size!3261 (buf!3744 (_2!7502 lt!245878))) (currentByte!6871 (_2!7502 lt!245878)) (currentBit!6866 (_2!7502 lt!245878))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3261 (buf!3744 (_2!7504 lt!245885))) (currentByte!6871 (_2!7504 lt!245885)) (currentBit!6866 (_2!7504 lt!245885))))))

(declare-fun lt!245875 () Unit!10162)

(declare-fun Unit!10173 () Unit!10162)

(assert (=> b!156999 (= lt!245875 Unit!10173)))

(assert (=> b!156999 (= (bvadd call!2463 (bvmul ((_ sign_extend 32) (bvsub to!236 from!240)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3261 (buf!3744 (_2!7504 lt!245885))) (currentByte!6871 (_2!7504 lt!245885)) (currentBit!6866 (_2!7504 lt!245885))))))

(declare-fun lt!245869 () Unit!10162)

(declare-fun Unit!10174 () Unit!10162)

(assert (=> b!156999 (= lt!245869 Unit!10174)))

(assert (=> b!156999 (and (= (buf!3744 bs!65) (buf!3744 (_2!7504 lt!245885))) (= (size!3261 arr!153) (size!3261 (_3!444 lt!245885))))))

(declare-fun lt!245890 () Unit!10162)

(declare-fun Unit!10175 () Unit!10162)

(assert (=> b!156999 (= lt!245890 Unit!10175)))

(declare-fun lt!245867 () Unit!10162)

(declare-fun arrayUpdatedAtPrefixLemma!39 (array!7224 (_ BitVec 32) (_ BitVec 8)) Unit!10162)

(assert (=> b!156999 (= lt!245867 (arrayUpdatedAtPrefixLemma!39 arr!153 from!240 (_1!7502 lt!245878)))))

(declare-fun call!2465 () Bool)

(assert (=> b!156999 call!2465))

(declare-fun lt!245889 () Unit!10162)

(assert (=> b!156999 (= lt!245889 lt!245867)))

(declare-fun lt!245866 () (_ BitVec 32))

(assert (=> b!156999 (= lt!245866 #b00000000000000000000000000000000)))

(declare-fun lt!245859 () Unit!10162)

(declare-fun arrayRangesEqTransitive!104 (array!7224 array!7224 array!7224 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10162)

(assert (=> b!156999 (= lt!245859 (arrayRangesEqTransitive!104 arr!153 lt!245874 (_3!444 lt!245885) lt!245866 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!156999 (arrayRangesEq!431 arr!153 (_3!444 lt!245885) lt!245866 from!240)))

(declare-fun lt!245882 () Unit!10162)

(assert (=> b!156999 (= lt!245882 lt!245859)))

(declare-fun call!2464 () Bool)

(assert (=> b!156999 call!2464))

(declare-fun lt!245868 () Unit!10162)

(declare-fun Unit!10176 () Unit!10162)

(assert (=> b!156999 (= lt!245868 Unit!10176)))

(declare-fun lt!245894 () Unit!10162)

(declare-fun arrayRangesEqImpliesEq!48 (array!7224 array!7224 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10162)

(assert (=> b!156999 (= lt!245894 (arrayRangesEqImpliesEq!48 lt!245874 (_3!444 lt!245885) #b00000000000000000000000000000000 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!156999 (= (select (store (arr!4126 arr!153) from!240 (_1!7502 lt!245878)) from!240) (select (arr!4126 (_3!444 lt!245885)) from!240))))

(declare-fun lt!245886 () Unit!10162)

(assert (=> b!156999 (= lt!245886 lt!245894)))

(declare-fun lt!245863 () Bool)

(assert (=> b!156999 (= lt!245863 (= (select (arr!4126 (_3!444 lt!245885)) from!240) (_1!7502 lt!245878)))))

(declare-fun Unit!10177 () Unit!10162)

(assert (=> b!156999 (= lt!245862 Unit!10177)))

(assert (=> b!156999 lt!245863))

(declare-fun b!157000 () Bool)

(declare-fun e!106244 () Bool)

(declare-fun lt!245892 () tuple3!654)

(assert (=> b!157000 (= e!106244 (= (select (arr!4126 (_3!444 lt!245892)) from!240) (_2!7497 (readBytePure!0 bs!65))))))

(assert (=> b!157000 (and (bvsge from!240 #b00000000000000000000000000000000) (bvslt from!240 (size!3261 (_3!444 lt!245892))))))

(declare-fun d!52222 () Bool)

(assert (=> d!52222 e!106244))

(declare-fun res!131219 () Bool)

(assert (=> d!52222 (=> res!131219 e!106244)))

(assert (=> d!52222 (= res!131219 (bvsge from!240 to!236))))

(declare-fun lt!245871 () Bool)

(declare-fun e!106243 () Bool)

(assert (=> d!52222 (= lt!245871 e!106243)))

(declare-fun res!131221 () Bool)

(assert (=> d!52222 (=> (not res!131221) (not e!106243))))

(declare-fun lt!245880 () (_ BitVec 64))

(declare-fun lt!245876 () (_ BitVec 64))

(assert (=> d!52222 (= res!131221 (= (bvadd lt!245876 lt!245880) (bitIndex!0 (size!3261 (buf!3744 (_2!7504 lt!245892))) (currentByte!6871 (_2!7504 lt!245892)) (currentBit!6866 (_2!7504 lt!245892)))))))

(assert (=> d!52222 (or (not (= (bvand lt!245876 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!245880 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!245876 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!245876 lt!245880) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!245872 () (_ BitVec 64))

(assert (=> d!52222 (= lt!245880 (bvmul lt!245872 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!52222 (or (= lt!245872 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!245872 #b0000000000000000000000000000000000000000000000000000000000001000) lt!245872)))))

(assert (=> d!52222 (= lt!245872 ((_ sign_extend 32) (bvsub to!236 from!240)))))

(assert (=> d!52222 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand from!240 #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000)))))

(assert (=> d!52222 (= lt!245876 (bitIndex!0 (size!3261 (buf!3744 bs!65)) (currentByte!6871 bs!65) (currentBit!6866 bs!65)))))

(assert (=> d!52222 (= lt!245892 e!106242)))

(declare-fun c!8343 () Bool)

(assert (=> d!52222 (= c!8343 (bvslt from!240 to!236))))

(assert (=> d!52222 (and (bvsle #b00000000000000000000000000000000 from!240) (bvsle from!240 to!236) (bvsle to!236 (size!3261 arr!153)))))

(assert (=> d!52222 (= (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236) lt!245892)))

(declare-fun bm!2460 () Bool)

(assert (=> bm!2460 (= call!2463 (bitIndex!0 (size!3261 (buf!3744 bs!65)) (currentByte!6871 bs!65) (currentBit!6866 bs!65)))))

(declare-fun lt!245870 () Unit!10162)

(declare-fun b!157001 () Bool)

(assert (=> b!157001 (= e!106242 (tuple3!655 lt!245870 bs!65 arr!153))))

(assert (=> b!157001 (= call!2463 call!2463)))

(declare-fun lt!245888 () Unit!10162)

(declare-fun Unit!10178 () Unit!10162)

(assert (=> b!157001 (= lt!245888 Unit!10178)))

(declare-fun lt!245873 () Unit!10162)

(declare-fun arrayRangesEqReflexiveLemma!39 (array!7224) Unit!10162)

(assert (=> b!157001 (= lt!245873 (arrayRangesEqReflexiveLemma!39 arr!153))))

(assert (=> b!157001 call!2465))

(declare-fun lt!245864 () Unit!10162)

(assert (=> b!157001 (= lt!245864 lt!245873)))

(declare-fun lt!245879 () array!7224)

(assert (=> b!157001 (= lt!245879 arr!153)))

(declare-fun lt!245884 () array!7224)

(assert (=> b!157001 (= lt!245884 arr!153)))

(declare-fun lt!245877 () (_ BitVec 32))

(assert (=> b!157001 (= lt!245877 #b00000000000000000000000000000000)))

(declare-fun lt!245861 () (_ BitVec 32))

(assert (=> b!157001 (= lt!245861 (size!3261 arr!153))))

(declare-fun lt!245893 () (_ BitVec 32))

(assert (=> b!157001 (= lt!245893 #b00000000000000000000000000000000)))

(declare-fun lt!245891 () (_ BitVec 32))

(assert (=> b!157001 (= lt!245891 from!240)))

(declare-fun arrayRangesEqSlicedLemma!39 (array!7224 array!7224 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10162)

(assert (=> b!157001 (= lt!245870 (arrayRangesEqSlicedLemma!39 lt!245879 lt!245884 lt!245877 lt!245861 lt!245893 lt!245891))))

(assert (=> b!157001 call!2464))

(declare-fun bm!2461 () Bool)

(assert (=> bm!2461 (= call!2464 (arrayRangesEq!431 (ite c!8343 arr!153 lt!245879) (ite c!8343 (_3!444 lt!245885) lt!245884) (ite c!8343 #b00000000000000000000000000000000 lt!245893) (ite c!8343 from!240 lt!245891)))))

(declare-fun b!157002 () Bool)

(assert (=> b!157002 (= e!106243 (arrayRangesEq!431 arr!153 (_3!444 lt!245892) #b00000000000000000000000000000000 from!240))))

(declare-fun b!157003 () Bool)

(declare-fun res!131220 () Bool)

(assert (=> b!157003 (=> (not res!131220) (not e!106243))))

(assert (=> b!157003 (= res!131220 (and (= (buf!3744 bs!65) (buf!3744 (_2!7504 lt!245892))) (= (size!3261 arr!153) (size!3261 (_3!444 lt!245892)))))))

(declare-fun bm!2462 () Bool)

(assert (=> bm!2462 (= call!2465 (arrayRangesEq!431 arr!153 (ite c!8343 (array!7225 (store (arr!4126 arr!153) from!240 (_1!7502 lt!245878)) (size!3261 arr!153)) arr!153) #b00000000000000000000000000000000 (ite c!8343 from!240 (size!3261 arr!153))))))

(assert (= (and d!52222 c!8343) b!156999))

(assert (= (and d!52222 (not c!8343)) b!157001))

(assert (= (or b!156999 b!157001) bm!2461))

(assert (= (or b!156999 b!157001) bm!2462))

(assert (= (or b!156999 b!157001) bm!2460))

(assert (= (and d!52222 res!131221) b!157003))

(assert (= (and b!157003 res!131220) b!157002))

(assert (= (and d!52222 (not res!131219)) b!157000))

(declare-fun m!244909 () Bool)

(assert (=> b!157000 m!244909))

(assert (=> b!157000 m!244687))

(declare-fun m!244911 () Bool)

(assert (=> bm!2461 m!244911))

(declare-fun m!244913 () Bool)

(assert (=> b!157002 m!244913))

(declare-fun m!244915 () Bool)

(assert (=> b!156999 m!244915))

(declare-fun m!244917 () Bool)

(assert (=> b!156999 m!244917))

(declare-fun m!244919 () Bool)

(assert (=> b!156999 m!244919))

(declare-fun m!244921 () Bool)

(assert (=> b!156999 m!244921))

(declare-fun m!244923 () Bool)

(assert (=> b!156999 m!244923))

(declare-fun m!244925 () Bool)

(assert (=> b!156999 m!244925))

(declare-fun m!244927 () Bool)

(assert (=> b!156999 m!244927))

(declare-fun m!244929 () Bool)

(assert (=> b!156999 m!244929))

(declare-fun m!244931 () Bool)

(assert (=> b!156999 m!244931))

(declare-fun m!244933 () Bool)

(assert (=> b!156999 m!244933))

(assert (=> b!156999 m!244785))

(declare-fun m!244935 () Bool)

(assert (=> b!156999 m!244935))

(declare-fun m!244937 () Bool)

(assert (=> b!156999 m!244937))

(declare-fun m!244939 () Bool)

(assert (=> b!157001 m!244939))

(declare-fun m!244941 () Bool)

(assert (=> b!157001 m!244941))

(assert (=> bm!2462 m!244919))

(declare-fun m!244943 () Bool)

(assert (=> bm!2462 m!244943))

(declare-fun m!244945 () Bool)

(assert (=> d!52222 m!244945))

(declare-fun m!244947 () Bool)

(assert (=> d!52222 m!244947))

(assert (=> bm!2460 m!244947))

(assert (=> d!52171 d!52222))

(declare-fun d!52232 () Bool)

(declare-fun e!106247 () Bool)

(assert (=> d!52232 e!106247))

(declare-fun res!131224 () Bool)

(assert (=> d!52232 (=> (not res!131224) (not e!106247))))

(declare-fun moveByteIndexPrecond!0 (BitStream!5740 (_ BitVec 32)) Bool)

(assert (=> d!52232 (= res!131224 (moveByteIndexPrecond!0 lt!245617 #b00000000000000000000000000000001))))

(declare-fun Unit!10179 () Unit!10162)

(assert (=> d!52232 (= (moveByteIndex!0 lt!245617 #b00000000000000000000000000000001) (tuple2!14119 Unit!10179 (BitStream!5741 (buf!3744 lt!245617) (bvadd (currentByte!6871 lt!245617) #b00000000000000000000000000000001) (currentBit!6866 lt!245617))))))

(declare-fun b!157006 () Bool)

(assert (=> b!157006 (= e!106247 (and (or (not (= (bvand (currentByte!6871 lt!245617) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6871 lt!245617) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6871 lt!245617) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6871 lt!245617) #b00000000000000000000000000000001) (bvadd (currentByte!6871 lt!245617) #b00000000000000000000000000000001))))))

(assert (= (and d!52232 res!131224) b!157006))

(declare-fun m!244949 () Bool)

(assert (=> d!52232 m!244949))

(assert (=> d!52142 d!52232))

(declare-fun b!157007 () Bool)

(declare-fun e!106248 () tuple3!654)

(declare-fun lt!245898 () Unit!10162)

(declare-fun lt!245921 () tuple3!654)

(assert (=> b!157007 (= e!106248 (tuple3!655 lt!245898 (_2!7504 lt!245921) (_3!444 lt!245921)))))

(declare-fun lt!245914 () tuple2!14116)

(assert (=> b!157007 (= lt!245914 (readByte!0 lt!245617))))

(declare-fun lt!245910 () array!7224)

(assert (=> b!157007 (= lt!245910 (array!7225 (store (arr!4126 lt!245608) (bvadd #b00000000000000000000000000000001 from!240) (_1!7502 lt!245914)) (size!3261 lt!245608)))))

(declare-fun lt!245901 () (_ BitVec 64))

(assert (=> b!157007 (= lt!245901 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!245919 () (_ BitVec 32))

(assert (=> b!157007 (= lt!245919 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!245923 () Unit!10162)

(assert (=> b!157007 (= lt!245923 (validateOffsetBytesFromBitIndexLemma!0 lt!245617 (_2!7502 lt!245914) lt!245901 lt!245919))))

(assert (=> b!157007 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3261 (buf!3744 (_2!7502 lt!245914)))) ((_ sign_extend 32) (currentByte!6871 (_2!7502 lt!245914))) ((_ sign_extend 32) (currentBit!6866 (_2!7502 lt!245914))) (bvsub lt!245919 ((_ extract 31 0) (bvsdiv (bvadd lt!245901 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!245896 () Unit!10162)

(assert (=> b!157007 (= lt!245896 lt!245923)))

(assert (=> b!157007 (= lt!245921 (readByteArrayLoop!0 (_2!7502 lt!245914) lt!245910 (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(declare-fun call!2466 () (_ BitVec 64))

(assert (=> b!157007 (= (bitIndex!0 (size!3261 (buf!3744 (_2!7502 lt!245914))) (currentByte!6871 (_2!7502 lt!245914)) (currentBit!6866 (_2!7502 lt!245914))) (bvadd call!2466 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!245917 () Unit!10162)

(declare-fun Unit!10180 () Unit!10162)

(assert (=> b!157007 (= lt!245917 Unit!10180)))

(assert (=> b!157007 (= (bvadd (bitIndex!0 (size!3261 (buf!3744 (_2!7502 lt!245914))) (currentByte!6871 (_2!7502 lt!245914)) (currentBit!6866 (_2!7502 lt!245914))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3261 (buf!3744 (_2!7504 lt!245921))) (currentByte!6871 (_2!7504 lt!245921)) (currentBit!6866 (_2!7504 lt!245921))))))

(declare-fun lt!245911 () Unit!10162)

(declare-fun Unit!10181 () Unit!10162)

(assert (=> b!157007 (= lt!245911 Unit!10181)))

(assert (=> b!157007 (= (bvadd call!2466 (bvmul ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3261 (buf!3744 (_2!7504 lt!245921))) (currentByte!6871 (_2!7504 lt!245921)) (currentBit!6866 (_2!7504 lt!245921))))))

(declare-fun lt!245905 () Unit!10162)

(declare-fun Unit!10182 () Unit!10162)

(assert (=> b!157007 (= lt!245905 Unit!10182)))

(assert (=> b!157007 (and (= (buf!3744 lt!245617) (buf!3744 (_2!7504 lt!245921))) (= (size!3261 lt!245608) (size!3261 (_3!444 lt!245921))))))

(declare-fun lt!245926 () Unit!10162)

(declare-fun Unit!10183 () Unit!10162)

(assert (=> b!157007 (= lt!245926 Unit!10183)))

(declare-fun lt!245903 () Unit!10162)

(assert (=> b!157007 (= lt!245903 (arrayUpdatedAtPrefixLemma!39 lt!245608 (bvadd #b00000000000000000000000000000001 from!240) (_1!7502 lt!245914)))))

(declare-fun call!2468 () Bool)

(assert (=> b!157007 call!2468))

(declare-fun lt!245925 () Unit!10162)

(assert (=> b!157007 (= lt!245925 lt!245903)))

(declare-fun lt!245902 () (_ BitVec 32))

(assert (=> b!157007 (= lt!245902 #b00000000000000000000000000000000)))

(declare-fun lt!245895 () Unit!10162)

(assert (=> b!157007 (= lt!245895 (arrayRangesEqTransitive!104 lt!245608 lt!245910 (_3!444 lt!245921) lt!245902 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157007 (arrayRangesEq!431 lt!245608 (_3!444 lt!245921) lt!245902 (bvadd #b00000000000000000000000000000001 from!240))))

(declare-fun lt!245918 () Unit!10162)

(assert (=> b!157007 (= lt!245918 lt!245895)))

(declare-fun call!2467 () Bool)

(assert (=> b!157007 call!2467))

(declare-fun lt!245904 () Unit!10162)

(declare-fun Unit!10184 () Unit!10162)

(assert (=> b!157007 (= lt!245904 Unit!10184)))

(declare-fun lt!245930 () Unit!10162)

(assert (=> b!157007 (= lt!245930 (arrayRangesEqImpliesEq!48 lt!245910 (_3!444 lt!245921) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157007 (= (select (store (arr!4126 lt!245608) (bvadd #b00000000000000000000000000000001 from!240) (_1!7502 lt!245914)) (bvadd #b00000000000000000000000000000001 from!240)) (select (arr!4126 (_3!444 lt!245921)) (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!245922 () Unit!10162)

(assert (=> b!157007 (= lt!245922 lt!245930)))

(declare-fun lt!245899 () Bool)

(assert (=> b!157007 (= lt!245899 (= (select (arr!4126 (_3!444 lt!245921)) (bvadd #b00000000000000000000000000000001 from!240)) (_1!7502 lt!245914)))))

(declare-fun Unit!10185 () Unit!10162)

(assert (=> b!157007 (= lt!245898 Unit!10185)))

(assert (=> b!157007 lt!245899))

(declare-fun b!157008 () Bool)

(declare-fun e!106250 () Bool)

(declare-fun lt!245928 () tuple3!654)

(assert (=> b!157008 (= e!106250 (= (select (arr!4126 (_3!444 lt!245928)) (bvadd #b00000000000000000000000000000001 from!240)) (_2!7497 (readBytePure!0 lt!245617))))))

(assert (=> b!157008 (and (bvsge (bvadd #b00000000000000000000000000000001 from!240) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!240) (size!3261 (_3!444 lt!245928))))))

(declare-fun d!52234 () Bool)

(assert (=> d!52234 e!106250))

(declare-fun res!131225 () Bool)

(assert (=> d!52234 (=> res!131225 e!106250)))

(assert (=> d!52234 (= res!131225 (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!245907 () Bool)

(declare-fun e!106249 () Bool)

(assert (=> d!52234 (= lt!245907 e!106249)))

(declare-fun res!131227 () Bool)

(assert (=> d!52234 (=> (not res!131227) (not e!106249))))

(declare-fun lt!245916 () (_ BitVec 64))

(declare-fun lt!245912 () (_ BitVec 64))

(assert (=> d!52234 (= res!131227 (= (bvadd lt!245912 lt!245916) (bitIndex!0 (size!3261 (buf!3744 (_2!7504 lt!245928))) (currentByte!6871 (_2!7504 lt!245928)) (currentBit!6866 (_2!7504 lt!245928)))))))

(assert (=> d!52234 (or (not (= (bvand lt!245912 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!245916 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!245912 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!245912 lt!245916) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!245908 () (_ BitVec 64))

(assert (=> d!52234 (= lt!245916 (bvmul lt!245908 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!52234 (or (= lt!245908 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!245908 #b0000000000000000000000000000000000000000000000000000000000001000) lt!245908)))))

(assert (=> d!52234 (= lt!245908 ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))))))

(assert (=> d!52234 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!240) #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b10000000000000000000000000000000)))))

(assert (=> d!52234 (= lt!245912 (bitIndex!0 (size!3261 (buf!3744 lt!245617)) (currentByte!6871 lt!245617) (currentBit!6866 lt!245617)))))

(assert (=> d!52234 (= lt!245928 e!106248)))

(declare-fun c!8344 () Bool)

(assert (=> d!52234 (= c!8344 (bvslt (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52234 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsle (bvadd #b00000000000000000000000000000001 from!240) to!236) (bvsle to!236 (size!3261 lt!245608)))))

(assert (=> d!52234 (= (readByteArrayLoop!0 lt!245617 lt!245608 (bvadd #b00000000000000000000000000000001 from!240) to!236) lt!245928)))

(declare-fun bm!2463 () Bool)

(assert (=> bm!2463 (= call!2466 (bitIndex!0 (size!3261 (buf!3744 lt!245617)) (currentByte!6871 lt!245617) (currentBit!6866 lt!245617)))))

(declare-fun b!157009 () Bool)

(declare-fun lt!245906 () Unit!10162)

(assert (=> b!157009 (= e!106248 (tuple3!655 lt!245906 lt!245617 lt!245608))))

(assert (=> b!157009 (= call!2466 call!2466)))

(declare-fun lt!245924 () Unit!10162)

(declare-fun Unit!10190 () Unit!10162)

(assert (=> b!157009 (= lt!245924 Unit!10190)))

(declare-fun lt!245909 () Unit!10162)

(assert (=> b!157009 (= lt!245909 (arrayRangesEqReflexiveLemma!39 lt!245608))))

(assert (=> b!157009 call!2468))

(declare-fun lt!245900 () Unit!10162)

(assert (=> b!157009 (= lt!245900 lt!245909)))

(declare-fun lt!245915 () array!7224)

(assert (=> b!157009 (= lt!245915 lt!245608)))

(declare-fun lt!245920 () array!7224)

(assert (=> b!157009 (= lt!245920 lt!245608)))

(declare-fun lt!245913 () (_ BitVec 32))

(assert (=> b!157009 (= lt!245913 #b00000000000000000000000000000000)))

(declare-fun lt!245897 () (_ BitVec 32))

(assert (=> b!157009 (= lt!245897 (size!3261 lt!245608))))

(declare-fun lt!245929 () (_ BitVec 32))

(assert (=> b!157009 (= lt!245929 #b00000000000000000000000000000000)))

(declare-fun lt!245927 () (_ BitVec 32))

(assert (=> b!157009 (= lt!245927 (bvadd #b00000000000000000000000000000001 from!240))))

(assert (=> b!157009 (= lt!245906 (arrayRangesEqSlicedLemma!39 lt!245915 lt!245920 lt!245913 lt!245897 lt!245929 lt!245927))))

(assert (=> b!157009 call!2467))

(declare-fun bm!2464 () Bool)

(assert (=> bm!2464 (= call!2467 (arrayRangesEq!431 (ite c!8344 lt!245608 lt!245915) (ite c!8344 (_3!444 lt!245921) lt!245920) (ite c!8344 #b00000000000000000000000000000000 lt!245929) (ite c!8344 (bvadd #b00000000000000000000000000000001 from!240) lt!245927)))))

(declare-fun b!157010 () Bool)

(assert (=> b!157010 (= e!106249 (arrayRangesEq!431 lt!245608 (_3!444 lt!245928) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun b!157011 () Bool)

(declare-fun res!131226 () Bool)

(assert (=> b!157011 (=> (not res!131226) (not e!106249))))

(assert (=> b!157011 (= res!131226 (and (= (buf!3744 lt!245617) (buf!3744 (_2!7504 lt!245928))) (= (size!3261 lt!245608) (size!3261 (_3!444 lt!245928)))))))

(declare-fun bm!2465 () Bool)

(assert (=> bm!2465 (= call!2468 (arrayRangesEq!431 lt!245608 (ite c!8344 (array!7225 (store (arr!4126 lt!245608) (bvadd #b00000000000000000000000000000001 from!240) (_1!7502 lt!245914)) (size!3261 lt!245608)) lt!245608) #b00000000000000000000000000000000 (ite c!8344 (bvadd #b00000000000000000000000000000001 from!240) (size!3261 lt!245608))))))

(assert (= (and d!52234 c!8344) b!157007))

(assert (= (and d!52234 (not c!8344)) b!157009))

(assert (= (or b!157007 b!157009) bm!2464))

(assert (= (or b!157007 b!157009) bm!2465))

(assert (= (or b!157007 b!157009) bm!2463))

(assert (= (and d!52234 res!131227) b!157011))

(assert (= (and b!157011 res!131226) b!157010))

(assert (= (and d!52234 (not res!131225)) b!157008))

(declare-fun m!244953 () Bool)

(assert (=> b!157008 m!244953))

(assert (=> b!157008 m!244707))

(declare-fun m!244955 () Bool)

(assert (=> bm!2464 m!244955))

(declare-fun m!244957 () Bool)

(assert (=> b!157010 m!244957))

(declare-fun m!244959 () Bool)

(assert (=> b!157007 m!244959))

(declare-fun m!244961 () Bool)

(assert (=> b!157007 m!244961))

(declare-fun m!244963 () Bool)

(assert (=> b!157007 m!244963))

(declare-fun m!244965 () Bool)

(assert (=> b!157007 m!244965))

(declare-fun m!244967 () Bool)

(assert (=> b!157007 m!244967))

(declare-fun m!244969 () Bool)

(assert (=> b!157007 m!244969))

(declare-fun m!244971 () Bool)

(assert (=> b!157007 m!244971))

(declare-fun m!244973 () Bool)

(assert (=> b!157007 m!244973))

(declare-fun m!244975 () Bool)

(assert (=> b!157007 m!244975))

(declare-fun m!244977 () Bool)

(assert (=> b!157007 m!244977))

(assert (=> b!157007 m!244827))

(declare-fun m!244979 () Bool)

(assert (=> b!157007 m!244979))

(declare-fun m!244981 () Bool)

(assert (=> b!157007 m!244981))

(declare-fun m!244983 () Bool)

(assert (=> b!157009 m!244983))

(declare-fun m!244985 () Bool)

(assert (=> b!157009 m!244985))

(assert (=> bm!2465 m!244963))

(declare-fun m!244987 () Bool)

(assert (=> bm!2465 m!244987))

(declare-fun m!244989 () Bool)

(assert (=> d!52234 m!244989))

(assert (=> d!52234 m!244875))

(assert (=> bm!2463 m!244875))

(assert (=> d!52167 d!52234))

(declare-fun d!52238 () Bool)

(declare-fun lt!245938 () (_ BitVec 8))

(declare-fun lt!245936 () (_ BitVec 8))

(assert (=> d!52238 (= lt!245938 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4126 (buf!3744 bs!65)) (currentByte!6871 bs!65))) ((_ sign_extend 24) lt!245936))))))

(assert (=> d!52238 (= lt!245936 ((_ extract 7 0) (currentBit!6866 bs!65)))))

(declare-fun e!106252 () Bool)

(assert (=> d!52238 e!106252))

(declare-fun res!131229 () Bool)

(assert (=> d!52238 (=> (not res!131229) (not e!106252))))

(assert (=> d!52238 (= res!131229 (validate_offset_bits!1 ((_ sign_extend 32) (size!3261 (buf!3744 bs!65))) ((_ sign_extend 32) (currentByte!6871 bs!65)) ((_ sign_extend 32) (currentBit!6866 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!10191 () Unit!10162)

(declare-fun Unit!10192 () Unit!10162)

(assert (=> d!52238 (= (readByte!0 bs!65) (tuple2!14117 (_2!7508 (ite (bvsgt ((_ sign_extend 24) lt!245936) #b00000000000000000000000000000000) (tuple2!14125 Unit!10191 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!245938) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4126 (buf!3744 bs!65)) (bvadd (currentByte!6871 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!245936)))))))) (tuple2!14125 Unit!10192 lt!245938))) (BitStream!5741 (buf!3744 bs!65) (bvadd (currentByte!6871 bs!65) #b00000000000000000000000000000001) (currentBit!6866 bs!65))))))

(declare-fun b!157012 () Bool)

(declare-fun e!106251 () Bool)

(assert (=> b!157012 (= e!106252 e!106251)))

(declare-fun res!131228 () Bool)

(assert (=> b!157012 (=> (not res!131228) (not e!106251))))

(declare-fun lt!245937 () tuple2!14116)

(assert (=> b!157012 (= res!131228 (= (buf!3744 (_2!7502 lt!245937)) (buf!3744 bs!65)))))

(declare-fun lt!245935 () (_ BitVec 8))

(declare-fun lt!245940 () (_ BitVec 8))

(declare-fun Unit!10193 () Unit!10162)

(declare-fun Unit!10194 () Unit!10162)

(assert (=> b!157012 (= lt!245937 (tuple2!14117 (_2!7508 (ite (bvsgt ((_ sign_extend 24) lt!245935) #b00000000000000000000000000000000) (tuple2!14125 Unit!10193 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!245940) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4126 (buf!3744 bs!65)) (bvadd (currentByte!6871 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!245935)))))))) (tuple2!14125 Unit!10194 lt!245940))) (BitStream!5741 (buf!3744 bs!65) (bvadd (currentByte!6871 bs!65) #b00000000000000000000000000000001) (currentBit!6866 bs!65))))))

(assert (=> b!157012 (= lt!245940 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4126 (buf!3744 bs!65)) (currentByte!6871 bs!65))) ((_ sign_extend 24) lt!245935))))))

(assert (=> b!157012 (= lt!245935 ((_ extract 7 0) (currentBit!6866 bs!65)))))

(declare-fun lt!245939 () (_ BitVec 64))

(declare-fun b!157013 () Bool)

(declare-fun lt!245934 () (_ BitVec 64))

(assert (=> b!157013 (= e!106251 (= (bitIndex!0 (size!3261 (buf!3744 (_2!7502 lt!245937))) (currentByte!6871 (_2!7502 lt!245937)) (currentBit!6866 (_2!7502 lt!245937))) (bvadd lt!245939 lt!245934)))))

(assert (=> b!157013 (or (not (= (bvand lt!245939 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!245934 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!245939 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!245939 lt!245934) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!157013 (= lt!245934 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!157013 (= lt!245939 (bitIndex!0 (size!3261 (buf!3744 bs!65)) (currentByte!6871 bs!65) (currentBit!6866 bs!65)))))

(assert (= (and d!52238 res!131229) b!157012))

(assert (= (and b!157012 res!131228) b!157013))

(declare-fun m!244991 () Bool)

(assert (=> d!52238 m!244991))

(declare-fun m!244993 () Bool)

(assert (=> d!52238 m!244993))

(declare-fun m!244995 () Bool)

(assert (=> d!52238 m!244995))

(assert (=> b!157012 m!244995))

(assert (=> b!157012 m!244991))

(declare-fun m!244997 () Bool)

(assert (=> b!157013 m!244997))

(assert (=> b!157013 m!244947))

(assert (=> d!52140 d!52238))

(declare-fun b!157014 () Bool)

(declare-fun e!106253 () tuple3!654)

(declare-fun lt!245946 () Unit!10162)

(declare-fun lt!245969 () tuple3!654)

(assert (=> b!157014 (= e!106253 (tuple3!655 lt!245946 (_2!7504 lt!245969) (_3!444 lt!245969)))))

(declare-fun lt!245962 () tuple2!14116)

(assert (=> b!157014 (= lt!245962 (readByte!0 (withMovedByteIndex!0 lt!245617 #b00000000000000000000000000000001)))))

(declare-fun lt!245958 () array!7224)

(assert (=> b!157014 (= lt!245958 (array!7225 (store (arr!4126 (array!7225 (store (store (arr!4126 arr!153) from!240 (_2!7497 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7497 lt!245610)) (size!3261 arr!153))) (bvadd #b00000000000000000000000000000010 from!240) (_1!7502 lt!245962)) (size!3261 (array!7225 (store (store (arr!4126 arr!153) from!240 (_2!7497 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7497 lt!245610)) (size!3261 arr!153)))))))

(declare-fun lt!245949 () (_ BitVec 64))

(assert (=> b!157014 (= lt!245949 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!245967 () (_ BitVec 32))

(assert (=> b!157014 (= lt!245967 (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240)))))

(declare-fun lt!245971 () Unit!10162)

(assert (=> b!157014 (= lt!245971 (validateOffsetBytesFromBitIndexLemma!0 (withMovedByteIndex!0 lt!245617 #b00000000000000000000000000000001) (_2!7502 lt!245962) lt!245949 lt!245967))))

(assert (=> b!157014 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3261 (buf!3744 (_2!7502 lt!245962)))) ((_ sign_extend 32) (currentByte!6871 (_2!7502 lt!245962))) ((_ sign_extend 32) (currentBit!6866 (_2!7502 lt!245962))) (bvsub lt!245967 ((_ extract 31 0) (bvsdiv (bvadd lt!245949 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!245944 () Unit!10162)

(assert (=> b!157014 (= lt!245944 lt!245971)))

(assert (=> b!157014 (= lt!245969 (readByteArrayLoop!0 (_2!7502 lt!245962) lt!245958 (bvadd #b00000000000000000000000000000010 from!240 #b00000000000000000000000000000001) to!236))))

(declare-fun call!2469 () (_ BitVec 64))

(assert (=> b!157014 (= (bitIndex!0 (size!3261 (buf!3744 (_2!7502 lt!245962))) (currentByte!6871 (_2!7502 lt!245962)) (currentBit!6866 (_2!7502 lt!245962))) (bvadd call!2469 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!245965 () Unit!10162)

(declare-fun Unit!10199 () Unit!10162)

(assert (=> b!157014 (= lt!245965 Unit!10199)))

(assert (=> b!157014 (= (bvadd (bitIndex!0 (size!3261 (buf!3744 (_2!7502 lt!245962))) (currentByte!6871 (_2!7502 lt!245962)) (currentBit!6866 (_2!7502 lt!245962))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3261 (buf!3744 (_2!7504 lt!245969))) (currentByte!6871 (_2!7504 lt!245969)) (currentBit!6866 (_2!7504 lt!245969))))))

(declare-fun lt!245959 () Unit!10162)

(declare-fun Unit!10200 () Unit!10162)

(assert (=> b!157014 (= lt!245959 Unit!10200)))

(assert (=> b!157014 (= (bvadd call!2469 (bvmul ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3261 (buf!3744 (_2!7504 lt!245969))) (currentByte!6871 (_2!7504 lt!245969)) (currentBit!6866 (_2!7504 lt!245969))))))

(declare-fun lt!245953 () Unit!10162)

(declare-fun Unit!10201 () Unit!10162)

(assert (=> b!157014 (= lt!245953 Unit!10201)))

(assert (=> b!157014 (and (= (buf!3744 (withMovedByteIndex!0 lt!245617 #b00000000000000000000000000000001)) (buf!3744 (_2!7504 lt!245969))) (= (size!3261 (array!7225 (store (store (arr!4126 arr!153) from!240 (_2!7497 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7497 lt!245610)) (size!3261 arr!153))) (size!3261 (_3!444 lt!245969))))))

(declare-fun lt!245974 () Unit!10162)

(declare-fun Unit!10203 () Unit!10162)

(assert (=> b!157014 (= lt!245974 Unit!10203)))

(declare-fun lt!245951 () Unit!10162)

(assert (=> b!157014 (= lt!245951 (arrayUpdatedAtPrefixLemma!39 (array!7225 (store (store (arr!4126 arr!153) from!240 (_2!7497 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7497 lt!245610)) (size!3261 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) (_1!7502 lt!245962)))))

(declare-fun call!2471 () Bool)

(assert (=> b!157014 call!2471))

(declare-fun lt!245973 () Unit!10162)

(assert (=> b!157014 (= lt!245973 lt!245951)))

(declare-fun lt!245950 () (_ BitVec 32))

(assert (=> b!157014 (= lt!245950 #b00000000000000000000000000000000)))

(declare-fun lt!245943 () Unit!10162)

(assert (=> b!157014 (= lt!245943 (arrayRangesEqTransitive!104 (array!7225 (store (store (arr!4126 arr!153) from!240 (_2!7497 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7497 lt!245610)) (size!3261 arr!153)) lt!245958 (_3!444 lt!245969) lt!245950 (bvadd #b00000000000000000000000000000010 from!240) (bvadd #b00000000000000000000000000000010 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157014 (arrayRangesEq!431 (array!7225 (store (store (arr!4126 arr!153) from!240 (_2!7497 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7497 lt!245610)) (size!3261 arr!153)) (_3!444 lt!245969) lt!245950 (bvadd #b00000000000000000000000000000010 from!240))))

(declare-fun lt!245966 () Unit!10162)

(assert (=> b!157014 (= lt!245966 lt!245943)))

(declare-fun call!2470 () Bool)

(assert (=> b!157014 call!2470))

(declare-fun lt!245952 () Unit!10162)

(declare-fun Unit!10205 () Unit!10162)

(assert (=> b!157014 (= lt!245952 Unit!10205)))

(declare-fun lt!245978 () Unit!10162)

(assert (=> b!157014 (= lt!245978 (arrayRangesEqImpliesEq!48 lt!245958 (_3!444 lt!245969) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000010 from!240) (bvadd #b00000000000000000000000000000010 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157014 (= (select (store (arr!4126 (array!7225 (store (store (arr!4126 arr!153) from!240 (_2!7497 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7497 lt!245610)) (size!3261 arr!153))) (bvadd #b00000000000000000000000000000010 from!240) (_1!7502 lt!245962)) (bvadd #b00000000000000000000000000000010 from!240)) (select (arr!4126 (_3!444 lt!245969)) (bvadd #b00000000000000000000000000000010 from!240)))))

(declare-fun lt!245970 () Unit!10162)

(assert (=> b!157014 (= lt!245970 lt!245978)))

(declare-fun lt!245947 () Bool)

(assert (=> b!157014 (= lt!245947 (= (select (arr!4126 (_3!444 lt!245969)) (bvadd #b00000000000000000000000000000010 from!240)) (_1!7502 lt!245962)))))

(declare-fun Unit!10207 () Unit!10162)

(assert (=> b!157014 (= lt!245946 Unit!10207)))

(assert (=> b!157014 lt!245947))

(declare-fun lt!245976 () tuple3!654)

(declare-fun b!157015 () Bool)

(declare-fun e!106255 () Bool)

(assert (=> b!157015 (= e!106255 (= (select (arr!4126 (_3!444 lt!245976)) (bvadd #b00000000000000000000000000000010 from!240)) (_2!7497 (readBytePure!0 (withMovedByteIndex!0 lt!245617 #b00000000000000000000000000000001)))))))

(assert (=> b!157015 (and (bvsge (bvadd #b00000000000000000000000000000010 from!240) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000010 from!240) (size!3261 (_3!444 lt!245976))))))

(declare-fun d!52240 () Bool)

(assert (=> d!52240 e!106255))

(declare-fun res!131230 () Bool)

(assert (=> d!52240 (=> res!131230 e!106255)))

(assert (=> d!52240 (= res!131230 (bvsge (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(declare-fun lt!245955 () Bool)

(declare-fun e!106254 () Bool)

(assert (=> d!52240 (= lt!245955 e!106254)))

(declare-fun res!131232 () Bool)

(assert (=> d!52240 (=> (not res!131232) (not e!106254))))

(declare-fun lt!245964 () (_ BitVec 64))

(declare-fun lt!245960 () (_ BitVec 64))

(assert (=> d!52240 (= res!131232 (= (bvadd lt!245960 lt!245964) (bitIndex!0 (size!3261 (buf!3744 (_2!7504 lt!245976))) (currentByte!6871 (_2!7504 lt!245976)) (currentBit!6866 (_2!7504 lt!245976)))))))

(assert (=> d!52240 (or (not (= (bvand lt!245960 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!245964 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!245960 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!245960 lt!245964) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!245956 () (_ BitVec 64))

(assert (=> d!52240 (= lt!245964 (bvmul lt!245956 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!52240 (or (= lt!245956 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!245956 #b0000000000000000000000000000000000000000000000000000000000001000) lt!245956)))))

(assert (=> d!52240 (= lt!245956 ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240))))))

(assert (=> d!52240 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000010 from!240) #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240)) #b10000000000000000000000000000000)))))

(assert (=> d!52240 (= lt!245960 (bitIndex!0 (size!3261 (buf!3744 (withMovedByteIndex!0 lt!245617 #b00000000000000000000000000000001))) (currentByte!6871 (withMovedByteIndex!0 lt!245617 #b00000000000000000000000000000001)) (currentBit!6866 (withMovedByteIndex!0 lt!245617 #b00000000000000000000000000000001))))))

(assert (=> d!52240 (= lt!245976 e!106253)))

(declare-fun c!8345 () Bool)

(assert (=> d!52240 (= c!8345 (bvslt (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(assert (=> d!52240 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000010 from!240)) (bvsle (bvadd #b00000000000000000000000000000010 from!240) to!236) (bvsle to!236 (size!3261 (array!7225 (store (store (arr!4126 arr!153) from!240 (_2!7497 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7497 lt!245610)) (size!3261 arr!153)))))))

(assert (=> d!52240 (= (readByteArrayLoop!0 (withMovedByteIndex!0 lt!245617 #b00000000000000000000000000000001) (array!7225 (store (store (arr!4126 arr!153) from!240 (_2!7497 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7497 lt!245610)) (size!3261 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236) lt!245976)))

(declare-fun bm!2466 () Bool)

(assert (=> bm!2466 (= call!2469 (bitIndex!0 (size!3261 (buf!3744 (withMovedByteIndex!0 lt!245617 #b00000000000000000000000000000001))) (currentByte!6871 (withMovedByteIndex!0 lt!245617 #b00000000000000000000000000000001)) (currentBit!6866 (withMovedByteIndex!0 lt!245617 #b00000000000000000000000000000001))))))

(declare-fun b!157016 () Bool)

(declare-fun lt!245954 () Unit!10162)

(assert (=> b!157016 (= e!106253 (tuple3!655 lt!245954 (withMovedByteIndex!0 lt!245617 #b00000000000000000000000000000001) (array!7225 (store (store (arr!4126 arr!153) from!240 (_2!7497 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7497 lt!245610)) (size!3261 arr!153))))))

(assert (=> b!157016 (= call!2469 call!2469)))

(declare-fun lt!245972 () Unit!10162)

(declare-fun Unit!10208 () Unit!10162)

(assert (=> b!157016 (= lt!245972 Unit!10208)))

(declare-fun lt!245957 () Unit!10162)

(assert (=> b!157016 (= lt!245957 (arrayRangesEqReflexiveLemma!39 (array!7225 (store (store (arr!4126 arr!153) from!240 (_2!7497 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7497 lt!245610)) (size!3261 arr!153))))))

(assert (=> b!157016 call!2471))

(declare-fun lt!245948 () Unit!10162)

(assert (=> b!157016 (= lt!245948 lt!245957)))

(declare-fun lt!245963 () array!7224)

(assert (=> b!157016 (= lt!245963 (array!7225 (store (store (arr!4126 arr!153) from!240 (_2!7497 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7497 lt!245610)) (size!3261 arr!153)))))

(declare-fun lt!245968 () array!7224)

(assert (=> b!157016 (= lt!245968 (array!7225 (store (store (arr!4126 arr!153) from!240 (_2!7497 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7497 lt!245610)) (size!3261 arr!153)))))

(declare-fun lt!245961 () (_ BitVec 32))

(assert (=> b!157016 (= lt!245961 #b00000000000000000000000000000000)))

(declare-fun lt!245945 () (_ BitVec 32))

(assert (=> b!157016 (= lt!245945 (size!3261 (array!7225 (store (store (arr!4126 arr!153) from!240 (_2!7497 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7497 lt!245610)) (size!3261 arr!153))))))

(declare-fun lt!245977 () (_ BitVec 32))

(assert (=> b!157016 (= lt!245977 #b00000000000000000000000000000000)))

(declare-fun lt!245975 () (_ BitVec 32))

(assert (=> b!157016 (= lt!245975 (bvadd #b00000000000000000000000000000010 from!240))))

(assert (=> b!157016 (= lt!245954 (arrayRangesEqSlicedLemma!39 lt!245963 lt!245968 lt!245961 lt!245945 lt!245977 lt!245975))))

(assert (=> b!157016 call!2470))

(declare-fun bm!2467 () Bool)

(assert (=> bm!2467 (= call!2470 (arrayRangesEq!431 (ite c!8345 (array!7225 (store (store (arr!4126 arr!153) from!240 (_2!7497 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7497 lt!245610)) (size!3261 arr!153)) lt!245963) (ite c!8345 (_3!444 lt!245969) lt!245968) (ite c!8345 #b00000000000000000000000000000000 lt!245977) (ite c!8345 (bvadd #b00000000000000000000000000000010 from!240) lt!245975)))))

(declare-fun b!157017 () Bool)

(assert (=> b!157017 (= e!106254 (arrayRangesEq!431 (array!7225 (store (store (arr!4126 arr!153) from!240 (_2!7497 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7497 lt!245610)) (size!3261 arr!153)) (_3!444 lt!245976) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000010 from!240)))))

(declare-fun b!157018 () Bool)

(declare-fun res!131231 () Bool)

(assert (=> b!157018 (=> (not res!131231) (not e!106254))))

(assert (=> b!157018 (= res!131231 (and (= (buf!3744 (withMovedByteIndex!0 lt!245617 #b00000000000000000000000000000001)) (buf!3744 (_2!7504 lt!245976))) (= (size!3261 (array!7225 (store (store (arr!4126 arr!153) from!240 (_2!7497 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7497 lt!245610)) (size!3261 arr!153))) (size!3261 (_3!444 lt!245976)))))))

(declare-fun bm!2468 () Bool)

(assert (=> bm!2468 (= call!2471 (arrayRangesEq!431 (array!7225 (store (store (arr!4126 arr!153) from!240 (_2!7497 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7497 lt!245610)) (size!3261 arr!153)) (ite c!8345 (array!7225 (store (arr!4126 (array!7225 (store (store (arr!4126 arr!153) from!240 (_2!7497 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7497 lt!245610)) (size!3261 arr!153))) (bvadd #b00000000000000000000000000000010 from!240) (_1!7502 lt!245962)) (size!3261 (array!7225 (store (store (arr!4126 arr!153) from!240 (_2!7497 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7497 lt!245610)) (size!3261 arr!153)))) (array!7225 (store (store (arr!4126 arr!153) from!240 (_2!7497 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7497 lt!245610)) (size!3261 arr!153))) #b00000000000000000000000000000000 (ite c!8345 (bvadd #b00000000000000000000000000000010 from!240) (size!3261 (array!7225 (store (store (arr!4126 arr!153) from!240 (_2!7497 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7497 lt!245610)) (size!3261 arr!153))))))))

(assert (= (and d!52240 c!8345) b!157014))

(assert (= (and d!52240 (not c!8345)) b!157016))

(assert (= (or b!157014 b!157016) bm!2467))

(assert (= (or b!157014 b!157016) bm!2468))

(assert (= (or b!157014 b!157016) bm!2466))

(assert (= (and d!52240 res!131232) b!157018))

(assert (= (and b!157018 res!131231) b!157017))

(assert (= (and d!52240 (not res!131230)) b!157015))

(declare-fun m!245003 () Bool)

(assert (=> b!157015 m!245003))

(assert (=> b!157015 m!244681))

(declare-fun m!245005 () Bool)

(assert (=> b!157015 m!245005))

(declare-fun m!245009 () Bool)

(assert (=> bm!2467 m!245009))

(declare-fun m!245011 () Bool)

(assert (=> b!157017 m!245011))

(declare-fun m!245013 () Bool)

(assert (=> b!157014 m!245013))

(declare-fun m!245015 () Bool)

(assert (=> b!157014 m!245015))

(declare-fun m!245017 () Bool)

(assert (=> b!157014 m!245017))

(declare-fun m!245019 () Bool)

(assert (=> b!157014 m!245019))

(declare-fun m!245021 () Bool)

(assert (=> b!157014 m!245021))

(declare-fun m!245023 () Bool)

(assert (=> b!157014 m!245023))

(declare-fun m!245025 () Bool)

(assert (=> b!157014 m!245025))

(declare-fun m!245027 () Bool)

(assert (=> b!157014 m!245027))

(declare-fun m!245029 () Bool)

(assert (=> b!157014 m!245029))

(assert (=> b!157014 m!244681))

(declare-fun m!245031 () Bool)

(assert (=> b!157014 m!245031))

(assert (=> b!157014 m!244681))

(declare-fun m!245033 () Bool)

(assert (=> b!157014 m!245033))

(declare-fun m!245035 () Bool)

(assert (=> b!157014 m!245035))

(declare-fun m!245037 () Bool)

(assert (=> b!157014 m!245037))

(declare-fun m!245039 () Bool)

(assert (=> b!157016 m!245039))

(declare-fun m!245041 () Bool)

(assert (=> b!157016 m!245041))

(assert (=> bm!2468 m!245017))

(declare-fun m!245043 () Bool)

(assert (=> bm!2468 m!245043))

(declare-fun m!245045 () Bool)

(assert (=> d!52240 m!245045))

(declare-fun m!245047 () Bool)

(assert (=> d!52240 m!245047))

(assert (=> bm!2466 m!245047))

(assert (=> d!52146 d!52240))

(declare-fun d!52250 () Bool)

(declare-fun e!106256 () Bool)

(assert (=> d!52250 e!106256))

(declare-fun res!131233 () Bool)

(assert (=> d!52250 (=> (not res!131233) (not e!106256))))

(assert (=> d!52250 (= res!131233 (moveByteIndexPrecond!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun Unit!10209 () Unit!10162)

(assert (=> d!52250 (= (moveByteIndex!0 bs!65 #b00000000000000000000000000000001) (tuple2!14119 Unit!10209 (BitStream!5741 (buf!3744 bs!65) (bvadd (currentByte!6871 bs!65) #b00000000000000000000000000000001) (currentBit!6866 bs!65))))))

(declare-fun b!157019 () Bool)

(assert (=> b!157019 (= e!106256 (and (or (not (= (bvand (currentByte!6871 bs!65) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6871 bs!65) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6871 bs!65) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6871 bs!65) #b00000000000000000000000000000001) (bvadd (currentByte!6871 bs!65) #b00000000000000000000000000000001))))))

(assert (= (and d!52250 res!131233) b!157019))

(declare-fun m!245049 () Bool)

(assert (=> d!52250 m!245049))

(assert (=> d!52169 d!52250))

(declare-fun d!52252 () Bool)

(assert (=> d!52252 (= (invariant!0 (currentBit!6866 bs!65) (currentByte!6871 bs!65) (size!3261 (buf!3744 bs!65))) (and (bvsge (currentBit!6866 bs!65) #b00000000000000000000000000000000) (bvslt (currentBit!6866 bs!65) #b00000000000000000000000000001000) (bvsge (currentByte!6871 bs!65) #b00000000000000000000000000000000) (or (bvslt (currentByte!6871 bs!65) (size!3261 (buf!3744 bs!65))) (and (= (currentBit!6866 bs!65) #b00000000000000000000000000000000) (= (currentByte!6871 bs!65) (size!3261 (buf!3744 bs!65)))))))))

(assert (=> d!52175 d!52252))

(push 1)

(assert (not b!157009))

(assert (not b!156972))

(assert (not d!52208))

(assert (not b!157000))

(assert (not bm!2462))

(assert (not d!52238))

(assert (not b!157002))

(assert (not d!52218))

(assert (not d!52216))

(assert (not bm!2465))

(assert (not b!156980))

(assert (not bm!2461))

(assert (not d!52250))

(assert (not d!52222))

(assert (not b!157015))

(assert (not b!157007))

(assert (not d!52206))

(assert (not b!157017))

(assert (not b!157013))

(assert (not d!52234))

(assert (not b!157008))

(assert (not d!52214))

(assert (not bm!2463))

(assert (not bm!2466))

(assert (not bm!2460))

(assert (not b!157010))

(assert (not bm!2467))

(assert (not bm!2468))

(assert (not b!157016))

(assert (not b!157001))

(assert (not d!52240))

(assert (not bm!2464))

(assert (not b!156978))

(assert (not d!52232))

(assert (not b!156999))

(assert (not b!157014))

(check-sat)

(pop 1)

(push 1)

(check-sat)

