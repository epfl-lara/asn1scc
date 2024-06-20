; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51530 () Bool)

(assert start!51530)

(declare-fun res!199917 () Bool)

(declare-fun e!165624 () Bool)

(assert (=> start!51530 (=> (not res!199917) (not e!165624))))

(declare-datatypes ((array!12916 0))(
  ( (array!12917 (arr!6654 (Array (_ BitVec 32) (_ BitVec 8))) (size!5667 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10256 0))(
  ( (BitStream!10257 (buf!6121 array!12916) (currentByte!11370 (_ BitVec 32)) (currentBit!11365 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10256)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51530 (= res!199917 (validate_offset_bits!1 ((_ sign_extend 32) (size!5667 (buf!6121 thiss!1854))) ((_ sign_extend 32) (currentByte!11370 thiss!1854)) ((_ sign_extend 32) (currentBit!11365 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51530 e!165624))

(declare-fun e!165625 () Bool)

(declare-fun inv!12 (BitStream!10256) Bool)

(assert (=> start!51530 (and (inv!12 thiss!1854) e!165625)))

(declare-fun b!239326 () Bool)

(assert (=> b!239326 (= e!165624 (bvsgt ((_ sign_extend 24) ((_ extract 7 0) (currentBit!11365 thiss!1854))) #b00000000000000000000000000100000))))

(declare-fun b!239327 () Bool)

(declare-fun array_inv!5408 (array!12916) Bool)

(assert (=> b!239327 (= e!165625 (array_inv!5408 (buf!6121 thiss!1854)))))

(assert (= (and start!51530 res!199917) b!239326))

(assert (= start!51530 b!239327))

(declare-fun m!361459 () Bool)

(assert (=> start!51530 m!361459))

(declare-fun m!361461 () Bool)

(assert (=> start!51530 m!361461))

(declare-fun m!361463 () Bool)

(assert (=> b!239327 m!361463))

(push 1)

(assert (not b!239327))

(assert (not start!51530))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80674 () Bool)

(assert (=> d!80674 (= (array_inv!5408 (buf!6121 thiss!1854)) (bvsge (size!5667 (buf!6121 thiss!1854)) #b00000000000000000000000000000000))))

(assert (=> b!239327 d!80674))

(declare-fun d!80678 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80678 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5667 (buf!6121 thiss!1854))) ((_ sign_extend 32) (currentByte!11370 thiss!1854)) ((_ sign_extend 32) (currentBit!11365 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5667 (buf!6121 thiss!1854))) ((_ sign_extend 32) (currentByte!11370 thiss!1854)) ((_ sign_extend 32) (currentBit!11365 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!20293 () Bool)

(assert (= bs!20293 d!80678))

(declare-fun m!361471 () Bool)

(assert (=> bs!20293 m!361471))

(assert (=> start!51530 d!80678))

(declare-fun d!80682 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80682 (= (inv!12 thiss!1854) (invariant!0 (currentBit!11365 thiss!1854) (currentByte!11370 thiss!1854) (size!5667 (buf!6121 thiss!1854))))))

(declare-fun bs!20295 () Bool)

(assert (= bs!20295 d!80682))

(declare-fun m!361475 () Bool)

(assert (=> bs!20295 m!361475))

(assert (=> start!51530 d!80682))

(push 1)

(assert (not d!80678))

(assert (not d!80682))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80694 () Bool)

(assert (=> d!80694 (= (remainingBits!0 ((_ sign_extend 32) (size!5667 (buf!6121 thiss!1854))) ((_ sign_extend 32) (currentByte!11370 thiss!1854)) ((_ sign_extend 32) (currentBit!11365 thiss!1854))) (bvsub (bvmul ((_ sign_extend 32) (size!5667 (buf!6121 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11370 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11365 thiss!1854)))))))

(assert (=> d!80678 d!80694))

(declare-fun d!80696 () Bool)

(assert (=> d!80696 (= (invariant!0 (currentBit!11365 thiss!1854) (currentByte!11370 thiss!1854) (size!5667 (buf!6121 thiss!1854))) (and (bvsge (currentBit!11365 thiss!1854) #b00000000000000000000000000000000) (bvslt (currentBit!11365 thiss!1854) #b00000000000000000000000000001000) (bvsge (currentByte!11370 thiss!1854) #b00000000000000000000000000000000) (or (bvslt (currentByte!11370 thiss!1854) (size!5667 (buf!6121 thiss!1854))) (and (= (currentBit!11365 thiss!1854) #b00000000000000000000000000000000) (= (currentByte!11370 thiss!1854) (size!5667 (buf!6121 thiss!1854)))))))))

(assert (=> d!80682 d!80696))

(push 1)

(check-sat)

