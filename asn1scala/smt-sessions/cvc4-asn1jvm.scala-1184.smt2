; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33614 () Bool)

(assert start!33614)

(declare-fun b!161155 () Bool)

(declare-fun e!110872 () Bool)

(declare-datatypes ((array!7944 0))(
  ( (array!7945 (arr!4488 (Array (_ BitVec 32) (_ BitVec 8))) (size!3567 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6302 0))(
  ( (BitStream!6303 (buf!4025 array!7944) (currentByte!7497 (_ BitVec 32)) (currentBit!7492 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6302)

(declare-fun lt!253763 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161155 (= e!110872 (byteRangesEq!0 (select (arr!4488 (buf!4025 thiss!1602)) (currentByte!7497 thiss!1602)) lt!253763 #b00000000000000000000000000000000 (currentBit!7492 thiss!1602)))))

(declare-fun res!134320 () Bool)

(declare-fun e!110870 () Bool)

(assert (=> start!33614 (=> (not res!134320) (not e!110870))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33614 (= res!134320 (validate_offset_byte!0 ((_ sign_extend 32) (size!3567 (buf!4025 thiss!1602))) ((_ sign_extend 32) (currentByte!7497 thiss!1602)) ((_ sign_extend 32) (currentBit!7492 thiss!1602))))))

(assert (=> start!33614 e!110870))

(declare-fun e!110874 () Bool)

(declare-fun inv!12 (BitStream!6302) Bool)

(assert (=> start!33614 (and (inv!12 thiss!1602) e!110874)))

(assert (=> start!33614 true))

(declare-fun b!161154 () Bool)

(declare-fun e!110871 () Bool)

(assert (=> b!161154 (= e!110870 (not e!110871))))

(declare-fun res!134321 () Bool)

(assert (=> b!161154 (=> res!134321 e!110871)))

(declare-fun lt!253764 () array!7944)

(declare-datatypes ((Unit!11038 0))(
  ( (Unit!11039) )
))
(declare-datatypes ((tuple3!862 0))(
  ( (tuple3!863 (_1!7782 Unit!11038) (_2!7782 (_ BitVec 8)) (_3!548 BitStream!6302)) )
))
(declare-fun lt!253765 () tuple3!862)

(declare-fun arrayRangesEq!519 (array!7944 array!7944 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161154 (= res!134321 (not (arrayRangesEq!519 (buf!4025 thiss!1602) lt!253764 #b00000000000000000000000000000000 (bvsub (currentByte!7497 (_3!548 lt!253765)) #b00000000000000000000000000000001))))))

(declare-fun lt!253758 () (_ BitVec 8))

(assert (=> b!161154 (arrayRangesEq!519 (buf!4025 thiss!1602) (array!7945 (store (arr!4488 (buf!4025 thiss!1602)) (bvsub (currentByte!7497 (_3!548 lt!253765)) #b00000000000000000000000000000001) lt!253758) (size!3567 (buf!4025 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7497 (_3!548 lt!253765)) #b00000000000000000000000000000001))))

(declare-fun lt!253760 () Unit!11038)

(declare-fun arrayUpdatedAtPrefixLemma!127 (array!7944 (_ BitVec 32) (_ BitVec 8)) Unit!11038)

(assert (=> b!161154 (= lt!253760 (arrayUpdatedAtPrefixLemma!127 (buf!4025 thiss!1602) (bvsub (currentByte!7497 (_3!548 lt!253765)) #b00000000000000000000000000000001) lt!253758))))

(assert (=> b!161154 (= lt!253758 (select (arr!4488 (buf!4025 (_3!548 lt!253765))) (bvsub (currentByte!7497 (_3!548 lt!253765)) #b00000000000000000000000000000001)))))

(declare-fun lt!253766 () (_ BitVec 8))

(declare-fun lt!253761 () (_ BitVec 32))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!253762 () (_ BitVec 8))

(declare-fun lt!253767 () (_ BitVec 32))

(declare-fun lt!253759 () (_ BitVec 32))

(declare-fun Unit!11040 () Unit!11038)

(declare-fun Unit!11041 () Unit!11038)

(assert (=> b!161154 (= lt!253765 (ite (bvsgt lt!253767 #b00000000000000000000000000000000) (let ((bdg!9597 ((_ extract 7 0) (bvnot lt!253761)))) (let ((bdg!9598 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4488 (buf!4025 thiss!1602)) (currentByte!7497 thiss!1602) lt!253766) (currentByte!7497 thiss!1602) lt!253763) (bvadd #b00000000000000000000000000000001 (currentByte!7497 thiss!1602)))) ((_ sign_extend 24) bdg!9597))))) (tuple3!863 Unit!11040 bdg!9597 (BitStream!6303 (array!7945 (store (arr!4488 (array!7945 (store (arr!4488 lt!253764) (bvadd #b00000000000000000000000000000001 (currentByte!7497 thiss!1602)) bdg!9598) (size!3567 lt!253764))) (bvadd #b00000000000000000000000000000001 (currentByte!7497 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9598) (bvshl ((_ sign_extend 24) v!222) lt!253759)))) (size!3567 (array!7945 (store (arr!4488 lt!253764) (bvadd #b00000000000000000000000000000001 (currentByte!7497 thiss!1602)) bdg!9598) (size!3567 lt!253764)))) (bvadd #b00000000000000000000000000000001 (currentByte!7497 thiss!1602)) (currentBit!7492 thiss!1602))))) (tuple3!863 Unit!11041 lt!253762 (BitStream!6303 lt!253764 (bvadd #b00000000000000000000000000000001 (currentByte!7497 thiss!1602)) (currentBit!7492 thiss!1602)))))))

(assert (=> b!161154 e!110872))

(declare-fun res!134319 () Bool)

(assert (=> b!161154 (=> res!134319 e!110872)))

(assert (=> b!161154 (= res!134319 (bvsge (currentByte!7497 thiss!1602) (size!3567 (buf!4025 thiss!1602))))))

(assert (=> b!161154 (= lt!253764 (array!7945 (store (store (arr!4488 (buf!4025 thiss!1602)) (currentByte!7497 thiss!1602) lt!253766) (currentByte!7497 thiss!1602) lt!253763) (size!3567 (buf!4025 thiss!1602))))))

(assert (=> b!161154 (= lt!253763 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253766) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253767))))))

(assert (=> b!161154 (= lt!253766 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4488 (buf!4025 thiss!1602)) (currentByte!7497 thiss!1602))) lt!253761)))))

(assert (=> b!161154 (= lt!253761 ((_ sign_extend 24) lt!253762))))

(assert (=> b!161154 (= lt!253762 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!253759)))))))

(assert (=> b!161154 (= lt!253759 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253767))))))

(assert (=> b!161154 (= lt!253767 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7492 thiss!1602))))))

(declare-fun b!161157 () Bool)

(declare-fun array_inv!3314 (array!7944) Bool)

(assert (=> b!161157 (= e!110874 (array_inv!3314 (buf!4025 thiss!1602)))))

(declare-fun b!161156 () Bool)

(assert (=> b!161156 (= e!110871 (or (bvsle lt!253767 #b00000000000000000000000000000000) (and (bvsle #b00000000000000000000000000000000 (currentByte!7497 (_3!548 lt!253765))) (bvslt (currentByte!7497 (_3!548 lt!253765)) (size!3567 (buf!4025 thiss!1602))))))))

(assert (= (and start!33614 res!134320) b!161154))

(assert (= (and b!161154 (not res!134319)) b!161155))

(assert (= (and b!161154 (not res!134321)) b!161156))

(assert (= start!33614 b!161157))

(declare-fun m!254981 () Bool)

(assert (=> b!161155 m!254981))

(assert (=> b!161155 m!254981))

(declare-fun m!254983 () Bool)

(assert (=> b!161155 m!254983))

(declare-fun m!254985 () Bool)

(assert (=> start!33614 m!254985))

(declare-fun m!254987 () Bool)

(assert (=> start!33614 m!254987))

(declare-fun m!254989 () Bool)

(assert (=> b!161154 m!254989))

(declare-fun m!254991 () Bool)

(assert (=> b!161154 m!254991))

(assert (=> b!161154 m!254981))

(declare-fun m!254993 () Bool)

(assert (=> b!161154 m!254993))

(declare-fun m!254995 () Bool)

(assert (=> b!161154 m!254995))

(declare-fun m!254997 () Bool)

(assert (=> b!161154 m!254997))

(declare-fun m!254999 () Bool)

(assert (=> b!161154 m!254999))

(declare-fun m!255001 () Bool)

(assert (=> b!161154 m!255001))

(declare-fun m!255003 () Bool)

(assert (=> b!161154 m!255003))

(declare-fun m!255005 () Bool)

(assert (=> b!161154 m!255005))

(declare-fun m!255007 () Bool)

(assert (=> b!161154 m!255007))

(declare-fun m!255009 () Bool)

(assert (=> b!161154 m!255009))

(declare-fun m!255011 () Bool)

(assert (=> b!161157 m!255011))

(push 1)

(assert (not b!161154))

(assert (not start!33614))

(assert (not b!161155))

(assert (not b!161157))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!55043 () Bool)

(declare-fun res!134337 () Bool)

(declare-fun e!110890 () Bool)

(assert (=> d!55043 (=> res!134337 e!110890)))

(assert (=> d!55043 (= res!134337 (= #b00000000000000000000000000000000 (bvsub (currentByte!7497 (_3!548 lt!253765)) #b00000000000000000000000000000001)))))

(assert (=> d!55043 (= (arrayRangesEq!519 (buf!4025 thiss!1602) lt!253764 #b00000000000000000000000000000000 (bvsub (currentByte!7497 (_3!548 lt!253765)) #b00000000000000000000000000000001)) e!110890)))

(declare-fun b!161173 () Bool)

(declare-fun e!110891 () Bool)

(assert (=> b!161173 (= e!110890 e!110891)))

(declare-fun res!134338 () Bool)

(assert (=> b!161173 (=> (not res!134338) (not e!110891))))

(assert (=> b!161173 (= res!134338 (= (select (arr!4488 (buf!4025 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4488 lt!253764) #b00000000000000000000000000000000)))))

(declare-fun b!161174 () Bool)

(assert (=> b!161174 (= e!110891 (arrayRangesEq!519 (buf!4025 thiss!1602) lt!253764 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7497 (_3!548 lt!253765)) #b00000000000000000000000000000001)))))

(assert (= (and d!55043 (not res!134337)) b!161173))

(assert (= (and b!161173 res!134338) b!161174))

(declare-fun m!255033 () Bool)

(assert (=> b!161173 m!255033))

(declare-fun m!255035 () Bool)

(assert (=> b!161173 m!255035))

(declare-fun m!255037 () Bool)

(assert (=> b!161174 m!255037))

(assert (=> b!161154 d!55043))

(declare-fun d!55047 () Bool)

(declare-fun res!134339 () Bool)

(declare-fun e!110892 () Bool)

(assert (=> d!55047 (=> res!134339 e!110892)))

(assert (=> d!55047 (= res!134339 (= #b00000000000000000000000000000000 (bvsub (currentByte!7497 (_3!548 lt!253765)) #b00000000000000000000000000000001)))))

(assert (=> d!55047 (= (arrayRangesEq!519 (buf!4025 thiss!1602) (array!7945 (store (arr!4488 (buf!4025 thiss!1602)) (bvsub (currentByte!7497 (_3!548 lt!253765)) #b00000000000000000000000000000001) lt!253758) (size!3567 (buf!4025 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7497 (_3!548 lt!253765)) #b00000000000000000000000000000001)) e!110892)))

(declare-fun b!161175 () Bool)

(declare-fun e!110893 () Bool)

(assert (=> b!161175 (= e!110892 e!110893)))

(declare-fun res!134340 () Bool)

(assert (=> b!161175 (=> (not res!134340) (not e!110893))))

(assert (=> b!161175 (= res!134340 (= (select (arr!4488 (buf!4025 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4488 (array!7945 (store (arr!4488 (buf!4025 thiss!1602)) (bvsub (currentByte!7497 (_3!548 lt!253765)) #b00000000000000000000000000000001) lt!253758) (size!3567 (buf!4025 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161176 () Bool)

(assert (=> b!161176 (= e!110893 (arrayRangesEq!519 (buf!4025 thiss!1602) (array!7945 (store (arr!4488 (buf!4025 thiss!1602)) (bvsub (currentByte!7497 (_3!548 lt!253765)) #b00000000000000000000000000000001) lt!253758) (size!3567 (buf!4025 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7497 (_3!548 lt!253765)) #b00000000000000000000000000000001)))))

(assert (= (and d!55047 (not res!134339)) b!161175))

(assert (= (and b!161175 res!134340) b!161176))

(assert (=> b!161175 m!255033))

(declare-fun m!255039 () Bool)

(assert (=> b!161175 m!255039))

(declare-fun m!255041 () Bool)

(assert (=> b!161176 m!255041))

(assert (=> b!161154 d!55047))

(declare-fun d!55049 () Bool)

(declare-fun e!110896 () Bool)

(assert (=> d!55049 e!110896))

(declare-fun res!134343 () Bool)

(assert (=> d!55049 (=> (not res!134343) (not e!110896))))

(assert (=> d!55049 (= res!134343 (and (bvsge (bvsub (currentByte!7497 (_3!548 lt!253765)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7497 (_3!548 lt!253765)) #b00000000000000000000000000000001) (size!3567 (buf!4025 thiss!1602)))))))

(declare-fun lt!253773 () Unit!11038)

(declare-fun choose!157 (array!7944 (_ BitVec 32) (_ BitVec 8)) Unit!11038)

(assert (=> d!55049 (= lt!253773 (choose!157 (buf!4025 thiss!1602) (bvsub (currentByte!7497 (_3!548 lt!253765)) #b00000000000000000000000000000001) lt!253758))))

(assert (=> d!55049 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7497 (_3!548 lt!253765)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7497 (_3!548 lt!253765)) #b00000000000000000000000000000001) (size!3567 (buf!4025 thiss!1602))))))

(assert (=> d!55049 (= (arrayUpdatedAtPrefixLemma!127 (buf!4025 thiss!1602) (bvsub (currentByte!7497 (_3!548 lt!253765)) #b00000000000000000000000000000001) lt!253758) lt!253773)))

(declare-fun b!161179 () Bool)

(assert (=> b!161179 (= e!110896 (arrayRangesEq!519 (buf!4025 thiss!1602) (array!7945 (store (arr!4488 (buf!4025 thiss!1602)) (bvsub (currentByte!7497 (_3!548 lt!253765)) #b00000000000000000000000000000001) lt!253758) (size!3567 (buf!4025 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7497 (_3!548 lt!253765)) #b00000000000000000000000000000001)))))

(assert (= (and d!55049 res!134343) b!161179))

(declare-fun m!255043 () Bool)

(assert (=> d!55049 m!255043))

(assert (=> b!161179 m!254989))

(assert (=> b!161179 m!254999))

(assert (=> b!161154 d!55049))

(declare-fun d!55051 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!55051 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3567 (buf!4025 thiss!1602))) ((_ sign_extend 32) (currentByte!7497 thiss!1602)) ((_ sign_extend 32) (currentBit!7492 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3567 (buf!4025 thiss!1602))) ((_ sign_extend 32) (currentByte!7497 thiss!1602)) ((_ sign_extend 32) (currentBit!7492 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13702 () Bool)

(assert (= bs!13702 d!55051))

(declare-fun m!255045 () Bool)

(assert (=> bs!13702 m!255045))

(assert (=> start!33614 d!55051))

(declare-fun d!55053 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!55053 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7492 thiss!1602) (currentByte!7497 thiss!1602) (size!3567 (buf!4025 thiss!1602))))))

(declare-fun bs!13703 () Bool)

(assert (= bs!13703 d!55053))

(declare-fun m!255047 () Bool)

(assert (=> bs!13703 m!255047))

(assert (=> start!33614 d!55053))

(declare-fun d!55055 () Bool)

(assert (=> d!55055 (= (byteRangesEq!0 (select (arr!4488 (buf!4025 thiss!1602)) (currentByte!7497 thiss!1602)) lt!253763 #b00000000000000000000000000000000 (currentBit!7492 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7492 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4488 (buf!4025 thiss!1602)) (currentByte!7497 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7492 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!253763) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7492 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13704 () Bool)

(assert (= bs!13704 d!55055))

(declare-fun m!255049 () Bool)

(assert (=> bs!13704 m!255049))

(declare-fun m!255051 () Bool)

(assert (=> bs!13704 m!255051))

(assert (=> b!161155 d!55055))

(declare-fun d!55057 () Bool)

(assert (=> d!55057 (= (array_inv!3314 (buf!4025 thiss!1602)) (bvsge (size!3567 (buf!4025 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!161157 d!55057))

(push 1)

(assert (not b!161176))

(assert (not b!161179))

(assert (not d!55053))

(assert (not d!55049))

(assert (not b!161174))

(assert (not d!55051))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!55093 () Bool)

(declare-fun res!134363 () Bool)

(declare-fun e!110916 () Bool)

(assert (=> d!55093 (=> res!134363 e!110916)))

(assert (=> d!55093 (= res!134363 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7497 (_3!548 lt!253765)) #b00000000000000000000000000000001)))))

(assert (=> d!55093 (= (arrayRangesEq!519 (buf!4025 thiss!1602) (array!7945 (store (arr!4488 (buf!4025 thiss!1602)) (bvsub (currentByte!7497 (_3!548 lt!253765)) #b00000000000000000000000000000001) lt!253758) (size!3567 (buf!4025 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7497 (_3!548 lt!253765)) #b00000000000000000000000000000001)) e!110916)))

(declare-fun b!161199 () Bool)

(declare-fun e!110917 () Bool)

(assert (=> b!161199 (= e!110916 e!110917)))

(declare-fun res!134364 () Bool)

(assert (=> b!161199 (=> (not res!134364) (not e!110917))))

(assert (=> b!161199 (= res!134364 (= (select (arr!4488 (buf!4025 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4488 (array!7945 (store (arr!4488 (buf!4025 thiss!1602)) (bvsub (currentByte!7497 (_3!548 lt!253765)) #b00000000000000000000000000000001) lt!253758) (size!3567 (buf!4025 thiss!1602)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!161200 () Bool)

(assert (=> b!161200 (= e!110917 (arrayRangesEq!519 (buf!4025 thiss!1602) (array!7945 (store (arr!4488 (buf!4025 thiss!1602)) (bvsub (currentByte!7497 (_3!548 lt!253765)) #b00000000000000000000000000000001) lt!253758) (size!3567 (buf!4025 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7497 (_3!548 lt!253765)) #b00000000000000000000000000000001)))))

(assert (= (and d!55093 (not res!134363)) b!161199))

(assert (= (and b!161199 res!134364) b!161200))

(declare-fun m!255093 () Bool)

(assert (=> b!161199 m!255093))

(declare-fun m!255095 () Bool)

(assert (=> b!161199 m!255095))

(declare-fun m!255097 () Bool)

(assert (=> b!161200 m!255097))

(assert (=> b!161176 d!55093))

(declare-fun d!55095 () Bool)

(assert (=> d!55095 (arrayRangesEq!519 (buf!4025 thiss!1602) (array!7945 (store (arr!4488 (buf!4025 thiss!1602)) (bvsub (currentByte!7497 (_3!548 lt!253765)) #b00000000000000000000000000000001) lt!253758) (size!3567 (buf!4025 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7497 (_3!548 lt!253765)) #b00000000000000000000000000000001))))

(assert (=> d!55095 true))

(declare-fun _$8!130 () Unit!11038)

(assert (=> d!55095 (= (choose!157 (buf!4025 thiss!1602) (bvsub (currentByte!7497 (_3!548 lt!253765)) #b00000000000000000000000000000001) lt!253758) _$8!130)))

(declare-fun bs!13710 () Bool)

(assert (= bs!13710 d!55095))

(assert (=> bs!13710 m!254989))

(assert (=> bs!13710 m!254999))

(assert (=> d!55049 d!55095))

(declare-fun d!55097 () Bool)

(assert (=> d!55097 (= (invariant!0 (currentBit!7492 thiss!1602) (currentByte!7497 thiss!1602) (size!3567 (buf!4025 thiss!1602))) (and (bvsge (currentBit!7492 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7492 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7497 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7497 thiss!1602) (size!3567 (buf!4025 thiss!1602))) (and (= (currentBit!7492 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7497 thiss!1602) (size!3567 (buf!4025 thiss!1602)))))))))

(assert (=> d!55053 d!55097))

(declare-fun d!55099 () Bool)

(assert (=> d!55099 (= (remainingBits!0 ((_ sign_extend 32) (size!3567 (buf!4025 thiss!1602))) ((_ sign_extend 32) (currentByte!7497 thiss!1602)) ((_ sign_extend 32) (currentBit!7492 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3567 (buf!4025 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7497 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7492 thiss!1602)))))))

(assert (=> d!55051 d!55099))

(declare-fun d!55101 () Bool)

(declare-fun res!134365 () Bool)

(declare-fun e!110918 () Bool)

(assert (=> d!55101 (=> res!134365 e!110918)))

(assert (=> d!55101 (= res!134365 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7497 (_3!548 lt!253765)) #b00000000000000000000000000000001)))))

(assert (=> d!55101 (= (arrayRangesEq!519 (buf!4025 thiss!1602) lt!253764 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7497 (_3!548 lt!253765)) #b00000000000000000000000000000001)) e!110918)))

(declare-fun b!161201 () Bool)

(declare-fun e!110919 () Bool)

(assert (=> b!161201 (= e!110918 e!110919)))

(declare-fun res!134366 () Bool)

(assert (=> b!161201 (=> (not res!134366) (not e!110919))))

(assert (=> b!161201 (= res!134366 (= (select (arr!4488 (buf!4025 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4488 lt!253764) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!161202 () Bool)

(assert (=> b!161202 (= e!110919 (arrayRangesEq!519 (buf!4025 thiss!1602) lt!253764 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7497 (_3!548 lt!253765)) #b00000000000000000000000000000001)))))

(assert (= (and d!55101 (not res!134365)) b!161201))

(assert (= (and b!161201 res!134366) b!161202))

(assert (=> b!161201 m!255093))

(declare-fun m!255099 () Bool)

(assert (=> b!161201 m!255099))

(declare-fun m!255101 () Bool)

(assert (=> b!161202 m!255101))

(assert (=> b!161174 d!55101))

(assert (=> b!161179 d!55047))

(push 1)

(assert (not b!161202))

(assert (not d!55095))

(assert (not b!161200))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

