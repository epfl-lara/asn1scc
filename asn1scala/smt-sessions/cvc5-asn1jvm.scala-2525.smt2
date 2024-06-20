; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63756 () Bool)

(assert start!63756)

(declare-fun res!235316 () Bool)

(declare-fun e!203029 () Bool)

(assert (=> start!63756 (=> (not res!235316) (not e!203029))))

(declare-datatypes ((array!16620 0))(
  ( (array!16621 (arr!8167 (Array (_ BitVec 32) (_ BitVec 8))) (size!7171 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12712 0))(
  ( (BitStream!12713 (buf!7417 array!16620) (currentByte!13760 (_ BitVec 32)) (currentBit!13755 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12712)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63756 (= res!235316 (validate_offset_bits!1 ((_ sign_extend 32) (size!7171 (buf!7417 thiss!1929))) ((_ sign_extend 32) (currentByte!13760 thiss!1929)) ((_ sign_extend 32) (currentBit!13755 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13755 thiss!1929)) #b00000000000000000000000000000111))))))

(assert (=> start!63756 e!203029))

(declare-fun e!203030 () Bool)

(declare-fun inv!12 (BitStream!12712) Bool)

(assert (=> start!63756 (and (inv!12 thiss!1929) e!203030)))

(declare-fun b!284044 () Bool)

(declare-fun res!235315 () Bool)

(assert (=> b!284044 (=> (not res!235315) (not e!203029))))

(assert (=> b!284044 (= res!235315 (not (= (currentBit!13755 thiss!1929) #b00000000000000000000000000000000)))))

(declare-fun b!284045 () Bool)

(assert (=> b!284045 (= e!203029 (not (inv!12 (BitStream!12713 (buf!7417 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13760 thiss!1929)) #b00000000000000000000000000000000))))))

(declare-fun b!284046 () Bool)

(declare-fun array_inv!6864 (array!16620) Bool)

(assert (=> b!284046 (= e!203030 (array_inv!6864 (buf!7417 thiss!1929)))))

(assert (= (and start!63756 res!235316) b!284044))

(assert (= (and b!284044 res!235315) b!284045))

(assert (= start!63756 b!284046))

(declare-fun m!417201 () Bool)

(assert (=> start!63756 m!417201))

(declare-fun m!417203 () Bool)

(assert (=> start!63756 m!417203))

(declare-fun m!417205 () Bool)

(assert (=> b!284045 m!417205))

(declare-fun m!417207 () Bool)

(assert (=> b!284046 m!417207))

(push 1)

(assert (not b!284046))

(assert (not b!284045))

(assert (not start!63756))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97718 () Bool)

(assert (=> d!97718 (= (array_inv!6864 (buf!7417 thiss!1929)) (bvsge (size!7171 (buf!7417 thiss!1929)) #b00000000000000000000000000000000))))

(assert (=> b!284046 d!97718))

(declare-fun d!97722 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!97722 (= (inv!12 (BitStream!12713 (buf!7417 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13760 thiss!1929)) #b00000000000000000000000000000000)) (invariant!0 (currentBit!13755 (BitStream!12713 (buf!7417 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13760 thiss!1929)) #b00000000000000000000000000000000)) (currentByte!13760 (BitStream!12713 (buf!7417 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13760 thiss!1929)) #b00000000000000000000000000000000)) (size!7171 (buf!7417 (BitStream!12713 (buf!7417 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13760 thiss!1929)) #b00000000000000000000000000000000)))))))

(declare-fun bs!24697 () Bool)

(assert (= bs!24697 d!97722))

(declare-fun m!417227 () Bool)

(assert (=> bs!24697 m!417227))

(assert (=> b!284045 d!97722))

(declare-fun d!97728 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!97728 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7171 (buf!7417 thiss!1929))) ((_ sign_extend 32) (currentByte!13760 thiss!1929)) ((_ sign_extend 32) (currentBit!13755 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13755 thiss!1929)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7171 (buf!7417 thiss!1929))) ((_ sign_extend 32) (currentByte!13760 thiss!1929)) ((_ sign_extend 32) (currentBit!13755 thiss!1929))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13755 thiss!1929)) #b00000000000000000000000000000111))))))

(declare-fun bs!24701 () Bool)

(assert (= bs!24701 d!97728))

(declare-fun m!417235 () Bool)

(assert (=> bs!24701 m!417235))

(assert (=> start!63756 d!97728))

(declare-fun d!97736 () Bool)

(assert (=> d!97736 (= (inv!12 thiss!1929) (invariant!0 (currentBit!13755 thiss!1929) (currentByte!13760 thiss!1929) (size!7171 (buf!7417 thiss!1929))))))

(declare-fun bs!24702 () Bool)

(assert (= bs!24702 d!97736))

(declare-fun m!417237 () Bool)

(assert (=> bs!24702 m!417237))

(assert (=> start!63756 d!97736))

(push 1)

(assert (not d!97728))

(assert (not d!97736))

(assert (not d!97722))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97746 () Bool)

(assert (=> d!97746 (= (remainingBits!0 ((_ sign_extend 32) (size!7171 (buf!7417 thiss!1929))) ((_ sign_extend 32) (currentByte!13760 thiss!1929)) ((_ sign_extend 32) (currentBit!13755 thiss!1929))) (bvsub (bvmul ((_ sign_extend 32) (size!7171 (buf!7417 thiss!1929))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13760 thiss!1929)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13755 thiss!1929)))))))

(assert (=> d!97728 d!97746))

(declare-fun d!97750 () Bool)

(assert (=> d!97750 (= (invariant!0 (currentBit!13755 thiss!1929) (currentByte!13760 thiss!1929) (size!7171 (buf!7417 thiss!1929))) (and (bvsge (currentBit!13755 thiss!1929) #b00000000000000000000000000000000) (bvslt (currentBit!13755 thiss!1929) #b00000000000000000000000000001000) (bvsge (currentByte!13760 thiss!1929) #b00000000000000000000000000000000) (or (bvslt (currentByte!13760 thiss!1929) (size!7171 (buf!7417 thiss!1929))) (and (= (currentBit!13755 thiss!1929) #b00000000000000000000000000000000) (= (currentByte!13760 thiss!1929) (size!7171 (buf!7417 thiss!1929)))))))))

(assert (=> d!97736 d!97750))

(declare-fun d!97752 () Bool)

(assert (=> d!97752 (= (invariant!0 (currentBit!13755 (BitStream!12713 (buf!7417 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13760 thiss!1929)) #b00000000000000000000000000000000)) (currentByte!13760 (BitStream!12713 (buf!7417 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13760 thiss!1929)) #b00000000000000000000000000000000)) (size!7171 (buf!7417 (BitStream!12713 (buf!7417 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13760 thiss!1929)) #b00000000000000000000000000000000)))) (and (bvsge (currentBit!13755 (BitStream!12713 (buf!7417 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13760 thiss!1929)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (bvslt (currentBit!13755 (BitStream!12713 (buf!7417 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13760 thiss!1929)) #b00000000000000000000000000000000)) #b00000000000000000000000000001000) (bvsge (currentByte!13760 (BitStream!12713 (buf!7417 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13760 thiss!1929)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (or (bvslt (currentByte!13760 (BitStream!12713 (buf!7417 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13760 thiss!1929)) #b00000000000000000000000000000000)) (size!7171 (buf!7417 (BitStream!12713 (buf!7417 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13760 thiss!1929)) #b00000000000000000000000000000000)))) (and (= (currentBit!13755 (BitStream!12713 (buf!7417 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13760 thiss!1929)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (= (currentByte!13760 (BitStream!12713 (buf!7417 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13760 thiss!1929)) #b00000000000000000000000000000000)) (size!7171 (buf!7417 (BitStream!12713 (buf!7417 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13760 thiss!1929)) #b00000000000000000000000000000000))))))))))

(assert (=> d!97722 d!97752))

(push 1)

(check-sat)

