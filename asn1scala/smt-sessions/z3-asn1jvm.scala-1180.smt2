; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33426 () Bool)

(assert start!33426)

(declare-fun res!134152 () Bool)

(declare-fun e!110627 () Bool)

(assert (=> start!33426 (=> (not res!134152) (not e!110627))))

(declare-datatypes ((array!7906 0))(
  ( (array!7907 (arr!4475 (Array (_ BitVec 32) (_ BitVec 8))) (size!3554 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6276 0))(
  ( (BitStream!6277 (buf!4012 array!7906) (currentByte!7454 (_ BitVec 32)) (currentBit!7449 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6276)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33426 (= res!134152 (validate_offset_byte!0 ((_ sign_extend 32) (size!3554 (buf!4012 thiss!1602))) ((_ sign_extend 32) (currentByte!7454 thiss!1602)) ((_ sign_extend 32) (currentBit!7449 thiss!1602))))))

(assert (=> start!33426 e!110627))

(declare-fun e!110628 () Bool)

(declare-fun inv!12 (BitStream!6276) Bool)

(assert (=> start!33426 (and (inv!12 thiss!1602) e!110628)))

(assert (=> start!33426 true))

(declare-fun b!160948 () Bool)

(declare-datatypes ((Unit!10986 0))(
  ( (Unit!10987) )
))
(declare-datatypes ((tuple3!836 0))(
  ( (tuple3!837 (_1!7769 Unit!10986) (_2!7769 (_ BitVec 8)) (_3!535 BitStream!6276)) )
))
(declare-fun lt!253380 () tuple3!836)

(assert (=> b!160948 (= e!110627 (not (and (bvsge (bvsub (currentByte!7454 (_3!535 lt!253380)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7454 (_3!535 lt!253380)) #b00000000000000000000000000000001) (size!3554 (buf!4012 (_3!535 lt!253380)))))))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!253378 () (_ BitVec 32))

(declare-fun lt!253383 () (_ BitVec 8))

(declare-fun lt!253377 () (_ BitVec 8))

(declare-fun lt!253381 () (_ BitVec 32))

(declare-fun lt!253382 () array!7906)

(declare-fun lt!253379 () (_ BitVec 32))

(declare-fun lt!253376 () (_ BitVec 8))

(declare-fun Unit!10988 () Unit!10986)

(declare-fun Unit!10989 () Unit!10986)

(assert (=> b!160948 (= lt!253380 (ite (bvsgt lt!253379 #b00000000000000000000000000000000) (let ((bdg!9553 ((_ extract 7 0) (bvnot lt!253378)))) (let ((bdg!9554 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4475 (buf!4012 thiss!1602)) (currentByte!7454 thiss!1602) lt!253383) (currentByte!7454 thiss!1602) lt!253376) (bvadd #b00000000000000000000000000000001 (currentByte!7454 thiss!1602)))) ((_ sign_extend 24) bdg!9553))))) (tuple3!837 Unit!10988 bdg!9553 (BitStream!6277 (array!7907 (store (arr!4475 (array!7907 (store (arr!4475 lt!253382) (bvadd #b00000000000000000000000000000001 (currentByte!7454 thiss!1602)) bdg!9554) (size!3554 lt!253382))) (bvadd #b00000000000000000000000000000001 (currentByte!7454 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9554) (bvshl ((_ sign_extend 24) v!222) lt!253381)))) (size!3554 (array!7907 (store (arr!4475 lt!253382) (bvadd #b00000000000000000000000000000001 (currentByte!7454 thiss!1602)) bdg!9554) (size!3554 lt!253382)))) (bvadd #b00000000000000000000000000000001 (currentByte!7454 thiss!1602)) (currentBit!7449 thiss!1602))))) (tuple3!837 Unit!10989 lt!253377 (BitStream!6277 lt!253382 (bvadd #b00000000000000000000000000000001 (currentByte!7454 thiss!1602)) (currentBit!7449 thiss!1602)))))))

(declare-fun e!110625 () Bool)

(assert (=> b!160948 e!110625))

(declare-fun res!134153 () Bool)

(assert (=> b!160948 (=> res!134153 e!110625)))

(assert (=> b!160948 (= res!134153 (bvsge (currentByte!7454 thiss!1602) (size!3554 (buf!4012 thiss!1602))))))

(assert (=> b!160948 (= lt!253382 (array!7907 (store (store (arr!4475 (buf!4012 thiss!1602)) (currentByte!7454 thiss!1602) lt!253383) (currentByte!7454 thiss!1602) lt!253376) (size!3554 (buf!4012 thiss!1602))))))

(assert (=> b!160948 (= lt!253376 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253383) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253379))))))

(assert (=> b!160948 (= lt!253383 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4475 (buf!4012 thiss!1602)) (currentByte!7454 thiss!1602))) lt!253378)))))

(assert (=> b!160948 (= lt!253378 ((_ sign_extend 24) lt!253377))))

(assert (=> b!160948 (= lt!253377 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!253381)))))))

(assert (=> b!160948 (= lt!253381 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253379))))))

(assert (=> b!160948 (= lt!253379 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7449 thiss!1602))))))

(declare-fun b!160949 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160949 (= e!110625 (byteRangesEq!0 (select (arr!4475 (buf!4012 thiss!1602)) (currentByte!7454 thiss!1602)) lt!253376 #b00000000000000000000000000000000 (currentBit!7449 thiss!1602)))))

(declare-fun b!160950 () Bool)

(declare-fun array_inv!3301 (array!7906) Bool)

(assert (=> b!160950 (= e!110628 (array_inv!3301 (buf!4012 thiss!1602)))))

(assert (= (and start!33426 res!134152) b!160948))

(assert (= (and b!160948 (not res!134153)) b!160949))

(assert (= start!33426 b!160950))

(declare-fun m!254435 () Bool)

(assert (=> start!33426 m!254435))

(declare-fun m!254437 () Bool)

(assert (=> start!33426 m!254437))

(declare-fun m!254439 () Bool)

(assert (=> b!160948 m!254439))

(declare-fun m!254441 () Bool)

(assert (=> b!160948 m!254441))

(declare-fun m!254443 () Bool)

(assert (=> b!160948 m!254443))

(declare-fun m!254445 () Bool)

(assert (=> b!160948 m!254445))

(declare-fun m!254447 () Bool)

(assert (=> b!160948 m!254447))

(declare-fun m!254449 () Bool)

(assert (=> b!160948 m!254449))

(declare-fun m!254451 () Bool)

(assert (=> b!160948 m!254451))

(assert (=> b!160949 m!254445))

(assert (=> b!160949 m!254445))

(declare-fun m!254453 () Bool)

(assert (=> b!160949 m!254453))

(declare-fun m!254455 () Bool)

(assert (=> b!160950 m!254455))

(check-sat (not start!33426) (not b!160949) (not b!160950))
(check-sat)
(get-model)

(declare-fun d!54843 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54843 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3554 (buf!4012 thiss!1602))) ((_ sign_extend 32) (currentByte!7454 thiss!1602)) ((_ sign_extend 32) (currentBit!7449 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3554 (buf!4012 thiss!1602))) ((_ sign_extend 32) (currentByte!7454 thiss!1602)) ((_ sign_extend 32) (currentBit!7449 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13648 () Bool)

(assert (= bs!13648 d!54843))

(declare-fun m!254479 () Bool)

(assert (=> bs!13648 m!254479))

(assert (=> start!33426 d!54843))

(declare-fun d!54849 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54849 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7449 thiss!1602) (currentByte!7454 thiss!1602) (size!3554 (buf!4012 thiss!1602))))))

(declare-fun bs!13649 () Bool)

(assert (= bs!13649 d!54849))

(declare-fun m!254481 () Bool)

(assert (=> bs!13649 m!254481))

(assert (=> start!33426 d!54849))

(declare-fun d!54851 () Bool)

(assert (=> d!54851 (= (byteRangesEq!0 (select (arr!4475 (buf!4012 thiss!1602)) (currentByte!7454 thiss!1602)) lt!253376 #b00000000000000000000000000000000 (currentBit!7449 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7449 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4475 (buf!4012 thiss!1602)) (currentByte!7454 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7449 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!253376) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7449 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13653 () Bool)

(assert (= bs!13653 d!54851))

(declare-fun m!254491 () Bool)

(assert (=> bs!13653 m!254491))

(declare-fun m!254493 () Bool)

(assert (=> bs!13653 m!254493))

(assert (=> b!160949 d!54851))

(declare-fun d!54859 () Bool)

(assert (=> d!54859 (= (array_inv!3301 (buf!4012 thiss!1602)) (bvsge (size!3554 (buf!4012 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160950 d!54859))

(check-sat (not d!54843) (not d!54849))
(check-sat)
(get-model)

(declare-fun d!54867 () Bool)

(assert (=> d!54867 (= (remainingBits!0 ((_ sign_extend 32) (size!3554 (buf!4012 thiss!1602))) ((_ sign_extend 32) (currentByte!7454 thiss!1602)) ((_ sign_extend 32) (currentBit!7449 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3554 (buf!4012 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7454 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7449 thiss!1602)))))))

(assert (=> d!54843 d!54867))

(declare-fun d!54869 () Bool)

(assert (=> d!54869 (= (invariant!0 (currentBit!7449 thiss!1602) (currentByte!7454 thiss!1602) (size!3554 (buf!4012 thiss!1602))) (and (bvsge (currentBit!7449 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7449 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7454 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7454 thiss!1602) (size!3554 (buf!4012 thiss!1602))) (and (= (currentBit!7449 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7454 thiss!1602) (size!3554 (buf!4012 thiss!1602)))))))))

(assert (=> d!54849 d!54869))

(check-sat)
