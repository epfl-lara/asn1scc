; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32530 () Bool)

(assert start!32530)

(declare-fun res!133739 () Bool)

(declare-fun e!109648 () Bool)

(assert (=> start!32530 (=> (not res!133739) (not e!109648))))

(declare-datatypes ((array!7648 0))(
  ( (array!7649 (arr!4381 (Array (_ BitVec 32) (_ BitVec 8))) (size!3460 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6088 0))(
  ( (BitStream!6089 (buf!3918 array!7648) (currentByte!7173 (_ BitVec 32)) (currentBit!7168 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6088)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32530 (= res!133739 (validate_offset_byte!0 ((_ sign_extend 32) (size!3460 (buf!3918 thiss!1602))) ((_ sign_extend 32) (currentByte!7173 thiss!1602)) ((_ sign_extend 32) (currentBit!7168 thiss!1602))))))

(assert (=> start!32530 e!109648))

(declare-fun e!109649 () Bool)

(declare-fun inv!12 (BitStream!6088) Bool)

(assert (=> start!32530 (and (inv!12 thiss!1602) e!109649)))

(declare-fun b!160253 () Bool)

(assert (=> b!160253 (= e!109648 (bvsge (currentBit!7168 thiss!1602) #b00000000000000000000000010000000))))

(declare-fun b!160254 () Bool)

(declare-fun array_inv!3207 (array!7648) Bool)

(assert (=> b!160254 (= e!109649 (array_inv!3207 (buf!3918 thiss!1602)))))

(assert (= (and start!32530 res!133739) b!160253))

(assert (= start!32530 b!160254))

(declare-fun m!253003 () Bool)

(assert (=> start!32530 m!253003))

(declare-fun m!253005 () Bool)

(assert (=> start!32530 m!253005))

(declare-fun m!253007 () Bool)

(assert (=> b!160254 m!253007))

(push 1)

(assert (not start!32530))

(assert (not b!160254))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54031 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54031 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3460 (buf!3918 thiss!1602))) ((_ sign_extend 32) (currentByte!7173 thiss!1602)) ((_ sign_extend 32) (currentBit!7168 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3460 (buf!3918 thiss!1602))) ((_ sign_extend 32) (currentByte!7173 thiss!1602)) ((_ sign_extend 32) (currentBit!7168 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13376 () Bool)

(assert (= bs!13376 d!54031))

(declare-fun m!253023 () Bool)

(assert (=> bs!13376 m!253023))

(assert (=> start!32530 d!54031))

(declare-fun d!54035 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54035 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7168 thiss!1602) (currentByte!7173 thiss!1602) (size!3460 (buf!3918 thiss!1602))))))

(declare-fun bs!13378 () Bool)

(assert (= bs!13378 d!54035))

(declare-fun m!253027 () Bool)

(assert (=> bs!13378 m!253027))

(assert (=> start!32530 d!54035))

(declare-fun d!54039 () Bool)

(assert (=> d!54039 (= (array_inv!3207 (buf!3918 thiss!1602)) (bvsge (size!3460 (buf!3918 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160254 d!54039))

(push 1)

(assert (not d!54031))

(assert (not d!54035))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54051 () Bool)

(assert (=> d!54051 (= (remainingBits!0 ((_ sign_extend 32) (size!3460 (buf!3918 thiss!1602))) ((_ sign_extend 32) (currentByte!7173 thiss!1602)) ((_ sign_extend 32) (currentBit!7168 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3460 (buf!3918 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7173 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7168 thiss!1602)))))))

(assert (=> d!54031 d!54051))

(declare-fun d!54053 () Bool)

(assert (=> d!54053 (= (invariant!0 (currentBit!7168 thiss!1602) (currentByte!7173 thiss!1602) (size!3460 (buf!3918 thiss!1602))) (and (bvsge (currentBit!7168 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7168 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7173 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7173 thiss!1602) (size!3460 (buf!3918 thiss!1602))) (and (= (currentBit!7168 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7173 thiss!1602) (size!3460 (buf!3918 thiss!1602)))))))))

(assert (=> d!54035 d!54053))

(push 1)

(check-sat)

