; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33262 () Bool)

(assert start!33262)

(declare-fun res!134062 () Bool)

(declare-fun e!110448 () Bool)

(assert (=> start!33262 (=> (not res!134062) (not e!110448))))

(declare-datatypes ((array!7864 0))(
  ( (array!7865 (arr!4460 (Array (_ BitVec 32) (_ BitVec 8))) (size!3539 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6246 0))(
  ( (BitStream!6247 (buf!3997 array!7864) (currentByte!7408 (_ BitVec 32)) (currentBit!7403 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6246)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33262 (= res!134062 (validate_offset_byte!0 ((_ sign_extend 32) (size!3539 (buf!3997 thiss!1602))) ((_ sign_extend 32) (currentByte!7408 thiss!1602)) ((_ sign_extend 32) (currentBit!7403 thiss!1602))))))

(assert (=> start!33262 e!110448))

(declare-fun e!110447 () Bool)

(declare-fun inv!12 (BitStream!6246) Bool)

(assert (=> start!33262 (and (inv!12 thiss!1602) e!110447)))

(assert (=> start!33262 true))

(declare-fun b!160813 () Bool)

(declare-fun lt!253161 () (_ BitVec 32))

(assert (=> b!160813 (= e!110448 (not (or (bvsle lt!253161 #b00000000000000000000000000000000) (and (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!7408 thiss!1602)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!7408 thiss!1602)) (size!3539 (buf!3997 thiss!1602)))))))))

(declare-fun e!110446 () Bool)

(assert (=> b!160813 e!110446))

(declare-fun res!134063 () Bool)

(assert (=> b!160813 (=> res!134063 e!110446)))

(assert (=> b!160813 (= res!134063 (bvsge (currentByte!7408 thiss!1602) (size!3539 (buf!3997 thiss!1602))))))

(assert (=> b!160813 (= lt!253161 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7403 thiss!1602))))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun b!160814 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160814 (= e!110446 (byteRangesEq!0 (select (arr!4460 (buf!3997 thiss!1602)) (currentByte!7408 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4460 (buf!3997 thiss!1602)) (currentByte!7408 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253161))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253161))) #b00000000000000000000000000000000 (currentBit!7403 thiss!1602)))))

(declare-fun b!160815 () Bool)

(declare-fun array_inv!3286 (array!7864) Bool)

(assert (=> b!160815 (= e!110447 (array_inv!3286 (buf!3997 thiss!1602)))))

(assert (= (and start!33262 res!134062) b!160813))

(assert (= (and b!160813 (not res!134063)) b!160814))

(assert (= start!33262 b!160815))

(declare-fun m!254089 () Bool)

(assert (=> start!33262 m!254089))

(declare-fun m!254091 () Bool)

(assert (=> start!33262 m!254091))

(declare-fun m!254093 () Bool)

(assert (=> b!160814 m!254093))

(declare-fun m!254095 () Bool)

(assert (=> b!160814 m!254095))

(assert (=> b!160814 m!254093))

(declare-fun m!254097 () Bool)

(assert (=> b!160814 m!254097))

(declare-fun m!254099 () Bool)

(assert (=> b!160815 m!254099))

(check-sat (not b!160815) (not b!160814) (not start!33262))
(check-sat)
(get-model)

(declare-fun d!54699 () Bool)

(assert (=> d!54699 (= (array_inv!3286 (buf!3997 thiss!1602)) (bvsge (size!3539 (buf!3997 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160815 d!54699))

(declare-fun d!54701 () Bool)

(assert (=> d!54701 (= (byteRangesEq!0 (select (arr!4460 (buf!3997 thiss!1602)) (currentByte!7408 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4460 (buf!3997 thiss!1602)) (currentByte!7408 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253161))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253161))) #b00000000000000000000000000000000 (currentBit!7403 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7403 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4460 (buf!3997 thiss!1602)) (currentByte!7408 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7403 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4460 (buf!3997 thiss!1602)) (currentByte!7408 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253161))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253161)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7403 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13599 () Bool)

(assert (= bs!13599 d!54701))

(declare-fun m!254117 () Bool)

(assert (=> bs!13599 m!254117))

(declare-fun m!254119 () Bool)

(assert (=> bs!13599 m!254119))

(assert (=> b!160814 d!54701))

(declare-fun d!54711 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54711 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3539 (buf!3997 thiss!1602))) ((_ sign_extend 32) (currentByte!7408 thiss!1602)) ((_ sign_extend 32) (currentBit!7403 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3539 (buf!3997 thiss!1602))) ((_ sign_extend 32) (currentByte!7408 thiss!1602)) ((_ sign_extend 32) (currentBit!7403 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13600 () Bool)

(assert (= bs!13600 d!54711))

(declare-fun m!254121 () Bool)

(assert (=> bs!13600 m!254121))

(assert (=> start!33262 d!54711))

(declare-fun d!54713 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54713 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7403 thiss!1602) (currentByte!7408 thiss!1602) (size!3539 (buf!3997 thiss!1602))))))

(declare-fun bs!13601 () Bool)

(assert (= bs!13601 d!54713))

(declare-fun m!254123 () Bool)

(assert (=> bs!13601 m!254123))

(assert (=> start!33262 d!54713))

(check-sat (not d!54711) (not d!54713))
(check-sat)
(get-model)

(declare-fun d!54723 () Bool)

(assert (=> d!54723 (= (remainingBits!0 ((_ sign_extend 32) (size!3539 (buf!3997 thiss!1602))) ((_ sign_extend 32) (currentByte!7408 thiss!1602)) ((_ sign_extend 32) (currentBit!7403 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3539 (buf!3997 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7408 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7403 thiss!1602)))))))

(assert (=> d!54711 d!54723))

(declare-fun d!54725 () Bool)

(assert (=> d!54725 (= (invariant!0 (currentBit!7403 thiss!1602) (currentByte!7408 thiss!1602) (size!3539 (buf!3997 thiss!1602))) (and (bvsge (currentBit!7403 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7403 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7408 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7408 thiss!1602) (size!3539 (buf!3997 thiss!1602))) (and (= (currentBit!7403 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7408 thiss!1602) (size!3539 (buf!3997 thiss!1602)))))))))

(assert (=> d!54713 d!54725))

(check-sat)
