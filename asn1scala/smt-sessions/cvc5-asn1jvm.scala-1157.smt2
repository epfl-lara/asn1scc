; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32698 () Bool)

(assert start!32698)

(declare-fun res!133811 () Bool)

(declare-fun e!109864 () Bool)

(assert (=> start!32698 (=> (not res!133811) (not e!109864))))

(declare-datatypes ((array!7708 0))(
  ( (array!7709 (arr!4405 (Array (_ BitVec 32) (_ BitVec 8))) (size!3484 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6136 0))(
  ( (BitStream!6137 (buf!3942 array!7708) (currentByte!7233 (_ BitVec 32)) (currentBit!7228 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6136)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32698 (= res!133811 (validate_offset_byte!0 ((_ sign_extend 32) (size!3484 (buf!3942 thiss!1602))) ((_ sign_extend 32) (currentByte!7233 thiss!1602)) ((_ sign_extend 32) (currentBit!7228 thiss!1602))))))

(assert (=> start!32698 e!109864))

(declare-fun e!109865 () Bool)

(declare-fun inv!12 (BitStream!6136) Bool)

(assert (=> start!32698 (and (inv!12 thiss!1602) e!109865)))

(declare-fun b!160397 () Bool)

(assert (=> b!160397 (= e!109864 (not (inv!12 (BitStream!6137 (array!7709 (store (arr!4405 (buf!3942 thiss!1602)) (currentByte!7233 thiss!1602) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4405 (buf!3942 thiss!1602)) (currentByte!7233 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7228 thiss!1602)))))))))))))) (size!3484 (buf!3942 thiss!1602))) (currentByte!7233 thiss!1602) (currentBit!7228 thiss!1602)))))))

(declare-fun b!160398 () Bool)

(declare-fun array_inv!3231 (array!7708) Bool)

(assert (=> b!160398 (= e!109865 (array_inv!3231 (buf!3942 thiss!1602)))))

(assert (= (and start!32698 res!133811) b!160397))

(assert (= start!32698 b!160398))

(declare-fun m!253207 () Bool)

(assert (=> start!32698 m!253207))

(declare-fun m!253209 () Bool)

(assert (=> start!32698 m!253209))

(declare-fun m!253211 () Bool)

(assert (=> b!160397 m!253211))

(declare-fun m!253213 () Bool)

(assert (=> b!160397 m!253213))

(declare-fun m!253215 () Bool)

(assert (=> b!160397 m!253215))

(declare-fun m!253217 () Bool)

(assert (=> b!160397 m!253217))

(declare-fun m!253219 () Bool)

(assert (=> b!160398 m!253219))

(push 1)

(assert (not start!32698))

(assert (not b!160398))

(assert (not b!160397))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54173 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54173 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3484 (buf!3942 thiss!1602))) ((_ sign_extend 32) (currentByte!7233 thiss!1602)) ((_ sign_extend 32) (currentBit!7228 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3484 (buf!3942 thiss!1602))) ((_ sign_extend 32) (currentByte!7233 thiss!1602)) ((_ sign_extend 32) (currentBit!7228 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13426 () Bool)

(assert (= bs!13426 d!54173))

(declare-fun m!253255 () Bool)

(assert (=> bs!13426 m!253255))

(assert (=> start!32698 d!54173))

(declare-fun d!54175 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54175 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7228 thiss!1602) (currentByte!7233 thiss!1602) (size!3484 (buf!3942 thiss!1602))))))

(declare-fun bs!13427 () Bool)

(assert (= bs!13427 d!54175))

(declare-fun m!253257 () Bool)

(assert (=> bs!13427 m!253257))

(assert (=> start!32698 d!54175))

(declare-fun d!54181 () Bool)

(assert (=> d!54181 (= (array_inv!3231 (buf!3942 thiss!1602)) (bvsge (size!3484 (buf!3942 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160398 d!54181))

(declare-fun d!54183 () Bool)

(assert (=> d!54183 (= (inv!12 (BitStream!6137 (array!7709 (store (arr!4405 (buf!3942 thiss!1602)) (currentByte!7233 thiss!1602) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4405 (buf!3942 thiss!1602)) (currentByte!7233 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7228 thiss!1602)))))))))))))) (size!3484 (buf!3942 thiss!1602))) (currentByte!7233 thiss!1602) (currentBit!7228 thiss!1602))) (invariant!0 (currentBit!7228 (BitStream!6137 (array!7709 (store (arr!4405 (buf!3942 thiss!1602)) (currentByte!7233 thiss!1602) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4405 (buf!3942 thiss!1602)) (currentByte!7233 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7228 thiss!1602)))))))))))))) (size!3484 (buf!3942 thiss!1602))) (currentByte!7233 thiss!1602) (currentBit!7228 thiss!1602))) (currentByte!7233 (BitStream!6137 (array!7709 (store (arr!4405 (buf!3942 thiss!1602)) (currentByte!7233 thiss!1602) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4405 (buf!3942 thiss!1602)) (currentByte!7233 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7228 thiss!1602)))))))))))))) (size!3484 (buf!3942 thiss!1602))) (currentByte!7233 thiss!1602) (currentBit!7228 thiss!1602))) (size!3484 (buf!3942 (BitStream!6137 (array!7709 (store (arr!4405 (buf!3942 thiss!1602)) (currentByte!7233 thiss!1602) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4405 (buf!3942 thiss!1602)) (currentByte!7233 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7228 thiss!1602)))))))))))))) (size!3484 (buf!3942 thiss!1602))) (currentByte!7233 thiss!1602) (currentBit!7228 thiss!1602))))))))

(declare-fun bs!13429 () Bool)

(assert (= bs!13429 d!54183))

(declare-fun m!253261 () Bool)

(assert (=> bs!13429 m!253261))

(assert (=> b!160397 d!54183))

(push 1)

(assert (not d!54175))

(assert (not d!54173))

(assert (not d!54183))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

