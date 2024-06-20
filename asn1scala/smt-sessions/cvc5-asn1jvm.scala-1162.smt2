; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32842 () Bool)

(assert start!32842)

(declare-fun res!133856 () Bool)

(declare-fun e!109999 () Bool)

(assert (=> start!32842 (=> (not res!133856) (not e!109999))))

(declare-datatypes ((array!7751 0))(
  ( (array!7752 (arr!4420 (Array (_ BitVec 32) (_ BitVec 8))) (size!3499 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6166 0))(
  ( (BitStream!6167 (buf!3957 array!7751) (currentByte!7279 (_ BitVec 32)) (currentBit!7274 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6166)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32842 (= res!133856 (validate_offset_byte!0 ((_ sign_extend 32) (size!3499 (buf!3957 thiss!1602))) ((_ sign_extend 32) (currentByte!7279 thiss!1602)) ((_ sign_extend 32) (currentBit!7274 thiss!1602))))))

(assert (=> start!32842 e!109999))

(declare-fun e!110000 () Bool)

(declare-fun inv!12 (BitStream!6166) Bool)

(assert (=> start!32842 (and (inv!12 thiss!1602) e!110000)))

(declare-fun b!160487 () Bool)

(assert (=> b!160487 (= e!109999 (bvsgt ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7274 thiss!1602))) #b00000000000000000000000000100000))))

(declare-fun b!160488 () Bool)

(declare-fun array_inv!3246 (array!7751) Bool)

(assert (=> b!160488 (= e!110000 (array_inv!3246 (buf!3957 thiss!1602)))))

(assert (= (and start!32842 res!133856) b!160487))

(assert (= start!32842 b!160488))

(declare-fun m!253411 () Bool)

(assert (=> start!32842 m!253411))

(declare-fun m!253413 () Bool)

(assert (=> start!32842 m!253413))

(declare-fun m!253415 () Bool)

(assert (=> b!160488 m!253415))

(push 1)

(assert (not start!32842))

(assert (not b!160488))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54299 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54299 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3499 (buf!3957 thiss!1602))) ((_ sign_extend 32) (currentByte!7279 thiss!1602)) ((_ sign_extend 32) (currentBit!7274 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3499 (buf!3957 thiss!1602))) ((_ sign_extend 32) (currentByte!7279 thiss!1602)) ((_ sign_extend 32) (currentBit!7274 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13468 () Bool)

(assert (= bs!13468 d!54299))

(declare-fun m!253429 () Bool)

(assert (=> bs!13468 m!253429))

(assert (=> start!32842 d!54299))

(declare-fun d!54301 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54301 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7274 thiss!1602) (currentByte!7279 thiss!1602) (size!3499 (buf!3957 thiss!1602))))))

(declare-fun bs!13470 () Bool)

(assert (= bs!13470 d!54301))

(declare-fun m!253433 () Bool)

(assert (=> bs!13470 m!253433))

(assert (=> start!32842 d!54301))

(declare-fun d!54307 () Bool)

(assert (=> d!54307 (= (array_inv!3246 (buf!3957 thiss!1602)) (bvsge (size!3499 (buf!3957 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160488 d!54307))

(push 1)

(assert (not d!54301))

(assert (not d!54299))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54319 () Bool)

(assert (=> d!54319 (= (invariant!0 (currentBit!7274 thiss!1602) (currentByte!7279 thiss!1602) (size!3499 (buf!3957 thiss!1602))) (and (bvsge (currentBit!7274 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7274 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7279 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7279 thiss!1602) (size!3499 (buf!3957 thiss!1602))) (and (= (currentBit!7274 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7279 thiss!1602) (size!3499 (buf!3957 thiss!1602)))))))))

(assert (=> d!54301 d!54319))

(declare-fun d!54321 () Bool)

(assert (=> d!54321 (= (remainingBits!0 ((_ sign_extend 32) (size!3499 (buf!3957 thiss!1602))) ((_ sign_extend 32) (currentByte!7279 thiss!1602)) ((_ sign_extend 32) (currentBit!7274 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3499 (buf!3957 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7279 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7274 thiss!1602)))))))

(assert (=> d!54299 d!54321))

(push 1)

(check-sat)

