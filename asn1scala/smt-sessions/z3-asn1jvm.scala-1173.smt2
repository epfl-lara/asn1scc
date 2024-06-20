; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33178 () Bool)

(assert start!33178)

(declare-fun res!134018 () Bool)

(declare-fun e!110366 () Bool)

(assert (=> start!33178 (=> (not res!134018) (not e!110366))))

(declare-datatypes ((array!7846 0))(
  ( (array!7847 (arr!4454 (Array (_ BitVec 32) (_ BitVec 8))) (size!3533 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6234 0))(
  ( (BitStream!6235 (buf!3991 array!7846) (currentByte!7384 (_ BitVec 32)) (currentBit!7379 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6234)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33178 (= res!134018 (validate_offset_byte!0 ((_ sign_extend 32) (size!3533 (buf!3991 thiss!1602))) ((_ sign_extend 32) (currentByte!7384 thiss!1602)) ((_ sign_extend 32) (currentBit!7379 thiss!1602))))))

(assert (=> start!33178 e!110366))

(declare-fun e!110364 () Bool)

(declare-fun inv!12 (BitStream!6234) Bool)

(assert (=> start!33178 (and (inv!12 thiss!1602) e!110364)))

(assert (=> start!33178 true))

(declare-fun b!160750 () Bool)

(declare-fun lt!253098 () (_ BitVec 32))

(assert (=> b!160750 (= e!110366 (not (or (bvsle lt!253098 #b00000000000000000000000000000000) (and (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!7384 thiss!1602)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!7384 thiss!1602)) (size!3533 (buf!3991 thiss!1602)))))))))

(declare-fun e!110367 () Bool)

(assert (=> b!160750 e!110367))

(declare-fun res!134017 () Bool)

(assert (=> b!160750 (=> res!134017 e!110367)))

(assert (=> b!160750 (= res!134017 (bvsge (currentByte!7384 thiss!1602) (size!3533 (buf!3991 thiss!1602))))))

(assert (=> b!160750 (= lt!253098 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7379 thiss!1602))))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun b!160751 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160751 (= e!110367 (byteRangesEq!0 (select (arr!4454 (buf!3991 thiss!1602)) (currentByte!7384 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4454 (buf!3991 thiss!1602)) (currentByte!7384 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253098))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253098))) #b00000000000000000000000000000000 (currentBit!7379 thiss!1602)))))

(declare-fun b!160752 () Bool)

(declare-fun array_inv!3280 (array!7846) Bool)

(assert (=> b!160752 (= e!110364 (array_inv!3280 (buf!3991 thiss!1602)))))

(assert (= (and start!33178 res!134018) b!160750))

(assert (= (and b!160750 (not res!134017)) b!160751))

(assert (= start!33178 b!160752))

(declare-fun m!253927 () Bool)

(assert (=> start!33178 m!253927))

(declare-fun m!253929 () Bool)

(assert (=> start!33178 m!253929))

(declare-fun m!253931 () Bool)

(assert (=> b!160751 m!253931))

(declare-fun m!253933 () Bool)

(assert (=> b!160751 m!253933))

(assert (=> b!160751 m!253931))

(declare-fun m!253935 () Bool)

(assert (=> b!160751 m!253935))

(declare-fun m!253937 () Bool)

(assert (=> b!160752 m!253937))

(check-sat (not b!160752) (not b!160751) (not start!33178))
(check-sat)
(get-model)

(declare-fun d!54611 () Bool)

(assert (=> d!54611 (= (array_inv!3280 (buf!3991 thiss!1602)) (bvsge (size!3533 (buf!3991 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160752 d!54611))

(declare-fun d!54613 () Bool)

(assert (=> d!54613 (= (byteRangesEq!0 (select (arr!4454 (buf!3991 thiss!1602)) (currentByte!7384 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4454 (buf!3991 thiss!1602)) (currentByte!7384 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253098))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253098))) #b00000000000000000000000000000000 (currentBit!7379 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7379 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4454 (buf!3991 thiss!1602)) (currentByte!7384 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7379 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4454 (buf!3991 thiss!1602)) (currentByte!7384 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253098))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253098)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7379 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13570 () Bool)

(assert (= bs!13570 d!54613))

(declare-fun m!253951 () Bool)

(assert (=> bs!13570 m!253951))

(declare-fun m!253953 () Bool)

(assert (=> bs!13570 m!253953))

(assert (=> b!160751 d!54613))

(declare-fun d!54619 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54619 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3533 (buf!3991 thiss!1602))) ((_ sign_extend 32) (currentByte!7384 thiss!1602)) ((_ sign_extend 32) (currentBit!7379 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3533 (buf!3991 thiss!1602))) ((_ sign_extend 32) (currentByte!7384 thiss!1602)) ((_ sign_extend 32) (currentBit!7379 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13571 () Bool)

(assert (= bs!13571 d!54619))

(declare-fun m!253955 () Bool)

(assert (=> bs!13571 m!253955))

(assert (=> start!33178 d!54619))

(declare-fun d!54621 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54621 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7379 thiss!1602) (currentByte!7384 thiss!1602) (size!3533 (buf!3991 thiss!1602))))))

(declare-fun bs!13573 () Bool)

(assert (= bs!13573 d!54621))

(declare-fun m!253961 () Bool)

(assert (=> bs!13573 m!253961))

(assert (=> start!33178 d!54621))

(check-sat (not d!54619) (not d!54621))
(check-sat)
(get-model)

(declare-fun d!54635 () Bool)

(assert (=> d!54635 (= (remainingBits!0 ((_ sign_extend 32) (size!3533 (buf!3991 thiss!1602))) ((_ sign_extend 32) (currentByte!7384 thiss!1602)) ((_ sign_extend 32) (currentBit!7379 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3533 (buf!3991 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7384 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7379 thiss!1602)))))))

(assert (=> d!54619 d!54635))

(declare-fun d!54637 () Bool)

(assert (=> d!54637 (= (invariant!0 (currentBit!7379 thiss!1602) (currentByte!7384 thiss!1602) (size!3533 (buf!3991 thiss!1602))) (and (bvsge (currentBit!7379 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7379 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7384 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7384 thiss!1602) (size!3533 (buf!3991 thiss!1602))) (and (= (currentBit!7379 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7384 thiss!1602) (size!3533 (buf!3991 thiss!1602)))))))))

(assert (=> d!54621 d!54637))

(check-sat)
