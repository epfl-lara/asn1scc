; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33310 () Bool)

(assert start!33310)

(declare-fun res!134099 () Bool)

(declare-fun e!110519 () Bool)

(assert (=> start!33310 (=> (not res!134099) (not e!110519))))

(declare-datatypes ((array!7879 0))(
  ( (array!7880 (arr!4466 (Array (_ BitVec 32) (_ BitVec 8))) (size!3545 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6258 0))(
  ( (BitStream!6259 (buf!4003 array!7879) (currentByte!7423 (_ BitVec 32)) (currentBit!7418 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6258)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33310 (= res!134099 (validate_offset_byte!0 ((_ sign_extend 32) (size!3545 (buf!4003 thiss!1602))) ((_ sign_extend 32) (currentByte!7423 thiss!1602)) ((_ sign_extend 32) (currentBit!7418 thiss!1602))))))

(assert (=> start!33310 e!110519))

(declare-fun e!110517 () Bool)

(declare-fun inv!12 (BitStream!6258) Bool)

(assert (=> start!33310 (and (inv!12 thiss!1602) e!110517)))

(assert (=> start!33310 true))

(declare-fun b!160867 () Bool)

(declare-fun lt!253188 () (_ BitVec 32))

(assert (=> b!160867 (= e!110519 (not (or (bvsle lt!253188 #b00000000000000000000000000000000) (and (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!7423 thiss!1602)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!7423 thiss!1602)) (size!3545 (buf!4003 thiss!1602)))))))))

(declare-fun e!110518 () Bool)

(assert (=> b!160867 e!110518))

(declare-fun res!134098 () Bool)

(assert (=> b!160867 (=> res!134098 e!110518)))

(assert (=> b!160867 (= res!134098 (bvsge (currentByte!7423 thiss!1602) (size!3545 (buf!4003 thiss!1602))))))

(assert (=> b!160867 (= lt!253188 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7418 thiss!1602))))))

(declare-fun b!160868 () Bool)

(declare-fun v!222 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160868 (= e!110518 (byteRangesEq!0 (select (arr!4466 (buf!4003 thiss!1602)) (currentByte!7423 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4466 (buf!4003 thiss!1602)) (currentByte!7423 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253188))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253188))) #b00000000000000000000000000000000 (currentBit!7418 thiss!1602)))))

(declare-fun b!160869 () Bool)

(declare-fun array_inv!3292 (array!7879) Bool)

(assert (=> b!160869 (= e!110517 (array_inv!3292 (buf!4003 thiss!1602)))))

(assert (= (and start!33310 res!134099) b!160867))

(assert (= (and b!160867 (not res!134098)) b!160868))

(assert (= start!33310 b!160869))

(declare-fun m!254185 () Bool)

(assert (=> start!33310 m!254185))

(declare-fun m!254187 () Bool)

(assert (=> start!33310 m!254187))

(declare-fun m!254189 () Bool)

(assert (=> b!160868 m!254189))

(declare-fun m!254191 () Bool)

(assert (=> b!160868 m!254191))

(assert (=> b!160868 m!254189))

(declare-fun m!254193 () Bool)

(assert (=> b!160868 m!254193))

(declare-fun m!254195 () Bool)

(assert (=> b!160869 m!254195))

(check-sat (not b!160869) (not b!160868) (not start!33310))
(check-sat)
(get-model)

(declare-fun d!54739 () Bool)

(assert (=> d!54739 (= (array_inv!3292 (buf!4003 thiss!1602)) (bvsge (size!3545 (buf!4003 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160869 d!54739))

(declare-fun d!54741 () Bool)

(assert (=> d!54741 (= (byteRangesEq!0 (select (arr!4466 (buf!4003 thiss!1602)) (currentByte!7423 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4466 (buf!4003 thiss!1602)) (currentByte!7423 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253188))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253188))) #b00000000000000000000000000000000 (currentBit!7418 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7418 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4466 (buf!4003 thiss!1602)) (currentByte!7423 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7418 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4466 (buf!4003 thiss!1602)) (currentByte!7423 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253188))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253188)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7418 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13613 () Bool)

(assert (= bs!13613 d!54741))

(declare-fun m!254213 () Bool)

(assert (=> bs!13613 m!254213))

(declare-fun m!254215 () Bool)

(assert (=> bs!13613 m!254215))

(assert (=> b!160868 d!54741))

(declare-fun d!54747 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54747 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3545 (buf!4003 thiss!1602))) ((_ sign_extend 32) (currentByte!7423 thiss!1602)) ((_ sign_extend 32) (currentBit!7418 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3545 (buf!4003 thiss!1602))) ((_ sign_extend 32) (currentByte!7423 thiss!1602)) ((_ sign_extend 32) (currentBit!7418 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13615 () Bool)

(assert (= bs!13615 d!54747))

(declare-fun m!254219 () Bool)

(assert (=> bs!13615 m!254219))

(assert (=> start!33310 d!54747))

(declare-fun d!54755 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54755 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7418 thiss!1602) (currentByte!7423 thiss!1602) (size!3545 (buf!4003 thiss!1602))))))

(declare-fun bs!13617 () Bool)

(assert (= bs!13617 d!54755))

(declare-fun m!254223 () Bool)

(assert (=> bs!13617 m!254223))

(assert (=> start!33310 d!54755))

(check-sat (not d!54747) (not d!54755))
(check-sat)
(get-model)

(declare-fun d!54763 () Bool)

(assert (=> d!54763 (= (remainingBits!0 ((_ sign_extend 32) (size!3545 (buf!4003 thiss!1602))) ((_ sign_extend 32) (currentByte!7423 thiss!1602)) ((_ sign_extend 32) (currentBit!7418 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3545 (buf!4003 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7423 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7418 thiss!1602)))))))

(assert (=> d!54747 d!54763))

(declare-fun d!54765 () Bool)

(assert (=> d!54765 (= (invariant!0 (currentBit!7418 thiss!1602) (currentByte!7423 thiss!1602) (size!3545 (buf!4003 thiss!1602))) (and (bvsge (currentBit!7418 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7418 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7423 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7423 thiss!1602) (size!3545 (buf!4003 thiss!1602))) (and (= (currentBit!7418 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7423 thiss!1602) (size!3545 (buf!4003 thiss!1602)))))))))

(assert (=> d!54755 d!54765))

(check-sat)
