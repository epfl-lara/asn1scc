; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32726 () Bool)

(assert start!32726)

(declare-fun res!133826 () Bool)

(declare-fun e!109909 () Bool)

(assert (=> start!32726 (=> (not res!133826) (not e!109909))))

(declare-datatypes ((array!7721 0))(
  ( (array!7722 (arr!4410 (Array (_ BitVec 32) (_ BitVec 8))) (size!3489 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6146 0))(
  ( (BitStream!6147 (buf!3947 array!7721) (currentByte!7241 (_ BitVec 32)) (currentBit!7236 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6146)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32726 (= res!133826 (validate_offset_byte!0 ((_ sign_extend 32) (size!3489 (buf!3947 thiss!1602))) ((_ sign_extend 32) (currentByte!7241 thiss!1602)) ((_ sign_extend 32) (currentBit!7236 thiss!1602))))))

(assert (=> start!32726 e!109909))

(declare-fun e!109910 () Bool)

(declare-fun inv!12 (BitStream!6146) Bool)

(assert (=> start!32726 (and (inv!12 thiss!1602) e!109910)))

(declare-fun b!160427 () Bool)

(assert (=> b!160427 (= e!109909 (or (bvslt (currentByte!7241 thiss!1602) #b00000000000000000000000000000000) (bvsge (currentByte!7241 thiss!1602) (size!3489 (buf!3947 thiss!1602)))))))

(declare-fun b!160428 () Bool)

(declare-fun array_inv!3236 (array!7721) Bool)

(assert (=> b!160428 (= e!109910 (array_inv!3236 (buf!3947 thiss!1602)))))

(assert (= (and start!32726 res!133826) b!160427))

(assert (= start!32726 b!160428))

(declare-fun m!253279 () Bool)

(assert (=> start!32726 m!253279))

(declare-fun m!253281 () Bool)

(assert (=> start!32726 m!253281))

(declare-fun m!253283 () Bool)

(assert (=> b!160428 m!253283))

(push 1)

(assert (not start!32726))

(assert (not b!160428))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54203 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54203 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3489 (buf!3947 thiss!1602))) ((_ sign_extend 32) (currentByte!7241 thiss!1602)) ((_ sign_extend 32) (currentBit!7236 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3489 (buf!3947 thiss!1602))) ((_ sign_extend 32) (currentByte!7241 thiss!1602)) ((_ sign_extend 32) (currentBit!7236 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13439 () Bool)

(assert (= bs!13439 d!54203))

(declare-fun m!253293 () Bool)

(assert (=> bs!13439 m!253293))

(assert (=> start!32726 d!54203))

(declare-fun d!54205 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54205 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7236 thiss!1602) (currentByte!7241 thiss!1602) (size!3489 (buf!3947 thiss!1602))))))

(declare-fun bs!13440 () Bool)

(assert (= bs!13440 d!54205))

(declare-fun m!253295 () Bool)

(assert (=> bs!13440 m!253295))

(assert (=> start!32726 d!54205))

(declare-fun d!54209 () Bool)

(assert (=> d!54209 (= (array_inv!3236 (buf!3947 thiss!1602)) (bvsge (size!3489 (buf!3947 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160428 d!54209))

(push 1)

(assert (not d!54205))

(assert (not d!54203))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54217 () Bool)

(assert (=> d!54217 (= (invariant!0 (currentBit!7236 thiss!1602) (currentByte!7241 thiss!1602) (size!3489 (buf!3947 thiss!1602))) (and (bvsge (currentBit!7236 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7236 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7241 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7241 thiss!1602) (size!3489 (buf!3947 thiss!1602))) (and (= (currentBit!7236 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7241 thiss!1602) (size!3489 (buf!3947 thiss!1602)))))))))

(assert (=> d!54205 d!54217))

(declare-fun d!54219 () Bool)

(assert (=> d!54219 (= (remainingBits!0 ((_ sign_extend 32) (size!3489 (buf!3947 thiss!1602))) ((_ sign_extend 32) (currentByte!7241 thiss!1602)) ((_ sign_extend 32) (currentBit!7236 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3489 (buf!3947 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7241 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7236 thiss!1602)))))))

(assert (=> d!54203 d!54219))

(push 1)

(check-sat)

