; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32612 () Bool)

(assert start!32612)

(declare-fun res!133772 () Bool)

(declare-fun e!109747 () Bool)

(assert (=> start!32612 (=> (not res!133772) (not e!109747))))

(declare-datatypes ((array!7676 0))(
  ( (array!7677 (arr!4392 (Array (_ BitVec 32) (_ BitVec 8))) (size!3471 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6110 0))(
  ( (BitStream!6111 (buf!3929 array!7676) (currentByte!7202 (_ BitVec 32)) (currentBit!7197 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6110)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32612 (= res!133772 (validate_offset_byte!0 ((_ sign_extend 32) (size!3471 (buf!3929 thiss!1602))) ((_ sign_extend 32) (currentByte!7202 thiss!1602)) ((_ sign_extend 32) (currentBit!7197 thiss!1602))))))

(assert (=> start!32612 e!109747))

(declare-fun e!109748 () Bool)

(declare-fun inv!12 (BitStream!6110) Bool)

(assert (=> start!32612 (and (inv!12 thiss!1602) e!109748)))

(declare-fun b!160319 () Bool)

(assert (=> b!160319 (= e!109747 (bvsge (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7197 thiss!1602)))) #b00000000000000000000000010000000))))

(declare-fun b!160320 () Bool)

(declare-fun array_inv!3218 (array!7676) Bool)

(assert (=> b!160320 (= e!109748 (array_inv!3218 (buf!3929 thiss!1602)))))

(assert (= (and start!32612 res!133772) b!160319))

(assert (= start!32612 b!160320))

(declare-fun m!253093 () Bool)

(assert (=> start!32612 m!253093))

(declare-fun m!253095 () Bool)

(assert (=> start!32612 m!253095))

(declare-fun m!253097 () Bool)

(assert (=> b!160320 m!253097))

(push 1)

(assert (not b!160320))

(assert (not start!32612))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54097 () Bool)

(assert (=> d!54097 (= (array_inv!3218 (buf!3929 thiss!1602)) (bvsge (size!3471 (buf!3929 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160320 d!54097))

(declare-fun d!54099 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54099 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3471 (buf!3929 thiss!1602))) ((_ sign_extend 32) (currentByte!7202 thiss!1602)) ((_ sign_extend 32) (currentBit!7197 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3471 (buf!3929 thiss!1602))) ((_ sign_extend 32) (currentByte!7202 thiss!1602)) ((_ sign_extend 32) (currentBit!7197 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13397 () Bool)

(assert (= bs!13397 d!54099))

(declare-fun m!253101 () Bool)

(assert (=> bs!13397 m!253101))

(assert (=> start!32612 d!54099))

(declare-fun d!54103 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54103 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7197 thiss!1602) (currentByte!7202 thiss!1602) (size!3471 (buf!3929 thiss!1602))))))

(declare-fun bs!13399 () Bool)

(assert (= bs!13399 d!54103))

(declare-fun m!253105 () Bool)

(assert (=> bs!13399 m!253105))

(assert (=> start!32612 d!54103))

(push 1)

(assert (not d!54103))

(assert (not d!54099))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54117 () Bool)

(assert (=> d!54117 (= (invariant!0 (currentBit!7197 thiss!1602) (currentByte!7202 thiss!1602) (size!3471 (buf!3929 thiss!1602))) (and (bvsge (currentBit!7197 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7197 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7202 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7202 thiss!1602) (size!3471 (buf!3929 thiss!1602))) (and (= (currentBit!7197 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7202 thiss!1602) (size!3471 (buf!3929 thiss!1602)))))))))

(assert (=> d!54103 d!54117))

(declare-fun d!54121 () Bool)

(assert (=> d!54121 (= (remainingBits!0 ((_ sign_extend 32) (size!3471 (buf!3929 thiss!1602))) ((_ sign_extend 32) (currentByte!7202 thiss!1602)) ((_ sign_extend 32) (currentBit!7197 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3471 (buf!3929 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7202 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7197 thiss!1602)))))))

(assert (=> d!54099 d!54121))

(push 1)

(check-sat)

