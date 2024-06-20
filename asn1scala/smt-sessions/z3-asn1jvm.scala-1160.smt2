; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32796 () Bool)

(assert start!32796)

(declare-fun res!133841 () Bool)

(declare-fun e!109956 () Bool)

(assert (=> start!32796 (=> (not res!133841) (not e!109956))))

(declare-datatypes ((array!7737 0))(
  ( (array!7738 (arr!4415 (Array (_ BitVec 32) (_ BitVec 8))) (size!3494 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6156 0))(
  ( (BitStream!6157 (buf!3952 array!7737) (currentByte!7264 (_ BitVec 32)) (currentBit!7259 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6156)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32796 (= res!133841 (validate_offset_byte!0 ((_ sign_extend 32) (size!3494 (buf!3952 thiss!1602))) ((_ sign_extend 32) (currentByte!7264 thiss!1602)) ((_ sign_extend 32) (currentBit!7259 thiss!1602))))))

(assert (=> start!32796 e!109956))

(declare-fun e!109955 () Bool)

(declare-fun inv!12 (BitStream!6156) Bool)

(assert (=> start!32796 (and (inv!12 thiss!1602) e!109955)))

(assert (=> start!32796 true))

(declare-fun lt!252977 () (_ BitVec 32))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!252978 () (_ BitVec 8))

(declare-fun b!160457 () Bool)

(assert (=> b!160457 (= e!109956 (not (inv!12 (BitStream!6157 (array!7738 (store (store (arr!4415 (buf!3952 thiss!1602)) (currentByte!7264 thiss!1602) lt!252978) (currentByte!7264 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252978) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252977)))) (size!3494 (buf!3952 thiss!1602))) (currentByte!7264 thiss!1602) (currentBit!7259 thiss!1602)))))))

(assert (=> b!160457 (= lt!252978 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4415 (buf!3952 thiss!1602)) (currentByte!7264 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!252977)))))))))))))

(assert (=> b!160457 (= lt!252977 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7259 thiss!1602))))))

(declare-fun b!160458 () Bool)

(declare-fun array_inv!3241 (array!7737) Bool)

(assert (=> b!160458 (= e!109955 (array_inv!3241 (buf!3952 thiss!1602)))))

(assert (= (and start!32796 res!133841) b!160457))

(assert (= start!32796 b!160458))

(declare-fun m!253343 () Bool)

(assert (=> start!32796 m!253343))

(declare-fun m!253345 () Bool)

(assert (=> start!32796 m!253345))

(declare-fun m!253347 () Bool)

(assert (=> b!160457 m!253347))

(declare-fun m!253349 () Bool)

(assert (=> b!160457 m!253349))

(declare-fun m!253351 () Bool)

(assert (=> b!160457 m!253351))

(declare-fun m!253353 () Bool)

(assert (=> b!160457 m!253353))

(declare-fun m!253355 () Bool)

(assert (=> b!160457 m!253355))

(declare-fun m!253357 () Bool)

(assert (=> b!160458 m!253357))

(check-sat (not b!160458) (not b!160457) (not start!32796))
(check-sat)
(get-model)

(declare-fun d!54255 () Bool)

(assert (=> d!54255 (= (array_inv!3241 (buf!3952 thiss!1602)) (bvsge (size!3494 (buf!3952 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160458 d!54255))

(declare-fun d!54257 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54257 (= (inv!12 (BitStream!6157 (array!7738 (store (store (arr!4415 (buf!3952 thiss!1602)) (currentByte!7264 thiss!1602) lt!252978) (currentByte!7264 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252978) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252977)))) (size!3494 (buf!3952 thiss!1602))) (currentByte!7264 thiss!1602) (currentBit!7259 thiss!1602))) (invariant!0 (currentBit!7259 (BitStream!6157 (array!7738 (store (store (arr!4415 (buf!3952 thiss!1602)) (currentByte!7264 thiss!1602) lt!252978) (currentByte!7264 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252978) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252977)))) (size!3494 (buf!3952 thiss!1602))) (currentByte!7264 thiss!1602) (currentBit!7259 thiss!1602))) (currentByte!7264 (BitStream!6157 (array!7738 (store (store (arr!4415 (buf!3952 thiss!1602)) (currentByte!7264 thiss!1602) lt!252978) (currentByte!7264 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252978) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252977)))) (size!3494 (buf!3952 thiss!1602))) (currentByte!7264 thiss!1602) (currentBit!7259 thiss!1602))) (size!3494 (buf!3952 (BitStream!6157 (array!7738 (store (store (arr!4415 (buf!3952 thiss!1602)) (currentByte!7264 thiss!1602) lt!252978) (currentByte!7264 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252978) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252977)))) (size!3494 (buf!3952 thiss!1602))) (currentByte!7264 thiss!1602) (currentBit!7259 thiss!1602))))))))

(declare-fun bs!13453 () Bool)

(assert (= bs!13453 d!54257))

(declare-fun m!253375 () Bool)

(assert (=> bs!13453 m!253375))

(assert (=> b!160457 d!54257))

(declare-fun d!54259 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54259 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3494 (buf!3952 thiss!1602))) ((_ sign_extend 32) (currentByte!7264 thiss!1602)) ((_ sign_extend 32) (currentBit!7259 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3494 (buf!3952 thiss!1602))) ((_ sign_extend 32) (currentByte!7264 thiss!1602)) ((_ sign_extend 32) (currentBit!7259 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13454 () Bool)

(assert (= bs!13454 d!54259))

(declare-fun m!253377 () Bool)

(assert (=> bs!13454 m!253377))

(assert (=> start!32796 d!54259))

(declare-fun d!54261 () Bool)

(assert (=> d!54261 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7259 thiss!1602) (currentByte!7264 thiss!1602) (size!3494 (buf!3952 thiss!1602))))))

(declare-fun bs!13455 () Bool)

(assert (= bs!13455 d!54261))

(declare-fun m!253379 () Bool)

(assert (=> bs!13455 m!253379))

(assert (=> start!32796 d!54261))

(check-sat (not d!54257) (not d!54261) (not d!54259))
(check-sat)
