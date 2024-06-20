; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51528 () Bool)

(assert start!51528)

(declare-fun res!199914 () Bool)

(declare-fun e!165615 () Bool)

(assert (=> start!51528 (=> (not res!199914) (not e!165615))))

(declare-datatypes ((array!12914 0))(
  ( (array!12915 (arr!6653 (Array (_ BitVec 32) (_ BitVec 8))) (size!5666 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10254 0))(
  ( (BitStream!10255 (buf!6120 array!12914) (currentByte!11369 (_ BitVec 32)) (currentBit!11364 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10254)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51528 (= res!199914 (validate_offset_bits!1 ((_ sign_extend 32) (size!5666 (buf!6120 thiss!1854))) ((_ sign_extend 32) (currentByte!11369 thiss!1854)) ((_ sign_extend 32) (currentBit!11364 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51528 e!165615))

(declare-fun e!165616 () Bool)

(declare-fun inv!12 (BitStream!10254) Bool)

(assert (=> start!51528 (and (inv!12 thiss!1854) e!165616)))

(declare-fun b!239320 () Bool)

(assert (=> b!239320 (= e!165615 (bvsgt ((_ sign_extend 24) ((_ extract 7 0) (currentBit!11364 thiss!1854))) #b00000000000000000000000000100000))))

(declare-fun b!239321 () Bool)

(declare-fun array_inv!5407 (array!12914) Bool)

(assert (=> b!239321 (= e!165616 (array_inv!5407 (buf!6120 thiss!1854)))))

(assert (= (and start!51528 res!199914) b!239320))

(assert (= start!51528 b!239321))

(declare-fun m!361453 () Bool)

(assert (=> start!51528 m!361453))

(declare-fun m!361455 () Bool)

(assert (=> start!51528 m!361455))

(declare-fun m!361457 () Bool)

(assert (=> b!239321 m!361457))

(check-sat (not start!51528) (not b!239321))
(check-sat)
(get-model)

(declare-fun d!80672 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80672 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5666 (buf!6120 thiss!1854))) ((_ sign_extend 32) (currentByte!11369 thiss!1854)) ((_ sign_extend 32) (currentBit!11364 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5666 (buf!6120 thiss!1854))) ((_ sign_extend 32) (currentByte!11369 thiss!1854)) ((_ sign_extend 32) (currentBit!11364 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!20292 () Bool)

(assert (= bs!20292 d!80672))

(declare-fun m!361469 () Bool)

(assert (=> bs!20292 m!361469))

(assert (=> start!51528 d!80672))

(declare-fun d!80680 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80680 (= (inv!12 thiss!1854) (invariant!0 (currentBit!11364 thiss!1854) (currentByte!11369 thiss!1854) (size!5666 (buf!6120 thiss!1854))))))

(declare-fun bs!20294 () Bool)

(assert (= bs!20294 d!80680))

(declare-fun m!361473 () Bool)

(assert (=> bs!20294 m!361473))

(assert (=> start!51528 d!80680))

(declare-fun d!80684 () Bool)

(assert (=> d!80684 (= (array_inv!5407 (buf!6120 thiss!1854)) (bvsge (size!5666 (buf!6120 thiss!1854)) #b00000000000000000000000000000000))))

(assert (=> b!239321 d!80684))

(check-sat (not d!80672) (not d!80680))
(check-sat)
(get-model)

(declare-fun d!80688 () Bool)

(assert (=> d!80688 (= (remainingBits!0 ((_ sign_extend 32) (size!5666 (buf!6120 thiss!1854))) ((_ sign_extend 32) (currentByte!11369 thiss!1854)) ((_ sign_extend 32) (currentBit!11364 thiss!1854))) (bvsub (bvmul ((_ sign_extend 32) (size!5666 (buf!6120 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11369 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11364 thiss!1854)))))))

(assert (=> d!80672 d!80688))

(declare-fun d!80692 () Bool)

(assert (=> d!80692 (= (invariant!0 (currentBit!11364 thiss!1854) (currentByte!11369 thiss!1854) (size!5666 (buf!6120 thiss!1854))) (and (bvsge (currentBit!11364 thiss!1854) #b00000000000000000000000000000000) (bvslt (currentBit!11364 thiss!1854) #b00000000000000000000000000001000) (bvsge (currentByte!11369 thiss!1854) #b00000000000000000000000000000000) (or (bvslt (currentByte!11369 thiss!1854) (size!5666 (buf!6120 thiss!1854))) (and (= (currentBit!11364 thiss!1854) #b00000000000000000000000000000000) (= (currentByte!11369 thiss!1854) (size!5666 (buf!6120 thiss!1854)))))))))

(assert (=> d!80680 d!80692))

(check-sat)
