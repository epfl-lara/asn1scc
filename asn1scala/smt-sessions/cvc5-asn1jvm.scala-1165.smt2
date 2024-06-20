; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32950 () Bool)

(assert start!32950)

(declare-fun res!133883 () Bool)

(declare-fun e!110080 () Bool)

(assert (=> start!32950 (=> (not res!133883) (not e!110080))))

(declare-datatypes ((array!7778 0))(
  ( (array!7779 (arr!4429 (Array (_ BitVec 32) (_ BitVec 8))) (size!3508 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6184 0))(
  ( (BitStream!6185 (buf!3966 array!7778) (currentByte!7315 (_ BitVec 32)) (currentBit!7310 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6184)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32950 (= res!133883 (validate_offset_byte!0 ((_ sign_extend 32) (size!3508 (buf!3966 thiss!1602))) ((_ sign_extend 32) (currentByte!7315 thiss!1602)) ((_ sign_extend 32) (currentBit!7310 thiss!1602))))))

(assert (=> start!32950 e!110080))

(declare-fun e!110081 () Bool)

(declare-fun inv!12 (BitStream!6184) Bool)

(assert (=> start!32950 (and (inv!12 thiss!1602) e!110081)))

(declare-fun b!160541 () Bool)

(assert (=> b!160541 (= e!110080 (and (= (bvand (currentByte!7315 thiss!1602) #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand (currentByte!7315 thiss!1602) #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 (currentByte!7315 thiss!1602)) #b10000000000000000000000000000000)))))))

(declare-fun b!160542 () Bool)

(declare-fun array_inv!3255 (array!7778) Bool)

(assert (=> b!160542 (= e!110081 (array_inv!3255 (buf!3966 thiss!1602)))))

(assert (= (and start!32950 res!133883) b!160541))

(assert (= start!32950 b!160542))

(declare-fun m!253537 () Bool)

(assert (=> start!32950 m!253537))

(declare-fun m!253539 () Bool)

(assert (=> start!32950 m!253539))

(declare-fun m!253541 () Bool)

(assert (=> b!160542 m!253541))

(push 1)

(assert (not start!32950))

(assert (not b!160542))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54405 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54405 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3508 (buf!3966 thiss!1602))) ((_ sign_extend 32) (currentByte!7315 thiss!1602)) ((_ sign_extend 32) (currentBit!7310 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3508 (buf!3966 thiss!1602))) ((_ sign_extend 32) (currentByte!7315 thiss!1602)) ((_ sign_extend 32) (currentBit!7310 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13499 () Bool)

(assert (= bs!13499 d!54405))

(declare-fun m!253557 () Bool)

(assert (=> bs!13499 m!253557))

(assert (=> start!32950 d!54405))

(declare-fun d!54415 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54415 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7310 thiss!1602) (currentByte!7315 thiss!1602) (size!3508 (buf!3966 thiss!1602))))))

(declare-fun bs!13502 () Bool)

(assert (= bs!13502 d!54415))

(declare-fun m!253563 () Bool)

(assert (=> bs!13502 m!253563))

(assert (=> start!32950 d!54415))

(declare-fun d!54421 () Bool)

(assert (=> d!54421 (= (array_inv!3255 (buf!3966 thiss!1602)) (bvsge (size!3508 (buf!3966 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160542 d!54421))

(push 1)

(assert (not d!54415))

(assert (not d!54405))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54425 () Bool)

(assert (=> d!54425 (= (invariant!0 (currentBit!7310 thiss!1602) (currentByte!7315 thiss!1602) (size!3508 (buf!3966 thiss!1602))) (and (bvsge (currentBit!7310 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7310 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7315 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7315 thiss!1602) (size!3508 (buf!3966 thiss!1602))) (and (= (currentBit!7310 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7315 thiss!1602) (size!3508 (buf!3966 thiss!1602)))))))))

(assert (=> d!54415 d!54425))

(declare-fun d!54429 () Bool)

(assert (=> d!54429 (= (remainingBits!0 ((_ sign_extend 32) (size!3508 (buf!3966 thiss!1602))) ((_ sign_extend 32) (currentByte!7315 thiss!1602)) ((_ sign_extend 32) (currentBit!7310 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3508 (buf!3966 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7315 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7310 thiss!1602)))))))

(assert (=> d!54405 d!54429))

(push 1)

(check-sat)

