; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32810 () Bool)

(assert start!32810)

(declare-fun res!133853 () Bool)

(declare-fun e!109990 () Bool)

(assert (=> start!32810 (=> (not res!133853) (not e!109990))))

(declare-datatypes ((array!7746 0))(
  ( (array!7747 (arr!4419 (Array (_ BitVec 32) (_ BitVec 8))) (size!3498 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6164 0))(
  ( (BitStream!6165 (buf!3956 array!7746) (currentByte!7269 (_ BitVec 32)) (currentBit!7264 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6164)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32810 (= res!133853 (validate_offset_byte!0 ((_ sign_extend 32) (size!3498 (buf!3956 thiss!1602))) ((_ sign_extend 32) (currentByte!7269 thiss!1602)) ((_ sign_extend 32) (currentBit!7264 thiss!1602))))))

(assert (=> start!32810 e!109990))

(declare-fun e!109991 () Bool)

(declare-fun inv!12 (BitStream!6164) Bool)

(assert (=> start!32810 (and (inv!12 thiss!1602) e!109991)))

(declare-fun b!160481 () Bool)

(assert (=> b!160481 (= e!109990 (or (bvslt (currentByte!7269 thiss!1602) #b00000000000000000000000000000000) (bvsge (currentByte!7269 thiss!1602) (size!3498 (buf!3956 thiss!1602)))))))

(declare-fun b!160482 () Bool)

(declare-fun array_inv!3245 (array!7746) Bool)

(assert (=> b!160482 (= e!109991 (array_inv!3245 (buf!3956 thiss!1602)))))

(assert (= (and start!32810 res!133853) b!160481))

(assert (= start!32810 b!160482))

(declare-fun m!253393 () Bool)

(assert (=> start!32810 m!253393))

(declare-fun m!253395 () Bool)

(assert (=> start!32810 m!253395))

(declare-fun m!253397 () Bool)

(assert (=> b!160482 m!253397))

(push 1)

(assert (not b!160482))

(assert (not start!32810))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54277 () Bool)

(assert (=> d!54277 (= (array_inv!3245 (buf!3956 thiss!1602)) (bvsge (size!3498 (buf!3956 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160482 d!54277))

(declare-fun d!54279 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54279 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3498 (buf!3956 thiss!1602))) ((_ sign_extend 32) (currentByte!7269 thiss!1602)) ((_ sign_extend 32) (currentBit!7264 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3498 (buf!3956 thiss!1602))) ((_ sign_extend 32) (currentByte!7269 thiss!1602)) ((_ sign_extend 32) (currentBit!7264 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13463 () Bool)

(assert (= bs!13463 d!54279))

(declare-fun m!253407 () Bool)

(assert (=> bs!13463 m!253407))

(assert (=> start!32810 d!54279))

(declare-fun d!54281 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54281 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7264 thiss!1602) (currentByte!7269 thiss!1602) (size!3498 (buf!3956 thiss!1602))))))

(declare-fun bs!13464 () Bool)

(assert (= bs!13464 d!54281))

(declare-fun m!253409 () Bool)

(assert (=> bs!13464 m!253409))

(assert (=> start!32810 d!54281))

(push 1)

(assert (not d!54279))

(assert (not d!54281))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54291 () Bool)

(assert (=> d!54291 (= (remainingBits!0 ((_ sign_extend 32) (size!3498 (buf!3956 thiss!1602))) ((_ sign_extend 32) (currentByte!7269 thiss!1602)) ((_ sign_extend 32) (currentBit!7264 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3498 (buf!3956 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7269 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7264 thiss!1602)))))))

(assert (=> d!54279 d!54291))

(declare-fun d!54293 () Bool)

(assert (=> d!54293 (= (invariant!0 (currentBit!7264 thiss!1602) (currentByte!7269 thiss!1602) (size!3498 (buf!3956 thiss!1602))) (and (bvsge (currentBit!7264 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7264 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7269 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7269 thiss!1602) (size!3498 (buf!3956 thiss!1602))) (and (= (currentBit!7264 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7269 thiss!1602) (size!3498 (buf!3956 thiss!1602)))))))))

(assert (=> d!54281 d!54293))

(push 1)

(check-sat)

