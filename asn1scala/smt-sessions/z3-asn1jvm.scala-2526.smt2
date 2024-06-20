; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63794 () Bool)

(assert start!63794)

(declare-fun res!235334 () Bool)

(declare-fun e!203065 () Bool)

(assert (=> start!63794 (=> (not res!235334) (not e!203065))))

(declare-datatypes ((array!16631 0))(
  ( (array!16632 (arr!8171 (Array (_ BitVec 32) (_ BitVec 8))) (size!7175 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12720 0))(
  ( (BitStream!12721 (buf!7421 array!16631) (currentByte!13773 (_ BitVec 32)) (currentBit!13768 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12720)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63794 (= res!235334 (validate_offset_bits!1 ((_ sign_extend 32) (size!7175 (buf!7421 thiss!1929))) ((_ sign_extend 32) (currentByte!13773 thiss!1929)) ((_ sign_extend 32) (currentBit!13768 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13768 thiss!1929)) #b00000000000000000000000000000111))))))

(assert (=> start!63794 e!203065))

(declare-fun e!203066 () Bool)

(declare-fun inv!12 (BitStream!12720) Bool)

(assert (=> start!63794 (and (inv!12 thiss!1929) e!203066)))

(declare-fun b!284075 () Bool)

(assert (=> b!284075 (= e!203065 (and (not (= (currentBit!13768 thiss!1929) #b00000000000000000000000000000000)) (= (bvand (currentByte!13773 thiss!1929) #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand (currentByte!13773 thiss!1929) #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 (currentByte!13773 thiss!1929)) #b10000000000000000000000000000000)))))))

(declare-fun b!284076 () Bool)

(declare-fun array_inv!6868 (array!16631) Bool)

(assert (=> b!284076 (= e!203066 (array_inv!6868 (buf!7421 thiss!1929)))))

(assert (= (and start!63794 res!235334) b!284075))

(assert (= start!63794 b!284076))

(declare-fun m!417249 () Bool)

(assert (=> start!63794 m!417249))

(declare-fun m!417251 () Bool)

(assert (=> start!63794 m!417251))

(declare-fun m!417253 () Bool)

(assert (=> b!284076 m!417253))

(check-sat (not b!284076) (not start!63794))
(check-sat)
(get-model)

(declare-fun d!97762 () Bool)

(assert (=> d!97762 (= (array_inv!6868 (buf!7421 thiss!1929)) (bvsge (size!7175 (buf!7421 thiss!1929)) #b00000000000000000000000000000000))))

(assert (=> b!284076 d!97762))

(declare-fun d!97764 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!97764 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7175 (buf!7421 thiss!1929))) ((_ sign_extend 32) (currentByte!13773 thiss!1929)) ((_ sign_extend 32) (currentBit!13768 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13768 thiss!1929)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7175 (buf!7421 thiss!1929))) ((_ sign_extend 32) (currentByte!13773 thiss!1929)) ((_ sign_extend 32) (currentBit!13768 thiss!1929))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13768 thiss!1929)) #b00000000000000000000000000000111))))))

(declare-fun bs!24708 () Bool)

(assert (= bs!24708 d!97764))

(declare-fun m!417261 () Bool)

(assert (=> bs!24708 m!417261))

(assert (=> start!63794 d!97764))

(declare-fun d!97768 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!97768 (= (inv!12 thiss!1929) (invariant!0 (currentBit!13768 thiss!1929) (currentByte!13773 thiss!1929) (size!7175 (buf!7421 thiss!1929))))))

(declare-fun bs!24711 () Bool)

(assert (= bs!24711 d!97768))

(declare-fun m!417267 () Bool)

(assert (=> bs!24711 m!417267))

(assert (=> start!63794 d!97768))

(check-sat (not d!97764) (not d!97768))
(check-sat)
(get-model)

(declare-fun d!97780 () Bool)

(assert (=> d!97780 (= (remainingBits!0 ((_ sign_extend 32) (size!7175 (buf!7421 thiss!1929))) ((_ sign_extend 32) (currentByte!13773 thiss!1929)) ((_ sign_extend 32) (currentBit!13768 thiss!1929))) (bvsub (bvmul ((_ sign_extend 32) (size!7175 (buf!7421 thiss!1929))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13773 thiss!1929)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13768 thiss!1929)))))))

(assert (=> d!97764 d!97780))

(declare-fun d!97782 () Bool)

(assert (=> d!97782 (= (invariant!0 (currentBit!13768 thiss!1929) (currentByte!13773 thiss!1929) (size!7175 (buf!7421 thiss!1929))) (and (bvsge (currentBit!13768 thiss!1929) #b00000000000000000000000000000000) (bvslt (currentBit!13768 thiss!1929) #b00000000000000000000000000001000) (bvsge (currentByte!13773 thiss!1929) #b00000000000000000000000000000000) (or (bvslt (currentByte!13773 thiss!1929) (size!7175 (buf!7421 thiss!1929))) (and (= (currentBit!13768 thiss!1929) #b00000000000000000000000000000000) (= (currentByte!13773 thiss!1929) (size!7175 (buf!7421 thiss!1929)))))))))

(assert (=> d!97768 d!97782))

(check-sat)
