; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32702 () Bool)

(assert start!32702)

(declare-fun res!133817 () Bool)

(declare-fun e!109882 () Bool)

(assert (=> start!32702 (=> (not res!133817) (not e!109882))))

(declare-datatypes ((array!7712 0))(
  ( (array!7713 (arr!4407 (Array (_ BitVec 32) (_ BitVec 8))) (size!3486 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6140 0))(
  ( (BitStream!6141 (buf!3944 array!7712) (currentByte!7235 (_ BitVec 32)) (currentBit!7230 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6140)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32702 (= res!133817 (validate_offset_byte!0 ((_ sign_extend 32) (size!3486 (buf!3944 thiss!1602))) ((_ sign_extend 32) (currentByte!7235 thiss!1602)) ((_ sign_extend 32) (currentBit!7230 thiss!1602))))))

(assert (=> start!32702 e!109882))

(declare-fun e!109883 () Bool)

(declare-fun inv!12 (BitStream!6140) Bool)

(assert (=> start!32702 (and (inv!12 thiss!1602) e!109883)))

(declare-fun b!160409 () Bool)

(assert (=> b!160409 (= e!109882 (not (inv!12 (BitStream!6141 (array!7713 (store (arr!4407 (buf!3944 thiss!1602)) (currentByte!7235 thiss!1602) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4407 (buf!3944 thiss!1602)) (currentByte!7235 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7230 thiss!1602)))))))))))))) (size!3486 (buf!3944 thiss!1602))) (currentByte!7235 thiss!1602) (currentBit!7230 thiss!1602)))))))

(declare-fun b!160410 () Bool)

(declare-fun array_inv!3233 (array!7712) Bool)

(assert (=> b!160410 (= e!109883 (array_inv!3233 (buf!3944 thiss!1602)))))

(assert (= (and start!32702 res!133817) b!160409))

(assert (= start!32702 b!160410))

(declare-fun m!253235 () Bool)

(assert (=> start!32702 m!253235))

(declare-fun m!253237 () Bool)

(assert (=> start!32702 m!253237))

(declare-fun m!253239 () Bool)

(assert (=> b!160409 m!253239))

(declare-fun m!253241 () Bool)

(assert (=> b!160409 m!253241))

(declare-fun m!253243 () Bool)

(assert (=> b!160409 m!253243))

(declare-fun m!253245 () Bool)

(assert (=> b!160409 m!253245))

(declare-fun m!253247 () Bool)

(assert (=> b!160410 m!253247))

(push 1)

(assert (not b!160410))

(assert (not b!160409))

(assert (not start!32702))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54177 () Bool)

(assert (=> d!54177 (= (array_inv!3233 (buf!3944 thiss!1602)) (bvsge (size!3486 (buf!3944 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160410 d!54177))

(declare-fun d!54179 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54179 (= (inv!12 (BitStream!6141 (array!7713 (store (arr!4407 (buf!3944 thiss!1602)) (currentByte!7235 thiss!1602) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4407 (buf!3944 thiss!1602)) (currentByte!7235 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7230 thiss!1602)))))))))))))) (size!3486 (buf!3944 thiss!1602))) (currentByte!7235 thiss!1602) (currentBit!7230 thiss!1602))) (invariant!0 (currentBit!7230 (BitStream!6141 (array!7713 (store (arr!4407 (buf!3944 thiss!1602)) (currentByte!7235 thiss!1602) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4407 (buf!3944 thiss!1602)) (currentByte!7235 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7230 thiss!1602)))))))))))))) (size!3486 (buf!3944 thiss!1602))) (currentByte!7235 thiss!1602) (currentBit!7230 thiss!1602))) (currentByte!7235 (BitStream!6141 (array!7713 (store (arr!4407 (buf!3944 thiss!1602)) (currentByte!7235 thiss!1602) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4407 (buf!3944 thiss!1602)) (currentByte!7235 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7230 thiss!1602)))))))))))))) (size!3486 (buf!3944 thiss!1602))) (currentByte!7235 thiss!1602) (currentBit!7230 thiss!1602))) (size!3486 (buf!3944 (BitStream!6141 (array!7713 (store (arr!4407 (buf!3944 thiss!1602)) (currentByte!7235 thiss!1602) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4407 (buf!3944 thiss!1602)) (currentByte!7235 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7230 thiss!1602)))))))))))))) (size!3486 (buf!3944 thiss!1602))) (currentByte!7235 thiss!1602) (currentBit!7230 thiss!1602))))))))

(declare-fun bs!13428 () Bool)

(assert (= bs!13428 d!54179))

(declare-fun m!253259 () Bool)

(assert (=> bs!13428 m!253259))

