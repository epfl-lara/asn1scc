; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33550 () Bool)

(assert start!33550)

(declare-fun b!161052 () Bool)

(declare-fun e!110752 () Bool)

(declare-datatypes ((array!7931 0))(
  ( (array!7932 (arr!4483 (Array (_ BitVec 32) (_ BitVec 8))) (size!3562 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6292 0))(
  ( (BitStream!6293 (buf!4020 array!7931) (currentByte!7483 (_ BitVec 32)) (currentBit!7478 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6292)

(declare-fun array_inv!3309 (array!7931) Bool)

(assert (=> b!161052 (= e!110752 (array_inv!3309 (buf!4020 thiss!1602)))))

(declare-fun b!161050 () Bool)

(declare-fun e!110751 () Bool)

(declare-fun lt!253607 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161050 (= e!110751 (byteRangesEq!0 (select (arr!4483 (buf!4020 thiss!1602)) (currentByte!7483 thiss!1602)) lt!253607 #b00000000000000000000000000000000 (currentBit!7478 thiss!1602)))))

(declare-fun res!134230 () Bool)

(declare-fun e!110754 () Bool)

(assert (=> start!33550 (=> (not res!134230) (not e!110754))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33550 (= res!134230 (validate_offset_byte!0 ((_ sign_extend 32) (size!3562 (buf!4020 thiss!1602))) ((_ sign_extend 32) (currentByte!7483 thiss!1602)) ((_ sign_extend 32) (currentBit!7478 thiss!1602))))))

(assert (=> start!33550 e!110754))

(declare-fun inv!12 (BitStream!6292) Bool)

(assert (=> start!33550 (and (inv!12 thiss!1602) e!110752)))

(assert (=> start!33550 true))

(declare-fun b!161051 () Bool)

(declare-fun e!110750 () Bool)

(declare-fun lt!253601 () (_ BitVec 32))

(declare-datatypes ((Unit!11018 0))(
  ( (Unit!11019) )
))
(declare-datatypes ((tuple3!852 0))(
  ( (tuple3!853 (_1!7777 Unit!11018) (_2!7777 (_ BitVec 8)) (_3!543 BitStream!6292)) )
))
(declare-fun lt!253602 () tuple3!852)

(assert (=> b!161051 (= e!110750 (or (bvsle lt!253601 #b00000000000000000000000000000000) (and (bvsge (currentByte!7483 (_3!543 lt!253602)) #b00000000000000000000000000000000) (bvslt (currentByte!7483 (_3!543 lt!253602)) (size!3562 (buf!4020 (_3!543 lt!253602)))))))))

(declare-fun b!161049 () Bool)

(assert (=> b!161049 (= e!110754 (not e!110750))))

(declare-fun res!134231 () Bool)

(assert (=> b!161049 (=> res!134231 e!110750)))

(declare-fun lt!253606 () array!7931)

(declare-fun arrayRangesEq!514 (array!7931 array!7931 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161049 (= res!134231 (not (arrayRangesEq!514 (buf!4020 thiss!1602) lt!253606 #b00000000000000000000000000000000 (bvsub (currentByte!7483 (_3!543 lt!253602)) #b00000000000000000000000000000001))))))

(declare-fun lt!253599 () (_ BitVec 8))

(assert (=> b!161049 (arrayRangesEq!514 (buf!4020 thiss!1602) (array!7932 (store (arr!4483 (buf!4020 thiss!1602)) (bvsub (currentByte!7483 (_3!543 lt!253602)) #b00000000000000000000000000000001) lt!253599) (size!3562 (buf!4020 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7483 (_3!543 lt!253602)) #b00000000000000000000000000000001))))

(declare-fun lt!253608 () Unit!11018)

(declare-fun arrayUpdatedAtPrefixLemma!122 (array!7931 (_ BitVec 32) (_ BitVec 8)) Unit!11018)

(assert (=> b!161049 (= lt!253608 (arrayUpdatedAtPrefixLemma!122 (buf!4020 thiss!1602) (bvsub (currentByte!7483 (_3!543 lt!253602)) #b00000000000000000000000000000001) lt!253599))))

(assert (=> b!161049 (= lt!253599 (select (arr!4483 (buf!4020 (_3!543 lt!253602))) (bvsub (currentByte!7483 (_3!543 lt!253602)) #b00000000000000000000000000000001)))))

(declare-fun lt!253600 () (_ BitVec 8))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!253605 () (_ BitVec 32))

(declare-fun lt!253603 () (_ BitVec 8))

(declare-fun lt!253604 () (_ BitVec 32))

(declare-fun Unit!11020 () Unit!11018)

(declare-fun Unit!11021 () Unit!11018)

(assert (=> b!161049 (= lt!253602 (ite (bvsgt lt!253601 #b00000000000000000000000000000000) (let ((bdg!9585 ((_ extract 7 0) (bvnot lt!253605)))) (let ((bdg!9586 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4483 (buf!4020 thiss!1602)) (currentByte!7483 thiss!1602) lt!253603) (currentByte!7483 thiss!1602) lt!253607) (bvadd #b00000000000000000000000000000001 (currentByte!7483 thiss!1602)))) ((_ sign_extend 24) bdg!9585))))) (tuple3!853 Unit!11020 bdg!9585 (BitStream!6293 (array!7932 (store (arr!4483 (array!7932 (store (arr!4483 lt!253606) (bvadd #b00000000000000000000000000000001 (currentByte!7483 thiss!1602)) bdg!9586) (size!3562 lt!253606))) (bvadd #b00000000000000000000000000000001 (currentByte!7483 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9586) (bvshl ((_ sign_extend 24) v!222) lt!253604)))) (size!3562 (array!7932 (store (arr!4483 lt!253606) (bvadd #b00000000000000000000000000000001 (currentByte!7483 thiss!1602)) bdg!9586) (size!3562 lt!253606)))) (bvadd #b00000000000000000000000000000001 (currentByte!7483 thiss!1602)) (currentBit!7478 thiss!1602))))) (tuple3!853 Unit!11021 lt!253600 (BitStream!6293 lt!253606 (bvadd #b00000000000000000000000000000001 (currentByte!7483 thiss!1602)) (currentBit!7478 thiss!1602)))))))

(assert (=> b!161049 e!110751))

(declare-fun res!134229 () Bool)

(assert (=> b!161049 (=> res!134229 e!110751)))

(assert (=> b!161049 (= res!134229 (bvsge (currentByte!7483 thiss!1602) (size!3562 (buf!4020 thiss!1602))))))

(assert (=> b!161049 (= lt!253606 (array!7932 (store (store (arr!4483 (buf!4020 thiss!1602)) (currentByte!7483 thiss!1602) lt!253603) (currentByte!7483 thiss!1602) lt!253607) (size!3562 (buf!4020 thiss!1602))))))

(assert (=> b!161049 (= lt!253607 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253603) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253601))))))

(assert (=> b!161049 (= lt!253603 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4483 (buf!4020 thiss!1602)) (currentByte!7483 thiss!1602))) lt!253605)))))

(assert (=> b!161049 (= lt!253605 ((_ sign_extend 24) lt!253600))))

(assert (=> b!161049 (= lt!253600 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!253604)))))))

(assert (=> b!161049 (= lt!253604 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253601))))))

(assert (=> b!161049 (= lt!253601 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7478 thiss!1602))))))

(assert (= (and start!33550 res!134230) b!161049))

(assert (= (and b!161049 (not res!134229)) b!161050))

(assert (= (and b!161049 (not res!134231)) b!161051))

(assert (= start!33550 b!161052))

(declare-fun m!254731 () Bool)

(assert (=> b!161052 m!254731))

(declare-fun m!254733 () Bool)

(assert (=> b!161050 m!254733))

(assert (=> b!161050 m!254733))

(declare-fun m!254735 () Bool)

(assert (=> b!161050 m!254735))

(declare-fun m!254737 () Bool)

(assert (=> start!33550 m!254737))

(declare-fun m!254739 () Bool)

(assert (=> start!33550 m!254739))

(declare-fun m!254741 () Bool)

(assert (=> b!161049 m!254741))

(declare-fun m!254743 () Bool)

(assert (=> b!161049 m!254743))

(declare-fun m!254745 () Bool)

(assert (=> b!161049 m!254745))

(declare-fun m!254747 () Bool)

(assert (=> b!161049 m!254747))

(declare-fun m!254749 () Bool)

(assert (=> b!161049 m!254749))

(assert (=> b!161049 m!254733))

(declare-fun m!254751 () Bool)

(assert (=> b!161049 m!254751))

(declare-fun m!254753 () Bool)

(assert (=> b!161049 m!254753))

(declare-fun m!254755 () Bool)

(assert (=> b!161049 m!254755))

(declare-fun m!254757 () Bool)

(assert (=> b!161049 m!254757))

(declare-fun m!254759 () Bool)

(assert (=> b!161049 m!254759))

(declare-fun m!254761 () Bool)

(assert (=> b!161049 m!254761))

(push 1)

(assert (not start!33550))

(assert (not b!161050))

(assert (not b!161052))

(assert (not b!161049))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54957 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54957 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3562 (buf!4020 thiss!1602))) ((_ sign_extend 32) (currentByte!7483 thiss!1602)) ((_ sign_extend 32) (currentBit!7478 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3562 (buf!4020 thiss!1602))) ((_ sign_extend 32) (currentByte!7483 thiss!1602)) ((_ sign_extend 32) (currentBit!7478 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13684 () Bool)

(assert (= bs!13684 d!54957))

(declare-fun m!254827 () Bool)

(assert (=> bs!13684 m!254827))

(assert (=> start!33550 d!54957))

(declare-fun d!54959 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54959 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7478 thiss!1602) (currentByte!7483 thiss!1602) (size!3562 (buf!4020 thiss!1602))))))

(declare-fun bs!13685 () Bool)

(assert (= bs!13685 d!54959))

(declare-fun m!254829 () Bool)

(assert (=> bs!13685 m!254829))

(assert (=> start!33550 d!54959))

(declare-fun d!54961 () Bool)

(assert (=> d!54961 (= (byteRangesEq!0 (select (arr!4483 (buf!4020 thiss!1602)) (currentByte!7483 thiss!1602)) lt!253607 #b00000000000000000000000000000000 (currentBit!7478 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7478 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4483 (buf!4020 thiss!1602)) (currentByte!7483 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7478 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!253607) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7478 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13686 () Bool)

(assert (= bs!13686 d!54961))

(declare-fun m!254831 () Bool)

(assert (=> bs!13686 m!254831))

(declare-fun m!254833 () Bool)

(assert (=> bs!13686 m!254833))

(assert (=> b!161050 d!54961))

(declare-fun d!54963 () Bool)

(assert (=> d!54963 (= (array_inv!3309 (buf!4020 thiss!1602)) (bvsge (size!3562 (buf!4020 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!161052 d!54963))

(declare-fun d!54965 () Bool)

(declare-fun res!134254 () Bool)

(declare-fun e!110789 () Bool)

(assert (=> d!54965 (=> res!134254 e!110789)))

(assert (=> d!54965 (= res!134254 (= #b00000000000000000000000000000000 (bvsub (currentByte!7483 (_3!543 lt!253602)) #b00000000000000000000000000000001)))))

(assert (=> d!54965 (= (arrayRangesEq!514 (buf!4020 thiss!1602) lt!253606 #b00000000000000000000000000000000 (bvsub (currentByte!7483 (_3!543 lt!253602)) #b00000000000000000000000000000001)) e!110789)))

(declare-fun b!161081 () Bool)

(declare-fun e!110790 () Bool)

(assert (=> b!161081 (= e!110789 e!110790)))

(declare-fun res!134255 () Bool)

(assert (=> b!161081 (=> (not res!134255) (not e!110790))))

(assert (=> b!161081 (= res!134255 (= (select (arr!4483 (buf!4020 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4483 lt!253606) #b00000000000000000000000000000000)))))

(declare-fun b!161082 () Bool)

(assert (=> b!161082 (= e!110790 (arrayRangesEq!514 (buf!4020 thiss!1602) lt!253606 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7483 (_3!543 lt!253602)) #b00000000000000000000000000000001)))))

(assert (= (and d!54965 (not res!134254)) b!161081))

(assert (= (and b!161081 res!134255) b!161082))

(declare-fun m!254835 () Bool)

(assert (=> b!161081 m!254835))

(declare-fun m!254837 () Bool)

(assert (=> b!161081 m!254837))

(declare-fun m!254839 () Bool)

(assert (=> b!161082 m!254839))

(assert (=> b!161049 d!54965))

(declare-fun d!54967 () Bool)

(declare-fun res!134256 () Bool)

(declare-fun e!110791 () Bool)

(assert (=> d!54967 (=> res!134256 e!110791)))

(assert (=> d!54967 (= res!134256 (= #b00000000000000000000000000000000 (bvsub (currentByte!7483 (_3!543 lt!253602)) #b00000000000000000000000000000001)))))

(assert (=> d!54967 (= (arrayRangesEq!514 (buf!4020 thiss!1602) (array!7932 (store (arr!4483 (buf!4020 thiss!1602)) (bvsub (currentByte!7483 (_3!543 lt!253602)) #b00000000000000000000000000000001) lt!253599) (size!3562 (buf!4020 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7483 (_3!543 lt!253602)) #b00000000000000000000000000000001)) e!110791)))

(declare-fun b!161083 () Bool)

(declare-fun e!110792 () Bool)

(assert (=> b!161083 (= e!110791 e!110792)))

(declare-fun res!134257 () Bool)

(assert (=> b!161083 (=> (not res!134257) (not e!110792))))

(assert (=> b!161083 (= res!134257 (= (select (arr!4483 (buf!4020 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4483 (array!7932 (store (arr!4483 (buf!4020 thiss!1602)) (bvsub (currentByte!7483 (_3!543 lt!253602)) #b00000000000000000000000000000001) lt!253599) (size!3562 (buf!4020 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161084 () Bool)

(assert (=> b!161084 (= e!110792 (arrayRangesEq!514 (buf!4020 thiss!1602) (array!7932 (store (arr!4483 (buf!4020 thiss!1602)) (bvsub (currentByte!7483 (_3!543 lt!253602)) #b00000000000000000000000000000001) lt!253599) (size!3562 (buf!4020 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7483 (_3!543 lt!253602)) #b00000000000000000000000000000001)))))

(assert (= (and d!54967 (not res!134256)) b!161083))

(assert (= (and b!161083 res!134257) b!161084))

(assert (=> b!161083 m!254835))

(declare-fun m!254841 () Bool)

(assert (=> b!161083 m!254841))

(declare-fun m!254843 () Bool)

(assert (=> b!161084 m!254843))

(assert (=> b!161049 d!54967))

(declare-fun d!54969 () Bool)

(declare-fun e!110795 () Bool)

(assert (=> d!54969 e!110795))

(declare-fun res!134260 () Bool)

(assert (=> d!54969 (=> (not res!134260) (not e!110795))))

(assert (=> d!54969 (= res!134260 (and (bvsge (bvsub (currentByte!7483 (_3!543 lt!253602)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7483 (_3!543 lt!253602)) #b00000000000000000000000000000001) (size!3562 (buf!4020 thiss!1602)))))))

(declare-fun lt!253671 () Unit!11018)

(declare-fun choose!153 (array!7931 (_ BitVec 32) (_ BitVec 8)) Unit!11018)

(assert (=> d!54969 (= lt!253671 (choose!153 (buf!4020 thiss!1602) (bvsub (currentByte!7483 (_3!543 lt!253602)) #b00000000000000000000000000000001) lt!253599))))

(assert (=> d!54969 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7483 (_3!543 lt!253602)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7483 (_3!543 lt!253602)) #b00000000000000000000000000000001) (size!3562 (buf!4020 thiss!1602))))))

(assert (=> d!54969 (= (arrayUpdatedAtPrefixLemma!122 (buf!4020 thiss!1602) (bvsub (currentByte!7483 (_3!543 lt!253602)) #b00000000000000000000000000000001) lt!253599) lt!253671)))

(declare-fun b!161087 () Bool)

(assert (=> b!161087 (= e!110795 (arrayRangesEq!514 (buf!4020 thiss!1602) (array!7932 (store (arr!4483 (buf!4020 thiss!1602)) (bvsub (currentByte!7483 (_3!543 lt!253602)) #b00000000000000000000000000000001) lt!253599) (size!3562 (buf!4020 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7483 (_3!543 lt!253602)) #b00000000000000000000000000000001)))))

(assert (= (and d!54969 res!134260) b!161087))

(declare-fun m!254845 () Bool)

(assert (=> d!54969 m!254845))

(assert (=> b!161087 m!254745))

(assert (=> b!161087 m!254759))

(assert (=> b!161049 d!54969))

(push 1)

(assert (not d!54957))

(assert (not b!161087))

(assert (not b!161082))

(assert (not b!161084))

(assert (not d!54969))

(assert (not d!54959))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54999 () Bool)

(declare-fun res!134283 () Bool)

(declare-fun e!110818 () Bool)

(assert (=> d!54999 (=> res!134283 e!110818)))

(assert (=> d!54999 (= res!134283 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7483 (_3!543 lt!253602)) #b00000000000000000000000000000001)))))

(assert (=> d!54999 (= (arrayRangesEq!514 (buf!4020 thiss!1602) lt!253606 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7483 (_3!543 lt!253602)) #b00000000000000000000000000000001)) e!110818)))

(declare-fun b!161110 () Bool)

(declare-fun e!110819 () Bool)

(assert (=> b!161110 (= e!110818 e!110819)))

(declare-fun res!134284 () Bool)

(assert (=> b!161110 (=> (not res!134284) (not e!110819))))

(assert (=> b!161110 (= res!134284 (= (select (arr!4483 (buf!4020 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4483 lt!253606) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!161111 () Bool)

(assert (=> b!161111 (= e!110819 (arrayRangesEq!514 (buf!4020 thiss!1602) lt!253606 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7483 (_3!543 lt!253602)) #b00000000000000000000000000000001)))))

(assert (= (and d!54999 (not res!134283)) b!161110))

(assert (= (and b!161110 res!134284) b!161111))

(declare-fun m!254887 () Bool)

(assert (=> b!161110 m!254887))

(declare-fun m!254889 () Bool)

(assert (=> b!161110 m!254889))

(declare-fun m!254891 () Bool)

(assert (=> b!161111 m!254891))

(assert (=> b!161082 d!54999))

(declare-fun d!55001 () Bool)

(assert (=> d!55001 (= (remainingBits!0 ((_ sign_extend 32) (size!3562 (buf!4020 thiss!1602))) ((_ sign_extend 32) (currentByte!7483 thiss!1602)) ((_ sign_extend 32) (currentBit!7478 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3562 (buf!4020 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7483 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7478 thiss!1602)))))))

(assert (=> d!54957 d!55001))

(declare-fun d!55003 () Bool)

(assert (=> d!55003 (= (invariant!0 (currentBit!7478 thiss!1602) (currentByte!7483 thiss!1602) (size!3562 (buf!4020 thiss!1602))) (and (bvsge (currentBit!7478 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7478 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7483 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7483 thiss!1602) (size!3562 (buf!4020 thiss!1602))) (and (= (currentBit!7478 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7483 thiss!1602) (size!3562 (buf!4020 thiss!1602)))))))))

(assert (=> d!54959 d!55003))

(assert (=> b!161087 d!54967))

(declare-fun d!55005 () Bool)

(assert (=> d!55005 (arrayRangesEq!514 (buf!4020 thiss!1602) (array!7932 (store (arr!4483 (buf!4020 thiss!1602)) (bvsub (currentByte!7483 (_3!543 lt!253602)) #b00000000000000000000000000000001) lt!253599) (size!3562 (buf!4020 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7483 (_3!543 lt!253602)) #b00000000000000000000000000000001))))

(assert (=> d!55005 true))

(declare-fun _$8!115 () Unit!11018)

(assert (=> d!55005 (= (choose!153 (buf!4020 thiss!1602) (bvsub (currentByte!7483 (_3!543 lt!253602)) #b00000000000000000000000000000001) lt!253599) _$8!115)))

(declare-fun bs!13693 () Bool)

(assert (= bs!13693 d!55005))

(assert (=> bs!13693 m!254745))

(assert (=> bs!13693 m!254759))

(assert (=> d!54969 d!55005))

(declare-fun d!55007 () Bool)

(declare-fun res!134285 () Bool)

(declare-fun e!110820 () Bool)

(assert (=> d!55007 (=> res!134285 e!110820)))

(assert (=> d!55007 (= res!134285 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7483 (_3!543 lt!253602)) #b00000000000000000000000000000001)))))

(assert (=> d!55007 (= (arrayRangesEq!514 (buf!4020 thiss!1602) (array!7932 (store (arr!4483 (buf!4020 thiss!1602)) (bvsub (currentByte!7483 (_3!543 lt!253602)) #b00000000000000000000000000000001) lt!253599) (size!3562 (buf!4020 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7483 (_3!543 lt!253602)) #b00000000000000000000000000000001)) e!110820)))

(declare-fun b!161112 () Bool)

(declare-fun e!110821 () Bool)

(assert (=> b!161112 (= e!110820 e!110821)))

(declare-fun res!134286 () Bool)

(assert (=> b!161112 (=> (not res!134286) (not e!110821))))

(assert (=> b!161112 (= res!134286 (= (select (arr!4483 (buf!4020 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4483 (array!7932 (store (arr!4483 (buf!4020 thiss!1602)) (bvsub (currentByte!7483 (_3!543 lt!253602)) #b00000000000000000000000000000001) lt!253599) (size!3562 (buf!4020 thiss!1602)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!161113 () Bool)

(assert (=> b!161113 (= e!110821 (arrayRangesEq!514 (buf!4020 thiss!1602) (array!7932 (store (arr!4483 (buf!4020 thiss!1602)) (bvsub (currentByte!7483 (_3!543 lt!253602)) #b00000000000000000000000000000001) lt!253599) (size!3562 (buf!4020 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7483 (_3!543 lt!253602)) #b00000000000000000000000000000001)))))

(assert (= (and d!55007 (not res!134285)) b!161112))

(assert (= (and b!161112 res!134286) b!161113))

(assert (=> b!161112 m!254887))

(declare-fun m!254893 () Bool)

(assert (=> b!161112 m!254893))

(declare-fun m!254895 () Bool)

(assert (=> b!161113 m!254895))

(assert (=> b!161084 d!55007))

(push 1)

(assert (not b!161111))

(assert (not d!55005))

(assert (not b!161113))

(check-sat)

(pop 1)

(push 1)

(check-sat)

