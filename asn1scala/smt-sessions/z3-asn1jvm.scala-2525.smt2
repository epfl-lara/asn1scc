; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63758 () Bool)

(assert start!63758)

(declare-fun res!235321 () Bool)

(declare-fun e!203039 () Bool)

(assert (=> start!63758 (=> (not res!235321) (not e!203039))))

(declare-datatypes ((array!16622 0))(
  ( (array!16623 (arr!8168 (Array (_ BitVec 32) (_ BitVec 8))) (size!7172 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12714 0))(
  ( (BitStream!12715 (buf!7418 array!16622) (currentByte!13761 (_ BitVec 32)) (currentBit!13756 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12714)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63758 (= res!235321 (validate_offset_bits!1 ((_ sign_extend 32) (size!7172 (buf!7418 thiss!1929))) ((_ sign_extend 32) (currentByte!13761 thiss!1929)) ((_ sign_extend 32) (currentBit!13756 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13756 thiss!1929)) #b00000000000000000000000000000111))))))

(assert (=> start!63758 e!203039))

(declare-fun e!203038 () Bool)

(declare-fun inv!12 (BitStream!12714) Bool)

(assert (=> start!63758 (and (inv!12 thiss!1929) e!203038)))

(declare-fun b!284053 () Bool)

(declare-fun res!235322 () Bool)

(assert (=> b!284053 (=> (not res!235322) (not e!203039))))

(assert (=> b!284053 (= res!235322 (not (= (currentBit!13756 thiss!1929) #b00000000000000000000000000000000)))))

(declare-fun b!284054 () Bool)

(assert (=> b!284054 (= e!203039 (not (inv!12 (BitStream!12715 (buf!7418 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13761 thiss!1929)) #b00000000000000000000000000000000))))))

(declare-fun b!284055 () Bool)

(declare-fun array_inv!6865 (array!16622) Bool)

(assert (=> b!284055 (= e!203038 (array_inv!6865 (buf!7418 thiss!1929)))))

(assert (= (and start!63758 res!235321) b!284053))

(assert (= (and b!284053 res!235322) b!284054))

(assert (= start!63758 b!284055))

(declare-fun m!417209 () Bool)

(assert (=> start!63758 m!417209))

(declare-fun m!417211 () Bool)

(assert (=> start!63758 m!417211))

(declare-fun m!417213 () Bool)

(assert (=> b!284054 m!417213))

(declare-fun m!417215 () Bool)

(assert (=> b!284055 m!417215))

(check-sat (not b!284054) (not start!63758) (not b!284055))
(check-sat)
(get-model)

(declare-fun d!97720 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!97720 (= (inv!12 (BitStream!12715 (buf!7418 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13761 thiss!1929)) #b00000000000000000000000000000000)) (invariant!0 (currentBit!13756 (BitStream!12715 (buf!7418 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13761 thiss!1929)) #b00000000000000000000000000000000)) (currentByte!13761 (BitStream!12715 (buf!7418 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13761 thiss!1929)) #b00000000000000000000000000000000)) (size!7172 (buf!7418 (BitStream!12715 (buf!7418 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13761 thiss!1929)) #b00000000000000000000000000000000)))))))

(declare-fun bs!24696 () Bool)

(assert (= bs!24696 d!97720))

(declare-fun m!417225 () Bool)

(assert (=> bs!24696 m!417225))

(assert (=> b!284054 d!97720))

(declare-fun d!97726 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!97726 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7172 (buf!7418 thiss!1929))) ((_ sign_extend 32) (currentByte!13761 thiss!1929)) ((_ sign_extend 32) (currentBit!13756 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13756 thiss!1929)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7172 (buf!7418 thiss!1929))) ((_ sign_extend 32) (currentByte!13761 thiss!1929)) ((_ sign_extend 32) (currentBit!13756 thiss!1929))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13756 thiss!1929)) #b00000000000000000000000000000111))))))

(declare-fun bs!24698 () Bool)

(assert (= bs!24698 d!97726))

(declare-fun m!417229 () Bool)

(assert (=> bs!24698 m!417229))

(assert (=> start!63758 d!97726))

(declare-fun d!97730 () Bool)

(assert (=> d!97730 (= (inv!12 thiss!1929) (invariant!0 (currentBit!13756 thiss!1929) (currentByte!13761 thiss!1929) (size!7172 (buf!7418 thiss!1929))))))

(declare-fun bs!24700 () Bool)

(assert (= bs!24700 d!97730))

(declare-fun m!417233 () Bool)

(assert (=> bs!24700 m!417233))

(assert (=> start!63758 d!97730))

(declare-fun d!97734 () Bool)

(assert (=> d!97734 (= (array_inv!6865 (buf!7418 thiss!1929)) (bvsge (size!7172 (buf!7418 thiss!1929)) #b00000000000000000000000000000000))))

(assert (=> b!284055 d!97734))

(check-sat (not d!97726) (not d!97730) (not d!97720))
(check-sat)
(get-model)

(declare-fun d!97742 () Bool)

(assert (=> d!97742 (= (remainingBits!0 ((_ sign_extend 32) (size!7172 (buf!7418 thiss!1929))) ((_ sign_extend 32) (currentByte!13761 thiss!1929)) ((_ sign_extend 32) (currentBit!13756 thiss!1929))) (bvsub (bvmul ((_ sign_extend 32) (size!7172 (buf!7418 thiss!1929))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13761 thiss!1929)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13756 thiss!1929)))))))

(assert (=> d!97726 d!97742))

(declare-fun d!97744 () Bool)

(assert (=> d!97744 (= (invariant!0 (currentBit!13756 thiss!1929) (currentByte!13761 thiss!1929) (size!7172 (buf!7418 thiss!1929))) (and (bvsge (currentBit!13756 thiss!1929) #b00000000000000000000000000000000) (bvslt (currentBit!13756 thiss!1929) #b00000000000000000000000000001000) (bvsge (currentByte!13761 thiss!1929) #b00000000000000000000000000000000) (or (bvslt (currentByte!13761 thiss!1929) (size!7172 (buf!7418 thiss!1929))) (and (= (currentBit!13756 thiss!1929) #b00000000000000000000000000000000) (= (currentByte!13761 thiss!1929) (size!7172 (buf!7418 thiss!1929)))))))))

(assert (=> d!97730 d!97744))

(declare-fun d!97748 () Bool)

(assert (=> d!97748 (= (invariant!0 (currentBit!13756 (BitStream!12715 (buf!7418 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13761 thiss!1929)) #b00000000000000000000000000000000)) (currentByte!13761 (BitStream!12715 (buf!7418 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13761 thiss!1929)) #b00000000000000000000000000000000)) (size!7172 (buf!7418 (BitStream!12715 (buf!7418 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13761 thiss!1929)) #b00000000000000000000000000000000)))) (and (bvsge (currentBit!13756 (BitStream!12715 (buf!7418 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13761 thiss!1929)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (bvslt (currentBit!13756 (BitStream!12715 (buf!7418 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13761 thiss!1929)) #b00000000000000000000000000000000)) #b00000000000000000000000000001000) (bvsge (currentByte!13761 (BitStream!12715 (buf!7418 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13761 thiss!1929)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (or (bvslt (currentByte!13761 (BitStream!12715 (buf!7418 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13761 thiss!1929)) #b00000000000000000000000000000000)) (size!7172 (buf!7418 (BitStream!12715 (buf!7418 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13761 thiss!1929)) #b00000000000000000000000000000000)))) (and (= (currentBit!13756 (BitStream!12715 (buf!7418 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13761 thiss!1929)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (= (currentByte!13761 (BitStream!12715 (buf!7418 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13761 thiss!1929)) #b00000000000000000000000000000000)) (size!7172 (buf!7418 (BitStream!12715 (buf!7418 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13761 thiss!1929)) #b00000000000000000000000000000000))))))))))

(assert (=> d!97720 d!97748))

(check-sat)
