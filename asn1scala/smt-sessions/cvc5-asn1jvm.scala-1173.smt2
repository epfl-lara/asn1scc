; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33176 () Bool)

(assert start!33176)

(declare-fun res!134012 () Bool)

(declare-fun e!110353 () Bool)

(assert (=> start!33176 (=> (not res!134012) (not e!110353))))

(declare-datatypes ((array!7844 0))(
  ( (array!7845 (arr!4453 (Array (_ BitVec 32) (_ BitVec 8))) (size!3532 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6232 0))(
  ( (BitStream!6233 (buf!3990 array!7844) (currentByte!7383 (_ BitVec 32)) (currentBit!7378 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6232)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33176 (= res!134012 (validate_offset_byte!0 ((_ sign_extend 32) (size!3532 (buf!3990 thiss!1602))) ((_ sign_extend 32) (currentByte!7383 thiss!1602)) ((_ sign_extend 32) (currentBit!7378 thiss!1602))))))

(assert (=> start!33176 e!110353))

(declare-fun e!110355 () Bool)

(declare-fun inv!12 (BitStream!6232) Bool)

(assert (=> start!33176 (and (inv!12 thiss!1602) e!110355)))

(assert (=> start!33176 true))

(declare-fun b!160741 () Bool)

(declare-fun lt!253095 () (_ BitVec 32))

(assert (=> b!160741 (= e!110353 (not (or (bvsle lt!253095 #b00000000000000000000000000000000) (and (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!7383 thiss!1602)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!7383 thiss!1602)) (size!3532 (buf!3990 thiss!1602)))))))))

(declare-fun e!110352 () Bool)

(assert (=> b!160741 e!110352))

(declare-fun res!134011 () Bool)

(assert (=> b!160741 (=> res!134011 e!110352)))

(assert (=> b!160741 (= res!134011 (bvsge (currentByte!7383 thiss!1602) (size!3532 (buf!3990 thiss!1602))))))

(assert (=> b!160741 (= lt!253095 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7378 thiss!1602))))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun b!160742 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160742 (= e!110352 (byteRangesEq!0 (select (arr!4453 (buf!3990 thiss!1602)) (currentByte!7383 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4453 (buf!3990 thiss!1602)) (currentByte!7383 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253095))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253095))) #b00000000000000000000000000000000 (currentBit!7378 thiss!1602)))))

(declare-fun b!160743 () Bool)

(declare-fun array_inv!3279 (array!7844) Bool)

(assert (=> b!160743 (= e!110355 (array_inv!3279 (buf!3990 thiss!1602)))))

(assert (= (and start!33176 res!134012) b!160741))

(assert (= (and b!160741 (not res!134011)) b!160742))

(assert (= start!33176 b!160743))

(declare-fun m!253915 () Bool)

(assert (=> start!33176 m!253915))

(declare-fun m!253917 () Bool)

(assert (=> start!33176 m!253917))

(declare-fun m!253919 () Bool)

(assert (=> b!160742 m!253919))

(declare-fun m!253921 () Bool)

(assert (=> b!160742 m!253921))

(assert (=> b!160742 m!253919))

(declare-fun m!253923 () Bool)

(assert (=> b!160742 m!253923))

(declare-fun m!253925 () Bool)

(assert (=> b!160743 m!253925))

(push 1)

(assert (not b!160743))

(assert (not b!160742))

(assert (not start!33176))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54615 () Bool)

(assert (=> d!54615 (= (array_inv!3279 (buf!3990 thiss!1602)) (bvsge (size!3532 (buf!3990 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160743 d!54615))

(declare-fun d!54617 () Bool)

(assert (=> d!54617 (= (byteRangesEq!0 (select (arr!4453 (buf!3990 thiss!1602)) (currentByte!7383 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4453 (buf!3990 thiss!1602)) (currentByte!7383 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253095))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253095))) #b00000000000000000000000000000000 (currentBit!7378 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7378 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4453 (buf!3990 thiss!1602)) (currentByte!7383 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7378 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4453 (buf!3990 thiss!1602)) (currentByte!7383 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253095))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253095)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7378 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13572 () Bool)

(assert (= bs!13572 d!54617))

(declare-fun m!253957 () Bool)

(assert (=> bs!13572 m!253957))

(declare-fun m!253959 () Bool)

(assert (=> bs!13572 m!253959))

(assert (=> b!160742 d!54617))

(declare-fun d!54623 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54623 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3532 (buf!3990 thiss!1602))) ((_ sign_extend 32) (currentByte!7383 thiss!1602)) ((_ sign_extend 32) (currentBit!7378 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3532 (buf!3990 thiss!1602))) ((_ sign_extend 32) (currentByte!7383 thiss!1602)) ((_ sign_extend 32) (currentBit!7378 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13574 () Bool)

(assert (= bs!13574 d!54623))

(declare-fun m!253963 () Bool)

(assert (=> bs!13574 m!253963))

(assert (=> start!33176 d!54623))

(declare-fun d!54625 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54625 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7378 thiss!1602) (currentByte!7383 thiss!1602) (size!3532 (buf!3990 thiss!1602))))))

(declare-fun bs!13575 () Bool)

(assert (= bs!13575 d!54625))

(declare-fun m!253965 () Bool)

(assert (=> bs!13575 m!253965))

(assert (=> start!33176 d!54625))

(push 1)

(assert (not d!54623))

(assert (not d!54625))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54639 () Bool)

(assert (=> d!54639 (= (remainingBits!0 ((_ sign_extend 32) (size!3532 (buf!3990 thiss!1602))) ((_ sign_extend 32) (currentByte!7383 thiss!1602)) ((_ sign_extend 32) (currentBit!7378 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3532 (buf!3990 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7383 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7378 thiss!1602)))))))

(assert (=> d!54623 d!54639))

(declare-fun d!54641 () Bool)

(assert (=> d!54641 (= (invariant!0 (currentBit!7378 thiss!1602) (currentByte!7383 thiss!1602) (size!3532 (buf!3990 thiss!1602))) (and (bvsge (currentBit!7378 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7378 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7383 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7383 thiss!1602) (size!3532 (buf!3990 thiss!1602))) (and (= (currentBit!7378 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7383 thiss!1602) (size!3532 (buf!3990 thiss!1602)))))))))

(assert (=> d!54625 d!54641))

(push 1)

(check-sat)

