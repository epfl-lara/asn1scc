; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32570 () Bool)

(assert start!32570)

(declare-fun res!133754 () Bool)

(declare-fun e!109693 () Bool)

(assert (=> start!32570 (=> (not res!133754) (not e!109693))))

(declare-datatypes ((array!7661 0))(
  ( (array!7662 (arr!4386 (Array (_ BitVec 32) (_ BitVec 8))) (size!3465 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6098 0))(
  ( (BitStream!6099 (buf!3923 array!7661) (currentByte!7187 (_ BitVec 32)) (currentBit!7182 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6098)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32570 (= res!133754 (validate_offset_byte!0 ((_ sign_extend 32) (size!3465 (buf!3923 thiss!1602))) ((_ sign_extend 32) (currentByte!7187 thiss!1602)) ((_ sign_extend 32) (currentBit!7182 thiss!1602))))))

(assert (=> start!32570 e!109693))

(declare-fun e!109694 () Bool)

(declare-fun inv!12 (BitStream!6098) Bool)

(assert (=> start!32570 (and (inv!12 thiss!1602) e!109694)))

(declare-fun b!160283 () Bool)

(assert (=> b!160283 (= e!109693 (and (bvslt (currentBit!7182 thiss!1602) #b00000000000000000000000010000000) (bvslt (currentBit!7182 thiss!1602) #b11111111111111111111111110000000)))))

(declare-fun b!160284 () Bool)

(declare-fun array_inv!3212 (array!7661) Bool)

(assert (=> b!160284 (= e!109694 (array_inv!3212 (buf!3923 thiss!1602)))))

(assert (= (and start!32570 res!133754) b!160283))

(assert (= start!32570 b!160284))

(declare-fun m!253045 () Bool)

(assert (=> start!32570 m!253045))

(declare-fun m!253047 () Bool)

(assert (=> start!32570 m!253047))

(declare-fun m!253049 () Bool)

(assert (=> b!160284 m!253049))

(push 1)

(assert (not b!160284))

(assert (not start!32570))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54071 () Bool)

(assert (=> d!54071 (= (array_inv!3212 (buf!3923 thiss!1602)) (bvsge (size!3465 (buf!3923 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160284 d!54071))

(declare-fun d!54073 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54073 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3465 (buf!3923 thiss!1602))) ((_ sign_extend 32) (currentByte!7187 thiss!1602)) ((_ sign_extend 32) (currentBit!7182 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3465 (buf!3923 thiss!1602))) ((_ sign_extend 32) (currentByte!7187 thiss!1602)) ((_ sign_extend 32) (currentBit!7182 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13387 () Bool)

(assert (= bs!13387 d!54073))

(declare-fun m!253057 () Bool)

(assert (=> bs!13387 m!253057))

(assert (=> start!32570 d!54073))

(declare-fun d!54077 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54077 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7182 thiss!1602) (currentByte!7187 thiss!1602) (size!3465 (buf!3923 thiss!1602))))))

(declare-fun bs!13389 () Bool)

(assert (= bs!13389 d!54077))

(declare-fun m!253061 () Bool)

(assert (=> bs!13389 m!253061))

(assert (=> start!32570 d!54077))

(push 1)

(assert (not d!54077))

(assert (not d!54073))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54087 () Bool)

(assert (=> d!54087 (= (invariant!0 (currentBit!7182 thiss!1602) (currentByte!7187 thiss!1602) (size!3465 (buf!3923 thiss!1602))) (and (bvsge (currentBit!7182 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7182 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7187 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7187 thiss!1602) (size!3465 (buf!3923 thiss!1602))) (and (= (currentBit!7182 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7187 thiss!1602) (size!3465 (buf!3923 thiss!1602)))))))))

(assert (=> d!54077 d!54087))

(declare-fun d!54089 () Bool)

(assert (=> d!54089 (= (remainingBits!0 ((_ sign_extend 32) (size!3465 (buf!3923 thiss!1602))) ((_ sign_extend 32) (currentByte!7187 thiss!1602)) ((_ sign_extend 32) (currentBit!7182 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3465 (buf!3923 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7187 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7182 thiss!1602)))))))

(assert (=> d!54073 d!54089))

(push 1)

(check-sat)

