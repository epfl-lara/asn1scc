; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33180 () Bool)

(assert start!33180)

(declare-fun res!134023 () Bool)

(declare-fun e!110376 () Bool)

(assert (=> start!33180 (=> (not res!134023) (not e!110376))))

(declare-datatypes ((array!7848 0))(
  ( (array!7849 (arr!4455 (Array (_ BitVec 32) (_ BitVec 8))) (size!3534 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6236 0))(
  ( (BitStream!6237 (buf!3992 array!7848) (currentByte!7385 (_ BitVec 32)) (currentBit!7380 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6236)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33180 (= res!134023 (validate_offset_byte!0 ((_ sign_extend 32) (size!3534 (buf!3992 thiss!1602))) ((_ sign_extend 32) (currentByte!7385 thiss!1602)) ((_ sign_extend 32) (currentBit!7380 thiss!1602))))))

(assert (=> start!33180 e!110376))

(declare-fun e!110379 () Bool)

(declare-fun inv!12 (BitStream!6236) Bool)

(assert (=> start!33180 (and (inv!12 thiss!1602) e!110379)))

(assert (=> start!33180 true))

(declare-fun b!160759 () Bool)

(declare-fun lt!253101 () (_ BitVec 32))

(assert (=> b!160759 (= e!110376 (not (or (bvsle lt!253101 #b00000000000000000000000000000000) (and (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!7385 thiss!1602)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!7385 thiss!1602)) (size!3534 (buf!3992 thiss!1602)))))))))

(declare-fun e!110377 () Bool)

(assert (=> b!160759 e!110377))

(declare-fun res!134024 () Bool)

(assert (=> b!160759 (=> res!134024 e!110377)))

(assert (=> b!160759 (= res!134024 (bvsge (currentByte!7385 thiss!1602) (size!3534 (buf!3992 thiss!1602))))))

(assert (=> b!160759 (= lt!253101 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7380 thiss!1602))))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun b!160760 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160760 (= e!110377 (byteRangesEq!0 (select (arr!4455 (buf!3992 thiss!1602)) (currentByte!7385 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4455 (buf!3992 thiss!1602)) (currentByte!7385 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253101))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253101))) #b00000000000000000000000000000000 (currentBit!7380 thiss!1602)))))

(declare-fun b!160761 () Bool)

(declare-fun array_inv!3281 (array!7848) Bool)

(assert (=> b!160761 (= e!110379 (array_inv!3281 (buf!3992 thiss!1602)))))

(assert (= (and start!33180 res!134023) b!160759))

(assert (= (and b!160759 (not res!134024)) b!160760))

(assert (= start!33180 b!160761))

(declare-fun m!253939 () Bool)

(assert (=> start!33180 m!253939))

(declare-fun m!253941 () Bool)

(assert (=> start!33180 m!253941))

(declare-fun m!253943 () Bool)

(assert (=> b!160760 m!253943))

(declare-fun m!253945 () Bool)

(assert (=> b!160760 m!253945))

(assert (=> b!160760 m!253943))

(declare-fun m!253947 () Bool)

(assert (=> b!160760 m!253947))

(declare-fun m!253949 () Bool)

(assert (=> b!160761 m!253949))

(push 1)

(assert (not b!160761))

(assert (not b!160760))

(assert (not start!33180))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54627 () Bool)

(assert (=> d!54627 (= (array_inv!3281 (buf!3992 thiss!1602)) (bvsge (size!3534 (buf!3992 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160761 d!54627))

(declare-fun d!54629 () Bool)

(assert (=> d!54629 (= (byteRangesEq!0 (select (arr!4455 (buf!3992 thiss!1602)) (currentByte!7385 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4455 (buf!3992 thiss!1602)) (currentByte!7385 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253101))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253101))) #b00000000000000000000000000000000 (currentBit!7380 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7380 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4455 (buf!3992 thiss!1602)) (currentByte!7385 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7380 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4455 (buf!3992 thiss!1602)) (currentByte!7385 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253101))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253101)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7380 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13576 () Bool)

(assert (= bs!13576 d!54629))

(declare-fun m!253967 () Bool)

(assert (=> bs!13576 m!253967))

(declare-fun m!253969 () Bool)

(assert (=> bs!13576 m!253969))

(assert (=> b!160760 d!54629))

(declare-fun d!54631 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54631 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3534 (buf!3992 thiss!1602))) ((_ sign_extend 32) (currentByte!7385 thiss!1602)) ((_ sign_extend 32) (currentBit!7380 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3534 (buf!3992 thiss!1602))) ((_ sign_extend 32) (currentByte!7385 thiss!1602)) ((_ sign_extend 32) (currentBit!7380 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13577 () Bool)

(assert (= bs!13577 d!54631))

(declare-fun m!253971 () Bool)

(assert (=> bs!13577 m!253971))

(assert (=> start!33180 d!54631))

(declare-fun d!54633 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54633 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7380 thiss!1602) (currentByte!7385 thiss!1602) (size!3534 (buf!3992 thiss!1602))))))

(declare-fun bs!13578 () Bool)

(assert (= bs!13578 d!54633))

(declare-fun m!253973 () Bool)

(assert (=> bs!13578 m!253973))

(assert (=> start!33180 d!54633))

(push 1)

(assert (not d!54631))

(assert (not d!54633))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54643 () Bool)

(assert (=> d!54643 (= (remainingBits!0 ((_ sign_extend 32) (size!3534 (buf!3992 thiss!1602))) ((_ sign_extend 32) (currentByte!7385 thiss!1602)) ((_ sign_extend 32) (currentBit!7380 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3534 (buf!3992 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7385 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7380 thiss!1602)))))))

(assert (=> d!54631 d!54643))

(declare-fun d!54645 () Bool)

(assert (=> d!54645 (= (invariant!0 (currentBit!7380 thiss!1602) (currentByte!7385 thiss!1602) (size!3534 (buf!3992 thiss!1602))) (and (bvsge (currentBit!7380 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7380 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7385 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7385 thiss!1602) (size!3534 (buf!3992 thiss!1602))) (and (= (currentBit!7380 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7385 thiss!1602) (size!3534 (buf!3992 thiss!1602)))))))))

(assert (=> d!54633 d!54645))

(push 1)

(check-sat)

(pop 1)

