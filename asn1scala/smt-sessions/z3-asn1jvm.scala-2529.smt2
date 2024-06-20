; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63894 () Bool)

(assert start!63894)

(declare-fun res!235426 () Bool)

(declare-fun e!203167 () Bool)

(assert (=> start!63894 (=> (not res!235426) (not e!203167))))

(declare-datatypes ((array!16658 0))(
  ( (array!16659 (arr!8180 (Array (_ BitVec 32) (_ BitVec 8))) (size!7184 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12738 0))(
  ( (BitStream!12739 (buf!7430 array!16658) (currentByte!13805 (_ BitVec 32)) (currentBit!13800 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12738)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63894 (= res!235426 (validate_offset_bits!1 ((_ sign_extend 32) (size!7184 (buf!7430 thiss!1929))) ((_ sign_extend 32) (currentByte!13805 thiss!1929)) ((_ sign_extend 32) (currentBit!13800 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13800 thiss!1929)) #b00000000000000000000000000000111))))))

(assert (=> start!63894 e!203167))

(declare-fun e!203169 () Bool)

(declare-fun inv!12 (BitStream!12738) Bool)

(assert (=> start!63894 (and (inv!12 thiss!1929) e!203169)))

(declare-fun b!284194 () Bool)

(declare-fun res!235427 () Bool)

(assert (=> b!284194 (=> (not res!235427) (not e!203167))))

(assert (=> b!284194 (= res!235427 (= (currentBit!13800 thiss!1929) #b00000000000000000000000000000000))))

(declare-fun b!284195 () Bool)

(declare-fun lt!418382 () (_ BitVec 64))

(declare-fun lt!418383 () (_ BitVec 64))

(assert (=> b!284195 (= e!203167 (and (= lt!418382 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= lt!418382 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 lt!418383) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!284195 (= lt!418382 (bvand lt!418383 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!284195 (= lt!418383 (bitIndex!0 (size!7184 (buf!7430 thiss!1929)) (currentByte!13805 thiss!1929) (currentBit!13800 thiss!1929)))))

(declare-fun b!284196 () Bool)

(declare-fun array_inv!6877 (array!16658) Bool)

(assert (=> b!284196 (= e!203169 (array_inv!6877 (buf!7430 thiss!1929)))))

(assert (= (and start!63894 res!235426) b!284194))

(assert (= (and b!284194 res!235427) b!284195))

(assert (= start!63894 b!284196))

(declare-fun m!417371 () Bool)

(assert (=> start!63894 m!417371))

(declare-fun m!417373 () Bool)

(assert (=> start!63894 m!417373))

(declare-fun m!417375 () Bool)

(assert (=> b!284195 m!417375))

(declare-fun m!417377 () Bool)

(assert (=> b!284196 m!417377))

(check-sat (not start!63894) (not b!284196) (not b!284195))
(check-sat)
(get-model)

(declare-fun d!97866 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!97866 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7184 (buf!7430 thiss!1929))) ((_ sign_extend 32) (currentByte!13805 thiss!1929)) ((_ sign_extend 32) (currentBit!13800 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13800 thiss!1929)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7184 (buf!7430 thiss!1929))) ((_ sign_extend 32) (currentByte!13805 thiss!1929)) ((_ sign_extend 32) (currentBit!13800 thiss!1929))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13800 thiss!1929)) #b00000000000000000000000000000111))))))

(declare-fun bs!24736 () Bool)

(assert (= bs!24736 d!97866))

(declare-fun m!417389 () Bool)

(assert (=> bs!24736 m!417389))

(assert (=> start!63894 d!97866))

(declare-fun d!97870 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!97870 (= (inv!12 thiss!1929) (invariant!0 (currentBit!13800 thiss!1929) (currentByte!13805 thiss!1929) (size!7184 (buf!7430 thiss!1929))))))

(declare-fun bs!24738 () Bool)

(assert (= bs!24738 d!97870))

(declare-fun m!417393 () Bool)

(assert (=> bs!24738 m!417393))

(assert (=> start!63894 d!97870))

(declare-fun d!97874 () Bool)

(assert (=> d!97874 (= (array_inv!6877 (buf!7430 thiss!1929)) (bvsge (size!7184 (buf!7430 thiss!1929)) #b00000000000000000000000000000000))))

(assert (=> b!284196 d!97874))

(declare-fun d!97876 () Bool)

(declare-fun e!203187 () Bool)

(assert (=> d!97876 e!203187))

(declare-fun res!235450 () Bool)

(assert (=> d!97876 (=> (not res!235450) (not e!203187))))

(declare-fun lt!418441 () (_ BitVec 64))

(declare-fun lt!418443 () (_ BitVec 64))

(declare-fun lt!418442 () (_ BitVec 64))

(assert (=> d!97876 (= res!235450 (= lt!418442 (bvsub lt!418441 lt!418443)))))

(assert (=> d!97876 (or (= (bvand lt!418441 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!418443 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!418441 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!418441 lt!418443) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!97876 (= lt!418443 (remainingBits!0 ((_ sign_extend 32) (size!7184 (buf!7430 thiss!1929))) ((_ sign_extend 32) (currentByte!13805 thiss!1929)) ((_ sign_extend 32) (currentBit!13800 thiss!1929))))))

(declare-fun lt!418440 () (_ BitVec 64))

(declare-fun lt!418438 () (_ BitVec 64))

(assert (=> d!97876 (= lt!418441 (bvmul lt!418440 lt!418438))))

(assert (=> d!97876 (or (= lt!418440 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!418438 (bvsdiv (bvmul lt!418440 lt!418438) lt!418440)))))

(assert (=> d!97876 (= lt!418438 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!97876 (= lt!418440 ((_ sign_extend 32) (size!7184 (buf!7430 thiss!1929))))))

(assert (=> d!97876 (= lt!418442 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13805 thiss!1929)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13800 thiss!1929))))))

(assert (=> d!97876 (invariant!0 (currentBit!13800 thiss!1929) (currentByte!13805 thiss!1929) (size!7184 (buf!7430 thiss!1929)))))

(assert (=> d!97876 (= (bitIndex!0 (size!7184 (buf!7430 thiss!1929)) (currentByte!13805 thiss!1929) (currentBit!13800 thiss!1929)) lt!418442)))

(declare-fun b!284222 () Bool)

(declare-fun res!235451 () Bool)

(assert (=> b!284222 (=> (not res!235451) (not e!203187))))

(assert (=> b!284222 (= res!235451 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!418442))))

(declare-fun b!284223 () Bool)

(declare-fun lt!418439 () (_ BitVec 64))

(assert (=> b!284223 (= e!203187 (bvsle lt!418442 (bvmul lt!418439 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!284223 (or (= lt!418439 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!418439 #b0000000000000000000000000000000000000000000000000000000000001000) lt!418439)))))

(assert (=> b!284223 (= lt!418439 ((_ sign_extend 32) (size!7184 (buf!7430 thiss!1929))))))

(assert (= (and d!97876 res!235450) b!284222))

(assert (= (and b!284222 res!235451) b!284223))

(assert (=> d!97876 m!417389))

(assert (=> d!97876 m!417393))

(assert (=> b!284195 d!97876))

(check-sat (not d!97870) (not d!97876) (not d!97866))
