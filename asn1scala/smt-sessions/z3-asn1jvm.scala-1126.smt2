; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32022 () Bool)

(assert start!32022)

(declare-fun res!132539 () Bool)

(declare-fun e!108142 () Bool)

(assert (=> start!32022 (=> (not res!132539) (not e!108142))))

(declare-datatypes ((array!7486 0))(
  ( (array!7487 (arr!4313 (Array (_ BitVec 32) (_ BitVec 8))) (size!3392 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5952 0))(
  ( (BitStream!5953 (buf!3850 array!7486) (currentByte!7064 (_ BitVec 32)) (currentBit!7059 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!5952)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32022 (= res!132539 (validate_offset_byte!0 ((_ sign_extend 32) (size!3392 (buf!3850 thiss!1602))) ((_ sign_extend 32) (currentByte!7064 thiss!1602)) ((_ sign_extend 32) (currentBit!7059 thiss!1602))))))

(assert (=> start!32022 e!108142))

(declare-fun e!108143 () Bool)

(declare-fun inv!12 (BitStream!5952) Bool)

(assert (=> start!32022 (and (inv!12 thiss!1602) e!108143)))

(declare-fun b!158759 () Bool)

(assert (=> b!158759 (= e!108142 (and (bvslt (currentByte!7064 thiss!1602) (size!3392 (buf!3850 thiss!1602))) (or (bvsgt #b00000000000000000000000000000000 (currentBit!7059 thiss!1602)) (bvsgt (currentBit!7059 thiss!1602) #b00000000000000000000000000001000))))))

(declare-fun b!158760 () Bool)

(declare-fun array_inv!3139 (array!7486) Bool)

(assert (=> b!158760 (= e!108143 (array_inv!3139 (buf!3850 thiss!1602)))))

(assert (= (and start!32022 res!132539) b!158759))

(assert (= start!32022 b!158760))

(declare-fun m!249325 () Bool)

(assert (=> start!32022 m!249325))

(declare-fun m!249327 () Bool)

(assert (=> start!32022 m!249327))

(declare-fun m!249329 () Bool)

(assert (=> b!158760 m!249329))

(check-sat (not b!158760) (not start!32022))
(check-sat)
(get-model)

(declare-fun d!53371 () Bool)

(assert (=> d!53371 (= (array_inv!3139 (buf!3850 thiss!1602)) (bvsge (size!3392 (buf!3850 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!158760 d!53371))

(declare-fun d!53373 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!53373 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3392 (buf!3850 thiss!1602))) ((_ sign_extend 32) (currentByte!7064 thiss!1602)) ((_ sign_extend 32) (currentBit!7059 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3392 (buf!3850 thiss!1602))) ((_ sign_extend 32) (currentByte!7064 thiss!1602)) ((_ sign_extend 32) (currentBit!7059 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13209 () Bool)

(assert (= bs!13209 d!53373))

(declare-fun m!249337 () Bool)

(assert (=> bs!13209 m!249337))

(assert (=> start!32022 d!53373))

(declare-fun d!53375 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!53375 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7059 thiss!1602) (currentByte!7064 thiss!1602) (size!3392 (buf!3850 thiss!1602))))))

(declare-fun bs!13210 () Bool)

(assert (= bs!13210 d!53375))

(declare-fun m!249339 () Bool)

(assert (=> bs!13210 m!249339))

(assert (=> start!32022 d!53375))

(check-sat (not d!53373) (not d!53375))
(check-sat)
(get-model)

(declare-fun d!53389 () Bool)

(assert (=> d!53389 (= (remainingBits!0 ((_ sign_extend 32) (size!3392 (buf!3850 thiss!1602))) ((_ sign_extend 32) (currentByte!7064 thiss!1602)) ((_ sign_extend 32) (currentBit!7059 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3392 (buf!3850 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7064 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7059 thiss!1602)))))))

(assert (=> d!53373 d!53389))

(declare-fun d!53391 () Bool)

(assert (=> d!53391 (= (invariant!0 (currentBit!7059 thiss!1602) (currentByte!7064 thiss!1602) (size!3392 (buf!3850 thiss!1602))) (and (bvsge (currentBit!7059 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7059 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7064 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7064 thiss!1602) (size!3392 (buf!3850 thiss!1602))) (and (= (currentBit!7059 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7064 thiss!1602) (size!3392 (buf!3850 thiss!1602)))))))))

(assert (=> d!53375 d!53391))

(check-sat)
