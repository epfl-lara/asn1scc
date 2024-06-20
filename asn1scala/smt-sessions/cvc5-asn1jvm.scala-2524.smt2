; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63720 () Bool)

(assert start!63720)

(declare-fun res!235298 () Bool)

(declare-fun e!203003 () Bool)

(assert (=> start!63720 (=> (not res!235298) (not e!203003))))

(declare-datatypes ((array!16611 0))(
  ( (array!16612 (arr!8164 (Array (_ BitVec 32) (_ BitVec 8))) (size!7168 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12706 0))(
  ( (BitStream!12707 (buf!7414 array!16611) (currentByte!13748 (_ BitVec 32)) (currentBit!13743 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12706)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63720 (= res!235298 (validate_offset_bits!1 ((_ sign_extend 32) (size!7168 (buf!7414 thiss!1929))) ((_ sign_extend 32) (currentByte!13748 thiss!1929)) ((_ sign_extend 32) (currentBit!13743 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13743 thiss!1929)) #b00000000000000000000000000000111))))))

(assert (=> start!63720 e!203003))

(declare-fun e!203004 () Bool)

(declare-fun inv!12 (BitStream!12706) Bool)

(assert (=> start!63720 (and (inv!12 thiss!1929) e!203004)))

(declare-fun b!284017 () Bool)

(declare-fun res!235297 () Bool)

(assert (=> b!284017 (=> (not res!235297) (not e!203003))))

(assert (=> b!284017 (= res!235297 (not (= (currentBit!13743 thiss!1929) #b00000000000000000000000000000000)))))

(declare-fun b!284018 () Bool)

(assert (=> b!284018 (= e!203003 (not (inv!12 (BitStream!12707 (buf!7414 thiss!1929) (currentByte!13748 thiss!1929) #b00000000000000000000000000000000))))))

(declare-fun b!284019 () Bool)

(declare-fun array_inv!6861 (array!16611) Bool)

(assert (=> b!284019 (= e!203004 (array_inv!6861 (buf!7414 thiss!1929)))))

(assert (= (and start!63720 res!235298) b!284017))

(assert (= (and b!284017 res!235297) b!284018))

(assert (= start!63720 b!284019))

(declare-fun m!417159 () Bool)

(assert (=> start!63720 m!417159))

(declare-fun m!417161 () Bool)

(assert (=> start!63720 m!417161))

(declare-fun m!417163 () Bool)

(assert (=> b!284018 m!417163))

(declare-fun m!417165 () Bool)

(assert (=> b!284019 m!417165))

(push 1)

(assert (not b!284019))

(assert (not b!284018))

(assert (not start!63720))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97676 () Bool)

(assert (=> d!97676 (= (array_inv!6861 (buf!7414 thiss!1929)) (bvsge (size!7168 (buf!7414 thiss!1929)) #b00000000000000000000000000000000))))

(assert (=> b!284019 d!97676))

(declare-fun d!97678 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!97678 (= (inv!12 (BitStream!12707 (buf!7414 thiss!1929) (currentByte!13748 thiss!1929) #b00000000000000000000000000000000)) (invariant!0 (currentBit!13743 (BitStream!12707 (buf!7414 thiss!1929) (currentByte!13748 thiss!1929) #b00000000000000000000000000000000)) (currentByte!13748 (BitStream!12707 (buf!7414 thiss!1929) (currentByte!13748 thiss!1929) #b00000000000000000000000000000000)) (size!7168 (buf!7414 (BitStream!12707 (buf!7414 thiss!1929) (currentByte!13748 thiss!1929) #b00000000000000000000000000000000)))))))

(declare-fun bs!24685 () Bool)

(assert (= bs!24685 d!97678))

(declare-fun m!417185 () Bool)

(assert (=> bs!24685 m!417185))

(assert (=> b!284018 d!97678))

(declare-fun d!97682 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!97682 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7168 (buf!7414 thiss!1929))) ((_ sign_extend 32) (currentByte!13748 thiss!1929)) ((_ sign_extend 32) (currentBit!13743 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13743 thiss!1929)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7168 (buf!7414 thiss!1929))) ((_ sign_extend 32) (currentByte!13748 thiss!1929)) ((_ sign_extend 32) (currentBit!13743 thiss!1929))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13743 thiss!1929)) #b00000000000000000000000000000111))))))

(declare-fun bs!24687 () Bool)

(assert (= bs!24687 d!97682))

(declare-fun m!417189 () Bool)

(assert (=> bs!24687 m!417189))

(assert (=> start!63720 d!97682))

(declare-fun d!97688 () Bool)

(assert (=> d!97688 (= (inv!12 thiss!1929) (invariant!0 (currentBit!13743 thiss!1929) (currentByte!13748 thiss!1929) (size!7168 (buf!7414 thiss!1929))))))

(declare-fun bs!24689 () Bool)

(assert (= bs!24689 d!97688))

(declare-fun m!417193 () Bool)

(assert (=> bs!24689 m!417193))

(assert (=> start!63720 d!97688))

(push 1)

(assert (not d!97682))

(assert (not d!97678))

(assert (not d!97688))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97698 () Bool)

(assert (=> d!97698 (= (remainingBits!0 ((_ sign_extend 32) (size!7168 (buf!7414 thiss!1929))) ((_ sign_extend 32) (currentByte!13748 thiss!1929)) ((_ sign_extend 32) (currentBit!13743 thiss!1929))) (bvsub (bvmul ((_ sign_extend 32) (size!7168 (buf!7414 thiss!1929))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13748 thiss!1929)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13743 thiss!1929)))))))

(assert (=> d!97682 d!97698))

(declare-fun d!97700 () Bool)

(assert (=> d!97700 (= (invariant!0 (currentBit!13743 (BitStream!12707 (buf!7414 thiss!1929) (currentByte!13748 thiss!1929) #b00000000000000000000000000000000)) (currentByte!13748 (BitStream!12707 (buf!7414 thiss!1929) (currentByte!13748 thiss!1929) #b00000000000000000000000000000000)) (size!7168 (buf!7414 (BitStream!12707 (buf!7414 thiss!1929) (currentByte!13748 thiss!1929) #b00000000000000000000000000000000)))) (and (bvsge (currentBit!13743 (BitStream!12707 (buf!7414 thiss!1929) (currentByte!13748 thiss!1929) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (bvslt (currentBit!13743 (BitStream!12707 (buf!7414 thiss!1929) (currentByte!13748 thiss!1929) #b00000000000000000000000000000000)) #b00000000000000000000000000001000) (bvsge (currentByte!13748 (BitStream!12707 (buf!7414 thiss!1929) (currentByte!13748 thiss!1929) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (or (bvslt (currentByte!13748 (BitStream!12707 (buf!7414 thiss!1929) (currentByte!13748 thiss!1929) #b00000000000000000000000000000000)) (size!7168 (buf!7414 (BitStream!12707 (buf!7414 thiss!1929) (currentByte!13748 thiss!1929) #b00000000000000000000000000000000)))) (and (= (currentBit!13743 (BitStream!12707 (buf!7414 thiss!1929) (currentByte!13748 thiss!1929) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (= (currentByte!13748 (BitStream!12707 (buf!7414 thiss!1929) (currentByte!13748 thiss!1929) #b00000000000000000000000000000000)) (size!7168 (buf!7414 (BitStream!12707 (buf!7414 thiss!1929) (currentByte!13748 thiss!1929) #b00000000000000000000000000000000))))))))))

(assert (=> d!97678 d!97700))

(declare-fun d!97704 () Bool)

(assert (=> d!97704 (= (invariant!0 (currentBit!13743 thiss!1929) (currentByte!13748 thiss!1929) (size!7168 (buf!7414 thiss!1929))) (and (bvsge (currentBit!13743 thiss!1929) #b00000000000000000000000000000000) (bvslt (currentBit!13743 thiss!1929) #b00000000000000000000000000001000) (bvsge (currentByte!13748 thiss!1929) #b00000000000000000000000000000000) (or (bvslt (currentByte!13748 thiss!1929) (size!7168 (buf!7414 thiss!1929))) (and (= (currentBit!13743 thiss!1929) #b00000000000000000000000000000000) (= (currentByte!13748 thiss!1929) (size!7168 (buf!7414 thiss!1929)))))))))

(assert (=> d!97688 d!97704))

(push 1)

(check-sat)

(pop 1)

