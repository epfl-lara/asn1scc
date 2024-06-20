; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51638 () Bool)

(assert start!51638)

(declare-fun res!199944 () Bool)

(declare-fun e!165705 () Bool)

(assert (=> start!51638 (=> (not res!199944) (not e!165705))))

(declare-datatypes ((array!12943 0))(
  ( (array!12944 (arr!6663 (Array (_ BitVec 32) (_ BitVec 8))) (size!5676 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10274 0))(
  ( (BitStream!10275 (buf!6130 array!12943) (currentByte!11406 (_ BitVec 32)) (currentBit!11401 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10274)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51638 (= res!199944 (validate_offset_bits!1 ((_ sign_extend 32) (size!5676 (buf!6130 thiss!1854))) ((_ sign_extend 32) (currentByte!11406 thiss!1854)) ((_ sign_extend 32) (currentBit!11401 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51638 e!165705))

(declare-fun e!165706 () Bool)

(declare-fun inv!12 (BitStream!10274) Bool)

(assert (=> start!51638 (and (inv!12 thiss!1854) e!165706)))

(declare-fun b!239380 () Bool)

(assert (=> b!239380 (= e!165705 (and (= (bvand (currentByte!11406 thiss!1854) #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand (currentByte!11406 thiss!1854) #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 (currentByte!11406 thiss!1854)) #b10000000000000000000000000000000)))))))

(declare-fun b!239381 () Bool)

(declare-fun array_inv!5417 (array!12943) Bool)

(assert (=> b!239381 (= e!165706 (array_inv!5417 (buf!6130 thiss!1854)))))

(assert (= (and start!51638 res!199944) b!239380))

(assert (= start!51638 b!239381))

(declare-fun m!361561 () Bool)

(assert (=> start!51638 m!361561))

(declare-fun m!361563 () Bool)

(assert (=> start!51638 m!361563))

(declare-fun m!361565 () Bool)

(assert (=> b!239381 m!361565))

(push 1)

(assert (not start!51638))

(assert (not b!239381))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80778 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80778 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5676 (buf!6130 thiss!1854))) ((_ sign_extend 32) (currentByte!11406 thiss!1854)) ((_ sign_extend 32) (currentBit!11401 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5676 (buf!6130 thiss!1854))) ((_ sign_extend 32) (currentByte!11406 thiss!1854)) ((_ sign_extend 32) (currentBit!11401 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!20320 () Bool)

(assert (= bs!20320 d!80778))

(declare-fun m!361567 () Bool)

(assert (=> bs!20320 m!361567))

(assert (=> start!51638 d!80778))

(declare-fun d!80782 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80782 (= (inv!12 thiss!1854) (invariant!0 (currentBit!11401 thiss!1854) (currentByte!11406 thiss!1854) (size!5676 (buf!6130 thiss!1854))))))

(declare-fun bs!20322 () Bool)

(assert (= bs!20322 d!80782))

(declare-fun m!361571 () Bool)

(assert (=> bs!20322 m!361571))

(assert (=> start!51638 d!80782))

(declare-fun d!80786 () Bool)

(assert (=> d!80786 (= (array_inv!5417 (buf!6130 thiss!1854)) (bvsge (size!5676 (buf!6130 thiss!1854)) #b00000000000000000000000000000000))))

(assert (=> b!239381 d!80786))

(push 1)

(assert (not d!80778))

(assert (not d!80782))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80798 () Bool)

(assert (=> d!80798 (= (remainingBits!0 ((_ sign_extend 32) (size!5676 (buf!6130 thiss!1854))) ((_ sign_extend 32) (currentByte!11406 thiss!1854)) ((_ sign_extend 32) (currentBit!11401 thiss!1854))) (bvsub (bvmul ((_ sign_extend 32) (size!5676 (buf!6130 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11406 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11401 thiss!1854)))))))

(assert (=> d!80778 d!80798))

(declare-fun d!80802 () Bool)

(assert (=> d!80802 (= (invariant!0 (currentBit!11401 thiss!1854) (currentByte!11406 thiss!1854) (size!5676 (buf!6130 thiss!1854))) (and (bvsge (currentBit!11401 thiss!1854) #b00000000000000000000000000000000) (bvslt (currentBit!11401 thiss!1854) #b00000000000000000000000000001000) (bvsge (currentByte!11406 thiss!1854) #b00000000000000000000000000000000) (or (bvslt (currentByte!11406 thiss!1854) (size!5676 (buf!6130 thiss!1854))) (and (= (currentBit!11401 thiss!1854) #b00000000000000000000000000000000) (= (currentByte!11406 thiss!1854) (size!5676 (buf!6130 thiss!1854)))))))))

(assert (=> d!80782 d!80802))

(push 1)

(check-sat)

(pop 1)

