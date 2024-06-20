; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33052 () Bool)

(assert start!33052)

(declare-fun res!133919 () Bool)

(declare-fun e!110177 () Bool)

(assert (=> start!33052 (=> (not res!133919) (not e!110177))))

(declare-datatypes ((array!7807 0))(
  ( (array!7808 (arr!4439 (Array (_ BitVec 32) (_ BitVec 8))) (size!3518 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6204 0))(
  ( (BitStream!6205 (buf!3976 array!7807) (currentByte!7348 (_ BitVec 32)) (currentBit!7343 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6204)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33052 (= res!133919 (validate_offset_byte!0 ((_ sign_extend 32) (size!3518 (buf!3976 thiss!1602))) ((_ sign_extend 32) (currentByte!7348 thiss!1602)) ((_ sign_extend 32) (currentBit!7343 thiss!1602))))))

(assert (=> start!33052 e!110177))

(declare-fun e!110176 () Bool)

(declare-fun inv!12 (BitStream!6204) Bool)

(assert (=> start!33052 (and (inv!12 thiss!1602) e!110176)))

(assert (=> start!33052 true))

(declare-fun b!160606 () Bool)

(declare-fun e!110175 () Bool)

(assert (=> b!160606 (= e!110177 e!110175)))

(declare-fun res!133918 () Bool)

(assert (=> b!160606 (=> (not res!133918) (not e!110175))))

(assert (=> b!160606 (= res!133918 (bvslt (currentByte!7348 thiss!1602) (size!3518 (buf!3976 thiss!1602))))))

(declare-fun lt!253008 () (_ BitVec 32))

(assert (=> b!160606 (= lt!253008 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7343 thiss!1602))))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun b!160607 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160607 (= e!110175 (not (byteRangesEq!0 (select (arr!4439 (buf!3976 thiss!1602)) (currentByte!7348 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4439 (buf!3976 thiss!1602)) (currentByte!7348 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253008))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253008))) #b00000000000000000000000000000000 (currentBit!7343 thiss!1602))))))

(declare-fun b!160608 () Bool)

(declare-fun array_inv!3265 (array!7807) Bool)

(assert (=> b!160608 (= e!110176 (array_inv!3265 (buf!3976 thiss!1602)))))

(assert (= (and start!33052 res!133919) b!160606))

(assert (= (and b!160606 res!133918) b!160607))

(assert (= start!33052 b!160608))

(declare-fun m!253639 () Bool)

(assert (=> start!33052 m!253639))

(declare-fun m!253641 () Bool)

(assert (=> start!33052 m!253641))

(declare-fun m!253643 () Bool)

(assert (=> b!160607 m!253643))

(declare-fun m!253645 () Bool)

(assert (=> b!160607 m!253645))

(assert (=> b!160607 m!253643))

(declare-fun m!253647 () Bool)

(assert (=> b!160607 m!253647))

(declare-fun m!253649 () Bool)

(assert (=> b!160608 m!253649))

(check-sat (not start!33052) (not b!160607) (not b!160608))
(check-sat)
(get-model)

(declare-fun d!54493 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54493 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3518 (buf!3976 thiss!1602))) ((_ sign_extend 32) (currentByte!7348 thiss!1602)) ((_ sign_extend 32) (currentBit!7343 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3518 (buf!3976 thiss!1602))) ((_ sign_extend 32) (currentByte!7348 thiss!1602)) ((_ sign_extend 32) (currentBit!7343 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13525 () Bool)

(assert (= bs!13525 d!54493))

(declare-fun m!253663 () Bool)

(assert (=> bs!13525 m!253663))

(assert (=> start!33052 d!54493))

(declare-fun d!54495 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54495 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7343 thiss!1602) (currentByte!7348 thiss!1602) (size!3518 (buf!3976 thiss!1602))))))

(declare-fun bs!13526 () Bool)

(assert (= bs!13526 d!54495))

(declare-fun m!253665 () Bool)

(assert (=> bs!13526 m!253665))

(assert (=> start!33052 d!54495))

(declare-fun d!54497 () Bool)

(assert (=> d!54497 (= (byteRangesEq!0 (select (arr!4439 (buf!3976 thiss!1602)) (currentByte!7348 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4439 (buf!3976 thiss!1602)) (currentByte!7348 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253008))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253008))) #b00000000000000000000000000000000 (currentBit!7343 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7343 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4439 (buf!3976 thiss!1602)) (currentByte!7348 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7343 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4439 (buf!3976 thiss!1602)) (currentByte!7348 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253008))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253008)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7343 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13529 () Bool)

(assert (= bs!13529 d!54497))

(declare-fun m!253671 () Bool)

(assert (=> bs!13529 m!253671))

(declare-fun m!253673 () Bool)

(assert (=> bs!13529 m!253673))

(assert (=> b!160607 d!54497))

(declare-fun d!54505 () Bool)

(assert (=> d!54505 (= (array_inv!3265 (buf!3976 thiss!1602)) (bvsge (size!3518 (buf!3976 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160608 d!54505))

(check-sat (not d!54495) (not d!54493))
(check-sat)
