; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32608 () Bool)

(assert start!32608)

(declare-fun res!133766 () Bool)

(declare-fun e!109729 () Bool)

(assert (=> start!32608 (=> (not res!133766) (not e!109729))))

(declare-datatypes ((array!7672 0))(
  ( (array!7673 (arr!4390 (Array (_ BitVec 32) (_ BitVec 8))) (size!3469 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6106 0))(
  ( (BitStream!6107 (buf!3927 array!7672) (currentByte!7200 (_ BitVec 32)) (currentBit!7195 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6106)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32608 (= res!133766 (validate_offset_byte!0 ((_ sign_extend 32) (size!3469 (buf!3927 thiss!1602))) ((_ sign_extend 32) (currentByte!7200 thiss!1602)) ((_ sign_extend 32) (currentBit!7195 thiss!1602))))))

(assert (=> start!32608 e!109729))

(declare-fun e!109730 () Bool)

(declare-fun inv!12 (BitStream!6106) Bool)

(assert (=> start!32608 (and (inv!12 thiss!1602) e!109730)))

(declare-fun b!160307 () Bool)

(assert (=> b!160307 (= e!109729 (bvsge (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7195 thiss!1602)))) #b00000000000000000000000010000000))))

(declare-fun b!160308 () Bool)

(declare-fun array_inv!3216 (array!7672) Bool)

(assert (=> b!160308 (= e!109730 (array_inv!3216 (buf!3927 thiss!1602)))))

(assert (= (and start!32608 res!133766) b!160307))

(assert (= start!32608 b!160308))

(declare-fun m!253081 () Bool)

(assert (=> start!32608 m!253081))

(declare-fun m!253083 () Bool)

(assert (=> start!32608 m!253083))

(declare-fun m!253085 () Bool)

(assert (=> b!160308 m!253085))

(push 1)

(assert (not start!32608))

(assert (not b!160308))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54095 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54095 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3469 (buf!3927 thiss!1602))) ((_ sign_extend 32) (currentByte!7200 thiss!1602)) ((_ sign_extend 32) (currentBit!7195 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3469 (buf!3927 thiss!1602))) ((_ sign_extend 32) (currentByte!7200 thiss!1602)) ((_ sign_extend 32) (currentBit!7195 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13396 () Bool)

(assert (= bs!13396 d!54095))

(declare-fun m!253099 () Bool)

(assert (=> bs!13396 m!253099))

(assert (=> start!32608 d!54095))

(declare-fun d!54101 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54101 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7195 thiss!1602) (currentByte!7200 thiss!1602) (size!3469 (buf!3927 thiss!1602))))))

(declare-fun bs!13398 () Bool)

(assert (= bs!13398 d!54101))

(declare-fun m!253103 () Bool)

(assert (=> bs!13398 m!253103))

(assert (=> start!32608 d!54101))

(declare-fun d!54105 () Bool)

(assert (=> d!54105 (= (array_inv!3216 (buf!3927 thiss!1602)) (bvsge (size!3469 (buf!3927 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160308 d!54105))

(push 1)

(assert (not d!54101))

(assert (not d!54095))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54113 () Bool)

(assert (=> d!54113 (= (invariant!0 (currentBit!7195 thiss!1602) (currentByte!7200 thiss!1602) (size!3469 (buf!3927 thiss!1602))) (and (bvsge (currentBit!7195 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7195 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7200 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7200 thiss!1602) (size!3469 (buf!3927 thiss!1602))) (and (= (currentBit!7195 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7200 thiss!1602) (size!3469 (buf!3927 thiss!1602)))))))))

(assert (=> d!54101 d!54113))

(declare-fun d!54115 () Bool)

(assert (=> d!54115 (= (remainingBits!0 ((_ sign_extend 32) (size!3469 (buf!3927 thiss!1602))) ((_ sign_extend 32) (currentByte!7200 thiss!1602)) ((_ sign_extend 32) (currentBit!7195 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3469 (buf!3927 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7200 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7195 thiss!1602)))))))

(assert (=> d!54095 d!54115))

(push 1)

(check-sat)

(pop 1)

