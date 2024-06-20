; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33138 () Bool)

(assert start!33138)

(declare-fun res!134006 () Bool)

(declare-fun e!110340 () Bool)

(assert (=> start!33138 (=> (not res!134006) (not e!110340))))

(declare-datatypes ((array!7839 0))(
  ( (array!7840 (arr!4452 (Array (_ BitVec 32) (_ BitVec 8))) (size!3531 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6230 0))(
  ( (BitStream!6231 (buf!3989 array!7839) (currentByte!7373 (_ BitVec 32)) (currentBit!7368 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6230)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33138 (= res!134006 (validate_offset_byte!0 ((_ sign_extend 32) (size!3531 (buf!3989 thiss!1602))) ((_ sign_extend 32) (currentByte!7373 thiss!1602)) ((_ sign_extend 32) (currentBit!7368 thiss!1602))))))

(assert (=> start!33138 e!110340))

(declare-fun e!110342 () Bool)

(declare-fun inv!12 (BitStream!6230) Bool)

(assert (=> start!33138 (and (inv!12 thiss!1602) e!110342)))

(assert (=> start!33138 true))

(declare-fun b!160732 () Bool)

(declare-fun lt!253092 () (_ BitVec 32))

(assert (=> b!160732 (= e!110340 (not (or (bvsle lt!253092 #b00000000000000000000000000000000) (and (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!7373 thiss!1602)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!7373 thiss!1602)) (size!3531 (buf!3989 thiss!1602)))))))))

(declare-fun e!110343 () Bool)

(assert (=> b!160732 e!110343))

(declare-fun res!134005 () Bool)

(assert (=> b!160732 (=> res!134005 e!110343)))

(assert (=> b!160732 (= res!134005 (bvsge (currentByte!7373 thiss!1602) (size!3531 (buf!3989 thiss!1602))))))

(assert (=> b!160732 (= lt!253092 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7368 thiss!1602))))))

(declare-fun b!160733 () Bool)

(declare-fun v!222 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160733 (= e!110343 (byteRangesEq!0 (select (arr!4452 (buf!3989 thiss!1602)) (currentByte!7373 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4452 (buf!3989 thiss!1602)) (currentByte!7373 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253092))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253092))) #b00000000000000000000000000000000 (currentBit!7368 thiss!1602)))))

(declare-fun b!160734 () Bool)

(declare-fun array_inv!3278 (array!7839) Bool)

(assert (=> b!160734 (= e!110342 (array_inv!3278 (buf!3989 thiss!1602)))))

(assert (= (and start!33138 res!134006) b!160732))

(assert (= (and b!160732 (not res!134005)) b!160733))

(assert (= start!33138 b!160734))

(declare-fun m!253879 () Bool)

(assert (=> start!33138 m!253879))

(declare-fun m!253881 () Bool)

(assert (=> start!33138 m!253881))

(declare-fun m!253883 () Bool)

(assert (=> b!160733 m!253883))

(declare-fun m!253885 () Bool)

(assert (=> b!160733 m!253885))

(assert (=> b!160733 m!253883))

(declare-fun m!253887 () Bool)

(assert (=> b!160733 m!253887))

(declare-fun m!253889 () Bool)

(assert (=> b!160734 m!253889))

(push 1)

(assert (not b!160733))

(assert (not start!33138))

(assert (not b!160734))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54589 () Bool)

(assert (=> d!54589 (= (byteRangesEq!0 (select (arr!4452 (buf!3989 thiss!1602)) (currentByte!7373 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4452 (buf!3989 thiss!1602)) (currentByte!7373 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253092))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253092))) #b00000000000000000000000000000000 (currentBit!7368 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7368 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4452 (buf!3989 thiss!1602)) (currentByte!7373 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7368 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4452 (buf!3989 thiss!1602)) (currentByte!7373 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253092))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253092)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7368 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13564 () Bool)

(assert (= bs!13564 d!54589))

(declare-fun m!253907 () Bool)

(assert (=> bs!13564 m!253907))

(declare-fun m!253909 () Bool)

(assert (=> bs!13564 m!253909))

(assert (=> b!160733 d!54589))

(declare-fun d!54595 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54595 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3531 (buf!3989 thiss!1602))) ((_ sign_extend 32) (currentByte!7373 thiss!1602)) ((_ sign_extend 32) (currentBit!7368 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3531 (buf!3989 thiss!1602))) ((_ sign_extend 32) (currentByte!7373 thiss!1602)) ((_ sign_extend 32) (currentBit!7368 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13565 () Bool)

(assert (= bs!13565 d!54595))

(declare-fun m!253911 () Bool)

(assert (=> bs!13565 m!253911))

(assert (=> start!33138 d!54595))

(declare-fun d!54597 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54597 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7368 thiss!1602) (currentByte!7373 thiss!1602) (size!3531 (buf!3989 thiss!1602))))))

(declare-fun bs!13566 () Bool)

(assert (= bs!13566 d!54597))

(declare-fun m!253913 () Bool)

(assert (=> bs!13566 m!253913))

(assert (=> start!33138 d!54597))

(declare-fun d!54599 () Bool)

(assert (=> d!54599 (= (array_inv!3278 (buf!3989 thiss!1602)) (bvsge (size!3531 (buf!3989 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160734 d!54599))

(push 1)

(assert (not d!54595))

(assert (not d!54597))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54605 () Bool)

(assert (=> d!54605 (= (remainingBits!0 ((_ sign_extend 32) (size!3531 (buf!3989 thiss!1602))) ((_ sign_extend 32) (currentByte!7373 thiss!1602)) ((_ sign_extend 32) (currentBit!7368 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3531 (buf!3989 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7373 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7368 thiss!1602)))))))

(assert (=> d!54595 d!54605))

(declare-fun d!54607 () Bool)

(assert (=> d!54607 (= (invariant!0 (currentBit!7368 thiss!1602) (currentByte!7373 thiss!1602) (size!3531 (buf!3989 thiss!1602))) (and (bvsge (currentBit!7368 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7368 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7373 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7373 thiss!1602) (size!3531 (buf!3989 thiss!1602))) (and (= (currentBit!7368 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7373 thiss!1602) (size!3531 (buf!3989 thiss!1602)))))))))

(assert (=> d!54597 d!54607))

(push 1)

(check-sat)

(pop 1)

