; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33394 () Bool)

(assert start!33394)

(declare-fun res!134141 () Bool)

(declare-fun e!110602 () Bool)

(assert (=> start!33394 (=> (not res!134141) (not e!110602))))

(declare-datatypes ((array!7899 0))(
  ( (array!7900 (arr!4473 (Array (_ BitVec 32) (_ BitVec 8))) (size!3552 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6272 0))(
  ( (BitStream!6273 (buf!4010 array!7899) (currentByte!7447 (_ BitVec 32)) (currentBit!7442 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6272)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33394 (= res!134141 (validate_offset_byte!0 ((_ sign_extend 32) (size!3552 (buf!4010 thiss!1602))) ((_ sign_extend 32) (currentByte!7447 thiss!1602)) ((_ sign_extend 32) (currentBit!7442 thiss!1602))))))

(assert (=> start!33394 e!110602))

(declare-fun e!110604 () Bool)

(declare-fun inv!12 (BitStream!6272) Bool)

(assert (=> start!33394 (and (inv!12 thiss!1602) e!110604)))

(assert (=> start!33394 true))

(declare-fun b!160930 () Bool)

(declare-datatypes ((Unit!10978 0))(
  ( (Unit!10979) )
))
(declare-datatypes ((tuple3!832 0))(
  ( (tuple3!833 (_1!7767 Unit!10978) (_2!7767 (_ BitVec 8)) (_3!533 BitStream!6272)) )
))
(declare-fun lt!253333 () tuple3!832)

(assert (=> b!160930 (= e!110602 (not (or (= (bvand (currentByte!7447 (_3!533 lt!253333)) #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand (currentByte!7447 (_3!533 lt!253333)) #b10000000000000000000000000000000) (bvand (bvsub (currentByte!7447 (_3!533 lt!253333)) #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!253335 () (_ BitVec 8))

(declare-fun lt!253328 () (_ BitVec 8))

(declare-fun lt!253329 () array!7899)

(declare-fun lt!253334 () (_ BitVec 8))

(declare-fun lt!253332 () (_ BitVec 32))

(declare-fun lt!253330 () (_ BitVec 32))

(declare-fun lt!253331 () (_ BitVec 32))

(declare-fun Unit!10980 () Unit!10978)

(declare-fun Unit!10981 () Unit!10978)

(assert (=> b!160930 (= lt!253333 (ite (bvsgt lt!253332 #b00000000000000000000000000000000) (let ((bdg!9543 ((_ extract 7 0) (bvnot lt!253330)))) (let ((bdg!9544 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4473 (buf!4010 thiss!1602)) (currentByte!7447 thiss!1602) lt!253328) (currentByte!7447 thiss!1602) lt!253334) (bvadd #b00000000000000000000000000000001 (currentByte!7447 thiss!1602)))) ((_ sign_extend 24) bdg!9543))))) (tuple3!833 Unit!10980 bdg!9543 (BitStream!6273 (array!7900 (store (arr!4473 (array!7900 (store (arr!4473 lt!253329) (bvadd #b00000000000000000000000000000001 (currentByte!7447 thiss!1602)) bdg!9544) (size!3552 lt!253329))) (bvadd #b00000000000000000000000000000001 (currentByte!7447 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9544) (bvshl ((_ sign_extend 24) v!222) lt!253331)))) (size!3552 (array!7900 (store (arr!4473 lt!253329) (bvadd #b00000000000000000000000000000001 (currentByte!7447 thiss!1602)) bdg!9544) (size!3552 lt!253329)))) (bvadd #b00000000000000000000000000000001 (currentByte!7447 thiss!1602)) (currentBit!7442 thiss!1602))))) (tuple3!833 Unit!10981 lt!253335 (BitStream!6273 lt!253329 (bvadd #b00000000000000000000000000000001 (currentByte!7447 thiss!1602)) (currentBit!7442 thiss!1602)))))))

(declare-fun e!110601 () Bool)

(assert (=> b!160930 e!110601))

(declare-fun res!134140 () Bool)

(assert (=> b!160930 (=> res!134140 e!110601)))

(assert (=> b!160930 (= res!134140 (bvsge (currentByte!7447 thiss!1602) (size!3552 (buf!4010 thiss!1602))))))

(assert (=> b!160930 (= lt!253329 (array!7900 (store (store (arr!4473 (buf!4010 thiss!1602)) (currentByte!7447 thiss!1602) lt!253328) (currentByte!7447 thiss!1602) lt!253334) (size!3552 (buf!4010 thiss!1602))))))

(assert (=> b!160930 (= lt!253334 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253328) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253332))))))

(assert (=> b!160930 (= lt!253328 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4473 (buf!4010 thiss!1602)) (currentByte!7447 thiss!1602))) lt!253330)))))

(assert (=> b!160930 (= lt!253330 ((_ sign_extend 24) lt!253335))))

(assert (=> b!160930 (= lt!253335 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!253331)))))))

(assert (=> b!160930 (= lt!253331 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253332))))))

(assert (=> b!160930 (= lt!253332 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7442 thiss!1602))))))

(declare-fun b!160931 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160931 (= e!110601 (byteRangesEq!0 (select (arr!4473 (buf!4010 thiss!1602)) (currentByte!7447 thiss!1602)) lt!253334 #b00000000000000000000000000000000 (currentBit!7442 thiss!1602)))))

(declare-fun b!160932 () Bool)

(declare-fun array_inv!3299 (array!7899) Bool)

(assert (=> b!160932 (= e!110604 (array_inv!3299 (buf!4010 thiss!1602)))))

(assert (= (and start!33394 res!134141) b!160930))

(assert (= (and b!160930 (not res!134140)) b!160931))

(assert (= start!33394 b!160932))

(declare-fun m!254367 () Bool)

(assert (=> start!33394 m!254367))

(declare-fun m!254369 () Bool)

(assert (=> start!33394 m!254369))

(declare-fun m!254371 () Bool)

(assert (=> b!160930 m!254371))

(declare-fun m!254373 () Bool)

(assert (=> b!160930 m!254373))

(declare-fun m!254375 () Bool)

(assert (=> b!160930 m!254375))

(declare-fun m!254377 () Bool)

(assert (=> b!160930 m!254377))

(declare-fun m!254379 () Bool)

(assert (=> b!160930 m!254379))

(declare-fun m!254381 () Bool)

(assert (=> b!160930 m!254381))

(declare-fun m!254383 () Bool)

(assert (=> b!160930 m!254383))

(assert (=> b!160931 m!254381))

(assert (=> b!160931 m!254381))

(declare-fun m!254385 () Bool)

(assert (=> b!160931 m!254385))

(declare-fun m!254387 () Bool)

(assert (=> b!160932 m!254387))

(push 1)

(assert (not b!160931))

(assert (not start!33394))

(assert (not b!160932))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54829 () Bool)

(assert (=> d!54829 (= (byteRangesEq!0 (select (arr!4473 (buf!4010 thiss!1602)) (currentByte!7447 thiss!1602)) lt!253334 #b00000000000000000000000000000000 (currentBit!7442 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7442 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4473 (buf!4010 thiss!1602)) (currentByte!7447 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7442 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!253334) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7442 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13642 () Bool)

(assert (= bs!13642 d!54829))

(declare-fun m!254405 () Bool)

(assert (=> bs!13642 m!254405))

(declare-fun m!254407 () Bool)

(assert (=> bs!13642 m!254407))

(assert (=> b!160931 d!54829))

(declare-fun d!54831 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54831 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3552 (buf!4010 thiss!1602))) ((_ sign_extend 32) (currentByte!7447 thiss!1602)) ((_ sign_extend 32) (currentBit!7442 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3552 (buf!4010 thiss!1602))) ((_ sign_extend 32) (currentByte!7447 thiss!1602)) ((_ sign_extend 32) (currentBit!7442 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13643 () Bool)

(assert (= bs!13643 d!54831))

(declare-fun m!254409 () Bool)

(assert (=> bs!13643 m!254409))

(assert (=> start!33394 d!54831))

(declare-fun d!54833 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54833 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7442 thiss!1602) (currentByte!7447 thiss!1602) (size!3552 (buf!4010 thiss!1602))))))

(declare-fun bs!13644 () Bool)

(assert (= bs!13644 d!54833))

(declare-fun m!254411 () Bool)

(assert (=> bs!13644 m!254411))

(assert (=> start!33394 d!54833))

(declare-fun d!54835 () Bool)

(assert (=> d!54835 (= (array_inv!3299 (buf!4010 thiss!1602)) (bvsge (size!3552 (buf!4010 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160932 d!54835))

(push 1)

(assert (not d!54831))

(assert (not d!54833))

(check-sat)

(pop 1)

(push 1)

(check-sat)

