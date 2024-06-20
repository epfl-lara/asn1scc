; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33264 () Bool)

(assert start!33264)

(declare-fun res!134068 () Bool)

(declare-fun e!110458 () Bool)

(assert (=> start!33264 (=> (not res!134068) (not e!110458))))

(declare-datatypes ((array!7866 0))(
  ( (array!7867 (arr!4461 (Array (_ BitVec 32) (_ BitVec 8))) (size!3540 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6248 0))(
  ( (BitStream!6249 (buf!3998 array!7866) (currentByte!7409 (_ BitVec 32)) (currentBit!7404 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6248)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33264 (= res!134068 (validate_offset_byte!0 ((_ sign_extend 32) (size!3540 (buf!3998 thiss!1602))) ((_ sign_extend 32) (currentByte!7409 thiss!1602)) ((_ sign_extend 32) (currentBit!7404 thiss!1602))))))

(assert (=> start!33264 e!110458))

(declare-fun e!110459 () Bool)

(declare-fun inv!12 (BitStream!6248) Bool)

(assert (=> start!33264 (and (inv!12 thiss!1602) e!110459)))

(assert (=> start!33264 true))

(declare-fun b!160822 () Bool)

(declare-fun lt!253164 () (_ BitVec 32))

(assert (=> b!160822 (= e!110458 (not (or (bvsle lt!253164 #b00000000000000000000000000000000) (and (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!7409 thiss!1602)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!7409 thiss!1602)) (size!3540 (buf!3998 thiss!1602)))))))))

(declare-fun e!110457 () Bool)

(assert (=> b!160822 e!110457))

(declare-fun res!134069 () Bool)

(assert (=> b!160822 (=> res!134069 e!110457)))

(assert (=> b!160822 (= res!134069 (bvsge (currentByte!7409 thiss!1602) (size!3540 (buf!3998 thiss!1602))))))

(assert (=> b!160822 (= lt!253164 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7404 thiss!1602))))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun b!160823 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160823 (= e!110457 (byteRangesEq!0 (select (arr!4461 (buf!3998 thiss!1602)) (currentByte!7409 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4461 (buf!3998 thiss!1602)) (currentByte!7409 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253164))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253164))) #b00000000000000000000000000000000 (currentBit!7404 thiss!1602)))))

(declare-fun b!160824 () Bool)

(declare-fun array_inv!3287 (array!7866) Bool)

(assert (=> b!160824 (= e!110459 (array_inv!3287 (buf!3998 thiss!1602)))))

(assert (= (and start!33264 res!134068) b!160822))

(assert (= (and b!160822 (not res!134069)) b!160823))

(assert (= start!33264 b!160824))

(declare-fun m!254101 () Bool)

(assert (=> start!33264 m!254101))

(declare-fun m!254103 () Bool)

(assert (=> start!33264 m!254103))

(declare-fun m!254105 () Bool)

(assert (=> b!160823 m!254105))

(declare-fun m!254107 () Bool)

(assert (=> b!160823 m!254107))

(assert (=> b!160823 m!254105))

(declare-fun m!254109 () Bool)

(assert (=> b!160823 m!254109))

(declare-fun m!254111 () Bool)

(assert (=> b!160824 m!254111))

(push 1)

(assert (not b!160824))

(assert (not b!160823))

(assert (not start!33264))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54715 () Bool)

(assert (=> d!54715 (= (array_inv!3287 (buf!3998 thiss!1602)) (bvsge (size!3540 (buf!3998 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160824 d!54715))

(declare-fun d!54717 () Bool)

(assert (=> d!54717 (= (byteRangesEq!0 (select (arr!4461 (buf!3998 thiss!1602)) (currentByte!7409 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4461 (buf!3998 thiss!1602)) (currentByte!7409 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253164))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253164))) #b00000000000000000000000000000000 (currentBit!7404 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7404 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4461 (buf!3998 thiss!1602)) (currentByte!7409 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7404 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4461 (buf!3998 thiss!1602)) (currentByte!7409 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253164))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253164)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7404 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13603 () Bool)

(assert (= bs!13603 d!54717))

(declare-fun m!254129 () Bool)

(assert (=> bs!13603 m!254129))

(declare-fun m!254131 () Bool)

(assert (=> bs!13603 m!254131))

(assert (=> b!160823 d!54717))

(declare-fun d!54719 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54719 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3540 (buf!3998 thiss!1602))) ((_ sign_extend 32) (currentByte!7409 thiss!1602)) ((_ sign_extend 32) (currentBit!7404 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3540 (buf!3998 thiss!1602))) ((_ sign_extend 32) (currentByte!7409 thiss!1602)) ((_ sign_extend 32) (currentBit!7404 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13604 () Bool)

(assert (= bs!13604 d!54719))

(declare-fun m!254133 () Bool)

(assert (=> bs!13604 m!254133))

(assert (=> start!33264 d!54719))

(declare-fun d!54721 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54721 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7404 thiss!1602) (currentByte!7409 thiss!1602) (size!3540 (buf!3998 thiss!1602))))))

(declare-fun bs!13605 () Bool)

(assert (= bs!13605 d!54721))

(declare-fun m!254135 () Bool)

(assert (=> bs!13605 m!254135))

(assert (=> start!33264 d!54721))

(push 1)

(assert (not d!54719))

(assert (not d!54721))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54731 () Bool)

(assert (=> d!54731 (= (remainingBits!0 ((_ sign_extend 32) (size!3540 (buf!3998 thiss!1602))) ((_ sign_extend 32) (currentByte!7409 thiss!1602)) ((_ sign_extend 32) (currentBit!7404 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3540 (buf!3998 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7409 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7404 thiss!1602)))))))

(assert (=> d!54719 d!54731))

(declare-fun d!54733 () Bool)

(assert (=> d!54733 (= (invariant!0 (currentBit!7404 thiss!1602) (currentByte!7409 thiss!1602) (size!3540 (buf!3998 thiss!1602))) (and (bvsge (currentBit!7404 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7404 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7409 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7409 thiss!1602) (size!3540 (buf!3998 thiss!1602))) (and (= (currentBit!7404 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7409 thiss!1602) (size!3540 (buf!3998 thiss!1602)))))))))

(assert (=> d!54721 d!54733))

(push 1)

(check-sat)

(pop 1)

