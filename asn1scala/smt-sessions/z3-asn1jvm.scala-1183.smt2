; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33552 () Bool)

(assert start!33552)

(declare-fun res!134239 () Bool)

(declare-fun e!110767 () Bool)

(assert (=> start!33552 (=> (not res!134239) (not e!110767))))

(declare-datatypes ((array!7933 0))(
  ( (array!7934 (arr!4484 (Array (_ BitVec 32) (_ BitVec 8))) (size!3563 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6294 0))(
  ( (BitStream!6295 (buf!4021 array!7933) (currentByte!7484 (_ BitVec 32)) (currentBit!7479 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6294)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33552 (= res!134239 (validate_offset_byte!0 ((_ sign_extend 32) (size!3563 (buf!4021 thiss!1602))) ((_ sign_extend 32) (currentByte!7484 thiss!1602)) ((_ sign_extend 32) (currentBit!7479 thiss!1602))))))

(assert (=> start!33552 e!110767))

(declare-fun e!110769 () Bool)

(declare-fun inv!12 (BitStream!6294) Bool)

(assert (=> start!33552 (and (inv!12 thiss!1602) e!110769)))

(assert (=> start!33552 true))

(declare-fun b!161063 () Bool)

(declare-fun e!110768 () Bool)

(declare-fun lt!253635 () (_ BitVec 32))

(declare-datatypes ((Unit!11022 0))(
  ( (Unit!11023) )
))
(declare-datatypes ((tuple3!854 0))(
  ( (tuple3!855 (_1!7778 Unit!11022) (_2!7778 (_ BitVec 8)) (_3!544 BitStream!6294)) )
))
(declare-fun lt!253638 () tuple3!854)

(assert (=> b!161063 (= e!110768 (or (bvsle lt!253635 #b00000000000000000000000000000000) (and (bvsge (currentByte!7484 (_3!544 lt!253638)) #b00000000000000000000000000000000) (bvslt (currentByte!7484 (_3!544 lt!253638)) (size!3563 (buf!4021 (_3!544 lt!253638)))))))))

(declare-fun b!161062 () Bool)

(declare-fun e!110766 () Bool)

(declare-fun lt!253631 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161062 (= e!110766 (byteRangesEq!0 (select (arr!4484 (buf!4021 thiss!1602)) (currentByte!7484 thiss!1602)) lt!253631 #b00000000000000000000000000000000 (currentBit!7479 thiss!1602)))))

(declare-fun b!161064 () Bool)

(declare-fun array_inv!3310 (array!7933) Bool)

(assert (=> b!161064 (= e!110769 (array_inv!3310 (buf!4021 thiss!1602)))))

(declare-fun b!161061 () Bool)

(assert (=> b!161061 (= e!110767 (not e!110768))))

(declare-fun res!134238 () Bool)

(assert (=> b!161061 (=> res!134238 e!110768)))

(declare-fun lt!253629 () array!7933)

(declare-fun arrayRangesEq!515 (array!7933 array!7933 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161061 (= res!134238 (not (arrayRangesEq!515 (buf!4021 thiss!1602) lt!253629 #b00000000000000000000000000000000 (bvsub (currentByte!7484 (_3!544 lt!253638)) #b00000000000000000000000000000001))))))

(declare-fun lt!253633 () (_ BitVec 8))

(assert (=> b!161061 (arrayRangesEq!515 (buf!4021 thiss!1602) (array!7934 (store (arr!4484 (buf!4021 thiss!1602)) (bvsub (currentByte!7484 (_3!544 lt!253638)) #b00000000000000000000000000000001) lt!253633) (size!3563 (buf!4021 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7484 (_3!544 lt!253638)) #b00000000000000000000000000000001))))

(declare-fun lt!253637 () Unit!11022)

(declare-fun arrayUpdatedAtPrefixLemma!123 (array!7933 (_ BitVec 32) (_ BitVec 8)) Unit!11022)

(assert (=> b!161061 (= lt!253637 (arrayUpdatedAtPrefixLemma!123 (buf!4021 thiss!1602) (bvsub (currentByte!7484 (_3!544 lt!253638)) #b00000000000000000000000000000001) lt!253633))))

(assert (=> b!161061 (= lt!253633 (select (arr!4484 (buf!4021 (_3!544 lt!253638))) (bvsub (currentByte!7484 (_3!544 lt!253638)) #b00000000000000000000000000000001)))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!253634 () (_ BitVec 8))

(declare-fun lt!253632 () (_ BitVec 32))

(declare-fun lt!253636 () (_ BitVec 8))

(declare-fun lt!253630 () (_ BitVec 32))

(declare-fun Unit!11024 () Unit!11022)

(declare-fun Unit!11025 () Unit!11022)

(assert (=> b!161061 (= lt!253638 (ite (bvsgt lt!253635 #b00000000000000000000000000000000) (let ((bdg!9585 ((_ extract 7 0) (bvnot lt!253632)))) (let ((bdg!9586 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4484 (buf!4021 thiss!1602)) (currentByte!7484 thiss!1602) lt!253634) (currentByte!7484 thiss!1602) lt!253631) (bvadd #b00000000000000000000000000000001 (currentByte!7484 thiss!1602)))) ((_ sign_extend 24) bdg!9585))))) (tuple3!855 Unit!11024 bdg!9585 (BitStream!6295 (array!7934 (store (arr!4484 (array!7934 (store (arr!4484 lt!253629) (bvadd #b00000000000000000000000000000001 (currentByte!7484 thiss!1602)) bdg!9586) (size!3563 lt!253629))) (bvadd #b00000000000000000000000000000001 (currentByte!7484 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9586) (bvshl ((_ sign_extend 24) v!222) lt!253630)))) (size!3563 (array!7934 (store (arr!4484 lt!253629) (bvadd #b00000000000000000000000000000001 (currentByte!7484 thiss!1602)) bdg!9586) (size!3563 lt!253629)))) (bvadd #b00000000000000000000000000000001 (currentByte!7484 thiss!1602)) (currentBit!7479 thiss!1602))))) (tuple3!855 Unit!11025 lt!253636 (BitStream!6295 lt!253629 (bvadd #b00000000000000000000000000000001 (currentByte!7484 thiss!1602)) (currentBit!7479 thiss!1602)))))))

(assert (=> b!161061 e!110766))

(declare-fun res!134240 () Bool)

(assert (=> b!161061 (=> res!134240 e!110766)))

(assert (=> b!161061 (= res!134240 (bvsge (currentByte!7484 thiss!1602) (size!3563 (buf!4021 thiss!1602))))))

(assert (=> b!161061 (= lt!253629 (array!7934 (store (store (arr!4484 (buf!4021 thiss!1602)) (currentByte!7484 thiss!1602) lt!253634) (currentByte!7484 thiss!1602) lt!253631) (size!3563 (buf!4021 thiss!1602))))))

(assert (=> b!161061 (= lt!253631 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253634) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253635))))))

(assert (=> b!161061 (= lt!253634 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4484 (buf!4021 thiss!1602)) (currentByte!7484 thiss!1602))) lt!253632)))))

(assert (=> b!161061 (= lt!253632 ((_ sign_extend 24) lt!253636))))

(assert (=> b!161061 (= lt!253636 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!253630)))))))

(assert (=> b!161061 (= lt!253630 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253635))))))

(assert (=> b!161061 (= lt!253635 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7479 thiss!1602))))))

(assert (= (and start!33552 res!134239) b!161061))

(assert (= (and b!161061 (not res!134240)) b!161062))

(assert (= (and b!161061 (not res!134238)) b!161063))

(assert (= start!33552 b!161064))

(declare-fun m!254763 () Bool)

(assert (=> start!33552 m!254763))

(declare-fun m!254765 () Bool)

(assert (=> start!33552 m!254765))

(declare-fun m!254767 () Bool)

(assert (=> b!161062 m!254767))

(assert (=> b!161062 m!254767))

(declare-fun m!254769 () Bool)

(assert (=> b!161062 m!254769))

(declare-fun m!254771 () Bool)

(assert (=> b!161064 m!254771))

(declare-fun m!254773 () Bool)

(assert (=> b!161061 m!254773))

(declare-fun m!254775 () Bool)

(assert (=> b!161061 m!254775))

(declare-fun m!254777 () Bool)

(assert (=> b!161061 m!254777))

(declare-fun m!254779 () Bool)

(assert (=> b!161061 m!254779))

(declare-fun m!254781 () Bool)

(assert (=> b!161061 m!254781))

(assert (=> b!161061 m!254767))

(declare-fun m!254783 () Bool)

(assert (=> b!161061 m!254783))

(declare-fun m!254785 () Bool)

(assert (=> b!161061 m!254785))

(declare-fun m!254787 () Bool)

(assert (=> b!161061 m!254787))

(declare-fun m!254789 () Bool)

(assert (=> b!161061 m!254789))

(declare-fun m!254791 () Bool)

(assert (=> b!161061 m!254791))

(declare-fun m!254793 () Bool)

(assert (=> b!161061 m!254793))

(check-sat (not b!161064) (not b!161061) (not b!161062) (not start!33552))
(check-sat)
(get-model)

(declare-fun d!54985 () Bool)

(assert (=> d!54985 (= (array_inv!3310 (buf!4021 thiss!1602)) (bvsge (size!3563 (buf!4021 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!161064 d!54985))

(declare-fun d!54987 () Bool)

(declare-fun res!134276 () Bool)

(declare-fun e!110811 () Bool)

(assert (=> d!54987 (=> res!134276 e!110811)))

(assert (=> d!54987 (= res!134276 (= #b00000000000000000000000000000000 (bvsub (currentByte!7484 (_3!544 lt!253638)) #b00000000000000000000000000000001)))))

(assert (=> d!54987 (= (arrayRangesEq!515 (buf!4021 thiss!1602) lt!253629 #b00000000000000000000000000000000 (bvsub (currentByte!7484 (_3!544 lt!253638)) #b00000000000000000000000000000001)) e!110811)))

(declare-fun b!161103 () Bool)

(declare-fun e!110812 () Bool)

(assert (=> b!161103 (= e!110811 e!110812)))

(declare-fun res!134277 () Bool)

(assert (=> b!161103 (=> (not res!134277) (not e!110812))))

(assert (=> b!161103 (= res!134277 (= (select (arr!4484 (buf!4021 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4484 lt!253629) #b00000000000000000000000000000000)))))

(declare-fun b!161104 () Bool)

(assert (=> b!161104 (= e!110812 (arrayRangesEq!515 (buf!4021 thiss!1602) lt!253629 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7484 (_3!544 lt!253638)) #b00000000000000000000000000000001)))))

(assert (= (and d!54987 (not res!134276)) b!161103))

(assert (= (and b!161103 res!134277) b!161104))

(declare-fun m!254867 () Bool)

(assert (=> b!161103 m!254867))

(declare-fun m!254869 () Bool)

(assert (=> b!161103 m!254869))

(declare-fun m!254871 () Bool)

(assert (=> b!161104 m!254871))

(assert (=> b!161061 d!54987))

(declare-fun d!54989 () Bool)

(declare-fun res!134278 () Bool)

(declare-fun e!110813 () Bool)

(assert (=> d!54989 (=> res!134278 e!110813)))

(assert (=> d!54989 (= res!134278 (= #b00000000000000000000000000000000 (bvsub (currentByte!7484 (_3!544 lt!253638)) #b00000000000000000000000000000001)))))

(assert (=> d!54989 (= (arrayRangesEq!515 (buf!4021 thiss!1602) (array!7934 (store (arr!4484 (buf!4021 thiss!1602)) (bvsub (currentByte!7484 (_3!544 lt!253638)) #b00000000000000000000000000000001) lt!253633) (size!3563 (buf!4021 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7484 (_3!544 lt!253638)) #b00000000000000000000000000000001)) e!110813)))

(declare-fun b!161105 () Bool)

(declare-fun e!110814 () Bool)

(assert (=> b!161105 (= e!110813 e!110814)))

(declare-fun res!134279 () Bool)

(assert (=> b!161105 (=> (not res!134279) (not e!110814))))

(assert (=> b!161105 (= res!134279 (= (select (arr!4484 (buf!4021 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4484 (array!7934 (store (arr!4484 (buf!4021 thiss!1602)) (bvsub (currentByte!7484 (_3!544 lt!253638)) #b00000000000000000000000000000001) lt!253633) (size!3563 (buf!4021 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161106 () Bool)

(assert (=> b!161106 (= e!110814 (arrayRangesEq!515 (buf!4021 thiss!1602) (array!7934 (store (arr!4484 (buf!4021 thiss!1602)) (bvsub (currentByte!7484 (_3!544 lt!253638)) #b00000000000000000000000000000001) lt!253633) (size!3563 (buf!4021 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7484 (_3!544 lt!253638)) #b00000000000000000000000000000001)))))

(assert (= (and d!54989 (not res!134278)) b!161105))

(assert (= (and b!161105 res!134279) b!161106))

(assert (=> b!161105 m!254867))

(declare-fun m!254873 () Bool)

(assert (=> b!161105 m!254873))

(declare-fun m!254875 () Bool)

(assert (=> b!161106 m!254875))

(assert (=> b!161061 d!54989))

(declare-fun d!54991 () Bool)

(declare-fun e!110817 () Bool)

(assert (=> d!54991 e!110817))

(declare-fun res!134282 () Bool)

(assert (=> d!54991 (=> (not res!134282) (not e!110817))))

(assert (=> d!54991 (= res!134282 (and (bvsge (bvsub (currentByte!7484 (_3!544 lt!253638)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7484 (_3!544 lt!253638)) #b00000000000000000000000000000001) (size!3563 (buf!4021 thiss!1602)))))))

(declare-fun lt!253677 () Unit!11022)

(declare-fun choose!155 (array!7933 (_ BitVec 32) (_ BitVec 8)) Unit!11022)

(assert (=> d!54991 (= lt!253677 (choose!155 (buf!4021 thiss!1602) (bvsub (currentByte!7484 (_3!544 lt!253638)) #b00000000000000000000000000000001) lt!253633))))

(assert (=> d!54991 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7484 (_3!544 lt!253638)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7484 (_3!544 lt!253638)) #b00000000000000000000000000000001) (size!3563 (buf!4021 thiss!1602))))))

(assert (=> d!54991 (= (arrayUpdatedAtPrefixLemma!123 (buf!4021 thiss!1602) (bvsub (currentByte!7484 (_3!544 lt!253638)) #b00000000000000000000000000000001) lt!253633) lt!253677)))

(declare-fun b!161109 () Bool)

(assert (=> b!161109 (= e!110817 (arrayRangesEq!515 (buf!4021 thiss!1602) (array!7934 (store (arr!4484 (buf!4021 thiss!1602)) (bvsub (currentByte!7484 (_3!544 lt!253638)) #b00000000000000000000000000000001) lt!253633) (size!3563 (buf!4021 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7484 (_3!544 lt!253638)) #b00000000000000000000000000000001)))))

(assert (= (and d!54991 res!134282) b!161109))

(declare-fun m!254877 () Bool)

(assert (=> d!54991 m!254877))

(assert (=> b!161109 m!254779))

(assert (=> b!161109 m!254789))

(assert (=> b!161061 d!54991))

(declare-fun d!54993 () Bool)

(assert (=> d!54993 (= (byteRangesEq!0 (select (arr!4484 (buf!4021 thiss!1602)) (currentByte!7484 thiss!1602)) lt!253631 #b00000000000000000000000000000000 (currentBit!7479 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7479 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4484 (buf!4021 thiss!1602)) (currentByte!7484 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7479 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!253631) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7479 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13690 () Bool)

(assert (= bs!13690 d!54993))

(declare-fun m!254879 () Bool)

(assert (=> bs!13690 m!254879))

(declare-fun m!254881 () Bool)

(assert (=> bs!13690 m!254881))

(assert (=> b!161062 d!54993))

(declare-fun d!54995 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54995 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3563 (buf!4021 thiss!1602))) ((_ sign_extend 32) (currentByte!7484 thiss!1602)) ((_ sign_extend 32) (currentBit!7479 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3563 (buf!4021 thiss!1602))) ((_ sign_extend 32) (currentByte!7484 thiss!1602)) ((_ sign_extend 32) (currentBit!7479 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13691 () Bool)

(assert (= bs!13691 d!54995))

(declare-fun m!254883 () Bool)

(assert (=> bs!13691 m!254883))

(assert (=> start!33552 d!54995))

(declare-fun d!54997 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54997 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7479 thiss!1602) (currentByte!7484 thiss!1602) (size!3563 (buf!4021 thiss!1602))))))

(declare-fun bs!13692 () Bool)

(assert (= bs!13692 d!54997))

(declare-fun m!254885 () Bool)

(assert (=> bs!13692 m!254885))

(assert (=> start!33552 d!54997))

(check-sat (not d!54997) (not b!161106) (not b!161104) (not b!161109) (not d!54991) (not d!54995))
(check-sat)
(get-model)

(declare-fun d!55009 () Bool)

(declare-fun res!134287 () Bool)

(declare-fun e!110822 () Bool)

(assert (=> d!55009 (=> res!134287 e!110822)))

(assert (=> d!55009 (= res!134287 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7484 (_3!544 lt!253638)) #b00000000000000000000000000000001)))))

(assert (=> d!55009 (= (arrayRangesEq!515 (buf!4021 thiss!1602) (array!7934 (store (arr!4484 (buf!4021 thiss!1602)) (bvsub (currentByte!7484 (_3!544 lt!253638)) #b00000000000000000000000000000001) lt!253633) (size!3563 (buf!4021 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7484 (_3!544 lt!253638)) #b00000000000000000000000000000001)) e!110822)))

(declare-fun b!161114 () Bool)

(declare-fun e!110823 () Bool)

(assert (=> b!161114 (= e!110822 e!110823)))

(declare-fun res!134288 () Bool)

(assert (=> b!161114 (=> (not res!134288) (not e!110823))))

(assert (=> b!161114 (= res!134288 (= (select (arr!4484 (buf!4021 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4484 (array!7934 (store (arr!4484 (buf!4021 thiss!1602)) (bvsub (currentByte!7484 (_3!544 lt!253638)) #b00000000000000000000000000000001) lt!253633) (size!3563 (buf!4021 thiss!1602)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!161115 () Bool)

(assert (=> b!161115 (= e!110823 (arrayRangesEq!515 (buf!4021 thiss!1602) (array!7934 (store (arr!4484 (buf!4021 thiss!1602)) (bvsub (currentByte!7484 (_3!544 lt!253638)) #b00000000000000000000000000000001) lt!253633) (size!3563 (buf!4021 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7484 (_3!544 lt!253638)) #b00000000000000000000000000000001)))))

(assert (= (and d!55009 (not res!134287)) b!161114))

(assert (= (and b!161114 res!134288) b!161115))

(declare-fun m!254897 () Bool)

(assert (=> b!161114 m!254897))

(declare-fun m!254899 () Bool)

(assert (=> b!161114 m!254899))

(declare-fun m!254901 () Bool)

(assert (=> b!161115 m!254901))

(assert (=> b!161106 d!55009))

(declare-fun d!55011 () Bool)

(assert (=> d!55011 (arrayRangesEq!515 (buf!4021 thiss!1602) (array!7934 (store (arr!4484 (buf!4021 thiss!1602)) (bvsub (currentByte!7484 (_3!544 lt!253638)) #b00000000000000000000000000000001) lt!253633) (size!3563 (buf!4021 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7484 (_3!544 lt!253638)) #b00000000000000000000000000000001))))

(assert (=> d!55011 true))

(declare-fun _$8!118 () Unit!11022)

(assert (=> d!55011 (= (choose!155 (buf!4021 thiss!1602) (bvsub (currentByte!7484 (_3!544 lt!253638)) #b00000000000000000000000000000001) lt!253633) _$8!118)))

(declare-fun bs!13694 () Bool)

(assert (= bs!13694 d!55011))

(assert (=> bs!13694 m!254779))

(assert (=> bs!13694 m!254789))

(assert (=> d!54991 d!55011))

(declare-fun d!55013 () Bool)

(assert (=> d!55013 (= (invariant!0 (currentBit!7479 thiss!1602) (currentByte!7484 thiss!1602) (size!3563 (buf!4021 thiss!1602))) (and (bvsge (currentBit!7479 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7479 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7484 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7484 thiss!1602) (size!3563 (buf!4021 thiss!1602))) (and (= (currentBit!7479 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7484 thiss!1602) (size!3563 (buf!4021 thiss!1602)))))))))

(assert (=> d!54997 d!55013))

(assert (=> b!161109 d!54989))

(declare-fun d!55015 () Bool)

(assert (=> d!55015 (= (remainingBits!0 ((_ sign_extend 32) (size!3563 (buf!4021 thiss!1602))) ((_ sign_extend 32) (currentByte!7484 thiss!1602)) ((_ sign_extend 32) (currentBit!7479 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3563 (buf!4021 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7484 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7479 thiss!1602)))))))

(assert (=> d!54995 d!55015))

(declare-fun d!55017 () Bool)

(declare-fun res!134289 () Bool)

(declare-fun e!110824 () Bool)

(assert (=> d!55017 (=> res!134289 e!110824)))

(assert (=> d!55017 (= res!134289 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7484 (_3!544 lt!253638)) #b00000000000000000000000000000001)))))

(assert (=> d!55017 (= (arrayRangesEq!515 (buf!4021 thiss!1602) lt!253629 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7484 (_3!544 lt!253638)) #b00000000000000000000000000000001)) e!110824)))

(declare-fun b!161116 () Bool)

(declare-fun e!110825 () Bool)

(assert (=> b!161116 (= e!110824 e!110825)))

(declare-fun res!134290 () Bool)

(assert (=> b!161116 (=> (not res!134290) (not e!110825))))

(assert (=> b!161116 (= res!134290 (= (select (arr!4484 (buf!4021 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4484 lt!253629) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!161117 () Bool)

(assert (=> b!161117 (= e!110825 (arrayRangesEq!515 (buf!4021 thiss!1602) lt!253629 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7484 (_3!544 lt!253638)) #b00000000000000000000000000000001)))))

(assert (= (and d!55017 (not res!134289)) b!161116))

(assert (= (and b!161116 res!134290) b!161117))

(assert (=> b!161116 m!254897))

(declare-fun m!254903 () Bool)

(assert (=> b!161116 m!254903))

(declare-fun m!254905 () Bool)

(assert (=> b!161117 m!254905))

(assert (=> b!161104 d!55017))

(check-sat (not b!161115) (not b!161117) (not d!55011))
(check-sat)
