; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51446 () Bool)

(assert start!51446)

(declare-fun res!199881 () Bool)

(declare-fun e!165516 () Bool)

(assert (=> start!51446 (=> (not res!199881) (not e!165516))))

(declare-datatypes ((array!12886 0))(
  ( (array!12887 (arr!6642 (Array (_ BitVec 32) (_ BitVec 8))) (size!5655 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10232 0))(
  ( (BitStream!10233 (buf!6109 array!12886) (currentByte!11340 (_ BitVec 32)) (currentBit!11335 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10232)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51446 (= res!199881 (validate_offset_bits!1 ((_ sign_extend 32) (size!5655 (buf!6109 thiss!1854))) ((_ sign_extend 32) (currentByte!11340 thiss!1854)) ((_ sign_extend 32) (currentBit!11335 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51446 e!165516))

(declare-fun e!165517 () Bool)

(declare-fun inv!12 (BitStream!10232) Bool)

(assert (=> start!51446 (and (inv!12 thiss!1854) e!165517)))

(declare-fun b!239254 () Bool)

(assert (=> b!239254 (= e!165516 (and (bvslt (currentBit!11335 thiss!1854) #b00000000000000000000000010000000) (bvslt (currentBit!11335 thiss!1854) #b11111111111111111111111110000000)))))

(declare-fun b!239255 () Bool)

(declare-fun array_inv!5396 (array!12886) Bool)

(assert (=> b!239255 (= e!165517 (array_inv!5396 (buf!6109 thiss!1854)))))

(assert (= (and start!51446 res!199881) b!239254))

(assert (= start!51446 b!239255))

(declare-fun m!361363 () Bool)

(assert (=> start!51446 m!361363))

(declare-fun m!361365 () Bool)

(assert (=> start!51446 m!361365))

(declare-fun m!361367 () Bool)

(assert (=> b!239255 m!361367))

(push 1)

(assert (not b!239255))

(assert (not start!51446))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80612 () Bool)

(assert (=> d!80612 (= (array_inv!5396 (buf!6109 thiss!1854)) (bvsge (size!5655 (buf!6109 thiss!1854)) #b00000000000000000000000000000000))))

(assert (=> b!239255 d!80612))

(declare-fun d!80614 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80614 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5655 (buf!6109 thiss!1854))) ((_ sign_extend 32) (currentByte!11340 thiss!1854)) ((_ sign_extend 32) (currentBit!11335 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5655 (buf!6109 thiss!1854))) ((_ sign_extend 32) (currentByte!11340 thiss!1854)) ((_ sign_extend 32) (currentBit!11335 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!20270 () Bool)

(assert (= bs!20270 d!80614))

(declare-fun m!361377 () Bool)

(assert (=> bs!20270 m!361377))

(assert (=> start!51446 d!80614))

(declare-fun d!80616 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80616 (= (inv!12 thiss!1854) (invariant!0 (currentBit!11335 thiss!1854) (currentByte!11340 thiss!1854) (size!5655 (buf!6109 thiss!1854))))))

(declare-fun bs!20271 () Bool)

(assert (= bs!20271 d!80616))

(declare-fun m!361379 () Bool)

(assert (=> bs!20271 m!361379))

(assert (=> start!51446 d!80616))

(push 1)

(assert (not d!80616))

(assert (not d!80614))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80626 () Bool)

(assert (=> d!80626 (= (invariant!0 (currentBit!11335 thiss!1854) (currentByte!11340 thiss!1854) (size!5655 (buf!6109 thiss!1854))) (and (bvsge (currentBit!11335 thiss!1854) #b00000000000000000000000000000000) (bvslt (currentBit!11335 thiss!1854) #b00000000000000000000000000001000) (bvsge (currentByte!11340 thiss!1854) #b00000000000000000000000000000000) (or (bvslt (currentByte!11340 thiss!1854) (size!5655 (buf!6109 thiss!1854))) (and (= (currentBit!11335 thiss!1854) #b00000000000000000000000000000000) (= (currentByte!11340 thiss!1854) (size!5655 (buf!6109 thiss!1854)))))))))

(assert (=> d!80616 d!80626))

(declare-fun d!80628 () Bool)

(assert (=> d!80628 (= (remainingBits!0 ((_ sign_extend 32) (size!5655 (buf!6109 thiss!1854))) ((_ sign_extend 32) (currentByte!11340 thiss!1854)) ((_ sign_extend 32) (currentBit!11335 thiss!1854))) (bvsub (bvmul ((_ sign_extend 32) (size!5655 (buf!6109 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11340 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11335 thiss!1854)))))))

(assert (=> d!80614 d!80628))

(push 1)

(check-sat)

