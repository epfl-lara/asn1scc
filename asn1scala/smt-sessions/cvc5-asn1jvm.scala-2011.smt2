; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51442 () Bool)

(assert start!51442)

(declare-fun res!199875 () Bool)

(declare-fun e!165498 () Bool)

(assert (=> start!51442 (=> (not res!199875) (not e!165498))))

(declare-datatypes ((array!12882 0))(
  ( (array!12883 (arr!6640 (Array (_ BitVec 32) (_ BitVec 8))) (size!5653 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10228 0))(
  ( (BitStream!10229 (buf!6107 array!12882) (currentByte!11338 (_ BitVec 32)) (currentBit!11333 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10228)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51442 (= res!199875 (validate_offset_bits!1 ((_ sign_extend 32) (size!5653 (buf!6107 thiss!1854))) ((_ sign_extend 32) (currentByte!11338 thiss!1854)) ((_ sign_extend 32) (currentBit!11333 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51442 e!165498))

(declare-fun e!165499 () Bool)

(declare-fun inv!12 (BitStream!10228) Bool)

(assert (=> start!51442 (and (inv!12 thiss!1854) e!165499)))

(declare-fun b!239242 () Bool)

(assert (=> b!239242 (= e!165498 (and (bvslt (currentBit!11333 thiss!1854) #b00000000000000000000000010000000) (bvslt (currentBit!11333 thiss!1854) #b11111111111111111111111110000000)))))

(declare-fun b!239243 () Bool)

(declare-fun array_inv!5394 (array!12882) Bool)

(assert (=> b!239243 (= e!165499 (array_inv!5394 (buf!6107 thiss!1854)))))

(assert (= (and start!51442 res!199875) b!239242))

(assert (= start!51442 b!239243))

(declare-fun m!361351 () Bool)

(assert (=> start!51442 m!361351))

(declare-fun m!361353 () Bool)

(assert (=> start!51442 m!361353))

(declare-fun m!361355 () Bool)

(assert (=> b!239243 m!361355))

(push 1)

(assert (not start!51442))

(assert (not b!239243))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80602 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80602 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5653 (buf!6107 thiss!1854))) ((_ sign_extend 32) (currentByte!11338 thiss!1854)) ((_ sign_extend 32) (currentBit!11333 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5653 (buf!6107 thiss!1854))) ((_ sign_extend 32) (currentByte!11338 thiss!1854)) ((_ sign_extend 32) (currentBit!11333 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!20267 () Bool)

(assert (= bs!20267 d!80602))

(declare-fun m!361371 () Bool)

(assert (=> bs!20267 m!361371))

(assert (=> start!51442 d!80602))

(declare-fun d!80606 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80606 (= (inv!12 thiss!1854) (invariant!0 (currentBit!11333 thiss!1854) (currentByte!11338 thiss!1854) (size!5653 (buf!6107 thiss!1854))))))

(declare-fun bs!20269 () Bool)

(assert (= bs!20269 d!80606))

(declare-fun m!361375 () Bool)

(assert (=> bs!20269 m!361375))

(assert (=> start!51442 d!80606))

(declare-fun d!80610 () Bool)

(assert (=> d!80610 (= (array_inv!5394 (buf!6107 thiss!1854)) (bvsge (size!5653 (buf!6107 thiss!1854)) #b00000000000000000000000000000000))))

(assert (=> b!239243 d!80610))

(push 1)

(assert (not d!80606))

(assert (not d!80602))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80622 () Bool)

(assert (=> d!80622 (= (invariant!0 (currentBit!11333 thiss!1854) (currentByte!11338 thiss!1854) (size!5653 (buf!6107 thiss!1854))) (and (bvsge (currentBit!11333 thiss!1854) #b00000000000000000000000000000000) (bvslt (currentBit!11333 thiss!1854) #b00000000000000000000000000001000) (bvsge (currentByte!11338 thiss!1854) #b00000000000000000000000000000000) (or (bvslt (currentByte!11338 thiss!1854) (size!5653 (buf!6107 thiss!1854))) (and (= (currentBit!11333 thiss!1854) #b00000000000000000000000000000000) (= (currentByte!11338 thiss!1854) (size!5653 (buf!6107 thiss!1854)))))))))

(assert (=> d!80606 d!80622))

(declare-fun d!80624 () Bool)

(assert (=> d!80624 (= (remainingBits!0 ((_ sign_extend 32) (size!5653 (buf!6107 thiss!1854))) ((_ sign_extend 32) (currentByte!11338 thiss!1854)) ((_ sign_extend 32) (currentBit!11333 thiss!1854))) (bvsub (bvmul ((_ sign_extend 32) (size!5653 (buf!6107 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11338 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11333 thiss!1854)))))))

(assert (=> d!80602 d!80624))

(push 1)

(check-sat)

