; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51636 () Bool)

(assert start!51636)

(declare-fun res!199941 () Bool)

(declare-fun e!165696 () Bool)

(assert (=> start!51636 (=> (not res!199941) (not e!165696))))

(declare-datatypes ((array!12941 0))(
  ( (array!12942 (arr!6662 (Array (_ BitVec 32) (_ BitVec 8))) (size!5675 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10272 0))(
  ( (BitStream!10273 (buf!6129 array!12941) (currentByte!11405 (_ BitVec 32)) (currentBit!11400 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10272)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51636 (= res!199941 (validate_offset_bits!1 ((_ sign_extend 32) (size!5675 (buf!6129 thiss!1854))) ((_ sign_extend 32) (currentByte!11405 thiss!1854)) ((_ sign_extend 32) (currentBit!11400 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51636 e!165696))

(declare-fun e!165697 () Bool)

(declare-fun inv!12 (BitStream!10272) Bool)

(assert (=> start!51636 (and (inv!12 thiss!1854) e!165697)))

(declare-fun b!239374 () Bool)

(assert (=> b!239374 (= e!165696 (and (= (bvand (currentByte!11405 thiss!1854) #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand (currentByte!11405 thiss!1854) #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 (currentByte!11405 thiss!1854)) #b10000000000000000000000000000000)))))))

(declare-fun b!239375 () Bool)

(declare-fun array_inv!5416 (array!12941) Bool)

(assert (=> b!239375 (= e!165697 (array_inv!5416 (buf!6129 thiss!1854)))))

(assert (= (and start!51636 res!199941) b!239374))

(assert (= start!51636 b!239375))

(declare-fun m!361555 () Bool)

(assert (=> start!51636 m!361555))

(declare-fun m!361557 () Bool)

(assert (=> start!51636 m!361557))

(declare-fun m!361559 () Bool)

(assert (=> b!239375 m!361559))

(check-sat (not b!239375) (not start!51636))
(check-sat)
(get-model)

(declare-fun d!80788 () Bool)

(assert (=> d!80788 (= (array_inv!5416 (buf!6129 thiss!1854)) (bvsge (size!5675 (buf!6129 thiss!1854)) #b00000000000000000000000000000000))))

(assert (=> b!239375 d!80788))

(declare-fun d!80790 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80790 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5675 (buf!6129 thiss!1854))) ((_ sign_extend 32) (currentByte!11405 thiss!1854)) ((_ sign_extend 32) (currentBit!11400 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5675 (buf!6129 thiss!1854))) ((_ sign_extend 32) (currentByte!11405 thiss!1854)) ((_ sign_extend 32) (currentBit!11400 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!20324 () Bool)

(assert (= bs!20324 d!80790))

(declare-fun m!361575 () Bool)

(assert (=> bs!20324 m!361575))

(assert (=> start!51636 d!80790))

(declare-fun d!80792 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80792 (= (inv!12 thiss!1854) (invariant!0 (currentBit!11400 thiss!1854) (currentByte!11405 thiss!1854) (size!5675 (buf!6129 thiss!1854))))))

(declare-fun bs!20325 () Bool)

(assert (= bs!20325 d!80792))

(declare-fun m!361577 () Bool)

(assert (=> bs!20325 m!361577))

(assert (=> start!51636 d!80792))

(check-sat (not d!80790) (not d!80792))
(check-sat)
(get-model)

(declare-fun d!80800 () Bool)

(assert (=> d!80800 (= (remainingBits!0 ((_ sign_extend 32) (size!5675 (buf!6129 thiss!1854))) ((_ sign_extend 32) (currentByte!11405 thiss!1854)) ((_ sign_extend 32) (currentBit!11400 thiss!1854))) (bvsub (bvmul ((_ sign_extend 32) (size!5675 (buf!6129 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11405 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11400 thiss!1854)))))))

(assert (=> d!80790 d!80800))

(declare-fun d!80804 () Bool)

(assert (=> d!80804 (= (invariant!0 (currentBit!11400 thiss!1854) (currentByte!11405 thiss!1854) (size!5675 (buf!6129 thiss!1854))) (and (bvsge (currentBit!11400 thiss!1854) #b00000000000000000000000000000000) (bvslt (currentBit!11400 thiss!1854) #b00000000000000000000000000001000) (bvsge (currentByte!11405 thiss!1854) #b00000000000000000000000000000000) (or (bvslt (currentByte!11405 thiss!1854) (size!5675 (buf!6129 thiss!1854))) (and (= (currentBit!11400 thiss!1854) #b00000000000000000000000000000000) (= (currentByte!11405 thiss!1854) (size!5675 (buf!6129 thiss!1854)))))))))

(assert (=> d!80792 d!80804))

(check-sat)
