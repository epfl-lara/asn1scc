; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33260 () Bool)

(assert start!33260)

(declare-fun res!134057 () Bool)

(declare-fun e!110434 () Bool)

(assert (=> start!33260 (=> (not res!134057) (not e!110434))))

(declare-datatypes ((array!7862 0))(
  ( (array!7863 (arr!4459 (Array (_ BitVec 32) (_ BitVec 8))) (size!3538 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6244 0))(
  ( (BitStream!6245 (buf!3996 array!7862) (currentByte!7407 (_ BitVec 32)) (currentBit!7402 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6244)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33260 (= res!134057 (validate_offset_byte!0 ((_ sign_extend 32) (size!3538 (buf!3996 thiss!1602))) ((_ sign_extend 32) (currentByte!7407 thiss!1602)) ((_ sign_extend 32) (currentBit!7402 thiss!1602))))))

(assert (=> start!33260 e!110434))

(declare-fun e!110435 () Bool)

(declare-fun inv!12 (BitStream!6244) Bool)

(assert (=> start!33260 (and (inv!12 thiss!1602) e!110435)))

(assert (=> start!33260 true))

(declare-fun b!160804 () Bool)

(declare-fun lt!253158 () (_ BitVec 32))

(assert (=> b!160804 (= e!110434 (not (or (bvsle lt!253158 #b00000000000000000000000000000000) (and (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!7407 thiss!1602)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!7407 thiss!1602)) (size!3538 (buf!3996 thiss!1602)))))))))

(declare-fun e!110433 () Bool)

(assert (=> b!160804 e!110433))

(declare-fun res!134056 () Bool)

(assert (=> b!160804 (=> res!134056 e!110433)))

(assert (=> b!160804 (= res!134056 (bvsge (currentByte!7407 thiss!1602) (size!3538 (buf!3996 thiss!1602))))))

(assert (=> b!160804 (= lt!253158 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7402 thiss!1602))))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun b!160805 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160805 (= e!110433 (byteRangesEq!0 (select (arr!4459 (buf!3996 thiss!1602)) (currentByte!7407 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4459 (buf!3996 thiss!1602)) (currentByte!7407 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253158))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253158))) #b00000000000000000000000000000000 (currentBit!7402 thiss!1602)))))

(declare-fun b!160806 () Bool)

(declare-fun array_inv!3285 (array!7862) Bool)

(assert (=> b!160806 (= e!110435 (array_inv!3285 (buf!3996 thiss!1602)))))

(assert (= (and start!33260 res!134057) b!160804))

(assert (= (and b!160804 (not res!134056)) b!160805))

(assert (= start!33260 b!160806))

(declare-fun m!254077 () Bool)

(assert (=> start!33260 m!254077))

(declare-fun m!254079 () Bool)

(assert (=> start!33260 m!254079))

(declare-fun m!254081 () Bool)

(assert (=> b!160805 m!254081))

(declare-fun m!254083 () Bool)

(assert (=> b!160805 m!254083))

(assert (=> b!160805 m!254081))

(declare-fun m!254085 () Bool)

(assert (=> b!160805 m!254085))

(declare-fun m!254087 () Bool)

(assert (=> b!160806 m!254087))

(push 1)

(assert (not start!33260))

(assert (not b!160806))

(assert (not b!160805))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54703 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54703 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3538 (buf!3996 thiss!1602))) ((_ sign_extend 32) (currentByte!7407 thiss!1602)) ((_ sign_extend 32) (currentBit!7402 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3538 (buf!3996 thiss!1602))) ((_ sign_extend 32) (currentByte!7407 thiss!1602)) ((_ sign_extend 32) (currentBit!7402 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13597 () Bool)

(assert (= bs!13597 d!54703))

(declare-fun m!254113 () Bool)

(assert (=> bs!13597 m!254113))

(assert (=> start!33260 d!54703))

(declare-fun d!54705 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54705 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7402 thiss!1602) (currentByte!7407 thiss!1602) (size!3538 (buf!3996 thiss!1602))))))

(declare-fun bs!13598 () Bool)

(assert (= bs!13598 d!54705))

(declare-fun m!254115 () Bool)

(assert (=> bs!13598 m!254115))

(assert (=> start!33260 d!54705))

(declare-fun d!54707 () Bool)

(assert (=> d!54707 (= (array_inv!3285 (buf!3996 thiss!1602)) (bvsge (size!3538 (buf!3996 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160806 d!54707))

(declare-fun d!54709 () Bool)

(assert (=> d!54709 (= (byteRangesEq!0 (select (arr!4459 (buf!3996 thiss!1602)) (currentByte!7407 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4459 (buf!3996 thiss!1602)) (currentByte!7407 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253158))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253158))) #b00000000000000000000000000000000 (currentBit!7402 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7402 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4459 (buf!3996 thiss!1602)) (currentByte!7407 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7402 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4459 (buf!3996 thiss!1602)) (currentByte!7407 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253158))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253158)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7402 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13602 () Bool)

(assert (= bs!13602 d!54709))

(declare-fun m!254125 () Bool)

(assert (=> bs!13602 m!254125))

(declare-fun m!254127 () Bool)

(assert (=> bs!13602 m!254127))

(assert (=> b!160805 d!54709))

(push 1)

(assert (not d!54703))

(assert (not d!54705))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54727 () Bool)

(assert (=> d!54727 (= (remainingBits!0 ((_ sign_extend 32) (size!3538 (buf!3996 thiss!1602))) ((_ sign_extend 32) (currentByte!7407 thiss!1602)) ((_ sign_extend 32) (currentBit!7402 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3538 (buf!3996 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7407 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7402 thiss!1602)))))))

(assert (=> d!54703 d!54727))

(declare-fun d!54729 () Bool)

(assert (=> d!54729 (= (invariant!0 (currentBit!7402 thiss!1602) (currentByte!7407 thiss!1602) (size!3538 (buf!3996 thiss!1602))) (and (bvsge (currentBit!7402 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7402 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7407 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7407 thiss!1602) (size!3538 (buf!3996 thiss!1602))) (and (= (currentBit!7402 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7407 thiss!1602) (size!3538 (buf!3996 thiss!1602)))))))))

(assert (=> d!54705 d!54729))

(push 1)

(check-sat)

