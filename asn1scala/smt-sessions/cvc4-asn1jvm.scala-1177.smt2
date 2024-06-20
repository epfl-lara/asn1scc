; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33312 () Bool)

(assert start!33312)

(declare-fun res!134105 () Bool)

(declare-fun e!110530 () Bool)

(assert (=> start!33312 (=> (not res!134105) (not e!110530))))

(declare-datatypes ((array!7881 0))(
  ( (array!7882 (arr!4467 (Array (_ BitVec 32) (_ BitVec 8))) (size!3546 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6260 0))(
  ( (BitStream!6261 (buf!4004 array!7881) (currentByte!7424 (_ BitVec 32)) (currentBit!7419 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6260)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33312 (= res!134105 (validate_offset_byte!0 ((_ sign_extend 32) (size!3546 (buf!4004 thiss!1602))) ((_ sign_extend 32) (currentByte!7424 thiss!1602)) ((_ sign_extend 32) (currentBit!7419 thiss!1602))))))

(assert (=> start!33312 e!110530))

(declare-fun e!110529 () Bool)

(declare-fun inv!12 (BitStream!6260) Bool)

(assert (=> start!33312 (and (inv!12 thiss!1602) e!110529)))

(assert (=> start!33312 true))

(declare-fun b!160876 () Bool)

(declare-fun lt!253191 () (_ BitVec 32))

(assert (=> b!160876 (= e!110530 (not (or (bvsle lt!253191 #b00000000000000000000000000000000) (and (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!7424 thiss!1602)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!7424 thiss!1602)) (size!3546 (buf!4004 thiss!1602)))))))))

(declare-fun e!110531 () Bool)

(assert (=> b!160876 e!110531))

(declare-fun res!134104 () Bool)

(assert (=> b!160876 (=> res!134104 e!110531)))

(assert (=> b!160876 (= res!134104 (bvsge (currentByte!7424 thiss!1602) (size!3546 (buf!4004 thiss!1602))))))

(assert (=> b!160876 (= lt!253191 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7419 thiss!1602))))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun b!160877 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160877 (= e!110531 (byteRangesEq!0 (select (arr!4467 (buf!4004 thiss!1602)) (currentByte!7424 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4467 (buf!4004 thiss!1602)) (currentByte!7424 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253191))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253191))) #b00000000000000000000000000000000 (currentBit!7419 thiss!1602)))))

(declare-fun b!160878 () Bool)

(declare-fun array_inv!3293 (array!7881) Bool)

(assert (=> b!160878 (= e!110529 (array_inv!3293 (buf!4004 thiss!1602)))))

(assert (= (and start!33312 res!134105) b!160876))

(assert (= (and b!160876 (not res!134104)) b!160877))

(assert (= start!33312 b!160878))

(declare-fun m!254197 () Bool)

(assert (=> start!33312 m!254197))

(declare-fun m!254199 () Bool)

(assert (=> start!33312 m!254199))

(declare-fun m!254201 () Bool)

(assert (=> b!160877 m!254201))

(declare-fun m!254203 () Bool)

(assert (=> b!160877 m!254203))

(assert (=> b!160877 m!254201))

(declare-fun m!254205 () Bool)

(assert (=> b!160877 m!254205))

(declare-fun m!254207 () Bool)

(assert (=> b!160878 m!254207))

(push 1)

(assert (not b!160877))

(assert (not b!160878))

(assert (not start!33312))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54753 () Bool)

(assert (=> d!54753 (= (byteRangesEq!0 (select (arr!4467 (buf!4004 thiss!1602)) (currentByte!7424 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4467 (buf!4004 thiss!1602)) (currentByte!7424 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253191))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253191))) #b00000000000000000000000000000000 (currentBit!7419 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7419 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4467 (buf!4004 thiss!1602)) (currentByte!7424 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7419 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4467 (buf!4004 thiss!1602)) (currentByte!7424 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253191))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253191)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7419 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13618 () Bool)

(assert (= bs!13618 d!54753))

(declare-fun m!254225 () Bool)

(assert (=> bs!13618 m!254225))

(declare-fun m!254227 () Bool)

(assert (=> bs!13618 m!254227))

(assert (=> b!160877 d!54753))

(declare-fun d!54757 () Bool)

(assert (=> d!54757 (= (array_inv!3293 (buf!4004 thiss!1602)) (bvsge (size!3546 (buf!4004 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160878 d!54757))

(declare-fun d!54759 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54759 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3546 (buf!4004 thiss!1602))) ((_ sign_extend 32) (currentByte!7424 thiss!1602)) ((_ sign_extend 32) (currentBit!7419 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3546 (buf!4004 thiss!1602))) ((_ sign_extend 32) (currentByte!7424 thiss!1602)) ((_ sign_extend 32) (currentBit!7419 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13619 () Bool)

(assert (= bs!13619 d!54759))

(declare-fun m!254229 () Bool)

(assert (=> bs!13619 m!254229))

(assert (=> start!33312 d!54759))

(declare-fun d!54761 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54761 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7419 thiss!1602) (currentByte!7424 thiss!1602) (size!3546 (buf!4004 thiss!1602))))))

(declare-fun bs!13620 () Bool)

(assert (= bs!13620 d!54761))

(declare-fun m!254231 () Bool)

(assert (=> bs!13620 m!254231))

(assert (=> start!33312 d!54761))

(push 1)

(assert (not d!54759))

(assert (not d!54761))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54771 () Bool)

(assert (=> d!54771 (= (remainingBits!0 ((_ sign_extend 32) (size!3546 (buf!4004 thiss!1602))) ((_ sign_extend 32) (currentByte!7424 thiss!1602)) ((_ sign_extend 32) (currentBit!7419 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3546 (buf!4004 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7424 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7419 thiss!1602)))))))

(assert (=> d!54759 d!54771))

(declare-fun d!54773 () Bool)

(assert (=> d!54773 (= (invariant!0 (currentBit!7419 thiss!1602) (currentByte!7424 thiss!1602) (size!3546 (buf!4004 thiss!1602))) (and (bvsge (currentBit!7419 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7419 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7424 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7424 thiss!1602) (size!3546 (buf!4004 thiss!1602))) (and (= (currentBit!7419 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7424 thiss!1602) (size!3546 (buf!4004 thiss!1602)))))))))

(assert (=> d!54761 d!54773))

(push 1)

(check-sat)

(pop 1)

