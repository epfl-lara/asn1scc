; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33354 () Bool)

(assert start!33354)

(declare-fun res!134123 () Bool)

(declare-fun e!110565 () Bool)

(assert (=> start!33354 (=> (not res!134123) (not e!110565))))

(declare-datatypes ((array!7890 0))(
  ( (array!7891 (arr!4470 (Array (_ BitVec 32) (_ BitVec 8))) (size!3549 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6266 0))(
  ( (BitStream!6267 (buf!4007 array!7890) (currentByte!7436 (_ BitVec 32)) (currentBit!7431 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6266)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33354 (= res!134123 (validate_offset_byte!0 ((_ sign_extend 32) (size!3549 (buf!4007 thiss!1602))) ((_ sign_extend 32) (currentByte!7436 thiss!1602)) ((_ sign_extend 32) (currentBit!7431 thiss!1602))))))

(assert (=> start!33354 e!110565))

(declare-fun e!110567 () Bool)

(declare-fun inv!12 (BitStream!6266) Bool)

(assert (=> start!33354 (and (inv!12 thiss!1602) e!110567)))

(assert (=> start!33354 true))

(declare-fun b!160903 () Bool)

(declare-datatypes ((Unit!10966 0))(
  ( (Unit!10967) )
))
(declare-datatypes ((tuple3!826 0))(
  ( (tuple3!827 (_1!7764 Unit!10966) (_2!7764 (_ BitVec 8)) (_3!530 BitStream!6266)) )
))
(declare-fun lt!253257 () tuple3!826)

(assert (=> b!160903 (= e!110565 (not (or (= (bvand (currentByte!7436 (_3!530 lt!253257)) #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand (currentByte!7436 (_3!530 lt!253257)) #b10000000000000000000000000000000) (bvand (bvsub (currentByte!7436 (_3!530 lt!253257)) #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!253261 () (_ BitVec 32))

(declare-fun lt!253258 () (_ BitVec 32))

(declare-fun lt!253256 () (_ BitVec 8))

(declare-fun lt!253260 () array!7890)

(declare-fun lt!253259 () (_ BitVec 8))

(declare-fun lt!253263 () (_ BitVec 8))

(declare-fun lt!253262 () (_ BitVec 32))

(declare-fun Unit!10968 () Unit!10966)

(declare-fun Unit!10969 () Unit!10966)

(assert (=> b!160903 (= lt!253257 (ite (bvsgt lt!253258 #b00000000000000000000000000000000) (let ((bdg!9533 ((_ extract 7 0) (bvnot lt!253261)))) (let ((bdg!9534 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4470 (buf!4007 thiss!1602)) (currentByte!7436 thiss!1602) lt!253263) (currentByte!7436 thiss!1602) lt!253259) (bvadd #b00000000000000000000000000000001 (currentByte!7436 thiss!1602)))) ((_ sign_extend 24) bdg!9533))))) (tuple3!827 Unit!10968 bdg!9533 (BitStream!6267 (array!7891 (store (arr!4470 (array!7891 (store (arr!4470 lt!253260) (bvadd #b00000000000000000000000000000001 (currentByte!7436 thiss!1602)) bdg!9534) (size!3549 lt!253260))) (bvadd #b00000000000000000000000000000001 (currentByte!7436 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9534) (bvshl ((_ sign_extend 24) v!222) lt!253262)))) (size!3549 (array!7891 (store (arr!4470 lt!253260) (bvadd #b00000000000000000000000000000001 (currentByte!7436 thiss!1602)) bdg!9534) (size!3549 lt!253260)))) (bvadd #b00000000000000000000000000000001 (currentByte!7436 thiss!1602)) (currentBit!7431 thiss!1602))))) (tuple3!827 Unit!10969 lt!253256 (BitStream!6267 lt!253260 (bvadd #b00000000000000000000000000000001 (currentByte!7436 thiss!1602)) (currentBit!7431 thiss!1602)))))))

(declare-fun e!110568 () Bool)

(assert (=> b!160903 e!110568))

(declare-fun res!134122 () Bool)

(assert (=> b!160903 (=> res!134122 e!110568)))

(assert (=> b!160903 (= res!134122 (bvsge (currentByte!7436 thiss!1602) (size!3549 (buf!4007 thiss!1602))))))

(assert (=> b!160903 (= lt!253260 (array!7891 (store (store (arr!4470 (buf!4007 thiss!1602)) (currentByte!7436 thiss!1602) lt!253263) (currentByte!7436 thiss!1602) lt!253259) (size!3549 (buf!4007 thiss!1602))))))

(assert (=> b!160903 (= lt!253259 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253263) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253258))))))

(assert (=> b!160903 (= lt!253263 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4470 (buf!4007 thiss!1602)) (currentByte!7436 thiss!1602))) lt!253261)))))

(assert (=> b!160903 (= lt!253261 ((_ sign_extend 24) lt!253256))))

(assert (=> b!160903 (= lt!253256 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!253262)))))))

(assert (=> b!160903 (= lt!253262 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253258))))))

(assert (=> b!160903 (= lt!253258 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7431 thiss!1602))))))

(declare-fun b!160904 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160904 (= e!110568 (byteRangesEq!0 (select (arr!4470 (buf!4007 thiss!1602)) (currentByte!7436 thiss!1602)) lt!253259 #b00000000000000000000000000000000 (currentBit!7431 thiss!1602)))))

(declare-fun b!160905 () Bool)

(declare-fun array_inv!3296 (array!7890) Bool)

(assert (=> b!160905 (= e!110567 (array_inv!3296 (buf!4007 thiss!1602)))))

(assert (= (and start!33354 res!134123) b!160903))

(assert (= (and b!160903 (not res!134122)) b!160904))

(assert (= start!33354 b!160905))

(declare-fun m!254277 () Bool)

(assert (=> start!33354 m!254277))

(declare-fun m!254279 () Bool)

(assert (=> start!33354 m!254279))

(declare-fun m!254281 () Bool)

(assert (=> b!160903 m!254281))

(declare-fun m!254283 () Bool)

(assert (=> b!160903 m!254283))

(declare-fun m!254285 () Bool)

(assert (=> b!160903 m!254285))

(declare-fun m!254287 () Bool)

(assert (=> b!160903 m!254287))

(declare-fun m!254289 () Bool)

(assert (=> b!160903 m!254289))

(declare-fun m!254291 () Bool)

(assert (=> b!160903 m!254291))

(declare-fun m!254293 () Bool)

(assert (=> b!160903 m!254293))

(assert (=> b!160904 m!254285))

(assert (=> b!160904 m!254285))

(declare-fun m!254295 () Bool)

(assert (=> b!160904 m!254295))

(declare-fun m!254297 () Bool)

(assert (=> b!160905 m!254297))

(push 1)

(assert (not start!33354))

(assert (not b!160905))

(assert (not b!160904))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54789 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54789 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3549 (buf!4007 thiss!1602))) ((_ sign_extend 32) (currentByte!7436 thiss!1602)) ((_ sign_extend 32) (currentBit!7431 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3549 (buf!4007 thiss!1602))) ((_ sign_extend 32) (currentByte!7436 thiss!1602)) ((_ sign_extend 32) (currentBit!7431 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13627 () Bool)

(assert (= bs!13627 d!54789))

(declare-fun m!254307 () Bool)

(assert (=> bs!13627 m!254307))

(assert (=> start!33354 d!54789))

(declare-fun d!54791 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54791 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7431 thiss!1602) (currentByte!7436 thiss!1602) (size!3549 (buf!4007 thiss!1602))))))

(declare-fun bs!13628 () Bool)

(assert (= bs!13628 d!54791))

(declare-fun m!254309 () Bool)

(assert (=> bs!13628 m!254309))

(assert (=> start!33354 d!54791))

(declare-fun d!54793 () Bool)

(assert (=> d!54793 (= (array_inv!3296 (buf!4007 thiss!1602)) (bvsge (size!3549 (buf!4007 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160905 d!54793))

(declare-fun d!54795 () Bool)

(assert (=> d!54795 (= (byteRangesEq!0 (select (arr!4470 (buf!4007 thiss!1602)) (currentByte!7436 thiss!1602)) lt!253259 #b00000000000000000000000000000000 (currentBit!7431 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7431 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4470 (buf!4007 thiss!1602)) (currentByte!7436 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7431 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!253259) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7431 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13630 () Bool)

(assert (= bs!13630 d!54795))

(declare-fun m!254315 () Bool)

(assert (=> bs!13630 m!254315))

(declare-fun m!254317 () Bool)

(assert (=> bs!13630 m!254317))

(assert (=> b!160904 d!54795))

(push 1)

(assert (not d!54789))

(assert (not d!54791))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

