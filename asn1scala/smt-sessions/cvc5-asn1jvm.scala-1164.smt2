; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32914 () Bool)

(assert start!32914)

(declare-fun res!133874 () Bool)

(declare-fun e!110053 () Bool)

(assert (=> start!32914 (=> (not res!133874) (not e!110053))))

(declare-datatypes ((array!7769 0))(
  ( (array!7770 (arr!4426 (Array (_ BitVec 32) (_ BitVec 8))) (size!3505 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6178 0))(
  ( (BitStream!6179 (buf!3963 array!7769) (currentByte!7303 (_ BitVec 32)) (currentBit!7298 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6178)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32914 (= res!133874 (validate_offset_byte!0 ((_ sign_extend 32) (size!3505 (buf!3963 thiss!1602))) ((_ sign_extend 32) (currentByte!7303 thiss!1602)) ((_ sign_extend 32) (currentBit!7298 thiss!1602))))))

(assert (=> start!32914 e!110053))

(declare-fun e!110054 () Bool)

(declare-fun inv!12 (BitStream!6178) Bool)

(assert (=> start!32914 (and (inv!12 thiss!1602) e!110054)))

(assert (=> start!32914 true))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!252990 () (_ BitVec 32))

(declare-fun lt!252989 () (_ BitVec 8))

(declare-fun b!160523 () Bool)

(assert (=> b!160523 (= e!110053 (not (inv!12 (BitStream!6179 (array!7770 (store (store (arr!4426 (buf!3963 thiss!1602)) (currentByte!7303 thiss!1602) lt!252989) (currentByte!7303 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252989) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252990)))) (size!3505 (buf!3963 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7303 thiss!1602)) (currentBit!7298 thiss!1602)))))))

(assert (=> b!160523 (= lt!252989 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4426 (buf!3963 thiss!1602)) (currentByte!7303 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!252990)))))))))))))

(assert (=> b!160523 (= lt!252990 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7298 thiss!1602))))))

(declare-fun b!160524 () Bool)

(declare-fun array_inv!3252 (array!7769) Bool)

(assert (=> b!160524 (= e!110054 (array_inv!3252 (buf!3963 thiss!1602)))))

(assert (= (and start!32914 res!133874) b!160523))

(assert (= start!32914 b!160524))

(declare-fun m!253471 () Bool)

(assert (=> start!32914 m!253471))

(declare-fun m!253473 () Bool)

(assert (=> start!32914 m!253473))

(declare-fun m!253475 () Bool)

(assert (=> b!160523 m!253475))

(declare-fun m!253477 () Bool)

(assert (=> b!160523 m!253477))

(declare-fun m!253479 () Bool)

(assert (=> b!160523 m!253479))

(declare-fun m!253481 () Bool)

(assert (=> b!160523 m!253481))

(declare-fun m!253483 () Bool)

(assert (=> b!160523 m!253483))

(declare-fun m!253485 () Bool)

(assert (=> b!160524 m!253485))

(push 1)

(assert (not b!160524))

(assert (not start!32914))

(assert (not b!160523))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54361 () Bool)

(assert (=> d!54361 (= (array_inv!3252 (buf!3963 thiss!1602)) (bvsge (size!3505 (buf!3963 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160524 d!54361))

(declare-fun d!54363 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54363 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3505 (buf!3963 thiss!1602))) ((_ sign_extend 32) (currentByte!7303 thiss!1602)) ((_ sign_extend 32) (currentBit!7298 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3505 (buf!3963 thiss!1602))) ((_ sign_extend 32) (currentByte!7303 thiss!1602)) ((_ sign_extend 32) (currentBit!7298 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13486 () Bool)

(assert (= bs!13486 d!54363))

(declare-fun m!253519 () Bool)

(assert (=> bs!13486 m!253519))

(assert (=> start!32914 d!54363))

(declare-fun d!54367 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54367 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7298 thiss!1602) (currentByte!7303 thiss!1602) (size!3505 (buf!3963 thiss!1602))))))

(declare-fun bs!13490 () Bool)

(assert (= bs!13490 d!54367))

(declare-fun m!253527 () Bool)

(assert (=> bs!13490 m!253527))

(assert (=> start!32914 d!54367))

(declare-fun d!54375 () Bool)

(assert (=> d!54375 (= (inv!12 (BitStream!6179 (array!7770 (store (store (arr!4426 (buf!3963 thiss!1602)) (currentByte!7303 thiss!1602) lt!252989) (currentByte!7303 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252989) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252990)))) (size!3505 (buf!3963 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7303 thiss!1602)) (currentBit!7298 thiss!1602))) (invariant!0 (currentBit!7298 (BitStream!6179 (array!7770 (store (store (arr!4426 (buf!3963 thiss!1602)) (currentByte!7303 thiss!1602) lt!252989) (currentByte!7303 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252989) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252990)))) (size!3505 (buf!3963 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7303 thiss!1602)) (currentBit!7298 thiss!1602))) (currentByte!7303 (BitStream!6179 (array!7770 (store (store (arr!4426 (buf!3963 thiss!1602)) (currentByte!7303 thiss!1602) lt!252989) (currentByte!7303 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252989) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252990)))) (size!3505 (buf!3963 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7303 thiss!1602)) (currentBit!7298 thiss!1602))) (size!3505 (buf!3963 (BitStream!6179 (array!7770 (store (store (arr!4426 (buf!3963 thiss!1602)) (currentByte!7303 thiss!1602) lt!252989) (currentByte!7303 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252989) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252990)))) (size!3505 (buf!3963 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7303 thiss!1602)) (currentBit!7298 thiss!1602))))))))

(declare-fun bs!13491 () Bool)

(assert (= bs!13491 d!54375))

(declare-fun m!253529 () Bool)

(assert (=> bs!13491 m!253529))

(assert (=> b!160523 d!54375))

(push 1)

(assert (not d!54367))

(assert (not d!54363))

(assert (not d!54375))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54385 () Bool)

(assert (=> d!54385 (= (invariant!0 (currentBit!7298 thiss!1602) (currentByte!7303 thiss!1602) (size!3505 (buf!3963 thiss!1602))) (and (bvsge (currentBit!7298 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7298 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7303 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7303 thiss!1602) (size!3505 (buf!3963 thiss!1602))) (and (= (currentBit!7298 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7303 thiss!1602) (size!3505 (buf!3963 thiss!1602)))))))))

(assert (=> d!54367 d!54385))

(declare-fun d!54389 () Bool)

(assert (=> d!54389 (= (remainingBits!0 ((_ sign_extend 32) (size!3505 (buf!3963 thiss!1602))) ((_ sign_extend 32) (currentByte!7303 thiss!1602)) ((_ sign_extend 32) (currentBit!7298 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3505 (buf!3963 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7303 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7298 thiss!1602)))))))

(assert (=> d!54363 d!54389))

(declare-fun d!54393 () Bool)

(assert (=> d!54393 (= (invariant!0 (currentBit!7298 (BitStream!6179 (array!7770 (store (store (arr!4426 (buf!3963 thiss!1602)) (currentByte!7303 thiss!1602) lt!252989) (currentByte!7303 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252989) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252990)))) (size!3505 (buf!3963 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7303 thiss!1602)) (currentBit!7298 thiss!1602))) (currentByte!7303 (BitStream!6179 (array!7770 (store (store (arr!4426 (buf!3963 thiss!1602)) (currentByte!7303 thiss!1602) lt!252989) (currentByte!7303 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252989) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252990)))) (size!3505 (buf!3963 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7303 thiss!1602)) (currentBit!7298 thiss!1602))) (size!3505 (buf!3963 (BitStream!6179 (array!7770 (store (store (arr!4426 (buf!3963 thiss!1602)) (currentByte!7303 thiss!1602) lt!252989) (currentByte!7303 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252989) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252990)))) (size!3505 (buf!3963 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7303 thiss!1602)) (currentBit!7298 thiss!1602))))) (and (bvsge (currentBit!7298 (BitStream!6179 (array!7770 (store (store (arr!4426 (buf!3963 thiss!1602)) (currentByte!7303 thiss!1602) lt!252989) (currentByte!7303 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252989) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252990)))) (size!3505 (buf!3963 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7303 thiss!1602)) (currentBit!7298 thiss!1602))) #b00000000000000000000000000000000) (bvslt (currentBit!7298 (BitStream!6179 (array!7770 (store (store (arr!4426 (buf!3963 thiss!1602)) (currentByte!7303 thiss!1602) lt!252989) (currentByte!7303 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252989) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252990)))) (size!3505 (buf!3963 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7303 thiss!1602)) (currentBit!7298 thiss!1602))) #b00000000000000000000000000001000) (bvsge (currentByte!7303 (BitStream!6179 (array!7770 (store (store (arr!4426 (buf!3963 thiss!1602)) (currentByte!7303 thiss!1602) lt!252989) (currentByte!7303 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252989) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252990)))) (size!3505 (buf!3963 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7303 thiss!1602)) (currentBit!7298 thiss!1602))) #b00000000000000000000000000000000) (or (bvslt (currentByte!7303 (BitStream!6179 (array!7770 (store (store (arr!4426 (buf!3963 thiss!1602)) (currentByte!7303 thiss!1602) lt!252989) (currentByte!7303 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252989) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252990)))) (size!3505 (buf!3963 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7303 thiss!1602)) (currentBit!7298 thiss!1602))) (size!3505 (buf!3963 (BitStream!6179 (array!7770 (store (store (arr!4426 (buf!3963 thiss!1602)) (currentByte!7303 thiss!1602) lt!252989) (currentByte!7303 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252989) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252990)))) (size!3505 (buf!3963 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7303 thiss!1602)) (currentBit!7298 thiss!1602))))) (and (= (currentBit!7298 (BitStream!6179 (array!7770 (store (store (arr!4426 (buf!3963 thiss!1602)) (currentByte!7303 thiss!1602) lt!252989) (currentByte!7303 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252989) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252990)))) (size!3505 (buf!3963 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7303 thiss!1602)) (currentBit!7298 thiss!1602))) #b00000000000000000000000000000000) (= (currentByte!7303 (BitStream!6179 (array!7770 (store (store (arr!4426 (buf!3963 thiss!1602)) (currentByte!7303 thiss!1602) lt!252989) (currentByte!7303 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252989) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252990)))) (size!3505 (buf!3963 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7303 thiss!1602)) (currentBit!7298 thiss!1602))) (size!3505 (buf!3963 (BitStream!6179 (array!7770 (store (store (arr!4426 (buf!3963 thiss!1602)) (currentByte!7303 thiss!1602) lt!252989) (currentByte!7303 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252989) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252990)))) (size!3505 (buf!3963 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7303 thiss!1602)) (currentBit!7298 thiss!1602)))))))))))

(assert (=> d!54375 d!54393))

(push 1)

(check-sat)

