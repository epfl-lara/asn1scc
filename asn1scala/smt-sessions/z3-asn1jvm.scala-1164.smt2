; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32916 () Bool)

(assert start!32916)

(declare-fun res!133877 () Bool)

(declare-fun e!110064 () Bool)

(assert (=> start!32916 (=> (not res!133877) (not e!110064))))

(declare-datatypes ((array!7771 0))(
  ( (array!7772 (arr!4427 (Array (_ BitVec 32) (_ BitVec 8))) (size!3506 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6180 0))(
  ( (BitStream!6181 (buf!3964 array!7771) (currentByte!7304 (_ BitVec 32)) (currentBit!7299 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6180)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32916 (= res!133877 (validate_offset_byte!0 ((_ sign_extend 32) (size!3506 (buf!3964 thiss!1602))) ((_ sign_extend 32) (currentByte!7304 thiss!1602)) ((_ sign_extend 32) (currentBit!7299 thiss!1602))))))

(assert (=> start!32916 e!110064))

(declare-fun e!110063 () Bool)

(declare-fun inv!12 (BitStream!6180) Bool)

(assert (=> start!32916 (and (inv!12 thiss!1602) e!110063)))

(assert (=> start!32916 true))

(declare-fun lt!252995 () (_ BitVec 8))

(declare-fun b!160529 () Bool)

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!252996 () (_ BitVec 32))

(assert (=> b!160529 (= e!110064 (not (inv!12 (BitStream!6181 (array!7772 (store (store (arr!4427 (buf!3964 thiss!1602)) (currentByte!7304 thiss!1602) lt!252995) (currentByte!7304 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252995) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252996)))) (size!3506 (buf!3964 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7304 thiss!1602)) (currentBit!7299 thiss!1602)))))))

(assert (=> b!160529 (= lt!252995 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4427 (buf!3964 thiss!1602)) (currentByte!7304 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!252996)))))))))))))

(assert (=> b!160529 (= lt!252996 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7299 thiss!1602))))))

(declare-fun b!160530 () Bool)

(declare-fun array_inv!3253 (array!7771) Bool)

(assert (=> b!160530 (= e!110063 (array_inv!3253 (buf!3964 thiss!1602)))))

(assert (= (and start!32916 res!133877) b!160529))

(assert (= start!32916 b!160530))

(declare-fun m!253487 () Bool)

(assert (=> start!32916 m!253487))

(declare-fun m!253489 () Bool)

(assert (=> start!32916 m!253489))

(declare-fun m!253491 () Bool)

(assert (=> b!160529 m!253491))

(declare-fun m!253493 () Bool)

(assert (=> b!160529 m!253493))

(declare-fun m!253495 () Bool)

(assert (=> b!160529 m!253495))

(declare-fun m!253497 () Bool)

(assert (=> b!160529 m!253497))

(declare-fun m!253499 () Bool)

(assert (=> b!160529 m!253499))

(declare-fun m!253501 () Bool)

(assert (=> b!160530 m!253501))

(check-sat (not start!32916) (not b!160529) (not b!160530))
(check-sat)
(get-model)

(declare-fun d!54365 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54365 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3506 (buf!3964 thiss!1602))) ((_ sign_extend 32) (currentByte!7304 thiss!1602)) ((_ sign_extend 32) (currentBit!7299 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3506 (buf!3964 thiss!1602))) ((_ sign_extend 32) (currentByte!7304 thiss!1602)) ((_ sign_extend 32) (currentBit!7299 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13487 () Bool)

(assert (= bs!13487 d!54365))

(declare-fun m!253521 () Bool)

(assert (=> bs!13487 m!253521))

(assert (=> start!32916 d!54365))

(declare-fun d!54369 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54369 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7299 thiss!1602) (currentByte!7304 thiss!1602) (size!3506 (buf!3964 thiss!1602))))))

(declare-fun bs!13488 () Bool)

(assert (= bs!13488 d!54369))

(declare-fun m!253523 () Bool)

(assert (=> bs!13488 m!253523))

(assert (=> start!32916 d!54369))

(declare-fun d!54371 () Bool)

(assert (=> d!54371 (= (inv!12 (BitStream!6181 (array!7772 (store (store (arr!4427 (buf!3964 thiss!1602)) (currentByte!7304 thiss!1602) lt!252995) (currentByte!7304 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252995) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252996)))) (size!3506 (buf!3964 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7304 thiss!1602)) (currentBit!7299 thiss!1602))) (invariant!0 (currentBit!7299 (BitStream!6181 (array!7772 (store (store (arr!4427 (buf!3964 thiss!1602)) (currentByte!7304 thiss!1602) lt!252995) (currentByte!7304 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252995) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252996)))) (size!3506 (buf!3964 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7304 thiss!1602)) (currentBit!7299 thiss!1602))) (currentByte!7304 (BitStream!6181 (array!7772 (store (store (arr!4427 (buf!3964 thiss!1602)) (currentByte!7304 thiss!1602) lt!252995) (currentByte!7304 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252995) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252996)))) (size!3506 (buf!3964 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7304 thiss!1602)) (currentBit!7299 thiss!1602))) (size!3506 (buf!3964 (BitStream!6181 (array!7772 (store (store (arr!4427 (buf!3964 thiss!1602)) (currentByte!7304 thiss!1602) lt!252995) (currentByte!7304 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252995) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252996)))) (size!3506 (buf!3964 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7304 thiss!1602)) (currentBit!7299 thiss!1602))))))))

(declare-fun bs!13489 () Bool)

(assert (= bs!13489 d!54371))

(declare-fun m!253525 () Bool)

(assert (=> bs!13489 m!253525))

(assert (=> b!160529 d!54371))

(declare-fun d!54373 () Bool)

(assert (=> d!54373 (= (array_inv!3253 (buf!3964 thiss!1602)) (bvsge (size!3506 (buf!3964 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160530 d!54373))

(check-sat (not d!54365) (not d!54369) (not d!54371))
(check-sat)
(get-model)

(declare-fun d!54387 () Bool)

(assert (=> d!54387 (= (remainingBits!0 ((_ sign_extend 32) (size!3506 (buf!3964 thiss!1602))) ((_ sign_extend 32) (currentByte!7304 thiss!1602)) ((_ sign_extend 32) (currentBit!7299 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3506 (buf!3964 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7304 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7299 thiss!1602)))))))

(assert (=> d!54365 d!54387))

(declare-fun d!54391 () Bool)

(assert (=> d!54391 (= (invariant!0 (currentBit!7299 thiss!1602) (currentByte!7304 thiss!1602) (size!3506 (buf!3964 thiss!1602))) (and (bvsge (currentBit!7299 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7299 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7304 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7304 thiss!1602) (size!3506 (buf!3964 thiss!1602))) (and (= (currentBit!7299 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7304 thiss!1602) (size!3506 (buf!3964 thiss!1602)))))))))

(assert (=> d!54369 d!54391))

(declare-fun d!54395 () Bool)

(assert (=> d!54395 (= (invariant!0 (currentBit!7299 (BitStream!6181 (array!7772 (store (store (arr!4427 (buf!3964 thiss!1602)) (currentByte!7304 thiss!1602) lt!252995) (currentByte!7304 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252995) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252996)))) (size!3506 (buf!3964 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7304 thiss!1602)) (currentBit!7299 thiss!1602))) (currentByte!7304 (BitStream!6181 (array!7772 (store (store (arr!4427 (buf!3964 thiss!1602)) (currentByte!7304 thiss!1602) lt!252995) (currentByte!7304 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252995) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252996)))) (size!3506 (buf!3964 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7304 thiss!1602)) (currentBit!7299 thiss!1602))) (size!3506 (buf!3964 (BitStream!6181 (array!7772 (store (store (arr!4427 (buf!3964 thiss!1602)) (currentByte!7304 thiss!1602) lt!252995) (currentByte!7304 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252995) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252996)))) (size!3506 (buf!3964 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7304 thiss!1602)) (currentBit!7299 thiss!1602))))) (and (bvsge (currentBit!7299 (BitStream!6181 (array!7772 (store (store (arr!4427 (buf!3964 thiss!1602)) (currentByte!7304 thiss!1602) lt!252995) (currentByte!7304 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252995) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252996)))) (size!3506 (buf!3964 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7304 thiss!1602)) (currentBit!7299 thiss!1602))) #b00000000000000000000000000000000) (bvslt (currentBit!7299 (BitStream!6181 (array!7772 (store (store (arr!4427 (buf!3964 thiss!1602)) (currentByte!7304 thiss!1602) lt!252995) (currentByte!7304 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252995) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252996)))) (size!3506 (buf!3964 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7304 thiss!1602)) (currentBit!7299 thiss!1602))) #b00000000000000000000000000001000) (bvsge (currentByte!7304 (BitStream!6181 (array!7772 (store (store (arr!4427 (buf!3964 thiss!1602)) (currentByte!7304 thiss!1602) lt!252995) (currentByte!7304 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252995) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252996)))) (size!3506 (buf!3964 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7304 thiss!1602)) (currentBit!7299 thiss!1602))) #b00000000000000000000000000000000) (or (bvslt (currentByte!7304 (BitStream!6181 (array!7772 (store (store (arr!4427 (buf!3964 thiss!1602)) (currentByte!7304 thiss!1602) lt!252995) (currentByte!7304 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252995) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252996)))) (size!3506 (buf!3964 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7304 thiss!1602)) (currentBit!7299 thiss!1602))) (size!3506 (buf!3964 (BitStream!6181 (array!7772 (store (store (arr!4427 (buf!3964 thiss!1602)) (currentByte!7304 thiss!1602) lt!252995) (currentByte!7304 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252995) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252996)))) (size!3506 (buf!3964 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7304 thiss!1602)) (currentBit!7299 thiss!1602))))) (and (= (currentBit!7299 (BitStream!6181 (array!7772 (store (store (arr!4427 (buf!3964 thiss!1602)) (currentByte!7304 thiss!1602) lt!252995) (currentByte!7304 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252995) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252996)))) (size!3506 (buf!3964 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7304 thiss!1602)) (currentBit!7299 thiss!1602))) #b00000000000000000000000000000000) (= (currentByte!7304 (BitStream!6181 (array!7772 (store (store (arr!4427 (buf!3964 thiss!1602)) (currentByte!7304 thiss!1602) lt!252995) (currentByte!7304 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252995) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252996)))) (size!3506 (buf!3964 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7304 thiss!1602)) (currentBit!7299 thiss!1602))) (size!3506 (buf!3964 (BitStream!6181 (array!7772 (store (store (arr!4427 (buf!3964 thiss!1602)) (currentByte!7304 thiss!1602) lt!252995) (currentByte!7304 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252995) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252996)))) (size!3506 (buf!3964 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7304 thiss!1602)) (currentBit!7299 thiss!1602)))))))))))

(assert (=> d!54371 d!54395))

(check-sat)
