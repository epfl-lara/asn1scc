; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33820 () Bool)

(assert start!33820)

(declare-fun b!161603 () Bool)

(declare-fun res!134720 () Bool)

(declare-fun e!111322 () Bool)

(assert (=> b!161603 (=> res!134720 e!111322)))

(declare-fun lt!254404 () (_ BitVec 32))

(assert (=> b!161603 (= res!134720 (bvsle lt!254404 #b00000000000000000000000000000000))))

(declare-fun res!134719 () Bool)

(declare-fun e!111323 () Bool)

(assert (=> start!33820 (=> (not res!134719) (not e!111323))))

(declare-datatypes ((array!7991 0))(
  ( (array!7992 (arr!4505 (Array (_ BitVec 32) (_ BitVec 8))) (size!3584 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6336 0))(
  ( (BitStream!6337 (buf!4042 array!7991) (currentByte!7533 (_ BitVec 32)) (currentBit!7528 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6336)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33820 (= res!134719 (validate_offset_byte!0 ((_ sign_extend 32) (size!3584 (buf!4042 thiss!1602))) ((_ sign_extend 32) (currentByte!7533 thiss!1602)) ((_ sign_extend 32) (currentBit!7528 thiss!1602))))))

(assert (=> start!33820 e!111323))

(declare-fun e!111321 () Bool)

(declare-fun inv!12 (BitStream!6336) Bool)

(assert (=> start!33820 (and (inv!12 thiss!1602) e!111321)))

(assert (=> start!33820 true))

(declare-fun b!161604 () Bool)

(declare-fun e!111320 () Bool)

(declare-fun lt!254402 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161604 (= e!111320 (byteRangesEq!0 (select (arr!4505 (buf!4042 thiss!1602)) (currentByte!7533 thiss!1602)) lt!254402 #b00000000000000000000000000000000 (currentBit!7528 thiss!1602)))))

(declare-fun b!161605 () Bool)

(assert (=> b!161605 (= e!111323 (not e!111322))))

(declare-fun res!134718 () Bool)

(assert (=> b!161605 (=> res!134718 e!111322)))

(declare-datatypes ((Unit!11106 0))(
  ( (Unit!11107) )
))
(declare-datatypes ((tuple3!896 0))(
  ( (tuple3!897 (_1!7799 Unit!11106) (_2!7799 (_ BitVec 8)) (_3!565 BitStream!6336)) )
))
(declare-fun lt!254410 () tuple3!896)

(declare-fun lt!254407 () array!7991)

(declare-fun arrayRangesEq!536 (array!7991 array!7991 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161605 (= res!134718 (not (arrayRangesEq!536 (buf!4042 thiss!1602) lt!254407 #b00000000000000000000000000000000 (bvsub (currentByte!7533 (_3!565 lt!254410)) #b00000000000000000000000000000001))))))

(declare-fun lt!254403 () (_ BitVec 8))

(assert (=> b!161605 (arrayRangesEq!536 (buf!4042 thiss!1602) (array!7992 (store (arr!4505 (buf!4042 thiss!1602)) (bvsub (currentByte!7533 (_3!565 lt!254410)) #b00000000000000000000000000000001) lt!254403) (size!3584 (buf!4042 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7533 (_3!565 lt!254410)) #b00000000000000000000000000000001))))

(declare-fun lt!254409 () Unit!11106)

(declare-fun arrayUpdatedAtPrefixLemma!144 (array!7991 (_ BitVec 32) (_ BitVec 8)) Unit!11106)

(assert (=> b!161605 (= lt!254409 (arrayUpdatedAtPrefixLemma!144 (buf!4042 thiss!1602) (bvsub (currentByte!7533 (_3!565 lt!254410)) #b00000000000000000000000000000001) lt!254403))))

(assert (=> b!161605 (= lt!254403 (select (arr!4505 (buf!4042 (_3!565 lt!254410))) (bvsub (currentByte!7533 (_3!565 lt!254410)) #b00000000000000000000000000000001)))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!254401 () (_ BitVec 32))

(declare-fun lt!254408 () (_ BitVec 32))

(declare-fun lt!254412 () (_ BitVec 8))

(declare-fun lt!254406 () (_ BitVec 8))

(declare-fun Unit!11108 () Unit!11106)

(declare-fun Unit!11109 () Unit!11106)

(assert (=> b!161605 (= lt!254410 (ite (bvsgt lt!254404 #b00000000000000000000000000000000) (let ((bdg!9677 ((_ extract 7 0) (bvnot lt!254401)))) (let ((bdg!9678 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4505 (buf!4042 thiss!1602)) (currentByte!7533 thiss!1602) lt!254412) (currentByte!7533 thiss!1602) lt!254402) (bvadd #b00000000000000000000000000000001 (currentByte!7533 thiss!1602)))) ((_ sign_extend 24) bdg!9677))))) (tuple3!897 Unit!11108 bdg!9677 (BitStream!6337 (array!7992 (store (arr!4505 (array!7992 (store (arr!4505 lt!254407) (bvadd #b00000000000000000000000000000001 (currentByte!7533 thiss!1602)) bdg!9678) (size!3584 lt!254407))) (bvadd #b00000000000000000000000000000001 (currentByte!7533 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9678) (bvshl ((_ sign_extend 24) v!222) lt!254408)))) (size!3584 (array!7992 (store (arr!4505 lt!254407) (bvadd #b00000000000000000000000000000001 (currentByte!7533 thiss!1602)) bdg!9678) (size!3584 lt!254407)))) (bvadd #b00000000000000000000000000000001 (currentByte!7533 thiss!1602)) (currentBit!7528 thiss!1602))))) (tuple3!897 Unit!11109 lt!254406 (BitStream!6337 lt!254407 (bvadd #b00000000000000000000000000000001 (currentByte!7533 thiss!1602)) (currentBit!7528 thiss!1602)))))))

(assert (=> b!161605 e!111320))

(declare-fun res!134717 () Bool)

(assert (=> b!161605 (=> res!134717 e!111320)))

(assert (=> b!161605 (= res!134717 (bvsge (currentByte!7533 thiss!1602) (size!3584 (buf!4042 thiss!1602))))))

(assert (=> b!161605 (= lt!254407 (array!7992 (store (store (arr!4505 (buf!4042 thiss!1602)) (currentByte!7533 thiss!1602) lt!254412) (currentByte!7533 thiss!1602) lt!254402) (size!3584 (buf!4042 thiss!1602))))))

(assert (=> b!161605 (= lt!254402 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!254412) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!254404))))))

(assert (=> b!161605 (= lt!254412 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4505 (buf!4042 thiss!1602)) (currentByte!7533 thiss!1602))) lt!254401)))))

(assert (=> b!161605 (= lt!254401 ((_ sign_extend 24) lt!254406))))

(assert (=> b!161605 (= lt!254406 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!254408)))))))

(assert (=> b!161605 (= lt!254408 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!254404))))))

(assert (=> b!161605 (= lt!254404 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7528 thiss!1602))))))

(declare-fun b!161606 () Bool)

(assert (=> b!161606 (= e!111322 (or (bvsgt #b00000000000000000000000000000000 (bvsub (currentByte!7533 (_3!565 lt!254410)) #b00000000000000000000000000000001)) (bvsgt (bvsub (currentByte!7533 (_3!565 lt!254410)) #b00000000000000000000000000000001) (currentByte!7533 (_3!565 lt!254410))) (bvsgt (size!3584 (buf!4042 thiss!1602)) (size!3584 (buf!4042 (_3!565 lt!254410)))) (and (bvsle (bvsub (currentByte!7533 (_3!565 lt!254410)) #b00000000000000000000000000000001) (size!3584 (buf!4042 thiss!1602))) (bvsle (currentByte!7533 (_3!565 lt!254410)) (size!3584 (buf!4042 thiss!1602))))))))

(assert (=> b!161606 (arrayRangesEq!536 lt!254407 (array!7992 (store (store (store (arr!4505 (buf!4042 thiss!1602)) (currentByte!7533 thiss!1602) lt!254412) (currentByte!7533 thiss!1602) lt!254402) (currentByte!7533 (_3!565 lt!254410)) (select (arr!4505 (buf!4042 (_3!565 lt!254410))) (currentByte!7533 (_3!565 lt!254410)))) (size!3584 (buf!4042 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7533 (_3!565 lt!254410)))))

(declare-fun lt!254405 () Unit!11106)

(assert (=> b!161606 (= lt!254405 (arrayUpdatedAtPrefixLemma!144 lt!254407 (currentByte!7533 (_3!565 lt!254410)) (select (arr!4505 (buf!4042 (_3!565 lt!254410))) (currentByte!7533 (_3!565 lt!254410)))))))

(assert (=> b!161606 (arrayRangesEq!536 (buf!4042 thiss!1602) (array!7992 (store (arr!4505 (buf!4042 thiss!1602)) (currentByte!7533 (_3!565 lt!254410)) (select (arr!4505 (buf!4042 (_3!565 lt!254410))) (currentByte!7533 (_3!565 lt!254410)))) (size!3584 (buf!4042 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7533 (_3!565 lt!254410)))))

(declare-fun lt!254411 () Unit!11106)

(assert (=> b!161606 (= lt!254411 (arrayUpdatedAtPrefixLemma!144 (buf!4042 thiss!1602) (currentByte!7533 (_3!565 lt!254410)) (select (arr!4505 (buf!4042 (_3!565 lt!254410))) (currentByte!7533 (_3!565 lt!254410)))))))

(declare-fun b!161607 () Bool)

(declare-fun array_inv!3331 (array!7991) Bool)

(assert (=> b!161607 (= e!111321 (array_inv!3331 (buf!4042 thiss!1602)))))

(assert (= (and start!33820 res!134719) b!161605))

(assert (= (and b!161605 (not res!134717)) b!161604))

(assert (= (and b!161605 (not res!134718)) b!161603))

(assert (= (and b!161603 (not res!134720)) b!161606))

(assert (= start!33820 b!161607))

(declare-fun m!256105 () Bool)

(assert (=> start!33820 m!256105))

(declare-fun m!256107 () Bool)

(assert (=> start!33820 m!256107))

(declare-fun m!256109 () Bool)

(assert (=> b!161607 m!256109))

(declare-fun m!256111 () Bool)

(assert (=> b!161605 m!256111))

(declare-fun m!256113 () Bool)

(assert (=> b!161605 m!256113))

(declare-fun m!256115 () Bool)

(assert (=> b!161605 m!256115))

(declare-fun m!256117 () Bool)

(assert (=> b!161605 m!256117))

(declare-fun m!256119 () Bool)

(assert (=> b!161605 m!256119))

(declare-fun m!256121 () Bool)

(assert (=> b!161605 m!256121))

(declare-fun m!256123 () Bool)

(assert (=> b!161605 m!256123))

(declare-fun m!256125 () Bool)

(assert (=> b!161605 m!256125))

(declare-fun m!256127 () Bool)

(assert (=> b!161605 m!256127))

(declare-fun m!256129 () Bool)

(assert (=> b!161605 m!256129))

(declare-fun m!256131 () Bool)

(assert (=> b!161605 m!256131))

(declare-fun m!256133 () Bool)

(assert (=> b!161605 m!256133))

(declare-fun m!256135 () Bool)

(assert (=> b!161606 m!256135))

(declare-fun m!256137 () Bool)

(assert (=> b!161606 m!256137))

(declare-fun m!256139 () Bool)

(assert (=> b!161606 m!256139))

(assert (=> b!161606 m!256123))

(assert (=> b!161606 m!256137))

(declare-fun m!256141 () Bool)

(assert (=> b!161606 m!256141))

(declare-fun m!256143 () Bool)

(assert (=> b!161606 m!256143))

(assert (=> b!161606 m!256137))

(declare-fun m!256145 () Bool)

(assert (=> b!161606 m!256145))

(assert (=> b!161606 m!256117))

(declare-fun m!256147 () Bool)

(assert (=> b!161606 m!256147))

(assert (=> b!161604 m!256127))

(assert (=> b!161604 m!256127))

(declare-fun m!256149 () Bool)

(assert (=> b!161604 m!256149))

(check-sat (not b!161604) (not b!161607) (not start!33820) (not b!161606) (not b!161605))
(check-sat)
(get-model)

(declare-fun d!55325 () Bool)

(assert (=> d!55325 (= (array_inv!3331 (buf!4042 thiss!1602)) (bvsge (size!3584 (buf!4042 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!161607 d!55325))

(declare-fun d!55327 () Bool)

(declare-fun res!134745 () Bool)

(declare-fun e!111352 () Bool)

(assert (=> d!55327 (=> res!134745 e!111352)))

(assert (=> d!55327 (= res!134745 (= #b00000000000000000000000000000000 (currentByte!7533 (_3!565 lt!254410))))))

(assert (=> d!55327 (= (arrayRangesEq!536 lt!254407 (array!7992 (store (store (store (arr!4505 (buf!4042 thiss!1602)) (currentByte!7533 thiss!1602) lt!254412) (currentByte!7533 thiss!1602) lt!254402) (currentByte!7533 (_3!565 lt!254410)) (select (arr!4505 (buf!4042 (_3!565 lt!254410))) (currentByte!7533 (_3!565 lt!254410)))) (size!3584 (buf!4042 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7533 (_3!565 lt!254410))) e!111352)))

(declare-fun b!161635 () Bool)

(declare-fun e!111353 () Bool)

(assert (=> b!161635 (= e!111352 e!111353)))

(declare-fun res!134746 () Bool)

(assert (=> b!161635 (=> (not res!134746) (not e!111353))))

(assert (=> b!161635 (= res!134746 (= (select (arr!4505 lt!254407) #b00000000000000000000000000000000) (select (arr!4505 (array!7992 (store (store (store (arr!4505 (buf!4042 thiss!1602)) (currentByte!7533 thiss!1602) lt!254412) (currentByte!7533 thiss!1602) lt!254402) (currentByte!7533 (_3!565 lt!254410)) (select (arr!4505 (buf!4042 (_3!565 lt!254410))) (currentByte!7533 (_3!565 lt!254410)))) (size!3584 (buf!4042 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161636 () Bool)

(assert (=> b!161636 (= e!111353 (arrayRangesEq!536 lt!254407 (array!7992 (store (store (store (arr!4505 (buf!4042 thiss!1602)) (currentByte!7533 thiss!1602) lt!254412) (currentByte!7533 thiss!1602) lt!254402) (currentByte!7533 (_3!565 lt!254410)) (select (arr!4505 (buf!4042 (_3!565 lt!254410))) (currentByte!7533 (_3!565 lt!254410)))) (size!3584 (buf!4042 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7533 (_3!565 lt!254410))))))

(assert (= (and d!55327 (not res!134745)) b!161635))

(assert (= (and b!161635 res!134746) b!161636))

(declare-fun m!256215 () Bool)

(assert (=> b!161635 m!256215))

(declare-fun m!256217 () Bool)

(assert (=> b!161635 m!256217))

(declare-fun m!256219 () Bool)

(assert (=> b!161636 m!256219))

(assert (=> b!161606 d!55327))

(declare-fun d!55329 () Bool)

(declare-fun e!111365 () Bool)

(assert (=> d!55329 e!111365))

(declare-fun res!134758 () Bool)

(assert (=> d!55329 (=> (not res!134758) (not e!111365))))

(assert (=> d!55329 (= res!134758 (and (bvsge (currentByte!7533 (_3!565 lt!254410)) #b00000000000000000000000000000000) (bvslt (currentByte!7533 (_3!565 lt!254410)) (size!3584 lt!254407))))))

(declare-fun lt!254456 () Unit!11106)

(declare-fun choose!168 (array!7991 (_ BitVec 32) (_ BitVec 8)) Unit!11106)

(assert (=> d!55329 (= lt!254456 (choose!168 lt!254407 (currentByte!7533 (_3!565 lt!254410)) (select (arr!4505 (buf!4042 (_3!565 lt!254410))) (currentByte!7533 (_3!565 lt!254410)))))))

(assert (=> d!55329 (and (bvsle #b00000000000000000000000000000000 (currentByte!7533 (_3!565 lt!254410))) (bvslt (currentByte!7533 (_3!565 lt!254410)) (size!3584 lt!254407)))))

(assert (=> d!55329 (= (arrayUpdatedAtPrefixLemma!144 lt!254407 (currentByte!7533 (_3!565 lt!254410)) (select (arr!4505 (buf!4042 (_3!565 lt!254410))) (currentByte!7533 (_3!565 lt!254410)))) lt!254456)))

(declare-fun b!161648 () Bool)

(assert (=> b!161648 (= e!111365 (arrayRangesEq!536 lt!254407 (array!7992 (store (arr!4505 lt!254407) (currentByte!7533 (_3!565 lt!254410)) (select (arr!4505 (buf!4042 (_3!565 lt!254410))) (currentByte!7533 (_3!565 lt!254410)))) (size!3584 lt!254407)) #b00000000000000000000000000000000 (currentByte!7533 (_3!565 lt!254410))))))

(assert (= (and d!55329 res!134758) b!161648))

(assert (=> d!55329 m!256137))

(declare-fun m!256239 () Bool)

(assert (=> d!55329 m!256239))

(declare-fun m!256241 () Bool)

(assert (=> b!161648 m!256241))

(declare-fun m!256243 () Bool)

(assert (=> b!161648 m!256243))

(assert (=> b!161606 d!55329))

(declare-fun d!55339 () Bool)

(declare-fun res!134759 () Bool)

(declare-fun e!111366 () Bool)

(assert (=> d!55339 (=> res!134759 e!111366)))

(assert (=> d!55339 (= res!134759 (= #b00000000000000000000000000000000 (currentByte!7533 (_3!565 lt!254410))))))

(assert (=> d!55339 (= (arrayRangesEq!536 (buf!4042 thiss!1602) (array!7992 (store (arr!4505 (buf!4042 thiss!1602)) (currentByte!7533 (_3!565 lt!254410)) (select (arr!4505 (buf!4042 (_3!565 lt!254410))) (currentByte!7533 (_3!565 lt!254410)))) (size!3584 (buf!4042 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7533 (_3!565 lt!254410))) e!111366)))

(declare-fun b!161649 () Bool)

(declare-fun e!111367 () Bool)

(assert (=> b!161649 (= e!111366 e!111367)))

(declare-fun res!134760 () Bool)

(assert (=> b!161649 (=> (not res!134760) (not e!111367))))

(assert (=> b!161649 (= res!134760 (= (select (arr!4505 (buf!4042 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4505 (array!7992 (store (arr!4505 (buf!4042 thiss!1602)) (currentByte!7533 (_3!565 lt!254410)) (select (arr!4505 (buf!4042 (_3!565 lt!254410))) (currentByte!7533 (_3!565 lt!254410)))) (size!3584 (buf!4042 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161650 () Bool)

(assert (=> b!161650 (= e!111367 (arrayRangesEq!536 (buf!4042 thiss!1602) (array!7992 (store (arr!4505 (buf!4042 thiss!1602)) (currentByte!7533 (_3!565 lt!254410)) (select (arr!4505 (buf!4042 (_3!565 lt!254410))) (currentByte!7533 (_3!565 lt!254410)))) (size!3584 (buf!4042 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7533 (_3!565 lt!254410))))))

(assert (= (and d!55339 (not res!134759)) b!161649))

(assert (= (and b!161649 res!134760) b!161650))

(declare-fun m!256245 () Bool)

(assert (=> b!161649 m!256245))

(declare-fun m!256247 () Bool)

(assert (=> b!161649 m!256247))

(declare-fun m!256249 () Bool)

(assert (=> b!161650 m!256249))

(assert (=> b!161606 d!55339))

(declare-fun d!55341 () Bool)

(declare-fun e!111368 () Bool)

(assert (=> d!55341 e!111368))

(declare-fun res!134761 () Bool)

(assert (=> d!55341 (=> (not res!134761) (not e!111368))))

(assert (=> d!55341 (= res!134761 (and (bvsge (currentByte!7533 (_3!565 lt!254410)) #b00000000000000000000000000000000) (bvslt (currentByte!7533 (_3!565 lt!254410)) (size!3584 (buf!4042 thiss!1602)))))))

(declare-fun lt!254457 () Unit!11106)

(assert (=> d!55341 (= lt!254457 (choose!168 (buf!4042 thiss!1602) (currentByte!7533 (_3!565 lt!254410)) (select (arr!4505 (buf!4042 (_3!565 lt!254410))) (currentByte!7533 (_3!565 lt!254410)))))))

(assert (=> d!55341 (and (bvsle #b00000000000000000000000000000000 (currentByte!7533 (_3!565 lt!254410))) (bvslt (currentByte!7533 (_3!565 lt!254410)) (size!3584 (buf!4042 thiss!1602))))))

(assert (=> d!55341 (= (arrayUpdatedAtPrefixLemma!144 (buf!4042 thiss!1602) (currentByte!7533 (_3!565 lt!254410)) (select (arr!4505 (buf!4042 (_3!565 lt!254410))) (currentByte!7533 (_3!565 lt!254410)))) lt!254457)))

(declare-fun b!161651 () Bool)

(assert (=> b!161651 (= e!111368 (arrayRangesEq!536 (buf!4042 thiss!1602) (array!7992 (store (arr!4505 (buf!4042 thiss!1602)) (currentByte!7533 (_3!565 lt!254410)) (select (arr!4505 (buf!4042 (_3!565 lt!254410))) (currentByte!7533 (_3!565 lt!254410)))) (size!3584 (buf!4042 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7533 (_3!565 lt!254410))))))

(assert (= (and d!55341 res!134761) b!161651))

(assert (=> d!55341 m!256137))

(declare-fun m!256251 () Bool)

(assert (=> d!55341 m!256251))

(assert (=> b!161651 m!256139))

(assert (=> b!161651 m!256143))

(assert (=> b!161606 d!55341))

(declare-fun d!55343 () Bool)

(declare-fun res!134762 () Bool)

(declare-fun e!111369 () Bool)

(assert (=> d!55343 (=> res!134762 e!111369)))

(assert (=> d!55343 (= res!134762 (= #b00000000000000000000000000000000 (bvsub (currentByte!7533 (_3!565 lt!254410)) #b00000000000000000000000000000001)))))

(assert (=> d!55343 (= (arrayRangesEq!536 (buf!4042 thiss!1602) lt!254407 #b00000000000000000000000000000000 (bvsub (currentByte!7533 (_3!565 lt!254410)) #b00000000000000000000000000000001)) e!111369)))

(declare-fun b!161652 () Bool)

(declare-fun e!111370 () Bool)

(assert (=> b!161652 (= e!111369 e!111370)))

(declare-fun res!134763 () Bool)

(assert (=> b!161652 (=> (not res!134763) (not e!111370))))

(assert (=> b!161652 (= res!134763 (= (select (arr!4505 (buf!4042 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4505 lt!254407) #b00000000000000000000000000000000)))))

(declare-fun b!161653 () Bool)

(assert (=> b!161653 (= e!111370 (arrayRangesEq!536 (buf!4042 thiss!1602) lt!254407 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7533 (_3!565 lt!254410)) #b00000000000000000000000000000001)))))

(assert (= (and d!55343 (not res!134762)) b!161652))

(assert (= (and b!161652 res!134763) b!161653))

(assert (=> b!161652 m!256245))

(assert (=> b!161652 m!256215))

(declare-fun m!256253 () Bool)

(assert (=> b!161653 m!256253))

(assert (=> b!161605 d!55343))

(declare-fun d!55347 () Bool)

(declare-fun res!134764 () Bool)

(declare-fun e!111371 () Bool)

(assert (=> d!55347 (=> res!134764 e!111371)))

(assert (=> d!55347 (= res!134764 (= #b00000000000000000000000000000000 (bvsub (currentByte!7533 (_3!565 lt!254410)) #b00000000000000000000000000000001)))))

(assert (=> d!55347 (= (arrayRangesEq!536 (buf!4042 thiss!1602) (array!7992 (store (arr!4505 (buf!4042 thiss!1602)) (bvsub (currentByte!7533 (_3!565 lt!254410)) #b00000000000000000000000000000001) lt!254403) (size!3584 (buf!4042 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7533 (_3!565 lt!254410)) #b00000000000000000000000000000001)) e!111371)))

(declare-fun b!161654 () Bool)

(declare-fun e!111372 () Bool)

(assert (=> b!161654 (= e!111371 e!111372)))

(declare-fun res!134765 () Bool)

(assert (=> b!161654 (=> (not res!134765) (not e!111372))))

(assert (=> b!161654 (= res!134765 (= (select (arr!4505 (buf!4042 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4505 (array!7992 (store (arr!4505 (buf!4042 thiss!1602)) (bvsub (currentByte!7533 (_3!565 lt!254410)) #b00000000000000000000000000000001) lt!254403) (size!3584 (buf!4042 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161655 () Bool)

(assert (=> b!161655 (= e!111372 (arrayRangesEq!536 (buf!4042 thiss!1602) (array!7992 (store (arr!4505 (buf!4042 thiss!1602)) (bvsub (currentByte!7533 (_3!565 lt!254410)) #b00000000000000000000000000000001) lt!254403) (size!3584 (buf!4042 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7533 (_3!565 lt!254410)) #b00000000000000000000000000000001)))))

(assert (= (and d!55347 (not res!134764)) b!161654))

(assert (= (and b!161654 res!134765) b!161655))

(assert (=> b!161654 m!256245))

(declare-fun m!256255 () Bool)

(assert (=> b!161654 m!256255))

(declare-fun m!256257 () Bool)

(assert (=> b!161655 m!256257))

(assert (=> b!161605 d!55347))

(declare-fun d!55349 () Bool)

(declare-fun e!111373 () Bool)

(assert (=> d!55349 e!111373))

(declare-fun res!134766 () Bool)

(assert (=> d!55349 (=> (not res!134766) (not e!111373))))

(assert (=> d!55349 (= res!134766 (and (bvsge (bvsub (currentByte!7533 (_3!565 lt!254410)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7533 (_3!565 lt!254410)) #b00000000000000000000000000000001) (size!3584 (buf!4042 thiss!1602)))))))

(declare-fun lt!254458 () Unit!11106)

(assert (=> d!55349 (= lt!254458 (choose!168 (buf!4042 thiss!1602) (bvsub (currentByte!7533 (_3!565 lt!254410)) #b00000000000000000000000000000001) lt!254403))))

(assert (=> d!55349 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7533 (_3!565 lt!254410)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7533 (_3!565 lt!254410)) #b00000000000000000000000000000001) (size!3584 (buf!4042 thiss!1602))))))

(assert (=> d!55349 (= (arrayUpdatedAtPrefixLemma!144 (buf!4042 thiss!1602) (bvsub (currentByte!7533 (_3!565 lt!254410)) #b00000000000000000000000000000001) lt!254403) lt!254458)))

(declare-fun b!161656 () Bool)

(assert (=> b!161656 (= e!111373 (arrayRangesEq!536 (buf!4042 thiss!1602) (array!7992 (store (arr!4505 (buf!4042 thiss!1602)) (bvsub (currentByte!7533 (_3!565 lt!254410)) #b00000000000000000000000000000001) lt!254403) (size!3584 (buf!4042 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7533 (_3!565 lt!254410)) #b00000000000000000000000000000001)))))

(assert (= (and d!55349 res!134766) b!161656))

(declare-fun m!256259 () Bool)

(assert (=> d!55349 m!256259))

(assert (=> b!161656 m!256129))

(assert (=> b!161656 m!256125))

(assert (=> b!161605 d!55349))

(declare-fun d!55351 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!55351 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3584 (buf!4042 thiss!1602))) ((_ sign_extend 32) (currentByte!7533 thiss!1602)) ((_ sign_extend 32) (currentBit!7528 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3584 (buf!4042 thiss!1602))) ((_ sign_extend 32) (currentByte!7533 thiss!1602)) ((_ sign_extend 32) (currentBit!7528 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13762 () Bool)

(assert (= bs!13762 d!55351))

(declare-fun m!256261 () Bool)

(assert (=> bs!13762 m!256261))

(assert (=> start!33820 d!55351))

(declare-fun d!55353 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!55353 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7528 thiss!1602) (currentByte!7533 thiss!1602) (size!3584 (buf!4042 thiss!1602))))))

(declare-fun bs!13763 () Bool)

(assert (= bs!13763 d!55353))

(declare-fun m!256263 () Bool)

(assert (=> bs!13763 m!256263))

(assert (=> start!33820 d!55353))

(declare-fun d!55355 () Bool)

(assert (=> d!55355 (= (byteRangesEq!0 (select (arr!4505 (buf!4042 thiss!1602)) (currentByte!7533 thiss!1602)) lt!254402 #b00000000000000000000000000000000 (currentBit!7528 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7528 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4505 (buf!4042 thiss!1602)) (currentByte!7533 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7528 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!254402) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7528 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13767 () Bool)

(assert (= bs!13767 d!55355))

(declare-fun m!256273 () Bool)

(assert (=> bs!13767 m!256273))

(declare-fun m!256275 () Bool)

(assert (=> bs!13767 m!256275))

(assert (=> b!161604 d!55355))

(check-sat (not b!161653) (not b!161655) (not d!55329) (not b!161651) (not d!55349) (not b!161656) (not d!55353) (not d!55351) (not b!161648) (not d!55341) (not b!161650) (not b!161636))
(check-sat)
