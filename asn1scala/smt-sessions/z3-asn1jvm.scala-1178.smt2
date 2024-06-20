; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33352 () Bool)

(assert start!33352)

(declare-fun res!134116 () Bool)

(declare-fun e!110554 () Bool)

(assert (=> start!33352 (=> (not res!134116) (not e!110554))))

(declare-datatypes ((array!7888 0))(
  ( (array!7889 (arr!4469 (Array (_ BitVec 32) (_ BitVec 8))) (size!3548 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6264 0))(
  ( (BitStream!6265 (buf!4006 array!7888) (currentByte!7435 (_ BitVec 32)) (currentBit!7430 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6264)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33352 (= res!134116 (validate_offset_byte!0 ((_ sign_extend 32) (size!3548 (buf!4006 thiss!1602))) ((_ sign_extend 32) (currentByte!7435 thiss!1602)) ((_ sign_extend 32) (currentBit!7430 thiss!1602))))))

(assert (=> start!33352 e!110554))

(declare-fun e!110553 () Bool)

(declare-fun inv!12 (BitStream!6264) Bool)

(assert (=> start!33352 (and (inv!12 thiss!1602) e!110553)))

(assert (=> start!33352 true))

(declare-fun b!160894 () Bool)

(declare-datatypes ((Unit!10962 0))(
  ( (Unit!10963) )
))
(declare-datatypes ((tuple3!824 0))(
  ( (tuple3!825 (_1!7763 Unit!10962) (_2!7763 (_ BitVec 8)) (_3!529 BitStream!6264)) )
))
(declare-fun lt!253239 () tuple3!824)

(assert (=> b!160894 (= e!110554 (not (or (= (bvand (currentByte!7435 (_3!529 lt!253239)) #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand (currentByte!7435 (_3!529 lt!253239)) #b10000000000000000000000000000000) (bvand (bvsub (currentByte!7435 (_3!529 lt!253239)) #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(declare-fun lt!253236 () (_ BitVec 32))

(declare-fun lt!253232 () (_ BitVec 32))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!253237 () array!7888)

(declare-fun lt!253238 () (_ BitVec 32))

(declare-fun lt!253235 () (_ BitVec 8))

(declare-fun lt!253234 () (_ BitVec 8))

(declare-fun lt!253233 () (_ BitVec 8))

(declare-fun Unit!10964 () Unit!10962)

(declare-fun Unit!10965 () Unit!10962)

(assert (=> b!160894 (= lt!253239 (ite (bvsgt lt!253236 #b00000000000000000000000000000000) (let ((bdg!9533 ((_ extract 7 0) (bvnot lt!253238)))) (let ((bdg!9534 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4469 (buf!4006 thiss!1602)) (currentByte!7435 thiss!1602) lt!253234) (currentByte!7435 thiss!1602) lt!253233) (bvadd #b00000000000000000000000000000001 (currentByte!7435 thiss!1602)))) ((_ sign_extend 24) bdg!9533))))) (tuple3!825 Unit!10964 bdg!9533 (BitStream!6265 (array!7889 (store (arr!4469 (array!7889 (store (arr!4469 lt!253237) (bvadd #b00000000000000000000000000000001 (currentByte!7435 thiss!1602)) bdg!9534) (size!3548 lt!253237))) (bvadd #b00000000000000000000000000000001 (currentByte!7435 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9534) (bvshl ((_ sign_extend 24) v!222) lt!253232)))) (size!3548 (array!7889 (store (arr!4469 lt!253237) (bvadd #b00000000000000000000000000000001 (currentByte!7435 thiss!1602)) bdg!9534) (size!3548 lt!253237)))) (bvadd #b00000000000000000000000000000001 (currentByte!7435 thiss!1602)) (currentBit!7430 thiss!1602))))) (tuple3!825 Unit!10965 lt!253235 (BitStream!6265 lt!253237 (bvadd #b00000000000000000000000000000001 (currentByte!7435 thiss!1602)) (currentBit!7430 thiss!1602)))))))

(declare-fun e!110556 () Bool)

(assert (=> b!160894 e!110556))

(declare-fun res!134117 () Bool)

(assert (=> b!160894 (=> res!134117 e!110556)))

(assert (=> b!160894 (= res!134117 (bvsge (currentByte!7435 thiss!1602) (size!3548 (buf!4006 thiss!1602))))))

(assert (=> b!160894 (= lt!253237 (array!7889 (store (store (arr!4469 (buf!4006 thiss!1602)) (currentByte!7435 thiss!1602) lt!253234) (currentByte!7435 thiss!1602) lt!253233) (size!3548 (buf!4006 thiss!1602))))))

(assert (=> b!160894 (= lt!253233 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253234) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253236))))))

(assert (=> b!160894 (= lt!253234 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4469 (buf!4006 thiss!1602)) (currentByte!7435 thiss!1602))) lt!253238)))))

(assert (=> b!160894 (= lt!253238 ((_ sign_extend 24) lt!253235))))

(assert (=> b!160894 (= lt!253235 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!253232)))))))

(assert (=> b!160894 (= lt!253232 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253236))))))

(assert (=> b!160894 (= lt!253236 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7430 thiss!1602))))))

(declare-fun b!160895 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160895 (= e!110556 (byteRangesEq!0 (select (arr!4469 (buf!4006 thiss!1602)) (currentByte!7435 thiss!1602)) lt!253233 #b00000000000000000000000000000000 (currentBit!7430 thiss!1602)))))

(declare-fun b!160896 () Bool)

(declare-fun array_inv!3295 (array!7888) Bool)

(assert (=> b!160896 (= e!110553 (array_inv!3295 (buf!4006 thiss!1602)))))

(assert (= (and start!33352 res!134116) b!160894))

(assert (= (and b!160894 (not res!134117)) b!160895))

(assert (= start!33352 b!160896))

(declare-fun m!254255 () Bool)

(assert (=> start!33352 m!254255))

(declare-fun m!254257 () Bool)

(assert (=> start!33352 m!254257))

(declare-fun m!254259 () Bool)

(assert (=> b!160894 m!254259))

(declare-fun m!254261 () Bool)

(assert (=> b!160894 m!254261))

(declare-fun m!254263 () Bool)

(assert (=> b!160894 m!254263))

(declare-fun m!254265 () Bool)

(assert (=> b!160894 m!254265))

(declare-fun m!254267 () Bool)

(assert (=> b!160894 m!254267))

(declare-fun m!254269 () Bool)

(assert (=> b!160894 m!254269))

(declare-fun m!254271 () Bool)

(assert (=> b!160894 m!254271))

(assert (=> b!160895 m!254269))

(assert (=> b!160895 m!254269))

(declare-fun m!254273 () Bool)

(assert (=> b!160895 m!254273))

(declare-fun m!254275 () Bool)

(assert (=> b!160896 m!254275))

(check-sat (not b!160896) (not b!160895) (not start!33352))
(check-sat)
(get-model)

(declare-fun d!54785 () Bool)

(assert (=> d!54785 (= (array_inv!3295 (buf!4006 thiss!1602)) (bvsge (size!3548 (buf!4006 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160896 d!54785))

(declare-fun d!54787 () Bool)

(assert (=> d!54787 (= (byteRangesEq!0 (select (arr!4469 (buf!4006 thiss!1602)) (currentByte!7435 thiss!1602)) lt!253233 #b00000000000000000000000000000000 (currentBit!7430 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7430 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4469 (buf!4006 thiss!1602)) (currentByte!7435 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7430 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!253233) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7430 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13629 () Bool)

(assert (= bs!13629 d!54787))

(declare-fun m!254311 () Bool)

(assert (=> bs!13629 m!254311))

(declare-fun m!254313 () Bool)

(assert (=> bs!13629 m!254313))

(assert (=> b!160895 d!54787))

(declare-fun d!54797 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54797 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3548 (buf!4006 thiss!1602))) ((_ sign_extend 32) (currentByte!7435 thiss!1602)) ((_ sign_extend 32) (currentBit!7430 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3548 (buf!4006 thiss!1602))) ((_ sign_extend 32) (currentByte!7435 thiss!1602)) ((_ sign_extend 32) (currentBit!7430 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13631 () Bool)

(assert (= bs!13631 d!54797))

(declare-fun m!254319 () Bool)

(assert (=> bs!13631 m!254319))

(assert (=> start!33352 d!54797))

(declare-fun d!54799 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54799 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7430 thiss!1602) (currentByte!7435 thiss!1602) (size!3548 (buf!4006 thiss!1602))))))

(declare-fun bs!13632 () Bool)

(assert (= bs!13632 d!54799))

(declare-fun m!254321 () Bool)

(assert (=> bs!13632 m!254321))

(assert (=> start!33352 d!54799))

(check-sat (not d!54797) (not d!54799))
(check-sat)
(get-model)

(declare-fun d!54801 () Bool)

(assert (=> d!54801 (= (remainingBits!0 ((_ sign_extend 32) (size!3548 (buf!4006 thiss!1602))) ((_ sign_extend 32) (currentByte!7435 thiss!1602)) ((_ sign_extend 32) (currentBit!7430 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3548 (buf!4006 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7435 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7430 thiss!1602)))))))

(assert (=> d!54797 d!54801))

(declare-fun d!54805 () Bool)

(assert (=> d!54805 (= (invariant!0 (currentBit!7430 thiss!1602) (currentByte!7435 thiss!1602) (size!3548 (buf!4006 thiss!1602))) (and (bvsge (currentBit!7430 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7430 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7435 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7435 thiss!1602) (size!3548 (buf!4006 thiss!1602))) (and (= (currentBit!7430 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7435 thiss!1602) (size!3548 (buf!4006 thiss!1602)))))))))

(assert (=> d!54799 d!54805))

(check-sat)
