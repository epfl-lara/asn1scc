; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51410 () Bool)

(assert start!51410)

(declare-fun res!199872 () Bool)

(declare-fun e!165489 () Bool)

(assert (=> start!51410 (=> (not res!199872) (not e!165489))))

(declare-datatypes ((array!12877 0))(
  ( (array!12878 (arr!6639 (Array (_ BitVec 32) (_ BitVec 8))) (size!5652 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10226 0))(
  ( (BitStream!10227 (buf!6106 array!12877) (currentByte!11328 (_ BitVec 32)) (currentBit!11323 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10226)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51410 (= res!199872 (validate_offset_bits!1 ((_ sign_extend 32) (size!5652 (buf!6106 thiss!1854))) ((_ sign_extend 32) (currentByte!11328 thiss!1854)) ((_ sign_extend 32) (currentBit!11323 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51410 e!165489))

(declare-fun e!165490 () Bool)

(declare-fun inv!12 (BitStream!10226) Bool)

(assert (=> start!51410 (and (inv!12 thiss!1854) e!165490)))

(declare-fun b!239236 () Bool)

(assert (=> b!239236 (= e!165489 (bvsge (currentBit!11323 thiss!1854) #b00000000000000000000000010000000))))

(declare-fun b!239237 () Bool)

(declare-fun array_inv!5393 (array!12877) Bool)

(assert (=> b!239237 (= e!165490 (array_inv!5393 (buf!6106 thiss!1854)))))

(assert (= (and start!51410 res!199872) b!239236))

(assert (= start!51410 b!239237))

(declare-fun m!361333 () Bool)

(assert (=> start!51410 m!361333))

(declare-fun m!361335 () Bool)

(assert (=> start!51410 m!361335))

(declare-fun m!361337 () Bool)

(assert (=> b!239237 m!361337))

(push 1)

(assert (not start!51410))

(assert (not b!239237))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80580 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80580 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5652 (buf!6106 thiss!1854))) ((_ sign_extend 32) (currentByte!11328 thiss!1854)) ((_ sign_extend 32) (currentBit!11323 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5652 (buf!6106 thiss!1854))) ((_ sign_extend 32) (currentByte!11328 thiss!1854)) ((_ sign_extend 32) (currentBit!11323 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!20261 () Bool)

(assert (= bs!20261 d!80580))

(declare-fun m!361347 () Bool)

(assert (=> bs!20261 m!361347))

(assert (=> start!51410 d!80580))

(declare-fun d!80582 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80582 (= (inv!12 thiss!1854) (invariant!0 (currentBit!11323 thiss!1854) (currentByte!11328 thiss!1854) (size!5652 (buf!6106 thiss!1854))))))

(declare-fun bs!20262 () Bool)

(assert (= bs!20262 d!80582))

(declare-fun m!361349 () Bool)

(assert (=> bs!20262 m!361349))

(assert (=> start!51410 d!80582))

(declare-fun d!80584 () Bool)

(assert (=> d!80584 (= (array_inv!5393 (buf!6106 thiss!1854)) (bvsge (size!5652 (buf!6106 thiss!1854)) #b00000000000000000000000000000000))))

(assert (=> b!239237 d!80584))

(push 1)

(assert (not d!80580))

(assert (not d!80582))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80594 () Bool)

(assert (=> d!80594 (= (remainingBits!0 ((_ sign_extend 32) (size!5652 (buf!6106 thiss!1854))) ((_ sign_extend 32) (currentByte!11328 thiss!1854)) ((_ sign_extend 32) (currentBit!11323 thiss!1854))) (bvsub (bvmul ((_ sign_extend 32) (size!5652 (buf!6106 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11328 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11323 thiss!1854)))))))

(assert (=> d!80580 d!80594))

(declare-fun d!80596 () Bool)

(assert (=> d!80596 (= (invariant!0 (currentBit!11323 thiss!1854) (currentByte!11328 thiss!1854) (size!5652 (buf!6106 thiss!1854))) (and (bvsge (currentBit!11323 thiss!1854) #b00000000000000000000000000000000) (bvslt (currentBit!11323 thiss!1854) #b00000000000000000000000000001000) (bvsge (currentByte!11328 thiss!1854) #b00000000000000000000000000000000) (or (bvslt (currentByte!11328 thiss!1854) (size!5652 (buf!6106 thiss!1854))) (and (= (currentBit!11323 thiss!1854) #b00000000000000000000000000000000) (= (currentByte!11328 thiss!1854) (size!5652 (buf!6106 thiss!1854)))))))))

(assert (=> d!80582 d!80596))

(push 1)

(check-sat)

