; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32844 () Bool)

(assert start!32844)

(declare-fun res!133859 () Bool)

(declare-fun e!110008 () Bool)

(assert (=> start!32844 (=> (not res!133859) (not e!110008))))

(declare-datatypes ((array!7753 0))(
  ( (array!7754 (arr!4421 (Array (_ BitVec 32) (_ BitVec 8))) (size!3500 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6168 0))(
  ( (BitStream!6169 (buf!3958 array!7753) (currentByte!7280 (_ BitVec 32)) (currentBit!7275 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6168)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32844 (= res!133859 (validate_offset_byte!0 ((_ sign_extend 32) (size!3500 (buf!3958 thiss!1602))) ((_ sign_extend 32) (currentByte!7280 thiss!1602)) ((_ sign_extend 32) (currentBit!7275 thiss!1602))))))

(assert (=> start!32844 e!110008))

(declare-fun e!110009 () Bool)

(declare-fun inv!12 (BitStream!6168) Bool)

(assert (=> start!32844 (and (inv!12 thiss!1602) e!110009)))

(declare-fun b!160493 () Bool)

(assert (=> b!160493 (= e!110008 (bvsgt ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7275 thiss!1602))) #b00000000000000000000000000100000))))

(declare-fun b!160494 () Bool)

(declare-fun array_inv!3247 (array!7753) Bool)

(assert (=> b!160494 (= e!110009 (array_inv!3247 (buf!3958 thiss!1602)))))

(assert (= (and start!32844 res!133859) b!160493))

(assert (= start!32844 b!160494))

(declare-fun m!253417 () Bool)

(assert (=> start!32844 m!253417))

(declare-fun m!253419 () Bool)

(assert (=> start!32844 m!253419))

(declare-fun m!253421 () Bool)

(assert (=> b!160494 m!253421))

(check-sat (not start!32844) (not b!160494))
(check-sat)
(get-model)

(declare-fun d!54298 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54298 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3500 (buf!3958 thiss!1602))) ((_ sign_extend 32) (currentByte!7280 thiss!1602)) ((_ sign_extend 32) (currentBit!7275 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3500 (buf!3958 thiss!1602))) ((_ sign_extend 32) (currentByte!7280 thiss!1602)) ((_ sign_extend 32) (currentBit!7275 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13469 () Bool)

(assert (= bs!13469 d!54298))

(declare-fun m!253431 () Bool)

(assert (=> bs!13469 m!253431))

(assert (=> start!32844 d!54298))

(declare-fun d!54303 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54303 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7275 thiss!1602) (currentByte!7280 thiss!1602) (size!3500 (buf!3958 thiss!1602))))))

(declare-fun bs!13471 () Bool)

(assert (= bs!13471 d!54303))

(declare-fun m!253435 () Bool)

(assert (=> bs!13471 m!253435))

(assert (=> start!32844 d!54303))

(declare-fun d!54309 () Bool)

(assert (=> d!54309 (= (array_inv!3247 (buf!3958 thiss!1602)) (bvsge (size!3500 (buf!3958 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160494 d!54309))

(check-sat (not d!54303) (not d!54298))
(check-sat)
(get-model)

(declare-fun d!54315 () Bool)

(assert (=> d!54315 (= (invariant!0 (currentBit!7275 thiss!1602) (currentByte!7280 thiss!1602) (size!3500 (buf!3958 thiss!1602))) (and (bvsge (currentBit!7275 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7275 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7280 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7280 thiss!1602) (size!3500 (buf!3958 thiss!1602))) (and (= (currentBit!7275 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7280 thiss!1602) (size!3500 (buf!3958 thiss!1602)))))))))

(assert (=> d!54303 d!54315))

(declare-fun d!54317 () Bool)

(assert (=> d!54317 (= (remainingBits!0 ((_ sign_extend 32) (size!3500 (buf!3958 thiss!1602))) ((_ sign_extend 32) (currentByte!7280 thiss!1602)) ((_ sign_extend 32) (currentBit!7275 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3500 (buf!3958 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7280 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7275 thiss!1602)))))))

(assert (=> d!54298 d!54317))

(check-sat)
