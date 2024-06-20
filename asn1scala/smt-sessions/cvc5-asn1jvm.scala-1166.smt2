; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32986 () Bool)

(assert start!32986)

(declare-fun res!133892 () Bool)

(declare-fun e!110107 () Bool)

(assert (=> start!32986 (=> (not res!133892) (not e!110107))))

(declare-datatypes ((array!7787 0))(
  ( (array!7788 (arr!4432 (Array (_ BitVec 32) (_ BitVec 8))) (size!3511 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6190 0))(
  ( (BitStream!6191 (buf!3969 array!7787) (currentByte!7327 (_ BitVec 32)) (currentBit!7322 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6190)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32986 (= res!133892 (validate_offset_byte!0 ((_ sign_extend 32) (size!3511 (buf!3969 thiss!1602))) ((_ sign_extend 32) (currentByte!7327 thiss!1602)) ((_ sign_extend 32) (currentBit!7322 thiss!1602))))))

(assert (=> start!32986 e!110107))

(declare-fun e!110108 () Bool)

(declare-fun inv!12 (BitStream!6190) Bool)

(assert (=> start!32986 (and (inv!12 thiss!1602) e!110108)))

(declare-fun b!160559 () Bool)

(assert (=> b!160559 (= e!110107 (and (bvslt (currentByte!7327 thiss!1602) (size!3511 (buf!3969 thiss!1602))) (bvslt (currentByte!7327 thiss!1602) #b00000000000000000000000000000000)))))

(declare-fun b!160560 () Bool)

(declare-fun array_inv!3258 (array!7787) Bool)

(assert (=> b!160560 (= e!110108 (array_inv!3258 (buf!3969 thiss!1602)))))

(assert (= (and start!32986 res!133892) b!160559))

(assert (= start!32986 b!160560))

(declare-fun m!253567 () Bool)

(assert (=> start!32986 m!253567))

(declare-fun m!253569 () Bool)

(assert (=> start!32986 m!253569))

(declare-fun m!253571 () Bool)

(assert (=> b!160560 m!253571))

(push 1)

(assert (not start!32986))

(assert (not b!160560))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54439 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54439 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3511 (buf!3969 thiss!1602))) ((_ sign_extend 32) (currentByte!7327 thiss!1602)) ((_ sign_extend 32) (currentBit!7322 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3511 (buf!3969 thiss!1602))) ((_ sign_extend 32) (currentByte!7327 thiss!1602)) ((_ sign_extend 32) (currentBit!7322 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13507 () Bool)

(assert (= bs!13507 d!54439))

(declare-fun m!253585 () Bool)

(assert (=> bs!13507 m!253585))

(assert (=> start!32986 d!54439))

(declare-fun d!54441 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54441 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7322 thiss!1602) (currentByte!7327 thiss!1602) (size!3511 (buf!3969 thiss!1602))))))

(declare-fun bs!13509 () Bool)

(assert (= bs!13509 d!54441))

(declare-fun m!253589 () Bool)

(assert (=> bs!13509 m!253589))

(assert (=> start!32986 d!54441))

(declare-fun d!54449 () Bool)

(assert (=> d!54449 (= (array_inv!3258 (buf!3969 thiss!1602)) (bvsge (size!3511 (buf!3969 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160560 d!54449))

(push 1)

(assert (not d!54439))

(assert (not d!54441))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54457 () Bool)

(assert (=> d!54457 (= (remainingBits!0 ((_ sign_extend 32) (size!3511 (buf!3969 thiss!1602))) ((_ sign_extend 32) (currentByte!7327 thiss!1602)) ((_ sign_extend 32) (currentBit!7322 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3511 (buf!3969 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7327 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7322 thiss!1602)))))))

(assert (=> d!54439 d!54457))

(declare-fun d!54461 () Bool)

(assert (=> d!54461 (= (invariant!0 (currentBit!7322 thiss!1602) (currentByte!7327 thiss!1602) (size!3511 (buf!3969 thiss!1602))) (and (bvsge (currentBit!7322 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7322 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7327 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7327 thiss!1602) (size!3511 (buf!3969 thiss!1602))) (and (= (currentBit!7322 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7327 thiss!1602) (size!3511 (buf!3969 thiss!1602)))))))))

(assert (=> d!54441 d!54461))

(push 1)

(check-sat)

(pop 1)

