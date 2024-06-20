; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33466 () Bool)

(assert start!33466)

(declare-fun res!134164 () Bool)

(declare-fun e!110650 () Bool)

(assert (=> start!33466 (=> (not res!134164) (not e!110650))))

(declare-datatypes ((array!7913 0))(
  ( (array!7914 (arr!4477 (Array (_ BitVec 32) (_ BitVec 8))) (size!3556 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6280 0))(
  ( (BitStream!6281 (buf!4014 array!7913) (currentByte!7465 (_ BitVec 32)) (currentBit!7460 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6280)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33466 (= res!134164 (validate_offset_byte!0 ((_ sign_extend 32) (size!3556 (buf!4014 thiss!1602))) ((_ sign_extend 32) (currentByte!7465 thiss!1602)) ((_ sign_extend 32) (currentBit!7460 thiss!1602))))))

(assert (=> start!33466 e!110650))

(declare-fun e!110652 () Bool)

(declare-fun inv!12 (BitStream!6280) Bool)

(assert (=> start!33466 (and (inv!12 thiss!1602) e!110652)))

(assert (=> start!33466 true))

(declare-fun b!160966 () Bool)

(declare-datatypes ((Unit!10994 0))(
  ( (Unit!10995) )
))
(declare-datatypes ((tuple3!840 0))(
  ( (tuple3!841 (_1!7771 Unit!10994) (_2!7771 (_ BitVec 8)) (_3!537 BitStream!6280)) )
))
(declare-fun lt!253429 () tuple3!840)

(assert (=> b!160966 (= e!110650 (not (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7465 (_3!537 lt!253429)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7465 (_3!537 lt!253429)) #b00000000000000000000000000000001) (size!3556 (buf!4014 thiss!1602))))))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!253424 () (_ BitVec 8))

(declare-fun lt!253427 () (_ BitVec 8))

(declare-fun lt!253425 () array!7913)

(declare-fun lt!253431 () (_ BitVec 32))

(declare-fun lt!253430 () (_ BitVec 8))

(declare-fun lt!253428 () (_ BitVec 32))

(declare-fun lt!253426 () (_ BitVec 32))

(declare-fun Unit!10996 () Unit!10994)

(declare-fun Unit!10997 () Unit!10994)

(assert (=> b!160966 (= lt!253429 (ite (bvsgt lt!253426 #b00000000000000000000000000000000) (let ((bdg!9563 ((_ extract 7 0) (bvnot lt!253428)))) (let ((bdg!9564 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4477 (buf!4014 thiss!1602)) (currentByte!7465 thiss!1602) lt!253430) (currentByte!7465 thiss!1602) lt!253427) (bvadd #b00000000000000000000000000000001 (currentByte!7465 thiss!1602)))) ((_ sign_extend 24) bdg!9563))))) (tuple3!841 Unit!10996 bdg!9563 (BitStream!6281 (array!7914 (store (arr!4477 (array!7914 (store (arr!4477 lt!253425) (bvadd #b00000000000000000000000000000001 (currentByte!7465 thiss!1602)) bdg!9564) (size!3556 lt!253425))) (bvadd #b00000000000000000000000000000001 (currentByte!7465 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9564) (bvshl ((_ sign_extend 24) v!222) lt!253431)))) (size!3556 (array!7914 (store (arr!4477 lt!253425) (bvadd #b00000000000000000000000000000001 (currentByte!7465 thiss!1602)) bdg!9564) (size!3556 lt!253425)))) (bvadd #b00000000000000000000000000000001 (currentByte!7465 thiss!1602)) (currentBit!7460 thiss!1602))))) (tuple3!841 Unit!10997 lt!253424 (BitStream!6281 lt!253425 (bvadd #b00000000000000000000000000000001 (currentByte!7465 thiss!1602)) (currentBit!7460 thiss!1602)))))))

(declare-fun e!110651 () Bool)

(assert (=> b!160966 e!110651))

(declare-fun res!134165 () Bool)

(assert (=> b!160966 (=> res!134165 e!110651)))

(assert (=> b!160966 (= res!134165 (bvsge (currentByte!7465 thiss!1602) (size!3556 (buf!4014 thiss!1602))))))

(assert (=> b!160966 (= lt!253425 (array!7914 (store (store (arr!4477 (buf!4014 thiss!1602)) (currentByte!7465 thiss!1602) lt!253430) (currentByte!7465 thiss!1602) lt!253427) (size!3556 (buf!4014 thiss!1602))))))

(assert (=> b!160966 (= lt!253427 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253430) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253426))))))

(assert (=> b!160966 (= lt!253430 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4477 (buf!4014 thiss!1602)) (currentByte!7465 thiss!1602))) lt!253428)))))

(assert (=> b!160966 (= lt!253428 ((_ sign_extend 24) lt!253424))))

(assert (=> b!160966 (= lt!253424 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!253431)))))))

(assert (=> b!160966 (= lt!253431 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253426))))))

(assert (=> b!160966 (= lt!253426 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7460 thiss!1602))))))

(declare-fun b!160967 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160967 (= e!110651 (byteRangesEq!0 (select (arr!4477 (buf!4014 thiss!1602)) (currentByte!7465 thiss!1602)) lt!253427 #b00000000000000000000000000000000 (currentBit!7460 thiss!1602)))))

(declare-fun b!160968 () Bool)

(declare-fun array_inv!3303 (array!7913) Bool)

(assert (=> b!160968 (= e!110652 (array_inv!3303 (buf!4014 thiss!1602)))))

(assert (= (and start!33466 res!134164) b!160966))

(assert (= (and b!160966 (not res!134165)) b!160967))

(assert (= start!33466 b!160968))

(declare-fun m!254503 () Bool)

(assert (=> start!33466 m!254503))

(declare-fun m!254505 () Bool)

(assert (=> start!33466 m!254505))

(declare-fun m!254507 () Bool)

(assert (=> b!160966 m!254507))

(declare-fun m!254509 () Bool)

(assert (=> b!160966 m!254509))

(declare-fun m!254511 () Bool)

(assert (=> b!160966 m!254511))

(declare-fun m!254513 () Bool)

(assert (=> b!160966 m!254513))

(declare-fun m!254515 () Bool)

(assert (=> b!160966 m!254515))

(declare-fun m!254517 () Bool)

(assert (=> b!160966 m!254517))

(declare-fun m!254519 () Bool)

(assert (=> b!160966 m!254519))

(assert (=> b!160967 m!254519))

(assert (=> b!160967 m!254519))

(declare-fun m!254521 () Bool)

(assert (=> b!160967 m!254521))

(declare-fun m!254523 () Bool)

(assert (=> b!160968 m!254523))

(push 1)

(assert (not b!160968))

(assert (not start!33466))

(assert (not b!160967))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54881 () Bool)

(assert (=> d!54881 (= (array_inv!3303 (buf!4014 thiss!1602)) (bvsge (size!3556 (buf!4014 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160968 d!54881))

(declare-fun d!54883 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54883 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3556 (buf!4014 thiss!1602))) ((_ sign_extend 32) (currentByte!7465 thiss!1602)) ((_ sign_extend 32) (currentBit!7460 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3556 (buf!4014 thiss!1602))) ((_ sign_extend 32) (currentByte!7465 thiss!1602)) ((_ sign_extend 32) (currentBit!7460 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13660 () Bool)

(assert (= bs!13660 d!54883))

(declare-fun m!254569 () Bool)

(assert (=> bs!13660 m!254569))

(assert (=> start!33466 d!54883))

(declare-fun d!54885 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54885 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7460 thiss!1602) (currentByte!7465 thiss!1602) (size!3556 (buf!4014 thiss!1602))))))

(declare-fun bs!13661 () Bool)

(assert (= bs!13661 d!54885))

(declare-fun m!254571 () Bool)

(assert (=> bs!13661 m!254571))

(assert (=> start!33466 d!54885))

(declare-fun d!54887 () Bool)

(assert (=> d!54887 (= (byteRangesEq!0 (select (arr!4477 (buf!4014 thiss!1602)) (currentByte!7465 thiss!1602)) lt!253427 #b00000000000000000000000000000000 (currentBit!7460 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7460 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4477 (buf!4014 thiss!1602)) (currentByte!7465 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7460 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!253427) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7460 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13662 () Bool)

(assert (= bs!13662 d!54887))

(declare-fun m!254573 () Bool)

(assert (=> bs!13662 m!254573))

(declare-fun m!254575 () Bool)

(assert (=> bs!13662 m!254575))

(assert (=> b!160967 d!54887))

(push 1)

(assert (not d!54885))

(assert (not d!54883))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54909 () Bool)

(assert (=> d!54909 (= (invariant!0 (currentBit!7460 thiss!1602) (currentByte!7465 thiss!1602) (size!3556 (buf!4014 thiss!1602))) (and (bvsge (currentBit!7460 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7460 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7465 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7465 thiss!1602) (size!3556 (buf!4014 thiss!1602))) (and (= (currentBit!7460 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7465 thiss!1602) (size!3556 (buf!4014 thiss!1602)))))))))

(assert (=> d!54885 d!54909))

(declare-fun d!54911 () Bool)

(assert (=> d!54911 (= (remainingBits!0 ((_ sign_extend 32) (size!3556 (buf!4014 thiss!1602))) ((_ sign_extend 32) (currentByte!7465 thiss!1602)) ((_ sign_extend 32) (currentBit!7460 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3556 (buf!4014 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7465 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7460 thiss!1602)))))))

(assert (=> d!54883 d!54911))

(push 1)

(check-sat)

(pop 1)

