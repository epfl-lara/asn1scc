; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32846 () Bool)

(assert start!32846)

(declare-fun res!133862 () Bool)

(declare-fun e!110017 () Bool)

(assert (=> start!32846 (=> (not res!133862) (not e!110017))))

(declare-datatypes ((array!7755 0))(
  ( (array!7756 (arr!4422 (Array (_ BitVec 32) (_ BitVec 8))) (size!3501 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6170 0))(
  ( (BitStream!6171 (buf!3959 array!7755) (currentByte!7281 (_ BitVec 32)) (currentBit!7276 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6170)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32846 (= res!133862 (validate_offset_byte!0 ((_ sign_extend 32) (size!3501 (buf!3959 thiss!1602))) ((_ sign_extend 32) (currentByte!7281 thiss!1602)) ((_ sign_extend 32) (currentBit!7276 thiss!1602))))))

(assert (=> start!32846 e!110017))

(declare-fun e!110018 () Bool)

(declare-fun inv!12 (BitStream!6170) Bool)

(assert (=> start!32846 (and (inv!12 thiss!1602) e!110018)))

(declare-fun b!160499 () Bool)

(assert (=> b!160499 (= e!110017 (bvsgt ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7276 thiss!1602))) #b00000000000000000000000000100000))))

(declare-fun b!160500 () Bool)

(declare-fun array_inv!3248 (array!7755) Bool)

(assert (=> b!160500 (= e!110018 (array_inv!3248 (buf!3959 thiss!1602)))))

(assert (= (and start!32846 res!133862) b!160499))

(assert (= start!32846 b!160500))

(declare-fun m!253423 () Bool)

(assert (=> start!32846 m!253423))

(declare-fun m!253425 () Bool)

(assert (=> start!32846 m!253425))

(declare-fun m!253427 () Bool)

(assert (=> b!160500 m!253427))

(push 1)

(assert (not b!160500))

(assert (not start!32846))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54305 () Bool)

(assert (=> d!54305 (= (array_inv!3248 (buf!3959 thiss!1602)) (bvsge (size!3501 (buf!3959 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160500 d!54305))

(declare-fun d!54311 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54311 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3501 (buf!3959 thiss!1602))) ((_ sign_extend 32) (currentByte!7281 thiss!1602)) ((_ sign_extend 32) (currentBit!7276 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3501 (buf!3959 thiss!1602))) ((_ sign_extend 32) (currentByte!7281 thiss!1602)) ((_ sign_extend 32) (currentBit!7276 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13472 () Bool)

(assert (= bs!13472 d!54311))

(declare-fun m!253437 () Bool)

(assert (=> bs!13472 m!253437))

(assert (=> start!32846 d!54311))

(declare-fun d!54313 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54313 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7276 thiss!1602) (currentByte!7281 thiss!1602) (size!3501 (buf!3959 thiss!1602))))))

(declare-fun bs!13473 () Bool)

(assert (= bs!13473 d!54313))

(declare-fun m!253439 () Bool)

(assert (=> bs!13473 m!253439))

(assert (=> start!32846 d!54313))

(push 1)

(assert (not d!54313))

(assert (not d!54311))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54323 () Bool)

(assert (=> d!54323 (= (invariant!0 (currentBit!7276 thiss!1602) (currentByte!7281 thiss!1602) (size!3501 (buf!3959 thiss!1602))) (and (bvsge (currentBit!7276 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7276 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7281 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7281 thiss!1602) (size!3501 (buf!3959 thiss!1602))) (and (= (currentBit!7276 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7281 thiss!1602) (size!3501 (buf!3959 thiss!1602)))))))))

(assert (=> d!54313 d!54323))

(declare-fun d!54325 () Bool)

(assert (=> d!54325 (= (remainingBits!0 ((_ sign_extend 32) (size!3501 (buf!3959 thiss!1602))) ((_ sign_extend 32) (currentByte!7281 thiss!1602)) ((_ sign_extend 32) (currentBit!7276 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3501 (buf!3959 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7281 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7276 thiss!1602)))))))

(assert (=> d!54311 d!54325))

(push 1)

