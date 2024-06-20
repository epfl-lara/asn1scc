; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32878 () Bool)

(assert start!32878)

(declare-fun res!133865 () Bool)

(declare-fun e!110026 () Bool)

(assert (=> start!32878 (=> (not res!133865) (not e!110026))))

(declare-datatypes ((array!7760 0))(
  ( (array!7761 (arr!4423 (Array (_ BitVec 32) (_ BitVec 8))) (size!3502 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6172 0))(
  ( (BitStream!6173 (buf!3960 array!7760) (currentByte!7291 (_ BitVec 32)) (currentBit!7286 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6172)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32878 (= res!133865 (validate_offset_byte!0 ((_ sign_extend 32) (size!3502 (buf!3960 thiss!1602))) ((_ sign_extend 32) (currentByte!7291 thiss!1602)) ((_ sign_extend 32) (currentBit!7286 thiss!1602))))))

(assert (=> start!32878 e!110026))

(declare-fun e!110027 () Bool)

(declare-fun inv!12 (BitStream!6172) Bool)

(assert (=> start!32878 (and (inv!12 thiss!1602) e!110027)))

(declare-fun b!160505 () Bool)

(assert (=> b!160505 (= e!110026 (or (bvslt (currentByte!7291 thiss!1602) #b00000000000000000000000000000000) (bvsge (currentByte!7291 thiss!1602) (size!3502 (buf!3960 thiss!1602)))))))

(declare-fun b!160506 () Bool)

(declare-fun array_inv!3249 (array!7760) Bool)

(assert (=> b!160506 (= e!110027 (array_inv!3249 (buf!3960 thiss!1602)))))

(assert (= (and start!32878 res!133865) b!160505))

(assert (= start!32878 b!160506))

(declare-fun m!253441 () Bool)

(assert (=> start!32878 m!253441))

(declare-fun m!253443 () Bool)

(assert (=> start!32878 m!253443))

(declare-fun m!253445 () Bool)

(assert (=> b!160506 m!253445))

(push 1)

(assert (not start!32878))

(assert (not b!160506))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54329 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54329 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3502 (buf!3960 thiss!1602))) ((_ sign_extend 32) (currentByte!7291 thiss!1602)) ((_ sign_extend 32) (currentBit!7286 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3502 (buf!3960 thiss!1602))) ((_ sign_extend 32) (currentByte!7291 thiss!1602)) ((_ sign_extend 32) (currentBit!7286 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13477 () Bool)

(assert (= bs!13477 d!54329))

(declare-fun m!253459 () Bool)

(assert (=> bs!13477 m!253459))

(assert (=> start!32878 d!54329))

(declare-fun d!54333 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54333 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7286 thiss!1602) (currentByte!7291 thiss!1602) (size!3502 (buf!3960 thiss!1602))))))

(declare-fun bs!13479 () Bool)

(assert (= bs!13479 d!54333))

(declare-fun m!253463 () Bool)

(assert (=> bs!13479 m!253463))

(assert (=> start!32878 d!54333))

(declare-fun d!54341 () Bool)

(assert (=> d!54341 (= (array_inv!3249 (buf!3960 thiss!1602)) (bvsge (size!3502 (buf!3960 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160506 d!54341))

(push 1)

(assert (not d!54333))

(assert (not d!54329))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54347 () Bool)

(assert (=> d!54347 (= (invariant!0 (currentBit!7286 thiss!1602) (currentByte!7291 thiss!1602) (size!3502 (buf!3960 thiss!1602))) (and (bvsge (currentBit!7286 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7286 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7291 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7291 thiss!1602) (size!3502 (buf!3960 thiss!1602))) (and (= (currentBit!7286 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7291 thiss!1602) (size!3502 (buf!3960 thiss!1602)))))))))

(assert (=> d!54333 d!54347))

(declare-fun d!54351 () Bool)

(assert (=> d!54351 (= (remainingBits!0 ((_ sign_extend 32) (size!3502 (buf!3960 thiss!1602))) ((_ sign_extend 32) (currentByte!7291 thiss!1602)) ((_ sign_extend 32) (currentBit!7286 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3502 (buf!3960 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7291 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7286 thiss!1602)))))))

(assert (=> d!54329 d!54351))

(push 1)

(check-sat)

(pop 1)

