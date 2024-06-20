; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32724 () Bool)

(assert start!32724)

(declare-fun res!133823 () Bool)

(declare-fun e!109900 () Bool)

(assert (=> start!32724 (=> (not res!133823) (not e!109900))))

(declare-datatypes ((array!7719 0))(
  ( (array!7720 (arr!4409 (Array (_ BitVec 32) (_ BitVec 8))) (size!3488 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6144 0))(
  ( (BitStream!6145 (buf!3946 array!7719) (currentByte!7240 (_ BitVec 32)) (currentBit!7235 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6144)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32724 (= res!133823 (validate_offset_byte!0 ((_ sign_extend 32) (size!3488 (buf!3946 thiss!1602))) ((_ sign_extend 32) (currentByte!7240 thiss!1602)) ((_ sign_extend 32) (currentBit!7235 thiss!1602))))))

(assert (=> start!32724 e!109900))

(declare-fun e!109901 () Bool)

(declare-fun inv!12 (BitStream!6144) Bool)

(assert (=> start!32724 (and (inv!12 thiss!1602) e!109901)))

(declare-fun b!160421 () Bool)

(assert (=> b!160421 (= e!109900 (or (bvslt (currentByte!7240 thiss!1602) #b00000000000000000000000000000000) (bvsge (currentByte!7240 thiss!1602) (size!3488 (buf!3946 thiss!1602)))))))

(declare-fun b!160422 () Bool)

(declare-fun array_inv!3235 (array!7719) Bool)

(assert (=> b!160422 (= e!109901 (array_inv!3235 (buf!3946 thiss!1602)))))

(assert (= (and start!32724 res!133823) b!160421))

(assert (= start!32724 b!160422))

(declare-fun m!253273 () Bool)

(assert (=> start!32724 m!253273))

(declare-fun m!253275 () Bool)

(assert (=> start!32724 m!253275))

(declare-fun m!253277 () Bool)

(assert (=> b!160422 m!253277))

(check-sat (not b!160422) (not start!32724))
(check-sat)
(get-model)

(declare-fun d!54191 () Bool)

(assert (=> d!54191 (= (array_inv!3235 (buf!3946 thiss!1602)) (bvsge (size!3488 (buf!3946 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160422 d!54191))

(declare-fun d!54193 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54193 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3488 (buf!3946 thiss!1602))) ((_ sign_extend 32) (currentByte!7240 thiss!1602)) ((_ sign_extend 32) (currentBit!7235 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3488 (buf!3946 thiss!1602))) ((_ sign_extend 32) (currentByte!7240 thiss!1602)) ((_ sign_extend 32) (currentBit!7235 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13435 () Bool)

(assert (= bs!13435 d!54193))

(declare-fun m!253285 () Bool)

(assert (=> bs!13435 m!253285))

(assert (=> start!32724 d!54193))

(declare-fun d!54195 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54195 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7235 thiss!1602) (currentByte!7240 thiss!1602) (size!3488 (buf!3946 thiss!1602))))))

(declare-fun bs!13436 () Bool)

(assert (= bs!13436 d!54195))

(declare-fun m!253287 () Bool)

(assert (=> bs!13436 m!253287))

(assert (=> start!32724 d!54195))

(check-sat (not d!54195) (not d!54193))
(check-sat)
(get-model)

(declare-fun d!54207 () Bool)

(assert (=> d!54207 (= (invariant!0 (currentBit!7235 thiss!1602) (currentByte!7240 thiss!1602) (size!3488 (buf!3946 thiss!1602))) (and (bvsge (currentBit!7235 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7235 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7240 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7240 thiss!1602) (size!3488 (buf!3946 thiss!1602))) (and (= (currentBit!7235 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7240 thiss!1602) (size!3488 (buf!3946 thiss!1602)))))))))

(assert (=> d!54195 d!54207))

(declare-fun d!54211 () Bool)

(assert (=> d!54211 (= (remainingBits!0 ((_ sign_extend 32) (size!3488 (buf!3946 thiss!1602))) ((_ sign_extend 32) (currentByte!7240 thiss!1602)) ((_ sign_extend 32) (currentBit!7235 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3488 (buf!3946 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7240 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7235 thiss!1602)))))))

(assert (=> d!54193 d!54211))

(check-sat)
