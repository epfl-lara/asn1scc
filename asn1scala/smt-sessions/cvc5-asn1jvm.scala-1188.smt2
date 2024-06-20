; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33770 () Bool)

(assert start!33770)

(declare-fun b!161447 () Bool)

(declare-fun e!111168 () Bool)

(declare-datatypes ((array!7974 0))(
  ( (array!7975 (arr!4498 (Array (_ BitVec 32) (_ BitVec 8))) (size!3577 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6322 0))(
  ( (BitStream!6323 (buf!4035 array!7974) (currentByte!7523 (_ BitVec 32)) (currentBit!7518 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6322)

(declare-fun lt!254139 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161447 (= e!111168 (byteRangesEq!0 (select (arr!4498 (buf!4035 thiss!1602)) (currentByte!7523 thiss!1602)) lt!254139 #b00000000000000000000000000000000 (currentBit!7518 thiss!1602)))))

(declare-fun b!161448 () Bool)

(declare-fun e!111166 () Bool)

(declare-datatypes ((Unit!11078 0))(
  ( (Unit!11079) )
))
(declare-datatypes ((tuple3!882 0))(
  ( (tuple3!883 (_1!7792 Unit!11078) (_2!7792 (_ BitVec 8)) (_3!558 BitStream!6322)) )
))
(declare-fun lt!254137 () tuple3!882)

(assert (=> b!161448 (= e!111166 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7523 (_3!558 lt!254137)) #b00000000000000000000000000000001)) (bvsle (bvsub (currentByte!7523 (_3!558 lt!254137)) #b00000000000000000000000000000001) (currentByte!7523 (_3!558 lt!254137)))))))

(declare-fun lt!254135 () (_ BitVec 8))

(declare-fun lt!254142 () array!7974)

(declare-fun arrayRangesEq!529 (array!7974 array!7974 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161448 (arrayRangesEq!529 lt!254142 (array!7975 (store (store (store (arr!4498 (buf!4035 thiss!1602)) (currentByte!7523 thiss!1602) lt!254135) (currentByte!7523 thiss!1602) lt!254139) (currentByte!7523 (_3!558 lt!254137)) (select (arr!4498 (buf!4035 (_3!558 lt!254137))) (currentByte!7523 (_3!558 lt!254137)))) (size!3577 (buf!4035 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7523 (_3!558 lt!254137)))))

(declare-fun lt!254145 () Unit!11078)

(declare-fun arrayUpdatedAtPrefixLemma!137 (array!7974 (_ BitVec 32) (_ BitVec 8)) Unit!11078)

(assert (=> b!161448 (= lt!254145 (arrayUpdatedAtPrefixLemma!137 lt!254142 (currentByte!7523 (_3!558 lt!254137)) (select (arr!4498 (buf!4035 (_3!558 lt!254137))) (currentByte!7523 (_3!558 lt!254137)))))))

(assert (=> b!161448 (arrayRangesEq!529 (buf!4035 thiss!1602) (array!7975 (store (arr!4498 (buf!4035 thiss!1602)) (currentByte!7523 (_3!558 lt!254137)) (select (arr!4498 (buf!4035 (_3!558 lt!254137))) (currentByte!7523 (_3!558 lt!254137)))) (size!3577 (buf!4035 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7523 (_3!558 lt!254137)))))

(declare-fun lt!254144 () Unit!11078)

(assert (=> b!161448 (= lt!254144 (arrayUpdatedAtPrefixLemma!137 (buf!4035 thiss!1602) (currentByte!7523 (_3!558 lt!254137)) (select (arr!4498 (buf!4035 (_3!558 lt!254137))) (currentByte!7523 (_3!558 lt!254137)))))))

(declare-fun b!161449 () Bool)

(declare-fun e!111164 () Bool)

(declare-fun array_inv!3324 (array!7974) Bool)

(assert (=> b!161449 (= e!111164 (array_inv!3324 (buf!4035 thiss!1602)))))

(declare-fun b!161451 () Bool)

(declare-fun res!134582 () Bool)

(assert (=> b!161451 (=> res!134582 e!111166)))

(declare-fun lt!254138 () (_ BitVec 32))

(assert (=> b!161451 (= res!134582 (bvsle lt!254138 #b00000000000000000000000000000000))))

(declare-fun b!161450 () Bool)

(declare-fun e!111165 () Bool)

(assert (=> b!161450 (= e!111165 (not e!111166))))

(declare-fun res!134584 () Bool)

(assert (=> b!161450 (=> res!134584 e!111166)))

(assert (=> b!161450 (= res!134584 (not (arrayRangesEq!529 (buf!4035 thiss!1602) lt!254142 #b00000000000000000000000000000000 (bvsub (currentByte!7523 (_3!558 lt!254137)) #b00000000000000000000000000000001))))))

(declare-fun lt!254140 () (_ BitVec 8))

(assert (=> b!161450 (arrayRangesEq!529 (buf!4035 thiss!1602) (array!7975 (store (arr!4498 (buf!4035 thiss!1602)) (bvsub (currentByte!7523 (_3!558 lt!254137)) #b00000000000000000000000000000001) lt!254140) (size!3577 (buf!4035 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7523 (_3!558 lt!254137)) #b00000000000000000000000000000001))))

(declare-fun lt!254136 () Unit!11078)

(assert (=> b!161450 (= lt!254136 (arrayUpdatedAtPrefixLemma!137 (buf!4035 thiss!1602) (bvsub (currentByte!7523 (_3!558 lt!254137)) #b00000000000000000000000000000001) lt!254140))))

(assert (=> b!161450 (= lt!254140 (select (arr!4498 (buf!4035 (_3!558 lt!254137))) (bvsub (currentByte!7523 (_3!558 lt!254137)) #b00000000000000000000000000000001)))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!254143 () (_ BitVec 32))

(declare-fun lt!254134 () (_ BitVec 8))

(declare-fun lt!254141 () (_ BitVec 32))

(declare-fun Unit!11080 () Unit!11078)

(declare-fun Unit!11081 () Unit!11078)

(assert (=> b!161450 (= lt!254137 (ite (bvsgt lt!254138 #b00000000000000000000000000000000) (let ((bdg!9649 ((_ extract 7 0) (bvnot lt!254143)))) (let ((bdg!9650 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4498 (buf!4035 thiss!1602)) (currentByte!7523 thiss!1602) lt!254135) (currentByte!7523 thiss!1602) lt!254139) (bvadd #b00000000000000000000000000000001 (currentByte!7523 thiss!1602)))) ((_ sign_extend 24) bdg!9649))))) (tuple3!883 Unit!11080 bdg!9649 (BitStream!6323 (array!7975 (store (arr!4498 (array!7975 (store (arr!4498 lt!254142) (bvadd #b00000000000000000000000000000001 (currentByte!7523 thiss!1602)) bdg!9650) (size!3577 lt!254142))) (bvadd #b00000000000000000000000000000001 (currentByte!7523 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9650) (bvshl ((_ sign_extend 24) v!222) lt!254141)))) (size!3577 (array!7975 (store (arr!4498 lt!254142) (bvadd #b00000000000000000000000000000001 (currentByte!7523 thiss!1602)) bdg!9650) (size!3577 lt!254142)))) (bvadd #b00000000000000000000000000000001 (currentByte!7523 thiss!1602)) (currentBit!7518 thiss!1602))))) (tuple3!883 Unit!11081 lt!254134 (BitStream!6323 lt!254142 (bvadd #b00000000000000000000000000000001 (currentByte!7523 thiss!1602)) (currentBit!7518 thiss!1602)))))))

(assert (=> b!161450 e!111168))

(declare-fun res!134583 () Bool)

(assert (=> b!161450 (=> res!134583 e!111168)))

(assert (=> b!161450 (= res!134583 (bvsge (currentByte!7523 thiss!1602) (size!3577 (buf!4035 thiss!1602))))))

(assert (=> b!161450 (= lt!254142 (array!7975 (store (store (arr!4498 (buf!4035 thiss!1602)) (currentByte!7523 thiss!1602) lt!254135) (currentByte!7523 thiss!1602) lt!254139) (size!3577 (buf!4035 thiss!1602))))))

(assert (=> b!161450 (= lt!254139 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!254135) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!254138))))))

(assert (=> b!161450 (= lt!254135 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4498 (buf!4035 thiss!1602)) (currentByte!7523 thiss!1602))) lt!254143)))))

(assert (=> b!161450 (= lt!254143 ((_ sign_extend 24) lt!254134))))

(assert (=> b!161450 (= lt!254134 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!254141)))))))

(assert (=> b!161450 (= lt!254141 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!254138))))))

(assert (=> b!161450 (= lt!254138 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7518 thiss!1602))))))

(declare-fun res!134585 () Bool)

(assert (=> start!33770 (=> (not res!134585) (not e!111165))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33770 (= res!134585 (validate_offset_byte!0 ((_ sign_extend 32) (size!3577 (buf!4035 thiss!1602))) ((_ sign_extend 32) (currentByte!7523 thiss!1602)) ((_ sign_extend 32) (currentBit!7518 thiss!1602))))))

(assert (=> start!33770 e!111165))

(declare-fun inv!12 (BitStream!6322) Bool)

(assert (=> start!33770 (and (inv!12 thiss!1602) e!111164)))

(assert (=> start!33770 true))

(assert (= (and start!33770 res!134585) b!161450))

(assert (= (and b!161450 (not res!134583)) b!161447))

(assert (= (and b!161450 (not res!134584)) b!161451))

(assert (= (and b!161451 (not res!134582)) b!161448))

(assert (= start!33770 b!161449))

(declare-fun m!255675 () Bool)

(assert (=> b!161449 m!255675))

(declare-fun m!255677 () Bool)

(assert (=> b!161448 m!255677))

(declare-fun m!255679 () Bool)

(assert (=> b!161448 m!255679))

(declare-fun m!255681 () Bool)

(assert (=> b!161448 m!255681))

(declare-fun m!255683 () Bool)

(assert (=> b!161448 m!255683))

(assert (=> b!161448 m!255679))

(declare-fun m!255685 () Bool)

(assert (=> b!161448 m!255685))

(declare-fun m!255687 () Bool)

(assert (=> b!161448 m!255687))

(assert (=> b!161448 m!255679))

(declare-fun m!255689 () Bool)

(assert (=> b!161448 m!255689))

(declare-fun m!255691 () Bool)

(assert (=> b!161448 m!255691))

(declare-fun m!255693 () Bool)

(assert (=> b!161448 m!255693))

(declare-fun m!255695 () Bool)

(assert (=> start!33770 m!255695))

(declare-fun m!255697 () Bool)

(assert (=> start!33770 m!255697))

(assert (=> b!161450 m!255691))

(declare-fun m!255699 () Bool)

(assert (=> b!161450 m!255699))

(declare-fun m!255701 () Bool)

(assert (=> b!161450 m!255701))

(declare-fun m!255703 () Bool)

(assert (=> b!161450 m!255703))

(declare-fun m!255705 () Bool)

(assert (=> b!161450 m!255705))

(declare-fun m!255707 () Bool)

(assert (=> b!161450 m!255707))

(declare-fun m!255709 () Bool)

(assert (=> b!161450 m!255709))

(assert (=> b!161450 m!255683))

(declare-fun m!255711 () Bool)

(assert (=> b!161450 m!255711))

(declare-fun m!255713 () Bool)

(assert (=> b!161450 m!255713))

(declare-fun m!255715 () Bool)

(assert (=> b!161450 m!255715))

(declare-fun m!255717 () Bool)

(assert (=> b!161450 m!255717))

(assert (=> b!161447 m!255711))

(assert (=> b!161447 m!255711))

(declare-fun m!255719 () Bool)

(assert (=> b!161447 m!255719))

(push 1)

(assert (not b!161448))

(assert (not b!161450))

(assert (not b!161449))

(assert (not b!161447))

(assert (not start!33770))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!55241 () Bool)

(declare-fun res!134614 () Bool)

(declare-fun e!111203 () Bool)

(assert (=> d!55241 (=> res!134614 e!111203)))

(assert (=> d!55241 (= res!134614 (= #b00000000000000000000000000000000 (bvsub (currentByte!7523 (_3!558 lt!254137)) #b00000000000000000000000000000001)))))

(assert (=> d!55241 (= (arrayRangesEq!529 (buf!4035 thiss!1602) lt!254142 #b00000000000000000000000000000000 (bvsub (currentByte!7523 (_3!558 lt!254137)) #b00000000000000000000000000000001)) e!111203)))

(declare-fun b!161486 () Bool)

(declare-fun e!111204 () Bool)

(assert (=> b!161486 (= e!111203 e!111204)))

(declare-fun res!134615 () Bool)

(assert (=> b!161486 (=> (not res!134615) (not e!111204))))

(assert (=> b!161486 (= res!134615 (= (select (arr!4498 (buf!4035 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4498 lt!254142) #b00000000000000000000000000000000)))))

(declare-fun b!161487 () Bool)

(assert (=> b!161487 (= e!111204 (arrayRangesEq!529 (buf!4035 thiss!1602) lt!254142 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7523 (_3!558 lt!254137)) #b00000000000000000000000000000001)))))

(assert (= (and d!55241 (not res!134614)) b!161486))

(assert (= (and b!161486 res!134615) b!161487))

(declare-fun m!255813 () Bool)

(assert (=> b!161486 m!255813))

(declare-fun m!255815 () Bool)

(assert (=> b!161486 m!255815))

(declare-fun m!255817 () Bool)

(assert (=> b!161487 m!255817))

(assert (=> b!161450 d!55241))

(declare-fun d!55243 () Bool)

(declare-fun res!134616 () Bool)

(declare-fun e!111205 () Bool)

(assert (=> d!55243 (=> res!134616 e!111205)))

(assert (=> d!55243 (= res!134616 (= #b00000000000000000000000000000000 (bvsub (currentByte!7523 (_3!558 lt!254137)) #b00000000000000000000000000000001)))))

(assert (=> d!55243 (= (arrayRangesEq!529 (buf!4035 thiss!1602) (array!7975 (store (arr!4498 (buf!4035 thiss!1602)) (bvsub (currentByte!7523 (_3!558 lt!254137)) #b00000000000000000000000000000001) lt!254140) (size!3577 (buf!4035 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7523 (_3!558 lt!254137)) #b00000000000000000000000000000001)) e!111205)))

(declare-fun b!161488 () Bool)

(declare-fun e!111206 () Bool)

(assert (=> b!161488 (= e!111205 e!111206)))

(declare-fun res!134617 () Bool)

(assert (=> b!161488 (=> (not res!134617) (not e!111206))))

(assert (=> b!161488 (= res!134617 (= (select (arr!4498 (buf!4035 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4498 (array!7975 (store (arr!4498 (buf!4035 thiss!1602)) (bvsub (currentByte!7523 (_3!558 lt!254137)) #b00000000000000000000000000000001) lt!254140) (size!3577 (buf!4035 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161489 () Bool)

(assert (=> b!161489 (= e!111206 (arrayRangesEq!529 (buf!4035 thiss!1602) (array!7975 (store (arr!4498 (buf!4035 thiss!1602)) (bvsub (currentByte!7523 (_3!558 lt!254137)) #b00000000000000000000000000000001) lt!254140) (size!3577 (buf!4035 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7523 (_3!558 lt!254137)) #b00000000000000000000000000000001)))))

(assert (= (and d!55243 (not res!134616)) b!161488))

(assert (= (and b!161488 res!134617) b!161489))

(assert (=> b!161488 m!255813))

(declare-fun m!255819 () Bool)

(assert (=> b!161488 m!255819))

(declare-fun m!255821 () Bool)

(assert (=> b!161489 m!255821))

(assert (=> b!161450 d!55243))

(declare-fun d!55245 () Bool)

(declare-fun e!111209 () Bool)

(assert (=> d!55245 e!111209))

(declare-fun res!134620 () Bool)

(assert (=> d!55245 (=> (not res!134620) (not e!111209))))

(assert (=> d!55245 (= res!134620 (and (bvsge (bvsub (currentByte!7523 (_3!558 lt!254137)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7523 (_3!558 lt!254137)) #b00000000000000000000000000000001) (size!3577 (buf!4035 thiss!1602)))))))

(declare-fun lt!254220 () Unit!11078)

(declare-fun choose!164 (array!7974 (_ BitVec 32) (_ BitVec 8)) Unit!11078)

(assert (=> d!55245 (= lt!254220 (choose!164 (buf!4035 thiss!1602) (bvsub (currentByte!7523 (_3!558 lt!254137)) #b00000000000000000000000000000001) lt!254140))))

(assert (=> d!55245 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7523 (_3!558 lt!254137)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7523 (_3!558 lt!254137)) #b00000000000000000000000000000001) (size!3577 (buf!4035 thiss!1602))))))

(assert (=> d!55245 (= (arrayUpdatedAtPrefixLemma!137 (buf!4035 thiss!1602) (bvsub (currentByte!7523 (_3!558 lt!254137)) #b00000000000000000000000000000001) lt!254140) lt!254220)))

(declare-fun b!161492 () Bool)

(assert (=> b!161492 (= e!111209 (arrayRangesEq!529 (buf!4035 thiss!1602) (array!7975 (store (arr!4498 (buf!4035 thiss!1602)) (bvsub (currentByte!7523 (_3!558 lt!254137)) #b00000000000000000000000000000001) lt!254140) (size!3577 (buf!4035 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7523 (_3!558 lt!254137)) #b00000000000000000000000000000001)))))

(assert (= (and d!55245 res!134620) b!161492))

(declare-fun m!255823 () Bool)

(assert (=> d!55245 m!255823))

(assert (=> b!161492 m!255717))

(assert (=> b!161492 m!255703))

(assert (=> b!161450 d!55245))

(declare-fun d!55247 () Bool)

(assert (=> d!55247 (= (array_inv!3324 (buf!4035 thiss!1602)) (bvsge (size!3577 (buf!4035 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!161449 d!55247))

(declare-fun d!55249 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!55249 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3577 (buf!4035 thiss!1602))) ((_ sign_extend 32) (currentByte!7523 thiss!1602)) ((_ sign_extend 32) (currentBit!7518 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3577 (buf!4035 thiss!1602))) ((_ sign_extend 32) (currentByte!7523 thiss!1602)) ((_ sign_extend 32) (currentBit!7518 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13744 () Bool)

(assert (= bs!13744 d!55249))

(declare-fun m!255825 () Bool)

(assert (=> bs!13744 m!255825))

(assert (=> start!33770 d!55249))

(declare-fun d!55251 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!55251 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7518 thiss!1602) (currentByte!7523 thiss!1602) (size!3577 (buf!4035 thiss!1602))))))

(declare-fun bs!13745 () Bool)

(assert (= bs!13745 d!55251))

(declare-fun m!255827 () Bool)

(assert (=> bs!13745 m!255827))

(assert (=> start!33770 d!55251))

(declare-fun d!55253 () Bool)

(declare-fun res!134621 () Bool)

(declare-fun e!111210 () Bool)

(assert (=> d!55253 (=> res!134621 e!111210)))

(assert (=> d!55253 (= res!134621 (= #b00000000000000000000000000000000 (currentByte!7523 (_3!558 lt!254137))))))

(assert (=> d!55253 (= (arrayRangesEq!529 lt!254142 (array!7975 (store (store (store (arr!4498 (buf!4035 thiss!1602)) (currentByte!7523 thiss!1602) lt!254135) (currentByte!7523 thiss!1602) lt!254139) (currentByte!7523 (_3!558 lt!254137)) (select (arr!4498 (buf!4035 (_3!558 lt!254137))) (currentByte!7523 (_3!558 lt!254137)))) (size!3577 (buf!4035 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7523 (_3!558 lt!254137))) e!111210)))

(declare-fun b!161493 () Bool)

(declare-fun e!111211 () Bool)

(assert (=> b!161493 (= e!111210 e!111211)))

(declare-fun res!134622 () Bool)

(assert (=> b!161493 (=> (not res!134622) (not e!111211))))

(assert (=> b!161493 (= res!134622 (= (select (arr!4498 lt!254142) #b00000000000000000000000000000000) (select (arr!4498 (array!7975 (store (store (store (arr!4498 (buf!4035 thiss!1602)) (currentByte!7523 thiss!1602) lt!254135) (currentByte!7523 thiss!1602) lt!254139) (currentByte!7523 (_3!558 lt!254137)) (select (arr!4498 (buf!4035 (_3!558 lt!254137))) (currentByte!7523 (_3!558 lt!254137)))) (size!3577 (buf!4035 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161494 () Bool)

(assert (=> b!161494 (= e!111211 (arrayRangesEq!529 lt!254142 (array!7975 (store (store (store (arr!4498 (buf!4035 thiss!1602)) (currentByte!7523 thiss!1602) lt!254135) (currentByte!7523 thiss!1602) lt!254139) (currentByte!7523 (_3!558 lt!254137)) (select (arr!4498 (buf!4035 (_3!558 lt!254137))) (currentByte!7523 (_3!558 lt!254137)))) (size!3577 (buf!4035 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7523 (_3!558 lt!254137))))))

(assert (= (and d!55253 (not res!134621)) b!161493))

(assert (= (and b!161493 res!134622) b!161494))

(assert (=> b!161493 m!255815))

(declare-fun m!255829 () Bool)

(assert (=> b!161493 m!255829))

(declare-fun m!255831 () Bool)

(assert (=> b!161494 m!255831))

(assert (=> b!161448 d!55253))

(declare-fun d!55255 () Bool)

(declare-fun e!111212 () Bool)

(assert (=> d!55255 e!111212))

(declare-fun res!134623 () Bool)

(assert (=> d!55255 (=> (not res!134623) (not e!111212))))

(assert (=> d!55255 (= res!134623 (and (bvsge (currentByte!7523 (_3!558 lt!254137)) #b00000000000000000000000000000000) (bvslt (currentByte!7523 (_3!558 lt!254137)) (size!3577 lt!254142))))))

(declare-fun lt!254221 () Unit!11078)

(assert (=> d!55255 (= lt!254221 (choose!164 lt!254142 (currentByte!7523 (_3!558 lt!254137)) (select (arr!4498 (buf!4035 (_3!558 lt!254137))) (currentByte!7523 (_3!558 lt!254137)))))))

(assert (=> d!55255 (and (bvsle #b00000000000000000000000000000000 (currentByte!7523 (_3!558 lt!254137))) (bvslt (currentByte!7523 (_3!558 lt!254137)) (size!3577 lt!254142)))))

(assert (=> d!55255 (= (arrayUpdatedAtPrefixLemma!137 lt!254142 (currentByte!7523 (_3!558 lt!254137)) (select (arr!4498 (buf!4035 (_3!558 lt!254137))) (currentByte!7523 (_3!558 lt!254137)))) lt!254221)))

(declare-fun b!161495 () Bool)

(assert (=> b!161495 (= e!111212 (arrayRangesEq!529 lt!254142 (array!7975 (store (arr!4498 lt!254142) (currentByte!7523 (_3!558 lt!254137)) (select (arr!4498 (buf!4035 (_3!558 lt!254137))) (currentByte!7523 (_3!558 lt!254137)))) (size!3577 lt!254142)) #b00000000000000000000000000000000 (currentByte!7523 (_3!558 lt!254137))))))

(assert (= (and d!55255 res!134623) b!161495))

(assert (=> d!55255 m!255679))

(declare-fun m!255833 () Bool)

(assert (=> d!55255 m!255833))

(declare-fun m!255835 () Bool)

(assert (=> b!161495 m!255835))

(declare-fun m!255837 () Bool)

(assert (=> b!161495 m!255837))

(assert (=> b!161448 d!55255))

(declare-fun d!55257 () Bool)

(declare-fun res!134624 () Bool)

(declare-fun e!111213 () Bool)

(assert (=> d!55257 (=> res!134624 e!111213)))

(assert (=> d!55257 (= res!134624 (= #b00000000000000000000000000000000 (currentByte!7523 (_3!558 lt!254137))))))

(assert (=> d!55257 (= (arrayRangesEq!529 (buf!4035 thiss!1602) (array!7975 (store (arr!4498 (buf!4035 thiss!1602)) (currentByte!7523 (_3!558 lt!254137)) (select (arr!4498 (buf!4035 (_3!558 lt!254137))) (currentByte!7523 (_3!558 lt!254137)))) (size!3577 (buf!4035 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7523 (_3!558 lt!254137))) e!111213)))

(declare-fun b!161496 () Bool)

(declare-fun e!111214 () Bool)

(assert (=> b!161496 (= e!111213 e!111214)))

(declare-fun res!134625 () Bool)

(assert (=> b!161496 (=> (not res!134625) (not e!111214))))

(assert (=> b!161496 (= res!134625 (= (select (arr!4498 (buf!4035 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4498 (array!7975 (store (arr!4498 (buf!4035 thiss!1602)) (currentByte!7523 (_3!558 lt!254137)) (select (arr!4498 (buf!4035 (_3!558 lt!254137))) (currentByte!7523 (_3!558 lt!254137)))) (size!3577 (buf!4035 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161497 () Bool)

(assert (=> b!161497 (= e!111214 (arrayRangesEq!529 (buf!4035 thiss!1602) (array!7975 (store (arr!4498 (buf!4035 thiss!1602)) (currentByte!7523 (_3!558 lt!254137)) (select (arr!4498 (buf!4035 (_3!558 lt!254137))) (currentByte!7523 (_3!558 lt!254137)))) (size!3577 (buf!4035 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7523 (_3!558 lt!254137))))))

(assert (= (and d!55257 (not res!134624)) b!161496))

(assert (= (and b!161496 res!134625) b!161497))

(assert (=> b!161496 m!255813))

(declare-fun m!255839 () Bool)

(assert (=> b!161496 m!255839))

(declare-fun m!255841 () Bool)

(assert (=> b!161497 m!255841))

(assert (=> b!161448 d!55257))

(declare-fun d!55259 () Bool)

(declare-fun e!111215 () Bool)

(assert (=> d!55259 e!111215))

(declare-fun res!134626 () Bool)

(assert (=> d!55259 (=> (not res!134626) (not e!111215))))

(assert (=> d!55259 (= res!134626 (and (bvsge (currentByte!7523 (_3!558 lt!254137)) #b00000000000000000000000000000000) (bvslt (currentByte!7523 (_3!558 lt!254137)) (size!3577 (buf!4035 thiss!1602)))))))

(declare-fun lt!254222 () Unit!11078)

(assert (=> d!55259 (= lt!254222 (choose!164 (buf!4035 thiss!1602) (currentByte!7523 (_3!558 lt!254137)) (select (arr!4498 (buf!4035 (_3!558 lt!254137))) (currentByte!7523 (_3!558 lt!254137)))))))

(assert (=> d!55259 (and (bvsle #b00000000000000000000000000000000 (currentByte!7523 (_3!558 lt!254137))) (bvslt (currentByte!7523 (_3!558 lt!254137)) (size!3577 (buf!4035 thiss!1602))))))

(assert (=> d!55259 (= (arrayUpdatedAtPrefixLemma!137 (buf!4035 thiss!1602) (currentByte!7523 (_3!558 lt!254137)) (select (arr!4498 (buf!4035 (_3!558 lt!254137))) (currentByte!7523 (_3!558 lt!254137)))) lt!254222)))

(declare-fun b!161498 () Bool)

(assert (=> b!161498 (= e!111215 (arrayRangesEq!529 (buf!4035 thiss!1602) (array!7975 (store (arr!4498 (buf!4035 thiss!1602)) (currentByte!7523 (_3!558 lt!254137)) (select (arr!4498 (buf!4035 (_3!558 lt!254137))) (currentByte!7523 (_3!558 lt!254137)))) (size!3577 (buf!4035 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7523 (_3!558 lt!254137))))))

(assert (= (and d!55259 res!134626) b!161498))

(assert (=> d!55259 m!255679))

(declare-fun m!255843 () Bool)

(assert (=> d!55259 m!255843))

(assert (=> b!161498 m!255687))

(assert (=> b!161498 m!255677))

(assert (=> b!161448 d!55259))

(declare-fun d!55261 () Bool)

(assert (=> d!55261 (= (byteRangesEq!0 (select (arr!4498 (buf!4035 thiss!1602)) (currentByte!7523 thiss!1602)) lt!254139 #b00000000000000000000000000000000 (currentBit!7518 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7518 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4498 (buf!4035 thiss!1602)) (currentByte!7523 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7518 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!254139) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7518 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13746 () Bool)

(assert (= bs!13746 d!55261))

(declare-fun m!255845 () Bool)

(assert (=> bs!13746 m!255845))

(declare-fun m!255847 () Bool)

(assert (=> bs!13746 m!255847))

(assert (=> b!161447 d!55261))

(push 1)

(assert (not d!55251))

(assert (not d!55245))

(assert (not b!161489))

(assert (not b!161498))

(assert (not b!161497))

(assert (not d!55255))

(assert (not b!161495))

(assert (not b!161494))

(assert (not b!161492))

(assert (not d!55249))

(assert (not d!55259))

(assert (not b!161487))

(check-sat)

(pop 1)

(push 1)

(check-sat)

