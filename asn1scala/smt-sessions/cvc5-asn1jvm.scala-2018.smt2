; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51634 () Bool)

(assert start!51634)

(declare-fun res!199938 () Bool)

(declare-fun e!165687 () Bool)

(assert (=> start!51634 (=> (not res!199938) (not e!165687))))

(declare-datatypes ((array!12939 0))(
  ( (array!12940 (arr!6661 (Array (_ BitVec 32) (_ BitVec 8))) (size!5674 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10270 0))(
  ( (BitStream!10271 (buf!6128 array!12939) (currentByte!11404 (_ BitVec 32)) (currentBit!11399 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10270)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51634 (= res!199938 (validate_offset_bits!1 ((_ sign_extend 32) (size!5674 (buf!6128 thiss!1854))) ((_ sign_extend 32) (currentByte!11404 thiss!1854)) ((_ sign_extend 32) (currentBit!11399 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51634 e!165687))

(declare-fun e!165688 () Bool)

(declare-fun inv!12 (BitStream!10270) Bool)

(assert (=> start!51634 (and (inv!12 thiss!1854) e!165688)))

(declare-fun b!239368 () Bool)

(assert (=> b!239368 (= e!165687 (and (= (bvand (currentByte!11404 thiss!1854) #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand (currentByte!11404 thiss!1854) #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 (currentByte!11404 thiss!1854)) #b10000000000000000000000000000000)))))))

(declare-fun b!239369 () Bool)

(declare-fun array_inv!5415 (array!12939) Bool)

(assert (=> b!239369 (= e!165688 (array_inv!5415 (buf!6128 thiss!1854)))))

(assert (= (and start!51634 res!199938) b!239368))

(assert (= start!51634 b!239369))

(declare-fun m!361549 () Bool)

(assert (=> start!51634 m!361549))

(declare-fun m!361551 () Bool)

(assert (=> start!51634 m!361551))

(declare-fun m!361553 () Bool)

(assert (=> b!239369 m!361553))

(push 1)

(assert (not b!239369))

(assert (not start!51634))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80776 () Bool)

(assert (=> d!80776 (= (array_inv!5415 (buf!6128 thiss!1854)) (bvsge (size!5674 (buf!6128 thiss!1854)) #b00000000000000000000000000000000))))

(assert (=> b!239369 d!80776))

(declare-fun d!80780 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80780 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5674 (buf!6128 thiss!1854))) ((_ sign_extend 32) (currentByte!11404 thiss!1854)) ((_ sign_extend 32) (currentBit!11399 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5674 (buf!6128 thiss!1854))) ((_ sign_extend 32) (currentByte!11404 thiss!1854)) ((_ sign_extend 32) (currentBit!11399 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!20321 () Bool)

(assert (= bs!20321 d!80780))

(declare-fun m!361569 () Bool)

(assert (=> bs!20321 m!361569))

(assert (=> start!51634 d!80780))

(declare-fun d!80784 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80784 (= (inv!12 thiss!1854) (invariant!0 (currentBit!11399 thiss!1854) (currentByte!11404 thiss!1854) (size!5674 (buf!6128 thiss!1854))))))

(declare-fun bs!20323 () Bool)

(assert (= bs!20323 d!80784))

(declare-fun m!361573 () Bool)

(assert (=> bs!20323 m!361573))

(assert (=> start!51634 d!80784))

(push 1)

(assert (not d!80780))

(assert (not d!80784))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80794 () Bool)

(assert (=> d!80794 (= (remainingBits!0 ((_ sign_extend 32) (size!5674 (buf!6128 thiss!1854))) ((_ sign_extend 32) (currentByte!11404 thiss!1854)) ((_ sign_extend 32) (currentBit!11399 thiss!1854))) (bvsub (bvmul ((_ sign_extend 32) (size!5674 (buf!6128 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11404 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11399 thiss!1854)))))))

(assert (=> d!80780 d!80794))

(declare-fun d!80796 () Bool)

(assert (=> d!80796 (= (invariant!0 (currentBit!11399 thiss!1854) (currentByte!11404 thiss!1854) (size!5674 (buf!6128 thiss!1854))) (and (bvsge (currentBit!11399 thiss!1854) #b00000000000000000000000000000000) (bvslt (currentBit!11399 thiss!1854) #b00000000000000000000000000001000) (bvsge (currentByte!11404 thiss!1854) #b00000000000000000000000000000000) (or (bvslt (currentByte!11404 thiss!1854) (size!5674 (buf!6128 thiss!1854))) (and (= (currentBit!11399 thiss!1854) #b00000000000000000000000000000000) (= (currentByte!11404 thiss!1854) (size!5674 (buf!6128 thiss!1854)))))))))

(assert (=> d!80784 d!80796))

(push 1)

(check-sat)

(pop 1)

