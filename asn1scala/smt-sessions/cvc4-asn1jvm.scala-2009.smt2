; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51380 () Bool)

(assert start!51380)

(declare-fun res!199863 () Bool)

(declare-fun e!165462 () Bool)

(assert (=> start!51380 (=> (not res!199863) (not e!165462))))

(declare-datatypes ((array!12868 0))(
  ( (array!12869 (arr!6636 (Array (_ BitVec 32) (_ BitVec 8))) (size!5649 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10220 0))(
  ( (BitStream!10221 (buf!6103 array!12868) (currentByte!11319 (_ BitVec 32)) (currentBit!11314 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10220)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51380 (= res!199863 (validate_offset_bits!1 ((_ sign_extend 32) (size!5649 (buf!6103 thiss!1854))) ((_ sign_extend 32) (currentByte!11319 thiss!1854)) ((_ sign_extend 32) (currentBit!11314 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51380 e!165462))

(declare-fun e!165463 () Bool)

(declare-fun inv!12 (BitStream!10220) Bool)

(assert (=> start!51380 (and (inv!12 thiss!1854) e!165463)))

(declare-fun b!239218 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!239218 (= e!165462 (not (invariant!0 (currentBit!11314 thiss!1854) (currentByte!11319 thiss!1854) (size!5649 (buf!6103 thiss!1854)))))))

(declare-fun b!239219 () Bool)

(declare-fun array_inv!5390 (array!12868) Bool)

(assert (=> b!239219 (= e!165463 (array_inv!5390 (buf!6103 thiss!1854)))))

(assert (= (and start!51380 res!199863) b!239218))

(assert (= start!51380 b!239219))

(declare-fun m!361307 () Bool)

(assert (=> start!51380 m!361307))

(declare-fun m!361309 () Bool)

(assert (=> start!51380 m!361309))

(declare-fun m!361311 () Bool)

(assert (=> b!239218 m!361311))

(declare-fun m!361313 () Bool)

(assert (=> b!239219 m!361313))

(push 1)

(assert (not b!239219))

(assert (not start!51380))

(assert (not b!239218))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80544 () Bool)

(assert (=> d!80544 (= (array_inv!5390 (buf!6103 thiss!1854)) (bvsge (size!5649 (buf!6103 thiss!1854)) #b00000000000000000000000000000000))))

(assert (=> b!239219 d!80544))

(declare-fun d!80546 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80546 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5649 (buf!6103 thiss!1854))) ((_ sign_extend 32) (currentByte!11319 thiss!1854)) ((_ sign_extend 32) (currentBit!11314 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5649 (buf!6103 thiss!1854))) ((_ sign_extend 32) (currentByte!11319 thiss!1854)) ((_ sign_extend 32) (currentBit!11314 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!20249 () Bool)

(assert (= bs!20249 d!80546))

(declare-fun m!361317 () Bool)

(assert (=> bs!20249 m!361317))

(assert (=> start!51380 d!80546))

(declare-fun d!80550 () Bool)

(assert (=> d!80550 (= (inv!12 thiss!1854) (invariant!0 (currentBit!11314 thiss!1854) (currentByte!11319 thiss!1854) (size!5649 (buf!6103 thiss!1854))))))

(declare-fun bs!20251 () Bool)

(assert (= bs!20251 d!80550))

(assert (=> bs!20251 m!361311))

(assert (=> start!51380 d!80550))

(declare-fun d!80554 () Bool)

(assert (=> d!80554 (= (invariant!0 (currentBit!11314 thiss!1854) (currentByte!11319 thiss!1854) (size!5649 (buf!6103 thiss!1854))) (and (bvsge (currentBit!11314 thiss!1854) #b00000000000000000000000000000000) (bvslt (currentBit!11314 thiss!1854) #b00000000000000000000000000001000) (bvsge (currentByte!11319 thiss!1854) #b00000000000000000000000000000000) (or (bvslt (currentByte!11319 thiss!1854) (size!5649 (buf!6103 thiss!1854))) (and (= (currentBit!11314 thiss!1854) #b00000000000000000000000000000000) (= (currentByte!11319 thiss!1854) (size!5649 (buf!6103 thiss!1854)))))))))

(assert (=> b!239218 d!80554))

(push 1)

