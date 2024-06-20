; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51676 () Bool)

(assert start!51676)

(declare-fun res!199956 () Bool)

(declare-fun e!165742 () Bool)

(assert (=> start!51676 (=> (not res!199956) (not e!165742))))

(declare-datatypes ((array!12954 0))(
  ( (array!12955 (arr!6667 (Array (_ BitVec 32) (_ BitVec 8))) (size!5680 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10282 0))(
  ( (BitStream!10283 (buf!6134 array!12954) (currentByte!11419 (_ BitVec 32)) (currentBit!11414 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10282)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51676 (= res!199956 (validate_offset_bits!1 ((_ sign_extend 32) (size!5680 (buf!6134 thiss!1854))) ((_ sign_extend 32) (currentByte!11419 thiss!1854)) ((_ sign_extend 32) (currentBit!11414 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51676 e!165742))

(declare-fun e!165743 () Bool)

(declare-fun inv!12 (BitStream!10282) Bool)

(assert (=> start!51676 (and (inv!12 thiss!1854) e!165743)))

(declare-fun b!239404 () Bool)

(declare-fun lt!374031 () (_ BitVec 32))

(assert (=> b!239404 (= e!165742 (and (bvsgt lt!374031 #b00000000000000000000000000000000) (bvsle ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!374031))) #b00000000000000000000000000100000) (or (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!11419 thiss!1854)) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!11419 thiss!1854)) (size!5680 (buf!6134 thiss!1854))))))))

(assert (=> b!239404 (= lt!374031 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!11414 thiss!1854))))))

(declare-fun b!239405 () Bool)

(declare-fun array_inv!5421 (array!12954) Bool)

(assert (=> b!239405 (= e!165743 (array_inv!5421 (buf!6134 thiss!1854)))))

(assert (= (and start!51676 res!199956) b!239404))

(assert (= start!51676 b!239405))

(declare-fun m!361597 () Bool)

(assert (=> start!51676 m!361597))

(declare-fun m!361599 () Bool)

(assert (=> start!51676 m!361599))

(declare-fun m!361601 () Bool)

(assert (=> b!239405 m!361601))

(push 1)

(assert (not start!51676))

(assert (not b!239405))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80816 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80816 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5680 (buf!6134 thiss!1854))) ((_ sign_extend 32) (currentByte!11419 thiss!1854)) ((_ sign_extend 32) (currentBit!11414 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5680 (buf!6134 thiss!1854))) ((_ sign_extend 32) (currentByte!11419 thiss!1854)) ((_ sign_extend 32) (currentBit!11414 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!20334 () Bool)

(assert (= bs!20334 d!80816))

(declare-fun m!361619 () Bool)

(assert (=> bs!20334 m!361619))

(assert (=> start!51676 d!80816))

(declare-fun d!80818 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80818 (= (inv!12 thiss!1854) (invariant!0 (currentBit!11414 thiss!1854) (currentByte!11419 thiss!1854) (size!5680 (buf!6134 thiss!1854))))))

(declare-fun bs!20335 () Bool)

(assert (= bs!20335 d!80818))

(declare-fun m!361621 () Bool)

(assert (=> bs!20335 m!361621))

(assert (=> start!51676 d!80818))

(declare-fun d!80820 () Bool)

(assert (=> d!80820 (= (array_inv!5421 (buf!6134 thiss!1854)) (bvsge (size!5680 (buf!6134 thiss!1854)) #b00000000000000000000000000000000))))

(assert (=> b!239405 d!80820))

(push 1)

(assert (not d!80818))

(assert (not d!80816))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80832 () Bool)

(assert (=> d!80832 (= (invariant!0 (currentBit!11414 thiss!1854) (currentByte!11419 thiss!1854) (size!5680 (buf!6134 thiss!1854))) (and (bvsge (currentBit!11414 thiss!1854) #b00000000000000000000000000000000) (bvslt (currentBit!11414 thiss!1854) #b00000000000000000000000000001000) (bvsge (currentByte!11419 thiss!1854) #b00000000000000000000000000000000) (or (bvslt (currentByte!11419 thiss!1854) (size!5680 (buf!6134 thiss!1854))) (and (= (currentBit!11414 thiss!1854) #b00000000000000000000000000000000) (= (currentByte!11419 thiss!1854) (size!5680 (buf!6134 thiss!1854)))))))))

(assert (=> d!80818 d!80832))

(declare-fun d!80834 () Bool)

(assert (=> d!80834 (= (remainingBits!0 ((_ sign_extend 32) (size!5680 (buf!6134 thiss!1854))) ((_ sign_extend 32) (currentByte!11419 thiss!1854)) ((_ sign_extend 32) (currentBit!11414 thiss!1854))) (bvsub (bvmul ((_ sign_extend 32) (size!5680 (buf!6134 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11419 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11414 thiss!1854)))))))

(assert (=> d!80816 d!80834))

(push 1)

(check-sat)

