; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33670 () Bool)

(assert start!33670)

(declare-fun b!161213 () Bool)

(declare-fun e!110933 () Bool)

(declare-fun e!110934 () Bool)

(assert (=> b!161213 (= e!110933 (not e!110934))))

(declare-fun res!134377 () Bool)

(assert (=> b!161213 (=> res!134377 e!110934)))

(declare-datatypes ((array!7949 0))(
  ( (array!7950 (arr!4489 (Array (_ BitVec 32) (_ BitVec 8))) (size!3568 (_ BitVec 32))) )
))
(declare-fun lt!253807 () array!7949)

(declare-datatypes ((BitStream!6304 0))(
  ( (BitStream!6305 (buf!4026 array!7949) (currentByte!7507 (_ BitVec 32)) (currentBit!7502 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6304)

(declare-datatypes ((Unit!11042 0))(
  ( (Unit!11043) )
))
(declare-datatypes ((tuple3!864 0))(
  ( (tuple3!865 (_1!7783 Unit!11042) (_2!7783 (_ BitVec 8)) (_3!549 BitStream!6304)) )
))
(declare-fun lt!253806 () tuple3!864)

(declare-fun arrayRangesEq!520 (array!7949 array!7949 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161213 (= res!134377 (not (arrayRangesEq!520 (buf!4026 thiss!1602) lt!253807 #b00000000000000000000000000000000 (bvsub (currentByte!7507 (_3!549 lt!253806)) #b00000000000000000000000000000001))))))

(declare-fun lt!253802 () (_ BitVec 8))

(assert (=> b!161213 (arrayRangesEq!520 (buf!4026 thiss!1602) (array!7950 (store (arr!4489 (buf!4026 thiss!1602)) (bvsub (currentByte!7507 (_3!549 lt!253806)) #b00000000000000000000000000000001) lt!253802) (size!3568 (buf!4026 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7507 (_3!549 lt!253806)) #b00000000000000000000000000000001))))

(declare-fun lt!253799 () Unit!11042)

(declare-fun arrayUpdatedAtPrefixLemma!128 (array!7949 (_ BitVec 32) (_ BitVec 8)) Unit!11042)

(assert (=> b!161213 (= lt!253799 (arrayUpdatedAtPrefixLemma!128 (buf!4026 thiss!1602) (bvsub (currentByte!7507 (_3!549 lt!253806)) #b00000000000000000000000000000001) lt!253802))))

(assert (=> b!161213 (= lt!253802 (select (arr!4489 (buf!4026 (_3!549 lt!253806))) (bvsub (currentByte!7507 (_3!549 lt!253806)) #b00000000000000000000000000000001)))))

(declare-fun lt!253804 () (_ BitVec 8))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!253800 () (_ BitVec 32))

(declare-fun lt!253809 () (_ BitVec 32))

(declare-fun lt!253805 () (_ BitVec 8))

(declare-fun lt!253801 () (_ BitVec 8))

(declare-fun lt!253803 () (_ BitVec 32))

(declare-fun Unit!11044 () Unit!11042)

(declare-fun Unit!11045 () Unit!11042)

(assert (=> b!161213 (= lt!253806 (ite (bvsgt lt!253800 #b00000000000000000000000000000000) (let ((bdg!9609 ((_ extract 7 0) (bvnot lt!253803)))) (let ((bdg!9610 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4489 (buf!4026 thiss!1602)) (currentByte!7507 thiss!1602) lt!253805) (currentByte!7507 thiss!1602) lt!253804) (bvadd #b00000000000000000000000000000001 (currentByte!7507 thiss!1602)))) ((_ sign_extend 24) bdg!9609))))) (tuple3!865 Unit!11044 bdg!9609 (BitStream!6305 (array!7950 (store (arr!4489 (array!7950 (store (arr!4489 lt!253807) (bvadd #b00000000000000000000000000000001 (currentByte!7507 thiss!1602)) bdg!9610) (size!3568 lt!253807))) (bvadd #b00000000000000000000000000000001 (currentByte!7507 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9610) (bvshl ((_ sign_extend 24) v!222) lt!253809)))) (size!3568 (array!7950 (store (arr!4489 lt!253807) (bvadd #b00000000000000000000000000000001 (currentByte!7507 thiss!1602)) bdg!9610) (size!3568 lt!253807)))) (bvadd #b00000000000000000000000000000001 (currentByte!7507 thiss!1602)) (currentBit!7502 thiss!1602))))) (tuple3!865 Unit!11045 lt!253801 (BitStream!6305 lt!253807 (bvadd #b00000000000000000000000000000001 (currentByte!7507 thiss!1602)) (currentBit!7502 thiss!1602)))))))

(declare-fun e!110930 () Bool)

(assert (=> b!161213 e!110930))

(declare-fun res!134376 () Bool)

(assert (=> b!161213 (=> res!134376 e!110930)))

(assert (=> b!161213 (= res!134376 (bvsge (currentByte!7507 thiss!1602) (size!3568 (buf!4026 thiss!1602))))))

(assert (=> b!161213 (= lt!253807 (array!7950 (store (store (arr!4489 (buf!4026 thiss!1602)) (currentByte!7507 thiss!1602) lt!253805) (currentByte!7507 thiss!1602) lt!253804) (size!3568 (buf!4026 thiss!1602))))))

(assert (=> b!161213 (= lt!253804 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253805) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253800))))))

(assert (=> b!161213 (= lt!253805 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4489 (buf!4026 thiss!1602)) (currentByte!7507 thiss!1602))) lt!253803)))))

(assert (=> b!161213 (= lt!253803 ((_ sign_extend 24) lt!253801))))

(assert (=> b!161213 (= lt!253801 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!253809)))))))

(assert (=> b!161213 (= lt!253809 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253800))))))

(assert (=> b!161213 (= lt!253800 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7502 thiss!1602))))))

(declare-fun res!134378 () Bool)

(assert (=> start!33670 (=> (not res!134378) (not e!110933))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33670 (= res!134378 (validate_offset_byte!0 ((_ sign_extend 32) (size!3568 (buf!4026 thiss!1602))) ((_ sign_extend 32) (currentByte!7507 thiss!1602)) ((_ sign_extend 32) (currentBit!7502 thiss!1602))))))

(assert (=> start!33670 e!110933))

(declare-fun e!110932 () Bool)

(declare-fun inv!12 (BitStream!6304) Bool)

(assert (=> start!33670 (and (inv!12 thiss!1602) e!110932)))

(assert (=> start!33670 true))

(declare-fun b!161214 () Bool)

(assert (=> b!161214 (= e!110934 (and (bvsge (currentByte!7507 (_3!549 lt!253806)) #b00000000000000000000000000000000) (bvslt (currentByte!7507 (_3!549 lt!253806)) (size!3568 (buf!4026 (_3!549 lt!253806))))))))

(assert (=> b!161214 (arrayRangesEq!520 (buf!4026 thiss!1602) (array!7950 (store (arr!4489 (buf!4026 thiss!1602)) (currentByte!7507 (_3!549 lt!253806)) (select (arr!4489 (buf!4026 (_3!549 lt!253806))) (currentByte!7507 (_3!549 lt!253806)))) (size!3568 (buf!4026 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7507 (_3!549 lt!253806)))))

(declare-fun lt!253808 () Unit!11042)

(assert (=> b!161214 (= lt!253808 (arrayUpdatedAtPrefixLemma!128 (buf!4026 thiss!1602) (currentByte!7507 (_3!549 lt!253806)) (select (arr!4489 (buf!4026 (_3!549 lt!253806))) (currentByte!7507 (_3!549 lt!253806)))))))

(declare-fun b!161215 () Bool)

(declare-fun array_inv!3315 (array!7949) Bool)

(assert (=> b!161215 (= e!110932 (array_inv!3315 (buf!4026 thiss!1602)))))

(declare-fun b!161216 () Bool)

(declare-fun res!134375 () Bool)

(assert (=> b!161216 (=> res!134375 e!110934)))

(assert (=> b!161216 (= res!134375 (bvsle lt!253800 #b00000000000000000000000000000000))))

(declare-fun b!161217 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161217 (= e!110930 (byteRangesEq!0 (select (arr!4489 (buf!4026 thiss!1602)) (currentByte!7507 thiss!1602)) lt!253804 #b00000000000000000000000000000000 (currentBit!7502 thiss!1602)))))

(assert (= (and start!33670 res!134378) b!161213))

(assert (= (and b!161213 (not res!134376)) b!161217))

(assert (= (and b!161213 (not res!134377)) b!161216))

(assert (= (and b!161216 (not res!134375)) b!161214))

(assert (= start!33670 b!161215))

(declare-fun m!255103 () Bool)

(assert (=> b!161214 m!255103))

(declare-fun m!255105 () Bool)

(assert (=> b!161214 m!255105))

(declare-fun m!255107 () Bool)

(assert (=> b!161214 m!255107))

(assert (=> b!161214 m!255103))

(declare-fun m!255109 () Bool)

(assert (=> b!161214 m!255109))

(declare-fun m!255111 () Bool)

(assert (=> start!33670 m!255111))

(declare-fun m!255113 () Bool)

(assert (=> start!33670 m!255113))

(declare-fun m!255115 () Bool)

(assert (=> b!161217 m!255115))

(assert (=> b!161217 m!255115))

(declare-fun m!255117 () Bool)

(assert (=> b!161217 m!255117))

(declare-fun m!255119 () Bool)

(assert (=> b!161213 m!255119))

(declare-fun m!255121 () Bool)

(assert (=> b!161213 m!255121))

(declare-fun m!255123 () Bool)

(assert (=> b!161213 m!255123))

(declare-fun m!255125 () Bool)

(assert (=> b!161213 m!255125))

(declare-fun m!255127 () Bool)

(assert (=> b!161213 m!255127))

(declare-fun m!255129 () Bool)

(assert (=> b!161213 m!255129))

(declare-fun m!255131 () Bool)

(assert (=> b!161213 m!255131))

(assert (=> b!161213 m!255115))

(declare-fun m!255133 () Bool)

(assert (=> b!161213 m!255133))

(declare-fun m!255135 () Bool)

(assert (=> b!161213 m!255135))

(declare-fun m!255137 () Bool)

(assert (=> b!161213 m!255137))

(declare-fun m!255139 () Bool)

(assert (=> b!161213 m!255139))

(declare-fun m!255141 () Bool)

(assert (=> b!161215 m!255141))

(push 1)

(assert (not b!161215))

(assert (not start!33670))

(assert (not b!161217))

(assert (not b!161214))

(assert (not b!161213))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!55105 () Bool)

(assert (=> d!55105 (= (array_inv!3315 (buf!4026 thiss!1602)) (bvsge (size!3568 (buf!4026 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!161215 d!55105))

(declare-fun d!55107 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!55107 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3568 (buf!4026 thiss!1602))) ((_ sign_extend 32) (currentByte!7507 thiss!1602)) ((_ sign_extend 32) (currentBit!7502 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3568 (buf!4026 thiss!1602))) ((_ sign_extend 32) (currentByte!7507 thiss!1602)) ((_ sign_extend 32) (currentBit!7502 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13714 () Bool)

(assert (= bs!13714 d!55107))

(declare-fun m!255223 () Bool)

(assert (=> bs!13714 m!255223))

(assert (=> start!33670 d!55107))

(declare-fun d!55109 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!55109 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7502 thiss!1602) (currentByte!7507 thiss!1602) (size!3568 (buf!4026 thiss!1602))))))

(declare-fun bs!13715 () Bool)

(assert (= bs!13715 d!55109))

(declare-fun m!255225 () Bool)

(assert (=> bs!13715 m!255225))

(assert (=> start!33670 d!55109))

(declare-fun d!55111 () Bool)

(assert (=> d!55111 (= (byteRangesEq!0 (select (arr!4489 (buf!4026 thiss!1602)) (currentByte!7507 thiss!1602)) lt!253804 #b00000000000000000000000000000000 (currentBit!7502 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7502 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4489 (buf!4026 thiss!1602)) (currentByte!7507 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7502 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!253804) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7502 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13716 () Bool)

(assert (= bs!13716 d!55111))

(declare-fun m!255227 () Bool)

(assert (=> bs!13716 m!255227))

(declare-fun m!255229 () Bool)

(assert (=> bs!13716 m!255229))

(assert (=> b!161217 d!55111))

(declare-fun d!55113 () Bool)

(declare-fun res!134407 () Bool)

(declare-fun e!110969 () Bool)

(assert (=> d!55113 (=> res!134407 e!110969)))

(assert (=> d!55113 (= res!134407 (= #b00000000000000000000000000000000 (bvsub (currentByte!7507 (_3!549 lt!253806)) #b00000000000000000000000000000001)))))

(assert (=> d!55113 (= (arrayRangesEq!520 (buf!4026 thiss!1602) lt!253807 #b00000000000000000000000000000000 (bvsub (currentByte!7507 (_3!549 lt!253806)) #b00000000000000000000000000000001)) e!110969)))

(declare-fun b!161252 () Bool)

(declare-fun e!110970 () Bool)

(assert (=> b!161252 (= e!110969 e!110970)))

(declare-fun res!134408 () Bool)

(assert (=> b!161252 (=> (not res!134408) (not e!110970))))

(assert (=> b!161252 (= res!134408 (= (select (arr!4489 (buf!4026 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4489 lt!253807) #b00000000000000000000000000000000)))))

(declare-fun b!161253 () Bool)

(assert (=> b!161253 (= e!110970 (arrayRangesEq!520 (buf!4026 thiss!1602) lt!253807 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7507 (_3!549 lt!253806)) #b00000000000000000000000000000001)))))

(assert (= (and d!55113 (not res!134407)) b!161252))

(assert (= (and b!161252 res!134408) b!161253))

(declare-fun m!255231 () Bool)

(assert (=> b!161252 m!255231))

(declare-fun m!255233 () Bool)

(assert (=> b!161252 m!255233))

(declare-fun m!255235 () Bool)

(assert (=> b!161253 m!255235))

(assert (=> b!161213 d!55113))

(declare-fun d!55115 () Bool)

(declare-fun res!134409 () Bool)

(declare-fun e!110971 () Bool)

(assert (=> d!55115 (=> res!134409 e!110971)))

(assert (=> d!55115 (= res!134409 (= #b00000000000000000000000000000000 (bvsub (currentByte!7507 (_3!549 lt!253806)) #b00000000000000000000000000000001)))))

(assert (=> d!55115 (= (arrayRangesEq!520 (buf!4026 thiss!1602) (array!7950 (store (arr!4489 (buf!4026 thiss!1602)) (bvsub (currentByte!7507 (_3!549 lt!253806)) #b00000000000000000000000000000001) lt!253802) (size!3568 (buf!4026 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7507 (_3!549 lt!253806)) #b00000000000000000000000000000001)) e!110971)))

(declare-fun b!161254 () Bool)

(declare-fun e!110972 () Bool)

(assert (=> b!161254 (= e!110971 e!110972)))

(declare-fun res!134410 () Bool)

(assert (=> b!161254 (=> (not res!134410) (not e!110972))))

(assert (=> b!161254 (= res!134410 (= (select (arr!4489 (buf!4026 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4489 (array!7950 (store (arr!4489 (buf!4026 thiss!1602)) (bvsub (currentByte!7507 (_3!549 lt!253806)) #b00000000000000000000000000000001) lt!253802) (size!3568 (buf!4026 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161255 () Bool)

(assert (=> b!161255 (= e!110972 (arrayRangesEq!520 (buf!4026 thiss!1602) (array!7950 (store (arr!4489 (buf!4026 thiss!1602)) (bvsub (currentByte!7507 (_3!549 lt!253806)) #b00000000000000000000000000000001) lt!253802) (size!3568 (buf!4026 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7507 (_3!549 lt!253806)) #b00000000000000000000000000000001)))))

(assert (= (and d!55115 (not res!134409)) b!161254))

(assert (= (and b!161254 res!134410) b!161255))

(assert (=> b!161254 m!255231))

(declare-fun m!255237 () Bool)

(assert (=> b!161254 m!255237))

(declare-fun m!255239 () Bool)

(assert (=> b!161255 m!255239))

(assert (=> b!161213 d!55115))

(declare-fun d!55117 () Bool)

(declare-fun e!110975 () Bool)

(assert (=> d!55117 e!110975))

(declare-fun res!134413 () Bool)

(assert (=> d!55117 (=> (not res!134413) (not e!110975))))

(assert (=> d!55117 (= res!134413 (and (bvsge (bvsub (currentByte!7507 (_3!549 lt!253806)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7507 (_3!549 lt!253806)) #b00000000000000000000000000000001) (size!3568 (buf!4026 thiss!1602)))))))

(declare-fun lt!253878 () Unit!11042)

(declare-fun choose!159 (array!7949 (_ BitVec 32) (_ BitVec 8)) Unit!11042)

(assert (=> d!55117 (= lt!253878 (choose!159 (buf!4026 thiss!1602) (bvsub (currentByte!7507 (_3!549 lt!253806)) #b00000000000000000000000000000001) lt!253802))))

(assert (=> d!55117 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7507 (_3!549 lt!253806)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7507 (_3!549 lt!253806)) #b00000000000000000000000000000001) (size!3568 (buf!4026 thiss!1602))))))

(assert (=> d!55117 (= (arrayUpdatedAtPrefixLemma!128 (buf!4026 thiss!1602) (bvsub (currentByte!7507 (_3!549 lt!253806)) #b00000000000000000000000000000001) lt!253802) lt!253878)))

(declare-fun b!161258 () Bool)

(assert (=> b!161258 (= e!110975 (arrayRangesEq!520 (buf!4026 thiss!1602) (array!7950 (store (arr!4489 (buf!4026 thiss!1602)) (bvsub (currentByte!7507 (_3!549 lt!253806)) #b00000000000000000000000000000001) lt!253802) (size!3568 (buf!4026 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7507 (_3!549 lt!253806)) #b00000000000000000000000000000001)))))

(assert (= (and d!55117 res!134413) b!161258))

(declare-fun m!255241 () Bool)

(assert (=> d!55117 m!255241))

(assert (=> b!161258 m!255121))

(assert (=> b!161258 m!255139))

(assert (=> b!161213 d!55117))

(declare-fun d!55119 () Bool)

(declare-fun res!134414 () Bool)

(declare-fun e!110976 () Bool)

(assert (=> d!55119 (=> res!134414 e!110976)))

(assert (=> d!55119 (= res!134414 (= #b00000000000000000000000000000000 (currentByte!7507 (_3!549 lt!253806))))))

(assert (=> d!55119 (= (arrayRangesEq!520 (buf!4026 thiss!1602) (array!7950 (store (arr!4489 (buf!4026 thiss!1602)) (currentByte!7507 (_3!549 lt!253806)) (select (arr!4489 (buf!4026 (_3!549 lt!253806))) (currentByte!7507 (_3!549 lt!253806)))) (size!3568 (buf!4026 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7507 (_3!549 lt!253806))) e!110976)))

(declare-fun b!161259 () Bool)

(declare-fun e!110977 () Bool)

(assert (=> b!161259 (= e!110976 e!110977)))

(declare-fun res!134415 () Bool)

(assert (=> b!161259 (=> (not res!134415) (not e!110977))))

(assert (=> b!161259 (= res!134415 (= (select (arr!4489 (buf!4026 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4489 (array!7950 (store (arr!4489 (buf!4026 thiss!1602)) (currentByte!7507 (_3!549 lt!253806)) (select (arr!4489 (buf!4026 (_3!549 lt!253806))) (currentByte!7507 (_3!549 lt!253806)))) (size!3568 (buf!4026 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161260 () Bool)

(assert (=> b!161260 (= e!110977 (arrayRangesEq!520 (buf!4026 thiss!1602) (array!7950 (store (arr!4489 (buf!4026 thiss!1602)) (currentByte!7507 (_3!549 lt!253806)) (select (arr!4489 (buf!4026 (_3!549 lt!253806))) (currentByte!7507 (_3!549 lt!253806)))) (size!3568 (buf!4026 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7507 (_3!549 lt!253806))))))

(assert (= (and d!55119 (not res!134414)) b!161259))

(assert (= (and b!161259 res!134415) b!161260))

(assert (=> b!161259 m!255231))

(declare-fun m!255243 () Bool)

(assert (=> b!161259 m!255243))

(declare-fun m!255245 () Bool)

(assert (=> b!161260 m!255245))

(assert (=> b!161214 d!55119))

(declare-fun d!55121 () Bool)

(declare-fun e!110978 () Bool)

(assert (=> d!55121 e!110978))

(declare-fun res!134416 () Bool)

(assert (=> d!55121 (=> (not res!134416) (not e!110978))))

(assert (=> d!55121 (= res!134416 (and (bvsge (currentByte!7507 (_3!549 lt!253806)) #b00000000000000000000000000000000) (bvslt (currentByte!7507 (_3!549 lt!253806)) (size!3568 (buf!4026 thiss!1602)))))))

(declare-fun lt!253879 () Unit!11042)

(assert (=> d!55121 (= lt!253879 (choose!159 (buf!4026 thiss!1602) (currentByte!7507 (_3!549 lt!253806)) (select (arr!4489 (buf!4026 (_3!549 lt!253806))) (currentByte!7507 (_3!549 lt!253806)))))))

(assert (=> d!55121 (and (bvsle #b00000000000000000000000000000000 (currentByte!7507 (_3!549 lt!253806))) (bvslt (currentByte!7507 (_3!549 lt!253806)) (size!3568 (buf!4026 thiss!1602))))))

(assert (=> d!55121 (= (arrayUpdatedAtPrefixLemma!128 (buf!4026 thiss!1602) (currentByte!7507 (_3!549 lt!253806)) (select (arr!4489 (buf!4026 (_3!549 lt!253806))) (currentByte!7507 (_3!549 lt!253806)))) lt!253879)))

(declare-fun b!161261 () Bool)

(assert (=> b!161261 (= e!110978 (arrayRangesEq!520 (buf!4026 thiss!1602) (array!7950 (store (arr!4489 (buf!4026 thiss!1602)) (currentByte!7507 (_3!549 lt!253806)) (select (arr!4489 (buf!4026 (_3!549 lt!253806))) (currentByte!7507 (_3!549 lt!253806)))) (size!3568 (buf!4026 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7507 (_3!549 lt!253806))))))

(assert (= (and d!55121 res!134416) b!161261))

(assert (=> d!55121 m!255103))

(declare-fun m!255247 () Bool)

(assert (=> d!55121 m!255247))

(assert (=> b!161261 m!255105))

(assert (=> b!161261 m!255107))

(assert (=> b!161214 d!55121))

(push 1)

(assert (not d!55121))

(assert (not b!161258))

(assert (not b!161255))

(assert (not d!55117))

(assert (not d!55107))

(assert (not b!161253))

(assert (not b!161260))

(assert (not d!55109))

(assert (not b!161261))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

