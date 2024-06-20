; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63568 () Bool)

(assert start!63568)

(declare-fun res!235231 () Bool)

(declare-fun e!202886 () Bool)

(assert (=> start!63568 (=> (not res!235231) (not e!202886))))

(declare-datatypes ((array!16568 0))(
  ( (array!16569 (arr!8150 (Array (_ BitVec 32) (_ BitVec 8))) (size!7154 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12678 0))(
  ( (BitStream!12679 (buf!7400 array!16568) (currentByte!13705 (_ BitVec 32)) (currentBit!13700 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12678)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63568 (= res!235231 (validate_offset_bits!1 ((_ sign_extend 32) (size!7154 (buf!7400 thiss!1929))) ((_ sign_extend 32) (currentByte!13705 thiss!1929)) ((_ sign_extend 32) (currentBit!13700 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13700 thiss!1929)) #b00000000000000000000000000000111))))))

(assert (=> start!63568 e!202886))

(declare-fun e!202885 () Bool)

(declare-fun inv!12 (BitStream!12678) Bool)

(assert (=> start!63568 (and (inv!12 thiss!1929) e!202885)))

(declare-fun b!283909 () Bool)

(declare-fun res!235232 () Bool)

(assert (=> b!283909 (=> (not res!235232) (not e!202886))))

(assert (=> b!283909 (= res!235232 (not (= (currentBit!13700 thiss!1929) #b00000000000000000000000000000000)))))

(declare-fun b!283910 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!283910 (= e!202886 (not (invariant!0 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!13705 thiss!1929)) (size!7154 (buf!7400 thiss!1929)))))))

(declare-fun b!283911 () Bool)

(declare-fun array_inv!6847 (array!16568) Bool)

(assert (=> b!283911 (= e!202885 (array_inv!6847 (buf!7400 thiss!1929)))))

(assert (= (and start!63568 res!235231) b!283909))

(assert (= (and b!283909 res!235232) b!283910))

(assert (= start!63568 b!283911))

(declare-fun m!417023 () Bool)

(assert (=> start!63568 m!417023))

(declare-fun m!417025 () Bool)

(assert (=> start!63568 m!417025))

(declare-fun m!417027 () Bool)

(assert (=> b!283910 m!417027))

(declare-fun m!417029 () Bool)

(assert (=> b!283911 m!417029))

(check-sat (not b!283911) (not b!283910) (not start!63568))
(check-sat)
(get-model)

(declare-fun d!97542 () Bool)

(assert (=> d!97542 (= (array_inv!6847 (buf!7400 thiss!1929)) (bvsge (size!7154 (buf!7400 thiss!1929)) #b00000000000000000000000000000000))))

(assert (=> b!283911 d!97542))

(declare-fun d!97546 () Bool)

(assert (=> d!97546 (= (invariant!0 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!13705 thiss!1929)) (size!7154 (buf!7400 thiss!1929))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 #b00000000000000000000000000001000) (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!13705 thiss!1929)) #b00000000000000000000000000000000) (or (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!13705 thiss!1929)) (size!7154 (buf!7400 thiss!1929))) (and (= #b00000000000000000000000000000000 #b00000000000000000000000000000000) (= (bvadd #b00000000000000000000000000000001 (currentByte!13705 thiss!1929)) (size!7154 (buf!7400 thiss!1929)))))))))

(assert (=> b!283910 d!97546))

(declare-fun d!97554 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!97554 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7154 (buf!7400 thiss!1929))) ((_ sign_extend 32) (currentByte!13705 thiss!1929)) ((_ sign_extend 32) (currentBit!13700 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13700 thiss!1929)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7154 (buf!7400 thiss!1929))) ((_ sign_extend 32) (currentByte!13705 thiss!1929)) ((_ sign_extend 32) (currentBit!13700 thiss!1929))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13700 thiss!1929)) #b00000000000000000000000000000111))))))

(declare-fun bs!24643 () Bool)

(assert (= bs!24643 d!97554))

(declare-fun m!417045 () Bool)

(assert (=> bs!24643 m!417045))

(assert (=> start!63568 d!97554))

(declare-fun d!97560 () Bool)

(assert (=> d!97560 (= (inv!12 thiss!1929) (invariant!0 (currentBit!13700 thiss!1929) (currentByte!13705 thiss!1929) (size!7154 (buf!7400 thiss!1929))))))

(declare-fun bs!24645 () Bool)

(assert (= bs!24645 d!97560))

(declare-fun m!417049 () Bool)

(assert (=> bs!24645 m!417049))

(assert (=> start!63568 d!97560))

(check-sat (not d!97554) (not d!97560))
(check-sat)
(get-model)

(declare-fun d!97562 () Bool)

(assert (=> d!97562 (= (remainingBits!0 ((_ sign_extend 32) (size!7154 (buf!7400 thiss!1929))) ((_ sign_extend 32) (currentByte!13705 thiss!1929)) ((_ sign_extend 32) (currentBit!13700 thiss!1929))) (bvsub (bvmul ((_ sign_extend 32) (size!7154 (buf!7400 thiss!1929))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13705 thiss!1929)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13700 thiss!1929)))))))

(assert (=> d!97554 d!97562))

(declare-fun d!97564 () Bool)

(assert (=> d!97564 (= (invariant!0 (currentBit!13700 thiss!1929) (currentByte!13705 thiss!1929) (size!7154 (buf!7400 thiss!1929))) (and (bvsge (currentBit!13700 thiss!1929) #b00000000000000000000000000000000) (bvslt (currentBit!13700 thiss!1929) #b00000000000000000000000000001000) (bvsge (currentByte!13705 thiss!1929) #b00000000000000000000000000000000) (or (bvslt (currentByte!13705 thiss!1929) (size!7154 (buf!7400 thiss!1929))) (and (= (currentBit!13700 thiss!1929) #b00000000000000000000000000000000) (= (currentByte!13705 thiss!1929) (size!7154 (buf!7400 thiss!1929)))))))))

(assert (=> d!97560 d!97564))

(check-sat)
