; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32568 () Bool)

(assert start!32568)

(declare-fun res!133751 () Bool)

(declare-fun e!109684 () Bool)

(assert (=> start!32568 (=> (not res!133751) (not e!109684))))

(declare-datatypes ((array!7659 0))(
  ( (array!7660 (arr!4385 (Array (_ BitVec 32) (_ BitVec 8))) (size!3464 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6096 0))(
  ( (BitStream!6097 (buf!3922 array!7659) (currentByte!7186 (_ BitVec 32)) (currentBit!7181 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6096)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32568 (= res!133751 (validate_offset_byte!0 ((_ sign_extend 32) (size!3464 (buf!3922 thiss!1602))) ((_ sign_extend 32) (currentByte!7186 thiss!1602)) ((_ sign_extend 32) (currentBit!7181 thiss!1602))))))

(assert (=> start!32568 e!109684))

(declare-fun e!109685 () Bool)

(declare-fun inv!12 (BitStream!6096) Bool)

(assert (=> start!32568 (and (inv!12 thiss!1602) e!109685)))

(declare-fun b!160277 () Bool)

(assert (=> b!160277 (= e!109684 (and (bvslt (currentBit!7181 thiss!1602) #b00000000000000000000000010000000) (bvslt (currentBit!7181 thiss!1602) #b11111111111111111111111110000000)))))

(declare-fun b!160278 () Bool)

(declare-fun array_inv!3211 (array!7659) Bool)

(assert (=> b!160278 (= e!109685 (array_inv!3211 (buf!3922 thiss!1602)))))

(assert (= (and start!32568 res!133751) b!160277))

(assert (= start!32568 b!160278))

(declare-fun m!253039 () Bool)

(assert (=> start!32568 m!253039))

(declare-fun m!253041 () Bool)

(assert (=> start!32568 m!253041))

(declare-fun m!253043 () Bool)

(assert (=> b!160278 m!253043))

(check-sat (not b!160278) (not start!32568))
(check-sat)
(get-model)

(declare-fun d!54061 () Bool)

(assert (=> d!54061 (= (array_inv!3211 (buf!3922 thiss!1602)) (bvsge (size!3464 (buf!3922 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160278 d!54061))

(declare-fun d!54063 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54063 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3464 (buf!3922 thiss!1602))) ((_ sign_extend 32) (currentByte!7186 thiss!1602)) ((_ sign_extend 32) (currentBit!7181 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3464 (buf!3922 thiss!1602))) ((_ sign_extend 32) (currentByte!7186 thiss!1602)) ((_ sign_extend 32) (currentBit!7181 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13385 () Bool)

(assert (= bs!13385 d!54063))

(declare-fun m!253053 () Bool)

(assert (=> bs!13385 m!253053))

(assert (=> start!32568 d!54063))

(declare-fun d!54069 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54069 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7181 thiss!1602) (currentByte!7186 thiss!1602) (size!3464 (buf!3922 thiss!1602))))))

(declare-fun bs!13388 () Bool)

(assert (= bs!13388 d!54069))

(declare-fun m!253059 () Bool)

(assert (=> bs!13388 m!253059))

(assert (=> start!32568 d!54069))

(check-sat (not d!54069) (not d!54063))
(check-sat)
(get-model)

(declare-fun d!54081 () Bool)

(assert (=> d!54081 (= (invariant!0 (currentBit!7181 thiss!1602) (currentByte!7186 thiss!1602) (size!3464 (buf!3922 thiss!1602))) (and (bvsge (currentBit!7181 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7181 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7186 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7186 thiss!1602) (size!3464 (buf!3922 thiss!1602))) (and (= (currentBit!7181 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7186 thiss!1602) (size!3464 (buf!3922 thiss!1602)))))))))

(assert (=> d!54069 d!54081))

(declare-fun d!54085 () Bool)

(assert (=> d!54085 (= (remainingBits!0 ((_ sign_extend 32) (size!3464 (buf!3922 thiss!1602))) ((_ sign_extend 32) (currentByte!7186 thiss!1602)) ((_ sign_extend 32) (currentBit!7181 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3464 (buf!3922 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7186 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7181 thiss!1602)))))))

(assert (=> d!54063 d!54085))

(check-sat)
