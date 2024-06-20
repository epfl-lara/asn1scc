; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33136 () Bool)

(assert start!33136)

(declare-fun res!134000 () Bool)

(declare-fun e!110331 () Bool)

(assert (=> start!33136 (=> (not res!134000) (not e!110331))))

(declare-datatypes ((array!7837 0))(
  ( (array!7838 (arr!4451 (Array (_ BitVec 32) (_ BitVec 8))) (size!3530 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6228 0))(
  ( (BitStream!6229 (buf!3988 array!7837) (currentByte!7372 (_ BitVec 32)) (currentBit!7367 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6228)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33136 (= res!134000 (validate_offset_byte!0 ((_ sign_extend 32) (size!3530 (buf!3988 thiss!1602))) ((_ sign_extend 32) (currentByte!7372 thiss!1602)) ((_ sign_extend 32) (currentBit!7367 thiss!1602))))))

(assert (=> start!33136 e!110331))

(declare-fun e!110330 () Bool)

(declare-fun inv!12 (BitStream!6228) Bool)

(assert (=> start!33136 (and (inv!12 thiss!1602) e!110330)))

(assert (=> start!33136 true))

(declare-fun b!160723 () Bool)

(declare-fun lt!253089 () (_ BitVec 32))

(assert (=> b!160723 (= e!110331 (not (or (bvsle lt!253089 #b00000000000000000000000000000000) (and (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!7372 thiss!1602)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!7372 thiss!1602)) (size!3530 (buf!3988 thiss!1602)))))))))

(declare-fun e!110328 () Bool)

(assert (=> b!160723 e!110328))

(declare-fun res!133999 () Bool)

(assert (=> b!160723 (=> res!133999 e!110328)))

(assert (=> b!160723 (= res!133999 (bvsge (currentByte!7372 thiss!1602) (size!3530 (buf!3988 thiss!1602))))))

(assert (=> b!160723 (= lt!253089 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7367 thiss!1602))))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun b!160724 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160724 (= e!110328 (byteRangesEq!0 (select (arr!4451 (buf!3988 thiss!1602)) (currentByte!7372 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4451 (buf!3988 thiss!1602)) (currentByte!7372 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253089))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253089))) #b00000000000000000000000000000000 (currentBit!7367 thiss!1602)))))

(declare-fun b!160725 () Bool)

(declare-fun array_inv!3277 (array!7837) Bool)

(assert (=> b!160725 (= e!110330 (array_inv!3277 (buf!3988 thiss!1602)))))

(assert (= (and start!33136 res!134000) b!160723))

(assert (= (and b!160723 (not res!133999)) b!160724))

(assert (= start!33136 b!160725))

(declare-fun m!253867 () Bool)

(assert (=> start!33136 m!253867))

(declare-fun m!253869 () Bool)

(assert (=> start!33136 m!253869))

(declare-fun m!253871 () Bool)

(assert (=> b!160724 m!253871))

(declare-fun m!253873 () Bool)

(assert (=> b!160724 m!253873))

(assert (=> b!160724 m!253871))

(declare-fun m!253875 () Bool)

(assert (=> b!160724 m!253875))

(declare-fun m!253877 () Bool)

(assert (=> b!160725 m!253877))

(check-sat (not b!160725) (not b!160724) (not start!33136))
(check-sat)
(get-model)

(declare-fun d!54573 () Bool)

(assert (=> d!54573 (= (array_inv!3277 (buf!3988 thiss!1602)) (bvsge (size!3530 (buf!3988 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160725 d!54573))

(declare-fun d!54575 () Bool)

(assert (=> d!54575 (= (byteRangesEq!0 (select (arr!4451 (buf!3988 thiss!1602)) (currentByte!7372 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4451 (buf!3988 thiss!1602)) (currentByte!7372 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253089))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253089))) #b00000000000000000000000000000000 (currentBit!7367 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7367 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4451 (buf!3988 thiss!1602)) (currentByte!7372 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7367 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4451 (buf!3988 thiss!1602)) (currentByte!7372 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253089))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253089)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7367 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13558 () Bool)

(assert (= bs!13558 d!54575))

(declare-fun m!253891 () Bool)

(assert (=> bs!13558 m!253891))

(declare-fun m!253893 () Bool)

(assert (=> bs!13558 m!253893))

(assert (=> b!160724 d!54575))

(declare-fun d!54577 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54577 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3530 (buf!3988 thiss!1602))) ((_ sign_extend 32) (currentByte!7372 thiss!1602)) ((_ sign_extend 32) (currentBit!7367 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3530 (buf!3988 thiss!1602))) ((_ sign_extend 32) (currentByte!7372 thiss!1602)) ((_ sign_extend 32) (currentBit!7367 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13559 () Bool)

(assert (= bs!13559 d!54577))

(declare-fun m!253895 () Bool)

(assert (=> bs!13559 m!253895))

(assert (=> start!33136 d!54577))

(declare-fun d!54579 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54579 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7367 thiss!1602) (currentByte!7372 thiss!1602) (size!3530 (buf!3988 thiss!1602))))))

(declare-fun bs!13560 () Bool)

(assert (= bs!13560 d!54579))

(declare-fun m!253897 () Bool)

(assert (=> bs!13560 m!253897))

(assert (=> start!33136 d!54579))

(check-sat (not d!54577) (not d!54579))
(check-sat)
(get-model)

(declare-fun d!54591 () Bool)

(assert (=> d!54591 (= (remainingBits!0 ((_ sign_extend 32) (size!3530 (buf!3988 thiss!1602))) ((_ sign_extend 32) (currentByte!7372 thiss!1602)) ((_ sign_extend 32) (currentBit!7367 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3530 (buf!3988 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7372 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7367 thiss!1602)))))))

(assert (=> d!54577 d!54591))

(declare-fun d!54593 () Bool)

(assert (=> d!54593 (= (invariant!0 (currentBit!7367 thiss!1602) (currentByte!7372 thiss!1602) (size!3530 (buf!3988 thiss!1602))) (and (bvsge (currentBit!7367 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7367 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7372 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7372 thiss!1602) (size!3530 (buf!3988 thiss!1602))) (and (= (currentBit!7367 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7372 thiss!1602) (size!3530 (buf!3988 thiss!1602)))))))))

(assert (=> d!54579 d!54593))

(check-sat)
