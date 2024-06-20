; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33054 () Bool)

(assert start!33054)

(declare-fun res!133925 () Bool)

(declare-fun e!110190 () Bool)

(assert (=> start!33054 (=> (not res!133925) (not e!110190))))

(declare-datatypes ((array!7809 0))(
  ( (array!7810 (arr!4440 (Array (_ BitVec 32) (_ BitVec 8))) (size!3519 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6206 0))(
  ( (BitStream!6207 (buf!3977 array!7809) (currentByte!7349 (_ BitVec 32)) (currentBit!7344 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6206)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33054 (= res!133925 (validate_offset_byte!0 ((_ sign_extend 32) (size!3519 (buf!3977 thiss!1602))) ((_ sign_extend 32) (currentByte!7349 thiss!1602)) ((_ sign_extend 32) (currentBit!7344 thiss!1602))))))

(assert (=> start!33054 e!110190))

(declare-fun e!110188 () Bool)

(declare-fun inv!12 (BitStream!6206) Bool)

(assert (=> start!33054 (and (inv!12 thiss!1602) e!110188)))

(assert (=> start!33054 true))

(declare-fun b!160615 () Bool)

(declare-fun e!110187 () Bool)

(assert (=> b!160615 (= e!110190 e!110187)))

(declare-fun res!133924 () Bool)

(assert (=> b!160615 (=> (not res!133924) (not e!110187))))

(assert (=> b!160615 (= res!133924 (bvslt (currentByte!7349 thiss!1602) (size!3519 (buf!3977 thiss!1602))))))

(declare-fun lt!253011 () (_ BitVec 32))

(assert (=> b!160615 (= lt!253011 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7344 thiss!1602))))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun b!160616 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160616 (= e!110187 (not (byteRangesEq!0 (select (arr!4440 (buf!3977 thiss!1602)) (currentByte!7349 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4440 (buf!3977 thiss!1602)) (currentByte!7349 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253011))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253011))) #b00000000000000000000000000000000 (currentBit!7344 thiss!1602))))))

(declare-fun b!160617 () Bool)

(declare-fun array_inv!3266 (array!7809) Bool)

(assert (=> b!160617 (= e!110188 (array_inv!3266 (buf!3977 thiss!1602)))))

(assert (= (and start!33054 res!133925) b!160615))

(assert (= (and b!160615 res!133924) b!160616))

(assert (= start!33054 b!160617))

(declare-fun m!253651 () Bool)

(assert (=> start!33054 m!253651))

(declare-fun m!253653 () Bool)

(assert (=> start!33054 m!253653))

(declare-fun m!253655 () Bool)

(assert (=> b!160616 m!253655))

(declare-fun m!253657 () Bool)

(assert (=> b!160616 m!253657))

(assert (=> b!160616 m!253655))

(declare-fun m!253659 () Bool)

(assert (=> b!160616 m!253659))

(declare-fun m!253661 () Bool)

(assert (=> b!160617 m!253661))

(push 1)

(assert (not b!160617))

(assert (not start!33054))

(assert (not b!160616))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54509 () Bool)

(assert (=> d!54509 (= (array_inv!3266 (buf!3977 thiss!1602)) (bvsge (size!3519 (buf!3977 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160617 d!54509))

(declare-fun d!54511 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54511 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3519 (buf!3977 thiss!1602))) ((_ sign_extend 32) (currentByte!7349 thiss!1602)) ((_ sign_extend 32) (currentBit!7344 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3519 (buf!3977 thiss!1602))) ((_ sign_extend 32) (currentByte!7349 thiss!1602)) ((_ sign_extend 32) (currentBit!7344 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13531 () Bool)

(assert (= bs!13531 d!54511))

(declare-fun m!253679 () Bool)

(assert (=> bs!13531 m!253679))

(assert (=> start!33054 d!54511))

(declare-fun d!54513 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54513 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7344 thiss!1602) (currentByte!7349 thiss!1602) (size!3519 (buf!3977 thiss!1602))))))

(declare-fun bs!13532 () Bool)

(assert (= bs!13532 d!54513))

(declare-fun m!253681 () Bool)

(assert (=> bs!13532 m!253681))

(assert (=> start!33054 d!54513))

(declare-fun d!54515 () Bool)

(assert (=> d!54515 (= (byteRangesEq!0 (select (arr!4440 (buf!3977 thiss!1602)) (currentByte!7349 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4440 (buf!3977 thiss!1602)) (currentByte!7349 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253011))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253011))) #b00000000000000000000000000000000 (currentBit!7344 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7344 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4440 (buf!3977 thiss!1602)) (currentByte!7349 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7344 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4440 (buf!3977 thiss!1602)) (currentByte!7349 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253011))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253011)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7344 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13533 () Bool)

