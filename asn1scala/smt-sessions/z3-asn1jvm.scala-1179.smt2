; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33392 () Bool)

(assert start!33392)

(declare-fun res!134134 () Bool)

(declare-fun e!110590 () Bool)

(assert (=> start!33392 (=> (not res!134134) (not e!110590))))

(declare-datatypes ((array!7897 0))(
  ( (array!7898 (arr!4472 (Array (_ BitVec 32) (_ BitVec 8))) (size!3551 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6270 0))(
  ( (BitStream!6271 (buf!4009 array!7897) (currentByte!7446 (_ BitVec 32)) (currentBit!7441 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6270)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33392 (= res!134134 (validate_offset_byte!0 ((_ sign_extend 32) (size!3551 (buf!4009 thiss!1602))) ((_ sign_extend 32) (currentByte!7446 thiss!1602)) ((_ sign_extend 32) (currentBit!7441 thiss!1602))))))

(assert (=> start!33392 e!110590))

(declare-fun e!110592 () Bool)

(declare-fun inv!12 (BitStream!6270) Bool)

(assert (=> start!33392 (and (inv!12 thiss!1602) e!110592)))

(assert (=> start!33392 true))

(declare-fun b!160921 () Bool)

(declare-datatypes ((Unit!10974 0))(
  ( (Unit!10975) )
))
(declare-datatypes ((tuple3!830 0))(
  ( (tuple3!831 (_1!7766 Unit!10974) (_2!7766 (_ BitVec 8)) (_3!532 BitStream!6270)) )
))
(declare-fun lt!253304 () tuple3!830)

(assert (=> b!160921 (= e!110590 (not (or (= (bvand (currentByte!7446 (_3!532 lt!253304)) #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand (currentByte!7446 (_3!532 lt!253304)) #b10000000000000000000000000000000) (bvand (bvsub (currentByte!7446 (_3!532 lt!253304)) #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!253311 () (_ BitVec 32))

(declare-fun lt!253309 () array!7897)

(declare-fun lt!253310 () (_ BitVec 8))

(declare-fun lt!253306 () (_ BitVec 32))

(declare-fun lt!253308 () (_ BitVec 8))

(declare-fun lt!253305 () (_ BitVec 32))

(declare-fun lt!253307 () (_ BitVec 8))

(declare-fun Unit!10976 () Unit!10974)

(declare-fun Unit!10977 () Unit!10974)

(assert (=> b!160921 (= lt!253304 (ite (bvsgt lt!253305 #b00000000000000000000000000000000) (let ((bdg!9543 ((_ extract 7 0) (bvnot lt!253311)))) (let ((bdg!9544 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4472 (buf!4009 thiss!1602)) (currentByte!7446 thiss!1602) lt!253308) (currentByte!7446 thiss!1602) lt!253310) (bvadd #b00000000000000000000000000000001 (currentByte!7446 thiss!1602)))) ((_ sign_extend 24) bdg!9543))))) (tuple3!831 Unit!10976 bdg!9543 (BitStream!6271 (array!7898 (store (arr!4472 (array!7898 (store (arr!4472 lt!253309) (bvadd #b00000000000000000000000000000001 (currentByte!7446 thiss!1602)) bdg!9544) (size!3551 lt!253309))) (bvadd #b00000000000000000000000000000001 (currentByte!7446 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9544) (bvshl ((_ sign_extend 24) v!222) lt!253306)))) (size!3551 (array!7898 (store (arr!4472 lt!253309) (bvadd #b00000000000000000000000000000001 (currentByte!7446 thiss!1602)) bdg!9544) (size!3551 lt!253309)))) (bvadd #b00000000000000000000000000000001 (currentByte!7446 thiss!1602)) (currentBit!7441 thiss!1602))))) (tuple3!831 Unit!10977 lt!253307 (BitStream!6271 lt!253309 (bvadd #b00000000000000000000000000000001 (currentByte!7446 thiss!1602)) (currentBit!7441 thiss!1602)))))))

(declare-fun e!110589 () Bool)

(assert (=> b!160921 e!110589))

(declare-fun res!134135 () Bool)

(assert (=> b!160921 (=> res!134135 e!110589)))

(assert (=> b!160921 (= res!134135 (bvsge (currentByte!7446 thiss!1602) (size!3551 (buf!4009 thiss!1602))))))

(assert (=> b!160921 (= lt!253309 (array!7898 (store (store (arr!4472 (buf!4009 thiss!1602)) (currentByte!7446 thiss!1602) lt!253308) (currentByte!7446 thiss!1602) lt!253310) (size!3551 (buf!4009 thiss!1602))))))

(assert (=> b!160921 (= lt!253310 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253308) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253305))))))

(assert (=> b!160921 (= lt!253308 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4472 (buf!4009 thiss!1602)) (currentByte!7446 thiss!1602))) lt!253311)))))

(assert (=> b!160921 (= lt!253311 ((_ sign_extend 24) lt!253307))))

(assert (=> b!160921 (= lt!253307 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!253306)))))))

(assert (=> b!160921 (= lt!253306 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253305))))))

(assert (=> b!160921 (= lt!253305 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7441 thiss!1602))))))

(declare-fun b!160922 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160922 (= e!110589 (byteRangesEq!0 (select (arr!4472 (buf!4009 thiss!1602)) (currentByte!7446 thiss!1602)) lt!253310 #b00000000000000000000000000000000 (currentBit!7441 thiss!1602)))))

(declare-fun b!160923 () Bool)

(declare-fun array_inv!3298 (array!7897) Bool)

(assert (=> b!160923 (= e!110592 (array_inv!3298 (buf!4009 thiss!1602)))))

(assert (= (and start!33392 res!134134) b!160921))

(assert (= (and b!160921 (not res!134135)) b!160922))

(assert (= start!33392 b!160923))

(declare-fun m!254345 () Bool)

(assert (=> start!33392 m!254345))

(declare-fun m!254347 () Bool)

(assert (=> start!33392 m!254347))

(declare-fun m!254349 () Bool)

(assert (=> b!160921 m!254349))

(declare-fun m!254351 () Bool)

(assert (=> b!160921 m!254351))

(declare-fun m!254353 () Bool)

(assert (=> b!160921 m!254353))

(declare-fun m!254355 () Bool)

(assert (=> b!160921 m!254355))

(declare-fun m!254357 () Bool)

(assert (=> b!160921 m!254357))

(declare-fun m!254359 () Bool)

(assert (=> b!160921 m!254359))

(declare-fun m!254361 () Bool)

(assert (=> b!160921 m!254361))

(assert (=> b!160922 m!254361))

(assert (=> b!160922 m!254361))

(declare-fun m!254363 () Bool)

(assert (=> b!160922 m!254363))

(declare-fun m!254365 () Bool)

(assert (=> b!160923 m!254365))

(check-sat (not start!33392) (not b!160922) (not b!160923))
(check-sat)
(get-model)

(declare-fun d!54817 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54817 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3551 (buf!4009 thiss!1602))) ((_ sign_extend 32) (currentByte!7446 thiss!1602)) ((_ sign_extend 32) (currentBit!7441 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3551 (buf!4009 thiss!1602))) ((_ sign_extend 32) (currentByte!7446 thiss!1602)) ((_ sign_extend 32) (currentBit!7441 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13636 () Bool)

(assert (= bs!13636 d!54817))

(declare-fun m!254389 () Bool)

(assert (=> bs!13636 m!254389))

(assert (=> start!33392 d!54817))

(declare-fun d!54819 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54819 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7441 thiss!1602) (currentByte!7446 thiss!1602) (size!3551 (buf!4009 thiss!1602))))))

(declare-fun bs!13637 () Bool)

(assert (= bs!13637 d!54819))

(declare-fun m!254391 () Bool)

(assert (=> bs!13637 m!254391))

(assert (=> start!33392 d!54819))

(declare-fun d!54821 () Bool)

(assert (=> d!54821 (= (byteRangesEq!0 (select (arr!4472 (buf!4009 thiss!1602)) (currentByte!7446 thiss!1602)) lt!253310 #b00000000000000000000000000000000 (currentBit!7441 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7441 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4472 (buf!4009 thiss!1602)) (currentByte!7446 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7441 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!253310) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7441 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13638 () Bool)

(assert (= bs!13638 d!54821))

(declare-fun m!254393 () Bool)

(assert (=> bs!13638 m!254393))

(declare-fun m!254395 () Bool)

(assert (=> bs!13638 m!254395))

(assert (=> b!160922 d!54821))

(declare-fun d!54823 () Bool)

(assert (=> d!54823 (= (array_inv!3298 (buf!4009 thiss!1602)) (bvsge (size!3551 (buf!4009 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160923 d!54823))

(check-sat (not d!54819) (not d!54817))
(check-sat)
(get-model)

(declare-fun d!54837 () Bool)

(assert (=> d!54837 (= (invariant!0 (currentBit!7441 thiss!1602) (currentByte!7446 thiss!1602) (size!3551 (buf!4009 thiss!1602))) (and (bvsge (currentBit!7441 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7441 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7446 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7446 thiss!1602) (size!3551 (buf!4009 thiss!1602))) (and (= (currentBit!7441 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7446 thiss!1602) (size!3551 (buf!4009 thiss!1602)))))))))

(assert (=> d!54819 d!54837))

(declare-fun d!54839 () Bool)

(assert (=> d!54839 (= (remainingBits!0 ((_ sign_extend 32) (size!3551 (buf!4009 thiss!1602))) ((_ sign_extend 32) (currentByte!7446 thiss!1602)) ((_ sign_extend 32) (currentBit!7441 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3551 (buf!4009 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7446 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7441 thiss!1602)))))))

(assert (=> d!54817 d!54839))

(check-sat)
