; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33428 () Bool)

(assert start!33428)

(declare-fun res!134158 () Bool)

(declare-fun e!110637 () Bool)

(assert (=> start!33428 (=> (not res!134158) (not e!110637))))

(declare-datatypes ((array!7908 0))(
  ( (array!7909 (arr!4476 (Array (_ BitVec 32) (_ BitVec 8))) (size!3555 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6278 0))(
  ( (BitStream!6279 (buf!4013 array!7908) (currentByte!7455 (_ BitVec 32)) (currentBit!7450 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6278)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33428 (= res!134158 (validate_offset_byte!0 ((_ sign_extend 32) (size!3555 (buf!4013 thiss!1602))) ((_ sign_extend 32) (currentByte!7455 thiss!1602)) ((_ sign_extend 32) (currentBit!7450 thiss!1602))))))

(assert (=> start!33428 e!110637))

(declare-fun e!110640 () Bool)

(declare-fun inv!12 (BitStream!6278) Bool)

(assert (=> start!33428 (and (inv!12 thiss!1602) e!110640)))

(assert (=> start!33428 true))

(declare-fun b!160957 () Bool)

(declare-datatypes ((Unit!10990 0))(
  ( (Unit!10991) )
))
(declare-datatypes ((tuple3!838 0))(
  ( (tuple3!839 (_1!7770 Unit!10990) (_2!7770 (_ BitVec 8)) (_3!536 BitStream!6278)) )
))
(declare-fun lt!253401 () tuple3!838)

(assert (=> b!160957 (= e!110637 (not (and (bvsge (bvsub (currentByte!7455 (_3!536 lt!253401)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7455 (_3!536 lt!253401)) #b00000000000000000000000000000001) (size!3555 (buf!4013 (_3!536 lt!253401)))))))))

(declare-fun lt!253406 () array!7908)

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!253400 () (_ BitVec 8))

(declare-fun lt!253407 () (_ BitVec 8))

(declare-fun lt!253403 () (_ BitVec 8))

(declare-fun lt!253402 () (_ BitVec 32))

(declare-fun lt!253404 () (_ BitVec 32))

(declare-fun lt!253405 () (_ BitVec 32))

(declare-fun Unit!10992 () Unit!10990)

(declare-fun Unit!10993 () Unit!10990)

(assert (=> b!160957 (= lt!253401 (ite (bvsgt lt!253405 #b00000000000000000000000000000000) (let ((bdg!9553 ((_ extract 7 0) (bvnot lt!253404)))) (let ((bdg!9554 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4476 (buf!4013 thiss!1602)) (currentByte!7455 thiss!1602) lt!253407) (currentByte!7455 thiss!1602) lt!253403) (bvadd #b00000000000000000000000000000001 (currentByte!7455 thiss!1602)))) ((_ sign_extend 24) bdg!9553))))) (tuple3!839 Unit!10992 bdg!9553 (BitStream!6279 (array!7909 (store (arr!4476 (array!7909 (store (arr!4476 lt!253406) (bvadd #b00000000000000000000000000000001 (currentByte!7455 thiss!1602)) bdg!9554) (size!3555 lt!253406))) (bvadd #b00000000000000000000000000000001 (currentByte!7455 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9554) (bvshl ((_ sign_extend 24) v!222) lt!253402)))) (size!3555 (array!7909 (store (arr!4476 lt!253406) (bvadd #b00000000000000000000000000000001 (currentByte!7455 thiss!1602)) bdg!9554) (size!3555 lt!253406)))) (bvadd #b00000000000000000000000000000001 (currentByte!7455 thiss!1602)) (currentBit!7450 thiss!1602))))) (tuple3!839 Unit!10993 lt!253400 (BitStream!6279 lt!253406 (bvadd #b00000000000000000000000000000001 (currentByte!7455 thiss!1602)) (currentBit!7450 thiss!1602)))))))

(declare-fun e!110639 () Bool)

(assert (=> b!160957 e!110639))

(declare-fun res!134159 () Bool)

(assert (=> b!160957 (=> res!134159 e!110639)))

(assert (=> b!160957 (= res!134159 (bvsge (currentByte!7455 thiss!1602) (size!3555 (buf!4013 thiss!1602))))))

(assert (=> b!160957 (= lt!253406 (array!7909 (store (store (arr!4476 (buf!4013 thiss!1602)) (currentByte!7455 thiss!1602) lt!253407) (currentByte!7455 thiss!1602) lt!253403) (size!3555 (buf!4013 thiss!1602))))))

(assert (=> b!160957 (= lt!253403 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253407) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253405))))))

(assert (=> b!160957 (= lt!253407 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4476 (buf!4013 thiss!1602)) (currentByte!7455 thiss!1602))) lt!253404)))))

(assert (=> b!160957 (= lt!253404 ((_ sign_extend 24) lt!253400))))

(assert (=> b!160957 (= lt!253400 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!253402)))))))

(assert (=> b!160957 (= lt!253402 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253405))))))

(assert (=> b!160957 (= lt!253405 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7450 thiss!1602))))))

(declare-fun b!160958 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160958 (= e!110639 (byteRangesEq!0 (select (arr!4476 (buf!4013 thiss!1602)) (currentByte!7455 thiss!1602)) lt!253403 #b00000000000000000000000000000000 (currentBit!7450 thiss!1602)))))

(declare-fun b!160959 () Bool)

(declare-fun array_inv!3302 (array!7908) Bool)

(assert (=> b!160959 (= e!110640 (array_inv!3302 (buf!4013 thiss!1602)))))

(assert (= (and start!33428 res!134158) b!160957))

(assert (= (and b!160957 (not res!134159)) b!160958))

(assert (= start!33428 b!160959))

(declare-fun m!254457 () Bool)

(assert (=> start!33428 m!254457))

(declare-fun m!254459 () Bool)

(assert (=> start!33428 m!254459))

(declare-fun m!254461 () Bool)

(assert (=> b!160957 m!254461))

(declare-fun m!254463 () Bool)

(assert (=> b!160957 m!254463))

(declare-fun m!254465 () Bool)

(assert (=> b!160957 m!254465))

(declare-fun m!254467 () Bool)

(assert (=> b!160957 m!254467))

(declare-fun m!254469 () Bool)

(assert (=> b!160957 m!254469))

(declare-fun m!254471 () Bool)

(assert (=> b!160957 m!254471))

(declare-fun m!254473 () Bool)

(assert (=> b!160957 m!254473))

(assert (=> b!160958 m!254461))

(assert (=> b!160958 m!254461))

(declare-fun m!254475 () Bool)

(assert (=> b!160958 m!254475))

(declare-fun m!254477 () Bool)

(assert (=> b!160959 m!254477))

(push 1)

(assert (not b!160959))

(assert (not b!160958))

(assert (not start!33428))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54857 () Bool)

(assert (=> d!54857 (= (array_inv!3302 (buf!4013 thiss!1602)) (bvsge (size!3555 (buf!4013 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160959 d!54857))

(declare-fun d!54861 () Bool)

(assert (=> d!54861 (= (byteRangesEq!0 (select (arr!4476 (buf!4013 thiss!1602)) (currentByte!7455 thiss!1602)) lt!253403 #b00000000000000000000000000000000 (currentBit!7450 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7450 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4476 (buf!4013 thiss!1602)) (currentByte!7455 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7450 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!253403) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7450 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13654 () Bool)

(assert (= bs!13654 d!54861))

(declare-fun m!254495 () Bool)

(assert (=> bs!13654 m!254495))

(declare-fun m!254497 () Bool)

(assert (=> bs!13654 m!254497))

(assert (=> b!160958 d!54861))

(declare-fun d!54863 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54863 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3555 (buf!4013 thiss!1602))) ((_ sign_extend 32) (currentByte!7455 thiss!1602)) ((_ sign_extend 32) (currentBit!7450 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3555 (buf!4013 thiss!1602))) ((_ sign_extend 32) (currentByte!7455 thiss!1602)) ((_ sign_extend 32) (currentBit!7450 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13655 () Bool)

(assert (= bs!13655 d!54863))

(declare-fun m!254499 () Bool)

(assert (=> bs!13655 m!254499))

(assert (=> start!33428 d!54863))

(declare-fun d!54865 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54865 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7450 thiss!1602) (currentByte!7455 thiss!1602) (size!3555 (buf!4013 thiss!1602))))))

(declare-fun bs!13656 () Bool)

(assert (= bs!13656 d!54865))

(declare-fun m!254501 () Bool)

(assert (=> bs!13656 m!254501))

(assert (=> start!33428 d!54865))

(push 1)

(assert (not d!54865))

(assert (not d!54863))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54875 () Bool)

(assert (=> d!54875 (= (invariant!0 (currentBit!7450 thiss!1602) (currentByte!7455 thiss!1602) (size!3555 (buf!4013 thiss!1602))) (and (bvsge (currentBit!7450 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7450 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7455 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7455 thiss!1602) (size!3555 (buf!4013 thiss!1602))) (and (= (currentBit!7450 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7455 thiss!1602) (size!3555 (buf!4013 thiss!1602)))))))))

(assert (=> d!54865 d!54875))

(declare-fun d!54877 () Bool)

(assert (=> d!54877 (= (remainingBits!0 ((_ sign_extend 32) (size!3555 (buf!4013 thiss!1602))) ((_ sign_extend 32) (currentByte!7455 thiss!1602)) ((_ sign_extend 32) (currentBit!7450 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3555 (buf!4013 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7455 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7450 thiss!1602)))))))

(assert (=> d!54863 d!54877))

(push 1)

(check-sat)

