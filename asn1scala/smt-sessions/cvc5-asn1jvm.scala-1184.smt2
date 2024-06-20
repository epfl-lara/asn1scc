; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33610 () Bool)

(assert start!33610)

(declare-fun b!161131 () Bool)

(declare-fun e!110841 () Bool)

(declare-datatypes ((array!7940 0))(
  ( (array!7941 (arr!4486 (Array (_ BitVec 32) (_ BitVec 8))) (size!3565 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6298 0))(
  ( (BitStream!6299 (buf!4023 array!7940) (currentByte!7495 (_ BitVec 32)) (currentBit!7490 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6298)

(declare-fun lt!253701 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161131 (= e!110841 (byteRangesEq!0 (select (arr!4486 (buf!4023 thiss!1602)) (currentByte!7495 thiss!1602)) lt!253701 #b00000000000000000000000000000000 (currentBit!7490 thiss!1602)))))

(declare-fun b!161130 () Bool)

(declare-fun e!110842 () Bool)

(declare-fun e!110843 () Bool)

(assert (=> b!161130 (= e!110842 (not e!110843))))

(declare-fun res!134303 () Bool)

(assert (=> b!161130 (=> res!134303 e!110843)))

(declare-fun lt!253707 () array!7940)

(declare-datatypes ((Unit!11030 0))(
  ( (Unit!11031) )
))
(declare-datatypes ((tuple3!858 0))(
  ( (tuple3!859 (_1!7780 Unit!11030) (_2!7780 (_ BitVec 8)) (_3!546 BitStream!6298)) )
))
(declare-fun lt!253700 () tuple3!858)

(declare-fun arrayRangesEq!517 (array!7940 array!7940 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161130 (= res!134303 (not (arrayRangesEq!517 (buf!4023 thiss!1602) lt!253707 #b00000000000000000000000000000000 (bvsub (currentByte!7495 (_3!546 lt!253700)) #b00000000000000000000000000000001))))))

(declare-fun lt!253699 () (_ BitVec 8))

(assert (=> b!161130 (arrayRangesEq!517 (buf!4023 thiss!1602) (array!7941 (store (arr!4486 (buf!4023 thiss!1602)) (bvsub (currentByte!7495 (_3!546 lt!253700)) #b00000000000000000000000000000001) lt!253699) (size!3565 (buf!4023 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7495 (_3!546 lt!253700)) #b00000000000000000000000000000001))))

(declare-fun lt!253703 () Unit!11030)

(declare-fun arrayUpdatedAtPrefixLemma!125 (array!7940 (_ BitVec 32) (_ BitVec 8)) Unit!11030)

(assert (=> b!161130 (= lt!253703 (arrayUpdatedAtPrefixLemma!125 (buf!4023 thiss!1602) (bvsub (currentByte!7495 (_3!546 lt!253700)) #b00000000000000000000000000000001) lt!253699))))

(assert (=> b!161130 (= lt!253699 (select (arr!4486 (buf!4023 (_3!546 lt!253700))) (bvsub (currentByte!7495 (_3!546 lt!253700)) #b00000000000000000000000000000001)))))

(declare-fun lt!253706 () (_ BitVec 8))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!253698 () (_ BitVec 32))

(declare-fun lt!253702 () (_ BitVec 32))

(declare-fun lt!253705 () (_ BitVec 8))

(declare-fun lt!253704 () (_ BitVec 32))

(declare-fun Unit!11032 () Unit!11030)

(declare-fun Unit!11033 () Unit!11030)

(assert (=> b!161130 (= lt!253700 (ite (bvsgt lt!253698 #b00000000000000000000000000000000) (let ((bdg!9597 ((_ extract 7 0) (bvnot lt!253704)))) (let ((bdg!9598 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4486 (buf!4023 thiss!1602)) (currentByte!7495 thiss!1602) lt!253705) (currentByte!7495 thiss!1602) lt!253701) (bvadd #b00000000000000000000000000000001 (currentByte!7495 thiss!1602)))) ((_ sign_extend 24) bdg!9597))))) (tuple3!859 Unit!11032 bdg!9597 (BitStream!6299 (array!7941 (store (arr!4486 (array!7941 (store (arr!4486 lt!253707) (bvadd #b00000000000000000000000000000001 (currentByte!7495 thiss!1602)) bdg!9598) (size!3565 lt!253707))) (bvadd #b00000000000000000000000000000001 (currentByte!7495 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9598) (bvshl ((_ sign_extend 24) v!222) lt!253702)))) (size!3565 (array!7941 (store (arr!4486 lt!253707) (bvadd #b00000000000000000000000000000001 (currentByte!7495 thiss!1602)) bdg!9598) (size!3565 lt!253707)))) (bvadd #b00000000000000000000000000000001 (currentByte!7495 thiss!1602)) (currentBit!7490 thiss!1602))))) (tuple3!859 Unit!11033 lt!253706 (BitStream!6299 lt!253707 (bvadd #b00000000000000000000000000000001 (currentByte!7495 thiss!1602)) (currentBit!7490 thiss!1602)))))))

(assert (=> b!161130 e!110841))

(declare-fun res!134302 () Bool)

(assert (=> b!161130 (=> res!134302 e!110841)))

(assert (=> b!161130 (= res!134302 (bvsge (currentByte!7495 thiss!1602) (size!3565 (buf!4023 thiss!1602))))))

(assert (=> b!161130 (= lt!253707 (array!7941 (store (store (arr!4486 (buf!4023 thiss!1602)) (currentByte!7495 thiss!1602) lt!253705) (currentByte!7495 thiss!1602) lt!253701) (size!3565 (buf!4023 thiss!1602))))))

(assert (=> b!161130 (= lt!253701 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253705) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253698))))))

(assert (=> b!161130 (= lt!253705 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4486 (buf!4023 thiss!1602)) (currentByte!7495 thiss!1602))) lt!253704)))))

(assert (=> b!161130 (= lt!253704 ((_ sign_extend 24) lt!253706))))

(assert (=> b!161130 (= lt!253706 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!253702)))))))

(assert (=> b!161130 (= lt!253702 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253698))))))

(assert (=> b!161130 (= lt!253698 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7490 thiss!1602))))))

(declare-fun b!161133 () Bool)

(declare-fun e!110840 () Bool)

(declare-fun array_inv!3312 (array!7940) Bool)

(assert (=> b!161133 (= e!110840 (array_inv!3312 (buf!4023 thiss!1602)))))

(declare-fun b!161132 () Bool)

(assert (=> b!161132 (= e!110843 (or (bvsle lt!253698 #b00000000000000000000000000000000) (and (bvsle #b00000000000000000000000000000000 (currentByte!7495 (_3!546 lt!253700))) (bvslt (currentByte!7495 (_3!546 lt!253700)) (size!3565 (buf!4023 thiss!1602))))))))

(declare-fun res!134301 () Bool)

(assert (=> start!33610 (=> (not res!134301) (not e!110842))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33610 (= res!134301 (validate_offset_byte!0 ((_ sign_extend 32) (size!3565 (buf!4023 thiss!1602))) ((_ sign_extend 32) (currentByte!7495 thiss!1602)) ((_ sign_extend 32) (currentBit!7490 thiss!1602))))))

(assert (=> start!33610 e!110842))

(declare-fun inv!12 (BitStream!6298) Bool)

(assert (=> start!33610 (and (inv!12 thiss!1602) e!110840)))

(assert (=> start!33610 true))

(assert (= (and start!33610 res!134301) b!161130))

(assert (= (and b!161130 (not res!134302)) b!161131))

(assert (= (and b!161130 (not res!134303)) b!161132))

(assert (= start!33610 b!161133))

(declare-fun m!254917 () Bool)

(assert (=> b!161131 m!254917))

(assert (=> b!161131 m!254917))

(declare-fun m!254919 () Bool)

(assert (=> b!161131 m!254919))

(declare-fun m!254921 () Bool)

(assert (=> b!161130 m!254921))

(declare-fun m!254923 () Bool)

(assert (=> b!161130 m!254923))

(declare-fun m!254925 () Bool)

(assert (=> b!161130 m!254925))

(declare-fun m!254927 () Bool)

(assert (=> b!161130 m!254927))

(declare-fun m!254929 () Bool)

(assert (=> b!161130 m!254929))

(declare-fun m!254931 () Bool)

(assert (=> b!161130 m!254931))

(declare-fun m!254933 () Bool)

(assert (=> b!161130 m!254933))

(declare-fun m!254935 () Bool)

(assert (=> b!161130 m!254935))

(declare-fun m!254937 () Bool)

(assert (=> b!161130 m!254937))

(declare-fun m!254939 () Bool)

(assert (=> b!161130 m!254939))

(assert (=> b!161130 m!254917))

(declare-fun m!254941 () Bool)

(assert (=> b!161130 m!254941))

(declare-fun m!254943 () Bool)

(assert (=> b!161133 m!254943))

(declare-fun m!254945 () Bool)

(assert (=> start!33610 m!254945))

(declare-fun m!254947 () Bool)

(assert (=> start!33610 m!254947))

(push 1)

(assert (not b!161130))

(assert (not start!33610))

(assert (not b!161131))

(assert (not b!161133))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!55031 () Bool)

(declare-fun res!134326 () Bool)

(declare-fun e!110879 () Bool)

(assert (=> d!55031 (=> res!134326 e!110879)))

(assert (=> d!55031 (= res!134326 (= #b00000000000000000000000000000000 (bvsub (currentByte!7495 (_3!546 lt!253700)) #b00000000000000000000000000000001)))))

(assert (=> d!55031 (= (arrayRangesEq!517 (buf!4023 thiss!1602) lt!253707 #b00000000000000000000000000000000 (bvsub (currentByte!7495 (_3!546 lt!253700)) #b00000000000000000000000000000001)) e!110879)))

(declare-fun b!161162 () Bool)

(declare-fun e!110880 () Bool)

(assert (=> b!161162 (= e!110879 e!110880)))

(declare-fun res!134327 () Bool)

(assert (=> b!161162 (=> (not res!134327) (not e!110880))))

(assert (=> b!161162 (= res!134327 (= (select (arr!4486 (buf!4023 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4486 lt!253707) #b00000000000000000000000000000000)))))

(declare-fun b!161163 () Bool)

(assert (=> b!161163 (= e!110880 (arrayRangesEq!517 (buf!4023 thiss!1602) lt!253707 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7495 (_3!546 lt!253700)) #b00000000000000000000000000000001)))))

(assert (= (and d!55031 (not res!134326)) b!161162))

(assert (= (and b!161162 res!134327) b!161163))

(declare-fun m!255013 () Bool)

(assert (=> b!161162 m!255013))

(declare-fun m!255015 () Bool)

(assert (=> b!161162 m!255015))

(declare-fun m!255017 () Bool)

(assert (=> b!161163 m!255017))

(assert (=> b!161130 d!55031))

(declare-fun d!55033 () Bool)

(declare-fun res!134328 () Bool)

(declare-fun e!110881 () Bool)

(assert (=> d!55033 (=> res!134328 e!110881)))

(assert (=> d!55033 (= res!134328 (= #b00000000000000000000000000000000 (bvsub (currentByte!7495 (_3!546 lt!253700)) #b00000000000000000000000000000001)))))

(assert (=> d!55033 (= (arrayRangesEq!517 (buf!4023 thiss!1602) (array!7941 (store (arr!4486 (buf!4023 thiss!1602)) (bvsub (currentByte!7495 (_3!546 lt!253700)) #b00000000000000000000000000000001) lt!253699) (size!3565 (buf!4023 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7495 (_3!546 lt!253700)) #b00000000000000000000000000000001)) e!110881)))

(declare-fun b!161164 () Bool)

(declare-fun e!110882 () Bool)

(assert (=> b!161164 (= e!110881 e!110882)))

(declare-fun res!134329 () Bool)

(assert (=> b!161164 (=> (not res!134329) (not e!110882))))

(assert (=> b!161164 (= res!134329 (= (select (arr!4486 (buf!4023 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4486 (array!7941 (store (arr!4486 (buf!4023 thiss!1602)) (bvsub (currentByte!7495 (_3!546 lt!253700)) #b00000000000000000000000000000001) lt!253699) (size!3565 (buf!4023 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161165 () Bool)

(assert (=> b!161165 (= e!110882 (arrayRangesEq!517 (buf!4023 thiss!1602) (array!7941 (store (arr!4486 (buf!4023 thiss!1602)) (bvsub (currentByte!7495 (_3!546 lt!253700)) #b00000000000000000000000000000001) lt!253699) (size!3565 (buf!4023 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7495 (_3!546 lt!253700)) #b00000000000000000000000000000001)))))

(assert (= (and d!55033 (not res!134328)) b!161164))

(assert (= (and b!161164 res!134329) b!161165))

(assert (=> b!161164 m!255013))

(declare-fun m!255019 () Bool)

(assert (=> b!161164 m!255019))

(declare-fun m!255021 () Bool)

(assert (=> b!161165 m!255021))

(assert (=> b!161130 d!55033))

(declare-fun d!55035 () Bool)

(declare-fun e!110885 () Bool)

(assert (=> d!55035 e!110885))

(declare-fun res!134332 () Bool)

(assert (=> d!55035 (=> (not res!134332) (not e!110885))))

(assert (=> d!55035 (= res!134332 (and (bvsge (bvsub (currentByte!7495 (_3!546 lt!253700)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7495 (_3!546 lt!253700)) #b00000000000000000000000000000001) (size!3565 (buf!4023 thiss!1602)))))))

(declare-fun lt!253770 () Unit!11030)

(declare-fun choose!156 (array!7940 (_ BitVec 32) (_ BitVec 8)) Unit!11030)

(assert (=> d!55035 (= lt!253770 (choose!156 (buf!4023 thiss!1602) (bvsub (currentByte!7495 (_3!546 lt!253700)) #b00000000000000000000000000000001) lt!253699))))

(assert (=> d!55035 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7495 (_3!546 lt!253700)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7495 (_3!546 lt!253700)) #b00000000000000000000000000000001) (size!3565 (buf!4023 thiss!1602))))))

(assert (=> d!55035 (= (arrayUpdatedAtPrefixLemma!125 (buf!4023 thiss!1602) (bvsub (currentByte!7495 (_3!546 lt!253700)) #b00000000000000000000000000000001) lt!253699) lt!253770)))

(declare-fun b!161168 () Bool)

(assert (=> b!161168 (= e!110885 (arrayRangesEq!517 (buf!4023 thiss!1602) (array!7941 (store (arr!4486 (buf!4023 thiss!1602)) (bvsub (currentByte!7495 (_3!546 lt!253700)) #b00000000000000000000000000000001) lt!253699) (size!3565 (buf!4023 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7495 (_3!546 lt!253700)) #b00000000000000000000000000000001)))))

(assert (= (and d!55035 res!134332) b!161168))

(declare-fun m!255023 () Bool)

(assert (=> d!55035 m!255023))

(assert (=> b!161168 m!254939))

(assert (=> b!161168 m!254931))

(assert (=> b!161130 d!55035))

(declare-fun d!55037 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!55037 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3565 (buf!4023 thiss!1602))) ((_ sign_extend 32) (currentByte!7495 thiss!1602)) ((_ sign_extend 32) (currentBit!7490 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3565 (buf!4023 thiss!1602))) ((_ sign_extend 32) (currentByte!7495 thiss!1602)) ((_ sign_extend 32) (currentBit!7490 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13699 () Bool)

(assert (= bs!13699 d!55037))

(declare-fun m!255025 () Bool)

(assert (=> bs!13699 m!255025))

(assert (=> start!33610 d!55037))

(declare-fun d!55039 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!55039 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7490 thiss!1602) (currentByte!7495 thiss!1602) (size!3565 (buf!4023 thiss!1602))))))

(declare-fun bs!13700 () Bool)

(assert (= bs!13700 d!55039))

(declare-fun m!255027 () Bool)

(assert (=> bs!13700 m!255027))

(assert (=> start!33610 d!55039))

(declare-fun d!55041 () Bool)

(assert (=> d!55041 (= (byteRangesEq!0 (select (arr!4486 (buf!4023 thiss!1602)) (currentByte!7495 thiss!1602)) lt!253701 #b00000000000000000000000000000000 (currentBit!7490 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7490 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4486 (buf!4023 thiss!1602)) (currentByte!7495 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7490 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!253701) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7490 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13701 () Bool)

(assert (= bs!13701 d!55041))

(declare-fun m!255029 () Bool)

(assert (=> bs!13701 m!255029))

(declare-fun m!255031 () Bool)

(assert (=> bs!13701 m!255031))

(assert (=> b!161131 d!55041))

(declare-fun d!55045 () Bool)

(assert (=> d!55045 (= (array_inv!3312 (buf!4023 thiss!1602)) (bvsge (size!3565 (buf!4023 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!161133 d!55045))

(push 1)

(assert (not d!55037))

(assert (not d!55035))

(assert (not b!161165))

(assert (not b!161163))

(assert (not b!161168))

(assert (not d!55039))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!55073 () Bool)

(declare-fun res!134355 () Bool)

(declare-fun e!110908 () Bool)

(assert (=> d!55073 (=> res!134355 e!110908)))

(assert (=> d!55073 (= res!134355 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7495 (_3!546 lt!253700)) #b00000000000000000000000000000001)))))

(assert (=> d!55073 (= (arrayRangesEq!517 (buf!4023 thiss!1602) (array!7941 (store (arr!4486 (buf!4023 thiss!1602)) (bvsub (currentByte!7495 (_3!546 lt!253700)) #b00000000000000000000000000000001) lt!253699) (size!3565 (buf!4023 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7495 (_3!546 lt!253700)) #b00000000000000000000000000000001)) e!110908)))

(declare-fun b!161191 () Bool)

(declare-fun e!110909 () Bool)

(assert (=> b!161191 (= e!110908 e!110909)))

(declare-fun res!134356 () Bool)

(assert (=> b!161191 (=> (not res!134356) (not e!110909))))

(assert (=> b!161191 (= res!134356 (= (select (arr!4486 (buf!4023 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4486 (array!7941 (store (arr!4486 (buf!4023 thiss!1602)) (bvsub (currentByte!7495 (_3!546 lt!253700)) #b00000000000000000000000000000001) lt!253699) (size!3565 (buf!4023 thiss!1602)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!161192 () Bool)

(assert (=> b!161192 (= e!110909 (arrayRangesEq!517 (buf!4023 thiss!1602) (array!7941 (store (arr!4486 (buf!4023 thiss!1602)) (bvsub (currentByte!7495 (_3!546 lt!253700)) #b00000000000000000000000000000001) lt!253699) (size!3565 (buf!4023 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7495 (_3!546 lt!253700)) #b00000000000000000000000000000001)))))

(assert (= (and d!55073 (not res!134355)) b!161191))

(assert (= (and b!161191 res!134356) b!161192))

(declare-fun m!255073 () Bool)

(assert (=> b!161191 m!255073))

(declare-fun m!255075 () Bool)

(assert (=> b!161191 m!255075))

(declare-fun m!255077 () Bool)

(assert (=> b!161192 m!255077))

(assert (=> b!161165 d!55073))

(declare-fun d!55075 () Bool)

(assert (=> d!55075 (arrayRangesEq!517 (buf!4023 thiss!1602) (array!7941 (store (arr!4486 (buf!4023 thiss!1602)) (bvsub (currentByte!7495 (_3!546 lt!253700)) #b00000000000000000000000000000001) lt!253699) (size!3565 (buf!4023 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7495 (_3!546 lt!253700)) #b00000000000000000000000000000001))))

(assert (=> d!55075 true))

(declare-fun _$8!124 () Unit!11030)

(assert (=> d!55075 (= (choose!156 (buf!4023 thiss!1602) (bvsub (currentByte!7495 (_3!546 lt!253700)) #b00000000000000000000000000000001) lt!253699) _$8!124)))

(declare-fun bs!13708 () Bool)

(assert (= bs!13708 d!55075))

(assert (=> bs!13708 m!254939))

(assert (=> bs!13708 m!254931))

(assert (=> d!55035 d!55075))

(declare-fun d!55081 () Bool)

(assert (=> d!55081 (= (invariant!0 (currentBit!7490 thiss!1602) (currentByte!7495 thiss!1602) (size!3565 (buf!4023 thiss!1602))) (and (bvsge (currentBit!7490 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7490 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7495 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7495 thiss!1602) (size!3565 (buf!4023 thiss!1602))) (and (= (currentBit!7490 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7495 thiss!1602) (size!3565 (buf!4023 thiss!1602)))))))))

(assert (=> d!55039 d!55081))

(declare-fun d!55087 () Bool)

(assert (=> d!55087 (= (remainingBits!0 ((_ sign_extend 32) (size!3565 (buf!4023 thiss!1602))) ((_ sign_extend 32) (currentByte!7495 thiss!1602)) ((_ sign_extend 32) (currentBit!7490 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3565 (buf!4023 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7495 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7490 thiss!1602)))))))

(assert (=> d!55037 d!55087))

(declare-fun d!55091 () Bool)

(declare-fun res!134361 () Bool)

(declare-fun e!110914 () Bool)

(assert (=> d!55091 (=> res!134361 e!110914)))

(assert (=> d!55091 (= res!134361 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7495 (_3!546 lt!253700)) #b00000000000000000000000000000001)))))

(assert (=> d!55091 (= (arrayRangesEq!517 (buf!4023 thiss!1602) lt!253707 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7495 (_3!546 lt!253700)) #b00000000000000000000000000000001)) e!110914)))

(declare-fun b!161197 () Bool)

(declare-fun e!110915 () Bool)

(assert (=> b!161197 (= e!110914 e!110915)))

(declare-fun res!134362 () Bool)

(assert (=> b!161197 (=> (not res!134362) (not e!110915))))

(assert (=> b!161197 (= res!134362 (= (select (arr!4486 (buf!4023 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4486 lt!253707) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!161198 () Bool)

(assert (=> b!161198 (= e!110915 (arrayRangesEq!517 (buf!4023 thiss!1602) lt!253707 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7495 (_3!546 lt!253700)) #b00000000000000000000000000000001)))))

(assert (= (and d!55091 (not res!134361)) b!161197))

(assert (= (and b!161197 res!134362) b!161198))

(assert (=> b!161197 m!255073))

(declare-fun m!255089 () Bool)

(assert (=> b!161197 m!255089))

(declare-fun m!255091 () Bool)

(assert (=> b!161198 m!255091))

(assert (=> b!161163 d!55091))

(assert (=> b!161168 d!55033))

(push 1)

(assert (not d!55075))

(assert (not b!161198))

(assert (not b!161192))

(check-sat)

(pop 1)

(push 1)

(check-sat)

