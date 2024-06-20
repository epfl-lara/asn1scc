; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32216 () Bool)

(assert start!32216)

(declare-fun b!159386 () Bool)

(declare-fun e!108819 () Bool)

(declare-datatypes ((array!7582 0))(
  ( (array!7583 (arr!4356 (Array (_ BitVec 32) (_ BitVec 8))) (size!3435 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6038 0))(
  ( (BitStream!6039 (buf!3893 array!7582) (currentByte!7121 (_ BitVec 32)) (currentBit!7116 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6038)

(declare-fun array_inv!3182 (array!7582) Bool)

(assert (=> b!159386 (= e!108819 (array_inv!3182 (buf!3893 thiss!1602)))))

(declare-fun b!159387 () Bool)

(declare-fun e!108820 () Bool)

(declare-fun e!108822 () Bool)

(assert (=> b!159387 (= e!108820 (not e!108822))))

(declare-fun res!133037 () Bool)

(assert (=> b!159387 (=> res!133037 e!108822)))

(declare-datatypes ((Unit!10831 0))(
  ( (Unit!10832) )
))
(declare-datatypes ((tuple3!772 0))(
  ( (tuple3!773 (_1!7734 Unit!10831) (_2!7734 (_ BitVec 8)) (_3!503 BitStream!6038)) )
))
(declare-fun lt!251616 () tuple3!772)

(declare-fun lt!251626 () array!7582)

(declare-fun arrayRangesEq!486 (array!7582 array!7582 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159387 (= res!133037 (not (arrayRangesEq!486 (buf!3893 thiss!1602) lt!251626 #b00000000000000000000000000000000 (bvsub (currentByte!7121 (_3!503 lt!251616)) #b00000000000000000000000000000001))))))

(declare-fun lt!251623 () (_ BitVec 8))

(assert (=> b!159387 (arrayRangesEq!486 (buf!3893 thiss!1602) (array!7583 (store (arr!4356 (buf!3893 thiss!1602)) (bvsub (currentByte!7121 (_3!503 lt!251616)) #b00000000000000000000000000000001) lt!251623) (size!3435 (buf!3893 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7121 (_3!503 lt!251616)) #b00000000000000000000000000000001))))

(declare-fun lt!251625 () Unit!10831)

(declare-fun arrayUpdatedAtPrefixLemma!94 (array!7582 (_ BitVec 32) (_ BitVec 8)) Unit!10831)

(assert (=> b!159387 (= lt!251625 (arrayUpdatedAtPrefixLemma!94 (buf!3893 thiss!1602) (bvsub (currentByte!7121 (_3!503 lt!251616)) #b00000000000000000000000000000001) lt!251623))))

(assert (=> b!159387 (= lt!251623 (select (arr!4356 (buf!3893 (_3!503 lt!251616))) (bvsub (currentByte!7121 (_3!503 lt!251616)) #b00000000000000000000000000000001)))))

(declare-fun lt!251620 () (_ BitVec 32))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!251628 () (_ BitVec 32))

(declare-fun lt!251621 () (_ BitVec 32))

(declare-fun lt!251627 () (_ BitVec 8))

(declare-fun lt!251617 () (_ BitVec 8))

(declare-fun lt!251622 () (_ BitVec 8))

(declare-fun Unit!10833 () Unit!10831)

(declare-fun Unit!10834 () Unit!10831)

(assert (=> b!159387 (= lt!251616 (ite (bvsgt lt!251628 #b00000000000000000000000000000000) (let ((bdg!9365 ((_ extract 7 0) (bvnot lt!251620)))) (let ((bdg!9366 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4356 (buf!3893 thiss!1602)) (currentByte!7121 thiss!1602) lt!251622) (currentByte!7121 thiss!1602) lt!251627) (bvadd #b00000000000000000000000000000001 (currentByte!7121 thiss!1602)))) ((_ sign_extend 24) bdg!9365))))) (tuple3!773 Unit!10833 bdg!9365 (BitStream!6039 (array!7583 (store (arr!4356 (array!7583 (store (arr!4356 lt!251626) (bvadd #b00000000000000000000000000000001 (currentByte!7121 thiss!1602)) bdg!9366) (size!3435 lt!251626))) (bvadd #b00000000000000000000000000000001 (currentByte!7121 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9366) (bvshl ((_ sign_extend 24) v!222) lt!251621)))) (size!3435 (array!7583 (store (arr!4356 lt!251626) (bvadd #b00000000000000000000000000000001 (currentByte!7121 thiss!1602)) bdg!9366) (size!3435 lt!251626)))) (bvadd #b00000000000000000000000000000001 (currentByte!7121 thiss!1602)) (currentBit!7116 thiss!1602))))) (tuple3!773 Unit!10834 lt!251617 (BitStream!6039 lt!251626 (bvadd #b00000000000000000000000000000001 (currentByte!7121 thiss!1602)) (currentBit!7116 thiss!1602)))))))

(declare-fun e!108821 () Bool)

(assert (=> b!159387 e!108821))

(declare-fun res!133038 () Bool)

(assert (=> b!159387 (=> res!133038 e!108821)))

(assert (=> b!159387 (= res!133038 (bvsge (currentByte!7121 thiss!1602) (size!3435 (buf!3893 thiss!1602))))))

(assert (=> b!159387 (= lt!251626 (array!7583 (store (store (arr!4356 (buf!3893 thiss!1602)) (currentByte!7121 thiss!1602) lt!251622) (currentByte!7121 thiss!1602) lt!251627) (size!3435 (buf!3893 thiss!1602))))))

(assert (=> b!159387 (= lt!251627 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!251622) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!251628))))))

(assert (=> b!159387 (= lt!251622 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4356 (buf!3893 thiss!1602)) (currentByte!7121 thiss!1602))) lt!251620)))))

(assert (=> b!159387 (= lt!251620 ((_ sign_extend 24) lt!251617))))

(assert (=> b!159387 (= lt!251617 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!251621)))))))

(assert (=> b!159387 (= lt!251621 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!251628))))))

(assert (=> b!159387 (= lt!251628 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7116 thiss!1602))))))

(declare-fun b!159388 () Bool)

(declare-fun res!133040 () Bool)

(assert (=> b!159388 (=> res!133040 e!108822)))

(assert (=> b!159388 (= res!133040 (bvsle lt!251628 #b00000000000000000000000000000000))))

(declare-fun b!159389 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159389 (= e!108821 (byteRangesEq!0 (select (arr!4356 (buf!3893 thiss!1602)) (currentByte!7121 thiss!1602)) lt!251627 #b00000000000000000000000000000000 (currentBit!7116 thiss!1602)))))

(declare-fun b!159390 () Bool)

(assert (=> b!159390 (= e!108822 (or (bvsgt #b00000000000000000000000000000000 (currentByte!7121 thiss!1602)) (bvsgt (size!3435 (buf!3893 thiss!1602)) (size!3435 (buf!3893 (_3!503 lt!251616)))) (bvsle (currentByte!7121 thiss!1602) (size!3435 (buf!3893 thiss!1602)))))))

(assert (=> b!159390 (arrayRangesEq!486 (buf!3893 thiss!1602) (buf!3893 (_3!503 lt!251616)) #b00000000000000000000000000000000 (bvsub (currentByte!7121 (_3!503 lt!251616)) #b00000000000000000000000000000001))))

(declare-fun lt!251624 () Unit!10831)

(declare-fun arrayRangesEqTransitive!129 (array!7582 array!7582 array!7582 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10831)

(assert (=> b!159390 (= lt!251624 (arrayRangesEqTransitive!129 (buf!3893 thiss!1602) lt!251626 (buf!3893 (_3!503 lt!251616)) #b00000000000000000000000000000000 (bvsub (currentByte!7121 (_3!503 lt!251616)) #b00000000000000000000000000000001) (currentByte!7121 (_3!503 lt!251616))))))

(assert (=> b!159390 (arrayRangesEq!486 lt!251626 (array!7583 (store (store (store (arr!4356 (buf!3893 thiss!1602)) (currentByte!7121 thiss!1602) lt!251622) (currentByte!7121 thiss!1602) lt!251627) (currentByte!7121 (_3!503 lt!251616)) (select (arr!4356 (buf!3893 (_3!503 lt!251616))) (currentByte!7121 (_3!503 lt!251616)))) (size!3435 (buf!3893 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7121 (_3!503 lt!251616)))))

(declare-fun lt!251618 () Unit!10831)

(assert (=> b!159390 (= lt!251618 (arrayUpdatedAtPrefixLemma!94 lt!251626 (currentByte!7121 (_3!503 lt!251616)) (select (arr!4356 (buf!3893 (_3!503 lt!251616))) (currentByte!7121 (_3!503 lt!251616)))))))

(assert (=> b!159390 (arrayRangesEq!486 (buf!3893 thiss!1602) (array!7583 (store (arr!4356 (buf!3893 thiss!1602)) (currentByte!7121 (_3!503 lt!251616)) (select (arr!4356 (buf!3893 (_3!503 lt!251616))) (currentByte!7121 (_3!503 lt!251616)))) (size!3435 (buf!3893 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7121 (_3!503 lt!251616)))))

(declare-fun lt!251619 () Unit!10831)

(assert (=> b!159390 (= lt!251619 (arrayUpdatedAtPrefixLemma!94 (buf!3893 thiss!1602) (currentByte!7121 (_3!503 lt!251616)) (select (arr!4356 (buf!3893 (_3!503 lt!251616))) (currentByte!7121 (_3!503 lt!251616)))))))

(declare-fun res!133039 () Bool)

(assert (=> start!32216 (=> (not res!133039) (not e!108820))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32216 (= res!133039 (validate_offset_byte!0 ((_ sign_extend 32) (size!3435 (buf!3893 thiss!1602))) ((_ sign_extend 32) (currentByte!7121 thiss!1602)) ((_ sign_extend 32) (currentBit!7116 thiss!1602))))))

(assert (=> start!32216 e!108820))

(declare-fun inv!12 (BitStream!6038) Bool)

(assert (=> start!32216 (and (inv!12 thiss!1602) e!108819)))

(assert (=> start!32216 true))

(assert (= (and start!32216 res!133039) b!159387))

(assert (= (and b!159387 (not res!133038)) b!159389))

(assert (= (and b!159387 (not res!133037)) b!159388))

(assert (= (and b!159388 (not res!133040)) b!159390))

(assert (= start!32216 b!159386))

(declare-fun m!251123 () Bool)

(assert (=> b!159386 m!251123))

(declare-fun m!251125 () Bool)

(assert (=> b!159387 m!251125))

(declare-fun m!251127 () Bool)

(assert (=> b!159387 m!251127))

(declare-fun m!251129 () Bool)

(assert (=> b!159387 m!251129))

(declare-fun m!251131 () Bool)

(assert (=> b!159387 m!251131))

(declare-fun m!251133 () Bool)

(assert (=> b!159387 m!251133))

(declare-fun m!251135 () Bool)

(assert (=> b!159387 m!251135))

(declare-fun m!251137 () Bool)

(assert (=> b!159387 m!251137))

(declare-fun m!251139 () Bool)

(assert (=> b!159387 m!251139))

(declare-fun m!251141 () Bool)

(assert (=> b!159387 m!251141))

(declare-fun m!251143 () Bool)

(assert (=> b!159387 m!251143))

(declare-fun m!251145 () Bool)

(assert (=> b!159387 m!251145))

(declare-fun m!251147 () Bool)

(assert (=> b!159387 m!251147))

(declare-fun m!251149 () Bool)

(assert (=> start!32216 m!251149))

(declare-fun m!251151 () Bool)

(assert (=> start!32216 m!251151))

(assert (=> b!159389 m!251135))

(assert (=> b!159389 m!251135))

(declare-fun m!251153 () Bool)

(assert (=> b!159389 m!251153))

(declare-fun m!251155 () Bool)

(assert (=> b!159390 m!251155))

(declare-fun m!251157 () Bool)

(assert (=> b!159390 m!251157))

(declare-fun m!251159 () Bool)

(assert (=> b!159390 m!251159))

(declare-fun m!251161 () Bool)

(assert (=> b!159390 m!251161))

(declare-fun m!251163 () Bool)

(assert (=> b!159390 m!251163))

(assert (=> b!159390 m!251159))

(declare-fun m!251165 () Bool)

(assert (=> b!159390 m!251165))

(assert (=> b!159390 m!251137))

(declare-fun m!251167 () Bool)

(assert (=> b!159390 m!251167))

(declare-fun m!251169 () Bool)

(assert (=> b!159390 m!251169))

(assert (=> b!159390 m!251159))

(declare-fun m!251171 () Bool)

(assert (=> b!159390 m!251171))

(assert (=> b!159390 m!251139))

(push 1)

(assert (not b!159387))

(assert (not b!159389))

(assert (not b!159386))

(assert (not start!32216))

(assert (not b!159390))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!53563 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!53563 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3435 (buf!3893 thiss!1602))) ((_ sign_extend 32) (currentByte!7121 thiss!1602)) ((_ sign_extend 32) (currentBit!7116 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3435 (buf!3893 thiss!1602))) ((_ sign_extend 32) (currentByte!7121 thiss!1602)) ((_ sign_extend 32) (currentBit!7116 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13277 () Bool)

(assert (= bs!13277 d!53563))

(declare-fun m!251203 () Bool)

(assert (=> bs!13277 m!251203))

(assert (=> start!32216 d!53563))

(declare-fun d!53565 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!53565 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7116 thiss!1602) (currentByte!7121 thiss!1602) (size!3435 (buf!3893 thiss!1602))))))

(declare-fun bs!13279 () Bool)

(assert (= bs!13279 d!53565))

(declare-fun m!251213 () Bool)

(assert (=> bs!13279 m!251213))

(assert (=> start!32216 d!53565))

(declare-fun d!53571 () Bool)

(assert (=> d!53571 (= (byteRangesEq!0 (select (arr!4356 (buf!3893 thiss!1602)) (currentByte!7121 thiss!1602)) lt!251627 #b00000000000000000000000000000000 (currentBit!7116 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7116 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4356 (buf!3893 thiss!1602)) (currentByte!7121 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7116 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!251627) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7116 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13282 () Bool)

(assert (= bs!13282 d!53571))

(declare-fun m!251219 () Bool)

(assert (=> bs!13282 m!251219))

(declare-fun m!251221 () Bool)

(assert (=> bs!13282 m!251221))

(assert (=> b!159389 d!53571))

(declare-fun d!53575 () Bool)

(declare-fun res!133064 () Bool)

(declare-fun e!108846 () Bool)

(assert (=> d!53575 (=> res!133064 e!108846)))

(assert (=> d!53575 (= res!133064 (= #b00000000000000000000000000000000 (bvsub (currentByte!7121 (_3!503 lt!251616)) #b00000000000000000000000000000001)))))

(assert (=> d!53575 (= (arrayRangesEq!486 (buf!3893 thiss!1602) lt!251626 #b00000000000000000000000000000000 (bvsub (currentByte!7121 (_3!503 lt!251616)) #b00000000000000000000000000000001)) e!108846)))

(declare-fun b!159414 () Bool)

(declare-fun e!108847 () Bool)

(assert (=> b!159414 (= e!108846 e!108847)))

(declare-fun res!133065 () Bool)

(assert (=> b!159414 (=> (not res!133065) (not e!108847))))

(assert (=> b!159414 (= res!133065 (= (select (arr!4356 (buf!3893 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4356 lt!251626) #b00000000000000000000000000000000)))))

(declare-fun b!159415 () Bool)

(assert (=> b!159415 (= e!108847 (arrayRangesEq!486 (buf!3893 thiss!1602) lt!251626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7121 (_3!503 lt!251616)) #b00000000000000000000000000000001)))))

(assert (= (and d!53575 (not res!133064)) b!159414))

(assert (= (and b!159414 res!133065) b!159415))

(declare-fun m!251223 () Bool)

(assert (=> b!159414 m!251223))

(declare-fun m!251225 () Bool)

(assert (=> b!159414 m!251225))

(declare-fun m!251227 () Bool)

(assert (=> b!159415 m!251227))

(assert (=> b!159387 d!53575))

(declare-fun d!53577 () Bool)

(declare-fun res!133066 () Bool)

(declare-fun e!108848 () Bool)

(assert (=> d!53577 (=> res!133066 e!108848)))

(assert (=> d!53577 (= res!133066 (= #b00000000000000000000000000000000 (bvsub (currentByte!7121 (_3!503 lt!251616)) #b00000000000000000000000000000001)))))

(assert (=> d!53577 (= (arrayRangesEq!486 (buf!3893 thiss!1602) (array!7583 (store (arr!4356 (buf!3893 thiss!1602)) (bvsub (currentByte!7121 (_3!503 lt!251616)) #b00000000000000000000000000000001) lt!251623) (size!3435 (buf!3893 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7121 (_3!503 lt!251616)) #b00000000000000000000000000000001)) e!108848)))

(declare-fun b!159416 () Bool)

(declare-fun e!108849 () Bool)

(assert (=> b!159416 (= e!108848 e!108849)))

(declare-fun res!133067 () Bool)

(assert (=> b!159416 (=> (not res!133067) (not e!108849))))

(assert (=> b!159416 (= res!133067 (= (select (arr!4356 (buf!3893 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4356 (array!7583 (store (arr!4356 (buf!3893 thiss!1602)) (bvsub (currentByte!7121 (_3!503 lt!251616)) #b00000000000000000000000000000001) lt!251623) (size!3435 (buf!3893 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!159417 () Bool)

(assert (=> b!159417 (= e!108849 (arrayRangesEq!486 (buf!3893 thiss!1602) (array!7583 (store (arr!4356 (buf!3893 thiss!1602)) (bvsub (currentByte!7121 (_3!503 lt!251616)) #b00000000000000000000000000000001) lt!251623) (size!3435 (buf!3893 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7121 (_3!503 lt!251616)) #b00000000000000000000000000000001)))))

(assert (= (and d!53577 (not res!133066)) b!159416))

(assert (= (and b!159416 res!133067) b!159417))

(assert (=> b!159416 m!251223))

(declare-fun m!251229 () Bool)

(assert (=> b!159416 m!251229))

(declare-fun m!251231 () Bool)

(assert (=> b!159417 m!251231))

(assert (=> b!159387 d!53577))

(declare-fun d!53579 () Bool)

(declare-fun e!108852 () Bool)

(assert (=> d!53579 e!108852))

(declare-fun res!133070 () Bool)

(assert (=> d!53579 (=> (not res!133070) (not e!108852))))

(assert (=> d!53579 (= res!133070 (and (bvsge (bvsub (currentByte!7121 (_3!503 lt!251616)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7121 (_3!503 lt!251616)) #b00000000000000000000000000000001) (size!3435 (buf!3893 thiss!1602)))))))

(declare-fun lt!251639 () Unit!10831)

(declare-fun choose!129 (array!7582 (_ BitVec 32) (_ BitVec 8)) Unit!10831)

(assert (=> d!53579 (= lt!251639 (choose!129 (buf!3893 thiss!1602) (bvsub (currentByte!7121 (_3!503 lt!251616)) #b00000000000000000000000000000001) lt!251623))))

(assert (=> d!53579 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7121 (_3!503 lt!251616)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7121 (_3!503 lt!251616)) #b00000000000000000000000000000001) (size!3435 (buf!3893 thiss!1602))))))

(assert (=> d!53579 (= (arrayUpdatedAtPrefixLemma!94 (buf!3893 thiss!1602) (bvsub (currentByte!7121 (_3!503 lt!251616)) #b00000000000000000000000000000001) lt!251623) lt!251639)))

(declare-fun b!159420 () Bool)

(assert (=> b!159420 (= e!108852 (arrayRangesEq!486 (buf!3893 thiss!1602) (array!7583 (store (arr!4356 (buf!3893 thiss!1602)) (bvsub (currentByte!7121 (_3!503 lt!251616)) #b00000000000000000000000000000001) lt!251623) (size!3435 (buf!3893 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7121 (_3!503 lt!251616)) #b00000000000000000000000000000001)))))

(assert (= (and d!53579 res!133070) b!159420))

(declare-fun m!251233 () Bool)

(assert (=> d!53579 m!251233))

(assert (=> b!159420 m!251147))

(assert (=> b!159420 m!251133))

(assert (=> b!159387 d!53579))

(declare-fun d!53581 () Bool)

(assert (=> d!53581 (= (array_inv!3182 (buf!3893 thiss!1602)) (bvsge (size!3435 (buf!3893 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!159386 d!53581))

(declare-fun d!53583 () Bool)

(declare-fun res!133071 () Bool)

(declare-fun e!108853 () Bool)

(assert (=> d!53583 (=> res!133071 e!108853)))

(assert (=> d!53583 (= res!133071 (= #b00000000000000000000000000000000 (currentByte!7121 (_3!503 lt!251616))))))

(assert (=> d!53583 (= (arrayRangesEq!486 (buf!3893 thiss!1602) (array!7583 (store (arr!4356 (buf!3893 thiss!1602)) (currentByte!7121 (_3!503 lt!251616)) (select (arr!4356 (buf!3893 (_3!503 lt!251616))) (currentByte!7121 (_3!503 lt!251616)))) (size!3435 (buf!3893 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7121 (_3!503 lt!251616))) e!108853)))

(declare-fun b!159421 () Bool)

(declare-fun e!108854 () Bool)

(assert (=> b!159421 (= e!108853 e!108854)))

(declare-fun res!133072 () Bool)

(assert (=> b!159421 (=> (not res!133072) (not e!108854))))

(assert (=> b!159421 (= res!133072 (= (select (arr!4356 (buf!3893 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4356 (array!7583 (store (arr!4356 (buf!3893 thiss!1602)) (currentByte!7121 (_3!503 lt!251616)) (select (arr!4356 (buf!3893 (_3!503 lt!251616))) (currentByte!7121 (_3!503 lt!251616)))) (size!3435 (buf!3893 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!159422 () Bool)

(assert (=> b!159422 (= e!108854 (arrayRangesEq!486 (buf!3893 thiss!1602) (array!7583 (store (arr!4356 (buf!3893 thiss!1602)) (currentByte!7121 (_3!503 lt!251616)) (select (arr!4356 (buf!3893 (_3!503 lt!251616))) (currentByte!7121 (_3!503 lt!251616)))) (size!3435 (buf!3893 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7121 (_3!503 lt!251616))))))

(assert (= (and d!53583 (not res!133071)) b!159421))

(assert (= (and b!159421 res!133072) b!159422))

(assert (=> b!159421 m!251223))

(declare-fun m!251235 () Bool)

(assert (=> b!159421 m!251235))

(declare-fun m!251237 () Bool)

(assert (=> b!159422 m!251237))

(assert (=> b!159390 d!53583))

(declare-fun d!53585 () Bool)

(declare-fun e!108855 () Bool)

(assert (=> d!53585 e!108855))

(declare-fun res!133073 () Bool)

(assert (=> d!53585 (=> (not res!133073) (not e!108855))))

(assert (=> d!53585 (= res!133073 (and (bvsge (currentByte!7121 (_3!503 lt!251616)) #b00000000000000000000000000000000) (bvslt (currentByte!7121 (_3!503 lt!251616)) (size!3435 (buf!3893 thiss!1602)))))))

(declare-fun lt!251640 () Unit!10831)

(assert (=> d!53585 (= lt!251640 (choose!129 (buf!3893 thiss!1602) (currentByte!7121 (_3!503 lt!251616)) (select (arr!4356 (buf!3893 (_3!503 lt!251616))) (currentByte!7121 (_3!503 lt!251616)))))))

(assert (=> d!53585 (and (bvsle #b00000000000000000000000000000000 (currentByte!7121 (_3!503 lt!251616))) (bvslt (currentByte!7121 (_3!503 lt!251616)) (size!3435 (buf!3893 thiss!1602))))))

(assert (=> d!53585 (= (arrayUpdatedAtPrefixLemma!94 (buf!3893 thiss!1602) (currentByte!7121 (_3!503 lt!251616)) (select (arr!4356 (buf!3893 (_3!503 lt!251616))) (currentByte!7121 (_3!503 lt!251616)))) lt!251640)))

(declare-fun b!159423 () Bool)

(assert (=> b!159423 (= e!108855 (arrayRangesEq!486 (buf!3893 thiss!1602) (array!7583 (store (arr!4356 (buf!3893 thiss!1602)) (currentByte!7121 (_3!503 lt!251616)) (select (arr!4356 (buf!3893 (_3!503 lt!251616))) (currentByte!7121 (_3!503 lt!251616)))) (size!3435 (buf!3893 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7121 (_3!503 lt!251616))))))

(assert (= (and d!53585 res!133073) b!159423))

(assert (=> d!53585 m!251159))

(declare-fun m!251239 () Bool)

(assert (=> d!53585 m!251239))

(assert (=> b!159423 m!251163))

(assert (=> b!159423 m!251155))

(assert (=> b!159390 d!53585))

(declare-fun d!53587 () Bool)

(assert (=> d!53587 (arrayRangesEq!486 (buf!3893 thiss!1602) (buf!3893 (_3!503 lt!251616)) #b00000000000000000000000000000000 (bvsub (currentByte!7121 (_3!503 lt!251616)) #b00000000000000000000000000000001))))

(declare-fun lt!251643 () Unit!10831)

(declare-fun choose!131 (array!7582 array!7582 array!7582 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10831)

(assert (=> d!53587 (= lt!251643 (choose!131 (buf!3893 thiss!1602) lt!251626 (buf!3893 (_3!503 lt!251616)) #b00000000000000000000000000000000 (bvsub (currentByte!7121 (_3!503 lt!251616)) #b00000000000000000000000000000001) (currentByte!7121 (_3!503 lt!251616))))))

(assert (=> d!53587 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7121 (_3!503 lt!251616)) #b00000000000000000000000000000001)) (bvsle (bvsub (currentByte!7121 (_3!503 lt!251616)) #b00000000000000000000000000000001) (currentByte!7121 (_3!503 lt!251616))))))

(assert (=> d!53587 (= (arrayRangesEqTransitive!129 (buf!3893 thiss!1602) lt!251626 (buf!3893 (_3!503 lt!251616)) #b00000000000000000000000000000000 (bvsub (currentByte!7121 (_3!503 lt!251616)) #b00000000000000000000000000000001) (currentByte!7121 (_3!503 lt!251616))) lt!251643)))

(declare-fun bs!13283 () Bool)

(assert (= bs!13283 d!53587))

(assert (=> bs!13283 m!251157))

(declare-fun m!251241 () Bool)

(assert (=> bs!13283 m!251241))

(assert (=> b!159390 d!53587))

(declare-fun d!53591 () Bool)

(declare-fun e!108856 () Bool)

(assert (=> d!53591 e!108856))

(declare-fun res!133074 () Bool)

(assert (=> d!53591 (=> (not res!133074) (not e!108856))))

(assert (=> d!53591 (= res!133074 (and (bvsge (currentByte!7121 (_3!503 lt!251616)) #b00000000000000000000000000000000) (bvslt (currentByte!7121 (_3!503 lt!251616)) (size!3435 lt!251626))))))

(declare-fun lt!251644 () Unit!10831)

(assert (=> d!53591 (= lt!251644 (choose!129 lt!251626 (currentByte!7121 (_3!503 lt!251616)) (select (arr!4356 (buf!3893 (_3!503 lt!251616))) (currentByte!7121 (_3!503 lt!251616)))))))

(assert (=> d!53591 (and (bvsle #b00000000000000000000000000000000 (currentByte!7121 (_3!503 lt!251616))) (bvslt (currentByte!7121 (_3!503 lt!251616)) (size!3435 lt!251626)))))

(assert (=> d!53591 (= (arrayUpdatedAtPrefixLemma!94 lt!251626 (currentByte!7121 (_3!503 lt!251616)) (select (arr!4356 (buf!3893 (_3!503 lt!251616))) (currentByte!7121 (_3!503 lt!251616)))) lt!251644)))

(declare-fun b!159424 () Bool)

(assert (=> b!159424 (= e!108856 (arrayRangesEq!486 lt!251626 (array!7583 (store (arr!4356 lt!251626) (currentByte!7121 (_3!503 lt!251616)) (select (arr!4356 (buf!3893 (_3!503 lt!251616))) (currentByte!7121 (_3!503 lt!251616)))) (size!3435 lt!251626)) #b00000000000000000000000000000000 (currentByte!7121 (_3!503 lt!251616))))))

(assert (= (and d!53591 res!133074) b!159424))

(assert (=> d!53591 m!251159))

(declare-fun m!251243 () Bool)

(assert (=> d!53591 m!251243))

(declare-fun m!251245 () Bool)

(assert (=> b!159424 m!251245))

(declare-fun m!251247 () Bool)

(assert (=> b!159424 m!251247))

(assert (=> b!159390 d!53591))

(declare-fun d!53593 () Bool)

(declare-fun res!133075 () Bool)

(declare-fun e!108857 () Bool)

(assert (=> d!53593 (=> res!133075 e!108857)))

(assert (=> d!53593 (= res!133075 (= #b00000000000000000000000000000000 (currentByte!7121 (_3!503 lt!251616))))))

(assert (=> d!53593 (= (arrayRangesEq!486 lt!251626 (array!7583 (store (store (store (arr!4356 (buf!3893 thiss!1602)) (currentByte!7121 thiss!1602) lt!251622) (currentByte!7121 thiss!1602) lt!251627) (currentByte!7121 (_3!503 lt!251616)) (select (arr!4356 (buf!3893 (_3!503 lt!251616))) (currentByte!7121 (_3!503 lt!251616)))) (size!3435 (buf!3893 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7121 (_3!503 lt!251616))) e!108857)))

(declare-fun b!159425 () Bool)

(declare-fun e!108858 () Bool)

(assert (=> b!159425 (= e!108857 e!108858)))

(declare-fun res!133076 () Bool)

(assert (=> b!159425 (=> (not res!133076) (not e!108858))))

(assert (=> b!159425 (= res!133076 (= (select (arr!4356 lt!251626) #b00000000000000000000000000000000) (select (arr!4356 (array!7583 (store (store (store (arr!4356 (buf!3893 thiss!1602)) (currentByte!7121 thiss!1602) lt!251622) (currentByte!7121 thiss!1602) lt!251627) (currentByte!7121 (_3!503 lt!251616)) (select (arr!4356 (buf!3893 (_3!503 lt!251616))) (currentByte!7121 (_3!503 lt!251616)))) (size!3435 (buf!3893 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!159426 () Bool)

(assert (=> b!159426 (= e!108858 (arrayRangesEq!486 lt!251626 (array!7583 (store (store (store (arr!4356 (buf!3893 thiss!1602)) (currentByte!7121 thiss!1602) lt!251622) (currentByte!7121 thiss!1602) lt!251627) (currentByte!7121 (_3!503 lt!251616)) (select (arr!4356 (buf!3893 (_3!503 lt!251616))) (currentByte!7121 (_3!503 lt!251616)))) (size!3435 (buf!3893 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7121 (_3!503 lt!251616))))))

(assert (= (and d!53593 (not res!133075)) b!159425))

(assert (= (and b!159425 res!133076) b!159426))

(assert (=> b!159425 m!251225))

(declare-fun m!251249 () Bool)

(assert (=> b!159425 m!251249))

(declare-fun m!251251 () Bool)

(assert (=> b!159426 m!251251))

(assert (=> b!159390 d!53593))

(declare-fun d!53595 () Bool)

(declare-fun res!133077 () Bool)

(declare-fun e!108859 () Bool)

(assert (=> d!53595 (=> res!133077 e!108859)))

(assert (=> d!53595 (= res!133077 (= #b00000000000000000000000000000000 (bvsub (currentByte!7121 (_3!503 lt!251616)) #b00000000000000000000000000000001)))))

(assert (=> d!53595 (= (arrayRangesEq!486 (buf!3893 thiss!1602) (buf!3893 (_3!503 lt!251616)) #b00000000000000000000000000000000 (bvsub (currentByte!7121 (_3!503 lt!251616)) #b00000000000000000000000000000001)) e!108859)))

(declare-fun b!159427 () Bool)

(declare-fun e!108860 () Bool)

(assert (=> b!159427 (= e!108859 e!108860)))

(declare-fun res!133078 () Bool)

(assert (=> b!159427 (=> (not res!133078) (not e!108860))))

(assert (=> b!159427 (= res!133078 (= (select (arr!4356 (buf!3893 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4356 (buf!3893 (_3!503 lt!251616))) #b00000000000000000000000000000000)))))

(declare-fun b!159428 () Bool)

(assert (=> b!159428 (= e!108860 (arrayRangesEq!486 (buf!3893 thiss!1602) (buf!3893 (_3!503 lt!251616)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7121 (_3!503 lt!251616)) #b00000000000000000000000000000001)))))

(assert (= (and d!53595 (not res!133077)) b!159427))

(assert (= (and b!159427 res!133078) b!159428))

(assert (=> b!159427 m!251223))

(declare-fun m!251253 () Bool)

(assert (=> b!159427 m!251253))

(declare-fun m!251255 () Bool)

(assert (=> b!159428 m!251255))

(assert (=> b!159390 d!53595))

(push 1)

