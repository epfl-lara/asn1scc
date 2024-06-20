; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33818 () Bool)

(assert start!33818)

(declare-fun b!161588 () Bool)

(declare-fun e!111308 () Bool)

(declare-datatypes ((array!7989 0))(
  ( (array!7990 (arr!4504 (Array (_ BitVec 32) (_ BitVec 8))) (size!3583 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6334 0))(
  ( (BitStream!6335 (buf!4041 array!7989) (currentByte!7532 (_ BitVec 32)) (currentBit!7527 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6334)

(declare-fun lt!254374 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161588 (= e!111308 (byteRangesEq!0 (select (arr!4504 (buf!4041 thiss!1602)) (currentByte!7532 thiss!1602)) lt!254374 #b00000000000000000000000000000000 (currentBit!7527 thiss!1602)))))

(declare-fun b!161589 () Bool)

(declare-fun e!111306 () Bool)

(declare-fun array_inv!3330 (array!7989) Bool)

(assert (=> b!161589 (= e!111306 (array_inv!3330 (buf!4041 thiss!1602)))))

(declare-fun res!134707 () Bool)

(declare-fun e!111305 () Bool)

(assert (=> start!33818 (=> (not res!134707) (not e!111305))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33818 (= res!134707 (validate_offset_byte!0 ((_ sign_extend 32) (size!3583 (buf!4041 thiss!1602))) ((_ sign_extend 32) (currentByte!7532 thiss!1602)) ((_ sign_extend 32) (currentBit!7527 thiss!1602))))))

(assert (=> start!33818 e!111305))

(declare-fun inv!12 (BitStream!6334) Bool)

(assert (=> start!33818 (and (inv!12 thiss!1602) e!111306)))

(assert (=> start!33818 true))

(declare-fun b!161590 () Bool)

(declare-fun res!134705 () Bool)

(declare-fun e!111307 () Bool)

(assert (=> b!161590 (=> res!134705 e!111307)))

(declare-fun lt!254368 () (_ BitVec 32))

(assert (=> b!161590 (= res!134705 (bvsle lt!254368 #b00000000000000000000000000000000))))

(declare-fun b!161591 () Bool)

(assert (=> b!161591 (= e!111305 (not e!111307))))

(declare-fun res!134706 () Bool)

(assert (=> b!161591 (=> res!134706 e!111307)))

(declare-datatypes ((Unit!11102 0))(
  ( (Unit!11103) )
))
(declare-datatypes ((tuple3!894 0))(
  ( (tuple3!895 (_1!7798 Unit!11102) (_2!7798 (_ BitVec 8)) (_3!564 BitStream!6334)) )
))
(declare-fun lt!254376 () tuple3!894)

(declare-fun lt!254373 () array!7989)

(declare-fun arrayRangesEq!535 (array!7989 array!7989 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161591 (= res!134706 (not (arrayRangesEq!535 (buf!4041 thiss!1602) lt!254373 #b00000000000000000000000000000000 (bvsub (currentByte!7532 (_3!564 lt!254376)) #b00000000000000000000000000000001))))))

(declare-fun lt!254366 () (_ BitVec 8))

(assert (=> b!161591 (arrayRangesEq!535 (buf!4041 thiss!1602) (array!7990 (store (arr!4504 (buf!4041 thiss!1602)) (bvsub (currentByte!7532 (_3!564 lt!254376)) #b00000000000000000000000000000001) lt!254366) (size!3583 (buf!4041 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7532 (_3!564 lt!254376)) #b00000000000000000000000000000001))))

(declare-fun lt!254370 () Unit!11102)

(declare-fun arrayUpdatedAtPrefixLemma!143 (array!7989 (_ BitVec 32) (_ BitVec 8)) Unit!11102)

(assert (=> b!161591 (= lt!254370 (arrayUpdatedAtPrefixLemma!143 (buf!4041 thiss!1602) (bvsub (currentByte!7532 (_3!564 lt!254376)) #b00000000000000000000000000000001) lt!254366))))

(assert (=> b!161591 (= lt!254366 (select (arr!4504 (buf!4041 (_3!564 lt!254376))) (bvsub (currentByte!7532 (_3!564 lt!254376)) #b00000000000000000000000000000001)))))

(declare-fun lt!254375 () (_ BitVec 8))

(declare-fun lt!254372 () (_ BitVec 32))

(declare-fun lt!254371 () (_ BitVec 8))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!254369 () (_ BitVec 32))

(declare-fun Unit!11104 () Unit!11102)

(declare-fun Unit!11105 () Unit!11102)

(assert (=> b!161591 (= lt!254376 (ite (bvsgt lt!254368 #b00000000000000000000000000000000) (let ((bdg!9677 ((_ extract 7 0) (bvnot lt!254372)))) (let ((bdg!9678 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4504 (buf!4041 thiss!1602)) (currentByte!7532 thiss!1602) lt!254371) (currentByte!7532 thiss!1602) lt!254374) (bvadd #b00000000000000000000000000000001 (currentByte!7532 thiss!1602)))) ((_ sign_extend 24) bdg!9677))))) (tuple3!895 Unit!11104 bdg!9677 (BitStream!6335 (array!7990 (store (arr!4504 (array!7990 (store (arr!4504 lt!254373) (bvadd #b00000000000000000000000000000001 (currentByte!7532 thiss!1602)) bdg!9678) (size!3583 lt!254373))) (bvadd #b00000000000000000000000000000001 (currentByte!7532 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9678) (bvshl ((_ sign_extend 24) v!222) lt!254369)))) (size!3583 (array!7990 (store (arr!4504 lt!254373) (bvadd #b00000000000000000000000000000001 (currentByte!7532 thiss!1602)) bdg!9678) (size!3583 lt!254373)))) (bvadd #b00000000000000000000000000000001 (currentByte!7532 thiss!1602)) (currentBit!7527 thiss!1602))))) (tuple3!895 Unit!11105 lt!254375 (BitStream!6335 lt!254373 (bvadd #b00000000000000000000000000000001 (currentByte!7532 thiss!1602)) (currentBit!7527 thiss!1602)))))))

(assert (=> b!161591 e!111308))

(declare-fun res!134708 () Bool)

(assert (=> b!161591 (=> res!134708 e!111308)))

(assert (=> b!161591 (= res!134708 (bvsge (currentByte!7532 thiss!1602) (size!3583 (buf!4041 thiss!1602))))))

(assert (=> b!161591 (= lt!254373 (array!7990 (store (store (arr!4504 (buf!4041 thiss!1602)) (currentByte!7532 thiss!1602) lt!254371) (currentByte!7532 thiss!1602) lt!254374) (size!3583 (buf!4041 thiss!1602))))))

(assert (=> b!161591 (= lt!254374 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!254371) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!254368))))))

(assert (=> b!161591 (= lt!254371 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4504 (buf!4041 thiss!1602)) (currentByte!7532 thiss!1602))) lt!254372)))))

(assert (=> b!161591 (= lt!254372 ((_ sign_extend 24) lt!254375))))

(assert (=> b!161591 (= lt!254375 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!254369)))))))

(assert (=> b!161591 (= lt!254369 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!254368))))))

(assert (=> b!161591 (= lt!254368 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7527 thiss!1602))))))

(declare-fun b!161592 () Bool)

(assert (=> b!161592 (= e!111307 (or (bvsgt #b00000000000000000000000000000000 (bvsub (currentByte!7532 (_3!564 lt!254376)) #b00000000000000000000000000000001)) (bvsgt (bvsub (currentByte!7532 (_3!564 lt!254376)) #b00000000000000000000000000000001) (currentByte!7532 (_3!564 lt!254376))) (bvsgt (size!3583 (buf!4041 thiss!1602)) (size!3583 (buf!4041 (_3!564 lt!254376)))) (and (bvsle (bvsub (currentByte!7532 (_3!564 lt!254376)) #b00000000000000000000000000000001) (size!3583 (buf!4041 thiss!1602))) (bvsle (currentByte!7532 (_3!564 lt!254376)) (size!3583 (buf!4041 thiss!1602))))))))

(assert (=> b!161592 (arrayRangesEq!535 lt!254373 (array!7990 (store (store (store (arr!4504 (buf!4041 thiss!1602)) (currentByte!7532 thiss!1602) lt!254371) (currentByte!7532 thiss!1602) lt!254374) (currentByte!7532 (_3!564 lt!254376)) (select (arr!4504 (buf!4041 (_3!564 lt!254376))) (currentByte!7532 (_3!564 lt!254376)))) (size!3583 (buf!4041 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7532 (_3!564 lt!254376)))))

(declare-fun lt!254365 () Unit!11102)

(assert (=> b!161592 (= lt!254365 (arrayUpdatedAtPrefixLemma!143 lt!254373 (currentByte!7532 (_3!564 lt!254376)) (select (arr!4504 (buf!4041 (_3!564 lt!254376))) (currentByte!7532 (_3!564 lt!254376)))))))

(assert (=> b!161592 (arrayRangesEq!535 (buf!4041 thiss!1602) (array!7990 (store (arr!4504 (buf!4041 thiss!1602)) (currentByte!7532 (_3!564 lt!254376)) (select (arr!4504 (buf!4041 (_3!564 lt!254376))) (currentByte!7532 (_3!564 lt!254376)))) (size!3583 (buf!4041 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7532 (_3!564 lt!254376)))))

(declare-fun lt!254367 () Unit!11102)

(assert (=> b!161592 (= lt!254367 (arrayUpdatedAtPrefixLemma!143 (buf!4041 thiss!1602) (currentByte!7532 (_3!564 lt!254376)) (select (arr!4504 (buf!4041 (_3!564 lt!254376))) (currentByte!7532 (_3!564 lt!254376)))))))

(assert (= (and start!33818 res!134707) b!161591))

(assert (= (and b!161591 (not res!134708)) b!161588))

(assert (= (and b!161591 (not res!134706)) b!161590))

(assert (= (and b!161590 (not res!134705)) b!161592))

(assert (= start!33818 b!161589))

(declare-fun m!256059 () Bool)

(assert (=> start!33818 m!256059))

(declare-fun m!256061 () Bool)

(assert (=> start!33818 m!256061))

(declare-fun m!256063 () Bool)

(assert (=> b!161588 m!256063))

(assert (=> b!161588 m!256063))

(declare-fun m!256065 () Bool)

(assert (=> b!161588 m!256065))

(declare-fun m!256067 () Bool)

(assert (=> b!161592 m!256067))

(declare-fun m!256069 () Bool)

(assert (=> b!161592 m!256069))

(declare-fun m!256071 () Bool)

(assert (=> b!161592 m!256071))

(declare-fun m!256073 () Bool)

(assert (=> b!161592 m!256073))

(assert (=> b!161592 m!256069))

(declare-fun m!256075 () Bool)

(assert (=> b!161592 m!256075))

(declare-fun m!256077 () Bool)

(assert (=> b!161592 m!256077))

(assert (=> b!161592 m!256069))

(declare-fun m!256079 () Bool)

(assert (=> b!161592 m!256079))

(declare-fun m!256081 () Bool)

(assert (=> b!161592 m!256081))

(declare-fun m!256083 () Bool)

(assert (=> b!161592 m!256083))

(declare-fun m!256085 () Bool)

(assert (=> b!161589 m!256085))

(declare-fun m!256087 () Bool)

(assert (=> b!161591 m!256087))

(declare-fun m!256089 () Bool)

(assert (=> b!161591 m!256089))

(declare-fun m!256091 () Bool)

(assert (=> b!161591 m!256091))

(declare-fun m!256093 () Bool)

(assert (=> b!161591 m!256093))

(assert (=> b!161591 m!256063))

(declare-fun m!256095 () Bool)

(assert (=> b!161591 m!256095))

(declare-fun m!256097 () Bool)

(assert (=> b!161591 m!256097))

(declare-fun m!256099 () Bool)

(assert (=> b!161591 m!256099))

(declare-fun m!256101 () Bool)

(assert (=> b!161591 m!256101))

(assert (=> b!161591 m!256077))

(assert (=> b!161591 m!256081))

(declare-fun m!256103 () Bool)

(assert (=> b!161591 m!256103))

(push 1)

(assert (not b!161591))

(assert (not b!161592))

(assert (not b!161589))

(assert (not start!33818))

(assert (not b!161588))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!55311 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!55311 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3583 (buf!4041 thiss!1602))) ((_ sign_extend 32) (currentByte!7532 thiss!1602)) ((_ sign_extend 32) (currentBit!7527 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3583 (buf!4041 thiss!1602))) ((_ sign_extend 32) (currentByte!7532 thiss!1602)) ((_ sign_extend 32) (currentBit!7527 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13759 () Bool)

(assert (= bs!13759 d!55311))

(declare-fun m!256197 () Bool)

(assert (=> bs!13759 m!256197))

(assert (=> start!33818 d!55311))

(declare-fun d!55313 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!55313 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7527 thiss!1602) (currentByte!7532 thiss!1602) (size!3583 (buf!4041 thiss!1602))))))

(declare-fun bs!13760 () Bool)

(assert (= bs!13760 d!55313))

(declare-fun m!256199 () Bool)

(assert (=> bs!13760 m!256199))

(assert (=> start!33818 d!55313))

(declare-fun d!55315 () Bool)

(assert (=> d!55315 (= (array_inv!3330 (buf!4041 thiss!1602)) (bvsge (size!3583 (buf!4041 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!161589 d!55315))

(declare-fun d!55317 () Bool)

(assert (=> d!55317 (= (byteRangesEq!0 (select (arr!4504 (buf!4041 thiss!1602)) (currentByte!7532 thiss!1602)) lt!254374 #b00000000000000000000000000000000 (currentBit!7527 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7527 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4504 (buf!4041 thiss!1602)) (currentByte!7532 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7527 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!254374) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7527 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13761 () Bool)

(assert (= bs!13761 d!55317))

(declare-fun m!256201 () Bool)

(assert (=> bs!13761 m!256201))

(declare-fun m!256203 () Bool)

(assert (=> bs!13761 m!256203))

(assert (=> b!161588 d!55317))

(declare-fun d!55319 () Bool)

(declare-fun res!134737 () Bool)

(declare-fun e!111344 () Bool)

(assert (=> d!55319 (=> res!134737 e!111344)))

(assert (=> d!55319 (= res!134737 (= #b00000000000000000000000000000000 (bvsub (currentByte!7532 (_3!564 lt!254376)) #b00000000000000000000000000000001)))))

(assert (=> d!55319 (= (arrayRangesEq!535 (buf!4041 thiss!1602) lt!254373 #b00000000000000000000000000000000 (bvsub (currentByte!7532 (_3!564 lt!254376)) #b00000000000000000000000000000001)) e!111344)))

(declare-fun b!161627 () Bool)

(declare-fun e!111345 () Bool)

(assert (=> b!161627 (= e!111344 e!111345)))

(declare-fun res!134738 () Bool)

(assert (=> b!161627 (=> (not res!134738) (not e!111345))))

(assert (=> b!161627 (= res!134738 (= (select (arr!4504 (buf!4041 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4504 lt!254373) #b00000000000000000000000000000000)))))

(declare-fun b!161628 () Bool)

(assert (=> b!161628 (= e!111345 (arrayRangesEq!535 (buf!4041 thiss!1602) lt!254373 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7532 (_3!564 lt!254376)) #b00000000000000000000000000000001)))))

(assert (= (and d!55319 (not res!134737)) b!161627))

(assert (= (and b!161627 res!134738) b!161628))

(declare-fun m!256205 () Bool)

(assert (=> b!161627 m!256205))

(declare-fun m!256207 () Bool)

(assert (=> b!161627 m!256207))

(declare-fun m!256209 () Bool)

(assert (=> b!161628 m!256209))

(assert (=> b!161591 d!55319))

(declare-fun d!55321 () Bool)

(declare-fun res!134739 () Bool)

(declare-fun e!111346 () Bool)

(assert (=> d!55321 (=> res!134739 e!111346)))

(assert (=> d!55321 (= res!134739 (= #b00000000000000000000000000000000 (bvsub (currentByte!7532 (_3!564 lt!254376)) #b00000000000000000000000000000001)))))

(assert (=> d!55321 (= (arrayRangesEq!535 (buf!4041 thiss!1602) (array!7990 (store (arr!4504 (buf!4041 thiss!1602)) (bvsub (currentByte!7532 (_3!564 lt!254376)) #b00000000000000000000000000000001) lt!254366) (size!3583 (buf!4041 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7532 (_3!564 lt!254376)) #b00000000000000000000000000000001)) e!111346)))

(declare-fun b!161629 () Bool)

(declare-fun e!111347 () Bool)

(assert (=> b!161629 (= e!111346 e!111347)))

(declare-fun res!134740 () Bool)

(assert (=> b!161629 (=> (not res!134740) (not e!111347))))

(assert (=> b!161629 (= res!134740 (= (select (arr!4504 (buf!4041 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4504 (array!7990 (store (arr!4504 (buf!4041 thiss!1602)) (bvsub (currentByte!7532 (_3!564 lt!254376)) #b00000000000000000000000000000001) lt!254366) (size!3583 (buf!4041 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161630 () Bool)

(assert (=> b!161630 (= e!111347 (arrayRangesEq!535 (buf!4041 thiss!1602) (array!7990 (store (arr!4504 (buf!4041 thiss!1602)) (bvsub (currentByte!7532 (_3!564 lt!254376)) #b00000000000000000000000000000001) lt!254366) (size!3583 (buf!4041 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7532 (_3!564 lt!254376)) #b00000000000000000000000000000001)))))

(assert (= (and d!55321 (not res!134739)) b!161629))

(assert (= (and b!161629 res!134740) b!161630))

(assert (=> b!161629 m!256205))

(declare-fun m!256211 () Bool)

(assert (=> b!161629 m!256211))

(declare-fun m!256213 () Bool)

(assert (=> b!161630 m!256213))

(assert (=> b!161591 d!55321))

(declare-fun d!55323 () Bool)

(declare-fun e!111356 () Bool)

(assert (=> d!55323 e!111356))

(declare-fun res!134749 () Bool)

(assert (=> d!55323 (=> (not res!134749) (not e!111356))))

(assert (=> d!55323 (= res!134749 (and (bvsge (bvsub (currentByte!7532 (_3!564 lt!254376)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7532 (_3!564 lt!254376)) #b00000000000000000000000000000001) (size!3583 (buf!4041 thiss!1602)))))))

(declare-fun lt!254451 () Unit!11102)

(declare-fun choose!167 (array!7989 (_ BitVec 32) (_ BitVec 8)) Unit!11102)

(assert (=> d!55323 (= lt!254451 (choose!167 (buf!4041 thiss!1602) (bvsub (currentByte!7532 (_3!564 lt!254376)) #b00000000000000000000000000000001) lt!254366))))

(assert (=> d!55323 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7532 (_3!564 lt!254376)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7532 (_3!564 lt!254376)) #b00000000000000000000000000000001) (size!3583 (buf!4041 thiss!1602))))))

(assert (=> d!55323 (= (arrayUpdatedAtPrefixLemma!143 (buf!4041 thiss!1602) (bvsub (currentByte!7532 (_3!564 lt!254376)) #b00000000000000000000000000000001) lt!254366) lt!254451)))

(declare-fun b!161639 () Bool)

(assert (=> b!161639 (= e!111356 (arrayRangesEq!535 (buf!4041 thiss!1602) (array!7990 (store (arr!4504 (buf!4041 thiss!1602)) (bvsub (currentByte!7532 (_3!564 lt!254376)) #b00000000000000000000000000000001) lt!254366) (size!3583 (buf!4041 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7532 (_3!564 lt!254376)) #b00000000000000000000000000000001)))))

(assert (= (and d!55323 res!134749) b!161639))

(declare-fun m!256221 () Bool)

(assert (=> d!55323 m!256221))

(assert (=> b!161639 m!256099))

(assert (=> b!161639 m!256101))

(assert (=> b!161591 d!55323))

(declare-fun d!55331 () Bool)

(declare-fun res!134750 () Bool)

(declare-fun e!111357 () Bool)

(assert (=> d!55331 (=> res!134750 e!111357)))

(assert (=> d!55331 (= res!134750 (= #b00000000000000000000000000000000 (currentByte!7532 (_3!564 lt!254376))))))

(assert (=> d!55331 (= (arrayRangesEq!535 lt!254373 (array!7990 (store (store (store (arr!4504 (buf!4041 thiss!1602)) (currentByte!7532 thiss!1602) lt!254371) (currentByte!7532 thiss!1602) lt!254374) (currentByte!7532 (_3!564 lt!254376)) (select (arr!4504 (buf!4041 (_3!564 lt!254376))) (currentByte!7532 (_3!564 lt!254376)))) (size!3583 (buf!4041 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7532 (_3!564 lt!254376))) e!111357)))

(declare-fun b!161640 () Bool)

(declare-fun e!111358 () Bool)

(assert (=> b!161640 (= e!111357 e!111358)))

(declare-fun res!134751 () Bool)

(assert (=> b!161640 (=> (not res!134751) (not e!111358))))

(assert (=> b!161640 (= res!134751 (= (select (arr!4504 lt!254373) #b00000000000000000000000000000000) (select (arr!4504 (array!7990 (store (store (store (arr!4504 (buf!4041 thiss!1602)) (currentByte!7532 thiss!1602) lt!254371) (currentByte!7532 thiss!1602) lt!254374) (currentByte!7532 (_3!564 lt!254376)) (select (arr!4504 (buf!4041 (_3!564 lt!254376))) (currentByte!7532 (_3!564 lt!254376)))) (size!3583 (buf!4041 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161641 () Bool)

(assert (=> b!161641 (= e!111358 (arrayRangesEq!535 lt!254373 (array!7990 (store (store (store (arr!4504 (buf!4041 thiss!1602)) (currentByte!7532 thiss!1602) lt!254371) (currentByte!7532 thiss!1602) lt!254374) (currentByte!7532 (_3!564 lt!254376)) (select (arr!4504 (buf!4041 (_3!564 lt!254376))) (currentByte!7532 (_3!564 lt!254376)))) (size!3583 (buf!4041 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7532 (_3!564 lt!254376))))))

(assert (= (and d!55331 (not res!134750)) b!161640))

(assert (= (and b!161640 res!134751) b!161641))

(assert (=> b!161640 m!256207))

(declare-fun m!256223 () Bool)

(assert (=> b!161640 m!256223))

(declare-fun m!256225 () Bool)

(assert (=> b!161641 m!256225))

(assert (=> b!161592 d!55331))

(declare-fun d!55333 () Bool)

(declare-fun e!111359 () Bool)

(assert (=> d!55333 e!111359))

(declare-fun res!134752 () Bool)

(assert (=> d!55333 (=> (not res!134752) (not e!111359))))

(assert (=> d!55333 (= res!134752 (and (bvsge (currentByte!7532 (_3!564 lt!254376)) #b00000000000000000000000000000000) (bvslt (currentByte!7532 (_3!564 lt!254376)) (size!3583 lt!254373))))))

(declare-fun lt!254452 () Unit!11102)

(assert (=> d!55333 (= lt!254452 (choose!167 lt!254373 (currentByte!7532 (_3!564 lt!254376)) (select (arr!4504 (buf!4041 (_3!564 lt!254376))) (currentByte!7532 (_3!564 lt!254376)))))))

(assert (=> d!55333 (and (bvsle #b00000000000000000000000000000000 (currentByte!7532 (_3!564 lt!254376))) (bvslt (currentByte!7532 (_3!564 lt!254376)) (size!3583 lt!254373)))))

(assert (=> d!55333 (= (arrayUpdatedAtPrefixLemma!143 lt!254373 (currentByte!7532 (_3!564 lt!254376)) (select (arr!4504 (buf!4041 (_3!564 lt!254376))) (currentByte!7532 (_3!564 lt!254376)))) lt!254452)))

(declare-fun b!161642 () Bool)

(assert (=> b!161642 (= e!111359 (arrayRangesEq!535 lt!254373 (array!7990 (store (arr!4504 lt!254373) (currentByte!7532 (_3!564 lt!254376)) (select (arr!4504 (buf!4041 (_3!564 lt!254376))) (currentByte!7532 (_3!564 lt!254376)))) (size!3583 lt!254373)) #b00000000000000000000000000000000 (currentByte!7532 (_3!564 lt!254376))))))

(assert (= (and d!55333 res!134752) b!161642))

(assert (=> d!55333 m!256069))

(declare-fun m!256227 () Bool)

(assert (=> d!55333 m!256227))

(declare-fun m!256229 () Bool)

(assert (=> b!161642 m!256229))

(declare-fun m!256231 () Bool)

(assert (=> b!161642 m!256231))

(assert (=> b!161592 d!55333))

(declare-fun d!55335 () Bool)

(declare-fun res!134753 () Bool)

(declare-fun e!111360 () Bool)

(assert (=> d!55335 (=> res!134753 e!111360)))

(assert (=> d!55335 (= res!134753 (= #b00000000000000000000000000000000 (currentByte!7532 (_3!564 lt!254376))))))

(assert (=> d!55335 (= (arrayRangesEq!535 (buf!4041 thiss!1602) (array!7990 (store (arr!4504 (buf!4041 thiss!1602)) (currentByte!7532 (_3!564 lt!254376)) (select (arr!4504 (buf!4041 (_3!564 lt!254376))) (currentByte!7532 (_3!564 lt!254376)))) (size!3583 (buf!4041 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7532 (_3!564 lt!254376))) e!111360)))

(declare-fun b!161643 () Bool)

(declare-fun e!111361 () Bool)

(assert (=> b!161643 (= e!111360 e!111361)))

(declare-fun res!134754 () Bool)

(assert (=> b!161643 (=> (not res!134754) (not e!111361))))

(assert (=> b!161643 (= res!134754 (= (select (arr!4504 (buf!4041 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4504 (array!7990 (store (arr!4504 (buf!4041 thiss!1602)) (currentByte!7532 (_3!564 lt!254376)) (select (arr!4504 (buf!4041 (_3!564 lt!254376))) (currentByte!7532 (_3!564 lt!254376)))) (size!3583 (buf!4041 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161644 () Bool)

(assert (=> b!161644 (= e!111361 (arrayRangesEq!535 (buf!4041 thiss!1602) (array!7990 (store (arr!4504 (buf!4041 thiss!1602)) (currentByte!7532 (_3!564 lt!254376)) (select (arr!4504 (buf!4041 (_3!564 lt!254376))) (currentByte!7532 (_3!564 lt!254376)))) (size!3583 (buf!4041 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7532 (_3!564 lt!254376))))))

(assert (= (and d!55335 (not res!134753)) b!161643))

(assert (= (and b!161643 res!134754) b!161644))

(assert (=> b!161643 m!256205))

(declare-fun m!256233 () Bool)

(assert (=> b!161643 m!256233))

(declare-fun m!256235 () Bool)

(assert (=> b!161644 m!256235))

(assert (=> b!161592 d!55335))

(declare-fun d!55337 () Bool)

(declare-fun e!111362 () Bool)

(assert (=> d!55337 e!111362))

(declare-fun res!134755 () Bool)

(assert (=> d!55337 (=> (not res!134755) (not e!111362))))

(assert (=> d!55337 (= res!134755 (and (bvsge (currentByte!7532 (_3!564 lt!254376)) #b00000000000000000000000000000000) (bvslt (currentByte!7532 (_3!564 lt!254376)) (size!3583 (buf!4041 thiss!1602)))))))

(declare-fun lt!254453 () Unit!11102)

(assert (=> d!55337 (= lt!254453 (choose!167 (buf!4041 thiss!1602) (currentByte!7532 (_3!564 lt!254376)) (select (arr!4504 (buf!4041 (_3!564 lt!254376))) (currentByte!7532 (_3!564 lt!254376)))))))

(assert (=> d!55337 (and (bvsle #b00000000000000000000000000000000 (currentByte!7532 (_3!564 lt!254376))) (bvslt (currentByte!7532 (_3!564 lt!254376)) (size!3583 (buf!4041 thiss!1602))))))

(assert (=> d!55337 (= (arrayUpdatedAtPrefixLemma!143 (buf!4041 thiss!1602) (currentByte!7532 (_3!564 lt!254376)) (select (arr!4504 (buf!4041 (_3!564 lt!254376))) (currentByte!7532 (_3!564 lt!254376)))) lt!254453)))

(declare-fun b!161645 () Bool)

(assert (=> b!161645 (= e!111362 (arrayRangesEq!535 (buf!4041 thiss!1602) (array!7990 (store (arr!4504 (buf!4041 thiss!1602)) (currentByte!7532 (_3!564 lt!254376)) (select (arr!4504 (buf!4041 (_3!564 lt!254376))) (currentByte!7532 (_3!564 lt!254376)))) (size!3583 (buf!4041 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7532 (_3!564 lt!254376))))))

(assert (= (and d!55337 res!134755) b!161645))

(assert (=> d!55337 m!256069))

(declare-fun m!256237 () Bool)

(assert (=> d!55337 m!256237))

(assert (=> b!161645 m!256079))

(assert (=> b!161645 m!256067))

(assert (=> b!161592 d!55337))

(push 1)

(assert (not b!161642))

(assert (not d!55333))

(assert (not d!55311))

(assert (not b!161644))

(assert (not d!55337))

(assert (not d!55313))

(assert (not b!161645))

(assert (not b!161639))

(assert (not b!161641))

(assert (not d!55323))

(assert (not b!161630))

(assert (not b!161628))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

