; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32988 () Bool)

(assert start!32988)

(declare-fun res!133895 () Bool)

(declare-fun e!110116 () Bool)

(assert (=> start!32988 (=> (not res!133895) (not e!110116))))

(declare-datatypes ((array!7789 0))(
  ( (array!7790 (arr!4433 (Array (_ BitVec 32) (_ BitVec 8))) (size!3512 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6192 0))(
  ( (BitStream!6193 (buf!3970 array!7789) (currentByte!7328 (_ BitVec 32)) (currentBit!7323 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6192)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32988 (= res!133895 (validate_offset_byte!0 ((_ sign_extend 32) (size!3512 (buf!3970 thiss!1602))) ((_ sign_extend 32) (currentByte!7328 thiss!1602)) ((_ sign_extend 32) (currentBit!7323 thiss!1602))))))

(assert (=> start!32988 e!110116))

(declare-fun e!110117 () Bool)

(declare-fun inv!12 (BitStream!6192) Bool)

(assert (=> start!32988 (and (inv!12 thiss!1602) e!110117)))

(declare-fun b!160565 () Bool)

(assert (=> b!160565 (= e!110116 (and (bvslt (currentByte!7328 thiss!1602) (size!3512 (buf!3970 thiss!1602))) (bvslt (currentByte!7328 thiss!1602) #b00000000000000000000000000000000)))))

(declare-fun b!160566 () Bool)

(declare-fun array_inv!3259 (array!7789) Bool)

(assert (=> b!160566 (= e!110117 (array_inv!3259 (buf!3970 thiss!1602)))))

(assert (= (and start!32988 res!133895) b!160565))

(assert (= start!32988 b!160566))

(declare-fun m!253573 () Bool)

(assert (=> start!32988 m!253573))

(declare-fun m!253575 () Bool)

(assert (=> start!32988 m!253575))

(declare-fun m!253577 () Bool)

(assert (=> b!160566 m!253577))

(check-sat (not start!32988) (not b!160566))
(check-sat)
(get-model)

(declare-fun d!54437 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54437 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3512 (buf!3970 thiss!1602))) ((_ sign_extend 32) (currentByte!7328 thiss!1602)) ((_ sign_extend 32) (currentBit!7323 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3512 (buf!3970 thiss!1602))) ((_ sign_extend 32) (currentByte!7328 thiss!1602)) ((_ sign_extend 32) (currentBit!7323 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13508 () Bool)

(assert (= bs!13508 d!54437))

(declare-fun m!253587 () Bool)

(assert (=> bs!13508 m!253587))

(assert (=> start!32988 d!54437))

(declare-fun d!54443 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54443 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7323 thiss!1602) (currentByte!7328 thiss!1602) (size!3512 (buf!3970 thiss!1602))))))

(declare-fun bs!13510 () Bool)

(assert (= bs!13510 d!54443))

(declare-fun m!253591 () Bool)

(assert (=> bs!13510 m!253591))

(assert (=> start!32988 d!54443))

(declare-fun d!54451 () Bool)

(assert (=> d!54451 (= (array_inv!3259 (buf!3970 thiss!1602)) (bvsge (size!3512 (buf!3970 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160566 d!54451))

(check-sat (not d!54437) (not d!54443))
(check-sat)
(get-model)

(declare-fun d!54455 () Bool)

(assert (=> d!54455 (= (remainingBits!0 ((_ sign_extend 32) (size!3512 (buf!3970 thiss!1602))) ((_ sign_extend 32) (currentByte!7328 thiss!1602)) ((_ sign_extend 32) (currentBit!7323 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3512 (buf!3970 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7328 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7323 thiss!1602)))))))

(assert (=> d!54437 d!54455))

(declare-fun d!54459 () Bool)

(assert (=> d!54459 (= (invariant!0 (currentBit!7323 thiss!1602) (currentByte!7328 thiss!1602) (size!3512 (buf!3970 thiss!1602))) (and (bvsge (currentBit!7323 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7323 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7328 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7328 thiss!1602) (size!3512 (buf!3970 thiss!1602))) (and (= (currentBit!7323 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7328 thiss!1602) (size!3512 (buf!3970 thiss!1602)))))))))

(assert (=> d!54443 d!54459))

(check-sat)
