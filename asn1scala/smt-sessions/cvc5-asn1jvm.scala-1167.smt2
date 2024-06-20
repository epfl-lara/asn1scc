; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33020 () Bool)

(assert start!33020)

(declare-fun res!133901 () Bool)

(declare-fun e!110134 () Bool)

(assert (=> start!33020 (=> (not res!133901) (not e!110134))))

(declare-datatypes ((array!7796 0))(
  ( (array!7797 (arr!4435 (Array (_ BitVec 32) (_ BitVec 8))) (size!3514 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6196 0))(
  ( (BitStream!6197 (buf!3972 array!7796) (currentByte!7338 (_ BitVec 32)) (currentBit!7333 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6196)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33020 (= res!133901 (validate_offset_byte!0 ((_ sign_extend 32) (size!3514 (buf!3972 thiss!1602))) ((_ sign_extend 32) (currentByte!7338 thiss!1602)) ((_ sign_extend 32) (currentBit!7333 thiss!1602))))))

(assert (=> start!33020 e!110134))

(declare-fun e!110135 () Bool)

(declare-fun inv!12 (BitStream!6196) Bool)

(assert (=> start!33020 (and (inv!12 thiss!1602) e!110135)))

(declare-fun b!160577 () Bool)

(assert (=> b!160577 (= e!110134 (and (bvslt (currentByte!7338 thiss!1602) (size!3514 (buf!3972 thiss!1602))) (bvslt (currentByte!7338 thiss!1602) #b00000000000000000000000000000000)))))

(declare-fun b!160578 () Bool)

(declare-fun array_inv!3261 (array!7796) Bool)

(assert (=> b!160578 (= e!110135 (array_inv!3261 (buf!3972 thiss!1602)))))

(assert (= (and start!33020 res!133901) b!160577))

(assert (= start!33020 b!160578))

(declare-fun m!253597 () Bool)

(assert (=> start!33020 m!253597))

(declare-fun m!253599 () Bool)

(assert (=> start!33020 m!253599))

(declare-fun m!253601 () Bool)

(assert (=> b!160578 m!253601))

(push 1)

(assert (not start!33020))

(assert (not b!160578))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54467 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54467 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3514 (buf!3972 thiss!1602))) ((_ sign_extend 32) (currentByte!7338 thiss!1602)) ((_ sign_extend 32) (currentBit!7333 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3514 (buf!3972 thiss!1602))) ((_ sign_extend 32) (currentByte!7338 thiss!1602)) ((_ sign_extend 32) (currentBit!7333 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13516 () Bool)

(assert (= bs!13516 d!54467))

(declare-fun m!253615 () Bool)

(assert (=> bs!13516 m!253615))

(assert (=> start!33020 d!54467))

(declare-fun d!54469 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54469 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7333 thiss!1602) (currentByte!7338 thiss!1602) (size!3514 (buf!3972 thiss!1602))))))

(declare-fun bs!13517 () Bool)

(assert (= bs!13517 d!54469))

(declare-fun m!253617 () Bool)

(assert (=> bs!13517 m!253617))

(assert (=> start!33020 d!54469))

(declare-fun d!54471 () Bool)

(assert (=> d!54471 (= (array_inv!3261 (buf!3972 thiss!1602)) (bvsge (size!3514 (buf!3972 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160578 d!54471))

(push 1)

(assert (not d!54469))

(assert (not d!54467))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54485 () Bool)

(assert (=> d!54485 (= (invariant!0 (currentBit!7333 thiss!1602) (currentByte!7338 thiss!1602) (size!3514 (buf!3972 thiss!1602))) (and (bvsge (currentBit!7333 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7333 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7338 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7338 thiss!1602) (size!3514 (buf!3972 thiss!1602))) (and (= (currentBit!7333 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7338 thiss!1602) (size!3514 (buf!3972 thiss!1602)))))))))

(assert (=> d!54469 d!54485))

(declare-fun d!54487 () Bool)

(assert (=> d!54487 (= (remainingBits!0 ((_ sign_extend 32) (size!3514 (buf!3972 thiss!1602))) ((_ sign_extend 32) (currentByte!7338 thiss!1602)) ((_ sign_extend 32) (currentBit!7333 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3514 (buf!3972 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7338 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7333 thiss!1602)))))))

(assert (=> d!54467 d!54487))

(push 1)

(check-sat)

(pop 1)

