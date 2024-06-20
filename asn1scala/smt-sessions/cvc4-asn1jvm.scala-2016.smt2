; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51566 () Bool)

(assert start!51566)

(declare-fun res!199926 () Bool)

(declare-fun e!165651 () Bool)

(assert (=> start!51566 (=> (not res!199926) (not e!165651))))

(declare-datatypes ((array!12925 0))(
  ( (array!12926 (arr!6657 (Array (_ BitVec 32) (_ BitVec 8))) (size!5670 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10262 0))(
  ( (BitStream!10263 (buf!6124 array!12925) (currentByte!11382 (_ BitVec 32)) (currentBit!11377 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10262)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51566 (= res!199926 (validate_offset_bits!1 ((_ sign_extend 32) (size!5670 (buf!6124 thiss!1854))) ((_ sign_extend 32) (currentByte!11382 thiss!1854)) ((_ sign_extend 32) (currentBit!11377 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51566 e!165651))

(declare-fun e!165652 () Bool)

(declare-fun inv!12 (BitStream!10262) Bool)

(assert (=> start!51566 (and (inv!12 thiss!1854) e!165652)))

(declare-fun b!239344 () Bool)

(assert (=> b!239344 (= e!165651 (and (bvsle ((_ sign_extend 24) ((_ extract 7 0) (currentBit!11377 thiss!1854))) #b00000000000000000000000000100000) (or (bvslt (currentByte!11382 thiss!1854) #b00000000000000000000000000000000) (bvsge (currentByte!11382 thiss!1854) (size!5670 (buf!6124 thiss!1854))))))))

(declare-fun b!239345 () Bool)

(declare-fun array_inv!5411 (array!12925) Bool)

(assert (=> b!239345 (= e!165652 (array_inv!5411 (buf!6124 thiss!1854)))))

(assert (= (and start!51566 res!199926) b!239344))

(assert (= start!51566 b!239345))

(declare-fun m!361489 () Bool)

(assert (=> start!51566 m!361489))

(declare-fun m!361491 () Bool)

(assert (=> start!51566 m!361491))

(declare-fun m!361493 () Bool)

(assert (=> b!239345 m!361493))

(push 1)

(assert (not start!51566))

(assert (not b!239345))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80710 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80710 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5670 (buf!6124 thiss!1854))) ((_ sign_extend 32) (currentByte!11382 thiss!1854)) ((_ sign_extend 32) (currentBit!11377 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5670 (buf!6124 thiss!1854))) ((_ sign_extend 32) (currentByte!11382 thiss!1854)) ((_ sign_extend 32) (currentBit!11377 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!20302 () Bool)

(assert (= bs!20302 d!80710))

(declare-fun m!361501 () Bool)

(assert (=> bs!20302 m!361501))

(assert (=> start!51566 d!80710))

(declare-fun d!80712 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80712 (= (inv!12 thiss!1854) (invariant!0 (currentBit!11377 thiss!1854) (currentByte!11382 thiss!1854) (size!5670 (buf!6124 thiss!1854))))))

(declare-fun bs!20304 () Bool)

(assert (= bs!20304 d!80712))

(declare-fun m!361505 () Bool)

(assert (=> bs!20304 m!361505))

(assert (=> start!51566 d!80712))

(declare-fun d!80716 () Bool)

(assert (=> d!80716 (= (array_inv!5411 (buf!6124 thiss!1854)) (bvsge (size!5670 (buf!6124 thiss!1854)) #b00000000000000000000000000000000))))

(assert (=> b!239345 d!80716))

(push 1)

(assert (not d!80712))

(assert (not d!80710))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80726 () Bool)

(assert (=> d!80726 (= (invariant!0 (currentBit!11377 thiss!1854) (currentByte!11382 thiss!1854) (size!5670 (buf!6124 thiss!1854))) (and (bvsge (currentBit!11377 thiss!1854) #b00000000000000000000000000000000) (bvslt (currentBit!11377 thiss!1854) #b00000000000000000000000000001000) (bvsge (currentByte!11382 thiss!1854) #b00000000000000000000000000000000) (or (bvslt (currentByte!11382 thiss!1854) (size!5670 (buf!6124 thiss!1854))) (and (= (currentBit!11377 thiss!1854) #b00000000000000000000000000000000) (= (currentByte!11382 thiss!1854) (size!5670 (buf!6124 thiss!1854)))))))))

(assert (=> d!80712 d!80726))

(declare-fun d!80728 () Bool)

(assert (=> d!80728 (= (remainingBits!0 ((_ sign_extend 32) (size!5670 (buf!6124 thiss!1854))) ((_ sign_extend 32) (currentByte!11382 thiss!1854)) ((_ sign_extend 32) (currentBit!11377 thiss!1854))) (bvsub (bvmul ((_ sign_extend 32) (size!5670 (buf!6124 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11382 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11377 thiss!1854)))))))

(assert (=> d!80710 d!80728))

(push 1)

(check-sat)

(pop 1)

