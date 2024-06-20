; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33468 () Bool)

(assert start!33468)

(declare-fun res!134171 () Bool)

(declare-fun e!110663 () Bool)

(assert (=> start!33468 (=> (not res!134171) (not e!110663))))

(declare-datatypes ((array!7915 0))(
  ( (array!7916 (arr!4478 (Array (_ BitVec 32) (_ BitVec 8))) (size!3557 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6282 0))(
  ( (BitStream!6283 (buf!4015 array!7915) (currentByte!7466 (_ BitVec 32)) (currentBit!7461 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6282)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33468 (= res!134171 (validate_offset_byte!0 ((_ sign_extend 32) (size!3557 (buf!4015 thiss!1602))) ((_ sign_extend 32) (currentByte!7466 thiss!1602)) ((_ sign_extend 32) (currentBit!7461 thiss!1602))))))

(assert (=> start!33468 e!110663))

(declare-fun e!110662 () Bool)

(declare-fun inv!12 (BitStream!6282) Bool)

(assert (=> start!33468 (and (inv!12 thiss!1602) e!110662)))

(assert (=> start!33468 true))

(declare-fun b!160975 () Bool)

(declare-datatypes ((Unit!10998 0))(
  ( (Unit!10999) )
))
(declare-datatypes ((tuple3!842 0))(
  ( (tuple3!843 (_1!7772 Unit!10998) (_2!7772 (_ BitVec 8)) (_3!538 BitStream!6282)) )
))
(declare-fun lt!253450 () tuple3!842)

(assert (=> b!160975 (= e!110663 (not (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7466 (_3!538 lt!253450)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7466 (_3!538 lt!253450)) #b00000000000000000000000000000001) (size!3557 (buf!4015 thiss!1602))))))))

(declare-fun lt!253455 () (_ BitVec 32))

(declare-fun lt!253454 () array!7915)

(declare-fun lt!253453 () (_ BitVec 32))

(declare-fun lt!253449 () (_ BitVec 8))

(declare-fun lt!253452 () (_ BitVec 32))

(declare-fun lt!253448 () (_ BitVec 8))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!253451 () (_ BitVec 8))

(declare-fun Unit!11000 () Unit!10998)

(declare-fun Unit!11001 () Unit!10998)

(assert (=> b!160975 (= lt!253450 (ite (bvsgt lt!253453 #b00000000000000000000000000000000) (let ((bdg!9563 ((_ extract 7 0) (bvnot lt!253455)))) (let ((bdg!9564 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4478 (buf!4015 thiss!1602)) (currentByte!7466 thiss!1602) lt!253451) (currentByte!7466 thiss!1602) lt!253449) (bvadd #b00000000000000000000000000000001 (currentByte!7466 thiss!1602)))) ((_ sign_extend 24) bdg!9563))))) (tuple3!843 Unit!11000 bdg!9563 (BitStream!6283 (array!7916 (store (arr!4478 (array!7916 (store (arr!4478 lt!253454) (bvadd #b00000000000000000000000000000001 (currentByte!7466 thiss!1602)) bdg!9564) (size!3557 lt!253454))) (bvadd #b00000000000000000000000000000001 (currentByte!7466 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9564) (bvshl ((_ sign_extend 24) v!222) lt!253452)))) (size!3557 (array!7916 (store (arr!4478 lt!253454) (bvadd #b00000000000000000000000000000001 (currentByte!7466 thiss!1602)) bdg!9564) (size!3557 lt!253454)))) (bvadd #b00000000000000000000000000000001 (currentByte!7466 thiss!1602)) (currentBit!7461 thiss!1602))))) (tuple3!843 Unit!11001 lt!253448 (BitStream!6283 lt!253454 (bvadd #b00000000000000000000000000000001 (currentByte!7466 thiss!1602)) (currentBit!7461 thiss!1602)))))))

(declare-fun e!110661 () Bool)

(assert (=> b!160975 e!110661))

(declare-fun res!134170 () Bool)

(assert (=> b!160975 (=> res!134170 e!110661)))

(assert (=> b!160975 (= res!134170 (bvsge (currentByte!7466 thiss!1602) (size!3557 (buf!4015 thiss!1602))))))

(assert (=> b!160975 (= lt!253454 (array!7916 (store (store (arr!4478 (buf!4015 thiss!1602)) (currentByte!7466 thiss!1602) lt!253451) (currentByte!7466 thiss!1602) lt!253449) (size!3557 (buf!4015 thiss!1602))))))

(assert (=> b!160975 (= lt!253449 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253451) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253453))))))

(assert (=> b!160975 (= lt!253451 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4478 (buf!4015 thiss!1602)) (currentByte!7466 thiss!1602))) lt!253455)))))

(assert (=> b!160975 (= lt!253455 ((_ sign_extend 24) lt!253448))))

(assert (=> b!160975 (= lt!253448 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!253452)))))))

(assert (=> b!160975 (= lt!253452 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253453))))))

(assert (=> b!160975 (= lt!253453 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7461 thiss!1602))))))

(declare-fun b!160976 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160976 (= e!110661 (byteRangesEq!0 (select (arr!4478 (buf!4015 thiss!1602)) (currentByte!7466 thiss!1602)) lt!253449 #b00000000000000000000000000000000 (currentBit!7461 thiss!1602)))))

(declare-fun b!160977 () Bool)

(declare-fun array_inv!3304 (array!7915) Bool)

(assert (=> b!160977 (= e!110662 (array_inv!3304 (buf!4015 thiss!1602)))))

(assert (= (and start!33468 res!134171) b!160975))

(assert (= (and b!160975 (not res!134170)) b!160976))

(assert (= start!33468 b!160977))

(declare-fun m!254525 () Bool)

(assert (=> start!33468 m!254525))

(declare-fun m!254527 () Bool)

(assert (=> start!33468 m!254527))

(declare-fun m!254529 () Bool)

(assert (=> b!160975 m!254529))

(declare-fun m!254531 () Bool)

(assert (=> b!160975 m!254531))

(declare-fun m!254533 () Bool)

(assert (=> b!160975 m!254533))

(declare-fun m!254535 () Bool)

(assert (=> b!160975 m!254535))

(declare-fun m!254537 () Bool)

(assert (=> b!160975 m!254537))

(declare-fun m!254539 () Bool)

(assert (=> b!160975 m!254539))

(declare-fun m!254541 () Bool)

(assert (=> b!160975 m!254541))

(assert (=> b!160976 m!254537))

(assert (=> b!160976 m!254537))

(declare-fun m!254543 () Bool)

(assert (=> b!160976 m!254543))

(declare-fun m!254545 () Bool)

(assert (=> b!160977 m!254545))

(check-sat (not start!33468) (not b!160977) (not b!160976))
(check-sat)
(get-model)

(declare-fun d!54889 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54889 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3557 (buf!4015 thiss!1602))) ((_ sign_extend 32) (currentByte!7466 thiss!1602)) ((_ sign_extend 32) (currentBit!7461 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3557 (buf!4015 thiss!1602))) ((_ sign_extend 32) (currentByte!7466 thiss!1602)) ((_ sign_extend 32) (currentBit!7461 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13663 () Bool)

(assert (= bs!13663 d!54889))

(declare-fun m!254577 () Bool)

(assert (=> bs!13663 m!254577))

(assert (=> start!33468 d!54889))

(declare-fun d!54891 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54891 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7461 thiss!1602) (currentByte!7466 thiss!1602) (size!3557 (buf!4015 thiss!1602))))))

(declare-fun bs!13664 () Bool)

(assert (= bs!13664 d!54891))

(declare-fun m!254579 () Bool)

(assert (=> bs!13664 m!254579))

(assert (=> start!33468 d!54891))

(declare-fun d!54893 () Bool)

(assert (=> d!54893 (= (array_inv!3304 (buf!4015 thiss!1602)) (bvsge (size!3557 (buf!4015 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160977 d!54893))

(declare-fun d!54895 () Bool)

(assert (=> d!54895 (= (byteRangesEq!0 (select (arr!4478 (buf!4015 thiss!1602)) (currentByte!7466 thiss!1602)) lt!253449 #b00000000000000000000000000000000 (currentBit!7461 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7461 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4478 (buf!4015 thiss!1602)) (currentByte!7466 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7461 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!253449) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7461 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13668 () Bool)

(assert (= bs!13668 d!54895))

(declare-fun m!254589 () Bool)

(assert (=> bs!13668 m!254589))

(declare-fun m!254591 () Bool)

(assert (=> bs!13668 m!254591))

(assert (=> b!160976 d!54895))

(check-sat (not d!54889) (not d!54891))
(check-sat)
(get-model)

(declare-fun d!54905 () Bool)

(assert (=> d!54905 (= (remainingBits!0 ((_ sign_extend 32) (size!3557 (buf!4015 thiss!1602))) ((_ sign_extend 32) (currentByte!7466 thiss!1602)) ((_ sign_extend 32) (currentBit!7461 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3557 (buf!4015 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7466 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7461 thiss!1602)))))))

(assert (=> d!54889 d!54905))

(declare-fun d!54907 () Bool)

(assert (=> d!54907 (= (invariant!0 (currentBit!7461 thiss!1602) (currentByte!7466 thiss!1602) (size!3557 (buf!4015 thiss!1602))) (and (bvsge (currentBit!7461 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7461 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7466 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7466 thiss!1602) (size!3557 (buf!4015 thiss!1602))) (and (= (currentBit!7461 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7466 thiss!1602) (size!3557 (buf!4015 thiss!1602)))))))))

(assert (=> d!54891 d!54907))

(check-sat)
