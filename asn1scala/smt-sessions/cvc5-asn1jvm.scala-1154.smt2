; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32650 () Bool)

(assert start!32650)

(declare-fun res!133784 () Bool)

(declare-fun e!109783 () Bool)

(assert (=> start!32650 (=> (not res!133784) (not e!109783))))

(declare-datatypes ((array!7687 0))(
  ( (array!7688 (arr!4396 (Array (_ BitVec 32) (_ BitVec 8))) (size!3475 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6118 0))(
  ( (BitStream!6119 (buf!3933 array!7687) (currentByte!7215 (_ BitVec 32)) (currentBit!7210 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6118)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32650 (= res!133784 (validate_offset_byte!0 ((_ sign_extend 32) (size!3475 (buf!3933 thiss!1602))) ((_ sign_extend 32) (currentByte!7215 thiss!1602)) ((_ sign_extend 32) (currentBit!7210 thiss!1602))))))

(assert (=> start!32650 e!109783))

(declare-fun e!109784 () Bool)

(declare-fun inv!12 (BitStream!6118) Bool)

(assert (=> start!32650 (and (inv!12 thiss!1602) e!109784)))

(declare-fun b!160343 () Bool)

(declare-fun lt!252951 () (_ BitVec 32))

(assert (=> b!160343 (= e!109783 (or (bvslt lt!252951 #b00000000000000000000000000000000) (bvsge lt!252951 #b00000000000000000000000000001001)))))

(assert (=> b!160343 (= lt!252951 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7210 thiss!1602)))))))))

(declare-fun b!160344 () Bool)

(declare-fun array_inv!3222 (array!7687) Bool)

(assert (=> b!160344 (= e!109784 (array_inv!3222 (buf!3933 thiss!1602)))))

(assert (= (and start!32650 res!133784) b!160343))

(assert (= start!32650 b!160344))

(declare-fun m!253129 () Bool)

(assert (=> start!32650 m!253129))

(declare-fun m!253131 () Bool)

(assert (=> start!32650 m!253131))

(declare-fun m!253133 () Bool)

(assert (=> b!160344 m!253133))

(push 1)

(assert (not start!32650))

(assert (not b!160344))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54135 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54135 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3475 (buf!3933 thiss!1602))) ((_ sign_extend 32) (currentByte!7215 thiss!1602)) ((_ sign_extend 32) (currentBit!7210 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3475 (buf!3933 thiss!1602))) ((_ sign_extend 32) (currentByte!7215 thiss!1602)) ((_ sign_extend 32) (currentBit!7210 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13410 () Bool)

(assert (= bs!13410 d!54135))

(declare-fun m!253151 () Bool)

(assert (=> bs!13410 m!253151))

(assert (=> start!32650 d!54135))

(declare-fun d!54137 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54137 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7210 thiss!1602) (currentByte!7215 thiss!1602) (size!3475 (buf!3933 thiss!1602))))))

(declare-fun bs!13412 () Bool)

(assert (= bs!13412 d!54137))

(declare-fun m!253155 () Bool)

(assert (=> bs!13412 m!253155))

(assert (=> start!32650 d!54137))

(declare-fun d!54143 () Bool)

(assert (=> d!54143 (= (array_inv!3222 (buf!3933 thiss!1602)) (bvsge (size!3475 (buf!3933 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160344 d!54143))

(push 1)

(assert (not d!54137))

(assert (not d!54135))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54151 () Bool)

(assert (=> d!54151 (= (invariant!0 (currentBit!7210 thiss!1602) (currentByte!7215 thiss!1602) (size!3475 (buf!3933 thiss!1602))) (and (bvsge (currentBit!7210 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7210 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7215 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7215 thiss!1602) (size!3475 (buf!3933 thiss!1602))) (and (= (currentBit!7210 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7215 thiss!1602) (size!3475 (buf!3933 thiss!1602)))))))))

(assert (=> d!54137 d!54151))

(declare-fun d!54153 () Bool)

(assert (=> d!54153 (= (remainingBits!0 ((_ sign_extend 32) (size!3475 (buf!3933 thiss!1602))) ((_ sign_extend 32) (currentByte!7215 thiss!1602)) ((_ sign_extend 32) (currentBit!7210 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3475 (buf!3933 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7215 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7210 thiss!1602)))))))

(assert (=> d!54135 d!54153))

(push 1)

(check-sat)

