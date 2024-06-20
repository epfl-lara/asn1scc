; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51598 () Bool)

(assert start!51598)

(declare-fun res!199929 () Bool)

(declare-fun e!165660 () Bool)

(assert (=> start!51598 (=> (not res!199929) (not e!165660))))

(declare-datatypes ((array!12930 0))(
  ( (array!12931 (arr!6658 (Array (_ BitVec 32) (_ BitVec 8))) (size!5671 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10264 0))(
  ( (BitStream!10265 (buf!6125 array!12930) (currentByte!11392 (_ BitVec 32)) (currentBit!11387 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10264)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51598 (= res!199929 (validate_offset_bits!1 ((_ sign_extend 32) (size!5671 (buf!6125 thiss!1854))) ((_ sign_extend 32) (currentByte!11392 thiss!1854)) ((_ sign_extend 32) (currentBit!11387 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51598 e!165660))

(declare-fun e!165661 () Bool)

(declare-fun inv!12 (BitStream!10264) Bool)

(assert (=> start!51598 (and (inv!12 thiss!1854) e!165661)))

(declare-fun b!239350 () Bool)

(assert (=> b!239350 (= e!165660 (not (inv!12 (BitStream!10265 (buf!6125 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11392 thiss!1854)) (currentBit!11387 thiss!1854)))))))

(declare-fun b!239351 () Bool)

(declare-fun array_inv!5412 (array!12930) Bool)

(assert (=> b!239351 (= e!165661 (array_inv!5412 (buf!6125 thiss!1854)))))

(assert (= (and start!51598 res!199929) b!239350))

(assert (= start!51598 b!239351))

(declare-fun m!361507 () Bool)

(assert (=> start!51598 m!361507))

(declare-fun m!361509 () Bool)

(assert (=> start!51598 m!361509))

(declare-fun m!361511 () Bool)

(assert (=> b!239350 m!361511))

(declare-fun m!361513 () Bool)

(assert (=> b!239351 m!361513))

(push 1)

(assert (not start!51598))

(assert (not b!239351))

(assert (not b!239350))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80734 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80734 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5671 (buf!6125 thiss!1854))) ((_ sign_extend 32) (currentByte!11392 thiss!1854)) ((_ sign_extend 32) (currentBit!11387 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5671 (buf!6125 thiss!1854))) ((_ sign_extend 32) (currentByte!11392 thiss!1854)) ((_ sign_extend 32) (currentBit!11387 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!20309 () Bool)

(assert (= bs!20309 d!80734))

(declare-fun m!361533 () Bool)

(assert (=> bs!20309 m!361533))

(assert (=> start!51598 d!80734))

(declare-fun d!80737 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80737 (= (inv!12 thiss!1854) (invariant!0 (currentBit!11387 thiss!1854) (currentByte!11392 thiss!1854) (size!5671 (buf!6125 thiss!1854))))))

(declare-fun bs!20311 () Bool)

(assert (= bs!20311 d!80737))

(declare-fun m!361537 () Bool)

(assert (=> bs!20311 m!361537))

(assert (=> start!51598 d!80737))

(declare-fun d!80742 () Bool)

(assert (=> d!80742 (= (array_inv!5412 (buf!6125 thiss!1854)) (bvsge (size!5671 (buf!6125 thiss!1854)) #b00000000000000000000000000000000))))

(assert (=> b!239351 d!80742))

(declare-fun d!80746 () Bool)

(assert (=> d!80746 (= (inv!12 (BitStream!10265 (buf!6125 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11392 thiss!1854)) (currentBit!11387 thiss!1854))) (invariant!0 (currentBit!11387 (BitStream!10265 (buf!6125 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11392 thiss!1854)) (currentBit!11387 thiss!1854))) (currentByte!11392 (BitStream!10265 (buf!6125 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11392 thiss!1854)) (currentBit!11387 thiss!1854))) (size!5671 (buf!6125 (BitStream!10265 (buf!6125 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11392 thiss!1854)) (currentBit!11387 thiss!1854))))))))

(declare-fun bs!20313 () Bool)

(assert (= bs!20313 d!80746))

(declare-fun m!361541 () Bool)

(assert (=> bs!20313 m!361541))

(assert (=> b!239350 d!80746))

(push 1)

(assert (not d!80737))

(assert (not d!80746))

(assert (not d!80734))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80756 () Bool)

(assert (=> d!80756 (= (invariant!0 (currentBit!11387 thiss!1854) (currentByte!11392 thiss!1854) (size!5671 (buf!6125 thiss!1854))) (and (bvsge (currentBit!11387 thiss!1854) #b00000000000000000000000000000000) (bvslt (currentBit!11387 thiss!1854) #b00000000000000000000000000001000) (bvsge (currentByte!11392 thiss!1854) #b00000000000000000000000000000000) (or (bvslt (currentByte!11392 thiss!1854) (size!5671 (buf!6125 thiss!1854))) (and (= (currentBit!11387 thiss!1854) #b00000000000000000000000000000000) (= (currentByte!11392 thiss!1854) (size!5671 (buf!6125 thiss!1854)))))))))

(assert (=> d!80737 d!80756))

(declare-fun d!80758 () Bool)

(assert (=> d!80758 (= (invariant!0 (currentBit!11387 (BitStream!10265 (buf!6125 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11392 thiss!1854)) (currentBit!11387 thiss!1854))) (currentByte!11392 (BitStream!10265 (buf!6125 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11392 thiss!1854)) (currentBit!11387 thiss!1854))) (size!5671 (buf!6125 (BitStream!10265 (buf!6125 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11392 thiss!1854)) (currentBit!11387 thiss!1854))))) (and (bvsge (currentBit!11387 (BitStream!10265 (buf!6125 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11392 thiss!1854)) (currentBit!11387 thiss!1854))) #b00000000000000000000000000000000) (bvslt (currentBit!11387 (BitStream!10265 (buf!6125 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11392 thiss!1854)) (currentBit!11387 thiss!1854))) #b00000000000000000000000000001000) (bvsge (currentByte!11392 (BitStream!10265 (buf!6125 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11392 thiss!1854)) (currentBit!11387 thiss!1854))) #b00000000000000000000000000000000) (or (bvslt (currentByte!11392 (BitStream!10265 (buf!6125 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11392 thiss!1854)) (currentBit!11387 thiss!1854))) (size!5671 (buf!6125 (BitStream!10265 (buf!6125 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11392 thiss!1854)) (currentBit!11387 thiss!1854))))) (and (= (currentBit!11387 (BitStream!10265 (buf!6125 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11392 thiss!1854)) (currentBit!11387 thiss!1854))) #b00000000000000000000000000000000) (= (currentByte!11392 (BitStream!10265 (buf!6125 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11392 thiss!1854)) (currentBit!11387 thiss!1854))) (size!5671 (buf!6125 (BitStream!10265 (buf!6125 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11392 thiss!1854)) (currentBit!11387 thiss!1854)))))))))))

(assert (=> d!80746 d!80758))

(declare-fun d!80760 () Bool)

(assert (=> d!80760 (= (remainingBits!0 ((_ sign_extend 32) (size!5671 (buf!6125 thiss!1854))) ((_ sign_extend 32) (currentByte!11392 thiss!1854)) ((_ sign_extend 32) (currentBit!11387 thiss!1854))) (bvsub (bvmul ((_ sign_extend 32) (size!5671 (buf!6125 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11392 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11387 thiss!1854)))))))

(assert (=> d!80734 d!80760))

(push 1)

(check-sat)

