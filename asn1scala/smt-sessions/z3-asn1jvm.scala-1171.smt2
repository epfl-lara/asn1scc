; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33094 () Bool)

(assert start!33094)

(declare-fun b!160692 () Bool)

(declare-fun e!110289 () Bool)

(declare-fun e!110290 () Bool)

(assert (=> b!160692 (= e!110289 (not e!110290))))

(declare-fun res!133979 () Bool)

(assert (=> b!160692 (=> res!133979 e!110290)))

(declare-fun lt!253070 () (_ BitVec 32))

(assert (=> b!160692 (= res!133979 (bvsle lt!253070 #b00000000000000000000000000000000))))

(declare-fun e!110291 () Bool)

(assert (=> b!160692 e!110291))

(declare-fun res!133977 () Bool)

(assert (=> b!160692 (=> res!133977 e!110291)))

(declare-datatypes ((array!7828 0))(
  ( (array!7829 (arr!4448 (Array (_ BitVec 32) (_ BitVec 8))) (size!3527 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6222 0))(
  ( (BitStream!6223 (buf!3985 array!7828) (currentByte!7360 (_ BitVec 32)) (currentBit!7355 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6222)

(assert (=> b!160692 (= res!133977 (bvsge (currentByte!7360 thiss!1602) (size!3527 (buf!3985 thiss!1602))))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!253069 () (_ BitVec 8))

(declare-fun lt!253071 () (_ BitVec 8))

(assert (=> b!160692 (= lt!253069 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253071) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253070))))))

(declare-fun lt!253068 () (_ BitVec 32))

(assert (=> b!160692 (= lt!253071 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4448 (buf!3985 thiss!1602)) (currentByte!7360 thiss!1602))) lt!253068)))))

(assert (=> b!160692 (= lt!253068 ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253070)))))))))))

(assert (=> b!160692 (= lt!253070 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7355 thiss!1602))))))

(declare-fun res!133978 () Bool)

(assert (=> start!33094 (=> (not res!133978) (not e!110289))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33094 (= res!133978 (validate_offset_byte!0 ((_ sign_extend 32) (size!3527 (buf!3985 thiss!1602))) ((_ sign_extend 32) (currentByte!7360 thiss!1602)) ((_ sign_extend 32) (currentBit!7355 thiss!1602))))))

(assert (=> start!33094 e!110289))

(declare-fun e!110292 () Bool)

(declare-fun inv!12 (BitStream!6222) Bool)

(assert (=> start!33094 (and (inv!12 thiss!1602) e!110292)))

(assert (=> start!33094 true))

(declare-fun b!160694 () Bool)

(assert (=> b!160694 (= e!110290 (inv!12 (BitStream!6223 (array!7829 (store (store (store (arr!4448 (buf!3985 thiss!1602)) (currentByte!7360 thiss!1602) lt!253071) (currentByte!7360 thiss!1602) lt!253069) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4448 (buf!3985 thiss!1602)) (currentByte!7360 thiss!1602) lt!253071) (currentByte!7360 thiss!1602) lt!253069) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253068)))))) (size!3527 (buf!3985 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)) (currentBit!7355 thiss!1602))))))

(declare-fun b!160695 () Bool)

(declare-fun array_inv!3274 (array!7828) Bool)

(assert (=> b!160695 (= e!110292 (array_inv!3274 (buf!3985 thiss!1602)))))

(declare-fun b!160693 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160693 (= e!110291 (byteRangesEq!0 (select (arr!4448 (buf!3985 thiss!1602)) (currentByte!7360 thiss!1602)) lt!253069 #b00000000000000000000000000000000 (currentBit!7355 thiss!1602)))))

(assert (= (and start!33094 res!133978) b!160692))

(assert (= (and b!160692 (not res!133977)) b!160693))

(assert (= (and b!160692 (not res!133979)) b!160694))

(assert (= start!33094 b!160695))

(declare-fun m!253781 () Bool)

(assert (=> start!33094 m!253781))

(declare-fun m!253783 () Bool)

(assert (=> start!33094 m!253783))

(declare-fun m!253785 () Bool)

(assert (=> b!160693 m!253785))

(assert (=> b!160693 m!253785))

(declare-fun m!253787 () Bool)

(assert (=> b!160693 m!253787))

(declare-fun m!253789 () Bool)

(assert (=> b!160694 m!253789))

(declare-fun m!253791 () Bool)

(assert (=> b!160694 m!253791))

(declare-fun m!253793 () Bool)

(assert (=> b!160694 m!253793))

(declare-fun m!253795 () Bool)

(assert (=> b!160694 m!253795))

(declare-fun m!253797 () Bool)

(assert (=> b!160694 m!253797))

(assert (=> b!160692 m!253785))

(declare-fun m!253799 () Bool)

(assert (=> b!160692 m!253799))

(declare-fun m!253801 () Bool)

(assert (=> b!160695 m!253801))

(check-sat (not b!160695) (not start!33094) (not b!160693) (not b!160694))
(check-sat)
(get-model)

(declare-fun d!54523 () Bool)

(assert (=> d!54523 (= (array_inv!3274 (buf!3985 thiss!1602)) (bvsge (size!3527 (buf!3985 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160695 d!54523))

(declare-fun d!54525 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54525 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3527 (buf!3985 thiss!1602))) ((_ sign_extend 32) (currentByte!7360 thiss!1602)) ((_ sign_extend 32) (currentBit!7355 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3527 (buf!3985 thiss!1602))) ((_ sign_extend 32) (currentByte!7360 thiss!1602)) ((_ sign_extend 32) (currentBit!7355 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13543 () Bool)

(assert (= bs!13543 d!54525))

(declare-fun m!253825 () Bool)

(assert (=> bs!13543 m!253825))

(assert (=> start!33094 d!54525))

(declare-fun d!54527 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54527 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7355 thiss!1602) (currentByte!7360 thiss!1602) (size!3527 (buf!3985 thiss!1602))))))

(declare-fun bs!13544 () Bool)

(assert (= bs!13544 d!54527))

(declare-fun m!253827 () Bool)

(assert (=> bs!13544 m!253827))

(assert (=> start!33094 d!54527))

(declare-fun d!54529 () Bool)

(assert (=> d!54529 (= (byteRangesEq!0 (select (arr!4448 (buf!3985 thiss!1602)) (currentByte!7360 thiss!1602)) lt!253069 #b00000000000000000000000000000000 (currentBit!7355 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7355 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4448 (buf!3985 thiss!1602)) (currentByte!7360 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7355 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!253069) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7355 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13545 () Bool)

(assert (= bs!13545 d!54529))

(declare-fun m!253829 () Bool)

(assert (=> bs!13545 m!253829))

(declare-fun m!253831 () Bool)

(assert (=> bs!13545 m!253831))

(assert (=> b!160693 d!54529))

(declare-fun d!54533 () Bool)

(assert (=> d!54533 (= (inv!12 (BitStream!6223 (array!7829 (store (store (store (arr!4448 (buf!3985 thiss!1602)) (currentByte!7360 thiss!1602) lt!253071) (currentByte!7360 thiss!1602) lt!253069) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4448 (buf!3985 thiss!1602)) (currentByte!7360 thiss!1602) lt!253071) (currentByte!7360 thiss!1602) lt!253069) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253068)))))) (size!3527 (buf!3985 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)) (currentBit!7355 thiss!1602))) (invariant!0 (currentBit!7355 (BitStream!6223 (array!7829 (store (store (store (arr!4448 (buf!3985 thiss!1602)) (currentByte!7360 thiss!1602) lt!253071) (currentByte!7360 thiss!1602) lt!253069) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4448 (buf!3985 thiss!1602)) (currentByte!7360 thiss!1602) lt!253071) (currentByte!7360 thiss!1602) lt!253069) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253068)))))) (size!3527 (buf!3985 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)) (currentBit!7355 thiss!1602))) (currentByte!7360 (BitStream!6223 (array!7829 (store (store (store (arr!4448 (buf!3985 thiss!1602)) (currentByte!7360 thiss!1602) lt!253071) (currentByte!7360 thiss!1602) lt!253069) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4448 (buf!3985 thiss!1602)) (currentByte!7360 thiss!1602) lt!253071) (currentByte!7360 thiss!1602) lt!253069) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253068)))))) (size!3527 (buf!3985 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)) (currentBit!7355 thiss!1602))) (size!3527 (buf!3985 (BitStream!6223 (array!7829 (store (store (store (arr!4448 (buf!3985 thiss!1602)) (currentByte!7360 thiss!1602) lt!253071) (currentByte!7360 thiss!1602) lt!253069) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4448 (buf!3985 thiss!1602)) (currentByte!7360 thiss!1602) lt!253071) (currentByte!7360 thiss!1602) lt!253069) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253068)))))) (size!3527 (buf!3985 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)) (currentBit!7355 thiss!1602))))))))

(declare-fun bs!13546 () Bool)

(assert (= bs!13546 d!54533))

(declare-fun m!253833 () Bool)

(assert (=> bs!13546 m!253833))

(assert (=> b!160694 d!54533))

(check-sat (not d!54533) (not d!54527) (not d!54525))
(check-sat)
(get-model)

(declare-fun d!54553 () Bool)

(assert (=> d!54553 (= (invariant!0 (currentBit!7355 (BitStream!6223 (array!7829 (store (store (store (arr!4448 (buf!3985 thiss!1602)) (currentByte!7360 thiss!1602) lt!253071) (currentByte!7360 thiss!1602) lt!253069) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4448 (buf!3985 thiss!1602)) (currentByte!7360 thiss!1602) lt!253071) (currentByte!7360 thiss!1602) lt!253069) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253068)))))) (size!3527 (buf!3985 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)) (currentBit!7355 thiss!1602))) (currentByte!7360 (BitStream!6223 (array!7829 (store (store (store (arr!4448 (buf!3985 thiss!1602)) (currentByte!7360 thiss!1602) lt!253071) (currentByte!7360 thiss!1602) lt!253069) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4448 (buf!3985 thiss!1602)) (currentByte!7360 thiss!1602) lt!253071) (currentByte!7360 thiss!1602) lt!253069) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253068)))))) (size!3527 (buf!3985 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)) (currentBit!7355 thiss!1602))) (size!3527 (buf!3985 (BitStream!6223 (array!7829 (store (store (store (arr!4448 (buf!3985 thiss!1602)) (currentByte!7360 thiss!1602) lt!253071) (currentByte!7360 thiss!1602) lt!253069) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4448 (buf!3985 thiss!1602)) (currentByte!7360 thiss!1602) lt!253071) (currentByte!7360 thiss!1602) lt!253069) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253068)))))) (size!3527 (buf!3985 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)) (currentBit!7355 thiss!1602))))) (and (bvsge (currentBit!7355 (BitStream!6223 (array!7829 (store (store (store (arr!4448 (buf!3985 thiss!1602)) (currentByte!7360 thiss!1602) lt!253071) (currentByte!7360 thiss!1602) lt!253069) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4448 (buf!3985 thiss!1602)) (currentByte!7360 thiss!1602) lt!253071) (currentByte!7360 thiss!1602) lt!253069) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253068)))))) (size!3527 (buf!3985 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)) (currentBit!7355 thiss!1602))) #b00000000000000000000000000000000) (bvslt (currentBit!7355 (BitStream!6223 (array!7829 (store (store (store (arr!4448 (buf!3985 thiss!1602)) (currentByte!7360 thiss!1602) lt!253071) (currentByte!7360 thiss!1602) lt!253069) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4448 (buf!3985 thiss!1602)) (currentByte!7360 thiss!1602) lt!253071) (currentByte!7360 thiss!1602) lt!253069) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253068)))))) (size!3527 (buf!3985 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)) (currentBit!7355 thiss!1602))) #b00000000000000000000000000001000) (bvsge (currentByte!7360 (BitStream!6223 (array!7829 (store (store (store (arr!4448 (buf!3985 thiss!1602)) (currentByte!7360 thiss!1602) lt!253071) (currentByte!7360 thiss!1602) lt!253069) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4448 (buf!3985 thiss!1602)) (currentByte!7360 thiss!1602) lt!253071) (currentByte!7360 thiss!1602) lt!253069) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253068)))))) (size!3527 (buf!3985 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)) (currentBit!7355 thiss!1602))) #b00000000000000000000000000000000) (or (bvslt (currentByte!7360 (BitStream!6223 (array!7829 (store (store (store (arr!4448 (buf!3985 thiss!1602)) (currentByte!7360 thiss!1602) lt!253071) (currentByte!7360 thiss!1602) lt!253069) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4448 (buf!3985 thiss!1602)) (currentByte!7360 thiss!1602) lt!253071) (currentByte!7360 thiss!1602) lt!253069) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253068)))))) (size!3527 (buf!3985 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)) (currentBit!7355 thiss!1602))) (size!3527 (buf!3985 (BitStream!6223 (array!7829 (store (store (store (arr!4448 (buf!3985 thiss!1602)) (currentByte!7360 thiss!1602) lt!253071) (currentByte!7360 thiss!1602) lt!253069) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4448 (buf!3985 thiss!1602)) (currentByte!7360 thiss!1602) lt!253071) (currentByte!7360 thiss!1602) lt!253069) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253068)))))) (size!3527 (buf!3985 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)) (currentBit!7355 thiss!1602))))) (and (= (currentBit!7355 (BitStream!6223 (array!7829 (store (store (store (arr!4448 (buf!3985 thiss!1602)) (currentByte!7360 thiss!1602) lt!253071) (currentByte!7360 thiss!1602) lt!253069) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4448 (buf!3985 thiss!1602)) (currentByte!7360 thiss!1602) lt!253071) (currentByte!7360 thiss!1602) lt!253069) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253068)))))) (size!3527 (buf!3985 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)) (currentBit!7355 thiss!1602))) #b00000000000000000000000000000000) (= (currentByte!7360 (BitStream!6223 (array!7829 (store (store (store (arr!4448 (buf!3985 thiss!1602)) (currentByte!7360 thiss!1602) lt!253071) (currentByte!7360 thiss!1602) lt!253069) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4448 (buf!3985 thiss!1602)) (currentByte!7360 thiss!1602) lt!253071) (currentByte!7360 thiss!1602) lt!253069) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253068)))))) (size!3527 (buf!3985 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)) (currentBit!7355 thiss!1602))) (size!3527 (buf!3985 (BitStream!6223 (array!7829 (store (store (store (arr!4448 (buf!3985 thiss!1602)) (currentByte!7360 thiss!1602) lt!253071) (currentByte!7360 thiss!1602) lt!253069) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4448 (buf!3985 thiss!1602)) (currentByte!7360 thiss!1602) lt!253071) (currentByte!7360 thiss!1602) lt!253069) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253068)))))) (size!3527 (buf!3985 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7360 thiss!1602)) (currentBit!7355 thiss!1602)))))))))))

(assert (=> d!54533 d!54553))

(declare-fun d!54555 () Bool)

(assert (=> d!54555 (= (invariant!0 (currentBit!7355 thiss!1602) (currentByte!7360 thiss!1602) (size!3527 (buf!3985 thiss!1602))) (and (bvsge (currentBit!7355 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7355 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7360 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7360 thiss!1602) (size!3527 (buf!3985 thiss!1602))) (and (= (currentBit!7355 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7360 thiss!1602) (size!3527 (buf!3985 thiss!1602)))))))))

(assert (=> d!54527 d!54555))

(declare-fun d!54557 () Bool)

(assert (=> d!54557 (= (remainingBits!0 ((_ sign_extend 32) (size!3527 (buf!3985 thiss!1602))) ((_ sign_extend 32) (currentByte!7360 thiss!1602)) ((_ sign_extend 32) (currentBit!7355 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3527 (buf!3985 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7360 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7355 thiss!1602)))))))

(assert (=> d!54525 d!54557))

(check-sat)
