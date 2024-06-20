; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51678 () Bool)

(assert start!51678)

(declare-fun res!199959 () Bool)

(declare-fun e!165751 () Bool)

(assert (=> start!51678 (=> (not res!199959) (not e!165751))))

(declare-datatypes ((array!12956 0))(
  ( (array!12957 (arr!6668 (Array (_ BitVec 32) (_ BitVec 8))) (size!5681 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10284 0))(
  ( (BitStream!10285 (buf!6135 array!12956) (currentByte!11420 (_ BitVec 32)) (currentBit!11415 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10284)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51678 (= res!199959 (validate_offset_bits!1 ((_ sign_extend 32) (size!5681 (buf!6135 thiss!1854))) ((_ sign_extend 32) (currentByte!11420 thiss!1854)) ((_ sign_extend 32) (currentBit!11415 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51678 e!165751))

(declare-fun e!165752 () Bool)

(declare-fun inv!12 (BitStream!10284) Bool)

(assert (=> start!51678 (and (inv!12 thiss!1854) e!165752)))

(declare-fun b!239410 () Bool)

(declare-fun lt!374034 () (_ BitVec 32))

(assert (=> b!239410 (= e!165751 (and (bvsgt lt!374034 #b00000000000000000000000000000000) (bvsle ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!374034))) #b00000000000000000000000000100000) (or (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!11420 thiss!1854)) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!11420 thiss!1854)) (size!5681 (buf!6135 thiss!1854))))))))

(assert (=> b!239410 (= lt!374034 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!11415 thiss!1854))))))

(declare-fun b!239411 () Bool)

(declare-fun array_inv!5422 (array!12956) Bool)

(assert (=> b!239411 (= e!165752 (array_inv!5422 (buf!6135 thiss!1854)))))

(assert (= (and start!51678 res!199959) b!239410))

(assert (= start!51678 b!239411))

(declare-fun m!361603 () Bool)

(assert (=> start!51678 m!361603))

(declare-fun m!361605 () Bool)

(assert (=> start!51678 m!361605))

(declare-fun m!361607 () Bool)

(assert (=> b!239411 m!361607))

(check-sat (not b!239411) (not start!51678))
(check-sat)
(get-model)

(declare-fun d!80810 () Bool)

(assert (=> d!80810 (= (array_inv!5422 (buf!6135 thiss!1854)) (bvsge (size!5681 (buf!6135 thiss!1854)) #b00000000000000000000000000000000))))

(assert (=> b!239411 d!80810))

(declare-fun d!80812 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80812 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5681 (buf!6135 thiss!1854))) ((_ sign_extend 32) (currentByte!11420 thiss!1854)) ((_ sign_extend 32) (currentBit!11415 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5681 (buf!6135 thiss!1854))) ((_ sign_extend 32) (currentByte!11420 thiss!1854)) ((_ sign_extend 32) (currentBit!11415 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!20332 () Bool)

(assert (= bs!20332 d!80812))

(declare-fun m!361615 () Bool)

(assert (=> bs!20332 m!361615))

(assert (=> start!51678 d!80812))

(declare-fun d!80814 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80814 (= (inv!12 thiss!1854) (invariant!0 (currentBit!11415 thiss!1854) (currentByte!11420 thiss!1854) (size!5681 (buf!6135 thiss!1854))))))

(declare-fun bs!20333 () Bool)

(assert (= bs!20333 d!80814))

(declare-fun m!361617 () Bool)

(assert (=> bs!20333 m!361617))

(assert (=> start!51678 d!80814))

(check-sat (not d!80812) (not d!80814))
(check-sat)
(get-model)

(declare-fun d!80828 () Bool)

(assert (=> d!80828 (= (remainingBits!0 ((_ sign_extend 32) (size!5681 (buf!6135 thiss!1854))) ((_ sign_extend 32) (currentByte!11420 thiss!1854)) ((_ sign_extend 32) (currentBit!11415 thiss!1854))) (bvsub (bvmul ((_ sign_extend 32) (size!5681 (buf!6135 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11420 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11415 thiss!1854)))))))

(assert (=> d!80812 d!80828))

(declare-fun d!80830 () Bool)

(assert (=> d!80830 (= (invariant!0 (currentBit!11415 thiss!1854) (currentByte!11420 thiss!1854) (size!5681 (buf!6135 thiss!1854))) (and (bvsge (currentBit!11415 thiss!1854) #b00000000000000000000000000000000) (bvslt (currentBit!11415 thiss!1854) #b00000000000000000000000000001000) (bvsge (currentByte!11420 thiss!1854) #b00000000000000000000000000000000) (or (bvslt (currentByte!11420 thiss!1854) (size!5681 (buf!6135 thiss!1854))) (and (= (currentBit!11415 thiss!1854) #b00000000000000000000000000000000) (= (currentByte!11420 thiss!1854) (size!5681 (buf!6135 thiss!1854)))))))))

(assert (=> d!80814 d!80830))

(check-sat)
