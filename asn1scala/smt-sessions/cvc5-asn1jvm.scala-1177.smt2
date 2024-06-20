; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33308 () Bool)

(assert start!33308)

(declare-fun res!134093 () Bool)

(declare-fun e!110507 () Bool)

(assert (=> start!33308 (=> (not res!134093) (not e!110507))))

(declare-datatypes ((array!7877 0))(
  ( (array!7878 (arr!4465 (Array (_ BitVec 32) (_ BitVec 8))) (size!3544 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6256 0))(
  ( (BitStream!6257 (buf!4002 array!7877) (currentByte!7422 (_ BitVec 32)) (currentBit!7417 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6256)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33308 (= res!134093 (validate_offset_byte!0 ((_ sign_extend 32) (size!3544 (buf!4002 thiss!1602))) ((_ sign_extend 32) (currentByte!7422 thiss!1602)) ((_ sign_extend 32) (currentBit!7417 thiss!1602))))))

(assert (=> start!33308 e!110507))

(declare-fun e!110508 () Bool)

(declare-fun inv!12 (BitStream!6256) Bool)

(assert (=> start!33308 (and (inv!12 thiss!1602) e!110508)))

(assert (=> start!33308 true))

(declare-fun b!160858 () Bool)

(declare-fun lt!253185 () (_ BitVec 32))

(assert (=> b!160858 (= e!110507 (not (or (bvsle lt!253185 #b00000000000000000000000000000000) (and (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!7422 thiss!1602)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!7422 thiss!1602)) (size!3544 (buf!4002 thiss!1602)))))))))

(declare-fun e!110505 () Bool)

(assert (=> b!160858 e!110505))

(declare-fun res!134092 () Bool)

(assert (=> b!160858 (=> res!134092 e!110505)))

(assert (=> b!160858 (= res!134092 (bvsge (currentByte!7422 thiss!1602) (size!3544 (buf!4002 thiss!1602))))))

(assert (=> b!160858 (= lt!253185 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7417 thiss!1602))))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun b!160859 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160859 (= e!110505 (byteRangesEq!0 (select (arr!4465 (buf!4002 thiss!1602)) (currentByte!7422 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4465 (buf!4002 thiss!1602)) (currentByte!7422 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253185))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253185))) #b00000000000000000000000000000000 (currentBit!7417 thiss!1602)))))

(declare-fun b!160860 () Bool)

(declare-fun array_inv!3291 (array!7877) Bool)

(assert (=> b!160860 (= e!110508 (array_inv!3291 (buf!4002 thiss!1602)))))

(assert (= (and start!33308 res!134093) b!160858))

(assert (= (and b!160858 (not res!134092)) b!160859))

(assert (= start!33308 b!160860))

(declare-fun m!254173 () Bool)

(assert (=> start!33308 m!254173))

(declare-fun m!254175 () Bool)

(assert (=> start!33308 m!254175))

(declare-fun m!254177 () Bool)

(assert (=> b!160859 m!254177))

(declare-fun m!254179 () Bool)

(assert (=> b!160859 m!254179))

(assert (=> b!160859 m!254177))

(declare-fun m!254181 () Bool)

(assert (=> b!160859 m!254181))

(declare-fun m!254183 () Bool)

(assert (=> b!160860 m!254183))

(push 1)

(assert (not b!160859))

(assert (not b!160860))

(assert (not start!33308))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54743 () Bool)

(assert (=> d!54743 (= (byteRangesEq!0 (select (arr!4465 (buf!4002 thiss!1602)) (currentByte!7422 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4465 (buf!4002 thiss!1602)) (currentByte!7422 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253185))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253185))) #b00000000000000000000000000000000 (currentBit!7417 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7417 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4465 (buf!4002 thiss!1602)) (currentByte!7422 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7417 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4465 (buf!4002 thiss!1602)) (currentByte!7422 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253185))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253185)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7417 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13612 () Bool)

(assert (= bs!13612 d!54743))

(declare-fun m!254209 () Bool)

(assert (=> bs!13612 m!254209))

(declare-fun m!254211 () Bool)

(assert (=> bs!13612 m!254211))

(assert (=> b!160859 d!54743))

(declare-fun d!54745 () Bool)

(assert (=> d!54745 (= (array_inv!3291 (buf!4002 thiss!1602)) (bvsge (size!3544 (buf!4002 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160860 d!54745))

(declare-fun d!54749 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54749 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3544 (buf!4002 thiss!1602))) ((_ sign_extend 32) (currentByte!7422 thiss!1602)) ((_ sign_extend 32) (currentBit!7417 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3544 (buf!4002 thiss!1602))) ((_ sign_extend 32) (currentByte!7422 thiss!1602)) ((_ sign_extend 32) (currentBit!7417 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13614 () Bool)

(assert (= bs!13614 d!54749))

(declare-fun m!254217 () Bool)

(assert (=> bs!13614 m!254217))

(assert (=> start!33308 d!54749))

(declare-fun d!54751 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54751 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7417 thiss!1602) (currentByte!7422 thiss!1602) (size!3544 (buf!4002 thiss!1602))))))

(declare-fun bs!13616 () Bool)

(assert (= bs!13616 d!54751))

(declare-fun m!254221 () Bool)

(assert (=> bs!13616 m!254221))

(assert (=> start!33308 d!54751))

(push 1)

(assert (not d!54751))

(assert (not d!54749))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54767 () Bool)

(assert (=> d!54767 (= (invariant!0 (currentBit!7417 thiss!1602) (currentByte!7422 thiss!1602) (size!3544 (buf!4002 thiss!1602))) (and (bvsge (currentBit!7417 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7417 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7422 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7422 thiss!1602) (size!3544 (buf!4002 thiss!1602))) (and (= (currentBit!7417 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7422 thiss!1602) (size!3544 (buf!4002 thiss!1602)))))))))

(assert (=> d!54751 d!54767))

(declare-fun d!54769 () Bool)

(assert (=> d!54769 (= (remainingBits!0 ((_ sign_extend 32) (size!3544 (buf!4002 thiss!1602))) ((_ sign_extend 32) (currentByte!7422 thiss!1602)) ((_ sign_extend 32) (currentBit!7417 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3544 (buf!4002 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7422 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7417 thiss!1602)))))))

(assert (=> d!54749 d!54769))

(push 1)

(check-sat)

