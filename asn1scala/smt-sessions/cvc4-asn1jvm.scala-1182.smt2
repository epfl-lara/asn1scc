; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33512 () Bool)

(assert start!33512)

(declare-fun res!134195 () Bool)

(declare-fun e!110712 () Bool)

(assert (=> start!33512 (=> (not res!134195) (not e!110712))))

(declare-datatypes ((array!7926 0))(
  ( (array!7927 (arr!4482 (Array (_ BitVec 32) (_ BitVec 8))) (size!3561 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6290 0))(
  ( (BitStream!6291 (buf!4019 array!7926) (currentByte!7479 (_ BitVec 32)) (currentBit!7474 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6290)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33512 (= res!134195 (validate_offset_byte!0 ((_ sign_extend 32) (size!3561 (buf!4019 thiss!1602))) ((_ sign_extend 32) (currentByte!7479 thiss!1602)) ((_ sign_extend 32) (currentBit!7474 thiss!1602))))))

(assert (=> start!33512 e!110712))

(declare-fun e!110711 () Bool)

(declare-fun inv!12 (BitStream!6290) Bool)

(assert (=> start!33512 (and (inv!12 thiss!1602) e!110711)))

(assert (=> start!33512 true))

(declare-fun b!161011 () Bool)

(declare-datatypes ((Unit!11014 0))(
  ( (Unit!11015) )
))
(declare-datatypes ((tuple3!850 0))(
  ( (tuple3!851 (_1!7776 Unit!11014) (_2!7776 (_ BitVec 8)) (_3!542 BitStream!6290)) )
))
(declare-fun lt!253567 () tuple3!850)

(assert (=> b!161011 (= e!110712 (not (or (= (bvand (currentByte!7479 (_3!542 lt!253567)) #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand (currentByte!7479 (_3!542 lt!253567)) #b10000000000000000000000000000000) (bvand (bvsub (currentByte!7479 (_3!542 lt!253567)) #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(declare-fun lt!253560 () (_ BitVec 8))

(declare-fun arrayRangesEq!513 (array!7926 array!7926 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161011 (arrayRangesEq!513 (buf!4019 thiss!1602) (array!7927 (store (arr!4482 (buf!4019 thiss!1602)) (bvsub (currentByte!7479 (_3!542 lt!253567)) #b00000000000000000000000000000001) lt!253560) (size!3561 (buf!4019 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7479 (_3!542 lt!253567)) #b00000000000000000000000000000001))))

(declare-fun lt!253561 () Unit!11014)

(declare-fun arrayUpdatedAtPrefixLemma!121 (array!7926 (_ BitVec 32) (_ BitVec 8)) Unit!11014)

(assert (=> b!161011 (= lt!253561 (arrayUpdatedAtPrefixLemma!121 (buf!4019 thiss!1602) (bvsub (currentByte!7479 (_3!542 lt!253567)) #b00000000000000000000000000000001) lt!253560))))

(assert (=> b!161011 (= lt!253560 (select (arr!4482 (buf!4019 (_3!542 lt!253567))) (bvsub (currentByte!7479 (_3!542 lt!253567)) #b00000000000000000000000000000001)))))

(declare-fun lt!253566 () (_ BitVec 32))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!253562 () (_ BitVec 32))

(declare-fun lt!253568 () (_ BitVec 8))

(declare-fun lt!253565 () array!7926)

(declare-fun lt!253569 () (_ BitVec 8))

(declare-fun lt!253563 () (_ BitVec 8))

(declare-fun lt!253564 () (_ BitVec 32))

(declare-fun Unit!11016 () Unit!11014)

(declare-fun Unit!11017 () Unit!11014)

(assert (=> b!161011 (= lt!253567 (ite (bvsgt lt!253562 #b00000000000000000000000000000000) (let ((bdg!9573 ((_ extract 7 0) (bvnot lt!253566)))) (let ((bdg!9574 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4482 (buf!4019 thiss!1602)) (currentByte!7479 thiss!1602) lt!253563) (currentByte!7479 thiss!1602) lt!253569) (bvadd #b00000000000000000000000000000001 (currentByte!7479 thiss!1602)))) ((_ sign_extend 24) bdg!9573))))) (tuple3!851 Unit!11016 bdg!9573 (BitStream!6291 (array!7927 (store (arr!4482 (array!7927 (store (arr!4482 lt!253565) (bvadd #b00000000000000000000000000000001 (currentByte!7479 thiss!1602)) bdg!9574) (size!3561 lt!253565))) (bvadd #b00000000000000000000000000000001 (currentByte!7479 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9574) (bvshl ((_ sign_extend 24) v!222) lt!253564)))) (size!3561 (array!7927 (store (arr!4482 lt!253565) (bvadd #b00000000000000000000000000000001 (currentByte!7479 thiss!1602)) bdg!9574) (size!3561 lt!253565)))) (bvadd #b00000000000000000000000000000001 (currentByte!7479 thiss!1602)) (currentBit!7474 thiss!1602))))) (tuple3!851 Unit!11017 lt!253568 (BitStream!6291 lt!253565 (bvadd #b00000000000000000000000000000001 (currentByte!7479 thiss!1602)) (currentBit!7474 thiss!1602)))))))

(declare-fun e!110710 () Bool)

(assert (=> b!161011 e!110710))

(declare-fun res!134194 () Bool)

(assert (=> b!161011 (=> res!134194 e!110710)))

(assert (=> b!161011 (= res!134194 (bvsge (currentByte!7479 thiss!1602) (size!3561 (buf!4019 thiss!1602))))))

(assert (=> b!161011 (= lt!253565 (array!7927 (store (store (arr!4482 (buf!4019 thiss!1602)) (currentByte!7479 thiss!1602) lt!253563) (currentByte!7479 thiss!1602) lt!253569) (size!3561 (buf!4019 thiss!1602))))))

(assert (=> b!161011 (= lt!253569 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253563) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253562))))))

(assert (=> b!161011 (= lt!253563 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4482 (buf!4019 thiss!1602)) (currentByte!7479 thiss!1602))) lt!253566)))))

(assert (=> b!161011 (= lt!253566 ((_ sign_extend 24) lt!253568))))

(assert (=> b!161011 (= lt!253568 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!253564)))))))

(assert (=> b!161011 (= lt!253564 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253562))))))

(assert (=> b!161011 (= lt!253562 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7474 thiss!1602))))))

(declare-fun b!161012 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161012 (= e!110710 (byteRangesEq!0 (select (arr!4482 (buf!4019 thiss!1602)) (currentByte!7479 thiss!1602)) lt!253569 #b00000000000000000000000000000000 (currentBit!7474 thiss!1602)))))

(declare-fun b!161013 () Bool)

(declare-fun array_inv!3308 (array!7926) Bool)

(assert (=> b!161013 (= e!110711 (array_inv!3308 (buf!4019 thiss!1602)))))

(assert (= (and start!33512 res!134195) b!161011))

(assert (= (and b!161011 (not res!134194)) b!161012))

(assert (= start!33512 b!161013))

(declare-fun m!254653 () Bool)

(assert (=> start!33512 m!254653))

(declare-fun m!254655 () Bool)

(assert (=> start!33512 m!254655))

(declare-fun m!254657 () Bool)

(assert (=> b!161011 m!254657))

(declare-fun m!254659 () Bool)

(assert (=> b!161011 m!254659))

(declare-fun m!254661 () Bool)

(assert (=> b!161011 m!254661))

(declare-fun m!254663 () Bool)

(assert (=> b!161011 m!254663))

(declare-fun m!254665 () Bool)

(assert (=> b!161011 m!254665))

(declare-fun m!254667 () Bool)

(assert (=> b!161011 m!254667))

(declare-fun m!254669 () Bool)

(assert (=> b!161011 m!254669))

(declare-fun m!254671 () Bool)

(assert (=> b!161011 m!254671))

(declare-fun m!254673 () Bool)

(assert (=> b!161011 m!254673))

(declare-fun m!254675 () Bool)

(assert (=> b!161011 m!254675))

(declare-fun m!254677 () Bool)

(assert (=> b!161011 m!254677))

(assert (=> b!161012 m!254675))

(assert (=> b!161012 m!254675))

(declare-fun m!254679 () Bool)

(assert (=> b!161012 m!254679))

(declare-fun m!254681 () Bool)

(assert (=> b!161013 m!254681))

(push 1)

(assert (not start!33512))

(assert (not b!161011))

(assert (not b!161012))

(assert (not b!161013))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54923 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54923 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3561 (buf!4019 thiss!1602))) ((_ sign_extend 32) (currentByte!7479 thiss!1602)) ((_ sign_extend 32) (currentBit!7474 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3561 (buf!4019 thiss!1602))) ((_ sign_extend 32) (currentByte!7479 thiss!1602)) ((_ sign_extend 32) (currentBit!7474 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13673 () Bool)

(assert (= bs!13673 d!54923))

(declare-fun m!254685 () Bool)

(assert (=> bs!13673 m!254685))

(assert (=> start!33512 d!54923))

(declare-fun d!54925 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54925 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7474 thiss!1602) (currentByte!7479 thiss!1602) (size!3561 (buf!4019 thiss!1602))))))

(declare-fun bs!13674 () Bool)

(assert (= bs!13674 d!54925))

(declare-fun m!254689 () Bool)

(assert (=> bs!13674 m!254689))

(assert (=> start!33512 d!54925))

(declare-fun d!54929 () Bool)

(declare-fun res!134200 () Bool)

(declare-fun e!110717 () Bool)

(assert (=> d!54929 (=> res!134200 e!110717)))

(assert (=> d!54929 (= res!134200 (= #b00000000000000000000000000000000 (bvsub (currentByte!7479 (_3!542 lt!253567)) #b00000000000000000000000000000001)))))

(assert (=> d!54929 (= (arrayRangesEq!513 (buf!4019 thiss!1602) (array!7927 (store (arr!4482 (buf!4019 thiss!1602)) (bvsub (currentByte!7479 (_3!542 lt!253567)) #b00000000000000000000000000000001) lt!253560) (size!3561 (buf!4019 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7479 (_3!542 lt!253567)) #b00000000000000000000000000000001)) e!110717)))

(declare-fun b!161018 () Bool)

(declare-fun e!110718 () Bool)

(assert (=> b!161018 (= e!110717 e!110718)))

(declare-fun res!134201 () Bool)

(assert (=> b!161018 (=> (not res!134201) (not e!110718))))

(assert (=> b!161018 (= res!134201 (= (select (arr!4482 (buf!4019 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4482 (array!7927 (store (arr!4482 (buf!4019 thiss!1602)) (bvsub (currentByte!7479 (_3!542 lt!253567)) #b00000000000000000000000000000001) lt!253560) (size!3561 (buf!4019 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161019 () Bool)

(assert (=> b!161019 (= e!110718 (arrayRangesEq!513 (buf!4019 thiss!1602) (array!7927 (store (arr!4482 (buf!4019 thiss!1602)) (bvsub (currentByte!7479 (_3!542 lt!253567)) #b00000000000000000000000000000001) lt!253560) (size!3561 (buf!4019 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7479 (_3!542 lt!253567)) #b00000000000000000000000000000001)))))

(assert (= (and d!54929 (not res!134200)) b!161018))

(assert (= (and b!161018 res!134201) b!161019))

(declare-fun m!254693 () Bool)

(assert (=> b!161018 m!254693))

(declare-fun m!254695 () Bool)

(assert (=> b!161018 m!254695))

(declare-fun m!254697 () Bool)

(assert (=> b!161019 m!254697))

(assert (=> b!161011 d!54929))

(declare-fun d!54933 () Bool)

(declare-fun e!110727 () Bool)

(assert (=> d!54933 e!110727))

(declare-fun res!134210 () Bool)

(assert (=> d!54933 (=> (not res!134210) (not e!110727))))

(assert (=> d!54933 (= res!134210 (and (bvsge (bvsub (currentByte!7479 (_3!542 lt!253567)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7479 (_3!542 lt!253567)) #b00000000000000000000000000000001) (size!3561 (buf!4019 thiss!1602)))))))

(declare-fun lt!253572 () Unit!11014)

(declare-fun choose!152 (array!7926 (_ BitVec 32) (_ BitVec 8)) Unit!11014)

(assert (=> d!54933 (= lt!253572 (choose!152 (buf!4019 thiss!1602) (bvsub (currentByte!7479 (_3!542 lt!253567)) #b00000000000000000000000000000001) lt!253560))))

(assert (=> d!54933 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7479 (_3!542 lt!253567)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7479 (_3!542 lt!253567)) #b00000000000000000000000000000001) (size!3561 (buf!4019 thiss!1602))))))

(assert (=> d!54933 (= (arrayUpdatedAtPrefixLemma!121 (buf!4019 thiss!1602) (bvsub (currentByte!7479 (_3!542 lt!253567)) #b00000000000000000000000000000001) lt!253560) lt!253572)))

(declare-fun b!161028 () Bool)

(assert (=> b!161028 (= e!110727 (arrayRangesEq!513 (buf!4019 thiss!1602) (array!7927 (store (arr!4482 (buf!4019 thiss!1602)) (bvsub (currentByte!7479 (_3!542 lt!253567)) #b00000000000000000000000000000001) lt!253560) (size!3561 (buf!4019 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7479 (_3!542 lt!253567)) #b00000000000000000000000000000001)))))

(assert (= (and d!54933 res!134210) b!161028))

(declare-fun m!254707 () Bool)

(assert (=> d!54933 m!254707))

(assert (=> b!161028 m!254661))

(assert (=> b!161028 m!254669))

(assert (=> b!161011 d!54933))

(declare-fun d!54939 () Bool)

