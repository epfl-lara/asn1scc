; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32758 () Bool)

(assert start!32758)

(declare-fun res!133829 () Bool)

(declare-fun e!109918 () Bool)

(assert (=> start!32758 (=> (not res!133829) (not e!109918))))

(declare-datatypes ((array!7726 0))(
  ( (array!7727 (arr!4411 (Array (_ BitVec 32) (_ BitVec 8))) (size!3490 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6148 0))(
  ( (BitStream!6149 (buf!3948 array!7726) (currentByte!7251 (_ BitVec 32)) (currentBit!7246 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6148)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32758 (= res!133829 (validate_offset_byte!0 ((_ sign_extend 32) (size!3490 (buf!3948 thiss!1602))) ((_ sign_extend 32) (currentByte!7251 thiss!1602)) ((_ sign_extend 32) (currentBit!7246 thiss!1602))))))

(assert (=> start!32758 e!109918))

(declare-fun e!109919 () Bool)

(declare-fun inv!12 (BitStream!6148) Bool)

(assert (=> start!32758 (and (inv!12 thiss!1602) e!109919)))

(declare-fun b!160433 () Bool)

(assert (=> b!160433 (= e!109918 (or (bvslt (currentByte!7251 thiss!1602) #b00000000000000000000000000000000) (bvsge (currentByte!7251 thiss!1602) (size!3490 (buf!3948 thiss!1602)))))))

(declare-fun b!160434 () Bool)

(declare-fun array_inv!3237 (array!7726) Bool)

(assert (=> b!160434 (= e!109919 (array_inv!3237 (buf!3948 thiss!1602)))))

(assert (= (and start!32758 res!133829) b!160433))

(assert (= start!32758 b!160434))

(declare-fun m!253297 () Bool)

(assert (=> start!32758 m!253297))

(declare-fun m!253299 () Bool)

(assert (=> start!32758 m!253299))

(declare-fun m!253301 () Bool)

(assert (=> b!160434 m!253301))

(push 1)

(assert (not b!160434))

(assert (not start!32758))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54227 () Bool)

(assert (=> d!54227 (= (array_inv!3237 (buf!3948 thiss!1602)) (bvsge (size!3490 (buf!3948 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160434 d!54227))

(declare-fun d!54231 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54231 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3490 (buf!3948 thiss!1602))) ((_ sign_extend 32) (currentByte!7251 thiss!1602)) ((_ sign_extend 32) (currentBit!7246 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3490 (buf!3948 thiss!1602))) ((_ sign_extend 32) (currentByte!7251 thiss!1602)) ((_ sign_extend 32) (currentBit!7246 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13446 () Bool)

(assert (= bs!13446 d!54231))

(declare-fun m!253319 () Bool)

(assert (=> bs!13446 m!253319))

(assert (=> start!32758 d!54231))

(declare-fun d!54233 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54233 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7246 thiss!1602) (currentByte!7251 thiss!1602) (size!3490 (buf!3948 thiss!1602))))))

(declare-fun bs!13447 () Bool)

(assert (= bs!13447 d!54233))

(declare-fun m!253321 () Bool)

(assert (=> bs!13447 m!253321))

(assert (=> start!32758 d!54233))

(push 1)

(assert (not d!54233))

(assert (not d!54231))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54245 () Bool)

(assert (=> d!54245 (= (invariant!0 (currentBit!7246 thiss!1602) (currentByte!7251 thiss!1602) (size!3490 (buf!3948 thiss!1602))) (and (bvsge (currentBit!7246 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7246 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7251 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7251 thiss!1602) (size!3490 (buf!3948 thiss!1602))) (and (= (currentBit!7246 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7251 thiss!1602) (size!3490 (buf!3948 thiss!1602)))))))))

(assert (=> d!54233 d!54245))

(declare-fun d!54247 () Bool)

(assert (=> d!54247 (= (remainingBits!0 ((_ sign_extend 32) (size!3490 (buf!3948 thiss!1602))) ((_ sign_extend 32) (currentByte!7251 thiss!1602)) ((_ sign_extend 32) (currentBit!7246 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3490 (buf!3948 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7251 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7246 thiss!1602)))))))

(assert (=> d!54231 d!54247))

(push 1)

(check-sat)

(pop 1)

