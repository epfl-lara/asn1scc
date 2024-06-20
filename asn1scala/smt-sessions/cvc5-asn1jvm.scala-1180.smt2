; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33424 () Bool)

(assert start!33424)

(declare-fun res!134146 () Bool)

(declare-fun e!110613 () Bool)

(assert (=> start!33424 (=> (not res!134146) (not e!110613))))

(declare-datatypes ((array!7904 0))(
  ( (array!7905 (arr!4474 (Array (_ BitVec 32) (_ BitVec 8))) (size!3553 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6274 0))(
  ( (BitStream!6275 (buf!4011 array!7904) (currentByte!7453 (_ BitVec 32)) (currentBit!7448 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6274)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33424 (= res!134146 (validate_offset_byte!0 ((_ sign_extend 32) (size!3553 (buf!4011 thiss!1602))) ((_ sign_extend 32) (currentByte!7453 thiss!1602)) ((_ sign_extend 32) (currentBit!7448 thiss!1602))))))

(assert (=> start!33424 e!110613))

(declare-fun e!110614 () Bool)

(declare-fun inv!12 (BitStream!6274) Bool)

(assert (=> start!33424 (and (inv!12 thiss!1602) e!110614)))

(assert (=> start!33424 true))

(declare-fun b!160939 () Bool)

(declare-datatypes ((Unit!10982 0))(
  ( (Unit!10983) )
))
(declare-datatypes ((tuple3!834 0))(
  ( (tuple3!835 (_1!7768 Unit!10982) (_2!7768 (_ BitVec 8)) (_3!534 BitStream!6274)) )
))
(declare-fun lt!253353 () tuple3!834)

(assert (=> b!160939 (= e!110613 (not (and (bvsge (bvsub (currentByte!7453 (_3!534 lt!253353)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7453 (_3!534 lt!253353)) #b00000000000000000000000000000001) (size!3553 (buf!4011 (_3!534 lt!253353)))))))))

(declare-fun lt!253356 () (_ BitVec 32))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!253352 () (_ BitVec 8))

(declare-fun lt!253355 () array!7904)

(declare-fun lt!253357 () (_ BitVec 32))

(declare-fun lt!253354 () (_ BitVec 32))

(declare-fun lt!253359 () (_ BitVec 8))

(declare-fun lt!253358 () (_ BitVec 8))

(declare-fun Unit!10984 () Unit!10982)

(declare-fun Unit!10985 () Unit!10982)

(assert (=> b!160939 (= lt!253353 (ite (bvsgt lt!253356 #b00000000000000000000000000000000) (let ((bdg!9553 ((_ extract 7 0) (bvnot lt!253357)))) (let ((bdg!9554 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4474 (buf!4011 thiss!1602)) (currentByte!7453 thiss!1602) lt!253352) (currentByte!7453 thiss!1602) lt!253358) (bvadd #b00000000000000000000000000000001 (currentByte!7453 thiss!1602)))) ((_ sign_extend 24) bdg!9553))))) (tuple3!835 Unit!10984 bdg!9553 (BitStream!6275 (array!7905 (store (arr!4474 (array!7905 (store (arr!4474 lt!253355) (bvadd #b00000000000000000000000000000001 (currentByte!7453 thiss!1602)) bdg!9554) (size!3553 lt!253355))) (bvadd #b00000000000000000000000000000001 (currentByte!7453 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9554) (bvshl ((_ sign_extend 24) v!222) lt!253354)))) (size!3553 (array!7905 (store (arr!4474 lt!253355) (bvadd #b00000000000000000000000000000001 (currentByte!7453 thiss!1602)) bdg!9554) (size!3553 lt!253355)))) (bvadd #b00000000000000000000000000000001 (currentByte!7453 thiss!1602)) (currentBit!7448 thiss!1602))))) (tuple3!835 Unit!10985 lt!253359 (BitStream!6275 lt!253355 (bvadd #b00000000000000000000000000000001 (currentByte!7453 thiss!1602)) (currentBit!7448 thiss!1602)))))))

(declare-fun e!110616 () Bool)

(assert (=> b!160939 e!110616))

(declare-fun res!134147 () Bool)

(assert (=> b!160939 (=> res!134147 e!110616)))

(assert (=> b!160939 (= res!134147 (bvsge (currentByte!7453 thiss!1602) (size!3553 (buf!4011 thiss!1602))))))

(assert (=> b!160939 (= lt!253355 (array!7905 (store (store (arr!4474 (buf!4011 thiss!1602)) (currentByte!7453 thiss!1602) lt!253352) (currentByte!7453 thiss!1602) lt!253358) (size!3553 (buf!4011 thiss!1602))))))

(assert (=> b!160939 (= lt!253358 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253352) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253356))))))

(assert (=> b!160939 (= lt!253352 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4474 (buf!4011 thiss!1602)) (currentByte!7453 thiss!1602))) lt!253357)))))

(assert (=> b!160939 (= lt!253357 ((_ sign_extend 24) lt!253359))))

(assert (=> b!160939 (= lt!253359 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!253354)))))))

(assert (=> b!160939 (= lt!253354 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253356))))))

(assert (=> b!160939 (= lt!253356 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7448 thiss!1602))))))

(declare-fun b!160940 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160940 (= e!110616 (byteRangesEq!0 (select (arr!4474 (buf!4011 thiss!1602)) (currentByte!7453 thiss!1602)) lt!253358 #b00000000000000000000000000000000 (currentBit!7448 thiss!1602)))))

(declare-fun b!160941 () Bool)

(declare-fun array_inv!3300 (array!7904) Bool)

(assert (=> b!160941 (= e!110614 (array_inv!3300 (buf!4011 thiss!1602)))))

(assert (= (and start!33424 res!134146) b!160939))

(assert (= (and b!160939 (not res!134147)) b!160940))

(assert (= start!33424 b!160941))

(declare-fun m!254413 () Bool)

(assert (=> start!33424 m!254413))

(declare-fun m!254415 () Bool)

(assert (=> start!33424 m!254415))

(declare-fun m!254417 () Bool)

(assert (=> b!160939 m!254417))

(declare-fun m!254419 () Bool)

(assert (=> b!160939 m!254419))

(declare-fun m!254421 () Bool)

(assert (=> b!160939 m!254421))

(declare-fun m!254423 () Bool)

(assert (=> b!160939 m!254423))

(declare-fun m!254425 () Bool)

(assert (=> b!160939 m!254425))

(declare-fun m!254427 () Bool)

(assert (=> b!160939 m!254427))

(declare-fun m!254429 () Bool)

(assert (=> b!160939 m!254429))

(assert (=> b!160940 m!254423))

(assert (=> b!160940 m!254423))

(declare-fun m!254431 () Bool)

(assert (=> b!160940 m!254431))

(declare-fun m!254433 () Bool)

(assert (=> b!160941 m!254433))

(push 1)

(assert (not b!160941))

(assert (not b!160940))

(assert (not start!33424))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54845 () Bool)

(assert (=> d!54845 (= (array_inv!3300 (buf!4011 thiss!1602)) (bvsge (size!3553 (buf!4011 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160941 d!54845))

(declare-fun d!54847 () Bool)

(assert (=> d!54847 (= (byteRangesEq!0 (select (arr!4474 (buf!4011 thiss!1602)) (currentByte!7453 thiss!1602)) lt!253358 #b00000000000000000000000000000000 (currentBit!7448 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7448 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4474 (buf!4011 thiss!1602)) (currentByte!7453 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7448 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!253358) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7448 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13650 () Bool)

(assert (= bs!13650 d!54847))

(declare-fun m!254483 () Bool)

(assert (=> bs!13650 m!254483))

(declare-fun m!254485 () Bool)

(assert (=> bs!13650 m!254485))

(assert (=> b!160940 d!54847))

(declare-fun d!54853 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54853 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3553 (buf!4011 thiss!1602))) ((_ sign_extend 32) (currentByte!7453 thiss!1602)) ((_ sign_extend 32) (currentBit!7448 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3553 (buf!4011 thiss!1602))) ((_ sign_extend 32) (currentByte!7453 thiss!1602)) ((_ sign_extend 32) (currentBit!7448 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13651 () Bool)

(assert (= bs!13651 d!54853))

(declare-fun m!254487 () Bool)

(assert (=> bs!13651 m!254487))

(assert (=> start!33424 d!54853))

(declare-fun d!54855 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54855 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7448 thiss!1602) (currentByte!7453 thiss!1602) (size!3553 (buf!4011 thiss!1602))))))

(declare-fun bs!13652 () Bool)

(assert (= bs!13652 d!54855))

(declare-fun m!254489 () Bool)

(assert (=> bs!13652 m!254489))

(assert (=> start!33424 d!54855))

(push 1)

(assert (not d!54853))

(assert (not d!54855))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54871 () Bool)

(assert (=> d!54871 (= (remainingBits!0 ((_ sign_extend 32) (size!3553 (buf!4011 thiss!1602))) ((_ sign_extend 32) (currentByte!7453 thiss!1602)) ((_ sign_extend 32) (currentBit!7448 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3553 (buf!4011 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7453 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7448 thiss!1602)))))))

(assert (=> d!54853 d!54871))

(declare-fun d!54873 () Bool)

(assert (=> d!54873 (= (invariant!0 (currentBit!7448 thiss!1602) (currentByte!7453 thiss!1602) (size!3553 (buf!4011 thiss!1602))) (and (bvsge (currentBit!7448 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7448 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7453 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7453 thiss!1602) (size!3553 (buf!4011 thiss!1602))) (and (= (currentBit!7448 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7453 thiss!1602) (size!3553 (buf!4011 thiss!1602)))))))))

(assert (=> d!54855 d!54873))

(push 1)

(check-sat)

(pop 1)

