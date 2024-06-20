; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32610 () Bool)

(assert start!32610)

(declare-fun res!133769 () Bool)

(declare-fun e!109738 () Bool)

(assert (=> start!32610 (=> (not res!133769) (not e!109738))))

(declare-datatypes ((array!7674 0))(
  ( (array!7675 (arr!4391 (Array (_ BitVec 32) (_ BitVec 8))) (size!3470 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6108 0))(
  ( (BitStream!6109 (buf!3928 array!7674) (currentByte!7201 (_ BitVec 32)) (currentBit!7196 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6108)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32610 (= res!133769 (validate_offset_byte!0 ((_ sign_extend 32) (size!3470 (buf!3928 thiss!1602))) ((_ sign_extend 32) (currentByte!7201 thiss!1602)) ((_ sign_extend 32) (currentBit!7196 thiss!1602))))))

(assert (=> start!32610 e!109738))

(declare-fun e!109739 () Bool)

(declare-fun inv!12 (BitStream!6108) Bool)

(assert (=> start!32610 (and (inv!12 thiss!1602) e!109739)))

(declare-fun b!160313 () Bool)

(assert (=> b!160313 (= e!109738 (bvsge (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7196 thiss!1602)))) #b00000000000000000000000010000000))))

(declare-fun b!160314 () Bool)

(declare-fun array_inv!3217 (array!7674) Bool)

(assert (=> b!160314 (= e!109739 (array_inv!3217 (buf!3928 thiss!1602)))))

(assert (= (and start!32610 res!133769) b!160313))

(assert (= start!32610 b!160314))

(declare-fun m!253087 () Bool)

(assert (=> start!32610 m!253087))

(declare-fun m!253089 () Bool)

(assert (=> start!32610 m!253089))

(declare-fun m!253091 () Bool)

(assert (=> b!160314 m!253091))

(check-sat (not b!160314) (not start!32610))
(check-sat)
(get-model)

(declare-fun d!54107 () Bool)

(assert (=> d!54107 (= (array_inv!3217 (buf!3928 thiss!1602)) (bvsge (size!3470 (buf!3928 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160314 d!54107))

(declare-fun d!54109 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54109 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3470 (buf!3928 thiss!1602))) ((_ sign_extend 32) (currentByte!7201 thiss!1602)) ((_ sign_extend 32) (currentBit!7196 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3470 (buf!3928 thiss!1602))) ((_ sign_extend 32) (currentByte!7201 thiss!1602)) ((_ sign_extend 32) (currentBit!7196 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13400 () Bool)

(assert (= bs!13400 d!54109))

(declare-fun m!253107 () Bool)

(assert (=> bs!13400 m!253107))

(assert (=> start!32610 d!54109))

(declare-fun d!54111 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54111 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7196 thiss!1602) (currentByte!7201 thiss!1602) (size!3470 (buf!3928 thiss!1602))))))

(declare-fun bs!13401 () Bool)

(assert (= bs!13401 d!54111))

(declare-fun m!253109 () Bool)

(assert (=> bs!13401 m!253109))

(assert (=> start!32610 d!54111))

(check-sat (not d!54109) (not d!54111))
(check-sat)
(get-model)

(declare-fun d!54119 () Bool)

(assert (=> d!54119 (= (remainingBits!0 ((_ sign_extend 32) (size!3470 (buf!3928 thiss!1602))) ((_ sign_extend 32) (currentByte!7201 thiss!1602)) ((_ sign_extend 32) (currentBit!7196 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3470 (buf!3928 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7201 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7196 thiss!1602)))))))

(assert (=> d!54109 d!54119))

(declare-fun d!54123 () Bool)

(assert (=> d!54123 (= (invariant!0 (currentBit!7196 thiss!1602) (currentByte!7201 thiss!1602) (size!3470 (buf!3928 thiss!1602))) (and (bvsge (currentBit!7196 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7196 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7201 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7201 thiss!1602) (size!3470 (buf!3928 thiss!1602))) (and (= (currentBit!7196 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7201 thiss!1602) (size!3470 (buf!3928 thiss!1602)))))))))

(assert (=> d!54111 d!54123))

(check-sat)
