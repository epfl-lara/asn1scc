; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51340 () Bool)

(assert start!51340)

(declare-fun res!199848 () Bool)

(declare-fun e!165417 () Bool)

(assert (=> start!51340 (=> (not res!199848) (not e!165417))))

(declare-datatypes ((array!12855 0))(
  ( (array!12856 (arr!6631 (Array (_ BitVec 32) (_ BitVec 8))) (size!5644 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10210 0))(
  ( (BitStream!10211 (buf!6098 array!12855) (currentByte!11305 (_ BitVec 32)) (currentBit!11300 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10210)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51340 (= res!199848 (validate_offset_bits!1 ((_ sign_extend 32) (size!5644 (buf!6098 thiss!1854))) ((_ sign_extend 32) (currentByte!11305 thiss!1854)) ((_ sign_extend 32) (currentBit!11300 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51340 e!165417))

(declare-fun e!165418 () Bool)

(declare-fun inv!12 (BitStream!10210) Bool)

(assert (=> start!51340 (and (inv!12 thiss!1854) e!165418)))

(declare-fun b!239188 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!239188 (= e!165417 (not (invariant!0 (currentBit!11300 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11305 thiss!1854)) (size!5644 (buf!6098 thiss!1854)))))))

(declare-fun b!239189 () Bool)

(declare-fun array_inv!5385 (array!12855) Bool)

(assert (=> b!239189 (= e!165418 (array_inv!5385 (buf!6098 thiss!1854)))))

(assert (= (and start!51340 res!199848) b!239188))

(assert (= start!51340 b!239189))

(declare-fun m!361255 () Bool)

(assert (=> start!51340 m!361255))

(declare-fun m!361257 () Bool)

(assert (=> start!51340 m!361257))

(declare-fun m!361259 () Bool)

(assert (=> b!239188 m!361259))

(declare-fun m!361261 () Bool)

(assert (=> b!239189 m!361261))

(push 1)

(assert (not b!239189))

(assert (not start!51340))

(assert (not b!239188))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80504 () Bool)

(assert (=> d!80504 (= (array_inv!5385 (buf!6098 thiss!1854)) (bvsge (size!5644 (buf!6098 thiss!1854)) #b00000000000000000000000000000000))))

(assert (=> b!239189 d!80504))

(declare-fun d!80508 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80508 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5644 (buf!6098 thiss!1854))) ((_ sign_extend 32) (currentByte!11305 thiss!1854)) ((_ sign_extend 32) (currentBit!11300 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5644 (buf!6098 thiss!1854))) ((_ sign_extend 32) (currentByte!11305 thiss!1854)) ((_ sign_extend 32) (currentBit!11300 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!20239 () Bool)

(assert (= bs!20239 d!80508))

(declare-fun m!361279 () Bool)

(assert (=> bs!20239 m!361279))

(assert (=> start!51340 d!80508))

(declare-fun d!80512 () Bool)

(assert (=> d!80512 (= (inv!12 thiss!1854) (invariant!0 (currentBit!11300 thiss!1854) (currentByte!11305 thiss!1854) (size!5644 (buf!6098 thiss!1854))))))

(declare-fun bs!20241 () Bool)

(assert (= bs!20241 d!80512))

(declare-fun m!361283 () Bool)

(assert (=> bs!20241 m!361283))

(assert (=> start!51340 d!80512))

(declare-fun d!80516 () Bool)

(assert (=> d!80516 (= (invariant!0 (currentBit!11300 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11305 thiss!1854)) (size!5644 (buf!6098 thiss!1854))) (and (bvsge (currentBit!11300 thiss!1854) #b00000000000000000000000000000000) (bvslt (currentBit!11300 thiss!1854) #b00000000000000000000000000001000) (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!11305 thiss!1854)) #b00000000000000000000000000000000) (or (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!11305 thiss!1854)) (size!5644 (buf!6098 thiss!1854))) (and (= (currentBit!11300 thiss!1854) #b00000000000000000000000000000000) (= (bvadd #b00000000000000000000000000000001 (currentByte!11305 thiss!1854)) (size!5644 (buf!6098 thiss!1854)))))))))

(assert (=> b!239188 d!80516))

(push 1)

(assert (not d!80508))

(assert (not d!80512))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80530 () Bool)

(assert (=> d!80530 (= (remainingBits!0 ((_ sign_extend 32) (size!5644 (buf!6098 thiss!1854))) ((_ sign_extend 32) (currentByte!11305 thiss!1854)) ((_ sign_extend 32) (currentBit!11300 thiss!1854))) (bvsub (bvmul ((_ sign_extend 32) (size!5644 (buf!6098 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11305 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11300 thiss!1854)))))))

(assert (=> d!80508 d!80530))

(declare-fun d!80534 () Bool)

(assert (=> d!80534 (= (invariant!0 (currentBit!11300 thiss!1854) (currentByte!11305 thiss!1854) (size!5644 (buf!6098 thiss!1854))) (and (bvsge (currentBit!11300 thiss!1854) #b00000000000000000000000000000000) (bvslt (currentBit!11300 thiss!1854) #b00000000000000000000000000001000) (bvsge (currentByte!11305 thiss!1854) #b00000000000000000000000000000000) (or (bvslt (currentByte!11305 thiss!1854) (size!5644 (buf!6098 thiss!1854))) (and (= (currentBit!11300 thiss!1854) #b00000000000000000000000000000000) (= (currentByte!11305 thiss!1854) (size!5644 (buf!6098 thiss!1854)))))))))

(assert (=> d!80512 d!80534))

(push 1)

(check-sat)

