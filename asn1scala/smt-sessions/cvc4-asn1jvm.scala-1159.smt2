; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32762 () Bool)

(assert start!32762)

(declare-fun res!133835 () Bool)

(declare-fun e!109936 () Bool)

(assert (=> start!32762 (=> (not res!133835) (not e!109936))))

(declare-datatypes ((array!7730 0))(
  ( (array!7731 (arr!4413 (Array (_ BitVec 32) (_ BitVec 8))) (size!3492 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6152 0))(
  ( (BitStream!6153 (buf!3950 array!7730) (currentByte!7253 (_ BitVec 32)) (currentBit!7248 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6152)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32762 (= res!133835 (validate_offset_byte!0 ((_ sign_extend 32) (size!3492 (buf!3950 thiss!1602))) ((_ sign_extend 32) (currentByte!7253 thiss!1602)) ((_ sign_extend 32) (currentBit!7248 thiss!1602))))))

(assert (=> start!32762 e!109936))

(declare-fun e!109937 () Bool)

(declare-fun inv!12 (BitStream!6152) Bool)

(assert (=> start!32762 (and (inv!12 thiss!1602) e!109937)))

(declare-fun b!160445 () Bool)

(assert (=> b!160445 (= e!109936 (or (bvslt (currentByte!7253 thiss!1602) #b00000000000000000000000000000000) (bvsge (currentByte!7253 thiss!1602) (size!3492 (buf!3950 thiss!1602)))))))

(declare-fun b!160446 () Bool)

(declare-fun array_inv!3239 (array!7730) Bool)

(assert (=> b!160446 (= e!109937 (array_inv!3239 (buf!3950 thiss!1602)))))

(assert (= (and start!32762 res!133835) b!160445))

(assert (= start!32762 b!160446))

(declare-fun m!253309 () Bool)

(assert (=> start!32762 m!253309))

(declare-fun m!253311 () Bool)

(assert (=> start!32762 m!253311))

(declare-fun m!253313 () Bool)

(assert (=> b!160446 m!253313))

(push 1)

(assert (not start!32762))

(assert (not b!160446))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54235 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54235 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3492 (buf!3950 thiss!1602))) ((_ sign_extend 32) (currentByte!7253 thiss!1602)) ((_ sign_extend 32) (currentBit!7248 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3492 (buf!3950 thiss!1602))) ((_ sign_extend 32) (currentByte!7253 thiss!1602)) ((_ sign_extend 32) (currentBit!7248 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13448 () Bool)

(assert (= bs!13448 d!54235))

(declare-fun m!253323 () Bool)

(assert (=> bs!13448 m!253323))

(assert (=> start!32762 d!54235))

(declare-fun d!54237 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54237 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7248 thiss!1602) (currentByte!7253 thiss!1602) (size!3492 (buf!3950 thiss!1602))))))

(declare-fun bs!13449 () Bool)

(assert (= bs!13449 d!54237))

(declare-fun m!253325 () Bool)

(assert (=> bs!13449 m!253325))

(assert (=> start!32762 d!54237))

(declare-fun d!54241 () Bool)

(assert (=> d!54241 (= (array_inv!3239 (buf!3950 thiss!1602)) (bvsge (size!3492 (buf!3950 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160446 d!54241))

(push 1)

(assert (not d!54237))

(assert (not d!54235))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54249 () Bool)

(assert (=> d!54249 (= (invariant!0 (currentBit!7248 thiss!1602) (currentByte!7253 thiss!1602) (size!3492 (buf!3950 thiss!1602))) (and (bvsge (currentBit!7248 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7248 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7253 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7253 thiss!1602) (size!3492 (buf!3950 thiss!1602))) (and (= (currentBit!7248 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7253 thiss!1602) (size!3492 (buf!3950 thiss!1602)))))))))

(assert (=> d!54237 d!54249))

(declare-fun d!54251 () Bool)

(assert (=> d!54251 (= (remainingBits!0 ((_ sign_extend 32) (size!3492 (buf!3950 thiss!1602))) ((_ sign_extend 32) (currentByte!7253 thiss!1602)) ((_ sign_extend 32) (currentBit!7248 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3492 (buf!3950 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7253 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7248 thiss!1602)))))))

(assert (=> d!54235 d!54251))

(push 1)

(check-sat)

