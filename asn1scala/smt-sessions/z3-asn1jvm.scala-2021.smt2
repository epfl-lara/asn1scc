; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51714 () Bool)

(assert start!51714)

(declare-fun res!199968 () Bool)

(declare-fun e!165777 () Bool)

(assert (=> start!51714 (=> (not res!199968) (not e!165777))))

(declare-datatypes ((array!12965 0))(
  ( (array!12966 (arr!6671 (Array (_ BitVec 32) (_ BitVec 8))) (size!5684 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10290 0))(
  ( (BitStream!10291 (buf!6138 array!12965) (currentByte!11432 (_ BitVec 32)) (currentBit!11427 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10290)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51714 (= res!199968 (validate_offset_bits!1 ((_ sign_extend 32) (size!5684 (buf!6138 thiss!1854))) ((_ sign_extend 32) (currentByte!11432 thiss!1854)) ((_ sign_extend 32) (currentBit!11427 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51714 e!165777))

(declare-fun e!165779 () Bool)

(declare-fun inv!12 (BitStream!10290) Bool)

(assert (=> start!51714 (and (inv!12 thiss!1854) e!165779)))

(declare-fun b!239428 () Bool)

(declare-fun lt!374049 () (_ BitVec 64))

(declare-fun lt!374048 () (_ BitVec 64))

(assert (=> b!239428 (= e!165777 (and (= lt!374049 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= lt!374049 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!374048) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!239428 (= lt!374049 (bvand lt!374048 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!239428 (= lt!374048 (bitIndex!0 (size!5684 (buf!6138 thiss!1854)) (currentByte!11432 thiss!1854) (currentBit!11427 thiss!1854)))))

(declare-fun b!239429 () Bool)

(declare-fun array_inv!5425 (array!12965) Bool)

(assert (=> b!239429 (= e!165779 (array_inv!5425 (buf!6138 thiss!1854)))))

(assert (= (and start!51714 res!199968) b!239428))

(assert (= start!51714 b!239429))

(declare-fun m!361635 () Bool)

(assert (=> start!51714 m!361635))

(declare-fun m!361637 () Bool)

(assert (=> start!51714 m!361637))

(declare-fun m!361639 () Bool)

(assert (=> b!239428 m!361639))

(declare-fun m!361641 () Bool)

(assert (=> b!239429 m!361641))

(check-sat (not start!51714) (not b!239428) (not b!239429))
(check-sat)
(get-model)

(declare-fun d!80848 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80848 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5684 (buf!6138 thiss!1854))) ((_ sign_extend 32) (currentByte!11432 thiss!1854)) ((_ sign_extend 32) (currentBit!11427 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5684 (buf!6138 thiss!1854))) ((_ sign_extend 32) (currentByte!11432 thiss!1854)) ((_ sign_extend 32) (currentBit!11427 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!20343 () Bool)

(assert (= bs!20343 d!80848))

(declare-fun m!361655 () Bool)

(assert (=> bs!20343 m!361655))

(assert (=> start!51714 d!80848))

(declare-fun d!80851 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80851 (= (inv!12 thiss!1854) (invariant!0 (currentBit!11427 thiss!1854) (currentByte!11432 thiss!1854) (size!5684 (buf!6138 thiss!1854))))))

(declare-fun bs!20344 () Bool)

(assert (= bs!20344 d!80851))

(declare-fun m!361657 () Bool)

(assert (=> bs!20344 m!361657))

(assert (=> start!51714 d!80851))

(declare-fun d!80856 () Bool)

(declare-fun e!165796 () Bool)

(assert (=> d!80856 e!165796))

(declare-fun res!199986 () Bool)

(assert (=> d!80856 (=> (not res!199986) (not e!165796))))

(declare-fun lt!374099 () (_ BitVec 64))

(declare-fun lt!374101 () (_ BitVec 64))

(declare-fun lt!374102 () (_ BitVec 64))

(assert (=> d!80856 (= res!199986 (= lt!374099 (bvsub lt!374102 lt!374101)))))

(assert (=> d!80856 (or (= (bvand lt!374102 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!374101 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!374102 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!374102 lt!374101) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!80856 (= lt!374101 (remainingBits!0 ((_ sign_extend 32) (size!5684 (buf!6138 thiss!1854))) ((_ sign_extend 32) (currentByte!11432 thiss!1854)) ((_ sign_extend 32) (currentBit!11427 thiss!1854))))))

(declare-fun lt!374098 () (_ BitVec 64))

(declare-fun lt!374103 () (_ BitVec 64))

(assert (=> d!80856 (= lt!374102 (bvmul lt!374098 lt!374103))))

(assert (=> d!80856 (or (= lt!374098 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!374103 (bvsdiv (bvmul lt!374098 lt!374103) lt!374098)))))

(assert (=> d!80856 (= lt!374103 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!80856 (= lt!374098 ((_ sign_extend 32) (size!5684 (buf!6138 thiss!1854))))))

(assert (=> d!80856 (= lt!374099 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11432 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11427 thiss!1854))))))

(assert (=> d!80856 (invariant!0 (currentBit!11427 thiss!1854) (currentByte!11432 thiss!1854) (size!5684 (buf!6138 thiss!1854)))))

(assert (=> d!80856 (= (bitIndex!0 (size!5684 (buf!6138 thiss!1854)) (currentByte!11432 thiss!1854) (currentBit!11427 thiss!1854)) lt!374099)))

(declare-fun b!239450 () Bool)

(declare-fun res!199987 () Bool)

(assert (=> b!239450 (=> (not res!199987) (not e!165796))))

(assert (=> b!239450 (= res!199987 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!374099))))

(declare-fun b!239451 () Bool)

(declare-fun lt!374100 () (_ BitVec 64))

(assert (=> b!239451 (= e!165796 (bvsle lt!374099 (bvmul lt!374100 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!239451 (or (= lt!374100 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!374100 #b0000000000000000000000000000000000000000000000000000000000001000) lt!374100)))))

(assert (=> b!239451 (= lt!374100 ((_ sign_extend 32) (size!5684 (buf!6138 thiss!1854))))))

(assert (= (and d!80856 res!199986) b!239450))

(assert (= (and b!239450 res!199987) b!239451))

(assert (=> d!80856 m!361655))

(assert (=> d!80856 m!361657))

(assert (=> b!239428 d!80856))

(declare-fun d!80864 () Bool)

(assert (=> d!80864 (= (array_inv!5425 (buf!6138 thiss!1854)) (bvsge (size!5684 (buf!6138 thiss!1854)) #b00000000000000000000000000000000))))

(assert (=> b!239429 d!80864))

(check-sat (not d!80851) (not d!80856) (not d!80848))
