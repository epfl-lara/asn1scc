; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33470 () Bool)

(assert start!33470)

(declare-fun res!134176 () Bool)

(declare-fun e!110673 () Bool)

(assert (=> start!33470 (=> (not res!134176) (not e!110673))))

(declare-datatypes ((array!7917 0))(
  ( (array!7918 (arr!4479 (Array (_ BitVec 32) (_ BitVec 8))) (size!3558 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6284 0))(
  ( (BitStream!6285 (buf!4016 array!7917) (currentByte!7467 (_ BitVec 32)) (currentBit!7462 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6284)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33470 (= res!134176 (validate_offset_byte!0 ((_ sign_extend 32) (size!3558 (buf!4016 thiss!1602))) ((_ sign_extend 32) (currentByte!7467 thiss!1602)) ((_ sign_extend 32) (currentBit!7462 thiss!1602))))))

(assert (=> start!33470 e!110673))

(declare-fun e!110675 () Bool)

(declare-fun inv!12 (BitStream!6284) Bool)

(assert (=> start!33470 (and (inv!12 thiss!1602) e!110675)))

(assert (=> start!33470 true))

(declare-fun b!160984 () Bool)

(declare-datatypes ((Unit!11002 0))(
  ( (Unit!11003) )
))
(declare-datatypes ((tuple3!844 0))(
  ( (tuple3!845 (_1!7773 Unit!11002) (_2!7773 (_ BitVec 8)) (_3!539 BitStream!6284)) )
))
(declare-fun lt!253479 () tuple3!844)

(assert (=> b!160984 (= e!110673 (not (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7467 (_3!539 lt!253479)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7467 (_3!539 lt!253479)) #b00000000000000000000000000000001) (size!3558 (buf!4016 thiss!1602))))))))

(declare-fun lt!253476 () array!7917)

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!253477 () (_ BitVec 8))

(declare-fun lt!253474 () (_ BitVec 32))

(declare-fun lt!253472 () (_ BitVec 32))

(declare-fun lt!253475 () (_ BitVec 8))

(declare-fun lt!253478 () (_ BitVec 32))

(declare-fun lt!253473 () (_ BitVec 8))

(declare-fun Unit!11004 () Unit!11002)

(declare-fun Unit!11005 () Unit!11002)

(assert (=> b!160984 (= lt!253479 (ite (bvsgt lt!253474 #b00000000000000000000000000000000) (let ((bdg!9563 ((_ extract 7 0) (bvnot lt!253472)))) (let ((bdg!9564 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4479 (buf!4016 thiss!1602)) (currentByte!7467 thiss!1602) lt!253475) (currentByte!7467 thiss!1602) lt!253477) (bvadd #b00000000000000000000000000000001 (currentByte!7467 thiss!1602)))) ((_ sign_extend 24) bdg!9563))))) (tuple3!845 Unit!11004 bdg!9563 (BitStream!6285 (array!7918 (store (arr!4479 (array!7918 (store (arr!4479 lt!253476) (bvadd #b00000000000000000000000000000001 (currentByte!7467 thiss!1602)) bdg!9564) (size!3558 lt!253476))) (bvadd #b00000000000000000000000000000001 (currentByte!7467 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9564) (bvshl ((_ sign_extend 24) v!222) lt!253478)))) (size!3558 (array!7918 (store (arr!4479 lt!253476) (bvadd #b00000000000000000000000000000001 (currentByte!7467 thiss!1602)) bdg!9564) (size!3558 lt!253476)))) (bvadd #b00000000000000000000000000000001 (currentByte!7467 thiss!1602)) (currentBit!7462 thiss!1602))))) (tuple3!845 Unit!11005 lt!253473 (BitStream!6285 lt!253476 (bvadd #b00000000000000000000000000000001 (currentByte!7467 thiss!1602)) (currentBit!7462 thiss!1602)))))))

(declare-fun e!110676 () Bool)

(assert (=> b!160984 e!110676))

(declare-fun res!134177 () Bool)

(assert (=> b!160984 (=> res!134177 e!110676)))

(assert (=> b!160984 (= res!134177 (bvsge (currentByte!7467 thiss!1602) (size!3558 (buf!4016 thiss!1602))))))

(assert (=> b!160984 (= lt!253476 (array!7918 (store (store (arr!4479 (buf!4016 thiss!1602)) (currentByte!7467 thiss!1602) lt!253475) (currentByte!7467 thiss!1602) lt!253477) (size!3558 (buf!4016 thiss!1602))))))

(assert (=> b!160984 (= lt!253477 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253475) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253474))))))

(assert (=> b!160984 (= lt!253475 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4479 (buf!4016 thiss!1602)) (currentByte!7467 thiss!1602))) lt!253472)))))

(assert (=> b!160984 (= lt!253472 ((_ sign_extend 24) lt!253473))))

(assert (=> b!160984 (= lt!253473 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!253478)))))))

(assert (=> b!160984 (= lt!253478 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253474))))))

(assert (=> b!160984 (= lt!253474 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7462 thiss!1602))))))

(declare-fun b!160985 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160985 (= e!110676 (byteRangesEq!0 (select (arr!4479 (buf!4016 thiss!1602)) (currentByte!7467 thiss!1602)) lt!253477 #b00000000000000000000000000000000 (currentBit!7462 thiss!1602)))))

(declare-fun b!160986 () Bool)

(declare-fun array_inv!3305 (array!7917) Bool)

(assert (=> b!160986 (= e!110675 (array_inv!3305 (buf!4016 thiss!1602)))))

(assert (= (and start!33470 res!134176) b!160984))

(assert (= (and b!160984 (not res!134177)) b!160985))

(assert (= start!33470 b!160986))

(declare-fun m!254547 () Bool)

(assert (=> start!33470 m!254547))

(declare-fun m!254549 () Bool)

(assert (=> start!33470 m!254549))

(declare-fun m!254551 () Bool)

(assert (=> b!160984 m!254551))

(declare-fun m!254553 () Bool)

(assert (=> b!160984 m!254553))

(declare-fun m!254555 () Bool)

(assert (=> b!160984 m!254555))

(declare-fun m!254557 () Bool)

(assert (=> b!160984 m!254557))

(declare-fun m!254559 () Bool)

(assert (=> b!160984 m!254559))

(declare-fun m!254561 () Bool)

(assert (=> b!160984 m!254561))

(declare-fun m!254563 () Bool)

(assert (=> b!160984 m!254563))

(assert (=> b!160985 m!254563))

(assert (=> b!160985 m!254563))

(declare-fun m!254565 () Bool)

(assert (=> b!160985 m!254565))

(declare-fun m!254567 () Bool)

(assert (=> b!160986 m!254567))

(push 1)

(assert (not b!160985))

(assert (not b!160986))

(assert (not start!33470))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54897 () Bool)

(assert (=> d!54897 (= (byteRangesEq!0 (select (arr!4479 (buf!4016 thiss!1602)) (currentByte!7467 thiss!1602)) lt!253477 #b00000000000000000000000000000000 (currentBit!7462 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7462 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4479 (buf!4016 thiss!1602)) (currentByte!7467 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7462 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!253477) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7462 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13665 () Bool)

(assert (= bs!13665 d!54897))

(declare-fun m!254581 () Bool)

(assert (=> bs!13665 m!254581))

(declare-fun m!254583 () Bool)

(assert (=> bs!13665 m!254583))

(assert (=> b!160985 d!54897))

(declare-fun d!54899 () Bool)

(assert (=> d!54899 (= (array_inv!3305 (buf!4016 thiss!1602)) (bvsge (size!3558 (buf!4016 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160986 d!54899))

(declare-fun d!54901 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54901 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3558 (buf!4016 thiss!1602))) ((_ sign_extend 32) (currentByte!7467 thiss!1602)) ((_ sign_extend 32) (currentBit!7462 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3558 (buf!4016 thiss!1602))) ((_ sign_extend 32) (currentByte!7467 thiss!1602)) ((_ sign_extend 32) (currentBit!7462 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13666 () Bool)

(assert (= bs!13666 d!54901))

(declare-fun m!254585 () Bool)

(assert (=> bs!13666 m!254585))

(assert (=> start!33470 d!54901))

(declare-fun d!54903 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54903 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7462 thiss!1602) (currentByte!7467 thiss!1602) (size!3558 (buf!4016 thiss!1602))))))

(declare-fun bs!13667 () Bool)

(assert (= bs!13667 d!54903))

(declare-fun m!254587 () Bool)

(assert (=> bs!13667 m!254587))

(assert (=> start!33470 d!54903))

(push 1)

(assert (not d!54903))

(assert (not d!54901))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54913 () Bool)

(assert (=> d!54913 (= (invariant!0 (currentBit!7462 thiss!1602) (currentByte!7467 thiss!1602) (size!3558 (buf!4016 thiss!1602))) (and (bvsge (currentBit!7462 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7462 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7467 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7467 thiss!1602) (size!3558 (buf!4016 thiss!1602))) (and (= (currentBit!7462 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7467 thiss!1602) (size!3558 (buf!4016 thiss!1602)))))))))

(assert (=> d!54903 d!54913))

(declare-fun d!54915 () Bool)

(assert (=> d!54915 (= (remainingBits!0 ((_ sign_extend 32) (size!3558 (buf!4016 thiss!1602))) ((_ sign_extend 32) (currentByte!7467 thiss!1602)) ((_ sign_extend 32) (currentBit!7462 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3558 (buf!4016 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7467 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7462 thiss!1602)))))))

(assert (=> d!54901 d!54915))

(push 1)

(check-sat)

