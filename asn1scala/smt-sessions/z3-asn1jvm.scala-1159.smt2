; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32760 () Bool)

(assert start!32760)

(declare-fun res!133832 () Bool)

(declare-fun e!109927 () Bool)

(assert (=> start!32760 (=> (not res!133832) (not e!109927))))

(declare-datatypes ((array!7728 0))(
  ( (array!7729 (arr!4412 (Array (_ BitVec 32) (_ BitVec 8))) (size!3491 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6150 0))(
  ( (BitStream!6151 (buf!3949 array!7728) (currentByte!7252 (_ BitVec 32)) (currentBit!7247 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6150)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32760 (= res!133832 (validate_offset_byte!0 ((_ sign_extend 32) (size!3491 (buf!3949 thiss!1602))) ((_ sign_extend 32) (currentByte!7252 thiss!1602)) ((_ sign_extend 32) (currentBit!7247 thiss!1602))))))

(assert (=> start!32760 e!109927))

(declare-fun e!109928 () Bool)

(declare-fun inv!12 (BitStream!6150) Bool)

(assert (=> start!32760 (and (inv!12 thiss!1602) e!109928)))

(declare-fun b!160439 () Bool)

(assert (=> b!160439 (= e!109927 (or (bvslt (currentByte!7252 thiss!1602) #b00000000000000000000000000000000) (bvsge (currentByte!7252 thiss!1602) (size!3491 (buf!3949 thiss!1602)))))))

(declare-fun b!160440 () Bool)

(declare-fun array_inv!3238 (array!7728) Bool)

(assert (=> b!160440 (= e!109928 (array_inv!3238 (buf!3949 thiss!1602)))))

(assert (= (and start!32760 res!133832) b!160439))

(assert (= start!32760 b!160440))

(declare-fun m!253303 () Bool)

(assert (=> start!32760 m!253303))

(declare-fun m!253305 () Bool)

(assert (=> start!32760 m!253305))

(declare-fun m!253307 () Bool)

(assert (=> b!160440 m!253307))

(check-sat (not start!32760) (not b!160440))
(check-sat)
(get-model)

(declare-fun d!54223 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54223 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3491 (buf!3949 thiss!1602))) ((_ sign_extend 32) (currentByte!7252 thiss!1602)) ((_ sign_extend 32) (currentBit!7247 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3491 (buf!3949 thiss!1602))) ((_ sign_extend 32) (currentByte!7252 thiss!1602)) ((_ sign_extend 32) (currentBit!7247 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13444 () Bool)

(assert (= bs!13444 d!54223))

(declare-fun m!253315 () Bool)

(assert (=> bs!13444 m!253315))

(assert (=> start!32760 d!54223))

(declare-fun d!54225 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54225 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7247 thiss!1602) (currentByte!7252 thiss!1602) (size!3491 (buf!3949 thiss!1602))))))

(declare-fun bs!13445 () Bool)

(assert (= bs!13445 d!54225))

(declare-fun m!253317 () Bool)

(assert (=> bs!13445 m!253317))

(assert (=> start!32760 d!54225))

(declare-fun d!54229 () Bool)

(assert (=> d!54229 (= (array_inv!3238 (buf!3949 thiss!1602)) (bvsge (size!3491 (buf!3949 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160440 d!54229))

(check-sat (not d!54225) (not d!54223))
(check-sat)
(get-model)

(declare-fun d!54239 () Bool)

(assert (=> d!54239 (= (invariant!0 (currentBit!7247 thiss!1602) (currentByte!7252 thiss!1602) (size!3491 (buf!3949 thiss!1602))) (and (bvsge (currentBit!7247 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7247 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7252 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7252 thiss!1602) (size!3491 (buf!3949 thiss!1602))) (and (= (currentBit!7247 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7252 thiss!1602) (size!3491 (buf!3949 thiss!1602)))))))))

(assert (=> d!54225 d!54239))

(declare-fun d!54243 () Bool)

(assert (=> d!54243 (= (remainingBits!0 ((_ sign_extend 32) (size!3491 (buf!3949 thiss!1602))) ((_ sign_extend 32) (currentByte!7252 thiss!1602)) ((_ sign_extend 32) (currentBit!7247 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3491 (buf!3949 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7252 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7247 thiss!1602)))))))

(assert (=> d!54223 d!54243))

(check-sat)
